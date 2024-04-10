; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41844 () Bool)

(assert start!41844)

(declare-fun b_free!11447 () Bool)

(declare-fun b_next!11447 () Bool)

(assert (=> start!41844 (= b_free!11447 (not b_next!11447))))

(declare-fun tp!40350 () Bool)

(declare-fun b_and!19827 () Bool)

(assert (=> start!41844 (= tp!40350 b_and!19827)))

(declare-fun b!467240 () Bool)

(declare-fun res!279262 () Bool)

(declare-fun e!273292 () Bool)

(assert (=> b!467240 (=> (not res!279262) (not e!273292))))

(declare-datatypes ((array!29531 0))(
  ( (array!29532 (arr!14193 (Array (_ BitVec 32) (_ BitVec 64))) (size!14545 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29531)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29531 (_ BitVec 32)) Bool)

(assert (=> b!467240 (= res!279262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467241 () Bool)

(declare-fun e!273293 () Bool)

(declare-fun tp_is_empty!12875 () Bool)

(assert (=> b!467241 (= e!273293 tp_is_empty!12875)))

(declare-fun b!467242 () Bool)

(assert (=> b!467242 (= e!273292 (not true))))

(declare-datatypes ((V!18271 0))(
  ( (V!18272 (val!6482 Int)) )
))
(declare-datatypes ((tuple2!8508 0))(
  ( (tuple2!8509 (_1!4265 (_ BitVec 64)) (_2!4265 V!18271)) )
))
(declare-datatypes ((List!8596 0))(
  ( (Nil!8593) (Cons!8592 (h!9448 tuple2!8508) (t!14550 List!8596)) )
))
(declare-datatypes ((ListLongMap!7421 0))(
  ( (ListLongMap!7422 (toList!3726 List!8596)) )
))
(declare-fun lt!211265 () ListLongMap!7421)

(declare-fun lt!211264 () ListLongMap!7421)

(assert (=> b!467242 (= lt!211265 lt!211264)))

(declare-datatypes ((Unit!13612 0))(
  ( (Unit!13613) )
))
(declare-fun lt!211263 () Unit!13612)

(declare-fun minValueBefore!38 () V!18271)

(declare-fun zeroValue!794 () V!18271)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6094 0))(
  ( (ValueCellFull!6094 (v!8771 V!18271)) (EmptyCell!6094) )
))
(declare-datatypes ((array!29533 0))(
  ( (array!29534 (arr!14194 (Array (_ BitVec 32) ValueCell!6094)) (size!14546 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29533)

(declare-fun minValueAfter!38 () V!18271)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!80 (array!29531 array!29533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18271 V!18271 V!18271 V!18271 (_ BitVec 32) Int) Unit!13612)

(assert (=> b!467242 (= lt!211263 (lemmaNoChangeToArrayThenSameMapNoExtras!80 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1900 (array!29531 array!29533 (_ BitVec 32) (_ BitVec 32) V!18271 V!18271 (_ BitVec 32) Int) ListLongMap!7421)

(assert (=> b!467242 (= lt!211264 (getCurrentListMapNoExtraKeys!1900 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467242 (= lt!211265 (getCurrentListMapNoExtraKeys!1900 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21001 () Bool)

(declare-fun mapRes!21001 () Bool)

(declare-fun tp!40351 () Bool)

(assert (=> mapNonEmpty!21001 (= mapRes!21001 (and tp!40351 e!273293))))

(declare-fun mapKey!21001 () (_ BitVec 32))

(declare-fun mapValue!21001 () ValueCell!6094)

(declare-fun mapRest!21001 () (Array (_ BitVec 32) ValueCell!6094))

(assert (=> mapNonEmpty!21001 (= (arr!14194 _values!833) (store mapRest!21001 mapKey!21001 mapValue!21001))))

(declare-fun mapIsEmpty!21001 () Bool)

(assert (=> mapIsEmpty!21001 mapRes!21001))

(declare-fun b!467243 () Bool)

(declare-fun e!273291 () Bool)

(declare-fun e!273290 () Bool)

(assert (=> b!467243 (= e!273291 (and e!273290 mapRes!21001))))

(declare-fun condMapEmpty!21001 () Bool)

(declare-fun mapDefault!21001 () ValueCell!6094)

