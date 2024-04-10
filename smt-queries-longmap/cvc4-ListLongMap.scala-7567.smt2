; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95726 () Bool)

(assert start!95726)

(declare-fun b_free!22379 () Bool)

(declare-fun b_next!22379 () Bool)

(assert (=> start!95726 (= b_free!22379 (not b_next!22379))))

(declare-fun tp!78985 () Bool)

(declare-fun b_and!35433 () Bool)

(assert (=> start!95726 (= tp!78985 b_and!35433)))

(declare-fun b!1082414 () Bool)

(declare-fun res!721516 () Bool)

(declare-fun e!618590 () Bool)

(assert (=> b!1082414 (=> (not res!721516) (not e!618590))))

(declare-datatypes ((array!69709 0))(
  ( (array!69710 (arr!33528 (Array (_ BitVec 32) (_ BitVec 64))) (size!34064 (_ BitVec 32))) )
))
(declare-fun lt!479610 () array!69709)

(declare-datatypes ((List!23368 0))(
  ( (Nil!23365) (Cons!23364 (h!24573 (_ BitVec 64)) (t!32805 List!23368)) )
))
(declare-fun arrayNoDuplicates!0 (array!69709 (_ BitVec 32) List!23368) Bool)

(assert (=> b!1082414 (= res!721516 (arrayNoDuplicates!0 lt!479610 #b00000000000000000000000000000000 Nil!23365))))

(declare-fun b!1082415 () Bool)

(declare-fun e!618592 () Bool)

(assert (=> b!1082415 (= e!618592 e!618590)))

(declare-fun res!721513 () Bool)

(assert (=> b!1082415 (=> (not res!721513) (not e!618590))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69709 (_ BitVec 32)) Bool)

(assert (=> b!1082415 (= res!721513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479610 mask!1414))))

(declare-fun _keys!1070 () array!69709)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082415 (= lt!479610 (array!69710 (store (arr!33528 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34064 _keys!1070)))))

(declare-fun b!1082416 () Bool)

(assert (=> b!1082416 (= e!618590 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40301 0))(
  ( (V!40302 (val!13247 Int)) )
))
(declare-datatypes ((ValueCell!12481 0))(
  ( (ValueCellFull!12481 (v!15868 V!40301)) (EmptyCell!12481) )
))
(declare-datatypes ((array!69711 0))(
  ( (array!69712 (arr!33529 (Array (_ BitVec 32) ValueCell!12481)) (size!34065 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69711)

(declare-fun minValue!831 () V!40301)

(declare-datatypes ((tuple2!16784 0))(
  ( (tuple2!16785 (_1!8403 (_ BitVec 64)) (_2!8403 V!40301)) )
))
(declare-datatypes ((List!23369 0))(
  ( (Nil!23366) (Cons!23365 (h!24574 tuple2!16784) (t!32806 List!23369)) )
))
(declare-datatypes ((ListLongMap!14753 0))(
  ( (ListLongMap!14754 (toList!7392 List!23369)) )
))
(declare-fun lt!479608 () ListLongMap!14753)

(declare-fun zeroValue!831 () V!40301)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3940 (array!69709 array!69711 (_ BitVec 32) (_ BitVec 32) V!40301 V!40301 (_ BitVec 32) Int) ListLongMap!14753)

(declare-fun dynLambda!2077 (Int (_ BitVec 64)) V!40301)

(assert (=> b!1082416 (= lt!479608 (getCurrentListMapNoExtraKeys!3940 lt!479610 (array!69712 (store (arr!33529 _values!874) i!650 (ValueCellFull!12481 (dynLambda!2077 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34065 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479611 () ListLongMap!14753)

(assert (=> b!1082416 (= lt!479611 (getCurrentListMapNoExtraKeys!3940 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082416 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35604 0))(
  ( (Unit!35605) )
))
(declare-fun lt!479609 () Unit!35604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69709 (_ BitVec 64) (_ BitVec 32)) Unit!35604)

(assert (=> b!1082416 (= lt!479609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1082417 () Bool)

(declare-fun e!618588 () Bool)

(declare-fun tp_is_empty!26381 () Bool)

(assert (=> b!1082417 (= e!618588 tp_is_empty!26381)))

(declare-fun b!1082418 () Bool)

(declare-fun res!721518 () Bool)

(assert (=> b!1082418 (=> (not res!721518) (not e!618592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082418 (= res!721518 (validKeyInArray!0 k!904))))

(declare-fun mapIsEmpty!41326 () Bool)

(declare-fun mapRes!41326 () Bool)

(assert (=> mapIsEmpty!41326 mapRes!41326))

(declare-fun b!1082419 () Bool)

(declare-fun res!721521 () Bool)

(assert (=> b!1082419 (=> (not res!721521) (not e!618592))))

(assert (=> b!1082419 (= res!721521 (= (select (arr!33528 _keys!1070) i!650) k!904))))

(declare-fun b!1082420 () Bool)

(declare-fun e!618593 () Bool)

(assert (=> b!1082420 (= e!618593 (and e!618588 mapRes!41326))))

(declare-fun condMapEmpty!41326 () Bool)

(declare-fun mapDefault!41326 () ValueCell!12481)

