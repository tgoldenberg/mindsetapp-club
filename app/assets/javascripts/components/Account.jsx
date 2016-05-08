
class Account extends React.Component{
  render(){
    return (
      <div style={styles.container}>
        <div className="account-header">
          <p>PROFILE</p>
          <p>USER NAME</p>
        </div>
        <div className='col-md-9'>
          <p>My Classes</p>
          <div>
            <p>COURSE TITLE</p>
            <p>TERM</p>
            <ul>
              <li>MEETING TIMES</li>
              <li>MONDAY</li>
              <li>TUESDAY</li>
            </ul>
          </div>
          <div>
            <p>COURSE TITLE</p>
            <p>TERM</p>
            <ul>
              <li>MEETING TIMES</li>
              <li>MONDAY</li>
              <li>TUESDAY</li>
            </ul>
          </div>
        </div>
        <div className="col-md-3"></div>
      </div>
    );
  }
};

let styles = {
  header: {
    backgroundColor: Colors.brandPrimary,
    color: 'white',
  },
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    height: '100%',
    width: '100%',
    display: 'flex',
    flexDirection: 'column',
  },
  iconContainer: {
    flex: 1,
    alignItems: 'center',
    display: 'flex',
    flexDirection: 'column',
  },
  row: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center'
  }
}
