; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3352 () Bool)

(assert start!3352)

(declare-fun b!21293 () Bool)

(declare-fun b_free!733 () Bool)

(declare-fun b_next!733 () Bool)

(assert (=> b!21293 (= b_free!733 (not b_next!733))))

(declare-fun tp!3436 () Bool)

(declare-fun b_and!1415 () Bool)

(assert (=> b!21293 (= tp!3436 b_and!1415)))

(declare-fun b!21279 () Bool)

(declare-fun c!2445 () Bool)

(declare-datatypes ((V!1155 0))(
  ( (V!1156 (val!525 Int)) )
))
(declare-datatypes ((ValueCell!299 0))(
  ( (ValueCellFull!299 (v!1569 V!1155)) (EmptyCell!299) )
))
(declare-datatypes ((array!1207 0))(
  ( (array!1208 (arr!572 (Array (_ BitVec 32) ValueCell!299)) (size!665 (_ BitVec 32))) )
))
(declare-datatypes ((array!1209 0))(
  ( (array!1210 (arr!573 (Array (_ BitVec 32) (_ BitVec 64))) (size!666 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!184 0))(
  ( (LongMapFixedSize!185 (defaultEntry!1718 Int) (mask!4691 (_ BitVec 32)) (extraKeys!1621 (_ BitVec 32)) (zeroValue!1645 V!1155) (minValue!1645 V!1155) (_size!133 (_ BitVec 32)) (_keys!3139 array!1209) (_values!1707 array!1207) (_vacant!133 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!184 0))(
  ( (Cell!185 (v!1570 LongMapFixedSize!184)) )
))
(declare-datatypes ((LongMap!184 0))(
  ( (LongMap!185 (underlying!103 Cell!184)) )
))
(declare-fun thiss!938 () LongMap!184)

(declare-fun lt!6651 () Bool)

(assert (=> b!21279 (= c!2445 (and (not (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6651))))

(declare-datatypes ((tuple2!898 0))(
  ( (tuple2!899 (_1!452 Bool) (_2!452 Cell!184)) )
))
(declare-fun e!13864 () tuple2!898)

(declare-fun e!13866 () tuple2!898)

(assert (=> b!21279 (= e!13864 e!13866)))

(declare-fun bm!1338 () Bool)

(declare-datatypes ((tuple2!900 0))(
  ( (tuple2!901 (_1!453 Bool) (_2!453 LongMapFixedSize!184)) )
))
(declare-fun call!1341 () tuple2!900)

(declare-fun call!1342 () tuple2!900)

(assert (=> bm!1338 (= call!1341 call!1342)))

(declare-fun b!21280 () Bool)

(declare-fun lt!6650 () tuple2!900)

(assert (=> b!21280 (= e!13866 (tuple2!899 (_1!453 lt!6650) (Cell!185 (_2!453 lt!6650))))))

(assert (=> b!21280 (= lt!6650 call!1341)))

(declare-fun b!21281 () Bool)

(declare-fun e!13859 () Bool)

(declare-fun e!13860 () Bool)

(assert (=> b!21281 (= e!13859 e!13860)))

(declare-fun b!21282 () Bool)

(declare-fun lt!6656 () LongMapFixedSize!184)

(assert (=> b!21282 (= e!13866 (tuple2!899 true (Cell!185 lt!6656)))))

(declare-fun b!21283 () Bool)

(declare-fun e!13863 () tuple2!898)

(assert (=> b!21283 (= e!13863 e!13864)))

(declare-fun c!2447 () Bool)

(assert (=> b!21283 (= c!2447 (and (not lt!6651) (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21284 () Bool)

(declare-fun e!13862 () Bool)

(declare-fun e!13865 () Bool)

(assert (=> b!21284 (= e!13862 e!13865)))

(declare-fun res!13717 () Bool)

(assert (=> b!21284 (=> (not res!13717) (not e!13865))))

(declare-fun lt!6654 () tuple2!898)

(assert (=> b!21284 (= res!13717 (_1!452 lt!6654))))

(assert (=> b!21284 (= lt!6654 e!13863)))

(declare-fun c!2446 () Bool)

(assert (=> b!21284 (= c!2446 (and (not lt!6651) (not (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!21284 (= lt!6651 (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!26 ((_ BitVec 32) Int) LongMapFixedSize!184)

(declare-fun computeNewMask!23 (LongMap!184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21284 (= lt!6656 (getNewLongMapFixedSize!26 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun bm!1339 () Bool)

(declare-fun update!28 (LongMapFixedSize!184 (_ BitVec 64) V!1155) tuple2!900)

(assert (=> bm!1339 (= call!1342 (update!28 lt!6656 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun b!21285 () Bool)

(declare-datatypes ((tuple2!902 0))(
  ( (tuple2!903 (_1!454 (_ BitVec 64)) (_2!454 V!1155)) )
))
(declare-datatypes ((List!557 0))(
  ( (Nil!554) (Cons!553 (h!1119 tuple2!902) (t!3207 List!557)) )
))
(declare-datatypes ((ListLongMap!555 0))(
  ( (ListLongMap!556 (toList!293 List!557)) )
))
(declare-fun getCurrentListMap!124 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) Int) ListLongMap!555)

(declare-fun map!395 (LongMapFixedSize!184) ListLongMap!555)

(assert (=> b!21285 (= e!13865 (not (= (getCurrentListMap!124 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (_values!1707 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))) (map!395 (v!1570 (_2!452 lt!6654))))))))

(declare-fun b!21286 () Bool)

(declare-fun res!13721 () Bool)

(assert (=> b!21286 (=> (not res!13721) (not e!13865))))

(declare-fun valid!101 (LongMapFixedSize!184) Bool)

(assert (=> b!21286 (= res!13721 (valid!101 (v!1570 (_2!452 lt!6654))))))

(declare-fun res!13719 () Bool)

(assert (=> start!3352 (=> (not res!13719) (not e!13862))))

(declare-fun valid!102 (LongMap!184) Bool)

(assert (=> start!3352 (= res!13719 (valid!102 thiss!938))))

(assert (=> start!3352 e!13862))

(assert (=> start!3352 e!13859))

(declare-fun mapIsEmpty!976 () Bool)

(declare-fun mapRes!976 () Bool)

(assert (=> mapIsEmpty!976 mapRes!976))

(declare-fun b!21287 () Bool)

(declare-fun e!13868 () Bool)

(declare-fun tp_is_empty!997 () Bool)

(assert (=> b!21287 (= e!13868 tp_is_empty!997)))

(declare-fun b!21288 () Bool)

(declare-fun res!13720 () Bool)

(assert (=> b!21288 (=> (not res!13720) (not e!13865))))

(assert (=> b!21288 (= res!13720 (and (= (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4691 (v!1570 (underlying!103 thiss!938))))) (bvsge (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun b!21289 () Bool)

(declare-fun lt!6655 () tuple2!900)

(declare-fun lt!6652 () tuple2!900)

(assert (=> b!21289 (= e!13863 (tuple2!899 (and (_1!453 lt!6655) (_1!453 lt!6652)) (Cell!185 (_2!453 lt!6652))))))

(assert (=> b!21289 (= lt!6655 call!1342)))

(assert (=> b!21289 (= lt!6652 (update!28 (_2!453 lt!6655) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun b!21290 () Bool)

(declare-fun res!13718 () Bool)

(assert (=> b!21290 (=> (not res!13718) (not e!13865))))

(assert (=> b!21290 (= res!13718 (bvsge (bvadd #b00000000000000000000000000000001 (mask!4691 (v!1570 (_2!452 lt!6654)))) (_size!133 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun b!21291 () Bool)

(declare-fun lt!6653 () tuple2!900)

(assert (=> b!21291 (= lt!6653 call!1341)))

(assert (=> b!21291 (= e!13864 (tuple2!899 (_1!453 lt!6653) (Cell!185 (_2!453 lt!6653))))))

(declare-fun b!21292 () Bool)

(declare-fun res!13716 () Bool)

(assert (=> b!21292 (=> (not res!13716) (not e!13865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!21292 (= res!13716 (validMask!0 (mask!4691 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun e!13861 () Bool)

(declare-fun e!13867 () Bool)

(declare-fun array_inv!403 (array!1209) Bool)

(declare-fun array_inv!404 (array!1207) Bool)

(assert (=> b!21293 (= e!13861 (and tp!3436 tp_is_empty!997 (array_inv!403 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (array_inv!404 (_values!1707 (v!1570 (underlying!103 thiss!938)))) e!13867))))

(declare-fun b!21294 () Bool)

(assert (=> b!21294 (= e!13860 e!13861)))

(declare-fun b!21295 () Bool)

(assert (=> b!21295 (= e!13867 (and e!13868 mapRes!976))))

(declare-fun condMapEmpty!976 () Bool)

(declare-fun mapDefault!976 () ValueCell!299)

(assert (=> b!21295 (= condMapEmpty!976 (= (arr!572 (_values!1707 (v!1570 (underlying!103 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!299)) mapDefault!976)))))

(declare-fun mapNonEmpty!976 () Bool)

(declare-fun tp!3435 () Bool)

(declare-fun e!13858 () Bool)

(assert (=> mapNonEmpty!976 (= mapRes!976 (and tp!3435 e!13858))))

(declare-fun mapValue!976 () ValueCell!299)

(declare-fun mapKey!976 () (_ BitVec 32))

(declare-fun mapRest!976 () (Array (_ BitVec 32) ValueCell!299))

(assert (=> mapNonEmpty!976 (= (arr!572 (_values!1707 (v!1570 (underlying!103 thiss!938)))) (store mapRest!976 mapKey!976 mapValue!976))))

(declare-fun b!21296 () Bool)

(assert (=> b!21296 (= e!13858 tp_is_empty!997)))

(assert (= (and start!3352 res!13719) b!21284))

(assert (= (and b!21284 c!2446) b!21289))

(assert (= (and b!21284 (not c!2446)) b!21283))

(assert (= (and b!21283 c!2447) b!21291))

(assert (= (and b!21283 (not c!2447)) b!21279))

(assert (= (and b!21279 c!2445) b!21280))

(assert (= (and b!21279 (not c!2445)) b!21282))

(assert (= (or b!21291 b!21280) bm!1338))

(assert (= (or b!21289 bm!1338) bm!1339))

(assert (= (and b!21284 res!13717) b!21292))

(assert (= (and b!21292 res!13716) b!21288))

(assert (= (and b!21288 res!13720) b!21286))

(assert (= (and b!21286 res!13721) b!21290))

(assert (= (and b!21290 res!13718) b!21285))

(assert (= (and b!21295 condMapEmpty!976) mapIsEmpty!976))

(assert (= (and b!21295 (not condMapEmpty!976)) mapNonEmpty!976))

(get-info :version)

(assert (= (and mapNonEmpty!976 ((_ is ValueCellFull!299) mapValue!976)) b!21296))

(assert (= (and b!21295 ((_ is ValueCellFull!299) mapDefault!976)) b!21287))

(assert (= b!21293 b!21295))

(assert (= b!21294 b!21293))

(assert (= b!21281 b!21294))

(assert (= start!3352 b!21281))

(declare-fun m!14829 () Bool)

(assert (=> b!21289 m!14829))

(declare-fun m!14831 () Bool)

(assert (=> bm!1339 m!14831))

(declare-fun m!14833 () Bool)

(assert (=> mapNonEmpty!976 m!14833))

(declare-fun m!14835 () Bool)

(assert (=> b!21284 m!14835))

(assert (=> b!21284 m!14835))

(declare-fun m!14837 () Bool)

(assert (=> b!21284 m!14837))

(declare-fun m!14839 () Bool)

(assert (=> b!21286 m!14839))

(declare-fun m!14841 () Bool)

(assert (=> b!21285 m!14841))

(declare-fun m!14843 () Bool)

(assert (=> b!21285 m!14843))

(declare-fun m!14845 () Bool)

(assert (=> start!3352 m!14845))

(declare-fun m!14847 () Bool)

(assert (=> b!21293 m!14847))

(declare-fun m!14849 () Bool)

(assert (=> b!21293 m!14849))

(declare-fun m!14851 () Bool)

(assert (=> b!21292 m!14851))

(check-sat tp_is_empty!997 (not b_next!733) (not b!21285) (not start!3352) (not b!21289) (not b!21292) (not mapNonEmpty!976) (not b!21284) (not b!21286) b_and!1415 (not b!21293) (not bm!1339))
(check-sat b_and!1415 (not b_next!733))
(get-model)

(declare-fun bm!1400 () Bool)

(declare-fun call!1416 () ListLongMap!555)

(declare-fun lt!6771 () (_ BitVec 32))

(declare-fun lt!6774 () (_ BitVec 32))

(declare-fun c!2504 () Bool)

(declare-fun lt!6762 () array!1207)

(declare-fun c!2501 () Bool)

(assert (=> bm!1400 (= call!1416 (getCurrentListMap!124 (_keys!3139 lt!6656) (ite c!2501 (_values!1707 lt!6656) lt!6762) (mask!4691 lt!6656) (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)) (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun b!21489 () Bool)

(declare-fun e!13994 () ListLongMap!555)

(declare-fun call!1409 () ListLongMap!555)

(assert (=> b!21489 (= e!13994 call!1409)))

(declare-fun b!21490 () Bool)

(declare-fun e!14000 () Bool)

(declare-fun e!13998 () Bool)

(assert (=> b!21490 (= e!14000 e!13998)))

(declare-fun call!1413 () ListLongMap!555)

(declare-fun res!13787 () Bool)

(declare-fun contains!225 (ListLongMap!555 (_ BitVec 64)) Bool)

(assert (=> b!21490 (= res!13787 (contains!225 call!1413 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21490 (=> (not res!13787) (not e!13998))))

(declare-fun bm!1401 () Bool)

(declare-fun call!1418 () ListLongMap!555)

(assert (=> bm!1401 (= call!1418 call!1416)))

(declare-fun b!21491 () Bool)

(declare-fun e!13988 () Bool)

(declare-fun call!1419 () Bool)

(assert (=> b!21491 (= e!13988 (not call!1419))))

(declare-fun b!21492 () Bool)

(declare-datatypes ((Unit!459 0))(
  ( (Unit!460) )
))
(declare-fun e!14006 () Unit!459)

(declare-fun Unit!461 () Unit!459)

(assert (=> b!21492 (= e!14006 Unit!461)))

(declare-fun lt!6767 () Unit!459)

(declare-fun call!1420 () Unit!459)

(assert (=> b!21492 (= lt!6767 call!1420)))

(declare-datatypes ((SeekEntryResult!52 0))(
  ( (MissingZero!52 (index!2328 (_ BitVec 32))) (Found!52 (index!2329 (_ BitVec 32))) (Intermediate!52 (undefined!864 Bool) (index!2330 (_ BitVec 32)) (x!5191 (_ BitVec 32))) (Undefined!52) (MissingVacant!52 (index!2331 (_ BitVec 32))) )
))
(declare-fun lt!6755 () SeekEntryResult!52)

(declare-fun call!1406 () SeekEntryResult!52)

(assert (=> b!21492 (= lt!6755 call!1406)))

(declare-fun res!13793 () Bool)

(assert (=> b!21492 (= res!13793 ((_ is Found!52) lt!6755))))

(declare-fun e!14001 () Bool)

(assert (=> b!21492 (=> (not res!13793) (not e!14001))))

(assert (=> b!21492 e!14001))

(declare-fun lt!6776 () Unit!459)

(assert (=> b!21492 (= lt!6776 lt!6767)))

(assert (=> b!21492 false))

(declare-fun bm!1402 () Bool)

(declare-fun c!2502 () Bool)

(declare-fun c!2500 () Bool)

(assert (=> bm!1402 (= c!2502 c!2500)))

(declare-fun lt!6777 () SeekEntryResult!52)

(declare-fun call!1407 () Bool)

(declare-fun e!14004 () ListLongMap!555)

(assert (=> bm!1402 (= call!1407 (contains!225 e!14004 (ite c!2500 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!6777)))))))

(declare-fun b!21493 () Bool)

(declare-fun e!13997 () tuple2!900)

(declare-fun lt!6775 () tuple2!900)

(assert (=> b!21493 (= e!13997 (tuple2!901 (_1!453 lt!6775) (_2!453 lt!6775)))))

(declare-fun call!1405 () tuple2!900)

(assert (=> b!21493 (= lt!6775 call!1405)))

(declare-fun bm!1403 () Bool)

(declare-fun call!1415 () Bool)

(declare-fun call!1414 () Bool)

(assert (=> bm!1403 (= call!1415 call!1414)))

(declare-fun b!21494 () Bool)

(declare-fun lt!6769 () tuple2!900)

(assert (=> b!21494 (= lt!6769 call!1405)))

(declare-fun e!13993 () tuple2!900)

(assert (=> b!21494 (= e!13993 (tuple2!901 (_1!453 lt!6769) (_2!453 lt!6769)))))

(declare-fun b!21495 () Bool)

(declare-fun lt!6778 () Unit!459)

(declare-fun lt!6761 () Unit!459)

(assert (=> b!21495 (= lt!6778 lt!6761)))

(declare-fun call!1404 () ListLongMap!555)

(assert (=> b!21495 (= call!1404 call!1418)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!7 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 V!1155 Int) Unit!459)

(assert (=> b!21495 (= lt!6761 (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) lt!6771 (zeroValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 lt!6656) (defaultEntry!1718 lt!6656)))))

(assert (=> b!21495 (= lt!6771 (bvor (extraKeys!1621 lt!6656) #b00000000000000000000000000000001))))

(declare-fun e!13989 () tuple2!900)

(assert (=> b!21495 (= e!13989 (tuple2!901 true (LongMapFixedSize!185 (defaultEntry!1718 lt!6656) (mask!4691 lt!6656) (bvor (extraKeys!1621 lt!6656) #b00000000000000000000000000000001) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 lt!6656) (_size!133 lt!6656) (_keys!3139 lt!6656) (_values!1707 lt!6656) (_vacant!133 lt!6656))))))

(declare-fun lt!6766 () SeekEntryResult!52)

(declare-fun b!21496 () Bool)

(declare-fun e!13995 () Bool)

(assert (=> b!21496 (= e!13995 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!6766)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!21497 () Bool)

(declare-fun e!13987 () Bool)

(declare-fun call!1417 () Bool)

(assert (=> b!21497 (= e!13987 (not call!1417))))

(declare-fun b!21498 () Bool)

(declare-fun c!2499 () Bool)

(declare-fun lt!6772 () SeekEntryResult!52)

(assert (=> b!21498 (= c!2499 ((_ is MissingVacant!52) lt!6772))))

(declare-fun e!13996 () Bool)

(declare-fun e!13999 () Bool)

(assert (=> b!21498 (= e!13996 e!13999)))

(declare-fun b!21499 () Bool)

(declare-fun c!2505 () Bool)

(declare-fun lt!6764 () SeekEntryResult!52)

(assert (=> b!21499 (= c!2505 ((_ is MissingVacant!52) lt!6764))))

(declare-fun e!13986 () Bool)

(declare-fun e!13991 () Bool)

(assert (=> b!21499 (= e!13986 e!13991)))

(declare-fun b!21500 () Bool)

(assert (=> b!21500 (= e!14001 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!6755)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!1404 () Bool)

(declare-fun call!1425 () Bool)

(assert (=> bm!1404 (= call!1417 call!1425)))

(declare-fun bm!1405 () Bool)

(assert (=> bm!1405 (= call!1419 call!1425)))

(declare-fun bm!1406 () Bool)

(declare-fun call!1422 () Bool)

(assert (=> bm!1406 (= call!1414 call!1422)))

(declare-fun b!21501 () Bool)

(declare-fun e!13985 () tuple2!900)

(assert (=> b!21501 (= e!13985 e!13989)))

(assert (=> b!21501 (= c!2504 (= (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21502 () Bool)

(declare-fun res!13786 () Bool)

(assert (=> b!21502 (= res!13786 call!1414)))

(assert (=> b!21502 (=> (not res!13786) (not e!13995))))

(declare-fun b!21503 () Bool)

(declare-fun res!13797 () Bool)

(assert (=> b!21503 (=> (not res!13797) (not e!13987))))

(declare-fun call!1426 () Bool)

(assert (=> b!21503 (= res!13797 call!1426)))

(assert (=> b!21503 (= e!13996 e!13987)))

(declare-fun b!21504 () Bool)

(declare-fun lt!6758 () Unit!459)

(declare-fun lt!6770 () Unit!459)

(assert (=> b!21504 (= lt!6758 lt!6770)))

(assert (=> b!21504 (= call!1404 call!1418)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 V!1155 Int) Unit!459)

(assert (=> b!21504 (= lt!6770 (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) lt!6774 (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (defaultEntry!1718 lt!6656)))))

(assert (=> b!21504 (= lt!6774 (bvor (extraKeys!1621 lt!6656) #b00000000000000000000000000000010))))

(assert (=> b!21504 (= e!13989 (tuple2!901 true (LongMapFixedSize!185 (defaultEntry!1718 lt!6656) (mask!4691 lt!6656) (bvor (extraKeys!1621 lt!6656) #b00000000000000000000000000000010) (zeroValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (_size!133 lt!6656) (_keys!3139 lt!6656) (_values!1707 lt!6656) (_vacant!133 lt!6656))))))

(declare-fun b!21505 () Bool)

(assert (=> b!21505 (= e!14004 call!1416)))

(declare-fun b!21506 () Bool)

(declare-fun call!1403 () ListLongMap!555)

(assert (=> b!21506 (= e!14004 call!1403)))

(declare-fun b!21507 () Bool)

(declare-fun lt!6760 () Unit!459)

(assert (=> b!21507 (= lt!6760 e!14006)))

(declare-fun c!2506 () Bool)

(assert (=> b!21507 (= c!2506 call!1407)))

(declare-fun e!14005 () tuple2!900)

(assert (=> b!21507 (= e!14005 (tuple2!901 false lt!6656))))

(declare-fun d!3699 () Bool)

(declare-fun e!13990 () Bool)

(assert (=> d!3699 e!13990))

(declare-fun res!13792 () Bool)

(assert (=> d!3699 (=> (not res!13792) (not e!13990))))

(declare-fun lt!6753 () tuple2!900)

(assert (=> d!3699 (= res!13792 (valid!101 (_2!453 lt!6753)))))

(assert (=> d!3699 (= lt!6753 e!13985)))

(assert (=> d!3699 (= c!2501 (= (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3699 (valid!101 lt!6656)))

(assert (=> d!3699 (= (update!28 lt!6656 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6753)))

(declare-fun b!21508 () Bool)

(declare-fun res!13789 () Bool)

(assert (=> b!21508 (=> (not res!13789) (not e!13987))))

(assert (=> b!21508 (= res!13789 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2328 lt!6772)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1407 () Bool)

(declare-fun call!1412 () SeekEntryResult!52)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1209 (_ BitVec 32)) SeekEntryResult!52)

(assert (=> bm!1407 (= call!1412 (seekEntryOrOpen!0 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3139 lt!6656) (mask!4691 lt!6656)))))

(declare-fun b!21509 () Bool)

(declare-fun e!13992 () Unit!459)

(declare-fun Unit!462 () Unit!459)

(assert (=> b!21509 (= e!13992 Unit!462)))

(declare-fun lt!6759 () Unit!459)

(declare-fun call!1421 () Unit!459)

(assert (=> b!21509 (= lt!6759 call!1421)))

(declare-fun call!1410 () SeekEntryResult!52)

(assert (=> b!21509 (= lt!6764 call!1410)))

(declare-fun c!2494 () Bool)

(assert (=> b!21509 (= c!2494 ((_ is MissingZero!52) lt!6764))))

(assert (=> b!21509 e!13986))

(declare-fun lt!6773 () Unit!459)

(assert (=> b!21509 (= lt!6773 lt!6759)))

(assert (=> b!21509 false))

(declare-fun b!21510 () Bool)

(assert (=> b!21510 (= e!13990 e!14000)))

(declare-fun c!2496 () Bool)

(assert (=> b!21510 (= c!2496 (_1!453 lt!6753))))

(declare-fun bm!1408 () Bool)

(declare-fun arrayContainsKey!0 (array!1209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1408 (= call!1425 (arrayContainsKey!0 (_keys!3139 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun b!21511 () Bool)

(declare-fun res!13790 () Bool)

(declare-fun call!1408 () Bool)

(assert (=> b!21511 (= res!13790 call!1408)))

(assert (=> b!21511 (=> (not res!13790) (not e!14001))))

(declare-fun bm!1409 () Bool)

(assert (=> bm!1409 (= call!1406 call!1412)))

(declare-fun bm!1410 () Bool)

(declare-fun call!1411 () ListLongMap!555)

(assert (=> bm!1410 (= call!1411 (map!395 lt!6656))))

(declare-fun b!21512 () Bool)

(assert (=> b!21512 (= e!14000 (= call!1413 call!1411))))

(declare-fun b!21513 () Bool)

(declare-fun lt!6754 () Unit!459)

(declare-fun lt!6779 () Unit!459)

(assert (=> b!21513 (= lt!6754 lt!6779)))

(assert (=> b!21513 call!1407))

(declare-fun lemmaValidKeyInArrayIsInListMap!7 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) Int) Unit!459)

(assert (=> b!21513 (= lt!6779 (lemmaValidKeyInArrayIsInListMap!7 (_keys!3139 lt!6656) lt!6762 (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (index!2329 lt!6777) (defaultEntry!1718 lt!6656)))))

(assert (=> b!21513 (= lt!6762 (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656))))))

(declare-fun lt!6765 () Unit!459)

(declare-fun lt!6757 () Unit!459)

(assert (=> b!21513 (= lt!6765 lt!6757)))

(declare-fun call!1424 () ListLongMap!555)

(assert (=> b!21513 (= call!1424 call!1403)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) (_ BitVec 64) V!1155 Int) Unit!459)

(assert (=> b!21513 (= lt!6757 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (index!2329 lt!6777) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (defaultEntry!1718 lt!6656)))))

(declare-fun lt!6763 () Unit!459)

(assert (=> b!21513 (= lt!6763 e!13992)))

(declare-fun c!2498 () Bool)

(assert (=> b!21513 (= c!2498 (contains!225 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21513 (= e!13993 (tuple2!901 true (LongMapFixedSize!185 (defaultEntry!1718 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (_size!133 lt!6656) (_keys!3139 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656))) (_vacant!133 lt!6656))))))

(declare-fun b!21514 () Bool)

(declare-fun +!42 (ListLongMap!555 tuple2!902) ListLongMap!555)

(assert (=> b!21514 (= e!13998 (= call!1413 (+!42 call!1411 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun bm!1411 () Bool)

(assert (=> bm!1411 (= call!1410 call!1412)))

(declare-fun bm!1412 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!459)

(assert (=> bm!1412 (= call!1421 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1718 lt!6656)))))

(declare-fun bm!1413 () Bool)

(declare-fun call!1423 () ListLongMap!555)

(assert (=> bm!1413 (= call!1403 call!1423)))

(declare-fun b!21515 () Bool)

(assert (=> b!21515 (= e!13991 e!13988)))

(declare-fun res!13795 () Bool)

(assert (=> b!21515 (= res!13795 call!1415)))

(assert (=> b!21515 (=> (not res!13795) (not e!13988))))

(declare-fun b!21516 () Bool)

(declare-fun res!13791 () Bool)

(declare-fun e!14002 () Bool)

(assert (=> b!21516 (=> (not res!13791) (not e!14002))))

(assert (=> b!21516 (= res!13791 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2328 lt!6764)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1414 () Bool)

(assert (=> bm!1414 (= call!1423 (getCurrentListMap!124 (_keys!3139 lt!6656) (ite (or c!2501 c!2500) (_values!1707 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656)))) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun bm!1415 () Bool)

(assert (=> bm!1415 (= call!1413 (map!395 (_2!453 lt!6753)))))

(declare-fun bm!1416 () Bool)

(assert (=> bm!1416 (= call!1404 call!1424)))

(declare-fun bm!1417 () Bool)

(assert (=> bm!1417 (= call!1426 call!1408)))

(declare-fun bm!1418 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!459)

(assert (=> bm!1418 (= call!1420 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1718 lt!6656)))))

(declare-fun b!21517 () Bool)

(declare-fun lt!6768 () Unit!459)

(assert (=> b!21517 (= e!14006 lt!6768)))

(assert (=> b!21517 (= lt!6768 call!1421)))

(assert (=> b!21517 (= lt!6772 call!1406)))

(declare-fun c!2495 () Bool)

(assert (=> b!21517 (= c!2495 ((_ is MissingZero!52) lt!6772))))

(assert (=> b!21517 e!13996))

(declare-fun b!21518 () Bool)

(assert (=> b!21518 (= e!13985 e!14005)))

(assert (=> b!21518 (= lt!6777 (seekEntryOrOpen!0 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3139 lt!6656) (mask!4691 lt!6656)))))

(assert (=> b!21518 (= c!2500 ((_ is Undefined!52) lt!6777))))

(declare-fun b!21519 () Bool)

(declare-fun e!14003 () Bool)

(assert (=> b!21519 (= e!14003 (not call!1417))))

(declare-fun b!21520 () Bool)

(declare-fun res!13799 () Bool)

(assert (=> b!21520 (= res!13799 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2331 lt!6764)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21520 (=> (not res!13799) (not e!13988))))

(declare-fun bm!1419 () Bool)

(assert (=> bm!1419 (= call!1409 call!1423)))

(declare-fun bm!1420 () Bool)

(assert (=> bm!1420 (= call!1424 (+!42 e!13994 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun c!2503 () Bool)

(assert (=> bm!1420 (= c!2503 c!2501)))

(declare-fun c!2497 () Bool)

(declare-fun bm!1421 () Bool)

(declare-fun updateHelperNewKey!7 (LongMapFixedSize!184 (_ BitVec 64) V!1155 (_ BitVec 32)) tuple2!900)

(assert (=> bm!1421 (= call!1405 (updateHelperNewKey!7 lt!6656 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777))))))

(declare-fun b!21521 () Bool)

(declare-fun res!13796 () Bool)

(assert (=> b!21521 (= res!13796 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2331 lt!6772)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21521 (=> (not res!13796) (not e!14003))))

(declare-fun b!21522 () Bool)

(assert (=> b!21522 (= e!14002 (not call!1419))))

(declare-fun b!21523 () Bool)

(assert (=> b!21523 (= e!13997 e!13993)))

(declare-fun c!2507 () Bool)

(assert (=> b!21523 (= c!2507 ((_ is MissingZero!52) lt!6777))))

(declare-fun b!21524 () Bool)

(assert (=> b!21524 (= e!13999 e!14003)))

(declare-fun res!13794 () Bool)

(assert (=> b!21524 (= res!13794 call!1426)))

(assert (=> b!21524 (=> (not res!13794) (not e!14003))))

(declare-fun bm!1422 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1422 (= call!1422 (inRange!0 (ite c!2500 (ite c!2506 (index!2329 lt!6755) (ite c!2495 (index!2328 lt!6772) (index!2331 lt!6772))) (ite c!2498 (index!2329 lt!6766) (ite c!2494 (index!2328 lt!6764) (index!2331 lt!6764)))) (mask!4691 lt!6656)))))

(declare-fun b!21525 () Bool)

(assert (=> b!21525 (= e!13994 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun b!21526 () Bool)

(declare-fun lt!6756 () Unit!459)

(assert (=> b!21526 (= e!13992 lt!6756)))

(assert (=> b!21526 (= lt!6756 call!1420)))

(assert (=> b!21526 (= lt!6766 call!1410)))

(declare-fun res!13788 () Bool)

(assert (=> b!21526 (= res!13788 ((_ is Found!52) lt!6766))))

(assert (=> b!21526 (=> (not res!13788) (not e!13995))))

(assert (=> b!21526 e!13995))

(declare-fun bm!1423 () Bool)

(assert (=> bm!1423 (= call!1408 call!1422)))

(declare-fun b!21527 () Bool)

(declare-fun res!13798 () Bool)

(assert (=> b!21527 (=> (not res!13798) (not e!14002))))

(assert (=> b!21527 (= res!13798 call!1415)))

(assert (=> b!21527 (= e!13986 e!14002)))

(declare-fun b!21528 () Bool)

(assert (=> b!21528 (= e!13999 ((_ is Undefined!52) lt!6772))))

(declare-fun b!21529 () Bool)

(assert (=> b!21529 (= e!13991 ((_ is Undefined!52) lt!6764))))

(declare-fun b!21530 () Bool)

(assert (=> b!21530 (= c!2497 ((_ is MissingVacant!52) lt!6777))))

(assert (=> b!21530 (= e!14005 e!13997)))

(assert (= (and d!3699 c!2501) b!21501))

(assert (= (and d!3699 (not c!2501)) b!21518))

(assert (= (and b!21501 c!2504) b!21495))

(assert (= (and b!21501 (not c!2504)) b!21504))

(assert (= (or b!21495 b!21504) bm!1401))

(assert (= (or b!21495 b!21504) bm!1419))

(assert (= (or b!21495 b!21504) bm!1416))

(assert (= (and b!21518 c!2500) b!21507))

(assert (= (and b!21518 (not c!2500)) b!21530))

(assert (= (and b!21507 c!2506) b!21492))

(assert (= (and b!21507 (not c!2506)) b!21517))

(assert (= (and b!21492 res!13793) b!21511))

(assert (= (and b!21511 res!13790) b!21500))

(assert (= (and b!21517 c!2495) b!21503))

(assert (= (and b!21517 (not c!2495)) b!21498))

(assert (= (and b!21503 res!13797) b!21508))

(assert (= (and b!21508 res!13789) b!21497))

(assert (= (and b!21498 c!2499) b!21524))

(assert (= (and b!21498 (not c!2499)) b!21528))

(assert (= (and b!21524 res!13794) b!21521))

(assert (= (and b!21521 res!13796) b!21519))

(assert (= (or b!21503 b!21524) bm!1417))

(assert (= (or b!21497 b!21519) bm!1404))

(assert (= (or b!21511 bm!1417) bm!1423))

(assert (= (or b!21492 b!21517) bm!1409))

(assert (= (and b!21530 c!2497) b!21493))

(assert (= (and b!21530 (not c!2497)) b!21523))

(assert (= (and b!21523 c!2507) b!21494))

(assert (= (and b!21523 (not c!2507)) b!21513))

(assert (= (and b!21513 c!2498) b!21526))

(assert (= (and b!21513 (not c!2498)) b!21509))

(assert (= (and b!21526 res!13788) b!21502))

(assert (= (and b!21502 res!13786) b!21496))

(assert (= (and b!21509 c!2494) b!21527))

(assert (= (and b!21509 (not c!2494)) b!21499))

(assert (= (and b!21527 res!13798) b!21516))

(assert (= (and b!21516 res!13791) b!21522))

(assert (= (and b!21499 c!2505) b!21515))

(assert (= (and b!21499 (not c!2505)) b!21529))

(assert (= (and b!21515 res!13795) b!21520))

(assert (= (and b!21520 res!13799) b!21491))

(assert (= (or b!21527 b!21515) bm!1403))

(assert (= (or b!21522 b!21491) bm!1405))

(assert (= (or b!21502 bm!1403) bm!1406))

(assert (= (or b!21526 b!21509) bm!1411))

(assert (= (or b!21493 b!21494) bm!1421))

(assert (= (or bm!1409 bm!1411) bm!1407))

(assert (= (or bm!1423 bm!1406) bm!1422))

(assert (= (or bm!1404 bm!1405) bm!1408))

(assert (= (or b!21492 b!21526) bm!1418))

(assert (= (or b!21517 b!21509) bm!1412))

(assert (= (or b!21507 b!21513) bm!1413))

(assert (= (or b!21507 b!21513) bm!1402))

(assert (= (and bm!1402 c!2502) b!21506))

(assert (= (and bm!1402 (not c!2502)) b!21505))

(assert (= (or bm!1401 b!21505) bm!1400))

(assert (= (or bm!1419 bm!1413) bm!1414))

(assert (= (or bm!1416 b!21513) bm!1420))

(assert (= (and bm!1420 c!2503) b!21489))

(assert (= (and bm!1420 (not c!2503)) b!21525))

(assert (= (and d!3699 res!13792) b!21510))

(assert (= (and b!21510 c!2496) b!21490))

(assert (= (and b!21510 (not c!2496)) b!21512))

(assert (= (and b!21490 res!13787) b!21514))

(assert (= (or b!21490 b!21514 b!21512) bm!1415))

(assert (= (or b!21514 b!21512) bm!1410))

(declare-fun m!14901 () Bool)

(assert (=> bm!1420 m!14901))

(declare-fun m!14903 () Bool)

(assert (=> bm!1410 m!14903))

(declare-fun m!14905 () Bool)

(assert (=> bm!1414 m!14905))

(declare-fun m!14907 () Bool)

(assert (=> bm!1414 m!14907))

(declare-fun m!14909 () Bool)

(assert (=> b!21525 m!14909))

(declare-fun m!14911 () Bool)

(assert (=> bm!1407 m!14911))

(declare-fun m!14913 () Bool)

(assert (=> b!21504 m!14913))

(declare-fun m!14915 () Bool)

(assert (=> b!21500 m!14915))

(declare-fun m!14917 () Bool)

(assert (=> b!21495 m!14917))

(declare-fun m!14919 () Bool)

(assert (=> b!21508 m!14919))

(declare-fun m!14921 () Bool)

(assert (=> bm!1415 m!14921))

(declare-fun m!14923 () Bool)

(assert (=> bm!1418 m!14923))

(declare-fun m!14925 () Bool)

(assert (=> b!21521 m!14925))

(declare-fun m!14927 () Bool)

(assert (=> bm!1421 m!14927))

(declare-fun m!14929 () Bool)

(assert (=> b!21490 m!14929))

(declare-fun m!14931 () Bool)

(assert (=> bm!1408 m!14931))

(declare-fun m!14933 () Bool)

(assert (=> b!21514 m!14933))

(declare-fun m!14935 () Bool)

(assert (=> d!3699 m!14935))

(declare-fun m!14937 () Bool)

(assert (=> d!3699 m!14937))

(declare-fun m!14939 () Bool)

(assert (=> b!21496 m!14939))

(assert (=> b!21518 m!14911))

(declare-fun m!14941 () Bool)

(assert (=> bm!1422 m!14941))

(declare-fun m!14943 () Bool)

(assert (=> bm!1400 m!14943))

(declare-fun m!14945 () Bool)

(assert (=> b!21520 m!14945))

(declare-fun m!14947 () Bool)

(assert (=> bm!1402 m!14947))

(declare-fun m!14949 () Bool)

(assert (=> bm!1402 m!14949))

(declare-fun m!14951 () Bool)

(assert (=> b!21516 m!14951))

(declare-fun m!14953 () Bool)

(assert (=> b!21513 m!14953))

(assert (=> b!21513 m!14905))

(assert (=> b!21513 m!14909))

(declare-fun m!14955 () Bool)

(assert (=> b!21513 m!14955))

(assert (=> b!21513 m!14909))

(declare-fun m!14957 () Bool)

(assert (=> b!21513 m!14957))

(declare-fun m!14959 () Bool)

(assert (=> bm!1412 m!14959))

(assert (=> bm!1339 d!3699))

(declare-fun d!3701 () Bool)

(assert (=> d!3701 (= (array_inv!403 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvsge (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!21293 d!3701))

(declare-fun d!3703 () Bool)

(assert (=> d!3703 (= (array_inv!404 (_values!1707 (v!1570 (underlying!103 thiss!938)))) (bvsge (size!665 (_values!1707 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!21293 d!3703))

(declare-fun d!3705 () Bool)

(declare-fun e!14015 () Bool)

(assert (=> d!3705 e!14015))

(declare-fun res!13804 () Bool)

(assert (=> d!3705 (=> (not res!13804) (not e!14015))))

(declare-fun lt!6843 () LongMapFixedSize!184)

(assert (=> d!3705 (= res!13804 (valid!101 lt!6843))))

(declare-fun lt!6837 () LongMapFixedSize!184)

(assert (=> d!3705 (= lt!6843 lt!6837)))

(declare-fun lt!6826 () Unit!459)

(declare-fun e!14013 () Unit!459)

(assert (=> d!3705 (= lt!6826 e!14013)))

(declare-fun c!2513 () Bool)

(assert (=> d!3705 (= c!2513 (not (= (map!395 lt!6837) (ListLongMap!556 Nil!554))))))

(declare-fun lt!6841 () Unit!459)

(declare-fun lt!6829 () Unit!459)

(assert (=> d!3705 (= lt!6841 lt!6829)))

(declare-fun lt!6833 () array!1209)

(declare-fun lt!6840 () (_ BitVec 32))

(declare-datatypes ((List!560 0))(
  ( (Nil!557) (Cons!556 (h!1122 (_ BitVec 64)) (t!3212 List!560)) )
))
(declare-fun lt!6838 () List!560)

(declare-fun arrayNoDuplicates!0 (array!1209 (_ BitVec 32) List!560) Bool)

(assert (=> d!3705 (arrayNoDuplicates!0 lt!6833 lt!6840 lt!6838)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1209 (_ BitVec 32) (_ BitVec 32) List!560) Unit!459)

(assert (=> d!3705 (= lt!6829 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6833 lt!6840 (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) lt!6838))))

(assert (=> d!3705 (= lt!6838 Nil!557)))

(assert (=> d!3705 (= lt!6840 #b00000000000000000000000000000000)))

(assert (=> d!3705 (= lt!6833 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6846 () Unit!459)

(declare-fun lt!6834 () Unit!459)

(assert (=> d!3705 (= lt!6846 lt!6834)))

(declare-fun lt!6832 () (_ BitVec 32))

(declare-fun lt!6848 () array!1209)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1209 (_ BitVec 32)) Bool)

(assert (=> d!3705 (arrayForallSeekEntryOrOpenFound!0 lt!6832 lt!6848 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1209 (_ BitVec 32) (_ BitVec 32)) Unit!459)

(assert (=> d!3705 (= lt!6834 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6848 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) lt!6832))))

(assert (=> d!3705 (= lt!6832 #b00000000000000000000000000000000)))

(assert (=> d!3705 (= lt!6848 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6828 () Unit!459)

(declare-fun lt!6842 () Unit!459)

(assert (=> d!3705 (= lt!6828 lt!6842)))

(declare-fun lt!6839 () array!1209)

(declare-fun lt!6827 () (_ BitVec 32))

(declare-fun lt!6830 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1209 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3705 (= (arrayCountValidKeys!0 lt!6839 lt!6827 lt!6830) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1209 (_ BitVec 32) (_ BitVec 32)) Unit!459)

(assert (=> d!3705 (= lt!6842 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6839 lt!6827 lt!6830))))

(assert (=> d!3705 (= lt!6830 (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3705 (= lt!6827 #b00000000000000000000000000000000)))

(assert (=> d!3705 (= lt!6839 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!140 (Int (_ BitVec 64)) V!1155)

(assert (=> d!3705 (= lt!6837 (LongMapFixedSize!185 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (array!1208 ((as const (Array (_ BitVec 32) ValueCell!299)) EmptyCell!299) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3705 (validMask!0 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))))))

(assert (=> d!3705 (= (getNewLongMapFixedSize!26 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))) lt!6843)))

(declare-fun b!21543 () Bool)

(declare-fun e!14014 () Bool)

(declare-fun lt!6835 () array!1209)

(declare-fun lt!6831 () tuple2!902)

(assert (=> b!21543 (= e!14014 (arrayContainsKey!0 lt!6835 (_1!454 lt!6831) #b00000000000000000000000000000000))))

(declare-fun b!21544 () Bool)

(declare-fun Unit!463 () Unit!459)

(assert (=> b!21544 (= e!14013 Unit!463)))

(declare-fun b!21545 () Bool)

(declare-fun lt!6845 () (_ BitVec 32))

(assert (=> b!21545 (= e!14014 (ite (= (_1!454 lt!6831) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6845 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6845 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!21546 () Bool)

(assert (=> b!21546 (= e!14015 (= (map!395 lt!6843) (ListLongMap!556 Nil!554)))))

(declare-fun b!21547 () Bool)

(declare-fun res!13805 () Bool)

(assert (=> b!21547 (=> (not res!13805) (not e!14015))))

(assert (=> b!21547 (= res!13805 (= (mask!4691 lt!6843) (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun b!21548 () Bool)

(declare-fun Unit!464 () Unit!459)

(assert (=> b!21548 (= e!14013 Unit!464)))

(declare-fun head!827 (List!557) tuple2!902)

(assert (=> b!21548 (= lt!6831 (head!827 (toList!293 (map!395 lt!6837))))))

(assert (=> b!21548 (= lt!6835 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!21548 (= lt!6845 #b00000000000000000000000000000000)))

(declare-fun lt!6844 () Unit!459)

(declare-fun lemmaKeyInListMapIsInArray!94 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!459)

(assert (=> b!21548 (= lt!6844 (lemmaKeyInListMapIsInArray!94 lt!6835 (array!1208 ((as const (Array (_ BitVec 32) ValueCell!299)) EmptyCell!299) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) lt!6845 (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!454 lt!6831) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun c!2512 () Bool)

(assert (=> b!21548 (= c!2512 (and (not (= (_1!454 lt!6831) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!454 lt!6831) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21548 e!14014))

(declare-fun lt!6847 () Unit!459)

(assert (=> b!21548 (= lt!6847 lt!6844)))

(declare-fun lt!6836 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1209 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21548 (= lt!6836 (arrayScanForKey!0 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (_1!454 lt!6831) #b00000000000000000000000000000000))))

(assert (=> b!21548 false))

(assert (= (and d!3705 c!2513) b!21548))

(assert (= (and d!3705 (not c!2513)) b!21544))

(assert (= (and b!21548 c!2512) b!21543))

(assert (= (and b!21548 (not c!2512)) b!21545))

(assert (= (and d!3705 res!13804) b!21547))

(assert (= (and b!21547 res!13805) b!21546))

(declare-fun b_lambda!1509 () Bool)

(assert (=> (not b_lambda!1509) (not d!3705)))

(declare-fun t!3211 () Bool)

(declare-fun tb!639 () Bool)

(assert (=> (and b!21293 (= (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))) t!3211) tb!639))

(declare-fun result!1063 () Bool)

(assert (=> tb!639 (= result!1063 tp_is_empty!997)))

(assert (=> d!3705 t!3211))

(declare-fun b_and!1421 () Bool)

(assert (= b_and!1415 (and (=> t!3211 result!1063) b_and!1421)))

(declare-fun b_lambda!1511 () Bool)

(assert (=> (not b_lambda!1511) (not b!21548)))

(assert (=> b!21548 t!3211))

(declare-fun b_and!1423 () Bool)

(assert (= b_and!1421 (and (=> t!3211 result!1063) b_and!1423)))

(declare-fun m!14961 () Bool)

(assert (=> d!3705 m!14961))

(declare-fun m!14963 () Bool)

(assert (=> d!3705 m!14963))

(declare-fun m!14965 () Bool)

(assert (=> d!3705 m!14965))

(declare-fun m!14967 () Bool)

(assert (=> d!3705 m!14967))

(declare-fun m!14969 () Bool)

(assert (=> d!3705 m!14969))

(declare-fun m!14971 () Bool)

(assert (=> d!3705 m!14971))

(assert (=> d!3705 m!14835))

(declare-fun m!14973 () Bool)

(assert (=> d!3705 m!14973))

(assert (=> d!3705 m!14835))

(declare-fun m!14975 () Bool)

(assert (=> d!3705 m!14975))

(declare-fun m!14977 () Bool)

(assert (=> d!3705 m!14977))

(assert (=> d!3705 m!14835))

(declare-fun m!14979 () Bool)

(assert (=> d!3705 m!14979))

(declare-fun m!14981 () Bool)

(assert (=> b!21543 m!14981))

(declare-fun m!14983 () Bool)

(assert (=> b!21546 m!14983))

(assert (=> b!21548 m!14965))

(declare-fun m!14985 () Bool)

(assert (=> b!21548 m!14985))

(assert (=> b!21548 m!14835))

(assert (=> b!21548 m!14969))

(assert (=> b!21548 m!14969))

(declare-fun m!14987 () Bool)

(assert (=> b!21548 m!14987))

(assert (=> b!21548 m!14969))

(declare-fun m!14989 () Bool)

(assert (=> b!21548 m!14989))

(assert (=> b!21284 d!3705))

(declare-fun d!3707 () Bool)

(declare-fun e!14020 () Bool)

(assert (=> d!3707 e!14020))

(declare-fun res!13808 () Bool)

(assert (=> d!3707 (=> (not res!13808) (not e!14020))))

(declare-fun lt!6854 () (_ BitVec 32))

(assert (=> d!3707 (= res!13808 (validMask!0 lt!6854))))

(declare-datatypes ((tuple2!916 0))(
  ( (tuple2!917 (_1!461 Unit!459) (_2!461 (_ BitVec 32))) )
))
(declare-fun e!14021 () tuple2!916)

(assert (=> d!3707 (= lt!6854 (_2!461 e!14021))))

(declare-fun c!2516 () Bool)

(declare-fun lt!6853 () tuple2!916)

(assert (=> d!3707 (= c!2516 (and (bvsgt (_2!461 lt!6853) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!133 (v!1570 (underlying!103 thiss!938)))) (_2!461 lt!6853)) (bvsge (bvadd (bvand (bvashr (_2!461 lt!6853) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!133 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun Unit!465 () Unit!459)

(declare-fun Unit!466 () Unit!459)

(assert (=> d!3707 (= lt!6853 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!133 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))))) (mask!4691 (v!1570 (underlying!103 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!133 (v!1570 (underlying!103 thiss!938)))) (mask!4691 (v!1570 (underlying!103 thiss!938))))) (tuple2!917 Unit!465 (bvand (bvadd (bvshl (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!917 Unit!466 (mask!4691 (v!1570 (underlying!103 thiss!938))))))))

(assert (=> d!3707 (validMask!0 (mask!4691 (v!1570 (underlying!103 thiss!938))))))

(assert (=> d!3707 (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) lt!6854)))

(declare-fun b!21557 () Bool)

(declare-fun computeNewMaskWhile!11 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!916)

(assert (=> b!21557 (= e!14021 (computeNewMaskWhile!11 (_size!133 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (_2!461 lt!6853)))))

(declare-fun b!21558 () Bool)

(declare-fun Unit!467 () Unit!459)

(assert (=> b!21558 (= e!14021 (tuple2!917 Unit!467 (_2!461 lt!6853)))))

(declare-fun b!21559 () Bool)

(assert (=> b!21559 (= e!14020 (bvsle (_size!133 (v!1570 (underlying!103 thiss!938))) (bvadd lt!6854 #b00000000000000000000000000000001)))))

(assert (= (and d!3707 c!2516) b!21557))

(assert (= (and d!3707 (not c!2516)) b!21558))

(assert (= (and d!3707 res!13808) b!21559))

(declare-fun m!14991 () Bool)

(assert (=> d!3707 m!14991))

(assert (=> d!3707 m!14851))

(declare-fun m!14993 () Bool)

(assert (=> b!21557 m!14993))

(assert (=> b!21284 d!3707))

(declare-fun d!3709 () Bool)

(assert (=> d!3709 (= (validMask!0 (mask!4691 (v!1570 (underlying!103 thiss!938)))) (and (or (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000001111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000011111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000001111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000011111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000001111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000011111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000001111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000011111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000000111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000001111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000011111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000000111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000001111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000011111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000000111111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000001111111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000011111111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000000111111111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000001111111111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000011111111111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00000111111111111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00001111111111111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00011111111111111111111111111111) (= (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4691 (v!1570 (underlying!103 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!21292 d!3709))

(declare-fun d!3711 () Bool)

(assert (=> d!3711 (= (valid!102 thiss!938) (valid!101 (v!1570 (underlying!103 thiss!938))))))

(declare-fun bs!907 () Bool)

(assert (= bs!907 d!3711))

(declare-fun m!14995 () Bool)

(assert (=> bs!907 m!14995))

(assert (=> start!3352 d!3711))

(declare-fun d!3713 () Bool)

(declare-fun res!13815 () Bool)

(declare-fun e!14024 () Bool)

(assert (=> d!3713 (=> (not res!13815) (not e!14024))))

(declare-fun simpleValid!19 (LongMapFixedSize!184) Bool)

(assert (=> d!3713 (= res!13815 (simpleValid!19 (v!1570 (_2!452 lt!6654))))))

(assert (=> d!3713 (= (valid!101 (v!1570 (_2!452 lt!6654))) e!14024)))

(declare-fun b!21566 () Bool)

(declare-fun res!13816 () Bool)

(assert (=> b!21566 (=> (not res!13816) (not e!14024))))

(assert (=> b!21566 (= res!13816 (= (arrayCountValidKeys!0 (_keys!3139 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))) (_size!133 (v!1570 (_2!452 lt!6654)))))))

(declare-fun b!21567 () Bool)

(declare-fun res!13817 () Bool)

(assert (=> b!21567 (=> (not res!13817) (not e!14024))))

(assert (=> b!21567 (= res!13817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654)))))))

(declare-fun b!21568 () Bool)

(assert (=> b!21568 (= e!14024 (arrayNoDuplicates!0 (_keys!3139 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 Nil!557))))

(assert (= (and d!3713 res!13815) b!21566))

(assert (= (and b!21566 res!13816) b!21567))

(assert (= (and b!21567 res!13817) b!21568))

(declare-fun m!14997 () Bool)

(assert (=> d!3713 m!14997))

(declare-fun m!14999 () Bool)

(assert (=> b!21566 m!14999))

(declare-fun m!15001 () Bool)

(assert (=> b!21567 m!15001))

(declare-fun m!15003 () Bool)

(assert (=> b!21568 m!15003))

(assert (=> b!21286 d!3713))

(declare-fun c!2524 () Bool)

(declare-fun c!2527 () Bool)

(declare-fun lt!6864 () array!1207)

(declare-fun bm!1424 () Bool)

(declare-fun lt!6873 () (_ BitVec 32))

(declare-fun call!1440 () ListLongMap!555)

(declare-fun lt!6876 () (_ BitVec 32))

(assert (=> bm!1424 (= call!1440 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (ite c!2524 (_values!1707 (_2!453 lt!6655)) lt!6864) (mask!4691 (_2!453 lt!6655)) (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))) (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun b!21569 () Bool)

(declare-fun e!14034 () ListLongMap!555)

(declare-fun call!1433 () ListLongMap!555)

(assert (=> b!21569 (= e!14034 call!1433)))

(declare-fun b!21570 () Bool)

(declare-fun e!14040 () Bool)

(declare-fun e!14038 () Bool)

(assert (=> b!21570 (= e!14040 e!14038)))

(declare-fun res!13819 () Bool)

(declare-fun call!1437 () ListLongMap!555)

(assert (=> b!21570 (= res!13819 (contains!225 call!1437 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21570 (=> (not res!13819) (not e!14038))))

(declare-fun bm!1425 () Bool)

(declare-fun call!1442 () ListLongMap!555)

(assert (=> bm!1425 (= call!1442 call!1440)))

(declare-fun b!21571 () Bool)

(declare-fun e!14028 () Bool)

(declare-fun call!1443 () Bool)

(assert (=> b!21571 (= e!14028 (not call!1443))))

(declare-fun b!21572 () Bool)

(declare-fun e!14046 () Unit!459)

(declare-fun Unit!468 () Unit!459)

(assert (=> b!21572 (= e!14046 Unit!468)))

(declare-fun lt!6869 () Unit!459)

(declare-fun call!1444 () Unit!459)

(assert (=> b!21572 (= lt!6869 call!1444)))

(declare-fun lt!6857 () SeekEntryResult!52)

(declare-fun call!1430 () SeekEntryResult!52)

(assert (=> b!21572 (= lt!6857 call!1430)))

(declare-fun res!13825 () Bool)

(assert (=> b!21572 (= res!13825 ((_ is Found!52) lt!6857))))

(declare-fun e!14041 () Bool)

(assert (=> b!21572 (=> (not res!13825) (not e!14041))))

(assert (=> b!21572 e!14041))

(declare-fun lt!6878 () Unit!459)

(assert (=> b!21572 (= lt!6878 lt!6869)))

(assert (=> b!21572 false))

(declare-fun bm!1426 () Bool)

(declare-fun c!2525 () Bool)

(declare-fun c!2523 () Bool)

(assert (=> bm!1426 (= c!2525 c!2523)))

(declare-fun call!1431 () Bool)

(declare-fun e!14044 () ListLongMap!555)

(declare-fun lt!6879 () SeekEntryResult!52)

(assert (=> bm!1426 (= call!1431 (contains!225 e!14044 (ite c!2523 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!6879)))))))

(declare-fun b!21573 () Bool)

(declare-fun e!14037 () tuple2!900)

(declare-fun lt!6877 () tuple2!900)

(assert (=> b!21573 (= e!14037 (tuple2!901 (_1!453 lt!6877) (_2!453 lt!6877)))))

(declare-fun call!1429 () tuple2!900)

(assert (=> b!21573 (= lt!6877 call!1429)))

(declare-fun bm!1427 () Bool)

(declare-fun call!1439 () Bool)

(declare-fun call!1438 () Bool)

(assert (=> bm!1427 (= call!1439 call!1438)))

(declare-fun b!21574 () Bool)

(declare-fun lt!6871 () tuple2!900)

(assert (=> b!21574 (= lt!6871 call!1429)))

(declare-fun e!14033 () tuple2!900)

(assert (=> b!21574 (= e!14033 (tuple2!901 (_1!453 lt!6871) (_2!453 lt!6871)))))

(declare-fun b!21575 () Bool)

(declare-fun lt!6880 () Unit!459)

(declare-fun lt!6863 () Unit!459)

(assert (=> b!21575 (= lt!6880 lt!6863)))

(declare-fun call!1428 () ListLongMap!555)

(assert (=> b!21575 (= call!1428 call!1442)))

(assert (=> b!21575 (= lt!6863 (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) lt!6873 (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (_2!453 lt!6655)) (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> b!21575 (= lt!6873 (bvor (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000001))))

(declare-fun e!14029 () tuple2!900)

(assert (=> b!21575 (= e!14029 (tuple2!901 true (LongMapFixedSize!185 (defaultEntry!1718 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (bvor (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000001) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (_2!453 lt!6655)) (_size!133 (_2!453 lt!6655)) (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (_vacant!133 (_2!453 lt!6655)))))))

(declare-fun b!21576 () Bool)

(declare-fun e!14035 () Bool)

(declare-fun lt!6868 () SeekEntryResult!52)

(assert (=> b!21576 (= e!14035 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!6868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21577 () Bool)

(declare-fun e!14027 () Bool)

(declare-fun call!1441 () Bool)

(assert (=> b!21577 (= e!14027 (not call!1441))))

(declare-fun b!21578 () Bool)

(declare-fun c!2522 () Bool)

(declare-fun lt!6874 () SeekEntryResult!52)

(assert (=> b!21578 (= c!2522 ((_ is MissingVacant!52) lt!6874))))

(declare-fun e!14036 () Bool)

(declare-fun e!14039 () Bool)

(assert (=> b!21578 (= e!14036 e!14039)))

(declare-fun b!21579 () Bool)

(declare-fun c!2528 () Bool)

(declare-fun lt!6866 () SeekEntryResult!52)

(assert (=> b!21579 (= c!2528 ((_ is MissingVacant!52) lt!6866))))

(declare-fun e!14026 () Bool)

(declare-fun e!14031 () Bool)

(assert (=> b!21579 (= e!14026 e!14031)))

(declare-fun b!21580 () Bool)

(assert (=> b!21580 (= e!14041 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!6857)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1428 () Bool)

(declare-fun call!1449 () Bool)

(assert (=> bm!1428 (= call!1441 call!1449)))

(declare-fun bm!1429 () Bool)

(assert (=> bm!1429 (= call!1443 call!1449)))

(declare-fun bm!1430 () Bool)

(declare-fun call!1446 () Bool)

(assert (=> bm!1430 (= call!1438 call!1446)))

(declare-fun b!21581 () Bool)

(declare-fun e!14025 () tuple2!900)

(assert (=> b!21581 (= e!14025 e!14029)))

(assert (=> b!21581 (= c!2527 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21582 () Bool)

(declare-fun res!13818 () Bool)

(assert (=> b!21582 (= res!13818 call!1438)))

(assert (=> b!21582 (=> (not res!13818) (not e!14035))))

(declare-fun b!21583 () Bool)

(declare-fun res!13829 () Bool)

(assert (=> b!21583 (=> (not res!13829) (not e!14027))))

(declare-fun call!1450 () Bool)

(assert (=> b!21583 (= res!13829 call!1450)))

(assert (=> b!21583 (= e!14036 e!14027)))

(declare-fun b!21584 () Bool)

(declare-fun lt!6860 () Unit!459)

(declare-fun lt!6872 () Unit!459)

(assert (=> b!21584 (= lt!6860 lt!6872)))

(assert (=> b!21584 (= call!1428 call!1442)))

(assert (=> b!21584 (= lt!6872 (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) lt!6876 (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> b!21584 (= lt!6876 (bvor (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000010))))

(assert (=> b!21584 (= e!14029 (tuple2!901 true (LongMapFixedSize!185 (defaultEntry!1718 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (bvor (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000010) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (_size!133 (_2!453 lt!6655)) (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (_vacant!133 (_2!453 lt!6655)))))))

(declare-fun b!21585 () Bool)

(assert (=> b!21585 (= e!14044 call!1440)))

(declare-fun b!21586 () Bool)

(declare-fun call!1427 () ListLongMap!555)

(assert (=> b!21586 (= e!14044 call!1427)))

(declare-fun b!21587 () Bool)

(declare-fun lt!6862 () Unit!459)

(assert (=> b!21587 (= lt!6862 e!14046)))

(declare-fun c!2529 () Bool)

(assert (=> b!21587 (= c!2529 call!1431)))

(declare-fun e!14045 () tuple2!900)

(assert (=> b!21587 (= e!14045 (tuple2!901 false (_2!453 lt!6655)))))

(declare-fun d!3715 () Bool)

(declare-fun e!14030 () Bool)

(assert (=> d!3715 e!14030))

(declare-fun res!13824 () Bool)

(assert (=> d!3715 (=> (not res!13824) (not e!14030))))

(declare-fun lt!6855 () tuple2!900)

(assert (=> d!3715 (= res!13824 (valid!101 (_2!453 lt!6855)))))

(assert (=> d!3715 (= lt!6855 e!14025)))

(assert (=> d!3715 (= c!2524 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3715 (valid!101 (_2!453 lt!6655))))

(assert (=> d!3715 (= (update!28 (_2!453 lt!6655) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) lt!6855)))

(declare-fun b!21588 () Bool)

(declare-fun res!13821 () Bool)

(assert (=> b!21588 (=> (not res!13821) (not e!14027))))

(assert (=> b!21588 (= res!13821 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2328 lt!6874)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1431 () Bool)

(declare-fun call!1436 () SeekEntryResult!52)

(assert (=> bm!1431 (= call!1436 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655))))))

(declare-fun b!21589 () Bool)

(declare-fun e!14032 () Unit!459)

(declare-fun Unit!469 () Unit!459)

(assert (=> b!21589 (= e!14032 Unit!469)))

(declare-fun lt!6861 () Unit!459)

(declare-fun call!1445 () Unit!459)

(assert (=> b!21589 (= lt!6861 call!1445)))

(declare-fun call!1434 () SeekEntryResult!52)

(assert (=> b!21589 (= lt!6866 call!1434)))

(declare-fun c!2517 () Bool)

(assert (=> b!21589 (= c!2517 ((_ is MissingZero!52) lt!6866))))

(assert (=> b!21589 e!14026))

(declare-fun lt!6875 () Unit!459)

(assert (=> b!21589 (= lt!6875 lt!6861)))

(assert (=> b!21589 false))

(declare-fun b!21590 () Bool)

(assert (=> b!21590 (= e!14030 e!14040)))

(declare-fun c!2519 () Bool)

(assert (=> b!21590 (= c!2519 (_1!453 lt!6855))))

(declare-fun bm!1432 () Bool)

(assert (=> bm!1432 (= call!1449 (arrayContainsKey!0 (_keys!3139 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!21591 () Bool)

(declare-fun res!13822 () Bool)

(declare-fun call!1432 () Bool)

(assert (=> b!21591 (= res!13822 call!1432)))

(assert (=> b!21591 (=> (not res!13822) (not e!14041))))

(declare-fun bm!1433 () Bool)

(assert (=> bm!1433 (= call!1430 call!1436)))

(declare-fun bm!1434 () Bool)

(declare-fun call!1435 () ListLongMap!555)

(assert (=> bm!1434 (= call!1435 (map!395 (_2!453 lt!6655)))))

(declare-fun b!21592 () Bool)

(assert (=> b!21592 (= e!14040 (= call!1437 call!1435))))

(declare-fun b!21593 () Bool)

(declare-fun lt!6856 () Unit!459)

(declare-fun lt!6881 () Unit!459)

(assert (=> b!21593 (= lt!6856 lt!6881)))

(assert (=> b!21593 call!1431))

(assert (=> b!21593 (= lt!6881 (lemmaValidKeyInArrayIsInListMap!7 (_keys!3139 (_2!453 lt!6655)) lt!6864 (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (index!2329 lt!6879) (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> b!21593 (= lt!6864 (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655)))))))

(declare-fun lt!6867 () Unit!459)

(declare-fun lt!6859 () Unit!459)

(assert (=> b!21593 (= lt!6867 lt!6859)))

(declare-fun call!1448 () ListLongMap!555)

(assert (=> b!21593 (= call!1448 call!1427)))

(assert (=> b!21593 (= lt!6859 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (index!2329 lt!6879) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!6865 () Unit!459)

(assert (=> b!21593 (= lt!6865 e!14032)))

(declare-fun c!2521 () Bool)

(assert (=> b!21593 (= c!2521 (contains!225 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21593 (= e!14033 (tuple2!901 true (LongMapFixedSize!185 (defaultEntry!1718 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (_size!133 (_2!453 lt!6655)) (_keys!3139 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655)))) (_vacant!133 (_2!453 lt!6655)))))))

(declare-fun b!21594 () Bool)

(assert (=> b!21594 (= e!14038 (= call!1437 (+!42 call!1435 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun bm!1435 () Bool)

(assert (=> bm!1435 (= call!1434 call!1436)))

(declare-fun bm!1436 () Bool)

(assert (=> bm!1436 (= call!1445 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun bm!1437 () Bool)

(declare-fun call!1447 () ListLongMap!555)

(assert (=> bm!1437 (= call!1427 call!1447)))

(declare-fun b!21595 () Bool)

(assert (=> b!21595 (= e!14031 e!14028)))

(declare-fun res!13827 () Bool)

(assert (=> b!21595 (= res!13827 call!1439)))

(assert (=> b!21595 (=> (not res!13827) (not e!14028))))

(declare-fun b!21596 () Bool)

(declare-fun res!13823 () Bool)

(declare-fun e!14042 () Bool)

(assert (=> b!21596 (=> (not res!13823) (not e!14042))))

(assert (=> b!21596 (= res!13823 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2328 lt!6866)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1438 () Bool)

(assert (=> bm!1438 (= call!1447 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (ite (or c!2524 c!2523) (_values!1707 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655))))) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun bm!1439 () Bool)

(assert (=> bm!1439 (= call!1437 (map!395 (_2!453 lt!6855)))))

(declare-fun bm!1440 () Bool)

(assert (=> bm!1440 (= call!1428 call!1448)))

(declare-fun bm!1441 () Bool)

(assert (=> bm!1441 (= call!1450 call!1432)))

(declare-fun bm!1442 () Bool)

(assert (=> bm!1442 (= call!1444 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun b!21597 () Bool)

(declare-fun lt!6870 () Unit!459)

(assert (=> b!21597 (= e!14046 lt!6870)))

(assert (=> b!21597 (= lt!6870 call!1445)))

(assert (=> b!21597 (= lt!6874 call!1430)))

(declare-fun c!2518 () Bool)

(assert (=> b!21597 (= c!2518 ((_ is MissingZero!52) lt!6874))))

(assert (=> b!21597 e!14036))

(declare-fun b!21598 () Bool)

(assert (=> b!21598 (= e!14025 e!14045)))

(assert (=> b!21598 (= lt!6879 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655))))))

(assert (=> b!21598 (= c!2523 ((_ is Undefined!52) lt!6879))))

(declare-fun b!21599 () Bool)

(declare-fun e!14043 () Bool)

(assert (=> b!21599 (= e!14043 (not call!1441))))

(declare-fun b!21600 () Bool)

(declare-fun res!13831 () Bool)

(assert (=> b!21600 (= res!13831 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2331 lt!6866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21600 (=> (not res!13831) (not e!14028))))

(declare-fun bm!1443 () Bool)

(assert (=> bm!1443 (= call!1433 call!1447)))

(declare-fun bm!1444 () Bool)

(assert (=> bm!1444 (= call!1448 (+!42 e!14034 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun c!2526 () Bool)

(assert (=> bm!1444 (= c!2526 c!2524)))

(declare-fun bm!1445 () Bool)

(declare-fun c!2520 () Bool)

(assert (=> bm!1445 (= call!1429 (updateHelperNewKey!7 (_2!453 lt!6655) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879))))))

(declare-fun b!21601 () Bool)

(declare-fun res!13828 () Bool)

(assert (=> b!21601 (= res!13828 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2331 lt!6874)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21601 (=> (not res!13828) (not e!14043))))

(declare-fun b!21602 () Bool)

(assert (=> b!21602 (= e!14042 (not call!1443))))

(declare-fun b!21603 () Bool)

(assert (=> b!21603 (= e!14037 e!14033)))

(declare-fun c!2530 () Bool)

(assert (=> b!21603 (= c!2530 ((_ is MissingZero!52) lt!6879))))

(declare-fun b!21604 () Bool)

(assert (=> b!21604 (= e!14039 e!14043)))

(declare-fun res!13826 () Bool)

(assert (=> b!21604 (= res!13826 call!1450)))

(assert (=> b!21604 (=> (not res!13826) (not e!14043))))

(declare-fun bm!1446 () Bool)

(assert (=> bm!1446 (= call!1446 (inRange!0 (ite c!2523 (ite c!2529 (index!2329 lt!6857) (ite c!2518 (index!2328 lt!6874) (index!2331 lt!6874))) (ite c!2521 (index!2329 lt!6868) (ite c!2517 (index!2328 lt!6866) (index!2331 lt!6866)))) (mask!4691 (_2!453 lt!6655))))))

(declare-fun b!21605 () Bool)

(assert (=> b!21605 (= e!14034 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun b!21606 () Bool)

(declare-fun lt!6858 () Unit!459)

(assert (=> b!21606 (= e!14032 lt!6858)))

(assert (=> b!21606 (= lt!6858 call!1444)))

(assert (=> b!21606 (= lt!6868 call!1434)))

(declare-fun res!13820 () Bool)

(assert (=> b!21606 (= res!13820 ((_ is Found!52) lt!6868))))

(assert (=> b!21606 (=> (not res!13820) (not e!14035))))

(assert (=> b!21606 e!14035))

(declare-fun bm!1447 () Bool)

(assert (=> bm!1447 (= call!1432 call!1446)))

(declare-fun b!21607 () Bool)

(declare-fun res!13830 () Bool)

(assert (=> b!21607 (=> (not res!13830) (not e!14042))))

(assert (=> b!21607 (= res!13830 call!1439)))

(assert (=> b!21607 (= e!14026 e!14042)))

(declare-fun b!21608 () Bool)

(assert (=> b!21608 (= e!14039 ((_ is Undefined!52) lt!6874))))

(declare-fun b!21609 () Bool)

(assert (=> b!21609 (= e!14031 ((_ is Undefined!52) lt!6866))))

(declare-fun b!21610 () Bool)

(assert (=> b!21610 (= c!2520 ((_ is MissingVacant!52) lt!6879))))

(assert (=> b!21610 (= e!14045 e!14037)))

(assert (= (and d!3715 c!2524) b!21581))

(assert (= (and d!3715 (not c!2524)) b!21598))

(assert (= (and b!21581 c!2527) b!21575))

(assert (= (and b!21581 (not c!2527)) b!21584))

(assert (= (or b!21575 b!21584) bm!1425))

(assert (= (or b!21575 b!21584) bm!1443))

(assert (= (or b!21575 b!21584) bm!1440))

(assert (= (and b!21598 c!2523) b!21587))

(assert (= (and b!21598 (not c!2523)) b!21610))

(assert (= (and b!21587 c!2529) b!21572))

(assert (= (and b!21587 (not c!2529)) b!21597))

(assert (= (and b!21572 res!13825) b!21591))

(assert (= (and b!21591 res!13822) b!21580))

(assert (= (and b!21597 c!2518) b!21583))

(assert (= (and b!21597 (not c!2518)) b!21578))

(assert (= (and b!21583 res!13829) b!21588))

(assert (= (and b!21588 res!13821) b!21577))

(assert (= (and b!21578 c!2522) b!21604))

(assert (= (and b!21578 (not c!2522)) b!21608))

(assert (= (and b!21604 res!13826) b!21601))

(assert (= (and b!21601 res!13828) b!21599))

(assert (= (or b!21583 b!21604) bm!1441))

(assert (= (or b!21577 b!21599) bm!1428))

(assert (= (or b!21591 bm!1441) bm!1447))

(assert (= (or b!21572 b!21597) bm!1433))

(assert (= (and b!21610 c!2520) b!21573))

(assert (= (and b!21610 (not c!2520)) b!21603))

(assert (= (and b!21603 c!2530) b!21574))

(assert (= (and b!21603 (not c!2530)) b!21593))

(assert (= (and b!21593 c!2521) b!21606))

(assert (= (and b!21593 (not c!2521)) b!21589))

(assert (= (and b!21606 res!13820) b!21582))

(assert (= (and b!21582 res!13818) b!21576))

(assert (= (and b!21589 c!2517) b!21607))

(assert (= (and b!21589 (not c!2517)) b!21579))

(assert (= (and b!21607 res!13830) b!21596))

(assert (= (and b!21596 res!13823) b!21602))

(assert (= (and b!21579 c!2528) b!21595))

(assert (= (and b!21579 (not c!2528)) b!21609))

(assert (= (and b!21595 res!13827) b!21600))

(assert (= (and b!21600 res!13831) b!21571))

(assert (= (or b!21607 b!21595) bm!1427))

(assert (= (or b!21602 b!21571) bm!1429))

(assert (= (or b!21582 bm!1427) bm!1430))

(assert (= (or b!21606 b!21589) bm!1435))

(assert (= (or b!21573 b!21574) bm!1445))

(assert (= (or bm!1433 bm!1435) bm!1431))

(assert (= (or bm!1447 bm!1430) bm!1446))

(assert (= (or bm!1428 bm!1429) bm!1432))

(assert (= (or b!21572 b!21606) bm!1442))

(assert (= (or b!21597 b!21589) bm!1436))

(assert (= (or b!21587 b!21593) bm!1437))

(assert (= (or b!21587 b!21593) bm!1426))

(assert (= (and bm!1426 c!2525) b!21586))

(assert (= (and bm!1426 (not c!2525)) b!21585))

(assert (= (or bm!1425 b!21585) bm!1424))

(assert (= (or bm!1443 bm!1437) bm!1438))

(assert (= (or bm!1440 b!21593) bm!1444))

(assert (= (and bm!1444 c!2526) b!21569))

(assert (= (and bm!1444 (not c!2526)) b!21605))

(assert (= (and d!3715 res!13824) b!21590))

(assert (= (and b!21590 c!2519) b!21570))

(assert (= (and b!21590 (not c!2519)) b!21592))

(assert (= (and b!21570 res!13819) b!21594))

(assert (= (or b!21570 b!21594 b!21592) bm!1439))

(assert (= (or b!21594 b!21592) bm!1434))

(declare-fun m!15005 () Bool)

(assert (=> bm!1444 m!15005))

(declare-fun m!15007 () Bool)

(assert (=> bm!1434 m!15007))

(declare-fun m!15009 () Bool)

(assert (=> bm!1438 m!15009))

(declare-fun m!15011 () Bool)

(assert (=> bm!1438 m!15011))

(declare-fun m!15013 () Bool)

(assert (=> b!21605 m!15013))

(declare-fun m!15015 () Bool)

(assert (=> bm!1431 m!15015))

(declare-fun m!15017 () Bool)

(assert (=> b!21584 m!15017))

(declare-fun m!15019 () Bool)

(assert (=> b!21580 m!15019))

(declare-fun m!15021 () Bool)

(assert (=> b!21575 m!15021))

(declare-fun m!15023 () Bool)

(assert (=> b!21588 m!15023))

(declare-fun m!15025 () Bool)

(assert (=> bm!1439 m!15025))

(declare-fun m!15027 () Bool)

(assert (=> bm!1442 m!15027))

(declare-fun m!15029 () Bool)

(assert (=> b!21601 m!15029))

(declare-fun m!15031 () Bool)

(assert (=> bm!1445 m!15031))

(declare-fun m!15033 () Bool)

(assert (=> b!21570 m!15033))

(declare-fun m!15035 () Bool)

(assert (=> bm!1432 m!15035))

(declare-fun m!15037 () Bool)

(assert (=> b!21594 m!15037))

(declare-fun m!15039 () Bool)

(assert (=> d!3715 m!15039))

(declare-fun m!15041 () Bool)

(assert (=> d!3715 m!15041))

(declare-fun m!15043 () Bool)

(assert (=> b!21576 m!15043))

(assert (=> b!21598 m!15015))

(declare-fun m!15045 () Bool)

(assert (=> bm!1446 m!15045))

(declare-fun m!15047 () Bool)

(assert (=> bm!1424 m!15047))

(declare-fun m!15049 () Bool)

(assert (=> b!21600 m!15049))

(declare-fun m!15051 () Bool)

(assert (=> bm!1426 m!15051))

(declare-fun m!15053 () Bool)

(assert (=> bm!1426 m!15053))

(declare-fun m!15055 () Bool)

(assert (=> b!21596 m!15055))

(declare-fun m!15057 () Bool)

(assert (=> b!21593 m!15057))

(assert (=> b!21593 m!15009))

(assert (=> b!21593 m!15013))

(declare-fun m!15059 () Bool)

(assert (=> b!21593 m!15059))

(assert (=> b!21593 m!15013))

(declare-fun m!15061 () Bool)

(assert (=> b!21593 m!15061))

(declare-fun m!15063 () Bool)

(assert (=> bm!1436 m!15063))

(assert (=> b!21289 d!3715))

(declare-fun bm!1462 () Bool)

(declare-fun call!1469 () ListLongMap!555)

(declare-fun call!1465 () ListLongMap!555)

(assert (=> bm!1462 (= call!1469 call!1465)))

(declare-fun b!21653 () Bool)

(declare-fun e!14073 () Bool)

(declare-fun lt!6943 () ListLongMap!555)

(declare-fun apply!28 (ListLongMap!555 (_ BitVec 64)) V!1155)

(declare-fun get!377 (ValueCell!299 V!1155) V!1155)

(assert (=> b!21653 (= e!14073 (= (apply!28 lt!6943 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (get!377 (select (arr!572 (_values!1707 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21653 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_values!1707 (v!1570 (underlying!103 thiss!938))))))))

(assert (=> b!21653 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun b!21654 () Bool)

(declare-fun e!14079 () Bool)

(assert (=> b!21654 (= e!14079 (= (apply!28 lt!6943 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun bm!1463 () Bool)

(declare-fun call!1470 () ListLongMap!555)

(assert (=> bm!1463 (= call!1465 call!1470)))

(declare-fun b!21655 () Bool)

(declare-fun e!14077 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!21655 (= e!14077 (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun b!21656 () Bool)

(declare-fun e!14081 () Unit!459)

(declare-fun lt!6934 () Unit!459)

(assert (=> b!21656 (= e!14081 lt!6934)))

(declare-fun lt!6936 () ListLongMap!555)

(declare-fun getCurrentListMapNoExtraKeys!13 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) Int) ListLongMap!555)

(assert (=> b!21656 (= lt!6936 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (_values!1707 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun lt!6930 () (_ BitVec 64))

(assert (=> b!21656 (= lt!6930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6929 () (_ BitVec 64))

(assert (=> b!21656 (= lt!6929 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))

(declare-fun lt!6932 () Unit!459)

(declare-fun addStillContains!13 (ListLongMap!555 (_ BitVec 64) V!1155 (_ BitVec 64)) Unit!459)

(assert (=> b!21656 (= lt!6932 (addStillContains!13 lt!6936 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6929))))

(assert (=> b!21656 (contains!225 (+!42 lt!6936 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6929)))

(declare-fun lt!6940 () Unit!459)

(assert (=> b!21656 (= lt!6940 lt!6932)))

(declare-fun lt!6933 () ListLongMap!555)

(assert (=> b!21656 (= lt!6933 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (_values!1707 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun lt!6927 () (_ BitVec 64))

(assert (=> b!21656 (= lt!6927 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6939 () (_ BitVec 64))

(assert (=> b!21656 (= lt!6939 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))

(declare-fun lt!6941 () Unit!459)

(declare-fun addApplyDifferent!13 (ListLongMap!555 (_ BitVec 64) V!1155 (_ BitVec 64)) Unit!459)

(assert (=> b!21656 (= lt!6941 (addApplyDifferent!13 lt!6933 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6939))))

(assert (=> b!21656 (= (apply!28 (+!42 lt!6933 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6939) (apply!28 lt!6933 lt!6939))))

(declare-fun lt!6947 () Unit!459)

(assert (=> b!21656 (= lt!6947 lt!6941)))

(declare-fun lt!6931 () ListLongMap!555)

(assert (=> b!21656 (= lt!6931 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (_values!1707 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun lt!6928 () (_ BitVec 64))

(assert (=> b!21656 (= lt!6928 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6926 () (_ BitVec 64))

(assert (=> b!21656 (= lt!6926 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))

(declare-fun lt!6938 () Unit!459)

(assert (=> b!21656 (= lt!6938 (addApplyDifferent!13 lt!6931 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6926))))

(assert (=> b!21656 (= (apply!28 (+!42 lt!6931 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6926) (apply!28 lt!6931 lt!6926))))

(declare-fun lt!6937 () Unit!459)

(assert (=> b!21656 (= lt!6937 lt!6938)))

(declare-fun lt!6944 () ListLongMap!555)

(assert (=> b!21656 (= lt!6944 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (_values!1707 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun lt!6942 () (_ BitVec 64))

(assert (=> b!21656 (= lt!6942 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6945 () (_ BitVec 64))

(assert (=> b!21656 (= lt!6945 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))

(assert (=> b!21656 (= lt!6934 (addApplyDifferent!13 lt!6944 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6945))))

(assert (=> b!21656 (= (apply!28 (+!42 lt!6944 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6945) (apply!28 lt!6944 lt!6945))))

(declare-fun bm!1464 () Bool)

(assert (=> bm!1464 (= call!1470 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (_values!1707 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun b!21658 () Bool)

(declare-fun e!14074 () Bool)

(declare-fun e!14080 () Bool)

(assert (=> b!21658 (= e!14074 e!14080)))

(declare-fun c!2548 () Bool)

(assert (=> b!21658 (= c!2548 (not (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1465 () Bool)

(declare-fun call!1467 () ListLongMap!555)

(declare-fun call!1468 () ListLongMap!555)

(assert (=> bm!1465 (= call!1467 call!1468)))

(declare-fun b!21659 () Bool)

(declare-fun res!13855 () Bool)

(assert (=> b!21659 (=> (not res!13855) (not e!14074))))

(declare-fun e!14085 () Bool)

(assert (=> b!21659 (= res!13855 e!14085)))

(declare-fun c!2545 () Bool)

(assert (=> b!21659 (= c!2545 (not (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!1466 () Bool)

(declare-fun call!1466 () Bool)

(assert (=> bm!1466 (= call!1466 (contains!225 lt!6943 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21660 () Bool)

(declare-fun e!14078 () Bool)

(assert (=> b!21660 (= e!14078 (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun b!21661 () Bool)

(declare-fun res!13852 () Bool)

(assert (=> b!21661 (=> (not res!13852) (not e!14074))))

(declare-fun e!14075 () Bool)

(assert (=> b!21661 (= res!13852 e!14075)))

(declare-fun res!13850 () Bool)

(assert (=> b!21661 (=> res!13850 e!14075)))

(assert (=> b!21661 (= res!13850 (not e!14078))))

(declare-fun res!13856 () Bool)

(assert (=> b!21661 (=> (not res!13856) (not e!14078))))

(assert (=> b!21661 (= res!13856 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun b!21662 () Bool)

(declare-fun e!14084 () ListLongMap!555)

(assert (=> b!21662 (= e!14084 call!1467)))

(declare-fun b!21663 () Bool)

(assert (=> b!21663 (= e!14085 (not call!1466))))

(declare-fun b!21664 () Bool)

(declare-fun e!14082 () ListLongMap!555)

(assert (=> b!21664 (= e!14082 call!1467)))

(declare-fun b!21665 () Bool)

(declare-fun e!14083 () ListLongMap!555)

(assert (=> b!21665 (= e!14083 e!14082)))

(declare-fun c!2547 () Bool)

(assert (=> b!21665 (= c!2547 (and (not (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21666 () Bool)

(declare-fun e!14076 () Bool)

(assert (=> b!21666 (= e!14080 e!14076)))

(declare-fun res!13851 () Bool)

(declare-fun call!1471 () Bool)

(assert (=> b!21666 (= res!13851 call!1471)))

(assert (=> b!21666 (=> (not res!13851) (not e!14076))))

(declare-fun b!21667 () Bool)

(assert (=> b!21667 (= e!14080 (not call!1471))))

(declare-fun b!21668 () Bool)

(assert (=> b!21668 (= e!14076 (= (apply!28 lt!6943 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun bm!1467 () Bool)

(assert (=> bm!1467 (= call!1471 (contains!225 lt!6943 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21657 () Bool)

(assert (=> b!21657 (= e!14075 e!14073)))

(declare-fun res!13857 () Bool)

(assert (=> b!21657 (=> (not res!13857) (not e!14073))))

(assert (=> b!21657 (= res!13857 (contains!225 lt!6943 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!21657 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun d!3717 () Bool)

(assert (=> d!3717 e!14074))

(declare-fun res!13853 () Bool)

(assert (=> d!3717 (=> (not res!13853) (not e!14074))))

(assert (=> d!3717 (= res!13853 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun lt!6935 () ListLongMap!555)

(assert (=> d!3717 (= lt!6943 lt!6935)))

(declare-fun lt!6946 () Unit!459)

(assert (=> d!3717 (= lt!6946 e!14081)))

(declare-fun c!2544 () Bool)

(assert (=> d!3717 (= c!2544 e!14077)))

(declare-fun res!13858 () Bool)

(assert (=> d!3717 (=> (not res!13858) (not e!14077))))

(assert (=> d!3717 (= res!13858 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))))))

(assert (=> d!3717 (= lt!6935 e!14083)))

(declare-fun c!2543 () Bool)

(assert (=> d!3717 (= c!2543 (and (not (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3717 (validMask!0 (mask!4691 (v!1570 (underlying!103 thiss!938))))))

(assert (=> d!3717 (= (getCurrentListMap!124 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (_values!1707 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))) lt!6943)))

(declare-fun b!21669 () Bool)

(assert (=> b!21669 (= e!14085 e!14079)))

(declare-fun res!13854 () Bool)

(assert (=> b!21669 (= res!13854 call!1466)))

(assert (=> b!21669 (=> (not res!13854) (not e!14079))))

(declare-fun b!21670 () Bool)

(assert (=> b!21670 (= e!14084 call!1469)))

(declare-fun b!21671 () Bool)

(declare-fun Unit!470 () Unit!459)

(assert (=> b!21671 (= e!14081 Unit!470)))

(declare-fun bm!1468 () Bool)

(assert (=> bm!1468 (= call!1468 (+!42 (ite c!2543 call!1470 (ite c!2547 call!1465 call!1469)) (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun b!21672 () Bool)

(assert (=> b!21672 (= e!14083 (+!42 call!1468 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun b!21673 () Bool)

(declare-fun c!2546 () Bool)

(assert (=> b!21673 (= c!2546 (and (not (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21673 (= e!14082 e!14084)))

(assert (= (and d!3717 c!2543) b!21672))

(assert (= (and d!3717 (not c!2543)) b!21665))

(assert (= (and b!21665 c!2547) b!21664))

(assert (= (and b!21665 (not c!2547)) b!21673))

(assert (= (and b!21673 c!2546) b!21662))

(assert (= (and b!21673 (not c!2546)) b!21670))

(assert (= (or b!21662 b!21670) bm!1462))

(assert (= (or b!21664 bm!1462) bm!1463))

(assert (= (or b!21664 b!21662) bm!1465))

(assert (= (or b!21672 bm!1463) bm!1464))

(assert (= (or b!21672 bm!1465) bm!1468))

(assert (= (and d!3717 res!13858) b!21655))

(assert (= (and d!3717 c!2544) b!21656))

(assert (= (and d!3717 (not c!2544)) b!21671))

(assert (= (and d!3717 res!13853) b!21661))

(assert (= (and b!21661 res!13856) b!21660))

(assert (= (and b!21661 (not res!13850)) b!21657))

(assert (= (and b!21657 res!13857) b!21653))

(assert (= (and b!21661 res!13852) b!21659))

(assert (= (and b!21659 c!2545) b!21669))

(assert (= (and b!21659 (not c!2545)) b!21663))

(assert (= (and b!21669 res!13854) b!21654))

(assert (= (or b!21669 b!21663) bm!1466))

(assert (= (and b!21659 res!13855) b!21658))

(assert (= (and b!21658 c!2548) b!21666))

(assert (= (and b!21658 (not c!2548)) b!21667))

(assert (= (and b!21666 res!13851) b!21668))

(assert (= (or b!21666 b!21667) bm!1467))

(declare-fun b_lambda!1513 () Bool)

(assert (=> (not b_lambda!1513) (not b!21653)))

(assert (=> b!21653 t!3211))

(declare-fun b_and!1425 () Bool)

(assert (= b_and!1423 (and (=> t!3211 result!1063) b_and!1425)))

(declare-fun m!15065 () Bool)

(assert (=> b!21668 m!15065))

(declare-fun m!15067 () Bool)

(assert (=> b!21656 m!15067))

(declare-fun m!15069 () Bool)

(assert (=> b!21656 m!15069))

(declare-fun m!15071 () Bool)

(assert (=> b!21656 m!15071))

(declare-fun m!15073 () Bool)

(assert (=> b!21656 m!15073))

(declare-fun m!15075 () Bool)

(assert (=> b!21656 m!15075))

(declare-fun m!15077 () Bool)

(assert (=> b!21656 m!15077))

(declare-fun m!15079 () Bool)

(assert (=> b!21656 m!15079))

(declare-fun m!15081 () Bool)

(assert (=> b!21656 m!15081))

(declare-fun m!15083 () Bool)

(assert (=> b!21656 m!15083))

(assert (=> b!21656 m!15081))

(declare-fun m!15085 () Bool)

(assert (=> b!21656 m!15085))

(declare-fun m!15087 () Bool)

(assert (=> b!21656 m!15087))

(declare-fun m!15089 () Bool)

(assert (=> b!21656 m!15089))

(assert (=> b!21656 m!15077))

(assert (=> b!21656 m!15073))

(declare-fun m!15091 () Bool)

(assert (=> b!21656 m!15091))

(declare-fun m!15093 () Bool)

(assert (=> b!21656 m!15093))

(assert (=> b!21656 m!15091))

(declare-fun m!15095 () Bool)

(assert (=> b!21656 m!15095))

(declare-fun m!15097 () Bool)

(assert (=> b!21656 m!15097))

(declare-fun m!15099 () Bool)

(assert (=> b!21656 m!15099))

(assert (=> bm!1464 m!15071))

(declare-fun m!15101 () Bool)

(assert (=> bm!1467 m!15101))

(declare-fun m!15103 () Bool)

(assert (=> b!21672 m!15103))

(assert (=> b!21660 m!15095))

(assert (=> b!21660 m!15095))

(declare-fun m!15105 () Bool)

(assert (=> b!21660 m!15105))

(assert (=> b!21655 m!15095))

(assert (=> b!21655 m!15095))

(assert (=> b!21655 m!15105))

(assert (=> d!3717 m!14851))

(assert (=> b!21657 m!15095))

(assert (=> b!21657 m!15095))

(declare-fun m!15107 () Bool)

(assert (=> b!21657 m!15107))

(declare-fun m!15109 () Bool)

(assert (=> bm!1468 m!15109))

(declare-fun m!15111 () Bool)

(assert (=> bm!1466 m!15111))

(declare-fun m!15113 () Bool)

(assert (=> b!21654 m!15113))

(declare-fun m!15115 () Bool)

(assert (=> b!21653 m!15115))

(assert (=> b!21653 m!15115))

(assert (=> b!21653 m!14969))

(declare-fun m!15117 () Bool)

(assert (=> b!21653 m!15117))

(assert (=> b!21653 m!14969))

(assert (=> b!21653 m!15095))

(declare-fun m!15119 () Bool)

(assert (=> b!21653 m!15119))

(assert (=> b!21653 m!15095))

(assert (=> b!21285 d!3717))

(declare-fun d!3719 () Bool)

(assert (=> d!3719 (= (map!395 (v!1570 (_2!452 lt!6654))) (getCurrentListMap!124 (_keys!3139 (v!1570 (_2!452 lt!6654))) (_values!1707 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654))) (extraKeys!1621 (v!1570 (_2!452 lt!6654))) (zeroValue!1645 (v!1570 (_2!452 lt!6654))) (minValue!1645 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1570 (_2!452 lt!6654)))))))

(declare-fun bs!908 () Bool)

(assert (= bs!908 d!3719))

(declare-fun m!15121 () Bool)

(assert (=> bs!908 m!15121))

(assert (=> b!21285 d!3719))

(declare-fun mapNonEmpty!985 () Bool)

(declare-fun mapRes!985 () Bool)

(declare-fun tp!3451 () Bool)

(declare-fun e!14090 () Bool)

(assert (=> mapNonEmpty!985 (= mapRes!985 (and tp!3451 e!14090))))

(declare-fun mapKey!985 () (_ BitVec 32))

(declare-fun mapValue!985 () ValueCell!299)

(declare-fun mapRest!985 () (Array (_ BitVec 32) ValueCell!299))

(assert (=> mapNonEmpty!985 (= mapRest!976 (store mapRest!985 mapKey!985 mapValue!985))))

(declare-fun b!21681 () Bool)

(declare-fun e!14091 () Bool)

(assert (=> b!21681 (= e!14091 tp_is_empty!997)))

(declare-fun mapIsEmpty!985 () Bool)

(assert (=> mapIsEmpty!985 mapRes!985))

(declare-fun condMapEmpty!985 () Bool)

(declare-fun mapDefault!985 () ValueCell!299)

(assert (=> mapNonEmpty!976 (= condMapEmpty!985 (= mapRest!976 ((as const (Array (_ BitVec 32) ValueCell!299)) mapDefault!985)))))

(assert (=> mapNonEmpty!976 (= tp!3435 (and e!14091 mapRes!985))))

(declare-fun b!21680 () Bool)

(assert (=> b!21680 (= e!14090 tp_is_empty!997)))

(assert (= (and mapNonEmpty!976 condMapEmpty!985) mapIsEmpty!985))

(assert (= (and mapNonEmpty!976 (not condMapEmpty!985)) mapNonEmpty!985))

(assert (= (and mapNonEmpty!985 ((_ is ValueCellFull!299) mapValue!985)) b!21680))

(assert (= (and mapNonEmpty!976 ((_ is ValueCellFull!299) mapDefault!985)) b!21681))

(declare-fun m!15123 () Bool)

(assert (=> mapNonEmpty!985 m!15123))

(declare-fun b_lambda!1515 () Bool)

(assert (= b_lambda!1511 (or (and b!21293 b_free!733) b_lambda!1515)))

(declare-fun b_lambda!1517 () Bool)

(assert (= b_lambda!1509 (or (and b!21293 b_free!733) b_lambda!1517)))

(declare-fun b_lambda!1519 () Bool)

(assert (= b_lambda!1513 (or (and b!21293 b_free!733) b_lambda!1519)))

(check-sat (not b!21672) (not bm!1446) (not bm!1410) (not bm!1431) (not bm!1444) (not bm!1400) (not bm!1466) (not bm!1432) (not b!21668) (not b!21655) (not bm!1412) (not b!21584) (not b!21548) (not bm!1442) (not d!3707) (not b_lambda!1515) (not b!21570) (not b_lambda!1519) (not d!3717) (not b!21504) (not bm!1424) (not b!21593) (not b!21656) (not b!21495) (not bm!1426) (not b!21513) (not d!3711) tp_is_empty!997 (not b!21525) (not b!21654) (not b_next!733) (not b!21657) (not bm!1468) (not bm!1436) (not bm!1422) (not bm!1402) (not bm!1420) (not b!21594) (not d!3713) (not b!21514) (not b!21598) (not bm!1415) (not b!21653) b_and!1425 (not bm!1467) (not d!3699) (not d!3705) (not bm!1408) (not bm!1418) (not b!21566) (not b!21567) (not d!3719) (not b_lambda!1517) (not bm!1414) (not b!21518) (not bm!1421) (not bm!1445) (not bm!1407) (not d!3715) (not bm!1438) (not b!21660) (not bm!1439) (not mapNonEmpty!985) (not bm!1464) (not b!21568) (not b!21557) (not b!21605) (not b!21543) (not b!21546) (not b!21490) (not b!21575) (not bm!1434))
(check-sat b_and!1425 (not b_next!733))
(get-model)

(declare-fun d!3721 () Bool)

(assert (=> d!3721 (= (+!42 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) lt!6774 (zeroValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!6950 () Unit!459)

(declare-fun choose!194 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 V!1155 Int) Unit!459)

(assert (=> d!3721 (= lt!6950 (choose!194 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) lt!6774 (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (defaultEntry!1718 lt!6656)))))

(assert (=> d!3721 (validMask!0 (mask!4691 lt!6656))))

(assert (=> d!3721 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) lt!6774 (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (defaultEntry!1718 lt!6656)) lt!6950)))

(declare-fun bs!909 () Bool)

(assert (= bs!909 d!3721))

(assert (=> bs!909 m!14909))

(declare-fun m!15125 () Bool)

(assert (=> bs!909 m!15125))

(declare-fun m!15127 () Bool)

(assert (=> bs!909 m!15127))

(assert (=> bs!909 m!14909))

(declare-fun m!15129 () Bool)

(assert (=> bs!909 m!15129))

(declare-fun m!15131 () Bool)

(assert (=> bs!909 m!15131))

(assert (=> b!21504 d!3721))

(declare-fun d!3723 () Bool)

(assert (=> d!3723 (= (map!395 (_2!453 lt!6753)) (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6753)) (_values!1707 (_2!453 lt!6753)) (mask!4691 (_2!453 lt!6753)) (extraKeys!1621 (_2!453 lt!6753)) (zeroValue!1645 (_2!453 lt!6753)) (minValue!1645 (_2!453 lt!6753)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6753))))))

(declare-fun bs!910 () Bool)

(assert (= bs!910 d!3723))

(declare-fun m!15133 () Bool)

(assert (=> bs!910 m!15133))

(assert (=> bm!1415 d!3723))

(declare-fun d!3725 () Bool)

(assert (=> d!3725 (= (map!395 (_2!453 lt!6855)) (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6855)) (_values!1707 (_2!453 lt!6855)) (mask!4691 (_2!453 lt!6855)) (extraKeys!1621 (_2!453 lt!6855)) (zeroValue!1645 (_2!453 lt!6855)) (minValue!1645 (_2!453 lt!6855)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6855))))))

(declare-fun bs!911 () Bool)

(assert (= bs!911 d!3725))

(declare-fun m!15135 () Bool)

(assert (=> bs!911 m!15135))

(assert (=> bm!1439 d!3725))

(declare-fun d!3727 () Bool)

(assert (=> d!3727 (= (+!42 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) lt!6876 (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!6951 () Unit!459)

(assert (=> d!3727 (= lt!6951 (choose!194 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) lt!6876 (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> d!3727 (validMask!0 (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3727 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) lt!6876 (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 (_2!453 lt!6655))) lt!6951)))

(declare-fun bs!912 () Bool)

(assert (= bs!912 d!3727))

(assert (=> bs!912 m!15013))

(declare-fun m!15137 () Bool)

(assert (=> bs!912 m!15137))

(declare-fun m!15139 () Bool)

(assert (=> bs!912 m!15139))

(assert (=> bs!912 m!15013))

(declare-fun m!15141 () Bool)

(assert (=> bs!912 m!15141))

(declare-fun m!15143 () Bool)

(assert (=> bs!912 m!15143))

(assert (=> b!21584 d!3727))

(declare-fun d!3729 () Bool)

(declare-datatypes ((Option!65 0))(
  ( (Some!64 (v!1579 V!1155)) (None!63) )
))
(declare-fun get!378 (Option!65) V!1155)

(declare-fun getValueByKey!59 (List!557 (_ BitVec 64)) Option!65)

(assert (=> d!3729 (= (apply!28 lt!6943 #b1000000000000000000000000000000000000000000000000000000000000000) (get!378 (getValueByKey!59 (toList!293 lt!6943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!913 () Bool)

(assert (= bs!913 d!3729))

(declare-fun m!15145 () Bool)

(assert (=> bs!913 m!15145))

(assert (=> bs!913 m!15145))

(declare-fun m!15147 () Bool)

(assert (=> bs!913 m!15147))

(assert (=> b!21668 d!3729))

(declare-fun d!3731 () Bool)

(assert (=> d!3731 (= (validMask!0 lt!6854) (and (or (= lt!6854 #b00000000000000000000000000000111) (= lt!6854 #b00000000000000000000000000001111) (= lt!6854 #b00000000000000000000000000011111) (= lt!6854 #b00000000000000000000000000111111) (= lt!6854 #b00000000000000000000000001111111) (= lt!6854 #b00000000000000000000000011111111) (= lt!6854 #b00000000000000000000000111111111) (= lt!6854 #b00000000000000000000001111111111) (= lt!6854 #b00000000000000000000011111111111) (= lt!6854 #b00000000000000000000111111111111) (= lt!6854 #b00000000000000000001111111111111) (= lt!6854 #b00000000000000000011111111111111) (= lt!6854 #b00000000000000000111111111111111) (= lt!6854 #b00000000000000001111111111111111) (= lt!6854 #b00000000000000011111111111111111) (= lt!6854 #b00000000000000111111111111111111) (= lt!6854 #b00000000000001111111111111111111) (= lt!6854 #b00000000000011111111111111111111) (= lt!6854 #b00000000000111111111111111111111) (= lt!6854 #b00000000001111111111111111111111) (= lt!6854 #b00000000011111111111111111111111) (= lt!6854 #b00000000111111111111111111111111) (= lt!6854 #b00000001111111111111111111111111) (= lt!6854 #b00000011111111111111111111111111) (= lt!6854 #b00000111111111111111111111111111) (= lt!6854 #b00001111111111111111111111111111) (= lt!6854 #b00011111111111111111111111111111) (= lt!6854 #b00111111111111111111111111111111)) (bvsle lt!6854 #b00111111111111111111111111111111)))))

(assert (=> d!3707 d!3731))

(assert (=> d!3707 d!3709))

(declare-fun d!3733 () Bool)

(declare-fun res!13859 () Bool)

(declare-fun e!14092 () Bool)

(assert (=> d!3733 (=> (not res!13859) (not e!14092))))

(assert (=> d!3733 (= res!13859 (simpleValid!19 (_2!453 lt!6855)))))

(assert (=> d!3733 (= (valid!101 (_2!453 lt!6855)) e!14092)))

(declare-fun b!21682 () Bool)

(declare-fun res!13860 () Bool)

(assert (=> b!21682 (=> (not res!13860) (not e!14092))))

(assert (=> b!21682 (= res!13860 (= (arrayCountValidKeys!0 (_keys!3139 (_2!453 lt!6855)) #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6855)))) (_size!133 (_2!453 lt!6855))))))

(declare-fun b!21683 () Bool)

(declare-fun res!13861 () Bool)

(assert (=> b!21683 (=> (not res!13861) (not e!14092))))

(assert (=> b!21683 (= res!13861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (_2!453 lt!6855)) (mask!4691 (_2!453 lt!6855))))))

(declare-fun b!21684 () Bool)

(assert (=> b!21684 (= e!14092 (arrayNoDuplicates!0 (_keys!3139 (_2!453 lt!6855)) #b00000000000000000000000000000000 Nil!557))))

(assert (= (and d!3733 res!13859) b!21682))

(assert (= (and b!21682 res!13860) b!21683))

(assert (= (and b!21683 res!13861) b!21684))

(declare-fun m!15149 () Bool)

(assert (=> d!3733 m!15149))

(declare-fun m!15151 () Bool)

(assert (=> b!21682 m!15151))

(declare-fun m!15153 () Bool)

(assert (=> b!21683 m!15153))

(declare-fun m!15155 () Bool)

(assert (=> b!21684 m!15155))

(assert (=> d!3715 d!3733))

(declare-fun d!3735 () Bool)

(declare-fun res!13862 () Bool)

(declare-fun e!14093 () Bool)

(assert (=> d!3735 (=> (not res!13862) (not e!14093))))

(assert (=> d!3735 (= res!13862 (simpleValid!19 (_2!453 lt!6655)))))

(assert (=> d!3735 (= (valid!101 (_2!453 lt!6655)) e!14093)))

(declare-fun b!21685 () Bool)

(declare-fun res!13863 () Bool)

(assert (=> b!21685 (=> (not res!13863) (not e!14093))))

(assert (=> b!21685 (= res!13863 (= (arrayCountValidKeys!0 (_keys!3139 (_2!453 lt!6655)) #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))) (_size!133 (_2!453 lt!6655))))))

(declare-fun b!21686 () Bool)

(declare-fun res!13864 () Bool)

(assert (=> b!21686 (=> (not res!13864) (not e!14093))))

(assert (=> b!21686 (= res!13864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655))))))

(declare-fun b!21687 () Bool)

(assert (=> b!21687 (= e!14093 (arrayNoDuplicates!0 (_keys!3139 (_2!453 lt!6655)) #b00000000000000000000000000000000 Nil!557))))

(assert (= (and d!3735 res!13862) b!21685))

(assert (= (and b!21685 res!13863) b!21686))

(assert (= (and b!21686 res!13864) b!21687))

(declare-fun m!15157 () Bool)

(assert (=> d!3735 m!15157))

(declare-fun m!15159 () Bool)

(assert (=> b!21685 m!15159))

(declare-fun m!15161 () Bool)

(assert (=> b!21686 m!15161))

(declare-fun m!15163 () Bool)

(assert (=> b!21687 m!15163))

(assert (=> d!3715 d!3735))

(declare-fun d!3737 () Bool)

(assert (=> d!3737 (= (apply!28 lt!6943 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (get!378 (getValueByKey!59 (toList!293 lt!6943) (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))))

(declare-fun bs!914 () Bool)

(assert (= bs!914 d!3737))

(assert (=> bs!914 m!15095))

(declare-fun m!15165 () Bool)

(assert (=> bs!914 m!15165))

(assert (=> bs!914 m!15165))

(declare-fun m!15167 () Bool)

(assert (=> bs!914 m!15167))

(assert (=> b!21653 d!3737))

(declare-fun d!3739 () Bool)

(declare-fun c!2551 () Bool)

(assert (=> d!3739 (= c!2551 ((_ is ValueCellFull!299) (select (arr!572 (_values!1707 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun e!14096 () V!1155)

(assert (=> d!3739 (= (get!377 (select (arr!572 (_values!1707 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!14096)))

(declare-fun b!21692 () Bool)

(declare-fun get!379 (ValueCell!299 V!1155) V!1155)

(assert (=> b!21692 (= e!14096 (get!379 (select (arr!572 (_values!1707 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!21693 () Bool)

(declare-fun get!380 (ValueCell!299 V!1155) V!1155)

(assert (=> b!21693 (= e!14096 (get!380 (select (arr!572 (_values!1707 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3739 c!2551) b!21692))

(assert (= (and d!3739 (not c!2551)) b!21693))

(assert (=> b!21692 m!15115))

(assert (=> b!21692 m!14969))

(declare-fun m!15169 () Bool)

(assert (=> b!21692 m!15169))

(assert (=> b!21693 m!15115))

(assert (=> b!21693 m!14969))

(declare-fun m!15171 () Bool)

(assert (=> b!21693 m!15171))

(assert (=> b!21653 d!3739))

(declare-fun b!21704 () Bool)

(declare-fun e!14108 () Bool)

(declare-fun contains!226 (List!560 (_ BitVec 64)) Bool)

(assert (=> b!21704 (= e!14108 (contains!226 Nil!557 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000)))))

(declare-fun d!3741 () Bool)

(declare-fun res!13873 () Bool)

(declare-fun e!14107 () Bool)

(assert (=> d!3741 (=> res!13873 e!14107)))

(assert (=> d!3741 (= res!13873 (bvsge #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))))))

(assert (=> d!3741 (= (arrayNoDuplicates!0 (_keys!3139 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 Nil!557) e!14107)))

(declare-fun b!21705 () Bool)

(declare-fun e!14105 () Bool)

(declare-fun call!1474 () Bool)

(assert (=> b!21705 (= e!14105 call!1474)))

(declare-fun b!21706 () Bool)

(declare-fun e!14106 () Bool)

(assert (=> b!21706 (= e!14106 e!14105)))

(declare-fun c!2554 () Bool)

(assert (=> b!21706 (= c!2554 (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000)))))

(declare-fun b!21707 () Bool)

(assert (=> b!21707 (= e!14107 e!14106)))

(declare-fun res!13872 () Bool)

(assert (=> b!21707 (=> (not res!13872) (not e!14106))))

(assert (=> b!21707 (= res!13872 (not e!14108))))

(declare-fun res!13871 () Bool)

(assert (=> b!21707 (=> (not res!13871) (not e!14108))))

(assert (=> b!21707 (= res!13871 (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000)))))

(declare-fun bm!1471 () Bool)

(assert (=> bm!1471 (= call!1474 (arrayNoDuplicates!0 (_keys!3139 (v!1570 (_2!452 lt!6654))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2554 (Cons!556 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000) Nil!557) Nil!557)))))

(declare-fun b!21708 () Bool)

(assert (=> b!21708 (= e!14105 call!1474)))

(assert (= (and d!3741 (not res!13873)) b!21707))

(assert (= (and b!21707 res!13871) b!21704))

(assert (= (and b!21707 res!13872) b!21706))

(assert (= (and b!21706 c!2554) b!21705))

(assert (= (and b!21706 (not c!2554)) b!21708))

(assert (= (or b!21705 b!21708) bm!1471))

(declare-fun m!15173 () Bool)

(assert (=> b!21704 m!15173))

(assert (=> b!21704 m!15173))

(declare-fun m!15175 () Bool)

(assert (=> b!21704 m!15175))

(assert (=> b!21706 m!15173))

(assert (=> b!21706 m!15173))

(declare-fun m!15177 () Bool)

(assert (=> b!21706 m!15177))

(assert (=> b!21707 m!15173))

(assert (=> b!21707 m!15173))

(assert (=> b!21707 m!15177))

(assert (=> bm!1471 m!15173))

(declare-fun m!15179 () Bool)

(assert (=> bm!1471 m!15179))

(assert (=> b!21568 d!3741))

(declare-fun d!3743 () Bool)

(assert (=> d!3743 (= (head!827 (toList!293 (map!395 lt!6837))) (h!1119 (toList!293 (map!395 lt!6837))))))

(assert (=> b!21548 d!3743))

(declare-fun d!3745 () Bool)

(assert (=> d!3745 (= (map!395 lt!6837) (getCurrentListMap!124 (_keys!3139 lt!6837) (_values!1707 lt!6837) (mask!4691 lt!6837) (extraKeys!1621 lt!6837) (zeroValue!1645 lt!6837) (minValue!1645 lt!6837) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6837)))))

(declare-fun bs!915 () Bool)

(assert (= bs!915 d!3745))

(declare-fun m!15181 () Bool)

(assert (=> bs!915 m!15181))

(assert (=> b!21548 d!3745))

(declare-fun d!3747 () Bool)

(declare-fun e!14111 () Bool)

(assert (=> d!3747 e!14111))

(declare-fun c!2557 () Bool)

(assert (=> d!3747 (= c!2557 (and (not (= (_1!454 lt!6831) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!454 lt!6831) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!6954 () Unit!459)

(declare-fun choose!195 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!459)

(assert (=> d!3747 (= lt!6954 (choose!195 lt!6835 (array!1208 ((as const (Array (_ BitVec 32) ValueCell!299)) EmptyCell!299) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) lt!6845 (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!454 lt!6831) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))))))

(assert (=> d!3747 (validMask!0 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))))))

(assert (=> d!3747 (= (lemmaKeyInListMapIsInArray!94 lt!6835 (array!1208 ((as const (Array (_ BitVec 32) ValueCell!299)) EmptyCell!299) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) lt!6845 (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!454 lt!6831) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))) lt!6954)))

(declare-fun b!21713 () Bool)

(assert (=> b!21713 (= e!14111 (arrayContainsKey!0 lt!6835 (_1!454 lt!6831) #b00000000000000000000000000000000))))

(declare-fun b!21714 () Bool)

(assert (=> b!21714 (= e!14111 (ite (= (_1!454 lt!6831) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6845 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6845 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!3747 c!2557) b!21713))

(assert (= (and d!3747 (not c!2557)) b!21714))

(assert (=> d!3747 m!14835))

(assert (=> d!3747 m!14969))

(assert (=> d!3747 m!14969))

(declare-fun m!15183 () Bool)

(assert (=> d!3747 m!15183))

(assert (=> d!3747 m!14835))

(assert (=> d!3747 m!14973))

(assert (=> b!21713 m!14981))

(assert (=> b!21548 d!3747))

(declare-fun d!3749 () Bool)

(declare-fun lt!6957 () (_ BitVec 32))

(assert (=> d!3749 (and (or (bvslt lt!6957 #b00000000000000000000000000000000) (bvsge lt!6957 (size!666 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (and (bvsge lt!6957 #b00000000000000000000000000000000) (bvslt lt!6957 (size!666 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))) (bvsge lt!6957 #b00000000000000000000000000000000) (bvslt lt!6957 (size!666 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (= (select (arr!573 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) lt!6957) (_1!454 lt!6831)))))

(declare-fun e!14114 () (_ BitVec 32))

(assert (=> d!3749 (= lt!6957 e!14114)))

(declare-fun c!2560 () Bool)

(assert (=> d!3749 (= c!2560 (= (select (arr!573 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!454 lt!6831)))))

(assert (=> d!3749 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (bvslt (size!666 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!3749 (= (arrayScanForKey!0 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (_1!454 lt!6831) #b00000000000000000000000000000000) lt!6957)))

(declare-fun b!21719 () Bool)

(assert (=> b!21719 (= e!14114 #b00000000000000000000000000000000)))

(declare-fun b!21720 () Bool)

(assert (=> b!21720 (= e!14114 (arrayScanForKey!0 (array!1210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (_1!454 lt!6831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3749 c!2560) b!21719))

(assert (= (and d!3749 (not c!2560)) b!21720))

(declare-fun m!15185 () Bool)

(assert (=> d!3749 m!15185))

(declare-fun m!15187 () Bool)

(assert (=> d!3749 m!15187))

(declare-fun m!15189 () Bool)

(assert (=> b!21720 m!15189))

(assert (=> b!21548 d!3749))

(assert (=> d!3717 d!3709))

(declare-fun d!3751 () Bool)

(assert (=> d!3751 (= (map!395 lt!6656) (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun bs!916 () Bool)

(assert (= bs!916 d!3751))

(assert (=> bs!916 m!14909))

(assert (=> bm!1410 d!3751))

(declare-fun d!3753 () Bool)

(assert (=> d!3753 (= (map!395 (_2!453 lt!6655)) (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun bs!917 () Bool)

(assert (= bs!917 d!3753))

(assert (=> bs!917 m!15013))

(assert (=> bm!1434 d!3753))

(declare-fun d!3755 () Bool)

(assert (=> d!3755 (= (inRange!0 (ite c!2500 (ite c!2506 (index!2329 lt!6755) (ite c!2495 (index!2328 lt!6772) (index!2331 lt!6772))) (ite c!2498 (index!2329 lt!6766) (ite c!2494 (index!2328 lt!6764) (index!2331 lt!6764)))) (mask!4691 lt!6656)) (and (bvsge (ite c!2500 (ite c!2506 (index!2329 lt!6755) (ite c!2495 (index!2328 lt!6772) (index!2331 lt!6772))) (ite c!2498 (index!2329 lt!6766) (ite c!2494 (index!2328 lt!6764) (index!2331 lt!6764)))) #b00000000000000000000000000000000) (bvslt (ite c!2500 (ite c!2506 (index!2329 lt!6755) (ite c!2495 (index!2328 lt!6772) (index!2331 lt!6772))) (ite c!2498 (index!2329 lt!6766) (ite c!2494 (index!2328 lt!6764) (index!2331 lt!6764)))) (bvadd (mask!4691 lt!6656) #b00000000000000000000000000000001))))))

(assert (=> bm!1422 d!3755))

(declare-fun d!3757 () Bool)

(assert (=> d!3757 (= (inRange!0 (ite c!2523 (ite c!2529 (index!2329 lt!6857) (ite c!2518 (index!2328 lt!6874) (index!2331 lt!6874))) (ite c!2521 (index!2329 lt!6868) (ite c!2517 (index!2328 lt!6866) (index!2331 lt!6866)))) (mask!4691 (_2!453 lt!6655))) (and (bvsge (ite c!2523 (ite c!2529 (index!2329 lt!6857) (ite c!2518 (index!2328 lt!6874) (index!2331 lt!6874))) (ite c!2521 (index!2329 lt!6868) (ite c!2517 (index!2328 lt!6866) (index!2331 lt!6866)))) #b00000000000000000000000000000000) (bvslt (ite c!2523 (ite c!2529 (index!2329 lt!6857) (ite c!2518 (index!2328 lt!6874) (index!2331 lt!6874))) (ite c!2521 (index!2329 lt!6868) (ite c!2517 (index!2328 lt!6866) (index!2331 lt!6866)))) (bvadd (mask!4691 (_2!453 lt!6655)) #b00000000000000000000000000000001))))))

(assert (=> bm!1446 d!3757))

(declare-fun d!3759 () Bool)

(declare-fun e!14117 () Bool)

(assert (=> d!3759 e!14117))

(declare-fun res!13876 () Bool)

(assert (=> d!3759 (=> (not res!13876) (not e!14117))))

(assert (=> d!3759 (= res!13876 (and (bvsge (index!2329 lt!6777) #b00000000000000000000000000000000) (bvslt (index!2329 lt!6777) (size!666 (_keys!3139 lt!6656)))))))

(declare-fun lt!6960 () Unit!459)

(declare-fun choose!196 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) Int) Unit!459)

(assert (=> d!3759 (= lt!6960 (choose!196 (_keys!3139 lt!6656) lt!6762 (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (index!2329 lt!6777) (defaultEntry!1718 lt!6656)))))

(assert (=> d!3759 (validMask!0 (mask!4691 lt!6656))))

(assert (=> d!3759 (= (lemmaValidKeyInArrayIsInListMap!7 (_keys!3139 lt!6656) lt!6762 (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (index!2329 lt!6777) (defaultEntry!1718 lt!6656)) lt!6960)))

(declare-fun b!21723 () Bool)

(assert (=> b!21723 (= e!14117 (contains!225 (getCurrentListMap!124 (_keys!3139 lt!6656) lt!6762 (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!6777))))))

(assert (= (and d!3759 res!13876) b!21723))

(declare-fun m!15191 () Bool)

(assert (=> d!3759 m!15191))

(assert (=> d!3759 m!15131))

(declare-fun m!15193 () Bool)

(assert (=> b!21723 m!15193))

(assert (=> b!21723 m!14947))

(assert (=> b!21723 m!15193))

(assert (=> b!21723 m!14947))

(declare-fun m!15195 () Bool)

(assert (=> b!21723 m!15195))

(assert (=> b!21513 d!3759))

(declare-fun d!3761 () Bool)

(declare-fun e!14120 () Bool)

(assert (=> d!3761 e!14120))

(declare-fun res!13879 () Bool)

(assert (=> d!3761 (=> (not res!13879) (not e!14120))))

(assert (=> d!3761 (= res!13879 (and (bvsge (index!2329 lt!6777) #b00000000000000000000000000000000) (bvslt (index!2329 lt!6777) (size!665 (_values!1707 lt!6656)))))))

(declare-fun lt!6963 () Unit!459)

(declare-fun choose!197 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) (_ BitVec 64) V!1155 Int) Unit!459)

(assert (=> d!3761 (= lt!6963 (choose!197 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (index!2329 lt!6777) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (defaultEntry!1718 lt!6656)))))

(assert (=> d!3761 (validMask!0 (mask!4691 lt!6656))))

(assert (=> d!3761 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (index!2329 lt!6777) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (defaultEntry!1718 lt!6656)) lt!6963)))

(declare-fun b!21726 () Bool)

(assert (=> b!21726 (= e!14120 (= (+!42 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (getCurrentListMap!124 (_keys!3139 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656))) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656))))))

(assert (= (and d!3761 res!13879) b!21726))

(declare-fun m!15197 () Bool)

(assert (=> d!3761 m!15197))

(assert (=> d!3761 m!15131))

(assert (=> b!21726 m!14909))

(assert (=> b!21726 m!14909))

(declare-fun m!15199 () Bool)

(assert (=> b!21726 m!15199))

(assert (=> b!21726 m!14905))

(declare-fun m!15201 () Bool)

(assert (=> b!21726 m!15201))

(assert (=> b!21513 d!3761))

(declare-fun d!3763 () Bool)

(declare-fun e!14125 () Bool)

(assert (=> d!3763 e!14125))

(declare-fun res!13882 () Bool)

(assert (=> d!3763 (=> res!13882 e!14125)))

(declare-fun lt!6974 () Bool)

(assert (=> d!3763 (= res!13882 (not lt!6974))))

(declare-fun lt!6973 () Bool)

(assert (=> d!3763 (= lt!6974 lt!6973)))

(declare-fun lt!6972 () Unit!459)

(declare-fun e!14126 () Unit!459)

(assert (=> d!3763 (= lt!6972 e!14126)))

(declare-fun c!2563 () Bool)

(assert (=> d!3763 (= c!2563 lt!6973)))

(declare-fun containsKey!23 (List!557 (_ BitVec 64)) Bool)

(assert (=> d!3763 (= lt!6973 (containsKey!23 (toList!293 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656))) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3763 (= (contains!225 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) lt!6974)))

(declare-fun b!21733 () Bool)

(declare-fun lt!6975 () Unit!459)

(assert (=> b!21733 (= e!14126 lt!6975)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!20 (List!557 (_ BitVec 64)) Unit!459)

(assert (=> b!21733 (= lt!6975 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!293 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656))) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun isDefined!21 (Option!65) Bool)

(assert (=> b!21733 (isDefined!21 (getValueByKey!59 (toList!293 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656))) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!21734 () Bool)

(declare-fun Unit!471 () Unit!459)

(assert (=> b!21734 (= e!14126 Unit!471)))

(declare-fun b!21735 () Bool)

(assert (=> b!21735 (= e!14125 (isDefined!21 (getValueByKey!59 (toList!293 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656))) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!3763 c!2563) b!21733))

(assert (= (and d!3763 (not c!2563)) b!21734))

(assert (= (and d!3763 (not res!13882)) b!21735))

(declare-fun m!15203 () Bool)

(assert (=> d!3763 m!15203))

(declare-fun m!15205 () Bool)

(assert (=> b!21733 m!15205))

(declare-fun m!15207 () Bool)

(assert (=> b!21733 m!15207))

(assert (=> b!21733 m!15207))

(declare-fun m!15209 () Bool)

(assert (=> b!21733 m!15209))

(assert (=> b!21735 m!15207))

(assert (=> b!21735 m!15207))

(assert (=> b!21735 m!15209))

(assert (=> b!21513 d!3763))

(declare-fun bm!1472 () Bool)

(declare-fun call!1479 () ListLongMap!555)

(declare-fun call!1475 () ListLongMap!555)

(assert (=> bm!1472 (= call!1479 call!1475)))

(declare-fun b!21736 () Bool)

(declare-fun e!14127 () Bool)

(declare-fun lt!6993 () ListLongMap!555)

(assert (=> b!21736 (= e!14127 (= (apply!28 lt!6993 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)) (get!377 (select (arr!572 (_values!1707 lt!6656)) #b00000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 lt!6656) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21736 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_values!1707 lt!6656))))))

(assert (=> b!21736 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(declare-fun b!21737 () Bool)

(declare-fun e!14133 () Bool)

(assert (=> b!21737 (= e!14133 (= (apply!28 lt!6993 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 lt!6656)))))

(declare-fun bm!1473 () Bool)

(declare-fun call!1480 () ListLongMap!555)

(assert (=> bm!1473 (= call!1475 call!1480)))

(declare-fun b!21738 () Bool)

(declare-fun e!14131 () Bool)

(assert (=> b!21738 (= e!14131 (validKeyInArray!0 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)))))

(declare-fun b!21739 () Bool)

(declare-fun e!14135 () Unit!459)

(declare-fun lt!6984 () Unit!459)

(assert (=> b!21739 (= e!14135 lt!6984)))

(declare-fun lt!6986 () ListLongMap!555)

(assert (=> b!21739 (= lt!6986 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!6980 () (_ BitVec 64))

(assert (=> b!21739 (= lt!6980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6979 () (_ BitVec 64))

(assert (=> b!21739 (= lt!6979 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(declare-fun lt!6982 () Unit!459)

(assert (=> b!21739 (= lt!6982 (addStillContains!13 lt!6986 lt!6980 (zeroValue!1645 lt!6656) lt!6979))))

(assert (=> b!21739 (contains!225 (+!42 lt!6986 (tuple2!903 lt!6980 (zeroValue!1645 lt!6656))) lt!6979)))

(declare-fun lt!6990 () Unit!459)

(assert (=> b!21739 (= lt!6990 lt!6982)))

(declare-fun lt!6983 () ListLongMap!555)

(assert (=> b!21739 (= lt!6983 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!6977 () (_ BitVec 64))

(assert (=> b!21739 (= lt!6977 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6989 () (_ BitVec 64))

(assert (=> b!21739 (= lt!6989 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(declare-fun lt!6991 () Unit!459)

(assert (=> b!21739 (= lt!6991 (addApplyDifferent!13 lt!6983 lt!6977 (minValue!1645 lt!6656) lt!6989))))

(assert (=> b!21739 (= (apply!28 (+!42 lt!6983 (tuple2!903 lt!6977 (minValue!1645 lt!6656))) lt!6989) (apply!28 lt!6983 lt!6989))))

(declare-fun lt!6997 () Unit!459)

(assert (=> b!21739 (= lt!6997 lt!6991)))

(declare-fun lt!6981 () ListLongMap!555)

(assert (=> b!21739 (= lt!6981 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!6978 () (_ BitVec 64))

(assert (=> b!21739 (= lt!6978 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6976 () (_ BitVec 64))

(assert (=> b!21739 (= lt!6976 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(declare-fun lt!6988 () Unit!459)

(assert (=> b!21739 (= lt!6988 (addApplyDifferent!13 lt!6981 lt!6978 (zeroValue!1645 lt!6656) lt!6976))))

(assert (=> b!21739 (= (apply!28 (+!42 lt!6981 (tuple2!903 lt!6978 (zeroValue!1645 lt!6656))) lt!6976) (apply!28 lt!6981 lt!6976))))

(declare-fun lt!6987 () Unit!459)

(assert (=> b!21739 (= lt!6987 lt!6988)))

(declare-fun lt!6994 () ListLongMap!555)

(assert (=> b!21739 (= lt!6994 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!6992 () (_ BitVec 64))

(assert (=> b!21739 (= lt!6992 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6995 () (_ BitVec 64))

(assert (=> b!21739 (= lt!6995 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(assert (=> b!21739 (= lt!6984 (addApplyDifferent!13 lt!6994 lt!6992 (minValue!1645 lt!6656) lt!6995))))

(assert (=> b!21739 (= (apply!28 (+!42 lt!6994 (tuple2!903 lt!6992 (minValue!1645 lt!6656))) lt!6995) (apply!28 lt!6994 lt!6995))))

(declare-fun bm!1474 () Bool)

(assert (=> bm!1474 (= call!1480 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun b!21741 () Bool)

(declare-fun e!14128 () Bool)

(declare-fun e!14134 () Bool)

(assert (=> b!21741 (= e!14128 e!14134)))

(declare-fun c!2569 () Bool)

(assert (=> b!21741 (= c!2569 (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1475 () Bool)

(declare-fun call!1477 () ListLongMap!555)

(declare-fun call!1478 () ListLongMap!555)

(assert (=> bm!1475 (= call!1477 call!1478)))

(declare-fun b!21742 () Bool)

(declare-fun res!13888 () Bool)

(assert (=> b!21742 (=> (not res!13888) (not e!14128))))

(declare-fun e!14139 () Bool)

(assert (=> b!21742 (= res!13888 e!14139)))

(declare-fun c!2566 () Bool)

(assert (=> b!21742 (= c!2566 (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!1476 () Bool)

(declare-fun call!1476 () Bool)

(assert (=> bm!1476 (= call!1476 (contains!225 lt!6993 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21743 () Bool)

(declare-fun e!14132 () Bool)

(assert (=> b!21743 (= e!14132 (validKeyInArray!0 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)))))

(declare-fun b!21744 () Bool)

(declare-fun res!13885 () Bool)

(assert (=> b!21744 (=> (not res!13885) (not e!14128))))

(declare-fun e!14129 () Bool)

(assert (=> b!21744 (= res!13885 e!14129)))

(declare-fun res!13883 () Bool)

(assert (=> b!21744 (=> res!13883 e!14129)))

(assert (=> b!21744 (= res!13883 (not e!14132))))

(declare-fun res!13889 () Bool)

(assert (=> b!21744 (=> (not res!13889) (not e!14132))))

(assert (=> b!21744 (= res!13889 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(declare-fun b!21745 () Bool)

(declare-fun e!14138 () ListLongMap!555)

(assert (=> b!21745 (= e!14138 call!1477)))

(declare-fun b!21746 () Bool)

(assert (=> b!21746 (= e!14139 (not call!1476))))

(declare-fun b!21747 () Bool)

(declare-fun e!14136 () ListLongMap!555)

(assert (=> b!21747 (= e!14136 call!1477)))

(declare-fun b!21748 () Bool)

(declare-fun e!14137 () ListLongMap!555)

(assert (=> b!21748 (= e!14137 e!14136)))

(declare-fun c!2568 () Bool)

(assert (=> b!21748 (= c!2568 (and (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21749 () Bool)

(declare-fun e!14130 () Bool)

(assert (=> b!21749 (= e!14134 e!14130)))

(declare-fun res!13884 () Bool)

(declare-fun call!1481 () Bool)

(assert (=> b!21749 (= res!13884 call!1481)))

(assert (=> b!21749 (=> (not res!13884) (not e!14130))))

(declare-fun b!21750 () Bool)

(assert (=> b!21750 (= e!14134 (not call!1481))))

(declare-fun b!21751 () Bool)

(assert (=> b!21751 (= e!14130 (= (apply!28 lt!6993 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 lt!6656)))))

(declare-fun bm!1477 () Bool)

(assert (=> bm!1477 (= call!1481 (contains!225 lt!6993 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21740 () Bool)

(assert (=> b!21740 (= e!14129 e!14127)))

(declare-fun res!13890 () Bool)

(assert (=> b!21740 (=> (not res!13890) (not e!14127))))

(assert (=> b!21740 (= res!13890 (contains!225 lt!6993 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)))))

(assert (=> b!21740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(declare-fun d!3765 () Bool)

(assert (=> d!3765 e!14128))

(declare-fun res!13886 () Bool)

(assert (=> d!3765 (=> (not res!13886) (not e!14128))))

(assert (=> d!3765 (= res!13886 (or (bvsge #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))))

(declare-fun lt!6985 () ListLongMap!555)

(assert (=> d!3765 (= lt!6993 lt!6985)))

(declare-fun lt!6996 () Unit!459)

(assert (=> d!3765 (= lt!6996 e!14135)))

(declare-fun c!2565 () Bool)

(assert (=> d!3765 (= c!2565 e!14131)))

(declare-fun res!13891 () Bool)

(assert (=> d!3765 (=> (not res!13891) (not e!14131))))

(assert (=> d!3765 (= res!13891 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(assert (=> d!3765 (= lt!6985 e!14137)))

(declare-fun c!2564 () Bool)

(assert (=> d!3765 (= c!2564 (and (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3765 (validMask!0 (mask!4691 lt!6656))))

(assert (=> d!3765 (= (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) lt!6993)))

(declare-fun b!21752 () Bool)

(assert (=> b!21752 (= e!14139 e!14133)))

(declare-fun res!13887 () Bool)

(assert (=> b!21752 (= res!13887 call!1476)))

(assert (=> b!21752 (=> (not res!13887) (not e!14133))))

(declare-fun b!21753 () Bool)

(assert (=> b!21753 (= e!14138 call!1479)))

(declare-fun b!21754 () Bool)

(declare-fun Unit!472 () Unit!459)

(assert (=> b!21754 (= e!14135 Unit!472)))

(declare-fun bm!1478 () Bool)

(assert (=> bm!1478 (= call!1478 (+!42 (ite c!2564 call!1480 (ite c!2568 call!1475 call!1479)) (ite (or c!2564 c!2568) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 lt!6656)) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 lt!6656)))))))

(declare-fun b!21755 () Bool)

(assert (=> b!21755 (= e!14137 (+!42 call!1478 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 lt!6656))))))

(declare-fun b!21756 () Bool)

(declare-fun c!2567 () Bool)

(assert (=> b!21756 (= c!2567 (and (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21756 (= e!14136 e!14138)))

(assert (= (and d!3765 c!2564) b!21755))

(assert (= (and d!3765 (not c!2564)) b!21748))

(assert (= (and b!21748 c!2568) b!21747))

(assert (= (and b!21748 (not c!2568)) b!21756))

(assert (= (and b!21756 c!2567) b!21745))

(assert (= (and b!21756 (not c!2567)) b!21753))

(assert (= (or b!21745 b!21753) bm!1472))

(assert (= (or b!21747 bm!1472) bm!1473))

(assert (= (or b!21747 b!21745) bm!1475))

(assert (= (or b!21755 bm!1473) bm!1474))

(assert (= (or b!21755 bm!1475) bm!1478))

(assert (= (and d!3765 res!13891) b!21738))

(assert (= (and d!3765 c!2565) b!21739))

(assert (= (and d!3765 (not c!2565)) b!21754))

(assert (= (and d!3765 res!13886) b!21744))

(assert (= (and b!21744 res!13889) b!21743))

(assert (= (and b!21744 (not res!13883)) b!21740))

(assert (= (and b!21740 res!13890) b!21736))

(assert (= (and b!21744 res!13885) b!21742))

(assert (= (and b!21742 c!2566) b!21752))

(assert (= (and b!21742 (not c!2566)) b!21746))

(assert (= (and b!21752 res!13887) b!21737))

(assert (= (or b!21752 b!21746) bm!1476))

(assert (= (and b!21742 res!13888) b!21741))

(assert (= (and b!21741 c!2569) b!21749))

(assert (= (and b!21741 (not c!2569)) b!21750))

(assert (= (and b!21749 res!13884) b!21751))

(assert (= (or b!21749 b!21750) bm!1477))

(declare-fun b_lambda!1521 () Bool)

(assert (=> (not b_lambda!1521) (not b!21736)))

(declare-fun tb!641 () Bool)

(declare-fun t!3214 () Bool)

(assert (=> (and b!21293 (= (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 lt!6656)) t!3214) tb!641))

(declare-fun result!1069 () Bool)

(assert (=> tb!641 (= result!1069 tp_is_empty!997)))

(assert (=> b!21736 t!3214))

(declare-fun b_and!1427 () Bool)

(assert (= b_and!1425 (and (=> t!3214 result!1069) b_and!1427)))

(declare-fun m!15211 () Bool)

(assert (=> b!21751 m!15211))

(declare-fun m!15213 () Bool)

(assert (=> b!21739 m!15213))

(declare-fun m!15215 () Bool)

(assert (=> b!21739 m!15215))

(declare-fun m!15217 () Bool)

(assert (=> b!21739 m!15217))

(declare-fun m!15219 () Bool)

(assert (=> b!21739 m!15219))

(declare-fun m!15221 () Bool)

(assert (=> b!21739 m!15221))

(declare-fun m!15223 () Bool)

(assert (=> b!21739 m!15223))

(declare-fun m!15225 () Bool)

(assert (=> b!21739 m!15225))

(declare-fun m!15227 () Bool)

(assert (=> b!21739 m!15227))

(declare-fun m!15229 () Bool)

(assert (=> b!21739 m!15229))

(assert (=> b!21739 m!15227))

(declare-fun m!15231 () Bool)

(assert (=> b!21739 m!15231))

(declare-fun m!15233 () Bool)

(assert (=> b!21739 m!15233))

(declare-fun m!15235 () Bool)

(assert (=> b!21739 m!15235))

(assert (=> b!21739 m!15223))

(assert (=> b!21739 m!15219))

(declare-fun m!15237 () Bool)

(assert (=> b!21739 m!15237))

(declare-fun m!15239 () Bool)

(assert (=> b!21739 m!15239))

(assert (=> b!21739 m!15237))

(declare-fun m!15241 () Bool)

(assert (=> b!21739 m!15241))

(declare-fun m!15243 () Bool)

(assert (=> b!21739 m!15243))

(declare-fun m!15245 () Bool)

(assert (=> b!21739 m!15245))

(assert (=> bm!1474 m!15217))

(declare-fun m!15247 () Bool)

(assert (=> bm!1477 m!15247))

(declare-fun m!15249 () Bool)

(assert (=> b!21755 m!15249))

(assert (=> b!21743 m!15241))

(assert (=> b!21743 m!15241))

(declare-fun m!15251 () Bool)

(assert (=> b!21743 m!15251))

(assert (=> b!21738 m!15241))

(assert (=> b!21738 m!15241))

(assert (=> b!21738 m!15251))

(assert (=> d!3765 m!15131))

(assert (=> b!21740 m!15241))

(assert (=> b!21740 m!15241))

(declare-fun m!15253 () Bool)

(assert (=> b!21740 m!15253))

(declare-fun m!15255 () Bool)

(assert (=> bm!1478 m!15255))

(declare-fun m!15257 () Bool)

(assert (=> bm!1476 m!15257))

(declare-fun m!15259 () Bool)

(assert (=> b!21737 m!15259))

(declare-fun m!15261 () Bool)

(assert (=> b!21736 m!15261))

(assert (=> b!21736 m!15261))

(declare-fun m!15263 () Bool)

(assert (=> b!21736 m!15263))

(declare-fun m!15265 () Bool)

(assert (=> b!21736 m!15265))

(assert (=> b!21736 m!15263))

(assert (=> b!21736 m!15241))

(declare-fun m!15267 () Bool)

(assert (=> b!21736 m!15267))

(assert (=> b!21736 m!15241))

(assert (=> b!21513 d!3765))

(declare-fun d!3767 () Bool)

(declare-fun e!14140 () Bool)

(assert (=> d!3767 e!14140))

(declare-fun res!13892 () Bool)

(assert (=> d!3767 (=> (not res!13892) (not e!14140))))

(assert (=> d!3767 (= res!13892 (and (bvsge (index!2329 lt!6879) #b00000000000000000000000000000000) (bvslt (index!2329 lt!6879) (size!666 (_keys!3139 (_2!453 lt!6655))))))))

(declare-fun lt!6998 () Unit!459)

(assert (=> d!3767 (= lt!6998 (choose!196 (_keys!3139 (_2!453 lt!6655)) lt!6864 (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (index!2329 lt!6879) (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> d!3767 (validMask!0 (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3767 (= (lemmaValidKeyInArrayIsInListMap!7 (_keys!3139 (_2!453 lt!6655)) lt!6864 (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (index!2329 lt!6879) (defaultEntry!1718 (_2!453 lt!6655))) lt!6998)))

(declare-fun b!21757 () Bool)

(assert (=> b!21757 (= e!14140 (contains!225 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) lt!6864 (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!6879))))))

(assert (= (and d!3767 res!13892) b!21757))

(declare-fun m!15269 () Bool)

(assert (=> d!3767 m!15269))

(assert (=> d!3767 m!15143))

(declare-fun m!15271 () Bool)

(assert (=> b!21757 m!15271))

(assert (=> b!21757 m!15051))

(assert (=> b!21757 m!15271))

(assert (=> b!21757 m!15051))

(declare-fun m!15273 () Bool)

(assert (=> b!21757 m!15273))

(assert (=> b!21593 d!3767))

(declare-fun d!3769 () Bool)

(declare-fun e!14141 () Bool)

(assert (=> d!3769 e!14141))

(declare-fun res!13893 () Bool)

(assert (=> d!3769 (=> (not res!13893) (not e!14141))))

(assert (=> d!3769 (= res!13893 (and (bvsge (index!2329 lt!6879) #b00000000000000000000000000000000) (bvslt (index!2329 lt!6879) (size!665 (_values!1707 (_2!453 lt!6655))))))))

(declare-fun lt!6999 () Unit!459)

(assert (=> d!3769 (= lt!6999 (choose!197 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (index!2329 lt!6879) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> d!3769 (validMask!0 (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3769 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (index!2329 lt!6879) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 (_2!453 lt!6655))) lt!6999)))

(declare-fun b!21758 () Bool)

(assert (=> b!21758 (= e!14141 (= (+!42 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655)))) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655)))))))

(assert (= (and d!3769 res!13893) b!21758))

(declare-fun m!15275 () Bool)

(assert (=> d!3769 m!15275))

(assert (=> d!3769 m!15143))

(assert (=> b!21758 m!15013))

(assert (=> b!21758 m!15013))

(assert (=> b!21758 m!15137))

(assert (=> b!21758 m!15009))

(declare-fun m!15277 () Bool)

(assert (=> b!21758 m!15277))

(assert (=> b!21593 d!3769))

(declare-fun d!3771 () Bool)

(declare-fun e!14142 () Bool)

(assert (=> d!3771 e!14142))

(declare-fun res!13894 () Bool)

(assert (=> d!3771 (=> res!13894 e!14142)))

(declare-fun lt!7002 () Bool)

(assert (=> d!3771 (= res!13894 (not lt!7002))))

(declare-fun lt!7001 () Bool)

(assert (=> d!3771 (= lt!7002 lt!7001)))

(declare-fun lt!7000 () Unit!459)

(declare-fun e!14143 () Unit!459)

(assert (=> d!3771 (= lt!7000 e!14143)))

(declare-fun c!2570 () Bool)

(assert (=> d!3771 (= c!2570 lt!7001)))

(assert (=> d!3771 (= lt!7001 (containsKey!23 (toList!293 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655)))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3771 (= (contains!225 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) #b1000000000000000000000000000000000000000000000000000000000000000) lt!7002)))

(declare-fun b!21759 () Bool)

(declare-fun lt!7003 () Unit!459)

(assert (=> b!21759 (= e!14143 lt!7003)))

(assert (=> b!21759 (= lt!7003 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!293 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655)))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21759 (isDefined!21 (getValueByKey!59 (toList!293 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655)))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21760 () Bool)

(declare-fun Unit!473 () Unit!459)

(assert (=> b!21760 (= e!14143 Unit!473)))

(declare-fun b!21761 () Bool)

(assert (=> b!21761 (= e!14142 (isDefined!21 (getValueByKey!59 (toList!293 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3771 c!2570) b!21759))

(assert (= (and d!3771 (not c!2570)) b!21760))

(assert (= (and d!3771 (not res!13894)) b!21761))

(declare-fun m!15279 () Bool)

(assert (=> d!3771 m!15279))

(declare-fun m!15281 () Bool)

(assert (=> b!21759 m!15281))

(declare-fun m!15283 () Bool)

(assert (=> b!21759 m!15283))

(assert (=> b!21759 m!15283))

(declare-fun m!15285 () Bool)

(assert (=> b!21759 m!15285))

(assert (=> b!21761 m!15283))

(assert (=> b!21761 m!15283))

(assert (=> b!21761 m!15285))

(assert (=> b!21593 d!3771))

(declare-fun bm!1479 () Bool)

(declare-fun call!1486 () ListLongMap!555)

(declare-fun call!1482 () ListLongMap!555)

(assert (=> bm!1479 (= call!1486 call!1482)))

(declare-fun b!21762 () Bool)

(declare-fun e!14144 () Bool)

(declare-fun lt!7021 () ListLongMap!555)

(assert (=> b!21762 (= e!14144 (= (apply!28 lt!7021 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)) (get!377 (select (arr!572 (_values!1707 (_2!453 lt!6655))) #b00000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 (_2!453 lt!6655)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21762 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_values!1707 (_2!453 lt!6655)))))))

(assert (=> b!21762 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun b!21763 () Bool)

(declare-fun e!14150 () Bool)

(assert (=> b!21763 (= e!14150 (= (apply!28 lt!7021 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 (_2!453 lt!6655))))))

(declare-fun bm!1480 () Bool)

(declare-fun call!1487 () ListLongMap!555)

(assert (=> bm!1480 (= call!1482 call!1487)))

(declare-fun b!21764 () Bool)

(declare-fun e!14148 () Bool)

(assert (=> b!21764 (= e!14148 (validKeyInArray!0 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun b!21765 () Bool)

(declare-fun e!14152 () Unit!459)

(declare-fun lt!7012 () Unit!459)

(assert (=> b!21765 (= e!14152 lt!7012)))

(declare-fun lt!7014 () ListLongMap!555)

(assert (=> b!21765 (= lt!7014 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7008 () (_ BitVec 64))

(assert (=> b!21765 (= lt!7008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7007 () (_ BitVec 64))

(assert (=> b!21765 (= lt!7007 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7010 () Unit!459)

(assert (=> b!21765 (= lt!7010 (addStillContains!13 lt!7014 lt!7008 (zeroValue!1645 (_2!453 lt!6655)) lt!7007))))

(assert (=> b!21765 (contains!225 (+!42 lt!7014 (tuple2!903 lt!7008 (zeroValue!1645 (_2!453 lt!6655)))) lt!7007)))

(declare-fun lt!7018 () Unit!459)

(assert (=> b!21765 (= lt!7018 lt!7010)))

(declare-fun lt!7011 () ListLongMap!555)

(assert (=> b!21765 (= lt!7011 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7005 () (_ BitVec 64))

(assert (=> b!21765 (= lt!7005 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7017 () (_ BitVec 64))

(assert (=> b!21765 (= lt!7017 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7019 () Unit!459)

(assert (=> b!21765 (= lt!7019 (addApplyDifferent!13 lt!7011 lt!7005 (minValue!1645 (_2!453 lt!6655)) lt!7017))))

(assert (=> b!21765 (= (apply!28 (+!42 lt!7011 (tuple2!903 lt!7005 (minValue!1645 (_2!453 lt!6655)))) lt!7017) (apply!28 lt!7011 lt!7017))))

(declare-fun lt!7025 () Unit!459)

(assert (=> b!21765 (= lt!7025 lt!7019)))

(declare-fun lt!7009 () ListLongMap!555)

(assert (=> b!21765 (= lt!7009 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7006 () (_ BitVec 64))

(assert (=> b!21765 (= lt!7006 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7004 () (_ BitVec 64))

(assert (=> b!21765 (= lt!7004 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7016 () Unit!459)

(assert (=> b!21765 (= lt!7016 (addApplyDifferent!13 lt!7009 lt!7006 (zeroValue!1645 (_2!453 lt!6655)) lt!7004))))

(assert (=> b!21765 (= (apply!28 (+!42 lt!7009 (tuple2!903 lt!7006 (zeroValue!1645 (_2!453 lt!6655)))) lt!7004) (apply!28 lt!7009 lt!7004))))

(declare-fun lt!7015 () Unit!459)

(assert (=> b!21765 (= lt!7015 lt!7016)))

(declare-fun lt!7022 () ListLongMap!555)

(assert (=> b!21765 (= lt!7022 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7020 () (_ BitVec 64))

(assert (=> b!21765 (= lt!7020 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7023 () (_ BitVec 64))

(assert (=> b!21765 (= lt!7023 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(assert (=> b!21765 (= lt!7012 (addApplyDifferent!13 lt!7022 lt!7020 (minValue!1645 (_2!453 lt!6655)) lt!7023))))

(assert (=> b!21765 (= (apply!28 (+!42 lt!7022 (tuple2!903 lt!7020 (minValue!1645 (_2!453 lt!6655)))) lt!7023) (apply!28 lt!7022 lt!7023))))

(declare-fun bm!1481 () Bool)

(assert (=> bm!1481 (= call!1487 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun b!21767 () Bool)

(declare-fun e!14145 () Bool)

(declare-fun e!14151 () Bool)

(assert (=> b!21767 (= e!14145 e!14151)))

(declare-fun c!2576 () Bool)

(assert (=> b!21767 (= c!2576 (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1482 () Bool)

(declare-fun call!1484 () ListLongMap!555)

(declare-fun call!1485 () ListLongMap!555)

(assert (=> bm!1482 (= call!1484 call!1485)))

(declare-fun b!21768 () Bool)

(declare-fun res!13900 () Bool)

(assert (=> b!21768 (=> (not res!13900) (not e!14145))))

(declare-fun e!14156 () Bool)

(assert (=> b!21768 (= res!13900 e!14156)))

(declare-fun c!2573 () Bool)

(assert (=> b!21768 (= c!2573 (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!1483 () Bool)

(declare-fun call!1483 () Bool)

(assert (=> bm!1483 (= call!1483 (contains!225 lt!7021 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21769 () Bool)

(declare-fun e!14149 () Bool)

(assert (=> b!21769 (= e!14149 (validKeyInArray!0 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun b!21770 () Bool)

(declare-fun res!13897 () Bool)

(assert (=> b!21770 (=> (not res!13897) (not e!14145))))

(declare-fun e!14146 () Bool)

(assert (=> b!21770 (= res!13897 e!14146)))

(declare-fun res!13895 () Bool)

(assert (=> b!21770 (=> res!13895 e!14146)))

(assert (=> b!21770 (= res!13895 (not e!14149))))

(declare-fun res!13901 () Bool)

(assert (=> b!21770 (=> (not res!13901) (not e!14149))))

(assert (=> b!21770 (= res!13901 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun b!21771 () Bool)

(declare-fun e!14155 () ListLongMap!555)

(assert (=> b!21771 (= e!14155 call!1484)))

(declare-fun b!21772 () Bool)

(assert (=> b!21772 (= e!14156 (not call!1483))))

(declare-fun b!21773 () Bool)

(declare-fun e!14153 () ListLongMap!555)

(assert (=> b!21773 (= e!14153 call!1484)))

(declare-fun b!21774 () Bool)

(declare-fun e!14154 () ListLongMap!555)

(assert (=> b!21774 (= e!14154 e!14153)))

(declare-fun c!2575 () Bool)

(assert (=> b!21774 (= c!2575 (and (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21775 () Bool)

(declare-fun e!14147 () Bool)

(assert (=> b!21775 (= e!14151 e!14147)))

(declare-fun res!13896 () Bool)

(declare-fun call!1488 () Bool)

(assert (=> b!21775 (= res!13896 call!1488)))

(assert (=> b!21775 (=> (not res!13896) (not e!14147))))

(declare-fun b!21776 () Bool)

(assert (=> b!21776 (= e!14151 (not call!1488))))

(declare-fun b!21777 () Bool)

(assert (=> b!21777 (= e!14147 (= (apply!28 lt!7021 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 (_2!453 lt!6655))))))

(declare-fun bm!1484 () Bool)

(assert (=> bm!1484 (= call!1488 (contains!225 lt!7021 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21766 () Bool)

(assert (=> b!21766 (= e!14146 e!14144)))

(declare-fun res!13902 () Bool)

(assert (=> b!21766 (=> (not res!13902) (not e!14144))))

(assert (=> b!21766 (= res!13902 (contains!225 lt!7021 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)))))

(assert (=> b!21766 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun d!3773 () Bool)

(assert (=> d!3773 e!14145))

(declare-fun res!13898 () Bool)

(assert (=> d!3773 (=> (not res!13898) (not e!14145))))

(assert (=> d!3773 (= res!13898 (or (bvsge #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))))

(declare-fun lt!7013 () ListLongMap!555)

(assert (=> d!3773 (= lt!7021 lt!7013)))

(declare-fun lt!7024 () Unit!459)

(assert (=> d!3773 (= lt!7024 e!14152)))

(declare-fun c!2572 () Bool)

(assert (=> d!3773 (= c!2572 e!14148)))

(declare-fun res!13903 () Bool)

(assert (=> d!3773 (=> (not res!13903) (not e!14148))))

(assert (=> d!3773 (= res!13903 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(assert (=> d!3773 (= lt!7013 e!14154)))

(declare-fun c!2571 () Bool)

(assert (=> d!3773 (= c!2571 (and (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3773 (validMask!0 (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3773 (= (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) lt!7021)))

(declare-fun b!21778 () Bool)

(assert (=> b!21778 (= e!14156 e!14150)))

(declare-fun res!13899 () Bool)

(assert (=> b!21778 (= res!13899 call!1483)))

(assert (=> b!21778 (=> (not res!13899) (not e!14150))))

(declare-fun b!21779 () Bool)

(assert (=> b!21779 (= e!14155 call!1486)))

(declare-fun b!21780 () Bool)

(declare-fun Unit!474 () Unit!459)

(assert (=> b!21780 (= e!14152 Unit!474)))

(declare-fun bm!1485 () Bool)

(assert (=> bm!1485 (= call!1485 (+!42 (ite c!2571 call!1487 (ite c!2575 call!1482 call!1486)) (ite (or c!2571 c!2575) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (_2!453 lt!6655))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (_2!453 lt!6655))))))))

(declare-fun b!21781 () Bool)

(assert (=> b!21781 (= e!14154 (+!42 call!1485 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (_2!453 lt!6655)))))))

(declare-fun b!21782 () Bool)

(declare-fun c!2574 () Bool)

(assert (=> b!21782 (= c!2574 (and (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21782 (= e!14153 e!14155)))

(assert (= (and d!3773 c!2571) b!21781))

(assert (= (and d!3773 (not c!2571)) b!21774))

(assert (= (and b!21774 c!2575) b!21773))

(assert (= (and b!21774 (not c!2575)) b!21782))

(assert (= (and b!21782 c!2574) b!21771))

(assert (= (and b!21782 (not c!2574)) b!21779))

(assert (= (or b!21771 b!21779) bm!1479))

(assert (= (or b!21773 bm!1479) bm!1480))

(assert (= (or b!21773 b!21771) bm!1482))

(assert (= (or b!21781 bm!1480) bm!1481))

(assert (= (or b!21781 bm!1482) bm!1485))

(assert (= (and d!3773 res!13903) b!21764))

(assert (= (and d!3773 c!2572) b!21765))

(assert (= (and d!3773 (not c!2572)) b!21780))

(assert (= (and d!3773 res!13898) b!21770))

(assert (= (and b!21770 res!13901) b!21769))

(assert (= (and b!21770 (not res!13895)) b!21766))

(assert (= (and b!21766 res!13902) b!21762))

(assert (= (and b!21770 res!13897) b!21768))

(assert (= (and b!21768 c!2573) b!21778))

(assert (= (and b!21768 (not c!2573)) b!21772))

(assert (= (and b!21778 res!13899) b!21763))

(assert (= (or b!21778 b!21772) bm!1483))

(assert (= (and b!21768 res!13900) b!21767))

(assert (= (and b!21767 c!2576) b!21775))

(assert (= (and b!21767 (not c!2576)) b!21776))

(assert (= (and b!21775 res!13896) b!21777))

(assert (= (or b!21775 b!21776) bm!1484))

(declare-fun b_lambda!1523 () Bool)

(assert (=> (not b_lambda!1523) (not b!21762)))

(declare-fun t!3216 () Bool)

(declare-fun tb!643 () Bool)

(assert (=> (and b!21293 (= (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 (_2!453 lt!6655))) t!3216) tb!643))

(declare-fun result!1071 () Bool)

(assert (=> tb!643 (= result!1071 tp_is_empty!997)))

(assert (=> b!21762 t!3216))

(declare-fun b_and!1429 () Bool)

(assert (= b_and!1427 (and (=> t!3216 result!1071) b_and!1429)))

(declare-fun m!15287 () Bool)

(assert (=> b!21777 m!15287))

(declare-fun m!15289 () Bool)

(assert (=> b!21765 m!15289))

(declare-fun m!15291 () Bool)

(assert (=> b!21765 m!15291))

(declare-fun m!15293 () Bool)

(assert (=> b!21765 m!15293))

(declare-fun m!15295 () Bool)

(assert (=> b!21765 m!15295))

(declare-fun m!15297 () Bool)

(assert (=> b!21765 m!15297))

(declare-fun m!15299 () Bool)

(assert (=> b!21765 m!15299))

(declare-fun m!15301 () Bool)

(assert (=> b!21765 m!15301))

(declare-fun m!15303 () Bool)

(assert (=> b!21765 m!15303))

(declare-fun m!15305 () Bool)

(assert (=> b!21765 m!15305))

(assert (=> b!21765 m!15303))

(declare-fun m!15307 () Bool)

(assert (=> b!21765 m!15307))

(declare-fun m!15309 () Bool)

(assert (=> b!21765 m!15309))

(declare-fun m!15311 () Bool)

(assert (=> b!21765 m!15311))

(assert (=> b!21765 m!15299))

(assert (=> b!21765 m!15295))

(declare-fun m!15313 () Bool)

(assert (=> b!21765 m!15313))

(declare-fun m!15315 () Bool)

(assert (=> b!21765 m!15315))

(assert (=> b!21765 m!15313))

(declare-fun m!15317 () Bool)

(assert (=> b!21765 m!15317))

(declare-fun m!15319 () Bool)

(assert (=> b!21765 m!15319))

(declare-fun m!15321 () Bool)

(assert (=> b!21765 m!15321))

(assert (=> bm!1481 m!15293))

(declare-fun m!15323 () Bool)

(assert (=> bm!1484 m!15323))

(declare-fun m!15325 () Bool)

(assert (=> b!21781 m!15325))

(assert (=> b!21769 m!15317))

(assert (=> b!21769 m!15317))

(declare-fun m!15327 () Bool)

(assert (=> b!21769 m!15327))

(assert (=> b!21764 m!15317))

(assert (=> b!21764 m!15317))

(assert (=> b!21764 m!15327))

(assert (=> d!3773 m!15143))

(assert (=> b!21766 m!15317))

(assert (=> b!21766 m!15317))

(declare-fun m!15329 () Bool)

(assert (=> b!21766 m!15329))

(declare-fun m!15331 () Bool)

(assert (=> bm!1485 m!15331))

(declare-fun m!15333 () Bool)

(assert (=> bm!1483 m!15333))

(declare-fun m!15335 () Bool)

(assert (=> b!21763 m!15335))

(declare-fun m!15337 () Bool)

(assert (=> b!21762 m!15337))

(assert (=> b!21762 m!15337))

(declare-fun m!15339 () Bool)

(assert (=> b!21762 m!15339))

(declare-fun m!15341 () Bool)

(assert (=> b!21762 m!15341))

(assert (=> b!21762 m!15339))

(assert (=> b!21762 m!15317))

(declare-fun m!15343 () Bool)

(assert (=> b!21762 m!15343))

(assert (=> b!21762 m!15317))

(assert (=> b!21593 d!3773))

(declare-fun d!3775 () Bool)

(declare-fun lt!7028 () (_ BitVec 32))

(assert (=> d!3775 (and (bvsge lt!7028 #b00000000000000000000000000000000) (bvsle lt!7028 (bvsub (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000)))))

(declare-fun e!14162 () (_ BitVec 32))

(assert (=> d!3775 (= lt!7028 e!14162)))

(declare-fun c!2581 () Bool)

(assert (=> d!3775 (= c!2581 (bvsge #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))))))

(assert (=> d!3775 (and (bvsle #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654)))) (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))))))

(assert (=> d!3775 (= (arrayCountValidKeys!0 (_keys!3139 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))) lt!7028)))

(declare-fun b!21791 () Bool)

(assert (=> b!21791 (= e!14162 #b00000000000000000000000000000000)))

(declare-fun bm!1488 () Bool)

(declare-fun call!1491 () (_ BitVec 32))

(assert (=> bm!1488 (= call!1491 (arrayCountValidKeys!0 (_keys!3139 (v!1570 (_2!452 lt!6654))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))))))

(declare-fun b!21792 () Bool)

(declare-fun e!14161 () (_ BitVec 32))

(assert (=> b!21792 (= e!14161 (bvadd #b00000000000000000000000000000001 call!1491))))

(declare-fun b!21793 () Bool)

(assert (=> b!21793 (= e!14161 call!1491)))

(declare-fun b!21794 () Bool)

(assert (=> b!21794 (= e!14162 e!14161)))

(declare-fun c!2582 () Bool)

(assert (=> b!21794 (= c!2582 (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000)))))

(assert (= (and d!3775 c!2581) b!21791))

(assert (= (and d!3775 (not c!2581)) b!21794))

(assert (= (and b!21794 c!2582) b!21792))

(assert (= (and b!21794 (not c!2582)) b!21793))

(assert (= (or b!21792 b!21793) bm!1488))

(declare-fun m!15345 () Bool)

(assert (=> bm!1488 m!15345))

(assert (=> b!21794 m!15173))

(assert (=> b!21794 m!15173))

(assert (=> b!21794 m!15177))

(assert (=> b!21566 d!3775))

(declare-fun d!3777 () Bool)

(assert (=> d!3777 (= (map!395 lt!6843) (getCurrentListMap!124 (_keys!3139 lt!6843) (_values!1707 lt!6843) (mask!4691 lt!6843) (extraKeys!1621 lt!6843) (zeroValue!1645 lt!6843) (minValue!1645 lt!6843) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6843)))))

(declare-fun bs!918 () Bool)

(assert (= bs!918 d!3777))

(declare-fun m!15347 () Bool)

(assert (=> bs!918 m!15347))

(assert (=> b!21546 d!3777))

(declare-fun d!3779 () Bool)

(assert (=> d!3779 (= (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (and (not (= (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21660 d!3779))

(declare-fun d!3781 () Bool)

(declare-fun res!13904 () Bool)

(declare-fun e!14163 () Bool)

(assert (=> d!3781 (=> (not res!13904) (not e!14163))))

(assert (=> d!3781 (= res!13904 (simpleValid!19 (_2!453 lt!6753)))))

(assert (=> d!3781 (= (valid!101 (_2!453 lt!6753)) e!14163)))

(declare-fun b!21795 () Bool)

(declare-fun res!13905 () Bool)

(assert (=> b!21795 (=> (not res!13905) (not e!14163))))

(assert (=> b!21795 (= res!13905 (= (arrayCountValidKeys!0 (_keys!3139 (_2!453 lt!6753)) #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6753)))) (_size!133 (_2!453 lt!6753))))))

(declare-fun b!21796 () Bool)

(declare-fun res!13906 () Bool)

(assert (=> b!21796 (=> (not res!13906) (not e!14163))))

(assert (=> b!21796 (= res!13906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (_2!453 lt!6753)) (mask!4691 (_2!453 lt!6753))))))

(declare-fun b!21797 () Bool)

(assert (=> b!21797 (= e!14163 (arrayNoDuplicates!0 (_keys!3139 (_2!453 lt!6753)) #b00000000000000000000000000000000 Nil!557))))

(assert (= (and d!3781 res!13904) b!21795))

(assert (= (and b!21795 res!13905) b!21796))

(assert (= (and b!21796 res!13906) b!21797))

(declare-fun m!15349 () Bool)

(assert (=> d!3781 m!15349))

(declare-fun m!15351 () Bool)

(assert (=> b!21795 m!15351))

(declare-fun m!15353 () Bool)

(assert (=> b!21796 m!15353))

(declare-fun m!15355 () Bool)

(assert (=> b!21797 m!15355))

(assert (=> d!3699 d!3781))

(declare-fun d!3783 () Bool)

(declare-fun res!13907 () Bool)

(declare-fun e!14164 () Bool)

(assert (=> d!3783 (=> (not res!13907) (not e!14164))))

(assert (=> d!3783 (= res!13907 (simpleValid!19 lt!6656))))

(assert (=> d!3783 (= (valid!101 lt!6656) e!14164)))

(declare-fun b!21798 () Bool)

(declare-fun res!13908 () Bool)

(assert (=> b!21798 (=> (not res!13908) (not e!14164))))

(assert (=> b!21798 (= res!13908 (= (arrayCountValidKeys!0 (_keys!3139 lt!6656) #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))) (_size!133 lt!6656)))))

(declare-fun b!21799 () Bool)

(declare-fun res!13909 () Bool)

(assert (=> b!21799 (=> (not res!13909) (not e!14164))))

(assert (=> b!21799 (= res!13909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 lt!6656) (mask!4691 lt!6656)))))

(declare-fun b!21800 () Bool)

(assert (=> b!21800 (= e!14164 (arrayNoDuplicates!0 (_keys!3139 lt!6656) #b00000000000000000000000000000000 Nil!557))))

(assert (= (and d!3783 res!13907) b!21798))

(assert (= (and b!21798 res!13908) b!21799))

(assert (= (and b!21799 res!13909) b!21800))

(declare-fun m!15357 () Bool)

(assert (=> d!3783 m!15357))

(declare-fun m!15359 () Bool)

(assert (=> b!21798 m!15359))

(declare-fun m!15361 () Bool)

(assert (=> b!21799 m!15361))

(declare-fun m!15363 () Bool)

(assert (=> b!21800 m!15363))

(assert (=> d!3699 d!3783))

(declare-fun d!3785 () Bool)

(declare-fun e!14165 () Bool)

(assert (=> d!3785 e!14165))

(declare-fun res!13910 () Bool)

(assert (=> d!3785 (=> res!13910 e!14165)))

(declare-fun lt!7031 () Bool)

(assert (=> d!3785 (= res!13910 (not lt!7031))))

(declare-fun lt!7030 () Bool)

(assert (=> d!3785 (= lt!7031 lt!7030)))

(declare-fun lt!7029 () Unit!459)

(declare-fun e!14166 () Unit!459)

(assert (=> d!3785 (= lt!7029 e!14166)))

(declare-fun c!2583 () Bool)

(assert (=> d!3785 (= c!2583 lt!7030)))

(assert (=> d!3785 (= lt!7030 (containsKey!23 (toList!293 e!14004) (ite c!2500 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!6777)))))))

(assert (=> d!3785 (= (contains!225 e!14004 (ite c!2500 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!6777)))) lt!7031)))

(declare-fun b!21801 () Bool)

(declare-fun lt!7032 () Unit!459)

(assert (=> b!21801 (= e!14166 lt!7032)))

(assert (=> b!21801 (= lt!7032 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!293 e!14004) (ite c!2500 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!6777)))))))

(assert (=> b!21801 (isDefined!21 (getValueByKey!59 (toList!293 e!14004) (ite c!2500 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!6777)))))))

(declare-fun b!21802 () Bool)

(declare-fun Unit!475 () Unit!459)

(assert (=> b!21802 (= e!14166 Unit!475)))

(declare-fun b!21803 () Bool)

(assert (=> b!21803 (= e!14165 (isDefined!21 (getValueByKey!59 (toList!293 e!14004) (ite c!2500 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!6777))))))))

(assert (= (and d!3785 c!2583) b!21801))

(assert (= (and d!3785 (not c!2583)) b!21802))

(assert (= (and d!3785 (not res!13910)) b!21803))

(declare-fun m!15365 () Bool)

(assert (=> d!3785 m!15365))

(declare-fun m!15367 () Bool)

(assert (=> b!21801 m!15367))

(declare-fun m!15369 () Bool)

(assert (=> b!21801 m!15369))

(assert (=> b!21801 m!15369))

(declare-fun m!15371 () Bool)

(assert (=> b!21801 m!15371))

(assert (=> b!21803 m!15369))

(assert (=> b!21803 m!15369))

(assert (=> b!21803 m!15371))

(assert (=> bm!1402 d!3785))

(declare-fun b!21816 () Bool)

(declare-fun e!14174 () SeekEntryResult!52)

(declare-fun lt!7039 () SeekEntryResult!52)

(assert (=> b!21816 (= e!14174 (MissingZero!52 (index!2330 lt!7039)))))

(declare-fun b!21817 () Bool)

(declare-fun c!2590 () Bool)

(declare-fun lt!7041 () (_ BitVec 64))

(assert (=> b!21817 (= c!2590 (= lt!7041 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14175 () SeekEntryResult!52)

(assert (=> b!21817 (= e!14175 e!14174)))

(declare-fun b!21818 () Bool)

(declare-fun e!14173 () SeekEntryResult!52)

(assert (=> b!21818 (= e!14173 Undefined!52)))

(declare-fun b!21819 () Bool)

(assert (=> b!21819 (= e!14173 e!14175)))

(assert (=> b!21819 (= lt!7041 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2330 lt!7039)))))

(declare-fun c!2591 () Bool)

(assert (=> b!21819 (= c!2591 (= lt!7041 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21820 () Bool)

(assert (=> b!21820 (= e!14175 (Found!52 (index!2330 lt!7039)))))

(declare-fun b!21821 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1209 (_ BitVec 32)) SeekEntryResult!52)

(assert (=> b!21821 (= e!14174 (seekKeyOrZeroReturnVacant!0 (x!5191 lt!7039) (index!2330 lt!7039) (index!2330 lt!7039) #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655))))))

(declare-fun d!3787 () Bool)

(declare-fun lt!7040 () SeekEntryResult!52)

(assert (=> d!3787 (and (or ((_ is Undefined!52) lt!7040) (not ((_ is Found!52) lt!7040)) (and (bvsge (index!2329 lt!7040) #b00000000000000000000000000000000) (bvslt (index!2329 lt!7040) (size!666 (_keys!3139 (_2!453 lt!6655)))))) (or ((_ is Undefined!52) lt!7040) ((_ is Found!52) lt!7040) (not ((_ is MissingZero!52) lt!7040)) (and (bvsge (index!2328 lt!7040) #b00000000000000000000000000000000) (bvslt (index!2328 lt!7040) (size!666 (_keys!3139 (_2!453 lt!6655)))))) (or ((_ is Undefined!52) lt!7040) ((_ is Found!52) lt!7040) ((_ is MissingZero!52) lt!7040) (not ((_ is MissingVacant!52) lt!7040)) (and (bvsge (index!2331 lt!7040) #b00000000000000000000000000000000) (bvslt (index!2331 lt!7040) (size!666 (_keys!3139 (_2!453 lt!6655)))))) (or ((_ is Undefined!52) lt!7040) (ite ((_ is Found!52) lt!7040) (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!7040)) #b1000000000000000000000000000000000000000000000000000000000000000) (ite ((_ is MissingZero!52) lt!7040) (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2328 lt!7040)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!52) lt!7040) (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2331 lt!7040)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!3787 (= lt!7040 e!14173)))

(declare-fun c!2592 () Bool)

(assert (=> d!3787 (= c!2592 (and ((_ is Intermediate!52) lt!7039) (undefined!864 lt!7039)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1209 (_ BitVec 32)) SeekEntryResult!52)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3787 (= lt!7039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 #b1000000000000000000000000000000000000000000000000000000000000000 (mask!4691 (_2!453 lt!6655))) #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655))))))

(assert (=> d!3787 (validMask!0 (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3787 (= (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655))) lt!7040)))

(assert (= (and d!3787 c!2592) b!21818))

(assert (= (and d!3787 (not c!2592)) b!21819))

(assert (= (and b!21819 c!2591) b!21820))

(assert (= (and b!21819 (not c!2591)) b!21817))

(assert (= (and b!21817 c!2590) b!21816))

(assert (= (and b!21817 (not c!2590)) b!21821))

(declare-fun m!15373 () Bool)

(assert (=> b!21819 m!15373))

(declare-fun m!15375 () Bool)

(assert (=> b!21821 m!15375))

(assert (=> d!3787 m!15143))

(declare-fun m!15377 () Bool)

(assert (=> d!3787 m!15377))

(declare-fun m!15379 () Bool)

(assert (=> d!3787 m!15379))

(declare-fun m!15381 () Bool)

(assert (=> d!3787 m!15381))

(assert (=> d!3787 m!15377))

(declare-fun m!15383 () Bool)

(assert (=> d!3787 m!15383))

(declare-fun m!15385 () Bool)

(assert (=> d!3787 m!15385))

(assert (=> b!21598 d!3787))

(declare-fun b!21822 () Bool)

(declare-fun e!14177 () SeekEntryResult!52)

(declare-fun lt!7042 () SeekEntryResult!52)

(assert (=> b!21822 (= e!14177 (MissingZero!52 (index!2330 lt!7042)))))

(declare-fun b!21823 () Bool)

(declare-fun c!2593 () Bool)

(declare-fun lt!7044 () (_ BitVec 64))

(assert (=> b!21823 (= c!2593 (= lt!7044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14178 () SeekEntryResult!52)

(assert (=> b!21823 (= e!14178 e!14177)))

(declare-fun b!21824 () Bool)

(declare-fun e!14176 () SeekEntryResult!52)

(assert (=> b!21824 (= e!14176 Undefined!52)))

(declare-fun b!21825 () Bool)

(assert (=> b!21825 (= e!14176 e!14178)))

(assert (=> b!21825 (= lt!7044 (select (arr!573 (_keys!3139 lt!6656)) (index!2330 lt!7042)))))

(declare-fun c!2594 () Bool)

(assert (=> b!21825 (= c!2594 (= lt!7044 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!21826 () Bool)

(assert (=> b!21826 (= e!14178 (Found!52 (index!2330 lt!7042)))))

(declare-fun b!21827 () Bool)

(assert (=> b!21827 (= e!14177 (seekKeyOrZeroReturnVacant!0 (x!5191 lt!7042) (index!2330 lt!7042) (index!2330 lt!7042) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3139 lt!6656) (mask!4691 lt!6656)))))

(declare-fun d!3789 () Bool)

(declare-fun lt!7043 () SeekEntryResult!52)

(assert (=> d!3789 (and (or ((_ is Undefined!52) lt!7043) (not ((_ is Found!52) lt!7043)) (and (bvsge (index!2329 lt!7043) #b00000000000000000000000000000000) (bvslt (index!2329 lt!7043) (size!666 (_keys!3139 lt!6656))))) (or ((_ is Undefined!52) lt!7043) ((_ is Found!52) lt!7043) (not ((_ is MissingZero!52) lt!7043)) (and (bvsge (index!2328 lt!7043) #b00000000000000000000000000000000) (bvslt (index!2328 lt!7043) (size!666 (_keys!3139 lt!6656))))) (or ((_ is Undefined!52) lt!7043) ((_ is Found!52) lt!7043) ((_ is MissingZero!52) lt!7043) (not ((_ is MissingVacant!52) lt!7043)) (and (bvsge (index!2331 lt!7043) #b00000000000000000000000000000000) (bvslt (index!2331 lt!7043) (size!666 (_keys!3139 lt!6656))))) (or ((_ is Undefined!52) lt!7043) (ite ((_ is Found!52) lt!7043) (= (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!7043)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite ((_ is MissingZero!52) lt!7043) (= (select (arr!573 (_keys!3139 lt!6656)) (index!2328 lt!7043)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!52) lt!7043) (= (select (arr!573 (_keys!3139 lt!6656)) (index!2331 lt!7043)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!3789 (= lt!7043 e!14176)))

(declare-fun c!2595 () Bool)

(assert (=> d!3789 (= c!2595 (and ((_ is Intermediate!52) lt!7042) (undefined!864 lt!7042)))))

(assert (=> d!3789 (= lt!7042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (mask!4691 lt!6656)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3139 lt!6656) (mask!4691 lt!6656)))))

(assert (=> d!3789 (validMask!0 (mask!4691 lt!6656))))

(assert (=> d!3789 (= (seekEntryOrOpen!0 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3139 lt!6656) (mask!4691 lt!6656)) lt!7043)))

(assert (= (and d!3789 c!2595) b!21824))

(assert (= (and d!3789 (not c!2595)) b!21825))

(assert (= (and b!21825 c!2594) b!21826))

(assert (= (and b!21825 (not c!2594)) b!21823))

(assert (= (and b!21823 c!2593) b!21822))

(assert (= (and b!21823 (not c!2593)) b!21827))

(declare-fun m!15387 () Bool)

(assert (=> b!21825 m!15387))

(declare-fun m!15389 () Bool)

(assert (=> b!21827 m!15389))

(assert (=> d!3789 m!15131))

(declare-fun m!15391 () Bool)

(assert (=> d!3789 m!15391))

(declare-fun m!15393 () Bool)

(assert (=> d!3789 m!15393))

(declare-fun m!15395 () Bool)

(assert (=> d!3789 m!15395))

(assert (=> d!3789 m!15391))

(declare-fun m!15397 () Bool)

(assert (=> d!3789 m!15397))

(declare-fun m!15399 () Bool)

(assert (=> d!3789 m!15399))

(assert (=> bm!1407 d!3789))

(assert (=> bm!1431 d!3787))

(declare-fun d!3791 () Bool)

(declare-fun e!14181 () Bool)

(assert (=> d!3791 e!14181))

(declare-fun res!13916 () Bool)

(assert (=> d!3791 (=> (not res!13916) (not e!14181))))

(declare-fun lt!7054 () ListLongMap!555)

(assert (=> d!3791 (= res!13916 (contains!225 lt!7054 (_1!454 (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun lt!7056 () List!557)

(assert (=> d!3791 (= lt!7054 (ListLongMap!556 lt!7056))))

(declare-fun lt!7055 () Unit!459)

(declare-fun lt!7053 () Unit!459)

(assert (=> d!3791 (= lt!7055 lt!7053)))

(assert (=> d!3791 (= (getValueByKey!59 lt!7056 (_1!454 (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))) (Some!64 (_2!454 (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!17 (List!557 (_ BitVec 64) V!1155) Unit!459)

(assert (=> d!3791 (= lt!7053 (lemmaContainsTupThenGetReturnValue!17 lt!7056 (_1!454 (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (_2!454 (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun insertStrictlySorted!17 (List!557 (_ BitVec 64) V!1155) List!557)

(assert (=> d!3791 (= lt!7056 (insertStrictlySorted!17 (toList!293 (ite c!2543 call!1470 (ite c!2547 call!1465 call!1469))) (_1!454 (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (_2!454 (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(assert (=> d!3791 (= (+!42 (ite c!2543 call!1470 (ite c!2547 call!1465 call!1469)) (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) lt!7054)))

(declare-fun b!21832 () Bool)

(declare-fun res!13915 () Bool)

(assert (=> b!21832 (=> (not res!13915) (not e!14181))))

(assert (=> b!21832 (= res!13915 (= (getValueByKey!59 (toList!293 lt!7054) (_1!454 (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))) (Some!64 (_2!454 (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))))

(declare-fun b!21833 () Bool)

(declare-fun contains!227 (List!557 tuple2!902) Bool)

(assert (=> b!21833 (= e!14181 (contains!227 (toList!293 lt!7054) (ite (or c!2543 c!2547) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (= (and d!3791 res!13916) b!21832))

(assert (= (and b!21832 res!13915) b!21833))

(declare-fun m!15401 () Bool)

(assert (=> d!3791 m!15401))

(declare-fun m!15403 () Bool)

(assert (=> d!3791 m!15403))

(declare-fun m!15405 () Bool)

(assert (=> d!3791 m!15405))

(declare-fun m!15407 () Bool)

(assert (=> d!3791 m!15407))

(declare-fun m!15409 () Bool)

(assert (=> b!21832 m!15409))

(declare-fun m!15411 () Bool)

(assert (=> b!21833 m!15411))

(assert (=> bm!1468 d!3791))

(declare-fun d!3793 () Bool)

(declare-fun e!14182 () Bool)

(assert (=> d!3793 e!14182))

(declare-fun res!13917 () Bool)

(assert (=> d!3793 (=> res!13917 e!14182)))

(declare-fun lt!7059 () Bool)

(assert (=> d!3793 (= res!13917 (not lt!7059))))

(declare-fun lt!7058 () Bool)

(assert (=> d!3793 (= lt!7059 lt!7058)))

(declare-fun lt!7057 () Unit!459)

(declare-fun e!14183 () Unit!459)

(assert (=> d!3793 (= lt!7057 e!14183)))

(declare-fun c!2596 () Bool)

(assert (=> d!3793 (= c!2596 lt!7058)))

(assert (=> d!3793 (= lt!7058 (containsKey!23 (toList!293 e!14044) (ite c!2523 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!6879)))))))

(assert (=> d!3793 (= (contains!225 e!14044 (ite c!2523 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!6879)))) lt!7059)))

(declare-fun b!21834 () Bool)

(declare-fun lt!7060 () Unit!459)

(assert (=> b!21834 (= e!14183 lt!7060)))

(assert (=> b!21834 (= lt!7060 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!293 e!14044) (ite c!2523 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!6879)))))))

(assert (=> b!21834 (isDefined!21 (getValueByKey!59 (toList!293 e!14044) (ite c!2523 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!6879)))))))

(declare-fun b!21835 () Bool)

(declare-fun Unit!476 () Unit!459)

(assert (=> b!21835 (= e!14183 Unit!476)))

(declare-fun b!21836 () Bool)

(assert (=> b!21836 (= e!14182 (isDefined!21 (getValueByKey!59 (toList!293 e!14044) (ite c!2523 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!6879))))))))

(assert (= (and d!3793 c!2596) b!21834))

(assert (= (and d!3793 (not c!2596)) b!21835))

(assert (= (and d!3793 (not res!13917)) b!21836))

(declare-fun m!15413 () Bool)

(assert (=> d!3793 m!15413))

(declare-fun m!15415 () Bool)

(assert (=> b!21834 m!15415))

(declare-fun m!15417 () Bool)

(assert (=> b!21834 m!15417))

(assert (=> b!21834 m!15417))

(declare-fun m!15419 () Bool)

(assert (=> b!21834 m!15419))

(assert (=> b!21836 m!15417))

(assert (=> b!21836 m!15417))

(assert (=> b!21836 m!15419))

(assert (=> bm!1426 d!3793))

(assert (=> b!21655 d!3779))

(declare-fun d!3795 () Bool)

(assert (=> d!3795 (= (+!42 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) lt!6771 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7063 () Unit!459)

(declare-fun choose!198 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 V!1155 Int) Unit!459)

(assert (=> d!3795 (= lt!7063 (choose!198 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) lt!6771 (zeroValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 lt!6656) (defaultEntry!1718 lt!6656)))))

(assert (=> d!3795 (validMask!0 (mask!4691 lt!6656))))

(assert (=> d!3795 (= (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) lt!6771 (zeroValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 lt!6656) (defaultEntry!1718 lt!6656)) lt!7063)))

(declare-fun bs!919 () Bool)

(assert (= bs!919 d!3795))

(declare-fun m!15421 () Bool)

(assert (=> bs!919 m!15421))

(declare-fun m!15423 () Bool)

(assert (=> bs!919 m!15423))

(assert (=> bs!919 m!14909))

(assert (=> bs!919 m!14909))

(declare-fun m!15425 () Bool)

(assert (=> bs!919 m!15425))

(assert (=> bs!919 m!15131))

(assert (=> b!21495 d!3795))

(declare-fun d!3797 () Bool)

(declare-fun e!14184 () Bool)

(assert (=> d!3797 e!14184))

(declare-fun res!13919 () Bool)

(assert (=> d!3797 (=> (not res!13919) (not e!14184))))

(declare-fun lt!7065 () ListLongMap!555)

(assert (=> d!3797 (= res!13919 (contains!225 lt!7065 (_1!454 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun lt!7067 () List!557)

(assert (=> d!3797 (= lt!7065 (ListLongMap!556 lt!7067))))

(declare-fun lt!7066 () Unit!459)

(declare-fun lt!7064 () Unit!459)

(assert (=> d!3797 (= lt!7066 lt!7064)))

(assert (=> d!3797 (= (getValueByKey!59 lt!7067 (_1!454 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))) (Some!64 (_2!454 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(assert (=> d!3797 (= lt!7064 (lemmaContainsTupThenGetReturnValue!17 lt!7067 (_1!454 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (_2!454 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(assert (=> d!3797 (= lt!7067 (insertStrictlySorted!17 (toList!293 e!14034) (_1!454 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (_2!454 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(assert (=> d!3797 (= (+!42 e!14034 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) lt!7065)))

(declare-fun b!21837 () Bool)

(declare-fun res!13918 () Bool)

(assert (=> b!21837 (=> (not res!13918) (not e!14184))))

(assert (=> b!21837 (= res!13918 (= (getValueByKey!59 (toList!293 lt!7065) (_1!454 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))) (Some!64 (_2!454 (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))))

(declare-fun b!21838 () Bool)

(assert (=> b!21838 (= e!14184 (contains!227 (toList!293 lt!7065) (ite c!2524 (ite c!2527 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (= (and d!3797 res!13919) b!21837))

(assert (= (and b!21837 res!13918) b!21838))

(declare-fun m!15427 () Bool)

(assert (=> d!3797 m!15427))

(declare-fun m!15429 () Bool)

(assert (=> d!3797 m!15429))

(declare-fun m!15431 () Bool)

(assert (=> d!3797 m!15431))

(declare-fun m!15433 () Bool)

(assert (=> d!3797 m!15433))

(declare-fun m!15435 () Bool)

(assert (=> b!21837 m!15435))

(declare-fun m!15437 () Bool)

(assert (=> b!21838 m!15437))

(assert (=> bm!1444 d!3797))

(declare-fun d!3799 () Bool)

(assert (=> d!3799 (= (+!42 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) lt!6873 (minValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7068 () Unit!459)

(assert (=> d!3799 (= lt!7068 (choose!198 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) lt!6873 (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (_2!453 lt!6655)) (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> d!3799 (validMask!0 (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3799 (= (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) lt!6873 (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (_2!453 lt!6655)) (defaultEntry!1718 (_2!453 lt!6655))) lt!7068)))

(declare-fun bs!920 () Bool)

(assert (= bs!920 d!3799))

(declare-fun m!15439 () Bool)

(assert (=> bs!920 m!15439))

(declare-fun m!15441 () Bool)

(assert (=> bs!920 m!15441))

(assert (=> bs!920 m!15013))

(assert (=> bs!920 m!15013))

(declare-fun m!15443 () Bool)

(assert (=> bs!920 m!15443))

(assert (=> bs!920 m!15143))

(assert (=> b!21575 d!3799))

(declare-fun b!21863 () Bool)

(declare-fun lt!7083 () Unit!459)

(declare-fun lt!7085 () Unit!459)

(assert (=> b!21863 (= lt!7083 lt!7085)))

(declare-fun lt!7089 () (_ BitVec 64))

(declare-fun lt!7084 () ListLongMap!555)

(declare-fun lt!7086 () (_ BitVec 64))

(declare-fun lt!7087 () V!1155)

(assert (=> b!21863 (not (contains!225 (+!42 lt!7084 (tuple2!903 lt!7089 lt!7087)) lt!7086))))

(declare-fun addStillNotContains!1 (ListLongMap!555 (_ BitVec 64) V!1155 (_ BitVec 64)) Unit!459)

(assert (=> b!21863 (= lt!7085 (addStillNotContains!1 lt!7084 lt!7089 lt!7087 lt!7086))))

(assert (=> b!21863 (= lt!7086 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!21863 (= lt!7087 (get!377 (select (arr!572 (_values!1707 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21863 (= lt!7089 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))

(declare-fun call!1494 () ListLongMap!555)

(assert (=> b!21863 (= lt!7084 call!1494)))

(declare-fun e!14203 () ListLongMap!555)

(assert (=> b!21863 (= e!14203 (+!42 call!1494 (tuple2!903 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (get!377 (select (arr!572 (_values!1707 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!21864 () Bool)

(declare-fun e!14201 () ListLongMap!555)

(assert (=> b!21864 (= e!14201 (ListLongMap!556 Nil!554))))

(declare-fun b!21865 () Bool)

(declare-fun e!14202 () Bool)

(declare-fun e!14205 () Bool)

(assert (=> b!21865 (= e!14202 e!14205)))

(declare-fun c!2607 () Bool)

(declare-fun e!14199 () Bool)

(assert (=> b!21865 (= c!2607 e!14199)))

(declare-fun res!13931 () Bool)

(assert (=> b!21865 (=> (not res!13931) (not e!14199))))

(assert (=> b!21865 (= res!13931 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun b!21866 () Bool)

(declare-fun e!14200 () Bool)

(assert (=> b!21866 (= e!14205 e!14200)))

(assert (=> b!21866 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun res!13930 () Bool)

(declare-fun lt!7088 () ListLongMap!555)

(assert (=> b!21866 (= res!13930 (contains!225 lt!7088 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!21866 (=> (not res!13930) (not e!14200))))

(declare-fun b!21867 () Bool)

(declare-fun e!14204 () Bool)

(assert (=> b!21867 (= e!14205 e!14204)))

(declare-fun c!2608 () Bool)

(assert (=> b!21867 (= c!2608 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun b!21868 () Bool)

(declare-fun res!13928 () Bool)

(assert (=> b!21868 (=> (not res!13928) (not e!14202))))

(assert (=> b!21868 (= res!13928 (not (contains!225 lt!7088 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!3801 () Bool)

(assert (=> d!3801 e!14202))

(declare-fun res!13929 () Bool)

(assert (=> d!3801 (=> (not res!13929) (not e!14202))))

(assert (=> d!3801 (= res!13929 (not (contains!225 lt!7088 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3801 (= lt!7088 e!14201)))

(declare-fun c!2605 () Bool)

(assert (=> d!3801 (= c!2605 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))))))

(assert (=> d!3801 (validMask!0 (mask!4691 (v!1570 (underlying!103 thiss!938))))))

(assert (=> d!3801 (= (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (_values!1707 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))) lt!7088)))

(declare-fun b!21869 () Bool)

(assert (=> b!21869 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))))))

(assert (=> b!21869 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_values!1707 (v!1570 (underlying!103 thiss!938))))))))

(assert (=> b!21869 (= e!14200 (= (apply!28 lt!7088 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (get!377 (select (arr!572 (_values!1707 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!140 (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!21870 () Bool)

(assert (=> b!21870 (= e!14201 e!14203)))

(declare-fun c!2606 () Bool)

(assert (=> b!21870 (= c!2606 (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun b!21871 () Bool)

(assert (=> b!21871 (= e!14204 (= lt!7088 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (_values!1707 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun bm!1491 () Bool)

(assert (=> bm!1491 (= call!1494 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (_values!1707 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (extraKeys!1621 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1718 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun b!21872 () Bool)

(assert (=> b!21872 (= e!14199 (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!21872 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun b!21873 () Bool)

(declare-fun isEmpty!171 (ListLongMap!555) Bool)

(assert (=> b!21873 (= e!14204 (isEmpty!171 lt!7088))))

(declare-fun b!21874 () Bool)

(assert (=> b!21874 (= e!14203 call!1494)))

(assert (= (and d!3801 c!2605) b!21864))

(assert (= (and d!3801 (not c!2605)) b!21870))

(assert (= (and b!21870 c!2606) b!21863))

(assert (= (and b!21870 (not c!2606)) b!21874))

(assert (= (or b!21863 b!21874) bm!1491))

(assert (= (and d!3801 res!13929) b!21868))

(assert (= (and b!21868 res!13928) b!21865))

(assert (= (and b!21865 res!13931) b!21872))

(assert (= (and b!21865 c!2607) b!21866))

(assert (= (and b!21865 (not c!2607)) b!21867))

(assert (= (and b!21866 res!13930) b!21869))

(assert (= (and b!21867 c!2608) b!21871))

(assert (= (and b!21867 (not c!2608)) b!21873))

(declare-fun b_lambda!1525 () Bool)

(assert (=> (not b_lambda!1525) (not b!21863)))

(assert (=> b!21863 t!3211))

(declare-fun b_and!1431 () Bool)

(assert (= b_and!1429 (and (=> t!3211 result!1063) b_and!1431)))

(declare-fun b_lambda!1527 () Bool)

(assert (=> (not b_lambda!1527) (not b!21869)))

(assert (=> b!21869 t!3211))

(declare-fun b_and!1433 () Bool)

(assert (= b_and!1431 (and (=> t!3211 result!1063) b_and!1433)))

(assert (=> b!21872 m!15095))

(assert (=> b!21872 m!15095))

(assert (=> b!21872 m!15105))

(declare-fun m!15445 () Bool)

(assert (=> d!3801 m!15445))

(assert (=> d!3801 m!14851))

(assert (=> b!21863 m!15115))

(assert (=> b!21863 m!14969))

(assert (=> b!21863 m!15117))

(declare-fun m!15447 () Bool)

(assert (=> b!21863 m!15447))

(declare-fun m!15449 () Bool)

(assert (=> b!21863 m!15449))

(assert (=> b!21863 m!15447))

(declare-fun m!15451 () Bool)

(assert (=> b!21863 m!15451))

(assert (=> b!21863 m!14969))

(declare-fun m!15453 () Bool)

(assert (=> b!21863 m!15453))

(assert (=> b!21863 m!15095))

(assert (=> b!21863 m!15115))

(assert (=> b!21870 m!15095))

(assert (=> b!21870 m!15095))

(assert (=> b!21870 m!15105))

(declare-fun m!15455 () Bool)

(assert (=> b!21871 m!15455))

(declare-fun m!15457 () Bool)

(assert (=> b!21868 m!15457))

(declare-fun m!15459 () Bool)

(assert (=> b!21873 m!15459))

(assert (=> b!21866 m!15095))

(assert (=> b!21866 m!15095))

(declare-fun m!15461 () Bool)

(assert (=> b!21866 m!15461))

(assert (=> bm!1491 m!15455))

(assert (=> b!21869 m!15115))

(assert (=> b!21869 m!14969))

(assert (=> b!21869 m!15117))

(assert (=> b!21869 m!14969))

(assert (=> b!21869 m!15095))

(assert (=> b!21869 m!15115))

(assert (=> b!21869 m!15095))

(declare-fun m!15463 () Bool)

(assert (=> b!21869 m!15463))

(assert (=> bm!1464 d!3801))

(declare-fun d!3803 () Bool)

(declare-fun e!14206 () Bool)

(assert (=> d!3803 e!14206))

(declare-fun res!13933 () Bool)

(assert (=> d!3803 (=> (not res!13933) (not e!14206))))

(declare-fun lt!7091 () ListLongMap!555)

(assert (=> d!3803 (= res!13933 (contains!225 lt!7091 (_1!454 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))))

(declare-fun lt!7093 () List!557)

(assert (=> d!3803 (= lt!7091 (ListLongMap!556 lt!7093))))

(declare-fun lt!7092 () Unit!459)

(declare-fun lt!7090 () Unit!459)

(assert (=> d!3803 (= lt!7092 lt!7090)))

(assert (=> d!3803 (= (getValueByKey!59 lt!7093 (_1!454 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))) (Some!64 (_2!454 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))))

(assert (=> d!3803 (= lt!7090 (lemmaContainsTupThenGetReturnValue!17 lt!7093 (_1!454 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))) (_2!454 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))))

(assert (=> d!3803 (= lt!7093 (insertStrictlySorted!17 (toList!293 e!13994) (_1!454 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))) (_2!454 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))))

(assert (=> d!3803 (= (+!42 e!13994 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))) lt!7091)))

(declare-fun b!21875 () Bool)

(declare-fun res!13932 () Bool)

(assert (=> b!21875 (=> (not res!13932) (not e!14206))))

(assert (=> b!21875 (= res!13932 (= (getValueByKey!59 (toList!293 lt!7091) (_1!454 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))) (Some!64 (_2!454 (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))))

(declare-fun b!21876 () Bool)

(assert (=> b!21876 (= e!14206 (contains!227 (toList!293 lt!7091) (ite c!2501 (ite c!2504 (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(assert (= (and d!3803 res!13933) b!21875))

(assert (= (and b!21875 res!13932) b!21876))

(declare-fun m!15465 () Bool)

(assert (=> d!3803 m!15465))

(declare-fun m!15467 () Bool)

(assert (=> d!3803 m!15467))

(declare-fun m!15469 () Bool)

(assert (=> d!3803 m!15469))

(declare-fun m!15471 () Bool)

(assert (=> d!3803 m!15471))

(declare-fun m!15473 () Bool)

(assert (=> b!21875 m!15473))

(declare-fun m!15475 () Bool)

(assert (=> b!21876 m!15475))

(assert (=> bm!1420 d!3803))

(declare-fun d!3805 () Bool)

(declare-fun e!14207 () Bool)

(assert (=> d!3805 e!14207))

(declare-fun res!13934 () Bool)

(assert (=> d!3805 (=> res!13934 e!14207)))

(declare-fun lt!7096 () Bool)

(assert (=> d!3805 (= res!13934 (not lt!7096))))

(declare-fun lt!7095 () Bool)

(assert (=> d!3805 (= lt!7096 lt!7095)))

(declare-fun lt!7094 () Unit!459)

(declare-fun e!14208 () Unit!459)

(assert (=> d!3805 (= lt!7094 e!14208)))

(declare-fun c!2609 () Bool)

(assert (=> d!3805 (= c!2609 lt!7095)))

(assert (=> d!3805 (= lt!7095 (containsKey!23 (toList!293 call!1413) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3805 (= (contains!225 call!1413 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) lt!7096)))

(declare-fun b!21877 () Bool)

(declare-fun lt!7097 () Unit!459)

(assert (=> b!21877 (= e!14208 lt!7097)))

(assert (=> b!21877 (= lt!7097 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!293 call!1413) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21877 (isDefined!21 (getValueByKey!59 (toList!293 call!1413) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!21878 () Bool)

(declare-fun Unit!477 () Unit!459)

(assert (=> b!21878 (= e!14208 Unit!477)))

(declare-fun b!21879 () Bool)

(assert (=> b!21879 (= e!14207 (isDefined!21 (getValueByKey!59 (toList!293 call!1413) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!3805 c!2609) b!21877))

(assert (= (and d!3805 (not c!2609)) b!21878))

(assert (= (and d!3805 (not res!13934)) b!21879))

(declare-fun m!15477 () Bool)

(assert (=> d!3805 m!15477))

(declare-fun m!15479 () Bool)

(assert (=> b!21877 m!15479))

(declare-fun m!15481 () Bool)

(assert (=> b!21877 m!15481))

(assert (=> b!21877 m!15481))

(declare-fun m!15483 () Bool)

(assert (=> b!21877 m!15483))

(assert (=> b!21879 m!15481))

(assert (=> b!21879 m!15481))

(assert (=> b!21879 m!15483))

(assert (=> b!21490 d!3805))

(declare-fun d!3807 () Bool)

(declare-fun e!14209 () Bool)

(assert (=> d!3807 e!14209))

(declare-fun res!13935 () Bool)

(assert (=> d!3807 (=> res!13935 e!14209)))

(declare-fun lt!7100 () Bool)

(assert (=> d!3807 (= res!13935 (not lt!7100))))

(declare-fun lt!7099 () Bool)

(assert (=> d!3807 (= lt!7100 lt!7099)))

(declare-fun lt!7098 () Unit!459)

(declare-fun e!14210 () Unit!459)

(assert (=> d!3807 (= lt!7098 e!14210)))

(declare-fun c!2610 () Bool)

(assert (=> d!3807 (= c!2610 lt!7099)))

(assert (=> d!3807 (= lt!7099 (containsKey!23 (toList!293 lt!6943) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3807 (= (contains!225 lt!6943 #b1000000000000000000000000000000000000000000000000000000000000000) lt!7100)))

(declare-fun b!21880 () Bool)

(declare-fun lt!7101 () Unit!459)

(assert (=> b!21880 (= e!14210 lt!7101)))

(assert (=> b!21880 (= lt!7101 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!293 lt!6943) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21880 (isDefined!21 (getValueByKey!59 (toList!293 lt!6943) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21881 () Bool)

(declare-fun Unit!478 () Unit!459)

(assert (=> b!21881 (= e!14210 Unit!478)))

(declare-fun b!21882 () Bool)

(assert (=> b!21882 (= e!14209 (isDefined!21 (getValueByKey!59 (toList!293 lt!6943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3807 c!2610) b!21880))

(assert (= (and d!3807 (not c!2610)) b!21881))

(assert (= (and d!3807 (not res!13935)) b!21882))

(declare-fun m!15485 () Bool)

(assert (=> d!3807 m!15485))

(declare-fun m!15487 () Bool)

(assert (=> b!21880 m!15487))

(assert (=> b!21880 m!15145))

(assert (=> b!21880 m!15145))

(declare-fun m!15489 () Bool)

(assert (=> b!21880 m!15489))

(assert (=> b!21882 m!15145))

(assert (=> b!21882 m!15145))

(assert (=> b!21882 m!15489))

(assert (=> bm!1467 d!3807))

(declare-fun d!3809 () Bool)

(declare-fun e!14211 () Bool)

(assert (=> d!3809 e!14211))

(declare-fun res!13936 () Bool)

(assert (=> d!3809 (=> res!13936 e!14211)))

(declare-fun lt!7104 () Bool)

(assert (=> d!3809 (= res!13936 (not lt!7104))))

(declare-fun lt!7103 () Bool)

(assert (=> d!3809 (= lt!7104 lt!7103)))

(declare-fun lt!7102 () Unit!459)

(declare-fun e!14212 () Unit!459)

(assert (=> d!3809 (= lt!7102 e!14212)))

(declare-fun c!2611 () Bool)

(assert (=> d!3809 (= c!2611 lt!7103)))

(assert (=> d!3809 (= lt!7103 (containsKey!23 (toList!293 call!1437) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3809 (= (contains!225 call!1437 #b1000000000000000000000000000000000000000000000000000000000000000) lt!7104)))

(declare-fun b!21883 () Bool)

(declare-fun lt!7105 () Unit!459)

(assert (=> b!21883 (= e!14212 lt!7105)))

(assert (=> b!21883 (= lt!7105 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!293 call!1437) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21883 (isDefined!21 (getValueByKey!59 (toList!293 call!1437) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21884 () Bool)

(declare-fun Unit!479 () Unit!459)

(assert (=> b!21884 (= e!14212 Unit!479)))

(declare-fun b!21885 () Bool)

(assert (=> b!21885 (= e!14211 (isDefined!21 (getValueByKey!59 (toList!293 call!1437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3809 c!2611) b!21883))

(assert (= (and d!3809 (not c!2611)) b!21884))

(assert (= (and d!3809 (not res!13936)) b!21885))

(declare-fun m!15491 () Bool)

(assert (=> d!3809 m!15491))

(declare-fun m!15493 () Bool)

(assert (=> b!21883 m!15493))

(declare-fun m!15495 () Bool)

(assert (=> b!21883 m!15495))

(assert (=> b!21883 m!15495))

(declare-fun m!15497 () Bool)

(assert (=> b!21883 m!15497))

(assert (=> b!21885 m!15495))

(assert (=> b!21885 m!15495))

(assert (=> b!21885 m!15497))

(assert (=> b!21570 d!3809))

(declare-fun bm!1492 () Bool)

(declare-fun call!1499 () ListLongMap!555)

(declare-fun call!1495 () ListLongMap!555)

(assert (=> bm!1492 (= call!1499 call!1495)))

(declare-fun e!14213 () Bool)

(declare-fun b!21886 () Bool)

(declare-fun lt!7123 () ListLongMap!555)

(assert (=> b!21886 (= e!14213 (= (apply!28 lt!7123 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)) (get!377 (select (arr!572 (ite c!2524 (_values!1707 (_2!453 lt!6655)) lt!6864)) #b00000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 (_2!453 lt!6655)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21886 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (ite c!2524 (_values!1707 (_2!453 lt!6655)) lt!6864))))))

(assert (=> b!21886 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun e!14219 () Bool)

(declare-fun b!21887 () Bool)

(assert (=> b!21887 (= e!14219 (= (apply!28 lt!7123 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655)))))))

(declare-fun bm!1493 () Bool)

(declare-fun call!1500 () ListLongMap!555)

(assert (=> bm!1493 (= call!1495 call!1500)))

(declare-fun b!21888 () Bool)

(declare-fun e!14217 () Bool)

(assert (=> b!21888 (= e!14217 (validKeyInArray!0 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun b!21889 () Bool)

(declare-fun e!14221 () Unit!459)

(declare-fun lt!7114 () Unit!459)

(assert (=> b!21889 (= e!14221 lt!7114)))

(declare-fun lt!7116 () ListLongMap!555)

(assert (=> b!21889 (= lt!7116 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (ite c!2524 (_values!1707 (_2!453 lt!6655)) lt!6864) (mask!4691 (_2!453 lt!6655)) (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))) (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7110 () (_ BitVec 64))

(assert (=> b!21889 (= lt!7110 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7109 () (_ BitVec 64))

(assert (=> b!21889 (= lt!7109 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7112 () Unit!459)

(assert (=> b!21889 (= lt!7112 (addStillContains!13 lt!7116 lt!7110 (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))) lt!7109))))

(assert (=> b!21889 (contains!225 (+!42 lt!7116 (tuple2!903 lt!7110 (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))))) lt!7109)))

(declare-fun lt!7120 () Unit!459)

(assert (=> b!21889 (= lt!7120 lt!7112)))

(declare-fun lt!7113 () ListLongMap!555)

(assert (=> b!21889 (= lt!7113 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (ite c!2524 (_values!1707 (_2!453 lt!6655)) lt!6864) (mask!4691 (_2!453 lt!6655)) (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))) (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7107 () (_ BitVec 64))

(assert (=> b!21889 (= lt!7107 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7119 () (_ BitVec 64))

(assert (=> b!21889 (= lt!7119 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7121 () Unit!459)

(assert (=> b!21889 (= lt!7121 (addApplyDifferent!13 lt!7113 lt!7107 (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))) lt!7119))))

(assert (=> b!21889 (= (apply!28 (+!42 lt!7113 (tuple2!903 lt!7107 (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))))) lt!7119) (apply!28 lt!7113 lt!7119))))

(declare-fun lt!7127 () Unit!459)

(assert (=> b!21889 (= lt!7127 lt!7121)))

(declare-fun lt!7111 () ListLongMap!555)

(assert (=> b!21889 (= lt!7111 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (ite c!2524 (_values!1707 (_2!453 lt!6655)) lt!6864) (mask!4691 (_2!453 lt!6655)) (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))) (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7108 () (_ BitVec 64))

(assert (=> b!21889 (= lt!7108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7106 () (_ BitVec 64))

(assert (=> b!21889 (= lt!7106 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7118 () Unit!459)

(assert (=> b!21889 (= lt!7118 (addApplyDifferent!13 lt!7111 lt!7108 (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))) lt!7106))))

(assert (=> b!21889 (= (apply!28 (+!42 lt!7111 (tuple2!903 lt!7108 (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))))) lt!7106) (apply!28 lt!7111 lt!7106))))

(declare-fun lt!7117 () Unit!459)

(assert (=> b!21889 (= lt!7117 lt!7118)))

(declare-fun lt!7124 () ListLongMap!555)

(assert (=> b!21889 (= lt!7124 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (ite c!2524 (_values!1707 (_2!453 lt!6655)) lt!6864) (mask!4691 (_2!453 lt!6655)) (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))) (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7122 () (_ BitVec 64))

(assert (=> b!21889 (= lt!7122 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7125 () (_ BitVec 64))

(assert (=> b!21889 (= lt!7125 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(assert (=> b!21889 (= lt!7114 (addApplyDifferent!13 lt!7124 lt!7122 (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))) lt!7125))))

(assert (=> b!21889 (= (apply!28 (+!42 lt!7124 (tuple2!903 lt!7122 (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))))) lt!7125) (apply!28 lt!7124 lt!7125))))

(declare-fun bm!1494 () Bool)

(assert (=> bm!1494 (= call!1500 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (ite c!2524 (_values!1707 (_2!453 lt!6655)) lt!6864) (mask!4691 (_2!453 lt!6655)) (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))) (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun b!21891 () Bool)

(declare-fun e!14214 () Bool)

(declare-fun e!14220 () Bool)

(assert (=> b!21891 (= e!14214 e!14220)))

(declare-fun c!2617 () Bool)

(assert (=> b!21891 (= c!2617 (not (= (bvand (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1495 () Bool)

(declare-fun call!1497 () ListLongMap!555)

(declare-fun call!1498 () ListLongMap!555)

(assert (=> bm!1495 (= call!1497 call!1498)))

(declare-fun b!21892 () Bool)

(declare-fun res!13942 () Bool)

(assert (=> b!21892 (=> (not res!13942) (not e!14214))))

(declare-fun e!14225 () Bool)

(assert (=> b!21892 (= res!13942 e!14225)))

(declare-fun c!2614 () Bool)

(assert (=> b!21892 (= c!2614 (not (= (bvand (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!1496 () Bool)

(declare-fun call!1496 () Bool)

(assert (=> bm!1496 (= call!1496 (contains!225 lt!7123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21893 () Bool)

(declare-fun e!14218 () Bool)

(assert (=> b!21893 (= e!14218 (validKeyInArray!0 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun b!21894 () Bool)

(declare-fun res!13939 () Bool)

(assert (=> b!21894 (=> (not res!13939) (not e!14214))))

(declare-fun e!14215 () Bool)

(assert (=> b!21894 (= res!13939 e!14215)))

(declare-fun res!13937 () Bool)

(assert (=> b!21894 (=> res!13937 e!14215)))

(assert (=> b!21894 (= res!13937 (not e!14218))))

(declare-fun res!13943 () Bool)

(assert (=> b!21894 (=> (not res!13943) (not e!14218))))

(assert (=> b!21894 (= res!13943 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun b!21895 () Bool)

(declare-fun e!14224 () ListLongMap!555)

(assert (=> b!21895 (= e!14224 call!1497)))

(declare-fun b!21896 () Bool)

(assert (=> b!21896 (= e!14225 (not call!1496))))

(declare-fun b!21897 () Bool)

(declare-fun e!14222 () ListLongMap!555)

(assert (=> b!21897 (= e!14222 call!1497)))

(declare-fun b!21898 () Bool)

(declare-fun e!14223 () ListLongMap!555)

(assert (=> b!21898 (= e!14223 e!14222)))

(declare-fun c!2616 () Bool)

(assert (=> b!21898 (= c!2616 (and (not (= (bvand (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21899 () Bool)

(declare-fun e!14216 () Bool)

(assert (=> b!21899 (= e!14220 e!14216)))

(declare-fun res!13938 () Bool)

(declare-fun call!1501 () Bool)

(assert (=> b!21899 (= res!13938 call!1501)))

(assert (=> b!21899 (=> (not res!13938) (not e!14216))))

(declare-fun b!21900 () Bool)

(assert (=> b!21900 (= e!14220 (not call!1501))))

(declare-fun b!21901 () Bool)

(assert (=> b!21901 (= e!14216 (= (apply!28 lt!7123 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655)))))))

(declare-fun bm!1497 () Bool)

(assert (=> bm!1497 (= call!1501 (contains!225 lt!7123 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21890 () Bool)

(assert (=> b!21890 (= e!14215 e!14213)))

(declare-fun res!13944 () Bool)

(assert (=> b!21890 (=> (not res!13944) (not e!14213))))

(assert (=> b!21890 (= res!13944 (contains!225 lt!7123 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)))))

(assert (=> b!21890 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun d!3811 () Bool)

(assert (=> d!3811 e!14214))

(declare-fun res!13940 () Bool)

(assert (=> d!3811 (=> (not res!13940) (not e!14214))))

(assert (=> d!3811 (= res!13940 (or (bvsge #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))))

(declare-fun lt!7115 () ListLongMap!555)

(assert (=> d!3811 (= lt!7123 lt!7115)))

(declare-fun lt!7126 () Unit!459)

(assert (=> d!3811 (= lt!7126 e!14221)))

(declare-fun c!2613 () Bool)

(assert (=> d!3811 (= c!2613 e!14217)))

(declare-fun res!13945 () Bool)

(assert (=> d!3811 (=> (not res!13945) (not e!14217))))

(assert (=> d!3811 (= res!13945 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(assert (=> d!3811 (= lt!7115 e!14223)))

(declare-fun c!2612 () Bool)

(assert (=> d!3811 (= c!2612 (and (not (= (bvand (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3811 (validMask!0 (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3811 (= (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (ite c!2524 (_values!1707 (_2!453 lt!6655)) lt!6864) (mask!4691 (_2!453 lt!6655)) (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655))) (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) lt!7123)))

(declare-fun b!21902 () Bool)

(assert (=> b!21902 (= e!14225 e!14219)))

(declare-fun res!13941 () Bool)

(assert (=> b!21902 (= res!13941 call!1496)))

(assert (=> b!21902 (=> (not res!13941) (not e!14219))))

(declare-fun b!21903 () Bool)

(assert (=> b!21903 (= e!14224 call!1499)))

(declare-fun b!21904 () Bool)

(declare-fun Unit!480 () Unit!459)

(assert (=> b!21904 (= e!14221 Unit!480)))

(declare-fun bm!1498 () Bool)

(assert (=> bm!1498 (= call!1498 (+!42 (ite c!2612 call!1500 (ite c!2616 call!1495 call!1499)) (ite (or c!2612 c!2616) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!2524 c!2527) (minValue!1645 (v!1570 (underlying!103 thiss!938))) (zeroValue!1645 (_2!453 lt!6655)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655)))))))))

(declare-fun b!21905 () Bool)

(assert (=> b!21905 (= e!14223 (+!42 call!1498 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2524 (ite c!2527 (minValue!1645 (_2!453 lt!6655)) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (minValue!1645 (_2!453 lt!6655))))))))

(declare-fun c!2615 () Bool)

(declare-fun b!21906 () Bool)

(assert (=> b!21906 (= c!2615 (and (not (= (bvand (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!2524 (ite c!2527 lt!6873 lt!6876) (extraKeys!1621 (_2!453 lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21906 (= e!14222 e!14224)))

(assert (= (and d!3811 c!2612) b!21905))

(assert (= (and d!3811 (not c!2612)) b!21898))

(assert (= (and b!21898 c!2616) b!21897))

(assert (= (and b!21898 (not c!2616)) b!21906))

(assert (= (and b!21906 c!2615) b!21895))

(assert (= (and b!21906 (not c!2615)) b!21903))

(assert (= (or b!21895 b!21903) bm!1492))

(assert (= (or b!21897 bm!1492) bm!1493))

(assert (= (or b!21897 b!21895) bm!1495))

(assert (= (or b!21905 bm!1493) bm!1494))

(assert (= (or b!21905 bm!1495) bm!1498))

(assert (= (and d!3811 res!13945) b!21888))

(assert (= (and d!3811 c!2613) b!21889))

(assert (= (and d!3811 (not c!2613)) b!21904))

(assert (= (and d!3811 res!13940) b!21894))

(assert (= (and b!21894 res!13943) b!21893))

(assert (= (and b!21894 (not res!13937)) b!21890))

(assert (= (and b!21890 res!13944) b!21886))

(assert (= (and b!21894 res!13939) b!21892))

(assert (= (and b!21892 c!2614) b!21902))

(assert (= (and b!21892 (not c!2614)) b!21896))

(assert (= (and b!21902 res!13941) b!21887))

(assert (= (or b!21902 b!21896) bm!1496))

(assert (= (and b!21892 res!13942) b!21891))

(assert (= (and b!21891 c!2617) b!21899))

(assert (= (and b!21891 (not c!2617)) b!21900))

(assert (= (and b!21899 res!13938) b!21901))

(assert (= (or b!21899 b!21900) bm!1497))

(declare-fun b_lambda!1529 () Bool)

(assert (=> (not b_lambda!1529) (not b!21886)))

(assert (=> b!21886 t!3216))

(declare-fun b_and!1435 () Bool)

(assert (= b_and!1433 (and (=> t!3216 result!1071) b_and!1435)))

(declare-fun m!15499 () Bool)

(assert (=> b!21901 m!15499))

(declare-fun m!15501 () Bool)

(assert (=> b!21889 m!15501))

(declare-fun m!15503 () Bool)

(assert (=> b!21889 m!15503))

(declare-fun m!15505 () Bool)

(assert (=> b!21889 m!15505))

(declare-fun m!15507 () Bool)

(assert (=> b!21889 m!15507))

(declare-fun m!15509 () Bool)

(assert (=> b!21889 m!15509))

(declare-fun m!15511 () Bool)

(assert (=> b!21889 m!15511))

(declare-fun m!15513 () Bool)

(assert (=> b!21889 m!15513))

(declare-fun m!15515 () Bool)

(assert (=> b!21889 m!15515))

(declare-fun m!15517 () Bool)

(assert (=> b!21889 m!15517))

(assert (=> b!21889 m!15515))

(declare-fun m!15519 () Bool)

(assert (=> b!21889 m!15519))

(declare-fun m!15521 () Bool)

(assert (=> b!21889 m!15521))

(declare-fun m!15523 () Bool)

(assert (=> b!21889 m!15523))

(assert (=> b!21889 m!15511))

(assert (=> b!21889 m!15507))

(declare-fun m!15525 () Bool)

(assert (=> b!21889 m!15525))

(declare-fun m!15527 () Bool)

(assert (=> b!21889 m!15527))

(assert (=> b!21889 m!15525))

(assert (=> b!21889 m!15317))

(declare-fun m!15529 () Bool)

(assert (=> b!21889 m!15529))

(declare-fun m!15531 () Bool)

(assert (=> b!21889 m!15531))

(assert (=> bm!1494 m!15505))

(declare-fun m!15533 () Bool)

(assert (=> bm!1497 m!15533))

(declare-fun m!15535 () Bool)

(assert (=> b!21905 m!15535))

(assert (=> b!21893 m!15317))

(assert (=> b!21893 m!15317))

(assert (=> b!21893 m!15327))

(assert (=> b!21888 m!15317))

(assert (=> b!21888 m!15317))

(assert (=> b!21888 m!15327))

(assert (=> d!3811 m!15143))

(assert (=> b!21890 m!15317))

(assert (=> b!21890 m!15317))

(declare-fun m!15537 () Bool)

(assert (=> b!21890 m!15537))

(declare-fun m!15539 () Bool)

(assert (=> bm!1498 m!15539))

(declare-fun m!15541 () Bool)

(assert (=> bm!1496 m!15541))

(declare-fun m!15543 () Bool)

(assert (=> b!21887 m!15543))

(declare-fun m!15545 () Bool)

(assert (=> b!21886 m!15545))

(assert (=> b!21886 m!15545))

(assert (=> b!21886 m!15339))

(declare-fun m!15547 () Bool)

(assert (=> b!21886 m!15547))

(assert (=> b!21886 m!15339))

(assert (=> b!21886 m!15317))

(declare-fun m!15549 () Bool)

(assert (=> b!21886 m!15549))

(assert (=> b!21886 m!15317))

(assert (=> bm!1424 d!3811))

(declare-fun d!3813 () Bool)

(assert (=> d!3813 (= (apply!28 lt!6943 #b0000000000000000000000000000000000000000000000000000000000000000) (get!378 (getValueByKey!59 (toList!293 lt!6943) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!921 () Bool)

(assert (= bs!921 d!3813))

(declare-fun m!15551 () Bool)

(assert (=> bs!921 m!15551))

(assert (=> bs!921 m!15551))

(declare-fun m!15553 () Bool)

(assert (=> bs!921 m!15553))

(assert (=> b!21654 d!3813))

(assert (=> b!21518 d!3789))

(declare-fun d!3815 () Bool)

(declare-fun e!14228 () Bool)

(assert (=> d!3815 e!14228))

(declare-fun res!13950 () Bool)

(assert (=> d!3815 (=> (not res!13950) (not e!14228))))

(declare-fun lt!7133 () SeekEntryResult!52)

(assert (=> d!3815 (= res!13950 ((_ is Found!52) lt!7133))))

(assert (=> d!3815 (= lt!7133 (seekEntryOrOpen!0 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3139 lt!6656) (mask!4691 lt!6656)))))

(declare-fun lt!7132 () Unit!459)

(declare-fun choose!199 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!459)

(assert (=> d!3815 (= lt!7132 (choose!199 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1718 lt!6656)))))

(assert (=> d!3815 (validMask!0 (mask!4691 lt!6656))))

(assert (=> d!3815 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1718 lt!6656)) lt!7132)))

(declare-fun b!21911 () Bool)

(declare-fun res!13951 () Bool)

(assert (=> b!21911 (=> (not res!13951) (not e!14228))))

(assert (=> b!21911 (= res!13951 (inRange!0 (index!2329 lt!7133) (mask!4691 lt!6656)))))

(declare-fun b!21912 () Bool)

(assert (=> b!21912 (= e!14228 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!7133)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21912 (and (bvsge (index!2329 lt!7133) #b00000000000000000000000000000000) (bvslt (index!2329 lt!7133) (size!666 (_keys!3139 lt!6656))))))

(assert (= (and d!3815 res!13950) b!21911))

(assert (= (and b!21911 res!13951) b!21912))

(assert (=> d!3815 m!14911))

(declare-fun m!15555 () Bool)

(assert (=> d!3815 m!15555))

(assert (=> d!3815 m!15131))

(declare-fun m!15557 () Bool)

(assert (=> b!21911 m!15557))

(declare-fun m!15559 () Bool)

(assert (=> b!21912 m!15559))

(assert (=> bm!1418 d!3815))

(declare-fun d!3817 () Bool)

(declare-fun e!14229 () Bool)

(assert (=> d!3817 e!14229))

(declare-fun res!13952 () Bool)

(assert (=> d!3817 (=> (not res!13952) (not e!14229))))

(declare-fun lt!7135 () SeekEntryResult!52)

(assert (=> d!3817 (= res!13952 ((_ is Found!52) lt!7135))))

(assert (=> d!3817 (= lt!7135 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655))))))

(declare-fun lt!7134 () Unit!459)

(assert (=> d!3817 (= lt!7134 (choose!199 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> d!3817 (validMask!0 (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3817 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) lt!7134)))

(declare-fun b!21913 () Bool)

(declare-fun res!13953 () Bool)

(assert (=> b!21913 (=> (not res!13953) (not e!14229))))

(assert (=> b!21913 (= res!13953 (inRange!0 (index!2329 lt!7135) (mask!4691 (_2!453 lt!6655))))))

(declare-fun b!21914 () Bool)

(assert (=> b!21914 (= e!14229 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!7135)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21914 (and (bvsge (index!2329 lt!7135) #b00000000000000000000000000000000) (bvslt (index!2329 lt!7135) (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(assert (= (and d!3817 res!13952) b!21913))

(assert (= (and b!21913 res!13953) b!21914))

(assert (=> d!3817 m!15015))

(declare-fun m!15561 () Bool)

(assert (=> d!3817 m!15561))

(assert (=> d!3817 m!15143))

(declare-fun m!15563 () Bool)

(assert (=> b!21913 m!15563))

(declare-fun m!15565 () Bool)

(assert (=> b!21914 m!15565))

(assert (=> bm!1442 d!3817))

(assert (=> b!21525 d!3765))

(assert (=> b!21605 d!3773))

(declare-fun b!21931 () Bool)

(declare-fun res!13962 () Bool)

(declare-fun e!14240 () Bool)

(assert (=> b!21931 (=> (not res!13962) (not e!14240))))

(declare-fun call!1506 () Bool)

(assert (=> b!21931 (= res!13962 call!1506)))

(declare-fun e!14239 () Bool)

(assert (=> b!21931 (= e!14239 e!14240)))

(declare-fun b!21932 () Bool)

(declare-fun lt!7140 () SeekEntryResult!52)

(assert (=> b!21932 (= e!14239 ((_ is Undefined!52) lt!7140))))

(declare-fun d!3819 () Bool)

(declare-fun e!14238 () Bool)

(assert (=> d!3819 e!14238))

(declare-fun c!2622 () Bool)

(assert (=> d!3819 (= c!2622 ((_ is MissingZero!52) lt!7140))))

(assert (=> d!3819 (= lt!7140 (seekEntryOrOpen!0 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3139 lt!6656) (mask!4691 lt!6656)))))

(declare-fun lt!7141 () Unit!459)

(declare-fun choose!200 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!459)

(assert (=> d!3819 (= lt!7141 (choose!200 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1718 lt!6656)))))

(assert (=> d!3819 (validMask!0 (mask!4691 lt!6656))))

(assert (=> d!3819 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1718 lt!6656)) lt!7141)))

(declare-fun bm!1503 () Bool)

(declare-fun call!1507 () Bool)

(assert (=> bm!1503 (= call!1507 (arrayContainsKey!0 (_keys!3139 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun b!21933 () Bool)

(assert (=> b!21933 (and (bvsge (index!2328 lt!7140) #b00000000000000000000000000000000) (bvslt (index!2328 lt!7140) (size!666 (_keys!3139 lt!6656))))))

(declare-fun res!13964 () Bool)

(assert (=> b!21933 (= res!13964 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2328 lt!7140)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14241 () Bool)

(assert (=> b!21933 (=> (not res!13964) (not e!14241))))

(declare-fun b!21934 () Bool)

(assert (=> b!21934 (= e!14238 e!14241)))

(declare-fun res!13963 () Bool)

(assert (=> b!21934 (= res!13963 call!1506)))

(assert (=> b!21934 (=> (not res!13963) (not e!14241))))

(declare-fun b!21935 () Bool)

(assert (=> b!21935 (= e!14238 e!14239)))

(declare-fun c!2623 () Bool)

(assert (=> b!21935 (= c!2623 ((_ is MissingVacant!52) lt!7140))))

(declare-fun b!21936 () Bool)

(declare-fun res!13965 () Bool)

(assert (=> b!21936 (=> (not res!13965) (not e!14240))))

(assert (=> b!21936 (= res!13965 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2331 lt!7140)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21936 (and (bvsge (index!2331 lt!7140) #b00000000000000000000000000000000) (bvslt (index!2331 lt!7140) (size!666 (_keys!3139 lt!6656))))))

(declare-fun bm!1504 () Bool)

(assert (=> bm!1504 (= call!1506 (inRange!0 (ite c!2622 (index!2328 lt!7140) (index!2331 lt!7140)) (mask!4691 lt!6656)))))

(declare-fun b!21937 () Bool)

(assert (=> b!21937 (= e!14240 (not call!1507))))

(declare-fun b!21938 () Bool)

(assert (=> b!21938 (= e!14241 (not call!1507))))

(assert (= (and d!3819 c!2622) b!21934))

(assert (= (and d!3819 (not c!2622)) b!21935))

(assert (= (and b!21934 res!13963) b!21933))

(assert (= (and b!21933 res!13964) b!21938))

(assert (= (and b!21935 c!2623) b!21931))

(assert (= (and b!21935 (not c!2623)) b!21932))

(assert (= (and b!21931 res!13962) b!21936))

(assert (= (and b!21936 res!13965) b!21937))

(assert (= (or b!21934 b!21931) bm!1504))

(assert (= (or b!21938 b!21937) bm!1503))

(assert (=> bm!1503 m!14931))

(declare-fun m!15567 () Bool)

(assert (=> b!21936 m!15567))

(declare-fun m!15569 () Bool)

(assert (=> b!21933 m!15569))

(assert (=> d!3819 m!14911))

(declare-fun m!15571 () Bool)

(assert (=> d!3819 m!15571))

(assert (=> d!3819 m!15131))

(declare-fun m!15573 () Bool)

(assert (=> bm!1504 m!15573))

(assert (=> bm!1412 d!3819))

(declare-fun b!21939 () Bool)

(declare-fun res!13966 () Bool)

(declare-fun e!14244 () Bool)

(assert (=> b!21939 (=> (not res!13966) (not e!14244))))

(declare-fun call!1508 () Bool)

(assert (=> b!21939 (= res!13966 call!1508)))

(declare-fun e!14243 () Bool)

(assert (=> b!21939 (= e!14243 e!14244)))

(declare-fun b!21940 () Bool)

(declare-fun lt!7142 () SeekEntryResult!52)

(assert (=> b!21940 (= e!14243 ((_ is Undefined!52) lt!7142))))

(declare-fun d!3821 () Bool)

(declare-fun e!14242 () Bool)

(assert (=> d!3821 e!14242))

(declare-fun c!2624 () Bool)

(assert (=> d!3821 (= c!2624 ((_ is MissingZero!52) lt!7142))))

(assert (=> d!3821 (= lt!7142 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655))))))

(declare-fun lt!7143 () Unit!459)

(assert (=> d!3821 (= lt!7143 (choose!200 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> d!3821 (validMask!0 (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3821 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) lt!7143)))

(declare-fun bm!1505 () Bool)

(declare-fun call!1509 () Bool)

(assert (=> bm!1505 (= call!1509 (arrayContainsKey!0 (_keys!3139 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!21941 () Bool)

(assert (=> b!21941 (and (bvsge (index!2328 lt!7142) #b00000000000000000000000000000000) (bvslt (index!2328 lt!7142) (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun res!13968 () Bool)

(assert (=> b!21941 (= res!13968 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2328 lt!7142)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14245 () Bool)

(assert (=> b!21941 (=> (not res!13968) (not e!14245))))

(declare-fun b!21942 () Bool)

(assert (=> b!21942 (= e!14242 e!14245)))

(declare-fun res!13967 () Bool)

(assert (=> b!21942 (= res!13967 call!1508)))

(assert (=> b!21942 (=> (not res!13967) (not e!14245))))

(declare-fun b!21943 () Bool)

(assert (=> b!21943 (= e!14242 e!14243)))

(declare-fun c!2625 () Bool)

(assert (=> b!21943 (= c!2625 ((_ is MissingVacant!52) lt!7142))))

(declare-fun b!21944 () Bool)

(declare-fun res!13969 () Bool)

(assert (=> b!21944 (=> (not res!13969) (not e!14244))))

(assert (=> b!21944 (= res!13969 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2331 lt!7142)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21944 (and (bvsge (index!2331 lt!7142) #b00000000000000000000000000000000) (bvslt (index!2331 lt!7142) (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun bm!1506 () Bool)

(assert (=> bm!1506 (= call!1508 (inRange!0 (ite c!2624 (index!2328 lt!7142) (index!2331 lt!7142)) (mask!4691 (_2!453 lt!6655))))))

(declare-fun b!21945 () Bool)

(assert (=> b!21945 (= e!14244 (not call!1509))))

(declare-fun b!21946 () Bool)

(assert (=> b!21946 (= e!14245 (not call!1509))))

(assert (= (and d!3821 c!2624) b!21942))

(assert (= (and d!3821 (not c!2624)) b!21943))

(assert (= (and b!21942 res!13967) b!21941))

(assert (= (and b!21941 res!13968) b!21946))

(assert (= (and b!21943 c!2625) b!21939))

(assert (= (and b!21943 (not c!2625)) b!21940))

(assert (= (and b!21939 res!13966) b!21944))

(assert (= (and b!21944 res!13969) b!21945))

(assert (= (or b!21942 b!21939) bm!1506))

(assert (= (or b!21946 b!21945) bm!1505))

(assert (=> bm!1505 m!15035))

(declare-fun m!15575 () Bool)

(assert (=> b!21944 m!15575))

(declare-fun m!15577 () Bool)

(assert (=> b!21941 m!15577))

(assert (=> d!3821 m!15015))

(declare-fun m!15579 () Bool)

(assert (=> d!3821 m!15579))

(assert (=> d!3821 m!15143))

(declare-fun m!15581 () Bool)

(assert (=> bm!1506 m!15581))

(assert (=> bm!1436 d!3821))

(declare-fun bm!1507 () Bool)

(declare-fun call!1514 () ListLongMap!555)

(declare-fun call!1510 () ListLongMap!555)

(assert (=> bm!1507 (= call!1514 call!1510)))

(declare-fun e!14246 () Bool)

(declare-fun lt!7161 () ListLongMap!555)

(declare-fun b!21947 () Bool)

(assert (=> b!21947 (= e!14246 (= (apply!28 lt!7161 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)) (get!377 (select (arr!572 (ite (or c!2501 c!2500) (_values!1707 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656))))) #b00000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 lt!6656) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (ite (or c!2501 c!2500) (_values!1707 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656)))))))))

(assert (=> b!21947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(declare-fun b!21948 () Bool)

(declare-fun e!14252 () Bool)

(assert (=> b!21948 (= e!14252 (= (apply!28 lt!7161 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 lt!6656)))))

(declare-fun bm!1508 () Bool)

(declare-fun call!1515 () ListLongMap!555)

(assert (=> bm!1508 (= call!1510 call!1515)))

(declare-fun b!21949 () Bool)

(declare-fun e!14250 () Bool)

(assert (=> b!21949 (= e!14250 (validKeyInArray!0 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)))))

(declare-fun b!21950 () Bool)

(declare-fun e!14254 () Unit!459)

(declare-fun lt!7152 () Unit!459)

(assert (=> b!21950 (= e!14254 lt!7152)))

(declare-fun lt!7154 () ListLongMap!555)

(assert (=> b!21950 (= lt!7154 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (ite (or c!2501 c!2500) (_values!1707 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656)))) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7148 () (_ BitVec 64))

(assert (=> b!21950 (= lt!7148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7147 () (_ BitVec 64))

(assert (=> b!21950 (= lt!7147 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(declare-fun lt!7150 () Unit!459)

(assert (=> b!21950 (= lt!7150 (addStillContains!13 lt!7154 lt!7148 (zeroValue!1645 lt!6656) lt!7147))))

(assert (=> b!21950 (contains!225 (+!42 lt!7154 (tuple2!903 lt!7148 (zeroValue!1645 lt!6656))) lt!7147)))

(declare-fun lt!7158 () Unit!459)

(assert (=> b!21950 (= lt!7158 lt!7150)))

(declare-fun lt!7151 () ListLongMap!555)

(assert (=> b!21950 (= lt!7151 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (ite (or c!2501 c!2500) (_values!1707 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656)))) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7145 () (_ BitVec 64))

(assert (=> b!21950 (= lt!7145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7157 () (_ BitVec 64))

(assert (=> b!21950 (= lt!7157 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(declare-fun lt!7159 () Unit!459)

(assert (=> b!21950 (= lt!7159 (addApplyDifferent!13 lt!7151 lt!7145 (minValue!1645 lt!6656) lt!7157))))

(assert (=> b!21950 (= (apply!28 (+!42 lt!7151 (tuple2!903 lt!7145 (minValue!1645 lt!6656))) lt!7157) (apply!28 lt!7151 lt!7157))))

(declare-fun lt!7165 () Unit!459)

(assert (=> b!21950 (= lt!7165 lt!7159)))

(declare-fun lt!7149 () ListLongMap!555)

(assert (=> b!21950 (= lt!7149 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (ite (or c!2501 c!2500) (_values!1707 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656)))) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7146 () (_ BitVec 64))

(assert (=> b!21950 (= lt!7146 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7144 () (_ BitVec 64))

(assert (=> b!21950 (= lt!7144 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(declare-fun lt!7156 () Unit!459)

(assert (=> b!21950 (= lt!7156 (addApplyDifferent!13 lt!7149 lt!7146 (zeroValue!1645 lt!6656) lt!7144))))

(assert (=> b!21950 (= (apply!28 (+!42 lt!7149 (tuple2!903 lt!7146 (zeroValue!1645 lt!6656))) lt!7144) (apply!28 lt!7149 lt!7144))))

(declare-fun lt!7155 () Unit!459)

(assert (=> b!21950 (= lt!7155 lt!7156)))

(declare-fun lt!7162 () ListLongMap!555)

(assert (=> b!21950 (= lt!7162 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (ite (or c!2501 c!2500) (_values!1707 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656)))) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7160 () (_ BitVec 64))

(assert (=> b!21950 (= lt!7160 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7163 () (_ BitVec 64))

(assert (=> b!21950 (= lt!7163 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(assert (=> b!21950 (= lt!7152 (addApplyDifferent!13 lt!7162 lt!7160 (minValue!1645 lt!6656) lt!7163))))

(assert (=> b!21950 (= (apply!28 (+!42 lt!7162 (tuple2!903 lt!7160 (minValue!1645 lt!6656))) lt!7163) (apply!28 lt!7162 lt!7163))))

(declare-fun bm!1509 () Bool)

(assert (=> bm!1509 (= call!1515 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (ite (or c!2501 c!2500) (_values!1707 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656)))) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun b!21952 () Bool)

(declare-fun e!14247 () Bool)

(declare-fun e!14253 () Bool)

(assert (=> b!21952 (= e!14247 e!14253)))

(declare-fun c!2631 () Bool)

(assert (=> b!21952 (= c!2631 (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1510 () Bool)

(declare-fun call!1512 () ListLongMap!555)

(declare-fun call!1513 () ListLongMap!555)

(assert (=> bm!1510 (= call!1512 call!1513)))

(declare-fun b!21953 () Bool)

(declare-fun res!13975 () Bool)

(assert (=> b!21953 (=> (not res!13975) (not e!14247))))

(declare-fun e!14258 () Bool)

(assert (=> b!21953 (= res!13975 e!14258)))

(declare-fun c!2628 () Bool)

(assert (=> b!21953 (= c!2628 (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!1511 () Bool)

(declare-fun call!1511 () Bool)

(assert (=> bm!1511 (= call!1511 (contains!225 lt!7161 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21954 () Bool)

(declare-fun e!14251 () Bool)

(assert (=> b!21954 (= e!14251 (validKeyInArray!0 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)))))

(declare-fun b!21955 () Bool)

(declare-fun res!13972 () Bool)

(assert (=> b!21955 (=> (not res!13972) (not e!14247))))

(declare-fun e!14248 () Bool)

(assert (=> b!21955 (= res!13972 e!14248)))

(declare-fun res!13970 () Bool)

(assert (=> b!21955 (=> res!13970 e!14248)))

(assert (=> b!21955 (= res!13970 (not e!14251))))

(declare-fun res!13976 () Bool)

(assert (=> b!21955 (=> (not res!13976) (not e!14251))))

(assert (=> b!21955 (= res!13976 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(declare-fun b!21956 () Bool)

(declare-fun e!14257 () ListLongMap!555)

(assert (=> b!21956 (= e!14257 call!1512)))

(declare-fun b!21957 () Bool)

(assert (=> b!21957 (= e!14258 (not call!1511))))

(declare-fun b!21958 () Bool)

(declare-fun e!14255 () ListLongMap!555)

(assert (=> b!21958 (= e!14255 call!1512)))

(declare-fun b!21959 () Bool)

(declare-fun e!14256 () ListLongMap!555)

(assert (=> b!21959 (= e!14256 e!14255)))

(declare-fun c!2630 () Bool)

(assert (=> b!21959 (= c!2630 (and (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21960 () Bool)

(declare-fun e!14249 () Bool)

(assert (=> b!21960 (= e!14253 e!14249)))

(declare-fun res!13971 () Bool)

(declare-fun call!1516 () Bool)

(assert (=> b!21960 (= res!13971 call!1516)))

(assert (=> b!21960 (=> (not res!13971) (not e!14249))))

(declare-fun b!21961 () Bool)

(assert (=> b!21961 (= e!14253 (not call!1516))))

(declare-fun b!21962 () Bool)

(assert (=> b!21962 (= e!14249 (= (apply!28 lt!7161 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 lt!6656)))))

(declare-fun bm!1512 () Bool)

(assert (=> bm!1512 (= call!1516 (contains!225 lt!7161 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21951 () Bool)

(assert (=> b!21951 (= e!14248 e!14246)))

(declare-fun res!13977 () Bool)

(assert (=> b!21951 (=> (not res!13977) (not e!14246))))

(assert (=> b!21951 (= res!13977 (contains!225 lt!7161 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)))))

(assert (=> b!21951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(declare-fun d!3823 () Bool)

(assert (=> d!3823 e!14247))

(declare-fun res!13973 () Bool)

(assert (=> d!3823 (=> (not res!13973) (not e!14247))))

(assert (=> d!3823 (= res!13973 (or (bvsge #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))))

(declare-fun lt!7153 () ListLongMap!555)

(assert (=> d!3823 (= lt!7161 lt!7153)))

(declare-fun lt!7164 () Unit!459)

(assert (=> d!3823 (= lt!7164 e!14254)))

(declare-fun c!2627 () Bool)

(assert (=> d!3823 (= c!2627 e!14250)))

(declare-fun res!13978 () Bool)

(assert (=> d!3823 (=> (not res!13978) (not e!14250))))

(assert (=> d!3823 (= res!13978 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(assert (=> d!3823 (= lt!7153 e!14256)))

(declare-fun c!2626 () Bool)

(assert (=> d!3823 (= c!2626 (and (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3823 (validMask!0 (mask!4691 lt!6656))))

(assert (=> d!3823 (= (getCurrentListMap!124 (_keys!3139 lt!6656) (ite (or c!2501 c!2500) (_values!1707 lt!6656) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (index!2329 lt!6777) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656)))) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) lt!7161)))

(declare-fun b!21963 () Bool)

(assert (=> b!21963 (= e!14258 e!14252)))

(declare-fun res!13974 () Bool)

(assert (=> b!21963 (= res!13974 call!1511)))

(assert (=> b!21963 (=> (not res!13974) (not e!14252))))

(declare-fun b!21964 () Bool)

(assert (=> b!21964 (= e!14257 call!1514)))

(declare-fun b!21965 () Bool)

(declare-fun Unit!481 () Unit!459)

(assert (=> b!21965 (= e!14254 Unit!481)))

(declare-fun bm!1513 () Bool)

(assert (=> bm!1513 (= call!1513 (+!42 (ite c!2626 call!1515 (ite c!2630 call!1510 call!1514)) (ite (or c!2626 c!2630) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 lt!6656)) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 lt!6656)))))))

(declare-fun b!21966 () Bool)

(assert (=> b!21966 (= e!14256 (+!42 call!1513 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 lt!6656))))))

(declare-fun b!21967 () Bool)

(declare-fun c!2629 () Bool)

(assert (=> b!21967 (= c!2629 (and (not (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 lt!6656) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21967 (= e!14255 e!14257)))

(assert (= (and d!3823 c!2626) b!21966))

(assert (= (and d!3823 (not c!2626)) b!21959))

(assert (= (and b!21959 c!2630) b!21958))

(assert (= (and b!21959 (not c!2630)) b!21967))

(assert (= (and b!21967 c!2629) b!21956))

(assert (= (and b!21967 (not c!2629)) b!21964))

(assert (= (or b!21956 b!21964) bm!1507))

(assert (= (or b!21958 bm!1507) bm!1508))

(assert (= (or b!21958 b!21956) bm!1510))

(assert (= (or b!21966 bm!1508) bm!1509))

(assert (= (or b!21966 bm!1510) bm!1513))

(assert (= (and d!3823 res!13978) b!21949))

(assert (= (and d!3823 c!2627) b!21950))

(assert (= (and d!3823 (not c!2627)) b!21965))

(assert (= (and d!3823 res!13973) b!21955))

(assert (= (and b!21955 res!13976) b!21954))

(assert (= (and b!21955 (not res!13970)) b!21951))

(assert (= (and b!21951 res!13977) b!21947))

(assert (= (and b!21955 res!13972) b!21953))

(assert (= (and b!21953 c!2628) b!21963))

(assert (= (and b!21953 (not c!2628)) b!21957))

(assert (= (and b!21963 res!13974) b!21948))

(assert (= (or b!21963 b!21957) bm!1511))

(assert (= (and b!21953 res!13975) b!21952))

(assert (= (and b!21952 c!2631) b!21960))

(assert (= (and b!21952 (not c!2631)) b!21961))

(assert (= (and b!21960 res!13971) b!21962))

(assert (= (or b!21960 b!21961) bm!1512))

(declare-fun b_lambda!1531 () Bool)

(assert (=> (not b_lambda!1531) (not b!21947)))

(assert (=> b!21947 t!3214))

(declare-fun b_and!1437 () Bool)

(assert (= b_and!1435 (and (=> t!3214 result!1069) b_and!1437)))

(declare-fun m!15583 () Bool)

(assert (=> b!21962 m!15583))

(declare-fun m!15585 () Bool)

(assert (=> b!21950 m!15585))

(declare-fun m!15587 () Bool)

(assert (=> b!21950 m!15587))

(declare-fun m!15589 () Bool)

(assert (=> b!21950 m!15589))

(declare-fun m!15591 () Bool)

(assert (=> b!21950 m!15591))

(declare-fun m!15593 () Bool)

(assert (=> b!21950 m!15593))

(declare-fun m!15595 () Bool)

(assert (=> b!21950 m!15595))

(declare-fun m!15597 () Bool)

(assert (=> b!21950 m!15597))

(declare-fun m!15599 () Bool)

(assert (=> b!21950 m!15599))

(declare-fun m!15601 () Bool)

(assert (=> b!21950 m!15601))

(assert (=> b!21950 m!15599))

(declare-fun m!15603 () Bool)

(assert (=> b!21950 m!15603))

(declare-fun m!15605 () Bool)

(assert (=> b!21950 m!15605))

(declare-fun m!15607 () Bool)

(assert (=> b!21950 m!15607))

(assert (=> b!21950 m!15595))

(assert (=> b!21950 m!15591))

(declare-fun m!15609 () Bool)

(assert (=> b!21950 m!15609))

(declare-fun m!15611 () Bool)

(assert (=> b!21950 m!15611))

(assert (=> b!21950 m!15609))

(assert (=> b!21950 m!15241))

(declare-fun m!15613 () Bool)

(assert (=> b!21950 m!15613))

(declare-fun m!15615 () Bool)

(assert (=> b!21950 m!15615))

(assert (=> bm!1509 m!15589))

(declare-fun m!15617 () Bool)

(assert (=> bm!1512 m!15617))

(declare-fun m!15619 () Bool)

(assert (=> b!21966 m!15619))

(assert (=> b!21954 m!15241))

(assert (=> b!21954 m!15241))

(assert (=> b!21954 m!15251))

(assert (=> b!21949 m!15241))

(assert (=> b!21949 m!15241))

(assert (=> b!21949 m!15251))

(assert (=> d!3823 m!15131))

(assert (=> b!21951 m!15241))

(assert (=> b!21951 m!15241))

(declare-fun m!15621 () Bool)

(assert (=> b!21951 m!15621))

(declare-fun m!15623 () Bool)

(assert (=> bm!1513 m!15623))

(declare-fun m!15625 () Bool)

(assert (=> bm!1511 m!15625))

(declare-fun m!15627 () Bool)

(assert (=> b!21948 m!15627))

(declare-fun m!15629 () Bool)

(assert (=> b!21947 m!15629))

(assert (=> b!21947 m!15629))

(assert (=> b!21947 m!15263))

(declare-fun m!15631 () Bool)

(assert (=> b!21947 m!15631))

(assert (=> b!21947 m!15263))

(assert (=> b!21947 m!15241))

(declare-fun m!15633 () Bool)

(assert (=> b!21947 m!15633))

(assert (=> b!21947 m!15241))

(assert (=> bm!1414 d!3823))

(declare-fun bm!1514 () Bool)

(declare-fun call!1521 () ListLongMap!555)

(declare-fun call!1517 () ListLongMap!555)

(assert (=> bm!1514 (= call!1521 call!1517)))

(declare-fun lt!7183 () ListLongMap!555)

(declare-fun b!21968 () Bool)

(declare-fun e!14259 () Bool)

(assert (=> b!21968 (= e!14259 (= (apply!28 lt!7183 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)) (get!377 (select (arr!572 (ite c!2501 (_values!1707 lt!6656) lt!6762)) #b00000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 lt!6656) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21968 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (ite c!2501 (_values!1707 lt!6656) lt!6762))))))

(assert (=> b!21968 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(declare-fun e!14265 () Bool)

(declare-fun b!21969 () Bool)

(assert (=> b!21969 (= e!14265 (= (apply!28 lt!7183 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656))))))

(declare-fun bm!1515 () Bool)

(declare-fun call!1522 () ListLongMap!555)

(assert (=> bm!1515 (= call!1517 call!1522)))

(declare-fun b!21970 () Bool)

(declare-fun e!14263 () Bool)

(assert (=> b!21970 (= e!14263 (validKeyInArray!0 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)))))

(declare-fun b!21971 () Bool)

(declare-fun e!14267 () Unit!459)

(declare-fun lt!7174 () Unit!459)

(assert (=> b!21971 (= e!14267 lt!7174)))

(declare-fun lt!7176 () ListLongMap!555)

(assert (=> b!21971 (= lt!7176 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (ite c!2501 (_values!1707 lt!6656) lt!6762) (mask!4691 lt!6656) (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)) (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7170 () (_ BitVec 64))

(assert (=> b!21971 (= lt!7170 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7169 () (_ BitVec 64))

(assert (=> b!21971 (= lt!7169 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(declare-fun lt!7172 () Unit!459)

(assert (=> b!21971 (= lt!7172 (addStillContains!13 lt!7176 lt!7170 (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)) lt!7169))))

(assert (=> b!21971 (contains!225 (+!42 lt!7176 (tuple2!903 lt!7170 (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)))) lt!7169)))

(declare-fun lt!7180 () Unit!459)

(assert (=> b!21971 (= lt!7180 lt!7172)))

(declare-fun lt!7173 () ListLongMap!555)

(assert (=> b!21971 (= lt!7173 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (ite c!2501 (_values!1707 lt!6656) lt!6762) (mask!4691 lt!6656) (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)) (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7167 () (_ BitVec 64))

(assert (=> b!21971 (= lt!7167 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7179 () (_ BitVec 64))

(assert (=> b!21971 (= lt!7179 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(declare-fun lt!7181 () Unit!459)

(assert (=> b!21971 (= lt!7181 (addApplyDifferent!13 lt!7173 lt!7167 (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)) lt!7179))))

(assert (=> b!21971 (= (apply!28 (+!42 lt!7173 (tuple2!903 lt!7167 (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)))) lt!7179) (apply!28 lt!7173 lt!7179))))

(declare-fun lt!7187 () Unit!459)

(assert (=> b!21971 (= lt!7187 lt!7181)))

(declare-fun lt!7171 () ListLongMap!555)

(assert (=> b!21971 (= lt!7171 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (ite c!2501 (_values!1707 lt!6656) lt!6762) (mask!4691 lt!6656) (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)) (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7168 () (_ BitVec 64))

(assert (=> b!21971 (= lt!7168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7166 () (_ BitVec 64))

(assert (=> b!21971 (= lt!7166 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(declare-fun lt!7178 () Unit!459)

(assert (=> b!21971 (= lt!7178 (addApplyDifferent!13 lt!7171 lt!7168 (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)) lt!7166))))

(assert (=> b!21971 (= (apply!28 (+!42 lt!7171 (tuple2!903 lt!7168 (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)))) lt!7166) (apply!28 lt!7171 lt!7166))))

(declare-fun lt!7177 () Unit!459)

(assert (=> b!21971 (= lt!7177 lt!7178)))

(declare-fun lt!7184 () ListLongMap!555)

(assert (=> b!21971 (= lt!7184 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (ite c!2501 (_values!1707 lt!6656) lt!6762) (mask!4691 lt!6656) (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)) (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7182 () (_ BitVec 64))

(assert (=> b!21971 (= lt!7182 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7185 () (_ BitVec 64))

(assert (=> b!21971 (= lt!7185 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000))))

(assert (=> b!21971 (= lt!7174 (addApplyDifferent!13 lt!7184 lt!7182 (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)) lt!7185))))

(assert (=> b!21971 (= (apply!28 (+!42 lt!7184 (tuple2!903 lt!7182 (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)))) lt!7185) (apply!28 lt!7184 lt!7185))))

(declare-fun bm!1516 () Bool)

(assert (=> bm!1516 (= call!1522 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6656) (ite c!2501 (_values!1707 lt!6656) lt!6762) (mask!4691 lt!6656) (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)) (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun b!21973 () Bool)

(declare-fun e!14260 () Bool)

(declare-fun e!14266 () Bool)

(assert (=> b!21973 (= e!14260 e!14266)))

(declare-fun c!2637 () Bool)

(assert (=> b!21973 (= c!2637 (not (= (bvand (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1517 () Bool)

(declare-fun call!1519 () ListLongMap!555)

(declare-fun call!1520 () ListLongMap!555)

(assert (=> bm!1517 (= call!1519 call!1520)))

(declare-fun b!21974 () Bool)

(declare-fun res!13984 () Bool)

(assert (=> b!21974 (=> (not res!13984) (not e!14260))))

(declare-fun e!14271 () Bool)

(assert (=> b!21974 (= res!13984 e!14271)))

(declare-fun c!2634 () Bool)

(assert (=> b!21974 (= c!2634 (not (= (bvand (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!1518 () Bool)

(declare-fun call!1518 () Bool)

(assert (=> bm!1518 (= call!1518 (contains!225 lt!7183 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21975 () Bool)

(declare-fun e!14264 () Bool)

(assert (=> b!21975 (= e!14264 (validKeyInArray!0 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)))))

(declare-fun b!21976 () Bool)

(declare-fun res!13981 () Bool)

(assert (=> b!21976 (=> (not res!13981) (not e!14260))))

(declare-fun e!14261 () Bool)

(assert (=> b!21976 (= res!13981 e!14261)))

(declare-fun res!13979 () Bool)

(assert (=> b!21976 (=> res!13979 e!14261)))

(assert (=> b!21976 (= res!13979 (not e!14264))))

(declare-fun res!13985 () Bool)

(assert (=> b!21976 (=> (not res!13985) (not e!14264))))

(assert (=> b!21976 (= res!13985 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(declare-fun b!21977 () Bool)

(declare-fun e!14270 () ListLongMap!555)

(assert (=> b!21977 (= e!14270 call!1519)))

(declare-fun b!21978 () Bool)

(assert (=> b!21978 (= e!14271 (not call!1518))))

(declare-fun b!21979 () Bool)

(declare-fun e!14268 () ListLongMap!555)

(assert (=> b!21979 (= e!14268 call!1519)))

(declare-fun b!21980 () Bool)

(declare-fun e!14269 () ListLongMap!555)

(assert (=> b!21980 (= e!14269 e!14268)))

(declare-fun c!2636 () Bool)

(assert (=> b!21980 (= c!2636 (and (not (= (bvand (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21981 () Bool)

(declare-fun e!14262 () Bool)

(assert (=> b!21981 (= e!14266 e!14262)))

(declare-fun res!13980 () Bool)

(declare-fun call!1523 () Bool)

(assert (=> b!21981 (= res!13980 call!1523)))

(assert (=> b!21981 (=> (not res!13980) (not e!14262))))

(declare-fun b!21982 () Bool)

(assert (=> b!21982 (= e!14266 (not call!1523))))

(declare-fun b!21983 () Bool)

(assert (=> b!21983 (= e!14262 (= (apply!28 lt!7183 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656))))))

(declare-fun bm!1519 () Bool)

(assert (=> bm!1519 (= call!1523 (contains!225 lt!7183 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21972 () Bool)

(assert (=> b!21972 (= e!14261 e!14259)))

(declare-fun res!13986 () Bool)

(assert (=> b!21972 (=> (not res!13986) (not e!14259))))

(assert (=> b!21972 (= res!13986 (contains!225 lt!7183 (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000)))))

(assert (=> b!21972 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(declare-fun d!3825 () Bool)

(assert (=> d!3825 e!14260))

(declare-fun res!13982 () Bool)

(assert (=> d!3825 (=> (not res!13982) (not e!14260))))

(assert (=> d!3825 (= res!13982 (or (bvsge #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))))

(declare-fun lt!7175 () ListLongMap!555)

(assert (=> d!3825 (= lt!7183 lt!7175)))

(declare-fun lt!7186 () Unit!459)

(assert (=> d!3825 (= lt!7186 e!14267)))

(declare-fun c!2633 () Bool)

(assert (=> d!3825 (= c!2633 e!14263)))

(declare-fun res!13987 () Bool)

(assert (=> d!3825 (=> (not res!13987) (not e!14263))))

(assert (=> d!3825 (= res!13987 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))))))

(assert (=> d!3825 (= lt!7175 e!14269)))

(declare-fun c!2632 () Bool)

(assert (=> d!3825 (= c!2632 (and (not (= (bvand (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3825 (validMask!0 (mask!4691 lt!6656))))

(assert (=> d!3825 (= (getCurrentListMap!124 (_keys!3139 lt!6656) (ite c!2501 (_values!1707 lt!6656) lt!6762) (mask!4691 lt!6656) (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656)) (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) lt!7183)))

(declare-fun b!21984 () Bool)

(assert (=> b!21984 (= e!14271 e!14265)))

(declare-fun res!13983 () Bool)

(assert (=> b!21984 (= res!13983 call!1518)))

(assert (=> b!21984 (=> (not res!13983) (not e!14265))))

(declare-fun b!21985 () Bool)

(assert (=> b!21985 (= e!14270 call!1521)))

(declare-fun b!21986 () Bool)

(declare-fun Unit!482 () Unit!459)

(assert (=> b!21986 (= e!14267 Unit!482)))

(declare-fun bm!1520 () Bool)

(assert (=> bm!1520 (= call!1520 (+!42 (ite c!2632 call!1522 (ite c!2636 call!1517 call!1521)) (ite (or c!2632 c!2636) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!2501 c!2504) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (zeroValue!1645 lt!6656))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656))))))))

(declare-fun b!21987 () Bool)

(assert (=> b!21987 (= e!14269 (+!42 call!1520 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2501 (ite c!2504 (minValue!1645 lt!6656) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (minValue!1645 lt!6656)))))))

(declare-fun c!2635 () Bool)

(declare-fun b!21988 () Bool)

(assert (=> b!21988 (= c!2635 (and (not (= (bvand (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!2501 (ite c!2504 lt!6771 lt!6774) (extraKeys!1621 lt!6656)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21988 (= e!14268 e!14270)))

(assert (= (and d!3825 c!2632) b!21987))

(assert (= (and d!3825 (not c!2632)) b!21980))

(assert (= (and b!21980 c!2636) b!21979))

(assert (= (and b!21980 (not c!2636)) b!21988))

(assert (= (and b!21988 c!2635) b!21977))

(assert (= (and b!21988 (not c!2635)) b!21985))

(assert (= (or b!21977 b!21985) bm!1514))

(assert (= (or b!21979 bm!1514) bm!1515))

(assert (= (or b!21979 b!21977) bm!1517))

(assert (= (or b!21987 bm!1515) bm!1516))

(assert (= (or b!21987 bm!1517) bm!1520))

(assert (= (and d!3825 res!13987) b!21970))

(assert (= (and d!3825 c!2633) b!21971))

(assert (= (and d!3825 (not c!2633)) b!21986))

(assert (= (and d!3825 res!13982) b!21976))

(assert (= (and b!21976 res!13985) b!21975))

(assert (= (and b!21976 (not res!13979)) b!21972))

(assert (= (and b!21972 res!13986) b!21968))

(assert (= (and b!21976 res!13981) b!21974))

(assert (= (and b!21974 c!2634) b!21984))

(assert (= (and b!21974 (not c!2634)) b!21978))

(assert (= (and b!21984 res!13983) b!21969))

(assert (= (or b!21984 b!21978) bm!1518))

(assert (= (and b!21974 res!13984) b!21973))

(assert (= (and b!21973 c!2637) b!21981))

(assert (= (and b!21973 (not c!2637)) b!21982))

(assert (= (and b!21981 res!13980) b!21983))

(assert (= (or b!21981 b!21982) bm!1519))

(declare-fun b_lambda!1533 () Bool)

(assert (=> (not b_lambda!1533) (not b!21968)))

(assert (=> b!21968 t!3214))

(declare-fun b_and!1439 () Bool)

(assert (= b_and!1437 (and (=> t!3214 result!1069) b_and!1439)))

(declare-fun m!15635 () Bool)

(assert (=> b!21983 m!15635))

(declare-fun m!15637 () Bool)

(assert (=> b!21971 m!15637))

(declare-fun m!15639 () Bool)

(assert (=> b!21971 m!15639))

(declare-fun m!15641 () Bool)

(assert (=> b!21971 m!15641))

(declare-fun m!15643 () Bool)

(assert (=> b!21971 m!15643))

(declare-fun m!15645 () Bool)

(assert (=> b!21971 m!15645))

(declare-fun m!15647 () Bool)

(assert (=> b!21971 m!15647))

(declare-fun m!15649 () Bool)

(assert (=> b!21971 m!15649))

(declare-fun m!15651 () Bool)

(assert (=> b!21971 m!15651))

(declare-fun m!15653 () Bool)

(assert (=> b!21971 m!15653))

(assert (=> b!21971 m!15651))

(declare-fun m!15655 () Bool)

(assert (=> b!21971 m!15655))

(declare-fun m!15657 () Bool)

(assert (=> b!21971 m!15657))

(declare-fun m!15659 () Bool)

(assert (=> b!21971 m!15659))

(assert (=> b!21971 m!15647))

(assert (=> b!21971 m!15643))

(declare-fun m!15661 () Bool)

(assert (=> b!21971 m!15661))

(declare-fun m!15663 () Bool)

(assert (=> b!21971 m!15663))

(assert (=> b!21971 m!15661))

(assert (=> b!21971 m!15241))

(declare-fun m!15665 () Bool)

(assert (=> b!21971 m!15665))

(declare-fun m!15667 () Bool)

(assert (=> b!21971 m!15667))

(assert (=> bm!1516 m!15641))

(declare-fun m!15669 () Bool)

(assert (=> bm!1519 m!15669))

(declare-fun m!15671 () Bool)

(assert (=> b!21987 m!15671))

(assert (=> b!21975 m!15241))

(assert (=> b!21975 m!15241))

(assert (=> b!21975 m!15251))

(assert (=> b!21970 m!15241))

(assert (=> b!21970 m!15241))

(assert (=> b!21970 m!15251))

(assert (=> d!3825 m!15131))

(assert (=> b!21972 m!15241))

(assert (=> b!21972 m!15241))

(declare-fun m!15673 () Bool)

(assert (=> b!21972 m!15673))

(declare-fun m!15675 () Bool)

(assert (=> bm!1520 m!15675))

(declare-fun m!15677 () Bool)

(assert (=> bm!1518 m!15677))

(declare-fun m!15679 () Bool)

(assert (=> b!21969 m!15679))

(declare-fun m!15681 () Bool)

(assert (=> b!21968 m!15681))

(assert (=> b!21968 m!15681))

(assert (=> b!21968 m!15263))

(declare-fun m!15683 () Bool)

(assert (=> b!21968 m!15683))

(assert (=> b!21968 m!15263))

(assert (=> b!21968 m!15241))

(declare-fun m!15685 () Bool)

(assert (=> b!21968 m!15685))

(assert (=> b!21968 m!15241))

(assert (=> bm!1400 d!3825))

(declare-fun bm!1521 () Bool)

(declare-fun call!1528 () ListLongMap!555)

(declare-fun call!1524 () ListLongMap!555)

(assert (=> bm!1521 (= call!1528 call!1524)))

(declare-fun lt!7205 () ListLongMap!555)

(declare-fun b!21989 () Bool)

(declare-fun e!14272 () Bool)

(assert (=> b!21989 (= e!14272 (= (apply!28 lt!7205 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)) (get!377 (select (arr!572 (ite (or c!2524 c!2523) (_values!1707 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655)))))) #b00000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 (_2!453 lt!6655)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21989 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (ite (or c!2524 c!2523) (_values!1707 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655))))))))))

(assert (=> b!21989 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun b!21990 () Bool)

(declare-fun e!14278 () Bool)

(assert (=> b!21990 (= e!14278 (= (apply!28 lt!7205 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 (_2!453 lt!6655))))))

(declare-fun bm!1522 () Bool)

(declare-fun call!1529 () ListLongMap!555)

(assert (=> bm!1522 (= call!1524 call!1529)))

(declare-fun b!21991 () Bool)

(declare-fun e!14276 () Bool)

(assert (=> b!21991 (= e!14276 (validKeyInArray!0 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun b!21992 () Bool)

(declare-fun e!14280 () Unit!459)

(declare-fun lt!7196 () Unit!459)

(assert (=> b!21992 (= e!14280 lt!7196)))

(declare-fun lt!7198 () ListLongMap!555)

(assert (=> b!21992 (= lt!7198 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (ite (or c!2524 c!2523) (_values!1707 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655))))) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7192 () (_ BitVec 64))

(assert (=> b!21992 (= lt!7192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7191 () (_ BitVec 64))

(assert (=> b!21992 (= lt!7191 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7194 () Unit!459)

(assert (=> b!21992 (= lt!7194 (addStillContains!13 lt!7198 lt!7192 (zeroValue!1645 (_2!453 lt!6655)) lt!7191))))

(assert (=> b!21992 (contains!225 (+!42 lt!7198 (tuple2!903 lt!7192 (zeroValue!1645 (_2!453 lt!6655)))) lt!7191)))

(declare-fun lt!7202 () Unit!459)

(assert (=> b!21992 (= lt!7202 lt!7194)))

(declare-fun lt!7195 () ListLongMap!555)

(assert (=> b!21992 (= lt!7195 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (ite (or c!2524 c!2523) (_values!1707 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655))))) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7189 () (_ BitVec 64))

(assert (=> b!21992 (= lt!7189 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7201 () (_ BitVec 64))

(assert (=> b!21992 (= lt!7201 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7203 () Unit!459)

(assert (=> b!21992 (= lt!7203 (addApplyDifferent!13 lt!7195 lt!7189 (minValue!1645 (_2!453 lt!6655)) lt!7201))))

(assert (=> b!21992 (= (apply!28 (+!42 lt!7195 (tuple2!903 lt!7189 (minValue!1645 (_2!453 lt!6655)))) lt!7201) (apply!28 lt!7195 lt!7201))))

(declare-fun lt!7209 () Unit!459)

(assert (=> b!21992 (= lt!7209 lt!7203)))

(declare-fun lt!7193 () ListLongMap!555)

(assert (=> b!21992 (= lt!7193 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (ite (or c!2524 c!2523) (_values!1707 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655))))) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7190 () (_ BitVec 64))

(assert (=> b!21992 (= lt!7190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7188 () (_ BitVec 64))

(assert (=> b!21992 (= lt!7188 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7200 () Unit!459)

(assert (=> b!21992 (= lt!7200 (addApplyDifferent!13 lt!7193 lt!7190 (zeroValue!1645 (_2!453 lt!6655)) lt!7188))))

(assert (=> b!21992 (= (apply!28 (+!42 lt!7193 (tuple2!903 lt!7190 (zeroValue!1645 (_2!453 lt!6655)))) lt!7188) (apply!28 lt!7193 lt!7188))))

(declare-fun lt!7199 () Unit!459)

(assert (=> b!21992 (= lt!7199 lt!7200)))

(declare-fun lt!7206 () ListLongMap!555)

(assert (=> b!21992 (= lt!7206 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (ite (or c!2524 c!2523) (_values!1707 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655))))) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7204 () (_ BitVec 64))

(assert (=> b!21992 (= lt!7204 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7207 () (_ BitVec 64))

(assert (=> b!21992 (= lt!7207 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000))))

(assert (=> b!21992 (= lt!7196 (addApplyDifferent!13 lt!7206 lt!7204 (minValue!1645 (_2!453 lt!6655)) lt!7207))))

(assert (=> b!21992 (= (apply!28 (+!42 lt!7206 (tuple2!903 lt!7204 (minValue!1645 (_2!453 lt!6655)))) lt!7207) (apply!28 lt!7206 lt!7207))))

(declare-fun bm!1523 () Bool)

(assert (=> bm!1523 (= call!1529 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (_2!453 lt!6655)) (ite (or c!2524 c!2523) (_values!1707 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655))))) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun b!21994 () Bool)

(declare-fun e!14273 () Bool)

(declare-fun e!14279 () Bool)

(assert (=> b!21994 (= e!14273 e!14279)))

(declare-fun c!2643 () Bool)

(assert (=> b!21994 (= c!2643 (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1524 () Bool)

(declare-fun call!1526 () ListLongMap!555)

(declare-fun call!1527 () ListLongMap!555)

(assert (=> bm!1524 (= call!1526 call!1527)))

(declare-fun b!21995 () Bool)

(declare-fun res!13993 () Bool)

(assert (=> b!21995 (=> (not res!13993) (not e!14273))))

(declare-fun e!14284 () Bool)

(assert (=> b!21995 (= res!13993 e!14284)))

(declare-fun c!2640 () Bool)

(assert (=> b!21995 (= c!2640 (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!1525 () Bool)

(declare-fun call!1525 () Bool)

(assert (=> bm!1525 (= call!1525 (contains!225 lt!7205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21996 () Bool)

(declare-fun e!14277 () Bool)

(assert (=> b!21996 (= e!14277 (validKeyInArray!0 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun b!21997 () Bool)

(declare-fun res!13990 () Bool)

(assert (=> b!21997 (=> (not res!13990) (not e!14273))))

(declare-fun e!14274 () Bool)

(assert (=> b!21997 (= res!13990 e!14274)))

(declare-fun res!13988 () Bool)

(assert (=> b!21997 (=> res!13988 e!14274)))

(assert (=> b!21997 (= res!13988 (not e!14277))))

(declare-fun res!13994 () Bool)

(assert (=> b!21997 (=> (not res!13994) (not e!14277))))

(assert (=> b!21997 (= res!13994 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun b!21998 () Bool)

(declare-fun e!14283 () ListLongMap!555)

(assert (=> b!21998 (= e!14283 call!1526)))

(declare-fun b!21999 () Bool)

(assert (=> b!21999 (= e!14284 (not call!1525))))

(declare-fun b!22000 () Bool)

(declare-fun e!14281 () ListLongMap!555)

(assert (=> b!22000 (= e!14281 call!1526)))

(declare-fun b!22001 () Bool)

(declare-fun e!14282 () ListLongMap!555)

(assert (=> b!22001 (= e!14282 e!14281)))

(declare-fun c!2642 () Bool)

(assert (=> b!22001 (= c!2642 (and (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22002 () Bool)

(declare-fun e!14275 () Bool)

(assert (=> b!22002 (= e!14279 e!14275)))

(declare-fun res!13989 () Bool)

(declare-fun call!1530 () Bool)

(assert (=> b!22002 (= res!13989 call!1530)))

(assert (=> b!22002 (=> (not res!13989) (not e!14275))))

(declare-fun b!22003 () Bool)

(assert (=> b!22003 (= e!14279 (not call!1530))))

(declare-fun b!22004 () Bool)

(assert (=> b!22004 (= e!14275 (= (apply!28 lt!7205 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 (_2!453 lt!6655))))))

(declare-fun bm!1526 () Bool)

(assert (=> bm!1526 (= call!1530 (contains!225 lt!7205 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21993 () Bool)

(assert (=> b!21993 (= e!14274 e!14272)))

(declare-fun res!13995 () Bool)

(assert (=> b!21993 (=> (not res!13995) (not e!14272))))

(assert (=> b!21993 (= res!13995 (contains!225 lt!7205 (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000)))))

(assert (=> b!21993 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun d!3827 () Bool)

(assert (=> d!3827 e!14273))

(declare-fun res!13991 () Bool)

(assert (=> d!3827 (=> (not res!13991) (not e!14273))))

(assert (=> d!3827 (= res!13991 (or (bvsge #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))))

(declare-fun lt!7197 () ListLongMap!555)

(assert (=> d!3827 (= lt!7205 lt!7197)))

(declare-fun lt!7208 () Unit!459)

(assert (=> d!3827 (= lt!7208 e!14280)))

(declare-fun c!2639 () Bool)

(assert (=> d!3827 (= c!2639 e!14276)))

(declare-fun res!13996 () Bool)

(assert (=> d!3827 (=> (not res!13996) (not e!14276))))

(assert (=> d!3827 (= res!13996 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(assert (=> d!3827 (= lt!7197 e!14282)))

(declare-fun c!2638 () Bool)

(assert (=> d!3827 (= c!2638 (and (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3827 (validMask!0 (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3827 (= (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (ite (or c!2524 c!2523) (_values!1707 (_2!453 lt!6655)) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (index!2329 lt!6879) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655))))) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) lt!7205)))

(declare-fun b!22005 () Bool)

(assert (=> b!22005 (= e!14284 e!14278)))

(declare-fun res!13992 () Bool)

(assert (=> b!22005 (= res!13992 call!1525)))

(assert (=> b!22005 (=> (not res!13992) (not e!14278))))

(declare-fun b!22006 () Bool)

(assert (=> b!22006 (= e!14283 call!1528)))

(declare-fun b!22007 () Bool)

(declare-fun Unit!483 () Unit!459)

(assert (=> b!22007 (= e!14280 Unit!483)))

(declare-fun bm!1527 () Bool)

(assert (=> bm!1527 (= call!1527 (+!42 (ite c!2638 call!1529 (ite c!2642 call!1524 call!1528)) (ite (or c!2638 c!2642) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (_2!453 lt!6655))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (_2!453 lt!6655))))))))

(declare-fun b!22008 () Bool)

(assert (=> b!22008 (= e!14282 (+!42 call!1527 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (_2!453 lt!6655)))))))

(declare-fun b!22009 () Bool)

(declare-fun c!2641 () Bool)

(assert (=> b!22009 (= c!2641 (and (not (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (_2!453 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!22009 (= e!14281 e!14283)))

(assert (= (and d!3827 c!2638) b!22008))

(assert (= (and d!3827 (not c!2638)) b!22001))

(assert (= (and b!22001 c!2642) b!22000))

(assert (= (and b!22001 (not c!2642)) b!22009))

(assert (= (and b!22009 c!2641) b!21998))

(assert (= (and b!22009 (not c!2641)) b!22006))

(assert (= (or b!21998 b!22006) bm!1521))

(assert (= (or b!22000 bm!1521) bm!1522))

(assert (= (or b!22000 b!21998) bm!1524))

(assert (= (or b!22008 bm!1522) bm!1523))

(assert (= (or b!22008 bm!1524) bm!1527))

(assert (= (and d!3827 res!13996) b!21991))

(assert (= (and d!3827 c!2639) b!21992))

(assert (= (and d!3827 (not c!2639)) b!22007))

(assert (= (and d!3827 res!13991) b!21997))

(assert (= (and b!21997 res!13994) b!21996))

(assert (= (and b!21997 (not res!13988)) b!21993))

(assert (= (and b!21993 res!13995) b!21989))

(assert (= (and b!21997 res!13990) b!21995))

(assert (= (and b!21995 c!2640) b!22005))

(assert (= (and b!21995 (not c!2640)) b!21999))

(assert (= (and b!22005 res!13992) b!21990))

(assert (= (or b!22005 b!21999) bm!1525))

(assert (= (and b!21995 res!13993) b!21994))

(assert (= (and b!21994 c!2643) b!22002))

(assert (= (and b!21994 (not c!2643)) b!22003))

(assert (= (and b!22002 res!13989) b!22004))

(assert (= (or b!22002 b!22003) bm!1526))

(declare-fun b_lambda!1535 () Bool)

(assert (=> (not b_lambda!1535) (not b!21989)))

(assert (=> b!21989 t!3216))

(declare-fun b_and!1441 () Bool)

(assert (= b_and!1439 (and (=> t!3216 result!1071) b_and!1441)))

(declare-fun m!15687 () Bool)

(assert (=> b!22004 m!15687))

(declare-fun m!15689 () Bool)

(assert (=> b!21992 m!15689))

(declare-fun m!15691 () Bool)

(assert (=> b!21992 m!15691))

(declare-fun m!15693 () Bool)

(assert (=> b!21992 m!15693))

(declare-fun m!15695 () Bool)

(assert (=> b!21992 m!15695))

(declare-fun m!15697 () Bool)

(assert (=> b!21992 m!15697))

(declare-fun m!15699 () Bool)

(assert (=> b!21992 m!15699))

(declare-fun m!15701 () Bool)

(assert (=> b!21992 m!15701))

(declare-fun m!15703 () Bool)

(assert (=> b!21992 m!15703))

(declare-fun m!15705 () Bool)

(assert (=> b!21992 m!15705))

(assert (=> b!21992 m!15703))

(declare-fun m!15707 () Bool)

(assert (=> b!21992 m!15707))

(declare-fun m!15709 () Bool)

(assert (=> b!21992 m!15709))

(declare-fun m!15711 () Bool)

(assert (=> b!21992 m!15711))

(assert (=> b!21992 m!15699))

(assert (=> b!21992 m!15695))

(declare-fun m!15713 () Bool)

(assert (=> b!21992 m!15713))

(declare-fun m!15715 () Bool)

(assert (=> b!21992 m!15715))

(assert (=> b!21992 m!15713))

(assert (=> b!21992 m!15317))

(declare-fun m!15717 () Bool)

(assert (=> b!21992 m!15717))

(declare-fun m!15719 () Bool)

(assert (=> b!21992 m!15719))

(assert (=> bm!1523 m!15693))

(declare-fun m!15721 () Bool)

(assert (=> bm!1526 m!15721))

(declare-fun m!15723 () Bool)

(assert (=> b!22008 m!15723))

(assert (=> b!21996 m!15317))

(assert (=> b!21996 m!15317))

(assert (=> b!21996 m!15327))

(assert (=> b!21991 m!15317))

(assert (=> b!21991 m!15317))

(assert (=> b!21991 m!15327))

(assert (=> d!3827 m!15143))

(assert (=> b!21993 m!15317))

(assert (=> b!21993 m!15317))

(declare-fun m!15725 () Bool)

(assert (=> b!21993 m!15725))

(declare-fun m!15727 () Bool)

(assert (=> bm!1527 m!15727))

(declare-fun m!15729 () Bool)

(assert (=> bm!1525 m!15729))

(declare-fun m!15731 () Bool)

(assert (=> b!21990 m!15731))

(declare-fun m!15733 () Bool)

(assert (=> b!21989 m!15733))

(assert (=> b!21989 m!15733))

(assert (=> b!21989 m!15339))

(declare-fun m!15735 () Bool)

(assert (=> b!21989 m!15735))

(assert (=> b!21989 m!15339))

(assert (=> b!21989 m!15317))

(declare-fun m!15737 () Bool)

(assert (=> b!21989 m!15737))

(assert (=> b!21989 m!15317))

(assert (=> bm!1438 d!3827))

(declare-fun d!3829 () Bool)

(declare-fun res!14001 () Bool)

(declare-fun e!14289 () Bool)

(assert (=> d!3829 (=> res!14001 e!14289)))

(assert (=> d!3829 (= res!14001 (= (select (arr!573 lt!6835) #b00000000000000000000000000000000) (_1!454 lt!6831)))))

(assert (=> d!3829 (= (arrayContainsKey!0 lt!6835 (_1!454 lt!6831) #b00000000000000000000000000000000) e!14289)))

(declare-fun b!22014 () Bool)

(declare-fun e!14290 () Bool)

(assert (=> b!22014 (= e!14289 e!14290)))

(declare-fun res!14002 () Bool)

(assert (=> b!22014 (=> (not res!14002) (not e!14290))))

(assert (=> b!22014 (= res!14002 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!666 lt!6835)))))

(declare-fun b!22015 () Bool)

(assert (=> b!22015 (= e!14290 (arrayContainsKey!0 lt!6835 (_1!454 lt!6831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3829 (not res!14001)) b!22014))

(assert (= (and b!22014 res!14002) b!22015))

(declare-fun m!15739 () Bool)

(assert (=> d!3829 m!15739))

(declare-fun m!15741 () Bool)

(assert (=> b!22015 m!15741))

(assert (=> b!21543 d!3829))

(declare-fun d!3831 () Bool)

(declare-fun e!14291 () Bool)

(assert (=> d!3831 e!14291))

(declare-fun res!14004 () Bool)

(assert (=> d!3831 (=> (not res!14004) (not e!14291))))

(declare-fun lt!7211 () ListLongMap!555)

(assert (=> d!3831 (= res!14004 (contains!225 lt!7211 (_1!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun lt!7213 () List!557)

(assert (=> d!3831 (= lt!7211 (ListLongMap!556 lt!7213))))

(declare-fun lt!7212 () Unit!459)

(declare-fun lt!7210 () Unit!459)

(assert (=> d!3831 (= lt!7212 lt!7210)))

(assert (=> d!3831 (= (getValueByKey!59 lt!7213 (_1!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3831 (= lt!7210 (lemmaContainsTupThenGetReturnValue!17 lt!7213 (_1!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3831 (= lt!7213 (insertStrictlySorted!17 (toList!293 call!1435) (_1!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3831 (= (+!42 call!1435 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!7211)))

(declare-fun b!22016 () Bool)

(declare-fun res!14003 () Bool)

(assert (=> b!22016 (=> (not res!14003) (not e!14291))))

(assert (=> b!22016 (= res!14003 (= (getValueByKey!59 (toList!293 lt!7211) (_1!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun b!22017 () Bool)

(assert (=> b!22017 (= e!14291 (contains!227 (toList!293 lt!7211) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))

(assert (= (and d!3831 res!14004) b!22016))

(assert (= (and b!22016 res!14003) b!22017))

(declare-fun m!15743 () Bool)

(assert (=> d!3831 m!15743))

(declare-fun m!15745 () Bool)

(assert (=> d!3831 m!15745))

(declare-fun m!15747 () Bool)

(assert (=> d!3831 m!15747))

(declare-fun m!15749 () Bool)

(assert (=> d!3831 m!15749))

(declare-fun m!15751 () Bool)

(assert (=> b!22016 m!15751))

(declare-fun m!15753 () Bool)

(assert (=> b!22017 m!15753))

(assert (=> b!21594 d!3831))

(declare-fun b!22026 () Bool)

(declare-fun e!14299 () Bool)

(declare-fun call!1533 () Bool)

(assert (=> b!22026 (= e!14299 call!1533)))

(declare-fun bm!1530 () Bool)

(assert (=> bm!1530 (= call!1533 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3139 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654)))))))

(declare-fun b!22028 () Bool)

(declare-fun e!14300 () Bool)

(assert (=> b!22028 (= e!14300 e!14299)))

(declare-fun c!2646 () Bool)

(assert (=> b!22028 (= c!2646 (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000)))))

(declare-fun b!22029 () Bool)

(declare-fun e!14298 () Bool)

(assert (=> b!22029 (= e!14298 call!1533)))

(declare-fun d!3833 () Bool)

(declare-fun res!14010 () Bool)

(assert (=> d!3833 (=> res!14010 e!14300)))

(assert (=> d!3833 (= res!14010 (bvsge #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))))))

(assert (=> d!3833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654)))) e!14300)))

(declare-fun b!22027 () Bool)

(assert (=> b!22027 (= e!14299 e!14298)))

(declare-fun lt!7220 () (_ BitVec 64))

(assert (=> b!22027 (= lt!7220 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000))))

(declare-fun lt!7221 () Unit!459)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1209 (_ BitVec 64) (_ BitVec 32)) Unit!459)

(assert (=> b!22027 (= lt!7221 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3139 (v!1570 (_2!452 lt!6654))) lt!7220 #b00000000000000000000000000000000))))

(assert (=> b!22027 (arrayContainsKey!0 (_keys!3139 (v!1570 (_2!452 lt!6654))) lt!7220 #b00000000000000000000000000000000)))

(declare-fun lt!7222 () Unit!459)

(assert (=> b!22027 (= lt!7222 lt!7221)))

(declare-fun res!14009 () Bool)

(assert (=> b!22027 (= res!14009 (= (seekEntryOrOpen!0 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000) (_keys!3139 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654)))) (Found!52 #b00000000000000000000000000000000)))))

(assert (=> b!22027 (=> (not res!14009) (not e!14298))))

(assert (= (and d!3833 (not res!14010)) b!22028))

(assert (= (and b!22028 c!2646) b!22027))

(assert (= (and b!22028 (not c!2646)) b!22026))

(assert (= (and b!22027 res!14009) b!22029))

(assert (= (or b!22029 b!22026) bm!1530))

(declare-fun m!15755 () Bool)

(assert (=> bm!1530 m!15755))

(assert (=> b!22028 m!15173))

(assert (=> b!22028 m!15173))

(assert (=> b!22028 m!15177))

(assert (=> b!22027 m!15173))

(declare-fun m!15757 () Bool)

(assert (=> b!22027 m!15757))

(declare-fun m!15759 () Bool)

(assert (=> b!22027 m!15759))

(assert (=> b!22027 m!15173))

(declare-fun m!15761 () Bool)

(assert (=> b!22027 m!15761))

(assert (=> b!21567 d!3833))

(declare-fun d!3835 () Bool)

(declare-fun e!14301 () Bool)

(assert (=> d!3835 e!14301))

(declare-fun res!14011 () Bool)

(assert (=> d!3835 (=> res!14011 e!14301)))

(declare-fun lt!7225 () Bool)

(assert (=> d!3835 (= res!14011 (not lt!7225))))

(declare-fun lt!7224 () Bool)

(assert (=> d!3835 (= lt!7225 lt!7224)))

(declare-fun lt!7223 () Unit!459)

(declare-fun e!14302 () Unit!459)

(assert (=> d!3835 (= lt!7223 e!14302)))

(declare-fun c!2647 () Bool)

(assert (=> d!3835 (= c!2647 lt!7224)))

(assert (=> d!3835 (= lt!7224 (containsKey!23 (toList!293 lt!6943) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3835 (= (contains!225 lt!6943 #b0000000000000000000000000000000000000000000000000000000000000000) lt!7225)))

(declare-fun b!22030 () Bool)

(declare-fun lt!7226 () Unit!459)

(assert (=> b!22030 (= e!14302 lt!7226)))

(assert (=> b!22030 (= lt!7226 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!293 lt!6943) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22030 (isDefined!21 (getValueByKey!59 (toList!293 lt!6943) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22031 () Bool)

(declare-fun Unit!484 () Unit!459)

(assert (=> b!22031 (= e!14302 Unit!484)))

(declare-fun b!22032 () Bool)

(assert (=> b!22032 (= e!14301 (isDefined!21 (getValueByKey!59 (toList!293 lt!6943) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3835 c!2647) b!22030))

(assert (= (and d!3835 (not c!2647)) b!22031))

(assert (= (and d!3835 (not res!14011)) b!22032))

(declare-fun m!15763 () Bool)

(assert (=> d!3835 m!15763))

(declare-fun m!15765 () Bool)

(assert (=> b!22030 m!15765))

(assert (=> b!22030 m!15551))

(assert (=> b!22030 m!15551))

(declare-fun m!15767 () Bool)

(assert (=> b!22030 m!15767))

(assert (=> b!22032 m!15551))

(assert (=> b!22032 m!15551))

(assert (=> b!22032 m!15767))

(assert (=> bm!1466 d!3835))

(declare-fun b!22041 () Bool)

(declare-fun res!14021 () Bool)

(declare-fun e!14305 () Bool)

(assert (=> b!22041 (=> (not res!14021) (not e!14305))))

(assert (=> b!22041 (= res!14021 (and (= (size!665 (_values!1707 (v!1570 (_2!452 lt!6654)))) (bvadd (mask!4691 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000001)) (= (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654)))) (size!665 (_values!1707 (v!1570 (_2!452 lt!6654))))) (bvsge (_size!133 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000) (bvsle (_size!133 (v!1570 (_2!452 lt!6654))) (bvadd (mask!4691 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000001))))))

(declare-fun b!22044 () Bool)

(assert (=> b!22044 (= e!14305 (and (bvsge (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000) (bvsle (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000011) (bvsge (_vacant!133 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000)))))

(declare-fun b!22042 () Bool)

(declare-fun res!14022 () Bool)

(assert (=> b!22042 (=> (not res!14022) (not e!14305))))

(declare-fun size!673 (LongMapFixedSize!184) (_ BitVec 32))

(assert (=> b!22042 (= res!14022 (bvsge (size!673 (v!1570 (_2!452 lt!6654))) (_size!133 (v!1570 (_2!452 lt!6654)))))))

(declare-fun d!3837 () Bool)

(declare-fun res!14020 () Bool)

(assert (=> d!3837 (=> (not res!14020) (not e!14305))))

(assert (=> d!3837 (= res!14020 (validMask!0 (mask!4691 (v!1570 (_2!452 lt!6654)))))))

(assert (=> d!3837 (= (simpleValid!19 (v!1570 (_2!452 lt!6654))) e!14305)))

(declare-fun b!22043 () Bool)

(declare-fun res!14023 () Bool)

(assert (=> b!22043 (=> (not res!14023) (not e!14305))))

(assert (=> b!22043 (= res!14023 (= (size!673 (v!1570 (_2!452 lt!6654))) (bvadd (_size!133 (v!1570 (_2!452 lt!6654))) (bvsdiv (bvadd (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!3837 res!14020) b!22041))

(assert (= (and b!22041 res!14021) b!22042))

(assert (= (and b!22042 res!14022) b!22043))

(assert (= (and b!22043 res!14023) b!22044))

(declare-fun m!15769 () Bool)

(assert (=> b!22042 m!15769))

(declare-fun m!15771 () Bool)

(assert (=> d!3837 m!15771))

(assert (=> b!22043 m!15769))

(assert (=> d!3713 d!3837))

(declare-fun d!3839 () Bool)

(declare-fun lt!7231 () tuple2!916)

(assert (=> d!3839 (or (bvsle (_2!461 lt!7231) #b00000000000000000000000000001000) (bvsge (bvmul #b00000000000000000000000000001000 (_size!133 (v!1570 (underlying!103 thiss!938)))) (_2!461 lt!7231)) (bvslt (bvadd (bvand (bvashr (_2!461 lt!7231) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!133 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun e!14308 () tuple2!916)

(assert (=> d!3839 (= lt!7231 e!14308)))

(declare-fun c!2650 () Bool)

(declare-fun lt!7232 () (_ BitVec 32))

(assert (=> d!3839 (= c!2650 (and (bvsgt lt!7232 #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!133 (v!1570 (underlying!103 thiss!938)))) lt!7232) (bvsge (bvadd (bvand (bvashr lt!7232 #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!133 (v!1570 (underlying!103 thiss!938))))))))

(assert (=> d!3839 (= lt!7232 (bvlshr (_2!461 lt!6853) #b00000000000000000000000000000001))))

(assert (=> d!3839 (and (bvsgt (_2!461 lt!6853) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!133 (v!1570 (underlying!103 thiss!938)))) (_2!461 lt!6853)) (bvsge (bvadd (bvand (bvashr (_2!461 lt!6853) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!133 (v!1570 (underlying!103 thiss!938)))))))

(assert (=> d!3839 (= (computeNewMaskWhile!11 (_size!133 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) (_2!461 lt!6853)) lt!7231)))

(declare-fun b!22049 () Bool)

(assert (=> b!22049 (= e!14308 (computeNewMaskWhile!11 (_size!133 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938))) lt!7232))))

(declare-fun b!22050 () Bool)

(declare-fun Unit!485 () Unit!459)

(assert (=> b!22050 (= e!14308 (tuple2!917 Unit!485 lt!7232))))

(assert (= (and d!3839 c!2650) b!22049))

(assert (= (and d!3839 (not c!2650)) b!22050))

(declare-fun m!15774 () Bool)

(assert (=> b!22049 m!15774))

(assert (=> b!21557 d!3839))

(declare-fun d!3841 () Bool)

(declare-fun e!14309 () Bool)

(assert (=> d!3841 e!14309))

(declare-fun res!14025 () Bool)

(assert (=> d!3841 (=> (not res!14025) (not e!14309))))

(declare-fun lt!7234 () ListLongMap!555)

(assert (=> d!3841 (= res!14025 (contains!225 lt!7234 (_1!454 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun lt!7236 () List!557)

(assert (=> d!3841 (= lt!7234 (ListLongMap!556 lt!7236))))

(declare-fun lt!7235 () Unit!459)

(declare-fun lt!7233 () Unit!459)

(assert (=> d!3841 (= lt!7235 lt!7233)))

(assert (=> d!3841 (= (getValueByKey!59 lt!7236 (_1!454 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))) (Some!64 (_2!454 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(assert (=> d!3841 (= lt!7233 (lemmaContainsTupThenGetReturnValue!17 lt!7236 (_1!454 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (_2!454 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(assert (=> d!3841 (= lt!7236 (insertStrictlySorted!17 (toList!293 call!1411) (_1!454 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (_2!454 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(assert (=> d!3841 (= (+!42 call!1411 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) lt!7234)))

(declare-fun b!22051 () Bool)

(declare-fun res!14024 () Bool)

(assert (=> b!22051 (=> (not res!14024) (not e!14309))))

(assert (=> b!22051 (= res!14024 (= (getValueByKey!59 (toList!293 lt!7234) (_1!454 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))) (Some!64 (_2!454 (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))))

(declare-fun b!22052 () Bool)

(assert (=> b!22052 (= e!14309 (contains!227 (toList!293 lt!7234) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (= (and d!3841 res!14025) b!22051))

(assert (= (and b!22051 res!14024) b!22052))

(declare-fun m!15776 () Bool)

(assert (=> d!3841 m!15776))

(declare-fun m!15778 () Bool)

(assert (=> d!3841 m!15778))

(declare-fun m!15780 () Bool)

(assert (=> d!3841 m!15780))

(declare-fun m!15782 () Bool)

(assert (=> d!3841 m!15782))

(declare-fun m!15784 () Bool)

(assert (=> b!22051 m!15784))

(declare-fun m!15786 () Bool)

(assert (=> b!22052 m!15786))

(assert (=> b!21514 d!3841))

(declare-fun d!3843 () Bool)

(declare-fun e!14310 () Bool)

(assert (=> d!3843 e!14310))

(declare-fun res!14027 () Bool)

(assert (=> d!3843 (=> (not res!14027) (not e!14310))))

(declare-fun lt!7238 () ListLongMap!555)

(assert (=> d!3843 (= res!14027 (contains!225 lt!7238 (_1!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun lt!7240 () List!557)

(assert (=> d!3843 (= lt!7238 (ListLongMap!556 lt!7240))))

(declare-fun lt!7239 () Unit!459)

(declare-fun lt!7237 () Unit!459)

(assert (=> d!3843 (= lt!7239 lt!7237)))

(assert (=> d!3843 (= (getValueByKey!59 lt!7240 (_1!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3843 (= lt!7237 (lemmaContainsTupThenGetReturnValue!17 lt!7240 (_1!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3843 (= lt!7240 (insertStrictlySorted!17 (toList!293 call!1468) (_1!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3843 (= (+!42 call!1468 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!7238)))

(declare-fun b!22053 () Bool)

(declare-fun res!14026 () Bool)

(assert (=> b!22053 (=> (not res!14026) (not e!14310))))

(assert (=> b!22053 (= res!14026 (= (getValueByKey!59 (toList!293 lt!7238) (_1!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun b!22054 () Bool)

(assert (=> b!22054 (= e!14310 (contains!227 (toList!293 lt!7238) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))

(assert (= (and d!3843 res!14027) b!22053))

(assert (= (and b!22053 res!14026) b!22054))

(declare-fun m!15788 () Bool)

(assert (=> d!3843 m!15788))

(declare-fun m!15790 () Bool)

(assert (=> d!3843 m!15790))

(declare-fun m!15792 () Bool)

(assert (=> d!3843 m!15792))

(declare-fun m!15794 () Bool)

(assert (=> d!3843 m!15794))

(declare-fun m!15796 () Bool)

(assert (=> b!22053 m!15796))

(declare-fun m!15798 () Bool)

(assert (=> b!22054 m!15798))

(assert (=> b!21672 d!3843))

(declare-fun d!3845 () Bool)

(assert (=> d!3845 (= (apply!28 (+!42 lt!6944 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6945) (get!378 (getValueByKey!59 (toList!293 (+!42 lt!6944 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) lt!6945)))))

(declare-fun bs!922 () Bool)

(assert (= bs!922 d!3845))

(declare-fun m!15800 () Bool)

(assert (=> bs!922 m!15800))

(assert (=> bs!922 m!15800))

(declare-fun m!15802 () Bool)

(assert (=> bs!922 m!15802))

(assert (=> b!21656 d!3845))

(declare-fun d!3847 () Bool)

(declare-fun e!14311 () Bool)

(assert (=> d!3847 e!14311))

(declare-fun res!14029 () Bool)

(assert (=> d!3847 (=> (not res!14029) (not e!14311))))

(declare-fun lt!7242 () ListLongMap!555)

(assert (=> d!3847 (= res!14029 (contains!225 lt!7242 (_1!454 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun lt!7244 () List!557)

(assert (=> d!3847 (= lt!7242 (ListLongMap!556 lt!7244))))

(declare-fun lt!7243 () Unit!459)

(declare-fun lt!7241 () Unit!459)

(assert (=> d!3847 (= lt!7243 lt!7241)))

(assert (=> d!3847 (= (getValueByKey!59 lt!7244 (_1!454 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3847 (= lt!7241 (lemmaContainsTupThenGetReturnValue!17 lt!7244 (_1!454 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3847 (= lt!7244 (insertStrictlySorted!17 (toList!293 lt!6944) (_1!454 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3847 (= (+!42 lt!6944 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!7242)))

(declare-fun b!22055 () Bool)

(declare-fun res!14028 () Bool)

(assert (=> b!22055 (=> (not res!14028) (not e!14311))))

(assert (=> b!22055 (= res!14028 (= (getValueByKey!59 (toList!293 lt!7242) (_1!454 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun b!22056 () Bool)

(assert (=> b!22056 (= e!14311 (contains!227 (toList!293 lt!7242) (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))

(assert (= (and d!3847 res!14029) b!22055))

(assert (= (and b!22055 res!14028) b!22056))

(declare-fun m!15804 () Bool)

(assert (=> d!3847 m!15804))

(declare-fun m!15806 () Bool)

(assert (=> d!3847 m!15806))

(declare-fun m!15808 () Bool)

(assert (=> d!3847 m!15808))

(declare-fun m!15810 () Bool)

(assert (=> d!3847 m!15810))

(declare-fun m!15812 () Bool)

(assert (=> b!22055 m!15812))

(declare-fun m!15814 () Bool)

(assert (=> b!22056 m!15814))

(assert (=> b!21656 d!3847))

(declare-fun d!3849 () Bool)

(declare-fun e!14312 () Bool)

(assert (=> d!3849 e!14312))

(declare-fun res!14030 () Bool)

(assert (=> d!3849 (=> res!14030 e!14312)))

(declare-fun lt!7247 () Bool)

(assert (=> d!3849 (= res!14030 (not lt!7247))))

(declare-fun lt!7246 () Bool)

(assert (=> d!3849 (= lt!7247 lt!7246)))

(declare-fun lt!7245 () Unit!459)

(declare-fun e!14313 () Unit!459)

(assert (=> d!3849 (= lt!7245 e!14313)))

(declare-fun c!2651 () Bool)

(assert (=> d!3849 (= c!2651 lt!7246)))

(assert (=> d!3849 (= lt!7246 (containsKey!23 (toList!293 (+!42 lt!6936 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))) lt!6929))))

(assert (=> d!3849 (= (contains!225 (+!42 lt!6936 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6929) lt!7247)))

(declare-fun b!22057 () Bool)

(declare-fun lt!7248 () Unit!459)

(assert (=> b!22057 (= e!14313 lt!7248)))

(assert (=> b!22057 (= lt!7248 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!293 (+!42 lt!6936 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))) lt!6929))))

(assert (=> b!22057 (isDefined!21 (getValueByKey!59 (toList!293 (+!42 lt!6936 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))) lt!6929))))

(declare-fun b!22058 () Bool)

(declare-fun Unit!486 () Unit!459)

(assert (=> b!22058 (= e!14313 Unit!486)))

(declare-fun b!22059 () Bool)

(assert (=> b!22059 (= e!14312 (isDefined!21 (getValueByKey!59 (toList!293 (+!42 lt!6936 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))) lt!6929)))))

(assert (= (and d!3849 c!2651) b!22057))

(assert (= (and d!3849 (not c!2651)) b!22058))

(assert (= (and d!3849 (not res!14030)) b!22059))

(declare-fun m!15816 () Bool)

(assert (=> d!3849 m!15816))

(declare-fun m!15818 () Bool)

(assert (=> b!22057 m!15818))

(declare-fun m!15820 () Bool)

(assert (=> b!22057 m!15820))

(assert (=> b!22057 m!15820))

(declare-fun m!15822 () Bool)

(assert (=> b!22057 m!15822))

(assert (=> b!22059 m!15820))

(assert (=> b!22059 m!15820))

(assert (=> b!22059 m!15822))

(assert (=> b!21656 d!3849))

(declare-fun d!3851 () Bool)

(assert (=> d!3851 (= (apply!28 lt!6931 lt!6926) (get!378 (getValueByKey!59 (toList!293 lt!6931) lt!6926)))))

(declare-fun bs!923 () Bool)

(assert (= bs!923 d!3851))

(declare-fun m!15824 () Bool)

(assert (=> bs!923 m!15824))

(assert (=> bs!923 m!15824))

(declare-fun m!15826 () Bool)

(assert (=> bs!923 m!15826))

(assert (=> b!21656 d!3851))

(declare-fun d!3853 () Bool)

(assert (=> d!3853 (contains!225 (+!42 lt!6936 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6929)))

(declare-fun lt!7251 () Unit!459)

(declare-fun choose!201 (ListLongMap!555 (_ BitVec 64) V!1155 (_ BitVec 64)) Unit!459)

(assert (=> d!3853 (= lt!7251 (choose!201 lt!6936 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6929))))

(assert (=> d!3853 (contains!225 lt!6936 lt!6929)))

(assert (=> d!3853 (= (addStillContains!13 lt!6936 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6929) lt!7251)))

(declare-fun bs!924 () Bool)

(assert (= bs!924 d!3853))

(assert (=> bs!924 m!15077))

(assert (=> bs!924 m!15077))

(assert (=> bs!924 m!15079))

(declare-fun m!15828 () Bool)

(assert (=> bs!924 m!15828))

(declare-fun m!15830 () Bool)

(assert (=> bs!924 m!15830))

(assert (=> b!21656 d!3853))

(declare-fun d!3855 () Bool)

(assert (=> d!3855 (= (apply!28 lt!6944 lt!6945) (get!378 (getValueByKey!59 (toList!293 lt!6944) lt!6945)))))

(declare-fun bs!925 () Bool)

(assert (= bs!925 d!3855))

(declare-fun m!15832 () Bool)

(assert (=> bs!925 m!15832))

(assert (=> bs!925 m!15832))

(declare-fun m!15834 () Bool)

(assert (=> bs!925 m!15834))

(assert (=> b!21656 d!3855))

(declare-fun d!3857 () Bool)

(assert (=> d!3857 (= (apply!28 (+!42 lt!6931 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6926) (apply!28 lt!6931 lt!6926))))

(declare-fun lt!7254 () Unit!459)

(declare-fun choose!202 (ListLongMap!555 (_ BitVec 64) V!1155 (_ BitVec 64)) Unit!459)

(assert (=> d!3857 (= lt!7254 (choose!202 lt!6931 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6926))))

(declare-fun e!14316 () Bool)

(assert (=> d!3857 e!14316))

(declare-fun res!14033 () Bool)

(assert (=> d!3857 (=> (not res!14033) (not e!14316))))

(assert (=> d!3857 (= res!14033 (contains!225 lt!6931 lt!6926))))

(assert (=> d!3857 (= (addApplyDifferent!13 lt!6931 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6926) lt!7254)))

(declare-fun b!22064 () Bool)

(assert (=> b!22064 (= e!14316 (not (= lt!6926 lt!6928)))))

(assert (= (and d!3857 res!14033) b!22064))

(assert (=> d!3857 m!15073))

(assert (=> d!3857 m!15075))

(assert (=> d!3857 m!15099))

(assert (=> d!3857 m!15073))

(declare-fun m!15836 () Bool)

(assert (=> d!3857 m!15836))

(declare-fun m!15838 () Bool)

(assert (=> d!3857 m!15838))

(assert (=> b!21656 d!3857))

(declare-fun d!3859 () Bool)

(assert (=> d!3859 (= (apply!28 lt!6933 lt!6939) (get!378 (getValueByKey!59 (toList!293 lt!6933) lt!6939)))))

(declare-fun bs!926 () Bool)

(assert (= bs!926 d!3859))

(declare-fun m!15840 () Bool)

(assert (=> bs!926 m!15840))

(assert (=> bs!926 m!15840))

(declare-fun m!15842 () Bool)

(assert (=> bs!926 m!15842))

(assert (=> b!21656 d!3859))

(assert (=> b!21656 d!3801))

(declare-fun d!3861 () Bool)

(declare-fun e!14317 () Bool)

(assert (=> d!3861 e!14317))

(declare-fun res!14035 () Bool)

(assert (=> d!3861 (=> (not res!14035) (not e!14317))))

(declare-fun lt!7256 () ListLongMap!555)

(assert (=> d!3861 (= res!14035 (contains!225 lt!7256 (_1!454 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun lt!7258 () List!557)

(assert (=> d!3861 (= lt!7256 (ListLongMap!556 lt!7258))))

(declare-fun lt!7257 () Unit!459)

(declare-fun lt!7255 () Unit!459)

(assert (=> d!3861 (= lt!7257 lt!7255)))

(assert (=> d!3861 (= (getValueByKey!59 lt!7258 (_1!454 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3861 (= lt!7255 (lemmaContainsTupThenGetReturnValue!17 lt!7258 (_1!454 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3861 (= lt!7258 (insertStrictlySorted!17 (toList!293 lt!6931) (_1!454 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3861 (= (+!42 lt!6931 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!7256)))

(declare-fun b!22065 () Bool)

(declare-fun res!14034 () Bool)

(assert (=> b!22065 (=> (not res!14034) (not e!14317))))

(assert (=> b!22065 (= res!14034 (= (getValueByKey!59 (toList!293 lt!7256) (_1!454 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun b!22066 () Bool)

(assert (=> b!22066 (= e!14317 (contains!227 (toList!293 lt!7256) (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))))))

(assert (= (and d!3861 res!14035) b!22065))

(assert (= (and b!22065 res!14034) b!22066))

(declare-fun m!15844 () Bool)

(assert (=> d!3861 m!15844))

(declare-fun m!15846 () Bool)

(assert (=> d!3861 m!15846))

(declare-fun m!15848 () Bool)

(assert (=> d!3861 m!15848))

(declare-fun m!15850 () Bool)

(assert (=> d!3861 m!15850))

(declare-fun m!15852 () Bool)

(assert (=> b!22065 m!15852))

(declare-fun m!15854 () Bool)

(assert (=> b!22066 m!15854))

(assert (=> b!21656 d!3861))

(declare-fun d!3863 () Bool)

(declare-fun e!14318 () Bool)

(assert (=> d!3863 e!14318))

(declare-fun res!14037 () Bool)

(assert (=> d!3863 (=> (not res!14037) (not e!14318))))

(declare-fun lt!7260 () ListLongMap!555)

(assert (=> d!3863 (= res!14037 (contains!225 lt!7260 (_1!454 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun lt!7262 () List!557)

(assert (=> d!3863 (= lt!7260 (ListLongMap!556 lt!7262))))

(declare-fun lt!7261 () Unit!459)

(declare-fun lt!7259 () Unit!459)

(assert (=> d!3863 (= lt!7261 lt!7259)))

(assert (=> d!3863 (= (getValueByKey!59 lt!7262 (_1!454 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3863 (= lt!7259 (lemmaContainsTupThenGetReturnValue!17 lt!7262 (_1!454 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3863 (= lt!7262 (insertStrictlySorted!17 (toList!293 lt!6933) (_1!454 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3863 (= (+!42 lt!6933 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!7260)))

(declare-fun b!22067 () Bool)

(declare-fun res!14036 () Bool)

(assert (=> b!22067 (=> (not res!14036) (not e!14318))))

(assert (=> b!22067 (= res!14036 (= (getValueByKey!59 (toList!293 lt!7260) (_1!454 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun b!22068 () Bool)

(assert (=> b!22068 (= e!14318 (contains!227 (toList!293 lt!7260) (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))

(assert (= (and d!3863 res!14037) b!22067))

(assert (= (and b!22067 res!14036) b!22068))

(declare-fun m!15856 () Bool)

(assert (=> d!3863 m!15856))

(declare-fun m!15858 () Bool)

(assert (=> d!3863 m!15858))

(declare-fun m!15860 () Bool)

(assert (=> d!3863 m!15860))

(declare-fun m!15862 () Bool)

(assert (=> d!3863 m!15862))

(declare-fun m!15864 () Bool)

(assert (=> b!22067 m!15864))

(declare-fun m!15866 () Bool)

(assert (=> b!22068 m!15866))

(assert (=> b!21656 d!3863))

(declare-fun d!3865 () Bool)

(assert (=> d!3865 (= (apply!28 (+!42 lt!6933 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6939) (get!378 (getValueByKey!59 (toList!293 (+!42 lt!6933 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) lt!6939)))))

(declare-fun bs!927 () Bool)

(assert (= bs!927 d!3865))

(declare-fun m!15868 () Bool)

(assert (=> bs!927 m!15868))

(assert (=> bs!927 m!15868))

(declare-fun m!15870 () Bool)

(assert (=> bs!927 m!15870))

(assert (=> b!21656 d!3865))

(declare-fun d!3867 () Bool)

(assert (=> d!3867 (= (apply!28 (+!42 lt!6931 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6926) (get!378 (getValueByKey!59 (toList!293 (+!42 lt!6931 (tuple2!903 lt!6928 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))) lt!6926)))))

(declare-fun bs!928 () Bool)

(assert (= bs!928 d!3867))

(declare-fun m!15872 () Bool)

(assert (=> bs!928 m!15872))

(assert (=> bs!928 m!15872))

(declare-fun m!15874 () Bool)

(assert (=> bs!928 m!15874))

(assert (=> b!21656 d!3867))

(declare-fun d!3869 () Bool)

(assert (=> d!3869 (= (apply!28 (+!42 lt!6933 (tuple2!903 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6939) (apply!28 lt!6933 lt!6939))))

(declare-fun lt!7263 () Unit!459)

(assert (=> d!3869 (= lt!7263 (choose!202 lt!6933 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6939))))

(declare-fun e!14319 () Bool)

(assert (=> d!3869 e!14319))

(declare-fun res!14038 () Bool)

(assert (=> d!3869 (=> (not res!14038) (not e!14319))))

(assert (=> d!3869 (= res!14038 (contains!225 lt!6933 lt!6939))))

(assert (=> d!3869 (= (addApplyDifferent!13 lt!6933 lt!6927 (minValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6939) lt!7263)))

(declare-fun b!22069 () Bool)

(assert (=> b!22069 (= e!14319 (not (= lt!6939 lt!6927)))))

(assert (= (and d!3869 res!14038) b!22069))

(assert (=> d!3869 m!15091))

(assert (=> d!3869 m!15093))

(assert (=> d!3869 m!15089))

(assert (=> d!3869 m!15091))

(declare-fun m!15876 () Bool)

(assert (=> d!3869 m!15876))

(declare-fun m!15878 () Bool)

(assert (=> d!3869 m!15878))

(assert (=> b!21656 d!3869))

(declare-fun d!3871 () Bool)

(assert (=> d!3871 (= (apply!28 (+!42 lt!6944 (tuple2!903 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!6945) (apply!28 lt!6944 lt!6945))))

(declare-fun lt!7264 () Unit!459)

(assert (=> d!3871 (= lt!7264 (choose!202 lt!6944 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6945))))

(declare-fun e!14320 () Bool)

(assert (=> d!3871 e!14320))

(declare-fun res!14039 () Bool)

(assert (=> d!3871 (=> (not res!14039) (not e!14320))))

(assert (=> d!3871 (= res!14039 (contains!225 lt!6944 lt!6945))))

(assert (=> d!3871 (= (addApplyDifferent!13 lt!6944 lt!6942 (minValue!1645 (v!1570 (underlying!103 thiss!938))) lt!6945) lt!7264)))

(declare-fun b!22070 () Bool)

(assert (=> b!22070 (= e!14320 (not (= lt!6945 lt!6942)))))

(assert (= (and d!3871 res!14039) b!22070))

(assert (=> d!3871 m!15081))

(assert (=> d!3871 m!15083))

(assert (=> d!3871 m!15087))

(assert (=> d!3871 m!15081))

(declare-fun m!15880 () Bool)

(assert (=> d!3871 m!15880))

(declare-fun m!15882 () Bool)

(assert (=> d!3871 m!15882))

(assert (=> b!21656 d!3871))

(declare-fun d!3873 () Bool)

(declare-fun e!14321 () Bool)

(assert (=> d!3873 e!14321))

(declare-fun res!14041 () Bool)

(assert (=> d!3873 (=> (not res!14041) (not e!14321))))

(declare-fun lt!7266 () ListLongMap!555)

(assert (=> d!3873 (= res!14041 (contains!225 lt!7266 (_1!454 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun lt!7268 () List!557)

(assert (=> d!3873 (= lt!7266 (ListLongMap!556 lt!7268))))

(declare-fun lt!7267 () Unit!459)

(declare-fun lt!7265 () Unit!459)

(assert (=> d!3873 (= lt!7267 lt!7265)))

(assert (=> d!3873 (= (getValueByKey!59 lt!7268 (_1!454 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3873 (= lt!7265 (lemmaContainsTupThenGetReturnValue!17 lt!7268 (_1!454 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3873 (= lt!7268 (insertStrictlySorted!17 (toList!293 lt!6936) (_1!454 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) (_2!454 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(assert (=> d!3873 (= (+!42 lt!6936 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))) lt!7266)))

(declare-fun b!22071 () Bool)

(declare-fun res!14040 () Bool)

(assert (=> b!22071 (=> (not res!14040) (not e!14321))))

(assert (=> b!22071 (= res!14040 (= (getValueByKey!59 (toList!293 lt!7266) (_1!454 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938)))))) (Some!64 (_2!454 (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun b!22072 () Bool)

(assert (=> b!22072 (= e!14321 (contains!227 (toList!293 lt!7266) (tuple2!903 lt!6930 (zeroValue!1645 (v!1570 (underlying!103 thiss!938))))))))

(assert (= (and d!3873 res!14041) b!22071))

(assert (= (and b!22071 res!14040) b!22072))

(declare-fun m!15884 () Bool)

(assert (=> d!3873 m!15884))

(declare-fun m!15886 () Bool)

(assert (=> d!3873 m!15886))

(declare-fun m!15888 () Bool)

(assert (=> d!3873 m!15888))

(declare-fun m!15890 () Bool)

(assert (=> d!3873 m!15890))

(declare-fun m!15892 () Bool)

(assert (=> b!22071 m!15892))

(declare-fun m!15894 () Bool)

(assert (=> b!22072 m!15894))

(assert (=> b!21656 d!3873))

(declare-fun d!3875 () Bool)

(declare-fun res!14042 () Bool)

(declare-fun e!14322 () Bool)

(assert (=> d!3875 (=> (not res!14042) (not e!14322))))

(assert (=> d!3875 (= res!14042 (simpleValid!19 (v!1570 (underlying!103 thiss!938))))))

(assert (=> d!3875 (= (valid!101 (v!1570 (underlying!103 thiss!938))) e!14322)))

(declare-fun b!22073 () Bool)

(declare-fun res!14043 () Bool)

(assert (=> b!22073 (=> (not res!14043) (not e!14322))))

(assert (=> b!22073 (= res!14043 (= (arrayCountValidKeys!0 (_keys!3139 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938))))) (_size!133 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun b!22074 () Bool)

(declare-fun res!14044 () Bool)

(assert (=> b!22074 (=> (not res!14044) (not e!14322))))

(assert (=> b!22074 (= res!14044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (v!1570 (underlying!103 thiss!938))) (mask!4691 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun b!22075 () Bool)

(assert (=> b!22075 (= e!14322 (arrayNoDuplicates!0 (_keys!3139 (v!1570 (underlying!103 thiss!938))) #b00000000000000000000000000000000 Nil!557))))

(assert (= (and d!3875 res!14042) b!22073))

(assert (= (and b!22073 res!14043) b!22074))

(assert (= (and b!22074 res!14044) b!22075))

(declare-fun m!15896 () Bool)

(assert (=> d!3875 m!15896))

(declare-fun m!15898 () Bool)

(assert (=> b!22073 m!15898))

(declare-fun m!15900 () Bool)

(assert (=> b!22074 m!15900))

(declare-fun m!15902 () Bool)

(assert (=> b!22075 m!15902))

(assert (=> d!3711 d!3875))

(declare-fun bm!1531 () Bool)

(declare-fun call!1538 () ListLongMap!555)

(declare-fun call!1534 () ListLongMap!555)

(assert (=> bm!1531 (= call!1538 call!1534)))

(declare-fun b!22076 () Bool)

(declare-fun e!14323 () Bool)

(declare-fun lt!7286 () ListLongMap!555)

(assert (=> b!22076 (= e!14323 (= (apply!28 lt!7286 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000)) (get!377 (select (arr!572 (_values!1707 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000) (dynLambda!140 (defaultEntry!1718 (v!1570 (_2!452 lt!6654))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_values!1707 (v!1570 (_2!452 lt!6654))))))))

(assert (=> b!22076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))))))

(declare-fun b!22077 () Bool)

(declare-fun e!14329 () Bool)

(assert (=> b!22077 (= e!14329 (= (apply!28 lt!7286 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 (v!1570 (_2!452 lt!6654)))))))

(declare-fun bm!1532 () Bool)

(declare-fun call!1539 () ListLongMap!555)

(assert (=> bm!1532 (= call!1534 call!1539)))

(declare-fun b!22078 () Bool)

(declare-fun e!14327 () Bool)

(assert (=> b!22078 (= e!14327 (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000)))))

(declare-fun b!22079 () Bool)

(declare-fun e!14331 () Unit!459)

(declare-fun lt!7277 () Unit!459)

(assert (=> b!22079 (= e!14331 lt!7277)))

(declare-fun lt!7279 () ListLongMap!555)

(assert (=> b!22079 (= lt!7279 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (_2!452 lt!6654))) (_values!1707 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654))) (extraKeys!1621 (v!1570 (_2!452 lt!6654))) (zeroValue!1645 (v!1570 (_2!452 lt!6654))) (minValue!1645 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1570 (_2!452 lt!6654)))))))

(declare-fun lt!7273 () (_ BitVec 64))

(assert (=> b!22079 (= lt!7273 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7272 () (_ BitVec 64))

(assert (=> b!22079 (= lt!7272 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000))))

(declare-fun lt!7275 () Unit!459)

(assert (=> b!22079 (= lt!7275 (addStillContains!13 lt!7279 lt!7273 (zeroValue!1645 (v!1570 (_2!452 lt!6654))) lt!7272))))

(assert (=> b!22079 (contains!225 (+!42 lt!7279 (tuple2!903 lt!7273 (zeroValue!1645 (v!1570 (_2!452 lt!6654))))) lt!7272)))

(declare-fun lt!7283 () Unit!459)

(assert (=> b!22079 (= lt!7283 lt!7275)))

(declare-fun lt!7276 () ListLongMap!555)

(assert (=> b!22079 (= lt!7276 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (_2!452 lt!6654))) (_values!1707 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654))) (extraKeys!1621 (v!1570 (_2!452 lt!6654))) (zeroValue!1645 (v!1570 (_2!452 lt!6654))) (minValue!1645 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1570 (_2!452 lt!6654)))))))

(declare-fun lt!7270 () (_ BitVec 64))

(assert (=> b!22079 (= lt!7270 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7282 () (_ BitVec 64))

(assert (=> b!22079 (= lt!7282 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000))))

(declare-fun lt!7284 () Unit!459)

(assert (=> b!22079 (= lt!7284 (addApplyDifferent!13 lt!7276 lt!7270 (minValue!1645 (v!1570 (_2!452 lt!6654))) lt!7282))))

(assert (=> b!22079 (= (apply!28 (+!42 lt!7276 (tuple2!903 lt!7270 (minValue!1645 (v!1570 (_2!452 lt!6654))))) lt!7282) (apply!28 lt!7276 lt!7282))))

(declare-fun lt!7290 () Unit!459)

(assert (=> b!22079 (= lt!7290 lt!7284)))

(declare-fun lt!7274 () ListLongMap!555)

(assert (=> b!22079 (= lt!7274 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (_2!452 lt!6654))) (_values!1707 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654))) (extraKeys!1621 (v!1570 (_2!452 lt!6654))) (zeroValue!1645 (v!1570 (_2!452 lt!6654))) (minValue!1645 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1570 (_2!452 lt!6654)))))))

(declare-fun lt!7271 () (_ BitVec 64))

(assert (=> b!22079 (= lt!7271 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7269 () (_ BitVec 64))

(assert (=> b!22079 (= lt!7269 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000))))

(declare-fun lt!7281 () Unit!459)

(assert (=> b!22079 (= lt!7281 (addApplyDifferent!13 lt!7274 lt!7271 (zeroValue!1645 (v!1570 (_2!452 lt!6654))) lt!7269))))

(assert (=> b!22079 (= (apply!28 (+!42 lt!7274 (tuple2!903 lt!7271 (zeroValue!1645 (v!1570 (_2!452 lt!6654))))) lt!7269) (apply!28 lt!7274 lt!7269))))

(declare-fun lt!7280 () Unit!459)

(assert (=> b!22079 (= lt!7280 lt!7281)))

(declare-fun lt!7287 () ListLongMap!555)

(assert (=> b!22079 (= lt!7287 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (_2!452 lt!6654))) (_values!1707 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654))) (extraKeys!1621 (v!1570 (_2!452 lt!6654))) (zeroValue!1645 (v!1570 (_2!452 lt!6654))) (minValue!1645 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1570 (_2!452 lt!6654)))))))

(declare-fun lt!7285 () (_ BitVec 64))

(assert (=> b!22079 (= lt!7285 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7288 () (_ BitVec 64))

(assert (=> b!22079 (= lt!7288 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000))))

(assert (=> b!22079 (= lt!7277 (addApplyDifferent!13 lt!7287 lt!7285 (minValue!1645 (v!1570 (_2!452 lt!6654))) lt!7288))))

(assert (=> b!22079 (= (apply!28 (+!42 lt!7287 (tuple2!903 lt!7285 (minValue!1645 (v!1570 (_2!452 lt!6654))))) lt!7288) (apply!28 lt!7287 lt!7288))))

(declare-fun bm!1533 () Bool)

(assert (=> bm!1533 (= call!1539 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1570 (_2!452 lt!6654))) (_values!1707 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654))) (extraKeys!1621 (v!1570 (_2!452 lt!6654))) (zeroValue!1645 (v!1570 (_2!452 lt!6654))) (minValue!1645 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1570 (_2!452 lt!6654)))))))

(declare-fun b!22081 () Bool)

(declare-fun e!14324 () Bool)

(declare-fun e!14330 () Bool)

(assert (=> b!22081 (= e!14324 e!14330)))

(declare-fun c!2657 () Bool)

(assert (=> b!22081 (= c!2657 (not (= (bvand (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1534 () Bool)

(declare-fun call!1536 () ListLongMap!555)

(declare-fun call!1537 () ListLongMap!555)

(assert (=> bm!1534 (= call!1536 call!1537)))

(declare-fun b!22082 () Bool)

(declare-fun res!14050 () Bool)

(assert (=> b!22082 (=> (not res!14050) (not e!14324))))

(declare-fun e!14335 () Bool)

(assert (=> b!22082 (= res!14050 e!14335)))

(declare-fun c!2654 () Bool)

(assert (=> b!22082 (= c!2654 (not (= (bvand (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!1535 () Bool)

(declare-fun call!1535 () Bool)

(assert (=> bm!1535 (= call!1535 (contains!225 lt!7286 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22083 () Bool)

(declare-fun e!14328 () Bool)

(assert (=> b!22083 (= e!14328 (validKeyInArray!0 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000)))))

(declare-fun b!22084 () Bool)

(declare-fun res!14047 () Bool)

(assert (=> b!22084 (=> (not res!14047) (not e!14324))))

(declare-fun e!14325 () Bool)

(assert (=> b!22084 (= res!14047 e!14325)))

(declare-fun res!14045 () Bool)

(assert (=> b!22084 (=> res!14045 e!14325)))

(assert (=> b!22084 (= res!14045 (not e!14328))))

(declare-fun res!14051 () Bool)

(assert (=> b!22084 (=> (not res!14051) (not e!14328))))

(assert (=> b!22084 (= res!14051 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))))))

(declare-fun b!22085 () Bool)

(declare-fun e!14334 () ListLongMap!555)

(assert (=> b!22085 (= e!14334 call!1536)))

(declare-fun b!22086 () Bool)

(assert (=> b!22086 (= e!14335 (not call!1535))))

(declare-fun b!22087 () Bool)

(declare-fun e!14332 () ListLongMap!555)

(assert (=> b!22087 (= e!14332 call!1536)))

(declare-fun b!22088 () Bool)

(declare-fun e!14333 () ListLongMap!555)

(assert (=> b!22088 (= e!14333 e!14332)))

(declare-fun c!2656 () Bool)

(assert (=> b!22088 (= c!2656 (and (not (= (bvand (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22089 () Bool)

(declare-fun e!14326 () Bool)

(assert (=> b!22089 (= e!14330 e!14326)))

(declare-fun res!14046 () Bool)

(declare-fun call!1540 () Bool)

(assert (=> b!22089 (= res!14046 call!1540)))

(assert (=> b!22089 (=> (not res!14046) (not e!14326))))

(declare-fun b!22090 () Bool)

(assert (=> b!22090 (= e!14330 (not call!1540))))

(declare-fun b!22091 () Bool)

(assert (=> b!22091 (= e!14326 (= (apply!28 lt!7286 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 (v!1570 (_2!452 lt!6654)))))))

(declare-fun bm!1536 () Bool)

(assert (=> bm!1536 (= call!1540 (contains!225 lt!7286 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22080 () Bool)

(assert (=> b!22080 (= e!14325 e!14323)))

(declare-fun res!14052 () Bool)

(assert (=> b!22080 (=> (not res!14052) (not e!14323))))

(assert (=> b!22080 (= res!14052 (contains!225 lt!7286 (select (arr!573 (_keys!3139 (v!1570 (_2!452 lt!6654)))) #b00000000000000000000000000000000)))))

(assert (=> b!22080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))))))

(declare-fun d!3877 () Bool)

(assert (=> d!3877 e!14324))

(declare-fun res!14048 () Bool)

(assert (=> d!3877 (=> (not res!14048) (not e!14324))))

(assert (=> d!3877 (= res!14048 (or (bvsge #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))))))))

(declare-fun lt!7278 () ListLongMap!555)

(assert (=> d!3877 (= lt!7286 lt!7278)))

(declare-fun lt!7289 () Unit!459)

(assert (=> d!3877 (= lt!7289 e!14331)))

(declare-fun c!2653 () Bool)

(assert (=> d!3877 (= c!2653 e!14327)))

(declare-fun res!14053 () Bool)

(assert (=> d!3877 (=> (not res!14053) (not e!14327))))

(assert (=> d!3877 (= res!14053 (bvslt #b00000000000000000000000000000000 (size!666 (_keys!3139 (v!1570 (_2!452 lt!6654))))))))

(assert (=> d!3877 (= lt!7278 e!14333)))

(declare-fun c!2652 () Bool)

(assert (=> d!3877 (= c!2652 (and (not (= (bvand (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3877 (validMask!0 (mask!4691 (v!1570 (_2!452 lt!6654))))))

(assert (=> d!3877 (= (getCurrentListMap!124 (_keys!3139 (v!1570 (_2!452 lt!6654))) (_values!1707 (v!1570 (_2!452 lt!6654))) (mask!4691 (v!1570 (_2!452 lt!6654))) (extraKeys!1621 (v!1570 (_2!452 lt!6654))) (zeroValue!1645 (v!1570 (_2!452 lt!6654))) (minValue!1645 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1570 (_2!452 lt!6654)))) lt!7286)))

(declare-fun b!22092 () Bool)

(assert (=> b!22092 (= e!14335 e!14329)))

(declare-fun res!14049 () Bool)

(assert (=> b!22092 (= res!14049 call!1535)))

(assert (=> b!22092 (=> (not res!14049) (not e!14329))))

(declare-fun b!22093 () Bool)

(assert (=> b!22093 (= e!14334 call!1538)))

(declare-fun b!22094 () Bool)

(declare-fun Unit!487 () Unit!459)

(assert (=> b!22094 (= e!14331 Unit!487)))

(declare-fun bm!1537 () Bool)

(assert (=> bm!1537 (= call!1537 (+!42 (ite c!2652 call!1539 (ite c!2656 call!1534 call!1538)) (ite (or c!2652 c!2656) (tuple2!903 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1570 (_2!452 lt!6654)))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (_2!452 lt!6654)))))))))

(declare-fun b!22095 () Bool)

(assert (=> b!22095 (= e!14333 (+!42 call!1537 (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (_2!452 lt!6654))))))))

(declare-fun b!22096 () Bool)

(declare-fun c!2655 () Bool)

(assert (=> b!22096 (= c!2655 (and (not (= (bvand (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (v!1570 (_2!452 lt!6654))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!22096 (= e!14332 e!14334)))

(assert (= (and d!3877 c!2652) b!22095))

(assert (= (and d!3877 (not c!2652)) b!22088))

(assert (= (and b!22088 c!2656) b!22087))

(assert (= (and b!22088 (not c!2656)) b!22096))

(assert (= (and b!22096 c!2655) b!22085))

(assert (= (and b!22096 (not c!2655)) b!22093))

(assert (= (or b!22085 b!22093) bm!1531))

(assert (= (or b!22087 bm!1531) bm!1532))

(assert (= (or b!22087 b!22085) bm!1534))

(assert (= (or b!22095 bm!1532) bm!1533))

(assert (= (or b!22095 bm!1534) bm!1537))

(assert (= (and d!3877 res!14053) b!22078))

(assert (= (and d!3877 c!2653) b!22079))

(assert (= (and d!3877 (not c!2653)) b!22094))

(assert (= (and d!3877 res!14048) b!22084))

(assert (= (and b!22084 res!14051) b!22083))

(assert (= (and b!22084 (not res!14045)) b!22080))

(assert (= (and b!22080 res!14052) b!22076))

(assert (= (and b!22084 res!14047) b!22082))

(assert (= (and b!22082 c!2654) b!22092))

(assert (= (and b!22082 (not c!2654)) b!22086))

(assert (= (and b!22092 res!14049) b!22077))

(assert (= (or b!22092 b!22086) bm!1535))

(assert (= (and b!22082 res!14050) b!22081))

(assert (= (and b!22081 c!2657) b!22089))

(assert (= (and b!22081 (not c!2657)) b!22090))

(assert (= (and b!22089 res!14046) b!22091))

(assert (= (or b!22089 b!22090) bm!1536))

(declare-fun b_lambda!1537 () Bool)

(assert (=> (not b_lambda!1537) (not b!22076)))

(declare-fun t!3218 () Bool)

(declare-fun tb!645 () Bool)

(assert (=> (and b!21293 (= (defaultEntry!1718 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 (v!1570 (_2!452 lt!6654)))) t!3218) tb!645))

(declare-fun result!1073 () Bool)

(assert (=> tb!645 (= result!1073 tp_is_empty!997)))

(assert (=> b!22076 t!3218))

(declare-fun b_and!1443 () Bool)

(assert (= b_and!1441 (and (=> t!3218 result!1073) b_and!1443)))

(declare-fun m!15904 () Bool)

(assert (=> b!22091 m!15904))

(declare-fun m!15906 () Bool)

(assert (=> b!22079 m!15906))

(declare-fun m!15908 () Bool)

(assert (=> b!22079 m!15908))

(declare-fun m!15910 () Bool)

(assert (=> b!22079 m!15910))

(declare-fun m!15912 () Bool)

(assert (=> b!22079 m!15912))

(declare-fun m!15914 () Bool)

(assert (=> b!22079 m!15914))

(declare-fun m!15916 () Bool)

(assert (=> b!22079 m!15916))

(declare-fun m!15918 () Bool)

(assert (=> b!22079 m!15918))

(declare-fun m!15920 () Bool)

(assert (=> b!22079 m!15920))

(declare-fun m!15922 () Bool)

(assert (=> b!22079 m!15922))

(assert (=> b!22079 m!15920))

(declare-fun m!15924 () Bool)

(assert (=> b!22079 m!15924))

(declare-fun m!15926 () Bool)

(assert (=> b!22079 m!15926))

(declare-fun m!15928 () Bool)

(assert (=> b!22079 m!15928))

(assert (=> b!22079 m!15916))

(assert (=> b!22079 m!15912))

(declare-fun m!15930 () Bool)

(assert (=> b!22079 m!15930))

(declare-fun m!15932 () Bool)

(assert (=> b!22079 m!15932))

(assert (=> b!22079 m!15930))

(assert (=> b!22079 m!15173))

(declare-fun m!15934 () Bool)

(assert (=> b!22079 m!15934))

(declare-fun m!15936 () Bool)

(assert (=> b!22079 m!15936))

(assert (=> bm!1533 m!15910))

(declare-fun m!15938 () Bool)

(assert (=> bm!1536 m!15938))

(declare-fun m!15940 () Bool)

(assert (=> b!22095 m!15940))

(assert (=> b!22083 m!15173))

(assert (=> b!22083 m!15173))

(assert (=> b!22083 m!15177))

(assert (=> b!22078 m!15173))

(assert (=> b!22078 m!15173))

(assert (=> b!22078 m!15177))

(assert (=> d!3877 m!15771))

(assert (=> b!22080 m!15173))

(assert (=> b!22080 m!15173))

(declare-fun m!15942 () Bool)

(assert (=> b!22080 m!15942))

(declare-fun m!15944 () Bool)

(assert (=> bm!1537 m!15944))

(declare-fun m!15946 () Bool)

(assert (=> bm!1535 m!15946))

(declare-fun m!15948 () Bool)

(assert (=> b!22077 m!15948))

(declare-fun m!15950 () Bool)

(assert (=> b!22076 m!15950))

(assert (=> b!22076 m!15950))

(declare-fun m!15952 () Bool)

(assert (=> b!22076 m!15952))

(declare-fun m!15954 () Bool)

(assert (=> b!22076 m!15954))

(assert (=> b!22076 m!15952))

(assert (=> b!22076 m!15173))

(declare-fun m!15956 () Bool)

(assert (=> b!22076 m!15956))

(assert (=> b!22076 m!15173))

(assert (=> d!3719 d!3877))

(declare-fun d!3879 () Bool)

(declare-fun e!14336 () Bool)

(assert (=> d!3879 e!14336))

(declare-fun res!14054 () Bool)

(assert (=> d!3879 (=> res!14054 e!14336)))

(declare-fun lt!7293 () Bool)

(assert (=> d!3879 (= res!14054 (not lt!7293))))

(declare-fun lt!7292 () Bool)

(assert (=> d!3879 (= lt!7293 lt!7292)))

(declare-fun lt!7291 () Unit!459)

(declare-fun e!14337 () Unit!459)

(assert (=> d!3879 (= lt!7291 e!14337)))

(declare-fun c!2658 () Bool)

(assert (=> d!3879 (= c!2658 lt!7292)))

(assert (=> d!3879 (= lt!7292 (containsKey!23 (toList!293 lt!6943) (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> d!3879 (= (contains!225 lt!6943 (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) lt!7293)))

(declare-fun b!22097 () Bool)

(declare-fun lt!7294 () Unit!459)

(assert (=> b!22097 (= e!14337 lt!7294)))

(assert (=> b!22097 (= lt!7294 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!293 lt!6943) (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!22097 (isDefined!21 (getValueByKey!59 (toList!293 lt!6943) (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun b!22098 () Bool)

(declare-fun Unit!488 () Unit!459)

(assert (=> b!22098 (= e!14337 Unit!488)))

(declare-fun b!22099 () Bool)

(assert (=> b!22099 (= e!14336 (isDefined!21 (getValueByKey!59 (toList!293 lt!6943) (select (arr!573 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!666 (_keys!3139 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))))

(assert (= (and d!3879 c!2658) b!22097))

(assert (= (and d!3879 (not c!2658)) b!22098))

(assert (= (and d!3879 (not res!14054)) b!22099))

(assert (=> d!3879 m!15095))

(declare-fun m!15958 () Bool)

(assert (=> d!3879 m!15958))

(assert (=> b!22097 m!15095))

(declare-fun m!15960 () Bool)

(assert (=> b!22097 m!15960))

(assert (=> b!22097 m!15095))

(assert (=> b!22097 m!15165))

(assert (=> b!22097 m!15165))

(declare-fun m!15962 () Bool)

(assert (=> b!22097 m!15962))

(assert (=> b!22099 m!15095))

(assert (=> b!22099 m!15165))

(assert (=> b!22099 m!15165))

(assert (=> b!22099 m!15962))

(assert (=> b!21657 d!3879))

(declare-fun bm!1546 () Bool)

(declare-fun call!1549 () Bool)

(declare-fun call!1552 () Bool)

(assert (=> bm!1546 (= call!1549 call!1552)))

(declare-fun b!22134 () Bool)

(declare-fun res!14079 () Bool)

(declare-fun e!14356 () Bool)

(assert (=> b!22134 (=> (not res!14079) (not e!14356))))

(declare-fun lt!7363 () tuple2!900)

(assert (=> b!22134 (= res!14079 (contains!225 (map!395 (_2!453 lt!7363)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!3881 () Bool)

(assert (=> d!3881 e!14356))

(declare-fun res!14077 () Bool)

(assert (=> d!3881 (=> (not res!14077) (not e!14356))))

(assert (=> d!3881 (= res!14077 (_1!453 lt!7363))))

(assert (=> d!3881 (= lt!7363 (tuple2!901 true (LongMapFixedSize!185 (defaultEntry!1718 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (bvadd (_size!133 lt!6656) #b00000000000000000000000000000001) (array!1210 (store (arr!573 (_keys!3139 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (size!666 (_keys!3139 lt!6656))) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656))) (_vacant!133 lt!6656))))))

(declare-fun lt!7377 () Unit!459)

(declare-fun lt!7379 () Unit!459)

(assert (=> d!3881 (= lt!7377 lt!7379)))

(declare-fun lt!7359 () array!1207)

(declare-fun lt!7382 () array!1209)

(assert (=> d!3881 (contains!225 (getCurrentListMap!124 lt!7382 lt!7359 (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) (select (store (arr!573 (_keys!3139 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777))))))

(assert (=> d!3881 (= lt!7379 (lemmaValidKeyInArrayIsInListMap!7 lt!7382 lt!7359 (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (defaultEntry!1718 lt!6656)))))

(assert (=> d!3881 (= lt!7359 (array!1208 (store (arr!572 (_values!1707 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656))))))

(assert (=> d!3881 (= lt!7382 (array!1210 (store (arr!573 (_keys!3139 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (size!666 (_keys!3139 lt!6656))))))

(declare-fun lt!7366 () Unit!459)

(declare-fun lt!7357 () Unit!459)

(assert (=> d!3881 (= lt!7366 lt!7357)))

(declare-fun lt!7370 () array!1209)

(assert (=> d!3881 (= (arrayCountValidKeys!0 lt!7370 (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (bvadd (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!1209 (_ BitVec 32)) Unit!459)

(assert (=> d!3881 (= lt!7357 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!7370 (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777))))))

(assert (=> d!3881 (= lt!7370 (array!1210 (store (arr!573 (_keys!3139 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (size!666 (_keys!3139 lt!6656))))))

(declare-fun lt!7375 () Unit!459)

(declare-fun lt!7362 () Unit!459)

(assert (=> d!3881 (= lt!7375 lt!7362)))

(declare-fun lt!7367 () array!1209)

(assert (=> d!3881 (arrayContainsKey!0 lt!7367 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000)))

(assert (=> d!3881 (= lt!7362 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!7367 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777))))))

(assert (=> d!3881 (= lt!7367 (array!1210 (store (arr!573 (_keys!3139 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (size!666 (_keys!3139 lt!6656))))))

(declare-fun lt!7371 () Unit!459)

(declare-fun lt!7381 () Unit!459)

(assert (=> d!3881 (= lt!7371 lt!7381)))

(assert (=> d!3881 (= (+!42 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (getCurrentListMap!124 (array!1210 (store (arr!573 (_keys!3139 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (size!666 (_keys!3139 lt!6656))) (array!1208 (store (arr!572 (_values!1707 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ValueCellFull!299 (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))))) (size!665 (_values!1707 lt!6656))) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!2 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) (_ BitVec 64) V!1155 Int) Unit!459)

(assert (=> d!3881 (= lt!7381 (lemmaAddValidKeyToArrayThenAddPairToListMap!2 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7378 () Unit!459)

(declare-fun lt!7369 () Unit!459)

(assert (=> d!3881 (= lt!7378 lt!7369)))

(assert (=> d!3881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!1210 (store (arr!573 (_keys!3139 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (size!666 (_keys!3139 lt!6656))) (mask!4691 lt!6656))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!1209 (_ BitVec 32) (_ BitVec 32)) Unit!459)

(assert (=> d!3881 (= lt!7369 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3139 lt!6656) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (mask!4691 lt!6656)))))

(declare-fun lt!7364 () Unit!459)

(declare-fun lt!7361 () Unit!459)

(assert (=> d!3881 (= lt!7364 lt!7361)))

(assert (=> d!3881 (= (arrayCountValidKeys!0 (array!1210 (store (arr!573 (_keys!3139 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (size!666 (_keys!3139 lt!6656))) #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))) (bvadd (arrayCountValidKeys!0 (_keys!3139 lt!6656) #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6656))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!1209 (_ BitVec 32) (_ BitVec 64)) Unit!459)

(assert (=> d!3881 (= lt!7361 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3139 lt!6656) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!7365 () Unit!459)

(declare-fun lt!7356 () Unit!459)

(assert (=> d!3881 (= lt!7365 lt!7356)))

(declare-fun lt!7383 () (_ BitVec 32))

(declare-fun lt!7368 () List!560)

(assert (=> d!3881 (arrayNoDuplicates!0 (array!1210 (store (arr!573 (_keys!3139 lt!6656)) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (size!666 (_keys!3139 lt!6656))) lt!7383 lt!7368)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!1209 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!560) Unit!459)

(assert (=> d!3881 (= lt!7356 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3139 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777)) lt!7383 lt!7368))))

(assert (=> d!3881 (= lt!7368 Nil!557)))

(assert (=> d!3881 (= lt!7383 #b00000000000000000000000000000000)))

(declare-fun lt!7380 () Unit!459)

(declare-fun e!14357 () Unit!459)

(assert (=> d!3881 (= lt!7380 e!14357)))

(declare-fun c!2668 () Bool)

(assert (=> d!3881 (= c!2668 (arrayContainsKey!0 (_keys!3139 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun lt!7360 () Unit!459)

(declare-fun e!14358 () Unit!459)

(assert (=> d!3881 (= lt!7360 e!14358)))

(declare-fun c!2670 () Bool)

(assert (=> d!3881 (= c!2670 (contains!225 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3881 (valid!101 lt!6656)))

(assert (=> d!3881 (= (updateHelperNewKey!7 lt!6656 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938)))) (ite c!2497 (index!2331 lt!6777) (index!2328 lt!6777))) lt!7363)))

(declare-fun b!22135 () Bool)

(declare-fun e!14361 () Bool)

(declare-fun call!1551 () Bool)

(assert (=> b!22135 (= e!14361 (not call!1551))))

(declare-fun b!22136 () Bool)

(declare-fun res!14073 () Bool)

(assert (=> b!22136 (=> (not res!14073) (not e!14361))))

(assert (=> b!22136 (= res!14073 call!1549)))

(declare-fun e!14359 () Bool)

(assert (=> b!22136 (= e!14359 e!14361)))

(declare-fun b!22137 () Bool)

(declare-fun res!14076 () Bool)

(declare-fun lt!7373 () SeekEntryResult!52)

(assert (=> b!22137 (= res!14076 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2331 lt!7373)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14360 () Bool)

(assert (=> b!22137 (=> (not res!14076) (not e!14360))))

(declare-fun b!22138 () Bool)

(declare-fun Unit!489 () Unit!459)

(assert (=> b!22138 (= e!14358 Unit!489)))

(declare-fun lt!7358 () Unit!459)

(assert (=> b!22138 (= lt!7358 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1718 lt!6656)))))

(declare-fun lt!7355 () SeekEntryResult!52)

(declare-fun call!1550 () SeekEntryResult!52)

(assert (=> b!22138 (= lt!7355 call!1550)))

(declare-fun res!14081 () Bool)

(assert (=> b!22138 (= res!14081 ((_ is Found!52) lt!7355))))

(declare-fun e!14355 () Bool)

(assert (=> b!22138 (=> (not res!14081) (not e!14355))))

(assert (=> b!22138 e!14355))

(declare-fun lt!7372 () Unit!459)

(assert (=> b!22138 (= lt!7372 lt!7358)))

(assert (=> b!22138 false))

(declare-fun b!22139 () Bool)

(declare-fun e!14354 () Bool)

(assert (=> b!22139 (= e!14354 e!14360)))

(declare-fun res!14078 () Bool)

(assert (=> b!22139 (= res!14078 call!1549)))

(assert (=> b!22139 (=> (not res!14078) (not e!14360))))

(declare-fun b!22140 () Bool)

(declare-fun lt!7374 () Unit!459)

(assert (=> b!22140 (= e!14358 lt!7374)))

(assert (=> b!22140 (= lt!7374 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1718 lt!6656)))))

(assert (=> b!22140 (= lt!7373 call!1550)))

(declare-fun c!2667 () Bool)

(assert (=> b!22140 (= c!2667 ((_ is MissingZero!52) lt!7373))))

(assert (=> b!22140 e!14359))

(declare-fun b!22141 () Bool)

(declare-fun Unit!490 () Unit!459)

(assert (=> b!22141 (= e!14357 Unit!490)))

(declare-fun b!22142 () Bool)

(assert (=> b!22142 (= e!14356 (= (map!395 (_2!453 lt!7363)) (+!42 (map!395 lt!6656) (tuple2!903 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2446 c!2447) (zeroValue!1645 (v!1570 (underlying!103 thiss!938))) (minValue!1645 (v!1570 (underlying!103 thiss!938))))))))))

(declare-fun b!22143 () Bool)

(assert (=> b!22143 (= e!14355 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2329 lt!7355)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!1547 () Bool)

(assert (=> bm!1547 (= call!1551 (arrayContainsKey!0 (_keys!3139 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun b!22144 () Bool)

(declare-fun res!14074 () Bool)

(assert (=> b!22144 (=> (not res!14074) (not e!14361))))

(assert (=> b!22144 (= res!14074 (= (select (arr!573 (_keys!3139 lt!6656)) (index!2328 lt!7373)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22145 () Bool)

(declare-fun Unit!491 () Unit!459)

(assert (=> b!22145 (= e!14357 Unit!491)))

(declare-fun lt!7376 () Unit!459)

(declare-fun lemmaArrayContainsKeyThenInListMap!2 (array!1209 array!1207 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) (_ BitVec 32) Int) Unit!459)

(assert (=> b!22145 (= lt!7376 (lemmaArrayContainsKeyThenInListMap!2 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)))))

(assert (=> b!22145 (contains!225 (getCurrentListMap!124 (_keys!3139 lt!6656) (_values!1707 lt!6656) (mask!4691 lt!6656) (extraKeys!1621 lt!6656) (zeroValue!1645 lt!6656) (minValue!1645 lt!6656) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6656)) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!7384 () Unit!459)

(assert (=> b!22145 (= lt!7384 lt!7376)))

(assert (=> b!22145 false))

(declare-fun b!22146 () Bool)

(assert (=> b!22146 (= e!14354 ((_ is Undefined!52) lt!7373))))

(declare-fun b!22147 () Bool)

(declare-fun res!14080 () Bool)

(assert (=> b!22147 (= res!14080 call!1552)))

(assert (=> b!22147 (=> (not res!14080) (not e!14355))))

(declare-fun b!22148 () Bool)

(declare-fun res!14075 () Bool)

(assert (=> b!22148 (=> (not res!14075) (not e!14356))))

(assert (=> b!22148 (= res!14075 (valid!101 (_2!453 lt!7363)))))

(declare-fun b!22149 () Bool)

(declare-fun c!2669 () Bool)

(assert (=> b!22149 (= c!2669 ((_ is MissingVacant!52) lt!7373))))

(assert (=> b!22149 (= e!14359 e!14354)))

(declare-fun bm!1548 () Bool)

(assert (=> bm!1548 (= call!1550 (seekEntryOrOpen!0 (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3139 lt!6656) (mask!4691 lt!6656)))))

(declare-fun b!22150 () Bool)

(assert (=> b!22150 (= e!14360 (not call!1551))))

(declare-fun bm!1549 () Bool)

(assert (=> bm!1549 (= call!1552 (inRange!0 (ite c!2670 (index!2329 lt!7355) (ite c!2667 (index!2328 lt!7373) (index!2331 lt!7373))) (mask!4691 lt!6656)))))

(assert (= (and d!3881 c!2670) b!22138))

(assert (= (and d!3881 (not c!2670)) b!22140))

(assert (= (and b!22138 res!14081) b!22147))

(assert (= (and b!22147 res!14080) b!22143))

(assert (= (and b!22140 c!2667) b!22136))

(assert (= (and b!22140 (not c!2667)) b!22149))

(assert (= (and b!22136 res!14073) b!22144))

(assert (= (and b!22144 res!14074) b!22135))

(assert (= (and b!22149 c!2669) b!22139))

(assert (= (and b!22149 (not c!2669)) b!22146))

(assert (= (and b!22139 res!14078) b!22137))

(assert (= (and b!22137 res!14076) b!22150))

(assert (= (or b!22136 b!22139) bm!1546))

(assert (= (or b!22135 b!22150) bm!1547))

(assert (= (or b!22147 bm!1546) bm!1549))

(assert (= (or b!22138 b!22140) bm!1548))

(assert (= (and d!3881 c!2668) b!22145))

(assert (= (and d!3881 (not c!2668)) b!22141))

(assert (= (and d!3881 res!14077) b!22148))

(assert (= (and b!22148 res!14075) b!22134))

(assert (= (and b!22134 res!14079) b!22142))

(declare-fun m!15964 () Bool)

(assert (=> bm!1549 m!15964))

(declare-fun m!15966 () Bool)

(assert (=> b!22144 m!15966))

(declare-fun m!15968 () Bool)

(assert (=> b!22145 m!15968))

(assert (=> b!22145 m!14909))

(assert (=> b!22145 m!14909))

(assert (=> b!22145 m!14955))

(assert (=> d!3881 m!15359))

(declare-fun m!15970 () Bool)

(assert (=> d!3881 m!15970))

(declare-fun m!15972 () Bool)

(assert (=> d!3881 m!15972))

(assert (=> d!3881 m!14909))

(assert (=> d!3881 m!14955))

(declare-fun m!15974 () Bool)

(assert (=> d!3881 m!15974))

(declare-fun m!15976 () Bool)

(assert (=> d!3881 m!15976))

(declare-fun m!15978 () Bool)

(assert (=> d!3881 m!15978))

(assert (=> d!3881 m!14931))

(declare-fun m!15980 () Bool)

(assert (=> d!3881 m!15980))

(declare-fun m!15982 () Bool)

(assert (=> d!3881 m!15982))

(declare-fun m!15984 () Bool)

(assert (=> d!3881 m!15984))

(declare-fun m!15986 () Bool)

(assert (=> d!3881 m!15986))

(assert (=> d!3881 m!14937))

(declare-fun m!15988 () Bool)

(assert (=> d!3881 m!15988))

(declare-fun m!15990 () Bool)

(assert (=> d!3881 m!15990))

(declare-fun m!15992 () Bool)

(assert (=> d!3881 m!15992))

(declare-fun m!15994 () Bool)

(assert (=> d!3881 m!15994))

(assert (=> d!3881 m!14909))

(assert (=> d!3881 m!15970))

(assert (=> d!3881 m!15982))

(declare-fun m!15996 () Bool)

(assert (=> d!3881 m!15996))

(declare-fun m!15998 () Bool)

(assert (=> d!3881 m!15998))

(declare-fun m!16000 () Bool)

(assert (=> d!3881 m!16000))

(assert (=> d!3881 m!14909))

(assert (=> d!3881 m!15199))

(declare-fun m!16002 () Bool)

(assert (=> d!3881 m!16002))

(declare-fun m!16004 () Bool)

(assert (=> d!3881 m!16004))

(assert (=> b!22140 m!14959))

(assert (=> bm!1548 m!14911))

(declare-fun m!16006 () Bool)

(assert (=> b!22148 m!16006))

(declare-fun m!16008 () Bool)

(assert (=> b!22137 m!16008))

(assert (=> b!22138 m!14923))

(assert (=> bm!1547 m!14931))

(declare-fun m!16010 () Bool)

(assert (=> b!22142 m!16010))

(assert (=> b!22142 m!14903))

(assert (=> b!22142 m!14903))

(declare-fun m!16012 () Bool)

(assert (=> b!22142 m!16012))

(declare-fun m!16014 () Bool)

(assert (=> b!22143 m!16014))

(assert (=> b!22134 m!16010))

(assert (=> b!22134 m!16010))

(declare-fun m!16016 () Bool)

(assert (=> b!22134 m!16016))

(assert (=> bm!1421 d!3881))

(declare-fun bm!1550 () Bool)

(declare-fun call!1553 () Bool)

(declare-fun call!1556 () Bool)

(assert (=> bm!1550 (= call!1553 call!1556)))

(declare-fun b!22151 () Bool)

(declare-fun res!14088 () Bool)

(declare-fun e!14364 () Bool)

(assert (=> b!22151 (=> (not res!14088) (not e!14364))))

(declare-fun lt!7393 () tuple2!900)

(assert (=> b!22151 (= res!14088 (contains!225 (map!395 (_2!453 lt!7393)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!3883 () Bool)

(assert (=> d!3883 e!14364))

(declare-fun res!14086 () Bool)

(assert (=> d!3883 (=> (not res!14086) (not e!14364))))

(assert (=> d!3883 (= res!14086 (_1!453 lt!7393))))

(assert (=> d!3883 (= lt!7393 (tuple2!901 true (LongMapFixedSize!185 (defaultEntry!1718 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (bvadd (_size!133 (_2!453 lt!6655)) #b00000000000000000000000000000001) (array!1210 (store (arr!573 (_keys!3139 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000) (size!666 (_keys!3139 (_2!453 lt!6655)))) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655)))) (_vacant!133 (_2!453 lt!6655)))))))

(declare-fun lt!7407 () Unit!459)

(declare-fun lt!7409 () Unit!459)

(assert (=> d!3883 (= lt!7407 lt!7409)))

(declare-fun lt!7389 () array!1207)

(declare-fun lt!7412 () array!1209)

(assert (=> d!3883 (contains!225 (getCurrentListMap!124 lt!7412 lt!7389 (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) (select (store (arr!573 (_keys!3139 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879))))))

(assert (=> d!3883 (= lt!7409 (lemmaValidKeyInArrayIsInListMap!7 lt!7412 lt!7389 (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> d!3883 (= lt!7389 (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655)))))))

(assert (=> d!3883 (= lt!7412 (array!1210 (store (arr!573 (_keys!3139 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000) (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun lt!7396 () Unit!459)

(declare-fun lt!7387 () Unit!459)

(assert (=> d!3883 (= lt!7396 lt!7387)))

(declare-fun lt!7400 () array!1209)

(assert (=> d!3883 (= (arrayCountValidKeys!0 lt!7400 (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) (bvadd (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!3883 (= lt!7387 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!7400 (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879))))))

(assert (=> d!3883 (= lt!7400 (array!1210 (store (arr!573 (_keys!3139 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000) (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun lt!7405 () Unit!459)

(declare-fun lt!7392 () Unit!459)

(assert (=> d!3883 (= lt!7405 lt!7392)))

(declare-fun lt!7397 () array!1209)

(assert (=> d!3883 (arrayContainsKey!0 lt!7397 #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!3883 (= lt!7392 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!7397 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879))))))

(assert (=> d!3883 (= lt!7397 (array!1210 (store (arr!573 (_keys!3139 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000) (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun lt!7401 () Unit!459)

(declare-fun lt!7411 () Unit!459)

(assert (=> d!3883 (= lt!7401 lt!7411)))

(assert (=> d!3883 (= (+!42 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (getCurrentListMap!124 (array!1210 (store (arr!573 (_keys!3139 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000) (size!666 (_keys!3139 (_2!453 lt!6655)))) (array!1208 (store (arr!572 (_values!1707 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) (ValueCellFull!299 (minValue!1645 (v!1570 (underlying!103 thiss!938))))) (size!665 (_values!1707 (_2!453 lt!6655)))) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> d!3883 (= lt!7411 (lemmaAddValidKeyToArrayThenAddPairToListMap!2 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))) (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7408 () Unit!459)

(declare-fun lt!7399 () Unit!459)

(assert (=> d!3883 (= lt!7408 lt!7399)))

(assert (=> d!3883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!1210 (store (arr!573 (_keys!3139 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000) (size!666 (_keys!3139 (_2!453 lt!6655)))) (mask!4691 (_2!453 lt!6655)))))

(assert (=> d!3883 (= lt!7399 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 (_2!453 lt!6655)) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) (mask!4691 (_2!453 lt!6655))))))

(declare-fun lt!7394 () Unit!459)

(declare-fun lt!7391 () Unit!459)

(assert (=> d!3883 (= lt!7394 lt!7391)))

(assert (=> d!3883 (= (arrayCountValidKeys!0 (array!1210 (store (arr!573 (_keys!3139 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000) (size!666 (_keys!3139 (_2!453 lt!6655)))) #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))) (bvadd (arrayCountValidKeys!0 (_keys!3139 (_2!453 lt!6655)) #b00000000000000000000000000000000 (size!666 (_keys!3139 (_2!453 lt!6655)))) #b00000000000000000000000000000001))))

(assert (=> d!3883 (= lt!7391 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3139 (_2!453 lt!6655)) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!7395 () Unit!459)

(declare-fun lt!7386 () Unit!459)

(assert (=> d!3883 (= lt!7395 lt!7386)))

(declare-fun lt!7398 () List!560)

(declare-fun lt!7413 () (_ BitVec 32))

(assert (=> d!3883 (arrayNoDuplicates!0 (array!1210 (store (arr!573 (_keys!3139 (_2!453 lt!6655))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) #b1000000000000000000000000000000000000000000000000000000000000000) (size!666 (_keys!3139 (_2!453 lt!6655)))) lt!7413 lt!7398)))

(assert (=> d!3883 (= lt!7386 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3139 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879)) lt!7413 lt!7398))))

(assert (=> d!3883 (= lt!7398 Nil!557)))

(assert (=> d!3883 (= lt!7413 #b00000000000000000000000000000000)))

(declare-fun lt!7410 () Unit!459)

(declare-fun e!14365 () Unit!459)

(assert (=> d!3883 (= lt!7410 e!14365)))

(declare-fun c!2672 () Bool)

(assert (=> d!3883 (= c!2672 (arrayContainsKey!0 (_keys!3139 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun lt!7390 () Unit!459)

(declare-fun e!14366 () Unit!459)

(assert (=> d!3883 (= lt!7390 e!14366)))

(declare-fun c!2674 () Bool)

(assert (=> d!3883 (= c!2674 (contains!225 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3883 (valid!101 (_2!453 lt!6655))))

(assert (=> d!3883 (= (updateHelperNewKey!7 (_2!453 lt!6655) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938))) (ite c!2520 (index!2331 lt!6879) (index!2328 lt!6879))) lt!7393)))

(declare-fun b!22152 () Bool)

(declare-fun e!14369 () Bool)

(declare-fun call!1555 () Bool)

(assert (=> b!22152 (= e!14369 (not call!1555))))

(declare-fun b!22153 () Bool)

(declare-fun res!14082 () Bool)

(assert (=> b!22153 (=> (not res!14082) (not e!14369))))

(assert (=> b!22153 (= res!14082 call!1553)))

(declare-fun e!14367 () Bool)

(assert (=> b!22153 (= e!14367 e!14369)))

(declare-fun b!22154 () Bool)

(declare-fun res!14085 () Bool)

(declare-fun lt!7403 () SeekEntryResult!52)

(assert (=> b!22154 (= res!14085 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2331 lt!7403)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14368 () Bool)

(assert (=> b!22154 (=> (not res!14085) (not e!14368))))

(declare-fun b!22155 () Bool)

(declare-fun Unit!492 () Unit!459)

(assert (=> b!22155 (= e!14366 Unit!492)))

(declare-fun lt!7388 () Unit!459)

(assert (=> b!22155 (= lt!7388 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(declare-fun lt!7385 () SeekEntryResult!52)

(declare-fun call!1554 () SeekEntryResult!52)

(assert (=> b!22155 (= lt!7385 call!1554)))

(declare-fun res!14090 () Bool)

(assert (=> b!22155 (= res!14090 ((_ is Found!52) lt!7385))))

(declare-fun e!14363 () Bool)

(assert (=> b!22155 (=> (not res!14090) (not e!14363))))

(assert (=> b!22155 e!14363))

(declare-fun lt!7402 () Unit!459)

(assert (=> b!22155 (= lt!7402 lt!7388)))

(assert (=> b!22155 false))

(declare-fun b!22156 () Bool)

(declare-fun e!14362 () Bool)

(assert (=> b!22156 (= e!14362 e!14368)))

(declare-fun res!14087 () Bool)

(assert (=> b!22156 (= res!14087 call!1553)))

(assert (=> b!22156 (=> (not res!14087) (not e!14368))))

(declare-fun b!22157 () Bool)

(declare-fun lt!7404 () Unit!459)

(assert (=> b!22157 (= e!14366 lt!7404)))

(assert (=> b!22157 (= lt!7404 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> b!22157 (= lt!7403 call!1554)))

(declare-fun c!2671 () Bool)

(assert (=> b!22157 (= c!2671 ((_ is MissingZero!52) lt!7403))))

(assert (=> b!22157 e!14367))

(declare-fun b!22158 () Bool)

(declare-fun Unit!493 () Unit!459)

(assert (=> b!22158 (= e!14365 Unit!493)))

(declare-fun b!22159 () Bool)

(assert (=> b!22159 (= e!14364 (= (map!395 (_2!453 lt!7393)) (+!42 (map!395 (_2!453 lt!6655)) (tuple2!903 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1570 (underlying!103 thiss!938)))))))))

(declare-fun b!22160 () Bool)

(assert (=> b!22160 (= e!14363 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2329 lt!7385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1551 () Bool)

(assert (=> bm!1551 (= call!1555 (arrayContainsKey!0 (_keys!3139 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!22161 () Bool)

(declare-fun res!14083 () Bool)

(assert (=> b!22161 (=> (not res!14083) (not e!14369))))

(assert (=> b!22161 (= res!14083 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) (index!2328 lt!7403)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22162 () Bool)

(declare-fun Unit!494 () Unit!459)

(assert (=> b!22162 (= e!14365 Unit!494)))

(declare-fun lt!7406 () Unit!459)

(assert (=> b!22162 (= lt!7406 (lemmaArrayContainsKeyThenInListMap!2 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))))))

(assert (=> b!22162 (contains!225 (getCurrentListMap!124 (_keys!3139 (_2!453 lt!6655)) (_values!1707 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655)) (extraKeys!1621 (_2!453 lt!6655)) (zeroValue!1645 (_2!453 lt!6655)) (minValue!1645 (_2!453 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!453 lt!6655))) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7414 () Unit!459)

(assert (=> b!22162 (= lt!7414 lt!7406)))

(assert (=> b!22162 false))

(declare-fun b!22163 () Bool)

(assert (=> b!22163 (= e!14362 ((_ is Undefined!52) lt!7403))))

(declare-fun b!22164 () Bool)

(declare-fun res!14089 () Bool)

(assert (=> b!22164 (= res!14089 call!1556)))

(assert (=> b!22164 (=> (not res!14089) (not e!14363))))

(declare-fun b!22165 () Bool)

(declare-fun res!14084 () Bool)

(assert (=> b!22165 (=> (not res!14084) (not e!14364))))

(assert (=> b!22165 (= res!14084 (valid!101 (_2!453 lt!7393)))))

(declare-fun b!22166 () Bool)

(declare-fun c!2673 () Bool)

(assert (=> b!22166 (= c!2673 ((_ is MissingVacant!52) lt!7403))))

(assert (=> b!22166 (= e!14367 e!14362)))

(declare-fun bm!1552 () Bool)

(assert (=> bm!1552 (= call!1554 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 (_2!453 lt!6655)) (mask!4691 (_2!453 lt!6655))))))

(declare-fun b!22167 () Bool)

(assert (=> b!22167 (= e!14368 (not call!1555))))

(declare-fun bm!1553 () Bool)

(assert (=> bm!1553 (= call!1556 (inRange!0 (ite c!2674 (index!2329 lt!7385) (ite c!2671 (index!2328 lt!7403) (index!2331 lt!7403))) (mask!4691 (_2!453 lt!6655))))))

(assert (= (and d!3883 c!2674) b!22155))

(assert (= (and d!3883 (not c!2674)) b!22157))

(assert (= (and b!22155 res!14090) b!22164))

(assert (= (and b!22164 res!14089) b!22160))

(assert (= (and b!22157 c!2671) b!22153))

(assert (= (and b!22157 (not c!2671)) b!22166))

(assert (= (and b!22153 res!14082) b!22161))

(assert (= (and b!22161 res!14083) b!22152))

(assert (= (and b!22166 c!2673) b!22156))

(assert (= (and b!22166 (not c!2673)) b!22163))

(assert (= (and b!22156 res!14087) b!22154))

(assert (= (and b!22154 res!14085) b!22167))

(assert (= (or b!22153 b!22156) bm!1550))

(assert (= (or b!22152 b!22167) bm!1551))

(assert (= (or b!22164 bm!1550) bm!1553))

(assert (= (or b!22155 b!22157) bm!1552))

(assert (= (and d!3883 c!2672) b!22162))

(assert (= (and d!3883 (not c!2672)) b!22158))

(assert (= (and d!3883 res!14086) b!22165))

(assert (= (and b!22165 res!14084) b!22151))

(assert (= (and b!22151 res!14088) b!22159))

(declare-fun m!16018 () Bool)

(assert (=> bm!1553 m!16018))

(declare-fun m!16020 () Bool)

(assert (=> b!22161 m!16020))

(declare-fun m!16022 () Bool)

(assert (=> b!22162 m!16022))

(assert (=> b!22162 m!15013))

(assert (=> b!22162 m!15013))

(assert (=> b!22162 m!15059))

(assert (=> d!3883 m!15159))

(declare-fun m!16024 () Bool)

(assert (=> d!3883 m!16024))

(declare-fun m!16026 () Bool)

(assert (=> d!3883 m!16026))

(assert (=> d!3883 m!15013))

(assert (=> d!3883 m!15059))

(declare-fun m!16028 () Bool)

(assert (=> d!3883 m!16028))

(declare-fun m!16030 () Bool)

(assert (=> d!3883 m!16030))

(declare-fun m!16032 () Bool)

(assert (=> d!3883 m!16032))

(assert (=> d!3883 m!15035))

(declare-fun m!16034 () Bool)

(assert (=> d!3883 m!16034))

(declare-fun m!16036 () Bool)

(assert (=> d!3883 m!16036))

(declare-fun m!16038 () Bool)

(assert (=> d!3883 m!16038))

(declare-fun m!16040 () Bool)

(assert (=> d!3883 m!16040))

(assert (=> d!3883 m!15041))

(declare-fun m!16042 () Bool)

(assert (=> d!3883 m!16042))

(declare-fun m!16044 () Bool)

(assert (=> d!3883 m!16044))

(declare-fun m!16046 () Bool)

(assert (=> d!3883 m!16046))

(declare-fun m!16048 () Bool)

(assert (=> d!3883 m!16048))

(assert (=> d!3883 m!15013))

(assert (=> d!3883 m!16024))

(assert (=> d!3883 m!16036))

(declare-fun m!16050 () Bool)

(assert (=> d!3883 m!16050))

(declare-fun m!16052 () Bool)

(assert (=> d!3883 m!16052))

(declare-fun m!16054 () Bool)

(assert (=> d!3883 m!16054))

(assert (=> d!3883 m!15013))

(assert (=> d!3883 m!15137))

(declare-fun m!16056 () Bool)

(assert (=> d!3883 m!16056))

(declare-fun m!16058 () Bool)

(assert (=> d!3883 m!16058))

(assert (=> b!22157 m!15063))

(assert (=> bm!1552 m!15015))

(declare-fun m!16060 () Bool)

(assert (=> b!22165 m!16060))

(declare-fun m!16062 () Bool)

(assert (=> b!22154 m!16062))

(assert (=> b!22155 m!15027))

(assert (=> bm!1551 m!15035))

(declare-fun m!16064 () Bool)

(assert (=> b!22159 m!16064))

(assert (=> b!22159 m!15007))

(assert (=> b!22159 m!15007))

(declare-fun m!16066 () Bool)

(assert (=> b!22159 m!16066))

(declare-fun m!16068 () Bool)

(assert (=> b!22160 m!16068))

(assert (=> b!22151 m!16064))

(assert (=> b!22151 m!16064))

(declare-fun m!16070 () Bool)

(assert (=> b!22151 m!16070))

(assert (=> bm!1445 d!3883))

(declare-fun d!3885 () Bool)

(declare-fun res!14091 () Bool)

(declare-fun e!14370 () Bool)

(assert (=> d!3885 (=> res!14091 e!14370)))

(assert (=> d!3885 (= res!14091 (= (select (arr!573 (_keys!3139 lt!6656)) #b00000000000000000000000000000000) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3885 (= (arrayContainsKey!0 (_keys!3139 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000) e!14370)))

(declare-fun b!22168 () Bool)

(declare-fun e!14371 () Bool)

(assert (=> b!22168 (= e!14370 e!14371)))

(declare-fun res!14092 () Bool)

(assert (=> b!22168 (=> (not res!14092) (not e!14371))))

(assert (=> b!22168 (= res!14092 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!666 (_keys!3139 lt!6656))))))

(declare-fun b!22169 () Bool)

(assert (=> b!22169 (= e!14371 (arrayContainsKey!0 (_keys!3139 lt!6656) (ite (or c!2446 c!2447) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3885 (not res!14091)) b!22168))

(assert (= (and b!22168 res!14092) b!22169))

(assert (=> d!3885 m!15241))

(declare-fun m!16072 () Bool)

(assert (=> b!22169 m!16072))

(assert (=> bm!1408 d!3885))

(declare-fun d!3887 () Bool)

(declare-fun res!14093 () Bool)

(declare-fun e!14372 () Bool)

(assert (=> d!3887 (=> res!14093 e!14372)))

(assert (=> d!3887 (= res!14093 (= (select (arr!573 (_keys!3139 (_2!453 lt!6655))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3887 (= (arrayContainsKey!0 (_keys!3139 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000) e!14372)))

(declare-fun b!22170 () Bool)

(declare-fun e!14373 () Bool)

(assert (=> b!22170 (= e!14372 e!14373)))

(declare-fun res!14094 () Bool)

(assert (=> b!22170 (=> (not res!14094) (not e!14373))))

(assert (=> b!22170 (= res!14094 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!666 (_keys!3139 (_2!453 lt!6655)))))))

(declare-fun b!22171 () Bool)

(assert (=> b!22171 (= e!14373 (arrayContainsKey!0 (_keys!3139 (_2!453 lt!6655)) #b1000000000000000000000000000000000000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3887 (not res!14093)) b!22170))

(assert (= (and b!22170 res!14094) b!22171))

(assert (=> d!3887 m!15317))

(declare-fun m!16074 () Bool)

(assert (=> b!22171 m!16074))

(assert (=> bm!1432 d!3887))

(declare-fun d!3889 () Bool)

(declare-fun res!14095 () Bool)

(declare-fun e!14374 () Bool)

(assert (=> d!3889 (=> (not res!14095) (not e!14374))))

(assert (=> d!3889 (= res!14095 (simpleValid!19 lt!6843))))

(assert (=> d!3889 (= (valid!101 lt!6843) e!14374)))

(declare-fun b!22172 () Bool)

(declare-fun res!14096 () Bool)

(assert (=> b!22172 (=> (not res!14096) (not e!14374))))

(assert (=> b!22172 (= res!14096 (= (arrayCountValidKeys!0 (_keys!3139 lt!6843) #b00000000000000000000000000000000 (size!666 (_keys!3139 lt!6843))) (_size!133 lt!6843)))))

(declare-fun b!22173 () Bool)

(declare-fun res!14097 () Bool)

(assert (=> b!22173 (=> (not res!14097) (not e!14374))))

(assert (=> b!22173 (= res!14097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 lt!6843) (mask!4691 lt!6843)))))

(declare-fun b!22174 () Bool)

(assert (=> b!22174 (= e!14374 (arrayNoDuplicates!0 (_keys!3139 lt!6843) #b00000000000000000000000000000000 Nil!557))))

(assert (= (and d!3889 res!14095) b!22172))

(assert (= (and b!22172 res!14096) b!22173))

(assert (= (and b!22173 res!14097) b!22174))

(declare-fun m!16076 () Bool)

(assert (=> d!3889 m!16076))

(declare-fun m!16078 () Bool)

(assert (=> b!22172 m!16078))

(declare-fun m!16080 () Bool)

(assert (=> b!22173 m!16080))

(declare-fun m!16082 () Bool)

(assert (=> b!22174 m!16082))

(assert (=> d!3705 d!3889))

(declare-fun b!22175 () Bool)

(declare-fun e!14376 () Bool)

(declare-fun call!1557 () Bool)

(assert (=> b!22175 (= e!14376 call!1557)))

(declare-fun bm!1554 () Bool)

(assert (=> bm!1554 (= call!1557 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!6832 #b00000000000000000000000000000001) lt!6848 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938))))))))

(declare-fun b!22177 () Bool)

(declare-fun e!14377 () Bool)

(assert (=> b!22177 (= e!14377 e!14376)))

(declare-fun c!2675 () Bool)

(assert (=> b!22177 (= c!2675 (validKeyInArray!0 (select (arr!573 lt!6848) lt!6832)))))

(declare-fun b!22178 () Bool)

(declare-fun e!14375 () Bool)

(assert (=> b!22178 (= e!14375 call!1557)))

(declare-fun d!3891 () Bool)

(declare-fun res!14099 () Bool)

(assert (=> d!3891 (=> res!14099 e!14377)))

(assert (=> d!3891 (= res!14099 (bvsge lt!6832 (size!666 lt!6848)))))

(assert (=> d!3891 (= (arrayForallSeekEntryOrOpenFound!0 lt!6832 lt!6848 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938))))) e!14377)))

(declare-fun b!22176 () Bool)

(assert (=> b!22176 (= e!14376 e!14375)))

(declare-fun lt!7415 () (_ BitVec 64))

(assert (=> b!22176 (= lt!7415 (select (arr!573 lt!6848) lt!6832))))

(declare-fun lt!7416 () Unit!459)

(assert (=> b!22176 (= lt!7416 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!6848 lt!7415 lt!6832))))

(assert (=> b!22176 (arrayContainsKey!0 lt!6848 lt!7415 #b00000000000000000000000000000000)))

(declare-fun lt!7417 () Unit!459)

(assert (=> b!22176 (= lt!7417 lt!7416)))

(declare-fun res!14098 () Bool)

(assert (=> b!22176 (= res!14098 (= (seekEntryOrOpen!0 (select (arr!573 lt!6848) lt!6832) lt!6848 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938))))) (Found!52 lt!6832)))))

(assert (=> b!22176 (=> (not res!14098) (not e!14375))))

(assert (= (and d!3891 (not res!14099)) b!22177))

(assert (= (and b!22177 c!2675) b!22176))

(assert (= (and b!22177 (not c!2675)) b!22175))

(assert (= (and b!22176 res!14098) b!22178))

(assert (= (or b!22178 b!22175) bm!1554))

(assert (=> bm!1554 m!14835))

(declare-fun m!16084 () Bool)

(assert (=> bm!1554 m!16084))

(declare-fun m!16086 () Bool)

(assert (=> b!22177 m!16086))

(assert (=> b!22177 m!16086))

(declare-fun m!16088 () Bool)

(assert (=> b!22177 m!16088))

(assert (=> b!22176 m!16086))

(declare-fun m!16090 () Bool)

(assert (=> b!22176 m!16090))

(declare-fun m!16092 () Bool)

(assert (=> b!22176 m!16092))

(assert (=> b!22176 m!16086))

(assert (=> b!22176 m!14835))

(declare-fun m!16094 () Bool)

(assert (=> b!22176 m!16094))

(assert (=> d!3705 d!3891))

(declare-fun d!3893 () Bool)

(assert (=> d!3893 (arrayNoDuplicates!0 lt!6833 lt!6840 lt!6838)))

(declare-fun lt!7420 () Unit!459)

(declare-fun choose!111 (array!1209 (_ BitVec 32) (_ BitVec 32) List!560) Unit!459)

(assert (=> d!3893 (= lt!7420 (choose!111 lt!6833 lt!6840 (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) lt!6838))))

(assert (=> d!3893 (= (size!666 lt!6833) (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3893 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!6833 lt!6840 (bvadd (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) lt!6838) lt!7420)))

(declare-fun bs!929 () Bool)

(assert (= bs!929 d!3893))

(assert (=> bs!929 m!14977))

(declare-fun m!16096 () Bool)

(assert (=> bs!929 m!16096))

(assert (=> d!3705 d!3893))

(declare-fun d!3895 () Bool)

(assert (=> d!3895 (= (validMask!0 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938))))) (and (or (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000000111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000001111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000011111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000000111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000001111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000011111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000000111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000001111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000011111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000000111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000001111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000011111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000000111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000001111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000011111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000000111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000001111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000011111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000000111111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000001111111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000011111111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000000111111111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000001111111111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000011111111111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00000111111111111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00001111111111111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00011111111111111111111111111111) (= (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00111111111111111111111111111111)) (bvsle (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) #b00111111111111111111111111111111)))))

(assert (=> d!3705 d!3895))

(declare-fun d!3897 () Bool)

(declare-fun lt!7421 () (_ BitVec 32))

(assert (=> d!3897 (and (bvsge lt!7421 #b00000000000000000000000000000000) (bvsle lt!7421 (bvsub (size!666 lt!6839) lt!6827)))))

(declare-fun e!14379 () (_ BitVec 32))

(assert (=> d!3897 (= lt!7421 e!14379)))

(declare-fun c!2676 () Bool)

(assert (=> d!3897 (= c!2676 (bvsge lt!6827 lt!6830))))

(assert (=> d!3897 (and (bvsle lt!6827 lt!6830) (bvsge lt!6827 #b00000000000000000000000000000000) (bvsle lt!6830 (size!666 lt!6839)))))

(assert (=> d!3897 (= (arrayCountValidKeys!0 lt!6839 lt!6827 lt!6830) lt!7421)))

(declare-fun b!22179 () Bool)

(assert (=> b!22179 (= e!14379 #b00000000000000000000000000000000)))

(declare-fun call!1558 () (_ BitVec 32))

(declare-fun bm!1555 () Bool)

(assert (=> bm!1555 (= call!1558 (arrayCountValidKeys!0 lt!6839 (bvadd lt!6827 #b00000000000000000000000000000001) lt!6830))))

(declare-fun b!22180 () Bool)

(declare-fun e!14378 () (_ BitVec 32))

(assert (=> b!22180 (= e!14378 (bvadd #b00000000000000000000000000000001 call!1558))))

(declare-fun b!22181 () Bool)

(assert (=> b!22181 (= e!14378 call!1558)))

(declare-fun b!22182 () Bool)

(assert (=> b!22182 (= e!14379 e!14378)))

(declare-fun c!2677 () Bool)

(assert (=> b!22182 (= c!2677 (validKeyInArray!0 (select (arr!573 lt!6839) lt!6827)))))

(assert (= (and d!3897 c!2676) b!22179))

(assert (= (and d!3897 (not c!2676)) b!22182))

(assert (= (and b!22182 c!2677) b!22180))

(assert (= (and b!22182 (not c!2677)) b!22181))

(assert (= (or b!22180 b!22181) bm!1555))

(declare-fun m!16098 () Bool)

(assert (=> bm!1555 m!16098))

(declare-fun m!16100 () Bool)

(assert (=> b!22182 m!16100))

(assert (=> b!22182 m!16100))

(declare-fun m!16102 () Bool)

(assert (=> b!22182 m!16102))

(assert (=> d!3705 d!3897))

(declare-fun d!3899 () Bool)

(assert (=> d!3899 (= (arrayCountValidKeys!0 lt!6839 lt!6827 lt!6830) #b00000000000000000000000000000000)))

(declare-fun lt!7424 () Unit!459)

(declare-fun choose!59 (array!1209 (_ BitVec 32) (_ BitVec 32)) Unit!459)

(assert (=> d!3899 (= lt!7424 (choose!59 lt!6839 lt!6827 lt!6830))))

(assert (=> d!3899 (bvslt (size!666 lt!6839) #b01111111111111111111111111111111)))

(assert (=> d!3899 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6839 lt!6827 lt!6830) lt!7424)))

(declare-fun bs!930 () Bool)

(assert (= bs!930 d!3899))

(assert (=> bs!930 m!14963))

(declare-fun m!16104 () Bool)

(assert (=> bs!930 m!16104))

(assert (=> d!3705 d!3899))

(assert (=> d!3705 d!3745))

(declare-fun d!3901 () Bool)

(assert (=> d!3901 (arrayForallSeekEntryOrOpenFound!0 lt!6832 lt!6848 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))))))

(declare-fun lt!7427 () Unit!459)

(declare-fun choose!34 (array!1209 (_ BitVec 32) (_ BitVec 32)) Unit!459)

(assert (=> d!3901 (= lt!7427 (choose!34 lt!6848 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) lt!6832))))

(assert (=> d!3901 (validMask!0 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))))))

(assert (=> d!3901 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6848 (computeNewMask!23 thiss!938 (mask!4691 (v!1570 (underlying!103 thiss!938))) (_vacant!133 (v!1570 (underlying!103 thiss!938))) (_size!133 (v!1570 (underlying!103 thiss!938)))) lt!6832) lt!7427)))

(declare-fun bs!931 () Bool)

(assert (= bs!931 d!3901))

(assert (=> bs!931 m!14835))

(assert (=> bs!931 m!14979))

(assert (=> bs!931 m!14835))

(declare-fun m!16106 () Bool)

(assert (=> bs!931 m!16106))

(assert (=> bs!931 m!14835))

(assert (=> bs!931 m!14973))

(assert (=> d!3705 d!3901))

(declare-fun e!14383 () Bool)

(declare-fun b!22183 () Bool)

(assert (=> b!22183 (= e!14383 (contains!226 lt!6838 (select (arr!573 lt!6833) lt!6840)))))

(declare-fun d!3903 () Bool)

(declare-fun res!14102 () Bool)

(declare-fun e!14382 () Bool)

(assert (=> d!3903 (=> res!14102 e!14382)))

(assert (=> d!3903 (= res!14102 (bvsge lt!6840 (size!666 lt!6833)))))

(assert (=> d!3903 (= (arrayNoDuplicates!0 lt!6833 lt!6840 lt!6838) e!14382)))

(declare-fun b!22184 () Bool)

(declare-fun e!14380 () Bool)

(declare-fun call!1559 () Bool)

(assert (=> b!22184 (= e!14380 call!1559)))

(declare-fun b!22185 () Bool)

(declare-fun e!14381 () Bool)

(assert (=> b!22185 (= e!14381 e!14380)))

(declare-fun c!2678 () Bool)

(assert (=> b!22185 (= c!2678 (validKeyInArray!0 (select (arr!573 lt!6833) lt!6840)))))

(declare-fun b!22186 () Bool)

(assert (=> b!22186 (= e!14382 e!14381)))

(declare-fun res!14101 () Bool)

(assert (=> b!22186 (=> (not res!14101) (not e!14381))))

(assert (=> b!22186 (= res!14101 (not e!14383))))

(declare-fun res!14100 () Bool)

(assert (=> b!22186 (=> (not res!14100) (not e!14383))))

(assert (=> b!22186 (= res!14100 (validKeyInArray!0 (select (arr!573 lt!6833) lt!6840)))))

(declare-fun bm!1556 () Bool)

(assert (=> bm!1556 (= call!1559 (arrayNoDuplicates!0 lt!6833 (bvadd lt!6840 #b00000000000000000000000000000001) (ite c!2678 (Cons!556 (select (arr!573 lt!6833) lt!6840) lt!6838) lt!6838)))))

(declare-fun b!22187 () Bool)

(assert (=> b!22187 (= e!14380 call!1559)))

(assert (= (and d!3903 (not res!14102)) b!22186))

(assert (= (and b!22186 res!14100) b!22183))

(assert (= (and b!22186 res!14101) b!22185))

(assert (= (and b!22185 c!2678) b!22184))

(assert (= (and b!22185 (not c!2678)) b!22187))

(assert (= (or b!22184 b!22187) bm!1556))

(declare-fun m!16108 () Bool)

(assert (=> b!22183 m!16108))

(assert (=> b!22183 m!16108))

(declare-fun m!16110 () Bool)

(assert (=> b!22183 m!16110))

(assert (=> b!22185 m!16108))

(assert (=> b!22185 m!16108))

(declare-fun m!16112 () Bool)

(assert (=> b!22185 m!16112))

(assert (=> b!22186 m!16108))

(assert (=> b!22186 m!16108))

(assert (=> b!22186 m!16112))

(assert (=> bm!1556 m!16108))

(declare-fun m!16114 () Bool)

(assert (=> bm!1556 m!16114))

(assert (=> d!3705 d!3903))

(declare-fun mapNonEmpty!986 () Bool)

(declare-fun mapRes!986 () Bool)

(declare-fun tp!3452 () Bool)

(declare-fun e!14384 () Bool)

(assert (=> mapNonEmpty!986 (= mapRes!986 (and tp!3452 e!14384))))

(declare-fun mapRest!986 () (Array (_ BitVec 32) ValueCell!299))

(declare-fun mapValue!986 () ValueCell!299)

(declare-fun mapKey!986 () (_ BitVec 32))

(assert (=> mapNonEmpty!986 (= mapRest!985 (store mapRest!986 mapKey!986 mapValue!986))))

(declare-fun b!22189 () Bool)

(declare-fun e!14385 () Bool)

(assert (=> b!22189 (= e!14385 tp_is_empty!997)))

(declare-fun mapIsEmpty!986 () Bool)

(assert (=> mapIsEmpty!986 mapRes!986))

(declare-fun condMapEmpty!986 () Bool)

(declare-fun mapDefault!986 () ValueCell!299)

(assert (=> mapNonEmpty!985 (= condMapEmpty!986 (= mapRest!985 ((as const (Array (_ BitVec 32) ValueCell!299)) mapDefault!986)))))

(assert (=> mapNonEmpty!985 (= tp!3451 (and e!14385 mapRes!986))))

(declare-fun b!22188 () Bool)

(assert (=> b!22188 (= e!14384 tp_is_empty!997)))

(assert (= (and mapNonEmpty!985 condMapEmpty!986) mapIsEmpty!986))

(assert (= (and mapNonEmpty!985 (not condMapEmpty!986)) mapNonEmpty!986))

(assert (= (and mapNonEmpty!986 ((_ is ValueCellFull!299) mapValue!986)) b!22188))

(assert (= (and mapNonEmpty!985 ((_ is ValueCellFull!299) mapDefault!986)) b!22189))

(declare-fun m!16116 () Bool)

(assert (=> mapNonEmpty!986 m!16116))

(declare-fun b_lambda!1539 () Bool)

(assert (= b_lambda!1527 (or (and b!21293 b_free!733) b_lambda!1539)))

(declare-fun b_lambda!1541 () Bool)

(assert (= b_lambda!1525 (or (and b!21293 b_free!733) b_lambda!1541)))

(check-sat (not b!21989) (not b!21837) (not d!3801) (not b!21686) (not d!3875) (not b!21883) (not b!22145) (not b!21996) (not b!22099) (not bm!1478) (not b_lambda!1537) (not b!21879) (not b!21739) (not b!22077) (not bm!1512) (not b!21758) (not b!21893) (not d!3765) (not d!3795) (not b!21870) (not b!22072) (not b!22177) (not b!22049) (not bm!1513) (not b_lambda!1515) (not bm!1506) (not d!3827) (not b_lambda!1519) (not b!22075) (not b!21762) (not bm!1488) (not bm!1509) (not b!21962) (not b!21888) (not b!21799) (not b!22032) (not b!21834) (not b!21869) (not b!21761) (not bm!1477) (not b!21871) (not bm!1471) (not d!3867) (not d!3899) (not b!21684) (not b!21833) (not b!21873) (not b!21887) (not d!3811) (not d!3789) (not d!3879) (not d!3817) (not b!21911) (not bm!1519) (not bm!1485) (not d!3747) (not d!3901) (not b!21947) (not b!22148) tp_is_empty!997 (not b!21769) (not b!22155) (not b!21766) (not b!21706) (not bm!1511) (not b!21764) (not b!22054) (not d!3873) (not b!22027) (not d!3721) (not b_next!733) (not bm!1496) (not b!21682) (not b!21720) (not b!22052) (not d!3781) (not b!21737) (not b!21723) (not d!3777) (not b!21991) (not b!22043) (not b!22051) (not b!22095) (not b!21901) (not bm!1520) (not mapNonEmpty!986) (not b!22182) (not b!21726) (not b!21877) (not b!22067) (not b!22078) (not b!22157) (not d!3869) (not b!21905) (not b!21863) (not b!21800) (not b!22066) (not b_lambda!1521) (not b!22042) (not d!3855) (not d!3825) (not b!21954) (not b!22138) (not b!22171) (not b!22169) (not b!21794) (not b!21949) (not d!3803) (not b!21875) (not d!3807) (not b!21777) (not b!21738) (not bm!1516) (not d!3783) (not d!3863) (not b!22053) (not b!21759) (not b!21740) (not b!21983) (not d!3763) (not b!21990) (not b!22174) (not b!21801) (not d!3847) (not b!22186) (not b!21948) (not b!21687) (not b!22183) (not d!3737) (not b_lambda!1539) (not d!3823) (not b!21693) (not b!21796) (not bm!1523) (not d!3821) (not d!3769) (not bm!1549) (not b!22134) (not bm!1476) (not b!22055) (not d!3805) (not b!22159) (not d!3831) (not d!3871) (not d!3877) (not d!3791) (not b!21882) (not d!3767) (not bm!1555) (not d!3835) (not d!3841) (not b!21781) (not d!3727) (not d!3785) (not d!3751) (not d!3813) (not b!21692) (not bm!1483) (not b!21886) (not b!21707) (not b!22059) (not b!21704) (not b!21968) (not d!3729) (not b!21797) (not b!21993) (not b!22008) (not b!21866) (not d!3793) (not bm!1536) (not b!21733) (not d!3723) (not b!22016) (not d!3809) (not b!22057) (not b!21838) (not b!21868) (not d!3771) (not b_lambda!1531) (not b!21743) (not d!3799) (not d!3815) (not bm!1530) (not b_lambda!1529) (not b!21763) (not d!3881) (not b!22068) (not b!21713) (not b!22083) (not bm!1484) (not bm!1525) (not d!3773) (not b!22004) (not d!3845) (not d!3857) (not b!21987) (not b!21827) (not b!22079) (not d!3883) (not b!21950) (not b!21972) (not b_lambda!1517) (not d!3733) (not d!3865) (not b!21757) (not b_lambda!1535) (not b!22073) (not b!22185) (not d!3759) (not b!21970) (not b!22142) (not b!21966) (not d!3725) (not d!3843) (not b!22080) (not b!21765) (not b!21736) (not bm!1535) (not d!3893) (not bm!1481) (not b!21735) (not d!3819) (not bm!1548) (not d!3787) (not b!21755) (not bm!1474) (not d!3797) (not b!21880) (not bm!1491) (not b!21872) (not bm!1552) (not b!21885) (not b!21821) (not bm!1505) (not b!22097) (not bm!1547) (not b!22176) (not b!22151) (not b!22015) (not b!22030) (not b!22165) (not d!3745) (not b!21685) (not b!22173) (not b!21890) (not bm!1494) (not b!22140) (not bm!1518) (not bm!1497) (not b!22172) (not b!21971) (not d!3859) (not b!21798) (not bm!1556) (not d!3861) (not b!21913) (not bm!1551) (not d!3889) (not bm!1554) (not b!21832) (not b_lambda!1541) (not d!3735) (not b!21951) (not d!3849) (not d!3853) (not b!22074) (not b_lambda!1523) (not b!21683) (not d!3851) b_and!1443 (not b!21992) (not b!21889) (not d!3837) (not bm!1503) (not bm!1526) (not bm!1537) (not b!21876) (not b!21751) (not b!21975) (not b!22076) (not b!22056) (not b!21803) (not b!22162) (not bm!1527) (not b!22017) (not bm!1553) (not b!21836) (not b_lambda!1533) (not b!22091) (not b!22028) (not b!21969) (not b!22071) (not d!3761) (not b!22065) (not bm!1533) (not bm!1498) (not d!3753) (not b!21795) (not bm!1504))
(check-sat b_and!1443 (not b_next!733))
