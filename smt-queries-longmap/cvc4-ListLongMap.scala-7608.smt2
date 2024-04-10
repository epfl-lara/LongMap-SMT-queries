; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95972 () Bool)

(assert start!95972)

(declare-fun b_free!22625 () Bool)

(declare-fun b_next!22625 () Bool)

(assert (=> start!95972 (= b_free!22625 (not b_next!22625))))

(declare-fun tp!79723 () Bool)

(declare-fun b_and!35925 () Bool)

(assert (=> start!95972 (= tp!79723 b_and!35925)))

(declare-fun b!1087490 () Bool)

(declare-fun e!621191 () Bool)

(declare-fun e!621187 () Bool)

(assert (=> b!1087490 (= e!621191 (not e!621187))))

(declare-fun res!725237 () Bool)

(assert (=> b!1087490 (=> res!725237 e!621187)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087490 (= res!725237 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40629 0))(
  ( (V!40630 (val!13370 Int)) )
))
(declare-fun minValue!831 () V!40629)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16968 0))(
  ( (tuple2!16969 (_1!8495 (_ BitVec 64)) (_2!8495 V!40629)) )
))
(declare-datatypes ((List!23555 0))(
  ( (Nil!23552) (Cons!23551 (h!24760 tuple2!16968) (t!33238 List!23555)) )
))
(declare-datatypes ((ListLongMap!14937 0))(
  ( (ListLongMap!14938 (toList!7484 List!23555)) )
))
(declare-fun lt!483960 () ListLongMap!14937)

(declare-fun zeroValue!831 () V!40629)

(declare-datatypes ((array!70181 0))(
  ( (array!70182 (arr!33764 (Array (_ BitVec 32) (_ BitVec 64))) (size!34300 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70181)

(declare-datatypes ((ValueCell!12604 0))(
  ( (ValueCellFull!12604 (v!15991 V!40629)) (EmptyCell!12604) )
))
(declare-datatypes ((array!70183 0))(
  ( (array!70184 (arr!33765 (Array (_ BitVec 32) ValueCell!12604)) (size!34301 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70183)

(declare-fun getCurrentListMap!4259 (array!70181 array!70183 (_ BitVec 32) (_ BitVec 32) V!40629 V!40629 (_ BitVec 32) Int) ListLongMap!14937)

(assert (=> b!1087490 (= lt!483960 (getCurrentListMap!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483957 () array!70183)

(declare-fun lt!483962 () ListLongMap!14937)

(declare-fun lt!483958 () array!70181)

(assert (=> b!1087490 (= lt!483962 (getCurrentListMap!4259 lt!483958 lt!483957 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483959 () ListLongMap!14937)

(declare-fun lt!483967 () ListLongMap!14937)

(assert (=> b!1087490 (and (= lt!483959 lt!483967) (= lt!483967 lt!483959))))

(declare-fun lt!483955 () ListLongMap!14937)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!809 (ListLongMap!14937 (_ BitVec 64)) ListLongMap!14937)

(assert (=> b!1087490 (= lt!483967 (-!809 lt!483955 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35784 0))(
  ( (Unit!35785) )
))
(declare-fun lt!483961 () Unit!35784)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!78 (array!70181 array!70183 (_ BitVec 32) (_ BitVec 32) V!40629 V!40629 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35784)

(assert (=> b!1087490 (= lt!483961 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!78 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4019 (array!70181 array!70183 (_ BitVec 32) (_ BitVec 32) V!40629 V!40629 (_ BitVec 32) Int) ListLongMap!14937)

(assert (=> b!1087490 (= lt!483959 (getCurrentListMapNoExtraKeys!4019 lt!483958 lt!483957 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2156 (Int (_ BitVec 64)) V!40629)

(assert (=> b!1087490 (= lt!483957 (array!70184 (store (arr!33765 _values!874) i!650 (ValueCellFull!12604 (dynLambda!2156 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34301 _values!874)))))

(assert (=> b!1087490 (= lt!483955 (getCurrentListMapNoExtraKeys!4019 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087490 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!483964 () Unit!35784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70181 (_ BitVec 64) (_ BitVec 32)) Unit!35784)

(assert (=> b!1087490 (= lt!483964 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1087491 () Bool)

(declare-fun e!621192 () Bool)

(declare-fun tp_is_empty!26627 () Bool)

(assert (=> b!1087491 (= e!621192 tp_is_empty!26627)))

(declare-fun b!1087492 () Bool)

(declare-fun e!621189 () Bool)

(assert (=> b!1087492 (= e!621189 true)))

(declare-fun lt!483965 () ListLongMap!14937)

(declare-fun lt!483956 () ListLongMap!14937)

(assert (=> b!1087492 (= (-!809 lt!483965 k!904) lt!483956)))

(declare-fun lt!483963 () Unit!35784)

(declare-fun addRemoveCommutativeForDiffKeys!41 (ListLongMap!14937 (_ BitVec 64) V!40629 (_ BitVec 64)) Unit!35784)

(assert (=> b!1087492 (= lt!483963 (addRemoveCommutativeForDiffKeys!41 lt!483955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1087493 () Bool)

(declare-fun res!725240 () Bool)

(declare-fun e!621190 () Bool)

(assert (=> b!1087493 (=> (not res!725240) (not e!621190))))

(assert (=> b!1087493 (= res!725240 (and (= (size!34301 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34300 _keys!1070) (size!34301 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087494 () Bool)

(declare-fun res!725239 () Bool)

(assert (=> b!1087494 (=> (not res!725239) (not e!621191))))

(declare-datatypes ((List!23556 0))(
  ( (Nil!23553) (Cons!23552 (h!24761 (_ BitVec 64)) (t!33239 List!23556)) )
))
(declare-fun arrayNoDuplicates!0 (array!70181 (_ BitVec 32) List!23556) Bool)

(assert (=> b!1087494 (= res!725239 (arrayNoDuplicates!0 lt!483958 #b00000000000000000000000000000000 Nil!23553))))

(declare-fun b!1087495 () Bool)

(declare-fun e!621194 () Bool)

(declare-fun e!621188 () Bool)

(declare-fun mapRes!41695 () Bool)

(assert (=> b!1087495 (= e!621194 (and e!621188 mapRes!41695))))

(declare-fun condMapEmpty!41695 () Bool)

(declare-fun mapDefault!41695 () ValueCell!12604)

