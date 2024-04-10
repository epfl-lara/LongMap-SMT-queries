; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42428 () Bool)

(assert start!42428)

(declare-fun b_free!11903 () Bool)

(declare-fun b_next!11903 () Bool)

(assert (=> start!42428 (= b_free!11903 (not b_next!11903))))

(declare-fun tp!41742 () Bool)

(declare-fun b_and!20359 () Bool)

(assert (=> start!42428 (= tp!41742 b_and!20359)))

(declare-fun mapNonEmpty!21709 () Bool)

(declare-fun mapRes!21709 () Bool)

(declare-fun tp!41743 () Bool)

(declare-fun e!277732 () Bool)

(assert (=> mapNonEmpty!21709 (= mapRes!21709 (and tp!41743 e!277732))))

(declare-datatypes ((V!18879 0))(
  ( (V!18880 (val!6710 Int)) )
))
(declare-datatypes ((ValueCell!6322 0))(
  ( (ValueCellFull!6322 (v!9001 V!18879)) (EmptyCell!6322) )
))
(declare-fun mapRest!21709 () (Array (_ BitVec 32) ValueCell!6322))

(declare-datatypes ((array!30419 0))(
  ( (array!30420 (arr!14629 (Array (_ BitVec 32) ValueCell!6322)) (size!14981 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30419)

(declare-fun mapKey!21709 () (_ BitVec 32))

(declare-fun mapValue!21709 () ValueCell!6322)

(assert (=> mapNonEmpty!21709 (= (arr!14629 _values!833) (store mapRest!21709 mapKey!21709 mapValue!21709))))

(declare-fun b!473409 () Bool)

(declare-fun e!277728 () Bool)

(assert (=> b!473409 (= e!277728 true)))

(declare-datatypes ((tuple2!8842 0))(
  ( (tuple2!8843 (_1!4432 (_ BitVec 64)) (_2!4432 V!18879)) )
))
(declare-datatypes ((List!8924 0))(
  ( (Nil!8921) (Cons!8920 (h!9776 tuple2!8842) (t!14894 List!8924)) )
))
(declare-datatypes ((ListLongMap!7755 0))(
  ( (ListLongMap!7756 (toList!3893 List!8924)) )
))
(declare-fun lt!215111 () ListLongMap!7755)

(declare-fun lt!215114 () tuple2!8842)

(declare-fun minValueBefore!38 () V!18879)

(declare-fun +!1730 (ListLongMap!7755 tuple2!8842) ListLongMap!7755)

(assert (=> b!473409 (= (+!1730 lt!215111 lt!215114) (+!1730 (+!1730 lt!215111 (tuple2!8843 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215114))))

(declare-fun minValueAfter!38 () V!18879)

(assert (=> b!473409 (= lt!215114 (tuple2!8843 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13942 0))(
  ( (Unit!13943) )
))
(declare-fun lt!215110 () Unit!13942)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!139 (ListLongMap!7755 (_ BitVec 64) V!18879 V!18879) Unit!13942)

(assert (=> b!473409 (= lt!215110 (addSameAsAddTwiceSameKeyDiffValues!139 lt!215111 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215113 () ListLongMap!7755)

(declare-fun zeroValue!794 () V!18879)

(assert (=> b!473409 (= lt!215111 (+!1730 lt!215113 (tuple2!8843 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215109 () ListLongMap!7755)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30421 0))(
  ( (array!30422 (arr!14630 (Array (_ BitVec 32) (_ BitVec 64))) (size!14982 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30421)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2259 (array!30421 array!30419 (_ BitVec 32) (_ BitVec 32) V!18879 V!18879 (_ BitVec 32) Int) ListLongMap!7755)

(assert (=> b!473409 (= lt!215109 (getCurrentListMap!2259 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215115 () ListLongMap!7755)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473409 (= lt!215115 (getCurrentListMap!2259 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21709 () Bool)

(assert (=> mapIsEmpty!21709 mapRes!21709))

(declare-fun b!473410 () Bool)

(declare-fun res!282780 () Bool)

(declare-fun e!277733 () Bool)

(assert (=> b!473410 (=> (not res!282780) (not e!277733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30421 (_ BitVec 32)) Bool)

(assert (=> b!473410 (= res!282780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473411 () Bool)

(assert (=> b!473411 (= e!277733 (not e!277728))))

(declare-fun res!282778 () Bool)

(assert (=> b!473411 (=> res!282778 e!277728)))

(assert (=> b!473411 (= res!282778 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215116 () ListLongMap!7755)

(assert (=> b!473411 (= lt!215113 lt!215116)))

(declare-fun lt!215112 () Unit!13942)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!233 (array!30421 array!30419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18879 V!18879 V!18879 V!18879 (_ BitVec 32) Int) Unit!13942)

(assert (=> b!473411 (= lt!215112 (lemmaNoChangeToArrayThenSameMapNoExtras!233 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2053 (array!30421 array!30419 (_ BitVec 32) (_ BitVec 32) V!18879 V!18879 (_ BitVec 32) Int) ListLongMap!7755)

(assert (=> b!473411 (= lt!215116 (getCurrentListMapNoExtraKeys!2053 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473411 (= lt!215113 (getCurrentListMapNoExtraKeys!2053 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473412 () Bool)

(declare-fun e!277730 () Bool)

(declare-fun tp_is_empty!13331 () Bool)

(assert (=> b!473412 (= e!277730 tp_is_empty!13331)))

(declare-fun b!473413 () Bool)

(declare-fun res!282779 () Bool)

(assert (=> b!473413 (=> (not res!282779) (not e!277733))))

(declare-datatypes ((List!8925 0))(
  ( (Nil!8922) (Cons!8921 (h!9777 (_ BitVec 64)) (t!14895 List!8925)) )
))
(declare-fun arrayNoDuplicates!0 (array!30421 (_ BitVec 32) List!8925) Bool)

(assert (=> b!473413 (= res!282779 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8922))))

(declare-fun res!282781 () Bool)

(assert (=> start!42428 (=> (not res!282781) (not e!277733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42428 (= res!282781 (validMask!0 mask!1365))))

(assert (=> start!42428 e!277733))

(assert (=> start!42428 tp_is_empty!13331))

(assert (=> start!42428 tp!41742))

(assert (=> start!42428 true))

(declare-fun array_inv!10552 (array!30421) Bool)

(assert (=> start!42428 (array_inv!10552 _keys!1025)))

(declare-fun e!277731 () Bool)

(declare-fun array_inv!10553 (array!30419) Bool)

(assert (=> start!42428 (and (array_inv!10553 _values!833) e!277731)))

(declare-fun b!473408 () Bool)

(assert (=> b!473408 (= e!277732 tp_is_empty!13331)))

(declare-fun b!473414 () Bool)

(assert (=> b!473414 (= e!277731 (and e!277730 mapRes!21709))))

(declare-fun condMapEmpty!21709 () Bool)

(declare-fun mapDefault!21709 () ValueCell!6322)

