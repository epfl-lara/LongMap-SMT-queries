; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42388 () Bool)

(assert start!42388)

(declare-fun b_free!11863 () Bool)

(declare-fun b_next!11863 () Bool)

(assert (=> start!42388 (= b_free!11863 (not b_next!11863))))

(declare-fun tp!41622 () Bool)

(declare-fun b_and!20319 () Bool)

(assert (=> start!42388 (= tp!41622 b_and!20319)))

(declare-fun b!472928 () Bool)

(declare-fun res!282480 () Bool)

(declare-fun e!277372 () Bool)

(assert (=> b!472928 (=> (not res!282480) (not e!277372))))

(declare-datatypes ((array!30341 0))(
  ( (array!30342 (arr!14590 (Array (_ BitVec 32) (_ BitVec 64))) (size!14942 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30341)

(declare-datatypes ((List!8895 0))(
  ( (Nil!8892) (Cons!8891 (h!9747 (_ BitVec 64)) (t!14865 List!8895)) )
))
(declare-fun arrayNoDuplicates!0 (array!30341 (_ BitVec 32) List!8895) Bool)

(assert (=> b!472928 (= res!282480 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8892))))

(declare-fun b!472929 () Bool)

(declare-fun e!277370 () Bool)

(declare-fun tp_is_empty!13291 () Bool)

(assert (=> b!472929 (= e!277370 tp_is_empty!13291)))

(declare-fun b!472930 () Bool)

(declare-fun e!277373 () Bool)

(assert (=> b!472930 (= e!277372 (not e!277373))))

(declare-fun res!282477 () Bool)

(assert (=> b!472930 (=> res!282477 e!277373)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472930 (= res!282477 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18827 0))(
  ( (V!18828 (val!6690 Int)) )
))
(declare-datatypes ((tuple2!8812 0))(
  ( (tuple2!8813 (_1!4417 (_ BitVec 64)) (_2!4417 V!18827)) )
))
(declare-datatypes ((List!8896 0))(
  ( (Nil!8893) (Cons!8892 (h!9748 tuple2!8812) (t!14866 List!8896)) )
))
(declare-datatypes ((ListLongMap!7725 0))(
  ( (ListLongMap!7726 (toList!3878 List!8896)) )
))
(declare-fun lt!214633 () ListLongMap!7725)

(declare-fun lt!214636 () ListLongMap!7725)

(assert (=> b!472930 (= lt!214633 lt!214636)))

(declare-datatypes ((Unit!13912 0))(
  ( (Unit!13913) )
))
(declare-fun lt!214632 () Unit!13912)

(declare-fun minValueBefore!38 () V!18827)

(declare-fun zeroValue!794 () V!18827)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6302 0))(
  ( (ValueCellFull!6302 (v!8981 V!18827)) (EmptyCell!6302) )
))
(declare-datatypes ((array!30343 0))(
  ( (array!30344 (arr!14591 (Array (_ BitVec 32) ValueCell!6302)) (size!14943 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30343)

(declare-fun minValueAfter!38 () V!18827)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!219 (array!30341 array!30343 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18827 V!18827 V!18827 V!18827 (_ BitVec 32) Int) Unit!13912)

(assert (=> b!472930 (= lt!214632 (lemmaNoChangeToArrayThenSameMapNoExtras!219 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2039 (array!30341 array!30343 (_ BitVec 32) (_ BitVec 32) V!18827 V!18827 (_ BitVec 32) Int) ListLongMap!7725)

(assert (=> b!472930 (= lt!214636 (getCurrentListMapNoExtraKeys!2039 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472930 (= lt!214633 (getCurrentListMapNoExtraKeys!2039 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282478 () Bool)

(assert (=> start!42388 (=> (not res!282478) (not e!277372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42388 (= res!282478 (validMask!0 mask!1365))))

(assert (=> start!42388 e!277372))

(assert (=> start!42388 tp_is_empty!13291))

(assert (=> start!42388 tp!41622))

(assert (=> start!42388 true))

(declare-fun array_inv!10520 (array!30341) Bool)

(assert (=> start!42388 (array_inv!10520 _keys!1025)))

(declare-fun e!277368 () Bool)

(declare-fun array_inv!10521 (array!30343) Bool)

(assert (=> start!42388 (and (array_inv!10521 _values!833) e!277368)))

(declare-fun mapNonEmpty!21649 () Bool)

(declare-fun mapRes!21649 () Bool)

(declare-fun tp!41623 () Bool)

(declare-fun e!277371 () Bool)

(assert (=> mapNonEmpty!21649 (= mapRes!21649 (and tp!41623 e!277371))))

(declare-fun mapKey!21649 () (_ BitVec 32))

(declare-fun mapRest!21649 () (Array (_ BitVec 32) ValueCell!6302))

(declare-fun mapValue!21649 () ValueCell!6302)

(assert (=> mapNonEmpty!21649 (= (arr!14591 _values!833) (store mapRest!21649 mapKey!21649 mapValue!21649))))

(declare-fun b!472931 () Bool)

(assert (=> b!472931 (= e!277371 tp_is_empty!13291)))

(declare-fun b!472932 () Bool)

(assert (=> b!472932 (= e!277373 true)))

(declare-fun lt!214635 () ListLongMap!7725)

(declare-fun lt!214630 () tuple2!8812)

(declare-fun +!1718 (ListLongMap!7725 tuple2!8812) ListLongMap!7725)

(assert (=> b!472932 (= (+!1718 lt!214635 lt!214630) (+!1718 (+!1718 lt!214635 (tuple2!8813 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214630))))

(assert (=> b!472932 (= lt!214630 (tuple2!8813 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214631 () Unit!13912)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!127 (ListLongMap!7725 (_ BitVec 64) V!18827 V!18827) Unit!13912)

(assert (=> b!472932 (= lt!214631 (addSameAsAddTwiceSameKeyDiffValues!127 lt!214635 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!472932 (= lt!214635 (+!1718 lt!214633 (tuple2!8813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214629 () ListLongMap!7725)

(declare-fun getCurrentListMap!2247 (array!30341 array!30343 (_ BitVec 32) (_ BitVec 32) V!18827 V!18827 (_ BitVec 32) Int) ListLongMap!7725)

(assert (=> b!472932 (= lt!214629 (getCurrentListMap!2247 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214634 () ListLongMap!7725)

(assert (=> b!472932 (= lt!214634 (getCurrentListMap!2247 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21649 () Bool)

(assert (=> mapIsEmpty!21649 mapRes!21649))

(declare-fun b!472933 () Bool)

(assert (=> b!472933 (= e!277368 (and e!277370 mapRes!21649))))

(declare-fun condMapEmpty!21649 () Bool)

(declare-fun mapDefault!21649 () ValueCell!6302)

