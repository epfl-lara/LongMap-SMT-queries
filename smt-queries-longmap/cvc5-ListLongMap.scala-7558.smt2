; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95668 () Bool)

(assert start!95668)

(declare-fun b_free!22321 () Bool)

(declare-fun b_next!22321 () Bool)

(assert (=> start!95668 (= b_free!22321 (not b_next!22321))))

(declare-fun tp!78812 () Bool)

(declare-fun b_and!35317 () Bool)

(assert (=> start!95668 (= tp!78812 b_and!35317)))

(declare-fun b!1081311 () Bool)

(declare-fun res!720731 () Bool)

(declare-fun e!618066 () Bool)

(assert (=> b!1081311 (=> (not res!720731) (not e!618066))))

(declare-datatypes ((array!69593 0))(
  ( (array!69594 (arr!33470 (Array (_ BitVec 32) (_ BitVec 64))) (size!34006 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69593)

(declare-datatypes ((List!23325 0))(
  ( (Nil!23322) (Cons!23321 (h!24530 (_ BitVec 64)) (t!32704 List!23325)) )
))
(declare-fun arrayNoDuplicates!0 (array!69593 (_ BitVec 32) List!23325) Bool)

(assert (=> b!1081311 (= res!720731 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23322))))

(declare-fun b!1081312 () Bool)

(declare-fun e!618071 () Bool)

(declare-fun tp_is_empty!26323 () Bool)

(assert (=> b!1081312 (= e!618071 tp_is_empty!26323)))

(declare-fun mapIsEmpty!41239 () Bool)

(declare-fun mapRes!41239 () Bool)

(assert (=> mapIsEmpty!41239 mapRes!41239))

(declare-fun b!1081314 () Bool)

(declare-fun res!720737 () Bool)

(assert (=> b!1081314 (=> (not res!720737) (not e!618066))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69593 (_ BitVec 32)) Bool)

(assert (=> b!1081314 (= res!720737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081315 () Bool)

(declare-fun e!618068 () Bool)

(assert (=> b!1081315 (= e!618068 (not true))))

(declare-datatypes ((V!40225 0))(
  ( (V!40226 (val!13218 Int)) )
))
(declare-datatypes ((ValueCell!12452 0))(
  ( (ValueCellFull!12452 (v!15839 V!40225)) (EmptyCell!12452) )
))
(declare-datatypes ((array!69595 0))(
  ( (array!69596 (arr!33471 (Array (_ BitVec 32) ValueCell!12452)) (size!34007 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69595)

(declare-fun minValue!831 () V!40225)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16746 0))(
  ( (tuple2!16747 (_1!8384 (_ BitVec 64)) (_2!8384 V!40225)) )
))
(declare-datatypes ((List!23326 0))(
  ( (Nil!23323) (Cons!23322 (h!24531 tuple2!16746) (t!32705 List!23326)) )
))
(declare-datatypes ((ListLongMap!14715 0))(
  ( (ListLongMap!14716 (toList!7373 List!23326)) )
))
(declare-fun lt!479260 () ListLongMap!14715)

(declare-fun zeroValue!831 () V!40225)

(declare-fun lt!479263 () array!69593)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3921 (array!69593 array!69595 (_ BitVec 32) (_ BitVec 32) V!40225 V!40225 (_ BitVec 32) Int) ListLongMap!14715)

(declare-fun dynLambda!2058 (Int (_ BitVec 64)) V!40225)

(assert (=> b!1081315 (= lt!479260 (getCurrentListMapNoExtraKeys!3921 lt!479263 (array!69596 (store (arr!33471 _values!874) i!650 (ValueCellFull!12452 (dynLambda!2058 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34007 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479262 () ListLongMap!14715)

(assert (=> b!1081315 (= lt!479262 (getCurrentListMapNoExtraKeys!3921 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081315 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35566 0))(
  ( (Unit!35567) )
))
(declare-fun lt!479261 () Unit!35566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69593 (_ BitVec 64) (_ BitVec 32)) Unit!35566)

(assert (=> b!1081315 (= lt!479261 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1081316 () Bool)

(declare-fun res!720732 () Bool)

(assert (=> b!1081316 (=> (not res!720732) (not e!618066))))

(assert (=> b!1081316 (= res!720732 (and (= (size!34007 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34006 _keys!1070) (size!34007 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081317 () Bool)

(declare-fun e!618069 () Bool)

(assert (=> b!1081317 (= e!618069 (and e!618071 mapRes!41239))))

(declare-fun condMapEmpty!41239 () Bool)

(declare-fun mapDefault!41239 () ValueCell!12452)

