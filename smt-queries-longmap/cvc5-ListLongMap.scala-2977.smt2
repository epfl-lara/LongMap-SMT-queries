; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42138 () Bool)

(assert start!42138)

(declare-fun b_free!11671 () Bool)

(declare-fun b_next!11671 () Bool)

(assert (=> start!42138 (= b_free!11671 (not b_next!11671))))

(declare-fun tp!41035 () Bool)

(declare-fun b_and!20093 () Bool)

(assert (=> start!42138 (= tp!41035 b_and!20093)))

(declare-fun b!470426 () Bool)

(declare-fun e!275586 () Bool)

(declare-fun tp_is_empty!13099 () Bool)

(assert (=> b!470426 (= e!275586 tp_is_empty!13099)))

(declare-fun b!470427 () Bool)

(declare-fun res!281092 () Bool)

(declare-fun e!275590 () Bool)

(assert (=> b!470427 (=> (not res!281092) (not e!275590))))

(declare-datatypes ((array!29969 0))(
  ( (array!29970 (arr!14408 (Array (_ BitVec 32) (_ BitVec 64))) (size!14760 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29969)

(declare-datatypes ((List!8765 0))(
  ( (Nil!8762) (Cons!8761 (h!9617 (_ BitVec 64)) (t!14727 List!8765)) )
))
(declare-fun arrayNoDuplicates!0 (array!29969 (_ BitVec 32) List!8765) Bool)

(assert (=> b!470427 (= res!281092 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8762))))

(declare-fun mapNonEmpty!21349 () Bool)

(declare-fun mapRes!21349 () Bool)

(declare-fun tp!41034 () Bool)

(declare-fun e!275588 () Bool)

(assert (=> mapNonEmpty!21349 (= mapRes!21349 (and tp!41034 e!275588))))

(declare-datatypes ((V!18571 0))(
  ( (V!18572 (val!6594 Int)) )
))
(declare-datatypes ((ValueCell!6206 0))(
  ( (ValueCellFull!6206 (v!8885 V!18571)) (EmptyCell!6206) )
))
(declare-datatypes ((array!29971 0))(
  ( (array!29972 (arr!14409 (Array (_ BitVec 32) ValueCell!6206)) (size!14761 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29971)

(declare-fun mapRest!21349 () (Array (_ BitVec 32) ValueCell!6206))

(declare-fun mapKey!21349 () (_ BitVec 32))

(declare-fun mapValue!21349 () ValueCell!6206)

(assert (=> mapNonEmpty!21349 (= (arr!14409 _values!833) (store mapRest!21349 mapKey!21349 mapValue!21349))))

(declare-fun res!281094 () Bool)

(assert (=> start!42138 (=> (not res!281094) (not e!275590))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42138 (= res!281094 (validMask!0 mask!1365))))

(assert (=> start!42138 e!275590))

(assert (=> start!42138 tp_is_empty!13099))

(assert (=> start!42138 tp!41035))

(assert (=> start!42138 true))

(declare-fun array_inv!10396 (array!29969) Bool)

(assert (=> start!42138 (array_inv!10396 _keys!1025)))

(declare-fun e!275589 () Bool)

(declare-fun array_inv!10397 (array!29971) Bool)

(assert (=> start!42138 (and (array_inv!10397 _values!833) e!275589)))

(declare-fun b!470428 () Bool)

(assert (=> b!470428 (= e!275590 (not true))))

(declare-datatypes ((tuple2!8686 0))(
  ( (tuple2!8687 (_1!4354 (_ BitVec 64)) (_2!4354 V!18571)) )
))
(declare-datatypes ((List!8766 0))(
  ( (Nil!8763) (Cons!8762 (h!9618 tuple2!8686) (t!14728 List!8766)) )
))
(declare-datatypes ((ListLongMap!7599 0))(
  ( (ListLongMap!7600 (toList!3815 List!8766)) )
))
(declare-fun lt!213450 () ListLongMap!7599)

(declare-fun lt!213449 () ListLongMap!7599)

(assert (=> b!470428 (= lt!213450 lt!213449)))

(declare-fun minValueBefore!38 () V!18571)

(declare-fun zeroValue!794 () V!18571)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13789 0))(
  ( (Unit!13790) )
))
(declare-fun lt!213448 () Unit!13789)

(declare-fun minValueAfter!38 () V!18571)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!158 (array!29969 array!29971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18571 V!18571 V!18571 V!18571 (_ BitVec 32) Int) Unit!13789)

(assert (=> b!470428 (= lt!213448 (lemmaNoChangeToArrayThenSameMapNoExtras!158 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1978 (array!29969 array!29971 (_ BitVec 32) (_ BitVec 32) V!18571 V!18571 (_ BitVec 32) Int) ListLongMap!7599)

(assert (=> b!470428 (= lt!213449 (getCurrentListMapNoExtraKeys!1978 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470428 (= lt!213450 (getCurrentListMapNoExtraKeys!1978 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470429 () Bool)

(declare-fun res!281091 () Bool)

(assert (=> b!470429 (=> (not res!281091) (not e!275590))))

(assert (=> b!470429 (= res!281091 (and (= (size!14761 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14760 _keys!1025) (size!14761 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470430 () Bool)

(assert (=> b!470430 (= e!275589 (and e!275586 mapRes!21349))))

(declare-fun condMapEmpty!21349 () Bool)

(declare-fun mapDefault!21349 () ValueCell!6206)

