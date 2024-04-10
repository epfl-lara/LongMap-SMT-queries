; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41990 () Bool)

(assert start!41990)

(declare-fun b_free!11563 () Bool)

(declare-fun b_next!11563 () Bool)

(assert (=> start!41990 (= b_free!11563 (not b_next!11563))))

(declare-fun tp!40705 () Bool)

(declare-fun b_and!19961 () Bool)

(assert (=> start!41990 (= tp!40705 b_and!19961)))

(declare-fun mapIsEmpty!21181 () Bool)

(declare-fun mapRes!21181 () Bool)

(assert (=> mapIsEmpty!21181 mapRes!21181))

(declare-fun b!468810 () Bool)

(declare-fun e!274428 () Bool)

(declare-fun tp_is_empty!12991 () Bool)

(assert (=> b!468810 (= e!274428 tp_is_empty!12991)))

(declare-fun b!468811 () Bool)

(declare-fun e!274432 () Bool)

(assert (=> b!468811 (= e!274432 tp_is_empty!12991)))

(declare-fun b!468812 () Bool)

(declare-fun e!274433 () Bool)

(assert (=> b!468812 (= e!274433 true)))

(declare-datatypes ((V!18427 0))(
  ( (V!18428 (val!6540 Int)) )
))
(declare-datatypes ((tuple2!8600 0))(
  ( (tuple2!8601 (_1!4311 (_ BitVec 64)) (_2!4311 V!18427)) )
))
(declare-datatypes ((List!8684 0))(
  ( (Nil!8681) (Cons!8680 (h!9536 tuple2!8600) (t!14642 List!8684)) )
))
(declare-datatypes ((ListLongMap!7513 0))(
  ( (ListLongMap!7514 (toList!3772 List!8684)) )
))
(declare-fun lt!212166 () ListLongMap!7513)

(declare-fun lt!212168 () tuple2!8600)

(declare-fun minValueBefore!38 () V!18427)

(declare-fun +!1683 (ListLongMap!7513 tuple2!8600) ListLongMap!7513)

(assert (=> b!468812 (= (+!1683 lt!212166 lt!212168) (+!1683 (+!1683 lt!212166 (tuple2!8601 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212168))))

(declare-fun minValueAfter!38 () V!18427)

(assert (=> b!468812 (= lt!212168 (tuple2!8601 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13699 0))(
  ( (Unit!13700) )
))
(declare-fun lt!212165 () Unit!13699)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!96 (ListLongMap!7513 (_ BitVec 64) V!18427 V!18427) Unit!13699)

(assert (=> b!468812 (= lt!212165 (addSameAsAddTwiceSameKeyDiffValues!96 lt!212166 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18427)

(declare-fun lt!212167 () ListLongMap!7513)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29757 0))(
  ( (array!29758 (arr!14304 (Array (_ BitVec 32) (_ BitVec 64))) (size!14656 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29757)

(declare-datatypes ((ValueCell!6152 0))(
  ( (ValueCellFull!6152 (v!8829 V!18427)) (EmptyCell!6152) )
))
(declare-datatypes ((array!29759 0))(
  ( (array!29760 (arr!14305 (Array (_ BitVec 32) ValueCell!6152)) (size!14657 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29759)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2197 (array!29757 array!29759 (_ BitVec 32) (_ BitVec 32) V!18427 V!18427 (_ BitVec 32) Int) ListLongMap!7513)

(assert (=> b!468812 (= lt!212167 (getCurrentListMap!2197 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212169 () ListLongMap!7513)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468812 (= lt!212169 (getCurrentListMap!2197 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468813 () Bool)

(declare-fun e!274431 () Bool)

(assert (=> b!468813 (= e!274431 (not e!274433))))

(declare-fun res!280166 () Bool)

(assert (=> b!468813 (=> res!280166 e!274433)))

(assert (=> b!468813 (= res!280166 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212170 () ListLongMap!7513)

(assert (=> b!468813 (= lt!212166 lt!212170)))

(declare-fun lt!212164 () Unit!13699)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!122 (array!29757 array!29759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18427 V!18427 V!18427 V!18427 (_ BitVec 32) Int) Unit!13699)

(assert (=> b!468813 (= lt!212164 (lemmaNoChangeToArrayThenSameMapNoExtras!122 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1942 (array!29757 array!29759 (_ BitVec 32) (_ BitVec 32) V!18427 V!18427 (_ BitVec 32) Int) ListLongMap!7513)

(assert (=> b!468813 (= lt!212170 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468813 (= lt!212166 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468814 () Bool)

(declare-fun e!274430 () Bool)

(assert (=> b!468814 (= e!274430 (and e!274428 mapRes!21181))))

(declare-fun condMapEmpty!21181 () Bool)

(declare-fun mapDefault!21181 () ValueCell!6152)

