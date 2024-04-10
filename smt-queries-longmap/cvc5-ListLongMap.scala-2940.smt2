; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41846 () Bool)

(assert start!41846)

(declare-fun b_free!11449 () Bool)

(declare-fun b_next!11449 () Bool)

(assert (=> start!41846 (= b_free!11449 (not b_next!11449))))

(declare-fun tp!40357 () Bool)

(declare-fun b_and!19829 () Bool)

(assert (=> start!41846 (= tp!40357 b_and!19829)))

(declare-fun mapNonEmpty!21004 () Bool)

(declare-fun mapRes!21004 () Bool)

(declare-fun tp!40356 () Bool)

(declare-fun e!273305 () Bool)

(assert (=> mapNonEmpty!21004 (= mapRes!21004 (and tp!40356 e!273305))))

(declare-datatypes ((V!18275 0))(
  ( (V!18276 (val!6483 Int)) )
))
(declare-datatypes ((ValueCell!6095 0))(
  ( (ValueCellFull!6095 (v!8772 V!18275)) (EmptyCell!6095) )
))
(declare-datatypes ((array!29535 0))(
  ( (array!29536 (arr!14195 (Array (_ BitVec 32) ValueCell!6095)) (size!14547 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29535)

(declare-fun mapRest!21004 () (Array (_ BitVec 32) ValueCell!6095))

(declare-fun mapKey!21004 () (_ BitVec 32))

(declare-fun mapValue!21004 () ValueCell!6095)

(assert (=> mapNonEmpty!21004 (= (arr!14195 _values!833) (store mapRest!21004 mapKey!21004 mapValue!21004))))

(declare-fun mapIsEmpty!21004 () Bool)

(assert (=> mapIsEmpty!21004 mapRes!21004))

(declare-fun b!467261 () Bool)

(declare-fun res!279274 () Bool)

(declare-fun e!273306 () Bool)

(assert (=> b!467261 (=> (not res!279274) (not e!273306))))

(declare-datatypes ((array!29537 0))(
  ( (array!29538 (arr!14196 (Array (_ BitVec 32) (_ BitVec 64))) (size!14548 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29537)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29537 (_ BitVec 32)) Bool)

(assert (=> b!467261 (= res!279274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467262 () Bool)

(declare-fun res!279276 () Bool)

(assert (=> b!467262 (=> (not res!279276) (not e!273306))))

(declare-datatypes ((List!8597 0))(
  ( (Nil!8594) (Cons!8593 (h!9449 (_ BitVec 64)) (t!14551 List!8597)) )
))
(declare-fun arrayNoDuplicates!0 (array!29537 (_ BitVec 32) List!8597) Bool)

(assert (=> b!467262 (= res!279276 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8594))))

(declare-fun b!467263 () Bool)

(assert (=> b!467263 (= e!273306 (not true))))

(declare-datatypes ((tuple2!8510 0))(
  ( (tuple2!8511 (_1!4266 (_ BitVec 64)) (_2!4266 V!18275)) )
))
(declare-datatypes ((List!8598 0))(
  ( (Nil!8595) (Cons!8594 (h!9450 tuple2!8510) (t!14552 List!8598)) )
))
(declare-datatypes ((ListLongMap!7423 0))(
  ( (ListLongMap!7424 (toList!3727 List!8598)) )
))
(declare-fun lt!211274 () ListLongMap!7423)

(declare-fun lt!211272 () ListLongMap!7423)

(assert (=> b!467263 (= lt!211274 lt!211272)))

(declare-fun minValueBefore!38 () V!18275)

(declare-fun zeroValue!794 () V!18275)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13614 0))(
  ( (Unit!13615) )
))
(declare-fun lt!211273 () Unit!13614)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18275)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!81 (array!29537 array!29535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18275 V!18275 V!18275 V!18275 (_ BitVec 32) Int) Unit!13614)

(assert (=> b!467263 (= lt!211273 (lemmaNoChangeToArrayThenSameMapNoExtras!81 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1901 (array!29537 array!29535 (_ BitVec 32) (_ BitVec 32) V!18275 V!18275 (_ BitVec 32) Int) ListLongMap!7423)

(assert (=> b!467263 (= lt!211272 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467263 (= lt!211274 (getCurrentListMapNoExtraKeys!1901 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467264 () Bool)

(declare-fun e!273309 () Bool)

(declare-fun e!273308 () Bool)

(assert (=> b!467264 (= e!273309 (and e!273308 mapRes!21004))))

(declare-fun condMapEmpty!21004 () Bool)

(declare-fun mapDefault!21004 () ValueCell!6095)

