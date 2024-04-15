; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98222 () Bool)

(assert start!98222)

(declare-fun b_free!23929 () Bool)

(declare-fun b_next!23929 () Bool)

(assert (=> start!98222 (= b_free!23929 (not b_next!23929))))

(declare-fun tp!84491 () Bool)

(declare-fun b_and!38619 () Bool)

(assert (=> start!98222 (= tp!84491 b_and!38619)))

(declare-fun b!1131229 () Bool)

(declare-fun res!755749 () Bool)

(declare-fun e!643788 () Bool)

(assert (=> b!1131229 (=> (not res!755749) (not e!643788))))

(declare-datatypes ((array!73698 0))(
  ( (array!73699 (arr!35502 (Array (_ BitVec 32) (_ BitVec 64))) (size!36040 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73698)

(declare-datatypes ((List!24841 0))(
  ( (Nil!24838) (Cons!24837 (h!26046 (_ BitVec 64)) (t!35753 List!24841)) )
))
(declare-fun arrayNoDuplicates!0 (array!73698 (_ BitVec 32) List!24841) Bool)

(assert (=> b!1131229 (= res!755749 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24838))))

(declare-fun mapNonEmpty!44506 () Bool)

(declare-fun mapRes!44506 () Bool)

(declare-fun tp!84490 () Bool)

(declare-fun e!643780 () Bool)

(assert (=> mapNonEmpty!44506 (= mapRes!44506 (and tp!84490 e!643780))))

(declare-datatypes ((V!43073 0))(
  ( (V!43074 (val!14286 Int)) )
))
(declare-datatypes ((ValueCell!13520 0))(
  ( (ValueCellFull!13520 (v!16918 V!43073)) (EmptyCell!13520) )
))
(declare-fun mapRest!44506 () (Array (_ BitVec 32) ValueCell!13520))

(declare-datatypes ((array!73700 0))(
  ( (array!73701 (arr!35503 (Array (_ BitVec 32) ValueCell!13520)) (size!36041 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73700)

(declare-fun mapKey!44506 () (_ BitVec 32))

(declare-fun mapValue!44506 () ValueCell!13520)

(assert (=> mapNonEmpty!44506 (= (arr!35503 _values!996) (store mapRest!44506 mapKey!44506 mapValue!44506))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1131230 () Bool)

(declare-fun e!643781 () Bool)

(declare-fun arrayContainsKey!0 (array!73698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131230 (= e!643781 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1131231 () Bool)

(declare-fun e!643784 () Bool)

(assert (=> b!1131231 (= e!643784 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000))))

(assert (=> b!1131231 e!643781))

(declare-fun c!110135 () Bool)

(assert (=> b!1131231 (= c!110135 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun zeroValue!944 () V!43073)

(declare-datatypes ((Unit!36905 0))(
  ( (Unit!36906) )
))
(declare-fun lt!502309 () Unit!36905)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43073)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!316 (array!73698 array!73700 (_ BitVec 32) (_ BitVec 32) V!43073 V!43073 (_ BitVec 64) (_ BitVec 32) Int) Unit!36905)

(assert (=> b!1131231 (= lt!502309 (lemmaListMapContainsThenArrayContainsFrom!316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!502306 () Unit!36905)

(declare-fun e!643777 () Unit!36905)

(assert (=> b!1131231 (= lt!502306 e!643777)))

(declare-fun c!110138 () Bool)

(declare-fun lt!502307 () Bool)

(assert (=> b!1131231 (= c!110138 (and (not lt!502307) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131231 (= lt!502307 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!48595 () Bool)

(declare-datatypes ((tuple2!18092 0))(
  ( (tuple2!18093 (_1!9057 (_ BitVec 64)) (_2!9057 V!43073)) )
))
(declare-datatypes ((List!24842 0))(
  ( (Nil!24839) (Cons!24838 (h!26047 tuple2!18092) (t!35754 List!24842)) )
))
(declare-datatypes ((ListLongMap!16061 0))(
  ( (ListLongMap!16062 (toList!8046 List!24842)) )
))
(declare-fun lt!502316 () ListLongMap!16061)

(declare-fun c!110139 () Bool)

(declare-fun lt!502304 () ListLongMap!16061)

(declare-fun call!48602 () Unit!36905)

(declare-fun addStillContains!702 (ListLongMap!16061 (_ BitVec 64) V!43073 (_ BitVec 64)) Unit!36905)

(assert (=> bm!48595 (= call!48602 (addStillContains!702 (ite c!110138 lt!502304 lt!502316) (ite c!110138 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110139 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110138 minValue!944 (ite c!110139 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1131232 () Bool)

(declare-fun e!643786 () Unit!36905)

(declare-fun Unit!36907 () Unit!36905)

(assert (=> b!1131232 (= e!643786 Unit!36907)))

(declare-fun b!1131233 () Bool)

(declare-fun e!643790 () Bool)

(declare-fun e!643787 () Bool)

(assert (=> b!1131233 (= e!643790 (and e!643787 mapRes!44506))))

(declare-fun condMapEmpty!44506 () Bool)

(declare-fun mapDefault!44506 () ValueCell!13520)

(assert (=> b!1131233 (= condMapEmpty!44506 (= (arr!35503 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13520)) mapDefault!44506)))))

(declare-fun bm!48596 () Bool)

(declare-fun call!48600 () ListLongMap!16061)

(declare-fun getCurrentListMapNoExtraKeys!4545 (array!73698 array!73700 (_ BitVec 32) (_ BitVec 32) V!43073 V!43073 (_ BitVec 32) Int) ListLongMap!16061)

(assert (=> bm!48596 (= call!48600 (getCurrentListMapNoExtraKeys!4545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48597 () Bool)

(declare-fun call!48599 () Unit!36905)

(assert (=> bm!48597 (= call!48599 call!48602)))

(declare-fun b!1131234 () Bool)

(declare-fun tp_is_empty!28459 () Bool)

(assert (=> b!1131234 (= e!643787 tp_is_empty!28459)))

(declare-fun b!1131235 () Bool)

(declare-fun res!755753 () Bool)

(assert (=> b!1131235 (=> (not res!755753) (not e!643788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73698 (_ BitVec 32)) Bool)

(assert (=> b!1131235 (= res!755753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131236 () Bool)

(declare-fun res!755755 () Bool)

(assert (=> b!1131236 (=> (not res!755755) (not e!643788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131236 (= res!755755 (validKeyInArray!0 k0!934))))

(declare-fun b!1131237 () Bool)

(declare-fun e!643789 () Bool)

(assert (=> b!1131237 (= e!643788 e!643789)))

(declare-fun res!755750 () Bool)

(assert (=> b!1131237 (=> (not res!755750) (not e!643789))))

(declare-fun lt!502308 () array!73698)

(assert (=> b!1131237 (= res!755750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502308 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131237 (= lt!502308 (array!73699 (store (arr!35502 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36040 _keys!1208)))))

(declare-fun b!1131238 () Bool)

(declare-fun e!643778 () Bool)

(declare-fun call!48604 () ListLongMap!16061)

(assert (=> b!1131238 (= e!643778 (= call!48604 call!48600))))

(declare-fun b!1131239 () Bool)

(declare-fun c!110136 () Bool)

(assert (=> b!1131239 (= c!110136 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502307))))

(declare-fun e!643791 () Unit!36905)

(assert (=> b!1131239 (= e!643791 e!643786)))

(declare-fun b!1131240 () Bool)

(declare-fun e!643782 () Bool)

(declare-fun e!643785 () Bool)

(assert (=> b!1131240 (= e!643782 e!643785)))

(declare-fun res!755756 () Bool)

(assert (=> b!1131240 (=> res!755756 e!643785)))

(assert (=> b!1131240 (= res!755756 (not (= (select (arr!35502 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1131240 e!643778))

(declare-fun c!110137 () Bool)

(assert (=> b!1131240 (= c!110137 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502312 () Unit!36905)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!435 (array!73698 array!73700 (_ BitVec 32) (_ BitVec 32) V!43073 V!43073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36905)

(assert (=> b!1131240 (= lt!502312 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!755748 () Bool)

(assert (=> start!98222 (=> (not res!755748) (not e!643788))))

(assert (=> start!98222 (= res!755748 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36040 _keys!1208))))))

(assert (=> start!98222 e!643788))

(assert (=> start!98222 tp_is_empty!28459))

(declare-fun array_inv!27308 (array!73698) Bool)

(assert (=> start!98222 (array_inv!27308 _keys!1208)))

(assert (=> start!98222 true))

(assert (=> start!98222 tp!84491))

(declare-fun array_inv!27309 (array!73700) Bool)

(assert (=> start!98222 (and (array_inv!27309 _values!996) e!643790)))

(declare-fun bm!48598 () Bool)

(declare-fun lt!502313 () array!73700)

(assert (=> bm!48598 (= call!48604 (getCurrentListMapNoExtraKeys!4545 lt!502308 lt!502313 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131241 () Bool)

(declare-fun e!643783 () Bool)

(assert (=> b!1131241 (= e!643789 (not e!643783))))

(declare-fun res!755751 () Bool)

(assert (=> b!1131241 (=> res!755751 e!643783)))

(assert (=> b!1131241 (= res!755751 (bvsgt from!1455 i!673))))

(assert (=> b!1131241 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502315 () Unit!36905)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73698 (_ BitVec 64) (_ BitVec 32)) Unit!36905)

(assert (=> b!1131241 (= lt!502315 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1131242 () Bool)

(declare-fun res!755754 () Bool)

(assert (=> b!1131242 (=> (not res!755754) (not e!643788))))

(assert (=> b!1131242 (= res!755754 (= (select (arr!35502 _keys!1208) i!673) k0!934))))

(declare-fun bm!48599 () Bool)

(declare-fun call!48603 () Bool)

(declare-fun call!48605 () Bool)

(assert (=> bm!48599 (= call!48603 call!48605)))

(declare-fun b!1131243 () Bool)

(declare-fun res!755752 () Bool)

(assert (=> b!1131243 (=> (not res!755752) (not e!643788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131243 (= res!755752 (validMask!0 mask!1564))))

(declare-fun b!1131244 () Bool)

(assert (=> b!1131244 (= e!643780 tp_is_empty!28459)))

(declare-fun b!1131245 () Bool)

(assert (=> b!1131245 call!48603))

(declare-fun lt!502310 () Unit!36905)

(assert (=> b!1131245 (= lt!502310 call!48599)))

(assert (=> b!1131245 (= e!643791 lt!502310)))

(declare-fun call!48601 () ListLongMap!16061)

(declare-fun bm!48600 () Bool)

(declare-fun contains!6498 (ListLongMap!16061 (_ BitVec 64)) Bool)

(assert (=> bm!48600 (= call!48605 (contains!6498 (ite c!110138 lt!502304 call!48601) k0!934))))

(declare-fun bm!48601 () Bool)

(declare-fun call!48598 () ListLongMap!16061)

(assert (=> bm!48601 (= call!48601 call!48598)))

(declare-fun b!1131246 () Bool)

(assert (=> b!1131246 (= e!643777 e!643791)))

(assert (=> b!1131246 (= c!110139 (and (not lt!502307) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131247 () Bool)

(assert (=> b!1131247 (= e!643781 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!502307) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1131248 () Bool)

(declare-fun -!1151 (ListLongMap!16061 (_ BitVec 64)) ListLongMap!16061)

(assert (=> b!1131248 (= e!643778 (= call!48604 (-!1151 call!48600 k0!934)))))

(declare-fun bm!48602 () Bool)

(declare-fun +!3484 (ListLongMap!16061 tuple2!18092) ListLongMap!16061)

(assert (=> bm!48602 (= call!48598 (+!3484 lt!502316 (ite (or c!110138 c!110139) (tuple2!18093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1131249 () Bool)

(declare-fun res!755759 () Bool)

(assert (=> b!1131249 (=> (not res!755759) (not e!643788))))

(assert (=> b!1131249 (= res!755759 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36040 _keys!1208))))))

(declare-fun b!1131250 () Bool)

(assert (=> b!1131250 (= e!643785 e!643784)))

(declare-fun res!755758 () Bool)

(assert (=> b!1131250 (=> res!755758 e!643784)))

(assert (=> b!1131250 (= res!755758 (not (contains!6498 lt!502316 k0!934)))))

(assert (=> b!1131250 (= lt!502316 (getCurrentListMapNoExtraKeys!4545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131251 () Bool)

(assert (=> b!1131251 (= e!643783 e!643782)))

(declare-fun res!755760 () Bool)

(assert (=> b!1131251 (=> res!755760 e!643782)))

(assert (=> b!1131251 (= res!755760 (not (= from!1455 i!673)))))

(declare-fun lt!502317 () ListLongMap!16061)

(assert (=> b!1131251 (= lt!502317 (getCurrentListMapNoExtraKeys!4545 lt!502308 lt!502313 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2546 (Int (_ BitVec 64)) V!43073)

(assert (=> b!1131251 (= lt!502313 (array!73701 (store (arr!35503 _values!996) i!673 (ValueCellFull!13520 (dynLambda!2546 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36041 _values!996)))))

(declare-fun lt!502303 () ListLongMap!16061)

(assert (=> b!1131251 (= lt!502303 (getCurrentListMapNoExtraKeys!4545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1131252 () Bool)

(declare-fun lt!502305 () Unit!36905)

(assert (=> b!1131252 (= e!643786 lt!502305)))

(assert (=> b!1131252 (= lt!502305 call!48599)))

(assert (=> b!1131252 call!48603))

(declare-fun b!1131253 () Bool)

(declare-fun res!755761 () Bool)

(assert (=> b!1131253 (=> (not res!755761) (not e!643789))))

(assert (=> b!1131253 (= res!755761 (arrayNoDuplicates!0 lt!502308 #b00000000000000000000000000000000 Nil!24838))))

(declare-fun b!1131254 () Bool)

(declare-fun lt!502311 () Unit!36905)

(assert (=> b!1131254 (= e!643777 lt!502311)))

(declare-fun lt!502314 () Unit!36905)

(assert (=> b!1131254 (= lt!502314 (addStillContains!702 lt!502316 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1131254 (= lt!502304 call!48598)))

(assert (=> b!1131254 call!48605))

(assert (=> b!1131254 (= lt!502311 call!48602)))

(assert (=> b!1131254 (contains!6498 (+!3484 lt!502304 (tuple2!18093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun mapIsEmpty!44506 () Bool)

(assert (=> mapIsEmpty!44506 mapRes!44506))

(declare-fun b!1131255 () Bool)

(declare-fun res!755757 () Bool)

(assert (=> b!1131255 (=> (not res!755757) (not e!643788))))

(assert (=> b!1131255 (= res!755757 (and (= (size!36041 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36040 _keys!1208) (size!36041 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98222 res!755748) b!1131243))

(assert (= (and b!1131243 res!755752) b!1131255))

(assert (= (and b!1131255 res!755757) b!1131235))

(assert (= (and b!1131235 res!755753) b!1131229))

(assert (= (and b!1131229 res!755749) b!1131249))

(assert (= (and b!1131249 res!755759) b!1131236))

(assert (= (and b!1131236 res!755755) b!1131242))

(assert (= (and b!1131242 res!755754) b!1131237))

(assert (= (and b!1131237 res!755750) b!1131253))

(assert (= (and b!1131253 res!755761) b!1131241))

(assert (= (and b!1131241 (not res!755751)) b!1131251))

(assert (= (and b!1131251 (not res!755760)) b!1131240))

(assert (= (and b!1131240 c!110137) b!1131248))

(assert (= (and b!1131240 (not c!110137)) b!1131238))

(assert (= (or b!1131248 b!1131238) bm!48598))

(assert (= (or b!1131248 b!1131238) bm!48596))

(assert (= (and b!1131240 (not res!755756)) b!1131250))

(assert (= (and b!1131250 (not res!755758)) b!1131231))

(assert (= (and b!1131231 c!110138) b!1131254))

(assert (= (and b!1131231 (not c!110138)) b!1131246))

(assert (= (and b!1131246 c!110139) b!1131245))

(assert (= (and b!1131246 (not c!110139)) b!1131239))

(assert (= (and b!1131239 c!110136) b!1131252))

(assert (= (and b!1131239 (not c!110136)) b!1131232))

(assert (= (or b!1131245 b!1131252) bm!48597))

(assert (= (or b!1131245 b!1131252) bm!48601))

(assert (= (or b!1131245 b!1131252) bm!48599))

(assert (= (or b!1131254 bm!48599) bm!48600))

(assert (= (or b!1131254 bm!48597) bm!48595))

(assert (= (or b!1131254 bm!48601) bm!48602))

(assert (= (and b!1131231 c!110135) b!1131230))

(assert (= (and b!1131231 (not c!110135)) b!1131247))

(assert (= (and b!1131233 condMapEmpty!44506) mapIsEmpty!44506))

(assert (= (and b!1131233 (not condMapEmpty!44506)) mapNonEmpty!44506))

(get-info :version)

(assert (= (and mapNonEmpty!44506 ((_ is ValueCellFull!13520) mapValue!44506)) b!1131244))

(assert (= (and b!1131233 ((_ is ValueCellFull!13520) mapDefault!44506)) b!1131234))

(assert (= start!98222 b!1131233))

(declare-fun b_lambda!18881 () Bool)

(assert (=> (not b_lambda!18881) (not b!1131251)))

(declare-fun t!35752 () Bool)

(declare-fun tb!8733 () Bool)

(assert (=> (and start!98222 (= defaultEntry!1004 defaultEntry!1004) t!35752) tb!8733))

(declare-fun result!18035 () Bool)

(assert (=> tb!8733 (= result!18035 tp_is_empty!28459)))

(assert (=> b!1131251 t!35752))

(declare-fun b_and!38621 () Bool)

(assert (= b_and!38619 (and (=> t!35752 result!18035) b_and!38621)))

(declare-fun m!1043677 () Bool)

(assert (=> b!1131253 m!1043677))

(declare-fun m!1043679 () Bool)

(assert (=> b!1131235 m!1043679))

(declare-fun m!1043681 () Bool)

(assert (=> b!1131250 m!1043681))

(declare-fun m!1043683 () Bool)

(assert (=> b!1131250 m!1043683))

(declare-fun m!1043685 () Bool)

(assert (=> bm!48598 m!1043685))

(declare-fun m!1043687 () Bool)

(assert (=> b!1131248 m!1043687))

(declare-fun m!1043689 () Bool)

(assert (=> b!1131254 m!1043689))

(declare-fun m!1043691 () Bool)

(assert (=> b!1131254 m!1043691))

(assert (=> b!1131254 m!1043691))

(declare-fun m!1043693 () Bool)

(assert (=> b!1131254 m!1043693))

(declare-fun m!1043695 () Bool)

(assert (=> mapNonEmpty!44506 m!1043695))

(declare-fun m!1043697 () Bool)

(assert (=> bm!48600 m!1043697))

(declare-fun m!1043699 () Bool)

(assert (=> start!98222 m!1043699))

(declare-fun m!1043701 () Bool)

(assert (=> start!98222 m!1043701))

(declare-fun m!1043703 () Bool)

(assert (=> b!1131240 m!1043703))

(declare-fun m!1043705 () Bool)

(assert (=> b!1131240 m!1043705))

(declare-fun m!1043707 () Bool)

(assert (=> b!1131230 m!1043707))

(declare-fun m!1043709 () Bool)

(assert (=> b!1131231 m!1043709))

(declare-fun m!1043711 () Bool)

(assert (=> b!1131229 m!1043711))

(declare-fun m!1043713 () Bool)

(assert (=> bm!48602 m!1043713))

(declare-fun m!1043715 () Bool)

(assert (=> b!1131237 m!1043715))

(declare-fun m!1043717 () Bool)

(assert (=> b!1131237 m!1043717))

(declare-fun m!1043719 () Bool)

(assert (=> b!1131243 m!1043719))

(declare-fun m!1043721 () Bool)

(assert (=> b!1131241 m!1043721))

(declare-fun m!1043723 () Bool)

(assert (=> b!1131241 m!1043723))

(declare-fun m!1043725 () Bool)

(assert (=> b!1131251 m!1043725))

(declare-fun m!1043727 () Bool)

(assert (=> b!1131251 m!1043727))

(declare-fun m!1043729 () Bool)

(assert (=> b!1131251 m!1043729))

(declare-fun m!1043731 () Bool)

(assert (=> b!1131251 m!1043731))

(assert (=> bm!48596 m!1043683))

(declare-fun m!1043733 () Bool)

(assert (=> b!1131236 m!1043733))

(declare-fun m!1043735 () Bool)

(assert (=> bm!48595 m!1043735))

(declare-fun m!1043737 () Bool)

(assert (=> b!1131242 m!1043737))

(check-sat (not start!98222) (not b!1131241) tp_is_empty!28459 (not b!1131231) (not b!1131235) (not mapNonEmpty!44506) (not b!1131254) (not b!1131230) (not bm!48596) (not b!1131237) b_and!38621 (not b!1131250) (not b_lambda!18881) (not b!1131253) (not b!1131243) (not bm!48600) (not b!1131240) (not bm!48602) (not b!1131229) (not b!1131251) (not bm!48595) (not b!1131236) (not b_next!23929) (not b!1131248) (not bm!48598))
(check-sat b_and!38621 (not b_next!23929))
