; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99498 () Bool)

(assert start!99498)

(declare-fun b_free!24841 () Bool)

(declare-fun b_next!24841 () Bool)

(assert (=> start!99498 (= b_free!24841 (not b_next!24841))))

(declare-fun tp!87237 () Bool)

(declare-fun b_and!40551 () Bool)

(assert (=> start!99498 (= tp!87237 b_and!40551)))

(declare-fun mapIsEmpty!45884 () Bool)

(declare-fun mapRes!45884 () Bool)

(assert (=> mapIsEmpty!45884 mapRes!45884))

(declare-fun res!776123 () Bool)

(declare-fun e!665218 () Bool)

(assert (=> start!99498 (=> (not res!776123) (not e!665218))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75615 0))(
  ( (array!75616 (arr!36451 (Array (_ BitVec 32) (_ BitVec 64))) (size!36988 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75615)

(assert (=> start!99498 (= res!776123 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36988 _keys!1208))))))

(assert (=> start!99498 e!665218))

(declare-fun tp_is_empty!29371 () Bool)

(assert (=> start!99498 tp_is_empty!29371))

(declare-fun array_inv!27934 (array!75615) Bool)

(assert (=> start!99498 (array_inv!27934 _keys!1208)))

(assert (=> start!99498 true))

(assert (=> start!99498 tp!87237))

