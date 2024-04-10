; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95902 () Bool)

(assert start!95902)

(declare-fun b_free!22555 () Bool)

(declare-fun b_next!22555 () Bool)

(assert (=> start!95902 (= b_free!22555 (not b_next!22555))))

(declare-fun tp!79513 () Bool)

(declare-fun b_and!35785 () Bool)

(assert (=> start!95902 (= tp!79513 b_and!35785)))

(declare-fun b!1085941 () Bool)

(declare-fun res!724082 () Bool)

(declare-fun e!620347 () Bool)

(assert (=> b!1085941 (=> (not res!724082) (not e!620347))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085941 (= res!724082 (validKeyInArray!0 k!904))))

(declare-fun b!1085942 () Bool)

(declare-fun e!620351 () Bool)

(assert (=> b!1085942 (= e!620347 e!620351)))

(declare-fun res!724073 () Bool)

(assert (=> b!1085942 (=> (not res!724073) (not e!620351))))

(declare-datatypes ((array!70049 0))(
  ( (array!70050 (arr!33698 (Array (_ BitVec 32) (_ BitVec 64))) (size!34234 (_ BitVec 32))) )
))
(declare-fun lt!482267 () array!70049)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70049 (_ BitVec 32)) Bool)

(assert (=> b!1085942 (= res!724073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482267 mask!1414))))

(declare-fun _keys!1070 () array!70049)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085942 (= lt!482267 (array!70050 (store (arr!33698 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34234 _keys!1070)))))

(declare-fun b!1085943 () Bool)

(declare-fun e!620350 () Bool)

(declare-fun tp_is_empty!26557 () Bool)

(assert (=> b!1085943 (= e!620350 tp_is_empty!26557)))

(declare-fun b!1085944 () Bool)

(declare-fun res!724075 () Bool)

(assert (=> b!1085944 (=> (not res!724075) (not e!620347))))

(assert (=> b!1085944 (= res!724075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085945 () Bool)

(declare-fun res!724074 () Bool)

(assert (=> b!1085945 (=> (not res!724074) (not e!620347))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40537 0))(
  ( (V!40538 (val!13335 Int)) )
))
(declare-datatypes ((ValueCell!12569 0))(
  ( (ValueCellFull!12569 (v!15956 V!40537)) (EmptyCell!12569) )
))
(declare-datatypes ((array!70051 0))(
  ( (array!70052 (arr!33699 (Array (_ BitVec 32) ValueCell!12569)) (size!34235 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70051)

(assert (=> b!1085945 (= res!724074 (and (= (size!34235 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34234 _keys!1070) (size!34235 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085946 () Bool)

(declare-fun e!620349 () Bool)

(declare-fun e!620352 () Bool)

(assert (=> b!1085946 (= e!620349 e!620352)))

(declare-fun res!724077 () Bool)

(assert (=> b!1085946 (=> res!724077 e!620352)))

(assert (=> b!1085946 (= res!724077 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!16912 0))(
  ( (tuple2!16913 (_1!8467 (_ BitVec 64)) (_2!8467 V!40537)) )
))
(declare-datatypes ((List!23501 0))(
  ( (Nil!23498) (Cons!23497 (h!24706 tuple2!16912) (t!33114 List!23501)) )
))
(declare-datatypes ((ListLongMap!14881 0))(
  ( (ListLongMap!14882 (toList!7456 List!23501)) )
))
(declare-fun lt!482266 () ListLongMap!14881)

(declare-fun lt!482274 () ListLongMap!14881)

(assert (=> b!1085946 (= lt!482266 lt!482274)))

(declare-fun lt!482268 () ListLongMap!14881)

(declare-fun -!782 (ListLongMap!14881 (_ BitVec 64)) ListLongMap!14881)

(assert (=> b!1085946 (= lt!482266 (-!782 lt!482268 k!904))))

(declare-fun lt!482269 () ListLongMap!14881)

(declare-datatypes ((Unit!35730 0))(
  ( (Unit!35731) )
))
(declare-fun lt!482272 () Unit!35730)

(declare-fun zeroValue!831 () V!40537)

(declare-fun addRemoveCommutativeForDiffKeys!20 (ListLongMap!14881 (_ BitVec 64) V!40537 (_ BitVec 64)) Unit!35730)

(assert (=> b!1085946 (= lt!482272 (addRemoveCommutativeForDiffKeys!20 lt!482269 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!482271 () ListLongMap!14881)

(declare-fun lt!482273 () tuple2!16912)

(declare-fun +!3264 (ListLongMap!14881 tuple2!16912) ListLongMap!14881)

(assert (=> b!1085946 (= lt!482271 (+!3264 lt!482274 lt!482273))))

(declare-fun lt!482279 () ListLongMap!14881)

(declare-fun lt!482270 () tuple2!16912)

(assert (=> b!1085946 (= lt!482274 (+!3264 lt!482279 lt!482270))))

(declare-fun lt!482280 () ListLongMap!14881)

(declare-fun lt!482275 () ListLongMap!14881)

(assert (=> b!1085946 (= lt!482280 lt!482275)))

(assert (=> b!1085946 (= lt!482275 (+!3264 lt!482268 lt!482273))))

(assert (=> b!1085946 (= lt!482268 (+!3264 lt!482269 lt!482270))))

(declare-fun lt!482278 () ListLongMap!14881)

(assert (=> b!1085946 (= lt!482271 (+!3264 (+!3264 lt!482278 lt!482270) lt!482273))))

(declare-fun minValue!831 () V!40537)

(assert (=> b!1085946 (= lt!482273 (tuple2!16913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085946 (= lt!482270 (tuple2!16913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085947 () Bool)

(declare-fun res!724076 () Bool)

(assert (=> b!1085947 (=> (not res!724076) (not e!620347))))

(assert (=> b!1085947 (= res!724076 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34234 _keys!1070))))))

(declare-fun b!1085948 () Bool)

(declare-fun e!620348 () Bool)

(declare-fun mapRes!41590 () Bool)

(assert (=> b!1085948 (= e!620348 (and e!620350 mapRes!41590))))

(declare-fun condMapEmpty!41590 () Bool)

(declare-fun mapDefault!41590 () ValueCell!12569)

