; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96878 () Bool)

(assert start!96878)

(declare-fun b_free!23195 () Bool)

(declare-fun b_next!23195 () Bool)

(assert (=> start!96878 (= b_free!23195 (not b_next!23195))))

(declare-fun tp!81541 () Bool)

(declare-fun b_and!37193 () Bool)

(assert (=> start!96878 (= tp!81541 b_and!37193)))

(declare-fun b!1102160 () Bool)

(declare-fun e!629091 () Bool)

(declare-fun tp_is_empty!27245 () Bool)

(assert (=> b!1102160 (= e!629091 tp_is_empty!27245)))

(declare-fun b!1102161 () Bool)

(declare-fun res!735420 () Bool)

(declare-fun e!629092 () Bool)

(assert (=> b!1102161 (=> (not res!735420) (not e!629092))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102161 (= res!735420 (validKeyInArray!0 k!904))))

(declare-fun b!1102162 () Bool)

(declare-fun res!735427 () Bool)

(assert (=> b!1102162 (=> (not res!735427) (not e!629092))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71411 0))(
  ( (array!71412 (arr!34367 (Array (_ BitVec 32) (_ BitVec 64))) (size!34903 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71411)

(declare-datatypes ((V!41453 0))(
  ( (V!41454 (val!13679 Int)) )
))
(declare-datatypes ((ValueCell!12913 0))(
  ( (ValueCellFull!12913 (v!16310 V!41453)) (EmptyCell!12913) )
))
(declare-datatypes ((array!71413 0))(
  ( (array!71414 (arr!34368 (Array (_ BitVec 32) ValueCell!12913)) (size!34904 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71413)

(assert (=> b!1102162 (= res!735427 (and (= (size!34904 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34903 _keys!1070) (size!34904 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102163 () Bool)

(declare-fun res!735424 () Bool)

(assert (=> b!1102163 (=> (not res!735424) (not e!629092))))

(declare-datatypes ((List!24015 0))(
  ( (Nil!24012) (Cons!24011 (h!25220 (_ BitVec 64)) (t!34256 List!24015)) )
))
(declare-fun arrayNoDuplicates!0 (array!71411 (_ BitVec 32) List!24015) Bool)

(assert (=> b!1102163 (= res!735424 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24012))))

(declare-fun res!735428 () Bool)

(assert (=> start!96878 (=> (not res!735428) (not e!629092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96878 (= res!735428 (validMask!0 mask!1414))))

(assert (=> start!96878 e!629092))

(assert (=> start!96878 tp!81541))

(assert (=> start!96878 true))

(assert (=> start!96878 tp_is_empty!27245))

(declare-fun array_inv!26472 (array!71411) Bool)

(assert (=> start!96878 (array_inv!26472 _keys!1070)))

(declare-fun e!629095 () Bool)

(declare-fun array_inv!26473 (array!71413) Bool)

(assert (=> start!96878 (and (array_inv!26473 _values!874) e!629095)))

(declare-fun b!1102164 () Bool)

(declare-fun res!735430 () Bool)

(assert (=> b!1102164 (=> (not res!735430) (not e!629092))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102164 (= res!735430 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34903 _keys!1070))))))

(declare-fun mapIsEmpty!42658 () Bool)

(declare-fun mapRes!42658 () Bool)

(assert (=> mapIsEmpty!42658 mapRes!42658))

(declare-fun e!629089 () Bool)

(declare-fun b!1102165 () Bool)

(declare-datatypes ((tuple2!17400 0))(
  ( (tuple2!17401 (_1!8711 (_ BitVec 64)) (_2!8711 V!41453)) )
))
(declare-datatypes ((List!24016 0))(
  ( (Nil!24013) (Cons!24012 (h!25221 tuple2!17400) (t!34257 List!24016)) )
))
(declare-datatypes ((ListLongMap!15369 0))(
  ( (ListLongMap!15370 (toList!7700 List!24016)) )
))
(declare-fun lt!494404 () ListLongMap!15369)

(declare-fun lt!494405 () ListLongMap!15369)

(declare-fun -!983 (ListLongMap!15369 (_ BitVec 64)) ListLongMap!15369)

(assert (=> b!1102165 (= e!629089 (= (-!983 lt!494404 k!904) lt!494405))))

(declare-fun lt!494409 () ListLongMap!15369)

(declare-fun lt!494411 () ListLongMap!15369)

(assert (=> b!1102165 (= (-!983 lt!494409 k!904) lt!494411)))

(declare-fun minValue!831 () V!41453)

(declare-fun lt!494410 () ListLongMap!15369)

(declare-datatypes ((Unit!36218 0))(
  ( (Unit!36219) )
))
(declare-fun lt!494415 () Unit!36218)

(declare-fun addRemoveCommutativeForDiffKeys!140 (ListLongMap!15369 (_ BitVec 64) V!41453 (_ BitVec 64)) Unit!36218)

(assert (=> b!1102165 (= lt!494415 (addRemoveCommutativeForDiffKeys!140 lt!494410 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1102166 () Bool)

(declare-fun res!735429 () Bool)

(declare-fun e!629094 () Bool)

(assert (=> b!1102166 (=> (not res!735429) (not e!629094))))

(declare-fun lt!494408 () array!71411)

(assert (=> b!1102166 (= res!735429 (arrayNoDuplicates!0 lt!494408 #b00000000000000000000000000000000 Nil!24012))))

(declare-fun b!1102167 () Bool)

(declare-fun e!629093 () Bool)

(assert (=> b!1102167 (= e!629093 e!629089)))

(declare-fun res!735422 () Bool)

(assert (=> b!1102167 (=> res!735422 e!629089)))

(assert (=> b!1102167 (= res!735422 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(assert (=> b!1102167 (= lt!494404 lt!494409)))

(declare-fun lt!494412 () tuple2!17400)

(declare-fun +!3403 (ListLongMap!15369 tuple2!17400) ListLongMap!15369)

(assert (=> b!1102167 (= lt!494409 (+!3403 lt!494410 lt!494412))))

(assert (=> b!1102167 (= lt!494405 lt!494411)))

(declare-fun lt!494416 () ListLongMap!15369)

(assert (=> b!1102167 (= lt!494411 (+!3403 lt!494416 lt!494412))))

(declare-fun lt!494413 () ListLongMap!15369)

(assert (=> b!1102167 (= lt!494405 (+!3403 lt!494413 lt!494412))))

(assert (=> b!1102167 (= lt!494412 (tuple2!17401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1102168 () Bool)

(assert (=> b!1102168 (= e!629094 (not e!629093))))

(declare-fun res!735426 () Bool)

(assert (=> b!1102168 (=> res!735426 e!629093)))

(assert (=> b!1102168 (= res!735426 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41453)

(declare-fun getCurrentListMap!4404 (array!71411 array!71413 (_ BitVec 32) (_ BitVec 32) V!41453 V!41453 (_ BitVec 32) Int) ListLongMap!15369)

(assert (=> b!1102168 (= lt!494404 (getCurrentListMap!4404 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494414 () array!71413)

(assert (=> b!1102168 (= lt!494405 (getCurrentListMap!4404 lt!494408 lt!494414 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1102168 (and (= lt!494413 lt!494416) (= lt!494416 lt!494413))))

(assert (=> b!1102168 (= lt!494416 (-!983 lt!494410 k!904))))

(declare-fun lt!494406 () Unit!36218)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!230 (array!71411 array!71413 (_ BitVec 32) (_ BitVec 32) V!41453 V!41453 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36218)

(assert (=> b!1102168 (= lt!494406 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4200 (array!71411 array!71413 (_ BitVec 32) (_ BitVec 32) V!41453 V!41453 (_ BitVec 32) Int) ListLongMap!15369)

(assert (=> b!1102168 (= lt!494413 (getCurrentListMapNoExtraKeys!4200 lt!494408 lt!494414 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2335 (Int (_ BitVec 64)) V!41453)

(assert (=> b!1102168 (= lt!494414 (array!71414 (store (arr!34368 _values!874) i!650 (ValueCellFull!12913 (dynLambda!2335 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34904 _values!874)))))

(assert (=> b!1102168 (= lt!494410 (getCurrentListMapNoExtraKeys!4200 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102168 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!494407 () Unit!36218)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71411 (_ BitVec 64) (_ BitVec 32)) Unit!36218)

(assert (=> b!1102168 (= lt!494407 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1102169 () Bool)

(declare-fun e!629090 () Bool)

(assert (=> b!1102169 (= e!629090 tp_is_empty!27245)))

(declare-fun b!1102170 () Bool)

(assert (=> b!1102170 (= e!629095 (and e!629090 mapRes!42658))))

(declare-fun condMapEmpty!42658 () Bool)

(declare-fun mapDefault!42658 () ValueCell!12913)

