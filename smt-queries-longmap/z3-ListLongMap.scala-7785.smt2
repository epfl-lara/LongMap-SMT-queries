; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97456 () Bool)

(assert start!97456)

(declare-fun b_free!23427 () Bool)

(declare-fun b_next!23427 () Bool)

(assert (=> start!97456 (= b_free!23427 (not b_next!23427))))

(declare-fun tp!82579 () Bool)

(declare-fun b_and!37691 () Bool)

(assert (=> start!97456 (= tp!82579 b_and!37691)))

(declare-fun b!1112081 () Bool)

(declare-fun e!634076 () Bool)

(declare-fun e!634078 () Bool)

(assert (=> b!1112081 (= e!634076 e!634078)))

(declare-fun res!742118 () Bool)

(assert (=> b!1112081 (=> (not res!742118) (not e!634078))))

(declare-datatypes ((array!72287 0))(
  ( (array!72288 (arr!34796 (Array (_ BitVec 32) (_ BitVec 64))) (size!35332 (_ BitVec 32))) )
))
(declare-fun lt!496460 () array!72287)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72287 (_ BitVec 32)) Bool)

(assert (=> b!1112081 (= res!742118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496460 mask!1564))))

(declare-fun _keys!1208 () array!72287)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112081 (= lt!496460 (array!72288 (store (arr!34796 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35332 _keys!1208)))))

(declare-fun b!1112082 () Bool)

(declare-fun res!742113 () Bool)

(assert (=> b!1112082 (=> (not res!742113) (not e!634078))))

(declare-datatypes ((List!24277 0))(
  ( (Nil!24274) (Cons!24273 (h!25482 (_ BitVec 64)) (t!34750 List!24277)) )
))
(declare-fun arrayNoDuplicates!0 (array!72287 (_ BitVec 32) List!24277) Bool)