(declare-datatypes ((V!44289 0))(
  ( (V!44290 (val!14742 Int)) )
))
(declare-datatypes ((ValueCell!13976 0))(
  ( (ValueCellFull!13976 (v!17376 V!44289)) (EmptyCell!13976) )
))
(declare-datatypes ((array!75617 0))(
  ( (array!75618 (arr!36452 (Array (_ BitVec 32) ValueCell!13976)) (size!36989 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75617)

(declare-fun e!665219 () Bool)

(declare-fun array_inv!27935 (array!75617) Bool)

(assert (=> start!99498 (and (array_inv!27935 _values!996) e!665219)))

(declare-fun b!1170291 () Bool)

(declare-fun e!665226 () Bool)

(assert (=> b!1170291 (= e!665226 tp_is_empty!29371)))

(declare-fun b!1170292 () Bool)

(declare-fun res!776127 () Bool)

(assert (=> b!1170292 (=> (not res!776127) (not e!665218))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1170292 (= res!776127 (and (= (size!36989 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36988 _keys!1208) (size!36989 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170293 () Bool)

(declare-fun res!776131 () Bool)

(assert (=> b!1170293 (=> (not res!776131) (not e!665218))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170293 (= res!776131 (validKeyInArray!0 k0!934))))

(declare-fun b!1170294 () Bool)

(declare-fun e!665228 () Bool)

(assert (=> b!1170294 (= e!665218 e!665228)))

(declare-fun res!776133 () Bool)

(assert (=> b!1170294 (=> (not res!776133) (not e!665228))))

(declare-fun lt!526837 () array!75615)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75615 (_ BitVec 32)) Bool)

(assert (=> b!1170294 (= res!776133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526837 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170294 (= lt!526837 (array!75616 (store (arr!36451 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36988 _keys!1208)))))

(declare-fun b!1170295 () Bool)

(declare-fun e!665223 () Bool)

(assert (=> b!1170295 (= e!665228 (not e!665223))))

(declare-fun res!776129 () Bool)

(assert (=> b!1170295 (=> res!776129 e!665223)))

(assert (=> b!1170295 (= res!776129 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170295 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38547 0))(
  ( (Unit!38548) )
))
(declare-fun lt!526844 () Unit!38547)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75615 (_ BitVec 64) (_ BitVec 32)) Unit!38547)

(assert (=> b!1170295 (= lt!526844 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170296 () Bool)

(declare-fun res!776126 () Bool)

(assert (=> b!1170296 (=> (not res!776126) (not e!665228))))

(declare-datatypes ((List!25586 0))(
  ( (Nil!25583) (Cons!25582 (h!26800 (_ BitVec 64)) (t!37411 List!25586)) )
))
(declare-fun arrayNoDuplicates!0 (array!75615 (_ BitVec 32) List!25586) Bool)

(assert (=> b!1170296 (= res!776126 (arrayNoDuplicates!0 lt!526837 #b00000000000000000000000000000000 Nil!25583))))

(declare-fun b!1170297 () Bool)

(declare-fun res!776135 () Bool)

(assert (=> b!1170297 (=> (not res!776135) (not e!665218))))

(assert (=> b!1170297 (= res!776135 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36988 _keys!1208))))))

(declare-fun b!1170298 () Bool)

(declare-fun res!776122 () Bool)

(assert (=> b!1170298 (=> (not res!776122) (not e!665218))))

(assert (=> b!1170298 (= res!776122 (= (select (arr!36451 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45884 () Bool)

(declare-fun tp!87236 () Bool)

(declare-fun e!665224 () Bool)

(assert (=> mapNonEmpty!45884 (= mapRes!45884 (and tp!87236 e!665224))))

(declare-fun mapRest!45884 () (Array (_ BitVec 32) ValueCell!13976))

(declare-fun mapKey!45884 () (_ BitVec 32))

(declare-fun mapValue!45884 () ValueCell!13976)

(assert (=> mapNonEmpty!45884 (= (arr!36452 _values!996) (store mapRest!45884 mapKey!45884 mapValue!45884))))

(declare-fun b!1170299 () Bool)

(declare-fun e!665222 () Bool)

(declare-fun e!665221 () Bool)

(assert (=> b!1170299 (= e!665222 e!665221)))

(declare-fun res!776134 () Bool)

(assert (=> b!1170299 (=> res!776134 e!665221)))

(assert (=> b!1170299 (= res!776134 (not (= (select (arr!36451 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170300 () Bool)

(declare-fun e!665225 () Bool)

(assert (=> b!1170300 (= e!665223 e!665225)))

(declare-fun res!776125 () Bool)

(assert (=> b!1170300 (=> res!776125 e!665225)))

(assert (=> b!1170300 (= res!776125 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44289)

(declare-fun lt!526845 () array!75617)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18848 0))(
  ( (tuple2!18849 (_1!9435 (_ BitVec 64)) (_2!9435 V!44289)) )
))
(declare-datatypes ((List!25587 0))(
  ( (Nil!25584) (Cons!25583 (h!26801 tuple2!18848) (t!37412 List!25587)) )
))
(declare-datatypes ((ListLongMap!16825 0))(
  ( (ListLongMap!16826 (toList!8428 List!25587)) )
))
(declare-fun lt!526839 () ListLongMap!16825)

(declare-fun minValue!944 () V!44289)

(declare-fun getCurrentListMapNoExtraKeys!4918 (array!75615 array!75617 (_ BitVec 32) (_ BitVec 32) V!44289 V!44289 (_ BitVec 32) Int) ListLongMap!16825)

(assert (=> b!1170300 (= lt!526839 (getCurrentListMapNoExtraKeys!4918 lt!526837 lt!526845 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526841 () V!44289)

(assert (=> b!1170300 (= lt!526845 (array!75618 (store (arr!36452 _values!996) i!673 (ValueCellFull!13976 lt!526841)) (size!36989 _values!996)))))

(declare-fun dynLambda!2903 (Int (_ BitVec 64)) V!44289)

(assert (=> b!1170300 (= lt!526841 (dynLambda!2903 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526842 () ListLongMap!16825)

(assert (=> b!1170300 (= lt!526842 (getCurrentListMapNoExtraKeys!4918 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170301 () Bool)

(assert (=> b!1170301 (= e!665224 tp_is_empty!29371)))

(declare-fun b!1170302 () Bool)

(assert (=> b!1170302 (= e!665219 (and e!665226 mapRes!45884))))

(declare-fun condMapEmpty!45884 () Bool)

(declare-fun mapDefault!45884 () ValueCell!13976)

(assert (=> b!1170302 (= condMapEmpty!45884 (= (arr!36452 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13976)) mapDefault!45884)))))

(declare-fun b!1170303 () Bool)

(declare-fun res!776132 () Bool)

(assert (=> b!1170303 (=> (not res!776132) (not e!665218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170303 (= res!776132 (validMask!0 mask!1564))))

(declare-fun b!1170304 () Bool)

(declare-fun e!665227 () Bool)

(assert (=> b!1170304 (= e!665227 true)))

(assert (=> b!1170304 e!665222))

(declare-fun res!776128 () Bool)

(assert (=> b!1170304 (=> (not res!776128) (not e!665222))))

(declare-fun lt!526843 () ListLongMap!16825)

(declare-fun +!3772 (ListLongMap!16825 tuple2!18848) ListLongMap!16825)

(declare-fun get!18604 (ValueCell!13976 V!44289) V!44289)

(assert (=> b!1170304 (= res!776128 (= lt!526839 (+!3772 lt!526843 (tuple2!18849 (select (arr!36451 _keys!1208) from!1455) (get!18604 (select (arr!36452 _values!996) from!1455) lt!526841)))))))

(declare-fun b!1170305 () Bool)

(declare-fun res!776124 () Bool)

(assert (=> b!1170305 (=> (not res!776124) (not e!665218))))

(assert (=> b!1170305 (= res!776124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170306 () Bool)

(declare-fun res!776130 () Bool)

(assert (=> b!1170306 (=> (not res!776130) (not e!665218))))

(assert (=> b!1170306 (= res!776130 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25583))))

(declare-fun b!1170307 () Bool)

(assert (=> b!1170307 (= e!665221 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170308 () Bool)

(assert (=> b!1170308 (= e!665225 e!665227)))

(declare-fun res!776121 () Bool)

(assert (=> b!1170308 (=> res!776121 e!665227)))

(assert (=> b!1170308 (= res!776121 (not (validKeyInArray!0 (select (arr!36451 _keys!1208) from!1455))))))

(declare-fun lt!526840 () ListLongMap!16825)

(assert (=> b!1170308 (= lt!526840 lt!526843)))

(declare-fun lt!526846 () ListLongMap!16825)

(declare-fun -!1487 (ListLongMap!16825 (_ BitVec 64)) ListLongMap!16825)

(assert (=> b!1170308 (= lt!526843 (-!1487 lt!526846 k0!934))))

(assert (=> b!1170308 (= lt!526840 (getCurrentListMapNoExtraKeys!4918 lt!526837 lt!526845 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170308 (= lt!526846 (getCurrentListMapNoExtraKeys!4918 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526838 () Unit!38547)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!712 (array!75615 array!75617 (_ BitVec 32) (_ BitVec 32) V!44289 V!44289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38547)

(assert (=> b!1170308 (= lt!526838 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!712 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99498 res!776123) b!1170303))

(assert (= (and b!1170303 res!776132) b!1170292))

(assert (= (and b!1170292 res!776127) b!1170305))

(assert (= (and b!1170305 res!776124) b!1170306))

(assert (= (and b!1170306 res!776130) b!1170297))

(assert (= (and b!1170297 res!776135) b!1170293))

(assert (= (and b!1170293 res!776131) b!1170298))

(assert (= (and b!1170298 res!776122) b!1170294))

(assert (= (and b!1170294 res!776133) b!1170296))

(assert (= (and b!1170296 res!776126) b!1170295))

(assert (= (and b!1170295 (not res!776129)) b!1170300))

(assert (= (and b!1170300 (not res!776125)) b!1170308))

(assert (= (and b!1170308 (not res!776121)) b!1170304))

(assert (= (and b!1170304 res!776128) b!1170299))

(assert (= (and b!1170299 (not res!776134)) b!1170307))

(assert (= (and b!1170302 condMapEmpty!45884) mapIsEmpty!45884))

(assert (= (and b!1170302 (not condMapEmpty!45884)) mapNonEmpty!45884))

(get-info :version)

(assert (= (and mapNonEmpty!45884 ((_ is ValueCellFull!13976) mapValue!45884)) b!1170301))

(assert (= (and b!1170302 ((_ is ValueCellFull!13976) mapDefault!45884)) b!1170291))

(assert (= start!99498 b!1170302))

(declare-fun b_lambda!19979 () Bool)

(assert (=> (not b_lambda!19979) (not b!1170300)))

(declare-fun t!37410 () Bool)

(declare-fun tb!9645 () Bool)

(assert (=> (and start!99498 (= defaultEntry!1004 defaultEntry!1004) t!37410) tb!9645))

(declare-fun result!19865 () Bool)

(assert (=> tb!9645 (= result!19865 tp_is_empty!29371)))

(assert (=> b!1170300 t!37410))

(declare-fun b_and!40553 () Bool)

(assert (= b_and!40551 (and (=> t!37410 result!19865) b_and!40553)))

(declare-fun m!1078449 () Bool)

(assert (=> b!1170300 m!1078449))

(declare-fun m!1078451 () Bool)

(assert (=> b!1170300 m!1078451))

(declare-fun m!1078453 () Bool)

(assert (=> b!1170300 m!1078453))

(declare-fun m!1078455 () Bool)

(assert (=> b!1170300 m!1078455))

(declare-fun m!1078457 () Bool)

(assert (=> b!1170304 m!1078457))

(declare-fun m!1078459 () Bool)

(assert (=> b!1170304 m!1078459))

(assert (=> b!1170304 m!1078459))

(declare-fun m!1078461 () Bool)

(assert (=> b!1170304 m!1078461))

(declare-fun m!1078463 () Bool)

(assert (=> b!1170304 m!1078463))

(declare-fun m!1078465 () Bool)

(assert (=> b!1170294 m!1078465))

(declare-fun m!1078467 () Bool)

(assert (=> b!1170294 m!1078467))

(declare-fun m!1078469 () Bool)

(assert (=> b!1170303 m!1078469))

(assert (=> b!1170299 m!1078457))

(declare-fun m!1078471 () Bool)

(assert (=> b!1170305 m!1078471))

(declare-fun m!1078473 () Bool)

(assert (=> mapNonEmpty!45884 m!1078473))

(declare-fun m!1078475 () Bool)

(assert (=> b!1170293 m!1078475))

(declare-fun m!1078477 () Bool)

(assert (=> start!99498 m!1078477))

(declare-fun m!1078479 () Bool)

(assert (=> start!99498 m!1078479))

(declare-fun m!1078481 () Bool)

(assert (=> b!1170298 m!1078481))

(declare-fun m!1078483 () Bool)

(assert (=> b!1170308 m!1078483))

(declare-fun m!1078485 () Bool)

(assert (=> b!1170308 m!1078485))

(declare-fun m!1078487 () Bool)

(assert (=> b!1170308 m!1078487))

(assert (=> b!1170308 m!1078457))

(declare-fun m!1078489 () Bool)

(assert (=> b!1170308 m!1078489))

(declare-fun m!1078491 () Bool)

(assert (=> b!1170308 m!1078491))

(assert (=> b!1170308 m!1078457))

(declare-fun m!1078493 () Bool)

(assert (=> b!1170295 m!1078493))

(declare-fun m!1078495 () Bool)

(assert (=> b!1170295 m!1078495))

(declare-fun m!1078497 () Bool)

(assert (=> b!1170307 m!1078497))

(declare-fun m!1078499 () Bool)

(assert (=> b!1170296 m!1078499))

(declare-fun m!1078501 () Bool)

(assert (=> b!1170306 m!1078501))

(check-sat (not b!1170295) (not b!1170306) (not b!1170308) (not b_next!24841) (not b!1170294) (not b!1170293) (not b!1170296) b_and!40553 (not start!99498) (not b_lambda!19979) (not b!1170300) (not b!1170303) (not b!1170305) (not mapNonEmpty!45884) (not b!1170307) tp_is_empty!29371 (not b!1170304))
(check-sat b_and!40553 (not b_next!24841))
