; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42624 () Bool)

(assert start!42624)

(declare-fun b_free!12047 () Bool)

(declare-fun b_next!12047 () Bool)

(assert (=> start!42624 (= b_free!12047 (not b_next!12047))))

(declare-fun tp!42184 () Bool)

(declare-fun b_and!20535 () Bool)

(assert (=> start!42624 (= tp!42184 b_and!20535)))

(declare-fun mapIsEmpty!21934 () Bool)

(declare-fun mapRes!21934 () Bool)

(assert (=> mapIsEmpty!21934 mapRes!21934))

(declare-fun b!475475 () Bool)

(declare-fun e!279202 () Bool)

(declare-fun tp_is_empty!13475 () Bool)

(assert (=> b!475475 (= e!279202 tp_is_empty!13475)))

(declare-fun b!475476 () Bool)

(declare-fun e!279201 () Bool)

(assert (=> b!475476 (= e!279201 tp_is_empty!13475)))

(declare-fun res!283940 () Bool)

(declare-fun e!279198 () Bool)

(assert (=> start!42624 (=> (not res!283940) (not e!279198))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42624 (= res!283940 (validMask!0 mask!1365))))

(assert (=> start!42624 e!279198))

(assert (=> start!42624 tp_is_empty!13475))

(assert (=> start!42624 tp!42184))

(assert (=> start!42624 true))

(declare-datatypes ((array!30687 0))(
  ( (array!30688 (arr!14760 (Array (_ BitVec 32) (_ BitVec 64))) (size!15112 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30687)

(declare-fun array_inv!10652 (array!30687) Bool)

(assert (=> start!42624 (array_inv!10652 _keys!1025)))

(declare-datatypes ((V!19071 0))(
  ( (V!19072 (val!6782 Int)) )
))
(declare-datatypes ((ValueCell!6394 0))(
  ( (ValueCellFull!6394 (v!9075 V!19071)) (EmptyCell!6394) )
))
(declare-datatypes ((array!30689 0))(
  ( (array!30690 (arr!14761 (Array (_ BitVec 32) ValueCell!6394)) (size!15113 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30689)

(declare-fun e!279197 () Bool)

(declare-fun array_inv!10653 (array!30689) Bool)

(assert (=> start!42624 (and (array_inv!10653 _values!833) e!279197)))

(declare-fun e!279199 () Bool)

(declare-fun minValueBefore!38 () V!19071)

(declare-fun zeroValue!794 () V!19071)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun b!475477 () Bool)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!19071)

(declare-datatypes ((tuple2!8942 0))(
  ( (tuple2!8943 (_1!4482 (_ BitVec 64)) (_2!4482 V!19071)) )
))
(declare-datatypes ((List!9021 0))(
  ( (Nil!9018) (Cons!9017 (h!9873 tuple2!8942) (t!14997 List!9021)) )
))
(declare-datatypes ((ListLongMap!7855 0))(
  ( (ListLongMap!7856 (toList!3943 List!9021)) )
))
(declare-fun +!1757 (ListLongMap!7855 tuple2!8942) ListLongMap!7855)

(declare-fun getCurrentListMap!2285 (array!30687 array!30689 (_ BitVec 32) (_ BitVec 32) V!19071 V!19071 (_ BitVec 32) Int) ListLongMap!7855)

(assert (=> b!475477 (= e!279199 (= (+!1757 (getCurrentListMap!2285 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8943 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2285 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun b!475478 () Bool)

(assert (=> b!475478 (= e!279198 (not e!279199))))

(declare-fun res!283939 () Bool)

(assert (=> b!475478 (=> res!283939 e!279199)))

(assert (=> b!475478 (= res!283939 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!216507 () ListLongMap!7855)

(declare-fun lt!216506 () ListLongMap!7855)

(assert (=> b!475478 (= lt!216507 lt!216506)))

(declare-datatypes ((Unit!14006 0))(
  ( (Unit!14007) )
))
(declare-fun lt!216505 () Unit!14006)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!259 (array!30687 array!30689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19071 V!19071 V!19071 V!19071 (_ BitVec 32) Int) Unit!14006)

(assert (=> b!475478 (= lt!216505 (lemmaNoChangeToArrayThenSameMapNoExtras!259 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2099 (array!30687 array!30689 (_ BitVec 32) (_ BitVec 32) V!19071 V!19071 (_ BitVec 32) Int) ListLongMap!7855)

(assert (=> b!475478 (= lt!216506 (getCurrentListMapNoExtraKeys!2099 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475478 (= lt!216507 (getCurrentListMapNoExtraKeys!2099 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475479 () Bool)

(declare-fun res!283941 () Bool)

(assert (=> b!475479 (=> (not res!283941) (not e!279198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30687 (_ BitVec 32)) Bool)

(assert (=> b!475479 (= res!283941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475480 () Bool)

(declare-fun res!283938 () Bool)

(assert (=> b!475480 (=> (not res!283938) (not e!279198))))

(assert (=> b!475480 (= res!283938 (and (= (size!15113 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15112 _keys!1025) (size!15113 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475481 () Bool)

(assert (=> b!475481 (= e!279197 (and e!279202 mapRes!21934))))

(declare-fun condMapEmpty!21934 () Bool)

(declare-fun mapDefault!21934 () ValueCell!6394)

