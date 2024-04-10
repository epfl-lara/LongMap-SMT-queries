; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99184 () Bool)

(assert start!99184)

(declare-fun b_free!24789 () Bool)

(declare-fun b_next!24789 () Bool)

(assert (=> start!99184 (= b_free!24789 (not b_next!24789))))

(declare-fun tp!87077 () Bool)

(declare-fun b_and!40427 () Bool)

(assert (=> start!99184 (= tp!87077 b_and!40427)))

(declare-fun b!1167596 () Bool)

(declare-fun res!774577 () Bool)

(declare-fun e!663630 () Bool)

(assert (=> b!1167596 (=> (not res!774577) (not e!663630))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75463 0))(
  ( (array!75464 (arr!36382 (Array (_ BitVec 32) (_ BitVec 64))) (size!36918 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75463)

(assert (=> b!1167596 (= res!774577 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36918 _keys!1208))))))

(declare-fun b!1167597 () Bool)

(declare-fun res!774586 () Bool)

(assert (=> b!1167597 (=> (not res!774586) (not e!663630))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1167597 (= res!774586 (= (select (arr!36382 _keys!1208) i!673) k0!934))))

(declare-fun b!1167598 () Bool)

(declare-fun res!774580 () Bool)

(assert (=> b!1167598 (=> (not res!774580) (not e!663630))))

(declare-datatypes ((List!25514 0))(
  ( (Nil!25511) (Cons!25510 (h!26719 (_ BitVec 64)) (t!37295 List!25514)) )
))
(declare-fun arrayNoDuplicates!0 (array!75463 (_ BitVec 32) List!25514) Bool)

(assert (=> b!1167598 (= res!774580 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25511))))

(declare-fun b!1167599 () Bool)

(declare-fun e!663633 () Bool)

(declare-fun e!663627 () Bool)

(declare-fun mapRes!45803 () Bool)

(assert (=> b!1167599 (= e!663633 (and e!663627 mapRes!45803))))

(declare-fun condMapEmpty!45803 () Bool)

