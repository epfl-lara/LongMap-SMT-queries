; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4542 () Bool)

(assert start!4542)

(declare-fun b_free!1267 () Bool)

(declare-fun b_next!1267 () Bool)

(assert (=> start!4542 (= b_free!1267 (not b_next!1267))))

(declare-fun tp!5244 () Bool)

(declare-fun b_and!2083 () Bool)

(assert (=> start!4542 (= tp!5244 b_and!2083)))

(declare-fun b!35426 () Bool)

(declare-fun e!22372 () Bool)

(declare-fun tp_is_empty!1621 () Bool)

(assert (=> b!35426 (= e!22372 tp_is_empty!1621)))

(declare-fun b!35427 () Bool)

(declare-fun e!22376 () Bool)

(declare-fun e!22373 () Bool)

(assert (=> b!35427 (= e!22376 e!22373)))

(declare-fun res!21511 () Bool)

(assert (=> b!35427 (=> (not res!21511) (not e!22373))))

(declare-datatypes ((SeekEntryResult!152 0))(
  ( (MissingZero!152 (index!2730 (_ BitVec 32))) (Found!152 (index!2731 (_ BitVec 32))) (Intermediate!152 (undefined!964 Bool) (index!2732 (_ BitVec 32)) (x!7014 (_ BitVec 32))) (Undefined!152) (MissingVacant!152 (index!2733 (_ BitVec 32))) )
))
(declare-fun lt!13018 () SeekEntryResult!152)

(get-info :version)

