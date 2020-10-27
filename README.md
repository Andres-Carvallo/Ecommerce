# README

Implementaion de lista de productos del catálogo:

    - En primer lugar la vista home debe solamente productos unicos(los cuales se encuentran en la tabla Base Products). 
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

    Baseproducts.all.each do |baseproduct|
        if baseproduct.children_stock != 0
            baseproduct.children.first
        end
    end
    
    Con este codigo en la vista nos aseguramos mostrar solo productos que tengan stock y el primero de cada categoria 

    Por ultimo en la vista show debemos mostrar todas las caracteristicas de cada producto con un formulario seleccionable ypara poder agregar el produto seleccionado con las caracteristias especificas debemos agregar el botton add to cart en la misma vista pensando en ingresar nuestro producto unitario al carro de compras.
    