; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42504 () Bool)

(assert start!42504)

(declare-fun b_free!11959 () Bool)

(declare-fun b_next!11959 () Bool)

(assert (=> start!42504 (= b_free!11959 (not b_next!11959))))

(declare-fun tp!41913 () Bool)

(declare-fun b_and!20427 () Bool)

(assert (=> start!42504 (= tp!41913 b_and!20427)))

(declare-fun b!474261 () Bool)

(declare-fun e!278347 () Bool)

(assert (=> b!474261 (= e!278347 true)))

(declare-datatypes ((V!18955 0))(
  ( (V!18956 (val!6738 Int)) )
))
(declare-datatypes ((tuple2!8886 0))(
  ( (tuple2!8887 (_1!4454 (_ BitVec 64)) (_2!4454 V!18955)) )
))
(declare-datatypes ((List!8963 0))(
  ( (Nil!8960) (Cons!8959 (h!9815 tuple2!8886) (t!14935 List!8963)) )
))
(declare-datatypes ((ListLongMap!7799 0))(
  ( (ListLongMap!7800 (toList!3915 List!8963)) )
))
(declare-fun lt!215936 () ListLongMap!7799)

(declare-fun lt!215937 () tuple2!8886)

(declare-fun minValueBefore!38 () V!18955)

(declare-fun +!1750 (ListLongMap!7799 tuple2!8886) ListLongMap!7799)

(assert (=> b!474261 (= (+!1750 lt!215936 lt!215937) (+!1750 (+!1750 lt!215936 (tuple2!8887 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215937))))

(declare-fun minValueAfter!38 () V!18955)

(assert (=> b!474261 (= lt!215937 (tuple2!8887 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13988 0))(
  ( (Unit!13989) )
))
(declare-fun lt!215943 () Unit!13988)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!159 (ListLongMap!7799 (_ BitVec 64) V!18955 V!18955) Unit!13988)

(assert (=> b!474261 (= lt!215943 (addSameAsAddTwiceSameKeyDiffValues!159 lt!215936 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215939 () ListLongMap!7799)

(declare-fun zeroValue!794 () V!18955)

(assert (=> b!474261 (= lt!215936 (+!1750 lt!215939 (tuple2!8887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215938 () ListLongMap!7799)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((array!30525 0))(
  ( (array!30526 (arr!14681 (Array (_ BitVec 32) (_ BitVec 64))) (size!15033 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30525)

(declare-datatypes ((ValueCell!6350 0))(
  ( (ValueCellFull!6350 (v!9030 V!18955)) (EmptyCell!6350) )
))
(declare-datatypes ((array!30527 0))(
  ( (array!30528 (arr!14682 (Array (_ BitVec 32) ValueCell!6350)) (size!15034 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30527)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2279 (array!30525 array!30527 (_ BitVec 32) (_ BitVec 32) V!18955 V!18955 (_ BitVec 32) Int) ListLongMap!7799)

(assert (=> b!474261 (= lt!215938 (getCurrentListMap!2279 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215941 () ListLongMap!7799)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474261 (= lt!215941 (getCurrentListMap!2279 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21796 () Bool)

(declare-fun mapRes!21796 () Bool)

(assert (=> mapIsEmpty!21796 mapRes!21796))

(declare-fun b!474262 () Bool)

(declare-fun res!283280 () Bool)

(declare-fun e!278349 () Bool)

(assert (=> b!474262 (=> (not res!283280) (not e!278349))))

(declare-datatypes ((List!8964 0))(
  ( (Nil!8961) (Cons!8960 (h!9816 (_ BitVec 64)) (t!14936 List!8964)) )
))
(declare-fun arrayNoDuplicates!0 (array!30525 (_ BitVec 32) List!8964) Bool)

(assert (=> b!474262 (= res!283280 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8961))))

(declare-fun b!474264 () Bool)

(declare-fun res!283279 () Bool)

(assert (=> b!474264 (=> (not res!283279) (not e!278349))))

(assert (=> b!474264 (= res!283279 (and (= (size!15034 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15033 _keys!1025) (size!15034 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474265 () Bool)

(declare-fun e!278348 () Bool)

(declare-fun tp_is_empty!13387 () Bool)

(assert (=> b!474265 (= e!278348 tp_is_empty!13387)))

(declare-fun b!474266 () Bool)

(declare-fun e!278345 () Bool)

(assert (=> b!474266 (= e!278345 tp_is_empty!13387)))

(declare-fun b!474267 () Bool)

(declare-fun res!283276 () Bool)

(assert (=> b!474267 (=> (not res!283276) (not e!278349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30525 (_ BitVec 32)) Bool)

(assert (=> b!474267 (= res!283276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!283277 () Bool)

(assert (=> start!42504 (=> (not res!283277) (not e!278349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42504 (= res!283277 (validMask!0 mask!1365))))

(assert (=> start!42504 e!278349))

(assert (=> start!42504 tp_is_empty!13387))

(assert (=> start!42504 tp!41913))

(assert (=> start!42504 true))

(declare-fun array_inv!10594 (array!30525) Bool)

(assert (=> start!42504 (array_inv!10594 _keys!1025)))

(declare-fun e!278346 () Bool)

(declare-fun array_inv!10595 (array!30527) Bool)

(assert (=> start!42504 (and (array_inv!10595 _values!833) e!278346)))

(declare-fun b!474263 () Bool)

(assert (=> b!474263 (= e!278349 (not e!278347))))

(declare-fun res!283278 () Bool)

(assert (=> b!474263 (=> res!283278 e!278347)))

(assert (=> b!474263 (= res!283278 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215940 () ListLongMap!7799)

(assert (=> b!474263 (= lt!215939 lt!215940)))

(declare-fun lt!215942 () Unit!13988)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!252 (array!30525 array!30527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18955 V!18955 V!18955 V!18955 (_ BitVec 32) Int) Unit!13988)

(assert (=> b!474263 (= lt!215942 (lemmaNoChangeToArrayThenSameMapNoExtras!252 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2072 (array!30525 array!30527 (_ BitVec 32) (_ BitVec 32) V!18955 V!18955 (_ BitVec 32) Int) ListLongMap!7799)

(assert (=> b!474263 (= lt!215940 (getCurrentListMapNoExtraKeys!2072 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474263 (= lt!215939 (getCurrentListMapNoExtraKeys!2072 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21796 () Bool)

(declare-fun tp!41914 () Bool)

(assert (=> mapNonEmpty!21796 (= mapRes!21796 (and tp!41914 e!278348))))

(declare-fun mapRest!21796 () (Array (_ BitVec 32) ValueCell!6350))

(declare-fun mapValue!21796 () ValueCell!6350)

(declare-fun mapKey!21796 () (_ BitVec 32))

(assert (=> mapNonEmpty!21796 (= (arr!14682 _values!833) (store mapRest!21796 mapKey!21796 mapValue!21796))))

(declare-fun b!474268 () Bool)

(assert (=> b!474268 (= e!278346 (and e!278345 mapRes!21796))))

(declare-fun condMapEmpty!21796 () Bool)

(declare-fun mapDefault!21796 () ValueCell!6350)

