; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3342 () Bool)

(assert start!3342)

(declare-fun b!21011 () Bool)

(declare-fun b_free!729 () Bool)

(declare-fun b_next!729 () Bool)

(assert (=> b!21011 (= b_free!729 (not b_next!729))))

(declare-fun tp!3421 () Bool)

(declare-fun b_and!1413 () Bool)

(assert (=> b!21011 (= tp!3421 b_and!1413)))

(declare-fun b!21007 () Bool)

(declare-fun res!13646 () Bool)

(declare-fun e!13720 () Bool)

(assert (=> b!21007 (=> (not res!13646) (not e!13720))))

(declare-datatypes ((V!1149 0))(
  ( (V!1150 (val!523 Int)) )
))
(declare-datatypes ((ValueCell!297 0))(
  ( (ValueCellFull!297 (v!1565 V!1149)) (EmptyCell!297) )
))
(declare-datatypes ((array!1215 0))(
  ( (array!1216 (arr!577 (Array (_ BitVec 32) ValueCell!297)) (size!670 (_ BitVec 32))) )
))
(declare-datatypes ((array!1217 0))(
  ( (array!1218 (arr!578 (Array (_ BitVec 32) (_ BitVec 64))) (size!671 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!180 0))(
  ( (LongMapFixedSize!181 (defaultEntry!1715 Int) (mask!4685 (_ BitVec 32)) (extraKeys!1619 (_ BitVec 32)) (zeroValue!1643 V!1149) (minValue!1643 V!1149) (_size!130 (_ BitVec 32)) (_keys!3137 array!1217) (_values!1705 array!1215) (_vacant!130 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!180 0))(
  ( (Cell!181 (v!1566 LongMapFixedSize!180)) )
))
(declare-datatypes ((LongMap!180 0))(
  ( (LongMap!181 (underlying!101 Cell!180)) )
))
(declare-fun thiss!938 () LongMap!180)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!21007 (= res!13646 (validMask!0 (mask!4685 (v!1566 (underlying!101 thiss!938)))))))

(declare-fun b!21008 () Bool)

(declare-fun res!13642 () Bool)

(assert (=> b!21008 (=> (not res!13642) (not e!13720))))

(assert (=> b!21008 (= res!13642 (and (= (size!671 (_keys!3137 (v!1566 (underlying!101 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4685 (v!1566 (underlying!101 thiss!938))))) (bvsge (bvsub (size!671 (_keys!3137 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (size!671 (_keys!3137 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001) (size!671 (_keys!3137 (v!1566 (underlying!101 thiss!938)))))))))

(declare-fun b!21009 () Bool)

(declare-fun e!13717 () Bool)

(declare-fun e!13712 () Bool)

(declare-fun mapRes!967 () Bool)

(assert (=> b!21009 (= e!13717 (and e!13712 mapRes!967))))

(declare-fun condMapEmpty!967 () Bool)

(declare-fun mapDefault!967 () ValueCell!297)

(assert (=> b!21009 (= condMapEmpty!967 (= (arr!577 (_values!1705 (v!1566 (underlying!101 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!297)) mapDefault!967)))))

(declare-fun bm!1230 () Bool)

(declare-datatypes ((tuple2!882 0))(
  ( (tuple2!883 (_1!444 Bool) (_2!444 LongMapFixedSize!180)) )
))
(declare-fun call!1233 () tuple2!882)

(declare-fun call!1234 () tuple2!882)

(assert (=> bm!1230 (= call!1233 call!1234)))

(declare-fun b!21010 () Bool)

(declare-datatypes ((tuple2!884 0))(
  ( (tuple2!885 (_1!445 Bool) (_2!445 Cell!180)) )
))
(declare-fun lt!6431 () tuple2!884)

(assert (=> b!21010 (= e!13720 (bvslt (bvadd #b00000000000000000000000000000001 (mask!4685 (v!1566 (_2!445 lt!6431)))) (_size!130 (v!1566 (underlying!101 thiss!938)))))))

(declare-fun tp_is_empty!993 () Bool)

(declare-fun e!13723 () Bool)

(declare-fun array_inv!391 (array!1217) Bool)

(declare-fun array_inv!392 (array!1215) Bool)

(assert (=> b!21011 (= e!13723 (and tp!3421 tp_is_empty!993 (array_inv!391 (_keys!3137 (v!1566 (underlying!101 thiss!938)))) (array_inv!392 (_values!1705 (v!1566 (underlying!101 thiss!938)))) e!13717))))

(declare-fun b!21012 () Bool)

(declare-fun e!13715 () Bool)

(assert (=> b!21012 (= e!13715 e!13723)))

(declare-fun b!21013 () Bool)

(declare-fun e!13718 () Bool)

(assert (=> b!21013 (= e!13718 tp_is_empty!993)))

(declare-fun b!21015 () Bool)

(declare-fun e!13719 () tuple2!884)

(declare-fun lt!6430 () LongMapFixedSize!180)

(assert (=> b!21015 (= e!13719 (tuple2!885 true (Cell!181 lt!6430)))))

(declare-fun mapNonEmpty!967 () Bool)

(declare-fun tp!3420 () Bool)

(assert (=> mapNonEmpty!967 (= mapRes!967 (and tp!3420 e!13718))))

(declare-fun mapRest!967 () (Array (_ BitVec 32) ValueCell!297))

(declare-fun mapValue!967 () ValueCell!297)

(declare-fun mapKey!967 () (_ BitVec 32))

(assert (=> mapNonEmpty!967 (= (arr!577 (_values!1705 (v!1566 (underlying!101 thiss!938)))) (store mapRest!967 mapKey!967 mapValue!967))))

(declare-fun b!21016 () Bool)

(declare-fun lt!6434 () tuple2!882)

(assert (=> b!21016 (= e!13719 (tuple2!885 (_1!444 lt!6434) (Cell!181 (_2!444 lt!6434))))))

(assert (=> b!21016 (= lt!6434 call!1233)))

(declare-fun b!21017 () Bool)

(declare-fun e!13716 () Bool)

(assert (=> b!21017 (= e!13716 e!13720)))

(declare-fun res!13644 () Bool)

(assert (=> b!21017 (=> (not res!13644) (not e!13720))))

(assert (=> b!21017 (= res!13644 (_1!445 lt!6431))))

(declare-fun e!13722 () tuple2!884)

(assert (=> b!21017 (= lt!6431 e!13722)))

(declare-fun c!2371 () Bool)

(declare-fun lt!6432 () Bool)

(assert (=> b!21017 (= c!2371 (and (not lt!6432) (not (= (bvand (extraKeys!1619 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!21017 (= lt!6432 (= (bvand (extraKeys!1619 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!25 ((_ BitVec 32) Int) LongMapFixedSize!180)

(declare-fun computeNewMask!21 (LongMap!180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21017 (= lt!6430 (getNewLongMapFixedSize!25 (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) (defaultEntry!1715 (v!1566 (underlying!101 thiss!938)))))))

(declare-fun b!21018 () Bool)

(declare-fun c!2370 () Bool)

(assert (=> b!21018 (= c!2370 (and (not (= (bvand (extraKeys!1619 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6432))))

(declare-fun e!13714 () tuple2!884)

(assert (=> b!21018 (= e!13714 e!13719)))

(declare-fun b!21019 () Bool)

(assert (=> b!21019 (= e!13712 tp_is_empty!993)))

(declare-fun c!2369 () Bool)

(declare-fun bm!1231 () Bool)

(declare-fun update!22 (LongMapFixedSize!180 (_ BitVec 64) V!1149) tuple2!882)

(assert (=> bm!1231 (= call!1234 (update!22 lt!6430 (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938))))))))

(declare-fun b!21020 () Bool)

(declare-fun lt!6433 () tuple2!882)

(assert (=> b!21020 (= lt!6433 call!1233)))

(assert (=> b!21020 (= e!13714 (tuple2!885 (_1!444 lt!6433) (Cell!181 (_2!444 lt!6433))))))

(declare-fun mapIsEmpty!967 () Bool)

(assert (=> mapIsEmpty!967 mapRes!967))

(declare-fun b!21021 () Bool)

(declare-fun res!13645 () Bool)

(assert (=> b!21021 (=> (not res!13645) (not e!13720))))

(declare-fun valid!90 (LongMapFixedSize!180) Bool)

(assert (=> b!21021 (= res!13645 (valid!90 (v!1566 (_2!445 lt!6431))))))

(declare-fun b!21014 () Bool)

(declare-fun lt!6429 () tuple2!882)

(declare-fun lt!6435 () tuple2!882)

(assert (=> b!21014 (= e!13722 (tuple2!885 (and (_1!444 lt!6429) (_1!444 lt!6435)) (Cell!181 (_2!444 lt!6435))))))

(assert (=> b!21014 (= lt!6429 call!1234)))

(assert (=> b!21014 (= lt!6435 (update!22 (_2!444 lt!6429) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1643 (v!1566 (underlying!101 thiss!938)))))))

(declare-fun res!13643 () Bool)

(assert (=> start!3342 (=> (not res!13643) (not e!13716))))

(declare-fun valid!91 (LongMap!180) Bool)

(assert (=> start!3342 (= res!13643 (valid!91 thiss!938))))

(assert (=> start!3342 e!13716))

(declare-fun e!13713 () Bool)

(assert (=> start!3342 e!13713))

(declare-fun b!21022 () Bool)

(assert (=> b!21022 (= e!13713 e!13715)))

(declare-fun b!21023 () Bool)

(assert (=> b!21023 (= e!13722 e!13714)))

(assert (=> b!21023 (= c!2369 (and (not lt!6432) (= (bvand (extraKeys!1619 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!3342 res!13643) b!21017))

(assert (= (and b!21017 c!2371) b!21014))

(assert (= (and b!21017 (not c!2371)) b!21023))

(assert (= (and b!21023 c!2369) b!21020))

(assert (= (and b!21023 (not c!2369)) b!21018))

(assert (= (and b!21018 c!2370) b!21016))

(assert (= (and b!21018 (not c!2370)) b!21015))

(assert (= (or b!21020 b!21016) bm!1230))

(assert (= (or b!21014 bm!1230) bm!1231))

(assert (= (and b!21017 res!13644) b!21007))

(assert (= (and b!21007 res!13646) b!21008))

(assert (= (and b!21008 res!13642) b!21021))

(assert (= (and b!21021 res!13645) b!21010))

(assert (= (and b!21009 condMapEmpty!967) mapIsEmpty!967))

(assert (= (and b!21009 (not condMapEmpty!967)) mapNonEmpty!967))

(get-info :version)

(assert (= (and mapNonEmpty!967 ((_ is ValueCellFull!297) mapValue!967)) b!21013))

(assert (= (and b!21009 ((_ is ValueCellFull!297) mapDefault!967)) b!21019))

(assert (= b!21011 b!21009))

(assert (= b!21012 b!21011))

(assert (= b!21022 b!21012))

(assert (= start!3342 b!21022))

(declare-fun m!14685 () Bool)

(assert (=> b!21007 m!14685))

(declare-fun m!14687 () Bool)

(assert (=> bm!1231 m!14687))

(declare-fun m!14689 () Bool)

(assert (=> start!3342 m!14689))

(declare-fun m!14691 () Bool)

(assert (=> b!21014 m!14691))

(declare-fun m!14693 () Bool)

(assert (=> b!21021 m!14693))

(declare-fun m!14695 () Bool)

(assert (=> b!21017 m!14695))

(assert (=> b!21017 m!14695))

(declare-fun m!14697 () Bool)

(assert (=> b!21017 m!14697))

(declare-fun m!14699 () Bool)

(assert (=> mapNonEmpty!967 m!14699))

(declare-fun m!14701 () Bool)

(assert (=> b!21011 m!14701))

(declare-fun m!14703 () Bool)

(assert (=> b!21011 m!14703))

(check-sat tp_is_empty!993 (not mapNonEmpty!967) (not start!3342) (not bm!1231) (not b!21017) b_and!1413 (not b!21011) (not b!21014) (not b!21021) (not b!21007) (not b_next!729))
(check-sat b_and!1413 (not b_next!729))
(get-model)

(declare-fun d!3717 () Bool)

(assert (=> d!3717 (= (valid!91 thiss!938) (valid!90 (v!1566 (underlying!101 thiss!938))))))

(declare-fun bs!905 () Bool)

(assert (= bs!905 d!3717))

(declare-fun m!14725 () Bool)

(assert (=> bs!905 m!14725))

(assert (=> start!3342 d!3717))

(declare-fun bm!1286 () Bool)

(declare-fun c!2411 () Bool)

(declare-datatypes ((tuple2!890 0))(
  ( (tuple2!891 (_1!448 (_ BitVec 64)) (_2!448 V!1149)) )
))
(declare-datatypes ((List!559 0))(
  ( (Nil!556) (Cons!555 (h!1121 tuple2!890) (t!3216 List!559)) )
))
(declare-datatypes ((ListLongMap!557 0))(
  ( (ListLongMap!558 (toList!294 List!559)) )
))
(declare-fun call!1299 () ListLongMap!557)

(declare-fun lt!6517 () (_ BitVec 32))

(declare-fun c!2413 () Bool)

(declare-fun c!2407 () Bool)

(declare-fun lt!6536 () array!1215)

(declare-fun lt!6523 () (_ BitVec 32))

(declare-fun getCurrentListMap!125 (array!1217 array!1215 (_ BitVec 32) (_ BitVec 32) V!1149 V!1149 (_ BitVec 32) Int) ListLongMap!557)

(assert (=> bm!1286 (= call!1299 (getCurrentListMap!125 (_keys!3137 (_2!444 lt!6429)) (ite (or c!2411 c!2407) (_values!1705 (_2!444 lt!6429)) lt!6536) (mask!4685 (_2!444 lt!6429)) (ite c!2411 (ite c!2413 lt!6523 lt!6517) (extraKeys!1619 (_2!444 lt!6429))) (ite (and c!2411 c!2413) (minValue!1643 (v!1566 (underlying!101 thiss!938))) (zeroValue!1643 (_2!444 lt!6429))) (ite c!2411 (ite c!2413 (minValue!1643 (_2!444 lt!6429)) (minValue!1643 (v!1566 (underlying!101 thiss!938)))) (minValue!1643 (_2!444 lt!6429))) #b00000000000000000000000000000000 (defaultEntry!1715 (_2!444 lt!6429))))))

(declare-fun bm!1287 () Bool)

(declare-datatypes ((SeekEntryResult!50 0))(
  ( (MissingZero!50 (index!2320 (_ BitVec 32))) (Found!50 (index!2321 (_ BitVec 32))) (Intermediate!50 (undefined!862 Bool) (index!2322 (_ BitVec 32)) (x!5113 (_ BitVec 32))) (Undefined!50) (MissingVacant!50 (index!2323 (_ BitVec 32))) )
))
(declare-fun call!1295 () SeekEntryResult!50)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1217 (_ BitVec 32)) SeekEntryResult!50)

(assert (=> bm!1287 (= call!1295 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3137 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429))))))

(declare-fun bm!1288 () Bool)

(declare-fun call!1289 () ListLongMap!557)

(assert (=> bm!1288 (= call!1289 call!1299)))

(declare-fun bm!1289 () Bool)

(declare-fun call!1311 () Bool)

(declare-fun call!1306 () Bool)

(assert (=> bm!1289 (= call!1311 call!1306)))

(declare-fun b!21151 () Bool)

(declare-datatypes ((Unit!441 0))(
  ( (Unit!442) )
))
(declare-fun lt!6532 () Unit!441)

(declare-fun lt!6528 () Unit!441)

(assert (=> b!21151 (= lt!6532 lt!6528)))

(declare-fun call!1308 () Bool)

(assert (=> b!21151 call!1308))

(declare-fun lt!6521 () SeekEntryResult!50)

(declare-fun lemmaValidKeyInArrayIsInListMap!6 (array!1217 array!1215 (_ BitVec 32) (_ BitVec 32) V!1149 V!1149 (_ BitVec 32) Int) Unit!441)

(assert (=> b!21151 (= lt!6528 (lemmaValidKeyInArrayIsInListMap!6 (_keys!3137 (_2!444 lt!6429)) lt!6536 (mask!4685 (_2!444 lt!6429)) (extraKeys!1619 (_2!444 lt!6429)) (zeroValue!1643 (_2!444 lt!6429)) (minValue!1643 (_2!444 lt!6429)) (index!2321 lt!6521) (defaultEntry!1715 (_2!444 lt!6429))))))

(assert (=> b!21151 (= lt!6536 (array!1216 (store (arr!577 (_values!1705 (_2!444 lt!6429))) (index!2321 lt!6521) (ValueCellFull!297 (minValue!1643 (v!1566 (underlying!101 thiss!938))))) (size!670 (_values!1705 (_2!444 lt!6429)))))))

(declare-fun lt!6537 () Unit!441)

(declare-fun lt!6516 () Unit!441)

(assert (=> b!21151 (= lt!6537 lt!6516)))

(declare-fun call!1303 () ListLongMap!557)

(assert (=> b!21151 (= call!1303 (getCurrentListMap!125 (_keys!3137 (_2!444 lt!6429)) (array!1216 (store (arr!577 (_values!1705 (_2!444 lt!6429))) (index!2321 lt!6521) (ValueCellFull!297 (minValue!1643 (v!1566 (underlying!101 thiss!938))))) (size!670 (_values!1705 (_2!444 lt!6429)))) (mask!4685 (_2!444 lt!6429)) (extraKeys!1619 (_2!444 lt!6429)) (zeroValue!1643 (_2!444 lt!6429)) (minValue!1643 (_2!444 lt!6429)) #b00000000000000000000000000000000 (defaultEntry!1715 (_2!444 lt!6429))))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!6 (array!1217 array!1215 (_ BitVec 32) (_ BitVec 32) V!1149 V!1149 (_ BitVec 32) (_ BitVec 64) V!1149 Int) Unit!441)

(assert (=> b!21151 (= lt!6516 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!6 (_keys!3137 (_2!444 lt!6429)) (_values!1705 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429)) (extraKeys!1619 (_2!444 lt!6429)) (zeroValue!1643 (_2!444 lt!6429)) (minValue!1643 (_2!444 lt!6429)) (index!2321 lt!6521) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1643 (v!1566 (underlying!101 thiss!938))) (defaultEntry!1715 (_2!444 lt!6429))))))

(declare-fun lt!6518 () Unit!441)

(declare-fun e!13810 () Unit!441)

(assert (=> b!21151 (= lt!6518 e!13810)))

(declare-fun c!2416 () Bool)

(declare-fun call!1297 () ListLongMap!557)

(declare-fun contains!224 (ListLongMap!557 (_ BitVec 64)) Bool)

(assert (=> b!21151 (= c!2416 (contains!224 call!1297 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13815 () tuple2!882)

(assert (=> b!21151 (= e!13815 (tuple2!883 true (LongMapFixedSize!181 (defaultEntry!1715 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429)) (extraKeys!1619 (_2!444 lt!6429)) (zeroValue!1643 (_2!444 lt!6429)) (minValue!1643 (_2!444 lt!6429)) (_size!130 (_2!444 lt!6429)) (_keys!3137 (_2!444 lt!6429)) (array!1216 (store (arr!577 (_values!1705 (_2!444 lt!6429))) (index!2321 lt!6521) (ValueCellFull!297 (minValue!1643 (v!1566 (underlying!101 thiss!938))))) (size!670 (_values!1705 (_2!444 lt!6429)))) (_vacant!130 (_2!444 lt!6429)))))))

(declare-fun b!21152 () Bool)

(declare-fun res!13690 () Bool)

(declare-fun e!13809 () Bool)

(assert (=> b!21152 (=> (not res!13690) (not e!13809))))

(declare-fun lt!6525 () SeekEntryResult!50)

(assert (=> b!21152 (= res!13690 (= (select (arr!578 (_keys!3137 (_2!444 lt!6429))) (index!2320 lt!6525)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1290 () Bool)

(declare-fun arrayContainsKey!0 (array!1217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1290 (= call!1306 (arrayContainsKey!0 (_keys!3137 (_2!444 lt!6429)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun bm!1291 () Bool)

(declare-fun call!1307 () Bool)

(assert (=> bm!1291 (= call!1307 call!1306)))

(declare-fun b!21153 () Bool)

(assert (=> b!21153 (= e!13809 (not call!1307))))

(declare-fun b!21154 () Bool)

(declare-fun lt!6535 () Unit!441)

(declare-fun lt!6515 () Unit!441)

(assert (=> b!21154 (= lt!6535 lt!6515)))

(declare-fun call!1296 () ListLongMap!557)

(declare-fun call!1294 () ListLongMap!557)

(assert (=> b!21154 (= call!1296 call!1294)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!6 (array!1217 array!1215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1149 V!1149 V!1149 Int) Unit!441)

(assert (=> b!21154 (= lt!6515 (lemmaChangeLongMinValueKeyThenAddPairToListMap!6 (_keys!3137 (_2!444 lt!6429)) (_values!1705 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429)) (extraKeys!1619 (_2!444 lt!6429)) lt!6517 (zeroValue!1643 (_2!444 lt!6429)) (minValue!1643 (_2!444 lt!6429)) (minValue!1643 (v!1566 (underlying!101 thiss!938))) (defaultEntry!1715 (_2!444 lt!6429))))))

(assert (=> b!21154 (= lt!6517 (bvor (extraKeys!1619 (_2!444 lt!6429)) #b00000000000000000000000000000010))))

(declare-fun e!13812 () tuple2!882)

(assert (=> b!21154 (= e!13812 (tuple2!883 true (LongMapFixedSize!181 (defaultEntry!1715 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429)) (bvor (extraKeys!1619 (_2!444 lt!6429)) #b00000000000000000000000000000010) (zeroValue!1643 (_2!444 lt!6429)) (minValue!1643 (v!1566 (underlying!101 thiss!938))) (_size!130 (_2!444 lt!6429)) (_keys!3137 (_2!444 lt!6429)) (_values!1705 (_2!444 lt!6429)) (_vacant!130 (_2!444 lt!6429)))))))

(declare-fun b!21155 () Bool)

(declare-fun res!13696 () Bool)

(declare-fun call!1298 () Bool)

(assert (=> b!21155 (= res!13696 call!1298)))

(declare-fun e!13811 () Bool)

(assert (=> b!21155 (=> (not res!13696) (not e!13811))))

(declare-fun bm!1292 () Bool)

(declare-fun call!1304 () Bool)

(assert (=> bm!1292 (= call!1304 call!1298)))

(declare-fun b!21156 () Bool)

(declare-fun e!13818 () Bool)

(declare-fun lt!6530 () SeekEntryResult!50)

(assert (=> b!21156 (= e!13818 (= (select (arr!578 (_keys!3137 (_2!444 lt!6429))) (index!2321 lt!6530)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1293 () Bool)

(declare-fun call!1310 () ListLongMap!557)

(declare-fun map!392 (LongMapFixedSize!180) ListLongMap!557)

(assert (=> bm!1293 (= call!1310 (map!392 (_2!444 lt!6429)))))

(declare-fun b!21157 () Bool)

(declare-fun e!13817 () Unit!441)

(declare-fun Unit!443 () Unit!441)

(assert (=> b!21157 (= e!13817 Unit!443)))

(declare-fun lt!6519 () Unit!441)

(declare-fun call!1312 () Unit!441)

(assert (=> b!21157 (= lt!6519 call!1312)))

(declare-fun lt!6511 () SeekEntryResult!50)

(declare-fun call!1305 () SeekEntryResult!50)

(assert (=> b!21157 (= lt!6511 call!1305)))

(declare-fun res!13698 () Bool)

(assert (=> b!21157 (= res!13698 ((_ is Found!50) lt!6511))))

(assert (=> b!21157 (=> (not res!13698) (not e!13811))))

(assert (=> b!21157 e!13811))

(declare-fun lt!6529 () Unit!441)

(assert (=> b!21157 (= lt!6529 lt!6519)))

(assert (=> b!21157 false))

(declare-fun bm!1294 () Bool)

(declare-fun call!1292 () SeekEntryResult!50)

(assert (=> bm!1294 (= call!1292 call!1295)))

(declare-fun bm!1295 () Bool)

(declare-fun call!1291 () ListLongMap!557)

(assert (=> bm!1295 (= call!1291 call!1297)))

(declare-fun b!21158 () Bool)

(assert (=> b!21158 (= e!13811 (= (select (arr!578 (_keys!3137 (_2!444 lt!6429))) (index!2321 lt!6511)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21159 () Bool)

(declare-fun e!13805 () Bool)

(declare-fun call!1290 () ListLongMap!557)

(assert (=> b!21159 (= e!13805 (= call!1290 call!1310))))

(declare-fun bm!1296 () Bool)

(assert (=> bm!1296 (= call!1297 (getCurrentListMap!125 (_keys!3137 (_2!444 lt!6429)) (_values!1705 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429)) (extraKeys!1619 (_2!444 lt!6429)) (zeroValue!1643 (_2!444 lt!6429)) (minValue!1643 (_2!444 lt!6429)) #b00000000000000000000000000000000 (defaultEntry!1715 (_2!444 lt!6429))))))

(declare-fun b!21160 () Bool)

(declare-fun c!2405 () Bool)

(assert (=> b!21160 (= c!2405 ((_ is MissingVacant!50) lt!6521))))

(declare-fun e!13819 () tuple2!882)

(declare-fun e!13808 () tuple2!882)

(assert (=> b!21160 (= e!13819 e!13808)))

(declare-fun b!21161 () Bool)

(declare-fun e!13802 () Bool)

(assert (=> b!21161 (= e!13802 (not call!1311))))

(declare-fun b!21162 () Bool)

(declare-fun lt!6534 () Unit!441)

(assert (=> b!21162 (= lt!6534 e!13817)))

(declare-fun c!2406 () Bool)

(assert (=> b!21162 (= c!2406 call!1308)))

(assert (=> b!21162 (= e!13819 (tuple2!883 false (_2!444 lt!6429)))))

(declare-fun b!21163 () Bool)

(declare-fun c!2414 () Bool)

(declare-fun lt!6512 () SeekEntryResult!50)

(assert (=> b!21163 (= c!2414 ((_ is MissingVacant!50) lt!6512))))

(declare-fun e!13806 () Bool)

(declare-fun e!13813 () Bool)

(assert (=> b!21163 (= e!13806 e!13813)))

(declare-fun bm!1297 () Bool)

(declare-fun lt!6527 () tuple2!882)

(assert (=> bm!1297 (= call!1290 (map!392 (_2!444 lt!6527)))))

(declare-fun b!21164 () Bool)

(assert (=> b!21164 (= e!13813 ((_ is Undefined!50) lt!6512))))

(declare-fun b!21165 () Bool)

(declare-fun res!13699 () Bool)

(declare-fun call!1300 () Bool)

(assert (=> b!21165 (= res!13699 call!1300)))

(assert (=> b!21165 (=> (not res!13699) (not e!13818))))

(declare-fun b!21166 () Bool)

(declare-fun e!13804 () Bool)

(declare-fun e!13800 () Bool)

(assert (=> b!21166 (= e!13804 e!13800)))

(declare-fun res!13701 () Bool)

(declare-fun call!1309 () Bool)

(assert (=> b!21166 (= res!13701 call!1309)))

(assert (=> b!21166 (=> (not res!13701) (not e!13800))))

(declare-fun b!21167 () Bool)

(declare-fun res!13691 () Bool)

(assert (=> b!21167 (=> (not res!13691) (not e!13802))))

(assert (=> b!21167 (= res!13691 call!1304)))

(assert (=> b!21167 (= e!13806 e!13802)))

(declare-fun call!1302 () tuple2!882)

(declare-fun bm!1298 () Bool)

(declare-fun updateHelperNewKey!6 (LongMapFixedSize!180 (_ BitVec 64) V!1149 (_ BitVec 32)) tuple2!882)

(assert (=> bm!1298 (= call!1302 (updateHelperNewKey!6 (_2!444 lt!6429) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1643 (v!1566 (underlying!101 thiss!938))) (ite c!2405 (index!2323 lt!6521) (index!2320 lt!6521))))))

(declare-fun b!21168 () Bool)

(declare-fun e!13816 () tuple2!882)

(assert (=> b!21168 (= e!13816 e!13819)))

(assert (=> b!21168 (= lt!6521 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3137 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429))))))

(assert (=> b!21168 (= c!2407 ((_ is Undefined!50) lt!6521))))

(declare-fun b!21169 () Bool)

(declare-fun lt!6514 () tuple2!882)

(assert (=> b!21169 (= e!13808 (tuple2!883 (_1!444 lt!6514) (_2!444 lt!6514)))))

(assert (=> b!21169 (= lt!6514 call!1302)))

(declare-fun b!21170 () Bool)

(declare-fun res!13697 () Bool)

(assert (=> b!21170 (= res!13697 (= (select (arr!578 (_keys!3137 (_2!444 lt!6429))) (index!2323 lt!6525)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21170 (=> (not res!13697) (not e!13800))))

(declare-fun bm!1299 () Bool)

(assert (=> bm!1299 (= call!1296 call!1303)))

(declare-fun bm!1300 () Bool)

(assert (=> bm!1300 (= call!1308 (contains!224 call!1289 (ite c!2407 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!578 (_keys!3137 (_2!444 lt!6429))) (index!2321 lt!6521)))))))

(declare-fun bm!1301 () Bool)

(assert (=> bm!1301 (= call!1309 call!1300)))

(declare-fun e!13807 () Bool)

(declare-fun b!21171 () Bool)

(declare-fun +!41 (ListLongMap!557 tuple2!890) ListLongMap!557)

(assert (=> b!21171 (= e!13807 (= call!1290 (+!41 call!1310 (tuple2!891 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1643 (v!1566 (underlying!101 thiss!938)))))))))

(declare-fun b!21172 () Bool)

(assert (=> b!21172 (= e!13804 ((_ is Undefined!50) lt!6525))))

(declare-fun b!21173 () Bool)

(declare-fun lt!6531 () Unit!441)

(assert (=> b!21173 (= e!13810 lt!6531)))

(assert (=> b!21173 (= lt!6531 call!1312)))

(assert (=> b!21173 (= lt!6530 call!1292)))

(declare-fun res!13693 () Bool)

(assert (=> b!21173 (= res!13693 ((_ is Found!50) lt!6530))))

(assert (=> b!21173 (=> (not res!13693) (not e!13818))))

(assert (=> b!21173 e!13818))

(declare-fun b!21174 () Bool)

(assert (=> b!21174 (= e!13816 e!13812)))

(assert (=> b!21174 (= c!2413 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1302 () Bool)

(assert (=> bm!1302 (= call!1294 call!1299)))

(declare-fun c!2410 () Bool)

(declare-fun call!1301 () Bool)

(declare-fun c!2409 () Bool)

(declare-fun bm!1303 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1303 (= call!1301 (inRange!0 (ite c!2407 (ite c!2406 (index!2321 lt!6511) (ite c!2409 (index!2320 lt!6512) (index!2323 lt!6512))) (ite c!2416 (index!2321 lt!6530) (ite c!2410 (index!2320 lt!6525) (index!2323 lt!6525)))) (mask!4685 (_2!444 lt!6429))))))

(declare-fun b!21175 () Bool)

(declare-fun Unit!444 () Unit!441)

(assert (=> b!21175 (= e!13810 Unit!444)))

(declare-fun lt!6526 () Unit!441)

(declare-fun call!1293 () Unit!441)

(assert (=> b!21175 (= lt!6526 call!1293)))

(assert (=> b!21175 (= lt!6525 call!1292)))

(assert (=> b!21175 (= c!2410 ((_ is MissingZero!50) lt!6525))))

(declare-fun e!13814 () Bool)

(assert (=> b!21175 e!13814))

(declare-fun lt!6522 () Unit!441)

(assert (=> b!21175 (= lt!6522 lt!6526)))

(assert (=> b!21175 false))

(declare-fun b!21176 () Bool)

(declare-fun e!13801 () Bool)

(assert (=> b!21176 (= e!13801 e!13805)))

(declare-fun c!2412 () Bool)

(assert (=> b!21176 (= c!2412 (_1!444 lt!6527))))

(declare-fun b!21177 () Bool)

(assert (=> b!21177 (= e!13800 (not call!1307))))

(declare-fun bm!1304 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!6 (array!1217 array!1215 (_ BitVec 32) (_ BitVec 32) V!1149 V!1149 (_ BitVec 64) Int) Unit!441)

(assert (=> bm!1304 (= call!1293 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!6 (_keys!3137 (_2!444 lt!6429)) (_values!1705 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429)) (extraKeys!1619 (_2!444 lt!6429)) (zeroValue!1643 (_2!444 lt!6429)) (minValue!1643 (_2!444 lt!6429)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1715 (_2!444 lt!6429))))))

(declare-fun b!21178 () Bool)

(declare-fun res!13700 () Bool)

(assert (=> b!21178 (=> (not res!13700) (not e!13809))))

(assert (=> b!21178 (= res!13700 call!1309)))

(assert (=> b!21178 (= e!13814 e!13809)))

(declare-fun d!3719 () Bool)

(assert (=> d!3719 e!13801))

(declare-fun res!13694 () Bool)

(assert (=> d!3719 (=> (not res!13694) (not e!13801))))

(assert (=> d!3719 (= res!13694 (valid!90 (_2!444 lt!6527)))))

(assert (=> d!3719 (= lt!6527 e!13816)))

(assert (=> d!3719 (= c!2411 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3719 (valid!90 (_2!444 lt!6429))))

(assert (=> d!3719 (= (update!22 (_2!444 lt!6429) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1643 (v!1566 (underlying!101 thiss!938)))) lt!6527)))

(declare-fun b!21179 () Bool)

(assert (=> b!21179 (= e!13808 e!13815)))

(declare-fun c!2415 () Bool)

(assert (=> b!21179 (= c!2415 ((_ is MissingZero!50) lt!6521))))

(declare-fun bm!1305 () Bool)

(assert (=> bm!1305 (= call!1300 call!1301)))

(declare-fun b!21180 () Bool)

(declare-fun e!13803 () Bool)

(assert (=> b!21180 (= e!13803 (not call!1311))))

(declare-fun b!21181 () Bool)

(declare-fun lt!6533 () Unit!441)

(assert (=> b!21181 (= e!13817 lt!6533)))

(assert (=> b!21181 (= lt!6533 call!1293)))

(assert (=> b!21181 (= lt!6512 call!1305)))

(assert (=> b!21181 (= c!2409 ((_ is MissingZero!50) lt!6512))))

(assert (=> b!21181 e!13806))

(declare-fun b!21182 () Bool)

(assert (=> b!21182 (= e!13805 e!13807)))

(declare-fun res!13695 () Bool)

(assert (=> b!21182 (= res!13695 (contains!224 call!1290 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21182 (=> (not res!13695) (not e!13807))))

(declare-fun b!21183 () Bool)

(declare-fun lt!6520 () tuple2!882)

(assert (=> b!21183 (= lt!6520 call!1302)))

(assert (=> b!21183 (= e!13815 (tuple2!883 (_1!444 lt!6520) (_2!444 lt!6520)))))

(declare-fun bm!1306 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!6 (array!1217 array!1215 (_ BitVec 32) (_ BitVec 32) V!1149 V!1149 (_ BitVec 64) Int) Unit!441)

(assert (=> bm!1306 (= call!1312 (lemmaInListMapThenSeekEntryOrOpenFindsIt!6 (_keys!3137 (_2!444 lt!6429)) (_values!1705 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429)) (extraKeys!1619 (_2!444 lt!6429)) (zeroValue!1643 (_2!444 lt!6429)) (minValue!1643 (_2!444 lt!6429)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1715 (_2!444 lt!6429))))))

(declare-fun b!21184 () Bool)

(declare-fun res!13692 () Bool)

(assert (=> b!21184 (= res!13692 (= (select (arr!578 (_keys!3137 (_2!444 lt!6429))) (index!2323 lt!6512)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21184 (=> (not res!13692) (not e!13803))))

(declare-fun b!21185 () Bool)

(declare-fun res!13703 () Bool)

(assert (=> b!21185 (=> (not res!13703) (not e!13802))))

(assert (=> b!21185 (= res!13703 (= (select (arr!578 (_keys!3137 (_2!444 lt!6429))) (index!2320 lt!6512)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21186 () Bool)

(declare-fun c!2408 () Bool)

(assert (=> b!21186 (= c!2408 ((_ is MissingVacant!50) lt!6525))))

(assert (=> b!21186 (= e!13814 e!13804)))

(declare-fun bm!1307 () Bool)

(assert (=> bm!1307 (= call!1303 (+!41 (ite c!2411 call!1291 call!1297) (ite c!2411 (ite c!2413 (tuple2!891 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1643 (v!1566 (underlying!101 thiss!938)))) (tuple2!891 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1643 (v!1566 (underlying!101 thiss!938))))) (tuple2!891 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1643 (v!1566 (underlying!101 thiss!938)))))))))

(declare-fun bm!1308 () Bool)

(assert (=> bm!1308 (= call!1305 call!1295)))

(declare-fun b!21187 () Bool)

(assert (=> b!21187 (= e!13813 e!13803)))

(declare-fun res!13702 () Bool)

(assert (=> b!21187 (= res!13702 call!1304)))

(assert (=> b!21187 (=> (not res!13702) (not e!13803))))

(declare-fun bm!1309 () Bool)

(assert (=> bm!1309 (= call!1298 call!1301)))

(declare-fun b!21188 () Bool)

(declare-fun lt!6524 () Unit!441)

(declare-fun lt!6513 () Unit!441)

(assert (=> b!21188 (= lt!6524 lt!6513)))

(assert (=> b!21188 (= call!1296 call!1294)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!6 (array!1217 array!1215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1149 V!1149 V!1149 Int) Unit!441)

(assert (=> b!21188 (= lt!6513 (lemmaChangeZeroKeyThenAddPairToListMap!6 (_keys!3137 (_2!444 lt!6429)) (_values!1705 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429)) (extraKeys!1619 (_2!444 lt!6429)) lt!6523 (zeroValue!1643 (_2!444 lt!6429)) (minValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (_2!444 lt!6429)) (defaultEntry!1715 (_2!444 lt!6429))))))

(assert (=> b!21188 (= lt!6523 (bvor (extraKeys!1619 (_2!444 lt!6429)) #b00000000000000000000000000000001))))

(assert (=> b!21188 (= e!13812 (tuple2!883 true (LongMapFixedSize!181 (defaultEntry!1715 (_2!444 lt!6429)) (mask!4685 (_2!444 lt!6429)) (bvor (extraKeys!1619 (_2!444 lt!6429)) #b00000000000000000000000000000001) (minValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (_2!444 lt!6429)) (_size!130 (_2!444 lt!6429)) (_keys!3137 (_2!444 lt!6429)) (_values!1705 (_2!444 lt!6429)) (_vacant!130 (_2!444 lt!6429)))))))

(assert (= (and d!3719 c!2411) b!21174))

(assert (= (and d!3719 (not c!2411)) b!21168))

(assert (= (and b!21174 c!2413) b!21188))

(assert (= (and b!21174 (not c!2413)) b!21154))

(assert (= (or b!21188 b!21154) bm!1302))

(assert (= (or b!21188 b!21154) bm!1295))

(assert (= (or b!21188 b!21154) bm!1299))

(assert (= (and b!21168 c!2407) b!21162))

(assert (= (and b!21168 (not c!2407)) b!21160))

(assert (= (and b!21162 c!2406) b!21157))

(assert (= (and b!21162 (not c!2406)) b!21181))

(assert (= (and b!21157 res!13698) b!21155))

(assert (= (and b!21155 res!13696) b!21158))

(assert (= (and b!21181 c!2409) b!21167))

(assert (= (and b!21181 (not c!2409)) b!21163))

(assert (= (and b!21167 res!13691) b!21185))

(assert (= (and b!21185 res!13703) b!21161))

(assert (= (and b!21163 c!2414) b!21187))

(assert (= (and b!21163 (not c!2414)) b!21164))

(assert (= (and b!21187 res!13702) b!21184))

(assert (= (and b!21184 res!13692) b!21180))

(assert (= (or b!21167 b!21187) bm!1292))

(assert (= (or b!21161 b!21180) bm!1289))

(assert (= (or b!21155 bm!1292) bm!1309))

(assert (= (or b!21157 b!21181) bm!1308))

(assert (= (and b!21160 c!2405) b!21169))

(assert (= (and b!21160 (not c!2405)) b!21179))

(assert (= (and b!21179 c!2415) b!21183))

(assert (= (and b!21179 (not c!2415)) b!21151))

(assert (= (and b!21151 c!2416) b!21173))

(assert (= (and b!21151 (not c!2416)) b!21175))

(assert (= (and b!21173 res!13693) b!21165))

(assert (= (and b!21165 res!13699) b!21156))

(assert (= (and b!21175 c!2410) b!21178))

(assert (= (and b!21175 (not c!2410)) b!21186))

(assert (= (and b!21178 res!13700) b!21152))

(assert (= (and b!21152 res!13690) b!21153))

(assert (= (and b!21186 c!2408) b!21166))

(assert (= (and b!21186 (not c!2408)) b!21172))

(assert (= (and b!21166 res!13701) b!21170))

(assert (= (and b!21170 res!13697) b!21177))

(assert (= (or b!21178 b!21166) bm!1301))

(assert (= (or b!21153 b!21177) bm!1291))

(assert (= (or b!21165 bm!1301) bm!1305))

(assert (= (or b!21173 b!21175) bm!1294))

(assert (= (or b!21169 b!21183) bm!1298))

(assert (= (or b!21157 b!21173) bm!1306))

(assert (= (or bm!1309 bm!1305) bm!1303))

(assert (= (or b!21181 b!21175) bm!1304))

(assert (= (or bm!1308 bm!1294) bm!1287))

(assert (= (or b!21162 b!21151) bm!1288))

(assert (= (or bm!1289 bm!1291) bm!1290))

(assert (= (or b!21162 b!21151) bm!1300))

(assert (= (or bm!1302 bm!1288) bm!1286))

(assert (= (or bm!1295 b!21151) bm!1296))

(assert (= (or bm!1299 b!21151) bm!1307))

(assert (= (and d!3719 res!13694) b!21176))

(assert (= (and b!21176 c!2412) b!21182))

(assert (= (and b!21176 (not c!2412)) b!21159))

(assert (= (and b!21182 res!13695) b!21171))

(assert (= (or b!21171 b!21159) bm!1293))

(assert (= (or b!21182 b!21171 b!21159) bm!1297))

(declare-fun m!14727 () Bool)

(assert (=> b!21158 m!14727))

(declare-fun m!14729 () Bool)

(assert (=> b!21170 m!14729))

(declare-fun m!14731 () Bool)

(assert (=> b!21156 m!14731))

(declare-fun m!14733 () Bool)

(assert (=> b!21182 m!14733))

(declare-fun m!14735 () Bool)

(assert (=> b!21152 m!14735))

(declare-fun m!14737 () Bool)

(assert (=> bm!1293 m!14737))

(declare-fun m!14739 () Bool)

(assert (=> bm!1290 m!14739))

(declare-fun m!14741 () Bool)

(assert (=> b!21168 m!14741))

(declare-fun m!14743 () Bool)

(assert (=> b!21171 m!14743))

(declare-fun m!14745 () Bool)

(assert (=> b!21151 m!14745))

(declare-fun m!14747 () Bool)

(assert (=> b!21151 m!14747))

(declare-fun m!14749 () Bool)

(assert (=> b!21151 m!14749))

(declare-fun m!14751 () Bool)

(assert (=> b!21151 m!14751))

(declare-fun m!14753 () Bool)

(assert (=> b!21151 m!14753))

(assert (=> bm!1287 m!14741))

(declare-fun m!14755 () Bool)

(assert (=> bm!1300 m!14755))

(declare-fun m!14757 () Bool)

(assert (=> bm!1300 m!14757))

(declare-fun m!14759 () Bool)

(assert (=> b!21188 m!14759))

(declare-fun m!14761 () Bool)

(assert (=> bm!1303 m!14761))

(declare-fun m!14763 () Bool)

(assert (=> bm!1296 m!14763))

(declare-fun m!14765 () Bool)

(assert (=> bm!1304 m!14765))

(declare-fun m!14767 () Bool)

(assert (=> b!21154 m!14767))

(declare-fun m!14769 () Bool)

(assert (=> b!21185 m!14769))

(declare-fun m!14771 () Bool)

(assert (=> bm!1298 m!14771))

(declare-fun m!14773 () Bool)

(assert (=> bm!1297 m!14773))

(declare-fun m!14775 () Bool)

(assert (=> b!21184 m!14775))

(declare-fun m!14777 () Bool)

(assert (=> bm!1306 m!14777))

(declare-fun m!14779 () Bool)

(assert (=> bm!1286 m!14779))

(declare-fun m!14781 () Bool)

(assert (=> bm!1307 m!14781))

(declare-fun m!14783 () Bool)

(assert (=> d!3719 m!14783))

(declare-fun m!14785 () Bool)

(assert (=> d!3719 m!14785))

(assert (=> b!21014 d!3719))

(declare-fun d!3721 () Bool)

(declare-fun res!13710 () Bool)

(declare-fun e!13822 () Bool)

(assert (=> d!3721 (=> (not res!13710) (not e!13822))))

(declare-fun simpleValid!18 (LongMapFixedSize!180) Bool)

(assert (=> d!3721 (= res!13710 (simpleValid!18 (v!1566 (_2!445 lt!6431))))))

(assert (=> d!3721 (= (valid!90 (v!1566 (_2!445 lt!6431))) e!13822)))

(declare-fun b!21195 () Bool)

(declare-fun res!13711 () Bool)

(assert (=> b!21195 (=> (not res!13711) (not e!13822))))

(declare-fun arrayCountValidKeys!0 (array!1217 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21195 (= res!13711 (= (arrayCountValidKeys!0 (_keys!3137 (v!1566 (_2!445 lt!6431))) #b00000000000000000000000000000000 (size!671 (_keys!3137 (v!1566 (_2!445 lt!6431))))) (_size!130 (v!1566 (_2!445 lt!6431)))))))

(declare-fun b!21196 () Bool)

(declare-fun res!13712 () Bool)

(assert (=> b!21196 (=> (not res!13712) (not e!13822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1217 (_ BitVec 32)) Bool)

(assert (=> b!21196 (= res!13712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3137 (v!1566 (_2!445 lt!6431))) (mask!4685 (v!1566 (_2!445 lt!6431)))))))

(declare-fun b!21197 () Bool)

(declare-datatypes ((List!560 0))(
  ( (Nil!557) (Cons!556 (h!1122 (_ BitVec 64)) (t!3217 List!560)) )
))
(declare-fun arrayNoDuplicates!0 (array!1217 (_ BitVec 32) List!560) Bool)

(assert (=> b!21197 (= e!13822 (arrayNoDuplicates!0 (_keys!3137 (v!1566 (_2!445 lt!6431))) #b00000000000000000000000000000000 Nil!557))))

(assert (= (and d!3721 res!13710) b!21195))

(assert (= (and b!21195 res!13711) b!21196))

(assert (= (and b!21196 res!13712) b!21197))

(declare-fun m!14787 () Bool)

(assert (=> d!3721 m!14787))

(declare-fun m!14789 () Bool)

(assert (=> b!21195 m!14789))

(declare-fun m!14791 () Bool)

(assert (=> b!21196 m!14791))

(declare-fun m!14793 () Bool)

(assert (=> b!21197 m!14793))

(assert (=> b!21021 d!3721))

(declare-fun b!21210 () Bool)

(declare-fun e!13829 () Bool)

(declare-fun lt!6595 () LongMapFixedSize!180)

(assert (=> b!21210 (= e!13829 (= (map!392 lt!6595) (ListLongMap!558 Nil!556)))))

(declare-fun b!21211 () Bool)

(declare-fun e!13830 () Bool)

(declare-fun lt!6589 () tuple2!890)

(declare-fun lt!6605 () (_ BitVec 32))

(assert (=> b!21211 (= e!13830 (ite (= (_1!448 lt!6589) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6605 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6605 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!21212 () Bool)

(declare-fun lt!6602 () array!1217)

(assert (=> b!21212 (= e!13830 (arrayContainsKey!0 lt!6602 (_1!448 lt!6589) #b00000000000000000000000000000000))))

(declare-fun b!21213 () Bool)

(declare-fun e!13831 () Unit!441)

(declare-fun Unit!445 () Unit!441)

(assert (=> b!21213 (= e!13831 Unit!445)))

(declare-fun d!3723 () Bool)

(assert (=> d!3723 e!13829))

(declare-fun res!13717 () Bool)

(assert (=> d!3723 (=> (not res!13717) (not e!13829))))

(assert (=> d!3723 (= res!13717 (valid!90 lt!6595))))

(declare-fun lt!6585 () LongMapFixedSize!180)

(assert (=> d!3723 (= lt!6595 lt!6585)))

(declare-fun lt!6606 () Unit!441)

(assert (=> d!3723 (= lt!6606 e!13831)))

(declare-fun c!2422 () Bool)

(assert (=> d!3723 (= c!2422 (not (= (map!392 lt!6585) (ListLongMap!558 Nil!556))))))

(declare-fun lt!6600 () Unit!441)

(declare-fun lt!6591 () Unit!441)

(assert (=> d!3723 (= lt!6600 lt!6591)))

(declare-fun lt!6592 () array!1217)

(declare-fun lt!6587 () (_ BitVec 32))

(declare-fun lt!6603 () List!560)

(assert (=> d!3723 (arrayNoDuplicates!0 lt!6592 lt!6587 lt!6603)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1217 (_ BitVec 32) (_ BitVec 32) List!560) Unit!441)

(assert (=> d!3723 (= lt!6591 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6592 lt!6587 (bvadd (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001) lt!6603))))

(assert (=> d!3723 (= lt!6603 Nil!557)))

(assert (=> d!3723 (= lt!6587 #b00000000000000000000000000000000)))

(assert (=> d!3723 (= lt!6592 (array!1218 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6597 () Unit!441)

(declare-fun lt!6594 () Unit!441)

(assert (=> d!3723 (= lt!6597 lt!6594)))

(declare-fun lt!6604 () (_ BitVec 32))

(declare-fun lt!6588 () array!1217)

(assert (=> d!3723 (arrayForallSeekEntryOrOpenFound!0 lt!6604 lt!6588 (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1217 (_ BitVec 32) (_ BitVec 32)) Unit!441)

(assert (=> d!3723 (= lt!6594 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6588 (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) lt!6604))))

(assert (=> d!3723 (= lt!6604 #b00000000000000000000000000000000)))

(assert (=> d!3723 (= lt!6588 (array!1218 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6598 () Unit!441)

(declare-fun lt!6586 () Unit!441)

(assert (=> d!3723 (= lt!6598 lt!6586)))

(declare-fun lt!6584 () array!1217)

(declare-fun lt!6599 () (_ BitVec 32))

(declare-fun lt!6601 () (_ BitVec 32))

(assert (=> d!3723 (= (arrayCountValidKeys!0 lt!6584 lt!6599 lt!6601) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1217 (_ BitVec 32) (_ BitVec 32)) Unit!441)

(assert (=> d!3723 (= lt!6586 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6584 lt!6599 lt!6601))))

(assert (=> d!3723 (= lt!6601 (bvadd (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3723 (= lt!6599 #b00000000000000000000000000000000)))

(assert (=> d!3723 (= lt!6584 (array!1218 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!140 (Int (_ BitVec 64)) V!1149)

(assert (=> d!3723 (= lt!6585 (LongMapFixedSize!181 (defaultEntry!1715 (v!1566 (underlying!101 thiss!938))) (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!140 (defaultEntry!1715 (v!1566 (underlying!101 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!140 (defaultEntry!1715 (v!1566 (underlying!101 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1218 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001)) (array!1216 ((as const (Array (_ BitVec 32) ValueCell!297)) EmptyCell!297) (bvadd (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3723 (validMask!0 (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))))))

(assert (=> d!3723 (= (getNewLongMapFixedSize!25 (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) (defaultEntry!1715 (v!1566 (underlying!101 thiss!938)))) lt!6595)))

(declare-fun b!21214 () Bool)

(declare-fun Unit!446 () Unit!441)

(assert (=> b!21214 (= e!13831 Unit!446)))

(declare-fun head!826 (List!559) tuple2!890)

(assert (=> b!21214 (= lt!6589 (head!826 (toList!294 (map!392 lt!6585))))))

(assert (=> b!21214 (= lt!6602 (array!1218 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!21214 (= lt!6605 #b00000000000000000000000000000000)))

(declare-fun lt!6596 () Unit!441)

(declare-fun lemmaKeyInListMapIsInArray!87 (array!1217 array!1215 (_ BitVec 32) (_ BitVec 32) V!1149 V!1149 (_ BitVec 64) Int) Unit!441)

(assert (=> b!21214 (= lt!6596 (lemmaKeyInListMapIsInArray!87 lt!6602 (array!1216 ((as const (Array (_ BitVec 32) ValueCell!297)) EmptyCell!297) (bvadd (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) lt!6605 (dynLambda!140 (defaultEntry!1715 (v!1566 (underlying!101 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!140 (defaultEntry!1715 (v!1566 (underlying!101 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!448 lt!6589) (defaultEntry!1715 (v!1566 (underlying!101 thiss!938)))))))

(declare-fun c!2421 () Bool)

(assert (=> b!21214 (= c!2421 (and (not (= (_1!448 lt!6589) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!448 lt!6589) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21214 e!13830))

(declare-fun lt!6590 () Unit!441)

(assert (=> b!21214 (= lt!6590 lt!6596)))

(declare-fun lt!6593 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1217 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21214 (= lt!6593 (arrayScanForKey!0 (array!1218 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000001)) (_1!448 lt!6589) #b00000000000000000000000000000000))))

(assert (=> b!21214 false))

(declare-fun b!21215 () Bool)

(declare-fun res!13718 () Bool)

(assert (=> b!21215 (=> (not res!13718) (not e!13829))))

(assert (=> b!21215 (= res!13718 (= (mask!4685 lt!6595) (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938))))))))

(assert (= (and d!3723 c!2422) b!21214))

(assert (= (and d!3723 (not c!2422)) b!21213))

(assert (= (and b!21214 c!2421) b!21212))

(assert (= (and b!21214 (not c!2421)) b!21211))

(assert (= (and d!3723 res!13717) b!21215))

(assert (= (and b!21215 res!13718) b!21210))

(declare-fun b_lambda!1513 () Bool)

(assert (=> (not b_lambda!1513) (not d!3723)))

(declare-fun t!3215 () Bool)

(declare-fun tb!643 () Bool)

(assert (=> (and b!21011 (= (defaultEntry!1715 (v!1566 (underlying!101 thiss!938))) (defaultEntry!1715 (v!1566 (underlying!101 thiss!938)))) t!3215) tb!643))

(declare-fun result!1063 () Bool)

(assert (=> tb!643 (= result!1063 tp_is_empty!993)))

(assert (=> d!3723 t!3215))

(declare-fun b_and!1417 () Bool)

(assert (= b_and!1413 (and (=> t!3215 result!1063) b_and!1417)))

(declare-fun b_lambda!1515 () Bool)

(assert (=> (not b_lambda!1515) (not b!21214)))

(assert (=> b!21214 t!3215))

(declare-fun b_and!1419 () Bool)

(assert (= b_and!1417 (and (=> t!3215 result!1063) b_and!1419)))

(declare-fun m!14795 () Bool)

(assert (=> b!21210 m!14795))

(declare-fun m!14797 () Bool)

(assert (=> b!21212 m!14797))

(assert (=> d!3723 m!14695))

(declare-fun m!14799 () Bool)

(assert (=> d!3723 m!14799))

(declare-fun m!14801 () Bool)

(assert (=> d!3723 m!14801))

(declare-fun m!14803 () Bool)

(assert (=> d!3723 m!14803))

(assert (=> d!3723 m!14695))

(declare-fun m!14805 () Bool)

(assert (=> d!3723 m!14805))

(declare-fun m!14807 () Bool)

(assert (=> d!3723 m!14807))

(assert (=> d!3723 m!14695))

(declare-fun m!14809 () Bool)

(assert (=> d!3723 m!14809))

(declare-fun m!14811 () Bool)

(assert (=> d!3723 m!14811))

(declare-fun m!14813 () Bool)

(assert (=> d!3723 m!14813))

(declare-fun m!14815 () Bool)

(assert (=> d!3723 m!14815))

(declare-fun m!14817 () Bool)

(assert (=> d!3723 m!14817))

(declare-fun m!14819 () Bool)

(assert (=> b!21214 m!14819))

(assert (=> b!21214 m!14695))

(assert (=> b!21214 m!14813))

(assert (=> b!21214 m!14813))

(declare-fun m!14821 () Bool)

(assert (=> b!21214 m!14821))

(assert (=> b!21214 m!14813))

(assert (=> b!21214 m!14811))

(declare-fun m!14823 () Bool)

(assert (=> b!21214 m!14823))

(assert (=> b!21017 d!3723))

(declare-fun d!3725 () Bool)

(declare-fun e!13837 () Bool)

(assert (=> d!3725 e!13837))

(declare-fun res!13721 () Bool)

(assert (=> d!3725 (=> (not res!13721) (not e!13837))))

(declare-fun lt!6612 () (_ BitVec 32))

(assert (=> d!3725 (= res!13721 (validMask!0 lt!6612))))

(declare-datatypes ((tuple2!892 0))(
  ( (tuple2!893 (_1!449 Unit!441) (_2!449 (_ BitVec 32))) )
))
(declare-fun e!13836 () tuple2!892)

(assert (=> d!3725 (= lt!6612 (_2!449 e!13836))))

(declare-fun c!2425 () Bool)

(declare-fun lt!6611 () tuple2!892)

(assert (=> d!3725 (= c!2425 (and (bvsgt (_2!449 lt!6611) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!130 (v!1566 (underlying!101 thiss!938)))) (_2!449 lt!6611)) (bvsge (bvadd (bvand (bvashr (_2!449 lt!6611) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!130 (v!1566 (underlying!101 thiss!938))))))))

(declare-fun Unit!447 () Unit!441)

(declare-fun Unit!448 () Unit!441)

(assert (=> d!3725 (= lt!6611 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!130 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))))) (mask!4685 (v!1566 (underlying!101 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!130 (v!1566 (underlying!101 thiss!938)))) (mask!4685 (v!1566 (underlying!101 thiss!938))))) (tuple2!893 Unit!447 (bvand (bvadd (bvshl (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!893 Unit!448 (mask!4685 (v!1566 (underlying!101 thiss!938))))))))

(assert (=> d!3725 (validMask!0 (mask!4685 (v!1566 (underlying!101 thiss!938))))))

(assert (=> d!3725 (= (computeNewMask!21 thiss!938 (mask!4685 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (_size!130 (v!1566 (underlying!101 thiss!938)))) lt!6612)))

(declare-fun b!21224 () Bool)

(declare-fun computeNewMaskWhile!10 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!892)

(assert (=> b!21224 (= e!13836 (computeNewMaskWhile!10 (_size!130 (v!1566 (underlying!101 thiss!938))) (_vacant!130 (v!1566 (underlying!101 thiss!938))) (mask!4685 (v!1566 (underlying!101 thiss!938))) (_2!449 lt!6611)))))

(declare-fun b!21225 () Bool)

(declare-fun Unit!449 () Unit!441)

(assert (=> b!21225 (= e!13836 (tuple2!893 Unit!449 (_2!449 lt!6611)))))

(declare-fun b!21226 () Bool)

(assert (=> b!21226 (= e!13837 (bvsle (_size!130 (v!1566 (underlying!101 thiss!938))) (bvadd lt!6612 #b00000000000000000000000000000001)))))

(assert (= (and d!3725 c!2425) b!21224))

(assert (= (and d!3725 (not c!2425)) b!21225))

(assert (= (and d!3725 res!13721) b!21226))

(declare-fun m!14825 () Bool)

(assert (=> d!3725 m!14825))

(assert (=> d!3725 m!14685))

(declare-fun m!14827 () Bool)

(assert (=> b!21224 m!14827))

(assert (=> b!21017 d!3725))

(declare-fun d!3727 () Bool)

(assert (=> d!3727 (= (validMask!0 (mask!4685 (v!1566 (underlying!101 thiss!938)))) (and (or (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000000000111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000000001111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000000011111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000000111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000001111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000011111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000000111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000001111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000011111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000000111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000001111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000011111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000000111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000001111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000011111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000000111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000001111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000011111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000000111111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000001111111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000011111111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000000111111111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000001111111111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000011111111111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00000111111111111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00001111111111111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00011111111111111111111111111111) (= (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4685 (v!1566 (underlying!101 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!21007 d!3727))

(declare-fun d!3729 () Bool)

(assert (=> d!3729 (= (array_inv!391 (_keys!3137 (v!1566 (underlying!101 thiss!938)))) (bvsge (size!671 (_keys!3137 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!21011 d!3729))

(declare-fun d!3731 () Bool)

(assert (=> d!3731 (= (array_inv!392 (_values!1705 (v!1566 (underlying!101 thiss!938)))) (bvsge (size!670 (_values!1705 (v!1566 (underlying!101 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!21011 d!3731))

(declare-fun lt!6625 () (_ BitVec 32))

(declare-fun c!2432 () Bool)

(declare-fun lt!6619 () (_ BitVec 32))

(declare-fun lt!6638 () array!1215)

(declare-fun call!1323 () ListLongMap!557)

(declare-fun bm!1310 () Bool)

(declare-fun c!2434 () Bool)

(declare-fun c!2428 () Bool)

(assert (=> bm!1310 (= call!1323 (getCurrentListMap!125 (_keys!3137 lt!6430) (ite (or c!2432 c!2428) (_values!1705 lt!6430) lt!6638) (mask!4685 lt!6430) (ite c!2432 (ite c!2434 lt!6625 lt!6619) (extraKeys!1619 lt!6430)) (ite (and c!2432 c!2434) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))) (zeroValue!1643 lt!6430)) (ite c!2432 (ite c!2434 (minValue!1643 lt!6430) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938))))) (minValue!1643 lt!6430)) #b00000000000000000000000000000000 (defaultEntry!1715 lt!6430)))))

(declare-fun call!1319 () SeekEntryResult!50)

(declare-fun bm!1311 () Bool)

(assert (=> bm!1311 (= call!1319 (seekEntryOrOpen!0 (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3137 lt!6430) (mask!4685 lt!6430)))))

(declare-fun bm!1312 () Bool)

(declare-fun call!1313 () ListLongMap!557)

(assert (=> bm!1312 (= call!1313 call!1323)))

(declare-fun bm!1313 () Bool)

(declare-fun call!1335 () Bool)

(declare-fun call!1330 () Bool)

(assert (=> bm!1313 (= call!1335 call!1330)))

(declare-fun b!21227 () Bool)

(declare-fun lt!6634 () Unit!441)

(declare-fun lt!6630 () Unit!441)

(assert (=> b!21227 (= lt!6634 lt!6630)))

(declare-fun call!1332 () Bool)

(assert (=> b!21227 call!1332))

(declare-fun lt!6623 () SeekEntryResult!50)

(assert (=> b!21227 (= lt!6630 (lemmaValidKeyInArrayIsInListMap!6 (_keys!3137 lt!6430) lt!6638 (mask!4685 lt!6430) (extraKeys!1619 lt!6430) (zeroValue!1643 lt!6430) (minValue!1643 lt!6430) (index!2321 lt!6623) (defaultEntry!1715 lt!6430)))))

(assert (=> b!21227 (= lt!6638 (array!1216 (store (arr!577 (_values!1705 lt!6430)) (index!2321 lt!6623) (ValueCellFull!297 (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))))) (size!670 (_values!1705 lt!6430))))))

(declare-fun lt!6639 () Unit!441)

(declare-fun lt!6618 () Unit!441)

(assert (=> b!21227 (= lt!6639 lt!6618)))

(declare-fun call!1327 () ListLongMap!557)

(assert (=> b!21227 (= call!1327 (getCurrentListMap!125 (_keys!3137 lt!6430) (array!1216 (store (arr!577 (_values!1705 lt!6430)) (index!2321 lt!6623) (ValueCellFull!297 (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))))) (size!670 (_values!1705 lt!6430))) (mask!4685 lt!6430) (extraKeys!1619 lt!6430) (zeroValue!1643 lt!6430) (minValue!1643 lt!6430) #b00000000000000000000000000000000 (defaultEntry!1715 lt!6430)))))

(assert (=> b!21227 (= lt!6618 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!6 (_keys!3137 lt!6430) (_values!1705 lt!6430) (mask!4685 lt!6430) (extraKeys!1619 lt!6430) (zeroValue!1643 lt!6430) (minValue!1643 lt!6430) (index!2321 lt!6623) (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))) (defaultEntry!1715 lt!6430)))))

(declare-fun lt!6620 () Unit!441)

(declare-fun e!13848 () Unit!441)

(assert (=> b!21227 (= lt!6620 e!13848)))

(declare-fun call!1321 () ListLongMap!557)

(declare-fun c!2437 () Bool)

(assert (=> b!21227 (= c!2437 (contains!224 call!1321 (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!13853 () tuple2!882)

(assert (=> b!21227 (= e!13853 (tuple2!883 true (LongMapFixedSize!181 (defaultEntry!1715 lt!6430) (mask!4685 lt!6430) (extraKeys!1619 lt!6430) (zeroValue!1643 lt!6430) (minValue!1643 lt!6430) (_size!130 lt!6430) (_keys!3137 lt!6430) (array!1216 (store (arr!577 (_values!1705 lt!6430)) (index!2321 lt!6623) (ValueCellFull!297 (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))))) (size!670 (_values!1705 lt!6430))) (_vacant!130 lt!6430))))))

(declare-fun b!21228 () Bool)

(declare-fun res!13722 () Bool)

(declare-fun e!13847 () Bool)

(assert (=> b!21228 (=> (not res!13722) (not e!13847))))

(declare-fun lt!6627 () SeekEntryResult!50)

(assert (=> b!21228 (= res!13722 (= (select (arr!578 (_keys!3137 lt!6430)) (index!2320 lt!6627)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1314 () Bool)

(assert (=> bm!1314 (= call!1330 (arrayContainsKey!0 (_keys!3137 lt!6430) (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun bm!1315 () Bool)

(declare-fun call!1331 () Bool)

(assert (=> bm!1315 (= call!1331 call!1330)))

(declare-fun b!21229 () Bool)

(assert (=> b!21229 (= e!13847 (not call!1331))))

(declare-fun b!21230 () Bool)

(declare-fun lt!6637 () Unit!441)

(declare-fun lt!6617 () Unit!441)

(assert (=> b!21230 (= lt!6637 lt!6617)))

(declare-fun call!1320 () ListLongMap!557)

(declare-fun call!1318 () ListLongMap!557)

(assert (=> b!21230 (= call!1320 call!1318)))

(assert (=> b!21230 (= lt!6617 (lemmaChangeLongMinValueKeyThenAddPairToListMap!6 (_keys!3137 lt!6430) (_values!1705 lt!6430) (mask!4685 lt!6430) (extraKeys!1619 lt!6430) lt!6619 (zeroValue!1643 lt!6430) (minValue!1643 lt!6430) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))) (defaultEntry!1715 lt!6430)))))

(assert (=> b!21230 (= lt!6619 (bvor (extraKeys!1619 lt!6430) #b00000000000000000000000000000010))))

(declare-fun e!13850 () tuple2!882)

(assert (=> b!21230 (= e!13850 (tuple2!883 true (LongMapFixedSize!181 (defaultEntry!1715 lt!6430) (mask!4685 lt!6430) (bvor (extraKeys!1619 lt!6430) #b00000000000000000000000000000010) (zeroValue!1643 lt!6430) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))) (_size!130 lt!6430) (_keys!3137 lt!6430) (_values!1705 lt!6430) (_vacant!130 lt!6430))))))

(declare-fun b!21231 () Bool)

(declare-fun res!13728 () Bool)

(declare-fun call!1322 () Bool)

(assert (=> b!21231 (= res!13728 call!1322)))

(declare-fun e!13849 () Bool)

(assert (=> b!21231 (=> (not res!13728) (not e!13849))))

(declare-fun bm!1316 () Bool)

(declare-fun call!1328 () Bool)

(assert (=> bm!1316 (= call!1328 call!1322)))

(declare-fun e!13856 () Bool)

(declare-fun lt!6632 () SeekEntryResult!50)

(declare-fun b!21232 () Bool)

(assert (=> b!21232 (= e!13856 (= (select (arr!578 (_keys!3137 lt!6430)) (index!2321 lt!6632)) (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!1317 () Bool)

(declare-fun call!1334 () ListLongMap!557)

(assert (=> bm!1317 (= call!1334 (map!392 lt!6430))))

(declare-fun b!21233 () Bool)

(declare-fun e!13855 () Unit!441)

(declare-fun Unit!450 () Unit!441)

(assert (=> b!21233 (= e!13855 Unit!450)))

(declare-fun lt!6621 () Unit!441)

(declare-fun call!1336 () Unit!441)

(assert (=> b!21233 (= lt!6621 call!1336)))

(declare-fun lt!6613 () SeekEntryResult!50)

(declare-fun call!1329 () SeekEntryResult!50)

(assert (=> b!21233 (= lt!6613 call!1329)))

(declare-fun res!13730 () Bool)

(assert (=> b!21233 (= res!13730 ((_ is Found!50) lt!6613))))

(assert (=> b!21233 (=> (not res!13730) (not e!13849))))

(assert (=> b!21233 e!13849))

(declare-fun lt!6631 () Unit!441)

(assert (=> b!21233 (= lt!6631 lt!6621)))

(assert (=> b!21233 false))

(declare-fun bm!1318 () Bool)

(declare-fun call!1316 () SeekEntryResult!50)

(assert (=> bm!1318 (= call!1316 call!1319)))

(declare-fun bm!1319 () Bool)

(declare-fun call!1315 () ListLongMap!557)

(assert (=> bm!1319 (= call!1315 call!1321)))

(declare-fun b!21234 () Bool)

(assert (=> b!21234 (= e!13849 (= (select (arr!578 (_keys!3137 lt!6430)) (index!2321 lt!6613)) (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!21235 () Bool)

(declare-fun e!13843 () Bool)

(declare-fun call!1314 () ListLongMap!557)

(assert (=> b!21235 (= e!13843 (= call!1314 call!1334))))

(declare-fun bm!1320 () Bool)

(assert (=> bm!1320 (= call!1321 (getCurrentListMap!125 (_keys!3137 lt!6430) (_values!1705 lt!6430) (mask!4685 lt!6430) (extraKeys!1619 lt!6430) (zeroValue!1643 lt!6430) (minValue!1643 lt!6430) #b00000000000000000000000000000000 (defaultEntry!1715 lt!6430)))))

(declare-fun b!21236 () Bool)

(declare-fun c!2426 () Bool)

(assert (=> b!21236 (= c!2426 ((_ is MissingVacant!50) lt!6623))))

(declare-fun e!13857 () tuple2!882)

(declare-fun e!13846 () tuple2!882)

(assert (=> b!21236 (= e!13857 e!13846)))

(declare-fun b!21237 () Bool)

(declare-fun e!13840 () Bool)

(assert (=> b!21237 (= e!13840 (not call!1335))))

(declare-fun b!21238 () Bool)

(declare-fun lt!6636 () Unit!441)

(assert (=> b!21238 (= lt!6636 e!13855)))

(declare-fun c!2427 () Bool)

(assert (=> b!21238 (= c!2427 call!1332)))

(assert (=> b!21238 (= e!13857 (tuple2!883 false lt!6430))))

(declare-fun b!21239 () Bool)

(declare-fun c!2435 () Bool)

(declare-fun lt!6614 () SeekEntryResult!50)

(assert (=> b!21239 (= c!2435 ((_ is MissingVacant!50) lt!6614))))

(declare-fun e!13844 () Bool)

(declare-fun e!13851 () Bool)

(assert (=> b!21239 (= e!13844 e!13851)))

(declare-fun bm!1321 () Bool)

(declare-fun lt!6629 () tuple2!882)

(assert (=> bm!1321 (= call!1314 (map!392 (_2!444 lt!6629)))))

(declare-fun b!21240 () Bool)

(assert (=> b!21240 (= e!13851 ((_ is Undefined!50) lt!6614))))

(declare-fun b!21241 () Bool)

(declare-fun res!13731 () Bool)

(declare-fun call!1324 () Bool)

(assert (=> b!21241 (= res!13731 call!1324)))

(assert (=> b!21241 (=> (not res!13731) (not e!13856))))

(declare-fun b!21242 () Bool)

(declare-fun e!13842 () Bool)

(declare-fun e!13838 () Bool)

(assert (=> b!21242 (= e!13842 e!13838)))

(declare-fun res!13733 () Bool)

(declare-fun call!1333 () Bool)

(assert (=> b!21242 (= res!13733 call!1333)))

(assert (=> b!21242 (=> (not res!13733) (not e!13838))))

(declare-fun b!21243 () Bool)

(declare-fun res!13723 () Bool)

(assert (=> b!21243 (=> (not res!13723) (not e!13840))))

(assert (=> b!21243 (= res!13723 call!1328)))

(assert (=> b!21243 (= e!13844 e!13840)))

(declare-fun call!1326 () tuple2!882)

(declare-fun bm!1322 () Bool)

(assert (=> bm!1322 (= call!1326 (updateHelperNewKey!6 lt!6430 (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))) (ite c!2426 (index!2323 lt!6623) (index!2320 lt!6623))))))

(declare-fun b!21244 () Bool)

(declare-fun e!13854 () tuple2!882)

(assert (=> b!21244 (= e!13854 e!13857)))

(assert (=> b!21244 (= lt!6623 (seekEntryOrOpen!0 (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3137 lt!6430) (mask!4685 lt!6430)))))

(assert (=> b!21244 (= c!2428 ((_ is Undefined!50) lt!6623))))

(declare-fun b!21245 () Bool)

(declare-fun lt!6616 () tuple2!882)

(assert (=> b!21245 (= e!13846 (tuple2!883 (_1!444 lt!6616) (_2!444 lt!6616)))))

(assert (=> b!21245 (= lt!6616 call!1326)))

(declare-fun b!21246 () Bool)

(declare-fun res!13729 () Bool)

(assert (=> b!21246 (= res!13729 (= (select (arr!578 (_keys!3137 lt!6430)) (index!2323 lt!6627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21246 (=> (not res!13729) (not e!13838))))

(declare-fun bm!1323 () Bool)

(assert (=> bm!1323 (= call!1320 call!1327)))

(declare-fun bm!1324 () Bool)

(assert (=> bm!1324 (= call!1332 (contains!224 call!1313 (ite c!2428 (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!578 (_keys!3137 lt!6430)) (index!2321 lt!6623)))))))

(declare-fun bm!1325 () Bool)

(assert (=> bm!1325 (= call!1333 call!1324)))

(declare-fun e!13845 () Bool)

(declare-fun b!21247 () Bool)

(assert (=> b!21247 (= e!13845 (= call!1314 (+!41 call!1334 (tuple2!891 (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938))))))))))

(declare-fun b!21248 () Bool)

(assert (=> b!21248 (= e!13842 ((_ is Undefined!50) lt!6627))))

(declare-fun b!21249 () Bool)

(declare-fun lt!6633 () Unit!441)

(assert (=> b!21249 (= e!13848 lt!6633)))

(assert (=> b!21249 (= lt!6633 call!1336)))

(assert (=> b!21249 (= lt!6632 call!1316)))

(declare-fun res!13725 () Bool)

(assert (=> b!21249 (= res!13725 ((_ is Found!50) lt!6632))))

(assert (=> b!21249 (=> (not res!13725) (not e!13856))))

(assert (=> b!21249 e!13856))

(declare-fun b!21250 () Bool)

(assert (=> b!21250 (= e!13854 e!13850)))

(assert (=> b!21250 (= c!2434 (= (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1326 () Bool)

(assert (=> bm!1326 (= call!1318 call!1323)))

(declare-fun call!1325 () Bool)

(declare-fun bm!1327 () Bool)

(declare-fun c!2431 () Bool)

(declare-fun c!2430 () Bool)

(assert (=> bm!1327 (= call!1325 (inRange!0 (ite c!2428 (ite c!2427 (index!2321 lt!6613) (ite c!2430 (index!2320 lt!6614) (index!2323 lt!6614))) (ite c!2437 (index!2321 lt!6632) (ite c!2431 (index!2320 lt!6627) (index!2323 lt!6627)))) (mask!4685 lt!6430)))))

(declare-fun b!21251 () Bool)

(declare-fun Unit!451 () Unit!441)

(assert (=> b!21251 (= e!13848 Unit!451)))

(declare-fun lt!6628 () Unit!441)

(declare-fun call!1317 () Unit!441)

(assert (=> b!21251 (= lt!6628 call!1317)))

(assert (=> b!21251 (= lt!6627 call!1316)))

(assert (=> b!21251 (= c!2431 ((_ is MissingZero!50) lt!6627))))

(declare-fun e!13852 () Bool)

(assert (=> b!21251 e!13852))

(declare-fun lt!6624 () Unit!441)

(assert (=> b!21251 (= lt!6624 lt!6628)))

(assert (=> b!21251 false))

(declare-fun b!21252 () Bool)

(declare-fun e!13839 () Bool)

(assert (=> b!21252 (= e!13839 e!13843)))

(declare-fun c!2433 () Bool)

(assert (=> b!21252 (= c!2433 (_1!444 lt!6629))))

(declare-fun b!21253 () Bool)

(assert (=> b!21253 (= e!13838 (not call!1331))))

(declare-fun bm!1328 () Bool)

(assert (=> bm!1328 (= call!1317 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!6 (_keys!3137 lt!6430) (_values!1705 lt!6430) (mask!4685 lt!6430) (extraKeys!1619 lt!6430) (zeroValue!1643 lt!6430) (minValue!1643 lt!6430) (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1715 lt!6430)))))

(declare-fun b!21254 () Bool)

(declare-fun res!13732 () Bool)

(assert (=> b!21254 (=> (not res!13732) (not e!13847))))

(assert (=> b!21254 (= res!13732 call!1333)))

(assert (=> b!21254 (= e!13852 e!13847)))

(declare-fun d!3733 () Bool)

(assert (=> d!3733 e!13839))

(declare-fun res!13726 () Bool)

(assert (=> d!3733 (=> (not res!13726) (not e!13839))))

(assert (=> d!3733 (= res!13726 (valid!90 (_2!444 lt!6629)))))

(assert (=> d!3733 (= lt!6629 e!13854)))

(assert (=> d!3733 (= c!2432 (= (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3733 (valid!90 lt!6430)))

(assert (=> d!3733 (= (update!22 lt!6430 (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938))))) lt!6629)))

(declare-fun b!21255 () Bool)

(assert (=> b!21255 (= e!13846 e!13853)))

(declare-fun c!2436 () Bool)

(assert (=> b!21255 (= c!2436 ((_ is MissingZero!50) lt!6623))))

(declare-fun bm!1329 () Bool)

(assert (=> bm!1329 (= call!1324 call!1325)))

(declare-fun b!21256 () Bool)

(declare-fun e!13841 () Bool)

(assert (=> b!21256 (= e!13841 (not call!1335))))

(declare-fun b!21257 () Bool)

(declare-fun lt!6635 () Unit!441)

(assert (=> b!21257 (= e!13855 lt!6635)))

(assert (=> b!21257 (= lt!6635 call!1317)))

(assert (=> b!21257 (= lt!6614 call!1329)))

(assert (=> b!21257 (= c!2430 ((_ is MissingZero!50) lt!6614))))

(assert (=> b!21257 e!13844))

(declare-fun b!21258 () Bool)

(assert (=> b!21258 (= e!13843 e!13845)))

(declare-fun res!13727 () Bool)

(assert (=> b!21258 (= res!13727 (contains!224 call!1314 (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21258 (=> (not res!13727) (not e!13845))))

(declare-fun b!21259 () Bool)

(declare-fun lt!6622 () tuple2!882)

(assert (=> b!21259 (= lt!6622 call!1326)))

(assert (=> b!21259 (= e!13853 (tuple2!883 (_1!444 lt!6622) (_2!444 lt!6622)))))

(declare-fun bm!1330 () Bool)

(assert (=> bm!1330 (= call!1336 (lemmaInListMapThenSeekEntryOrOpenFindsIt!6 (_keys!3137 lt!6430) (_values!1705 lt!6430) (mask!4685 lt!6430) (extraKeys!1619 lt!6430) (zeroValue!1643 lt!6430) (minValue!1643 lt!6430) (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1715 lt!6430)))))

(declare-fun b!21260 () Bool)

(declare-fun res!13724 () Bool)

(assert (=> b!21260 (= res!13724 (= (select (arr!578 (_keys!3137 lt!6430)) (index!2323 lt!6614)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21260 (=> (not res!13724) (not e!13841))))

(declare-fun b!21261 () Bool)

(declare-fun res!13735 () Bool)

(assert (=> b!21261 (=> (not res!13735) (not e!13840))))

(assert (=> b!21261 (= res!13735 (= (select (arr!578 (_keys!3137 lt!6430)) (index!2320 lt!6614)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21262 () Bool)

(declare-fun c!2429 () Bool)

(assert (=> b!21262 (= c!2429 ((_ is MissingVacant!50) lt!6627))))

(assert (=> b!21262 (= e!13852 e!13842)))

(declare-fun bm!1331 () Bool)

(assert (=> bm!1331 (= call!1327 (+!41 (ite c!2432 call!1315 call!1321) (ite c!2432 (ite c!2434 (tuple2!891 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938))))) (tuple2!891 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))))) (tuple2!891 (ite (or c!2371 c!2369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938))))))))))

(declare-fun bm!1332 () Bool)

(assert (=> bm!1332 (= call!1329 call!1319)))

(declare-fun b!21263 () Bool)

(assert (=> b!21263 (= e!13851 e!13841)))

(declare-fun res!13734 () Bool)

(assert (=> b!21263 (= res!13734 call!1328)))

(assert (=> b!21263 (=> (not res!13734) (not e!13841))))

(declare-fun bm!1333 () Bool)

(assert (=> bm!1333 (= call!1322 call!1325)))

(declare-fun b!21264 () Bool)

(declare-fun lt!6626 () Unit!441)

(declare-fun lt!6615 () Unit!441)

(assert (=> b!21264 (= lt!6626 lt!6615)))

(assert (=> b!21264 (= call!1320 call!1318)))

(assert (=> b!21264 (= lt!6615 (lemmaChangeZeroKeyThenAddPairToListMap!6 (_keys!3137 lt!6430) (_values!1705 lt!6430) (mask!4685 lt!6430) (extraKeys!1619 lt!6430) lt!6625 (zeroValue!1643 lt!6430) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))) (minValue!1643 lt!6430) (defaultEntry!1715 lt!6430)))))

(assert (=> b!21264 (= lt!6625 (bvor (extraKeys!1619 lt!6430) #b00000000000000000000000000000001))))

(assert (=> b!21264 (= e!13850 (tuple2!883 true (LongMapFixedSize!181 (defaultEntry!1715 lt!6430) (mask!4685 lt!6430) (bvor (extraKeys!1619 lt!6430) #b00000000000000000000000000000001) (ite (or c!2371 c!2369) (zeroValue!1643 (v!1566 (underlying!101 thiss!938))) (minValue!1643 (v!1566 (underlying!101 thiss!938)))) (minValue!1643 lt!6430) (_size!130 lt!6430) (_keys!3137 lt!6430) (_values!1705 lt!6430) (_vacant!130 lt!6430))))))

(assert (= (and d!3733 c!2432) b!21250))

(assert (= (and d!3733 (not c!2432)) b!21244))

(assert (= (and b!21250 c!2434) b!21264))

(assert (= (and b!21250 (not c!2434)) b!21230))

(assert (= (or b!21264 b!21230) bm!1326))

(assert (= (or b!21264 b!21230) bm!1319))

(assert (= (or b!21264 b!21230) bm!1323))

(assert (= (and b!21244 c!2428) b!21238))

(assert (= (and b!21244 (not c!2428)) b!21236))

(assert (= (and b!21238 c!2427) b!21233))

(assert (= (and b!21238 (not c!2427)) b!21257))

(assert (= (and b!21233 res!13730) b!21231))

(assert (= (and b!21231 res!13728) b!21234))

(assert (= (and b!21257 c!2430) b!21243))

(assert (= (and b!21257 (not c!2430)) b!21239))

(assert (= (and b!21243 res!13723) b!21261))

(assert (= (and b!21261 res!13735) b!21237))

(assert (= (and b!21239 c!2435) b!21263))

(assert (= (and b!21239 (not c!2435)) b!21240))

(assert (= (and b!21263 res!13734) b!21260))

(assert (= (and b!21260 res!13724) b!21256))

(assert (= (or b!21243 b!21263) bm!1316))

(assert (= (or b!21237 b!21256) bm!1313))

(assert (= (or b!21231 bm!1316) bm!1333))

(assert (= (or b!21233 b!21257) bm!1332))

(assert (= (and b!21236 c!2426) b!21245))

(assert (= (and b!21236 (not c!2426)) b!21255))

(assert (= (and b!21255 c!2436) b!21259))

(assert (= (and b!21255 (not c!2436)) b!21227))

(assert (= (and b!21227 c!2437) b!21249))

(assert (= (and b!21227 (not c!2437)) b!21251))

(assert (= (and b!21249 res!13725) b!21241))

(assert (= (and b!21241 res!13731) b!21232))

(assert (= (and b!21251 c!2431) b!21254))

(assert (= (and b!21251 (not c!2431)) b!21262))

(assert (= (and b!21254 res!13732) b!21228))

(assert (= (and b!21228 res!13722) b!21229))

(assert (= (and b!21262 c!2429) b!21242))

(assert (= (and b!21262 (not c!2429)) b!21248))

(assert (= (and b!21242 res!13733) b!21246))

(assert (= (and b!21246 res!13729) b!21253))

(assert (= (or b!21254 b!21242) bm!1325))

(assert (= (or b!21229 b!21253) bm!1315))

(assert (= (or b!21241 bm!1325) bm!1329))

(assert (= (or b!21249 b!21251) bm!1318))

(assert (= (or b!21245 b!21259) bm!1322))

(assert (= (or b!21233 b!21249) bm!1330))

(assert (= (or bm!1333 bm!1329) bm!1327))

(assert (= (or b!21257 b!21251) bm!1328))

(assert (= (or bm!1332 bm!1318) bm!1311))

(assert (= (or b!21238 b!21227) bm!1312))

(assert (= (or bm!1313 bm!1315) bm!1314))

(assert (= (or b!21238 b!21227) bm!1324))

(assert (= (or bm!1326 bm!1312) bm!1310))

(assert (= (or bm!1319 b!21227) bm!1320))

(assert (= (or bm!1323 b!21227) bm!1331))

(assert (= (and d!3733 res!13726) b!21252))

(assert (= (and b!21252 c!2433) b!21258))

(assert (= (and b!21252 (not c!2433)) b!21235))

(assert (= (and b!21258 res!13727) b!21247))

(assert (= (or b!21247 b!21235) bm!1317))

(assert (= (or b!21258 b!21247 b!21235) bm!1321))

(declare-fun m!14829 () Bool)

(assert (=> b!21234 m!14829))

(declare-fun m!14831 () Bool)

(assert (=> b!21246 m!14831))

(declare-fun m!14833 () Bool)

(assert (=> b!21232 m!14833))

(declare-fun m!14835 () Bool)

(assert (=> b!21258 m!14835))

(declare-fun m!14837 () Bool)

(assert (=> b!21228 m!14837))

(declare-fun m!14839 () Bool)

(assert (=> bm!1317 m!14839))

(declare-fun m!14841 () Bool)

(assert (=> bm!1314 m!14841))

(declare-fun m!14843 () Bool)

(assert (=> b!21244 m!14843))

(declare-fun m!14845 () Bool)

(assert (=> b!21247 m!14845))

(declare-fun m!14847 () Bool)

(assert (=> b!21227 m!14847))

(declare-fun m!14849 () Bool)

(assert (=> b!21227 m!14849))

(declare-fun m!14851 () Bool)

(assert (=> b!21227 m!14851))

(declare-fun m!14853 () Bool)

(assert (=> b!21227 m!14853))

(declare-fun m!14855 () Bool)

(assert (=> b!21227 m!14855))

(assert (=> bm!1311 m!14843))

(declare-fun m!14857 () Bool)

(assert (=> bm!1324 m!14857))

(declare-fun m!14859 () Bool)

(assert (=> bm!1324 m!14859))

(declare-fun m!14861 () Bool)

(assert (=> b!21264 m!14861))

(declare-fun m!14863 () Bool)

(assert (=> bm!1327 m!14863))

(declare-fun m!14865 () Bool)

(assert (=> bm!1320 m!14865))

(declare-fun m!14867 () Bool)

(assert (=> bm!1328 m!14867))

(declare-fun m!14869 () Bool)

(assert (=> b!21230 m!14869))

(declare-fun m!14871 () Bool)

(assert (=> b!21261 m!14871))

(declare-fun m!14873 () Bool)

(assert (=> bm!1322 m!14873))

(declare-fun m!14875 () Bool)

(assert (=> bm!1321 m!14875))

(declare-fun m!14877 () Bool)

(assert (=> b!21260 m!14877))

(declare-fun m!14879 () Bool)

(assert (=> bm!1330 m!14879))

(declare-fun m!14881 () Bool)

(assert (=> bm!1310 m!14881))

(declare-fun m!14883 () Bool)

(assert (=> bm!1331 m!14883))

(declare-fun m!14885 () Bool)

(assert (=> d!3733 m!14885))

(declare-fun m!14887 () Bool)

(assert (=> d!3733 m!14887))

(assert (=> bm!1231 d!3733))

(declare-fun mapIsEmpty!973 () Bool)

(declare-fun mapRes!973 () Bool)

(assert (=> mapIsEmpty!973 mapRes!973))

(declare-fun b!21272 () Bool)

(declare-fun e!13862 () Bool)

(assert (=> b!21272 (= e!13862 tp_is_empty!993)))

(declare-fun mapNonEmpty!973 () Bool)

(declare-fun tp!3430 () Bool)

(declare-fun e!13863 () Bool)

(assert (=> mapNonEmpty!973 (= mapRes!973 (and tp!3430 e!13863))))

(declare-fun mapValue!973 () ValueCell!297)

(declare-fun mapRest!973 () (Array (_ BitVec 32) ValueCell!297))

(declare-fun mapKey!973 () (_ BitVec 32))

(assert (=> mapNonEmpty!973 (= mapRest!967 (store mapRest!973 mapKey!973 mapValue!973))))

(declare-fun condMapEmpty!973 () Bool)

(declare-fun mapDefault!973 () ValueCell!297)

(assert (=> mapNonEmpty!967 (= condMapEmpty!973 (= mapRest!967 ((as const (Array (_ BitVec 32) ValueCell!297)) mapDefault!973)))))

(assert (=> mapNonEmpty!967 (= tp!3420 (and e!13862 mapRes!973))))

(declare-fun b!21271 () Bool)

(assert (=> b!21271 (= e!13863 tp_is_empty!993)))

(assert (= (and mapNonEmpty!967 condMapEmpty!973) mapIsEmpty!973))

(assert (= (and mapNonEmpty!967 (not condMapEmpty!973)) mapNonEmpty!973))

(assert (= (and mapNonEmpty!973 ((_ is ValueCellFull!297) mapValue!973)) b!21271))

(assert (= (and mapNonEmpty!967 ((_ is ValueCellFull!297) mapDefault!973)) b!21272))

(declare-fun m!14889 () Bool)

(assert (=> mapNonEmpty!973 m!14889))

(declare-fun b_lambda!1517 () Bool)

(assert (= b_lambda!1515 (or (and b!21011 b_free!729) b_lambda!1517)))

(declare-fun b_lambda!1519 () Bool)

(assert (= b_lambda!1513 (or (and b!21011 b_free!729) b_lambda!1519)))

(check-sat tp_is_empty!993 (not bm!1330) (not bm!1286) (not b!21171) (not bm!1293) (not d!3733) (not bm!1327) b_and!1419 (not bm!1310) (not bm!1296) (not mapNonEmpty!973) (not bm!1320) (not b!21168) (not bm!1328) (not bm!1306) (not bm!1304) (not b_lambda!1517) (not b!21197) (not bm!1287) (not bm!1322) (not b!21188) (not b!21230) (not bm!1324) (not b!21224) (not b!21227) (not d!3723) (not bm!1321) (not bm!1300) (not b!21214) (not b!21195) (not b!21151) (not bm!1307) (not b_lambda!1519) (not bm!1297) (not b!21258) (not b!21182) (not bm!1331) (not bm!1303) (not b!21264) (not b!21247) (not b!21212) (not b!21210) (not bm!1311) (not d!3721) (not b!21196) (not bm!1290) (not bm!1314) (not d!3725) (not d!3719) (not bm!1317) (not b!21244) (not d!3717) (not b_next!729) (not bm!1298) (not b!21154))
(check-sat b_and!1419 (not b_next!729))