(assert (=> b!1112082 (= res!742113 (arrayNoDuplicates!0 lt!496460 #b00000000000000000000000000000000 Nil!24274))))

(declare-fun b!1112083 () Bool)

(declare-fun e!634080 () Bool)

(declare-datatypes ((V!42043 0))(
  ( (V!42044 (val!13900 Int)) )
))
(declare-datatypes ((tuple2!17594 0))(
  ( (tuple2!17595 (_1!8808 (_ BitVec 64)) (_2!8808 V!42043)) )
))
(declare-datatypes ((List!24278 0))(
  ( (Nil!24275) (Cons!24274 (h!25483 tuple2!17594) (t!34751 List!24278)) )
))
(declare-datatypes ((ListLongMap!15563 0))(
  ( (ListLongMap!15564 (toList!7797 List!24278)) )
))
(declare-fun call!46978 () ListLongMap!15563)

(declare-fun call!46977 () ListLongMap!15563)

(assert (=> b!1112083 (= e!634080 (= call!46978 call!46977))))

(declare-fun b!1112084 () Bool)

(declare-fun res!742112 () Bool)

(assert (=> b!1112084 (=> (not res!742112) (not e!634076))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112084 (= res!742112 (validKeyInArray!0 k0!934))))

(declare-fun b!1112085 () Bool)

(declare-fun res!742114 () Bool)

(assert (=> b!1112085 (=> (not res!742114) (not e!634076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112085 (= res!742114 (validMask!0 mask!1564))))

(declare-fun res!742115 () Bool)

(assert (=> start!97456 (=> (not res!742115) (not e!634076))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97456 (= res!742115 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35332 _keys!1208))))))

(assert (=> start!97456 e!634076))

(declare-fun tp_is_empty!27687 () Bool)

(assert (=> start!97456 tp_is_empty!27687))

(declare-fun array_inv!26758 (array!72287) Bool)

(assert (=> start!97456 (array_inv!26758 _keys!1208)))

(assert (=> start!97456 true))

(assert (=> start!97456 tp!82579))

(declare-datatypes ((ValueCell!13134 0))(
  ( (ValueCellFull!13134 (v!16533 V!42043)) (EmptyCell!13134) )
))
(declare-datatypes ((array!72289 0))(
  ( (array!72290 (arr!34797 (Array (_ BitVec 32) ValueCell!13134)) (size!35333 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72289)

(declare-fun e!634077 () Bool)

(declare-fun array_inv!26759 (array!72289) Bool)

(assert (=> start!97456 (and (array_inv!26759 _values!996) e!634077)))

(declare-fun b!1112086 () Bool)

(declare-fun e!634083 () Bool)

(assert (=> b!1112086 (= e!634083 true)))

(assert (=> b!1112086 e!634080))

(declare-fun c!109338 () Bool)

(assert (=> b!1112086 (= c!109338 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42043)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36492 0))(
  ( (Unit!36493) )
))
(declare-fun lt!496458 () Unit!36492)

(declare-fun minValue!944 () V!42043)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!311 (array!72287 array!72289 (_ BitVec 32) (_ BitVec 32) V!42043 V!42043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36492)

(assert (=> b!1112086 (= lt!496458 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!311 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112087 () Bool)

(declare-fun e!634079 () Bool)

(assert (=> b!1112087 (= e!634079 tp_is_empty!27687)))

(declare-fun b!1112088 () Bool)

(assert (=> b!1112088 (= e!634078 (not e!634083))))

(declare-fun res!742111 () Bool)

(assert (=> b!1112088 (=> res!742111 e!634083)))

(assert (=> b!1112088 (= res!742111 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35332 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112088 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496459 () Unit!36492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72287 (_ BitVec 64) (_ BitVec 32)) Unit!36492)

(assert (=> b!1112088 (= lt!496459 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43348 () Bool)

(declare-fun mapRes!43348 () Bool)

(declare-fun tp!82580 () Bool)

(assert (=> mapNonEmpty!43348 (= mapRes!43348 (and tp!82580 e!634079))))

(declare-fun mapValue!43348 () ValueCell!13134)

(declare-fun mapRest!43348 () (Array (_ BitVec 32) ValueCell!13134))

(declare-fun mapKey!43348 () (_ BitVec 32))

(assert (=> mapNonEmpty!43348 (= (arr!34797 _values!996) (store mapRest!43348 mapKey!43348 mapValue!43348))))

(declare-fun b!1112089 () Bool)

(declare-fun res!742119 () Bool)

(assert (=> b!1112089 (=> (not res!742119) (not e!634076))))

(assert (=> b!1112089 (= res!742119 (= (select (arr!34796 _keys!1208) i!673) k0!934))))

(declare-fun b!1112090 () Bool)

(declare-fun -!1062 (ListLongMap!15563 (_ BitVec 64)) ListLongMap!15563)

(assert (=> b!1112090 (= e!634080 (= call!46978 (-!1062 call!46977 k0!934)))))

(declare-fun bm!46974 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4288 (array!72287 array!72289 (_ BitVec 32) (_ BitVec 32) V!42043 V!42043 (_ BitVec 32) Int) ListLongMap!15563)

(declare-fun dynLambda!2414 (Int (_ BitVec 64)) V!42043)

(assert (=> bm!46974 (= call!46978 (getCurrentListMapNoExtraKeys!4288 lt!496460 (array!72290 (store (arr!34797 _values!996) i!673 (ValueCellFull!13134 (dynLambda!2414 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35333 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112091 () Bool)

(declare-fun res!742120 () Bool)

(assert (=> b!1112091 (=> (not res!742120) (not e!634076))))

(assert (=> b!1112091 (= res!742120 (and (= (size!35333 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35332 _keys!1208) (size!35333 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112092 () Bool)

(declare-fun res!742116 () Bool)

(assert (=> b!1112092 (=> (not res!742116) (not e!634076))))

(assert (=> b!1112092 (= res!742116 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35332 _keys!1208))))))

(declare-fun b!1112093 () Bool)

(declare-fun res!742117 () Bool)

(assert (=> b!1112093 (=> (not res!742117) (not e!634076))))

(assert (=> b!1112093 (= res!742117 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24274))))

(declare-fun b!1112094 () Bool)

(declare-fun e!634081 () Bool)

(assert (=> b!1112094 (= e!634077 (and e!634081 mapRes!43348))))

(declare-fun condMapEmpty!43348 () Bool)

(declare-fun mapDefault!43348 () ValueCell!13134)

(assert (=> b!1112094 (= condMapEmpty!43348 (= (arr!34797 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13134)) mapDefault!43348)))))

(declare-fun b!1112095 () Bool)

(assert (=> b!1112095 (= e!634081 tp_is_empty!27687)))

(declare-fun bm!46975 () Bool)

(assert (=> bm!46975 (= call!46977 (getCurrentListMapNoExtraKeys!4288 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112096 () Bool)

(declare-fun res!742110 () Bool)

(assert (=> b!1112096 (=> (not res!742110) (not e!634076))))

(assert (=> b!1112096 (= res!742110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43348 () Bool)

(assert (=> mapIsEmpty!43348 mapRes!43348))

(assert (= (and start!97456 res!742115) b!1112085))

(assert (= (and b!1112085 res!742114) b!1112091))

(assert (= (and b!1112091 res!742120) b!1112096))

(assert (= (and b!1112096 res!742110) b!1112093))

(assert (= (and b!1112093 res!742117) b!1112092))

(assert (= (and b!1112092 res!742116) b!1112084))

(assert (= (and b!1112084 res!742112) b!1112089))

(assert (= (and b!1112089 res!742119) b!1112081))

(assert (= (and b!1112081 res!742118) b!1112082))

(assert (= (and b!1112082 res!742113) b!1112088))

(assert (= (and b!1112088 (not res!742111)) b!1112086))

(assert (= (and b!1112086 c!109338) b!1112090))

(assert (= (and b!1112086 (not c!109338)) b!1112083))

(assert (= (or b!1112090 b!1112083) bm!46974))

(assert (= (or b!1112090 b!1112083) bm!46975))

(assert (= (and b!1112094 condMapEmpty!43348) mapIsEmpty!43348))

(assert (= (and b!1112094 (not condMapEmpty!43348)) mapNonEmpty!43348))

(get-info :version)

(assert (= (and mapNonEmpty!43348 ((_ is ValueCellFull!13134) mapValue!43348)) b!1112087))

(assert (= (and b!1112094 ((_ is ValueCellFull!13134) mapDefault!43348)) b!1112095))

(assert (= start!97456 b!1112094))

(declare-fun b_lambda!18451 () Bool)

(assert (=> (not b_lambda!18451) (not bm!46974)))

(declare-fun t!34749 () Bool)

(declare-fun tb!8293 () Bool)

(assert (=> (and start!97456 (= defaultEntry!1004 defaultEntry!1004) t!34749) tb!8293))

(declare-fun result!17147 () Bool)

(assert (=> tb!8293 (= result!17147 tp_is_empty!27687)))

(assert (=> bm!46974 t!34749))

(declare-fun b_and!37693 () Bool)

(assert (= b_and!37691 (and (=> t!34749 result!17147) b_and!37693)))

(declare-fun m!1029715 () Bool)

(assert (=> b!1112082 m!1029715))

(declare-fun m!1029717 () Bool)

(assert (=> b!1112088 m!1029717))

(declare-fun m!1029719 () Bool)

(assert (=> b!1112088 m!1029719))

(declare-fun m!1029721 () Bool)

(assert (=> bm!46975 m!1029721))

(declare-fun m!1029723 () Bool)

(assert (=> b!1112085 m!1029723))

(declare-fun m!1029725 () Bool)

(assert (=> b!1112086 m!1029725))

(declare-fun m!1029727 () Bool)

(assert (=> bm!46974 m!1029727))

(declare-fun m!1029729 () Bool)

(assert (=> bm!46974 m!1029729))

(declare-fun m!1029731 () Bool)

(assert (=> bm!46974 m!1029731))

(declare-fun m!1029733 () Bool)

(assert (=> b!1112093 m!1029733))

(declare-fun m!1029735 () Bool)

(assert (=> b!1112084 m!1029735))

(declare-fun m!1029737 () Bool)

(assert (=> b!1112089 m!1029737))

(declare-fun m!1029739 () Bool)

(assert (=> start!97456 m!1029739))

(declare-fun m!1029741 () Bool)

(assert (=> start!97456 m!1029741))

(declare-fun m!1029743 () Bool)

(assert (=> b!1112081 m!1029743))

(declare-fun m!1029745 () Bool)

(assert (=> b!1112081 m!1029745))

(declare-fun m!1029747 () Bool)

(assert (=> mapNonEmpty!43348 m!1029747))

(declare-fun m!1029749 () Bool)

(assert (=> b!1112090 m!1029749))

(declare-fun m!1029751 () Bool)

(assert (=> b!1112096 m!1029751))

(check-sat (not b!1112085) b_and!37693 (not bm!46975) (not b!1112081) (not b!1112090) (not b!1112088) tp_is_empty!27687 (not b!1112082) (not b!1112093) (not mapNonEmpty!43348) (not bm!46974) (not b!1112086) (not start!97456) (not b!1112084) (not b_lambda!18451) (not b_next!23427) (not b!1112096))
(check-sat b_and!37693 (not b_next!23427))
