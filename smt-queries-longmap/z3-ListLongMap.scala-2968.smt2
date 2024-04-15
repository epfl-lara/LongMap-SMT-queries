; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42050 () Bool)

(assert start!42050)

(declare-fun b_free!11617 () Bool)

(declare-fun b_next!11617 () Bool)

(assert (=> start!42050 (= b_free!11617 (not b_next!11617))))

(declare-fun tp!40869 () Bool)

(declare-fun b_and!20001 () Bool)

(assert (=> start!42050 (= tp!40869 b_and!20001)))

(declare-fun b!469366 () Bool)

(declare-fun res!280522 () Bool)

(declare-fun e!274857 () Bool)

(assert (=> b!469366 (=> (not res!280522) (not e!274857))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29845 0))(
  ( (array!29846 (arr!14347 (Array (_ BitVec 32) (_ BitVec 64))) (size!14700 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29845)

(declare-datatypes ((V!18499 0))(
  ( (V!18500 (val!6567 Int)) )
))
(declare-datatypes ((ValueCell!6179 0))(
  ( (ValueCellFull!6179 (v!8851 V!18499)) (EmptyCell!6179) )
))
(declare-datatypes ((array!29847 0))(
  ( (array!29848 (arr!14348 (Array (_ BitVec 32) ValueCell!6179)) (size!14701 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29847)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!469366 (= res!280522 (and (= (size!14701 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14700 _keys!1025) (size!14701 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469367 () Bool)

(declare-fun res!280520 () Bool)

(assert (=> b!469367 (=> (not res!280520) (not e!274857))))

(declare-datatypes ((List!8753 0))(
  ( (Nil!8750) (Cons!8749 (h!9605 (_ BitVec 64)) (t!14704 List!8753)) )
))
(declare-fun arrayNoDuplicates!0 (array!29845 (_ BitVec 32) List!8753) Bool)

(assert (=> b!469367 (= res!280520 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8750))))

(declare-fun b!469368 () Bool)

(declare-fun e!274855 () Bool)

(assert (=> b!469368 (= e!274857 (not e!274855))))

(declare-fun res!280521 () Bool)

(assert (=> b!469368 (=> res!280521 e!274855)))

(assert (=> b!469368 (= res!280521 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8682 0))(
  ( (tuple2!8683 (_1!4352 (_ BitVec 64)) (_2!4352 V!18499)) )
))
(declare-datatypes ((List!8754 0))(
  ( (Nil!8751) (Cons!8750 (h!9606 tuple2!8682) (t!14705 List!8754)) )
))
(declare-datatypes ((ListLongMap!7585 0))(
  ( (ListLongMap!7586 (toList!3808 List!8754)) )
))
(declare-fun lt!212652 () ListLongMap!7585)

(declare-fun lt!212650 () ListLongMap!7585)

(assert (=> b!469368 (= lt!212652 lt!212650)))

(declare-fun minValueBefore!38 () V!18499)

(declare-fun zeroValue!794 () V!18499)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13715 0))(
  ( (Unit!13716) )
))
(declare-fun lt!212651 () Unit!13715)

(declare-fun minValueAfter!38 () V!18499)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!141 (array!29845 array!29847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18499 V!18499 V!18499 V!18499 (_ BitVec 32) Int) Unit!13715)

(assert (=> b!469368 (= lt!212651 (lemmaNoChangeToArrayThenSameMapNoExtras!141 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1984 (array!29845 array!29847 (_ BitVec 32) (_ BitVec 32) V!18499 V!18499 (_ BitVec 32) Int) ListLongMap!7585)

(assert (=> b!469368 (= lt!212650 (getCurrentListMapNoExtraKeys!1984 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469368 (= lt!212652 (getCurrentListMapNoExtraKeys!1984 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469369 () Bool)

(declare-fun e!274852 () Bool)

(declare-fun e!274853 () Bool)

(declare-fun mapRes!21265 () Bool)

(assert (=> b!469369 (= e!274852 (and e!274853 mapRes!21265))))

(declare-fun condMapEmpty!21265 () Bool)

(declare-fun mapDefault!21265 () ValueCell!6179)

(assert (=> b!469369 (= condMapEmpty!21265 (= (arr!14348 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6179)) mapDefault!21265)))))

(declare-fun b!469370 () Bool)

(declare-fun e!274854 () Bool)

(declare-fun tp_is_empty!13045 () Bool)

(assert (=> b!469370 (= e!274854 tp_is_empty!13045)))

(declare-fun b!469371 () Bool)

(declare-fun res!280518 () Bool)

(assert (=> b!469371 (=> (not res!280518) (not e!274857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29845 (_ BitVec 32)) Bool)

(assert (=> b!469371 (= res!280518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469372 () Bool)

(assert (=> b!469372 (= e!274853 tp_is_empty!13045)))

(declare-fun b!469373 () Bool)

(assert (=> b!469373 (= e!274855 true)))

(declare-fun lt!212654 () tuple2!8682)

(declare-fun +!1734 (ListLongMap!7585 tuple2!8682) ListLongMap!7585)

(assert (=> b!469373 (= (+!1734 lt!212652 lt!212654) (+!1734 (+!1734 lt!212652 (tuple2!8683 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212654))))

(assert (=> b!469373 (= lt!212654 (tuple2!8683 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212648 () Unit!13715)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!117 (ListLongMap!7585 (_ BitVec 64) V!18499 V!18499) Unit!13715)

(assert (=> b!469373 (= lt!212648 (addSameAsAddTwiceSameKeyDiffValues!117 lt!212652 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212649 () ListLongMap!7585)

(declare-fun getCurrentListMap!2170 (array!29845 array!29847 (_ BitVec 32) (_ BitVec 32) V!18499 V!18499 (_ BitVec 32) Int) ListLongMap!7585)

(assert (=> b!469373 (= lt!212649 (getCurrentListMap!2170 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212653 () ListLongMap!7585)

(assert (=> b!469373 (= lt!212653 (getCurrentListMap!2170 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21265 () Bool)

(assert (=> mapIsEmpty!21265 mapRes!21265))

(declare-fun res!280519 () Bool)

(assert (=> start!42050 (=> (not res!280519) (not e!274857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42050 (= res!280519 (validMask!0 mask!1365))))

(assert (=> start!42050 e!274857))

(assert (=> start!42050 tp_is_empty!13045))

(assert (=> start!42050 tp!40869))

(assert (=> start!42050 true))

(declare-fun array_inv!10438 (array!29845) Bool)

(assert (=> start!42050 (array_inv!10438 _keys!1025)))

(declare-fun array_inv!10439 (array!29847) Bool)

(assert (=> start!42050 (and (array_inv!10439 _values!833) e!274852)))

(declare-fun mapNonEmpty!21265 () Bool)

(declare-fun tp!40870 () Bool)

(assert (=> mapNonEmpty!21265 (= mapRes!21265 (and tp!40870 e!274854))))

(declare-fun mapRest!21265 () (Array (_ BitVec 32) ValueCell!6179))

(declare-fun mapKey!21265 () (_ BitVec 32))

(declare-fun mapValue!21265 () ValueCell!6179)

(assert (=> mapNonEmpty!21265 (= (arr!14348 _values!833) (store mapRest!21265 mapKey!21265 mapValue!21265))))

(assert (= (and start!42050 res!280519) b!469366))

(assert (= (and b!469366 res!280522) b!469371))

(assert (= (and b!469371 res!280518) b!469367))

(assert (= (and b!469367 res!280520) b!469368))

(assert (= (and b!469368 (not res!280521)) b!469373))

(assert (= (and b!469369 condMapEmpty!21265) mapIsEmpty!21265))

(assert (= (and b!469369 (not condMapEmpty!21265)) mapNonEmpty!21265))

(get-info :version)

(assert (= (and mapNonEmpty!21265 ((_ is ValueCellFull!6179) mapValue!21265)) b!469370))

(assert (= (and b!469369 ((_ is ValueCellFull!6179) mapDefault!21265)) b!469372))

(assert (= start!42050 b!469369))

(declare-fun m!451117 () Bool)

(assert (=> b!469368 m!451117))

(declare-fun m!451119 () Bool)

(assert (=> b!469368 m!451119))

(declare-fun m!451121 () Bool)

(assert (=> b!469368 m!451121))

(declare-fun m!451123 () Bool)

(assert (=> b!469373 m!451123))

(declare-fun m!451125 () Bool)

(assert (=> b!469373 m!451125))

(assert (=> b!469373 m!451123))

(declare-fun m!451127 () Bool)

(assert (=> b!469373 m!451127))

(declare-fun m!451129 () Bool)

(assert (=> b!469373 m!451129))

(declare-fun m!451131 () Bool)

(assert (=> b!469373 m!451131))

(declare-fun m!451133 () Bool)

(assert (=> b!469373 m!451133))

(declare-fun m!451135 () Bool)

(assert (=> b!469367 m!451135))

(declare-fun m!451137 () Bool)

(assert (=> b!469371 m!451137))

(declare-fun m!451139 () Bool)

(assert (=> start!42050 m!451139))

(declare-fun m!451141 () Bool)

(assert (=> start!42050 m!451141))

(declare-fun m!451143 () Bool)

(assert (=> start!42050 m!451143))

(declare-fun m!451145 () Bool)

(assert (=> mapNonEmpty!21265 m!451145))

(check-sat (not start!42050) (not b!469371) (not b_next!11617) (not b!469367) (not b!469373) tp_is_empty!13045 (not b!469368) b_and!20001 (not mapNonEmpty!21265))
(check-sat b_and!20001 (not b_next!11617))
