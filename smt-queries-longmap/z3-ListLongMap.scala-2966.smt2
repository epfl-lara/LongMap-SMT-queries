; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42038 () Bool)

(assert start!42038)

(declare-fun b_free!11605 () Bool)

(declare-fun b_next!11605 () Bool)

(assert (=> start!42038 (= b_free!11605 (not b_next!11605))))

(declare-fun tp!40834 () Bool)

(declare-fun b_and!20025 () Bool)

(assert (=> start!42038 (= tp!40834 b_and!20025)))

(declare-fun b!469432 () Bool)

(declare-fun res!280551 () Bool)

(declare-fun e!274884 () Bool)

(assert (=> b!469432 (=> (not res!280551) (not e!274884))))

(declare-datatypes ((array!29826 0))(
  ( (array!29827 (arr!14337 (Array (_ BitVec 32) (_ BitVec 64))) (size!14689 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29826)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29826 (_ BitVec 32)) Bool)

(assert (=> b!469432 (= res!280551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469433 () Bool)

(declare-fun e!274883 () Bool)

(assert (=> b!469433 (= e!274884 (not e!274883))))

(declare-fun res!280553 () Bool)

(assert (=> b!469433 (=> res!280553 e!274883)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469433 (= res!280553 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18483 0))(
  ( (V!18484 (val!6561 Int)) )
))
(declare-datatypes ((tuple2!8556 0))(
  ( (tuple2!8557 (_1!4289 (_ BitVec 64)) (_2!4289 V!18483)) )
))
(declare-datatypes ((List!8631 0))(
  ( (Nil!8628) (Cons!8627 (h!9483 tuple2!8556) (t!14583 List!8631)) )
))
(declare-datatypes ((ListLongMap!7471 0))(
  ( (ListLongMap!7472 (toList!3751 List!8631)) )
))
(declare-fun lt!212770 () ListLongMap!7471)

(declare-fun lt!212768 () ListLongMap!7471)

(assert (=> b!469433 (= lt!212770 lt!212768)))

(declare-fun minValueBefore!38 () V!18483)

(declare-fun zeroValue!794 () V!18483)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13713 0))(
  ( (Unit!13714) )
))
(declare-fun lt!212769 () Unit!13713)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6173 0))(
  ( (ValueCellFull!6173 (v!8852 V!18483)) (EmptyCell!6173) )
))
(declare-datatypes ((array!29828 0))(
  ( (array!29829 (arr!14338 (Array (_ BitVec 32) ValueCell!6173)) (size!14690 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29828)

(declare-fun minValueAfter!38 () V!18483)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!129 (array!29826 array!29828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18483 V!18483 V!18483 V!18483 (_ BitVec 32) Int) Unit!13713)

(assert (=> b!469433 (= lt!212769 (lemmaNoChangeToArrayThenSameMapNoExtras!129 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1969 (array!29826 array!29828 (_ BitVec 32) (_ BitVec 32) V!18483 V!18483 (_ BitVec 32) Int) ListLongMap!7471)

(assert (=> b!469433 (= lt!212768 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469433 (= lt!212770 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469434 () Bool)

(assert (=> b!469434 (= e!274883 true)))

(declare-fun lt!212771 () tuple2!8556)

(declare-fun +!1710 (ListLongMap!7471 tuple2!8556) ListLongMap!7471)

(assert (=> b!469434 (= (+!1710 lt!212770 lt!212771) (+!1710 (+!1710 lt!212770 (tuple2!8557 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212771))))

(assert (=> b!469434 (= lt!212771 (tuple2!8557 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212774 () Unit!13713)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!116 (ListLongMap!7471 (_ BitVec 64) V!18483 V!18483) Unit!13713)

(assert (=> b!469434 (= lt!212774 (addSameAsAddTwiceSameKeyDiffValues!116 lt!212770 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212773 () ListLongMap!7471)

(declare-fun getCurrentListMap!2176 (array!29826 array!29828 (_ BitVec 32) (_ BitVec 32) V!18483 V!18483 (_ BitVec 32) Int) ListLongMap!7471)

(assert (=> b!469434 (= lt!212773 (getCurrentListMap!2176 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212772 () ListLongMap!7471)

(assert (=> b!469434 (= lt!212772 (getCurrentListMap!2176 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21247 () Bool)

(declare-fun mapRes!21247 () Bool)

(declare-fun tp!40833 () Bool)

(declare-fun e!274882 () Bool)

(assert (=> mapNonEmpty!21247 (= mapRes!21247 (and tp!40833 e!274882))))

(declare-fun mapRest!21247 () (Array (_ BitVec 32) ValueCell!6173))

(declare-fun mapKey!21247 () (_ BitVec 32))

(declare-fun mapValue!21247 () ValueCell!6173)

(assert (=> mapNonEmpty!21247 (= (arr!14338 _values!833) (store mapRest!21247 mapKey!21247 mapValue!21247))))

(declare-fun b!469435 () Bool)

(declare-fun tp_is_empty!13033 () Bool)

(assert (=> b!469435 (= e!274882 tp_is_empty!13033)))

(declare-fun b!469436 () Bool)

(declare-fun res!280554 () Bool)

(assert (=> b!469436 (=> (not res!280554) (not e!274884))))

(declare-datatypes ((List!8632 0))(
  ( (Nil!8629) (Cons!8628 (h!9484 (_ BitVec 64)) (t!14584 List!8632)) )
))
(declare-fun arrayNoDuplicates!0 (array!29826 (_ BitVec 32) List!8632) Bool)

(assert (=> b!469436 (= res!280554 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8629))))

(declare-fun b!469437 () Bool)

(declare-fun res!280550 () Bool)

(assert (=> b!469437 (=> (not res!280550) (not e!274884))))

(assert (=> b!469437 (= res!280550 (and (= (size!14690 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14689 _keys!1025) (size!14690 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469438 () Bool)

(declare-fun e!274880 () Bool)

(assert (=> b!469438 (= e!274880 tp_is_empty!13033)))

(declare-fun b!469439 () Bool)

(declare-fun e!274879 () Bool)

(assert (=> b!469439 (= e!274879 (and e!274880 mapRes!21247))))

(declare-fun condMapEmpty!21247 () Bool)

(declare-fun mapDefault!21247 () ValueCell!6173)

(assert (=> b!469439 (= condMapEmpty!21247 (= (arr!14338 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6173)) mapDefault!21247)))))

(declare-fun res!280552 () Bool)

(assert (=> start!42038 (=> (not res!280552) (not e!274884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42038 (= res!280552 (validMask!0 mask!1365))))

(assert (=> start!42038 e!274884))

(assert (=> start!42038 tp_is_empty!13033))

(assert (=> start!42038 tp!40834))

(assert (=> start!42038 true))

(declare-fun array_inv!10440 (array!29826) Bool)

(assert (=> start!42038 (array_inv!10440 _keys!1025)))

(declare-fun array_inv!10441 (array!29828) Bool)

(assert (=> start!42038 (and (array_inv!10441 _values!833) e!274879)))

(declare-fun mapIsEmpty!21247 () Bool)

(assert (=> mapIsEmpty!21247 mapRes!21247))

(assert (= (and start!42038 res!280552) b!469437))

(assert (= (and b!469437 res!280550) b!469432))

(assert (= (and b!469432 res!280551) b!469436))

(assert (= (and b!469436 res!280554) b!469433))

(assert (= (and b!469433 (not res!280553)) b!469434))

(assert (= (and b!469439 condMapEmpty!21247) mapIsEmpty!21247))

(assert (= (and b!469439 (not condMapEmpty!21247)) mapNonEmpty!21247))

(get-info :version)

(assert (= (and mapNonEmpty!21247 ((_ is ValueCellFull!6173) mapValue!21247)) b!469435))

(assert (= (and b!469439 ((_ is ValueCellFull!6173) mapDefault!21247)) b!469438))

(assert (= start!42038 b!469439))

(declare-fun m!451853 () Bool)

(assert (=> mapNonEmpty!21247 m!451853))

(declare-fun m!451855 () Bool)

(assert (=> start!42038 m!451855))

(declare-fun m!451857 () Bool)

(assert (=> start!42038 m!451857))

(declare-fun m!451859 () Bool)

(assert (=> start!42038 m!451859))

(declare-fun m!451861 () Bool)

(assert (=> b!469432 m!451861))

(declare-fun m!451863 () Bool)

(assert (=> b!469436 m!451863))

(declare-fun m!451865 () Bool)

(assert (=> b!469434 m!451865))

(declare-fun m!451867 () Bool)

(assert (=> b!469434 m!451867))

(assert (=> b!469434 m!451865))

(declare-fun m!451869 () Bool)

(assert (=> b!469434 m!451869))

(declare-fun m!451871 () Bool)

(assert (=> b!469434 m!451871))

(declare-fun m!451873 () Bool)

(assert (=> b!469434 m!451873))

(declare-fun m!451875 () Bool)

(assert (=> b!469434 m!451875))

(declare-fun m!451877 () Bool)

(assert (=> b!469433 m!451877))

(declare-fun m!451879 () Bool)

(assert (=> b!469433 m!451879))

(declare-fun m!451881 () Bool)

(assert (=> b!469433 m!451881))

(check-sat (not mapNonEmpty!21247) (not b!469433) (not b!469432) tp_is_empty!13033 (not b!469436) (not b!469434) b_and!20025 (not b_next!11605) (not start!42038))
(check-sat b_and!20025 (not b_next!11605))
