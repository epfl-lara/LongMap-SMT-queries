; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3642 () Bool)

(assert start!3642)

(declare-fun b!25331 () Bool)

(declare-fun b_free!769 () Bool)

(declare-fun b_next!769 () Bool)

(assert (=> b!25331 (= b_free!769 (not b_next!769))))

(declare-fun tp!3561 () Bool)

(declare-fun b_and!1561 () Bool)

(assert (=> b!25331 (= tp!3561 b_and!1561)))

(declare-fun e!16369 () Bool)

(declare-fun tp_is_empty!1033 () Bool)

(declare-datatypes ((V!1203 0))(
  ( (V!1204 (val!543 Int)) )
))
(declare-datatypes ((ValueCell!317 0))(
  ( (ValueCellFull!317 (v!1623 V!1203)) (EmptyCell!317) )
))
(declare-datatypes ((array!1289 0))(
  ( (array!1290 (arr!608 (Array (_ BitVec 32) ValueCell!317)) (size!709 (_ BitVec 32))) )
))
(declare-datatypes ((array!1291 0))(
  ( (array!1292 (arr!609 (Array (_ BitVec 32) (_ BitVec 64))) (size!710 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!220 0))(
  ( (LongMapFixedSize!221 (defaultEntry!1768 Int) (mask!4770 (_ BitVec 32)) (extraKeys!1660 (_ BitVec 32)) (zeroValue!1687 V!1203) (minValue!1687 V!1203) (_size!158 (_ BitVec 32)) (_keys!3193 array!1291) (_values!1752 array!1289) (_vacant!158 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!220 0))(
  ( (Cell!221 (v!1624 LongMapFixedSize!220)) )
))
(declare-datatypes ((LongMap!220 0))(
  ( (LongMap!221 (underlying!121 Cell!220)) )
))
(declare-fun thiss!938 () LongMap!220)

(declare-fun e!16377 () Bool)

(declare-fun array_inv!427 (array!1291) Bool)

(declare-fun array_inv!428 (array!1289) Bool)

(assert (=> b!25331 (= e!16377 (and tp!3561 tp_is_empty!1033 (array_inv!427 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) (array_inv!428 (_values!1752 (v!1624 (underlying!121 thiss!938)))) e!16369))))

(declare-fun res!15236 () Bool)

(declare-fun e!16368 () Bool)

(assert (=> start!3642 (=> (not res!15236) (not e!16368))))

(declare-fun valid!119 (LongMap!220) Bool)

(assert (=> start!3642 (= res!15236 (valid!119 thiss!938))))

(assert (=> start!3642 e!16368))

(declare-fun e!16371 () Bool)

(assert (=> start!3642 e!16371))

(declare-datatypes ((tuple2!990 0))(
  ( (tuple2!991 (_1!503 Bool) (_2!503 LongMapFixedSize!220)) )
))
(declare-fun call!2341 () tuple2!990)

(declare-fun bm!2338 () Bool)

(declare-fun c!3524 () Bool)

(declare-fun lt!9934 () LongMapFixedSize!220)

(declare-fun c!3522 () Bool)

(declare-fun lt!9928 () tuple2!990)

(declare-fun update!40 (LongMapFixedSize!220 (_ BitVec 64) V!1203) tuple2!990)

(assert (=> bm!2338 (= call!2341 (update!40 (ite c!3522 (_2!503 lt!9928) lt!9934) (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938)))))))))

(declare-fun b!25332 () Bool)

(declare-fun c!3521 () Bool)

(declare-fun lt!9931 () Bool)

