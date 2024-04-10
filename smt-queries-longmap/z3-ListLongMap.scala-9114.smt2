; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109470 () Bool)

(assert start!109470)

(declare-fun b_free!28959 () Bool)

(declare-fun b_next!28959 () Bool)

(assert (=> start!109470 (= b_free!28959 (not b_next!28959))))

(declare-fun tp!101996 () Bool)

(declare-fun b_and!47049 () Bool)

(assert (=> start!109470 (= tp!101996 b_and!47049)))

(declare-datatypes ((V!51235 0))(
  ( (V!51236 (val!17374 Int)) )
))
(declare-fun minValue!1387 () V!51235)

(declare-fun zeroValue!1387 () V!51235)

(declare-datatypes ((tuple2!22380 0))(
  ( (tuple2!22381 (_1!11201 (_ BitVec 64)) (_2!11201 V!51235)) )
))
(declare-datatypes ((List!29519 0))(
  ( (Nil!29516) (Cons!29515 (h!30724 tuple2!22380) (t!43083 List!29519)) )
))
(declare-datatypes ((ListLongMap!20037 0))(
  ( (ListLongMap!20038 (toList!10034 List!29519)) )
))
(declare-fun lt!580434 () ListLongMap!20037)

(declare-fun lt!580435 () ListLongMap!20037)

(declare-fun c!124405 () Bool)

(declare-fun bm!63459 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!580447 () ListLongMap!20037)

(declare-fun c!124404 () Bool)

(declare-datatypes ((Unit!42952 0))(
  ( (Unit!42953) )
))
(declare-fun call!63466 () Unit!42952)

(declare-fun addStillNotContains!455 (ListLongMap!20037 (_ BitVec 64) V!51235 (_ BitVec 64)) Unit!42952)

(assert (=> bm!63459 (= call!63466 (addStillNotContains!455 (ite c!124404 lt!580435 (ite c!124405 lt!580434 lt!580447)) (ite c!124404 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124405 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124404 minValue!1387 (ite c!124405 zeroValue!1387 minValue!1387)) k0!1205))))

(declare-fun b!1296498 () Bool)

(declare-fun e!739658 () Bool)

(declare-fun tp_is_empty!34599 () Bool)

(assert (=> b!1296498 (= e!739658 tp_is_empty!34599)))

(declare-fun mapIsEmpty!53459 () Bool)

(declare-fun mapRes!53459 () Bool)

(assert (=> mapIsEmpty!53459 mapRes!53459))

(declare-fun b!1296499 () Bool)

(declare-fun res!861664 () Bool)

(declare-fun e!739652 () Bool)

(assert (=> b!1296499 (=> (not res!861664) (not e!739652))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86216 0))(
  ( (array!86217 (arr!41609 (Array (_ BitVec 32) (_ BitVec 64))) (size!42159 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86216)

(assert (=> b!1296499 (= res!861664 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42159 _keys!1741))))))

(declare-fun bm!63460 () Bool)

(declare-fun call!63467 () Unit!42952)

(assert (=> bm!63460 (= call!63467 call!63466)))

(declare-fun b!1296500 () Bool)

(declare-fun res!861666 () Bool)

(assert (=> b!1296500 (=> (not res!861666) (not e!739652))))

