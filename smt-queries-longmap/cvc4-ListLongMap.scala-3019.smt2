; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42472 () Bool)

(assert start!42472)

(declare-fun b_free!11927 () Bool)

(declare-fun b_next!11927 () Bool)

(assert (=> start!42472 (= b_free!11927 (not b_next!11927))))

(declare-fun tp!41818 () Bool)

(declare-fun b_and!20395 () Bool)

(assert (=> start!42472 (= tp!41818 b_and!20395)))

(declare-fun b!473877 () Bool)

(declare-fun e!278061 () Bool)

(assert (=> b!473877 (= e!278061 true)))

(declare-datatypes ((V!18911 0))(
  ( (V!18912 (val!6722 Int)) )
))
(declare-datatypes ((tuple2!8862 0))(
  ( (tuple2!8863 (_1!4442 (_ BitVec 64)) (_2!4442 V!18911)) )
))
(declare-datatypes ((List!8941 0))(
  ( (Nil!8938) (Cons!8937 (h!9793 tuple2!8862) (t!14913 List!8941)) )
))
(declare-datatypes ((ListLongMap!7775 0))(
  ( (ListLongMap!7776 (toList!3903 List!8941)) )
))
(declare-fun lt!215555 () ListLongMap!7775)

(declare-fun lt!215553 () tuple2!8862)

(declare-fun minValueBefore!38 () V!18911)

(declare-fun +!1738 (ListLongMap!7775 tuple2!8862) ListLongMap!7775)

(assert (=> b!473877 (= (+!1738 lt!215555 lt!215553) (+!1738 (+!1738 lt!215555 (tuple2!8863 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215553))))

(declare-fun minValueAfter!38 () V!18911)

(assert (=> b!473877 (= lt!215553 (tuple2!8863 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13964 0))(
  ( (Unit!13965) )
))
(declare-fun lt!215552 () Unit!13964)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!147 (ListLongMap!7775 (_ BitVec 64) V!18911 V!18911) Unit!13964)

(assert (=> b!473877 (= lt!215552 (addSameAsAddTwiceSameKeyDiffValues!147 lt!215555 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215554 () ListLongMap!7775)

(declare-fun zeroValue!794 () V!18911)

(assert (=> b!473877 (= lt!215555 (+!1738 lt!215554 (tuple2!8863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215556 () ListLongMap!7775)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30467 0))(
  ( (array!30468 (arr!14652 (Array (_ BitVec 32) (_ BitVec 64))) (size!15004 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30467)

(declare-datatypes ((ValueCell!6334 0))(
  ( (ValueCellFull!6334 (v!9014 V!18911)) (EmptyCell!6334) )
))
(declare-datatypes ((array!30469 0))(
  ( (array!30470 (arr!14653 (Array (_ BitVec 32) ValueCell!6334)) (size!15005 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30469)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2267 (array!30467 array!30469 (_ BitVec 32) (_ BitVec 32) V!18911 V!18911 (_ BitVec 32) Int) ListLongMap!7775)

(assert (=> b!473877 (= lt!215556 (getCurrentListMap!2267 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215558 () ListLongMap!7775)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473877 (= lt!215558 (getCurrentListMap!2267 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473878 () Bool)

(declare-fun res!283040 () Bool)

(declare-fun e!278058 () Bool)

(assert (=> b!473878 (=> (not res!283040) (not e!278058))))

(declare-datatypes ((List!8942 0))(
  ( (Nil!8939) (Cons!8938 (h!9794 (_ BitVec 64)) (t!14914 List!8942)) )
))
(declare-fun arrayNoDuplicates!0 (array!30467 (_ BitVec 32) List!8942) Bool)

(assert (=> b!473878 (= res!283040 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8939))))

(declare-fun res!283039 () Bool)

(assert (=> start!42472 (=> (not res!283039) (not e!278058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42472 (= res!283039 (validMask!0 mask!1365))))

(assert (=> start!42472 e!278058))

(declare-fun tp_is_empty!13355 () Bool)

(assert (=> start!42472 tp_is_empty!13355))

(assert (=> start!42472 tp!41818))

(assert (=> start!42472 true))

(declare-fun array_inv!10570 (array!30467) Bool)

(assert (=> start!42472 (array_inv!10570 _keys!1025)))

(declare-fun e!278057 () Bool)

(declare-fun array_inv!10571 (array!30469) Bool)

(assert (=> start!42472 (and (array_inv!10571 _values!833) e!278057)))

(declare-fun b!473879 () Bool)

(declare-fun res!283036 () Bool)

(assert (=> b!473879 (=> (not res!283036) (not e!278058))))

(assert (=> b!473879 (= res!283036 (and (= (size!15005 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15004 _keys!1025) (size!15005 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473880 () Bool)

(declare-fun e!278059 () Bool)

(assert (=> b!473880 (= e!278059 tp_is_empty!13355)))

(declare-fun b!473881 () Bool)

(declare-fun e!278062 () Bool)

(assert (=> b!473881 (= e!278062 tp_is_empty!13355)))

(declare-fun mapIsEmpty!21748 () Bool)

(declare-fun mapRes!21748 () Bool)

(assert (=> mapIsEmpty!21748 mapRes!21748))

(declare-fun b!473882 () Bool)

(assert (=> b!473882 (= e!278058 (not e!278061))))

(declare-fun res!283037 () Bool)

(assert (=> b!473882 (=> res!283037 e!278061)))

(assert (=> b!473882 (= res!283037 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215559 () ListLongMap!7775)

(assert (=> b!473882 (= lt!215554 lt!215559)))

(declare-fun lt!215557 () Unit!13964)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!242 (array!30467 array!30469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18911 V!18911 V!18911 V!18911 (_ BitVec 32) Int) Unit!13964)

(assert (=> b!473882 (= lt!215557 (lemmaNoChangeToArrayThenSameMapNoExtras!242 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2062 (array!30467 array!30469 (_ BitVec 32) (_ BitVec 32) V!18911 V!18911 (_ BitVec 32) Int) ListLongMap!7775)

(assert (=> b!473882 (= lt!215559 (getCurrentListMapNoExtraKeys!2062 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473882 (= lt!215554 (getCurrentListMapNoExtraKeys!2062 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21748 () Bool)

(declare-fun tp!41817 () Bool)

(assert (=> mapNonEmpty!21748 (= mapRes!21748 (and tp!41817 e!278059))))

(declare-fun mapValue!21748 () ValueCell!6334)

(declare-fun mapRest!21748 () (Array (_ BitVec 32) ValueCell!6334))

(declare-fun mapKey!21748 () (_ BitVec 32))

(assert (=> mapNonEmpty!21748 (= (arr!14653 _values!833) (store mapRest!21748 mapKey!21748 mapValue!21748))))

(declare-fun b!473883 () Bool)

(assert (=> b!473883 (= e!278057 (and e!278062 mapRes!21748))))

(declare-fun condMapEmpty!21748 () Bool)

(declare-fun mapDefault!21748 () ValueCell!6334)

