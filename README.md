# README
1) En carpeta raiz se encuentre el diagrama con todos los cambios aplicados 

6) Implementaion de lista de productos del catálogo:

    - En primer lugar la vista home debe solamente productos unicos(los cuales se encuentran en la tabla Base Products) 
    - En segundo lugar la vista home debe mostrar solamente productos unicos que tengan stock en alguna de sus variaciones.
    -   Las varaiciones se encuentran en la tabla product la cual es hija de BaseProduct
    
    Para poder plasmar esto en la vista debeos crear 2 metodos 
        - El primero se encarga de retornar todos los productos hijos de Base Product
        ej:
            
        def children
            children = self.products
        end

        - El segundo se encarga de retornar el stock total de los productos hijos de Base product
      
        def children_stock
            self.products.sum(:stock) 
        end
    `
    Baseproducts.all.each do |baseproduct|
        if baseproduct.children_stock != 0
            baseproduct.children.first
        end
    end
    
    Con este codigo en la vista nos aseguramos mostrar solo productos que tengan stock y el primero de cada categoria 

    Por ultimo en la vista show debemos mostrar todas las caracteristicas de cada producto con un formulario seleccionable ypara poder agregar el produto seleccionado con las caracteristias especificas debemos agregar el botton add to cart en la misma vista pensando en ingresar nuestro producto unitario al carro de compras.

7) Creo que con las nuevas reglas de negocio no es necesario modificar order_item ya que entrega los atributos que se muestran en el carro solamente. Los productos tienen dentro su modelo los atributos especificos por lo que con las primeras modificaciones no deberiamos tener problema ya que solo se agrego un baseproduct que seria como super categoria de los productos especificos. 

Por otro lado los cupones al ser objetos si estan presentes aplican cambios al total de la orden no a productos especificos del order item. Por lo anterior si estos cupones se aplican sobre el total de la orden no es necesario modificar OrderItem.

8) En primer lugar en la carpeta raiz de rails se encuentra con el nombre de diagrama_ecom un ejemplo de nuestros modelos y sus nuevas relaciones.

- Para poder crear los cupones se crean dos modelos Coupons y User Coupons 
    -Coupons al ser de distribucion masiva tiene mucho usuarios y puede ser aplicado a muchas ordenes tambien
    -User Coupons son unicos por usuario por lo que corresponden a una relacion 1 a 1 osea solo 1 usuario puede tener este tipo de cupon por lo que debe quedar indicado en el modelo

Modelos 

Coupon

class Coupon < ApplicationRecord
    belongs_to :user
    has_many :orders
end

User Coupons
`
class UserCoupon < ApplicationRecord
    belongs_to :user
    has_many :orders
end

User

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :coupons
  has_one :user_coupons
end

Para poder aplicar estos cupones se pueden implementar botones para agregarlos y modificar el monto total en el carro de compra (estos se haria en el controlador del carro de compra ya que ahí podemos relacionar los cupones que tiene el usuario que esta comprando)

Acciones
  
  def add_discount_coupons 
    current_user_coupons = current_user.coupons   
    if current_user_coupons.present?
      current_user_coupons.each do |coupon|
        current_order.update(coupon_id: coupon.id)
        current_order.update(total: (current_order.total.to_f * (coupon.discount.to_f/100) ))
        @order = current_order
        coupon.update(user_id: nil)
      end
    end
  end
  
  def add_discount_user_coupon
    user_coupon = current_user.user_coupon  
    current_order.update(coupon_id: user_coupon.id)
    current_order.update(total: (current_order.total.to_f * (user_coupon.discount.to_f/100) ))
    @order = current_order
    user_coupon.update(user_id: nil)
    
  end
  
  def add_mount_discount_coupons 
    current_user_coupons = current_user.coupons
    if current_user_coupons.present?
      current_user_coupons.each do |coupon|
        if (current_order.total - coupon.mount_discount) > 0
          current_order.update(coupon_id: coupon.id)
          current_order.update(total: (current_order.total.to_f - coupon.mount_discount ))
          @order = current_order
          coupon.update(user_id: nil)
        else
          flash[:notice] = "Can not apply your Coupon, your discount exceeds the total amount of your purchase"
        end
      end
    end
  end
  `
  def add_discount_user_coupon
    user_coupon = current_user.user_coupon  
    current_order.update(coupon_id: user_coupon.id)
    current_order.update(total: (current_order.total.to_f - (user_coupon.mount_discount) ))
    @order = current_order
    user_coupon.update(user_id: nil)
  end
  `

Al aplicar los botones con estas acciones al final de cada una se cambia el user_id de los cupones a nil por lo que al perderse la relacion con el usuario el usuario no puede volver a usarlos y queda en el registro de la orden que cupon su uso, así no perdemos informacion.


    