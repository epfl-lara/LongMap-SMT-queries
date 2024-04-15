; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99092 () Bool)

(assert start!99092)

(declare-fun b_free!24703 () Bool)

(declare-fun b_next!24703 () Bool)

(assert (=> start!99092 (= b_free!24703 (not b_next!24703))))

(declare-fun tp!86819 () Bool)

(declare-fun b_and!40233 () Bool)

(assert (=> start!99092 (= tp!86819 b_and!40233)))

(declare-fun mapIsEmpty!45674 () Bool)

(declare-fun mapRes!45674 () Bool)

(assert (=> mapIsEmpty!45674 mapRes!45674))

(declare-fun b!1165466 () Bool)

(declare-fun res!772987 () Bool)

(declare-fun e!662537 () Bool)

(assert (=> b!1165466 (=> (not res!772987) (not e!662537))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165466 (= res!772987 (validKeyInArray!0 k0!934))))

(declare-fun b!1165467 () Bool)

(declare-fun res!772978 () Bool)

(assert (=> b!1165467 (=> (not res!772978) (not e!662537))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165467 (= res!772978 (validMask!0 mask!1564))))

(declare-fun b!1165468 () Bool)

(declare-fun e!662535 () Bool)

(assert (=> b!1165468 (= e!662535 true)))

