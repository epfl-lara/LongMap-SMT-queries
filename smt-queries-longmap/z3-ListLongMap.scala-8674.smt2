; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105644 () Bool)

(assert start!105644)

(declare-fun b_free!27079 () Bool)

(declare-fun b_next!27079 () Bool)

(assert (=> start!105644 (= b_free!27079 (not b_next!27079))))

(declare-fun tp!94751 () Bool)

(declare-fun b_and!44927 () Bool)

(assert (=> start!105644 (= tp!94751 b_and!44927)))

(declare-fun mapIsEmpty!49756 () Bool)

(declare-fun mapRes!49756 () Bool)

(assert (=> mapIsEmpty!49756 mapRes!49756))

(declare-fun b!1257288 () Bool)

(declare-fun res!837836 () Bool)

(declare-fun e!714777 () Bool)

(assert (=> b!1257288 (=> (not res!837836) (not e!714777))))

(declare-datatypes ((array!81651 0))(
  ( (array!81652 (arr!39380 (Array (_ BitVec 32) (_ BitVec 64))) (size!39917 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81651)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81651 (_ BitVec 32)) Bool)

(assert (=> b!1257288 (= res!837836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257289 () Bool)

(declare-fun e!714773 () Bool)

(declare-fun e!714772 () Bool)

(assert (=> b!1257289 (= e!714773 (and e!714772 mapRes!49756))))

(declare-fun condMapEmpty!49756 () Bool)

(declare-datatypes ((V!48007 0))(
  ( (V!48008 (val!16053 Int)) )
))
(declare-datatypes ((ValueCell!15227 0))(
  ( (ValueCellFull!15227 (v!18749 V!48007)) (EmptyCell!15227) )
))
(declare-datatypes ((array!81653 0))(
  ( (array!81654 (arr!39381 (Array (_ BitVec 32) ValueCell!15227)) (size!39918 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81653)

(declare-fun mapDefault!49756 () ValueCell!15227)

(assert (=> b!1257289 (= condMapEmpty!49756 (= (arr!39381 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15227)) mapDefault!49756)))))

(declare-fun res!837832 () Bool)

(assert (=> start!105644 (=> (not res!837832) (not e!714777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105644 (= res!837832 (validMask!0 mask!1466))))

(assert (=> start!105644 e!714777))

(assert (=> start!105644 true))

(assert (=> start!105644 tp!94751))

(declare-fun tp_is_empty!31981 () Bool)

(assert (=> start!105644 tp_is_empty!31981))

(declare-fun array_inv!30135 (array!81651) Bool)

(assert (=> start!105644 (array_inv!30135 _keys!1118)))

(declare-fun array_inv!30136 (array!81653) Bool)

(assert (=> start!105644 (and (array_inv!30136 _values!914) e!714773)))

(declare-fun b!1257290 () Bool)

(declare-fun e!714774 () Bool)

(assert (=> b!1257290 (= e!714774 true)))

(declare-datatypes ((tuple2!20752 0))(
  ( (tuple2!20753 (_1!10387 (_ BitVec 64)) (_2!10387 V!48007)) )
))
(declare-datatypes ((List!27984 0))(
  ( (Nil!27981) (Cons!27980 (h!29198 tuple2!20752) (t!41463 List!27984)) )
))
(declare-datatypes ((ListLongMap!18633 0))(
  ( (ListLongMap!18634 (toList!9332 List!27984)) )
))
(declare-fun lt!568350 () ListLongMap!18633)

(declare-fun -!2048 (ListLongMap!18633 (_ BitVec 64)) ListLongMap!18633)

(assert (=> b!1257290 (= (-!2048 lt!568350 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568350)))

(declare-datatypes ((Unit!41805 0))(
  ( (Unit!41806) )
))
(declare-fun lt!568349 () Unit!41805)

(declare-fun removeNotPresentStillSame!120 (ListLongMap!18633 (_ BitVec 64)) Unit!41805)

(assert (=> b!1257290 (= lt!568349 (removeNotPresentStillSame!120 lt!568350 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257291 () Bool)

(declare-fun e!714771 () Bool)

(assert (=> b!1257291 (= e!714771 tp_is_empty!31981)))

(declare-fun mapNonEmpty!49756 () Bool)

(declare-fun tp!94750 () Bool)

(assert (=> mapNonEmpty!49756 (= mapRes!49756 (and tp!94750 e!714771))))

(declare-fun mapKey!49756 () (_ BitVec 32))

(declare-fun mapRest!49756 () (Array (_ BitVec 32) ValueCell!15227))

(declare-fun mapValue!49756 () ValueCell!15227)

(assert (=> mapNonEmpty!49756 (= (arr!39381 _values!914) (store mapRest!49756 mapKey!49756 mapValue!49756))))

(declare-fun b!1257292 () Bool)

(assert (=> b!1257292 (= e!714772 tp_is_empty!31981)))

(declare-fun b!1257293 () Bool)

(declare-fun e!714776 () Bool)

(assert (=> b!1257293 (= e!714776 e!714774)))

(declare-fun res!837837 () Bool)

(assert (=> b!1257293 (=> res!837837 e!714774)))

(declare-fun contains!7564 (ListLongMap!18633 (_ BitVec 64)) Bool)

(assert (=> b!1257293 (= res!837837 (contains!7564 lt!568350 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48007)

(declare-fun minValueBefore!43 () V!48007)

(declare-fun getCurrentListMap!4542 (array!81651 array!81653 (_ BitVec 32) (_ BitVec 32) V!48007 V!48007 (_ BitVec 32) Int) ListLongMap!18633)

(assert (=> b!1257293 (= lt!568350 (getCurrentListMap!4542 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257294 () Bool)

(declare-fun res!837833 () Bool)

(assert (=> b!1257294 (=> (not res!837833) (not e!714777))))

(declare-datatypes ((List!27985 0))(
  ( (Nil!27982) (Cons!27981 (h!29199 (_ BitVec 64)) (t!41464 List!27985)) )
))
(declare-fun arrayNoDuplicates!0 (array!81651 (_ BitVec 32) List!27985) Bool)

(assert (=> b!1257294 (= res!837833 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27982))))

(declare-fun b!1257295 () Bool)

(assert (=> b!1257295 (= e!714777 (not e!714776))))

(declare-fun res!837834 () Bool)

(assert (=> b!1257295 (=> res!837834 e!714776)))

(assert (=> b!1257295 (= res!837834 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568352 () ListLongMap!18633)

(declare-fun lt!568348 () ListLongMap!18633)

(assert (=> b!1257295 (= lt!568352 lt!568348)))

(declare-fun minValueAfter!43 () V!48007)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!568351 () Unit!41805)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1067 (array!81651 array!81653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48007 V!48007 V!48007 V!48007 (_ BitVec 32) Int) Unit!41805)

(assert (=> b!1257295 (= lt!568351 (lemmaNoChangeToArrayThenSameMapNoExtras!1067 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5753 (array!81651 array!81653 (_ BitVec 32) (_ BitVec 32) V!48007 V!48007 (_ BitVec 32) Int) ListLongMap!18633)

(assert (=> b!1257295 (= lt!568348 (getCurrentListMapNoExtraKeys!5753 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257295 (= lt!568352 (getCurrentListMapNoExtraKeys!5753 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257296 () Bool)

(declare-fun res!837835 () Bool)

(assert (=> b!1257296 (=> (not res!837835) (not e!714777))))

(assert (=> b!1257296 (= res!837835 (and (= (size!39918 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39917 _keys!1118) (size!39918 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105644 res!837832) b!1257296))

(assert (= (and b!1257296 res!837835) b!1257288))

(assert (= (and b!1257288 res!837836) b!1257294))

(assert (= (and b!1257294 res!837833) b!1257295))

(assert (= (and b!1257295 (not res!837834)) b!1257293))

(assert (= (and b!1257293 (not res!837837)) b!1257290))

(assert (= (and b!1257289 condMapEmpty!49756) mapIsEmpty!49756))

(assert (= (and b!1257289 (not condMapEmpty!49756)) mapNonEmpty!49756))

(get-info :version)

(assert (= (and mapNonEmpty!49756 ((_ is ValueCellFull!15227) mapValue!49756)) b!1257291))

(assert (= (and b!1257289 ((_ is ValueCellFull!15227) mapDefault!49756)) b!1257292))

(assert (= start!105644 b!1257289))

(declare-fun m!1158285 () Bool)

(assert (=> b!1257288 m!1158285))

(declare-fun m!1158287 () Bool)

(assert (=> b!1257293 m!1158287))

(declare-fun m!1158289 () Bool)

(assert (=> b!1257293 m!1158289))

(declare-fun m!1158291 () Bool)

(assert (=> start!105644 m!1158291))

(declare-fun m!1158293 () Bool)

(assert (=> start!105644 m!1158293))

(declare-fun m!1158295 () Bool)

(assert (=> start!105644 m!1158295))

(declare-fun m!1158297 () Bool)

(assert (=> b!1257290 m!1158297))

(declare-fun m!1158299 () Bool)

(assert (=> b!1257290 m!1158299))

(declare-fun m!1158301 () Bool)

(assert (=> b!1257295 m!1158301))

(declare-fun m!1158303 () Bool)

(assert (=> b!1257295 m!1158303))

(declare-fun m!1158305 () Bool)

(assert (=> b!1257295 m!1158305))

(declare-fun m!1158307 () Bool)

(assert (=> mapNonEmpty!49756 m!1158307))

(declare-fun m!1158309 () Bool)

(assert (=> b!1257294 m!1158309))

(check-sat tp_is_empty!31981 (not b!1257294) (not b_next!27079) (not start!105644) (not b!1257290) (not b!1257295) b_and!44927 (not b!1257293) (not mapNonEmpty!49756) (not b!1257288))
(check-sat b_and!44927 (not b_next!27079))
