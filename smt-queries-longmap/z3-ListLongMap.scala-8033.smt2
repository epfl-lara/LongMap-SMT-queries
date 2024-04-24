; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99274 () Bool)

(assert start!99274)

(declare-fun b_free!24643 () Bool)

(declare-fun b_next!24643 () Bool)

(assert (=> start!99274 (= b_free!24643 (not b_next!24643))))

(declare-fun tp!86639 () Bool)

(declare-fun b_and!40137 () Bool)

(assert (=> start!99274 (= tp!86639 b_and!40137)))

(declare-fun b!1165559 () Bool)

(declare-fun res!772570 () Bool)

(declare-fun e!662816 () Bool)

(assert (=> b!1165559 (=> (not res!772570) (not e!662816))))

(declare-datatypes ((array!75233 0))(
  ( (array!75234 (arr!36261 (Array (_ BitVec 32) (_ BitVec 64))) (size!36798 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75233)

(declare-datatypes ((List!25441 0))(
  ( (Nil!25438) (Cons!25437 (h!26655 (_ BitVec 64)) (t!37068 List!25441)) )
))
(declare-fun arrayNoDuplicates!0 (array!75233 (_ BitVec 32) List!25441) Bool)

(assert (=> b!1165559 (= res!772570 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25438))))

(declare-fun b!1165560 () Bool)

(declare-fun e!662814 () Bool)

(declare-fun e!662818 () Bool)

(declare-fun mapRes!45584 () Bool)

(assert (=> b!1165560 (= e!662814 (and e!662818 mapRes!45584))))

(declare-fun condMapEmpty!45584 () Bool)

(declare-datatypes ((V!44025 0))(
  ( (V!44026 (val!14643 Int)) )
))
(declare-datatypes ((ValueCell!13877 0))(
  ( (ValueCellFull!13877 (v!17276 V!44025)) (EmptyCell!13877) )
))
(declare-datatypes ((array!75235 0))(
  ( (array!75236 (arr!36262 (Array (_ BitVec 32) ValueCell!13877)) (size!36799 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75235)

(declare-fun mapDefault!45584 () ValueCell!13877)

(assert (=> b!1165560 (= condMapEmpty!45584 (= (arr!36262 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13877)) mapDefault!45584)))))

(declare-fun b!1165561 () Bool)

(declare-fun res!772568 () Bool)

(assert (=> b!1165561 (=> (not res!772568) (not e!662816))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165561 (= res!772568 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36798 _keys!1208))))))

(declare-fun b!1165562 () Bool)

(declare-fun e!662817 () Bool)

(declare-fun e!662813 () Bool)

(assert (=> b!1165562 (= e!662817 (not e!662813))))

(declare-fun res!772565 () Bool)

(assert (=> b!1165562 (=> res!772565 e!662813)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1165562 (= res!772565 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165562 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38413 0))(
  ( (Unit!38414) )
))
(declare-fun lt!525076 () Unit!38413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75233 (_ BitVec 64) (_ BitVec 32)) Unit!38413)

(assert (=> b!1165562 (= lt!525076 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!772571 () Bool)

(assert (=> start!99274 (=> (not res!772571) (not e!662816))))

(assert (=> start!99274 (= res!772571 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36798 _keys!1208))))))

(assert (=> start!99274 e!662816))

(declare-fun tp_is_empty!29173 () Bool)

(assert (=> start!99274 tp_is_empty!29173))

(declare-fun array_inv!27808 (array!75233) Bool)

(assert (=> start!99274 (array_inv!27808 _keys!1208)))

(assert (=> start!99274 true))

(assert (=> start!99274 tp!86639))

(declare-fun array_inv!27809 (array!75235) Bool)

(assert (=> start!99274 (and (array_inv!27809 _values!996) e!662814)))

(declare-fun mapIsEmpty!45584 () Bool)

(assert (=> mapIsEmpty!45584 mapRes!45584))

(declare-fun b!1165563 () Bool)

(declare-fun res!772572 () Bool)

