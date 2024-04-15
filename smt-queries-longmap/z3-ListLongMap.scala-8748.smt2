; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106162 () Bool)

(assert start!106162)

(declare-fun b_free!27523 () Bool)

(declare-fun b_next!27523 () Bool)

(assert (=> start!106162 (= b_free!27523 (not b_next!27523))))

(declare-fun tp!96131 () Bool)

(declare-fun b_and!45525 () Bool)

(assert (=> start!106162 (= tp!96131 b_and!45525)))

(declare-fun b!1263968 () Bool)

(declare-fun e!719677 () Bool)

(declare-fun tp_is_empty!32425 () Bool)

(assert (=> b!1263968 (= e!719677 tp_is_empty!32425)))

(declare-fun mapNonEmpty!50470 () Bool)

(declare-fun mapRes!50470 () Bool)

(declare-fun tp!96130 () Bool)

(declare-fun e!719678 () Bool)

(assert (=> mapNonEmpty!50470 (= mapRes!50470 (and tp!96130 e!719678))))

(declare-datatypes ((V!48599 0))(
  ( (V!48600 (val!16275 Int)) )
))
(declare-datatypes ((ValueCell!15449 0))(
  ( (ValueCellFull!15449 (v!18987 V!48599)) (EmptyCell!15449) )
))
(declare-fun mapRest!50470 () (Array (_ BitVec 32) ValueCell!15449))

(declare-fun mapKey!50470 () (_ BitVec 32))

