const Ticket = artifacts.require('Ticket');
 
contract('Ticket', () => {
    // let ticket;
    // let token;

    // before the descibe is executed
    // Before(async () => {
    //     ticket = await TixContract.deployed();
    // });

    // describe('Buy Ticket', ()=>{
    it ('should prevent buying ticket - contract not approved', async () => {
        const ticket = await Ticket.new();//deploy smart contract
        await ticket.updateData(10);//wait for transaction to be'mined'
        const data = await ticket.redData();//should get data in return //bnjs number is returned, hence need to convert to string
        assert(data.toString()==='10');//test will pass only if all ther assert blocks pass
    });

    // });

})