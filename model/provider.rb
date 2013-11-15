module Provider
    require_relative 'init'
    VAR_POOL = {
        #每个页面需要用到的变量在此定义，或者读取
        :index => lambda { |params|
            #...
            name = User.find(3).name
            s = 1+1
            vars = {
                :name =>  name,
                :result => s
            }
        },
    }

    #if the layout of page is not set here, then it is set to default as layout.erb as its layout template
    LAYOUT = {
        #:index => :layout,
    }

end