(assert (=> b!35427 (= res!21511 ((_ is Found!152) lt!13018))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((array!2441 0))(
  ( (array!2442 (arr!1166 (Array (_ BitVec 32) (_ BitVec 64))) (size!1267 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2441)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2441 (_ BitVec 32)) SeekEntryResult!152)

(assert (=> b!35427 (= lt!13018 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35428 () Bool)

(declare-fun res!21509 () Bool)

(assert (=> b!35428 (=> (not res!21509) (not e!22376))))

(declare-fun arrayContainsKey!0 (array!2441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35428 (= res!21509 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!35429 () Bool)

(declare-fun res!21508 () Bool)

(declare-fun e!22374 () Bool)

(assert (=> b!35429 (=> (not res!21508) (not e!22374))))

(declare-datatypes ((V!1987 0))(
  ( (V!1988 (val!837 Int)) )
))
(declare-datatypes ((ValueCell!611 0))(
  ( (ValueCellFull!611 (v!1934 V!1987)) (EmptyCell!611) )
))
(declare-datatypes ((array!2443 0))(
  ( (array!2444 (arr!1167 (Array (_ BitVec 32) ValueCell!611)) (size!1268 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2443)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!35429 (= res!21508 (and (= (size!1268 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1267 _keys!1833) (size!1268 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!21510 () Bool)

(assert (=> start!4542 (=> (not res!21510) (not e!22374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4542 (= res!21510 (validMask!0 mask!2294))))

(assert (=> start!4542 e!22374))

(assert (=> start!4542 true))

(assert (=> start!4542 tp!5244))

(declare-fun e!22371 () Bool)

(declare-fun array_inv!799 (array!2443) Bool)

(assert (=> start!4542 (and (array_inv!799 _values!1501) e!22371)))

(declare-fun array_inv!800 (array!2441) Bool)

(assert (=> start!4542 (array_inv!800 _keys!1833)))

(assert (=> start!4542 tp_is_empty!1621))

(declare-fun b!35430 () Bool)

(declare-fun res!21513 () Bool)

(assert (=> b!35430 (=> (not res!21513) (not e!22374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35430 (= res!21513 (validKeyInArray!0 k0!1304))))

(declare-fun b!35431 () Bool)

(declare-fun res!21514 () Bool)

(assert (=> b!35431 (=> (not res!21514) (not e!22374))))

(declare-datatypes ((List!922 0))(
  ( (Nil!919) (Cons!918 (h!1485 (_ BitVec 64)) (t!3625 List!922)) )
))
(declare-fun arrayNoDuplicates!0 (array!2441 (_ BitVec 32) List!922) Bool)

(assert (=> b!35431 (= res!21514 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!919))))

(declare-fun mapIsEmpty!1984 () Bool)

(declare-fun mapRes!1984 () Bool)

(assert (=> mapIsEmpty!1984 mapRes!1984))

(declare-fun b!35432 () Bool)

(assert (=> b!35432 (= e!22374 e!22376)))

(declare-fun res!21515 () Bool)

(assert (=> b!35432 (=> (not res!21515) (not e!22376))))

(declare-datatypes ((tuple2!1326 0))(
  ( (tuple2!1327 (_1!674 (_ BitVec 64)) (_2!674 V!1987)) )
))
(declare-datatypes ((List!923 0))(
  ( (Nil!920) (Cons!919 (h!1486 tuple2!1326) (t!3626 List!923)) )
))
(declare-datatypes ((ListLongMap!897 0))(
  ( (ListLongMap!898 (toList!464 List!923)) )
))
(declare-fun lt!13016 () ListLongMap!897)

(declare-fun contains!414 (ListLongMap!897 (_ BitVec 64)) Bool)

(assert (=> b!35432 (= res!21515 (not (contains!414 lt!13016 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1987)

(declare-fun minValue!1443 () V!1987)

(declare-fun getCurrentListMap!285 (array!2441 array!2443 (_ BitVec 32) (_ BitVec 32) V!1987 V!1987 (_ BitVec 32) Int) ListLongMap!897)

(assert (=> b!35432 (= lt!13016 (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1984 () Bool)

(declare-fun tp!5245 () Bool)

(assert (=> mapNonEmpty!1984 (= mapRes!1984 (and tp!5245 e!22372))))

(declare-fun mapKey!1984 () (_ BitVec 32))

(declare-fun mapRest!1984 () (Array (_ BitVec 32) ValueCell!611))

(declare-fun mapValue!1984 () ValueCell!611)

(assert (=> mapNonEmpty!1984 (= (arr!1167 _values!1501) (store mapRest!1984 mapKey!1984 mapValue!1984))))

(declare-fun b!35433 () Bool)

(assert (=> b!35433 (= e!22373 (not false))))

(assert (=> b!35433 (contains!414 lt!13016 (select (arr!1166 _keys!1833) (index!2731 lt!13018)))))

(declare-datatypes ((Unit!785 0))(
  ( (Unit!786) )
))
(declare-fun lt!13017 () Unit!785)

(declare-fun lemmaValidKeyInArrayIsInListMap!68 (array!2441 array!2443 (_ BitVec 32) (_ BitVec 32) V!1987 V!1987 (_ BitVec 32) Int) Unit!785)

(assert (=> b!35433 (= lt!13017 (lemmaValidKeyInArrayIsInListMap!68 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2731 lt!13018) defaultEntry!1504))))

(declare-fun b!35434 () Bool)

(declare-fun e!22375 () Bool)

(assert (=> b!35434 (= e!22375 tp_is_empty!1621)))

(declare-fun b!35435 () Bool)

(declare-fun res!21512 () Bool)

(assert (=> b!35435 (=> (not res!21512) (not e!22374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2441 (_ BitVec 32)) Bool)

(assert (=> b!35435 (= res!21512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35436 () Bool)

(assert (=> b!35436 (= e!22371 (and e!22375 mapRes!1984))))

(declare-fun condMapEmpty!1984 () Bool)

(declare-fun mapDefault!1984 () ValueCell!611)

(assert (=> b!35436 (= condMapEmpty!1984 (= (arr!1167 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!611)) mapDefault!1984)))))

(assert (= (and start!4542 res!21510) b!35429))

(assert (= (and b!35429 res!21508) b!35435))

(assert (= (and b!35435 res!21512) b!35431))

(assert (= (and b!35431 res!21514) b!35430))

(assert (= (and b!35430 res!21513) b!35432))

(assert (= (and b!35432 res!21515) b!35428))

(assert (= (and b!35428 res!21509) b!35427))

(assert (= (and b!35427 res!21511) b!35433))

(assert (= (and b!35436 condMapEmpty!1984) mapIsEmpty!1984))

(assert (= (and b!35436 (not condMapEmpty!1984)) mapNonEmpty!1984))

(assert (= (and mapNonEmpty!1984 ((_ is ValueCellFull!611) mapValue!1984)) b!35426))

(assert (= (and b!35436 ((_ is ValueCellFull!611) mapDefault!1984)) b!35434))

(assert (= start!4542 b!35436))

(declare-fun m!28385 () Bool)

(assert (=> b!35430 m!28385))

(declare-fun m!28387 () Bool)

(assert (=> mapNonEmpty!1984 m!28387))

(declare-fun m!28389 () Bool)

(assert (=> start!4542 m!28389))

(declare-fun m!28391 () Bool)

(assert (=> start!4542 m!28391))

(declare-fun m!28393 () Bool)

(assert (=> start!4542 m!28393))

(declare-fun m!28395 () Bool)

(assert (=> b!35435 m!28395))

(declare-fun m!28397 () Bool)

(assert (=> b!35428 m!28397))

(declare-fun m!28399 () Bool)

(assert (=> b!35431 m!28399))

(declare-fun m!28401 () Bool)

(assert (=> b!35427 m!28401))

(declare-fun m!28403 () Bool)

(assert (=> b!35433 m!28403))

(assert (=> b!35433 m!28403))

(declare-fun m!28405 () Bool)

(assert (=> b!35433 m!28405))

(declare-fun m!28407 () Bool)

(assert (=> b!35433 m!28407))

(declare-fun m!28409 () Bool)

(assert (=> b!35432 m!28409))

(declare-fun m!28411 () Bool)

(assert (=> b!35432 m!28411))

(check-sat (not b!35431) (not start!4542) tp_is_empty!1621 (not b!35435) (not mapNonEmpty!1984) (not b!35427) (not b!35432) (not b!35430) (not b!35433) b_and!2083 (not b_next!1267) (not b!35428))
(check-sat b_and!2083 (not b_next!1267))
(get-model)

(declare-fun d!5285 () Bool)

(declare-fun res!21568 () Bool)

(declare-fun e!22424 () Bool)

(assert (=> d!5285 (=> res!21568 e!22424)))

(assert (=> d!5285 (= res!21568 (= (select (arr!1166 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5285 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22424)))

(declare-fun b!35507 () Bool)

(declare-fun e!22425 () Bool)

(assert (=> b!35507 (= e!22424 e!22425)))

(declare-fun res!21569 () Bool)

(assert (=> b!35507 (=> (not res!21569) (not e!22425))))

(assert (=> b!35507 (= res!21569 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1267 _keys!1833)))))

(declare-fun b!35508 () Bool)

(assert (=> b!35508 (= e!22425 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5285 (not res!21568)) b!35507))

(assert (= (and b!35507 res!21569) b!35508))

(declare-fun m!28469 () Bool)

(assert (=> d!5285 m!28469))

(declare-fun m!28471 () Bool)

(assert (=> b!35508 m!28471))

(assert (=> b!35428 d!5285))

(declare-fun d!5287 () Bool)

(declare-fun e!22431 () Bool)

(assert (=> d!5287 e!22431))

(declare-fun res!21572 () Bool)

(assert (=> d!5287 (=> res!21572 e!22431)))

(declare-fun lt!13046 () Bool)

(assert (=> d!5287 (= res!21572 (not lt!13046))))

(declare-fun lt!13045 () Bool)

(assert (=> d!5287 (= lt!13046 lt!13045)))

(declare-fun lt!13048 () Unit!785)

(declare-fun e!22430 () Unit!785)

(assert (=> d!5287 (= lt!13048 e!22430)))

(declare-fun c!4017 () Bool)

(assert (=> d!5287 (= c!4017 lt!13045)))

(declare-fun containsKey!37 (List!923 (_ BitVec 64)) Bool)

(assert (=> d!5287 (= lt!13045 (containsKey!37 (toList!464 lt!13016) k0!1304))))

(assert (=> d!5287 (= (contains!414 lt!13016 k0!1304) lt!13046)))

(declare-fun b!35515 () Bool)

(declare-fun lt!13047 () Unit!785)

(assert (=> b!35515 (= e!22430 lt!13047)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!34 (List!923 (_ BitVec 64)) Unit!785)

(assert (=> b!35515 (= lt!13047 (lemmaContainsKeyImpliesGetValueByKeyDefined!34 (toList!464 lt!13016) k0!1304))))

(declare-datatypes ((Option!79 0))(
  ( (Some!78 (v!1937 V!1987)) (None!77) )
))
(declare-fun isDefined!35 (Option!79) Bool)

(declare-fun getValueByKey!73 (List!923 (_ BitVec 64)) Option!79)

(assert (=> b!35515 (isDefined!35 (getValueByKey!73 (toList!464 lt!13016) k0!1304))))

(declare-fun b!35516 () Bool)

(declare-fun Unit!791 () Unit!785)

(assert (=> b!35516 (= e!22430 Unit!791)))

(declare-fun b!35517 () Bool)

(assert (=> b!35517 (= e!22431 (isDefined!35 (getValueByKey!73 (toList!464 lt!13016) k0!1304)))))

(assert (= (and d!5287 c!4017) b!35515))

(assert (= (and d!5287 (not c!4017)) b!35516))

(assert (= (and d!5287 (not res!21572)) b!35517))

(declare-fun m!28473 () Bool)

(assert (=> d!5287 m!28473))

(declare-fun m!28475 () Bool)

(assert (=> b!35515 m!28475))

(declare-fun m!28477 () Bool)

(assert (=> b!35515 m!28477))

(assert (=> b!35515 m!28477))

(declare-fun m!28479 () Bool)

(assert (=> b!35515 m!28479))

(assert (=> b!35517 m!28477))

(assert (=> b!35517 m!28477))

(assert (=> b!35517 m!28479))

(assert (=> b!35432 d!5287))

(declare-fun b!35560 () Bool)

(declare-fun e!22469 () Bool)

(declare-fun lt!13096 () ListLongMap!897)

(declare-fun apply!41 (ListLongMap!897 (_ BitVec 64)) V!1987)

(assert (=> b!35560 (= e!22469 (= (apply!41 lt!13096 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!35561 () Bool)

(declare-fun e!22466 () Bool)

(assert (=> b!35561 (= e!22466 e!22469)))

(declare-fun res!21595 () Bool)

(declare-fun call!2811 () Bool)

(assert (=> b!35561 (= res!21595 call!2811)))

(assert (=> b!35561 (=> (not res!21595) (not e!22469))))

(declare-fun b!35562 () Bool)

(declare-fun e!22467 () Bool)

(assert (=> b!35562 (= e!22467 (validKeyInArray!0 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35563 () Bool)

(declare-fun c!4030 () Bool)

(assert (=> b!35563 (= c!4030 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!22465 () ListLongMap!897)

(declare-fun e!22470 () ListLongMap!897)

(assert (=> b!35563 (= e!22465 e!22470)))

(declare-fun b!35564 () Bool)

(declare-fun e!22461 () Bool)

(assert (=> b!35564 (= e!22461 e!22466)))

(declare-fun c!4032 () Bool)

(assert (=> b!35564 (= c!4032 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2803 () Bool)

(declare-fun call!2810 () ListLongMap!897)

(declare-fun call!2812 () ListLongMap!897)

(assert (=> bm!2803 (= call!2810 call!2812)))

(declare-fun bm!2804 () Bool)

(assert (=> bm!2804 (= call!2811 (contains!414 lt!13096 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35565 () Bool)

(declare-fun e!22458 () Bool)

(declare-fun e!22463 () Bool)

(assert (=> b!35565 (= e!22458 e!22463)))

(declare-fun res!21593 () Bool)

(assert (=> b!35565 (=> (not res!21593) (not e!22463))))

(assert (=> b!35565 (= res!21593 (contains!414 lt!13096 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1267 _keys!1833)))))

(declare-fun b!35566 () Bool)

(declare-fun e!22464 () ListLongMap!897)

(assert (=> b!35566 (= e!22464 e!22465)))

(declare-fun c!4034 () Bool)

(assert (=> b!35566 (= c!4034 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35567 () Bool)

(declare-fun e!22462 () Unit!785)

(declare-fun Unit!792 () Unit!785)

(assert (=> b!35567 (= e!22462 Unit!792)))

(declare-fun b!35568 () Bool)

(declare-fun call!2806 () ListLongMap!897)

(assert (=> b!35568 (= e!22465 call!2806)))

(declare-fun b!35569 () Bool)

(declare-fun e!22468 () Bool)

(declare-fun e!22460 () Bool)

(assert (=> b!35569 (= e!22468 e!22460)))

(declare-fun res!21594 () Bool)

(declare-fun call!2808 () Bool)

(assert (=> b!35569 (= res!21594 call!2808)))

(assert (=> b!35569 (=> (not res!21594) (not e!22460))))

(declare-fun bm!2805 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!28 (array!2441 array!2443 (_ BitVec 32) (_ BitVec 32) V!1987 V!1987 (_ BitVec 32) Int) ListLongMap!897)

(assert (=> bm!2805 (= call!2812 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35570 () Bool)

(declare-fun lt!13100 () Unit!785)

(assert (=> b!35570 (= e!22462 lt!13100)))

(declare-fun lt!13103 () ListLongMap!897)

(assert (=> b!35570 (= lt!13103 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13114 () (_ BitVec 64))

(assert (=> b!35570 (= lt!13114 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13104 () (_ BitVec 64))

(assert (=> b!35570 (= lt!13104 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13108 () Unit!785)

(declare-fun addStillContains!26 (ListLongMap!897 (_ BitVec 64) V!1987 (_ BitVec 64)) Unit!785)

(assert (=> b!35570 (= lt!13108 (addStillContains!26 lt!13103 lt!13114 zeroValue!1443 lt!13104))))

(declare-fun +!58 (ListLongMap!897 tuple2!1326) ListLongMap!897)

(assert (=> b!35570 (contains!414 (+!58 lt!13103 (tuple2!1327 lt!13114 zeroValue!1443)) lt!13104)))

(declare-fun lt!13105 () Unit!785)

(assert (=> b!35570 (= lt!13105 lt!13108)))

(declare-fun lt!13106 () ListLongMap!897)

(assert (=> b!35570 (= lt!13106 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13109 () (_ BitVec 64))

(assert (=> b!35570 (= lt!13109 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13097 () (_ BitVec 64))

(assert (=> b!35570 (= lt!13097 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13110 () Unit!785)

(declare-fun addApplyDifferent!26 (ListLongMap!897 (_ BitVec 64) V!1987 (_ BitVec 64)) Unit!785)

(assert (=> b!35570 (= lt!13110 (addApplyDifferent!26 lt!13106 lt!13109 minValue!1443 lt!13097))))

(assert (=> b!35570 (= (apply!41 (+!58 lt!13106 (tuple2!1327 lt!13109 minValue!1443)) lt!13097) (apply!41 lt!13106 lt!13097))))

(declare-fun lt!13099 () Unit!785)

(assert (=> b!35570 (= lt!13099 lt!13110)))

(declare-fun lt!13095 () ListLongMap!897)

(assert (=> b!35570 (= lt!13095 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13112 () (_ BitVec 64))

(assert (=> b!35570 (= lt!13112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13102 () (_ BitVec 64))

(assert (=> b!35570 (= lt!13102 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13113 () Unit!785)

(assert (=> b!35570 (= lt!13113 (addApplyDifferent!26 lt!13095 lt!13112 zeroValue!1443 lt!13102))))

(assert (=> b!35570 (= (apply!41 (+!58 lt!13095 (tuple2!1327 lt!13112 zeroValue!1443)) lt!13102) (apply!41 lt!13095 lt!13102))))

(declare-fun lt!13101 () Unit!785)

(assert (=> b!35570 (= lt!13101 lt!13113)))

(declare-fun lt!13111 () ListLongMap!897)

(assert (=> b!35570 (= lt!13111 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13093 () (_ BitVec 64))

(assert (=> b!35570 (= lt!13093 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13098 () (_ BitVec 64))

(assert (=> b!35570 (= lt!13098 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35570 (= lt!13100 (addApplyDifferent!26 lt!13111 lt!13093 minValue!1443 lt!13098))))

(assert (=> b!35570 (= (apply!41 (+!58 lt!13111 (tuple2!1327 lt!13093 minValue!1443)) lt!13098) (apply!41 lt!13111 lt!13098))))

(declare-fun b!35571 () Bool)

(declare-fun res!21592 () Bool)

(assert (=> b!35571 (=> (not res!21592) (not e!22461))))

(assert (=> b!35571 (= res!21592 e!22458)))

(declare-fun res!21598 () Bool)

(assert (=> b!35571 (=> res!21598 e!22458)))

(declare-fun e!22459 () Bool)

(assert (=> b!35571 (= res!21598 (not e!22459))))

(declare-fun res!21596 () Bool)

(assert (=> b!35571 (=> (not res!21596) (not e!22459))))

(assert (=> b!35571 (= res!21596 (bvslt #b00000000000000000000000000000000 (size!1267 _keys!1833)))))

(declare-fun call!2809 () ListLongMap!897)

(declare-fun c!4035 () Bool)

(declare-fun bm!2806 () Bool)

(declare-fun call!2807 () ListLongMap!897)

(assert (=> bm!2806 (= call!2807 (+!58 (ite c!4035 call!2812 (ite c!4034 call!2810 call!2809)) (ite (or c!4035 c!4034) (tuple2!1327 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1327 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!35572 () Bool)

(assert (=> b!35572 (= e!22466 (not call!2811))))

(declare-fun b!35573 () Bool)

(assert (=> b!35573 (= e!22470 call!2809)))

(declare-fun b!35574 () Bool)

(assert (=> b!35574 (= e!22460 (= (apply!41 lt!13096 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!35575 () Bool)

(assert (=> b!35575 (= e!22464 (+!58 call!2807 (tuple2!1327 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!35576 () Bool)

(assert (=> b!35576 (= e!22459 (validKeyInArray!0 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35577 () Bool)

(declare-fun res!21591 () Bool)

(assert (=> b!35577 (=> (not res!21591) (not e!22461))))

(assert (=> b!35577 (= res!21591 e!22468)))

(declare-fun c!4031 () Bool)

(assert (=> b!35577 (= c!4031 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!5289 () Bool)

(assert (=> d!5289 e!22461))

(declare-fun res!21599 () Bool)

(assert (=> d!5289 (=> (not res!21599) (not e!22461))))

(assert (=> d!5289 (= res!21599 (or (bvsge #b00000000000000000000000000000000 (size!1267 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1267 _keys!1833)))))))

(declare-fun lt!13094 () ListLongMap!897)

(assert (=> d!5289 (= lt!13096 lt!13094)))

(declare-fun lt!13107 () Unit!785)

(assert (=> d!5289 (= lt!13107 e!22462)))

(declare-fun c!4033 () Bool)

(assert (=> d!5289 (= c!4033 e!22467)))

(declare-fun res!21597 () Bool)

(assert (=> d!5289 (=> (not res!21597) (not e!22467))))

(assert (=> d!5289 (= res!21597 (bvslt #b00000000000000000000000000000000 (size!1267 _keys!1833)))))

(assert (=> d!5289 (= lt!13094 e!22464)))

(assert (=> d!5289 (= c!4035 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5289 (validMask!0 mask!2294)))

(assert (=> d!5289 (= (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13096)))

(declare-fun bm!2807 () Bool)

(assert (=> bm!2807 (= call!2806 call!2807)))

(declare-fun b!35578 () Bool)

(assert (=> b!35578 (= e!22470 call!2806)))

(declare-fun bm!2808 () Bool)

(assert (=> bm!2808 (= call!2808 (contains!414 lt!13096 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2809 () Bool)

(assert (=> bm!2809 (= call!2809 call!2810)))

(declare-fun b!35579 () Bool)

(declare-fun get!606 (ValueCell!611 V!1987) V!1987)

(declare-fun dynLambda!154 (Int (_ BitVec 64)) V!1987)

(assert (=> b!35579 (= e!22463 (= (apply!41 lt!13096 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000)) (get!606 (select (arr!1167 _values!1501) #b00000000000000000000000000000000) (dynLambda!154 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35579 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1268 _values!1501)))))

(assert (=> b!35579 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1267 _keys!1833)))))

(declare-fun b!35580 () Bool)

(assert (=> b!35580 (= e!22468 (not call!2808))))

(assert (= (and d!5289 c!4035) b!35575))

(assert (= (and d!5289 (not c!4035)) b!35566))

(assert (= (and b!35566 c!4034) b!35568))

(assert (= (and b!35566 (not c!4034)) b!35563))

(assert (= (and b!35563 c!4030) b!35578))

(assert (= (and b!35563 (not c!4030)) b!35573))

(assert (= (or b!35578 b!35573) bm!2809))

(assert (= (or b!35568 bm!2809) bm!2803))

(assert (= (or b!35568 b!35578) bm!2807))

(assert (= (or b!35575 bm!2803) bm!2805))

(assert (= (or b!35575 bm!2807) bm!2806))

(assert (= (and d!5289 res!21597) b!35562))

(assert (= (and d!5289 c!4033) b!35570))

(assert (= (and d!5289 (not c!4033)) b!35567))

(assert (= (and d!5289 res!21599) b!35571))

(assert (= (and b!35571 res!21596) b!35576))

(assert (= (and b!35571 (not res!21598)) b!35565))

(assert (= (and b!35565 res!21593) b!35579))

(assert (= (and b!35571 res!21592) b!35577))

(assert (= (and b!35577 c!4031) b!35569))

(assert (= (and b!35577 (not c!4031)) b!35580))

(assert (= (and b!35569 res!21594) b!35574))

(assert (= (or b!35569 b!35580) bm!2808))

(assert (= (and b!35577 res!21591) b!35564))

(assert (= (and b!35564 c!4032) b!35561))

(assert (= (and b!35564 (not c!4032)) b!35572))

(assert (= (and b!35561 res!21595) b!35560))

(assert (= (or b!35561 b!35572) bm!2804))

(declare-fun b_lambda!1711 () Bool)

(assert (=> (not b_lambda!1711) (not b!35579)))

(declare-fun t!3632 () Bool)

(declare-fun tb!691 () Bool)

(assert (=> (and start!4542 (= defaultEntry!1504 defaultEntry!1504) t!3632) tb!691))

(declare-fun result!1195 () Bool)

(assert (=> tb!691 (= result!1195 tp_is_empty!1621)))

(assert (=> b!35579 t!3632))

(declare-fun b_and!2089 () Bool)

(assert (= b_and!2083 (and (=> t!3632 result!1195) b_and!2089)))

(assert (=> b!35562 m!28469))

(assert (=> b!35562 m!28469))

(declare-fun m!28481 () Bool)

(assert (=> b!35562 m!28481))

(declare-fun m!28483 () Bool)

(assert (=> b!35579 m!28483))

(declare-fun m!28485 () Bool)

(assert (=> b!35579 m!28485))

(assert (=> b!35579 m!28485))

(assert (=> b!35579 m!28483))

(declare-fun m!28487 () Bool)

(assert (=> b!35579 m!28487))

(assert (=> b!35579 m!28469))

(declare-fun m!28489 () Bool)

(assert (=> b!35579 m!28489))

(assert (=> b!35579 m!28469))

(declare-fun m!28491 () Bool)

(assert (=> bm!2806 m!28491))

(declare-fun m!28493 () Bool)

(assert (=> bm!2804 m!28493))

(declare-fun m!28495 () Bool)

(assert (=> bm!2808 m!28495))

(assert (=> b!35576 m!28469))

(assert (=> b!35576 m!28469))

(assert (=> b!35576 m!28481))

(declare-fun m!28497 () Bool)

(assert (=> b!35570 m!28497))

(declare-fun m!28499 () Bool)

(assert (=> b!35570 m!28499))

(declare-fun m!28501 () Bool)

(assert (=> b!35570 m!28501))

(declare-fun m!28503 () Bool)

(assert (=> b!35570 m!28503))

(declare-fun m!28505 () Bool)

(assert (=> b!35570 m!28505))

(declare-fun m!28507 () Bool)

(assert (=> b!35570 m!28507))

(declare-fun m!28509 () Bool)

(assert (=> b!35570 m!28509))

(assert (=> b!35570 m!28469))

(declare-fun m!28511 () Bool)

(assert (=> b!35570 m!28511))

(assert (=> b!35570 m!28497))

(declare-fun m!28513 () Bool)

(assert (=> b!35570 m!28513))

(declare-fun m!28515 () Bool)

(assert (=> b!35570 m!28515))

(declare-fun m!28517 () Bool)

(assert (=> b!35570 m!28517))

(declare-fun m!28519 () Bool)

(assert (=> b!35570 m!28519))

(declare-fun m!28521 () Bool)

(assert (=> b!35570 m!28521))

(declare-fun m!28523 () Bool)

(assert (=> b!35570 m!28523))

(declare-fun m!28525 () Bool)

(assert (=> b!35570 m!28525))

(assert (=> b!35570 m!28501))

(assert (=> b!35570 m!28521))

(assert (=> b!35570 m!28517))

(declare-fun m!28527 () Bool)

(assert (=> b!35570 m!28527))

(declare-fun m!28529 () Bool)

(assert (=> b!35574 m!28529))

(assert (=> d!5289 m!28389))

(declare-fun m!28531 () Bool)

(assert (=> b!35575 m!28531))

(assert (=> bm!2805 m!28509))

(assert (=> b!35565 m!28469))

(assert (=> b!35565 m!28469))

(declare-fun m!28533 () Bool)

(assert (=> b!35565 m!28533))

(declare-fun m!28535 () Bool)

(assert (=> b!35560 m!28535))

(assert (=> b!35432 d!5289))

(declare-fun b!35595 () Bool)

(declare-fun e!22478 () SeekEntryResult!152)

(declare-fun lt!13124 () SeekEntryResult!152)

(assert (=> b!35595 (= e!22478 (Found!152 (index!2732 lt!13124)))))

(declare-fun b!35596 () Bool)

(declare-fun e!22479 () SeekEntryResult!152)

(assert (=> b!35596 (= e!22479 (MissingZero!152 (index!2732 lt!13124)))))

(declare-fun b!35597 () Bool)

(declare-fun e!22477 () SeekEntryResult!152)

(assert (=> b!35597 (= e!22477 Undefined!152)))

(declare-fun b!35598 () Bool)

(declare-fun lt!13126 () SeekEntryResult!152)

(assert (=> b!35598 (= e!22479 (ite ((_ is MissingVacant!152) lt!13126) (MissingZero!152 (index!2733 lt!13126)) lt!13126))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2441 (_ BitVec 32)) SeekEntryResult!152)

(assert (=> b!35598 (= lt!13126 (seekKeyOrZeroReturnVacant!0 (x!7014 lt!13124) (index!2732 lt!13124) (index!2732 lt!13124) k0!1304 _keys!1833 mask!2294))))

(declare-fun d!5291 () Bool)

(declare-fun lt!13125 () SeekEntryResult!152)

(assert (=> d!5291 (and (or ((_ is MissingVacant!152) lt!13125) (not ((_ is Found!152) lt!13125)) (and (bvsge (index!2731 lt!13125) #b00000000000000000000000000000000) (bvslt (index!2731 lt!13125) (size!1267 _keys!1833)))) (not ((_ is MissingVacant!152) lt!13125)) (or (not ((_ is Found!152) lt!13125)) (= (select (arr!1166 _keys!1833) (index!2731 lt!13125)) k0!1304)))))

(assert (=> d!5291 (= lt!13125 e!22477)))

(declare-fun c!4044 () Bool)

(assert (=> d!5291 (= c!4044 (and ((_ is Intermediate!152) lt!13124) (undefined!964 lt!13124)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2441 (_ BitVec 32)) SeekEntryResult!152)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5291 (= lt!13124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5291 (validMask!0 mask!2294)))

(assert (=> d!5291 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!13125)))

(declare-fun b!35599 () Bool)

(declare-fun c!4043 () Bool)

(declare-fun lt!13123 () (_ BitVec 64))

(assert (=> b!35599 (= c!4043 (= lt!13123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!35599 (= e!22478 e!22479)))

(declare-fun b!35600 () Bool)

(assert (=> b!35600 (= e!22477 e!22478)))

(assert (=> b!35600 (= lt!13123 (select (arr!1166 _keys!1833) (index!2732 lt!13124)))))

(declare-fun c!4042 () Bool)

(assert (=> b!35600 (= c!4042 (= lt!13123 k0!1304))))

(assert (= (and d!5291 c!4044) b!35597))

(assert (= (and d!5291 (not c!4044)) b!35600))

(assert (= (and b!35600 c!4042) b!35595))

(assert (= (and b!35600 (not c!4042)) b!35599))

(assert (= (and b!35599 c!4043) b!35596))

(assert (= (and b!35599 (not c!4043)) b!35598))

(declare-fun m!28537 () Bool)

(assert (=> b!35598 m!28537))

(declare-fun m!28539 () Bool)

(assert (=> d!5291 m!28539))

(declare-fun m!28541 () Bool)

(assert (=> d!5291 m!28541))

(assert (=> d!5291 m!28541))

(declare-fun m!28543 () Bool)

(assert (=> d!5291 m!28543))

(assert (=> d!5291 m!28389))

(declare-fun m!28545 () Bool)

(assert (=> b!35600 m!28545))

(assert (=> b!35427 d!5291))

(declare-fun d!5293 () Bool)

(assert (=> d!5293 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35430 d!5293))

(declare-fun d!5295 () Bool)

(declare-fun e!22481 () Bool)

(assert (=> d!5295 e!22481))

(declare-fun res!21600 () Bool)

(assert (=> d!5295 (=> res!21600 e!22481)))

(declare-fun lt!13128 () Bool)

(assert (=> d!5295 (= res!21600 (not lt!13128))))

(declare-fun lt!13127 () Bool)

(assert (=> d!5295 (= lt!13128 lt!13127)))

(declare-fun lt!13130 () Unit!785)

(declare-fun e!22480 () Unit!785)

(assert (=> d!5295 (= lt!13130 e!22480)))

(declare-fun c!4045 () Bool)

(assert (=> d!5295 (= c!4045 lt!13127)))

(assert (=> d!5295 (= lt!13127 (containsKey!37 (toList!464 lt!13016) (select (arr!1166 _keys!1833) (index!2731 lt!13018))))))

(assert (=> d!5295 (= (contains!414 lt!13016 (select (arr!1166 _keys!1833) (index!2731 lt!13018))) lt!13128)))

(declare-fun b!35601 () Bool)

(declare-fun lt!13129 () Unit!785)

(assert (=> b!35601 (= e!22480 lt!13129)))

(assert (=> b!35601 (= lt!13129 (lemmaContainsKeyImpliesGetValueByKeyDefined!34 (toList!464 lt!13016) (select (arr!1166 _keys!1833) (index!2731 lt!13018))))))

(assert (=> b!35601 (isDefined!35 (getValueByKey!73 (toList!464 lt!13016) (select (arr!1166 _keys!1833) (index!2731 lt!13018))))))

(declare-fun b!35602 () Bool)

(declare-fun Unit!793 () Unit!785)

(assert (=> b!35602 (= e!22480 Unit!793)))

(declare-fun b!35603 () Bool)

(assert (=> b!35603 (= e!22481 (isDefined!35 (getValueByKey!73 (toList!464 lt!13016) (select (arr!1166 _keys!1833) (index!2731 lt!13018)))))))

(assert (= (and d!5295 c!4045) b!35601))

(assert (= (and d!5295 (not c!4045)) b!35602))

(assert (= (and d!5295 (not res!21600)) b!35603))

(assert (=> d!5295 m!28403))

(declare-fun m!28547 () Bool)

(assert (=> d!5295 m!28547))

(assert (=> b!35601 m!28403))

(declare-fun m!28549 () Bool)

(assert (=> b!35601 m!28549))

(assert (=> b!35601 m!28403))

(declare-fun m!28551 () Bool)

(assert (=> b!35601 m!28551))

(assert (=> b!35601 m!28551))

(declare-fun m!28553 () Bool)

(assert (=> b!35601 m!28553))

(assert (=> b!35603 m!28403))

(assert (=> b!35603 m!28551))

(assert (=> b!35603 m!28551))

(assert (=> b!35603 m!28553))

(assert (=> b!35433 d!5295))

(declare-fun d!5297 () Bool)

(declare-fun e!22484 () Bool)

(assert (=> d!5297 e!22484))

(declare-fun res!21603 () Bool)

(assert (=> d!5297 (=> (not res!21603) (not e!22484))))

(assert (=> d!5297 (= res!21603 (and (bvsge (index!2731 lt!13018) #b00000000000000000000000000000000) (bvslt (index!2731 lt!13018) (size!1267 _keys!1833))))))

(declare-fun lt!13133 () Unit!785)

(declare-fun choose!221 (array!2441 array!2443 (_ BitVec 32) (_ BitVec 32) V!1987 V!1987 (_ BitVec 32) Int) Unit!785)

(assert (=> d!5297 (= lt!13133 (choose!221 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2731 lt!13018) defaultEntry!1504))))

(assert (=> d!5297 (validMask!0 mask!2294)))

(assert (=> d!5297 (= (lemmaValidKeyInArrayIsInListMap!68 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2731 lt!13018) defaultEntry!1504) lt!13133)))

(declare-fun b!35606 () Bool)

(assert (=> b!35606 (= e!22484 (contains!414 (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1166 _keys!1833) (index!2731 lt!13018))))))

(assert (= (and d!5297 res!21603) b!35606))

(declare-fun m!28555 () Bool)

(assert (=> d!5297 m!28555))

(assert (=> d!5297 m!28389))

(assert (=> b!35606 m!28411))

(assert (=> b!35606 m!28403))

(assert (=> b!35606 m!28411))

(assert (=> b!35606 m!28403))

(declare-fun m!28557 () Bool)

(assert (=> b!35606 m!28557))

(assert (=> b!35433 d!5297))

(declare-fun b!35615 () Bool)

(declare-fun e!22492 () Bool)

(declare-fun call!2815 () Bool)

(assert (=> b!35615 (= e!22492 call!2815)))

(declare-fun b!35616 () Bool)

(declare-fun e!22493 () Bool)

(assert (=> b!35616 (= e!22492 e!22493)))

(declare-fun lt!13142 () (_ BitVec 64))

(assert (=> b!35616 (= lt!13142 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13141 () Unit!785)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2441 (_ BitVec 64) (_ BitVec 32)) Unit!785)

(assert (=> b!35616 (= lt!13141 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13142 #b00000000000000000000000000000000))))

(assert (=> b!35616 (arrayContainsKey!0 _keys!1833 lt!13142 #b00000000000000000000000000000000)))

(declare-fun lt!13140 () Unit!785)

(assert (=> b!35616 (= lt!13140 lt!13141)))

(declare-fun res!21608 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2441 (_ BitVec 32)) SeekEntryResult!152)

(assert (=> b!35616 (= res!21608 (= (seekEntryOrOpen!0 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!152 #b00000000000000000000000000000000)))))

(assert (=> b!35616 (=> (not res!21608) (not e!22493))))

(declare-fun b!35617 () Bool)

(declare-fun e!22491 () Bool)

(assert (=> b!35617 (= e!22491 e!22492)))

(declare-fun c!4048 () Bool)

(assert (=> b!35617 (= c!4048 (validKeyInArray!0 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2812 () Bool)

(assert (=> bm!2812 (= call!2815 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!5299 () Bool)

(declare-fun res!21609 () Bool)

(assert (=> d!5299 (=> res!21609 e!22491)))

(assert (=> d!5299 (= res!21609 (bvsge #b00000000000000000000000000000000 (size!1267 _keys!1833)))))

(assert (=> d!5299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22491)))

(declare-fun b!35618 () Bool)

(assert (=> b!35618 (= e!22493 call!2815)))

(assert (= (and d!5299 (not res!21609)) b!35617))

(assert (= (and b!35617 c!4048) b!35616))

(assert (= (and b!35617 (not c!4048)) b!35615))

(assert (= (and b!35616 res!21608) b!35618))

(assert (= (or b!35618 b!35615) bm!2812))

(assert (=> b!35616 m!28469))

(declare-fun m!28559 () Bool)

(assert (=> b!35616 m!28559))

(declare-fun m!28561 () Bool)

(assert (=> b!35616 m!28561))

(assert (=> b!35616 m!28469))

(declare-fun m!28563 () Bool)

(assert (=> b!35616 m!28563))

(assert (=> b!35617 m!28469))

(assert (=> b!35617 m!28469))

(assert (=> b!35617 m!28481))

(declare-fun m!28565 () Bool)

(assert (=> bm!2812 m!28565))

(assert (=> b!35435 d!5299))

(declare-fun d!5301 () Bool)

(assert (=> d!5301 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4542 d!5301))

(declare-fun d!5303 () Bool)

(assert (=> d!5303 (= (array_inv!799 _values!1501) (bvsge (size!1268 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4542 d!5303))

(declare-fun d!5305 () Bool)

(assert (=> d!5305 (= (array_inv!800 _keys!1833) (bvsge (size!1267 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4542 d!5305))

(declare-fun d!5307 () Bool)

(declare-fun res!21616 () Bool)

(declare-fun e!22503 () Bool)

(assert (=> d!5307 (=> res!21616 e!22503)))

(assert (=> d!5307 (= res!21616 (bvsge #b00000000000000000000000000000000 (size!1267 _keys!1833)))))

(assert (=> d!5307 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!919) e!22503)))

(declare-fun bm!2815 () Bool)

(declare-fun call!2818 () Bool)

(declare-fun c!4051 () Bool)

(assert (=> bm!2815 (= call!2818 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4051 (Cons!918 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000) Nil!919) Nil!919)))))

(declare-fun b!35629 () Bool)

(declare-fun e!22504 () Bool)

(declare-fun e!22505 () Bool)

(assert (=> b!35629 (= e!22504 e!22505)))

(assert (=> b!35629 (= c!4051 (validKeyInArray!0 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35630 () Bool)

(assert (=> b!35630 (= e!22505 call!2818)))

(declare-fun b!35631 () Bool)

(declare-fun e!22502 () Bool)

(declare-fun contains!417 (List!922 (_ BitVec 64)) Bool)

(assert (=> b!35631 (= e!22502 (contains!417 Nil!919 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35632 () Bool)

(assert (=> b!35632 (= e!22503 e!22504)))

(declare-fun res!21617 () Bool)

(assert (=> b!35632 (=> (not res!21617) (not e!22504))))

(assert (=> b!35632 (= res!21617 (not e!22502))))

(declare-fun res!21618 () Bool)

(assert (=> b!35632 (=> (not res!21618) (not e!22502))))

(assert (=> b!35632 (= res!21618 (validKeyInArray!0 (select (arr!1166 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35633 () Bool)

(assert (=> b!35633 (= e!22505 call!2818)))

(assert (= (and d!5307 (not res!21616)) b!35632))

(assert (= (and b!35632 res!21618) b!35631))

(assert (= (and b!35632 res!21617) b!35629))

(assert (= (and b!35629 c!4051) b!35630))

(assert (= (and b!35629 (not c!4051)) b!35633))

(assert (= (or b!35630 b!35633) bm!2815))

(assert (=> bm!2815 m!28469))

(declare-fun m!28567 () Bool)

(assert (=> bm!2815 m!28567))

(assert (=> b!35629 m!28469))

(assert (=> b!35629 m!28469))

(assert (=> b!35629 m!28481))

(assert (=> b!35631 m!28469))

(assert (=> b!35631 m!28469))

(declare-fun m!28569 () Bool)

(assert (=> b!35631 m!28569))

(assert (=> b!35632 m!28469))

(assert (=> b!35632 m!28469))

(assert (=> b!35632 m!28481))

(assert (=> b!35431 d!5307))

(declare-fun mapIsEmpty!1993 () Bool)

(declare-fun mapRes!1993 () Bool)

(assert (=> mapIsEmpty!1993 mapRes!1993))

(declare-fun mapNonEmpty!1993 () Bool)

(declare-fun tp!5260 () Bool)

(declare-fun e!22510 () Bool)

(assert (=> mapNonEmpty!1993 (= mapRes!1993 (and tp!5260 e!22510))))

(declare-fun mapKey!1993 () (_ BitVec 32))

(declare-fun mapRest!1993 () (Array (_ BitVec 32) ValueCell!611))

(declare-fun mapValue!1993 () ValueCell!611)

(assert (=> mapNonEmpty!1993 (= mapRest!1984 (store mapRest!1993 mapKey!1993 mapValue!1993))))

(declare-fun condMapEmpty!1993 () Bool)

(declare-fun mapDefault!1993 () ValueCell!611)

(assert (=> mapNonEmpty!1984 (= condMapEmpty!1993 (= mapRest!1984 ((as const (Array (_ BitVec 32) ValueCell!611)) mapDefault!1993)))))

(declare-fun e!22511 () Bool)

(assert (=> mapNonEmpty!1984 (= tp!5245 (and e!22511 mapRes!1993))))

(declare-fun b!35640 () Bool)

(assert (=> b!35640 (= e!22510 tp_is_empty!1621)))

(declare-fun b!35641 () Bool)

(assert (=> b!35641 (= e!22511 tp_is_empty!1621)))

(assert (= (and mapNonEmpty!1984 condMapEmpty!1993) mapIsEmpty!1993))

(assert (= (and mapNonEmpty!1984 (not condMapEmpty!1993)) mapNonEmpty!1993))

(assert (= (and mapNonEmpty!1993 ((_ is ValueCellFull!611) mapValue!1993)) b!35640))

(assert (= (and mapNonEmpty!1984 ((_ is ValueCellFull!611) mapDefault!1993)) b!35641))

(declare-fun m!28571 () Bool)

(assert (=> mapNonEmpty!1993 m!28571))

(declare-fun b_lambda!1713 () Bool)

(assert (= b_lambda!1711 (or (and start!4542 b_free!1267) b_lambda!1713)))

(check-sat (not b!35598) (not b!35517) (not b!35515) (not bm!2805) (not b!35562) (not b!35606) (not b!35601) (not d!5291) (not bm!2804) (not b!35579) (not d!5289) (not bm!2806) (not b!35575) (not mapNonEmpty!1993) tp_is_empty!1621 (not b!35565) (not d!5295) (not b!35603) (not b!35576) (not b!35574) (not d!5287) (not bm!2815) (not b!35570) (not b!35632) (not b!35508) (not b_next!1267) (not b!35629) (not b!35617) (not b_lambda!1713) (not b!35616) (not bm!2808) (not b!35631) b_and!2089 (not d!5297) (not bm!2812) (not b!35560))
(check-sat b_and!2089 (not b_next!1267))
