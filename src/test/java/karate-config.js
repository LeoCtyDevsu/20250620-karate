function fn() {
    var config = {
        env: 'test',
        port_marvel_characters: 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    };
    
    karate.configure('connectTimeout', 30000);
    karate.configure('readTimeout', 30000);
    karate.configure('ssl', true);
    
    return config;
}