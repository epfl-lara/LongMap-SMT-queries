; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105366 () Bool)

(assert start!105366)

(declare-fun b_free!26875 () Bool)

(declare-fun b_next!26875 () Bool)

(assert (=> start!105366 (= b_free!26875 (not b_next!26875))))

(declare-fun tp!94126 () Bool)

(declare-fun b_and!44681 () Bool)

(assert (=> start!105366 (= tp!94126 b_and!44681)))

(declare-fun b!1254273 () Bool)

(declare-fun e!712585 () Bool)

(declare-fun e!712586 () Bool)

(assert (=> b!1254273 (= e!712585 (not e!712586))))

(declare-fun res!836087 () Bool)

(assert (=> b!1254273 (=> res!836087 e!712586)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254273 (= res!836087 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47735 0))(
  ( (V!47736 (val!15951 Int)) )
))
(declare-datatypes ((tuple2!20600 0))(
  ( (tuple2!20601 (_1!10311 (_ BitVec 64)) (_2!10311 V!47735)) )
))
(declare-datatypes ((List!27839 0))(
  ( (Nil!27836) (Cons!27835 (h!29053 tuple2!20600) (t!41310 List!27839)) )
))
(declare-datatypes ((ListLongMap!18481 0))(
  ( (ListLongMap!18482 (toList!9256 List!27839)) )
))
(declare-fun lt!566081 () ListLongMap!18481)

(declare-fun lt!566079 () ListLongMap!18481)

(assert (=> b!1254273 (= lt!566081 lt!566079)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!47735)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47735)

