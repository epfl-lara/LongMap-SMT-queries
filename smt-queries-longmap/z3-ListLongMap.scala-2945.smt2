; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41862 () Bool)

(assert start!41862)

(declare-fun b_free!11479 () Bool)

(declare-fun b_next!11479 () Bool)

(assert (=> start!41862 (= b_free!11479 (not b_next!11479))))

(declare-fun tp!40446 () Bool)

(declare-fun b_and!19869 () Bool)

(assert (=> start!41862 (= tp!40446 b_and!19869)))

(declare-fun mapIsEmpty!21049 () Bool)

(declare-fun mapRes!21049 () Bool)

(assert (=> mapIsEmpty!21049 mapRes!21049))

(declare-fun b!467515 () Bool)

(declare-fun e!273493 () Bool)

(declare-fun tp_is_empty!12907 () Bool)

(assert (=> b!467515 (= e!273493 tp_is_empty!12907)))

(declare-fun b!467516 () Bool)

(declare-fun e!273495 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29580 0))(
  ( (array!29581 (arr!14217 (Array (_ BitVec 32) (_ BitVec 64))) (size!14569 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29580)

(assert (=> b!467516 (= e!273495 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!14569 _keys!1025)))))))

(declare-datatypes ((V!18315 0))(
  ( (V!18316 (val!6498 Int)) )
))
(declare-datatypes ((tuple2!8460 0))(
  ( (tuple2!8461 (_1!4241 (_ BitVec 64)) (_2!4241 V!18315)) )
))
(declare-datatypes ((List!8541 0))(
  ( (Nil!8538) (Cons!8537 (h!9393 tuple2!8460) (t!14487 List!8541)) )
))
(declare-datatypes ((ListLongMap!7375 0))(
  ( (ListLongMap!7376 (toList!3703 List!8541)) )
))
(declare-fun lt!211421 () ListLongMap!7375)

(declare-fun lt!211420 () ListLongMap!7375)

(assert (=> b!467516 (= lt!211421 lt!211420)))

(declare-fun minValueBefore!38 () V!18315)

