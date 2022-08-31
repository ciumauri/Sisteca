package model;

public class Author {

	private String id;

	private String nameAuthor;

	public Author(String string) {
		super();
	}

	public Author() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNameAuthor() {
		return nameAuthor;
	}

	public void setNameAuthor(String nameAuthor) {
		this.nameAuthor = nameAuthor;
	}	

	@Override
	public String toString() {
		return "Author [id=" + id + ", name=" + nameAuthor + "]";
	}

}
