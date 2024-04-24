; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3314 () Bool)

(assert start!3314)

(declare-fun b!20595 () Bool)

(declare-fun b_free!721 () Bool)

(declare-fun b_next!721 () Bool)

(assert (=> b!20595 (= b_free!721 (not b_next!721))))

(declare-fun tp!3393 () Bool)

(declare-fun b_and!1395 () Bool)

(assert (=> b!20595 (= tp!3393 b_and!1395)))

(declare-fun res!13495 () Bool)

(declare-fun e!13451 () Bool)

(assert (=> start!3314 (=> (not res!13495) (not e!13451))))

(declare-datatypes ((V!1139 0))(
  ( (V!1140 (val!519 Int)) )
))
(declare-datatypes ((ValueCell!293 0))(
  ( (ValueCellFull!293 (v!1556 V!1139)) (EmptyCell!293) )
))
(declare-datatypes ((array!1179 0))(
  ( (array!1180 (arr!560 (Array (_ BitVec 32) ValueCell!293)) (size!653 (_ BitVec 32))) )
))
(declare-datatypes ((array!1181 0))(
  ( (array!1182 (arr!561 (Array (_ BitVec 32) (_ BitVec 64))) (size!654 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!172 0))(
  ( (LongMapFixedSize!173 (defaultEntry!1710 Int) (mask!4677 (_ BitVec 32)) (extraKeys!1615 (_ BitVec 32)) (zeroValue!1639 V!1139) (minValue!1639 V!1139) (_size!125 (_ BitVec 32)) (_keys!3133 array!1181) (_values!1701 array!1179) (_vacant!125 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!172 0))(
  ( (Cell!173 (v!1557 LongMapFixedSize!172)) )
))
(declare-datatypes ((LongMap!172 0))(
  ( (LongMap!173 (underlying!97 Cell!172)) )
))
(declare-fun thiss!938 () LongMap!172)

(declare-fun valid!99 (LongMap!172) Bool)

(assert (=> start!3314 (= res!13495 (valid!99 thiss!938))))

(assert (=> start!3314 e!13451))

(declare-fun e!13445 () Bool)

(assert (=> start!3314 e!13445))

(declare-fun bm!1110 () Bool)

(declare-datatypes ((tuple2!876 0))(
  ( (tuple2!877 (_1!441 Bool) (_2!441 LongMapFixedSize!172)) )
))
(declare-fun call!1113 () tuple2!876)

(declare-fun call!1114 () tuple2!876)

(assert (=> bm!1110 (= call!1113 call!1114)))

(declare-fun b!20590 () Bool)

(declare-fun e!13449 () Bool)

(assert (=> b!20590 (= e!13445 e!13449)))

(declare-fun b!20591 () Bool)

(declare-fun res!13493 () Bool)

(declare-fun e!13442 () Bool)

(assert (=> b!20591 (=> (not res!13493) (not e!13442))))

(assert (=> b!20591 (= res!13493 (and (= (size!654 (_keys!3133 (v!1557 (underlying!97 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4677 (v!1557 (underlying!97 thiss!938))))) (bvsge (bvsub (size!654 (_keys!3133 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (size!654 (_keys!3133 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001) (size!654 (_keys!3133 (v!1557 (underlying!97 thiss!938)))))))))

(declare-fun b!20592 () Bool)

(declare-fun e!13452 () Bool)

(assert (=> b!20592 (= e!13449 e!13452)))

(declare-fun b!20593 () Bool)

(declare-fun e!13443 () Bool)

(declare-fun tp_is_empty!985 () Bool)

(assert (=> b!20593 (= e!13443 tp_is_empty!985)))

(declare-fun lt!6166 () tuple2!876)

(declare-fun lt!6163 () LongMapFixedSize!172)

(declare-fun c!2277 () Bool)

(declare-fun bm!1111 () Bool)

(declare-fun c!2276 () Bool)

(declare-fun update!25 (LongMapFixedSize!172 (_ BitVec 64) V!1139) tuple2!876)

(assert (=> bm!1111 (= call!1114 (update!25 (ite c!2276 (_2!441 lt!6166) lt!6163) (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938)))))))))

(declare-fun b!20594 () Bool)

(declare-fun e!13448 () Bool)

(assert (=> b!20594 (= e!13448 tp_is_empty!985)))

(declare-fun e!13447 () Bool)

(declare-fun array_inv!399 (array!1181) Bool)

(declare-fun array_inv!400 (array!1179) Bool)

(assert (=> b!20595 (= e!13452 (and tp!3393 tp_is_empty!985 (array_inv!399 (_keys!3133 (v!1557 (underlying!97 thiss!938)))) (array_inv!400 (_values!1701 (v!1557 (underlying!97 thiss!938)))) e!13447))))

(declare-fun b!20596 () Bool)

(declare-datatypes ((tuple2!878 0))(
  ( (tuple2!879 (_1!442 Bool) (_2!442 Cell!172)) )
))
(declare-fun lt!6167 () tuple2!878)

(declare-fun valid!100 (LongMapFixedSize!172) Bool)

(assert (=> b!20596 (= e!13442 (not (valid!100 (v!1557 (_2!442 lt!6167)))))))

(declare-fun b!20597 () Bool)

(declare-fun res!13496 () Bool)

(assert (=> b!20597 (=> (not res!13496) (not e!13442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!20597 (= res!13496 (validMask!0 (mask!4677 (v!1557 (underlying!97 thiss!938)))))))

(declare-fun b!20598 () Bool)

(declare-fun e!13444 () tuple2!878)

(declare-fun e!13453 () tuple2!878)

(assert (=> b!20598 (= e!13444 e!13453)))

(declare-fun lt!6162 () Bool)

(assert (=> b!20598 (= c!2277 (and (not lt!6162) (= (bvand (extraKeys!1615 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!20599 () Bool)

(declare-fun mapRes!952 () Bool)

(assert (=> b!20599 (= e!13447 (and e!13443 mapRes!952))))

(declare-fun condMapEmpty!952 () Bool)

(declare-fun mapDefault!952 () ValueCell!293)

(assert (=> b!20599 (= condMapEmpty!952 (= (arr!560 (_values!1701 (v!1557 (underlying!97 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!293)) mapDefault!952)))))

(declare-fun b!20600 () Bool)

(declare-fun lt!6165 () tuple2!876)

(assert (=> b!20600 (= lt!6165 call!1113)))

(assert (=> b!20600 (= e!13453 (tuple2!879 (_1!441 lt!6165) (Cell!173 (_2!441 lt!6165))))))

(declare-fun mapIsEmpty!952 () Bool)

(assert (=> mapIsEmpty!952 mapRes!952))

(declare-fun b!20601 () Bool)

(declare-fun lt!6168 () tuple2!876)

(assert (=> b!20601 (= e!13444 (tuple2!879 (and (_1!441 lt!6166) (_1!441 lt!6168)) (Cell!173 (_2!441 lt!6168))))))

(assert (=> b!20601 (= lt!6166 (update!25 lt!6163 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1639 (v!1557 (underlying!97 thiss!938)))))))

(assert (=> b!20601 (= lt!6168 call!1114)))

(declare-fun mapNonEmpty!952 () Bool)

(declare-fun tp!3394 () Bool)

(assert (=> mapNonEmpty!952 (= mapRes!952 (and tp!3394 e!13448))))

(declare-fun mapValue!952 () ValueCell!293)

(declare-fun mapKey!952 () (_ BitVec 32))

(declare-fun mapRest!952 () (Array (_ BitVec 32) ValueCell!293))

(assert (=> mapNonEmpty!952 (= (arr!560 (_values!1701 (v!1557 (underlying!97 thiss!938)))) (store mapRest!952 mapKey!952 mapValue!952))))

(declare-fun b!20602 () Bool)

(declare-fun e!13450 () tuple2!878)

(assert (=> b!20602 (= e!13450 (tuple2!879 true (Cell!173 lt!6163)))))

(declare-fun b!20603 () Bool)

(assert (=> b!20603 (= e!13451 e!13442)))

(declare-fun res!13494 () Bool)

(assert (=> b!20603 (=> (not res!13494) (not e!13442))))

(assert (=> b!20603 (= res!13494 (_1!442 lt!6167))))

(assert (=> b!20603 (= lt!6167 e!13444)))

(assert (=> b!20603 (= c!2276 (and (not lt!6162) (not (= (bvand (extraKeys!1615 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20603 (= lt!6162 (= (bvand (extraKeys!1615 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!26 ((_ BitVec 32) Int) LongMapFixedSize!172)

(declare-fun computeNewMask!21 (LongMap!172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20603 (= lt!6163 (getNewLongMapFixedSize!26 (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) (defaultEntry!1710 (v!1557 (underlying!97 thiss!938)))))))

(declare-fun b!20604 () Bool)

(declare-fun lt!6164 () tuple2!876)

(assert (=> b!20604 (= e!13450 (tuple2!879 (_1!441 lt!6164) (Cell!173 (_2!441 lt!6164))))))

(assert (=> b!20604 (= lt!6164 call!1113)))

(declare-fun b!20605 () Bool)

(declare-fun c!2278 () Bool)

(assert (=> b!20605 (= c!2278 (and (not (= (bvand (extraKeys!1615 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6162))))

(assert (=> b!20605 (= e!13453 e!13450)))

(assert (= (and start!3314 res!13495) b!20603))

(assert (= (and b!20603 c!2276) b!20601))

(assert (= (and b!20603 (not c!2276)) b!20598))

(assert (= (and b!20598 c!2277) b!20600))

(assert (= (and b!20598 (not c!2277)) b!20605))

(assert (= (and b!20605 c!2278) b!20604))

(assert (= (and b!20605 (not c!2278)) b!20602))

(assert (= (or b!20600 b!20604) bm!1110))

(assert (= (or b!20601 bm!1110) bm!1111))

(assert (= (and b!20603 res!13494) b!20597))

(assert (= (and b!20597 res!13496) b!20591))

(assert (= (and b!20591 res!13493) b!20596))

(assert (= (and b!20599 condMapEmpty!952) mapIsEmpty!952))

(assert (= (and b!20599 (not condMapEmpty!952)) mapNonEmpty!952))

(get-info :version)

(assert (= (and mapNonEmpty!952 ((_ is ValueCellFull!293) mapValue!952)) b!20594))

(assert (= (and b!20599 ((_ is ValueCellFull!293) mapDefault!952)) b!20593))

(assert (= b!20595 b!20599))

(assert (= b!20592 b!20595))

(assert (= b!20590 b!20592))

(assert (= start!3314 b!20590))

(declare-fun m!14391 () Bool)

(assert (=> b!20596 m!14391))

(declare-fun m!14393 () Bool)

(assert (=> b!20603 m!14393))

(assert (=> b!20603 m!14393))

(declare-fun m!14395 () Bool)

(assert (=> b!20603 m!14395))

(declare-fun m!14397 () Bool)

(assert (=> b!20601 m!14397))

(declare-fun m!14399 () Bool)

(assert (=> b!20597 m!14399))

(declare-fun m!14401 () Bool)

(assert (=> start!3314 m!14401))

(declare-fun m!14403 () Bool)

(assert (=> mapNonEmpty!952 m!14403))

(declare-fun m!14405 () Bool)

(assert (=> b!20595 m!14405))

(declare-fun m!14407 () Bool)

(assert (=> b!20595 m!14407))

(declare-fun m!14409 () Bool)

(assert (=> bm!1111 m!14409))

(check-sat tp_is_empty!985 (not b_next!721) (not b!20603) (not mapNonEmpty!952) (not start!3314) (not b!20601) (not b!20596) b_and!1395 (not bm!1111) (not b!20595) (not b!20597))
(check-sat b_and!1395 (not b_next!721))
(get-model)

(declare-fun d!3665 () Bool)

(assert (=> d!3665 (= (array_inv!399 (_keys!3133 (v!1557 (underlying!97 thiss!938)))) (bvsge (size!654 (_keys!3133 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20595 d!3665))

(declare-fun d!3667 () Bool)

(assert (=> d!3667 (= (array_inv!400 (_values!1701 (v!1557 (underlying!97 thiss!938)))) (bvsge (size!653 (_values!1701 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20595 d!3667))

(declare-fun d!3669 () Bool)

(declare-fun res!13527 () Bool)

(declare-fun e!13528 () Bool)

(assert (=> d!3669 (=> (not res!13527) (not e!13528))))

(declare-fun simpleValid!17 (LongMapFixedSize!172) Bool)

(assert (=> d!3669 (= res!13527 (simpleValid!17 (v!1557 (_2!442 lt!6167))))))

(assert (=> d!3669 (= (valid!100 (v!1557 (_2!442 lt!6167))) e!13528)))

(declare-fun b!20708 () Bool)

(declare-fun res!13528 () Bool)

(assert (=> b!20708 (=> (not res!13528) (not e!13528))))

(declare-fun arrayCountValidKeys!0 (array!1181 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20708 (= res!13528 (= (arrayCountValidKeys!0 (_keys!3133 (v!1557 (_2!442 lt!6167))) #b00000000000000000000000000000000 (size!654 (_keys!3133 (v!1557 (_2!442 lt!6167))))) (_size!125 (v!1557 (_2!442 lt!6167)))))))

(declare-fun b!20709 () Bool)

(declare-fun res!13529 () Bool)

(assert (=> b!20709 (=> (not res!13529) (not e!13528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1181 (_ BitVec 32)) Bool)

(assert (=> b!20709 (= res!13529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3133 (v!1557 (_2!442 lt!6167))) (mask!4677 (v!1557 (_2!442 lt!6167)))))))

(declare-fun b!20710 () Bool)

(declare-datatypes ((List!554 0))(
  ( (Nil!551) (Cons!550 (h!1116 (_ BitVec 64)) (t!3203 List!554)) )
))
(declare-fun arrayNoDuplicates!0 (array!1181 (_ BitVec 32) List!554) Bool)

(assert (=> b!20710 (= e!13528 (arrayNoDuplicates!0 (_keys!3133 (v!1557 (_2!442 lt!6167))) #b00000000000000000000000000000000 Nil!551))))

(assert (= (and d!3669 res!13527) b!20708))

(assert (= (and b!20708 res!13528) b!20709))

(assert (= (and b!20709 res!13529) b!20710))

(declare-fun m!14451 () Bool)

(assert (=> d!3669 m!14451))

(declare-fun m!14453 () Bool)

(assert (=> b!20708 m!14453))

(declare-fun m!14455 () Bool)

(assert (=> b!20709 m!14455))

(declare-fun m!14457 () Bool)

(assert (=> b!20710 m!14457))

(assert (=> b!20596 d!3669))

(declare-fun d!3671 () Bool)

(assert (=> d!3671 (= (valid!99 thiss!938) (valid!100 (v!1557 (underlying!97 thiss!938))))))

(declare-fun bs!899 () Bool)

(assert (= bs!899 d!3671))

(declare-fun m!14459 () Bool)

(assert (=> bs!899 m!14459))

(assert (=> start!3314 d!3671))

(declare-fun b!20787 () Bool)

(declare-fun e!13585 () tuple2!876)

(declare-fun e!13571 () tuple2!876)

(assert (=> b!20787 (= e!13585 e!13571)))

(declare-datatypes ((SeekEntryResult!49 0))(
  ( (MissingZero!49 (index!2316 (_ BitVec 32))) (Found!49 (index!2317 (_ BitVec 32))) (Intermediate!49 (undefined!861 Bool) (index!2318 (_ BitVec 32)) (x!5036 (_ BitVec 32))) (Undefined!49) (MissingVacant!49 (index!2319 (_ BitVec 32))) )
))
(declare-fun lt!6277 () SeekEntryResult!49)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1181 (_ BitVec 32)) SeekEntryResult!49)

(assert (=> b!20787 (= lt!6277 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3133 lt!6163) (mask!4677 lt!6163)))))

(declare-fun c!2324 () Bool)

(assert (=> b!20787 (= c!2324 ((_ is Undefined!49) lt!6277))))

(declare-fun b!20788 () Bool)

(declare-fun res!13561 () Bool)

(declare-fun lt!6265 () SeekEntryResult!49)

(assert (=> b!20788 (= res!13561 (= (select (arr!561 (_keys!3133 lt!6163)) (index!2319 lt!6265)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13584 () Bool)

(assert (=> b!20788 (=> (not res!13561) (not e!13584))))

(declare-fun b!20789 () Bool)

(declare-fun e!13583 () tuple2!876)

(declare-fun lt!6284 () tuple2!876)

(assert (=> b!20789 (= e!13583 (tuple2!877 (_1!441 lt!6284) (_2!441 lt!6284)))))

(declare-fun call!1176 () tuple2!876)

(assert (=> b!20789 (= lt!6284 call!1176)))

(declare-fun bm!1172 () Bool)

(declare-datatypes ((tuple2!888 0))(
  ( (tuple2!889 (_1!447 (_ BitVec 64)) (_2!447 V!1139)) )
))
(declare-datatypes ((List!555 0))(
  ( (Nil!552) (Cons!551 (h!1117 tuple2!888) (t!3204 List!555)) )
))
(declare-datatypes ((ListLongMap!553 0))(
  ( (ListLongMap!554 (toList!292 List!555)) )
))
(declare-fun call!1183 () ListLongMap!553)

(declare-fun lt!6282 () tuple2!876)

(declare-fun map!391 (LongMapFixedSize!172) ListLongMap!553)

(assert (=> bm!1172 (= call!1183 (map!391 (_2!441 lt!6282)))))

(declare-fun bm!1173 () Bool)

(declare-fun call!1191 () ListLongMap!553)

(declare-fun call!1182 () ListLongMap!553)

(assert (=> bm!1173 (= call!1191 call!1182)))

(declare-fun b!20790 () Bool)

(declare-datatypes ((Unit!440 0))(
  ( (Unit!441) )
))
(declare-fun e!13578 () Unit!440)

(declare-fun Unit!442 () Unit!440)

(assert (=> b!20790 (= e!13578 Unit!442)))

(declare-fun lt!6286 () Unit!440)

(declare-fun call!1181 () Unit!440)

(assert (=> b!20790 (= lt!6286 call!1181)))

(declare-fun call!1177 () SeekEntryResult!49)

(assert (=> b!20790 (= lt!6265 call!1177)))

(declare-fun c!2323 () Bool)

(assert (=> b!20790 (= c!2323 ((_ is MissingZero!49) lt!6265))))

(declare-fun e!13586 () Bool)

(assert (=> b!20790 e!13586))

(declare-fun lt!6266 () Unit!440)

(assert (=> b!20790 (= lt!6266 lt!6286)))

(assert (=> b!20790 false))

(declare-fun b!20791 () Bool)

(declare-fun e!13574 () Bool)

(declare-fun lt!6271 () SeekEntryResult!49)

(assert (=> b!20791 (= e!13574 (= (select (arr!561 (_keys!3133 lt!6163)) (index!2317 lt!6271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20793 () Bool)

(declare-fun res!13568 () Bool)

(declare-fun call!1190 () Bool)

(assert (=> b!20793 (= res!13568 call!1190)))

(declare-fun e!13577 () Bool)

(assert (=> b!20793 (=> (not res!13568) (not e!13577))))

(declare-fun b!20794 () Bool)

(declare-fun res!13569 () Bool)

(declare-fun e!13575 () Bool)

(assert (=> b!20794 (=> (not res!13569) (not e!13575))))

(assert (=> b!20794 (= res!13569 (= (select (arr!561 (_keys!3133 lt!6163)) (index!2316 lt!6265)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1174 () Bool)

(declare-fun call!1198 () ListLongMap!553)

(assert (=> bm!1174 (= call!1198 (map!391 lt!6163))))

(declare-fun bm!1175 () Bool)

(declare-fun call!1189 () ListLongMap!553)

(declare-fun getCurrentListMap!122 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 32) Int) ListLongMap!553)

(assert (=> bm!1175 (= call!1189 (getCurrentListMap!122 (_keys!3133 lt!6163) (_values!1701 lt!6163) (mask!4677 lt!6163) (extraKeys!1615 lt!6163) (zeroValue!1639 lt!6163) (minValue!1639 lt!6163) #b00000000000000000000000000000000 (defaultEntry!1710 lt!6163)))))

(declare-fun bm!1176 () Bool)

(declare-fun call!1193 () ListLongMap!553)

(assert (=> bm!1176 (= call!1193 call!1189)))

(declare-fun bm!1177 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 64) Int) Unit!440)

(assert (=> bm!1177 (= call!1181 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!5 (_keys!3133 lt!6163) (_values!1701 lt!6163) (mask!4677 lt!6163) (extraKeys!1615 lt!6163) (zeroValue!1639 lt!6163) (minValue!1639 lt!6163) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1710 lt!6163)))))

(declare-fun b!20795 () Bool)

(declare-fun c!2322 () Bool)

(assert (=> b!20795 (= c!2322 ((_ is MissingVacant!49) lt!6265))))

(declare-fun e!13576 () Bool)

(assert (=> b!20795 (= e!13586 e!13576)))

(declare-fun bm!1178 () Bool)

(declare-fun call!1186 () Bool)

(declare-fun call!1197 () Bool)

(assert (=> bm!1178 (= call!1186 call!1197)))

(declare-fun b!20796 () Bool)

(declare-fun res!13565 () Bool)

(assert (=> b!20796 (=> (not res!13565) (not e!13575))))

(declare-fun call!1179 () Bool)

(assert (=> b!20796 (= res!13565 call!1179)))

(assert (=> b!20796 (= e!13586 e!13575)))

(declare-fun bm!1179 () Bool)

(declare-fun call!1187 () ListLongMap!553)

(assert (=> bm!1179 (= call!1187 call!1182)))

(declare-fun b!20797 () Bool)

(declare-fun c!2332 () Bool)

(assert (=> b!20797 (= c!2332 ((_ is MissingVacant!49) lt!6277))))

(assert (=> b!20797 (= e!13571 e!13583)))

(declare-fun b!20798 () Bool)

(declare-fun e!13579 () Bool)

(declare-fun e!13573 () Bool)

(assert (=> b!20798 (= e!13579 e!13573)))

(declare-fun c!2329 () Bool)

(assert (=> b!20798 (= c!2329 (_1!441 lt!6282))))

(declare-fun bm!1180 () Bool)

(declare-fun call!1194 () SeekEntryResult!49)

(assert (=> bm!1180 (= call!1194 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3133 lt!6163) (mask!4677 lt!6163)))))

(declare-fun b!20799 () Bool)

(declare-fun lt!6275 () tuple2!876)

(assert (=> b!20799 (= lt!6275 call!1176)))

(declare-fun e!13587 () tuple2!876)

(assert (=> b!20799 (= e!13587 (tuple2!877 (_1!441 lt!6275) (_2!441 lt!6275)))))

(declare-fun bm!1181 () Bool)

(declare-fun call!1195 () Bool)

(assert (=> bm!1181 (= call!1195 call!1186)))

(declare-fun b!20800 () Bool)

(declare-fun call!1184 () Bool)

(assert (=> b!20800 (= e!13584 (not call!1184))))

(declare-fun c!2321 () Bool)

(declare-fun bm!1182 () Bool)

(declare-fun lt!6268 () (_ BitVec 32))

(declare-fun lt!6274 () (_ BitVec 32))

(declare-fun c!2330 () Bool)

(declare-fun lt!6269 () array!1179)

(assert (=> bm!1182 (= call!1182 (getCurrentListMap!122 (_keys!3133 lt!6163) (ite (or c!2321 c!2324) (_values!1701 lt!6163) lt!6269) (mask!4677 lt!6163) (ite c!2321 (ite c!2330 lt!6268 lt!6274) (extraKeys!1615 lt!6163)) (ite (and c!2321 c!2330) (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (zeroValue!1639 lt!6163)) (ite c!2321 (ite c!2330 (minValue!1639 lt!6163) (zeroValue!1639 (v!1557 (underlying!97 thiss!938)))) (minValue!1639 lt!6163)) #b00000000000000000000000000000000 (defaultEntry!1710 lt!6163)))))

(declare-fun b!20801 () Bool)

(assert (=> b!20801 (= e!13575 (not call!1184))))

(declare-fun b!20802 () Bool)

(declare-fun e!13570 () Bool)

(declare-fun call!1175 () Bool)

(assert (=> b!20802 (= e!13570 (not call!1175))))

(declare-fun b!20803 () Bool)

(declare-fun c!2326 () Bool)

(declare-fun lt!6281 () SeekEntryResult!49)

(assert (=> b!20803 (= c!2326 ((_ is MissingVacant!49) lt!6281))))

(declare-fun e!13582 () Bool)

(declare-fun e!13572 () Bool)

(assert (=> b!20803 (= e!13582 e!13572)))

(declare-fun b!20804 () Bool)

(declare-fun e!13580 () Unit!440)

(declare-fun lt!6289 () Unit!440)

(assert (=> b!20804 (= e!13580 lt!6289)))

(assert (=> b!20804 (= lt!6289 call!1181)))

(declare-fun call!1178 () SeekEntryResult!49)

(assert (=> b!20804 (= lt!6281 call!1178)))

(declare-fun c!2327 () Bool)

(assert (=> b!20804 (= c!2327 ((_ is MissingZero!49) lt!6281))))

(assert (=> b!20804 e!13582))

(declare-fun b!20805 () Bool)

(declare-fun res!13562 () Bool)

(assert (=> b!20805 (=> (not res!13562) (not e!13570))))

(assert (=> b!20805 (= res!13562 (= (select (arr!561 (_keys!3133 lt!6163)) (index!2316 lt!6281)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!6276 () SeekEntryResult!49)

(declare-fun bm!1183 () Bool)

(declare-fun c!2328 () Bool)

(declare-fun c!2331 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1183 (= call!1197 (inRange!0 (ite c!2324 (ite c!2331 (index!2317 lt!6271) (ite c!2327 (index!2316 lt!6281) (index!2319 lt!6281))) (ite c!2328 (index!2317 lt!6276) (ite c!2323 (index!2316 lt!6265) (index!2319 lt!6265)))) (mask!4677 lt!6163)))))

(declare-fun bm!1184 () Bool)

(assert (=> bm!1184 (= call!1178 call!1194)))

(declare-fun bm!1185 () Bool)

(declare-fun call!1196 () Bool)

(assert (=> bm!1185 (= call!1175 call!1196)))

(declare-fun b!20806 () Bool)

(declare-fun lt!6283 () Unit!440)

(declare-fun lt!6287 () Unit!440)

(assert (=> b!20806 (= lt!6283 lt!6287)))

(declare-fun call!1192 () Bool)

(assert (=> b!20806 call!1192))

(declare-fun lemmaValidKeyInArrayIsInListMap!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 32) Int) Unit!440)

(assert (=> b!20806 (= lt!6287 (lemmaValidKeyInArrayIsInListMap!5 (_keys!3133 lt!6163) lt!6269 (mask!4677 lt!6163) (extraKeys!1615 lt!6163) (zeroValue!1639 lt!6163) (minValue!1639 lt!6163) (index!2317 lt!6277) (defaultEntry!1710 lt!6163)))))

(assert (=> b!20806 (= lt!6269 (array!1180 (store (arr!560 (_values!1701 lt!6163)) (index!2317 lt!6277) (ValueCellFull!293 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))))) (size!653 (_values!1701 lt!6163))))))

(declare-fun lt!6267 () Unit!440)

(declare-fun lt!6285 () Unit!440)

(assert (=> b!20806 (= lt!6267 lt!6285)))

(declare-fun call!1188 () ListLongMap!553)

(assert (=> b!20806 (= call!1188 (getCurrentListMap!122 (_keys!3133 lt!6163) (array!1180 (store (arr!560 (_values!1701 lt!6163)) (index!2317 lt!6277) (ValueCellFull!293 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))))) (size!653 (_values!1701 lt!6163))) (mask!4677 lt!6163) (extraKeys!1615 lt!6163) (zeroValue!1639 lt!6163) (minValue!1639 lt!6163) #b00000000000000000000000000000000 (defaultEntry!1710 lt!6163)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 32) (_ BitVec 64) V!1139 Int) Unit!440)

(assert (=> b!20806 (= lt!6285 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!5 (_keys!3133 lt!6163) (_values!1701 lt!6163) (mask!4677 lt!6163) (extraKeys!1615 lt!6163) (zeroValue!1639 lt!6163) (minValue!1639 lt!6163) (index!2317 lt!6277) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (defaultEntry!1710 lt!6163)))))

(declare-fun lt!6278 () Unit!440)

(assert (=> b!20806 (= lt!6278 e!13578)))

(declare-fun contains!222 (ListLongMap!553 (_ BitVec 64)) Bool)

(assert (=> b!20806 (= c!2328 (contains!222 call!1189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20806 (= e!13587 (tuple2!877 true (LongMapFixedSize!173 (defaultEntry!1710 lt!6163) (mask!4677 lt!6163) (extraKeys!1615 lt!6163) (zeroValue!1639 lt!6163) (minValue!1639 lt!6163) (_size!125 lt!6163) (_keys!3133 lt!6163) (array!1180 (store (arr!560 (_values!1701 lt!6163)) (index!2317 lt!6277) (ValueCellFull!293 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))))) (size!653 (_values!1701 lt!6163))) (_vacant!125 lt!6163))))))

(declare-fun bm!1186 () Bool)

(assert (=> bm!1186 (= call!1184 call!1196)))

(declare-fun b!20807 () Bool)

(declare-fun lt!6291 () Unit!440)

(assert (=> b!20807 (= e!13578 lt!6291)))

(declare-fun call!1185 () Unit!440)

(assert (=> b!20807 (= lt!6291 call!1185)))

(assert (=> b!20807 (= lt!6276 call!1177)))

(declare-fun res!13560 () Bool)

(assert (=> b!20807 (= res!13560 ((_ is Found!49) lt!6276))))

(assert (=> b!20807 (=> (not res!13560) (not e!13577))))

(assert (=> b!20807 e!13577))

(declare-fun bm!1187 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 64) Int) Unit!440)

(assert (=> bm!1187 (= call!1185 (lemmaInListMapThenSeekEntryOrOpenFindsIt!5 (_keys!3133 lt!6163) (_values!1701 lt!6163) (mask!4677 lt!6163) (extraKeys!1615 lt!6163) (zeroValue!1639 lt!6163) (minValue!1639 lt!6163) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1710 lt!6163)))))

(declare-fun b!20808 () Bool)

(assert (=> b!20808 (= e!13577 (= (select (arr!561 (_keys!3133 lt!6163)) (index!2317 lt!6276)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20792 () Bool)

(declare-fun e!13569 () Bool)

(assert (=> b!20792 (= e!13573 e!13569)))

(declare-fun res!13566 () Bool)

(assert (=> b!20792 (= res!13566 (contains!222 call!1183 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20792 (=> (not res!13566) (not e!13569))))

(declare-fun d!3673 () Bool)

(assert (=> d!3673 e!13579))

(declare-fun res!13564 () Bool)

(assert (=> d!3673 (=> (not res!13564) (not e!13579))))

(assert (=> d!3673 (= res!13564 (valid!100 (_2!441 lt!6282)))))

(assert (=> d!3673 (= lt!6282 e!13585)))

(assert (=> d!3673 (= c!2321 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3673 (valid!100 lt!6163)))

(assert (=> d!3673 (= (update!25 lt!6163 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1639 (v!1557 (underlying!97 thiss!938)))) lt!6282)))

(declare-fun b!20809 () Bool)

(assert (=> b!20809 (= e!13576 ((_ is Undefined!49) lt!6265))))

(declare-fun bm!1188 () Bool)

(assert (=> bm!1188 (= call!1192 (contains!222 call!1187 (ite c!2324 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!561 (_keys!3133 lt!6163)) (index!2317 lt!6277)))))))

(declare-fun bm!1189 () Bool)

(declare-fun arrayContainsKey!0 (array!1181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1189 (= call!1196 (arrayContainsKey!0 (_keys!3133 lt!6163) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!20810 () Bool)

(declare-fun lt!6279 () Unit!440)

(declare-fun lt!6272 () Unit!440)

(assert (=> b!20810 (= lt!6279 lt!6272)))

(declare-fun call!1180 () ListLongMap!553)

(assert (=> b!20810 (= call!1180 call!1191)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 V!1139 Int) Unit!440)

(assert (=> b!20810 (= lt!6272 (lemmaChangeLongMinValueKeyThenAddPairToListMap!5 (_keys!3133 lt!6163) (_values!1701 lt!6163) (mask!4677 lt!6163) (extraKeys!1615 lt!6163) lt!6274 (zeroValue!1639 lt!6163) (minValue!1639 lt!6163) (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (defaultEntry!1710 lt!6163)))))

(assert (=> b!20810 (= lt!6274 (bvor (extraKeys!1615 lt!6163) #b00000000000000000000000000000010))))

(declare-fun e!13581 () tuple2!876)

(assert (=> b!20810 (= e!13581 (tuple2!877 true (LongMapFixedSize!173 (defaultEntry!1710 lt!6163) (mask!4677 lt!6163) (bvor (extraKeys!1615 lt!6163) #b00000000000000000000000000000010) (zeroValue!1639 lt!6163) (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (_size!125 lt!6163) (_keys!3133 lt!6163) (_values!1701 lt!6163) (_vacant!125 lt!6163))))))

(declare-fun b!20811 () Bool)

(declare-fun res!13559 () Bool)

(assert (=> b!20811 (= res!13559 (= (select (arr!561 (_keys!3133 lt!6163)) (index!2319 lt!6281)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13588 () Bool)

(assert (=> b!20811 (=> (not res!13559) (not e!13588))))

(declare-fun b!20812 () Bool)

(assert (=> b!20812 (= e!13583 e!13587)))

(declare-fun c!2325 () Bool)

(assert (=> b!20812 (= c!2325 ((_ is MissingZero!49) lt!6277))))

(declare-fun bm!1190 () Bool)

(declare-fun updateHelperNewKey!5 (LongMapFixedSize!172 (_ BitVec 64) V!1139 (_ BitVec 32)) tuple2!876)

(assert (=> bm!1190 (= call!1176 (updateHelperNewKey!5 lt!6163 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2332 (index!2319 lt!6277) (index!2316 lt!6277))))))

(declare-fun b!20813 () Bool)

(assert (=> b!20813 (= e!13573 (= call!1183 call!1198))))

(declare-fun bm!1191 () Bool)

(assert (=> bm!1191 (= call!1179 call!1190)))

(declare-fun b!20814 () Bool)

(assert (=> b!20814 (= e!13576 e!13584)))

(declare-fun res!13567 () Bool)

(assert (=> b!20814 (= res!13567 call!1179)))

(assert (=> b!20814 (=> (not res!13567) (not e!13584))))

(declare-fun b!20815 () Bool)

(declare-fun Unit!443 () Unit!440)

(assert (=> b!20815 (= e!13580 Unit!443)))

(declare-fun lt!6273 () Unit!440)

(assert (=> b!20815 (= lt!6273 call!1185)))

(assert (=> b!20815 (= lt!6271 call!1178)))

(declare-fun res!13558 () Bool)

(assert (=> b!20815 (= res!13558 ((_ is Found!49) lt!6271))))

(assert (=> b!20815 (=> (not res!13558) (not e!13574))))

(assert (=> b!20815 e!13574))

(declare-fun lt!6270 () Unit!440)

(assert (=> b!20815 (= lt!6270 lt!6273)))

(assert (=> b!20815 false))

(declare-fun b!20816 () Bool)

(declare-fun +!39 (ListLongMap!553 tuple2!888) ListLongMap!553)

(assert (=> b!20816 (= e!13569 (= call!1183 (+!39 call!1198 (tuple2!889 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1639 (v!1557 (underlying!97 thiss!938)))))))))

(declare-fun b!20817 () Bool)

(assert (=> b!20817 (= e!13572 ((_ is Undefined!49) lt!6281))))

(declare-fun b!20818 () Bool)

(assert (=> b!20818 (= e!13588 (not call!1175))))

(declare-fun bm!1192 () Bool)

(assert (=> bm!1192 (= call!1180 call!1188)))

(declare-fun b!20819 () Bool)

(declare-fun res!13563 () Bool)

(assert (=> b!20819 (= res!13563 call!1186)))

(assert (=> b!20819 (=> (not res!13563) (not e!13574))))

(declare-fun b!20820 () Bool)

(assert (=> b!20820 (= e!13585 e!13581)))

(assert (=> b!20820 (= c!2330 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1193 () Bool)

(assert (=> bm!1193 (= call!1190 call!1197)))

(declare-fun b!20821 () Bool)

(declare-fun lt!6280 () Unit!440)

(declare-fun lt!6290 () Unit!440)

(assert (=> b!20821 (= lt!6280 lt!6290)))

(assert (=> b!20821 (= call!1180 call!1191)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 V!1139 Int) Unit!440)

(assert (=> b!20821 (= lt!6290 (lemmaChangeZeroKeyThenAddPairToListMap!5 (_keys!3133 lt!6163) (_values!1701 lt!6163) (mask!4677 lt!6163) (extraKeys!1615 lt!6163) lt!6268 (zeroValue!1639 lt!6163) (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 lt!6163) (defaultEntry!1710 lt!6163)))))

(assert (=> b!20821 (= lt!6268 (bvor (extraKeys!1615 lt!6163) #b00000000000000000000000000000001))))

(assert (=> b!20821 (= e!13581 (tuple2!877 true (LongMapFixedSize!173 (defaultEntry!1710 lt!6163) (mask!4677 lt!6163) (bvor (extraKeys!1615 lt!6163) #b00000000000000000000000000000001) (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 lt!6163) (_size!125 lt!6163) (_keys!3133 lt!6163) (_values!1701 lt!6163) (_vacant!125 lt!6163))))))

(declare-fun bm!1194 () Bool)

(assert (=> bm!1194 (= call!1188 (+!39 (ite c!2321 call!1193 call!1189) (ite c!2321 (ite c!2330 (tuple2!889 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1639 (v!1557 (underlying!97 thiss!938)))) (tuple2!889 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))))) (tuple2!889 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1639 (v!1557 (underlying!97 thiss!938)))))))))

(declare-fun b!20822 () Bool)

(declare-fun lt!6288 () Unit!440)

(assert (=> b!20822 (= lt!6288 e!13580)))

(assert (=> b!20822 (= c!2331 call!1192)))

(assert (=> b!20822 (= e!13571 (tuple2!877 false lt!6163))))

(declare-fun bm!1195 () Bool)

(assert (=> bm!1195 (= call!1177 call!1194)))

(declare-fun b!20823 () Bool)

(declare-fun res!13570 () Bool)

(assert (=> b!20823 (=> (not res!13570) (not e!13570))))

(assert (=> b!20823 (= res!13570 call!1195)))

(assert (=> b!20823 (= e!13582 e!13570)))

(declare-fun b!20824 () Bool)

(assert (=> b!20824 (= e!13572 e!13588)))

(declare-fun res!13571 () Bool)

(assert (=> b!20824 (= res!13571 call!1195)))

(assert (=> b!20824 (=> (not res!13571) (not e!13588))))

(assert (= (and d!3673 c!2321) b!20820))

(assert (= (and d!3673 (not c!2321)) b!20787))

(assert (= (and b!20820 c!2330) b!20821))

(assert (= (and b!20820 (not c!2330)) b!20810))

(assert (= (or b!20821 b!20810) bm!1173))

(assert (= (or b!20821 b!20810) bm!1176))

(assert (= (or b!20821 b!20810) bm!1192))

(assert (= (and b!20787 c!2324) b!20822))

(assert (= (and b!20787 (not c!2324)) b!20797))

(assert (= (and b!20822 c!2331) b!20815))

(assert (= (and b!20822 (not c!2331)) b!20804))

(assert (= (and b!20815 res!13558) b!20819))

(assert (= (and b!20819 res!13563) b!20791))

(assert (= (and b!20804 c!2327) b!20823))

(assert (= (and b!20804 (not c!2327)) b!20803))

(assert (= (and b!20823 res!13570) b!20805))

(assert (= (and b!20805 res!13562) b!20802))

(assert (= (and b!20803 c!2326) b!20824))

(assert (= (and b!20803 (not c!2326)) b!20817))

(assert (= (and b!20824 res!13571) b!20811))

(assert (= (and b!20811 res!13559) b!20818))

(assert (= (or b!20823 b!20824) bm!1181))

(assert (= (or b!20802 b!20818) bm!1185))

(assert (= (or b!20819 bm!1181) bm!1178))

(assert (= (or b!20815 b!20804) bm!1184))

(assert (= (and b!20797 c!2332) b!20789))

(assert (= (and b!20797 (not c!2332)) b!20812))

(assert (= (and b!20812 c!2325) b!20799))

(assert (= (and b!20812 (not c!2325)) b!20806))

(assert (= (and b!20806 c!2328) b!20807))

(assert (= (and b!20806 (not c!2328)) b!20790))

(assert (= (and b!20807 res!13560) b!20793))

(assert (= (and b!20793 res!13568) b!20808))

(assert (= (and b!20790 c!2323) b!20796))

(assert (= (and b!20790 (not c!2323)) b!20795))

(assert (= (and b!20796 res!13565) b!20794))

(assert (= (and b!20794 res!13569) b!20801))

(assert (= (and b!20795 c!2322) b!20814))

(assert (= (and b!20795 (not c!2322)) b!20809))

(assert (= (and b!20814 res!13567) b!20788))

(assert (= (and b!20788 res!13561) b!20800))

(assert (= (or b!20796 b!20814) bm!1191))

(assert (= (or b!20801 b!20800) bm!1186))

(assert (= (or b!20793 bm!1191) bm!1193))

(assert (= (or b!20807 b!20790) bm!1195))

(assert (= (or b!20789 b!20799) bm!1190))

(assert (= (or b!20804 b!20790) bm!1177))

(assert (= (or b!20822 b!20806) bm!1179))

(assert (= (or b!20815 b!20807) bm!1187))

(assert (= (or bm!1178 bm!1193) bm!1183))

(assert (= (or bm!1184 bm!1195) bm!1180))

(assert (= (or bm!1185 bm!1186) bm!1189))

(assert (= (or b!20822 b!20806) bm!1188))

(assert (= (or bm!1173 bm!1179) bm!1182))

(assert (= (or bm!1176 b!20806) bm!1175))

(assert (= (or bm!1192 b!20806) bm!1194))

(assert (= (and d!3673 res!13564) b!20798))

(assert (= (and b!20798 c!2329) b!20792))

(assert (= (and b!20798 (not c!2329)) b!20813))

(assert (= (and b!20792 res!13566) b!20816))

(assert (= (or b!20792 b!20816 b!20813) bm!1172))

(assert (= (or b!20816 b!20813) bm!1174))

(declare-fun m!14461 () Bool)

(assert (=> b!20805 m!14461))

(declare-fun m!14463 () Bool)

(assert (=> b!20787 m!14463))

(declare-fun m!14465 () Bool)

(assert (=> b!20821 m!14465))

(declare-fun m!14467 () Bool)

(assert (=> bm!1188 m!14467))

(declare-fun m!14469 () Bool)

(assert (=> bm!1188 m!14469))

(declare-fun m!14471 () Bool)

(assert (=> b!20806 m!14471))

(declare-fun m!14473 () Bool)

(assert (=> b!20806 m!14473))

(declare-fun m!14475 () Bool)

(assert (=> b!20806 m!14475))

(declare-fun m!14477 () Bool)

(assert (=> b!20806 m!14477))

(declare-fun m!14479 () Bool)

(assert (=> b!20806 m!14479))

(declare-fun m!14481 () Bool)

(assert (=> b!20794 m!14481))

(declare-fun m!14483 () Bool)

(assert (=> bm!1177 m!14483))

(declare-fun m!14485 () Bool)

(assert (=> bm!1182 m!14485))

(declare-fun m!14487 () Bool)

(assert (=> bm!1175 m!14487))

(declare-fun m!14489 () Bool)

(assert (=> bm!1190 m!14489))

(declare-fun m!14491 () Bool)

(assert (=> b!20788 m!14491))

(declare-fun m!14493 () Bool)

(assert (=> bm!1174 m!14493))

(declare-fun m!14495 () Bool)

(assert (=> b!20810 m!14495))

(declare-fun m!14497 () Bool)

(assert (=> bm!1189 m!14497))

(declare-fun m!14499 () Bool)

(assert (=> bm!1187 m!14499))

(declare-fun m!14501 () Bool)

(assert (=> b!20808 m!14501))

(assert (=> bm!1180 m!14463))

(declare-fun m!14503 () Bool)

(assert (=> d!3673 m!14503))

(declare-fun m!14505 () Bool)

(assert (=> d!3673 m!14505))

(declare-fun m!14507 () Bool)

(assert (=> b!20791 m!14507))

(declare-fun m!14509 () Bool)

(assert (=> bm!1194 m!14509))

(declare-fun m!14511 () Bool)

(assert (=> b!20811 m!14511))

(declare-fun m!14513 () Bool)

(assert (=> b!20816 m!14513))

(declare-fun m!14515 () Bool)

(assert (=> bm!1183 m!14515))

(declare-fun m!14517 () Bool)

(assert (=> b!20792 m!14517))

(declare-fun m!14519 () Bool)

(assert (=> bm!1172 m!14519))

(assert (=> b!20601 d!3673))

(declare-fun d!3675 () Bool)

(assert (=> d!3675 (= (validMask!0 (mask!4677 (v!1557 (underlying!97 thiss!938)))) (and (or (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000000111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000001111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000011111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000001111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000011111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000001111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000011111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000001111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000011111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000001111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000011111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000001111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000011111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000111111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000001111111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000011111111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000111111111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000001111111111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000011111111111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000111111111111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00001111111111111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00011111111111111111111111111111) (= (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!20597 d!3675))

(declare-fun b!20825 () Bool)

(declare-fun e!13605 () tuple2!876)

(declare-fun e!13591 () tuple2!876)

(assert (=> b!20825 (= e!13605 e!13591)))

(declare-fun lt!6304 () SeekEntryResult!49)

(assert (=> b!20825 (= lt!6304 (seekEntryOrOpen!0 (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(declare-fun c!2336 () Bool)

(assert (=> b!20825 (= c!2336 ((_ is Undefined!49) lt!6304))))

(declare-fun lt!6292 () SeekEntryResult!49)

(declare-fun res!13575 () Bool)

(declare-fun b!20826 () Bool)

(assert (=> b!20826 (= res!13575 (= (select (arr!561 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163))) (index!2319 lt!6292)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13604 () Bool)

(assert (=> b!20826 (=> (not res!13575) (not e!13604))))

(declare-fun b!20827 () Bool)

(declare-fun e!13603 () tuple2!876)

(declare-fun lt!6311 () tuple2!876)

(assert (=> b!20827 (= e!13603 (tuple2!877 (_1!441 lt!6311) (_2!441 lt!6311)))))

(declare-fun call!1200 () tuple2!876)

(assert (=> b!20827 (= lt!6311 call!1200)))

(declare-fun bm!1196 () Bool)

(declare-fun call!1207 () ListLongMap!553)

(declare-fun lt!6309 () tuple2!876)

(assert (=> bm!1196 (= call!1207 (map!391 (_2!441 lt!6309)))))

(declare-fun bm!1197 () Bool)

(declare-fun call!1215 () ListLongMap!553)

(declare-fun call!1206 () ListLongMap!553)

(assert (=> bm!1197 (= call!1215 call!1206)))

(declare-fun b!20828 () Bool)

(declare-fun e!13598 () Unit!440)

(declare-fun Unit!444 () Unit!440)

(assert (=> b!20828 (= e!13598 Unit!444)))

(declare-fun lt!6313 () Unit!440)

(declare-fun call!1205 () Unit!440)

(assert (=> b!20828 (= lt!6313 call!1205)))

(declare-fun call!1201 () SeekEntryResult!49)

(assert (=> b!20828 (= lt!6292 call!1201)))

(declare-fun c!2335 () Bool)

(assert (=> b!20828 (= c!2335 ((_ is MissingZero!49) lt!6292))))

(declare-fun e!13606 () Bool)

(assert (=> b!20828 e!13606))

(declare-fun lt!6293 () Unit!440)

(assert (=> b!20828 (= lt!6293 lt!6313)))

(assert (=> b!20828 false))

(declare-fun b!20829 () Bool)

(declare-fun lt!6298 () SeekEntryResult!49)

(declare-fun e!13594 () Bool)

(assert (=> b!20829 (= e!13594 (= (select (arr!561 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163))) (index!2317 lt!6298)) (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!20831 () Bool)

(declare-fun res!13582 () Bool)

(declare-fun call!1214 () Bool)

(assert (=> b!20831 (= res!13582 call!1214)))

(declare-fun e!13597 () Bool)

(assert (=> b!20831 (=> (not res!13582) (not e!13597))))

(declare-fun b!20832 () Bool)

(declare-fun res!13583 () Bool)

(declare-fun e!13595 () Bool)

(assert (=> b!20832 (=> (not res!13583) (not e!13595))))

(assert (=> b!20832 (= res!13583 (= (select (arr!561 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163))) (index!2316 lt!6292)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1198 () Bool)

(declare-fun call!1222 () ListLongMap!553)

(assert (=> bm!1198 (= call!1222 (map!391 (ite c!2276 (_2!441 lt!6166) lt!6163)))))

(declare-fun bm!1199 () Bool)

(declare-fun call!1213 () ListLongMap!553)

(assert (=> bm!1199 (= call!1213 (getCurrentListMap!122 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) #b00000000000000000000000000000000 (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(declare-fun bm!1200 () Bool)

(declare-fun call!1217 () ListLongMap!553)

(assert (=> bm!1200 (= call!1217 call!1213)))

(declare-fun bm!1201 () Bool)

(assert (=> bm!1201 (= call!1205 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!5 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(declare-fun b!20833 () Bool)

(declare-fun c!2334 () Bool)

(assert (=> b!20833 (= c!2334 ((_ is MissingVacant!49) lt!6292))))

(declare-fun e!13596 () Bool)

(assert (=> b!20833 (= e!13606 e!13596)))

(declare-fun bm!1202 () Bool)

(declare-fun call!1210 () Bool)

(declare-fun call!1221 () Bool)

(assert (=> bm!1202 (= call!1210 call!1221)))

(declare-fun b!20834 () Bool)

(declare-fun res!13579 () Bool)

(assert (=> b!20834 (=> (not res!13579) (not e!13595))))

(declare-fun call!1203 () Bool)

(assert (=> b!20834 (= res!13579 call!1203)))

(assert (=> b!20834 (= e!13606 e!13595)))

(declare-fun bm!1203 () Bool)

(declare-fun call!1211 () ListLongMap!553)

(assert (=> bm!1203 (= call!1211 call!1206)))

(declare-fun b!20835 () Bool)

(declare-fun c!2344 () Bool)

(assert (=> b!20835 (= c!2344 ((_ is MissingVacant!49) lt!6304))))

(assert (=> b!20835 (= e!13591 e!13603)))

(declare-fun b!20836 () Bool)

(declare-fun e!13599 () Bool)

(declare-fun e!13593 () Bool)

(assert (=> b!20836 (= e!13599 e!13593)))

(declare-fun c!2341 () Bool)

(assert (=> b!20836 (= c!2341 (_1!441 lt!6309))))

(declare-fun bm!1204 () Bool)

(declare-fun call!1218 () SeekEntryResult!49)

(assert (=> bm!1204 (= call!1218 (seekEntryOrOpen!0 (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(declare-fun b!20837 () Bool)

(declare-fun lt!6302 () tuple2!876)

(assert (=> b!20837 (= lt!6302 call!1200)))

(declare-fun e!13607 () tuple2!876)

(assert (=> b!20837 (= e!13607 (tuple2!877 (_1!441 lt!6302) (_2!441 lt!6302)))))

(declare-fun bm!1205 () Bool)

(declare-fun call!1219 () Bool)

(assert (=> bm!1205 (= call!1219 call!1210)))

(declare-fun b!20838 () Bool)

(declare-fun call!1208 () Bool)

(assert (=> b!20838 (= e!13604 (not call!1208))))

(declare-fun lt!6295 () (_ BitVec 32))

(declare-fun c!2342 () Bool)

(declare-fun lt!6296 () array!1179)

(declare-fun lt!6301 () (_ BitVec 32))

(declare-fun bm!1206 () Bool)

(declare-fun c!2333 () Bool)

(assert (=> bm!1206 (= call!1206 (getCurrentListMap!122 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (ite (or c!2333 c!2336) (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)) lt!6296) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (ite c!2333 (ite c!2342 lt!6295 lt!6301) (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163))) (ite (and c!2333 c!2342) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))) (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163))) (ite c!2333 (ite c!2342 (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938)))))) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163))) #b00000000000000000000000000000000 (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(declare-fun b!20839 () Bool)

(assert (=> b!20839 (= e!13595 (not call!1208))))

(declare-fun b!20840 () Bool)

(declare-fun e!13590 () Bool)

(declare-fun call!1199 () Bool)

(assert (=> b!20840 (= e!13590 (not call!1199))))

(declare-fun b!20841 () Bool)

(declare-fun c!2338 () Bool)

(declare-fun lt!6308 () SeekEntryResult!49)

(assert (=> b!20841 (= c!2338 ((_ is MissingVacant!49) lt!6308))))

(declare-fun e!13602 () Bool)

(declare-fun e!13592 () Bool)

(assert (=> b!20841 (= e!13602 e!13592)))

(declare-fun b!20842 () Bool)

(declare-fun e!13600 () Unit!440)

(declare-fun lt!6316 () Unit!440)

(assert (=> b!20842 (= e!13600 lt!6316)))

(assert (=> b!20842 (= lt!6316 call!1205)))

(declare-fun call!1202 () SeekEntryResult!49)

(assert (=> b!20842 (= lt!6308 call!1202)))

(declare-fun c!2339 () Bool)

(assert (=> b!20842 (= c!2339 ((_ is MissingZero!49) lt!6308))))

(assert (=> b!20842 e!13602))

(declare-fun b!20843 () Bool)

(declare-fun res!13576 () Bool)

(assert (=> b!20843 (=> (not res!13576) (not e!13590))))

(assert (=> b!20843 (= res!13576 (= (select (arr!561 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163))) (index!2316 lt!6308)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1207 () Bool)

(declare-fun c!2343 () Bool)

(declare-fun c!2340 () Bool)

(declare-fun lt!6303 () SeekEntryResult!49)

(assert (=> bm!1207 (= call!1221 (inRange!0 (ite c!2336 (ite c!2343 (index!2317 lt!6298) (ite c!2339 (index!2316 lt!6308) (index!2319 lt!6308))) (ite c!2340 (index!2317 lt!6303) (ite c!2335 (index!2316 lt!6292) (index!2319 lt!6292)))) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(declare-fun bm!1208 () Bool)

(assert (=> bm!1208 (= call!1202 call!1218)))

(declare-fun bm!1209 () Bool)

(declare-fun call!1220 () Bool)

(assert (=> bm!1209 (= call!1199 call!1220)))

(declare-fun b!20844 () Bool)

(declare-fun lt!6310 () Unit!440)

(declare-fun lt!6314 () Unit!440)

(assert (=> b!20844 (= lt!6310 lt!6314)))

(declare-fun call!1216 () Bool)

(assert (=> b!20844 call!1216))

(assert (=> b!20844 (= lt!6314 (lemmaValidKeyInArrayIsInListMap!5 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) lt!6296 (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (index!2317 lt!6304) (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(assert (=> b!20844 (= lt!6296 (array!1180 (store (arr!560 (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163))) (index!2317 lt!6304) (ValueCellFull!293 (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))))) (size!653 (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)))))))

(declare-fun lt!6294 () Unit!440)

(declare-fun lt!6312 () Unit!440)

(assert (=> b!20844 (= lt!6294 lt!6312)))

(declare-fun call!1212 () ListLongMap!553)

(assert (=> b!20844 (= call!1212 (getCurrentListMap!122 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (array!1180 (store (arr!560 (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163))) (index!2317 lt!6304) (ValueCellFull!293 (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))))) (size!653 (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)))) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) #b00000000000000000000000000000000 (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(assert (=> b!20844 (= lt!6312 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!5 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (index!2317 lt!6304) (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))) (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(declare-fun lt!6305 () Unit!440)

(assert (=> b!20844 (= lt!6305 e!13598)))

(assert (=> b!20844 (= c!2340 (contains!222 call!1213 (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!20844 (= e!13607 (tuple2!877 true (LongMapFixedSize!173 (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_size!125 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (array!1180 (store (arr!560 (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163))) (index!2317 lt!6304) (ValueCellFull!293 (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))))) (size!653 (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)))) (_vacant!125 (ite c!2276 (_2!441 lt!6166) lt!6163)))))))

(declare-fun bm!1210 () Bool)

(assert (=> bm!1210 (= call!1208 call!1220)))

(declare-fun b!20845 () Bool)

(declare-fun lt!6318 () Unit!440)

(assert (=> b!20845 (= e!13598 lt!6318)))

(declare-fun call!1209 () Unit!440)

(assert (=> b!20845 (= lt!6318 call!1209)))

(assert (=> b!20845 (= lt!6303 call!1201)))

(declare-fun res!13574 () Bool)

(assert (=> b!20845 (= res!13574 ((_ is Found!49) lt!6303))))

(assert (=> b!20845 (=> (not res!13574) (not e!13597))))

(assert (=> b!20845 e!13597))

(declare-fun bm!1211 () Bool)

(assert (=> bm!1211 (= call!1209 (lemmaInListMapThenSeekEntryOrOpenFindsIt!5 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(declare-fun b!20846 () Bool)

(assert (=> b!20846 (= e!13597 (= (select (arr!561 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163))) (index!2317 lt!6303)) (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!20830 () Bool)

(declare-fun e!13589 () Bool)

(assert (=> b!20830 (= e!13593 e!13589)))

(declare-fun res!13580 () Bool)

(assert (=> b!20830 (= res!13580 (contains!222 call!1207 (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!20830 (=> (not res!13580) (not e!13589))))

(declare-fun d!3677 () Bool)

(assert (=> d!3677 e!13599))

(declare-fun res!13578 () Bool)

(assert (=> d!3677 (=> (not res!13578) (not e!13599))))

(assert (=> d!3677 (= res!13578 (valid!100 (_2!441 lt!6309)))))

(assert (=> d!3677 (= lt!6309 e!13605)))

(assert (=> d!3677 (= c!2333 (= (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3677 (valid!100 (ite c!2276 (_2!441 lt!6166) lt!6163))))

(assert (=> d!3677 (= (update!25 (ite c!2276 (_2!441 lt!6166) lt!6163) (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938)))))) lt!6309)))

(declare-fun b!20847 () Bool)

(assert (=> b!20847 (= e!13596 ((_ is Undefined!49) lt!6292))))

(declare-fun bm!1212 () Bool)

(assert (=> bm!1212 (= call!1216 (contains!222 call!1211 (ite c!2336 (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!561 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163))) (index!2317 lt!6304)))))))

(declare-fun bm!1213 () Bool)

(assert (=> bm!1213 (= call!1220 (arrayContainsKey!0 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!20848 () Bool)

(declare-fun lt!6306 () Unit!440)

(declare-fun lt!6299 () Unit!440)

(assert (=> b!20848 (= lt!6306 lt!6299)))

(declare-fun call!1204 () ListLongMap!553)

(assert (=> b!20848 (= call!1204 call!1215)))

(assert (=> b!20848 (= lt!6299 (lemmaChangeLongMinValueKeyThenAddPairToListMap!5 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) lt!6301 (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))) (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(assert (=> b!20848 (= lt!6301 (bvor (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) #b00000000000000000000000000000010))))

(declare-fun e!13601 () tuple2!876)

(assert (=> b!20848 (= e!13601 (tuple2!877 true (LongMapFixedSize!173 (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (bvor (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) #b00000000000000000000000000000010) (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))) (_size!125 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_vacant!125 (ite c!2276 (_2!441 lt!6166) lt!6163)))))))

(declare-fun b!20849 () Bool)

(declare-fun res!13573 () Bool)

(assert (=> b!20849 (= res!13573 (= (select (arr!561 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163))) (index!2319 lt!6308)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13608 () Bool)

(assert (=> b!20849 (=> (not res!13573) (not e!13608))))

(declare-fun b!20850 () Bool)

(assert (=> b!20850 (= e!13603 e!13607)))

(declare-fun c!2337 () Bool)

(assert (=> b!20850 (= c!2337 ((_ is MissingZero!49) lt!6304))))

(declare-fun bm!1214 () Bool)

(assert (=> bm!1214 (= call!1200 (updateHelperNewKey!5 (ite c!2276 (_2!441 lt!6166) lt!6163) (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))) (ite c!2344 (index!2319 lt!6304) (index!2316 lt!6304))))))

(declare-fun b!20851 () Bool)

(assert (=> b!20851 (= e!13593 (= call!1207 call!1222))))

(declare-fun bm!1215 () Bool)

(assert (=> bm!1215 (= call!1203 call!1214)))

(declare-fun b!20852 () Bool)

(assert (=> b!20852 (= e!13596 e!13604)))

(declare-fun res!13581 () Bool)

(assert (=> b!20852 (= res!13581 call!1203)))

(assert (=> b!20852 (=> (not res!13581) (not e!13604))))

(declare-fun b!20853 () Bool)

(declare-fun Unit!445 () Unit!440)

(assert (=> b!20853 (= e!13600 Unit!445)))

(declare-fun lt!6300 () Unit!440)

(assert (=> b!20853 (= lt!6300 call!1209)))

(assert (=> b!20853 (= lt!6298 call!1202)))

(declare-fun res!13572 () Bool)

(assert (=> b!20853 (= res!13572 ((_ is Found!49) lt!6298))))

(assert (=> b!20853 (=> (not res!13572) (not e!13594))))

(assert (=> b!20853 e!13594))

(declare-fun lt!6297 () Unit!440)

(assert (=> b!20853 (= lt!6297 lt!6300)))

(assert (=> b!20853 false))

(declare-fun b!20854 () Bool)

(assert (=> b!20854 (= e!13589 (= call!1207 (+!39 call!1222 (tuple2!889 (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938)))))))))))

(declare-fun b!20855 () Bool)

(assert (=> b!20855 (= e!13592 ((_ is Undefined!49) lt!6308))))

(declare-fun b!20856 () Bool)

(assert (=> b!20856 (= e!13608 (not call!1199))))

(declare-fun bm!1216 () Bool)

(assert (=> bm!1216 (= call!1204 call!1212)))

(declare-fun b!20857 () Bool)

(declare-fun res!13577 () Bool)

(assert (=> b!20857 (= res!13577 call!1210)))

(assert (=> b!20857 (=> (not res!13577) (not e!13594))))

(declare-fun b!20858 () Bool)

(assert (=> b!20858 (= e!13605 e!13601)))

(assert (=> b!20858 (= c!2342 (= (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1217 () Bool)

(assert (=> bm!1217 (= call!1214 call!1221)))

(declare-fun b!20859 () Bool)

(declare-fun lt!6307 () Unit!440)

(declare-fun lt!6317 () Unit!440)

(assert (=> b!20859 (= lt!6307 lt!6317)))

(assert (=> b!20859 (= call!1204 call!1215)))

(assert (=> b!20859 (= lt!6317 (lemmaChangeZeroKeyThenAddPairToListMap!5 (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) lt!6295 (zeroValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163))))))

(assert (=> b!20859 (= lt!6295 (bvor (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) #b00000000000000000000000000000001))))

(assert (=> b!20859 (= e!13601 (tuple2!877 true (LongMapFixedSize!173 (defaultEntry!1710 (ite c!2276 (_2!441 lt!6166) lt!6163)) (mask!4677 (ite c!2276 (_2!441 lt!6166) lt!6163)) (bvor (extraKeys!1615 (ite c!2276 (_2!441 lt!6166) lt!6163)) #b00000000000000000000000000000001) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))) (minValue!1639 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_size!125 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_keys!3133 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_values!1701 (ite c!2276 (_2!441 lt!6166) lt!6163)) (_vacant!125 (ite c!2276 (_2!441 lt!6166) lt!6163)))))))

(declare-fun bm!1218 () Bool)

(assert (=> bm!1218 (= call!1212 (+!39 (ite c!2333 call!1217 call!1213) (ite c!2333 (ite c!2342 (tuple2!889 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938)))))) (tuple2!889 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938))))))) (tuple2!889 (ite c!2276 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2277 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2276 (minValue!1639 (v!1557 (underlying!97 thiss!938))) (ite c!2277 (zeroValue!1639 (v!1557 (underlying!97 thiss!938))) (minValue!1639 (v!1557 (underlying!97 thiss!938)))))))))))

(declare-fun b!20860 () Bool)

(declare-fun lt!6315 () Unit!440)

(assert (=> b!20860 (= lt!6315 e!13600)))

(assert (=> b!20860 (= c!2343 call!1216)))

(assert (=> b!20860 (= e!13591 (tuple2!877 false (ite c!2276 (_2!441 lt!6166) lt!6163)))))

(declare-fun bm!1219 () Bool)

(assert (=> bm!1219 (= call!1201 call!1218)))

(declare-fun b!20861 () Bool)

(declare-fun res!13584 () Bool)

(assert (=> b!20861 (=> (not res!13584) (not e!13590))))

(assert (=> b!20861 (= res!13584 call!1219)))

(assert (=> b!20861 (= e!13602 e!13590)))

(declare-fun b!20862 () Bool)

(assert (=> b!20862 (= e!13592 e!13608)))

(declare-fun res!13585 () Bool)

(assert (=> b!20862 (= res!13585 call!1219)))

(assert (=> b!20862 (=> (not res!13585) (not e!13608))))

(assert (= (and d!3677 c!2333) b!20858))

(assert (= (and d!3677 (not c!2333)) b!20825))

(assert (= (and b!20858 c!2342) b!20859))

(assert (= (and b!20858 (not c!2342)) b!20848))

(assert (= (or b!20859 b!20848) bm!1197))

(assert (= (or b!20859 b!20848) bm!1200))

(assert (= (or b!20859 b!20848) bm!1216))

(assert (= (and b!20825 c!2336) b!20860))

(assert (= (and b!20825 (not c!2336)) b!20835))

(assert (= (and b!20860 c!2343) b!20853))

(assert (= (and b!20860 (not c!2343)) b!20842))

(assert (= (and b!20853 res!13572) b!20857))

(assert (= (and b!20857 res!13577) b!20829))

(assert (= (and b!20842 c!2339) b!20861))

(assert (= (and b!20842 (not c!2339)) b!20841))

(assert (= (and b!20861 res!13584) b!20843))

(assert (= (and b!20843 res!13576) b!20840))

(assert (= (and b!20841 c!2338) b!20862))

(assert (= (and b!20841 (not c!2338)) b!20855))

(assert (= (and b!20862 res!13585) b!20849))

(assert (= (and b!20849 res!13573) b!20856))

(assert (= (or b!20861 b!20862) bm!1205))

(assert (= (or b!20840 b!20856) bm!1209))

(assert (= (or b!20857 bm!1205) bm!1202))

(assert (= (or b!20853 b!20842) bm!1208))

(assert (= (and b!20835 c!2344) b!20827))

(assert (= (and b!20835 (not c!2344)) b!20850))

(assert (= (and b!20850 c!2337) b!20837))

(assert (= (and b!20850 (not c!2337)) b!20844))

(assert (= (and b!20844 c!2340) b!20845))

(assert (= (and b!20844 (not c!2340)) b!20828))

(assert (= (and b!20845 res!13574) b!20831))

(assert (= (and b!20831 res!13582) b!20846))

(assert (= (and b!20828 c!2335) b!20834))

(assert (= (and b!20828 (not c!2335)) b!20833))

(assert (= (and b!20834 res!13579) b!20832))

(assert (= (and b!20832 res!13583) b!20839))

(assert (= (and b!20833 c!2334) b!20852))

(assert (= (and b!20833 (not c!2334)) b!20847))

(assert (= (and b!20852 res!13581) b!20826))

(assert (= (and b!20826 res!13575) b!20838))

(assert (= (or b!20834 b!20852) bm!1215))

(assert (= (or b!20839 b!20838) bm!1210))

(assert (= (or b!20831 bm!1215) bm!1217))

(assert (= (or b!20845 b!20828) bm!1219))

(assert (= (or b!20827 b!20837) bm!1214))

(assert (= (or b!20842 b!20828) bm!1201))

(assert (= (or b!20860 b!20844) bm!1203))

(assert (= (or b!20853 b!20845) bm!1211))

(assert (= (or bm!1202 bm!1217) bm!1207))

(assert (= (or bm!1208 bm!1219) bm!1204))

(assert (= (or bm!1209 bm!1210) bm!1213))

(assert (= (or b!20860 b!20844) bm!1212))

(assert (= (or bm!1197 bm!1203) bm!1206))

(assert (= (or bm!1200 b!20844) bm!1199))

(assert (= (or bm!1216 b!20844) bm!1218))

(assert (= (and d!3677 res!13578) b!20836))

(assert (= (and b!20836 c!2341) b!20830))

(assert (= (and b!20836 (not c!2341)) b!20851))

(assert (= (and b!20830 res!13580) b!20854))

(assert (= (or b!20830 b!20854 b!20851) bm!1196))

(assert (= (or b!20854 b!20851) bm!1198))

(declare-fun m!14521 () Bool)

(assert (=> b!20843 m!14521))

(declare-fun m!14523 () Bool)

(assert (=> b!20825 m!14523))

(declare-fun m!14525 () Bool)

(assert (=> b!20859 m!14525))

(declare-fun m!14527 () Bool)

(assert (=> bm!1212 m!14527))

(declare-fun m!14529 () Bool)

(assert (=> bm!1212 m!14529))

(declare-fun m!14531 () Bool)

(assert (=> b!20844 m!14531))

(declare-fun m!14533 () Bool)

(assert (=> b!20844 m!14533))

(declare-fun m!14535 () Bool)

(assert (=> b!20844 m!14535))

(declare-fun m!14537 () Bool)

(assert (=> b!20844 m!14537))

(declare-fun m!14539 () Bool)

(assert (=> b!20844 m!14539))

(declare-fun m!14541 () Bool)

(assert (=> b!20832 m!14541))

(declare-fun m!14543 () Bool)

(assert (=> bm!1201 m!14543))

(declare-fun m!14545 () Bool)

(assert (=> bm!1206 m!14545))

(declare-fun m!14547 () Bool)

(assert (=> bm!1199 m!14547))

(declare-fun m!14549 () Bool)

(assert (=> bm!1214 m!14549))

(declare-fun m!14551 () Bool)

(assert (=> b!20826 m!14551))

(declare-fun m!14553 () Bool)

(assert (=> bm!1198 m!14553))

(declare-fun m!14555 () Bool)

(assert (=> b!20848 m!14555))

(declare-fun m!14557 () Bool)

(assert (=> bm!1213 m!14557))

(declare-fun m!14559 () Bool)

(assert (=> bm!1211 m!14559))

(declare-fun m!14561 () Bool)

(assert (=> b!20846 m!14561))

(assert (=> bm!1204 m!14523))

(declare-fun m!14563 () Bool)

(assert (=> d!3677 m!14563))

(declare-fun m!14565 () Bool)

(assert (=> d!3677 m!14565))

(declare-fun m!14567 () Bool)

(assert (=> b!20829 m!14567))

(declare-fun m!14569 () Bool)

(assert (=> bm!1218 m!14569))

(declare-fun m!14571 () Bool)

(assert (=> b!20849 m!14571))

(declare-fun m!14573 () Bool)

(assert (=> b!20854 m!14573))

(declare-fun m!14575 () Bool)

(assert (=> bm!1207 m!14575))

(declare-fun m!14577 () Bool)

(assert (=> b!20830 m!14577))

(declare-fun m!14579 () Bool)

(assert (=> bm!1196 m!14579))

(assert (=> bm!1111 d!3677))

(declare-fun b!20875 () Bool)

(declare-fun e!13615 () Bool)

(declare-fun lt!6373 () tuple2!888)

(declare-fun lt!6376 () (_ BitVec 32))

(assert (=> b!20875 (= e!13615 (ite (= (_1!447 lt!6373) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6376 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6376 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!20876 () Bool)

(declare-fun e!13617 () Bool)

(declare-fun lt!6382 () LongMapFixedSize!172)

(assert (=> b!20876 (= e!13617 (= (map!391 lt!6382) (ListLongMap!554 Nil!552)))))

(declare-fun b!20877 () Bool)

(declare-fun lt!6383 () array!1181)

(assert (=> b!20877 (= e!13615 (arrayContainsKey!0 lt!6383 (_1!447 lt!6373) #b00000000000000000000000000000000))))

(declare-fun b!20878 () Bool)

(declare-fun e!13616 () Unit!440)

(declare-fun Unit!446 () Unit!440)

(assert (=> b!20878 (= e!13616 Unit!446)))

(declare-fun b!20879 () Bool)

(declare-fun res!13590 () Bool)

(assert (=> b!20879 (=> (not res!13590) (not e!13617))))

(assert (=> b!20879 (= res!13590 (= (mask!4677 lt!6382) (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938))))))))

(declare-fun b!20880 () Bool)

(declare-fun Unit!447 () Unit!440)

(assert (=> b!20880 (= e!13616 Unit!447)))

(declare-fun lt!6384 () LongMapFixedSize!172)

(declare-fun head!823 (List!555) tuple2!888)

(assert (=> b!20880 (= lt!6373 (head!823 (toList!292 (map!391 lt!6384))))))

(assert (=> b!20880 (= lt!6383 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!20880 (= lt!6376 #b00000000000000000000000000000000)))

(declare-fun lt!6378 () Unit!440)

(declare-fun lemmaKeyInListMapIsInArray!92 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 64) Int) Unit!440)

(declare-fun dynLambda!135 (Int (_ BitVec 64)) V!1139)

(assert (=> b!20880 (= lt!6378 (lemmaKeyInListMapIsInArray!92 lt!6383 (array!1180 ((as const (Array (_ BitVec 32) ValueCell!293)) EmptyCell!293) (bvadd (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) lt!6376 (dynLambda!135 (defaultEntry!1710 (v!1557 (underlying!97 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!135 (defaultEntry!1710 (v!1557 (underlying!97 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!447 lt!6373) (defaultEntry!1710 (v!1557 (underlying!97 thiss!938)))))))

(declare-fun c!2349 () Bool)

(assert (=> b!20880 (= c!2349 (and (not (= (_1!447 lt!6373) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!447 lt!6373) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!20880 e!13615))

(declare-fun lt!6374 () Unit!440)

(assert (=> b!20880 (= lt!6374 lt!6378)))

(declare-fun lt!6368 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1181 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20880 (= lt!6368 (arrayScanForKey!0 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)) (_1!447 lt!6373) #b00000000000000000000000000000000))))

(assert (=> b!20880 false))

(declare-fun d!3679 () Bool)

(assert (=> d!3679 e!13617))

(declare-fun res!13591 () Bool)

(assert (=> d!3679 (=> (not res!13591) (not e!13617))))

(assert (=> d!3679 (= res!13591 (valid!100 lt!6382))))

(assert (=> d!3679 (= lt!6382 lt!6384)))

(declare-fun lt!6377 () Unit!440)

(assert (=> d!3679 (= lt!6377 e!13616)))

(declare-fun c!2350 () Bool)

(assert (=> d!3679 (= c!2350 (not (= (map!391 lt!6384) (ListLongMap!554 Nil!552))))))

(declare-fun lt!6379 () Unit!440)

(declare-fun lt!6381 () Unit!440)

(assert (=> d!3679 (= lt!6379 lt!6381)))

(declare-fun lt!6387 () array!1181)

(declare-fun lt!6372 () (_ BitVec 32))

(declare-fun lt!6369 () List!554)

(assert (=> d!3679 (arrayNoDuplicates!0 lt!6387 lt!6372 lt!6369)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1181 (_ BitVec 32) (_ BitVec 32) List!554) Unit!440)

(assert (=> d!3679 (= lt!6381 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6387 lt!6372 (bvadd (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001) lt!6369))))

(assert (=> d!3679 (= lt!6369 Nil!551)))

(assert (=> d!3679 (= lt!6372 #b00000000000000000000000000000000)))

(assert (=> d!3679 (= lt!6387 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6367 () Unit!440)

(declare-fun lt!6375 () Unit!440)

(assert (=> d!3679 (= lt!6367 lt!6375)))

(declare-fun lt!6365 () (_ BitVec 32))

(declare-fun lt!6371 () array!1181)

(assert (=> d!3679 (arrayForallSeekEntryOrOpenFound!0 lt!6365 lt!6371 (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1181 (_ BitVec 32) (_ BitVec 32)) Unit!440)

(assert (=> d!3679 (= lt!6375 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6371 (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) lt!6365))))

(assert (=> d!3679 (= lt!6365 #b00000000000000000000000000000000)))

(assert (=> d!3679 (= lt!6371 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6366 () Unit!440)

(declare-fun lt!6386 () Unit!440)

(assert (=> d!3679 (= lt!6366 lt!6386)))

(declare-fun lt!6370 () array!1181)

(declare-fun lt!6385 () (_ BitVec 32))

(declare-fun lt!6380 () (_ BitVec 32))

(assert (=> d!3679 (= (arrayCountValidKeys!0 lt!6370 lt!6385 lt!6380) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1181 (_ BitVec 32) (_ BitVec 32)) Unit!440)

(assert (=> d!3679 (= lt!6386 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6370 lt!6385 lt!6380))))

(assert (=> d!3679 (= lt!6380 (bvadd (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3679 (= lt!6385 #b00000000000000000000000000000000)))

(assert (=> d!3679 (= lt!6370 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3679 (= lt!6384 (LongMapFixedSize!173 (defaultEntry!1710 (v!1557 (underlying!97 thiss!938))) (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!135 (defaultEntry!1710 (v!1557 (underlying!97 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!135 (defaultEntry!1710 (v!1557 (underlying!97 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)) (array!1180 ((as const (Array (_ BitVec 32) ValueCell!293)) EmptyCell!293) (bvadd (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3679 (validMask!0 (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))))))

(assert (=> d!3679 (= (getNewLongMapFixedSize!26 (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) (defaultEntry!1710 (v!1557 (underlying!97 thiss!938)))) lt!6382)))

(assert (= (and d!3679 c!2350) b!20880))

(assert (= (and d!3679 (not c!2350)) b!20878))

(assert (= (and b!20880 c!2349) b!20877))

(assert (= (and b!20880 (not c!2349)) b!20875))

(assert (= (and d!3679 res!13591) b!20879))

(assert (= (and b!20879 res!13590) b!20876))

(declare-fun b_lambda!1493 () Bool)

(assert (=> (not b_lambda!1493) (not b!20880)))

(declare-fun t!3202 () Bool)

(declare-fun tb!635 () Bool)

(assert (=> (and b!20595 (= (defaultEntry!1710 (v!1557 (underlying!97 thiss!938))) (defaultEntry!1710 (v!1557 (underlying!97 thiss!938)))) t!3202) tb!635))

(declare-fun result!1051 () Bool)

(assert (=> tb!635 (= result!1051 tp_is_empty!985)))

(assert (=> b!20880 t!3202))

(declare-fun b_and!1401 () Bool)

(assert (= b_and!1395 (and (=> t!3202 result!1051) b_and!1401)))

(declare-fun b_lambda!1495 () Bool)

(assert (=> (not b_lambda!1495) (not d!3679)))

(assert (=> d!3679 t!3202))

(declare-fun b_and!1403 () Bool)

(assert (= b_and!1401 (and (=> t!3202 result!1051) b_and!1403)))

(declare-fun m!14581 () Bool)

(assert (=> b!20876 m!14581))

(declare-fun m!14583 () Bool)

(assert (=> b!20877 m!14583))

(declare-fun m!14585 () Bool)

(assert (=> b!20880 m!14585))

(declare-fun m!14587 () Bool)

(assert (=> b!20880 m!14587))

(assert (=> b!20880 m!14393))

(declare-fun m!14589 () Bool)

(assert (=> b!20880 m!14589))

(assert (=> b!20880 m!14589))

(declare-fun m!14591 () Bool)

(assert (=> b!20880 m!14591))

(assert (=> b!20880 m!14589))

(declare-fun m!14593 () Bool)

(assert (=> b!20880 m!14593))

(assert (=> d!3679 m!14393))

(declare-fun m!14595 () Bool)

(assert (=> d!3679 m!14595))

(assert (=> d!3679 m!14393))

(declare-fun m!14597 () Bool)

(assert (=> d!3679 m!14597))

(assert (=> d!3679 m!14587))

(assert (=> d!3679 m!14589))

(declare-fun m!14599 () Bool)

(assert (=> d!3679 m!14599))

(declare-fun m!14601 () Bool)

(assert (=> d!3679 m!14601))

(assert (=> d!3679 m!14393))

(declare-fun m!14603 () Bool)

(assert (=> d!3679 m!14603))

(declare-fun m!14605 () Bool)

(assert (=> d!3679 m!14605))

(declare-fun m!14607 () Bool)

(assert (=> d!3679 m!14607))

(declare-fun m!14609 () Bool)

(assert (=> d!3679 m!14609))

(assert (=> b!20603 d!3679))

(declare-fun d!3681 () Bool)

(declare-fun e!13623 () Bool)

(assert (=> d!3681 e!13623))

(declare-fun res!13594 () Bool)

(assert (=> d!3681 (=> (not res!13594) (not e!13623))))

(declare-fun lt!6392 () (_ BitVec 32))

(assert (=> d!3681 (= res!13594 (validMask!0 lt!6392))))

(declare-datatypes ((tuple2!890 0))(
  ( (tuple2!891 (_1!448 Unit!440) (_2!448 (_ BitVec 32))) )
))
(declare-fun e!13622 () tuple2!890)

(assert (=> d!3681 (= lt!6392 (_2!448 e!13622))))

(declare-fun c!2353 () Bool)

(declare-fun lt!6393 () tuple2!890)

(assert (=> d!3681 (= c!2353 (and (bvsgt (_2!448 lt!6393) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!125 (v!1557 (underlying!97 thiss!938)))) (_2!448 lt!6393)) (bvsge (bvadd (bvand (bvashr (_2!448 lt!6393) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!125 (v!1557 (underlying!97 thiss!938))))))))

(declare-fun Unit!448 () Unit!440)

(declare-fun Unit!449 () Unit!440)

(assert (=> d!3681 (= lt!6393 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!125 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))))) (mask!4677 (v!1557 (underlying!97 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!125 (v!1557 (underlying!97 thiss!938)))) (mask!4677 (v!1557 (underlying!97 thiss!938))))) (tuple2!891 Unit!448 (bvand (bvadd (bvshl (mask!4677 (v!1557 (underlying!97 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!891 Unit!449 (mask!4677 (v!1557 (underlying!97 thiss!938))))))))

(assert (=> d!3681 (validMask!0 (mask!4677 (v!1557 (underlying!97 thiss!938))))))

(assert (=> d!3681 (= (computeNewMask!21 thiss!938 (mask!4677 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (_size!125 (v!1557 (underlying!97 thiss!938)))) lt!6392)))

(declare-fun b!20889 () Bool)

(declare-fun computeNewMaskWhile!9 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!890)

(assert (=> b!20889 (= e!13622 (computeNewMaskWhile!9 (_size!125 (v!1557 (underlying!97 thiss!938))) (_vacant!125 (v!1557 (underlying!97 thiss!938))) (mask!4677 (v!1557 (underlying!97 thiss!938))) (_2!448 lt!6393)))))

(declare-fun b!20890 () Bool)

(declare-fun Unit!450 () Unit!440)

(assert (=> b!20890 (= e!13622 (tuple2!891 Unit!450 (_2!448 lt!6393)))))

(declare-fun b!20891 () Bool)

(assert (=> b!20891 (= e!13623 (bvsle (_size!125 (v!1557 (underlying!97 thiss!938))) (bvadd lt!6392 #b00000000000000000000000000000001)))))

(assert (= (and d!3681 c!2353) b!20889))

(assert (= (and d!3681 (not c!2353)) b!20890))

(assert (= (and d!3681 res!13594) b!20891))

(declare-fun m!14611 () Bool)

(assert (=> d!3681 m!14611))

(assert (=> d!3681 m!14399))

(declare-fun m!14613 () Bool)

(assert (=> b!20889 m!14613))

(assert (=> b!20603 d!3681))

(declare-fun condMapEmpty!961 () Bool)

(declare-fun mapDefault!961 () ValueCell!293)

(assert (=> mapNonEmpty!952 (= condMapEmpty!961 (= mapRest!952 ((as const (Array (_ BitVec 32) ValueCell!293)) mapDefault!961)))))

(declare-fun e!13629 () Bool)

(declare-fun mapRes!961 () Bool)

(assert (=> mapNonEmpty!952 (= tp!3394 (and e!13629 mapRes!961))))

(declare-fun b!20899 () Bool)

(assert (=> b!20899 (= e!13629 tp_is_empty!985)))

(declare-fun mapNonEmpty!961 () Bool)

(declare-fun tp!3409 () Bool)

(declare-fun e!13628 () Bool)

(assert (=> mapNonEmpty!961 (= mapRes!961 (and tp!3409 e!13628))))

(declare-fun mapRest!961 () (Array (_ BitVec 32) ValueCell!293))

(declare-fun mapValue!961 () ValueCell!293)

(declare-fun mapKey!961 () (_ BitVec 32))

(assert (=> mapNonEmpty!961 (= mapRest!952 (store mapRest!961 mapKey!961 mapValue!961))))

(declare-fun b!20898 () Bool)

(assert (=> b!20898 (= e!13628 tp_is_empty!985)))

(declare-fun mapIsEmpty!961 () Bool)

(assert (=> mapIsEmpty!961 mapRes!961))

(assert (= (and mapNonEmpty!952 condMapEmpty!961) mapIsEmpty!961))

(assert (= (and mapNonEmpty!952 (not condMapEmpty!961)) mapNonEmpty!961))

(assert (= (and mapNonEmpty!961 ((_ is ValueCellFull!293) mapValue!961)) b!20898))

(assert (= (and mapNonEmpty!952 ((_ is ValueCellFull!293) mapDefault!961)) b!20899))

(declare-fun m!14615 () Bool)

(assert (=> mapNonEmpty!961 m!14615))

(declare-fun b_lambda!1497 () Bool)

(assert (= b_lambda!1495 (or (and b!20595 b_free!721) b_lambda!1497)))

(declare-fun b_lambda!1499 () Bool)

(assert (= b_lambda!1493 (or (and b!20595 b_free!721) b_lambda!1499)))

(check-sat tp_is_empty!985 (not b!20810) (not b!20854) (not b!20830) (not bm!1206) (not bm!1212) (not bm!1182) (not b!20710) (not b_lambda!1497) (not b!20880) (not bm!1211) (not b!20787) (not bm!1174) (not bm!1190) (not bm!1180) (not b!20876) (not bm!1204) (not b!20709) (not b_next!721) (not bm!1199) (not b!20844) (not b!20877) (not mapNonEmpty!961) (not d!3679) (not d!3669) (not bm!1188) (not b!20816) (not b!20889) (not d!3681) (not b!20792) (not bm!1172) (not bm!1196) (not b!20859) b_and!1403 (not b!20825) (not b!20821) (not b!20806) (not bm!1187) (not bm!1218) (not bm!1194) (not d!3671) (not b!20848) (not bm!1177) (not bm!1189) (not b!20708) (not bm!1214) (not d!3673) (not bm!1198) (not bm!1183) (not bm!1213) (not bm!1175) (not bm!1207) (not b_lambda!1499) (not d!3677) (not bm!1201))
(check-sat b_and!1403 (not b_next!721))
