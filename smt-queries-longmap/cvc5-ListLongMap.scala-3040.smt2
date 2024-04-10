; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42644 () Bool)

(assert start!42644)

(declare-fun b_free!12049 () Bool)

(declare-fun b_next!12049 () Bool)

(assert (=> start!42644 (= b_free!12049 (not b_next!12049))))

(declare-fun tp!42192 () Bool)

(declare-fun b_and!20549 () Bool)

(assert (=> start!42644 (= tp!42192 b_and!20549)))

(declare-fun b!475674 () Bool)

(declare-fun res!284030 () Bool)

(declare-fun e!279328 () Bool)

(assert (=> b!475674 (=> (not res!284030) (not e!279328))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30693 0))(
  ( (array!30694 (arr!14762 (Array (_ BitVec 32) (_ BitVec 64))) (size!15114 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30693)

(declare-datatypes ((V!19075 0))(
  ( (V!19076 (val!6783 Int)) )
))
(declare-datatypes ((ValueCell!6395 0))(
  ( (ValueCellFull!6395 (v!9077 V!19075)) (EmptyCell!6395) )
))
(declare-datatypes ((array!30695 0))(
  ( (array!30696 (arr!14763 (Array (_ BitVec 32) ValueCell!6395)) (size!15115 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30695)

(assert (=> b!475674 (= res!284030 (and (= (size!15115 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15114 _keys!1025) (size!15115 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475675 () Bool)

(declare-fun e!279325 () Bool)

(assert (=> b!475675 (= e!279325 true)))

(declare-datatypes ((tuple2!8944 0))(
  ( (tuple2!8945 (_1!4483 (_ BitVec 64)) (_2!4483 V!19075)) )
))
(declare-datatypes ((List!9022 0))(
  ( (Nil!9019) (Cons!9018 (h!9874 tuple2!8944) (t!15000 List!9022)) )
))
(declare-datatypes ((ListLongMap!7857 0))(
  ( (ListLongMap!7858 (toList!3944 List!9022)) )
))
(declare-fun lt!216658 () ListLongMap!7857)

(declare-fun zeroValue!794 () V!19075)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19075)

(declare-fun getCurrentListMap!2286 (array!30693 array!30695 (_ BitVec 32) (_ BitVec 32) V!19075 V!19075 (_ BitVec 32) Int) ListLongMap!7857)

(assert (=> b!475675 (= lt!216658 (getCurrentListMap!2286 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19075)

(declare-fun lt!216662 () ListLongMap!7857)

(declare-fun +!1758 (ListLongMap!7857 tuple2!8944) ListLongMap!7857)

(assert (=> b!475675 (= lt!216662 (+!1758 (getCurrentListMap!2286 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8945 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!475676 () Bool)

(assert (=> b!475676 (= e!279328 (not e!279325))))

(declare-fun res!284028 () Bool)

(assert (=> b!475676 (=> res!284028 e!279325)))

(assert (=> b!475676 (= res!284028 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!216661 () ListLongMap!7857)

(declare-fun lt!216660 () ListLongMap!7857)

(assert (=> b!475676 (= lt!216661 lt!216660)))

(declare-datatypes ((Unit!14010 0))(
  ( (Unit!14011) )
))
(declare-fun lt!216659 () Unit!14010)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!260 (array!30693 array!30695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19075 V!19075 V!19075 V!19075 (_ BitVec 32) Int) Unit!14010)

(assert (=> b!475676 (= lt!216659 (lemmaNoChangeToArrayThenSameMapNoExtras!260 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2100 (array!30693 array!30695 (_ BitVec 32) (_ BitVec 32) V!19075 V!19075 (_ BitVec 32) Int) ListLongMap!7857)

(assert (=> b!475676 (= lt!216660 (getCurrentListMapNoExtraKeys!2100 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475676 (= lt!216661 (getCurrentListMapNoExtraKeys!2100 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21940 () Bool)

(declare-fun mapRes!21940 () Bool)

(declare-fun tp!42193 () Bool)

(declare-fun e!279330 () Bool)

(assert (=> mapNonEmpty!21940 (= mapRes!21940 (and tp!42193 e!279330))))

(declare-fun mapValue!21940 () ValueCell!6395)

(declare-fun mapKey!21940 () (_ BitVec 32))

(declare-fun mapRest!21940 () (Array (_ BitVec 32) ValueCell!6395))

(assert (=> mapNonEmpty!21940 (= (arr!14763 _values!833) (store mapRest!21940 mapKey!21940 mapValue!21940))))

(declare-fun b!475677 () Bool)

(declare-fun tp_is_empty!13477 () Bool)

(assert (=> b!475677 (= e!279330 tp_is_empty!13477)))

(declare-fun b!475678 () Bool)

(declare-fun e!279327 () Bool)

(assert (=> b!475678 (= e!279327 tp_is_empty!13477)))

(declare-fun b!475680 () Bool)

(declare-fun e!279329 () Bool)

(assert (=> b!475680 (= e!279329 (and e!279327 mapRes!21940))))

(declare-fun condMapEmpty!21940 () Bool)

(declare-fun mapDefault!21940 () ValueCell!6395)

