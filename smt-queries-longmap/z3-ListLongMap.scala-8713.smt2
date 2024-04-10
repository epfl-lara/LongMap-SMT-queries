; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105730 () Bool)

(assert start!105730)

(declare-fun b_free!27315 () Bool)

(declare-fun b_next!27315 () Bool)

(assert (=> start!105730 (= b_free!27315 (not b_next!27315))))

(declare-fun tp!95471 () Bool)

(declare-fun b_and!45199 () Bool)

(assert (=> start!105730 (= tp!95471 b_and!45199)))

(declare-fun b!1259473 () Bool)

(declare-fun res!839404 () Bool)

(declare-fun e!716511 () Bool)

(assert (=> b!1259473 (=> (not res!839404) (not e!716511))))

(declare-datatypes ((array!82052 0))(
  ( (array!82053 (arr!39581 (Array (_ BitVec 32) (_ BitVec 64))) (size!40117 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82052)

(declare-datatypes ((List!28111 0))(
  ( (Nil!28108) (Cons!28107 (h!29316 (_ BitVec 64)) (t!41606 List!28111)) )
))
(declare-fun arrayNoDuplicates!0 (array!82052 (_ BitVec 32) List!28111) Bool)

(assert (=> b!1259473 (= res!839404 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28108))))

(declare-fun b!1259474 () Bool)

(declare-fun e!716509 () Bool)

(declare-fun tp_is_empty!32217 () Bool)

(assert (=> b!1259474 (= e!716509 tp_is_empty!32217)))

(declare-fun b!1259475 () Bool)

(declare-fun res!839405 () Bool)

(assert (=> b!1259475 (=> (not res!839405) (not e!716511))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82052 (_ BitVec 32)) Bool)

(assert (=> b!1259475 (= res!839405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-datatypes ((V!48321 0))(
  ( (V!48322 (val!16171 Int)) )
))
(declare-datatypes ((tuple2!20904 0))(
  ( (tuple2!20905 (_1!10463 (_ BitVec 64)) (_2!10463 V!48321)) )
))
(declare-fun lt!570107 () tuple2!20904)

(declare-datatypes ((List!28112 0))(
  ( (Nil!28109) (Cons!28108 (h!29317 tuple2!20904) (t!41607 List!28112)) )
))
(declare-datatypes ((ListLongMap!18777 0))(
  ( (ListLongMap!18778 (toList!9404 List!28112)) )
))
(declare-fun lt!570114 () ListLongMap!18777)

(declare-fun b!1259476 () Bool)

(declare-fun lt!570115 () ListLongMap!18777)

(declare-fun e!716514 () Bool)

(declare-fun +!4209 (ListLongMap!18777 tuple2!20904) ListLongMap!18777)

(assert (=> b!1259476 (= e!716514 (= lt!570115 (+!4209 lt!570114 lt!570107)))))

(declare-fun res!839408 () Bool)

(assert (=> start!105730 (=> (not res!839408) (not e!716511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105730 (= res!839408 (validMask!0 mask!1466))))

(assert (=> start!105730 e!716511))

(assert (=> start!105730 true))

(assert (=> start!105730 tp!95471))

(assert (=> start!105730 tp_is_empty!32217))

(declare-fun array_inv!30135 (array!82052) Bool)

(assert (=> start!105730 (array_inv!30135 _keys!1118)))

(declare-datatypes ((ValueCell!15345 0))(
  ( (ValueCellFull!15345 (v!18873 V!48321)) (EmptyCell!15345) )
))
(declare-datatypes ((array!82054 0))(
  ( (array!82055 (arr!39582 (Array (_ BitVec 32) ValueCell!15345)) (size!40118 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82054)

(declare-fun e!716513 () Bool)

(declare-fun array_inv!30136 (array!82054) Bool)

(assert (=> start!105730 (and (array_inv!30136 _values!914) e!716513)))

(declare-fun mapIsEmpty!50122 () Bool)

(declare-fun mapRes!50122 () Bool)

(assert (=> mapIsEmpty!50122 mapRes!50122))

(declare-fun b!1259477 () Bool)

(declare-fun e!716512 () Bool)

(assert (=> b!1259477 (= e!716512 true)))

(declare-fun lt!570110 () ListLongMap!18777)

(declare-fun lt!570112 () ListLongMap!18777)

(declare-fun -!2111 (ListLongMap!18777 (_ BitVec 64)) ListLongMap!18777)

(assert (=> b!1259477 (= lt!570110 (-!2111 lt!570112 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570109 () ListLongMap!18777)

(declare-fun lt!570108 () ListLongMap!18777)

(assert (=> b!1259477 (= (-!2111 lt!570109 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570108)))

(declare-datatypes ((Unit!41991 0))(
  ( (Unit!41992) )
))
(declare-fun lt!570113 () Unit!41991)

(declare-fun minValueBefore!43 () V!48321)

(declare-fun addThenRemoveForNewKeyIsSame!348 (ListLongMap!18777 (_ BitVec 64) V!48321) Unit!41991)

(assert (=> b!1259477 (= lt!570113 (addThenRemoveForNewKeyIsSame!348 lt!570108 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1259477 e!716514))

(declare-fun res!839407 () Bool)

(assert (=> b!1259477 (=> (not res!839407) (not e!716514))))

(assert (=> b!1259477 (= res!839407 (= lt!570112 lt!570109))))

(assert (=> b!1259477 (= lt!570109 (+!4209 lt!570108 (tuple2!20905 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570111 () ListLongMap!18777)

(assert (=> b!1259477 (= lt!570108 (+!4209 lt!570111 lt!570107))))

(declare-fun zeroValue!871 () V!48321)

(assert (=> b!1259477 (= lt!570107 (tuple2!20905 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48321)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4602 (array!82052 array!82054 (_ BitVec 32) (_ BitVec 32) V!48321 V!48321 (_ BitVec 32) Int) ListLongMap!18777)

(assert (=> b!1259477 (= lt!570115 (getCurrentListMap!4602 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259477 (= lt!570112 (getCurrentListMap!4602 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259478 () Bool)

(declare-fun e!716510 () Bool)

(assert (=> b!1259478 (= e!716510 tp_is_empty!32217)))

(declare-fun mapNonEmpty!50122 () Bool)

(declare-fun tp!95470 () Bool)

(assert (=> mapNonEmpty!50122 (= mapRes!50122 (and tp!95470 e!716510))))

(declare-fun mapValue!50122 () ValueCell!15345)

(declare-fun mapRest!50122 () (Array (_ BitVec 32) ValueCell!15345))

(declare-fun mapKey!50122 () (_ BitVec 32))

(assert (=> mapNonEmpty!50122 (= (arr!39582 _values!914) (store mapRest!50122 mapKey!50122 mapValue!50122))))

(declare-fun b!1259479 () Bool)

(assert (=> b!1259479 (= e!716511 (not e!716512))))

(declare-fun res!839406 () Bool)

(assert (=> b!1259479 (=> res!839406 e!716512)))

(assert (=> b!1259479 (= res!839406 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259479 (= lt!570111 lt!570114)))

(declare-fun lt!570116 () Unit!41991)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1144 (array!82052 array!82054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48321 V!48321 V!48321 V!48321 (_ BitVec 32) Int) Unit!41991)

(assert (=> b!1259479 (= lt!570116 (lemmaNoChangeToArrayThenSameMapNoExtras!1144 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5780 (array!82052 array!82054 (_ BitVec 32) (_ BitVec 32) V!48321 V!48321 (_ BitVec 32) Int) ListLongMap!18777)

(assert (=> b!1259479 (= lt!570114 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259479 (= lt!570111 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259480 () Bool)

(assert (=> b!1259480 (= e!716513 (and e!716509 mapRes!50122))))

(declare-fun condMapEmpty!50122 () Bool)

(declare-fun mapDefault!50122 () ValueCell!15345)

(assert (=> b!1259480 (= condMapEmpty!50122 (= (arr!39582 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15345)) mapDefault!50122)))))

(declare-fun b!1259481 () Bool)

(declare-fun res!839409 () Bool)

(assert (=> b!1259481 (=> (not res!839409) (not e!716511))))

(assert (=> b!1259481 (= res!839409 (and (= (size!40118 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40117 _keys!1118) (size!40118 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105730 res!839408) b!1259481))

(assert (= (and b!1259481 res!839409) b!1259475))

(assert (= (and b!1259475 res!839405) b!1259473))

(assert (= (and b!1259473 res!839404) b!1259479))

(assert (= (and b!1259479 (not res!839406)) b!1259477))

(assert (= (and b!1259477 res!839407) b!1259476))

(assert (= (and b!1259480 condMapEmpty!50122) mapIsEmpty!50122))

(assert (= (and b!1259480 (not condMapEmpty!50122)) mapNonEmpty!50122))

(get-info :version)

(assert (= (and mapNonEmpty!50122 ((_ is ValueCellFull!15345) mapValue!50122)) b!1259478))

(assert (= (and b!1259480 ((_ is ValueCellFull!15345) mapDefault!50122)) b!1259474))

(assert (= start!105730 b!1259480))

(declare-fun m!1159957 () Bool)

(assert (=> b!1259479 m!1159957))

(declare-fun m!1159959 () Bool)

(assert (=> b!1259479 m!1159959))

(declare-fun m!1159961 () Bool)

(assert (=> b!1259479 m!1159961))

(declare-fun m!1159963 () Bool)

(assert (=> b!1259476 m!1159963))

(declare-fun m!1159965 () Bool)

(assert (=> start!105730 m!1159965))

(declare-fun m!1159967 () Bool)

(assert (=> start!105730 m!1159967))

(declare-fun m!1159969 () Bool)

(assert (=> start!105730 m!1159969))

(declare-fun m!1159971 () Bool)

(assert (=> mapNonEmpty!50122 m!1159971))

(declare-fun m!1159973 () Bool)

(assert (=> b!1259473 m!1159973))

(declare-fun m!1159975 () Bool)

(assert (=> b!1259475 m!1159975))

(declare-fun m!1159977 () Bool)

(assert (=> b!1259477 m!1159977))

(declare-fun m!1159979 () Bool)

(assert (=> b!1259477 m!1159979))

(declare-fun m!1159981 () Bool)

(assert (=> b!1259477 m!1159981))

(declare-fun m!1159983 () Bool)

(assert (=> b!1259477 m!1159983))

(declare-fun m!1159985 () Bool)

(assert (=> b!1259477 m!1159985))

(declare-fun m!1159987 () Bool)

(assert (=> b!1259477 m!1159987))

(declare-fun m!1159989 () Bool)

(assert (=> b!1259477 m!1159989))

(check-sat (not b!1259473) (not b!1259475) (not b_next!27315) (not b!1259479) (not start!105730) (not b!1259476) b_and!45199 (not mapNonEmpty!50122) (not b!1259477) tp_is_empty!32217)
(check-sat b_and!45199 (not b_next!27315))
