; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3308 () Bool)

(assert start!3308)

(declare-fun b!20577 () Bool)

(declare-fun b_free!721 () Bool)

(declare-fun b_next!721 () Bool)

(assert (=> b!20577 (= b_free!721 (not b_next!721))))

(declare-fun tp!3393 () Bool)

(declare-fun b_and!1395 () Bool)

(assert (=> b!20577 (= tp!3393 b_and!1395)))

(declare-fun c!2269 () Bool)

(declare-datatypes ((V!1139 0))(
  ( (V!1140 (val!519 Int)) )
))
(declare-datatypes ((ValueCell!293 0))(
  ( (ValueCellFull!293 (v!1555 V!1139)) (EmptyCell!293) )
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
(declare-datatypes ((tuple2!870 0))(
  ( (tuple2!871 (_1!438 Bool) (_2!438 LongMapFixedSize!172)) )
))
(declare-fun call!1113 () tuple2!870)

(declare-fun c!2270 () Bool)

(declare-fun lt!6158 () LongMapFixedSize!172)

(declare-fun bm!1110 () Bool)

(declare-datatypes ((Cell!172 0))(
  ( (Cell!173 (v!1556 LongMapFixedSize!172)) )
))
(declare-datatypes ((LongMap!172 0))(
  ( (LongMap!173 (underlying!97 Cell!172)) )
))
(declare-fun thiss!938 () LongMap!172)

(declare-fun update!23 (LongMapFixedSize!172 (_ BitVec 64) V!1139) tuple2!870)

(assert (=> bm!1110 (= call!1113 (update!23 lt!6158 (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938))))))))

(declare-fun b!20566 () Bool)

(declare-datatypes ((tuple2!872 0))(
  ( (tuple2!873 (_1!439 Bool) (_2!439 Cell!172)) )
))
(declare-fun e!13435 () tuple2!872)

(declare-fun lt!6163 () tuple2!870)

(declare-fun lt!6162 () tuple2!870)

(assert (=> b!20566 (= e!13435 (tuple2!873 (and (_1!438 lt!6163) (_1!438 lt!6162)) (Cell!173 (_2!438 lt!6162))))))

(assert (=> b!20566 (= lt!6163 call!1113)))

(assert (=> b!20566 (= lt!6162 (update!23 (_2!438 lt!6163) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1639 (v!1556 (underlying!97 thiss!938)))))))

(declare-fun mapIsEmpty!952 () Bool)

(declare-fun mapRes!952 () Bool)

(assert (=> mapIsEmpty!952 mapRes!952))

(declare-fun b!20567 () Bool)

(declare-fun c!2271 () Bool)

(declare-fun lt!6164 () Bool)

