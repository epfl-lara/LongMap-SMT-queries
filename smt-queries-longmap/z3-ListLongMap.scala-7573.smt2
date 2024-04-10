; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95760 () Bool)

(assert start!95760)

(declare-fun b_free!22413 () Bool)

(declare-fun b_next!22413 () Bool)

(assert (=> start!95760 (= b_free!22413 (not b_next!22413))))

(declare-fun tp!79087 () Bool)

(declare-fun b_and!35501 () Bool)

(assert (=> start!95760 (= tp!79087 b_and!35501)))

(declare-fun b!1083059 () Bool)

(declare-fun e!618896 () Bool)

(declare-fun e!618894 () Bool)

(assert (=> b!1083059 (= e!618896 e!618894)))

(declare-fun res!721975 () Bool)

(assert (=> b!1083059 (=> (not res!721975) (not e!618894))))

(declare-datatypes ((array!69773 0))(
  ( (array!69774 (arr!33560 (Array (_ BitVec 32) (_ BitVec 64))) (size!34096 (_ BitVec 32))) )
))
(declare-fun lt!479898 () array!69773)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69773 (_ BitVec 32)) Bool)

(assert (=> b!1083059 (= res!721975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479898 mask!1414))))

(declare-fun _keys!1070 () array!69773)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083059 (= lt!479898 (array!69774 (store (arr!33560 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34096 _keys!1070)))))

(declare-fun b!1083060 () Bool)

(declare-fun e!618899 () Bool)

(declare-fun tp_is_empty!26415 () Bool)

(assert (=> b!1083060 (= e!618899 tp_is_empty!26415)))

(declare-fun b!1083061 () Bool)

(declare-fun res!721972 () Bool)

(assert (=> b!1083061 (=> (not res!721972) (not e!618894))))

(declare-datatypes ((List!23391 0))(
  ( (Nil!23388) (Cons!23387 (h!24596 (_ BitVec 64)) (t!32862 List!23391)) )
))
(declare-fun arrayNoDuplicates!0 (array!69773 (_ BitVec 32) List!23391) Bool)

