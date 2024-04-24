; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3358 () Bool)

(assert start!3358)

(declare-fun b!21300 () Bool)

(declare-fun b_free!733 () Bool)

(declare-fun b_next!733 () Bool)

(assert (=> b!21300 (= b_free!733 (not b_next!733))))

(declare-fun tp!3436 () Bool)

(declare-fun b_and!1415 () Bool)

(assert (=> b!21300 (= tp!3436 b_and!1415)))

(declare-fun b!21295 () Bool)

(declare-fun res!13730 () Bool)

(declare-fun e!13871 () Bool)

(assert (=> b!21295 (=> (not res!13730) (not e!13871))))

(declare-datatypes ((V!1155 0))(
  ( (V!1156 (val!525 Int)) )
))
(declare-datatypes ((array!1207 0))(
  ( (array!1208 (arr!572 (Array (_ BitVec 32) (_ BitVec 64))) (size!665 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!299 0))(
  ( (ValueCellFull!299 (v!1570 V!1155)) (EmptyCell!299) )
))
(declare-datatypes ((array!1209 0))(
  ( (array!1210 (arr!573 (Array (_ BitVec 32) ValueCell!299)) (size!666 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!184 0))(
  ( (LongMapFixedSize!185 (defaultEntry!1718 Int) (mask!4691 (_ BitVec 32)) (extraKeys!1621 (_ BitVec 32)) (zeroValue!1645 V!1155) (minValue!1645 V!1155) (_size!133 (_ BitVec 32)) (_keys!3139 array!1207) (_values!1707 array!1209) (_vacant!133 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!184 0))(
  ( (Cell!185 (v!1571 LongMapFixedSize!184)) )
))
(declare-datatypes ((tuple2!908 0))(
  ( (tuple2!909 (_1!457 Bool) (_2!457 Cell!184)) )
))
(declare-fun lt!6660 () tuple2!908)

(declare-fun valid!108 (LongMapFixedSize!184) Bool)

(assert (=> b!21295 (= res!13730 (valid!108 (v!1571 (_2!457 lt!6660))))))

(declare-fun mapNonEmpty!976 () Bool)

(declare-fun mapRes!976 () Bool)

(declare-fun tp!3435 () Bool)

(declare-fun e!13870 () Bool)

(assert (=> mapNonEmpty!976 (= mapRes!976 (and tp!3435 e!13870))))

(declare-fun mapRest!976 () (Array (_ BitVec 32) ValueCell!299))

(declare-fun mapKey!976 () (_ BitVec 32))

(declare-fun mapValue!976 () ValueCell!299)

(declare-datatypes ((LongMap!184 0))(
  ( (LongMap!185 (underlying!103 Cell!184)) )
))
(declare-fun thiss!938 () LongMap!184)

(assert (=> mapNonEmpty!976 (= (arr!573 (_values!1707 (v!1571 (underlying!103 thiss!938)))) (store mapRest!976 mapKey!976 mapValue!976))))

(declare-fun res!13729 () Bool)

(declare-fun e!13879 () Bool)

(assert (=> start!3358 (=> (not res!13729) (not e!13879))))

(declare-fun valid!109 (LongMap!184) Bool)

(assert (=> start!3358 (= res!13729 (valid!109 thiss!938))))

(assert (=> start!3358 e!13879))

(declare-fun e!13876 () Bool)

(assert (=> start!3358 e!13876))

(declare-fun b!21296 () Bool)

(declare-datatypes ((tuple2!910 0))(
  ( (tuple2!911 (_1!458 (_ BitVec 64)) (_2!458 V!1155)) )
))
(declare-datatypes ((List!558 0))(
  ( (Nil!555) (Cons!554 (h!1120 tuple2!910) (t!3209 List!558)) )
))
(declare-datatypes ((ListLongMap!557 0))(
  ( (ListLongMap!558 (toList!294 List!558)) )
))
(declare-fun getCurrentListMap!124 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) Int) ListLongMap!557)

(declare-fun map!397 (LongMapFixedSize!184) ListLongMap!557)

(assert (=> b!21296 (= e!13871 (not (= (getCurrentListMap!124 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (_values!1707 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))) (map!397 (v!1571 (_2!457 lt!6660))))))))

(declare-fun b!21297 () Bool)

(declare-fun e!13878 () Bool)

(declare-fun tp_is_empty!997 () Bool)

(assert (=> b!21297 (= e!13878 tp_is_empty!997)))

(declare-fun b!21298 () Bool)

(declare-fun e!13873 () Bool)

(declare-fun e!13874 () Bool)

(assert (=> b!21298 (= e!13873 e!13874)))

(declare-fun b!21299 () Bool)

(declare-fun c!2448 () Bool)

(declare-fun lt!6657 () Bool)

(assert (=> b!21299 (= c!2448 (and (not (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6657))))

(declare-fun e!13875 () tuple2!908)

(declare-fun e!13880 () tuple2!908)

(assert (=> b!21299 (= e!13875 e!13880)))

(declare-fun e!13881 () Bool)

(declare-fun array_inv!411 (array!1207) Bool)

(declare-fun array_inv!412 (array!1209) Bool)

(assert (=> b!21300 (= e!13874 (and tp!3436 tp_is_empty!997 (array_inv!411 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (array_inv!412 (_values!1707 (v!1571 (underlying!103 thiss!938)))) e!13881))))

(declare-fun bm!1338 () Bool)

(declare-datatypes ((tuple2!912 0))(
  ( (tuple2!913 (_1!459 Bool) (_2!459 LongMapFixedSize!184)) )
))
(declare-fun call!1341 () tuple2!912)

(declare-fun call!1342 () tuple2!912)

(assert (=> bm!1338 (= call!1341 call!1342)))

(declare-fun b!21301 () Bool)

(declare-fun e!13872 () tuple2!908)

(assert (=> b!21301 (= e!13872 e!13875)))

(declare-fun c!2449 () Bool)

(assert (=> b!21301 (= c!2449 (and (not lt!6657) (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21302 () Bool)

(declare-fun res!13727 () Bool)

(assert (=> b!21302 (=> (not res!13727) (not e!13871))))

(assert (=> b!21302 (= res!13727 (and (= (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4691 (v!1571 (underlying!103 thiss!938))))) (bvsge (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun b!21303 () Bool)

(declare-fun lt!6656 () tuple2!912)

(assert (=> b!21303 (= e!13880 (tuple2!909 (_1!459 lt!6656) (Cell!185 (_2!459 lt!6656))))))

(assert (=> b!21303 (= lt!6656 call!1341)))

(declare-fun b!21304 () Bool)

(declare-fun res!13731 () Bool)

(assert (=> b!21304 (=> (not res!13731) (not e!13871))))

(assert (=> b!21304 (= res!13731 (bvsge (bvadd #b00000000000000000000000000000001 (mask!4691 (v!1571 (_2!457 lt!6660)))) (_size!133 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun b!21305 () Bool)

(assert (=> b!21305 (= e!13879 e!13871)))

(declare-fun res!13728 () Bool)

(assert (=> b!21305 (=> (not res!13728) (not e!13871))))

(assert (=> b!21305 (= res!13728 (_1!457 lt!6660))))

(assert (=> b!21305 (= lt!6660 e!13872)))

(declare-fun c!2450 () Bool)

(assert (=> b!21305 (= c!2450 (and (not lt!6657) (not (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!21305 (= lt!6657 (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!6655 () LongMapFixedSize!184)

(declare-fun getNewLongMapFixedSize!30 ((_ BitVec 32) Int) LongMapFixedSize!184)

(declare-fun computeNewMask!25 (LongMap!184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21305 (= lt!6655 (getNewLongMapFixedSize!30 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun b!21306 () Bool)

(declare-fun res!13726 () Bool)

(assert (=> b!21306 (=> (not res!13726) (not e!13871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!21306 (= res!13726 (validMask!0 (mask!4691 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun b!21307 () Bool)

(assert (=> b!21307 (= e!13881 (and e!13878 mapRes!976))))

(declare-fun condMapEmpty!976 () Bool)

(declare-fun mapDefault!976 () ValueCell!299)

(assert (=> b!21307 (= condMapEmpty!976 (= (arr!573 (_values!1707 (v!1571 (underlying!103 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!299)) mapDefault!976)))))

(declare-fun bm!1339 () Bool)

(declare-fun lt!6654 () tuple2!912)

(declare-fun update!31 (LongMapFixedSize!184 (_ BitVec 64) V!1155) tuple2!912)

(assert (=> bm!1339 (= call!1342 (update!31 (ite c!2450 (_2!459 lt!6654) lt!6655) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun b!21308 () Bool)

(declare-fun lt!6659 () tuple2!912)

(assert (=> b!21308 (= lt!6659 call!1341)))

(assert (=> b!21308 (= e!13875 (tuple2!909 (_1!459 lt!6659) (Cell!185 (_2!459 lt!6659))))))

(declare-fun b!21309 () Bool)

(assert (=> b!21309 (= e!13870 tp_is_empty!997)))

(declare-fun mapIsEmpty!976 () Bool)

(assert (=> mapIsEmpty!976 mapRes!976))

(declare-fun b!21310 () Bool)

(declare-fun lt!6658 () tuple2!912)

(assert (=> b!21310 (= e!13872 (tuple2!909 (and (_1!459 lt!6654) (_1!459 lt!6658)) (Cell!185 (_2!459 lt!6658))))))

(assert (=> b!21310 (= lt!6654 (update!31 lt!6655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))

(assert (=> b!21310 (= lt!6658 call!1342)))

(declare-fun b!21311 () Bool)

(assert (=> b!21311 (= e!13876 e!13873)))

(declare-fun b!21312 () Bool)

(assert (=> b!21312 (= e!13880 (tuple2!909 true (Cell!185 lt!6655)))))

(assert (= (and start!3358 res!13729) b!21305))

(assert (= (and b!21305 c!2450) b!21310))

(assert (= (and b!21305 (not c!2450)) b!21301))

(assert (= (and b!21301 c!2449) b!21308))

(assert (= (and b!21301 (not c!2449)) b!21299))

(assert (= (and b!21299 c!2448) b!21303))

(assert (= (and b!21299 (not c!2448)) b!21312))

(assert (= (or b!21308 b!21303) bm!1338))

(assert (= (or b!21310 bm!1338) bm!1339))

(assert (= (and b!21305 res!13728) b!21306))

(assert (= (and b!21306 res!13726) b!21302))

(assert (= (and b!21302 res!13727) b!21295))

(assert (= (and b!21295 res!13730) b!21304))

(assert (= (and b!21304 res!13731) b!21296))

(assert (= (and b!21307 condMapEmpty!976) mapIsEmpty!976))

(assert (= (and b!21307 (not condMapEmpty!976)) mapNonEmpty!976))

(get-info :version)

(assert (= (and mapNonEmpty!976 ((_ is ValueCellFull!299) mapValue!976)) b!21309))

(assert (= (and b!21307 ((_ is ValueCellFull!299) mapDefault!976)) b!21297))

(assert (= b!21300 b!21307))

(assert (= b!21298 b!21300))

(assert (= b!21311 b!21298))

(assert (= start!3358 b!21311))

(declare-fun m!14843 () Bool)

(assert (=> bm!1339 m!14843))

(declare-fun m!14845 () Bool)

(assert (=> b!21296 m!14845))

(declare-fun m!14847 () Bool)

(assert (=> b!21296 m!14847))

(declare-fun m!14849 () Bool)

(assert (=> b!21306 m!14849))

(declare-fun m!14851 () Bool)

(assert (=> b!21295 m!14851))

(declare-fun m!14853 () Bool)

(assert (=> b!21310 m!14853))

(declare-fun m!14855 () Bool)

(assert (=> b!21300 m!14855))

(declare-fun m!14857 () Bool)

(assert (=> b!21300 m!14857))

(declare-fun m!14859 () Bool)

(assert (=> start!3358 m!14859))

(declare-fun m!14861 () Bool)

(assert (=> b!21305 m!14861))

(assert (=> b!21305 m!14861))

(declare-fun m!14863 () Bool)

(assert (=> b!21305 m!14863))

(declare-fun m!14865 () Bool)

(assert (=> mapNonEmpty!976 m!14865))

(check-sat (not b_next!733) (not b!21310) tp_is_empty!997 (not b!21306) (not b!21295) (not start!3358) (not b!21296) b_and!1415 (not bm!1339) (not b!21300) (not b!21305) (not mapNonEmpty!976))
(check-sat b_and!1415 (not b_next!733))
(get-model)

(declare-fun d!3705 () Bool)

(declare-fun res!13774 () Bool)

(declare-fun e!13956 () Bool)

(assert (=> d!3705 (=> (not res!13774) (not e!13956))))

(declare-fun simpleValid!19 (LongMapFixedSize!184) Bool)

(assert (=> d!3705 (= res!13774 (simpleValid!19 (v!1571 (_2!457 lt!6660))))))

(assert (=> d!3705 (= (valid!108 (v!1571 (_2!457 lt!6660))) e!13956)))

(declare-fun b!21427 () Bool)

(declare-fun res!13775 () Bool)

(assert (=> b!21427 (=> (not res!13775) (not e!13956))))

(declare-fun arrayCountValidKeys!0 (array!1207 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21427 (= res!13775 (= (arrayCountValidKeys!0 (_keys!3139 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))) (_size!133 (v!1571 (_2!457 lt!6660)))))))

(declare-fun b!21428 () Bool)

(declare-fun res!13776 () Bool)

(assert (=> b!21428 (=> (not res!13776) (not e!13956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1207 (_ BitVec 32)) Bool)

(assert (=> b!21428 (= res!13776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660)))))))

(declare-fun b!21429 () Bool)

(declare-datatypes ((List!559 0))(
  ( (Nil!556) (Cons!555 (h!1121 (_ BitVec 64)) (t!3212 List!559)) )
))
(declare-fun arrayNoDuplicates!0 (array!1207 (_ BitVec 32) List!559) Bool)

(assert (=> b!21429 (= e!13956 (arrayNoDuplicates!0 (_keys!3139 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 Nil!556))))

(assert (= (and d!3705 res!13774) b!21427))

(assert (= (and b!21427 res!13775) b!21428))

(assert (= (and b!21428 res!13776) b!21429))

(declare-fun m!14915 () Bool)

(assert (=> d!3705 m!14915))

(declare-fun m!14917 () Bool)

(assert (=> b!21427 m!14917))

(declare-fun m!14919 () Bool)

(assert (=> b!21428 m!14919))

(declare-fun m!14921 () Bool)

(assert (=> b!21429 m!14921))

(assert (=> b!21295 d!3705))

(declare-fun call!1416 () ListLongMap!557)

(declare-fun e!14006 () ListLongMap!557)

(declare-fun b!21514 () Bool)

(declare-fun call!1417 () ListLongMap!557)

(declare-fun c!2502 () Bool)

(assert (=> b!21514 (= e!14006 (ite c!2502 call!1416 call!1417))))

(declare-fun b!21515 () Bool)

(declare-fun res!13814 () Bool)

(declare-fun e!14019 () Bool)

(assert (=> b!21515 (=> (not res!13814) (not e!14019))))

(declare-datatypes ((SeekEntryResult!51 0))(
  ( (MissingZero!51 (index!2324 (_ BitVec 32))) (Found!51 (index!2325 (_ BitVec 32))) (Intermediate!51 (undefined!863 Bool) (index!2326 (_ BitVec 32)) (x!5190 (_ BitVec 32))) (Undefined!51) (MissingVacant!51 (index!2327 (_ BitVec 32))) )
))
(declare-fun lt!6766 () SeekEntryResult!51)

(assert (=> b!21515 (= res!13814 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2324 lt!6766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!6764 () SeekEntryResult!51)

(declare-fun e!14008 () Bool)

(declare-fun b!21516 () Bool)

(assert (=> b!21516 (= e!14008 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6764)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!21517 () Bool)

(declare-fun e!14022 () ListLongMap!557)

(declare-fun call!1413 () ListLongMap!557)

(assert (=> b!21517 (= e!14022 call!1413)))

(declare-fun b!21518 () Bool)

(declare-fun c!2498 () Bool)

(declare-fun lt!6760 () SeekEntryResult!51)

(assert (=> b!21518 (= c!2498 ((_ is MissingVacant!51) lt!6760))))

(declare-fun e!14014 () Bool)

(declare-fun e!14012 () Bool)

(assert (=> b!21518 (= e!14014 e!14012)))

(declare-fun e!14009 () Bool)

(declare-fun b!21519 () Bool)

(declare-fun lt!6776 () SeekEntryResult!51)

(assert (=> b!21519 (= e!14009 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6776)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!21520 () Bool)

(declare-datatypes ((Unit!462 0))(
  ( (Unit!463) )
))
(declare-fun lt!6779 () Unit!462)

(declare-fun lt!6783 () Unit!462)

(assert (=> b!21520 (= lt!6779 lt!6783)))

(declare-fun call!1423 () ListLongMap!557)

(assert (=> b!21520 (= call!1423 call!1416)))

(declare-fun lt!6763 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 V!1155 Int) Unit!462)

(assert (=> b!21520 (= lt!6783 (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> b!21520 (= lt!6763 (bvor (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000010))))

(declare-fun e!14020 () tuple2!912)

(assert (=> b!21520 (= e!14020 (tuple2!913 true (LongMapFixedSize!185 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (bvor (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000010) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (_size!133 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_vacant!133 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21521 () Bool)

(declare-fun e!14001 () Bool)

(declare-fun e!14018 () Bool)

(assert (=> b!21521 (= e!14001 e!14018)))

(declare-fun res!13817 () Bool)

(declare-fun call!1403 () Bool)

(assert (=> b!21521 (= res!13817 call!1403)))

(assert (=> b!21521 (=> (not res!13817) (not e!14018))))

(declare-fun b!21522 () Bool)

(declare-fun c!2503 () Bool)

(declare-fun lt!6772 () SeekEntryResult!51)

(assert (=> b!21522 (= c!2503 ((_ is MissingVacant!51) lt!6772))))

(declare-fun e!14010 () tuple2!912)

(declare-fun e!14007 () tuple2!912)

(assert (=> b!21522 (= e!14010 e!14007)))

(declare-fun call!1407 () ListLongMap!557)

(declare-fun b!21523 () Bool)

(declare-fun call!1425 () ListLongMap!557)

(declare-fun e!14003 () Bool)

(declare-fun +!41 (ListLongMap!557 tuple2!910) ListLongMap!557)

(assert (=> b!21523 (= e!14003 (= call!1407 (+!41 call!1425 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))

(declare-fun b!21524 () Bool)

(declare-fun e!14015 () Bool)

(declare-fun call!1418 () Bool)

(assert (=> b!21524 (= e!14015 (not call!1418))))

(declare-fun b!21525 () Bool)

(declare-fun lt!6769 () tuple2!912)

(declare-fun call!1409 () tuple2!912)

(assert (=> b!21525 (= lt!6769 call!1409)))

(declare-fun e!14017 () tuple2!912)

(assert (=> b!21525 (= e!14017 (tuple2!913 (_1!459 lt!6769) (_2!459 lt!6769)))))

(declare-fun c!2500 () Bool)

(declare-fun c!2510 () Bool)

(declare-fun c!2501 () Bool)

(declare-fun c!2508 () Bool)

(declare-fun call!1420 () Bool)

(declare-fun c!2499 () Bool)

(declare-fun bm!1401 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1401 (= call!1420 (inRange!0 (ite c!2508 (ite c!2499 (index!2325 lt!6776) (ite c!2510 (index!2324 lt!6760) (index!2327 lt!6760))) (ite c!2501 (index!2325 lt!6764) (ite c!2500 (index!2324 lt!6766) (index!2327 lt!6766)))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21526 () Bool)

(assert (=> b!21526 (= e!14022 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21527 () Bool)

(declare-fun e!14011 () Unit!462)

(declare-fun Unit!464 () Unit!462)

(assert (=> b!21527 (= e!14011 Unit!464)))

(declare-fun lt!6774 () Unit!462)

(declare-fun call!1405 () Unit!462)

(assert (=> b!21527 (= lt!6774 call!1405)))

(declare-fun call!1422 () SeekEntryResult!51)

(assert (=> b!21527 (= lt!6776 call!1422)))

(declare-fun res!13810 () Bool)

(assert (=> b!21527 (= res!13810 ((_ is Found!51) lt!6776))))

(assert (=> b!21527 (=> (not res!13810) (not e!14009))))

(assert (=> b!21527 e!14009))

(declare-fun lt!6759 () Unit!462)

(assert (=> b!21527 (= lt!6759 lt!6774)))

(assert (=> b!21527 false))

(declare-fun bm!1402 () Bool)

(declare-fun lt!6762 () tuple2!912)

(assert (=> bm!1402 (= call!1407 (map!397 (_2!459 lt!6762)))))

(declare-fun bm!1403 () Bool)

(declare-fun call!1408 () ListLongMap!557)

(assert (=> bm!1403 (= call!1417 call!1408)))

(declare-fun bm!1404 () Bool)

(declare-fun lt!6765 () (_ BitVec 32))

(declare-fun c!2504 () Bool)

(assert (=> bm!1404 (= call!1408 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21528 () Bool)

(declare-fun res!13812 () Bool)

(assert (=> b!21528 (= res!13812 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2327 lt!6766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21528 (=> (not res!13812) (not e!14018))))

(declare-fun b!21529 () Bool)

(declare-fun call!1414 () Bool)

(assert (=> b!21529 (= e!14018 (not call!1414))))

(declare-fun bm!1405 () Bool)

(declare-fun call!1419 () Bool)

(declare-fun call!1424 () Bool)

(assert (=> bm!1405 (= call!1419 call!1424)))

(declare-fun b!21530 () Bool)

(declare-fun lt!6778 () Unit!462)

(declare-fun lt!6767 () Unit!462)

(assert (=> b!21530 (= lt!6778 lt!6767)))

(assert (=> b!21530 (= call!1423 call!1417)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!7 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 V!1155 Int) Unit!462)

(assert (=> b!21530 (= lt!6767 (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6765 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> b!21530 (= lt!6765 (bvor (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000001))))

(assert (=> b!21530 (= e!14020 (tuple2!913 true (LongMapFixedSize!185 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (bvor (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000001) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_size!133 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_vacant!133 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21531 () Bool)

(declare-fun res!13813 () Bool)

(declare-fun call!1421 () Bool)

(assert (=> b!21531 (= res!13813 call!1421)))

(assert (=> b!21531 (=> (not res!13813) (not e!14008))))

(declare-fun b!21532 () Bool)

(declare-fun lt!6768 () Unit!462)

(declare-fun lt!6780 () Unit!462)

(assert (=> b!21532 (= lt!6768 lt!6780)))

(declare-fun contains!224 (ListLongMap!557 (_ BitVec 64)) Bool)

(assert (=> b!21532 (contains!224 call!1413 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772)))))

(declare-fun lt!6782 () array!1209)

(declare-fun lemmaValidKeyInArrayIsInListMap!7 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) Int) Unit!462)

(assert (=> b!21532 (= lt!6780 (lemmaValidKeyInArrayIsInListMap!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (index!2325 lt!6772) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> b!21532 (= lt!6782 (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun lt!6775 () Unit!462)

(declare-fun lt!6771 () Unit!462)

(assert (=> b!21532 (= lt!6775 lt!6771)))

(declare-fun call!1410 () ListLongMap!557)

(assert (=> b!21532 (= call!1410 call!1408)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) (_ BitVec 64) V!1155 Int) Unit!462)

(assert (=> b!21532 (= lt!6771 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (index!2325 lt!6772) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!6758 () Unit!462)

(declare-fun e!14002 () Unit!462)

(assert (=> b!21532 (= lt!6758 e!14002)))

(declare-fun call!1412 () Bool)

(assert (=> b!21532 (= c!2501 call!1412)))

(assert (=> b!21532 (= e!14017 (tuple2!913 true (LongMapFixedSize!185 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_size!133 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (_vacant!133 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21533 () Bool)

(declare-fun lt!6757 () Unit!462)

(assert (=> b!21533 (= lt!6757 e!14011)))

(assert (=> b!21533 (= c!2499 call!1412)))

(assert (=> b!21533 (= e!14010 (tuple2!913 false (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(declare-fun b!21534 () Bool)

(assert (=> b!21534 (= e!14001 ((_ is Undefined!51) lt!6766))))

(declare-fun b!21535 () Bool)

(assert (=> b!21535 (= e!14012 e!14015)))

(declare-fun res!13808 () Bool)

(assert (=> b!21535 (= res!13808 call!1419)))

(assert (=> b!21535 (=> (not res!13808) (not e!14015))))

(declare-fun b!21536 () Bool)

(assert (=> b!21536 (= e!14019 (not call!1414))))

(declare-fun call!1404 () ListLongMap!557)

(declare-fun bm!1406 () Bool)

(assert (=> bm!1406 (= call!1404 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (or c!2504 c!2508) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun bm!1407 () Bool)

(declare-fun call!1415 () SeekEntryResult!51)

(assert (=> bm!1407 (= call!1422 call!1415)))

(declare-fun bm!1408 () Bool)

(declare-fun call!1426 () Bool)

(assert (=> bm!1408 (= call!1418 call!1426)))

(declare-fun b!21537 () Bool)

(assert (=> b!21537 (= e!14007 e!14017)))

(declare-fun c!2509 () Bool)

(assert (=> b!21537 (= c!2509 ((_ is MissingZero!51) lt!6772))))

(declare-fun bm!1409 () Bool)

(assert (=> bm!1409 (= call!1410 (+!41 e!14006 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))

(declare-fun c!2497 () Bool)

(assert (=> bm!1409 (= c!2497 c!2504)))

(declare-fun bm!1410 () Bool)

(assert (=> bm!1410 (= call!1403 call!1421)))

(declare-fun b!21538 () Bool)

(assert (=> b!21538 (= e!14006 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21539 () Bool)

(declare-fun res!13811 () Bool)

(declare-fun e!14021 () Bool)

(assert (=> b!21539 (=> (not res!13811) (not e!14021))))

(assert (=> b!21539 (= res!13811 call!1419)))

(assert (=> b!21539 (= e!14014 e!14021)))

(declare-fun bm!1411 () Bool)

(declare-fun call!1411 () SeekEntryResult!51)

(assert (=> bm!1411 (= call!1411 call!1415)))

(declare-fun b!21540 () Bool)

(declare-fun lt!6770 () Unit!462)

(assert (=> b!21540 (= e!14011 lt!6770)))

(declare-fun call!1406 () Unit!462)

(assert (=> b!21540 (= lt!6770 call!1406)))

(assert (=> b!21540 (= lt!6760 call!1422)))

(assert (=> b!21540 (= c!2510 ((_ is MissingZero!51) lt!6760))))

(assert (=> b!21540 e!14014))

(declare-fun b!21541 () Bool)

(declare-fun c!2507 () Bool)

(assert (=> b!21541 (= c!2507 ((_ is MissingVacant!51) lt!6766))))

(declare-fun e!14016 () Bool)

(assert (=> b!21541 (= e!14016 e!14001)))

(declare-fun b!21542 () Bool)

(declare-fun e!14013 () Bool)

(declare-fun e!14005 () Bool)

(assert (=> b!21542 (= e!14013 e!14005)))

(declare-fun c!2506 () Bool)

(assert (=> b!21542 (= c!2506 (_1!459 lt!6762))))

(declare-fun b!21543 () Bool)

(declare-fun e!14004 () tuple2!912)

(assert (=> b!21543 (= e!14004 e!14010)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1207 (_ BitVec 32)) SeekEntryResult!51)

(assert (=> b!21543 (= lt!6772 (seekEntryOrOpen!0 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> b!21543 (= c!2508 ((_ is Undefined!51) lt!6772))))

(declare-fun bm!1412 () Bool)

(assert (=> bm!1412 (= call!1413 call!1404)))

(declare-fun bm!1413 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!462)

(assert (=> bm!1413 (= call!1405 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun bm!1414 () Bool)

(declare-fun c!2505 () Bool)

(assert (=> bm!1414 (= c!2505 c!2508)))

(assert (=> bm!1414 (= call!1412 (contains!224 e!14022 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!1415 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!462)

(assert (=> bm!1415 (= call!1406 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21544 () Bool)

(assert (=> b!21544 (= e!14004 e!14020)))

(assert (=> b!21544 (= c!2502 (= (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21545 () Bool)

(declare-fun Unit!465 () Unit!462)

(assert (=> b!21545 (= e!14002 Unit!465)))

(declare-fun lt!6777 () Unit!462)

(assert (=> b!21545 (= lt!6777 call!1406)))

(assert (=> b!21545 (= lt!6766 call!1411)))

(assert (=> b!21545 (= c!2500 ((_ is MissingZero!51) lt!6766))))

(assert (=> b!21545 e!14016))

(declare-fun lt!6781 () Unit!462)

(assert (=> b!21545 (= lt!6781 lt!6777)))

(assert (=> b!21545 false))

(declare-fun bm!1400 () Bool)

(assert (=> bm!1400 (= call!1425 (map!397 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(declare-fun d!3707 () Bool)

(assert (=> d!3707 e!14013))

(declare-fun res!13816 () Bool)

(assert (=> d!3707 (=> (not res!13816) (not e!14013))))

(assert (=> d!3707 (= res!13816 (valid!108 (_2!459 lt!6762)))))

(assert (=> d!3707 (= lt!6762 e!14004)))

(assert (=> d!3707 (= c!2504 (= (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3707 (valid!108 (ite c!2450 (_2!459 lt!6654) lt!6655))))

(assert (=> d!3707 (= (update!31 (ite c!2450 (_2!459 lt!6654) lt!6655) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) lt!6762)))

(declare-fun b!21546 () Bool)

(declare-fun lt!6761 () tuple2!912)

(assert (=> b!21546 (= e!14007 (tuple2!913 (_1!459 lt!6761) (_2!459 lt!6761)))))

(assert (=> b!21546 (= lt!6761 call!1409)))

(declare-fun bm!1416 () Bool)

(assert (=> bm!1416 (= call!1414 call!1426)))

(declare-fun bm!1417 () Bool)

(assert (=> bm!1417 (= call!1424 call!1420)))

(declare-fun b!21547 () Bool)

(declare-fun res!13807 () Bool)

(assert (=> b!21547 (= res!13807 call!1424)))

(assert (=> b!21547 (=> (not res!13807) (not e!14009))))

(declare-fun bm!1418 () Bool)

(assert (=> bm!1418 (= call!1421 call!1420)))

(declare-fun b!21548 () Bool)

(assert (=> b!21548 (= e!14021 (not call!1418))))

(declare-fun b!21549 () Bool)

(declare-fun res!13818 () Bool)

(assert (=> b!21549 (=> (not res!13818) (not e!14021))))

(assert (=> b!21549 (= res!13818 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2324 lt!6760)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!13806 () Bool)

(declare-fun b!21550 () Bool)

(assert (=> b!21550 (= res!13806 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2327 lt!6760)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21550 (=> (not res!13806) (not e!14015))))

(declare-fun b!21551 () Bool)

(assert (=> b!21551 (= e!14005 (= call!1407 call!1425))))

(declare-fun b!21552 () Bool)

(assert (=> b!21552 (= e!14012 ((_ is Undefined!51) lt!6760))))

(declare-fun b!21553 () Bool)

(declare-fun lt!6773 () Unit!462)

(assert (=> b!21553 (= e!14002 lt!6773)))

(assert (=> b!21553 (= lt!6773 call!1405)))

(assert (=> b!21553 (= lt!6764 call!1411)))

(declare-fun res!13805 () Bool)

(assert (=> b!21553 (= res!13805 ((_ is Found!51) lt!6764))))

(assert (=> b!21553 (=> (not res!13805) (not e!14008))))

(assert (=> b!21553 e!14008))

(declare-fun bm!1419 () Bool)

(assert (=> bm!1419 (= call!1415 (seekEntryOrOpen!0 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21554 () Bool)

(declare-fun res!13815 () Bool)

(assert (=> b!21554 (=> (not res!13815) (not e!14019))))

(assert (=> b!21554 (= res!13815 call!1403)))

(assert (=> b!21554 (= e!14016 e!14019)))

(declare-fun b!21555 () Bool)

(assert (=> b!21555 (= e!14005 e!14003)))

(declare-fun res!13809 () Bool)

(assert (=> b!21555 (= res!13809 (contains!224 call!1407 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21555 (=> (not res!13809) (not e!14003))))

(declare-fun bm!1420 () Bool)

(assert (=> bm!1420 (= call!1416 call!1404)))

(declare-fun bm!1421 () Bool)

(declare-fun updateHelperNewKey!7 (LongMapFixedSize!184 (_ BitVec 64) V!1155 (_ BitVec 32)) tuple2!912)

(assert (=> bm!1421 (= call!1409 (updateHelperNewKey!7 (ite c!2450 (_2!459 lt!6654) lt!6655) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772))))))

(declare-fun bm!1422 () Bool)

(assert (=> bm!1422 (= call!1423 call!1410)))

(declare-fun bm!1423 () Bool)

(declare-fun arrayContainsKey!0 (array!1207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1423 (= call!1426 (arrayContainsKey!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(assert (= (and d!3707 c!2504) b!21544))

(assert (= (and d!3707 (not c!2504)) b!21543))

(assert (= (and b!21544 c!2502) b!21530))

(assert (= (and b!21544 (not c!2502)) b!21520))

(assert (= (or b!21530 b!21520) bm!1420))

(assert (= (or b!21530 b!21520) bm!1403))

(assert (= (or b!21530 b!21520) bm!1422))

(assert (= (and b!21543 c!2508) b!21533))

(assert (= (and b!21543 (not c!2508)) b!21522))

(assert (= (and b!21533 c!2499) b!21527))

(assert (= (and b!21533 (not c!2499)) b!21540))

(assert (= (and b!21527 res!13810) b!21547))

(assert (= (and b!21547 res!13807) b!21519))

(assert (= (and b!21540 c!2510) b!21539))

(assert (= (and b!21540 (not c!2510)) b!21518))

(assert (= (and b!21539 res!13811) b!21549))

(assert (= (and b!21549 res!13818) b!21548))

(assert (= (and b!21518 c!2498) b!21535))

(assert (= (and b!21518 (not c!2498)) b!21552))

(assert (= (and b!21535 res!13808) b!21550))

(assert (= (and b!21550 res!13806) b!21524))

(assert (= (or b!21539 b!21535) bm!1405))

(assert (= (or b!21548 b!21524) bm!1408))

(assert (= (or b!21547 bm!1405) bm!1417))

(assert (= (or b!21527 b!21540) bm!1407))

(assert (= (and b!21522 c!2503) b!21546))

(assert (= (and b!21522 (not c!2503)) b!21537))

(assert (= (and b!21537 c!2509) b!21525))

(assert (= (and b!21537 (not c!2509)) b!21532))

(assert (= (and b!21532 c!2501) b!21553))

(assert (= (and b!21532 (not c!2501)) b!21545))

(assert (= (and b!21553 res!13805) b!21531))

(assert (= (and b!21531 res!13813) b!21516))

(assert (= (and b!21545 c!2500) b!21554))

(assert (= (and b!21545 (not c!2500)) b!21541))

(assert (= (and b!21554 res!13815) b!21515))

(assert (= (and b!21515 res!13814) b!21536))

(assert (= (and b!21541 c!2507) b!21521))

(assert (= (and b!21541 (not c!2507)) b!21534))

(assert (= (and b!21521 res!13817) b!21528))

(assert (= (and b!21528 res!13812) b!21529))

(assert (= (or b!21554 b!21521) bm!1410))

(assert (= (or b!21536 b!21529) bm!1416))

(assert (= (or b!21531 bm!1410) bm!1418))

(assert (= (or b!21553 b!21545) bm!1411))

(assert (= (or b!21546 b!21525) bm!1421))

(assert (= (or bm!1408 bm!1416) bm!1423))

(assert (= (or bm!1417 bm!1418) bm!1401))

(assert (= (or b!21533 b!21532) bm!1412))

(assert (= (or b!21527 b!21553) bm!1413))

(assert (= (or b!21540 b!21545) bm!1415))

(assert (= (or bm!1407 bm!1411) bm!1419))

(assert (= (or b!21533 b!21532) bm!1414))

(assert (= (and bm!1414 c!2505) b!21517))

(assert (= (and bm!1414 (not c!2505)) b!21526))

(assert (= (or bm!1403 b!21532) bm!1404))

(assert (= (or bm!1420 bm!1412) bm!1406))

(assert (= (or bm!1422 b!21532) bm!1409))

(assert (= (and bm!1409 c!2497) b!21514))

(assert (= (and bm!1409 (not c!2497)) b!21538))

(assert (= (and d!3707 res!13816) b!21542))

(assert (= (and b!21542 c!2506) b!21555))

(assert (= (and b!21542 (not c!2506)) b!21551))

(assert (= (and b!21555 res!13809) b!21523))

(assert (= (or b!21555 b!21523 b!21551) bm!1402))

(assert (= (or b!21523 b!21551) bm!1400))

(declare-fun m!14923 () Bool)

(assert (=> bm!1413 m!14923))

(declare-fun m!14925 () Bool)

(assert (=> bm!1409 m!14925))

(declare-fun m!14927 () Bool)

(assert (=> b!21549 m!14927))

(declare-fun m!14929 () Bool)

(assert (=> b!21520 m!14929))

(declare-fun m!14931 () Bool)

(assert (=> bm!1402 m!14931))

(declare-fun m!14933 () Bool)

(assert (=> b!21555 m!14933))

(declare-fun m!14935 () Bool)

(assert (=> bm!1421 m!14935))

(declare-fun m!14937 () Bool)

(assert (=> b!21515 m!14937))

(declare-fun m!14939 () Bool)

(assert (=> b!21543 m!14939))

(declare-fun m!14941 () Bool)

(assert (=> b!21528 m!14941))

(declare-fun m!14943 () Bool)

(assert (=> b!21523 m!14943))

(assert (=> bm!1419 m!14939))

(declare-fun m!14945 () Bool)

(assert (=> b!21538 m!14945))

(declare-fun m!14947 () Bool)

(assert (=> bm!1406 m!14947))

(declare-fun m!14949 () Bool)

(assert (=> bm!1401 m!14949))

(declare-fun m!14951 () Bool)

(assert (=> bm!1404 m!14951))

(declare-fun m!14953 () Bool)

(assert (=> bm!1404 m!14953))

(declare-fun m!14955 () Bool)

(assert (=> bm!1414 m!14955))

(assert (=> b!21532 m!14951))

(declare-fun m!14957 () Bool)

(assert (=> b!21532 m!14957))

(declare-fun m!14959 () Bool)

(assert (=> b!21532 m!14959))

(assert (=> b!21532 m!14959))

(declare-fun m!14961 () Bool)

(assert (=> b!21532 m!14961))

(declare-fun m!14963 () Bool)

(assert (=> b!21532 m!14963))

(declare-fun m!14965 () Bool)

(assert (=> bm!1415 m!14965))

(declare-fun m!14967 () Bool)

(assert (=> b!21550 m!14967))

(declare-fun m!14969 () Bool)

(assert (=> b!21530 m!14969))

(declare-fun m!14971 () Bool)

(assert (=> b!21516 m!14971))

(declare-fun m!14973 () Bool)

(assert (=> bm!1400 m!14973))

(declare-fun m!14975 () Bool)

(assert (=> d!3707 m!14975))

(declare-fun m!14977 () Bool)

(assert (=> d!3707 m!14977))

(declare-fun m!14979 () Bool)

(assert (=> bm!1423 m!14979))

(declare-fun m!14981 () Bool)

(assert (=> b!21519 m!14981))

(assert (=> b!21526 m!14945))

(assert (=> bm!1339 d!3707))

(declare-fun d!3709 () Bool)

(assert (=> d!3709 (= (valid!109 thiss!938) (valid!108 (v!1571 (underlying!103 thiss!938))))))

(declare-fun bs!907 () Bool)

(assert (= bs!907 d!3709))

(declare-fun m!14983 () Bool)

(assert (=> bs!907 m!14983))

(assert (=> start!3358 d!3709))

(declare-fun b!21556 () Bool)

(declare-fun call!1441 () ListLongMap!557)

(declare-fun c!2516 () Bool)

(declare-fun call!1440 () ListLongMap!557)

(declare-fun e!14028 () ListLongMap!557)

(assert (=> b!21556 (= e!14028 (ite c!2516 call!1440 call!1441))))

(declare-fun b!21557 () Bool)

(declare-fun res!13828 () Bool)

(declare-fun e!14041 () Bool)

(assert (=> b!21557 (=> (not res!13828) (not e!14041))))

(declare-fun lt!6793 () SeekEntryResult!51)

(assert (=> b!21557 (= res!13828 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2324 lt!6793)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21558 () Bool)

(declare-fun e!14030 () Bool)

(declare-fun lt!6791 () SeekEntryResult!51)

(assert (=> b!21558 (= e!14030 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!6791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21559 () Bool)

(declare-fun e!14044 () ListLongMap!557)

(declare-fun call!1437 () ListLongMap!557)

(assert (=> b!21559 (= e!14044 call!1437)))

(declare-fun b!21560 () Bool)

(declare-fun c!2512 () Bool)

(declare-fun lt!6787 () SeekEntryResult!51)

(assert (=> b!21560 (= c!2512 ((_ is MissingVacant!51) lt!6787))))

(declare-fun e!14036 () Bool)

(declare-fun e!14034 () Bool)

(assert (=> b!21560 (= e!14036 e!14034)))

(declare-fun b!21561 () Bool)

(declare-fun e!14031 () Bool)

(declare-fun lt!6803 () SeekEntryResult!51)

(assert (=> b!21561 (= e!14031 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!6803)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21562 () Bool)

(declare-fun lt!6806 () Unit!462)

(declare-fun lt!6810 () Unit!462)

(assert (=> b!21562 (= lt!6806 lt!6810)))

(declare-fun call!1447 () ListLongMap!557)

(assert (=> b!21562 (= call!1447 call!1440)))

(declare-fun lt!6790 () (_ BitVec 32))

(assert (=> b!21562 (= lt!6810 (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) lt!6790 (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 lt!6655)))))

(assert (=> b!21562 (= lt!6790 (bvor (extraKeys!1621 lt!6655) #b00000000000000000000000000000010))))

(declare-fun e!14042 () tuple2!912)

(assert (=> b!21562 (= e!14042 (tuple2!913 true (LongMapFixedSize!185 (defaultEntry!1718 lt!6655) (mask!4691 lt!6655) (bvor (extraKeys!1621 lt!6655) #b00000000000000000000000000000010) (zeroValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (_size!133 lt!6655) (_keys!3139 lt!6655) (_values!1707 lt!6655) (_vacant!133 lt!6655))))))

(declare-fun b!21563 () Bool)

(declare-fun e!14023 () Bool)

(declare-fun e!14040 () Bool)

(assert (=> b!21563 (= e!14023 e!14040)))

(declare-fun res!13831 () Bool)

(declare-fun call!1427 () Bool)

(assert (=> b!21563 (= res!13831 call!1427)))

(assert (=> b!21563 (=> (not res!13831) (not e!14040))))

(declare-fun b!21564 () Bool)

(declare-fun c!2517 () Bool)

(declare-fun lt!6799 () SeekEntryResult!51)

(assert (=> b!21564 (= c!2517 ((_ is MissingVacant!51) lt!6799))))

(declare-fun e!14032 () tuple2!912)

(declare-fun e!14029 () tuple2!912)

(assert (=> b!21564 (= e!14032 e!14029)))

(declare-fun call!1431 () ListLongMap!557)

(declare-fun call!1449 () ListLongMap!557)

(declare-fun b!21565 () Bool)

(declare-fun e!14025 () Bool)

(assert (=> b!21565 (= e!14025 (= call!1431 (+!41 call!1449 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun b!21566 () Bool)

(declare-fun e!14037 () Bool)

(declare-fun call!1442 () Bool)

(assert (=> b!21566 (= e!14037 (not call!1442))))

(declare-fun b!21567 () Bool)

(declare-fun lt!6796 () tuple2!912)

(declare-fun call!1433 () tuple2!912)

(assert (=> b!21567 (= lt!6796 call!1433)))

(declare-fun e!14039 () tuple2!912)

(assert (=> b!21567 (= e!14039 (tuple2!913 (_1!459 lt!6796) (_2!459 lt!6796)))))

(declare-fun c!2524 () Bool)

(declare-fun call!1444 () Bool)

(declare-fun c!2513 () Bool)

(declare-fun c!2515 () Bool)

(declare-fun bm!1425 () Bool)

(declare-fun c!2522 () Bool)

(declare-fun c!2514 () Bool)

(assert (=> bm!1425 (= call!1444 (inRange!0 (ite c!2522 (ite c!2513 (index!2325 lt!6803) (ite c!2524 (index!2324 lt!6787) (index!2327 lt!6787))) (ite c!2515 (index!2325 lt!6791) (ite c!2514 (index!2324 lt!6793) (index!2327 lt!6793)))) (mask!4691 lt!6655)))))

(declare-fun b!21568 () Bool)

(assert (=> b!21568 (= e!14044 (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun b!21569 () Bool)

(declare-fun e!14033 () Unit!462)

(declare-fun Unit!466 () Unit!462)

(assert (=> b!21569 (= e!14033 Unit!466)))

(declare-fun lt!6801 () Unit!462)

(declare-fun call!1429 () Unit!462)

(assert (=> b!21569 (= lt!6801 call!1429)))

(declare-fun call!1446 () SeekEntryResult!51)

(assert (=> b!21569 (= lt!6803 call!1446)))

(declare-fun res!13824 () Bool)

(assert (=> b!21569 (= res!13824 ((_ is Found!51) lt!6803))))

(assert (=> b!21569 (=> (not res!13824) (not e!14031))))

(assert (=> b!21569 e!14031))

(declare-fun lt!6786 () Unit!462)

(assert (=> b!21569 (= lt!6786 lt!6801)))

(assert (=> b!21569 false))

(declare-fun bm!1426 () Bool)

(declare-fun lt!6789 () tuple2!912)

(assert (=> bm!1426 (= call!1431 (map!397 (_2!459 lt!6789)))))

(declare-fun bm!1427 () Bool)

(declare-fun call!1432 () ListLongMap!557)

(assert (=> bm!1427 (= call!1441 call!1432)))

(declare-fun lt!6792 () (_ BitVec 32))

(declare-fun c!2518 () Bool)

(declare-fun bm!1428 () Bool)

(assert (=> bm!1428 (= call!1432 (getCurrentListMap!124 (_keys!3139 lt!6655) (ite c!2518 (_values!1707 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655)))) (mask!4691 lt!6655) (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun b!21570 () Bool)

(declare-fun res!13826 () Bool)

(assert (=> b!21570 (= res!13826 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2327 lt!6793)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21570 (=> (not res!13826) (not e!14040))))

(declare-fun b!21571 () Bool)

(declare-fun call!1438 () Bool)

(assert (=> b!21571 (= e!14040 (not call!1438))))

(declare-fun bm!1429 () Bool)

(declare-fun call!1443 () Bool)

(declare-fun call!1448 () Bool)

(assert (=> bm!1429 (= call!1443 call!1448)))

(declare-fun b!21572 () Bool)

(declare-fun lt!6805 () Unit!462)

(declare-fun lt!6794 () Unit!462)

(assert (=> b!21572 (= lt!6805 lt!6794)))

(assert (=> b!21572 (= call!1447 call!1441)))

(assert (=> b!21572 (= lt!6794 (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) lt!6792 (zeroValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 lt!6655) (defaultEntry!1718 lt!6655)))))

(assert (=> b!21572 (= lt!6792 (bvor (extraKeys!1621 lt!6655) #b00000000000000000000000000000001))))

(assert (=> b!21572 (= e!14042 (tuple2!913 true (LongMapFixedSize!185 (defaultEntry!1718 lt!6655) (mask!4691 lt!6655) (bvor (extraKeys!1621 lt!6655) #b00000000000000000000000000000001) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 lt!6655) (_size!133 lt!6655) (_keys!3139 lt!6655) (_values!1707 lt!6655) (_vacant!133 lt!6655))))))

(declare-fun b!21573 () Bool)

(declare-fun res!13827 () Bool)

(declare-fun call!1445 () Bool)

(assert (=> b!21573 (= res!13827 call!1445)))

(assert (=> b!21573 (=> (not res!13827) (not e!14030))))

(declare-fun b!21574 () Bool)

(declare-fun lt!6795 () Unit!462)

(declare-fun lt!6807 () Unit!462)

(assert (=> b!21574 (= lt!6795 lt!6807)))

(assert (=> b!21574 (contains!224 call!1437 (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!6799)))))

(declare-fun lt!6809 () array!1209)

(assert (=> b!21574 (= lt!6807 (lemmaValidKeyInArrayIsInListMap!7 (_keys!3139 lt!6655) lt!6809 (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (index!2325 lt!6799) (defaultEntry!1718 lt!6655)))))

(assert (=> b!21574 (= lt!6809 (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655))))))

(declare-fun lt!6802 () Unit!462)

(declare-fun lt!6798 () Unit!462)

(assert (=> b!21574 (= lt!6802 lt!6798)))

(declare-fun call!1434 () ListLongMap!557)

(assert (=> b!21574 (= call!1434 call!1432)))

(assert (=> b!21574 (= lt!6798 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (index!2325 lt!6799) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 lt!6655)))))

(declare-fun lt!6785 () Unit!462)

(declare-fun e!14024 () Unit!462)

(assert (=> b!21574 (= lt!6785 e!14024)))

(declare-fun call!1436 () Bool)

(assert (=> b!21574 (= c!2515 call!1436)))

(assert (=> b!21574 (= e!14039 (tuple2!913 true (LongMapFixedSize!185 (defaultEntry!1718 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (_size!133 lt!6655) (_keys!3139 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655))) (_vacant!133 lt!6655))))))

(declare-fun b!21575 () Bool)

(declare-fun lt!6784 () Unit!462)

(assert (=> b!21575 (= lt!6784 e!14033)))

(assert (=> b!21575 (= c!2513 call!1436)))

(assert (=> b!21575 (= e!14032 (tuple2!913 false lt!6655))))

(declare-fun b!21576 () Bool)

(assert (=> b!21576 (= e!14023 ((_ is Undefined!51) lt!6793))))

(declare-fun b!21577 () Bool)

(assert (=> b!21577 (= e!14034 e!14037)))

(declare-fun res!13822 () Bool)

(assert (=> b!21577 (= res!13822 call!1443)))

(assert (=> b!21577 (=> (not res!13822) (not e!14037))))

(declare-fun b!21578 () Bool)

(assert (=> b!21578 (= e!14041 (not call!1438))))

(declare-fun call!1428 () ListLongMap!557)

(declare-fun bm!1430 () Bool)

(assert (=> bm!1430 (= call!1428 (getCurrentListMap!124 (_keys!3139 lt!6655) (ite (or c!2518 c!2522) (_values!1707 lt!6655) lt!6809) (mask!4691 lt!6655) (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) (zeroValue!1645 lt!6655) (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun bm!1431 () Bool)

(declare-fun call!1439 () SeekEntryResult!51)

(assert (=> bm!1431 (= call!1446 call!1439)))

(declare-fun bm!1432 () Bool)

(declare-fun call!1450 () Bool)

(assert (=> bm!1432 (= call!1442 call!1450)))

(declare-fun b!21579 () Bool)

(assert (=> b!21579 (= e!14029 e!14039)))

(declare-fun c!2523 () Bool)

(assert (=> b!21579 (= c!2523 ((_ is MissingZero!51) lt!6799))))

(declare-fun bm!1433 () Bool)

(assert (=> bm!1433 (= call!1434 (+!41 e!14028 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun c!2511 () Bool)

(assert (=> bm!1433 (= c!2511 c!2518)))

(declare-fun bm!1434 () Bool)

(assert (=> bm!1434 (= call!1427 call!1445)))

(declare-fun b!21580 () Bool)

(assert (=> b!21580 (= e!14028 (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun b!21581 () Bool)

(declare-fun res!13825 () Bool)

(declare-fun e!14043 () Bool)

(assert (=> b!21581 (=> (not res!13825) (not e!14043))))

(assert (=> b!21581 (= res!13825 call!1443)))

(assert (=> b!21581 (= e!14036 e!14043)))

(declare-fun bm!1435 () Bool)

(declare-fun call!1435 () SeekEntryResult!51)

(assert (=> bm!1435 (= call!1435 call!1439)))

(declare-fun b!21582 () Bool)

(declare-fun lt!6797 () Unit!462)

(assert (=> b!21582 (= e!14033 lt!6797)))

(declare-fun call!1430 () Unit!462)

(assert (=> b!21582 (= lt!6797 call!1430)))

(assert (=> b!21582 (= lt!6787 call!1446)))

(assert (=> b!21582 (= c!2524 ((_ is MissingZero!51) lt!6787))))

(assert (=> b!21582 e!14036))

(declare-fun b!21583 () Bool)

(declare-fun c!2521 () Bool)

(assert (=> b!21583 (= c!2521 ((_ is MissingVacant!51) lt!6793))))

(declare-fun e!14038 () Bool)

(assert (=> b!21583 (= e!14038 e!14023)))

(declare-fun b!21584 () Bool)

(declare-fun e!14035 () Bool)

(declare-fun e!14027 () Bool)

(assert (=> b!21584 (= e!14035 e!14027)))

(declare-fun c!2520 () Bool)

(assert (=> b!21584 (= c!2520 (_1!459 lt!6789))))

(declare-fun b!21585 () Bool)

(declare-fun e!14026 () tuple2!912)

(assert (=> b!21585 (= e!14026 e!14032)))

(assert (=> b!21585 (= lt!6799 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 lt!6655) (mask!4691 lt!6655)))))

(assert (=> b!21585 (= c!2522 ((_ is Undefined!51) lt!6799))))

(declare-fun bm!1436 () Bool)

(assert (=> bm!1436 (= call!1437 call!1428)))

(declare-fun bm!1437 () Bool)

(assert (=> bm!1437 (= call!1429 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun bm!1438 () Bool)

(declare-fun c!2519 () Bool)

(assert (=> bm!1438 (= c!2519 c!2522)))

(assert (=> bm!1438 (= call!1436 (contains!224 e!14044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1439 () Bool)

(assert (=> bm!1439 (= call!1430 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun b!21586 () Bool)

(assert (=> b!21586 (= e!14026 e!14042)))

(assert (=> b!21586 (= c!2516 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21587 () Bool)

(declare-fun Unit!467 () Unit!462)

(assert (=> b!21587 (= e!14024 Unit!467)))

(declare-fun lt!6804 () Unit!462)

(assert (=> b!21587 (= lt!6804 call!1430)))

(assert (=> b!21587 (= lt!6793 call!1435)))

(assert (=> b!21587 (= c!2514 ((_ is MissingZero!51) lt!6793))))

(assert (=> b!21587 e!14038))

(declare-fun lt!6808 () Unit!462)

(assert (=> b!21587 (= lt!6808 lt!6804)))

(assert (=> b!21587 false))

(declare-fun bm!1424 () Bool)

(assert (=> bm!1424 (= call!1449 (map!397 lt!6655))))

(declare-fun d!3711 () Bool)

(assert (=> d!3711 e!14035))

(declare-fun res!13830 () Bool)

(assert (=> d!3711 (=> (not res!13830) (not e!14035))))

(assert (=> d!3711 (= res!13830 (valid!108 (_2!459 lt!6789)))))

(assert (=> d!3711 (= lt!6789 e!14026)))

(assert (=> d!3711 (= c!2518 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3711 (valid!108 lt!6655)))

(assert (=> d!3711 (= (update!31 lt!6655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) lt!6789)))

(declare-fun b!21588 () Bool)

(declare-fun lt!6788 () tuple2!912)

(assert (=> b!21588 (= e!14029 (tuple2!913 (_1!459 lt!6788) (_2!459 lt!6788)))))

(assert (=> b!21588 (= lt!6788 call!1433)))

(declare-fun bm!1440 () Bool)

(assert (=> bm!1440 (= call!1438 call!1450)))

(declare-fun bm!1441 () Bool)

(assert (=> bm!1441 (= call!1448 call!1444)))

(declare-fun b!21589 () Bool)

(declare-fun res!13821 () Bool)

(assert (=> b!21589 (= res!13821 call!1448)))

(assert (=> b!21589 (=> (not res!13821) (not e!14031))))

(declare-fun bm!1442 () Bool)

(assert (=> bm!1442 (= call!1445 call!1444)))

(declare-fun b!21590 () Bool)

(assert (=> b!21590 (= e!14043 (not call!1442))))

(declare-fun b!21591 () Bool)

(declare-fun res!13832 () Bool)

(assert (=> b!21591 (=> (not res!13832) (not e!14043))))

(assert (=> b!21591 (= res!13832 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2324 lt!6787)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21592 () Bool)

(declare-fun res!13820 () Bool)

(assert (=> b!21592 (= res!13820 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2327 lt!6787)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21592 (=> (not res!13820) (not e!14037))))

(declare-fun b!21593 () Bool)

(assert (=> b!21593 (= e!14027 (= call!1431 call!1449))))

(declare-fun b!21594 () Bool)

(assert (=> b!21594 (= e!14034 ((_ is Undefined!51) lt!6787))))

(declare-fun b!21595 () Bool)

(declare-fun lt!6800 () Unit!462)

(assert (=> b!21595 (= e!14024 lt!6800)))

(assert (=> b!21595 (= lt!6800 call!1429)))

(assert (=> b!21595 (= lt!6791 call!1435)))

(declare-fun res!13819 () Bool)

(assert (=> b!21595 (= res!13819 ((_ is Found!51) lt!6791))))

(assert (=> b!21595 (=> (not res!13819) (not e!14030))))

(assert (=> b!21595 e!14030))

(declare-fun bm!1443 () Bool)

(assert (=> bm!1443 (= call!1439 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 lt!6655) (mask!4691 lt!6655)))))

(declare-fun b!21596 () Bool)

(declare-fun res!13829 () Bool)

(assert (=> b!21596 (=> (not res!13829) (not e!14041))))

(assert (=> b!21596 (= res!13829 call!1427)))

(assert (=> b!21596 (= e!14038 e!14041)))

(declare-fun b!21597 () Bool)

(assert (=> b!21597 (= e!14027 e!14025)))

(declare-fun res!13823 () Bool)

(assert (=> b!21597 (= res!13823 (contains!224 call!1431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21597 (=> (not res!13823) (not e!14025))))

(declare-fun bm!1444 () Bool)

(assert (=> bm!1444 (= call!1440 call!1428)))

(declare-fun bm!1445 () Bool)

(assert (=> bm!1445 (= call!1433 (updateHelperNewKey!7 lt!6655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799))))))

(declare-fun bm!1446 () Bool)

(assert (=> bm!1446 (= call!1447 call!1434)))

(declare-fun bm!1447 () Bool)

(assert (=> bm!1447 (= call!1450 (arrayContainsKey!0 (_keys!3139 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (= (and d!3711 c!2518) b!21586))

(assert (= (and d!3711 (not c!2518)) b!21585))

(assert (= (and b!21586 c!2516) b!21572))

(assert (= (and b!21586 (not c!2516)) b!21562))

(assert (= (or b!21572 b!21562) bm!1444))

(assert (= (or b!21572 b!21562) bm!1427))

(assert (= (or b!21572 b!21562) bm!1446))

(assert (= (and b!21585 c!2522) b!21575))

(assert (= (and b!21585 (not c!2522)) b!21564))

(assert (= (and b!21575 c!2513) b!21569))

(assert (= (and b!21575 (not c!2513)) b!21582))

(assert (= (and b!21569 res!13824) b!21589))

(assert (= (and b!21589 res!13821) b!21561))

(assert (= (and b!21582 c!2524) b!21581))

(assert (= (and b!21582 (not c!2524)) b!21560))

(assert (= (and b!21581 res!13825) b!21591))

(assert (= (and b!21591 res!13832) b!21590))

(assert (= (and b!21560 c!2512) b!21577))

(assert (= (and b!21560 (not c!2512)) b!21594))

(assert (= (and b!21577 res!13822) b!21592))

(assert (= (and b!21592 res!13820) b!21566))

(assert (= (or b!21581 b!21577) bm!1429))

(assert (= (or b!21590 b!21566) bm!1432))

(assert (= (or b!21589 bm!1429) bm!1441))

(assert (= (or b!21569 b!21582) bm!1431))

(assert (= (and b!21564 c!2517) b!21588))

(assert (= (and b!21564 (not c!2517)) b!21579))

(assert (= (and b!21579 c!2523) b!21567))

(assert (= (and b!21579 (not c!2523)) b!21574))

(assert (= (and b!21574 c!2515) b!21595))

(assert (= (and b!21574 (not c!2515)) b!21587))

(assert (= (and b!21595 res!13819) b!21573))

(assert (= (and b!21573 res!13827) b!21558))

(assert (= (and b!21587 c!2514) b!21596))

(assert (= (and b!21587 (not c!2514)) b!21583))

(assert (= (and b!21596 res!13829) b!21557))

(assert (= (and b!21557 res!13828) b!21578))

(assert (= (and b!21583 c!2521) b!21563))

(assert (= (and b!21583 (not c!2521)) b!21576))

(assert (= (and b!21563 res!13831) b!21570))

(assert (= (and b!21570 res!13826) b!21571))

(assert (= (or b!21596 b!21563) bm!1434))

(assert (= (or b!21578 b!21571) bm!1440))

(assert (= (or b!21573 bm!1434) bm!1442))

(assert (= (or b!21595 b!21587) bm!1435))

(assert (= (or b!21588 b!21567) bm!1445))

(assert (= (or bm!1432 bm!1440) bm!1447))

(assert (= (or bm!1441 bm!1442) bm!1425))

(assert (= (or b!21575 b!21574) bm!1436))

(assert (= (or b!21569 b!21595) bm!1437))

(assert (= (or b!21582 b!21587) bm!1439))

(assert (= (or bm!1431 bm!1435) bm!1443))

(assert (= (or b!21575 b!21574) bm!1438))

(assert (= (and bm!1438 c!2519) b!21559))

(assert (= (and bm!1438 (not c!2519)) b!21568))

(assert (= (or bm!1427 b!21574) bm!1428))

(assert (= (or bm!1444 bm!1436) bm!1430))

(assert (= (or bm!1446 b!21574) bm!1433))

(assert (= (and bm!1433 c!2511) b!21556))

(assert (= (and bm!1433 (not c!2511)) b!21580))

(assert (= (and d!3711 res!13830) b!21584))

(assert (= (and b!21584 c!2520) b!21597))

(assert (= (and b!21584 (not c!2520)) b!21593))

(assert (= (and b!21597 res!13823) b!21565))

(assert (= (or b!21597 b!21565 b!21593) bm!1426))

(assert (= (or b!21565 b!21593) bm!1424))

(declare-fun m!14985 () Bool)

(assert (=> bm!1437 m!14985))

(declare-fun m!14987 () Bool)

(assert (=> bm!1433 m!14987))

(declare-fun m!14989 () Bool)

(assert (=> b!21591 m!14989))

(declare-fun m!14991 () Bool)

(assert (=> b!21562 m!14991))

(declare-fun m!14993 () Bool)

(assert (=> bm!1426 m!14993))

(declare-fun m!14995 () Bool)

(assert (=> b!21597 m!14995))

(declare-fun m!14997 () Bool)

(assert (=> bm!1445 m!14997))

(declare-fun m!14999 () Bool)

(assert (=> b!21557 m!14999))

(declare-fun m!15001 () Bool)

(assert (=> b!21585 m!15001))

(declare-fun m!15003 () Bool)

(assert (=> b!21570 m!15003))

(declare-fun m!15005 () Bool)

(assert (=> b!21565 m!15005))

(assert (=> bm!1443 m!15001))

(declare-fun m!15007 () Bool)

(assert (=> b!21580 m!15007))

(declare-fun m!15009 () Bool)

(assert (=> bm!1430 m!15009))

(declare-fun m!15011 () Bool)

(assert (=> bm!1425 m!15011))

(declare-fun m!15013 () Bool)

(assert (=> bm!1428 m!15013))

(declare-fun m!15015 () Bool)

(assert (=> bm!1428 m!15015))

(declare-fun m!15017 () Bool)

(assert (=> bm!1438 m!15017))

(assert (=> b!21574 m!15013))

(declare-fun m!15019 () Bool)

(assert (=> b!21574 m!15019))

(declare-fun m!15021 () Bool)

(assert (=> b!21574 m!15021))

(assert (=> b!21574 m!15021))

(declare-fun m!15023 () Bool)

(assert (=> b!21574 m!15023))

(declare-fun m!15025 () Bool)

(assert (=> b!21574 m!15025))

(declare-fun m!15027 () Bool)

(assert (=> bm!1439 m!15027))

(declare-fun m!15029 () Bool)

(assert (=> b!21592 m!15029))

(declare-fun m!15031 () Bool)

(assert (=> b!21572 m!15031))

(declare-fun m!15033 () Bool)

(assert (=> b!21558 m!15033))

(declare-fun m!15035 () Bool)

(assert (=> bm!1424 m!15035))

(declare-fun m!15037 () Bool)

(assert (=> d!3711 m!15037))

(declare-fun m!15039 () Bool)

(assert (=> d!3711 m!15039))

(declare-fun m!15041 () Bool)

(assert (=> bm!1447 m!15041))

(declare-fun m!15043 () Bool)

(assert (=> b!21561 m!15043))

(assert (=> b!21568 m!15007))

(assert (=> b!21310 d!3711))

(declare-fun b!21640 () Bool)

(declare-fun e!14071 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!21640 (= e!14071 (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun b!21641 () Bool)

(declare-fun e!14075 () Unit!462)

(declare-fun lt!6856 () Unit!462)

(assert (=> b!21641 (= e!14075 lt!6856)))

(declare-fun lt!6860 () ListLongMap!557)

(declare-fun getCurrentListMapNoExtraKeys!13 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) Int) ListLongMap!557)

(assert (=> b!21641 (= lt!6860 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (_values!1707 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun lt!6858 () (_ BitVec 64))

(assert (=> b!21641 (= lt!6858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6865 () (_ BitVec 64))

(assert (=> b!21641 (= lt!6865 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))

(declare-fun lt!6873 () Unit!462)

(declare-fun addStillContains!13 (ListLongMap!557 (_ BitVec 64) V!1155 (_ BitVec 64)) Unit!462)

(assert (=> b!21641 (= lt!6873 (addStillContains!13 lt!6860 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6865))))

(assert (=> b!21641 (contains!224 (+!41 lt!6860 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6865)))

(declare-fun lt!6874 () Unit!462)

(assert (=> b!21641 (= lt!6874 lt!6873)))

(declare-fun lt!6855 () ListLongMap!557)

(assert (=> b!21641 (= lt!6855 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (_values!1707 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun lt!6862 () (_ BitVec 64))

(assert (=> b!21641 (= lt!6862 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6868 () (_ BitVec 64))

(assert (=> b!21641 (= lt!6868 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))

(declare-fun lt!6861 () Unit!462)

(declare-fun addApplyDifferent!13 (ListLongMap!557 (_ BitVec 64) V!1155 (_ BitVec 64)) Unit!462)

(assert (=> b!21641 (= lt!6861 (addApplyDifferent!13 lt!6855 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6868))))

(declare-fun apply!28 (ListLongMap!557 (_ BitVec 64)) V!1155)

(assert (=> b!21641 (= (apply!28 (+!41 lt!6855 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6868) (apply!28 lt!6855 lt!6868))))

(declare-fun lt!6857 () Unit!462)

(assert (=> b!21641 (= lt!6857 lt!6861)))

(declare-fun lt!6866 () ListLongMap!557)

(assert (=> b!21641 (= lt!6866 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (_values!1707 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun lt!6870 () (_ BitVec 64))

(assert (=> b!21641 (= lt!6870 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6864 () (_ BitVec 64))

(assert (=> b!21641 (= lt!6864 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))

(declare-fun lt!6867 () Unit!462)

(assert (=> b!21641 (= lt!6867 (addApplyDifferent!13 lt!6866 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6864))))

(assert (=> b!21641 (= (apply!28 (+!41 lt!6866 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6864) (apply!28 lt!6866 lt!6864))))

(declare-fun lt!6876 () Unit!462)

(assert (=> b!21641 (= lt!6876 lt!6867)))

(declare-fun lt!6869 () ListLongMap!557)

(assert (=> b!21641 (= lt!6869 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (_values!1707 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun lt!6859 () (_ BitVec 64))

(assert (=> b!21641 (= lt!6859 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6863 () (_ BitVec 64))

(assert (=> b!21641 (= lt!6863 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))

(assert (=> b!21641 (= lt!6856 (addApplyDifferent!13 lt!6869 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6863))))

(assert (=> b!21641 (= (apply!28 (+!41 lt!6869 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6863) (apply!28 lt!6869 lt!6863))))

(declare-fun bm!1462 () Bool)

(declare-fun call!1466 () Bool)

(declare-fun lt!6872 () ListLongMap!557)

(assert (=> bm!1462 (= call!1466 (contains!224 lt!6872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21642 () Bool)

(declare-fun e!14080 () ListLongMap!557)

(declare-fun call!1469 () ListLongMap!557)

(assert (=> b!21642 (= e!14080 (+!41 call!1469 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun b!21643 () Bool)

(declare-fun e!14076 () ListLongMap!557)

(declare-fun call!1470 () ListLongMap!557)

(assert (=> b!21643 (= e!14076 call!1470)))

(declare-fun b!21644 () Bool)

(declare-fun e!14083 () Bool)

(declare-fun e!14077 () Bool)

(assert (=> b!21644 (= e!14083 e!14077)))

(declare-fun res!13857 () Bool)

(assert (=> b!21644 (=> (not res!13857) (not e!14077))))

(assert (=> b!21644 (= res!13857 (contains!224 lt!6872 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!21644 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun b!21645 () Bool)

(declare-fun e!14079 () ListLongMap!557)

(assert (=> b!21645 (= e!14079 call!1470)))

(declare-fun b!21646 () Bool)

(declare-fun get!377 (ValueCell!299 V!1155) V!1155)

(declare-fun dynLambda!137 (Int (_ BitVec 64)) V!1155)

(assert (=> b!21646 (= e!14077 (= (apply!28 lt!6872 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (get!377 (select (arr!573 (_values!1707 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21646 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_values!1707 (v!1571 (underlying!103 thiss!938))))))))

(assert (=> b!21646 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun b!21647 () Bool)

(declare-fun e!14074 () Bool)

(assert (=> b!21647 (= e!14074 (not call!1466))))

(declare-fun d!3713 () Bool)

(declare-fun e!14078 () Bool)

(assert (=> d!3713 e!14078))

(declare-fun res!13851 () Bool)

(assert (=> d!3713 (=> (not res!13851) (not e!14078))))

(assert (=> d!3713 (= res!13851 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))))))))

(declare-fun lt!6875 () ListLongMap!557)

(assert (=> d!3713 (= lt!6872 lt!6875)))

(declare-fun lt!6871 () Unit!462)

(assert (=> d!3713 (= lt!6871 e!14075)))

(declare-fun c!2537 () Bool)

(assert (=> d!3713 (= c!2537 e!14071)))

(declare-fun res!13853 () Bool)

(assert (=> d!3713 (=> (not res!13853) (not e!14071))))

(assert (=> d!3713 (= res!13853 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))))))

(assert (=> d!3713 (= lt!6875 e!14080)))

(declare-fun c!2540 () Bool)

(assert (=> d!3713 (= c!2540 (and (not (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3713 (validMask!0 (mask!4691 (v!1571 (underlying!103 thiss!938))))))

(assert (=> d!3713 (= (getCurrentListMap!124 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (_values!1707 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))) lt!6872)))

(declare-fun b!21648 () Bool)

(declare-fun e!14073 () Bool)

(declare-fun call!1471 () Bool)

(assert (=> b!21648 (= e!14073 (not call!1471))))

(declare-fun b!21649 () Bool)

(declare-fun e!14072 () Bool)

(assert (=> b!21649 (= e!14072 (= (apply!28 lt!6872 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun b!21650 () Bool)

(assert (=> b!21650 (= e!14078 e!14073)))

(declare-fun c!2539 () Bool)

(assert (=> b!21650 (= c!2539 (not (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21651 () Bool)

(declare-fun c!2541 () Bool)

(assert (=> b!21651 (= c!2541 (and (not (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21651 (= e!14076 e!14079)))

(declare-fun bm!1463 () Bool)

(declare-fun call!1465 () ListLongMap!557)

(assert (=> bm!1463 (= call!1465 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (_values!1707 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun bm!1464 () Bool)

(declare-fun call!1468 () ListLongMap!557)

(assert (=> bm!1464 (= call!1468 call!1465)))

(declare-fun bm!1465 () Bool)

(declare-fun c!2538 () Bool)

(declare-fun call!1467 () ListLongMap!557)

(assert (=> bm!1465 (= call!1469 (+!41 (ite c!2540 call!1465 (ite c!2538 call!1468 call!1467)) (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun b!21652 () Bool)

(declare-fun res!13858 () Bool)

(assert (=> b!21652 (=> (not res!13858) (not e!14078))))

(assert (=> b!21652 (= res!13858 e!14083)))

(declare-fun res!13854 () Bool)

(assert (=> b!21652 (=> res!13854 e!14083)))

(declare-fun e!14081 () Bool)

(assert (=> b!21652 (= res!13854 (not e!14081))))

(declare-fun res!13852 () Bool)

(assert (=> b!21652 (=> (not res!13852) (not e!14081))))

(assert (=> b!21652 (= res!13852 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun b!21653 () Bool)

(assert (=> b!21653 (= e!14080 e!14076)))

(assert (=> b!21653 (= c!2538 (and (not (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21654 () Bool)

(declare-fun e!14082 () Bool)

(assert (=> b!21654 (= e!14073 e!14082)))

(declare-fun res!13855 () Bool)

(assert (=> b!21654 (= res!13855 call!1471)))

(assert (=> b!21654 (=> (not res!13855) (not e!14082))))

(declare-fun b!21655 () Bool)

(assert (=> b!21655 (= e!14079 call!1467)))

(declare-fun b!21656 () Bool)

(assert (=> b!21656 (= e!14081 (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun bm!1466 () Bool)

(assert (=> bm!1466 (= call!1467 call!1468)))

(declare-fun b!21657 () Bool)

(declare-fun Unit!468 () Unit!462)

(assert (=> b!21657 (= e!14075 Unit!468)))

(declare-fun b!21658 () Bool)

(assert (=> b!21658 (= e!14074 e!14072)))

(declare-fun res!13856 () Bool)

(assert (=> b!21658 (= res!13856 call!1466)))

(assert (=> b!21658 (=> (not res!13856) (not e!14072))))

(declare-fun b!21659 () Bool)

(declare-fun res!13859 () Bool)

(assert (=> b!21659 (=> (not res!13859) (not e!14078))))

(assert (=> b!21659 (= res!13859 e!14074)))

(declare-fun c!2542 () Bool)

(assert (=> b!21659 (= c!2542 (not (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21660 () Bool)

(assert (=> b!21660 (= e!14082 (= (apply!28 lt!6872 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun bm!1467 () Bool)

(assert (=> bm!1467 (= call!1470 call!1469)))

(declare-fun bm!1468 () Bool)

(assert (=> bm!1468 (= call!1471 (contains!224 lt!6872 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3713 c!2540) b!21642))

(assert (= (and d!3713 (not c!2540)) b!21653))

(assert (= (and b!21653 c!2538) b!21643))

(assert (= (and b!21653 (not c!2538)) b!21651))

(assert (= (and b!21651 c!2541) b!21645))

(assert (= (and b!21651 (not c!2541)) b!21655))

(assert (= (or b!21645 b!21655) bm!1466))

(assert (= (or b!21643 bm!1466) bm!1464))

(assert (= (or b!21643 b!21645) bm!1467))

(assert (= (or b!21642 bm!1464) bm!1463))

(assert (= (or b!21642 bm!1467) bm!1465))

(assert (= (and d!3713 res!13853) b!21640))

(assert (= (and d!3713 c!2537) b!21641))

(assert (= (and d!3713 (not c!2537)) b!21657))

(assert (= (and d!3713 res!13851) b!21652))

(assert (= (and b!21652 res!13852) b!21656))

(assert (= (and b!21652 (not res!13854)) b!21644))

(assert (= (and b!21644 res!13857) b!21646))

(assert (= (and b!21652 res!13858) b!21659))

(assert (= (and b!21659 c!2542) b!21658))

(assert (= (and b!21659 (not c!2542)) b!21647))

(assert (= (and b!21658 res!13856) b!21649))

(assert (= (or b!21658 b!21647) bm!1462))

(assert (= (and b!21659 res!13859) b!21650))

(assert (= (and b!21650 c!2539) b!21654))

(assert (= (and b!21650 (not c!2539)) b!21648))

(assert (= (and b!21654 res!13855) b!21660))

(assert (= (or b!21654 b!21648) bm!1468))

(declare-fun b_lambda!1509 () Bool)

(assert (=> (not b_lambda!1509) (not b!21646)))

(declare-fun t!3211 () Bool)

(declare-fun tb!639 () Bool)

(assert (=> (and b!21300 (= (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))) t!3211) tb!639))

(declare-fun result!1063 () Bool)

(assert (=> tb!639 (= result!1063 tp_is_empty!997)))

(assert (=> b!21646 t!3211))

(declare-fun b_and!1421 () Bool)

(assert (= b_and!1415 (and (=> t!3211 result!1063) b_and!1421)))

(declare-fun m!15045 () Bool)

(assert (=> bm!1465 m!15045))

(declare-fun m!15047 () Bool)

(assert (=> b!21640 m!15047))

(assert (=> b!21640 m!15047))

(declare-fun m!15049 () Bool)

(assert (=> b!21640 m!15049))

(declare-fun m!15051 () Bool)

(assert (=> b!21660 m!15051))

(assert (=> b!21646 m!15047))

(declare-fun m!15053 () Bool)

(assert (=> b!21646 m!15053))

(declare-fun m!15055 () Bool)

(assert (=> b!21646 m!15055))

(declare-fun m!15057 () Bool)

(assert (=> b!21646 m!15057))

(assert (=> b!21646 m!15053))

(assert (=> b!21646 m!15047))

(declare-fun m!15059 () Bool)

(assert (=> b!21646 m!15059))

(assert (=> b!21646 m!15055))

(assert (=> d!3713 m!14849))

(assert (=> b!21656 m!15047))

(assert (=> b!21656 m!15047))

(assert (=> b!21656 m!15049))

(declare-fun m!15061 () Bool)

(assert (=> bm!1468 m!15061))

(declare-fun m!15063 () Bool)

(assert (=> b!21642 m!15063))

(declare-fun m!15065 () Bool)

(assert (=> bm!1463 m!15065))

(declare-fun m!15067 () Bool)

(assert (=> b!21649 m!15067))

(declare-fun m!15069 () Bool)

(assert (=> bm!1462 m!15069))

(assert (=> b!21644 m!15047))

(assert (=> b!21644 m!15047))

(declare-fun m!15071 () Bool)

(assert (=> b!21644 m!15071))

(declare-fun m!15073 () Bool)

(assert (=> b!21641 m!15073))

(declare-fun m!15075 () Bool)

(assert (=> b!21641 m!15075))

(assert (=> b!21641 m!15047))

(assert (=> b!21641 m!15075))

(declare-fun m!15077 () Bool)

(assert (=> b!21641 m!15077))

(declare-fun m!15079 () Bool)

(assert (=> b!21641 m!15079))

(declare-fun m!15081 () Bool)

(assert (=> b!21641 m!15081))

(declare-fun m!15083 () Bool)

(assert (=> b!21641 m!15083))

(declare-fun m!15085 () Bool)

(assert (=> b!21641 m!15085))

(declare-fun m!15087 () Bool)

(assert (=> b!21641 m!15087))

(declare-fun m!15089 () Bool)

(assert (=> b!21641 m!15089))

(assert (=> b!21641 m!15079))

(declare-fun m!15091 () Bool)

(assert (=> b!21641 m!15091))

(declare-fun m!15093 () Bool)

(assert (=> b!21641 m!15093))

(assert (=> b!21641 m!15065))

(declare-fun m!15095 () Bool)

(assert (=> b!21641 m!15095))

(declare-fun m!15097 () Bool)

(assert (=> b!21641 m!15097))

(assert (=> b!21641 m!15087))

(declare-fun m!15099 () Bool)

(assert (=> b!21641 m!15099))

(assert (=> b!21641 m!15093))

(declare-fun m!15101 () Bool)

(assert (=> b!21641 m!15101))

(assert (=> b!21296 d!3713))

(declare-fun d!3715 () Bool)

(assert (=> d!3715 (= (map!397 (v!1571 (_2!457 lt!6660))) (getCurrentListMap!124 (_keys!3139 (v!1571 (_2!457 lt!6660))) (_values!1707 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660))) (extraKeys!1621 (v!1571 (_2!457 lt!6660))) (zeroValue!1645 (v!1571 (_2!457 lt!6660))) (minValue!1645 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1571 (_2!457 lt!6660)))))))

(declare-fun bs!908 () Bool)

(assert (= bs!908 d!3715))

(declare-fun m!15103 () Bool)

(assert (=> bs!908 m!15103))

(assert (=> b!21296 d!3715))

(declare-fun d!3717 () Bool)

(assert (=> d!3717 (= (validMask!0 (mask!4691 (v!1571 (underlying!103 thiss!938)))) (and (or (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000001111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000011111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000001111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000011111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000001111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000011111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000001111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000011111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000001111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000011111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000001111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000011111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000111111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000001111111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000011111111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000111111111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000001111111111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000011111111111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000111111111111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00001111111111111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00011111111111111111111111111111) (= (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!21306 d!3717))

(declare-fun b!21675 () Bool)

(declare-fun e!14092 () Unit!462)

(declare-fun Unit!469 () Unit!462)

(assert (=> b!21675 (= e!14092 Unit!469)))

(declare-fun b!21676 () Bool)

(declare-fun res!13865 () Bool)

(declare-fun e!14091 () Bool)

(assert (=> b!21676 (=> (not res!13865) (not e!14091))))

(declare-fun lt!6925 () LongMapFixedSize!184)

(assert (=> b!21676 (= res!13865 (= (mask!4691 lt!6925) (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun b!21677 () Bool)

(declare-fun e!14090 () Bool)

(declare-fun lt!6937 () tuple2!910)

(declare-fun lt!6934 () (_ BitVec 32))

(assert (=> b!21677 (= e!14090 (ite (= (_1!458 lt!6937) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6934 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6934 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!21678 () Bool)

(declare-fun lt!6935 () array!1207)

(assert (=> b!21678 (= e!14090 (arrayContainsKey!0 lt!6935 (_1!458 lt!6937) #b00000000000000000000000000000000))))

(declare-fun d!3719 () Bool)

(assert (=> d!3719 e!14091))

(declare-fun res!13864 () Bool)

(assert (=> d!3719 (=> (not res!13864) (not e!14091))))

(assert (=> d!3719 (= res!13864 (valid!108 lt!6925))))

(declare-fun lt!6944 () LongMapFixedSize!184)

(assert (=> d!3719 (= lt!6925 lt!6944)))

(declare-fun lt!6928 () Unit!462)

(assert (=> d!3719 (= lt!6928 e!14092)))

(declare-fun c!2547 () Bool)

(assert (=> d!3719 (= c!2547 (not (= (map!397 lt!6944) (ListLongMap!558 Nil!555))))))

(declare-fun lt!6940 () Unit!462)

(declare-fun lt!6943 () Unit!462)

(assert (=> d!3719 (= lt!6940 lt!6943)))

(declare-fun lt!6938 () array!1207)

(declare-fun lt!6939 () (_ BitVec 32))

(declare-fun lt!6932 () List!559)

(assert (=> d!3719 (arrayNoDuplicates!0 lt!6938 lt!6939 lt!6932)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1207 (_ BitVec 32) (_ BitVec 32) List!559) Unit!462)

(assert (=> d!3719 (= lt!6943 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6938 lt!6939 (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) lt!6932))))

(assert (=> d!3719 (= lt!6932 Nil!556)))

(assert (=> d!3719 (= lt!6939 #b00000000000000000000000000000000)))

(assert (=> d!3719 (= lt!6938 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6941 () Unit!462)

(declare-fun lt!6936 () Unit!462)

(assert (=> d!3719 (= lt!6941 lt!6936)))

(declare-fun lt!6930 () (_ BitVec 32))

(declare-fun lt!6927 () array!1207)

(assert (=> d!3719 (arrayForallSeekEntryOrOpenFound!0 lt!6930 lt!6927 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1207 (_ BitVec 32) (_ BitVec 32)) Unit!462)

(assert (=> d!3719 (= lt!6936 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6927 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) lt!6930))))

(assert (=> d!3719 (= lt!6930 #b00000000000000000000000000000000)))

(assert (=> d!3719 (= lt!6927 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6926 () Unit!462)

(declare-fun lt!6933 () Unit!462)

(assert (=> d!3719 (= lt!6926 lt!6933)))

(declare-fun lt!6929 () array!1207)

(declare-fun lt!6923 () (_ BitVec 32))

(declare-fun lt!6942 () (_ BitVec 32))

(assert (=> d!3719 (= (arrayCountValidKeys!0 lt!6929 lt!6923 lt!6942) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1207 (_ BitVec 32) (_ BitVec 32)) Unit!462)

(assert (=> d!3719 (= lt!6933 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6929 lt!6923 lt!6942))))

(assert (=> d!3719 (= lt!6942 (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3719 (= lt!6923 #b00000000000000000000000000000000)))

(assert (=> d!3719 (= lt!6929 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3719 (= lt!6944 (LongMapFixedSize!185 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (array!1210 ((as const (Array (_ BitVec 32) ValueCell!299)) EmptyCell!299) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3719 (validMask!0 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))))))

(assert (=> d!3719 (= (getNewLongMapFixedSize!30 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))) lt!6925)))

(declare-fun b!21679 () Bool)

(declare-fun Unit!470 () Unit!462)

(assert (=> b!21679 (= e!14092 Unit!470)))

(declare-fun head!825 (List!558) tuple2!910)

(assert (=> b!21679 (= lt!6937 (head!825 (toList!294 (map!397 lt!6944))))))

(assert (=> b!21679 (= lt!6935 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!21679 (= lt!6934 #b00000000000000000000000000000000)))

(declare-fun lt!6924 () Unit!462)

(declare-fun lemmaKeyInListMapIsInArray!94 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!462)

(assert (=> b!21679 (= lt!6924 (lemmaKeyInListMapIsInArray!94 lt!6935 (array!1210 ((as const (Array (_ BitVec 32) ValueCell!299)) EmptyCell!299) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) lt!6934 (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!458 lt!6937) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun c!2548 () Bool)

(assert (=> b!21679 (= c!2548 (and (not (= (_1!458 lt!6937) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!458 lt!6937) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21679 e!14090))

(declare-fun lt!6931 () Unit!462)

(assert (=> b!21679 (= lt!6931 lt!6924)))

(declare-fun lt!6945 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1207 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21679 (= lt!6945 (arrayScanForKey!0 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (_1!458 lt!6937) #b00000000000000000000000000000000))))

(assert (=> b!21679 false))

(declare-fun b!21680 () Bool)

(assert (=> b!21680 (= e!14091 (= (map!397 lt!6925) (ListLongMap!558 Nil!555)))))

(assert (= (and d!3719 c!2547) b!21679))

(assert (= (and d!3719 (not c!2547)) b!21675))

(assert (= (and b!21679 c!2548) b!21678))

(assert (= (and b!21679 (not c!2548)) b!21677))

(assert (= (and d!3719 res!13864) b!21676))

(assert (= (and b!21676 res!13865) b!21680))

(declare-fun b_lambda!1511 () Bool)

(assert (=> (not b_lambda!1511) (not d!3719)))

(assert (=> d!3719 t!3211))

(declare-fun b_and!1423 () Bool)

(assert (= b_and!1421 (and (=> t!3211 result!1063) b_and!1423)))

(declare-fun b_lambda!1513 () Bool)

(assert (=> (not b_lambda!1513) (not b!21679)))

(assert (=> b!21679 t!3211))

(declare-fun b_and!1425 () Bool)

(assert (= b_and!1423 (and (=> t!3211 result!1063) b_and!1425)))

(declare-fun m!15105 () Bool)

(assert (=> b!21678 m!15105))

(declare-fun m!15107 () Bool)

(assert (=> d!3719 m!15107))

(declare-fun m!15109 () Bool)

(assert (=> d!3719 m!15109))

(declare-fun m!15111 () Bool)

(assert (=> d!3719 m!15111))

(declare-fun m!15113 () Bool)

(assert (=> d!3719 m!15113))

(assert (=> d!3719 m!15055))

(assert (=> d!3719 m!14861))

(declare-fun m!15115 () Bool)

(assert (=> d!3719 m!15115))

(assert (=> d!3719 m!14861))

(declare-fun m!15117 () Bool)

(assert (=> d!3719 m!15117))

(declare-fun m!15119 () Bool)

(assert (=> d!3719 m!15119))

(declare-fun m!15121 () Bool)

(assert (=> d!3719 m!15121))

(assert (=> d!3719 m!14861))

(declare-fun m!15123 () Bool)

(assert (=> d!3719 m!15123))

(assert (=> b!21679 m!14861))

(assert (=> b!21679 m!15055))

(assert (=> b!21679 m!15055))

(declare-fun m!15125 () Bool)

(assert (=> b!21679 m!15125))

(declare-fun m!15127 () Bool)

(assert (=> b!21679 m!15127))

(assert (=> b!21679 m!15111))

(assert (=> b!21679 m!15055))

(declare-fun m!15129 () Bool)

(assert (=> b!21679 m!15129))

(declare-fun m!15131 () Bool)

(assert (=> b!21680 m!15131))

(assert (=> b!21305 d!3719))

(declare-fun d!3721 () Bool)

(declare-fun e!14098 () Bool)

(assert (=> d!3721 e!14098))

(declare-fun res!13868 () Bool)

(assert (=> d!3721 (=> (not res!13868) (not e!14098))))

(declare-fun lt!6950 () (_ BitVec 32))

(assert (=> d!3721 (= res!13868 (validMask!0 lt!6950))))

(declare-datatypes ((tuple2!918 0))(
  ( (tuple2!919 (_1!462 Unit!462) (_2!462 (_ BitVec 32))) )
))
(declare-fun e!14097 () tuple2!918)

(assert (=> d!3721 (= lt!6950 (_2!462 e!14097))))

(declare-fun c!2551 () Bool)

(declare-fun lt!6951 () tuple2!918)

(assert (=> d!3721 (= c!2551 (and (bvsgt (_2!462 lt!6951) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!133 (v!1571 (underlying!103 thiss!938)))) (_2!462 lt!6951)) (bvsge (bvadd (bvand (bvashr (_2!462 lt!6951) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!133 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun Unit!471 () Unit!462)

(declare-fun Unit!472 () Unit!462)

(assert (=> d!3721 (= lt!6951 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!133 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))))) (mask!4691 (v!1571 (underlying!103 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!133 (v!1571 (underlying!103 thiss!938)))) (mask!4691 (v!1571 (underlying!103 thiss!938))))) (tuple2!919 Unit!471 (bvand (bvadd (bvshl (mask!4691 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!919 Unit!472 (mask!4691 (v!1571 (underlying!103 thiss!938))))))))

(assert (=> d!3721 (validMask!0 (mask!4691 (v!1571 (underlying!103 thiss!938))))))

(assert (=> d!3721 (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) lt!6950)))

(declare-fun b!21687 () Bool)

(declare-fun computeNewMaskWhile!11 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!918)

(assert (=> b!21687 (= e!14097 (computeNewMaskWhile!11 (_size!133 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (_2!462 lt!6951)))))

(declare-fun b!21688 () Bool)

(declare-fun Unit!473 () Unit!462)

(assert (=> b!21688 (= e!14097 (tuple2!919 Unit!473 (_2!462 lt!6951)))))

(declare-fun b!21689 () Bool)

(assert (=> b!21689 (= e!14098 (bvsle (_size!133 (v!1571 (underlying!103 thiss!938))) (bvadd lt!6950 #b00000000000000000000000000000001)))))

(assert (= (and d!3721 c!2551) b!21687))

(assert (= (and d!3721 (not c!2551)) b!21688))

(assert (= (and d!3721 res!13868) b!21689))

(declare-fun m!15133 () Bool)

(assert (=> d!3721 m!15133))

(assert (=> d!3721 m!14849))

(declare-fun m!15135 () Bool)

(assert (=> b!21687 m!15135))

(assert (=> b!21305 d!3721))

(declare-fun d!3723 () Bool)

(assert (=> d!3723 (= (array_inv!411 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvsge (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!21300 d!3723))

(declare-fun d!3725 () Bool)

(assert (=> d!3725 (= (array_inv!412 (_values!1707 (v!1571 (underlying!103 thiss!938)))) (bvsge (size!666 (_values!1707 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!21300 d!3725))

(declare-fun mapIsEmpty!985 () Bool)

(declare-fun mapRes!985 () Bool)

(assert (=> mapIsEmpty!985 mapRes!985))

(declare-fun b!21696 () Bool)

(declare-fun e!14104 () Bool)

(assert (=> b!21696 (= e!14104 tp_is_empty!997)))

(declare-fun condMapEmpty!985 () Bool)

(declare-fun mapDefault!985 () ValueCell!299)

(assert (=> mapNonEmpty!976 (= condMapEmpty!985 (= mapRest!976 ((as const (Array (_ BitVec 32) ValueCell!299)) mapDefault!985)))))

(declare-fun e!14103 () Bool)

(assert (=> mapNonEmpty!976 (= tp!3435 (and e!14103 mapRes!985))))

(declare-fun mapNonEmpty!985 () Bool)

(declare-fun tp!3451 () Bool)

(assert (=> mapNonEmpty!985 (= mapRes!985 (and tp!3451 e!14104))))

(declare-fun mapValue!985 () ValueCell!299)

(declare-fun mapKey!985 () (_ BitVec 32))

(declare-fun mapRest!985 () (Array (_ BitVec 32) ValueCell!299))

(assert (=> mapNonEmpty!985 (= mapRest!976 (store mapRest!985 mapKey!985 mapValue!985))))

(declare-fun b!21697 () Bool)

(assert (=> b!21697 (= e!14103 tp_is_empty!997)))

(assert (= (and mapNonEmpty!976 condMapEmpty!985) mapIsEmpty!985))

(assert (= (and mapNonEmpty!976 (not condMapEmpty!985)) mapNonEmpty!985))

(assert (= (and mapNonEmpty!985 ((_ is ValueCellFull!299) mapValue!985)) b!21696))

(assert (= (and mapNonEmpty!976 ((_ is ValueCellFull!299) mapDefault!985)) b!21697))

(declare-fun m!15137 () Bool)

(assert (=> mapNonEmpty!985 m!15137))

(declare-fun b_lambda!1515 () Bool)

(assert (= b_lambda!1511 (or (and b!21300 b_free!733) b_lambda!1515)))

(declare-fun b_lambda!1517 () Bool)

(assert (= b_lambda!1509 (or (and b!21300 b_free!733) b_lambda!1517)))

(declare-fun b_lambda!1519 () Bool)

(assert (= b_lambda!1513 (or (and b!21300 b_free!733) b_lambda!1519)))

(check-sat (not bm!1424) b_and!1425 (not bm!1426) (not bm!1413) (not b!21678) (not bm!1423) (not b!21562) (not d!3713) (not b!21597) (not bm!1443) (not d!3715) (not bm!1437) (not b!21428) (not bm!1465) (not b!21429) (not bm!1438) (not bm!1428) (not b_next!733) (not b!21543) (not b!21538) (not bm!1447) (not bm!1406) (not bm!1421) (not b!21565) (not b_lambda!1515) (not bm!1445) (not d!3721) (not b!21532) (not b!21427) (not bm!1409) (not bm!1404) (not b!21646) tp_is_empty!997 (not bm!1430) (not d!3707) (not b_lambda!1519) (not b!21644) (not b!21687) (not b!21568) (not bm!1414) (not b!21679) (not bm!1463) (not b!21680) (not bm!1415) (not b_lambda!1517) (not bm!1401) (not b!21642) (not b!21660) (not b!21526) (not b!21574) (not bm!1468) (not bm!1425) (not bm!1433) (not mapNonEmpty!985) (not b!21523) (not bm!1400) (not b!21530) (not b!21640) (not bm!1462) (not d!3711) (not b!21520) (not d!3705) (not bm!1439) (not b!21656) (not d!3719) (not b!21572) (not b!21580) (not bm!1419) (not b!21641) (not d!3709) (not b!21649) (not bm!1402) (not b!21585) (not b!21555))
(check-sat b_and!1425 (not b_next!733))
(get-model)

(assert (=> d!3713 d!3717))

(declare-fun b!21714 () Bool)

(declare-fun lt!6956 () SeekEntryResult!51)

(assert (=> b!21714 (and (bvsge (index!2324 lt!6956) #b00000000000000000000000000000000) (bvslt (index!2324 lt!6956) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun res!13880 () Bool)

(assert (=> b!21714 (= res!13880 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2324 lt!6956)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14115 () Bool)

(assert (=> b!21714 (=> (not res!13880) (not e!14115))))

(declare-fun c!2556 () Bool)

(declare-fun call!1476 () Bool)

(declare-fun bm!1473 () Bool)

(assert (=> bm!1473 (= call!1476 (inRange!0 (ite c!2556 (index!2324 lt!6956) (index!2327 lt!6956)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21715 () Bool)

(declare-fun e!14116 () Bool)

(assert (=> b!21715 (= e!14116 e!14115)))

(declare-fun res!13877 () Bool)

(assert (=> b!21715 (= res!13877 call!1476)))

(assert (=> b!21715 (=> (not res!13877) (not e!14115))))

(declare-fun b!21716 () Bool)

(declare-fun res!13878 () Bool)

(declare-fun e!14114 () Bool)

(assert (=> b!21716 (=> (not res!13878) (not e!14114))))

(assert (=> b!21716 (= res!13878 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2327 lt!6956)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21716 (and (bvsge (index!2327 lt!6956) #b00000000000000000000000000000000) (bvslt (index!2327 lt!6956) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21717 () Bool)

(declare-fun e!14113 () Bool)

(assert (=> b!21717 (= e!14113 ((_ is Undefined!51) lt!6956))))

(declare-fun b!21718 () Bool)

(assert (=> b!21718 (= e!14116 e!14113)))

(declare-fun c!2557 () Bool)

(assert (=> b!21718 (= c!2557 ((_ is MissingVacant!51) lt!6956))))

(declare-fun bm!1474 () Bool)

(declare-fun call!1477 () Bool)

(assert (=> bm!1474 (= call!1477 (arrayContainsKey!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!21719 () Bool)

(assert (=> b!21719 (= e!14115 (not call!1477))))

(declare-fun d!3727 () Bool)

(assert (=> d!3727 e!14116))

(assert (=> d!3727 (= c!2556 ((_ is MissingZero!51) lt!6956))))

(assert (=> d!3727 (= lt!6956 (seekEntryOrOpen!0 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!6957 () Unit!462)

(declare-fun choose!195 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!462)

(assert (=> d!3727 (= lt!6957 (choose!195 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> d!3727 (validMask!0 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3727 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!6957)))

(declare-fun b!21720 () Bool)

(declare-fun res!13879 () Bool)

(assert (=> b!21720 (=> (not res!13879) (not e!14114))))

(assert (=> b!21720 (= res!13879 call!1476)))

(assert (=> b!21720 (= e!14113 e!14114)))

(declare-fun b!21721 () Bool)

(assert (=> b!21721 (= e!14114 (not call!1477))))

(assert (= (and d!3727 c!2556) b!21715))

(assert (= (and d!3727 (not c!2556)) b!21718))

(assert (= (and b!21715 res!13877) b!21714))

(assert (= (and b!21714 res!13880) b!21719))

(assert (= (and b!21718 c!2557) b!21720))

(assert (= (and b!21718 (not c!2557)) b!21717))

(assert (= (and b!21720 res!13879) b!21716))

(assert (= (and b!21716 res!13878) b!21721))

(assert (= (or b!21715 b!21720) bm!1473))

(assert (= (or b!21719 b!21721) bm!1474))

(declare-fun m!15139 () Bool)

(assert (=> b!21716 m!15139))

(declare-fun m!15141 () Bool)

(assert (=> bm!1473 m!15141))

(assert (=> bm!1474 m!14979))

(declare-fun m!15143 () Bool)

(assert (=> b!21714 m!15143))

(assert (=> d!3727 m!14939))

(declare-fun m!15145 () Bool)

(assert (=> d!3727 m!15145))

(declare-fun m!15147 () Bool)

(assert (=> d!3727 m!15147))

(assert (=> bm!1415 d!3727))

(declare-fun d!3729 () Bool)

(assert (=> d!3729 (= (map!397 lt!6925) (getCurrentListMap!124 (_keys!3139 lt!6925) (_values!1707 lt!6925) (mask!4691 lt!6925) (extraKeys!1621 lt!6925) (zeroValue!1645 lt!6925) (minValue!1645 lt!6925) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6925)))))

(declare-fun bs!909 () Bool)

(assert (= bs!909 d!3729))

(declare-fun m!15149 () Bool)

(assert (=> bs!909 m!15149))

(assert (=> b!21680 d!3729))

(declare-fun d!3731 () Bool)

(declare-fun e!14119 () Bool)

(assert (=> d!3731 e!14119))

(declare-fun res!13886 () Bool)

(assert (=> d!3731 (=> (not res!13886) (not e!14119))))

(declare-fun lt!6962 () SeekEntryResult!51)

(assert (=> d!3731 (= res!13886 ((_ is Found!51) lt!6962))))

(assert (=> d!3731 (= lt!6962 (seekEntryOrOpen!0 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!6963 () Unit!462)

(declare-fun choose!196 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!462)

(assert (=> d!3731 (= lt!6963 (choose!196 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> d!3731 (validMask!0 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3731 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!6963)))

(declare-fun b!21726 () Bool)

(declare-fun res!13885 () Bool)

(assert (=> b!21726 (=> (not res!13885) (not e!14119))))

(assert (=> b!21726 (= res!13885 (inRange!0 (index!2325 lt!6962) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21727 () Bool)

(assert (=> b!21727 (= e!14119 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6962)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21727 (and (bvsge (index!2325 lt!6962) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6962) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(assert (= (and d!3731 res!13886) b!21726))

(assert (= (and b!21726 res!13885) b!21727))

(assert (=> d!3731 m!14939))

(declare-fun m!15151 () Bool)

(assert (=> d!3731 m!15151))

(assert (=> d!3731 m!15147))

(declare-fun m!15153 () Bool)

(assert (=> b!21726 m!15153))

(declare-fun m!15155 () Bool)

(assert (=> b!21727 m!15155))

(assert (=> bm!1413 d!3731))

(declare-fun b!21740 () Bool)

(declare-fun e!14126 () SeekEntryResult!51)

(assert (=> b!21740 (= e!14126 Undefined!51)))

(declare-fun d!3733 () Bool)

(declare-fun lt!6971 () SeekEntryResult!51)

(assert (=> d!3733 (and (or ((_ is Undefined!51) lt!6971) (not ((_ is Found!51) lt!6971)) (and (bvsge (index!2325 lt!6971) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6971) (size!665 (_keys!3139 lt!6655))))) (or ((_ is Undefined!51) lt!6971) ((_ is Found!51) lt!6971) (not ((_ is MissingZero!51) lt!6971)) (and (bvsge (index!2324 lt!6971) #b00000000000000000000000000000000) (bvslt (index!2324 lt!6971) (size!665 (_keys!3139 lt!6655))))) (or ((_ is Undefined!51) lt!6971) ((_ is Found!51) lt!6971) ((_ is MissingZero!51) lt!6971) (not ((_ is MissingVacant!51) lt!6971)) (and (bvsge (index!2327 lt!6971) #b00000000000000000000000000000000) (bvslt (index!2327 lt!6971) (size!665 (_keys!3139 lt!6655))))) (or ((_ is Undefined!51) lt!6971) (ite ((_ is Found!51) lt!6971) (= (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!6971)) #b0000000000000000000000000000000000000000000000000000000000000000) (ite ((_ is MissingZero!51) lt!6971) (= (select (arr!572 (_keys!3139 lt!6655)) (index!2324 lt!6971)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!51) lt!6971) (= (select (arr!572 (_keys!3139 lt!6655)) (index!2327 lt!6971)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!3733 (= lt!6971 e!14126)))

(declare-fun c!2566 () Bool)

(declare-fun lt!6970 () SeekEntryResult!51)

(assert (=> d!3733 (= c!2566 (and ((_ is Intermediate!51) lt!6970) (undefined!863 lt!6970)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1207 (_ BitVec 32)) SeekEntryResult!51)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3733 (= lt!6970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 #b0000000000000000000000000000000000000000000000000000000000000000 (mask!4691 lt!6655)) #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 lt!6655) (mask!4691 lt!6655)))))

(assert (=> d!3733 (validMask!0 (mask!4691 lt!6655))))

(assert (=> d!3733 (= (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 lt!6655) (mask!4691 lt!6655)) lt!6971)))

(declare-fun b!21741 () Bool)

(declare-fun e!14128 () SeekEntryResult!51)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1207 (_ BitVec 32)) SeekEntryResult!51)

(assert (=> b!21741 (= e!14128 (seekKeyOrZeroReturnVacant!0 (x!5190 lt!6970) (index!2326 lt!6970) (index!2326 lt!6970) #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 lt!6655) (mask!4691 lt!6655)))))

(declare-fun b!21742 () Bool)

(declare-fun e!14127 () SeekEntryResult!51)

(assert (=> b!21742 (= e!14127 (Found!51 (index!2326 lt!6970)))))

(declare-fun b!21743 () Bool)

(assert (=> b!21743 (= e!14126 e!14127)))

(declare-fun lt!6972 () (_ BitVec 64))

(assert (=> b!21743 (= lt!6972 (select (arr!572 (_keys!3139 lt!6655)) (index!2326 lt!6970)))))

(declare-fun c!2565 () Bool)

(assert (=> b!21743 (= c!2565 (= lt!6972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21744 () Bool)

(declare-fun c!2564 () Bool)

(assert (=> b!21744 (= c!2564 (= lt!6972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21744 (= e!14127 e!14128)))

(declare-fun b!21745 () Bool)

(assert (=> b!21745 (= e!14128 (MissingZero!51 (index!2326 lt!6970)))))

(assert (= (and d!3733 c!2566) b!21740))

(assert (= (and d!3733 (not c!2566)) b!21743))

(assert (= (and b!21743 c!2565) b!21742))

(assert (= (and b!21743 (not c!2565)) b!21744))

(assert (= (and b!21744 c!2564) b!21745))

(assert (= (and b!21744 (not c!2564)) b!21741))

(declare-fun m!15157 () Bool)

(assert (=> d!3733 m!15157))

(declare-fun m!15159 () Bool)

(assert (=> d!3733 m!15159))

(declare-fun m!15161 () Bool)

(assert (=> d!3733 m!15161))

(declare-fun m!15163 () Bool)

(assert (=> d!3733 m!15163))

(declare-fun m!15165 () Bool)

(assert (=> d!3733 m!15165))

(assert (=> d!3733 m!15161))

(declare-fun m!15167 () Bool)

(assert (=> d!3733 m!15167))

(declare-fun m!15169 () Bool)

(assert (=> b!21741 m!15169))

(declare-fun m!15171 () Bool)

(assert (=> b!21743 m!15171))

(assert (=> b!21585 d!3733))

(declare-fun d!3735 () Bool)

(assert (=> d!3735 (= (+!41 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6765 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!6975 () Unit!462)

(declare-fun choose!197 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 V!1155 Int) Unit!462)

(assert (=> d!3735 (= lt!6975 (choose!197 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6765 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> d!3735 (validMask!0 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3735 (= (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6765 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!6975)))

(declare-fun bs!910 () Bool)

(assert (= bs!910 d!3735))

(declare-fun m!15173 () Bool)

(assert (=> bs!910 m!15173))

(assert (=> bs!910 m!14945))

(declare-fun m!15175 () Bool)

(assert (=> bs!910 m!15175))

(assert (=> bs!910 m!14945))

(assert (=> bs!910 m!15147))

(declare-fun m!15177 () Bool)

(assert (=> bs!910 m!15177))

(assert (=> b!21530 d!3735))

(declare-fun b!21746 () Bool)

(declare-fun lt!6976 () SeekEntryResult!51)

(assert (=> b!21746 (and (bvsge (index!2324 lt!6976) #b00000000000000000000000000000000) (bvslt (index!2324 lt!6976) (size!665 (_keys!3139 lt!6655))))))

(declare-fun res!13890 () Bool)

(assert (=> b!21746 (= res!13890 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2324 lt!6976)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14131 () Bool)

(assert (=> b!21746 (=> (not res!13890) (not e!14131))))

(declare-fun c!2567 () Bool)

(declare-fun call!1478 () Bool)

(declare-fun bm!1475 () Bool)

(assert (=> bm!1475 (= call!1478 (inRange!0 (ite c!2567 (index!2324 lt!6976) (index!2327 lt!6976)) (mask!4691 lt!6655)))))

(declare-fun b!21747 () Bool)

(declare-fun e!14132 () Bool)

(assert (=> b!21747 (= e!14132 e!14131)))

(declare-fun res!13887 () Bool)

(assert (=> b!21747 (= res!13887 call!1478)))

(assert (=> b!21747 (=> (not res!13887) (not e!14131))))

(declare-fun b!21748 () Bool)

(declare-fun res!13888 () Bool)

(declare-fun e!14130 () Bool)

(assert (=> b!21748 (=> (not res!13888) (not e!14130))))

(assert (=> b!21748 (= res!13888 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2327 lt!6976)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21748 (and (bvsge (index!2327 lt!6976) #b00000000000000000000000000000000) (bvslt (index!2327 lt!6976) (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!21749 () Bool)

(declare-fun e!14129 () Bool)

(assert (=> b!21749 (= e!14129 ((_ is Undefined!51) lt!6976))))

(declare-fun b!21750 () Bool)

(assert (=> b!21750 (= e!14132 e!14129)))

(declare-fun c!2568 () Bool)

(assert (=> b!21750 (= c!2568 ((_ is MissingVacant!51) lt!6976))))

(declare-fun bm!1476 () Bool)

(declare-fun call!1479 () Bool)

(assert (=> bm!1476 (= call!1479 (arrayContainsKey!0 (_keys!3139 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!21751 () Bool)

(assert (=> b!21751 (= e!14131 (not call!1479))))

(declare-fun d!3737 () Bool)

(assert (=> d!3737 e!14132))

(assert (=> d!3737 (= c!2567 ((_ is MissingZero!51) lt!6976))))

(assert (=> d!3737 (= lt!6976 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 lt!6655) (mask!4691 lt!6655)))))

(declare-fun lt!6977 () Unit!462)

(assert (=> d!3737 (= lt!6977 (choose!195 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(assert (=> d!3737 (validMask!0 (mask!4691 lt!6655))))

(assert (=> d!3737 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 lt!6655)) lt!6977)))

(declare-fun b!21752 () Bool)

(declare-fun res!13889 () Bool)

(assert (=> b!21752 (=> (not res!13889) (not e!14130))))

(assert (=> b!21752 (= res!13889 call!1478)))

(assert (=> b!21752 (= e!14129 e!14130)))

(declare-fun b!21753 () Bool)

(assert (=> b!21753 (= e!14130 (not call!1479))))

(assert (= (and d!3737 c!2567) b!21747))

(assert (= (and d!3737 (not c!2567)) b!21750))

(assert (= (and b!21747 res!13887) b!21746))

(assert (= (and b!21746 res!13890) b!21751))

(assert (= (and b!21750 c!2568) b!21752))

(assert (= (and b!21750 (not c!2568)) b!21749))

(assert (= (and b!21752 res!13889) b!21748))

(assert (= (and b!21748 res!13888) b!21753))

(assert (= (or b!21747 b!21752) bm!1475))

(assert (= (or b!21751 b!21753) bm!1476))

(declare-fun m!15179 () Bool)

(assert (=> b!21748 m!15179))

(declare-fun m!15181 () Bool)

(assert (=> bm!1475 m!15181))

(assert (=> bm!1476 m!15041))

(declare-fun m!15183 () Bool)

(assert (=> b!21746 m!15183))

(assert (=> d!3737 m!15001))

(declare-fun m!15185 () Bool)

(assert (=> d!3737 m!15185))

(assert (=> d!3737 m!15163))

(assert (=> bm!1439 d!3737))

(declare-fun d!3739 () Bool)

(declare-fun lt!6982 () tuple2!918)

(assert (=> d!3739 (or (bvsle (_2!462 lt!6982) #b00000000000000000000000000001000) (bvsge (bvmul #b00000000000000000000000000001000 (_size!133 (v!1571 (underlying!103 thiss!938)))) (_2!462 lt!6982)) (bvslt (bvadd (bvand (bvashr (_2!462 lt!6982) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!133 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun e!14135 () tuple2!918)

(assert (=> d!3739 (= lt!6982 e!14135)))

(declare-fun c!2571 () Bool)

(declare-fun lt!6983 () (_ BitVec 32))

(assert (=> d!3739 (= c!2571 (and (bvsgt lt!6983 #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!133 (v!1571 (underlying!103 thiss!938)))) lt!6983) (bvsge (bvadd (bvand (bvashr lt!6983 #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!133 (v!1571 (underlying!103 thiss!938))))))))

(assert (=> d!3739 (= lt!6983 (bvlshr (_2!462 lt!6951) #b00000000000000000000000000000001))))

(assert (=> d!3739 (and (bvsgt (_2!462 lt!6951) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!133 (v!1571 (underlying!103 thiss!938)))) (_2!462 lt!6951)) (bvsge (bvadd (bvand (bvashr (_2!462 lt!6951) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!133 (v!1571 (underlying!103 thiss!938)))))))

(assert (=> d!3739 (= (computeNewMaskWhile!11 (_size!133 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (_2!462 lt!6951)) lt!6982)))

(declare-fun b!21758 () Bool)

(assert (=> b!21758 (= e!14135 (computeNewMaskWhile!11 (_size!133 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) lt!6983))))

(declare-fun b!21759 () Bool)

(declare-fun Unit!474 () Unit!462)

(assert (=> b!21759 (= e!14135 (tuple2!919 Unit!474 lt!6983))))

(assert (= (and d!3739 c!2571) b!21758))

(assert (= (and d!3739 (not c!2571)) b!21759))

(declare-fun m!15188 () Bool)

(assert (=> b!21758 m!15188))

(assert (=> b!21687 d!3739))

(declare-fun d!3741 () Bool)

(declare-fun e!14141 () Bool)

(assert (=> d!3741 e!14141))

(declare-fun res!13893 () Bool)

(assert (=> d!3741 (=> res!13893 e!14141)))

(declare-fun lt!6995 () Bool)

(assert (=> d!3741 (= res!13893 (not lt!6995))))

(declare-fun lt!6994 () Bool)

(assert (=> d!3741 (= lt!6995 lt!6994)))

(declare-fun lt!6992 () Unit!462)

(declare-fun e!14140 () Unit!462)

(assert (=> d!3741 (= lt!6992 e!14140)))

(declare-fun c!2574 () Bool)

(assert (=> d!3741 (= c!2574 lt!6994)))

(declare-fun containsKey!24 (List!558 (_ BitVec 64)) Bool)

(assert (=> d!3741 (= lt!6994 (containsKey!24 (toList!294 call!1437) (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!6799))))))

(assert (=> d!3741 (= (contains!224 call!1437 (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!6799))) lt!6995)))

(declare-fun b!21766 () Bool)

(declare-fun lt!6993 () Unit!462)

(assert (=> b!21766 (= e!14140 lt!6993)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!21 (List!558 (_ BitVec 64)) Unit!462)

(assert (=> b!21766 (= lt!6993 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!294 call!1437) (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!6799))))))

(declare-datatypes ((Option!66 0))(
  ( (Some!65 (v!1580 V!1155)) (None!64) )
))
(declare-fun isDefined!22 (Option!66) Bool)

(declare-fun getValueByKey!60 (List!558 (_ BitVec 64)) Option!66)

(assert (=> b!21766 (isDefined!22 (getValueByKey!60 (toList!294 call!1437) (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!6799))))))

(declare-fun b!21767 () Bool)

(declare-fun Unit!475 () Unit!462)

(assert (=> b!21767 (= e!14140 Unit!475)))

(declare-fun b!21768 () Bool)

(assert (=> b!21768 (= e!14141 (isDefined!22 (getValueByKey!60 (toList!294 call!1437) (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!6799)))))))

(assert (= (and d!3741 c!2574) b!21766))

(assert (= (and d!3741 (not c!2574)) b!21767))

(assert (= (and d!3741 (not res!13893)) b!21768))

(assert (=> d!3741 m!15021))

(declare-fun m!15190 () Bool)

(assert (=> d!3741 m!15190))

(assert (=> b!21766 m!15021))

(declare-fun m!15192 () Bool)

(assert (=> b!21766 m!15192))

(assert (=> b!21766 m!15021))

(declare-fun m!15194 () Bool)

(assert (=> b!21766 m!15194))

(assert (=> b!21766 m!15194))

(declare-fun m!15196 () Bool)

(assert (=> b!21766 m!15196))

(assert (=> b!21768 m!15021))

(assert (=> b!21768 m!15194))

(assert (=> b!21768 m!15194))

(assert (=> b!21768 m!15196))

(assert (=> b!21574 d!3741))

(declare-fun d!3743 () Bool)

(declare-fun e!14144 () Bool)

(assert (=> d!3743 e!14144))

(declare-fun res!13896 () Bool)

(assert (=> d!3743 (=> (not res!13896) (not e!14144))))

(assert (=> d!3743 (= res!13896 (and (bvsge (index!2325 lt!6799) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6799) (size!665 (_keys!3139 lt!6655)))))))

(declare-fun lt!6998 () Unit!462)

(declare-fun choose!198 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) Int) Unit!462)

(assert (=> d!3743 (= lt!6998 (choose!198 (_keys!3139 lt!6655) lt!6809 (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (index!2325 lt!6799) (defaultEntry!1718 lt!6655)))))

(assert (=> d!3743 (validMask!0 (mask!4691 lt!6655))))

(assert (=> d!3743 (= (lemmaValidKeyInArrayIsInListMap!7 (_keys!3139 lt!6655) lt!6809 (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (index!2325 lt!6799) (defaultEntry!1718 lt!6655)) lt!6998)))

(declare-fun b!21771 () Bool)

(assert (=> b!21771 (= e!14144 (contains!224 (getCurrentListMap!124 (_keys!3139 lt!6655) lt!6809 (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!6799))))))

(assert (= (and d!3743 res!13896) b!21771))

(declare-fun m!15198 () Bool)

(assert (=> d!3743 m!15198))

(assert (=> d!3743 m!15163))

(declare-fun m!15200 () Bool)

(assert (=> b!21771 m!15200))

(assert (=> b!21771 m!15021))

(assert (=> b!21771 m!15200))

(assert (=> b!21771 m!15021))

(declare-fun m!15202 () Bool)

(assert (=> b!21771 m!15202))

(assert (=> b!21574 d!3743))

(declare-fun d!3745 () Bool)

(declare-fun e!14147 () Bool)

(assert (=> d!3745 e!14147))

(declare-fun res!13899 () Bool)

(assert (=> d!3745 (=> (not res!13899) (not e!14147))))

(assert (=> d!3745 (= res!13899 (and (bvsge (index!2325 lt!6799) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6799) (size!666 (_values!1707 lt!6655)))))))

(declare-fun lt!7001 () Unit!462)

(declare-fun choose!199 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) (_ BitVec 64) V!1155 Int) Unit!462)

(assert (=> d!3745 (= lt!7001 (choose!199 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (index!2325 lt!6799) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 lt!6655)))))

(assert (=> d!3745 (validMask!0 (mask!4691 lt!6655))))

(assert (=> d!3745 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (index!2325 lt!6799) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 lt!6655)) lt!7001)))

(declare-fun b!21774 () Bool)

(assert (=> b!21774 (= e!14147 (= (+!41 (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (getCurrentListMap!124 (_keys!3139 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655))) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655))))))

(assert (= (and d!3745 res!13899) b!21774))

(declare-fun m!15204 () Bool)

(assert (=> d!3745 m!15204))

(assert (=> d!3745 m!15163))

(assert (=> b!21774 m!15007))

(assert (=> b!21774 m!15007))

(declare-fun m!15206 () Bool)

(assert (=> b!21774 m!15206))

(assert (=> b!21774 m!15013))

(declare-fun m!15208 () Bool)

(assert (=> b!21774 m!15208))

(assert (=> b!21574 d!3745))

(declare-fun d!3747 () Bool)

(assert (=> d!3747 (= (map!397 (ite c!2450 (_2!459 lt!6654) lt!6655)) (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun bs!911 () Bool)

(assert (= bs!911 d!3747))

(assert (=> bs!911 m!14945))

(assert (=> bm!1400 d!3747))

(declare-fun d!3749 () Bool)

(declare-fun e!14148 () Bool)

(assert (=> d!3749 e!14148))

(declare-fun res!13901 () Bool)

(assert (=> d!3749 (=> (not res!13901) (not e!14148))))

(declare-fun lt!7002 () SeekEntryResult!51)

(assert (=> d!3749 (= res!13901 ((_ is Found!51) lt!7002))))

(assert (=> d!3749 (= lt!7002 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 lt!6655) (mask!4691 lt!6655)))))

(declare-fun lt!7003 () Unit!462)

(assert (=> d!3749 (= lt!7003 (choose!196 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(assert (=> d!3749 (validMask!0 (mask!4691 lt!6655))))

(assert (=> d!3749 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 lt!6655)) lt!7003)))

(declare-fun b!21775 () Bool)

(declare-fun res!13900 () Bool)

(assert (=> b!21775 (=> (not res!13900) (not e!14148))))

(assert (=> b!21775 (= res!13900 (inRange!0 (index!2325 lt!7002) (mask!4691 lt!6655)))))

(declare-fun b!21776 () Bool)

(assert (=> b!21776 (= e!14148 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!7002)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21776 (and (bvsge (index!2325 lt!7002) #b00000000000000000000000000000000) (bvslt (index!2325 lt!7002) (size!665 (_keys!3139 lt!6655))))))

(assert (= (and d!3749 res!13901) b!21775))

(assert (= (and b!21775 res!13900) b!21776))

(assert (=> d!3749 m!15001))

(declare-fun m!15210 () Bool)

(assert (=> d!3749 m!15210))

(assert (=> d!3749 m!15163))

(declare-fun m!15212 () Bool)

(assert (=> b!21775 m!15212))

(declare-fun m!15214 () Bool)

(assert (=> b!21776 m!15214))

(assert (=> bm!1437 d!3749))

(declare-fun d!3751 () Bool)

(declare-fun e!14150 () Bool)

(assert (=> d!3751 e!14150))

(declare-fun res!13902 () Bool)

(assert (=> d!3751 (=> res!13902 e!14150)))

(declare-fun lt!7007 () Bool)

(assert (=> d!3751 (= res!13902 (not lt!7007))))

(declare-fun lt!7006 () Bool)

(assert (=> d!3751 (= lt!7007 lt!7006)))

(declare-fun lt!7004 () Unit!462)

(declare-fun e!14149 () Unit!462)

(assert (=> d!3751 (= lt!7004 e!14149)))

(declare-fun c!2575 () Bool)

(assert (=> d!3751 (= c!2575 lt!7006)))

(assert (=> d!3751 (= lt!7006 (containsKey!24 (toList!294 call!1413) (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772))))))

(assert (=> d!3751 (= (contains!224 call!1413 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772))) lt!7007)))

(declare-fun b!21777 () Bool)

(declare-fun lt!7005 () Unit!462)

(assert (=> b!21777 (= e!14149 lt!7005)))

(assert (=> b!21777 (= lt!7005 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!294 call!1413) (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772))))))

(assert (=> b!21777 (isDefined!22 (getValueByKey!60 (toList!294 call!1413) (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772))))))

(declare-fun b!21778 () Bool)

(declare-fun Unit!476 () Unit!462)

(assert (=> b!21778 (= e!14149 Unit!476)))

(declare-fun b!21779 () Bool)

(assert (=> b!21779 (= e!14150 (isDefined!22 (getValueByKey!60 (toList!294 call!1413) (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772)))))))

(assert (= (and d!3751 c!2575) b!21777))

(assert (= (and d!3751 (not c!2575)) b!21778))

(assert (= (and d!3751 (not res!13902)) b!21779))

(assert (=> d!3751 m!14959))

(declare-fun m!15216 () Bool)

(assert (=> d!3751 m!15216))

(assert (=> b!21777 m!14959))

(declare-fun m!15218 () Bool)

(assert (=> b!21777 m!15218))

(assert (=> b!21777 m!14959))

(declare-fun m!15220 () Bool)

(assert (=> b!21777 m!15220))

(assert (=> b!21777 m!15220))

(declare-fun m!15222 () Bool)

(assert (=> b!21777 m!15222))

(assert (=> b!21779 m!14959))

(assert (=> b!21779 m!15220))

(assert (=> b!21779 m!15220))

(assert (=> b!21779 m!15222))

(assert (=> b!21532 d!3751))

(declare-fun d!3753 () Bool)

(declare-fun e!14151 () Bool)

(assert (=> d!3753 e!14151))

(declare-fun res!13903 () Bool)

(assert (=> d!3753 (=> (not res!13903) (not e!14151))))

(assert (=> d!3753 (= res!13903 (and (bvsge (index!2325 lt!6772) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6772) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))))))))

(declare-fun lt!7008 () Unit!462)

(assert (=> d!3753 (= lt!7008 (choose!198 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (index!2325 lt!6772) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> d!3753 (validMask!0 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3753 (= (lemmaValidKeyInArrayIsInListMap!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (index!2325 lt!6772) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7008)))

(declare-fun b!21780 () Bool)

(assert (=> b!21780 (= e!14151 (contains!224 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772))))))

(assert (= (and d!3753 res!13903) b!21780))

(declare-fun m!15224 () Bool)

(assert (=> d!3753 m!15224))

(assert (=> d!3753 m!15147))

(declare-fun m!15226 () Bool)

(assert (=> b!21780 m!15226))

(assert (=> b!21780 m!14959))

(assert (=> b!21780 m!15226))

(assert (=> b!21780 m!14959))

(declare-fun m!15228 () Bool)

(assert (=> b!21780 m!15228))

(assert (=> b!21532 d!3753))

(declare-fun d!3755 () Bool)

(declare-fun e!14152 () Bool)

(assert (=> d!3755 e!14152))

(declare-fun res!13904 () Bool)

(assert (=> d!3755 (=> (not res!13904) (not e!14152))))

(assert (=> d!3755 (= res!13904 (and (bvsge (index!2325 lt!6772) #b00000000000000000000000000000000) (bvslt (index!2325 lt!6772) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))))))))

(declare-fun lt!7009 () Unit!462)

(assert (=> d!3755 (= lt!7009 (choose!199 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (index!2325 lt!6772) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> d!3755 (validMask!0 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3755 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (index!2325 lt!6772) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7009)))

(declare-fun b!21781 () Bool)

(assert (=> b!21781 (= e!14152 (= (+!41 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(assert (= (and d!3755 res!13904) b!21781))

(declare-fun m!15230 () Bool)

(assert (=> d!3755 m!15230))

(assert (=> d!3755 m!15147))

(assert (=> b!21781 m!14945))

(assert (=> b!21781 m!14945))

(declare-fun m!15232 () Bool)

(assert (=> b!21781 m!15232))

(assert (=> b!21781 m!14951))

(declare-fun m!15234 () Bool)

(assert (=> b!21781 m!15234))

(assert (=> b!21532 d!3755))

(declare-fun d!3757 () Bool)

(assert (=> d!3757 (= (+!41 (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) lt!6792 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7010 () Unit!462)

(assert (=> d!3757 (= lt!7010 (choose!197 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) lt!6792 (zeroValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 lt!6655) (defaultEntry!1718 lt!6655)))))

(assert (=> d!3757 (validMask!0 (mask!4691 lt!6655))))

(assert (=> d!3757 (= (lemmaChangeZeroKeyThenAddPairToListMap!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) lt!6792 (zeroValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 lt!6655) (defaultEntry!1718 lt!6655)) lt!7010)))

(declare-fun bs!912 () Bool)

(assert (= bs!912 d!3757))

(declare-fun m!15236 () Bool)

(assert (=> bs!912 m!15236))

(assert (=> bs!912 m!15007))

(assert (=> bs!912 m!15206))

(assert (=> bs!912 m!15007))

(assert (=> bs!912 m!15163))

(declare-fun m!15238 () Bool)

(assert (=> bs!912 m!15238))

(assert (=> b!21572 d!3757))

(declare-fun d!3759 () Bool)

(assert (=> d!3759 (= (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (and (not (= (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21656 d!3759))

(declare-fun b!21790 () Bool)

(declare-fun e!14160 () Bool)

(declare-fun call!1482 () Bool)

(assert (=> b!21790 (= e!14160 call!1482)))

(declare-fun d!3761 () Bool)

(declare-fun res!13909 () Bool)

(declare-fun e!14159 () Bool)

(assert (=> d!3761 (=> res!13909 e!14159)))

(assert (=> d!3761 (= res!13909 (bvsge #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))))))

(assert (=> d!3761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660)))) e!14159)))

(declare-fun b!21791 () Bool)

(declare-fun e!14161 () Bool)

(assert (=> b!21791 (= e!14159 e!14161)))

(declare-fun c!2578 () Bool)

(assert (=> b!21791 (= c!2578 (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000)))))

(declare-fun b!21792 () Bool)

(assert (=> b!21792 (= e!14161 call!1482)))

(declare-fun b!21793 () Bool)

(assert (=> b!21793 (= e!14161 e!14160)))

(declare-fun lt!7018 () (_ BitVec 64))

(assert (=> b!21793 (= lt!7018 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000))))

(declare-fun lt!7019 () Unit!462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1207 (_ BitVec 64) (_ BitVec 32)) Unit!462)

(assert (=> b!21793 (= lt!7019 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3139 (v!1571 (_2!457 lt!6660))) lt!7018 #b00000000000000000000000000000000))))

(assert (=> b!21793 (arrayContainsKey!0 (_keys!3139 (v!1571 (_2!457 lt!6660))) lt!7018 #b00000000000000000000000000000000)))

(declare-fun lt!7017 () Unit!462)

(assert (=> b!21793 (= lt!7017 lt!7019)))

(declare-fun res!13910 () Bool)

(assert (=> b!21793 (= res!13910 (= (seekEntryOrOpen!0 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000) (_keys!3139 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660)))) (Found!51 #b00000000000000000000000000000000)))))

(assert (=> b!21793 (=> (not res!13910) (not e!14160))))

(declare-fun bm!1479 () Bool)

(assert (=> bm!1479 (= call!1482 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3139 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660)))))))

(assert (= (and d!3761 (not res!13909)) b!21791))

(assert (= (and b!21791 c!2578) b!21793))

(assert (= (and b!21791 (not c!2578)) b!21792))

(assert (= (and b!21793 res!13910) b!21790))

(assert (= (or b!21790 b!21792) bm!1479))

(declare-fun m!15240 () Bool)

(assert (=> b!21791 m!15240))

(assert (=> b!21791 m!15240))

(declare-fun m!15242 () Bool)

(assert (=> b!21791 m!15242))

(assert (=> b!21793 m!15240))

(declare-fun m!15244 () Bool)

(assert (=> b!21793 m!15244))

(declare-fun m!15246 () Bool)

(assert (=> b!21793 m!15246))

(assert (=> b!21793 m!15240))

(declare-fun m!15248 () Bool)

(assert (=> b!21793 m!15248))

(declare-fun m!15250 () Bool)

(assert (=> bm!1479 m!15250))

(assert (=> b!21428 d!3761))

(declare-fun e!14162 () Bool)

(declare-fun b!21794 () Bool)

(assert (=> b!21794 (= e!14162 (validKeyInArray!0 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun b!21795 () Bool)

(declare-fun e!14166 () Unit!462)

(declare-fun lt!7021 () Unit!462)

(assert (=> b!21795 (= e!14166 lt!7021)))

(declare-fun lt!7025 () ListLongMap!557)

(assert (=> b!21795 (= lt!7025 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7023 () (_ BitVec 64))

(assert (=> b!21795 (= lt!7023 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7030 () (_ BitVec 64))

(assert (=> b!21795 (= lt!7030 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7038 () Unit!462)

(assert (=> b!21795 (= lt!7038 (addStillContains!13 lt!7025 lt!7023 (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7030))))

(assert (=> b!21795 (contains!224 (+!41 lt!7025 (tuple2!911 lt!7023 (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))) lt!7030)))

(declare-fun lt!7039 () Unit!462)

(assert (=> b!21795 (= lt!7039 lt!7038)))

(declare-fun lt!7020 () ListLongMap!557)

(assert (=> b!21795 (= lt!7020 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7027 () (_ BitVec 64))

(assert (=> b!21795 (= lt!7027 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7033 () (_ BitVec 64))

(assert (=> b!21795 (= lt!7033 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7026 () Unit!462)

(assert (=> b!21795 (= lt!7026 (addApplyDifferent!13 lt!7020 lt!7027 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!7033))))

(assert (=> b!21795 (= (apply!28 (+!41 lt!7020 (tuple2!911 lt!7027 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))) lt!7033) (apply!28 lt!7020 lt!7033))))

(declare-fun lt!7022 () Unit!462)

(assert (=> b!21795 (= lt!7022 lt!7026)))

(declare-fun lt!7031 () ListLongMap!557)

(assert (=> b!21795 (= lt!7031 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7035 () (_ BitVec 64))

(assert (=> b!21795 (= lt!7035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7029 () (_ BitVec 64))

(assert (=> b!21795 (= lt!7029 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7032 () Unit!462)

(assert (=> b!21795 (= lt!7032 (addApplyDifferent!13 lt!7031 lt!7035 (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7029))))

(assert (=> b!21795 (= (apply!28 (+!41 lt!7031 (tuple2!911 lt!7035 (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))) lt!7029) (apply!28 lt!7031 lt!7029))))

(declare-fun lt!7041 () Unit!462)

(assert (=> b!21795 (= lt!7041 lt!7032)))

(declare-fun lt!7034 () ListLongMap!557)

(assert (=> b!21795 (= lt!7034 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7024 () (_ BitVec 64))

(assert (=> b!21795 (= lt!7024 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7028 () (_ BitVec 64))

(assert (=> b!21795 (= lt!7028 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(assert (=> b!21795 (= lt!7021 (addApplyDifferent!13 lt!7034 lt!7024 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!7028))))

(assert (=> b!21795 (= (apply!28 (+!41 lt!7034 (tuple2!911 lt!7024 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))) lt!7028) (apply!28 lt!7034 lt!7028))))

(declare-fun bm!1480 () Bool)

(declare-fun call!1484 () Bool)

(declare-fun lt!7037 () ListLongMap!557)

(assert (=> bm!1480 (= call!1484 (contains!224 lt!7037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21796 () Bool)

(declare-fun e!14171 () ListLongMap!557)

(declare-fun call!1487 () ListLongMap!557)

(assert (=> b!21796 (= e!14171 (+!41 call!1487 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21797 () Bool)

(declare-fun e!14167 () ListLongMap!557)

(declare-fun call!1488 () ListLongMap!557)

(assert (=> b!21797 (= e!14167 call!1488)))

(declare-fun b!21798 () Bool)

(declare-fun e!14174 () Bool)

(declare-fun e!14168 () Bool)

(assert (=> b!21798 (= e!14174 e!14168)))

(declare-fun res!13917 () Bool)

(assert (=> b!21798 (=> (not res!13917) (not e!14168))))

(assert (=> b!21798 (= res!13917 (contains!224 lt!7037 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)))))

(assert (=> b!21798 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21799 () Bool)

(declare-fun e!14170 () ListLongMap!557)

(assert (=> b!21799 (= e!14170 call!1488)))

(declare-fun b!21800 () Bool)

(assert (=> b!21800 (= e!14168 (= (apply!28 lt!7037 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)) (get!377 (select (arr!573 (ite c!2504 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)))))) #b00000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21800 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (ite c!2504 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))))))))))

(assert (=> b!21800 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21801 () Bool)

(declare-fun e!14165 () Bool)

(assert (=> b!21801 (= e!14165 (not call!1484))))

(declare-fun d!3763 () Bool)

(declare-fun e!14169 () Bool)

(assert (=> d!3763 e!14169))

(declare-fun res!13911 () Bool)

(assert (=> d!3763 (=> (not res!13911) (not e!14169))))

(assert (=> d!3763 (= res!13911 (or (bvsge #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))))

(declare-fun lt!7040 () ListLongMap!557)

(assert (=> d!3763 (= lt!7037 lt!7040)))

(declare-fun lt!7036 () Unit!462)

(assert (=> d!3763 (= lt!7036 e!14166)))

(declare-fun c!2579 () Bool)

(assert (=> d!3763 (= c!2579 e!14162)))

(declare-fun res!13913 () Bool)

(assert (=> d!3763 (=> (not res!13913) (not e!14162))))

(assert (=> d!3763 (= res!13913 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(assert (=> d!3763 (= lt!7040 e!14171)))

(declare-fun c!2582 () Bool)

(assert (=> d!3763 (= c!2582 (and (not (= (bvand (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3763 (validMask!0 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3763 (= (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7037)))

(declare-fun b!21802 () Bool)

(declare-fun e!14164 () Bool)

(declare-fun call!1489 () Bool)

(assert (=> b!21802 (= e!14164 (not call!1489))))

(declare-fun e!14163 () Bool)

(declare-fun b!21803 () Bool)

(assert (=> b!21803 (= e!14163 (= (apply!28 lt!7037 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21804 () Bool)

(assert (=> b!21804 (= e!14169 e!14164)))

(declare-fun c!2581 () Bool)

(assert (=> b!21804 (= c!2581 (not (= (bvand (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21805 () Bool)

(declare-fun c!2583 () Bool)

(assert (=> b!21805 (= c!2583 (and (not (= (bvand (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21805 (= e!14167 e!14170)))

(declare-fun call!1483 () ListLongMap!557)

(declare-fun bm!1481 () Bool)

(assert (=> bm!1481 (= call!1483 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!6772) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun bm!1482 () Bool)

(declare-fun call!1486 () ListLongMap!557)

(assert (=> bm!1482 (= call!1486 call!1483)))

(declare-fun c!2580 () Bool)

(declare-fun bm!1483 () Bool)

(declare-fun call!1485 () ListLongMap!557)

(assert (=> bm!1483 (= call!1487 (+!41 (ite c!2582 call!1483 (ite c!2580 call!1486 call!1485)) (ite (or c!2582 c!2580) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!2504 c!2502) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))))))

(declare-fun b!21806 () Bool)

(declare-fun res!13918 () Bool)

(assert (=> b!21806 (=> (not res!13918) (not e!14169))))

(assert (=> b!21806 (= res!13918 e!14174)))

(declare-fun res!13914 () Bool)

(assert (=> b!21806 (=> res!13914 e!14174)))

(declare-fun e!14172 () Bool)

(assert (=> b!21806 (= res!13914 (not e!14172))))

(declare-fun res!13912 () Bool)

(assert (=> b!21806 (=> (not res!13912) (not e!14172))))

(assert (=> b!21806 (= res!13912 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21807 () Bool)

(assert (=> b!21807 (= e!14171 e!14167)))

(assert (=> b!21807 (= c!2580 (and (not (= (bvand (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21808 () Bool)

(declare-fun e!14173 () Bool)

(assert (=> b!21808 (= e!14164 e!14173)))

(declare-fun res!13915 () Bool)

(assert (=> b!21808 (= res!13915 call!1489)))

(assert (=> b!21808 (=> (not res!13915) (not e!14173))))

(declare-fun b!21809 () Bool)

(assert (=> b!21809 (= e!14170 call!1485)))

(declare-fun b!21810 () Bool)

(assert (=> b!21810 (= e!14172 (validKeyInArray!0 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun bm!1484 () Bool)

(assert (=> bm!1484 (= call!1485 call!1486)))

(declare-fun b!21811 () Bool)

(declare-fun Unit!477 () Unit!462)

(assert (=> b!21811 (= e!14166 Unit!477)))

(declare-fun b!21812 () Bool)

(assert (=> b!21812 (= e!14165 e!14163)))

(declare-fun res!13916 () Bool)

(assert (=> b!21812 (= res!13916 call!1484)))

(assert (=> b!21812 (=> (not res!13916) (not e!14163))))

(declare-fun b!21813 () Bool)

(declare-fun res!13919 () Bool)

(assert (=> b!21813 (=> (not res!13919) (not e!14169))))

(assert (=> b!21813 (= res!13919 e!14165)))

(declare-fun c!2584 () Bool)

(assert (=> b!21813 (= c!2584 (not (= (bvand (ite (and c!2504 c!2502) lt!6765 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21814 () Bool)

(assert (=> b!21814 (= e!14173 (= (apply!28 lt!7037 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun bm!1485 () Bool)

(assert (=> bm!1485 (= call!1488 call!1487)))

(declare-fun bm!1486 () Bool)

(assert (=> bm!1486 (= call!1489 (contains!224 lt!7037 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3763 c!2582) b!21796))

(assert (= (and d!3763 (not c!2582)) b!21807))

(assert (= (and b!21807 c!2580) b!21797))

(assert (= (and b!21807 (not c!2580)) b!21805))

(assert (= (and b!21805 c!2583) b!21799))

(assert (= (and b!21805 (not c!2583)) b!21809))

(assert (= (or b!21799 b!21809) bm!1484))

(assert (= (or b!21797 bm!1484) bm!1482))

(assert (= (or b!21797 b!21799) bm!1485))

(assert (= (or b!21796 bm!1482) bm!1481))

(assert (= (or b!21796 bm!1485) bm!1483))

(assert (= (and d!3763 res!13913) b!21794))

(assert (= (and d!3763 c!2579) b!21795))

(assert (= (and d!3763 (not c!2579)) b!21811))

(assert (= (and d!3763 res!13911) b!21806))

(assert (= (and b!21806 res!13912) b!21810))

(assert (= (and b!21806 (not res!13914)) b!21798))

(assert (= (and b!21798 res!13917) b!21800))

(assert (= (and b!21806 res!13918) b!21813))

(assert (= (and b!21813 c!2584) b!21812))

(assert (= (and b!21813 (not c!2584)) b!21801))

(assert (= (and b!21812 res!13916) b!21803))

(assert (= (or b!21812 b!21801) bm!1480))

(assert (= (and b!21813 res!13919) b!21804))

(assert (= (and b!21804 c!2581) b!21808))

(assert (= (and b!21804 (not c!2581)) b!21802))

(assert (= (and b!21808 res!13915) b!21814))

(assert (= (or b!21808 b!21802) bm!1486))

(declare-fun b_lambda!1521 () Bool)

(assert (=> (not b_lambda!1521) (not b!21800)))

(declare-fun t!3214 () Bool)

(declare-fun tb!641 () Bool)

(assert (=> (and b!21300 (= (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) t!3214) tb!641))

(declare-fun result!1069 () Bool)

(assert (=> tb!641 (= result!1069 tp_is_empty!997)))

(assert (=> b!21800 t!3214))

(declare-fun b_and!1427 () Bool)

(assert (= b_and!1425 (and (=> t!3214 result!1069) b_and!1427)))

(declare-fun m!15252 () Bool)

(assert (=> bm!1483 m!15252))

(declare-fun m!15254 () Bool)

(assert (=> b!21794 m!15254))

(assert (=> b!21794 m!15254))

(declare-fun m!15256 () Bool)

(assert (=> b!21794 m!15256))

(declare-fun m!15258 () Bool)

(assert (=> b!21814 m!15258))

(assert (=> b!21800 m!15254))

(declare-fun m!15260 () Bool)

(assert (=> b!21800 m!15260))

(declare-fun m!15262 () Bool)

(assert (=> b!21800 m!15262))

(declare-fun m!15264 () Bool)

(assert (=> b!21800 m!15264))

(assert (=> b!21800 m!15260))

(assert (=> b!21800 m!15254))

(declare-fun m!15266 () Bool)

(assert (=> b!21800 m!15266))

(assert (=> b!21800 m!15262))

(assert (=> d!3763 m!15147))

(assert (=> b!21810 m!15254))

(assert (=> b!21810 m!15254))

(assert (=> b!21810 m!15256))

(declare-fun m!15268 () Bool)

(assert (=> bm!1486 m!15268))

(declare-fun m!15270 () Bool)

(assert (=> b!21796 m!15270))

(declare-fun m!15272 () Bool)

(assert (=> bm!1481 m!15272))

(declare-fun m!15274 () Bool)

(assert (=> b!21803 m!15274))

(declare-fun m!15276 () Bool)

(assert (=> bm!1480 m!15276))

(assert (=> b!21798 m!15254))

(assert (=> b!21798 m!15254))

(declare-fun m!15278 () Bool)

(assert (=> b!21798 m!15278))

(declare-fun m!15280 () Bool)

(assert (=> b!21795 m!15280))

(declare-fun m!15282 () Bool)

(assert (=> b!21795 m!15282))

(assert (=> b!21795 m!15254))

(assert (=> b!21795 m!15282))

(declare-fun m!15284 () Bool)

(assert (=> b!21795 m!15284))

(declare-fun m!15286 () Bool)

(assert (=> b!21795 m!15286))

(declare-fun m!15288 () Bool)

(assert (=> b!21795 m!15288))

(declare-fun m!15290 () Bool)

(assert (=> b!21795 m!15290))

(declare-fun m!15292 () Bool)

(assert (=> b!21795 m!15292))

(declare-fun m!15294 () Bool)

(assert (=> b!21795 m!15294))

(declare-fun m!15296 () Bool)

(assert (=> b!21795 m!15296))

(assert (=> b!21795 m!15286))

(declare-fun m!15298 () Bool)

(assert (=> b!21795 m!15298))

(declare-fun m!15300 () Bool)

(assert (=> b!21795 m!15300))

(assert (=> b!21795 m!15272))

(declare-fun m!15302 () Bool)

(assert (=> b!21795 m!15302))

(declare-fun m!15304 () Bool)

(assert (=> b!21795 m!15304))

(assert (=> b!21795 m!15294))

(declare-fun m!15306 () Bool)

(assert (=> b!21795 m!15306))

(assert (=> b!21795 m!15300))

(declare-fun m!15308 () Bool)

(assert (=> b!21795 m!15308))

(assert (=> bm!1404 d!3763))

(declare-fun d!3765 () Bool)

(assert (=> d!3765 (= (map!397 (_2!459 lt!6789)) (getCurrentListMap!124 (_keys!3139 (_2!459 lt!6789)) (_values!1707 (_2!459 lt!6789)) (mask!4691 (_2!459 lt!6789)) (extraKeys!1621 (_2!459 lt!6789)) (zeroValue!1645 (_2!459 lt!6789)) (minValue!1645 (_2!459 lt!6789)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!459 lt!6789))))))

(declare-fun bs!913 () Bool)

(assert (= bs!913 d!3765))

(declare-fun m!15310 () Bool)

(assert (=> bs!913 m!15310))

(assert (=> bm!1426 d!3765))

(declare-fun b!21815 () Bool)

(declare-fun e!14175 () Bool)

(assert (=> b!21815 (= e!14175 (validKeyInArray!0 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)))))

(declare-fun b!21816 () Bool)

(declare-fun e!14179 () Unit!462)

(declare-fun lt!7043 () Unit!462)

(assert (=> b!21816 (= e!14179 lt!7043)))

(declare-fun lt!7047 () ListLongMap!557)

(assert (=> b!21816 (= lt!7047 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7045 () (_ BitVec 64))

(assert (=> b!21816 (= lt!7045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7052 () (_ BitVec 64))

(assert (=> b!21816 (= lt!7052 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(declare-fun lt!7060 () Unit!462)

(assert (=> b!21816 (= lt!7060 (addStillContains!13 lt!7047 lt!7045 (zeroValue!1645 lt!6655) lt!7052))))

(assert (=> b!21816 (contains!224 (+!41 lt!7047 (tuple2!911 lt!7045 (zeroValue!1645 lt!6655))) lt!7052)))

(declare-fun lt!7061 () Unit!462)

(assert (=> b!21816 (= lt!7061 lt!7060)))

(declare-fun lt!7042 () ListLongMap!557)

(assert (=> b!21816 (= lt!7042 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7049 () (_ BitVec 64))

(assert (=> b!21816 (= lt!7049 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7055 () (_ BitVec 64))

(assert (=> b!21816 (= lt!7055 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(declare-fun lt!7048 () Unit!462)

(assert (=> b!21816 (= lt!7048 (addApplyDifferent!13 lt!7042 lt!7049 (minValue!1645 lt!6655) lt!7055))))

(assert (=> b!21816 (= (apply!28 (+!41 lt!7042 (tuple2!911 lt!7049 (minValue!1645 lt!6655))) lt!7055) (apply!28 lt!7042 lt!7055))))

(declare-fun lt!7044 () Unit!462)

(assert (=> b!21816 (= lt!7044 lt!7048)))

(declare-fun lt!7053 () ListLongMap!557)

(assert (=> b!21816 (= lt!7053 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7057 () (_ BitVec 64))

(assert (=> b!21816 (= lt!7057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7051 () (_ BitVec 64))

(assert (=> b!21816 (= lt!7051 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(declare-fun lt!7054 () Unit!462)

(assert (=> b!21816 (= lt!7054 (addApplyDifferent!13 lt!7053 lt!7057 (zeroValue!1645 lt!6655) lt!7051))))

(assert (=> b!21816 (= (apply!28 (+!41 lt!7053 (tuple2!911 lt!7057 (zeroValue!1645 lt!6655))) lt!7051) (apply!28 lt!7053 lt!7051))))

(declare-fun lt!7063 () Unit!462)

(assert (=> b!21816 (= lt!7063 lt!7054)))

(declare-fun lt!7056 () ListLongMap!557)

(assert (=> b!21816 (= lt!7056 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7046 () (_ BitVec 64))

(assert (=> b!21816 (= lt!7046 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7050 () (_ BitVec 64))

(assert (=> b!21816 (= lt!7050 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(assert (=> b!21816 (= lt!7043 (addApplyDifferent!13 lt!7056 lt!7046 (minValue!1645 lt!6655) lt!7050))))

(assert (=> b!21816 (= (apply!28 (+!41 lt!7056 (tuple2!911 lt!7046 (minValue!1645 lt!6655))) lt!7050) (apply!28 lt!7056 lt!7050))))

(declare-fun bm!1487 () Bool)

(declare-fun call!1491 () Bool)

(declare-fun lt!7059 () ListLongMap!557)

(assert (=> bm!1487 (= call!1491 (contains!224 lt!7059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21817 () Bool)

(declare-fun e!14184 () ListLongMap!557)

(declare-fun call!1494 () ListLongMap!557)

(assert (=> b!21817 (= e!14184 (+!41 call!1494 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 lt!6655))))))

(declare-fun b!21818 () Bool)

(declare-fun e!14180 () ListLongMap!557)

(declare-fun call!1495 () ListLongMap!557)

(assert (=> b!21818 (= e!14180 call!1495)))

(declare-fun b!21819 () Bool)

(declare-fun e!14187 () Bool)

(declare-fun e!14181 () Bool)

(assert (=> b!21819 (= e!14187 e!14181)))

(declare-fun res!13926 () Bool)

(assert (=> b!21819 (=> (not res!13926) (not e!14181))))

(assert (=> b!21819 (= res!13926 (contains!224 lt!7059 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)))))

(assert (=> b!21819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!21820 () Bool)

(declare-fun e!14183 () ListLongMap!557)

(assert (=> b!21820 (= e!14183 call!1495)))

(declare-fun b!21821 () Bool)

(assert (=> b!21821 (= e!14181 (= (apply!28 lt!7059 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)) (get!377 (select (arr!573 (_values!1707 lt!6655)) #b00000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_values!1707 lt!6655))))))

(assert (=> b!21821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!21822 () Bool)

(declare-fun e!14178 () Bool)

(assert (=> b!21822 (= e!14178 (not call!1491))))

(declare-fun d!3767 () Bool)

(declare-fun e!14182 () Bool)

(assert (=> d!3767 e!14182))

(declare-fun res!13920 () Bool)

(assert (=> d!3767 (=> (not res!13920) (not e!14182))))

(assert (=> d!3767 (= res!13920 (or (bvsge #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))))

(declare-fun lt!7062 () ListLongMap!557)

(assert (=> d!3767 (= lt!7059 lt!7062)))

(declare-fun lt!7058 () Unit!462)

(assert (=> d!3767 (= lt!7058 e!14179)))

(declare-fun c!2585 () Bool)

(assert (=> d!3767 (= c!2585 e!14175)))

(declare-fun res!13922 () Bool)

(assert (=> d!3767 (=> (not res!13922) (not e!14175))))

(assert (=> d!3767 (= res!13922 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(assert (=> d!3767 (= lt!7062 e!14184)))

(declare-fun c!2588 () Bool)

(assert (=> d!3767 (= c!2588 (and (not (= (bvand (extraKeys!1621 lt!6655) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1621 lt!6655) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3767 (validMask!0 (mask!4691 lt!6655))))

(assert (=> d!3767 (= (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) lt!7059)))

(declare-fun b!21823 () Bool)

(declare-fun e!14177 () Bool)

(declare-fun call!1496 () Bool)

(assert (=> b!21823 (= e!14177 (not call!1496))))

(declare-fun b!21824 () Bool)

(declare-fun e!14176 () Bool)

(assert (=> b!21824 (= e!14176 (= (apply!28 lt!7059 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 lt!6655)))))

(declare-fun b!21825 () Bool)

(assert (=> b!21825 (= e!14182 e!14177)))

(declare-fun c!2587 () Bool)

(assert (=> b!21825 (= c!2587 (not (= (bvand (extraKeys!1621 lt!6655) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21826 () Bool)

(declare-fun c!2589 () Bool)

(assert (=> b!21826 (= c!2589 (and (not (= (bvand (extraKeys!1621 lt!6655) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 lt!6655) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21826 (= e!14180 e!14183)))

(declare-fun bm!1488 () Bool)

(declare-fun call!1490 () ListLongMap!557)

(assert (=> bm!1488 (= call!1490 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun bm!1489 () Bool)

(declare-fun call!1493 () ListLongMap!557)

(assert (=> bm!1489 (= call!1493 call!1490)))

(declare-fun c!2586 () Bool)

(declare-fun call!1492 () ListLongMap!557)

(declare-fun bm!1490 () Bool)

(assert (=> bm!1490 (= call!1494 (+!41 (ite c!2588 call!1490 (ite c!2586 call!1493 call!1492)) (ite (or c!2588 c!2586) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 lt!6655)) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 lt!6655)))))))

(declare-fun b!21827 () Bool)

(declare-fun res!13927 () Bool)

(assert (=> b!21827 (=> (not res!13927) (not e!14182))))

(assert (=> b!21827 (= res!13927 e!14187)))

(declare-fun res!13923 () Bool)

(assert (=> b!21827 (=> res!13923 e!14187)))

(declare-fun e!14185 () Bool)

(assert (=> b!21827 (= res!13923 (not e!14185))))

(declare-fun res!13921 () Bool)

(assert (=> b!21827 (=> (not res!13921) (not e!14185))))

(assert (=> b!21827 (= res!13921 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!21828 () Bool)

(assert (=> b!21828 (= e!14184 e!14180)))

(assert (=> b!21828 (= c!2586 (and (not (= (bvand (extraKeys!1621 lt!6655) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 lt!6655) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21829 () Bool)

(declare-fun e!14186 () Bool)

(assert (=> b!21829 (= e!14177 e!14186)))

(declare-fun res!13924 () Bool)

(assert (=> b!21829 (= res!13924 call!1496)))

(assert (=> b!21829 (=> (not res!13924) (not e!14186))))

(declare-fun b!21830 () Bool)

(assert (=> b!21830 (= e!14183 call!1492)))

(declare-fun b!21831 () Bool)

(assert (=> b!21831 (= e!14185 (validKeyInArray!0 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)))))

(declare-fun bm!1491 () Bool)

(assert (=> bm!1491 (= call!1492 call!1493)))

(declare-fun b!21832 () Bool)

(declare-fun Unit!478 () Unit!462)

(assert (=> b!21832 (= e!14179 Unit!478)))

(declare-fun b!21833 () Bool)

(assert (=> b!21833 (= e!14178 e!14176)))

(declare-fun res!13925 () Bool)

(assert (=> b!21833 (= res!13925 call!1491)))

(assert (=> b!21833 (=> (not res!13925) (not e!14176))))

(declare-fun b!21834 () Bool)

(declare-fun res!13928 () Bool)

(assert (=> b!21834 (=> (not res!13928) (not e!14182))))

(assert (=> b!21834 (= res!13928 e!14178)))

(declare-fun c!2590 () Bool)

(assert (=> b!21834 (= c!2590 (not (= (bvand (extraKeys!1621 lt!6655) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21835 () Bool)

(assert (=> b!21835 (= e!14186 (= (apply!28 lt!7059 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 lt!6655)))))

(declare-fun bm!1492 () Bool)

(assert (=> bm!1492 (= call!1495 call!1494)))

(declare-fun bm!1493 () Bool)

(assert (=> bm!1493 (= call!1496 (contains!224 lt!7059 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3767 c!2588) b!21817))

(assert (= (and d!3767 (not c!2588)) b!21828))

(assert (= (and b!21828 c!2586) b!21818))

(assert (= (and b!21828 (not c!2586)) b!21826))

(assert (= (and b!21826 c!2589) b!21820))

(assert (= (and b!21826 (not c!2589)) b!21830))

(assert (= (or b!21820 b!21830) bm!1491))

(assert (= (or b!21818 bm!1491) bm!1489))

(assert (= (or b!21818 b!21820) bm!1492))

(assert (= (or b!21817 bm!1489) bm!1488))

(assert (= (or b!21817 bm!1492) bm!1490))

(assert (= (and d!3767 res!13922) b!21815))

(assert (= (and d!3767 c!2585) b!21816))

(assert (= (and d!3767 (not c!2585)) b!21832))

(assert (= (and d!3767 res!13920) b!21827))

(assert (= (and b!21827 res!13921) b!21831))

(assert (= (and b!21827 (not res!13923)) b!21819))

(assert (= (and b!21819 res!13926) b!21821))

(assert (= (and b!21827 res!13927) b!21834))

(assert (= (and b!21834 c!2590) b!21833))

(assert (= (and b!21834 (not c!2590)) b!21822))

(assert (= (and b!21833 res!13925) b!21824))

(assert (= (or b!21833 b!21822) bm!1487))

(assert (= (and b!21834 res!13928) b!21825))

(assert (= (and b!21825 c!2587) b!21829))

(assert (= (and b!21825 (not c!2587)) b!21823))

(assert (= (and b!21829 res!13924) b!21835))

(assert (= (or b!21829 b!21823) bm!1493))

(declare-fun b_lambda!1523 () Bool)

(assert (=> (not b_lambda!1523) (not b!21821)))

(declare-fun tb!643 () Bool)

(declare-fun t!3216 () Bool)

(assert (=> (and b!21300 (= (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 lt!6655)) t!3216) tb!643))

(declare-fun result!1071 () Bool)

(assert (=> tb!643 (= result!1071 tp_is_empty!997)))

(assert (=> b!21821 t!3216))

(declare-fun b_and!1429 () Bool)

(assert (= b_and!1427 (and (=> t!3216 result!1071) b_and!1429)))

(declare-fun m!15312 () Bool)

(assert (=> bm!1490 m!15312))

(declare-fun m!15314 () Bool)

(assert (=> b!21815 m!15314))

(assert (=> b!21815 m!15314))

(declare-fun m!15316 () Bool)

(assert (=> b!21815 m!15316))

(declare-fun m!15318 () Bool)

(assert (=> b!21835 m!15318))

(assert (=> b!21821 m!15314))

(declare-fun m!15320 () Bool)

(assert (=> b!21821 m!15320))

(declare-fun m!15322 () Bool)

(assert (=> b!21821 m!15322))

(declare-fun m!15324 () Bool)

(assert (=> b!21821 m!15324))

(assert (=> b!21821 m!15320))

(assert (=> b!21821 m!15314))

(declare-fun m!15326 () Bool)

(assert (=> b!21821 m!15326))

(assert (=> b!21821 m!15322))

(assert (=> d!3767 m!15163))

(assert (=> b!21831 m!15314))

(assert (=> b!21831 m!15314))

(assert (=> b!21831 m!15316))

(declare-fun m!15328 () Bool)

(assert (=> bm!1493 m!15328))

(declare-fun m!15330 () Bool)

(assert (=> b!21817 m!15330))

(declare-fun m!15332 () Bool)

(assert (=> bm!1488 m!15332))

(declare-fun m!15334 () Bool)

(assert (=> b!21824 m!15334))

(declare-fun m!15336 () Bool)

(assert (=> bm!1487 m!15336))

(assert (=> b!21819 m!15314))

(assert (=> b!21819 m!15314))

(declare-fun m!15338 () Bool)

(assert (=> b!21819 m!15338))

(declare-fun m!15340 () Bool)

(assert (=> b!21816 m!15340))

(declare-fun m!15342 () Bool)

(assert (=> b!21816 m!15342))

(assert (=> b!21816 m!15314))

(assert (=> b!21816 m!15342))

(declare-fun m!15344 () Bool)

(assert (=> b!21816 m!15344))

(declare-fun m!15346 () Bool)

(assert (=> b!21816 m!15346))

(declare-fun m!15348 () Bool)

(assert (=> b!21816 m!15348))

(declare-fun m!15350 () Bool)

(assert (=> b!21816 m!15350))

(declare-fun m!15352 () Bool)

(assert (=> b!21816 m!15352))

(declare-fun m!15354 () Bool)

(assert (=> b!21816 m!15354))

(declare-fun m!15356 () Bool)

(assert (=> b!21816 m!15356))

(assert (=> b!21816 m!15346))

(declare-fun m!15358 () Bool)

(assert (=> b!21816 m!15358))

(declare-fun m!15360 () Bool)

(assert (=> b!21816 m!15360))

(assert (=> b!21816 m!15332))

(declare-fun m!15362 () Bool)

(assert (=> b!21816 m!15362))

(declare-fun m!15364 () Bool)

(assert (=> b!21816 m!15364))

(assert (=> b!21816 m!15354))

(declare-fun m!15366 () Bool)

(assert (=> b!21816 m!15366))

(assert (=> b!21816 m!15360))

(declare-fun m!15368 () Bool)

(assert (=> b!21816 m!15368))

(assert (=> b!21580 d!3767))

(declare-fun d!3769 () Bool)

(assert (=> d!3769 (= (map!397 (_2!459 lt!6762)) (getCurrentListMap!124 (_keys!3139 (_2!459 lt!6762)) (_values!1707 (_2!459 lt!6762)) (mask!4691 (_2!459 lt!6762)) (extraKeys!1621 (_2!459 lt!6762)) (zeroValue!1645 (_2!459 lt!6762)) (minValue!1645 (_2!459 lt!6762)) #b00000000000000000000000000000000 (defaultEntry!1718 (_2!459 lt!6762))))))

(declare-fun bs!914 () Bool)

(assert (= bs!914 d!3769))

(declare-fun m!15370 () Bool)

(assert (=> bs!914 m!15370))

(assert (=> bm!1402 d!3769))

(assert (=> b!21568 d!3767))

(declare-fun d!3771 () Bool)

(assert (=> d!3771 (= (validMask!0 lt!6950) (and (or (= lt!6950 #b00000000000000000000000000000111) (= lt!6950 #b00000000000000000000000000001111) (= lt!6950 #b00000000000000000000000000011111) (= lt!6950 #b00000000000000000000000000111111) (= lt!6950 #b00000000000000000000000001111111) (= lt!6950 #b00000000000000000000000011111111) (= lt!6950 #b00000000000000000000000111111111) (= lt!6950 #b00000000000000000000001111111111) (= lt!6950 #b00000000000000000000011111111111) (= lt!6950 #b00000000000000000000111111111111) (= lt!6950 #b00000000000000000001111111111111) (= lt!6950 #b00000000000000000011111111111111) (= lt!6950 #b00000000000000000111111111111111) (= lt!6950 #b00000000000000001111111111111111) (= lt!6950 #b00000000000000011111111111111111) (= lt!6950 #b00000000000000111111111111111111) (= lt!6950 #b00000000000001111111111111111111) (= lt!6950 #b00000000000011111111111111111111) (= lt!6950 #b00000000000111111111111111111111) (= lt!6950 #b00000000001111111111111111111111) (= lt!6950 #b00000000011111111111111111111111) (= lt!6950 #b00000000111111111111111111111111) (= lt!6950 #b00000001111111111111111111111111) (= lt!6950 #b00000011111111111111111111111111) (= lt!6950 #b00000111111111111111111111111111) (= lt!6950 #b00001111111111111111111111111111) (= lt!6950 #b00011111111111111111111111111111) (= lt!6950 #b00111111111111111111111111111111)) (bvsle lt!6950 #b00111111111111111111111111111111)))))

(assert (=> d!3721 d!3771))

(assert (=> d!3721 d!3717))

(declare-fun b!21836 () Bool)

(declare-fun e!14188 () Bool)

(assert (=> b!21836 (= e!14188 (validKeyInArray!0 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)))))

(declare-fun b!21837 () Bool)

(declare-fun e!14192 () Unit!462)

(declare-fun lt!7065 () Unit!462)

(assert (=> b!21837 (= e!14192 lt!7065)))

(declare-fun lt!7069 () ListLongMap!557)

(assert (=> b!21837 (= lt!7069 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (ite c!2518 (_values!1707 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655)))) (mask!4691 lt!6655) (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7067 () (_ BitVec 64))

(assert (=> b!21837 (= lt!7067 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7074 () (_ BitVec 64))

(assert (=> b!21837 (= lt!7074 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(declare-fun lt!7082 () Unit!462)

(assert (=> b!21837 (= lt!7082 (addStillContains!13 lt!7069 lt!7067 (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)) lt!7074))))

(assert (=> b!21837 (contains!224 (+!41 lt!7069 (tuple2!911 lt!7067 (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)))) lt!7074)))

(declare-fun lt!7083 () Unit!462)

(assert (=> b!21837 (= lt!7083 lt!7082)))

(declare-fun lt!7064 () ListLongMap!557)

(assert (=> b!21837 (= lt!7064 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (ite c!2518 (_values!1707 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655)))) (mask!4691 lt!6655) (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7071 () (_ BitVec 64))

(assert (=> b!21837 (= lt!7071 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7077 () (_ BitVec 64))

(assert (=> b!21837 (= lt!7077 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(declare-fun lt!7070 () Unit!462)

(assert (=> b!21837 (= lt!7070 (addApplyDifferent!13 lt!7064 lt!7071 (minValue!1645 lt!6655) lt!7077))))

(assert (=> b!21837 (= (apply!28 (+!41 lt!7064 (tuple2!911 lt!7071 (minValue!1645 lt!6655))) lt!7077) (apply!28 lt!7064 lt!7077))))

(declare-fun lt!7066 () Unit!462)

(assert (=> b!21837 (= lt!7066 lt!7070)))

(declare-fun lt!7075 () ListLongMap!557)

(assert (=> b!21837 (= lt!7075 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (ite c!2518 (_values!1707 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655)))) (mask!4691 lt!6655) (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7079 () (_ BitVec 64))

(assert (=> b!21837 (= lt!7079 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7073 () (_ BitVec 64))

(assert (=> b!21837 (= lt!7073 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(declare-fun lt!7076 () Unit!462)

(assert (=> b!21837 (= lt!7076 (addApplyDifferent!13 lt!7075 lt!7079 (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)) lt!7073))))

(assert (=> b!21837 (= (apply!28 (+!41 lt!7075 (tuple2!911 lt!7079 (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)))) lt!7073) (apply!28 lt!7075 lt!7073))))

(declare-fun lt!7085 () Unit!462)

(assert (=> b!21837 (= lt!7085 lt!7076)))

(declare-fun lt!7078 () ListLongMap!557)

(assert (=> b!21837 (= lt!7078 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (ite c!2518 (_values!1707 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655)))) (mask!4691 lt!6655) (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7068 () (_ BitVec 64))

(assert (=> b!21837 (= lt!7068 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7072 () (_ BitVec 64))

(assert (=> b!21837 (= lt!7072 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(assert (=> b!21837 (= lt!7065 (addApplyDifferent!13 lt!7078 lt!7068 (minValue!1645 lt!6655) lt!7072))))

(assert (=> b!21837 (= (apply!28 (+!41 lt!7078 (tuple2!911 lt!7068 (minValue!1645 lt!6655))) lt!7072) (apply!28 lt!7078 lt!7072))))

(declare-fun bm!1494 () Bool)

(declare-fun call!1498 () Bool)

(declare-fun lt!7081 () ListLongMap!557)

(assert (=> bm!1494 (= call!1498 (contains!224 lt!7081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21838 () Bool)

(declare-fun e!14197 () ListLongMap!557)

(declare-fun call!1501 () ListLongMap!557)

(assert (=> b!21838 (= e!14197 (+!41 call!1501 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 lt!6655))))))

(declare-fun b!21839 () Bool)

(declare-fun e!14193 () ListLongMap!557)

(declare-fun call!1502 () ListLongMap!557)

(assert (=> b!21839 (= e!14193 call!1502)))

(declare-fun b!21840 () Bool)

(declare-fun e!14200 () Bool)

(declare-fun e!14194 () Bool)

(assert (=> b!21840 (= e!14200 e!14194)))

(declare-fun res!13935 () Bool)

(assert (=> b!21840 (=> (not res!13935) (not e!14194))))

(assert (=> b!21840 (= res!13935 (contains!224 lt!7081 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)))))

(assert (=> b!21840 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!21841 () Bool)

(declare-fun e!14196 () ListLongMap!557)

(assert (=> b!21841 (= e!14196 call!1502)))

(declare-fun b!21842 () Bool)

(assert (=> b!21842 (= e!14194 (= (apply!28 lt!7081 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)) (get!377 (select (arr!573 (ite c!2518 (_values!1707 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655))))) #b00000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21842 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (ite c!2518 (_values!1707 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655)))))))))

(assert (=> b!21842 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!21843 () Bool)

(declare-fun e!14191 () Bool)

(assert (=> b!21843 (= e!14191 (not call!1498))))

(declare-fun d!3773 () Bool)

(declare-fun e!14195 () Bool)

(assert (=> d!3773 e!14195))

(declare-fun res!13929 () Bool)

(assert (=> d!3773 (=> (not res!13929) (not e!14195))))

(assert (=> d!3773 (= res!13929 (or (bvsge #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))))

(declare-fun lt!7084 () ListLongMap!557)

(assert (=> d!3773 (= lt!7081 lt!7084)))

(declare-fun lt!7080 () Unit!462)

(assert (=> d!3773 (= lt!7080 e!14192)))

(declare-fun c!2591 () Bool)

(assert (=> d!3773 (= c!2591 e!14188)))

(declare-fun res!13931 () Bool)

(assert (=> d!3773 (=> (not res!13931) (not e!14188))))

(assert (=> d!3773 (= res!13931 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(assert (=> d!3773 (= lt!7084 e!14197)))

(declare-fun c!2594 () Bool)

(assert (=> d!3773 (= c!2594 (and (not (= (bvand (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3773 (validMask!0 (mask!4691 lt!6655))))

(assert (=> d!3773 (= (getCurrentListMap!124 (_keys!3139 lt!6655) (ite c!2518 (_values!1707 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655)))) (mask!4691 lt!6655) (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) lt!7081)))

(declare-fun b!21844 () Bool)

(declare-fun e!14190 () Bool)

(declare-fun call!1503 () Bool)

(assert (=> b!21844 (= e!14190 (not call!1503))))

(declare-fun b!21845 () Bool)

(declare-fun e!14189 () Bool)

(assert (=> b!21845 (= e!14189 (= (apply!28 lt!7081 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655))))))

(declare-fun b!21846 () Bool)

(assert (=> b!21846 (= e!14195 e!14190)))

(declare-fun c!2593 () Bool)

(assert (=> b!21846 (= c!2593 (not (= (bvand (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!2595 () Bool)

(declare-fun b!21847 () Bool)

(assert (=> b!21847 (= c!2595 (and (not (= (bvand (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21847 (= e!14193 e!14196)))

(declare-fun bm!1495 () Bool)

(declare-fun call!1497 () ListLongMap!557)

(assert (=> bm!1495 (= call!1497 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (ite c!2518 (_values!1707 lt!6655) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (index!2325 lt!6799) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655)))) (mask!4691 lt!6655) (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655)) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun bm!1496 () Bool)

(declare-fun call!1500 () ListLongMap!557)

(assert (=> bm!1496 (= call!1500 call!1497)))

(declare-fun bm!1497 () Bool)

(declare-fun c!2592 () Bool)

(declare-fun call!1499 () ListLongMap!557)

(assert (=> bm!1497 (= call!1501 (+!41 (ite c!2594 call!1497 (ite c!2592 call!1500 call!1499)) (ite (or c!2594 c!2592) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!2518 c!2516) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 lt!6655))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 lt!6655)))))))

(declare-fun b!21848 () Bool)

(declare-fun res!13936 () Bool)

(assert (=> b!21848 (=> (not res!13936) (not e!14195))))

(assert (=> b!21848 (= res!13936 e!14200)))

(declare-fun res!13932 () Bool)

(assert (=> b!21848 (=> res!13932 e!14200)))

(declare-fun e!14198 () Bool)

(assert (=> b!21848 (= res!13932 (not e!14198))))

(declare-fun res!13930 () Bool)

(assert (=> b!21848 (=> (not res!13930) (not e!14198))))

(assert (=> b!21848 (= res!13930 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!21849 () Bool)

(assert (=> b!21849 (= e!14197 e!14193)))

(assert (=> b!21849 (= c!2592 (and (not (= (bvand (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21850 () Bool)

(declare-fun e!14199 () Bool)

(assert (=> b!21850 (= e!14190 e!14199)))

(declare-fun res!13933 () Bool)

(assert (=> b!21850 (= res!13933 call!1503)))

(assert (=> b!21850 (=> (not res!13933) (not e!14199))))

(declare-fun b!21851 () Bool)

(assert (=> b!21851 (= e!14196 call!1499)))

(declare-fun b!21852 () Bool)

(assert (=> b!21852 (= e!14198 (validKeyInArray!0 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)))))

(declare-fun bm!1498 () Bool)

(assert (=> bm!1498 (= call!1499 call!1500)))

(declare-fun b!21853 () Bool)

(declare-fun Unit!479 () Unit!462)

(assert (=> b!21853 (= e!14192 Unit!479)))

(declare-fun b!21854 () Bool)

(assert (=> b!21854 (= e!14191 e!14189)))

(declare-fun res!13934 () Bool)

(assert (=> b!21854 (= res!13934 call!1498)))

(assert (=> b!21854 (=> (not res!13934) (not e!14189))))

(declare-fun b!21855 () Bool)

(declare-fun res!13937 () Bool)

(assert (=> b!21855 (=> (not res!13937) (not e!14195))))

(assert (=> b!21855 (= res!13937 e!14191)))

(declare-fun c!2596 () Bool)

(assert (=> b!21855 (= c!2596 (not (= (bvand (ite (and c!2518 c!2516) lt!6792 (extraKeys!1621 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21856 () Bool)

(assert (=> b!21856 (= e!14199 (= (apply!28 lt!7081 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 lt!6655)))))

(declare-fun bm!1499 () Bool)

(assert (=> bm!1499 (= call!1502 call!1501)))

(declare-fun bm!1500 () Bool)

(assert (=> bm!1500 (= call!1503 (contains!224 lt!7081 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3773 c!2594) b!21838))

(assert (= (and d!3773 (not c!2594)) b!21849))

(assert (= (and b!21849 c!2592) b!21839))

(assert (= (and b!21849 (not c!2592)) b!21847))

(assert (= (and b!21847 c!2595) b!21841))

(assert (= (and b!21847 (not c!2595)) b!21851))

(assert (= (or b!21841 b!21851) bm!1498))

(assert (= (or b!21839 bm!1498) bm!1496))

(assert (= (or b!21839 b!21841) bm!1499))

(assert (= (or b!21838 bm!1496) bm!1495))

(assert (= (or b!21838 bm!1499) bm!1497))

(assert (= (and d!3773 res!13931) b!21836))

(assert (= (and d!3773 c!2591) b!21837))

(assert (= (and d!3773 (not c!2591)) b!21853))

(assert (= (and d!3773 res!13929) b!21848))

(assert (= (and b!21848 res!13930) b!21852))

(assert (= (and b!21848 (not res!13932)) b!21840))

(assert (= (and b!21840 res!13935) b!21842))

(assert (= (and b!21848 res!13936) b!21855))

(assert (= (and b!21855 c!2596) b!21854))

(assert (= (and b!21855 (not c!2596)) b!21843))

(assert (= (and b!21854 res!13934) b!21845))

(assert (= (or b!21854 b!21843) bm!1494))

(assert (= (and b!21855 res!13937) b!21846))

(assert (= (and b!21846 c!2593) b!21850))

(assert (= (and b!21846 (not c!2593)) b!21844))

(assert (= (and b!21850 res!13933) b!21856))

(assert (= (or b!21850 b!21844) bm!1500))

(declare-fun b_lambda!1525 () Bool)

(assert (=> (not b_lambda!1525) (not b!21842)))

(assert (=> b!21842 t!3216))

(declare-fun b_and!1431 () Bool)

(assert (= b_and!1429 (and (=> t!3216 result!1071) b_and!1431)))

(declare-fun m!15372 () Bool)

(assert (=> bm!1497 m!15372))

(assert (=> b!21836 m!15314))

(assert (=> b!21836 m!15314))

(assert (=> b!21836 m!15316))

(declare-fun m!15374 () Bool)

(assert (=> b!21856 m!15374))

(assert (=> b!21842 m!15314))

(declare-fun m!15376 () Bool)

(assert (=> b!21842 m!15376))

(assert (=> b!21842 m!15322))

(declare-fun m!15378 () Bool)

(assert (=> b!21842 m!15378))

(assert (=> b!21842 m!15376))

(assert (=> b!21842 m!15314))

(declare-fun m!15380 () Bool)

(assert (=> b!21842 m!15380))

(assert (=> b!21842 m!15322))

(assert (=> d!3773 m!15163))

(assert (=> b!21852 m!15314))

(assert (=> b!21852 m!15314))

(assert (=> b!21852 m!15316))

(declare-fun m!15382 () Bool)

(assert (=> bm!1500 m!15382))

(declare-fun m!15384 () Bool)

(assert (=> b!21838 m!15384))

(declare-fun m!15386 () Bool)

(assert (=> bm!1495 m!15386))

(declare-fun m!15388 () Bool)

(assert (=> b!21845 m!15388))

(declare-fun m!15390 () Bool)

(assert (=> bm!1494 m!15390))

(assert (=> b!21840 m!15314))

(assert (=> b!21840 m!15314))

(declare-fun m!15392 () Bool)

(assert (=> b!21840 m!15392))

(declare-fun m!15394 () Bool)

(assert (=> b!21837 m!15394))

(declare-fun m!15396 () Bool)

(assert (=> b!21837 m!15396))

(assert (=> b!21837 m!15314))

(assert (=> b!21837 m!15396))

(declare-fun m!15398 () Bool)

(assert (=> b!21837 m!15398))

(declare-fun m!15400 () Bool)

(assert (=> b!21837 m!15400))

(declare-fun m!15402 () Bool)

(assert (=> b!21837 m!15402))

(declare-fun m!15404 () Bool)

(assert (=> b!21837 m!15404))

(declare-fun m!15406 () Bool)

(assert (=> b!21837 m!15406))

(declare-fun m!15408 () Bool)

(assert (=> b!21837 m!15408))

(declare-fun m!15410 () Bool)

(assert (=> b!21837 m!15410))

(assert (=> b!21837 m!15400))

(declare-fun m!15412 () Bool)

(assert (=> b!21837 m!15412))

(declare-fun m!15414 () Bool)

(assert (=> b!21837 m!15414))

(assert (=> b!21837 m!15386))

(declare-fun m!15416 () Bool)

(assert (=> b!21837 m!15416))

(declare-fun m!15418 () Bool)

(assert (=> b!21837 m!15418))

(assert (=> b!21837 m!15408))

(declare-fun m!15420 () Bool)

(assert (=> b!21837 m!15420))

(assert (=> b!21837 m!15414))

(declare-fun m!15422 () Bool)

(assert (=> b!21837 m!15422))

(assert (=> bm!1428 d!3773))

(declare-fun d!3775 () Bool)

(declare-fun res!13938 () Bool)

(declare-fun e!14201 () Bool)

(assert (=> d!3775 (=> (not res!13938) (not e!14201))))

(assert (=> d!3775 (= res!13938 (simpleValid!19 (v!1571 (underlying!103 thiss!938))))))

(assert (=> d!3775 (= (valid!108 (v!1571 (underlying!103 thiss!938))) e!14201)))

(declare-fun b!21857 () Bool)

(declare-fun res!13939 () Bool)

(assert (=> b!21857 (=> (not res!13939) (not e!14201))))

(assert (=> b!21857 (= res!13939 (= (arrayCountValidKeys!0 (_keys!3139 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))) (_size!133 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun b!21858 () Bool)

(declare-fun res!13940 () Bool)

(assert (=> b!21858 (=> (not res!13940) (not e!14201))))

(assert (=> b!21858 (= res!13940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun b!21859 () Bool)

(assert (=> b!21859 (= e!14201 (arrayNoDuplicates!0 (_keys!3139 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000000 Nil!556))))

(assert (= (and d!3775 res!13938) b!21857))

(assert (= (and b!21857 res!13939) b!21858))

(assert (= (and b!21858 res!13940) b!21859))

(declare-fun m!15424 () Bool)

(assert (=> d!3775 m!15424))

(declare-fun m!15426 () Bool)

(assert (=> b!21857 m!15426))

(declare-fun m!15428 () Bool)

(assert (=> b!21858 m!15428))

(declare-fun m!15430 () Bool)

(assert (=> b!21859 m!15430))

(assert (=> d!3709 d!3775))

(declare-fun d!3777 () Bool)

(declare-fun res!13945 () Bool)

(declare-fun e!14206 () Bool)

(assert (=> d!3777 (=> res!13945 e!14206)))

(assert (=> d!3777 (= res!13945 (= (select (arr!572 lt!6935) #b00000000000000000000000000000000) (_1!458 lt!6937)))))

(assert (=> d!3777 (= (arrayContainsKey!0 lt!6935 (_1!458 lt!6937) #b00000000000000000000000000000000) e!14206)))

(declare-fun b!21864 () Bool)

(declare-fun e!14207 () Bool)

(assert (=> b!21864 (= e!14206 e!14207)))

(declare-fun res!13946 () Bool)

(assert (=> b!21864 (=> (not res!13946) (not e!14207))))

(assert (=> b!21864 (= res!13946 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!665 lt!6935)))))

(declare-fun b!21865 () Bool)

(assert (=> b!21865 (= e!14207 (arrayContainsKey!0 lt!6935 (_1!458 lt!6937) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3777 (not res!13945)) b!21864))

(assert (= (and b!21864 res!13946) b!21865))

(declare-fun m!15432 () Bool)

(assert (=> d!3777 m!15432))

(declare-fun m!15434 () Bool)

(assert (=> b!21865 m!15434))

(assert (=> b!21678 d!3777))

(declare-fun b!21866 () Bool)

(declare-fun e!14208 () SeekEntryResult!51)

(assert (=> b!21866 (= e!14208 Undefined!51)))

(declare-fun lt!7087 () SeekEntryResult!51)

(declare-fun d!3779 () Bool)

(assert (=> d!3779 (and (or ((_ is Undefined!51) lt!7087) (not ((_ is Found!51) lt!7087)) (and (bvsge (index!2325 lt!7087) #b00000000000000000000000000000000) (bvslt (index!2325 lt!7087) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))) (or ((_ is Undefined!51) lt!7087) ((_ is Found!51) lt!7087) (not ((_ is MissingZero!51) lt!7087)) (and (bvsge (index!2324 lt!7087) #b00000000000000000000000000000000) (bvslt (index!2324 lt!7087) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))) (or ((_ is Undefined!51) lt!7087) ((_ is Found!51) lt!7087) ((_ is MissingZero!51) lt!7087) (not ((_ is MissingVacant!51) lt!7087)) (and (bvsge (index!2327 lt!7087) #b00000000000000000000000000000000) (bvslt (index!2327 lt!7087) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))) (or ((_ is Undefined!51) lt!7087) (ite ((_ is Found!51) lt!7087) (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!7087)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (ite ((_ is MissingZero!51) lt!7087) (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2324 lt!7087)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!51) lt!7087) (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2327 lt!7087)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!3779 (= lt!7087 e!14208)))

(declare-fun c!2599 () Bool)

(declare-fun lt!7086 () SeekEntryResult!51)

(assert (=> d!3779 (= c!2599 (and ((_ is Intermediate!51) lt!7086) (undefined!863 lt!7086)))))

(assert (=> d!3779 (= lt!7086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> d!3779 (validMask!0 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3779 (= (seekEntryOrOpen!0 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7087)))

(declare-fun e!14210 () SeekEntryResult!51)

(declare-fun b!21867 () Bool)

(assert (=> b!21867 (= e!14210 (seekKeyOrZeroReturnVacant!0 (x!5190 lt!7086) (index!2326 lt!7086) (index!2326 lt!7086) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21868 () Bool)

(declare-fun e!14209 () SeekEntryResult!51)

(assert (=> b!21868 (= e!14209 (Found!51 (index!2326 lt!7086)))))

(declare-fun b!21869 () Bool)

(assert (=> b!21869 (= e!14208 e!14209)))

(declare-fun lt!7088 () (_ BitVec 64))

(assert (=> b!21869 (= lt!7088 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2326 lt!7086)))))

(declare-fun c!2598 () Bool)

(assert (=> b!21869 (= c!2598 (= lt!7088 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!21870 () Bool)

(declare-fun c!2597 () Bool)

(assert (=> b!21870 (= c!2597 (= lt!7088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21870 (= e!14209 e!14210)))

(declare-fun b!21871 () Bool)

(assert (=> b!21871 (= e!14210 (MissingZero!51 (index!2326 lt!7086)))))

(assert (= (and d!3779 c!2599) b!21866))

(assert (= (and d!3779 (not c!2599)) b!21869))

(assert (= (and b!21869 c!2598) b!21868))

(assert (= (and b!21869 (not c!2598)) b!21870))

(assert (= (and b!21870 c!2597) b!21871))

(assert (= (and b!21870 (not c!2597)) b!21867))

(declare-fun m!15436 () Bool)

(assert (=> d!3779 m!15436))

(declare-fun m!15438 () Bool)

(assert (=> d!3779 m!15438))

(declare-fun m!15440 () Bool)

(assert (=> d!3779 m!15440))

(assert (=> d!3779 m!15147))

(declare-fun m!15442 () Bool)

(assert (=> d!3779 m!15442))

(assert (=> d!3779 m!15440))

(declare-fun m!15444 () Bool)

(assert (=> d!3779 m!15444))

(declare-fun m!15446 () Bool)

(assert (=> b!21867 m!15446))

(declare-fun m!15448 () Bool)

(assert (=> b!21869 m!15448))

(assert (=> b!21543 d!3779))

(declare-fun d!3781 () Bool)

(declare-fun e!14213 () Bool)

(assert (=> d!3781 e!14213))

(declare-fun res!13952 () Bool)

(assert (=> d!3781 (=> (not res!13952) (not e!14213))))

(declare-fun lt!7097 () ListLongMap!557)

(assert (=> d!3781 (= res!13952 (contains!224 lt!7097 (_1!458 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun lt!7098 () List!558)

(assert (=> d!3781 (= lt!7097 (ListLongMap!558 lt!7098))))

(declare-fun lt!7099 () Unit!462)

(declare-fun lt!7100 () Unit!462)

(assert (=> d!3781 (= lt!7099 lt!7100)))

(assert (=> d!3781 (= (getValueByKey!60 lt!7098 (_1!458 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!17 (List!558 (_ BitVec 64) V!1155) Unit!462)

(assert (=> d!3781 (= lt!7100 (lemmaContainsTupThenGetReturnValue!17 lt!7098 (_1!458 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun insertStrictlySorted!17 (List!558 (_ BitVec 64) V!1155) List!558)

(assert (=> d!3781 (= lt!7098 (insertStrictlySorted!17 (toList!294 call!1449) (_1!458 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3781 (= (+!41 call!1449 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!7097)))

(declare-fun b!21876 () Bool)

(declare-fun res!13951 () Bool)

(assert (=> b!21876 (=> (not res!13951) (not e!14213))))

(assert (=> b!21876 (= res!13951 (= (getValueByKey!60 (toList!294 lt!7097) (_1!458 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(declare-fun b!21877 () Bool)

(declare-fun contains!225 (List!558 tuple2!910) Bool)

(assert (=> b!21877 (= e!14213 (contains!225 (toList!294 lt!7097) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))))

(assert (= (and d!3781 res!13952) b!21876))

(assert (= (and b!21876 res!13951) b!21877))

(declare-fun m!15450 () Bool)

(assert (=> d!3781 m!15450))

(declare-fun m!15452 () Bool)

(assert (=> d!3781 m!15452))

(declare-fun m!15454 () Bool)

(assert (=> d!3781 m!15454))

(declare-fun m!15456 () Bool)

(assert (=> d!3781 m!15456))

(declare-fun m!15458 () Bool)

(assert (=> b!21876 m!15458))

(declare-fun m!15460 () Bool)

(assert (=> b!21877 m!15460))

(assert (=> b!21565 d!3781))

(declare-fun d!3783 () Bool)

(declare-fun e!14214 () Bool)

(assert (=> d!3783 e!14214))

(declare-fun res!13954 () Bool)

(assert (=> d!3783 (=> (not res!13954) (not e!14214))))

(declare-fun lt!7101 () ListLongMap!557)

(assert (=> d!3783 (= res!13954 (contains!224 lt!7101 (_1!458 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))))

(declare-fun lt!7102 () List!558)

(assert (=> d!3783 (= lt!7101 (ListLongMap!558 lt!7102))))

(declare-fun lt!7103 () Unit!462)

(declare-fun lt!7104 () Unit!462)

(assert (=> d!3783 (= lt!7103 lt!7104)))

(assert (=> d!3783 (= (getValueByKey!60 lt!7102 (_1!458 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))) (Some!65 (_2!458 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))))

(assert (=> d!3783 (= lt!7104 (lemmaContainsTupThenGetReturnValue!17 lt!7102 (_1!458 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))) (_2!458 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))))

(assert (=> d!3783 (= lt!7102 (insertStrictlySorted!17 (toList!294 e!14006) (_1!458 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))) (_2!458 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))))

(assert (=> d!3783 (= (+!41 e!14006 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))) lt!7101)))

(declare-fun b!21878 () Bool)

(declare-fun res!13953 () Bool)

(assert (=> b!21878 (=> (not res!13953) (not e!14214))))

(assert (=> b!21878 (= res!13953 (= (getValueByKey!60 (toList!294 lt!7101) (_1!458 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))) (Some!65 (_2!458 (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))))

(declare-fun b!21879 () Bool)

(assert (=> b!21879 (= e!14214 (contains!225 (toList!294 lt!7101) (ite c!2504 (ite c!2502 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))

(assert (= (and d!3783 res!13954) b!21878))

(assert (= (and b!21878 res!13953) b!21879))

(declare-fun m!15462 () Bool)

(assert (=> d!3783 m!15462))

(declare-fun m!15464 () Bool)

(assert (=> d!3783 m!15464))

(declare-fun m!15466 () Bool)

(assert (=> d!3783 m!15466))

(declare-fun m!15468 () Bool)

(assert (=> d!3783 m!15468))

(declare-fun m!15470 () Bool)

(assert (=> b!21878 m!15470))

(declare-fun m!15472 () Bool)

(assert (=> b!21879 m!15472))

(assert (=> bm!1409 d!3783))

(declare-fun d!3785 () Bool)

(declare-fun get!378 (Option!66) V!1155)

(assert (=> d!3785 (= (apply!28 lt!6872 #b0000000000000000000000000000000000000000000000000000000000000000) (get!378 (getValueByKey!60 (toList!294 lt!6872) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!915 () Bool)

(assert (= bs!915 d!3785))

(declare-fun m!15474 () Bool)

(assert (=> bs!915 m!15474))

(assert (=> bs!915 m!15474))

(declare-fun m!15476 () Bool)

(assert (=> bs!915 m!15476))

(assert (=> b!21649 d!3785))

(declare-fun b!21891 () Bool)

(declare-fun e!14217 () Bool)

(assert (=> b!21891 (= e!14217 (and (bvsge (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000) (bvsle (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000011) (bvsge (_vacant!133 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000)))))

(declare-fun b!21888 () Bool)

(declare-fun res!13964 () Bool)

(assert (=> b!21888 (=> (not res!13964) (not e!14217))))

(assert (=> b!21888 (= res!13964 (and (= (size!666 (_values!1707 (v!1571 (_2!457 lt!6660)))) (bvadd (mask!4691 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000001)) (= (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660)))) (size!666 (_values!1707 (v!1571 (_2!457 lt!6660))))) (bvsge (_size!133 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000) (bvsle (_size!133 (v!1571 (_2!457 lt!6660))) (bvadd (mask!4691 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000001))))))

(declare-fun b!21889 () Bool)

(declare-fun res!13963 () Bool)

(assert (=> b!21889 (=> (not res!13963) (not e!14217))))

(declare-fun size!673 (LongMapFixedSize!184) (_ BitVec 32))

(assert (=> b!21889 (= res!13963 (bvsge (size!673 (v!1571 (_2!457 lt!6660))) (_size!133 (v!1571 (_2!457 lt!6660)))))))

(declare-fun d!3787 () Bool)

(declare-fun res!13966 () Bool)

(assert (=> d!3787 (=> (not res!13966) (not e!14217))))

(assert (=> d!3787 (= res!13966 (validMask!0 (mask!4691 (v!1571 (_2!457 lt!6660)))))))

(assert (=> d!3787 (= (simpleValid!19 (v!1571 (_2!457 lt!6660))) e!14217)))

(declare-fun b!21890 () Bool)

(declare-fun res!13965 () Bool)

(assert (=> b!21890 (=> (not res!13965) (not e!14217))))

(assert (=> b!21890 (= res!13965 (= (size!673 (v!1571 (_2!457 lt!6660))) (bvadd (_size!133 (v!1571 (_2!457 lt!6660))) (bvsdiv (bvadd (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!3787 res!13966) b!21888))

(assert (= (and b!21888 res!13964) b!21889))

(assert (= (and b!21889 res!13963) b!21890))

(assert (= (and b!21890 res!13965) b!21891))

(declare-fun m!15478 () Bool)

(assert (=> b!21889 m!15478))

(declare-fun m!15480 () Bool)

(assert (=> d!3787 m!15480))

(assert (=> b!21890 m!15478))

(assert (=> d!3705 d!3787))

(declare-fun b!21892 () Bool)

(declare-fun e!14218 () Bool)

(assert (=> b!21892 (= e!14218 (validKeyInArray!0 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun b!21893 () Bool)

(declare-fun e!14222 () Unit!462)

(declare-fun lt!7106 () Unit!462)

(assert (=> b!21893 (= e!14222 lt!7106)))

(declare-fun lt!7110 () ListLongMap!557)

(assert (=> b!21893 (= lt!7110 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7108 () (_ BitVec 64))

(assert (=> b!21893 (= lt!7108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7115 () (_ BitVec 64))

(assert (=> b!21893 (= lt!7115 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7123 () Unit!462)

(assert (=> b!21893 (= lt!7123 (addStillContains!13 lt!7110 lt!7108 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!7115))))

(assert (=> b!21893 (contains!224 (+!41 lt!7110 (tuple2!911 lt!7108 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))) lt!7115)))

(declare-fun lt!7124 () Unit!462)

(assert (=> b!21893 (= lt!7124 lt!7123)))

(declare-fun lt!7105 () ListLongMap!557)

(assert (=> b!21893 (= lt!7105 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7112 () (_ BitVec 64))

(assert (=> b!21893 (= lt!7112 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7118 () (_ BitVec 64))

(assert (=> b!21893 (= lt!7118 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7111 () Unit!462)

(assert (=> b!21893 (= lt!7111 (addApplyDifferent!13 lt!7105 lt!7112 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!7118))))

(assert (=> b!21893 (= (apply!28 (+!41 lt!7105 (tuple2!911 lt!7112 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))) lt!7118) (apply!28 lt!7105 lt!7118))))

(declare-fun lt!7107 () Unit!462)

(assert (=> b!21893 (= lt!7107 lt!7111)))

(declare-fun lt!7116 () ListLongMap!557)

(assert (=> b!21893 (= lt!7116 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7120 () (_ BitVec 64))

(assert (=> b!21893 (= lt!7120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7114 () (_ BitVec 64))

(assert (=> b!21893 (= lt!7114 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7117 () Unit!462)

(assert (=> b!21893 (= lt!7117 (addApplyDifferent!13 lt!7116 lt!7120 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!7114))))

(assert (=> b!21893 (= (apply!28 (+!41 lt!7116 (tuple2!911 lt!7120 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))) lt!7114) (apply!28 lt!7116 lt!7114))))

(declare-fun lt!7126 () Unit!462)

(assert (=> b!21893 (= lt!7126 lt!7117)))

(declare-fun lt!7119 () ListLongMap!557)

(assert (=> b!21893 (= lt!7119 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7109 () (_ BitVec 64))

(assert (=> b!21893 (= lt!7109 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7113 () (_ BitVec 64))

(assert (=> b!21893 (= lt!7113 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(assert (=> b!21893 (= lt!7106 (addApplyDifferent!13 lt!7119 lt!7109 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!7113))))

(assert (=> b!21893 (= (apply!28 (+!41 lt!7119 (tuple2!911 lt!7109 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))) lt!7113) (apply!28 lt!7119 lt!7113))))

(declare-fun bm!1501 () Bool)

(declare-fun call!1505 () Bool)

(declare-fun lt!7122 () ListLongMap!557)

(assert (=> bm!1501 (= call!1505 (contains!224 lt!7122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21894 () Bool)

(declare-fun call!1508 () ListLongMap!557)

(declare-fun e!14227 () ListLongMap!557)

(assert (=> b!21894 (= e!14227 (+!41 call!1508 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21895 () Bool)

(declare-fun e!14223 () ListLongMap!557)

(declare-fun call!1509 () ListLongMap!557)

(assert (=> b!21895 (= e!14223 call!1509)))

(declare-fun b!21896 () Bool)

(declare-fun e!14230 () Bool)

(declare-fun e!14224 () Bool)

(assert (=> b!21896 (= e!14230 e!14224)))

(declare-fun res!13973 () Bool)

(assert (=> b!21896 (=> (not res!13973) (not e!14224))))

(assert (=> b!21896 (= res!13973 (contains!224 lt!7122 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)))))

(assert (=> b!21896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21897 () Bool)

(declare-fun e!14226 () ListLongMap!557)

(assert (=> b!21897 (= e!14226 call!1509)))

(declare-fun b!21898 () Bool)

(assert (=> b!21898 (= e!14224 (= (apply!28 lt!7122 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)) (get!377 (select (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(assert (=> b!21898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21899 () Bool)

(declare-fun e!14221 () Bool)

(assert (=> b!21899 (= e!14221 (not call!1505))))

(declare-fun d!3789 () Bool)

(declare-fun e!14225 () Bool)

(assert (=> d!3789 e!14225))

(declare-fun res!13967 () Bool)

(assert (=> d!3789 (=> (not res!13967) (not e!14225))))

(assert (=> d!3789 (= res!13967 (or (bvsge #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))))

(declare-fun lt!7125 () ListLongMap!557)

(assert (=> d!3789 (= lt!7122 lt!7125)))

(declare-fun lt!7121 () Unit!462)

(assert (=> d!3789 (= lt!7121 e!14222)))

(declare-fun c!2600 () Bool)

(assert (=> d!3789 (= c!2600 e!14218)))

(declare-fun res!13969 () Bool)

(assert (=> d!3789 (=> (not res!13969) (not e!14218))))

(assert (=> d!3789 (= res!13969 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(assert (=> d!3789 (= lt!7125 e!14227)))

(declare-fun c!2603 () Bool)

(assert (=> d!3789 (= c!2603 (and (not (= (bvand (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3789 (validMask!0 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3789 (= (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7122)))

(declare-fun b!21900 () Bool)

(declare-fun e!14220 () Bool)

(declare-fun call!1510 () Bool)

(assert (=> b!21900 (= e!14220 (not call!1510))))

(declare-fun e!14219 () Bool)

(declare-fun b!21901 () Bool)

(assert (=> b!21901 (= e!14219 (= (apply!28 lt!7122 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21902 () Bool)

(assert (=> b!21902 (= e!14225 e!14220)))

(declare-fun c!2602 () Bool)

(assert (=> b!21902 (= c!2602 (not (= (bvand (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21903 () Bool)

(declare-fun c!2604 () Bool)

(assert (=> b!21903 (= c!2604 (and (not (= (bvand (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21903 (= e!14223 e!14226)))

(declare-fun bm!1502 () Bool)

(declare-fun call!1504 () ListLongMap!557)

(assert (=> bm!1502 (= call!1504 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun bm!1503 () Bool)

(declare-fun call!1507 () ListLongMap!557)

(assert (=> bm!1503 (= call!1507 call!1504)))

(declare-fun call!1506 () ListLongMap!557)

(declare-fun bm!1504 () Bool)

(declare-fun c!2601 () Bool)

(assert (=> bm!1504 (= call!1508 (+!41 (ite c!2603 call!1504 (ite c!2601 call!1507 call!1506)) (ite (or c!2603 c!2601) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))))))

(declare-fun b!21904 () Bool)

(declare-fun res!13974 () Bool)

(assert (=> b!21904 (=> (not res!13974) (not e!14225))))

(assert (=> b!21904 (= res!13974 e!14230)))

(declare-fun res!13970 () Bool)

(assert (=> b!21904 (=> res!13970 e!14230)))

(declare-fun e!14228 () Bool)

(assert (=> b!21904 (= res!13970 (not e!14228))))

(declare-fun res!13968 () Bool)

(assert (=> b!21904 (=> (not res!13968) (not e!14228))))

(assert (=> b!21904 (= res!13968 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21905 () Bool)

(assert (=> b!21905 (= e!14227 e!14223)))

(assert (=> b!21905 (= c!2601 (and (not (= (bvand (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21906 () Bool)

(declare-fun e!14229 () Bool)

(assert (=> b!21906 (= e!14220 e!14229)))

(declare-fun res!13971 () Bool)

(assert (=> b!21906 (= res!13971 call!1510)))

(assert (=> b!21906 (=> (not res!13971) (not e!14229))))

(declare-fun b!21907 () Bool)

(assert (=> b!21907 (= e!14226 call!1506)))

(declare-fun b!21908 () Bool)

(assert (=> b!21908 (= e!14228 (validKeyInArray!0 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun bm!1505 () Bool)

(assert (=> bm!1505 (= call!1506 call!1507)))

(declare-fun b!21909 () Bool)

(declare-fun Unit!480 () Unit!462)

(assert (=> b!21909 (= e!14222 Unit!480)))

(declare-fun b!21910 () Bool)

(assert (=> b!21910 (= e!14221 e!14219)))

(declare-fun res!13972 () Bool)

(assert (=> b!21910 (= res!13972 call!1505)))

(assert (=> b!21910 (=> (not res!13972) (not e!14219))))

(declare-fun b!21911 () Bool)

(declare-fun res!13975 () Bool)

(assert (=> b!21911 (=> (not res!13975) (not e!14225))))

(assert (=> b!21911 (= res!13975 e!14221)))

(declare-fun c!2605 () Bool)

(assert (=> b!21911 (= c!2605 (not (= (bvand (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21912 () Bool)

(assert (=> b!21912 (= e!14229 (= (apply!28 lt!7122 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun bm!1506 () Bool)

(assert (=> bm!1506 (= call!1509 call!1508)))

(declare-fun bm!1507 () Bool)

(assert (=> bm!1507 (= call!1510 (contains!224 lt!7122 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3789 c!2603) b!21894))

(assert (= (and d!3789 (not c!2603)) b!21905))

(assert (= (and b!21905 c!2601) b!21895))

(assert (= (and b!21905 (not c!2601)) b!21903))

(assert (= (and b!21903 c!2604) b!21897))

(assert (= (and b!21903 (not c!2604)) b!21907))

(assert (= (or b!21897 b!21907) bm!1505))

(assert (= (or b!21895 bm!1505) bm!1503))

(assert (= (or b!21895 b!21897) bm!1506))

(assert (= (or b!21894 bm!1503) bm!1502))

(assert (= (or b!21894 bm!1506) bm!1504))

(assert (= (and d!3789 res!13969) b!21892))

(assert (= (and d!3789 c!2600) b!21893))

(assert (= (and d!3789 (not c!2600)) b!21909))

(assert (= (and d!3789 res!13967) b!21904))

(assert (= (and b!21904 res!13968) b!21908))

(assert (= (and b!21904 (not res!13970)) b!21896))

(assert (= (and b!21896 res!13973) b!21898))

(assert (= (and b!21904 res!13974) b!21911))

(assert (= (and b!21911 c!2605) b!21910))

(assert (= (and b!21911 (not c!2605)) b!21899))

(assert (= (and b!21910 res!13972) b!21901))

(assert (= (or b!21910 b!21899) bm!1501))

(assert (= (and b!21911 res!13975) b!21902))

(assert (= (and b!21902 c!2602) b!21906))

(assert (= (and b!21902 (not c!2602)) b!21900))

(assert (= (and b!21906 res!13971) b!21912))

(assert (= (or b!21906 b!21900) bm!1507))

(declare-fun b_lambda!1527 () Bool)

(assert (=> (not b_lambda!1527) (not b!21898)))

(assert (=> b!21898 t!3214))

(declare-fun b_and!1433 () Bool)

(assert (= b_and!1431 (and (=> t!3214 result!1069) b_and!1433)))

(declare-fun m!15482 () Bool)

(assert (=> bm!1504 m!15482))

(assert (=> b!21892 m!15254))

(assert (=> b!21892 m!15254))

(assert (=> b!21892 m!15256))

(declare-fun m!15484 () Bool)

(assert (=> b!21912 m!15484))

(assert (=> b!21898 m!15254))

(declare-fun m!15486 () Bool)

(assert (=> b!21898 m!15486))

(assert (=> b!21898 m!15262))

(declare-fun m!15488 () Bool)

(assert (=> b!21898 m!15488))

(assert (=> b!21898 m!15486))

(assert (=> b!21898 m!15254))

(declare-fun m!15490 () Bool)

(assert (=> b!21898 m!15490))

(assert (=> b!21898 m!15262))

(assert (=> d!3789 m!15147))

(assert (=> b!21908 m!15254))

(assert (=> b!21908 m!15254))

(assert (=> b!21908 m!15256))

(declare-fun m!15492 () Bool)

(assert (=> bm!1507 m!15492))

(declare-fun m!15494 () Bool)

(assert (=> b!21894 m!15494))

(declare-fun m!15496 () Bool)

(assert (=> bm!1502 m!15496))

(declare-fun m!15498 () Bool)

(assert (=> b!21901 m!15498))

(declare-fun m!15500 () Bool)

(assert (=> bm!1501 m!15500))

(assert (=> b!21896 m!15254))

(assert (=> b!21896 m!15254))

(declare-fun m!15502 () Bool)

(assert (=> b!21896 m!15502))

(declare-fun m!15504 () Bool)

(assert (=> b!21893 m!15504))

(declare-fun m!15506 () Bool)

(assert (=> b!21893 m!15506))

(assert (=> b!21893 m!15254))

(assert (=> b!21893 m!15506))

(declare-fun m!15508 () Bool)

(assert (=> b!21893 m!15508))

(declare-fun m!15510 () Bool)

(assert (=> b!21893 m!15510))

(declare-fun m!15512 () Bool)

(assert (=> b!21893 m!15512))

(declare-fun m!15514 () Bool)

(assert (=> b!21893 m!15514))

(declare-fun m!15516 () Bool)

(assert (=> b!21893 m!15516))

(declare-fun m!15518 () Bool)

(assert (=> b!21893 m!15518))

(declare-fun m!15520 () Bool)

(assert (=> b!21893 m!15520))

(assert (=> b!21893 m!15510))

(declare-fun m!15522 () Bool)

(assert (=> b!21893 m!15522))

(declare-fun m!15524 () Bool)

(assert (=> b!21893 m!15524))

(assert (=> b!21893 m!15496))

(declare-fun m!15526 () Bool)

(assert (=> b!21893 m!15526))

(declare-fun m!15528 () Bool)

(assert (=> b!21893 m!15528))

(assert (=> b!21893 m!15518))

(declare-fun m!15530 () Bool)

(assert (=> b!21893 m!15530))

(assert (=> b!21893 m!15524))

(declare-fun m!15532 () Bool)

(assert (=> b!21893 m!15532))

(assert (=> b!21538 d!3789))

(declare-fun d!3791 () Bool)

(declare-fun e!14231 () Bool)

(assert (=> d!3791 e!14231))

(declare-fun res!13977 () Bool)

(assert (=> d!3791 (=> (not res!13977) (not e!14231))))

(declare-fun lt!7127 () ListLongMap!557)

(assert (=> d!3791 (= res!13977 (contains!224 lt!7127 (_1!458 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(declare-fun lt!7128 () List!558)

(assert (=> d!3791 (= lt!7127 (ListLongMap!558 lt!7128))))

(declare-fun lt!7129 () Unit!462)

(declare-fun lt!7130 () Unit!462)

(assert (=> d!3791 (= lt!7129 lt!7130)))

(assert (=> d!3791 (= (getValueByKey!60 lt!7128 (_1!458 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))) (Some!65 (_2!458 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(assert (=> d!3791 (= lt!7130 (lemmaContainsTupThenGetReturnValue!17 lt!7128 (_1!458 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) (_2!458 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(assert (=> d!3791 (= lt!7128 (insertStrictlySorted!17 (toList!294 e!14028) (_1!458 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) (_2!458 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(assert (=> d!3791 (= (+!41 e!14028 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) lt!7127)))

(declare-fun b!21913 () Bool)

(declare-fun res!13976 () Bool)

(assert (=> b!21913 (=> (not res!13976) (not e!14231))))

(assert (=> b!21913 (= res!13976 (= (getValueByKey!60 (toList!294 lt!7127) (_1!458 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))) (Some!65 (_2!458 (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))

(declare-fun b!21914 () Bool)

(assert (=> b!21914 (= e!14231 (contains!225 (toList!294 lt!7127) (ite c!2518 (ite c!2516 (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (= (and d!3791 res!13977) b!21913))

(assert (= (and b!21913 res!13976) b!21914))

(declare-fun m!15534 () Bool)

(assert (=> d!3791 m!15534))

(declare-fun m!15536 () Bool)

(assert (=> d!3791 m!15536))

(declare-fun m!15538 () Bool)

(assert (=> d!3791 m!15538))

(declare-fun m!15540 () Bool)

(assert (=> d!3791 m!15540))

(declare-fun m!15542 () Bool)

(assert (=> b!21913 m!15542))

(declare-fun m!15544 () Bool)

(assert (=> b!21914 m!15544))

(assert (=> bm!1433 d!3791))

(assert (=> b!21526 d!3789))

(declare-fun d!3793 () Bool)

(declare-fun res!13978 () Bool)

(declare-fun e!14232 () Bool)

(assert (=> d!3793 (=> (not res!13978) (not e!14232))))

(assert (=> d!3793 (= res!13978 (simpleValid!19 (_2!459 lt!6762)))))

(assert (=> d!3793 (= (valid!108 (_2!459 lt!6762)) e!14232)))

(declare-fun b!21915 () Bool)

(declare-fun res!13979 () Bool)

(assert (=> b!21915 (=> (not res!13979) (not e!14232))))

(assert (=> b!21915 (= res!13979 (= (arrayCountValidKeys!0 (_keys!3139 (_2!459 lt!6762)) #b00000000000000000000000000000000 (size!665 (_keys!3139 (_2!459 lt!6762)))) (_size!133 (_2!459 lt!6762))))))

(declare-fun b!21916 () Bool)

(declare-fun res!13980 () Bool)

(assert (=> b!21916 (=> (not res!13980) (not e!14232))))

(assert (=> b!21916 (= res!13980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (_2!459 lt!6762)) (mask!4691 (_2!459 lt!6762))))))

(declare-fun b!21917 () Bool)

(assert (=> b!21917 (= e!14232 (arrayNoDuplicates!0 (_keys!3139 (_2!459 lt!6762)) #b00000000000000000000000000000000 Nil!556))))

(assert (= (and d!3793 res!13978) b!21915))

(assert (= (and b!21915 res!13979) b!21916))

(assert (= (and b!21916 res!13980) b!21917))

(declare-fun m!15546 () Bool)

(assert (=> d!3793 m!15546))

(declare-fun m!15548 () Bool)

(assert (=> b!21915 m!15548))

(declare-fun m!15550 () Bool)

(assert (=> b!21916 m!15550))

(declare-fun m!15552 () Bool)

(assert (=> b!21917 m!15552))

(assert (=> d!3707 d!3793))

(declare-fun d!3795 () Bool)

(declare-fun res!13981 () Bool)

(declare-fun e!14233 () Bool)

(assert (=> d!3795 (=> (not res!13981) (not e!14233))))

(assert (=> d!3795 (= res!13981 (simpleValid!19 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3795 (= (valid!108 (ite c!2450 (_2!459 lt!6654) lt!6655)) e!14233)))

(declare-fun b!21918 () Bool)

(declare-fun res!13982 () Bool)

(assert (=> b!21918 (=> (not res!13982) (not e!14233))))

(assert (=> b!21918 (= res!13982 (= (arrayCountValidKeys!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (_size!133 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21919 () Bool)

(declare-fun res!13983 () Bool)

(assert (=> b!21919 (=> (not res!13983) (not e!14233))))

(assert (=> b!21919 (= res!13983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21920 () Bool)

(assert (=> b!21920 (= e!14233 (arrayNoDuplicates!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 Nil!556))))

(assert (= (and d!3795 res!13981) b!21918))

(assert (= (and b!21918 res!13982) b!21919))

(assert (= (and b!21919 res!13983) b!21920))

(declare-fun m!15554 () Bool)

(assert (=> d!3795 m!15554))

(declare-fun m!15556 () Bool)

(assert (=> b!21918 m!15556))

(declare-fun m!15558 () Bool)

(assert (=> b!21919 m!15558))

(declare-fun m!15560 () Bool)

(assert (=> b!21920 m!15560))

(assert (=> d!3707 d!3795))

(declare-fun d!3797 () Bool)

(declare-fun e!14235 () Bool)

(assert (=> d!3797 e!14235))

(declare-fun res!13984 () Bool)

(assert (=> d!3797 (=> res!13984 e!14235)))

(declare-fun lt!7134 () Bool)

(assert (=> d!3797 (= res!13984 (not lt!7134))))

(declare-fun lt!7133 () Bool)

(assert (=> d!3797 (= lt!7134 lt!7133)))

(declare-fun lt!7131 () Unit!462)

(declare-fun e!14234 () Unit!462)

(assert (=> d!3797 (= lt!7131 e!14234)))

(declare-fun c!2606 () Bool)

(assert (=> d!3797 (= c!2606 lt!7133)))

(assert (=> d!3797 (= lt!7133 (containsKey!24 (toList!294 lt!6872) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3797 (= (contains!224 lt!6872 #b0000000000000000000000000000000000000000000000000000000000000000) lt!7134)))

(declare-fun b!21921 () Bool)

(declare-fun lt!7132 () Unit!462)

(assert (=> b!21921 (= e!14234 lt!7132)))

(assert (=> b!21921 (= lt!7132 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!294 lt!6872) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21921 (isDefined!22 (getValueByKey!60 (toList!294 lt!6872) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21922 () Bool)

(declare-fun Unit!481 () Unit!462)

(assert (=> b!21922 (= e!14234 Unit!481)))

(declare-fun b!21923 () Bool)

(assert (=> b!21923 (= e!14235 (isDefined!22 (getValueByKey!60 (toList!294 lt!6872) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3797 c!2606) b!21921))

(assert (= (and d!3797 (not c!2606)) b!21922))

(assert (= (and d!3797 (not res!13984)) b!21923))

(declare-fun m!15562 () Bool)

(assert (=> d!3797 m!15562))

(declare-fun m!15564 () Bool)

(assert (=> b!21921 m!15564))

(assert (=> b!21921 m!15474))

(assert (=> b!21921 m!15474))

(declare-fun m!15566 () Bool)

(assert (=> b!21921 m!15566))

(assert (=> b!21923 m!15474))

(assert (=> b!21923 m!15474))

(assert (=> b!21923 m!15566))

(assert (=> bm!1462 d!3797))

(declare-fun b!21924 () Bool)

(declare-fun e!14236 () Bool)

(assert (=> b!21924 (= e!14236 (validKeyInArray!0 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun b!21925 () Bool)

(declare-fun e!14240 () Unit!462)

(declare-fun lt!7136 () Unit!462)

(assert (=> b!21925 (= e!14240 lt!7136)))

(declare-fun lt!7140 () ListLongMap!557)

(assert (=> b!21925 (= lt!7140 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (or c!2504 c!2508) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7138 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7138 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7145 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7145 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7153 () Unit!462)

(assert (=> b!21925 (= lt!7153 (addStillContains!13 lt!7140 lt!7138 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!7145))))

(assert (=> b!21925 (contains!224 (+!41 lt!7140 (tuple2!911 lt!7138 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))) lt!7145)))

(declare-fun lt!7154 () Unit!462)

(assert (=> b!21925 (= lt!7154 lt!7153)))

(declare-fun lt!7135 () ListLongMap!557)

(assert (=> b!21925 (= lt!7135 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (or c!2504 c!2508) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7142 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7142 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7148 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7148 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7141 () Unit!462)

(assert (=> b!21925 (= lt!7141 (addApplyDifferent!13 lt!7135 lt!7142 (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7148))))

(assert (=> b!21925 (= (apply!28 (+!41 lt!7135 (tuple2!911 lt!7142 (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))) lt!7148) (apply!28 lt!7135 lt!7148))))

(declare-fun lt!7137 () Unit!462)

(assert (=> b!21925 (= lt!7137 lt!7141)))

(declare-fun lt!7146 () ListLongMap!557)

(assert (=> b!21925 (= lt!7146 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (or c!2504 c!2508) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7150 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7150 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7144 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7144 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(declare-fun lt!7147 () Unit!462)

(assert (=> b!21925 (= lt!7147 (addApplyDifferent!13 lt!7146 lt!7150 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!7144))))

(assert (=> b!21925 (= (apply!28 (+!41 lt!7146 (tuple2!911 lt!7150 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))) lt!7144) (apply!28 lt!7146 lt!7144))))

(declare-fun lt!7156 () Unit!462)

(assert (=> b!21925 (= lt!7156 lt!7147)))

(declare-fun lt!7149 () ListLongMap!557)

(assert (=> b!21925 (= lt!7149 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (or c!2504 c!2508) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7139 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7139 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7143 () (_ BitVec 64))

(assert (=> b!21925 (= lt!7143 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000))))

(assert (=> b!21925 (= lt!7136 (addApplyDifferent!13 lt!7149 lt!7139 (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7143))))

(assert (=> b!21925 (= (apply!28 (+!41 lt!7149 (tuple2!911 lt!7139 (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))) lt!7143) (apply!28 lt!7149 lt!7143))))

(declare-fun bm!1508 () Bool)

(declare-fun call!1512 () Bool)

(declare-fun lt!7152 () ListLongMap!557)

(assert (=> bm!1508 (= call!1512 (contains!224 lt!7152 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14245 () ListLongMap!557)

(declare-fun b!21926 () Bool)

(declare-fun call!1515 () ListLongMap!557)

(assert (=> b!21926 (= e!14245 (+!41 call!1515 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))))))

(declare-fun b!21927 () Bool)

(declare-fun e!14241 () ListLongMap!557)

(declare-fun call!1516 () ListLongMap!557)

(assert (=> b!21927 (= e!14241 call!1516)))

(declare-fun b!21928 () Bool)

(declare-fun e!14248 () Bool)

(declare-fun e!14242 () Bool)

(assert (=> b!21928 (= e!14248 e!14242)))

(declare-fun res!13991 () Bool)

(assert (=> b!21928 (=> (not res!13991) (not e!14242))))

(assert (=> b!21928 (= res!13991 (contains!224 lt!7152 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)))))

(assert (=> b!21928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21929 () Bool)

(declare-fun e!14244 () ListLongMap!557)

(assert (=> b!21929 (= e!14244 call!1516)))

(declare-fun b!21930 () Bool)

(assert (=> b!21930 (= e!14242 (= (apply!28 lt!7152 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)) (get!377 (select (arr!573 (ite (or c!2504 c!2508) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782)) #b00000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (ite (or c!2504 c!2508) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782))))))

(assert (=> b!21930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21931 () Bool)

(declare-fun e!14239 () Bool)

(assert (=> b!21931 (= e!14239 (not call!1512))))

(declare-fun d!3799 () Bool)

(declare-fun e!14243 () Bool)

(assert (=> d!3799 e!14243))

(declare-fun res!13985 () Bool)

(assert (=> d!3799 (=> (not res!13985) (not e!14243))))

(assert (=> d!3799 (= res!13985 (or (bvsge #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))))

(declare-fun lt!7155 () ListLongMap!557)

(assert (=> d!3799 (= lt!7152 lt!7155)))

(declare-fun lt!7151 () Unit!462)

(assert (=> d!3799 (= lt!7151 e!14240)))

(declare-fun c!2607 () Bool)

(assert (=> d!3799 (= c!2607 e!14236)))

(declare-fun res!13987 () Bool)

(assert (=> d!3799 (=> (not res!13987) (not e!14236))))

(assert (=> d!3799 (= res!13987 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(assert (=> d!3799 (= lt!7155 e!14245)))

(declare-fun c!2610 () Bool)

(assert (=> d!3799 (= c!2610 (and (not (= (bvand (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3799 (validMask!0 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3799 (= (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (or c!2504 c!2508) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7152)))

(declare-fun b!21932 () Bool)

(declare-fun e!14238 () Bool)

(declare-fun call!1517 () Bool)

(assert (=> b!21932 (= e!14238 (not call!1517))))

(declare-fun e!14237 () Bool)

(declare-fun b!21933 () Bool)

(assert (=> b!21933 (= e!14237 (= (apply!28 lt!7152 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!21934 () Bool)

(assert (=> b!21934 (= e!14243 e!14238)))

(declare-fun c!2609 () Bool)

(assert (=> b!21934 (= c!2609 (not (= (bvand (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!2611 () Bool)

(declare-fun b!21935 () Bool)

(assert (=> b!21935 (= c!2611 (and (not (= (bvand (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21935 (= e!14241 e!14244)))

(declare-fun bm!1509 () Bool)

(declare-fun call!1511 () ListLongMap!557)

(assert (=> bm!1509 (= call!1511 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite (or c!2504 c!2508) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6782) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun bm!1510 () Bool)

(declare-fun call!1514 () ListLongMap!557)

(assert (=> bm!1510 (= call!1514 call!1511)))

(declare-fun call!1513 () ListLongMap!557)

(declare-fun c!2608 () Bool)

(declare-fun bm!1511 () Bool)

(assert (=> bm!1511 (= call!1515 (+!41 (ite c!2610 call!1511 (ite c!2608 call!1514 call!1513)) (ite (or c!2610 c!2608) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))))

(declare-fun b!21936 () Bool)

(declare-fun res!13992 () Bool)

(assert (=> b!21936 (=> (not res!13992) (not e!14243))))

(assert (=> b!21936 (= res!13992 e!14248)))

(declare-fun res!13988 () Bool)

(assert (=> b!21936 (=> res!13988 e!14248)))

(declare-fun e!14246 () Bool)

(assert (=> b!21936 (= res!13988 (not e!14246))))

(declare-fun res!13986 () Bool)

(assert (=> b!21936 (=> (not res!13986) (not e!14246))))

(assert (=> b!21936 (= res!13986 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!21937 () Bool)

(assert (=> b!21937 (= e!14245 e!14241)))

(assert (=> b!21937 (= c!2608 (and (not (= (bvand (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21938 () Bool)

(declare-fun e!14247 () Bool)

(assert (=> b!21938 (= e!14238 e!14247)))

(declare-fun res!13989 () Bool)

(assert (=> b!21938 (= res!13989 call!1517)))

(assert (=> b!21938 (=> (not res!13989) (not e!14247))))

(declare-fun b!21939 () Bool)

(assert (=> b!21939 (= e!14244 call!1513)))

(declare-fun b!21940 () Bool)

(assert (=> b!21940 (= e!14246 (validKeyInArray!0 (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000)))))

(declare-fun bm!1512 () Bool)

(assert (=> bm!1512 (= call!1513 call!1514)))

(declare-fun b!21941 () Bool)

(declare-fun Unit!482 () Unit!462)

(assert (=> b!21941 (= e!14240 Unit!482)))

(declare-fun b!21942 () Bool)

(assert (=> b!21942 (= e!14239 e!14237)))

(declare-fun res!13990 () Bool)

(assert (=> b!21942 (= res!13990 call!1512)))

(assert (=> b!21942 (=> (not res!13990) (not e!14237))))

(declare-fun b!21943 () Bool)

(declare-fun res!13993 () Bool)

(assert (=> b!21943 (=> (not res!13993) (not e!14243))))

(assert (=> b!21943 (= res!13993 e!14239)))

(declare-fun c!2612 () Bool)

(assert (=> b!21943 (= c!2612 (not (= (bvand (ite c!2504 (ite c!2502 (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21944 () Bool)

(assert (=> b!21944 (= e!14247 (= (apply!28 lt!7152 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!2504 (ite c!2502 (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun bm!1513 () Bool)

(assert (=> bm!1513 (= call!1516 call!1515)))

(declare-fun bm!1514 () Bool)

(assert (=> bm!1514 (= call!1517 (contains!224 lt!7152 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3799 c!2610) b!21926))

(assert (= (and d!3799 (not c!2610)) b!21937))

(assert (= (and b!21937 c!2608) b!21927))

(assert (= (and b!21937 (not c!2608)) b!21935))

(assert (= (and b!21935 c!2611) b!21929))

(assert (= (and b!21935 (not c!2611)) b!21939))

(assert (= (or b!21929 b!21939) bm!1512))

(assert (= (or b!21927 bm!1512) bm!1510))

(assert (= (or b!21927 b!21929) bm!1513))

(assert (= (or b!21926 bm!1510) bm!1509))

(assert (= (or b!21926 bm!1513) bm!1511))

(assert (= (and d!3799 res!13987) b!21924))

(assert (= (and d!3799 c!2607) b!21925))

(assert (= (and d!3799 (not c!2607)) b!21941))

(assert (= (and d!3799 res!13985) b!21936))

(assert (= (and b!21936 res!13986) b!21940))

(assert (= (and b!21936 (not res!13988)) b!21928))

(assert (= (and b!21928 res!13991) b!21930))

(assert (= (and b!21936 res!13992) b!21943))

(assert (= (and b!21943 c!2612) b!21942))

(assert (= (and b!21943 (not c!2612)) b!21931))

(assert (= (and b!21942 res!13990) b!21933))

(assert (= (or b!21942 b!21931) bm!1508))

(assert (= (and b!21943 res!13993) b!21934))

(assert (= (and b!21934 c!2609) b!21938))

(assert (= (and b!21934 (not c!2609)) b!21932))

(assert (= (and b!21938 res!13989) b!21944))

(assert (= (or b!21938 b!21932) bm!1514))

(declare-fun b_lambda!1529 () Bool)

(assert (=> (not b_lambda!1529) (not b!21930)))

(assert (=> b!21930 t!3214))

(declare-fun b_and!1435 () Bool)

(assert (= b_and!1433 (and (=> t!3214 result!1069) b_and!1435)))

(declare-fun m!15568 () Bool)

(assert (=> bm!1511 m!15568))

(assert (=> b!21924 m!15254))

(assert (=> b!21924 m!15254))

(assert (=> b!21924 m!15256))

(declare-fun m!15570 () Bool)

(assert (=> b!21944 m!15570))

(assert (=> b!21930 m!15254))

(declare-fun m!15572 () Bool)

(assert (=> b!21930 m!15572))

(assert (=> b!21930 m!15262))

(declare-fun m!15574 () Bool)

(assert (=> b!21930 m!15574))

(assert (=> b!21930 m!15572))

(assert (=> b!21930 m!15254))

(declare-fun m!15576 () Bool)

(assert (=> b!21930 m!15576))

(assert (=> b!21930 m!15262))

(assert (=> d!3799 m!15147))

(assert (=> b!21940 m!15254))

(assert (=> b!21940 m!15254))

(assert (=> b!21940 m!15256))

(declare-fun m!15578 () Bool)

(assert (=> bm!1514 m!15578))

(declare-fun m!15580 () Bool)

(assert (=> b!21926 m!15580))

(declare-fun m!15582 () Bool)

(assert (=> bm!1509 m!15582))

(declare-fun m!15584 () Bool)

(assert (=> b!21933 m!15584))

(declare-fun m!15586 () Bool)

(assert (=> bm!1508 m!15586))

(assert (=> b!21928 m!15254))

(assert (=> b!21928 m!15254))

(declare-fun m!15588 () Bool)

(assert (=> b!21928 m!15588))

(declare-fun m!15590 () Bool)

(assert (=> b!21925 m!15590))

(declare-fun m!15592 () Bool)

(assert (=> b!21925 m!15592))

(assert (=> b!21925 m!15254))

(assert (=> b!21925 m!15592))

(declare-fun m!15594 () Bool)

(assert (=> b!21925 m!15594))

(declare-fun m!15596 () Bool)

(assert (=> b!21925 m!15596))

(declare-fun m!15598 () Bool)

(assert (=> b!21925 m!15598))

(declare-fun m!15600 () Bool)

(assert (=> b!21925 m!15600))

(declare-fun m!15602 () Bool)

(assert (=> b!21925 m!15602))

(declare-fun m!15604 () Bool)

(assert (=> b!21925 m!15604))

(declare-fun m!15606 () Bool)

(assert (=> b!21925 m!15606))

(assert (=> b!21925 m!15596))

(declare-fun m!15608 () Bool)

(assert (=> b!21925 m!15608))

(declare-fun m!15610 () Bool)

(assert (=> b!21925 m!15610))

(assert (=> b!21925 m!15582))

(declare-fun m!15612 () Bool)

(assert (=> b!21925 m!15612))

(declare-fun m!15614 () Bool)

(assert (=> b!21925 m!15614))

(assert (=> b!21925 m!15604))

(declare-fun m!15616 () Bool)

(assert (=> b!21925 m!15616))

(assert (=> b!21925 m!15610))

(declare-fun m!15618 () Bool)

(assert (=> b!21925 m!15618))

(assert (=> bm!1406 d!3799))

(declare-fun b!21945 () Bool)

(declare-fun e!14249 () Bool)

(assert (=> b!21945 (= e!14249 (validKeyInArray!0 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)))))

(declare-fun b!21946 () Bool)

(declare-fun e!14253 () Unit!462)

(declare-fun lt!7158 () Unit!462)

(assert (=> b!21946 (= e!14253 lt!7158)))

(declare-fun lt!7162 () ListLongMap!557)

(assert (=> b!21946 (= lt!7162 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (ite (or c!2518 c!2522) (_values!1707 lt!6655) lt!6809) (mask!4691 lt!6655) (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) (zeroValue!1645 lt!6655) (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7160 () (_ BitVec 64))

(assert (=> b!21946 (= lt!7160 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7167 () (_ BitVec 64))

(assert (=> b!21946 (= lt!7167 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(declare-fun lt!7175 () Unit!462)

(assert (=> b!21946 (= lt!7175 (addStillContains!13 lt!7162 lt!7160 (zeroValue!1645 lt!6655) lt!7167))))

(assert (=> b!21946 (contains!224 (+!41 lt!7162 (tuple2!911 lt!7160 (zeroValue!1645 lt!6655))) lt!7167)))

(declare-fun lt!7176 () Unit!462)

(assert (=> b!21946 (= lt!7176 lt!7175)))

(declare-fun lt!7157 () ListLongMap!557)

(assert (=> b!21946 (= lt!7157 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (ite (or c!2518 c!2522) (_values!1707 lt!6655) lt!6809) (mask!4691 lt!6655) (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) (zeroValue!1645 lt!6655) (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7164 () (_ BitVec 64))

(assert (=> b!21946 (= lt!7164 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7170 () (_ BitVec 64))

(assert (=> b!21946 (= lt!7170 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(declare-fun lt!7163 () Unit!462)

(assert (=> b!21946 (= lt!7163 (addApplyDifferent!13 lt!7157 lt!7164 (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)) lt!7170))))

(assert (=> b!21946 (= (apply!28 (+!41 lt!7157 (tuple2!911 lt!7164 (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)))) lt!7170) (apply!28 lt!7157 lt!7170))))

(declare-fun lt!7159 () Unit!462)

(assert (=> b!21946 (= lt!7159 lt!7163)))

(declare-fun lt!7168 () ListLongMap!557)

(assert (=> b!21946 (= lt!7168 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (ite (or c!2518 c!2522) (_values!1707 lt!6655) lt!6809) (mask!4691 lt!6655) (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) (zeroValue!1645 lt!6655) (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7172 () (_ BitVec 64))

(assert (=> b!21946 (= lt!7172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7166 () (_ BitVec 64))

(assert (=> b!21946 (= lt!7166 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(declare-fun lt!7169 () Unit!462)

(assert (=> b!21946 (= lt!7169 (addApplyDifferent!13 lt!7168 lt!7172 (zeroValue!1645 lt!6655) lt!7166))))

(assert (=> b!21946 (= (apply!28 (+!41 lt!7168 (tuple2!911 lt!7172 (zeroValue!1645 lt!6655))) lt!7166) (apply!28 lt!7168 lt!7166))))

(declare-fun lt!7178 () Unit!462)

(assert (=> b!21946 (= lt!7178 lt!7169)))

(declare-fun lt!7171 () ListLongMap!557)

(assert (=> b!21946 (= lt!7171 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (ite (or c!2518 c!2522) (_values!1707 lt!6655) lt!6809) (mask!4691 lt!6655) (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) (zeroValue!1645 lt!6655) (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7161 () (_ BitVec 64))

(assert (=> b!21946 (= lt!7161 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7165 () (_ BitVec 64))

(assert (=> b!21946 (= lt!7165 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000))))

(assert (=> b!21946 (= lt!7158 (addApplyDifferent!13 lt!7171 lt!7161 (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)) lt!7165))))

(assert (=> b!21946 (= (apply!28 (+!41 lt!7171 (tuple2!911 lt!7161 (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)))) lt!7165) (apply!28 lt!7171 lt!7165))))

(declare-fun bm!1515 () Bool)

(declare-fun call!1519 () Bool)

(declare-fun lt!7174 () ListLongMap!557)

(assert (=> bm!1515 (= call!1519 (contains!224 lt!7174 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14258 () ListLongMap!557)

(declare-fun call!1522 () ListLongMap!557)

(declare-fun b!21947 () Bool)

(assert (=> b!21947 (= e!14258 (+!41 call!1522 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)))))))

(declare-fun b!21948 () Bool)

(declare-fun e!14254 () ListLongMap!557)

(declare-fun call!1523 () ListLongMap!557)

(assert (=> b!21948 (= e!14254 call!1523)))

(declare-fun b!21949 () Bool)

(declare-fun e!14261 () Bool)

(declare-fun e!14255 () Bool)

(assert (=> b!21949 (= e!14261 e!14255)))

(declare-fun res!14000 () Bool)

(assert (=> b!21949 (=> (not res!14000) (not e!14255))))

(assert (=> b!21949 (= res!14000 (contains!224 lt!7174 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)))))

(assert (=> b!21949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!21950 () Bool)

(declare-fun e!14257 () ListLongMap!557)

(assert (=> b!21950 (= e!14257 call!1523)))

(declare-fun b!21951 () Bool)

(assert (=> b!21951 (= e!14255 (= (apply!28 lt!7174 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)) (get!377 (select (arr!573 (ite (or c!2518 c!2522) (_values!1707 lt!6655) lt!6809)) #b00000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (ite (or c!2518 c!2522) (_values!1707 lt!6655) lt!6809))))))

(assert (=> b!21951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!21952 () Bool)

(declare-fun e!14252 () Bool)

(assert (=> b!21952 (= e!14252 (not call!1519))))

(declare-fun d!3801 () Bool)

(declare-fun e!14256 () Bool)

(assert (=> d!3801 e!14256))

(declare-fun res!13994 () Bool)

(assert (=> d!3801 (=> (not res!13994) (not e!14256))))

(assert (=> d!3801 (= res!13994 (or (bvsge #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))))

(declare-fun lt!7177 () ListLongMap!557)

(assert (=> d!3801 (= lt!7174 lt!7177)))

(declare-fun lt!7173 () Unit!462)

(assert (=> d!3801 (= lt!7173 e!14253)))

(declare-fun c!2613 () Bool)

(assert (=> d!3801 (= c!2613 e!14249)))

(declare-fun res!13996 () Bool)

(assert (=> d!3801 (=> (not res!13996) (not e!14249))))

(assert (=> d!3801 (= res!13996 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(assert (=> d!3801 (= lt!7177 e!14258)))

(declare-fun c!2616 () Bool)

(assert (=> d!3801 (= c!2616 (and (not (= (bvand (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3801 (validMask!0 (mask!4691 lt!6655))))

(assert (=> d!3801 (= (getCurrentListMap!124 (_keys!3139 lt!6655) (ite (or c!2518 c!2522) (_values!1707 lt!6655) lt!6809) (mask!4691 lt!6655) (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) (zeroValue!1645 lt!6655) (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) lt!7174)))

(declare-fun b!21953 () Bool)

(declare-fun e!14251 () Bool)

(declare-fun call!1524 () Bool)

(assert (=> b!21953 (= e!14251 (not call!1524))))

(declare-fun b!21954 () Bool)

(declare-fun e!14250 () Bool)

(assert (=> b!21954 (= e!14250 (= (apply!28 lt!7174 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 lt!6655)))))

(declare-fun b!21955 () Bool)

(assert (=> b!21955 (= e!14256 e!14251)))

(declare-fun c!2615 () Bool)

(assert (=> b!21955 (= c!2615 (not (= (bvand (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!2617 () Bool)

(declare-fun b!21956 () Bool)

(assert (=> b!21956 (= c!2617 (and (not (= (bvand (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!21956 (= e!14254 e!14257)))

(declare-fun bm!1516 () Bool)

(declare-fun call!1518 () ListLongMap!557)

(assert (=> bm!1516 (= call!1518 (getCurrentListMapNoExtraKeys!13 (_keys!3139 lt!6655) (ite (or c!2518 c!2522) (_values!1707 lt!6655) lt!6809) (mask!4691 lt!6655) (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) (zeroValue!1645 lt!6655) (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun bm!1517 () Bool)

(declare-fun call!1521 () ListLongMap!557)

(assert (=> bm!1517 (= call!1521 call!1518)))

(declare-fun c!2614 () Bool)

(declare-fun call!1520 () ListLongMap!557)

(declare-fun bm!1518 () Bool)

(assert (=> bm!1518 (= call!1522 (+!41 (ite c!2616 call!1518 (ite c!2614 call!1521 call!1520)) (ite (or c!2616 c!2614) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 lt!6655)) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655))))))))

(declare-fun b!21957 () Bool)

(declare-fun res!14001 () Bool)

(assert (=> b!21957 (=> (not res!14001) (not e!14256))))

(assert (=> b!21957 (= res!14001 e!14261)))

(declare-fun res!13997 () Bool)

(assert (=> b!21957 (=> res!13997 e!14261)))

(declare-fun e!14259 () Bool)

(assert (=> b!21957 (= res!13997 (not e!14259))))

(declare-fun res!13995 () Bool)

(assert (=> b!21957 (=> (not res!13995) (not e!14259))))

(assert (=> b!21957 (= res!13995 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!21958 () Bool)

(assert (=> b!21958 (= e!14258 e!14254)))

(assert (=> b!21958 (= c!2614 (and (not (= (bvand (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21959 () Bool)

(declare-fun e!14260 () Bool)

(assert (=> b!21959 (= e!14251 e!14260)))

(declare-fun res!13998 () Bool)

(assert (=> b!21959 (= res!13998 call!1524)))

(assert (=> b!21959 (=> (not res!13998) (not e!14260))))

(declare-fun b!21960 () Bool)

(assert (=> b!21960 (= e!14257 call!1520)))

(declare-fun b!21961 () Bool)

(assert (=> b!21961 (= e!14259 (validKeyInArray!0 (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000)))))

(declare-fun bm!1519 () Bool)

(assert (=> bm!1519 (= call!1520 call!1521)))

(declare-fun b!21962 () Bool)

(declare-fun Unit!483 () Unit!462)

(assert (=> b!21962 (= e!14253 Unit!483)))

(declare-fun b!21963 () Bool)

(assert (=> b!21963 (= e!14252 e!14250)))

(declare-fun res!13999 () Bool)

(assert (=> b!21963 (= res!13999 call!1519)))

(assert (=> b!21963 (=> (not res!13999) (not e!14250))))

(declare-fun b!21964 () Bool)

(declare-fun res!14002 () Bool)

(assert (=> b!21964 (=> (not res!14002) (not e!14256))))

(assert (=> b!21964 (= res!14002 e!14252)))

(declare-fun c!2618 () Bool)

(assert (=> b!21964 (= c!2618 (not (= (bvand (ite c!2518 (ite c!2516 (extraKeys!1621 lt!6655) lt!6790) (extraKeys!1621 lt!6655)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!21965 () Bool)

(assert (=> b!21965 (= e!14260 (= (apply!28 lt!7174 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!2518 (ite c!2516 (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (minValue!1645 lt!6655))))))

(declare-fun bm!1520 () Bool)

(assert (=> bm!1520 (= call!1523 call!1522)))

(declare-fun bm!1521 () Bool)

(assert (=> bm!1521 (= call!1524 (contains!224 lt!7174 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3801 c!2616) b!21947))

(assert (= (and d!3801 (not c!2616)) b!21958))

(assert (= (and b!21958 c!2614) b!21948))

(assert (= (and b!21958 (not c!2614)) b!21956))

(assert (= (and b!21956 c!2617) b!21950))

(assert (= (and b!21956 (not c!2617)) b!21960))

(assert (= (or b!21950 b!21960) bm!1519))

(assert (= (or b!21948 bm!1519) bm!1517))

(assert (= (or b!21948 b!21950) bm!1520))

(assert (= (or b!21947 bm!1517) bm!1516))

(assert (= (or b!21947 bm!1520) bm!1518))

(assert (= (and d!3801 res!13996) b!21945))

(assert (= (and d!3801 c!2613) b!21946))

(assert (= (and d!3801 (not c!2613)) b!21962))

(assert (= (and d!3801 res!13994) b!21957))

(assert (= (and b!21957 res!13995) b!21961))

(assert (= (and b!21957 (not res!13997)) b!21949))

(assert (= (and b!21949 res!14000) b!21951))

(assert (= (and b!21957 res!14001) b!21964))

(assert (= (and b!21964 c!2618) b!21963))

(assert (= (and b!21964 (not c!2618)) b!21952))

(assert (= (and b!21963 res!13999) b!21954))

(assert (= (or b!21963 b!21952) bm!1515))

(assert (= (and b!21964 res!14002) b!21955))

(assert (= (and b!21955 c!2615) b!21959))

(assert (= (and b!21955 (not c!2615)) b!21953))

(assert (= (and b!21959 res!13998) b!21965))

(assert (= (or b!21959 b!21953) bm!1521))

(declare-fun b_lambda!1531 () Bool)

(assert (=> (not b_lambda!1531) (not b!21951)))

(assert (=> b!21951 t!3216))

(declare-fun b_and!1437 () Bool)

(assert (= b_and!1435 (and (=> t!3216 result!1071) b_and!1437)))

(declare-fun m!15620 () Bool)

(assert (=> bm!1518 m!15620))

(assert (=> b!21945 m!15314))

(assert (=> b!21945 m!15314))

(assert (=> b!21945 m!15316))

(declare-fun m!15622 () Bool)

(assert (=> b!21965 m!15622))

(assert (=> b!21951 m!15314))

(declare-fun m!15624 () Bool)

(assert (=> b!21951 m!15624))

(assert (=> b!21951 m!15322))

(declare-fun m!15626 () Bool)

(assert (=> b!21951 m!15626))

(assert (=> b!21951 m!15624))

(assert (=> b!21951 m!15314))

(declare-fun m!15628 () Bool)

(assert (=> b!21951 m!15628))

(assert (=> b!21951 m!15322))

(assert (=> d!3801 m!15163))

(assert (=> b!21961 m!15314))

(assert (=> b!21961 m!15314))

(assert (=> b!21961 m!15316))

(declare-fun m!15630 () Bool)

(assert (=> bm!1521 m!15630))

(declare-fun m!15632 () Bool)

(assert (=> b!21947 m!15632))

(declare-fun m!15634 () Bool)

(assert (=> bm!1516 m!15634))

(declare-fun m!15636 () Bool)

(assert (=> b!21954 m!15636))

(declare-fun m!15638 () Bool)

(assert (=> bm!1515 m!15638))

(assert (=> b!21949 m!15314))

(assert (=> b!21949 m!15314))

(declare-fun m!15640 () Bool)

(assert (=> b!21949 m!15640))

(declare-fun m!15642 () Bool)

(assert (=> b!21946 m!15642))

(declare-fun m!15644 () Bool)

(assert (=> b!21946 m!15644))

(assert (=> b!21946 m!15314))

(assert (=> b!21946 m!15644))

(declare-fun m!15646 () Bool)

(assert (=> b!21946 m!15646))

(declare-fun m!15648 () Bool)

(assert (=> b!21946 m!15648))

(declare-fun m!15650 () Bool)

(assert (=> b!21946 m!15650))

(declare-fun m!15652 () Bool)

(assert (=> b!21946 m!15652))

(declare-fun m!15654 () Bool)

(assert (=> b!21946 m!15654))

(declare-fun m!15656 () Bool)

(assert (=> b!21946 m!15656))

(declare-fun m!15658 () Bool)

(assert (=> b!21946 m!15658))

(assert (=> b!21946 m!15648))

(declare-fun m!15660 () Bool)

(assert (=> b!21946 m!15660))

(declare-fun m!15662 () Bool)

(assert (=> b!21946 m!15662))

(assert (=> b!21946 m!15634))

(declare-fun m!15664 () Bool)

(assert (=> b!21946 m!15664))

(declare-fun m!15666 () Bool)

(assert (=> b!21946 m!15666))

(assert (=> b!21946 m!15656))

(declare-fun m!15668 () Bool)

(assert (=> b!21946 m!15668))

(assert (=> b!21946 m!15662))

(declare-fun m!15670 () Bool)

(assert (=> b!21946 m!15670))

(assert (=> bm!1430 d!3801))

(declare-fun d!3803 () Bool)

(declare-fun e!14262 () Bool)

(assert (=> d!3803 e!14262))

(declare-fun res!14004 () Bool)

(assert (=> d!3803 (=> (not res!14004) (not e!14262))))

(declare-fun lt!7179 () ListLongMap!557)

(assert (=> d!3803 (= res!14004 (contains!224 lt!7179 (_1!458 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))

(declare-fun lt!7180 () List!558)

(assert (=> d!3803 (= lt!7179 (ListLongMap!558 lt!7180))))

(declare-fun lt!7181 () Unit!462)

(declare-fun lt!7182 () Unit!462)

(assert (=> d!3803 (= lt!7181 lt!7182)))

(assert (=> d!3803 (= (getValueByKey!60 lt!7180 (_1!458 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))) (Some!65 (_2!458 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))

(assert (=> d!3803 (= lt!7182 (lemmaContainsTupThenGetReturnValue!17 lt!7180 (_1!458 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (_2!458 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))

(assert (=> d!3803 (= lt!7180 (insertStrictlySorted!17 (toList!294 call!1425) (_1!458 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (_2!458 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))

(assert (=> d!3803 (= (+!41 call!1425 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) lt!7179)))

(declare-fun b!21966 () Bool)

(declare-fun res!14003 () Bool)

(assert (=> b!21966 (=> (not res!14003) (not e!14262))))

(assert (=> b!21966 (= res!14003 (= (getValueByKey!60 (toList!294 lt!7179) (_1!458 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))) (Some!65 (_2!458 (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))))

(declare-fun b!21967 () Bool)

(assert (=> b!21967 (= e!14262 (contains!225 (toList!294 lt!7179) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(assert (= (and d!3803 res!14004) b!21966))

(assert (= (and b!21966 res!14003) b!21967))

(declare-fun m!15672 () Bool)

(assert (=> d!3803 m!15672))

(declare-fun m!15674 () Bool)

(assert (=> d!3803 m!15674))

(declare-fun m!15676 () Bool)

(assert (=> d!3803 m!15676))

(declare-fun m!15678 () Bool)

(assert (=> d!3803 m!15678))

(declare-fun m!15680 () Bool)

(assert (=> b!21966 m!15680))

(declare-fun m!15682 () Bool)

(assert (=> b!21967 m!15682))

(assert (=> b!21523 d!3803))

(declare-fun d!3805 () Bool)

(declare-fun e!14264 () Bool)

(assert (=> d!3805 e!14264))

(declare-fun res!14005 () Bool)

(assert (=> d!3805 (=> res!14005 e!14264)))

(declare-fun lt!7186 () Bool)

(assert (=> d!3805 (= res!14005 (not lt!7186))))

(declare-fun lt!7185 () Bool)

(assert (=> d!3805 (= lt!7186 lt!7185)))

(declare-fun lt!7183 () Unit!462)

(declare-fun e!14263 () Unit!462)

(assert (=> d!3805 (= lt!7183 e!14263)))

(declare-fun c!2619 () Bool)

(assert (=> d!3805 (= c!2619 lt!7185)))

(assert (=> d!3805 (= lt!7185 (containsKey!24 (toList!294 lt!6872) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3805 (= (contains!224 lt!6872 #b1000000000000000000000000000000000000000000000000000000000000000) lt!7186)))

(declare-fun b!21968 () Bool)

(declare-fun lt!7184 () Unit!462)

(assert (=> b!21968 (= e!14263 lt!7184)))

(assert (=> b!21968 (= lt!7184 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!294 lt!6872) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21968 (isDefined!22 (getValueByKey!60 (toList!294 lt!6872) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21969 () Bool)

(declare-fun Unit!484 () Unit!462)

(assert (=> b!21969 (= e!14263 Unit!484)))

(declare-fun b!21970 () Bool)

(assert (=> b!21970 (= e!14264 (isDefined!22 (getValueByKey!60 (toList!294 lt!6872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3805 c!2619) b!21968))

(assert (= (and d!3805 (not c!2619)) b!21969))

(assert (= (and d!3805 (not res!14005)) b!21970))

(declare-fun m!15684 () Bool)

(assert (=> d!3805 m!15684))

(declare-fun m!15686 () Bool)

(assert (=> b!21968 m!15686))

(declare-fun m!15688 () Bool)

(assert (=> b!21968 m!15688))

(assert (=> b!21968 m!15688))

(declare-fun m!15690 () Bool)

(assert (=> b!21968 m!15690))

(assert (=> b!21970 m!15688))

(assert (=> b!21970 m!15688))

(assert (=> b!21970 m!15690))

(assert (=> bm!1468 d!3805))

(declare-fun d!3807 () Bool)

(assert (=> d!3807 (= (apply!28 lt!6872 #b1000000000000000000000000000000000000000000000000000000000000000) (get!378 (getValueByKey!60 (toList!294 lt!6872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!916 () Bool)

(assert (= bs!916 d!3807))

(assert (=> bs!916 m!15688))

(assert (=> bs!916 m!15688))

(declare-fun m!15692 () Bool)

(assert (=> bs!916 m!15692))

(assert (=> b!21660 d!3807))

(declare-fun bm!1530 () Bool)

(declare-fun lt!7263 () SeekEntryResult!51)

(declare-fun c!2631 () Bool)

(declare-fun lt!7273 () SeekEntryResult!51)

(declare-fun call!1535 () Bool)

(declare-fun c!2629 () Bool)

(assert (=> bm!1530 (= call!1535 (inRange!0 (ite c!2631 (index!2325 lt!7273) (ite c!2629 (index!2324 lt!7263) (index!2327 lt!7263))) (mask!4691 lt!6655)))))

(declare-fun b!22005 () Bool)

(declare-fun res!14026 () Bool)

(assert (=> b!22005 (= res!14026 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2327 lt!7263)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14287 () Bool)

(assert (=> b!22005 (=> (not res!14026) (not e!14287))))

(declare-fun b!22006 () Bool)

(declare-fun res!14030 () Bool)

(declare-fun e!14284 () Bool)

(assert (=> b!22006 (=> (not res!14030) (not e!14284))))

(declare-fun lt!7257 () tuple2!912)

(assert (=> b!22006 (= res!14030 (contains!224 (map!397 (_2!459 lt!7257)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22007 () Bool)

(declare-fun call!1536 () Bool)

(assert (=> b!22007 (= e!14287 (not call!1536))))

(declare-fun b!22008 () Bool)

(declare-fun e!14288 () Bool)

(assert (=> b!22008 (= e!14288 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2325 lt!7273)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22009 () Bool)

(assert (=> b!22009 (= e!14284 (= (map!397 (_2!459 lt!7257)) (+!41 (map!397 lt!6655) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun d!3809 () Bool)

(assert (=> d!3809 e!14284))

(declare-fun res!14031 () Bool)

(assert (=> d!3809 (=> (not res!14031) (not e!14284))))

(assert (=> d!3809 (= res!14031 (_1!459 lt!7257))))

(assert (=> d!3809 (= lt!7257 (tuple2!913 true (LongMapFixedSize!185 (defaultEntry!1718 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (bvadd (_size!133 lt!6655) #b00000000000000000000000000000001) (array!1208 (store (arr!572 (_keys!3139 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!665 (_keys!3139 lt!6655))) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655))) (_vacant!133 lt!6655))))))

(declare-fun lt!7248 () Unit!462)

(declare-fun lt!7250 () Unit!462)

(assert (=> d!3809 (= lt!7248 lt!7250)))

(declare-fun lt!7247 () array!1207)

(declare-fun lt!7267 () array!1209)

(assert (=> d!3809 (contains!224 (getCurrentListMap!124 lt!7247 lt!7267 (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) (select (store (arr!572 (_keys!3139 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799))))))

(assert (=> d!3809 (= lt!7250 (lemmaValidKeyInArrayIsInListMap!7 lt!7247 lt!7267 (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) (defaultEntry!1718 lt!6655)))))

(assert (=> d!3809 (= lt!7267 (array!1210 (store (arr!573 (_values!1707 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655))))))

(assert (=> d!3809 (= lt!7247 (array!1208 (store (arr!572 (_keys!3139 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!665 (_keys!3139 lt!6655))))))

(declare-fun lt!7253 () Unit!462)

(declare-fun lt!7276 () Unit!462)

(assert (=> d!3809 (= lt!7253 lt!7276)))

(declare-fun lt!7270 () array!1207)

(assert (=> d!3809 (= (arrayCountValidKeys!0 lt!7270 (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) (bvadd (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!1207 (_ BitVec 32)) Unit!462)

(assert (=> d!3809 (= lt!7276 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!7270 (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799))))))

(assert (=> d!3809 (= lt!7270 (array!1208 (store (arr!572 (_keys!3139 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!665 (_keys!3139 lt!6655))))))

(declare-fun lt!7272 () Unit!462)

(declare-fun lt!7254 () Unit!462)

(assert (=> d!3809 (= lt!7272 lt!7254)))

(declare-fun lt!7259 () array!1207)

(assert (=> d!3809 (arrayContainsKey!0 lt!7259 #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!3809 (= lt!7254 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!7259 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799))))))

(assert (=> d!3809 (= lt!7259 (array!1208 (store (arr!572 (_keys!3139 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!665 (_keys!3139 lt!6655))))))

(declare-fun lt!7264 () Unit!462)

(declare-fun lt!7249 () Unit!462)

(assert (=> d!3809 (= lt!7264 lt!7249)))

(assert (=> d!3809 (= (+!41 (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (getCurrentListMap!124 (array!1208 (store (arr!572 (_keys!3139 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!665 (_keys!3139 lt!6655))) (array!1210 (store (arr!573 (_values!1707 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) (ValueCellFull!299 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (size!666 (_values!1707 lt!6655))) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!2 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 32) (_ BitVec 64) V!1155 Int) Unit!462)

(assert (=> d!3809 (= lt!7249 (lemmaAddValidKeyToArrayThenAddPairToListMap!2 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7262 () Unit!462)

(declare-fun lt!7265 () Unit!462)

(assert (=> d!3809 (= lt!7262 lt!7265)))

(assert (=> d!3809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!1208 (store (arr!572 (_keys!3139 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!665 (_keys!3139 lt!6655))) (mask!4691 lt!6655))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!1207 (_ BitVec 32) (_ BitVec 32)) Unit!462)

(assert (=> d!3809 (= lt!7265 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 lt!6655) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) (mask!4691 lt!6655)))))

(declare-fun lt!7252 () Unit!462)

(declare-fun lt!7274 () Unit!462)

(assert (=> d!3809 (= lt!7252 lt!7274)))

(assert (=> d!3809 (= (arrayCountValidKeys!0 (array!1208 (store (arr!572 (_keys!3139 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!665 (_keys!3139 lt!6655))) #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))) (bvadd (arrayCountValidKeys!0 (_keys!3139 lt!6655) #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!1207 (_ BitVec 32) (_ BitVec 64)) Unit!462)

(assert (=> d!3809 (= lt!7274 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3139 lt!6655) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!7255 () Unit!462)

(declare-fun lt!7269 () Unit!462)

(assert (=> d!3809 (= lt!7255 lt!7269)))

(declare-fun lt!7271 () (_ BitVec 32))

(declare-fun lt!7258 () List!559)

(assert (=> d!3809 (arrayNoDuplicates!0 (array!1208 (store (arr!572 (_keys!3139 lt!6655)) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) #b0000000000000000000000000000000000000000000000000000000000000000) (size!665 (_keys!3139 lt!6655))) lt!7271 lt!7258)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!1207 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!559) Unit!462)

(assert (=> d!3809 (= lt!7269 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3139 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799)) lt!7271 lt!7258))))

(assert (=> d!3809 (= lt!7258 Nil!556)))

(assert (=> d!3809 (= lt!7271 #b00000000000000000000000000000000)))

(declare-fun lt!7268 () Unit!462)

(declare-fun e!14281 () Unit!462)

(assert (=> d!3809 (= lt!7268 e!14281)))

(declare-fun c!2628 () Bool)

(assert (=> d!3809 (= c!2628 (arrayContainsKey!0 (_keys!3139 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun lt!7260 () Unit!462)

(declare-fun e!14282 () Unit!462)

(assert (=> d!3809 (= lt!7260 e!14282)))

(assert (=> d!3809 (= c!2631 (contains!224 (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3809 (valid!108 lt!6655)))

(assert (=> d!3809 (= (updateHelperNewKey!7 lt!6655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2517 (index!2327 lt!6799) (index!2324 lt!6799))) lt!7257)))

(declare-fun bm!1531 () Bool)

(declare-fun call!1534 () Bool)

(assert (=> bm!1531 (= call!1534 call!1535)))

(declare-fun b!22010 () Bool)

(declare-fun res!14025 () Bool)

(assert (=> b!22010 (= res!14025 call!1535)))

(assert (=> b!22010 (=> (not res!14025) (not e!14288))))

(declare-fun b!22011 () Bool)

(declare-fun e!14283 () Bool)

(assert (=> b!22011 (= e!14283 e!14287)))

(declare-fun res!14024 () Bool)

(assert (=> b!22011 (= res!14024 call!1534)))

(assert (=> b!22011 (=> (not res!14024) (not e!14287))))

(declare-fun b!22012 () Bool)

(declare-fun Unit!485 () Unit!462)

(assert (=> b!22012 (= e!14281 Unit!485)))

(declare-fun lt!7261 () Unit!462)

(declare-fun lemmaArrayContainsKeyThenInListMap!2 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) (_ BitVec 32) Int) Unit!462)

(assert (=> b!22012 (= lt!7261 (lemmaArrayContainsKeyThenInListMap!2 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(assert (=> b!22012 (contains!224 (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7266 () Unit!462)

(assert (=> b!22012 (= lt!7266 lt!7261)))

(assert (=> b!22012 false))

(declare-fun b!22013 () Bool)

(declare-fun c!2630 () Bool)

(assert (=> b!22013 (= c!2630 ((_ is MissingVacant!51) lt!7263))))

(declare-fun e!14285 () Bool)

(assert (=> b!22013 (= e!14285 e!14283)))

(declare-fun b!22014 () Bool)

(declare-fun res!14027 () Bool)

(assert (=> b!22014 (=> (not res!14027) (not e!14284))))

(assert (=> b!22014 (= res!14027 (valid!108 (_2!459 lt!7257)))))

(declare-fun b!22015 () Bool)

(declare-fun res!14028 () Bool)

(declare-fun e!14286 () Bool)

(assert (=> b!22015 (=> (not res!14028) (not e!14286))))

(assert (=> b!22015 (= res!14028 call!1534)))

(assert (=> b!22015 (= e!14285 e!14286)))

(declare-fun b!22016 () Bool)

(declare-fun Unit!486 () Unit!462)

(assert (=> b!22016 (= e!14282 Unit!486)))

(declare-fun lt!7251 () Unit!462)

(assert (=> b!22016 (= lt!7251 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun call!1533 () SeekEntryResult!51)

(assert (=> b!22016 (= lt!7273 call!1533)))

(declare-fun res!14029 () Bool)

(assert (=> b!22016 (= res!14029 ((_ is Found!51) lt!7273))))

(assert (=> b!22016 (=> (not res!14029) (not e!14288))))

(assert (=> b!22016 e!14288))

(declare-fun lt!7256 () Unit!462)

(assert (=> b!22016 (= lt!7256 lt!7251)))

(assert (=> b!22016 false))

(declare-fun bm!1532 () Bool)

(assert (=> bm!1532 (= call!1536 (arrayContainsKey!0 (_keys!3139 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!22017 () Bool)

(declare-fun Unit!487 () Unit!462)

(assert (=> b!22017 (= e!14281 Unit!487)))

(declare-fun b!22018 () Bool)

(declare-fun res!14032 () Bool)

(assert (=> b!22018 (=> (not res!14032) (not e!14286))))

(assert (=> b!22018 (= res!14032 (= (select (arr!572 (_keys!3139 lt!6655)) (index!2324 lt!7263)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22019 () Bool)

(assert (=> b!22019 (= e!14286 (not call!1536))))

(declare-fun bm!1533 () Bool)

(assert (=> bm!1533 (= call!1533 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3139 lt!6655) (mask!4691 lt!6655)))))

(declare-fun b!22020 () Bool)

(declare-fun lt!7275 () Unit!462)

(assert (=> b!22020 (= e!14282 lt!7275)))

(assert (=> b!22020 (= lt!7275 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(assert (=> b!22020 (= lt!7263 call!1533)))

(assert (=> b!22020 (= c!2629 ((_ is MissingZero!51) lt!7263))))

(assert (=> b!22020 e!14285))

(declare-fun b!22021 () Bool)

(assert (=> b!22021 (= e!14283 ((_ is Undefined!51) lt!7263))))

(assert (= (and d!3809 c!2631) b!22016))

(assert (= (and d!3809 (not c!2631)) b!22020))

(assert (= (and b!22016 res!14029) b!22010))

(assert (= (and b!22010 res!14025) b!22008))

(assert (= (and b!22020 c!2629) b!22015))

(assert (= (and b!22020 (not c!2629)) b!22013))

(assert (= (and b!22015 res!14028) b!22018))

(assert (= (and b!22018 res!14032) b!22019))

(assert (= (and b!22013 c!2630) b!22011))

(assert (= (and b!22013 (not c!2630)) b!22021))

(assert (= (and b!22011 res!14024) b!22005))

(assert (= (and b!22005 res!14026) b!22007))

(assert (= (or b!22015 b!22011) bm!1531))

(assert (= (or b!22019 b!22007) bm!1532))

(assert (= (or b!22010 bm!1531) bm!1530))

(assert (= (or b!22016 b!22020) bm!1533))

(assert (= (and d!3809 c!2628) b!22012))

(assert (= (and d!3809 (not c!2628)) b!22017))

(assert (= (and d!3809 res!14031) b!22014))

(assert (= (and b!22014 res!14027) b!22006))

(assert (= (and b!22006 res!14030) b!22009))

(declare-fun m!15694 () Bool)

(assert (=> b!22006 m!15694))

(assert (=> b!22006 m!15694))

(declare-fun m!15696 () Bool)

(assert (=> b!22006 m!15696))

(declare-fun m!15698 () Bool)

(assert (=> b!22008 m!15698))

(assert (=> b!22016 m!14985))

(declare-fun m!15700 () Bool)

(assert (=> b!22012 m!15700))

(assert (=> b!22012 m!15007))

(assert (=> b!22012 m!15007))

(declare-fun m!15702 () Bool)

(assert (=> b!22012 m!15702))

(declare-fun m!15704 () Bool)

(assert (=> b!22018 m!15704))

(assert (=> b!22009 m!15694))

(assert (=> b!22009 m!15035))

(assert (=> b!22009 m!15035))

(declare-fun m!15706 () Bool)

(assert (=> b!22009 m!15706))

(assert (=> b!22020 m!15027))

(declare-fun m!15708 () Bool)

(assert (=> b!22014 m!15708))

(assert (=> d!3809 m!15007))

(assert (=> d!3809 m!15702))

(declare-fun m!15710 () Bool)

(assert (=> d!3809 m!15710))

(declare-fun m!15712 () Bool)

(assert (=> d!3809 m!15712))

(declare-fun m!15714 () Bool)

(assert (=> d!3809 m!15714))

(declare-fun m!15716 () Bool)

(assert (=> d!3809 m!15716))

(declare-fun m!15718 () Bool)

(assert (=> d!3809 m!15718))

(declare-fun m!15720 () Bool)

(assert (=> d!3809 m!15720))

(declare-fun m!15722 () Bool)

(assert (=> d!3809 m!15722))

(declare-fun m!15724 () Bool)

(assert (=> d!3809 m!15724))

(assert (=> d!3809 m!15041))

(declare-fun m!15726 () Bool)

(assert (=> d!3809 m!15726))

(declare-fun m!15728 () Bool)

(assert (=> d!3809 m!15728))

(assert (=> d!3809 m!15007))

(declare-fun m!15730 () Bool)

(assert (=> d!3809 m!15730))

(declare-fun m!15732 () Bool)

(assert (=> d!3809 m!15732))

(declare-fun m!15734 () Bool)

(assert (=> d!3809 m!15734))

(assert (=> d!3809 m!15039))

(declare-fun m!15736 () Bool)

(assert (=> d!3809 m!15736))

(declare-fun m!15738 () Bool)

(assert (=> d!3809 m!15738))

(assert (=> d!3809 m!15716))

(declare-fun m!15740 () Bool)

(assert (=> d!3809 m!15740))

(declare-fun m!15742 () Bool)

(assert (=> d!3809 m!15742))

(assert (=> d!3809 m!15738))

(declare-fun m!15744 () Bool)

(assert (=> d!3809 m!15744))

(declare-fun m!15746 () Bool)

(assert (=> d!3809 m!15746))

(assert (=> d!3809 m!15007))

(assert (=> d!3809 m!15206))

(declare-fun m!15748 () Bool)

(assert (=> bm!1530 m!15748))

(assert (=> bm!1533 m!15001))

(declare-fun m!15750 () Bool)

(assert (=> b!22005 m!15750))

(assert (=> bm!1532 m!15041))

(assert (=> bm!1445 d!3809))

(declare-fun d!3811 () Bool)

(declare-fun e!14290 () Bool)

(assert (=> d!3811 e!14290))

(declare-fun res!14033 () Bool)

(assert (=> d!3811 (=> res!14033 e!14290)))

(declare-fun lt!7280 () Bool)

(assert (=> d!3811 (= res!14033 (not lt!7280))))

(declare-fun lt!7279 () Bool)

(assert (=> d!3811 (= lt!7280 lt!7279)))

(declare-fun lt!7277 () Unit!462)

(declare-fun e!14289 () Unit!462)

(assert (=> d!3811 (= lt!7277 e!14289)))

(declare-fun c!2632 () Bool)

(assert (=> d!3811 (= c!2632 lt!7279)))

(assert (=> d!3811 (= lt!7279 (containsKey!24 (toList!294 e!14022) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3811 (= (contains!224 e!14022 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) lt!7280)))

(declare-fun b!22022 () Bool)

(declare-fun lt!7278 () Unit!462)

(assert (=> b!22022 (= e!14289 lt!7278)))

(assert (=> b!22022 (= lt!7278 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!294 e!14022) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22022 (isDefined!22 (getValueByKey!60 (toList!294 e!14022) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!22023 () Bool)

(declare-fun Unit!488 () Unit!462)

(assert (=> b!22023 (= e!14289 Unit!488)))

(declare-fun b!22024 () Bool)

(assert (=> b!22024 (= e!14290 (isDefined!22 (getValueByKey!60 (toList!294 e!14022) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!3811 c!2632) b!22022))

(assert (= (and d!3811 (not c!2632)) b!22023))

(assert (= (and d!3811 (not res!14033)) b!22024))

(declare-fun m!15752 () Bool)

(assert (=> d!3811 m!15752))

(declare-fun m!15754 () Bool)

(assert (=> b!22022 m!15754))

(declare-fun m!15756 () Bool)

(assert (=> b!22022 m!15756))

(assert (=> b!22022 m!15756))

(declare-fun m!15758 () Bool)

(assert (=> b!22022 m!15758))

(assert (=> b!22024 m!15756))

(assert (=> b!22024 m!15756))

(assert (=> b!22024 m!15758))

(assert (=> bm!1414 d!3811))

(declare-fun b!22025 () Bool)

(declare-fun e!14291 () Bool)

(assert (=> b!22025 (= e!14291 (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000)))))

(declare-fun b!22026 () Bool)

(declare-fun e!14295 () Unit!462)

(declare-fun lt!7282 () Unit!462)

(assert (=> b!22026 (= e!14295 lt!7282)))

(declare-fun lt!7286 () ListLongMap!557)

(assert (=> b!22026 (= lt!7286 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (_2!457 lt!6660))) (_values!1707 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660))) (extraKeys!1621 (v!1571 (_2!457 lt!6660))) (zeroValue!1645 (v!1571 (_2!457 lt!6660))) (minValue!1645 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1571 (_2!457 lt!6660)))))))

(declare-fun lt!7284 () (_ BitVec 64))

(assert (=> b!22026 (= lt!7284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7291 () (_ BitVec 64))

(assert (=> b!22026 (= lt!7291 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000))))

(declare-fun lt!7299 () Unit!462)

(assert (=> b!22026 (= lt!7299 (addStillContains!13 lt!7286 lt!7284 (zeroValue!1645 (v!1571 (_2!457 lt!6660))) lt!7291))))

(assert (=> b!22026 (contains!224 (+!41 lt!7286 (tuple2!911 lt!7284 (zeroValue!1645 (v!1571 (_2!457 lt!6660))))) lt!7291)))

(declare-fun lt!7300 () Unit!462)

(assert (=> b!22026 (= lt!7300 lt!7299)))

(declare-fun lt!7281 () ListLongMap!557)

(assert (=> b!22026 (= lt!7281 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (_2!457 lt!6660))) (_values!1707 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660))) (extraKeys!1621 (v!1571 (_2!457 lt!6660))) (zeroValue!1645 (v!1571 (_2!457 lt!6660))) (minValue!1645 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1571 (_2!457 lt!6660)))))))

(declare-fun lt!7288 () (_ BitVec 64))

(assert (=> b!22026 (= lt!7288 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7294 () (_ BitVec 64))

(assert (=> b!22026 (= lt!7294 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000))))

(declare-fun lt!7287 () Unit!462)

(assert (=> b!22026 (= lt!7287 (addApplyDifferent!13 lt!7281 lt!7288 (minValue!1645 (v!1571 (_2!457 lt!6660))) lt!7294))))

(assert (=> b!22026 (= (apply!28 (+!41 lt!7281 (tuple2!911 lt!7288 (minValue!1645 (v!1571 (_2!457 lt!6660))))) lt!7294) (apply!28 lt!7281 lt!7294))))

(declare-fun lt!7283 () Unit!462)

(assert (=> b!22026 (= lt!7283 lt!7287)))

(declare-fun lt!7292 () ListLongMap!557)

(assert (=> b!22026 (= lt!7292 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (_2!457 lt!6660))) (_values!1707 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660))) (extraKeys!1621 (v!1571 (_2!457 lt!6660))) (zeroValue!1645 (v!1571 (_2!457 lt!6660))) (minValue!1645 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1571 (_2!457 lt!6660)))))))

(declare-fun lt!7296 () (_ BitVec 64))

(assert (=> b!22026 (= lt!7296 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7290 () (_ BitVec 64))

(assert (=> b!22026 (= lt!7290 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000))))

(declare-fun lt!7293 () Unit!462)

(assert (=> b!22026 (= lt!7293 (addApplyDifferent!13 lt!7292 lt!7296 (zeroValue!1645 (v!1571 (_2!457 lt!6660))) lt!7290))))

(assert (=> b!22026 (= (apply!28 (+!41 lt!7292 (tuple2!911 lt!7296 (zeroValue!1645 (v!1571 (_2!457 lt!6660))))) lt!7290) (apply!28 lt!7292 lt!7290))))

(declare-fun lt!7302 () Unit!462)

(assert (=> b!22026 (= lt!7302 lt!7293)))

(declare-fun lt!7295 () ListLongMap!557)

(assert (=> b!22026 (= lt!7295 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (_2!457 lt!6660))) (_values!1707 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660))) (extraKeys!1621 (v!1571 (_2!457 lt!6660))) (zeroValue!1645 (v!1571 (_2!457 lt!6660))) (minValue!1645 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1571 (_2!457 lt!6660)))))))

(declare-fun lt!7285 () (_ BitVec 64))

(assert (=> b!22026 (= lt!7285 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7289 () (_ BitVec 64))

(assert (=> b!22026 (= lt!7289 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000))))

(assert (=> b!22026 (= lt!7282 (addApplyDifferent!13 lt!7295 lt!7285 (minValue!1645 (v!1571 (_2!457 lt!6660))) lt!7289))))

(assert (=> b!22026 (= (apply!28 (+!41 lt!7295 (tuple2!911 lt!7285 (minValue!1645 (v!1571 (_2!457 lt!6660))))) lt!7289) (apply!28 lt!7295 lt!7289))))

(declare-fun bm!1534 () Bool)

(declare-fun call!1538 () Bool)

(declare-fun lt!7298 () ListLongMap!557)

(assert (=> bm!1534 (= call!1538 (contains!224 lt!7298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22027 () Bool)

(declare-fun e!14300 () ListLongMap!557)

(declare-fun call!1541 () ListLongMap!557)

(assert (=> b!22027 (= e!14300 (+!41 call!1541 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (_2!457 lt!6660))))))))

(declare-fun b!22028 () Bool)

(declare-fun e!14296 () ListLongMap!557)

(declare-fun call!1542 () ListLongMap!557)

(assert (=> b!22028 (= e!14296 call!1542)))

(declare-fun b!22029 () Bool)

(declare-fun e!14303 () Bool)

(declare-fun e!14297 () Bool)

(assert (=> b!22029 (= e!14303 e!14297)))

(declare-fun res!14040 () Bool)

(assert (=> b!22029 (=> (not res!14040) (not e!14297))))

(assert (=> b!22029 (= res!14040 (contains!224 lt!7298 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000)))))

(assert (=> b!22029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))))))

(declare-fun b!22030 () Bool)

(declare-fun e!14299 () ListLongMap!557)

(assert (=> b!22030 (= e!14299 call!1542)))

(declare-fun b!22031 () Bool)

(assert (=> b!22031 (= e!14297 (= (apply!28 lt!7298 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000)) (get!377 (select (arr!573 (_values!1707 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 (v!1571 (_2!457 lt!6660))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!666 (_values!1707 (v!1571 (_2!457 lt!6660))))))))

(assert (=> b!22031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))))))

(declare-fun b!22032 () Bool)

(declare-fun e!14294 () Bool)

(assert (=> b!22032 (= e!14294 (not call!1538))))

(declare-fun d!3813 () Bool)

(declare-fun e!14298 () Bool)

(assert (=> d!3813 e!14298))

(declare-fun res!14034 () Bool)

(assert (=> d!3813 (=> (not res!14034) (not e!14298))))

(assert (=> d!3813 (= res!14034 (or (bvsge #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))))))))

(declare-fun lt!7301 () ListLongMap!557)

(assert (=> d!3813 (= lt!7298 lt!7301)))

(declare-fun lt!7297 () Unit!462)

(assert (=> d!3813 (= lt!7297 e!14295)))

(declare-fun c!2633 () Bool)

(assert (=> d!3813 (= c!2633 e!14291)))

(declare-fun res!14036 () Bool)

(assert (=> d!3813 (=> (not res!14036) (not e!14291))))

(assert (=> d!3813 (= res!14036 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))))))

(assert (=> d!3813 (= lt!7301 e!14300)))

(declare-fun c!2636 () Bool)

(assert (=> d!3813 (= c!2636 (and (not (= (bvand (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3813 (validMask!0 (mask!4691 (v!1571 (_2!457 lt!6660))))))

(assert (=> d!3813 (= (getCurrentListMap!124 (_keys!3139 (v!1571 (_2!457 lt!6660))) (_values!1707 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660))) (extraKeys!1621 (v!1571 (_2!457 lt!6660))) (zeroValue!1645 (v!1571 (_2!457 lt!6660))) (minValue!1645 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1571 (_2!457 lt!6660)))) lt!7298)))

(declare-fun b!22033 () Bool)

(declare-fun e!14293 () Bool)

(declare-fun call!1543 () Bool)

(assert (=> b!22033 (= e!14293 (not call!1543))))

(declare-fun b!22034 () Bool)

(declare-fun e!14292 () Bool)

(assert (=> b!22034 (= e!14292 (= (apply!28 lt!7298 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1645 (v!1571 (_2!457 lt!6660)))))))

(declare-fun b!22035 () Bool)

(assert (=> b!22035 (= e!14298 e!14293)))

(declare-fun c!2635 () Bool)

(assert (=> b!22035 (= c!2635 (not (= (bvand (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22036 () Bool)

(declare-fun c!2637 () Bool)

(assert (=> b!22036 (= c!2637 (and (not (= (bvand (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!22036 (= e!14296 e!14299)))

(declare-fun bm!1535 () Bool)

(declare-fun call!1537 () ListLongMap!557)

(assert (=> bm!1535 (= call!1537 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (_2!457 lt!6660))) (_values!1707 (v!1571 (_2!457 lt!6660))) (mask!4691 (v!1571 (_2!457 lt!6660))) (extraKeys!1621 (v!1571 (_2!457 lt!6660))) (zeroValue!1645 (v!1571 (_2!457 lt!6660))) (minValue!1645 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 (defaultEntry!1718 (v!1571 (_2!457 lt!6660)))))))

(declare-fun bm!1536 () Bool)

(declare-fun call!1540 () ListLongMap!557)

(assert (=> bm!1536 (= call!1540 call!1537)))

(declare-fun call!1539 () ListLongMap!557)

(declare-fun bm!1537 () Bool)

(declare-fun c!2634 () Bool)

(assert (=> bm!1537 (= call!1541 (+!41 (ite c!2636 call!1537 (ite c!2634 call!1540 call!1539)) (ite (or c!2636 c!2634) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (_2!457 lt!6660)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (_2!457 lt!6660)))))))))

(declare-fun b!22037 () Bool)

(declare-fun res!14041 () Bool)

(assert (=> b!22037 (=> (not res!14041) (not e!14298))))

(assert (=> b!22037 (= res!14041 e!14303)))

(declare-fun res!14037 () Bool)

(assert (=> b!22037 (=> res!14037 e!14303)))

(declare-fun e!14301 () Bool)

(assert (=> b!22037 (= res!14037 (not e!14301))))

(declare-fun res!14035 () Bool)

(assert (=> b!22037 (=> (not res!14035) (not e!14301))))

(assert (=> b!22037 (= res!14035 (bvslt #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))))))

(declare-fun b!22038 () Bool)

(assert (=> b!22038 (= e!14300 e!14296)))

(assert (=> b!22038 (= c!2634 (and (not (= (bvand (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22039 () Bool)

(declare-fun e!14302 () Bool)

(assert (=> b!22039 (= e!14293 e!14302)))

(declare-fun res!14038 () Bool)

(assert (=> b!22039 (= res!14038 call!1543)))

(assert (=> b!22039 (=> (not res!14038) (not e!14302))))

(declare-fun b!22040 () Bool)

(assert (=> b!22040 (= e!14299 call!1539)))

(declare-fun b!22041 () Bool)

(assert (=> b!22041 (= e!14301 (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000)))))

(declare-fun bm!1538 () Bool)

(assert (=> bm!1538 (= call!1539 call!1540)))

(declare-fun b!22042 () Bool)

(declare-fun Unit!489 () Unit!462)

(assert (=> b!22042 (= e!14295 Unit!489)))

(declare-fun b!22043 () Bool)

(assert (=> b!22043 (= e!14294 e!14292)))

(declare-fun res!14039 () Bool)

(assert (=> b!22043 (= res!14039 call!1538)))

(assert (=> b!22043 (=> (not res!14039) (not e!14292))))

(declare-fun b!22044 () Bool)

(declare-fun res!14042 () Bool)

(assert (=> b!22044 (=> (not res!14042) (not e!14298))))

(assert (=> b!22044 (= res!14042 e!14294)))

(declare-fun c!2638 () Bool)

(assert (=> b!22044 (= c!2638 (not (= (bvand (extraKeys!1621 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!22045 () Bool)

(assert (=> b!22045 (= e!14302 (= (apply!28 lt!7298 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1645 (v!1571 (_2!457 lt!6660)))))))

(declare-fun bm!1539 () Bool)

(assert (=> bm!1539 (= call!1542 call!1541)))

(declare-fun bm!1540 () Bool)

(assert (=> bm!1540 (= call!1543 (contains!224 lt!7298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3813 c!2636) b!22027))

(assert (= (and d!3813 (not c!2636)) b!22038))

(assert (= (and b!22038 c!2634) b!22028))

(assert (= (and b!22038 (not c!2634)) b!22036))

(assert (= (and b!22036 c!2637) b!22030))

(assert (= (and b!22036 (not c!2637)) b!22040))

(assert (= (or b!22030 b!22040) bm!1538))

(assert (= (or b!22028 bm!1538) bm!1536))

(assert (= (or b!22028 b!22030) bm!1539))

(assert (= (or b!22027 bm!1536) bm!1535))

(assert (= (or b!22027 bm!1539) bm!1537))

(assert (= (and d!3813 res!14036) b!22025))

(assert (= (and d!3813 c!2633) b!22026))

(assert (= (and d!3813 (not c!2633)) b!22042))

(assert (= (and d!3813 res!14034) b!22037))

(assert (= (and b!22037 res!14035) b!22041))

(assert (= (and b!22037 (not res!14037)) b!22029))

(assert (= (and b!22029 res!14040) b!22031))

(assert (= (and b!22037 res!14041) b!22044))

(assert (= (and b!22044 c!2638) b!22043))

(assert (= (and b!22044 (not c!2638)) b!22032))

(assert (= (and b!22043 res!14039) b!22034))

(assert (= (or b!22043 b!22032) bm!1534))

(assert (= (and b!22044 res!14042) b!22035))

(assert (= (and b!22035 c!2635) b!22039))

(assert (= (and b!22035 (not c!2635)) b!22033))

(assert (= (and b!22039 res!14038) b!22045))

(assert (= (or b!22039 b!22033) bm!1540))

(declare-fun b_lambda!1533 () Bool)

(assert (=> (not b_lambda!1533) (not b!22031)))

(declare-fun t!3218 () Bool)

(declare-fun tb!645 () Bool)

(assert (=> (and b!21300 (= (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 (v!1571 (_2!457 lt!6660)))) t!3218) tb!645))

(declare-fun result!1073 () Bool)

(assert (=> tb!645 (= result!1073 tp_is_empty!997)))

(assert (=> b!22031 t!3218))

(declare-fun b_and!1439 () Bool)

(assert (= b_and!1437 (and (=> t!3218 result!1073) b_and!1439)))

(declare-fun m!15760 () Bool)

(assert (=> bm!1537 m!15760))

(assert (=> b!22025 m!15240))

(assert (=> b!22025 m!15240))

(assert (=> b!22025 m!15242))

(declare-fun m!15762 () Bool)

(assert (=> b!22045 m!15762))

(assert (=> b!22031 m!15240))

(declare-fun m!15764 () Bool)

(assert (=> b!22031 m!15764))

(declare-fun m!15766 () Bool)

(assert (=> b!22031 m!15766))

(declare-fun m!15768 () Bool)

(assert (=> b!22031 m!15768))

(assert (=> b!22031 m!15764))

(assert (=> b!22031 m!15240))

(declare-fun m!15770 () Bool)

(assert (=> b!22031 m!15770))

(assert (=> b!22031 m!15766))

(assert (=> d!3813 m!15480))

(assert (=> b!22041 m!15240))

(assert (=> b!22041 m!15240))

(assert (=> b!22041 m!15242))

(declare-fun m!15772 () Bool)

(assert (=> bm!1540 m!15772))

(declare-fun m!15774 () Bool)

(assert (=> b!22027 m!15774))

(declare-fun m!15776 () Bool)

(assert (=> bm!1535 m!15776))

(declare-fun m!15778 () Bool)

(assert (=> b!22034 m!15778))

(declare-fun m!15780 () Bool)

(assert (=> bm!1534 m!15780))

(assert (=> b!22029 m!15240))

(assert (=> b!22029 m!15240))

(declare-fun m!15782 () Bool)

(assert (=> b!22029 m!15782))

(declare-fun m!15784 () Bool)

(assert (=> b!22026 m!15784))

(declare-fun m!15786 () Bool)

(assert (=> b!22026 m!15786))

(assert (=> b!22026 m!15240))

(assert (=> b!22026 m!15786))

(declare-fun m!15788 () Bool)

(assert (=> b!22026 m!15788))

(declare-fun m!15790 () Bool)

(assert (=> b!22026 m!15790))

(declare-fun m!15792 () Bool)

(assert (=> b!22026 m!15792))

(declare-fun m!15794 () Bool)

(assert (=> b!22026 m!15794))

(declare-fun m!15796 () Bool)

(assert (=> b!22026 m!15796))

(declare-fun m!15798 () Bool)

(assert (=> b!22026 m!15798))

(declare-fun m!15800 () Bool)

(assert (=> b!22026 m!15800))

(assert (=> b!22026 m!15790))

(declare-fun m!15802 () Bool)

(assert (=> b!22026 m!15802))

(declare-fun m!15804 () Bool)

(assert (=> b!22026 m!15804))

(assert (=> b!22026 m!15776))

(declare-fun m!15806 () Bool)

(assert (=> b!22026 m!15806))

(declare-fun m!15808 () Bool)

(assert (=> b!22026 m!15808))

(assert (=> b!22026 m!15798))

(declare-fun m!15810 () Bool)

(assert (=> b!22026 m!15810))

(assert (=> b!22026 m!15804))

(declare-fun m!15812 () Bool)

(assert (=> b!22026 m!15812))

(assert (=> d!3715 d!3813))

(declare-fun d!3815 () Bool)

(declare-fun res!14043 () Bool)

(declare-fun e!14304 () Bool)

(assert (=> d!3815 (=> res!14043 e!14304)))

(assert (=> d!3815 (= res!14043 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) #b00000000000000000000000000000000) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3815 (= (arrayContainsKey!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000) e!14304)))

(declare-fun b!22046 () Bool)

(declare-fun e!14305 () Bool)

(assert (=> b!22046 (= e!14304 e!14305)))

(declare-fun res!14044 () Bool)

(assert (=> b!22046 (=> (not res!14044) (not e!14305))))

(assert (=> b!22046 (= res!14044 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun b!22047 () Bool)

(assert (=> b!22047 (= e!14305 (arrayContainsKey!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3815 (not res!14043)) b!22046))

(assert (= (and b!22046 res!14044) b!22047))

(assert (=> d!3815 m!15254))

(declare-fun m!15814 () Bool)

(assert (=> b!22047 m!15814))

(assert (=> bm!1423 d!3815))

(assert (=> b!21640 d!3759))

(declare-fun d!3817 () Bool)

(declare-fun res!14045 () Bool)

(declare-fun e!14306 () Bool)

(assert (=> d!3817 (=> res!14045 e!14306)))

(assert (=> d!3817 (= res!14045 (= (select (arr!572 (_keys!3139 lt!6655)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3817 (= (arrayContainsKey!0 (_keys!3139 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000) e!14306)))

(declare-fun b!22048 () Bool)

(declare-fun e!14307 () Bool)

(assert (=> b!22048 (= e!14306 e!14307)))

(declare-fun res!14046 () Bool)

(assert (=> b!22048 (=> (not res!14046) (not e!14307))))

(assert (=> b!22048 (= res!14046 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!665 (_keys!3139 lt!6655))))))

(declare-fun b!22049 () Bool)

(assert (=> b!22049 (= e!14307 (arrayContainsKey!0 (_keys!3139 lt!6655) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3817 (not res!14045)) b!22048))

(assert (= (and b!22048 res!14046) b!22049))

(assert (=> d!3817 m!15314))

(declare-fun m!15816 () Bool)

(assert (=> b!22049 m!15816))

(assert (=> bm!1447 d!3817))

(declare-fun d!3819 () Bool)

(declare-fun e!14309 () Bool)

(assert (=> d!3819 e!14309))

(declare-fun res!14047 () Bool)

(assert (=> d!3819 (=> res!14047 e!14309)))

(declare-fun lt!7306 () Bool)

(assert (=> d!3819 (= res!14047 (not lt!7306))))

(declare-fun lt!7305 () Bool)

(assert (=> d!3819 (= lt!7306 lt!7305)))

(declare-fun lt!7303 () Unit!462)

(declare-fun e!14308 () Unit!462)

(assert (=> d!3819 (= lt!7303 e!14308)))

(declare-fun c!2639 () Bool)

(assert (=> d!3819 (= c!2639 lt!7305)))

(assert (=> d!3819 (= lt!7305 (containsKey!24 (toList!294 e!14044) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3819 (= (contains!224 e!14044 #b0000000000000000000000000000000000000000000000000000000000000000) lt!7306)))

(declare-fun b!22050 () Bool)

(declare-fun lt!7304 () Unit!462)

(assert (=> b!22050 (= e!14308 lt!7304)))

(assert (=> b!22050 (= lt!7304 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!294 e!14044) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22050 (isDefined!22 (getValueByKey!60 (toList!294 e!14044) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22051 () Bool)

(declare-fun Unit!490 () Unit!462)

(assert (=> b!22051 (= e!14308 Unit!490)))

(declare-fun b!22052 () Bool)

(assert (=> b!22052 (= e!14309 (isDefined!22 (getValueByKey!60 (toList!294 e!14044) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3819 c!2639) b!22050))

(assert (= (and d!3819 (not c!2639)) b!22051))

(assert (= (and d!3819 (not res!14047)) b!22052))

(declare-fun m!15818 () Bool)

(assert (=> d!3819 m!15818))

(declare-fun m!15820 () Bool)

(assert (=> b!22050 m!15820))

(declare-fun m!15822 () Bool)

(assert (=> b!22050 m!15822))

(assert (=> b!22050 m!15822))

(declare-fun m!15824 () Bool)

(assert (=> b!22050 m!15824))

(assert (=> b!22052 m!15822))

(assert (=> b!22052 m!15822))

(assert (=> b!22052 m!15824))

(assert (=> bm!1438 d!3819))

(declare-fun b!22077 () Bool)

(declare-fun e!14324 () Bool)

(declare-fun lt!7325 () ListLongMap!557)

(assert (=> b!22077 (= e!14324 (= lt!7325 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (_values!1707 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun b!22078 () Bool)

(declare-fun e!14329 () Bool)

(assert (=> b!22078 (= e!14329 (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!22078 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun b!22079 () Bool)

(declare-fun res!14056 () Bool)

(declare-fun e!14330 () Bool)

(assert (=> b!22079 (=> (not res!14056) (not e!14330))))

(assert (=> b!22079 (= res!14056 (not (contains!224 lt!7325 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!22080 () Bool)

(declare-fun e!14326 () ListLongMap!557)

(declare-fun call!1546 () ListLongMap!557)

(assert (=> b!22080 (= e!14326 call!1546)))

(declare-fun b!22081 () Bool)

(declare-fun lt!7321 () Unit!462)

(declare-fun lt!7324 () Unit!462)

(assert (=> b!22081 (= lt!7321 lt!7324)))

(declare-fun lt!7327 () (_ BitVec 64))

(declare-fun lt!7322 () ListLongMap!557)

(declare-fun lt!7326 () (_ BitVec 64))

(declare-fun lt!7323 () V!1155)

(assert (=> b!22081 (not (contains!224 (+!41 lt!7322 (tuple2!911 lt!7326 lt!7323)) lt!7327))))

(declare-fun addStillNotContains!1 (ListLongMap!557 (_ BitVec 64) V!1155 (_ BitVec 64)) Unit!462)

(assert (=> b!22081 (= lt!7324 (addStillNotContains!1 lt!7322 lt!7326 lt!7323 lt!7327))))

(assert (=> b!22081 (= lt!7327 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!22081 (= lt!7323 (get!377 (select (arr!573 (_values!1707 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22081 (= lt!7326 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))

(assert (=> b!22081 (= lt!7322 call!1546)))

(assert (=> b!22081 (= e!14326 (+!41 call!1546 (tuple2!911 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (get!377 (select (arr!573 (_values!1707 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!22082 () Bool)

(declare-fun isEmpty!171 (ListLongMap!557) Bool)

(assert (=> b!22082 (= e!14324 (isEmpty!171 lt!7325))))

(declare-fun bm!1543 () Bool)

(assert (=> bm!1543 (= call!1546 (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (_values!1707 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun b!22083 () Bool)

(declare-fun e!14325 () ListLongMap!557)

(assert (=> b!22083 (= e!14325 (ListLongMap!558 Nil!555))))

(declare-fun b!22084 () Bool)

(assert (=> b!22084 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))))))

(assert (=> b!22084 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!666 (_values!1707 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun e!14327 () Bool)

(assert (=> b!22084 (= e!14327 (= (apply!28 lt!7325 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (get!377 (select (arr!573 (_values!1707 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!22085 () Bool)

(declare-fun e!14328 () Bool)

(assert (=> b!22085 (= e!14328 e!14327)))

(assert (=> b!22085 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun res!14058 () Bool)

(assert (=> b!22085 (= res!14058 (contains!224 lt!7325 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!22085 (=> (not res!14058) (not e!14327))))

(declare-fun b!22087 () Bool)

(assert (=> b!22087 (= e!14328 e!14324)))

(declare-fun c!2651 () Bool)

(assert (=> b!22087 (= c!2651 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun b!22088 () Bool)

(assert (=> b!22088 (= e!14330 e!14328)))

(declare-fun c!2650 () Bool)

(assert (=> b!22088 (= c!2650 e!14329)))

(declare-fun res!14057 () Bool)

(assert (=> b!22088 (=> (not res!14057) (not e!14329))))

(assert (=> b!22088 (= res!14057 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))))))

(declare-fun b!22086 () Bool)

(assert (=> b!22086 (= e!14325 e!14326)))

(declare-fun c!2648 () Bool)

(assert (=> b!22086 (= c!2648 (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun d!3821 () Bool)

(assert (=> d!3821 e!14330))

(declare-fun res!14059 () Bool)

(assert (=> d!3821 (=> (not res!14059) (not e!14330))))

(assert (=> d!3821 (= res!14059 (not (contains!224 lt!7325 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3821 (= lt!7325 e!14325)))

(declare-fun c!2649 () Bool)

(assert (=> d!3821 (= c!2649 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938))))))))

(assert (=> d!3821 (validMask!0 (mask!4691 (v!1571 (underlying!103 thiss!938))))))

(assert (=> d!3821 (= (getCurrentListMapNoExtraKeys!13 (_keys!3139 (v!1571 (underlying!103 thiss!938))) (_values!1707 (v!1571 (underlying!103 thiss!938))) (mask!4691 (v!1571 (underlying!103 thiss!938))) (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))) lt!7325)))

(assert (= (and d!3821 c!2649) b!22083))

(assert (= (and d!3821 (not c!2649)) b!22086))

(assert (= (and b!22086 c!2648) b!22081))

(assert (= (and b!22086 (not c!2648)) b!22080))

(assert (= (or b!22081 b!22080) bm!1543))

(assert (= (and d!3821 res!14059) b!22079))

(assert (= (and b!22079 res!14056) b!22088))

(assert (= (and b!22088 res!14057) b!22078))

(assert (= (and b!22088 c!2650) b!22085))

(assert (= (and b!22088 (not c!2650)) b!22087))

(assert (= (and b!22085 res!14058) b!22084))

(assert (= (and b!22087 c!2651) b!22077))

(assert (= (and b!22087 (not c!2651)) b!22082))

(declare-fun b_lambda!1535 () Bool)

(assert (=> (not b_lambda!1535) (not b!22081)))

(assert (=> b!22081 t!3211))

(declare-fun b_and!1441 () Bool)

(assert (= b_and!1439 (and (=> t!3211 result!1063) b_and!1441)))

(declare-fun b_lambda!1537 () Bool)

(assert (=> (not b_lambda!1537) (not b!22084)))

(assert (=> b!22084 t!3211))

(declare-fun b_and!1443 () Bool)

(assert (= b_and!1441 (and (=> t!3211 result!1063) b_and!1443)))

(declare-fun m!15826 () Bool)

(assert (=> b!22081 m!15826))

(declare-fun m!15828 () Bool)

(assert (=> b!22081 m!15828))

(declare-fun m!15830 () Bool)

(assert (=> b!22081 m!15830))

(declare-fun m!15832 () Bool)

(assert (=> b!22081 m!15832))

(assert (=> b!22081 m!15053))

(assert (=> b!22081 m!15055))

(assert (=> b!22081 m!15047))

(assert (=> b!22081 m!15053))

(assert (=> b!22081 m!15055))

(assert (=> b!22081 m!15057))

(assert (=> b!22081 m!15830))

(assert (=> b!22078 m!15047))

(assert (=> b!22078 m!15047))

(assert (=> b!22078 m!15049))

(assert (=> b!22086 m!15047))

(assert (=> b!22086 m!15047))

(assert (=> b!22086 m!15049))

(declare-fun m!15834 () Bool)

(assert (=> d!3821 m!15834))

(assert (=> d!3821 m!14849))

(assert (=> b!22084 m!15053))

(assert (=> b!22084 m!15055))

(assert (=> b!22084 m!15057))

(assert (=> b!22084 m!15053))

(assert (=> b!22084 m!15055))

(assert (=> b!22084 m!15047))

(assert (=> b!22084 m!15047))

(declare-fun m!15836 () Bool)

(assert (=> b!22084 m!15836))

(assert (=> b!22085 m!15047))

(assert (=> b!22085 m!15047))

(declare-fun m!15838 () Bool)

(assert (=> b!22085 m!15838))

(declare-fun m!15840 () Bool)

(assert (=> bm!1543 m!15840))

(declare-fun m!15842 () Bool)

(assert (=> b!22082 m!15842))

(assert (=> b!22077 m!15840))

(declare-fun m!15844 () Bool)

(assert (=> b!22079 m!15844))

(assert (=> bm!1463 d!3821))

(declare-fun b!22099 () Bool)

(declare-fun e!14342 () Bool)

(declare-fun e!14339 () Bool)

(assert (=> b!22099 (= e!14342 e!14339)))

(declare-fun c!2654 () Bool)

(assert (=> b!22099 (= c!2654 (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000)))))

(declare-fun b!22100 () Bool)

(declare-fun call!1549 () Bool)

(assert (=> b!22100 (= e!14339 call!1549)))

(declare-fun b!22101 () Bool)

(assert (=> b!22101 (= e!14339 call!1549)))

(declare-fun d!3823 () Bool)

(declare-fun res!14067 () Bool)

(declare-fun e!14340 () Bool)

(assert (=> d!3823 (=> res!14067 e!14340)))

(assert (=> d!3823 (= res!14067 (bvsge #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))))))

(assert (=> d!3823 (= (arrayNoDuplicates!0 (_keys!3139 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 Nil!556) e!14340)))

(declare-fun bm!1546 () Bool)

(assert (=> bm!1546 (= call!1549 (arrayNoDuplicates!0 (_keys!3139 (v!1571 (_2!457 lt!6660))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2654 (Cons!555 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000) Nil!556) Nil!556)))))

(declare-fun b!22102 () Bool)

(assert (=> b!22102 (= e!14340 e!14342)))

(declare-fun res!14068 () Bool)

(assert (=> b!22102 (=> (not res!14068) (not e!14342))))

(declare-fun e!14341 () Bool)

(assert (=> b!22102 (= res!14068 (not e!14341))))

(declare-fun res!14066 () Bool)

(assert (=> b!22102 (=> (not res!14066) (not e!14341))))

(assert (=> b!22102 (= res!14066 (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000)))))

(declare-fun b!22103 () Bool)

(declare-fun contains!226 (List!559 (_ BitVec 64)) Bool)

(assert (=> b!22103 (= e!14341 (contains!226 Nil!556 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000)))))

(assert (= (and d!3823 (not res!14067)) b!22102))

(assert (= (and b!22102 res!14066) b!22103))

(assert (= (and b!22102 res!14068) b!22099))

(assert (= (and b!22099 c!2654) b!22101))

(assert (= (and b!22099 (not c!2654)) b!22100))

(assert (= (or b!22101 b!22100) bm!1546))

(assert (=> b!22099 m!15240))

(assert (=> b!22099 m!15240))

(assert (=> b!22099 m!15242))

(assert (=> bm!1546 m!15240))

(declare-fun m!15846 () Bool)

(assert (=> bm!1546 m!15846))

(assert (=> b!22102 m!15240))

(assert (=> b!22102 m!15240))

(assert (=> b!22102 m!15242))

(assert (=> b!22103 m!15240))

(assert (=> b!22103 m!15240))

(declare-fun m!15848 () Bool)

(assert (=> b!22103 m!15848))

(assert (=> b!21429 d!3823))

(declare-fun d!3825 () Bool)

(declare-fun e!14344 () Bool)

(assert (=> d!3825 e!14344))

(declare-fun res!14069 () Bool)

(assert (=> d!3825 (=> res!14069 e!14344)))

(declare-fun lt!7331 () Bool)

(assert (=> d!3825 (= res!14069 (not lt!7331))))

(declare-fun lt!7330 () Bool)

(assert (=> d!3825 (= lt!7331 lt!7330)))

(declare-fun lt!7328 () Unit!462)

(declare-fun e!14343 () Unit!462)

(assert (=> d!3825 (= lt!7328 e!14343)))

(declare-fun c!2655 () Bool)

(assert (=> d!3825 (= c!2655 lt!7330)))

(assert (=> d!3825 (= lt!7330 (containsKey!24 (toList!294 call!1407) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3825 (= (contains!224 call!1407 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) lt!7331)))

(declare-fun b!22104 () Bool)

(declare-fun lt!7329 () Unit!462)

(assert (=> b!22104 (= e!14343 lt!7329)))

(assert (=> b!22104 (= lt!7329 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!294 call!1407) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22104 (isDefined!22 (getValueByKey!60 (toList!294 call!1407) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!22105 () Bool)

(declare-fun Unit!491 () Unit!462)

(assert (=> b!22105 (= e!14343 Unit!491)))

(declare-fun b!22106 () Bool)

(assert (=> b!22106 (= e!14344 (isDefined!22 (getValueByKey!60 (toList!294 call!1407) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!3825 c!2655) b!22104))

(assert (= (and d!3825 (not c!2655)) b!22105))

(assert (= (and d!3825 (not res!14069)) b!22106))

(declare-fun m!15850 () Bool)

(assert (=> d!3825 m!15850))

(declare-fun m!15852 () Bool)

(assert (=> b!22104 m!15852))

(declare-fun m!15854 () Bool)

(assert (=> b!22104 m!15854))

(assert (=> b!22104 m!15854))

(declare-fun m!15856 () Bool)

(assert (=> b!22104 m!15856))

(assert (=> b!22106 m!15854))

(assert (=> b!22106 m!15854))

(assert (=> b!22106 m!15856))

(assert (=> b!21555 d!3825))

(declare-fun d!3827 () Bool)

(declare-fun lt!7334 () (_ BitVec 32))

(assert (=> d!3827 (and (bvsge lt!7334 #b00000000000000000000000000000000) (bvsle lt!7334 (bvsub (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000)))))

(declare-fun e!14350 () (_ BitVec 32))

(assert (=> d!3827 (= lt!7334 e!14350)))

(declare-fun c!2660 () Bool)

(assert (=> d!3827 (= c!2660 (bvsge #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))))))

(assert (=> d!3827 (and (bvsle #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660)))) (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))))))

(assert (=> d!3827 (= (arrayCountValidKeys!0 (_keys!3139 (v!1571 (_2!457 lt!6660))) #b00000000000000000000000000000000 (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))) lt!7334)))

(declare-fun b!22115 () Bool)

(declare-fun e!14349 () (_ BitVec 32))

(declare-fun call!1552 () (_ BitVec 32))

(assert (=> b!22115 (= e!14349 call!1552)))

(declare-fun b!22116 () Bool)

(assert (=> b!22116 (= e!14350 e!14349)))

(declare-fun c!2661 () Bool)

(assert (=> b!22116 (= c!2661 (validKeyInArray!0 (select (arr!572 (_keys!3139 (v!1571 (_2!457 lt!6660)))) #b00000000000000000000000000000000)))))

(declare-fun bm!1549 () Bool)

(assert (=> bm!1549 (= call!1552 (arrayCountValidKeys!0 (_keys!3139 (v!1571 (_2!457 lt!6660))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!665 (_keys!3139 (v!1571 (_2!457 lt!6660))))))))

(declare-fun b!22117 () Bool)

(assert (=> b!22117 (= e!14349 (bvadd #b00000000000000000000000000000001 call!1552))))

(declare-fun b!22118 () Bool)

(assert (=> b!22118 (= e!14350 #b00000000000000000000000000000000)))

(assert (= (and d!3827 c!2660) b!22118))

(assert (= (and d!3827 (not c!2660)) b!22116))

(assert (= (and b!22116 c!2661) b!22117))

(assert (= (and b!22116 (not c!2661)) b!22115))

(assert (= (or b!22117 b!22115) bm!1549))

(assert (=> b!22116 m!15240))

(assert (=> b!22116 m!15240))

(assert (=> b!22116 m!15242))

(declare-fun m!15858 () Bool)

(assert (=> bm!1549 m!15858))

(assert (=> b!21427 d!3827))

(assert (=> bm!1419 d!3779))

(declare-fun d!3829 () Bool)

(assert (=> d!3829 (= (head!825 (toList!294 (map!397 lt!6944))) (h!1120 (toList!294 (map!397 lt!6944))))))

(assert (=> b!21679 d!3829))

(declare-fun d!3831 () Bool)

(assert (=> d!3831 (= (map!397 lt!6944) (getCurrentListMap!124 (_keys!3139 lt!6944) (_values!1707 lt!6944) (mask!4691 lt!6944) (extraKeys!1621 lt!6944) (zeroValue!1645 lt!6944) (minValue!1645 lt!6944) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6944)))))

(declare-fun bs!917 () Bool)

(assert (= bs!917 d!3831))

(declare-fun m!15860 () Bool)

(assert (=> bs!917 m!15860))

(assert (=> b!21679 d!3831))

(declare-fun d!3833 () Bool)

(declare-fun e!14353 () Bool)

(assert (=> d!3833 e!14353))

(declare-fun c!2664 () Bool)

(assert (=> d!3833 (= c!2664 (and (not (= (_1!458 lt!6937) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!458 lt!6937) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!7337 () Unit!462)

(declare-fun choose!200 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 (_ BitVec 64) Int) Unit!462)

(assert (=> d!3833 (= lt!7337 (choose!200 lt!6935 (array!1210 ((as const (Array (_ BitVec 32) ValueCell!299)) EmptyCell!299) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) lt!6934 (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!458 lt!6937) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))))))

(assert (=> d!3833 (validMask!0 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))))))

(assert (=> d!3833 (= (lemmaKeyInListMapIsInArray!94 lt!6935 (array!1210 ((as const (Array (_ BitVec 32) ValueCell!299)) EmptyCell!299) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) lt!6934 (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!458 lt!6937) (defaultEntry!1718 (v!1571 (underlying!103 thiss!938)))) lt!7337)))

(declare-fun b!22123 () Bool)

(assert (=> b!22123 (= e!14353 (arrayContainsKey!0 lt!6935 (_1!458 lt!6937) #b00000000000000000000000000000000))))

(declare-fun b!22124 () Bool)

(assert (=> b!22124 (= e!14353 (ite (= (_1!458 lt!6937) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6934 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6934 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!3833 c!2664) b!22123))

(assert (= (and d!3833 (not c!2664)) b!22124))

(assert (=> d!3833 m!14861))

(assert (=> d!3833 m!15055))

(assert (=> d!3833 m!15055))

(declare-fun m!15862 () Bool)

(assert (=> d!3833 m!15862))

(assert (=> d!3833 m!14861))

(assert (=> d!3833 m!15117))

(assert (=> b!22123 m!15105))

(assert (=> b!21679 d!3833))

(declare-fun d!3835 () Bool)

(declare-fun lt!7340 () (_ BitVec 32))

(assert (=> d!3835 (and (or (bvslt lt!7340 #b00000000000000000000000000000000) (bvsge lt!7340 (size!665 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (and (bvsge lt!7340 #b00000000000000000000000000000000) (bvslt lt!7340 (size!665 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))) (bvsge lt!7340 #b00000000000000000000000000000000) (bvslt lt!7340 (size!665 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (= (select (arr!572 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) lt!7340) (_1!458 lt!6937)))))

(declare-fun e!14356 () (_ BitVec 32))

(assert (=> d!3835 (= lt!7340 e!14356)))

(declare-fun c!2667 () Bool)

(assert (=> d!3835 (= c!2667 (= (select (arr!572 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!458 lt!6937)))))

(assert (=> d!3835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!665 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (bvslt (size!665 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!3835 (= (arrayScanForKey!0 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (_1!458 lt!6937) #b00000000000000000000000000000000) lt!7340)))

(declare-fun b!22129 () Bool)

(assert (=> b!22129 (= e!14356 #b00000000000000000000000000000000)))

(declare-fun b!22130 () Bool)

(assert (=> b!22130 (= e!14356 (arrayScanForKey!0 (array!1208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)) (_1!458 lt!6937) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3835 c!2667) b!22129))

(assert (= (and d!3835 (not c!2667)) b!22130))

(declare-fun m!15864 () Bool)

(assert (=> d!3835 m!15864))

(declare-fun m!15866 () Bool)

(assert (=> d!3835 m!15866))

(declare-fun m!15868 () Bool)

(assert (=> b!22130 m!15868))

(assert (=> b!21679 d!3835))

(declare-fun lt!7367 () SeekEntryResult!51)

(declare-fun c!2671 () Bool)

(declare-fun lt!7357 () SeekEntryResult!51)

(declare-fun c!2669 () Bool)

(declare-fun bm!1550 () Bool)

(declare-fun call!1555 () Bool)

(assert (=> bm!1550 (= call!1555 (inRange!0 (ite c!2671 (index!2325 lt!7367) (ite c!2669 (index!2324 lt!7357) (index!2327 lt!7357))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!22131 () Bool)

(declare-fun res!14072 () Bool)

(assert (=> b!22131 (= res!14072 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2327 lt!7357)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14363 () Bool)

(assert (=> b!22131 (=> (not res!14072) (not e!14363))))

(declare-fun b!22132 () Bool)

(declare-fun res!14076 () Bool)

(declare-fun e!14360 () Bool)

(assert (=> b!22132 (=> (not res!14076) (not e!14360))))

(declare-fun lt!7351 () tuple2!912)

(assert (=> b!22132 (= res!14076 (contains!224 (map!397 (_2!459 lt!7351)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!22133 () Bool)

(declare-fun call!1556 () Bool)

(assert (=> b!22133 (= e!14363 (not call!1556))))

(declare-fun b!22134 () Bool)

(declare-fun e!14364 () Bool)

(assert (=> b!22134 (= e!14364 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2325 lt!7367)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!22135 () Bool)

(assert (=> b!22135 (= e!14360 (= (map!397 (_2!459 lt!7351)) (+!41 (map!397 (ite c!2450 (_2!459 lt!6654) lt!6655)) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))

(declare-fun d!3837 () Bool)

(assert (=> d!3837 e!14360))

(declare-fun res!14077 () Bool)

(assert (=> d!3837 (=> (not res!14077) (not e!14360))))

(assert (=> d!3837 (= res!14077 (_1!459 lt!7351))))

(assert (=> d!3837 (= lt!7351 (tuple2!913 true (LongMapFixedSize!185 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (bvadd (_size!133 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000001) (array!1208 (store (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (_vacant!133 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun lt!7342 () Unit!462)

(declare-fun lt!7344 () Unit!462)

(assert (=> d!3837 (= lt!7342 lt!7344)))

(declare-fun lt!7361 () array!1209)

(declare-fun lt!7341 () array!1207)

(assert (=> d!3837 (contains!224 (getCurrentListMap!124 lt!7341 lt!7361 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) (select (store (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772))))))

(assert (=> d!3837 (= lt!7344 (lemmaValidKeyInArrayIsInListMap!7 lt!7341 lt!7361 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> d!3837 (= lt!7361 (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(assert (=> d!3837 (= lt!7341 (array!1208 (store (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun lt!7347 () Unit!462)

(declare-fun lt!7370 () Unit!462)

(assert (=> d!3837 (= lt!7347 lt!7370)))

(declare-fun lt!7364 () array!1207)

(assert (=> d!3837 (= (arrayCountValidKeys!0 lt!7364 (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (bvadd (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!3837 (= lt!7370 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!7364 (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772))))))

(assert (=> d!3837 (= lt!7364 (array!1208 (store (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun lt!7366 () Unit!462)

(declare-fun lt!7348 () Unit!462)

(assert (=> d!3837 (= lt!7366 lt!7348)))

(declare-fun lt!7353 () array!1207)

(assert (=> d!3837 (arrayContainsKey!0 lt!7353 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000)))

(assert (=> d!3837 (= lt!7348 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!7353 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772))))))

(assert (=> d!3837 (= lt!7353 (array!1208 (store (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))))))

(declare-fun lt!7358 () Unit!462)

(declare-fun lt!7343 () Unit!462)

(assert (=> d!3837 (= lt!7358 lt!7343)))

(assert (=> d!3837 (= (+!41 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) (tuple2!911 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (getCurrentListMap!124 (array!1208 (store (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (array!1210 (store (arr!573 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ValueCellFull!299 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (size!666 (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> d!3837 (= lt!7343 (lemmaAddValidKeyToArrayThenAddPairToListMap!2 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7356 () Unit!462)

(declare-fun lt!7359 () Unit!462)

(assert (=> d!3837 (= lt!7356 lt!7359)))

(assert (=> d!3837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!1208 (store (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3837 (= lt!7359 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7346 () Unit!462)

(declare-fun lt!7368 () Unit!462)

(assert (=> d!3837 (= lt!7346 lt!7368)))

(assert (=> d!3837 (= (arrayCountValidKeys!0 (array!1208 (store (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) (bvadd (arrayCountValidKeys!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) #b00000000000000000000000000000001))))

(assert (=> d!3837 (= lt!7368 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!7349 () Unit!462)

(declare-fun lt!7363 () Unit!462)

(assert (=> d!3837 (= lt!7349 lt!7363)))

(declare-fun lt!7365 () (_ BitVec 32))

(declare-fun lt!7352 () List!559)

(assert (=> d!3837 (arrayNoDuplicates!0 (array!1208 (store (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))) (size!665 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)))) lt!7365 lt!7352)))

(assert (=> d!3837 (= lt!7363 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772)) lt!7365 lt!7352))))

(assert (=> d!3837 (= lt!7352 Nil!556)))

(assert (=> d!3837 (= lt!7365 #b00000000000000000000000000000000)))

(declare-fun lt!7362 () Unit!462)

(declare-fun e!14357 () Unit!462)

(assert (=> d!3837 (= lt!7362 e!14357)))

(declare-fun c!2668 () Bool)

(assert (=> d!3837 (= c!2668 (arrayContainsKey!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun lt!7354 () Unit!462)

(declare-fun e!14358 () Unit!462)

(assert (=> d!3837 (= lt!7354 e!14358)))

(assert (=> d!3837 (= c!2671 (contains!224 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3837 (valid!108 (ite c!2450 (_2!459 lt!6654) lt!6655))))

(assert (=> d!3837 (= (updateHelperNewKey!7 (ite c!2450 (_2!459 lt!6654) lt!6655) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (ite c!2503 (index!2327 lt!6772) (index!2324 lt!6772))) lt!7351)))

(declare-fun bm!1551 () Bool)

(declare-fun call!1554 () Bool)

(assert (=> bm!1551 (= call!1554 call!1555)))

(declare-fun b!22136 () Bool)

(declare-fun res!14071 () Bool)

(assert (=> b!22136 (= res!14071 call!1555)))

(assert (=> b!22136 (=> (not res!14071) (not e!14364))))

(declare-fun b!22137 () Bool)

(declare-fun e!14359 () Bool)

(assert (=> b!22137 (= e!14359 e!14363)))

(declare-fun res!14070 () Bool)

(assert (=> b!22137 (= res!14070 call!1554)))

(assert (=> b!22137 (=> (not res!14070) (not e!14363))))

(declare-fun b!22138 () Bool)

(declare-fun Unit!492 () Unit!462)

(assert (=> b!22138 (= e!14357 Unit!492)))

(declare-fun lt!7355 () Unit!462)

(assert (=> b!22138 (= lt!7355 (lemmaArrayContainsKeyThenInListMap!2 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> b!22138 (contains!224 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!7360 () Unit!462)

(assert (=> b!22138 (= lt!7360 lt!7355)))

(assert (=> b!22138 false))

(declare-fun b!22139 () Bool)

(declare-fun c!2670 () Bool)

(assert (=> b!22139 (= c!2670 ((_ is MissingVacant!51) lt!7357))))

(declare-fun e!14361 () Bool)

(assert (=> b!22139 (= e!14361 e!14359)))

(declare-fun b!22140 () Bool)

(declare-fun res!14073 () Bool)

(assert (=> b!22140 (=> (not res!14073) (not e!14360))))

(assert (=> b!22140 (= res!14073 (valid!108 (_2!459 lt!7351)))))

(declare-fun b!22141 () Bool)

(declare-fun res!14074 () Bool)

(declare-fun e!14362 () Bool)

(assert (=> b!22141 (=> (not res!14074) (not e!14362))))

(assert (=> b!22141 (= res!14074 call!1554)))

(assert (=> b!22141 (= e!14361 e!14362)))

(declare-fun b!22142 () Bool)

(declare-fun Unit!493 () Unit!462)

(assert (=> b!22142 (= e!14358 Unit!493)))

(declare-fun lt!7345 () Unit!462)

(assert (=> b!22142 (= lt!7345 (lemmaInListMapThenSeekEntryOrOpenFindsIt!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun call!1553 () SeekEntryResult!51)

(assert (=> b!22142 (= lt!7367 call!1553)))

(declare-fun res!14075 () Bool)

(assert (=> b!22142 (= res!14075 ((_ is Found!51) lt!7367))))

(assert (=> b!22142 (=> (not res!14075) (not e!14364))))

(assert (=> b!22142 e!14364))

(declare-fun lt!7350 () Unit!462)

(assert (=> b!22142 (= lt!7350 lt!7345)))

(assert (=> b!22142 false))

(declare-fun bm!1552 () Bool)

(assert (=> bm!1552 (= call!1556 (arrayContainsKey!0 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!22143 () Bool)

(declare-fun Unit!494 () Unit!462)

(assert (=> b!22143 (= e!14357 Unit!494)))

(declare-fun b!22144 () Bool)

(declare-fun res!14078 () Bool)

(assert (=> b!22144 (=> (not res!14078) (not e!14362))))

(assert (=> b!22144 (= res!14078 (= (select (arr!572 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655))) (index!2324 lt!7357)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22145 () Bool)

(assert (=> b!22145 (= e!14362 (not call!1556))))

(declare-fun bm!1553 () Bool)

(assert (=> bm!1553 (= call!1553 (seekEntryOrOpen!0 (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun b!22146 () Bool)

(declare-fun lt!7369 () Unit!462)

(assert (=> b!22146 (= e!14358 lt!7369)))

(assert (=> b!22146 (= lt!7369 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2449 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> b!22146 (= lt!7357 call!1553)))

(assert (=> b!22146 (= c!2669 ((_ is MissingZero!51) lt!7357))))

(assert (=> b!22146 e!14361))

(declare-fun b!22147 () Bool)

(assert (=> b!22147 (= e!14359 ((_ is Undefined!51) lt!7357))))

(assert (= (and d!3837 c!2671) b!22142))

(assert (= (and d!3837 (not c!2671)) b!22146))

(assert (= (and b!22142 res!14075) b!22136))

(assert (= (and b!22136 res!14071) b!22134))

(assert (= (and b!22146 c!2669) b!22141))

(assert (= (and b!22146 (not c!2669)) b!22139))

(assert (= (and b!22141 res!14074) b!22144))

(assert (= (and b!22144 res!14078) b!22145))

(assert (= (and b!22139 c!2670) b!22137))

(assert (= (and b!22139 (not c!2670)) b!22147))

(assert (= (and b!22137 res!14070) b!22131))

(assert (= (and b!22131 res!14072) b!22133))

(assert (= (or b!22141 b!22137) bm!1551))

(assert (= (or b!22145 b!22133) bm!1552))

(assert (= (or b!22136 bm!1551) bm!1550))

(assert (= (or b!22142 b!22146) bm!1553))

(assert (= (and d!3837 c!2668) b!22138))

(assert (= (and d!3837 (not c!2668)) b!22143))

(assert (= (and d!3837 res!14077) b!22140))

(assert (= (and b!22140 res!14073) b!22132))

(assert (= (and b!22132 res!14076) b!22135))

(declare-fun m!15870 () Bool)

(assert (=> b!22132 m!15870))

(assert (=> b!22132 m!15870))

(declare-fun m!15872 () Bool)

(assert (=> b!22132 m!15872))

(declare-fun m!15874 () Bool)

(assert (=> b!22134 m!15874))

(assert (=> b!22142 m!14923))

(declare-fun m!15876 () Bool)

(assert (=> b!22138 m!15876))

(assert (=> b!22138 m!14945))

(assert (=> b!22138 m!14945))

(declare-fun m!15878 () Bool)

(assert (=> b!22138 m!15878))

(declare-fun m!15880 () Bool)

(assert (=> b!22144 m!15880))

(assert (=> b!22135 m!15870))

(assert (=> b!22135 m!14973))

(assert (=> b!22135 m!14973))

(declare-fun m!15882 () Bool)

(assert (=> b!22135 m!15882))

(assert (=> b!22146 m!14965))

(declare-fun m!15884 () Bool)

(assert (=> b!22140 m!15884))

(assert (=> d!3837 m!14945))

(assert (=> d!3837 m!15878))

(declare-fun m!15886 () Bool)

(assert (=> d!3837 m!15886))

(declare-fun m!15888 () Bool)

(assert (=> d!3837 m!15888))

(declare-fun m!15890 () Bool)

(assert (=> d!3837 m!15890))

(declare-fun m!15892 () Bool)

(assert (=> d!3837 m!15892))

(declare-fun m!15894 () Bool)

(assert (=> d!3837 m!15894))

(declare-fun m!15896 () Bool)

(assert (=> d!3837 m!15896))

(declare-fun m!15898 () Bool)

(assert (=> d!3837 m!15898))

(declare-fun m!15900 () Bool)

(assert (=> d!3837 m!15900))

(assert (=> d!3837 m!14979))

(assert (=> d!3837 m!15556))

(declare-fun m!15902 () Bool)

(assert (=> d!3837 m!15902))

(assert (=> d!3837 m!14945))

(declare-fun m!15904 () Bool)

(assert (=> d!3837 m!15904))

(declare-fun m!15906 () Bool)

(assert (=> d!3837 m!15906))

(declare-fun m!15908 () Bool)

(assert (=> d!3837 m!15908))

(assert (=> d!3837 m!14977))

(declare-fun m!15910 () Bool)

(assert (=> d!3837 m!15910))

(declare-fun m!15912 () Bool)

(assert (=> d!3837 m!15912))

(assert (=> d!3837 m!15892))

(declare-fun m!15914 () Bool)

(assert (=> d!3837 m!15914))

(declare-fun m!15916 () Bool)

(assert (=> d!3837 m!15916))

(assert (=> d!3837 m!15912))

(declare-fun m!15918 () Bool)

(assert (=> d!3837 m!15918))

(declare-fun m!15920 () Bool)

(assert (=> d!3837 m!15920))

(assert (=> d!3837 m!14945))

(assert (=> d!3837 m!15232))

(declare-fun m!15922 () Bool)

(assert (=> bm!1550 m!15922))

(assert (=> bm!1553 m!14939))

(declare-fun m!15924 () Bool)

(assert (=> b!22131 m!15924))

(assert (=> bm!1552 m!14979))

(assert (=> bm!1421 d!3837))

(declare-fun d!3839 () Bool)

(declare-fun e!14366 () Bool)

(assert (=> d!3839 e!14366))

(declare-fun res!14079 () Bool)

(assert (=> d!3839 (=> res!14079 e!14366)))

(declare-fun lt!7374 () Bool)

(assert (=> d!3839 (= res!14079 (not lt!7374))))

(declare-fun lt!7373 () Bool)

(assert (=> d!3839 (= lt!7374 lt!7373)))

(declare-fun lt!7371 () Unit!462)

(declare-fun e!14365 () Unit!462)

(assert (=> d!3839 (= lt!7371 e!14365)))

(declare-fun c!2672 () Bool)

(assert (=> d!3839 (= c!2672 lt!7373)))

(assert (=> d!3839 (= lt!7373 (containsKey!24 (toList!294 call!1431) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3839 (= (contains!224 call!1431 #b0000000000000000000000000000000000000000000000000000000000000000) lt!7374)))

(declare-fun b!22148 () Bool)

(declare-fun lt!7372 () Unit!462)

(assert (=> b!22148 (= e!14365 lt!7372)))

(assert (=> b!22148 (= lt!7372 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!294 call!1431) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22148 (isDefined!22 (getValueByKey!60 (toList!294 call!1431) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22149 () Bool)

(declare-fun Unit!495 () Unit!462)

(assert (=> b!22149 (= e!14365 Unit!495)))

(declare-fun b!22150 () Bool)

(assert (=> b!22150 (= e!14366 (isDefined!22 (getValueByKey!60 (toList!294 call!1431) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3839 c!2672) b!22148))

(assert (= (and d!3839 (not c!2672)) b!22149))

(assert (= (and d!3839 (not res!14079)) b!22150))

(declare-fun m!15926 () Bool)

(assert (=> d!3839 m!15926))

(declare-fun m!15928 () Bool)

(assert (=> b!22148 m!15928))

(declare-fun m!15930 () Bool)

(assert (=> b!22148 m!15930))

(assert (=> b!22148 m!15930))

(declare-fun m!15932 () Bool)

(assert (=> b!22148 m!15932))

(assert (=> b!22150 m!15930))

(assert (=> b!22150 m!15930))

(assert (=> b!22150 m!15932))

(assert (=> b!21597 d!3839))

(assert (=> bm!1443 d!3733))

(declare-fun d!3841 () Bool)

(declare-fun e!14367 () Bool)

(assert (=> d!3841 e!14367))

(declare-fun res!14081 () Bool)

(assert (=> d!3841 (=> (not res!14081) (not e!14367))))

(declare-fun lt!7375 () ListLongMap!557)

(assert (=> d!3841 (= res!14081 (contains!224 lt!7375 (_1!458 (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(declare-fun lt!7376 () List!558)

(assert (=> d!3841 (= lt!7375 (ListLongMap!558 lt!7376))))

(declare-fun lt!7377 () Unit!462)

(declare-fun lt!7378 () Unit!462)

(assert (=> d!3841 (= lt!7377 lt!7378)))

(assert (=> d!3841 (= (getValueByKey!60 lt!7376 (_1!458 (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (Some!65 (_2!458 (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(assert (=> d!3841 (= lt!7378 (lemmaContainsTupThenGetReturnValue!17 lt!7376 (_1!458 (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (_2!458 (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(assert (=> d!3841 (= lt!7376 (insertStrictlySorted!17 (toList!294 (ite c!2540 call!1465 (ite c!2538 call!1468 call!1467))) (_1!458 (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (_2!458 (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(assert (=> d!3841 (= (+!41 (ite c!2540 call!1465 (ite c!2538 call!1468 call!1467)) (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) lt!7375)))

(declare-fun b!22151 () Bool)

(declare-fun res!14080 () Bool)

(assert (=> b!22151 (=> (not res!14080) (not e!14367))))

(assert (=> b!22151 (= res!14080 (= (getValueByKey!60 (toList!294 lt!7375) (_1!458 (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (Some!65 (_2!458 (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))))

(declare-fun b!22152 () Bool)

(assert (=> b!22152 (= e!14367 (contains!225 (toList!294 lt!7375) (ite (or c!2540 c!2538) (tuple2!911 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (= (and d!3841 res!14081) b!22151))

(assert (= (and b!22151 res!14080) b!22152))

(declare-fun m!15934 () Bool)

(assert (=> d!3841 m!15934))

(declare-fun m!15936 () Bool)

(assert (=> d!3841 m!15936))

(declare-fun m!15938 () Bool)

(assert (=> d!3841 m!15938))

(declare-fun m!15940 () Bool)

(assert (=> d!3841 m!15940))

(declare-fun m!15942 () Bool)

(assert (=> b!22151 m!15942))

(declare-fun m!15944 () Bool)

(assert (=> b!22152 m!15944))

(assert (=> bm!1465 d!3841))

(declare-fun d!3843 () Bool)

(assert (=> d!3843 (= (inRange!0 (ite c!2508 (ite c!2499 (index!2325 lt!6776) (ite c!2510 (index!2324 lt!6760) (index!2327 lt!6760))) (ite c!2501 (index!2325 lt!6764) (ite c!2500 (index!2324 lt!6766) (index!2327 lt!6766)))) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655))) (and (bvsge (ite c!2508 (ite c!2499 (index!2325 lt!6776) (ite c!2510 (index!2324 lt!6760) (index!2327 lt!6760))) (ite c!2501 (index!2325 lt!6764) (ite c!2500 (index!2324 lt!6766) (index!2327 lt!6766)))) #b00000000000000000000000000000000) (bvslt (ite c!2508 (ite c!2499 (index!2325 lt!6776) (ite c!2510 (index!2324 lt!6760) (index!2327 lt!6760))) (ite c!2501 (index!2325 lt!6764) (ite c!2500 (index!2324 lt!6766) (index!2327 lt!6766)))) (bvadd (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000001))))))

(assert (=> bm!1401 d!3843))

(declare-fun d!3845 () Bool)

(assert (=> d!3845 (= (apply!28 lt!6872 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) (get!378 (getValueByKey!60 (toList!294 lt!6872) (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))))

(declare-fun bs!918 () Bool)

(assert (= bs!918 d!3845))

(assert (=> bs!918 m!15047))

(declare-fun m!15946 () Bool)

(assert (=> bs!918 m!15946))

(assert (=> bs!918 m!15946))

(declare-fun m!15948 () Bool)

(assert (=> bs!918 m!15948))

(assert (=> b!21646 d!3845))

(declare-fun d!3847 () Bool)

(declare-fun c!2675 () Bool)

(assert (=> d!3847 (= c!2675 ((_ is ValueCellFull!299) (select (arr!573 (_values!1707 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun e!14370 () V!1155)

(assert (=> d!3847 (= (get!377 (select (arr!573 (_values!1707 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!14370)))

(declare-fun b!22157 () Bool)

(declare-fun get!379 (ValueCell!299 V!1155) V!1155)

(assert (=> b!22157 (= e!14370 (get!379 (select (arr!573 (_values!1707 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!22158 () Bool)

(declare-fun get!380 (ValueCell!299 V!1155) V!1155)

(assert (=> b!22158 (= e!14370 (get!380 (select (arr!573 (_values!1707 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))) (dynLambda!137 (defaultEntry!1718 (v!1571 (underlying!103 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!3847 c!2675) b!22157))

(assert (= (and d!3847 (not c!2675)) b!22158))

(assert (=> b!22157 m!15053))

(assert (=> b!22157 m!15055))

(declare-fun m!15950 () Bool)

(assert (=> b!22157 m!15950))

(assert (=> b!22158 m!15053))

(assert (=> b!22158 m!15055))

(declare-fun m!15952 () Bool)

(assert (=> b!22158 m!15952))

(assert (=> b!21646 d!3847))

(declare-fun d!3849 () Bool)

(assert (=> d!3849 (= (inRange!0 (ite c!2522 (ite c!2513 (index!2325 lt!6803) (ite c!2524 (index!2324 lt!6787) (index!2327 lt!6787))) (ite c!2515 (index!2325 lt!6791) (ite c!2514 (index!2324 lt!6793) (index!2327 lt!6793)))) (mask!4691 lt!6655)) (and (bvsge (ite c!2522 (ite c!2513 (index!2325 lt!6803) (ite c!2524 (index!2324 lt!6787) (index!2327 lt!6787))) (ite c!2515 (index!2325 lt!6791) (ite c!2514 (index!2324 lt!6793) (index!2327 lt!6793)))) #b00000000000000000000000000000000) (bvslt (ite c!2522 (ite c!2513 (index!2325 lt!6803) (ite c!2524 (index!2324 lt!6787) (index!2327 lt!6787))) (ite c!2515 (index!2325 lt!6791) (ite c!2514 (index!2324 lt!6793) (index!2327 lt!6793)))) (bvadd (mask!4691 lt!6655) #b00000000000000000000000000000001))))))

(assert (=> bm!1425 d!3849))

(assert (=> d!3719 d!3831))

(declare-fun d!3851 () Bool)

(assert (=> d!3851 (arrayForallSeekEntryOrOpenFound!0 lt!6930 lt!6927 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))))))

(declare-fun lt!7381 () Unit!462)

(declare-fun choose!34 (array!1207 (_ BitVec 32) (_ BitVec 32)) Unit!462)

(assert (=> d!3851 (= lt!7381 (choose!34 lt!6927 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) lt!6930))))

(assert (=> d!3851 (validMask!0 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))))))

(assert (=> d!3851 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6927 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) lt!6930) lt!7381)))

(declare-fun bs!919 () Bool)

(assert (= bs!919 d!3851))

(assert (=> bs!919 m!14861))

(assert (=> bs!919 m!15123))

(assert (=> bs!919 m!14861))

(declare-fun m!15954 () Bool)

(assert (=> bs!919 m!15954))

(assert (=> bs!919 m!14861))

(assert (=> bs!919 m!15117))

(assert (=> d!3719 d!3851))

(declare-fun d!3853 () Bool)

(declare-fun lt!7382 () (_ BitVec 32))

(assert (=> d!3853 (and (bvsge lt!7382 #b00000000000000000000000000000000) (bvsle lt!7382 (bvsub (size!665 lt!6929) lt!6923)))))

(declare-fun e!14372 () (_ BitVec 32))

(assert (=> d!3853 (= lt!7382 e!14372)))

(declare-fun c!2676 () Bool)

(assert (=> d!3853 (= c!2676 (bvsge lt!6923 lt!6942))))

(assert (=> d!3853 (and (bvsle lt!6923 lt!6942) (bvsge lt!6923 #b00000000000000000000000000000000) (bvsle lt!6942 (size!665 lt!6929)))))

(assert (=> d!3853 (= (arrayCountValidKeys!0 lt!6929 lt!6923 lt!6942) lt!7382)))

(declare-fun b!22159 () Bool)

(declare-fun e!14371 () (_ BitVec 32))

(declare-fun call!1557 () (_ BitVec 32))

(assert (=> b!22159 (= e!14371 call!1557)))

(declare-fun b!22160 () Bool)

(assert (=> b!22160 (= e!14372 e!14371)))

(declare-fun c!2677 () Bool)

(assert (=> b!22160 (= c!2677 (validKeyInArray!0 (select (arr!572 lt!6929) lt!6923)))))

(declare-fun bm!1554 () Bool)

(assert (=> bm!1554 (= call!1557 (arrayCountValidKeys!0 lt!6929 (bvadd lt!6923 #b00000000000000000000000000000001) lt!6942))))

(declare-fun b!22161 () Bool)

(assert (=> b!22161 (= e!14371 (bvadd #b00000000000000000000000000000001 call!1557))))

(declare-fun b!22162 () Bool)

(assert (=> b!22162 (= e!14372 #b00000000000000000000000000000000)))

(assert (= (and d!3853 c!2676) b!22162))

(assert (= (and d!3853 (not c!2676)) b!22160))

(assert (= (and b!22160 c!2677) b!22161))

(assert (= (and b!22160 (not c!2677)) b!22159))

(assert (= (or b!22161 b!22159) bm!1554))

(declare-fun m!15956 () Bool)

(assert (=> b!22160 m!15956))

(assert (=> b!22160 m!15956))

(declare-fun m!15958 () Bool)

(assert (=> b!22160 m!15958))

(declare-fun m!15960 () Bool)

(assert (=> bm!1554 m!15960))

(assert (=> d!3719 d!3853))

(declare-fun b!22163 () Bool)

(declare-fun e!14376 () Bool)

(declare-fun e!14373 () Bool)

(assert (=> b!22163 (= e!14376 e!14373)))

(declare-fun c!2678 () Bool)

(assert (=> b!22163 (= c!2678 (validKeyInArray!0 (select (arr!572 lt!6938) lt!6939)))))

(declare-fun b!22164 () Bool)

(declare-fun call!1558 () Bool)

(assert (=> b!22164 (= e!14373 call!1558)))

(declare-fun b!22165 () Bool)

(assert (=> b!22165 (= e!14373 call!1558)))

(declare-fun d!3855 () Bool)

(declare-fun res!14083 () Bool)

(declare-fun e!14374 () Bool)

(assert (=> d!3855 (=> res!14083 e!14374)))

(assert (=> d!3855 (= res!14083 (bvsge lt!6939 (size!665 lt!6938)))))

(assert (=> d!3855 (= (arrayNoDuplicates!0 lt!6938 lt!6939 lt!6932) e!14374)))

(declare-fun bm!1555 () Bool)

(assert (=> bm!1555 (= call!1558 (arrayNoDuplicates!0 lt!6938 (bvadd lt!6939 #b00000000000000000000000000000001) (ite c!2678 (Cons!555 (select (arr!572 lt!6938) lt!6939) lt!6932) lt!6932)))))

(declare-fun b!22166 () Bool)

(assert (=> b!22166 (= e!14374 e!14376)))

(declare-fun res!14084 () Bool)

(assert (=> b!22166 (=> (not res!14084) (not e!14376))))

(declare-fun e!14375 () Bool)

(assert (=> b!22166 (= res!14084 (not e!14375))))

(declare-fun res!14082 () Bool)

(assert (=> b!22166 (=> (not res!14082) (not e!14375))))

(assert (=> b!22166 (= res!14082 (validKeyInArray!0 (select (arr!572 lt!6938) lt!6939)))))

(declare-fun b!22167 () Bool)

(assert (=> b!22167 (= e!14375 (contains!226 lt!6932 (select (arr!572 lt!6938) lt!6939)))))

(assert (= (and d!3855 (not res!14083)) b!22166))

(assert (= (and b!22166 res!14082) b!22167))

(assert (= (and b!22166 res!14084) b!22163))

(assert (= (and b!22163 c!2678) b!22165))

(assert (= (and b!22163 (not c!2678)) b!22164))

(assert (= (or b!22165 b!22164) bm!1555))

(declare-fun m!15962 () Bool)

(assert (=> b!22163 m!15962))

(assert (=> b!22163 m!15962))

(declare-fun m!15964 () Bool)

(assert (=> b!22163 m!15964))

(assert (=> bm!1555 m!15962))

(declare-fun m!15966 () Bool)

(assert (=> bm!1555 m!15966))

(assert (=> b!22166 m!15962))

(assert (=> b!22166 m!15962))

(assert (=> b!22166 m!15964))

(assert (=> b!22167 m!15962))

(assert (=> b!22167 m!15962))

(declare-fun m!15968 () Bool)

(assert (=> b!22167 m!15968))

(assert (=> d!3719 d!3855))

(declare-fun d!3857 () Bool)

(assert (=> d!3857 (= (validMask!0 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938))))) (and (or (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000001111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000011111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000001111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000011111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000001111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000011111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000001111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000011111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000001111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000011111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000001111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000011111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000111111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000001111111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000011111111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000111111111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000001111111111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000011111111111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000111111111111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00001111111111111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00011111111111111111111111111111) (= (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00111111111111111111111111111111)) (bvsle (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00111111111111111111111111111111)))))

(assert (=> d!3719 d!3857))

(declare-fun b!22168 () Bool)

(declare-fun e!14378 () Bool)

(declare-fun call!1559 () Bool)

(assert (=> b!22168 (= e!14378 call!1559)))

(declare-fun d!3859 () Bool)

(declare-fun res!14085 () Bool)

(declare-fun e!14377 () Bool)

(assert (=> d!3859 (=> res!14085 e!14377)))

(assert (=> d!3859 (= res!14085 (bvsge lt!6930 (size!665 lt!6927)))))

(assert (=> d!3859 (= (arrayForallSeekEntryOrOpenFound!0 lt!6930 lt!6927 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938))))) e!14377)))

(declare-fun b!22169 () Bool)

(declare-fun e!14379 () Bool)

(assert (=> b!22169 (= e!14377 e!14379)))

(declare-fun c!2679 () Bool)

(assert (=> b!22169 (= c!2679 (validKeyInArray!0 (select (arr!572 lt!6927) lt!6930)))))

(declare-fun b!22170 () Bool)

(assert (=> b!22170 (= e!14379 call!1559)))

(declare-fun b!22171 () Bool)

(assert (=> b!22171 (= e!14379 e!14378)))

(declare-fun lt!7384 () (_ BitVec 64))

(assert (=> b!22171 (= lt!7384 (select (arr!572 lt!6927) lt!6930))))

(declare-fun lt!7385 () Unit!462)

(assert (=> b!22171 (= lt!7385 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!6927 lt!7384 lt!6930))))

(assert (=> b!22171 (arrayContainsKey!0 lt!6927 lt!7384 #b00000000000000000000000000000000)))

(declare-fun lt!7383 () Unit!462)

(assert (=> b!22171 (= lt!7383 lt!7385)))

(declare-fun res!14086 () Bool)

(assert (=> b!22171 (= res!14086 (= (seekEntryOrOpen!0 (select (arr!572 lt!6927) lt!6930) lt!6927 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938))))) (Found!51 lt!6930)))))

(assert (=> b!22171 (=> (not res!14086) (not e!14378))))

(declare-fun bm!1556 () Bool)

(assert (=> bm!1556 (= call!1559 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!6930 #b00000000000000000000000000000001) lt!6927 (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938))))))))

(assert (= (and d!3859 (not res!14085)) b!22169))

(assert (= (and b!22169 c!2679) b!22171))

(assert (= (and b!22169 (not c!2679)) b!22170))

(assert (= (and b!22171 res!14086) b!22168))

(assert (= (or b!22168 b!22170) bm!1556))

(declare-fun m!15970 () Bool)

(assert (=> b!22169 m!15970))

(assert (=> b!22169 m!15970))

(declare-fun m!15972 () Bool)

(assert (=> b!22169 m!15972))

(assert (=> b!22171 m!15970))

(declare-fun m!15974 () Bool)

(assert (=> b!22171 m!15974))

(declare-fun m!15976 () Bool)

(assert (=> b!22171 m!15976))

(assert (=> b!22171 m!15970))

(assert (=> b!22171 m!14861))

(declare-fun m!15978 () Bool)

(assert (=> b!22171 m!15978))

(assert (=> bm!1556 m!14861))

(declare-fun m!15980 () Bool)

(assert (=> bm!1556 m!15980))

(assert (=> d!3719 d!3859))

(declare-fun d!3861 () Bool)

(assert (=> d!3861 (= (arrayCountValidKeys!0 lt!6929 lt!6923 lt!6942) #b00000000000000000000000000000000)))

(declare-fun lt!7388 () Unit!462)

(declare-fun choose!59 (array!1207 (_ BitVec 32) (_ BitVec 32)) Unit!462)

(assert (=> d!3861 (= lt!7388 (choose!59 lt!6929 lt!6923 lt!6942))))

(assert (=> d!3861 (bvslt (size!665 lt!6929) #b01111111111111111111111111111111)))

(assert (=> d!3861 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6929 lt!6923 lt!6942) lt!7388)))

(declare-fun bs!920 () Bool)

(assert (= bs!920 d!3861))

(assert (=> bs!920 m!15107))

(declare-fun m!15982 () Bool)

(assert (=> bs!920 m!15982))

(assert (=> d!3719 d!3861))

(declare-fun d!3863 () Bool)

(assert (=> d!3863 (arrayNoDuplicates!0 lt!6938 lt!6939 lt!6932)))

(declare-fun lt!7391 () Unit!462)

(declare-fun choose!111 (array!1207 (_ BitVec 32) (_ BitVec 32) List!559) Unit!462)

(assert (=> d!3863 (= lt!7391 (choose!111 lt!6938 lt!6939 (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) lt!6932))))

(assert (=> d!3863 (= (size!665 lt!6938) (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3863 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!6938 lt!6939 (bvadd (computeNewMask!25 thiss!938 (mask!4691 (v!1571 (underlying!103 thiss!938))) (_vacant!133 (v!1571 (underlying!103 thiss!938))) (_size!133 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001) lt!6932) lt!7391)))

(declare-fun bs!921 () Bool)

(assert (= bs!921 d!3863))

(assert (=> bs!921 m!15113))

(declare-fun m!15984 () Bool)

(assert (=> bs!921 m!15984))

(assert (=> d!3719 d!3863))

(declare-fun d!3865 () Bool)

(declare-fun res!14087 () Bool)

(declare-fun e!14380 () Bool)

(assert (=> d!3865 (=> (not res!14087) (not e!14380))))

(assert (=> d!3865 (= res!14087 (simpleValid!19 lt!6925))))

(assert (=> d!3865 (= (valid!108 lt!6925) e!14380)))

(declare-fun b!22172 () Bool)

(declare-fun res!14088 () Bool)

(assert (=> b!22172 (=> (not res!14088) (not e!14380))))

(assert (=> b!22172 (= res!14088 (= (arrayCountValidKeys!0 (_keys!3139 lt!6925) #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6925))) (_size!133 lt!6925)))))

(declare-fun b!22173 () Bool)

(declare-fun res!14089 () Bool)

(assert (=> b!22173 (=> (not res!14089) (not e!14380))))

(assert (=> b!22173 (= res!14089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 lt!6925) (mask!4691 lt!6925)))))

(declare-fun b!22174 () Bool)

(assert (=> b!22174 (= e!14380 (arrayNoDuplicates!0 (_keys!3139 lt!6925) #b00000000000000000000000000000000 Nil!556))))

(assert (= (and d!3865 res!14087) b!22172))

(assert (= (and b!22172 res!14088) b!22173))

(assert (= (and b!22173 res!14089) b!22174))

(declare-fun m!15986 () Bool)

(assert (=> d!3865 m!15986))

(declare-fun m!15988 () Bool)

(assert (=> b!22172 m!15988))

(declare-fun m!15990 () Bool)

(assert (=> b!22173 m!15990))

(declare-fun m!15992 () Bool)

(assert (=> b!22174 m!15992))

(assert (=> d!3719 d!3865))

(declare-fun d!3867 () Bool)

(declare-fun res!14090 () Bool)

(declare-fun e!14381 () Bool)

(assert (=> d!3867 (=> (not res!14090) (not e!14381))))

(assert (=> d!3867 (= res!14090 (simpleValid!19 (_2!459 lt!6789)))))

(assert (=> d!3867 (= (valid!108 (_2!459 lt!6789)) e!14381)))

(declare-fun b!22175 () Bool)

(declare-fun res!14091 () Bool)

(assert (=> b!22175 (=> (not res!14091) (not e!14381))))

(assert (=> b!22175 (= res!14091 (= (arrayCountValidKeys!0 (_keys!3139 (_2!459 lt!6789)) #b00000000000000000000000000000000 (size!665 (_keys!3139 (_2!459 lt!6789)))) (_size!133 (_2!459 lt!6789))))))

(declare-fun b!22176 () Bool)

(declare-fun res!14092 () Bool)

(assert (=> b!22176 (=> (not res!14092) (not e!14381))))

(assert (=> b!22176 (= res!14092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 (_2!459 lt!6789)) (mask!4691 (_2!459 lt!6789))))))

(declare-fun b!22177 () Bool)

(assert (=> b!22177 (= e!14381 (arrayNoDuplicates!0 (_keys!3139 (_2!459 lt!6789)) #b00000000000000000000000000000000 Nil!556))))

(assert (= (and d!3867 res!14090) b!22175))

(assert (= (and b!22175 res!14091) b!22176))

(assert (= (and b!22176 res!14092) b!22177))

(declare-fun m!15994 () Bool)

(assert (=> d!3867 m!15994))

(declare-fun m!15996 () Bool)

(assert (=> b!22175 m!15996))

(declare-fun m!15998 () Bool)

(assert (=> b!22176 m!15998))

(declare-fun m!16000 () Bool)

(assert (=> b!22177 m!16000))

(assert (=> d!3711 d!3867))

(declare-fun d!3869 () Bool)

(declare-fun res!14093 () Bool)

(declare-fun e!14382 () Bool)

(assert (=> d!3869 (=> (not res!14093) (not e!14382))))

(assert (=> d!3869 (= res!14093 (simpleValid!19 lt!6655))))

(assert (=> d!3869 (= (valid!108 lt!6655) e!14382)))

(declare-fun b!22178 () Bool)

(declare-fun res!14094 () Bool)

(assert (=> b!22178 (=> (not res!14094) (not e!14382))))

(assert (=> b!22178 (= res!14094 (= (arrayCountValidKeys!0 (_keys!3139 lt!6655) #b00000000000000000000000000000000 (size!665 (_keys!3139 lt!6655))) (_size!133 lt!6655)))))

(declare-fun b!22179 () Bool)

(declare-fun res!14095 () Bool)

(assert (=> b!22179 (=> (not res!14095) (not e!14382))))

(assert (=> b!22179 (= res!14095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3139 lt!6655) (mask!4691 lt!6655)))))

(declare-fun b!22180 () Bool)

(assert (=> b!22180 (= e!14382 (arrayNoDuplicates!0 (_keys!3139 lt!6655) #b00000000000000000000000000000000 Nil!556))))

(assert (= (and d!3869 res!14093) b!22178))

(assert (= (and b!22178 res!14094) b!22179))

(assert (= (and b!22179 res!14095) b!22180))

(declare-fun m!16002 () Bool)

(assert (=> d!3869 m!16002))

(assert (=> b!22178 m!15726))

(declare-fun m!16004 () Bool)

(assert (=> b!22179 m!16004))

(declare-fun m!16006 () Bool)

(assert (=> b!22180 m!16006))

(assert (=> d!3711 d!3869))

(declare-fun d!3871 () Bool)

(assert (=> d!3871 (= (+!41 (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))))) (getCurrentListMap!124 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) #b00000000000000000000000000000000 (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(declare-fun lt!7394 () Unit!462)

(declare-fun choose!201 (array!1207 array!1209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1155 V!1155 V!1155 Int) Unit!462)

(assert (=> d!3871 (= lt!7394 (choose!201 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))))))

(assert (=> d!3871 (validMask!0 (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)))))

(assert (=> d!3871 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3139 (ite c!2450 (_2!459 lt!6654) lt!6655)) (_values!1707 (ite c!2450 (_2!459 lt!6654) lt!6655)) (mask!4691 (ite c!2450 (_2!459 lt!6654) lt!6655)) (extraKeys!1621 (ite c!2450 (_2!459 lt!6654) lt!6655)) lt!6763 (zeroValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (minValue!1645 (ite c!2450 (_2!459 lt!6654) lt!6655)) (ite c!2450 (minValue!1645 (v!1571 (underlying!103 thiss!938))) (ite c!2449 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (defaultEntry!1718 (ite c!2450 (_2!459 lt!6654) lt!6655))) lt!7394)))

(declare-fun bs!922 () Bool)

(assert (= bs!922 d!3871))

(assert (=> bs!922 m!14945))

(assert (=> bs!922 m!15147))

(assert (=> bs!922 m!14945))

(declare-fun m!16008 () Bool)

(assert (=> bs!922 m!16008))

(declare-fun m!16010 () Bool)

(assert (=> bs!922 m!16010))

(declare-fun m!16012 () Bool)

(assert (=> bs!922 m!16012))

(assert (=> b!21520 d!3871))

(declare-fun d!3873 () Bool)

(assert (=> d!3873 (= (map!397 lt!6655) (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun bs!923 () Bool)

(assert (= bs!923 d!3873))

(assert (=> bs!923 m!15007))

(assert (=> bm!1424 d!3873))

(declare-fun d!3875 () Bool)

(declare-fun e!14383 () Bool)

(assert (=> d!3875 e!14383))

(declare-fun res!14097 () Bool)

(assert (=> d!3875 (=> (not res!14097) (not e!14383))))

(declare-fun lt!7395 () ListLongMap!557)

(assert (=> d!3875 (= res!14097 (contains!224 lt!7395 (_1!458 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun lt!7396 () List!558)

(assert (=> d!3875 (= lt!7395 (ListLongMap!558 lt!7396))))

(declare-fun lt!7397 () Unit!462)

(declare-fun lt!7398 () Unit!462)

(assert (=> d!3875 (= lt!7397 lt!7398)))

(assert (=> d!3875 (= (getValueByKey!60 lt!7396 (_1!458 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3875 (= lt!7398 (lemmaContainsTupThenGetReturnValue!17 lt!7396 (_1!458 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3875 (= lt!7396 (insertStrictlySorted!17 (toList!294 call!1469) (_1!458 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3875 (= (+!41 call!1469 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!7395)))

(declare-fun b!22181 () Bool)

(declare-fun res!14096 () Bool)

(assert (=> b!22181 (=> (not res!14096) (not e!14383))))

(assert (=> b!22181 (= res!14096 (= (getValueByKey!60 (toList!294 lt!7395) (_1!458 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(declare-fun b!22182 () Bool)

(assert (=> b!22182 (= e!14383 (contains!225 (toList!294 lt!7395) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))

(assert (= (and d!3875 res!14097) b!22181))

(assert (= (and b!22181 res!14096) b!22182))

(declare-fun m!16014 () Bool)

(assert (=> d!3875 m!16014))

(declare-fun m!16016 () Bool)

(assert (=> d!3875 m!16016))

(declare-fun m!16018 () Bool)

(assert (=> d!3875 m!16018))

(declare-fun m!16020 () Bool)

(assert (=> d!3875 m!16020))

(declare-fun m!16022 () Bool)

(assert (=> b!22181 m!16022))

(declare-fun m!16024 () Bool)

(assert (=> b!22182 m!16024))

(assert (=> b!21642 d!3875))

(declare-fun d!3877 () Bool)

(assert (=> d!3877 (= (apply!28 (+!41 lt!6855 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6868) (apply!28 lt!6855 lt!6868))))

(declare-fun lt!7401 () Unit!462)

(declare-fun choose!202 (ListLongMap!557 (_ BitVec 64) V!1155 (_ BitVec 64)) Unit!462)

(assert (=> d!3877 (= lt!7401 (choose!202 lt!6855 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6868))))

(declare-fun e!14386 () Bool)

(assert (=> d!3877 e!14386))

(declare-fun res!14100 () Bool)

(assert (=> d!3877 (=> (not res!14100) (not e!14386))))

(assert (=> d!3877 (= res!14100 (contains!224 lt!6855 lt!6868))))

(assert (=> d!3877 (= (addApplyDifferent!13 lt!6855 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6868) lt!7401)))

(declare-fun b!22186 () Bool)

(assert (=> b!22186 (= e!14386 (not (= lt!6868 lt!6862)))))

(assert (= (and d!3877 res!14100) b!22186))

(declare-fun m!16026 () Bool)

(assert (=> d!3877 m!16026))

(assert (=> d!3877 m!15083))

(declare-fun m!16028 () Bool)

(assert (=> d!3877 m!16028))

(assert (=> d!3877 m!15079))

(assert (=> d!3877 m!15079))

(assert (=> d!3877 m!15081))

(assert (=> b!21641 d!3877))

(declare-fun d!3879 () Bool)

(assert (=> d!3879 (= (apply!28 (+!41 lt!6866 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6864) (apply!28 lt!6866 lt!6864))))

(declare-fun lt!7402 () Unit!462)

(assert (=> d!3879 (= lt!7402 (choose!202 lt!6866 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6864))))

(declare-fun e!14387 () Bool)

(assert (=> d!3879 e!14387))

(declare-fun res!14101 () Bool)

(assert (=> d!3879 (=> (not res!14101) (not e!14387))))

(assert (=> d!3879 (= res!14101 (contains!224 lt!6866 lt!6864))))

(assert (=> d!3879 (= (addApplyDifferent!13 lt!6866 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6864) lt!7402)))

(declare-fun b!22187 () Bool)

(assert (=> b!22187 (= e!14387 (not (= lt!6864 lt!6870)))))

(assert (= (and d!3879 res!14101) b!22187))

(declare-fun m!16030 () Bool)

(assert (=> d!3879 m!16030))

(assert (=> d!3879 m!15095))

(declare-fun m!16032 () Bool)

(assert (=> d!3879 m!16032))

(assert (=> d!3879 m!15087))

(assert (=> d!3879 m!15087))

(assert (=> d!3879 m!15099))

(assert (=> b!21641 d!3879))

(declare-fun d!3881 () Bool)

(declare-fun e!14389 () Bool)

(assert (=> d!3881 e!14389))

(declare-fun res!14102 () Bool)

(assert (=> d!3881 (=> res!14102 e!14389)))

(declare-fun lt!7406 () Bool)

(assert (=> d!3881 (= res!14102 (not lt!7406))))

(declare-fun lt!7405 () Bool)

(assert (=> d!3881 (= lt!7406 lt!7405)))

(declare-fun lt!7403 () Unit!462)

(declare-fun e!14388 () Unit!462)

(assert (=> d!3881 (= lt!7403 e!14388)))

(declare-fun c!2680 () Bool)

(assert (=> d!3881 (= c!2680 lt!7405)))

(assert (=> d!3881 (= lt!7405 (containsKey!24 (toList!294 (+!41 lt!6860 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) lt!6865))))

(assert (=> d!3881 (= (contains!224 (+!41 lt!6860 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6865) lt!7406)))

(declare-fun b!22188 () Bool)

(declare-fun lt!7404 () Unit!462)

(assert (=> b!22188 (= e!14388 lt!7404)))

(assert (=> b!22188 (= lt!7404 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!294 (+!41 lt!6860 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) lt!6865))))

(assert (=> b!22188 (isDefined!22 (getValueByKey!60 (toList!294 (+!41 lt!6860 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) lt!6865))))

(declare-fun b!22189 () Bool)

(declare-fun Unit!496 () Unit!462)

(assert (=> b!22189 (= e!14388 Unit!496)))

(declare-fun b!22190 () Bool)

(assert (=> b!22190 (= e!14389 (isDefined!22 (getValueByKey!60 (toList!294 (+!41 lt!6860 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) lt!6865)))))

(assert (= (and d!3881 c!2680) b!22188))

(assert (= (and d!3881 (not c!2680)) b!22189))

(assert (= (and d!3881 (not res!14102)) b!22190))

(declare-fun m!16034 () Bool)

(assert (=> d!3881 m!16034))

(declare-fun m!16036 () Bool)

(assert (=> b!22188 m!16036))

(declare-fun m!16038 () Bool)

(assert (=> b!22188 m!16038))

(assert (=> b!22188 m!16038))

(declare-fun m!16040 () Bool)

(assert (=> b!22188 m!16040))

(assert (=> b!22190 m!16038))

(assert (=> b!22190 m!16038))

(assert (=> b!22190 m!16040))

(assert (=> b!21641 d!3881))

(declare-fun d!3883 () Bool)

(declare-fun e!14390 () Bool)

(assert (=> d!3883 e!14390))

(declare-fun res!14104 () Bool)

(assert (=> d!3883 (=> (not res!14104) (not e!14390))))

(declare-fun lt!7407 () ListLongMap!557)

(assert (=> d!3883 (= res!14104 (contains!224 lt!7407 (_1!458 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun lt!7408 () List!558)

(assert (=> d!3883 (= lt!7407 (ListLongMap!558 lt!7408))))

(declare-fun lt!7409 () Unit!462)

(declare-fun lt!7410 () Unit!462)

(assert (=> d!3883 (= lt!7409 lt!7410)))

(assert (=> d!3883 (= (getValueByKey!60 lt!7408 (_1!458 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3883 (= lt!7410 (lemmaContainsTupThenGetReturnValue!17 lt!7408 (_1!458 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3883 (= lt!7408 (insertStrictlySorted!17 (toList!294 lt!6855) (_1!458 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3883 (= (+!41 lt!6855 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!7407)))

(declare-fun b!22191 () Bool)

(declare-fun res!14103 () Bool)

(assert (=> b!22191 (=> (not res!14103) (not e!14390))))

(assert (=> b!22191 (= res!14103 (= (getValueByKey!60 (toList!294 lt!7407) (_1!458 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(declare-fun b!22192 () Bool)

(assert (=> b!22192 (= e!14390 (contains!225 (toList!294 lt!7407) (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))

(assert (= (and d!3883 res!14104) b!22191))

(assert (= (and b!22191 res!14103) b!22192))

(declare-fun m!16042 () Bool)

(assert (=> d!3883 m!16042))

(declare-fun m!16044 () Bool)

(assert (=> d!3883 m!16044))

(declare-fun m!16046 () Bool)

(assert (=> d!3883 m!16046))

(declare-fun m!16048 () Bool)

(assert (=> d!3883 m!16048))

(declare-fun m!16050 () Bool)

(assert (=> b!22191 m!16050))

(declare-fun m!16052 () Bool)

(assert (=> b!22192 m!16052))

(assert (=> b!21641 d!3883))

(declare-fun d!3885 () Bool)

(assert (=> d!3885 (contains!224 (+!41 lt!6860 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6865)))

(declare-fun lt!7413 () Unit!462)

(declare-fun choose!203 (ListLongMap!557 (_ BitVec 64) V!1155 (_ BitVec 64)) Unit!462)

(assert (=> d!3885 (= lt!7413 (choose!203 lt!6860 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6865))))

(assert (=> d!3885 (contains!224 lt!6860 lt!6865)))

(assert (=> d!3885 (= (addStillContains!13 lt!6860 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6865) lt!7413)))

(declare-fun bs!924 () Bool)

(assert (= bs!924 d!3885))

(assert (=> bs!924 m!15075))

(assert (=> bs!924 m!15075))

(assert (=> bs!924 m!15077))

(declare-fun m!16054 () Bool)

(assert (=> bs!924 m!16054))

(declare-fun m!16056 () Bool)

(assert (=> bs!924 m!16056))

(assert (=> b!21641 d!3885))

(declare-fun d!3887 () Bool)

(assert (=> d!3887 (= (apply!28 (+!41 lt!6866 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6864) (get!378 (getValueByKey!60 (toList!294 (+!41 lt!6866 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) lt!6864)))))

(declare-fun bs!925 () Bool)

(assert (= bs!925 d!3887))

(declare-fun m!16058 () Bool)

(assert (=> bs!925 m!16058))

(assert (=> bs!925 m!16058))

(declare-fun m!16060 () Bool)

(assert (=> bs!925 m!16060))

(assert (=> b!21641 d!3887))

(declare-fun d!3889 () Bool)

(assert (=> d!3889 (= (apply!28 lt!6855 lt!6868) (get!378 (getValueByKey!60 (toList!294 lt!6855) lt!6868)))))

(declare-fun bs!926 () Bool)

(assert (= bs!926 d!3889))

(declare-fun m!16062 () Bool)

(assert (=> bs!926 m!16062))

(assert (=> bs!926 m!16062))

(declare-fun m!16064 () Bool)

(assert (=> bs!926 m!16064))

(assert (=> b!21641 d!3889))

(declare-fun d!3891 () Bool)

(assert (=> d!3891 (= (apply!28 (+!41 lt!6869 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6863) (get!378 (getValueByKey!60 (toList!294 (+!41 lt!6869 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) lt!6863)))))

(declare-fun bs!927 () Bool)

(assert (= bs!927 d!3891))

(declare-fun m!16066 () Bool)

(assert (=> bs!927 m!16066))

(assert (=> bs!927 m!16066))

(declare-fun m!16068 () Bool)

(assert (=> bs!927 m!16068))

(assert (=> b!21641 d!3891))

(declare-fun d!3893 () Bool)

(assert (=> d!3893 (= (apply!28 lt!6869 lt!6863) (get!378 (getValueByKey!60 (toList!294 lt!6869) lt!6863)))))

(declare-fun bs!928 () Bool)

(assert (= bs!928 d!3893))

(declare-fun m!16070 () Bool)

(assert (=> bs!928 m!16070))

(assert (=> bs!928 m!16070))

(declare-fun m!16072 () Bool)

(assert (=> bs!928 m!16072))

(assert (=> b!21641 d!3893))

(declare-fun d!3895 () Bool)

(assert (=> d!3895 (= (apply!28 (+!41 lt!6869 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6863) (apply!28 lt!6869 lt!6863))))

(declare-fun lt!7414 () Unit!462)

(assert (=> d!3895 (= lt!7414 (choose!202 lt!6869 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6863))))

(declare-fun e!14391 () Bool)

(assert (=> d!3895 e!14391))

(declare-fun res!14105 () Bool)

(assert (=> d!3895 (=> (not res!14105) (not e!14391))))

(assert (=> d!3895 (= res!14105 (contains!224 lt!6869 lt!6863))))

(assert (=> d!3895 (= (addApplyDifferent!13 lt!6869 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))) lt!6863) lt!7414)))

(declare-fun b!22194 () Bool)

(assert (=> b!22194 (= e!14391 (not (= lt!6863 lt!6859)))))

(assert (= (and d!3895 res!14105) b!22194))

(declare-fun m!16074 () Bool)

(assert (=> d!3895 m!16074))

(assert (=> d!3895 m!15085))

(declare-fun m!16076 () Bool)

(assert (=> d!3895 m!16076))

(assert (=> d!3895 m!15093))

(assert (=> d!3895 m!15093))

(assert (=> d!3895 m!15101))

(assert (=> b!21641 d!3895))

(declare-fun d!3897 () Bool)

(declare-fun e!14392 () Bool)

(assert (=> d!3897 e!14392))

(declare-fun res!14107 () Bool)

(assert (=> d!3897 (=> (not res!14107) (not e!14392))))

(declare-fun lt!7415 () ListLongMap!557)

(assert (=> d!3897 (= res!14107 (contains!224 lt!7415 (_1!458 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun lt!7416 () List!558)

(assert (=> d!3897 (= lt!7415 (ListLongMap!558 lt!7416))))

(declare-fun lt!7417 () Unit!462)

(declare-fun lt!7418 () Unit!462)

(assert (=> d!3897 (= lt!7417 lt!7418)))

(assert (=> d!3897 (= (getValueByKey!60 lt!7416 (_1!458 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3897 (= lt!7418 (lemmaContainsTupThenGetReturnValue!17 lt!7416 (_1!458 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3897 (= lt!7416 (insertStrictlySorted!17 (toList!294 lt!6866) (_1!458 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3897 (= (+!41 lt!6866 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!7415)))

(declare-fun b!22195 () Bool)

(declare-fun res!14106 () Bool)

(assert (=> b!22195 (=> (not res!14106) (not e!14392))))

(assert (=> b!22195 (= res!14106 (= (getValueByKey!60 (toList!294 lt!7415) (_1!458 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(declare-fun b!22196 () Bool)

(assert (=> b!22196 (= e!14392 (contains!225 (toList!294 lt!7415) (tuple2!911 lt!6870 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))))

(assert (= (and d!3897 res!14107) b!22195))

(assert (= (and b!22195 res!14106) b!22196))

(declare-fun m!16078 () Bool)

(assert (=> d!3897 m!16078))

(declare-fun m!16080 () Bool)

(assert (=> d!3897 m!16080))

(declare-fun m!16082 () Bool)

(assert (=> d!3897 m!16082))

(declare-fun m!16084 () Bool)

(assert (=> d!3897 m!16084))

(declare-fun m!16086 () Bool)

(assert (=> b!22195 m!16086))

(declare-fun m!16088 () Bool)

(assert (=> b!22196 m!16088))

(assert (=> b!21641 d!3897))

(declare-fun d!3899 () Bool)

(assert (=> d!3899 (= (apply!28 (+!41 lt!6855 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!6868) (get!378 (getValueByKey!60 (toList!294 (+!41 lt!6855 (tuple2!911 lt!6862 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) lt!6868)))))

(declare-fun bs!929 () Bool)

(assert (= bs!929 d!3899))

(declare-fun m!16090 () Bool)

(assert (=> bs!929 m!16090))

(assert (=> bs!929 m!16090))

(declare-fun m!16092 () Bool)

(assert (=> bs!929 m!16092))

(assert (=> b!21641 d!3899))

(declare-fun d!3901 () Bool)

(declare-fun e!14393 () Bool)

(assert (=> d!3901 e!14393))

(declare-fun res!14109 () Bool)

(assert (=> d!3901 (=> (not res!14109) (not e!14393))))

(declare-fun lt!7419 () ListLongMap!557)

(assert (=> d!3901 (= res!14109 (contains!224 lt!7419 (_1!458 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun lt!7420 () List!558)

(assert (=> d!3901 (= lt!7419 (ListLongMap!558 lt!7420))))

(declare-fun lt!7421 () Unit!462)

(declare-fun lt!7422 () Unit!462)

(assert (=> d!3901 (= lt!7421 lt!7422)))

(assert (=> d!3901 (= (getValueByKey!60 lt!7420 (_1!458 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3901 (= lt!7422 (lemmaContainsTupThenGetReturnValue!17 lt!7420 (_1!458 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3901 (= lt!7420 (insertStrictlySorted!17 (toList!294 lt!6869) (_1!458 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3901 (= (+!41 lt!6869 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!7419)))

(declare-fun b!22197 () Bool)

(declare-fun res!14108 () Bool)

(assert (=> b!22197 (=> (not res!14108) (not e!14393))))

(assert (=> b!22197 (= res!14108 (= (getValueByKey!60 (toList!294 lt!7419) (_1!458 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(declare-fun b!22198 () Bool)

(assert (=> b!22198 (= e!14393 (contains!225 (toList!294 lt!7419) (tuple2!911 lt!6859 (minValue!1645 (v!1571 (underlying!103 thiss!938))))))))

(assert (= (and d!3901 res!14109) b!22197))

(assert (= (and b!22197 res!14108) b!22198))

(declare-fun m!16094 () Bool)

(assert (=> d!3901 m!16094))

(declare-fun m!16096 () Bool)

(assert (=> d!3901 m!16096))

(declare-fun m!16098 () Bool)

(assert (=> d!3901 m!16098))

(declare-fun m!16100 () Bool)

(assert (=> d!3901 m!16100))

(declare-fun m!16102 () Bool)

(assert (=> b!22197 m!16102))

(declare-fun m!16104 () Bool)

(assert (=> b!22198 m!16104))

(assert (=> b!21641 d!3901))

(declare-fun d!3903 () Bool)

(declare-fun e!14394 () Bool)

(assert (=> d!3903 e!14394))

(declare-fun res!14111 () Bool)

(assert (=> d!3903 (=> (not res!14111) (not e!14394))))

(declare-fun lt!7423 () ListLongMap!557)

(assert (=> d!3903 (= res!14111 (contains!224 lt!7423 (_1!458 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(declare-fun lt!7424 () List!558)

(assert (=> d!3903 (= lt!7423 (ListLongMap!558 lt!7424))))

(declare-fun lt!7425 () Unit!462)

(declare-fun lt!7426 () Unit!462)

(assert (=> d!3903 (= lt!7425 lt!7426)))

(assert (=> d!3903 (= (getValueByKey!60 lt!7424 (_1!458 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3903 (= lt!7426 (lemmaContainsTupThenGetReturnValue!17 lt!7424 (_1!458 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3903 (= lt!7424 (insertStrictlySorted!17 (toList!294 lt!6860) (_1!458 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (_2!458 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))))))

(assert (=> d!3903 (= (+!41 lt!6860 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) lt!7423)))

(declare-fun b!22199 () Bool)

(declare-fun res!14110 () Bool)

(assert (=> b!22199 (=> (not res!14110) (not e!14394))))

(assert (=> b!22199 (= res!14110 (= (getValueByKey!60 (toList!294 lt!7423) (_1!458 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938)))))) (Some!65 (_2!458 (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))))))

(declare-fun b!22200 () Bool)

(assert (=> b!22200 (= e!14394 (contains!225 (toList!294 lt!7423) (tuple2!911 lt!6858 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))))))

(assert (= (and d!3903 res!14111) b!22199))

(assert (= (and b!22199 res!14110) b!22200))

(declare-fun m!16106 () Bool)

(assert (=> d!3903 m!16106))

(declare-fun m!16108 () Bool)

(assert (=> d!3903 m!16108))

(declare-fun m!16110 () Bool)

(assert (=> d!3903 m!16110))

(declare-fun m!16112 () Bool)

(assert (=> d!3903 m!16112))

(declare-fun m!16114 () Bool)

(assert (=> b!22199 m!16114))

(declare-fun m!16116 () Bool)

(assert (=> b!22200 m!16116))

(assert (=> b!21641 d!3903))

(assert (=> b!21641 d!3821))

(declare-fun d!3905 () Bool)

(assert (=> d!3905 (= (apply!28 lt!6866 lt!6864) (get!378 (getValueByKey!60 (toList!294 lt!6866) lt!6864)))))

(declare-fun bs!930 () Bool)

(assert (= bs!930 d!3905))

(declare-fun m!16118 () Bool)

(assert (=> bs!930 m!16118))

(assert (=> bs!930 m!16118))

(declare-fun m!16120 () Bool)

(assert (=> bs!930 m!16120))

(assert (=> b!21641 d!3905))

(declare-fun d!3907 () Bool)

(assert (=> d!3907 (= (+!41 (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)) (tuple2!911 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1645 (v!1571 (underlying!103 thiss!938))))) (getCurrentListMap!124 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) lt!6790 (zeroValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000000 (defaultEntry!1718 lt!6655)))))

(declare-fun lt!7427 () Unit!462)

(assert (=> d!3907 (= lt!7427 (choose!201 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) lt!6790 (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 lt!6655)))))

(assert (=> d!3907 (validMask!0 (mask!4691 lt!6655))))

(assert (=> d!3907 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!7 (_keys!3139 lt!6655) (_values!1707 lt!6655) (mask!4691 lt!6655) (extraKeys!1621 lt!6655) lt!6790 (zeroValue!1645 lt!6655) (minValue!1645 lt!6655) (zeroValue!1645 (v!1571 (underlying!103 thiss!938))) (defaultEntry!1718 lt!6655)) lt!7427)))

(declare-fun bs!931 () Bool)

(assert (= bs!931 d!3907))

(assert (=> bs!931 m!15007))

(assert (=> bs!931 m!15163))

(assert (=> bs!931 m!15007))

(declare-fun m!16122 () Bool)

(assert (=> bs!931 m!16122))

(declare-fun m!16124 () Bool)

(assert (=> bs!931 m!16124))

(declare-fun m!16126 () Bool)

(assert (=> bs!931 m!16126))

(assert (=> b!21562 d!3907))

(declare-fun d!3909 () Bool)

(declare-fun e!14396 () Bool)

(assert (=> d!3909 e!14396))

(declare-fun res!14112 () Bool)

(assert (=> d!3909 (=> res!14112 e!14396)))

(declare-fun lt!7431 () Bool)

(assert (=> d!3909 (= res!14112 (not lt!7431))))

(declare-fun lt!7430 () Bool)

(assert (=> d!3909 (= lt!7431 lt!7430)))

(declare-fun lt!7428 () Unit!462)

(declare-fun e!14395 () Unit!462)

(assert (=> d!3909 (= lt!7428 e!14395)))

(declare-fun c!2681 () Bool)

(assert (=> d!3909 (= c!2681 lt!7430)))

(assert (=> d!3909 (= lt!7430 (containsKey!24 (toList!294 lt!6872) (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> d!3909 (= (contains!224 lt!6872 (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))) lt!7431)))

(declare-fun b!22201 () Bool)

(declare-fun lt!7429 () Unit!462)

(assert (=> b!22201 (= e!14395 lt!7429)))

(assert (=> b!22201 (= lt!7429 (lemmaContainsKeyImpliesGetValueByKeyDefined!21 (toList!294 lt!6872) (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(assert (=> b!22201 (isDefined!22 (getValueByKey!60 (toList!294 lt!6872) (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001)))))))

(declare-fun b!22202 () Bool)

(declare-fun Unit!497 () Unit!462)

(assert (=> b!22202 (= e!14395 Unit!497)))

(declare-fun b!22203 () Bool)

(assert (=> b!22203 (= e!14396 (isDefined!22 (getValueByKey!60 (toList!294 lt!6872) (select (arr!572 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) (bvadd #b00000000000000000000000000000001 (bvsub (size!665 (_keys!3139 (v!1571 (underlying!103 thiss!938)))) #b00000000000000000000000000000001))))))))

(assert (= (and d!3909 c!2681) b!22201))

(assert (= (and d!3909 (not c!2681)) b!22202))

(assert (= (and d!3909 (not res!14112)) b!22203))

(assert (=> d!3909 m!15047))

(declare-fun m!16128 () Bool)

(assert (=> d!3909 m!16128))

(assert (=> b!22201 m!15047))

(declare-fun m!16130 () Bool)

(assert (=> b!22201 m!16130))

(assert (=> b!22201 m!15047))

(assert (=> b!22201 m!15946))

(assert (=> b!22201 m!15946))

(declare-fun m!16132 () Bool)

(assert (=> b!22201 m!16132))

(assert (=> b!22203 m!15047))

(assert (=> b!22203 m!15946))

(assert (=> b!22203 m!15946))

(assert (=> b!22203 m!16132))

(assert (=> b!21644 d!3909))

(declare-fun mapIsEmpty!986 () Bool)

(declare-fun mapRes!986 () Bool)

(assert (=> mapIsEmpty!986 mapRes!986))

(declare-fun b!22204 () Bool)

(declare-fun e!14398 () Bool)

(assert (=> b!22204 (= e!14398 tp_is_empty!997)))

(declare-fun condMapEmpty!986 () Bool)

(declare-fun mapDefault!986 () ValueCell!299)

(assert (=> mapNonEmpty!985 (= condMapEmpty!986 (= mapRest!985 ((as const (Array (_ BitVec 32) ValueCell!299)) mapDefault!986)))))

(declare-fun e!14397 () Bool)

(assert (=> mapNonEmpty!985 (= tp!3451 (and e!14397 mapRes!986))))

(declare-fun mapNonEmpty!986 () Bool)

(declare-fun tp!3452 () Bool)

(assert (=> mapNonEmpty!986 (= mapRes!986 (and tp!3452 e!14398))))

(declare-fun mapRest!986 () (Array (_ BitVec 32) ValueCell!299))

(declare-fun mapValue!986 () ValueCell!299)

(declare-fun mapKey!986 () (_ BitVec 32))

(assert (=> mapNonEmpty!986 (= mapRest!985 (store mapRest!986 mapKey!986 mapValue!986))))

(declare-fun b!22205 () Bool)

(assert (=> b!22205 (= e!14397 tp_is_empty!997)))

(assert (= (and mapNonEmpty!985 condMapEmpty!986) mapIsEmpty!986))

(assert (= (and mapNonEmpty!985 (not condMapEmpty!986)) mapNonEmpty!986))

(assert (= (and mapNonEmpty!986 ((_ is ValueCellFull!299) mapValue!986)) b!22204))

(assert (= (and mapNonEmpty!985 ((_ is ValueCellFull!299) mapDefault!986)) b!22205))

(declare-fun m!16134 () Bool)

(assert (=> mapNonEmpty!986 m!16134))

(declare-fun b_lambda!1539 () Bool)

(assert (= b_lambda!1535 (or (and b!21300 b_free!733) b_lambda!1539)))

(declare-fun b_lambda!1541 () Bool)

(assert (= b_lambda!1537 (or (and b!21300 b_free!733) b_lambda!1541)))

(check-sat (not b!22172) (not b!21944) (not b_lambda!1541) (not bm!1494) (not d!3809) (not bm!1476) (not d!3831) (not b!22022) (not bm!1514) (not d!3807) (not bm!1488) (not b!21928) (not b!21838) (not bm!1507) (not d!3867) (not bm!1509) (not b!22086) (not mapNonEmpty!986) (not d!3909) (not b!21921) (not b!21947) (not d!3735) (not b!22009) (not b!21856) (not d!3783) (not b!22079) (not b!21819) (not b!21840) (not b!21949) (not b!22203) (not b!22200) (not b!22047) (not b!21919) (not b!21920) (not d!3731) (not b_next!733) (not b!22175) (not b!21741) (not b!21824) (not bm!1493) (not b!21816) (not d!3743) (not b!21777) (not b!21926) (not b!22163) (not d!3775) (not b_lambda!1529) (not b!22081) (not bm!1530) (not bm!1533) (not bm!1518) (not b!21865) (not b_lambda!1525) (not b!21913) (not b!22014) (not b_lambda!1515) (not b!21967) (not bm!1554) (not d!3789) (not b!22138) (not bm!1481) (not d!3801) (not d!3769) (not bm!1534) (not b!21867) (not b!22034) (not d!3793) (not d!3749) (not b!21852) (not b_lambda!1533) (not b!22179) (not b!22031) (not b!21791) (not b!21954) (not b!22123) (not bm!1535) (not b!21894) (not d!3887) (not bm!1553) (not d!3891) (not b!21831) (not b!21970) (not d!3773) (not d!3781) (not d!3839) (not b!22130) (not d!3763) (not d!3785) (not b!21946) (not d!3889) (not bm!1486) (not bm!1532) (not b!21896) (not b!21925) (not b!22085) (not b!21879) (not b!21781) (not b!21771) (not b!21916) (not b!22132) (not b!22177) tp_is_empty!997 (not d!3897) (not b_lambda!1519) (not d!3883) (not bm!1515) (not bm!1516) (not d!3837) (not b!22116) (not d!3899) (not b!22182) (not b!22020) (not b!21915) (not b!21793) (not b!21918) (not b!21798) (not b!22084) (not b!21940) (not d!3895) (not b!22181) (not b!21821) (not b!22160) (not b!21924) (not b!22176) (not b!21803) (not b!22142) (not b!21815) (not b!22077) (not b!21930) (not b!21889) (not b!22026) (not d!3851) (not b!22196) (not b!22201) (not b!21901) (not bm!1473) (not b!22178) (not b!22052) (not b!22012) (not d!3869) (not b!21845) (not bm!1475) (not b!21775) (not d!3877) (not d!3747) (not b_lambda!1517) (not b!22104) (not b!22191) (not bm!1556) (not b!21898) (not d!3845) (not b!22029) (not bm!1497) (not b!22180) (not b!21966) (not bm!1521) (not b!22049) (not bm!1502) (not bm!1546) (not d!3811) (not bm!1537) (not b!22167) (not d!3751) (not b!21796) (not b!21758) (not b!21892) (not bm!1549) (not bm!1501) (not d!3779) (not d!3745) (not b!22025) (not b_lambda!1527) (not b!22150) (not d!3803) (not bm!1480) (not b!22174) (not b!22158) b_and!1443 (not b!22152) (not b!22148) (not b!22135) (not b!21965) (not b_lambda!1539) (not bm!1490) (not d!3905) (not b!21945) (not d!3795) (not b!22016) (not b!21961) (not d!3833) (not bm!1500) (not b!22166) (not b!21726) (not b!22198) (not d!3907) (not d!3765) (not bm!1511) (not b!22102) (not b!22157) (not bm!1487) (not b!22188) (not b!21817) (not b!21914) (not bm!1543) (not b!22082) (not d!3819) (not b!22106) (not d!3821) (not b!21933) (not d!3903) (not b!21768) (not b!21835) (not b!21923) (not d!3885) (not b!22171) (not b_lambda!1523) (not b!21774) (not d!3799) (not b!22151) (not b!21878) (not b!21794) (not b!21968) (not d!3733) (not b!22140) (not d!3841) (not b!22041) (not d!3825) (not b!22103) (not bm!1474) (not b!21766) (not bm!1550) (not b!21859) (not b!21857) (not b!21890) (not d!3729) (not d!3727) (not d!3757) (not d!3755) (not b!21810) (not b_lambda!1531) (not b_lambda!1521) (not bm!1555) (not b!21837) (not b!21814) (not bm!1552) (not b!21780) (not d!3875) (not b!21795) (not b!22050) (not bm!1483) (not bm!1508) (not d!3879) (not d!3871) (not d!3901) (not d!3893) (not b!22169) (not d!3865) (not b!21779) (not b!21858) (not b!22078) (not bm!1540) (not b!22199) (not b!21893) (not b!22045) (not b!22195) (not d!3767) (not d!3805) (not bm!1479) (not b!22192) (not b!22027) (not b!21912) (not b!22006) (not b!21917) (not b!22099) (not b!21842) (not bm!1504) (not b!22197) (not d!3863) (not b!21876) (not bm!1495) (not b!22190) (not b!21908) (not d!3741) (not d!3787) (not d!3813) (not d!3797) (not d!3873) (not b!21836) (not d!3861) (not b!22146) (not b!22173) (not d!3791) (not d!3737) (not b!21951) (not b!22024) (not b!21800) (not d!3753) (not d!3881) (not b!21877))
(check-sat b_and!1443 (not b_next!733))