(declare-datatypes ((V!44219 0))(
  ( (V!44220 (val!14716 Int)) )
))
(declare-datatypes ((ValueCell!13950 0))(
  ( (ValueCellFull!13950 (v!17353 V!44219)) (EmptyCell!13950) )
))
(declare-datatypes ((array!75465 0))(
  ( (array!75466 (arr!36383 (Array (_ BitVec 32) ValueCell!13950)) (size!36919 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75465)

(declare-fun mapDefault!45803 () ValueCell!13950)

(assert (=> b!1167599 (= condMapEmpty!45803 (= (arr!36383 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13950)) mapDefault!45803)))))

(declare-fun b!1167600 () Bool)

(declare-fun res!774581 () Bool)

(declare-fun e!663626 () Bool)

(assert (=> b!1167600 (=> (not res!774581) (not e!663626))))

(declare-fun lt!525699 () array!75463)

(assert (=> b!1167600 (= res!774581 (arrayNoDuplicates!0 lt!525699 #b00000000000000000000000000000000 Nil!25511))))

(declare-fun b!1167601 () Bool)

(declare-fun e!663629 () Bool)

(assert (=> b!1167601 (= e!663626 (not e!663629))))

(declare-fun res!774579 () Bool)

(assert (=> b!1167601 (=> res!774579 e!663629)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1167601 (= res!774579 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167601 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38526 0))(
  ( (Unit!38527) )
))
(declare-fun lt!525697 () Unit!38526)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75463 (_ BitVec 64) (_ BitVec 32)) Unit!38526)

(assert (=> b!1167601 (= lt!525697 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45803 () Bool)

(declare-fun tp!87078 () Bool)

(declare-fun e!663632 () Bool)

(assert (=> mapNonEmpty!45803 (= mapRes!45803 (and tp!87078 e!663632))))

(declare-fun mapValue!45803 () ValueCell!13950)

(declare-fun mapRest!45803 () (Array (_ BitVec 32) ValueCell!13950))

(declare-fun mapKey!45803 () (_ BitVec 32))

(assert (=> mapNonEmpty!45803 (= (arr!36383 _values!996) (store mapRest!45803 mapKey!45803 mapValue!45803))))

(declare-fun b!1167602 () Bool)

(declare-fun tp_is_empty!29319 () Bool)

(assert (=> b!1167602 (= e!663632 tp_is_empty!29319)))

(declare-fun mapIsEmpty!45803 () Bool)

(assert (=> mapIsEmpty!45803 mapRes!45803))

(declare-fun b!1167603 () Bool)

(declare-fun res!774584 () Bool)

(assert (=> b!1167603 (=> (not res!774584) (not e!663630))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75463 (_ BitVec 32)) Bool)

(assert (=> b!1167603 (= res!774584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167604 () Bool)

(declare-fun res!774585 () Bool)

(assert (=> b!1167604 (=> (not res!774585) (not e!663630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167604 (= res!774585 (validKeyInArray!0 k0!934))))

(declare-fun b!1167605 () Bool)

(declare-fun res!774583 () Bool)

(assert (=> b!1167605 (=> (not res!774583) (not e!663630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167605 (= res!774583 (validMask!0 mask!1564))))

(declare-fun res!774587 () Bool)

(assert (=> start!99184 (=> (not res!774587) (not e!663630))))

(assert (=> start!99184 (= res!774587 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36918 _keys!1208))))))

(assert (=> start!99184 e!663630))

(assert (=> start!99184 tp_is_empty!29319))

(declare-fun array_inv!27814 (array!75463) Bool)

(assert (=> start!99184 (array_inv!27814 _keys!1208)))

(assert (=> start!99184 true))

(assert (=> start!99184 tp!87077))

(declare-fun array_inv!27815 (array!75465) Bool)

(assert (=> start!99184 (and (array_inv!27815 _values!996) e!663633)))

(declare-fun b!1167595 () Bool)

(assert (=> b!1167595 (= e!663627 tp_is_empty!29319)))

(declare-fun b!1167606 () Bool)

(declare-fun e!663628 () Bool)

(assert (=> b!1167606 (= e!663629 e!663628)))

(declare-fun res!774582 () Bool)

(assert (=> b!1167606 (=> res!774582 e!663628)))

(assert (=> b!1167606 (= res!774582 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44219)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18774 0))(
  ( (tuple2!18775 (_1!9398 (_ BitVec 64)) (_2!9398 V!44219)) )
))
(declare-datatypes ((List!25515 0))(
  ( (Nil!25512) (Cons!25511 (h!26720 tuple2!18774) (t!37296 List!25515)) )
))
(declare-datatypes ((ListLongMap!16743 0))(
  ( (ListLongMap!16744 (toList!8387 List!25515)) )
))
(declare-fun lt!525698 () ListLongMap!16743)

(declare-fun lt!525695 () array!75465)

(declare-fun minValue!944 () V!44219)

(declare-fun getCurrentListMapNoExtraKeys!4851 (array!75463 array!75465 (_ BitVec 32) (_ BitVec 32) V!44219 V!44219 (_ BitVec 32) Int) ListLongMap!16743)

(assert (=> b!1167606 (= lt!525698 (getCurrentListMapNoExtraKeys!4851 lt!525699 lt!525695 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2833 (Int (_ BitVec 64)) V!44219)

(assert (=> b!1167606 (= lt!525695 (array!75466 (store (arr!36383 _values!996) i!673 (ValueCellFull!13950 (dynLambda!2833 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36919 _values!996)))))

(declare-fun lt!525694 () ListLongMap!16743)

(assert (=> b!1167606 (= lt!525694 (getCurrentListMapNoExtraKeys!4851 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167607 () Bool)

(assert (=> b!1167607 (= e!663628 true)))

(declare-fun -!1462 (ListLongMap!16743 (_ BitVec 64)) ListLongMap!16743)

(assert (=> b!1167607 (= (getCurrentListMapNoExtraKeys!4851 lt!525699 lt!525695 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1462 (getCurrentListMapNoExtraKeys!4851 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525696 () Unit!38526)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!689 (array!75463 array!75465 (_ BitVec 32) (_ BitVec 32) V!44219 V!44219 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38526)

(assert (=> b!1167607 (= lt!525696 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!689 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167608 () Bool)

(declare-fun res!774576 () Bool)

(assert (=> b!1167608 (=> (not res!774576) (not e!663630))))

(assert (=> b!1167608 (= res!774576 (and (= (size!36919 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36918 _keys!1208) (size!36919 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167609 () Bool)

(assert (=> b!1167609 (= e!663630 e!663626)))

(declare-fun res!774578 () Bool)

(assert (=> b!1167609 (=> (not res!774578) (not e!663626))))

(assert (=> b!1167609 (= res!774578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525699 mask!1564))))

(assert (=> b!1167609 (= lt!525699 (array!75464 (store (arr!36382 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36918 _keys!1208)))))

(assert (= (and start!99184 res!774587) b!1167605))

(assert (= (and b!1167605 res!774583) b!1167608))

(assert (= (and b!1167608 res!774576) b!1167603))

(assert (= (and b!1167603 res!774584) b!1167598))

(assert (= (and b!1167598 res!774580) b!1167596))

(assert (= (and b!1167596 res!774577) b!1167604))

(assert (= (and b!1167604 res!774585) b!1167597))

(assert (= (and b!1167597 res!774586) b!1167609))

(assert (= (and b!1167609 res!774578) b!1167600))

(assert (= (and b!1167600 res!774581) b!1167601))

(assert (= (and b!1167601 (not res!774579)) b!1167606))

(assert (= (and b!1167606 (not res!774582)) b!1167607))

(assert (= (and b!1167599 condMapEmpty!45803) mapIsEmpty!45803))

(assert (= (and b!1167599 (not condMapEmpty!45803)) mapNonEmpty!45803))

(get-info :version)

(assert (= (and mapNonEmpty!45803 ((_ is ValueCellFull!13950) mapValue!45803)) b!1167602))

(assert (= (and b!1167599 ((_ is ValueCellFull!13950) mapDefault!45803)) b!1167595))

(assert (= start!99184 b!1167599))

(declare-fun b_lambda!19895 () Bool)

(assert (=> (not b_lambda!19895) (not b!1167606)))

(declare-fun t!37294 () Bool)

(declare-fun tb!9601 () Bool)

(assert (=> (and start!99184 (= defaultEntry!1004 defaultEntry!1004) t!37294) tb!9601))

(declare-fun result!19767 () Bool)

(assert (=> tb!9601 (= result!19767 tp_is_empty!29319)))

(assert (=> b!1167606 t!37294))

(declare-fun b_and!40429 () Bool)

(assert (= b_and!40427 (and (=> t!37294 result!19767) b_and!40429)))

(declare-fun m!1075511 () Bool)

(assert (=> b!1167609 m!1075511))

(declare-fun m!1075513 () Bool)

(assert (=> b!1167609 m!1075513))

(declare-fun m!1075515 () Bool)

(assert (=> b!1167606 m!1075515))

(declare-fun m!1075517 () Bool)

(assert (=> b!1167606 m!1075517))

(declare-fun m!1075519 () Bool)

(assert (=> b!1167606 m!1075519))

(declare-fun m!1075521 () Bool)

(assert (=> b!1167606 m!1075521))

(declare-fun m!1075523 () Bool)

(assert (=> b!1167598 m!1075523))

(declare-fun m!1075525 () Bool)

(assert (=> mapNonEmpty!45803 m!1075525))

(declare-fun m!1075527 () Bool)

(assert (=> start!99184 m!1075527))

(declare-fun m!1075529 () Bool)

(assert (=> start!99184 m!1075529))

(declare-fun m!1075531 () Bool)

(assert (=> b!1167605 m!1075531))

(declare-fun m!1075533 () Bool)

(assert (=> b!1167603 m!1075533))

(declare-fun m!1075535 () Bool)

(assert (=> b!1167607 m!1075535))

(declare-fun m!1075537 () Bool)

(assert (=> b!1167607 m!1075537))

(assert (=> b!1167607 m!1075537))

(declare-fun m!1075539 () Bool)

(assert (=> b!1167607 m!1075539))

(declare-fun m!1075541 () Bool)

(assert (=> b!1167607 m!1075541))

(declare-fun m!1075543 () Bool)

(assert (=> b!1167600 m!1075543))

(declare-fun m!1075545 () Bool)

(assert (=> b!1167597 m!1075545))

(declare-fun m!1075547 () Bool)

(assert (=> b!1167601 m!1075547))

(declare-fun m!1075549 () Bool)

(assert (=> b!1167601 m!1075549))

(declare-fun m!1075551 () Bool)

(assert (=> b!1167604 m!1075551))

(check-sat (not b!1167609) (not mapNonEmpty!45803) tp_is_empty!29319 (not b!1167604) (not b!1167598) (not b!1167605) (not b!1167607) (not b!1167601) (not b_lambda!19895) (not b_next!24789) (not b!1167600) (not b!1167606) (not b!1167603) b_and!40429 (not start!99184))
(check-sat b_and!40429 (not b_next!24789))
