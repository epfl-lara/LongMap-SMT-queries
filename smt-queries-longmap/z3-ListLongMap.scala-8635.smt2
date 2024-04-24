; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105336 () Bool)

(assert start!105336)

(declare-fun b_free!26845 () Bool)

(declare-fun b_next!26845 () Bool)

(assert (=> start!105336 (= b_free!26845 (not b_next!26845))))

(declare-fun tp!94037 () Bool)

(declare-fun b_and!44651 () Bool)

(assert (=> start!105336 (= tp!94037 b_and!44651)))

(declare-fun b!1253913 () Bool)

(declare-fun e!712312 () Bool)

(assert (=> b!1253913 (= e!712312 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47695 0))(
  ( (V!47696 (val!15936 Int)) )
))
(declare-fun zeroValue!871 () V!47695)

(declare-datatypes ((array!81203 0))(
  ( (array!81204 (arr!39160 (Array (_ BitVec 32) (_ BitVec 64))) (size!39697 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81203)

(declare-datatypes ((ValueCell!15110 0))(
  ( (ValueCellFull!15110 (v!18630 V!47695)) (EmptyCell!15110) )
))
(declare-datatypes ((array!81205 0))(
  ( (array!81206 (arr!39161 (Array (_ BitVec 32) ValueCell!15110)) (size!39698 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81205)

(declare-datatypes ((tuple2!20580 0))(
  ( (tuple2!20581 (_1!10301 (_ BitVec 64)) (_2!10301 V!47695)) )
))
(declare-datatypes ((List!27823 0))(
  ( (Nil!27820) (Cons!27819 (h!29037 tuple2!20580) (t!41294 List!27823)) )
))
(declare-datatypes ((ListLongMap!18461 0))(
  ( (ListLongMap!18462 (toList!9246 List!27823)) )
))
(declare-fun lt!565902 () ListLongMap!18461)

(declare-fun minValueBefore!43 () V!47695)

(declare-fun getCurrentListMap!4485 (array!81203 array!81205 (_ BitVec 32) (_ BitVec 32) V!47695 V!47695 (_ BitVec 32) Int) ListLongMap!18461)

(assert (=> b!1253913 (= lt!565902 (getCurrentListMap!4485 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253914 () Bool)

(declare-fun e!712315 () Bool)

(declare-fun tp_is_empty!31747 () Bool)

(assert (=> b!1253914 (= e!712315 tp_is_empty!31747)))

(declare-fun mapIsEmpty!49393 () Bool)

(declare-fun mapRes!49393 () Bool)

(assert (=> mapIsEmpty!49393 mapRes!49393))

(declare-fun b!1253915 () Bool)

(declare-fun res!835862 () Bool)

(declare-fun e!712316 () Bool)

(assert (=> b!1253915 (=> (not res!835862) (not e!712316))))

(declare-datatypes ((List!27824 0))(
  ( (Nil!27821) (Cons!27820 (h!29038 (_ BitVec 64)) (t!41295 List!27824)) )
))
(declare-fun arrayNoDuplicates!0 (array!81203 (_ BitVec 32) List!27824) Bool)

(assert (=> b!1253915 (= res!835862 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27821))))

(declare-fun mapNonEmpty!49393 () Bool)

(declare-fun tp!94036 () Bool)

(declare-fun e!712313 () Bool)

(assert (=> mapNonEmpty!49393 (= mapRes!49393 (and tp!94036 e!712313))))

(declare-fun mapKey!49393 () (_ BitVec 32))

(declare-fun mapRest!49393 () (Array (_ BitVec 32) ValueCell!15110))

(declare-fun mapValue!49393 () ValueCell!15110)

(assert (=> mapNonEmpty!49393 (= (arr!39161 _values!914) (store mapRest!49393 mapKey!49393 mapValue!49393))))

(declare-fun b!1253916 () Bool)

(assert (=> b!1253916 (= e!712313 tp_is_empty!31747)))

(declare-fun res!835858 () Bool)

(assert (=> start!105336 (=> (not res!835858) (not e!712316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105336 (= res!835858 (validMask!0 mask!1466))))

(assert (=> start!105336 e!712316))

(assert (=> start!105336 true))

(assert (=> start!105336 tp!94037))

(assert (=> start!105336 tp_is_empty!31747))

(declare-fun array_inv!29975 (array!81203) Bool)

(assert (=> start!105336 (array_inv!29975 _keys!1118)))

(declare-fun e!712314 () Bool)

(declare-fun array_inv!29976 (array!81205) Bool)

(assert (=> start!105336 (and (array_inv!29976 _values!914) e!712314)))

(declare-fun b!1253917 () Bool)

(declare-fun res!835861 () Bool)

(assert (=> b!1253917 (=> (not res!835861) (not e!712316))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253917 (= res!835861 (and (= (size!39698 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39697 _keys!1118) (size!39698 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253918 () Bool)

(assert (=> b!1253918 (= e!712314 (and e!712315 mapRes!49393))))

(declare-fun condMapEmpty!49393 () Bool)

(declare-fun mapDefault!49393 () ValueCell!15110)

(assert (=> b!1253918 (= condMapEmpty!49393 (= (arr!39161 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15110)) mapDefault!49393)))))

(declare-fun b!1253919 () Bool)

(assert (=> b!1253919 (= e!712316 (not e!712312))))

(declare-fun res!835860 () Bool)

(assert (=> b!1253919 (=> res!835860 e!712312)))

(assert (=> b!1253919 (= res!835860 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565899 () ListLongMap!18461)

(declare-fun lt!565900 () ListLongMap!18461)

(assert (=> b!1253919 (= lt!565899 lt!565900)))

(declare-datatypes ((Unit!41630 0))(
  ( (Unit!41631) )
))
(declare-fun lt!565901 () Unit!41630)

(declare-fun minValueAfter!43 () V!47695)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!987 (array!81203 array!81205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47695 V!47695 V!47695 V!47695 (_ BitVec 32) Int) Unit!41630)

(assert (=> b!1253919 (= lt!565901 (lemmaNoChangeToArrayThenSameMapNoExtras!987 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5673 (array!81203 array!81205 (_ BitVec 32) (_ BitVec 32) V!47695 V!47695 (_ BitVec 32) Int) ListLongMap!18461)

(assert (=> b!1253919 (= lt!565900 (getCurrentListMapNoExtraKeys!5673 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253919 (= lt!565899 (getCurrentListMapNoExtraKeys!5673 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253920 () Bool)

(declare-fun res!835859 () Bool)

(assert (=> b!1253920 (=> (not res!835859) (not e!712316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81203 (_ BitVec 32)) Bool)

(assert (=> b!1253920 (= res!835859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105336 res!835858) b!1253917))

(assert (= (and b!1253917 res!835861) b!1253920))

(assert (= (and b!1253920 res!835859) b!1253915))

(assert (= (and b!1253915 res!835862) b!1253919))

(assert (= (and b!1253919 (not res!835860)) b!1253913))

(assert (= (and b!1253918 condMapEmpty!49393) mapIsEmpty!49393))

(assert (= (and b!1253918 (not condMapEmpty!49393)) mapNonEmpty!49393))

(get-info :version)

(assert (= (and mapNonEmpty!49393 ((_ is ValueCellFull!15110) mapValue!49393)) b!1253916))

(assert (= (and b!1253918 ((_ is ValueCellFull!15110) mapDefault!49393)) b!1253914))

(assert (= start!105336 b!1253918))

(declare-fun m!1154817 () Bool)

(assert (=> b!1253920 m!1154817))

(declare-fun m!1154819 () Bool)

(assert (=> b!1253915 m!1154819))

(declare-fun m!1154821 () Bool)

(assert (=> start!105336 m!1154821))

(declare-fun m!1154823 () Bool)

(assert (=> start!105336 m!1154823))

(declare-fun m!1154825 () Bool)

(assert (=> start!105336 m!1154825))

(declare-fun m!1154827 () Bool)

(assert (=> b!1253913 m!1154827))

(declare-fun m!1154829 () Bool)

(assert (=> mapNonEmpty!49393 m!1154829))

(declare-fun m!1154831 () Bool)

(assert (=> b!1253919 m!1154831))

(declare-fun m!1154833 () Bool)

(assert (=> b!1253919 m!1154833))

(declare-fun m!1154835 () Bool)

(assert (=> b!1253919 m!1154835))

(check-sat tp_is_empty!31747 (not b!1253919) (not mapNonEmpty!49393) (not b!1253913) (not start!105336) (not b_next!26845) (not b!1253915) b_and!44651 (not b!1253920))
(check-sat b_and!44651 (not b_next!26845))
