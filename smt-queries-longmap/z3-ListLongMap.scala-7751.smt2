; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97252 () Bool)

(assert start!97252)

(declare-fun b_free!23223 () Bool)

(declare-fun b_next!23223 () Bool)

(assert (=> start!97252 (= b_free!23223 (not b_next!23223))))

(declare-fun tp!81967 () Bool)

(declare-fun b_and!37277 () Bool)

(assert (=> start!97252 (= tp!81967 b_and!37277)))

(declare-datatypes ((V!41771 0))(
  ( (V!41772 (val!13798 Int)) )
))
(declare-fun zeroValue!944 () V!41771)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41771)

(declare-fun bm!46362 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17420 0))(
  ( (tuple2!17421 (_1!8721 (_ BitVec 64)) (_2!8721 V!41771)) )
))
(declare-datatypes ((List!24108 0))(
  ( (Nil!24105) (Cons!24104 (h!25313 tuple2!17420) (t!34377 List!24108)) )
))
(declare-datatypes ((ListLongMap!15389 0))(
  ( (ListLongMap!15390 (toList!7710 List!24108)) )
))
(declare-fun call!46366 () ListLongMap!15389)

(declare-datatypes ((ValueCell!13032 0))(
  ( (ValueCellFull!13032 (v!16431 V!41771)) (EmptyCell!13032) )
))
(declare-datatypes ((array!71883 0))(
  ( (array!71884 (arr!34594 (Array (_ BitVec 32) ValueCell!13032)) (size!35130 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71883)

(declare-datatypes ((array!71885 0))(
  ( (array!71886 (arr!34595 (Array (_ BitVec 32) (_ BitVec 64))) (size!35131 (_ BitVec 32))) )
))
(declare-fun lt!495542 () array!71885)

(declare-fun getCurrentListMapNoExtraKeys!4210 (array!71885 array!71883 (_ BitVec 32) (_ BitVec 32) V!41771 V!41771 (_ BitVec 32) Int) ListLongMap!15389)

(declare-fun dynLambda!2345 (Int (_ BitVec 64)) V!41771)

(assert (=> bm!46362 (= call!46366 (getCurrentListMapNoExtraKeys!4210 lt!495542 (array!71884 (store (arr!34594 _values!996) i!673 (ValueCellFull!13032 (dynLambda!2345 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35130 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _keys!1208 () array!71885)

(declare-fun call!46365 () ListLongMap!15389)

(declare-fun bm!46363 () Bool)

(assert (=> bm!46363 (= call!46365 (getCurrentListMapNoExtraKeys!4210 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!738754 () Bool)

(declare-fun e!631615 () Bool)

(assert (=> start!97252 (=> (not res!738754) (not e!631615))))

(assert (=> start!97252 (= res!738754 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35131 _keys!1208))))))

(assert (=> start!97252 e!631615))

(declare-fun tp_is_empty!27483 () Bool)

(assert (=> start!97252 tp_is_empty!27483))

(declare-fun array_inv!26620 (array!71885) Bool)

(assert (=> start!97252 (array_inv!26620 _keys!1208)))

(assert (=> start!97252 true))

(assert (=> start!97252 tp!81967))

(declare-fun e!631613 () Bool)

(declare-fun array_inv!26621 (array!71883) Bool)

(assert (=> start!97252 (and (array_inv!26621 _values!996) e!631613)))

(declare-fun b!1106945 () Bool)

(declare-fun e!631614 () Bool)

(assert (=> b!1106945 (= e!631614 tp_is_empty!27483)))

(declare-fun b!1106946 () Bool)

(declare-fun mapRes!43042 () Bool)

(assert (=> b!1106946 (= e!631613 (and e!631614 mapRes!43042))))

(declare-fun condMapEmpty!43042 () Bool)

(declare-fun mapDefault!43042 () ValueCell!13032)

(assert (=> b!1106946 (= condMapEmpty!43042 (= (arr!34594 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13032)) mapDefault!43042)))))

(declare-fun mapNonEmpty!43042 () Bool)

(declare-fun tp!81968 () Bool)

(declare-fun e!631611 () Bool)

(assert (=> mapNonEmpty!43042 (= mapRes!43042 (and tp!81968 e!631611))))

(declare-fun mapValue!43042 () ValueCell!13032)

(declare-fun mapKey!43042 () (_ BitVec 32))

(declare-fun mapRest!43042 () (Array (_ BitVec 32) ValueCell!13032))

(assert (=> mapNonEmpty!43042 (= (arr!34594 _values!996) (store mapRest!43042 mapKey!43042 mapValue!43042))))

(declare-fun b!1106947 () Bool)

(declare-fun res!738753 () Bool)

(assert (=> b!1106947 (=> (not res!738753) (not e!631615))))

(assert (=> b!1106947 (= res!738753 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35131 _keys!1208))))))

(declare-fun b!1106948 () Bool)

(declare-fun e!631610 () Bool)

(assert (=> b!1106948 (= e!631615 e!631610)))

(declare-fun res!738750 () Bool)

(assert (=> b!1106948 (=> (not res!738750) (not e!631610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71885 (_ BitVec 32)) Bool)

(assert (=> b!1106948 (= res!738750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495542 mask!1564))))

(assert (=> b!1106948 (= lt!495542 (array!71886 (store (arr!34595 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35131 _keys!1208)))))

(declare-fun b!1106949 () Bool)

(declare-fun e!631612 () Bool)

(assert (=> b!1106949 (= e!631610 (not e!631612))))

(declare-fun res!738749 () Bool)

(assert (=> b!1106949 (=> res!738749 e!631612)))

(assert (=> b!1106949 (= res!738749 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35131 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106949 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36326 0))(
  ( (Unit!36327) )
))
(declare-fun lt!495541 () Unit!36326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71885 (_ BitVec 64) (_ BitVec 32)) Unit!36326)

(assert (=> b!1106949 (= lt!495541 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106950 () Bool)

(declare-fun res!738751 () Bool)

(assert (=> b!1106950 (=> (not res!738751) (not e!631615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106950 (= res!738751 (validKeyInArray!0 k0!934))))

(declare-fun b!1106951 () Bool)

(declare-fun res!738746 () Bool)

(assert (=> b!1106951 (=> (not res!738746) (not e!631615))))

(assert (=> b!1106951 (= res!738746 (= (select (arr!34595 _keys!1208) i!673) k0!934))))

(declare-fun b!1106952 () Bool)

(assert (=> b!1106952 (= e!631612 true)))

(declare-fun e!631616 () Bool)

(assert (=> b!1106952 e!631616))

(declare-fun c!109014 () Bool)

(assert (=> b!1106952 (= c!109014 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495540 () Unit!36326)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!239 (array!71885 array!71883 (_ BitVec 32) (_ BitVec 32) V!41771 V!41771 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36326)

(assert (=> b!1106952 (= lt!495540 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!239 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1106953 () Bool)

(declare-fun res!738747 () Bool)

(assert (=> b!1106953 (=> (not res!738747) (not e!631615))))

(assert (=> b!1106953 (= res!738747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106954 () Bool)

(assert (=> b!1106954 (= e!631611 tp_is_empty!27483)))

(declare-fun b!1106955 () Bool)

(assert (=> b!1106955 (= e!631616 (= call!46366 call!46365))))

(declare-fun b!1106956 () Bool)

(declare-fun res!738752 () Bool)

(assert (=> b!1106956 (=> (not res!738752) (not e!631615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106956 (= res!738752 (validMask!0 mask!1564))))

(declare-fun b!1106957 () Bool)

(declare-fun res!738748 () Bool)

(assert (=> b!1106957 (=> (not res!738748) (not e!631615))))

(declare-datatypes ((List!24109 0))(
  ( (Nil!24106) (Cons!24105 (h!25314 (_ BitVec 64)) (t!34378 List!24109)) )
))
(declare-fun arrayNoDuplicates!0 (array!71885 (_ BitVec 32) List!24109) Bool)

(assert (=> b!1106957 (= res!738748 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24106))))

(declare-fun b!1106958 () Bool)

(declare-fun -!993 (ListLongMap!15389 (_ BitVec 64)) ListLongMap!15389)

(assert (=> b!1106958 (= e!631616 (= call!46366 (-!993 call!46365 k0!934)))))

(declare-fun b!1106959 () Bool)

(declare-fun res!738745 () Bool)

(assert (=> b!1106959 (=> (not res!738745) (not e!631610))))

(assert (=> b!1106959 (= res!738745 (arrayNoDuplicates!0 lt!495542 #b00000000000000000000000000000000 Nil!24106))))

(declare-fun mapIsEmpty!43042 () Bool)

(assert (=> mapIsEmpty!43042 mapRes!43042))

(declare-fun b!1106960 () Bool)

(declare-fun res!738744 () Bool)

(assert (=> b!1106960 (=> (not res!738744) (not e!631615))))

(assert (=> b!1106960 (= res!738744 (and (= (size!35130 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35131 _keys!1208) (size!35130 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97252 res!738754) b!1106956))

(assert (= (and b!1106956 res!738752) b!1106960))

(assert (= (and b!1106960 res!738744) b!1106953))

(assert (= (and b!1106953 res!738747) b!1106957))

(assert (= (and b!1106957 res!738748) b!1106947))

(assert (= (and b!1106947 res!738753) b!1106950))

(assert (= (and b!1106950 res!738751) b!1106951))

(assert (= (and b!1106951 res!738746) b!1106948))

(assert (= (and b!1106948 res!738750) b!1106959))

(assert (= (and b!1106959 res!738745) b!1106949))

(assert (= (and b!1106949 (not res!738749)) b!1106952))

(assert (= (and b!1106952 c!109014) b!1106958))

(assert (= (and b!1106952 (not c!109014)) b!1106955))

(assert (= (or b!1106958 b!1106955) bm!46362))

(assert (= (or b!1106958 b!1106955) bm!46363))

(assert (= (and b!1106946 condMapEmpty!43042) mapIsEmpty!43042))

(assert (= (and b!1106946 (not condMapEmpty!43042)) mapNonEmpty!43042))

(get-info :version)

(assert (= (and mapNonEmpty!43042 ((_ is ValueCellFull!13032) mapValue!43042)) b!1106954))

(assert (= (and b!1106946 ((_ is ValueCellFull!13032) mapDefault!43042)) b!1106945))

(assert (= start!97252 b!1106946))

(declare-fun b_lambda!18241 () Bool)

(assert (=> (not b_lambda!18241) (not bm!46362)))

(declare-fun t!34376 () Bool)

(declare-fun tb!8089 () Bool)

(assert (=> (and start!97252 (= defaultEntry!1004 defaultEntry!1004) t!34376) tb!8089))

(declare-fun result!16739 () Bool)

(assert (=> tb!8089 (= result!16739 tp_is_empty!27483)))

(assert (=> bm!46362 t!34376))

(declare-fun b_and!37279 () Bool)

(assert (= b_and!37277 (and (=> t!34376 result!16739) b_and!37279)))

(declare-fun m!1025839 () Bool)

(assert (=> b!1106958 m!1025839))

(declare-fun m!1025841 () Bool)

(assert (=> mapNonEmpty!43042 m!1025841))

(declare-fun m!1025843 () Bool)

(assert (=> bm!46363 m!1025843))

(declare-fun m!1025845 () Bool)

(assert (=> b!1106951 m!1025845))

(declare-fun m!1025847 () Bool)

(assert (=> b!1106956 m!1025847))

(declare-fun m!1025849 () Bool)

(assert (=> b!1106957 m!1025849))

(declare-fun m!1025851 () Bool)

(assert (=> bm!46362 m!1025851))

(declare-fun m!1025853 () Bool)

(assert (=> bm!46362 m!1025853))

(declare-fun m!1025855 () Bool)

(assert (=> bm!46362 m!1025855))

(declare-fun m!1025857 () Bool)

(assert (=> b!1106949 m!1025857))

(declare-fun m!1025859 () Bool)

(assert (=> b!1106949 m!1025859))

(declare-fun m!1025861 () Bool)

(assert (=> b!1106959 m!1025861))

(declare-fun m!1025863 () Bool)

(assert (=> b!1106948 m!1025863))

(declare-fun m!1025865 () Bool)

(assert (=> b!1106948 m!1025865))

(declare-fun m!1025867 () Bool)

(assert (=> b!1106950 m!1025867))

(declare-fun m!1025869 () Bool)

(assert (=> b!1106953 m!1025869))

(declare-fun m!1025871 () Bool)

(assert (=> b!1106952 m!1025871))

(declare-fun m!1025873 () Bool)

(assert (=> start!97252 m!1025873))

(declare-fun m!1025875 () Bool)

(assert (=> start!97252 m!1025875))

(check-sat (not bm!46362) (not b!1106957) (not b!1106949) (not b!1106948) (not b!1106959) (not mapNonEmpty!43042) tp_is_empty!27483 (not start!97252) (not b_next!23223) (not b!1106956) (not bm!46363) (not b!1106953) (not b!1106952) b_and!37279 (not b_lambda!18241) (not b!1106958) (not b!1106950))
(check-sat b_and!37279 (not b_next!23223))
