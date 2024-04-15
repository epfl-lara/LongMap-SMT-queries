; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42032 () Bool)

(assert start!42032)

(declare-fun b_free!11599 () Bool)

(declare-fun b_next!11599 () Bool)

(assert (=> start!42032 (= b_free!11599 (not b_next!11599))))

(declare-fun tp!40816 () Bool)

(declare-fun b_and!19983 () Bool)

(assert (=> start!42032 (= tp!40816 b_and!19983)))

(declare-fun b!469150 () Bool)

(declare-fun e!274690 () Bool)

(declare-fun e!274695 () Bool)

(assert (=> b!469150 (= e!274690 (not e!274695))))

(declare-fun res!280386 () Bool)

(assert (=> b!469150 (=> res!280386 e!274695)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469150 (= res!280386 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18475 0))(
  ( (V!18476 (val!6558 Int)) )
))
(declare-datatypes ((tuple2!8668 0))(
  ( (tuple2!8669 (_1!4345 (_ BitVec 64)) (_2!4345 V!18475)) )
))
(declare-datatypes ((List!8740 0))(
  ( (Nil!8737) (Cons!8736 (h!9592 tuple2!8668) (t!14691 List!8740)) )
))
(declare-datatypes ((ListLongMap!7571 0))(
  ( (ListLongMap!7572 (toList!3801 List!8740)) )
))
(declare-fun lt!212460 () ListLongMap!7571)

(declare-fun lt!212459 () ListLongMap!7571)

(assert (=> b!469150 (= lt!212460 lt!212459)))

(declare-datatypes ((Unit!13701 0))(
  ( (Unit!13702) )
))
(declare-fun lt!212463 () Unit!13701)

(declare-fun minValueBefore!38 () V!18475)