(declare-datatypes ((array!82401 0))(
  ( (array!82402 (arr!39744 (Array (_ BitVec 32) ValueCell!15449)) (size!40282 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82401)

(declare-fun mapValue!50470 () ValueCell!15449)

(assert (=> mapNonEmpty!50470 (= (arr!39744 _values!914) (store mapRest!50470 mapKey!50470 mapValue!50470))))

(declare-fun b!1263969 () Bool)

(assert (=> b!1263969 (= e!719678 tp_is_empty!32425)))

(declare-fun res!841827 () Bool)

(declare-fun e!719681 () Bool)

(assert (=> start!106162 (=> (not res!841827) (not e!719681))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106162 (= res!841827 (validMask!0 mask!1466))))

(assert (=> start!106162 e!719681))

(assert (=> start!106162 true))

(assert (=> start!106162 tp!96131))

(assert (=> start!106162 tp_is_empty!32425))

(declare-datatypes ((array!82403 0))(
  ( (array!82404 (arr!39745 (Array (_ BitVec 32) (_ BitVec 64))) (size!40283 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82403)

(declare-fun array_inv!30409 (array!82403) Bool)

(assert (=> start!106162 (array_inv!30409 _keys!1118)))

(declare-fun e!719679 () Bool)

(declare-fun array_inv!30410 (array!82401) Bool)

(assert (=> start!106162 (and (array_inv!30410 _values!914) e!719679)))

(declare-fun b!1263970 () Bool)

(declare-fun res!841823 () Bool)

(assert (=> b!1263970 (=> (not res!841823) (not e!719681))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1263970 (= res!841823 (and (= (size!40282 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40283 _keys!1118) (size!40282 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263971 () Bool)

(declare-fun e!719683 () Bool)

(declare-datatypes ((tuple2!21154 0))(
  ( (tuple2!21155 (_1!10588 (_ BitVec 64)) (_2!10588 V!48599)) )
))
(declare-datatypes ((List!28347 0))(
  ( (Nil!28344) (Cons!28343 (h!29552 tuple2!21154) (t!41857 List!28347)) )
))
(declare-datatypes ((ListLongMap!19027 0))(
  ( (ListLongMap!19028 (toList!9529 List!28347)) )
))
(declare-fun lt!573247 () ListLongMap!19027)

(declare-fun contains!7581 (ListLongMap!19027 (_ BitVec 64)) Bool)

(assert (=> b!1263971 (= e!719683 (not (contains!7581 lt!573247 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719682 () Bool)

(assert (=> b!1263971 e!719682))

(declare-fun res!841825 () Bool)

(assert (=> b!1263971 (=> (not res!841825) (not e!719682))))

(declare-fun minValueBefore!43 () V!48599)

(declare-fun lt!573251 () ListLongMap!19027)

(declare-fun +!4296 (ListLongMap!19027 tuple2!21154) ListLongMap!19027)

(assert (=> b!1263971 (= res!841825 (= lt!573251 (+!4296 lt!573247 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573252 () ListLongMap!19027)

(declare-fun lt!573249 () tuple2!21154)

(assert (=> b!1263971 (= lt!573247 (+!4296 lt!573252 lt!573249))))

(declare-fun zeroValue!871 () V!48599)

(assert (=> b!1263971 (= lt!573249 (tuple2!21155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48599)

(declare-fun lt!573250 () ListLongMap!19027)

(declare-fun getCurrentListMap!4582 (array!82403 array!82401 (_ BitVec 32) (_ BitVec 32) V!48599 V!48599 (_ BitVec 32) Int) ListLongMap!19027)

(assert (=> b!1263971 (= lt!573250 (getCurrentListMap!4582 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263971 (= lt!573251 (getCurrentListMap!4582 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50470 () Bool)

(assert (=> mapIsEmpty!50470 mapRes!50470))

(declare-fun b!1263972 () Bool)

(declare-fun res!841826 () Bool)

(assert (=> b!1263972 (=> (not res!841826) (not e!719681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82403 (_ BitVec 32)) Bool)

(assert (=> b!1263972 (= res!841826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263973 () Bool)

(declare-fun res!841828 () Bool)

(assert (=> b!1263973 (=> (not res!841828) (not e!719681))))

(declare-datatypes ((List!28348 0))(
  ( (Nil!28345) (Cons!28344 (h!29553 (_ BitVec 64)) (t!41858 List!28348)) )
))
(declare-fun arrayNoDuplicates!0 (array!82403 (_ BitVec 32) List!28348) Bool)

(assert (=> b!1263973 (= res!841828 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28345))))

(declare-fun lt!573246 () ListLongMap!19027)

(declare-fun b!1263974 () Bool)

(assert (=> b!1263974 (= e!719682 (= lt!573250 (+!4296 lt!573246 lt!573249)))))

(declare-fun b!1263975 () Bool)

(assert (=> b!1263975 (= e!719679 (and e!719677 mapRes!50470))))

(declare-fun condMapEmpty!50470 () Bool)

(declare-fun mapDefault!50470 () ValueCell!15449)

(assert (=> b!1263975 (= condMapEmpty!50470 (= (arr!39744 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15449)) mapDefault!50470)))))

(declare-fun b!1263976 () Bool)

(assert (=> b!1263976 (= e!719681 (not e!719683))))

(declare-fun res!841824 () Bool)

(assert (=> b!1263976 (=> res!841824 e!719683)))

(assert (=> b!1263976 (= res!841824 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1263976 (= lt!573252 lt!573246)))

(declare-datatypes ((Unit!41977 0))(
  ( (Unit!41978) )
))
(declare-fun lt!573248 () Unit!41977)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1193 (array!82403 array!82401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48599 V!48599 V!48599 V!48599 (_ BitVec 32) Int) Unit!41977)

(assert (=> b!1263976 (= lt!573248 (lemmaNoChangeToArrayThenSameMapNoExtras!1193 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5893 (array!82403 array!82401 (_ BitVec 32) (_ BitVec 32) V!48599 V!48599 (_ BitVec 32) Int) ListLongMap!19027)

(assert (=> b!1263976 (= lt!573246 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263976 (= lt!573252 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!106162 res!841827) b!1263970))

(assert (= (and b!1263970 res!841823) b!1263972))

(assert (= (and b!1263972 res!841826) b!1263973))

(assert (= (and b!1263973 res!841828) b!1263976))

(assert (= (and b!1263976 (not res!841824)) b!1263971))

(assert (= (and b!1263971 res!841825) b!1263974))

(assert (= (and b!1263975 condMapEmpty!50470) mapIsEmpty!50470))

(assert (= (and b!1263975 (not condMapEmpty!50470)) mapNonEmpty!50470))

(get-info :version)

(assert (= (and mapNonEmpty!50470 ((_ is ValueCellFull!15449) mapValue!50470)) b!1263969))

(assert (= (and b!1263975 ((_ is ValueCellFull!15449) mapDefault!50470)) b!1263968))

(assert (= start!106162 b!1263975))

(declare-fun m!1164031 () Bool)

(assert (=> mapNonEmpty!50470 m!1164031))

(declare-fun m!1164033 () Bool)

(assert (=> b!1263976 m!1164033))

(declare-fun m!1164035 () Bool)

(assert (=> b!1263976 m!1164035))

(declare-fun m!1164037 () Bool)

(assert (=> b!1263976 m!1164037))

(declare-fun m!1164039 () Bool)

(assert (=> b!1263974 m!1164039))

(declare-fun m!1164041 () Bool)

(assert (=> start!106162 m!1164041))

(declare-fun m!1164043 () Bool)

(assert (=> start!106162 m!1164043))

(declare-fun m!1164045 () Bool)

(assert (=> start!106162 m!1164045))

(declare-fun m!1164047 () Bool)

(assert (=> b!1263972 m!1164047))

(declare-fun m!1164049 () Bool)

(assert (=> b!1263973 m!1164049))

(declare-fun m!1164051 () Bool)

(assert (=> b!1263971 m!1164051))

(declare-fun m!1164053 () Bool)

(assert (=> b!1263971 m!1164053))

(declare-fun m!1164055 () Bool)

(assert (=> b!1263971 m!1164055))

(declare-fun m!1164057 () Bool)

(assert (=> b!1263971 m!1164057))

(declare-fun m!1164059 () Bool)

(assert (=> b!1263971 m!1164059))

(check-sat (not start!106162) (not b!1263976) (not b!1263974) (not b!1263972) (not b!1263973) b_and!45525 (not b!1263971) (not mapNonEmpty!50470) (not b_next!27523) tp_is_empty!32425)
(check-sat b_and!45525 (not b_next!27523))
(get-model)

(declare-fun d!138563 () Bool)

(declare-fun e!719730 () Bool)

(assert (=> d!138563 e!719730))

(declare-fun res!841867 () Bool)

(assert (=> d!138563 (=> res!841867 e!719730)))

(declare-fun lt!573306 () Bool)

(assert (=> d!138563 (= res!841867 (not lt!573306))))

(declare-fun lt!573303 () Bool)

(assert (=> d!138563 (= lt!573306 lt!573303)))

(declare-fun lt!573304 () Unit!41977)

(declare-fun e!719731 () Unit!41977)

(assert (=> d!138563 (= lt!573304 e!719731)))

(declare-fun c!123072 () Bool)

(assert (=> d!138563 (= c!123072 lt!573303)))

(declare-fun containsKey!625 (List!28347 (_ BitVec 64)) Bool)

(assert (=> d!138563 (= lt!573303 (containsKey!625 (toList!9529 lt!573247) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138563 (= (contains!7581 lt!573247 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573306)))

(declare-fun b!1264037 () Bool)

(declare-fun lt!573305 () Unit!41977)

(assert (=> b!1264037 (= e!719731 lt!573305)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!435 (List!28347 (_ BitVec 64)) Unit!41977)

(assert (=> b!1264037 (= lt!573305 (lemmaContainsKeyImpliesGetValueByKeyDefined!435 (toList!9529 lt!573247) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!722 0))(
  ( (Some!721 (v!18990 V!48599)) (None!720) )
))
(declare-fun isDefined!478 (Option!722) Bool)

(declare-fun getValueByKey!671 (List!28347 (_ BitVec 64)) Option!722)

(assert (=> b!1264037 (isDefined!478 (getValueByKey!671 (toList!9529 lt!573247) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264038 () Bool)

(declare-fun Unit!41981 () Unit!41977)

(assert (=> b!1264038 (= e!719731 Unit!41981)))

(declare-fun b!1264039 () Bool)

(assert (=> b!1264039 (= e!719730 (isDefined!478 (getValueByKey!671 (toList!9529 lt!573247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138563 c!123072) b!1264037))

(assert (= (and d!138563 (not c!123072)) b!1264038))

(assert (= (and d!138563 (not res!841867)) b!1264039))

(declare-fun m!1164121 () Bool)

(assert (=> d!138563 m!1164121))

(declare-fun m!1164123 () Bool)

(assert (=> b!1264037 m!1164123))

(declare-fun m!1164125 () Bool)

(assert (=> b!1264037 m!1164125))

(assert (=> b!1264037 m!1164125))

(declare-fun m!1164127 () Bool)

(assert (=> b!1264037 m!1164127))

(assert (=> b!1264039 m!1164125))

(assert (=> b!1264039 m!1164125))

(assert (=> b!1264039 m!1164127))

(assert (=> b!1263971 d!138563))

(declare-fun b!1264082 () Bool)

(declare-fun e!719765 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1264082 (= e!719765 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun e!719766 () Bool)

(declare-fun b!1264083 () Bool)

(declare-fun lt!573361 () ListLongMap!19027)

(declare-fun apply!997 (ListLongMap!19027 (_ BitVec 64)) V!48599)

(declare-fun get!20298 (ValueCell!15449 V!48599) V!48599)

(declare-fun dynLambda!3427 (Int (_ BitVec 64)) V!48599)

(assert (=> b!1264083 (= e!719766 (= (apply!997 lt!573361 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)) (get!20298 (select (arr!39744 _values!914) #b00000000000000000000000000000000) (dynLambda!3427 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40282 _values!914)))))

(assert (=> b!1264083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun bm!62287 () Bool)

(declare-fun call!62291 () ListLongMap!19027)

(declare-fun call!62293 () ListLongMap!19027)

(assert (=> bm!62287 (= call!62291 call!62293)))

(declare-fun b!1264084 () Bool)

(declare-fun e!719770 () Unit!41977)

(declare-fun Unit!41982 () Unit!41977)

(assert (=> b!1264084 (= e!719770 Unit!41982)))

(declare-fun bm!62288 () Bool)

(declare-fun call!62292 () ListLongMap!19027)

(declare-fun call!62295 () ListLongMap!19027)

(assert (=> bm!62288 (= call!62292 call!62295)))

(declare-fun b!1264085 () Bool)

(declare-fun e!719759 () Bool)

(declare-fun call!62296 () Bool)

(assert (=> b!1264085 (= e!719759 (not call!62296))))

(declare-fun b!1264086 () Bool)

(declare-fun e!719768 () Bool)

(declare-fun e!719763 () Bool)

(assert (=> b!1264086 (= e!719768 e!719763)))

(declare-fun res!841889 () Bool)

(declare-fun call!62290 () Bool)

(assert (=> b!1264086 (= res!841889 call!62290)))

(assert (=> b!1264086 (=> (not res!841889) (not e!719763))))

(declare-fun b!1264088 () Bool)

(declare-fun e!719764 () Bool)

(assert (=> b!1264088 (= e!719764 e!719759)))

(declare-fun c!123086 () Bool)

(assert (=> b!1264088 (= c!123086 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62289 () Bool)

(assert (=> bm!62289 (= call!62296 (contains!7581 lt!573361 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!62294 () ListLongMap!19027)

(declare-fun bm!62290 () Bool)

(assert (=> bm!62290 (= call!62294 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264089 () Bool)

(declare-fun res!841887 () Bool)

(assert (=> b!1264089 (=> (not res!841887) (not e!719764))))

(assert (=> b!1264089 (= res!841887 e!719768)))

(declare-fun c!123087 () Bool)

(assert (=> b!1264089 (= c!123087 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1264090 () Bool)

(declare-fun lt!573357 () Unit!41977)

(assert (=> b!1264090 (= e!719770 lt!573357)))

(declare-fun lt!573353 () ListLongMap!19027)

(assert (=> b!1264090 (= lt!573353 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573367 () (_ BitVec 64))

(assert (=> b!1264090 (= lt!573367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573365 () (_ BitVec 64))

(assert (=> b!1264090 (= lt!573365 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573363 () Unit!41977)

(declare-fun addStillContains!1094 (ListLongMap!19027 (_ BitVec 64) V!48599 (_ BitVec 64)) Unit!41977)

(assert (=> b!1264090 (= lt!573363 (addStillContains!1094 lt!573353 lt!573367 zeroValue!871 lt!573365))))

(assert (=> b!1264090 (contains!7581 (+!4296 lt!573353 (tuple2!21155 lt!573367 zeroValue!871)) lt!573365)))

(declare-fun lt!573354 () Unit!41977)

(assert (=> b!1264090 (= lt!573354 lt!573363)))

(declare-fun lt!573355 () ListLongMap!19027)

(assert (=> b!1264090 (= lt!573355 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573366 () (_ BitVec 64))

(assert (=> b!1264090 (= lt!573366 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573368 () (_ BitVec 64))

(assert (=> b!1264090 (= lt!573368 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573370 () Unit!41977)

(declare-fun addApplyDifferent!537 (ListLongMap!19027 (_ BitVec 64) V!48599 (_ BitVec 64)) Unit!41977)

(assert (=> b!1264090 (= lt!573370 (addApplyDifferent!537 lt!573355 lt!573366 minValueAfter!43 lt!573368))))

(assert (=> b!1264090 (= (apply!997 (+!4296 lt!573355 (tuple2!21155 lt!573366 minValueAfter!43)) lt!573368) (apply!997 lt!573355 lt!573368))))

(declare-fun lt!573358 () Unit!41977)

(assert (=> b!1264090 (= lt!573358 lt!573370)))

(declare-fun lt!573356 () ListLongMap!19027)

(assert (=> b!1264090 (= lt!573356 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573362 () (_ BitVec 64))

(assert (=> b!1264090 (= lt!573362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573372 () (_ BitVec 64))

(assert (=> b!1264090 (= lt!573372 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573359 () Unit!41977)

(assert (=> b!1264090 (= lt!573359 (addApplyDifferent!537 lt!573356 lt!573362 zeroValue!871 lt!573372))))

(assert (=> b!1264090 (= (apply!997 (+!4296 lt!573356 (tuple2!21155 lt!573362 zeroValue!871)) lt!573372) (apply!997 lt!573356 lt!573372))))

(declare-fun lt!573371 () Unit!41977)

(assert (=> b!1264090 (= lt!573371 lt!573359)))

(declare-fun lt!573351 () ListLongMap!19027)

(assert (=> b!1264090 (= lt!573351 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573360 () (_ BitVec 64))

(assert (=> b!1264090 (= lt!573360 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573352 () (_ BitVec 64))

(assert (=> b!1264090 (= lt!573352 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264090 (= lt!573357 (addApplyDifferent!537 lt!573351 lt!573360 minValueAfter!43 lt!573352))))

(assert (=> b!1264090 (= (apply!997 (+!4296 lt!573351 (tuple2!21155 lt!573360 minValueAfter!43)) lt!573352) (apply!997 lt!573351 lt!573352))))

(declare-fun b!1264091 () Bool)

(assert (=> b!1264091 (= e!719763 (= (apply!997 lt!573361 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1264092 () Bool)

(declare-fun e!719769 () ListLongMap!19027)

(assert (=> b!1264092 (= e!719769 (+!4296 call!62293 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1264093 () Bool)

(declare-fun e!719761 () Bool)

(assert (=> b!1264093 (= e!719759 e!719761)))

(declare-fun res!841894 () Bool)

(assert (=> b!1264093 (= res!841894 call!62296)))

(assert (=> b!1264093 (=> (not res!841894) (not e!719761))))

(declare-fun bm!62291 () Bool)

(assert (=> bm!62291 (= call!62290 (contains!7581 lt!573361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62292 () Bool)

(assert (=> bm!62292 (= call!62295 call!62294)))

(declare-fun b!1264094 () Bool)

(declare-fun e!719762 () ListLongMap!19027)

(assert (=> b!1264094 (= e!719762 call!62291)))

(declare-fun b!1264095 () Bool)

(assert (=> b!1264095 (= e!719769 e!719762)))

(declare-fun c!123085 () Bool)

(assert (=> b!1264095 (= c!123085 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264096 () Bool)

(declare-fun e!719767 () ListLongMap!19027)

(assert (=> b!1264096 (= e!719767 call!62292)))

(declare-fun b!1264097 () Bool)

(declare-fun e!719760 () Bool)

(assert (=> b!1264097 (= e!719760 e!719766)))

(declare-fun res!841893 () Bool)

(assert (=> b!1264097 (=> (not res!841893) (not e!719766))))

(assert (=> b!1264097 (= res!841893 (contains!7581 lt!573361 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun c!123089 () Bool)

(declare-fun bm!62293 () Bool)

(assert (=> bm!62293 (= call!62293 (+!4296 (ite c!123089 call!62294 (ite c!123085 call!62295 call!62292)) (ite (or c!123089 c!123085) (tuple2!21155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1264098 () Bool)

(assert (=> b!1264098 (= e!719768 (not call!62290))))

(declare-fun b!1264087 () Bool)

(declare-fun res!841890 () Bool)

(assert (=> b!1264087 (=> (not res!841890) (not e!719764))))

(assert (=> b!1264087 (= res!841890 e!719760)))

(declare-fun res!841888 () Bool)

(assert (=> b!1264087 (=> res!841888 e!719760)))

(declare-fun e!719758 () Bool)

(assert (=> b!1264087 (= res!841888 (not e!719758))))

(declare-fun res!841886 () Bool)

(assert (=> b!1264087 (=> (not res!841886) (not e!719758))))

(assert (=> b!1264087 (= res!841886 (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun d!138565 () Bool)

(assert (=> d!138565 e!719764))

(declare-fun res!841891 () Bool)

(assert (=> d!138565 (=> (not res!841891) (not e!719764))))

(assert (=> d!138565 (= res!841891 (or (bvsge #b00000000000000000000000000000000 (size!40283 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))))

(declare-fun lt!573369 () ListLongMap!19027)

(assert (=> d!138565 (= lt!573361 lt!573369)))

(declare-fun lt!573364 () Unit!41977)

(assert (=> d!138565 (= lt!573364 e!719770)))

(declare-fun c!123088 () Bool)

(assert (=> d!138565 (= c!123088 e!719765)))

(declare-fun res!841892 () Bool)

(assert (=> d!138565 (=> (not res!841892) (not e!719765))))

(assert (=> d!138565 (= res!841892 (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(assert (=> d!138565 (= lt!573369 e!719769)))

(assert (=> d!138565 (= c!123089 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138565 (validMask!0 mask!1466)))

(assert (=> d!138565 (= (getCurrentListMap!4582 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573361)))

(declare-fun b!1264099 () Bool)

(declare-fun c!123090 () Bool)

(assert (=> b!1264099 (= c!123090 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1264099 (= e!719762 e!719767)))

(declare-fun b!1264100 () Bool)

(assert (=> b!1264100 (= e!719767 call!62291)))

(declare-fun b!1264101 () Bool)

(assert (=> b!1264101 (= e!719761 (= (apply!997 lt!573361 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1264102 () Bool)

(assert (=> b!1264102 (= e!719758 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138565 c!123089) b!1264092))

(assert (= (and d!138565 (not c!123089)) b!1264095))

(assert (= (and b!1264095 c!123085) b!1264094))

(assert (= (and b!1264095 (not c!123085)) b!1264099))

(assert (= (and b!1264099 c!123090) b!1264100))

(assert (= (and b!1264099 (not c!123090)) b!1264096))

(assert (= (or b!1264100 b!1264096) bm!62288))

(assert (= (or b!1264094 bm!62288) bm!62292))

(assert (= (or b!1264094 b!1264100) bm!62287))

(assert (= (or b!1264092 bm!62292) bm!62290))

(assert (= (or b!1264092 bm!62287) bm!62293))

(assert (= (and d!138565 res!841892) b!1264082))

(assert (= (and d!138565 c!123088) b!1264090))

(assert (= (and d!138565 (not c!123088)) b!1264084))

(assert (= (and d!138565 res!841891) b!1264087))

(assert (= (and b!1264087 res!841886) b!1264102))

(assert (= (and b!1264087 (not res!841888)) b!1264097))

(assert (= (and b!1264097 res!841893) b!1264083))

(assert (= (and b!1264087 res!841890) b!1264089))

(assert (= (and b!1264089 c!123087) b!1264086))

(assert (= (and b!1264089 (not c!123087)) b!1264098))

(assert (= (and b!1264086 res!841889) b!1264091))

(assert (= (or b!1264086 b!1264098) bm!62291))

(assert (= (and b!1264089 res!841887) b!1264088))

(assert (= (and b!1264088 c!123086) b!1264093))

(assert (= (and b!1264088 (not c!123086)) b!1264085))

(assert (= (and b!1264093 res!841894) b!1264101))

(assert (= (or b!1264093 b!1264085) bm!62289))

(declare-fun b_lambda!23005 () Bool)

(assert (=> (not b_lambda!23005) (not b!1264083)))

(declare-fun t!41861 () Bool)

(declare-fun tb!11327 () Bool)

(assert (=> (and start!106162 (= defaultEntry!922 defaultEntry!922) t!41861) tb!11327))

(declare-fun result!23405 () Bool)

(assert (=> tb!11327 (= result!23405 tp_is_empty!32425)))

(assert (=> b!1264083 t!41861))

(declare-fun b_and!45531 () Bool)

(assert (= b_and!45525 (and (=> t!41861 result!23405) b_and!45531)))

(declare-fun m!1164129 () Bool)

(assert (=> b!1264090 m!1164129))

(declare-fun m!1164131 () Bool)

(assert (=> b!1264090 m!1164131))

(declare-fun m!1164133 () Bool)

(assert (=> b!1264090 m!1164133))

(declare-fun m!1164135 () Bool)

(assert (=> b!1264090 m!1164135))

(declare-fun m!1164137 () Bool)

(assert (=> b!1264090 m!1164137))

(declare-fun m!1164139 () Bool)

(assert (=> b!1264090 m!1164139))

(assert (=> b!1264090 m!1164133))

(declare-fun m!1164141 () Bool)

(assert (=> b!1264090 m!1164141))

(declare-fun m!1164143 () Bool)

(assert (=> b!1264090 m!1164143))

(declare-fun m!1164145 () Bool)

(assert (=> b!1264090 m!1164145))

(assert (=> b!1264090 m!1164035))

(declare-fun m!1164147 () Bool)

(assert (=> b!1264090 m!1164147))

(assert (=> b!1264090 m!1164143))

(declare-fun m!1164149 () Bool)

(assert (=> b!1264090 m!1164149))

(declare-fun m!1164151 () Bool)

(assert (=> b!1264090 m!1164151))

(assert (=> b!1264090 m!1164135))

(declare-fun m!1164153 () Bool)

(assert (=> b!1264090 m!1164153))

(assert (=> b!1264090 m!1164151))

(declare-fun m!1164155 () Bool)

(assert (=> b!1264090 m!1164155))

(declare-fun m!1164157 () Bool)

(assert (=> b!1264090 m!1164157))

(declare-fun m!1164159 () Bool)

(assert (=> b!1264090 m!1164159))

(declare-fun m!1164161 () Bool)

(assert (=> bm!62291 m!1164161))

(assert (=> b!1264082 m!1164159))

(assert (=> b!1264082 m!1164159))

(declare-fun m!1164163 () Bool)

(assert (=> b!1264082 m!1164163))

(declare-fun m!1164165 () Bool)

(assert (=> b!1264092 m!1164165))

(assert (=> b!1264102 m!1164159))

(assert (=> b!1264102 m!1164159))

(assert (=> b!1264102 m!1164163))

(declare-fun m!1164167 () Bool)

(assert (=> b!1264083 m!1164167))

(assert (=> b!1264083 m!1164159))

(declare-fun m!1164169 () Bool)

(assert (=> b!1264083 m!1164169))

(assert (=> b!1264083 m!1164167))

(declare-fun m!1164171 () Bool)

(assert (=> b!1264083 m!1164171))

(assert (=> b!1264083 m!1164159))

(declare-fun m!1164173 () Bool)

(assert (=> b!1264083 m!1164173))

(assert (=> b!1264083 m!1164169))

(declare-fun m!1164175 () Bool)

(assert (=> b!1264091 m!1164175))

(assert (=> bm!62290 m!1164035))

(assert (=> b!1264097 m!1164159))

(assert (=> b!1264097 m!1164159))

(declare-fun m!1164177 () Bool)

(assert (=> b!1264097 m!1164177))

(declare-fun m!1164179 () Bool)

(assert (=> bm!62289 m!1164179))

(assert (=> d!138565 m!1164041))

(declare-fun m!1164181 () Bool)

(assert (=> bm!62293 m!1164181))

(declare-fun m!1164183 () Bool)

(assert (=> b!1264101 m!1164183))

(assert (=> b!1263971 d!138565))

(declare-fun d!138567 () Bool)

(declare-fun e!719773 () Bool)

(assert (=> d!138567 e!719773))

(declare-fun res!841899 () Bool)

(assert (=> d!138567 (=> (not res!841899) (not e!719773))))

(declare-fun lt!573382 () ListLongMap!19027)

(assert (=> d!138567 (= res!841899 (contains!7581 lt!573382 (_1!10588 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573384 () List!28347)

(assert (=> d!138567 (= lt!573382 (ListLongMap!19028 lt!573384))))

(declare-fun lt!573383 () Unit!41977)

(declare-fun lt!573381 () Unit!41977)

(assert (=> d!138567 (= lt!573383 lt!573381)))

(assert (=> d!138567 (= (getValueByKey!671 lt!573384 (_1!10588 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!721 (_2!10588 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!339 (List!28347 (_ BitVec 64) V!48599) Unit!41977)

(assert (=> d!138567 (= lt!573381 (lemmaContainsTupThenGetReturnValue!339 lt!573384 (_1!10588 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10588 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!453 (List!28347 (_ BitVec 64) V!48599) List!28347)

(assert (=> d!138567 (= lt!573384 (insertStrictlySorted!453 (toList!9529 lt!573247) (_1!10588 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10588 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138567 (= (+!4296 lt!573247 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!573382)))

(declare-fun b!1264109 () Bool)

(declare-fun res!841900 () Bool)

(assert (=> b!1264109 (=> (not res!841900) (not e!719773))))

(assert (=> b!1264109 (= res!841900 (= (getValueByKey!671 (toList!9529 lt!573382) (_1!10588 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!721 (_2!10588 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1264110 () Bool)

(declare-fun contains!7583 (List!28347 tuple2!21154) Bool)

(assert (=> b!1264110 (= e!719773 (contains!7583 (toList!9529 lt!573382) (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138567 res!841899) b!1264109))

(assert (= (and b!1264109 res!841900) b!1264110))

(declare-fun m!1164185 () Bool)

(assert (=> d!138567 m!1164185))

(declare-fun m!1164187 () Bool)

(assert (=> d!138567 m!1164187))

(declare-fun m!1164189 () Bool)

(assert (=> d!138567 m!1164189))

(declare-fun m!1164191 () Bool)

(assert (=> d!138567 m!1164191))

(declare-fun m!1164193 () Bool)

(assert (=> b!1264109 m!1164193))

(declare-fun m!1164195 () Bool)

(assert (=> b!1264110 m!1164195))

(assert (=> b!1263971 d!138567))

(declare-fun d!138569 () Bool)

(declare-fun e!719774 () Bool)

(assert (=> d!138569 e!719774))

(declare-fun res!841901 () Bool)

(assert (=> d!138569 (=> (not res!841901) (not e!719774))))

(declare-fun lt!573386 () ListLongMap!19027)

(assert (=> d!138569 (= res!841901 (contains!7581 lt!573386 (_1!10588 lt!573249)))))

(declare-fun lt!573388 () List!28347)

(assert (=> d!138569 (= lt!573386 (ListLongMap!19028 lt!573388))))

(declare-fun lt!573387 () Unit!41977)

(declare-fun lt!573385 () Unit!41977)

(assert (=> d!138569 (= lt!573387 lt!573385)))

(assert (=> d!138569 (= (getValueByKey!671 lt!573388 (_1!10588 lt!573249)) (Some!721 (_2!10588 lt!573249)))))

(assert (=> d!138569 (= lt!573385 (lemmaContainsTupThenGetReturnValue!339 lt!573388 (_1!10588 lt!573249) (_2!10588 lt!573249)))))

(assert (=> d!138569 (= lt!573388 (insertStrictlySorted!453 (toList!9529 lt!573252) (_1!10588 lt!573249) (_2!10588 lt!573249)))))

(assert (=> d!138569 (= (+!4296 lt!573252 lt!573249) lt!573386)))

(declare-fun b!1264111 () Bool)

(declare-fun res!841902 () Bool)

(assert (=> b!1264111 (=> (not res!841902) (not e!719774))))

(assert (=> b!1264111 (= res!841902 (= (getValueByKey!671 (toList!9529 lt!573386) (_1!10588 lt!573249)) (Some!721 (_2!10588 lt!573249))))))

(declare-fun b!1264112 () Bool)

(assert (=> b!1264112 (= e!719774 (contains!7583 (toList!9529 lt!573386) lt!573249))))

(assert (= (and d!138569 res!841901) b!1264111))

(assert (= (and b!1264111 res!841902) b!1264112))

(declare-fun m!1164197 () Bool)

(assert (=> d!138569 m!1164197))

(declare-fun m!1164199 () Bool)

(assert (=> d!138569 m!1164199))

(declare-fun m!1164201 () Bool)

(assert (=> d!138569 m!1164201))

(declare-fun m!1164203 () Bool)

(assert (=> d!138569 m!1164203))

(declare-fun m!1164205 () Bool)

(assert (=> b!1264111 m!1164205))

(declare-fun m!1164207 () Bool)

(assert (=> b!1264112 m!1164207))

(assert (=> b!1263971 d!138569))

(declare-fun b!1264113 () Bool)

(declare-fun e!719782 () Bool)

(assert (=> b!1264113 (= e!719782 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264114 () Bool)

(declare-fun e!719783 () Bool)

(declare-fun lt!573399 () ListLongMap!19027)

(assert (=> b!1264114 (= e!719783 (= (apply!997 lt!573399 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)) (get!20298 (select (arr!39744 _values!914) #b00000000000000000000000000000000) (dynLambda!3427 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40282 _values!914)))))

(assert (=> b!1264114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun bm!62294 () Bool)

(declare-fun call!62298 () ListLongMap!19027)

(declare-fun call!62300 () ListLongMap!19027)

(assert (=> bm!62294 (= call!62298 call!62300)))

(declare-fun b!1264115 () Bool)

(declare-fun e!719787 () Unit!41977)

(declare-fun Unit!41983 () Unit!41977)

(assert (=> b!1264115 (= e!719787 Unit!41983)))

(declare-fun bm!62295 () Bool)

(declare-fun call!62299 () ListLongMap!19027)

(declare-fun call!62302 () ListLongMap!19027)

(assert (=> bm!62295 (= call!62299 call!62302)))

(declare-fun b!1264116 () Bool)

(declare-fun e!719776 () Bool)

(declare-fun call!62303 () Bool)

(assert (=> b!1264116 (= e!719776 (not call!62303))))

(declare-fun b!1264117 () Bool)

(declare-fun e!719785 () Bool)

(declare-fun e!719780 () Bool)

(assert (=> b!1264117 (= e!719785 e!719780)))

(declare-fun res!841906 () Bool)

(declare-fun call!62297 () Bool)

(assert (=> b!1264117 (= res!841906 call!62297)))

(assert (=> b!1264117 (=> (not res!841906) (not e!719780))))

(declare-fun b!1264119 () Bool)

(declare-fun e!719781 () Bool)

(assert (=> b!1264119 (= e!719781 e!719776)))

(declare-fun c!123092 () Bool)

(assert (=> b!1264119 (= c!123092 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62296 () Bool)

(assert (=> bm!62296 (= call!62303 (contains!7581 lt!573399 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!62301 () ListLongMap!19027)

(declare-fun bm!62297 () Bool)

(assert (=> bm!62297 (= call!62301 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264120 () Bool)

(declare-fun res!841904 () Bool)

(assert (=> b!1264120 (=> (not res!841904) (not e!719781))))

(assert (=> b!1264120 (= res!841904 e!719785)))

(declare-fun c!123093 () Bool)

(assert (=> b!1264120 (= c!123093 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1264121 () Bool)

(declare-fun lt!573395 () Unit!41977)

(assert (=> b!1264121 (= e!719787 lt!573395)))

(declare-fun lt!573391 () ListLongMap!19027)

(assert (=> b!1264121 (= lt!573391 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573405 () (_ BitVec 64))

(assert (=> b!1264121 (= lt!573405 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573403 () (_ BitVec 64))

(assert (=> b!1264121 (= lt!573403 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573401 () Unit!41977)

(assert (=> b!1264121 (= lt!573401 (addStillContains!1094 lt!573391 lt!573405 zeroValue!871 lt!573403))))

(assert (=> b!1264121 (contains!7581 (+!4296 lt!573391 (tuple2!21155 lt!573405 zeroValue!871)) lt!573403)))

(declare-fun lt!573392 () Unit!41977)

(assert (=> b!1264121 (= lt!573392 lt!573401)))

(declare-fun lt!573393 () ListLongMap!19027)

(assert (=> b!1264121 (= lt!573393 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573404 () (_ BitVec 64))

(assert (=> b!1264121 (= lt!573404 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573406 () (_ BitVec 64))

(assert (=> b!1264121 (= lt!573406 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573408 () Unit!41977)

(assert (=> b!1264121 (= lt!573408 (addApplyDifferent!537 lt!573393 lt!573404 minValueBefore!43 lt!573406))))

(assert (=> b!1264121 (= (apply!997 (+!4296 lt!573393 (tuple2!21155 lt!573404 minValueBefore!43)) lt!573406) (apply!997 lt!573393 lt!573406))))

(declare-fun lt!573396 () Unit!41977)

(assert (=> b!1264121 (= lt!573396 lt!573408)))

(declare-fun lt!573394 () ListLongMap!19027)

(assert (=> b!1264121 (= lt!573394 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573400 () (_ BitVec 64))

(assert (=> b!1264121 (= lt!573400 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573410 () (_ BitVec 64))

(assert (=> b!1264121 (= lt!573410 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573397 () Unit!41977)

(assert (=> b!1264121 (= lt!573397 (addApplyDifferent!537 lt!573394 lt!573400 zeroValue!871 lt!573410))))

(assert (=> b!1264121 (= (apply!997 (+!4296 lt!573394 (tuple2!21155 lt!573400 zeroValue!871)) lt!573410) (apply!997 lt!573394 lt!573410))))

(declare-fun lt!573409 () Unit!41977)

(assert (=> b!1264121 (= lt!573409 lt!573397)))

(declare-fun lt!573389 () ListLongMap!19027)

(assert (=> b!1264121 (= lt!573389 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573398 () (_ BitVec 64))

(assert (=> b!1264121 (= lt!573398 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573390 () (_ BitVec 64))

(assert (=> b!1264121 (= lt!573390 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264121 (= lt!573395 (addApplyDifferent!537 lt!573389 lt!573398 minValueBefore!43 lt!573390))))

(assert (=> b!1264121 (= (apply!997 (+!4296 lt!573389 (tuple2!21155 lt!573398 minValueBefore!43)) lt!573390) (apply!997 lt!573389 lt!573390))))

(declare-fun b!1264122 () Bool)

(assert (=> b!1264122 (= e!719780 (= (apply!997 lt!573399 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1264123 () Bool)

(declare-fun e!719786 () ListLongMap!19027)

(assert (=> b!1264123 (= e!719786 (+!4296 call!62300 (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1264124 () Bool)

(declare-fun e!719778 () Bool)

(assert (=> b!1264124 (= e!719776 e!719778)))

(declare-fun res!841911 () Bool)

(assert (=> b!1264124 (= res!841911 call!62303)))

(assert (=> b!1264124 (=> (not res!841911) (not e!719778))))

(declare-fun bm!62298 () Bool)

(assert (=> bm!62298 (= call!62297 (contains!7581 lt!573399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62299 () Bool)

(assert (=> bm!62299 (= call!62302 call!62301)))

(declare-fun b!1264125 () Bool)

(declare-fun e!719779 () ListLongMap!19027)

(assert (=> b!1264125 (= e!719779 call!62298)))

(declare-fun b!1264126 () Bool)

(assert (=> b!1264126 (= e!719786 e!719779)))

(declare-fun c!123091 () Bool)

(assert (=> b!1264126 (= c!123091 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264127 () Bool)

(declare-fun e!719784 () ListLongMap!19027)

(assert (=> b!1264127 (= e!719784 call!62299)))

(declare-fun b!1264128 () Bool)

(declare-fun e!719777 () Bool)

(assert (=> b!1264128 (= e!719777 e!719783)))

(declare-fun res!841910 () Bool)

(assert (=> b!1264128 (=> (not res!841910) (not e!719783))))

(assert (=> b!1264128 (= res!841910 (contains!7581 lt!573399 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264128 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun bm!62300 () Bool)

(declare-fun c!123095 () Bool)

(assert (=> bm!62300 (= call!62300 (+!4296 (ite c!123095 call!62301 (ite c!123091 call!62302 call!62299)) (ite (or c!123095 c!123091) (tuple2!21155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21155 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1264129 () Bool)

(assert (=> b!1264129 (= e!719785 (not call!62297))))

(declare-fun b!1264118 () Bool)

(declare-fun res!841907 () Bool)

(assert (=> b!1264118 (=> (not res!841907) (not e!719781))))

(assert (=> b!1264118 (= res!841907 e!719777)))

(declare-fun res!841905 () Bool)

(assert (=> b!1264118 (=> res!841905 e!719777)))

(declare-fun e!719775 () Bool)

(assert (=> b!1264118 (= res!841905 (not e!719775))))

(declare-fun res!841903 () Bool)

(assert (=> b!1264118 (=> (not res!841903) (not e!719775))))

(assert (=> b!1264118 (= res!841903 (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun d!138571 () Bool)

(assert (=> d!138571 e!719781))

(declare-fun res!841908 () Bool)

(assert (=> d!138571 (=> (not res!841908) (not e!719781))))

(assert (=> d!138571 (= res!841908 (or (bvsge #b00000000000000000000000000000000 (size!40283 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))))

(declare-fun lt!573407 () ListLongMap!19027)

(assert (=> d!138571 (= lt!573399 lt!573407)))

(declare-fun lt!573402 () Unit!41977)

(assert (=> d!138571 (= lt!573402 e!719787)))

(declare-fun c!123094 () Bool)

(assert (=> d!138571 (= c!123094 e!719782)))

(declare-fun res!841909 () Bool)

(assert (=> d!138571 (=> (not res!841909) (not e!719782))))

(assert (=> d!138571 (= res!841909 (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(assert (=> d!138571 (= lt!573407 e!719786)))

(assert (=> d!138571 (= c!123095 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138571 (validMask!0 mask!1466)))

(assert (=> d!138571 (= (getCurrentListMap!4582 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573399)))

(declare-fun b!1264130 () Bool)

(declare-fun c!123096 () Bool)

(assert (=> b!1264130 (= c!123096 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1264130 (= e!719779 e!719784)))

(declare-fun b!1264131 () Bool)

(assert (=> b!1264131 (= e!719784 call!62298)))

(declare-fun b!1264132 () Bool)

(assert (=> b!1264132 (= e!719778 (= (apply!997 lt!573399 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1264133 () Bool)

(assert (=> b!1264133 (= e!719775 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138571 c!123095) b!1264123))

(assert (= (and d!138571 (not c!123095)) b!1264126))

(assert (= (and b!1264126 c!123091) b!1264125))

(assert (= (and b!1264126 (not c!123091)) b!1264130))

(assert (= (and b!1264130 c!123096) b!1264131))

(assert (= (and b!1264130 (not c!123096)) b!1264127))

(assert (= (or b!1264131 b!1264127) bm!62295))

(assert (= (or b!1264125 bm!62295) bm!62299))

(assert (= (or b!1264125 b!1264131) bm!62294))

(assert (= (or b!1264123 bm!62299) bm!62297))

(assert (= (or b!1264123 bm!62294) bm!62300))

(assert (= (and d!138571 res!841909) b!1264113))

(assert (= (and d!138571 c!123094) b!1264121))

(assert (= (and d!138571 (not c!123094)) b!1264115))

(assert (= (and d!138571 res!841908) b!1264118))

(assert (= (and b!1264118 res!841903) b!1264133))

(assert (= (and b!1264118 (not res!841905)) b!1264128))

(assert (= (and b!1264128 res!841910) b!1264114))

(assert (= (and b!1264118 res!841907) b!1264120))

(assert (= (and b!1264120 c!123093) b!1264117))

(assert (= (and b!1264120 (not c!123093)) b!1264129))

(assert (= (and b!1264117 res!841906) b!1264122))

(assert (= (or b!1264117 b!1264129) bm!62298))

(assert (= (and b!1264120 res!841904) b!1264119))

(assert (= (and b!1264119 c!123092) b!1264124))

(assert (= (and b!1264119 (not c!123092)) b!1264116))

(assert (= (and b!1264124 res!841911) b!1264132))

(assert (= (or b!1264124 b!1264116) bm!62296))

(declare-fun b_lambda!23007 () Bool)

(assert (=> (not b_lambda!23007) (not b!1264114)))

(assert (=> b!1264114 t!41861))

(declare-fun b_and!45533 () Bool)

(assert (= b_and!45531 (and (=> t!41861 result!23405) b_and!45533)))

(declare-fun m!1164209 () Bool)

(assert (=> b!1264121 m!1164209))

(declare-fun m!1164211 () Bool)

(assert (=> b!1264121 m!1164211))

(declare-fun m!1164213 () Bool)

(assert (=> b!1264121 m!1164213))

(declare-fun m!1164215 () Bool)

(assert (=> b!1264121 m!1164215))

(declare-fun m!1164217 () Bool)

(assert (=> b!1264121 m!1164217))

(declare-fun m!1164219 () Bool)

(assert (=> b!1264121 m!1164219))

(assert (=> b!1264121 m!1164213))

(declare-fun m!1164221 () Bool)

(assert (=> b!1264121 m!1164221))

(declare-fun m!1164223 () Bool)

(assert (=> b!1264121 m!1164223))

(declare-fun m!1164225 () Bool)

(assert (=> b!1264121 m!1164225))

(assert (=> b!1264121 m!1164037))

(declare-fun m!1164227 () Bool)

(assert (=> b!1264121 m!1164227))

(assert (=> b!1264121 m!1164223))

(declare-fun m!1164229 () Bool)

(assert (=> b!1264121 m!1164229))

(declare-fun m!1164231 () Bool)

(assert (=> b!1264121 m!1164231))

(assert (=> b!1264121 m!1164215))

(declare-fun m!1164233 () Bool)

(assert (=> b!1264121 m!1164233))

(assert (=> b!1264121 m!1164231))

(declare-fun m!1164235 () Bool)

(assert (=> b!1264121 m!1164235))

(declare-fun m!1164237 () Bool)

(assert (=> b!1264121 m!1164237))

(assert (=> b!1264121 m!1164159))

(declare-fun m!1164239 () Bool)

(assert (=> bm!62298 m!1164239))

(assert (=> b!1264113 m!1164159))

(assert (=> b!1264113 m!1164159))

(assert (=> b!1264113 m!1164163))

(declare-fun m!1164241 () Bool)

(assert (=> b!1264123 m!1164241))

(assert (=> b!1264133 m!1164159))

(assert (=> b!1264133 m!1164159))

(assert (=> b!1264133 m!1164163))

(assert (=> b!1264114 m!1164167))

(assert (=> b!1264114 m!1164159))

(assert (=> b!1264114 m!1164169))

(assert (=> b!1264114 m!1164167))

(assert (=> b!1264114 m!1164171))

(assert (=> b!1264114 m!1164159))

(declare-fun m!1164243 () Bool)

(assert (=> b!1264114 m!1164243))

(assert (=> b!1264114 m!1164169))

(declare-fun m!1164245 () Bool)

(assert (=> b!1264122 m!1164245))

(assert (=> bm!62297 m!1164037))

(assert (=> b!1264128 m!1164159))

(assert (=> b!1264128 m!1164159))

(declare-fun m!1164247 () Bool)

(assert (=> b!1264128 m!1164247))

(declare-fun m!1164249 () Bool)

(assert (=> bm!62296 m!1164249))

(assert (=> d!138571 m!1164041))

(declare-fun m!1164251 () Bool)

(assert (=> bm!62300 m!1164251))

(declare-fun m!1164253 () Bool)

(assert (=> b!1264132 m!1164253))

(assert (=> b!1263971 d!138571))

(declare-fun d!138573 () Bool)

(assert (=> d!138573 (= (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573413 () Unit!41977)

(declare-fun choose!1888 (array!82403 array!82401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48599 V!48599 V!48599 V!48599 (_ BitVec 32) Int) Unit!41977)

(assert (=> d!138573 (= lt!573413 (choose!1888 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138573 (validMask!0 mask!1466)))

(assert (=> d!138573 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1193 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573413)))

(declare-fun bs!35730 () Bool)

(assert (= bs!35730 d!138573))

(assert (=> bs!35730 m!1164037))

(assert (=> bs!35730 m!1164035))

(declare-fun m!1164255 () Bool)

(assert (=> bs!35730 m!1164255))

(assert (=> bs!35730 m!1164041))

(assert (=> b!1263976 d!138573))

(declare-fun b!1264158 () Bool)

(declare-fun e!719806 () Bool)

(declare-fun lt!573433 () ListLongMap!19027)

(declare-fun isEmpty!1052 (ListLongMap!19027) Bool)

(assert (=> b!1264158 (= e!719806 (isEmpty!1052 lt!573433))))

(declare-fun b!1264159 () Bool)

(declare-fun e!719807 () ListLongMap!19027)

(declare-fun call!62306 () ListLongMap!19027)

(assert (=> b!1264159 (= e!719807 call!62306)))

(declare-fun b!1264160 () Bool)

(declare-fun e!719802 () Bool)

(assert (=> b!1264160 (= e!719802 e!719806)))

(declare-fun c!123107 () Bool)

(assert (=> b!1264160 (= c!123107 (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun b!1264161 () Bool)

(declare-fun res!841922 () Bool)

(declare-fun e!719805 () Bool)

(assert (=> b!1264161 (=> (not res!841922) (not e!719805))))

(assert (=> b!1264161 (= res!841922 (not (contains!7581 lt!573433 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1264162 () Bool)

(declare-fun lt!573429 () Unit!41977)

(declare-fun lt!573430 () Unit!41977)

(assert (=> b!1264162 (= lt!573429 lt!573430)))

(declare-fun lt!573434 () (_ BitVec 64))

(declare-fun lt!573428 () ListLongMap!19027)

(declare-fun lt!573432 () (_ BitVec 64))

(declare-fun lt!573431 () V!48599)

(assert (=> b!1264162 (not (contains!7581 (+!4296 lt!573428 (tuple2!21155 lt!573434 lt!573431)) lt!573432))))

(declare-fun addStillNotContains!333 (ListLongMap!19027 (_ BitVec 64) V!48599 (_ BitVec 64)) Unit!41977)

(assert (=> b!1264162 (= lt!573430 (addStillNotContains!333 lt!573428 lt!573434 lt!573431 lt!573432))))

(assert (=> b!1264162 (= lt!573432 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264162 (= lt!573431 (get!20298 (select (arr!39744 _values!914) #b00000000000000000000000000000000) (dynLambda!3427 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264162 (= lt!573434 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264162 (= lt!573428 call!62306)))

(assert (=> b!1264162 (= e!719807 (+!4296 call!62306 (tuple2!21155 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000) (get!20298 (select (arr!39744 _values!914) #b00000000000000000000000000000000) (dynLambda!3427 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264163 () Bool)

(assert (=> b!1264163 (= e!719805 e!719802)))

(declare-fun c!123108 () Bool)

(declare-fun e!719803 () Bool)

(assert (=> b!1264163 (= c!123108 e!719803)))

(declare-fun res!841923 () Bool)

(assert (=> b!1264163 (=> (not res!841923) (not e!719803))))

(assert (=> b!1264163 (= res!841923 (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun b!1264164 () Bool)

(declare-fun e!719804 () ListLongMap!19027)

(assert (=> b!1264164 (= e!719804 (ListLongMap!19028 Nil!28344))))

(declare-fun b!1264165 () Bool)

(assert (=> b!1264165 (= e!719804 e!719807)))

(declare-fun c!123105 () Bool)

(assert (=> b!1264165 (= c!123105 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264166 () Bool)

(assert (=> b!1264166 (= e!719803 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264166 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138575 () Bool)

(assert (=> d!138575 e!719805))

(declare-fun res!841921 () Bool)

(assert (=> d!138575 (=> (not res!841921) (not e!719805))))

(assert (=> d!138575 (= res!841921 (not (contains!7581 lt!573433 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138575 (= lt!573433 e!719804)))

(declare-fun c!123106 () Bool)

(assert (=> d!138575 (= c!123106 (bvsge #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(assert (=> d!138575 (validMask!0 mask!1466)))

(assert (=> d!138575 (= (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573433)))

(declare-fun b!1264167 () Bool)

(assert (=> b!1264167 (= e!719806 (= lt!573433 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!62303 () Bool)

(assert (=> bm!62303 (= call!62306 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264168 () Bool)

(declare-fun e!719808 () Bool)

(assert (=> b!1264168 (= e!719802 e!719808)))

(assert (=> b!1264168 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun res!841920 () Bool)

(assert (=> b!1264168 (= res!841920 (contains!7581 lt!573433 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264168 (=> (not res!841920) (not e!719808))))

(declare-fun b!1264169 () Bool)

(assert (=> b!1264169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(assert (=> b!1264169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40282 _values!914)))))

(assert (=> b!1264169 (= e!719808 (= (apply!997 lt!573433 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)) (get!20298 (select (arr!39744 _values!914) #b00000000000000000000000000000000) (dynLambda!3427 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!138575 c!123106) b!1264164))

(assert (= (and d!138575 (not c!123106)) b!1264165))

(assert (= (and b!1264165 c!123105) b!1264162))

(assert (= (and b!1264165 (not c!123105)) b!1264159))

(assert (= (or b!1264162 b!1264159) bm!62303))

(assert (= (and d!138575 res!841921) b!1264161))

(assert (= (and b!1264161 res!841922) b!1264163))

(assert (= (and b!1264163 res!841923) b!1264166))

(assert (= (and b!1264163 c!123108) b!1264168))

(assert (= (and b!1264163 (not c!123108)) b!1264160))

(assert (= (and b!1264168 res!841920) b!1264169))

(assert (= (and b!1264160 c!123107) b!1264167))

(assert (= (and b!1264160 (not c!123107)) b!1264158))

(declare-fun b_lambda!23009 () Bool)

(assert (=> (not b_lambda!23009) (not b!1264162)))

(assert (=> b!1264162 t!41861))

(declare-fun b_and!45535 () Bool)

(assert (= b_and!45533 (and (=> t!41861 result!23405) b_and!45535)))

(declare-fun b_lambda!23011 () Bool)

(assert (=> (not b_lambda!23011) (not b!1264169)))

(assert (=> b!1264169 t!41861))

(declare-fun b_and!45537 () Bool)

(assert (= b_and!45535 (and (=> t!41861 result!23405) b_and!45537)))

(declare-fun m!1164257 () Bool)

(assert (=> b!1264167 m!1164257))

(assert (=> b!1264169 m!1164169))

(assert (=> b!1264169 m!1164167))

(assert (=> b!1264169 m!1164171))

(assert (=> b!1264169 m!1164167))

(assert (=> b!1264169 m!1164159))

(declare-fun m!1164259 () Bool)

(assert (=> b!1264169 m!1164259))

(assert (=> b!1264169 m!1164159))

(assert (=> b!1264169 m!1164169))

(assert (=> b!1264162 m!1164167))

(assert (=> b!1264162 m!1164159))

(assert (=> b!1264162 m!1164169))

(declare-fun m!1164261 () Bool)

(assert (=> b!1264162 m!1164261))

(assert (=> b!1264162 m!1164169))

(assert (=> b!1264162 m!1164167))

(assert (=> b!1264162 m!1164171))

(assert (=> b!1264162 m!1164261))

(declare-fun m!1164263 () Bool)

(assert (=> b!1264162 m!1164263))

(declare-fun m!1164265 () Bool)

(assert (=> b!1264162 m!1164265))

(declare-fun m!1164267 () Bool)

(assert (=> b!1264162 m!1164267))

(declare-fun m!1164269 () Bool)

(assert (=> d!138575 m!1164269))

(assert (=> d!138575 m!1164041))

(declare-fun m!1164271 () Bool)

(assert (=> b!1264158 m!1164271))

(assert (=> bm!62303 m!1164257))

(assert (=> b!1264166 m!1164159))

(assert (=> b!1264166 m!1164159))

(assert (=> b!1264166 m!1164163))

(declare-fun m!1164273 () Bool)

(assert (=> b!1264161 m!1164273))

(assert (=> b!1264168 m!1164159))

(assert (=> b!1264168 m!1164159))

(declare-fun m!1164275 () Bool)

(assert (=> b!1264168 m!1164275))

(assert (=> b!1264165 m!1164159))

(assert (=> b!1264165 m!1164159))

(assert (=> b!1264165 m!1164163))

(assert (=> b!1263976 d!138575))

(declare-fun b!1264170 () Bool)

(declare-fun e!719813 () Bool)

(declare-fun lt!573440 () ListLongMap!19027)

(assert (=> b!1264170 (= e!719813 (isEmpty!1052 lt!573440))))

(declare-fun b!1264171 () Bool)

(declare-fun e!719814 () ListLongMap!19027)

(declare-fun call!62307 () ListLongMap!19027)

(assert (=> b!1264171 (= e!719814 call!62307)))

(declare-fun b!1264172 () Bool)

(declare-fun e!719809 () Bool)

(assert (=> b!1264172 (= e!719809 e!719813)))

(declare-fun c!123111 () Bool)

(assert (=> b!1264172 (= c!123111 (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun b!1264173 () Bool)

(declare-fun res!841926 () Bool)

(declare-fun e!719812 () Bool)

(assert (=> b!1264173 (=> (not res!841926) (not e!719812))))

(assert (=> b!1264173 (= res!841926 (not (contains!7581 lt!573440 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1264174 () Bool)

(declare-fun lt!573436 () Unit!41977)

(declare-fun lt!573437 () Unit!41977)

(assert (=> b!1264174 (= lt!573436 lt!573437)))

(declare-fun lt!573435 () ListLongMap!19027)

(declare-fun lt!573441 () (_ BitVec 64))

(declare-fun lt!573438 () V!48599)

(declare-fun lt!573439 () (_ BitVec 64))

(assert (=> b!1264174 (not (contains!7581 (+!4296 lt!573435 (tuple2!21155 lt!573441 lt!573438)) lt!573439))))

(assert (=> b!1264174 (= lt!573437 (addStillNotContains!333 lt!573435 lt!573441 lt!573438 lt!573439))))

(assert (=> b!1264174 (= lt!573439 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264174 (= lt!573438 (get!20298 (select (arr!39744 _values!914) #b00000000000000000000000000000000) (dynLambda!3427 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264174 (= lt!573441 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264174 (= lt!573435 call!62307)))

(assert (=> b!1264174 (= e!719814 (+!4296 call!62307 (tuple2!21155 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000) (get!20298 (select (arr!39744 _values!914) #b00000000000000000000000000000000) (dynLambda!3427 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264175 () Bool)

(assert (=> b!1264175 (= e!719812 e!719809)))

(declare-fun c!123112 () Bool)

(declare-fun e!719810 () Bool)

(assert (=> b!1264175 (= c!123112 e!719810)))

(declare-fun res!841927 () Bool)

(assert (=> b!1264175 (=> (not res!841927) (not e!719810))))

(assert (=> b!1264175 (= res!841927 (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun b!1264176 () Bool)

(declare-fun e!719811 () ListLongMap!19027)

(assert (=> b!1264176 (= e!719811 (ListLongMap!19028 Nil!28344))))

(declare-fun b!1264177 () Bool)

(assert (=> b!1264177 (= e!719811 e!719814)))

(declare-fun c!123109 () Bool)

(assert (=> b!1264177 (= c!123109 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264178 () Bool)

(assert (=> b!1264178 (= e!719810 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264178 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138577 () Bool)

(assert (=> d!138577 e!719812))

(declare-fun res!841925 () Bool)

(assert (=> d!138577 (=> (not res!841925) (not e!719812))))

(assert (=> d!138577 (= res!841925 (not (contains!7581 lt!573440 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138577 (= lt!573440 e!719811)))

(declare-fun c!123110 () Bool)

(assert (=> d!138577 (= c!123110 (bvsge #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(assert (=> d!138577 (validMask!0 mask!1466)))

(assert (=> d!138577 (= (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573440)))

(declare-fun b!1264179 () Bool)

(assert (=> b!1264179 (= e!719813 (= lt!573440 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!62304 () Bool)

(assert (=> bm!62304 (= call!62307 (getCurrentListMapNoExtraKeys!5893 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264180 () Bool)

(declare-fun e!719815 () Bool)

(assert (=> b!1264180 (= e!719809 e!719815)))

(assert (=> b!1264180 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(declare-fun res!841924 () Bool)

(assert (=> b!1264180 (= res!841924 (contains!7581 lt!573440 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264180 (=> (not res!841924) (not e!719815))))

(declare-fun b!1264181 () Bool)

(assert (=> b!1264181 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(assert (=> b!1264181 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40282 _values!914)))))

(assert (=> b!1264181 (= e!719815 (= (apply!997 lt!573440 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)) (get!20298 (select (arr!39744 _values!914) #b00000000000000000000000000000000) (dynLambda!3427 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!138577 c!123110) b!1264176))

(assert (= (and d!138577 (not c!123110)) b!1264177))

(assert (= (and b!1264177 c!123109) b!1264174))

(assert (= (and b!1264177 (not c!123109)) b!1264171))

(assert (= (or b!1264174 b!1264171) bm!62304))

(assert (= (and d!138577 res!841925) b!1264173))

(assert (= (and b!1264173 res!841926) b!1264175))

(assert (= (and b!1264175 res!841927) b!1264178))

(assert (= (and b!1264175 c!123112) b!1264180))

(assert (= (and b!1264175 (not c!123112)) b!1264172))

(assert (= (and b!1264180 res!841924) b!1264181))

(assert (= (and b!1264172 c!123111) b!1264179))

(assert (= (and b!1264172 (not c!123111)) b!1264170))

(declare-fun b_lambda!23013 () Bool)

(assert (=> (not b_lambda!23013) (not b!1264174)))

(assert (=> b!1264174 t!41861))

(declare-fun b_and!45539 () Bool)

(assert (= b_and!45537 (and (=> t!41861 result!23405) b_and!45539)))

(declare-fun b_lambda!23015 () Bool)

(assert (=> (not b_lambda!23015) (not b!1264181)))

(assert (=> b!1264181 t!41861))

(declare-fun b_and!45541 () Bool)

(assert (= b_and!45539 (and (=> t!41861 result!23405) b_and!45541)))

(declare-fun m!1164277 () Bool)

(assert (=> b!1264179 m!1164277))

(assert (=> b!1264181 m!1164169))

(assert (=> b!1264181 m!1164167))

(assert (=> b!1264181 m!1164171))

(assert (=> b!1264181 m!1164167))

(assert (=> b!1264181 m!1164159))

(declare-fun m!1164279 () Bool)

(assert (=> b!1264181 m!1164279))

(assert (=> b!1264181 m!1164159))

(assert (=> b!1264181 m!1164169))

(assert (=> b!1264174 m!1164167))

(assert (=> b!1264174 m!1164159))

(assert (=> b!1264174 m!1164169))

(declare-fun m!1164281 () Bool)

(assert (=> b!1264174 m!1164281))

(assert (=> b!1264174 m!1164169))

(assert (=> b!1264174 m!1164167))

(assert (=> b!1264174 m!1164171))

(assert (=> b!1264174 m!1164281))

(declare-fun m!1164283 () Bool)

(assert (=> b!1264174 m!1164283))

(declare-fun m!1164285 () Bool)

(assert (=> b!1264174 m!1164285))

(declare-fun m!1164287 () Bool)

(assert (=> b!1264174 m!1164287))

(declare-fun m!1164289 () Bool)

(assert (=> d!138577 m!1164289))

(assert (=> d!138577 m!1164041))

(declare-fun m!1164291 () Bool)

(assert (=> b!1264170 m!1164291))

(assert (=> bm!62304 m!1164277))

(assert (=> b!1264178 m!1164159))

(assert (=> b!1264178 m!1164159))

(assert (=> b!1264178 m!1164163))

(declare-fun m!1164293 () Bool)

(assert (=> b!1264173 m!1164293))

(assert (=> b!1264180 m!1164159))

(assert (=> b!1264180 m!1164159))

(declare-fun m!1164295 () Bool)

(assert (=> b!1264180 m!1164295))

(assert (=> b!1264177 m!1164159))

(assert (=> b!1264177 m!1164159))

(assert (=> b!1264177 m!1164163))

(assert (=> b!1263976 d!138577))

(declare-fun d!138579 () Bool)

(declare-fun e!719816 () Bool)

(assert (=> d!138579 e!719816))

(declare-fun res!841928 () Bool)

(assert (=> d!138579 (=> (not res!841928) (not e!719816))))

(declare-fun lt!573443 () ListLongMap!19027)

(assert (=> d!138579 (= res!841928 (contains!7581 lt!573443 (_1!10588 lt!573249)))))

(declare-fun lt!573445 () List!28347)

(assert (=> d!138579 (= lt!573443 (ListLongMap!19028 lt!573445))))

(declare-fun lt!573444 () Unit!41977)

(declare-fun lt!573442 () Unit!41977)

(assert (=> d!138579 (= lt!573444 lt!573442)))

(assert (=> d!138579 (= (getValueByKey!671 lt!573445 (_1!10588 lt!573249)) (Some!721 (_2!10588 lt!573249)))))

(assert (=> d!138579 (= lt!573442 (lemmaContainsTupThenGetReturnValue!339 lt!573445 (_1!10588 lt!573249) (_2!10588 lt!573249)))))

(assert (=> d!138579 (= lt!573445 (insertStrictlySorted!453 (toList!9529 lt!573246) (_1!10588 lt!573249) (_2!10588 lt!573249)))))

(assert (=> d!138579 (= (+!4296 lt!573246 lt!573249) lt!573443)))

(declare-fun b!1264182 () Bool)

(declare-fun res!841929 () Bool)

(assert (=> b!1264182 (=> (not res!841929) (not e!719816))))

(assert (=> b!1264182 (= res!841929 (= (getValueByKey!671 (toList!9529 lt!573443) (_1!10588 lt!573249)) (Some!721 (_2!10588 lt!573249))))))

(declare-fun b!1264183 () Bool)

(assert (=> b!1264183 (= e!719816 (contains!7583 (toList!9529 lt!573443) lt!573249))))

(assert (= (and d!138579 res!841928) b!1264182))

(assert (= (and b!1264182 res!841929) b!1264183))

(declare-fun m!1164297 () Bool)

(assert (=> d!138579 m!1164297))

(declare-fun m!1164299 () Bool)

(assert (=> d!138579 m!1164299))

(declare-fun m!1164301 () Bool)

(assert (=> d!138579 m!1164301))

(declare-fun m!1164303 () Bool)

(assert (=> d!138579 m!1164303))

(declare-fun m!1164305 () Bool)

(assert (=> b!1264182 m!1164305))

(declare-fun m!1164307 () Bool)

(assert (=> b!1264183 m!1164307))

(assert (=> b!1263974 d!138579))

(declare-fun d!138581 () Bool)

(assert (=> d!138581 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106162 d!138581))

(declare-fun d!138583 () Bool)

(assert (=> d!138583 (= (array_inv!30409 _keys!1118) (bvsge (size!40283 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106162 d!138583))

(declare-fun d!138585 () Bool)

(assert (=> d!138585 (= (array_inv!30410 _values!914) (bvsge (size!40282 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106162 d!138585))

(declare-fun b!1264194 () Bool)

(declare-fun e!719825 () Bool)

(declare-fun e!719828 () Bool)

(assert (=> b!1264194 (= e!719825 e!719828)))

(declare-fun c!123115 () Bool)

(assert (=> b!1264194 (= c!123115 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264195 () Bool)

(declare-fun call!62310 () Bool)

(assert (=> b!1264195 (= e!719828 call!62310)))

(declare-fun b!1264196 () Bool)

(declare-fun e!719826 () Bool)

(declare-fun contains!7584 (List!28348 (_ BitVec 64)) Bool)

(assert (=> b!1264196 (= e!719826 (contains!7584 Nil!28345 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264197 () Bool)

(assert (=> b!1264197 (= e!719828 call!62310)))

(declare-fun bm!62307 () Bool)

(assert (=> bm!62307 (= call!62310 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123115 (Cons!28344 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000) Nil!28345) Nil!28345)))))

(declare-fun b!1264198 () Bool)

(declare-fun e!719827 () Bool)

(assert (=> b!1264198 (= e!719827 e!719825)))

(declare-fun res!841937 () Bool)

(assert (=> b!1264198 (=> (not res!841937) (not e!719825))))

(assert (=> b!1264198 (= res!841937 (not e!719826))))

(declare-fun res!841936 () Bool)

(assert (=> b!1264198 (=> (not res!841936) (not e!719826))))

(assert (=> b!1264198 (= res!841936 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138587 () Bool)

(declare-fun res!841938 () Bool)

(assert (=> d!138587 (=> res!841938 e!719827)))

(assert (=> d!138587 (= res!841938 (bvsge #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(assert (=> d!138587 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28345) e!719827)))

(assert (= (and d!138587 (not res!841938)) b!1264198))

(assert (= (and b!1264198 res!841936) b!1264196))

(assert (= (and b!1264198 res!841937) b!1264194))

(assert (= (and b!1264194 c!123115) b!1264195))

(assert (= (and b!1264194 (not c!123115)) b!1264197))

(assert (= (or b!1264195 b!1264197) bm!62307))

(assert (=> b!1264194 m!1164159))

(assert (=> b!1264194 m!1164159))

(assert (=> b!1264194 m!1164163))

(assert (=> b!1264196 m!1164159))

(assert (=> b!1264196 m!1164159))

(declare-fun m!1164309 () Bool)

(assert (=> b!1264196 m!1164309))

(assert (=> bm!62307 m!1164159))

(declare-fun m!1164311 () Bool)

(assert (=> bm!62307 m!1164311))

(assert (=> b!1264198 m!1164159))

(assert (=> b!1264198 m!1164159))

(assert (=> b!1264198 m!1164163))

(assert (=> b!1263973 d!138587))

(declare-fun bm!62310 () Bool)

(declare-fun call!62313 () Bool)

(assert (=> bm!62310 (= call!62313 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138589 () Bool)

(declare-fun res!841943 () Bool)

(declare-fun e!719836 () Bool)

(assert (=> d!138589 (=> res!841943 e!719836)))

(assert (=> d!138589 (= res!841943 (bvsge #b00000000000000000000000000000000 (size!40283 _keys!1118)))))

(assert (=> d!138589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719836)))

(declare-fun b!1264207 () Bool)

(declare-fun e!719837 () Bool)

(assert (=> b!1264207 (= e!719837 call!62313)))

(declare-fun b!1264208 () Bool)

(declare-fun e!719835 () Bool)

(assert (=> b!1264208 (= e!719836 e!719835)))

(declare-fun c!123118 () Bool)

(assert (=> b!1264208 (= c!123118 (validKeyInArray!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264209 () Bool)

(assert (=> b!1264209 (= e!719835 e!719837)))

(declare-fun lt!573454 () (_ BitVec 64))

(assert (=> b!1264209 (= lt!573454 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573452 () Unit!41977)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82403 (_ BitVec 64) (_ BitVec 32)) Unit!41977)

(assert (=> b!1264209 (= lt!573452 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573454 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1264209 (arrayContainsKey!0 _keys!1118 lt!573454 #b00000000000000000000000000000000)))

(declare-fun lt!573453 () Unit!41977)

(assert (=> b!1264209 (= lt!573453 lt!573452)))

(declare-fun res!841944 () Bool)

(declare-datatypes ((SeekEntryResult!9981 0))(
  ( (MissingZero!9981 (index!42295 (_ BitVec 32))) (Found!9981 (index!42296 (_ BitVec 32))) (Intermediate!9981 (undefined!10793 Bool) (index!42297 (_ BitVec 32)) (x!111381 (_ BitVec 32))) (Undefined!9981) (MissingVacant!9981 (index!42298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82403 (_ BitVec 32)) SeekEntryResult!9981)

(assert (=> b!1264209 (= res!841944 (= (seekEntryOrOpen!0 (select (arr!39745 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9981 #b00000000000000000000000000000000)))))

(assert (=> b!1264209 (=> (not res!841944) (not e!719837))))

(declare-fun b!1264210 () Bool)

(assert (=> b!1264210 (= e!719835 call!62313)))

(assert (= (and d!138589 (not res!841943)) b!1264208))

(assert (= (and b!1264208 c!123118) b!1264209))

(assert (= (and b!1264208 (not c!123118)) b!1264210))

(assert (= (and b!1264209 res!841944) b!1264207))

(assert (= (or b!1264207 b!1264210) bm!62310))

(declare-fun m!1164313 () Bool)

(assert (=> bm!62310 m!1164313))

(assert (=> b!1264208 m!1164159))

(assert (=> b!1264208 m!1164159))

(assert (=> b!1264208 m!1164163))

(assert (=> b!1264209 m!1164159))

(declare-fun m!1164315 () Bool)

(assert (=> b!1264209 m!1164315))

(declare-fun m!1164317 () Bool)

(assert (=> b!1264209 m!1164317))

(assert (=> b!1264209 m!1164159))

(declare-fun m!1164319 () Bool)

(assert (=> b!1264209 m!1164319))

(assert (=> b!1263972 d!138589))

(declare-fun b!1264218 () Bool)

(declare-fun e!719842 () Bool)

(assert (=> b!1264218 (= e!719842 tp_is_empty!32425)))

(declare-fun mapIsEmpty!50479 () Bool)

(declare-fun mapRes!50479 () Bool)

(assert (=> mapIsEmpty!50479 mapRes!50479))

(declare-fun mapNonEmpty!50479 () Bool)

(declare-fun tp!96146 () Bool)

(declare-fun e!719843 () Bool)

(assert (=> mapNonEmpty!50479 (= mapRes!50479 (and tp!96146 e!719843))))

(declare-fun mapKey!50479 () (_ BitVec 32))

(declare-fun mapValue!50479 () ValueCell!15449)

(declare-fun mapRest!50479 () (Array (_ BitVec 32) ValueCell!15449))

(assert (=> mapNonEmpty!50479 (= mapRest!50470 (store mapRest!50479 mapKey!50479 mapValue!50479))))

(declare-fun b!1264217 () Bool)

(assert (=> b!1264217 (= e!719843 tp_is_empty!32425)))

(declare-fun condMapEmpty!50479 () Bool)

(declare-fun mapDefault!50479 () ValueCell!15449)

(assert (=> mapNonEmpty!50470 (= condMapEmpty!50479 (= mapRest!50470 ((as const (Array (_ BitVec 32) ValueCell!15449)) mapDefault!50479)))))

(assert (=> mapNonEmpty!50470 (= tp!96130 (and e!719842 mapRes!50479))))

(assert (= (and mapNonEmpty!50470 condMapEmpty!50479) mapIsEmpty!50479))

(assert (= (and mapNonEmpty!50470 (not condMapEmpty!50479)) mapNonEmpty!50479))

(assert (= (and mapNonEmpty!50479 ((_ is ValueCellFull!15449) mapValue!50479)) b!1264217))

(assert (= (and mapNonEmpty!50470 ((_ is ValueCellFull!15449) mapDefault!50479)) b!1264218))

(declare-fun m!1164321 () Bool)

(assert (=> mapNonEmpty!50479 m!1164321))

(declare-fun b_lambda!23017 () Bool)

(assert (= b_lambda!23009 (or (and start!106162 b_free!27523) b_lambda!23017)))

(declare-fun b_lambda!23019 () Bool)

(assert (= b_lambda!23007 (or (and start!106162 b_free!27523) b_lambda!23019)))

(declare-fun b_lambda!23021 () Bool)

(assert (= b_lambda!23005 (or (and start!106162 b_free!27523) b_lambda!23021)))

(declare-fun b_lambda!23023 () Bool)

(assert (= b_lambda!23011 (or (and start!106162 b_free!27523) b_lambda!23023)))

(declare-fun b_lambda!23025 () Bool)

(assert (= b_lambda!23015 (or (and start!106162 b_free!27523) b_lambda!23025)))

(declare-fun b_lambda!23027 () Bool)

(assert (= b_lambda!23013 (or (and start!106162 b_free!27523) b_lambda!23027)))

(check-sat (not b!1264158) (not b!1264182) (not d!138567) (not bm!62291) (not d!138577) (not bm!62296) (not b!1264114) (not d!138573) (not bm!62297) (not bm!62304) (not b_lambda!23023) (not b!1264101) (not bm!62310) (not b!1264183) (not b!1264209) (not b!1264165) tp_is_empty!32425 (not b!1264167) (not b_lambda!23019) (not b_next!27523) (not b!1264092) (not b_lambda!23025) (not b_lambda!23021) (not b!1264133) (not b!1264123) (not b!1264178) (not bm!62307) (not bm!62298) (not bm!62300) (not b!1264162) (not b!1264181) (not bm!62289) (not b!1264039) (not b!1264180) (not b!1264113) (not b!1264110) (not b_lambda!23017) (not b!1264170) (not d!138575) (not b!1264109) (not b!1264112) (not b!1264179) (not b!1264128) (not d!138571) (not b!1264174) (not d!138569) (not b!1264121) (not b!1264161) (not b!1264208) (not b!1264122) (not b!1264196) (not b!1264173) (not b!1264132) (not b!1264194) (not b!1264169) (not d!138565) (not b!1264102) (not d!138563) b_and!45541 (not d!138579) (not b!1264097) (not b!1264037) (not b!1264090) (not bm!62293) (not b!1264198) (not b!1264168) (not bm!62303) (not b!1264083) (not mapNonEmpty!50479) (not b!1264082) (not bm!62290) (not b!1264166) (not b!1264091) (not b!1264111) (not b_lambda!23027) (not b!1264177))
(check-sat b_and!45541 (not b_next!27523))
