; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99070 () Bool)

(assert start!99070)

(declare-fun b_free!24675 () Bool)

(declare-fun b_next!24675 () Bool)

(assert (=> start!99070 (= b_free!24675 (not b_next!24675))))

(declare-fun tp!86736 () Bool)

(declare-fun b_and!40199 () Bool)

(assert (=> start!99070 (= tp!86736 b_and!40199)))

(declare-fun b!1164974 () Bool)

(declare-fun e!662321 () Bool)

(assert (=> b!1164974 (= e!662321 true)))

(declare-datatypes ((V!44067 0))(
  ( (V!44068 (val!14659 Int)) )
))
(declare-fun zeroValue!944 () V!44067)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!75241 0))(
  ( (array!75242 (arr!36271 (Array (_ BitVec 32) (_ BitVec 64))) (size!36807 (_ BitVec 32))) )
))
(declare-fun lt!524784 () array!75241)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18692 0))(
  ( (tuple2!18693 (_1!9357 (_ BitVec 64)) (_2!9357 V!44067)) )
))
(declare-datatypes ((List!25426 0))(
  ( (Nil!25423) (Cons!25422 (h!26631 tuple2!18692) (t!37093 List!25426)) )
))
(declare-datatypes ((ListLongMap!16661 0))(
  ( (ListLongMap!16662 (toList!8346 List!25426)) )
))
(declare-fun lt!524786 () ListLongMap!16661)

