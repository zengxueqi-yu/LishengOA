package com.lisheng.july.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.lisheng.july.base.DataEntity;

/**
 * <p>
 * 物品信息表
 * </p>
 *
 * @author wangl
 * @since 2019-02-23
 */
@TableName("t_goods")
public class TGoods extends DataEntity<TGoods> {

    private static final long serialVersionUID = 1L;

    /**
     * 物品名称
     */
	private String goodsname;
    /**
     * 规格
     */
	private String specifications;
    /**
     * 版本号
     */
	private String goodsversion;
    /**
     * 价格
     */
	private Float price;
    /**
     * 数量
     */
	private Integer count;

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getSpecifications() {
		return specifications;
	}

	public void setSpecifications(String specifications) {
		this.specifications = specifications;
	}
	public String getGoodsversion() {
		return goodsversion;
	}

	public void setGoodsversion(String goodsversion) {
		this.goodsversion = goodsversion;
	}
	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}


	@Override
	public String toString() {
		return "TGoods{" +
			", goodsname=" + goodsname +
			", specifications=" + specifications +
			", goodsversion=" + goodsversion +
			", price=" + price +
			", count=" + count +
			"}";
	}
}
