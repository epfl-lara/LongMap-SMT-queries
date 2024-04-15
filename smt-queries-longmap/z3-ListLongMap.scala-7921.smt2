; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98360 () Bool)

(assert start!98360)

(declare-fun b_free!23971 () Bool)

(declare-fun b_next!23971 () Bool)

(assert (=> start!98360 (= b_free!23971 (not b_next!23971))))

(declare-fun tp!84624 () Bool)

(declare-fun b_and!38769 () Bool)

(assert (=> start!98360 (= tp!84624 b_and!38769)))

(declare-fun bm!49168 () Bool)

(declare-datatypes ((V!43129 0))(
  ( (V!43130 (val!14307 Int)) )
))
(declare-datatypes ((tuple2!18132 0))(
  ( (tuple2!18133 (_1!9077 (_ BitVec 64)) (_2!9077 V!43129)) )
))
(declare-datatypes ((List!24878 0))(
  ( (Nil!24875) (Cons!24874 (h!26083 tuple2!18132) (t!35832 List!24878)) )
))
(declare-datatypes ((ListLongMap!16101 0))(
  ( (ListLongMap!16102 (toList!8066 List!24878)) )
))
(declare-fun call!49175 () ListLongMap!16101)

(declare-fun call!49177 () ListLongMap!16101)

(assert (=> bm!49168 (= call!49175 call!49177)))

(declare-fun mapIsEmpty!44576 () Bool)

(declare-fun mapRes!44576 () Bool)

(assert (=> mapIsEmpty!44576 mapRes!44576))

(declare-fun call!49171 () Bool)

(declare-fun bm!49169 () Bool)

(declare-fun lt!503715 () ListLongMap!16101)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!110661 () Bool)

(declare-fun contains!6520 (ListLongMap!16101 (_ BitVec 64)) Bool)

(assert (=> bm!49169 (= call!49171 (contains!6520 (ite c!110661 lt!503715 call!49175) k0!934))))

(declare-fun b!1133739 () Bool)

(declare-fun e!645227 () Bool)

(declare-fun tp_is_empty!28501 () Bool)

(assert (=> b!1133739 (= e!645227 tp_is_empty!28501)))

(declare-fun b!1133741 () Bool)

(declare-fun res!756967 () Bool)

(declare-fun e!645232 () Bool)

(assert (=> b!1133741 (=> (not res!756967) (not e!645232))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133741 (= res!756967 (validMask!0 mask!1564))))

(declare-fun b!1133742 () Bool)

(declare-fun res!756970 () Bool)

(assert (=> b!1133742 (=> (not res!756970) (not e!645232))))

