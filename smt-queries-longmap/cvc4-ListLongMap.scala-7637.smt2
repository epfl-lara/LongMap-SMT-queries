; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96146 () Bool)

(assert start!96146)

(declare-fun b_free!22799 () Bool)

(declare-fun b_next!22799 () Bool)

(assert (=> start!96146 (= b_free!22799 (not b_next!22799))))

(declare-fun tp!80245 () Bool)

(declare-fun b_and!36273 () Bool)

(assert (=> start!96146 (= tp!80245 b_and!36273)))

(declare-fun b!1091327 () Bool)

(declare-fun res!728127 () Bool)

(declare-fun e!623277 () Bool)

(assert (=> b!1091327 (=> (not res!728127) (not e!623277))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70521 0))(
  ( (array!70522 (arr!33934 (Array (_ BitVec 32) (_ BitVec 64))) (size!34470 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70521)

(assert (=> b!1091327 (= res!728127 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34470 _keys!1070))))))

(declare-fun b!1091328 () Bool)

(declare-fun e!623278 () Bool)

(assert (=> b!1091328 (= e!623278 true)))

(declare-datatypes ((V!40861 0))(
  ( (V!40862 (val!13457 Int)) )
))
(declare-datatypes ((tuple2!17116 0))(
  ( (tuple2!17117 (_1!8569 (_ BitVec 64)) (_2!8569 V!40861)) )
))
(declare-datatypes ((List!23700 0))(
  ( (Nil!23697) (Cons!23696 (h!24905 tuple2!17116) (t!33557 List!23700)) )
))
(declare-datatypes ((ListLongMap!15085 0))(
  ( (ListLongMap!15086 (toList!7558 List!23700)) )
))
(declare-fun lt!487328 () ListLongMap!15085)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!487321 () ListLongMap!15085)

(declare-fun -!879 (ListLongMap!15085 (_ BitVec 64)) ListLongMap!15085)

(assert (=> b!1091328 (= (-!879 lt!487328 k!904) lt!487321)))

(declare-datatypes ((Unit!35924 0))(
  ( (Unit!35925) )
))
(declare-fun lt!487331 () Unit!35924)

(declare-fun minValue!831 () V!40861)

(declare-fun lt!487326 () ListLongMap!15085)

(declare-fun addRemoveCommutativeForDiffKeys!101 (ListLongMap!15085 (_ BitVec 64) V!40861 (_ BitVec 64)) Unit!35924)

