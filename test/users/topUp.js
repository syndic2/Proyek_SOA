const server= require('../../server');
const tokenTest= require('../util/tokenTest');

const chai= require('chai');
const chaiHttp= require('chai-http');

chai.should(); //ASSERTION STYLE
chai.use(chaiHttp);

const host= server.development;
const endpoint= '/api/users/topUp';
const method= 'POST';

let token;

before((done) => {
    chai.request(host)
        .post('/api/users/login')
        .send({
            email_users: 'jonsu@mail.com',
            password_users: 'asd' 
        })
        .end((err, res) => {
            token= res.body.token;
        done();
    });
});

tokenTest.withoutToken(endpoint, method);
tokenTest.withOutValidToken(endpoint, method);

it('Not passed (without fields)', (done) => {
    chai.request(host)
        .post(endpoint)
        .set('x-access-token', token)
        .send({
            email_users: undefined,
            jumlah_topup: undefined
        })
        .end((err, res) => {
            res.should.have.status(400);
            res.body.should.be.a('object');
            res.body.should.have.property('status').eql(400);
            res.body.should.have.property('message').eql('Field tidak boleh kosong!');
        done();
        });
});

it('Not passed (without valid e-mail)', (done) => {
    chai.request(host)
        .post(endpoint)
        .set('x-access-token', token)
        .send({
            email_users: 'test@mail.com',
            jumlah_topup: 5000
        })
        .end((err, res) => {
            res.should.have.status(400);
            res.body.should.be.a('object');
            res.body.should.have.property('status').eql(400);
            res.body.should.have.property('message').eql('E-mail tidak cocok!');
        done();
        });
});

it('Passed', (done) => {
    chai.request(host)
        .post(endpoint)
        .set('x-access-token', token)
        .send({
            email_users: 'jonsu@mail.com',
            jumlah_topup: 5000
        })
        .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('object');
            res.body.should.have.property('status').eql(200);
            res.body.should.have.property('message').eql('Top up berhasil!');
            
            chai.request(host)
                .post(endpoint)
                .set('x-access-token', token)
                .send({
                    email_users: 'jonsu@mail.com',
                    jumlah_topup: -5000
                })
                .end(done);
        });
});





