; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42630 () Bool)

(assert start!42630)

(declare-fun b_free!12049 () Bool)

(declare-fun b_next!12049 () Bool)

(assert (=> start!42630 (= b_free!12049 (not b_next!12049))))

(declare-fun tp!42192 () Bool)

(declare-fun b_and!20523 () Bool)

(assert (=> start!42630 (= tp!42192 b_and!20523)))

(declare-fun res!283897 () Bool)

(declare-fun e!279151 () Bool)

(assert (=> start!42630 (=> (not res!283897) (not e!279151))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42630 (= res!283897 (validMask!0 mask!1365))))

(assert (=> start!42630 e!279151))

(declare-fun tp_is_empty!13477 () Bool)

(assert (=> start!42630 tp_is_empty!13477))

(assert (=> start!42630 tp!42192))

(assert (=> start!42630 true))

(declare-datatypes ((array!30685 0))(
  ( (array!30686 (arr!14758 (Array (_ BitVec 32) (_ BitVec 64))) (size!15111 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30685)

(declare-fun array_inv!10732 (array!30685) Bool)

(assert (=> start!42630 (array_inv!10732 _keys!1025)))

(declare-datatypes ((V!19075 0))(
  ( (V!19076 (val!6783 Int)) )
))
(declare-datatypes ((ValueCell!6395 0))(
  ( (ValueCellFull!6395 (v!9071 V!19075)) (EmptyCell!6395) )
))
(declare-datatypes ((array!30687 0))(
  ( (array!30688 (arr!14759 (Array (_ BitVec 32) ValueCell!6395)) (size!15112 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30687)

(declare-fun e!279156 () Bool)

(declare-fun array_inv!10733 (array!30687) Bool)

(assert (=> start!42630 (and (array_inv!10733 _values!833) e!279156)))

(declare-fun mapIsEmpty!21940 () Bool)

(declare-fun mapRes!21940 () Bool)

(assert (=> mapIsEmpty!21940 mapRes!21940))

(declare-fun b!475403 () Bool)

(declare-fun res!283898 () Bool)

(assert (=> b!475403 (=> (not res!283898) (not e!279151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30685 (_ BitVec 32)) Bool)

(assert (=> b!475403 (= res!283898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475404 () Bool)

(declare-fun e!279153 () Bool)

(assert (=> b!475404 (= e!279151 (not e!279153))))

(declare-fun res!283899 () Bool)

(assert (=> b!475404 (=> res!283899 e!279153)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475404 (= res!283899 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9004 0))(
  ( (tuple2!9005 (_1!4513 (_ BitVec 64)) (_2!4513 V!19075)) )
))
(declare-datatypes ((List!9065 0))(
  ( (Nil!9062) (Cons!9061 (h!9917 tuple2!9004) (t!15034 List!9065)) )
))
(declare-datatypes ((ListLongMap!7907 0))(
  ( (ListLongMap!7908 (toList!3969 List!9065)) )
))
(declare-fun lt!216428 () ListLongMap!7907)

(declare-fun lt!216426 () ListLongMap!7907)

(assert (=> b!475404 (= lt!216428 lt!216426)))

(declare-datatypes ((Unit!13994 0))(
  ( (Unit!13995) )
))
(declare-fun lt!216427 () Unit!13994)

(declare-fun minValueBefore!38 () V!19075)

(declare-fun zeroValue!794 () V!19075)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!19075)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!270 (array!30685 array!30687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19075 V!19075 V!19075 V!19075 (_ BitVec 32) Int) Unit!13994)

(assert (=> b!475404 (= lt!216427 (lemmaNoChangeToArrayThenSameMapNoExtras!270 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2136 (array!30685 array!30687 (_ BitVec 32) (_ BitVec 32) V!19075 V!19075 (_ BitVec 32) Int) ListLongMap!7907)

(assert (=> b!475404 (= lt!216426 (getCurrentListMapNoExtraKeys!2136 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475404 (= lt!216428 (getCurrentListMapNoExtraKeys!2136 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475405 () Bool)

(declare-fun res!283901 () Bool)

(assert (=> b!475405 (=> (not res!283901) (not e!279151))))

(assert (=> b!475405 (= res!283901 (and (= (size!15112 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15111 _keys!1025) (size!15112 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475406 () Bool)

(declare-fun e!279152 () Bool)

(assert (=> b!475406 (= e!279156 (and e!279152 mapRes!21940))))

(declare-fun condMapEmpty!21940 () Bool)

(declare-fun mapDefault!21940 () ValueCell!6395)

(assert (=> b!475406 (= condMapEmpty!21940 (= (arr!14759 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6395)) mapDefault!21940)))))

(declare-fun b!475407 () Bool)

(declare-fun res!283900 () Bool)

(assert (=> b!475407 (=> (not res!283900) (not e!279151))))

(declare-datatypes ((List!9066 0))(
  ( (Nil!9063) (Cons!9062 (h!9918 (_ BitVec 64)) (t!15035 List!9066)) )
))
(declare-fun arrayNoDuplicates!0 (array!30685 (_ BitVec 32) List!9066) Bool)

(assert (=> b!475407 (= res!283900 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9063))))

(declare-fun b!475408 () Bool)

(declare-fun e!279154 () Bool)

(assert (=> b!475408 (= e!279154 tp_is_empty!13477)))

(declare-fun b!475409 () Bool)

(assert (=> b!475409 (= e!279153 true)))

(declare-fun lt!216425 () ListLongMap!7907)

(declare-fun getCurrentListMap!2243 (array!30685 array!30687 (_ BitVec 32) (_ BitVec 32) V!19075 V!19075 (_ BitVec 32) Int) ListLongMap!7907)

(assert (=> b!475409 (= lt!216425 (getCurrentListMap!2243 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216424 () ListLongMap!7907)

(declare-fun +!1792 (ListLongMap!7907 tuple2!9004) ListLongMap!7907)

(assert (=> b!475409 (= lt!216424 (+!1792 (getCurrentListMap!2243 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!9005 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!475410 () Bool)

(assert (=> b!475410 (= e!279152 tp_is_empty!13477)))

(declare-fun mapNonEmpty!21940 () Bool)

(declare-fun tp!42193 () Bool)

(assert (=> mapNonEmpty!21940 (= mapRes!21940 (and tp!42193 e!279154))))

(declare-fun mapKey!21940 () (_ BitVec 32))

(declare-fun mapValue!21940 () ValueCell!6395)

(declare-fun mapRest!21940 () (Array (_ BitVec 32) ValueCell!6395))

(assert (=> mapNonEmpty!21940 (= (arr!14759 _values!833) (store mapRest!21940 mapKey!21940 mapValue!21940))))

(assert (= (and start!42630 res!283897) b!475405))

(assert (= (and b!475405 res!283901) b!475403))

(assert (= (and b!475403 res!283898) b!475407))

(assert (= (and b!475407 res!283900) b!475404))

(assert (= (and b!475404 (not res!283899)) b!475409))

(assert (= (and b!475406 condMapEmpty!21940) mapIsEmpty!21940))

(assert (= (and b!475406 (not condMapEmpty!21940)) mapNonEmpty!21940))

(get-info :version)

(assert (= (and mapNonEmpty!21940 ((_ is ValueCellFull!6395) mapValue!21940)) b!475408))

(assert (= (and b!475406 ((_ is ValueCellFull!6395) mapDefault!21940)) b!475410))

(assert (= start!42630 b!475406))

(declare-fun m!457115 () Bool)

(assert (=> b!475404 m!457115))

(declare-fun m!457117 () Bool)

(assert (=> b!475404 m!457117))

(declare-fun m!457119 () Bool)

(assert (=> b!475404 m!457119))

(declare-fun m!457121 () Bool)

(assert (=> mapNonEmpty!21940 m!457121))

(declare-fun m!457123 () Bool)

(assert (=> b!475407 m!457123))

(declare-fun m!457125 () Bool)

(assert (=> start!42630 m!457125))

(declare-fun m!457127 () Bool)

(assert (=> start!42630 m!457127))

(declare-fun m!457129 () Bool)

(assert (=> start!42630 m!457129))

(declare-fun m!457131 () Bool)

(assert (=> b!475403 m!457131))

(declare-fun m!457133 () Bool)

(assert (=> b!475409 m!457133))

(declare-fun m!457135 () Bool)

(assert (=> b!475409 m!457135))

(assert (=> b!475409 m!457135))

(declare-fun m!457137 () Bool)

(assert (=> b!475409 m!457137))

(check-sat (not b!475403) (not mapNonEmpty!21940) (not start!42630) b_and!20523 (not b!475407) tp_is_empty!13477 (not b!475409) (not b_next!12049) (not b!475404))
(check-sat b_and!20523 (not b_next!12049))
