; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90900 () Bool)

(assert start!90900)

(declare-fun b!1038291 () Bool)

(declare-fun b_free!20881 () Bool)

(declare-fun b_next!20881 () Bool)

(assert (=> b!1038291 (= b_free!20881 (not b_next!20881))))

(declare-fun tp!73782 () Bool)

(declare-fun b_and!33423 () Bool)

(assert (=> b!1038291 (= tp!73782 b_and!33423)))

(declare-fun tp_is_empty!24601 () Bool)

(declare-fun e!587349 () Bool)

(declare-datatypes ((V!37675 0))(
  ( (V!37676 (val!12351 Int)) )
))
(declare-datatypes ((ValueCell!11597 0))(
  ( (ValueCellFull!11597 (v!14930 V!37675)) (EmptyCell!11597) )
))
(declare-datatypes ((array!65351 0))(
  ( (array!65352 (arr!31453 (Array (_ BitVec 32) (_ BitVec 64))) (size!31983 (_ BitVec 32))) )
))
(declare-datatypes ((array!65353 0))(
  ( (array!65354 (arr!31454 (Array (_ BitVec 32) ValueCell!11597)) (size!31984 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5788 0))(
  ( (LongMapFixedSize!5789 (defaultEntry!6276 Int) (mask!30242 (_ BitVec 32)) (extraKeys!6004 (_ BitVec 32)) (zeroValue!6110 V!37675) (minValue!6110 V!37675) (_size!2949 (_ BitVec 32)) (_keys!11505 array!65351) (_values!6299 array!65353) (_vacant!2949 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5788)

(declare-fun e!587345 () Bool)

(declare-fun array_inv!24337 (array!65351) Bool)

(declare-fun array_inv!24338 (array!65353) Bool)

(assert (=> b!1038291 (= e!587345 (and tp!73782 tp_is_empty!24601 (array_inv!24337 (_keys!11505 thiss!1427)) (array_inv!24338 (_values!6299 thiss!1427)) e!587349))))

(declare-fun b!1038292 () Bool)

(declare-fun e!587352 () Bool)

(assert (=> b!1038292 (= e!587352 (bvsge (size!31983 (_keys!11505 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038293 () Bool)

(declare-fun e!587351 () Bool)

(assert (=> b!1038293 (= e!587351 tp_is_empty!24601)))

(declare-fun res!692506 () Bool)

(declare-fun e!587347 () Bool)

(assert (=> start!90900 (=> (not res!692506) (not e!587347))))

(declare-fun valid!2188 (LongMapFixedSize!5788) Bool)

(assert (=> start!90900 (= res!692506 (valid!2188 thiss!1427))))

(assert (=> start!90900 e!587347))

(assert (=> start!90900 e!587345))

(assert (=> start!90900 true))

(declare-fun mapNonEmpty!38423 () Bool)

(declare-fun mapRes!38423 () Bool)

(declare-fun tp!73781 () Bool)

(declare-fun e!587346 () Bool)

(assert (=> mapNonEmpty!38423 (= mapRes!38423 (and tp!73781 e!587346))))

(declare-fun mapRest!38423 () (Array (_ BitVec 32) ValueCell!11597))

(declare-fun mapKey!38423 () (_ BitVec 32))

(declare-fun mapValue!38423 () ValueCell!11597)

(assert (=> mapNonEmpty!38423 (= (arr!31454 (_values!6299 thiss!1427)) (store mapRest!38423 mapKey!38423 mapValue!38423))))

(declare-fun b!1038294 () Bool)

(declare-fun e!587348 () Bool)

(assert (=> b!1038294 (= e!587347 e!587348)))

(declare-fun res!692508 () Bool)

(assert (=> b!1038294 (=> (not res!692508) (not e!587348))))

(declare-datatypes ((SeekEntryResult!9704 0))(
  ( (MissingZero!9704 (index!41187 (_ BitVec 32))) (Found!9704 (index!41188 (_ BitVec 32))) (Intermediate!9704 (undefined!10516 Bool) (index!41189 (_ BitVec 32)) (x!92468 (_ BitVec 32))) (Undefined!9704) (MissingVacant!9704 (index!41190 (_ BitVec 32))) )
))
(declare-fun lt!457881 () SeekEntryResult!9704)

(get-info :version)

(assert (=> b!1038294 (= res!692508 ((_ is Found!9704) lt!457881))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65351 (_ BitVec 32)) SeekEntryResult!9704)

(assert (=> b!1038294 (= lt!457881 (seekEntry!0 key!909 (_keys!11505 thiss!1427) (mask!30242 thiss!1427)))))

(declare-fun b!1038295 () Bool)

(declare-fun res!692507 () Bool)

(assert (=> b!1038295 (=> (not res!692507) (not e!587347))))

(assert (=> b!1038295 (= res!692507 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038296 () Bool)

(assert (=> b!1038296 (= e!587348 e!587352)))

(declare-fun res!692510 () Bool)

(assert (=> b!1038296 (=> res!692510 e!587352)))

(assert (=> b!1038296 (= res!692510 (or (bvslt (index!41188 lt!457881) #b00000000000000000000000000000000) (bvsge (index!41188 lt!457881) (size!31983 (_keys!11505 thiss!1427)))))))

(declare-fun b!1038297 () Bool)

(declare-fun res!692509 () Bool)

(assert (=> b!1038297 (=> res!692509 e!587352)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038297 (= res!692509 (not (validKeyInArray!0 (select (arr!31453 (_keys!11505 thiss!1427)) (index!41188 lt!457881)))))))

(declare-fun b!1038298 () Bool)

(assert (=> b!1038298 (= e!587349 (and e!587351 mapRes!38423))))

(declare-fun condMapEmpty!38423 () Bool)

(declare-fun mapDefault!38423 () ValueCell!11597)

(assert (=> b!1038298 (= condMapEmpty!38423 (= (arr!31454 (_values!6299 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11597)) mapDefault!38423)))))

(declare-fun b!1038299 () Bool)

(assert (=> b!1038299 (= e!587346 tp_is_empty!24601)))

(declare-fun mapIsEmpty!38423 () Bool)

(assert (=> mapIsEmpty!38423 mapRes!38423))

(assert (= (and start!90900 res!692506) b!1038295))

(assert (= (and b!1038295 res!692507) b!1038294))

(assert (= (and b!1038294 res!692508) b!1038296))

(assert (= (and b!1038296 (not res!692510)) b!1038297))

(assert (= (and b!1038297 (not res!692509)) b!1038292))

(assert (= (and b!1038298 condMapEmpty!38423) mapIsEmpty!38423))

(assert (= (and b!1038298 (not condMapEmpty!38423)) mapNonEmpty!38423))

(assert (= (and mapNonEmpty!38423 ((_ is ValueCellFull!11597) mapValue!38423)) b!1038299))

(assert (= (and b!1038298 ((_ is ValueCellFull!11597) mapDefault!38423)) b!1038293))

(assert (= b!1038291 b!1038298))

(assert (= start!90900 b!1038291))

(declare-fun m!959015 () Bool)

(assert (=> b!1038297 m!959015))

(assert (=> b!1038297 m!959015))

(declare-fun m!959017 () Bool)

(assert (=> b!1038297 m!959017))

(declare-fun m!959019 () Bool)

(assert (=> mapNonEmpty!38423 m!959019))

(declare-fun m!959021 () Bool)

(assert (=> b!1038291 m!959021))

(declare-fun m!959023 () Bool)

(assert (=> b!1038291 m!959023))

(declare-fun m!959025 () Bool)

(assert (=> b!1038294 m!959025))

(declare-fun m!959027 () Bool)

(assert (=> start!90900 m!959027))

(check-sat tp_is_empty!24601 (not b!1038297) (not b!1038294) b_and!33423 (not b!1038291) (not start!90900) (not b_next!20881) (not mapNonEmpty!38423))
(check-sat b_and!33423 (not b_next!20881))
(get-model)

(declare-fun b!1038366 () Bool)

(declare-fun e!587409 () SeekEntryResult!9704)

(declare-fun lt!457899 () SeekEntryResult!9704)

(assert (=> b!1038366 (= e!587409 (Found!9704 (index!41189 lt!457899)))))

(declare-fun d!125641 () Bool)

(declare-fun lt!457897 () SeekEntryResult!9704)

(assert (=> d!125641 (and (or ((_ is MissingVacant!9704) lt!457897) (not ((_ is Found!9704) lt!457897)) (and (bvsge (index!41188 lt!457897) #b00000000000000000000000000000000) (bvslt (index!41188 lt!457897) (size!31983 (_keys!11505 thiss!1427))))) (not ((_ is MissingVacant!9704) lt!457897)) (or (not ((_ is Found!9704) lt!457897)) (= (select (arr!31453 (_keys!11505 thiss!1427)) (index!41188 lt!457897)) key!909)))))

(declare-fun e!587408 () SeekEntryResult!9704)

(assert (=> d!125641 (= lt!457897 e!587408)))

(declare-fun c!105469 () Bool)

(assert (=> d!125641 (= c!105469 (and ((_ is Intermediate!9704) lt!457899) (undefined!10516 lt!457899)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65351 (_ BitVec 32)) SeekEntryResult!9704)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125641 (= lt!457899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30242 thiss!1427)) key!909 (_keys!11505 thiss!1427) (mask!30242 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125641 (validMask!0 (mask!30242 thiss!1427))))

(assert (=> d!125641 (= (seekEntry!0 key!909 (_keys!11505 thiss!1427) (mask!30242 thiss!1427)) lt!457897)))

(declare-fun b!1038367 () Bool)

(assert (=> b!1038367 (= e!587408 Undefined!9704)))

(declare-fun b!1038368 () Bool)

(declare-fun e!587407 () SeekEntryResult!9704)

(declare-fun lt!457898 () SeekEntryResult!9704)

(assert (=> b!1038368 (= e!587407 (ite ((_ is MissingVacant!9704) lt!457898) (MissingZero!9704 (index!41190 lt!457898)) lt!457898))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65351 (_ BitVec 32)) SeekEntryResult!9704)

(assert (=> b!1038368 (= lt!457898 (seekKeyOrZeroReturnVacant!0 (x!92468 lt!457899) (index!41189 lt!457899) (index!41189 lt!457899) key!909 (_keys!11505 thiss!1427) (mask!30242 thiss!1427)))))

(declare-fun b!1038369 () Bool)

(assert (=> b!1038369 (= e!587408 e!587409)))

(declare-fun lt!457896 () (_ BitVec 64))

(assert (=> b!1038369 (= lt!457896 (select (arr!31453 (_keys!11505 thiss!1427)) (index!41189 lt!457899)))))

(declare-fun c!105468 () Bool)

(assert (=> b!1038369 (= c!105468 (= lt!457896 key!909))))

(declare-fun b!1038370 () Bool)

(declare-fun c!105470 () Bool)

(assert (=> b!1038370 (= c!105470 (= lt!457896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038370 (= e!587409 e!587407)))

(declare-fun b!1038371 () Bool)

(assert (=> b!1038371 (= e!587407 (MissingZero!9704 (index!41189 lt!457899)))))

(assert (= (and d!125641 c!105469) b!1038367))

(assert (= (and d!125641 (not c!105469)) b!1038369))

(assert (= (and b!1038369 c!105468) b!1038366))

(assert (= (and b!1038369 (not c!105468)) b!1038370))

(assert (= (and b!1038370 c!105470) b!1038371))

(assert (= (and b!1038370 (not c!105470)) b!1038368))

(declare-fun m!959057 () Bool)

(assert (=> d!125641 m!959057))

(declare-fun m!959059 () Bool)

(assert (=> d!125641 m!959059))

(assert (=> d!125641 m!959059))

(declare-fun m!959061 () Bool)

(assert (=> d!125641 m!959061))

(declare-fun m!959063 () Bool)

(assert (=> d!125641 m!959063))

(declare-fun m!959065 () Bool)

(assert (=> b!1038368 m!959065))

(declare-fun m!959067 () Bool)

(assert (=> b!1038369 m!959067))

(assert (=> b!1038294 d!125641))

(declare-fun d!125643 () Bool)

(assert (=> d!125643 (= (array_inv!24337 (_keys!11505 thiss!1427)) (bvsge (size!31983 (_keys!11505 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038291 d!125643))

(declare-fun d!125645 () Bool)

(assert (=> d!125645 (= (array_inv!24338 (_values!6299 thiss!1427)) (bvsge (size!31984 (_values!6299 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038291 d!125645))

(declare-fun d!125647 () Bool)

(declare-fun res!692547 () Bool)

(declare-fun e!587412 () Bool)

(assert (=> d!125647 (=> (not res!692547) (not e!587412))))

(declare-fun simpleValid!415 (LongMapFixedSize!5788) Bool)

(assert (=> d!125647 (= res!692547 (simpleValid!415 thiss!1427))))

(assert (=> d!125647 (= (valid!2188 thiss!1427) e!587412)))

(declare-fun b!1038378 () Bool)

(declare-fun res!692548 () Bool)

(assert (=> b!1038378 (=> (not res!692548) (not e!587412))))

(declare-fun arrayCountValidKeys!0 (array!65351 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038378 (= res!692548 (= (arrayCountValidKeys!0 (_keys!11505 thiss!1427) #b00000000000000000000000000000000 (size!31983 (_keys!11505 thiss!1427))) (_size!2949 thiss!1427)))))

(declare-fun b!1038379 () Bool)

(declare-fun res!692549 () Bool)

(assert (=> b!1038379 (=> (not res!692549) (not e!587412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65351 (_ BitVec 32)) Bool)

(assert (=> b!1038379 (= res!692549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11505 thiss!1427) (mask!30242 thiss!1427)))))

(declare-fun b!1038380 () Bool)

(declare-datatypes ((List!21906 0))(
  ( (Nil!21903) (Cons!21902 (h!23113 (_ BitVec 64)) (t!31112 List!21906)) )
))
(declare-fun arrayNoDuplicates!0 (array!65351 (_ BitVec 32) List!21906) Bool)

(assert (=> b!1038380 (= e!587412 (arrayNoDuplicates!0 (_keys!11505 thiss!1427) #b00000000000000000000000000000000 Nil!21903))))

(assert (= (and d!125647 res!692547) b!1038378))

(assert (= (and b!1038378 res!692548) b!1038379))

(assert (= (and b!1038379 res!692549) b!1038380))

(declare-fun m!959069 () Bool)

(assert (=> d!125647 m!959069))

(declare-fun m!959071 () Bool)

(assert (=> b!1038378 m!959071))

(declare-fun m!959073 () Bool)

(assert (=> b!1038379 m!959073))

(declare-fun m!959075 () Bool)

(assert (=> b!1038380 m!959075))

(assert (=> start!90900 d!125647))

(declare-fun d!125649 () Bool)

(assert (=> d!125649 (= (validKeyInArray!0 (select (arr!31453 (_keys!11505 thiss!1427)) (index!41188 lt!457881))) (and (not (= (select (arr!31453 (_keys!11505 thiss!1427)) (index!41188 lt!457881)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31453 (_keys!11505 thiss!1427)) (index!41188 lt!457881)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1038297 d!125649))

(declare-fun mapNonEmpty!38432 () Bool)

(declare-fun mapRes!38432 () Bool)

(declare-fun tp!73797 () Bool)

(declare-fun e!587418 () Bool)

(assert (=> mapNonEmpty!38432 (= mapRes!38432 (and tp!73797 e!587418))))

(declare-fun mapRest!38432 () (Array (_ BitVec 32) ValueCell!11597))

(declare-fun mapKey!38432 () (_ BitVec 32))

(declare-fun mapValue!38432 () ValueCell!11597)

(assert (=> mapNonEmpty!38432 (= mapRest!38423 (store mapRest!38432 mapKey!38432 mapValue!38432))))

(declare-fun mapIsEmpty!38432 () Bool)

(assert (=> mapIsEmpty!38432 mapRes!38432))

(declare-fun b!1038388 () Bool)

(declare-fun e!587417 () Bool)

(assert (=> b!1038388 (= e!587417 tp_is_empty!24601)))

(declare-fun b!1038387 () Bool)

(assert (=> b!1038387 (= e!587418 tp_is_empty!24601)))

(declare-fun condMapEmpty!38432 () Bool)

(declare-fun mapDefault!38432 () ValueCell!11597)

(assert (=> mapNonEmpty!38423 (= condMapEmpty!38432 (= mapRest!38423 ((as const (Array (_ BitVec 32) ValueCell!11597)) mapDefault!38432)))))

(assert (=> mapNonEmpty!38423 (= tp!73781 (and e!587417 mapRes!38432))))

(assert (= (and mapNonEmpty!38423 condMapEmpty!38432) mapIsEmpty!38432))

(assert (= (and mapNonEmpty!38423 (not condMapEmpty!38432)) mapNonEmpty!38432))

(assert (= (and mapNonEmpty!38432 ((_ is ValueCellFull!11597) mapValue!38432)) b!1038387))

(assert (= (and mapNonEmpty!38423 ((_ is ValueCellFull!11597) mapDefault!38432)) b!1038388))

(declare-fun m!959077 () Bool)

(assert (=> mapNonEmpty!38432 m!959077))

(check-sat tp_is_empty!24601 (not b_next!20881) (not b!1038380) (not d!125641) b_and!33423 (not b!1038379) (not b!1038378) (not b!1038368) (not d!125647) (not mapNonEmpty!38432))
(check-sat b_and!33423 (not b_next!20881))
(get-model)

(declare-fun bm!43969 () Bool)

(declare-fun call!43972 () (_ BitVec 32))

(assert (=> bm!43969 (= call!43972 (arrayCountValidKeys!0 (_keys!11505 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31983 (_keys!11505 thiss!1427))))))

(declare-fun b!1038397 () Bool)

(declare-fun e!587423 () (_ BitVec 32))

(assert (=> b!1038397 (= e!587423 #b00000000000000000000000000000000)))

(declare-fun b!1038398 () Bool)

(declare-fun e!587424 () (_ BitVec 32))

(assert (=> b!1038398 (= e!587424 call!43972)))

(declare-fun b!1038399 () Bool)

(assert (=> b!1038399 (= e!587424 (bvadd #b00000000000000000000000000000001 call!43972))))

(declare-fun d!125651 () Bool)

(declare-fun lt!457902 () (_ BitVec 32))

(assert (=> d!125651 (and (bvsge lt!457902 #b00000000000000000000000000000000) (bvsle lt!457902 (bvsub (size!31983 (_keys!11505 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125651 (= lt!457902 e!587423)))

(declare-fun c!105475 () Bool)

(assert (=> d!125651 (= c!105475 (bvsge #b00000000000000000000000000000000 (size!31983 (_keys!11505 thiss!1427))))))

(assert (=> d!125651 (and (bvsle #b00000000000000000000000000000000 (size!31983 (_keys!11505 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31983 (_keys!11505 thiss!1427)) (size!31983 (_keys!11505 thiss!1427))))))

(assert (=> d!125651 (= (arrayCountValidKeys!0 (_keys!11505 thiss!1427) #b00000000000000000000000000000000 (size!31983 (_keys!11505 thiss!1427))) lt!457902)))

(declare-fun b!1038400 () Bool)

(assert (=> b!1038400 (= e!587423 e!587424)))

(declare-fun c!105476 () Bool)

(assert (=> b!1038400 (= c!105476 (validKeyInArray!0 (select (arr!31453 (_keys!11505 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125651 c!105475) b!1038397))

(assert (= (and d!125651 (not c!105475)) b!1038400))

(assert (= (and b!1038400 c!105476) b!1038399))

(assert (= (and b!1038400 (not c!105476)) b!1038398))

(assert (= (or b!1038399 b!1038398) bm!43969))

(declare-fun m!959079 () Bool)

(assert (=> bm!43969 m!959079))

(declare-fun m!959081 () Bool)

(assert (=> b!1038400 m!959081))

(assert (=> b!1038400 m!959081))

(declare-fun m!959083 () Bool)

(assert (=> b!1038400 m!959083))

(assert (=> b!1038378 d!125651))

(declare-fun lt!457908 () SeekEntryResult!9704)

(declare-fun d!125653 () Bool)

(assert (=> d!125653 (and (or ((_ is Undefined!9704) lt!457908) (not ((_ is Found!9704) lt!457908)) (and (bvsge (index!41188 lt!457908) #b00000000000000000000000000000000) (bvslt (index!41188 lt!457908) (size!31983 (_keys!11505 thiss!1427))))) (or ((_ is Undefined!9704) lt!457908) ((_ is Found!9704) lt!457908) (not ((_ is MissingVacant!9704) lt!457908)) (not (= (index!41190 lt!457908) (index!41189 lt!457899))) (and (bvsge (index!41190 lt!457908) #b00000000000000000000000000000000) (bvslt (index!41190 lt!457908) (size!31983 (_keys!11505 thiss!1427))))) (or ((_ is Undefined!9704) lt!457908) (ite ((_ is Found!9704) lt!457908) (= (select (arr!31453 (_keys!11505 thiss!1427)) (index!41188 lt!457908)) key!909) (and ((_ is MissingVacant!9704) lt!457908) (= (index!41190 lt!457908) (index!41189 lt!457899)) (= (select (arr!31453 (_keys!11505 thiss!1427)) (index!41190 lt!457908)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!587431 () SeekEntryResult!9704)

(assert (=> d!125653 (= lt!457908 e!587431)))

(declare-fun c!105483 () Bool)

(assert (=> d!125653 (= c!105483 (bvsge (x!92468 lt!457899) #b01111111111111111111111111111110))))

(declare-fun lt!457907 () (_ BitVec 64))

(assert (=> d!125653 (= lt!457907 (select (arr!31453 (_keys!11505 thiss!1427)) (index!41189 lt!457899)))))

(assert (=> d!125653 (validMask!0 (mask!30242 thiss!1427))))

(assert (=> d!125653 (= (seekKeyOrZeroReturnVacant!0 (x!92468 lt!457899) (index!41189 lt!457899) (index!41189 lt!457899) key!909 (_keys!11505 thiss!1427) (mask!30242 thiss!1427)) lt!457908)))

(declare-fun b!1038413 () Bool)

(declare-fun e!587432 () SeekEntryResult!9704)

(assert (=> b!1038413 (= e!587432 (MissingVacant!9704 (index!41189 lt!457899)))))

(declare-fun b!1038414 () Bool)

(declare-fun c!105485 () Bool)

(assert (=> b!1038414 (= c!105485 (= lt!457907 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587433 () SeekEntryResult!9704)

(assert (=> b!1038414 (= e!587433 e!587432)))

(declare-fun b!1038415 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038415 (= e!587432 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92468 lt!457899) #b00000000000000000000000000000001) (nextIndex!0 (index!41189 lt!457899) (bvadd (x!92468 lt!457899) #b00000000000000000000000000000001) (mask!30242 thiss!1427)) (index!41189 lt!457899) key!909 (_keys!11505 thiss!1427) (mask!30242 thiss!1427)))))

(declare-fun b!1038416 () Bool)

(assert (=> b!1038416 (= e!587433 (Found!9704 (index!41189 lt!457899)))))

(declare-fun b!1038417 () Bool)

(assert (=> b!1038417 (= e!587431 e!587433)))

(declare-fun c!105484 () Bool)

(assert (=> b!1038417 (= c!105484 (= lt!457907 key!909))))

(declare-fun b!1038418 () Bool)

(assert (=> b!1038418 (= e!587431 Undefined!9704)))

(assert (= (and d!125653 c!105483) b!1038418))

(assert (= (and d!125653 (not c!105483)) b!1038417))

(assert (= (and b!1038417 c!105484) b!1038416))

(assert (= (and b!1038417 (not c!105484)) b!1038414))

(assert (= (and b!1038414 c!105485) b!1038413))

(assert (= (and b!1038414 (not c!105485)) b!1038415))

(declare-fun m!959085 () Bool)

(assert (=> d!125653 m!959085))

(declare-fun m!959087 () Bool)

(assert (=> d!125653 m!959087))

(assert (=> d!125653 m!959067))

(assert (=> d!125653 m!959063))

(declare-fun m!959089 () Bool)

(assert (=> b!1038415 m!959089))

(assert (=> b!1038415 m!959089))

(declare-fun m!959091 () Bool)

(assert (=> b!1038415 m!959091))

(assert (=> b!1038368 d!125653))

(declare-fun d!125655 () Bool)

(declare-fun res!692560 () Bool)

(declare-fun e!587436 () Bool)

(assert (=> d!125655 (=> (not res!692560) (not e!587436))))

(assert (=> d!125655 (= res!692560 (validMask!0 (mask!30242 thiss!1427)))))

(assert (=> d!125655 (= (simpleValid!415 thiss!1427) e!587436)))

(declare-fun b!1038430 () Bool)

(assert (=> b!1038430 (= e!587436 (and (bvsge (extraKeys!6004 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6004 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2949 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1038428 () Bool)

(declare-fun res!692558 () Bool)

(assert (=> b!1038428 (=> (not res!692558) (not e!587436))))

(declare-fun size!31989 (LongMapFixedSize!5788) (_ BitVec 32))

(assert (=> b!1038428 (= res!692558 (bvsge (size!31989 thiss!1427) (_size!2949 thiss!1427)))))

(declare-fun b!1038427 () Bool)

(declare-fun res!692561 () Bool)

(assert (=> b!1038427 (=> (not res!692561) (not e!587436))))

(assert (=> b!1038427 (= res!692561 (and (= (size!31984 (_values!6299 thiss!1427)) (bvadd (mask!30242 thiss!1427) #b00000000000000000000000000000001)) (= (size!31983 (_keys!11505 thiss!1427)) (size!31984 (_values!6299 thiss!1427))) (bvsge (_size!2949 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2949 thiss!1427) (bvadd (mask!30242 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1038429 () Bool)

(declare-fun res!692559 () Bool)

(assert (=> b!1038429 (=> (not res!692559) (not e!587436))))

(assert (=> b!1038429 (= res!692559 (= (size!31989 thiss!1427) (bvadd (_size!2949 thiss!1427) (bvsdiv (bvadd (extraKeys!6004 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!125655 res!692560) b!1038427))

(assert (= (and b!1038427 res!692561) b!1038428))

(assert (= (and b!1038428 res!692558) b!1038429))

(assert (= (and b!1038429 res!692559) b!1038430))

(assert (=> d!125655 m!959063))

(declare-fun m!959093 () Bool)

(assert (=> b!1038428 m!959093))

(assert (=> b!1038429 m!959093))

(assert (=> d!125647 d!125655))

(declare-fun b!1038439 () Bool)

(declare-fun e!587444 () Bool)

(declare-fun call!43975 () Bool)

(assert (=> b!1038439 (= e!587444 call!43975)))

(declare-fun bm!43972 () Bool)

(assert (=> bm!43972 (= call!43975 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11505 thiss!1427) (mask!30242 thiss!1427)))))

(declare-fun d!125657 () Bool)

(declare-fun res!692567 () Bool)

(declare-fun e!587445 () Bool)

(assert (=> d!125657 (=> res!692567 e!587445)))

(assert (=> d!125657 (= res!692567 (bvsge #b00000000000000000000000000000000 (size!31983 (_keys!11505 thiss!1427))))))

(assert (=> d!125657 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11505 thiss!1427) (mask!30242 thiss!1427)) e!587445)))

(declare-fun b!1038440 () Bool)

(declare-fun e!587443 () Bool)

(assert (=> b!1038440 (= e!587444 e!587443)))

(declare-fun lt!457916 () (_ BitVec 64))

(assert (=> b!1038440 (= lt!457916 (select (arr!31453 (_keys!11505 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33945 0))(
  ( (Unit!33946) )
))
(declare-fun lt!457917 () Unit!33945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65351 (_ BitVec 64) (_ BitVec 32)) Unit!33945)

(assert (=> b!1038440 (= lt!457917 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11505 thiss!1427) lt!457916 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1038440 (arrayContainsKey!0 (_keys!11505 thiss!1427) lt!457916 #b00000000000000000000000000000000)))

(declare-fun lt!457915 () Unit!33945)

(assert (=> b!1038440 (= lt!457915 lt!457917)))

(declare-fun res!692566 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65351 (_ BitVec 32)) SeekEntryResult!9704)

(assert (=> b!1038440 (= res!692566 (= (seekEntryOrOpen!0 (select (arr!31453 (_keys!11505 thiss!1427)) #b00000000000000000000000000000000) (_keys!11505 thiss!1427) (mask!30242 thiss!1427)) (Found!9704 #b00000000000000000000000000000000)))))

(assert (=> b!1038440 (=> (not res!692566) (not e!587443))))

(declare-fun b!1038441 () Bool)

(assert (=> b!1038441 (= e!587445 e!587444)))

(declare-fun c!105488 () Bool)

(assert (=> b!1038441 (= c!105488 (validKeyInArray!0 (select (arr!31453 (_keys!11505 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038442 () Bool)

(assert (=> b!1038442 (= e!587443 call!43975)))

(assert (= (and d!125657 (not res!692567)) b!1038441))

(assert (= (and b!1038441 c!105488) b!1038440))

(assert (= (and b!1038441 (not c!105488)) b!1038439))

(assert (= (and b!1038440 res!692566) b!1038442))

(assert (= (or b!1038442 b!1038439) bm!43972))

(declare-fun m!959095 () Bool)

(assert (=> bm!43972 m!959095))

(assert (=> b!1038440 m!959081))

(declare-fun m!959097 () Bool)

(assert (=> b!1038440 m!959097))

(declare-fun m!959099 () Bool)

(assert (=> b!1038440 m!959099))

(assert (=> b!1038440 m!959081))

(declare-fun m!959101 () Bool)

(assert (=> b!1038440 m!959101))

(assert (=> b!1038441 m!959081))

(assert (=> b!1038441 m!959081))

(assert (=> b!1038441 m!959083))

(assert (=> b!1038379 d!125657))

(declare-fun b!1038461 () Bool)

(declare-fun e!587460 () SeekEntryResult!9704)

(declare-fun e!587458 () SeekEntryResult!9704)

(assert (=> b!1038461 (= e!587460 e!587458)))

(declare-fun c!105495 () Bool)

(declare-fun lt!457923 () (_ BitVec 64))

(assert (=> b!1038461 (= c!105495 (or (= lt!457923 key!909) (= (bvadd lt!457923 lt!457923) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1038462 () Bool)

(declare-fun lt!457922 () SeekEntryResult!9704)

(assert (=> b!1038462 (and (bvsge (index!41189 lt!457922) #b00000000000000000000000000000000) (bvslt (index!41189 lt!457922) (size!31983 (_keys!11505 thiss!1427))))))

(declare-fun res!692576 () Bool)

(assert (=> b!1038462 (= res!692576 (= (select (arr!31453 (_keys!11505 thiss!1427)) (index!41189 lt!457922)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587459 () Bool)

(assert (=> b!1038462 (=> res!692576 e!587459)))

(declare-fun b!1038463 () Bool)

(declare-fun e!587457 () Bool)

(declare-fun e!587456 () Bool)

(assert (=> b!1038463 (= e!587457 e!587456)))

(declare-fun res!692575 () Bool)

(assert (=> b!1038463 (= res!692575 (and ((_ is Intermediate!9704) lt!457922) (not (undefined!10516 lt!457922)) (bvslt (x!92468 lt!457922) #b01111111111111111111111111111110) (bvsge (x!92468 lt!457922) #b00000000000000000000000000000000) (bvsge (x!92468 lt!457922) #b00000000000000000000000000000000)))))

(assert (=> b!1038463 (=> (not res!692575) (not e!587456))))

(declare-fun b!1038464 () Bool)

(assert (=> b!1038464 (and (bvsge (index!41189 lt!457922) #b00000000000000000000000000000000) (bvslt (index!41189 lt!457922) (size!31983 (_keys!11505 thiss!1427))))))

(assert (=> b!1038464 (= e!587459 (= (select (arr!31453 (_keys!11505 thiss!1427)) (index!41189 lt!457922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!125659 () Bool)

(assert (=> d!125659 e!587457))

(declare-fun c!105497 () Bool)

(assert (=> d!125659 (= c!105497 (and ((_ is Intermediate!9704) lt!457922) (undefined!10516 lt!457922)))))

(assert (=> d!125659 (= lt!457922 e!587460)))

(declare-fun c!105496 () Bool)

(assert (=> d!125659 (= c!105496 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!125659 (= lt!457923 (select (arr!31453 (_keys!11505 thiss!1427)) (toIndex!0 key!909 (mask!30242 thiss!1427))))))

(assert (=> d!125659 (validMask!0 (mask!30242 thiss!1427))))

(assert (=> d!125659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30242 thiss!1427)) key!909 (_keys!11505 thiss!1427) (mask!30242 thiss!1427)) lt!457922)))

(declare-fun b!1038465 () Bool)

(assert (=> b!1038465 (= e!587458 (Intermediate!9704 false (toIndex!0 key!909 (mask!30242 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1038466 () Bool)

(assert (=> b!1038466 (= e!587457 (bvsge (x!92468 lt!457922) #b01111111111111111111111111111110))))

(declare-fun b!1038467 () Bool)

(assert (=> b!1038467 (= e!587460 (Intermediate!9704 true (toIndex!0 key!909 (mask!30242 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1038468 () Bool)

(assert (=> b!1038468 (= e!587458 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30242 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!30242 thiss!1427)) key!909 (_keys!11505 thiss!1427) (mask!30242 thiss!1427)))))

(declare-fun b!1038469 () Bool)

(assert (=> b!1038469 (and (bvsge (index!41189 lt!457922) #b00000000000000000000000000000000) (bvslt (index!41189 lt!457922) (size!31983 (_keys!11505 thiss!1427))))))

(declare-fun res!692574 () Bool)

(assert (=> b!1038469 (= res!692574 (= (select (arr!31453 (_keys!11505 thiss!1427)) (index!41189 lt!457922)) key!909))))

(assert (=> b!1038469 (=> res!692574 e!587459)))

(assert (=> b!1038469 (= e!587456 e!587459)))

(assert (= (and d!125659 c!105496) b!1038467))

(assert (= (and d!125659 (not c!105496)) b!1038461))

(assert (= (and b!1038461 c!105495) b!1038465))

(assert (= (and b!1038461 (not c!105495)) b!1038468))

(assert (= (and d!125659 c!105497) b!1038466))

(assert (= (and d!125659 (not c!105497)) b!1038463))

(assert (= (and b!1038463 res!692575) b!1038469))

(assert (= (and b!1038469 (not res!692574)) b!1038462))

(assert (= (and b!1038462 (not res!692576)) b!1038464))

(assert (=> b!1038468 m!959059))

(declare-fun m!959103 () Bool)

(assert (=> b!1038468 m!959103))

(assert (=> b!1038468 m!959103))

(declare-fun m!959105 () Bool)

(assert (=> b!1038468 m!959105))

(declare-fun m!959107 () Bool)

(assert (=> b!1038469 m!959107))

(assert (=> d!125659 m!959059))

(declare-fun m!959109 () Bool)

(assert (=> d!125659 m!959109))

(assert (=> d!125659 m!959063))

(assert (=> b!1038462 m!959107))

(assert (=> b!1038464 m!959107))

(assert (=> d!125641 d!125659))

(declare-fun d!125661 () Bool)

(declare-fun lt!457929 () (_ BitVec 32))

(declare-fun lt!457928 () (_ BitVec 32))

(assert (=> d!125661 (= lt!457929 (bvmul (bvxor lt!457928 (bvlshr lt!457928 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125661 (= lt!457928 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125661 (and (bvsge (mask!30242 thiss!1427) #b00000000000000000000000000000000) (let ((res!692577 (let ((h!23114 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92487 (bvmul (bvxor h!23114 (bvlshr h!23114 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92487 (bvlshr x!92487 #b00000000000000000000000000001101)) (mask!30242 thiss!1427)))))) (and (bvslt res!692577 (bvadd (mask!30242 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!692577 #b00000000000000000000000000000000))))))

(assert (=> d!125661 (= (toIndex!0 key!909 (mask!30242 thiss!1427)) (bvand (bvxor lt!457929 (bvlshr lt!457929 #b00000000000000000000000000001101)) (mask!30242 thiss!1427)))))

(assert (=> d!125641 d!125661))

(declare-fun d!125663 () Bool)

(assert (=> d!125663 (= (validMask!0 (mask!30242 thiss!1427)) (and (or (= (mask!30242 thiss!1427) #b00000000000000000000000000000111) (= (mask!30242 thiss!1427) #b00000000000000000000000000001111) (= (mask!30242 thiss!1427) #b00000000000000000000000000011111) (= (mask!30242 thiss!1427) #b00000000000000000000000000111111) (= (mask!30242 thiss!1427) #b00000000000000000000000001111111) (= (mask!30242 thiss!1427) #b00000000000000000000000011111111) (= (mask!30242 thiss!1427) #b00000000000000000000000111111111) (= (mask!30242 thiss!1427) #b00000000000000000000001111111111) (= (mask!30242 thiss!1427) #b00000000000000000000011111111111) (= (mask!30242 thiss!1427) #b00000000000000000000111111111111) (= (mask!30242 thiss!1427) #b00000000000000000001111111111111) (= (mask!30242 thiss!1427) #b00000000000000000011111111111111) (= (mask!30242 thiss!1427) #b00000000000000000111111111111111) (= (mask!30242 thiss!1427) #b00000000000000001111111111111111) (= (mask!30242 thiss!1427) #b00000000000000011111111111111111) (= (mask!30242 thiss!1427) #b00000000000000111111111111111111) (= (mask!30242 thiss!1427) #b00000000000001111111111111111111) (= (mask!30242 thiss!1427) #b00000000000011111111111111111111) (= (mask!30242 thiss!1427) #b00000000000111111111111111111111) (= (mask!30242 thiss!1427) #b00000000001111111111111111111111) (= (mask!30242 thiss!1427) #b00000000011111111111111111111111) (= (mask!30242 thiss!1427) #b00000000111111111111111111111111) (= (mask!30242 thiss!1427) #b00000001111111111111111111111111) (= (mask!30242 thiss!1427) #b00000011111111111111111111111111) (= (mask!30242 thiss!1427) #b00000111111111111111111111111111) (= (mask!30242 thiss!1427) #b00001111111111111111111111111111) (= (mask!30242 thiss!1427) #b00011111111111111111111111111111) (= (mask!30242 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30242 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!125641 d!125663))

(declare-fun b!1038480 () Bool)

(declare-fun e!587472 () Bool)

(declare-fun call!43978 () Bool)

(assert (=> b!1038480 (= e!587472 call!43978)))

(declare-fun b!1038481 () Bool)

(declare-fun e!587469 () Bool)

(assert (=> b!1038481 (= e!587469 e!587472)))

(declare-fun c!105500 () Bool)

(assert (=> b!1038481 (= c!105500 (validKeyInArray!0 (select (arr!31453 (_keys!11505 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038482 () Bool)

(declare-fun e!587471 () Bool)

(declare-fun contains!6049 (List!21906 (_ BitVec 64)) Bool)

(assert (=> b!1038482 (= e!587471 (contains!6049 Nil!21903 (select (arr!31453 (_keys!11505 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038483 () Bool)

(assert (=> b!1038483 (= e!587472 call!43978)))

(declare-fun b!1038484 () Bool)

(declare-fun e!587470 () Bool)

(assert (=> b!1038484 (= e!587470 e!587469)))

(declare-fun res!692586 () Bool)

(assert (=> b!1038484 (=> (not res!692586) (not e!587469))))

(assert (=> b!1038484 (= res!692586 (not e!587471))))

(declare-fun res!692585 () Bool)

(assert (=> b!1038484 (=> (not res!692585) (not e!587471))))

(assert (=> b!1038484 (= res!692585 (validKeyInArray!0 (select (arr!31453 (_keys!11505 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43975 () Bool)

(assert (=> bm!43975 (= call!43978 (arrayNoDuplicates!0 (_keys!11505 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105500 (Cons!21902 (select (arr!31453 (_keys!11505 thiss!1427)) #b00000000000000000000000000000000) Nil!21903) Nil!21903)))))

(declare-fun d!125665 () Bool)

(declare-fun res!692584 () Bool)

(assert (=> d!125665 (=> res!692584 e!587470)))

(assert (=> d!125665 (= res!692584 (bvsge #b00000000000000000000000000000000 (size!31983 (_keys!11505 thiss!1427))))))

(assert (=> d!125665 (= (arrayNoDuplicates!0 (_keys!11505 thiss!1427) #b00000000000000000000000000000000 Nil!21903) e!587470)))

(assert (= (and d!125665 (not res!692584)) b!1038484))

(assert (= (and b!1038484 res!692585) b!1038482))

(assert (= (and b!1038484 res!692586) b!1038481))

(assert (= (and b!1038481 c!105500) b!1038480))

(assert (= (and b!1038481 (not c!105500)) b!1038483))

(assert (= (or b!1038480 b!1038483) bm!43975))

(assert (=> b!1038481 m!959081))

(assert (=> b!1038481 m!959081))

(assert (=> b!1038481 m!959083))

(assert (=> b!1038482 m!959081))

(assert (=> b!1038482 m!959081))

(declare-fun m!959111 () Bool)

(assert (=> b!1038482 m!959111))

(assert (=> b!1038484 m!959081))

(assert (=> b!1038484 m!959081))

(assert (=> b!1038484 m!959083))

(assert (=> bm!43975 m!959081))

(declare-fun m!959113 () Bool)

(assert (=> bm!43975 m!959113))

(assert (=> b!1038380 d!125665))

(declare-fun mapNonEmpty!38433 () Bool)

(declare-fun mapRes!38433 () Bool)

(declare-fun tp!73798 () Bool)

(declare-fun e!587474 () Bool)

(assert (=> mapNonEmpty!38433 (= mapRes!38433 (and tp!73798 e!587474))))

(declare-fun mapKey!38433 () (_ BitVec 32))

(declare-fun mapRest!38433 () (Array (_ BitVec 32) ValueCell!11597))

(declare-fun mapValue!38433 () ValueCell!11597)

(assert (=> mapNonEmpty!38433 (= mapRest!38432 (store mapRest!38433 mapKey!38433 mapValue!38433))))

(declare-fun mapIsEmpty!38433 () Bool)

(assert (=> mapIsEmpty!38433 mapRes!38433))

(declare-fun b!1038486 () Bool)

(declare-fun e!587473 () Bool)

(assert (=> b!1038486 (= e!587473 tp_is_empty!24601)))

(declare-fun b!1038485 () Bool)

(assert (=> b!1038485 (= e!587474 tp_is_empty!24601)))

(declare-fun condMapEmpty!38433 () Bool)

(declare-fun mapDefault!38433 () ValueCell!11597)

(assert (=> mapNonEmpty!38432 (= condMapEmpty!38433 (= mapRest!38432 ((as const (Array (_ BitVec 32) ValueCell!11597)) mapDefault!38433)))))

(assert (=> mapNonEmpty!38432 (= tp!73797 (and e!587473 mapRes!38433))))

(assert (= (and mapNonEmpty!38432 condMapEmpty!38433) mapIsEmpty!38433))

(assert (= (and mapNonEmpty!38432 (not condMapEmpty!38433)) mapNonEmpty!38433))

(assert (= (and mapNonEmpty!38433 ((_ is ValueCellFull!11597) mapValue!38433)) b!1038485))

(assert (= (and mapNonEmpty!38432 ((_ is ValueCellFull!11597) mapDefault!38433)) b!1038486))

(declare-fun m!959115 () Bool)

(assert (=> mapNonEmpty!38433 m!959115))

(check-sat tp_is_empty!24601 (not b_next!20881) (not d!125653) (not b!1038440) (not mapNonEmpty!38433) (not bm!43975) (not d!125659) (not b!1038400) (not b!1038482) (not d!125655) (not b!1038441) (not b!1038484) (not bm!43972) (not b!1038481) (not b!1038428) (not b!1038468) (not b!1038415) (not b!1038429) (not bm!43969) b_and!33423)
(check-sat b_and!33423 (not b_next!20881))
