; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99298 () Bool)

(assert start!99298)

(declare-fun b_free!24883 () Bool)

(declare-fun b_next!24883 () Bool)

(assert (=> start!99298 (= b_free!24883 (not b_next!24883))))

(declare-fun tp!87362 () Bool)

(declare-fun b_and!40611 () Bool)

(assert (=> start!99298 (= tp!87362 b_and!40611)))

(declare-fun b!1170065 () Bool)

(declare-fun e!665013 () Bool)

(declare-fun e!665018 () Bool)

(declare-fun mapRes!45947 () Bool)

(assert (=> b!1170065 (= e!665013 (and e!665018 mapRes!45947))))

(declare-fun condMapEmpty!45947 () Bool)

(declare-datatypes ((V!44345 0))(
  ( (V!44346 (val!14763 Int)) )
))
(declare-datatypes ((ValueCell!13997 0))(
  ( (ValueCellFull!13997 (v!17400 V!44345)) (EmptyCell!13997) )
))
(declare-datatypes ((array!75574 0))(
  ( (array!75575 (arr!36437 (Array (_ BitVec 32) ValueCell!13997)) (size!36975 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75574)

(declare-fun mapDefault!45947 () ValueCell!13997)

(assert (=> b!1170065 (= condMapEmpty!45947 (= (arr!36437 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13997)) mapDefault!45947)))))

(declare-fun b!1170066 () Bool)

(declare-fun res!776510 () Bool)

(declare-fun e!665014 () Bool)

(assert (=> b!1170066 (=> (not res!776510) (not e!665014))))

(declare-datatypes ((array!75576 0))(
  ( (array!75577 (arr!36438 (Array (_ BitVec 32) (_ BitVec 64))) (size!36976 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75576)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1170066 (= res!776510 (and (= (size!36975 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36976 _keys!1208) (size!36975 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170067 () Bool)

(declare-fun e!665022 () Bool)

(assert (=> b!1170067 (= e!665014 e!665022)))

(declare-fun res!776518 () Bool)

(assert (=> b!1170067 (=> (not res!776518) (not e!665022))))

(declare-fun lt!526805 () array!75576)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75576 (_ BitVec 32)) Bool)

(assert (=> b!1170067 (= res!776518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526805 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170067 (= lt!526805 (array!75577 (store (arr!36438 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36976 _keys!1208)))))

(declare-fun mapNonEmpty!45947 () Bool)

(declare-fun tp!87363 () Bool)

(declare-fun e!665021 () Bool)

(assert (=> mapNonEmpty!45947 (= mapRes!45947 (and tp!87363 e!665021))))

(declare-fun mapRest!45947 () (Array (_ BitVec 32) ValueCell!13997))

(declare-fun mapValue!45947 () ValueCell!13997)

(declare-fun mapKey!45947 () (_ BitVec 32))

(assert (=> mapNonEmpty!45947 (= (arr!36437 _values!996) (store mapRest!45947 mapKey!45947 mapValue!45947))))

(declare-fun b!1170068 () Bool)

(declare-fun res!776516 () Bool)

(assert (=> b!1170068 (=> (not res!776516) (not e!665014))))

(assert (=> b!1170068 (= res!776516 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36976 _keys!1208))))))

(declare-fun b!1170069 () Bool)

(declare-fun res!776508 () Bool)

(assert (=> b!1170069 (=> (not res!776508) (not e!665014))))

(declare-datatypes ((List!25658 0))(
  ( (Nil!25655) (Cons!25654 (h!26863 (_ BitVec 64)) (t!37524 List!25658)) )
))
(declare-fun arrayNoDuplicates!0 (array!75576 (_ BitVec 32) List!25658) Bool)

(assert (=> b!1170069 (= res!776508 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25655))))

(declare-fun b!1170070 () Bool)

(declare-fun res!776506 () Bool)

(assert (=> b!1170070 (=> (not res!776506) (not e!665014))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170070 (= res!776506 (validKeyInArray!0 k0!934))))

(declare-fun b!1170071 () Bool)

(declare-fun e!665012 () Bool)

(declare-fun arrayContainsKey!0 (array!75576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170071 (= e!665012 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170073 () Bool)

(declare-fun res!776511 () Bool)

(assert (=> b!1170073 (=> (not res!776511) (not e!665014))))

(assert (=> b!1170073 (= res!776511 (= (select (arr!36438 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45947 () Bool)

(assert (=> mapIsEmpty!45947 mapRes!45947))

(declare-fun b!1170074 () Bool)

(declare-fun res!776507 () Bool)

(assert (=> b!1170074 (=> (not res!776507) (not e!665014))))

(assert (=> b!1170074 (= res!776507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170075 () Bool)

(declare-fun e!665020 () Bool)

(declare-fun e!665017 () Bool)

(assert (=> b!1170075 (= e!665020 e!665017)))

(declare-fun res!776512 () Bool)

(assert (=> b!1170075 (=> res!776512 e!665017)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170075 (= res!776512 (not (validKeyInArray!0 (select (arr!36438 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18944 0))(
  ( (tuple2!18945 (_1!9483 (_ BitVec 64)) (_2!9483 V!44345)) )
))
(declare-datatypes ((List!25659 0))(
  ( (Nil!25656) (Cons!25655 (h!26864 tuple2!18944) (t!37525 List!25659)) )
))
(declare-datatypes ((ListLongMap!16913 0))(
  ( (ListLongMap!16914 (toList!8472 List!25659)) )
))
(declare-fun lt!526803 () ListLongMap!16913)

(declare-fun lt!526807 () ListLongMap!16913)

(assert (=> b!1170075 (= lt!526803 lt!526807)))

(declare-fun lt!526804 () ListLongMap!16913)

(declare-fun -!1472 (ListLongMap!16913 (_ BitVec 64)) ListLongMap!16913)

(assert (=> b!1170075 (= lt!526807 (-!1472 lt!526804 k0!934))))

(declare-fun zeroValue!944 () V!44345)

(declare-fun lt!526810 () array!75574)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44345)

(declare-fun getCurrentListMapNoExtraKeys!4947 (array!75576 array!75574 (_ BitVec 32) (_ BitVec 32) V!44345 V!44345 (_ BitVec 32) Int) ListLongMap!16913)

(assert (=> b!1170075 (= lt!526803 (getCurrentListMapNoExtraKeys!4947 lt!526805 lt!526810 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170075 (= lt!526804 (getCurrentListMapNoExtraKeys!4947 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38427 0))(
  ( (Unit!38428) )
))
(declare-fun lt!526806 () Unit!38427)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!736 (array!75576 array!75574 (_ BitVec 32) (_ BitVec 32) V!44345 V!44345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38427)

(assert (=> b!1170075 (= lt!526806 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170076 () Bool)

(declare-fun res!776505 () Bool)

(assert (=> b!1170076 (=> (not res!776505) (not e!665014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170076 (= res!776505 (validMask!0 mask!1564))))

(declare-fun b!1170077 () Bool)

(declare-fun e!665015 () Bool)

(assert (=> b!1170077 (= e!665017 e!665015)))

(declare-fun res!776503 () Bool)

(assert (=> b!1170077 (=> res!776503 e!665015)))

(assert (=> b!1170077 (= res!776503 (not (= (select (arr!36438 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665023 () Bool)

(assert (=> b!1170077 e!665023))

(declare-fun res!776513 () Bool)

(assert (=> b!1170077 (=> (not res!776513) (not e!665023))))

(declare-fun lt!526811 () V!44345)

(declare-fun lt!526802 () ListLongMap!16913)

(declare-fun +!3792 (ListLongMap!16913 tuple2!18944) ListLongMap!16913)

(declare-fun get!18586 (ValueCell!13997 V!44345) V!44345)

(assert (=> b!1170077 (= res!776513 (= lt!526802 (+!3792 lt!526807 (tuple2!18945 (select (arr!36438 _keys!1208) from!1455) (get!18586 (select (arr!36437 _values!996) from!1455) lt!526811)))))))

(declare-fun b!1170078 () Bool)

(declare-fun tp_is_empty!29413 () Bool)

(assert (=> b!1170078 (= e!665018 tp_is_empty!29413)))

(declare-fun b!1170079 () Bool)

(declare-fun res!776517 () Bool)

(assert (=> b!1170079 (=> (not res!776517) (not e!665022))))

(assert (=> b!1170079 (= res!776517 (arrayNoDuplicates!0 lt!526805 #b00000000000000000000000000000000 Nil!25655))))

(declare-fun b!1170080 () Bool)

(assert (=> b!1170080 (= e!665015 true)))

(assert (=> b!1170080 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!526808 () Unit!38427)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75576 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38427)

(assert (=> b!1170080 (= lt!526808 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170081 () Bool)

(declare-fun e!665019 () Bool)

(assert (=> b!1170081 (= e!665022 (not e!665019))))

(declare-fun res!776504 () Bool)

(assert (=> b!1170081 (=> res!776504 e!665019)))

(assert (=> b!1170081 (= res!776504 (bvsgt from!1455 i!673))))

(assert (=> b!1170081 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526812 () Unit!38427)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75576 (_ BitVec 64) (_ BitVec 32)) Unit!38427)

(assert (=> b!1170081 (= lt!526812 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170082 () Bool)

(assert (=> b!1170082 (= e!665019 e!665020)))

(declare-fun res!776515 () Bool)

(assert (=> b!1170082 (=> res!776515 e!665020)))

(assert (=> b!1170082 (= res!776515 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1170082 (= lt!526802 (getCurrentListMapNoExtraKeys!4947 lt!526805 lt!526810 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170082 (= lt!526810 (array!75575 (store (arr!36437 _values!996) i!673 (ValueCellFull!13997 lt!526811)) (size!36975 _values!996)))))

(declare-fun dynLambda!2872 (Int (_ BitVec 64)) V!44345)

(assert (=> b!1170082 (= lt!526811 (dynLambda!2872 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526809 () ListLongMap!16913)

(assert (=> b!1170082 (= lt!526809 (getCurrentListMapNoExtraKeys!4947 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170083 () Bool)

(assert (=> b!1170083 (= e!665023 e!665012)))

(declare-fun res!776514 () Bool)

(assert (=> b!1170083 (=> res!776514 e!665012)))

(assert (=> b!1170083 (= res!776514 (not (= (select (arr!36438 _keys!1208) from!1455) k0!934)))))

(declare-fun res!776509 () Bool)

(assert (=> start!99298 (=> (not res!776509) (not e!665014))))

(assert (=> start!99298 (= res!776509 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36976 _keys!1208))))))

(assert (=> start!99298 e!665014))

(assert (=> start!99298 tp_is_empty!29413))

(declare-fun array_inv!27950 (array!75576) Bool)

(assert (=> start!99298 (array_inv!27950 _keys!1208)))

(assert (=> start!99298 true))

(assert (=> start!99298 tp!87362))

(declare-fun array_inv!27951 (array!75574) Bool)

(assert (=> start!99298 (and (array_inv!27951 _values!996) e!665013)))

(declare-fun b!1170072 () Bool)

(assert (=> b!1170072 (= e!665021 tp_is_empty!29413)))

(assert (= (and start!99298 res!776509) b!1170076))

(assert (= (and b!1170076 res!776505) b!1170066))

(assert (= (and b!1170066 res!776510) b!1170074))

(assert (= (and b!1170074 res!776507) b!1170069))

(assert (= (and b!1170069 res!776508) b!1170068))

(assert (= (and b!1170068 res!776516) b!1170070))

(assert (= (and b!1170070 res!776506) b!1170073))

(assert (= (and b!1170073 res!776511) b!1170067))

(assert (= (and b!1170067 res!776518) b!1170079))

(assert (= (and b!1170079 res!776517) b!1170081))

(assert (= (and b!1170081 (not res!776504)) b!1170082))

(assert (= (and b!1170082 (not res!776515)) b!1170075))

(assert (= (and b!1170075 (not res!776512)) b!1170077))

(assert (= (and b!1170077 res!776513) b!1170083))

(assert (= (and b!1170083 (not res!776514)) b!1170071))

(assert (= (and b!1170077 (not res!776503)) b!1170080))

(assert (= (and b!1170065 condMapEmpty!45947) mapIsEmpty!45947))

(assert (= (and b!1170065 (not condMapEmpty!45947)) mapNonEmpty!45947))

(get-info :version)

(assert (= (and mapNonEmpty!45947 ((_ is ValueCellFull!13997) mapValue!45947)) b!1170072))

(assert (= (and b!1170065 ((_ is ValueCellFull!13997) mapDefault!45947)) b!1170078))

(assert (= start!99298 b!1170065))

(declare-fun b_lambda!20009 () Bool)

(assert (=> (not b_lambda!20009) (not b!1170082)))

(declare-fun t!37523 () Bool)

(declare-fun tb!9687 () Bool)

(assert (=> (and start!99298 (= defaultEntry!1004 defaultEntry!1004) t!37523) tb!9687))

(declare-fun result!19949 () Bool)

(assert (=> tb!9687 (= result!19949 tp_is_empty!29413)))

(assert (=> b!1170082 t!37523))

(declare-fun b_and!40613 () Bool)

(assert (= b_and!40611 (and (=> t!37523 result!19949) b_and!40613)))

(declare-fun m!1077413 () Bool)

(assert (=> b!1170073 m!1077413))

(declare-fun m!1077415 () Bool)

(assert (=> b!1170082 m!1077415))

(declare-fun m!1077417 () Bool)

(assert (=> b!1170082 m!1077417))

(declare-fun m!1077419 () Bool)

(assert (=> b!1170082 m!1077419))

(declare-fun m!1077421 () Bool)

(assert (=> b!1170082 m!1077421))

(declare-fun m!1077423 () Bool)

(assert (=> b!1170080 m!1077423))

(declare-fun m!1077425 () Bool)

(assert (=> b!1170080 m!1077425))

(declare-fun m!1077427 () Bool)

(assert (=> b!1170069 m!1077427))

(declare-fun m!1077429 () Bool)

(assert (=> mapNonEmpty!45947 m!1077429))

(declare-fun m!1077431 () Bool)

(assert (=> b!1170079 m!1077431))

(declare-fun m!1077433 () Bool)

(assert (=> b!1170070 m!1077433))

(declare-fun m!1077435 () Bool)

(assert (=> b!1170083 m!1077435))

(declare-fun m!1077437 () Bool)

(assert (=> b!1170081 m!1077437))

(declare-fun m!1077439 () Bool)

(assert (=> b!1170081 m!1077439))

(declare-fun m!1077441 () Bool)

(assert (=> b!1170074 m!1077441))

(declare-fun m!1077443 () Bool)

(assert (=> b!1170076 m!1077443))

(declare-fun m!1077445 () Bool)

(assert (=> b!1170075 m!1077445))

(declare-fun m!1077447 () Bool)

(assert (=> b!1170075 m!1077447))

(declare-fun m!1077449 () Bool)

(assert (=> b!1170075 m!1077449))

(assert (=> b!1170075 m!1077435))

(assert (=> b!1170075 m!1077435))

(declare-fun m!1077451 () Bool)

(assert (=> b!1170075 m!1077451))

(declare-fun m!1077453 () Bool)

(assert (=> b!1170075 m!1077453))

(declare-fun m!1077455 () Bool)

(assert (=> b!1170067 m!1077455))

(declare-fun m!1077457 () Bool)

(assert (=> b!1170067 m!1077457))

(declare-fun m!1077459 () Bool)

(assert (=> start!99298 m!1077459))

(declare-fun m!1077461 () Bool)

(assert (=> start!99298 m!1077461))

(assert (=> b!1170077 m!1077435))

(declare-fun m!1077463 () Bool)

(assert (=> b!1170077 m!1077463))

(assert (=> b!1170077 m!1077463))

(declare-fun m!1077465 () Bool)

(assert (=> b!1170077 m!1077465))

(declare-fun m!1077467 () Bool)

(assert (=> b!1170077 m!1077467))

(declare-fun m!1077469 () Bool)

(assert (=> b!1170071 m!1077469))

(check-sat tp_is_empty!29413 (not b!1170070) (not b_next!24883) (not start!99298) (not b!1170067) (not b!1170071) (not mapNonEmpty!45947) (not b!1170082) (not b_lambda!20009) (not b!1170080) b_and!40613 (not b!1170081) (not b!1170074) (not b!1170076) (not b!1170075) (not b!1170077) (not b!1170069) (not b!1170079))
(check-sat b_and!40613 (not b_next!24883))
