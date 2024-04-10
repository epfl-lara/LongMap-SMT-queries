; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108604 () Bool)

(assert start!108604)

(declare-fun b_free!28131 () Bool)

(declare-fun b_next!28131 () Bool)

(assert (=> start!108604 (= b_free!28131 (not b_next!28131))))

(declare-fun tp!99505 () Bool)

(declare-fun b_and!46195 () Bool)

(assert (=> start!108604 (= tp!99505 b_and!46195)))

(declare-fun mapIsEmpty!52211 () Bool)

(declare-fun mapRes!52211 () Bool)

(assert (=> mapIsEmpty!52211 mapRes!52211))

(declare-fun mapNonEmpty!52211 () Bool)

(declare-fun tp!99506 () Bool)

(declare-fun e!732469 () Bool)

(assert (=> mapNonEmpty!52211 (= mapRes!52211 (and tp!99506 e!732469))))

(declare-datatypes ((V!50131 0))(
  ( (V!50132 (val!16960 Int)) )
))
(declare-datatypes ((ValueCell!15987 0))(
  ( (ValueCellFull!15987 (v!19561 V!50131)) (EmptyCell!15987) )
))
(declare-fun mapRest!52211 () (Array (_ BitVec 32) ValueCell!15987))

(declare-fun mapKey!52211 () (_ BitVec 32))

