; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99316 () Bool)

(assert start!99316)

(declare-fun b_free!24685 () Bool)

(declare-fun b_next!24685 () Bool)

(assert (=> start!99316 (= b_free!24685 (not b_next!24685))))

(declare-fun tp!86765 () Bool)

(declare-fun b_and!40221 () Bool)

(assert (=> start!99316 (= tp!86765 b_and!40221)))

(declare-fun b!1166483 () Bool)

(declare-fun res!773259 () Bool)

(declare-fun e!663259 () Bool)

(assert (=> b!1166483 (=> (not res!773259) (not e!663259))))

(declare-datatypes ((array!75315 0))(
  ( (array!75316 (arr!36302 (Array (_ BitVec 32) (_ BitVec 64))) (size!36839 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75315)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75315 (_ BitVec 32)) Bool)

(assert (=> b!1166483 (= res!773259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166484 () Bool)

(declare-fun e!663255 () Bool)

(declare-fun tp_is_empty!29215 () Bool)

(assert (=> b!1166484 (= e!663255 tp_is_empty!29215)))

(declare-fun b!1166485 () Bool)

(declare-fun res!773255 () Bool)

(declare-fun e!663254 () Bool)

(assert (=> b!1166485 (=> (not res!773255) (not e!663254))))

(declare-fun lt!525329 () array!75315)

(declare-datatypes ((List!25473 0))(
  ( (Nil!25470) (Cons!25469 (h!26687 (_ BitVec 64)) (t!37142 List!25473)) )
))
(declare-fun arrayNoDuplicates!0 (array!75315 (_ BitVec 32) List!25473) Bool)

(assert (=> b!1166485 (= res!773255 (arrayNoDuplicates!0 lt!525329 #b00000000000000000000000000000000 Nil!25470))))

(declare-fun b!1166486 () Bool)

(declare-fun e!663257 () Bool)

(assert (=> b!1166486 (= e!663254 (not e!663257))))

(declare-fun res!773258 () Bool)

(assert (=> b!1166486 (=> res!773258 e!663257)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166486 (= res!773258 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166486 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38443 0))(
  ( (Unit!38444) )
))
(declare-fun lt!525331 () Unit!38443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75315 (_ BitVec 64) (_ BitVec 32)) Unit!38443)

(assert (=> b!1166486 (= lt!525331 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!773256 () Bool)

(assert (=> start!99316 (=> (not res!773256) (not e!663259))))

(assert (=> start!99316 (= res!773256 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36839 _keys!1208))))))

(assert (=> start!99316 e!663259))

(assert (=> start!99316 tp_is_empty!29215))

(declare-fun array_inv!27836 (array!75315) Bool)

(assert (=> start!99316 (array_inv!27836 _keys!1208)))

(assert (=> start!99316 true))

(assert (=> start!99316 tp!86765))

(declare-datatypes ((V!44081 0))(
  ( (V!44082 (val!14664 Int)) )
))
(declare-datatypes ((ValueCell!13898 0))(
  ( (ValueCellFull!13898 (v!17297 V!44081)) (EmptyCell!13898) )
))
(declare-datatypes ((array!75317 0))(
  ( (array!75318 (arr!36303 (Array (_ BitVec 32) ValueCell!13898)) (size!36840 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75317)

(declare-fun e!663258 () Bool)

(declare-fun array_inv!27837 (array!75317) Bool)

(assert (=> start!99316 (and (array_inv!27837 _values!996) e!663258)))

(declare-fun b!1166487 () Bool)

(declare-fun res!773260 () Bool)

(assert (=> b!1166487 (=> (not res!773260) (not e!663259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166487 (= res!773260 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45647 () Bool)

(declare-fun mapRes!45647 () Bool)

(declare-fun tp!86766 () Bool)

(assert (=> mapNonEmpty!45647 (= mapRes!45647 (and tp!86766 e!663255))))

(declare-fun mapValue!45647 () ValueCell!13898)

(declare-fun mapRest!45647 () (Array (_ BitVec 32) ValueCell!13898))

(declare-fun mapKey!45647 () (_ BitVec 32))

(assert (=> mapNonEmpty!45647 (= (arr!36303 _values!996) (store mapRest!45647 mapKey!45647 mapValue!45647))))

(declare-fun b!1166488 () Bool)

(declare-fun res!773265 () Bool)

(assert (=> b!1166488 (=> (not res!773265) (not e!663259))))

(assert (=> b!1166488 (= res!773265 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36839 _keys!1208))))))

(declare-fun b!1166489 () Bool)

(declare-fun res!773257 () Bool)

(assert (=> b!1166489 (=> (not res!773257) (not e!663259))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1166489 (= res!773257 (and (= (size!36840 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36839 _keys!1208) (size!36840 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166490 () Bool)

(declare-fun res!773261 () Bool)

(assert (=> b!1166490 (=> (not res!773261) (not e!663259))))

(assert (=> b!1166490 (= res!773261 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25470))))

(declare-fun b!1166491 () Bool)

(assert (=> b!1166491 (= e!663259 e!663254)))

(declare-fun res!773264 () Bool)

(assert (=> b!1166491 (=> (not res!773264) (not e!663254))))

(assert (=> b!1166491 (= res!773264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525329 mask!1564))))

(assert (=> b!1166491 (= lt!525329 (array!75316 (store (arr!36302 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36839 _keys!1208)))))

(declare-fun b!1166492 () Bool)

(assert (=> b!1166492 (= e!663257 true)))

(declare-fun zeroValue!944 () V!44081)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44081)

(declare-datatypes ((tuple2!18734 0))(
  ( (tuple2!18735 (_1!9378 (_ BitVec 64)) (_2!9378 V!44081)) )
))
(declare-datatypes ((List!25474 0))(
  ( (Nil!25471) (Cons!25470 (h!26688 tuple2!18734) (t!37143 List!25474)) )
))
(declare-datatypes ((ListLongMap!16711 0))(
  ( (ListLongMap!16712 (toList!8371 List!25474)) )
))
(declare-fun lt!525328 () ListLongMap!16711)

(declare-fun getCurrentListMapNoExtraKeys!4862 (array!75315 array!75317 (_ BitVec 32) (_ BitVec 32) V!44081 V!44081 (_ BitVec 32) Int) ListLongMap!16711)

(declare-fun dynLambda!2851 (Int (_ BitVec 64)) V!44081)

(assert (=> b!1166492 (= lt!525328 (getCurrentListMapNoExtraKeys!4862 lt!525329 (array!75318 (store (arr!36303 _values!996) i!673 (ValueCellFull!13898 (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36840 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525330 () ListLongMap!16711)

(assert (=> b!1166492 (= lt!525330 (getCurrentListMapNoExtraKeys!4862 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166493 () Bool)

(declare-fun res!773262 () Bool)

(assert (=> b!1166493 (=> (not res!773262) (not e!663259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166493 (= res!773262 (validKeyInArray!0 k0!934))))

(declare-fun b!1166494 () Bool)

(declare-fun res!773263 () Bool)

(assert (=> b!1166494 (=> (not res!773263) (not e!663259))))

(assert (=> b!1166494 (= res!773263 (= (select (arr!36302 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45647 () Bool)

(assert (=> mapIsEmpty!45647 mapRes!45647))

(declare-fun b!1166495 () Bool)

(declare-fun e!663253 () Bool)

(assert (=> b!1166495 (= e!663258 (and e!663253 mapRes!45647))))

(declare-fun condMapEmpty!45647 () Bool)

(declare-fun mapDefault!45647 () ValueCell!13898)

(assert (=> b!1166495 (= condMapEmpty!45647 (= (arr!36303 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13898)) mapDefault!45647)))))

(declare-fun b!1166496 () Bool)

(assert (=> b!1166496 (= e!663253 tp_is_empty!29215)))

(assert (= (and start!99316 res!773256) b!1166487))

(assert (= (and b!1166487 res!773260) b!1166489))

(assert (= (and b!1166489 res!773257) b!1166483))

(assert (= (and b!1166483 res!773259) b!1166490))

(assert (= (and b!1166490 res!773261) b!1166488))

(assert (= (and b!1166488 res!773265) b!1166493))

(assert (= (and b!1166493 res!773262) b!1166494))

(assert (= (and b!1166494 res!773263) b!1166491))

(assert (= (and b!1166491 res!773264) b!1166485))

(assert (= (and b!1166485 res!773255) b!1166486))

(assert (= (and b!1166486 (not res!773258)) b!1166492))

(assert (= (and b!1166495 condMapEmpty!45647) mapIsEmpty!45647))

(assert (= (and b!1166495 (not condMapEmpty!45647)) mapNonEmpty!45647))

(get-info :version)

(assert (= (and mapNonEmpty!45647 ((_ is ValueCellFull!13898) mapValue!45647)) b!1166484))

(assert (= (and b!1166495 ((_ is ValueCellFull!13898) mapDefault!45647)) b!1166496))

(assert (= start!99316 b!1166495))

(declare-fun b_lambda!19785 () Bool)

(assert (=> (not b_lambda!19785) (not b!1166492)))

(declare-fun t!37141 () Bool)

(declare-fun tb!9489 () Bool)

(assert (=> (and start!99316 (= defaultEntry!1004 defaultEntry!1004) t!37141) tb!9489))

(declare-fun result!19551 () Bool)

(assert (=> tb!9489 (= result!19551 tp_is_empty!29215)))

(assert (=> b!1166492 t!37141))

(declare-fun b_and!40223 () Bool)

(assert (= b_and!40221 (and (=> t!37141 result!19551) b_and!40223)))

(declare-fun m!1075019 () Bool)

(assert (=> b!1166483 m!1075019))

(declare-fun m!1075021 () Bool)

(assert (=> b!1166485 m!1075021))

(declare-fun m!1075023 () Bool)

(assert (=> start!99316 m!1075023))

(declare-fun m!1075025 () Bool)

(assert (=> start!99316 m!1075025))

(declare-fun m!1075027 () Bool)

(assert (=> b!1166492 m!1075027))

(declare-fun m!1075029 () Bool)

(assert (=> b!1166492 m!1075029))

(declare-fun m!1075031 () Bool)

(assert (=> b!1166492 m!1075031))

(declare-fun m!1075033 () Bool)

(assert (=> b!1166492 m!1075033))

(declare-fun m!1075035 () Bool)

(assert (=> b!1166487 m!1075035))

(declare-fun m!1075037 () Bool)

(assert (=> b!1166491 m!1075037))

(declare-fun m!1075039 () Bool)

(assert (=> b!1166491 m!1075039))

(declare-fun m!1075041 () Bool)

(assert (=> b!1166494 m!1075041))

(declare-fun m!1075043 () Bool)

(assert (=> b!1166486 m!1075043))

(declare-fun m!1075045 () Bool)

(assert (=> b!1166486 m!1075045))

(declare-fun m!1075047 () Bool)

(assert (=> b!1166493 m!1075047))

(declare-fun m!1075049 () Bool)

(assert (=> mapNonEmpty!45647 m!1075049))

(declare-fun m!1075051 () Bool)

(assert (=> b!1166490 m!1075051))

(check-sat (not b!1166483) tp_is_empty!29215 (not b!1166493) (not b_next!24685) (not mapNonEmpty!45647) (not b!1166492) (not b!1166490) (not b!1166491) b_and!40223 (not b!1166487) (not start!99316) (not b!1166485) (not b_lambda!19785) (not b!1166486))
(check-sat b_and!40223 (not b_next!24685))
