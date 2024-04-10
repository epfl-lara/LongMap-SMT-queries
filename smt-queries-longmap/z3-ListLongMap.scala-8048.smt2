; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99130 () Bool)

(assert start!99130)

(declare-fun b_free!24735 () Bool)

(declare-fun b_next!24735 () Bool)

(assert (=> start!99130 (= b_free!24735 (not b_next!24735))))

(declare-fun tp!86915 () Bool)

(declare-fun b_and!40319 () Bool)

(assert (=> start!99130 (= tp!86915 b_and!40319)))

(declare-fun b!1166326 () Bool)

(declare-fun res!773607 () Bool)

(declare-fun e!662980 () Bool)

(assert (=> b!1166326 (=> (not res!773607) (not e!662980))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166326 (= res!773607 (validMask!0 mask!1564))))

(declare-fun b!1166327 () Bool)

(declare-fun res!773606 () Bool)

(assert (=> b!1166327 (=> (not res!773606) (not e!662980))))

(declare-datatypes ((array!75361 0))(
  ( (array!75362 (arr!36331 (Array (_ BitVec 32) (_ BitVec 64))) (size!36867 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75361)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75361 (_ BitVec 32)) Bool)

(assert (=> b!1166327 (= res!773606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45722 () Bool)

(declare-fun mapRes!45722 () Bool)

(assert (=> mapIsEmpty!45722 mapRes!45722))

(declare-fun b!1166328 () Bool)

(declare-fun res!773611 () Bool)

(assert (=> b!1166328 (=> (not res!773611) (not e!662980))))

(declare-datatypes ((List!25473 0))(
  ( (Nil!25470) (Cons!25469 (h!26678 (_ BitVec 64)) (t!37200 List!25473)) )
))
(declare-fun arrayNoDuplicates!0 (array!75361 (_ BitVec 32) List!25473) Bool)

(assert (=> b!1166328 (= res!773611 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25470))))

(declare-fun res!773608 () Bool)

(assert (=> start!99130 (=> (not res!773608) (not e!662980))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99130 (= res!773608 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36867 _keys!1208))))))

(assert (=> start!99130 e!662980))

(declare-fun tp_is_empty!29265 () Bool)

(assert (=> start!99130 tp_is_empty!29265))

(declare-fun array_inv!27786 (array!75361) Bool)

(assert (=> start!99130 (array_inv!27786 _keys!1208)))

(assert (=> start!99130 true))

(assert (=> start!99130 tp!86915))

(declare-datatypes ((V!44147 0))(
  ( (V!44148 (val!14689 Int)) )
))
(declare-datatypes ((ValueCell!13923 0))(
  ( (ValueCellFull!13923 (v!17326 V!44147)) (EmptyCell!13923) )
))
(declare-datatypes ((array!75363 0))(
  ( (array!75364 (arr!36332 (Array (_ BitVec 32) ValueCell!13923)) (size!36868 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75363)

(declare-fun e!662981 () Bool)

(declare-fun array_inv!27787 (array!75363) Bool)

(assert (=> start!99130 (and (array_inv!27787 _values!996) e!662981)))

(declare-fun b!1166329 () Bool)

(declare-fun res!773615 () Bool)

(assert (=> b!1166329 (=> (not res!773615) (not e!662980))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166329 (= res!773615 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36867 _keys!1208))))))

(declare-fun b!1166330 () Bool)

(declare-fun e!662979 () Bool)

(assert (=> b!1166330 (= e!662981 (and e!662979 mapRes!45722))))

(declare-fun condMapEmpty!45722 () Bool)

(declare-fun mapDefault!45722 () ValueCell!13923)

(assert (=> b!1166330 (= condMapEmpty!45722 (= (arr!36332 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13923)) mapDefault!45722)))))

(declare-fun b!1166331 () Bool)

(declare-fun res!773610 () Bool)

(declare-fun e!662978 () Bool)

(assert (=> b!1166331 (=> (not res!773610) (not e!662978))))

(declare-fun lt!525209 () array!75361)

