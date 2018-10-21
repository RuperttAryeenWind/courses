let http = require('http');
let url  = require('url');
let StringDecoder = require('string_decoder').StringDecoder;


let server = http.createServer((request, response) => {

    let parsedUrl = url.parse(request.url, true);
    let path = parsedUrl.pathname.replace(/^\/+|\/+$/g, '');

    let method = request.method.toLowerCase();
    let query = parsedUrl.query;
    let headers = request.headers;
    
    let decoder = new StringDecoder('utf-8');
    let buffer = '';
    request.on('data', (data) => buffer += decoder.write(data));
    request.on('end', () => {
        buffer += decoder.end();
        console.log("Request received on path " + method + ":" + path + ":", query, headers, buffer );
        response.end("Success");
    });
});


server.listen(3000, () => {
    console.log("The server has been started on port 3000.");
} );