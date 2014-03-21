Pod::Spec.new do |s|

    s.name              = 'webapi2'
    s.version           = '0.0.1'
    s.summary           = 'webapi2 for ios'
    s.homepage          = 'https://github.com/rodolfotorres/webapi2'
    s.license           = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author            = {
        'rodolfotorres' => 'rodolfo.lage.torres@gmail.com'
    }
    s.source            = {
        :git => 'https://github.com/rodolfotorres/webapi2.git',
        :tag => s.version.to_s
    }
    s.source_files      = 'webapi2/*.{m,h}', 'webapi2Tests/*.{m,h}'
    s.requires_arc      = true

end