
class Account extends React.Component{
  render(){
    return (
      <form className="new_syllabus" id="new_syllabus" enctype="multipart/form-data" action="/syllabuses" accept-charset="UTF-8" method="post">
        <input name="utf8" type="hidden" value="&#x2713;" />
        <input type="hidden" name="authenticity_token" value={this.props.token} />
        <input className="btn-file" type="file" name="syllabus[up_load]" id="syllabus_up_load" />
        <input type="submit" name="commit" value="Upload Syllabus" className="btn btn-primary btn-lg disabled" />
      </form>
    );
  }
};

let styles = {
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
