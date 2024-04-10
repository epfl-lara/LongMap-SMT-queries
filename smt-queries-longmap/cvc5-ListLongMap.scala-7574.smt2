; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95764 () Bool)

(assert start!95764)

(declare-fun b_free!22417 () Bool)

(declare-fun b_next!22417 () Bool)

(assert (=> start!95764 (= b_free!22417 (not b_next!22417))))

(declare-fun tp!79099 () Bool)

(declare-fun b_and!35509 () Bool)

(assert (=> start!95764 (= tp!79099 b_and!35509)))

(declare-fun b!1083135 () Bool)

(declare-fun e!618931 () Bool)

(declare-fun tp_is_empty!26419 () Bool)

(assert (=> b!1083135 (= e!618931 tp_is_empty!26419)))

(declare-fun b!1083136 () Bool)

(declare-fun res!722034 () Bool)

(declare-fun e!618934 () Bool)

(assert (=> b!1083136 (=> (not res!722034) (not e!618934))))

(declare-datatypes ((array!69781 0))(
  ( (array!69782 (arr!33564 (Array (_ BitVec 32) (_ BitVec 64))) (size!34100 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69781)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083136 (= res!722034 (= (select (arr!33564 _keys!1070) i!650) k!904))))

(declare-fun b!1083137 () Bool)

(declare-fun e!618935 () Bool)

(assert (=> b!1083137 (= e!618935 (not true))))

(declare-datatypes ((V!40353 0))(
  ( (V!40354 (val!13266 Int)) )
))
(declare-datatypes ((tuple2!16808 0))(
  ( (tuple2!16809 (_1!8415 (_ BitVec 64)) (_2!8415 V!40353)) )
))
(declare-datatypes ((List!23395 0))(
  ( (Nil!23392) (Cons!23391 (h!24600 tuple2!16808) (t!32870 List!23395)) )
))
(declare-datatypes ((ListLongMap!14777 0))(
  ( (ListLongMap!14778 (toList!7404 List!23395)) )
))
(declare-fun lt!479935 () ListLongMap!14777)

(declare-fun lt!479931 () ListLongMap!14777)

(assert (=> b!1083137 (and (= lt!479935 lt!479931) (= lt!479931 lt!479935))))

(declare-fun lt!479930 () ListLongMap!14777)

(declare-fun -!731 (ListLongMap!14777 (_ BitVec 64)) ListLongMap!14777)

(assert (=> b!1083137 (= lt!479931 (-!731 lt!479930 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40353)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35628 0))(
  ( (Unit!35629) )
))
(declare-fun lt!479932 () Unit!35628)

(declare-fun zeroValue!831 () V!40353)

(declare-datatypes ((ValueCell!12500 0))(
  ( (ValueCellFull!12500 (v!15887 V!40353)) (EmptyCell!12500) )
))
(declare-datatypes ((array!69783 0))(
  ( (array!69784 (arr!33565 (Array (_ BitVec 32) ValueCell!12500)) (size!34101 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69783)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!11 (array!69781 array!69783 (_ BitVec 32) (_ BitVec 32) V!40353 V!40353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35628)

(assert (=> b!1083137 (= lt!479932 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!11 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479933 () array!69781)

(declare-fun getCurrentListMapNoExtraKeys!3952 (array!69781 array!69783 (_ BitVec 32) (_ BitVec 32) V!40353 V!40353 (_ BitVec 32) Int) ListLongMap!14777)

(declare-fun dynLambda!2089 (Int (_ BitVec 64)) V!40353)

(assert (=> b!1083137 (= lt!479935 (getCurrentListMapNoExtraKeys!3952 lt!479933 (array!69784 (store (arr!33565 _values!874) i!650 (ValueCellFull!12500 (dynLambda!2089 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34101 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083137 (= lt!479930 (getCurrentListMapNoExtraKeys!3952 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083137 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!479934 () Unit!35628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69781 (_ BitVec 64) (_ BitVec 32)) Unit!35628)

(assert (=> b!1083137 (= lt!479934 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1083138 () Bool)

(declare-fun e!618930 () Bool)

(declare-fun e!618932 () Bool)

(declare-fun mapRes!41383 () Bool)

(assert (=> b!1083138 (= e!618930 (and e!618932 mapRes!41383))))

(declare-fun condMapEmpty!41383 () Bool)

(declare-fun mapDefault!41383 () ValueCell!12500)

