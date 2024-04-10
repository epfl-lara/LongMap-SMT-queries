; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42498 () Bool)

(assert start!42498)

(declare-fun b_free!11953 () Bool)

(declare-fun b_next!11953 () Bool)

(assert (=> start!42498 (= b_free!11953 (not b_next!11953))))

(declare-fun tp!41896 () Bool)

(declare-fun b_and!20421 () Bool)

(assert (=> start!42498 (= tp!41896 b_and!20421)))

(declare-fun res!283231 () Bool)

(declare-fun e!278294 () Bool)

(assert (=> start!42498 (=> (not res!283231) (not e!278294))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42498 (= res!283231 (validMask!0 mask!1365))))

(assert (=> start!42498 e!278294))

(declare-fun tp_is_empty!13381 () Bool)

(assert (=> start!42498 tp_is_empty!13381))

(assert (=> start!42498 tp!41896))

(assert (=> start!42498 true))

(declare-datatypes ((array!30513 0))(
  ( (array!30514 (arr!14675 (Array (_ BitVec 32) (_ BitVec 64))) (size!15027 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30513)

(declare-fun array_inv!10588 (array!30513) Bool)

(assert (=> start!42498 (array_inv!10588 _keys!1025)))

(declare-datatypes ((V!18947 0))(
  ( (V!18948 (val!6735 Int)) )
))
(declare-datatypes ((ValueCell!6347 0))(
  ( (ValueCellFull!6347 (v!9027 V!18947)) (EmptyCell!6347) )
))
(declare-datatypes ((array!30515 0))(
  ( (array!30516 (arr!14676 (Array (_ BitVec 32) ValueCell!6347)) (size!15028 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30515)

(declare-fun e!278295 () Bool)

(declare-fun array_inv!10589 (array!30515) Bool)

(assert (=> start!42498 (and (array_inv!10589 _values!833) e!278295)))

(declare-fun b!474189 () Bool)

(declare-fun e!278296 () Bool)

(assert (=> b!474189 (= e!278296 true)))

(declare-datatypes ((tuple2!8880 0))(
  ( (tuple2!8881 (_1!4451 (_ BitVec 64)) (_2!4451 V!18947)) )
))
(declare-datatypes ((List!8959 0))(
  ( (Nil!8956) (Cons!8955 (h!9811 tuple2!8880) (t!14931 List!8959)) )
))
(declare-datatypes ((ListLongMap!7793 0))(
  ( (ListLongMap!7794 (toList!3912 List!8959)) )
))
(declare-fun lt!215867 () ListLongMap!7793)

(declare-fun lt!215866 () tuple2!8880)

(declare-fun minValueBefore!38 () V!18947)

(declare-fun +!1747 (ListLongMap!7793 tuple2!8880) ListLongMap!7793)

(assert (=> b!474189 (= (+!1747 lt!215867 lt!215866) (+!1747 (+!1747 lt!215867 (tuple2!8881 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215866))))

(declare-fun minValueAfter!38 () V!18947)

(assert (=> b!474189 (= lt!215866 (tuple2!8881 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13982 0))(
  ( (Unit!13983) )
))
(declare-fun lt!215865 () Unit!13982)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!156 (ListLongMap!7793 (_ BitVec 64) V!18947 V!18947) Unit!13982)

(assert (=> b!474189 (= lt!215865 (addSameAsAddTwiceSameKeyDiffValues!156 lt!215867 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215869 () ListLongMap!7793)

(declare-fun zeroValue!794 () V!18947)

(assert (=> b!474189 (= lt!215867 (+!1747 lt!215869 (tuple2!8881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215870 () ListLongMap!7793)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2276 (array!30513 array!30515 (_ BitVec 32) (_ BitVec 32) V!18947 V!18947 (_ BitVec 32) Int) ListLongMap!7793)

(assert (=> b!474189 (= lt!215870 (getCurrentListMap!2276 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!215868 () ListLongMap!7793)

(assert (=> b!474189 (= lt!215868 (getCurrentListMap!2276 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474190 () Bool)

(declare-fun e!278293 () Bool)

(assert (=> b!474190 (= e!278293 tp_is_empty!13381)))

(declare-fun b!474191 () Bool)

(declare-fun e!278291 () Bool)

(assert (=> b!474191 (= e!278291 tp_is_empty!13381)))

(declare-fun b!474192 () Bool)

(declare-fun res!283235 () Bool)

(assert (=> b!474192 (=> (not res!283235) (not e!278294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30513 (_ BitVec 32)) Bool)

(assert (=> b!474192 (= res!283235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21787 () Bool)

(declare-fun mapRes!21787 () Bool)

(declare-fun tp!41895 () Bool)

(assert (=> mapNonEmpty!21787 (= mapRes!21787 (and tp!41895 e!278293))))

(declare-fun mapValue!21787 () ValueCell!6347)

(declare-fun mapRest!21787 () (Array (_ BitVec 32) ValueCell!6347))

(declare-fun mapKey!21787 () (_ BitVec 32))

(assert (=> mapNonEmpty!21787 (= (arr!14676 _values!833) (store mapRest!21787 mapKey!21787 mapValue!21787))))

(declare-fun b!474193 () Bool)

(assert (=> b!474193 (= e!278295 (and e!278291 mapRes!21787))))

(declare-fun condMapEmpty!21787 () Bool)

(declare-fun mapDefault!21787 () ValueCell!6347)

