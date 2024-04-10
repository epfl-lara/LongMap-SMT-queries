; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42496 () Bool)

(assert start!42496)

(declare-fun b_free!11951 () Bool)

(declare-fun b_next!11951 () Bool)

(assert (=> start!42496 (= b_free!11951 (not b_next!11951))))

(declare-fun tp!41889 () Bool)

(declare-fun b_and!20419 () Bool)

(assert (=> start!42496 (= tp!41889 b_and!20419)))

(declare-fun b!474165 () Bool)

(declare-fun e!278278 () Bool)

(declare-fun e!278277 () Bool)

(assert (=> b!474165 (= e!278278 (not e!278277))))

(declare-fun res!283218 () Bool)

(assert (=> b!474165 (=> res!283218 e!278277)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474165 (= res!283218 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18943 0))(
  ( (V!18944 (val!6734 Int)) )
))
(declare-datatypes ((tuple2!8878 0))(
  ( (tuple2!8879 (_1!4450 (_ BitVec 64)) (_2!4450 V!18943)) )
))
(declare-datatypes ((List!8957 0))(
  ( (Nil!8954) (Cons!8953 (h!9809 tuple2!8878) (t!14929 List!8957)) )
))
(declare-datatypes ((ListLongMap!7791 0))(
  ( (ListLongMap!7792 (toList!3911 List!8957)) )
))
(declare-fun lt!215842 () ListLongMap!7791)

(declare-fun lt!215840 () ListLongMap!7791)

(assert (=> b!474165 (= lt!215842 lt!215840)))

(declare-fun zeroValue!794 () V!18943)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18943)

(declare-datatypes ((Unit!13980 0))(
  ( (Unit!13981) )
))
(declare-fun lt!215845 () Unit!13980)

(declare-datatypes ((array!30509 0))(
  ( (array!30510 (arr!14673 (Array (_ BitVec 32) (_ BitVec 64))) (size!15025 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30509)

(declare-datatypes ((ValueCell!6346 0))(
  ( (ValueCellFull!6346 (v!9026 V!18943)) (EmptyCell!6346) )
))
(declare-datatypes ((array!30511 0))(
  ( (array!30512 (arr!14674 (Array (_ BitVec 32) ValueCell!6346)) (size!15026 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30511)

(declare-fun minValueAfter!38 () V!18943)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!249 (array!30509 array!30511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18943 V!18943 V!18943 V!18943 (_ BitVec 32) Int) Unit!13980)

(assert (=> b!474165 (= lt!215845 (lemmaNoChangeToArrayThenSameMapNoExtras!249 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2069 (array!30509 array!30511 (_ BitVec 32) (_ BitVec 32) V!18943 V!18943 (_ BitVec 32) Int) ListLongMap!7791)

(assert (=> b!474165 (= lt!215840 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474165 (= lt!215842 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21784 () Bool)

(declare-fun mapRes!21784 () Bool)

(assert (=> mapIsEmpty!21784 mapRes!21784))

(declare-fun b!474166 () Bool)

(declare-fun res!283216 () Bool)

(assert (=> b!474166 (=> (not res!283216) (not e!278278))))

(assert (=> b!474166 (= res!283216 (and (= (size!15026 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15025 _keys!1025) (size!15026 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474167 () Bool)

(declare-fun res!283219 () Bool)

(assert (=> b!474167 (=> (not res!283219) (not e!278278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30509 (_ BitVec 32)) Bool)

(assert (=> b!474167 (= res!283219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474168 () Bool)

(declare-fun res!283217 () Bool)

(assert (=> b!474168 (=> (not res!283217) (not e!278278))))

(declare-datatypes ((List!8958 0))(
  ( (Nil!8955) (Cons!8954 (h!9810 (_ BitVec 64)) (t!14930 List!8958)) )
))
(declare-fun arrayNoDuplicates!0 (array!30509 (_ BitVec 32) List!8958) Bool)

(assert (=> b!474168 (= res!283217 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8955))))

(declare-fun b!474169 () Bool)

(assert (=> b!474169 (= e!278277 true)))

(declare-fun lt!215847 () ListLongMap!7791)

(declare-fun lt!215844 () tuple2!8878)

(declare-fun +!1746 (ListLongMap!7791 tuple2!8878) ListLongMap!7791)

(assert (=> b!474169 (= (+!1746 lt!215847 lt!215844) (+!1746 (+!1746 lt!215847 (tuple2!8879 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215844))))

(assert (=> b!474169 (= lt!215844 (tuple2!8879 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215846 () Unit!13980)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!155 (ListLongMap!7791 (_ BitVec 64) V!18943 V!18943) Unit!13980)

(assert (=> b!474169 (= lt!215846 (addSameAsAddTwiceSameKeyDiffValues!155 lt!215847 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!474169 (= lt!215847 (+!1746 lt!215842 (tuple2!8879 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215843 () ListLongMap!7791)

(declare-fun getCurrentListMap!2275 (array!30509 array!30511 (_ BitVec 32) (_ BitVec 32) V!18943 V!18943 (_ BitVec 32) Int) ListLongMap!7791)

(assert (=> b!474169 (= lt!215843 (getCurrentListMap!2275 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215841 () ListLongMap!7791)

(assert (=> b!474169 (= lt!215841 (getCurrentListMap!2275 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21784 () Bool)

(declare-fun tp!41890 () Bool)

(declare-fun e!278274 () Bool)

(assert (=> mapNonEmpty!21784 (= mapRes!21784 (and tp!41890 e!278274))))

(declare-fun mapKey!21784 () (_ BitVec 32))

(declare-fun mapRest!21784 () (Array (_ BitVec 32) ValueCell!6346))

(declare-fun mapValue!21784 () ValueCell!6346)

(assert (=> mapNonEmpty!21784 (= (arr!14674 _values!833) (store mapRest!21784 mapKey!21784 mapValue!21784))))

(declare-fun b!474170 () Bool)

(declare-fun tp_is_empty!13379 () Bool)

(assert (=> b!474170 (= e!278274 tp_is_empty!13379)))

(declare-fun b!474171 () Bool)

(declare-fun e!278273 () Bool)

(declare-fun e!278276 () Bool)

(assert (=> b!474171 (= e!278273 (and e!278276 mapRes!21784))))

(declare-fun condMapEmpty!21784 () Bool)

(declare-fun mapDefault!21784 () ValueCell!6346)

