; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42148 () Bool)

(assert start!42148)

(declare-fun b_free!11695 () Bool)

(declare-fun b_next!11695 () Bool)

(assert (=> start!42148 (= b_free!11695 (not b_next!11695))))

(declare-fun tp!41106 () Bool)

(declare-fun b_and!20091 () Bool)

(assert (=> start!42148 (= tp!41106 b_and!20091)))

(declare-fun b!470407 () Bool)

(declare-fun e!275595 () Bool)

(declare-fun e!275596 () Bool)

(declare-fun mapRes!21385 () Bool)

(assert (=> b!470407 (= e!275595 (and e!275596 mapRes!21385))))

(declare-fun condMapEmpty!21385 () Bool)

(declare-datatypes ((V!18603 0))(
  ( (V!18604 (val!6606 Int)) )
))
(declare-datatypes ((ValueCell!6218 0))(
  ( (ValueCellFull!6218 (v!8891 V!18603)) (EmptyCell!6218) )
))
(declare-datatypes ((array!29993 0))(
  ( (array!29994 (arr!14420 (Array (_ BitVec 32) ValueCell!6218)) (size!14773 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29993)

(declare-fun mapDefault!21385 () ValueCell!6218)

(assert (=> b!470407 (= condMapEmpty!21385 (= (arr!14420 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6218)) mapDefault!21385)))))

(declare-fun b!470408 () Bool)

(declare-fun res!281108 () Bool)

(declare-fun e!275593 () Bool)

(assert (=> b!470408 (=> (not res!281108) (not e!275593))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29995 0))(
  ( (array!29996 (arr!14421 (Array (_ BitVec 32) (_ BitVec 64))) (size!14774 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29995)

(assert (=> b!470408 (= res!281108 (and (= (size!14773 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14774 _keys!1025) (size!14773 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21385 () Bool)

(assert (=> mapIsEmpty!21385 mapRes!21385))

(declare-fun b!470409 () Bool)

(declare-fun res!281107 () Bool)

(assert (=> b!470409 (=> (not res!281107) (not e!275593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29995 (_ BitVec 32)) Bool)

(assert (=> b!470409 (= res!281107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470411 () Bool)

(declare-fun tp_is_empty!13123 () Bool)

(assert (=> b!470411 (= e!275596 tp_is_empty!13123)))

(declare-fun b!470412 () Bool)

(assert (=> b!470412 (= e!275593 (not (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14774 _keys!1025)))))))

(declare-datatypes ((tuple2!8732 0))(
  ( (tuple2!8733 (_1!4377 (_ BitVec 64)) (_2!4377 V!18603)) )
))
(declare-datatypes ((List!8801 0))(
  ( (Nil!8798) (Cons!8797 (h!9653 tuple2!8732) (t!14754 List!8801)) )
))
(declare-datatypes ((ListLongMap!7635 0))(
  ( (ListLongMap!7636 (toList!3833 List!8801)) )
))
(declare-fun lt!213323 () ListLongMap!7635)

(declare-fun lt!213324 () ListLongMap!7635)

(assert (=> b!470412 (= lt!213323 lt!213324)))

(declare-fun minValueBefore!38 () V!18603)

(declare-fun zeroValue!794 () V!18603)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13767 0))(
  ( (Unit!13768) )
))
(declare-fun lt!213322 () Unit!13767)

(declare-fun minValueAfter!38 () V!18603)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!165 (array!29995 array!29993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18603 V!18603 V!18603 V!18603 (_ BitVec 32) Int) Unit!13767)

(assert (=> b!470412 (= lt!213322 (lemmaNoChangeToArrayThenSameMapNoExtras!165 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2008 (array!29995 array!29993 (_ BitVec 32) (_ BitVec 32) V!18603 V!18603 (_ BitVec 32) Int) ListLongMap!7635)

(assert (=> b!470412 (= lt!213324 (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470412 (= lt!213323 (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21385 () Bool)

(declare-fun tp!41107 () Bool)

(declare-fun e!275594 () Bool)

(assert (=> mapNonEmpty!21385 (= mapRes!21385 (and tp!41107 e!275594))))

(declare-fun mapKey!21385 () (_ BitVec 32))

(declare-fun mapValue!21385 () ValueCell!6218)

(declare-fun mapRest!21385 () (Array (_ BitVec 32) ValueCell!6218))

(assert (=> mapNonEmpty!21385 (= (arr!14420 _values!833) (store mapRest!21385 mapKey!21385 mapValue!21385))))

(declare-fun b!470413 () Bool)

(assert (=> b!470413 (= e!275594 tp_is_empty!13123)))

(declare-fun b!470410 () Bool)

(declare-fun res!281109 () Bool)

(assert (=> b!470410 (=> (not res!281109) (not e!275593))))

(declare-datatypes ((List!8802 0))(
  ( (Nil!8799) (Cons!8798 (h!9654 (_ BitVec 64)) (t!14755 List!8802)) )
))
(declare-fun arrayNoDuplicates!0 (array!29995 (_ BitVec 32) List!8802) Bool)

(assert (=> b!470410 (= res!281109 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8799))))

(declare-fun res!281106 () Bool)

(assert (=> start!42148 (=> (not res!281106) (not e!275593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42148 (= res!281106 (validMask!0 mask!1365))))

(assert (=> start!42148 e!275593))

(assert (=> start!42148 tp_is_empty!13123))

(assert (=> start!42148 tp!41106))

(assert (=> start!42148 true))

(declare-fun array_inv!10486 (array!29995) Bool)

(assert (=> start!42148 (array_inv!10486 _keys!1025)))

(declare-fun array_inv!10487 (array!29993) Bool)

(assert (=> start!42148 (and (array_inv!10487 _values!833) e!275595)))

(assert (= (and start!42148 res!281106) b!470408))

(assert (= (and b!470408 res!281108) b!470409))

(assert (= (and b!470409 res!281107) b!470410))

(assert (= (and b!470410 res!281109) b!470412))

(assert (= (and b!470407 condMapEmpty!21385) mapIsEmpty!21385))

(assert (= (and b!470407 (not condMapEmpty!21385)) mapNonEmpty!21385))

(get-info :version)

(assert (= (and mapNonEmpty!21385 ((_ is ValueCellFull!6218) mapValue!21385)) b!470413))

(assert (= (and b!470407 ((_ is ValueCellFull!6218) mapDefault!21385)) b!470411))

(assert (= start!42148 b!470407))

(declare-fun m!452199 () Bool)

(assert (=> mapNonEmpty!21385 m!452199))

(declare-fun m!452201 () Bool)

(assert (=> b!470412 m!452201))

(declare-fun m!452203 () Bool)

(assert (=> b!470412 m!452203))

(declare-fun m!452205 () Bool)

(assert (=> b!470412 m!452205))

(declare-fun m!452207 () Bool)

(assert (=> b!470410 m!452207))

(declare-fun m!452209 () Bool)

(assert (=> b!470409 m!452209))

(declare-fun m!452211 () Bool)

(assert (=> start!42148 m!452211))

(declare-fun m!452213 () Bool)

(assert (=> start!42148 m!452213))

(declare-fun m!452215 () Bool)

(assert (=> start!42148 m!452215))

(check-sat (not mapNonEmpty!21385) (not b!470409) (not start!42148) (not b!470412) (not b!470410) (not b_next!11695) b_and!20091 tp_is_empty!13123)
(check-sat b_and!20091 (not b_next!11695))
(get-model)

(declare-fun d!75161 () Bool)

(assert (=> d!75161 (= (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213345 () Unit!13767)

(declare-fun choose!1354 (array!29995 array!29993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18603 V!18603 V!18603 V!18603 (_ BitVec 32) Int) Unit!13767)

(assert (=> d!75161 (= lt!213345 (choose!1354 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75161 (validMask!0 mask!1365)))

(assert (=> d!75161 (= (lemmaNoChangeToArrayThenSameMapNoExtras!165 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213345)))

(declare-fun bs!14890 () Bool)

(assert (= bs!14890 d!75161))

(assert (=> bs!14890 m!452205))

(assert (=> bs!14890 m!452203))

(declare-fun m!452253 () Bool)

(assert (=> bs!14890 m!452253))

(assert (=> bs!14890 m!452211))

(assert (=> b!470412 d!75161))

(declare-fun b!470480 () Bool)

(declare-fun e!275647 () Bool)

(declare-fun lt!213365 () ListLongMap!7635)

(declare-fun isEmpty!579 (ListLongMap!7635) Bool)

(assert (=> b!470480 (= e!275647 (isEmpty!579 lt!213365))))

(declare-fun b!470481 () Bool)

(declare-fun e!275642 () Bool)

(assert (=> b!470481 (= e!275642 e!275647)))

(declare-fun c!56882 () Bool)

(assert (=> b!470481 (= c!56882 (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(declare-fun b!470482 () Bool)

(declare-fun e!275645 () ListLongMap!7635)

(declare-fun call!30409 () ListLongMap!7635)

(assert (=> b!470482 (= e!275645 call!30409)))

(declare-fun b!470483 () Bool)

(assert (=> b!470483 (= e!275647 (= lt!213365 (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!470484 () Bool)

(declare-fun res!281143 () Bool)

(declare-fun e!275644 () Bool)

(assert (=> b!470484 (=> (not res!281143) (not e!275644))))

(declare-fun contains!2531 (ListLongMap!7635 (_ BitVec 64)) Bool)

(assert (=> b!470484 (= res!281143 (not (contains!2531 lt!213365 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!470485 () Bool)

(assert (=> b!470485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> b!470485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14773 _values!833)))))

(declare-fun e!275643 () Bool)

(declare-fun apply!328 (ListLongMap!7635 (_ BitVec 64)) V!18603)

(declare-fun get!7045 (ValueCell!6218 V!18603) V!18603)

(declare-fun dynLambda!924 (Int (_ BitVec 64)) V!18603)

(assert (=> b!470485 (= e!275643 (= (apply!328 lt!213365 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)) (get!7045 (select (arr!14420 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!470486 () Bool)

(declare-fun e!275646 () ListLongMap!7635)

(assert (=> b!470486 (= e!275646 (ListLongMap!7636 Nil!8798))))

(declare-fun b!470487 () Bool)

(assert (=> b!470487 (= e!275644 e!275642)))

(declare-fun c!56881 () Bool)

(declare-fun e!275641 () Bool)

(assert (=> b!470487 (= c!56881 e!275641)))

(declare-fun res!281145 () Bool)

(assert (=> b!470487 (=> (not res!281145) (not e!275641))))

(assert (=> b!470487 (= res!281145 (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(declare-fun b!470488 () Bool)

(assert (=> b!470488 (= e!275642 e!275643)))

(assert (=> b!470488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(declare-fun res!281142 () Bool)

(assert (=> b!470488 (= res!281142 (contains!2531 lt!213365 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470488 (=> (not res!281142) (not e!275643))))

(declare-fun b!470489 () Bool)

(assert (=> b!470489 (= e!275646 e!275645)))

(declare-fun c!56880 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!470489 (= c!56880 (validKeyInArray!0 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470490 () Bool)

(assert (=> b!470490 (= e!275641 (validKeyInArray!0 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470490 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!470491 () Bool)

(declare-fun lt!213364 () Unit!13767)

(declare-fun lt!213360 () Unit!13767)

(assert (=> b!470491 (= lt!213364 lt!213360)))

(declare-fun lt!213361 () (_ BitVec 64))

(declare-fun lt!213363 () (_ BitVec 64))

(declare-fun lt!213362 () V!18603)

(declare-fun lt!213366 () ListLongMap!7635)

(declare-fun +!1744 (ListLongMap!7635 tuple2!8732) ListLongMap!7635)

(assert (=> b!470491 (not (contains!2531 (+!1744 lt!213366 (tuple2!8733 lt!213361 lt!213362)) lt!213363))))

(declare-fun addStillNotContains!162 (ListLongMap!7635 (_ BitVec 64) V!18603 (_ BitVec 64)) Unit!13767)

(assert (=> b!470491 (= lt!213360 (addStillNotContains!162 lt!213366 lt!213361 lt!213362 lt!213363))))

(assert (=> b!470491 (= lt!213363 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!470491 (= lt!213362 (get!7045 (select (arr!14420 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!470491 (= lt!213361 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!470491 (= lt!213366 call!30409)))

(assert (=> b!470491 (= e!275645 (+!1744 call!30409 (tuple2!8733 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000) (get!7045 (select (arr!14420 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30406 () Bool)

(assert (=> bm!30406 (= call!30409 (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun d!75163 () Bool)

(assert (=> d!75163 e!275644))

(declare-fun res!281144 () Bool)

(assert (=> d!75163 (=> (not res!281144) (not e!275644))))

(assert (=> d!75163 (= res!281144 (not (contains!2531 lt!213365 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75163 (= lt!213365 e!275646)))

(declare-fun c!56883 () Bool)

(assert (=> d!75163 (= c!56883 (bvsge #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> d!75163 (validMask!0 mask!1365)))

(assert (=> d!75163 (= (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213365)))

(assert (= (and d!75163 c!56883) b!470486))

(assert (= (and d!75163 (not c!56883)) b!470489))

(assert (= (and b!470489 c!56880) b!470491))

(assert (= (and b!470489 (not c!56880)) b!470482))

(assert (= (or b!470491 b!470482) bm!30406))

(assert (= (and d!75163 res!281144) b!470484))

(assert (= (and b!470484 res!281143) b!470487))

(assert (= (and b!470487 res!281145) b!470490))

(assert (= (and b!470487 c!56881) b!470488))

(assert (= (and b!470487 (not c!56881)) b!470481))

(assert (= (and b!470488 res!281142) b!470485))

(assert (= (and b!470481 c!56882) b!470483))

(assert (= (and b!470481 (not c!56882)) b!470480))

(declare-fun b_lambda!10119 () Bool)

(assert (=> (not b_lambda!10119) (not b!470485)))

(declare-fun t!14759 () Bool)

(declare-fun tb!3913 () Bool)

(assert (=> (and start!42148 (= defaultEntry!841 defaultEntry!841) t!14759) tb!3913))

(declare-fun result!7413 () Bool)

(assert (=> tb!3913 (= result!7413 tp_is_empty!13123)))

(assert (=> b!470485 t!14759))

(declare-fun b_and!20097 () Bool)

(assert (= b_and!20091 (and (=> t!14759 result!7413) b_and!20097)))

(declare-fun b_lambda!10121 () Bool)

(assert (=> (not b_lambda!10121) (not b!470491)))

(assert (=> b!470491 t!14759))

(declare-fun b_and!20099 () Bool)

(assert (= b_and!20097 (and (=> t!14759 result!7413) b_and!20099)))

(declare-fun m!452255 () Bool)

(assert (=> d!75163 m!452255))

(assert (=> d!75163 m!452211))

(declare-fun m!452257 () Bool)

(assert (=> b!470490 m!452257))

(assert (=> b!470490 m!452257))

(declare-fun m!452259 () Bool)

(assert (=> b!470490 m!452259))

(declare-fun m!452261 () Bool)

(assert (=> b!470491 m!452261))

(declare-fun m!452263 () Bool)

(assert (=> b!470491 m!452263))

(assert (=> b!470491 m!452263))

(declare-fun m!452265 () Bool)

(assert (=> b!470491 m!452265))

(declare-fun m!452267 () Bool)

(assert (=> b!470491 m!452267))

(declare-fun m!452269 () Bool)

(assert (=> b!470491 m!452269))

(declare-fun m!452271 () Bool)

(assert (=> b!470491 m!452271))

(assert (=> b!470491 m!452257))

(assert (=> b!470491 m!452261))

(assert (=> b!470491 m!452271))

(declare-fun m!452273 () Bool)

(assert (=> b!470491 m!452273))

(assert (=> b!470485 m!452261))

(assert (=> b!470485 m!452257))

(declare-fun m!452275 () Bool)

(assert (=> b!470485 m!452275))

(assert (=> b!470485 m!452271))

(assert (=> b!470485 m!452257))

(assert (=> b!470485 m!452261))

(assert (=> b!470485 m!452271))

(assert (=> b!470485 m!452273))

(assert (=> b!470488 m!452257))

(assert (=> b!470488 m!452257))

(declare-fun m!452277 () Bool)

(assert (=> b!470488 m!452277))

(declare-fun m!452279 () Bool)

(assert (=> b!470480 m!452279))

(declare-fun m!452281 () Bool)

(assert (=> bm!30406 m!452281))

(declare-fun m!452283 () Bool)

(assert (=> b!470484 m!452283))

(assert (=> b!470489 m!452257))

(assert (=> b!470489 m!452257))

(assert (=> b!470489 m!452259))

(assert (=> b!470483 m!452281))

(assert (=> b!470412 d!75163))

(declare-fun b!470494 () Bool)

(declare-fun e!275654 () Bool)

(declare-fun lt!213372 () ListLongMap!7635)

(assert (=> b!470494 (= e!275654 (isEmpty!579 lt!213372))))

(declare-fun b!470495 () Bool)

(declare-fun e!275649 () Bool)

(assert (=> b!470495 (= e!275649 e!275654)))

(declare-fun c!56886 () Bool)

(assert (=> b!470495 (= c!56886 (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(declare-fun b!470496 () Bool)

(declare-fun e!275652 () ListLongMap!7635)

(declare-fun call!30410 () ListLongMap!7635)

(assert (=> b!470496 (= e!275652 call!30410)))

(declare-fun b!470497 () Bool)

(assert (=> b!470497 (= e!275654 (= lt!213372 (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!470498 () Bool)

(declare-fun res!281147 () Bool)

(declare-fun e!275651 () Bool)

(assert (=> b!470498 (=> (not res!281147) (not e!275651))))

(assert (=> b!470498 (= res!281147 (not (contains!2531 lt!213372 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!470499 () Bool)

(assert (=> b!470499 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> b!470499 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14773 _values!833)))))

(declare-fun e!275650 () Bool)

(assert (=> b!470499 (= e!275650 (= (apply!328 lt!213372 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)) (get!7045 (select (arr!14420 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!470500 () Bool)

(declare-fun e!275653 () ListLongMap!7635)

(assert (=> b!470500 (= e!275653 (ListLongMap!7636 Nil!8798))))

(declare-fun b!470501 () Bool)

(assert (=> b!470501 (= e!275651 e!275649)))

(declare-fun c!56885 () Bool)

(declare-fun e!275648 () Bool)

(assert (=> b!470501 (= c!56885 e!275648)))

(declare-fun res!281149 () Bool)

(assert (=> b!470501 (=> (not res!281149) (not e!275648))))

(assert (=> b!470501 (= res!281149 (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(declare-fun b!470502 () Bool)

(assert (=> b!470502 (= e!275649 e!275650)))

(assert (=> b!470502 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(declare-fun res!281146 () Bool)

(assert (=> b!470502 (= res!281146 (contains!2531 lt!213372 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470502 (=> (not res!281146) (not e!275650))))

(declare-fun b!470503 () Bool)

(assert (=> b!470503 (= e!275653 e!275652)))

(declare-fun c!56884 () Bool)

(assert (=> b!470503 (= c!56884 (validKeyInArray!0 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470504 () Bool)

(assert (=> b!470504 (= e!275648 (validKeyInArray!0 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470504 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!470505 () Bool)

(declare-fun lt!213371 () Unit!13767)

(declare-fun lt!213367 () Unit!13767)

(assert (=> b!470505 (= lt!213371 lt!213367)))

(declare-fun lt!213370 () (_ BitVec 64))

(declare-fun lt!213368 () (_ BitVec 64))

(declare-fun lt!213369 () V!18603)

(declare-fun lt!213373 () ListLongMap!7635)

(assert (=> b!470505 (not (contains!2531 (+!1744 lt!213373 (tuple2!8733 lt!213368 lt!213369)) lt!213370))))

(assert (=> b!470505 (= lt!213367 (addStillNotContains!162 lt!213373 lt!213368 lt!213369 lt!213370))))

(assert (=> b!470505 (= lt!213370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!470505 (= lt!213369 (get!7045 (select (arr!14420 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!470505 (= lt!213368 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!470505 (= lt!213373 call!30410)))

(assert (=> b!470505 (= e!275652 (+!1744 call!30410 (tuple2!8733 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000) (get!7045 (select (arr!14420 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30407 () Bool)

(assert (=> bm!30407 (= call!30410 (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun d!75165 () Bool)

(assert (=> d!75165 e!275651))

(declare-fun res!281148 () Bool)

(assert (=> d!75165 (=> (not res!281148) (not e!275651))))

(assert (=> d!75165 (= res!281148 (not (contains!2531 lt!213372 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75165 (= lt!213372 e!275653)))

(declare-fun c!56887 () Bool)

(assert (=> d!75165 (= c!56887 (bvsge #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> d!75165 (validMask!0 mask!1365)))

(assert (=> d!75165 (= (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213372)))

(assert (= (and d!75165 c!56887) b!470500))

(assert (= (and d!75165 (not c!56887)) b!470503))

(assert (= (and b!470503 c!56884) b!470505))

(assert (= (and b!470503 (not c!56884)) b!470496))

(assert (= (or b!470505 b!470496) bm!30407))

(assert (= (and d!75165 res!281148) b!470498))

(assert (= (and b!470498 res!281147) b!470501))

(assert (= (and b!470501 res!281149) b!470504))

(assert (= (and b!470501 c!56885) b!470502))

(assert (= (and b!470501 (not c!56885)) b!470495))

(assert (= (and b!470502 res!281146) b!470499))

(assert (= (and b!470495 c!56886) b!470497))

(assert (= (and b!470495 (not c!56886)) b!470494))

(declare-fun b_lambda!10123 () Bool)

(assert (=> (not b_lambda!10123) (not b!470499)))

(assert (=> b!470499 t!14759))

(declare-fun b_and!20101 () Bool)

(assert (= b_and!20099 (and (=> t!14759 result!7413) b_and!20101)))

(declare-fun b_lambda!10125 () Bool)

(assert (=> (not b_lambda!10125) (not b!470505)))

(assert (=> b!470505 t!14759))

(declare-fun b_and!20103 () Bool)

(assert (= b_and!20101 (and (=> t!14759 result!7413) b_and!20103)))

(declare-fun m!452285 () Bool)

(assert (=> d!75165 m!452285))

(assert (=> d!75165 m!452211))

(assert (=> b!470504 m!452257))

(assert (=> b!470504 m!452257))

(assert (=> b!470504 m!452259))

(assert (=> b!470505 m!452261))

(declare-fun m!452287 () Bool)

(assert (=> b!470505 m!452287))

(assert (=> b!470505 m!452287))

(declare-fun m!452289 () Bool)

(assert (=> b!470505 m!452289))

(declare-fun m!452291 () Bool)

(assert (=> b!470505 m!452291))

(declare-fun m!452293 () Bool)

(assert (=> b!470505 m!452293))

(assert (=> b!470505 m!452271))

(assert (=> b!470505 m!452257))

(assert (=> b!470505 m!452261))

(assert (=> b!470505 m!452271))

(assert (=> b!470505 m!452273))

(assert (=> b!470499 m!452261))

(assert (=> b!470499 m!452257))

(declare-fun m!452295 () Bool)

(assert (=> b!470499 m!452295))

(assert (=> b!470499 m!452271))

(assert (=> b!470499 m!452257))

(assert (=> b!470499 m!452261))

(assert (=> b!470499 m!452271))

(assert (=> b!470499 m!452273))

(assert (=> b!470502 m!452257))

(assert (=> b!470502 m!452257))

(declare-fun m!452297 () Bool)

(assert (=> b!470502 m!452297))

(declare-fun m!452299 () Bool)

(assert (=> b!470494 m!452299))

(declare-fun m!452301 () Bool)

(assert (=> bm!30407 m!452301))

(declare-fun m!452303 () Bool)

(assert (=> b!470498 m!452303))

(assert (=> b!470503 m!452257))

(assert (=> b!470503 m!452257))

(assert (=> b!470503 m!452259))

(assert (=> b!470497 m!452301))

(assert (=> b!470412 d!75165))

(declare-fun d!75167 () Bool)

(declare-fun res!281156 () Bool)

(declare-fun e!275666 () Bool)

(assert (=> d!75167 (=> res!281156 e!275666)))

(assert (=> d!75167 (= res!281156 (bvsge #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> d!75167 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8799) e!275666)))

(declare-fun b!470516 () Bool)

(declare-fun e!275664 () Bool)

(declare-fun call!30413 () Bool)

(assert (=> b!470516 (= e!275664 call!30413)))

(declare-fun b!470517 () Bool)

(declare-fun e!275663 () Bool)

(declare-fun contains!2532 (List!8802 (_ BitVec 64)) Bool)

(assert (=> b!470517 (= e!275663 (contains!2532 Nil!8799 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30410 () Bool)

(declare-fun c!56890 () Bool)

(assert (=> bm!30410 (= call!30413 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56890 (Cons!8798 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000) Nil!8799) Nil!8799)))))

(declare-fun b!470518 () Bool)

(declare-fun e!275665 () Bool)

(assert (=> b!470518 (= e!275666 e!275665)))

(declare-fun res!281158 () Bool)

(assert (=> b!470518 (=> (not res!281158) (not e!275665))))

(assert (=> b!470518 (= res!281158 (not e!275663))))

(declare-fun res!281157 () Bool)

(assert (=> b!470518 (=> (not res!281157) (not e!275663))))

(assert (=> b!470518 (= res!281157 (validKeyInArray!0 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470519 () Bool)

(assert (=> b!470519 (= e!275665 e!275664)))

(assert (=> b!470519 (= c!56890 (validKeyInArray!0 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470520 () Bool)

(assert (=> b!470520 (= e!275664 call!30413)))

(assert (= (and d!75167 (not res!281156)) b!470518))

(assert (= (and b!470518 res!281157) b!470517))

(assert (= (and b!470518 res!281158) b!470519))

(assert (= (and b!470519 c!56890) b!470516))

(assert (= (and b!470519 (not c!56890)) b!470520))

(assert (= (or b!470516 b!470520) bm!30410))

(assert (=> b!470517 m!452257))

(assert (=> b!470517 m!452257))

(declare-fun m!452305 () Bool)

(assert (=> b!470517 m!452305))

(assert (=> bm!30410 m!452257))

(declare-fun m!452307 () Bool)

(assert (=> bm!30410 m!452307))

(assert (=> b!470518 m!452257))

(assert (=> b!470518 m!452257))

(assert (=> b!470518 m!452259))

(assert (=> b!470519 m!452257))

(assert (=> b!470519 m!452257))

(assert (=> b!470519 m!452259))

(assert (=> b!470410 d!75167))

(declare-fun d!75169 () Bool)

(assert (=> d!75169 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42148 d!75169))

(declare-fun d!75171 () Bool)

(assert (=> d!75171 (= (array_inv!10486 _keys!1025) (bvsge (size!14774 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42148 d!75171))

(declare-fun d!75173 () Bool)

(assert (=> d!75173 (= (array_inv!10487 _values!833) (bvsge (size!14773 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42148 d!75173))

(declare-fun bm!30413 () Bool)

(declare-fun call!30416 () Bool)

(assert (=> bm!30413 (= call!30416 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!470529 () Bool)

(declare-fun e!275673 () Bool)

(declare-fun e!275675 () Bool)

(assert (=> b!470529 (= e!275673 e!275675)))

(declare-fun c!56893 () Bool)

(assert (=> b!470529 (= c!56893 (validKeyInArray!0 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470530 () Bool)

(declare-fun e!275674 () Bool)

(assert (=> b!470530 (= e!275675 e!275674)))

(declare-fun lt!213380 () (_ BitVec 64))

(assert (=> b!470530 (= lt!213380 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213382 () Unit!13767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29995 (_ BitVec 64) (_ BitVec 32)) Unit!13767)

(assert (=> b!470530 (= lt!213382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!213380 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!470530 (arrayContainsKey!0 _keys!1025 lt!213380 #b00000000000000000000000000000000)))

(declare-fun lt!213381 () Unit!13767)

(assert (=> b!470530 (= lt!213381 lt!213382)))

(declare-fun res!281163 () Bool)

(declare-datatypes ((SeekEntryResult!3547 0))(
  ( (MissingZero!3547 (index!16367 (_ BitVec 32))) (Found!3547 (index!16368 (_ BitVec 32))) (Intermediate!3547 (undefined!4359 Bool) (index!16369 (_ BitVec 32)) (x!44078 (_ BitVec 32))) (Undefined!3547) (MissingVacant!3547 (index!16370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29995 (_ BitVec 32)) SeekEntryResult!3547)

(assert (=> b!470530 (= res!281163 (= (seekEntryOrOpen!0 (select (arr!14421 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3547 #b00000000000000000000000000000000)))))

(assert (=> b!470530 (=> (not res!281163) (not e!275674))))

(declare-fun d!75175 () Bool)

(declare-fun res!281164 () Bool)

(assert (=> d!75175 (=> res!281164 e!275673)))

(assert (=> d!75175 (= res!281164 (bvsge #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> d!75175 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!275673)))

(declare-fun b!470531 () Bool)

(assert (=> b!470531 (= e!275674 call!30416)))

(declare-fun b!470532 () Bool)

(assert (=> b!470532 (= e!275675 call!30416)))

(assert (= (and d!75175 (not res!281164)) b!470529))

(assert (= (and b!470529 c!56893) b!470530))

(assert (= (and b!470529 (not c!56893)) b!470532))

(assert (= (and b!470530 res!281163) b!470531))

(assert (= (or b!470531 b!470532) bm!30413))

(declare-fun m!452309 () Bool)

(assert (=> bm!30413 m!452309))

(assert (=> b!470529 m!452257))

(assert (=> b!470529 m!452257))

(assert (=> b!470529 m!452259))

(assert (=> b!470530 m!452257))

(declare-fun m!452311 () Bool)

(assert (=> b!470530 m!452311))

(declare-fun m!452313 () Bool)

(assert (=> b!470530 m!452313))

(assert (=> b!470530 m!452257))

(declare-fun m!452315 () Bool)

(assert (=> b!470530 m!452315))

(assert (=> b!470409 d!75175))

(declare-fun mapNonEmpty!21394 () Bool)

(declare-fun mapRes!21394 () Bool)

(declare-fun tp!41122 () Bool)

(declare-fun e!275681 () Bool)

(assert (=> mapNonEmpty!21394 (= mapRes!21394 (and tp!41122 e!275681))))

(declare-fun mapRest!21394 () (Array (_ BitVec 32) ValueCell!6218))

(declare-fun mapKey!21394 () (_ BitVec 32))

(declare-fun mapValue!21394 () ValueCell!6218)

(assert (=> mapNonEmpty!21394 (= mapRest!21385 (store mapRest!21394 mapKey!21394 mapValue!21394))))

(declare-fun condMapEmpty!21394 () Bool)

(declare-fun mapDefault!21394 () ValueCell!6218)

(assert (=> mapNonEmpty!21385 (= condMapEmpty!21394 (= mapRest!21385 ((as const (Array (_ BitVec 32) ValueCell!6218)) mapDefault!21394)))))

(declare-fun e!275680 () Bool)

(assert (=> mapNonEmpty!21385 (= tp!41107 (and e!275680 mapRes!21394))))

(declare-fun b!470540 () Bool)

(assert (=> b!470540 (= e!275680 tp_is_empty!13123)))

(declare-fun mapIsEmpty!21394 () Bool)

(assert (=> mapIsEmpty!21394 mapRes!21394))

(declare-fun b!470539 () Bool)

(assert (=> b!470539 (= e!275681 tp_is_empty!13123)))

(assert (= (and mapNonEmpty!21385 condMapEmpty!21394) mapIsEmpty!21394))

(assert (= (and mapNonEmpty!21385 (not condMapEmpty!21394)) mapNonEmpty!21394))

(assert (= (and mapNonEmpty!21394 ((_ is ValueCellFull!6218) mapValue!21394)) b!470539))

(assert (= (and mapNonEmpty!21385 ((_ is ValueCellFull!6218) mapDefault!21394)) b!470540))

(declare-fun m!452317 () Bool)

(assert (=> mapNonEmpty!21394 m!452317))

(declare-fun b_lambda!10127 () Bool)

(assert (= b_lambda!10125 (or (and start!42148 b_free!11695) b_lambda!10127)))

(declare-fun b_lambda!10129 () Bool)

(assert (= b_lambda!10123 (or (and start!42148 b_free!11695) b_lambda!10129)))

(declare-fun b_lambda!10131 () Bool)

(assert (= b_lambda!10119 (or (and start!42148 b_free!11695) b_lambda!10131)))

(declare-fun b_lambda!10133 () Bool)

(assert (= b_lambda!10121 (or (and start!42148 b_free!11695) b_lambda!10133)))

(check-sat (not b_lambda!10127) (not b!470505) (not b!470491) (not b!470502) (not b!470490) (not d!75161) (not b!470517) (not b!470483) (not b!470519) (not b!470498) (not b_next!11695) (not b!470518) (not b!470489) (not b!470499) (not b!470529) (not b!470485) (not bm!30410) (not b!470497) (not b_lambda!10129) (not b!470494) (not b_lambda!10131) (not d!75163) b_and!20103 (not b!470530) (not mapNonEmpty!21394) (not bm!30407) (not b_lambda!10133) tp_is_empty!13123 (not b!470503) (not d!75165) (not b!470480) (not b!470484) (not bm!30413) (not b!470488) (not b!470504) (not bm!30406))
(check-sat b_and!20103 (not b_next!11695))