(declare-datatypes ((ValueCell!13893 0))(
  ( (ValueCellFull!13893 (v!17296 V!44067)) (EmptyCell!13893) )
))
(declare-datatypes ((array!75243 0))(
  ( (array!75244 (arr!36272 (Array (_ BitVec 32) ValueCell!13893)) (size!36808 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75243)

(declare-fun minValue!944 () V!44067)

(declare-fun getCurrentListMapNoExtraKeys!4810 (array!75241 array!75243 (_ BitVec 32) (_ BitVec 32) V!44067 V!44067 (_ BitVec 32) Int) ListLongMap!16661)

(declare-fun dynLambda!2800 (Int (_ BitVec 64)) V!44067)

(assert (=> b!1164974 (= lt!524786 (getCurrentListMapNoExtraKeys!4810 lt!524784 (array!75244 (store (arr!36272 _values!996) i!673 (ValueCellFull!13893 (dynLambda!2800 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36808 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!75241)

(declare-fun lt!524787 () ListLongMap!16661)

(assert (=> b!1164974 (= lt!524787 (getCurrentListMapNoExtraKeys!4810 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164976 () Bool)

(declare-fun res!772590 () Bool)

(declare-fun e!662319 () Bool)

(assert (=> b!1164976 (=> (not res!772590) (not e!662319))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164976 (= res!772590 (validKeyInArray!0 k0!934))))

(declare-fun b!1164977 () Bool)

(declare-fun e!662320 () Bool)

(declare-fun tp_is_empty!29205 () Bool)

(assert (=> b!1164977 (= e!662320 tp_is_empty!29205)))

(declare-fun b!1164978 () Bool)

(declare-fun res!772584 () Bool)

(assert (=> b!1164978 (=> (not res!772584) (not e!662319))))

(assert (=> b!1164978 (= res!772584 (and (= (size!36808 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36807 _keys!1208) (size!36808 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164979 () Bool)

(declare-fun res!772586 () Bool)

(assert (=> b!1164979 (=> (not res!772586) (not e!662319))))

(declare-datatypes ((List!25427 0))(
  ( (Nil!25424) (Cons!25423 (h!26632 (_ BitVec 64)) (t!37094 List!25427)) )
))
(declare-fun arrayNoDuplicates!0 (array!75241 (_ BitVec 32) List!25427) Bool)

(assert (=> b!1164979 (= res!772586 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25424))))

(declare-fun b!1164980 () Bool)

(declare-fun res!772583 () Bool)

(declare-fun e!662317 () Bool)

(assert (=> b!1164980 (=> (not res!772583) (not e!662317))))

(assert (=> b!1164980 (= res!772583 (arrayNoDuplicates!0 lt!524784 #b00000000000000000000000000000000 Nil!25424))))

(declare-fun b!1164981 () Bool)

(declare-fun e!662322 () Bool)

(declare-fun e!662318 () Bool)

(declare-fun mapRes!45632 () Bool)

(assert (=> b!1164981 (= e!662322 (and e!662318 mapRes!45632))))

(declare-fun condMapEmpty!45632 () Bool)

(declare-fun mapDefault!45632 () ValueCell!13893)

(assert (=> b!1164981 (= condMapEmpty!45632 (= (arr!36272 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13893)) mapDefault!45632)))))

(declare-fun b!1164982 () Bool)

(assert (=> b!1164982 (= e!662317 (not e!662321))))

(declare-fun res!772587 () Bool)

(assert (=> b!1164982 (=> res!772587 e!662321)))

(assert (=> b!1164982 (= res!772587 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164982 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38444 0))(
  ( (Unit!38445) )
))
(declare-fun lt!524785 () Unit!38444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75241 (_ BitVec 64) (_ BitVec 32)) Unit!38444)

(assert (=> b!1164982 (= lt!524785 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45632 () Bool)

(declare-fun tp!86735 () Bool)

(assert (=> mapNonEmpty!45632 (= mapRes!45632 (and tp!86735 e!662320))))

(declare-fun mapKey!45632 () (_ BitVec 32))

(declare-fun mapRest!45632 () (Array (_ BitVec 32) ValueCell!13893))

(declare-fun mapValue!45632 () ValueCell!13893)

(assert (=> mapNonEmpty!45632 (= (arr!36272 _values!996) (store mapRest!45632 mapKey!45632 mapValue!45632))))

(declare-fun mapIsEmpty!45632 () Bool)

(assert (=> mapIsEmpty!45632 mapRes!45632))

(declare-fun b!1164983 () Bool)

(declare-fun res!772582 () Bool)

(assert (=> b!1164983 (=> (not res!772582) (not e!662319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75241 (_ BitVec 32)) Bool)

(assert (=> b!1164983 (= res!772582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164984 () Bool)

(declare-fun res!772588 () Bool)

(assert (=> b!1164984 (=> (not res!772588) (not e!662319))))

(assert (=> b!1164984 (= res!772588 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36807 _keys!1208))))))

(declare-fun b!1164985 () Bool)

(declare-fun res!772589 () Bool)

(assert (=> b!1164985 (=> (not res!772589) (not e!662319))))

(assert (=> b!1164985 (= res!772589 (= (select (arr!36271 _keys!1208) i!673) k0!934))))

(declare-fun b!1164986 () Bool)

(assert (=> b!1164986 (= e!662318 tp_is_empty!29205)))

(declare-fun b!1164987 () Bool)

(declare-fun res!772591 () Bool)

(assert (=> b!1164987 (=> (not res!772591) (not e!662319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164987 (= res!772591 (validMask!0 mask!1564))))

(declare-fun b!1164975 () Bool)

(assert (=> b!1164975 (= e!662319 e!662317)))

(declare-fun res!772585 () Bool)

(assert (=> b!1164975 (=> (not res!772585) (not e!662317))))

(assert (=> b!1164975 (= res!772585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524784 mask!1564))))

(assert (=> b!1164975 (= lt!524784 (array!75242 (store (arr!36271 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36807 _keys!1208)))))

(declare-fun res!772592 () Bool)

(assert (=> start!99070 (=> (not res!772592) (not e!662319))))

(assert (=> start!99070 (= res!772592 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36807 _keys!1208))))))

(assert (=> start!99070 e!662319))

(assert (=> start!99070 tp_is_empty!29205))

(declare-fun array_inv!27744 (array!75241) Bool)

(assert (=> start!99070 (array_inv!27744 _keys!1208)))

(assert (=> start!99070 true))

(assert (=> start!99070 tp!86736))

(declare-fun array_inv!27745 (array!75243) Bool)

(assert (=> start!99070 (and (array_inv!27745 _values!996) e!662322)))

(assert (= (and start!99070 res!772592) b!1164987))

(assert (= (and b!1164987 res!772591) b!1164978))

(assert (= (and b!1164978 res!772584) b!1164983))

(assert (= (and b!1164983 res!772582) b!1164979))

(assert (= (and b!1164979 res!772586) b!1164984))

(assert (= (and b!1164984 res!772588) b!1164976))

(assert (= (and b!1164976 res!772590) b!1164985))

(assert (= (and b!1164985 res!772589) b!1164975))

(assert (= (and b!1164975 res!772585) b!1164980))

(assert (= (and b!1164980 res!772583) b!1164982))

(assert (= (and b!1164982 (not res!772587)) b!1164974))

(assert (= (and b!1164981 condMapEmpty!45632) mapIsEmpty!45632))

(assert (= (and b!1164981 (not condMapEmpty!45632)) mapNonEmpty!45632))

(get-info :version)

(assert (= (and mapNonEmpty!45632 ((_ is ValueCellFull!13893) mapValue!45632)) b!1164977))

(assert (= (and b!1164981 ((_ is ValueCellFull!13893) mapDefault!45632)) b!1164986))

(assert (= start!99070 b!1164981))

(declare-fun b_lambda!19781 () Bool)

(assert (=> (not b_lambda!19781) (not b!1164974)))

(declare-fun t!37092 () Bool)

(declare-fun tb!9487 () Bool)

(assert (=> (and start!99070 (= defaultEntry!1004 defaultEntry!1004) t!37092) tb!9487))

(declare-fun result!19539 () Bool)

(assert (=> tb!9487 (= result!19539 tp_is_empty!29205)))

(assert (=> b!1164974 t!37092))

(declare-fun b_and!40201 () Bool)

(assert (= b_and!40199 (and (=> t!37092 result!19539) b_and!40201)))

(declare-fun m!1073277 () Bool)

(assert (=> b!1164975 m!1073277))

(declare-fun m!1073279 () Bool)

(assert (=> b!1164975 m!1073279))

(declare-fun m!1073281 () Bool)

(assert (=> b!1164985 m!1073281))

(declare-fun m!1073283 () Bool)

(assert (=> b!1164980 m!1073283))

(declare-fun m!1073285 () Bool)

(assert (=> b!1164987 m!1073285))

(declare-fun m!1073287 () Bool)

(assert (=> mapNonEmpty!45632 m!1073287))

(declare-fun m!1073289 () Bool)

(assert (=> start!99070 m!1073289))

(declare-fun m!1073291 () Bool)

(assert (=> start!99070 m!1073291))

(declare-fun m!1073293 () Bool)

(assert (=> b!1164974 m!1073293))

(declare-fun m!1073295 () Bool)

(assert (=> b!1164974 m!1073295))

(declare-fun m!1073297 () Bool)

(assert (=> b!1164974 m!1073297))

(declare-fun m!1073299 () Bool)

(assert (=> b!1164974 m!1073299))

(declare-fun m!1073301 () Bool)

(assert (=> b!1164983 m!1073301))

(declare-fun m!1073303 () Bool)

(assert (=> b!1164976 m!1073303))

(declare-fun m!1073305 () Bool)

(assert (=> b!1164982 m!1073305))

(declare-fun m!1073307 () Bool)

(assert (=> b!1164982 m!1073307))

(declare-fun m!1073309 () Bool)

(assert (=> b!1164979 m!1073309))

(check-sat tp_is_empty!29205 (not start!99070) (not b!1164975) (not mapNonEmpty!45632) b_and!40201 (not b!1164987) (not b!1164976) (not b!1164979) (not b_next!24675) (not b!1164982) (not b!1164974) (not b!1164980) (not b_lambda!19781) (not b!1164983))
(check-sat b_and!40201 (not b_next!24675))