(declare-fun zeroValue!794 () V!18315)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6110 0))(
  ( (ValueCellFull!6110 (v!8788 V!18315)) (EmptyCell!6110) )
))
(declare-datatypes ((array!29582 0))(
  ( (array!29583 (arr!14218 (Array (_ BitVec 32) ValueCell!6110)) (size!14570 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29582)

(declare-fun minValueAfter!38 () V!18315)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((Unit!13618 0))(
  ( (Unit!13619) )
))
(declare-fun lt!211419 () Unit!13618)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!85 (array!29580 array!29582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18315 V!18315 V!18315 V!18315 (_ BitVec 32) Int) Unit!13618)

(assert (=> b!467516 (= lt!211419 (lemmaNoChangeToArrayThenSameMapNoExtras!85 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1925 (array!29580 array!29582 (_ BitVec 32) (_ BitVec 32) V!18315 V!18315 (_ BitVec 32) Int) ListLongMap!7375)

(assert (=> b!467516 (= lt!211420 (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467516 (= lt!211421 (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21049 () Bool)

(declare-fun tp!40447 () Bool)

(declare-fun e!273491 () Bool)

(assert (=> mapNonEmpty!21049 (= mapRes!21049 (and tp!40447 e!273491))))

(declare-fun mapValue!21049 () ValueCell!6110)

(declare-fun mapRest!21049 () (Array (_ BitVec 32) ValueCell!6110))

(declare-fun mapKey!21049 () (_ BitVec 32))

(assert (=> mapNonEmpty!21049 (= (arr!14218 _values!833) (store mapRest!21049 mapKey!21049 mapValue!21049))))

(declare-fun b!467517 () Bool)

(assert (=> b!467517 (= e!273491 tp_is_empty!12907)))

(declare-fun b!467518 () Bool)

(declare-fun res!279447 () Bool)

(assert (=> b!467518 (=> (not res!279447) (not e!273495))))

(declare-datatypes ((List!8542 0))(
  ( (Nil!8539) (Cons!8538 (h!9394 (_ BitVec 64)) (t!14488 List!8542)) )
))
(declare-fun arrayNoDuplicates!0 (array!29580 (_ BitVec 32) List!8542) Bool)

(assert (=> b!467518 (= res!279447 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8539))))

(declare-fun b!467519 () Bool)

(declare-fun res!279448 () Bool)

(assert (=> b!467519 (=> (not res!279448) (not e!273495))))

(assert (=> b!467519 (= res!279448 (and (= (size!14570 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14569 _keys!1025) (size!14570 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279449 () Bool)

(assert (=> start!41862 (=> (not res!279449) (not e!273495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41862 (= res!279449 (validMask!0 mask!1365))))

(assert (=> start!41862 e!273495))

(assert (=> start!41862 tp_is_empty!12907))

(assert (=> start!41862 tp!40446))

(assert (=> start!41862 true))

(declare-fun array_inv!10354 (array!29580) Bool)

(assert (=> start!41862 (array_inv!10354 _keys!1025)))

(declare-fun e!273494 () Bool)

(declare-fun array_inv!10355 (array!29582) Bool)

(assert (=> start!41862 (and (array_inv!10355 _values!833) e!273494)))

(declare-fun b!467520 () Bool)

(declare-fun res!279446 () Bool)

(assert (=> b!467520 (=> (not res!279446) (not e!273495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29580 (_ BitVec 32)) Bool)

(assert (=> b!467520 (= res!279446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467521 () Bool)

(assert (=> b!467521 (= e!273494 (and e!273493 mapRes!21049))))

(declare-fun condMapEmpty!21049 () Bool)

(declare-fun mapDefault!21049 () ValueCell!6110)

(assert (=> b!467521 (= condMapEmpty!21049 (= (arr!14218 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6110)) mapDefault!21049)))))

(assert (= (and start!41862 res!279449) b!467519))

(assert (= (and b!467519 res!279448) b!467520))

(assert (= (and b!467520 res!279446) b!467518))

(assert (= (and b!467518 res!279447) b!467516))

(assert (= (and b!467521 condMapEmpty!21049) mapIsEmpty!21049))

(assert (= (and b!467521 (not condMapEmpty!21049)) mapNonEmpty!21049))

(get-info :version)

(assert (= (and mapNonEmpty!21049 ((_ is ValueCellFull!6110) mapValue!21049)) b!467517))

(assert (= (and b!467521 ((_ is ValueCellFull!6110) mapDefault!21049)) b!467515))

(assert (= start!41862 b!467521))

(declare-fun m!449891 () Bool)

(assert (=> b!467520 m!449891))

(declare-fun m!449893 () Bool)

(assert (=> start!41862 m!449893))

(declare-fun m!449895 () Bool)

(assert (=> start!41862 m!449895))

(declare-fun m!449897 () Bool)

(assert (=> start!41862 m!449897))

(declare-fun m!449899 () Bool)

(assert (=> b!467516 m!449899))

(declare-fun m!449901 () Bool)

(assert (=> b!467516 m!449901))

(declare-fun m!449903 () Bool)

(assert (=> b!467516 m!449903))

(declare-fun m!449905 () Bool)

(assert (=> mapNonEmpty!21049 m!449905))

(declare-fun m!449907 () Bool)

(assert (=> b!467518 m!449907))

(check-sat tp_is_empty!12907 (not mapNonEmpty!21049) (not b_next!11479) (not b!467520) (not b!467516) (not b!467518) (not start!41862) b_and!19869)
(check-sat b_and!19869 (not b_next!11479))
(get-model)

(declare-fun b!467572 () Bool)

(declare-fun e!273532 () Bool)

(declare-fun call!30303 () Bool)

(assert (=> b!467572 (= e!273532 call!30303)))

(declare-fun b!467573 () Bool)

(declare-fun e!273533 () Bool)

(assert (=> b!467573 (= e!273532 e!273533)))

(declare-fun lt!211447 () (_ BitVec 64))

(assert (=> b!467573 (= lt!211447 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211448 () Unit!13618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29580 (_ BitVec 64) (_ BitVec 32)) Unit!13618)

(assert (=> b!467573 (= lt!211448 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!211447 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!467573 (arrayContainsKey!0 _keys!1025 lt!211447 #b00000000000000000000000000000000)))

(declare-fun lt!211446 () Unit!13618)

(assert (=> b!467573 (= lt!211446 lt!211448)))

(declare-fun res!279479 () Bool)

(declare-datatypes ((SeekEntryResult!3497 0))(
  ( (MissingZero!3497 (index!16167 (_ BitVec 32))) (Found!3497 (index!16168 (_ BitVec 32))) (Intermediate!3497 (undefined!4309 Bool) (index!16169 (_ BitVec 32)) (x!43698 (_ BitVec 32))) (Undefined!3497) (MissingVacant!3497 (index!16170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29580 (_ BitVec 32)) SeekEntryResult!3497)

(assert (=> b!467573 (= res!279479 (= (seekEntryOrOpen!0 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3497 #b00000000000000000000000000000000)))))

(assert (=> b!467573 (=> (not res!279479) (not e!273533))))

(declare-fun b!467574 () Bool)

(declare-fun e!273534 () Bool)

(assert (=> b!467574 (= e!273534 e!273532)))

(declare-fun c!56764 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!467574 (= c!56764 (validKeyInArray!0 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467575 () Bool)

(assert (=> b!467575 (= e!273533 call!30303)))

(declare-fun d!75231 () Bool)

(declare-fun res!279478 () Bool)

(assert (=> d!75231 (=> res!279478 e!273534)))

(assert (=> d!75231 (= res!279478 (bvsge #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(assert (=> d!75231 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!273534)))

(declare-fun bm!30300 () Bool)

(assert (=> bm!30300 (= call!30303 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(assert (= (and d!75231 (not res!279478)) b!467574))

(assert (= (and b!467574 c!56764) b!467573))

(assert (= (and b!467574 (not c!56764)) b!467572))

(assert (= (and b!467573 res!279479) b!467575))

(assert (= (or b!467575 b!467572) bm!30300))

(declare-fun m!449945 () Bool)

(assert (=> b!467573 m!449945))

(declare-fun m!449947 () Bool)

(assert (=> b!467573 m!449947))

(declare-fun m!449949 () Bool)

(assert (=> b!467573 m!449949))

(assert (=> b!467573 m!449945))

(declare-fun m!449951 () Bool)

(assert (=> b!467573 m!449951))

(assert (=> b!467574 m!449945))

(assert (=> b!467574 m!449945))

(declare-fun m!449953 () Bool)

(assert (=> b!467574 m!449953))

(declare-fun m!449955 () Bool)

(assert (=> bm!30300 m!449955))

(assert (=> b!467520 d!75231))

(declare-fun d!75233 () Bool)

(assert (=> d!75233 (= (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211451 () Unit!13618)

(declare-fun choose!1348 (array!29580 array!29582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18315 V!18315 V!18315 V!18315 (_ BitVec 32) Int) Unit!13618)

(assert (=> d!75233 (= lt!211451 (choose!1348 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75233 (validMask!0 mask!1365)))

(assert (=> d!75233 (= (lemmaNoChangeToArrayThenSameMapNoExtras!85 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211451)))

(declare-fun bs!14822 () Bool)

(assert (= bs!14822 d!75233))

(assert (=> bs!14822 m!449903))

(assert (=> bs!14822 m!449901))

(declare-fun m!449957 () Bool)

(assert (=> bs!14822 m!449957))

(assert (=> bs!14822 m!449893))

(assert (=> b!467516 d!75233))

(declare-fun lt!211470 () ListLongMap!7375)

(declare-fun e!273550 () Bool)

(declare-fun b!467600 () Bool)

(assert (=> b!467600 (= e!273550 (= lt!211470 (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!467601 () Bool)

(declare-fun e!273554 () ListLongMap!7375)

(assert (=> b!467601 (= e!273554 (ListLongMap!7376 Nil!8538))))

(declare-fun b!467602 () Bool)

(declare-fun res!279491 () Bool)

(declare-fun e!273549 () Bool)

(assert (=> b!467602 (=> (not res!279491) (not e!273549))))

(declare-fun contains!2511 (ListLongMap!7375 (_ BitVec 64)) Bool)

(assert (=> b!467602 (= res!279491 (not (contains!2511 lt!211470 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!467603 () Bool)

(declare-fun e!273551 () Bool)

(assert (=> b!467603 (= e!273549 e!273551)))

(declare-fun c!56775 () Bool)

(declare-fun e!273553 () Bool)

(assert (=> b!467603 (= c!56775 e!273553)))

(declare-fun res!279489 () Bool)

(assert (=> b!467603 (=> (not res!279489) (not e!273553))))

(assert (=> b!467603 (= res!279489 (bvslt #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(declare-fun b!467604 () Bool)

(assert (=> b!467604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(assert (=> b!467604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14570 _values!833)))))

(declare-fun e!273552 () Bool)

(declare-fun apply!324 (ListLongMap!7375 (_ BitVec 64)) V!18315)

(declare-fun get!6966 (ValueCell!6110 V!18315) V!18315)

(declare-fun dynLambda!914 (Int (_ BitVec 64)) V!18315)

(assert (=> b!467604 (= e!273552 (= (apply!324 lt!211470 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)) (get!6966 (select (arr!14218 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!467605 () Bool)

(declare-fun lt!211472 () Unit!13618)

(declare-fun lt!211469 () Unit!13618)

(assert (=> b!467605 (= lt!211472 lt!211469)))

(declare-fun lt!211467 () ListLongMap!7375)

(declare-fun lt!211468 () (_ BitVec 64))

(declare-fun lt!211466 () V!18315)

(declare-fun lt!211471 () (_ BitVec 64))

(declare-fun +!1684 (ListLongMap!7375 tuple2!8460) ListLongMap!7375)

(assert (=> b!467605 (not (contains!2511 (+!1684 lt!211467 (tuple2!8461 lt!211468 lt!211466)) lt!211471))))

(declare-fun addStillNotContains!159 (ListLongMap!7375 (_ BitVec 64) V!18315 (_ BitVec 64)) Unit!13618)

(assert (=> b!467605 (= lt!211469 (addStillNotContains!159 lt!211467 lt!211468 lt!211466 lt!211471))))

(assert (=> b!467605 (= lt!211471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!467605 (= lt!211466 (get!6966 (select (arr!14218 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!467605 (= lt!211468 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30306 () ListLongMap!7375)

(assert (=> b!467605 (= lt!211467 call!30306)))

(declare-fun e!273555 () ListLongMap!7375)

(assert (=> b!467605 (= e!273555 (+!1684 call!30306 (tuple2!8461 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000) (get!6966 (select (arr!14218 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30303 () Bool)

(assert (=> bm!30303 (= call!30306 (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!467606 () Bool)

(assert (=> b!467606 (= e!273555 call!30306)))

(declare-fun b!467607 () Bool)

(declare-fun isEmpty!577 (ListLongMap!7375) Bool)

(assert (=> b!467607 (= e!273550 (isEmpty!577 lt!211470))))

(declare-fun d!75235 () Bool)

(assert (=> d!75235 e!273549))

(declare-fun res!279490 () Bool)

(assert (=> d!75235 (=> (not res!279490) (not e!273549))))

(assert (=> d!75235 (= res!279490 (not (contains!2511 lt!211470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75235 (= lt!211470 e!273554)))

(declare-fun c!56774 () Bool)

(assert (=> d!75235 (= c!56774 (bvsge #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(assert (=> d!75235 (validMask!0 mask!1365)))

(assert (=> d!75235 (= (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211470)))

(declare-fun b!467608 () Bool)

(assert (=> b!467608 (= e!273554 e!273555)))

(declare-fun c!56776 () Bool)

(assert (=> b!467608 (= c!56776 (validKeyInArray!0 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467609 () Bool)

(assert (=> b!467609 (= e!273551 e!273552)))

(assert (=> b!467609 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(declare-fun res!279488 () Bool)

(assert (=> b!467609 (= res!279488 (contains!2511 lt!211470 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467609 (=> (not res!279488) (not e!273552))))

(declare-fun b!467610 () Bool)

(assert (=> b!467610 (= e!273551 e!273550)))

(declare-fun c!56773 () Bool)

(assert (=> b!467610 (= c!56773 (bvslt #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(declare-fun b!467611 () Bool)

(assert (=> b!467611 (= e!273553 (validKeyInArray!0 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467611 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!75235 c!56774) b!467601))

(assert (= (and d!75235 (not c!56774)) b!467608))

(assert (= (and b!467608 c!56776) b!467605))

(assert (= (and b!467608 (not c!56776)) b!467606))

(assert (= (or b!467605 b!467606) bm!30303))

(assert (= (and d!75235 res!279490) b!467602))

(assert (= (and b!467602 res!279491) b!467603))

(assert (= (and b!467603 res!279489) b!467611))

(assert (= (and b!467603 c!56775) b!467609))

(assert (= (and b!467603 (not c!56775)) b!467610))

(assert (= (and b!467609 res!279488) b!467604))

(assert (= (and b!467610 c!56773) b!467600))

(assert (= (and b!467610 (not c!56773)) b!467607))

(declare-fun b_lambda!10067 () Bool)

(assert (=> (not b_lambda!10067) (not b!467604)))

(declare-fun t!14493 () Bool)

(declare-fun tb!3905 () Bool)

(assert (=> (and start!41862 (= defaultEntry!841 defaultEntry!841) t!14493) tb!3905))

(declare-fun result!7389 () Bool)

(assert (=> tb!3905 (= result!7389 tp_is_empty!12907)))

(assert (=> b!467604 t!14493))

(declare-fun b_and!19875 () Bool)

(assert (= b_and!19869 (and (=> t!14493 result!7389) b_and!19875)))

(declare-fun b_lambda!10069 () Bool)

(assert (=> (not b_lambda!10069) (not b!467605)))

(assert (=> b!467605 t!14493))

(declare-fun b_and!19877 () Bool)

(assert (= b_and!19875 (and (=> t!14493 result!7389) b_and!19877)))

(declare-fun m!449959 () Bool)

(assert (=> bm!30303 m!449959))

(declare-fun m!449961 () Bool)

(assert (=> b!467607 m!449961))

(assert (=> b!467604 m!449945))

(assert (=> b!467604 m!449945))

(declare-fun m!449963 () Bool)

(assert (=> b!467604 m!449963))

(declare-fun m!449965 () Bool)

(assert (=> b!467604 m!449965))

(declare-fun m!449967 () Bool)

(assert (=> b!467604 m!449967))

(assert (=> b!467604 m!449967))

(assert (=> b!467604 m!449965))

(declare-fun m!449969 () Bool)

(assert (=> b!467604 m!449969))

(assert (=> b!467608 m!449945))

(assert (=> b!467608 m!449945))

(assert (=> b!467608 m!449953))

(assert (=> b!467611 m!449945))

(assert (=> b!467611 m!449945))

(assert (=> b!467611 m!449953))

(declare-fun m!449971 () Bool)

(assert (=> b!467602 m!449971))

(declare-fun m!449973 () Bool)

(assert (=> d!75235 m!449973))

(assert (=> d!75235 m!449893))

(declare-fun m!449975 () Bool)

(assert (=> b!467605 m!449975))

(assert (=> b!467605 m!449945))

(assert (=> b!467605 m!449975))

(declare-fun m!449977 () Bool)

(assert (=> b!467605 m!449977))

(assert (=> b!467605 m!449967))

(declare-fun m!449979 () Bool)

(assert (=> b!467605 m!449979))

(assert (=> b!467605 m!449967))

(assert (=> b!467605 m!449965))

(assert (=> b!467605 m!449969))

(declare-fun m!449981 () Bool)

(assert (=> b!467605 m!449981))

(assert (=> b!467605 m!449965))

(assert (=> b!467600 m!449959))

(assert (=> b!467609 m!449945))

(assert (=> b!467609 m!449945))

(declare-fun m!449983 () Bool)

(assert (=> b!467609 m!449983))

(assert (=> b!467516 d!75235))

(declare-fun lt!211477 () ListLongMap!7375)

(declare-fun e!273557 () Bool)

(declare-fun b!467614 () Bool)

(assert (=> b!467614 (= e!273557 (= lt!211477 (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!467615 () Bool)

(declare-fun e!273561 () ListLongMap!7375)

(assert (=> b!467615 (= e!273561 (ListLongMap!7376 Nil!8538))))

(declare-fun b!467616 () Bool)

(declare-fun res!279495 () Bool)

(declare-fun e!273556 () Bool)

(assert (=> b!467616 (=> (not res!279495) (not e!273556))))

(assert (=> b!467616 (= res!279495 (not (contains!2511 lt!211477 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!467617 () Bool)

(declare-fun e!273558 () Bool)

(assert (=> b!467617 (= e!273556 e!273558)))

(declare-fun c!56779 () Bool)

(declare-fun e!273560 () Bool)

(assert (=> b!467617 (= c!56779 e!273560)))

(declare-fun res!279493 () Bool)

(assert (=> b!467617 (=> (not res!279493) (not e!273560))))

(assert (=> b!467617 (= res!279493 (bvslt #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(declare-fun b!467618 () Bool)

(assert (=> b!467618 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(assert (=> b!467618 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14570 _values!833)))))

(declare-fun e!273559 () Bool)

(assert (=> b!467618 (= e!273559 (= (apply!324 lt!211477 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)) (get!6966 (select (arr!14218 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!467619 () Bool)

(declare-fun lt!211479 () Unit!13618)

(declare-fun lt!211476 () Unit!13618)

(assert (=> b!467619 (= lt!211479 lt!211476)))

(declare-fun lt!211475 () (_ BitVec 64))

(declare-fun lt!211478 () (_ BitVec 64))

(declare-fun lt!211473 () V!18315)

(declare-fun lt!211474 () ListLongMap!7375)

(assert (=> b!467619 (not (contains!2511 (+!1684 lt!211474 (tuple2!8461 lt!211475 lt!211473)) lt!211478))))

(assert (=> b!467619 (= lt!211476 (addStillNotContains!159 lt!211474 lt!211475 lt!211473 lt!211478))))

(assert (=> b!467619 (= lt!211478 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!467619 (= lt!211473 (get!6966 (select (arr!14218 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!467619 (= lt!211475 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30307 () ListLongMap!7375)

(assert (=> b!467619 (= lt!211474 call!30307)))

(declare-fun e!273562 () ListLongMap!7375)

(assert (=> b!467619 (= e!273562 (+!1684 call!30307 (tuple2!8461 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000) (get!6966 (select (arr!14218 _values!833) #b00000000000000000000000000000000) (dynLambda!914 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!30304 () Bool)

(assert (=> bm!30304 (= call!30307 (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!467620 () Bool)

(assert (=> b!467620 (= e!273562 call!30307)))

(declare-fun b!467621 () Bool)

(assert (=> b!467621 (= e!273557 (isEmpty!577 lt!211477))))

(declare-fun d!75237 () Bool)

(assert (=> d!75237 e!273556))

(declare-fun res!279494 () Bool)

(assert (=> d!75237 (=> (not res!279494) (not e!273556))))

(assert (=> d!75237 (= res!279494 (not (contains!2511 lt!211477 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75237 (= lt!211477 e!273561)))

(declare-fun c!56778 () Bool)

(assert (=> d!75237 (= c!56778 (bvsge #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(assert (=> d!75237 (validMask!0 mask!1365)))

(assert (=> d!75237 (= (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211477)))

(declare-fun b!467622 () Bool)

(assert (=> b!467622 (= e!273561 e!273562)))

(declare-fun c!56780 () Bool)

(assert (=> b!467622 (= c!56780 (validKeyInArray!0 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467623 () Bool)

(assert (=> b!467623 (= e!273558 e!273559)))

(assert (=> b!467623 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(declare-fun res!279492 () Bool)

(assert (=> b!467623 (= res!279492 (contains!2511 lt!211477 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467623 (=> (not res!279492) (not e!273559))))

(declare-fun b!467624 () Bool)

(assert (=> b!467624 (= e!273558 e!273557)))

(declare-fun c!56777 () Bool)

(assert (=> b!467624 (= c!56777 (bvslt #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(declare-fun b!467625 () Bool)

(assert (=> b!467625 (= e!273560 (validKeyInArray!0 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467625 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!75237 c!56778) b!467615))

(assert (= (and d!75237 (not c!56778)) b!467622))

(assert (= (and b!467622 c!56780) b!467619))

(assert (= (and b!467622 (not c!56780)) b!467620))

(assert (= (or b!467619 b!467620) bm!30304))

(assert (= (and d!75237 res!279494) b!467616))

(assert (= (and b!467616 res!279495) b!467617))

(assert (= (and b!467617 res!279493) b!467625))

(assert (= (and b!467617 c!56779) b!467623))

(assert (= (and b!467617 (not c!56779)) b!467624))

(assert (= (and b!467623 res!279492) b!467618))

(assert (= (and b!467624 c!56777) b!467614))

(assert (= (and b!467624 (not c!56777)) b!467621))

(declare-fun b_lambda!10071 () Bool)

(assert (=> (not b_lambda!10071) (not b!467618)))

(assert (=> b!467618 t!14493))

(declare-fun b_and!19879 () Bool)

(assert (= b_and!19877 (and (=> t!14493 result!7389) b_and!19879)))

(declare-fun b_lambda!10073 () Bool)

(assert (=> (not b_lambda!10073) (not b!467619)))

(assert (=> b!467619 t!14493))

(declare-fun b_and!19881 () Bool)

(assert (= b_and!19879 (and (=> t!14493 result!7389) b_and!19881)))

(declare-fun m!449985 () Bool)

(assert (=> bm!30304 m!449985))

(declare-fun m!449987 () Bool)

(assert (=> b!467621 m!449987))

(assert (=> b!467618 m!449945))

(assert (=> b!467618 m!449945))

(declare-fun m!449989 () Bool)

(assert (=> b!467618 m!449989))

(assert (=> b!467618 m!449965))

(assert (=> b!467618 m!449967))

(assert (=> b!467618 m!449967))

(assert (=> b!467618 m!449965))

(assert (=> b!467618 m!449969))

(assert (=> b!467622 m!449945))

(assert (=> b!467622 m!449945))

(assert (=> b!467622 m!449953))

(assert (=> b!467625 m!449945))

(assert (=> b!467625 m!449945))

(assert (=> b!467625 m!449953))

(declare-fun m!449991 () Bool)

(assert (=> b!467616 m!449991))

(declare-fun m!449993 () Bool)

(assert (=> d!75237 m!449993))

(assert (=> d!75237 m!449893))

(declare-fun m!449995 () Bool)

(assert (=> b!467619 m!449995))

(assert (=> b!467619 m!449945))

(assert (=> b!467619 m!449995))

(declare-fun m!449997 () Bool)

(assert (=> b!467619 m!449997))

(assert (=> b!467619 m!449967))

(declare-fun m!449999 () Bool)

(assert (=> b!467619 m!449999))

(assert (=> b!467619 m!449967))

(assert (=> b!467619 m!449965))

(assert (=> b!467619 m!449969))

(declare-fun m!450001 () Bool)

(assert (=> b!467619 m!450001))

(assert (=> b!467619 m!449965))

(assert (=> b!467614 m!449985))

(assert (=> b!467623 m!449945))

(assert (=> b!467623 m!449945))

(declare-fun m!450003 () Bool)

(assert (=> b!467623 m!450003))

(assert (=> b!467516 d!75237))

(declare-fun b!467636 () Bool)

(declare-fun e!273573 () Bool)

(declare-fun e!273572 () Bool)

(assert (=> b!467636 (= e!273573 e!273572)))

(declare-fun res!279504 () Bool)

(assert (=> b!467636 (=> (not res!279504) (not e!273572))))

(declare-fun e!273571 () Bool)

(assert (=> b!467636 (= res!279504 (not e!273571))))

(declare-fun res!279503 () Bool)

(assert (=> b!467636 (=> (not res!279503) (not e!273571))))

(assert (=> b!467636 (= res!279503 (validKeyInArray!0 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467637 () Bool)

(declare-fun contains!2512 (List!8542 (_ BitVec 64)) Bool)

(assert (=> b!467637 (= e!273571 (contains!2512 Nil!8539 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467638 () Bool)

(declare-fun e!273574 () Bool)

(declare-fun call!30310 () Bool)

(assert (=> b!467638 (= e!273574 call!30310)))

(declare-fun d!75239 () Bool)

(declare-fun res!279502 () Bool)

(assert (=> d!75239 (=> res!279502 e!273573)))

(assert (=> d!75239 (= res!279502 (bvsge #b00000000000000000000000000000000 (size!14569 _keys!1025)))))

(assert (=> d!75239 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8539) e!273573)))

(declare-fun b!467639 () Bool)

(assert (=> b!467639 (= e!273574 call!30310)))

(declare-fun b!467640 () Bool)

(assert (=> b!467640 (= e!273572 e!273574)))

(declare-fun c!56783 () Bool)

(assert (=> b!467640 (= c!56783 (validKeyInArray!0 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30307 () Bool)

(assert (=> bm!30307 (= call!30310 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56783 (Cons!8538 (select (arr!14217 _keys!1025) #b00000000000000000000000000000000) Nil!8539) Nil!8539)))))

(assert (= (and d!75239 (not res!279502)) b!467636))

(assert (= (and b!467636 res!279503) b!467637))

(assert (= (and b!467636 res!279504) b!467640))

(assert (= (and b!467640 c!56783) b!467639))

(assert (= (and b!467640 (not c!56783)) b!467638))

(assert (= (or b!467639 b!467638) bm!30307))

(assert (=> b!467636 m!449945))

(assert (=> b!467636 m!449945))

(assert (=> b!467636 m!449953))

(assert (=> b!467637 m!449945))

(assert (=> b!467637 m!449945))

(declare-fun m!450005 () Bool)

(assert (=> b!467637 m!450005))

(assert (=> b!467640 m!449945))

(assert (=> b!467640 m!449945))

(assert (=> b!467640 m!449953))

(assert (=> bm!30307 m!449945))

(declare-fun m!450007 () Bool)

(assert (=> bm!30307 m!450007))

(assert (=> b!467518 d!75239))

(declare-fun d!75241 () Bool)

(assert (=> d!75241 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41862 d!75241))

(declare-fun d!75243 () Bool)

(assert (=> d!75243 (= (array_inv!10354 _keys!1025) (bvsge (size!14569 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41862 d!75243))

(declare-fun d!75245 () Bool)

(assert (=> d!75245 (= (array_inv!10355 _values!833) (bvsge (size!14570 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41862 d!75245))

(declare-fun b!467647 () Bool)

(declare-fun e!273579 () Bool)

(assert (=> b!467647 (= e!273579 tp_is_empty!12907)))

(declare-fun b!467648 () Bool)

(declare-fun e!273580 () Bool)

(assert (=> b!467648 (= e!273580 tp_is_empty!12907)))

(declare-fun mapNonEmpty!21058 () Bool)

(declare-fun mapRes!21058 () Bool)

(declare-fun tp!40462 () Bool)

(assert (=> mapNonEmpty!21058 (= mapRes!21058 (and tp!40462 e!273579))))

(declare-fun mapValue!21058 () ValueCell!6110)

(declare-fun mapKey!21058 () (_ BitVec 32))

(declare-fun mapRest!21058 () (Array (_ BitVec 32) ValueCell!6110))

(assert (=> mapNonEmpty!21058 (= mapRest!21049 (store mapRest!21058 mapKey!21058 mapValue!21058))))

(declare-fun mapIsEmpty!21058 () Bool)

(assert (=> mapIsEmpty!21058 mapRes!21058))

(declare-fun condMapEmpty!21058 () Bool)

(declare-fun mapDefault!21058 () ValueCell!6110)

(assert (=> mapNonEmpty!21049 (= condMapEmpty!21058 (= mapRest!21049 ((as const (Array (_ BitVec 32) ValueCell!6110)) mapDefault!21058)))))

(assert (=> mapNonEmpty!21049 (= tp!40447 (and e!273580 mapRes!21058))))

(assert (= (and mapNonEmpty!21049 condMapEmpty!21058) mapIsEmpty!21058))

(assert (= (and mapNonEmpty!21049 (not condMapEmpty!21058)) mapNonEmpty!21058))

(assert (= (and mapNonEmpty!21058 ((_ is ValueCellFull!6110) mapValue!21058)) b!467647))

(assert (= (and mapNonEmpty!21049 ((_ is ValueCellFull!6110) mapDefault!21058)) b!467648))

(declare-fun m!450009 () Bool)

(assert (=> mapNonEmpty!21058 m!450009))

(declare-fun b_lambda!10075 () Bool)

(assert (= b_lambda!10069 (or (and start!41862 b_free!11479) b_lambda!10075)))

(declare-fun b_lambda!10077 () Bool)

(assert (= b_lambda!10073 (or (and start!41862 b_free!11479) b_lambda!10077)))

(declare-fun b_lambda!10079 () Bool)

(assert (= b_lambda!10067 (or (and start!41862 b_free!11479) b_lambda!10079)))

(declare-fun b_lambda!10081 () Bool)

(assert (= b_lambda!10071 (or (and start!41862 b_free!11479) b_lambda!10081)))

(check-sat (not b!467614) (not b!467636) (not b!467625) (not b!467608) tp_is_empty!12907 (not b!467618) (not b!467604) (not d!75233) (not b!467616) (not b_next!11479) (not b_lambda!10077) (not b!467640) (not b!467573) (not d!75235) (not bm!30300) (not b_lambda!10079) (not b!467574) (not b!467611) (not b!467602) (not b!467623) (not b!467609) (not b!467600) (not mapNonEmpty!21058) (not bm!30303) (not b!467622) (not bm!30307) b_and!19881 (not b!467607) (not b_lambda!10075) (not d!75237) (not b!467637) (not b!467621) (not b!467619) (not b_lambda!10081) (not bm!30304) (not b!467605))
(check-sat b_and!19881 (not b_next!11479))