(assert (=> b!20567 (= c!2271 (and (not (= (bvand (extraKeys!1615 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6164))))

(declare-fun e!13430 () tuple2!872)

(declare-fun e!13427 () tuple2!872)

(assert (=> b!20567 (= e!13430 e!13427)))

(declare-fun b!20568 () Bool)

(declare-fun e!13428 () Bool)

(declare-fun tp_is_empty!985 () Bool)

(assert (=> b!20568 (= e!13428 tp_is_empty!985)))

(declare-fun b!20569 () Bool)

(declare-fun e!13434 () Bool)

(declare-fun lt!6161 () tuple2!872)

(declare-fun valid!95 (LongMapFixedSize!172) Bool)

(assert (=> b!20569 (= e!13434 (not (valid!95 (v!1556 (_2!439 lt!6161)))))))

(declare-fun b!20570 () Bool)

(declare-fun e!13426 () Bool)

(assert (=> b!20570 (= e!13426 tp_is_empty!985)))

(declare-fun mapNonEmpty!952 () Bool)

(declare-fun tp!3394 () Bool)

(assert (=> mapNonEmpty!952 (= mapRes!952 (and tp!3394 e!13426))))

(declare-fun mapValue!952 () ValueCell!293)

(declare-fun mapKey!952 () (_ BitVec 32))

(declare-fun mapRest!952 () (Array (_ BitVec 32) ValueCell!293))

(assert (=> mapNonEmpty!952 (= (arr!560 (_values!1701 (v!1556 (underlying!97 thiss!938)))) (store mapRest!952 mapKey!952 mapValue!952))))

(declare-fun b!20571 () Bool)

(declare-fun e!13431 () Bool)

(declare-fun e!13433 () Bool)

(assert (=> b!20571 (= e!13431 e!13433)))

(declare-fun b!20572 () Bool)

(declare-fun lt!6160 () tuple2!870)

(assert (=> b!20572 (= e!13427 (tuple2!873 (_1!438 lt!6160) (Cell!173 (_2!438 lt!6160))))))

(declare-fun call!1114 () tuple2!870)

(assert (=> b!20572 (= lt!6160 call!1114)))

(declare-fun b!20573 () Bool)

(assert (=> b!20573 (= e!13435 e!13430)))

(assert (=> b!20573 (= c!2270 (and (not lt!6164) (= (bvand (extraKeys!1615 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!20574 () Bool)

(declare-fun e!13436 () Bool)

(assert (=> b!20574 (= e!13436 e!13434)))

(declare-fun res!13483 () Bool)

(assert (=> b!20574 (=> (not res!13483) (not e!13434))))

(assert (=> b!20574 (= res!13483 (_1!439 lt!6161))))

(assert (=> b!20574 (= lt!6161 e!13435)))

(assert (=> b!20574 (= c!2269 (and (not lt!6164) (not (= (bvand (extraKeys!1615 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20574 (= lt!6164 (= (bvand (extraKeys!1615 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!22 ((_ BitVec 32) Int) LongMapFixedSize!172)

(declare-fun computeNewMask!19 (LongMap!172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20574 (= lt!6158 (getNewLongMapFixedSize!22 (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) (defaultEntry!1710 (v!1556 (underlying!97 thiss!938)))))))

(declare-fun bm!1111 () Bool)

(assert (=> bm!1111 (= call!1114 call!1113)))

(declare-fun b!20575 () Bool)

(assert (=> b!20575 (= e!13427 (tuple2!873 true (Cell!173 lt!6158)))))

(declare-fun b!20576 () Bool)

(declare-fun e!13429 () Bool)

(assert (=> b!20576 (= e!13429 e!13431)))

(declare-fun e!13432 () Bool)

(declare-fun array_inv!397 (array!1181) Bool)

(declare-fun array_inv!398 (array!1179) Bool)

(assert (=> b!20577 (= e!13433 (and tp!3393 tp_is_empty!985 (array_inv!397 (_keys!3133 (v!1556 (underlying!97 thiss!938)))) (array_inv!398 (_values!1701 (v!1556 (underlying!97 thiss!938)))) e!13432))))

(declare-fun b!20578 () Bool)

(assert (=> b!20578 (= e!13432 (and e!13428 mapRes!952))))

(declare-fun condMapEmpty!952 () Bool)

(declare-fun mapDefault!952 () ValueCell!293)

(assert (=> b!20578 (= condMapEmpty!952 (= (arr!560 (_values!1701 (v!1556 (underlying!97 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!293)) mapDefault!952)))))

(declare-fun b!20579 () Bool)

(declare-fun res!13484 () Bool)

(assert (=> b!20579 (=> (not res!13484) (not e!13434))))

(assert (=> b!20579 (= res!13484 (and (= (size!654 (_keys!3133 (v!1556 (underlying!97 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4677 (v!1556 (underlying!97 thiss!938))))) (bvsge (bvsub (size!654 (_keys!3133 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (size!654 (_keys!3133 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001) (size!654 (_keys!3133 (v!1556 (underlying!97 thiss!938)))))))))

(declare-fun b!20580 () Bool)

(declare-fun lt!6159 () tuple2!870)

(assert (=> b!20580 (= lt!6159 call!1114)))

(assert (=> b!20580 (= e!13430 (tuple2!873 (_1!438 lt!6159) (Cell!173 (_2!438 lt!6159))))))

(declare-fun b!20581 () Bool)

(declare-fun res!13486 () Bool)

(assert (=> b!20581 (=> (not res!13486) (not e!13434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!20581 (= res!13486 (validMask!0 (mask!4677 (v!1556 (underlying!97 thiss!938)))))))

(declare-fun res!13485 () Bool)

(assert (=> start!3308 (=> (not res!13485) (not e!13436))))

(declare-fun valid!96 (LongMap!172) Bool)

(assert (=> start!3308 (= res!13485 (valid!96 thiss!938))))

(assert (=> start!3308 e!13436))

(assert (=> start!3308 e!13429))

(assert (= (and start!3308 res!13485) b!20574))

(assert (= (and b!20574 c!2269) b!20566))

(assert (= (and b!20574 (not c!2269)) b!20573))

(assert (= (and b!20573 c!2270) b!20580))

(assert (= (and b!20573 (not c!2270)) b!20567))

(assert (= (and b!20567 c!2271) b!20572))

(assert (= (and b!20567 (not c!2271)) b!20575))

(assert (= (or b!20580 b!20572) bm!1111))

(assert (= (or b!20566 bm!1111) bm!1110))

(assert (= (and b!20574 res!13483) b!20581))

(assert (= (and b!20581 res!13486) b!20579))

(assert (= (and b!20579 res!13484) b!20569))

(assert (= (and b!20578 condMapEmpty!952) mapIsEmpty!952))

(assert (= (and b!20578 (not condMapEmpty!952)) mapNonEmpty!952))

(get-info :version)

(assert (= (and mapNonEmpty!952 ((_ is ValueCellFull!293) mapValue!952)) b!20570))

(assert (= (and b!20578 ((_ is ValueCellFull!293) mapDefault!952)) b!20568))

(assert (= b!20577 b!20578))

(assert (= b!20571 b!20577))

(assert (= b!20576 b!20571))

(assert (= start!3308 b!20576))

(declare-fun m!14377 () Bool)

(assert (=> b!20569 m!14377))

(declare-fun m!14379 () Bool)

(assert (=> b!20581 m!14379))

(declare-fun m!14381 () Bool)

(assert (=> bm!1110 m!14381))

(declare-fun m!14383 () Bool)

(assert (=> b!20577 m!14383))

(declare-fun m!14385 () Bool)

(assert (=> b!20577 m!14385))

(declare-fun m!14387 () Bool)

(assert (=> b!20574 m!14387))

(assert (=> b!20574 m!14387))

(declare-fun m!14389 () Bool)

(assert (=> b!20574 m!14389))

(declare-fun m!14391 () Bool)

(assert (=> mapNonEmpty!952 m!14391))

(declare-fun m!14393 () Bool)

(assert (=> b!20566 m!14393))

(declare-fun m!14395 () Bool)

(assert (=> start!3308 m!14395))

(check-sat (not start!3308) (not b!20566) (not b_next!721) (not b!20574) (not bm!1110) (not b!20581) (not b!20569) b_and!1395 tp_is_empty!985 (not b!20577) (not mapNonEmpty!952))
(check-sat b_and!1395 (not b_next!721))
(get-model)

(declare-fun d!3659 () Bool)

(assert (=> d!3659 (= (valid!96 thiss!938) (valid!95 (v!1556 (underlying!97 thiss!938))))))

(declare-fun bs!899 () Bool)

(assert (= bs!899 d!3659))

(declare-fun m!14437 () Bool)

(assert (=> bs!899 m!14437))

(assert (=> start!3308 d!3659))

(declare-fun d!3661 () Bool)

(assert (=> d!3661 (= (validMask!0 (mask!4677 (v!1556 (underlying!97 thiss!938)))) (and (or (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000000000111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000000001111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000000011111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000000111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000001111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000011111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000001111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000011111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000001111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000011111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000001111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000011111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000001111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000011111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000111111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000001111111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000011111111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000111111111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000001111111111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000011111111111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000111111111111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00001111111111111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00011111111111111111111111111111) (= (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!20581 d!3661))

(declare-fun d!3663 () Bool)

(declare-fun res!13517 () Bool)

(declare-fun e!13511 () Bool)

(assert (=> d!3663 (=> (not res!13517) (not e!13511))))

(declare-fun simpleValid!17 (LongMapFixedSize!172) Bool)

(assert (=> d!3663 (= res!13517 (simpleValid!17 (v!1556 (_2!439 lt!6161))))))

(assert (=> d!3663 (= (valid!95 (v!1556 (_2!439 lt!6161))) e!13511)))

(declare-fun b!20684 () Bool)

(declare-fun res!13518 () Bool)

(assert (=> b!20684 (=> (not res!13518) (not e!13511))))

(declare-fun arrayCountValidKeys!0 (array!1181 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20684 (= res!13518 (= (arrayCountValidKeys!0 (_keys!3133 (v!1556 (_2!439 lt!6161))) #b00000000000000000000000000000000 (size!654 (_keys!3133 (v!1556 (_2!439 lt!6161))))) (_size!125 (v!1556 (_2!439 lt!6161)))))))

(declare-fun b!20685 () Bool)

(declare-fun res!13519 () Bool)

(assert (=> b!20685 (=> (not res!13519) (not e!13511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1181 (_ BitVec 32)) Bool)

(assert (=> b!20685 (= res!13519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3133 (v!1556 (_2!439 lt!6161))) (mask!4677 (v!1556 (_2!439 lt!6161)))))))

(declare-fun b!20686 () Bool)

(declare-datatypes ((List!553 0))(
  ( (Nil!550) (Cons!549 (h!1115 (_ BitVec 64)) (t!3201 List!553)) )
))
(declare-fun arrayNoDuplicates!0 (array!1181 (_ BitVec 32) List!553) Bool)

(assert (=> b!20686 (= e!13511 (arrayNoDuplicates!0 (_keys!3133 (v!1556 (_2!439 lt!6161))) #b00000000000000000000000000000000 Nil!550))))

(assert (= (and d!3663 res!13517) b!20684))

(assert (= (and b!20684 res!13518) b!20685))

(assert (= (and b!20685 res!13519) b!20686))

(declare-fun m!14439 () Bool)

(assert (=> d!3663 m!14439))

(declare-fun m!14441 () Bool)

(assert (=> b!20684 m!14441))

(declare-fun m!14443 () Bool)

(assert (=> b!20685 m!14443))

(declare-fun m!14445 () Bool)

(assert (=> b!20686 m!14445))

(assert (=> b!20569 d!3663))

(declare-fun d!3665 () Bool)

(assert (=> d!3665 (= (array_inv!397 (_keys!3133 (v!1556 (underlying!97 thiss!938)))) (bvsge (size!654 (_keys!3133 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20577 d!3665))

(declare-fun d!3667 () Bool)

(assert (=> d!3667 (= (array_inv!398 (_values!1701 (v!1556 (underlying!97 thiss!938)))) (bvsge (size!653 (_values!1701 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20577 d!3667))

(declare-fun bm!1172 () Bool)

(declare-fun call!1192 () Bool)

(declare-fun call!1186 () Bool)

(assert (=> bm!1172 (= call!1192 call!1186)))

(declare-datatypes ((tuple2!882 0))(
  ( (tuple2!883 (_1!444 (_ BitVec 64)) (_2!444 V!1139)) )
))
(declare-datatypes ((List!554 0))(
  ( (Nil!551) (Cons!550 (h!1116 tuple2!882) (t!3202 List!554)) )
))
(declare-datatypes ((ListLongMap!551 0))(
  ( (ListLongMap!552 (toList!291 List!554)) )
))
(declare-fun call!1197 () ListLongMap!551)

(declare-fun bm!1173 () Bool)

(declare-fun c!2329 () Bool)

(declare-fun lt!6273 () array!1179)

(declare-fun getCurrentListMap!122 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 32) Int) ListLongMap!551)

(assert (=> bm!1173 (= call!1197 (getCurrentListMap!122 (_keys!3133 (_2!438 lt!6163)) (ite c!2329 (_values!1701 (_2!438 lt!6163)) lt!6273) (mask!4677 (_2!438 lt!6163)) (extraKeys!1615 (_2!438 lt!6163)) (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (_2!438 lt!6163)) #b00000000000000000000000000000000 (defaultEntry!1710 (_2!438 lt!6163))))))

(declare-fun bm!1174 () Bool)

(declare-fun call!1187 () ListLongMap!551)

(declare-fun call!1194 () ListLongMap!551)

(assert (=> bm!1174 (= call!1187 call!1194)))

(declare-fun bm!1175 () Bool)

(declare-fun call!1198 () ListLongMap!551)

(declare-fun lt!6270 () tuple2!870)

(declare-fun map!389 (LongMapFixedSize!172) ListLongMap!551)

(assert (=> bm!1175 (= call!1198 (map!389 (_2!438 lt!6270)))))

(declare-fun c!2328 () Bool)

(declare-fun bm!1176 () Bool)

(declare-fun call!1196 () tuple2!870)

(declare-datatypes ((SeekEntryResult!50 0))(
  ( (MissingZero!50 (index!2320 (_ BitVec 32))) (Found!50 (index!2321 (_ BitVec 32))) (Intermediate!50 (undefined!862 Bool) (index!2322 (_ BitVec 32)) (x!5037 (_ BitVec 32))) (Undefined!50) (MissingVacant!50 (index!2323 (_ BitVec 32))) )
))
(declare-fun lt!6274 () SeekEntryResult!50)

(declare-fun updateHelperNewKey!5 (LongMapFixedSize!172 (_ BitVec 64) V!1139 (_ BitVec 32)) tuple2!870)

(assert (=> bm!1176 (= call!1196 (updateHelperNewKey!5 (_2!438 lt!6163) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1639 (v!1556 (underlying!97 thiss!938))) (ite c!2328 (index!2323 lt!6274) (index!2320 lt!6274))))))

(declare-fun b!20771 () Bool)

(declare-fun res!13554 () Bool)

(declare-fun lt!6278 () SeekEntryResult!50)

(assert (=> b!20771 (= res!13554 (= (select (arr!561 (_keys!3133 (_2!438 lt!6163))) (index!2323 lt!6278)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13565 () Bool)

(assert (=> b!20771 (=> (not res!13554) (not e!13565))))

(declare-fun b!20772 () Bool)

(declare-fun e!13573 () Bool)

(declare-fun e!13571 () Bool)

(assert (=> b!20772 (= e!13573 e!13571)))

(declare-fun res!13549 () Bool)

(declare-fun contains!223 (ListLongMap!551 (_ BitVec 64)) Bool)

(assert (=> b!20772 (= res!13549 (contains!223 call!1198 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20772 (=> (not res!13549) (not e!13571))))

(declare-fun b!20773 () Bool)

(declare-fun e!13577 () ListLongMap!551)

(declare-fun call!1179 () ListLongMap!551)

(assert (=> b!20773 (= e!13577 call!1179)))

(declare-fun b!20774 () Bool)

(declare-fun e!13556 () tuple2!870)

(declare-fun e!13562 () tuple2!870)

(assert (=> b!20774 (= e!13556 e!13562)))

(declare-fun c!2324 () Bool)

(assert (=> b!20774 (= c!2324 ((_ is MissingZero!50) lt!6274))))

(declare-fun bm!1177 () Bool)

(declare-fun call!1195 () SeekEntryResult!50)

(declare-fun call!1190 () SeekEntryResult!50)

(assert (=> bm!1177 (= call!1195 call!1190)))

(declare-fun b!20775 () Bool)

(declare-datatypes ((Unit!437 0))(
  ( (Unit!438) )
))
(declare-fun lt!6268 () Unit!437)

(declare-fun e!13566 () Unit!437)

(assert (=> b!20775 (= lt!6268 e!13566)))

(declare-fun c!2327 () Bool)

(declare-fun call!1188 () Bool)

(assert (=> b!20775 (= c!2327 call!1188)))

(declare-fun e!13559 () tuple2!870)

(assert (=> b!20775 (= e!13559 (tuple2!871 false (_2!438 lt!6163)))))

(declare-fun b!20776 () Bool)

(declare-fun e!13560 () Bool)

(declare-fun call!1175 () Bool)

(assert (=> b!20776 (= e!13560 (not call!1175))))

(declare-fun bm!1178 () Bool)

(declare-fun call!1184 () Unit!437)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 64) Int) Unit!437)

(assert (=> bm!1178 (= call!1184 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!5 (_keys!3133 (_2!438 lt!6163)) (_values!1701 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163)) (extraKeys!1615 (_2!438 lt!6163)) (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (_2!438 lt!6163)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1710 (_2!438 lt!6163))))))

(declare-fun b!20777 () Bool)

(declare-fun e!13564 () Bool)

(declare-fun lt!6277 () SeekEntryResult!50)

(assert (=> b!20777 (= e!13564 ((_ is Undefined!50) lt!6277))))

(declare-fun bm!1179 () Bool)

(declare-fun call!1191 () Bool)

(declare-fun call!1185 () Bool)

(assert (=> bm!1179 (= call!1191 call!1185)))

(declare-fun b!20778 () Bool)

(declare-fun e!13569 () tuple2!870)

(declare-fun e!13558 () tuple2!870)

(assert (=> b!20778 (= e!13569 e!13558)))

(declare-fun c!2326 () Bool)

(assert (=> b!20778 (= c!2326 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20779 () Bool)

(declare-fun c!2325 () Bool)

(assert (=> b!20779 (= c!2325 ((_ is MissingVacant!50) lt!6278))))

(declare-fun e!13572 () Bool)

(declare-fun e!13567 () Bool)

(assert (=> b!20779 (= e!13572 e!13567)))

(declare-fun bm!1180 () Bool)

(declare-fun call!1176 () ListLongMap!551)

(assert (=> bm!1180 (= call!1179 call!1176)))

(declare-fun b!20780 () Bool)

(declare-fun e!13563 () ListLongMap!551)

(declare-fun call!1182 () ListLongMap!551)

(assert (=> b!20780 (= e!13563 call!1182)))

(declare-fun b!20781 () Bool)

(declare-fun res!13556 () Bool)

(declare-fun e!13574 () Bool)

(assert (=> b!20781 (=> (not res!13556) (not e!13574))))

(assert (=> b!20781 (= res!13556 call!1192)))

(assert (=> b!20781 (= e!13572 e!13574)))

(declare-fun b!20782 () Bool)

(assert (=> b!20782 (= e!13567 ((_ is Undefined!50) lt!6278))))

(declare-fun bm!1181 () Bool)

(declare-fun call!1181 () Bool)

(declare-fun arrayContainsKey!0 (array!1181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1181 (= call!1181 (arrayContainsKey!0 (_keys!3133 (_2!438 lt!6163)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!20783 () Bool)

(declare-fun call!1177 () Bool)

(assert (=> b!20783 (= e!13574 (not call!1177))))

(declare-fun b!20784 () Bool)

(declare-fun e!13576 () Bool)

(declare-fun lt!6267 () SeekEntryResult!50)

(assert (=> b!20784 (= e!13576 (= (select (arr!561 (_keys!3133 (_2!438 lt!6163))) (index!2321 lt!6267)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20785 () Bool)

(declare-fun lt!6269 () Unit!437)

(declare-fun lt!6286 () Unit!437)

(assert (=> b!20785 (= lt!6269 lt!6286)))

(declare-fun call!1183 () ListLongMap!551)

(assert (=> b!20785 (= call!1187 call!1183)))

(declare-fun lt!6284 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 V!1139 Int) Unit!437)

(assert (=> b!20785 (= lt!6286 (lemmaChangeZeroKeyThenAddPairToListMap!5 (_keys!3133 (_2!438 lt!6163)) (_values!1701 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163)) (extraKeys!1615 (_2!438 lt!6163)) lt!6284 (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (_2!438 lt!6163)) (defaultEntry!1710 (_2!438 lt!6163))))))

(assert (=> b!20785 (= lt!6284 (bvor (extraKeys!1615 (_2!438 lt!6163)) #b00000000000000000000000000000001))))

(assert (=> b!20785 (= e!13558 (tuple2!871 true (LongMapFixedSize!173 (defaultEntry!1710 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163)) (bvor (extraKeys!1615 (_2!438 lt!6163)) #b00000000000000000000000000000001) (minValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (_2!438 lt!6163)) (_size!125 (_2!438 lt!6163)) (_keys!3133 (_2!438 lt!6163)) (_values!1701 (_2!438 lt!6163)) (_vacant!125 (_2!438 lt!6163)))))))

(declare-fun b!20786 () Bool)

(assert (=> b!20786 (= e!13564 e!13560)))

(declare-fun res!13548 () Bool)

(assert (=> b!20786 (= res!13548 call!1191)))

(assert (=> b!20786 (=> (not res!13548) (not e!13560))))

(declare-fun b!20787 () Bool)

(assert (=> b!20787 (= c!2328 ((_ is MissingVacant!50) lt!6274))))

(assert (=> b!20787 (= e!13559 e!13556)))

(declare-fun c!2330 () Bool)

(declare-fun call!1193 () Bool)

(declare-fun c!2319 () Bool)

(declare-fun c!2320 () Bool)

(declare-fun c!2322 () Bool)

(declare-fun bm!1182 () Bool)

(declare-fun lt!6285 () SeekEntryResult!50)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1182 (= call!1193 (inRange!0 (ite c!2330 (ite c!2327 (index!2321 lt!6285) (ite c!2322 (index!2320 lt!6277) (index!2323 lt!6277))) (ite c!2320 (index!2321 lt!6267) (ite c!2319 (index!2320 lt!6278) (index!2323 lt!6278)))) (mask!4677 (_2!438 lt!6163))))))

(declare-fun bm!1183 () Bool)

(assert (=> bm!1183 (= call!1186 call!1193)))

(declare-fun bm!1184 () Bool)

(declare-fun call!1180 () Unit!437)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 64) Int) Unit!437)

(assert (=> bm!1184 (= call!1180 (lemmaInListMapThenSeekEntryOrOpenFindsIt!5 (_keys!3133 (_2!438 lt!6163)) (_values!1701 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163)) (extraKeys!1615 (_2!438 lt!6163)) (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (_2!438 lt!6163)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1710 (_2!438 lt!6163))))))

(declare-fun b!20788 () Bool)

(declare-fun res!13552 () Bool)

(declare-fun e!13575 () Bool)

(assert (=> b!20788 (=> (not res!13552) (not e!13575))))

(assert (=> b!20788 (= res!13552 (= (select (arr!561 (_keys!3133 (_2!438 lt!6163))) (index!2320 lt!6277)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20789 () Bool)

(declare-fun lt!6282 () tuple2!870)

(assert (=> b!20789 (= lt!6282 call!1196)))

(assert (=> b!20789 (= e!13562 (tuple2!871 (_1!438 lt!6282) (_2!438 lt!6282)))))

(declare-fun b!20790 () Bool)

(declare-fun e!13568 () Bool)

(assert (=> b!20790 (= e!13568 (= (select (arr!561 (_keys!3133 (_2!438 lt!6163))) (index!2321 lt!6285)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20791 () Bool)

(declare-fun lt!6263 () Unit!437)

(assert (=> b!20791 (= e!13566 lt!6263)))

(assert (=> b!20791 (= lt!6263 call!1184)))

(declare-fun call!1189 () SeekEntryResult!50)

(assert (=> b!20791 (= lt!6277 call!1189)))

(assert (=> b!20791 (= c!2322 ((_ is MissingZero!50) lt!6277))))

(declare-fun e!13557 () Bool)

(assert (=> b!20791 e!13557))

(declare-fun bm!1185 () Bool)

(assert (=> bm!1185 (= call!1183 call!1176)))

(declare-fun b!20792 () Bool)

(declare-fun res!13557 () Bool)

(assert (=> b!20792 (= res!13557 call!1186)))

(assert (=> b!20792 (=> (not res!13557) (not e!13576))))

(declare-fun bm!1186 () Bool)

(assert (=> bm!1186 (= call!1175 call!1181)))

(declare-fun bm!1187 () Bool)

(assert (=> bm!1187 (= call!1182 call!1197)))

(declare-fun b!20793 () Bool)

(declare-fun lt!6266 () tuple2!870)

(assert (=> b!20793 (= e!13556 (tuple2!871 (_1!438 lt!6266) (_2!438 lt!6266)))))

(assert (=> b!20793 (= lt!6266 call!1196)))

(declare-fun b!20794 () Bool)

(assert (=> b!20794 (= e!13575 (not call!1175))))

(declare-fun b!20795 () Bool)

(declare-fun e!13570 () Unit!437)

(declare-fun lt!6279 () Unit!437)

(assert (=> b!20795 (= e!13570 lt!6279)))

(assert (=> b!20795 (= lt!6279 call!1180)))

(assert (=> b!20795 (= lt!6267 call!1195)))

(declare-fun res!13555 () Bool)

(assert (=> b!20795 (= res!13555 ((_ is Found!50) lt!6267))))

(assert (=> b!20795 (=> (not res!13555) (not e!13576))))

(assert (=> b!20795 e!13576))

(declare-fun b!20796 () Bool)

(assert (=> b!20796 (= e!13563 (getCurrentListMap!122 (_keys!3133 (_2!438 lt!6163)) (_values!1701 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163)) (extraKeys!1615 (_2!438 lt!6163)) (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (_2!438 lt!6163)) #b00000000000000000000000000000000 (defaultEntry!1710 (_2!438 lt!6163))))))

(declare-fun b!20797 () Bool)

(declare-fun res!13558 () Bool)

(assert (=> b!20797 (=> (not res!13558) (not e!13575))))

(assert (=> b!20797 (= res!13558 call!1191)))

(assert (=> b!20797 (= e!13557 e!13575)))

(declare-fun b!20798 () Bool)

(assert (=> b!20798 (= e!13567 e!13565)))

(declare-fun res!13550 () Bool)

(assert (=> b!20798 (= res!13550 call!1192)))

(assert (=> b!20798 (=> (not res!13550) (not e!13565))))

(declare-fun call!1178 () ListLongMap!551)

(declare-fun b!20799 () Bool)

(declare-fun +!40 (ListLongMap!551 tuple2!882) ListLongMap!551)

(assert (=> b!20799 (= e!13571 (= call!1198 (+!40 call!1178 (tuple2!883 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1639 (v!1556 (underlying!97 thiss!938)))))))))

(declare-fun d!3669 () Bool)

(declare-fun e!13561 () Bool)

(assert (=> d!3669 e!13561))

(declare-fun res!13551 () Bool)

(assert (=> d!3669 (=> (not res!13551) (not e!13561))))

(assert (=> d!3669 (= res!13551 (valid!95 (_2!438 lt!6270)))))

(assert (=> d!3669 (= lt!6270 e!13569)))

(assert (=> d!3669 (= c!2329 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3669 (valid!95 (_2!438 lt!6163))))

(assert (=> d!3669 (= (update!23 (_2!438 lt!6163) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1639 (v!1556 (underlying!97 thiss!938)))) lt!6270)))

(declare-fun b!20800 () Bool)

(declare-fun res!13559 () Bool)

(assert (=> b!20800 (= res!13559 (= (select (arr!561 (_keys!3133 (_2!438 lt!6163))) (index!2323 lt!6277)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20800 (=> (not res!13559) (not e!13560))))

(declare-fun b!20801 () Bool)

(declare-fun res!13553 () Bool)

(assert (=> b!20801 (=> (not res!13553) (not e!13574))))

(assert (=> b!20801 (= res!13553 (= (select (arr!561 (_keys!3133 (_2!438 lt!6163))) (index!2320 lt!6278)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1188 () Bool)

(assert (=> bm!1188 (= call!1185 call!1193)))

(declare-fun b!20802 () Bool)

(declare-fun lt!6287 () Unit!437)

(declare-fun lt!6271 () Unit!437)

(assert (=> b!20802 (= lt!6287 lt!6271)))

(assert (=> b!20802 (contains!223 call!1197 (select (arr!561 (_keys!3133 (_2!438 lt!6163))) (index!2321 lt!6274)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 32) Int) Unit!437)

(assert (=> b!20802 (= lt!6271 (lemmaValidKeyInArrayIsInListMap!5 (_keys!3133 (_2!438 lt!6163)) lt!6273 (mask!4677 (_2!438 lt!6163)) (extraKeys!1615 (_2!438 lt!6163)) (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (_2!438 lt!6163)) (index!2321 lt!6274) (defaultEntry!1710 (_2!438 lt!6163))))))

(assert (=> b!20802 (= lt!6273 (array!1180 (store (arr!560 (_values!1701 (_2!438 lt!6163))) (index!2321 lt!6274) (ValueCellFull!293 (minValue!1639 (v!1556 (underlying!97 thiss!938))))) (size!653 (_values!1701 (_2!438 lt!6163)))))))

(declare-fun lt!6281 () Unit!437)

(declare-fun lt!6261 () Unit!437)

(assert (=> b!20802 (= lt!6281 lt!6261)))

(assert (=> b!20802 (= call!1194 call!1179)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 32) (_ BitVec 64) V!1139 Int) Unit!437)

(assert (=> b!20802 (= lt!6261 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!5 (_keys!3133 (_2!438 lt!6163)) (_values!1701 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163)) (extraKeys!1615 (_2!438 lt!6163)) (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (_2!438 lt!6163)) (index!2321 lt!6274) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1639 (v!1556 (underlying!97 thiss!938))) (defaultEntry!1710 (_2!438 lt!6163))))))

(declare-fun lt!6264 () Unit!437)

(assert (=> b!20802 (= lt!6264 e!13570)))

(assert (=> b!20802 (= c!2320 call!1188)))

(assert (=> b!20802 (= e!13562 (tuple2!871 true (LongMapFixedSize!173 (defaultEntry!1710 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163)) (extraKeys!1615 (_2!438 lt!6163)) (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (_2!438 lt!6163)) (_size!125 (_2!438 lt!6163)) (_keys!3133 (_2!438 lt!6163)) (array!1180 (store (arr!560 (_values!1701 (_2!438 lt!6163))) (index!2321 lt!6274) (ValueCellFull!293 (minValue!1639 (v!1556 (underlying!97 thiss!938))))) (size!653 (_values!1701 (_2!438 lt!6163)))) (_vacant!125 (_2!438 lt!6163)))))))

(declare-fun b!20803 () Bool)

(declare-fun res!13560 () Bool)

(assert (=> b!20803 (= res!13560 call!1185)))

(assert (=> b!20803 (=> (not res!13560) (not e!13568))))

(declare-fun bm!1189 () Bool)

(assert (=> bm!1189 (= call!1189 call!1190)))

(declare-fun bm!1190 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1181 (_ BitVec 32)) SeekEntryResult!50)

(assert (=> bm!1190 (= call!1190 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3133 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163))))))

(declare-fun bm!1191 () Bool)

(declare-fun c!2318 () Bool)

(assert (=> bm!1191 (= c!2318 c!2330)))

(assert (=> bm!1191 (= call!1188 (contains!223 e!13577 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20804 () Bool)

(assert (=> b!20804 (= e!13577 (getCurrentListMap!122 (_keys!3133 (_2!438 lt!6163)) (_values!1701 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163)) (extraKeys!1615 (_2!438 lt!6163)) (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (_2!438 lt!6163)) #b00000000000000000000000000000000 (defaultEntry!1710 (_2!438 lt!6163))))))

(declare-fun b!20805 () Bool)

(assert (=> b!20805 (= e!13565 (not call!1177))))

(declare-fun b!20806 () Bool)

(assert (=> b!20806 (= e!13569 e!13559)))

(assert (=> b!20806 (= lt!6274 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3133 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163))))))

(assert (=> b!20806 (= c!2330 ((_ is Undefined!50) lt!6274))))

(declare-fun b!20807 () Bool)

(declare-fun Unit!439 () Unit!437)

(assert (=> b!20807 (= e!13570 Unit!439)))

(declare-fun lt!6262 () Unit!437)

(assert (=> b!20807 (= lt!6262 call!1184)))

(assert (=> b!20807 (= lt!6278 call!1195)))

(assert (=> b!20807 (= c!2319 ((_ is MissingZero!50) lt!6278))))

(assert (=> b!20807 e!13572))

(declare-fun lt!6265 () Unit!437)

(assert (=> b!20807 (= lt!6265 lt!6262)))

(assert (=> b!20807 false))

(declare-fun b!20808 () Bool)

(assert (=> b!20808 (= e!13561 e!13573)))

(declare-fun c!2331 () Bool)

(assert (=> b!20808 (= c!2331 (_1!438 lt!6270))))

(declare-fun bm!1192 () Bool)

(declare-fun lt!6272 () (_ BitVec 32))

(assert (=> bm!1192 (= call!1176 (getCurrentListMap!122 (_keys!3133 (_2!438 lt!6163)) (ite (or c!2329 c!2330) (_values!1701 (_2!438 lt!6163)) (array!1180 (store (arr!560 (_values!1701 (_2!438 lt!6163))) (index!2321 lt!6274) (ValueCellFull!293 (minValue!1639 (v!1556 (underlying!97 thiss!938))))) (size!653 (_values!1701 (_2!438 lt!6163))))) (mask!4677 (_2!438 lt!6163)) (ite c!2329 (ite c!2326 lt!6284 lt!6272) (extraKeys!1615 (_2!438 lt!6163))) (ite (and c!2329 c!2326) (minValue!1639 (v!1556 (underlying!97 thiss!938))) (zeroValue!1639 (_2!438 lt!6163))) (ite c!2329 (ite c!2326 (minValue!1639 (_2!438 lt!6163)) (minValue!1639 (v!1556 (underlying!97 thiss!938)))) (minValue!1639 (_2!438 lt!6163))) #b00000000000000000000000000000000 (defaultEntry!1710 (_2!438 lt!6163))))))

(declare-fun b!20809 () Bool)

(declare-fun c!2323 () Bool)

(assert (=> b!20809 (= c!2323 ((_ is MissingVacant!50) lt!6277))))

(assert (=> b!20809 (= e!13557 e!13564)))

(declare-fun b!20810 () Bool)

(declare-fun Unit!440 () Unit!437)

(assert (=> b!20810 (= e!13566 Unit!440)))

(declare-fun lt!6276 () Unit!437)

(assert (=> b!20810 (= lt!6276 call!1180)))

(assert (=> b!20810 (= lt!6285 call!1189)))

(declare-fun res!13561 () Bool)

(assert (=> b!20810 (= res!13561 ((_ is Found!50) lt!6285))))

(assert (=> b!20810 (=> (not res!13561) (not e!13568))))

(assert (=> b!20810 e!13568))

(declare-fun lt!6275 () Unit!437)

(assert (=> b!20810 (= lt!6275 lt!6276)))

(assert (=> b!20810 false))

(declare-fun b!20811 () Bool)

(assert (=> b!20811 (= e!13573 (= call!1198 call!1178))))

(declare-fun bm!1193 () Bool)

(assert (=> bm!1193 (= call!1177 call!1181)))

(declare-fun bm!1194 () Bool)

(assert (=> bm!1194 (= call!1178 (map!389 (_2!438 lt!6163)))))

(declare-fun b!20812 () Bool)

(declare-fun lt!6280 () Unit!437)

(declare-fun lt!6283 () Unit!437)

(assert (=> b!20812 (= lt!6280 lt!6283)))

(assert (=> b!20812 (= call!1187 call!1183)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!5 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 V!1139 Int) Unit!437)

(assert (=> b!20812 (= lt!6283 (lemmaChangeLongMinValueKeyThenAddPairToListMap!5 (_keys!3133 (_2!438 lt!6163)) (_values!1701 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163)) (extraKeys!1615 (_2!438 lt!6163)) lt!6272 (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (_2!438 lt!6163)) (minValue!1639 (v!1556 (underlying!97 thiss!938))) (defaultEntry!1710 (_2!438 lt!6163))))))

(assert (=> b!20812 (= lt!6272 (bvor (extraKeys!1615 (_2!438 lt!6163)) #b00000000000000000000000000000010))))

(assert (=> b!20812 (= e!13558 (tuple2!871 true (LongMapFixedSize!173 (defaultEntry!1710 (_2!438 lt!6163)) (mask!4677 (_2!438 lt!6163)) (bvor (extraKeys!1615 (_2!438 lt!6163)) #b00000000000000000000000000000010) (zeroValue!1639 (_2!438 lt!6163)) (minValue!1639 (v!1556 (underlying!97 thiss!938))) (_size!125 (_2!438 lt!6163)) (_keys!3133 (_2!438 lt!6163)) (_values!1701 (_2!438 lt!6163)) (_vacant!125 (_2!438 lt!6163)))))))

(declare-fun bm!1195 () Bool)

(assert (=> bm!1195 (= call!1194 (+!40 e!13563 (ite c!2329 (ite c!2326 (tuple2!883 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1639 (v!1556 (underlying!97 thiss!938)))) (tuple2!883 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1639 (v!1556 (underlying!97 thiss!938))))) (tuple2!883 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1639 (v!1556 (underlying!97 thiss!938)))))))))

(declare-fun c!2321 () Bool)

(assert (=> bm!1195 (= c!2321 c!2329)))

(assert (= (and d!3669 c!2329) b!20778))

(assert (= (and d!3669 (not c!2329)) b!20806))

(assert (= (and b!20778 c!2326) b!20785))

(assert (= (and b!20778 (not c!2326)) b!20812))

(assert (= (or b!20785 b!20812) bm!1185))

(assert (= (or b!20785 b!20812) bm!1187))

(assert (= (or b!20785 b!20812) bm!1174))

(assert (= (and b!20806 c!2330) b!20775))

(assert (= (and b!20806 (not c!2330)) b!20787))

(assert (= (and b!20775 c!2327) b!20810))

(assert (= (and b!20775 (not c!2327)) b!20791))

(assert (= (and b!20810 res!13561) b!20803))

(assert (= (and b!20803 res!13560) b!20790))

(assert (= (and b!20791 c!2322) b!20797))

(assert (= (and b!20791 (not c!2322)) b!20809))

(assert (= (and b!20797 res!13558) b!20788))

(assert (= (and b!20788 res!13552) b!20794))

(assert (= (and b!20809 c!2323) b!20786))

(assert (= (and b!20809 (not c!2323)) b!20777))

(assert (= (and b!20786 res!13548) b!20800))

(assert (= (and b!20800 res!13559) b!20776))

(assert (= (or b!20797 b!20786) bm!1179))

(assert (= (or b!20794 b!20776) bm!1186))

(assert (= (or b!20803 bm!1179) bm!1188))

(assert (= (or b!20810 b!20791) bm!1189))

(assert (= (and b!20787 c!2328) b!20793))

(assert (= (and b!20787 (not c!2328)) b!20774))

(assert (= (and b!20774 c!2324) b!20789))

(assert (= (and b!20774 (not c!2324)) b!20802))

(assert (= (and b!20802 c!2320) b!20795))

(assert (= (and b!20802 (not c!2320)) b!20807))

(assert (= (and b!20795 res!13555) b!20792))

(assert (= (and b!20792 res!13557) b!20784))

(assert (= (and b!20807 c!2319) b!20781))

(assert (= (and b!20807 (not c!2319)) b!20779))

(assert (= (and b!20781 res!13556) b!20801))

(assert (= (and b!20801 res!13553) b!20783))

(assert (= (and b!20779 c!2325) b!20798))

(assert (= (and b!20779 (not c!2325)) b!20782))

(assert (= (and b!20798 res!13550) b!20771))

(assert (= (and b!20771 res!13554) b!20805))

(assert (= (or b!20781 b!20798) bm!1172))

(assert (= (or b!20783 b!20805) bm!1193))

(assert (= (or b!20792 bm!1172) bm!1183))

(assert (= (or b!20795 b!20807) bm!1177))

(assert (= (or b!20793 b!20789) bm!1176))

(assert (= (or bm!1189 bm!1177) bm!1190))

(assert (= (or b!20791 b!20807) bm!1178))

(assert (= (or bm!1186 bm!1193) bm!1181))

(assert (= (or bm!1188 bm!1183) bm!1182))

(assert (= (or b!20810 b!20795) bm!1184))

(assert (= (or b!20775 b!20802) bm!1180))

(assert (= (or b!20775 b!20802) bm!1191))

(assert (= (and bm!1191 c!2318) b!20773))

(assert (= (and bm!1191 (not c!2318)) b!20804))

(assert (= (or bm!1185 bm!1180) bm!1192))

(assert (= (or bm!1187 b!20802) bm!1173))

(assert (= (or bm!1174 b!20802) bm!1195))

(assert (= (and bm!1195 c!2321) b!20780))

(assert (= (and bm!1195 (not c!2321)) b!20796))

(assert (= (and d!3669 res!13551) b!20808))

(assert (= (and b!20808 c!2331) b!20772))

(assert (= (and b!20808 (not c!2331)) b!20811))

(assert (= (and b!20772 res!13549) b!20799))

(assert (= (or b!20799 b!20811) bm!1194))

(assert (= (or b!20772 b!20799 b!20811) bm!1175))

(declare-fun m!14447 () Bool)

(assert (=> bm!1194 m!14447))

(declare-fun m!14449 () Bool)

(assert (=> b!20802 m!14449))

(declare-fun m!14451 () Bool)

(assert (=> b!20802 m!14451))

(declare-fun m!14453 () Bool)

(assert (=> b!20802 m!14453))

(assert (=> b!20802 m!14451))

(declare-fun m!14455 () Bool)

(assert (=> b!20802 m!14455))

(declare-fun m!14457 () Bool)

(assert (=> b!20802 m!14457))

(declare-fun m!14459 () Bool)

(assert (=> b!20804 m!14459))

(declare-fun m!14461 () Bool)

(assert (=> bm!1182 m!14461))

(declare-fun m!14463 () Bool)

(assert (=> bm!1173 m!14463))

(declare-fun m!14465 () Bool)

(assert (=> bm!1175 m!14465))

(declare-fun m!14467 () Bool)

(assert (=> b!20788 m!14467))

(declare-fun m!14469 () Bool)

(assert (=> bm!1181 m!14469))

(declare-fun m!14471 () Bool)

(assert (=> b!20772 m!14471))

(declare-fun m!14473 () Bool)

(assert (=> b!20790 m!14473))

(declare-fun m!14475 () Bool)

(assert (=> b!20806 m!14475))

(declare-fun m!14477 () Bool)

(assert (=> bm!1176 m!14477))

(declare-fun m!14479 () Bool)

(assert (=> b!20812 m!14479))

(declare-fun m!14481 () Bool)

(assert (=> b!20799 m!14481))

(assert (=> bm!1190 m!14475))

(declare-fun m!14483 () Bool)

(assert (=> bm!1195 m!14483))

(assert (=> b!20796 m!14459))

(assert (=> bm!1192 m!14457))

(declare-fun m!14485 () Bool)

(assert (=> bm!1192 m!14485))

(declare-fun m!14487 () Bool)

(assert (=> b!20784 m!14487))

(declare-fun m!14489 () Bool)

(assert (=> bm!1191 m!14489))

(declare-fun m!14491 () Bool)

(assert (=> b!20785 m!14491))

(declare-fun m!14493 () Bool)

(assert (=> b!20800 m!14493))

(declare-fun m!14495 () Bool)

(assert (=> bm!1184 m!14495))

(declare-fun m!14497 () Bool)

(assert (=> b!20771 m!14497))

(declare-fun m!14499 () Bool)

(assert (=> bm!1178 m!14499))

(declare-fun m!14501 () Bool)

(assert (=> b!20801 m!14501))

(declare-fun m!14503 () Bool)

(assert (=> d!3669 m!14503))

(declare-fun m!14505 () Bool)

(assert (=> d!3669 m!14505))

(assert (=> b!20566 d!3669))

(declare-fun bm!1196 () Bool)

(declare-fun call!1216 () Bool)

(declare-fun call!1210 () Bool)

(assert (=> bm!1196 (= call!1216 call!1210)))

(declare-fun lt!6300 () array!1179)

(declare-fun call!1221 () ListLongMap!551)

(declare-fun bm!1197 () Bool)

(declare-fun c!2343 () Bool)

(assert (=> bm!1197 (= call!1221 (getCurrentListMap!122 (_keys!3133 lt!6158) (ite c!2343 (_values!1701 lt!6158) lt!6300) (mask!4677 lt!6158) (extraKeys!1615 lt!6158) (zeroValue!1639 lt!6158) (minValue!1639 lt!6158) #b00000000000000000000000000000000 (defaultEntry!1710 lt!6158)))))

(declare-fun bm!1198 () Bool)

(declare-fun call!1211 () ListLongMap!551)

(declare-fun call!1218 () ListLongMap!551)

(assert (=> bm!1198 (= call!1211 call!1218)))

(declare-fun bm!1199 () Bool)

(declare-fun call!1222 () ListLongMap!551)

(declare-fun lt!6297 () tuple2!870)

(assert (=> bm!1199 (= call!1222 (map!389 (_2!438 lt!6297)))))

(declare-fun call!1220 () tuple2!870)

(declare-fun lt!6301 () SeekEntryResult!50)

(declare-fun bm!1200 () Bool)

(declare-fun c!2342 () Bool)

(assert (=> bm!1200 (= call!1220 (updateHelperNewKey!5 lt!6158 (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))) (ite c!2342 (index!2323 lt!6301) (index!2320 lt!6301))))))

(declare-fun b!20813 () Bool)

(declare-fun res!13568 () Bool)

(declare-fun lt!6305 () SeekEntryResult!50)

(assert (=> b!20813 (= res!13568 (= (select (arr!561 (_keys!3133 lt!6158)) (index!2323 lt!6305)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13587 () Bool)

(assert (=> b!20813 (=> (not res!13568) (not e!13587))))

(declare-fun b!20814 () Bool)

(declare-fun e!13595 () Bool)

(declare-fun e!13593 () Bool)

(assert (=> b!20814 (= e!13595 e!13593)))

(declare-fun res!13563 () Bool)

(assert (=> b!20814 (= res!13563 (contains!223 call!1222 (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20814 (=> (not res!13563) (not e!13593))))

(declare-fun b!20815 () Bool)

(declare-fun e!13599 () ListLongMap!551)

(declare-fun call!1203 () ListLongMap!551)

(assert (=> b!20815 (= e!13599 call!1203)))

(declare-fun b!20816 () Bool)

(declare-fun e!13578 () tuple2!870)

(declare-fun e!13584 () tuple2!870)

(assert (=> b!20816 (= e!13578 e!13584)))

(declare-fun c!2338 () Bool)

(assert (=> b!20816 (= c!2338 ((_ is MissingZero!50) lt!6301))))

(declare-fun bm!1201 () Bool)

(declare-fun call!1219 () SeekEntryResult!50)

(declare-fun call!1214 () SeekEntryResult!50)

(assert (=> bm!1201 (= call!1219 call!1214)))

(declare-fun b!20817 () Bool)

(declare-fun lt!6295 () Unit!437)

(declare-fun e!13588 () Unit!437)

(assert (=> b!20817 (= lt!6295 e!13588)))

(declare-fun c!2341 () Bool)

(declare-fun call!1212 () Bool)

(assert (=> b!20817 (= c!2341 call!1212)))

(declare-fun e!13581 () tuple2!870)

(assert (=> b!20817 (= e!13581 (tuple2!871 false lt!6158))))

(declare-fun b!20818 () Bool)

(declare-fun e!13582 () Bool)

(declare-fun call!1199 () Bool)

(assert (=> b!20818 (= e!13582 (not call!1199))))

(declare-fun call!1208 () Unit!437)

(declare-fun bm!1202 () Bool)

(assert (=> bm!1202 (= call!1208 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!5 (_keys!3133 lt!6158) (_values!1701 lt!6158) (mask!4677 lt!6158) (extraKeys!1615 lt!6158) (zeroValue!1639 lt!6158) (minValue!1639 lt!6158) (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1710 lt!6158)))))

(declare-fun b!20819 () Bool)

(declare-fun e!13586 () Bool)

(declare-fun lt!6304 () SeekEntryResult!50)

(assert (=> b!20819 (= e!13586 ((_ is Undefined!50) lt!6304))))

(declare-fun bm!1203 () Bool)

(declare-fun call!1215 () Bool)

(declare-fun call!1209 () Bool)

(assert (=> bm!1203 (= call!1215 call!1209)))

(declare-fun b!20820 () Bool)

(declare-fun e!13591 () tuple2!870)

(declare-fun e!13580 () tuple2!870)

(assert (=> b!20820 (= e!13591 e!13580)))

(declare-fun c!2340 () Bool)

(assert (=> b!20820 (= c!2340 (= (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20821 () Bool)

(declare-fun c!2339 () Bool)

(assert (=> b!20821 (= c!2339 ((_ is MissingVacant!50) lt!6305))))

(declare-fun e!13594 () Bool)

(declare-fun e!13589 () Bool)

(assert (=> b!20821 (= e!13594 e!13589)))

(declare-fun bm!1204 () Bool)

(declare-fun call!1200 () ListLongMap!551)

(assert (=> bm!1204 (= call!1203 call!1200)))

(declare-fun b!20822 () Bool)

(declare-fun e!13585 () ListLongMap!551)

(declare-fun call!1206 () ListLongMap!551)

(assert (=> b!20822 (= e!13585 call!1206)))

(declare-fun b!20823 () Bool)

(declare-fun res!13570 () Bool)

(declare-fun e!13596 () Bool)

(assert (=> b!20823 (=> (not res!13570) (not e!13596))))

(assert (=> b!20823 (= res!13570 call!1216)))

(assert (=> b!20823 (= e!13594 e!13596)))

(declare-fun b!20824 () Bool)

(assert (=> b!20824 (= e!13589 ((_ is Undefined!50) lt!6305))))

(declare-fun bm!1205 () Bool)

(declare-fun call!1205 () Bool)

(assert (=> bm!1205 (= call!1205 (arrayContainsKey!0 (_keys!3133 lt!6158) (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun b!20825 () Bool)

(declare-fun call!1201 () Bool)

(assert (=> b!20825 (= e!13596 (not call!1201))))

(declare-fun lt!6294 () SeekEntryResult!50)

(declare-fun b!20826 () Bool)

(declare-fun e!13598 () Bool)

(assert (=> b!20826 (= e!13598 (= (select (arr!561 (_keys!3133 lt!6158)) (index!2321 lt!6294)) (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!20827 () Bool)

(declare-fun lt!6296 () Unit!437)

(declare-fun lt!6313 () Unit!437)

(assert (=> b!20827 (= lt!6296 lt!6313)))

(declare-fun call!1207 () ListLongMap!551)

(assert (=> b!20827 (= call!1211 call!1207)))

(declare-fun lt!6311 () (_ BitVec 32))

(assert (=> b!20827 (= lt!6313 (lemmaChangeZeroKeyThenAddPairToListMap!5 (_keys!3133 lt!6158) (_values!1701 lt!6158) (mask!4677 lt!6158) (extraKeys!1615 lt!6158) lt!6311 (zeroValue!1639 lt!6158) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))) (minValue!1639 lt!6158) (defaultEntry!1710 lt!6158)))))

(assert (=> b!20827 (= lt!6311 (bvor (extraKeys!1615 lt!6158) #b00000000000000000000000000000001))))

(assert (=> b!20827 (= e!13580 (tuple2!871 true (LongMapFixedSize!173 (defaultEntry!1710 lt!6158) (mask!4677 lt!6158) (bvor (extraKeys!1615 lt!6158) #b00000000000000000000000000000001) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))) (minValue!1639 lt!6158) (_size!125 lt!6158) (_keys!3133 lt!6158) (_values!1701 lt!6158) (_vacant!125 lt!6158))))))

(declare-fun b!20828 () Bool)

(assert (=> b!20828 (= e!13586 e!13582)))

(declare-fun res!13562 () Bool)

(assert (=> b!20828 (= res!13562 call!1215)))

(assert (=> b!20828 (=> (not res!13562) (not e!13582))))

(declare-fun b!20829 () Bool)

(assert (=> b!20829 (= c!2342 ((_ is MissingVacant!50) lt!6301))))

(assert (=> b!20829 (= e!13581 e!13578)))

(declare-fun c!2334 () Bool)

(declare-fun bm!1206 () Bool)

(declare-fun c!2336 () Bool)

(declare-fun call!1217 () Bool)

(declare-fun c!2344 () Bool)

(declare-fun c!2333 () Bool)

(declare-fun lt!6312 () SeekEntryResult!50)

(assert (=> bm!1206 (= call!1217 (inRange!0 (ite c!2344 (ite c!2341 (index!2321 lt!6312) (ite c!2336 (index!2320 lt!6304) (index!2323 lt!6304))) (ite c!2334 (index!2321 lt!6294) (ite c!2333 (index!2320 lt!6305) (index!2323 lt!6305)))) (mask!4677 lt!6158)))))

(declare-fun bm!1207 () Bool)

(assert (=> bm!1207 (= call!1210 call!1217)))

(declare-fun bm!1208 () Bool)

(declare-fun call!1204 () Unit!437)

(assert (=> bm!1208 (= call!1204 (lemmaInListMapThenSeekEntryOrOpenFindsIt!5 (_keys!3133 lt!6158) (_values!1701 lt!6158) (mask!4677 lt!6158) (extraKeys!1615 lt!6158) (zeroValue!1639 lt!6158) (minValue!1639 lt!6158) (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1710 lt!6158)))))

(declare-fun b!20830 () Bool)

(declare-fun res!13566 () Bool)

(declare-fun e!13597 () Bool)

(assert (=> b!20830 (=> (not res!13566) (not e!13597))))

(assert (=> b!20830 (= res!13566 (= (select (arr!561 (_keys!3133 lt!6158)) (index!2320 lt!6304)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20831 () Bool)

(declare-fun lt!6309 () tuple2!870)

(assert (=> b!20831 (= lt!6309 call!1220)))

(assert (=> b!20831 (= e!13584 (tuple2!871 (_1!438 lt!6309) (_2!438 lt!6309)))))

(declare-fun e!13590 () Bool)

(declare-fun b!20832 () Bool)

(assert (=> b!20832 (= e!13590 (= (select (arr!561 (_keys!3133 lt!6158)) (index!2321 lt!6312)) (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!20833 () Bool)

(declare-fun lt!6290 () Unit!437)

(assert (=> b!20833 (= e!13588 lt!6290)))

(assert (=> b!20833 (= lt!6290 call!1208)))

(declare-fun call!1213 () SeekEntryResult!50)

(assert (=> b!20833 (= lt!6304 call!1213)))

(assert (=> b!20833 (= c!2336 ((_ is MissingZero!50) lt!6304))))

(declare-fun e!13579 () Bool)

(assert (=> b!20833 e!13579))

(declare-fun bm!1209 () Bool)

(assert (=> bm!1209 (= call!1207 call!1200)))

(declare-fun b!20834 () Bool)

(declare-fun res!13571 () Bool)

(assert (=> b!20834 (= res!13571 call!1210)))

(assert (=> b!20834 (=> (not res!13571) (not e!13598))))

(declare-fun bm!1210 () Bool)

(assert (=> bm!1210 (= call!1199 call!1205)))

(declare-fun bm!1211 () Bool)

(assert (=> bm!1211 (= call!1206 call!1221)))

(declare-fun b!20835 () Bool)

(declare-fun lt!6293 () tuple2!870)

(assert (=> b!20835 (= e!13578 (tuple2!871 (_1!438 lt!6293) (_2!438 lt!6293)))))

(assert (=> b!20835 (= lt!6293 call!1220)))

(declare-fun b!20836 () Bool)

(assert (=> b!20836 (= e!13597 (not call!1199))))

(declare-fun b!20837 () Bool)

(declare-fun e!13592 () Unit!437)

(declare-fun lt!6306 () Unit!437)

(assert (=> b!20837 (= e!13592 lt!6306)))

(assert (=> b!20837 (= lt!6306 call!1204)))

(assert (=> b!20837 (= lt!6294 call!1219)))

(declare-fun res!13569 () Bool)

(assert (=> b!20837 (= res!13569 ((_ is Found!50) lt!6294))))

(assert (=> b!20837 (=> (not res!13569) (not e!13598))))

(assert (=> b!20837 e!13598))

(declare-fun b!20838 () Bool)

(assert (=> b!20838 (= e!13585 (getCurrentListMap!122 (_keys!3133 lt!6158) (_values!1701 lt!6158) (mask!4677 lt!6158) (extraKeys!1615 lt!6158) (zeroValue!1639 lt!6158) (minValue!1639 lt!6158) #b00000000000000000000000000000000 (defaultEntry!1710 lt!6158)))))

(declare-fun b!20839 () Bool)

(declare-fun res!13572 () Bool)

(assert (=> b!20839 (=> (not res!13572) (not e!13597))))

(assert (=> b!20839 (= res!13572 call!1215)))

(assert (=> b!20839 (= e!13579 e!13597)))

(declare-fun b!20840 () Bool)

(assert (=> b!20840 (= e!13589 e!13587)))

(declare-fun res!13564 () Bool)

(assert (=> b!20840 (= res!13564 call!1216)))

(assert (=> b!20840 (=> (not res!13564) (not e!13587))))

(declare-fun call!1202 () ListLongMap!551)

(declare-fun b!20841 () Bool)

(assert (=> b!20841 (= e!13593 (= call!1222 (+!40 call!1202 (tuple2!883 (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938))))))))))

(declare-fun d!3671 () Bool)

(declare-fun e!13583 () Bool)

(assert (=> d!3671 e!13583))

(declare-fun res!13565 () Bool)

(assert (=> d!3671 (=> (not res!13565) (not e!13583))))

(assert (=> d!3671 (= res!13565 (valid!95 (_2!438 lt!6297)))))

(assert (=> d!3671 (= lt!6297 e!13591)))

(assert (=> d!3671 (= c!2343 (= (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3671 (valid!95 lt!6158)))

(assert (=> d!3671 (= (update!23 lt!6158 (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938))))) lt!6297)))

(declare-fun b!20842 () Bool)

(declare-fun res!13573 () Bool)

(assert (=> b!20842 (= res!13573 (= (select (arr!561 (_keys!3133 lt!6158)) (index!2323 lt!6304)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20842 (=> (not res!13573) (not e!13582))))

(declare-fun b!20843 () Bool)

(declare-fun res!13567 () Bool)

(assert (=> b!20843 (=> (not res!13567) (not e!13596))))

(assert (=> b!20843 (= res!13567 (= (select (arr!561 (_keys!3133 lt!6158)) (index!2320 lt!6305)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1212 () Bool)

(assert (=> bm!1212 (= call!1209 call!1217)))

(declare-fun b!20844 () Bool)

(declare-fun lt!6314 () Unit!437)

(declare-fun lt!6298 () Unit!437)

(assert (=> b!20844 (= lt!6314 lt!6298)))

(assert (=> b!20844 (contains!223 call!1221 (select (arr!561 (_keys!3133 lt!6158)) (index!2321 lt!6301)))))

(assert (=> b!20844 (= lt!6298 (lemmaValidKeyInArrayIsInListMap!5 (_keys!3133 lt!6158) lt!6300 (mask!4677 lt!6158) (extraKeys!1615 lt!6158) (zeroValue!1639 lt!6158) (minValue!1639 lt!6158) (index!2321 lt!6301) (defaultEntry!1710 lt!6158)))))

(assert (=> b!20844 (= lt!6300 (array!1180 (store (arr!560 (_values!1701 lt!6158)) (index!2321 lt!6301) (ValueCellFull!293 (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))))) (size!653 (_values!1701 lt!6158))))))

(declare-fun lt!6308 () Unit!437)

(declare-fun lt!6288 () Unit!437)

(assert (=> b!20844 (= lt!6308 lt!6288)))

(assert (=> b!20844 (= call!1218 call!1203)))

(assert (=> b!20844 (= lt!6288 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!5 (_keys!3133 lt!6158) (_values!1701 lt!6158) (mask!4677 lt!6158) (extraKeys!1615 lt!6158) (zeroValue!1639 lt!6158) (minValue!1639 lt!6158) (index!2321 lt!6301) (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))) (defaultEntry!1710 lt!6158)))))

(declare-fun lt!6291 () Unit!437)

(assert (=> b!20844 (= lt!6291 e!13592)))

(assert (=> b!20844 (= c!2334 call!1212)))

(assert (=> b!20844 (= e!13584 (tuple2!871 true (LongMapFixedSize!173 (defaultEntry!1710 lt!6158) (mask!4677 lt!6158) (extraKeys!1615 lt!6158) (zeroValue!1639 lt!6158) (minValue!1639 lt!6158) (_size!125 lt!6158) (_keys!3133 lt!6158) (array!1180 (store (arr!560 (_values!1701 lt!6158)) (index!2321 lt!6301) (ValueCellFull!293 (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))))) (size!653 (_values!1701 lt!6158))) (_vacant!125 lt!6158))))))

(declare-fun b!20845 () Bool)

(declare-fun res!13574 () Bool)

(assert (=> b!20845 (= res!13574 call!1209)))

(assert (=> b!20845 (=> (not res!13574) (not e!13590))))

(declare-fun bm!1213 () Bool)

(assert (=> bm!1213 (= call!1213 call!1214)))

(declare-fun bm!1214 () Bool)

(assert (=> bm!1214 (= call!1214 (seekEntryOrOpen!0 (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3133 lt!6158) (mask!4677 lt!6158)))))

(declare-fun bm!1215 () Bool)

(declare-fun c!2332 () Bool)

(assert (=> bm!1215 (= c!2332 c!2344)))

(assert (=> bm!1215 (= call!1212 (contains!223 e!13599 (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!20846 () Bool)

(assert (=> b!20846 (= e!13599 (getCurrentListMap!122 (_keys!3133 lt!6158) (_values!1701 lt!6158) (mask!4677 lt!6158) (extraKeys!1615 lt!6158) (zeroValue!1639 lt!6158) (minValue!1639 lt!6158) #b00000000000000000000000000000000 (defaultEntry!1710 lt!6158)))))

(declare-fun b!20847 () Bool)

(assert (=> b!20847 (= e!13587 (not call!1201))))

(declare-fun b!20848 () Bool)

(assert (=> b!20848 (= e!13591 e!13581)))

(assert (=> b!20848 (= lt!6301 (seekEntryOrOpen!0 (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3133 lt!6158) (mask!4677 lt!6158)))))

(assert (=> b!20848 (= c!2344 ((_ is Undefined!50) lt!6301))))

(declare-fun b!20849 () Bool)

(declare-fun Unit!441 () Unit!437)

(assert (=> b!20849 (= e!13592 Unit!441)))

(declare-fun lt!6289 () Unit!437)

(assert (=> b!20849 (= lt!6289 call!1208)))

(assert (=> b!20849 (= lt!6305 call!1219)))

(assert (=> b!20849 (= c!2333 ((_ is MissingZero!50) lt!6305))))

(assert (=> b!20849 e!13594))

(declare-fun lt!6292 () Unit!437)

(assert (=> b!20849 (= lt!6292 lt!6289)))

(assert (=> b!20849 false))

(declare-fun b!20850 () Bool)

(assert (=> b!20850 (= e!13583 e!13595)))

(declare-fun c!2345 () Bool)

(assert (=> b!20850 (= c!2345 (_1!438 lt!6297))))

(declare-fun lt!6299 () (_ BitVec 32))

(declare-fun bm!1216 () Bool)

(assert (=> bm!1216 (= call!1200 (getCurrentListMap!122 (_keys!3133 lt!6158) (ite (or c!2343 c!2344) (_values!1701 lt!6158) (array!1180 (store (arr!560 (_values!1701 lt!6158)) (index!2321 lt!6301) (ValueCellFull!293 (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))))) (size!653 (_values!1701 lt!6158)))) (mask!4677 lt!6158) (ite c!2343 (ite c!2340 lt!6311 lt!6299) (extraKeys!1615 lt!6158)) (ite (and c!2343 c!2340) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))) (zeroValue!1639 lt!6158)) (ite c!2343 (ite c!2340 (minValue!1639 lt!6158) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938))))) (minValue!1639 lt!6158)) #b00000000000000000000000000000000 (defaultEntry!1710 lt!6158)))))

(declare-fun b!20851 () Bool)

(declare-fun c!2337 () Bool)

(assert (=> b!20851 (= c!2337 ((_ is MissingVacant!50) lt!6304))))

(assert (=> b!20851 (= e!13579 e!13586)))

(declare-fun b!20852 () Bool)

(declare-fun Unit!442 () Unit!437)

(assert (=> b!20852 (= e!13588 Unit!442)))

(declare-fun lt!6303 () Unit!437)

(assert (=> b!20852 (= lt!6303 call!1204)))

(assert (=> b!20852 (= lt!6312 call!1213)))

(declare-fun res!13575 () Bool)

(assert (=> b!20852 (= res!13575 ((_ is Found!50) lt!6312))))

(assert (=> b!20852 (=> (not res!13575) (not e!13590))))

(assert (=> b!20852 e!13590))

(declare-fun lt!6302 () Unit!437)

(assert (=> b!20852 (= lt!6302 lt!6303)))

(assert (=> b!20852 false))

(declare-fun b!20853 () Bool)

(assert (=> b!20853 (= e!13595 (= call!1222 call!1202))))

(declare-fun bm!1217 () Bool)

(assert (=> bm!1217 (= call!1201 call!1205)))

(declare-fun bm!1218 () Bool)

(assert (=> bm!1218 (= call!1202 (map!389 lt!6158))))

(declare-fun b!20854 () Bool)

(declare-fun lt!6307 () Unit!437)

(declare-fun lt!6310 () Unit!437)

(assert (=> b!20854 (= lt!6307 lt!6310)))

(assert (=> b!20854 (= call!1211 call!1207)))

(assert (=> b!20854 (= lt!6310 (lemmaChangeLongMinValueKeyThenAddPairToListMap!5 (_keys!3133 lt!6158) (_values!1701 lt!6158) (mask!4677 lt!6158) (extraKeys!1615 lt!6158) lt!6299 (zeroValue!1639 lt!6158) (minValue!1639 lt!6158) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))) (defaultEntry!1710 lt!6158)))))

(assert (=> b!20854 (= lt!6299 (bvor (extraKeys!1615 lt!6158) #b00000000000000000000000000000010))))

(assert (=> b!20854 (= e!13580 (tuple2!871 true (LongMapFixedSize!173 (defaultEntry!1710 lt!6158) (mask!4677 lt!6158) (bvor (extraKeys!1615 lt!6158) #b00000000000000000000000000000010) (zeroValue!1639 lt!6158) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))) (_size!125 lt!6158) (_keys!3133 lt!6158) (_values!1701 lt!6158) (_vacant!125 lt!6158))))))

(declare-fun bm!1219 () Bool)

(assert (=> bm!1219 (= call!1218 (+!40 e!13585 (ite c!2343 (ite c!2340 (tuple2!883 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938))))) (tuple2!883 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938)))))) (tuple2!883 (ite (or c!2269 c!2270) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2269 c!2270) (zeroValue!1639 (v!1556 (underlying!97 thiss!938))) (minValue!1639 (v!1556 (underlying!97 thiss!938))))))))))

(declare-fun c!2335 () Bool)

(assert (=> bm!1219 (= c!2335 c!2343)))

(assert (= (and d!3671 c!2343) b!20820))

(assert (= (and d!3671 (not c!2343)) b!20848))

(assert (= (and b!20820 c!2340) b!20827))

(assert (= (and b!20820 (not c!2340)) b!20854))

(assert (= (or b!20827 b!20854) bm!1209))

(assert (= (or b!20827 b!20854) bm!1211))

(assert (= (or b!20827 b!20854) bm!1198))

(assert (= (and b!20848 c!2344) b!20817))

(assert (= (and b!20848 (not c!2344)) b!20829))

(assert (= (and b!20817 c!2341) b!20852))

(assert (= (and b!20817 (not c!2341)) b!20833))

(assert (= (and b!20852 res!13575) b!20845))

(assert (= (and b!20845 res!13574) b!20832))

(assert (= (and b!20833 c!2336) b!20839))

(assert (= (and b!20833 (not c!2336)) b!20851))

(assert (= (and b!20839 res!13572) b!20830))

(assert (= (and b!20830 res!13566) b!20836))

(assert (= (and b!20851 c!2337) b!20828))

(assert (= (and b!20851 (not c!2337)) b!20819))

(assert (= (and b!20828 res!13562) b!20842))

(assert (= (and b!20842 res!13573) b!20818))

(assert (= (or b!20839 b!20828) bm!1203))

(assert (= (or b!20836 b!20818) bm!1210))

(assert (= (or b!20845 bm!1203) bm!1212))

(assert (= (or b!20852 b!20833) bm!1213))

(assert (= (and b!20829 c!2342) b!20835))

(assert (= (and b!20829 (not c!2342)) b!20816))

(assert (= (and b!20816 c!2338) b!20831))

(assert (= (and b!20816 (not c!2338)) b!20844))

(assert (= (and b!20844 c!2334) b!20837))

(assert (= (and b!20844 (not c!2334)) b!20849))

(assert (= (and b!20837 res!13569) b!20834))

(assert (= (and b!20834 res!13571) b!20826))

(assert (= (and b!20849 c!2333) b!20823))

(assert (= (and b!20849 (not c!2333)) b!20821))

(assert (= (and b!20823 res!13570) b!20843))

(assert (= (and b!20843 res!13567) b!20825))

(assert (= (and b!20821 c!2339) b!20840))

(assert (= (and b!20821 (not c!2339)) b!20824))

(assert (= (and b!20840 res!13564) b!20813))

(assert (= (and b!20813 res!13568) b!20847))

(assert (= (or b!20823 b!20840) bm!1196))

(assert (= (or b!20825 b!20847) bm!1217))

(assert (= (or b!20834 bm!1196) bm!1207))

(assert (= (or b!20837 b!20849) bm!1201))

(assert (= (or b!20835 b!20831) bm!1200))

(assert (= (or bm!1213 bm!1201) bm!1214))

(assert (= (or b!20833 b!20849) bm!1202))

(assert (= (or bm!1210 bm!1217) bm!1205))

(assert (= (or bm!1212 bm!1207) bm!1206))

(assert (= (or b!20852 b!20837) bm!1208))

(assert (= (or b!20817 b!20844) bm!1204))

(assert (= (or b!20817 b!20844) bm!1215))

(assert (= (and bm!1215 c!2332) b!20815))

(assert (= (and bm!1215 (not c!2332)) b!20846))

(assert (= (or bm!1209 bm!1204) bm!1216))

(assert (= (or bm!1211 b!20844) bm!1197))

(assert (= (or bm!1198 b!20844) bm!1219))

(assert (= (and bm!1219 c!2335) b!20822))

(assert (= (and bm!1219 (not c!2335)) b!20838))

(assert (= (and d!3671 res!13565) b!20850))

(assert (= (and b!20850 c!2345) b!20814))

(assert (= (and b!20850 (not c!2345)) b!20853))

(assert (= (and b!20814 res!13563) b!20841))

(assert (= (or b!20841 b!20853) bm!1218))

(assert (= (or b!20814 b!20841 b!20853) bm!1199))

(declare-fun m!14507 () Bool)

(assert (=> bm!1218 m!14507))

(declare-fun m!14509 () Bool)

(assert (=> b!20844 m!14509))

(declare-fun m!14511 () Bool)

(assert (=> b!20844 m!14511))

(declare-fun m!14513 () Bool)

(assert (=> b!20844 m!14513))

(assert (=> b!20844 m!14511))

(declare-fun m!14515 () Bool)

(assert (=> b!20844 m!14515))

(declare-fun m!14517 () Bool)

(assert (=> b!20844 m!14517))

(declare-fun m!14519 () Bool)

(assert (=> b!20846 m!14519))

(declare-fun m!14521 () Bool)

(assert (=> bm!1206 m!14521))

(declare-fun m!14523 () Bool)

(assert (=> bm!1197 m!14523))

(declare-fun m!14525 () Bool)

(assert (=> bm!1199 m!14525))

(declare-fun m!14527 () Bool)

(assert (=> b!20830 m!14527))

(declare-fun m!14529 () Bool)

(assert (=> bm!1205 m!14529))

(declare-fun m!14531 () Bool)

(assert (=> b!20814 m!14531))

(declare-fun m!14533 () Bool)

(assert (=> b!20832 m!14533))

(declare-fun m!14535 () Bool)

(assert (=> b!20848 m!14535))

(declare-fun m!14537 () Bool)

(assert (=> bm!1200 m!14537))

(declare-fun m!14539 () Bool)

(assert (=> b!20854 m!14539))

(declare-fun m!14541 () Bool)

(assert (=> b!20841 m!14541))

(assert (=> bm!1214 m!14535))

(declare-fun m!14543 () Bool)

(assert (=> bm!1219 m!14543))

(assert (=> b!20838 m!14519))

(assert (=> bm!1216 m!14517))

(declare-fun m!14545 () Bool)

(assert (=> bm!1216 m!14545))

(declare-fun m!14547 () Bool)

(assert (=> b!20826 m!14547))

(declare-fun m!14549 () Bool)

(assert (=> bm!1215 m!14549))

(declare-fun m!14551 () Bool)

(assert (=> b!20827 m!14551))

(declare-fun m!14553 () Bool)

(assert (=> b!20842 m!14553))

(declare-fun m!14555 () Bool)

(assert (=> bm!1208 m!14555))

(declare-fun m!14557 () Bool)

(assert (=> b!20813 m!14557))

(declare-fun m!14559 () Bool)

(assert (=> bm!1202 m!14559))

(declare-fun m!14561 () Bool)

(assert (=> b!20843 m!14561))

(declare-fun m!14563 () Bool)

(assert (=> d!3671 m!14563))

(declare-fun m!14565 () Bool)

(assert (=> d!3671 m!14565))

(assert (=> bm!1110 d!3671))

(declare-fun b!20867 () Bool)

(declare-fun e!13607 () Unit!437)

(declare-fun Unit!443 () Unit!437)

(assert (=> b!20867 (= e!13607 Unit!443)))

(declare-fun lt!6364 () tuple2!882)

(declare-fun lt!6373 () LongMapFixedSize!172)

(declare-fun head!825 (List!554) tuple2!882)

(assert (=> b!20867 (= lt!6364 (head!825 (toList!291 (map!389 lt!6373))))))

(declare-fun lt!6381 () array!1181)

(assert (=> b!20867 (= lt!6381 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6382 () (_ BitVec 32))

(assert (=> b!20867 (= lt!6382 #b00000000000000000000000000000000)))

(declare-fun lt!6374 () Unit!437)

(declare-fun lemmaKeyInListMapIsInArray!92 (array!1181 array!1179 (_ BitVec 32) (_ BitVec 32) V!1139 V!1139 (_ BitVec 64) Int) Unit!437)

(declare-fun dynLambda!138 (Int (_ BitVec 64)) V!1139)

(assert (=> b!20867 (= lt!6374 (lemmaKeyInListMapIsInArray!92 lt!6381 (array!1180 ((as const (Array (_ BitVec 32) ValueCell!293)) EmptyCell!293) (bvadd (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) lt!6382 (dynLambda!138 (defaultEntry!1710 (v!1556 (underlying!97 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!138 (defaultEntry!1710 (v!1556 (underlying!97 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!444 lt!6364) (defaultEntry!1710 (v!1556 (underlying!97 thiss!938)))))))

(declare-fun c!2350 () Bool)

(assert (=> b!20867 (= c!2350 (and (not (= (_1!444 lt!6364) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!444 lt!6364) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!13606 () Bool)

(assert (=> b!20867 e!13606))

(declare-fun lt!6371 () Unit!437)

(assert (=> b!20867 (= lt!6371 lt!6374)))

(declare-fun lt!6369 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1181 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20867 (= lt!6369 (arrayScanForKey!0 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)) (_1!444 lt!6364) #b00000000000000000000000000000000))))

(assert (=> b!20867 false))

(declare-fun b!20868 () Bool)

(declare-fun res!13581 () Bool)

(declare-fun e!13608 () Bool)

(assert (=> b!20868 (=> (not res!13581) (not e!13608))))

(declare-fun lt!6370 () LongMapFixedSize!172)

(assert (=> b!20868 (= res!13581 (= (mask!4677 lt!6370) (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938))))))))

(declare-fun d!3673 () Bool)

(assert (=> d!3673 e!13608))

(declare-fun res!13580 () Bool)

(assert (=> d!3673 (=> (not res!13580) (not e!13608))))

(assert (=> d!3673 (= res!13580 (valid!95 lt!6370))))

(assert (=> d!3673 (= lt!6370 lt!6373)))

(declare-fun lt!6362 () Unit!437)

(assert (=> d!3673 (= lt!6362 e!13607)))

(declare-fun c!2351 () Bool)

(assert (=> d!3673 (= c!2351 (not (= (map!389 lt!6373) (ListLongMap!552 Nil!551))))))

(declare-fun lt!6366 () Unit!437)

(declare-fun lt!6377 () Unit!437)

(assert (=> d!3673 (= lt!6366 lt!6377)))

(declare-fun lt!6367 () array!1181)

(declare-fun lt!6361 () (_ BitVec 32))

(declare-fun lt!6375 () List!553)

(assert (=> d!3673 (arrayNoDuplicates!0 lt!6367 lt!6361 lt!6375)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1181 (_ BitVec 32) (_ BitVec 32) List!553) Unit!437)

(assert (=> d!3673 (= lt!6377 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6367 lt!6361 (bvadd (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001) lt!6375))))

(assert (=> d!3673 (= lt!6375 Nil!550)))

(assert (=> d!3673 (= lt!6361 #b00000000000000000000000000000000)))

(assert (=> d!3673 (= lt!6367 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6365 () Unit!437)

(declare-fun lt!6379 () Unit!437)

(assert (=> d!3673 (= lt!6365 lt!6379)))

(declare-fun lt!6383 () (_ BitVec 32))

(declare-fun lt!6363 () array!1181)

(assert (=> d!3673 (arrayForallSeekEntryOrOpenFound!0 lt!6383 lt!6363 (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1181 (_ BitVec 32) (_ BitVec 32)) Unit!437)

(assert (=> d!3673 (= lt!6379 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6363 (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) lt!6383))))

(assert (=> d!3673 (= lt!6383 #b00000000000000000000000000000000)))

(assert (=> d!3673 (= lt!6363 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6368 () Unit!437)

(declare-fun lt!6376 () Unit!437)

(assert (=> d!3673 (= lt!6368 lt!6376)))

(declare-fun lt!6380 () array!1181)

(declare-fun lt!6378 () (_ BitVec 32))

(declare-fun lt!6372 () (_ BitVec 32))

(assert (=> d!3673 (= (arrayCountValidKeys!0 lt!6380 lt!6378 lt!6372) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1181 (_ BitVec 32) (_ BitVec 32)) Unit!437)

(assert (=> d!3673 (= lt!6376 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6380 lt!6378 lt!6372))))

(assert (=> d!3673 (= lt!6372 (bvadd (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3673 (= lt!6378 #b00000000000000000000000000000000)))

(assert (=> d!3673 (= lt!6380 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3673 (= lt!6373 (LongMapFixedSize!173 (defaultEntry!1710 (v!1556 (underlying!97 thiss!938))) (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!138 (defaultEntry!1710 (v!1556 (underlying!97 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!138 (defaultEntry!1710 (v!1556 (underlying!97 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1182 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)) (array!1180 ((as const (Array (_ BitVec 32) ValueCell!293)) EmptyCell!293) (bvadd (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3673 (validMask!0 (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))))))

(assert (=> d!3673 (= (getNewLongMapFixedSize!22 (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) (defaultEntry!1710 (v!1556 (underlying!97 thiss!938)))) lt!6370)))

(declare-fun b!20869 () Bool)

(declare-fun Unit!444 () Unit!437)

(assert (=> b!20869 (= e!13607 Unit!444)))

(declare-fun b!20870 () Bool)

(assert (=> b!20870 (= e!13606 (arrayContainsKey!0 lt!6381 (_1!444 lt!6364) #b00000000000000000000000000000000))))

(declare-fun b!20871 () Bool)

(assert (=> b!20871 (= e!13606 (ite (= (_1!444 lt!6364) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6382 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6382 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!20872 () Bool)

(assert (=> b!20872 (= e!13608 (= (map!389 lt!6370) (ListLongMap!552 Nil!551)))))

(assert (= (and d!3673 c!2351) b!20867))

(assert (= (and d!3673 (not c!2351)) b!20869))

(assert (= (and b!20867 c!2350) b!20870))

(assert (= (and b!20867 (not c!2350)) b!20871))

(assert (= (and d!3673 res!13580) b!20868))

(assert (= (and b!20868 res!13581) b!20872))

(declare-fun b_lambda!1493 () Bool)

(assert (=> (not b_lambda!1493) (not b!20867)))

(declare-fun t!3200 () Bool)

(declare-fun tb!635 () Bool)

(assert (=> (and b!20577 (= (defaultEntry!1710 (v!1556 (underlying!97 thiss!938))) (defaultEntry!1710 (v!1556 (underlying!97 thiss!938)))) t!3200) tb!635))

(declare-fun result!1051 () Bool)

(assert (=> tb!635 (= result!1051 tp_is_empty!985)))

(assert (=> b!20867 t!3200))

(declare-fun b_and!1401 () Bool)

(assert (= b_and!1395 (and (=> t!3200 result!1051) b_and!1401)))

(declare-fun b_lambda!1495 () Bool)

(assert (=> (not b_lambda!1495) (not d!3673)))

(assert (=> d!3673 t!3200))

(declare-fun b_and!1403 () Bool)

(assert (= b_and!1401 (and (=> t!3200 result!1051) b_and!1403)))

(declare-fun m!14567 () Bool)

(assert (=> b!20867 m!14567))

(declare-fun m!14569 () Bool)

(assert (=> b!20867 m!14569))

(declare-fun m!14571 () Bool)

(assert (=> b!20867 m!14571))

(assert (=> b!20867 m!14387))

(declare-fun m!14573 () Bool)

(assert (=> b!20867 m!14573))

(assert (=> b!20867 m!14573))

(declare-fun m!14575 () Bool)

(assert (=> b!20867 m!14575))

(assert (=> b!20867 m!14573))

(declare-fun m!14577 () Bool)

(assert (=> d!3673 m!14577))

(assert (=> d!3673 m!14387))

(declare-fun m!14579 () Bool)

(assert (=> d!3673 m!14579))

(assert (=> d!3673 m!14573))

(declare-fun m!14581 () Bool)

(assert (=> d!3673 m!14581))

(assert (=> d!3673 m!14387))

(declare-fun m!14583 () Bool)

(assert (=> d!3673 m!14583))

(assert (=> d!3673 m!14387))

(declare-fun m!14585 () Bool)

(assert (=> d!3673 m!14585))

(declare-fun m!14587 () Bool)

(assert (=> d!3673 m!14587))

(assert (=> d!3673 m!14567))

(declare-fun m!14589 () Bool)

(assert (=> d!3673 m!14589))

(declare-fun m!14591 () Bool)

(assert (=> d!3673 m!14591))

(declare-fun m!14593 () Bool)

(assert (=> b!20870 m!14593))

(declare-fun m!14595 () Bool)

(assert (=> b!20872 m!14595))

(assert (=> b!20574 d!3673))

(declare-fun d!3675 () Bool)

(declare-fun e!13613 () Bool)

(assert (=> d!3675 e!13613))

(declare-fun res!13584 () Bool)

(assert (=> d!3675 (=> (not res!13584) (not e!13613))))

(declare-fun lt!6389 () (_ BitVec 32))

(assert (=> d!3675 (= res!13584 (validMask!0 lt!6389))))

(declare-datatypes ((tuple2!884 0))(
  ( (tuple2!885 (_1!445 Unit!437) (_2!445 (_ BitVec 32))) )
))
(declare-fun e!13614 () tuple2!884)

(assert (=> d!3675 (= lt!6389 (_2!445 e!13614))))

(declare-fun c!2354 () Bool)

(declare-fun lt!6388 () tuple2!884)

(assert (=> d!3675 (= c!2354 (and (bvsgt (_2!445 lt!6388) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!125 (v!1556 (underlying!97 thiss!938)))) (_2!445 lt!6388)) (bvsge (bvadd (bvand (bvashr (_2!445 lt!6388) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!125 (v!1556 (underlying!97 thiss!938))))))))

(declare-fun Unit!445 () Unit!437)

(declare-fun Unit!446 () Unit!437)

(assert (=> d!3675 (= lt!6388 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!125 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))))) (mask!4677 (v!1556 (underlying!97 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!125 (v!1556 (underlying!97 thiss!938)))) (mask!4677 (v!1556 (underlying!97 thiss!938))))) (tuple2!885 Unit!445 (bvand (bvadd (bvshl (mask!4677 (v!1556 (underlying!97 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!885 Unit!446 (mask!4677 (v!1556 (underlying!97 thiss!938))))))))

(assert (=> d!3675 (validMask!0 (mask!4677 (v!1556 (underlying!97 thiss!938))))))

(assert (=> d!3675 (= (computeNewMask!19 thiss!938 (mask!4677 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (_size!125 (v!1556 (underlying!97 thiss!938)))) lt!6389)))

(declare-fun b!20881 () Bool)

(declare-fun computeNewMaskWhile!9 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!884)

(assert (=> b!20881 (= e!13614 (computeNewMaskWhile!9 (_size!125 (v!1556 (underlying!97 thiss!938))) (_vacant!125 (v!1556 (underlying!97 thiss!938))) (mask!4677 (v!1556 (underlying!97 thiss!938))) (_2!445 lt!6388)))))

(declare-fun b!20882 () Bool)

(declare-fun Unit!447 () Unit!437)

(assert (=> b!20882 (= e!13614 (tuple2!885 Unit!447 (_2!445 lt!6388)))))

(declare-fun b!20883 () Bool)

(assert (=> b!20883 (= e!13613 (bvsle (_size!125 (v!1556 (underlying!97 thiss!938))) (bvadd lt!6389 #b00000000000000000000000000000001)))))

(assert (= (and d!3675 c!2354) b!20881))

(assert (= (and d!3675 (not c!2354)) b!20882))

(assert (= (and d!3675 res!13584) b!20883))

(declare-fun m!14597 () Bool)

(assert (=> d!3675 m!14597))

(assert (=> d!3675 m!14379))

(declare-fun m!14599 () Bool)

(assert (=> b!20881 m!14599))

(assert (=> b!20574 d!3675))

(declare-fun mapIsEmpty!961 () Bool)

(declare-fun mapRes!961 () Bool)

(assert (=> mapIsEmpty!961 mapRes!961))

(declare-fun b!20891 () Bool)

(declare-fun e!13619 () Bool)

(assert (=> b!20891 (= e!13619 tp_is_empty!985)))

(declare-fun condMapEmpty!961 () Bool)

(declare-fun mapDefault!961 () ValueCell!293)

(assert (=> mapNonEmpty!952 (= condMapEmpty!961 (= mapRest!952 ((as const (Array (_ BitVec 32) ValueCell!293)) mapDefault!961)))))

(assert (=> mapNonEmpty!952 (= tp!3394 (and e!13619 mapRes!961))))

(declare-fun mapNonEmpty!961 () Bool)

(declare-fun tp!3409 () Bool)

(declare-fun e!13620 () Bool)

(assert (=> mapNonEmpty!961 (= mapRes!961 (and tp!3409 e!13620))))

(declare-fun mapKey!961 () (_ BitVec 32))

(declare-fun mapRest!961 () (Array (_ BitVec 32) ValueCell!293))

(declare-fun mapValue!961 () ValueCell!293)

(assert (=> mapNonEmpty!961 (= mapRest!952 (store mapRest!961 mapKey!961 mapValue!961))))

(declare-fun b!20890 () Bool)

(assert (=> b!20890 (= e!13620 tp_is_empty!985)))

(assert (= (and mapNonEmpty!952 condMapEmpty!961) mapIsEmpty!961))

(assert (= (and mapNonEmpty!952 (not condMapEmpty!961)) mapNonEmpty!961))

(assert (= (and mapNonEmpty!961 ((_ is ValueCellFull!293) mapValue!961)) b!20890))

(assert (= (and mapNonEmpty!952 ((_ is ValueCellFull!293) mapDefault!961)) b!20891))

(declare-fun m!14601 () Bool)

(assert (=> mapNonEmpty!961 m!14601))

(declare-fun b_lambda!1497 () Bool)

(assert (= b_lambda!1495 (or (and b!20577 b_free!721) b_lambda!1497)))

(declare-fun b_lambda!1499 () Bool)

(assert (= b_lambda!1493 (or (and b!20577 b_free!721) b_lambda!1499)))

(check-sat (not bm!1200) (not bm!1219) (not b!20872) (not bm!1194) (not b!20846) (not bm!1208) (not bm!1181) (not b!20804) (not b!20802) (not bm!1175) (not b!20772) (not b!20848) (not b!20806) (not b_lambda!1497) (not bm!1216) (not b!20799) (not d!3663) (not bm!1192) (not b!20796) (not d!3673) (not bm!1191) (not bm!1218) (not b_lambda!1499) (not b_next!721) (not bm!1197) (not b!20827) (not mapNonEmpty!961) (not bm!1206) (not b!20812) (not bm!1182) (not bm!1190) (not bm!1184) (not bm!1173) (not bm!1199) (not b!20684) (not b!20867) (not bm!1214) (not b!20854) (not b!20870) (not bm!1195) (not bm!1176) (not b!20785) (not bm!1202) (not b!20685) (not b!20841) (not d!3669) (not b!20881) (not bm!1178) (not bm!1205) (not d!3675) (not b!20814) (not b!20686) (not d!3671) (not b!20844) tp_is_empty!985 b_and!1403 (not d!3659) (not bm!1215) (not b!20838))
(check-sat b_and!1403 (not b_next!721))
