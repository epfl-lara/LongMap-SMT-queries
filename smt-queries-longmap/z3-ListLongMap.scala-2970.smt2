; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42078 () Bool)

(assert start!42078)

(declare-fun b_free!11631 () Bool)

(declare-fun b_next!11631 () Bool)

(assert (=> start!42078 (= b_free!11631 (not b_next!11631))))

(declare-fun tp!40912 () Bool)

(declare-fun b_and!20041 () Bool)

(assert (=> start!42078 (= tp!40912 b_and!20041)))

(declare-fun b!469805 () Bool)

(declare-fun res!280754 () Bool)

(declare-fun e!275157 () Bool)

(assert (=> b!469805 (=> (not res!280754) (not e!275157))))

(declare-datatypes ((array!29889 0))(
  ( (array!29890 (arr!14369 (Array (_ BitVec 32) (_ BitVec 64))) (size!14721 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29889)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29889 (_ BitVec 32)) Bool)

(assert (=> b!469805 (= res!280754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469806 () Bool)

(declare-fun res!280755 () Bool)

(assert (=> b!469806 (=> (not res!280755) (not e!275157))))

(declare-datatypes ((List!8733 0))(
  ( (Nil!8730) (Cons!8729 (h!9585 (_ BitVec 64)) (t!14693 List!8733)) )
))
(declare-fun arrayNoDuplicates!0 (array!29889 (_ BitVec 32) List!8733) Bool)

(assert (=> b!469806 (= res!280755 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8730))))

(declare-fun res!280752 () Bool)

(assert (=> start!42078 (=> (not res!280752) (not e!275157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42078 (= res!280752 (validMask!0 mask!1365))))

(assert (=> start!42078 e!275157))

(declare-fun tp_is_empty!13059 () Bool)

(assert (=> start!42078 tp_is_empty!13059))

(assert (=> start!42078 tp!40912))

(assert (=> start!42078 true))

(declare-fun array_inv!10368 (array!29889) Bool)

(assert (=> start!42078 (array_inv!10368 _keys!1025)))

(declare-datatypes ((V!18517 0))(
  ( (V!18518 (val!6574 Int)) )
))
(declare-datatypes ((ValueCell!6186 0))(
  ( (ValueCellFull!6186 (v!8864 V!18517)) (EmptyCell!6186) )
))
(declare-datatypes ((array!29891 0))(
  ( (array!29892 (arr!14370 (Array (_ BitVec 32) ValueCell!6186)) (size!14722 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29891)

(declare-fun e!275156 () Bool)

(declare-fun array_inv!10369 (array!29891) Bool)

(assert (=> start!42078 (and (array_inv!10369 _values!833) e!275156)))

(declare-fun mapIsEmpty!21286 () Bool)

(declare-fun mapRes!21286 () Bool)

(assert (=> mapIsEmpty!21286 mapRes!21286))

(declare-fun b!469807 () Bool)

(declare-fun e!275153 () Bool)

(assert (=> b!469807 (= e!275156 (and e!275153 mapRes!21286))))

(declare-fun condMapEmpty!21286 () Bool)

(declare-fun mapDefault!21286 () ValueCell!6186)

(assert (=> b!469807 (= condMapEmpty!21286 (= (arr!14370 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6186)) mapDefault!21286)))))

(declare-fun b!469808 () Bool)

(declare-fun e!275154 () Bool)

(assert (=> b!469808 (= e!275154 tp_is_empty!13059)))

(declare-fun mapNonEmpty!21286 () Bool)

(declare-fun tp!40911 () Bool)

(assert (=> mapNonEmpty!21286 (= mapRes!21286 (and tp!40911 e!275154))))

(declare-fun mapRest!21286 () (Array (_ BitVec 32) ValueCell!6186))

(declare-fun mapKey!21286 () (_ BitVec 32))

(declare-fun mapValue!21286 () ValueCell!6186)

(assert (=> mapNonEmpty!21286 (= (arr!14370 _values!833) (store mapRest!21286 mapKey!21286 mapValue!21286))))

(declare-fun b!469809 () Bool)

(declare-fun e!275155 () Bool)

(assert (=> b!469809 (= e!275155 true)))

(declare-datatypes ((tuple2!8654 0))(
  ( (tuple2!8655 (_1!4338 (_ BitVec 64)) (_2!4338 V!18517)) )
))
(declare-datatypes ((List!8734 0))(
  ( (Nil!8731) (Cons!8730 (h!9586 tuple2!8654) (t!14694 List!8734)) )
))
(declare-datatypes ((ListLongMap!7567 0))(
  ( (ListLongMap!7568 (toList!3799 List!8734)) )
))
(declare-fun lt!213029 () ListLongMap!7567)

(declare-fun lt!213030 () tuple2!8654)

(declare-fun minValueBefore!38 () V!18517)

(declare-fun +!1707 (ListLongMap!7567 tuple2!8654) ListLongMap!7567)

(assert (=> b!469809 (= (+!1707 lt!213029 lt!213030) (+!1707 (+!1707 lt!213029 (tuple2!8655 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213030))))

(declare-fun minValueAfter!38 () V!18517)

(assert (=> b!469809 (= lt!213030 (tuple2!8655 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13755 0))(
  ( (Unit!13756) )
))
(declare-fun lt!213031 () Unit!13755)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!120 (ListLongMap!7567 (_ BitVec 64) V!18517 V!18517) Unit!13755)

(assert (=> b!469809 (= lt!213031 (addSameAsAddTwiceSameKeyDiffValues!120 lt!213029 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18517)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!213033 () ListLongMap!7567)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2221 (array!29889 array!29891 (_ BitVec 32) (_ BitVec 32) V!18517 V!18517 (_ BitVec 32) Int) ListLongMap!7567)

(assert (=> b!469809 (= lt!213033 (getCurrentListMap!2221 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213032 () ListLongMap!7567)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469809 (= lt!213032 (getCurrentListMap!2221 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469810 () Bool)

(declare-fun res!280753 () Bool)

(assert (=> b!469810 (=> (not res!280753) (not e!275157))))

(assert (=> b!469810 (= res!280753 (and (= (size!14722 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14721 _keys!1025) (size!14722 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469811 () Bool)

(assert (=> b!469811 (= e!275157 (not e!275155))))

(declare-fun res!280756 () Bool)

(assert (=> b!469811 (=> res!280756 e!275155)))

(assert (=> b!469811 (= res!280756 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!213035 () ListLongMap!7567)

(assert (=> b!469811 (= lt!213029 lt!213035)))

(declare-fun lt!213034 () Unit!13755)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!145 (array!29889 array!29891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18517 V!18517 V!18517 V!18517 (_ BitVec 32) Int) Unit!13755)

(assert (=> b!469811 (= lt!213034 (lemmaNoChangeToArrayThenSameMapNoExtras!145 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1965 (array!29889 array!29891 (_ BitVec 32) (_ BitVec 32) V!18517 V!18517 (_ BitVec 32) Int) ListLongMap!7567)

(assert (=> b!469811 (= lt!213035 (getCurrentListMapNoExtraKeys!1965 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469811 (= lt!213029 (getCurrentListMapNoExtraKeys!1965 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469812 () Bool)

(assert (=> b!469812 (= e!275153 tp_is_empty!13059)))

(assert (= (and start!42078 res!280752) b!469810))

(assert (= (and b!469810 res!280753) b!469805))

(assert (= (and b!469805 res!280754) b!469806))

(assert (= (and b!469806 res!280755) b!469811))

(assert (= (and b!469811 (not res!280756)) b!469809))

(assert (= (and b!469807 condMapEmpty!21286) mapIsEmpty!21286))

(assert (= (and b!469807 (not condMapEmpty!21286)) mapNonEmpty!21286))

(get-info :version)

(assert (= (and mapNonEmpty!21286 ((_ is ValueCellFull!6186) mapValue!21286)) b!469808))

(assert (= (and b!469807 ((_ is ValueCellFull!6186) mapDefault!21286)) b!469812))

(assert (= start!42078 b!469807))

(declare-fun m!452061 () Bool)

(assert (=> mapNonEmpty!21286 m!452061))

(declare-fun m!452063 () Bool)

(assert (=> b!469809 m!452063))

(declare-fun m!452065 () Bool)

(assert (=> b!469809 m!452065))

(assert (=> b!469809 m!452063))

(declare-fun m!452067 () Bool)

(assert (=> b!469809 m!452067))

(declare-fun m!452069 () Bool)

(assert (=> b!469809 m!452069))

(declare-fun m!452071 () Bool)

(assert (=> b!469809 m!452071))

(declare-fun m!452073 () Bool)

(assert (=> b!469809 m!452073))

(declare-fun m!452075 () Bool)

(assert (=> start!42078 m!452075))

(declare-fun m!452077 () Bool)

(assert (=> start!42078 m!452077))

(declare-fun m!452079 () Bool)

(assert (=> start!42078 m!452079))

(declare-fun m!452081 () Bool)

(assert (=> b!469811 m!452081))

(declare-fun m!452083 () Bool)

(assert (=> b!469811 m!452083))

(declare-fun m!452085 () Bool)

(assert (=> b!469811 m!452085))

(declare-fun m!452087 () Bool)

(assert (=> b!469806 m!452087))

(declare-fun m!452089 () Bool)

(assert (=> b!469805 m!452089))

(check-sat (not start!42078) (not b!469806) (not b!469809) tp_is_empty!13059 (not b!469805) (not mapNonEmpty!21286) b_and!20041 (not b!469811) (not b_next!11631))
(check-sat b_and!20041 (not b_next!11631))
