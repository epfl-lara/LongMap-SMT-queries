; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134374 () Bool)

(assert start!134374)

(declare-fun b_free!32185 () Bool)

(declare-fun b_next!32185 () Bool)

(assert (=> start!134374 (= b_free!32185 (not b_next!32185))))

(declare-fun tp!113857 () Bool)

(declare-fun b_and!51813 () Bool)

(assert (=> start!134374 (= tp!113857 b_and!51813)))

(declare-fun mapIsEmpty!59830 () Bool)

(declare-fun mapRes!59830 () Bool)

(assert (=> mapIsEmpty!59830 mapRes!59830))

(declare-fun b!1568510 () Bool)

(declare-fun res!1071371 () Bool)

(declare-fun e!874408 () Bool)

(assert (=> b!1568510 (=> (not res!1071371) (not e!874408))))

(declare-datatypes ((array!104726 0))(
  ( (array!104727 (arr!50543 (Array (_ BitVec 32) (_ BitVec 64))) (size!51094 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104726)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104726 (_ BitVec 32)) Bool)

(assert (=> b!1568510 (= res!1071371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59830 () Bool)

(declare-fun tp!113856 () Bool)

(declare-fun e!874409 () Bool)

(assert (=> mapNonEmpty!59830 (= mapRes!59830 (and tp!113856 e!874409))))

(declare-datatypes ((V!60153 0))(
  ( (V!60154 (val!19563 Int)) )
))
(declare-datatypes ((ValueCell!18449 0))(
  ( (ValueCellFull!18449 (v!22311 V!60153)) (EmptyCell!18449) )
))
(declare-fun mapValue!59830 () ValueCell!18449)

(declare-fun mapRest!59830 () (Array (_ BitVec 32) ValueCell!18449))

(declare-datatypes ((array!104728 0))(
  ( (array!104729 (arr!50544 (Array (_ BitVec 32) ValueCell!18449)) (size!51095 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104728)

(declare-fun mapKey!59830 () (_ BitVec 32))

(assert (=> mapNonEmpty!59830 (= (arr!50544 _values!487) (store mapRest!59830 mapKey!59830 mapValue!59830))))

(declare-fun b!1568511 () Bool)

(declare-fun e!874406 () Bool)

(declare-fun tp_is_empty!38959 () Bool)

(assert (=> b!1568511 (= e!874406 tp_is_empty!38959)))

(declare-fun res!1071368 () Bool)

(assert (=> start!134374 (=> (not res!1071368) (not e!874408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134374 (= res!1071368 (validMask!0 mask!947))))

(assert (=> start!134374 e!874408))

(assert (=> start!134374 tp!113857))

(assert (=> start!134374 tp_is_empty!38959))

(assert (=> start!134374 true))

(declare-fun array_inv!39511 (array!104726) Bool)

(assert (=> start!134374 (array_inv!39511 _keys!637)))

(declare-fun e!874411 () Bool)

(declare-fun array_inv!39512 (array!104728) Bool)

(assert (=> start!134374 (and (array_inv!39512 _values!487) e!874411)))

(declare-fun b!1568512 () Bool)

(declare-fun e!874407 () Bool)

(assert (=> b!1568512 (= e!874408 (not e!874407))))

(declare-fun res!1071367 () Bool)

(assert (=> b!1568512 (=> (not res!1071367) (not e!874407))))

(declare-datatypes ((tuple2!25300 0))(
  ( (tuple2!25301 (_1!12661 (_ BitVec 64)) (_2!12661 V!60153)) )
))
(declare-datatypes ((List!36662 0))(
  ( (Nil!36659) (Cons!36658 (h!38122 tuple2!25300) (t!51553 List!36662)) )
))
(declare-datatypes ((ListLongMap!22743 0))(
  ( (ListLongMap!22744 (toList!11387 List!36662)) )
))
(declare-fun lt!673449 () ListLongMap!22743)

(declare-fun contains!10390 (ListLongMap!22743 (_ BitVec 64)) Bool)

(assert (=> b!1568512 (= res!1071367 (not (contains!10390 lt!673449 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1568512 (not (contains!10390 lt!673449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673448 () V!60153)

(declare-fun lt!673450 () ListLongMap!22743)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun +!5123 (ListLongMap!22743 tuple2!25300) ListLongMap!22743)

(assert (=> b!1568512 (= lt!673449 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))

(declare-datatypes ((Unit!51941 0))(
  ( (Unit!51942) )
))
(declare-fun lt!673447 () Unit!51941)

(declare-fun addStillNotContains!574 (ListLongMap!22743 (_ BitVec 64) V!60153 (_ BitVec 64)) Unit!51941)

(assert (=> b!1568512 (= lt!673447 (addStillNotContains!574 lt!673450 (select (arr!50543 _keys!637) from!782) lt!673448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26401 (ValueCell!18449 V!60153) V!60153)

(declare-fun dynLambda!3921 (Int (_ BitVec 64)) V!60153)

(assert (=> b!1568512 (= lt!673448 (get!26401 (select (arr!50544 _values!487) from!782) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60153)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60153)

(declare-fun getCurrentListMapNoExtraKeys!6768 (array!104726 array!104728 (_ BitVec 32) (_ BitVec 32) V!60153 V!60153 (_ BitVec 32) Int) ListLongMap!22743)

(assert (=> b!1568512 (= lt!673450 (getCurrentListMapNoExtraKeys!6768 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1568513 () Bool)

(declare-fun res!1071366 () Bool)

(assert (=> b!1568513 (=> (not res!1071366) (not e!874408))))

(declare-datatypes ((List!36663 0))(
  ( (Nil!36660) (Cons!36659 (h!38123 (_ BitVec 64)) (t!51554 List!36663)) )
))
(declare-fun arrayNoDuplicates!0 (array!104726 (_ BitVec 32) List!36663) Bool)

(assert (=> b!1568513 (= res!1071366 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36660))))

(declare-fun b!1568514 () Bool)

(declare-fun res!1071365 () Bool)

(assert (=> b!1568514 (=> (not res!1071365) (not e!874408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568514 (= res!1071365 (validKeyInArray!0 (select (arr!50543 _keys!637) from!782)))))

(declare-fun b!1568515 () Bool)

(declare-fun apply!1120 (ListLongMap!22743 (_ BitVec 64)) V!60153)

(assert (=> b!1568515 (= e!874407 (= (apply!1120 lt!673449 (select (arr!50543 _keys!637) from!782)) lt!673448))))

(declare-fun b!1568516 () Bool)

(assert (=> b!1568516 (= e!874411 (and e!874406 mapRes!59830))))

(declare-fun condMapEmpty!59830 () Bool)

(declare-fun mapDefault!59830 () ValueCell!18449)

(assert (=> b!1568516 (= condMapEmpty!59830 (= (arr!50544 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18449)) mapDefault!59830)))))

(declare-fun b!1568517 () Bool)

(declare-fun res!1071372 () Bool)

(assert (=> b!1568517 (=> (not res!1071372) (not e!874408))))

(assert (=> b!1568517 (= res!1071372 (and (= (size!51095 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51094 _keys!637) (size!51095 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1568518 () Bool)

(declare-fun res!1071369 () Bool)

(assert (=> b!1568518 (=> (not res!1071369) (not e!874408))))

(assert (=> b!1568518 (= res!1071369 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51094 _keys!637)) (bvslt from!782 (size!51094 _keys!637))))))

(declare-fun b!1568519 () Bool)

(assert (=> b!1568519 (= e!874409 tp_is_empty!38959)))

(declare-fun b!1568520 () Bool)

(declare-fun res!1071370 () Bool)

(assert (=> b!1568520 (=> (not res!1071370) (not e!874407))))

(assert (=> b!1568520 (= res!1071370 (contains!10390 lt!673449 (select (arr!50543 _keys!637) from!782)))))

(assert (= (and start!134374 res!1071368) b!1568517))

(assert (= (and b!1568517 res!1071372) b!1568510))

(assert (= (and b!1568510 res!1071371) b!1568513))

(assert (= (and b!1568513 res!1071366) b!1568518))

(assert (= (and b!1568518 res!1071369) b!1568514))

(assert (= (and b!1568514 res!1071365) b!1568512))

(assert (= (and b!1568512 res!1071367) b!1568520))

(assert (= (and b!1568520 res!1071370) b!1568515))

(assert (= (and b!1568516 condMapEmpty!59830) mapIsEmpty!59830))

(assert (= (and b!1568516 (not condMapEmpty!59830)) mapNonEmpty!59830))

(get-info :version)

(assert (= (and mapNonEmpty!59830 ((_ is ValueCellFull!18449) mapValue!59830)) b!1568519))

(assert (= (and b!1568516 ((_ is ValueCellFull!18449) mapDefault!59830)) b!1568511))

(assert (= start!134374 b!1568516))

(declare-fun b_lambda!24993 () Bool)

(assert (=> (not b_lambda!24993) (not b!1568512)))

(declare-fun t!51552 () Bool)

(declare-fun tb!12645 () Bool)

(assert (=> (and start!134374 (= defaultEntry!495 defaultEntry!495) t!51552) tb!12645))

(declare-fun result!26589 () Bool)

(assert (=> tb!12645 (= result!26589 tp_is_empty!38959)))

(assert (=> b!1568512 t!51552))

(declare-fun b_and!51815 () Bool)

(assert (= b_and!51813 (and (=> t!51552 result!26589) b_and!51815)))

(declare-fun m!1443265 () Bool)

(assert (=> b!1568512 m!1443265))

(declare-fun m!1443267 () Bool)

(assert (=> b!1568512 m!1443267))

(declare-fun m!1443269 () Bool)

(assert (=> b!1568512 m!1443269))

(assert (=> b!1568512 m!1443265))

(declare-fun m!1443271 () Bool)

(assert (=> b!1568512 m!1443271))

(declare-fun m!1443273 () Bool)

(assert (=> b!1568512 m!1443273))

(declare-fun m!1443275 () Bool)

(assert (=> b!1568512 m!1443275))

(assert (=> b!1568512 m!1443267))

(declare-fun m!1443277 () Bool)

(assert (=> b!1568512 m!1443277))

(assert (=> b!1568512 m!1443273))

(declare-fun m!1443279 () Bool)

(assert (=> b!1568512 m!1443279))

(declare-fun m!1443281 () Bool)

(assert (=> b!1568512 m!1443281))

(assert (=> b!1568520 m!1443273))

(assert (=> b!1568520 m!1443273))

(declare-fun m!1443283 () Bool)

(assert (=> b!1568520 m!1443283))

(assert (=> b!1568514 m!1443273))

(assert (=> b!1568514 m!1443273))

(declare-fun m!1443285 () Bool)

(assert (=> b!1568514 m!1443285))

(declare-fun m!1443287 () Bool)

(assert (=> mapNonEmpty!59830 m!1443287))

(declare-fun m!1443289 () Bool)

(assert (=> start!134374 m!1443289))

(declare-fun m!1443291 () Bool)

(assert (=> start!134374 m!1443291))

(declare-fun m!1443293 () Bool)

(assert (=> start!134374 m!1443293))

(declare-fun m!1443295 () Bool)

(assert (=> b!1568510 m!1443295))

(declare-fun m!1443297 () Bool)

(assert (=> b!1568513 m!1443297))

(assert (=> b!1568515 m!1443273))

(assert (=> b!1568515 m!1443273))

(declare-fun m!1443299 () Bool)

(assert (=> b!1568515 m!1443299))

(check-sat (not b!1568520) b_and!51815 (not mapNonEmpty!59830) (not b_lambda!24993) (not b!1568512) (not start!134374) (not b_next!32185) tp_is_empty!38959 (not b!1568510) (not b!1568515) (not b!1568513) (not b!1568514))
(check-sat b_and!51815 (not b_next!32185))
(get-model)

(declare-fun b_lambda!24999 () Bool)

(assert (= b_lambda!24993 (or (and start!134374 b_free!32185) b_lambda!24999)))

(check-sat (not b!1568520) (not b_lambda!24999) b_and!51815 (not mapNonEmpty!59830) (not b!1568512) (not start!134374) (not b_next!32185) tp_is_empty!38959 (not b!1568510) (not b!1568515) (not b!1568513) (not b!1568514))
(check-sat b_and!51815 (not b_next!32185))
(get-model)

(declare-fun d!163915 () Bool)

(assert (=> d!163915 (= (validKeyInArray!0 (select (arr!50543 _keys!637) from!782)) (and (not (= (select (arr!50543 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50543 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1568514 d!163915))

(declare-fun d!163917 () Bool)

(declare-fun e!874453 () Bool)

(assert (=> d!163917 e!874453))

(declare-fun res!1071423 () Bool)

(assert (=> d!163917 (=> res!1071423 e!874453)))

(declare-fun lt!673484 () Bool)

(assert (=> d!163917 (= res!1071423 (not lt!673484))))

(declare-fun lt!673486 () Bool)

(assert (=> d!163917 (= lt!673484 lt!673486)))

(declare-fun lt!673485 () Unit!51941)

(declare-fun e!874452 () Unit!51941)

(assert (=> d!163917 (= lt!673485 e!874452)))

(declare-fun c!145105 () Bool)

(assert (=> d!163917 (= c!145105 lt!673486)))

(declare-fun containsKey!851 (List!36662 (_ BitVec 64)) Bool)

(assert (=> d!163917 (= lt!673486 (containsKey!851 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)))))

(assert (=> d!163917 (= (contains!10390 lt!673449 (select (arr!50543 _keys!637) from!782)) lt!673484)))

(declare-fun b!1568599 () Bool)

(declare-fun lt!673483 () Unit!51941)

(assert (=> b!1568599 (= e!874452 lt!673483)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!534 (List!36662 (_ BitVec 64)) Unit!51941)

(assert (=> b!1568599 (= lt!673483 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)))))

(declare-datatypes ((Option!864 0))(
  ( (Some!863 (v!22314 V!60153)) (None!862) )
))
(declare-fun isDefined!580 (Option!864) Bool)

(declare-fun getValueByKey!789 (List!36662 (_ BitVec 64)) Option!864)

(assert (=> b!1568599 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)))))

(declare-fun b!1568600 () Bool)

(declare-fun Unit!51945 () Unit!51941)

(assert (=> b!1568600 (= e!874452 Unit!51945)))

(declare-fun b!1568601 () Bool)

(assert (=> b!1568601 (= e!874453 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782))))))

(assert (= (and d!163917 c!145105) b!1568599))

(assert (= (and d!163917 (not c!145105)) b!1568600))

(assert (= (and d!163917 (not res!1071423)) b!1568601))

(assert (=> d!163917 m!1443273))

(declare-fun m!1443373 () Bool)

(assert (=> d!163917 m!1443373))

(assert (=> b!1568599 m!1443273))

(declare-fun m!1443375 () Bool)

(assert (=> b!1568599 m!1443375))

(assert (=> b!1568599 m!1443273))

(declare-fun m!1443377 () Bool)

(assert (=> b!1568599 m!1443377))

(assert (=> b!1568599 m!1443377))

(declare-fun m!1443379 () Bool)

(assert (=> b!1568599 m!1443379))

(assert (=> b!1568601 m!1443273))

(assert (=> b!1568601 m!1443377))

(assert (=> b!1568601 m!1443377))

(assert (=> b!1568601 m!1443379))

(assert (=> b!1568520 d!163917))

(declare-fun b!1568610 () Bool)

(declare-fun e!874461 () Bool)

(declare-fun call!72035 () Bool)

(assert (=> b!1568610 (= e!874461 call!72035)))

(declare-fun b!1568612 () Bool)

(declare-fun e!874460 () Bool)

(assert (=> b!1568612 (= e!874460 call!72035)))

(declare-fun bm!72032 () Bool)

(assert (=> bm!72032 (= call!72035 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1568613 () Bool)

(assert (=> b!1568613 (= e!874460 e!874461)))

(declare-fun lt!673493 () (_ BitVec 64))

(assert (=> b!1568613 (= lt!673493 (select (arr!50543 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!673495 () Unit!51941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104726 (_ BitVec 64) (_ BitVec 32)) Unit!51941)

(assert (=> b!1568613 (= lt!673495 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673493 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1568613 (arrayContainsKey!0 _keys!637 lt!673493 #b00000000000000000000000000000000)))

(declare-fun lt!673494 () Unit!51941)

(assert (=> b!1568613 (= lt!673494 lt!673495)))

(declare-fun res!1071428 () Bool)

(declare-datatypes ((SeekEntryResult!13474 0))(
  ( (MissingZero!13474 (index!56294 (_ BitVec 32))) (Found!13474 (index!56295 (_ BitVec 32))) (Intermediate!13474 (undefined!14286 Bool) (index!56296 (_ BitVec 32)) (x!140746 (_ BitVec 32))) (Undefined!13474) (MissingVacant!13474 (index!56297 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104726 (_ BitVec 32)) SeekEntryResult!13474)

(assert (=> b!1568613 (= res!1071428 (= (seekEntryOrOpen!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13474 #b00000000000000000000000000000000)))))

(assert (=> b!1568613 (=> (not res!1071428) (not e!874461))))

(declare-fun d!163919 () Bool)

(declare-fun res!1071429 () Bool)

(declare-fun e!874462 () Bool)

(assert (=> d!163919 (=> res!1071429 e!874462)))

(assert (=> d!163919 (= res!1071429 (bvsge #b00000000000000000000000000000000 (size!51094 _keys!637)))))

(assert (=> d!163919 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!874462)))

(declare-fun b!1568611 () Bool)

(assert (=> b!1568611 (= e!874462 e!874460)))

(declare-fun c!145108 () Bool)

(assert (=> b!1568611 (= c!145108 (validKeyInArray!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163919 (not res!1071429)) b!1568611))

(assert (= (and b!1568611 c!145108) b!1568613))

(assert (= (and b!1568611 (not c!145108)) b!1568612))

(assert (= (and b!1568613 res!1071428) b!1568610))

(assert (= (or b!1568610 b!1568612) bm!72032))

(declare-fun m!1443381 () Bool)

(assert (=> bm!72032 m!1443381))

(declare-fun m!1443383 () Bool)

(assert (=> b!1568613 m!1443383))

(declare-fun m!1443385 () Bool)

(assert (=> b!1568613 m!1443385))

(declare-fun m!1443387 () Bool)

(assert (=> b!1568613 m!1443387))

(assert (=> b!1568613 m!1443383))

(declare-fun m!1443389 () Bool)

(assert (=> b!1568613 m!1443389))

(assert (=> b!1568611 m!1443383))

(assert (=> b!1568611 m!1443383))

(declare-fun m!1443391 () Bool)

(assert (=> b!1568611 m!1443391))

(assert (=> b!1568510 d!163919))

(declare-fun d!163921 () Bool)

(declare-fun get!26403 (Option!864) V!60153)

(assert (=> d!163921 (= (apply!1120 lt!673449 (select (arr!50543 _keys!637) from!782)) (get!26403 (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782))))))

(declare-fun bs!45085 () Bool)

(assert (= bs!45085 d!163921))

(assert (=> bs!45085 m!1443273))

(assert (=> bs!45085 m!1443377))

(assert (=> bs!45085 m!1443377))

(declare-fun m!1443393 () Bool)

(assert (=> bs!45085 m!1443393))

(assert (=> b!1568515 d!163921))

(declare-fun d!163923 () Bool)

(declare-fun c!145111 () Bool)

(assert (=> d!163923 (= c!145111 ((_ is ValueCellFull!18449) (select (arr!50544 _values!487) from!782)))))

(declare-fun e!874465 () V!60153)

(assert (=> d!163923 (= (get!26401 (select (arr!50544 _values!487) from!782) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!874465)))

(declare-fun b!1568618 () Bool)

(declare-fun get!26404 (ValueCell!18449 V!60153) V!60153)

(assert (=> b!1568618 (= e!874465 (get!26404 (select (arr!50544 _values!487) from!782) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568619 () Bool)

(declare-fun get!26405 (ValueCell!18449 V!60153) V!60153)

(assert (=> b!1568619 (= e!874465 (get!26405 (select (arr!50544 _values!487) from!782) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163923 c!145111) b!1568618))

(assert (= (and d!163923 (not c!145111)) b!1568619))

(assert (=> b!1568618 m!1443265))

(assert (=> b!1568618 m!1443267))

(declare-fun m!1443395 () Bool)

(assert (=> b!1568618 m!1443395))

(assert (=> b!1568619 m!1443265))

(assert (=> b!1568619 m!1443267))

(declare-fun m!1443397 () Bool)

(assert (=> b!1568619 m!1443397))

(assert (=> b!1568512 d!163923))

(declare-fun d!163925 () Bool)

(assert (=> d!163925 (not (contains!10390 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673498 () Unit!51941)

(declare-fun choose!2068 (ListLongMap!22743 (_ BitVec 64) V!60153 (_ BitVec 64)) Unit!51941)

(assert (=> d!163925 (= lt!673498 (choose!2068 lt!673450 (select (arr!50543 _keys!637) from!782) lt!673448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874468 () Bool)

(assert (=> d!163925 e!874468))

(declare-fun res!1071432 () Bool)

(assert (=> d!163925 (=> (not res!1071432) (not e!874468))))

(assert (=> d!163925 (= res!1071432 (not (contains!10390 lt!673450 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163925 (= (addStillNotContains!574 lt!673450 (select (arr!50543 _keys!637) from!782) lt!673448 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673498)))

(declare-fun b!1568623 () Bool)

(assert (=> b!1568623 (= e!874468 (not (= (select (arr!50543 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163925 res!1071432) b!1568623))

(assert (=> d!163925 m!1443275))

(assert (=> d!163925 m!1443275))

(declare-fun m!1443399 () Bool)

(assert (=> d!163925 m!1443399))

(assert (=> d!163925 m!1443273))

(declare-fun m!1443401 () Bool)

(assert (=> d!163925 m!1443401))

(declare-fun m!1443403 () Bool)

(assert (=> d!163925 m!1443403))

(assert (=> b!1568512 d!163925))

(declare-fun d!163927 () Bool)

(declare-fun e!874470 () Bool)

(assert (=> d!163927 e!874470))

(declare-fun res!1071433 () Bool)

(assert (=> d!163927 (=> res!1071433 e!874470)))

(declare-fun lt!673500 () Bool)

(assert (=> d!163927 (= res!1071433 (not lt!673500))))

(declare-fun lt!673502 () Bool)

(assert (=> d!163927 (= lt!673500 lt!673502)))

(declare-fun lt!673501 () Unit!51941)

(declare-fun e!874469 () Unit!51941)

(assert (=> d!163927 (= lt!673501 e!874469)))

(declare-fun c!145112 () Bool)

(assert (=> d!163927 (= c!145112 lt!673502)))

(assert (=> d!163927 (= lt!673502 (containsKey!851 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163927 (= (contains!10390 lt!673449 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673500)))

(declare-fun b!1568624 () Bool)

(declare-fun lt!673499 () Unit!51941)

(assert (=> b!1568624 (= e!874469 lt!673499)))

(assert (=> b!1568624 (= lt!673499 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568624 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568625 () Bool)

(declare-fun Unit!51946 () Unit!51941)

(assert (=> b!1568625 (= e!874469 Unit!51946)))

(declare-fun b!1568626 () Bool)

(assert (=> b!1568626 (= e!874470 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163927 c!145112) b!1568624))

(assert (= (and d!163927 (not c!145112)) b!1568625))

(assert (= (and d!163927 (not res!1071433)) b!1568626))

(declare-fun m!1443405 () Bool)

(assert (=> d!163927 m!1443405))

(declare-fun m!1443407 () Bool)

(assert (=> b!1568624 m!1443407))

(declare-fun m!1443409 () Bool)

(assert (=> b!1568624 m!1443409))

(assert (=> b!1568624 m!1443409))

(declare-fun m!1443411 () Bool)

(assert (=> b!1568624 m!1443411))

(assert (=> b!1568626 m!1443409))

(assert (=> b!1568626 m!1443409))

(assert (=> b!1568626 m!1443411))

(assert (=> b!1568512 d!163927))

(declare-fun b!1568651 () Bool)

(declare-fun e!874491 () ListLongMap!22743)

(declare-fun call!72038 () ListLongMap!22743)

(assert (=> b!1568651 (= e!874491 call!72038)))

(declare-fun b!1568652 () Bool)

(declare-fun e!874489 () Bool)

(declare-fun e!874485 () Bool)

(assert (=> b!1568652 (= e!874489 e!874485)))

(declare-fun c!145123 () Bool)

(assert (=> b!1568652 (= c!145123 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51094 _keys!637)))))

(declare-fun bm!72035 () Bool)

(assert (=> bm!72035 (= call!72038 (getCurrentListMapNoExtraKeys!6768 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1568653 () Bool)

(declare-fun lt!673518 () Unit!51941)

(declare-fun lt!673522 () Unit!51941)

(assert (=> b!1568653 (= lt!673518 lt!673522)))

(declare-fun lt!673517 () (_ BitVec 64))

(declare-fun lt!673523 () V!60153)

(declare-fun lt!673521 () ListLongMap!22743)

(declare-fun lt!673519 () (_ BitVec 64))

(assert (=> b!1568653 (not (contains!10390 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)) lt!673517))))

(assert (=> b!1568653 (= lt!673522 (addStillNotContains!574 lt!673521 lt!673519 lt!673523 lt!673517))))

(assert (=> b!1568653 (= lt!673517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1568653 (= lt!673523 (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1568653 (= lt!673519 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1568653 (= lt!673521 call!72038)))

(assert (=> b!1568653 (= e!874491 (+!5123 call!72038 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1568654 () Bool)

(declare-fun res!1071444 () Bool)

(declare-fun e!874486 () Bool)

(assert (=> b!1568654 (=> (not res!1071444) (not e!874486))))

(declare-fun lt!673520 () ListLongMap!22743)

(assert (=> b!1568654 (= res!1071444 (not (contains!10390 lt!673520 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568655 () Bool)

(assert (=> b!1568655 (= e!874485 (= lt!673520 (getCurrentListMapNoExtraKeys!6768 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1568656 () Bool)

(declare-fun e!874490 () Bool)

(assert (=> b!1568656 (= e!874489 e!874490)))

(assert (=> b!1568656 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51094 _keys!637)))))

(declare-fun res!1071445 () Bool)

(assert (=> b!1568656 (= res!1071445 (contains!10390 lt!673520 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1568656 (=> (not res!1071445) (not e!874490))))

(declare-fun b!1568657 () Bool)

(assert (=> b!1568657 (= e!874486 e!874489)))

(declare-fun c!145121 () Bool)

(declare-fun e!874487 () Bool)

(assert (=> b!1568657 (= c!145121 e!874487)))

(declare-fun res!1071443 () Bool)

(assert (=> b!1568657 (=> (not res!1071443) (not e!874487))))

(assert (=> b!1568657 (= res!1071443 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51094 _keys!637)))))

(declare-fun d!163929 () Bool)

(assert (=> d!163929 e!874486))

(declare-fun res!1071442 () Bool)

(assert (=> d!163929 (=> (not res!1071442) (not e!874486))))

(assert (=> d!163929 (= res!1071442 (not (contains!10390 lt!673520 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!874488 () ListLongMap!22743)

(assert (=> d!163929 (= lt!673520 e!874488)))

(declare-fun c!145124 () Bool)

(assert (=> d!163929 (= c!145124 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51094 _keys!637)))))

(assert (=> d!163929 (validMask!0 mask!947)))

(assert (=> d!163929 (= (getCurrentListMapNoExtraKeys!6768 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!673520)))

(declare-fun b!1568658 () Bool)

(assert (=> b!1568658 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51094 _keys!637)))))

(assert (=> b!1568658 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51095 _values!487)))))

(assert (=> b!1568658 (= e!874490 (= (apply!1120 lt!673520 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1568659 () Bool)

(assert (=> b!1568659 (= e!874487 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1568659 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun b!1568660 () Bool)

(assert (=> b!1568660 (= e!874488 e!874491)))

(declare-fun c!145122 () Bool)

(assert (=> b!1568660 (= c!145122 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1568661 () Bool)

(declare-fun isEmpty!1149 (ListLongMap!22743) Bool)

(assert (=> b!1568661 (= e!874485 (isEmpty!1149 lt!673520))))

(declare-fun b!1568662 () Bool)

(assert (=> b!1568662 (= e!874488 (ListLongMap!22744 Nil!36659))))

(assert (= (and d!163929 c!145124) b!1568662))

(assert (= (and d!163929 (not c!145124)) b!1568660))

(assert (= (and b!1568660 c!145122) b!1568653))

(assert (= (and b!1568660 (not c!145122)) b!1568651))

(assert (= (or b!1568653 b!1568651) bm!72035))

(assert (= (and d!163929 res!1071442) b!1568654))

(assert (= (and b!1568654 res!1071444) b!1568657))

(assert (= (and b!1568657 res!1071443) b!1568659))

(assert (= (and b!1568657 c!145121) b!1568656))

(assert (= (and b!1568657 (not c!145121)) b!1568652))

(assert (= (and b!1568656 res!1071445) b!1568658))

(assert (= (and b!1568652 c!145123) b!1568655))

(assert (= (and b!1568652 (not c!145123)) b!1568661))

(declare-fun b_lambda!25001 () Bool)

(assert (=> (not b_lambda!25001) (not b!1568653)))

(assert (=> b!1568653 t!51552))

(declare-fun b_and!51825 () Bool)

(assert (= b_and!51815 (and (=> t!51552 result!26589) b_and!51825)))

(declare-fun b_lambda!25003 () Bool)

(assert (=> (not b_lambda!25003) (not b!1568658)))

(assert (=> b!1568658 t!51552))

(declare-fun b_and!51827 () Bool)

(assert (= b_and!51825 (and (=> t!51552 result!26589) b_and!51827)))

(declare-fun m!1443413 () Bool)

(assert (=> b!1568658 m!1443413))

(declare-fun m!1443415 () Bool)

(assert (=> b!1568658 m!1443415))

(assert (=> b!1568658 m!1443267))

(declare-fun m!1443417 () Bool)

(assert (=> b!1568658 m!1443417))

(assert (=> b!1568658 m!1443413))

(declare-fun m!1443419 () Bool)

(assert (=> b!1568658 m!1443419))

(assert (=> b!1568658 m!1443415))

(assert (=> b!1568658 m!1443267))

(assert (=> b!1568660 m!1443413))

(assert (=> b!1568660 m!1443413))

(declare-fun m!1443421 () Bool)

(assert (=> b!1568660 m!1443421))

(declare-fun m!1443423 () Bool)

(assert (=> d!163929 m!1443423))

(assert (=> d!163929 m!1443289))

(assert (=> b!1568656 m!1443413))

(assert (=> b!1568656 m!1443413))

(declare-fun m!1443425 () Bool)

(assert (=> b!1568656 m!1443425))

(declare-fun m!1443427 () Bool)

(assert (=> b!1568653 m!1443427))

(assert (=> b!1568653 m!1443413))

(assert (=> b!1568653 m!1443415))

(assert (=> b!1568653 m!1443267))

(assert (=> b!1568653 m!1443417))

(declare-fun m!1443429 () Bool)

(assert (=> b!1568653 m!1443429))

(declare-fun m!1443431 () Bool)

(assert (=> b!1568653 m!1443431))

(declare-fun m!1443433 () Bool)

(assert (=> b!1568653 m!1443433))

(assert (=> b!1568653 m!1443429))

(assert (=> b!1568653 m!1443415))

(assert (=> b!1568653 m!1443267))

(declare-fun m!1443435 () Bool)

(assert (=> b!1568655 m!1443435))

(assert (=> bm!72035 m!1443435))

(declare-fun m!1443437 () Bool)

(assert (=> b!1568654 m!1443437))

(declare-fun m!1443439 () Bool)

(assert (=> b!1568661 m!1443439))

(assert (=> b!1568659 m!1443413))

(assert (=> b!1568659 m!1443413))

(assert (=> b!1568659 m!1443421))

(assert (=> b!1568512 d!163929))

(declare-fun d!163931 () Bool)

(declare-fun e!874493 () Bool)

(assert (=> d!163931 e!874493))

(declare-fun res!1071446 () Bool)

(assert (=> d!163931 (=> res!1071446 e!874493)))

(declare-fun lt!673525 () Bool)

(assert (=> d!163931 (= res!1071446 (not lt!673525))))

(declare-fun lt!673527 () Bool)

(assert (=> d!163931 (= lt!673525 lt!673527)))

(declare-fun lt!673526 () Unit!51941)

(declare-fun e!874492 () Unit!51941)

(assert (=> d!163931 (= lt!673526 e!874492)))

(declare-fun c!145125 () Bool)

(assert (=> d!163931 (= c!145125 lt!673527)))

(assert (=> d!163931 (= lt!673527 (containsKey!851 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163931 (= (contains!10390 lt!673449 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673525)))

(declare-fun b!1568663 () Bool)

(declare-fun lt!673524 () Unit!51941)

(assert (=> b!1568663 (= e!874492 lt!673524)))

(assert (=> b!1568663 (= lt!673524 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568663 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568664 () Bool)

(declare-fun Unit!51947 () Unit!51941)

(assert (=> b!1568664 (= e!874492 Unit!51947)))

(declare-fun b!1568665 () Bool)

(assert (=> b!1568665 (= e!874493 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163931 c!145125) b!1568663))

(assert (= (and d!163931 (not c!145125)) b!1568664))

(assert (= (and d!163931 (not res!1071446)) b!1568665))

(declare-fun m!1443441 () Bool)

(assert (=> d!163931 m!1443441))

(declare-fun m!1443443 () Bool)

(assert (=> b!1568663 m!1443443))

(declare-fun m!1443445 () Bool)

(assert (=> b!1568663 m!1443445))

(assert (=> b!1568663 m!1443445))

(declare-fun m!1443447 () Bool)

(assert (=> b!1568663 m!1443447))

(assert (=> b!1568665 m!1443445))

(assert (=> b!1568665 m!1443445))

(assert (=> b!1568665 m!1443447))

(assert (=> b!1568512 d!163931))

(declare-fun d!163933 () Bool)

(declare-fun e!874496 () Bool)

(assert (=> d!163933 e!874496))

(declare-fun res!1071452 () Bool)

(assert (=> d!163933 (=> (not res!1071452) (not e!874496))))

(declare-fun lt!673538 () ListLongMap!22743)

(assert (=> d!163933 (= res!1071452 (contains!10390 lt!673538 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun lt!673539 () List!36662)

(assert (=> d!163933 (= lt!673538 (ListLongMap!22744 lt!673539))))

(declare-fun lt!673536 () Unit!51941)

(declare-fun lt!673537 () Unit!51941)

(assert (=> d!163933 (= lt!673536 lt!673537)))

(assert (=> d!163933 (= (getValueByKey!789 lt!673539 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) (Some!863 (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun lemmaContainsTupThenGetReturnValue!386 (List!36662 (_ BitVec 64) V!60153) Unit!51941)

(assert (=> d!163933 (= lt!673537 (lemmaContainsTupThenGetReturnValue!386 lt!673539 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun insertStrictlySorted!578 (List!36662 (_ BitVec 64) V!60153) List!36662)

(assert (=> d!163933 (= lt!673539 (insertStrictlySorted!578 (toList!11387 lt!673450) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(assert (=> d!163933 (= (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) lt!673538)))

(declare-fun b!1568670 () Bool)

(declare-fun res!1071451 () Bool)

(assert (=> b!1568670 (=> (not res!1071451) (not e!874496))))

(assert (=> b!1568670 (= res!1071451 (= (getValueByKey!789 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) (Some!863 (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun b!1568671 () Bool)

(declare-fun contains!10392 (List!36662 tuple2!25300) Bool)

(assert (=> b!1568671 (= e!874496 (contains!10392 (toList!11387 lt!673538) (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))

(assert (= (and d!163933 res!1071452) b!1568670))

(assert (= (and b!1568670 res!1071451) b!1568671))

(declare-fun m!1443449 () Bool)

(assert (=> d!163933 m!1443449))

(declare-fun m!1443451 () Bool)

(assert (=> d!163933 m!1443451))

(declare-fun m!1443453 () Bool)

(assert (=> d!163933 m!1443453))

(declare-fun m!1443455 () Bool)

(assert (=> d!163933 m!1443455))

(declare-fun m!1443457 () Bool)

(assert (=> b!1568670 m!1443457))

(declare-fun m!1443459 () Bool)

(assert (=> b!1568671 m!1443459))

(assert (=> b!1568512 d!163933))

(declare-fun d!163935 () Bool)

(assert (=> d!163935 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134374 d!163935))

(declare-fun d!163937 () Bool)

(assert (=> d!163937 (= (array_inv!39511 _keys!637) (bvsge (size!51094 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134374 d!163937))

(declare-fun d!163939 () Bool)

(assert (=> d!163939 (= (array_inv!39512 _values!487) (bvsge (size!51095 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134374 d!163939))

(declare-fun b!1568682 () Bool)

(declare-fun e!874506 () Bool)

(declare-fun call!72041 () Bool)

(assert (=> b!1568682 (= e!874506 call!72041)))

(declare-fun b!1568683 () Bool)

(declare-fun e!874508 () Bool)

(declare-fun contains!10393 (List!36663 (_ BitVec 64)) Bool)

(assert (=> b!1568683 (= e!874508 (contains!10393 Nil!36660 (select (arr!50543 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1568684 () Bool)

(assert (=> b!1568684 (= e!874506 call!72041)))

(declare-fun bm!72038 () Bool)

(declare-fun c!145128 () Bool)

(assert (=> bm!72038 (= call!72041 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)))))

(declare-fun d!163941 () Bool)

(declare-fun res!1071461 () Bool)

(declare-fun e!874505 () Bool)

(assert (=> d!163941 (=> res!1071461 e!874505)))

(assert (=> d!163941 (= res!1071461 (bvsge #b00000000000000000000000000000000 (size!51094 _keys!637)))))

(assert (=> d!163941 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36660) e!874505)))

(declare-fun b!1568685 () Bool)

(declare-fun e!874507 () Bool)

(assert (=> b!1568685 (= e!874507 e!874506)))

(assert (=> b!1568685 (= c!145128 (validKeyInArray!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1568686 () Bool)

(assert (=> b!1568686 (= e!874505 e!874507)))

(declare-fun res!1071460 () Bool)

(assert (=> b!1568686 (=> (not res!1071460) (not e!874507))))

(assert (=> b!1568686 (= res!1071460 (not e!874508))))

(declare-fun res!1071459 () Bool)

(assert (=> b!1568686 (=> (not res!1071459) (not e!874508))))

(assert (=> b!1568686 (= res!1071459 (validKeyInArray!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163941 (not res!1071461)) b!1568686))

(assert (= (and b!1568686 res!1071459) b!1568683))

(assert (= (and b!1568686 res!1071460) b!1568685))

(assert (= (and b!1568685 c!145128) b!1568682))

(assert (= (and b!1568685 (not c!145128)) b!1568684))

(assert (= (or b!1568682 b!1568684) bm!72038))

(assert (=> b!1568683 m!1443383))

(assert (=> b!1568683 m!1443383))

(declare-fun m!1443461 () Bool)

(assert (=> b!1568683 m!1443461))

(assert (=> bm!72038 m!1443383))

(declare-fun m!1443463 () Bool)

(assert (=> bm!72038 m!1443463))

(assert (=> b!1568685 m!1443383))

(assert (=> b!1568685 m!1443383))

(assert (=> b!1568685 m!1443391))

(assert (=> b!1568686 m!1443383))

(assert (=> b!1568686 m!1443383))

(assert (=> b!1568686 m!1443391))

(assert (=> b!1568513 d!163941))

(declare-fun condMapEmpty!59839 () Bool)

(declare-fun mapDefault!59839 () ValueCell!18449)

(assert (=> mapNonEmpty!59830 (= condMapEmpty!59839 (= mapRest!59830 ((as const (Array (_ BitVec 32) ValueCell!18449)) mapDefault!59839)))))

(declare-fun e!874514 () Bool)

(declare-fun mapRes!59839 () Bool)

(assert (=> mapNonEmpty!59830 (= tp!113856 (and e!874514 mapRes!59839))))

(declare-fun b!1568694 () Bool)

(assert (=> b!1568694 (= e!874514 tp_is_empty!38959)))

(declare-fun mapNonEmpty!59839 () Bool)

(declare-fun tp!113872 () Bool)

(declare-fun e!874513 () Bool)

(assert (=> mapNonEmpty!59839 (= mapRes!59839 (and tp!113872 e!874513))))

(declare-fun mapRest!59839 () (Array (_ BitVec 32) ValueCell!18449))

(declare-fun mapValue!59839 () ValueCell!18449)

(declare-fun mapKey!59839 () (_ BitVec 32))

(assert (=> mapNonEmpty!59839 (= mapRest!59830 (store mapRest!59839 mapKey!59839 mapValue!59839))))

(declare-fun b!1568693 () Bool)

(assert (=> b!1568693 (= e!874513 tp_is_empty!38959)))

(declare-fun mapIsEmpty!59839 () Bool)

(assert (=> mapIsEmpty!59839 mapRes!59839))

(assert (= (and mapNonEmpty!59830 condMapEmpty!59839) mapIsEmpty!59839))

(assert (= (and mapNonEmpty!59830 (not condMapEmpty!59839)) mapNonEmpty!59839))

(assert (= (and mapNonEmpty!59839 ((_ is ValueCellFull!18449) mapValue!59839)) b!1568693))

(assert (= (and mapNonEmpty!59830 ((_ is ValueCellFull!18449) mapDefault!59839)) b!1568694))

(declare-fun m!1443465 () Bool)

(assert (=> mapNonEmpty!59839 m!1443465))

(declare-fun b_lambda!25005 () Bool)

(assert (= b_lambda!25003 (or (and start!134374 b_free!32185) b_lambda!25005)))

(declare-fun b_lambda!25007 () Bool)

(assert (= b_lambda!25001 (or (and start!134374 b_free!32185) b_lambda!25007)))

(check-sat (not b!1568659) (not b!1568671) b_and!51827 (not d!163931) (not b!1568619) (not b!1568654) (not b!1568663) (not b!1568601) tp_is_empty!38959 (not d!163925) (not b!1568670) (not b_lambda!25007) (not d!163921) (not b!1568655) (not b!1568686) (not mapNonEmpty!59839) (not d!163917) (not b_lambda!24999) (not b!1568665) (not b!1568656) (not b!1568599) (not b!1568613) (not bm!72032) (not b!1568685) (not b!1568683) (not d!163929) (not b!1568624) (not b!1568611) (not b_next!32185) (not bm!72035) (not b!1568618) (not b!1568658) (not d!163927) (not bm!72038) (not d!163933) (not b!1568660) (not b!1568661) (not b!1568626) (not b_lambda!25005) (not b!1568653))
(check-sat b_and!51827 (not b_next!32185))
(get-model)

(declare-fun e!874520 () Option!864)

(declare-fun b!1568705 () Bool)

(assert (=> b!1568705 (= e!874520 (getValueByKey!789 (t!51553 (toList!11387 lt!673538)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun b!1568703 () Bool)

(declare-fun e!874519 () Option!864)

(assert (=> b!1568703 (= e!874519 (Some!863 (_2!12661 (h!38122 (toList!11387 lt!673538)))))))

(declare-fun b!1568706 () Bool)

(assert (=> b!1568706 (= e!874520 None!862)))

(declare-fun c!145133 () Bool)

(declare-fun d!163943 () Bool)

(assert (=> d!163943 (= c!145133 (and ((_ is Cons!36658) (toList!11387 lt!673538)) (= (_1!12661 (h!38122 (toList!11387 lt!673538))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (=> d!163943 (= (getValueByKey!789 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) e!874519)))

(declare-fun b!1568704 () Bool)

(assert (=> b!1568704 (= e!874519 e!874520)))

(declare-fun c!145134 () Bool)

(assert (=> b!1568704 (= c!145134 (and ((_ is Cons!36658) (toList!11387 lt!673538)) (not (= (_1!12661 (h!38122 (toList!11387 lt!673538))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))))

(assert (= (and d!163943 c!145133) b!1568703))

(assert (= (and d!163943 (not c!145133)) b!1568704))

(assert (= (and b!1568704 c!145134) b!1568705))

(assert (= (and b!1568704 (not c!145134)) b!1568706))

(declare-fun m!1443467 () Bool)

(assert (=> b!1568705 m!1443467))

(assert (=> b!1568670 d!163943))

(declare-fun d!163945 () Bool)

(assert (=> d!163945 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)))))

(declare-fun lt!673542 () Unit!51941)

(declare-fun choose!2069 (List!36662 (_ BitVec 64)) Unit!51941)

(assert (=> d!163945 (= lt!673542 (choose!2069 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)))))

(declare-fun e!874523 () Bool)

(assert (=> d!163945 e!874523))

(declare-fun res!1071464 () Bool)

(assert (=> d!163945 (=> (not res!1071464) (not e!874523))))

(declare-fun isStrictlySorted!973 (List!36662) Bool)

(assert (=> d!163945 (= res!1071464 (isStrictlySorted!973 (toList!11387 lt!673449)))))

(assert (=> d!163945 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)) lt!673542)))

(declare-fun b!1568709 () Bool)

(assert (=> b!1568709 (= e!874523 (containsKey!851 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)))))

(assert (= (and d!163945 res!1071464) b!1568709))

(assert (=> d!163945 m!1443273))

(assert (=> d!163945 m!1443377))

(assert (=> d!163945 m!1443377))

(assert (=> d!163945 m!1443379))

(assert (=> d!163945 m!1443273))

(declare-fun m!1443469 () Bool)

(assert (=> d!163945 m!1443469))

(declare-fun m!1443471 () Bool)

(assert (=> d!163945 m!1443471))

(assert (=> b!1568709 m!1443273))

(assert (=> b!1568709 m!1443373))

(assert (=> b!1568599 d!163945))

(declare-fun d!163947 () Bool)

(declare-fun isEmpty!1150 (Option!864) Bool)

(assert (=> d!163947 (= (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782))) (not (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)))))))

(declare-fun bs!45086 () Bool)

(assert (= bs!45086 d!163947))

(assert (=> bs!45086 m!1443377))

(declare-fun m!1443473 () Bool)

(assert (=> bs!45086 m!1443473))

(assert (=> b!1568599 d!163947))

(declare-fun e!874525 () Option!864)

(declare-fun b!1568712 () Bool)

(assert (=> b!1568712 (= e!874525 (getValueByKey!789 (t!51553 (toList!11387 lt!673449)) (select (arr!50543 _keys!637) from!782)))))

(declare-fun b!1568710 () Bool)

(declare-fun e!874524 () Option!864)

(assert (=> b!1568710 (= e!874524 (Some!863 (_2!12661 (h!38122 (toList!11387 lt!673449)))))))

(declare-fun b!1568713 () Bool)

(assert (=> b!1568713 (= e!874525 None!862)))

(declare-fun c!145135 () Bool)

(declare-fun d!163949 () Bool)

(assert (=> d!163949 (= c!145135 (and ((_ is Cons!36658) (toList!11387 lt!673449)) (= (_1!12661 (h!38122 (toList!11387 lt!673449))) (select (arr!50543 _keys!637) from!782))))))

(assert (=> d!163949 (= (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)) e!874524)))

(declare-fun b!1568711 () Bool)

(assert (=> b!1568711 (= e!874524 e!874525)))

(declare-fun c!145136 () Bool)

(assert (=> b!1568711 (= c!145136 (and ((_ is Cons!36658) (toList!11387 lt!673449)) (not (= (_1!12661 (h!38122 (toList!11387 lt!673449))) (select (arr!50543 _keys!637) from!782)))))))

(assert (= (and d!163949 c!145135) b!1568710))

(assert (= (and d!163949 (not c!145135)) b!1568711))

(assert (= (and b!1568711 c!145136) b!1568712))

(assert (= (and b!1568711 (not c!145136)) b!1568713))

(assert (=> b!1568712 m!1443273))

(declare-fun m!1443475 () Bool)

(assert (=> b!1568712 m!1443475))

(assert (=> b!1568599 d!163949))

(declare-fun d!163951 () Bool)

(assert (=> d!163951 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673543 () Unit!51941)

(assert (=> d!163951 (= lt!673543 (choose!2069 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874526 () Bool)

(assert (=> d!163951 e!874526))

(declare-fun res!1071465 () Bool)

(assert (=> d!163951 (=> (not res!1071465) (not e!874526))))

(assert (=> d!163951 (= res!1071465 (isStrictlySorted!973 (toList!11387 lt!673449)))))

(assert (=> d!163951 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000) lt!673543)))

(declare-fun b!1568714 () Bool)

(assert (=> b!1568714 (= e!874526 (containsKey!851 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163951 res!1071465) b!1568714))

(assert (=> d!163951 m!1443445))

(assert (=> d!163951 m!1443445))

(assert (=> d!163951 m!1443447))

(declare-fun m!1443477 () Bool)

(assert (=> d!163951 m!1443477))

(assert (=> d!163951 m!1443471))

(assert (=> b!1568714 m!1443441))

(assert (=> b!1568663 d!163951))

(declare-fun d!163953 () Bool)

(assert (=> d!163953 (= (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45087 () Bool)

(assert (= bs!45087 d!163953))

(assert (=> bs!45087 m!1443445))

(declare-fun m!1443479 () Bool)

(assert (=> bs!45087 m!1443479))

(assert (=> b!1568663 d!163953))

(declare-fun b!1568717 () Bool)

(declare-fun e!874528 () Option!864)

(assert (=> b!1568717 (= e!874528 (getValueByKey!789 (t!51553 (toList!11387 lt!673449)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568715 () Bool)

(declare-fun e!874527 () Option!864)

(assert (=> b!1568715 (= e!874527 (Some!863 (_2!12661 (h!38122 (toList!11387 lt!673449)))))))

(declare-fun b!1568718 () Bool)

(assert (=> b!1568718 (= e!874528 None!862)))

(declare-fun d!163955 () Bool)

(declare-fun c!145137 () Bool)

(assert (=> d!163955 (= c!145137 (and ((_ is Cons!36658) (toList!11387 lt!673449)) (= (_1!12661 (h!38122 (toList!11387 lt!673449))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163955 (= (getValueByKey!789 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000) e!874527)))

(declare-fun b!1568716 () Bool)

(assert (=> b!1568716 (= e!874527 e!874528)))

(declare-fun c!145138 () Bool)

(assert (=> b!1568716 (= c!145138 (and ((_ is Cons!36658) (toList!11387 lt!673449)) (not (= (_1!12661 (h!38122 (toList!11387 lt!673449))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!163955 c!145137) b!1568715))

(assert (= (and d!163955 (not c!145137)) b!1568716))

(assert (= (and b!1568716 c!145138) b!1568717))

(assert (= (and b!1568716 (not c!145138)) b!1568718))

(declare-fun m!1443481 () Bool)

(assert (=> b!1568717 m!1443481))

(assert (=> b!1568663 d!163955))

(declare-fun d!163957 () Bool)

(declare-fun e!874530 () Bool)

(assert (=> d!163957 e!874530))

(declare-fun res!1071466 () Bool)

(assert (=> d!163957 (=> res!1071466 e!874530)))

(declare-fun lt!673545 () Bool)

(assert (=> d!163957 (= res!1071466 (not lt!673545))))

(declare-fun lt!673547 () Bool)

(assert (=> d!163957 (= lt!673545 lt!673547)))

(declare-fun lt!673546 () Unit!51941)

(declare-fun e!874529 () Unit!51941)

(assert (=> d!163957 (= lt!673546 e!874529)))

(declare-fun c!145139 () Bool)

(assert (=> d!163957 (= c!145139 lt!673547)))

(assert (=> d!163957 (= lt!673547 (containsKey!851 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163957 (= (contains!10390 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!673545)))

(declare-fun b!1568719 () Bool)

(declare-fun lt!673544 () Unit!51941)

(assert (=> b!1568719 (= e!874529 lt!673544)))

(assert (=> b!1568719 (= lt!673544 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568719 (isDefined!580 (getValueByKey!789 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568720 () Bool)

(declare-fun Unit!51948 () Unit!51941)

(assert (=> b!1568720 (= e!874529 Unit!51948)))

(declare-fun b!1568721 () Bool)

(assert (=> b!1568721 (= e!874530 (isDefined!580 (getValueByKey!789 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163957 c!145139) b!1568719))

(assert (= (and d!163957 (not c!145139)) b!1568720))

(assert (= (and d!163957 (not res!1071466)) b!1568721))

(declare-fun m!1443483 () Bool)

(assert (=> d!163957 m!1443483))

(declare-fun m!1443485 () Bool)

(assert (=> b!1568719 m!1443485))

(declare-fun m!1443487 () Bool)

(assert (=> b!1568719 m!1443487))

(assert (=> b!1568719 m!1443487))

(declare-fun m!1443489 () Bool)

(assert (=> b!1568719 m!1443489))

(assert (=> b!1568721 m!1443487))

(assert (=> b!1568721 m!1443487))

(assert (=> b!1568721 m!1443489))

(assert (=> d!163925 d!163957))

(assert (=> d!163925 d!163933))

(declare-fun d!163959 () Bool)

(assert (=> d!163959 (not (contains!10390 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163959 true))

(declare-fun _$36!388 () Unit!51941)

(assert (=> d!163959 (= (choose!2068 lt!673450 (select (arr!50543 _keys!637) from!782) lt!673448 #b0000000000000000000000000000000000000000000000000000000000000000) _$36!388)))

(declare-fun bs!45088 () Bool)

(assert (= bs!45088 d!163959))

(assert (=> bs!45088 m!1443275))

(assert (=> bs!45088 m!1443275))

(assert (=> bs!45088 m!1443399))

(assert (=> d!163925 d!163959))

(declare-fun d!163961 () Bool)

(declare-fun e!874532 () Bool)

(assert (=> d!163961 e!874532))

(declare-fun res!1071467 () Bool)

(assert (=> d!163961 (=> res!1071467 e!874532)))

(declare-fun lt!673549 () Bool)

(assert (=> d!163961 (= res!1071467 (not lt!673549))))

(declare-fun lt!673551 () Bool)

(assert (=> d!163961 (= lt!673549 lt!673551)))

(declare-fun lt!673550 () Unit!51941)

(declare-fun e!874531 () Unit!51941)

(assert (=> d!163961 (= lt!673550 e!874531)))

(declare-fun c!145140 () Bool)

(assert (=> d!163961 (= c!145140 lt!673551)))

(assert (=> d!163961 (= lt!673551 (containsKey!851 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163961 (= (contains!10390 lt!673450 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673549)))

(declare-fun b!1568723 () Bool)

(declare-fun lt!673548 () Unit!51941)

(assert (=> b!1568723 (= e!874531 lt!673548)))

(assert (=> b!1568723 (= lt!673548 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568723 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568724 () Bool)

(declare-fun Unit!51949 () Unit!51941)

(assert (=> b!1568724 (= e!874531 Unit!51949)))

(declare-fun b!1568725 () Bool)

(assert (=> b!1568725 (= e!874532 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163961 c!145140) b!1568723))

(assert (= (and d!163961 (not c!145140)) b!1568724))

(assert (= (and d!163961 (not res!1071467)) b!1568725))

(declare-fun m!1443491 () Bool)

(assert (=> d!163961 m!1443491))

(declare-fun m!1443493 () Bool)

(assert (=> b!1568723 m!1443493))

(declare-fun m!1443495 () Bool)

(assert (=> b!1568723 m!1443495))

(assert (=> b!1568723 m!1443495))

(declare-fun m!1443497 () Bool)

(assert (=> b!1568723 m!1443497))

(assert (=> b!1568725 m!1443495))

(assert (=> b!1568725 m!1443495))

(assert (=> b!1568725 m!1443497))

(assert (=> d!163925 d!163961))

(declare-fun d!163963 () Bool)

(declare-fun lt!673554 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!799 (List!36662) (InoxSet tuple2!25300))

(assert (=> d!163963 (= lt!673554 (select (content!799 (toList!11387 lt!673538)) (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))

(declare-fun e!874538 () Bool)

(assert (=> d!163963 (= lt!673554 e!874538)))

(declare-fun res!1071472 () Bool)

(assert (=> d!163963 (=> (not res!1071472) (not e!874538))))

(assert (=> d!163963 (= res!1071472 ((_ is Cons!36658) (toList!11387 lt!673538)))))

(assert (=> d!163963 (= (contains!10392 (toList!11387 lt!673538) (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) lt!673554)))

(declare-fun b!1568730 () Bool)

(declare-fun e!874537 () Bool)

(assert (=> b!1568730 (= e!874538 e!874537)))

(declare-fun res!1071473 () Bool)

(assert (=> b!1568730 (=> res!1071473 e!874537)))

(assert (=> b!1568730 (= res!1071473 (= (h!38122 (toList!11387 lt!673538)) (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))

(declare-fun b!1568731 () Bool)

(assert (=> b!1568731 (= e!874537 (contains!10392 (t!51553 (toList!11387 lt!673538)) (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))

(assert (= (and d!163963 res!1071472) b!1568730))

(assert (= (and b!1568730 (not res!1071473)) b!1568731))

(declare-fun m!1443499 () Bool)

(assert (=> d!163963 m!1443499))

(declare-fun m!1443501 () Bool)

(assert (=> d!163963 m!1443501))

(declare-fun m!1443503 () Bool)

(assert (=> b!1568731 m!1443503))

(assert (=> b!1568671 d!163963))

(declare-fun b!1568732 () Bool)

(declare-fun e!874540 () Bool)

(declare-fun call!72042 () Bool)

(assert (=> b!1568732 (= e!874540 call!72042)))

(declare-fun b!1568734 () Bool)

(declare-fun e!874539 () Bool)

(assert (=> b!1568734 (= e!874539 call!72042)))

(declare-fun bm!72039 () Bool)

(assert (=> bm!72039 (= call!72042 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1568735 () Bool)

(assert (=> b!1568735 (= e!874539 e!874540)))

(declare-fun lt!673555 () (_ BitVec 64))

(assert (=> b!1568735 (= lt!673555 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!673557 () Unit!51941)

(assert (=> b!1568735 (= lt!673557 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673555 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1568735 (arrayContainsKey!0 _keys!637 lt!673555 #b00000000000000000000000000000000)))

(declare-fun lt!673556 () Unit!51941)

(assert (=> b!1568735 (= lt!673556 lt!673557)))

(declare-fun res!1071474 () Bool)

(assert (=> b!1568735 (= res!1071474 (= (seekEntryOrOpen!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947) (Found!13474 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1568735 (=> (not res!1071474) (not e!874540))))

(declare-fun d!163965 () Bool)

(declare-fun res!1071475 () Bool)

(declare-fun e!874541 () Bool)

(assert (=> d!163965 (=> res!1071475 e!874541)))

(assert (=> d!163965 (= res!1071475 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(assert (=> d!163965 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947) e!874541)))

(declare-fun b!1568733 () Bool)

(assert (=> b!1568733 (= e!874541 e!874539)))

(declare-fun c!145141 () Bool)

(assert (=> b!1568733 (= c!145141 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!163965 (not res!1071475)) b!1568733))

(assert (= (and b!1568733 c!145141) b!1568735))

(assert (= (and b!1568733 (not c!145141)) b!1568734))

(assert (= (and b!1568735 res!1071474) b!1568732))

(assert (= (or b!1568732 b!1568734) bm!72039))

(declare-fun m!1443505 () Bool)

(assert (=> bm!72039 m!1443505))

(declare-fun m!1443507 () Bool)

(assert (=> b!1568735 m!1443507))

(declare-fun m!1443509 () Bool)

(assert (=> b!1568735 m!1443509))

(declare-fun m!1443511 () Bool)

(assert (=> b!1568735 m!1443511))

(assert (=> b!1568735 m!1443507))

(declare-fun m!1443513 () Bool)

(assert (=> b!1568735 m!1443513))

(assert (=> b!1568733 m!1443507))

(assert (=> b!1568733 m!1443507))

(declare-fun m!1443515 () Bool)

(assert (=> b!1568733 m!1443515))

(assert (=> bm!72032 d!163965))

(declare-fun d!163967 () Bool)

(assert (=> d!163967 (arrayContainsKey!0 _keys!637 lt!673493 #b00000000000000000000000000000000)))

(declare-fun lt!673560 () Unit!51941)

(declare-fun choose!13 (array!104726 (_ BitVec 64) (_ BitVec 32)) Unit!51941)

(assert (=> d!163967 (= lt!673560 (choose!13 _keys!637 lt!673493 #b00000000000000000000000000000000))))

(assert (=> d!163967 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!163967 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673493 #b00000000000000000000000000000000) lt!673560)))

(declare-fun bs!45089 () Bool)

(assert (= bs!45089 d!163967))

(assert (=> bs!45089 m!1443387))

(declare-fun m!1443517 () Bool)

(assert (=> bs!45089 m!1443517))

(assert (=> b!1568613 d!163967))

(declare-fun d!163969 () Bool)

(declare-fun res!1071480 () Bool)

(declare-fun e!874546 () Bool)

(assert (=> d!163969 (=> res!1071480 e!874546)))

(assert (=> d!163969 (= res!1071480 (= (select (arr!50543 _keys!637) #b00000000000000000000000000000000) lt!673493))))

(assert (=> d!163969 (= (arrayContainsKey!0 _keys!637 lt!673493 #b00000000000000000000000000000000) e!874546)))

(declare-fun b!1568740 () Bool)

(declare-fun e!874547 () Bool)

(assert (=> b!1568740 (= e!874546 e!874547)))

(declare-fun res!1071481 () Bool)

(assert (=> b!1568740 (=> (not res!1071481) (not e!874547))))

(assert (=> b!1568740 (= res!1071481 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(declare-fun b!1568741 () Bool)

(assert (=> b!1568741 (= e!874547 (arrayContainsKey!0 _keys!637 lt!673493 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!163969 (not res!1071480)) b!1568740))

(assert (= (and b!1568740 res!1071481) b!1568741))

(assert (=> d!163969 m!1443383))

(declare-fun m!1443519 () Bool)

(assert (=> b!1568741 m!1443519))

(assert (=> b!1568613 d!163969))

(declare-fun b!1568754 () Bool)

(declare-fun e!874556 () SeekEntryResult!13474)

(declare-fun lt!673568 () SeekEntryResult!13474)

(assert (=> b!1568754 (= e!874556 (Found!13474 (index!56296 lt!673568)))))

(declare-fun b!1568756 () Bool)

(declare-fun e!874555 () SeekEntryResult!13474)

(assert (=> b!1568756 (= e!874555 e!874556)))

(declare-fun lt!673567 () (_ BitVec 64))

(assert (=> b!1568756 (= lt!673567 (select (arr!50543 _keys!637) (index!56296 lt!673568)))))

(declare-fun c!145148 () Bool)

(assert (=> b!1568756 (= c!145148 (= lt!673567 (select (arr!50543 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1568757 () Bool)

(declare-fun c!145149 () Bool)

(assert (=> b!1568757 (= c!145149 (= lt!673567 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874554 () SeekEntryResult!13474)

(assert (=> b!1568757 (= e!874556 e!874554)))

(declare-fun b!1568758 () Bool)

(assert (=> b!1568758 (= e!874555 Undefined!13474)))

(declare-fun b!1568759 () Bool)

(assert (=> b!1568759 (= e!874554 (MissingZero!13474 (index!56296 lt!673568)))))

(declare-fun b!1568755 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104726 (_ BitVec 32)) SeekEntryResult!13474)

(assert (=> b!1568755 (= e!874554 (seekKeyOrZeroReturnVacant!0 (x!140746 lt!673568) (index!56296 lt!673568) (index!56296 lt!673568) (select (arr!50543 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(declare-fun d!163971 () Bool)

(declare-fun lt!673569 () SeekEntryResult!13474)

(assert (=> d!163971 (and (or ((_ is Undefined!13474) lt!673569) (not ((_ is Found!13474) lt!673569)) (and (bvsge (index!56295 lt!673569) #b00000000000000000000000000000000) (bvslt (index!56295 lt!673569) (size!51094 _keys!637)))) (or ((_ is Undefined!13474) lt!673569) ((_ is Found!13474) lt!673569) (not ((_ is MissingZero!13474) lt!673569)) (and (bvsge (index!56294 lt!673569) #b00000000000000000000000000000000) (bvslt (index!56294 lt!673569) (size!51094 _keys!637)))) (or ((_ is Undefined!13474) lt!673569) ((_ is Found!13474) lt!673569) ((_ is MissingZero!13474) lt!673569) (not ((_ is MissingVacant!13474) lt!673569)) (and (bvsge (index!56297 lt!673569) #b00000000000000000000000000000000) (bvslt (index!56297 lt!673569) (size!51094 _keys!637)))) (or ((_ is Undefined!13474) lt!673569) (ite ((_ is Found!13474) lt!673569) (= (select (arr!50543 _keys!637) (index!56295 lt!673569)) (select (arr!50543 _keys!637) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13474) lt!673569) (= (select (arr!50543 _keys!637) (index!56294 lt!673569)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13474) lt!673569) (= (select (arr!50543 _keys!637) (index!56297 lt!673569)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163971 (= lt!673569 e!874555)))

(declare-fun c!145150 () Bool)

(assert (=> d!163971 (= c!145150 (and ((_ is Intermediate!13474) lt!673568) (undefined!14286 lt!673568)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104726 (_ BitVec 32)) SeekEntryResult!13474)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!163971 (= lt!673568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) mask!947) (select (arr!50543 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(assert (=> d!163971 (validMask!0 mask!947)))

(assert (=> d!163971 (= (seekEntryOrOpen!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!673569)))

(assert (= (and d!163971 c!145150) b!1568758))

(assert (= (and d!163971 (not c!145150)) b!1568756))

(assert (= (and b!1568756 c!145148) b!1568754))

(assert (= (and b!1568756 (not c!145148)) b!1568757))

(assert (= (and b!1568757 c!145149) b!1568759))

(assert (= (and b!1568757 (not c!145149)) b!1568755))

(declare-fun m!1443521 () Bool)

(assert (=> b!1568756 m!1443521))

(assert (=> b!1568755 m!1443383))

(declare-fun m!1443523 () Bool)

(assert (=> b!1568755 m!1443523))

(declare-fun m!1443525 () Bool)

(assert (=> d!163971 m!1443525))

(assert (=> d!163971 m!1443383))

(declare-fun m!1443527 () Bool)

(assert (=> d!163971 m!1443527))

(declare-fun m!1443529 () Bool)

(assert (=> d!163971 m!1443529))

(assert (=> d!163971 m!1443383))

(assert (=> d!163971 m!1443525))

(declare-fun m!1443531 () Bool)

(assert (=> d!163971 m!1443531))

(assert (=> d!163971 m!1443289))

(declare-fun m!1443533 () Bool)

(assert (=> d!163971 m!1443533))

(assert (=> b!1568613 d!163971))

(declare-fun d!163973 () Bool)

(declare-fun e!874558 () Bool)

(assert (=> d!163973 e!874558))

(declare-fun res!1071482 () Bool)

(assert (=> d!163973 (=> res!1071482 e!874558)))

(declare-fun lt!673571 () Bool)

(assert (=> d!163973 (= res!1071482 (not lt!673571))))

(declare-fun lt!673573 () Bool)

(assert (=> d!163973 (= lt!673571 lt!673573)))

(declare-fun lt!673572 () Unit!51941)

(declare-fun e!874557 () Unit!51941)

(assert (=> d!163973 (= lt!673572 e!874557)))

(declare-fun c!145151 () Bool)

(assert (=> d!163973 (= c!145151 lt!673573)))

(assert (=> d!163973 (= lt!673573 (containsKey!851 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163973 (= (contains!10390 lt!673520 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673571)))

(declare-fun b!1568760 () Bool)

(declare-fun lt!673570 () Unit!51941)

(assert (=> b!1568760 (= e!874557 lt!673570)))

(assert (=> b!1568760 (= lt!673570 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568760 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568761 () Bool)

(declare-fun Unit!51950 () Unit!51941)

(assert (=> b!1568761 (= e!874557 Unit!51950)))

(declare-fun b!1568762 () Bool)

(assert (=> b!1568762 (= e!874558 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163973 c!145151) b!1568760))

(assert (= (and d!163973 (not c!145151)) b!1568761))

(assert (= (and d!163973 (not res!1071482)) b!1568762))

(declare-fun m!1443535 () Bool)

(assert (=> d!163973 m!1443535))

(declare-fun m!1443537 () Bool)

(assert (=> b!1568760 m!1443537))

(declare-fun m!1443539 () Bool)

(assert (=> b!1568760 m!1443539))

(assert (=> b!1568760 m!1443539))

(declare-fun m!1443541 () Bool)

(assert (=> b!1568760 m!1443541))

(assert (=> b!1568762 m!1443539))

(assert (=> b!1568762 m!1443539))

(assert (=> b!1568762 m!1443541))

(assert (=> d!163929 d!163973))

(assert (=> d!163929 d!163935))

(declare-fun d!163975 () Bool)

(declare-fun res!1071487 () Bool)

(declare-fun e!874563 () Bool)

(assert (=> d!163975 (=> res!1071487 e!874563)))

(assert (=> d!163975 (= res!1071487 (and ((_ is Cons!36658) (toList!11387 lt!673449)) (= (_1!12661 (h!38122 (toList!11387 lt!673449))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!163975 (= (containsKey!851 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000) e!874563)))

(declare-fun b!1568767 () Bool)

(declare-fun e!874564 () Bool)

(assert (=> b!1568767 (= e!874563 e!874564)))

(declare-fun res!1071488 () Bool)

(assert (=> b!1568767 (=> (not res!1071488) (not e!874564))))

(assert (=> b!1568767 (= res!1071488 (and (or (not ((_ is Cons!36658) (toList!11387 lt!673449))) (bvsle (_1!12661 (h!38122 (toList!11387 lt!673449))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36658) (toList!11387 lt!673449)) (bvslt (_1!12661 (h!38122 (toList!11387 lt!673449))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568768 () Bool)

(assert (=> b!1568768 (= e!874564 (containsKey!851 (t!51553 (toList!11387 lt!673449)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163975 (not res!1071487)) b!1568767))

(assert (= (and b!1568767 res!1071488) b!1568768))

(declare-fun m!1443543 () Bool)

(assert (=> b!1568768 m!1443543))

(assert (=> d!163927 d!163975))

(assert (=> b!1568601 d!163947))

(assert (=> b!1568601 d!163949))

(assert (=> b!1568665 d!163953))

(assert (=> b!1568665 d!163955))

(declare-fun b!1568769 () Bool)

(declare-fun e!874571 () ListLongMap!22743)

(declare-fun call!72043 () ListLongMap!22743)

(assert (=> b!1568769 (= e!874571 call!72043)))

(declare-fun b!1568770 () Bool)

(declare-fun e!874569 () Bool)

(declare-fun e!874565 () Bool)

(assert (=> b!1568770 (= e!874569 e!874565)))

(declare-fun c!145154 () Bool)

(assert (=> b!1568770 (= c!145154 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(declare-fun bm!72040 () Bool)

(assert (=> bm!72040 (= call!72043 (getCurrentListMapNoExtraKeys!6768 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1568771 () Bool)

(declare-fun lt!673575 () Unit!51941)

(declare-fun lt!673579 () Unit!51941)

(assert (=> b!1568771 (= lt!673575 lt!673579)))

(declare-fun lt!673574 () (_ BitVec 64))

(declare-fun lt!673580 () V!60153)

(declare-fun lt!673578 () ListLongMap!22743)

(declare-fun lt!673576 () (_ BitVec 64))

(assert (=> b!1568771 (not (contains!10390 (+!5123 lt!673578 (tuple2!25301 lt!673576 lt!673580)) lt!673574))))

(assert (=> b!1568771 (= lt!673579 (addStillNotContains!574 lt!673578 lt!673576 lt!673580 lt!673574))))

(assert (=> b!1568771 (= lt!673574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1568771 (= lt!673580 (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1568771 (= lt!673576 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)))))

(assert (=> b!1568771 (= lt!673578 call!72043)))

(assert (=> b!1568771 (= e!874571 (+!5123 call!72043 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1568772 () Bool)

(declare-fun res!1071491 () Bool)

(declare-fun e!874566 () Bool)

(assert (=> b!1568772 (=> (not res!1071491) (not e!874566))))

(declare-fun lt!673577 () ListLongMap!22743)

(assert (=> b!1568772 (= res!1071491 (not (contains!10390 lt!673577 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568773 () Bool)

(assert (=> b!1568773 (= e!874565 (= lt!673577 (getCurrentListMapNoExtraKeys!6768 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1568774 () Bool)

(declare-fun e!874570 () Bool)

(assert (=> b!1568774 (= e!874569 e!874570)))

(assert (=> b!1568774 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(declare-fun res!1071492 () Bool)

(assert (=> b!1568774 (= res!1071492 (contains!10390 lt!673577 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> b!1568774 (=> (not res!1071492) (not e!874570))))

(declare-fun b!1568775 () Bool)

(assert (=> b!1568775 (= e!874566 e!874569)))

(declare-fun c!145152 () Bool)

(declare-fun e!874567 () Bool)

(assert (=> b!1568775 (= c!145152 e!874567)))

(declare-fun res!1071490 () Bool)

(assert (=> b!1568775 (=> (not res!1071490) (not e!874567))))

(assert (=> b!1568775 (= res!1071490 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(declare-fun d!163977 () Bool)

(assert (=> d!163977 e!874566))

(declare-fun res!1071489 () Bool)

(assert (=> d!163977 (=> (not res!1071489) (not e!874566))))

(assert (=> d!163977 (= res!1071489 (not (contains!10390 lt!673577 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!874568 () ListLongMap!22743)

(assert (=> d!163977 (= lt!673577 e!874568)))

(declare-fun c!145155 () Bool)

(assert (=> d!163977 (= c!145155 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(assert (=> d!163977 (validMask!0 mask!947)))

(assert (=> d!163977 (= (getCurrentListMapNoExtraKeys!6768 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495) lt!673577)))

(declare-fun b!1568776 () Bool)

(assert (=> b!1568776 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(assert (=> b!1568776 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) (size!51095 _values!487)))))

(assert (=> b!1568776 (= e!874570 (= (apply!1120 lt!673577 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1568777 () Bool)

(assert (=> b!1568777 (= e!874567 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> b!1568777 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1568778 () Bool)

(assert (=> b!1568778 (= e!874568 e!874571)))

(declare-fun c!145153 () Bool)

(assert (=> b!1568778 (= c!145153 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(declare-fun b!1568779 () Bool)

(assert (=> b!1568779 (= e!874565 (isEmpty!1149 lt!673577))))

(declare-fun b!1568780 () Bool)

(assert (=> b!1568780 (= e!874568 (ListLongMap!22744 Nil!36659))))

(assert (= (and d!163977 c!145155) b!1568780))

(assert (= (and d!163977 (not c!145155)) b!1568778))

(assert (= (and b!1568778 c!145153) b!1568771))

(assert (= (and b!1568778 (not c!145153)) b!1568769))

(assert (= (or b!1568771 b!1568769) bm!72040))

(assert (= (and d!163977 res!1071489) b!1568772))

(assert (= (and b!1568772 res!1071491) b!1568775))

(assert (= (and b!1568775 res!1071490) b!1568777))

(assert (= (and b!1568775 c!145152) b!1568774))

(assert (= (and b!1568775 (not c!145152)) b!1568770))

(assert (= (and b!1568774 res!1071492) b!1568776))

(assert (= (and b!1568770 c!145154) b!1568773))

(assert (= (and b!1568770 (not c!145154)) b!1568779))

(declare-fun b_lambda!25009 () Bool)

(assert (=> (not b_lambda!25009) (not b!1568771)))

(assert (=> b!1568771 t!51552))

(declare-fun b_and!51829 () Bool)

(assert (= b_and!51827 (and (=> t!51552 result!26589) b_and!51829)))

(declare-fun b_lambda!25011 () Bool)

(assert (=> (not b_lambda!25011) (not b!1568776)))

(assert (=> b!1568776 t!51552))

(declare-fun b_and!51831 () Bool)

(assert (= b_and!51829 (and (=> t!51552 result!26589) b_and!51831)))

(declare-fun m!1443545 () Bool)

(assert (=> b!1568776 m!1443545))

(declare-fun m!1443547 () Bool)

(assert (=> b!1568776 m!1443547))

(assert (=> b!1568776 m!1443267))

(declare-fun m!1443549 () Bool)

(assert (=> b!1568776 m!1443549))

(assert (=> b!1568776 m!1443545))

(declare-fun m!1443551 () Bool)

(assert (=> b!1568776 m!1443551))

(assert (=> b!1568776 m!1443547))

(assert (=> b!1568776 m!1443267))

(assert (=> b!1568778 m!1443545))

(assert (=> b!1568778 m!1443545))

(declare-fun m!1443553 () Bool)

(assert (=> b!1568778 m!1443553))

(declare-fun m!1443555 () Bool)

(assert (=> d!163977 m!1443555))

(assert (=> d!163977 m!1443289))

(assert (=> b!1568774 m!1443545))

(assert (=> b!1568774 m!1443545))

(declare-fun m!1443557 () Bool)

(assert (=> b!1568774 m!1443557))

(declare-fun m!1443559 () Bool)

(assert (=> b!1568771 m!1443559))

(assert (=> b!1568771 m!1443545))

(assert (=> b!1568771 m!1443547))

(assert (=> b!1568771 m!1443267))

(assert (=> b!1568771 m!1443549))

(declare-fun m!1443561 () Bool)

(assert (=> b!1568771 m!1443561))

(declare-fun m!1443563 () Bool)

(assert (=> b!1568771 m!1443563))

(declare-fun m!1443565 () Bool)

(assert (=> b!1568771 m!1443565))

(assert (=> b!1568771 m!1443561))

(assert (=> b!1568771 m!1443547))

(assert (=> b!1568771 m!1443267))

(declare-fun m!1443567 () Bool)

(assert (=> b!1568773 m!1443567))

(assert (=> bm!72040 m!1443567))

(declare-fun m!1443569 () Bool)

(assert (=> b!1568772 m!1443569))

(declare-fun m!1443571 () Bool)

(assert (=> b!1568779 m!1443571))

(assert (=> b!1568777 m!1443545))

(assert (=> b!1568777 m!1443545))

(assert (=> b!1568777 m!1443553))

(assert (=> b!1568655 d!163977))

(declare-fun d!163979 () Bool)

(declare-fun e!874573 () Bool)

(assert (=> d!163979 e!874573))

(declare-fun res!1071493 () Bool)

(assert (=> d!163979 (=> res!1071493 e!874573)))

(declare-fun lt!673582 () Bool)

(assert (=> d!163979 (= res!1071493 (not lt!673582))))

(declare-fun lt!673584 () Bool)

(assert (=> d!163979 (= lt!673582 lt!673584)))

(declare-fun lt!673583 () Unit!51941)

(declare-fun e!874572 () Unit!51941)

(assert (=> d!163979 (= lt!673583 e!874572)))

(declare-fun c!145156 () Bool)

(assert (=> d!163979 (= c!145156 lt!673584)))

(assert (=> d!163979 (= lt!673584 (containsKey!851 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> d!163979 (= (contains!10390 lt!673520 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) lt!673582)))

(declare-fun b!1568781 () Bool)

(declare-fun lt!673581 () Unit!51941)

(assert (=> b!1568781 (= e!874572 lt!673581)))

(assert (=> b!1568781 (= lt!673581 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1568781 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1568782 () Bool)

(declare-fun Unit!51951 () Unit!51941)

(assert (=> b!1568782 (= e!874572 Unit!51951)))

(declare-fun b!1568783 () Bool)

(assert (=> b!1568783 (= e!874573 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (= (and d!163979 c!145156) b!1568781))

(assert (= (and d!163979 (not c!145156)) b!1568782))

(assert (= (and d!163979 (not res!1071493)) b!1568783))

(assert (=> d!163979 m!1443413))

(declare-fun m!1443573 () Bool)

(assert (=> d!163979 m!1443573))

(assert (=> b!1568781 m!1443413))

(declare-fun m!1443575 () Bool)

(assert (=> b!1568781 m!1443575))

(assert (=> b!1568781 m!1443413))

(declare-fun m!1443577 () Bool)

(assert (=> b!1568781 m!1443577))

(assert (=> b!1568781 m!1443577))

(declare-fun m!1443579 () Bool)

(assert (=> b!1568781 m!1443579))

(assert (=> b!1568783 m!1443413))

(assert (=> b!1568783 m!1443577))

(assert (=> b!1568783 m!1443577))

(assert (=> b!1568783 m!1443579))

(assert (=> b!1568656 d!163979))

(declare-fun d!163981 () Bool)

(declare-fun lt!673587 () Bool)

(declare-fun content!800 (List!36663) (InoxSet (_ BitVec 64)))

(assert (=> d!163981 (= lt!673587 (select (content!800 Nil!36660) (select (arr!50543 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun e!874578 () Bool)

(assert (=> d!163981 (= lt!673587 e!874578)))

(declare-fun res!1071499 () Bool)

(assert (=> d!163981 (=> (not res!1071499) (not e!874578))))

(assert (=> d!163981 (= res!1071499 ((_ is Cons!36659) Nil!36660))))

(assert (=> d!163981 (= (contains!10393 Nil!36660 (select (arr!50543 _keys!637) #b00000000000000000000000000000000)) lt!673587)))

(declare-fun b!1568788 () Bool)

(declare-fun e!874579 () Bool)

(assert (=> b!1568788 (= e!874578 e!874579)))

(declare-fun res!1071498 () Bool)

(assert (=> b!1568788 (=> res!1071498 e!874579)))

(assert (=> b!1568788 (= res!1071498 (= (h!38123 Nil!36660) (select (arr!50543 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1568789 () Bool)

(assert (=> b!1568789 (= e!874579 (contains!10393 (t!51554 Nil!36660) (select (arr!50543 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163981 res!1071499) b!1568788))

(assert (= (and b!1568788 (not res!1071498)) b!1568789))

(declare-fun m!1443581 () Bool)

(assert (=> d!163981 m!1443581))

(assert (=> d!163981 m!1443383))

(declare-fun m!1443583 () Bool)

(assert (=> d!163981 m!1443583))

(assert (=> b!1568789 m!1443383))

(declare-fun m!1443585 () Bool)

(assert (=> b!1568789 m!1443585))

(assert (=> b!1568683 d!163981))

(declare-fun d!163983 () Bool)

(assert (=> d!163983 (= (get!26403 (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782))) (v!22314 (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782))))))

(assert (=> d!163921 d!163983))

(assert (=> d!163921 d!163949))

(declare-fun d!163985 () Bool)

(declare-fun e!874581 () Bool)

(assert (=> d!163985 e!874581))

(declare-fun res!1071500 () Bool)

(assert (=> d!163985 (=> res!1071500 e!874581)))

(declare-fun lt!673589 () Bool)

(assert (=> d!163985 (= res!1071500 (not lt!673589))))

(declare-fun lt!673591 () Bool)

(assert (=> d!163985 (= lt!673589 lt!673591)))

(declare-fun lt!673590 () Unit!51941)

(declare-fun e!874580 () Unit!51941)

(assert (=> d!163985 (= lt!673590 e!874580)))

(declare-fun c!145157 () Bool)

(assert (=> d!163985 (= c!145157 lt!673591)))

(assert (=> d!163985 (= lt!673591 (containsKey!851 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(assert (=> d!163985 (= (contains!10390 lt!673538 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) lt!673589)))

(declare-fun b!1568790 () Bool)

(declare-fun lt!673588 () Unit!51941)

(assert (=> b!1568790 (= e!874580 lt!673588)))

(assert (=> b!1568790 (= lt!673588 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(assert (=> b!1568790 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun b!1568791 () Bool)

(declare-fun Unit!51952 () Unit!51941)

(assert (=> b!1568791 (= e!874580 Unit!51952)))

(declare-fun b!1568792 () Bool)

(assert (=> b!1568792 (= e!874581 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (= (and d!163985 c!145157) b!1568790))

(assert (= (and d!163985 (not c!145157)) b!1568791))

(assert (= (and d!163985 (not res!1071500)) b!1568792))

(declare-fun m!1443587 () Bool)

(assert (=> d!163985 m!1443587))

(declare-fun m!1443589 () Bool)

(assert (=> b!1568790 m!1443589))

(assert (=> b!1568790 m!1443457))

(assert (=> b!1568790 m!1443457))

(declare-fun m!1443591 () Bool)

(assert (=> b!1568790 m!1443591))

(assert (=> b!1568792 m!1443457))

(assert (=> b!1568792 m!1443457))

(assert (=> b!1568792 m!1443591))

(assert (=> d!163933 d!163985))

(declare-fun b!1568795 () Bool)

(declare-fun e!874583 () Option!864)

(assert (=> b!1568795 (= e!874583 (getValueByKey!789 (t!51553 lt!673539) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun b!1568793 () Bool)

(declare-fun e!874582 () Option!864)

(assert (=> b!1568793 (= e!874582 (Some!863 (_2!12661 (h!38122 lt!673539))))))

(declare-fun b!1568796 () Bool)

(assert (=> b!1568796 (= e!874583 None!862)))

(declare-fun d!163987 () Bool)

(declare-fun c!145158 () Bool)

(assert (=> d!163987 (= c!145158 (and ((_ is Cons!36658) lt!673539) (= (_1!12661 (h!38122 lt!673539)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (=> d!163987 (= (getValueByKey!789 lt!673539 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) e!874582)))

(declare-fun b!1568794 () Bool)

(assert (=> b!1568794 (= e!874582 e!874583)))

(declare-fun c!145159 () Bool)

(assert (=> b!1568794 (= c!145159 (and ((_ is Cons!36658) lt!673539) (not (= (_1!12661 (h!38122 lt!673539)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))))

(assert (= (and d!163987 c!145158) b!1568793))

(assert (= (and d!163987 (not c!145158)) b!1568794))

(assert (= (and b!1568794 c!145159) b!1568795))

(assert (= (and b!1568794 (not c!145159)) b!1568796))

(declare-fun m!1443593 () Bool)

(assert (=> b!1568795 m!1443593))

(assert (=> d!163933 d!163987))

(declare-fun d!163989 () Bool)

(assert (=> d!163989 (= (getValueByKey!789 lt!673539 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) (Some!863 (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun lt!673594 () Unit!51941)

(declare-fun choose!2070 (List!36662 (_ BitVec 64) V!60153) Unit!51941)

(assert (=> d!163989 (= lt!673594 (choose!2070 lt!673539 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun e!874586 () Bool)

(assert (=> d!163989 e!874586))

(declare-fun res!1071505 () Bool)

(assert (=> d!163989 (=> (not res!1071505) (not e!874586))))

(assert (=> d!163989 (= res!1071505 (isStrictlySorted!973 lt!673539))))

(assert (=> d!163989 (= (lemmaContainsTupThenGetReturnValue!386 lt!673539 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) lt!673594)))

(declare-fun b!1568801 () Bool)

(declare-fun res!1071506 () Bool)

(assert (=> b!1568801 (=> (not res!1071506) (not e!874586))))

(assert (=> b!1568801 (= res!1071506 (containsKey!851 lt!673539 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun b!1568802 () Bool)

(assert (=> b!1568802 (= e!874586 (contains!10392 lt!673539 (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (= (and d!163989 res!1071505) b!1568801))

(assert (= (and b!1568801 res!1071506) b!1568802))

(assert (=> d!163989 m!1443451))

(declare-fun m!1443595 () Bool)

(assert (=> d!163989 m!1443595))

(declare-fun m!1443597 () Bool)

(assert (=> d!163989 m!1443597))

(declare-fun m!1443599 () Bool)

(assert (=> b!1568801 m!1443599))

(declare-fun m!1443601 () Bool)

(assert (=> b!1568802 m!1443601))

(assert (=> d!163933 d!163989))

(declare-fun bm!72047 () Bool)

(declare-fun call!72051 () List!36662)

(declare-fun call!72052 () List!36662)

(assert (=> bm!72047 (= call!72051 call!72052)))

(declare-fun bm!72048 () Bool)

(declare-fun call!72050 () List!36662)

(assert (=> bm!72048 (= call!72050 call!72051)))

(declare-fun b!1568823 () Bool)

(declare-fun e!874598 () List!36662)

(assert (=> b!1568823 (= e!874598 call!72051)))

(declare-fun d!163991 () Bool)

(declare-fun e!874597 () Bool)

(assert (=> d!163991 e!874597))

(declare-fun res!1071512 () Bool)

(assert (=> d!163991 (=> (not res!1071512) (not e!874597))))

(declare-fun lt!673597 () List!36662)

(assert (=> d!163991 (= res!1071512 (isStrictlySorted!973 lt!673597))))

(declare-fun e!874601 () List!36662)

(assert (=> d!163991 (= lt!673597 e!874601)))

(declare-fun c!145168 () Bool)

(assert (=> d!163991 (= c!145168 (and ((_ is Cons!36658) (toList!11387 lt!673450)) (bvslt (_1!12661 (h!38122 (toList!11387 lt!673450))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (=> d!163991 (isStrictlySorted!973 (toList!11387 lt!673450))))

(assert (=> d!163991 (= (insertStrictlySorted!578 (toList!11387 lt!673450) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) lt!673597)))

(declare-fun b!1568824 () Bool)

(declare-fun c!145171 () Bool)

(assert (=> b!1568824 (= c!145171 (and ((_ is Cons!36658) (toList!11387 lt!673450)) (bvsgt (_1!12661 (h!38122 (toList!11387 lt!673450))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun e!874600 () List!36662)

(assert (=> b!1568824 (= e!874598 e!874600)))

(declare-fun b!1568825 () Bool)

(assert (=> b!1568825 (= e!874601 e!874598)))

(declare-fun c!145170 () Bool)

(assert (=> b!1568825 (= c!145170 (and ((_ is Cons!36658) (toList!11387 lt!673450)) (= (_1!12661 (h!38122 (toList!11387 lt!673450))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun e!874599 () List!36662)

(declare-fun b!1568826 () Bool)

(assert (=> b!1568826 (= e!874599 (ite c!145170 (t!51553 (toList!11387 lt!673450)) (ite c!145171 (Cons!36658 (h!38122 (toList!11387 lt!673450)) (t!51553 (toList!11387 lt!673450))) Nil!36659)))))

(declare-fun b!1568827 () Bool)

(assert (=> b!1568827 (= e!874597 (contains!10392 lt!673597 (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun b!1568828 () Bool)

(assert (=> b!1568828 (= e!874600 call!72050)))

(declare-fun b!1568829 () Bool)

(assert (=> b!1568829 (= e!874599 (insertStrictlySorted!578 (t!51553 (toList!11387 lt!673450)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun b!1568830 () Bool)

(assert (=> b!1568830 (= e!874600 call!72050)))

(declare-fun b!1568831 () Bool)

(assert (=> b!1568831 (= e!874601 call!72052)))

(declare-fun b!1568832 () Bool)

(declare-fun res!1071511 () Bool)

(assert (=> b!1568832 (=> (not res!1071511) (not e!874597))))

(assert (=> b!1568832 (= res!1071511 (containsKey!851 lt!673597 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun bm!72049 () Bool)

(declare-fun $colon$colon!984 (List!36662 tuple2!25300) List!36662)

(assert (=> bm!72049 (= call!72052 ($colon$colon!984 e!874599 (ite c!145168 (h!38122 (toList!11387 lt!673450)) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))))

(declare-fun c!145169 () Bool)

(assert (=> bm!72049 (= c!145169 c!145168)))

(assert (= (and d!163991 c!145168) b!1568831))

(assert (= (and d!163991 (not c!145168)) b!1568825))

(assert (= (and b!1568825 c!145170) b!1568823))

(assert (= (and b!1568825 (not c!145170)) b!1568824))

(assert (= (and b!1568824 c!145171) b!1568830))

(assert (= (and b!1568824 (not c!145171)) b!1568828))

(assert (= (or b!1568830 b!1568828) bm!72048))

(assert (= (or b!1568823 bm!72048) bm!72047))

(assert (= (or b!1568831 bm!72047) bm!72049))

(assert (= (and bm!72049 c!145169) b!1568829))

(assert (= (and bm!72049 (not c!145169)) b!1568826))

(assert (= (and d!163991 res!1071512) b!1568832))

(assert (= (and b!1568832 res!1071511) b!1568827))

(declare-fun m!1443603 () Bool)

(assert (=> b!1568827 m!1443603))

(declare-fun m!1443605 () Bool)

(assert (=> bm!72049 m!1443605))

(declare-fun m!1443607 () Bool)

(assert (=> b!1568832 m!1443607))

(declare-fun m!1443609 () Bool)

(assert (=> b!1568829 m!1443609))

(declare-fun m!1443611 () Bool)

(assert (=> d!163991 m!1443611))

(declare-fun m!1443613 () Bool)

(assert (=> d!163991 m!1443613))

(assert (=> d!163933 d!163991))

(assert (=> bm!72035 d!163977))

(declare-fun d!163993 () Bool)

(declare-fun res!1071513 () Bool)

(declare-fun e!874602 () Bool)

(assert (=> d!163993 (=> res!1071513 e!874602)))

(assert (=> d!163993 (= res!1071513 (and ((_ is Cons!36658) (toList!11387 lt!673449)) (= (_1!12661 (h!38122 (toList!11387 lt!673449))) (select (arr!50543 _keys!637) from!782))))))

(assert (=> d!163993 (= (containsKey!851 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)) e!874602)))

(declare-fun b!1568833 () Bool)

(declare-fun e!874603 () Bool)

(assert (=> b!1568833 (= e!874602 e!874603)))

(declare-fun res!1071514 () Bool)

(assert (=> b!1568833 (=> (not res!1071514) (not e!874603))))

(assert (=> b!1568833 (= res!1071514 (and (or (not ((_ is Cons!36658) (toList!11387 lt!673449))) (bvsle (_1!12661 (h!38122 (toList!11387 lt!673449))) (select (arr!50543 _keys!637) from!782))) ((_ is Cons!36658) (toList!11387 lt!673449)) (bvslt (_1!12661 (h!38122 (toList!11387 lt!673449))) (select (arr!50543 _keys!637) from!782))))))

(declare-fun b!1568834 () Bool)

(assert (=> b!1568834 (= e!874603 (containsKey!851 (t!51553 (toList!11387 lt!673449)) (select (arr!50543 _keys!637) from!782)))))

(assert (= (and d!163993 (not res!1071513)) b!1568833))

(assert (= (and b!1568833 res!1071514) b!1568834))

(assert (=> b!1568834 m!1443273))

(declare-fun m!1443615 () Bool)

(assert (=> b!1568834 m!1443615))

(assert (=> d!163917 d!163993))

(declare-fun d!163995 () Bool)

(declare-fun e!874604 () Bool)

(assert (=> d!163995 e!874604))

(declare-fun res!1071516 () Bool)

(assert (=> d!163995 (=> (not res!1071516) (not e!874604))))

(declare-fun lt!673600 () ListLongMap!22743)

(assert (=> d!163995 (= res!1071516 (contains!10390 lt!673600 (_1!12661 (tuple2!25301 lt!673519 lt!673523))))))

(declare-fun lt!673601 () List!36662)

(assert (=> d!163995 (= lt!673600 (ListLongMap!22744 lt!673601))))

(declare-fun lt!673598 () Unit!51941)

(declare-fun lt!673599 () Unit!51941)

(assert (=> d!163995 (= lt!673598 lt!673599)))

(assert (=> d!163995 (= (getValueByKey!789 lt!673601 (_1!12661 (tuple2!25301 lt!673519 lt!673523))) (Some!863 (_2!12661 (tuple2!25301 lt!673519 lt!673523))))))

(assert (=> d!163995 (= lt!673599 (lemmaContainsTupThenGetReturnValue!386 lt!673601 (_1!12661 (tuple2!25301 lt!673519 lt!673523)) (_2!12661 (tuple2!25301 lt!673519 lt!673523))))))

(assert (=> d!163995 (= lt!673601 (insertStrictlySorted!578 (toList!11387 lt!673521) (_1!12661 (tuple2!25301 lt!673519 lt!673523)) (_2!12661 (tuple2!25301 lt!673519 lt!673523))))))

(assert (=> d!163995 (= (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)) lt!673600)))

(declare-fun b!1568835 () Bool)

(declare-fun res!1071515 () Bool)

(assert (=> b!1568835 (=> (not res!1071515) (not e!874604))))

(assert (=> b!1568835 (= res!1071515 (= (getValueByKey!789 (toList!11387 lt!673600) (_1!12661 (tuple2!25301 lt!673519 lt!673523))) (Some!863 (_2!12661 (tuple2!25301 lt!673519 lt!673523)))))))

(declare-fun b!1568836 () Bool)

(assert (=> b!1568836 (= e!874604 (contains!10392 (toList!11387 lt!673600) (tuple2!25301 lt!673519 lt!673523)))))

(assert (= (and d!163995 res!1071516) b!1568835))

(assert (= (and b!1568835 res!1071515) b!1568836))

(declare-fun m!1443617 () Bool)

(assert (=> d!163995 m!1443617))

(declare-fun m!1443619 () Bool)

(assert (=> d!163995 m!1443619))

(declare-fun m!1443621 () Bool)

(assert (=> d!163995 m!1443621))

(declare-fun m!1443623 () Bool)

(assert (=> d!163995 m!1443623))

(declare-fun m!1443625 () Bool)

(assert (=> b!1568835 m!1443625))

(declare-fun m!1443627 () Bool)

(assert (=> b!1568836 m!1443627))

(assert (=> b!1568653 d!163995))

(declare-fun d!163997 () Bool)

(declare-fun e!874606 () Bool)

(assert (=> d!163997 e!874606))

(declare-fun res!1071517 () Bool)

(assert (=> d!163997 (=> res!1071517 e!874606)))

(declare-fun lt!673603 () Bool)

(assert (=> d!163997 (= res!1071517 (not lt!673603))))

(declare-fun lt!673605 () Bool)

(assert (=> d!163997 (= lt!673603 lt!673605)))

(declare-fun lt!673604 () Unit!51941)

(declare-fun e!874605 () Unit!51941)

(assert (=> d!163997 (= lt!673604 e!874605)))

(declare-fun c!145172 () Bool)

(assert (=> d!163997 (= c!145172 lt!673605)))

(assert (=> d!163997 (= lt!673605 (containsKey!851 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517))))

(assert (=> d!163997 (= (contains!10390 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)) lt!673517) lt!673603)))

(declare-fun b!1568837 () Bool)

(declare-fun lt!673602 () Unit!51941)

(assert (=> b!1568837 (= e!874605 lt!673602)))

(assert (=> b!1568837 (= lt!673602 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517))))

(assert (=> b!1568837 (isDefined!580 (getValueByKey!789 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517))))

(declare-fun b!1568838 () Bool)

(declare-fun Unit!51953 () Unit!51941)

(assert (=> b!1568838 (= e!874605 Unit!51953)))

(declare-fun b!1568839 () Bool)

(assert (=> b!1568839 (= e!874606 (isDefined!580 (getValueByKey!789 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517)))))

(assert (= (and d!163997 c!145172) b!1568837))

(assert (= (and d!163997 (not c!145172)) b!1568838))

(assert (= (and d!163997 (not res!1071517)) b!1568839))

(declare-fun m!1443629 () Bool)

(assert (=> d!163997 m!1443629))

(declare-fun m!1443631 () Bool)

(assert (=> b!1568837 m!1443631))

(declare-fun m!1443633 () Bool)

(assert (=> b!1568837 m!1443633))

(assert (=> b!1568837 m!1443633))

(declare-fun m!1443635 () Bool)

(assert (=> b!1568837 m!1443635))

(assert (=> b!1568839 m!1443633))

(assert (=> b!1568839 m!1443633))

(assert (=> b!1568839 m!1443635))

(assert (=> b!1568653 d!163997))

(declare-fun d!163999 () Bool)

(declare-fun e!874607 () Bool)

(assert (=> d!163999 e!874607))

(declare-fun res!1071519 () Bool)

(assert (=> d!163999 (=> (not res!1071519) (not e!874607))))

(declare-fun lt!673608 () ListLongMap!22743)

(assert (=> d!163999 (= res!1071519 (contains!10390 lt!673608 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!673609 () List!36662)

(assert (=> d!163999 (= lt!673608 (ListLongMap!22744 lt!673609))))

(declare-fun lt!673606 () Unit!51941)

(declare-fun lt!673607 () Unit!51941)

(assert (=> d!163999 (= lt!673606 lt!673607)))

(assert (=> d!163999 (= (getValueByKey!789 lt!673609 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!863 (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163999 (= lt!673607 (lemmaContainsTupThenGetReturnValue!386 lt!673609 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163999 (= lt!673609 (insertStrictlySorted!578 (toList!11387 call!72038) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163999 (= (+!5123 call!72038 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!673608)))

(declare-fun b!1568840 () Bool)

(declare-fun res!1071518 () Bool)

(assert (=> b!1568840 (=> (not res!1071518) (not e!874607))))

(assert (=> b!1568840 (= res!1071518 (= (getValueByKey!789 (toList!11387 lt!673608) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!863 (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1568841 () Bool)

(assert (=> b!1568841 (= e!874607 (contains!10392 (toList!11387 lt!673608) (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!163999 res!1071519) b!1568840))

(assert (= (and b!1568840 res!1071518) b!1568841))

(declare-fun m!1443637 () Bool)

(assert (=> d!163999 m!1443637))

(declare-fun m!1443639 () Bool)

(assert (=> d!163999 m!1443639))

(declare-fun m!1443641 () Bool)

(assert (=> d!163999 m!1443641))

(declare-fun m!1443643 () Bool)

(assert (=> d!163999 m!1443643))

(declare-fun m!1443645 () Bool)

(assert (=> b!1568840 m!1443645))

(declare-fun m!1443647 () Bool)

(assert (=> b!1568841 m!1443647))

(assert (=> b!1568653 d!163999))

(declare-fun d!164001 () Bool)

(declare-fun c!145173 () Bool)

(assert (=> d!164001 (= c!145173 ((_ is ValueCellFull!18449) (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun e!874608 () V!60153)

(assert (=> d!164001 (= (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!874608)))

(declare-fun b!1568842 () Bool)

(assert (=> b!1568842 (= e!874608 (get!26404 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568843 () Bool)

(assert (=> b!1568843 (= e!874608 (get!26405 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164001 c!145173) b!1568842))

(assert (= (and d!164001 (not c!145173)) b!1568843))

(assert (=> b!1568842 m!1443415))

(assert (=> b!1568842 m!1443267))

(declare-fun m!1443649 () Bool)

(assert (=> b!1568842 m!1443649))

(assert (=> b!1568843 m!1443415))

(assert (=> b!1568843 m!1443267))

(declare-fun m!1443651 () Bool)

(assert (=> b!1568843 m!1443651))

(assert (=> b!1568653 d!164001))

(declare-fun d!164003 () Bool)

(assert (=> d!164003 (not (contains!10390 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)) lt!673517))))

(declare-fun lt!673610 () Unit!51941)

(assert (=> d!164003 (= lt!673610 (choose!2068 lt!673521 lt!673519 lt!673523 lt!673517))))

(declare-fun e!874609 () Bool)

(assert (=> d!164003 e!874609))

(declare-fun res!1071520 () Bool)

(assert (=> d!164003 (=> (not res!1071520) (not e!874609))))

(assert (=> d!164003 (= res!1071520 (not (contains!10390 lt!673521 lt!673517)))))

(assert (=> d!164003 (= (addStillNotContains!574 lt!673521 lt!673519 lt!673523 lt!673517) lt!673610)))

(declare-fun b!1568844 () Bool)

(assert (=> b!1568844 (= e!874609 (not (= lt!673519 lt!673517)))))

(assert (= (and d!164003 res!1071520) b!1568844))

(assert (=> d!164003 m!1443429))

(assert (=> d!164003 m!1443429))

(assert (=> d!164003 m!1443431))

(declare-fun m!1443653 () Bool)

(assert (=> d!164003 m!1443653))

(declare-fun m!1443655 () Bool)

(assert (=> d!164003 m!1443655))

(assert (=> b!1568653 d!164003))

(declare-fun d!164005 () Bool)

(declare-fun e!874611 () Bool)

(assert (=> d!164005 e!874611))

(declare-fun res!1071521 () Bool)

(assert (=> d!164005 (=> res!1071521 e!874611)))

(declare-fun lt!673612 () Bool)

(assert (=> d!164005 (= res!1071521 (not lt!673612))))

(declare-fun lt!673614 () Bool)

(assert (=> d!164005 (= lt!673612 lt!673614)))

(declare-fun lt!673613 () Unit!51941)

(declare-fun e!874610 () Unit!51941)

(assert (=> d!164005 (= lt!673613 e!874610)))

(declare-fun c!145174 () Bool)

(assert (=> d!164005 (= c!145174 lt!673614)))

(assert (=> d!164005 (= lt!673614 (containsKey!851 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!164005 (= (contains!10390 lt!673520 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673612)))

(declare-fun b!1568845 () Bool)

(declare-fun lt!673611 () Unit!51941)

(assert (=> b!1568845 (= e!874610 lt!673611)))

(assert (=> b!1568845 (= lt!673611 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568845 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568846 () Bool)

(declare-fun Unit!51954 () Unit!51941)

(assert (=> b!1568846 (= e!874610 Unit!51954)))

(declare-fun b!1568847 () Bool)

(assert (=> b!1568847 (= e!874611 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164005 c!145174) b!1568845))

(assert (= (and d!164005 (not c!145174)) b!1568846))

(assert (= (and d!164005 (not res!1071521)) b!1568847))

(declare-fun m!1443657 () Bool)

(assert (=> d!164005 m!1443657))

(declare-fun m!1443659 () Bool)

(assert (=> b!1568845 m!1443659))

(declare-fun m!1443661 () Bool)

(assert (=> b!1568845 m!1443661))

(assert (=> b!1568845 m!1443661))

(declare-fun m!1443663 () Bool)

(assert (=> b!1568845 m!1443663))

(assert (=> b!1568847 m!1443661))

(assert (=> b!1568847 m!1443661))

(assert (=> b!1568847 m!1443663))

(assert (=> b!1568654 d!164005))

(declare-fun d!164007 () Bool)

(assert (=> d!164007 (= (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (and (not (= (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1568660 d!164007))

(declare-fun d!164009 () Bool)

(assert (=> d!164009 (= (validKeyInArray!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000)) (and (not (= (select (arr!50543 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50543 _keys!637) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1568686 d!164009))

(declare-fun d!164011 () Bool)

(assert (=> d!164011 (= (get!26405 (select (arr!50544 _values!487) from!782) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568619 d!164011))

(declare-fun d!164013 () Bool)

(assert (=> d!164013 (= (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45090 () Bool)

(assert (= bs!45090 d!164013))

(assert (=> bs!45090 m!1443409))

(declare-fun m!1443665 () Bool)

(assert (=> bs!45090 m!1443665))

(assert (=> b!1568626 d!164013))

(declare-fun b!1568850 () Bool)

(declare-fun e!874613 () Option!864)

(assert (=> b!1568850 (= e!874613 (getValueByKey!789 (t!51553 (toList!11387 lt!673449)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568848 () Bool)

(declare-fun e!874612 () Option!864)

(assert (=> b!1568848 (= e!874612 (Some!863 (_2!12661 (h!38122 (toList!11387 lt!673449)))))))

(declare-fun b!1568851 () Bool)

(assert (=> b!1568851 (= e!874613 None!862)))

(declare-fun d!164015 () Bool)

(declare-fun c!145175 () Bool)

(assert (=> d!164015 (= c!145175 (and ((_ is Cons!36658) (toList!11387 lt!673449)) (= (_1!12661 (h!38122 (toList!11387 lt!673449))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164015 (= (getValueByKey!789 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000) e!874612)))

(declare-fun b!1568849 () Bool)

(assert (=> b!1568849 (= e!874612 e!874613)))

(declare-fun c!145176 () Bool)

(assert (=> b!1568849 (= c!145176 (and ((_ is Cons!36658) (toList!11387 lt!673449)) (not (= (_1!12661 (h!38122 (toList!11387 lt!673449))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!164015 c!145175) b!1568848))

(assert (= (and d!164015 (not c!145175)) b!1568849))

(assert (= (and b!1568849 c!145176) b!1568850))

(assert (= (and b!1568849 (not c!145176)) b!1568851))

(declare-fun m!1443667 () Bool)

(assert (=> b!1568850 m!1443667))

(assert (=> b!1568626 d!164015))

(declare-fun d!164017 () Bool)

(declare-fun isEmpty!1151 (List!36662) Bool)

(assert (=> d!164017 (= (isEmpty!1149 lt!673520) (isEmpty!1151 (toList!11387 lt!673520)))))

(declare-fun bs!45091 () Bool)

(assert (= bs!45091 d!164017))

(declare-fun m!1443669 () Bool)

(assert (=> bs!45091 m!1443669))

(assert (=> b!1568661 d!164017))

(assert (=> b!1568611 d!164009))

(declare-fun d!164019 () Bool)

(declare-fun res!1071522 () Bool)

(declare-fun e!874614 () Bool)

(assert (=> d!164019 (=> res!1071522 e!874614)))

(assert (=> d!164019 (= res!1071522 (and ((_ is Cons!36658) (toList!11387 lt!673449)) (= (_1!12661 (h!38122 (toList!11387 lt!673449))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164019 (= (containsKey!851 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000) e!874614)))

(declare-fun b!1568852 () Bool)

(declare-fun e!874615 () Bool)

(assert (=> b!1568852 (= e!874614 e!874615)))

(declare-fun res!1071523 () Bool)

(assert (=> b!1568852 (=> (not res!1071523) (not e!874615))))

(assert (=> b!1568852 (= res!1071523 (and (or (not ((_ is Cons!36658) (toList!11387 lt!673449))) (bvsle (_1!12661 (h!38122 (toList!11387 lt!673449))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36658) (toList!11387 lt!673449)) (bvslt (_1!12661 (h!38122 (toList!11387 lt!673449))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568853 () Bool)

(assert (=> b!1568853 (= e!874615 (containsKey!851 (t!51553 (toList!11387 lt!673449)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164019 (not res!1071522)) b!1568852))

(assert (= (and b!1568852 res!1071523) b!1568853))

(declare-fun m!1443671 () Bool)

(assert (=> b!1568853 m!1443671))

(assert (=> d!163931 d!164019))

(declare-fun d!164021 () Bool)

(assert (=> d!164021 (= (apply!1120 lt!673520 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26403 (getValueByKey!789 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(declare-fun bs!45092 () Bool)

(assert (= bs!45092 d!164021))

(assert (=> bs!45092 m!1443413))

(assert (=> bs!45092 m!1443577))

(assert (=> bs!45092 m!1443577))

(declare-fun m!1443673 () Bool)

(assert (=> bs!45092 m!1443673))

(assert (=> b!1568658 d!164021))

(assert (=> b!1568658 d!164001))

(declare-fun b!1568854 () Bool)

(declare-fun e!874617 () Bool)

(declare-fun call!72053 () Bool)

(assert (=> b!1568854 (= e!874617 call!72053)))

(declare-fun b!1568855 () Bool)

(declare-fun e!874619 () Bool)

(assert (=> b!1568855 (= e!874619 (contains!10393 (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1568856 () Bool)

(assert (=> b!1568856 (= e!874617 call!72053)))

(declare-fun c!145177 () Bool)

(declare-fun bm!72050 () Bool)

(assert (=> bm!72050 (= call!72053 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!145177 (Cons!36659 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660))))))

(declare-fun d!164023 () Bool)

(declare-fun res!1071526 () Bool)

(declare-fun e!874616 () Bool)

(assert (=> d!164023 (=> res!1071526 e!874616)))

(assert (=> d!164023 (= res!1071526 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(assert (=> d!164023 (= (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)) e!874616)))

(declare-fun b!1568857 () Bool)

(declare-fun e!874618 () Bool)

(assert (=> b!1568857 (= e!874618 e!874617)))

(assert (=> b!1568857 (= c!145177 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1568858 () Bool)

(assert (=> b!1568858 (= e!874616 e!874618)))

(declare-fun res!1071525 () Bool)

(assert (=> b!1568858 (=> (not res!1071525) (not e!874618))))

(assert (=> b!1568858 (= res!1071525 (not e!874619))))

(declare-fun res!1071524 () Bool)

(assert (=> b!1568858 (=> (not res!1071524) (not e!874619))))

(assert (=> b!1568858 (= res!1071524 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!164023 (not res!1071526)) b!1568858))

(assert (= (and b!1568858 res!1071524) b!1568855))

(assert (= (and b!1568858 res!1071525) b!1568857))

(assert (= (and b!1568857 c!145177) b!1568854))

(assert (= (and b!1568857 (not c!145177)) b!1568856))

(assert (= (or b!1568854 b!1568856) bm!72050))

(assert (=> b!1568855 m!1443507))

(assert (=> b!1568855 m!1443507))

(declare-fun m!1443675 () Bool)

(assert (=> b!1568855 m!1443675))

(assert (=> bm!72050 m!1443507))

(declare-fun m!1443677 () Bool)

(assert (=> bm!72050 m!1443677))

(assert (=> b!1568857 m!1443507))

(assert (=> b!1568857 m!1443507))

(assert (=> b!1568857 m!1443515))

(assert (=> b!1568858 m!1443507))

(assert (=> b!1568858 m!1443507))

(assert (=> b!1568858 m!1443515))

(assert (=> bm!72038 d!164023))

(declare-fun d!164025 () Bool)

(assert (=> d!164025 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673615 () Unit!51941)

(assert (=> d!164025 (= lt!673615 (choose!2069 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874620 () Bool)

(assert (=> d!164025 e!874620))

(declare-fun res!1071527 () Bool)

(assert (=> d!164025 (=> (not res!1071527) (not e!874620))))

(assert (=> d!164025 (= res!1071527 (isStrictlySorted!973 (toList!11387 lt!673449)))))

(assert (=> d!164025 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000) lt!673615)))

(declare-fun b!1568859 () Bool)

(assert (=> b!1568859 (= e!874620 (containsKey!851 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164025 res!1071527) b!1568859))

(assert (=> d!164025 m!1443409))

(assert (=> d!164025 m!1443409))

(assert (=> d!164025 m!1443411))

(declare-fun m!1443679 () Bool)

(assert (=> d!164025 m!1443679))

(assert (=> d!164025 m!1443471))

(assert (=> b!1568859 m!1443405))

(assert (=> b!1568624 d!164025))

(assert (=> b!1568624 d!164013))

(assert (=> b!1568624 d!164015))

(assert (=> b!1568659 d!164007))

(assert (=> b!1568685 d!164009))

(declare-fun d!164027 () Bool)

(assert (=> d!164027 (= (get!26404 (select (arr!50544 _values!487) from!782) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!22311 (select (arr!50544 _values!487) from!782)))))

(assert (=> b!1568618 d!164027))

(declare-fun condMapEmpty!59840 () Bool)

(declare-fun mapDefault!59840 () ValueCell!18449)

(assert (=> mapNonEmpty!59839 (= condMapEmpty!59840 (= mapRest!59839 ((as const (Array (_ BitVec 32) ValueCell!18449)) mapDefault!59840)))))

(declare-fun e!874622 () Bool)

(declare-fun mapRes!59840 () Bool)

(assert (=> mapNonEmpty!59839 (= tp!113872 (and e!874622 mapRes!59840))))

(declare-fun b!1568861 () Bool)

(assert (=> b!1568861 (= e!874622 tp_is_empty!38959)))

(declare-fun mapNonEmpty!59840 () Bool)

(declare-fun tp!113873 () Bool)

(declare-fun e!874621 () Bool)

(assert (=> mapNonEmpty!59840 (= mapRes!59840 (and tp!113873 e!874621))))

(declare-fun mapValue!59840 () ValueCell!18449)

(declare-fun mapKey!59840 () (_ BitVec 32))

(declare-fun mapRest!59840 () (Array (_ BitVec 32) ValueCell!18449))

(assert (=> mapNonEmpty!59840 (= mapRest!59839 (store mapRest!59840 mapKey!59840 mapValue!59840))))

(declare-fun b!1568860 () Bool)

(assert (=> b!1568860 (= e!874621 tp_is_empty!38959)))

(declare-fun mapIsEmpty!59840 () Bool)

(assert (=> mapIsEmpty!59840 mapRes!59840))

(assert (= (and mapNonEmpty!59839 condMapEmpty!59840) mapIsEmpty!59840))

(assert (= (and mapNonEmpty!59839 (not condMapEmpty!59840)) mapNonEmpty!59840))

(assert (= (and mapNonEmpty!59840 ((_ is ValueCellFull!18449) mapValue!59840)) b!1568860))

(assert (= (and mapNonEmpty!59839 ((_ is ValueCellFull!18449) mapDefault!59840)) b!1568861))

(declare-fun m!1443681 () Bool)

(assert (=> mapNonEmpty!59840 m!1443681))

(declare-fun b_lambda!25013 () Bool)

(assert (= b_lambda!25011 (or (and start!134374 b_free!32185) b_lambda!25013)))

(declare-fun b_lambda!25015 () Bool)

(assert (= b_lambda!25009 (or (and start!134374 b_free!32185) b_lambda!25015)))

(check-sat (not b!1568741) (not d!163945) (not b!1568859) (not b!1568792) (not b!1568790) (not b!1568855) (not b!1568733) (not d!163973) (not b!1568839) (not b!1568731) (not d!163963) (not d!163961) (not b!1568827) (not b!1568795) (not bm!72039) (not b_lambda!25015) (not d!164013) (not bm!72050) (not b!1568840) (not bm!72049) (not b!1568781) (not b!1568857) (not b!1568843) (not d!163951) (not b_lambda!24999) (not b!1568836) (not b!1568771) (not b_lambda!25013) (not d!164021) (not d!163953) (not b!1568847) (not b!1568834) (not b!1568845) (not d!164025) (not d!164003) (not d!163947) (not b!1568858) (not b!1568853) (not d!163957) (not b!1568832) (not b!1568762) (not b!1568725) (not b!1568779) (not d!163971) (not b!1568735) (not b!1568783) (not b!1568717) (not b!1568719) (not b!1568709) (not b!1568837) (not d!163997) (not b!1568842) (not d!163991) (not b_next!32185) (not b!1568778) (not b!1568714) (not b!1568776) (not b!1568789) (not d!163995) tp_is_empty!38959 (not b!1568841) (not b!1568835) b_and!51831 (not d!163985) (not b!1568829) (not b!1568768) (not b!1568721) (not d!163959) (not d!163967) (not b!1568777) (not b!1568755) (not d!163979) (not b!1568760) (not b!1568850) (not b!1568712) (not d!163999) (not d!164017) (not b!1568802) (not bm!72040) (not b_lambda!25007) (not b!1568801) (not d!163989) (not d!164005) (not b!1568774) (not b!1568773) (not b!1568705) (not d!163981) (not b_lambda!25005) (not b!1568772) (not b!1568723) (not d!163977) (not mapNonEmpty!59840))
(check-sat b_and!51831 (not b_next!32185))
(get-model)

(declare-fun d!164029 () Bool)

(declare-fun res!1071532 () Bool)

(declare-fun e!874627 () Bool)

(assert (=> d!164029 (=> res!1071532 e!874627)))

(assert (=> d!164029 (= res!1071532 (or ((_ is Nil!36659) lt!673597) ((_ is Nil!36659) (t!51553 lt!673597))))))

(assert (=> d!164029 (= (isStrictlySorted!973 lt!673597) e!874627)))

(declare-fun b!1568866 () Bool)

(declare-fun e!874628 () Bool)

(assert (=> b!1568866 (= e!874627 e!874628)))

(declare-fun res!1071533 () Bool)

(assert (=> b!1568866 (=> (not res!1071533) (not e!874628))))

(assert (=> b!1568866 (= res!1071533 (bvslt (_1!12661 (h!38122 lt!673597)) (_1!12661 (h!38122 (t!51553 lt!673597)))))))

(declare-fun b!1568867 () Bool)

(assert (=> b!1568867 (= e!874628 (isStrictlySorted!973 (t!51553 lt!673597)))))

(assert (= (and d!164029 (not res!1071532)) b!1568866))

(assert (= (and b!1568866 res!1071533) b!1568867))

(declare-fun m!1443683 () Bool)

(assert (=> b!1568867 m!1443683))

(assert (=> d!163991 d!164029))

(declare-fun d!164031 () Bool)

(declare-fun res!1071534 () Bool)

(declare-fun e!874629 () Bool)

(assert (=> d!164031 (=> res!1071534 e!874629)))

(assert (=> d!164031 (= res!1071534 (or ((_ is Nil!36659) (toList!11387 lt!673450)) ((_ is Nil!36659) (t!51553 (toList!11387 lt!673450)))))))

(assert (=> d!164031 (= (isStrictlySorted!973 (toList!11387 lt!673450)) e!874629)))

(declare-fun b!1568868 () Bool)

(declare-fun e!874630 () Bool)

(assert (=> b!1568868 (= e!874629 e!874630)))

(declare-fun res!1071535 () Bool)

(assert (=> b!1568868 (=> (not res!1071535) (not e!874630))))

(assert (=> b!1568868 (= res!1071535 (bvslt (_1!12661 (h!38122 (toList!11387 lt!673450))) (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673450))))))))

(declare-fun b!1568869 () Bool)

(assert (=> b!1568869 (= e!874630 (isStrictlySorted!973 (t!51553 (toList!11387 lt!673450))))))

(assert (= (and d!164031 (not res!1071534)) b!1568868))

(assert (= (and b!1568868 res!1071535) b!1568869))

(declare-fun m!1443685 () Bool)

(assert (=> b!1568869 m!1443685))

(assert (=> d!163991 d!164031))

(declare-fun d!164033 () Bool)

(assert (=> d!164033 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673616 () Unit!51941)

(assert (=> d!164033 (= lt!673616 (choose!2069 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874631 () Bool)

(assert (=> d!164033 e!874631))

(declare-fun res!1071536 () Bool)

(assert (=> d!164033 (=> (not res!1071536) (not e!874631))))

(assert (=> d!164033 (= res!1071536 (isStrictlySorted!973 (toList!11387 lt!673520)))))

(assert (=> d!164033 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000) lt!673616)))

(declare-fun b!1568870 () Bool)

(assert (=> b!1568870 (= e!874631 (containsKey!851 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164033 res!1071536) b!1568870))

(assert (=> d!164033 m!1443539))

(assert (=> d!164033 m!1443539))

(assert (=> d!164033 m!1443541))

(declare-fun m!1443687 () Bool)

(assert (=> d!164033 m!1443687))

(declare-fun m!1443689 () Bool)

(assert (=> d!164033 m!1443689))

(assert (=> b!1568870 m!1443535))

(assert (=> b!1568760 d!164033))

(declare-fun d!164035 () Bool)

(assert (=> d!164035 (= (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45093 () Bool)

(assert (= bs!45093 d!164035))

(assert (=> bs!45093 m!1443539))

(declare-fun m!1443691 () Bool)

(assert (=> bs!45093 m!1443691))

(assert (=> b!1568760 d!164035))

(declare-fun b!1568873 () Bool)

(declare-fun e!874633 () Option!864)

(assert (=> b!1568873 (= e!874633 (getValueByKey!789 (t!51553 (toList!11387 lt!673520)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568871 () Bool)

(declare-fun e!874632 () Option!864)

(assert (=> b!1568871 (= e!874632 (Some!863 (_2!12661 (h!38122 (toList!11387 lt!673520)))))))

(declare-fun b!1568874 () Bool)

(assert (=> b!1568874 (= e!874633 None!862)))

(declare-fun d!164037 () Bool)

(declare-fun c!145178 () Bool)

(assert (=> d!164037 (= c!145178 (and ((_ is Cons!36658) (toList!11387 lt!673520)) (= (_1!12661 (h!38122 (toList!11387 lt!673520))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164037 (= (getValueByKey!789 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000) e!874632)))

(declare-fun b!1568872 () Bool)

(assert (=> b!1568872 (= e!874632 e!874633)))

(declare-fun c!145179 () Bool)

(assert (=> b!1568872 (= c!145179 (and ((_ is Cons!36658) (toList!11387 lt!673520)) (not (= (_1!12661 (h!38122 (toList!11387 lt!673520))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!164037 c!145178) b!1568871))

(assert (= (and d!164037 (not c!145178)) b!1568872))

(assert (= (and b!1568872 c!145179) b!1568873))

(assert (= (and b!1568872 (not c!145179)) b!1568874))

(declare-fun m!1443693 () Bool)

(assert (=> b!1568873 m!1443693))

(assert (=> b!1568760 d!164037))

(declare-fun d!164039 () Bool)

(assert (=> d!164039 (= (isDefined!580 (getValueByKey!789 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517)) (not (isEmpty!1150 (getValueByKey!789 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517))))))

(declare-fun bs!45094 () Bool)

(assert (= bs!45094 d!164039))

(assert (=> bs!45094 m!1443633))

(declare-fun m!1443695 () Bool)

(assert (=> bs!45094 m!1443695))

(assert (=> b!1568839 d!164039))

(declare-fun e!874635 () Option!864)

(declare-fun b!1568877 () Bool)

(assert (=> b!1568877 (= e!874635 (getValueByKey!789 (t!51553 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)))) lt!673517))))

(declare-fun b!1568875 () Bool)

(declare-fun e!874634 () Option!864)

(assert (=> b!1568875 (= e!874634 (Some!863 (_2!12661 (h!38122 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)))))))))

(declare-fun b!1568878 () Bool)

(assert (=> b!1568878 (= e!874635 None!862)))

(declare-fun d!164041 () Bool)

(declare-fun c!145180 () Bool)

(assert (=> d!164041 (= c!145180 (and ((_ is Cons!36658) (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)))) (= (_1!12661 (h!38122 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))))) lt!673517)))))

(assert (=> d!164041 (= (getValueByKey!789 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517) e!874634)))

(declare-fun b!1568876 () Bool)

(assert (=> b!1568876 (= e!874634 e!874635)))

(declare-fun c!145181 () Bool)

(assert (=> b!1568876 (= c!145181 (and ((_ is Cons!36658) (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)))) (not (= (_1!12661 (h!38122 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))))) lt!673517))))))

(assert (= (and d!164041 c!145180) b!1568875))

(assert (= (and d!164041 (not c!145180)) b!1568876))

(assert (= (and b!1568876 c!145181) b!1568877))

(assert (= (and b!1568876 (not c!145181)) b!1568878))

(declare-fun m!1443697 () Bool)

(assert (=> b!1568877 m!1443697))

(assert (=> b!1568839 d!164041))

(declare-fun b!1568879 () Bool)

(declare-fun e!874642 () ListLongMap!22743)

(declare-fun call!72054 () ListLongMap!22743)

(assert (=> b!1568879 (= e!874642 call!72054)))

(declare-fun b!1568880 () Bool)

(declare-fun e!874640 () Bool)

(declare-fun e!874636 () Bool)

(assert (=> b!1568880 (= e!874640 e!874636)))

(declare-fun c!145184 () Bool)

(assert (=> b!1568880 (= c!145184 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(declare-fun bm!72051 () Bool)

(assert (=> bm!72051 (= call!72054 (getCurrentListMapNoExtraKeys!6768 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1568881 () Bool)

(declare-fun lt!673618 () Unit!51941)

(declare-fun lt!673622 () Unit!51941)

(assert (=> b!1568881 (= lt!673618 lt!673622)))

(declare-fun lt!673619 () (_ BitVec 64))

(declare-fun lt!673617 () (_ BitVec 64))

(declare-fun lt!673621 () ListLongMap!22743)

(declare-fun lt!673623 () V!60153)

(assert (=> b!1568881 (not (contains!10390 (+!5123 lt!673621 (tuple2!25301 lt!673619 lt!673623)) lt!673617))))

(assert (=> b!1568881 (= lt!673622 (addStillNotContains!574 lt!673621 lt!673619 lt!673623 lt!673617))))

(assert (=> b!1568881 (= lt!673617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1568881 (= lt!673623 (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1568881 (= lt!673619 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1568881 (= lt!673621 call!72054)))

(assert (=> b!1568881 (= e!874642 (+!5123 call!72054 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1568882 () Bool)

(declare-fun res!1071539 () Bool)

(declare-fun e!874637 () Bool)

(assert (=> b!1568882 (=> (not res!1071539) (not e!874637))))

(declare-fun lt!673620 () ListLongMap!22743)

(assert (=> b!1568882 (= res!1071539 (not (contains!10390 lt!673620 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568883 () Bool)

(assert (=> b!1568883 (= e!874636 (= lt!673620 (getCurrentListMapNoExtraKeys!6768 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun b!1568884 () Bool)

(declare-fun e!874641 () Bool)

(assert (=> b!1568884 (= e!874640 e!874641)))

(assert (=> b!1568884 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(declare-fun res!1071540 () Bool)

(assert (=> b!1568884 (= res!1071540 (contains!10390 lt!673620 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1568884 (=> (not res!1071540) (not e!874641))))

(declare-fun b!1568885 () Bool)

(assert (=> b!1568885 (= e!874637 e!874640)))

(declare-fun c!145182 () Bool)

(declare-fun e!874638 () Bool)

(assert (=> b!1568885 (= c!145182 e!874638)))

(declare-fun res!1071538 () Bool)

(assert (=> b!1568885 (=> (not res!1071538) (not e!874638))))

(assert (=> b!1568885 (= res!1071538 (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(declare-fun d!164043 () Bool)

(assert (=> d!164043 e!874637))

(declare-fun res!1071537 () Bool)

(assert (=> d!164043 (=> (not res!1071537) (not e!874637))))

(assert (=> d!164043 (= res!1071537 (not (contains!10390 lt!673620 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!874639 () ListLongMap!22743)

(assert (=> d!164043 (= lt!673620 e!874639)))

(declare-fun c!145185 () Bool)

(assert (=> d!164043 (= c!145185 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(assert (=> d!164043 (validMask!0 mask!947)))

(assert (=> d!164043 (= (getCurrentListMapNoExtraKeys!6768 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!495) lt!673620)))

(declare-fun b!1568886 () Bool)

(assert (=> b!1568886 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(assert (=> b!1568886 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51095 _values!487)))))

(assert (=> b!1568886 (= e!874641 (= (apply!1120 lt!673620 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1568887 () Bool)

(assert (=> b!1568887 (= e!874638 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1568887 (bvsge (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1568888 () Bool)

(assert (=> b!1568888 (= e!874639 e!874642)))

(declare-fun c!145183 () Bool)

(assert (=> b!1568888 (= c!145183 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1568889 () Bool)

(assert (=> b!1568889 (= e!874636 (isEmpty!1149 lt!673620))))

(declare-fun b!1568890 () Bool)

(assert (=> b!1568890 (= e!874639 (ListLongMap!22744 Nil!36659))))

(assert (= (and d!164043 c!145185) b!1568890))

(assert (= (and d!164043 (not c!145185)) b!1568888))

(assert (= (and b!1568888 c!145183) b!1568881))

(assert (= (and b!1568888 (not c!145183)) b!1568879))

(assert (= (or b!1568881 b!1568879) bm!72051))

(assert (= (and d!164043 res!1071537) b!1568882))

(assert (= (and b!1568882 res!1071539) b!1568885))

(assert (= (and b!1568885 res!1071538) b!1568887))

(assert (= (and b!1568885 c!145182) b!1568884))

(assert (= (and b!1568885 (not c!145182)) b!1568880))

(assert (= (and b!1568884 res!1071540) b!1568886))

(assert (= (and b!1568880 c!145184) b!1568883))

(assert (= (and b!1568880 (not c!145184)) b!1568889))

(declare-fun b_lambda!25017 () Bool)

(assert (=> (not b_lambda!25017) (not b!1568881)))

(assert (=> b!1568881 t!51552))

(declare-fun b_and!51833 () Bool)

(assert (= b_and!51831 (and (=> t!51552 result!26589) b_and!51833)))

(declare-fun b_lambda!25019 () Bool)

(assert (=> (not b_lambda!25019) (not b!1568886)))

(assert (=> b!1568886 t!51552))

(declare-fun b_and!51835 () Bool)

(assert (= b_and!51833 (and (=> t!51552 result!26589) b_and!51835)))

(declare-fun m!1443699 () Bool)

(assert (=> b!1568886 m!1443699))

(declare-fun m!1443701 () Bool)

(assert (=> b!1568886 m!1443701))

(assert (=> b!1568886 m!1443267))

(declare-fun m!1443703 () Bool)

(assert (=> b!1568886 m!1443703))

(assert (=> b!1568886 m!1443699))

(declare-fun m!1443705 () Bool)

(assert (=> b!1568886 m!1443705))

(assert (=> b!1568886 m!1443701))

(assert (=> b!1568886 m!1443267))

(assert (=> b!1568888 m!1443699))

(assert (=> b!1568888 m!1443699))

(declare-fun m!1443707 () Bool)

(assert (=> b!1568888 m!1443707))

(declare-fun m!1443709 () Bool)

(assert (=> d!164043 m!1443709))

(assert (=> d!164043 m!1443289))

(assert (=> b!1568884 m!1443699))

(assert (=> b!1568884 m!1443699))

(declare-fun m!1443711 () Bool)

(assert (=> b!1568884 m!1443711))

(declare-fun m!1443713 () Bool)

(assert (=> b!1568881 m!1443713))

(assert (=> b!1568881 m!1443699))

(assert (=> b!1568881 m!1443701))

(assert (=> b!1568881 m!1443267))

(assert (=> b!1568881 m!1443703))

(declare-fun m!1443715 () Bool)

(assert (=> b!1568881 m!1443715))

(declare-fun m!1443717 () Bool)

(assert (=> b!1568881 m!1443717))

(declare-fun m!1443719 () Bool)

(assert (=> b!1568881 m!1443719))

(assert (=> b!1568881 m!1443715))

(assert (=> b!1568881 m!1443701))

(assert (=> b!1568881 m!1443267))

(declare-fun m!1443721 () Bool)

(assert (=> b!1568883 m!1443721))

(assert (=> bm!72051 m!1443721))

(declare-fun m!1443723 () Bool)

(assert (=> b!1568882 m!1443723))

(declare-fun m!1443725 () Bool)

(assert (=> b!1568889 m!1443725))

(assert (=> b!1568887 m!1443699))

(assert (=> b!1568887 m!1443699))

(assert (=> b!1568887 m!1443707))

(assert (=> b!1568773 d!164043))

(declare-fun d!164045 () Bool)

(declare-fun res!1071541 () Bool)

(declare-fun e!874643 () Bool)

(assert (=> d!164045 (=> res!1071541 e!874643)))

(assert (=> d!164045 (= res!1071541 (and ((_ is Cons!36658) lt!673597) (= (_1!12661 (h!38122 lt!673597)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (=> d!164045 (= (containsKey!851 lt!673597 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) e!874643)))

(declare-fun b!1568891 () Bool)

(declare-fun e!874644 () Bool)

(assert (=> b!1568891 (= e!874643 e!874644)))

(declare-fun res!1071542 () Bool)

(assert (=> b!1568891 (=> (not res!1071542) (not e!874644))))

(assert (=> b!1568891 (= res!1071542 (and (or (not ((_ is Cons!36658) lt!673597)) (bvsle (_1!12661 (h!38122 lt!673597)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) ((_ is Cons!36658) lt!673597) (bvslt (_1!12661 (h!38122 lt!673597)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun b!1568892 () Bool)

(assert (=> b!1568892 (= e!874644 (containsKey!851 (t!51553 lt!673597) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(assert (= (and d!164045 (not res!1071541)) b!1568891))

(assert (= (and b!1568891 res!1071542) b!1568892))

(declare-fun m!1443727 () Bool)

(assert (=> b!1568892 m!1443727))

(assert (=> b!1568832 d!164045))

(declare-fun d!164047 () Bool)

(assert (=> d!164047 (= (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782))) (not ((_ is Some!863) (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)))))))

(assert (=> d!163947 d!164047))

(declare-fun d!164049 () Bool)

(declare-fun res!1071543 () Bool)

(declare-fun e!874645 () Bool)

(assert (=> d!164049 (=> res!1071543 e!874645)))

(assert (=> d!164049 (= res!1071543 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) (select (arr!50543 _keys!637) from!782))))))

(assert (=> d!164049 (= (containsKey!851 (t!51553 (toList!11387 lt!673449)) (select (arr!50543 _keys!637) from!782)) e!874645)))

(declare-fun b!1568893 () Bool)

(declare-fun e!874646 () Bool)

(assert (=> b!1568893 (= e!874645 e!874646)))

(declare-fun res!1071544 () Bool)

(assert (=> b!1568893 (=> (not res!1071544) (not e!874646))))

(assert (=> b!1568893 (= res!1071544 (and (or (not ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449)))) (bvsle (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) (select (arr!50543 _keys!637) from!782))) ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (bvslt (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) (select (arr!50543 _keys!637) from!782))))))

(declare-fun b!1568894 () Bool)

(assert (=> b!1568894 (= e!874646 (containsKey!851 (t!51553 (t!51553 (toList!11387 lt!673449))) (select (arr!50543 _keys!637) from!782)))))

(assert (= (and d!164049 (not res!1071543)) b!1568893))

(assert (= (and b!1568893 res!1071544) b!1568894))

(assert (=> b!1568894 m!1443273))

(declare-fun m!1443729 () Bool)

(assert (=> b!1568894 m!1443729))

(assert (=> b!1568834 d!164049))

(assert (=> b!1568762 d!164035))

(assert (=> b!1568762 d!164037))

(declare-fun d!164051 () Bool)

(declare-fun e!874648 () Bool)

(assert (=> d!164051 e!874648))

(declare-fun res!1071545 () Bool)

(assert (=> d!164051 (=> res!1071545 e!874648)))

(declare-fun lt!673625 () Bool)

(assert (=> d!164051 (= res!1071545 (not lt!673625))))

(declare-fun lt!673627 () Bool)

(assert (=> d!164051 (= lt!673625 lt!673627)))

(declare-fun lt!673626 () Unit!51941)

(declare-fun e!874647 () Unit!51941)

(assert (=> d!164051 (= lt!673626 e!874647)))

(declare-fun c!145186 () Bool)

(assert (=> d!164051 (= c!145186 lt!673627)))

(assert (=> d!164051 (= lt!673627 (containsKey!851 (toList!11387 (+!5123 lt!673578 (tuple2!25301 lt!673576 lt!673580))) lt!673574))))

(assert (=> d!164051 (= (contains!10390 (+!5123 lt!673578 (tuple2!25301 lt!673576 lt!673580)) lt!673574) lt!673625)))

(declare-fun b!1568895 () Bool)

(declare-fun lt!673624 () Unit!51941)

(assert (=> b!1568895 (= e!874647 lt!673624)))

(assert (=> b!1568895 (= lt!673624 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 (+!5123 lt!673578 (tuple2!25301 lt!673576 lt!673580))) lt!673574))))

(assert (=> b!1568895 (isDefined!580 (getValueByKey!789 (toList!11387 (+!5123 lt!673578 (tuple2!25301 lt!673576 lt!673580))) lt!673574))))

(declare-fun b!1568896 () Bool)

(declare-fun Unit!51955 () Unit!51941)

(assert (=> b!1568896 (= e!874647 Unit!51955)))

(declare-fun b!1568897 () Bool)

(assert (=> b!1568897 (= e!874648 (isDefined!580 (getValueByKey!789 (toList!11387 (+!5123 lt!673578 (tuple2!25301 lt!673576 lt!673580))) lt!673574)))))

(assert (= (and d!164051 c!145186) b!1568895))

(assert (= (and d!164051 (not c!145186)) b!1568896))

(assert (= (and d!164051 (not res!1071545)) b!1568897))

(declare-fun m!1443731 () Bool)

(assert (=> d!164051 m!1443731))

(declare-fun m!1443733 () Bool)

(assert (=> b!1568895 m!1443733))

(declare-fun m!1443735 () Bool)

(assert (=> b!1568895 m!1443735))

(assert (=> b!1568895 m!1443735))

(declare-fun m!1443737 () Bool)

(assert (=> b!1568895 m!1443737))

(assert (=> b!1568897 m!1443735))

(assert (=> b!1568897 m!1443735))

(assert (=> b!1568897 m!1443737))

(assert (=> b!1568771 d!164051))

(declare-fun d!164053 () Bool)

(declare-fun e!874649 () Bool)

(assert (=> d!164053 e!874649))

(declare-fun res!1071547 () Bool)

(assert (=> d!164053 (=> (not res!1071547) (not e!874649))))

(declare-fun lt!673630 () ListLongMap!22743)

(assert (=> d!164053 (= res!1071547 (contains!10390 lt!673630 (_1!12661 (tuple2!25301 lt!673576 lt!673580))))))

(declare-fun lt!673631 () List!36662)

(assert (=> d!164053 (= lt!673630 (ListLongMap!22744 lt!673631))))

(declare-fun lt!673628 () Unit!51941)

(declare-fun lt!673629 () Unit!51941)

(assert (=> d!164053 (= lt!673628 lt!673629)))

(assert (=> d!164053 (= (getValueByKey!789 lt!673631 (_1!12661 (tuple2!25301 lt!673576 lt!673580))) (Some!863 (_2!12661 (tuple2!25301 lt!673576 lt!673580))))))

(assert (=> d!164053 (= lt!673629 (lemmaContainsTupThenGetReturnValue!386 lt!673631 (_1!12661 (tuple2!25301 lt!673576 lt!673580)) (_2!12661 (tuple2!25301 lt!673576 lt!673580))))))

(assert (=> d!164053 (= lt!673631 (insertStrictlySorted!578 (toList!11387 lt!673578) (_1!12661 (tuple2!25301 lt!673576 lt!673580)) (_2!12661 (tuple2!25301 lt!673576 lt!673580))))))

(assert (=> d!164053 (= (+!5123 lt!673578 (tuple2!25301 lt!673576 lt!673580)) lt!673630)))

(declare-fun b!1568898 () Bool)

(declare-fun res!1071546 () Bool)

(assert (=> b!1568898 (=> (not res!1071546) (not e!874649))))

(assert (=> b!1568898 (= res!1071546 (= (getValueByKey!789 (toList!11387 lt!673630) (_1!12661 (tuple2!25301 lt!673576 lt!673580))) (Some!863 (_2!12661 (tuple2!25301 lt!673576 lt!673580)))))))

(declare-fun b!1568899 () Bool)

(assert (=> b!1568899 (= e!874649 (contains!10392 (toList!11387 lt!673630) (tuple2!25301 lt!673576 lt!673580)))))

(assert (= (and d!164053 res!1071547) b!1568898))

(assert (= (and b!1568898 res!1071546) b!1568899))

(declare-fun m!1443739 () Bool)

(assert (=> d!164053 m!1443739))

(declare-fun m!1443741 () Bool)

(assert (=> d!164053 m!1443741))

(declare-fun m!1443743 () Bool)

(assert (=> d!164053 m!1443743))

(declare-fun m!1443745 () Bool)

(assert (=> d!164053 m!1443745))

(declare-fun m!1443747 () Bool)

(assert (=> b!1568898 m!1443747))

(declare-fun m!1443749 () Bool)

(assert (=> b!1568899 m!1443749))

(assert (=> b!1568771 d!164053))

(declare-fun d!164055 () Bool)

(declare-fun e!874650 () Bool)

(assert (=> d!164055 e!874650))

(declare-fun res!1071549 () Bool)

(assert (=> d!164055 (=> (not res!1071549) (not e!874650))))

(declare-fun lt!673634 () ListLongMap!22743)

(assert (=> d!164055 (= res!1071549 (contains!10390 lt!673634 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!673635 () List!36662)

(assert (=> d!164055 (= lt!673634 (ListLongMap!22744 lt!673635))))

(declare-fun lt!673632 () Unit!51941)

(declare-fun lt!673633 () Unit!51941)

(assert (=> d!164055 (= lt!673632 lt!673633)))

(assert (=> d!164055 (= (getValueByKey!789 lt!673635 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!863 (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!164055 (= lt!673633 (lemmaContainsTupThenGetReturnValue!386 lt!673635 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!164055 (= lt!673635 (insertStrictlySorted!578 (toList!11387 call!72043) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!164055 (= (+!5123 call!72043 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!673634)))

(declare-fun b!1568900 () Bool)

(declare-fun res!1071548 () Bool)

(assert (=> b!1568900 (=> (not res!1071548) (not e!874650))))

(assert (=> b!1568900 (= res!1071548 (= (getValueByKey!789 (toList!11387 lt!673634) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!863 (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1568901 () Bool)

(assert (=> b!1568901 (= e!874650 (contains!10392 (toList!11387 lt!673634) (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!164055 res!1071549) b!1568900))

(assert (= (and b!1568900 res!1071548) b!1568901))

(declare-fun m!1443751 () Bool)

(assert (=> d!164055 m!1443751))

(declare-fun m!1443753 () Bool)

(assert (=> d!164055 m!1443753))

(declare-fun m!1443755 () Bool)

(assert (=> d!164055 m!1443755))

(declare-fun m!1443757 () Bool)

(assert (=> d!164055 m!1443757))

(declare-fun m!1443759 () Bool)

(assert (=> b!1568900 m!1443759))

(declare-fun m!1443761 () Bool)

(assert (=> b!1568901 m!1443761))

(assert (=> b!1568771 d!164055))

(declare-fun d!164057 () Bool)

(assert (=> d!164057 (not (contains!10390 (+!5123 lt!673578 (tuple2!25301 lt!673576 lt!673580)) lt!673574))))

(declare-fun lt!673636 () Unit!51941)

(assert (=> d!164057 (= lt!673636 (choose!2068 lt!673578 lt!673576 lt!673580 lt!673574))))

(declare-fun e!874651 () Bool)

(assert (=> d!164057 e!874651))

(declare-fun res!1071550 () Bool)

(assert (=> d!164057 (=> (not res!1071550) (not e!874651))))

(assert (=> d!164057 (= res!1071550 (not (contains!10390 lt!673578 lt!673574)))))

(assert (=> d!164057 (= (addStillNotContains!574 lt!673578 lt!673576 lt!673580 lt!673574) lt!673636)))

(declare-fun b!1568902 () Bool)

(assert (=> b!1568902 (= e!874651 (not (= lt!673576 lt!673574)))))

(assert (= (and d!164057 res!1071550) b!1568902))

(assert (=> d!164057 m!1443561))

(assert (=> d!164057 m!1443561))

(assert (=> d!164057 m!1443563))

(declare-fun m!1443763 () Bool)

(assert (=> d!164057 m!1443763))

(declare-fun m!1443765 () Bool)

(assert (=> d!164057 m!1443765))

(assert (=> b!1568771 d!164057))

(declare-fun d!164059 () Bool)

(declare-fun c!145187 () Bool)

(assert (=> d!164059 (= c!145187 ((_ is ValueCellFull!18449) (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(declare-fun e!874652 () V!60153)

(assert (=> d!164059 (= (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!874652)))

(declare-fun b!1568903 () Bool)

(assert (=> b!1568903 (= e!874652 (get!26404 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568904 () Bool)

(assert (=> b!1568904 (= e!874652 (get!26405 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164059 c!145187) b!1568903))

(assert (= (and d!164059 (not c!145187)) b!1568904))

(assert (=> b!1568903 m!1443547))

(assert (=> b!1568903 m!1443267))

(declare-fun m!1443767 () Bool)

(assert (=> b!1568903 m!1443767))

(assert (=> b!1568904 m!1443547))

(assert (=> b!1568904 m!1443267))

(declare-fun m!1443769 () Bool)

(assert (=> b!1568904 m!1443769))

(assert (=> b!1568771 d!164059))

(declare-fun b!1568907 () Bool)

(declare-fun e!874654 () Option!864)

(assert (=> b!1568907 (= e!874654 (getValueByKey!789 (t!51553 (t!51553 lt!673539)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun b!1568905 () Bool)

(declare-fun e!874653 () Option!864)

(assert (=> b!1568905 (= e!874653 (Some!863 (_2!12661 (h!38122 (t!51553 lt!673539)))))))

(declare-fun b!1568908 () Bool)

(assert (=> b!1568908 (= e!874654 None!862)))

(declare-fun c!145188 () Bool)

(declare-fun d!164061 () Bool)

(assert (=> d!164061 (= c!145188 (and ((_ is Cons!36658) (t!51553 lt!673539)) (= (_1!12661 (h!38122 (t!51553 lt!673539))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (=> d!164061 (= (getValueByKey!789 (t!51553 lt!673539) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) e!874653)))

(declare-fun b!1568906 () Bool)

(assert (=> b!1568906 (= e!874653 e!874654)))

(declare-fun c!145189 () Bool)

(assert (=> b!1568906 (= c!145189 (and ((_ is Cons!36658) (t!51553 lt!673539)) (not (= (_1!12661 (h!38122 (t!51553 lt!673539))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))))

(assert (= (and d!164061 c!145188) b!1568905))

(assert (= (and d!164061 (not c!145188)) b!1568906))

(assert (= (and b!1568906 c!145189) b!1568907))

(assert (= (and b!1568906 (not c!145189)) b!1568908))

(declare-fun m!1443771 () Bool)

(assert (=> b!1568907 m!1443771))

(assert (=> b!1568795 d!164061))

(declare-fun d!164063 () Bool)

(declare-fun res!1071551 () Bool)

(declare-fun e!874655 () Bool)

(assert (=> d!164063 (=> res!1071551 e!874655)))

(assert (=> d!164063 (= res!1071551 (= (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!673493))))

(assert (=> d!164063 (= (arrayContainsKey!0 _keys!637 lt!673493 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!874655)))

(declare-fun b!1568909 () Bool)

(declare-fun e!874656 () Bool)

(assert (=> b!1568909 (= e!874655 e!874656)))

(declare-fun res!1071552 () Bool)

(assert (=> b!1568909 (=> (not res!1071552) (not e!874656))))

(assert (=> b!1568909 (= res!1071552 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(declare-fun b!1568910 () Bool)

(assert (=> b!1568910 (= e!874656 (arrayContainsKey!0 _keys!637 lt!673493 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!164063 (not res!1071551)) b!1568909))

(assert (= (and b!1568909 res!1071552) b!1568910))

(assert (=> d!164063 m!1443507))

(declare-fun m!1443773 () Bool)

(assert (=> b!1568910 m!1443773))

(assert (=> b!1568741 d!164063))

(declare-fun d!164065 () Bool)

(declare-fun res!1071553 () Bool)

(declare-fun e!874657 () Bool)

(assert (=> d!164065 (=> res!1071553 e!874657)))

(assert (=> d!164065 (= res!1071553 (and ((_ is Cons!36658) (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)))) (= (_1!12661 (h!38122 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))))) lt!673517)))))

(assert (=> d!164065 (= (containsKey!851 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517) e!874657)))

(declare-fun b!1568911 () Bool)

(declare-fun e!874658 () Bool)

(assert (=> b!1568911 (= e!874657 e!874658)))

(declare-fun res!1071554 () Bool)

(assert (=> b!1568911 (=> (not res!1071554) (not e!874658))))

(assert (=> b!1568911 (= res!1071554 (and (or (not ((_ is Cons!36658) (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))))) (bvsle (_1!12661 (h!38122 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))))) lt!673517)) ((_ is Cons!36658) (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)))) (bvslt (_1!12661 (h!38122 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))))) lt!673517)))))

(declare-fun b!1568912 () Bool)

(assert (=> b!1568912 (= e!874658 (containsKey!851 (t!51553 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)))) lt!673517))))

(assert (= (and d!164065 (not res!1071553)) b!1568911))

(assert (= (and b!1568911 res!1071554) b!1568912))

(declare-fun m!1443775 () Bool)

(assert (=> b!1568912 m!1443775))

(assert (=> d!163997 d!164065))

(declare-fun d!164067 () Bool)

(declare-fun e!874660 () Bool)

(assert (=> d!164067 e!874660))

(declare-fun res!1071555 () Bool)

(assert (=> d!164067 (=> res!1071555 e!874660)))

(declare-fun lt!673638 () Bool)

(assert (=> d!164067 (= res!1071555 (not lt!673638))))

(declare-fun lt!673640 () Bool)

(assert (=> d!164067 (= lt!673638 lt!673640)))

(declare-fun lt!673639 () Unit!51941)

(declare-fun e!874659 () Unit!51941)

(assert (=> d!164067 (= lt!673639 e!874659)))

(declare-fun c!145190 () Bool)

(assert (=> d!164067 (= c!145190 lt!673640)))

(assert (=> d!164067 (= lt!673640 (containsKey!851 (toList!11387 lt!673608) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!164067 (= (contains!10390 lt!673608 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!673638)))

(declare-fun b!1568913 () Bool)

(declare-fun lt!673637 () Unit!51941)

(assert (=> b!1568913 (= e!874659 lt!673637)))

(assert (=> b!1568913 (= lt!673637 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673608) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1568913 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673608) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1568914 () Bool)

(declare-fun Unit!51956 () Unit!51941)

(assert (=> b!1568914 (= e!874659 Unit!51956)))

(declare-fun b!1568915 () Bool)

(assert (=> b!1568915 (= e!874660 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673608) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!164067 c!145190) b!1568913))

(assert (= (and d!164067 (not c!145190)) b!1568914))

(assert (= (and d!164067 (not res!1071555)) b!1568915))

(declare-fun m!1443777 () Bool)

(assert (=> d!164067 m!1443777))

(declare-fun m!1443779 () Bool)

(assert (=> b!1568913 m!1443779))

(assert (=> b!1568913 m!1443645))

(assert (=> b!1568913 m!1443645))

(declare-fun m!1443781 () Bool)

(assert (=> b!1568913 m!1443781))

(assert (=> b!1568915 m!1443645))

(assert (=> b!1568915 m!1443645))

(assert (=> b!1568915 m!1443781))

(assert (=> d!163999 d!164067))

(declare-fun b!1568918 () Bool)

(declare-fun e!874662 () Option!864)

(assert (=> b!1568918 (= e!874662 (getValueByKey!789 (t!51553 lt!673609) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1568916 () Bool)

(declare-fun e!874661 () Option!864)

(assert (=> b!1568916 (= e!874661 (Some!863 (_2!12661 (h!38122 lt!673609))))))

(declare-fun b!1568919 () Bool)

(assert (=> b!1568919 (= e!874662 None!862)))

(declare-fun c!145191 () Bool)

(declare-fun d!164069 () Bool)

(assert (=> d!164069 (= c!145191 (and ((_ is Cons!36658) lt!673609) (= (_1!12661 (h!38122 lt!673609)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!164069 (= (getValueByKey!789 lt!673609 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!874661)))

(declare-fun b!1568917 () Bool)

(assert (=> b!1568917 (= e!874661 e!874662)))

(declare-fun c!145192 () Bool)

(assert (=> b!1568917 (= c!145192 (and ((_ is Cons!36658) lt!673609) (not (= (_1!12661 (h!38122 lt!673609)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!164069 c!145191) b!1568916))

(assert (= (and d!164069 (not c!145191)) b!1568917))

(assert (= (and b!1568917 c!145192) b!1568918))

(assert (= (and b!1568917 (not c!145192)) b!1568919))

(declare-fun m!1443783 () Bool)

(assert (=> b!1568918 m!1443783))

(assert (=> d!163999 d!164069))

(declare-fun d!164071 () Bool)

(assert (=> d!164071 (= (getValueByKey!789 lt!673609 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!863 (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!673641 () Unit!51941)

(assert (=> d!164071 (= lt!673641 (choose!2070 lt!673609 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!874663 () Bool)

(assert (=> d!164071 e!874663))

(declare-fun res!1071556 () Bool)

(assert (=> d!164071 (=> (not res!1071556) (not e!874663))))

(assert (=> d!164071 (= res!1071556 (isStrictlySorted!973 lt!673609))))

(assert (=> d!164071 (= (lemmaContainsTupThenGetReturnValue!386 lt!673609 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!673641)))

(declare-fun b!1568920 () Bool)

(declare-fun res!1071557 () Bool)

(assert (=> b!1568920 (=> (not res!1071557) (not e!874663))))

(assert (=> b!1568920 (= res!1071557 (containsKey!851 lt!673609 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1568921 () Bool)

(assert (=> b!1568921 (= e!874663 (contains!10392 lt!673609 (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!164071 res!1071556) b!1568920))

(assert (= (and b!1568920 res!1071557) b!1568921))

(assert (=> d!164071 m!1443639))

(declare-fun m!1443785 () Bool)

(assert (=> d!164071 m!1443785))

(declare-fun m!1443787 () Bool)

(assert (=> d!164071 m!1443787))

(declare-fun m!1443789 () Bool)

(assert (=> b!1568920 m!1443789))

(declare-fun m!1443791 () Bool)

(assert (=> b!1568921 m!1443791))

(assert (=> d!163999 d!164071))

(declare-fun bm!72052 () Bool)

(declare-fun call!72056 () List!36662)

(declare-fun call!72057 () List!36662)

(assert (=> bm!72052 (= call!72056 call!72057)))

(declare-fun bm!72053 () Bool)

(declare-fun call!72055 () List!36662)

(assert (=> bm!72053 (= call!72055 call!72056)))

(declare-fun b!1568922 () Bool)

(declare-fun e!874665 () List!36662)

(assert (=> b!1568922 (= e!874665 call!72056)))

(declare-fun d!164073 () Bool)

(declare-fun e!874664 () Bool)

(assert (=> d!164073 e!874664))

(declare-fun res!1071559 () Bool)

(assert (=> d!164073 (=> (not res!1071559) (not e!874664))))

(declare-fun lt!673642 () List!36662)

(assert (=> d!164073 (= res!1071559 (isStrictlySorted!973 lt!673642))))

(declare-fun e!874668 () List!36662)

(assert (=> d!164073 (= lt!673642 e!874668)))

(declare-fun c!145193 () Bool)

(assert (=> d!164073 (= c!145193 (and ((_ is Cons!36658) (toList!11387 call!72038)) (bvslt (_1!12661 (h!38122 (toList!11387 call!72038))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!164073 (isStrictlySorted!973 (toList!11387 call!72038))))

(assert (=> d!164073 (= (insertStrictlySorted!578 (toList!11387 call!72038) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!673642)))

(declare-fun b!1568923 () Bool)

(declare-fun c!145196 () Bool)

(assert (=> b!1568923 (= c!145196 (and ((_ is Cons!36658) (toList!11387 call!72038)) (bvsgt (_1!12661 (h!38122 (toList!11387 call!72038))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!874667 () List!36662)

(assert (=> b!1568923 (= e!874665 e!874667)))

(declare-fun b!1568924 () Bool)

(assert (=> b!1568924 (= e!874668 e!874665)))

(declare-fun c!145195 () Bool)

(assert (=> b!1568924 (= c!145195 (and ((_ is Cons!36658) (toList!11387 call!72038)) (= (_1!12661 (h!38122 (toList!11387 call!72038))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1568925 () Bool)

(declare-fun e!874666 () List!36662)

(assert (=> b!1568925 (= e!874666 (ite c!145195 (t!51553 (toList!11387 call!72038)) (ite c!145196 (Cons!36658 (h!38122 (toList!11387 call!72038)) (t!51553 (toList!11387 call!72038))) Nil!36659)))))

(declare-fun b!1568926 () Bool)

(assert (=> b!1568926 (= e!874664 (contains!10392 lt!673642 (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1568927 () Bool)

(assert (=> b!1568927 (= e!874667 call!72055)))

(declare-fun b!1568928 () Bool)

(assert (=> b!1568928 (= e!874666 (insertStrictlySorted!578 (t!51553 (toList!11387 call!72038)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1568929 () Bool)

(assert (=> b!1568929 (= e!874667 call!72055)))

(declare-fun b!1568930 () Bool)

(assert (=> b!1568930 (= e!874668 call!72057)))

(declare-fun b!1568931 () Bool)

(declare-fun res!1071558 () Bool)

(assert (=> b!1568931 (=> (not res!1071558) (not e!874664))))

(assert (=> b!1568931 (= res!1071558 (containsKey!851 lt!673642 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!72054 () Bool)

(assert (=> bm!72054 (= call!72057 ($colon$colon!984 e!874666 (ite c!145193 (h!38122 (toList!11387 call!72038)) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!145194 () Bool)

(assert (=> bm!72054 (= c!145194 c!145193)))

(assert (= (and d!164073 c!145193) b!1568930))

(assert (= (and d!164073 (not c!145193)) b!1568924))

(assert (= (and b!1568924 c!145195) b!1568922))

(assert (= (and b!1568924 (not c!145195)) b!1568923))

(assert (= (and b!1568923 c!145196) b!1568929))

(assert (= (and b!1568923 (not c!145196)) b!1568927))

(assert (= (or b!1568929 b!1568927) bm!72053))

(assert (= (or b!1568922 bm!72053) bm!72052))

(assert (= (or b!1568930 bm!72052) bm!72054))

(assert (= (and bm!72054 c!145194) b!1568928))

(assert (= (and bm!72054 (not c!145194)) b!1568925))

(assert (= (and d!164073 res!1071559) b!1568931))

(assert (= (and b!1568931 res!1071558) b!1568926))

(declare-fun m!1443793 () Bool)

(assert (=> b!1568926 m!1443793))

(declare-fun m!1443795 () Bool)

(assert (=> bm!72054 m!1443795))

(declare-fun m!1443797 () Bool)

(assert (=> b!1568931 m!1443797))

(declare-fun m!1443799 () Bool)

(assert (=> b!1568928 m!1443799))

(declare-fun m!1443801 () Bool)

(assert (=> d!164073 m!1443801))

(declare-fun m!1443803 () Bool)

(assert (=> d!164073 m!1443803))

(assert (=> d!163999 d!164073))

(declare-fun d!164075 () Bool)

(assert (=> d!164075 (= (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1568857 d!164075))

(declare-fun b!1568950 () Bool)

(declare-fun lt!673648 () SeekEntryResult!13474)

(assert (=> b!1568950 (and (bvsge (index!56296 lt!673648) #b00000000000000000000000000000000) (bvslt (index!56296 lt!673648) (size!51094 _keys!637)))))

(declare-fun res!1071567 () Bool)

(assert (=> b!1568950 (= res!1071567 (= (select (arr!50543 _keys!637) (index!56296 lt!673648)) (select (arr!50543 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun e!874681 () Bool)

(assert (=> b!1568950 (=> res!1071567 e!874681)))

(declare-fun e!874683 () Bool)

(assert (=> b!1568950 (= e!874683 e!874681)))

(declare-fun b!1568951 () Bool)

(assert (=> b!1568951 (and (bvsge (index!56296 lt!673648) #b00000000000000000000000000000000) (bvslt (index!56296 lt!673648) (size!51094 _keys!637)))))

(declare-fun res!1071568 () Bool)

(assert (=> b!1568951 (= res!1071568 (= (select (arr!50543 _keys!637) (index!56296 lt!673648)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568951 (=> res!1071568 e!874681)))

(declare-fun b!1568952 () Bool)

(declare-fun e!874682 () SeekEntryResult!13474)

(assert (=> b!1568952 (= e!874682 (Intermediate!13474 false (toIndex!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) mask!947) #b00000000000000000000000000000000))))

(declare-fun b!1568953 () Bool)

(declare-fun e!874679 () Bool)

(assert (=> b!1568953 (= e!874679 (bvsge (x!140746 lt!673648) #b01111111111111111111111111111110))))

(declare-fun b!1568954 () Bool)

(declare-fun e!874680 () SeekEntryResult!13474)

(assert (=> b!1568954 (= e!874680 e!874682)))

(declare-fun c!145203 () Bool)

(declare-fun lt!673647 () (_ BitVec 64))

(assert (=> b!1568954 (= c!145203 (or (= lt!673647 (select (arr!50543 _keys!637) #b00000000000000000000000000000000)) (= (bvadd lt!673647 lt!673647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568955 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1568955 (= e!874682 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) mask!947) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!947) (select (arr!50543 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(declare-fun b!1568956 () Bool)

(assert (=> b!1568956 (and (bvsge (index!56296 lt!673648) #b00000000000000000000000000000000) (bvslt (index!56296 lt!673648) (size!51094 _keys!637)))))

(assert (=> b!1568956 (= e!874681 (= (select (arr!50543 _keys!637) (index!56296 lt!673648)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!164077 () Bool)

(assert (=> d!164077 e!874679))

(declare-fun c!145205 () Bool)

(assert (=> d!164077 (= c!145205 (and ((_ is Intermediate!13474) lt!673648) (undefined!14286 lt!673648)))))

(assert (=> d!164077 (= lt!673648 e!874680)))

(declare-fun c!145204 () Bool)

(assert (=> d!164077 (= c!145204 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164077 (= lt!673647 (select (arr!50543 _keys!637) (toIndex!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) mask!947)))))

(assert (=> d!164077 (validMask!0 mask!947)))

(assert (=> d!164077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) mask!947) (select (arr!50543 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!673648)))

(declare-fun b!1568957 () Bool)

(assert (=> b!1568957 (= e!874679 e!874683)))

(declare-fun res!1071566 () Bool)

(assert (=> b!1568957 (= res!1071566 (and ((_ is Intermediate!13474) lt!673648) (not (undefined!14286 lt!673648)) (bvslt (x!140746 lt!673648) #b01111111111111111111111111111110) (bvsge (x!140746 lt!673648) #b00000000000000000000000000000000) (bvsge (x!140746 lt!673648) #b00000000000000000000000000000000)))))

(assert (=> b!1568957 (=> (not res!1071566) (not e!874683))))

(declare-fun b!1568958 () Bool)

(assert (=> b!1568958 (= e!874680 (Intermediate!13474 true (toIndex!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) mask!947) #b00000000000000000000000000000000))))

(assert (= (and d!164077 c!145204) b!1568958))

(assert (= (and d!164077 (not c!145204)) b!1568954))

(assert (= (and b!1568954 c!145203) b!1568952))

(assert (= (and b!1568954 (not c!145203)) b!1568955))

(assert (= (and d!164077 c!145205) b!1568953))

(assert (= (and d!164077 (not c!145205)) b!1568957))

(assert (= (and b!1568957 res!1071566) b!1568950))

(assert (= (and b!1568950 (not res!1071567)) b!1568951))

(assert (= (and b!1568951 (not res!1071568)) b!1568956))

(assert (=> d!164077 m!1443525))

(declare-fun m!1443805 () Bool)

(assert (=> d!164077 m!1443805))

(assert (=> d!164077 m!1443289))

(declare-fun m!1443807 () Bool)

(assert (=> b!1568951 m!1443807))

(assert (=> b!1568956 m!1443807))

(assert (=> b!1568950 m!1443807))

(assert (=> b!1568955 m!1443525))

(declare-fun m!1443809 () Bool)

(assert (=> b!1568955 m!1443809))

(assert (=> b!1568955 m!1443809))

(assert (=> b!1568955 m!1443383))

(declare-fun m!1443811 () Bool)

(assert (=> b!1568955 m!1443811))

(assert (=> d!163971 d!164077))

(declare-fun d!164079 () Bool)

(declare-fun lt!673654 () (_ BitVec 32))

(declare-fun lt!673653 () (_ BitVec 32))

(assert (=> d!164079 (= lt!673654 (bvmul (bvxor lt!673653 (bvlshr lt!673653 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164079 (= lt!673653 ((_ extract 31 0) (bvand (bvxor (select (arr!50543 _keys!637) #b00000000000000000000000000000000) (bvlshr (select (arr!50543 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164079 (and (bvsge mask!947 #b00000000000000000000000000000000) (let ((res!1071569 (let ((h!38127 ((_ extract 31 0) (bvand (bvxor (select (arr!50543 _keys!637) #b00000000000000000000000000000000) (bvlshr (select (arr!50543 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!140756 (bvmul (bvxor h!38127 (bvlshr h!38127 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!140756 (bvlshr x!140756 #b00000000000000000000000000001101)) mask!947))))) (and (bvslt res!1071569 (bvadd mask!947 #b00000000000000000000000000000001)) (bvsge res!1071569 #b00000000000000000000000000000000))))))

(assert (=> d!164079 (= (toIndex!0 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) mask!947) (bvand (bvxor lt!673654 (bvlshr lt!673654 #b00000000000000000000000000001101)) mask!947))))

(assert (=> d!163971 d!164079))

(assert (=> d!163971 d!163935))

(declare-fun d!164081 () Bool)

(assert (=> d!164081 (= (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) (and (not (= (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1568777 d!164081))

(declare-fun d!164083 () Bool)

(declare-fun e!874685 () Bool)

(assert (=> d!164083 e!874685))

(declare-fun res!1071570 () Bool)

(assert (=> d!164083 (=> res!1071570 e!874685)))

(declare-fun lt!673656 () Bool)

(assert (=> d!164083 (= res!1071570 (not lt!673656))))

(declare-fun lt!673658 () Bool)

(assert (=> d!164083 (= lt!673656 lt!673658)))

(declare-fun lt!673657 () Unit!51941)

(declare-fun e!874684 () Unit!51941)

(assert (=> d!164083 (= lt!673657 e!874684)))

(declare-fun c!145206 () Bool)

(assert (=> d!164083 (= c!145206 lt!673658)))

(assert (=> d!164083 (= lt!673658 (containsKey!851 (toList!11387 lt!673600) (_1!12661 (tuple2!25301 lt!673519 lt!673523))))))

(assert (=> d!164083 (= (contains!10390 lt!673600 (_1!12661 (tuple2!25301 lt!673519 lt!673523))) lt!673656)))

(declare-fun b!1568959 () Bool)

(declare-fun lt!673655 () Unit!51941)

(assert (=> b!1568959 (= e!874684 lt!673655)))

(assert (=> b!1568959 (= lt!673655 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673600) (_1!12661 (tuple2!25301 lt!673519 lt!673523))))))

(assert (=> b!1568959 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673600) (_1!12661 (tuple2!25301 lt!673519 lt!673523))))))

(declare-fun b!1568960 () Bool)

(declare-fun Unit!51957 () Unit!51941)

(assert (=> b!1568960 (= e!874684 Unit!51957)))

(declare-fun b!1568961 () Bool)

(assert (=> b!1568961 (= e!874685 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673600) (_1!12661 (tuple2!25301 lt!673519 lt!673523)))))))

(assert (= (and d!164083 c!145206) b!1568959))

(assert (= (and d!164083 (not c!145206)) b!1568960))

(assert (= (and d!164083 (not res!1071570)) b!1568961))

(declare-fun m!1443813 () Bool)

(assert (=> d!164083 m!1443813))

(declare-fun m!1443815 () Bool)

(assert (=> b!1568959 m!1443815))

(assert (=> b!1568959 m!1443625))

(assert (=> b!1568959 m!1443625))

(declare-fun m!1443817 () Bool)

(assert (=> b!1568959 m!1443817))

(assert (=> b!1568961 m!1443625))

(assert (=> b!1568961 m!1443625))

(assert (=> b!1568961 m!1443817))

(assert (=> d!163995 d!164083))

(declare-fun b!1568964 () Bool)

(declare-fun e!874687 () Option!864)

(assert (=> b!1568964 (= e!874687 (getValueByKey!789 (t!51553 lt!673601) (_1!12661 (tuple2!25301 lt!673519 lt!673523))))))

(declare-fun b!1568962 () Bool)

(declare-fun e!874686 () Option!864)

(assert (=> b!1568962 (= e!874686 (Some!863 (_2!12661 (h!38122 lt!673601))))))

(declare-fun b!1568965 () Bool)

(assert (=> b!1568965 (= e!874687 None!862)))

(declare-fun c!145207 () Bool)

(declare-fun d!164085 () Bool)

(assert (=> d!164085 (= c!145207 (and ((_ is Cons!36658) lt!673601) (= (_1!12661 (h!38122 lt!673601)) (_1!12661 (tuple2!25301 lt!673519 lt!673523)))))))

(assert (=> d!164085 (= (getValueByKey!789 lt!673601 (_1!12661 (tuple2!25301 lt!673519 lt!673523))) e!874686)))

(declare-fun b!1568963 () Bool)

(assert (=> b!1568963 (= e!874686 e!874687)))

(declare-fun c!145208 () Bool)

(assert (=> b!1568963 (= c!145208 (and ((_ is Cons!36658) lt!673601) (not (= (_1!12661 (h!38122 lt!673601)) (_1!12661 (tuple2!25301 lt!673519 lt!673523))))))))

(assert (= (and d!164085 c!145207) b!1568962))

(assert (= (and d!164085 (not c!145207)) b!1568963))

(assert (= (and b!1568963 c!145208) b!1568964))

(assert (= (and b!1568963 (not c!145208)) b!1568965))

(declare-fun m!1443819 () Bool)

(assert (=> b!1568964 m!1443819))

(assert (=> d!163995 d!164085))

(declare-fun d!164087 () Bool)

(assert (=> d!164087 (= (getValueByKey!789 lt!673601 (_1!12661 (tuple2!25301 lt!673519 lt!673523))) (Some!863 (_2!12661 (tuple2!25301 lt!673519 lt!673523))))))

(declare-fun lt!673659 () Unit!51941)

(assert (=> d!164087 (= lt!673659 (choose!2070 lt!673601 (_1!12661 (tuple2!25301 lt!673519 lt!673523)) (_2!12661 (tuple2!25301 lt!673519 lt!673523))))))

(declare-fun e!874688 () Bool)

(assert (=> d!164087 e!874688))

(declare-fun res!1071571 () Bool)

(assert (=> d!164087 (=> (not res!1071571) (not e!874688))))

(assert (=> d!164087 (= res!1071571 (isStrictlySorted!973 lt!673601))))

(assert (=> d!164087 (= (lemmaContainsTupThenGetReturnValue!386 lt!673601 (_1!12661 (tuple2!25301 lt!673519 lt!673523)) (_2!12661 (tuple2!25301 lt!673519 lt!673523))) lt!673659)))

(declare-fun b!1568966 () Bool)

(declare-fun res!1071572 () Bool)

(assert (=> b!1568966 (=> (not res!1071572) (not e!874688))))

(assert (=> b!1568966 (= res!1071572 (containsKey!851 lt!673601 (_1!12661 (tuple2!25301 lt!673519 lt!673523))))))

(declare-fun b!1568967 () Bool)

(assert (=> b!1568967 (= e!874688 (contains!10392 lt!673601 (tuple2!25301 (_1!12661 (tuple2!25301 lt!673519 lt!673523)) (_2!12661 (tuple2!25301 lt!673519 lt!673523)))))))

(assert (= (and d!164087 res!1071571) b!1568966))

(assert (= (and b!1568966 res!1071572) b!1568967))

(assert (=> d!164087 m!1443619))

(declare-fun m!1443821 () Bool)

(assert (=> d!164087 m!1443821))

(declare-fun m!1443823 () Bool)

(assert (=> d!164087 m!1443823))

(declare-fun m!1443825 () Bool)

(assert (=> b!1568966 m!1443825))

(declare-fun m!1443827 () Bool)

(assert (=> b!1568967 m!1443827))

(assert (=> d!163995 d!164087))

(declare-fun bm!72055 () Bool)

(declare-fun call!72059 () List!36662)

(declare-fun call!72060 () List!36662)

(assert (=> bm!72055 (= call!72059 call!72060)))

(declare-fun bm!72056 () Bool)

(declare-fun call!72058 () List!36662)

(assert (=> bm!72056 (= call!72058 call!72059)))

(declare-fun b!1568968 () Bool)

(declare-fun e!874690 () List!36662)

(assert (=> b!1568968 (= e!874690 call!72059)))

(declare-fun d!164089 () Bool)

(declare-fun e!874689 () Bool)

(assert (=> d!164089 e!874689))

(declare-fun res!1071574 () Bool)

(assert (=> d!164089 (=> (not res!1071574) (not e!874689))))

(declare-fun lt!673660 () List!36662)

(assert (=> d!164089 (= res!1071574 (isStrictlySorted!973 lt!673660))))

(declare-fun e!874693 () List!36662)

(assert (=> d!164089 (= lt!673660 e!874693)))

(declare-fun c!145209 () Bool)

(assert (=> d!164089 (= c!145209 (and ((_ is Cons!36658) (toList!11387 lt!673521)) (bvslt (_1!12661 (h!38122 (toList!11387 lt!673521))) (_1!12661 (tuple2!25301 lt!673519 lt!673523)))))))

(assert (=> d!164089 (isStrictlySorted!973 (toList!11387 lt!673521))))

(assert (=> d!164089 (= (insertStrictlySorted!578 (toList!11387 lt!673521) (_1!12661 (tuple2!25301 lt!673519 lt!673523)) (_2!12661 (tuple2!25301 lt!673519 lt!673523))) lt!673660)))

(declare-fun c!145212 () Bool)

(declare-fun b!1568969 () Bool)

(assert (=> b!1568969 (= c!145212 (and ((_ is Cons!36658) (toList!11387 lt!673521)) (bvsgt (_1!12661 (h!38122 (toList!11387 lt!673521))) (_1!12661 (tuple2!25301 lt!673519 lt!673523)))))))

(declare-fun e!874692 () List!36662)

(assert (=> b!1568969 (= e!874690 e!874692)))

(declare-fun b!1568970 () Bool)

(assert (=> b!1568970 (= e!874693 e!874690)))

(declare-fun c!145211 () Bool)

(assert (=> b!1568970 (= c!145211 (and ((_ is Cons!36658) (toList!11387 lt!673521)) (= (_1!12661 (h!38122 (toList!11387 lt!673521))) (_1!12661 (tuple2!25301 lt!673519 lt!673523)))))))

(declare-fun b!1568971 () Bool)

(declare-fun e!874691 () List!36662)

(assert (=> b!1568971 (= e!874691 (ite c!145211 (t!51553 (toList!11387 lt!673521)) (ite c!145212 (Cons!36658 (h!38122 (toList!11387 lt!673521)) (t!51553 (toList!11387 lt!673521))) Nil!36659)))))

(declare-fun b!1568972 () Bool)

(assert (=> b!1568972 (= e!874689 (contains!10392 lt!673660 (tuple2!25301 (_1!12661 (tuple2!25301 lt!673519 lt!673523)) (_2!12661 (tuple2!25301 lt!673519 lt!673523)))))))

(declare-fun b!1568973 () Bool)

(assert (=> b!1568973 (= e!874692 call!72058)))

(declare-fun b!1568974 () Bool)

(assert (=> b!1568974 (= e!874691 (insertStrictlySorted!578 (t!51553 (toList!11387 lt!673521)) (_1!12661 (tuple2!25301 lt!673519 lt!673523)) (_2!12661 (tuple2!25301 lt!673519 lt!673523))))))

(declare-fun b!1568975 () Bool)

(assert (=> b!1568975 (= e!874692 call!72058)))

(declare-fun b!1568976 () Bool)

(assert (=> b!1568976 (= e!874693 call!72060)))

(declare-fun b!1568977 () Bool)

(declare-fun res!1071573 () Bool)

(assert (=> b!1568977 (=> (not res!1071573) (not e!874689))))

(assert (=> b!1568977 (= res!1071573 (containsKey!851 lt!673660 (_1!12661 (tuple2!25301 lt!673519 lt!673523))))))

(declare-fun bm!72057 () Bool)

(assert (=> bm!72057 (= call!72060 ($colon$colon!984 e!874691 (ite c!145209 (h!38122 (toList!11387 lt!673521)) (tuple2!25301 (_1!12661 (tuple2!25301 lt!673519 lt!673523)) (_2!12661 (tuple2!25301 lt!673519 lt!673523))))))))

(declare-fun c!145210 () Bool)

(assert (=> bm!72057 (= c!145210 c!145209)))

(assert (= (and d!164089 c!145209) b!1568976))

(assert (= (and d!164089 (not c!145209)) b!1568970))

(assert (= (and b!1568970 c!145211) b!1568968))

(assert (= (and b!1568970 (not c!145211)) b!1568969))

(assert (= (and b!1568969 c!145212) b!1568975))

(assert (= (and b!1568969 (not c!145212)) b!1568973))

(assert (= (or b!1568975 b!1568973) bm!72056))

(assert (= (or b!1568968 bm!72056) bm!72055))

(assert (= (or b!1568976 bm!72055) bm!72057))

(assert (= (and bm!72057 c!145210) b!1568974))

(assert (= (and bm!72057 (not c!145210)) b!1568971))

(assert (= (and d!164089 res!1071574) b!1568977))

(assert (= (and b!1568977 res!1071573) b!1568972))

(declare-fun m!1443829 () Bool)

(assert (=> b!1568972 m!1443829))

(declare-fun m!1443831 () Bool)

(assert (=> bm!72057 m!1443831))

(declare-fun m!1443833 () Bool)

(assert (=> b!1568977 m!1443833))

(declare-fun m!1443835 () Bool)

(assert (=> b!1568974 m!1443835))

(declare-fun m!1443837 () Bool)

(assert (=> d!164089 m!1443837))

(declare-fun m!1443839 () Bool)

(assert (=> d!164089 m!1443839))

(assert (=> d!163995 d!164089))

(declare-fun d!164091 () Bool)

(declare-fun res!1071575 () Bool)

(declare-fun e!874694 () Bool)

(assert (=> d!164091 (=> res!1071575 e!874694)))

(assert (=> d!164091 (= res!1071575 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164091 (= (containsKey!851 (t!51553 (toList!11387 lt!673449)) #b0000000000000000000000000000000000000000000000000000000000000000) e!874694)))

(declare-fun b!1568978 () Bool)

(declare-fun e!874695 () Bool)

(assert (=> b!1568978 (= e!874694 e!874695)))

(declare-fun res!1071576 () Bool)

(assert (=> b!1568978 (=> (not res!1071576) (not e!874695))))

(assert (=> b!1568978 (= res!1071576 (and (or (not ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449)))) (bvsle (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (bvslt (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568979 () Bool)

(assert (=> b!1568979 (= e!874695 (containsKey!851 (t!51553 (t!51553 (toList!11387 lt!673449))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164091 (not res!1071575)) b!1568978))

(assert (= (and b!1568978 res!1071576) b!1568979))

(declare-fun m!1443841 () Bool)

(assert (=> b!1568979 m!1443841))

(assert (=> b!1568853 d!164091))

(declare-fun d!164093 () Bool)

(declare-fun c!145215 () Bool)

(assert (=> d!164093 (= c!145215 ((_ is Nil!36659) (toList!11387 lt!673538)))))

(declare-fun e!874698 () (InoxSet tuple2!25300))

(assert (=> d!164093 (= (content!799 (toList!11387 lt!673538)) e!874698)))

(declare-fun b!1568984 () Bool)

(assert (=> b!1568984 (= e!874698 ((as const (Array tuple2!25300 Bool)) false))))

(declare-fun b!1568985 () Bool)

(assert (=> b!1568985 (= e!874698 ((_ map or) (store ((as const (Array tuple2!25300 Bool)) false) (h!38122 (toList!11387 lt!673538)) true) (content!799 (t!51553 (toList!11387 lt!673538)))))))

(assert (= (and d!164093 c!145215) b!1568984))

(assert (= (and d!164093 (not c!145215)) b!1568985))

(declare-fun m!1443843 () Bool)

(assert (=> b!1568985 m!1443843))

(declare-fun m!1443845 () Bool)

(assert (=> b!1568985 m!1443845))

(assert (=> d!163963 d!164093))

(declare-fun d!164095 () Bool)

(declare-fun res!1071577 () Bool)

(declare-fun e!874699 () Bool)

(assert (=> d!164095 (=> res!1071577 e!874699)))

(assert (=> d!164095 (= res!1071577 (and ((_ is Cons!36658) (toList!11387 lt!673450)) (= (_1!12661 (h!38122 (toList!11387 lt!673450))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164095 (= (containsKey!851 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000) e!874699)))

(declare-fun b!1568986 () Bool)

(declare-fun e!874700 () Bool)

(assert (=> b!1568986 (= e!874699 e!874700)))

(declare-fun res!1071578 () Bool)

(assert (=> b!1568986 (=> (not res!1071578) (not e!874700))))

(assert (=> b!1568986 (= res!1071578 (and (or (not ((_ is Cons!36658) (toList!11387 lt!673450))) (bvsle (_1!12661 (h!38122 (toList!11387 lt!673450))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36658) (toList!11387 lt!673450)) (bvslt (_1!12661 (h!38122 (toList!11387 lt!673450))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568987 () Bool)

(assert (=> b!1568987 (= e!874700 (containsKey!851 (t!51553 (toList!11387 lt!673450)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164095 (not res!1071577)) b!1568986))

(assert (= (and b!1568986 res!1071578) b!1568987))

(declare-fun m!1443847 () Bool)

(assert (=> b!1568987 m!1443847))

(assert (=> d!163961 d!164095))

(assert (=> d!163989 d!163987))

(declare-fun d!164097 () Bool)

(assert (=> d!164097 (= (getValueByKey!789 lt!673539 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) (Some!863 (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(assert (=> d!164097 true))

(declare-fun _$22!592 () Unit!51941)

(assert (=> d!164097 (= (choose!2070 lt!673539 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) _$22!592)))

(declare-fun bs!45095 () Bool)

(assert (= bs!45095 d!164097))

(assert (=> bs!45095 m!1443451))

(assert (=> d!163989 d!164097))

(declare-fun d!164099 () Bool)

(declare-fun res!1071579 () Bool)

(declare-fun e!874701 () Bool)

(assert (=> d!164099 (=> res!1071579 e!874701)))

(assert (=> d!164099 (= res!1071579 (or ((_ is Nil!36659) lt!673539) ((_ is Nil!36659) (t!51553 lt!673539))))))

(assert (=> d!164099 (= (isStrictlySorted!973 lt!673539) e!874701)))

(declare-fun b!1568988 () Bool)

(declare-fun e!874702 () Bool)

(assert (=> b!1568988 (= e!874701 e!874702)))

(declare-fun res!1071580 () Bool)

(assert (=> b!1568988 (=> (not res!1071580) (not e!874702))))

(assert (=> b!1568988 (= res!1071580 (bvslt (_1!12661 (h!38122 lt!673539)) (_1!12661 (h!38122 (t!51553 lt!673539)))))))

(declare-fun b!1568989 () Bool)

(assert (=> b!1568989 (= e!874702 (isStrictlySorted!973 (t!51553 lt!673539)))))

(assert (= (and d!164099 (not res!1071579)) b!1568988))

(assert (= (and b!1568988 res!1071580) b!1568989))

(declare-fun m!1443849 () Bool)

(assert (=> b!1568989 m!1443849))

(assert (=> d!163989 d!164099))

(declare-fun e!874704 () Option!864)

(declare-fun b!1568992 () Bool)

(assert (=> b!1568992 (= e!874704 (getValueByKey!789 (t!51553 (t!51553 (toList!11387 lt!673449))) (select (arr!50543 _keys!637) from!782)))))

(declare-fun b!1568990 () Bool)

(declare-fun e!874703 () Option!864)

(assert (=> b!1568990 (= e!874703 (Some!863 (_2!12661 (h!38122 (t!51553 (toList!11387 lt!673449))))))))

(declare-fun b!1568993 () Bool)

(assert (=> b!1568993 (= e!874704 None!862)))

(declare-fun d!164101 () Bool)

(declare-fun c!145216 () Bool)

(assert (=> d!164101 (= c!145216 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) (select (arr!50543 _keys!637) from!782))))))

(assert (=> d!164101 (= (getValueByKey!789 (t!51553 (toList!11387 lt!673449)) (select (arr!50543 _keys!637) from!782)) e!874703)))

(declare-fun b!1568991 () Bool)

(assert (=> b!1568991 (= e!874703 e!874704)))

(declare-fun c!145217 () Bool)

(assert (=> b!1568991 (= c!145217 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (not (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) (select (arr!50543 _keys!637) from!782)))))))

(assert (= (and d!164101 c!145216) b!1568990))

(assert (= (and d!164101 (not c!145216)) b!1568991))

(assert (= (and b!1568991 c!145217) b!1568992))

(assert (= (and b!1568991 (not c!145217)) b!1568993))

(assert (=> b!1568992 m!1443273))

(declare-fun m!1443851 () Bool)

(assert (=> b!1568992 m!1443851))

(assert (=> b!1568712 d!164101))

(assert (=> b!1568858 d!164075))

(assert (=> b!1568709 d!163993))

(declare-fun d!164103 () Bool)

(assert (not d!164103))

(assert (=> b!1568789 d!164103))

(declare-fun d!164105 () Bool)

(declare-fun lt!673665 () SeekEntryResult!13474)

(assert (=> d!164105 (and (or ((_ is Undefined!13474) lt!673665) (not ((_ is Found!13474) lt!673665)) (and (bvsge (index!56295 lt!673665) #b00000000000000000000000000000000) (bvslt (index!56295 lt!673665) (size!51094 _keys!637)))) (or ((_ is Undefined!13474) lt!673665) ((_ is Found!13474) lt!673665) (not ((_ is MissingVacant!13474) lt!673665)) (not (= (index!56297 lt!673665) (index!56296 lt!673568))) (and (bvsge (index!56297 lt!673665) #b00000000000000000000000000000000) (bvslt (index!56297 lt!673665) (size!51094 _keys!637)))) (or ((_ is Undefined!13474) lt!673665) (ite ((_ is Found!13474) lt!673665) (= (select (arr!50543 _keys!637) (index!56295 lt!673665)) (select (arr!50543 _keys!637) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!13474) lt!673665) (= (index!56297 lt!673665) (index!56296 lt!673568)) (= (select (arr!50543 _keys!637) (index!56297 lt!673665)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!874712 () SeekEntryResult!13474)

(assert (=> d!164105 (= lt!673665 e!874712)))

(declare-fun c!145224 () Bool)

(assert (=> d!164105 (= c!145224 (bvsge (x!140746 lt!673568) #b01111111111111111111111111111110))))

(declare-fun lt!673666 () (_ BitVec 64))

(assert (=> d!164105 (= lt!673666 (select (arr!50543 _keys!637) (index!56296 lt!673568)))))

(assert (=> d!164105 (validMask!0 mask!947)))

(assert (=> d!164105 (= (seekKeyOrZeroReturnVacant!0 (x!140746 lt!673568) (index!56296 lt!673568) (index!56296 lt!673568) (select (arr!50543 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!673665)))

(declare-fun b!1569006 () Bool)

(declare-fun e!874711 () SeekEntryResult!13474)

(assert (=> b!1569006 (= e!874711 (MissingVacant!13474 (index!56296 lt!673568)))))

(declare-fun b!1569007 () Bool)

(assert (=> b!1569007 (= e!874711 (seekKeyOrZeroReturnVacant!0 (bvadd (x!140746 lt!673568) #b00000000000000000000000000000001) (nextIndex!0 (index!56296 lt!673568) (bvadd (x!140746 lt!673568) #b00000000000000000000000000000001) mask!947) (index!56296 lt!673568) (select (arr!50543 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(declare-fun b!1569008 () Bool)

(declare-fun e!874713 () SeekEntryResult!13474)

(assert (=> b!1569008 (= e!874713 (Found!13474 (index!56296 lt!673568)))))

(declare-fun b!1569009 () Bool)

(declare-fun c!145225 () Bool)

(assert (=> b!1569009 (= c!145225 (= lt!673666 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1569009 (= e!874713 e!874711)))

(declare-fun b!1569010 () Bool)

(assert (=> b!1569010 (= e!874712 e!874713)))

(declare-fun c!145226 () Bool)

(assert (=> b!1569010 (= c!145226 (= lt!673666 (select (arr!50543 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1569011 () Bool)

(assert (=> b!1569011 (= e!874712 Undefined!13474)))

(assert (= (and d!164105 c!145224) b!1569011))

(assert (= (and d!164105 (not c!145224)) b!1569010))

(assert (= (and b!1569010 c!145226) b!1569008))

(assert (= (and b!1569010 (not c!145226)) b!1569009))

(assert (= (and b!1569009 c!145225) b!1569006))

(assert (= (and b!1569009 (not c!145225)) b!1569007))

(declare-fun m!1443853 () Bool)

(assert (=> d!164105 m!1443853))

(declare-fun m!1443855 () Bool)

(assert (=> d!164105 m!1443855))

(assert (=> d!164105 m!1443521))

(assert (=> d!164105 m!1443289))

(declare-fun m!1443857 () Bool)

(assert (=> b!1569007 m!1443857))

(assert (=> b!1569007 m!1443857))

(assert (=> b!1569007 m!1443383))

(declare-fun m!1443859 () Bool)

(assert (=> b!1569007 m!1443859))

(assert (=> b!1568755 d!164105))

(declare-fun d!164107 () Bool)

(assert (=> d!164107 (= (isEmpty!1151 (toList!11387 lt!673520)) ((_ is Nil!36659) (toList!11387 lt!673520)))))

(assert (=> d!164017 d!164107))

(declare-fun d!164109 () Bool)

(declare-fun res!1071581 () Bool)

(declare-fun e!874714 () Bool)

(assert (=> d!164109 (=> res!1071581 e!874714)))

(assert (=> d!164109 (= res!1071581 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164109 (= (containsKey!851 (t!51553 (toList!11387 lt!673449)) #b1000000000000000000000000000000000000000000000000000000000000000) e!874714)))

(declare-fun b!1569012 () Bool)

(declare-fun e!874715 () Bool)

(assert (=> b!1569012 (= e!874714 e!874715)))

(declare-fun res!1071582 () Bool)

(assert (=> b!1569012 (=> (not res!1071582) (not e!874715))))

(assert (=> b!1569012 (= res!1071582 (and (or (not ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449)))) (bvsle (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (bvslt (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1569013 () Bool)

(assert (=> b!1569013 (= e!874715 (containsKey!851 (t!51553 (t!51553 (toList!11387 lt!673449))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164109 (not res!1071581)) b!1569012))

(assert (= (and b!1569012 res!1071582) b!1569013))

(declare-fun m!1443861 () Bool)

(assert (=> b!1569013 m!1443861))

(assert (=> b!1568768 d!164109))

(declare-fun d!164111 () Bool)

(assert (=> d!164111 (= (get!26404 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!22311 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1568842 d!164111))

(declare-fun lt!673667 () Bool)

(declare-fun d!164113 () Bool)

(assert (=> d!164113 (= lt!673667 (select (content!799 lt!673539) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun e!874717 () Bool)

(assert (=> d!164113 (= lt!673667 e!874717)))

(declare-fun res!1071583 () Bool)

(assert (=> d!164113 (=> (not res!1071583) (not e!874717))))

(assert (=> d!164113 (= res!1071583 ((_ is Cons!36658) lt!673539))))

(assert (=> d!164113 (= (contains!10392 lt!673539 (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) lt!673667)))

(declare-fun b!1569014 () Bool)

(declare-fun e!874716 () Bool)

(assert (=> b!1569014 (= e!874717 e!874716)))

(declare-fun res!1071584 () Bool)

(assert (=> b!1569014 (=> res!1071584 e!874716)))

(assert (=> b!1569014 (= res!1071584 (= (h!38122 lt!673539) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun b!1569015 () Bool)

(assert (=> b!1569015 (= e!874716 (contains!10392 (t!51553 lt!673539) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (= (and d!164113 res!1071583) b!1569014))

(assert (= (and b!1569014 (not res!1071584)) b!1569015))

(declare-fun m!1443863 () Bool)

(assert (=> d!164113 m!1443863))

(declare-fun m!1443865 () Bool)

(assert (=> d!164113 m!1443865))

(declare-fun m!1443867 () Bool)

(assert (=> b!1569015 m!1443867))

(assert (=> b!1568802 d!164113))

(declare-fun b!1569018 () Bool)

(declare-fun e!874719 () Option!864)

(assert (=> b!1569018 (= e!874719 (getValueByKey!789 (t!51553 (t!51553 (toList!11387 lt!673449))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569016 () Bool)

(declare-fun e!874718 () Option!864)

(assert (=> b!1569016 (= e!874718 (Some!863 (_2!12661 (h!38122 (t!51553 (toList!11387 lt!673449))))))))

(declare-fun b!1569019 () Bool)

(assert (=> b!1569019 (= e!874719 None!862)))

(declare-fun d!164115 () Bool)

(declare-fun c!145227 () Bool)

(assert (=> d!164115 (= c!145227 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164115 (= (getValueByKey!789 (t!51553 (toList!11387 lt!673449)) #b0000000000000000000000000000000000000000000000000000000000000000) e!874718)))

(declare-fun b!1569017 () Bool)

(assert (=> b!1569017 (= e!874718 e!874719)))

(declare-fun c!145228 () Bool)

(assert (=> b!1569017 (= c!145228 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (not (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!164115 c!145227) b!1569016))

(assert (= (and d!164115 (not c!145227)) b!1569017))

(assert (= (and b!1569017 c!145228) b!1569018))

(assert (= (and b!1569017 (not c!145228)) b!1569019))

(declare-fun m!1443869 () Bool)

(assert (=> b!1569018 m!1443869))

(assert (=> b!1568717 d!164115))

(declare-fun d!164117 () Bool)

(declare-fun lt!673668 () Bool)

(assert (=> d!164117 (= lt!673668 (select (content!799 (t!51553 (toList!11387 lt!673538))) (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))

(declare-fun e!874721 () Bool)

(assert (=> d!164117 (= lt!673668 e!874721)))

(declare-fun res!1071585 () Bool)

(assert (=> d!164117 (=> (not res!1071585) (not e!874721))))

(assert (=> d!164117 (= res!1071585 ((_ is Cons!36658) (t!51553 (toList!11387 lt!673538))))))

(assert (=> d!164117 (= (contains!10392 (t!51553 (toList!11387 lt!673538)) (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) lt!673668)))

(declare-fun b!1569020 () Bool)

(declare-fun e!874720 () Bool)

(assert (=> b!1569020 (= e!874721 e!874720)))

(declare-fun res!1071586 () Bool)

(assert (=> b!1569020 (=> res!1071586 e!874720)))

(assert (=> b!1569020 (= res!1071586 (= (h!38122 (t!51553 (toList!11387 lt!673538))) (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))

(declare-fun b!1569021 () Bool)

(assert (=> b!1569021 (= e!874720 (contains!10392 (t!51553 (t!51553 (toList!11387 lt!673538))) (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))

(assert (= (and d!164117 res!1071585) b!1569020))

(assert (= (and b!1569020 (not res!1071586)) b!1569021))

(assert (=> d!164117 m!1443845))

(declare-fun m!1443871 () Bool)

(assert (=> d!164117 m!1443871))

(declare-fun m!1443873 () Bool)

(assert (=> b!1569021 m!1443873))

(assert (=> b!1568731 d!164117))

(declare-fun d!164119 () Bool)

(declare-fun lt!673669 () Bool)

(assert (=> d!164119 (= lt!673669 (select (content!799 (toList!11387 lt!673600)) (tuple2!25301 lt!673519 lt!673523)))))

(declare-fun e!874723 () Bool)

(assert (=> d!164119 (= lt!673669 e!874723)))

(declare-fun res!1071587 () Bool)

(assert (=> d!164119 (=> (not res!1071587) (not e!874723))))

(assert (=> d!164119 (= res!1071587 ((_ is Cons!36658) (toList!11387 lt!673600)))))

(assert (=> d!164119 (= (contains!10392 (toList!11387 lt!673600) (tuple2!25301 lt!673519 lt!673523)) lt!673669)))

(declare-fun b!1569022 () Bool)

(declare-fun e!874722 () Bool)

(assert (=> b!1569022 (= e!874723 e!874722)))

(declare-fun res!1071588 () Bool)

(assert (=> b!1569022 (=> res!1071588 e!874722)))

(assert (=> b!1569022 (= res!1071588 (= (h!38122 (toList!11387 lt!673600)) (tuple2!25301 lt!673519 lt!673523)))))

(declare-fun b!1569023 () Bool)

(assert (=> b!1569023 (= e!874722 (contains!10392 (t!51553 (toList!11387 lt!673600)) (tuple2!25301 lt!673519 lt!673523)))))

(assert (= (and d!164119 res!1071587) b!1569022))

(assert (= (and b!1569022 (not res!1071588)) b!1569023))

(declare-fun m!1443875 () Bool)

(assert (=> d!164119 m!1443875))

(declare-fun m!1443877 () Bool)

(assert (=> d!164119 m!1443877))

(declare-fun m!1443879 () Bool)

(assert (=> b!1569023 m!1443879))

(assert (=> b!1568836 d!164119))

(assert (=> d!164025 d!164013))

(assert (=> d!164025 d!164015))

(declare-fun d!164121 () Bool)

(assert (=> d!164121 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!164121 true))

(declare-fun _$12!489 () Unit!51941)

(assert (=> d!164121 (= (choose!2069 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000) _$12!489)))

(declare-fun bs!45096 () Bool)

(assert (= bs!45096 d!164121))

(assert (=> bs!45096 m!1443409))

(assert (=> bs!45096 m!1443409))

(assert (=> bs!45096 m!1443411))

(assert (=> d!164025 d!164121))

(declare-fun d!164123 () Bool)

(declare-fun res!1071589 () Bool)

(declare-fun e!874724 () Bool)

(assert (=> d!164123 (=> res!1071589 e!874724)))

(assert (=> d!164123 (= res!1071589 (or ((_ is Nil!36659) (toList!11387 lt!673449)) ((_ is Nil!36659) (t!51553 (toList!11387 lt!673449)))))))

(assert (=> d!164123 (= (isStrictlySorted!973 (toList!11387 lt!673449)) e!874724)))

(declare-fun b!1569024 () Bool)

(declare-fun e!874725 () Bool)

(assert (=> b!1569024 (= e!874724 e!874725)))

(declare-fun res!1071590 () Bool)

(assert (=> b!1569024 (=> (not res!1071590) (not e!874725))))

(assert (=> b!1569024 (= res!1071590 (bvslt (_1!12661 (h!38122 (toList!11387 lt!673449))) (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449))))))))

(declare-fun b!1569025 () Bool)

(assert (=> b!1569025 (= e!874725 (isStrictlySorted!973 (t!51553 (toList!11387 lt!673449))))))

(assert (= (and d!164123 (not res!1071589)) b!1569024))

(assert (= (and b!1569024 res!1071590) b!1569025))

(declare-fun m!1443881 () Bool)

(assert (=> b!1569025 m!1443881))

(assert (=> d!164025 d!164123))

(declare-fun b!1569028 () Bool)

(declare-fun e!874727 () Option!864)

(assert (=> b!1569028 (= e!874727 (getValueByKey!789 (t!51553 (t!51553 (toList!11387 lt!673538))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun b!1569026 () Bool)

(declare-fun e!874726 () Option!864)

(assert (=> b!1569026 (= e!874726 (Some!863 (_2!12661 (h!38122 (t!51553 (toList!11387 lt!673538))))))))

(declare-fun b!1569029 () Bool)

(assert (=> b!1569029 (= e!874727 None!862)))

(declare-fun d!164125 () Bool)

(declare-fun c!145229 () Bool)

(assert (=> d!164125 (= c!145229 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673538))) (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673538)))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (=> d!164125 (= (getValueByKey!789 (t!51553 (toList!11387 lt!673538)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) e!874726)))

(declare-fun b!1569027 () Bool)

(assert (=> b!1569027 (= e!874726 e!874727)))

(declare-fun c!145230 () Bool)

(assert (=> b!1569027 (= c!145230 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673538))) (not (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673538)))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))))

(assert (= (and d!164125 c!145229) b!1569026))

(assert (= (and d!164125 (not c!145229)) b!1569027))

(assert (= (and b!1569027 c!145230) b!1569028))

(assert (= (and b!1569027 (not c!145230)) b!1569029))

(declare-fun m!1443883 () Bool)

(assert (=> b!1569028 m!1443883))

(assert (=> b!1568705 d!164125))

(assert (=> b!1568859 d!163975))

(declare-fun d!164127 () Bool)

(assert (=> d!164127 (= (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!863) (getValueByKey!789 (toList!11387 lt!673449) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!164013 d!164127))

(declare-fun d!164129 () Bool)

(assert (=> d!164129 (arrayContainsKey!0 _keys!637 lt!673555 #b00000000000000000000000000000000)))

(declare-fun lt!673670 () Unit!51941)

(assert (=> d!164129 (= lt!673670 (choose!13 _keys!637 lt!673555 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!164129 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!164129 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673555 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!673670)))

(declare-fun bs!45097 () Bool)

(assert (= bs!45097 d!164129))

(assert (=> bs!45097 m!1443511))

(declare-fun m!1443885 () Bool)

(assert (=> bs!45097 m!1443885))

(assert (=> b!1568735 d!164129))

(declare-fun d!164131 () Bool)

(declare-fun res!1071591 () Bool)

(declare-fun e!874728 () Bool)

(assert (=> d!164131 (=> res!1071591 e!874728)))

(assert (=> d!164131 (= res!1071591 (= (select (arr!50543 _keys!637) #b00000000000000000000000000000000) lt!673555))))

(assert (=> d!164131 (= (arrayContainsKey!0 _keys!637 lt!673555 #b00000000000000000000000000000000) e!874728)))

(declare-fun b!1569030 () Bool)

(declare-fun e!874729 () Bool)

(assert (=> b!1569030 (= e!874728 e!874729)))

(declare-fun res!1071592 () Bool)

(assert (=> b!1569030 (=> (not res!1071592) (not e!874729))))

(assert (=> b!1569030 (= res!1071592 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(declare-fun b!1569031 () Bool)

(assert (=> b!1569031 (= e!874729 (arrayContainsKey!0 _keys!637 lt!673555 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!164131 (not res!1071591)) b!1569030))

(assert (= (and b!1569030 res!1071592) b!1569031))

(assert (=> d!164131 m!1443383))

(declare-fun m!1443887 () Bool)

(assert (=> b!1569031 m!1443887))

(assert (=> b!1568735 d!164131))

(declare-fun b!1569032 () Bool)

(declare-fun e!874732 () SeekEntryResult!13474)

(declare-fun lt!673672 () SeekEntryResult!13474)

(assert (=> b!1569032 (= e!874732 (Found!13474 (index!56296 lt!673672)))))

(declare-fun b!1569034 () Bool)

(declare-fun e!874731 () SeekEntryResult!13474)

(assert (=> b!1569034 (= e!874731 e!874732)))

(declare-fun lt!673671 () (_ BitVec 64))

(assert (=> b!1569034 (= lt!673671 (select (arr!50543 _keys!637) (index!56296 lt!673672)))))

(declare-fun c!145231 () Bool)

(assert (=> b!1569034 (= c!145231 (= lt!673671 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1569035 () Bool)

(declare-fun c!145232 () Bool)

(assert (=> b!1569035 (= c!145232 (= lt!673671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874730 () SeekEntryResult!13474)

(assert (=> b!1569035 (= e!874732 e!874730)))

(declare-fun b!1569036 () Bool)

(assert (=> b!1569036 (= e!874731 Undefined!13474)))

(declare-fun b!1569037 () Bool)

(assert (=> b!1569037 (= e!874730 (MissingZero!13474 (index!56296 lt!673672)))))

(declare-fun b!1569033 () Bool)

(assert (=> b!1569033 (= e!874730 (seekKeyOrZeroReturnVacant!0 (x!140746 lt!673672) (index!56296 lt!673672) (index!56296 lt!673672) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947))))

(declare-fun d!164133 () Bool)

(declare-fun lt!673673 () SeekEntryResult!13474)

(assert (=> d!164133 (and (or ((_ is Undefined!13474) lt!673673) (not ((_ is Found!13474) lt!673673)) (and (bvsge (index!56295 lt!673673) #b00000000000000000000000000000000) (bvslt (index!56295 lt!673673) (size!51094 _keys!637)))) (or ((_ is Undefined!13474) lt!673673) ((_ is Found!13474) lt!673673) (not ((_ is MissingZero!13474) lt!673673)) (and (bvsge (index!56294 lt!673673) #b00000000000000000000000000000000) (bvslt (index!56294 lt!673673) (size!51094 _keys!637)))) (or ((_ is Undefined!13474) lt!673673) ((_ is Found!13474) lt!673673) ((_ is MissingZero!13474) lt!673673) (not ((_ is MissingVacant!13474) lt!673673)) (and (bvsge (index!56297 lt!673673) #b00000000000000000000000000000000) (bvslt (index!56297 lt!673673) (size!51094 _keys!637)))) (or ((_ is Undefined!13474) lt!673673) (ite ((_ is Found!13474) lt!673673) (= (select (arr!50543 _keys!637) (index!56295 lt!673673)) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!13474) lt!673673) (= (select (arr!50543 _keys!637) (index!56294 lt!673673)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13474) lt!673673) (= (select (arr!50543 _keys!637) (index!56297 lt!673673)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!164133 (= lt!673673 e!874731)))

(declare-fun c!145233 () Bool)

(assert (=> d!164133 (= c!145233 (and ((_ is Intermediate!13474) lt!673672) (undefined!14286 lt!673672)))))

(assert (=> d!164133 (= lt!673672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!947) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947))))

(assert (=> d!164133 (validMask!0 mask!947)))

(assert (=> d!164133 (= (seekEntryOrOpen!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947) lt!673673)))

(assert (= (and d!164133 c!145233) b!1569036))

(assert (= (and d!164133 (not c!145233)) b!1569034))

(assert (= (and b!1569034 c!145231) b!1569032))

(assert (= (and b!1569034 (not c!145231)) b!1569035))

(assert (= (and b!1569035 c!145232) b!1569037))

(assert (= (and b!1569035 (not c!145232)) b!1569033))

(declare-fun m!1443889 () Bool)

(assert (=> b!1569034 m!1443889))

(assert (=> b!1569033 m!1443507))

(declare-fun m!1443891 () Bool)

(assert (=> b!1569033 m!1443891))

(declare-fun m!1443893 () Bool)

(assert (=> d!164133 m!1443893))

(assert (=> d!164133 m!1443507))

(declare-fun m!1443895 () Bool)

(assert (=> d!164133 m!1443895))

(declare-fun m!1443897 () Bool)

(assert (=> d!164133 m!1443897))

(assert (=> d!164133 m!1443507))

(assert (=> d!164133 m!1443893))

(declare-fun m!1443899 () Bool)

(assert (=> d!164133 m!1443899))

(assert (=> d!164133 m!1443289))

(declare-fun m!1443901 () Bool)

(assert (=> d!164133 m!1443901))

(assert (=> b!1568735 d!164133))

(declare-fun d!164135 () Bool)

(assert (=> d!164135 (isDefined!580 (getValueByKey!789 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517))))

(declare-fun lt!673674 () Unit!51941)

(assert (=> d!164135 (= lt!673674 (choose!2069 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517))))

(declare-fun e!874733 () Bool)

(assert (=> d!164135 e!874733))

(declare-fun res!1071593 () Bool)

(assert (=> d!164135 (=> (not res!1071593) (not e!874733))))

(assert (=> d!164135 (= res!1071593 (isStrictlySorted!973 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)))))))

(assert (=> d!164135 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517) lt!673674)))

(declare-fun b!1569038 () Bool)

(assert (=> b!1569038 (= e!874733 (containsKey!851 (toList!11387 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523))) lt!673517))))

(assert (= (and d!164135 res!1071593) b!1569038))

(assert (=> d!164135 m!1443633))

(assert (=> d!164135 m!1443633))

(assert (=> d!164135 m!1443635))

(declare-fun m!1443903 () Bool)

(assert (=> d!164135 m!1443903))

(declare-fun m!1443905 () Bool)

(assert (=> d!164135 m!1443905))

(assert (=> b!1569038 m!1443629))

(assert (=> b!1568837 d!164135))

(assert (=> b!1568837 d!164039))

(assert (=> b!1568837 d!164041))

(declare-fun d!164137 () Bool)

(declare-fun lt!673675 () Bool)

(assert (=> d!164137 (= lt!673675 (select (content!799 (toList!11387 lt!673608)) (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!874735 () Bool)

(assert (=> d!164137 (= lt!673675 e!874735)))

(declare-fun res!1071594 () Bool)

(assert (=> d!164137 (=> (not res!1071594) (not e!874735))))

(assert (=> d!164137 (= res!1071594 ((_ is Cons!36658) (toList!11387 lt!673608)))))

(assert (=> d!164137 (= (contains!10392 (toList!11387 lt!673608) (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!673675)))

(declare-fun b!1569039 () Bool)

(declare-fun e!874734 () Bool)

(assert (=> b!1569039 (= e!874735 e!874734)))

(declare-fun res!1071595 () Bool)

(assert (=> b!1569039 (=> res!1071595 e!874734)))

(assert (=> b!1569039 (= res!1071595 (= (h!38122 (toList!11387 lt!673608)) (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1569040 () Bool)

(assert (=> b!1569040 (= e!874734 (contains!10392 (t!51553 (toList!11387 lt!673608)) (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!164137 res!1071594) b!1569039))

(assert (= (and b!1569039 (not res!1071595)) b!1569040))

(declare-fun m!1443907 () Bool)

(assert (=> d!164137 m!1443907))

(declare-fun m!1443909 () Bool)

(assert (=> d!164137 m!1443909))

(declare-fun m!1443911 () Bool)

(assert (=> b!1569040 m!1443911))

(assert (=> b!1568841 d!164137))

(declare-fun d!164139 () Bool)

(declare-fun e!874737 () Bool)

(assert (=> d!164139 e!874737))

(declare-fun res!1071596 () Bool)

(assert (=> d!164139 (=> res!1071596 e!874737)))

(declare-fun lt!673677 () Bool)

(assert (=> d!164139 (= res!1071596 (not lt!673677))))

(declare-fun lt!673679 () Bool)

(assert (=> d!164139 (= lt!673677 lt!673679)))

(declare-fun lt!673678 () Unit!51941)

(declare-fun e!874736 () Unit!51941)

(assert (=> d!164139 (= lt!673678 e!874736)))

(declare-fun c!145234 () Bool)

(assert (=> d!164139 (= c!145234 lt!673679)))

(assert (=> d!164139 (= lt!673679 (containsKey!851 (toList!11387 lt!673577) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!164139 (= (contains!10390 lt!673577 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673677)))

(declare-fun b!1569041 () Bool)

(declare-fun lt!673676 () Unit!51941)

(assert (=> b!1569041 (= e!874736 lt!673676)))

(assert (=> b!1569041 (= lt!673676 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673577) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1569041 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673577) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569042 () Bool)

(declare-fun Unit!51958 () Unit!51941)

(assert (=> b!1569042 (= e!874736 Unit!51958)))

(declare-fun b!1569043 () Bool)

(assert (=> b!1569043 (= e!874737 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673577) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164139 c!145234) b!1569041))

(assert (= (and d!164139 (not c!145234)) b!1569042))

(assert (= (and d!164139 (not res!1071596)) b!1569043))

(declare-fun m!1443913 () Bool)

(assert (=> d!164139 m!1443913))

(declare-fun m!1443915 () Bool)

(assert (=> b!1569041 m!1443915))

(declare-fun m!1443917 () Bool)

(assert (=> b!1569041 m!1443917))

(assert (=> b!1569041 m!1443917))

(declare-fun m!1443919 () Bool)

(assert (=> b!1569041 m!1443919))

(assert (=> b!1569043 m!1443917))

(assert (=> b!1569043 m!1443917))

(assert (=> b!1569043 m!1443919))

(assert (=> d!163977 d!164139))

(assert (=> d!163977 d!163935))

(declare-fun d!164141 () Bool)

(declare-fun res!1071597 () Bool)

(declare-fun e!874738 () Bool)

(assert (=> d!164141 (=> res!1071597 e!874738)))

(assert (=> d!164141 (= res!1071597 (and ((_ is Cons!36658) (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) (= (_1!12661 (h!38122 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164141 (= (containsKey!851 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000) e!874738)))

(declare-fun b!1569044 () Bool)

(declare-fun e!874739 () Bool)

(assert (=> b!1569044 (= e!874738 e!874739)))

(declare-fun res!1071598 () Bool)

(assert (=> b!1569044 (=> (not res!1071598) (not e!874739))))

(assert (=> b!1569044 (= res!1071598 (and (or (not ((_ is Cons!36658) (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))) (bvsle (_1!12661 (h!38122 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36658) (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) (bvslt (_1!12661 (h!38122 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1569045 () Bool)

(assert (=> b!1569045 (= e!874739 (containsKey!851 (t!51553 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164141 (not res!1071597)) b!1569044))

(assert (= (and b!1569044 res!1071598) b!1569045))

(declare-fun m!1443921 () Bool)

(assert (=> b!1569045 m!1443921))

(assert (=> d!163957 d!164141))

(declare-fun d!164143 () Bool)

(declare-fun res!1071599 () Bool)

(declare-fun e!874740 () Bool)

(assert (=> d!164143 (=> res!1071599 e!874740)))

(assert (=> d!164143 (= res!1071599 (and ((_ is Cons!36658) (toList!11387 lt!673538)) (= (_1!12661 (h!38122 (toList!11387 lt!673538))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (=> d!164143 (= (containsKey!851 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) e!874740)))

(declare-fun b!1569046 () Bool)

(declare-fun e!874741 () Bool)

(assert (=> b!1569046 (= e!874740 e!874741)))

(declare-fun res!1071600 () Bool)

(assert (=> b!1569046 (=> (not res!1071600) (not e!874741))))

(assert (=> b!1569046 (= res!1071600 (and (or (not ((_ is Cons!36658) (toList!11387 lt!673538))) (bvsle (_1!12661 (h!38122 (toList!11387 lt!673538))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) ((_ is Cons!36658) (toList!11387 lt!673538)) (bvslt (_1!12661 (h!38122 (toList!11387 lt!673538))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun b!1569047 () Bool)

(assert (=> b!1569047 (= e!874741 (containsKey!851 (t!51553 (toList!11387 lt!673538)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(assert (= (and d!164143 (not res!1071599)) b!1569046))

(assert (= (and b!1569046 res!1071600) b!1569047))

(declare-fun m!1443923 () Bool)

(assert (=> b!1569047 m!1443923))

(assert (=> d!163985 d!164143))

(assert (=> b!1568714 d!164019))

(assert (=> bm!72040 d!164043))

(declare-fun bm!72058 () Bool)

(declare-fun call!72062 () List!36662)

(declare-fun call!72063 () List!36662)

(assert (=> bm!72058 (= call!72062 call!72063)))

(declare-fun bm!72059 () Bool)

(declare-fun call!72061 () List!36662)

(assert (=> bm!72059 (= call!72061 call!72062)))

(declare-fun b!1569048 () Bool)

(declare-fun e!874743 () List!36662)

(assert (=> b!1569048 (= e!874743 call!72062)))

(declare-fun d!164145 () Bool)

(declare-fun e!874742 () Bool)

(assert (=> d!164145 e!874742))

(declare-fun res!1071602 () Bool)

(assert (=> d!164145 (=> (not res!1071602) (not e!874742))))

(declare-fun lt!673680 () List!36662)

(assert (=> d!164145 (= res!1071602 (isStrictlySorted!973 lt!673680))))

(declare-fun e!874746 () List!36662)

(assert (=> d!164145 (= lt!673680 e!874746)))

(declare-fun c!145235 () Bool)

(assert (=> d!164145 (= c!145235 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673450))) (bvslt (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673450)))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (=> d!164145 (isStrictlySorted!973 (t!51553 (toList!11387 lt!673450)))))

(assert (=> d!164145 (= (insertStrictlySorted!578 (t!51553 (toList!11387 lt!673450)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) lt!673680)))

(declare-fun b!1569049 () Bool)

(declare-fun c!145238 () Bool)

(assert (=> b!1569049 (= c!145238 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673450))) (bvsgt (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673450)))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun e!874745 () List!36662)

(assert (=> b!1569049 (= e!874743 e!874745)))

(declare-fun b!1569050 () Bool)

(assert (=> b!1569050 (= e!874746 e!874743)))

(declare-fun c!145237 () Bool)

(assert (=> b!1569050 (= c!145237 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673450))) (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673450)))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun e!874744 () List!36662)

(declare-fun b!1569051 () Bool)

(assert (=> b!1569051 (= e!874744 (ite c!145237 (t!51553 (t!51553 (toList!11387 lt!673450))) (ite c!145238 (Cons!36658 (h!38122 (t!51553 (toList!11387 lt!673450))) (t!51553 (t!51553 (toList!11387 lt!673450)))) Nil!36659)))))

(declare-fun b!1569052 () Bool)

(assert (=> b!1569052 (= e!874742 (contains!10392 lt!673680 (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun b!1569053 () Bool)

(assert (=> b!1569053 (= e!874745 call!72061)))

(declare-fun b!1569054 () Bool)

(assert (=> b!1569054 (= e!874744 (insertStrictlySorted!578 (t!51553 (t!51553 (toList!11387 lt!673450))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun b!1569055 () Bool)

(assert (=> b!1569055 (= e!874745 call!72061)))

(declare-fun b!1569056 () Bool)

(assert (=> b!1569056 (= e!874746 call!72063)))

(declare-fun b!1569057 () Bool)

(declare-fun res!1071601 () Bool)

(assert (=> b!1569057 (=> (not res!1071601) (not e!874742))))

(assert (=> b!1569057 (= res!1071601 (containsKey!851 lt!673680 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun bm!72060 () Bool)

(assert (=> bm!72060 (= call!72063 ($colon$colon!984 e!874744 (ite c!145235 (h!38122 (t!51553 (toList!11387 lt!673450))) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))))

(declare-fun c!145236 () Bool)

(assert (=> bm!72060 (= c!145236 c!145235)))

(assert (= (and d!164145 c!145235) b!1569056))

(assert (= (and d!164145 (not c!145235)) b!1569050))

(assert (= (and b!1569050 c!145237) b!1569048))

(assert (= (and b!1569050 (not c!145237)) b!1569049))

(assert (= (and b!1569049 c!145238) b!1569055))

(assert (= (and b!1569049 (not c!145238)) b!1569053))

(assert (= (or b!1569055 b!1569053) bm!72059))

(assert (= (or b!1569048 bm!72059) bm!72058))

(assert (= (or b!1569056 bm!72058) bm!72060))

(assert (= (and bm!72060 c!145236) b!1569054))

(assert (= (and bm!72060 (not c!145236)) b!1569051))

(assert (= (and d!164145 res!1071602) b!1569057))

(assert (= (and b!1569057 res!1071601) b!1569052))

(declare-fun m!1443925 () Bool)

(assert (=> b!1569052 m!1443925))

(declare-fun m!1443927 () Bool)

(assert (=> bm!72060 m!1443927))

(declare-fun m!1443929 () Bool)

(assert (=> b!1569057 m!1443929))

(declare-fun m!1443931 () Bool)

(assert (=> b!1569054 m!1443931))

(declare-fun m!1443933 () Bool)

(assert (=> d!164145 m!1443933))

(assert (=> d!164145 m!1443685))

(assert (=> b!1568829 d!164145))

(declare-fun d!164147 () Bool)

(assert (=> d!164147 (= (isDefined!580 (getValueByKey!789 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45098 () Bool)

(assert (= bs!45098 d!164147))

(assert (=> bs!45098 m!1443495))

(declare-fun m!1443935 () Bool)

(assert (=> bs!45098 m!1443935))

(assert (=> b!1568725 d!164147))

(declare-fun b!1569060 () Bool)

(declare-fun e!874748 () Option!864)

(assert (=> b!1569060 (= e!874748 (getValueByKey!789 (t!51553 (toList!11387 lt!673450)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569058 () Bool)

(declare-fun e!874747 () Option!864)

(assert (=> b!1569058 (= e!874747 (Some!863 (_2!12661 (h!38122 (toList!11387 lt!673450)))))))

(declare-fun b!1569061 () Bool)

(assert (=> b!1569061 (= e!874748 None!862)))

(declare-fun d!164149 () Bool)

(declare-fun c!145239 () Bool)

(assert (=> d!164149 (= c!145239 (and ((_ is Cons!36658) (toList!11387 lt!673450)) (= (_1!12661 (h!38122 (toList!11387 lt!673450))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164149 (= (getValueByKey!789 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000) e!874747)))

(declare-fun b!1569059 () Bool)

(assert (=> b!1569059 (= e!874747 e!874748)))

(declare-fun c!145240 () Bool)

(assert (=> b!1569059 (= c!145240 (and ((_ is Cons!36658) (toList!11387 lt!673450)) (not (= (_1!12661 (h!38122 (toList!11387 lt!673450))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!164149 c!145239) b!1569058))

(assert (= (and d!164149 (not c!145239)) b!1569059))

(assert (= (and b!1569059 c!145240) b!1569060))

(assert (= (and b!1569059 (not c!145240)) b!1569061))

(declare-fun m!1443937 () Bool)

(assert (=> b!1569060 m!1443937))

(assert (=> b!1568725 d!164149))

(assert (=> d!164003 d!163997))

(assert (=> d!164003 d!163995))

(declare-fun d!164151 () Bool)

(assert (=> d!164151 (not (contains!10390 (+!5123 lt!673521 (tuple2!25301 lt!673519 lt!673523)) lt!673517))))

(assert (=> d!164151 true))

(declare-fun _$36!389 () Unit!51941)

(assert (=> d!164151 (= (choose!2068 lt!673521 lt!673519 lt!673523 lt!673517) _$36!389)))

(declare-fun bs!45099 () Bool)

(assert (= bs!45099 d!164151))

(assert (=> bs!45099 m!1443429))

(assert (=> bs!45099 m!1443429))

(assert (=> bs!45099 m!1443431))

(assert (=> d!164003 d!164151))

(declare-fun d!164153 () Bool)

(declare-fun e!874750 () Bool)

(assert (=> d!164153 e!874750))

(declare-fun res!1071603 () Bool)

(assert (=> d!164153 (=> res!1071603 e!874750)))

(declare-fun lt!673682 () Bool)

(assert (=> d!164153 (= res!1071603 (not lt!673682))))

(declare-fun lt!673684 () Bool)

(assert (=> d!164153 (= lt!673682 lt!673684)))

(declare-fun lt!673683 () Unit!51941)

(declare-fun e!874749 () Unit!51941)

(assert (=> d!164153 (= lt!673683 e!874749)))

(declare-fun c!145241 () Bool)

(assert (=> d!164153 (= c!145241 lt!673684)))

(assert (=> d!164153 (= lt!673684 (containsKey!851 (toList!11387 lt!673521) lt!673517))))

(assert (=> d!164153 (= (contains!10390 lt!673521 lt!673517) lt!673682)))

(declare-fun b!1569062 () Bool)

(declare-fun lt!673681 () Unit!51941)

(assert (=> b!1569062 (= e!874749 lt!673681)))

(assert (=> b!1569062 (= lt!673681 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673521) lt!673517))))

(assert (=> b!1569062 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673521) lt!673517))))

(declare-fun b!1569063 () Bool)

(declare-fun Unit!51959 () Unit!51941)

(assert (=> b!1569063 (= e!874749 Unit!51959)))

(declare-fun b!1569064 () Bool)

(assert (=> b!1569064 (= e!874750 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673521) lt!673517)))))

(assert (= (and d!164153 c!145241) b!1569062))

(assert (= (and d!164153 (not c!145241)) b!1569063))

(assert (= (and d!164153 (not res!1071603)) b!1569064))

(declare-fun m!1443939 () Bool)

(assert (=> d!164153 m!1443939))

(declare-fun m!1443941 () Bool)

(assert (=> b!1569062 m!1443941))

(declare-fun m!1443943 () Bool)

(assert (=> b!1569062 m!1443943))

(assert (=> b!1569062 m!1443943))

(declare-fun m!1443945 () Bool)

(assert (=> b!1569062 m!1443945))

(assert (=> b!1569064 m!1443943))

(assert (=> b!1569064 m!1443943))

(assert (=> b!1569064 m!1443945))

(assert (=> d!164003 d!164153))

(declare-fun lt!673685 () Bool)

(declare-fun d!164155 () Bool)

(assert (=> d!164155 (= lt!673685 (select (content!799 lt!673597) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun e!874752 () Bool)

(assert (=> d!164155 (= lt!673685 e!874752)))

(declare-fun res!1071604 () Bool)

(assert (=> d!164155 (=> (not res!1071604) (not e!874752))))

(assert (=> d!164155 (= res!1071604 ((_ is Cons!36658) lt!673597))))

(assert (=> d!164155 (= (contains!10392 lt!673597 (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) lt!673685)))

(declare-fun b!1569065 () Bool)

(declare-fun e!874751 () Bool)

(assert (=> b!1569065 (= e!874752 e!874751)))

(declare-fun res!1071605 () Bool)

(assert (=> b!1569065 (=> res!1071605 e!874751)))

(assert (=> b!1569065 (= res!1071605 (= (h!38122 lt!673597) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun b!1569066 () Bool)

(assert (=> b!1569066 (= e!874751 (contains!10392 (t!51553 lt!673597) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (= (and d!164155 res!1071604) b!1569065))

(assert (= (and b!1569065 (not res!1071605)) b!1569066))

(declare-fun m!1443947 () Bool)

(assert (=> d!164155 m!1443947))

(declare-fun m!1443949 () Bool)

(assert (=> d!164155 m!1443949))

(declare-fun m!1443951 () Bool)

(assert (=> b!1569066 m!1443951))

(assert (=> b!1568827 d!164155))

(declare-fun d!164157 () Bool)

(assert (=> d!164157 (= (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45100 () Bool)

(assert (= bs!45100 d!164157))

(assert (=> bs!45100 m!1443661))

(declare-fun m!1443953 () Bool)

(assert (=> bs!45100 m!1443953))

(assert (=> b!1568847 d!164157))

(declare-fun b!1569069 () Bool)

(declare-fun e!874754 () Option!864)

(assert (=> b!1569069 (= e!874754 (getValueByKey!789 (t!51553 (toList!11387 lt!673520)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569067 () Bool)

(declare-fun e!874753 () Option!864)

(assert (=> b!1569067 (= e!874753 (Some!863 (_2!12661 (h!38122 (toList!11387 lt!673520)))))))

(declare-fun b!1569070 () Bool)

(assert (=> b!1569070 (= e!874754 None!862)))

(declare-fun d!164159 () Bool)

(declare-fun c!145242 () Bool)

(assert (=> d!164159 (= c!145242 (and ((_ is Cons!36658) (toList!11387 lt!673520)) (= (_1!12661 (h!38122 (toList!11387 lt!673520))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164159 (= (getValueByKey!789 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000) e!874753)))

(declare-fun b!1569068 () Bool)

(assert (=> b!1569068 (= e!874753 e!874754)))

(declare-fun c!145243 () Bool)

(assert (=> b!1569068 (= c!145243 (and ((_ is Cons!36658) (toList!11387 lt!673520)) (not (= (_1!12661 (h!38122 (toList!11387 lt!673520))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!164159 c!145242) b!1569067))

(assert (= (and d!164159 (not c!145242)) b!1569068))

(assert (= (and b!1569068 c!145243) b!1569069))

(assert (= (and b!1569068 (not c!145243)) b!1569070))

(declare-fun m!1443955 () Bool)

(assert (=> b!1569069 m!1443955))

(assert (=> b!1568847 d!164159))

(declare-fun d!164161 () Bool)

(declare-fun e!874756 () Bool)

(assert (=> d!164161 e!874756))

(declare-fun res!1071606 () Bool)

(assert (=> d!164161 (=> res!1071606 e!874756)))

(declare-fun lt!673687 () Bool)

(assert (=> d!164161 (= res!1071606 (not lt!673687))))

(declare-fun lt!673689 () Bool)

(assert (=> d!164161 (= lt!673687 lt!673689)))

(declare-fun lt!673688 () Unit!51941)

(declare-fun e!874755 () Unit!51941)

(assert (=> d!164161 (= lt!673688 e!874755)))

(declare-fun c!145244 () Bool)

(assert (=> d!164161 (= c!145244 lt!673689)))

(assert (=> d!164161 (= lt!673689 (containsKey!851 (toList!11387 lt!673577) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!164161 (= (contains!10390 lt!673577 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673687)))

(declare-fun b!1569071 () Bool)

(declare-fun lt!673686 () Unit!51941)

(assert (=> b!1569071 (= e!874755 lt!673686)))

(assert (=> b!1569071 (= lt!673686 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673577) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1569071 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673577) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569072 () Bool)

(declare-fun Unit!51960 () Unit!51941)

(assert (=> b!1569072 (= e!874755 Unit!51960)))

(declare-fun b!1569073 () Bool)

(assert (=> b!1569073 (= e!874756 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164161 c!145244) b!1569071))

(assert (= (and d!164161 (not c!145244)) b!1569072))

(assert (= (and d!164161 (not res!1071606)) b!1569073))

(declare-fun m!1443957 () Bool)

(assert (=> d!164161 m!1443957))

(declare-fun m!1443959 () Bool)

(assert (=> b!1569071 m!1443959))

(declare-fun m!1443961 () Bool)

(assert (=> b!1569071 m!1443961))

(assert (=> b!1569071 m!1443961))

(declare-fun m!1443963 () Bool)

(assert (=> b!1569071 m!1443963))

(assert (=> b!1569073 m!1443961))

(assert (=> b!1569073 m!1443961))

(assert (=> b!1569073 m!1443963))

(assert (=> b!1568772 d!164161))

(declare-fun d!164163 () Bool)

(assert (=> d!164163 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673690 () Unit!51941)

(assert (=> d!164163 (= lt!673690 (choose!2069 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874757 () Bool)

(assert (=> d!164163 e!874757))

(declare-fun res!1071607 () Bool)

(assert (=> d!164163 (=> (not res!1071607) (not e!874757))))

(assert (=> d!164163 (= res!1071607 (isStrictlySorted!973 (toList!11387 lt!673450)))))

(assert (=> d!164163 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000) lt!673690)))

(declare-fun b!1569074 () Bool)

(assert (=> b!1569074 (= e!874757 (containsKey!851 (toList!11387 lt!673450) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164163 res!1071607) b!1569074))

(assert (=> d!164163 m!1443495))

(assert (=> d!164163 m!1443495))

(assert (=> d!164163 m!1443497))

(declare-fun m!1443965 () Bool)

(assert (=> d!164163 m!1443965))

(assert (=> d!164163 m!1443613))

(assert (=> b!1569074 m!1443491))

(assert (=> b!1568723 d!164163))

(assert (=> b!1568723 d!164147))

(assert (=> b!1568723 d!164149))

(assert (=> d!163959 d!163957))

(assert (=> d!163959 d!163933))

(declare-fun d!164165 () Bool)

(declare-fun res!1071608 () Bool)

(declare-fun e!874758 () Bool)

(assert (=> d!164165 (=> res!1071608 e!874758)))

(assert (=> d!164165 (= res!1071608 (and ((_ is Cons!36658) (toList!11387 lt!673520)) (= (_1!12661 (h!38122 (toList!11387 lt!673520))) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (=> d!164165 (= (containsKey!851 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) e!874758)))

(declare-fun b!1569075 () Bool)

(declare-fun e!874759 () Bool)

(assert (=> b!1569075 (= e!874758 e!874759)))

(declare-fun res!1071609 () Bool)

(assert (=> b!1569075 (=> (not res!1071609) (not e!874759))))

(assert (=> b!1569075 (= res!1071609 (and (or (not ((_ is Cons!36658) (toList!11387 lt!673520))) (bvsle (_1!12661 (h!38122 (toList!11387 lt!673520))) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))) ((_ is Cons!36658) (toList!11387 lt!673520)) (bvslt (_1!12661 (h!38122 (toList!11387 lt!673520))) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(declare-fun b!1569076 () Bool)

(assert (=> b!1569076 (= e!874759 (containsKey!851 (t!51553 (toList!11387 lt!673520)) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (= (and d!164165 (not res!1071608)) b!1569075))

(assert (= (and b!1569075 res!1071609) b!1569076))

(assert (=> b!1569076 m!1443413))

(declare-fun m!1443967 () Bool)

(assert (=> b!1569076 m!1443967))

(assert (=> d!163979 d!164165))

(declare-fun d!164167 () Bool)

(assert (=> d!164167 (= (content!800 Nil!36660) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!163981 d!164167))

(declare-fun d!164169 () Bool)

(declare-fun lt!673691 () Bool)

(assert (=> d!164169 (= lt!673691 (select (content!800 (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!874760 () Bool)

(assert (=> d!164169 (= lt!673691 e!874760)))

(declare-fun res!1071611 () Bool)

(assert (=> d!164169 (=> (not res!1071611) (not e!874760))))

(assert (=> d!164169 (= res!1071611 ((_ is Cons!36659) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)))))

(assert (=> d!164169 (= (contains!10393 (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!673691)))

(declare-fun b!1569077 () Bool)

(declare-fun e!874761 () Bool)

(assert (=> b!1569077 (= e!874760 e!874761)))

(declare-fun res!1071610 () Bool)

(assert (=> b!1569077 (=> res!1071610 e!874761)))

(assert (=> b!1569077 (= res!1071610 (= (h!38123 (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1569078 () Bool)

(assert (=> b!1569078 (= e!874761 (contains!10393 (t!51554 (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!164169 res!1071611) b!1569077))

(assert (= (and b!1569077 (not res!1071610)) b!1569078))

(declare-fun m!1443969 () Bool)

(assert (=> d!164169 m!1443969))

(assert (=> d!164169 m!1443507))

(declare-fun m!1443971 () Bool)

(assert (=> d!164169 m!1443971))

(assert (=> b!1569078 m!1443507))

(declare-fun m!1443973 () Bool)

(assert (=> b!1569078 m!1443973))

(assert (=> b!1568855 d!164169))

(declare-fun d!164171 () Bool)

(declare-fun e!874763 () Bool)

(assert (=> d!164171 e!874763))

(declare-fun res!1071612 () Bool)

(assert (=> d!164171 (=> res!1071612 e!874763)))

(declare-fun lt!673693 () Bool)

(assert (=> d!164171 (= res!1071612 (not lt!673693))))

(declare-fun lt!673695 () Bool)

(assert (=> d!164171 (= lt!673693 lt!673695)))

(declare-fun lt!673694 () Unit!51941)

(declare-fun e!874762 () Unit!51941)

(assert (=> d!164171 (= lt!673694 e!874762)))

(declare-fun c!145245 () Bool)

(assert (=> d!164171 (= c!145245 lt!673695)))

(assert (=> d!164171 (= lt!673695 (containsKey!851 (toList!11387 lt!673577) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> d!164171 (= (contains!10390 lt!673577 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) lt!673693)))

(declare-fun b!1569079 () Bool)

(declare-fun lt!673692 () Unit!51941)

(assert (=> b!1569079 (= e!874762 lt!673692)))

(assert (=> b!1569079 (= lt!673692 (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673577) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(assert (=> b!1569079 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673577) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))))))

(declare-fun b!1569080 () Bool)

(declare-fun Unit!51961 () Unit!51941)

(assert (=> b!1569080 (= e!874762 Unit!51961)))

(declare-fun b!1569081 () Bool)

(assert (=> b!1569081 (= e!874763 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673577) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)))))))

(assert (= (and d!164171 c!145245) b!1569079))

(assert (= (and d!164171 (not c!145245)) b!1569080))

(assert (= (and d!164171 (not res!1071612)) b!1569081))

(assert (=> d!164171 m!1443545))

(declare-fun m!1443975 () Bool)

(assert (=> d!164171 m!1443975))

(assert (=> b!1569079 m!1443545))

(declare-fun m!1443977 () Bool)

(assert (=> b!1569079 m!1443977))

(assert (=> b!1569079 m!1443545))

(declare-fun m!1443979 () Bool)

(assert (=> b!1569079 m!1443979))

(assert (=> b!1569079 m!1443979))

(declare-fun m!1443981 () Bool)

(assert (=> b!1569079 m!1443981))

(assert (=> b!1569081 m!1443545))

(assert (=> b!1569081 m!1443979))

(assert (=> b!1569081 m!1443979))

(assert (=> b!1569081 m!1443981))

(assert (=> b!1568774 d!164171))

(declare-fun d!164173 () Bool)

(assert (=> d!164173 (= ($colon$colon!984 e!874599 (ite c!145168 (h!38122 (toList!11387 lt!673450)) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))) (Cons!36658 (ite c!145168 (h!38122 (toList!11387 lt!673450)) (tuple2!25301 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)) (_2!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) e!874599))))

(assert (=> bm!72049 d!164173))

(declare-fun d!164175 () Bool)

(declare-fun res!1071613 () Bool)

(declare-fun e!874764 () Bool)

(assert (=> d!164175 (=> res!1071613 e!874764)))

(assert (=> d!164175 (= res!1071613 (and ((_ is Cons!36658) (toList!11387 lt!673520)) (= (_1!12661 (h!38122 (toList!11387 lt!673520))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164175 (= (containsKey!851 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000) e!874764)))

(declare-fun b!1569082 () Bool)

(declare-fun e!874765 () Bool)

(assert (=> b!1569082 (= e!874764 e!874765)))

(declare-fun res!1071614 () Bool)

(assert (=> b!1569082 (=> (not res!1071614) (not e!874765))))

(assert (=> b!1569082 (= res!1071614 (and (or (not ((_ is Cons!36658) (toList!11387 lt!673520))) (bvsle (_1!12661 (h!38122 (toList!11387 lt!673520))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36658) (toList!11387 lt!673520)) (bvslt (_1!12661 (h!38122 (toList!11387 lt!673520))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1569083 () Bool)

(assert (=> b!1569083 (= e!874765 (containsKey!851 (t!51553 (toList!11387 lt!673520)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164175 (not res!1071613)) b!1569082))

(assert (= (and b!1569082 res!1071614) b!1569083))

(declare-fun m!1443983 () Bool)

(assert (=> b!1569083 m!1443983))

(assert (=> d!164005 d!164175))

(assert (=> b!1568778 d!164081))

(declare-fun b!1569084 () Bool)

(declare-fun e!874767 () Bool)

(declare-fun call!72064 () Bool)

(assert (=> b!1569084 (= e!874767 call!72064)))

(declare-fun e!874769 () Bool)

(declare-fun b!1569085 () Bool)

(assert (=> b!1569085 (= e!874769 (contains!10393 (ite c!145177 (Cons!36659 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1569086 () Bool)

(assert (=> b!1569086 (= e!874767 call!72064)))

(declare-fun bm!72061 () Bool)

(declare-fun c!145246 () Bool)

(assert (=> bm!72061 (= call!72064 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!145246 (Cons!36659 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!145177 (Cons!36659 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660))) (ite c!145177 (Cons!36659 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)))))))

(declare-fun d!164177 () Bool)

(declare-fun res!1071617 () Bool)

(declare-fun e!874766 () Bool)

(assert (=> d!164177 (=> res!1071617 e!874766)))

(assert (=> d!164177 (= res!1071617 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(assert (=> d!164177 (= (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!145177 (Cons!36659 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660)) (ite c!145128 (Cons!36659 (select (arr!50543 _keys!637) #b00000000000000000000000000000000) Nil!36660) Nil!36660))) e!874766)))

(declare-fun b!1569087 () Bool)

(declare-fun e!874768 () Bool)

(assert (=> b!1569087 (= e!874768 e!874767)))

(assert (=> b!1569087 (= c!145246 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!1569088 () Bool)

(assert (=> b!1569088 (= e!874766 e!874768)))

(declare-fun res!1071616 () Bool)

(assert (=> b!1569088 (=> (not res!1071616) (not e!874768))))

(assert (=> b!1569088 (= res!1071616 (not e!874769))))

(declare-fun res!1071615 () Bool)

(assert (=> b!1569088 (=> (not res!1071615) (not e!874769))))

(assert (=> b!1569088 (= res!1071615 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!164177 (not res!1071617)) b!1569088))

(assert (= (and b!1569088 res!1071615) b!1569085))

(assert (= (and b!1569088 res!1071616) b!1569087))

(assert (= (and b!1569087 c!145246) b!1569084))

(assert (= (and b!1569087 (not c!145246)) b!1569086))

(assert (= (or b!1569084 b!1569086) bm!72061))

(declare-fun m!1443985 () Bool)

(assert (=> b!1569085 m!1443985))

(assert (=> b!1569085 m!1443985))

(declare-fun m!1443987 () Bool)

(assert (=> b!1569085 m!1443987))

(assert (=> bm!72061 m!1443985))

(declare-fun m!1443989 () Bool)

(assert (=> bm!72061 m!1443989))

(assert (=> b!1569087 m!1443985))

(assert (=> b!1569087 m!1443985))

(declare-fun m!1443991 () Bool)

(assert (=> b!1569087 m!1443991))

(assert (=> b!1569088 m!1443985))

(assert (=> b!1569088 m!1443985))

(assert (=> b!1569088 m!1443991))

(assert (=> bm!72050 d!164177))

(declare-fun d!164179 () Bool)

(assert (=> d!164179 (= (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000)) (not ((_ is Some!863) (getValueByKey!789 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!163953 d!164179))

(declare-fun d!164181 () Bool)

(assert (=> d!164181 (= (apply!1120 lt!673577 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001))) (get!26403 (getValueByKey!789 (toList!11387 lt!673577) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001)))))))

(declare-fun bs!45101 () Bool)

(assert (= bs!45101 d!164181))

(assert (=> bs!45101 m!1443545))

(assert (=> bs!45101 m!1443979))

(assert (=> bs!45101 m!1443979))

(declare-fun m!1443993 () Bool)

(assert (=> bs!45101 m!1443993))

(assert (=> b!1568776 d!164181))

(assert (=> b!1568776 d!164059))

(declare-fun d!164183 () Bool)

(assert (=> d!164183 (= (isDefined!580 (getValueByKey!789 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!1150 (getValueByKey!789 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!45102 () Bool)

(assert (= bs!45102 d!164183))

(assert (=> bs!45102 m!1443487))

(declare-fun m!1443995 () Bool)

(assert (=> bs!45102 m!1443995))

(assert (=> b!1568721 d!164183))

(declare-fun e!874771 () Option!864)

(declare-fun b!1569091 () Bool)

(assert (=> b!1569091 (= e!874771 (getValueByKey!789 (t!51553 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874770 () Option!864)

(declare-fun b!1569089 () Bool)

(assert (=> b!1569089 (= e!874770 (Some!863 (_2!12661 (h!38122 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))))

(declare-fun b!1569092 () Bool)

(assert (=> b!1569092 (= e!874771 None!862)))

(declare-fun c!145247 () Bool)

(declare-fun d!164185 () Bool)

(assert (=> d!164185 (= c!145247 (and ((_ is Cons!36658) (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) (= (_1!12661 (h!38122 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164185 (= (getValueByKey!789 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000) e!874770)))

(declare-fun b!1569090 () Bool)

(assert (=> b!1569090 (= e!874770 e!874771)))

(declare-fun c!145248 () Bool)

(assert (=> b!1569090 (= c!145248 (and ((_ is Cons!36658) (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) (not (= (_1!12661 (h!38122 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!164185 c!145247) b!1569089))

(assert (= (and d!164185 (not c!145247)) b!1569090))

(assert (= (and b!1569090 c!145248) b!1569091))

(assert (= (and b!1569090 (not c!145248)) b!1569092))

(declare-fun m!1443997 () Bool)

(assert (=> b!1569091 m!1443997))

(assert (=> b!1568721 d!164185))

(declare-fun d!164187 () Bool)

(declare-fun res!1071618 () Bool)

(declare-fun e!874772 () Bool)

(assert (=> d!164187 (=> res!1071618 e!874772)))

(assert (=> d!164187 (= res!1071618 (and ((_ is Cons!36658) lt!673539) (= (_1!12661 (h!38122 lt!673539)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (=> d!164187 (= (containsKey!851 lt!673539 (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) e!874772)))

(declare-fun b!1569093 () Bool)

(declare-fun e!874773 () Bool)

(assert (=> b!1569093 (= e!874772 e!874773)))

(declare-fun res!1071619 () Bool)

(assert (=> b!1569093 (=> (not res!1071619) (not e!874773))))

(assert (=> b!1569093 (= res!1071619 (and (or (not ((_ is Cons!36658) lt!673539)) (bvsle (_1!12661 (h!38122 lt!673539)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) ((_ is Cons!36658) lt!673539) (bvslt (_1!12661 (h!38122 lt!673539)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(declare-fun b!1569094 () Bool)

(assert (=> b!1569094 (= e!874773 (containsKey!851 (t!51553 lt!673539) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(assert (= (and d!164187 (not res!1071618)) b!1569093))

(assert (= (and b!1569093 res!1071619) b!1569094))

(declare-fun m!1443999 () Bool)

(assert (=> b!1569094 m!1443999))

(assert (=> b!1568801 d!164187))

(declare-fun d!164189 () Bool)

(assert (=> d!164189 (= (get!26403 (getValueByKey!789 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))) (v!22314 (getValueByKey!789 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (=> d!164021 d!164189))

(declare-fun b!1569097 () Bool)

(declare-fun e!874775 () Option!864)

(assert (=> b!1569097 (= e!874775 (getValueByKey!789 (t!51553 (toList!11387 lt!673520)) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1569095 () Bool)

(declare-fun e!874774 () Option!864)

(assert (=> b!1569095 (= e!874774 (Some!863 (_2!12661 (h!38122 (toList!11387 lt!673520)))))))

(declare-fun b!1569098 () Bool)

(assert (=> b!1569098 (= e!874775 None!862)))

(declare-fun d!164191 () Bool)

(declare-fun c!145249 () Bool)

(assert (=> d!164191 (= c!145249 (and ((_ is Cons!36658) (toList!11387 lt!673520)) (= (_1!12661 (h!38122 (toList!11387 lt!673520))) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))))

(assert (=> d!164191 (= (getValueByKey!789 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) e!874774)))

(declare-fun b!1569096 () Bool)

(assert (=> b!1569096 (= e!874774 e!874775)))

(declare-fun c!145250 () Bool)

(assert (=> b!1569096 (= c!145250 (and ((_ is Cons!36658) (toList!11387 lt!673520)) (not (= (_1!12661 (h!38122 (toList!11387 lt!673520))) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))))

(assert (= (and d!164191 c!145249) b!1569095))

(assert (= (and d!164191 (not c!145249)) b!1569096))

(assert (= (and b!1569096 c!145250) b!1569097))

(assert (= (and b!1569096 (not c!145250)) b!1569098))

(assert (=> b!1569097 m!1443413))

(declare-fun m!1444001 () Bool)

(assert (=> b!1569097 m!1444001))

(assert (=> d!164021 d!164191))

(assert (=> d!163967 d!163969))

(declare-fun d!164193 () Bool)

(assert (=> d!164193 (arrayContainsKey!0 _keys!637 lt!673493 #b00000000000000000000000000000000)))

(assert (=> d!164193 true))

(declare-fun _$60!457 () Unit!51941)

(assert (=> d!164193 (= (choose!13 _keys!637 lt!673493 #b00000000000000000000000000000000) _$60!457)))

(declare-fun bs!45103 () Bool)

(assert (= bs!45103 d!164193))

(assert (=> bs!45103 m!1443387))

(assert (=> d!163967 d!164193))

(declare-fun d!164195 () Bool)

(assert (=> d!164195 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun lt!673696 () Unit!51941)

(assert (=> d!164195 (= lt!673696 (choose!2069 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(declare-fun e!874776 () Bool)

(assert (=> d!164195 e!874776))

(declare-fun res!1071620 () Bool)

(assert (=> d!164195 (=> (not res!1071620) (not e!874776))))

(assert (=> d!164195 (= res!1071620 (isStrictlySorted!973 (toList!11387 lt!673538)))))

(assert (=> d!164195 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) lt!673696)))

(declare-fun b!1569099 () Bool)

(assert (=> b!1569099 (= e!874776 (containsKey!851 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))

(assert (= (and d!164195 res!1071620) b!1569099))

(assert (=> d!164195 m!1443457))

(assert (=> d!164195 m!1443457))

(assert (=> d!164195 m!1443591))

(declare-fun m!1444003 () Bool)

(assert (=> d!164195 m!1444003))

(declare-fun m!1444005 () Bool)

(assert (=> d!164195 m!1444005))

(assert (=> b!1569099 m!1443587))

(assert (=> b!1568790 d!164195))

(declare-fun d!164197 () Bool)

(assert (=> d!164197 (= (isDefined!580 (getValueByKey!789 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))) (not (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673538) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))))))))

(declare-fun bs!45104 () Bool)

(assert (= bs!45104 d!164197))

(assert (=> bs!45104 m!1443457))

(declare-fun m!1444007 () Bool)

(assert (=> bs!45104 m!1444007))

(assert (=> b!1568790 d!164197))

(assert (=> b!1568790 d!163943))

(declare-fun d!164199 () Bool)

(assert (=> d!164199 (= (isEmpty!1149 lt!673577) (isEmpty!1151 (toList!11387 lt!673577)))))

(declare-fun bs!45105 () Bool)

(assert (= bs!45105 d!164199))

(declare-fun m!1444009 () Bool)

(assert (=> bs!45105 m!1444009))

(assert (=> b!1568779 d!164199))

(declare-fun b!1569102 () Bool)

(declare-fun e!874778 () Option!864)

(assert (=> b!1569102 (= e!874778 (getValueByKey!789 (t!51553 (t!51553 (toList!11387 lt!673449))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569100 () Bool)

(declare-fun e!874777 () Option!864)

(assert (=> b!1569100 (= e!874777 (Some!863 (_2!12661 (h!38122 (t!51553 (toList!11387 lt!673449))))))))

(declare-fun b!1569103 () Bool)

(assert (=> b!1569103 (= e!874778 None!862)))

(declare-fun d!164201 () Bool)

(declare-fun c!145251 () Bool)

(assert (=> d!164201 (= c!145251 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164201 (= (getValueByKey!789 (t!51553 (toList!11387 lt!673449)) #b1000000000000000000000000000000000000000000000000000000000000000) e!874777)))

(declare-fun b!1569101 () Bool)

(assert (=> b!1569101 (= e!874777 e!874778)))

(declare-fun c!145252 () Bool)

(assert (=> b!1569101 (= c!145252 (and ((_ is Cons!36658) (t!51553 (toList!11387 lt!673449))) (not (= (_1!12661 (h!38122 (t!51553 (toList!11387 lt!673449)))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!164201 c!145251) b!1569100))

(assert (= (and d!164201 (not c!145251)) b!1569101))

(assert (= (and b!1569101 c!145252) b!1569102))

(assert (= (and b!1569101 (not c!145252)) b!1569103))

(declare-fun m!1444011 () Bool)

(assert (=> b!1569102 m!1444011))

(assert (=> b!1568850 d!164201))

(declare-fun d!164203 () Bool)

(assert (=> d!164203 (= (get!26405 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568843 d!164203))

(declare-fun d!164205 () Bool)

(assert (=> d!164205 (isDefined!580 (getValueByKey!789 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673697 () Unit!51941)

(assert (=> d!164205 (= lt!673697 (choose!2069 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874779 () Bool)

(assert (=> d!164205 e!874779))

(declare-fun res!1071621 () Bool)

(assert (=> d!164205 (=> (not res!1071621) (not e!874779))))

(assert (=> d!164205 (= res!1071621 (isStrictlySorted!973 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448)))))))

(assert (=> d!164205 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000) lt!673697)))

(declare-fun b!1569104 () Bool)

(assert (=> b!1569104 (= e!874779 (containsKey!851 (toList!11387 (+!5123 lt!673450 (tuple2!25301 (select (arr!50543 _keys!637) from!782) lt!673448))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164205 res!1071621) b!1569104))

(assert (=> d!164205 m!1443487))

(assert (=> d!164205 m!1443487))

(assert (=> d!164205 m!1443489))

(declare-fun m!1444013 () Bool)

(assert (=> d!164205 m!1444013))

(declare-fun m!1444015 () Bool)

(assert (=> d!164205 m!1444015))

(assert (=> b!1569104 m!1443483))

(assert (=> b!1568719 d!164205))

(assert (=> b!1568719 d!164183))

(assert (=> b!1568719 d!164185))

(declare-fun d!164207 () Bool)

(declare-fun res!1071622 () Bool)

(declare-fun e!874780 () Bool)

(assert (=> d!164207 (=> res!1071622 e!874780)))

(assert (=> d!164207 (= res!1071622 (and ((_ is Cons!36658) (toList!11387 lt!673520)) (= (_1!12661 (h!38122 (toList!11387 lt!673520))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!164207 (= (containsKey!851 (toList!11387 lt!673520) #b0000000000000000000000000000000000000000000000000000000000000000) e!874780)))

(declare-fun b!1569105 () Bool)

(declare-fun e!874781 () Bool)

(assert (=> b!1569105 (= e!874780 e!874781)))

(declare-fun res!1071623 () Bool)

(assert (=> b!1569105 (=> (not res!1071623) (not e!874781))))

(assert (=> b!1569105 (= res!1071623 (and (or (not ((_ is Cons!36658) (toList!11387 lt!673520))) (bvsle (_1!12661 (h!38122 (toList!11387 lt!673520))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!36658) (toList!11387 lt!673520)) (bvslt (_1!12661 (h!38122 (toList!11387 lt!673520))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1569106 () Bool)

(assert (=> b!1569106 (= e!874781 (containsKey!851 (t!51553 (toList!11387 lt!673520)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164207 (not res!1071622)) b!1569105))

(assert (= (and b!1569105 res!1071623) b!1569106))

(declare-fun m!1444017 () Bool)

(assert (=> b!1569106 m!1444017))

(assert (=> d!163973 d!164207))

(assert (=> b!1568792 d!164197))

(assert (=> b!1568792 d!163943))

(declare-fun b!1569107 () Bool)

(declare-fun e!874783 () Bool)

(declare-fun call!72065 () Bool)

(assert (=> b!1569107 (= e!874783 call!72065)))

(declare-fun b!1569109 () Bool)

(declare-fun e!874782 () Bool)

(assert (=> b!1569109 (= e!874782 call!72065)))

(declare-fun bm!72062 () Bool)

(assert (=> bm!72062 (= call!72065 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1569110 () Bool)

(assert (=> b!1569110 (= e!874782 e!874783)))

(declare-fun lt!673698 () (_ BitVec 64))

(assert (=> b!1569110 (= lt!673698 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!673700 () Unit!51941)

(assert (=> b!1569110 (= lt!673700 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!1569110 (arrayContainsKey!0 _keys!637 lt!673698 #b00000000000000000000000000000000)))

(declare-fun lt!673699 () Unit!51941)

(assert (=> b!1569110 (= lt!673699 lt!673700)))

(declare-fun res!1071624 () Bool)

(assert (=> b!1569110 (= res!1071624 (= (seekEntryOrOpen!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!637 mask!947) (Found!13474 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!1569110 (=> (not res!1071624) (not e!874783))))

(declare-fun d!164209 () Bool)

(declare-fun res!1071625 () Bool)

(declare-fun e!874784 () Bool)

(assert (=> d!164209 (=> res!1071625 e!874784)))

(assert (=> d!164209 (= res!1071625 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!51094 _keys!637)))))

(assert (=> d!164209 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947) e!874784)))

(declare-fun b!1569108 () Bool)

(assert (=> b!1569108 (= e!874784 e!874782)))

(declare-fun c!145253 () Bool)

(assert (=> b!1569108 (= c!145253 (validKeyInArray!0 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!164209 (not res!1071625)) b!1569108))

(assert (= (and b!1569108 c!145253) b!1569110))

(assert (= (and b!1569108 (not c!145253)) b!1569109))

(assert (= (and b!1569110 res!1071624) b!1569107))

(assert (= (or b!1569107 b!1569109) bm!72062))

(declare-fun m!1444019 () Bool)

(assert (=> bm!72062 m!1444019))

(assert (=> b!1569110 m!1443985))

(declare-fun m!1444021 () Bool)

(assert (=> b!1569110 m!1444021))

(declare-fun m!1444023 () Bool)

(assert (=> b!1569110 m!1444023))

(assert (=> b!1569110 m!1443985))

(declare-fun m!1444025 () Bool)

(assert (=> b!1569110 m!1444025))

(assert (=> b!1569108 m!1443985))

(assert (=> b!1569108 m!1443985))

(assert (=> b!1569108 m!1443991))

(assert (=> bm!72039 d!164209))

(declare-fun d!164211 () Bool)

(assert (=> d!164211 (= (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))) (not (isEmpty!1150 (getValueByKey!789 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))))

(declare-fun bs!45106 () Bool)

(assert (= bs!45106 d!164211))

(assert (=> bs!45106 m!1443577))

(declare-fun m!1444027 () Bool)

(assert (=> bs!45106 m!1444027))

(assert (=> b!1568783 d!164211))

(assert (=> b!1568783 d!164191))

(declare-fun e!874786 () Option!864)

(declare-fun b!1569113 () Bool)

(assert (=> b!1569113 (= e!874786 (getValueByKey!789 (t!51553 (toList!11387 lt!673608)) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1569111 () Bool)

(declare-fun e!874785 () Option!864)

(assert (=> b!1569111 (= e!874785 (Some!863 (_2!12661 (h!38122 (toList!11387 lt!673608)))))))

(declare-fun b!1569114 () Bool)

(assert (=> b!1569114 (= e!874786 None!862)))

(declare-fun d!164213 () Bool)

(declare-fun c!145254 () Bool)

(assert (=> d!164213 (= c!145254 (and ((_ is Cons!36658) (toList!11387 lt!673608)) (= (_1!12661 (h!38122 (toList!11387 lt!673608))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!164213 (= (getValueByKey!789 (toList!11387 lt!673608) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!874785)))

(declare-fun b!1569112 () Bool)

(assert (=> b!1569112 (= e!874785 e!874786)))

(declare-fun c!145255 () Bool)

(assert (=> b!1569112 (= c!145255 (and ((_ is Cons!36658) (toList!11387 lt!673608)) (not (= (_1!12661 (h!38122 (toList!11387 lt!673608))) (_1!12661 (tuple2!25301 (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26401 (select (arr!50544 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3921 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!164213 c!145254) b!1569111))

(assert (= (and d!164213 (not c!145254)) b!1569112))

(assert (= (and b!1569112 c!145255) b!1569113))

(assert (= (and b!1569112 (not c!145255)) b!1569114))

(declare-fun m!1444029 () Bool)

(assert (=> b!1569113 m!1444029))

(assert (=> b!1568840 d!164213))

(assert (=> d!163951 d!163953))

(assert (=> d!163951 d!163955))

(declare-fun d!164215 () Bool)

(assert (=> d!164215 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!164215 true))

(declare-fun _$12!490 () Unit!51941)

(assert (=> d!164215 (= (choose!2069 (toList!11387 lt!673449) #b0000000000000000000000000000000000000000000000000000000000000000) _$12!490)))

(declare-fun bs!45107 () Bool)

(assert (= bs!45107 d!164215))

(assert (=> bs!45107 m!1443445))

(assert (=> bs!45107 m!1443445))

(assert (=> bs!45107 m!1443447))

(assert (=> d!163951 d!164215))

(assert (=> d!163951 d!164123))

(declare-fun b!1569117 () Bool)

(declare-fun e!874788 () Option!864)

(assert (=> b!1569117 (= e!874788 (getValueByKey!789 (t!51553 (toList!11387 lt!673600)) (_1!12661 (tuple2!25301 lt!673519 lt!673523))))))

(declare-fun b!1569115 () Bool)

(declare-fun e!874787 () Option!864)

(assert (=> b!1569115 (= e!874787 (Some!863 (_2!12661 (h!38122 (toList!11387 lt!673600)))))))

(declare-fun b!1569118 () Bool)

(assert (=> b!1569118 (= e!874788 None!862)))

(declare-fun c!145256 () Bool)

(declare-fun d!164217 () Bool)

(assert (=> d!164217 (= c!145256 (and ((_ is Cons!36658) (toList!11387 lt!673600)) (= (_1!12661 (h!38122 (toList!11387 lt!673600))) (_1!12661 (tuple2!25301 lt!673519 lt!673523)))))))

(assert (=> d!164217 (= (getValueByKey!789 (toList!11387 lt!673600) (_1!12661 (tuple2!25301 lt!673519 lt!673523))) e!874787)))

(declare-fun b!1569116 () Bool)

(assert (=> b!1569116 (= e!874787 e!874788)))

(declare-fun c!145257 () Bool)

(assert (=> b!1569116 (= c!145257 (and ((_ is Cons!36658) (toList!11387 lt!673600)) (not (= (_1!12661 (h!38122 (toList!11387 lt!673600))) (_1!12661 (tuple2!25301 lt!673519 lt!673523))))))))

(assert (= (and d!164217 c!145256) b!1569115))

(assert (= (and d!164217 (not c!145256)) b!1569116))

(assert (= (and b!1569116 c!145257) b!1569117))

(assert (= (and b!1569116 (not c!145257)) b!1569118))

(declare-fun m!1444031 () Bool)

(assert (=> b!1569117 m!1444031))

(assert (=> b!1568835 d!164217))

(assert (=> b!1568733 d!164075))

(declare-fun d!164219 () Bool)

(assert (=> d!164219 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun lt!673701 () Unit!51941)

(assert (=> d!164219 (= lt!673701 (choose!2069 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun e!874789 () Bool)

(assert (=> d!164219 e!874789))

(declare-fun res!1071626 () Bool)

(assert (=> d!164219 (=> (not res!1071626) (not e!874789))))

(assert (=> d!164219 (= res!1071626 (isStrictlySorted!973 (toList!11387 lt!673520)))))

(assert (=> d!164219 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) lt!673701)))

(declare-fun b!1569119 () Bool)

(assert (=> b!1569119 (= e!874789 (containsKey!851 (toList!11387 lt!673520) (select (arr!50543 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (= (and d!164219 res!1071626) b!1569119))

(assert (=> d!164219 m!1443413))

(assert (=> d!164219 m!1443577))

(assert (=> d!164219 m!1443577))

(assert (=> d!164219 m!1443579))

(assert (=> d!164219 m!1443413))

(declare-fun m!1444033 () Bool)

(assert (=> d!164219 m!1444033))

(assert (=> d!164219 m!1443689))

(assert (=> b!1569119 m!1443413))

(assert (=> b!1569119 m!1443573))

(assert (=> b!1568781 d!164219))

(assert (=> b!1568781 d!164211))

(assert (=> b!1568781 d!164191))

(assert (=> d!163945 d!163947))

(assert (=> d!163945 d!163949))

(declare-fun d!164221 () Bool)

(assert (=> d!164221 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)))))

(assert (=> d!164221 true))

(declare-fun _$12!491 () Unit!51941)

(assert (=> d!164221 (= (choose!2069 (toList!11387 lt!673449) (select (arr!50543 _keys!637) from!782)) _$12!491)))

(declare-fun bs!45108 () Bool)

(assert (= bs!45108 d!164221))

(assert (=> bs!45108 m!1443273))

(assert (=> bs!45108 m!1443377))

(assert (=> bs!45108 m!1443377))

(assert (=> bs!45108 m!1443379))

(assert (=> d!163945 d!164221))

(assert (=> d!163945 d!164123))

(declare-fun d!164223 () Bool)

(assert (=> d!164223 (isDefined!580 (getValueByKey!789 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673702 () Unit!51941)

(assert (=> d!164223 (= lt!673702 (choose!2069 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874790 () Bool)

(assert (=> d!164223 e!874790))

(declare-fun res!1071627 () Bool)

(assert (=> d!164223 (=> (not res!1071627) (not e!874790))))

(assert (=> d!164223 (= res!1071627 (isStrictlySorted!973 (toList!11387 lt!673520)))))

(assert (=> d!164223 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!534 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000) lt!673702)))

(declare-fun b!1569120 () Bool)

(assert (=> b!1569120 (= e!874790 (containsKey!851 (toList!11387 lt!673520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!164223 res!1071627) b!1569120))

(assert (=> d!164223 m!1443661))

(assert (=> d!164223 m!1443661))

(assert (=> d!164223 m!1443663))

(declare-fun m!1444035 () Bool)

(assert (=> d!164223 m!1444035))

(assert (=> d!164223 m!1443689))

(assert (=> b!1569120 m!1443657))

(assert (=> b!1568845 d!164223))

(assert (=> b!1568845 d!164157))

(assert (=> b!1568845 d!164159))

(declare-fun condMapEmpty!59841 () Bool)

(declare-fun mapDefault!59841 () ValueCell!18449)

(assert (=> mapNonEmpty!59840 (= condMapEmpty!59841 (= mapRest!59840 ((as const (Array (_ BitVec 32) ValueCell!18449)) mapDefault!59841)))))

(declare-fun e!874792 () Bool)

(declare-fun mapRes!59841 () Bool)

(assert (=> mapNonEmpty!59840 (= tp!113873 (and e!874792 mapRes!59841))))

(declare-fun b!1569122 () Bool)

(assert (=> b!1569122 (= e!874792 tp_is_empty!38959)))

(declare-fun mapNonEmpty!59841 () Bool)

(declare-fun tp!113874 () Bool)

(declare-fun e!874791 () Bool)

(assert (=> mapNonEmpty!59841 (= mapRes!59841 (and tp!113874 e!874791))))

(declare-fun mapRest!59841 () (Array (_ BitVec 32) ValueCell!18449))

(declare-fun mapValue!59841 () ValueCell!18449)

(declare-fun mapKey!59841 () (_ BitVec 32))

(assert (=> mapNonEmpty!59841 (= mapRest!59840 (store mapRest!59841 mapKey!59841 mapValue!59841))))

(declare-fun b!1569121 () Bool)

(assert (=> b!1569121 (= e!874791 tp_is_empty!38959)))

(declare-fun mapIsEmpty!59841 () Bool)

(assert (=> mapIsEmpty!59841 mapRes!59841))

(assert (= (and mapNonEmpty!59840 condMapEmpty!59841) mapIsEmpty!59841))

(assert (= (and mapNonEmpty!59840 (not condMapEmpty!59841)) mapNonEmpty!59841))

(assert (= (and mapNonEmpty!59841 ((_ is ValueCellFull!18449) mapValue!59841)) b!1569121))

(assert (= (and mapNonEmpty!59840 ((_ is ValueCellFull!18449) mapDefault!59841)) b!1569122))

(declare-fun m!1444037 () Bool)

(assert (=> mapNonEmpty!59841 m!1444037))

(declare-fun b_lambda!25021 () Bool)

(assert (= b_lambda!25019 (or (and start!134374 b_free!32185) b_lambda!25021)))

(declare-fun b_lambda!25023 () Bool)

(assert (= b_lambda!25017 (or (and start!134374 b_free!32185) b_lambda!25023)))

(check-sat (not b!1569110) (not d!164219) (not b!1569091) (not b!1569057) (not b!1569033) (not b!1568881) (not b!1568910) (not b!1568904) (not b!1568900) (not b!1568955) (not d!164053) (not b!1569040) (not b!1569031) (not b!1569097) (not b_lambda!25015) (not b!1568889) (not d!164181) (not d!164083) (not b!1569069) (not b!1569018) (not d!164195) (not b!1568977) (not b!1569007) (not b!1568869) (not b!1569028) (not b!1569076) (not b!1569062) (not b_lambda!24999) (not b!1569094) (not d!164151) (not b!1569085) (not d!164097) (not b!1569021) (not d!164135) (not b!1569038) (not b!1569117) (not b!1568918) (not b!1568867) (not b!1568966) (not d!164139) (not b!1568883) (not b!1569079) (not d!164129) (not d!164155) (not b_lambda!25013) (not mapNonEmpty!59841) (not d!164043) (not d!164089) (not d!164033) (not b!1569025) (not d!164157) (not b!1568921) (not b!1569015) (not b_lambda!25021) (not b!1568882) (not b!1569043) (not b!1569066) (not b!1568915) (not d!164205) (not d!164193) (not b!1569087) (not d!164057) (not d!164067) (not b!1569045) (not d!164035) (not d!164223) (not b!1569023) (not b!1568967) (not b!1568964) (not bm!72051) (not d!164117) (not b!1569106) (not b!1569054) (not b!1568926) (not b!1568899) (not d!164153) (not d!164105) (not b!1568894) (not d!164051) (not b!1568959) (not d!164197) (not b!1568870) (not b!1569083) (not bm!72061) (not b_next!32185) (not b!1568913) (not b!1568931) (not b!1568928) (not b!1568877) (not d!164147) (not b!1569102) (not bm!72057) (not b!1568979) (not b!1568920) (not bm!72060) (not b!1568884) (not b!1568903) (not b!1568992) (not b!1569119) (not b!1569104) (not b!1568886) (not b!1568912) (not d!164087) (not b!1568961) (not d!164071) (not d!164073) (not b!1569099) (not b!1568989) tp_is_empty!38959 (not b!1569052) (not d!164211) (not b!1569073) (not d!164137) (not b!1568887) (not b!1568987) (not b!1569041) (not bm!72062) (not b!1568873) (not d!164121) (not d!164055) b_and!51835 (not d!164171) (not b!1569013) (not d!164169) (not b!1568898) (not d!164215) (not b!1569113) (not b!1568972) (not d!164183) (not d!164145) (not d!164161) (not b!1569047) (not d!164133) (not b!1568907) (not d!164077) (not b!1569088) (not b!1569071) (not b!1569064) (not bm!72054) (not b!1568888) (not d!164221) (not b!1568892) (not d!164119) (not b!1568974) (not b!1568901) (not b_lambda!25007) (not b!1569081) (not b!1569108) (not b!1569078) (not b!1568895) (not b!1569120) (not d!164163) (not d!164199) (not b!1569060) (not d!164039) (not d!164113) (not b!1569074) (not b!1568897) (not b_lambda!25005) (not b_lambda!25023) (not b!1568985))
(check-sat b_and!51835 (not b_next!32185))