(assert (=> b!1166331 (= res!773610 (arrayNoDuplicates!0 lt!525209 #b00000000000000000000000000000000 Nil!25470))))

(declare-fun b!1166332 () Bool)

(declare-fun e!662984 () Bool)

(assert (=> b!1166332 (= e!662978 (not e!662984))))

(declare-fun res!773604 () Bool)

(assert (=> b!1166332 (=> res!773604 e!662984)))

(assert (=> b!1166332 (= res!773604 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166332 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38488 0))(
  ( (Unit!38489) )
))
(declare-fun lt!525213 () Unit!38488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75361 (_ BitVec 64) (_ BitVec 32)) Unit!38488)

(assert (=> b!1166332 (= lt!525213 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166333 () Bool)

(assert (=> b!1166333 (= e!662980 e!662978)))

(declare-fun res!773613 () Bool)

(assert (=> b!1166333 (=> (not res!773613) (not e!662978))))

(assert (=> b!1166333 (= res!773613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525209 mask!1564))))

(assert (=> b!1166333 (= lt!525209 (array!75362 (store (arr!36331 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36867 _keys!1208)))))

(declare-fun b!1166334 () Bool)

(declare-fun res!773614 () Bool)

(assert (=> b!1166334 (=> (not res!773614) (not e!662980))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1166334 (= res!773614 (and (= (size!36868 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36867 _keys!1208) (size!36868 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166335 () Bool)

(declare-fun e!662982 () Bool)

(assert (=> b!1166335 (= e!662982 tp_is_empty!29265)))

(declare-fun b!1166336 () Bool)

(declare-fun e!662983 () Bool)

(assert (=> b!1166336 (= e!662983 true)))

(declare-fun zeroValue!944 () V!44147)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44147)

(declare-fun lt!525212 () array!75363)

(declare-datatypes ((tuple2!18734 0))(
  ( (tuple2!18735 (_1!9378 (_ BitVec 64)) (_2!9378 V!44147)) )
))
(declare-datatypes ((List!25474 0))(
  ( (Nil!25471) (Cons!25470 (h!26679 tuple2!18734) (t!37201 List!25474)) )
))
(declare-datatypes ((ListLongMap!16703 0))(
  ( (ListLongMap!16704 (toList!8367 List!25474)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4831 (array!75361 array!75363 (_ BitVec 32) (_ BitVec 32) V!44147 V!44147 (_ BitVec 32) Int) ListLongMap!16703)

(declare-fun -!1444 (ListLongMap!16703 (_ BitVec 64)) ListLongMap!16703)

(assert (=> b!1166336 (= (getCurrentListMapNoExtraKeys!4831 lt!525209 lt!525212 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1444 (getCurrentListMapNoExtraKeys!4831 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525208 () Unit!38488)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!671 (array!75361 array!75363 (_ BitVec 32) (_ BitVec 32) V!44147 V!44147 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38488)

(assert (=> b!1166336 (= lt!525208 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!671 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166337 () Bool)

(declare-fun res!773612 () Bool)

(assert (=> b!1166337 (=> (not res!773612) (not e!662980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166337 (= res!773612 (validKeyInArray!0 k0!934))))

(declare-fun b!1166338 () Bool)

(assert (=> b!1166338 (= e!662979 tp_is_empty!29265)))

(declare-fun b!1166339 () Bool)

(declare-fun res!773605 () Bool)

(assert (=> b!1166339 (=> (not res!773605) (not e!662980))))

(assert (=> b!1166339 (= res!773605 (= (select (arr!36331 _keys!1208) i!673) k0!934))))

(declare-fun b!1166340 () Bool)

(assert (=> b!1166340 (= e!662984 e!662983)))

(declare-fun res!773609 () Bool)

(assert (=> b!1166340 (=> res!773609 e!662983)))

(assert (=> b!1166340 (= res!773609 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525211 () ListLongMap!16703)

(assert (=> b!1166340 (= lt!525211 (getCurrentListMapNoExtraKeys!4831 lt!525209 lt!525212 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2820 (Int (_ BitVec 64)) V!44147)

(assert (=> b!1166340 (= lt!525212 (array!75364 (store (arr!36332 _values!996) i!673 (ValueCellFull!13923 (dynLambda!2820 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36868 _values!996)))))

(declare-fun lt!525210 () ListLongMap!16703)

(assert (=> b!1166340 (= lt!525210 (getCurrentListMapNoExtraKeys!4831 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45722 () Bool)

(declare-fun tp!86916 () Bool)

(assert (=> mapNonEmpty!45722 (= mapRes!45722 (and tp!86916 e!662982))))

(declare-fun mapKey!45722 () (_ BitVec 32))

(declare-fun mapValue!45722 () ValueCell!13923)

(declare-fun mapRest!45722 () (Array (_ BitVec 32) ValueCell!13923))

(assert (=> mapNonEmpty!45722 (= (arr!36332 _values!996) (store mapRest!45722 mapKey!45722 mapValue!45722))))

(assert (= (and start!99130 res!773608) b!1166326))

(assert (= (and b!1166326 res!773607) b!1166334))

(assert (= (and b!1166334 res!773614) b!1166327))

(assert (= (and b!1166327 res!773606) b!1166328))

(assert (= (and b!1166328 res!773611) b!1166329))

(assert (= (and b!1166329 res!773615) b!1166337))

(assert (= (and b!1166337 res!773612) b!1166339))

(assert (= (and b!1166339 res!773605) b!1166333))

(assert (= (and b!1166333 res!773613) b!1166331))

(assert (= (and b!1166331 res!773610) b!1166332))

(assert (= (and b!1166332 (not res!773604)) b!1166340))

(assert (= (and b!1166340 (not res!773609)) b!1166336))

(assert (= (and b!1166330 condMapEmpty!45722) mapIsEmpty!45722))

(assert (= (and b!1166330 (not condMapEmpty!45722)) mapNonEmpty!45722))

(get-info :version)

(assert (= (and mapNonEmpty!45722 ((_ is ValueCellFull!13923) mapValue!45722)) b!1166335))

(assert (= (and b!1166330 ((_ is ValueCellFull!13923) mapDefault!45722)) b!1166338))

(assert (= start!99130 b!1166330))

(declare-fun b_lambda!19841 () Bool)

(assert (=> (not b_lambda!19841) (not b!1166340)))

(declare-fun t!37199 () Bool)

(declare-fun tb!9547 () Bool)

(assert (=> (and start!99130 (= defaultEntry!1004 defaultEntry!1004) t!37199) tb!9547))

(declare-fun result!19659 () Bool)

(assert (=> tb!9547 (= result!19659 tp_is_empty!29265)))

(assert (=> b!1166340 t!37199))

(declare-fun b_and!40321 () Bool)

(assert (= b_and!40319 (and (=> t!37199 result!19659) b_and!40321)))

(declare-fun m!1074377 () Bool)

(assert (=> b!1166340 m!1074377))

(declare-fun m!1074379 () Bool)

(assert (=> b!1166340 m!1074379))

(declare-fun m!1074381 () Bool)

(assert (=> b!1166340 m!1074381))

(declare-fun m!1074383 () Bool)

(assert (=> b!1166340 m!1074383))

(declare-fun m!1074385 () Bool)

(assert (=> b!1166331 m!1074385))

(declare-fun m!1074387 () Bool)

(assert (=> b!1166336 m!1074387))

(declare-fun m!1074389 () Bool)

(assert (=> b!1166336 m!1074389))

(assert (=> b!1166336 m!1074389))

(declare-fun m!1074391 () Bool)

(assert (=> b!1166336 m!1074391))

(declare-fun m!1074393 () Bool)

(assert (=> b!1166336 m!1074393))

(declare-fun m!1074395 () Bool)

(assert (=> mapNonEmpty!45722 m!1074395))

(declare-fun m!1074397 () Bool)

(assert (=> b!1166337 m!1074397))

(declare-fun m!1074399 () Bool)

(assert (=> start!99130 m!1074399))

(declare-fun m!1074401 () Bool)

(assert (=> start!99130 m!1074401))

(declare-fun m!1074403 () Bool)

(assert (=> b!1166339 m!1074403))

(declare-fun m!1074405 () Bool)

(assert (=> b!1166326 m!1074405))

(declare-fun m!1074407 () Bool)

(assert (=> b!1166332 m!1074407))

(declare-fun m!1074409 () Bool)

(assert (=> b!1166332 m!1074409))

(declare-fun m!1074411 () Bool)

(assert (=> b!1166328 m!1074411))

(declare-fun m!1074413 () Bool)

(assert (=> b!1166333 m!1074413))

(declare-fun m!1074415 () Bool)

(assert (=> b!1166333 m!1074415))

(declare-fun m!1074417 () Bool)

(assert (=> b!1166327 m!1074417))

(check-sat b_and!40321 (not mapNonEmpty!45722) (not b!1166340) (not b!1166328) (not b_lambda!19841) (not b!1166332) (not b!1166333) (not b_next!24735) (not start!99130) (not b!1166337) (not b!1166327) tp_is_empty!29265 (not b!1166331) (not b!1166336) (not b!1166326))
(check-sat b_and!40321 (not b_next!24735))