(assert (=> b!1083061 (= res!721972 (arrayNoDuplicates!0 lt!479898 #b00000000000000000000000000000000 Nil!23388))))

(declare-fun b!1083062 () Bool)

(declare-fun res!721973 () Bool)

(assert (=> b!1083062 (=> (not res!721973) (not e!618896))))

(assert (=> b!1083062 (= res!721973 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23388))))

(declare-fun b!1083063 () Bool)

(declare-fun e!618898 () Bool)

(declare-fun e!618897 () Bool)

(declare-fun mapRes!41377 () Bool)

(assert (=> b!1083063 (= e!618898 (and e!618897 mapRes!41377))))

(declare-fun condMapEmpty!41377 () Bool)

(declare-datatypes ((V!40347 0))(
  ( (V!40348 (val!13264 Int)) )
))
(declare-datatypes ((ValueCell!12498 0))(
  ( (ValueCellFull!12498 (v!15885 V!40347)) (EmptyCell!12498) )
))
(declare-datatypes ((array!69775 0))(
  ( (array!69776 (arr!33561 (Array (_ BitVec 32) ValueCell!12498)) (size!34097 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69775)

(declare-fun mapDefault!41377 () ValueCell!12498)

(assert (=> b!1083063 (= condMapEmpty!41377 (= (arr!33561 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12498)) mapDefault!41377)))))

(declare-fun mapNonEmpty!41377 () Bool)

(declare-fun tp!79088 () Bool)

(assert (=> mapNonEmpty!41377 (= mapRes!41377 (and tp!79088 e!618899))))

(declare-fun mapValue!41377 () ValueCell!12498)

(declare-fun mapRest!41377 () (Array (_ BitVec 32) ValueCell!12498))

(declare-fun mapKey!41377 () (_ BitVec 32))

(assert (=> mapNonEmpty!41377 (= (arr!33561 _values!874) (store mapRest!41377 mapKey!41377 mapValue!41377))))

(declare-fun b!1083064 () Bool)

(assert (=> b!1083064 (= e!618897 tp_is_empty!26415)))

(declare-fun b!1083065 () Bool)

(declare-fun res!721979 () Bool)

(assert (=> b!1083065 (=> (not res!721979) (not e!618896))))

(assert (=> b!1083065 (= res!721979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083066 () Bool)

(declare-fun res!721978 () Bool)

(assert (=> b!1083066 (=> (not res!721978) (not e!618896))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1083066 (= res!721978 (= (select (arr!33560 _keys!1070) i!650) k0!904))))

(declare-fun res!721974 () Bool)

(assert (=> start!95760 (=> (not res!721974) (not e!618896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95760 (= res!721974 (validMask!0 mask!1414))))

(assert (=> start!95760 e!618896))

(assert (=> start!95760 tp!79087))

(assert (=> start!95760 true))

(assert (=> start!95760 tp_is_empty!26415))

(declare-fun array_inv!25900 (array!69773) Bool)

(assert (=> start!95760 (array_inv!25900 _keys!1070)))

(declare-fun array_inv!25901 (array!69775) Bool)

(assert (=> start!95760 (and (array_inv!25901 _values!874) e!618898)))

(declare-fun b!1083067 () Bool)

(declare-fun res!721976 () Bool)

(assert (=> b!1083067 (=> (not res!721976) (not e!618896))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1083067 (= res!721976 (and (= (size!34097 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34096 _keys!1070) (size!34097 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083068 () Bool)

(declare-fun res!721980 () Bool)

(assert (=> b!1083068 (=> (not res!721980) (not e!618896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083068 (= res!721980 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41377 () Bool)

(assert (=> mapIsEmpty!41377 mapRes!41377))

(declare-fun b!1083069 () Bool)

(assert (=> b!1083069 (= e!618894 (not true))))

(declare-datatypes ((tuple2!16804 0))(
  ( (tuple2!16805 (_1!8413 (_ BitVec 64)) (_2!8413 V!40347)) )
))
(declare-datatypes ((List!23392 0))(
  ( (Nil!23389) (Cons!23388 (h!24597 tuple2!16804) (t!32863 List!23392)) )
))
(declare-datatypes ((ListLongMap!14773 0))(
  ( (ListLongMap!14774 (toList!7402 List!23392)) )
))
(declare-fun lt!479897 () ListLongMap!14773)

(declare-fun lt!479896 () ListLongMap!14773)

(assert (=> b!1083069 (and (= lt!479897 lt!479896) (= lt!479896 lt!479897))))

(declare-fun lt!479899 () ListLongMap!14773)

(declare-fun -!729 (ListLongMap!14773 (_ BitVec 64)) ListLongMap!14773)

(assert (=> b!1083069 (= lt!479896 (-!729 lt!479899 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((Unit!35624 0))(
  ( (Unit!35625) )
))
(declare-fun lt!479895 () Unit!35624)

(declare-fun minValue!831 () V!40347)

(declare-fun zeroValue!831 () V!40347)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!9 (array!69773 array!69775 (_ BitVec 32) (_ BitVec 32) V!40347 V!40347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35624)

(assert (=> b!1083069 (= lt!479895 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!9 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3950 (array!69773 array!69775 (_ BitVec 32) (_ BitVec 32) V!40347 V!40347 (_ BitVec 32) Int) ListLongMap!14773)

(declare-fun dynLambda!2087 (Int (_ BitVec 64)) V!40347)

(assert (=> b!1083069 (= lt!479897 (getCurrentListMapNoExtraKeys!3950 lt!479898 (array!69776 (store (arr!33561 _values!874) i!650 (ValueCellFull!12498 (dynLambda!2087 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34097 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083069 (= lt!479899 (getCurrentListMapNoExtraKeys!3950 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083069 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479894 () Unit!35624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69773 (_ BitVec 64) (_ BitVec 32)) Unit!35624)

(assert (=> b!1083069 (= lt!479894 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083070 () Bool)

(declare-fun res!721977 () Bool)

(assert (=> b!1083070 (=> (not res!721977) (not e!618896))))

(assert (=> b!1083070 (= res!721977 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34096 _keys!1070))))))

(assert (= (and start!95760 res!721974) b!1083067))

(assert (= (and b!1083067 res!721976) b!1083065))

(assert (= (and b!1083065 res!721979) b!1083062))

(assert (= (and b!1083062 res!721973) b!1083070))

(assert (= (and b!1083070 res!721977) b!1083068))

(assert (= (and b!1083068 res!721980) b!1083066))

(assert (= (and b!1083066 res!721978) b!1083059))

(assert (= (and b!1083059 res!721975) b!1083061))

(assert (= (and b!1083061 res!721972) b!1083069))

(assert (= (and b!1083063 condMapEmpty!41377) mapIsEmpty!41377))

(assert (= (and b!1083063 (not condMapEmpty!41377)) mapNonEmpty!41377))

(get-info :version)

(assert (= (and mapNonEmpty!41377 ((_ is ValueCellFull!12498) mapValue!41377)) b!1083060))

(assert (= (and b!1083063 ((_ is ValueCellFull!12498) mapDefault!41377)) b!1083064))

(assert (= start!95760 b!1083063))

(declare-fun b_lambda!17083 () Bool)

(assert (=> (not b_lambda!17083) (not b!1083069)))

(declare-fun t!32861 () Bool)

(declare-fun tb!7291 () Bool)

(assert (=> (and start!95760 (= defaultEntry!882 defaultEntry!882) t!32861) tb!7291))

(declare-fun result!15101 () Bool)

(assert (=> tb!7291 (= result!15101 tp_is_empty!26415)))

(assert (=> b!1083069 t!32861))

(declare-fun b_and!35503 () Bool)

(assert (= b_and!35501 (and (=> t!32861 result!15101) b_and!35503)))

(declare-fun m!1000731 () Bool)

(assert (=> b!1083069 m!1000731))

(declare-fun m!1000733 () Bool)

(assert (=> b!1083069 m!1000733))

(declare-fun m!1000735 () Bool)

(assert (=> b!1083069 m!1000735))

(declare-fun m!1000737 () Bool)

(assert (=> b!1083069 m!1000737))

(declare-fun m!1000739 () Bool)

(assert (=> b!1083069 m!1000739))

(declare-fun m!1000741 () Bool)

(assert (=> b!1083069 m!1000741))

(declare-fun m!1000743 () Bool)

(assert (=> b!1083069 m!1000743))

(declare-fun m!1000745 () Bool)

(assert (=> b!1083069 m!1000745))

(declare-fun m!1000747 () Bool)

(assert (=> b!1083066 m!1000747))

(declare-fun m!1000749 () Bool)

(assert (=> start!95760 m!1000749))

(declare-fun m!1000751 () Bool)

(assert (=> start!95760 m!1000751))

(declare-fun m!1000753 () Bool)

(assert (=> start!95760 m!1000753))

(declare-fun m!1000755 () Bool)

(assert (=> b!1083059 m!1000755))

(declare-fun m!1000757 () Bool)

(assert (=> b!1083059 m!1000757))

(declare-fun m!1000759 () Bool)

(assert (=> mapNonEmpty!41377 m!1000759))

(declare-fun m!1000761 () Bool)

(assert (=> b!1083061 m!1000761))

(declare-fun m!1000763 () Bool)

(assert (=> b!1083062 m!1000763))

(declare-fun m!1000765 () Bool)

(assert (=> b!1083068 m!1000765))

(declare-fun m!1000767 () Bool)

(assert (=> b!1083065 m!1000767))

(check-sat (not b_next!22413) (not b_lambda!17083) (not b!1083068) tp_is_empty!26415 (not b!1083069) (not mapNonEmpty!41377) (not b!1083059) (not b!1083065) (not b!1083061) (not start!95760) b_and!35503 (not b!1083062))
(check-sat b_and!35503 (not b_next!22413))
