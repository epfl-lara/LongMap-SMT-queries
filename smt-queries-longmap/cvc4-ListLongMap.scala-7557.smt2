; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95666 () Bool)

(assert start!95666)

(declare-fun b_free!22319 () Bool)

(declare-fun b_next!22319 () Bool)

(assert (=> start!95666 (= b_free!22319 (not b_next!22319))))

(declare-fun tp!78806 () Bool)

(declare-fun b_and!35313 () Bool)

(assert (=> start!95666 (= tp!78806 b_and!35313)))

(declare-fun b!1081273 () Bool)

(declare-fun res!720707 () Bool)

(declare-fun e!618048 () Bool)

(assert (=> b!1081273 (=> (not res!720707) (not e!618048))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081273 (= res!720707 (validKeyInArray!0 k!904))))

(declare-fun b!1081274 () Bool)

(declare-fun e!618052 () Bool)

(assert (=> b!1081274 (= e!618052 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40221 0))(
  ( (V!40222 (val!13217 Int)) )
))
(declare-datatypes ((ValueCell!12451 0))(
  ( (ValueCellFull!12451 (v!15838 V!40221)) (EmptyCell!12451) )
))
(declare-datatypes ((array!69589 0))(
  ( (array!69590 (arr!33468 (Array (_ BitVec 32) ValueCell!12451)) (size!34004 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69589)

(declare-fun minValue!831 () V!40221)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16744 0))(
  ( (tuple2!16745 (_1!8383 (_ BitVec 64)) (_2!8383 V!40221)) )
))
(declare-datatypes ((List!23323 0))(
  ( (Nil!23320) (Cons!23319 (h!24528 tuple2!16744) (t!32700 List!23323)) )
))
(declare-datatypes ((ListLongMap!14713 0))(
  ( (ListLongMap!14714 (toList!7372 List!23323)) )
))
(declare-fun lt!479250 () ListLongMap!14713)

(declare-datatypes ((array!69591 0))(
  ( (array!69592 (arr!33469 (Array (_ BitVec 32) (_ BitVec 64))) (size!34005 (_ BitVec 32))) )
))
(declare-fun lt!479248 () array!69591)

(declare-fun zeroValue!831 () V!40221)

(declare-fun getCurrentListMapNoExtraKeys!3920 (array!69591 array!69589 (_ BitVec 32) (_ BitVec 32) V!40221 V!40221 (_ BitVec 32) Int) ListLongMap!14713)

(declare-fun dynLambda!2057 (Int (_ BitVec 64)) V!40221)

(assert (=> b!1081274 (= lt!479250 (getCurrentListMapNoExtraKeys!3920 lt!479248 (array!69590 (store (arr!33468 _values!874) i!650 (ValueCellFull!12451 (dynLambda!2057 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34004 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479249 () ListLongMap!14713)

(declare-fun _keys!1070 () array!69591)

(assert (=> b!1081274 (= lt!479249 (getCurrentListMapNoExtraKeys!3920 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081274 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35564 0))(
  ( (Unit!35565) )
))
(declare-fun lt!479251 () Unit!35564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69591 (_ BitVec 64) (_ BitVec 32)) Unit!35564)

(assert (=> b!1081274 (= lt!479251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapNonEmpty!41236 () Bool)

(declare-fun mapRes!41236 () Bool)

(declare-fun tp!78805 () Bool)

(declare-fun e!618053 () Bool)

(assert (=> mapNonEmpty!41236 (= mapRes!41236 (and tp!78805 e!618053))))

(declare-fun mapValue!41236 () ValueCell!12451)

(declare-fun mapRest!41236 () (Array (_ BitVec 32) ValueCell!12451))

(declare-fun mapKey!41236 () (_ BitVec 32))

(assert (=> mapNonEmpty!41236 (= (arr!33468 _values!874) (store mapRest!41236 mapKey!41236 mapValue!41236))))

(declare-fun mapIsEmpty!41236 () Bool)

(assert (=> mapIsEmpty!41236 mapRes!41236))

(declare-fun b!1081275 () Bool)

(declare-fun res!720706 () Bool)

(assert (=> b!1081275 (=> (not res!720706) (not e!618048))))

(assert (=> b!1081275 (= res!720706 (= (select (arr!33469 _keys!1070) i!650) k!904))))

(declare-fun b!1081276 () Bool)

(declare-fun res!720708 () Bool)

(assert (=> b!1081276 (=> (not res!720708) (not e!618048))))

(declare-datatypes ((List!23324 0))(
  ( (Nil!23321) (Cons!23320 (h!24529 (_ BitVec 64)) (t!32701 List!23324)) )
))
(declare-fun arrayNoDuplicates!0 (array!69591 (_ BitVec 32) List!23324) Bool)

(assert (=> b!1081276 (= res!720708 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23321))))

(declare-fun b!1081277 () Bool)

(declare-fun e!618049 () Bool)

(declare-fun e!618051 () Bool)

(assert (=> b!1081277 (= e!618049 (and e!618051 mapRes!41236))))

(declare-fun condMapEmpty!41236 () Bool)

(declare-fun mapDefault!41236 () ValueCell!12451)

