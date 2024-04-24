; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95868 () Bool)

(assert start!95868)

(declare-fun b_free!22285 () Bool)

(declare-fun b_next!22285 () Bool)

(assert (=> start!95868 (= b_free!22285 (not b_next!22285))))

(declare-fun tp!78704 () Bool)

(declare-fun b_and!35273 () Bool)

(assert (=> start!95868 (= tp!78704 b_and!35273)))

(declare-fun b!1081972 () Bool)

(declare-fun res!720773 () Bool)

(declare-fun e!618599 () Bool)

(assert (=> b!1081972 (=> (not res!720773) (not e!618599))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69559 0))(
  ( (array!69560 (arr!33447 (Array (_ BitVec 32) (_ BitVec 64))) (size!33984 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69559)

(assert (=> b!1081972 (= res!720773 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33984 _keys!1070))))))

(declare-fun b!1081973 () Bool)

(declare-fun e!618597 () Bool)

(declare-fun tp_is_empty!26287 () Bool)

(assert (=> b!1081973 (= e!618597 tp_is_empty!26287)))

(declare-fun b!1081974 () Bool)

(declare-fun e!618600 () Bool)

(assert (=> b!1081974 (= e!618600 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40177 0))(
  ( (V!40178 (val!13200 Int)) )
))
(declare-fun minValue!831 () V!40177)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16712 0))(
  ( (tuple2!16713 (_1!8367 (_ BitVec 64)) (_2!8367 V!40177)) )
))
(declare-datatypes ((List!23305 0))(
  ( (Nil!23302) (Cons!23301 (h!24519 tuple2!16712) (t!32656 List!23305)) )
))
(declare-datatypes ((ListLongMap!14689 0))(
  ( (ListLongMap!14690 (toList!7360 List!23305)) )
))
(declare-fun lt!479586 () ListLongMap!14689)

(declare-fun zeroValue!831 () V!40177)

