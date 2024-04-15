; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99182 () Bool)

(assert start!99182)

(declare-fun b_free!24793 () Bool)

(declare-fun b_next!24793 () Bool)

(assert (=> start!99182 (= b_free!24793 (not b_next!24793))))

(declare-fun tp!87090 () Bool)

(declare-fun b_and!40413 () Bool)

(assert (=> start!99182 (= tp!87090 b_and!40413)))

(declare-fun b!1167565 () Bool)

(declare-fun res!774585 () Bool)

(declare-fun e!663597 () Bool)

(assert (=> b!1167565 (=> (not res!774585) (not e!663597))))

(declare-datatypes ((array!75394 0))(
  ( (array!75395 (arr!36348 (Array (_ BitVec 32) (_ BitVec 64))) (size!36886 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75394)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75394 (_ BitVec 32)) Bool)

(assert (=> b!1167565 (= res!774585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167566 () Bool)

(declare-fun res!774586 () Bool)

(assert (=> b!1167566 (=> (not res!774586) (not e!663597))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167566 (= res!774586 (validKeyInArray!0 k0!934))))

(declare-fun b!1167567 () Bool)

(declare-fun e!663598 () Bool)

(assert (=> b!1167567 (= e!663597 e!663598)))

(declare-fun res!774583 () Bool)

(assert (=> b!1167567 (=> (not res!774583) (not e!663598))))

(declare-fun lt!525543 () array!75394)

(assert (=> b!1167567 (= res!774583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525543 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167567 (= lt!525543 (array!75395 (store (arr!36348 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36886 _keys!1208)))))

(declare-fun b!1167568 () Bool)

(declare-fun e!663601 () Bool)

(assert (=> b!1167568 (= e!663598 (not e!663601))))

(declare-fun res!774588 () Bool)

(assert (=> b!1167568 (=> res!774588 e!663601)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1167568 (= res!774588 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167568 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38355 0))(
  ( (Unit!38356) )
))
(declare-fun lt!525539 () Unit!38355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75394 (_ BitVec 64) (_ BitVec 32)) Unit!38355)

(assert (=> b!1167568 (= lt!525539 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167569 () Bool)

(declare-fun res!774590 () Bool)

(assert (=> b!1167569 (=> (not res!774590) (not e!663597))))

(declare-datatypes ((List!25582 0))(
  ( (Nil!25579) (Cons!25578 (h!26787 (_ BitVec 64)) (t!37358 List!25582)) )
))
(declare-fun arrayNoDuplicates!0 (array!75394 (_ BitVec 32) List!25582) Bool)

(assert (=> b!1167569 (= res!774590 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25579))))

(declare-fun b!1167570 () Bool)

(declare-fun e!663602 () Bool)

(declare-fun tp_is_empty!29323 () Bool)

(assert (=> b!1167570 (= e!663602 tp_is_empty!29323)))

(declare-fun b!1167571 () Bool)

(declare-fun e!663603 () Bool)

(declare-fun e!663600 () Bool)

(declare-fun mapRes!45809 () Bool)

(assert (=> b!1167571 (= e!663603 (and e!663600 mapRes!45809))))

(declare-fun condMapEmpty!45809 () Bool)

(declare-datatypes ((V!44225 0))(
  ( (V!44226 (val!14718 Int)) )
))
(declare-datatypes ((ValueCell!13952 0))(
  ( (ValueCellFull!13952 (v!17354 V!44225)) (EmptyCell!13952) )
))
(declare-datatypes ((array!75396 0))(
  ( (array!75397 (arr!36349 (Array (_ BitVec 32) ValueCell!13952)) (size!36887 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75396)

(declare-fun mapDefault!45809 () ValueCell!13952)

(assert (=> b!1167571 (= condMapEmpty!45809 (= (arr!36349 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13952)) mapDefault!45809)))))

(declare-fun mapIsEmpty!45809 () Bool)

(assert (=> mapIsEmpty!45809 mapRes!45809))

(declare-fun b!1167572 () Bool)

(declare-fun res!774584 () Bool)

(assert (=> b!1167572 (=> (not res!774584) (not e!663597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167572 (= res!774584 (validMask!0 mask!1564))))

(declare-fun res!774589 () Bool)

(assert (=> start!99182 (=> (not res!774589) (not e!663597))))

(assert (=> start!99182 (= res!774589 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36886 _keys!1208))))))

(assert (=> start!99182 e!663597))

(assert (=> start!99182 tp_is_empty!29323))

(declare-fun array_inv!27892 (array!75394) Bool)

(assert (=> start!99182 (array_inv!27892 _keys!1208)))

(assert (=> start!99182 true))

(assert (=> start!99182 tp!87090))

(declare-fun array_inv!27893 (array!75396) Bool)

(assert (=> start!99182 (and (array_inv!27893 _values!996) e!663603)))

(declare-fun b!1167573 () Bool)

(declare-fun res!774582 () Bool)

(assert (=> b!1167573 (=> (not res!774582) (not e!663598))))

(assert (=> b!1167573 (= res!774582 (arrayNoDuplicates!0 lt!525543 #b00000000000000000000000000000000 Nil!25579))))

(declare-fun b!1167574 () Bool)

(declare-fun res!774587 () Bool)

(assert (=> b!1167574 (=> (not res!774587) (not e!663597))))

(assert (=> b!1167574 (= res!774587 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36886 _keys!1208))))))

(declare-fun mapNonEmpty!45809 () Bool)

(declare-fun tp!87089 () Bool)

(assert (=> mapNonEmpty!45809 (= mapRes!45809 (and tp!87089 e!663602))))

(declare-fun mapValue!45809 () ValueCell!13952)

(declare-fun mapKey!45809 () (_ BitVec 32))

(declare-fun mapRest!45809 () (Array (_ BitVec 32) ValueCell!13952))

(assert (=> mapNonEmpty!45809 (= (arr!36349 _values!996) (store mapRest!45809 mapKey!45809 mapValue!45809))))

(declare-fun b!1167575 () Bool)

(declare-fun res!774591 () Bool)

(assert (=> b!1167575 (=> (not res!774591) (not e!663597))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1167575 (= res!774591 (and (= (size!36887 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36886 _keys!1208) (size!36887 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167576 () Bool)

(assert (=> b!1167576 (= e!663600 tp_is_empty!29323)))

(declare-fun b!1167577 () Bool)

(declare-fun e!663599 () Bool)

(assert (=> b!1167577 (= e!663599 true)))

(declare-fun zeroValue!944 () V!44225)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525540 () array!75396)

(declare-fun minValue!944 () V!44225)

(declare-datatypes ((tuple2!18868 0))(
  ( (tuple2!18869 (_1!9445 (_ BitVec 64)) (_2!9445 V!44225)) )
))
(declare-datatypes ((List!25583 0))(
  ( (Nil!25580) (Cons!25579 (h!26788 tuple2!18868) (t!37359 List!25583)) )
))
(declare-datatypes ((ListLongMap!16837 0))(
  ( (ListLongMap!16838 (toList!8434 List!25583)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4910 (array!75394 array!75396 (_ BitVec 32) (_ BitVec 32) V!44225 V!44225 (_ BitVec 32) Int) ListLongMap!16837)

(declare-fun -!1443 (ListLongMap!16837 (_ BitVec 64)) ListLongMap!16837)

(assert (=> b!1167577 (= (getCurrentListMapNoExtraKeys!4910 lt!525543 lt!525540 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1443 (getCurrentListMapNoExtraKeys!4910 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525538 () Unit!38355)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!707 (array!75394 array!75396 (_ BitVec 32) (_ BitVec 32) V!44225 V!44225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38355)

(assert (=> b!1167577 (= lt!525538 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!707 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167578 () Bool)

(assert (=> b!1167578 (= e!663601 e!663599)))

(declare-fun res!774592 () Bool)

(assert (=> b!1167578 (=> res!774592 e!663599)))

(assert (=> b!1167578 (= res!774592 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525542 () ListLongMap!16837)

(assert (=> b!1167578 (= lt!525542 (getCurrentListMapNoExtraKeys!4910 lt!525543 lt!525540 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2842 (Int (_ BitVec 64)) V!44225)

(assert (=> b!1167578 (= lt!525540 (array!75397 (store (arr!36349 _values!996) i!673 (ValueCellFull!13952 (dynLambda!2842 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36887 _values!996)))))

(declare-fun lt!525541 () ListLongMap!16837)

(assert (=> b!1167578 (= lt!525541 (getCurrentListMapNoExtraKeys!4910 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167579 () Bool)

(declare-fun res!774593 () Bool)

(assert (=> b!1167579 (=> (not res!774593) (not e!663597))))

(assert (=> b!1167579 (= res!774593 (= (select (arr!36348 _keys!1208) i!673) k0!934))))

(assert (= (and start!99182 res!774589) b!1167572))

(assert (= (and b!1167572 res!774584) b!1167575))

(assert (= (and b!1167575 res!774591) b!1167565))

(assert (= (and b!1167565 res!774585) b!1167569))

(assert (= (and b!1167569 res!774590) b!1167574))

(assert (= (and b!1167574 res!774587) b!1167566))

(assert (= (and b!1167566 res!774586) b!1167579))

(assert (= (and b!1167579 res!774593) b!1167567))

(assert (= (and b!1167567 res!774583) b!1167573))

(assert (= (and b!1167573 res!774582) b!1167568))

(assert (= (and b!1167568 (not res!774588)) b!1167578))

(assert (= (and b!1167578 (not res!774592)) b!1167577))

(assert (= (and b!1167571 condMapEmpty!45809) mapIsEmpty!45809))

(assert (= (and b!1167571 (not condMapEmpty!45809)) mapNonEmpty!45809))

(get-info :version)

(assert (= (and mapNonEmpty!45809 ((_ is ValueCellFull!13952) mapValue!45809)) b!1167570))

(assert (= (and b!1167571 ((_ is ValueCellFull!13952) mapDefault!45809)) b!1167576))

(assert (= start!99182 b!1167571))

(declare-fun b_lambda!19881 () Bool)

(assert (=> (not b_lambda!19881) (not b!1167578)))

(declare-fun t!37357 () Bool)

(declare-fun tb!9597 () Bool)

(assert (=> (and start!99182 (= defaultEntry!1004 defaultEntry!1004) t!37357) tb!9597))

(declare-fun result!19767 () Bool)

(assert (=> tb!9597 (= result!19767 tp_is_empty!29323)))

(assert (=> b!1167578 t!37357))

(declare-fun b_and!40415 () Bool)

(assert (= b_and!40413 (and (=> t!37357 result!19767) b_and!40415)))

(declare-fun m!1074985 () Bool)

(assert (=> b!1167573 m!1074985))

(declare-fun m!1074987 () Bool)

(assert (=> b!1167569 m!1074987))

(declare-fun m!1074989 () Bool)

(assert (=> b!1167577 m!1074989))

(declare-fun m!1074991 () Bool)

(assert (=> b!1167577 m!1074991))

(assert (=> b!1167577 m!1074991))

(declare-fun m!1074993 () Bool)

(assert (=> b!1167577 m!1074993))

(declare-fun m!1074995 () Bool)

(assert (=> b!1167577 m!1074995))

(declare-fun m!1074997 () Bool)

(assert (=> start!99182 m!1074997))

(declare-fun m!1074999 () Bool)

(assert (=> start!99182 m!1074999))

(declare-fun m!1075001 () Bool)

(assert (=> b!1167565 m!1075001))

(declare-fun m!1075003 () Bool)

(assert (=> mapNonEmpty!45809 m!1075003))

(declare-fun m!1075005 () Bool)

(assert (=> b!1167578 m!1075005))

(declare-fun m!1075007 () Bool)

(assert (=> b!1167578 m!1075007))

(declare-fun m!1075009 () Bool)

(assert (=> b!1167578 m!1075009))

(declare-fun m!1075011 () Bool)

(assert (=> b!1167578 m!1075011))

(declare-fun m!1075013 () Bool)

(assert (=> b!1167568 m!1075013))

(declare-fun m!1075015 () Bool)

(assert (=> b!1167568 m!1075015))

(declare-fun m!1075017 () Bool)

(assert (=> b!1167567 m!1075017))

(declare-fun m!1075019 () Bool)

(assert (=> b!1167567 m!1075019))

(declare-fun m!1075021 () Bool)

(assert (=> b!1167566 m!1075021))

(declare-fun m!1075023 () Bool)

(assert (=> b!1167572 m!1075023))

(declare-fun m!1075025 () Bool)

(assert (=> b!1167579 m!1075025))

(check-sat (not b!1167569) (not b!1167577) (not b!1167578) (not mapNonEmpty!45809) (not b!1167565) b_and!40415 tp_is_empty!29323 (not b!1167567) (not b_lambda!19881) (not b!1167572) (not b!1167573) (not b!1167566) (not b_next!24793) (not b!1167568) (not start!99182))
(check-sat b_and!40415 (not b_next!24793))
