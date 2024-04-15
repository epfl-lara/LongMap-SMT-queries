; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105718 () Bool)

(assert start!105718)

(declare-fun b_free!27307 () Bool)

(declare-fun b_next!27307 () Bool)

(assert (=> start!105718 (= b_free!27307 (not b_next!27307))))

(declare-fun tp!95446 () Bool)

(declare-fun b_and!45173 () Bool)

(assert (=> start!105718 (= tp!95446 b_and!45173)))

(declare-fun b!1259283 () Bool)

(declare-fun e!716380 () Bool)

(declare-fun tp_is_empty!32209 () Bool)

(assert (=> b!1259283 (= e!716380 tp_is_empty!32209)))

(declare-fun res!839296 () Bool)

(declare-fun e!716384 () Bool)

(assert (=> start!105718 (=> (not res!839296) (not e!716384))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105718 (= res!839296 (validMask!0 mask!1466))))

(assert (=> start!105718 e!716384))

(assert (=> start!105718 true))

(assert (=> start!105718 tp!95446))

(assert (=> start!105718 tp_is_empty!32209))

(declare-datatypes ((array!81963 0))(
  ( (array!81964 (arr!39537 (Array (_ BitVec 32) (_ BitVec 64))) (size!40075 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81963)

(declare-fun array_inv!30247 (array!81963) Bool)

(assert (=> start!105718 (array_inv!30247 _keys!1118)))

(declare-datatypes ((V!48311 0))(
  ( (V!48312 (val!16167 Int)) )
))
(declare-datatypes ((ValueCell!15341 0))(
  ( (ValueCellFull!15341 (v!18868 V!48311)) (EmptyCell!15341) )
))
(declare-datatypes ((array!81965 0))(
  ( (array!81966 (arr!39538 (Array (_ BitVec 32) ValueCell!15341)) (size!40076 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81965)

(declare-fun e!716379 () Bool)

(declare-fun array_inv!30248 (array!81965) Bool)

(assert (=> start!105718 (and (array_inv!30248 _values!914) e!716379)))

(declare-datatypes ((tuple2!20980 0))(
  ( (tuple2!20981 (_1!10501 (_ BitVec 64)) (_2!10501 V!48311)) )
))
(declare-fun lt!569809 () tuple2!20980)

(declare-fun e!716385 () Bool)

(declare-fun b!1259284 () Bool)

(declare-datatypes ((List!28184 0))(
  ( (Nil!28181) (Cons!28180 (h!29389 tuple2!20980) (t!41670 List!28184)) )
))
(declare-datatypes ((ListLongMap!18853 0))(
  ( (ListLongMap!18854 (toList!9442 List!28184)) )
))
(declare-fun lt!569815 () ListLongMap!18853)

(declare-fun lt!569811 () ListLongMap!18853)

(declare-fun +!4243 (ListLongMap!18853 tuple2!20980) ListLongMap!18853)

(assert (=> b!1259284 (= e!716385 (= lt!569815 (+!4243 lt!569811 lt!569809)))))

(declare-fun b!1259285 () Bool)

(declare-fun res!839297 () Bool)

(assert (=> b!1259285 (=> (not res!839297) (not e!716384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81963 (_ BitVec 32)) Bool)

(assert (=> b!1259285 (= res!839297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259286 () Bool)

(declare-fun e!716381 () Bool)

(assert (=> b!1259286 (= e!716384 (not e!716381))))

(declare-fun res!839294 () Bool)

(assert (=> b!1259286 (=> res!839294 e!716381)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259286 (= res!839294 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569813 () ListLongMap!18853)

(assert (=> b!1259286 (= lt!569813 lt!569811)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48311)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41828 0))(
  ( (Unit!41829) )
))
(declare-fun lt!569814 () Unit!41828)

(declare-fun minValueBefore!43 () V!48311)

(declare-fun zeroValue!871 () V!48311)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1137 (array!81963 array!81965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48311 V!48311 V!48311 V!48311 (_ BitVec 32) Int) Unit!41828)

(assert (=> b!1259286 (= lt!569814 (lemmaNoChangeToArrayThenSameMapNoExtras!1137 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5815 (array!81963 array!81965 (_ BitVec 32) (_ BitVec 32) V!48311 V!48311 (_ BitVec 32) Int) ListLongMap!18853)

(assert (=> b!1259286 (= lt!569811 (getCurrentListMapNoExtraKeys!5815 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259286 (= lt!569813 (getCurrentListMapNoExtraKeys!5815 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50110 () Bool)

(declare-fun mapRes!50110 () Bool)

(assert (=> mapIsEmpty!50110 mapRes!50110))

(declare-fun b!1259287 () Bool)

(declare-fun res!839293 () Bool)

(assert (=> b!1259287 (=> (not res!839293) (not e!716384))))

(assert (=> b!1259287 (= res!839293 (and (= (size!40076 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40075 _keys!1118) (size!40076 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50110 () Bool)

(declare-fun tp!95447 () Bool)

(declare-fun e!716382 () Bool)

(assert (=> mapNonEmpty!50110 (= mapRes!50110 (and tp!95447 e!716382))))

(declare-fun mapValue!50110 () ValueCell!15341)

(declare-fun mapKey!50110 () (_ BitVec 32))

(declare-fun mapRest!50110 () (Array (_ BitVec 32) ValueCell!15341))

(assert (=> mapNonEmpty!50110 (= (arr!39538 _values!914) (store mapRest!50110 mapKey!50110 mapValue!50110))))

(declare-fun b!1259288 () Bool)

(assert (=> b!1259288 (= e!716381 true)))

(declare-fun lt!569808 () ListLongMap!18853)

(declare-fun lt!569817 () ListLongMap!18853)

(declare-fun -!2063 (ListLongMap!18853 (_ BitVec 64)) ListLongMap!18853)

(assert (=> b!1259288 (= lt!569808 (-!2063 lt!569817 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569812 () ListLongMap!18853)

(declare-fun lt!569810 () ListLongMap!18853)

(assert (=> b!1259288 (= (-!2063 lt!569812 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569810)))

(declare-fun lt!569816 () Unit!41828)

(declare-fun addThenRemoveForNewKeyIsSame!320 (ListLongMap!18853 (_ BitVec 64) V!48311) Unit!41828)

(assert (=> b!1259288 (= lt!569816 (addThenRemoveForNewKeyIsSame!320 lt!569810 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1259288 e!716385))

(declare-fun res!839292 () Bool)

(assert (=> b!1259288 (=> (not res!839292) (not e!716385))))

(assert (=> b!1259288 (= res!839292 (= lt!569817 lt!569812))))

(assert (=> b!1259288 (= lt!569812 (+!4243 lt!569810 (tuple2!20981 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1259288 (= lt!569810 (+!4243 lt!569813 lt!569809))))

(assert (=> b!1259288 (= lt!569809 (tuple2!20981 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4529 (array!81963 array!81965 (_ BitVec 32) (_ BitVec 32) V!48311 V!48311 (_ BitVec 32) Int) ListLongMap!18853)

(assert (=> b!1259288 (= lt!569815 (getCurrentListMap!4529 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259288 (= lt!569817 (getCurrentListMap!4529 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259289 () Bool)

(assert (=> b!1259289 (= e!716382 tp_is_empty!32209)))

(declare-fun b!1259290 () Bool)

(declare-fun res!839295 () Bool)

(assert (=> b!1259290 (=> (not res!839295) (not e!716384))))

(declare-datatypes ((List!28185 0))(
  ( (Nil!28182) (Cons!28181 (h!29390 (_ BitVec 64)) (t!41671 List!28185)) )
))
(declare-fun arrayNoDuplicates!0 (array!81963 (_ BitVec 32) List!28185) Bool)

(assert (=> b!1259290 (= res!839295 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28182))))

(declare-fun b!1259291 () Bool)

(assert (=> b!1259291 (= e!716379 (and e!716380 mapRes!50110))))

(declare-fun condMapEmpty!50110 () Bool)

(declare-fun mapDefault!50110 () ValueCell!15341)

(assert (=> b!1259291 (= condMapEmpty!50110 (= (arr!39538 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15341)) mapDefault!50110)))))

(assert (= (and start!105718 res!839296) b!1259287))

(assert (= (and b!1259287 res!839293) b!1259285))

(assert (= (and b!1259285 res!839297) b!1259290))

(assert (= (and b!1259290 res!839295) b!1259286))

(assert (= (and b!1259286 (not res!839294)) b!1259288))

(assert (= (and b!1259288 res!839292) b!1259284))

(assert (= (and b!1259291 condMapEmpty!50110) mapIsEmpty!50110))

(assert (= (and b!1259291 (not condMapEmpty!50110)) mapNonEmpty!50110))

(get-info :version)

(assert (= (and mapNonEmpty!50110 ((_ is ValueCellFull!15341) mapValue!50110)) b!1259289))

(assert (= (and b!1259291 ((_ is ValueCellFull!15341) mapDefault!50110)) b!1259283))

(assert (= start!105718 b!1259291))

(declare-fun m!1159301 () Bool)

(assert (=> b!1259286 m!1159301))

(declare-fun m!1159303 () Bool)

(assert (=> b!1259286 m!1159303))

(declare-fun m!1159305 () Bool)

(assert (=> b!1259286 m!1159305))

(declare-fun m!1159307 () Bool)

(assert (=> mapNonEmpty!50110 m!1159307))

(declare-fun m!1159309 () Bool)

(assert (=> start!105718 m!1159309))

(declare-fun m!1159311 () Bool)

(assert (=> start!105718 m!1159311))

(declare-fun m!1159313 () Bool)

(assert (=> start!105718 m!1159313))

(declare-fun m!1159315 () Bool)

(assert (=> b!1259284 m!1159315))

(declare-fun m!1159317 () Bool)

(assert (=> b!1259285 m!1159317))

(declare-fun m!1159319 () Bool)

(assert (=> b!1259290 m!1159319))

(declare-fun m!1159321 () Bool)

(assert (=> b!1259288 m!1159321))

(declare-fun m!1159323 () Bool)

(assert (=> b!1259288 m!1159323))

(declare-fun m!1159325 () Bool)

(assert (=> b!1259288 m!1159325))

(declare-fun m!1159327 () Bool)

(assert (=> b!1259288 m!1159327))

(declare-fun m!1159329 () Bool)

(assert (=> b!1259288 m!1159329))

(declare-fun m!1159331 () Bool)

(assert (=> b!1259288 m!1159331))

(declare-fun m!1159333 () Bool)

(assert (=> b!1259288 m!1159333))

(check-sat b_and!45173 (not mapNonEmpty!50110) (not b!1259288) (not b_next!27307) (not start!105718) (not b!1259286) (not b!1259285) tp_is_empty!32209 (not b!1259284) (not b!1259290))
(check-sat b_and!45173 (not b_next!27307))
