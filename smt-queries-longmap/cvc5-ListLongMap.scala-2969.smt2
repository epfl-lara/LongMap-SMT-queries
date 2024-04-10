; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42070 () Bool)

(assert start!42070)

(declare-fun b_free!11623 () Bool)

(declare-fun b_next!11623 () Bool)

(assert (=> start!42070 (= b_free!11623 (not b_next!11623))))

(declare-fun tp!40888 () Bool)

(declare-fun b_and!20033 () Bool)

(assert (=> start!42070 (= tp!40888 b_and!20033)))

(declare-fun b!469709 () Bool)

(declare-fun e!275085 () Bool)

(declare-fun tp_is_empty!13051 () Bool)

(assert (=> b!469709 (= e!275085 tp_is_empty!13051)))

(declare-fun b!469710 () Bool)

(declare-fun res!280694 () Bool)

(declare-fun e!275081 () Bool)

(assert (=> b!469710 (=> (not res!280694) (not e!275081))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29873 0))(
  ( (array!29874 (arr!14361 (Array (_ BitVec 32) (_ BitVec 64))) (size!14713 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29873)

(declare-datatypes ((V!18507 0))(
  ( (V!18508 (val!6570 Int)) )
))
(declare-datatypes ((ValueCell!6182 0))(
  ( (ValueCellFull!6182 (v!8860 V!18507)) (EmptyCell!6182) )
))
(declare-datatypes ((array!29875 0))(
  ( (array!29876 (arr!14362 (Array (_ BitVec 32) ValueCell!6182)) (size!14714 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29875)

(assert (=> b!469710 (= res!280694 (and (= (size!14714 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14713 _keys!1025) (size!14714 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21274 () Bool)

(declare-fun mapRes!21274 () Bool)

(assert (=> mapIsEmpty!21274 mapRes!21274))

(declare-fun b!469712 () Bool)

(declare-fun e!275080 () Bool)

(assert (=> b!469712 (= e!275080 true)))

(declare-datatypes ((tuple2!8648 0))(
  ( (tuple2!8649 (_1!4335 (_ BitVec 64)) (_2!4335 V!18507)) )
))
(declare-datatypes ((List!8728 0))(
  ( (Nil!8725) (Cons!8724 (h!9580 tuple2!8648) (t!14688 List!8728)) )
))
(declare-datatypes ((ListLongMap!7561 0))(
  ( (ListLongMap!7562 (toList!3796 List!8728)) )
))
(declare-fun lt!212948 () ListLongMap!7561)

(declare-fun lt!212947 () tuple2!8648)

(declare-fun minValueBefore!38 () V!18507)

(declare-fun +!1704 (ListLongMap!7561 tuple2!8648) ListLongMap!7561)

(assert (=> b!469712 (= (+!1704 lt!212948 lt!212947) (+!1704 (+!1704 lt!212948 (tuple2!8649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212947))))

(declare-fun minValueAfter!38 () V!18507)

(assert (=> b!469712 (= lt!212947 (tuple2!8649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13749 0))(
  ( (Unit!13750) )
))
(declare-fun lt!212946 () Unit!13749)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!117 (ListLongMap!7561 (_ BitVec 64) V!18507 V!18507) Unit!13749)

(assert (=> b!469712 (= lt!212946 (addSameAsAddTwiceSameKeyDiffValues!117 lt!212948 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212949 () ListLongMap!7561)

(declare-fun zeroValue!794 () V!18507)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMap!2218 (array!29873 array!29875 (_ BitVec 32) (_ BitVec 32) V!18507 V!18507 (_ BitVec 32) Int) ListLongMap!7561)

(assert (=> b!469712 (= lt!212949 (getCurrentListMap!2218 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212950 () ListLongMap!7561)

(assert (=> b!469712 (= lt!212950 (getCurrentListMap!2218 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469713 () Bool)

(declare-fun e!275084 () Bool)

(declare-fun e!275082 () Bool)

(assert (=> b!469713 (= e!275084 (and e!275082 mapRes!21274))))

(declare-fun condMapEmpty!21274 () Bool)

(declare-fun mapDefault!21274 () ValueCell!6182)

