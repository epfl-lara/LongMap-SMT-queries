; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41978 () Bool)

(assert start!41978)

(declare-fun b_free!11551 () Bool)

(declare-fun b_next!11551 () Bool)

(assert (=> start!41978 (= b_free!11551 (not b_next!11551))))

(declare-fun tp!40669 () Bool)

(declare-fun b_and!19949 () Bool)

(assert (=> start!41978 (= tp!40669 b_and!19949)))

(declare-fun mapNonEmpty!21163 () Bool)

(declare-fun mapRes!21163 () Bool)

(declare-fun tp!40668 () Bool)

(declare-fun e!274325 () Bool)

(assert (=> mapNonEmpty!21163 (= mapRes!21163 (and tp!40668 e!274325))))

(declare-datatypes ((V!18411 0))(
  ( (V!18412 (val!6534 Int)) )
))
(declare-datatypes ((ValueCell!6146 0))(
  ( (ValueCellFull!6146 (v!8823 V!18411)) (EmptyCell!6146) )
))
(declare-datatypes ((array!29733 0))(
  ( (array!29734 (arr!14292 (Array (_ BitVec 32) ValueCell!6146)) (size!14644 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29733)

(declare-fun mapKey!21163 () (_ BitVec 32))

(declare-fun mapValue!21163 () ValueCell!6146)

(declare-fun mapRest!21163 () (Array (_ BitVec 32) ValueCell!6146))

(assert (=> mapNonEmpty!21163 (= (arr!14292 _values!833) (store mapRest!21163 mapKey!21163 mapValue!21163))))

(declare-fun b!468666 () Bool)

(declare-fun res!280079 () Bool)

(declare-fun e!274324 () Bool)

(assert (=> b!468666 (=> (not res!280079) (not e!274324))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29735 0))(
  ( (array!29736 (arr!14293 (Array (_ BitVec 32) (_ BitVec 64))) (size!14645 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29735)

(assert (=> b!468666 (= res!280079 (and (= (size!14644 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14645 _keys!1025) (size!14644 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21163 () Bool)

(assert (=> mapIsEmpty!21163 mapRes!21163))

(declare-fun b!468667 () Bool)

(declare-fun e!274323 () Bool)

(assert (=> b!468667 (= e!274323 true)))

(declare-datatypes ((tuple2!8590 0))(
  ( (tuple2!8591 (_1!4306 (_ BitVec 64)) (_2!4306 V!18411)) )
))
(declare-datatypes ((List!8675 0))(
  ( (Nil!8672) (Cons!8671 (h!9527 tuple2!8590) (t!14633 List!8675)) )
))
(declare-datatypes ((ListLongMap!7503 0))(
  ( (ListLongMap!7504 (toList!3767 List!8675)) )
))
(declare-fun lt!212041 () ListLongMap!7503)

(declare-fun lt!212038 () tuple2!8590)

(declare-fun minValueBefore!38 () V!18411)

(declare-fun +!1679 (ListLongMap!7503 tuple2!8590) ListLongMap!7503)

(assert (=> b!468667 (= (+!1679 lt!212041 lt!212038) (+!1679 (+!1679 lt!212041 (tuple2!8591 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212038))))

(declare-fun minValueAfter!38 () V!18411)

(assert (=> b!468667 (= lt!212038 (tuple2!8591 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13689 0))(
  ( (Unit!13690) )
))
(declare-fun lt!212039 () Unit!13689)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!92 (ListLongMap!7503 (_ BitVec 64) V!18411 V!18411) Unit!13689)

(assert (=> b!468667 (= lt!212039 (addSameAsAddTwiceSameKeyDiffValues!92 lt!212041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18411)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212040 () ListLongMap!7503)

(declare-fun getCurrentListMap!2193 (array!29735 array!29733 (_ BitVec 32) (_ BitVec 32) V!18411 V!18411 (_ BitVec 32) Int) ListLongMap!7503)

(assert (=> b!468667 (= lt!212040 (getCurrentListMap!2193 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212043 () ListLongMap!7503)

(assert (=> b!468667 (= lt!212043 (getCurrentListMap!2193 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468668 () Bool)

(assert (=> b!468668 (= e!274324 (not e!274323))))

(declare-fun res!280075 () Bool)

(assert (=> b!468668 (=> res!280075 e!274323)))

(assert (=> b!468668 (= res!280075 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212042 () ListLongMap!7503)

(assert (=> b!468668 (= lt!212041 lt!212042)))

(declare-fun lt!212044 () Unit!13689)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!117 (array!29735 array!29733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18411 V!18411 V!18411 V!18411 (_ BitVec 32) Int) Unit!13689)

(assert (=> b!468668 (= lt!212044 (lemmaNoChangeToArrayThenSameMapNoExtras!117 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1937 (array!29735 array!29733 (_ BitVec 32) (_ BitVec 32) V!18411 V!18411 (_ BitVec 32) Int) ListLongMap!7503)

(assert (=> b!468668 (= lt!212042 (getCurrentListMapNoExtraKeys!1937 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468668 (= lt!212041 (getCurrentListMapNoExtraKeys!1937 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468669 () Bool)

(declare-fun e!274322 () Bool)

(declare-fun e!274321 () Bool)

(assert (=> b!468669 (= e!274322 (and e!274321 mapRes!21163))))

(declare-fun condMapEmpty!21163 () Bool)

(declare-fun mapDefault!21163 () ValueCell!6146)