(assert (=> b!25332 (= c!3521 (and (not (= (bvand (extraKeys!1660 (v!1624 (underlying!121 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!9931))))

(declare-datatypes ((tuple2!992 0))(
  ( (tuple2!993 (_1!504 Bool) (_2!504 Cell!220)) )
))
(declare-fun e!16378 () tuple2!992)

(declare-fun e!16375 () tuple2!992)

(assert (=> b!25332 (= e!16378 e!16375)))

(declare-fun b!25333 () Bool)

(declare-datatypes ((tuple3!16 0))(
  ( (tuple3!17 (_1!505 Bool) (_2!505 Cell!220) (_3!8 LongMap!220)) )
))
(declare-fun e!16367 () tuple3!16)

(declare-fun lt!9927 () tuple2!992)

(assert (=> b!25333 (= e!16367 (tuple3!17 false (_2!504 lt!9927) thiss!938))))

(declare-fun b!25334 () Bool)

(assert (=> b!25334 (= e!16375 (tuple2!993 true (Cell!221 lt!9934)))))

(declare-fun b!25335 () Bool)

(declare-fun e!16379 () tuple2!992)

(assert (=> b!25335 (= e!16379 e!16378)))

(assert (=> b!25335 (= c!3524 (and (not lt!9931) (= (bvand (extraKeys!1660 (v!1624 (underlying!121 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!25336 () Bool)

(declare-fun e!16373 () Bool)

(declare-fun mapRes!1048 () Bool)

(assert (=> b!25336 (= e!16369 (and e!16373 mapRes!1048))))

(declare-fun condMapEmpty!1048 () Bool)

(declare-fun mapDefault!1048 () ValueCell!317)

(assert (=> b!25336 (= condMapEmpty!1048 (= (arr!608 (_values!1752 (v!1624 (underlying!121 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!317)) mapDefault!1048)))))

(declare-fun b!25337 () Bool)

(declare-fun e!16370 () Bool)

(assert (=> b!25337 (= e!16371 e!16370)))

(declare-fun lt!9935 () Cell!220)

(declare-fun b!25338 () Bool)

(declare-fun lt!9932 () tuple2!990)

(assert (=> b!25338 (= e!16367 (ite (_1!503 lt!9932) (tuple3!17 true (underlying!121 thiss!938) (LongMap!221 lt!9935)) (tuple3!17 false lt!9935 thiss!938)))))

(declare-fun repackFrom!7 (LongMap!220 LongMapFixedSize!220 (_ BitVec 32)) tuple2!990)

(assert (=> b!25338 (= lt!9932 (repackFrom!7 thiss!938 (v!1624 (_2!504 lt!9927)) (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!25338 (= lt!9935 (Cell!221 (_2!503 lt!9932)))))

(declare-fun bm!2339 () Bool)

(declare-fun call!2342 () tuple2!990)

(assert (=> bm!2339 (= call!2342 call!2341)))

(declare-fun mapIsEmpty!1048 () Bool)

(assert (=> mapIsEmpty!1048 mapRes!1048))

(declare-fun b!25339 () Bool)

(declare-fun lt!9936 () tuple2!990)

(assert (=> b!25339 (= e!16379 (tuple2!993 (and (_1!503 lt!9928) (_1!503 lt!9936)) (Cell!221 (_2!503 lt!9936))))))

(assert (=> b!25339 (= lt!9928 (update!40 lt!9934 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))))))

(assert (=> b!25339 (= lt!9936 call!2341)))

(declare-fun b!25340 () Bool)

(declare-fun lt!9930 () tuple2!990)

(assert (=> b!25340 (= e!16375 (tuple2!993 (_1!503 lt!9930) (Cell!221 (_2!503 lt!9930))))))

(assert (=> b!25340 (= lt!9930 call!2342)))

(declare-fun b!25341 () Bool)

(declare-fun e!16376 () Bool)

(assert (=> b!25341 (= e!16376 tp_is_empty!1033)))

(declare-fun mapNonEmpty!1048 () Bool)

(declare-fun tp!3562 () Bool)

(assert (=> mapNonEmpty!1048 (= mapRes!1048 (and tp!3562 e!16376))))

(declare-fun mapRest!1048 () (Array (_ BitVec 32) ValueCell!317))

(declare-fun mapValue!1048 () ValueCell!317)

(declare-fun mapKey!1048 () (_ BitVec 32))

(assert (=> mapNonEmpty!1048 (= (arr!608 (_values!1752 (v!1624 (underlying!121 thiss!938)))) (store mapRest!1048 mapKey!1048 mapValue!1048))))

(declare-fun b!25342 () Bool)

(declare-fun e!16372 () Bool)

(declare-fun lt!9929 () tuple3!16)

(declare-datatypes ((tuple2!994 0))(
  ( (tuple2!995 (_1!506 (_ BitVec 64)) (_2!506 V!1203)) )
))
(declare-datatypes ((List!569 0))(
  ( (Nil!566) (Cons!565 (h!1132 tuple2!994) (t!3247 List!569)) )
))
(declare-datatypes ((ListLongMap!569 0))(
  ( (ListLongMap!570 (toList!300 List!569)) )
))
(declare-fun map!414 (LongMap!220) ListLongMap!569)

(assert (=> b!25342 (= e!16372 (not (= (map!414 (_3!8 lt!9929)) (map!414 thiss!938))))))

(declare-fun b!25343 () Bool)

(assert (=> b!25343 (= e!16370 e!16377)))

(declare-fun b!25344 () Bool)

(assert (=> b!25344 (= e!16368 e!16372)))

(declare-fun res!15237 () Bool)

(assert (=> b!25344 (=> (not res!15237) (not e!16372))))

(assert (=> b!25344 (= res!15237 (_1!505 lt!9929))))

(assert (=> b!25344 (= lt!9929 e!16367)))

(declare-fun c!3523 () Bool)

(assert (=> b!25344 (= c!3523 (not (_1!504 lt!9927)))))

(assert (=> b!25344 (= lt!9927 e!16379)))

(assert (=> b!25344 (= c!3522 (and (not lt!9931) (not (= (bvand (extraKeys!1660 (v!1624 (underlying!121 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!25344 (= lt!9931 (= (bvand (extraKeys!1660 (v!1624 (underlying!121 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!36 ((_ BitVec 32) Int) LongMapFixedSize!220)

(declare-fun computeNewMask!33 (LongMap!220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25344 (= lt!9934 (getNewLongMapFixedSize!36 (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) (defaultEntry!1768 (v!1624 (underlying!121 thiss!938)))))))

(declare-fun b!25345 () Bool)

(declare-fun lt!9933 () tuple2!990)

(assert (=> b!25345 (= lt!9933 call!2342)))

(assert (=> b!25345 (= e!16378 (tuple2!993 (_1!503 lt!9933) (Cell!221 (_2!503 lt!9933))))))

(declare-fun b!25346 () Bool)

(assert (=> b!25346 (= e!16373 tp_is_empty!1033)))

(assert (= (and start!3642 res!15236) b!25344))

(assert (= (and b!25344 c!3522) b!25339))

(assert (= (and b!25344 (not c!3522)) b!25335))

(assert (= (and b!25335 c!3524) b!25345))

(assert (= (and b!25335 (not c!3524)) b!25332))

(assert (= (and b!25332 c!3521) b!25340))

(assert (= (and b!25332 (not c!3521)) b!25334))

(assert (= (or b!25345 b!25340) bm!2339))

(assert (= (or b!25339 bm!2339) bm!2338))

(assert (= (and b!25344 c!3523) b!25333))

(assert (= (and b!25344 (not c!3523)) b!25338))

(assert (= (and b!25344 res!15237) b!25342))

(assert (= (and b!25336 condMapEmpty!1048) mapIsEmpty!1048))

(assert (= (and b!25336 (not condMapEmpty!1048)) mapNonEmpty!1048))

(get-info :version)

(assert (= (and mapNonEmpty!1048 ((_ is ValueCellFull!317) mapValue!1048)) b!25341))

(assert (= (and b!25336 ((_ is ValueCellFull!317) mapDefault!1048)) b!25346))

(assert (= b!25331 b!25336))

(assert (= b!25343 b!25331))

(assert (= b!25337 b!25343))

(assert (= start!3642 b!25337))

(declare-fun m!20419 () Bool)

(assert (=> b!25339 m!20419))

(declare-fun m!20421 () Bool)

(assert (=> b!25342 m!20421))

(declare-fun m!20423 () Bool)

(assert (=> b!25342 m!20423))

(declare-fun m!20425 () Bool)

(assert (=> mapNonEmpty!1048 m!20425))

(declare-fun m!20427 () Bool)

(assert (=> start!3642 m!20427))

(declare-fun m!20429 () Bool)

(assert (=> b!25338 m!20429))

(declare-fun m!20431 () Bool)

(assert (=> b!25344 m!20431))

(assert (=> b!25344 m!20431))

(declare-fun m!20433 () Bool)

(assert (=> b!25344 m!20433))

(declare-fun m!20435 () Bool)

(assert (=> bm!2338 m!20435))

(declare-fun m!20437 () Bool)

(assert (=> b!25331 m!20437))

(declare-fun m!20439 () Bool)

(assert (=> b!25331 m!20439))

(check-sat b_and!1561 (not b!25331) (not bm!2338) (not mapNonEmpty!1048) (not b!25339) (not b!25338) tp_is_empty!1033 (not b!25342) (not start!3642) (not b_next!769) (not b!25344))
(check-sat b_and!1561 (not b_next!769))
(get-model)

(declare-fun b!25523 () Bool)

(declare-fun e!16501 () Bool)

(declare-datatypes ((SeekEntryResult!57 0))(
  ( (MissingZero!57 (index!2350 (_ BitVec 32))) (Found!57 (index!2351 (_ BitVec 32))) (Intermediate!57 (undefined!869 Bool) (index!2352 (_ BitVec 32)) (x!6013 (_ BitVec 32))) (Undefined!57) (MissingVacant!57 (index!2353 (_ BitVec 32))) )
))
(declare-fun lt!10070 () SeekEntryResult!57)

(assert (=> b!25523 (= e!16501 ((_ is Undefined!57) lt!10070))))

(declare-fun bm!2400 () Bool)

(declare-fun call!2424 () Bool)

(declare-fun call!2417 () Bool)

(assert (=> bm!2400 (= call!2424 call!2417)))

(declare-fun b!25524 () Bool)

(declare-fun e!16508 () Bool)

(declare-fun call!2423 () ListLongMap!569)

(declare-fun call!2403 () ListLongMap!569)

(assert (=> b!25524 (= e!16508 (= call!2423 call!2403))))

(declare-fun b!25525 () Bool)

(declare-fun c!3587 () Bool)

(declare-fun lt!10077 () SeekEntryResult!57)

(assert (=> b!25525 (= c!3587 ((_ is MissingVacant!57) lt!10077))))

(declare-fun e!16500 () tuple2!990)

(declare-fun e!16514 () tuple2!990)

(assert (=> b!25525 (= e!16500 e!16514)))

(declare-fun b!25526 () Bool)

(declare-fun res!15282 () Bool)

(declare-fun e!16518 () Bool)

(assert (=> b!25526 (=> (not res!15282) (not e!16518))))

(declare-fun call!2404 () Bool)

(assert (=> b!25526 (= res!15282 call!2404)))

(declare-fun e!16515 () Bool)

(assert (=> b!25526 (= e!16515 e!16518)))

(declare-fun d!4761 () Bool)

(declare-fun e!16504 () Bool)

(assert (=> d!4761 e!16504))

(declare-fun res!15280 () Bool)

(assert (=> d!4761 (=> (not res!15280) (not e!16504))))

(declare-fun lt!10072 () tuple2!990)

(declare-fun valid!121 (LongMapFixedSize!220) Bool)

(assert (=> d!4761 (= res!15280 (valid!121 (_2!503 lt!10072)))))

(declare-fun e!16510 () tuple2!990)

(assert (=> d!4761 (= lt!10072 e!16510)))

(declare-fun c!3579 () Bool)

(assert (=> d!4761 (= c!3579 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4761 (valid!121 lt!9934)))

(assert (=> d!4761 (= (update!40 lt!9934 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))) lt!10072)))

(declare-fun call!2411 () ListLongMap!569)

(declare-fun c!3580 () Bool)

(declare-fun bm!2401 () Bool)

(declare-fun e!16512 () ListLongMap!569)

(declare-fun +!47 (ListLongMap!569 tuple2!994) ListLongMap!569)

(assert (=> bm!2401 (= call!2411 (+!47 e!16512 (ite c!3579 (ite c!3580 (tuple2!995 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))) (tuple2!995 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))))) (tuple2!995 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))))))))

(declare-fun c!3581 () Bool)

(assert (=> bm!2401 (= c!3581 c!3579)))

(declare-fun b!25527 () Bool)

(declare-fun e!16507 () Bool)

(declare-fun lt!10051 () SeekEntryResult!57)

(assert (=> b!25527 (= e!16507 ((_ is Undefined!57) lt!10051))))

(declare-fun bm!2402 () Bool)

(assert (=> bm!2402 (= call!2404 call!2424)))

(declare-fun b!25528 () Bool)

(declare-fun lt!10054 () tuple2!990)

(assert (=> b!25528 (= e!16514 (tuple2!991 (_1!503 lt!10054) (_2!503 lt!10054)))))

(declare-fun call!2422 () tuple2!990)

(assert (=> b!25528 (= lt!10054 call!2422)))

(declare-fun bm!2403 () Bool)

(declare-fun call!2416 () Bool)

(assert (=> bm!2403 (= call!2416 call!2417)))

(declare-fun b!25529 () Bool)

(declare-fun e!16509 () Bool)

(assert (=> b!25529 (= e!16508 e!16509)))

(declare-fun res!15285 () Bool)

(declare-fun contains!234 (ListLongMap!569 (_ BitVec 64)) Bool)

(assert (=> b!25529 (= res!15285 (contains!234 call!2423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25529 (=> (not res!15285) (not e!16509))))

(declare-fun b!25530 () Bool)

(declare-fun e!16506 () tuple2!990)

(assert (=> b!25530 (= e!16514 e!16506)))

(declare-fun c!3576 () Bool)

(assert (=> b!25530 (= c!3576 ((_ is MissingZero!57) lt!10077))))

(declare-fun bm!2404 () Bool)

(declare-fun call!2425 () SeekEntryResult!57)

(declare-fun call!2418 () SeekEntryResult!57)

(assert (=> bm!2404 (= call!2425 call!2418)))

(declare-fun bm!2405 () Bool)

(declare-datatypes ((Unit!611 0))(
  ( (Unit!612) )
))
(declare-fun call!2405 () Unit!611)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 64) Int) Unit!611)

(assert (=> bm!2405 (= call!2405 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!12 (_keys!3193 lt!9934) (_values!1752 lt!9934) (mask!4770 lt!9934) (extraKeys!1660 lt!9934) (zeroValue!1687 lt!9934) (minValue!1687 lt!9934) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1768 lt!9934)))))

(declare-fun b!25531 () Bool)

(declare-fun res!15290 () Bool)

(assert (=> b!25531 (= res!15290 call!2424)))

(declare-fun e!16513 () Bool)

(assert (=> b!25531 (=> (not res!15290) (not e!16513))))

(declare-fun b!25532 () Bool)

(declare-fun c!3582 () Bool)

(assert (=> b!25532 (= c!3582 ((_ is MissingVacant!57) lt!10070))))

(assert (=> b!25532 (= e!16515 e!16501)))

(declare-fun bm!2406 () Bool)

(declare-fun call!2415 () Bool)

(declare-fun call!2419 () Bool)

(assert (=> bm!2406 (= call!2415 call!2419)))

(declare-fun lt!10068 () (_ BitVec 32))

(declare-fun lt!10058 () (_ BitVec 32))

(declare-fun bm!2407 () Bool)

(declare-fun call!2406 () ListLongMap!569)

(declare-fun getCurrentListMap!131 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 32) Int) ListLongMap!569)

(assert (=> bm!2407 (= call!2406 (getCurrentListMap!131 (_keys!3193 lt!9934) (ite c!3579 (_values!1752 lt!9934) (array!1290 (store (arr!608 (_values!1752 lt!9934)) (index!2351 lt!10077) (ValueCellFull!317 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))))) (size!709 (_values!1752 lt!9934)))) (mask!4770 lt!9934) (ite c!3579 (ite c!3580 lt!10068 lt!10058) (extraKeys!1660 lt!9934)) (ite (and c!3579 c!3580) (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (zeroValue!1687 lt!9934)) (ite c!3579 (ite c!3580 (minValue!1687 lt!9934) (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))) (minValue!1687 lt!9934)) #b00000000000000000000000000000000 (defaultEntry!1768 lt!9934)))))

(declare-fun b!25533 () Bool)

(declare-fun lt!10069 () Unit!611)

(declare-fun lt!10063 () Unit!611)

(assert (=> b!25533 (= lt!10069 lt!10063)))

(declare-fun call!2414 () ListLongMap!569)

(declare-fun call!2407 () ListLongMap!569)

(assert (=> b!25533 (= call!2414 call!2407)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 V!1203 Int) Unit!611)

(assert (=> b!25533 (= lt!10063 (lemmaChangeLongMinValueKeyThenAddPairToListMap!12 (_keys!3193 lt!9934) (_values!1752 lt!9934) (mask!4770 lt!9934) (extraKeys!1660 lt!9934) lt!10058 (zeroValue!1687 lt!9934) (minValue!1687 lt!9934) (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (defaultEntry!1768 lt!9934)))))

(assert (=> b!25533 (= lt!10058 (bvor (extraKeys!1660 lt!9934) #b00000000000000000000000000000010))))

(declare-fun e!16505 () tuple2!990)

(assert (=> b!25533 (= e!16505 (tuple2!991 true (LongMapFixedSize!221 (defaultEntry!1768 lt!9934) (mask!4770 lt!9934) (bvor (extraKeys!1660 lt!9934) #b00000000000000000000000000000010) (zeroValue!1687 lt!9934) (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (_size!158 lt!9934) (_keys!3193 lt!9934) (_values!1752 lt!9934) (_vacant!158 lt!9934))))))

(declare-fun b!25534 () Bool)

(declare-fun e!16502 () Unit!611)

(declare-fun lt!10076 () Unit!611)

(assert (=> b!25534 (= e!16502 lt!10076)))

(declare-fun call!2409 () Unit!611)

(assert (=> b!25534 (= lt!10076 call!2409)))

(declare-fun lt!10057 () SeekEntryResult!57)

(declare-fun call!2408 () SeekEntryResult!57)

(assert (=> b!25534 (= lt!10057 call!2408)))

(declare-fun res!15288 () Bool)

(assert (=> b!25534 (= res!15288 ((_ is Found!57) lt!10057))))

(declare-fun e!16520 () Bool)

(assert (=> b!25534 (=> (not res!15288) (not e!16520))))

(assert (=> b!25534 e!16520))

(declare-fun b!25535 () Bool)

(declare-fun lt!10075 () Unit!611)

(declare-fun lt!10053 () Unit!611)

(assert (=> b!25535 (= lt!10075 lt!10053)))

(assert (=> b!25535 (= call!2414 call!2407)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 V!1203 Int) Unit!611)

(assert (=> b!25535 (= lt!10053 (lemmaChangeZeroKeyThenAddPairToListMap!12 (_keys!3193 lt!9934) (_values!1752 lt!9934) (mask!4770 lt!9934) (extraKeys!1660 lt!9934) lt!10068 (zeroValue!1687 lt!9934) (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 lt!9934) (defaultEntry!1768 lt!9934)))))

(assert (=> b!25535 (= lt!10068 (bvor (extraKeys!1660 lt!9934) #b00000000000000000000000000000001))))

(assert (=> b!25535 (= e!16505 (tuple2!991 true (LongMapFixedSize!221 (defaultEntry!1768 lt!9934) (mask!4770 lt!9934) (bvor (extraKeys!1660 lt!9934) #b00000000000000000000000000000001) (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 lt!9934) (_size!158 lt!9934) (_keys!3193 lt!9934) (_values!1752 lt!9934) (_vacant!158 lt!9934))))))

(declare-fun bm!2408 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 64) Int) Unit!611)

(assert (=> bm!2408 (= call!2409 (lemmaInListMapThenSeekEntryOrOpenFindsIt!12 (_keys!3193 lt!9934) (_values!1752 lt!9934) (mask!4770 lt!9934) (extraKeys!1660 lt!9934) (zeroValue!1687 lt!9934) (minValue!1687 lt!9934) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1768 lt!9934)))))

(declare-fun c!3585 () Bool)

(declare-fun lt!10056 () array!1289)

(declare-fun call!2426 () ListLongMap!569)

(declare-fun bm!2409 () Bool)

(assert (=> bm!2409 (= call!2426 (getCurrentListMap!131 (_keys!3193 lt!9934) (ite (or c!3579 c!3585) (_values!1752 lt!9934) lt!10056) (mask!4770 lt!9934) (extraKeys!1660 lt!9934) (zeroValue!1687 lt!9934) (minValue!1687 lt!9934) #b00000000000000000000000000000000 (defaultEntry!1768 lt!9934)))))

(declare-fun b!25536 () Bool)

(declare-fun res!15291 () Bool)

(assert (=> b!25536 (= res!15291 call!2416)))

(assert (=> b!25536 (=> (not res!15291) (not e!16520))))

(declare-fun b!25537 () Bool)

(declare-fun e!16503 () Bool)

(assert (=> b!25537 (= e!16501 e!16503)))

(declare-fun res!15286 () Bool)

(assert (=> b!25537 (= res!15286 call!2404)))

(assert (=> b!25537 (=> (not res!15286) (not e!16503))))

(declare-fun bm!2410 () Bool)

(declare-fun call!2421 () ListLongMap!569)

(assert (=> bm!2410 (= call!2421 call!2426)))

(declare-fun bm!2411 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1291 (_ BitVec 32)) SeekEntryResult!57)

(assert (=> bm!2411 (= call!2418 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3193 lt!9934) (mask!4770 lt!9934)))))

(declare-fun b!25538 () Bool)

(declare-fun call!2410 () Bool)

(assert (=> b!25538 (= e!16503 (not call!2410))))

(declare-fun bm!2412 () Bool)

(declare-fun call!2413 () ListLongMap!569)

(assert (=> bm!2412 (= call!2413 call!2426)))

(declare-fun bm!2413 () Bool)

(declare-fun arrayContainsKey!0 (array!1291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!2413 (= call!2419 (arrayContainsKey!0 (_keys!3193 lt!9934) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!25539 () Bool)

(assert (=> b!25539 (= e!16512 (getCurrentListMap!131 (_keys!3193 lt!9934) (_values!1752 lt!9934) (mask!4770 lt!9934) (extraKeys!1660 lt!9934) (zeroValue!1687 lt!9934) (minValue!1687 lt!9934) #b00000000000000000000000000000000 (defaultEntry!1768 lt!9934)))))

(declare-fun bm!2414 () Bool)

(assert (=> bm!2414 (= call!2410 call!2419)))

(declare-fun b!25540 () Bool)

(declare-fun c!3586 () Bool)

(assert (=> b!25540 (= c!3586 ((_ is MissingVacant!57) lt!10051))))

(declare-fun e!16517 () Bool)

(assert (=> b!25540 (= e!16517 e!16507)))

(declare-fun b!25541 () Bool)

(assert (=> b!25541 (= e!16510 e!16505)))

(assert (=> b!25541 (= c!3580 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25542 () Bool)

(declare-fun Unit!613 () Unit!611)

(assert (=> b!25542 (= e!16502 Unit!613)))

(declare-fun lt!10055 () Unit!611)

(assert (=> b!25542 (= lt!10055 call!2405)))

(assert (=> b!25542 (= lt!10051 call!2408)))

(declare-fun c!3575 () Bool)

(assert (=> b!25542 (= c!3575 ((_ is MissingZero!57) lt!10051))))

(assert (=> b!25542 e!16517))

(declare-fun lt!10066 () Unit!611)

(assert (=> b!25542 (= lt!10066 lt!10055)))

(assert (=> b!25542 false))

(declare-fun b!25543 () Bool)

(assert (=> b!25543 (= e!16509 (= call!2423 (+!47 call!2403 (tuple2!995 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))))))))

(declare-fun b!25544 () Bool)

(declare-fun e!16519 () Unit!611)

(declare-fun Unit!614 () Unit!611)

(assert (=> b!25544 (= e!16519 Unit!614)))

(declare-fun lt!10060 () Unit!611)

(assert (=> b!25544 (= lt!10060 call!2409)))

(declare-fun lt!10059 () SeekEntryResult!57)

(assert (=> b!25544 (= lt!10059 call!2425)))

(declare-fun res!15283 () Bool)

(assert (=> b!25544 (= res!15283 ((_ is Found!57) lt!10059))))

(assert (=> b!25544 (=> (not res!15283) (not e!16513))))

(assert (=> b!25544 e!16513))

(declare-fun lt!10074 () Unit!611)

(assert (=> b!25544 (= lt!10074 lt!10060)))

(assert (=> b!25544 false))

(declare-fun b!25545 () Bool)

(assert (=> b!25545 (= e!16512 call!2421)))

(declare-fun bm!2415 () Bool)

(declare-fun map!416 (LongMapFixedSize!220) ListLongMap!569)

(assert (=> bm!2415 (= call!2423 (map!416 (_2!503 lt!10072)))))

(declare-fun b!25546 () Bool)

(declare-fun res!15279 () Bool)

(assert (=> b!25546 (=> (not res!15279) (not e!16518))))

(assert (=> b!25546 (= res!15279 (= (select (arr!609 (_keys!3193 lt!9934)) (index!2350 lt!10070)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25547 () Bool)

(assert (=> b!25547 (= e!16520 (= (select (arr!609 (_keys!3193 lt!9934)) (index!2351 lt!10057)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2416 () Bool)

(assert (=> bm!2416 (= call!2403 (map!416 lt!9934))))

(declare-fun b!25548 () Bool)

(assert (=> b!25548 (= e!16513 (= (select (arr!609 (_keys!3193 lt!9934)) (index!2351 lt!10059)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25549 () Bool)

(declare-fun res!15284 () Bool)

(assert (=> b!25549 (= res!15284 (= (select (arr!609 (_keys!3193 lt!9934)) (index!2353 lt!10051)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16516 () Bool)

(assert (=> b!25549 (=> (not res!15284) (not e!16516))))

(declare-fun b!25550 () Bool)

(declare-fun lt!10062 () Unit!611)

(assert (=> b!25550 (= lt!10062 e!16519)))

(declare-fun c!3584 () Bool)

(declare-fun call!2420 () Bool)

(assert (=> b!25550 (= c!3584 call!2420)))

(assert (=> b!25550 (= e!16500 (tuple2!991 false lt!9934))))

(declare-fun b!25551 () Bool)

(declare-fun e!16511 () Bool)

(assert (=> b!25551 (= e!16511 (not call!2415))))

(declare-fun c!3583 () Bool)

(declare-fun bm!2417 () Bool)

(declare-fun c!3578 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2417 (= call!2417 (inRange!0 (ite c!3585 (ite c!3584 (index!2351 lt!10059) (ite c!3583 (index!2350 lt!10070) (index!2353 lt!10070))) (ite c!3578 (index!2351 lt!10057) (ite c!3575 (index!2350 lt!10051) (index!2353 lt!10051)))) (mask!4770 lt!9934)))))

(declare-fun b!25552 () Bool)

(assert (=> b!25552 (= e!16516 (not call!2415))))

(declare-fun bm!2418 () Bool)

(assert (=> bm!2418 (= call!2407 call!2406)))

(declare-fun b!25553 () Bool)

(declare-fun lt!10067 () Unit!611)

(assert (=> b!25553 (= e!16519 lt!10067)))

(assert (=> b!25553 (= lt!10067 call!2405)))

(assert (=> b!25553 (= lt!10070 call!2425)))

(assert (=> b!25553 (= c!3583 ((_ is MissingZero!57) lt!10070))))

(assert (=> b!25553 e!16515))

(declare-fun b!25554 () Bool)

(assert (=> b!25554 (= e!16510 e!16500)))

(assert (=> b!25554 (= lt!10077 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3193 lt!9934) (mask!4770 lt!9934)))))

(assert (=> b!25554 (= c!3585 ((_ is Undefined!57) lt!10077))))

(declare-fun b!25555 () Bool)

(declare-fun res!15278 () Bool)

(assert (=> b!25555 (=> (not res!15278) (not e!16511))))

(declare-fun call!2412 () Bool)

(assert (=> b!25555 (= res!15278 call!2412)))

(assert (=> b!25555 (= e!16517 e!16511)))

(declare-fun b!25556 () Bool)

(declare-fun lt!10073 () Unit!611)

(declare-fun lt!10065 () Unit!611)

(assert (=> b!25556 (= lt!10073 lt!10065)))

(assert (=> b!25556 call!2420))

(declare-fun lemmaValidKeyInArrayIsInListMap!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 32) Int) Unit!611)

(assert (=> b!25556 (= lt!10065 (lemmaValidKeyInArrayIsInListMap!12 (_keys!3193 lt!9934) lt!10056 (mask!4770 lt!9934) (extraKeys!1660 lt!9934) (zeroValue!1687 lt!9934) (minValue!1687 lt!9934) (index!2351 lt!10077) (defaultEntry!1768 lt!9934)))))

(assert (=> b!25556 (= lt!10056 (array!1290 (store (arr!608 (_values!1752 lt!9934)) (index!2351 lt!10077) (ValueCellFull!317 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))))) (size!709 (_values!1752 lt!9934))))))

(declare-fun lt!10061 () Unit!611)

(declare-fun lt!10052 () Unit!611)

(assert (=> b!25556 (= lt!10061 lt!10052)))

(assert (=> b!25556 (= call!2411 call!2406)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!12 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 32) (_ BitVec 64) V!1203 Int) Unit!611)

(assert (=> b!25556 (= lt!10052 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!12 (_keys!3193 lt!9934) (_values!1752 lt!9934) (mask!4770 lt!9934) (extraKeys!1660 lt!9934) (zeroValue!1687 lt!9934) (minValue!1687 lt!9934) (index!2351 lt!10077) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (defaultEntry!1768 lt!9934)))))

(declare-fun lt!10064 () Unit!611)

(assert (=> b!25556 (= lt!10064 e!16502)))

(assert (=> b!25556 (= c!3578 (contains!234 (getCurrentListMap!131 (_keys!3193 lt!9934) (_values!1752 lt!9934) (mask!4770 lt!9934) (extraKeys!1660 lt!9934) (zeroValue!1687 lt!9934) (minValue!1687 lt!9934) #b00000000000000000000000000000000 (defaultEntry!1768 lt!9934)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25556 (= e!16506 (tuple2!991 true (LongMapFixedSize!221 (defaultEntry!1768 lt!9934) (mask!4770 lt!9934) (extraKeys!1660 lt!9934) (zeroValue!1687 lt!9934) (minValue!1687 lt!9934) (_size!158 lt!9934) (_keys!3193 lt!9934) (array!1290 (store (arr!608 (_values!1752 lt!9934)) (index!2351 lt!10077) (ValueCellFull!317 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))))) (size!709 (_values!1752 lt!9934))) (_vacant!158 lt!9934))))))

(declare-fun bm!2419 () Bool)

(assert (=> bm!2419 (= call!2414 call!2411)))

(declare-fun bm!2420 () Bool)

(declare-fun updateHelperNewKey!12 (LongMapFixedSize!220 (_ BitVec 64) V!1203 (_ BitVec 32)) tuple2!990)

(assert (=> bm!2420 (= call!2422 (updateHelperNewKey!12 lt!9934 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3587 (index!2353 lt!10077) (index!2350 lt!10077))))))

(declare-fun b!25557 () Bool)

(declare-fun lt!10071 () tuple2!990)

(assert (=> b!25557 (= lt!10071 call!2422)))

(assert (=> b!25557 (= e!16506 (tuple2!991 (_1!503 lt!10071) (_2!503 lt!10071)))))

(declare-fun b!25558 () Bool)

(assert (=> b!25558 (= e!16518 (not call!2410))))

(declare-fun b!25559 () Bool)

(assert (=> b!25559 (= e!16504 e!16508)))

(declare-fun c!3577 () Bool)

(assert (=> b!25559 (= c!3577 (_1!503 lt!10072))))

(declare-fun bm!2421 () Bool)

(assert (=> bm!2421 (= call!2420 (contains!234 call!2413 (ite c!3585 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!609 (_keys!3193 lt!9934)) (index!2351 lt!10077)))))))

(declare-fun bm!2422 () Bool)

(assert (=> bm!2422 (= call!2412 call!2416)))

(declare-fun b!25560 () Bool)

(assert (=> b!25560 (= e!16507 e!16516)))

(declare-fun res!15289 () Bool)

(assert (=> b!25560 (= res!15289 call!2412)))

(assert (=> b!25560 (=> (not res!15289) (not e!16516))))

(declare-fun b!25561 () Bool)

(declare-fun res!15281 () Bool)

(assert (=> b!25561 (=> (not res!15281) (not e!16511))))

(assert (=> b!25561 (= res!15281 (= (select (arr!609 (_keys!3193 lt!9934)) (index!2350 lt!10051)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2423 () Bool)

(assert (=> bm!2423 (= call!2408 call!2418)))

(declare-fun b!25562 () Bool)

(declare-fun res!15287 () Bool)

(assert (=> b!25562 (= res!15287 (= (select (arr!609 (_keys!3193 lt!9934)) (index!2353 lt!10070)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25562 (=> (not res!15287) (not e!16503))))

(assert (= (and d!4761 c!3579) b!25541))

(assert (= (and d!4761 (not c!3579)) b!25554))

(assert (= (and b!25541 c!3580) b!25535))

(assert (= (and b!25541 (not c!3580)) b!25533))

(assert (= (or b!25535 b!25533) bm!2418))

(assert (= (or b!25535 b!25533) bm!2410))

(assert (= (or b!25535 b!25533) bm!2419))

(assert (= (and b!25554 c!3585) b!25550))

(assert (= (and b!25554 (not c!3585)) b!25525))

(assert (= (and b!25550 c!3584) b!25544))

(assert (= (and b!25550 (not c!3584)) b!25553))

(assert (= (and b!25544 res!15283) b!25531))

(assert (= (and b!25531 res!15290) b!25548))

(assert (= (and b!25553 c!3583) b!25526))

(assert (= (and b!25553 (not c!3583)) b!25532))

(assert (= (and b!25526 res!15282) b!25546))

(assert (= (and b!25546 res!15279) b!25558))

(assert (= (and b!25532 c!3582) b!25537))

(assert (= (and b!25532 (not c!3582)) b!25523))

(assert (= (and b!25537 res!15286) b!25562))

(assert (= (and b!25562 res!15287) b!25538))

(assert (= (or b!25526 b!25537) bm!2402))

(assert (= (or b!25558 b!25538) bm!2414))

(assert (= (or b!25531 bm!2402) bm!2400))

(assert (= (or b!25544 b!25553) bm!2404))

(assert (= (and b!25525 c!3587) b!25528))

(assert (= (and b!25525 (not c!3587)) b!25530))

(assert (= (and b!25530 c!3576) b!25557))

(assert (= (and b!25530 (not c!3576)) b!25556))

(assert (= (and b!25556 c!3578) b!25534))

(assert (= (and b!25556 (not c!3578)) b!25542))

(assert (= (and b!25534 res!15288) b!25536))

(assert (= (and b!25536 res!15291) b!25547))

(assert (= (and b!25542 c!3575) b!25555))

(assert (= (and b!25542 (not c!3575)) b!25540))

(assert (= (and b!25555 res!15278) b!25561))

(assert (= (and b!25561 res!15281) b!25551))

(assert (= (and b!25540 c!3586) b!25560))

(assert (= (and b!25540 (not c!3586)) b!25527))

(assert (= (and b!25560 res!15289) b!25549))

(assert (= (and b!25549 res!15284) b!25552))

(assert (= (or b!25555 b!25560) bm!2422))

(assert (= (or b!25551 b!25552) bm!2406))

(assert (= (or b!25536 bm!2422) bm!2403))

(assert (= (or b!25534 b!25542) bm!2423))

(assert (= (or b!25528 b!25557) bm!2420))

(assert (= (or bm!2404 bm!2423) bm!2411))

(assert (= (or b!25550 b!25556) bm!2412))

(assert (= (or b!25544 b!25534) bm!2408))

(assert (= (or b!25553 b!25542) bm!2405))

(assert (= (or bm!2414 bm!2406) bm!2413))

(assert (= (or bm!2400 bm!2403) bm!2417))

(assert (= (or b!25550 b!25556) bm!2421))

(assert (= (or bm!2410 bm!2412) bm!2409))

(assert (= (or bm!2418 b!25556) bm!2407))

(assert (= (or bm!2419 b!25556) bm!2401))

(assert (= (and bm!2401 c!3581) b!25545))

(assert (= (and bm!2401 (not c!3581)) b!25539))

(assert (= (and d!4761 res!15280) b!25559))

(assert (= (and b!25559 c!3577) b!25529))

(assert (= (and b!25559 (not c!3577)) b!25524))

(assert (= (and b!25529 res!15285) b!25543))

(assert (= (or b!25529 b!25543 b!25524) bm!2415))

(assert (= (or b!25543 b!25524) bm!2416))

(declare-fun m!20485 () Bool)

(assert (=> bm!2409 m!20485))

(declare-fun m!20487 () Bool)

(assert (=> bm!2413 m!20487))

(declare-fun m!20489 () Bool)

(assert (=> b!25535 m!20489))

(declare-fun m!20491 () Bool)

(assert (=> b!25562 m!20491))

(declare-fun m!20493 () Bool)

(assert (=> b!25549 m!20493))

(declare-fun m!20495 () Bool)

(assert (=> b!25543 m!20495))

(declare-fun m!20497 () Bool)

(assert (=> d!4761 m!20497))

(declare-fun m!20499 () Bool)

(assert (=> d!4761 m!20499))

(declare-fun m!20501 () Bool)

(assert (=> b!25533 m!20501))

(declare-fun m!20503 () Bool)

(assert (=> b!25529 m!20503))

(declare-fun m!20505 () Bool)

(assert (=> bm!2417 m!20505))

(declare-fun m!20507 () Bool)

(assert (=> b!25546 m!20507))

(declare-fun m!20509 () Bool)

(assert (=> bm!2407 m!20509))

(declare-fun m!20511 () Bool)

(assert (=> bm!2407 m!20511))

(declare-fun m!20513 () Bool)

(assert (=> bm!2416 m!20513))

(declare-fun m!20515 () Bool)

(assert (=> bm!2420 m!20515))

(declare-fun m!20517 () Bool)

(assert (=> bm!2415 m!20517))

(declare-fun m!20519 () Bool)

(assert (=> b!25554 m!20519))

(declare-fun m!20521 () Bool)

(assert (=> bm!2408 m!20521))

(declare-fun m!20523 () Bool)

(assert (=> bm!2405 m!20523))

(declare-fun m!20525 () Bool)

(assert (=> b!25561 m!20525))

(assert (=> bm!2411 m!20519))

(declare-fun m!20527 () Bool)

(assert (=> bm!2401 m!20527))

(assert (=> b!25556 m!20509))

(declare-fun m!20529 () Bool)

(assert (=> b!25556 m!20529))

(declare-fun m!20531 () Bool)

(assert (=> b!25556 m!20531))

(declare-fun m!20533 () Bool)

(assert (=> b!25556 m!20533))

(declare-fun m!20535 () Bool)

(assert (=> b!25556 m!20535))

(assert (=> b!25556 m!20531))

(declare-fun m!20537 () Bool)

(assert (=> b!25547 m!20537))

(declare-fun m!20539 () Bool)

(assert (=> b!25548 m!20539))

(declare-fun m!20541 () Bool)

(assert (=> bm!2421 m!20541))

(declare-fun m!20543 () Bool)

(assert (=> bm!2421 m!20543))

(assert (=> b!25539 m!20531))

(assert (=> b!25339 d!4761))

(declare-fun d!4763 () Bool)

(assert (=> d!4763 (= (array_inv!427 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) (bvsge (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!25331 d!4763))

(declare-fun d!4765 () Bool)

(assert (=> d!4765 (= (array_inv!428 (_values!1752 (v!1624 (underlying!121 thiss!938)))) (bvsge (size!709 (_values!1752 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!25331 d!4765))

(declare-fun d!4767 () Bool)

(assert (=> d!4767 (= (valid!119 thiss!938) (valid!121 (v!1624 (underlying!121 thiss!938))))))

(declare-fun bs!1052 () Bool)

(assert (= bs!1052 d!4767))

(declare-fun m!20545 () Bool)

(assert (=> bs!1052 m!20545))

(assert (=> start!3642 d!4767))

(declare-fun d!4769 () Bool)

(declare-fun e!16529 () Bool)

(assert (=> d!4769 e!16529))

(declare-fun res!15297 () Bool)

(assert (=> d!4769 (=> (not res!15297) (not e!16529))))

(declare-fun lt!10144 () LongMapFixedSize!220)

(assert (=> d!4769 (= res!15297 (valid!121 lt!10144))))

(declare-fun lt!10128 () LongMapFixedSize!220)

(assert (=> d!4769 (= lt!10144 lt!10128)))

(declare-fun lt!10124 () Unit!611)

(declare-fun e!16527 () Unit!611)

(assert (=> d!4769 (= lt!10124 e!16527)))

(declare-fun c!3593 () Bool)

(assert (=> d!4769 (= c!3593 (not (= (map!416 lt!10128) (ListLongMap!570 Nil!566))))))

(declare-fun lt!10129 () Unit!611)

(declare-fun lt!10126 () Unit!611)

(assert (=> d!4769 (= lt!10129 lt!10126)))

(declare-fun lt!10136 () array!1291)

(declare-fun lt!10139 () (_ BitVec 32))

(declare-datatypes ((List!571 0))(
  ( (Nil!568) (Cons!567 (h!1134 (_ BitVec 64)) (t!3251 List!571)) )
))
(declare-fun lt!10145 () List!571)

(declare-fun arrayNoDuplicates!0 (array!1291 (_ BitVec 32) List!571) Bool)

(assert (=> d!4769 (arrayNoDuplicates!0 lt!10136 lt!10139 lt!10145)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1291 (_ BitVec 32) (_ BitVec 32) List!571) Unit!611)

(assert (=> d!4769 (= lt!10126 (lemmaArrayNoDuplicatesInAll0Array!0 lt!10136 lt!10139 (bvadd (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) lt!10145))))

(assert (=> d!4769 (= lt!10145 Nil!568)))

(assert (=> d!4769 (= lt!10139 #b00000000000000000000000000000000)))

(assert (=> d!4769 (= lt!10136 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10140 () Unit!611)

(declare-fun lt!10142 () Unit!611)

(assert (=> d!4769 (= lt!10140 lt!10142)))

(declare-fun lt!10131 () (_ BitVec 32))

(declare-fun lt!10138 () array!1291)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1291 (_ BitVec 32)) Bool)

(assert (=> d!4769 (arrayForallSeekEntryOrOpenFound!0 lt!10131 lt!10138 (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1291 (_ BitVec 32) (_ BitVec 32)) Unit!611)

(assert (=> d!4769 (= lt!10142 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!10138 (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) lt!10131))))

(assert (=> d!4769 (= lt!10131 #b00000000000000000000000000000000)))

(assert (=> d!4769 (= lt!10138 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10141 () Unit!611)

(declare-fun lt!10146 () Unit!611)

(assert (=> d!4769 (= lt!10141 lt!10146)))

(declare-fun lt!10143 () array!1291)

(declare-fun lt!10137 () (_ BitVec 32))

(declare-fun lt!10134 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1291 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!4769 (= (arrayCountValidKeys!0 lt!10143 lt!10137 lt!10134) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1291 (_ BitVec 32) (_ BitVec 32)) Unit!611)

(assert (=> d!4769 (= lt!10146 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!10143 lt!10137 lt!10134))))

(assert (=> d!4769 (= lt!10134 (bvadd (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!4769 (= lt!10137 #b00000000000000000000000000000000)))

(assert (=> d!4769 (= lt!10143 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!145 (Int (_ BitVec 64)) V!1203)

(assert (=> d!4769 (= lt!10128 (LongMapFixedSize!221 (defaultEntry!1768 (v!1624 (underlying!121 thiss!938))) (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!145 (defaultEntry!1768 (v!1624 (underlying!121 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!145 (defaultEntry!1768 (v!1624 (underlying!121 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) (array!1290 ((as const (Array (_ BitVec 32) ValueCell!317)) EmptyCell!317) (bvadd (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!4769 (validMask!0 (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))))))

(assert (=> d!4769 (= (getNewLongMapFixedSize!36 (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) (defaultEntry!1768 (v!1624 (underlying!121 thiss!938)))) lt!10144)))

(declare-fun b!25575 () Bool)

(assert (=> b!25575 (= e!16529 (= (map!416 lt!10144) (ListLongMap!570 Nil!566)))))

(declare-fun b!25576 () Bool)

(declare-fun Unit!615 () Unit!611)

(assert (=> b!25576 (= e!16527 Unit!615)))

(declare-fun lt!10135 () tuple2!994)

(declare-fun head!832 (List!569) tuple2!994)

(assert (=> b!25576 (= lt!10135 (head!832 (toList!300 (map!416 lt!10128))))))

(declare-fun lt!10125 () array!1291)

(assert (=> b!25576 (= lt!10125 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10132 () (_ BitVec 32))

(assert (=> b!25576 (= lt!10132 #b00000000000000000000000000000000)))

(declare-fun lt!10130 () Unit!611)

(declare-fun lemmaKeyInListMapIsInArray!99 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 64) Int) Unit!611)

(assert (=> b!25576 (= lt!10130 (lemmaKeyInListMapIsInArray!99 lt!10125 (array!1290 ((as const (Array (_ BitVec 32) ValueCell!317)) EmptyCell!317) (bvadd (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) lt!10132 (dynLambda!145 (defaultEntry!1768 (v!1624 (underlying!121 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!145 (defaultEntry!1768 (v!1624 (underlying!121 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!506 lt!10135) (defaultEntry!1768 (v!1624 (underlying!121 thiss!938)))))))

(declare-fun c!3592 () Bool)

(assert (=> b!25576 (= c!3592 (and (not (= (_1!506 lt!10135) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!506 lt!10135) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!16528 () Bool)

(assert (=> b!25576 e!16528))

(declare-fun lt!10133 () Unit!611)

(assert (=> b!25576 (= lt!10133 lt!10130)))

(declare-fun lt!10127 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1291 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25576 (= lt!10127 (arrayScanForKey!0 (array!1292 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) (_1!506 lt!10135) #b00000000000000000000000000000000))))

(assert (=> b!25576 false))

(declare-fun b!25577 () Bool)

(assert (=> b!25577 (= e!16528 (ite (= (_1!506 lt!10135) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!10132 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!10132 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!25578 () Bool)

(declare-fun res!15296 () Bool)

(assert (=> b!25578 (=> (not res!15296) (not e!16529))))

(assert (=> b!25578 (= res!15296 (= (mask!4770 lt!10144) (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938))))))))

(declare-fun b!25579 () Bool)

(assert (=> b!25579 (= e!16528 (arrayContainsKey!0 lt!10125 (_1!506 lt!10135) #b00000000000000000000000000000000))))

(declare-fun b!25580 () Bool)

(declare-fun Unit!616 () Unit!611)

(assert (=> b!25580 (= e!16527 Unit!616)))

(assert (= (and d!4769 c!3593) b!25576))

(assert (= (and d!4769 (not c!3593)) b!25580))

(assert (= (and b!25576 c!3592) b!25579))

(assert (= (and b!25576 (not c!3592)) b!25577))

(assert (= (and d!4769 res!15297) b!25578))

(assert (= (and b!25578 res!15296) b!25575))

(declare-fun b_lambda!1659 () Bool)

(assert (=> (not b_lambda!1659) (not d!4769)))

(declare-fun t!3250 () Bool)

(declare-fun tb!667 () Bool)

(assert (=> (and b!25331 (= (defaultEntry!1768 (v!1624 (underlying!121 thiss!938))) (defaultEntry!1768 (v!1624 (underlying!121 thiss!938)))) t!3250) tb!667))

(declare-fun result!1111 () Bool)

(assert (=> tb!667 (= result!1111 tp_is_empty!1033)))

(assert (=> d!4769 t!3250))

(declare-fun b_and!1567 () Bool)

(assert (= b_and!1561 (and (=> t!3250 result!1111) b_and!1567)))

(declare-fun b_lambda!1661 () Bool)

(assert (=> (not b_lambda!1661) (not b!25576)))

(assert (=> b!25576 t!3250))

(declare-fun b_and!1569 () Bool)

(assert (= b_and!1567 (and (=> t!3250 result!1111) b_and!1569)))

(declare-fun m!20547 () Bool)

(assert (=> d!4769 m!20547))

(declare-fun m!20549 () Bool)

(assert (=> d!4769 m!20549))

(declare-fun m!20551 () Bool)

(assert (=> d!4769 m!20551))

(assert (=> d!4769 m!20431))

(declare-fun m!20553 () Bool)

(assert (=> d!4769 m!20553))

(declare-fun m!20555 () Bool)

(assert (=> d!4769 m!20555))

(declare-fun m!20557 () Bool)

(assert (=> d!4769 m!20557))

(assert (=> d!4769 m!20431))

(declare-fun m!20559 () Bool)

(assert (=> d!4769 m!20559))

(declare-fun m!20561 () Bool)

(assert (=> d!4769 m!20561))

(assert (=> d!4769 m!20431))

(declare-fun m!20563 () Bool)

(assert (=> d!4769 m!20563))

(declare-fun m!20565 () Bool)

(assert (=> d!4769 m!20565))

(declare-fun m!20567 () Bool)

(assert (=> b!25575 m!20567))

(assert (=> b!25576 m!20431))

(assert (=> b!25576 m!20557))

(assert (=> b!25576 m!20557))

(declare-fun m!20569 () Bool)

(assert (=> b!25576 m!20569))

(declare-fun m!20571 () Bool)

(assert (=> b!25576 m!20571))

(declare-fun m!20573 () Bool)

(assert (=> b!25576 m!20573))

(assert (=> b!25576 m!20551))

(assert (=> b!25576 m!20557))

(declare-fun m!20575 () Bool)

(assert (=> b!25579 m!20575))

(assert (=> b!25344 d!4769))

(declare-fun d!4771 () Bool)

(declare-fun e!16535 () Bool)

(assert (=> d!4771 e!16535))

(declare-fun res!15300 () Bool)

(assert (=> d!4771 (=> (not res!15300) (not e!16535))))

(declare-fun lt!10151 () (_ BitVec 32))

(assert (=> d!4771 (= res!15300 (validMask!0 lt!10151))))

(declare-datatypes ((tuple2!1006 0))(
  ( (tuple2!1007 (_1!514 Unit!611) (_2!514 (_ BitVec 32))) )
))
(declare-fun e!16534 () tuple2!1006)

(assert (=> d!4771 (= lt!10151 (_2!514 e!16534))))

(declare-fun c!3596 () Bool)

(declare-fun lt!10152 () tuple2!1006)

(assert (=> d!4771 (= c!3596 (and (bvsgt (_2!514 lt!10152) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!158 (v!1624 (underlying!121 thiss!938)))) (_2!514 lt!10152)) (bvsge (bvadd (bvand (bvashr (_2!514 lt!10152) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!158 (v!1624 (underlying!121 thiss!938))))))))

(declare-fun Unit!617 () Unit!611)

(declare-fun Unit!618 () Unit!611)

(assert (=> d!4771 (= lt!10152 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!158 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))))) (mask!4770 (v!1624 (underlying!121 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!158 (v!1624 (underlying!121 thiss!938)))) (mask!4770 (v!1624 (underlying!121 thiss!938))))) (tuple2!1007 Unit!617 (bvand (bvadd (bvshl (mask!4770 (v!1624 (underlying!121 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!1007 Unit!618 (mask!4770 (v!1624 (underlying!121 thiss!938))))))))

(assert (=> d!4771 (validMask!0 (mask!4770 (v!1624 (underlying!121 thiss!938))))))

(assert (=> d!4771 (= (computeNewMask!33 thiss!938 (mask!4770 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (_size!158 (v!1624 (underlying!121 thiss!938)))) lt!10151)))

(declare-fun b!25589 () Bool)

(declare-fun computeNewMaskWhile!16 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!1006)

(assert (=> b!25589 (= e!16534 (computeNewMaskWhile!16 (_size!158 (v!1624 (underlying!121 thiss!938))) (_vacant!158 (v!1624 (underlying!121 thiss!938))) (mask!4770 (v!1624 (underlying!121 thiss!938))) (_2!514 lt!10152)))))

(declare-fun b!25590 () Bool)

(declare-fun Unit!619 () Unit!611)

(assert (=> b!25590 (= e!16534 (tuple2!1007 Unit!619 (_2!514 lt!10152)))))

(declare-fun b!25591 () Bool)

(assert (=> b!25591 (= e!16535 (bvsle (_size!158 (v!1624 (underlying!121 thiss!938))) (bvadd lt!10151 #b00000000000000000000000000000001)))))

(assert (= (and d!4771 c!3596) b!25589))

(assert (= (and d!4771 (not c!3596)) b!25590))

(assert (= (and d!4771 res!15300) b!25591))

(declare-fun m!20577 () Bool)

(assert (=> d!4771 m!20577))

(declare-fun m!20579 () Bool)

(assert (=> d!4771 m!20579))

(declare-fun m!20581 () Bool)

(assert (=> b!25589 m!20581))

(assert (=> b!25344 d!4771))

(declare-fun b!25592 () Bool)

(declare-fun e!16537 () Bool)

(declare-fun lt!10172 () SeekEntryResult!57)

(assert (=> b!25592 (= e!16537 ((_ is Undefined!57) lt!10172))))

(declare-fun bm!2424 () Bool)

(declare-fun call!2448 () Bool)

(declare-fun call!2441 () Bool)

(assert (=> bm!2424 (= call!2448 call!2441)))

(declare-fun b!25593 () Bool)

(declare-fun e!16544 () Bool)

(declare-fun call!2447 () ListLongMap!569)

(declare-fun call!2427 () ListLongMap!569)

(assert (=> b!25593 (= e!16544 (= call!2447 call!2427))))

(declare-fun b!25594 () Bool)

(declare-fun c!3609 () Bool)

(declare-fun lt!10179 () SeekEntryResult!57)

(assert (=> b!25594 (= c!3609 ((_ is MissingVacant!57) lt!10179))))

(declare-fun e!16536 () tuple2!990)

(declare-fun e!16550 () tuple2!990)

(assert (=> b!25594 (= e!16536 e!16550)))

(declare-fun b!25595 () Bool)

(declare-fun res!15305 () Bool)

(declare-fun e!16554 () Bool)

(assert (=> b!25595 (=> (not res!15305) (not e!16554))))

(declare-fun call!2428 () Bool)

(assert (=> b!25595 (= res!15305 call!2428)))

(declare-fun e!16551 () Bool)

(assert (=> b!25595 (= e!16551 e!16554)))

(declare-fun d!4773 () Bool)

(declare-fun e!16540 () Bool)

(assert (=> d!4773 e!16540))

(declare-fun res!15303 () Bool)

(assert (=> d!4773 (=> (not res!15303) (not e!16540))))

(declare-fun lt!10174 () tuple2!990)

(assert (=> d!4773 (= res!15303 (valid!121 (_2!503 lt!10174)))))

(declare-fun e!16546 () tuple2!990)

(assert (=> d!4773 (= lt!10174 e!16546)))

(declare-fun c!3601 () Bool)

(assert (=> d!4773 (= c!3601 (= (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!4773 (valid!121 (ite c!3522 (_2!503 lt!9928) lt!9934))))

(assert (=> d!4773 (= (update!40 (ite c!3522 (_2!503 lt!9928) lt!9934) (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938)))))) lt!10174)))

(declare-fun bm!2425 () Bool)

(declare-fun c!3602 () Bool)

(declare-fun call!2435 () ListLongMap!569)

(declare-fun e!16548 () ListLongMap!569)

(assert (=> bm!2425 (= call!2435 (+!47 e!16548 (ite c!3601 (ite c!3602 (tuple2!995 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938)))))) (tuple2!995 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))))) (tuple2!995 (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938)))))))))))

(declare-fun c!3603 () Bool)

(assert (=> bm!2425 (= c!3603 c!3601)))

(declare-fun b!25596 () Bool)

(declare-fun e!16543 () Bool)

(declare-fun lt!10153 () SeekEntryResult!57)

(assert (=> b!25596 (= e!16543 ((_ is Undefined!57) lt!10153))))

(declare-fun bm!2426 () Bool)

(assert (=> bm!2426 (= call!2428 call!2448)))

(declare-fun b!25597 () Bool)

(declare-fun lt!10156 () tuple2!990)

(assert (=> b!25597 (= e!16550 (tuple2!991 (_1!503 lt!10156) (_2!503 lt!10156)))))

(declare-fun call!2446 () tuple2!990)

(assert (=> b!25597 (= lt!10156 call!2446)))

(declare-fun bm!2427 () Bool)

(declare-fun call!2440 () Bool)

(assert (=> bm!2427 (= call!2440 call!2441)))

(declare-fun b!25598 () Bool)

(declare-fun e!16545 () Bool)

(assert (=> b!25598 (= e!16544 e!16545)))

(declare-fun res!15308 () Bool)

(assert (=> b!25598 (= res!15308 (contains!234 call!2447 (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!25598 (=> (not res!15308) (not e!16545))))

(declare-fun b!25599 () Bool)

(declare-fun e!16542 () tuple2!990)

(assert (=> b!25599 (= e!16550 e!16542)))

(declare-fun c!3598 () Bool)

(assert (=> b!25599 (= c!3598 ((_ is MissingZero!57) lt!10179))))

(declare-fun bm!2428 () Bool)

(declare-fun call!2449 () SeekEntryResult!57)

(declare-fun call!2442 () SeekEntryResult!57)

(assert (=> bm!2428 (= call!2449 call!2442)))

(declare-fun call!2429 () Unit!611)

(declare-fun bm!2429 () Bool)

(assert (=> bm!2429 (= call!2429 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!12 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(declare-fun b!25600 () Bool)

(declare-fun res!15313 () Bool)

(assert (=> b!25600 (= res!15313 call!2448)))

(declare-fun e!16549 () Bool)

(assert (=> b!25600 (=> (not res!15313) (not e!16549))))

(declare-fun b!25601 () Bool)

(declare-fun c!3604 () Bool)

(assert (=> b!25601 (= c!3604 ((_ is MissingVacant!57) lt!10172))))

(assert (=> b!25601 (= e!16551 e!16537)))

(declare-fun bm!2430 () Bool)

(declare-fun call!2439 () Bool)

(declare-fun call!2443 () Bool)

(assert (=> bm!2430 (= call!2439 call!2443)))

(declare-fun lt!10160 () (_ BitVec 32))

(declare-fun call!2430 () ListLongMap!569)

(declare-fun bm!2431 () Bool)

(declare-fun lt!10170 () (_ BitVec 32))

(assert (=> bm!2431 (= call!2430 (getCurrentListMap!131 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (ite c!3601 (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) (array!1290 (store (arr!608 (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934))) (index!2351 lt!10179) (ValueCellFull!317 (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))))) (size!709 (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934))))) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (ite c!3601 (ite c!3602 lt!10170 lt!10160) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934))) (ite (and c!3601 c!3602) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))) (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934))) (ite c!3601 (ite c!3602 (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938)))))) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934))) #b00000000000000000000000000000000 (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(declare-fun b!25602 () Bool)

(declare-fun lt!10171 () Unit!611)

(declare-fun lt!10165 () Unit!611)

(assert (=> b!25602 (= lt!10171 lt!10165)))

(declare-fun call!2438 () ListLongMap!569)

(declare-fun call!2431 () ListLongMap!569)

(assert (=> b!25602 (= call!2438 call!2431)))

(assert (=> b!25602 (= lt!10165 (lemmaChangeLongMinValueKeyThenAddPairToListMap!12 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) lt!10160 (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))) (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(assert (=> b!25602 (= lt!10160 (bvor (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) #b00000000000000000000000000000010))))

(declare-fun e!16541 () tuple2!990)

(assert (=> b!25602 (= e!16541 (tuple2!991 true (LongMapFixedSize!221 (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (bvor (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) #b00000000000000000000000000000010) (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))) (_size!158 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_vacant!158 (ite c!3522 (_2!503 lt!9928) lt!9934)))))))

(declare-fun b!25603 () Bool)

(declare-fun e!16538 () Unit!611)

(declare-fun lt!10178 () Unit!611)

(assert (=> b!25603 (= e!16538 lt!10178)))

(declare-fun call!2433 () Unit!611)

(assert (=> b!25603 (= lt!10178 call!2433)))

(declare-fun lt!10159 () SeekEntryResult!57)

(declare-fun call!2432 () SeekEntryResult!57)

(assert (=> b!25603 (= lt!10159 call!2432)))

(declare-fun res!15311 () Bool)

(assert (=> b!25603 (= res!15311 ((_ is Found!57) lt!10159))))

(declare-fun e!16556 () Bool)

(assert (=> b!25603 (=> (not res!15311) (not e!16556))))

(assert (=> b!25603 e!16556))

(declare-fun b!25604 () Bool)

(declare-fun lt!10177 () Unit!611)

(declare-fun lt!10155 () Unit!611)

(assert (=> b!25604 (= lt!10177 lt!10155)))

(assert (=> b!25604 (= call!2438 call!2431)))

(assert (=> b!25604 (= lt!10155 (lemmaChangeZeroKeyThenAddPairToListMap!12 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) lt!10170 (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(assert (=> b!25604 (= lt!10170 (bvor (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) #b00000000000000000000000000000001))))

(assert (=> b!25604 (= e!16541 (tuple2!991 true (LongMapFixedSize!221 (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (bvor (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) #b00000000000000000000000000000001) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_size!158 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_vacant!158 (ite c!3522 (_2!503 lt!9928) lt!9934)))))))

(declare-fun bm!2432 () Bool)

(assert (=> bm!2432 (= call!2433 (lemmaInListMapThenSeekEntryOrOpenFindsIt!12 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(declare-fun bm!2433 () Bool)

(declare-fun lt!10158 () array!1289)

(declare-fun call!2450 () ListLongMap!569)

(declare-fun c!3607 () Bool)

(assert (=> bm!2433 (= call!2450 (getCurrentListMap!131 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (ite (or c!3601 c!3607) (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) lt!10158) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) #b00000000000000000000000000000000 (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(declare-fun b!25605 () Bool)

(declare-fun res!15314 () Bool)

(assert (=> b!25605 (= res!15314 call!2440)))

(assert (=> b!25605 (=> (not res!15314) (not e!16556))))

(declare-fun b!25606 () Bool)

(declare-fun e!16539 () Bool)

(assert (=> b!25606 (= e!16537 e!16539)))

(declare-fun res!15309 () Bool)

(assert (=> b!25606 (= res!15309 call!2428)))

(assert (=> b!25606 (=> (not res!15309) (not e!16539))))

(declare-fun bm!2434 () Bool)

(declare-fun call!2445 () ListLongMap!569)

(assert (=> bm!2434 (= call!2445 call!2450)))

(declare-fun bm!2435 () Bool)

(assert (=> bm!2435 (= call!2442 (seekEntryOrOpen!0 (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(declare-fun b!25607 () Bool)

(declare-fun call!2434 () Bool)

(assert (=> b!25607 (= e!16539 (not call!2434))))

(declare-fun bm!2436 () Bool)

(declare-fun call!2437 () ListLongMap!569)

(assert (=> bm!2436 (= call!2437 call!2450)))

(declare-fun bm!2437 () Bool)

(assert (=> bm!2437 (= call!2443 (arrayContainsKey!0 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!25608 () Bool)

(assert (=> b!25608 (= e!16548 (getCurrentListMap!131 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) #b00000000000000000000000000000000 (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(declare-fun bm!2438 () Bool)

(assert (=> bm!2438 (= call!2434 call!2443)))

(declare-fun b!25609 () Bool)

(declare-fun c!3608 () Bool)

(assert (=> b!25609 (= c!3608 ((_ is MissingVacant!57) lt!10153))))

(declare-fun e!16553 () Bool)

(assert (=> b!25609 (= e!16553 e!16543)))

(declare-fun b!25610 () Bool)

(assert (=> b!25610 (= e!16546 e!16541)))

(assert (=> b!25610 (= c!3602 (= (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25611 () Bool)

(declare-fun Unit!620 () Unit!611)

(assert (=> b!25611 (= e!16538 Unit!620)))

(declare-fun lt!10157 () Unit!611)

(assert (=> b!25611 (= lt!10157 call!2429)))

(assert (=> b!25611 (= lt!10153 call!2432)))

(declare-fun c!3597 () Bool)

(assert (=> b!25611 (= c!3597 ((_ is MissingZero!57) lt!10153))))

(assert (=> b!25611 e!16553))

(declare-fun lt!10168 () Unit!611)

(assert (=> b!25611 (= lt!10168 lt!10157)))

(assert (=> b!25611 false))

(declare-fun b!25612 () Bool)

(assert (=> b!25612 (= e!16545 (= call!2447 (+!47 call!2427 (tuple2!995 (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938)))))))))))

(declare-fun b!25613 () Bool)

(declare-fun e!16555 () Unit!611)

(declare-fun Unit!621 () Unit!611)

(assert (=> b!25613 (= e!16555 Unit!621)))

(declare-fun lt!10162 () Unit!611)

(assert (=> b!25613 (= lt!10162 call!2433)))

(declare-fun lt!10161 () SeekEntryResult!57)

(assert (=> b!25613 (= lt!10161 call!2449)))

(declare-fun res!15306 () Bool)

(assert (=> b!25613 (= res!15306 ((_ is Found!57) lt!10161))))

(assert (=> b!25613 (=> (not res!15306) (not e!16549))))

(assert (=> b!25613 e!16549))

(declare-fun lt!10176 () Unit!611)

(assert (=> b!25613 (= lt!10176 lt!10162)))

(assert (=> b!25613 false))

(declare-fun b!25614 () Bool)

(assert (=> b!25614 (= e!16548 call!2445)))

(declare-fun bm!2439 () Bool)

(assert (=> bm!2439 (= call!2447 (map!416 (_2!503 lt!10174)))))

(declare-fun b!25615 () Bool)

(declare-fun res!15302 () Bool)

(assert (=> b!25615 (=> (not res!15302) (not e!16554))))

(assert (=> b!25615 (= res!15302 (= (select (arr!609 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934))) (index!2350 lt!10172)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25616 () Bool)

(assert (=> b!25616 (= e!16556 (= (select (arr!609 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934))) (index!2351 lt!10159)) (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!2440 () Bool)

(assert (=> bm!2440 (= call!2427 (map!416 (ite c!3522 (_2!503 lt!9928) lt!9934)))))

(declare-fun b!25617 () Bool)

(assert (=> b!25617 (= e!16549 (= (select (arr!609 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934))) (index!2351 lt!10161)) (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!25618 () Bool)

(declare-fun res!15307 () Bool)

(assert (=> b!25618 (= res!15307 (= (select (arr!609 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934))) (index!2353 lt!10153)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16552 () Bool)

(assert (=> b!25618 (=> (not res!15307) (not e!16552))))

(declare-fun b!25619 () Bool)

(declare-fun lt!10164 () Unit!611)

(assert (=> b!25619 (= lt!10164 e!16555)))

(declare-fun c!3606 () Bool)

(declare-fun call!2444 () Bool)

(assert (=> b!25619 (= c!3606 call!2444)))

(assert (=> b!25619 (= e!16536 (tuple2!991 false (ite c!3522 (_2!503 lt!9928) lt!9934)))))

(declare-fun b!25620 () Bool)

(declare-fun e!16547 () Bool)

(assert (=> b!25620 (= e!16547 (not call!2439))))

(declare-fun c!3605 () Bool)

(declare-fun bm!2441 () Bool)

(declare-fun c!3600 () Bool)

(assert (=> bm!2441 (= call!2441 (inRange!0 (ite c!3607 (ite c!3606 (index!2351 lt!10161) (ite c!3605 (index!2350 lt!10172) (index!2353 lt!10172))) (ite c!3600 (index!2351 lt!10159) (ite c!3597 (index!2350 lt!10153) (index!2353 lt!10153)))) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(declare-fun b!25621 () Bool)

(assert (=> b!25621 (= e!16552 (not call!2439))))

(declare-fun bm!2442 () Bool)

(assert (=> bm!2442 (= call!2431 call!2430)))

(declare-fun b!25622 () Bool)

(declare-fun lt!10169 () Unit!611)

(assert (=> b!25622 (= e!16555 lt!10169)))

(assert (=> b!25622 (= lt!10169 call!2429)))

(assert (=> b!25622 (= lt!10172 call!2449)))

(assert (=> b!25622 (= c!3605 ((_ is MissingZero!57) lt!10172))))

(assert (=> b!25622 e!16551))

(declare-fun b!25623 () Bool)

(assert (=> b!25623 (= e!16546 e!16536)))

(assert (=> b!25623 (= lt!10179 (seekEntryOrOpen!0 (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(assert (=> b!25623 (= c!3607 ((_ is Undefined!57) lt!10179))))

(declare-fun b!25624 () Bool)

(declare-fun res!15301 () Bool)

(assert (=> b!25624 (=> (not res!15301) (not e!16547))))

(declare-fun call!2436 () Bool)

(assert (=> b!25624 (= res!15301 call!2436)))

(assert (=> b!25624 (= e!16553 e!16547)))

(declare-fun b!25625 () Bool)

(declare-fun lt!10175 () Unit!611)

(declare-fun lt!10167 () Unit!611)

(assert (=> b!25625 (= lt!10175 lt!10167)))

(assert (=> b!25625 call!2444))

(assert (=> b!25625 (= lt!10167 (lemmaValidKeyInArrayIsInListMap!12 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) lt!10158 (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (index!2351 lt!10179) (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(assert (=> b!25625 (= lt!10158 (array!1290 (store (arr!608 (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934))) (index!2351 lt!10179) (ValueCellFull!317 (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))))) (size!709 (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)))))))

(declare-fun lt!10163 () Unit!611)

(declare-fun lt!10154 () Unit!611)

(assert (=> b!25625 (= lt!10163 lt!10154)))

(assert (=> b!25625 (= call!2435 call!2430)))

(assert (=> b!25625 (= lt!10154 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!12 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (index!2351 lt!10179) (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))) (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934))))))

(declare-fun lt!10166 () Unit!611)

(assert (=> b!25625 (= lt!10166 e!16538)))

(assert (=> b!25625 (= c!3600 (contains!234 (getCurrentListMap!131 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) #b00000000000000000000000000000000 (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934))) (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!25625 (= e!16542 (tuple2!991 true (LongMapFixedSize!221 (defaultEntry!1768 (ite c!3522 (_2!503 lt!9928) lt!9934)) (mask!4770 (ite c!3522 (_2!503 lt!9928) lt!9934)) (extraKeys!1660 (ite c!3522 (_2!503 lt!9928) lt!9934)) (zeroValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (minValue!1687 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_size!158 (ite c!3522 (_2!503 lt!9928) lt!9934)) (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934)) (array!1290 (store (arr!608 (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934))) (index!2351 lt!10179) (ValueCellFull!317 (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))))) (size!709 (_values!1752 (ite c!3522 (_2!503 lt!9928) lt!9934)))) (_vacant!158 (ite c!3522 (_2!503 lt!9928) lt!9934)))))))

(declare-fun bm!2443 () Bool)

(assert (=> bm!2443 (= call!2438 call!2435)))

(declare-fun bm!2444 () Bool)

(assert (=> bm!2444 (= call!2446 (updateHelperNewKey!12 (ite c!3522 (_2!503 lt!9928) lt!9934) (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3522 (minValue!1687 (v!1624 (underlying!121 thiss!938))) (ite c!3524 (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))))) (ite c!3609 (index!2353 lt!10179) (index!2350 lt!10179))))))

(declare-fun b!25626 () Bool)

(declare-fun lt!10173 () tuple2!990)

(assert (=> b!25626 (= lt!10173 call!2446)))

(assert (=> b!25626 (= e!16542 (tuple2!991 (_1!503 lt!10173) (_2!503 lt!10173)))))

(declare-fun b!25627 () Bool)

(assert (=> b!25627 (= e!16554 (not call!2434))))

(declare-fun b!25628 () Bool)

(assert (=> b!25628 (= e!16540 e!16544)))

(declare-fun c!3599 () Bool)

(assert (=> b!25628 (= c!3599 (_1!503 lt!10174))))

(declare-fun bm!2445 () Bool)

(assert (=> bm!2445 (= call!2444 (contains!234 call!2437 (ite c!3607 (ite c!3522 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3524 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!609 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934))) (index!2351 lt!10179)))))))

(declare-fun bm!2446 () Bool)

(assert (=> bm!2446 (= call!2436 call!2440)))

(declare-fun b!25629 () Bool)

(assert (=> b!25629 (= e!16543 e!16552)))

(declare-fun res!15312 () Bool)

(assert (=> b!25629 (= res!15312 call!2436)))

(assert (=> b!25629 (=> (not res!15312) (not e!16552))))

(declare-fun b!25630 () Bool)

(declare-fun res!15304 () Bool)

(assert (=> b!25630 (=> (not res!15304) (not e!16547))))

(assert (=> b!25630 (= res!15304 (= (select (arr!609 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934))) (index!2350 lt!10153)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2447 () Bool)

(assert (=> bm!2447 (= call!2432 call!2442)))

(declare-fun b!25631 () Bool)

(declare-fun res!15310 () Bool)

(assert (=> b!25631 (= res!15310 (= (select (arr!609 (_keys!3193 (ite c!3522 (_2!503 lt!9928) lt!9934))) (index!2353 lt!10172)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25631 (=> (not res!15310) (not e!16539))))

(assert (= (and d!4773 c!3601) b!25610))

(assert (= (and d!4773 (not c!3601)) b!25623))

(assert (= (and b!25610 c!3602) b!25604))

(assert (= (and b!25610 (not c!3602)) b!25602))

(assert (= (or b!25604 b!25602) bm!2442))

(assert (= (or b!25604 b!25602) bm!2434))

(assert (= (or b!25604 b!25602) bm!2443))

(assert (= (and b!25623 c!3607) b!25619))

(assert (= (and b!25623 (not c!3607)) b!25594))

(assert (= (and b!25619 c!3606) b!25613))

(assert (= (and b!25619 (not c!3606)) b!25622))

(assert (= (and b!25613 res!15306) b!25600))

(assert (= (and b!25600 res!15313) b!25617))

(assert (= (and b!25622 c!3605) b!25595))

(assert (= (and b!25622 (not c!3605)) b!25601))

(assert (= (and b!25595 res!15305) b!25615))

(assert (= (and b!25615 res!15302) b!25627))

(assert (= (and b!25601 c!3604) b!25606))

(assert (= (and b!25601 (not c!3604)) b!25592))

(assert (= (and b!25606 res!15309) b!25631))

(assert (= (and b!25631 res!15310) b!25607))

(assert (= (or b!25595 b!25606) bm!2426))

(assert (= (or b!25627 b!25607) bm!2438))

(assert (= (or b!25600 bm!2426) bm!2424))

(assert (= (or b!25613 b!25622) bm!2428))

(assert (= (and b!25594 c!3609) b!25597))

(assert (= (and b!25594 (not c!3609)) b!25599))

(assert (= (and b!25599 c!3598) b!25626))

(assert (= (and b!25599 (not c!3598)) b!25625))

(assert (= (and b!25625 c!3600) b!25603))

(assert (= (and b!25625 (not c!3600)) b!25611))

(assert (= (and b!25603 res!15311) b!25605))

(assert (= (and b!25605 res!15314) b!25616))

(assert (= (and b!25611 c!3597) b!25624))

(assert (= (and b!25611 (not c!3597)) b!25609))

(assert (= (and b!25624 res!15301) b!25630))

(assert (= (and b!25630 res!15304) b!25620))

(assert (= (and b!25609 c!3608) b!25629))

(assert (= (and b!25609 (not c!3608)) b!25596))

(assert (= (and b!25629 res!15312) b!25618))

(assert (= (and b!25618 res!15307) b!25621))

(assert (= (or b!25624 b!25629) bm!2446))

(assert (= (or b!25620 b!25621) bm!2430))

(assert (= (or b!25605 bm!2446) bm!2427))

(assert (= (or b!25603 b!25611) bm!2447))

(assert (= (or b!25597 b!25626) bm!2444))

(assert (= (or bm!2428 bm!2447) bm!2435))

(assert (= (or b!25619 b!25625) bm!2436))

(assert (= (or b!25613 b!25603) bm!2432))

(assert (= (or b!25622 b!25611) bm!2429))

(assert (= (or bm!2438 bm!2430) bm!2437))

(assert (= (or bm!2424 bm!2427) bm!2441))

(assert (= (or b!25619 b!25625) bm!2445))

(assert (= (or bm!2434 bm!2436) bm!2433))

(assert (= (or bm!2442 b!25625) bm!2431))

(assert (= (or bm!2443 b!25625) bm!2425))

(assert (= (and bm!2425 c!3603) b!25614))

(assert (= (and bm!2425 (not c!3603)) b!25608))

(assert (= (and d!4773 res!15303) b!25628))

(assert (= (and b!25628 c!3599) b!25598))

(assert (= (and b!25628 (not c!3599)) b!25593))

(assert (= (and b!25598 res!15308) b!25612))

(assert (= (or b!25598 b!25612 b!25593) bm!2439))

(assert (= (or b!25612 b!25593) bm!2440))

(declare-fun m!20583 () Bool)

(assert (=> bm!2433 m!20583))

(declare-fun m!20585 () Bool)

(assert (=> bm!2437 m!20585))

(declare-fun m!20587 () Bool)

(assert (=> b!25604 m!20587))

(declare-fun m!20589 () Bool)

(assert (=> b!25631 m!20589))

(declare-fun m!20591 () Bool)

(assert (=> b!25618 m!20591))

(declare-fun m!20593 () Bool)

(assert (=> b!25612 m!20593))

(declare-fun m!20595 () Bool)

(assert (=> d!4773 m!20595))

(declare-fun m!20597 () Bool)

(assert (=> d!4773 m!20597))

(declare-fun m!20599 () Bool)

(assert (=> b!25602 m!20599))

(declare-fun m!20601 () Bool)

(assert (=> b!25598 m!20601))

(declare-fun m!20603 () Bool)

(assert (=> bm!2441 m!20603))

(declare-fun m!20605 () Bool)

(assert (=> b!25615 m!20605))

(declare-fun m!20607 () Bool)

(assert (=> bm!2431 m!20607))

(declare-fun m!20609 () Bool)

(assert (=> bm!2431 m!20609))

(declare-fun m!20611 () Bool)

(assert (=> bm!2440 m!20611))

(declare-fun m!20613 () Bool)

(assert (=> bm!2444 m!20613))

(declare-fun m!20615 () Bool)

(assert (=> bm!2439 m!20615))

(declare-fun m!20617 () Bool)

(assert (=> b!25623 m!20617))

(declare-fun m!20619 () Bool)

(assert (=> bm!2432 m!20619))

(declare-fun m!20621 () Bool)

(assert (=> bm!2429 m!20621))

(declare-fun m!20623 () Bool)

(assert (=> b!25630 m!20623))

(assert (=> bm!2435 m!20617))

(declare-fun m!20625 () Bool)

(assert (=> bm!2425 m!20625))

(assert (=> b!25625 m!20607))

(declare-fun m!20627 () Bool)

(assert (=> b!25625 m!20627))

(declare-fun m!20629 () Bool)

(assert (=> b!25625 m!20629))

(declare-fun m!20631 () Bool)

(assert (=> b!25625 m!20631))

(declare-fun m!20633 () Bool)

(assert (=> b!25625 m!20633))

(assert (=> b!25625 m!20629))

(declare-fun m!20635 () Bool)

(assert (=> b!25616 m!20635))

(declare-fun m!20637 () Bool)

(assert (=> b!25617 m!20637))

(declare-fun m!20639 () Bool)

(assert (=> bm!2445 m!20639))

(declare-fun m!20641 () Bool)

(assert (=> bm!2445 m!20641))

(assert (=> b!25608 m!20629))

(assert (=> bm!2338 d!4773))

(declare-fun d!4775 () Bool)

(assert (=> d!4775 (= (map!414 (_3!8 lt!9929)) (map!416 (v!1624 (underlying!121 (_3!8 lt!9929)))))))

(declare-fun bs!1053 () Bool)

(assert (= bs!1053 d!4775))

(declare-fun m!20643 () Bool)

(assert (=> bs!1053 m!20643))

(assert (=> b!25342 d!4775))

(declare-fun d!4777 () Bool)

(assert (=> d!4777 (= (map!414 thiss!938) (map!416 (v!1624 (underlying!121 thiss!938))))))

(declare-fun bs!1054 () Bool)

(assert (= bs!1054 d!4777))

(declare-fun m!20645 () Bool)

(assert (=> bs!1054 m!20645))

(assert (=> b!25342 d!4777))

(declare-fun lt!10270 () (_ BitVec 64))

(declare-fun bm!2474 () Bool)

(declare-fun call!2487 () ListLongMap!569)

(declare-fun lt!10250 () V!1203)

(declare-fun c!3625 () Bool)

(declare-fun call!2489 () ListLongMap!569)

(declare-fun call!2480 () ListLongMap!569)

(assert (=> bm!2474 (= call!2489 (+!47 (ite c!3625 call!2480 call!2487) (tuple2!995 lt!10270 lt!10250)))))

(declare-fun lt!10246 () ListLongMap!569)

(declare-fun lt!10271 () (_ BitVec 64))

(declare-fun lt!10255 () (_ BitVec 64))

(declare-fun call!2488 () Unit!611)

(declare-fun bm!2475 () Bool)

(declare-fun lt!10259 () ListLongMap!569)

(declare-fun addCommutativeForDiffKeys!4 (ListLongMap!569 (_ BitVec 64) V!1203 (_ BitVec 64) V!1203) Unit!611)

(assert (=> bm!2475 (= call!2488 (addCommutativeForDiffKeys!4 (ite c!3625 lt!10259 lt!10246) lt!10270 lt!10250 (ite c!3625 lt!10255 lt!10271) (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))))))

(declare-fun e!16575 () Bool)

(declare-fun b!25660 () Bool)

(declare-fun lt!10265 () (_ BitVec 32))

(assert (=> b!25660 (= e!16575 (arrayContainsKey!0 (_keys!3193 (v!1624 (underlying!121 thiss!938))) lt!10270 lt!10265))))

(declare-fun b!25661 () Bool)

(assert (=> b!25661 (= c!3625 (bvsgt (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun e!16573 () tuple2!990)

(declare-fun e!16577 () tuple2!990)

(assert (=> b!25661 (= e!16573 e!16577)))

(declare-fun call!2484 () ListLongMap!569)

(declare-fun bm!2476 () Bool)

(assert (=> bm!2476 (= call!2484 (+!47 (ite c!3625 lt!10259 lt!10246) (ite c!3625 (tuple2!995 lt!10270 lt!10250) (tuple2!995 lt!10271 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))))))))

(declare-fun d!4779 () Bool)

(declare-fun e!16579 () Bool)

(assert (=> d!4779 e!16579))

(declare-fun res!15320 () Bool)

(assert (=> d!4779 (=> res!15320 e!16579)))

(declare-fun lt!10252 () tuple2!990)

(assert (=> d!4779 (= res!15320 (not (_1!503 lt!10252)))))

(declare-fun e!16574 () tuple2!990)

(assert (=> d!4779 (= lt!10252 e!16574)))

(declare-fun c!3627 () Bool)

(assert (=> d!4779 (= c!3627 (and (not (= lt!10270 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!10270 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!10274 () ListLongMap!569)

(assert (=> d!4779 (= lt!10274 (map!416 (v!1624 (_2!504 lt!9927))))))

(declare-fun get!398 (ValueCell!317 V!1203) V!1203)

(assert (=> d!4779 (= lt!10250 (get!398 (select (arr!608 (_values!1752 (v!1624 (underlying!121 thiss!938)))) (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) (dynLambda!145 (defaultEntry!1768 (v!1624 (underlying!121 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4779 (= lt!10270 (select (arr!609 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!4779 (valid!119 thiss!938)))

(assert (=> d!4779 (= (repackFrom!7 thiss!938 (v!1624 (_2!504 lt!9927)) (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)) lt!10252)))

(declare-fun b!25662 () Bool)

(assert (=> b!25662 (= e!16574 e!16573)))

(declare-fun lt!10264 () tuple2!990)

(assert (=> b!25662 (= lt!10264 (update!40 (v!1624 (_2!504 lt!9927)) lt!10270 lt!10250))))

(declare-fun c!3622 () Bool)

(assert (=> b!25662 (= c!3622 (contains!234 lt!10274 lt!10270))))

(declare-fun lt!10266 () Unit!611)

(declare-fun e!16580 () Unit!611)

(assert (=> b!25662 (= lt!10266 e!16580)))

(declare-fun c!3626 () Bool)

(assert (=> b!25662 (= c!3626 (_1!503 lt!10264))))

(declare-fun b!25663 () Bool)

(assert (=> b!25663 (= e!16577 (tuple2!991 true (_2!503 lt!10264)))))

(declare-fun call!2479 () ListLongMap!569)

(assert (=> b!25663 (= lt!10246 call!2479)))

(assert (=> b!25663 (= lt!10271 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10244 () Unit!611)

(assert (=> b!25663 (= lt!10244 call!2488)))

(declare-fun call!2481 () ListLongMap!569)

(declare-fun call!2478 () ListLongMap!569)

(assert (=> b!25663 (= call!2481 call!2478)))

(declare-fun lt!10268 () Unit!611)

(assert (=> b!25663 (= lt!10268 lt!10244)))

(declare-fun lt!10269 () ListLongMap!569)

(declare-fun call!2486 () ListLongMap!569)

(assert (=> b!25663 (= lt!10269 call!2486)))

(declare-fun lt!10254 () (_ BitVec 64))

(assert (=> b!25663 (= lt!10254 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10251 () Unit!611)

(declare-fun call!2485 () Unit!611)

(assert (=> b!25663 (= lt!10251 call!2485)))

(declare-fun call!2477 () ListLongMap!569)

(assert (=> b!25663 (= call!2477 call!2489)))

(declare-fun lt!10275 () Unit!611)

(assert (=> b!25663 (= lt!10275 lt!10251)))

(declare-fun bm!2477 () Bool)

(assert (=> bm!2477 (= call!2477 (+!47 (ite c!3625 call!2484 call!2480) (ite c!3625 (tuple2!995 lt!10255 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))) (tuple2!995 lt!10254 (minValue!1687 (v!1624 (underlying!121 thiss!938)))))))))

(declare-fun bm!2478 () Bool)

(assert (=> bm!2478 (= call!2478 (+!47 (ite c!3625 call!2479 call!2484) (ite c!3625 (tuple2!995 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))) (tuple2!995 lt!10270 lt!10250))))))

(declare-fun lt!10263 () (_ BitVec 64))

(declare-fun lt!10262 () ListLongMap!569)

(declare-fun bm!2479 () Bool)

(assert (=> bm!2479 (= call!2480 (+!47 (ite c!3625 lt!10262 lt!10269) (ite c!3625 (tuple2!995 lt!10263 (minValue!1687 (v!1624 (underlying!121 thiss!938)))) (tuple2!995 lt!10270 lt!10250))))))

(declare-fun b!25664 () Bool)

(assert (=> b!25664 (= e!16575 (ite (= lt!10270 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1660 (v!1624 (underlying!121 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1660 (v!1624 (underlying!121 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!2482 () ListLongMap!569)

(declare-fun bm!2480 () Bool)

(assert (=> bm!2480 (= call!2482 (+!47 (ite c!3625 lt!10262 lt!10246) (tuple2!995 lt!10270 lt!10250)))))

(declare-fun bm!2481 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!16 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 32) Int) ListLongMap!569)

(assert (=> bm!2481 (= call!2479 (getCurrentListMapNoExtraKeys!16 (_keys!3193 (v!1624 (underlying!121 thiss!938))) (_values!1752 (v!1624 (underlying!121 thiss!938))) (mask!4770 (v!1624 (underlying!121 thiss!938))) (extraKeys!1660 (v!1624 (underlying!121 thiss!938))) (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))) (bvadd (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1768 (v!1624 (underlying!121 thiss!938)))))))

(declare-fun b!25665 () Bool)

(assert (=> b!25665 (= e!16573 (tuple2!991 false (_2!503 lt!10264)))))

(declare-fun b!25666 () Bool)

(assert (=> b!25666 false))

(declare-fun lt!10249 () Unit!611)

(declare-fun lt!10247 () Unit!611)

(assert (=> b!25666 (= lt!10249 lt!10247)))

(declare-fun lt!10256 () (_ BitVec 32))

(assert (=> b!25666 (not (arrayContainsKey!0 (_keys!3193 (v!1624 (underlying!121 thiss!938))) lt!10270 lt!10256))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!1291 (_ BitVec 32) (_ BitVec 64) List!571) Unit!611)

(assert (=> b!25666 (= lt!10247 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3193 (v!1624 (underlying!121 thiss!938))) lt!10256 lt!10270 (Cons!567 lt!10270 Nil!568)))))

(assert (=> b!25666 (= lt!10256 (bvadd (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!10267 () Unit!611)

(declare-fun lt!10253 () Unit!611)

(assert (=> b!25666 (= lt!10267 lt!10253)))

(assert (=> b!25666 (arrayNoDuplicates!0 (_keys!3193 (v!1624 (underlying!121 thiss!938))) (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) Nil!568)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!1291 (_ BitVec 32) (_ BitVec 32)) Unit!611)

(assert (=> b!25666 (= lt!10253 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3193 (v!1624 (underlying!121 thiss!938))) #b00000000000000000000000000000000 (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!10261 () Unit!611)

(declare-fun lt!10257 () Unit!611)

(assert (=> b!25666 (= lt!10261 lt!10257)))

(assert (=> b!25666 e!16575))

(declare-fun c!3623 () Bool)

(assert (=> b!25666 (= c!3623 (and (not (= lt!10270 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!10270 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!4 (array!1291 array!1289 (_ BitVec 32) (_ BitVec 32) V!1203 V!1203 (_ BitVec 64) (_ BitVec 32) Int) Unit!611)

(assert (=> b!25666 (= lt!10257 (lemmaListMapContainsThenArrayContainsFrom!4 (_keys!3193 (v!1624 (underlying!121 thiss!938))) (_values!1752 (v!1624 (underlying!121 thiss!938))) (mask!4770 (v!1624 (underlying!121 thiss!938))) (extraKeys!1660 (v!1624 (underlying!121 thiss!938))) (zeroValue!1687 (v!1624 (underlying!121 thiss!938))) (minValue!1687 (v!1624 (underlying!121 thiss!938))) lt!10270 lt!10265 (defaultEntry!1768 (v!1624 (underlying!121 thiss!938)))))))

(assert (=> b!25666 (= lt!10265 (bvadd (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!622 () Unit!611)

(assert (=> b!25666 (= e!16580 Unit!622)))

(declare-fun b!25667 () Bool)

(declare-fun lt!10273 () tuple2!990)

(assert (=> b!25667 (= e!16577 (tuple2!991 (_1!503 lt!10273) (_2!503 lt!10273)))))

(assert (=> b!25667 (= lt!10259 call!2479)))

(assert (=> b!25667 (= lt!10255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10245 () Unit!611)

(assert (=> b!25667 (= lt!10245 call!2488)))

(assert (=> b!25667 (= call!2477 call!2481)))

(declare-fun lt!10272 () Unit!611)

(assert (=> b!25667 (= lt!10272 lt!10245)))

(assert (=> b!25667 (= lt!10262 call!2478)))

(assert (=> b!25667 (= lt!10263 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10248 () Unit!611)

(assert (=> b!25667 (= lt!10248 call!2485)))

(assert (=> b!25667 (= call!2486 call!2489)))

(declare-fun lt!10260 () Unit!611)

(assert (=> b!25667 (= lt!10260 lt!10248)))

(declare-fun call!2483 () tuple2!990)

(assert (=> b!25667 (= lt!10273 call!2483)))

(declare-fun b!25668 () Bool)

(declare-fun lt!10258 () tuple2!990)

(assert (=> b!25668 (= lt!10258 call!2483)))

(declare-fun e!16578 () tuple2!990)

(assert (=> b!25668 (= e!16578 (tuple2!991 (_1!503 lt!10258) (_2!503 lt!10258)))))

(declare-fun bm!2482 () Bool)

(assert (=> bm!2482 (= call!2486 (+!47 (ite c!3625 call!2482 call!2479) (ite c!3625 (tuple2!995 lt!10263 (minValue!1687 (v!1624 (underlying!121 thiss!938)))) (tuple2!995 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))))))))

(declare-fun b!25669 () Bool)

(declare-fun e!16576 () Bool)

(assert (=> b!25669 (= e!16576 (= (map!416 (_2!503 lt!10252)) (map!416 (v!1624 (underlying!121 thiss!938)))))))

(declare-fun bm!2483 () Bool)

(assert (=> bm!2483 (= call!2481 (+!47 (ite c!3625 call!2487 call!2482) (ite c!3625 (tuple2!995 lt!10270 lt!10250) (tuple2!995 lt!10271 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))))))))

(declare-fun b!25670 () Bool)

(assert (=> b!25670 (= e!16574 e!16578)))

(declare-fun c!3624 () Bool)

(assert (=> b!25670 (= c!3624 (bvsgt (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!2484 () Bool)

(assert (=> bm!2484 (= call!2487 (+!47 (ite c!3625 lt!10259 lt!10269) (ite c!3625 (tuple2!995 lt!10255 (zeroValue!1687 (v!1624 (underlying!121 thiss!938)))) (tuple2!995 lt!10254 (minValue!1687 (v!1624 (underlying!121 thiss!938)))))))))

(declare-fun b!25671 () Bool)

(assert (=> b!25671 (= e!16579 e!16576)))

(declare-fun res!15319 () Bool)

(assert (=> b!25671 (=> (not res!15319) (not e!16576))))

(assert (=> b!25671 (= res!15319 (valid!121 (_2!503 lt!10252)))))

(declare-fun bm!2485 () Bool)

(assert (=> bm!2485 (= call!2483 (repackFrom!7 thiss!938 (ite c!3627 (_2!503 lt!10264) (v!1624 (_2!504 lt!9927))) (bvsub (bvsub (size!710 (_keys!3193 (v!1624 (underlying!121 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun b!25672 () Bool)

(declare-fun Unit!623 () Unit!611)

(assert (=> b!25672 (= e!16580 Unit!623)))

(declare-fun bm!2486 () Bool)

(assert (=> bm!2486 (= call!2485 (addCommutativeForDiffKeys!4 (ite c!3625 lt!10262 lt!10269) lt!10270 lt!10250 (ite c!3625 lt!10263 lt!10254) (minValue!1687 (v!1624 (underlying!121 thiss!938)))))))

(declare-fun b!25673 () Bool)

(assert (=> b!25673 (= e!16578 (tuple2!991 true (v!1624 (_2!504 lt!9927))))))

(assert (= (and d!4779 c!3627) b!25662))

(assert (= (and d!4779 (not c!3627)) b!25670))

(assert (= (and b!25662 c!3622) b!25666))

(assert (= (and b!25662 (not c!3622)) b!25672))

(assert (= (and b!25666 c!3623) b!25660))

(assert (= (and b!25666 (not c!3623)) b!25664))

(assert (= (and b!25662 c!3626) b!25661))

(assert (= (and b!25662 (not c!3626)) b!25665))

(assert (= (and b!25661 c!3625) b!25667))

(assert (= (and b!25661 (not c!3625)) b!25663))

(assert (= (or b!25667 b!25663) bm!2481))

(assert (= (or b!25667 b!25663) bm!2475))

(assert (= (or b!25667 b!25663) bm!2479))

(assert (= (or b!25667 b!25663) bm!2480))

(assert (= (or b!25667 b!25663) bm!2484))

(assert (= (or b!25667 b!25663) bm!2476))

(assert (= (or b!25667 b!25663) bm!2486))

(assert (= (or b!25667 b!25663) bm!2482))

(assert (= (or b!25667 b!25663) bm!2477))

(assert (= (or b!25667 b!25663) bm!2483))

(assert (= (or b!25667 b!25663) bm!2474))

(assert (= (or b!25667 b!25663) bm!2478))

(assert (= (and b!25670 c!3624) b!25668))

(assert (= (and b!25670 (not c!3624)) b!25673))

(assert (= (or b!25667 b!25668) bm!2485))

(assert (= (and d!4779 (not res!15320)) b!25671))

(assert (= (and b!25671 res!15319) b!25669))

(declare-fun b_lambda!1663 () Bool)

(assert (=> (not b_lambda!1663) (not d!4779)))

(assert (=> d!4779 t!3250))

(declare-fun b_and!1571 () Bool)

(assert (= b_and!1569 (and (=> t!3250 result!1111) b_and!1571)))

(declare-fun m!20647 () Bool)

(assert (=> d!4779 m!20647))

(declare-fun m!20649 () Bool)

(assert (=> d!4779 m!20649))

(assert (=> d!4779 m!20557))

(declare-fun m!20651 () Bool)

(assert (=> d!4779 m!20651))

(declare-fun m!20653 () Bool)

(assert (=> d!4779 m!20653))

(assert (=> d!4779 m!20427))

(assert (=> d!4779 m!20557))

(assert (=> d!4779 m!20649))

(declare-fun m!20655 () Bool)

(assert (=> bm!2483 m!20655))

(declare-fun m!20657 () Bool)

(assert (=> bm!2474 m!20657))

(declare-fun m!20659 () Bool)

(assert (=> bm!2480 m!20659))

(declare-fun m!20661 () Bool)

(assert (=> bm!2481 m!20661))

(declare-fun m!20663 () Bool)

(assert (=> b!25669 m!20663))

(assert (=> b!25669 m!20645))

(declare-fun m!20665 () Bool)

(assert (=> bm!2484 m!20665))

(declare-fun m!20667 () Bool)

(assert (=> bm!2478 m!20667))

(declare-fun m!20669 () Bool)

(assert (=> bm!2482 m!20669))

(declare-fun m!20671 () Bool)

(assert (=> bm!2477 m!20671))

(declare-fun m!20673 () Bool)

(assert (=> bm!2479 m!20673))

(declare-fun m!20675 () Bool)

(assert (=> bm!2476 m!20675))

(declare-fun m!20677 () Bool)

(assert (=> b!25671 m!20677))

(declare-fun m!20679 () Bool)

(assert (=> b!25660 m!20679))

(declare-fun m!20681 () Bool)

(assert (=> bm!2486 m!20681))

(declare-fun m!20683 () Bool)

(assert (=> b!25662 m!20683))

(declare-fun m!20685 () Bool)

(assert (=> b!25662 m!20685))

(declare-fun m!20687 () Bool)

(assert (=> bm!2475 m!20687))

(declare-fun m!20689 () Bool)

(assert (=> bm!2485 m!20689))

(declare-fun m!20691 () Bool)

(assert (=> b!25666 m!20691))

(declare-fun m!20693 () Bool)

(assert (=> b!25666 m!20693))

(declare-fun m!20695 () Bool)

(assert (=> b!25666 m!20695))

(declare-fun m!20697 () Bool)

(assert (=> b!25666 m!20697))

(declare-fun m!20699 () Bool)

(assert (=> b!25666 m!20699))

(assert (=> b!25338 d!4779))

(declare-fun condMapEmpty!1057 () Bool)

(declare-fun mapDefault!1057 () ValueCell!317)

(assert (=> mapNonEmpty!1048 (= condMapEmpty!1057 (= mapRest!1048 ((as const (Array (_ BitVec 32) ValueCell!317)) mapDefault!1057)))))

(declare-fun e!16585 () Bool)

(declare-fun mapRes!1057 () Bool)

(assert (=> mapNonEmpty!1048 (= tp!3562 (and e!16585 mapRes!1057))))

(declare-fun b!25681 () Bool)

(assert (=> b!25681 (= e!16585 tp_is_empty!1033)))

(declare-fun mapIsEmpty!1057 () Bool)

(assert (=> mapIsEmpty!1057 mapRes!1057))

(declare-fun b!25680 () Bool)

(declare-fun e!16586 () Bool)

(assert (=> b!25680 (= e!16586 tp_is_empty!1033)))

(declare-fun mapNonEmpty!1057 () Bool)

(declare-fun tp!3577 () Bool)

(assert (=> mapNonEmpty!1057 (= mapRes!1057 (and tp!3577 e!16586))))

(declare-fun mapValue!1057 () ValueCell!317)

(declare-fun mapRest!1057 () (Array (_ BitVec 32) ValueCell!317))

(declare-fun mapKey!1057 () (_ BitVec 32))

(assert (=> mapNonEmpty!1057 (= mapRest!1048 (store mapRest!1057 mapKey!1057 mapValue!1057))))

(assert (= (and mapNonEmpty!1048 condMapEmpty!1057) mapIsEmpty!1057))

(assert (= (and mapNonEmpty!1048 (not condMapEmpty!1057)) mapNonEmpty!1057))

(assert (= (and mapNonEmpty!1057 ((_ is ValueCellFull!317) mapValue!1057)) b!25680))

(assert (= (and mapNonEmpty!1048 ((_ is ValueCellFull!317) mapDefault!1057)) b!25681))

(declare-fun m!20701 () Bool)

(assert (=> mapNonEmpty!1057 m!20701))

(declare-fun b_lambda!1665 () Bool)

(assert (= b_lambda!1663 (or (and b!25331 b_free!769) b_lambda!1665)))

(declare-fun b_lambda!1667 () Bool)

(assert (= b_lambda!1659 (or (and b!25331 b_free!769) b_lambda!1667)))

(declare-fun b_lambda!1669 () Bool)

(assert (= b_lambda!1661 (or (and b!25331 b_free!769) b_lambda!1669)))

(check-sat b_and!1571 (not bm!2482) (not bm!2408) (not b!25612) (not bm!2441) (not b!25623) (not bm!2415) (not b_lambda!1667) (not b!25602) (not bm!2431) (not b!25671) (not b!25608) (not b!25589) (not bm!2484) (not bm!2417) (not d!4767) (not bm!2433) (not bm!2477) (not bm!2407) (not b!25533) (not bm!2481) (not d!4761) (not bm!2409) (not d!4773) (not b!25554) (not bm!2429) (not b!25604) (not b!25539) (not bm!2437) (not b!25598) (not bm!2445) (not bm!2485) (not mapNonEmpty!1057) (not bm!2401) (not b!25529) (not bm!2478) (not b!25662) (not bm!2439) (not bm!2480) (not d!4769) (not d!4771) (not bm!2421) (not bm!2474) (not b_next!769) (not bm!2411) (not bm!2432) (not bm!2479) (not b_lambda!1669) (not bm!2416) (not b!25625) (not bm!2435) (not bm!2444) (not d!4777) (not b!25535) (not bm!2475) (not b!25556) (not bm!2486) (not bm!2476) (not bm!2413) (not b!25669) (not d!4775) (not b!25660) tp_is_empty!1033 (not bm!2440) (not b!25575) (not bm!2420) (not b!25543) (not bm!2425) (not bm!2405) (not b!25579) (not bm!2483) (not b!25666) (not b!25576) (not b_lambda!1665) (not d!4779))
(check-sat b_and!1571 (not b_next!769))