(declare-datatypes ((array!73786 0))(
  ( (array!73787 (arr!35544 (Array (_ BitVec 32) (_ BitVec 64))) (size!36082 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73786)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133742 (= res!756970 (= (select (arr!35544 _keys!1208) i!673) k0!934))))

(declare-fun e!645234 () Bool)

(declare-fun call!49172 () ListLongMap!16101)

(declare-fun call!49178 () ListLongMap!16101)

(declare-fun b!1133743 () Bool)

(declare-fun -!1167 (ListLongMap!16101 (_ BitVec 64)) ListLongMap!16101)

(assert (=> b!1133743 (= e!645234 (= call!49178 (-!1167 call!49172 k0!934)))))

(declare-fun e!645229 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1133744 () Bool)

(declare-fun arrayContainsKey!0 (array!73786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133744 (= e!645229 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133745 () Bool)

(declare-fun e!645231 () Bool)

(assert (=> b!1133745 (= e!645231 true)))

(declare-fun e!645239 () Bool)

(assert (=> b!1133745 e!645239))

(declare-fun res!756960 () Bool)

(assert (=> b!1133745 (=> (not res!756960) (not e!645239))))

(assert (=> b!1133745 (= res!756960 e!645229)))

(declare-fun c!110662 () Bool)

(assert (=> b!1133745 (= c!110662 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!43129)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13541 0))(
  ( (ValueCellFull!13541 (v!16943 V!43129)) (EmptyCell!13541) )
))
(declare-datatypes ((array!73788 0))(
  ( (array!73789 (arr!35545 (Array (_ BitVec 32) ValueCell!13541)) (size!36083 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73788)

(declare-fun minValue!944 () V!43129)

(declare-datatypes ((Unit!36993 0))(
  ( (Unit!36994) )
))
(declare-fun lt!503723 () Unit!36993)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!332 (array!73786 array!73788 (_ BitVec 32) (_ BitVec 32) V!43129 V!43129 (_ BitVec 64) (_ BitVec 32) Int) Unit!36993)

(assert (=> b!1133745 (= lt!503723 (lemmaListMapContainsThenArrayContainsFrom!332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503720 () Unit!36993)

(declare-fun e!645236 () Unit!36993)

(assert (=> b!1133745 (= lt!503720 e!645236)))

(declare-fun lt!503719 () Bool)

(assert (=> b!1133745 (= c!110661 (and (not lt!503719) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133745 (= lt!503719 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!49170 () Bool)

(declare-fun call!49176 () Bool)

(assert (=> bm!49170 (= call!49176 call!49171)))

(declare-fun b!1133746 () Bool)

(declare-fun res!756961 () Bool)

(assert (=> b!1133746 (=> (not res!756961) (not e!645232))))

(declare-datatypes ((List!24879 0))(
  ( (Nil!24876) (Cons!24875 (h!26084 (_ BitVec 64)) (t!35833 List!24879)) )
))
(declare-fun arrayNoDuplicates!0 (array!73786 (_ BitVec 32) List!24879) Bool)

(assert (=> b!1133746 (= res!756961 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24876))))

(declare-fun b!1133747 () Bool)

(declare-fun e!645226 () Bool)

(assert (=> b!1133747 (= e!645226 e!645231)))

(declare-fun res!756971 () Bool)

(assert (=> b!1133747 (=> res!756971 e!645231)))

(declare-fun lt!503725 () ListLongMap!16101)

(assert (=> b!1133747 (= res!756971 (not (contains!6520 lt!503725 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4564 (array!73786 array!73788 (_ BitVec 32) (_ BitVec 32) V!43129 V!43129 (_ BitVec 32) Int) ListLongMap!16101)

(assert (=> b!1133747 (= lt!503725 (getCurrentListMapNoExtraKeys!4564 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503714 () array!73786)

(declare-fun bm!49171 () Bool)

(declare-fun lt!503727 () array!73788)

(assert (=> bm!49171 (= call!49178 (getCurrentListMapNoExtraKeys!4564 lt!503714 lt!503727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49172 () Bool)

(assert (=> bm!49172 (= call!49172 (getCurrentListMapNoExtraKeys!4564 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133748 () Bool)

(declare-fun e!645230 () Unit!36993)

(declare-fun lt!503721 () Unit!36993)

(assert (=> b!1133748 (= e!645230 lt!503721)))

(declare-fun call!49173 () Unit!36993)

(assert (=> b!1133748 (= lt!503721 call!49173)))

(assert (=> b!1133748 call!49176))

(declare-fun b!1133749 () Bool)

(declare-fun e!645225 () Bool)

(declare-fun e!645240 () Bool)

(assert (=> b!1133749 (= e!645225 (not e!645240))))

(declare-fun res!756963 () Bool)

(assert (=> b!1133749 (=> res!756963 e!645240)))

(assert (=> b!1133749 (= res!756963 (bvsgt from!1455 i!673))))

(assert (=> b!1133749 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503718 () Unit!36993)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73786 (_ BitVec 64) (_ BitVec 32)) Unit!36993)

(assert (=> b!1133749 (= lt!503718 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44576 () Bool)

(declare-fun tp!84623 () Bool)

(assert (=> mapNonEmpty!44576 (= mapRes!44576 (and tp!84623 e!645227))))

(declare-fun mapValue!44576 () ValueCell!13541)

(declare-fun mapKey!44576 () (_ BitVec 32))

(declare-fun mapRest!44576 () (Array (_ BitVec 32) ValueCell!13541))

(assert (=> mapNonEmpty!44576 (= (arr!35545 _values!996) (store mapRest!44576 mapKey!44576 mapValue!44576))))

(declare-fun b!1133750 () Bool)

(declare-fun c!110660 () Bool)

(assert (=> b!1133750 (= c!110660 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503719))))

(declare-fun e!645235 () Unit!36993)

(assert (=> b!1133750 (= e!645235 e!645230)))

(declare-fun b!1133751 () Bool)

(declare-fun res!756957 () Bool)

(assert (=> b!1133751 (=> (not res!756957) (not e!645225))))

(assert (=> b!1133751 (= res!756957 (arrayNoDuplicates!0 lt!503714 #b00000000000000000000000000000000 Nil!24876))))

(declare-fun b!1133752 () Bool)

(declare-fun e!645237 () Bool)

(assert (=> b!1133752 (= e!645237 tp_is_empty!28501)))

(declare-fun b!1133753 () Bool)

(declare-fun res!756959 () Bool)

(assert (=> b!1133753 (=> (not res!756959) (not e!645232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73786 (_ BitVec 32)) Bool)

(assert (=> b!1133753 (= res!756959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun c!110659 () Bool)

(declare-fun bm!49173 () Bool)

(declare-fun call!49174 () Unit!36993)

(declare-fun addStillContains!718 (ListLongMap!16101 (_ BitVec 64) V!43129 (_ BitVec 64)) Unit!36993)

(assert (=> bm!49173 (= call!49174 (addStillContains!718 (ite c!110661 lt!503715 lt!503725) (ite c!110661 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110659 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110661 minValue!944 (ite c!110659 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1133754 () Bool)

(assert (=> b!1133754 call!49176))

(declare-fun lt!503713 () Unit!36993)

(assert (=> b!1133754 (= lt!503713 call!49173)))

(assert (=> b!1133754 (= e!645235 lt!503713)))

(declare-fun bm!49174 () Bool)

(declare-fun +!3500 (ListLongMap!16101 tuple2!18132) ListLongMap!16101)

(assert (=> bm!49174 (= call!49177 (+!3500 lt!503725 (ite (or c!110661 c!110659) (tuple2!18133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133755 () Bool)

(assert (=> b!1133755 (= e!645236 e!645235)))

(assert (=> b!1133755 (= c!110659 (and (not lt!503719) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1133756 () Bool)

(assert (=> b!1133756 (= e!645229 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503719) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133757 () Bool)

(declare-fun Unit!36995 () Unit!36993)

(assert (=> b!1133757 (= e!645230 Unit!36995)))

(declare-fun b!1133758 () Bool)

(declare-fun res!756965 () Bool)

(assert (=> b!1133758 (=> (not res!756965) (not e!645232))))

(assert (=> b!1133758 (= res!756965 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36082 _keys!1208))))))

(declare-fun b!1133740 () Bool)

(declare-fun res!756958 () Bool)

(assert (=> b!1133740 (=> (not res!756958) (not e!645232))))

(assert (=> b!1133740 (= res!756958 (and (= (size!36083 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36082 _keys!1208) (size!36083 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!756964 () Bool)

(assert (=> start!98360 (=> (not res!756964) (not e!645232))))

(assert (=> start!98360 (= res!756964 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36082 _keys!1208))))))

(assert (=> start!98360 e!645232))

(assert (=> start!98360 tp_is_empty!28501))

(declare-fun array_inv!27334 (array!73786) Bool)

(assert (=> start!98360 (array_inv!27334 _keys!1208)))

(assert (=> start!98360 true))

(assert (=> start!98360 tp!84624))

(declare-fun e!645233 () Bool)

(declare-fun array_inv!27335 (array!73788) Bool)

(assert (=> start!98360 (and (array_inv!27335 _values!996) e!645233)))

(declare-fun b!1133759 () Bool)

(assert (=> b!1133759 (= e!645239 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133760 () Bool)

(declare-fun e!645238 () Bool)

(assert (=> b!1133760 (= e!645238 e!645226)))

(declare-fun res!756968 () Bool)

(assert (=> b!1133760 (=> res!756968 e!645226)))

(assert (=> b!1133760 (= res!756968 (not (= (select (arr!35544 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1133760 e!645234))

(declare-fun c!110663 () Bool)

(assert (=> b!1133760 (= c!110663 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503726 () Unit!36993)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!451 (array!73786 array!73788 (_ BitVec 32) (_ BitVec 32) V!43129 V!43129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36993)

(assert (=> b!1133760 (= lt!503726 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49175 () Bool)

(assert (=> bm!49175 (= call!49173 call!49174)))

(declare-fun b!1133761 () Bool)

(declare-fun res!756966 () Bool)

(assert (=> b!1133761 (=> (not res!756966) (not e!645232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133761 (= res!756966 (validKeyInArray!0 k0!934))))

(declare-fun b!1133762 () Bool)

(assert (=> b!1133762 (= e!645240 e!645238)))

(declare-fun res!756969 () Bool)

(assert (=> b!1133762 (=> res!756969 e!645238)))

(assert (=> b!1133762 (= res!756969 (not (= from!1455 i!673)))))

(declare-fun lt!503724 () ListLongMap!16101)

(assert (=> b!1133762 (= lt!503724 (getCurrentListMapNoExtraKeys!4564 lt!503714 lt!503727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2563 (Int (_ BitVec 64)) V!43129)

(assert (=> b!1133762 (= lt!503727 (array!73789 (store (arr!35545 _values!996) i!673 (ValueCellFull!13541 (dynLambda!2563 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36083 _values!996)))))

(declare-fun lt!503716 () ListLongMap!16101)

(assert (=> b!1133762 (= lt!503716 (getCurrentListMapNoExtraKeys!4564 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1133763 () Bool)

(assert (=> b!1133763 (= e!645233 (and e!645237 mapRes!44576))))

(declare-fun condMapEmpty!44576 () Bool)

(declare-fun mapDefault!44576 () ValueCell!13541)

(assert (=> b!1133763 (= condMapEmpty!44576 (= (arr!35545 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13541)) mapDefault!44576)))))

(declare-fun b!1133764 () Bool)

(assert (=> b!1133764 (= e!645232 e!645225)))

(declare-fun res!756962 () Bool)

(assert (=> b!1133764 (=> (not res!756962) (not e!645225))))

(assert (=> b!1133764 (= res!756962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503714 mask!1564))))

(assert (=> b!1133764 (= lt!503714 (array!73787 (store (arr!35544 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36082 _keys!1208)))))

(declare-fun b!1133765 () Bool)

(declare-fun lt!503722 () Unit!36993)

(assert (=> b!1133765 (= e!645236 lt!503722)))

(declare-fun lt!503717 () Unit!36993)

(assert (=> b!1133765 (= lt!503717 (addStillContains!718 lt!503725 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1133765 (= lt!503715 call!49177)))

(assert (=> b!1133765 call!49171))

(assert (=> b!1133765 (= lt!503722 call!49174)))

(assert (=> b!1133765 (contains!6520 (+!3500 lt!503715 (tuple2!18133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1133766 () Bool)

(assert (=> b!1133766 (= e!645234 (= call!49178 call!49172))))

(assert (= (and start!98360 res!756964) b!1133741))

(assert (= (and b!1133741 res!756967) b!1133740))

(assert (= (and b!1133740 res!756958) b!1133753))

(assert (= (and b!1133753 res!756959) b!1133746))

(assert (= (and b!1133746 res!756961) b!1133758))

(assert (= (and b!1133758 res!756965) b!1133761))

(assert (= (and b!1133761 res!756966) b!1133742))

(assert (= (and b!1133742 res!756970) b!1133764))

(assert (= (and b!1133764 res!756962) b!1133751))

(assert (= (and b!1133751 res!756957) b!1133749))

(assert (= (and b!1133749 (not res!756963)) b!1133762))

(assert (= (and b!1133762 (not res!756969)) b!1133760))

(assert (= (and b!1133760 c!110663) b!1133743))

(assert (= (and b!1133760 (not c!110663)) b!1133766))

(assert (= (or b!1133743 b!1133766) bm!49171))

(assert (= (or b!1133743 b!1133766) bm!49172))

(assert (= (and b!1133760 (not res!756968)) b!1133747))

(assert (= (and b!1133747 (not res!756971)) b!1133745))

(assert (= (and b!1133745 c!110661) b!1133765))

(assert (= (and b!1133745 (not c!110661)) b!1133755))

(assert (= (and b!1133755 c!110659) b!1133754))

(assert (= (and b!1133755 (not c!110659)) b!1133750))

(assert (= (and b!1133750 c!110660) b!1133748))

(assert (= (and b!1133750 (not c!110660)) b!1133757))

(assert (= (or b!1133754 b!1133748) bm!49175))

(assert (= (or b!1133754 b!1133748) bm!49168))

(assert (= (or b!1133754 b!1133748) bm!49170))

(assert (= (or b!1133765 bm!49170) bm!49169))

(assert (= (or b!1133765 bm!49175) bm!49173))

(assert (= (or b!1133765 bm!49168) bm!49174))

(assert (= (and b!1133745 c!110662) b!1133744))

(assert (= (and b!1133745 (not c!110662)) b!1133756))

(assert (= (and b!1133745 res!756960) b!1133759))

(assert (= (and b!1133763 condMapEmpty!44576) mapIsEmpty!44576))

(assert (= (and b!1133763 (not condMapEmpty!44576)) mapNonEmpty!44576))

(get-info :version)

(assert (= (and mapNonEmpty!44576 ((_ is ValueCellFull!13541) mapValue!44576)) b!1133739))

(assert (= (and b!1133763 ((_ is ValueCellFull!13541) mapDefault!44576)) b!1133752))

(assert (= start!98360 b!1133763))

(declare-fun b_lambda!19059 () Bool)

(assert (=> (not b_lambda!19059) (not b!1133762)))

(declare-fun t!35831 () Bool)

(declare-fun tb!8775 () Bool)

(assert (=> (and start!98360 (= defaultEntry!1004 defaultEntry!1004) t!35831) tb!8775))

(declare-fun result!18123 () Bool)

(assert (=> tb!8775 (= result!18123 tp_is_empty!28501)))

(assert (=> b!1133762 t!35831))

(declare-fun b_and!38771 () Bool)

(assert (= b_and!38769 (and (=> t!35831 result!18123) b_and!38771)))

(declare-fun m!1046221 () Bool)

(assert (=> b!1133746 m!1046221))

(declare-fun m!1046223 () Bool)

(assert (=> b!1133751 m!1046223))

(declare-fun m!1046225 () Bool)

(assert (=> b!1133742 m!1046225))

(declare-fun m!1046227 () Bool)

(assert (=> start!98360 m!1046227))

(declare-fun m!1046229 () Bool)

(assert (=> start!98360 m!1046229))

(declare-fun m!1046231 () Bool)

(assert (=> b!1133745 m!1046231))

(declare-fun m!1046233 () Bool)

(assert (=> b!1133744 m!1046233))

(declare-fun m!1046235 () Bool)

(assert (=> b!1133749 m!1046235))

(declare-fun m!1046237 () Bool)

(assert (=> b!1133749 m!1046237))

(declare-fun m!1046239 () Bool)

(assert (=> b!1133765 m!1046239))

(declare-fun m!1046241 () Bool)

(assert (=> b!1133765 m!1046241))

(assert (=> b!1133765 m!1046241))

(declare-fun m!1046243 () Bool)

(assert (=> b!1133765 m!1046243))

(declare-fun m!1046245 () Bool)

(assert (=> bm!49174 m!1046245))

(declare-fun m!1046247 () Bool)

(assert (=> bm!49171 m!1046247))

(declare-fun m!1046249 () Bool)

(assert (=> b!1133762 m!1046249))

(declare-fun m!1046251 () Bool)

(assert (=> b!1133762 m!1046251))

(declare-fun m!1046253 () Bool)

(assert (=> b!1133762 m!1046253))

(declare-fun m!1046255 () Bool)

(assert (=> b!1133762 m!1046255))

(assert (=> b!1133759 m!1046233))

(declare-fun m!1046257 () Bool)

(assert (=> b!1133743 m!1046257))

(declare-fun m!1046259 () Bool)

(assert (=> b!1133747 m!1046259))

(declare-fun m!1046261 () Bool)

(assert (=> b!1133747 m!1046261))

(assert (=> bm!49172 m!1046261))

(declare-fun m!1046263 () Bool)

(assert (=> b!1133761 m!1046263))

(declare-fun m!1046265 () Bool)

(assert (=> bm!49173 m!1046265))

(declare-fun m!1046267 () Bool)

(assert (=> b!1133741 m!1046267))

(declare-fun m!1046269 () Bool)

(assert (=> bm!49169 m!1046269))

(declare-fun m!1046271 () Bool)

(assert (=> mapNonEmpty!44576 m!1046271))

(declare-fun m!1046273 () Bool)

(assert (=> b!1133764 m!1046273))

(declare-fun m!1046275 () Bool)

(assert (=> b!1133764 m!1046275))

(declare-fun m!1046277 () Bool)

(assert (=> b!1133753 m!1046277))

(declare-fun m!1046279 () Bool)

(assert (=> b!1133760 m!1046279))

(declare-fun m!1046281 () Bool)

(assert (=> b!1133760 m!1046281))

(check-sat (not b!1133744) (not b!1133749) (not start!98360) (not bm!49169) (not b_lambda!19059) tp_is_empty!28501 (not mapNonEmpty!44576) b_and!38771 (not bm!49172) (not b!1133747) (not b!1133741) (not b!1133746) (not bm!49173) (not b!1133760) (not b!1133765) (not b!1133762) (not b!1133751) (not b_next!23971) (not b!1133753) (not bm!49174) (not b!1133743) (not b!1133764) (not b!1133759) (not b!1133761) (not bm!49171) (not b!1133745))
(check-sat b_and!38771 (not b_next!23971))