(declare-datatypes ((array!84610 0))(
  ( (array!84611 (arr!40808 (Array (_ BitVec 32) ValueCell!15987)) (size!41358 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84610)

(declare-fun mapValue!52211 () ValueCell!15987)

(assert (=> mapNonEmpty!52211 (= (arr!40808 _values!1445) (store mapRest!52211 mapKey!52211 mapValue!52211))))

(declare-fun b!1281996 () Bool)

(declare-fun res!851578 () Bool)

(declare-fun e!732473 () Bool)

(assert (=> b!1281996 (=> (not res!851578) (not e!732473))))

(declare-datatypes ((array!84612 0))(
  ( (array!84613 (arr!40809 (Array (_ BitVec 32) (_ BitVec 64))) (size!41359 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84612)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84612 (_ BitVec 32)) Bool)

(assert (=> b!1281996 (= res!851578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun b!1281997 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1281997 (= e!732473 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41359 _keys!1741)) (= (select (arr!40809 _keys!1741) from!2144) k0!1205) (bvsge (size!41359 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun b!1281998 () Bool)

(declare-fun res!851582 () Bool)

(assert (=> b!1281998 (=> (not res!851582) (not e!732473))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281998 (= res!851582 (and (= (size!41358 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41359 _keys!1741) (size!41358 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281999 () Bool)

(declare-fun res!851580 () Bool)

(assert (=> b!1281999 (=> (not res!851580) (not e!732473))))

(assert (=> b!1281999 (= res!851580 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41359 _keys!1741))))))

(declare-fun b!1282000 () Bool)

(declare-fun e!732470 () Bool)

(declare-fun tp_is_empty!33771 () Bool)

(assert (=> b!1282000 (= e!732470 tp_is_empty!33771)))

(declare-fun res!851583 () Bool)

(assert (=> start!108604 (=> (not res!851583) (not e!732473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108604 (= res!851583 (validMask!0 mask!2175))))

(assert (=> start!108604 e!732473))

(assert (=> start!108604 tp_is_empty!33771))

(assert (=> start!108604 true))

(declare-fun e!732471 () Bool)

(declare-fun array_inv!30965 (array!84610) Bool)

(assert (=> start!108604 (and (array_inv!30965 _values!1445) e!732471)))

(declare-fun array_inv!30966 (array!84612) Bool)

(assert (=> start!108604 (array_inv!30966 _keys!1741)))

(assert (=> start!108604 tp!99505))

(declare-fun b!1282001 () Bool)

(declare-fun res!851579 () Bool)

(assert (=> b!1282001 (=> (not res!851579) (not e!732473))))

(declare-datatypes ((List!28911 0))(
  ( (Nil!28908) (Cons!28907 (h!30116 (_ BitVec 64)) (t!42453 List!28911)) )
))
(declare-fun arrayNoDuplicates!0 (array!84612 (_ BitVec 32) List!28911) Bool)

(assert (=> b!1282001 (= res!851579 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28908))))

(declare-fun b!1282002 () Bool)

(declare-fun res!851581 () Bool)

(assert (=> b!1282002 (=> (not res!851581) (not e!732473))))

(declare-fun minValue!1387 () V!50131)

(declare-fun zeroValue!1387 () V!50131)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21718 0))(
  ( (tuple2!21719 (_1!10870 (_ BitVec 64)) (_2!10870 V!50131)) )
))
(declare-datatypes ((List!28912 0))(
  ( (Nil!28909) (Cons!28908 (h!30117 tuple2!21718) (t!42454 List!28912)) )
))
(declare-datatypes ((ListLongMap!19375 0))(
  ( (ListLongMap!19376 (toList!9703 List!28912)) )
))
(declare-fun contains!7819 (ListLongMap!19375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4787 (array!84612 array!84610 (_ BitVec 32) (_ BitVec 32) V!50131 V!50131 (_ BitVec 32) Int) ListLongMap!19375)

(assert (=> b!1282002 (= res!851581 (contains!7819 (getCurrentListMap!4787 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282003 () Bool)

(assert (=> b!1282003 (= e!732469 tp_is_empty!33771)))

(declare-fun b!1282004 () Bool)

(assert (=> b!1282004 (= e!732471 (and e!732470 mapRes!52211))))

(declare-fun condMapEmpty!52211 () Bool)

(declare-fun mapDefault!52211 () ValueCell!15987)

(assert (=> b!1282004 (= condMapEmpty!52211 (= (arr!40808 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15987)) mapDefault!52211)))))

(assert (= (and start!108604 res!851583) b!1281998))

(assert (= (and b!1281998 res!851582) b!1281996))

(assert (= (and b!1281996 res!851578) b!1282001))

(assert (= (and b!1282001 res!851579) b!1281999))

(assert (= (and b!1281999 res!851580) b!1282002))

(assert (= (and b!1282002 res!851581) b!1281997))

(assert (= (and b!1282004 condMapEmpty!52211) mapIsEmpty!52211))

(assert (= (and b!1282004 (not condMapEmpty!52211)) mapNonEmpty!52211))

(get-info :version)

(assert (= (and mapNonEmpty!52211 ((_ is ValueCellFull!15987) mapValue!52211)) b!1282003))

(assert (= (and b!1282004 ((_ is ValueCellFull!15987) mapDefault!52211)) b!1282000))

(assert (= start!108604 b!1282004))

(declare-fun m!1176335 () Bool)

(assert (=> b!1282002 m!1176335))

(assert (=> b!1282002 m!1176335))

(declare-fun m!1176337 () Bool)

(assert (=> b!1282002 m!1176337))

(declare-fun m!1176339 () Bool)

(assert (=> start!108604 m!1176339))

(declare-fun m!1176341 () Bool)

(assert (=> start!108604 m!1176341))

(declare-fun m!1176343 () Bool)

(assert (=> start!108604 m!1176343))

(declare-fun m!1176345 () Bool)

(assert (=> mapNonEmpty!52211 m!1176345))

(declare-fun m!1176347 () Bool)

(assert (=> b!1281996 m!1176347))

(declare-fun m!1176349 () Bool)

(assert (=> b!1281997 m!1176349))

(declare-fun m!1176351 () Bool)

(assert (=> b!1282001 m!1176351))

(check-sat (not b!1282001) (not mapNonEmpty!52211) b_and!46195 (not b_next!28131) (not b!1282002) (not start!108604) (not b!1281996) tp_is_empty!33771)
(check-sat b_and!46195 (not b_next!28131))
(get-model)

(declare-fun d!140673 () Bool)

(declare-fun res!851606 () Bool)

(declare-fun e!732497 () Bool)

(assert (=> d!140673 (=> res!851606 e!732497)))

(assert (=> d!140673 (= res!851606 (bvsge #b00000000000000000000000000000000 (size!41359 _keys!1741)))))

(assert (=> d!140673 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!732497)))

(declare-fun bm!62750 () Bool)

(declare-fun call!62753 () Bool)

(assert (=> bm!62750 (= call!62753 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1282040 () Bool)

(declare-fun e!732495 () Bool)

(assert (=> b!1282040 (= e!732497 e!732495)))

(declare-fun c!124078 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282040 (= c!124078 (validKeyInArray!0 (select (arr!40809 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1282041 () Bool)

(declare-fun e!732496 () Bool)

(assert (=> b!1282041 (= e!732496 call!62753)))

(declare-fun b!1282042 () Bool)

(assert (=> b!1282042 (= e!732495 call!62753)))

(declare-fun b!1282043 () Bool)

(assert (=> b!1282043 (= e!732495 e!732496)))

(declare-fun lt!576416 () (_ BitVec 64))

(assert (=> b!1282043 (= lt!576416 (select (arr!40809 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42457 0))(
  ( (Unit!42458) )
))
(declare-fun lt!576417 () Unit!42457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84612 (_ BitVec 64) (_ BitVec 32)) Unit!42457)

(assert (=> b!1282043 (= lt!576417 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!576416 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1282043 (arrayContainsKey!0 _keys!1741 lt!576416 #b00000000000000000000000000000000)))

(declare-fun lt!576418 () Unit!42457)

(assert (=> b!1282043 (= lt!576418 lt!576417)))

(declare-fun res!851607 () Bool)

(declare-datatypes ((SeekEntryResult!10013 0))(
  ( (MissingZero!10013 (index!42423 (_ BitVec 32))) (Found!10013 (index!42424 (_ BitVec 32))) (Intermediate!10013 (undefined!10825 Bool) (index!42425 (_ BitVec 32)) (x!113712 (_ BitVec 32))) (Undefined!10013) (MissingVacant!10013 (index!42426 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84612 (_ BitVec 32)) SeekEntryResult!10013)

(assert (=> b!1282043 (= res!851607 (= (seekEntryOrOpen!0 (select (arr!40809 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10013 #b00000000000000000000000000000000)))))

(assert (=> b!1282043 (=> (not res!851607) (not e!732496))))

(assert (= (and d!140673 (not res!851606)) b!1282040))

(assert (= (and b!1282040 c!124078) b!1282043))

(assert (= (and b!1282040 (not c!124078)) b!1282042))

(assert (= (and b!1282043 res!851607) b!1282041))

(assert (= (or b!1282041 b!1282042) bm!62750))

(declare-fun m!1176371 () Bool)

(assert (=> bm!62750 m!1176371))

(declare-fun m!1176373 () Bool)

(assert (=> b!1282040 m!1176373))

(assert (=> b!1282040 m!1176373))

(declare-fun m!1176375 () Bool)

(assert (=> b!1282040 m!1176375))

(assert (=> b!1282043 m!1176373))

(declare-fun m!1176377 () Bool)

(assert (=> b!1282043 m!1176377))

(declare-fun m!1176379 () Bool)

(assert (=> b!1282043 m!1176379))

(assert (=> b!1282043 m!1176373))

(declare-fun m!1176381 () Bool)

(assert (=> b!1282043 m!1176381))

(assert (=> b!1281996 d!140673))

(declare-fun b!1282054 () Bool)

(declare-fun e!732506 () Bool)

(declare-fun contains!7820 (List!28911 (_ BitVec 64)) Bool)

(assert (=> b!1282054 (= e!732506 (contains!7820 Nil!28908 (select (arr!40809 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1282055 () Bool)

(declare-fun e!732507 () Bool)

(declare-fun call!62756 () Bool)

(assert (=> b!1282055 (= e!732507 call!62756)))

(declare-fun d!140675 () Bool)

(declare-fun res!851615 () Bool)

(declare-fun e!732508 () Bool)

(assert (=> d!140675 (=> res!851615 e!732508)))

(assert (=> d!140675 (= res!851615 (bvsge #b00000000000000000000000000000000 (size!41359 _keys!1741)))))

(assert (=> d!140675 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28908) e!732508)))

(declare-fun b!1282056 () Bool)

(declare-fun e!732509 () Bool)

(assert (=> b!1282056 (= e!732508 e!732509)))

(declare-fun res!851614 () Bool)

(assert (=> b!1282056 (=> (not res!851614) (not e!732509))))

(assert (=> b!1282056 (= res!851614 (not e!732506))))

(declare-fun res!851616 () Bool)

(assert (=> b!1282056 (=> (not res!851616) (not e!732506))))

(assert (=> b!1282056 (= res!851616 (validKeyInArray!0 (select (arr!40809 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1282057 () Bool)

(assert (=> b!1282057 (= e!732507 call!62756)))

(declare-fun bm!62753 () Bool)

(declare-fun c!124081 () Bool)

(assert (=> bm!62753 (= call!62756 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124081 (Cons!28907 (select (arr!40809 _keys!1741) #b00000000000000000000000000000000) Nil!28908) Nil!28908)))))

(declare-fun b!1282058 () Bool)

(assert (=> b!1282058 (= e!732509 e!732507)))

(assert (=> b!1282058 (= c!124081 (validKeyInArray!0 (select (arr!40809 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!140675 (not res!851615)) b!1282056))

(assert (= (and b!1282056 res!851616) b!1282054))

(assert (= (and b!1282056 res!851614) b!1282058))

(assert (= (and b!1282058 c!124081) b!1282055))

(assert (= (and b!1282058 (not c!124081)) b!1282057))

(assert (= (or b!1282055 b!1282057) bm!62753))

(assert (=> b!1282054 m!1176373))

(assert (=> b!1282054 m!1176373))

(declare-fun m!1176383 () Bool)

(assert (=> b!1282054 m!1176383))

(assert (=> b!1282056 m!1176373))

(assert (=> b!1282056 m!1176373))

(assert (=> b!1282056 m!1176375))

(assert (=> bm!62753 m!1176373))

(declare-fun m!1176385 () Bool)

(assert (=> bm!62753 m!1176385))

(assert (=> b!1282058 m!1176373))

(assert (=> b!1282058 m!1176373))

(assert (=> b!1282058 m!1176375))

(assert (=> b!1282001 d!140675))

(declare-fun d!140677 () Bool)

(declare-fun e!732515 () Bool)

(assert (=> d!140677 e!732515))

(declare-fun res!851619 () Bool)

(assert (=> d!140677 (=> res!851619 e!732515)))

(declare-fun lt!576427 () Bool)

(assert (=> d!140677 (= res!851619 (not lt!576427))))

(declare-fun lt!576430 () Bool)

(assert (=> d!140677 (= lt!576427 lt!576430)))

(declare-fun lt!576428 () Unit!42457)

(declare-fun e!732514 () Unit!42457)

(assert (=> d!140677 (= lt!576428 e!732514)))

(declare-fun c!124084 () Bool)

(assert (=> d!140677 (= c!124084 lt!576430)))

(declare-fun containsKey!715 (List!28912 (_ BitVec 64)) Bool)

(assert (=> d!140677 (= lt!576430 (containsKey!715 (toList!9703 (getCurrentListMap!4787 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!140677 (= (contains!7819 (getCurrentListMap!4787 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!576427)))

(declare-fun b!1282065 () Bool)

(declare-fun lt!576429 () Unit!42457)

(assert (=> b!1282065 (= e!732514 lt!576429)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!461 (List!28912 (_ BitVec 64)) Unit!42457)

(assert (=> b!1282065 (= lt!576429 (lemmaContainsKeyImpliesGetValueByKeyDefined!461 (toList!9703 (getCurrentListMap!4787 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!745 0))(
  ( (Some!744 (v!19563 V!50131)) (None!743) )
))
(declare-fun isDefined!500 (Option!745) Bool)

(declare-fun getValueByKey!693 (List!28912 (_ BitVec 64)) Option!745)

(assert (=> b!1282065 (isDefined!500 (getValueByKey!693 (toList!9703 (getCurrentListMap!4787 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1282066 () Bool)

(declare-fun Unit!42459 () Unit!42457)

(assert (=> b!1282066 (= e!732514 Unit!42459)))

(declare-fun b!1282067 () Bool)

(assert (=> b!1282067 (= e!732515 (isDefined!500 (getValueByKey!693 (toList!9703 (getCurrentListMap!4787 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140677 c!124084) b!1282065))

(assert (= (and d!140677 (not c!124084)) b!1282066))

(assert (= (and d!140677 (not res!851619)) b!1282067))

(declare-fun m!1176387 () Bool)

(assert (=> d!140677 m!1176387))

(declare-fun m!1176389 () Bool)

(assert (=> b!1282065 m!1176389))

(declare-fun m!1176391 () Bool)

(assert (=> b!1282065 m!1176391))

(assert (=> b!1282065 m!1176391))

(declare-fun m!1176393 () Bool)

(assert (=> b!1282065 m!1176393))

(assert (=> b!1282067 m!1176391))

(assert (=> b!1282067 m!1176391))

(assert (=> b!1282067 m!1176393))

(assert (=> b!1282002 d!140677))

(declare-fun b!1282110 () Bool)

(declare-fun e!732552 () Bool)

(declare-fun call!62777 () Bool)

(assert (=> b!1282110 (= e!732552 (not call!62777))))

(declare-fun bm!62768 () Bool)

(declare-fun call!62774 () ListLongMap!19375)

(declare-fun call!62771 () ListLongMap!19375)

(assert (=> bm!62768 (= call!62774 call!62771)))

(declare-fun b!1282111 () Bool)

(declare-fun e!732550 () Bool)

(declare-fun e!732546 () Bool)

(assert (=> b!1282111 (= e!732550 e!732546)))

(declare-fun c!124098 () Bool)

(assert (=> b!1282111 (= c!124098 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1282112 () Bool)

(declare-fun e!732542 () Bool)

(assert (=> b!1282112 (= e!732542 (validKeyInArray!0 (select (arr!40809 _keys!1741) from!2144)))))

(declare-fun bm!62769 () Bool)

(declare-fun call!62773 () ListLongMap!19375)

(declare-fun call!62772 () ListLongMap!19375)

(assert (=> bm!62769 (= call!62773 call!62772)))

(declare-fun b!1282113 () Bool)

(declare-fun res!851640 () Bool)

(assert (=> b!1282113 (=> (not res!851640) (not e!732550))))

(assert (=> b!1282113 (= res!851640 e!732552)))

(declare-fun c!124099 () Bool)

(assert (=> b!1282113 (= c!124099 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1282114 () Bool)

(declare-fun e!732551 () Bool)

(declare-fun e!732547 () Bool)

(assert (=> b!1282114 (= e!732551 e!732547)))

(declare-fun res!851644 () Bool)

(assert (=> b!1282114 (=> (not res!851644) (not e!732547))))

(declare-fun lt!576482 () ListLongMap!19375)

(assert (=> b!1282114 (= res!851644 (contains!7819 lt!576482 (select (arr!40809 _keys!1741) from!2144)))))

(assert (=> b!1282114 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41359 _keys!1741)))))

(declare-fun b!1282115 () Bool)

(declare-fun e!732544 () ListLongMap!19375)

(assert (=> b!1282115 (= e!732544 call!62774)))

(declare-fun d!140679 () Bool)

(assert (=> d!140679 e!732550))

(declare-fun res!851638 () Bool)

(assert (=> d!140679 (=> (not res!851638) (not e!732550))))

(assert (=> d!140679 (= res!851638 (or (bvsge from!2144 (size!41359 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41359 _keys!1741)))))))

(declare-fun lt!576483 () ListLongMap!19375)

(assert (=> d!140679 (= lt!576482 lt!576483)))

(declare-fun lt!576491 () Unit!42457)

(declare-fun e!732543 () Unit!42457)

(assert (=> d!140679 (= lt!576491 e!732543)))

(declare-fun c!124100 () Bool)

(assert (=> d!140679 (= c!124100 e!732542)))

(declare-fun res!851643 () Bool)

(assert (=> d!140679 (=> (not res!851643) (not e!732542))))

(assert (=> d!140679 (= res!851643 (bvslt from!2144 (size!41359 _keys!1741)))))

(declare-fun e!732545 () ListLongMap!19375)

(assert (=> d!140679 (= lt!576483 e!732545)))

(declare-fun c!124101 () Bool)

(assert (=> d!140679 (= c!124101 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140679 (validMask!0 mask!2175)))

(assert (=> d!140679 (= (getCurrentListMap!4787 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!576482)))

(declare-fun b!1282116 () Bool)

(declare-fun apply!1010 (ListLongMap!19375 (_ BitVec 64)) V!50131)

(declare-fun get!20759 (ValueCell!15987 V!50131) V!50131)

(declare-fun dynLambda!3408 (Int (_ BitVec 64)) V!50131)

(assert (=> b!1282116 (= e!732547 (= (apply!1010 lt!576482 (select (arr!40809 _keys!1741) from!2144)) (get!20759 (select (arr!40808 _values!1445) from!2144) (dynLambda!3408 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1282116 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41358 _values!1445)))))

(assert (=> b!1282116 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41359 _keys!1741)))))

(declare-fun b!1282117 () Bool)

(declare-fun c!124097 () Bool)

(assert (=> b!1282117 (= c!124097 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!732548 () ListLongMap!19375)

(assert (=> b!1282117 (= e!732544 e!732548)))

(declare-fun b!1282118 () Bool)

(declare-fun call!62775 () Bool)

(assert (=> b!1282118 (= e!732546 (not call!62775))))

(declare-fun b!1282119 () Bool)

(declare-fun e!732549 () Bool)

(assert (=> b!1282119 (= e!732549 (= (apply!1010 lt!576482 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1282120 () Bool)

(declare-fun e!732554 () Bool)

(assert (=> b!1282120 (= e!732546 e!732554)))

(declare-fun res!851645 () Bool)

(assert (=> b!1282120 (= res!851645 call!62775)))

(assert (=> b!1282120 (=> (not res!851645) (not e!732554))))

(declare-fun call!62776 () ListLongMap!19375)

(declare-fun bm!62770 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5903 (array!84612 array!84610 (_ BitVec 32) (_ BitVec 32) V!50131 V!50131 (_ BitVec 32) Int) ListLongMap!19375)

(assert (=> bm!62770 (= call!62776 (getCurrentListMapNoExtraKeys!5903 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1282121 () Bool)

(assert (=> b!1282121 (= e!732552 e!732549)))

(declare-fun res!851642 () Bool)

(assert (=> b!1282121 (= res!851642 call!62777)))

(assert (=> b!1282121 (=> (not res!851642) (not e!732549))))

(declare-fun b!1282122 () Bool)

(assert (=> b!1282122 (= e!732554 (= (apply!1010 lt!576482 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!62771 () Bool)

(assert (=> bm!62771 (= call!62777 (contains!7819 lt!576482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!124102 () Bool)

(declare-fun bm!62772 () Bool)

(declare-fun +!4273 (ListLongMap!19375 tuple2!21718) ListLongMap!19375)

(assert (=> bm!62772 (= call!62771 (+!4273 (ite c!124101 call!62776 (ite c!124102 call!62772 call!62773)) (ite (or c!124101 c!124102) (tuple2!21719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1282123 () Bool)

(assert (=> b!1282123 (= e!732548 call!62773)))

(declare-fun b!1282124 () Bool)

(declare-fun Unit!42460 () Unit!42457)

(assert (=> b!1282124 (= e!732543 Unit!42460)))

(declare-fun b!1282125 () Bool)

(assert (=> b!1282125 (= e!732545 e!732544)))

(assert (=> b!1282125 (= c!124102 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62773 () Bool)

(assert (=> bm!62773 (= call!62775 (contains!7819 lt!576482 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1282126 () Bool)

(declare-fun e!732553 () Bool)

(assert (=> b!1282126 (= e!732553 (validKeyInArray!0 (select (arr!40809 _keys!1741) from!2144)))))

(declare-fun b!1282127 () Bool)

(assert (=> b!1282127 (= e!732545 (+!4273 call!62771 (tuple2!21719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1282128 () Bool)

(declare-fun res!851646 () Bool)

(assert (=> b!1282128 (=> (not res!851646) (not e!732550))))

(assert (=> b!1282128 (= res!851646 e!732551)))

(declare-fun res!851641 () Bool)

(assert (=> b!1282128 (=> res!851641 e!732551)))

(assert (=> b!1282128 (= res!851641 (not e!732553))))

(declare-fun res!851639 () Bool)

(assert (=> b!1282128 (=> (not res!851639) (not e!732553))))

(assert (=> b!1282128 (= res!851639 (bvslt from!2144 (size!41359 _keys!1741)))))

(declare-fun bm!62774 () Bool)

(assert (=> bm!62774 (= call!62772 call!62776)))

(declare-fun b!1282129 () Bool)

(declare-fun lt!576479 () Unit!42457)

(assert (=> b!1282129 (= e!732543 lt!576479)))

(declare-fun lt!576488 () ListLongMap!19375)

(assert (=> b!1282129 (= lt!576488 (getCurrentListMapNoExtraKeys!5903 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576480 () (_ BitVec 64))

(assert (=> b!1282129 (= lt!576480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576494 () (_ BitVec 64))

(assert (=> b!1282129 (= lt!576494 (select (arr!40809 _keys!1741) from!2144))))

(declare-fun lt!576487 () Unit!42457)

(declare-fun addStillContains!1098 (ListLongMap!19375 (_ BitVec 64) V!50131 (_ BitVec 64)) Unit!42457)

(assert (=> b!1282129 (= lt!576487 (addStillContains!1098 lt!576488 lt!576480 zeroValue!1387 lt!576494))))

(assert (=> b!1282129 (contains!7819 (+!4273 lt!576488 (tuple2!21719 lt!576480 zeroValue!1387)) lt!576494)))

(declare-fun lt!576477 () Unit!42457)

(assert (=> b!1282129 (= lt!576477 lt!576487)))

(declare-fun lt!576481 () ListLongMap!19375)

(assert (=> b!1282129 (= lt!576481 (getCurrentListMapNoExtraKeys!5903 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576475 () (_ BitVec 64))

(assert (=> b!1282129 (= lt!576475 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576484 () (_ BitVec 64))

(assert (=> b!1282129 (= lt!576484 (select (arr!40809 _keys!1741) from!2144))))

(declare-fun lt!576478 () Unit!42457)

(declare-fun addApplyDifferent!552 (ListLongMap!19375 (_ BitVec 64) V!50131 (_ BitVec 64)) Unit!42457)

(assert (=> b!1282129 (= lt!576478 (addApplyDifferent!552 lt!576481 lt!576475 minValue!1387 lt!576484))))

(assert (=> b!1282129 (= (apply!1010 (+!4273 lt!576481 (tuple2!21719 lt!576475 minValue!1387)) lt!576484) (apply!1010 lt!576481 lt!576484))))

(declare-fun lt!576495 () Unit!42457)

(assert (=> b!1282129 (= lt!576495 lt!576478)))

(declare-fun lt!576476 () ListLongMap!19375)

(assert (=> b!1282129 (= lt!576476 (getCurrentListMapNoExtraKeys!5903 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576490 () (_ BitVec 64))

(assert (=> b!1282129 (= lt!576490 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576486 () (_ BitVec 64))

(assert (=> b!1282129 (= lt!576486 (select (arr!40809 _keys!1741) from!2144))))

(declare-fun lt!576485 () Unit!42457)

(assert (=> b!1282129 (= lt!576485 (addApplyDifferent!552 lt!576476 lt!576490 zeroValue!1387 lt!576486))))

(assert (=> b!1282129 (= (apply!1010 (+!4273 lt!576476 (tuple2!21719 lt!576490 zeroValue!1387)) lt!576486) (apply!1010 lt!576476 lt!576486))))

(declare-fun lt!576492 () Unit!42457)

(assert (=> b!1282129 (= lt!576492 lt!576485)))

(declare-fun lt!576489 () ListLongMap!19375)

(assert (=> b!1282129 (= lt!576489 (getCurrentListMapNoExtraKeys!5903 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576496 () (_ BitVec 64))

(assert (=> b!1282129 (= lt!576496 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576493 () (_ BitVec 64))

(assert (=> b!1282129 (= lt!576493 (select (arr!40809 _keys!1741) from!2144))))

(assert (=> b!1282129 (= lt!576479 (addApplyDifferent!552 lt!576489 lt!576496 minValue!1387 lt!576493))))

(assert (=> b!1282129 (= (apply!1010 (+!4273 lt!576489 (tuple2!21719 lt!576496 minValue!1387)) lt!576493) (apply!1010 lt!576489 lt!576493))))

(declare-fun b!1282130 () Bool)

(assert (=> b!1282130 (= e!732548 call!62774)))

(assert (= (and d!140679 c!124101) b!1282127))

(assert (= (and d!140679 (not c!124101)) b!1282125))

(assert (= (and b!1282125 c!124102) b!1282115))

(assert (= (and b!1282125 (not c!124102)) b!1282117))

(assert (= (and b!1282117 c!124097) b!1282130))

(assert (= (and b!1282117 (not c!124097)) b!1282123))

(assert (= (or b!1282130 b!1282123) bm!62769))

(assert (= (or b!1282115 bm!62769) bm!62774))

(assert (= (or b!1282115 b!1282130) bm!62768))

(assert (= (or b!1282127 bm!62774) bm!62770))

(assert (= (or b!1282127 bm!62768) bm!62772))

(assert (= (and d!140679 res!851643) b!1282112))

(assert (= (and d!140679 c!124100) b!1282129))

(assert (= (and d!140679 (not c!124100)) b!1282124))

(assert (= (and d!140679 res!851638) b!1282128))

(assert (= (and b!1282128 res!851639) b!1282126))

(assert (= (and b!1282128 (not res!851641)) b!1282114))

(assert (= (and b!1282114 res!851644) b!1282116))

(assert (= (and b!1282128 res!851646) b!1282113))

(assert (= (and b!1282113 c!124099) b!1282121))

(assert (= (and b!1282113 (not c!124099)) b!1282110))

(assert (= (and b!1282121 res!851642) b!1282119))

(assert (= (or b!1282121 b!1282110) bm!62771))

(assert (= (and b!1282113 res!851640) b!1282111))

(assert (= (and b!1282111 c!124098) b!1282120))

(assert (= (and b!1282111 (not c!124098)) b!1282118))

(assert (= (and b!1282120 res!851645) b!1282122))

(assert (= (or b!1282120 b!1282118) bm!62773))

(declare-fun b_lambda!23103 () Bool)

(assert (=> (not b_lambda!23103) (not b!1282116)))

(declare-fun t!42456 () Bool)

(declare-fun tb!11347 () Bool)

(assert (=> (and start!108604 (= defaultEntry!1448 defaultEntry!1448) t!42456) tb!11347))

(declare-fun result!23691 () Bool)

(assert (=> tb!11347 (= result!23691 tp_is_empty!33771)))

(assert (=> b!1282116 t!42456))

(declare-fun b_and!46199 () Bool)

(assert (= b_and!46195 (and (=> t!42456 result!23691) b_and!46199)))

(declare-fun m!1176395 () Bool)

(assert (=> bm!62770 m!1176395))

(declare-fun m!1176397 () Bool)

(assert (=> bm!62773 m!1176397))

(declare-fun m!1176399 () Bool)

(assert (=> bm!62772 m!1176399))

(assert (=> b!1282114 m!1176349))

(assert (=> b!1282114 m!1176349))

(declare-fun m!1176401 () Bool)

(assert (=> b!1282114 m!1176401))

(declare-fun m!1176403 () Bool)

(assert (=> b!1282127 m!1176403))

(assert (=> b!1282126 m!1176349))

(assert (=> b!1282126 m!1176349))

(declare-fun m!1176405 () Bool)

(assert (=> b!1282126 m!1176405))

(assert (=> b!1282112 m!1176349))

(assert (=> b!1282112 m!1176349))

(assert (=> b!1282112 m!1176405))

(assert (=> b!1282129 m!1176349))

(declare-fun m!1176407 () Bool)

(assert (=> b!1282129 m!1176407))

(declare-fun m!1176409 () Bool)

(assert (=> b!1282129 m!1176409))

(declare-fun m!1176411 () Bool)

(assert (=> b!1282129 m!1176411))

(assert (=> b!1282129 m!1176395))

(declare-fun m!1176413 () Bool)

(assert (=> b!1282129 m!1176413))

(declare-fun m!1176415 () Bool)

(assert (=> b!1282129 m!1176415))

(declare-fun m!1176417 () Bool)

(assert (=> b!1282129 m!1176417))

(declare-fun m!1176419 () Bool)

(assert (=> b!1282129 m!1176419))

(declare-fun m!1176421 () Bool)

(assert (=> b!1282129 m!1176421))

(declare-fun m!1176423 () Bool)

(assert (=> b!1282129 m!1176423))

(declare-fun m!1176425 () Bool)

(assert (=> b!1282129 m!1176425))

(declare-fun m!1176427 () Bool)

(assert (=> b!1282129 m!1176427))

(assert (=> b!1282129 m!1176425))

(assert (=> b!1282129 m!1176407))

(assert (=> b!1282129 m!1176415))

(declare-fun m!1176429 () Bool)

(assert (=> b!1282129 m!1176429))

(declare-fun m!1176431 () Bool)

(assert (=> b!1282129 m!1176431))

(assert (=> b!1282129 m!1176421))

(declare-fun m!1176433 () Bool)

(assert (=> b!1282129 m!1176433))

(declare-fun m!1176435 () Bool)

(assert (=> b!1282129 m!1176435))

(declare-fun m!1176437 () Bool)

(assert (=> b!1282119 m!1176437))

(assert (=> b!1282116 m!1176349))

(declare-fun m!1176439 () Bool)

(assert (=> b!1282116 m!1176439))

(declare-fun m!1176441 () Bool)

(assert (=> b!1282116 m!1176441))

(assert (=> b!1282116 m!1176349))

(declare-fun m!1176443 () Bool)

(assert (=> b!1282116 m!1176443))

(assert (=> b!1282116 m!1176441))

(assert (=> b!1282116 m!1176439))

(declare-fun m!1176445 () Bool)

(assert (=> b!1282116 m!1176445))

(assert (=> d!140679 m!1176339))

(declare-fun m!1176447 () Bool)

(assert (=> b!1282122 m!1176447))

(declare-fun m!1176449 () Bool)

(assert (=> bm!62771 m!1176449))

(assert (=> b!1282002 d!140679))

(declare-fun d!140681 () Bool)

(assert (=> d!140681 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108604 d!140681))

(declare-fun d!140683 () Bool)

(assert (=> d!140683 (= (array_inv!30965 _values!1445) (bvsge (size!41358 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108604 d!140683))

(declare-fun d!140685 () Bool)

(assert (=> d!140685 (= (array_inv!30966 _keys!1741) (bvsge (size!41359 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108604 d!140685))

(declare-fun mapNonEmpty!52217 () Bool)

(declare-fun mapRes!52217 () Bool)

(declare-fun tp!99515 () Bool)

(declare-fun e!732560 () Bool)

(assert (=> mapNonEmpty!52217 (= mapRes!52217 (and tp!99515 e!732560))))

(declare-fun mapRest!52217 () (Array (_ BitVec 32) ValueCell!15987))

(declare-fun mapKey!52217 () (_ BitVec 32))

(declare-fun mapValue!52217 () ValueCell!15987)

(assert (=> mapNonEmpty!52217 (= mapRest!52211 (store mapRest!52217 mapKey!52217 mapValue!52217))))

(declare-fun b!1282139 () Bool)

(assert (=> b!1282139 (= e!732560 tp_is_empty!33771)))

(declare-fun condMapEmpty!52217 () Bool)

(declare-fun mapDefault!52217 () ValueCell!15987)

(assert (=> mapNonEmpty!52211 (= condMapEmpty!52217 (= mapRest!52211 ((as const (Array (_ BitVec 32) ValueCell!15987)) mapDefault!52217)))))

(declare-fun e!732559 () Bool)

(assert (=> mapNonEmpty!52211 (= tp!99506 (and e!732559 mapRes!52217))))

(declare-fun mapIsEmpty!52217 () Bool)

(assert (=> mapIsEmpty!52217 mapRes!52217))

(declare-fun b!1282140 () Bool)

(assert (=> b!1282140 (= e!732559 tp_is_empty!33771)))

(assert (= (and mapNonEmpty!52211 condMapEmpty!52217) mapIsEmpty!52217))

(assert (= (and mapNonEmpty!52211 (not condMapEmpty!52217)) mapNonEmpty!52217))

(assert (= (and mapNonEmpty!52217 ((_ is ValueCellFull!15987) mapValue!52217)) b!1282139))

(assert (= (and mapNonEmpty!52211 ((_ is ValueCellFull!15987) mapDefault!52217)) b!1282140))

(declare-fun m!1176451 () Bool)

(assert (=> mapNonEmpty!52217 m!1176451))

(declare-fun b_lambda!23105 () Bool)

(assert (= b_lambda!23103 (or (and start!108604 b_free!28131) b_lambda!23105)))

(check-sat tp_is_empty!33771 (not b!1282122) (not bm!62773) (not b!1282054) (not mapNonEmpty!52217) (not bm!62772) (not bm!62770) (not b!1282114) (not d!140677) (not b_lambda!23105) (not b!1282065) (not b!1282119) (not bm!62750) (not b!1282126) (not bm!62771) (not b!1282116) b_and!46199 (not b!1282112) (not d!140679) (not b!1282056) (not b!1282127) (not b!1282040) (not b!1282129) (not b!1282058) (not b_next!28131) (not b!1282043) (not bm!62753) (not b!1282067))
(check-sat b_and!46199 (not b_next!28131))
