; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95766 () Bool)

(assert start!95766)

(declare-fun b_free!22419 () Bool)

(declare-fun b_next!22419 () Bool)

(assert (=> start!95766 (= b_free!22419 (not b_next!22419))))

(declare-fun tp!79106 () Bool)

(declare-fun b_and!35513 () Bool)

(assert (=> start!95766 (= tp!79106 b_and!35513)))

(declare-fun b!1083174 () Bool)

(declare-fun e!618951 () Bool)

(declare-fun tp_is_empty!26421 () Bool)

(assert (=> b!1083174 (= e!618951 tp_is_empty!26421)))

(declare-fun mapNonEmpty!41386 () Bool)

(declare-fun mapRes!41386 () Bool)

(declare-fun tp!79105 () Bool)

(assert (=> mapNonEmpty!41386 (= mapRes!41386 (and tp!79105 e!618951))))

(declare-datatypes ((V!40355 0))(
  ( (V!40356 (val!13267 Int)) )
))
(declare-datatypes ((ValueCell!12501 0))(
  ( (ValueCellFull!12501 (v!15888 V!40355)) (EmptyCell!12501) )
))
(declare-datatypes ((array!69785 0))(
  ( (array!69786 (arr!33566 (Array (_ BitVec 32) ValueCell!12501)) (size!34102 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69785)

(declare-fun mapKey!41386 () (_ BitVec 32))

(declare-fun mapRest!41386 () (Array (_ BitVec 32) ValueCell!12501))

(declare-fun mapValue!41386 () ValueCell!12501)

(assert (=> mapNonEmpty!41386 (= (arr!33566 _values!874) (store mapRest!41386 mapKey!41386 mapValue!41386))))

(declare-fun b!1083175 () Bool)

(declare-fun res!722057 () Bool)

(declare-fun e!618949 () Bool)

(assert (=> b!1083175 (=> (not res!722057) (not e!618949))))

(declare-datatypes ((array!69787 0))(
  ( (array!69788 (arr!33567 (Array (_ BitVec 32) (_ BitVec 64))) (size!34103 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69787)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083175 (= res!722057 (= (select (arr!33567 _keys!1070) i!650) k0!904))))

(declare-fun b!1083176 () Bool)

(declare-fun e!618950 () Bool)

(assert (=> b!1083176 (= e!618950 (not true))))

(declare-datatypes ((tuple2!16810 0))(
  ( (tuple2!16811 (_1!8416 (_ BitVec 64)) (_2!8416 V!40355)) )
))
(declare-datatypes ((List!23396 0))(
  ( (Nil!23393) (Cons!23392 (h!24601 tuple2!16810) (t!32873 List!23396)) )
))
(declare-datatypes ((ListLongMap!14779 0))(
  ( (ListLongMap!14780 (toList!7405 List!23396)) )
))
(declare-fun lt!479951 () ListLongMap!14779)

(declare-fun lt!479948 () ListLongMap!14779)

(assert (=> b!1083176 (and (= lt!479951 lt!479948) (= lt!479948 lt!479951))))

(declare-fun lt!479949 () ListLongMap!14779)

(declare-fun -!732 (ListLongMap!14779 (_ BitVec 64)) ListLongMap!14779)

(assert (=> b!1083176 (= lt!479948 (-!732 lt!479949 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40355)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35630 0))(
  ( (Unit!35631) )
))
(declare-fun lt!479952 () Unit!35630)

(declare-fun zeroValue!831 () V!40355)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!12 (array!69787 array!69785 (_ BitVec 32) (_ BitVec 32) V!40355 V!40355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35630)

(assert (=> b!1083176 (= lt!479952 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!12 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479950 () array!69787)

(declare-fun getCurrentListMapNoExtraKeys!3953 (array!69787 array!69785 (_ BitVec 32) (_ BitVec 32) V!40355 V!40355 (_ BitVec 32) Int) ListLongMap!14779)

(declare-fun dynLambda!2090 (Int (_ BitVec 64)) V!40355)

(assert (=> b!1083176 (= lt!479951 (getCurrentListMapNoExtraKeys!3953 lt!479950 (array!69786 (store (arr!33566 _values!874) i!650 (ValueCellFull!12501 (dynLambda!2090 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34102 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083176 (= lt!479949 (getCurrentListMapNoExtraKeys!3953 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083176 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479953 () Unit!35630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69787 (_ BitVec 64) (_ BitVec 32)) Unit!35630)

(assert (=> b!1083176 (= lt!479953 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083177 () Bool)

(declare-fun res!722061 () Bool)

(assert (=> b!1083177 (=> (not res!722061) (not e!618949))))

(assert (=> b!1083177 (= res!722061 (and (= (size!34102 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34103 _keys!1070) (size!34102 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083178 () Bool)

(declare-fun e!618952 () Bool)

(assert (=> b!1083178 (= e!618952 tp_is_empty!26421)))

(declare-fun b!1083179 () Bool)

(declare-fun e!618948 () Bool)

(assert (=> b!1083179 (= e!618948 (and e!618952 mapRes!41386))))

(declare-fun condMapEmpty!41386 () Bool)

(declare-fun mapDefault!41386 () ValueCell!12501)

(assert (=> b!1083179 (= condMapEmpty!41386 (= (arr!33566 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12501)) mapDefault!41386)))))

(declare-fun b!1083180 () Bool)

(declare-fun res!722060 () Bool)

(assert (=> b!1083180 (=> (not res!722060) (not e!618949))))

(assert (=> b!1083180 (= res!722060 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34103 _keys!1070))))))

(declare-fun b!1083181 () Bool)

(declare-fun res!722054 () Bool)

(assert (=> b!1083181 (=> (not res!722054) (not e!618949))))

(declare-datatypes ((List!23397 0))(
  ( (Nil!23394) (Cons!23393 (h!24602 (_ BitVec 64)) (t!32874 List!23397)) )
))
(declare-fun arrayNoDuplicates!0 (array!69787 (_ BitVec 32) List!23397) Bool)

(assert (=> b!1083181 (= res!722054 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23394))))

(declare-fun res!722058 () Bool)

(assert (=> start!95766 (=> (not res!722058) (not e!618949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95766 (= res!722058 (validMask!0 mask!1414))))

(assert (=> start!95766 e!618949))

(assert (=> start!95766 tp!79106))

(assert (=> start!95766 true))

(assert (=> start!95766 tp_is_empty!26421))

(declare-fun array_inv!25904 (array!69787) Bool)

(assert (=> start!95766 (array_inv!25904 _keys!1070)))

(declare-fun array_inv!25905 (array!69785) Bool)

(assert (=> start!95766 (and (array_inv!25905 _values!874) e!618948)))

(declare-fun b!1083173 () Bool)

(assert (=> b!1083173 (= e!618949 e!618950)))

(declare-fun res!722059 () Bool)

(assert (=> b!1083173 (=> (not res!722059) (not e!618950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69787 (_ BitVec 32)) Bool)

(assert (=> b!1083173 (= res!722059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479950 mask!1414))))

(assert (=> b!1083173 (= lt!479950 (array!69788 (store (arr!33567 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34103 _keys!1070)))))

(declare-fun b!1083182 () Bool)

(declare-fun res!722053 () Bool)

(assert (=> b!1083182 (=> (not res!722053) (not e!618950))))

(assert (=> b!1083182 (= res!722053 (arrayNoDuplicates!0 lt!479950 #b00000000000000000000000000000000 Nil!23394))))

(declare-fun mapIsEmpty!41386 () Bool)

(assert (=> mapIsEmpty!41386 mapRes!41386))

(declare-fun b!1083183 () Bool)

(declare-fun res!722055 () Bool)

(assert (=> b!1083183 (=> (not res!722055) (not e!618949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083183 (= res!722055 (validKeyInArray!0 k0!904))))

(declare-fun b!1083184 () Bool)

(declare-fun res!722056 () Bool)

(assert (=> b!1083184 (=> (not res!722056) (not e!618949))))

(assert (=> b!1083184 (= res!722056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95766 res!722058) b!1083177))

(assert (= (and b!1083177 res!722061) b!1083184))

(assert (= (and b!1083184 res!722056) b!1083181))

(assert (= (and b!1083181 res!722054) b!1083180))

(assert (= (and b!1083180 res!722060) b!1083183))

(assert (= (and b!1083183 res!722055) b!1083175))

(assert (= (and b!1083175 res!722057) b!1083173))

(assert (= (and b!1083173 res!722059) b!1083182))

(assert (= (and b!1083182 res!722053) b!1083176))

(assert (= (and b!1083179 condMapEmpty!41386) mapIsEmpty!41386))

(assert (= (and b!1083179 (not condMapEmpty!41386)) mapNonEmpty!41386))

(get-info :version)

(assert (= (and mapNonEmpty!41386 ((_ is ValueCellFull!12501) mapValue!41386)) b!1083174))

(assert (= (and b!1083179 ((_ is ValueCellFull!12501) mapDefault!41386)) b!1083178))

(assert (= start!95766 b!1083179))

(declare-fun b_lambda!17089 () Bool)

(assert (=> (not b_lambda!17089) (not b!1083176)))

(declare-fun t!32872 () Bool)

(declare-fun tb!7297 () Bool)

(assert (=> (and start!95766 (= defaultEntry!882 defaultEntry!882) t!32872) tb!7297))

(declare-fun result!15113 () Bool)

(assert (=> tb!7297 (= result!15113 tp_is_empty!26421)))

(assert (=> b!1083176 t!32872))

(declare-fun b_and!35515 () Bool)

(assert (= b_and!35513 (and (=> t!32872 result!15113) b_and!35515)))

(declare-fun m!1000845 () Bool)

(assert (=> mapNonEmpty!41386 m!1000845))

(declare-fun m!1000847 () Bool)

(assert (=> b!1083184 m!1000847))

(declare-fun m!1000849 () Bool)

(assert (=> start!95766 m!1000849))

(declare-fun m!1000851 () Bool)

(assert (=> start!95766 m!1000851))

(declare-fun m!1000853 () Bool)

(assert (=> start!95766 m!1000853))

(declare-fun m!1000855 () Bool)

(assert (=> b!1083183 m!1000855))

(declare-fun m!1000857 () Bool)

(assert (=> b!1083182 m!1000857))

(declare-fun m!1000859 () Bool)

(assert (=> b!1083173 m!1000859))

(declare-fun m!1000861 () Bool)

(assert (=> b!1083173 m!1000861))

(declare-fun m!1000863 () Bool)

(assert (=> b!1083181 m!1000863))

(declare-fun m!1000865 () Bool)

(assert (=> b!1083176 m!1000865))

(declare-fun m!1000867 () Bool)

(assert (=> b!1083176 m!1000867))

(declare-fun m!1000869 () Bool)

(assert (=> b!1083176 m!1000869))

(declare-fun m!1000871 () Bool)

(assert (=> b!1083176 m!1000871))

(declare-fun m!1000873 () Bool)

(assert (=> b!1083176 m!1000873))

(declare-fun m!1000875 () Bool)

(assert (=> b!1083176 m!1000875))

(declare-fun m!1000877 () Bool)

(assert (=> b!1083176 m!1000877))

(declare-fun m!1000879 () Bool)

(assert (=> b!1083176 m!1000879))

(declare-fun m!1000881 () Bool)

(assert (=> b!1083175 m!1000881))

(check-sat (not b!1083182) (not b!1083183) b_and!35515 tp_is_empty!26421 (not b!1083173) (not b_next!22419) (not start!95766) (not b!1083181) (not b!1083184) (not b!1083176) (not b_lambda!17089) (not mapNonEmpty!41386))
(check-sat b_and!35515 (not b_next!22419))