(declare-datatypes ((V!44105 0))(
  ( (V!44106 (val!14673 Int)) )
))
(declare-fun zeroValue!944 () V!44105)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!75220 0))(
  ( (array!75221 (arr!36261 (Array (_ BitVec 32) (_ BitVec 64))) (size!36799 (_ BitVec 32))) )
))
(declare-fun lt!524760 () array!75220)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13907 0))(
  ( (ValueCellFull!13907 (v!17309 V!44105)) (EmptyCell!13907) )
))
(declare-datatypes ((array!75222 0))(
  ( (array!75223 (arr!36262 (Array (_ BitVec 32) ValueCell!13907)) (size!36800 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75222)

(declare-fun minValue!944 () V!44105)

(declare-datatypes ((tuple2!18798 0))(
  ( (tuple2!18799 (_1!9410 (_ BitVec 64)) (_2!9410 V!44105)) )
))
(declare-datatypes ((List!25516 0))(
  ( (Nil!25513) (Cons!25512 (h!26721 tuple2!18798) (t!37202 List!25516)) )
))
(declare-datatypes ((ListLongMap!16767 0))(
  ( (ListLongMap!16768 (toList!8399 List!25516)) )
))
(declare-fun lt!524762 () ListLongMap!16767)

(declare-fun getCurrentListMapNoExtraKeys!4875 (array!75220 array!75222 (_ BitVec 32) (_ BitVec 32) V!44105 V!44105 (_ BitVec 32) Int) ListLongMap!16767)

(declare-fun dynLambda!2808 (Int (_ BitVec 64)) V!44105)

(assert (=> b!1165468 (= lt!524762 (getCurrentListMapNoExtraKeys!4875 lt!524760 (array!75223 (store (arr!36262 _values!996) i!673 (ValueCellFull!13907 (dynLambda!2808 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36800 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!75220)

(declare-fun lt!524763 () ListLongMap!16767)

(assert (=> b!1165468 (= lt!524763 (getCurrentListMapNoExtraKeys!4875 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165469 () Bool)

(declare-fun e!662532 () Bool)

(declare-fun tp_is_empty!29233 () Bool)

(assert (=> b!1165469 (= e!662532 tp_is_empty!29233)))

(declare-fun mapNonEmpty!45674 () Bool)

(declare-fun tp!86820 () Bool)

(assert (=> mapNonEmpty!45674 (= mapRes!45674 (and tp!86820 e!662532))))

(declare-fun mapValue!45674 () ValueCell!13907)

(declare-fun mapRest!45674 () (Array (_ BitVec 32) ValueCell!13907))

(declare-fun mapKey!45674 () (_ BitVec 32))

(assert (=> mapNonEmpty!45674 (= (arr!36262 _values!996) (store mapRest!45674 mapKey!45674 mapValue!45674))))

(declare-fun b!1165470 () Bool)

(declare-fun res!772988 () Bool)

(assert (=> b!1165470 (=> (not res!772988) (not e!662537))))

(assert (=> b!1165470 (= res!772988 (and (= (size!36800 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36799 _keys!1208) (size!36800 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165471 () Bool)

(declare-fun e!662533 () Bool)

(assert (=> b!1165471 (= e!662537 e!662533)))

(declare-fun res!772982 () Bool)

(assert (=> b!1165471 (=> (not res!772982) (not e!662533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75220 (_ BitVec 32)) Bool)

(assert (=> b!1165471 (= res!772982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524760 mask!1564))))

(assert (=> b!1165471 (= lt!524760 (array!75221 (store (arr!36261 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36799 _keys!1208)))))

(declare-fun b!1165472 () Bool)

(declare-fun res!772985 () Bool)

(assert (=> b!1165472 (=> (not res!772985) (not e!662537))))

(declare-datatypes ((List!25517 0))(
  ( (Nil!25514) (Cons!25513 (h!26722 (_ BitVec 64)) (t!37203 List!25517)) )
))
(declare-fun arrayNoDuplicates!0 (array!75220 (_ BitVec 32) List!25517) Bool)

(assert (=> b!1165472 (= res!772985 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25514))))

(declare-fun res!772986 () Bool)

(assert (=> start!99092 (=> (not res!772986) (not e!662537))))

(assert (=> start!99092 (= res!772986 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36799 _keys!1208))))))

(assert (=> start!99092 e!662537))

(assert (=> start!99092 tp_is_empty!29233))

(declare-fun array_inv!27834 (array!75220) Bool)

(assert (=> start!99092 (array_inv!27834 _keys!1208)))

(assert (=> start!99092 true))

(assert (=> start!99092 tp!86819))

(declare-fun e!662534 () Bool)

(declare-fun array_inv!27835 (array!75222) Bool)

(assert (=> start!99092 (and (array_inv!27835 _values!996) e!662534)))

(declare-fun b!1165473 () Bool)

(assert (=> b!1165473 (= e!662533 (not e!662535))))

(declare-fun res!772984 () Bool)

(assert (=> b!1165473 (=> res!772984 e!662535)))

(assert (=> b!1165473 (= res!772984 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165473 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38289 0))(
  ( (Unit!38290) )
))
(declare-fun lt!524761 () Unit!38289)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75220 (_ BitVec 64) (_ BitVec 32)) Unit!38289)

(assert (=> b!1165473 (= lt!524761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165474 () Bool)

(declare-fun res!772980 () Bool)

(assert (=> b!1165474 (=> (not res!772980) (not e!662537))))

(assert (=> b!1165474 (= res!772980 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36799 _keys!1208))))))

(declare-fun b!1165475 () Bool)

(declare-fun e!662538 () Bool)

(assert (=> b!1165475 (= e!662534 (and e!662538 mapRes!45674))))

(declare-fun condMapEmpty!45674 () Bool)

(declare-fun mapDefault!45674 () ValueCell!13907)

(assert (=> b!1165475 (= condMapEmpty!45674 (= (arr!36262 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13907)) mapDefault!45674)))))

(declare-fun b!1165476 () Bool)

(declare-fun res!772981 () Bool)

(assert (=> b!1165476 (=> (not res!772981) (not e!662533))))

(assert (=> b!1165476 (= res!772981 (arrayNoDuplicates!0 lt!524760 #b00000000000000000000000000000000 Nil!25514))))

(declare-fun b!1165477 () Bool)

(assert (=> b!1165477 (= e!662538 tp_is_empty!29233)))

(declare-fun b!1165478 () Bool)

(declare-fun res!772979 () Bool)

(assert (=> b!1165478 (=> (not res!772979) (not e!662537))))

(assert (=> b!1165478 (= res!772979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165479 () Bool)

(declare-fun res!772983 () Bool)

(assert (=> b!1165479 (=> (not res!772983) (not e!662537))))

(assert (=> b!1165479 (= res!772983 (= (select (arr!36261 _keys!1208) i!673) k0!934))))

(assert (= (and start!99092 res!772986) b!1165467))

(assert (= (and b!1165467 res!772978) b!1165470))

(assert (= (and b!1165470 res!772988) b!1165478))

(assert (= (and b!1165478 res!772979) b!1165472))

(assert (= (and b!1165472 res!772985) b!1165474))

(assert (= (and b!1165474 res!772980) b!1165466))

(assert (= (and b!1165466 res!772987) b!1165479))

(assert (= (and b!1165479 res!772983) b!1165471))

(assert (= (and b!1165471 res!772982) b!1165476))

(assert (= (and b!1165476 res!772981) b!1165473))

(assert (= (and b!1165473 (not res!772984)) b!1165468))

(assert (= (and b!1165475 condMapEmpty!45674) mapIsEmpty!45674))

(assert (= (and b!1165475 (not condMapEmpty!45674)) mapNonEmpty!45674))

(get-info :version)

(assert (= (and mapNonEmpty!45674 ((_ is ValueCellFull!13907) mapValue!45674)) b!1165469))

(assert (= (and b!1165475 ((_ is ValueCellFull!13907) mapDefault!45674)) b!1165477))

(assert (= start!99092 b!1165475))

(declare-fun b_lambda!19791 () Bool)

(assert (=> (not b_lambda!19791) (not b!1165468)))

(declare-fun t!37201 () Bool)

(declare-fun tb!9507 () Bool)

(assert (=> (and start!99092 (= defaultEntry!1004 defaultEntry!1004) t!37201) tb!9507))

(declare-fun result!19587 () Bool)

(assert (=> tb!9507 (= result!19587 tp_is_empty!29233)))

(assert (=> b!1165468 t!37201))

(declare-fun b_and!40235 () Bool)

(assert (= b_and!40233 (and (=> t!37201 result!19587) b_and!40235)))

(declare-fun m!1073143 () Bool)

(assert (=> b!1165478 m!1073143))

(declare-fun m!1073145 () Bool)

(assert (=> b!1165479 m!1073145))

(declare-fun m!1073147 () Bool)

(assert (=> start!99092 m!1073147))

(declare-fun m!1073149 () Bool)

(assert (=> start!99092 m!1073149))

(declare-fun m!1073151 () Bool)

(assert (=> mapNonEmpty!45674 m!1073151))

(declare-fun m!1073153 () Bool)

(assert (=> b!1165473 m!1073153))

(declare-fun m!1073155 () Bool)

(assert (=> b!1165473 m!1073155))

(declare-fun m!1073157 () Bool)

(assert (=> b!1165472 m!1073157))

(declare-fun m!1073159 () Bool)

(assert (=> b!1165476 m!1073159))

(declare-fun m!1073161 () Bool)

(assert (=> b!1165467 m!1073161))

(declare-fun m!1073163 () Bool)

(assert (=> b!1165468 m!1073163))

(declare-fun m!1073165 () Bool)

(assert (=> b!1165468 m!1073165))

(declare-fun m!1073167 () Bool)

(assert (=> b!1165468 m!1073167))

(declare-fun m!1073169 () Bool)

(assert (=> b!1165468 m!1073169))

(declare-fun m!1073171 () Bool)

(assert (=> b!1165466 m!1073171))

(declare-fun m!1073173 () Bool)

(assert (=> b!1165471 m!1073173))

(declare-fun m!1073175 () Bool)

(assert (=> b!1165471 m!1073175))

(check-sat (not b!1165468) (not b!1165467) (not b!1165472) b_and!40235 (not b_lambda!19791) (not b!1165476) (not b!1165473) (not b!1165471) tp_is_empty!29233 (not start!99092) (not b_next!24703) (not mapNonEmpty!45674) (not b!1165466) (not b!1165478))
(check-sat b_and!40235 (not b_next!24703))
