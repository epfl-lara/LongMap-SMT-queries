; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99282 () Bool)

(assert start!99282)

(declare-fun b_free!24861 () Bool)

(declare-fun b_next!24861 () Bool)

(assert (=> start!99282 (= b_free!24861 (not b_next!24861))))

(declare-fun tp!87297 () Bool)

(declare-fun b_and!40589 () Bool)

(assert (=> start!99282 (= tp!87297 b_and!40589)))

(declare-fun b!1169562 () Bool)

(declare-fun e!664717 () Bool)

(declare-fun e!664719 () Bool)

(assert (=> b!1169562 (= e!664717 (not e!664719))))

(declare-fun res!776066 () Bool)

(assert (=> b!1169562 (=> res!776066 e!664719)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169562 (= res!776066 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75605 0))(
  ( (array!75606 (arr!36452 (Array (_ BitVec 32) (_ BitVec 64))) (size!36988 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75605)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169562 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38588 0))(
  ( (Unit!38589) )
))
(declare-fun lt!526657 () Unit!38588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75605 (_ BitVec 64) (_ BitVec 32)) Unit!38588)

(assert (=> b!1169562 (= lt!526657 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169563 () Bool)

(declare-fun res!776077 () Bool)

(declare-fun e!664724 () Bool)

(assert (=> b!1169563 (=> (not res!776077) (not e!664724))))

(assert (=> b!1169563 (= res!776077 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36988 _keys!1208))))))

(declare-fun b!1169564 () Bool)

(declare-fun e!664725 () Bool)

(declare-fun e!664721 () Bool)

(assert (=> b!1169564 (= e!664725 e!664721)))

(declare-fun res!776074 () Bool)

(assert (=> b!1169564 (=> res!776074 e!664721)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169564 (= res!776074 (not (validKeyInArray!0 (select (arr!36452 _keys!1208) from!1455))))))

(declare-datatypes ((V!44315 0))(
  ( (V!44316 (val!14752 Int)) )
))
(declare-datatypes ((tuple2!18836 0))(
  ( (tuple2!18837 (_1!9429 (_ BitVec 64)) (_2!9429 V!44315)) )
))
(declare-datatypes ((List!25573 0))(
  ( (Nil!25570) (Cons!25569 (h!26778 tuple2!18836) (t!37426 List!25573)) )
))
(declare-datatypes ((ListLongMap!16805 0))(
  ( (ListLongMap!16806 (toList!8418 List!25573)) )
))
(declare-fun lt!526658 () ListLongMap!16805)

(declare-fun lt!526655 () ListLongMap!16805)

(assert (=> b!1169564 (= lt!526658 lt!526655)))

(declare-fun lt!526654 () ListLongMap!16805)

(declare-fun -!1489 (ListLongMap!16805 (_ BitVec 64)) ListLongMap!16805)

(assert (=> b!1169564 (= lt!526655 (-!1489 lt!526654 k0!934))))

(declare-fun lt!526662 () array!75605)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13986 0))(
  ( (ValueCellFull!13986 (v!17390 V!44315)) (EmptyCell!13986) )
))
(declare-datatypes ((array!75607 0))(
  ( (array!75608 (arr!36453 (Array (_ BitVec 32) ValueCell!13986)) (size!36989 (_ BitVec 32))) )
))
(declare-fun lt!526659 () array!75607)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44315)

(declare-fun zeroValue!944 () V!44315)

(declare-fun getCurrentListMapNoExtraKeys!4882 (array!75605 array!75607 (_ BitVec 32) (_ BitVec 32) V!44315 V!44315 (_ BitVec 32) Int) ListLongMap!16805)

