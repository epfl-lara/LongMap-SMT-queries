; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42540 () Bool)

(assert start!42540)

(declare-fun b_free!11975 () Bool)

(declare-fun b_next!11975 () Bool)

(assert (=> start!42540 (= b_free!11975 (not b_next!11975))))

(declare-fun tp!41964 () Bool)

(declare-fun b_and!20455 () Bool)

(assert (=> start!42540 (= tp!41964 b_and!20455)))

(declare-fun mapNonEmpty!21823 () Bool)

(declare-fun mapRes!21823 () Bool)

(declare-fun tp!41965 () Bool)

(declare-fun e!278596 () Bool)

(assert (=> mapNonEmpty!21823 (= mapRes!21823 (and tp!41965 e!278596))))

(declare-datatypes ((V!18975 0))(
  ( (V!18976 (val!6746 Int)) )
))
(declare-datatypes ((ValueCell!6358 0))(
  ( (ValueCellFull!6358 (v!9039 V!18975)) (EmptyCell!6358) )
))
(declare-datatypes ((array!30553 0))(
  ( (array!30554 (arr!14694 (Array (_ BitVec 32) ValueCell!6358)) (size!15046 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30553)

(declare-fun mapValue!21823 () ValueCell!6358)

(declare-fun mapKey!21823 () (_ BitVec 32))

(declare-fun mapRest!21823 () (Array (_ BitVec 32) ValueCell!6358))

(assert (=> mapNonEmpty!21823 (= (arr!14694 _values!833) (store mapRest!21823 mapKey!21823 mapValue!21823))))

(declare-fun b!474626 () Bool)

(declare-fun tp_is_empty!13403 () Bool)

(assert (=> b!474626 (= e!278596 tp_is_empty!13403)))

(declare-fun b!474627 () Bool)

(declare-fun e!278597 () Bool)

(assert (=> b!474627 (= e!278597 tp_is_empty!13403)))

(declare-fun b!474628 () Bool)

(declare-fun res!283469 () Bool)

(declare-fun e!278595 () Bool)

(assert (=> b!474628 (=> (not res!283469) (not e!278595))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30555 0))(
  ( (array!30556 (arr!14695 (Array (_ BitVec 32) (_ BitVec 64))) (size!15047 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30555)

(assert (=> b!474628 (= res!283469 (and (= (size!15046 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15047 _keys!1025) (size!15046 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474629 () Bool)

(declare-fun res!283467 () Bool)

(assert (=> b!474629 (=> (not res!283467) (not e!278595))))

(declare-datatypes ((List!8972 0))(
  ( (Nil!8969) (Cons!8968 (h!9824 (_ BitVec 64)) (t!14946 List!8972)) )
))
(declare-fun arrayNoDuplicates!0 (array!30555 (_ BitVec 32) List!8972) Bool)

(assert (=> b!474629 (= res!283467 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8969))))

(declare-fun b!474630 () Bool)

(assert (=> b!474630 (= e!278595 (not true))))

(declare-datatypes ((tuple2!8896 0))(
  ( (tuple2!8897 (_1!4459 (_ BitVec 64)) (_2!4459 V!18975)) )
))
(declare-datatypes ((List!8973 0))(
  ( (Nil!8970) (Cons!8969 (h!9825 tuple2!8896) (t!14947 List!8973)) )
))
(declare-datatypes ((ListLongMap!7809 0))(
  ( (ListLongMap!7810 (toList!3920 List!8973)) )
))
(declare-fun lt!216244 () ListLongMap!7809)

(declare-fun lt!216243 () ListLongMap!7809)

(assert (=> b!474630 (= lt!216244 lt!216243)))

(declare-fun minValueBefore!38 () V!18975)

(declare-fun zeroValue!794 () V!18975)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!14000 0))(
  ( (Unit!14001) )
))
(declare-fun lt!216245 () Unit!14000)

(declare-fun minValueAfter!38 () V!18975)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!257 (array!30555 array!30553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18975 V!18975 V!18975 V!18975 (_ BitVec 32) Int) Unit!14000)

(assert (=> b!474630 (= lt!216245 (lemmaNoChangeToArrayThenSameMapNoExtras!257 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2077 (array!30555 array!30553 (_ BitVec 32) (_ BitVec 32) V!18975 V!18975 (_ BitVec 32) Int) ListLongMap!7809)

(assert (=> b!474630 (= lt!216243 (getCurrentListMapNoExtraKeys!2077 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474630 (= lt!216244 (getCurrentListMapNoExtraKeys!2077 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!283468 () Bool)

(assert (=> start!42540 (=> (not res!283468) (not e!278595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42540 (= res!283468 (validMask!0 mask!1365))))

(assert (=> start!42540 e!278595))

(assert (=> start!42540 tp_is_empty!13403))

(assert (=> start!42540 tp!41964))

(assert (=> start!42540 true))

(declare-fun array_inv!10602 (array!30555) Bool)

(assert (=> start!42540 (array_inv!10602 _keys!1025)))

(declare-fun e!278598 () Bool)

(declare-fun array_inv!10603 (array!30553) Bool)

(assert (=> start!42540 (and (array_inv!10603 _values!833) e!278598)))

(declare-fun b!474631 () Bool)

(assert (=> b!474631 (= e!278598 (and e!278597 mapRes!21823))))

(declare-fun condMapEmpty!21823 () Bool)

(declare-fun mapDefault!21823 () ValueCell!6358)

