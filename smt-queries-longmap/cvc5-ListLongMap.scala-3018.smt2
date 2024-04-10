; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42462 () Bool)

(assert start!42462)

(declare-fun b_free!11917 () Bool)

(declare-fun b_next!11917 () Bool)

(assert (=> start!42462 (= b_free!11917 (not b_next!11917))))

(declare-fun tp!41787 () Bool)

(declare-fun b_and!20385 () Bool)

(assert (=> start!42462 (= tp!41787 b_and!20385)))

(declare-fun b!473757 () Bool)

(declare-fun e!277968 () Bool)

(assert (=> b!473757 (= e!277968 true)))

(declare-datatypes ((V!18899 0))(
  ( (V!18900 (val!6717 Int)) )
))
(declare-datatypes ((tuple2!8852 0))(
  ( (tuple2!8853 (_1!4437 (_ BitVec 64)) (_2!4437 V!18899)) )
))
(declare-datatypes ((List!8934 0))(
  ( (Nil!8931) (Cons!8930 (h!9786 tuple2!8852) (t!14906 List!8934)) )
))
(declare-datatypes ((ListLongMap!7765 0))(
  ( (ListLongMap!7766 (toList!3898 List!8934)) )
))
(declare-fun lt!215437 () ListLongMap!7765)

(declare-fun lt!215436 () tuple2!8852)

(declare-fun minValueBefore!38 () V!18899)

(declare-fun +!1734 (ListLongMap!7765 tuple2!8852) ListLongMap!7765)

(assert (=> b!473757 (= (+!1734 lt!215437 lt!215436) (+!1734 (+!1734 lt!215437 (tuple2!8853 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215436))))

(declare-fun minValueAfter!38 () V!18899)

(assert (=> b!473757 (= lt!215436 (tuple2!8853 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13954 0))(
  ( (Unit!13955) )
))
(declare-fun lt!215435 () Unit!13954)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!143 (ListLongMap!7765 (_ BitVec 64) V!18899 V!18899) Unit!13954)

(assert (=> b!473757 (= lt!215435 (addSameAsAddTwiceSameKeyDiffValues!143 lt!215437 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215438 () ListLongMap!7765)

(declare-fun zeroValue!794 () V!18899)

(assert (=> b!473757 (= lt!215437 (+!1734 lt!215438 (tuple2!8853 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215433 () ListLongMap!7765)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30447 0))(
  ( (array!30448 (arr!14642 (Array (_ BitVec 32) (_ BitVec 64))) (size!14994 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30447)

(declare-datatypes ((ValueCell!6329 0))(
  ( (ValueCellFull!6329 (v!9009 V!18899)) (EmptyCell!6329) )
))
(declare-datatypes ((array!30449 0))(
  ( (array!30450 (arr!14643 (Array (_ BitVec 32) ValueCell!6329)) (size!14995 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30449)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2263 (array!30447 array!30449 (_ BitVec 32) (_ BitVec 32) V!18899 V!18899 (_ BitVec 32) Int) ListLongMap!7765)

(assert (=> b!473757 (= lt!215433 (getCurrentListMap!2263 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215432 () ListLongMap!7765)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473757 (= lt!215432 (getCurrentListMap!2263 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473758 () Bool)

(declare-fun res!282964 () Bool)

(declare-fun e!277971 () Bool)

(assert (=> b!473758 (=> (not res!282964) (not e!277971))))

(assert (=> b!473758 (= res!282964 (and (= (size!14995 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14994 _keys!1025) (size!14995 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21733 () Bool)

(declare-fun mapRes!21733 () Bool)

(assert (=> mapIsEmpty!21733 mapRes!21733))

(declare-fun b!473759 () Bool)

(declare-fun e!277972 () Bool)

(declare-fun tp_is_empty!13345 () Bool)

(assert (=> b!473759 (= e!277972 tp_is_empty!13345)))

(declare-fun b!473760 () Bool)

(assert (=> b!473760 (= e!277971 (not e!277968))))

(declare-fun res!282963 () Bool)

(assert (=> b!473760 (=> res!282963 e!277968)))

(assert (=> b!473760 (= res!282963 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215439 () ListLongMap!7765)

(assert (=> b!473760 (= lt!215438 lt!215439)))

(declare-fun lt!215434 () Unit!13954)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!238 (array!30447 array!30449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18899 V!18899 V!18899 V!18899 (_ BitVec 32) Int) Unit!13954)

(assert (=> b!473760 (= lt!215434 (lemmaNoChangeToArrayThenSameMapNoExtras!238 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2058 (array!30447 array!30449 (_ BitVec 32) (_ BitVec 32) V!18899 V!18899 (_ BitVec 32) Int) ListLongMap!7765)

(assert (=> b!473760 (= lt!215439 (getCurrentListMapNoExtraKeys!2058 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473760 (= lt!215438 (getCurrentListMapNoExtraKeys!2058 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21733 () Bool)

(declare-fun tp!41788 () Bool)

(assert (=> mapNonEmpty!21733 (= mapRes!21733 (and tp!41788 e!277972))))

(declare-fun mapKey!21733 () (_ BitVec 32))

(declare-fun mapRest!21733 () (Array (_ BitVec 32) ValueCell!6329))

(declare-fun mapValue!21733 () ValueCell!6329)

(assert (=> mapNonEmpty!21733 (= (arr!14643 _values!833) (store mapRest!21733 mapKey!21733 mapValue!21733))))

(declare-fun b!473761 () Bool)

(declare-fun res!282965 () Bool)

(assert (=> b!473761 (=> (not res!282965) (not e!277971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30447 (_ BitVec 32)) Bool)

(assert (=> b!473761 (= res!282965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!282962 () Bool)

(assert (=> start!42462 (=> (not res!282962) (not e!277971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42462 (= res!282962 (validMask!0 mask!1365))))

(assert (=> start!42462 e!277971))

(assert (=> start!42462 tp_is_empty!13345))

(assert (=> start!42462 tp!41787))

(assert (=> start!42462 true))

(declare-fun array_inv!10564 (array!30447) Bool)

(assert (=> start!42462 (array_inv!10564 _keys!1025)))

(declare-fun e!277967 () Bool)

(declare-fun array_inv!10565 (array!30449) Bool)

(assert (=> start!42462 (and (array_inv!10565 _values!833) e!277967)))

(declare-fun b!473762 () Bool)

(declare-fun e!277970 () Bool)

(assert (=> b!473762 (= e!277970 tp_is_empty!13345)))

(declare-fun b!473763 () Bool)

(assert (=> b!473763 (= e!277967 (and e!277970 mapRes!21733))))

(declare-fun condMapEmpty!21733 () Bool)

(declare-fun mapDefault!21733 () ValueCell!6329)