(assert (=> b!1165563 (=> (not res!772572) (not e!662816))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1165563 (= res!772572 (and (= (size!36799 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36798 _keys!1208) (size!36799 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165564 () Bool)

(declare-fun res!772567 () Bool)

(assert (=> b!1165564 (=> (not res!772567) (not e!662816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165564 (= res!772567 (validMask!0 mask!1564))))

(declare-fun b!1165565 () Bool)

(declare-fun res!772566 () Bool)

(assert (=> b!1165565 (=> (not res!772566) (not e!662816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75233 (_ BitVec 32)) Bool)

(assert (=> b!1165565 (= res!772566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165566 () Bool)

(declare-fun res!772569 () Bool)

(assert (=> b!1165566 (=> (not res!772569) (not e!662816))))

(assert (=> b!1165566 (= res!772569 (= (select (arr!36261 _keys!1208) i!673) k0!934))))

(declare-fun b!1165567 () Bool)

(declare-fun res!772564 () Bool)

(assert (=> b!1165567 (=> (not res!772564) (not e!662816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165567 (= res!772564 (validKeyInArray!0 k0!934))))

(declare-fun b!1165568 () Bool)

(assert (=> b!1165568 (= e!662818 tp_is_empty!29173)))

(declare-fun mapNonEmpty!45584 () Bool)

(declare-fun tp!86640 () Bool)

(declare-fun e!662815 () Bool)

(assert (=> mapNonEmpty!45584 (= mapRes!45584 (and tp!86640 e!662815))))

(declare-fun mapRest!45584 () (Array (_ BitVec 32) ValueCell!13877))

(declare-fun mapKey!45584 () (_ BitVec 32))

(declare-fun mapValue!45584 () ValueCell!13877)

(assert (=> mapNonEmpty!45584 (= (arr!36262 _values!996) (store mapRest!45584 mapKey!45584 mapValue!45584))))

(declare-fun b!1165569 () Bool)

(assert (=> b!1165569 (= e!662816 e!662817)))

(declare-fun res!772563 () Bool)

(assert (=> b!1165569 (=> (not res!772563) (not e!662817))))

(declare-fun lt!525078 () array!75233)

(assert (=> b!1165569 (= res!772563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525078 mask!1564))))

(assert (=> b!1165569 (= lt!525078 (array!75234 (store (arr!36261 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36798 _keys!1208)))))

(declare-fun b!1165570 () Bool)

(assert (=> b!1165570 (= e!662815 tp_is_empty!29173)))

(declare-fun b!1165571 () Bool)

(assert (=> b!1165571 (= e!662813 true)))

(declare-fun zeroValue!944 () V!44025)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18706 0))(
  ( (tuple2!18707 (_1!9364 (_ BitVec 64)) (_2!9364 V!44025)) )
))
(declare-datatypes ((List!25442 0))(
  ( (Nil!25439) (Cons!25438 (h!26656 tuple2!18706) (t!37069 List!25442)) )
))
(declare-datatypes ((ListLongMap!16683 0))(
  ( (ListLongMap!16684 (toList!8357 List!25442)) )
))
(declare-fun lt!525079 () ListLongMap!16683)

(declare-fun minValue!944 () V!44025)

(declare-fun getCurrentListMapNoExtraKeys!4848 (array!75233 array!75235 (_ BitVec 32) (_ BitVec 32) V!44025 V!44025 (_ BitVec 32) Int) ListLongMap!16683)

(declare-fun dynLambda!2837 (Int (_ BitVec 64)) V!44025)

(assert (=> b!1165571 (= lt!525079 (getCurrentListMapNoExtraKeys!4848 lt!525078 (array!75236 (store (arr!36262 _values!996) i!673 (ValueCellFull!13877 (dynLambda!2837 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36799 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525077 () ListLongMap!16683)

(assert (=> b!1165571 (= lt!525077 (getCurrentListMapNoExtraKeys!4848 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165572 () Bool)

(declare-fun res!772562 () Bool)

(assert (=> b!1165572 (=> (not res!772562) (not e!662817))))

(assert (=> b!1165572 (= res!772562 (arrayNoDuplicates!0 lt!525078 #b00000000000000000000000000000000 Nil!25438))))

(assert (= (and start!99274 res!772571) b!1165564))

(assert (= (and b!1165564 res!772567) b!1165563))

(assert (= (and b!1165563 res!772572) b!1165565))

(assert (= (and b!1165565 res!772566) b!1165559))

(assert (= (and b!1165559 res!772570) b!1165561))

(assert (= (and b!1165561 res!772568) b!1165567))

(assert (= (and b!1165567 res!772564) b!1165566))

(assert (= (and b!1165566 res!772569) b!1165569))

(assert (= (and b!1165569 res!772563) b!1165572))

(assert (= (and b!1165572 res!772562) b!1165562))

(assert (= (and b!1165562 (not res!772565)) b!1165571))

(assert (= (and b!1165560 condMapEmpty!45584) mapIsEmpty!45584))

(assert (= (and b!1165560 (not condMapEmpty!45584)) mapNonEmpty!45584))

(get-info :version)

(assert (= (and mapNonEmpty!45584 ((_ is ValueCellFull!13877) mapValue!45584)) b!1165570))

(assert (= (and b!1165560 ((_ is ValueCellFull!13877) mapDefault!45584)) b!1165568))

(assert (= start!99274 b!1165560))

(declare-fun b_lambda!19743 () Bool)

(assert (=> (not b_lambda!19743) (not b!1165571)))

(declare-fun t!37067 () Bool)

(declare-fun tb!9447 () Bool)

(assert (=> (and start!99274 (= defaultEntry!1004 defaultEntry!1004) t!37067) tb!9447))

(declare-fun result!19467 () Bool)

(assert (=> tb!9447 (= result!19467 tp_is_empty!29173)))

(assert (=> b!1165571 t!37067))

(declare-fun b_and!40139 () Bool)

(assert (= b_and!40137 (and (=> t!37067 result!19467) b_and!40139)))

(declare-fun m!1074305 () Bool)

(assert (=> b!1165565 m!1074305))

(declare-fun m!1074307 () Bool)

(assert (=> b!1165564 m!1074307))

(declare-fun m!1074309 () Bool)

(assert (=> b!1165562 m!1074309))

(declare-fun m!1074311 () Bool)

(assert (=> b!1165562 m!1074311))

(declare-fun m!1074313 () Bool)

(assert (=> mapNonEmpty!45584 m!1074313))

(declare-fun m!1074315 () Bool)

(assert (=> b!1165567 m!1074315))

(declare-fun m!1074317 () Bool)

(assert (=> b!1165569 m!1074317))

(declare-fun m!1074319 () Bool)

(assert (=> b!1165569 m!1074319))

(declare-fun m!1074321 () Bool)

(assert (=> b!1165566 m!1074321))

(declare-fun m!1074323 () Bool)

(assert (=> b!1165571 m!1074323))

(declare-fun m!1074325 () Bool)

(assert (=> b!1165571 m!1074325))

(declare-fun m!1074327 () Bool)

(assert (=> b!1165571 m!1074327))

(declare-fun m!1074329 () Bool)

(assert (=> b!1165571 m!1074329))

(declare-fun m!1074331 () Bool)

(assert (=> b!1165572 m!1074331))

(declare-fun m!1074333 () Bool)

(assert (=> b!1165559 m!1074333))

(declare-fun m!1074335 () Bool)

(assert (=> start!99274 m!1074335))

(declare-fun m!1074337 () Bool)

(assert (=> start!99274 m!1074337))

(check-sat (not b!1165565) (not mapNonEmpty!45584) (not b!1165567) (not b!1165571) (not b!1165569) (not b!1165559) (not b!1165564) (not b!1165562) (not b!1165572) b_and!40139 tp_is_empty!29173 (not start!99274) (not b_next!24643) (not b_lambda!19743))
(check-sat b_and!40139 (not b_next!24643))