(declare-fun zeroValue!794 () V!18475)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29811 0))(
  ( (array!29812 (arr!14330 (Array (_ BitVec 32) (_ BitVec 64))) (size!14683 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29811)

(declare-datatypes ((ValueCell!6170 0))(
  ( (ValueCellFull!6170 (v!8842 V!18475)) (EmptyCell!6170) )
))
(declare-datatypes ((array!29813 0))(
  ( (array!29814 (arr!14331 (Array (_ BitVec 32) ValueCell!6170)) (size!14684 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29813)

(declare-fun minValueAfter!38 () V!18475)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!135 (array!29811 array!29813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18475 V!18475 V!18475 V!18475 (_ BitVec 32) Int) Unit!13701)

(assert (=> b!469150 (= lt!212463 (lemmaNoChangeToArrayThenSameMapNoExtras!135 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1978 (array!29811 array!29813 (_ BitVec 32) (_ BitVec 32) V!18475 V!18475 (_ BitVec 32) Int) ListLongMap!7571)

(assert (=> b!469150 (= lt!212459 (getCurrentListMapNoExtraKeys!1978 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469150 (= lt!212460 (getCurrentListMapNoExtraKeys!1978 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469151 () Bool)

(declare-fun res!280385 () Bool)

(assert (=> b!469151 (=> (not res!280385) (not e!274690))))

(declare-datatypes ((List!8741 0))(
  ( (Nil!8738) (Cons!8737 (h!9593 (_ BitVec 64)) (t!14692 List!8741)) )
))
(declare-fun arrayNoDuplicates!0 (array!29811 (_ BitVec 32) List!8741) Bool)

(assert (=> b!469151 (= res!280385 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8738))))

(declare-fun res!280387 () Bool)

(assert (=> start!42032 (=> (not res!280387) (not e!274690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42032 (= res!280387 (validMask!0 mask!1365))))

(assert (=> start!42032 e!274690))

(declare-fun tp_is_empty!13027 () Bool)

(assert (=> start!42032 tp_is_empty!13027))

(assert (=> start!42032 tp!40816))

(assert (=> start!42032 true))

(declare-fun array_inv!10426 (array!29811) Bool)

(assert (=> start!42032 (array_inv!10426 _keys!1025)))

(declare-fun e!274694 () Bool)

(declare-fun array_inv!10427 (array!29813) Bool)

(assert (=> start!42032 (and (array_inv!10427 _values!833) e!274694)))

(declare-fun b!469152 () Bool)

(declare-fun e!274693 () Bool)

(declare-fun mapRes!21238 () Bool)

(assert (=> b!469152 (= e!274694 (and e!274693 mapRes!21238))))

(declare-fun condMapEmpty!21238 () Bool)

(declare-fun mapDefault!21238 () ValueCell!6170)

(assert (=> b!469152 (= condMapEmpty!21238 (= (arr!14331 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6170)) mapDefault!21238)))))

(declare-fun b!469153 () Bool)

(assert (=> b!469153 (= e!274695 true)))

(declare-fun lt!212461 () tuple2!8668)

(declare-fun +!1730 (ListLongMap!7571 tuple2!8668) ListLongMap!7571)

(assert (=> b!469153 (= (+!1730 lt!212460 lt!212461) (+!1730 (+!1730 lt!212460 (tuple2!8669 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212461))))

(assert (=> b!469153 (= lt!212461 (tuple2!8669 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212462 () Unit!13701)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!113 (ListLongMap!7571 (_ BitVec 64) V!18475 V!18475) Unit!13701)

(assert (=> b!469153 (= lt!212462 (addSameAsAddTwiceSameKeyDiffValues!113 lt!212460 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212464 () ListLongMap!7571)

(declare-fun getCurrentListMap!2166 (array!29811 array!29813 (_ BitVec 32) (_ BitVec 32) V!18475 V!18475 (_ BitVec 32) Int) ListLongMap!7571)

(assert (=> b!469153 (= lt!212464 (getCurrentListMap!2166 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212465 () ListLongMap!7571)

(assert (=> b!469153 (= lt!212465 (getCurrentListMap!2166 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469154 () Bool)

(declare-fun e!274691 () Bool)

(assert (=> b!469154 (= e!274691 tp_is_empty!13027)))

(declare-fun b!469155 () Bool)

(assert (=> b!469155 (= e!274693 tp_is_empty!13027)))

(declare-fun mapIsEmpty!21238 () Bool)

(assert (=> mapIsEmpty!21238 mapRes!21238))

(declare-fun b!469156 () Bool)

(declare-fun res!280384 () Bool)

(assert (=> b!469156 (=> (not res!280384) (not e!274690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29811 (_ BitVec 32)) Bool)

(assert (=> b!469156 (= res!280384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21238 () Bool)

(declare-fun tp!40815 () Bool)

(assert (=> mapNonEmpty!21238 (= mapRes!21238 (and tp!40815 e!274691))))

(declare-fun mapValue!21238 () ValueCell!6170)

(declare-fun mapKey!21238 () (_ BitVec 32))

(declare-fun mapRest!21238 () (Array (_ BitVec 32) ValueCell!6170))

(assert (=> mapNonEmpty!21238 (= (arr!14331 _values!833) (store mapRest!21238 mapKey!21238 mapValue!21238))))

(declare-fun b!469157 () Bool)

(declare-fun res!280383 () Bool)

(assert (=> b!469157 (=> (not res!280383) (not e!274690))))

(assert (=> b!469157 (= res!280383 (and (= (size!14684 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14683 _keys!1025) (size!14684 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42032 res!280387) b!469157))

(assert (= (and b!469157 res!280383) b!469156))

(assert (= (and b!469156 res!280384) b!469151))

(assert (= (and b!469151 res!280385) b!469150))

(assert (= (and b!469150 (not res!280386)) b!469153))

(assert (= (and b!469152 condMapEmpty!21238) mapIsEmpty!21238))

(assert (= (and b!469152 (not condMapEmpty!21238)) mapNonEmpty!21238))

(get-info :version)

(assert (= (and mapNonEmpty!21238 ((_ is ValueCellFull!6170) mapValue!21238)) b!469154))

(assert (= (and b!469152 ((_ is ValueCellFull!6170) mapDefault!21238)) b!469155))

(assert (= start!42032 b!469152))

(declare-fun m!450847 () Bool)

(assert (=> start!42032 m!450847))

(declare-fun m!450849 () Bool)

(assert (=> start!42032 m!450849))

(declare-fun m!450851 () Bool)

(assert (=> start!42032 m!450851))

(declare-fun m!450853 () Bool)

(assert (=> mapNonEmpty!21238 m!450853))

(declare-fun m!450855 () Bool)

(assert (=> b!469153 m!450855))

(declare-fun m!450857 () Bool)

(assert (=> b!469153 m!450857))

(declare-fun m!450859 () Bool)

(assert (=> b!469153 m!450859))

(assert (=> b!469153 m!450857))

(declare-fun m!450861 () Bool)

(assert (=> b!469153 m!450861))

(declare-fun m!450863 () Bool)

(assert (=> b!469153 m!450863))

(declare-fun m!450865 () Bool)

(assert (=> b!469153 m!450865))

(declare-fun m!450867 () Bool)

(assert (=> b!469151 m!450867))

(declare-fun m!450869 () Bool)

(assert (=> b!469150 m!450869))

(declare-fun m!450871 () Bool)

(assert (=> b!469150 m!450871))

(declare-fun m!450873 () Bool)

(assert (=> b!469150 m!450873))

(declare-fun m!450875 () Bool)

(assert (=> b!469156 m!450875))

(check-sat (not b!469156) (not b!469150) b_and!19983 (not b!469153) (not b_next!11599) (not mapNonEmpty!21238) (not start!42032) (not b!469151) tp_is_empty!13027)
(check-sat b_and!19983 (not b_next!11599))
