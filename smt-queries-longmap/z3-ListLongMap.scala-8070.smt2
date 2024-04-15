; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99280 () Bool)

(assert start!99280)

(declare-fun b_free!24865 () Bool)

(declare-fun b_next!24865 () Bool)

(assert (=> start!99280 (= b_free!24865 (not b_next!24865))))

(declare-fun tp!87308 () Bool)

(declare-fun b_and!40575 () Bool)

(assert (=> start!99280 (= tp!87308 b_and!40575)))

(declare-fun b!1169550 () Bool)

(declare-fun res!776090 () Bool)

(declare-fun e!664709 () Bool)

(assert (=> b!1169550 (=> (not res!776090) (not e!664709))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169550 (= res!776090 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45920 () Bool)

(declare-fun mapRes!45920 () Bool)

(declare-fun tp!87309 () Bool)

(declare-fun e!664706 () Bool)

(assert (=> mapNonEmpty!45920 (= mapRes!45920 (and tp!87309 e!664706))))

(declare-datatypes ((V!44321 0))(
  ( (V!44322 (val!14754 Int)) )
))
(declare-datatypes ((ValueCell!13988 0))(
  ( (ValueCellFull!13988 (v!17391 V!44321)) (EmptyCell!13988) )
))
(declare-fun mapValue!45920 () ValueCell!13988)

(declare-fun mapRest!45920 () (Array (_ BitVec 32) ValueCell!13988))

(declare-fun mapKey!45920 () (_ BitVec 32))

(declare-datatypes ((array!75538 0))(
  ( (array!75539 (arr!36419 (Array (_ BitVec 32) ValueCell!13988)) (size!36957 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75538)

(assert (=> mapNonEmpty!45920 (= (arr!36419 _values!996) (store mapRest!45920 mapKey!45920 mapValue!45920))))

(declare-fun b!1169551 () Bool)

(declare-datatypes ((array!75540 0))(
  ( (array!75541 (arr!36420 (Array (_ BitVec 32) (_ BitVec 64))) (size!36958 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75540)

(declare-fun e!664713 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169551 (= e!664713 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169552 () Bool)

(declare-fun res!776088 () Bool)

(assert (=> b!1169552 (=> (not res!776088) (not e!664709))))

(assert (=> b!1169552 (= res!776088 (= (select (arr!36420 _keys!1208) i!673) k0!934))))

(declare-fun b!1169553 () Bool)

(declare-fun res!776099 () Bool)

(declare-fun e!664708 () Bool)

(assert (=> b!1169553 (=> (not res!776099) (not e!664708))))

(declare-fun lt!526523 () array!75540)

(declare-datatypes ((List!25642 0))(
  ( (Nil!25639) (Cons!25638 (h!26847 (_ BitVec 64)) (t!37490 List!25642)) )
))
(declare-fun arrayNoDuplicates!0 (array!75540 (_ BitVec 32) List!25642) Bool)

(assert (=> b!1169553 (= res!776099 (arrayNoDuplicates!0 lt!526523 #b00000000000000000000000000000000 Nil!25639))))

(declare-fun b!1169554 () Bool)

(declare-fun tp_is_empty!29395 () Bool)

(assert (=> b!1169554 (= e!664706 tp_is_empty!29395)))

(declare-fun res!776094 () Bool)

(assert (=> start!99280 (=> (not res!776094) (not e!664709))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99280 (= res!776094 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36958 _keys!1208))))))

(assert (=> start!99280 e!664709))

(assert (=> start!99280 tp_is_empty!29395))

(declare-fun array_inv!27936 (array!75540) Bool)

(assert (=> start!99280 (array_inv!27936 _keys!1208)))

(assert (=> start!99280 true))

(assert (=> start!99280 tp!87308))

(declare-fun e!664707 () Bool)

(declare-fun array_inv!27937 (array!75538) Bool)

(assert (=> start!99280 (and (array_inv!27937 _values!996) e!664707)))

(declare-fun b!1169555 () Bool)

(declare-fun res!776089 () Bool)

(assert (=> b!1169555 (=> (not res!776089) (not e!664709))))

(assert (=> b!1169555 (= res!776089 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25639))))

(declare-fun mapIsEmpty!45920 () Bool)

(assert (=> mapIsEmpty!45920 mapRes!45920))

(declare-fun b!1169556 () Bool)

(declare-fun res!776098 () Bool)

(assert (=> b!1169556 (=> (not res!776098) (not e!664709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75540 (_ BitVec 32)) Bool)

(assert (=> b!1169556 (= res!776098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169557 () Bool)

(declare-fun res!776091 () Bool)

(assert (=> b!1169557 (=> (not res!776091) (not e!664709))))

(assert (=> b!1169557 (= res!776091 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36958 _keys!1208))))))

(declare-fun b!1169558 () Bool)

(declare-fun e!664712 () Bool)

(assert (=> b!1169558 (= e!664708 (not e!664712))))

(declare-fun res!776101 () Bool)

(assert (=> b!1169558 (=> res!776101 e!664712)))

(assert (=> b!1169558 (= res!776101 (bvsgt from!1455 i!673))))

(assert (=> b!1169558 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38411 0))(
  ( (Unit!38412) )
))
(declare-fun lt!526528 () Unit!38411)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75540 (_ BitVec 64) (_ BitVec 32)) Unit!38411)

(assert (=> b!1169558 (= lt!526528 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169559 () Bool)

(declare-fun res!776100 () Bool)

(assert (=> b!1169559 (=> (not res!776100) (not e!664709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169559 (= res!776100 (validKeyInArray!0 k0!934))))

(declare-fun b!1169560 () Bool)

(declare-fun e!664710 () Bool)

(declare-fun e!664711 () Bool)

(assert (=> b!1169560 (= e!664710 e!664711)))

(declare-fun res!776096 () Bool)

(assert (=> b!1169560 (=> res!776096 e!664711)))

(assert (=> b!1169560 (= res!776096 (not (validKeyInArray!0 (select (arr!36420 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18928 0))(
  ( (tuple2!18929 (_1!9475 (_ BitVec 64)) (_2!9475 V!44321)) )
))
(declare-datatypes ((List!25643 0))(
  ( (Nil!25640) (Cons!25639 (h!26848 tuple2!18928) (t!37491 List!25643)) )
))
(declare-datatypes ((ListLongMap!16897 0))(
  ( (ListLongMap!16898 (toList!8464 List!25643)) )
))
(declare-fun lt!526521 () ListLongMap!16897)

(declare-fun lt!526524 () ListLongMap!16897)

(assert (=> b!1169560 (= lt!526521 lt!526524)))

(declare-fun lt!526526 () ListLongMap!16897)

(declare-fun -!1465 (ListLongMap!16897 (_ BitVec 64)) ListLongMap!16897)

(assert (=> b!1169560 (= lt!526524 (-!1465 lt!526526 k0!934))))

(declare-fun zeroValue!944 () V!44321)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44321)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!526525 () array!75538)

(declare-fun getCurrentListMapNoExtraKeys!4939 (array!75540 array!75538 (_ BitVec 32) (_ BitVec 32) V!44321 V!44321 (_ BitVec 32) Int) ListLongMap!16897)

(assert (=> b!1169560 (= lt!526521 (getCurrentListMapNoExtraKeys!4939 lt!526523 lt!526525 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169560 (= lt!526526 (getCurrentListMapNoExtraKeys!4939 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526527 () Unit!38411)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!729 (array!75540 array!75538 (_ BitVec 32) (_ BitVec 32) V!44321 V!44321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38411)

(assert (=> b!1169560 (= lt!526527 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!729 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169561 () Bool)

(declare-fun e!664705 () Bool)

(assert (=> b!1169561 (= e!664707 (and e!664705 mapRes!45920))))

(declare-fun condMapEmpty!45920 () Bool)

(declare-fun mapDefault!45920 () ValueCell!13988)

(assert (=> b!1169561 (= condMapEmpty!45920 (= (arr!36419 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13988)) mapDefault!45920)))))

(declare-fun b!1169562 () Bool)

(declare-fun res!776092 () Bool)

(assert (=> b!1169562 (=> (not res!776092) (not e!664709))))

(assert (=> b!1169562 (= res!776092 (and (= (size!36957 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36958 _keys!1208) (size!36957 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169563 () Bool)

(assert (=> b!1169563 (= e!664709 e!664708)))

(declare-fun res!776093 () Bool)

(assert (=> b!1169563 (=> (not res!776093) (not e!664708))))

(assert (=> b!1169563 (= res!776093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526523 mask!1564))))

(assert (=> b!1169563 (= lt!526523 (array!75541 (store (arr!36420 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36958 _keys!1208)))))

(declare-fun b!1169564 () Bool)

(assert (=> b!1169564 (= e!664711 true)))

(declare-fun e!664714 () Bool)

(assert (=> b!1169564 e!664714))

(declare-fun res!776095 () Bool)

(assert (=> b!1169564 (=> (not res!776095) (not e!664714))))

(declare-fun lt!526522 () ListLongMap!16897)

(declare-fun lt!526529 () V!44321)

(declare-fun +!3787 (ListLongMap!16897 tuple2!18928) ListLongMap!16897)

(declare-fun get!18575 (ValueCell!13988 V!44321) V!44321)

(assert (=> b!1169564 (= res!776095 (= lt!526522 (+!3787 lt!526524 (tuple2!18929 (select (arr!36420 _keys!1208) from!1455) (get!18575 (select (arr!36419 _values!996) from!1455) lt!526529)))))))

(declare-fun b!1169565 () Bool)

(assert (=> b!1169565 (= e!664712 e!664710)))

(declare-fun res!776097 () Bool)

(assert (=> b!1169565 (=> res!776097 e!664710)))

(assert (=> b!1169565 (= res!776097 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1169565 (= lt!526522 (getCurrentListMapNoExtraKeys!4939 lt!526523 lt!526525 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1169565 (= lt!526525 (array!75539 (store (arr!36419 _values!996) i!673 (ValueCellFull!13988 lt!526529)) (size!36957 _values!996)))))

(declare-fun dynLambda!2865 (Int (_ BitVec 64)) V!44321)

(assert (=> b!1169565 (= lt!526529 (dynLambda!2865 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526530 () ListLongMap!16897)

(assert (=> b!1169565 (= lt!526530 (getCurrentListMapNoExtraKeys!4939 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169566 () Bool)

(assert (=> b!1169566 (= e!664714 e!664713)))

(declare-fun res!776087 () Bool)

(assert (=> b!1169566 (=> res!776087 e!664713)))

(assert (=> b!1169566 (= res!776087 (not (= (select (arr!36420 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1169567 () Bool)

(assert (=> b!1169567 (= e!664705 tp_is_empty!29395)))

(assert (= (and start!99280 res!776094) b!1169550))

(assert (= (and b!1169550 res!776090) b!1169562))

(assert (= (and b!1169562 res!776092) b!1169556))

(assert (= (and b!1169556 res!776098) b!1169555))

(assert (= (and b!1169555 res!776089) b!1169557))

(assert (= (and b!1169557 res!776091) b!1169559))

(assert (= (and b!1169559 res!776100) b!1169552))

(assert (= (and b!1169552 res!776088) b!1169563))

(assert (= (and b!1169563 res!776093) b!1169553))

(assert (= (and b!1169553 res!776099) b!1169558))

(assert (= (and b!1169558 (not res!776101)) b!1169565))

(assert (= (and b!1169565 (not res!776097)) b!1169560))

(assert (= (and b!1169560 (not res!776096)) b!1169564))

(assert (= (and b!1169564 res!776095) b!1169566))

(assert (= (and b!1169566 (not res!776087)) b!1169551))

(assert (= (and b!1169561 condMapEmpty!45920) mapIsEmpty!45920))

(assert (= (and b!1169561 (not condMapEmpty!45920)) mapNonEmpty!45920))

(get-info :version)

(assert (= (and mapNonEmpty!45920 ((_ is ValueCellFull!13988) mapValue!45920)) b!1169554))

(assert (= (and b!1169561 ((_ is ValueCellFull!13988) mapDefault!45920)) b!1169567))

(assert (= start!99280 b!1169561))

(declare-fun b_lambda!19991 () Bool)

(assert (=> (not b_lambda!19991) (not b!1169565)))

(declare-fun t!37489 () Bool)

(declare-fun tb!9669 () Bool)

(assert (=> (and start!99280 (= defaultEntry!1004 defaultEntry!1004) t!37489) tb!9669))

(declare-fun result!19913 () Bool)

(assert (=> tb!9669 (= result!19913 tp_is_empty!29395)))

(assert (=> b!1169565 t!37489))

(declare-fun b_and!40577 () Bool)

(assert (= b_and!40575 (and (=> t!37489 result!19913) b_and!40577)))

(declare-fun m!1076915 () Bool)

(assert (=> b!1169565 m!1076915))

(declare-fun m!1076917 () Bool)

(assert (=> b!1169565 m!1076917))

(declare-fun m!1076919 () Bool)

(assert (=> b!1169565 m!1076919))

(declare-fun m!1076921 () Bool)

(assert (=> b!1169565 m!1076921))

(declare-fun m!1076923 () Bool)

(assert (=> start!99280 m!1076923))

(declare-fun m!1076925 () Bool)

(assert (=> start!99280 m!1076925))

(declare-fun m!1076927 () Bool)

(assert (=> b!1169556 m!1076927))

(declare-fun m!1076929 () Bool)

(assert (=> b!1169560 m!1076929))

(declare-fun m!1076931 () Bool)

(assert (=> b!1169560 m!1076931))

(declare-fun m!1076933 () Bool)

(assert (=> b!1169560 m!1076933))

(declare-fun m!1076935 () Bool)

(assert (=> b!1169560 m!1076935))

(declare-fun m!1076937 () Bool)

(assert (=> b!1169560 m!1076937))

(declare-fun m!1076939 () Bool)

(assert (=> b!1169560 m!1076939))

(assert (=> b!1169560 m!1076937))

(assert (=> b!1169566 m!1076937))

(declare-fun m!1076941 () Bool)

(assert (=> b!1169559 m!1076941))

(declare-fun m!1076943 () Bool)

(assert (=> b!1169550 m!1076943))

(declare-fun m!1076945 () Bool)

(assert (=> b!1169558 m!1076945))

(declare-fun m!1076947 () Bool)

(assert (=> b!1169558 m!1076947))

(declare-fun m!1076949 () Bool)

(assert (=> b!1169563 m!1076949))

(declare-fun m!1076951 () Bool)

(assert (=> b!1169563 m!1076951))

(declare-fun m!1076953 () Bool)

(assert (=> mapNonEmpty!45920 m!1076953))

(declare-fun m!1076955 () Bool)

(assert (=> b!1169551 m!1076955))

(declare-fun m!1076957 () Bool)

(assert (=> b!1169555 m!1076957))

(declare-fun m!1076959 () Bool)

(assert (=> b!1169552 m!1076959))

(declare-fun m!1076961 () Bool)

(assert (=> b!1169553 m!1076961))

(assert (=> b!1169564 m!1076937))

(declare-fun m!1076963 () Bool)

(assert (=> b!1169564 m!1076963))

(assert (=> b!1169564 m!1076963))

(declare-fun m!1076965 () Bool)

(assert (=> b!1169564 m!1076965))

(declare-fun m!1076967 () Bool)

(assert (=> b!1169564 m!1076967))

(check-sat (not b_lambda!19991) (not start!99280) (not b!1169560) (not b!1169553) (not b!1169565) (not b!1169555) (not mapNonEmpty!45920) (not b!1169550) (not b!1169563) (not b!1169559) (not b!1169558) (not b_next!24865) tp_is_empty!29395 (not b!1169564) (not b!1169556) (not b!1169551) b_and!40577)
(check-sat b_and!40577 (not b_next!24865))
