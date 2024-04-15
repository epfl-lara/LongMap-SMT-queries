; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105138 () Bool)

(assert start!105138)

(declare-fun b_free!26875 () Bool)

(declare-fun b_next!26875 () Bool)

(assert (=> start!105138 (= b_free!26875 (not b_next!26875))))

(declare-fun tp!94127 () Bool)

(declare-fun b_and!44661 () Bool)

(assert (=> start!105138 (= tp!94127 b_and!44661)))

(declare-fun b!1252886 () Bool)

(declare-fun res!835526 () Bool)

(declare-fun e!711693 () Bool)

(assert (=> b!1252886 (=> (not res!835526) (not e!711693))))

(declare-datatypes ((array!81139 0))(
  ( (array!81140 (arr!39133 (Array (_ BitVec 32) (_ BitVec 64))) (size!39671 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81139)

(declare-datatypes ((List!27884 0))(
  ( (Nil!27881) (Cons!27880 (h!29089 (_ BitVec 64)) (t!41354 List!27884)) )
))
(declare-fun arrayNoDuplicates!0 (array!81139 (_ BitVec 32) List!27884) Bool)

(assert (=> b!1252886 (= res!835526 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27881))))

(declare-fun b!1252887 () Bool)

(declare-fun e!711695 () Bool)

(assert (=> b!1252887 (= e!711693 (not e!711695))))

(declare-fun res!835527 () Bool)

(assert (=> b!1252887 (=> res!835527 e!711695)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252887 (= res!835527 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47735 0))(
  ( (V!47736 (val!15951 Int)) )
))
(declare-datatypes ((tuple2!20668 0))(
  ( (tuple2!20669 (_1!10345 (_ BitVec 64)) (_2!10345 V!47735)) )
))
(declare-datatypes ((List!27885 0))(
  ( (Nil!27882) (Cons!27881 (h!29090 tuple2!20668) (t!41355 List!27885)) )
))
(declare-datatypes ((ListLongMap!18541 0))(
  ( (ListLongMap!18542 (toList!9286 List!27885)) )
))
(declare-fun lt!565416 () ListLongMap!18541)

(declare-fun lt!565419 () ListLongMap!18541)

(assert (=> b!1252887 (= lt!565416 lt!565419)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47735)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47735)

(declare-datatypes ((ValueCell!15125 0))(
  ( (ValueCellFull!15125 (v!18648 V!47735)) (EmptyCell!15125) )
))
(declare-datatypes ((array!81141 0))(
  ( (array!81142 (arr!39134 (Array (_ BitVec 32) ValueCell!15125)) (size!39672 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81141)

(declare-fun minValueBefore!43 () V!47735)

(declare-datatypes ((Unit!41536 0))(
  ( (Unit!41537) )
))
(declare-fun lt!565417 () Unit!41536)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1011 (array!81139 array!81141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47735 V!47735 V!47735 V!47735 (_ BitVec 32) Int) Unit!41536)

(assert (=> b!1252887 (= lt!565417 (lemmaNoChangeToArrayThenSameMapNoExtras!1011 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5689 (array!81139 array!81141 (_ BitVec 32) (_ BitVec 32) V!47735 V!47735 (_ BitVec 32) Int) ListLongMap!18541)

(assert (=> b!1252887 (= lt!565419 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252887 (= lt!565416 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835523 () Bool)

(assert (=> start!105138 (=> (not res!835523) (not e!711693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105138 (= res!835523 (validMask!0 mask!1466))))

(assert (=> start!105138 e!711693))

(assert (=> start!105138 true))

(assert (=> start!105138 tp!94127))

(declare-fun tp_is_empty!31777 () Bool)

(assert (=> start!105138 tp_is_empty!31777))

(declare-fun array_inv!29965 (array!81139) Bool)

(assert (=> start!105138 (array_inv!29965 _keys!1118)))

(declare-fun e!711690 () Bool)

(declare-fun array_inv!29966 (array!81141) Bool)

(assert (=> start!105138 (and (array_inv!29966 _values!914) e!711690)))

(declare-fun b!1252888 () Bool)

(declare-fun e!711691 () Bool)

(assert (=> b!1252888 (= e!711691 tp_is_empty!31777)))

(declare-fun b!1252889 () Bool)

(declare-fun e!711692 () Bool)

(assert (=> b!1252889 (= e!711692 tp_is_empty!31777)))

(declare-fun mapIsEmpty!49438 () Bool)

(declare-fun mapRes!49438 () Bool)

(assert (=> mapIsEmpty!49438 mapRes!49438))

(declare-fun b!1252890 () Bool)

(assert (=> b!1252890 (= e!711690 (and e!711691 mapRes!49438))))

(declare-fun condMapEmpty!49438 () Bool)

(declare-fun mapDefault!49438 () ValueCell!15125)

(assert (=> b!1252890 (= condMapEmpty!49438 (= (arr!39134 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15125)) mapDefault!49438)))))

(declare-fun b!1252891 () Bool)

(declare-fun res!835525 () Bool)

(assert (=> b!1252891 (=> (not res!835525) (not e!711693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81139 (_ BitVec 32)) Bool)

(assert (=> b!1252891 (= res!835525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49438 () Bool)

(declare-fun tp!94126 () Bool)

(assert (=> mapNonEmpty!49438 (= mapRes!49438 (and tp!94126 e!711692))))

(declare-fun mapValue!49438 () ValueCell!15125)

(declare-fun mapKey!49438 () (_ BitVec 32))

(declare-fun mapRest!49438 () (Array (_ BitVec 32) ValueCell!15125))

(assert (=> mapNonEmpty!49438 (= (arr!39134 _values!914) (store mapRest!49438 mapKey!49438 mapValue!49438))))

(declare-fun b!1252892 () Bool)

(assert (=> b!1252892 (= e!711695 (bvsle #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun lt!565418 () ListLongMap!18541)

(declare-fun getCurrentListMap!4424 (array!81139 array!81141 (_ BitVec 32) (_ BitVec 32) V!47735 V!47735 (_ BitVec 32) Int) ListLongMap!18541)

(assert (=> b!1252892 (= lt!565418 (getCurrentListMap!4424 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252893 () Bool)

(declare-fun res!835524 () Bool)

(assert (=> b!1252893 (=> (not res!835524) (not e!711693))))

(assert (=> b!1252893 (= res!835524 (and (= (size!39672 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39671 _keys!1118) (size!39672 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105138 res!835523) b!1252893))

(assert (= (and b!1252893 res!835524) b!1252891))

(assert (= (and b!1252891 res!835525) b!1252886))

(assert (= (and b!1252886 res!835526) b!1252887))

(assert (= (and b!1252887 (not res!835527)) b!1252892))

(assert (= (and b!1252890 condMapEmpty!49438) mapIsEmpty!49438))

(assert (= (and b!1252890 (not condMapEmpty!49438)) mapNonEmpty!49438))

(get-info :version)

(assert (= (and mapNonEmpty!49438 ((_ is ValueCellFull!15125) mapValue!49438)) b!1252889))

(assert (= (and b!1252890 ((_ is ValueCellFull!15125) mapDefault!49438)) b!1252888))

(assert (= start!105138 b!1252890))

(declare-fun m!1152985 () Bool)

(assert (=> b!1252886 m!1152985))

(declare-fun m!1152987 () Bool)

(assert (=> b!1252887 m!1152987))

(declare-fun m!1152989 () Bool)

(assert (=> b!1252887 m!1152989))

(declare-fun m!1152991 () Bool)

(assert (=> b!1252887 m!1152991))

(declare-fun m!1152993 () Bool)

(assert (=> b!1252891 m!1152993))

(declare-fun m!1152995 () Bool)

(assert (=> b!1252892 m!1152995))

(declare-fun m!1152997 () Bool)

(assert (=> start!105138 m!1152997))

(declare-fun m!1152999 () Bool)

(assert (=> start!105138 m!1152999))

(declare-fun m!1153001 () Bool)

(assert (=> start!105138 m!1153001))

(declare-fun m!1153003 () Bool)

(assert (=> mapNonEmpty!49438 m!1153003))

(check-sat (not mapNonEmpty!49438) (not start!105138) tp_is_empty!31777 (not b!1252887) b_and!44661 (not b!1252886) (not b!1252891) (not b_next!26875) (not b!1252892))
(check-sat b_and!44661 (not b_next!26875))
(get-model)

(declare-fun d!137887 () Bool)

(assert (=> d!137887 (= (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565446 () Unit!41536)

(declare-fun choose!1861 (array!81139 array!81141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47735 V!47735 V!47735 V!47735 (_ BitVec 32) Int) Unit!41536)

(assert (=> d!137887 (= lt!565446 (choose!1861 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137887 (validMask!0 mask!1466)))

(assert (=> d!137887 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1011 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565446)))

(declare-fun bs!35367 () Bool)

(assert (= bs!35367 d!137887))

(assert (=> bs!35367 m!1152991))

(assert (=> bs!35367 m!1152989))

(declare-fun m!1153045 () Bool)

(assert (=> bs!35367 m!1153045))

(assert (=> bs!35367 m!1152997))

(assert (=> b!1252887 d!137887))

(declare-fun b!1252966 () Bool)

(declare-fun e!711750 () Bool)

(declare-fun lt!565461 () ListLongMap!18541)

(declare-fun isEmpty!1032 (ListLongMap!18541) Bool)

(assert (=> b!1252966 (= e!711750 (isEmpty!1032 lt!565461))))

(declare-fun b!1252967 () Bool)

(declare-fun e!711749 () Bool)

(declare-fun e!711746 () Bool)

(assert (=> b!1252967 (= e!711749 e!711746)))

(assert (=> b!1252967 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun res!835566 () Bool)

(declare-fun contains!7488 (ListLongMap!18541 (_ BitVec 64)) Bool)

(assert (=> b!1252967 (= res!835566 (contains!7488 lt!565461 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252967 (=> (not res!835566) (not e!711746))))

(declare-fun b!1252968 () Bool)

(declare-fun e!711747 () Bool)

(assert (=> b!1252968 (= e!711747 e!711749)))

(declare-fun c!122246 () Bool)

(declare-fun e!711752 () Bool)

(assert (=> b!1252968 (= c!122246 e!711752)))

(declare-fun res!835568 () Bool)

(assert (=> b!1252968 (=> (not res!835568) (not e!711752))))

(assert (=> b!1252968 (= res!835568 (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun d!137889 () Bool)

(assert (=> d!137889 e!711747))

(declare-fun res!835567 () Bool)

(assert (=> d!137889 (=> (not res!835567) (not e!711747))))

(assert (=> d!137889 (= res!835567 (not (contains!7488 lt!565461 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!711751 () ListLongMap!18541)

(assert (=> d!137889 (= lt!565461 e!711751)))

(declare-fun c!122245 () Bool)

(assert (=> d!137889 (= c!122245 (bvsge #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(assert (=> d!137889 (validMask!0 mask!1466)))

(assert (=> d!137889 (= (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565461)))

(declare-fun b!1252969 () Bool)

(declare-fun e!711748 () ListLongMap!18541)

(declare-fun call!61644 () ListLongMap!18541)

(assert (=> b!1252969 (= e!711748 call!61644)))

(declare-fun bm!61641 () Bool)

(assert (=> bm!61641 (= call!61644 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1252970 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1252970 (= e!711752 (validKeyInArray!0 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252970 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1252971 () Bool)

(declare-fun res!835569 () Bool)

(assert (=> b!1252971 (=> (not res!835569) (not e!711747))))

(assert (=> b!1252971 (= res!835569 (not (contains!7488 lt!565461 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1252972 () Bool)

(assert (=> b!1252972 (= e!711751 e!711748)))

(declare-fun c!122248 () Bool)

(assert (=> b!1252972 (= c!122248 (validKeyInArray!0 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252973 () Bool)

(assert (=> b!1252973 (= e!711750 (= lt!565461 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1252974 () Bool)

(assert (=> b!1252974 (= e!711749 e!711750)))

(declare-fun c!122247 () Bool)

(assert (=> b!1252974 (= c!122247 (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun b!1252975 () Bool)

(assert (=> b!1252975 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(assert (=> b!1252975 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39672 _values!914)))))

(declare-fun apply!977 (ListLongMap!18541 (_ BitVec 64)) V!47735)

(declare-fun get!20062 (ValueCell!15125 V!47735) V!47735)

(declare-fun dynLambda!3407 (Int (_ BitVec 64)) V!47735)

(assert (=> b!1252975 (= e!711746 (= (apply!977 lt!565461 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)) (get!20062 (select (arr!39134 _values!914) #b00000000000000000000000000000000) (dynLambda!3407 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1252976 () Bool)

(assert (=> b!1252976 (= e!711751 (ListLongMap!18542 Nil!27882))))

(declare-fun b!1252977 () Bool)

(declare-fun lt!565463 () Unit!41536)

(declare-fun lt!565467 () Unit!41536)

(assert (=> b!1252977 (= lt!565463 lt!565467)))

(declare-fun lt!565466 () (_ BitVec 64))

(declare-fun lt!565462 () (_ BitVec 64))

(declare-fun lt!565464 () V!47735)

(declare-fun lt!565465 () ListLongMap!18541)

(declare-fun +!4188 (ListLongMap!18541 tuple2!20668) ListLongMap!18541)

(assert (=> b!1252977 (not (contains!7488 (+!4188 lt!565465 (tuple2!20669 lt!565466 lt!565464)) lt!565462))))

(declare-fun addStillNotContains!313 (ListLongMap!18541 (_ BitVec 64) V!47735 (_ BitVec 64)) Unit!41536)

(assert (=> b!1252977 (= lt!565467 (addStillNotContains!313 lt!565465 lt!565466 lt!565464 lt!565462))))

(assert (=> b!1252977 (= lt!565462 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1252977 (= lt!565464 (get!20062 (select (arr!39134 _values!914) #b00000000000000000000000000000000) (dynLambda!3407 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1252977 (= lt!565466 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252977 (= lt!565465 call!61644)))

(assert (=> b!1252977 (= e!711748 (+!4188 call!61644 (tuple2!20669 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000) (get!20062 (select (arr!39134 _values!914) #b00000000000000000000000000000000) (dynLambda!3407 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!137889 c!122245) b!1252976))

(assert (= (and d!137889 (not c!122245)) b!1252972))

(assert (= (and b!1252972 c!122248) b!1252977))

(assert (= (and b!1252972 (not c!122248)) b!1252969))

(assert (= (or b!1252977 b!1252969) bm!61641))

(assert (= (and d!137889 res!835567) b!1252971))

(assert (= (and b!1252971 res!835569) b!1252968))

(assert (= (and b!1252968 res!835568) b!1252970))

(assert (= (and b!1252968 c!122246) b!1252967))

(assert (= (and b!1252968 (not c!122246)) b!1252974))

(assert (= (and b!1252967 res!835566) b!1252975))

(assert (= (and b!1252974 c!122247) b!1252973))

(assert (= (and b!1252974 (not c!122247)) b!1252966))

(declare-fun b_lambda!22573 () Bool)

(assert (=> (not b_lambda!22573) (not b!1252975)))

(declare-fun t!41359 () Bool)

(declare-fun tb!11287 () Bool)

(assert (=> (and start!105138 (= defaultEntry!922 defaultEntry!922) t!41359) tb!11287))

(declare-fun result!23285 () Bool)

(assert (=> tb!11287 (= result!23285 tp_is_empty!31777)))

(assert (=> b!1252975 t!41359))

(declare-fun b_and!44667 () Bool)

(assert (= b_and!44661 (and (=> t!41359 result!23285) b_and!44667)))

(declare-fun b_lambda!22575 () Bool)

(assert (=> (not b_lambda!22575) (not b!1252977)))

(assert (=> b!1252977 t!41359))

(declare-fun b_and!44669 () Bool)

(assert (= b_and!44667 (and (=> t!41359 result!23285) b_and!44669)))

(declare-fun m!1153047 () Bool)

(assert (=> b!1252977 m!1153047))

(declare-fun m!1153049 () Bool)

(assert (=> b!1252977 m!1153049))

(declare-fun m!1153051 () Bool)

(assert (=> b!1252977 m!1153051))

(declare-fun m!1153053 () Bool)

(assert (=> b!1252977 m!1153053))

(assert (=> b!1252977 m!1153053))

(assert (=> b!1252977 m!1153049))

(declare-fun m!1153055 () Bool)

(assert (=> b!1252977 m!1153055))

(declare-fun m!1153057 () Bool)

(assert (=> b!1252977 m!1153057))

(declare-fun m!1153059 () Bool)

(assert (=> b!1252977 m!1153059))

(assert (=> b!1252977 m!1153051))

(declare-fun m!1153061 () Bool)

(assert (=> b!1252977 m!1153061))

(assert (=> b!1252972 m!1153059))

(assert (=> b!1252972 m!1153059))

(declare-fun m!1153063 () Bool)

(assert (=> b!1252972 m!1153063))

(assert (=> b!1252975 m!1153049))

(assert (=> b!1252975 m!1153059))

(assert (=> b!1252975 m!1153059))

(declare-fun m!1153065 () Bool)

(assert (=> b!1252975 m!1153065))

(assert (=> b!1252975 m!1153053))

(assert (=> b!1252975 m!1153053))

(assert (=> b!1252975 m!1153049))

(assert (=> b!1252975 m!1153055))

(declare-fun m!1153067 () Bool)

(assert (=> b!1252966 m!1153067))

(assert (=> b!1252967 m!1153059))

(assert (=> b!1252967 m!1153059))

(declare-fun m!1153069 () Bool)

(assert (=> b!1252967 m!1153069))

(declare-fun m!1153071 () Bool)

(assert (=> b!1252973 m!1153071))

(declare-fun m!1153073 () Bool)

(assert (=> b!1252971 m!1153073))

(assert (=> b!1252970 m!1153059))

(assert (=> b!1252970 m!1153059))

(assert (=> b!1252970 m!1153063))

(assert (=> bm!61641 m!1153071))

(declare-fun m!1153075 () Bool)

(assert (=> d!137889 m!1153075))

(assert (=> d!137889 m!1152997))

(assert (=> b!1252887 d!137889))

(declare-fun b!1252980 () Bool)

(declare-fun e!711757 () Bool)

(declare-fun lt!565468 () ListLongMap!18541)

(assert (=> b!1252980 (= e!711757 (isEmpty!1032 lt!565468))))

(declare-fun b!1252981 () Bool)

(declare-fun e!711756 () Bool)

(declare-fun e!711753 () Bool)

(assert (=> b!1252981 (= e!711756 e!711753)))

(assert (=> b!1252981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun res!835570 () Bool)

(assert (=> b!1252981 (= res!835570 (contains!7488 lt!565468 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252981 (=> (not res!835570) (not e!711753))))

(declare-fun b!1252982 () Bool)

(declare-fun e!711754 () Bool)

(assert (=> b!1252982 (= e!711754 e!711756)))

(declare-fun c!122250 () Bool)

(declare-fun e!711759 () Bool)

(assert (=> b!1252982 (= c!122250 e!711759)))

(declare-fun res!835572 () Bool)

(assert (=> b!1252982 (=> (not res!835572) (not e!711759))))

(assert (=> b!1252982 (= res!835572 (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun d!137891 () Bool)

(assert (=> d!137891 e!711754))

(declare-fun res!835571 () Bool)

(assert (=> d!137891 (=> (not res!835571) (not e!711754))))

(assert (=> d!137891 (= res!835571 (not (contains!7488 lt!565468 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!711758 () ListLongMap!18541)

(assert (=> d!137891 (= lt!565468 e!711758)))

(declare-fun c!122249 () Bool)

(assert (=> d!137891 (= c!122249 (bvsge #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(assert (=> d!137891 (validMask!0 mask!1466)))

(assert (=> d!137891 (= (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565468)))

(declare-fun b!1252983 () Bool)

(declare-fun e!711755 () ListLongMap!18541)

(declare-fun call!61645 () ListLongMap!18541)

(assert (=> b!1252983 (= e!711755 call!61645)))

(declare-fun bm!61642 () Bool)

(assert (=> bm!61642 (= call!61645 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1252984 () Bool)

(assert (=> b!1252984 (= e!711759 (validKeyInArray!0 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252984 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1252985 () Bool)

(declare-fun res!835573 () Bool)

(assert (=> b!1252985 (=> (not res!835573) (not e!711754))))

(assert (=> b!1252985 (= res!835573 (not (contains!7488 lt!565468 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1252986 () Bool)

(assert (=> b!1252986 (= e!711758 e!711755)))

(declare-fun c!122252 () Bool)

(assert (=> b!1252986 (= c!122252 (validKeyInArray!0 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252987 () Bool)

(assert (=> b!1252987 (= e!711757 (= lt!565468 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1252988 () Bool)

(assert (=> b!1252988 (= e!711756 e!711757)))

(declare-fun c!122251 () Bool)

(assert (=> b!1252988 (= c!122251 (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun b!1252989 () Bool)

(assert (=> b!1252989 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(assert (=> b!1252989 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39672 _values!914)))))

(assert (=> b!1252989 (= e!711753 (= (apply!977 lt!565468 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)) (get!20062 (select (arr!39134 _values!914) #b00000000000000000000000000000000) (dynLambda!3407 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1252990 () Bool)

(assert (=> b!1252990 (= e!711758 (ListLongMap!18542 Nil!27882))))

(declare-fun b!1252991 () Bool)

(declare-fun lt!565470 () Unit!41536)

(declare-fun lt!565474 () Unit!41536)

(assert (=> b!1252991 (= lt!565470 lt!565474)))

(declare-fun lt!565469 () (_ BitVec 64))

(declare-fun lt!565471 () V!47735)

(declare-fun lt!565472 () ListLongMap!18541)

(declare-fun lt!565473 () (_ BitVec 64))

(assert (=> b!1252991 (not (contains!7488 (+!4188 lt!565472 (tuple2!20669 lt!565473 lt!565471)) lt!565469))))

(assert (=> b!1252991 (= lt!565474 (addStillNotContains!313 lt!565472 lt!565473 lt!565471 lt!565469))))

(assert (=> b!1252991 (= lt!565469 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1252991 (= lt!565471 (get!20062 (select (arr!39134 _values!914) #b00000000000000000000000000000000) (dynLambda!3407 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1252991 (= lt!565473 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252991 (= lt!565472 call!61645)))

(assert (=> b!1252991 (= e!711755 (+!4188 call!61645 (tuple2!20669 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000) (get!20062 (select (arr!39134 _values!914) #b00000000000000000000000000000000) (dynLambda!3407 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!137891 c!122249) b!1252990))

(assert (= (and d!137891 (not c!122249)) b!1252986))

(assert (= (and b!1252986 c!122252) b!1252991))

(assert (= (and b!1252986 (not c!122252)) b!1252983))

(assert (= (or b!1252991 b!1252983) bm!61642))

(assert (= (and d!137891 res!835571) b!1252985))

(assert (= (and b!1252985 res!835573) b!1252982))

(assert (= (and b!1252982 res!835572) b!1252984))

(assert (= (and b!1252982 c!122250) b!1252981))

(assert (= (and b!1252982 (not c!122250)) b!1252988))

(assert (= (and b!1252981 res!835570) b!1252989))

(assert (= (and b!1252988 c!122251) b!1252987))

(assert (= (and b!1252988 (not c!122251)) b!1252980))

(declare-fun b_lambda!22577 () Bool)

(assert (=> (not b_lambda!22577) (not b!1252989)))

(assert (=> b!1252989 t!41359))

(declare-fun b_and!44671 () Bool)

(assert (= b_and!44669 (and (=> t!41359 result!23285) b_and!44671)))

(declare-fun b_lambda!22579 () Bool)

(assert (=> (not b_lambda!22579) (not b!1252991)))

(assert (=> b!1252991 t!41359))

(declare-fun b_and!44673 () Bool)

(assert (= b_and!44671 (and (=> t!41359 result!23285) b_and!44673)))

(declare-fun m!1153077 () Bool)

(assert (=> b!1252991 m!1153077))

(assert (=> b!1252991 m!1153049))

(declare-fun m!1153079 () Bool)

(assert (=> b!1252991 m!1153079))

(assert (=> b!1252991 m!1153053))

(assert (=> b!1252991 m!1153053))

(assert (=> b!1252991 m!1153049))

(assert (=> b!1252991 m!1153055))

(declare-fun m!1153081 () Bool)

(assert (=> b!1252991 m!1153081))

(assert (=> b!1252991 m!1153059))

(assert (=> b!1252991 m!1153079))

(declare-fun m!1153083 () Bool)

(assert (=> b!1252991 m!1153083))

(assert (=> b!1252986 m!1153059))

(assert (=> b!1252986 m!1153059))

(assert (=> b!1252986 m!1153063))

(assert (=> b!1252989 m!1153049))

(assert (=> b!1252989 m!1153059))

(assert (=> b!1252989 m!1153059))

(declare-fun m!1153085 () Bool)

(assert (=> b!1252989 m!1153085))

(assert (=> b!1252989 m!1153053))

(assert (=> b!1252989 m!1153053))

(assert (=> b!1252989 m!1153049))

(assert (=> b!1252989 m!1153055))

(declare-fun m!1153087 () Bool)

(assert (=> b!1252980 m!1153087))

(assert (=> b!1252981 m!1153059))

(assert (=> b!1252981 m!1153059))

(declare-fun m!1153089 () Bool)

(assert (=> b!1252981 m!1153089))

(declare-fun m!1153091 () Bool)

(assert (=> b!1252987 m!1153091))

(declare-fun m!1153093 () Bool)

(assert (=> b!1252985 m!1153093))

(assert (=> b!1252984 m!1153059))

(assert (=> b!1252984 m!1153059))

(assert (=> b!1252984 m!1153063))

(assert (=> bm!61642 m!1153091))

(declare-fun m!1153095 () Bool)

(assert (=> d!137891 m!1153095))

(assert (=> d!137891 m!1152997))

(assert (=> b!1252887 d!137891))

(declare-fun bm!61645 () Bool)

(declare-fun call!61648 () Bool)

(assert (=> bm!61645 (= call!61648 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!137893 () Bool)

(declare-fun res!835578 () Bool)

(declare-fun e!711766 () Bool)

(assert (=> d!137893 (=> res!835578 e!711766)))

(assert (=> d!137893 (= res!835578 (bvsge #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(assert (=> d!137893 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!711766)))

(declare-fun b!1253000 () Bool)

(declare-fun e!711768 () Bool)

(assert (=> b!1253000 (= e!711768 call!61648)))

(declare-fun b!1253001 () Bool)

(assert (=> b!1253001 (= e!711766 e!711768)))

(declare-fun c!122255 () Bool)

(assert (=> b!1253001 (= c!122255 (validKeyInArray!0 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253002 () Bool)

(declare-fun e!711767 () Bool)

(assert (=> b!1253002 (= e!711767 call!61648)))

(declare-fun b!1253003 () Bool)

(assert (=> b!1253003 (= e!711768 e!711767)))

(declare-fun lt!565482 () (_ BitVec 64))

(assert (=> b!1253003 (= lt!565482 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565481 () Unit!41536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81139 (_ BitVec 64) (_ BitVec 32)) Unit!41536)

(assert (=> b!1253003 (= lt!565481 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!565482 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1253003 (arrayContainsKey!0 _keys!1118 lt!565482 #b00000000000000000000000000000000)))

(declare-fun lt!565483 () Unit!41536)

(assert (=> b!1253003 (= lt!565483 lt!565481)))

(declare-fun res!835579 () Bool)

(declare-datatypes ((SeekEntryResult!9961 0))(
  ( (MissingZero!9961 (index!42215 (_ BitVec 32))) (Found!9961 (index!42216 (_ BitVec 32))) (Intermediate!9961 (undefined!10773 Bool) (index!42217 (_ BitVec 32)) (x!110277 (_ BitVec 32))) (Undefined!9961) (MissingVacant!9961 (index!42218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81139 (_ BitVec 32)) SeekEntryResult!9961)

(assert (=> b!1253003 (= res!835579 (= (seekEntryOrOpen!0 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9961 #b00000000000000000000000000000000)))))

(assert (=> b!1253003 (=> (not res!835579) (not e!711767))))

(assert (= (and d!137893 (not res!835578)) b!1253001))

(assert (= (and b!1253001 c!122255) b!1253003))

(assert (= (and b!1253001 (not c!122255)) b!1253000))

(assert (= (and b!1253003 res!835579) b!1253002))

(assert (= (or b!1253002 b!1253000) bm!61645))

(declare-fun m!1153097 () Bool)

(assert (=> bm!61645 m!1153097))

(assert (=> b!1253001 m!1153059))

(assert (=> b!1253001 m!1153059))

(assert (=> b!1253001 m!1153063))

(assert (=> b!1253003 m!1153059))

(declare-fun m!1153099 () Bool)

(assert (=> b!1253003 m!1153099))

(declare-fun m!1153101 () Bool)

(assert (=> b!1253003 m!1153101))

(assert (=> b!1253003 m!1153059))

(declare-fun m!1153103 () Bool)

(assert (=> b!1253003 m!1153103))

(assert (=> b!1252891 d!137893))

(declare-fun b!1253014 () Bool)

(declare-fun e!711780 () Bool)

(declare-fun call!61651 () Bool)

(assert (=> b!1253014 (= e!711780 call!61651)))

(declare-fun b!1253015 () Bool)

(declare-fun e!711778 () Bool)

(declare-fun e!711777 () Bool)

(assert (=> b!1253015 (= e!711778 e!711777)))

(declare-fun res!835588 () Bool)

(assert (=> b!1253015 (=> (not res!835588) (not e!711777))))

(declare-fun e!711779 () Bool)

(assert (=> b!1253015 (= res!835588 (not e!711779))))

(declare-fun res!835587 () Bool)

(assert (=> b!1253015 (=> (not res!835587) (not e!711779))))

(assert (=> b!1253015 (= res!835587 (validKeyInArray!0 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137895 () Bool)

(declare-fun res!835586 () Bool)

(assert (=> d!137895 (=> res!835586 e!711778)))

(assert (=> d!137895 (= res!835586 (bvsge #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(assert (=> d!137895 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27881) e!711778)))

(declare-fun b!1253016 () Bool)

(assert (=> b!1253016 (= e!711780 call!61651)))

(declare-fun b!1253017 () Bool)

(assert (=> b!1253017 (= e!711777 e!711780)))

(declare-fun c!122258 () Bool)

(assert (=> b!1253017 (= c!122258 (validKeyInArray!0 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253018 () Bool)

(declare-fun contains!7489 (List!27884 (_ BitVec 64)) Bool)

(assert (=> b!1253018 (= e!711779 (contains!7489 Nil!27881 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61648 () Bool)

(assert (=> bm!61648 (= call!61651 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122258 (Cons!27880 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000) Nil!27881) Nil!27881)))))

(assert (= (and d!137895 (not res!835586)) b!1253015))

(assert (= (and b!1253015 res!835587) b!1253018))

(assert (= (and b!1253015 res!835588) b!1253017))

(assert (= (and b!1253017 c!122258) b!1253014))

(assert (= (and b!1253017 (not c!122258)) b!1253016))

(assert (= (or b!1253014 b!1253016) bm!61648))

(assert (=> b!1253015 m!1153059))

(assert (=> b!1253015 m!1153059))

(assert (=> b!1253015 m!1153063))

(assert (=> b!1253017 m!1153059))

(assert (=> b!1253017 m!1153059))

(assert (=> b!1253017 m!1153063))

(assert (=> b!1253018 m!1153059))

(assert (=> b!1253018 m!1153059))

(declare-fun m!1153105 () Bool)

(assert (=> b!1253018 m!1153105))

(assert (=> bm!61648 m!1153059))

(declare-fun m!1153107 () Bool)

(assert (=> bm!61648 m!1153107))

(assert (=> b!1252886 d!137895))

(declare-fun d!137897 () Bool)

(assert (=> d!137897 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105138 d!137897))

(declare-fun d!137899 () Bool)

(assert (=> d!137899 (= (array_inv!29965 _keys!1118) (bvsge (size!39671 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105138 d!137899))

(declare-fun d!137901 () Bool)

(assert (=> d!137901 (= (array_inv!29966 _values!914) (bvsge (size!39672 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105138 d!137901))

(declare-fun b!1253061 () Bool)

(declare-fun e!711815 () Bool)

(declare-fun e!711817 () Bool)

(assert (=> b!1253061 (= e!711815 e!711817)))

(declare-fun res!835615 () Bool)

(declare-fun call!61667 () Bool)

(assert (=> b!1253061 (= res!835615 call!61667)))

(assert (=> b!1253061 (=> (not res!835615) (not e!711817))))

(declare-fun b!1253062 () Bool)

(declare-fun e!711814 () ListLongMap!18541)

(declare-fun call!61671 () ListLongMap!18541)

(assert (=> b!1253062 (= e!711814 call!61671)))

(declare-fun b!1253063 () Bool)

(declare-fun lt!565545 () ListLongMap!18541)

(assert (=> b!1253063 (= e!711817 (= (apply!977 lt!565545 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1253064 () Bool)

(declare-fun e!711811 () Bool)

(assert (=> b!1253064 (= e!711811 (validKeyInArray!0 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253065 () Bool)

(declare-fun e!711818 () Bool)

(declare-fun e!711809 () Bool)

(assert (=> b!1253065 (= e!711818 e!711809)))

(declare-fun res!835608 () Bool)

(assert (=> b!1253065 (=> (not res!835608) (not e!711809))))

(assert (=> b!1253065 (= res!835608 (contains!7488 lt!565545 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun b!1253066 () Bool)

(assert (=> b!1253066 (= e!711809 (= (apply!977 lt!565545 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)) (get!20062 (select (arr!39134 _values!914) #b00000000000000000000000000000000) (dynLambda!3407 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1253066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39672 _values!914)))))

(assert (=> b!1253066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun bm!61663 () Bool)

(declare-fun call!61672 () ListLongMap!18541)

(assert (=> bm!61663 (= call!61671 call!61672)))

(declare-fun b!1253067 () Bool)

(declare-fun res!835610 () Bool)

(declare-fun e!711819 () Bool)

(assert (=> b!1253067 (=> (not res!835610) (not e!711819))))

(assert (=> b!1253067 (= res!835610 e!711818)))

(declare-fun res!835609 () Bool)

(assert (=> b!1253067 (=> res!835609 e!711818)))

(declare-fun e!711808 () Bool)

(assert (=> b!1253067 (= res!835609 (not e!711808))))

(declare-fun res!835614 () Bool)

(assert (=> b!1253067 (=> (not res!835614) (not e!711808))))

(assert (=> b!1253067 (= res!835614 (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun b!1253068 () Bool)

(declare-fun e!711807 () ListLongMap!18541)

(assert (=> b!1253068 (= e!711807 call!61671)))

(declare-fun bm!61664 () Bool)

(declare-fun call!61669 () ListLongMap!18541)

(declare-fun call!61666 () ListLongMap!18541)

(assert (=> bm!61664 (= call!61669 call!61666)))

(declare-fun call!61668 () ListLongMap!18541)

(declare-fun c!122272 () Bool)

(declare-fun bm!61665 () Bool)

(declare-fun c!122274 () Bool)

(assert (=> bm!61665 (= call!61672 (+!4188 (ite c!122272 call!61666 (ite c!122274 call!61669 call!61668)) (ite (or c!122272 c!122274) (tuple2!20669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20669 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1253070 () Bool)

(assert (=> b!1253070 (= e!711808 (validKeyInArray!0 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253071 () Bool)

(declare-fun e!711816 () Unit!41536)

(declare-fun lt!565546 () Unit!41536)

(assert (=> b!1253071 (= e!711816 lt!565546)))

(declare-fun lt!565530 () ListLongMap!18541)

(assert (=> b!1253071 (= lt!565530 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565541 () (_ BitVec 64))

(assert (=> b!1253071 (= lt!565541 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565534 () (_ BitVec 64))

(assert (=> b!1253071 (= lt!565534 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565528 () Unit!41536)

(declare-fun addStillContains!1077 (ListLongMap!18541 (_ BitVec 64) V!47735 (_ BitVec 64)) Unit!41536)

(assert (=> b!1253071 (= lt!565528 (addStillContains!1077 lt!565530 lt!565541 zeroValue!871 lt!565534))))

(assert (=> b!1253071 (contains!7488 (+!4188 lt!565530 (tuple2!20669 lt!565541 zeroValue!871)) lt!565534)))

(declare-fun lt!565532 () Unit!41536)

(assert (=> b!1253071 (= lt!565532 lt!565528)))

(declare-fun lt!565542 () ListLongMap!18541)

(assert (=> b!1253071 (= lt!565542 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565533 () (_ BitVec 64))

(assert (=> b!1253071 (= lt!565533 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565535 () (_ BitVec 64))

(assert (=> b!1253071 (= lt!565535 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565549 () Unit!41536)

(declare-fun addApplyDifferent!520 (ListLongMap!18541 (_ BitVec 64) V!47735 (_ BitVec 64)) Unit!41536)

(assert (=> b!1253071 (= lt!565549 (addApplyDifferent!520 lt!565542 lt!565533 minValueBefore!43 lt!565535))))

(assert (=> b!1253071 (= (apply!977 (+!4188 lt!565542 (tuple2!20669 lt!565533 minValueBefore!43)) lt!565535) (apply!977 lt!565542 lt!565535))))

(declare-fun lt!565544 () Unit!41536)

(assert (=> b!1253071 (= lt!565544 lt!565549)))

(declare-fun lt!565548 () ListLongMap!18541)

(assert (=> b!1253071 (= lt!565548 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565543 () (_ BitVec 64))

(assert (=> b!1253071 (= lt!565543 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565538 () (_ BitVec 64))

(assert (=> b!1253071 (= lt!565538 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565531 () Unit!41536)

(assert (=> b!1253071 (= lt!565531 (addApplyDifferent!520 lt!565548 lt!565543 zeroValue!871 lt!565538))))

(assert (=> b!1253071 (= (apply!977 (+!4188 lt!565548 (tuple2!20669 lt!565543 zeroValue!871)) lt!565538) (apply!977 lt!565548 lt!565538))))

(declare-fun lt!565547 () Unit!41536)

(assert (=> b!1253071 (= lt!565547 lt!565531)))

(declare-fun lt!565529 () ListLongMap!18541)

(assert (=> b!1253071 (= lt!565529 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565539 () (_ BitVec 64))

(assert (=> b!1253071 (= lt!565539 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!565540 () (_ BitVec 64))

(assert (=> b!1253071 (= lt!565540 (select (arr!39133 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1253071 (= lt!565546 (addApplyDifferent!520 lt!565529 lt!565539 minValueBefore!43 lt!565540))))

(assert (=> b!1253071 (= (apply!977 (+!4188 lt!565529 (tuple2!20669 lt!565539 minValueBefore!43)) lt!565540) (apply!977 lt!565529 lt!565540))))

(declare-fun bm!61666 () Bool)

(assert (=> bm!61666 (= call!61666 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61667 () Bool)

(assert (=> bm!61667 (= call!61668 call!61669)))

(declare-fun bm!61668 () Bool)

(declare-fun call!61670 () Bool)

(assert (=> bm!61668 (= call!61670 (contains!7488 lt!565545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253072 () Bool)

(declare-fun c!122273 () Bool)

(assert (=> b!1253072 (= c!122273 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1253072 (= e!711814 e!711807)))

(declare-fun b!1253073 () Bool)

(assert (=> b!1253073 (= e!711807 call!61668)))

(declare-fun b!1253074 () Bool)

(declare-fun e!711812 () Bool)

(declare-fun e!711810 () Bool)

(assert (=> b!1253074 (= e!711812 e!711810)))

(declare-fun res!835613 () Bool)

(assert (=> b!1253074 (= res!835613 call!61670)))

(assert (=> b!1253074 (=> (not res!835613) (not e!711810))))

(declare-fun b!1253075 () Bool)

(declare-fun Unit!41540 () Unit!41536)

(assert (=> b!1253075 (= e!711816 Unit!41540)))

(declare-fun b!1253076 () Bool)

(declare-fun res!835612 () Bool)

(assert (=> b!1253076 (=> (not res!835612) (not e!711819))))

(assert (=> b!1253076 (= res!835612 e!711812)))

(declare-fun c!122276 () Bool)

(assert (=> b!1253076 (= c!122276 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1253077 () Bool)

(assert (=> b!1253077 (= e!711815 (not call!61667))))

(declare-fun b!1253078 () Bool)

(assert (=> b!1253078 (= e!711812 (not call!61670))))

(declare-fun b!1253079 () Bool)

(assert (=> b!1253079 (= e!711810 (= (apply!977 lt!565545 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1253080 () Bool)

(assert (=> b!1253080 (= e!711819 e!711815)))

(declare-fun c!122271 () Bool)

(assert (=> b!1253080 (= c!122271 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!137903 () Bool)

(assert (=> d!137903 e!711819))

(declare-fun res!835607 () Bool)

(assert (=> d!137903 (=> (not res!835607) (not e!711819))))

(assert (=> d!137903 (= res!835607 (or (bvsge #b00000000000000000000000000000000 (size!39671 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))))

(declare-fun lt!565537 () ListLongMap!18541)

(assert (=> d!137903 (= lt!565545 lt!565537)))

(declare-fun lt!565536 () Unit!41536)

(assert (=> d!137903 (= lt!565536 e!711816)))

(declare-fun c!122275 () Bool)

(assert (=> d!137903 (= c!122275 e!711811)))

(declare-fun res!835611 () Bool)

(assert (=> d!137903 (=> (not res!835611) (not e!711811))))

(assert (=> d!137903 (= res!835611 (bvslt #b00000000000000000000000000000000 (size!39671 _keys!1118)))))

(declare-fun e!711813 () ListLongMap!18541)

(assert (=> d!137903 (= lt!565537 e!711813)))

(assert (=> d!137903 (= c!122272 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!137903 (validMask!0 mask!1466)))

(assert (=> d!137903 (= (getCurrentListMap!4424 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565545)))

(declare-fun b!1253069 () Bool)

(assert (=> b!1253069 (= e!711813 (+!4188 call!61672 (tuple2!20669 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!61669 () Bool)

(assert (=> bm!61669 (= call!61667 (contains!7488 lt!565545 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253081 () Bool)

(assert (=> b!1253081 (= e!711813 e!711814)))

(assert (=> b!1253081 (= c!122274 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!137903 c!122272) b!1253069))

(assert (= (and d!137903 (not c!122272)) b!1253081))

(assert (= (and b!1253081 c!122274) b!1253062))

(assert (= (and b!1253081 (not c!122274)) b!1253072))

(assert (= (and b!1253072 c!122273) b!1253068))

(assert (= (and b!1253072 (not c!122273)) b!1253073))

(assert (= (or b!1253068 b!1253073) bm!61667))

(assert (= (or b!1253062 bm!61667) bm!61664))

(assert (= (or b!1253062 b!1253068) bm!61663))

(assert (= (or b!1253069 bm!61664) bm!61666))

(assert (= (or b!1253069 bm!61663) bm!61665))

(assert (= (and d!137903 res!835611) b!1253064))

(assert (= (and d!137903 c!122275) b!1253071))

(assert (= (and d!137903 (not c!122275)) b!1253075))

(assert (= (and d!137903 res!835607) b!1253067))

(assert (= (and b!1253067 res!835614) b!1253070))

(assert (= (and b!1253067 (not res!835609)) b!1253065))

(assert (= (and b!1253065 res!835608) b!1253066))

(assert (= (and b!1253067 res!835610) b!1253076))

(assert (= (and b!1253076 c!122276) b!1253074))

(assert (= (and b!1253076 (not c!122276)) b!1253078))

(assert (= (and b!1253074 res!835613) b!1253079))

(assert (= (or b!1253074 b!1253078) bm!61668))

(assert (= (and b!1253076 res!835612) b!1253080))

(assert (= (and b!1253080 c!122271) b!1253061))

(assert (= (and b!1253080 (not c!122271)) b!1253077))

(assert (= (and b!1253061 res!835615) b!1253063))

(assert (= (or b!1253061 b!1253077) bm!61669))

(declare-fun b_lambda!22581 () Bool)

(assert (=> (not b_lambda!22581) (not b!1253066)))

(assert (=> b!1253066 t!41359))

(declare-fun b_and!44675 () Bool)

(assert (= b_and!44673 (and (=> t!41359 result!23285) b_and!44675)))

(declare-fun m!1153109 () Bool)

(assert (=> b!1253069 m!1153109))

(assert (=> b!1253065 m!1153059))

(assert (=> b!1253065 m!1153059))

(declare-fun m!1153111 () Bool)

(assert (=> b!1253065 m!1153111))

(declare-fun m!1153113 () Bool)

(assert (=> b!1253071 m!1153113))

(declare-fun m!1153115 () Bool)

(assert (=> b!1253071 m!1153115))

(declare-fun m!1153117 () Bool)

(assert (=> b!1253071 m!1153117))

(declare-fun m!1153119 () Bool)

(assert (=> b!1253071 m!1153119))

(declare-fun m!1153121 () Bool)

(assert (=> b!1253071 m!1153121))

(declare-fun m!1153123 () Bool)

(assert (=> b!1253071 m!1153123))

(assert (=> b!1253071 m!1153059))

(declare-fun m!1153125 () Bool)

(assert (=> b!1253071 m!1153125))

(declare-fun m!1153127 () Bool)

(assert (=> b!1253071 m!1153127))

(assert (=> b!1253071 m!1152991))

(assert (=> b!1253071 m!1153121))

(assert (=> b!1253071 m!1153125))

(declare-fun m!1153129 () Bool)

(assert (=> b!1253071 m!1153129))

(declare-fun m!1153131 () Bool)

(assert (=> b!1253071 m!1153131))

(declare-fun m!1153133 () Bool)

(assert (=> b!1253071 m!1153133))

(assert (=> b!1253071 m!1153133))

(declare-fun m!1153135 () Bool)

(assert (=> b!1253071 m!1153135))

(assert (=> b!1253071 m!1153117))

(declare-fun m!1153137 () Bool)

(assert (=> b!1253071 m!1153137))

(declare-fun m!1153139 () Bool)

(assert (=> b!1253071 m!1153139))

(declare-fun m!1153141 () Bool)

(assert (=> b!1253071 m!1153141))

(declare-fun m!1153143 () Bool)

(assert (=> b!1253063 m!1153143))

(declare-fun m!1153145 () Bool)

(assert (=> bm!61665 m!1153145))

(declare-fun m!1153147 () Bool)

(assert (=> b!1253079 m!1153147))

(assert (=> b!1253066 m!1153053))

(assert (=> b!1253066 m!1153049))

(assert (=> b!1253066 m!1153055))

(assert (=> b!1253066 m!1153059))

(declare-fun m!1153149 () Bool)

(assert (=> b!1253066 m!1153149))

(assert (=> b!1253066 m!1153059))

(assert (=> b!1253066 m!1153053))

(assert (=> b!1253066 m!1153049))

(declare-fun m!1153151 () Bool)

(assert (=> bm!61669 m!1153151))

(assert (=> bm!61666 m!1152991))

(declare-fun m!1153153 () Bool)

(assert (=> bm!61668 m!1153153))

(assert (=> d!137903 m!1152997))

(assert (=> b!1253064 m!1153059))

(assert (=> b!1253064 m!1153059))

(assert (=> b!1253064 m!1153063))

(assert (=> b!1253070 m!1153059))

(assert (=> b!1253070 m!1153059))

(assert (=> b!1253070 m!1153063))

(assert (=> b!1252892 d!137903))

(declare-fun mapIsEmpty!49447 () Bool)

(declare-fun mapRes!49447 () Bool)

(assert (=> mapIsEmpty!49447 mapRes!49447))

(declare-fun b!1253088 () Bool)

(declare-fun e!711824 () Bool)

(assert (=> b!1253088 (= e!711824 tp_is_empty!31777)))

(declare-fun mapNonEmpty!49447 () Bool)

(declare-fun tp!94142 () Bool)

(assert (=> mapNonEmpty!49447 (= mapRes!49447 (and tp!94142 e!711824))))

(declare-fun mapKey!49447 () (_ BitVec 32))

(declare-fun mapValue!49447 () ValueCell!15125)

(declare-fun mapRest!49447 () (Array (_ BitVec 32) ValueCell!15125))

(assert (=> mapNonEmpty!49447 (= mapRest!49438 (store mapRest!49447 mapKey!49447 mapValue!49447))))

(declare-fun b!1253089 () Bool)

(declare-fun e!711825 () Bool)

(assert (=> b!1253089 (= e!711825 tp_is_empty!31777)))

(declare-fun condMapEmpty!49447 () Bool)

(declare-fun mapDefault!49447 () ValueCell!15125)

(assert (=> mapNonEmpty!49438 (= condMapEmpty!49447 (= mapRest!49438 ((as const (Array (_ BitVec 32) ValueCell!15125)) mapDefault!49447)))))

(assert (=> mapNonEmpty!49438 (= tp!94126 (and e!711825 mapRes!49447))))

(assert (= (and mapNonEmpty!49438 condMapEmpty!49447) mapIsEmpty!49447))

(assert (= (and mapNonEmpty!49438 (not condMapEmpty!49447)) mapNonEmpty!49447))

(assert (= (and mapNonEmpty!49447 ((_ is ValueCellFull!15125) mapValue!49447)) b!1253088))

(assert (= (and mapNonEmpty!49438 ((_ is ValueCellFull!15125) mapDefault!49447)) b!1253089))

(declare-fun m!1153155 () Bool)

(assert (=> mapNonEmpty!49447 m!1153155))

(declare-fun b_lambda!22583 () Bool)

(assert (= b_lambda!22579 (or (and start!105138 b_free!26875) b_lambda!22583)))

(declare-fun b_lambda!22585 () Bool)

(assert (= b_lambda!22577 (or (and start!105138 b_free!26875) b_lambda!22585)))

(declare-fun b_lambda!22587 () Bool)

(assert (= b_lambda!22581 (or (and start!105138 b_free!26875) b_lambda!22587)))

(declare-fun b_lambda!22589 () Bool)

(assert (= b_lambda!22575 (or (and start!105138 b_free!26875) b_lambda!22589)))

(declare-fun b_lambda!22591 () Bool)

(assert (= b_lambda!22573 (or (and start!105138 b_free!26875) b_lambda!22591)))

(check-sat (not bm!61648) (not b!1252977) (not b!1253069) tp_is_empty!31777 (not bm!61669) (not b!1252981) (not b_lambda!22589) (not b!1252975) (not b!1252971) (not b_lambda!22583) (not b!1253018) (not bm!61642) (not b!1252973) (not mapNonEmpty!49447) (not b_lambda!22585) (not b!1252980) (not bm!61668) (not b!1253063) (not d!137903) (not b!1252972) (not b!1253017) (not b!1252970) (not b!1252985) (not b!1253070) (not b!1253066) (not b_lambda!22591) (not b!1252991) (not b!1252966) (not b!1253015) (not bm!61645) (not d!137891) (not bm!61665) (not b!1253079) (not b!1252986) (not b!1253003) (not bm!61666) (not b!1253071) (not d!137887) (not b!1252984) (not b_next!26875) (not d!137889) (not b!1253001) (not b!1253064) (not b!1252989) b_and!44675 (not b_lambda!22587) (not b!1253065) (not b!1252967) (not bm!61641) (not b!1252987))
(check-sat b_and!44675 (not b_next!26875))