(declare-datatypes ((ValueCell!12434 0))(
  ( (ValueCellFull!12434 (v!15817 V!40177)) (EmptyCell!12434) )
))
(declare-datatypes ((array!69561 0))(
  ( (array!69562 (arr!33448 (Array (_ BitVec 32) ValueCell!12434)) (size!33985 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69561)

(declare-fun getCurrentListMapNoExtraKeys!3937 (array!69559 array!69561 (_ BitVec 32) (_ BitVec 32) V!40177 V!40177 (_ BitVec 32) Int) ListLongMap!14689)

(assert (=> b!1081974 (= lt!479586 (getCurrentListMapNoExtraKeys!3937 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081974 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35511 0))(
  ( (Unit!35512) )
))
(declare-fun lt!479584 () Unit!35511)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69559 (_ BitVec 64) (_ BitVec 32)) Unit!35511)

(assert (=> b!1081974 (= lt!479584 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081975 () Bool)

(assert (=> b!1081975 (= e!618599 e!618600)))

(declare-fun res!720768 () Bool)

(assert (=> b!1081975 (=> (not res!720768) (not e!618600))))

(declare-fun lt!479585 () array!69559)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69559 (_ BitVec 32)) Bool)

(assert (=> b!1081975 (= res!720768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479585 mask!1414))))

(assert (=> b!1081975 (= lt!479585 (array!69560 (store (arr!33447 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33984 _keys!1070)))))

(declare-fun b!1081976 () Bool)

(declare-fun e!618602 () Bool)

(declare-fun e!618598 () Bool)

(declare-fun mapRes!41185 () Bool)

(assert (=> b!1081976 (= e!618602 (and e!618598 mapRes!41185))))

(declare-fun condMapEmpty!41185 () Bool)

(declare-fun mapDefault!41185 () ValueCell!12434)

(assert (=> b!1081976 (= condMapEmpty!41185 (= (arr!33448 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12434)) mapDefault!41185)))))

(declare-fun b!1081977 () Bool)

(declare-fun res!720767 () Bool)

(assert (=> b!1081977 (=> (not res!720767) (not e!618599))))

(assert (=> b!1081977 (= res!720767 (= (select (arr!33447 _keys!1070) i!650) k0!904))))

(declare-fun b!1081978 () Bool)

(declare-fun res!720766 () Bool)

(assert (=> b!1081978 (=> (not res!720766) (not e!618599))))

(assert (=> b!1081978 (= res!720766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41185 () Bool)

(assert (=> mapIsEmpty!41185 mapRes!41185))

(declare-fun res!720774 () Bool)

(assert (=> start!95868 (=> (not res!720774) (not e!618599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95868 (= res!720774 (validMask!0 mask!1414))))

(assert (=> start!95868 e!618599))

(assert (=> start!95868 tp!78704))

(assert (=> start!95868 true))

(assert (=> start!95868 tp_is_empty!26287))

(declare-fun array_inv!25864 (array!69559) Bool)

(assert (=> start!95868 (array_inv!25864 _keys!1070)))

(declare-fun array_inv!25865 (array!69561) Bool)

(assert (=> start!95868 (and (array_inv!25865 _values!874) e!618602)))

(declare-fun mapNonEmpty!41185 () Bool)

(declare-fun tp!78703 () Bool)

(assert (=> mapNonEmpty!41185 (= mapRes!41185 (and tp!78703 e!618597))))

(declare-fun mapRest!41185 () (Array (_ BitVec 32) ValueCell!12434))

(declare-fun mapValue!41185 () ValueCell!12434)

(declare-fun mapKey!41185 () (_ BitVec 32))

(assert (=> mapNonEmpty!41185 (= (arr!33448 _values!874) (store mapRest!41185 mapKey!41185 mapValue!41185))))

(declare-fun b!1081979 () Bool)

(declare-fun res!720771 () Bool)

(assert (=> b!1081979 (=> (not res!720771) (not e!618600))))

(declare-datatypes ((List!23306 0))(
  ( (Nil!23303) (Cons!23302 (h!24520 (_ BitVec 64)) (t!32657 List!23306)) )
))
(declare-fun arrayNoDuplicates!0 (array!69559 (_ BitVec 32) List!23306) Bool)

(assert (=> b!1081979 (= res!720771 (arrayNoDuplicates!0 lt!479585 #b00000000000000000000000000000000 Nil!23303))))

(declare-fun b!1081980 () Bool)

(assert (=> b!1081980 (= e!618598 tp_is_empty!26287)))

(declare-fun b!1081981 () Bool)

(declare-fun res!720769 () Bool)

(assert (=> b!1081981 (=> (not res!720769) (not e!618599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081981 (= res!720769 (validKeyInArray!0 k0!904))))

(declare-fun b!1081982 () Bool)

(declare-fun res!720770 () Bool)

(assert (=> b!1081982 (=> (not res!720770) (not e!618599))))

(assert (=> b!1081982 (= res!720770 (and (= (size!33985 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33984 _keys!1070) (size!33985 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081983 () Bool)

(declare-fun res!720772 () Bool)

(assert (=> b!1081983 (=> (not res!720772) (not e!618599))))

(assert (=> b!1081983 (= res!720772 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23303))))

(assert (= (and start!95868 res!720774) b!1081982))

(assert (= (and b!1081982 res!720770) b!1081978))

(assert (= (and b!1081978 res!720766) b!1081983))

(assert (= (and b!1081983 res!720772) b!1081972))

(assert (= (and b!1081972 res!720773) b!1081981))

(assert (= (and b!1081981 res!720769) b!1081977))

(assert (= (and b!1081977 res!720767) b!1081975))

(assert (= (and b!1081975 res!720768) b!1081979))

(assert (= (and b!1081979 res!720771) b!1081974))

(assert (= (and b!1081976 condMapEmpty!41185) mapIsEmpty!41185))

(assert (= (and b!1081976 (not condMapEmpty!41185)) mapNonEmpty!41185))

(get-info :version)

(assert (= (and mapNonEmpty!41185 ((_ is ValueCellFull!12434) mapValue!41185)) b!1081973))

(assert (= (and b!1081976 ((_ is ValueCellFull!12434) mapDefault!41185)) b!1081980))

(assert (= start!95868 b!1081976))

(declare-fun m!1000229 () Bool)

(assert (=> start!95868 m!1000229))

(declare-fun m!1000231 () Bool)

(assert (=> start!95868 m!1000231))

(declare-fun m!1000233 () Bool)

(assert (=> start!95868 m!1000233))

(declare-fun m!1000235 () Bool)

(assert (=> b!1081974 m!1000235))

(declare-fun m!1000237 () Bool)

(assert (=> b!1081974 m!1000237))

(declare-fun m!1000239 () Bool)

(assert (=> b!1081974 m!1000239))

(declare-fun m!1000241 () Bool)

(assert (=> mapNonEmpty!41185 m!1000241))

(declare-fun m!1000243 () Bool)

(assert (=> b!1081975 m!1000243))

(declare-fun m!1000245 () Bool)

(assert (=> b!1081975 m!1000245))

(declare-fun m!1000247 () Bool)

(assert (=> b!1081983 m!1000247))

(declare-fun m!1000249 () Bool)

(assert (=> b!1081977 m!1000249))

(declare-fun m!1000251 () Bool)

(assert (=> b!1081979 m!1000251))

(declare-fun m!1000253 () Bool)

(assert (=> b!1081981 m!1000253))

(declare-fun m!1000255 () Bool)

(assert (=> b!1081978 m!1000255))

(check-sat (not b!1081979) tp_is_empty!26287 (not start!95868) b_and!35273 (not mapNonEmpty!41185) (not b!1081983) (not b!1081978) (not b!1081974) (not b!1081981) (not b!1081975) (not b_next!22285))
(check-sat b_and!35273 (not b_next!22285))
