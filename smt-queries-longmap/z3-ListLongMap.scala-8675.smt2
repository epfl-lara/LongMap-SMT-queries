; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105650 () Bool)

(assert start!105650)

(declare-fun b_free!27085 () Bool)

(declare-fun b_next!27085 () Bool)

(assert (=> start!105650 (= b_free!27085 (not b_next!27085))))

(declare-fun tp!94768 () Bool)

(declare-fun b_and!44933 () Bool)

(assert (=> start!105650 (= tp!94768 b_and!44933)))

(declare-fun b!1257369 () Bool)

(declare-fun e!714834 () Bool)

(declare-fun tp_is_empty!31987 () Bool)

(assert (=> b!1257369 (= e!714834 tp_is_empty!31987)))

(declare-fun b!1257370 () Bool)

(declare-fun res!837891 () Bool)

(declare-fun e!714835 () Bool)

(assert (=> b!1257370 (=> (not res!837891) (not e!714835))))

(declare-datatypes ((array!81663 0))(
  ( (array!81664 (arr!39386 (Array (_ BitVec 32) (_ BitVec 64))) (size!39923 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81663)

(declare-datatypes ((List!27990 0))(
  ( (Nil!27987) (Cons!27986 (h!29204 (_ BitVec 64)) (t!41469 List!27990)) )
))
(declare-fun arrayNoDuplicates!0 (array!81663 (_ BitVec 32) List!27990) Bool)

(assert (=> b!1257370 (= res!837891 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27987))))

(declare-fun b!1257371 () Bool)

(declare-fun e!714838 () Bool)

(assert (=> b!1257371 (= e!714838 tp_is_empty!31987)))

(declare-fun b!1257372 () Bool)

(declare-fun e!714839 () Bool)

(declare-fun mapRes!49765 () Bool)

(assert (=> b!1257372 (= e!714839 (and e!714834 mapRes!49765))))

(declare-fun condMapEmpty!49765 () Bool)

(declare-datatypes ((V!48015 0))(
  ( (V!48016 (val!16056 Int)) )
))
(declare-datatypes ((ValueCell!15230 0))(
  ( (ValueCellFull!15230 (v!18752 V!48015)) (EmptyCell!15230) )
))
(declare-datatypes ((array!81665 0))(
  ( (array!81666 (arr!39387 (Array (_ BitVec 32) ValueCell!15230)) (size!39924 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81665)

(declare-fun mapDefault!49765 () ValueCell!15230)

(assert (=> b!1257372 (= condMapEmpty!49765 (= (arr!39387 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15230)) mapDefault!49765)))))

(declare-fun b!1257373 () Bool)

(declare-fun e!714837 () Bool)

(declare-fun e!714840 () Bool)

(assert (=> b!1257373 (= e!714837 e!714840)))

(declare-fun res!837889 () Bool)

(assert (=> b!1257373 (=> res!837889 e!714840)))

(declare-datatypes ((tuple2!20758 0))(
  ( (tuple2!20759 (_1!10390 (_ BitVec 64)) (_2!10390 V!48015)) )
))
(declare-datatypes ((List!27991 0))(
  ( (Nil!27988) (Cons!27987 (h!29205 tuple2!20758) (t!41470 List!27991)) )
))
(declare-datatypes ((ListLongMap!18639 0))(
  ( (ListLongMap!18640 (toList!9335 List!27991)) )
))
(declare-fun lt!568393 () ListLongMap!18639)

(declare-fun contains!7567 (ListLongMap!18639 (_ BitVec 64)) Bool)

(assert (=> b!1257373 (= res!837889 (contains!7567 lt!568393 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48015)

(declare-fun minValueBefore!43 () V!48015)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMap!4545 (array!81663 array!81665 (_ BitVec 32) (_ BitVec 32) V!48015 V!48015 (_ BitVec 32) Int) ListLongMap!18639)

(assert (=> b!1257373 (= lt!568393 (getCurrentListMap!4545 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!837887 () Bool)

(assert (=> start!105650 (=> (not res!837887) (not e!714835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105650 (= res!837887 (validMask!0 mask!1466))))

(assert (=> start!105650 e!714835))

(assert (=> start!105650 true))

(assert (=> start!105650 tp!94768))

(assert (=> start!105650 tp_is_empty!31987))

(declare-fun array_inv!30141 (array!81663) Bool)

(assert (=> start!105650 (array_inv!30141 _keys!1118)))

(declare-fun array_inv!30142 (array!81665) Bool)

(assert (=> start!105650 (and (array_inv!30142 _values!914) e!714839)))

(declare-fun b!1257374 () Bool)

(declare-fun res!837890 () Bool)

(assert (=> b!1257374 (=> (not res!837890) (not e!714835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81663 (_ BitVec 32)) Bool)

(assert (=> b!1257374 (= res!837890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257375 () Bool)

(declare-fun res!837886 () Bool)

(assert (=> b!1257375 (=> (not res!837886) (not e!714835))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257375 (= res!837886 (and (= (size!39924 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39923 _keys!1118) (size!39924 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49765 () Bool)

(assert (=> mapIsEmpty!49765 mapRes!49765))

(declare-fun b!1257376 () Bool)

(assert (=> b!1257376 (= e!714835 (not e!714837))))

(declare-fun res!837888 () Bool)

(assert (=> b!1257376 (=> res!837888 e!714837)))

(assert (=> b!1257376 (= res!837888 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568397 () ListLongMap!18639)

(declare-fun lt!568395 () ListLongMap!18639)

(assert (=> b!1257376 (= lt!568397 lt!568395)))

(declare-fun minValueAfter!43 () V!48015)

(declare-datatypes ((Unit!41811 0))(
  ( (Unit!41812) )
))
(declare-fun lt!568396 () Unit!41811)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1070 (array!81663 array!81665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48015 V!48015 V!48015 V!48015 (_ BitVec 32) Int) Unit!41811)

(assert (=> b!1257376 (= lt!568396 (lemmaNoChangeToArrayThenSameMapNoExtras!1070 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5756 (array!81663 array!81665 (_ BitVec 32) (_ BitVec 32) V!48015 V!48015 (_ BitVec 32) Int) ListLongMap!18639)

(assert (=> b!1257376 (= lt!568395 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257376 (= lt!568397 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257377 () Bool)

(assert (=> b!1257377 (= e!714840 true)))

(declare-fun -!2051 (ListLongMap!18639 (_ BitVec 64)) ListLongMap!18639)

(assert (=> b!1257377 (= (-!2051 lt!568393 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568393)))

(declare-fun lt!568394 () Unit!41811)

(declare-fun removeNotPresentStillSame!123 (ListLongMap!18639 (_ BitVec 64)) Unit!41811)

(assert (=> b!1257377 (= lt!568394 (removeNotPresentStillSame!123 lt!568393 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!49765 () Bool)

(declare-fun tp!94769 () Bool)

(assert (=> mapNonEmpty!49765 (= mapRes!49765 (and tp!94769 e!714838))))

(declare-fun mapRest!49765 () (Array (_ BitVec 32) ValueCell!15230))

(declare-fun mapKey!49765 () (_ BitVec 32))

(declare-fun mapValue!49765 () ValueCell!15230)

(assert (=> mapNonEmpty!49765 (= (arr!39387 _values!914) (store mapRest!49765 mapKey!49765 mapValue!49765))))

(assert (= (and start!105650 res!837887) b!1257375))

(assert (= (and b!1257375 res!837886) b!1257374))

(assert (= (and b!1257374 res!837890) b!1257370))

(assert (= (and b!1257370 res!837891) b!1257376))

(assert (= (and b!1257376 (not res!837888)) b!1257373))

(assert (= (and b!1257373 (not res!837889)) b!1257377))

(assert (= (and b!1257372 condMapEmpty!49765) mapIsEmpty!49765))

(assert (= (and b!1257372 (not condMapEmpty!49765)) mapNonEmpty!49765))

(get-info :version)

(assert (= (and mapNonEmpty!49765 ((_ is ValueCellFull!15230) mapValue!49765)) b!1257371))

(assert (= (and b!1257372 ((_ is ValueCellFull!15230) mapDefault!49765)) b!1257369))

(assert (= start!105650 b!1257372))

(declare-fun m!1158363 () Bool)

(assert (=> b!1257376 m!1158363))

(declare-fun m!1158365 () Bool)

(assert (=> b!1257376 m!1158365))

(declare-fun m!1158367 () Bool)

(assert (=> b!1257376 m!1158367))

(declare-fun m!1158369 () Bool)

(assert (=> mapNonEmpty!49765 m!1158369))

(declare-fun m!1158371 () Bool)

(assert (=> b!1257373 m!1158371))

(declare-fun m!1158373 () Bool)

(assert (=> b!1257373 m!1158373))

(declare-fun m!1158375 () Bool)

(assert (=> start!105650 m!1158375))

(declare-fun m!1158377 () Bool)

(assert (=> start!105650 m!1158377))

(declare-fun m!1158379 () Bool)

(assert (=> start!105650 m!1158379))

(declare-fun m!1158381 () Bool)

(assert (=> b!1257370 m!1158381))

(declare-fun m!1158383 () Bool)

(assert (=> b!1257374 m!1158383))

(declare-fun m!1158385 () Bool)

(assert (=> b!1257377 m!1158385))

(declare-fun m!1158387 () Bool)

(assert (=> b!1257377 m!1158387))

(check-sat (not b!1257373) (not mapNonEmpty!49765) (not b!1257374) tp_is_empty!31987 b_and!44933 (not b_next!27085) (not b!1257370) (not b!1257376) (not b!1257377) (not start!105650))
(check-sat b_and!44933 (not b_next!27085))