(assert (=> b!1169564 (= lt!526658 (getCurrentListMapNoExtraKeys!4882 lt!526662 lt!526659 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75607)

(assert (=> b!1169564 (= lt!526654 (getCurrentListMapNoExtraKeys!4882 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526661 () Unit!38588)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!716 (array!75605 array!75607 (_ BitVec 32) (_ BitVec 32) V!44315 V!44315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38588)

(assert (=> b!1169564 (= lt!526661 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!716 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169565 () Bool)

(declare-fun res!776069 () Bool)

(assert (=> b!1169565 (=> (not res!776069) (not e!664724))))

(declare-datatypes ((List!25574 0))(
  ( (Nil!25571) (Cons!25570 (h!26779 (_ BitVec 64)) (t!37427 List!25574)) )
))
(declare-fun arrayNoDuplicates!0 (array!75605 (_ BitVec 32) List!25574) Bool)

(assert (=> b!1169565 (= res!776069 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25571))))

(declare-fun b!1169566 () Bool)

(assert (=> b!1169566 (= e!664721 true)))

(declare-fun e!664716 () Bool)

(assert (=> b!1169566 e!664716))

(declare-fun res!776064 () Bool)

(assert (=> b!1169566 (=> (not res!776064) (not e!664716))))

(declare-fun lt!526656 () V!44315)

(declare-fun lt!526660 () ListLongMap!16805)

(declare-fun +!3749 (ListLongMap!16805 tuple2!18836) ListLongMap!16805)

(declare-fun get!18583 (ValueCell!13986 V!44315) V!44315)

(assert (=> b!1169566 (= res!776064 (= lt!526660 (+!3749 lt!526655 (tuple2!18837 (select (arr!36452 _keys!1208) from!1455) (get!18583 (select (arr!36453 _values!996) from!1455) lt!526656)))))))

(declare-fun mapIsEmpty!45914 () Bool)

(declare-fun mapRes!45914 () Bool)

(assert (=> mapIsEmpty!45914 mapRes!45914))

(declare-fun b!1169567 () Bool)

(declare-fun e!664720 () Bool)

(assert (=> b!1169567 (= e!664716 e!664720)))

(declare-fun res!776070 () Bool)

(assert (=> b!1169567 (=> res!776070 e!664720)))

(assert (=> b!1169567 (= res!776070 (not (= (select (arr!36452 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1169568 () Bool)

(declare-fun res!776063 () Bool)

(assert (=> b!1169568 (=> (not res!776063) (not e!664717))))

(assert (=> b!1169568 (= res!776063 (arrayNoDuplicates!0 lt!526662 #b00000000000000000000000000000000 Nil!25571))))

(declare-fun b!1169569 () Bool)

(declare-fun e!664718 () Bool)

(declare-fun tp_is_empty!29391 () Bool)

(assert (=> b!1169569 (= e!664718 tp_is_empty!29391)))

(declare-fun b!1169571 () Bool)

(declare-fun e!664726 () Bool)

(assert (=> b!1169571 (= e!664726 tp_is_empty!29391)))

(declare-fun b!1169572 () Bool)

(assert (=> b!1169572 (= e!664719 e!664725)))

(declare-fun res!776073 () Bool)

(assert (=> b!1169572 (=> res!776073 e!664725)))

(assert (=> b!1169572 (= res!776073 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1169572 (= lt!526660 (getCurrentListMapNoExtraKeys!4882 lt!526662 lt!526659 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1169572 (= lt!526659 (array!75608 (store (arr!36453 _values!996) i!673 (ValueCellFull!13986 lt!526656)) (size!36989 _values!996)))))

(declare-fun dynLambda!2859 (Int (_ BitVec 64)) V!44315)

(assert (=> b!1169572 (= lt!526656 (dynLambda!2859 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526653 () ListLongMap!16805)

(assert (=> b!1169572 (= lt!526653 (getCurrentListMapNoExtraKeys!4882 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169573 () Bool)

(declare-fun res!776072 () Bool)

(assert (=> b!1169573 (=> (not res!776072) (not e!664724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169573 (= res!776072 (validMask!0 mask!1564))))

(declare-fun b!1169574 () Bool)

(assert (=> b!1169574 (= e!664724 e!664717)))

(declare-fun res!776068 () Bool)

(assert (=> b!1169574 (=> (not res!776068) (not e!664717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75605 (_ BitVec 32)) Bool)

(assert (=> b!1169574 (= res!776068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526662 mask!1564))))

(assert (=> b!1169574 (= lt!526662 (array!75606 (store (arr!36452 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36988 _keys!1208)))))

(declare-fun b!1169575 () Bool)

(assert (=> b!1169575 (= e!664720 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169570 () Bool)

(declare-fun res!776071 () Bool)

(assert (=> b!1169570 (=> (not res!776071) (not e!664724))))

(assert (=> b!1169570 (= res!776071 (= (select (arr!36452 _keys!1208) i!673) k0!934))))

(declare-fun res!776065 () Bool)

(assert (=> start!99282 (=> (not res!776065) (not e!664724))))

(assert (=> start!99282 (= res!776065 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36988 _keys!1208))))))

(assert (=> start!99282 e!664724))

(assert (=> start!99282 tp_is_empty!29391))

(declare-fun array_inv!27860 (array!75605) Bool)

(assert (=> start!99282 (array_inv!27860 _keys!1208)))

(assert (=> start!99282 true))

(assert (=> start!99282 tp!87297))

(declare-fun e!664723 () Bool)

(declare-fun array_inv!27861 (array!75607) Bool)

(assert (=> start!99282 (and (array_inv!27861 _values!996) e!664723)))

(declare-fun b!1169576 () Bool)

(declare-fun res!776075 () Bool)

(assert (=> b!1169576 (=> (not res!776075) (not e!664724))))

(assert (=> b!1169576 (= res!776075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169577 () Bool)

(assert (=> b!1169577 (= e!664723 (and e!664718 mapRes!45914))))

(declare-fun condMapEmpty!45914 () Bool)

(declare-fun mapDefault!45914 () ValueCell!13986)

(assert (=> b!1169577 (= condMapEmpty!45914 (= (arr!36453 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13986)) mapDefault!45914)))))

(declare-fun mapNonEmpty!45914 () Bool)

(declare-fun tp!87296 () Bool)

(assert (=> mapNonEmpty!45914 (= mapRes!45914 (and tp!87296 e!664726))))

(declare-fun mapRest!45914 () (Array (_ BitVec 32) ValueCell!13986))

(declare-fun mapKey!45914 () (_ BitVec 32))

(declare-fun mapValue!45914 () ValueCell!13986)

(assert (=> mapNonEmpty!45914 (= (arr!36453 _values!996) (store mapRest!45914 mapKey!45914 mapValue!45914))))

(declare-fun b!1169578 () Bool)

(declare-fun res!776076 () Bool)

(assert (=> b!1169578 (=> (not res!776076) (not e!664724))))

(assert (=> b!1169578 (= res!776076 (validKeyInArray!0 k0!934))))

(declare-fun b!1169579 () Bool)

(declare-fun res!776067 () Bool)

(assert (=> b!1169579 (=> (not res!776067) (not e!664724))))

(assert (=> b!1169579 (= res!776067 (and (= (size!36989 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36988 _keys!1208) (size!36989 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99282 res!776065) b!1169573))

(assert (= (and b!1169573 res!776072) b!1169579))

(assert (= (and b!1169579 res!776067) b!1169576))

(assert (= (and b!1169576 res!776075) b!1169565))

(assert (= (and b!1169565 res!776069) b!1169563))

(assert (= (and b!1169563 res!776077) b!1169578))

(assert (= (and b!1169578 res!776076) b!1169570))

(assert (= (and b!1169570 res!776071) b!1169574))

(assert (= (and b!1169574 res!776068) b!1169568))

(assert (= (and b!1169568 res!776063) b!1169562))

(assert (= (and b!1169562 (not res!776066)) b!1169572))

(assert (= (and b!1169572 (not res!776073)) b!1169564))

(assert (= (and b!1169564 (not res!776074)) b!1169566))

(assert (= (and b!1169566 res!776064) b!1169567))

(assert (= (and b!1169567 (not res!776070)) b!1169575))

(assert (= (and b!1169577 condMapEmpty!45914) mapIsEmpty!45914))

(assert (= (and b!1169577 (not condMapEmpty!45914)) mapNonEmpty!45914))

(get-info :version)

(assert (= (and mapNonEmpty!45914 ((_ is ValueCellFull!13986) mapValue!45914)) b!1169571))

(assert (= (and b!1169577 ((_ is ValueCellFull!13986) mapDefault!45914)) b!1169569))

(assert (= start!99282 b!1169577))

(declare-fun b_lambda!20005 () Bool)

(assert (=> (not b_lambda!20005) (not b!1169572)))

(declare-fun t!37425 () Bool)

(declare-fun tb!9673 () Bool)

(assert (=> (and start!99282 (= defaultEntry!1004 defaultEntry!1004) t!37425) tb!9673))

(declare-fun result!19913 () Bool)

(assert (=> tb!9673 (= result!19913 tp_is_empty!29391)))

(assert (=> b!1169572 t!37425))

(declare-fun b_and!40591 () Bool)

(assert (= b_and!40589 (and (=> t!37425 result!19913) b_and!40591)))

(declare-fun m!1077417 () Bool)

(assert (=> b!1169565 m!1077417))

(declare-fun m!1077419 () Bool)

(assert (=> start!99282 m!1077419))

(declare-fun m!1077421 () Bool)

(assert (=> start!99282 m!1077421))

(declare-fun m!1077423 () Bool)

(assert (=> b!1169562 m!1077423))

(declare-fun m!1077425 () Bool)

(assert (=> b!1169562 m!1077425))

(declare-fun m!1077427 () Bool)

(assert (=> b!1169564 m!1077427))

(declare-fun m!1077429 () Bool)

(assert (=> b!1169564 m!1077429))

(declare-fun m!1077431 () Bool)

(assert (=> b!1169564 m!1077431))

(declare-fun m!1077433 () Bool)

(assert (=> b!1169564 m!1077433))

(assert (=> b!1169564 m!1077433))

(declare-fun m!1077435 () Bool)

(assert (=> b!1169564 m!1077435))

(declare-fun m!1077437 () Bool)

(assert (=> b!1169564 m!1077437))

(assert (=> b!1169566 m!1077433))

(declare-fun m!1077439 () Bool)

(assert (=> b!1169566 m!1077439))

(assert (=> b!1169566 m!1077439))

(declare-fun m!1077441 () Bool)

(assert (=> b!1169566 m!1077441))

(declare-fun m!1077443 () Bool)

(assert (=> b!1169566 m!1077443))

(declare-fun m!1077445 () Bool)

(assert (=> mapNonEmpty!45914 m!1077445))

(declare-fun m!1077447 () Bool)

(assert (=> b!1169573 m!1077447))

(declare-fun m!1077449 () Bool)

(assert (=> b!1169570 m!1077449))

(declare-fun m!1077451 () Bool)

(assert (=> b!1169574 m!1077451))

(declare-fun m!1077453 () Bool)

(assert (=> b!1169574 m!1077453))

(declare-fun m!1077455 () Bool)

(assert (=> b!1169578 m!1077455))

(declare-fun m!1077457 () Bool)

(assert (=> b!1169575 m!1077457))

(declare-fun m!1077459 () Bool)

(assert (=> b!1169572 m!1077459))

(declare-fun m!1077461 () Bool)

(assert (=> b!1169572 m!1077461))

(declare-fun m!1077463 () Bool)

(assert (=> b!1169572 m!1077463))

(declare-fun m!1077465 () Bool)

(assert (=> b!1169572 m!1077465))

(declare-fun m!1077467 () Bool)

(assert (=> b!1169568 m!1077467))

(assert (=> b!1169567 m!1077433))

(declare-fun m!1077469 () Bool)

(assert (=> b!1169576 m!1077469))

(check-sat (not b!1169575) (not b!1169573) (not b!1169564) (not b!1169572) (not b!1169568) (not b!1169576) b_and!40591 (not b!1169574) (not b_lambda!20005) (not b!1169566) (not start!99282) tp_is_empty!29391 (not mapNonEmpty!45914) (not b_next!24861) (not b!1169562) (not b!1169578) (not b!1169565))
(check-sat b_and!40591 (not b_next!24861))
