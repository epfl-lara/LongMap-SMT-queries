; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100308 () Bool)

(assert start!100308)

(declare-fun b_free!25695 () Bool)

(declare-fun b_next!25695 () Bool)

(assert (=> start!100308 (= b_free!25695 (not b_next!25695))))

(declare-fun tp!90032 () Bool)

(declare-fun b_and!42257 () Bool)

(assert (=> start!100308 (= tp!90032 b_and!42257)))

(declare-fun b!1196963 () Bool)

(declare-fun res!796591 () Bool)

(declare-fun e!680018 () Bool)

(assert (=> b!1196963 (=> (not res!796591) (not e!680018))))

(declare-datatypes ((array!77529 0))(
  ( (array!77530 (arr!37411 (Array (_ BitVec 32) (_ BitVec 64))) (size!37947 (_ BitVec 32))) )
))
(declare-fun lt!543173 () array!77529)

(declare-datatypes ((List!26319 0))(
  ( (Nil!26316) (Cons!26315 (h!27524 (_ BitVec 64)) (t!39006 List!26319)) )
))
(declare-fun arrayNoDuplicates!0 (array!77529 (_ BitVec 32) List!26319) Bool)

(assert (=> b!1196963 (= res!796591 (arrayNoDuplicates!0 lt!543173 #b00000000000000000000000000000000 Nil!26316))))

(declare-fun res!796599 () Bool)

(declare-fun e!680017 () Bool)

(assert (=> start!100308 (=> (not res!796599) (not e!680017))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!77529)

(assert (=> start!100308 (= res!796599 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37947 _keys!1208))))))

(assert (=> start!100308 e!680017))

(declare-fun tp_is_empty!30375 () Bool)

(assert (=> start!100308 tp_is_empty!30375))

(declare-fun array_inv!28510 (array!77529) Bool)

(assert (=> start!100308 (array_inv!28510 _keys!1208)))

(assert (=> start!100308 true))

(assert (=> start!100308 tp!90032))

(declare-datatypes ((V!45627 0))(
  ( (V!45628 (val!15244 Int)) )
))
(declare-datatypes ((ValueCell!14478 0))(
  ( (ValueCellFull!14478 (v!17882 V!45627)) (EmptyCell!14478) )
))
(declare-datatypes ((array!77531 0))(
  ( (array!77532 (arr!37412 (Array (_ BitVec 32) ValueCell!14478)) (size!37948 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77531)

(declare-fun e!680019 () Bool)

(declare-fun array_inv!28511 (array!77531) Bool)

(assert (=> start!100308 (and (array_inv!28511 _values!996) e!680019)))

(declare-fun b!1196964 () Bool)

(declare-fun e!680016 () Bool)

(assert (=> b!1196964 (= e!680016 true)))

(declare-fun e!680021 () Bool)

(assert (=> b!1196964 e!680021))

(declare-fun c!117357 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196964 (= c!117357 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!45627)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!39690 0))(
  ( (Unit!39691) )
))
(declare-fun lt!543174 () Unit!39690)

(declare-fun minValue!944 () V!45627)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!983 (array!77529 array!77531 (_ BitVec 32) (_ BitVec 32) V!45627 V!45627 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39690)

(assert (=> b!1196964 (= lt!543174 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!983 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47399 () Bool)

(declare-fun mapRes!47399 () Bool)

(declare-fun tp!90033 () Bool)

(declare-fun e!680023 () Bool)

(assert (=> mapNonEmpty!47399 (= mapRes!47399 (and tp!90033 e!680023))))

(declare-fun mapKey!47399 () (_ BitVec 32))

(declare-fun mapValue!47399 () ValueCell!14478)

(declare-fun mapRest!47399 () (Array (_ BitVec 32) ValueCell!14478))

(assert (=> mapNonEmpty!47399 (= (arr!37412 _values!996) (store mapRest!47399 mapKey!47399 mapValue!47399))))

(declare-fun b!1196965 () Bool)

(declare-fun res!796596 () Bool)

(assert (=> b!1196965 (=> (not res!796596) (not e!680017))))

(assert (=> b!1196965 (= res!796596 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37947 _keys!1208))))))

(declare-fun bm!57203 () Bool)

(declare-datatypes ((tuple2!19510 0))(
  ( (tuple2!19511 (_1!9766 (_ BitVec 64)) (_2!9766 V!45627)) )
))
(declare-datatypes ((List!26320 0))(
  ( (Nil!26317) (Cons!26316 (h!27525 tuple2!19510) (t!39007 List!26320)) )
))
(declare-datatypes ((ListLongMap!17479 0))(
  ( (ListLongMap!17480 (toList!8755 List!26320)) )
))
(declare-fun call!57207 () ListLongMap!17479)

(declare-fun getCurrentListMapNoExtraKeys!5195 (array!77529 array!77531 (_ BitVec 32) (_ BitVec 32) V!45627 V!45627 (_ BitVec 32) Int) ListLongMap!17479)

(assert (=> bm!57203 (= call!57207 (getCurrentListMapNoExtraKeys!5195 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196966 () Bool)

(declare-fun res!796597 () Bool)

(assert (=> b!1196966 (=> (not res!796597) (not e!680017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196966 (= res!796597 (validKeyInArray!0 k0!934))))

(declare-fun call!57206 () ListLongMap!17479)

(declare-fun b!1196967 () Bool)

(declare-fun -!1774 (ListLongMap!17479 (_ BitVec 64)) ListLongMap!17479)

(assert (=> b!1196967 (= e!680021 (= call!57206 (-!1774 call!57207 k0!934)))))

(declare-fun b!1196968 () Bool)

(declare-fun res!796600 () Bool)

(assert (=> b!1196968 (=> (not res!796600) (not e!680017))))

(assert (=> b!1196968 (= res!796600 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26316))))

(declare-fun b!1196969 () Bool)

(assert (=> b!1196969 (= e!680021 (= call!57206 call!57207))))

(declare-fun b!1196970 () Bool)

(declare-fun e!680022 () Bool)

(assert (=> b!1196970 (= e!680019 (and e!680022 mapRes!47399))))

(declare-fun condMapEmpty!47399 () Bool)

(declare-fun mapDefault!47399 () ValueCell!14478)

(assert (=> b!1196970 (= condMapEmpty!47399 (= (arr!37412 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14478)) mapDefault!47399)))))

(declare-fun b!1196971 () Bool)

(assert (=> b!1196971 (= e!680018 (not e!680016))))

(declare-fun res!796595 () Bool)

(assert (=> b!1196971 (=> res!796595 e!680016)))

(assert (=> b!1196971 (= res!796595 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37947 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196971 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543172 () Unit!39690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77529 (_ BitVec 64) (_ BitVec 32)) Unit!39690)

(assert (=> b!1196971 (= lt!543172 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196972 () Bool)

(assert (=> b!1196972 (= e!680022 tp_is_empty!30375)))

(declare-fun b!1196973 () Bool)

(declare-fun res!796594 () Bool)

(assert (=> b!1196973 (=> (not res!796594) (not e!680017))))

(assert (=> b!1196973 (= res!796594 (and (= (size!37948 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37947 _keys!1208) (size!37948 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196974 () Bool)

(declare-fun res!796598 () Bool)

(assert (=> b!1196974 (=> (not res!796598) (not e!680017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196974 (= res!796598 (validMask!0 mask!1564))))

(declare-fun b!1196975 () Bool)

(declare-fun res!796593 () Bool)

(assert (=> b!1196975 (=> (not res!796593) (not e!680017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77529 (_ BitVec 32)) Bool)

(assert (=> b!1196975 (= res!796593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47399 () Bool)

(assert (=> mapIsEmpty!47399 mapRes!47399))

(declare-fun bm!57204 () Bool)

(declare-fun dynLambda!3121 (Int (_ BitVec 64)) V!45627)

(assert (=> bm!57204 (= call!57206 (getCurrentListMapNoExtraKeys!5195 lt!543173 (array!77532 (store (arr!37412 _values!996) i!673 (ValueCellFull!14478 (dynLambda!3121 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37948 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196976 () Bool)

(declare-fun res!796590 () Bool)

(assert (=> b!1196976 (=> (not res!796590) (not e!680017))))

(assert (=> b!1196976 (= res!796590 (= (select (arr!37411 _keys!1208) i!673) k0!934))))

(declare-fun b!1196977 () Bool)

(assert (=> b!1196977 (= e!680017 e!680018)))

(declare-fun res!796592 () Bool)

(assert (=> b!1196977 (=> (not res!796592) (not e!680018))))

(assert (=> b!1196977 (= res!796592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543173 mask!1564))))

(assert (=> b!1196977 (= lt!543173 (array!77530 (store (arr!37411 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37947 _keys!1208)))))

(declare-fun b!1196978 () Bool)

(assert (=> b!1196978 (= e!680023 tp_is_empty!30375)))

(assert (= (and start!100308 res!796599) b!1196974))

(assert (= (and b!1196974 res!796598) b!1196973))

(assert (= (and b!1196973 res!796594) b!1196975))

(assert (= (and b!1196975 res!796593) b!1196968))

(assert (= (and b!1196968 res!796600) b!1196965))

(assert (= (and b!1196965 res!796596) b!1196966))

(assert (= (and b!1196966 res!796597) b!1196976))

(assert (= (and b!1196976 res!796590) b!1196977))

(assert (= (and b!1196977 res!796592) b!1196963))

(assert (= (and b!1196963 res!796591) b!1196971))

(assert (= (and b!1196971 (not res!796595)) b!1196964))

(assert (= (and b!1196964 c!117357) b!1196967))

(assert (= (and b!1196964 (not c!117357)) b!1196969))

(assert (= (or b!1196967 b!1196969) bm!57204))

(assert (= (or b!1196967 b!1196969) bm!57203))

(assert (= (and b!1196970 condMapEmpty!47399) mapIsEmpty!47399))

(assert (= (and b!1196970 (not condMapEmpty!47399)) mapNonEmpty!47399))

(get-info :version)

(assert (= (and mapNonEmpty!47399 ((_ is ValueCellFull!14478) mapValue!47399)) b!1196978))

(assert (= (and b!1196970 ((_ is ValueCellFull!14478) mapDefault!47399)) b!1196972))

(assert (= start!100308 b!1196970))

(declare-fun b_lambda!20839 () Bool)

(assert (=> (not b_lambda!20839) (not bm!57204)))

(declare-fun t!39005 () Bool)

(declare-fun tb!10507 () Bool)

(assert (=> (and start!100308 (= defaultEntry!1004 defaultEntry!1004) t!39005) tb!10507))

(declare-fun result!21587 () Bool)

(assert (=> tb!10507 (= result!21587 tp_is_empty!30375)))

(assert (=> bm!57204 t!39005))

(declare-fun b_and!42259 () Bool)

(assert (= b_and!42257 (and (=> t!39005 result!21587) b_and!42259)))

(declare-fun m!1104053 () Bool)

(assert (=> bm!57203 m!1104053))

(declare-fun m!1104055 () Bool)

(assert (=> bm!57204 m!1104055))

(declare-fun m!1104057 () Bool)

(assert (=> bm!57204 m!1104057))

(declare-fun m!1104059 () Bool)

(assert (=> bm!57204 m!1104059))

(declare-fun m!1104061 () Bool)

(assert (=> b!1196971 m!1104061))

(declare-fun m!1104063 () Bool)

(assert (=> b!1196971 m!1104063))

(declare-fun m!1104065 () Bool)

(assert (=> b!1196975 m!1104065))

(declare-fun m!1104067 () Bool)

(assert (=> b!1196964 m!1104067))

(declare-fun m!1104069 () Bool)

(assert (=> b!1196974 m!1104069))

(declare-fun m!1104071 () Bool)

(assert (=> start!100308 m!1104071))

(declare-fun m!1104073 () Bool)

(assert (=> start!100308 m!1104073))

(declare-fun m!1104075 () Bool)

(assert (=> b!1196968 m!1104075))

(declare-fun m!1104077 () Bool)

(assert (=> b!1196963 m!1104077))

(declare-fun m!1104079 () Bool)

(assert (=> b!1196966 m!1104079))

(declare-fun m!1104081 () Bool)

(assert (=> b!1196977 m!1104081))

(declare-fun m!1104083 () Bool)

(assert (=> b!1196977 m!1104083))

(declare-fun m!1104085 () Bool)

(assert (=> mapNonEmpty!47399 m!1104085))

(declare-fun m!1104087 () Bool)

(assert (=> b!1196976 m!1104087))

(declare-fun m!1104089 () Bool)

(assert (=> b!1196967 m!1104089))

(check-sat (not b_lambda!20839) (not mapNonEmpty!47399) (not bm!57203) (not b!1196977) (not b!1196968) (not bm!57204) (not b!1196971) (not b!1196966) (not b!1196967) (not b_next!25695) tp_is_empty!30375 (not b!1196963) (not b!1196975) (not start!100308) b_and!42259 (not b!1196964) (not b!1196974))
(check-sat b_and!42259 (not b_next!25695))
