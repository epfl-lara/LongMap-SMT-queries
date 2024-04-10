; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96008 () Bool)

(assert start!96008)

(declare-fun b_free!22661 () Bool)

(declare-fun b_next!22661 () Bool)

(assert (=> start!96008 (= b_free!22661 (not b_next!22661))))

(declare-fun tp!79831 () Bool)

(declare-fun b_and!35997 () Bool)

(assert (=> start!96008 (= tp!79831 b_and!35997)))

(declare-fun b!1088282 () Bool)

(declare-fun e!621622 () Bool)

(declare-fun e!621623 () Bool)

(assert (=> b!1088282 (= e!621622 (not e!621623))))

(declare-fun res!725838 () Bool)

(assert (=> b!1088282 (=> res!725838 e!621623)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088282 (= res!725838 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40677 0))(
  ( (V!40678 (val!13388 Int)) )
))
(declare-fun minValue!831 () V!40677)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16994 0))(
  ( (tuple2!16995 (_1!8508 (_ BitVec 64)) (_2!8508 V!40677)) )
))
(declare-datatypes ((List!23581 0))(
  ( (Nil!23578) (Cons!23577 (h!24786 tuple2!16994) (t!33300 List!23581)) )
))
(declare-datatypes ((ListLongMap!14963 0))(
  ( (ListLongMap!14964 (toList!7497 List!23581)) )
))
(declare-fun lt!484663 () ListLongMap!14963)

(declare-datatypes ((array!70251 0))(
  ( (array!70252 (arr!33799 (Array (_ BitVec 32) (_ BitVec 64))) (size!34335 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70251)

(declare-datatypes ((ValueCell!12622 0))(
  ( (ValueCellFull!12622 (v!16009 V!40677)) (EmptyCell!12622) )
))
(declare-datatypes ((array!70253 0))(
  ( (array!70254 (arr!33800 (Array (_ BitVec 32) ValueCell!12622)) (size!34336 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70253)

(declare-fun zeroValue!831 () V!40677)

(declare-fun getCurrentListMap!4271 (array!70251 array!70253 (_ BitVec 32) (_ BitVec 32) V!40677 V!40677 (_ BitVec 32) Int) ListLongMap!14963)

(assert (=> b!1088282 (= lt!484663 (getCurrentListMap!4271 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484657 () array!70253)

(declare-fun lt!484661 () ListLongMap!14963)

(declare-fun lt!484659 () array!70251)

(assert (=> b!1088282 (= lt!484661 (getCurrentListMap!4271 lt!484659 lt!484657 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484662 () ListLongMap!14963)

(declare-fun lt!484666 () ListLongMap!14963)

(assert (=> b!1088282 (and (= lt!484662 lt!484666) (= lt!484666 lt!484662))))

(declare-fun lt!484665 () ListLongMap!14963)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!822 (ListLongMap!14963 (_ BitVec 64)) ListLongMap!14963)

(assert (=> b!1088282 (= lt!484666 (-!822 lt!484665 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35810 0))(
  ( (Unit!35811) )
))
(declare-fun lt!484668 () Unit!35810)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!90 (array!70251 array!70253 (_ BitVec 32) (_ BitVec 32) V!40677 V!40677 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35810)

(assert (=> b!1088282 (= lt!484668 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!90 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4031 (array!70251 array!70253 (_ BitVec 32) (_ BitVec 32) V!40677 V!40677 (_ BitVec 32) Int) ListLongMap!14963)

(assert (=> b!1088282 (= lt!484662 (getCurrentListMapNoExtraKeys!4031 lt!484659 lt!484657 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2168 (Int (_ BitVec 64)) V!40677)

(assert (=> b!1088282 (= lt!484657 (array!70254 (store (arr!33800 _values!874) i!650 (ValueCellFull!12622 (dynLambda!2168 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34336 _values!874)))))

(assert (=> b!1088282 (= lt!484665 (getCurrentListMapNoExtraKeys!4031 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088282 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!484664 () Unit!35810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70251 (_ BitVec 64) (_ BitVec 32)) Unit!35810)

(assert (=> b!1088282 (= lt!484664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1088283 () Bool)

(declare-fun res!725837 () Bool)

(declare-fun e!621619 () Bool)

(assert (=> b!1088283 (=> (not res!725837) (not e!621619))))

(declare-datatypes ((List!23582 0))(
  ( (Nil!23579) (Cons!23578 (h!24787 (_ BitVec 64)) (t!33301 List!23582)) )
))
(declare-fun arrayNoDuplicates!0 (array!70251 (_ BitVec 32) List!23582) Bool)

(assert (=> b!1088283 (= res!725837 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23579))))

(declare-fun mapIsEmpty!41749 () Bool)

(declare-fun mapRes!41749 () Bool)

(assert (=> mapIsEmpty!41749 mapRes!41749))

(declare-fun b!1088284 () Bool)

(declare-fun e!621621 () Bool)

(declare-fun tp_is_empty!26663 () Bool)

(assert (=> b!1088284 (= e!621621 tp_is_empty!26663)))

(declare-fun b!1088285 () Bool)

(declare-fun e!621620 () Bool)

(assert (=> b!1088285 (= e!621620 (and e!621621 mapRes!41749))))

(declare-fun condMapEmpty!41749 () Bool)

(declare-fun mapDefault!41749 () ValueCell!12622)

