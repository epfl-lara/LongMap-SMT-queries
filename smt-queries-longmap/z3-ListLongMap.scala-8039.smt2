; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99076 () Bool)

(assert start!99076)

(declare-fun b_free!24681 () Bool)

(declare-fun b_next!24681 () Bool)

(assert (=> start!99076 (= b_free!24681 (not b_next!24681))))

(declare-fun tp!86753 () Bool)

(declare-fun b_and!40211 () Bool)

(assert (=> start!99076 (= tp!86753 b_and!40211)))

(declare-fun b!1165106 () Bool)

(declare-fun res!772691 () Bool)

(declare-fun e!662381 () Bool)

(assert (=> b!1165106 (=> (not res!772691) (not e!662381))))

(declare-datatypes ((array!75253 0))(
  ( (array!75254 (arr!36277 (Array (_ BitVec 32) (_ BitVec 64))) (size!36813 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75253)

(declare-datatypes ((List!25432 0))(
  ( (Nil!25429) (Cons!25428 (h!26637 (_ BitVec 64)) (t!37105 List!25432)) )
))
(declare-fun arrayNoDuplicates!0 (array!75253 (_ BitVec 32) List!25432) Bool)

(assert (=> b!1165106 (= res!772691 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25429))))

(declare-fun b!1165107 () Bool)

(declare-fun e!662385 () Bool)

(assert (=> b!1165107 (= e!662381 e!662385)))

(declare-fun res!772687 () Bool)

(assert (=> b!1165107 (=> (not res!772687) (not e!662385))))

(declare-fun lt!524823 () array!75253)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75253 (_ BitVec 32)) Bool)

(assert (=> b!1165107 (= res!772687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524823 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165107 (= lt!524823 (array!75254 (store (arr!36277 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36813 _keys!1208)))))

(declare-fun b!1165108 () Bool)

(declare-fun res!772683 () Bool)

(assert (=> b!1165108 (=> (not res!772683) (not e!662381))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1165108 (= res!772683 (= (select (arr!36277 _keys!1208) i!673) k0!934))))

(declare-fun b!1165109 () Bool)

(declare-fun e!662379 () Bool)

(assert (=> b!1165109 (= e!662385 (not e!662379))))

(declare-fun res!772685 () Bool)

(assert (=> b!1165109 (=> res!772685 e!662379)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1165109 (= res!772685 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165109 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38448 0))(
  ( (Unit!38449) )
))
(declare-fun lt!524821 () Unit!38448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75253 (_ BitVec 64) (_ BitVec 32)) Unit!38448)

(assert (=> b!1165109 (= lt!524821 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165110 () Bool)

(assert (=> b!1165110 (= e!662379 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!44075 0))(
  ( (V!44076 (val!14662 Int)) )
))
(declare-datatypes ((ValueCell!13896 0))(
  ( (ValueCellFull!13896 (v!17299 V!44075)) (EmptyCell!13896) )
))
(declare-datatypes ((array!75255 0))(
  ( (array!75256 (arr!36278 (Array (_ BitVec 32) ValueCell!13896)) (size!36814 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75255)

(declare-fun minValue!944 () V!44075)

(declare-datatypes ((tuple2!18698 0))(
  ( (tuple2!18699 (_1!9360 (_ BitVec 64)) (_2!9360 V!44075)) )
))
(declare-datatypes ((List!25433 0))(
  ( (Nil!25430) (Cons!25429 (h!26638 tuple2!18698) (t!37106 List!25433)) )
))
(declare-datatypes ((ListLongMap!16667 0))(
  ( (ListLongMap!16668 (toList!8349 List!25433)) )
))
(declare-fun lt!524820 () ListLongMap!16667)

(declare-fun zeroValue!944 () V!44075)

(declare-fun getCurrentListMapNoExtraKeys!4813 (array!75253 array!75255 (_ BitVec 32) (_ BitVec 32) V!44075 V!44075 (_ BitVec 32) Int) ListLongMap!16667)

(declare-fun dynLambda!2803 (Int (_ BitVec 64)) V!44075)

(assert (=> b!1165110 (= lt!524820 (getCurrentListMapNoExtraKeys!4813 lt!524823 (array!75256 (store (arr!36278 _values!996) i!673 (ValueCellFull!13896 (dynLambda!2803 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36814 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524822 () ListLongMap!16667)

(assert (=> b!1165110 (= lt!524822 (getCurrentListMapNoExtraKeys!4813 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165111 () Bool)

(declare-fun res!772689 () Bool)

(assert (=> b!1165111 (=> (not res!772689) (not e!662381))))

(assert (=> b!1165111 (= res!772689 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36813 _keys!1208))))))

(declare-fun b!1165112 () Bool)

(declare-fun res!772688 () Bool)

(assert (=> b!1165112 (=> (not res!772688) (not e!662381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165112 (= res!772688 (validMask!0 mask!1564))))

(declare-fun b!1165113 () Bool)

(declare-fun res!772686 () Bool)

(assert (=> b!1165113 (=> (not res!772686) (not e!662385))))

(assert (=> b!1165113 (= res!772686 (arrayNoDuplicates!0 lt!524823 #b00000000000000000000000000000000 Nil!25429))))

(declare-fun b!1165114 () Bool)

(declare-fun res!772684 () Bool)

(assert (=> b!1165114 (=> (not res!772684) (not e!662381))))

(assert (=> b!1165114 (= res!772684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45641 () Bool)

(declare-fun mapRes!45641 () Bool)

(assert (=> mapIsEmpty!45641 mapRes!45641))

(declare-fun b!1165115 () Bool)

(declare-fun res!772690 () Bool)

(assert (=> b!1165115 (=> (not res!772690) (not e!662381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165115 (= res!772690 (validKeyInArray!0 k0!934))))

(declare-fun b!1165116 () Bool)

(declare-fun e!662384 () Bool)

(declare-fun tp_is_empty!29211 () Bool)

(assert (=> b!1165116 (= e!662384 tp_is_empty!29211)))

(declare-fun mapNonEmpty!45641 () Bool)

(declare-fun tp!86754 () Bool)

(assert (=> mapNonEmpty!45641 (= mapRes!45641 (and tp!86754 e!662384))))

(declare-fun mapValue!45641 () ValueCell!13896)

(declare-fun mapKey!45641 () (_ BitVec 32))

(declare-fun mapRest!45641 () (Array (_ BitVec 32) ValueCell!13896))

(assert (=> mapNonEmpty!45641 (= (arr!36278 _values!996) (store mapRest!45641 mapKey!45641 mapValue!45641))))

(declare-fun res!772682 () Bool)

(assert (=> start!99076 (=> (not res!772682) (not e!662381))))

(assert (=> start!99076 (= res!772682 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36813 _keys!1208))))))

(assert (=> start!99076 e!662381))

(assert (=> start!99076 tp_is_empty!29211))

(declare-fun array_inv!27750 (array!75253) Bool)

(assert (=> start!99076 (array_inv!27750 _keys!1208)))

(assert (=> start!99076 true))

(assert (=> start!99076 tp!86753))

(declare-fun e!662382 () Bool)

(declare-fun array_inv!27751 (array!75255) Bool)

(assert (=> start!99076 (and (array_inv!27751 _values!996) e!662382)))

(declare-fun b!1165117 () Bool)

(declare-fun res!772681 () Bool)

(assert (=> b!1165117 (=> (not res!772681) (not e!662381))))

(assert (=> b!1165117 (= res!772681 (and (= (size!36814 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36813 _keys!1208) (size!36814 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165118 () Bool)

(declare-fun e!662383 () Bool)

(assert (=> b!1165118 (= e!662383 tp_is_empty!29211)))

(declare-fun b!1165119 () Bool)

(assert (=> b!1165119 (= e!662382 (and e!662383 mapRes!45641))))

(declare-fun condMapEmpty!45641 () Bool)

(declare-fun mapDefault!45641 () ValueCell!13896)

(assert (=> b!1165119 (= condMapEmpty!45641 (= (arr!36278 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13896)) mapDefault!45641)))))

(assert (= (and start!99076 res!772682) b!1165112))

(assert (= (and b!1165112 res!772688) b!1165117))

(assert (= (and b!1165117 res!772681) b!1165114))

(assert (= (and b!1165114 res!772684) b!1165106))

(assert (= (and b!1165106 res!772691) b!1165111))

(assert (= (and b!1165111 res!772689) b!1165115))

(assert (= (and b!1165115 res!772690) b!1165108))

(assert (= (and b!1165108 res!772683) b!1165107))

(assert (= (and b!1165107 res!772687) b!1165113))

(assert (= (and b!1165113 res!772686) b!1165109))

(assert (= (and b!1165109 (not res!772685)) b!1165110))

(assert (= (and b!1165119 condMapEmpty!45641) mapIsEmpty!45641))

(assert (= (and b!1165119 (not condMapEmpty!45641)) mapNonEmpty!45641))

(get-info :version)

(assert (= (and mapNonEmpty!45641 ((_ is ValueCellFull!13896) mapValue!45641)) b!1165116))

(assert (= (and b!1165119 ((_ is ValueCellFull!13896) mapDefault!45641)) b!1165118))

(assert (= start!99076 b!1165119))

(declare-fun b_lambda!19787 () Bool)

(assert (=> (not b_lambda!19787) (not b!1165110)))

(declare-fun t!37104 () Bool)

(declare-fun tb!9493 () Bool)

(assert (=> (and start!99076 (= defaultEntry!1004 defaultEntry!1004) t!37104) tb!9493))

(declare-fun result!19551 () Bool)

(assert (=> tb!9493 (= result!19551 tp_is_empty!29211)))

(assert (=> b!1165110 t!37104))

(declare-fun b_and!40213 () Bool)

(assert (= b_and!40211 (and (=> t!37104 result!19551) b_and!40213)))

(declare-fun m!1073379 () Bool)

(assert (=> b!1165107 m!1073379))

(declare-fun m!1073381 () Bool)

(assert (=> b!1165107 m!1073381))

(declare-fun m!1073383 () Bool)

(assert (=> b!1165115 m!1073383))

(declare-fun m!1073385 () Bool)

(assert (=> b!1165108 m!1073385))

(declare-fun m!1073387 () Bool)

(assert (=> b!1165113 m!1073387))

(declare-fun m!1073389 () Bool)

(assert (=> mapNonEmpty!45641 m!1073389))

(declare-fun m!1073391 () Bool)

(assert (=> b!1165110 m!1073391))

(declare-fun m!1073393 () Bool)

(assert (=> b!1165110 m!1073393))

(declare-fun m!1073395 () Bool)

(assert (=> b!1165110 m!1073395))

(declare-fun m!1073397 () Bool)

(assert (=> b!1165110 m!1073397))

(declare-fun m!1073399 () Bool)

(assert (=> b!1165112 m!1073399))

(declare-fun m!1073401 () Bool)

(assert (=> start!99076 m!1073401))

(declare-fun m!1073403 () Bool)

(assert (=> start!99076 m!1073403))

(declare-fun m!1073405 () Bool)

(assert (=> b!1165106 m!1073405))

(declare-fun m!1073407 () Bool)

(assert (=> b!1165114 m!1073407))

(declare-fun m!1073409 () Bool)

(assert (=> b!1165109 m!1073409))

(declare-fun m!1073411 () Bool)

(assert (=> b!1165109 m!1073411))

(check-sat (not start!99076) b_and!40213 (not b!1165112) (not b!1165113) (not b!1165114) (not b_next!24681) (not b!1165109) (not b!1165115) (not mapNonEmpty!45641) (not b!1165107) (not b!1165106) (not b_lambda!19787) tp_is_empty!29211 (not b!1165110))
(check-sat b_and!40213 (not b_next!24681))