(assert (=> b!1091328 (= lt!487331 (addRemoveCommutativeForDiffKeys!101 lt!487326 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun mapNonEmpty!41956 () Bool)

(declare-fun mapRes!41956 () Bool)

(declare-fun tp!80246 () Bool)

(declare-fun e!623281 () Bool)

(assert (=> mapNonEmpty!41956 (= mapRes!41956 (and tp!80246 e!623281))))

(declare-fun mapKey!41956 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12691 0))(
  ( (ValueCellFull!12691 (v!16078 V!40861)) (EmptyCell!12691) )
))
(declare-fun mapValue!41956 () ValueCell!12691)

(declare-fun mapRest!41956 () (Array (_ BitVec 32) ValueCell!12691))

(declare-datatypes ((array!70523 0))(
  ( (array!70524 (arr!33935 (Array (_ BitVec 32) ValueCell!12691)) (size!34471 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70523)

(assert (=> mapNonEmpty!41956 (= (arr!33935 _values!874) (store mapRest!41956 mapKey!41956 mapValue!41956))))

(declare-fun b!1091329 () Bool)

(declare-fun res!728122 () Bool)

(assert (=> b!1091329 (=> (not res!728122) (not e!623277))))

(assert (=> b!1091329 (= res!728122 (= (select (arr!33934 _keys!1070) i!650) k!904))))

(declare-fun b!1091330 () Bool)

(declare-fun res!728124 () Bool)

(assert (=> b!1091330 (=> (not res!728124) (not e!623277))))

(declare-datatypes ((List!23701 0))(
  ( (Nil!23698) (Cons!23697 (h!24906 (_ BitVec 64)) (t!33558 List!23701)) )
))
(declare-fun arrayNoDuplicates!0 (array!70521 (_ BitVec 32) List!23701) Bool)

(assert (=> b!1091330 (= res!728124 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23698))))

(declare-fun mapIsEmpty!41956 () Bool)

(assert (=> mapIsEmpty!41956 mapRes!41956))

(declare-fun b!1091331 () Bool)

(declare-fun e!623282 () Bool)

(declare-fun tp_is_empty!26801 () Bool)

(assert (=> b!1091331 (= e!623282 tp_is_empty!26801)))

(declare-fun b!1091332 () Bool)

(declare-fun res!728126 () Bool)

(assert (=> b!1091332 (=> (not res!728126) (not e!623277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091332 (= res!728126 (validKeyInArray!0 k!904))))

(declare-fun b!1091333 () Bool)

(declare-fun res!728123 () Bool)

(assert (=> b!1091333 (=> (not res!728123) (not e!623277))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091333 (= res!728123 (and (= (size!34471 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34470 _keys!1070) (size!34471 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!728119 () Bool)

(assert (=> start!96146 (=> (not res!728119) (not e!623277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96146 (= res!728119 (validMask!0 mask!1414))))

(assert (=> start!96146 e!623277))

(assert (=> start!96146 tp!80245))

(assert (=> start!96146 true))

(assert (=> start!96146 tp_is_empty!26801))

(declare-fun array_inv!26166 (array!70521) Bool)

(assert (=> start!96146 (array_inv!26166 _keys!1070)))

(declare-fun e!623276 () Bool)

(declare-fun array_inv!26167 (array!70523) Bool)

(assert (=> start!96146 (and (array_inv!26167 _values!874) e!623276)))

(declare-fun b!1091334 () Bool)

(declare-fun e!623275 () Bool)

(assert (=> b!1091334 (= e!623275 e!623278)))

(declare-fun res!728117 () Bool)

(assert (=> b!1091334 (=> res!728117 e!623278)))

(assert (=> b!1091334 (= res!728117 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!487327 () ListLongMap!15085)

(assert (=> b!1091334 (= lt!487327 lt!487328)))

(declare-fun lt!487324 () tuple2!17116)

(declare-fun +!3343 (ListLongMap!15085 tuple2!17116) ListLongMap!15085)

(assert (=> b!1091334 (= lt!487328 (+!3343 lt!487326 lt!487324))))

(declare-fun lt!487330 () ListLongMap!15085)

(assert (=> b!1091334 (= lt!487330 lt!487321)))

(declare-fun lt!487323 () ListLongMap!15085)

(assert (=> b!1091334 (= lt!487321 (+!3343 lt!487323 lt!487324))))

(declare-fun lt!487322 () ListLongMap!15085)

(assert (=> b!1091334 (= lt!487330 (+!3343 lt!487322 lt!487324))))

(assert (=> b!1091334 (= lt!487324 (tuple2!17117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091335 () Bool)

(assert (=> b!1091335 (= e!623281 tp_is_empty!26801)))

(declare-fun b!1091336 () Bool)

(declare-fun e!623279 () Bool)

(assert (=> b!1091336 (= e!623277 e!623279)))

(declare-fun res!728121 () Bool)

(assert (=> b!1091336 (=> (not res!728121) (not e!623279))))

(declare-fun lt!487329 () array!70521)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70521 (_ BitVec 32)) Bool)

(assert (=> b!1091336 (= res!728121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487329 mask!1414))))

(assert (=> b!1091336 (= lt!487329 (array!70522 (store (arr!33934 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34470 _keys!1070)))))

(declare-fun b!1091337 () Bool)

(declare-fun res!728120 () Bool)

(assert (=> b!1091337 (=> (not res!728120) (not e!623277))))

(assert (=> b!1091337 (= res!728120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091338 () Bool)

(assert (=> b!1091338 (= e!623279 (not e!623275))))

(declare-fun res!728118 () Bool)

(assert (=> b!1091338 (=> res!728118 e!623275)))

(assert (=> b!1091338 (= res!728118 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40861)

(declare-fun getCurrentListMap!4319 (array!70521 array!70523 (_ BitVec 32) (_ BitVec 32) V!40861 V!40861 (_ BitVec 32) Int) ListLongMap!15085)

(assert (=> b!1091338 (= lt!487327 (getCurrentListMap!4319 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487333 () array!70523)

(assert (=> b!1091338 (= lt!487330 (getCurrentListMap!4319 lt!487329 lt!487333 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091338 (and (= lt!487322 lt!487323) (= lt!487323 lt!487322))))

(assert (=> b!1091338 (= lt!487323 (-!879 lt!487326 k!904))))

(declare-fun lt!487325 () Unit!35924)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!138 (array!70521 array!70523 (_ BitVec 32) (_ BitVec 32) V!40861 V!40861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35924)

(assert (=> b!1091338 (= lt!487325 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!138 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4079 (array!70521 array!70523 (_ BitVec 32) (_ BitVec 32) V!40861 V!40861 (_ BitVec 32) Int) ListLongMap!15085)

(assert (=> b!1091338 (= lt!487322 (getCurrentListMapNoExtraKeys!4079 lt!487329 lt!487333 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2216 (Int (_ BitVec 64)) V!40861)

(assert (=> b!1091338 (= lt!487333 (array!70524 (store (arr!33935 _values!874) i!650 (ValueCellFull!12691 (dynLambda!2216 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34471 _values!874)))))

(assert (=> b!1091338 (= lt!487326 (getCurrentListMapNoExtraKeys!4079 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091338 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!487332 () Unit!35924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70521 (_ BitVec 64) (_ BitVec 32)) Unit!35924)

(assert (=> b!1091338 (= lt!487332 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1091339 () Bool)

(declare-fun res!728125 () Bool)

(assert (=> b!1091339 (=> (not res!728125) (not e!623279))))

(assert (=> b!1091339 (= res!728125 (arrayNoDuplicates!0 lt!487329 #b00000000000000000000000000000000 Nil!23698))))

(declare-fun b!1091340 () Bool)

(assert (=> b!1091340 (= e!623276 (and e!623282 mapRes!41956))))

(declare-fun condMapEmpty!41956 () Bool)

(declare-fun mapDefault!41956 () ValueCell!12691)

