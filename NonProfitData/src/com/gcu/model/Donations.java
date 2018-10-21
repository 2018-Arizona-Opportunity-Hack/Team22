package com.gcu.model;

public class Donations 
{
	private String donorName;
	private String category;
	private int quanitiy;
	private String itemName;
	private String itemSize;
	private double individualCost;
	private double toatlValue;
	private String description;
	private String tableName;
	private int tableID;
	
	//Constructor
	public Donations()
	{
		donorName ="";
		category = "";
		itemName = "";
		itemSize = "";
		description = "";
		quanitiy = 0;
		individualCost = 0.0;
		toatlValue = 0.0;
		tableName = "";
		tableID = 0;
	}
	
	//Other constructor
	public Donations(String donorName, String category, int quanitiy, String itemName, String size,
			double individualCost, double toatlValue, String description, String tableName, int tableID) {
		super();
		this.donorName = donorName;
		this.category = category;
		this.quanitiy = quanitiy;
		this.itemName = itemName;
		this.itemSize = size;
		this.individualCost = individualCost;
		this.toatlValue = toatlValue;
		this.description = description;
		this.tableName = tableName;
		this.tableID = tableID;
	}
	
	//Getters and Setters
	public String getDonorName() {
		return donorName;
	}
	public void setDonorName(String donorName) {
		this.donorName = donorName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getQuanitiy() {
		return quanitiy;
	}
	public void setQuanitiy(int quanitiy) {
		this.quanitiy = quanitiy;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getSize() {
		return itemSize;
	}
	public void setSize(String size) {
		this.itemSize = size;
	}
	public double getIndividualCost() {
		return individualCost;
	}
	public void setIndividualCost(double individualCost) {
		this.individualCost = individualCost;
	}
	public double getToatlValue() {
		return toatlValue;
	}
	public void setToatlValue(double toatlValue) {
		this.toatlValue = toatlValue;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getItemSize() {
		return itemSize;
	}

	public void setItemSize(String itemSize) {
		this.itemSize = itemSize;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public int getTableID() {
		return tableID;
	}

	public void setTableID(int tableID) {
		this.tableID = tableID;
	}
	
}
