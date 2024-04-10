; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!682 () Bool)

(assert start!682)

(declare-fun b_free!135 () Bool)

(declare-fun b_next!135 () Bool)

(assert (=> start!682 (= b_free!135 (not b_next!135))))

(declare-fun tp!626 () Bool)

(declare-fun b_and!275 () Bool)

(assert (=> start!682 (= tp!626 b_and!275)))

(declare-fun b!4564 () Bool)

(declare-fun res!5790 () Bool)

(declare-fun e!2416 () Bool)

(assert (=> b!4564 (=> (not res!5790) (not e!2416))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!461 0))(
  ( (V!462 (val!112 Int)) )
))
(declare-datatypes ((ValueCell!90 0))(
  ( (ValueCellFull!90 (v!1200 V!461)) (EmptyCell!90) )
))
(declare-datatypes ((array!359 0))(
  ( (array!360 (arr!171 (Array (_ BitVec 32) ValueCell!90)) (size!233 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!359)

(declare-datatypes ((array!361 0))(
  ( (array!362 (arr!172 (Array (_ BitVec 32) (_ BitVec 64))) (size!234 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!361)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4564 (= res!5790 (and (= (size!233 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!234 _keys!1806) (size!233 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4565 () Bool)

(declare-fun e!2418 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(assert (=> b!4565 (= e!2418 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4566 () Bool)

(declare-fun res!5789 () Bool)

(assert (=> b!4566 (=> (not res!5789) (not e!2416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4566 (= res!5789 (validKeyInArray!0 k0!1278))))

(declare-fun mapIsEmpty!281 () Bool)

(declare-fun mapRes!281 () Bool)

(assert (=> mapIsEmpty!281 mapRes!281))

(declare-fun b!4568 () Bool)

(assert (=> b!4568 (= e!2416 (not (or (bvsge #b00000000000000000000000000000000 (size!234 _keys!1806)) (bvslt (size!234 _keys!1806) #b01111111111111111111111111111111))))))

(assert (=> b!4568 e!2418))

(declare-fun c!245 () Bool)

(assert (=> b!4568 (= c!245 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!461)

(declare-datatypes ((Unit!45 0))(
  ( (Unit!46) )
))
(declare-fun lt!693 () Unit!45)

(declare-fun zeroValue!1434 () V!461)

(declare-fun lemmaKeyInListMapIsInArray!11 (array!361 array!359 (_ BitVec 32) (_ BitVec 32) V!461 V!461 (_ BitVec 64) Int) Unit!45)

(assert (=> b!4568 (= lt!693 (lemmaKeyInListMapIsInArray!11 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!4569 () Bool)

(declare-fun e!2415 () Bool)

(declare-fun tp_is_empty!213 () Bool)

(assert (=> b!4569 (= e!2415 tp_is_empty!213)))

(declare-fun b!4570 () Bool)

(declare-fun e!2420 () Bool)

(assert (=> b!4570 (= e!2420 (and e!2415 mapRes!281))))

(declare-fun condMapEmpty!281 () Bool)

(declare-fun mapDefault!281 () ValueCell!90)

(assert (=> b!4570 (= condMapEmpty!281 (= (arr!171 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!90)) mapDefault!281)))))

(declare-fun b!4571 () Bool)

(declare-fun res!5787 () Bool)

(assert (=> b!4571 (=> (not res!5787) (not e!2416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!361 (_ BitVec 32)) Bool)

(assert (=> b!4571 (= res!5787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4572 () Bool)

(declare-fun res!5791 () Bool)

(assert (=> b!4572 (=> (not res!5791) (not e!2416))))

(declare-datatypes ((tuple2!100 0))(
  ( (tuple2!101 (_1!50 (_ BitVec 64)) (_2!50 V!461)) )
))
(declare-datatypes ((List!109 0))(
  ( (Nil!106) (Cons!105 (h!671 tuple2!100) (t!2238 List!109)) )
))
(declare-datatypes ((ListLongMap!105 0))(
  ( (ListLongMap!106 (toList!68 List!109)) )
))
(declare-fun contains!39 (ListLongMap!105 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!27 (array!361 array!359 (_ BitVec 32) (_ BitVec 32) V!461 V!461 (_ BitVec 32) Int) ListLongMap!105)

(assert (=> b!4572 (= res!5791 (contains!39 (getCurrentListMap!27 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4573 () Bool)

(declare-fun e!2417 () Bool)

(assert (=> b!4573 (= e!2417 tp_is_empty!213)))

(declare-fun res!5786 () Bool)

(assert (=> start!682 (=> (not res!5786) (not e!2416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!682 (= res!5786 (validMask!0 mask!2250))))

(assert (=> start!682 e!2416))

(assert (=> start!682 tp!626))

(assert (=> start!682 true))

(declare-fun array_inv!125 (array!359) Bool)

(assert (=> start!682 (and (array_inv!125 _values!1492) e!2420)))

(assert (=> start!682 tp_is_empty!213))

(declare-fun array_inv!126 (array!361) Bool)

(assert (=> start!682 (array_inv!126 _keys!1806)))

(declare-fun b!4567 () Bool)

(declare-fun arrayContainsKey!0 (array!361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4567 (= e!2418 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4574 () Bool)

(declare-fun res!5788 () Bool)

(assert (=> b!4574 (=> (not res!5788) (not e!2416))))

(declare-datatypes ((List!110 0))(
  ( (Nil!107) (Cons!106 (h!672 (_ BitVec 64)) (t!2239 List!110)) )
))
(declare-fun arrayNoDuplicates!0 (array!361 (_ BitVec 32) List!110) Bool)

(assert (=> b!4574 (= res!5788 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!107))))

(declare-fun mapNonEmpty!281 () Bool)

(declare-fun tp!625 () Bool)

(assert (=> mapNonEmpty!281 (= mapRes!281 (and tp!625 e!2417))))

(declare-fun mapRest!281 () (Array (_ BitVec 32) ValueCell!90))

(declare-fun mapKey!281 () (_ BitVec 32))

(declare-fun mapValue!281 () ValueCell!90)

(assert (=> mapNonEmpty!281 (= (arr!171 _values!1492) (store mapRest!281 mapKey!281 mapValue!281))))

(assert (= (and start!682 res!5786) b!4564))

(assert (= (and b!4564 res!5790) b!4571))

(assert (= (and b!4571 res!5787) b!4574))

(assert (= (and b!4574 res!5788) b!4572))

(assert (= (and b!4572 res!5791) b!4566))

(assert (= (and b!4566 res!5789) b!4568))

(assert (= (and b!4568 c!245) b!4567))

(assert (= (and b!4568 (not c!245)) b!4565))

(assert (= (and b!4570 condMapEmpty!281) mapIsEmpty!281))

(assert (= (and b!4570 (not condMapEmpty!281)) mapNonEmpty!281))

(get-info :version)

(assert (= (and mapNonEmpty!281 ((_ is ValueCellFull!90) mapValue!281)) b!4573))

(assert (= (and b!4570 ((_ is ValueCellFull!90) mapDefault!281)) b!4569))

(assert (= start!682 b!4570))

(declare-fun m!2445 () Bool)

(assert (=> b!4568 m!2445))

(declare-fun m!2447 () Bool)

(assert (=> b!4566 m!2447))

(declare-fun m!2449 () Bool)

(assert (=> b!4574 m!2449))

(declare-fun m!2451 () Bool)

(assert (=> b!4572 m!2451))

(assert (=> b!4572 m!2451))

(declare-fun m!2453 () Bool)

(assert (=> b!4572 m!2453))

(declare-fun m!2455 () Bool)

(assert (=> mapNonEmpty!281 m!2455))

(declare-fun m!2457 () Bool)

(assert (=> start!682 m!2457))

(declare-fun m!2459 () Bool)

(assert (=> start!682 m!2459))

(declare-fun m!2461 () Bool)

(assert (=> start!682 m!2461))

(declare-fun m!2463 () Bool)

(assert (=> b!4567 m!2463))

(declare-fun m!2465 () Bool)

(assert (=> b!4571 m!2465))

(check-sat (not b!4572) (not mapNonEmpty!281) b_and!275 (not b!4574) (not b!4567) (not b!4568) (not b!4571) (not b!4566) (not start!682) (not b_next!135) tp_is_empty!213)
(check-sat b_and!275 (not b_next!135))
(get-model)

(declare-fun d!691 () Bool)

(declare-fun e!2443 () Bool)

(assert (=> d!691 e!2443))

(declare-fun res!5812 () Bool)

(assert (=> d!691 (=> res!5812 e!2443)))

(declare-fun lt!707 () Bool)

(assert (=> d!691 (= res!5812 (not lt!707))))

(declare-fun lt!706 () Bool)

(assert (=> d!691 (= lt!707 lt!706)))

(declare-fun lt!708 () Unit!45)

(declare-fun e!2444 () Unit!45)

(assert (=> d!691 (= lt!708 e!2444)))

(declare-fun c!251 () Bool)

(assert (=> d!691 (= c!251 lt!706)))

(declare-fun containsKey!2 (List!109 (_ BitVec 64)) Bool)

(assert (=> d!691 (= lt!706 (containsKey!2 (toList!68 (getCurrentListMap!27 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!691 (= (contains!39 (getCurrentListMap!27 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!707)))

(declare-fun b!4614 () Bool)

(declare-fun lt!705 () Unit!45)

(assert (=> b!4614 (= e!2444 lt!705)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!2 (List!109 (_ BitVec 64)) Unit!45)

(assert (=> b!4614 (= lt!705 (lemmaContainsKeyImpliesGetValueByKeyDefined!2 (toList!68 (getCurrentListMap!27 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!14 0))(
  ( (Some!13 (v!1202 V!461)) (None!12) )
))
(declare-fun isDefined!3 (Option!14) Bool)

(declare-fun getValueByKey!8 (List!109 (_ BitVec 64)) Option!14)

(assert (=> b!4614 (isDefined!3 (getValueByKey!8 (toList!68 (getCurrentListMap!27 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!4615 () Bool)

(declare-fun Unit!47 () Unit!45)

(assert (=> b!4615 (= e!2444 Unit!47)))

(declare-fun b!4616 () Bool)

(assert (=> b!4616 (= e!2443 (isDefined!3 (getValueByKey!8 (toList!68 (getCurrentListMap!27 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!691 c!251) b!4614))

(assert (= (and d!691 (not c!251)) b!4615))

(assert (= (and d!691 (not res!5812)) b!4616))

(declare-fun m!2489 () Bool)

(assert (=> d!691 m!2489))

(declare-fun m!2491 () Bool)

(assert (=> b!4614 m!2491))

(declare-fun m!2493 () Bool)

(assert (=> b!4614 m!2493))

(assert (=> b!4614 m!2493))

(declare-fun m!2495 () Bool)

(assert (=> b!4614 m!2495))

(assert (=> b!4616 m!2493))

(assert (=> b!4616 m!2493))

(assert (=> b!4616 m!2495))

(assert (=> b!4572 d!691))

(declare-fun d!693 () Bool)

(declare-fun e!2471 () Bool)

(assert (=> d!693 e!2471))

(declare-fun res!5838 () Bool)

(assert (=> d!693 (=> (not res!5838) (not e!2471))))

(assert (=> d!693 (= res!5838 (or (bvsge #b00000000000000000000000000000000 (size!234 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!234 _keys!1806)))))))

(declare-fun lt!774 () ListLongMap!105)

(declare-fun lt!755 () ListLongMap!105)

(assert (=> d!693 (= lt!774 lt!755)))

(declare-fun lt!766 () Unit!45)

(declare-fun e!2472 () Unit!45)

(assert (=> d!693 (= lt!766 e!2472)))

(declare-fun c!267 () Bool)

(declare-fun e!2473 () Bool)

(assert (=> d!693 (= c!267 e!2473)))

(declare-fun res!5836 () Bool)

(assert (=> d!693 (=> (not res!5836) (not e!2473))))

(assert (=> d!693 (= res!5836 (bvslt #b00000000000000000000000000000000 (size!234 _keys!1806)))))

(declare-fun e!2477 () ListLongMap!105)

(assert (=> d!693 (= lt!755 e!2477)))

(declare-fun c!268 () Bool)

(assert (=> d!693 (= c!268 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!693 (validMask!0 mask!2250)))

(assert (=> d!693 (= (getCurrentListMap!27 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!774)))

(declare-fun b!4659 () Bool)

(assert (=> b!4659 (= e!2473 (validKeyInArray!0 (select (arr!172 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4660 () Bool)

(declare-fun call!90 () ListLongMap!105)

(declare-fun +!5 (ListLongMap!105 tuple2!100) ListLongMap!105)

(assert (=> b!4660 (= e!2477 (+!5 call!90 (tuple2!101 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun bm!86 () Bool)

(declare-fun call!94 () Bool)

(assert (=> bm!86 (= call!94 (contains!39 lt!774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!2476 () Bool)

(declare-fun b!4661 () Bool)

(declare-fun apply!18 (ListLongMap!105 (_ BitVec 64)) V!461)

(declare-fun get!90 (ValueCell!90 V!461) V!461)

(declare-fun dynLambda!40 (Int (_ BitVec 64)) V!461)

(assert (=> b!4661 (= e!2476 (= (apply!18 lt!774 (select (arr!172 _keys!1806) #b00000000000000000000000000000000)) (get!90 (select (arr!171 _values!1492) #b00000000000000000000000000000000) (dynLambda!40 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!4661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!233 _values!1492)))))

(assert (=> b!4661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!234 _keys!1806)))))

(declare-fun b!4662 () Bool)

(declare-fun e!2474 () ListLongMap!105)

(declare-fun call!95 () ListLongMap!105)

(assert (=> b!4662 (= e!2474 call!95)))

(declare-fun b!4663 () Bool)

(declare-fun e!2482 () ListLongMap!105)

(assert (=> b!4663 (= e!2477 e!2482)))

(declare-fun c!266 () Bool)

(assert (=> b!4663 (= c!266 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!87 () Bool)

(declare-fun call!91 () ListLongMap!105)

(declare-fun call!93 () ListLongMap!105)

(assert (=> bm!87 (= call!91 call!93)))

(declare-fun b!4664 () Bool)

(declare-fun e!2478 () Bool)

(declare-fun call!92 () Bool)

(assert (=> b!4664 (= e!2478 (not call!92))))

(declare-fun b!4665 () Bool)

(assert (=> b!4665 (= e!2482 call!95)))

(declare-fun b!4666 () Bool)

(declare-fun res!5835 () Bool)

(assert (=> b!4666 (=> (not res!5835) (not e!2471))))

(declare-fun e!2480 () Bool)

(assert (=> b!4666 (= res!5835 e!2480)))

(declare-fun res!5832 () Bool)

(assert (=> b!4666 (=> res!5832 e!2480)))

(declare-fun e!2475 () Bool)

(assert (=> b!4666 (= res!5832 (not e!2475))))

(declare-fun res!5837 () Bool)

(assert (=> b!4666 (=> (not res!5837) (not e!2475))))

(assert (=> b!4666 (= res!5837 (bvslt #b00000000000000000000000000000000 (size!234 _keys!1806)))))

(declare-fun call!89 () ListLongMap!105)

(declare-fun bm!88 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2 (array!361 array!359 (_ BitVec 32) (_ BitVec 32) V!461 V!461 (_ BitVec 32) Int) ListLongMap!105)

(assert (=> bm!88 (= call!89 (getCurrentListMapNoExtraKeys!2 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun bm!89 () Bool)

(assert (=> bm!89 (= call!95 call!90)))

(declare-fun b!4667 () Bool)

(declare-fun res!5831 () Bool)

(assert (=> b!4667 (=> (not res!5831) (not e!2471))))

(declare-fun e!2479 () Bool)

(assert (=> b!4667 (= res!5831 e!2479)))

(declare-fun c!264 () Bool)

(assert (=> b!4667 (= c!264 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!4668 () Bool)

(assert (=> b!4668 (= e!2471 e!2478)))

(declare-fun c!265 () Bool)

(assert (=> b!4668 (= c!265 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!4669 () Bool)

(assert (=> b!4669 (= e!2479 (not call!94))))

(declare-fun bm!90 () Bool)

(assert (=> bm!90 (= call!93 call!89)))

(declare-fun b!4670 () Bool)

(declare-fun e!2481 () Bool)

(assert (=> b!4670 (= e!2481 (= (apply!18 lt!774 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun bm!91 () Bool)

(assert (=> bm!91 (= call!90 (+!5 (ite c!268 call!89 (ite c!266 call!93 call!91)) (ite (or c!268 c!266) (tuple2!101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!101 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!4671 () Bool)

(assert (=> b!4671 (= e!2474 call!91)))

(declare-fun b!4672 () Bool)

(assert (=> b!4672 (= e!2475 (validKeyInArray!0 (select (arr!172 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4673 () Bool)

(declare-fun e!2483 () Bool)

(assert (=> b!4673 (= e!2479 e!2483)))

(declare-fun res!5834 () Bool)

(assert (=> b!4673 (= res!5834 call!94)))

(assert (=> b!4673 (=> (not res!5834) (not e!2483))))

(declare-fun b!4674 () Bool)

(declare-fun c!269 () Bool)

(assert (=> b!4674 (= c!269 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!4674 (= e!2482 e!2474)))

(declare-fun bm!92 () Bool)

(assert (=> bm!92 (= call!92 (contains!39 lt!774 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!4675 () Bool)

(assert (=> b!4675 (= e!2480 e!2476)))

(declare-fun res!5839 () Bool)

(assert (=> b!4675 (=> (not res!5839) (not e!2476))))

(assert (=> b!4675 (= res!5839 (contains!39 lt!774 (select (arr!172 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!4675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!234 _keys!1806)))))

(declare-fun b!4676 () Bool)

(declare-fun Unit!48 () Unit!45)

(assert (=> b!4676 (= e!2472 Unit!48)))

(declare-fun b!4677 () Bool)

(assert (=> b!4677 (= e!2483 (= (apply!18 lt!774 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!4678 () Bool)

(declare-fun lt!770 () Unit!45)

(assert (=> b!4678 (= e!2472 lt!770)))

(declare-fun lt!767 () ListLongMap!105)

(assert (=> b!4678 (= lt!767 (getCurrentListMapNoExtraKeys!2 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!756 () (_ BitVec 64))

(assert (=> b!4678 (= lt!756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!769 () (_ BitVec 64))

(assert (=> b!4678 (= lt!769 (select (arr!172 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!762 () Unit!45)

(declare-fun addStillContains!3 (ListLongMap!105 (_ BitVec 64) V!461 (_ BitVec 64)) Unit!45)

(assert (=> b!4678 (= lt!762 (addStillContains!3 lt!767 lt!756 zeroValue!1434 lt!769))))

(assert (=> b!4678 (contains!39 (+!5 lt!767 (tuple2!101 lt!756 zeroValue!1434)) lt!769)))

(declare-fun lt!771 () Unit!45)

(assert (=> b!4678 (= lt!771 lt!762)))

(declare-fun lt!759 () ListLongMap!105)

(assert (=> b!4678 (= lt!759 (getCurrentListMapNoExtraKeys!2 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!772 () (_ BitVec 64))

(assert (=> b!4678 (= lt!772 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!768 () (_ BitVec 64))

(assert (=> b!4678 (= lt!768 (select (arr!172 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!757 () Unit!45)

(declare-fun addApplyDifferent!3 (ListLongMap!105 (_ BitVec 64) V!461 (_ BitVec 64)) Unit!45)

(assert (=> b!4678 (= lt!757 (addApplyDifferent!3 lt!759 lt!772 minValue!1434 lt!768))))

(assert (=> b!4678 (= (apply!18 (+!5 lt!759 (tuple2!101 lt!772 minValue!1434)) lt!768) (apply!18 lt!759 lt!768))))

(declare-fun lt!754 () Unit!45)

(assert (=> b!4678 (= lt!754 lt!757)))

(declare-fun lt!760 () ListLongMap!105)

(assert (=> b!4678 (= lt!760 (getCurrentListMapNoExtraKeys!2 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!773 () (_ BitVec 64))

(assert (=> b!4678 (= lt!773 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!765 () (_ BitVec 64))

(assert (=> b!4678 (= lt!765 (select (arr!172 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!764 () Unit!45)

(assert (=> b!4678 (= lt!764 (addApplyDifferent!3 lt!760 lt!773 zeroValue!1434 lt!765))))

(assert (=> b!4678 (= (apply!18 (+!5 lt!760 (tuple2!101 lt!773 zeroValue!1434)) lt!765) (apply!18 lt!760 lt!765))))

(declare-fun lt!753 () Unit!45)

(assert (=> b!4678 (= lt!753 lt!764)))

(declare-fun lt!761 () ListLongMap!105)

(assert (=> b!4678 (= lt!761 (getCurrentListMapNoExtraKeys!2 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!763 () (_ BitVec 64))

(assert (=> b!4678 (= lt!763 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!758 () (_ BitVec 64))

(assert (=> b!4678 (= lt!758 (select (arr!172 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!4678 (= lt!770 (addApplyDifferent!3 lt!761 lt!763 minValue!1434 lt!758))))

(assert (=> b!4678 (= (apply!18 (+!5 lt!761 (tuple2!101 lt!763 minValue!1434)) lt!758) (apply!18 lt!761 lt!758))))

(declare-fun b!4679 () Bool)

(assert (=> b!4679 (= e!2478 e!2481)))

(declare-fun res!5833 () Bool)

(assert (=> b!4679 (= res!5833 call!92)))

(assert (=> b!4679 (=> (not res!5833) (not e!2481))))

(assert (= (and d!693 c!268) b!4660))

(assert (= (and d!693 (not c!268)) b!4663))

(assert (= (and b!4663 c!266) b!4665))

(assert (= (and b!4663 (not c!266)) b!4674))

(assert (= (and b!4674 c!269) b!4662))

(assert (= (and b!4674 (not c!269)) b!4671))

(assert (= (or b!4662 b!4671) bm!87))

(assert (= (or b!4665 bm!87) bm!90))

(assert (= (or b!4665 b!4662) bm!89))

(assert (= (or b!4660 bm!90) bm!88))

(assert (= (or b!4660 bm!89) bm!91))

(assert (= (and d!693 res!5836) b!4659))

(assert (= (and d!693 c!267) b!4678))

(assert (= (and d!693 (not c!267)) b!4676))

(assert (= (and d!693 res!5838) b!4666))

(assert (= (and b!4666 res!5837) b!4672))

(assert (= (and b!4666 (not res!5832)) b!4675))

(assert (= (and b!4675 res!5839) b!4661))

(assert (= (and b!4666 res!5835) b!4667))

(assert (= (and b!4667 c!264) b!4673))

(assert (= (and b!4667 (not c!264)) b!4669))

(assert (= (and b!4673 res!5834) b!4677))

(assert (= (or b!4673 b!4669) bm!86))

(assert (= (and b!4667 res!5831) b!4668))

(assert (= (and b!4668 c!265) b!4679))

(assert (= (and b!4668 (not c!265)) b!4664))

(assert (= (and b!4679 res!5833) b!4670))

(assert (= (or b!4679 b!4664) bm!92))

(declare-fun b_lambda!323 () Bool)

(assert (=> (not b_lambda!323) (not b!4661)))

(declare-fun t!2241 () Bool)

(declare-fun tb!129 () Bool)

(assert (=> (and start!682 (= defaultEntry!1495 defaultEntry!1495) t!2241) tb!129))

(declare-fun result!189 () Bool)

(assert (=> tb!129 (= result!189 tp_is_empty!213)))

(assert (=> b!4661 t!2241))

(declare-fun b_and!279 () Bool)

(assert (= b_and!275 (and (=> t!2241 result!189) b_and!279)))

(declare-fun m!2497 () Bool)

(assert (=> b!4675 m!2497))

(assert (=> b!4675 m!2497))

(declare-fun m!2499 () Bool)

(assert (=> b!4675 m!2499))

(assert (=> b!4659 m!2497))

(assert (=> b!4659 m!2497))

(declare-fun m!2501 () Bool)

(assert (=> b!4659 m!2501))

(declare-fun m!2503 () Bool)

(assert (=> b!4670 m!2503))

(assert (=> b!4672 m!2497))

(assert (=> b!4672 m!2497))

(assert (=> b!4672 m!2501))

(declare-fun m!2505 () Bool)

(assert (=> bm!91 m!2505))

(declare-fun m!2507 () Bool)

(assert (=> b!4677 m!2507))

(declare-fun m!2509 () Bool)

(assert (=> b!4660 m!2509))

(declare-fun m!2511 () Bool)

(assert (=> bm!86 m!2511))

(assert (=> d!693 m!2457))

(declare-fun m!2513 () Bool)

(assert (=> b!4678 m!2513))

(declare-fun m!2515 () Bool)

(assert (=> b!4678 m!2515))

(declare-fun m!2517 () Bool)

(assert (=> b!4678 m!2517))

(declare-fun m!2519 () Bool)

(assert (=> b!4678 m!2519))

(declare-fun m!2521 () Bool)

(assert (=> b!4678 m!2521))

(assert (=> b!4678 m!2497))

(declare-fun m!2523 () Bool)

(assert (=> b!4678 m!2523))

(declare-fun m!2525 () Bool)

(assert (=> b!4678 m!2525))

(declare-fun m!2527 () Bool)

(assert (=> b!4678 m!2527))

(declare-fun m!2529 () Bool)

(assert (=> b!4678 m!2529))

(declare-fun m!2531 () Bool)

(assert (=> b!4678 m!2531))

(assert (=> b!4678 m!2525))

(assert (=> b!4678 m!2513))

(declare-fun m!2533 () Bool)

(assert (=> b!4678 m!2533))

(declare-fun m!2535 () Bool)

(assert (=> b!4678 m!2535))

(declare-fun m!2537 () Bool)

(assert (=> b!4678 m!2537))

(assert (=> b!4678 m!2519))

(declare-fun m!2539 () Bool)

(assert (=> b!4678 m!2539))

(declare-fun m!2541 () Bool)

(assert (=> b!4678 m!2541))

(declare-fun m!2543 () Bool)

(assert (=> b!4678 m!2543))

(assert (=> b!4678 m!2541))

(declare-fun m!2545 () Bool)

(assert (=> b!4661 m!2545))

(assert (=> b!4661 m!2497))

(declare-fun m!2547 () Bool)

(assert (=> b!4661 m!2547))

(declare-fun m!2549 () Bool)

(assert (=> b!4661 m!2549))

(assert (=> b!4661 m!2549))

(assert (=> b!4661 m!2545))

(declare-fun m!2551 () Bool)

(assert (=> b!4661 m!2551))

(assert (=> b!4661 m!2497))

(assert (=> bm!88 m!2533))

(declare-fun m!2553 () Bool)

(assert (=> bm!92 m!2553))

(assert (=> b!4572 d!693))

(declare-fun d!695 () Bool)

(declare-fun res!5844 () Bool)

(declare-fun e!2488 () Bool)

(assert (=> d!695 (=> res!5844 e!2488)))

(assert (=> d!695 (= res!5844 (= (select (arr!172 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!695 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!2488)))

(declare-fun b!4686 () Bool)

(declare-fun e!2489 () Bool)

(assert (=> b!4686 (= e!2488 e!2489)))

(declare-fun res!5845 () Bool)

(assert (=> b!4686 (=> (not res!5845) (not e!2489))))

(assert (=> b!4686 (= res!5845 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!234 _keys!1806)))))

(declare-fun b!4687 () Bool)

(assert (=> b!4687 (= e!2489 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!695 (not res!5844)) b!4686))

(assert (= (and b!4686 res!5845) b!4687))

(assert (=> d!695 m!2497))

(declare-fun m!2555 () Bool)

(assert (=> b!4687 m!2555))

(assert (=> b!4567 d!695))

(declare-fun d!697 () Bool)

(declare-fun e!2492 () Bool)

(assert (=> d!697 e!2492))

(declare-fun c!272 () Bool)

(assert (=> d!697 (= c!272 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!777 () Unit!45)

(declare-fun choose!135 (array!361 array!359 (_ BitVec 32) (_ BitVec 32) V!461 V!461 (_ BitVec 64) Int) Unit!45)

(assert (=> d!697 (= lt!777 (choose!135 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!697 (validMask!0 mask!2250)))

(assert (=> d!697 (= (lemmaKeyInListMapIsInArray!11 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!777)))

(declare-fun b!4692 () Bool)

(assert (=> b!4692 (= e!2492 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4693 () Bool)

(assert (=> b!4693 (= e!2492 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!697 c!272) b!4692))

(assert (= (and d!697 (not c!272)) b!4693))

(declare-fun m!2557 () Bool)

(assert (=> d!697 m!2557))

(assert (=> d!697 m!2457))

(assert (=> b!4692 m!2463))

(assert (=> b!4568 d!697))

(declare-fun d!699 () Bool)

(assert (=> d!699 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!682 d!699))

(declare-fun d!701 () Bool)

(assert (=> d!701 (= (array_inv!125 _values!1492) (bvsge (size!233 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!682 d!701))

(declare-fun d!703 () Bool)

(assert (=> d!703 (= (array_inv!126 _keys!1806) (bvsge (size!234 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!682 d!703))

(declare-fun b!4704 () Bool)

(declare-fun e!2503 () Bool)

(declare-fun call!98 () Bool)

(assert (=> b!4704 (= e!2503 call!98)))

(declare-fun b!4705 () Bool)

(declare-fun e!2501 () Bool)

(assert (=> b!4705 (= e!2501 e!2503)))

(declare-fun c!275 () Bool)

(assert (=> b!4705 (= c!275 (validKeyInArray!0 (select (arr!172 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4706 () Bool)

(declare-fun e!2504 () Bool)

(declare-fun contains!40 (List!110 (_ BitVec 64)) Bool)

(assert (=> b!4706 (= e!2504 (contains!40 Nil!107 (select (arr!172 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!705 () Bool)

(declare-fun res!5852 () Bool)

(declare-fun e!2502 () Bool)

(assert (=> d!705 (=> res!5852 e!2502)))

(assert (=> d!705 (= res!5852 (bvsge #b00000000000000000000000000000000 (size!234 _keys!1806)))))

(assert (=> d!705 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!107) e!2502)))

(declare-fun b!4707 () Bool)

(assert (=> b!4707 (= e!2503 call!98)))

(declare-fun bm!95 () Bool)

(assert (=> bm!95 (= call!98 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!275 (Cons!106 (select (arr!172 _keys!1806) #b00000000000000000000000000000000) Nil!107) Nil!107)))))

(declare-fun b!4708 () Bool)

(assert (=> b!4708 (= e!2502 e!2501)))

(declare-fun res!5853 () Bool)

(assert (=> b!4708 (=> (not res!5853) (not e!2501))))

(assert (=> b!4708 (= res!5853 (not e!2504))))

(declare-fun res!5854 () Bool)

(assert (=> b!4708 (=> (not res!5854) (not e!2504))))

(assert (=> b!4708 (= res!5854 (validKeyInArray!0 (select (arr!172 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!705 (not res!5852)) b!4708))

(assert (= (and b!4708 res!5854) b!4706))

(assert (= (and b!4708 res!5853) b!4705))

(assert (= (and b!4705 c!275) b!4704))

(assert (= (and b!4705 (not c!275)) b!4707))

(assert (= (or b!4704 b!4707) bm!95))

(assert (=> b!4705 m!2497))

(assert (=> b!4705 m!2497))

(assert (=> b!4705 m!2501))

(assert (=> b!4706 m!2497))

(assert (=> b!4706 m!2497))

(declare-fun m!2559 () Bool)

(assert (=> b!4706 m!2559))

(assert (=> bm!95 m!2497))

(declare-fun m!2561 () Bool)

(assert (=> bm!95 m!2561))

(assert (=> b!4708 m!2497))

(assert (=> b!4708 m!2497))

(assert (=> b!4708 m!2501))

(assert (=> b!4574 d!705))

(declare-fun b!4717 () Bool)

(declare-fun e!2511 () Bool)

(declare-fun e!2512 () Bool)

(assert (=> b!4717 (= e!2511 e!2512)))

(declare-fun c!278 () Bool)

(assert (=> b!4717 (= c!278 (validKeyInArray!0 (select (arr!172 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4718 () Bool)

(declare-fun call!101 () Bool)

(assert (=> b!4718 (= e!2512 call!101)))

(declare-fun bm!98 () Bool)

(assert (=> bm!98 (= call!101 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun d!707 () Bool)

(declare-fun res!5860 () Bool)

(assert (=> d!707 (=> res!5860 e!2511)))

(assert (=> d!707 (= res!5860 (bvsge #b00000000000000000000000000000000 (size!234 _keys!1806)))))

(assert (=> d!707 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!2511)))

(declare-fun b!4719 () Bool)

(declare-fun e!2513 () Bool)

(assert (=> b!4719 (= e!2513 call!101)))

(declare-fun b!4720 () Bool)

(assert (=> b!4720 (= e!2512 e!2513)))

(declare-fun lt!786 () (_ BitVec 64))

(assert (=> b!4720 (= lt!786 (select (arr!172 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!784 () Unit!45)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!361 (_ BitVec 64) (_ BitVec 32)) Unit!45)

(assert (=> b!4720 (= lt!784 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!786 #b00000000000000000000000000000000))))

(assert (=> b!4720 (arrayContainsKey!0 _keys!1806 lt!786 #b00000000000000000000000000000000)))

(declare-fun lt!785 () Unit!45)

(assert (=> b!4720 (= lt!785 lt!784)))

(declare-fun res!5859 () Bool)

(declare-datatypes ((SeekEntryResult!11 0))(
  ( (MissingZero!11 (index!2163 (_ BitVec 32))) (Found!11 (index!2164 (_ BitVec 32))) (Intermediate!11 (undefined!823 Bool) (index!2165 (_ BitVec 32)) (x!2385 (_ BitVec 32))) (Undefined!11) (MissingVacant!11 (index!2166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!361 (_ BitVec 32)) SeekEntryResult!11)

(assert (=> b!4720 (= res!5859 (= (seekEntryOrOpen!0 (select (arr!172 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!11 #b00000000000000000000000000000000)))))

(assert (=> b!4720 (=> (not res!5859) (not e!2513))))

(assert (= (and d!707 (not res!5860)) b!4717))

(assert (= (and b!4717 c!278) b!4720))

(assert (= (and b!4717 (not c!278)) b!4718))

(assert (= (and b!4720 res!5859) b!4719))

(assert (= (or b!4719 b!4718) bm!98))

(assert (=> b!4717 m!2497))

(assert (=> b!4717 m!2497))

(assert (=> b!4717 m!2501))

(declare-fun m!2563 () Bool)

(assert (=> bm!98 m!2563))

(assert (=> b!4720 m!2497))

(declare-fun m!2565 () Bool)

(assert (=> b!4720 m!2565))

(declare-fun m!2567 () Bool)

(assert (=> b!4720 m!2567))

(assert (=> b!4720 m!2497))

(declare-fun m!2569 () Bool)

(assert (=> b!4720 m!2569))

(assert (=> b!4571 d!707))

(declare-fun d!709 () Bool)

(assert (=> d!709 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!4566 d!709))

(declare-fun condMapEmpty!287 () Bool)

(declare-fun mapDefault!287 () ValueCell!90)

(assert (=> mapNonEmpty!281 (= condMapEmpty!287 (= mapRest!281 ((as const (Array (_ BitVec 32) ValueCell!90)) mapDefault!287)))))

(declare-fun e!2518 () Bool)

(declare-fun mapRes!287 () Bool)

(assert (=> mapNonEmpty!281 (= tp!625 (and e!2518 mapRes!287))))

(declare-fun b!4727 () Bool)

(declare-fun e!2519 () Bool)

(assert (=> b!4727 (= e!2519 tp_is_empty!213)))

(declare-fun mapIsEmpty!287 () Bool)

(assert (=> mapIsEmpty!287 mapRes!287))

(declare-fun mapNonEmpty!287 () Bool)

(declare-fun tp!635 () Bool)

(assert (=> mapNonEmpty!287 (= mapRes!287 (and tp!635 e!2519))))

(declare-fun mapValue!287 () ValueCell!90)

(declare-fun mapRest!287 () (Array (_ BitVec 32) ValueCell!90))

(declare-fun mapKey!287 () (_ BitVec 32))

(assert (=> mapNonEmpty!287 (= mapRest!281 (store mapRest!287 mapKey!287 mapValue!287))))

(declare-fun b!4728 () Bool)

(assert (=> b!4728 (= e!2518 tp_is_empty!213)))

(assert (= (and mapNonEmpty!281 condMapEmpty!287) mapIsEmpty!287))

(assert (= (and mapNonEmpty!281 (not condMapEmpty!287)) mapNonEmpty!287))

(assert (= (and mapNonEmpty!287 ((_ is ValueCellFull!90) mapValue!287)) b!4727))

(assert (= (and mapNonEmpty!281 ((_ is ValueCellFull!90) mapDefault!287)) b!4728))

(declare-fun m!2571 () Bool)

(assert (=> mapNonEmpty!287 m!2571))

(declare-fun b_lambda!325 () Bool)

(assert (= b_lambda!323 (or (and start!682 b_free!135) b_lambda!325)))

(check-sat (not b_lambda!325) (not b!4705) (not b!4670) (not bm!92) (not b!4677) (not d!697) (not b!4720) (not b!4706) (not b!4687) (not b!4660) (not mapNonEmpty!287) (not b!4717) (not b!4616) b_and!279 (not d!693) (not b!4678) (not b!4661) (not b!4672) (not b!4692) (not b!4614) (not bm!91) (not bm!98) (not bm!95) (not bm!88) (not b_next!135) (not b!4708) (not d!691) (not b!4659) (not bm!86) (not b!4675) tp_is_empty!213)
(check-sat b_and!279 (not b_next!135))
