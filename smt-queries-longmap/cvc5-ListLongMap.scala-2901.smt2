; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41548 () Bool)

(assert start!41548)

(declare-fun b_free!11215 () Bool)

(declare-fun b_next!11215 () Bool)

(assert (=> start!41548 (= b_free!11215 (not b_next!11215))))

(declare-fun tp!39643 () Bool)

(declare-fun b_and!19555 () Bool)

(assert (=> start!41548 (= tp!39643 b_and!19555)))

(declare-fun b!464104 () Bool)

(declare-fun e!271062 () Bool)

(declare-fun tp_is_empty!12643 () Bool)

(assert (=> b!464104 (= e!271062 tp_is_empty!12643)))

(declare-fun b!464105 () Bool)

(declare-fun e!271060 () Bool)

(assert (=> b!464105 (= e!271060 (not true))))

(declare-datatypes ((V!17963 0))(
  ( (V!17964 (val!6366 Int)) )
))
(declare-datatypes ((tuple2!8338 0))(
  ( (tuple2!8339 (_1!4180 (_ BitVec 64)) (_2!4180 V!17963)) )
))
(declare-datatypes ((List!8432 0))(
  ( (Nil!8429) (Cons!8428 (h!9284 tuple2!8338) (t!14378 List!8432)) )
))
(declare-datatypes ((ListLongMap!7251 0))(
  ( (ListLongMap!7252 (toList!3641 List!8432)) )
))
(declare-fun lt!209571 () ListLongMap!7251)

(declare-fun lt!209572 () ListLongMap!7251)

(assert (=> b!464105 (= lt!209571 lt!209572)))

(declare-fun minValueBefore!38 () V!17963)

(declare-datatypes ((Unit!13450 0))(
  ( (Unit!13451) )
))
(declare-fun lt!209573 () Unit!13450)

(declare-fun zeroValue!794 () V!17963)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29075 0))(
  ( (array!29076 (arr!13969 (Array (_ BitVec 32) (_ BitVec 64))) (size!14321 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29075)

(declare-datatypes ((ValueCell!5978 0))(
  ( (ValueCellFull!5978 (v!8653 V!17963)) (EmptyCell!5978) )
))
(declare-datatypes ((array!29077 0))(
  ( (array!29078 (arr!13970 (Array (_ BitVec 32) ValueCell!5978)) (size!14322 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29077)

(declare-fun minValueAfter!38 () V!17963)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1 (array!29075 array!29077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17963 V!17963 V!17963 V!17963 (_ BitVec 32) Int) Unit!13450)

(assert (=> b!464105 (= lt!209573 (lemmaNoChangeToArrayThenSameMapNoExtras!1 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1821 (array!29075 array!29077 (_ BitVec 32) (_ BitVec 32) V!17963 V!17963 (_ BitVec 32) Int) ListLongMap!7251)

(assert (=> b!464105 (= lt!209572 (getCurrentListMapNoExtraKeys!1821 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464105 (= lt!209571 (getCurrentListMapNoExtraKeys!1821 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20641 () Bool)

(declare-fun mapRes!20641 () Bool)

(assert (=> mapIsEmpty!20641 mapRes!20641))

(declare-fun b!464106 () Bool)

(declare-fun e!271058 () Bool)

(assert (=> b!464106 (= e!271058 tp_is_empty!12643)))

(declare-fun b!464107 () Bool)

(declare-fun res!277483 () Bool)

(assert (=> b!464107 (=> (not res!277483) (not e!271060))))

(declare-datatypes ((List!8433 0))(
  ( (Nil!8430) (Cons!8429 (h!9285 (_ BitVec 64)) (t!14379 List!8433)) )
))
(declare-fun arrayNoDuplicates!0 (array!29075 (_ BitVec 32) List!8433) Bool)

(assert (=> b!464107 (= res!277483 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8430))))

(declare-fun b!464108 () Bool)

(declare-fun e!271059 () Bool)

(assert (=> b!464108 (= e!271059 (and e!271058 mapRes!20641))))

(declare-fun condMapEmpty!20641 () Bool)

(declare-fun mapDefault!20641 () ValueCell!5978)