(declare-datatypes ((ValueCell!16401 0))(
  ( (ValueCellFull!16401 (v!19977 V!51235)) (EmptyCell!16401) )
))
(declare-datatypes ((array!86218 0))(
  ( (array!86219 (arr!41610 (Array (_ BitVec 32) ValueCell!16401)) (size!42160 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86218)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun contains!8152 (ListLongMap!20037 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5064 (array!86216 array!86218 (_ BitVec 32) (_ BitVec 32) V!51235 V!51235 (_ BitVec 32) Int) ListLongMap!20037)

(assert (=> b!1296500 (= res!861666 (contains!8152 (getCurrentListMap!5064 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63461 () Bool)

(declare-fun call!63473 () ListLongMap!20037)

(declare-fun call!63472 () ListLongMap!20037)

(assert (=> bm!63461 (= call!63473 call!63472)))

(declare-fun b!1296501 () Bool)

(declare-fun res!861669 () Bool)

(assert (=> b!1296501 (=> (not res!861669) (not e!739652))))

(assert (=> b!1296501 (= res!861669 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42159 _keys!1741))))))

(declare-fun b!1296502 () Bool)

(declare-fun res!861662 () Bool)

(assert (=> b!1296502 (=> (not res!861662) (not e!739652))))

(declare-datatypes ((List!29520 0))(
  ( (Nil!29517) (Cons!29516 (h!30725 (_ BitVec 64)) (t!43084 List!29520)) )
))
(declare-fun arrayNoDuplicates!0 (array!86216 (_ BitVec 32) List!29520) Bool)

(assert (=> b!1296502 (= res!861662 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29517))))

(declare-fun b!1296503 () Bool)

(declare-fun e!739656 () Unit!42952)

(declare-fun Unit!42954 () Unit!42952)

(assert (=> b!1296503 (= e!739656 Unit!42954)))

(declare-fun b!1296504 () Bool)

(declare-fun res!861668 () Bool)

(assert (=> b!1296504 (=> (not res!861668) (not e!739652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86216 (_ BitVec 32)) Bool)

(assert (=> b!1296504 (= res!861668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296505 () Bool)

(declare-fun res!861667 () Bool)

(assert (=> b!1296505 (=> (not res!861667) (not e!739652))))

(assert (=> b!1296505 (= res!861667 (and (= (size!42160 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42159 _keys!1741) (size!42160 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296506 () Bool)

(assert (=> b!1296506 (= e!739652 (not true))))

(declare-fun lt!580437 () Unit!42952)

(declare-fun e!739657 () Unit!42952)

(assert (=> b!1296506 (= lt!580437 e!739657)))

(declare-fun lt!580436 () Bool)

(assert (=> b!1296506 (= c!124404 (and (not lt!580436) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296506 (= lt!580436 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1296506 (not (contains!8152 (ListLongMap!20038 Nil!29516) k0!1205))))

(declare-fun lt!580441 () Unit!42952)

(declare-fun emptyContainsNothing!192 ((_ BitVec 64)) Unit!42952)

(assert (=> b!1296506 (= lt!580441 (emptyContainsNothing!192 k0!1205))))

(declare-fun bm!63462 () Bool)

(declare-fun call!63465 () Bool)

(declare-fun call!63464 () Bool)

(assert (=> bm!63462 (= call!63465 call!63464)))

(declare-fun bm!63463 () Bool)

(declare-fun call!63462 () Bool)

(declare-fun call!63471 () Bool)

(assert (=> bm!63463 (= call!63462 call!63471)))

(declare-fun res!861663 () Bool)

(assert (=> start!109470 (=> (not res!861663) (not e!739652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109470 (= res!861663 (validMask!0 mask!2175))))

(assert (=> start!109470 e!739652))

(assert (=> start!109470 tp_is_empty!34599))

(assert (=> start!109470 true))

(declare-fun e!739655 () Bool)

(declare-fun array_inv!31499 (array!86218) Bool)

(assert (=> start!109470 (and (array_inv!31499 _values!1445) e!739655)))

(declare-fun array_inv!31500 (array!86216) Bool)

(assert (=> start!109470 (array_inv!31500 _keys!1741)))

(assert (=> start!109470 tp!101996))

(declare-fun bm!63464 () Bool)

(declare-fun call!63463 () ListLongMap!20037)

(declare-fun getCurrentListMapNoExtraKeys!6069 (array!86216 array!86218 (_ BitVec 32) (_ BitVec 32) V!51235 V!51235 (_ BitVec 32) Int) ListLongMap!20037)

(assert (=> bm!63464 (= call!63463 (getCurrentListMapNoExtraKeys!6069 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296507 () Bool)

(declare-fun res!861665 () Bool)

(assert (=> b!1296507 (=> (not res!861665) (not e!739652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296507 (= res!861665 (not (validKeyInArray!0 (select (arr!41609 _keys!1741) from!2144))))))

(declare-fun b!1296508 () Bool)

(declare-fun e!739654 () Unit!42952)

(assert (=> b!1296508 (= e!739657 e!739654)))

(assert (=> b!1296508 (= c!124405 (and (not lt!580436) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63465 () Bool)

(declare-fun lt!580446 () ListLongMap!20037)

(declare-fun call!63469 () Unit!42952)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!72 ((_ BitVec 64) (_ BitVec 64) V!51235 ListLongMap!20037) Unit!42952)

(assert (=> bm!63465 (= call!63469 (lemmaInListMapAfterAddingDiffThenInBefore!72 k0!1205 (ite c!124404 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124405 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124404 minValue!1387 (ite c!124405 zeroValue!1387 minValue!1387)) (ite c!124404 lt!580446 (ite c!124405 lt!580434 lt!580447))))))

(declare-fun b!1296509 () Bool)

(declare-fun e!739651 () Bool)

(assert (=> b!1296509 (= e!739655 (and e!739651 mapRes!53459))))

(declare-fun condMapEmpty!53459 () Bool)

(declare-fun mapDefault!53459 () ValueCell!16401)

(assert (=> b!1296509 (= condMapEmpty!53459 (= (arr!41610 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16401)) mapDefault!53459)))))

(declare-fun bm!63466 () Bool)

(declare-fun call!63470 () ListLongMap!20037)

(assert (=> bm!63466 (= call!63470 call!63463)))

(declare-fun b!1296510 () Bool)

(assert (=> b!1296510 call!63462))

(declare-fun lt!580439 () Unit!42952)

(declare-fun call!63468 () Unit!42952)

(assert (=> b!1296510 (= lt!580439 call!63468)))

(assert (=> b!1296510 (not call!63465)))

(declare-fun lt!580443 () Unit!42952)

(assert (=> b!1296510 (= lt!580443 call!63467)))

(assert (=> b!1296510 (= lt!580434 call!63470)))

(assert (=> b!1296510 (= e!739654 lt!580439)))

(declare-fun bm!63467 () Bool)

(assert (=> bm!63467 (= call!63468 call!63469)))

(declare-fun bm!63468 () Bool)

(assert (=> bm!63468 (= call!63471 (contains!8152 (ite c!124404 lt!580435 (ite c!124405 lt!580434 lt!580447)) k0!1205))))

(declare-fun bm!63469 () Bool)

(assert (=> bm!63469 (= call!63464 (contains!8152 (ite c!124404 lt!580446 call!63473) k0!1205))))

(declare-fun b!1296511 () Bool)

(declare-fun c!124403 () Bool)

(assert (=> b!1296511 (= c!124403 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580436))))

(assert (=> b!1296511 (= e!739654 e!739656)))

(declare-fun b!1296512 () Bool)

(assert (=> b!1296512 (= e!739651 tp_is_empty!34599)))

(declare-fun b!1296513 () Bool)

(declare-fun lt!580438 () Unit!42952)

(assert (=> b!1296513 (= e!739656 lt!580438)))

(assert (=> b!1296513 (= lt!580447 call!63470)))

(declare-fun lt!580448 () Unit!42952)

(assert (=> b!1296513 (= lt!580448 call!63467)))

(assert (=> b!1296513 (not call!63465)))

(assert (=> b!1296513 (= lt!580438 call!63468)))

(assert (=> b!1296513 call!63462))

(declare-fun bm!63470 () Bool)

(declare-fun +!4437 (ListLongMap!20037 tuple2!22380) ListLongMap!20037)

(assert (=> bm!63470 (= call!63472 (+!4437 (ite c!124404 lt!580435 (ite c!124405 lt!580434 lt!580447)) (ite (or c!124404 c!124405) (tuple2!22381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1296514 () Bool)

(declare-fun lt!580442 () Unit!42952)

(assert (=> b!1296514 (= e!739657 lt!580442)))

(assert (=> b!1296514 (= lt!580435 call!63463)))

(declare-fun lt!580440 () Unit!42952)

(assert (=> b!1296514 (= lt!580440 (addStillNotContains!455 lt!580435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(assert (=> b!1296514 (= lt!580446 call!63472)))

(assert (=> b!1296514 (not call!63464)))

(declare-fun lt!580445 () Unit!42952)

(assert (=> b!1296514 (= lt!580445 call!63466)))

(assert (=> b!1296514 (not (contains!8152 (+!4437 lt!580435 (tuple2!22381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!580433 () Unit!42952)

(assert (=> b!1296514 (= lt!580433 call!63469)))

(assert (=> b!1296514 false))

(assert (=> b!1296514 (= lt!580442 (lemmaInListMapAfterAddingDiffThenInBefore!72 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!580435))))

(declare-fun lt!580444 () Bool)

(assert (=> b!1296514 (= lt!580444 call!63471)))

(declare-fun mapNonEmpty!53459 () Bool)

(declare-fun tp!101995 () Bool)

(assert (=> mapNonEmpty!53459 (= mapRes!53459 (and tp!101995 e!739658))))

(declare-fun mapValue!53459 () ValueCell!16401)

(declare-fun mapRest!53459 () (Array (_ BitVec 32) ValueCell!16401))

(declare-fun mapKey!53459 () (_ BitVec 32))

(assert (=> mapNonEmpty!53459 (= (arr!41610 _values!1445) (store mapRest!53459 mapKey!53459 mapValue!53459))))

(assert (= (and start!109470 res!861663) b!1296505))

(assert (= (and b!1296505 res!861667) b!1296504))

(assert (= (and b!1296504 res!861668) b!1296502))

(assert (= (and b!1296502 res!861662) b!1296499))

(assert (= (and b!1296499 res!861664) b!1296500))

(assert (= (and b!1296500 res!861666) b!1296501))

(assert (= (and b!1296501 res!861669) b!1296507))

(assert (= (and b!1296507 res!861665) b!1296506))

(assert (= (and b!1296506 c!124404) b!1296514))

(assert (= (and b!1296506 (not c!124404)) b!1296508))

(assert (= (and b!1296508 c!124405) b!1296510))

(assert (= (and b!1296508 (not c!124405)) b!1296511))

(assert (= (and b!1296511 c!124403) b!1296513))

(assert (= (and b!1296511 (not c!124403)) b!1296503))

(assert (= (or b!1296510 b!1296513) bm!63463))

(assert (= (or b!1296510 b!1296513) bm!63466))

(assert (= (or b!1296510 b!1296513) bm!63467))

(assert (= (or b!1296510 b!1296513) bm!63461))

(assert (= (or b!1296510 b!1296513) bm!63460))

(assert (= (or b!1296510 b!1296513) bm!63462))

(assert (= (or b!1296514 bm!63460) bm!63459))

(assert (= (or b!1296514 bm!63462) bm!63469))

(assert (= (or b!1296514 bm!63466) bm!63464))

(assert (= (or b!1296514 bm!63467) bm!63465))

(assert (= (or b!1296514 bm!63463) bm!63468))

(assert (= (or b!1296514 bm!63461) bm!63470))

(assert (= (and b!1296509 condMapEmpty!53459) mapIsEmpty!53459))

(assert (= (and b!1296509 (not condMapEmpty!53459)) mapNonEmpty!53459))

(get-info :version)

(assert (= (and mapNonEmpty!53459 ((_ is ValueCellFull!16401) mapValue!53459)) b!1296498))

(assert (= (and b!1296509 ((_ is ValueCellFull!16401) mapDefault!53459)) b!1296512))

(assert (= start!109470 b!1296509))

(declare-fun m!1188379 () Bool)

(assert (=> start!109470 m!1188379))

(declare-fun m!1188381 () Bool)

(assert (=> start!109470 m!1188381))

(declare-fun m!1188383 () Bool)

(assert (=> start!109470 m!1188383))

(declare-fun m!1188385 () Bool)

(assert (=> b!1296502 m!1188385))

(declare-fun m!1188387 () Bool)

(assert (=> bm!63459 m!1188387))

(declare-fun m!1188389 () Bool)

(assert (=> b!1296504 m!1188389))

(declare-fun m!1188391 () Bool)

(assert (=> bm!63470 m!1188391))

(declare-fun m!1188393 () Bool)

(assert (=> b!1296500 m!1188393))

(assert (=> b!1296500 m!1188393))

(declare-fun m!1188395 () Bool)

(assert (=> b!1296500 m!1188395))

(declare-fun m!1188397 () Bool)

(assert (=> bm!63469 m!1188397))

(declare-fun m!1188399 () Bool)

(assert (=> bm!63464 m!1188399))

(declare-fun m!1188401 () Bool)

(assert (=> bm!63468 m!1188401))

(declare-fun m!1188403 () Bool)

(assert (=> b!1296506 m!1188403))

(declare-fun m!1188405 () Bool)

(assert (=> b!1296506 m!1188405))

(declare-fun m!1188407 () Bool)

(assert (=> b!1296507 m!1188407))

(assert (=> b!1296507 m!1188407))

(declare-fun m!1188409 () Bool)

(assert (=> b!1296507 m!1188409))

(declare-fun m!1188411 () Bool)

(assert (=> bm!63465 m!1188411))

(declare-fun m!1188413 () Bool)

(assert (=> mapNonEmpty!53459 m!1188413))

(declare-fun m!1188415 () Bool)

(assert (=> b!1296514 m!1188415))

(declare-fun m!1188417 () Bool)

(assert (=> b!1296514 m!1188417))

(assert (=> b!1296514 m!1188417))

(declare-fun m!1188419 () Bool)

(assert (=> b!1296514 m!1188419))

(declare-fun m!1188421 () Bool)

(assert (=> b!1296514 m!1188421))

(check-sat (not b!1296502) (not b!1296500) (not b!1296504) (not b_next!28959) (not bm!63469) (not b!1296507) (not bm!63459) (not bm!63468) b_and!47049 (not b!1296514) (not bm!63465) (not b!1296506) tp_is_empty!34599 (not mapNonEmpty!53459) (not bm!63470) (not bm!63464) (not start!109470))
(check-sat b_and!47049 (not b_next!28959))
