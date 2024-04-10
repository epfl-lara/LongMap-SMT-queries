; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95712 () Bool)

(assert start!95712)

(declare-fun b_free!22365 () Bool)

(declare-fun b_next!22365 () Bool)

(assert (=> start!95712 (= b_free!22365 (not b_next!22365))))

(declare-fun tp!78943 () Bool)

(declare-fun b_and!35405 () Bool)

(assert (=> start!95712 (= tp!78943 b_and!35405)))

(declare-fun mapNonEmpty!41305 () Bool)

(declare-fun mapRes!41305 () Bool)

(declare-fun tp!78944 () Bool)

(declare-fun e!618464 () Bool)

(assert (=> mapNonEmpty!41305 (= mapRes!41305 (and tp!78944 e!618464))))

(declare-datatypes ((V!40283 0))(
  ( (V!40284 (val!13240 Int)) )
))
(declare-datatypes ((ValueCell!12474 0))(
  ( (ValueCellFull!12474 (v!15861 V!40283)) (EmptyCell!12474) )
))
(declare-fun mapRest!41305 () (Array (_ BitVec 32) ValueCell!12474))

(declare-datatypes ((array!69681 0))(
  ( (array!69682 (arr!33514 (Array (_ BitVec 32) ValueCell!12474)) (size!34050 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69681)

(declare-fun mapKey!41305 () (_ BitVec 32))

(declare-fun mapValue!41305 () ValueCell!12474)

(assert (=> mapNonEmpty!41305 (= (arr!33514 _values!874) (store mapRest!41305 mapKey!41305 mapValue!41305))))

(declare-fun mapIsEmpty!41305 () Bool)

(assert (=> mapIsEmpty!41305 mapRes!41305))

(declare-fun res!721331 () Bool)

(declare-fun e!618466 () Bool)

(assert (=> start!95712 (=> (not res!721331) (not e!618466))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95712 (= res!721331 (validMask!0 mask!1414))))

(assert (=> start!95712 e!618466))

(assert (=> start!95712 tp!78943))

(assert (=> start!95712 true))

(declare-fun tp_is_empty!26367 () Bool)

(assert (=> start!95712 tp_is_empty!26367))

(declare-datatypes ((array!69683 0))(
  ( (array!69684 (arr!33515 (Array (_ BitVec 32) (_ BitVec 64))) (size!34051 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69683)

(declare-fun array_inv!25872 (array!69683) Bool)

(assert (=> start!95712 (array_inv!25872 _keys!1070)))

(declare-fun e!618465 () Bool)

(declare-fun array_inv!25873 (array!69681) Bool)

(assert (=> start!95712 (and (array_inv!25873 _values!874) e!618465)))

(declare-fun b!1082147 () Bool)

(declare-fun res!721332 () Bool)

(assert (=> b!1082147 (=> (not res!721332) (not e!618466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69683 (_ BitVec 32)) Bool)

(assert (=> b!1082147 (= res!721332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082148 () Bool)

(declare-fun e!618467 () Bool)

(assert (=> b!1082148 (= e!618466 e!618467)))

(declare-fun res!721324 () Bool)

(assert (=> b!1082148 (=> (not res!721324) (not e!618467))))

(declare-fun lt!479525 () array!69683)

(assert (=> b!1082148 (= res!721324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479525 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082148 (= lt!479525 (array!69684 (store (arr!33515 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34051 _keys!1070)))))

(declare-fun b!1082149 () Bool)

(declare-fun e!618462 () Bool)

(assert (=> b!1082149 (= e!618462 tp_is_empty!26367)))

(declare-fun b!1082150 () Bool)

(declare-fun res!721330 () Bool)

(assert (=> b!1082150 (=> (not res!721330) (not e!618466))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1082150 (= res!721330 (= (select (arr!33515 _keys!1070) i!650) k0!904))))

(declare-fun b!1082151 () Bool)

(assert (=> b!1082151 (= e!618464 tp_is_empty!26367)))

(declare-fun b!1082152 () Bool)

(assert (=> b!1082152 (= e!618467 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40283)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16776 0))(
  ( (tuple2!16777 (_1!8399 (_ BitVec 64)) (_2!8399 V!40283)) )
))
(declare-datatypes ((List!23358 0))(
  ( (Nil!23355) (Cons!23354 (h!24563 tuple2!16776) (t!32781 List!23358)) )
))
(declare-datatypes ((ListLongMap!14745 0))(
  ( (ListLongMap!14746 (toList!7388 List!23358)) )
))
(declare-fun lt!479527 () ListLongMap!14745)

(declare-fun zeroValue!831 () V!40283)

(declare-fun getCurrentListMapNoExtraKeys!3936 (array!69683 array!69681 (_ BitVec 32) (_ BitVec 32) V!40283 V!40283 (_ BitVec 32) Int) ListLongMap!14745)

(declare-fun dynLambda!2073 (Int (_ BitVec 64)) V!40283)

(assert (=> b!1082152 (= lt!479527 (getCurrentListMapNoExtraKeys!3936 lt!479525 (array!69682 (store (arr!33514 _values!874) i!650 (ValueCellFull!12474 (dynLambda!2073 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34050 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479524 () ListLongMap!14745)

(assert (=> b!1082152 (= lt!479524 (getCurrentListMapNoExtraKeys!3936 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082152 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35596 0))(
  ( (Unit!35597) )
))
(declare-fun lt!479526 () Unit!35596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69683 (_ BitVec 64) (_ BitVec 32)) Unit!35596)

(assert (=> b!1082152 (= lt!479526 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082153 () Bool)

(declare-fun res!721329 () Bool)

(assert (=> b!1082153 (=> (not res!721329) (not e!618467))))

(declare-datatypes ((List!23359 0))(
  ( (Nil!23356) (Cons!23355 (h!24564 (_ BitVec 64)) (t!32782 List!23359)) )
))
(declare-fun arrayNoDuplicates!0 (array!69683 (_ BitVec 32) List!23359) Bool)

(assert (=> b!1082153 (= res!721329 (arrayNoDuplicates!0 lt!479525 #b00000000000000000000000000000000 Nil!23356))))

(declare-fun b!1082154 () Bool)

(declare-fun res!721328 () Bool)

(assert (=> b!1082154 (=> (not res!721328) (not e!618466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082154 (= res!721328 (validKeyInArray!0 k0!904))))

(declare-fun b!1082155 () Bool)

(declare-fun res!721325 () Bool)

(assert (=> b!1082155 (=> (not res!721325) (not e!618466))))

(assert (=> b!1082155 (= res!721325 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34051 _keys!1070))))))

(declare-fun b!1082156 () Bool)

(assert (=> b!1082156 (= e!618465 (and e!618462 mapRes!41305))))

(declare-fun condMapEmpty!41305 () Bool)

(declare-fun mapDefault!41305 () ValueCell!12474)

(assert (=> b!1082156 (= condMapEmpty!41305 (= (arr!33514 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12474)) mapDefault!41305)))))

(declare-fun b!1082157 () Bool)

(declare-fun res!721327 () Bool)

(assert (=> b!1082157 (=> (not res!721327) (not e!618466))))

(assert (=> b!1082157 (= res!721327 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23356))))

(declare-fun b!1082158 () Bool)

(declare-fun res!721326 () Bool)

(assert (=> b!1082158 (=> (not res!721326) (not e!618466))))

(assert (=> b!1082158 (= res!721326 (and (= (size!34050 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34051 _keys!1070) (size!34050 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95712 res!721331) b!1082158))

(assert (= (and b!1082158 res!721326) b!1082147))

(assert (= (and b!1082147 res!721332) b!1082157))

(assert (= (and b!1082157 res!721327) b!1082155))

(assert (= (and b!1082155 res!721325) b!1082154))

(assert (= (and b!1082154 res!721328) b!1082150))

(assert (= (and b!1082150 res!721330) b!1082148))

(assert (= (and b!1082148 res!721324) b!1082153))

(assert (= (and b!1082153 res!721329) b!1082152))

(assert (= (and b!1082156 condMapEmpty!41305) mapIsEmpty!41305))

(assert (= (and b!1082156 (not condMapEmpty!41305)) mapNonEmpty!41305))

(get-info :version)

(assert (= (and mapNonEmpty!41305 ((_ is ValueCellFull!12474) mapValue!41305)) b!1082151))

(assert (= (and b!1082156 ((_ is ValueCellFull!12474) mapDefault!41305)) b!1082149))

(assert (= start!95712 b!1082156))

(declare-fun b_lambda!17035 () Bool)

(assert (=> (not b_lambda!17035) (not b!1082152)))

(declare-fun t!32780 () Bool)

(declare-fun tb!7243 () Bool)

(assert (=> (and start!95712 (= defaultEntry!882 defaultEntry!882) t!32780) tb!7243))

(declare-fun result!15005 () Bool)

(assert (=> tb!7243 (= result!15005 tp_is_empty!26367)))

(assert (=> b!1082152 t!32780))

(declare-fun b_and!35407 () Bool)

(assert (= b_and!35405 (and (=> t!32780 result!15005) b_and!35407)))

(declare-fun m!999863 () Bool)

(assert (=> b!1082153 m!999863))

(declare-fun m!999865 () Bool)

(assert (=> b!1082150 m!999865))

(declare-fun m!999867 () Bool)

(assert (=> b!1082152 m!999867))

(declare-fun m!999869 () Bool)

(assert (=> b!1082152 m!999869))

(declare-fun m!999871 () Bool)

(assert (=> b!1082152 m!999871))

(declare-fun m!999873 () Bool)

(assert (=> b!1082152 m!999873))

(declare-fun m!999875 () Bool)

(assert (=> b!1082152 m!999875))

(declare-fun m!999877 () Bool)

(assert (=> b!1082152 m!999877))

(declare-fun m!999879 () Bool)

(assert (=> mapNonEmpty!41305 m!999879))

(declare-fun m!999881 () Bool)

(assert (=> b!1082148 m!999881))

(declare-fun m!999883 () Bool)

(assert (=> b!1082148 m!999883))

(declare-fun m!999885 () Bool)

(assert (=> start!95712 m!999885))

(declare-fun m!999887 () Bool)

(assert (=> start!95712 m!999887))

(declare-fun m!999889 () Bool)

(assert (=> start!95712 m!999889))

(declare-fun m!999891 () Bool)

(assert (=> b!1082154 m!999891))

(declare-fun m!999893 () Bool)

(assert (=> b!1082147 m!999893))

(declare-fun m!999895 () Bool)

(assert (=> b!1082157 m!999895))

(check-sat (not b!1082147) tp_is_empty!26367 (not b!1082152) (not start!95712) (not b!1082153) (not mapNonEmpty!41305) b_and!35407 (not b!1082154) (not b!1082148) (not b_next!22365) (not b!1082157) (not b_lambda!17035))
(check-sat b_and!35407 (not b_next!22365))