(declare-datatypes ((array!81257 0))(
  ( (array!81258 (arr!39187 (Array (_ BitVec 32) (_ BitVec 64))) (size!39724 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81257)

(declare-datatypes ((ValueCell!15125 0))(
  ( (ValueCellFull!15125 (v!18645 V!47735)) (EmptyCell!15125) )
))
(declare-datatypes ((array!81259 0))(
  ( (array!81260 (arr!39188 (Array (_ BitVec 32) ValueCell!15125)) (size!39725 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81259)

(declare-fun minValueBefore!43 () V!47735)

(declare-datatypes ((Unit!41648 0))(
  ( (Unit!41649) )
))
(declare-fun lt!566082 () Unit!41648)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!996 (array!81257 array!81259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47735 V!47735 V!47735 V!47735 (_ BitVec 32) Int) Unit!41648)

(assert (=> b!1254273 (= lt!566082 (lemmaNoChangeToArrayThenSameMapNoExtras!996 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5682 (array!81257 array!81259 (_ BitVec 32) (_ BitVec 32) V!47735 V!47735 (_ BitVec 32) Int) ListLongMap!18481)

(assert (=> b!1254273 (= lt!566079 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254273 (= lt!566081 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254274 () Bool)

(assert (=> b!1254274 (= e!712586 (bvsle #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(declare-fun lt!566080 () ListLongMap!18481)

(declare-fun getCurrentListMap!4494 (array!81257 array!81259 (_ BitVec 32) (_ BitVec 32) V!47735 V!47735 (_ BitVec 32) Int) ListLongMap!18481)

(assert (=> b!1254274 (= lt!566080 (getCurrentListMap!4494 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49438 () Bool)

(declare-fun mapRes!49438 () Bool)

(assert (=> mapIsEmpty!49438 mapRes!49438))

(declare-fun b!1254275 () Bool)

(declare-fun e!712583 () Bool)

(declare-fun e!712582 () Bool)

(assert (=> b!1254275 (= e!712583 (and e!712582 mapRes!49438))))

(declare-fun condMapEmpty!49438 () Bool)

(declare-fun mapDefault!49438 () ValueCell!15125)

(assert (=> b!1254275 (= condMapEmpty!49438 (= (arr!39188 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15125)) mapDefault!49438)))))

(declare-fun b!1254276 () Bool)

(declare-fun res!836083 () Bool)

(assert (=> b!1254276 (=> (not res!836083) (not e!712585))))

(declare-datatypes ((List!27840 0))(
  ( (Nil!27837) (Cons!27836 (h!29054 (_ BitVec 64)) (t!41311 List!27840)) )
))
(declare-fun arrayNoDuplicates!0 (array!81257 (_ BitVec 32) List!27840) Bool)

(assert (=> b!1254276 (= res!836083 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27837))))

(declare-fun res!836085 () Bool)

(assert (=> start!105366 (=> (not res!836085) (not e!712585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105366 (= res!836085 (validMask!0 mask!1466))))

(assert (=> start!105366 e!712585))

(assert (=> start!105366 true))

(assert (=> start!105366 tp!94126))

(declare-fun tp_is_empty!31777 () Bool)

(assert (=> start!105366 tp_is_empty!31777))

(declare-fun array_inv!29991 (array!81257) Bool)

(assert (=> start!105366 (array_inv!29991 _keys!1118)))

(declare-fun array_inv!29992 (array!81259) Bool)

(assert (=> start!105366 (and (array_inv!29992 _values!914) e!712583)))

(declare-fun mapNonEmpty!49438 () Bool)

(declare-fun tp!94127 () Bool)

(declare-fun e!712584 () Bool)

(assert (=> mapNonEmpty!49438 (= mapRes!49438 (and tp!94127 e!712584))))

(declare-fun mapKey!49438 () (_ BitVec 32))

(declare-fun mapValue!49438 () ValueCell!15125)

(declare-fun mapRest!49438 () (Array (_ BitVec 32) ValueCell!15125))

(assert (=> mapNonEmpty!49438 (= (arr!39188 _values!914) (store mapRest!49438 mapKey!49438 mapValue!49438))))

(declare-fun b!1254277 () Bool)

(assert (=> b!1254277 (= e!712584 tp_is_empty!31777)))

(declare-fun b!1254278 () Bool)

(declare-fun res!836084 () Bool)

(assert (=> b!1254278 (=> (not res!836084) (not e!712585))))

(assert (=> b!1254278 (= res!836084 (and (= (size!39725 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39724 _keys!1118) (size!39725 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254279 () Bool)

(assert (=> b!1254279 (= e!712582 tp_is_empty!31777)))

(declare-fun b!1254280 () Bool)

(declare-fun res!836086 () Bool)

(assert (=> b!1254280 (=> (not res!836086) (not e!712585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81257 (_ BitVec 32)) Bool)

(assert (=> b!1254280 (= res!836086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105366 res!836085) b!1254278))

(assert (= (and b!1254278 res!836084) b!1254280))

(assert (= (and b!1254280 res!836086) b!1254276))

(assert (= (and b!1254276 res!836083) b!1254273))

(assert (= (and b!1254273 (not res!836087)) b!1254274))

(assert (= (and b!1254275 condMapEmpty!49438) mapIsEmpty!49438))

(assert (= (and b!1254275 (not condMapEmpty!49438)) mapNonEmpty!49438))

(get-info :version)

(assert (= (and mapNonEmpty!49438 ((_ is ValueCellFull!15125) mapValue!49438)) b!1254277))

(assert (= (and b!1254275 ((_ is ValueCellFull!15125) mapDefault!49438)) b!1254279))

(assert (= start!105366 b!1254275))

(declare-fun m!1155117 () Bool)

(assert (=> mapNonEmpty!49438 m!1155117))

(declare-fun m!1155119 () Bool)

(assert (=> start!105366 m!1155119))

(declare-fun m!1155121 () Bool)

(assert (=> start!105366 m!1155121))

(declare-fun m!1155123 () Bool)

(assert (=> start!105366 m!1155123))

(declare-fun m!1155125 () Bool)

(assert (=> b!1254274 m!1155125))

(declare-fun m!1155127 () Bool)

(assert (=> b!1254276 m!1155127))

(declare-fun m!1155129 () Bool)

(assert (=> b!1254280 m!1155129))

(declare-fun m!1155131 () Bool)

(assert (=> b!1254273 m!1155131))

(declare-fun m!1155133 () Bool)

(assert (=> b!1254273 m!1155133))

(declare-fun m!1155135 () Bool)

(assert (=> b!1254273 m!1155135))

(check-sat (not mapNonEmpty!49438) (not start!105366) (not b!1254274) (not b!1254280) (not b!1254273) (not b!1254276) (not b_next!26875) tp_is_empty!31777 b_and!44681)
(check-sat b_and!44681 (not b_next!26875))
(get-model)

(declare-fun d!138467 () Bool)

(assert (=> d!138467 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105366 d!138467))

(declare-fun d!138469 () Bool)

(assert (=> d!138469 (= (array_inv!29991 _keys!1118) (bvsge (size!39724 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105366 d!138469))

(declare-fun d!138471 () Bool)

(assert (=> d!138471 (= (array_inv!29992 _values!914) (bvsge (size!39725 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105366 d!138471))

(declare-fun bm!61725 () Bool)

(declare-fun call!61728 () Bool)

(declare-fun c!122657 () Bool)

(assert (=> bm!61725 (= call!61728 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122657 (Cons!27836 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000) Nil!27837) Nil!27837)))))

(declare-fun b!1254339 () Bool)

(declare-fun e!712633 () Bool)

(assert (=> b!1254339 (= e!712633 call!61728)))

(declare-fun b!1254340 () Bool)

(declare-fun e!712635 () Bool)

(assert (=> b!1254340 (= e!712635 e!712633)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1254340 (= c!122657 (validKeyInArray!0 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254341 () Bool)

(assert (=> b!1254341 (= e!712633 call!61728)))

(declare-fun b!1254342 () Bool)

(declare-fun e!712632 () Bool)

(declare-fun contains!7545 (List!27840 (_ BitVec 64)) Bool)

(assert (=> b!1254342 (= e!712632 (contains!7545 Nil!27837 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138473 () Bool)

(declare-fun res!836125 () Bool)

(declare-fun e!712634 () Bool)

(assert (=> d!138473 (=> res!836125 e!712634)))

(assert (=> d!138473 (= res!836125 (bvsge #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(assert (=> d!138473 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27837) e!712634)))

(declare-fun b!1254343 () Bool)

(assert (=> b!1254343 (= e!712634 e!712635)))

(declare-fun res!836126 () Bool)

(assert (=> b!1254343 (=> (not res!836126) (not e!712635))))

(assert (=> b!1254343 (= res!836126 (not e!712632))))

(declare-fun res!836124 () Bool)

(assert (=> b!1254343 (=> (not res!836124) (not e!712632))))

(assert (=> b!1254343 (= res!836124 (validKeyInArray!0 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138473 (not res!836125)) b!1254343))

(assert (= (and b!1254343 res!836124) b!1254342))

(assert (= (and b!1254343 res!836126) b!1254340))

(assert (= (and b!1254340 c!122657) b!1254341))

(assert (= (and b!1254340 (not c!122657)) b!1254339))

(assert (= (or b!1254341 b!1254339) bm!61725))

(declare-fun m!1155177 () Bool)

(assert (=> bm!61725 m!1155177))

(declare-fun m!1155179 () Bool)

(assert (=> bm!61725 m!1155179))

(assert (=> b!1254340 m!1155177))

(assert (=> b!1254340 m!1155177))

(declare-fun m!1155181 () Bool)

(assert (=> b!1254340 m!1155181))

(assert (=> b!1254342 m!1155177))

(assert (=> b!1254342 m!1155177))

(declare-fun m!1155183 () Bool)

(assert (=> b!1254342 m!1155183))

(assert (=> b!1254343 m!1155177))

(assert (=> b!1254343 m!1155177))

(assert (=> b!1254343 m!1155181))

(assert (=> b!1254276 d!138473))

(declare-fun b!1254352 () Bool)

(declare-fun e!712642 () Bool)

(declare-fun e!712643 () Bool)

(assert (=> b!1254352 (= e!712642 e!712643)))

(declare-fun c!122660 () Bool)

(assert (=> b!1254352 (= c!122660 (validKeyInArray!0 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61728 () Bool)

(declare-fun call!61731 () Bool)

(assert (=> bm!61728 (= call!61731 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138475 () Bool)

(declare-fun res!836132 () Bool)

(assert (=> d!138475 (=> res!836132 e!712642)))

(assert (=> d!138475 (= res!836132 (bvsge #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(assert (=> d!138475 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!712642)))

(declare-fun b!1254353 () Bool)

(assert (=> b!1254353 (= e!712643 call!61731)))

(declare-fun b!1254354 () Bool)

(declare-fun e!712644 () Bool)

(assert (=> b!1254354 (= e!712643 e!712644)))

(declare-fun lt!566114 () (_ BitVec 64))

(assert (=> b!1254354 (= lt!566114 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566115 () Unit!41648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81257 (_ BitVec 64) (_ BitVec 32)) Unit!41648)

(assert (=> b!1254354 (= lt!566115 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!566114 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1254354 (arrayContainsKey!0 _keys!1118 lt!566114 #b00000000000000000000000000000000)))

(declare-fun lt!566113 () Unit!41648)

(assert (=> b!1254354 (= lt!566113 lt!566115)))

(declare-fun res!836131 () Bool)

(declare-datatypes ((SeekEntryResult!9918 0))(
  ( (MissingZero!9918 (index!42043 (_ BitVec 32))) (Found!9918 (index!42044 (_ BitVec 32))) (Intermediate!9918 (undefined!10730 Bool) (index!42045 (_ BitVec 32)) (x!110259 (_ BitVec 32))) (Undefined!9918) (MissingVacant!9918 (index!42046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81257 (_ BitVec 32)) SeekEntryResult!9918)

(assert (=> b!1254354 (= res!836131 (= (seekEntryOrOpen!0 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9918 #b00000000000000000000000000000000)))))

(assert (=> b!1254354 (=> (not res!836131) (not e!712644))))

(declare-fun b!1254355 () Bool)

(assert (=> b!1254355 (= e!712644 call!61731)))

(assert (= (and d!138475 (not res!836132)) b!1254352))

(assert (= (and b!1254352 c!122660) b!1254354))

(assert (= (and b!1254352 (not c!122660)) b!1254353))

(assert (= (and b!1254354 res!836131) b!1254355))

(assert (= (or b!1254355 b!1254353) bm!61728))

(assert (=> b!1254352 m!1155177))

(assert (=> b!1254352 m!1155177))

(assert (=> b!1254352 m!1155181))

(declare-fun m!1155185 () Bool)

(assert (=> bm!61728 m!1155185))

(assert (=> b!1254354 m!1155177))

(declare-fun m!1155187 () Bool)

(assert (=> b!1254354 m!1155187))

(declare-fun m!1155189 () Bool)

(assert (=> b!1254354 m!1155189))

(assert (=> b!1254354 m!1155177))

(declare-fun m!1155191 () Bool)

(assert (=> b!1254354 m!1155191))

(assert (=> b!1254280 d!138475))

(declare-fun d!138477 () Bool)

(assert (=> d!138477 (= (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566118 () Unit!41648)

(declare-fun choose!1856 (array!81257 array!81259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47735 V!47735 V!47735 V!47735 (_ BitVec 32) Int) Unit!41648)

(assert (=> d!138477 (= lt!566118 (choose!1856 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138477 (validMask!0 mask!1466)))

(assert (=> d!138477 (= (lemmaNoChangeToArrayThenSameMapNoExtras!996 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566118)))

(declare-fun bs!35411 () Bool)

(assert (= bs!35411 d!138477))

(assert (=> bs!35411 m!1155135))

(assert (=> bs!35411 m!1155133))

(declare-fun m!1155193 () Bool)

(assert (=> bs!35411 m!1155193))

(assert (=> bs!35411 m!1155119))

(assert (=> b!1254273 d!138477))

(declare-fun d!138479 () Bool)

(declare-fun e!712660 () Bool)

(assert (=> d!138479 e!712660))

(declare-fun res!836141 () Bool)

(assert (=> d!138479 (=> (not res!836141) (not e!712660))))

(declare-fun lt!566137 () ListLongMap!18481)

(declare-fun contains!7546 (ListLongMap!18481 (_ BitVec 64)) Bool)

(assert (=> d!138479 (= res!836141 (not (contains!7546 lt!566137 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!712659 () ListLongMap!18481)

(assert (=> d!138479 (= lt!566137 e!712659)))

(declare-fun c!122670 () Bool)

(assert (=> d!138479 (= c!122670 (bvsge #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(assert (=> d!138479 (validMask!0 mask!1466)))

(assert (=> d!138479 (= (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566137)))

(declare-fun bm!61731 () Bool)

(declare-fun call!61734 () ListLongMap!18481)

(assert (=> bm!61731 (= call!61734 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1254380 () Bool)

(declare-fun e!712663 () Bool)

(declare-fun e!712661 () Bool)

(assert (=> b!1254380 (= e!712663 e!712661)))

(declare-fun c!122669 () Bool)

(assert (=> b!1254380 (= c!122669 (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(declare-fun b!1254381 () Bool)

(declare-fun res!836144 () Bool)

(assert (=> b!1254381 (=> (not res!836144) (not e!712660))))

(assert (=> b!1254381 (= res!836144 (not (contains!7546 lt!566137 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1254382 () Bool)

(assert (=> b!1254382 (= e!712660 e!712663)))

(declare-fun c!122672 () Bool)

(declare-fun e!712665 () Bool)

(assert (=> b!1254382 (= c!122672 e!712665)))

(declare-fun res!836143 () Bool)

(assert (=> b!1254382 (=> (not res!836143) (not e!712665))))

(assert (=> b!1254382 (= res!836143 (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(declare-fun b!1254383 () Bool)

(assert (=> b!1254383 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(assert (=> b!1254383 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39725 _values!914)))))

(declare-fun e!712662 () Bool)

(declare-fun apply!993 (ListLongMap!18481 (_ BitVec 64)) V!47735)

(declare-fun get!20112 (ValueCell!15125 V!47735) V!47735)

(declare-fun dynLambda!3445 (Int (_ BitVec 64)) V!47735)

(assert (=> b!1254383 (= e!712662 (= (apply!993 lt!566137 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)) (get!20112 (select (arr!39188 _values!914) #b00000000000000000000000000000000) (dynLambda!3445 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1254384 () Bool)

(declare-fun e!712664 () ListLongMap!18481)

(assert (=> b!1254384 (= e!712664 call!61734)))

(declare-fun b!1254385 () Bool)

(assert (=> b!1254385 (= e!712665 (validKeyInArray!0 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254385 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1254386 () Bool)

(assert (=> b!1254386 (= e!712659 e!712664)))

(declare-fun c!122671 () Bool)

(assert (=> b!1254386 (= c!122671 (validKeyInArray!0 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254387 () Bool)

(assert (=> b!1254387 (= e!712663 e!712662)))

(assert (=> b!1254387 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(declare-fun res!836142 () Bool)

(assert (=> b!1254387 (= res!836142 (contains!7546 lt!566137 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254387 (=> (not res!836142) (not e!712662))))

(declare-fun b!1254388 () Bool)

(assert (=> b!1254388 (= e!712661 (= lt!566137 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1254389 () Bool)

(declare-fun lt!566139 () Unit!41648)

(declare-fun lt!566136 () Unit!41648)

(assert (=> b!1254389 (= lt!566139 lt!566136)))

(declare-fun lt!566133 () (_ BitVec 64))

(declare-fun lt!566134 () V!47735)

(declare-fun lt!566135 () ListLongMap!18481)

(declare-fun lt!566138 () (_ BitVec 64))

(declare-fun +!4197 (ListLongMap!18481 tuple2!20600) ListLongMap!18481)

(assert (=> b!1254389 (not (contains!7546 (+!4197 lt!566135 (tuple2!20601 lt!566138 lt!566134)) lt!566133))))

(declare-fun addStillNotContains!314 (ListLongMap!18481 (_ BitVec 64) V!47735 (_ BitVec 64)) Unit!41648)

(assert (=> b!1254389 (= lt!566136 (addStillNotContains!314 lt!566135 lt!566138 lt!566134 lt!566133))))

(assert (=> b!1254389 (= lt!566133 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1254389 (= lt!566134 (get!20112 (select (arr!39188 _values!914) #b00000000000000000000000000000000) (dynLambda!3445 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1254389 (= lt!566138 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1254389 (= lt!566135 call!61734)))

(assert (=> b!1254389 (= e!712664 (+!4197 call!61734 (tuple2!20601 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000) (get!20112 (select (arr!39188 _values!914) #b00000000000000000000000000000000) (dynLambda!3445 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1254390 () Bool)

(declare-fun isEmpty!1030 (ListLongMap!18481) Bool)

(assert (=> b!1254390 (= e!712661 (isEmpty!1030 lt!566137))))

(declare-fun b!1254391 () Bool)

(assert (=> b!1254391 (= e!712659 (ListLongMap!18482 Nil!27836))))

(assert (= (and d!138479 c!122670) b!1254391))

(assert (= (and d!138479 (not c!122670)) b!1254386))

(assert (= (and b!1254386 c!122671) b!1254389))

(assert (= (and b!1254386 (not c!122671)) b!1254384))

(assert (= (or b!1254389 b!1254384) bm!61731))

(assert (= (and d!138479 res!836141) b!1254381))

(assert (= (and b!1254381 res!836144) b!1254382))

(assert (= (and b!1254382 res!836143) b!1254385))

(assert (= (and b!1254382 c!122672) b!1254387))

(assert (= (and b!1254382 (not c!122672)) b!1254380))

(assert (= (and b!1254387 res!836142) b!1254383))

(assert (= (and b!1254380 c!122669) b!1254388))

(assert (= (and b!1254380 (not c!122669)) b!1254390))

(declare-fun b_lambda!22577 () Bool)

(assert (=> (not b_lambda!22577) (not b!1254383)))

(declare-fun t!41314 () Bool)

(declare-fun tb!11287 () Bool)

(assert (=> (and start!105366 (= defaultEntry!922 defaultEntry!922) t!41314) tb!11287))

(declare-fun result!23285 () Bool)

(assert (=> tb!11287 (= result!23285 tp_is_empty!31777)))

(assert (=> b!1254383 t!41314))

(declare-fun b_and!44687 () Bool)

(assert (= b_and!44681 (and (=> t!41314 result!23285) b_and!44687)))

(declare-fun b_lambda!22579 () Bool)

(assert (=> (not b_lambda!22579) (not b!1254389)))

(assert (=> b!1254389 t!41314))

(declare-fun b_and!44689 () Bool)

(assert (= b_and!44687 (and (=> t!41314 result!23285) b_and!44689)))

(declare-fun m!1155195 () Bool)

(assert (=> b!1254389 m!1155195))

(declare-fun m!1155197 () Bool)

(assert (=> b!1254389 m!1155197))

(declare-fun m!1155199 () Bool)

(assert (=> b!1254389 m!1155199))

(assert (=> b!1254389 m!1155177))

(declare-fun m!1155201 () Bool)

(assert (=> b!1254389 m!1155201))

(assert (=> b!1254389 m!1155201))

(declare-fun m!1155203 () Bool)

(assert (=> b!1254389 m!1155203))

(declare-fun m!1155205 () Bool)

(assert (=> b!1254389 m!1155205))

(assert (=> b!1254389 m!1155203))

(assert (=> b!1254389 m!1155197))

(declare-fun m!1155207 () Bool)

(assert (=> b!1254389 m!1155207))

(declare-fun m!1155209 () Bool)

(assert (=> d!138479 m!1155209))

(assert (=> d!138479 m!1155119))

(declare-fun m!1155211 () Bool)

(assert (=> b!1254390 m!1155211))

(assert (=> b!1254386 m!1155177))

(assert (=> b!1254386 m!1155177))

(assert (=> b!1254386 m!1155181))

(assert (=> b!1254385 m!1155177))

(assert (=> b!1254385 m!1155177))

(assert (=> b!1254385 m!1155181))

(assert (=> b!1254387 m!1155177))

(assert (=> b!1254387 m!1155177))

(declare-fun m!1155213 () Bool)

(assert (=> b!1254387 m!1155213))

(declare-fun m!1155215 () Bool)

(assert (=> b!1254381 m!1155215))

(declare-fun m!1155217 () Bool)

(assert (=> bm!61731 m!1155217))

(assert (=> b!1254388 m!1155217))

(assert (=> b!1254383 m!1155177))

(declare-fun m!1155219 () Bool)

(assert (=> b!1254383 m!1155219))

(assert (=> b!1254383 m!1155177))

(assert (=> b!1254383 m!1155201))

(assert (=> b!1254383 m!1155201))

(assert (=> b!1254383 m!1155203))

(assert (=> b!1254383 m!1155205))

(assert (=> b!1254383 m!1155203))

(assert (=> b!1254273 d!138479))

(declare-fun d!138481 () Bool)

(declare-fun e!712667 () Bool)

(assert (=> d!138481 e!712667))

(declare-fun res!836145 () Bool)

(assert (=> d!138481 (=> (not res!836145) (not e!712667))))

(declare-fun lt!566144 () ListLongMap!18481)

(assert (=> d!138481 (= res!836145 (not (contains!7546 lt!566144 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!712666 () ListLongMap!18481)

(assert (=> d!138481 (= lt!566144 e!712666)))

(declare-fun c!122674 () Bool)

(assert (=> d!138481 (= c!122674 (bvsge #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(assert (=> d!138481 (validMask!0 mask!1466)))

(assert (=> d!138481 (= (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566144)))

(declare-fun bm!61732 () Bool)

(declare-fun call!61735 () ListLongMap!18481)

(assert (=> bm!61732 (= call!61735 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1254394 () Bool)

(declare-fun e!712670 () Bool)

(declare-fun e!712668 () Bool)

(assert (=> b!1254394 (= e!712670 e!712668)))

(declare-fun c!122673 () Bool)

(assert (=> b!1254394 (= c!122673 (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(declare-fun b!1254395 () Bool)

(declare-fun res!836148 () Bool)

(assert (=> b!1254395 (=> (not res!836148) (not e!712667))))

(assert (=> b!1254395 (= res!836148 (not (contains!7546 lt!566144 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1254396 () Bool)

(assert (=> b!1254396 (= e!712667 e!712670)))

(declare-fun c!122676 () Bool)

(declare-fun e!712672 () Bool)

(assert (=> b!1254396 (= c!122676 e!712672)))

(declare-fun res!836147 () Bool)

(assert (=> b!1254396 (=> (not res!836147) (not e!712672))))

(assert (=> b!1254396 (= res!836147 (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(declare-fun b!1254397 () Bool)

(assert (=> b!1254397 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(assert (=> b!1254397 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39725 _values!914)))))

(declare-fun e!712669 () Bool)

(assert (=> b!1254397 (= e!712669 (= (apply!993 lt!566144 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)) (get!20112 (select (arr!39188 _values!914) #b00000000000000000000000000000000) (dynLambda!3445 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1254398 () Bool)

(declare-fun e!712671 () ListLongMap!18481)

(assert (=> b!1254398 (= e!712671 call!61735)))

(declare-fun b!1254399 () Bool)

(assert (=> b!1254399 (= e!712672 (validKeyInArray!0 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254399 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1254400 () Bool)

(assert (=> b!1254400 (= e!712666 e!712671)))

(declare-fun c!122675 () Bool)

(assert (=> b!1254400 (= c!122675 (validKeyInArray!0 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1254401 () Bool)

(assert (=> b!1254401 (= e!712670 e!712669)))

(assert (=> b!1254401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(declare-fun res!836146 () Bool)

(assert (=> b!1254401 (= res!836146 (contains!7546 lt!566144 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254401 (=> (not res!836146) (not e!712669))))

(declare-fun b!1254402 () Bool)

(assert (=> b!1254402 (= e!712668 (= lt!566144 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1254403 () Bool)

(declare-fun lt!566146 () Unit!41648)

(declare-fun lt!566143 () Unit!41648)

(assert (=> b!1254403 (= lt!566146 lt!566143)))

(declare-fun lt!566140 () (_ BitVec 64))

(declare-fun lt!566145 () (_ BitVec 64))

(declare-fun lt!566142 () ListLongMap!18481)

(declare-fun lt!566141 () V!47735)

(assert (=> b!1254403 (not (contains!7546 (+!4197 lt!566142 (tuple2!20601 lt!566145 lt!566141)) lt!566140))))

(assert (=> b!1254403 (= lt!566143 (addStillNotContains!314 lt!566142 lt!566145 lt!566141 lt!566140))))

(assert (=> b!1254403 (= lt!566140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1254403 (= lt!566141 (get!20112 (select (arr!39188 _values!914) #b00000000000000000000000000000000) (dynLambda!3445 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1254403 (= lt!566145 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1254403 (= lt!566142 call!61735)))

(assert (=> b!1254403 (= e!712671 (+!4197 call!61735 (tuple2!20601 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000) (get!20112 (select (arr!39188 _values!914) #b00000000000000000000000000000000) (dynLambda!3445 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1254404 () Bool)

(assert (=> b!1254404 (= e!712668 (isEmpty!1030 lt!566144))))

(declare-fun b!1254405 () Bool)

(assert (=> b!1254405 (= e!712666 (ListLongMap!18482 Nil!27836))))

(assert (= (and d!138481 c!122674) b!1254405))

(assert (= (and d!138481 (not c!122674)) b!1254400))

(assert (= (and b!1254400 c!122675) b!1254403))

(assert (= (and b!1254400 (not c!122675)) b!1254398))

(assert (= (or b!1254403 b!1254398) bm!61732))

(assert (= (and d!138481 res!836145) b!1254395))

(assert (= (and b!1254395 res!836148) b!1254396))

(assert (= (and b!1254396 res!836147) b!1254399))

(assert (= (and b!1254396 c!122676) b!1254401))

(assert (= (and b!1254396 (not c!122676)) b!1254394))

(assert (= (and b!1254401 res!836146) b!1254397))

(assert (= (and b!1254394 c!122673) b!1254402))

(assert (= (and b!1254394 (not c!122673)) b!1254404))

(declare-fun b_lambda!22581 () Bool)

(assert (=> (not b_lambda!22581) (not b!1254397)))

(assert (=> b!1254397 t!41314))

(declare-fun b_and!44691 () Bool)

(assert (= b_and!44689 (and (=> t!41314 result!23285) b_and!44691)))

(declare-fun b_lambda!22583 () Bool)

(assert (=> (not b_lambda!22583) (not b!1254403)))

(assert (=> b!1254403 t!41314))

(declare-fun b_and!44693 () Bool)

(assert (= b_and!44691 (and (=> t!41314 result!23285) b_and!44693)))

(declare-fun m!1155221 () Bool)

(assert (=> b!1254403 m!1155221))

(declare-fun m!1155223 () Bool)

(assert (=> b!1254403 m!1155223))

(declare-fun m!1155225 () Bool)

(assert (=> b!1254403 m!1155225))

(assert (=> b!1254403 m!1155177))

(assert (=> b!1254403 m!1155201))

(assert (=> b!1254403 m!1155201))

(assert (=> b!1254403 m!1155203))

(assert (=> b!1254403 m!1155205))

(assert (=> b!1254403 m!1155203))

(assert (=> b!1254403 m!1155223))

(declare-fun m!1155227 () Bool)

(assert (=> b!1254403 m!1155227))

(declare-fun m!1155229 () Bool)

(assert (=> d!138481 m!1155229))

(assert (=> d!138481 m!1155119))

(declare-fun m!1155231 () Bool)

(assert (=> b!1254404 m!1155231))

(assert (=> b!1254400 m!1155177))

(assert (=> b!1254400 m!1155177))

(assert (=> b!1254400 m!1155181))

(assert (=> b!1254399 m!1155177))

(assert (=> b!1254399 m!1155177))

(assert (=> b!1254399 m!1155181))

(assert (=> b!1254401 m!1155177))

(assert (=> b!1254401 m!1155177))

(declare-fun m!1155233 () Bool)

(assert (=> b!1254401 m!1155233))

(declare-fun m!1155235 () Bool)

(assert (=> b!1254395 m!1155235))

(declare-fun m!1155237 () Bool)

(assert (=> bm!61732 m!1155237))

(assert (=> b!1254402 m!1155237))

(assert (=> b!1254397 m!1155177))

(declare-fun m!1155239 () Bool)

(assert (=> b!1254397 m!1155239))

(assert (=> b!1254397 m!1155177))

(assert (=> b!1254397 m!1155201))

(assert (=> b!1254397 m!1155201))

(assert (=> b!1254397 m!1155203))

(assert (=> b!1254397 m!1155205))

(assert (=> b!1254397 m!1155203))

(assert (=> b!1254273 d!138481))

(declare-fun bm!61747 () Bool)

(declare-fun call!61751 () Bool)

(declare-fun lt!566202 () ListLongMap!18481)

(assert (=> bm!61747 (= call!61751 (contains!7546 lt!566202 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61748 () Bool)

(declare-fun call!61755 () ListLongMap!18481)

(declare-fun call!61752 () ListLongMap!18481)

(assert (=> bm!61748 (= call!61755 call!61752)))

(declare-fun b!1254448 () Bool)

(declare-fun e!712703 () ListLongMap!18481)

(declare-fun call!61754 () ListLongMap!18481)

(assert (=> b!1254448 (= e!712703 (+!4197 call!61754 (tuple2!20601 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1254449 () Bool)

(declare-fun e!712707 () Bool)

(assert (=> b!1254449 (= e!712707 (validKeyInArray!0 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61749 () Bool)

(declare-fun call!61750 () ListLongMap!18481)

(assert (=> bm!61749 (= call!61750 call!61755)))

(declare-fun bm!61750 () Bool)

(declare-fun call!61756 () ListLongMap!18481)

(assert (=> bm!61750 (= call!61756 call!61754)))

(declare-fun b!1254450 () Bool)

(declare-fun e!712700 () Bool)

(declare-fun e!712702 () Bool)

(assert (=> b!1254450 (= e!712700 e!712702)))

(declare-fun res!836170 () Bool)

(assert (=> b!1254450 (= res!836170 call!61751)))

(assert (=> b!1254450 (=> (not res!836170) (not e!712702))))

(declare-fun b!1254451 () Bool)

(declare-fun e!712706 () Unit!41648)

(declare-fun lt!566193 () Unit!41648)

(assert (=> b!1254451 (= e!712706 lt!566193)))

(declare-fun lt!566210 () ListLongMap!18481)

(assert (=> b!1254451 (= lt!566210 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566196 () (_ BitVec 64))

(assert (=> b!1254451 (= lt!566196 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566209 () (_ BitVec 64))

(assert (=> b!1254451 (= lt!566209 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566203 () Unit!41648)

(declare-fun addStillContains!1085 (ListLongMap!18481 (_ BitVec 64) V!47735 (_ BitVec 64)) Unit!41648)

(assert (=> b!1254451 (= lt!566203 (addStillContains!1085 lt!566210 lt!566196 zeroValue!871 lt!566209))))

(assert (=> b!1254451 (contains!7546 (+!4197 lt!566210 (tuple2!20601 lt!566196 zeroValue!871)) lt!566209)))

(declare-fun lt!566191 () Unit!41648)

(assert (=> b!1254451 (= lt!566191 lt!566203)))

(declare-fun lt!566208 () ListLongMap!18481)

(assert (=> b!1254451 (= lt!566208 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566205 () (_ BitVec 64))

(assert (=> b!1254451 (= lt!566205 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566200 () (_ BitVec 64))

(assert (=> b!1254451 (= lt!566200 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566211 () Unit!41648)

(declare-fun addApplyDifferent!527 (ListLongMap!18481 (_ BitVec 64) V!47735 (_ BitVec 64)) Unit!41648)

(assert (=> b!1254451 (= lt!566211 (addApplyDifferent!527 lt!566208 lt!566205 minValueBefore!43 lt!566200))))

(assert (=> b!1254451 (= (apply!993 (+!4197 lt!566208 (tuple2!20601 lt!566205 minValueBefore!43)) lt!566200) (apply!993 lt!566208 lt!566200))))

(declare-fun lt!566198 () Unit!41648)

(assert (=> b!1254451 (= lt!566198 lt!566211)))

(declare-fun lt!566199 () ListLongMap!18481)

(assert (=> b!1254451 (= lt!566199 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566194 () (_ BitVec 64))

(assert (=> b!1254451 (= lt!566194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566204 () (_ BitVec 64))

(assert (=> b!1254451 (= lt!566204 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566197 () Unit!41648)

(assert (=> b!1254451 (= lt!566197 (addApplyDifferent!527 lt!566199 lt!566194 zeroValue!871 lt!566204))))

(assert (=> b!1254451 (= (apply!993 (+!4197 lt!566199 (tuple2!20601 lt!566194 zeroValue!871)) lt!566204) (apply!993 lt!566199 lt!566204))))

(declare-fun lt!566192 () Unit!41648)

(assert (=> b!1254451 (= lt!566192 lt!566197)))

(declare-fun lt!566201 () ListLongMap!18481)

(assert (=> b!1254451 (= lt!566201 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566212 () (_ BitVec 64))

(assert (=> b!1254451 (= lt!566212 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566207 () (_ BitVec 64))

(assert (=> b!1254451 (= lt!566207 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1254451 (= lt!566193 (addApplyDifferent!527 lt!566201 lt!566212 minValueBefore!43 lt!566207))))

(assert (=> b!1254451 (= (apply!993 (+!4197 lt!566201 (tuple2!20601 lt!566212 minValueBefore!43)) lt!566207) (apply!993 lt!566201 lt!566207))))

(declare-fun b!1254452 () Bool)

(assert (=> b!1254452 (= e!712700 (not call!61751))))

(declare-fun b!1254453 () Bool)

(declare-fun c!122693 () Bool)

(assert (=> b!1254453 (= c!122693 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!712708 () ListLongMap!18481)

(declare-fun e!712705 () ListLongMap!18481)

(assert (=> b!1254453 (= e!712708 e!712705)))

(declare-fun b!1254454 () Bool)

(declare-fun e!712710 () Bool)

(assert (=> b!1254454 (= e!712710 (= (apply!993 lt!566202 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1254455 () Bool)

(declare-fun res!836171 () Bool)

(declare-fun e!712699 () Bool)

(assert (=> b!1254455 (=> (not res!836171) (not e!712699))))

(declare-fun e!712701 () Bool)

(assert (=> b!1254455 (= res!836171 e!712701)))

(declare-fun c!122692 () Bool)

(assert (=> b!1254455 (= c!122692 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1254456 () Bool)

(declare-fun e!712709 () Bool)

(assert (=> b!1254456 (= e!712709 (validKeyInArray!0 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun e!712711 () Bool)

(declare-fun b!1254457 () Bool)

(assert (=> b!1254457 (= e!712711 (= (apply!993 lt!566202 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)) (get!20112 (select (arr!39188 _values!914) #b00000000000000000000000000000000) (dynLambda!3445 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1254457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39725 _values!914)))))

(assert (=> b!1254457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(declare-fun b!1254458 () Bool)

(assert (=> b!1254458 (= e!712703 e!712708)))

(declare-fun c!122694 () Bool)

(assert (=> b!1254458 (= c!122694 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254459 () Bool)

(assert (=> b!1254459 (= e!712705 call!61756)))

(declare-fun b!1254460 () Bool)

(assert (=> b!1254460 (= e!712701 e!712710)))

(declare-fun res!836169 () Bool)

(declare-fun call!61753 () Bool)

(assert (=> b!1254460 (= res!836169 call!61753)))

(assert (=> b!1254460 (=> (not res!836169) (not e!712710))))

(declare-fun b!1254461 () Bool)

(assert (=> b!1254461 (= e!712699 e!712700)))

(declare-fun c!122690 () Bool)

(assert (=> b!1254461 (= c!122690 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61751 () Bool)

(assert (=> bm!61751 (= call!61753 (contains!7546 lt!566202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1254462 () Bool)

(assert (=> b!1254462 (= e!712701 (not call!61753))))

(declare-fun b!1254463 () Bool)

(assert (=> b!1254463 (= e!712705 call!61750)))

(declare-fun bm!61752 () Bool)

(declare-fun c!122691 () Bool)

(assert (=> bm!61752 (= call!61754 (+!4197 (ite c!122691 call!61752 (ite c!122694 call!61755 call!61750)) (ite (or c!122691 c!122694) (tuple2!20601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20601 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1254464 () Bool)

(assert (=> b!1254464 (= e!712702 (= (apply!993 lt!566202 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1254465 () Bool)

(declare-fun Unit!41652 () Unit!41648)

(assert (=> b!1254465 (= e!712706 Unit!41652)))

(declare-fun d!138483 () Bool)

(assert (=> d!138483 e!712699))

(declare-fun res!836175 () Bool)

(assert (=> d!138483 (=> (not res!836175) (not e!712699))))

(assert (=> d!138483 (= res!836175 (or (bvsge #b00000000000000000000000000000000 (size!39724 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))))

(declare-fun lt!566206 () ListLongMap!18481)

(assert (=> d!138483 (= lt!566202 lt!566206)))

(declare-fun lt!566195 () Unit!41648)

(assert (=> d!138483 (= lt!566195 e!712706)))

(declare-fun c!122689 () Bool)

(assert (=> d!138483 (= c!122689 e!712707)))

(declare-fun res!836167 () Bool)

(assert (=> d!138483 (=> (not res!836167) (not e!712707))))

(assert (=> d!138483 (= res!836167 (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(assert (=> d!138483 (= lt!566206 e!712703)))

(assert (=> d!138483 (= c!122691 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138483 (validMask!0 mask!1466)))

(assert (=> d!138483 (= (getCurrentListMap!4494 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566202)))

(declare-fun bm!61753 () Bool)

(assert (=> bm!61753 (= call!61752 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254466 () Bool)

(declare-fun res!836174 () Bool)

(assert (=> b!1254466 (=> (not res!836174) (not e!712699))))

(declare-fun e!712704 () Bool)

(assert (=> b!1254466 (= res!836174 e!712704)))

(declare-fun res!836173 () Bool)

(assert (=> b!1254466 (=> res!836173 e!712704)))

(assert (=> b!1254466 (= res!836173 (not e!712709))))

(declare-fun res!836168 () Bool)

(assert (=> b!1254466 (=> (not res!836168) (not e!712709))))

(assert (=> b!1254466 (= res!836168 (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(declare-fun b!1254467 () Bool)

(assert (=> b!1254467 (= e!712708 call!61756)))

(declare-fun b!1254468 () Bool)

(assert (=> b!1254468 (= e!712704 e!712711)))

(declare-fun res!836172 () Bool)

(assert (=> b!1254468 (=> (not res!836172) (not e!712711))))

(assert (=> b!1254468 (= res!836172 (contains!7546 lt!566202 (select (arr!39187 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1254468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39724 _keys!1118)))))

(assert (= (and d!138483 c!122691) b!1254448))

(assert (= (and d!138483 (not c!122691)) b!1254458))

(assert (= (and b!1254458 c!122694) b!1254467))

(assert (= (and b!1254458 (not c!122694)) b!1254453))

(assert (= (and b!1254453 c!122693) b!1254459))

(assert (= (and b!1254453 (not c!122693)) b!1254463))

(assert (= (or b!1254459 b!1254463) bm!61749))

(assert (= (or b!1254467 bm!61749) bm!61748))

(assert (= (or b!1254467 b!1254459) bm!61750))

(assert (= (or b!1254448 bm!61748) bm!61753))

(assert (= (or b!1254448 bm!61750) bm!61752))

(assert (= (and d!138483 res!836167) b!1254449))

(assert (= (and d!138483 c!122689) b!1254451))

(assert (= (and d!138483 (not c!122689)) b!1254465))

(assert (= (and d!138483 res!836175) b!1254466))

(assert (= (and b!1254466 res!836168) b!1254456))

(assert (= (and b!1254466 (not res!836173)) b!1254468))

(assert (= (and b!1254468 res!836172) b!1254457))

(assert (= (and b!1254466 res!836174) b!1254455))

(assert (= (and b!1254455 c!122692) b!1254460))

(assert (= (and b!1254455 (not c!122692)) b!1254462))

(assert (= (and b!1254460 res!836169) b!1254454))

(assert (= (or b!1254460 b!1254462) bm!61751))

(assert (= (and b!1254455 res!836171) b!1254461))

(assert (= (and b!1254461 c!122690) b!1254450))

(assert (= (and b!1254461 (not c!122690)) b!1254452))

(assert (= (and b!1254450 res!836170) b!1254464))

(assert (= (or b!1254450 b!1254452) bm!61747))

(declare-fun b_lambda!22585 () Bool)

(assert (=> (not b_lambda!22585) (not b!1254457)))

(assert (=> b!1254457 t!41314))

(declare-fun b_and!44695 () Bool)

(assert (= b_and!44693 (and (=> t!41314 result!23285) b_and!44695)))

(declare-fun m!1155241 () Bool)

(assert (=> b!1254451 m!1155241))

(declare-fun m!1155243 () Bool)

(assert (=> b!1254451 m!1155243))

(assert (=> b!1254451 m!1155135))

(assert (=> b!1254451 m!1155177))

(declare-fun m!1155245 () Bool)

(assert (=> b!1254451 m!1155245))

(declare-fun m!1155247 () Bool)

(assert (=> b!1254451 m!1155247))

(declare-fun m!1155249 () Bool)

(assert (=> b!1254451 m!1155249))

(declare-fun m!1155251 () Bool)

(assert (=> b!1254451 m!1155251))

(assert (=> b!1254451 m!1155241))

(declare-fun m!1155253 () Bool)

(assert (=> b!1254451 m!1155253))

(declare-fun m!1155255 () Bool)

(assert (=> b!1254451 m!1155255))

(declare-fun m!1155257 () Bool)

(assert (=> b!1254451 m!1155257))

(declare-fun m!1155259 () Bool)

(assert (=> b!1254451 m!1155259))

(declare-fun m!1155261 () Bool)

(assert (=> b!1254451 m!1155261))

(assert (=> b!1254451 m!1155245))

(assert (=> b!1254451 m!1155243))

(declare-fun m!1155263 () Bool)

(assert (=> b!1254451 m!1155263))

(assert (=> b!1254451 m!1155249))

(declare-fun m!1155265 () Bool)

(assert (=> b!1254451 m!1155265))

(declare-fun m!1155267 () Bool)

(assert (=> b!1254451 m!1155267))

(declare-fun m!1155269 () Bool)

(assert (=> b!1254451 m!1155269))

(declare-fun m!1155271 () Bool)

(assert (=> b!1254448 m!1155271))

(assert (=> b!1254456 m!1155177))

(assert (=> b!1254456 m!1155177))

(assert (=> b!1254456 m!1155181))

(assert (=> d!138483 m!1155119))

(assert (=> b!1254468 m!1155177))

(assert (=> b!1254468 m!1155177))

(declare-fun m!1155273 () Bool)

(assert (=> b!1254468 m!1155273))

(declare-fun m!1155275 () Bool)

(assert (=> bm!61751 m!1155275))

(assert (=> bm!61753 m!1155135))

(declare-fun m!1155277 () Bool)

(assert (=> bm!61752 m!1155277))

(assert (=> b!1254449 m!1155177))

(assert (=> b!1254449 m!1155177))

(assert (=> b!1254449 m!1155181))

(declare-fun m!1155279 () Bool)

(assert (=> bm!61747 m!1155279))

(declare-fun m!1155281 () Bool)

(assert (=> b!1254454 m!1155281))

(declare-fun m!1155283 () Bool)

(assert (=> b!1254464 m!1155283))

(assert (=> b!1254457 m!1155177))

(assert (=> b!1254457 m!1155177))

(declare-fun m!1155285 () Bool)

(assert (=> b!1254457 m!1155285))

(assert (=> b!1254457 m!1155201))

(assert (=> b!1254457 m!1155203))

(assert (=> b!1254457 m!1155205))

(assert (=> b!1254457 m!1155201))

(assert (=> b!1254457 m!1155203))

(assert (=> b!1254274 d!138483))

(declare-fun condMapEmpty!49447 () Bool)

(declare-fun mapDefault!49447 () ValueCell!15125)

(assert (=> mapNonEmpty!49438 (= condMapEmpty!49447 (= mapRest!49438 ((as const (Array (_ BitVec 32) ValueCell!15125)) mapDefault!49447)))))

(declare-fun e!712717 () Bool)

(declare-fun mapRes!49447 () Bool)

(assert (=> mapNonEmpty!49438 (= tp!94127 (and e!712717 mapRes!49447))))

(declare-fun b!1254475 () Bool)

(declare-fun e!712716 () Bool)

(assert (=> b!1254475 (= e!712716 tp_is_empty!31777)))

(declare-fun mapIsEmpty!49447 () Bool)

(assert (=> mapIsEmpty!49447 mapRes!49447))

(declare-fun mapNonEmpty!49447 () Bool)

(declare-fun tp!94142 () Bool)

(assert (=> mapNonEmpty!49447 (= mapRes!49447 (and tp!94142 e!712716))))

(declare-fun mapKey!49447 () (_ BitVec 32))

(declare-fun mapValue!49447 () ValueCell!15125)

(declare-fun mapRest!49447 () (Array (_ BitVec 32) ValueCell!15125))

(assert (=> mapNonEmpty!49447 (= mapRest!49438 (store mapRest!49447 mapKey!49447 mapValue!49447))))

(declare-fun b!1254476 () Bool)

(assert (=> b!1254476 (= e!712717 tp_is_empty!31777)))

(assert (= (and mapNonEmpty!49438 condMapEmpty!49447) mapIsEmpty!49447))

(assert (= (and mapNonEmpty!49438 (not condMapEmpty!49447)) mapNonEmpty!49447))

(assert (= (and mapNonEmpty!49447 ((_ is ValueCellFull!15125) mapValue!49447)) b!1254475))

(assert (= (and mapNonEmpty!49438 ((_ is ValueCellFull!15125) mapDefault!49447)) b!1254476))

(declare-fun m!1155287 () Bool)

(assert (=> mapNonEmpty!49447 m!1155287))

(declare-fun b_lambda!22587 () Bool)

(assert (= b_lambda!22585 (or (and start!105366 b_free!26875) b_lambda!22587)))

(declare-fun b_lambda!22589 () Bool)

(assert (= b_lambda!22583 (or (and start!105366 b_free!26875) b_lambda!22589)))

(declare-fun b_lambda!22591 () Bool)

(assert (= b_lambda!22581 (or (and start!105366 b_free!26875) b_lambda!22591)))

(declare-fun b_lambda!22593 () Bool)

(assert (= b_lambda!22577 (or (and start!105366 b_free!26875) b_lambda!22593)))

(declare-fun b_lambda!22595 () Bool)

(assert (= b_lambda!22579 (or (and start!105366 b_free!26875) b_lambda!22595)))

(check-sat (not b!1254387) (not bm!61731) (not b!1254457) (not d!138477) (not b_lambda!22595) (not b!1254340) (not b_lambda!22593) (not b!1254456) (not bm!61728) (not b!1254352) (not b!1254448) (not b!1254468) (not b!1254343) (not b!1254385) (not b!1254404) (not d!138479) (not b!1254399) (not b!1254388) (not b!1254354) (not bm!61751) (not b!1254449) (not b!1254400) (not mapNonEmpty!49447) (not bm!61752) (not b_next!26875) b_and!44695 (not b_lambda!22591) (not b!1254395) (not bm!61732) (not d!138483) (not bm!61725) (not b!1254464) (not b_lambda!22589) (not b!1254454) (not b!1254390) (not b!1254389) (not b!1254403) (not b!1254397) (not b!1254381) (not b_lambda!22587) (not bm!61747) (not b!1254383) (not b!1254451) (not b!1254402) (not b!1254386) tp_is_empty!31777 (not b!1254401) (not bm!61753) (not b!1254342) (not d!138481))
(check-sat b_and!44695 (not b_next!26875))
