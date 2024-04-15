; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19264 () Bool)

(assert start!19264)

(declare-fun b!189389 () Bool)

(declare-fun b_free!4651 () Bool)

(declare-fun b_next!4651 () Bool)

(assert (=> b!189389 (= b_free!4651 (not b_next!4651))))

(declare-fun tp!16786 () Bool)

(declare-fun b_and!11263 () Bool)

(assert (=> b!189389 (= tp!16786 b_and!11263)))

(declare-fun b!189386 () Bool)

(declare-fun e!124627 () Bool)

(declare-fun tp_is_empty!4423 () Bool)

(assert (=> b!189386 (= e!124627 tp_is_empty!4423)))

(declare-fun b!189387 () Bool)

(declare-fun e!124621 () Bool)

(declare-fun e!124624 () Bool)

(declare-fun mapRes!7630 () Bool)

(assert (=> b!189387 (= e!124621 (and e!124624 mapRes!7630))))

(declare-fun condMapEmpty!7630 () Bool)

(declare-datatypes ((V!5545 0))(
  ( (V!5546 (val!2256 Int)) )
))
(declare-datatypes ((ValueCell!1868 0))(
  ( (ValueCellFull!1868 (v!4171 V!5545)) (EmptyCell!1868) )
))
(declare-datatypes ((array!8055 0))(
  ( (array!8056 (arr!3796 (Array (_ BitVec 32) (_ BitVec 64))) (size!4117 (_ BitVec 32))) )
))
(declare-datatypes ((array!8057 0))(
  ( (array!8058 (arr!3797 (Array (_ BitVec 32) ValueCell!1868)) (size!4118 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2644 0))(
  ( (LongMapFixedSize!2645 (defaultEntry!3866 Int) (mask!9054 (_ BitVec 32)) (extraKeys!3603 (_ BitVec 32)) (zeroValue!3707 V!5545) (minValue!3707 V!5545) (_size!1371 (_ BitVec 32)) (_keys!5832 array!8055) (_values!3849 array!8057) (_vacant!1371 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2644)

(declare-fun mapDefault!7630 () ValueCell!1868)

(assert (=> b!189387 (= condMapEmpty!7630 (= (arr!3797 (_values!3849 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1868)) mapDefault!7630)))))

(declare-fun b!189388 () Bool)

(declare-datatypes ((Unit!5678 0))(
  ( (Unit!5679) )
))
(declare-fun e!124625 () Unit!5678)

(declare-fun lt!93606 () Unit!5678)

(assert (=> b!189388 (= e!124625 lt!93606)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!161 (array!8055 array!8057 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 64) Int) Unit!5678)

(assert (=> b!189388 (= lt!93606 (lemmaInListMapThenSeekEntryOrOpenFindsIt!161 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)))))

(declare-fun res!89536 () Bool)

(declare-datatypes ((SeekEntryResult!670 0))(
  ( (MissingZero!670 (index!4850 (_ BitVec 32))) (Found!670 (index!4851 (_ BitVec 32))) (Intermediate!670 (undefined!1482 Bool) (index!4852 (_ BitVec 32)) (x!20435 (_ BitVec 32))) (Undefined!670) (MissingVacant!670 (index!4853 (_ BitVec 32))) )
))
(declare-fun lt!93609 () SeekEntryResult!670)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189388 (= res!89536 (inRange!0 (index!4851 lt!93609) (mask!9054 thiss!1248)))))

(declare-fun e!124623 () Bool)

(assert (=> b!189388 (=> (not res!89536) (not e!124623))))

(assert (=> b!189388 e!124623))

(declare-fun e!124619 () Bool)

(declare-fun array_inv!2461 (array!8055) Bool)

(declare-fun array_inv!2462 (array!8057) Bool)

(assert (=> b!189389 (= e!124619 (and tp!16786 tp_is_empty!4423 (array_inv!2461 (_keys!5832 thiss!1248)) (array_inv!2462 (_values!3849 thiss!1248)) e!124621))))

(declare-fun mapNonEmpty!7630 () Bool)

(declare-fun tp!16785 () Bool)

(assert (=> mapNonEmpty!7630 (= mapRes!7630 (and tp!16785 e!124627))))

(declare-fun mapRest!7630 () (Array (_ BitVec 32) ValueCell!1868))

(declare-fun mapKey!7630 () (_ BitVec 32))

(declare-fun mapValue!7630 () ValueCell!1868)

(assert (=> mapNonEmpty!7630 (= (arr!3797 (_values!3849 thiss!1248)) (store mapRest!7630 mapKey!7630 mapValue!7630))))

(declare-fun b!189390 () Bool)

(declare-fun res!89535 () Bool)

(declare-fun e!124622 () Bool)

(assert (=> b!189390 (=> (not res!89535) (not e!124622))))

(assert (=> b!189390 (= res!89535 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189391 () Bool)

(assert (=> b!189391 (= e!124623 (= (select (arr!3796 (_keys!5832 thiss!1248)) (index!4851 lt!93609)) key!828))))

(declare-fun b!189392 () Bool)

(declare-fun Unit!5680 () Unit!5678)

(assert (=> b!189392 (= e!124625 Unit!5680)))

(declare-fun lt!93608 () Unit!5678)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!160 (array!8055 array!8057 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 64) Int) Unit!5678)

(assert (=> b!189392 (= lt!93608 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!160 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)))))

(assert (=> b!189392 false))

(declare-fun b!189393 () Bool)

(assert (=> b!189393 (= e!124624 tp_is_empty!4423)))

(declare-fun b!189395 () Bool)

(declare-fun e!124626 () Bool)

(assert (=> b!189395 (= e!124622 e!124626)))

(declare-fun res!89534 () Bool)

(assert (=> b!189395 (=> (not res!89534) (not e!124626))))

(get-info :version)

(assert (=> b!189395 (= res!89534 (and (not ((_ is Undefined!670) lt!93609)) (not ((_ is MissingVacant!670) lt!93609)) (not ((_ is MissingZero!670) lt!93609)) ((_ is Found!670) lt!93609)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8055 (_ BitVec 32)) SeekEntryResult!670)

(assert (=> b!189395 (= lt!93609 (seekEntryOrOpen!0 key!828 (_keys!5832 thiss!1248) (mask!9054 thiss!1248)))))

(declare-fun mapIsEmpty!7630 () Bool)

(assert (=> mapIsEmpty!7630 mapRes!7630))

(declare-fun b!189394 () Bool)

(assert (=> b!189394 (= e!124626 (not (and (bvsge (index!4851 lt!93609) #b00000000000000000000000000000000) (bvslt (index!4851 lt!93609) (size!4118 (_values!3849 thiss!1248))))))))

(declare-datatypes ((tuple2!3464 0))(
  ( (tuple2!3465 (_1!1743 (_ BitVec 64)) (_2!1743 V!5545)) )
))
(declare-datatypes ((List!2390 0))(
  ( (Nil!2387) (Cons!2386 (h!3023 tuple2!3464) (t!7285 List!2390)) )
))
(declare-datatypes ((ListLongMap!2373 0))(
  ( (ListLongMap!2374 (toList!1202 List!2390)) )
))
(declare-fun lt!93610 () ListLongMap!2373)

(declare-fun v!309 () V!5545)

(declare-fun +!294 (ListLongMap!2373 tuple2!3464) ListLongMap!2373)

(declare-fun getCurrentListMap!835 (array!8055 array!8057 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 32) Int) ListLongMap!2373)

(assert (=> b!189394 (= (+!294 lt!93610 (tuple2!3465 key!828 v!309)) (getCurrentListMap!835 (_keys!5832 thiss!1248) (array!8058 (store (arr!3797 (_values!3849 thiss!1248)) (index!4851 lt!93609) (ValueCellFull!1868 v!309)) (size!4118 (_values!3849 thiss!1248))) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93607 () Unit!5678)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!110 (array!8055 array!8057 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 32) (_ BitVec 64) V!5545 Int) Unit!5678)

(assert (=> b!189394 (= lt!93607 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!110 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) (index!4851 lt!93609) key!828 v!309 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93605 () Unit!5678)

(assert (=> b!189394 (= lt!93605 e!124625)))

(declare-fun c!34023 () Bool)

(declare-fun contains!1315 (ListLongMap!2373 (_ BitVec 64)) Bool)

(assert (=> b!189394 (= c!34023 (contains!1315 lt!93610 key!828))))

(assert (=> b!189394 (= lt!93610 (getCurrentListMap!835 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun res!89537 () Bool)

(assert (=> start!19264 (=> (not res!89537) (not e!124622))))

(declare-fun valid!1105 (LongMapFixedSize!2644) Bool)

(assert (=> start!19264 (= res!89537 (valid!1105 thiss!1248))))

(assert (=> start!19264 e!124622))

(assert (=> start!19264 e!124619))

(assert (=> start!19264 true))

(assert (=> start!19264 tp_is_empty!4423))

(assert (= (and start!19264 res!89537) b!189390))

(assert (= (and b!189390 res!89535) b!189395))

(assert (= (and b!189395 res!89534) b!189394))

(assert (= (and b!189394 c!34023) b!189388))

(assert (= (and b!189394 (not c!34023)) b!189392))

(assert (= (and b!189388 res!89536) b!189391))

(assert (= (and b!189387 condMapEmpty!7630) mapIsEmpty!7630))

(assert (= (and b!189387 (not condMapEmpty!7630)) mapNonEmpty!7630))

(assert (= (and mapNonEmpty!7630 ((_ is ValueCellFull!1868) mapValue!7630)) b!189386))

(assert (= (and b!189387 ((_ is ValueCellFull!1868) mapDefault!7630)) b!189393))

(assert (= b!189389 b!189387))

(assert (= start!19264 b!189389))

(declare-fun m!215225 () Bool)

(assert (=> start!19264 m!215225))

(declare-fun m!215227 () Bool)

(assert (=> b!189392 m!215227))

(declare-fun m!215229 () Bool)

(assert (=> b!189388 m!215229))

(declare-fun m!215231 () Bool)

(assert (=> b!189388 m!215231))

(declare-fun m!215233 () Bool)

(assert (=> b!189391 m!215233))

(declare-fun m!215235 () Bool)

(assert (=> b!189394 m!215235))

(declare-fun m!215237 () Bool)

(assert (=> b!189394 m!215237))

(declare-fun m!215239 () Bool)

(assert (=> b!189394 m!215239))

(declare-fun m!215241 () Bool)

(assert (=> b!189394 m!215241))

(declare-fun m!215243 () Bool)

(assert (=> b!189394 m!215243))

(declare-fun m!215245 () Bool)

(assert (=> b!189394 m!215245))

(declare-fun m!215247 () Bool)

(assert (=> mapNonEmpty!7630 m!215247))

(declare-fun m!215249 () Bool)

(assert (=> b!189389 m!215249))

(declare-fun m!215251 () Bool)

(assert (=> b!189389 m!215251))

(declare-fun m!215253 () Bool)

(assert (=> b!189395 m!215253))

(check-sat (not b!189394) (not b_next!4651) (not b!189392) (not b!189388) (not start!19264) tp_is_empty!4423 b_and!11263 (not b!189395) (not mapNonEmpty!7630) (not b!189389))
(check-sat b_and!11263 (not b_next!4651))
(get-model)

(declare-fun d!55569 () Bool)

(declare-fun lt!93653 () SeekEntryResult!670)

(assert (=> d!55569 (and (or ((_ is Undefined!670) lt!93653) (not ((_ is Found!670) lt!93653)) (and (bvsge (index!4851 lt!93653) #b00000000000000000000000000000000) (bvslt (index!4851 lt!93653) (size!4117 (_keys!5832 thiss!1248))))) (or ((_ is Undefined!670) lt!93653) ((_ is Found!670) lt!93653) (not ((_ is MissingZero!670) lt!93653)) (and (bvsge (index!4850 lt!93653) #b00000000000000000000000000000000) (bvslt (index!4850 lt!93653) (size!4117 (_keys!5832 thiss!1248))))) (or ((_ is Undefined!670) lt!93653) ((_ is Found!670) lt!93653) ((_ is MissingZero!670) lt!93653) (not ((_ is MissingVacant!670) lt!93653)) (and (bvsge (index!4853 lt!93653) #b00000000000000000000000000000000) (bvslt (index!4853 lt!93653) (size!4117 (_keys!5832 thiss!1248))))) (or ((_ is Undefined!670) lt!93653) (ite ((_ is Found!670) lt!93653) (= (select (arr!3796 (_keys!5832 thiss!1248)) (index!4851 lt!93653)) key!828) (ite ((_ is MissingZero!670) lt!93653) (= (select (arr!3796 (_keys!5832 thiss!1248)) (index!4850 lt!93653)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!670) lt!93653) (= (select (arr!3796 (_keys!5832 thiss!1248)) (index!4853 lt!93653)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!124690 () SeekEntryResult!670)

(assert (=> d!55569 (= lt!93653 e!124690)))

(declare-fun c!34036 () Bool)

(declare-fun lt!93654 () SeekEntryResult!670)

(assert (=> d!55569 (= c!34036 (and ((_ is Intermediate!670) lt!93654) (undefined!1482 lt!93654)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8055 (_ BitVec 32)) SeekEntryResult!670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55569 (= lt!93654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9054 thiss!1248)) key!828 (_keys!5832 thiss!1248) (mask!9054 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!55569 (validMask!0 (mask!9054 thiss!1248))))

(assert (=> d!55569 (= (seekEntryOrOpen!0 key!828 (_keys!5832 thiss!1248) (mask!9054 thiss!1248)) lt!93653)))

(declare-fun b!189468 () Bool)

(assert (=> b!189468 (= e!124690 Undefined!670)))

(declare-fun b!189469 () Bool)

(declare-fun c!34037 () Bool)

(declare-fun lt!93655 () (_ BitVec 64))

(assert (=> b!189469 (= c!34037 (= lt!93655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!124689 () SeekEntryResult!670)

(declare-fun e!124688 () SeekEntryResult!670)

(assert (=> b!189469 (= e!124689 e!124688)))

(declare-fun b!189470 () Bool)

(assert (=> b!189470 (= e!124688 (MissingZero!670 (index!4852 lt!93654)))))

(declare-fun b!189471 () Bool)

(assert (=> b!189471 (= e!124689 (Found!670 (index!4852 lt!93654)))))

(declare-fun b!189472 () Bool)

(assert (=> b!189472 (= e!124690 e!124689)))

(assert (=> b!189472 (= lt!93655 (select (arr!3796 (_keys!5832 thiss!1248)) (index!4852 lt!93654)))))

(declare-fun c!34038 () Bool)

(assert (=> b!189472 (= c!34038 (= lt!93655 key!828))))

(declare-fun b!189473 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8055 (_ BitVec 32)) SeekEntryResult!670)

(assert (=> b!189473 (= e!124688 (seekKeyOrZeroReturnVacant!0 (x!20435 lt!93654) (index!4852 lt!93654) (index!4852 lt!93654) key!828 (_keys!5832 thiss!1248) (mask!9054 thiss!1248)))))

(assert (= (and d!55569 c!34036) b!189468))

(assert (= (and d!55569 (not c!34036)) b!189472))

(assert (= (and b!189472 c!34038) b!189471))

(assert (= (and b!189472 (not c!34038)) b!189469))

(assert (= (and b!189469 c!34037) b!189470))

(assert (= (and b!189469 (not c!34037)) b!189473))

(declare-fun m!215315 () Bool)

(assert (=> d!55569 m!215315))

(declare-fun m!215317 () Bool)

(assert (=> d!55569 m!215317))

(assert (=> d!55569 m!215315))

(declare-fun m!215319 () Bool)

(assert (=> d!55569 m!215319))

(declare-fun m!215321 () Bool)

(assert (=> d!55569 m!215321))

(declare-fun m!215323 () Bool)

(assert (=> d!55569 m!215323))

(declare-fun m!215325 () Bool)

(assert (=> d!55569 m!215325))

(declare-fun m!215327 () Bool)

(assert (=> b!189472 m!215327))

(declare-fun m!215329 () Bool)

(assert (=> b!189473 m!215329))

(assert (=> b!189395 d!55569))

(declare-fun d!55571 () Bool)

(declare-fun e!124693 () Bool)

(assert (=> d!55571 e!124693))

(declare-fun res!89564 () Bool)

(assert (=> d!55571 (=> (not res!89564) (not e!124693))))

(assert (=> d!55571 (= res!89564 (and (bvsge (index!4851 lt!93609) #b00000000000000000000000000000000) (bvslt (index!4851 lt!93609) (size!4118 (_values!3849 thiss!1248)))))))

(declare-fun lt!93658 () Unit!5678)

(declare-fun choose!1021 (array!8055 array!8057 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 32) (_ BitVec 64) V!5545 Int) Unit!5678)

(assert (=> d!55571 (= lt!93658 (choose!1021 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) (index!4851 lt!93609) key!828 v!309 (defaultEntry!3866 thiss!1248)))))

(assert (=> d!55571 (validMask!0 (mask!9054 thiss!1248))))

(assert (=> d!55571 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!110 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) (index!4851 lt!93609) key!828 v!309 (defaultEntry!3866 thiss!1248)) lt!93658)))

(declare-fun b!189476 () Bool)

(assert (=> b!189476 (= e!124693 (= (+!294 (getCurrentListMap!835 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)) (tuple2!3465 key!828 v!309)) (getCurrentListMap!835 (_keys!5832 thiss!1248) (array!8058 (store (arr!3797 (_values!3849 thiss!1248)) (index!4851 lt!93609) (ValueCellFull!1868 v!309)) (size!4118 (_values!3849 thiss!1248))) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248))))))

(assert (= (and d!55571 res!89564) b!189476))

(declare-fun m!215331 () Bool)

(assert (=> d!55571 m!215331))

(assert (=> d!55571 m!215323))

(assert (=> b!189476 m!215243))

(assert (=> b!189476 m!215243))

(declare-fun m!215333 () Bool)

(assert (=> b!189476 m!215333))

(assert (=> b!189476 m!215237))

(assert (=> b!189476 m!215235))

(assert (=> b!189394 d!55571))

(declare-fun d!55573 () Bool)

(declare-fun e!124696 () Bool)

(assert (=> d!55573 e!124696))

(declare-fun res!89570 () Bool)

(assert (=> d!55573 (=> (not res!89570) (not e!124696))))

(declare-fun lt!93669 () ListLongMap!2373)

(assert (=> d!55573 (= res!89570 (contains!1315 lt!93669 (_1!1743 (tuple2!3465 key!828 v!309))))))

(declare-fun lt!93667 () List!2390)

(assert (=> d!55573 (= lt!93669 (ListLongMap!2374 lt!93667))))

(declare-fun lt!93670 () Unit!5678)

(declare-fun lt!93668 () Unit!5678)

(assert (=> d!55573 (= lt!93670 lt!93668)))

(declare-datatypes ((Option!238 0))(
  ( (Some!237 (v!4176 V!5545)) (None!236) )
))
(declare-fun getValueByKey!232 (List!2390 (_ BitVec 64)) Option!238)

(assert (=> d!55573 (= (getValueByKey!232 lt!93667 (_1!1743 (tuple2!3465 key!828 v!309))) (Some!237 (_2!1743 (tuple2!3465 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!122 (List!2390 (_ BitVec 64) V!5545) Unit!5678)

(assert (=> d!55573 (= lt!93668 (lemmaContainsTupThenGetReturnValue!122 lt!93667 (_1!1743 (tuple2!3465 key!828 v!309)) (_2!1743 (tuple2!3465 key!828 v!309))))))

(declare-fun insertStrictlySorted!125 (List!2390 (_ BitVec 64) V!5545) List!2390)

(assert (=> d!55573 (= lt!93667 (insertStrictlySorted!125 (toList!1202 lt!93610) (_1!1743 (tuple2!3465 key!828 v!309)) (_2!1743 (tuple2!3465 key!828 v!309))))))

(assert (=> d!55573 (= (+!294 lt!93610 (tuple2!3465 key!828 v!309)) lt!93669)))

(declare-fun b!189481 () Bool)

(declare-fun res!89569 () Bool)

(assert (=> b!189481 (=> (not res!89569) (not e!124696))))

(assert (=> b!189481 (= res!89569 (= (getValueByKey!232 (toList!1202 lt!93669) (_1!1743 (tuple2!3465 key!828 v!309))) (Some!237 (_2!1743 (tuple2!3465 key!828 v!309)))))))

(declare-fun b!189482 () Bool)

(declare-fun contains!1318 (List!2390 tuple2!3464) Bool)

(assert (=> b!189482 (= e!124696 (contains!1318 (toList!1202 lt!93669) (tuple2!3465 key!828 v!309)))))

(assert (= (and d!55573 res!89570) b!189481))

(assert (= (and b!189481 res!89569) b!189482))

(declare-fun m!215335 () Bool)

(assert (=> d!55573 m!215335))

(declare-fun m!215337 () Bool)

(assert (=> d!55573 m!215337))

(declare-fun m!215339 () Bool)

(assert (=> d!55573 m!215339))

(declare-fun m!215341 () Bool)

(assert (=> d!55573 m!215341))

(declare-fun m!215343 () Bool)

(assert (=> b!189481 m!215343))

(declare-fun m!215345 () Bool)

(assert (=> b!189482 m!215345))

(assert (=> b!189394 d!55573))

(declare-fun d!55575 () Bool)

(declare-fun e!124702 () Bool)

(assert (=> d!55575 e!124702))

(declare-fun res!89573 () Bool)

(assert (=> d!55575 (=> res!89573 e!124702)))

(declare-fun lt!93680 () Bool)

(assert (=> d!55575 (= res!89573 (not lt!93680))))

(declare-fun lt!93679 () Bool)

(assert (=> d!55575 (= lt!93680 lt!93679)))

(declare-fun lt!93682 () Unit!5678)

(declare-fun e!124701 () Unit!5678)

(assert (=> d!55575 (= lt!93682 e!124701)))

(declare-fun c!34041 () Bool)

(assert (=> d!55575 (= c!34041 lt!93679)))

(declare-fun containsKey!236 (List!2390 (_ BitVec 64)) Bool)

(assert (=> d!55575 (= lt!93679 (containsKey!236 (toList!1202 lt!93610) key!828))))

(assert (=> d!55575 (= (contains!1315 lt!93610 key!828) lt!93680)))

(declare-fun b!189489 () Bool)

(declare-fun lt!93681 () Unit!5678)

(assert (=> b!189489 (= e!124701 lt!93681)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!185 (List!2390 (_ BitVec 64)) Unit!5678)

(assert (=> b!189489 (= lt!93681 (lemmaContainsKeyImpliesGetValueByKeyDefined!185 (toList!1202 lt!93610) key!828))))

(declare-fun isDefined!186 (Option!238) Bool)

(assert (=> b!189489 (isDefined!186 (getValueByKey!232 (toList!1202 lt!93610) key!828))))

(declare-fun b!189490 () Bool)

(declare-fun Unit!5687 () Unit!5678)

(assert (=> b!189490 (= e!124701 Unit!5687)))

(declare-fun b!189491 () Bool)

(assert (=> b!189491 (= e!124702 (isDefined!186 (getValueByKey!232 (toList!1202 lt!93610) key!828)))))

(assert (= (and d!55575 c!34041) b!189489))

(assert (= (and d!55575 (not c!34041)) b!189490))

(assert (= (and d!55575 (not res!89573)) b!189491))

(declare-fun m!215347 () Bool)

(assert (=> d!55575 m!215347))

(declare-fun m!215349 () Bool)

(assert (=> b!189489 m!215349))

(declare-fun m!215351 () Bool)

(assert (=> b!189489 m!215351))

(assert (=> b!189489 m!215351))

(declare-fun m!215353 () Bool)

(assert (=> b!189489 m!215353))

(assert (=> b!189491 m!215351))

(assert (=> b!189491 m!215351))

(assert (=> b!189491 m!215353))

(assert (=> b!189394 d!55575))

(declare-fun b!189534 () Bool)

(declare-fun e!124736 () Bool)

(declare-fun lt!93730 () ListLongMap!2373)

(declare-fun apply!177 (ListLongMap!2373 (_ BitVec 64)) V!5545)

(assert (=> b!189534 (= e!124736 (= (apply!177 lt!93730 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3707 thiss!1248)))))

(declare-fun b!189535 () Bool)

(declare-fun e!124731 () Bool)

(assert (=> b!189535 (= e!124731 e!124736)))

(declare-fun res!89592 () Bool)

(declare-fun call!19096 () Bool)

(assert (=> b!189535 (= res!89592 call!19096)))

(assert (=> b!189535 (=> (not res!89592) (not e!124736))))

(declare-fun bm!19090 () Bool)

(declare-fun call!19094 () ListLongMap!2373)

(declare-fun call!19098 () ListLongMap!2373)

(assert (=> bm!19090 (= call!19094 call!19098)))

(declare-fun b!189536 () Bool)

(declare-fun e!124739 () ListLongMap!2373)

(declare-fun call!19095 () ListLongMap!2373)

(assert (=> b!189536 (= e!124739 call!19095)))

(declare-fun b!189537 () Bool)

(declare-fun e!124729 () ListLongMap!2373)

(declare-fun e!124733 () ListLongMap!2373)

(assert (=> b!189537 (= e!124729 e!124733)))

(declare-fun c!34055 () Bool)

(assert (=> b!189537 (= c!34055 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189538 () Bool)

(declare-fun res!89596 () Bool)

(declare-fun e!124738 () Bool)

(assert (=> b!189538 (=> (not res!89596) (not e!124738))))

(declare-fun e!124740 () Bool)

(assert (=> b!189538 (= res!89596 e!124740)))

(declare-fun res!89594 () Bool)

(assert (=> b!189538 (=> res!89594 e!124740)))

(declare-fun e!124741 () Bool)

(assert (=> b!189538 (= res!89594 (not e!124741))))

(declare-fun res!89597 () Bool)

(assert (=> b!189538 (=> (not res!89597) (not e!124741))))

(assert (=> b!189538 (= res!89597 (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))))))

(declare-fun b!189539 () Bool)

(declare-fun e!124734 () Bool)

(assert (=> b!189539 (= e!124740 e!124734)))

(declare-fun res!89599 () Bool)

(assert (=> b!189539 (=> (not res!89599) (not e!124734))))

(assert (=> b!189539 (= res!89599 (contains!1315 lt!93730 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))))))

(declare-fun d!55577 () Bool)

(assert (=> d!55577 e!124738))

(declare-fun res!89600 () Bool)

(assert (=> d!55577 (=> (not res!89600) (not e!124738))))

(assert (=> d!55577 (= res!89600 (or (bvsge #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))))))))

(declare-fun lt!93732 () ListLongMap!2373)

(assert (=> d!55577 (= lt!93730 lt!93732)))

(declare-fun lt!93733 () Unit!5678)

(declare-fun e!124730 () Unit!5678)

(assert (=> d!55577 (= lt!93733 e!124730)))

(declare-fun c!34058 () Bool)

(declare-fun e!124737 () Bool)

(assert (=> d!55577 (= c!34058 e!124737)))

(declare-fun res!89593 () Bool)

(assert (=> d!55577 (=> (not res!89593) (not e!124737))))

(assert (=> d!55577 (= res!89593 (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))))))

(assert (=> d!55577 (= lt!93732 e!124729)))

(declare-fun c!34059 () Bool)

(assert (=> d!55577 (= c!34059 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55577 (validMask!0 (mask!9054 thiss!1248))))

(assert (=> d!55577 (= (getCurrentListMap!835 (_keys!5832 thiss!1248) (array!8058 (store (arr!3797 (_values!3849 thiss!1248)) (index!4851 lt!93609) (ValueCellFull!1868 v!309)) (size!4118 (_values!3849 thiss!1248))) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)) lt!93730)))

(declare-fun bm!19091 () Bool)

(declare-fun call!19093 () ListLongMap!2373)

(declare-fun call!19099 () ListLongMap!2373)

(assert (=> bm!19091 (= call!19093 call!19099)))

(declare-fun b!189540 () Bool)

(assert (=> b!189540 (= e!124739 call!19093)))

(declare-fun bm!19092 () Bool)

(declare-fun call!19097 () Bool)

(assert (=> bm!19092 (= call!19097 (contains!1315 lt!93730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189541 () Bool)

(assert (=> b!189541 (= e!124729 (+!294 call!19099 (tuple2!3465 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3707 thiss!1248))))))

(declare-fun b!189542 () Bool)

(declare-fun Unit!5688 () Unit!5678)

(assert (=> b!189542 (= e!124730 Unit!5688)))

(declare-fun b!189543 () Bool)

(declare-fun get!2186 (ValueCell!1868 V!5545) V!5545)

(declare-fun dynLambda!511 (Int (_ BitVec 64)) V!5545)

(assert (=> b!189543 (= e!124734 (= (apply!177 lt!93730 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000)) (get!2186 (select (arr!3797 (array!8058 (store (arr!3797 (_values!3849 thiss!1248)) (index!4851 lt!93609) (ValueCellFull!1868 v!309)) (size!4118 (_values!3849 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3866 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4118 (array!8058 (store (arr!3797 (_values!3849 thiss!1248)) (index!4851 lt!93609) (ValueCellFull!1868 v!309)) (size!4118 (_values!3849 thiss!1248))))))))

(assert (=> b!189543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))))))

(declare-fun b!189544 () Bool)

(declare-fun e!124732 () Bool)

(assert (=> b!189544 (= e!124732 (not call!19097))))

(declare-fun bm!19093 () Bool)

(assert (=> bm!19093 (= call!19095 call!19094)))

(declare-fun b!189545 () Bool)

(declare-fun e!124735 () Bool)

(assert (=> b!189545 (= e!124735 (= (apply!177 lt!93730 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3707 thiss!1248)))))

(declare-fun b!189546 () Bool)

(assert (=> b!189546 (= e!124731 (not call!19096))))

(declare-fun b!189547 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189547 (= e!124737 (validKeyInArray!0 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19094 () Bool)

(assert (=> bm!19094 (= call!19096 (contains!1315 lt!93730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189548 () Bool)

(declare-fun lt!93748 () Unit!5678)

(assert (=> b!189548 (= e!124730 lt!93748)))

(declare-fun lt!93731 () ListLongMap!2373)

(declare-fun getCurrentListMapNoExtraKeys!198 (array!8055 array!8057 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 32) Int) ListLongMap!2373)

(assert (=> b!189548 (= lt!93731 (getCurrentListMapNoExtraKeys!198 (_keys!5832 thiss!1248) (array!8058 (store (arr!3797 (_values!3849 thiss!1248)) (index!4851 lt!93609) (ValueCellFull!1868 v!309)) (size!4118 (_values!3849 thiss!1248))) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93739 () (_ BitVec 64))

(assert (=> b!189548 (= lt!93739 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93736 () (_ BitVec 64))

(assert (=> b!189548 (= lt!93736 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93747 () Unit!5678)

(declare-fun addStillContains!153 (ListLongMap!2373 (_ BitVec 64) V!5545 (_ BitVec 64)) Unit!5678)

(assert (=> b!189548 (= lt!93747 (addStillContains!153 lt!93731 lt!93739 (zeroValue!3707 thiss!1248) lt!93736))))

(assert (=> b!189548 (contains!1315 (+!294 lt!93731 (tuple2!3465 lt!93739 (zeroValue!3707 thiss!1248))) lt!93736)))

(declare-fun lt!93728 () Unit!5678)

(assert (=> b!189548 (= lt!93728 lt!93747)))

(declare-fun lt!93745 () ListLongMap!2373)

(assert (=> b!189548 (= lt!93745 (getCurrentListMapNoExtraKeys!198 (_keys!5832 thiss!1248) (array!8058 (store (arr!3797 (_values!3849 thiss!1248)) (index!4851 lt!93609) (ValueCellFull!1868 v!309)) (size!4118 (_values!3849 thiss!1248))) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93729 () (_ BitVec 64))

(assert (=> b!189548 (= lt!93729 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93746 () (_ BitVec 64))

(assert (=> b!189548 (= lt!93746 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93734 () Unit!5678)

(declare-fun addApplyDifferent!153 (ListLongMap!2373 (_ BitVec 64) V!5545 (_ BitVec 64)) Unit!5678)

(assert (=> b!189548 (= lt!93734 (addApplyDifferent!153 lt!93745 lt!93729 (minValue!3707 thiss!1248) lt!93746))))

(assert (=> b!189548 (= (apply!177 (+!294 lt!93745 (tuple2!3465 lt!93729 (minValue!3707 thiss!1248))) lt!93746) (apply!177 lt!93745 lt!93746))))

(declare-fun lt!93743 () Unit!5678)

(assert (=> b!189548 (= lt!93743 lt!93734)))

(declare-fun lt!93738 () ListLongMap!2373)

(assert (=> b!189548 (= lt!93738 (getCurrentListMapNoExtraKeys!198 (_keys!5832 thiss!1248) (array!8058 (store (arr!3797 (_values!3849 thiss!1248)) (index!4851 lt!93609) (ValueCellFull!1868 v!309)) (size!4118 (_values!3849 thiss!1248))) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93742 () (_ BitVec 64))

(assert (=> b!189548 (= lt!93742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93735 () (_ BitVec 64))

(assert (=> b!189548 (= lt!93735 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93737 () Unit!5678)

(assert (=> b!189548 (= lt!93737 (addApplyDifferent!153 lt!93738 lt!93742 (zeroValue!3707 thiss!1248) lt!93735))))

(assert (=> b!189548 (= (apply!177 (+!294 lt!93738 (tuple2!3465 lt!93742 (zeroValue!3707 thiss!1248))) lt!93735) (apply!177 lt!93738 lt!93735))))

(declare-fun lt!93740 () Unit!5678)

(assert (=> b!189548 (= lt!93740 lt!93737)))

(declare-fun lt!93741 () ListLongMap!2373)

(assert (=> b!189548 (= lt!93741 (getCurrentListMapNoExtraKeys!198 (_keys!5832 thiss!1248) (array!8058 (store (arr!3797 (_values!3849 thiss!1248)) (index!4851 lt!93609) (ValueCellFull!1868 v!309)) (size!4118 (_values!3849 thiss!1248))) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93744 () (_ BitVec 64))

(assert (=> b!189548 (= lt!93744 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93727 () (_ BitVec 64))

(assert (=> b!189548 (= lt!93727 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189548 (= lt!93748 (addApplyDifferent!153 lt!93741 lt!93744 (minValue!3707 thiss!1248) lt!93727))))

(assert (=> b!189548 (= (apply!177 (+!294 lt!93741 (tuple2!3465 lt!93744 (minValue!3707 thiss!1248))) lt!93727) (apply!177 lt!93741 lt!93727))))

(declare-fun bm!19095 () Bool)

(assert (=> bm!19095 (= call!19098 (getCurrentListMapNoExtraKeys!198 (_keys!5832 thiss!1248) (array!8058 (store (arr!3797 (_values!3849 thiss!1248)) (index!4851 lt!93609) (ValueCellFull!1868 v!309)) (size!4118 (_values!3849 thiss!1248))) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun b!189549 () Bool)

(declare-fun c!34054 () Bool)

(assert (=> b!189549 (= c!34054 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189549 (= e!124733 e!124739)))

(declare-fun b!189550 () Bool)

(assert (=> b!189550 (= e!124732 e!124735)))

(declare-fun res!89595 () Bool)

(assert (=> b!189550 (= res!89595 call!19097)))

(assert (=> b!189550 (=> (not res!89595) (not e!124735))))

(declare-fun b!189551 () Bool)

(assert (=> b!189551 (= e!124741 (validKeyInArray!0 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189552 () Bool)

(declare-fun res!89598 () Bool)

(assert (=> b!189552 (=> (not res!89598) (not e!124738))))

(assert (=> b!189552 (= res!89598 e!124731)))

(declare-fun c!34057 () Bool)

(assert (=> b!189552 (= c!34057 (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!189553 () Bool)

(assert (=> b!189553 (= e!124733 call!19093)))

(declare-fun bm!19096 () Bool)

(assert (=> bm!19096 (= call!19099 (+!294 (ite c!34059 call!19098 (ite c!34055 call!19094 call!19095)) (ite (or c!34059 c!34055) (tuple2!3465 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3707 thiss!1248)) (tuple2!3465 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3707 thiss!1248)))))))

(declare-fun b!189554 () Bool)

(assert (=> b!189554 (= e!124738 e!124732)))

(declare-fun c!34056 () Bool)

(assert (=> b!189554 (= c!34056 (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!55577 c!34059) b!189541))

(assert (= (and d!55577 (not c!34059)) b!189537))

(assert (= (and b!189537 c!34055) b!189553))

(assert (= (and b!189537 (not c!34055)) b!189549))

(assert (= (and b!189549 c!34054) b!189540))

(assert (= (and b!189549 (not c!34054)) b!189536))

(assert (= (or b!189540 b!189536) bm!19093))

(assert (= (or b!189553 bm!19093) bm!19090))

(assert (= (or b!189553 b!189540) bm!19091))

(assert (= (or b!189541 bm!19090) bm!19095))

(assert (= (or b!189541 bm!19091) bm!19096))

(assert (= (and d!55577 res!89593) b!189547))

(assert (= (and d!55577 c!34058) b!189548))

(assert (= (and d!55577 (not c!34058)) b!189542))

(assert (= (and d!55577 res!89600) b!189538))

(assert (= (and b!189538 res!89597) b!189551))

(assert (= (and b!189538 (not res!89594)) b!189539))

(assert (= (and b!189539 res!89599) b!189543))

(assert (= (and b!189538 res!89596) b!189552))

(assert (= (and b!189552 c!34057) b!189535))

(assert (= (and b!189552 (not c!34057)) b!189546))

(assert (= (and b!189535 res!89592) b!189534))

(assert (= (or b!189535 b!189546) bm!19094))

(assert (= (and b!189552 res!89598) b!189554))

(assert (= (and b!189554 c!34056) b!189550))

(assert (= (and b!189554 (not c!34056)) b!189544))

(assert (= (and b!189550 res!89595) b!189545))

(assert (= (or b!189550 b!189544) bm!19092))

(declare-fun b_lambda!7309 () Bool)

(assert (=> (not b_lambda!7309) (not b!189543)))

(declare-fun t!7289 () Bool)

(declare-fun tb!2857 () Bool)

(assert (=> (and b!189389 (= (defaultEntry!3866 thiss!1248) (defaultEntry!3866 thiss!1248)) t!7289) tb!2857))

(declare-fun result!4865 () Bool)

(assert (=> tb!2857 (= result!4865 tp_is_empty!4423)))

(assert (=> b!189543 t!7289))

(declare-fun b_and!11269 () Bool)

(assert (= b_and!11263 (and (=> t!7289 result!4865) b_and!11269)))

(assert (=> d!55577 m!215323))

(declare-fun m!215355 () Bool)

(assert (=> bm!19095 m!215355))

(declare-fun m!215357 () Bool)

(assert (=> b!189545 m!215357))

(declare-fun m!215359 () Bool)

(assert (=> b!189543 m!215359))

(declare-fun m!215361 () Bool)

(assert (=> b!189543 m!215361))

(declare-fun m!215363 () Bool)

(assert (=> b!189543 m!215363))

(assert (=> b!189543 m!215361))

(assert (=> b!189543 m!215359))

(declare-fun m!215365 () Bool)

(assert (=> b!189543 m!215365))

(assert (=> b!189543 m!215363))

(declare-fun m!215367 () Bool)

(assert (=> b!189543 m!215367))

(declare-fun m!215369 () Bool)

(assert (=> b!189541 m!215369))

(assert (=> b!189551 m!215363))

(assert (=> b!189551 m!215363))

(declare-fun m!215371 () Bool)

(assert (=> b!189551 m!215371))

(declare-fun m!215373 () Bool)

(assert (=> b!189534 m!215373))

(declare-fun m!215375 () Bool)

(assert (=> bm!19094 m!215375))

(declare-fun m!215377 () Bool)

(assert (=> bm!19092 m!215377))

(declare-fun m!215379 () Bool)

(assert (=> bm!19096 m!215379))

(declare-fun m!215381 () Bool)

(assert (=> b!189548 m!215381))

(declare-fun m!215383 () Bool)

(assert (=> b!189548 m!215383))

(assert (=> b!189548 m!215383))

(declare-fun m!215385 () Bool)

(assert (=> b!189548 m!215385))

(declare-fun m!215387 () Bool)

(assert (=> b!189548 m!215387))

(declare-fun m!215389 () Bool)

(assert (=> b!189548 m!215389))

(assert (=> b!189548 m!215381))

(declare-fun m!215391 () Bool)

(assert (=> b!189548 m!215391))

(declare-fun m!215393 () Bool)

(assert (=> b!189548 m!215393))

(declare-fun m!215395 () Bool)

(assert (=> b!189548 m!215395))

(declare-fun m!215397 () Bool)

(assert (=> b!189548 m!215397))

(declare-fun m!215399 () Bool)

(assert (=> b!189548 m!215399))

(assert (=> b!189548 m!215355))

(declare-fun m!215401 () Bool)

(assert (=> b!189548 m!215401))

(declare-fun m!215403 () Bool)

(assert (=> b!189548 m!215403))

(declare-fun m!215405 () Bool)

(assert (=> b!189548 m!215405))

(assert (=> b!189548 m!215393))

(declare-fun m!215407 () Bool)

(assert (=> b!189548 m!215407))

(declare-fun m!215409 () Bool)

(assert (=> b!189548 m!215409))

(assert (=> b!189548 m!215363))

(assert (=> b!189548 m!215407))

(assert (=> b!189539 m!215363))

(assert (=> b!189539 m!215363))

(declare-fun m!215411 () Bool)

(assert (=> b!189539 m!215411))

(assert (=> b!189547 m!215363))

(assert (=> b!189547 m!215363))

(assert (=> b!189547 m!215371))

(assert (=> b!189394 d!55577))

(declare-fun b!189557 () Bool)

(declare-fun e!124749 () Bool)

(declare-fun lt!93752 () ListLongMap!2373)

(assert (=> b!189557 (= e!124749 (= (apply!177 lt!93752 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3707 thiss!1248)))))

(declare-fun b!189558 () Bool)

(declare-fun e!124744 () Bool)

(assert (=> b!189558 (= e!124744 e!124749)))

(declare-fun res!89601 () Bool)

(declare-fun call!19103 () Bool)

(assert (=> b!189558 (= res!89601 call!19103)))

(assert (=> b!189558 (=> (not res!89601) (not e!124749))))

(declare-fun bm!19097 () Bool)

(declare-fun call!19101 () ListLongMap!2373)

(declare-fun call!19105 () ListLongMap!2373)

(assert (=> bm!19097 (= call!19101 call!19105)))

(declare-fun b!189559 () Bool)

(declare-fun e!124752 () ListLongMap!2373)

(declare-fun call!19102 () ListLongMap!2373)

(assert (=> b!189559 (= e!124752 call!19102)))

(declare-fun b!189560 () Bool)

(declare-fun e!124742 () ListLongMap!2373)

(declare-fun e!124746 () ListLongMap!2373)

(assert (=> b!189560 (= e!124742 e!124746)))

(declare-fun c!34061 () Bool)

(assert (=> b!189560 (= c!34061 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189561 () Bool)

(declare-fun res!89605 () Bool)

(declare-fun e!124751 () Bool)

(assert (=> b!189561 (=> (not res!89605) (not e!124751))))

(declare-fun e!124753 () Bool)

(assert (=> b!189561 (= res!89605 e!124753)))

(declare-fun res!89603 () Bool)

(assert (=> b!189561 (=> res!89603 e!124753)))

(declare-fun e!124754 () Bool)

(assert (=> b!189561 (= res!89603 (not e!124754))))

(declare-fun res!89606 () Bool)

(assert (=> b!189561 (=> (not res!89606) (not e!124754))))

(assert (=> b!189561 (= res!89606 (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))))))

(declare-fun b!189562 () Bool)

(declare-fun e!124747 () Bool)

(assert (=> b!189562 (= e!124753 e!124747)))

(declare-fun res!89608 () Bool)

(assert (=> b!189562 (=> (not res!89608) (not e!124747))))

(assert (=> b!189562 (= res!89608 (contains!1315 lt!93752 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189562 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))))))

(declare-fun d!55579 () Bool)

(assert (=> d!55579 e!124751))

(declare-fun res!89609 () Bool)

(assert (=> d!55579 (=> (not res!89609) (not e!124751))))

(assert (=> d!55579 (= res!89609 (or (bvsge #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))))))))

(declare-fun lt!93754 () ListLongMap!2373)

(assert (=> d!55579 (= lt!93752 lt!93754)))

(declare-fun lt!93755 () Unit!5678)

(declare-fun e!124743 () Unit!5678)

(assert (=> d!55579 (= lt!93755 e!124743)))

(declare-fun c!34064 () Bool)

(declare-fun e!124750 () Bool)

(assert (=> d!55579 (= c!34064 e!124750)))

(declare-fun res!89602 () Bool)

(assert (=> d!55579 (=> (not res!89602) (not e!124750))))

(assert (=> d!55579 (= res!89602 (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))))))

(assert (=> d!55579 (= lt!93754 e!124742)))

(declare-fun c!34065 () Bool)

(assert (=> d!55579 (= c!34065 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55579 (validMask!0 (mask!9054 thiss!1248))))

(assert (=> d!55579 (= (getCurrentListMap!835 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)) lt!93752)))

(declare-fun bm!19098 () Bool)

(declare-fun call!19100 () ListLongMap!2373)

(declare-fun call!19106 () ListLongMap!2373)

(assert (=> bm!19098 (= call!19100 call!19106)))

(declare-fun b!189563 () Bool)

(assert (=> b!189563 (= e!124752 call!19100)))

(declare-fun bm!19099 () Bool)

(declare-fun call!19104 () Bool)

(assert (=> bm!19099 (= call!19104 (contains!1315 lt!93752 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189564 () Bool)

(assert (=> b!189564 (= e!124742 (+!294 call!19106 (tuple2!3465 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3707 thiss!1248))))))

(declare-fun b!189565 () Bool)

(declare-fun Unit!5689 () Unit!5678)

(assert (=> b!189565 (= e!124743 Unit!5689)))

(declare-fun b!189566 () Bool)

(assert (=> b!189566 (= e!124747 (= (apply!177 lt!93752 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000)) (get!2186 (select (arr!3797 (_values!3849 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!511 (defaultEntry!3866 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189566 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4118 (_values!3849 thiss!1248))))))

(assert (=> b!189566 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))))))

(declare-fun b!189567 () Bool)

(declare-fun e!124745 () Bool)

(assert (=> b!189567 (= e!124745 (not call!19104))))

(declare-fun bm!19100 () Bool)

(assert (=> bm!19100 (= call!19102 call!19101)))

(declare-fun b!189568 () Bool)

(declare-fun e!124748 () Bool)

(assert (=> b!189568 (= e!124748 (= (apply!177 lt!93752 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3707 thiss!1248)))))

(declare-fun b!189569 () Bool)

(assert (=> b!189569 (= e!124744 (not call!19103))))

(declare-fun b!189570 () Bool)

(assert (=> b!189570 (= e!124750 (validKeyInArray!0 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19101 () Bool)

(assert (=> bm!19101 (= call!19103 (contains!1315 lt!93752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189571 () Bool)

(declare-fun lt!93770 () Unit!5678)

(assert (=> b!189571 (= e!124743 lt!93770)))

(declare-fun lt!93753 () ListLongMap!2373)

(assert (=> b!189571 (= lt!93753 (getCurrentListMapNoExtraKeys!198 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93761 () (_ BitVec 64))

(assert (=> b!189571 (= lt!93761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93758 () (_ BitVec 64))

(assert (=> b!189571 (= lt!93758 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93769 () Unit!5678)

(assert (=> b!189571 (= lt!93769 (addStillContains!153 lt!93753 lt!93761 (zeroValue!3707 thiss!1248) lt!93758))))

(assert (=> b!189571 (contains!1315 (+!294 lt!93753 (tuple2!3465 lt!93761 (zeroValue!3707 thiss!1248))) lt!93758)))

(declare-fun lt!93750 () Unit!5678)

(assert (=> b!189571 (= lt!93750 lt!93769)))

(declare-fun lt!93767 () ListLongMap!2373)

(assert (=> b!189571 (= lt!93767 (getCurrentListMapNoExtraKeys!198 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93751 () (_ BitVec 64))

(assert (=> b!189571 (= lt!93751 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93768 () (_ BitVec 64))

(assert (=> b!189571 (= lt!93768 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93756 () Unit!5678)

(assert (=> b!189571 (= lt!93756 (addApplyDifferent!153 lt!93767 lt!93751 (minValue!3707 thiss!1248) lt!93768))))

(assert (=> b!189571 (= (apply!177 (+!294 lt!93767 (tuple2!3465 lt!93751 (minValue!3707 thiss!1248))) lt!93768) (apply!177 lt!93767 lt!93768))))

(declare-fun lt!93765 () Unit!5678)

(assert (=> b!189571 (= lt!93765 lt!93756)))

(declare-fun lt!93760 () ListLongMap!2373)

(assert (=> b!189571 (= lt!93760 (getCurrentListMapNoExtraKeys!198 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93764 () (_ BitVec 64))

(assert (=> b!189571 (= lt!93764 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93757 () (_ BitVec 64))

(assert (=> b!189571 (= lt!93757 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93759 () Unit!5678)

(assert (=> b!189571 (= lt!93759 (addApplyDifferent!153 lt!93760 lt!93764 (zeroValue!3707 thiss!1248) lt!93757))))

(assert (=> b!189571 (= (apply!177 (+!294 lt!93760 (tuple2!3465 lt!93764 (zeroValue!3707 thiss!1248))) lt!93757) (apply!177 lt!93760 lt!93757))))

(declare-fun lt!93762 () Unit!5678)

(assert (=> b!189571 (= lt!93762 lt!93759)))

(declare-fun lt!93763 () ListLongMap!2373)

(assert (=> b!189571 (= lt!93763 (getCurrentListMapNoExtraKeys!198 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93766 () (_ BitVec 64))

(assert (=> b!189571 (= lt!93766 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93749 () (_ BitVec 64))

(assert (=> b!189571 (= lt!93749 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189571 (= lt!93770 (addApplyDifferent!153 lt!93763 lt!93766 (minValue!3707 thiss!1248) lt!93749))))

(assert (=> b!189571 (= (apply!177 (+!294 lt!93763 (tuple2!3465 lt!93766 (minValue!3707 thiss!1248))) lt!93749) (apply!177 lt!93763 lt!93749))))

(declare-fun bm!19102 () Bool)

(assert (=> bm!19102 (= call!19105 (getCurrentListMapNoExtraKeys!198 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun b!189572 () Bool)

(declare-fun c!34060 () Bool)

(assert (=> b!189572 (= c!34060 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189572 (= e!124746 e!124752)))

(declare-fun b!189573 () Bool)

(assert (=> b!189573 (= e!124745 e!124748)))

(declare-fun res!89604 () Bool)

(assert (=> b!189573 (= res!89604 call!19104)))

(assert (=> b!189573 (=> (not res!89604) (not e!124748))))

(declare-fun b!189574 () Bool)

(assert (=> b!189574 (= e!124754 (validKeyInArray!0 (select (arr!3796 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189575 () Bool)

(declare-fun res!89607 () Bool)

(assert (=> b!189575 (=> (not res!89607) (not e!124751))))

(assert (=> b!189575 (= res!89607 e!124744)))

(declare-fun c!34063 () Bool)

(assert (=> b!189575 (= c!34063 (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!189576 () Bool)

(assert (=> b!189576 (= e!124746 call!19100)))

(declare-fun bm!19103 () Bool)

(assert (=> bm!19103 (= call!19106 (+!294 (ite c!34065 call!19105 (ite c!34061 call!19101 call!19102)) (ite (or c!34065 c!34061) (tuple2!3465 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3707 thiss!1248)) (tuple2!3465 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3707 thiss!1248)))))))

(declare-fun b!189577 () Bool)

(assert (=> b!189577 (= e!124751 e!124745)))

(declare-fun c!34062 () Bool)

(assert (=> b!189577 (= c!34062 (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!55579 c!34065) b!189564))

(assert (= (and d!55579 (not c!34065)) b!189560))

(assert (= (and b!189560 c!34061) b!189576))

(assert (= (and b!189560 (not c!34061)) b!189572))

(assert (= (and b!189572 c!34060) b!189563))

(assert (= (and b!189572 (not c!34060)) b!189559))

(assert (= (or b!189563 b!189559) bm!19100))

(assert (= (or b!189576 bm!19100) bm!19097))

(assert (= (or b!189576 b!189563) bm!19098))

(assert (= (or b!189564 bm!19097) bm!19102))

(assert (= (or b!189564 bm!19098) bm!19103))

(assert (= (and d!55579 res!89602) b!189570))

(assert (= (and d!55579 c!34064) b!189571))

(assert (= (and d!55579 (not c!34064)) b!189565))

(assert (= (and d!55579 res!89609) b!189561))

(assert (= (and b!189561 res!89606) b!189574))

(assert (= (and b!189561 (not res!89603)) b!189562))

(assert (= (and b!189562 res!89608) b!189566))

(assert (= (and b!189561 res!89605) b!189575))

(assert (= (and b!189575 c!34063) b!189558))

(assert (= (and b!189575 (not c!34063)) b!189569))

(assert (= (and b!189558 res!89601) b!189557))

(assert (= (or b!189558 b!189569) bm!19101))

(assert (= (and b!189575 res!89607) b!189577))

(assert (= (and b!189577 c!34062) b!189573))

(assert (= (and b!189577 (not c!34062)) b!189567))

(assert (= (and b!189573 res!89604) b!189568))

(assert (= (or b!189573 b!189567) bm!19099))

(declare-fun b_lambda!7311 () Bool)

(assert (=> (not b_lambda!7311) (not b!189566)))

(assert (=> b!189566 t!7289))

(declare-fun b_and!11271 () Bool)

(assert (= b_and!11269 (and (=> t!7289 result!4865) b_and!11271)))

(assert (=> d!55579 m!215323))

(declare-fun m!215413 () Bool)

(assert (=> bm!19102 m!215413))

(declare-fun m!215415 () Bool)

(assert (=> b!189568 m!215415))

(assert (=> b!189566 m!215359))

(declare-fun m!215417 () Bool)

(assert (=> b!189566 m!215417))

(assert (=> b!189566 m!215363))

(assert (=> b!189566 m!215417))

(assert (=> b!189566 m!215359))

(declare-fun m!215419 () Bool)

(assert (=> b!189566 m!215419))

(assert (=> b!189566 m!215363))

(declare-fun m!215421 () Bool)

(assert (=> b!189566 m!215421))

(declare-fun m!215423 () Bool)

(assert (=> b!189564 m!215423))

(assert (=> b!189574 m!215363))

(assert (=> b!189574 m!215363))

(assert (=> b!189574 m!215371))

(declare-fun m!215425 () Bool)

(assert (=> b!189557 m!215425))

(declare-fun m!215427 () Bool)

(assert (=> bm!19101 m!215427))

(declare-fun m!215429 () Bool)

(assert (=> bm!19099 m!215429))

(declare-fun m!215431 () Bool)

(assert (=> bm!19103 m!215431))

(declare-fun m!215433 () Bool)

(assert (=> b!189571 m!215433))

(declare-fun m!215435 () Bool)

(assert (=> b!189571 m!215435))

(assert (=> b!189571 m!215435))

(declare-fun m!215437 () Bool)

(assert (=> b!189571 m!215437))

(declare-fun m!215439 () Bool)

(assert (=> b!189571 m!215439))

(declare-fun m!215441 () Bool)

(assert (=> b!189571 m!215441))

(assert (=> b!189571 m!215433))

(declare-fun m!215443 () Bool)

(assert (=> b!189571 m!215443))

(declare-fun m!215445 () Bool)

(assert (=> b!189571 m!215445))

(declare-fun m!215447 () Bool)

(assert (=> b!189571 m!215447))

(declare-fun m!215449 () Bool)

(assert (=> b!189571 m!215449))

(declare-fun m!215451 () Bool)

(assert (=> b!189571 m!215451))

(assert (=> b!189571 m!215413))

(declare-fun m!215453 () Bool)

(assert (=> b!189571 m!215453))

(declare-fun m!215455 () Bool)

(assert (=> b!189571 m!215455))

(declare-fun m!215457 () Bool)

(assert (=> b!189571 m!215457))

(assert (=> b!189571 m!215445))

(declare-fun m!215459 () Bool)

(assert (=> b!189571 m!215459))

(declare-fun m!215461 () Bool)

(assert (=> b!189571 m!215461))

(assert (=> b!189571 m!215363))

(assert (=> b!189571 m!215459))

(assert (=> b!189562 m!215363))

(assert (=> b!189562 m!215363))

(declare-fun m!215463 () Bool)

(assert (=> b!189562 m!215463))

(assert (=> b!189570 m!215363))

(assert (=> b!189570 m!215363))

(assert (=> b!189570 m!215371))

(assert (=> b!189394 d!55579))

(declare-fun d!55581 () Bool)

(assert (=> d!55581 (= (array_inv!2461 (_keys!5832 thiss!1248)) (bvsge (size!4117 (_keys!5832 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189389 d!55581))

(declare-fun d!55583 () Bool)

(assert (=> d!55583 (= (array_inv!2462 (_values!3849 thiss!1248)) (bvsge (size!4118 (_values!3849 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189389 d!55583))

(declare-fun d!55585 () Bool)

(declare-fun e!124757 () Bool)

(assert (=> d!55585 e!124757))

(declare-fun res!89615 () Bool)

(assert (=> d!55585 (=> (not res!89615) (not e!124757))))

(declare-fun lt!93776 () SeekEntryResult!670)

(assert (=> d!55585 (= res!89615 ((_ is Found!670) lt!93776))))

(assert (=> d!55585 (= lt!93776 (seekEntryOrOpen!0 key!828 (_keys!5832 thiss!1248) (mask!9054 thiss!1248)))))

(declare-fun lt!93775 () Unit!5678)

(declare-fun choose!1022 (array!8055 array!8057 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 64) Int) Unit!5678)

(assert (=> d!55585 (= lt!93775 (choose!1022 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)))))

(assert (=> d!55585 (validMask!0 (mask!9054 thiss!1248))))

(assert (=> d!55585 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!161 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)) lt!93775)))

(declare-fun b!189582 () Bool)

(declare-fun res!89614 () Bool)

(assert (=> b!189582 (=> (not res!89614) (not e!124757))))

(assert (=> b!189582 (= res!89614 (inRange!0 (index!4851 lt!93776) (mask!9054 thiss!1248)))))

(declare-fun b!189583 () Bool)

(assert (=> b!189583 (= e!124757 (= (select (arr!3796 (_keys!5832 thiss!1248)) (index!4851 lt!93776)) key!828))))

(assert (=> b!189583 (and (bvsge (index!4851 lt!93776) #b00000000000000000000000000000000) (bvslt (index!4851 lt!93776) (size!4117 (_keys!5832 thiss!1248))))))

(assert (= (and d!55585 res!89615) b!189582))

(assert (= (and b!189582 res!89614) b!189583))

(assert (=> d!55585 m!215253))

(declare-fun m!215465 () Bool)

(assert (=> d!55585 m!215465))

(assert (=> d!55585 m!215323))

(declare-fun m!215467 () Bool)

(assert (=> b!189582 m!215467))

(declare-fun m!215469 () Bool)

(assert (=> b!189583 m!215469))

(assert (=> b!189388 d!55585))

(declare-fun d!55587 () Bool)

(assert (=> d!55587 (= (inRange!0 (index!4851 lt!93609) (mask!9054 thiss!1248)) (and (bvsge (index!4851 lt!93609) #b00000000000000000000000000000000) (bvslt (index!4851 lt!93609) (bvadd (mask!9054 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!189388 d!55587))

(declare-fun b!189600 () Bool)

(declare-fun e!124768 () Bool)

(declare-fun e!124767 () Bool)

(assert (=> b!189600 (= e!124768 e!124767)))

(declare-fun c!34070 () Bool)

(declare-fun lt!93782 () SeekEntryResult!670)

(assert (=> b!189600 (= c!34070 ((_ is MissingVacant!670) lt!93782))))

(declare-fun b!189601 () Bool)

(assert (=> b!189601 (and (bvsge (index!4850 lt!93782) #b00000000000000000000000000000000) (bvslt (index!4850 lt!93782) (size!4117 (_keys!5832 thiss!1248))))))

(declare-fun res!89627 () Bool)

(assert (=> b!189601 (= res!89627 (= (select (arr!3796 (_keys!5832 thiss!1248)) (index!4850 lt!93782)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!124769 () Bool)

(assert (=> b!189601 (=> (not res!89627) (not e!124769))))

(declare-fun d!55589 () Bool)

(assert (=> d!55589 e!124768))

(declare-fun c!34071 () Bool)

(assert (=> d!55589 (= c!34071 ((_ is MissingZero!670) lt!93782))))

(assert (=> d!55589 (= lt!93782 (seekEntryOrOpen!0 key!828 (_keys!5832 thiss!1248) (mask!9054 thiss!1248)))))

(declare-fun lt!93781 () Unit!5678)

(declare-fun choose!1023 (array!8055 array!8057 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 64) Int) Unit!5678)

(assert (=> d!55589 (= lt!93781 (choose!1023 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)))))

(assert (=> d!55589 (validMask!0 (mask!9054 thiss!1248))))

(assert (=> d!55589 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!160 (_keys!5832 thiss!1248) (_values!3849 thiss!1248) (mask!9054 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)) lt!93781)))

(declare-fun call!19112 () Bool)

(declare-fun bm!19108 () Bool)

(assert (=> bm!19108 (= call!19112 (inRange!0 (ite c!34071 (index!4850 lt!93782) (index!4853 lt!93782)) (mask!9054 thiss!1248)))))

(declare-fun b!189602 () Bool)

(declare-fun res!89626 () Bool)

(declare-fun e!124766 () Bool)

(assert (=> b!189602 (=> (not res!89626) (not e!124766))))

(assert (=> b!189602 (= res!89626 call!19112)))

(assert (=> b!189602 (= e!124767 e!124766)))

(declare-fun b!189603 () Bool)

(declare-fun call!19111 () Bool)

(assert (=> b!189603 (= e!124766 (not call!19111))))

(declare-fun b!189604 () Bool)

(assert (=> b!189604 (= e!124767 ((_ is Undefined!670) lt!93782))))

(declare-fun bm!19109 () Bool)

(declare-fun arrayContainsKey!0 (array!8055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19109 (= call!19111 (arrayContainsKey!0 (_keys!5832 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!189605 () Bool)

(assert (=> b!189605 (= e!124769 (not call!19111))))

(declare-fun b!189606 () Bool)

(declare-fun res!89624 () Bool)

(assert (=> b!189606 (=> (not res!89624) (not e!124766))))

(assert (=> b!189606 (= res!89624 (= (select (arr!3796 (_keys!5832 thiss!1248)) (index!4853 lt!93782)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189606 (and (bvsge (index!4853 lt!93782) #b00000000000000000000000000000000) (bvslt (index!4853 lt!93782) (size!4117 (_keys!5832 thiss!1248))))))

(declare-fun b!189607 () Bool)

(assert (=> b!189607 (= e!124768 e!124769)))

(declare-fun res!89625 () Bool)

(assert (=> b!189607 (= res!89625 call!19112)))

(assert (=> b!189607 (=> (not res!89625) (not e!124769))))

(assert (= (and d!55589 c!34071) b!189607))

(assert (= (and d!55589 (not c!34071)) b!189600))

(assert (= (and b!189607 res!89625) b!189601))

(assert (= (and b!189601 res!89627) b!189605))

(assert (= (and b!189600 c!34070) b!189602))

(assert (= (and b!189600 (not c!34070)) b!189604))

(assert (= (and b!189602 res!89626) b!189606))

(assert (= (and b!189606 res!89624) b!189603))

(assert (= (or b!189607 b!189602) bm!19108))

(assert (= (or b!189605 b!189603) bm!19109))

(declare-fun m!215471 () Bool)

(assert (=> b!189606 m!215471))

(declare-fun m!215473 () Bool)

(assert (=> b!189601 m!215473))

(assert (=> d!55589 m!215253))

(declare-fun m!215475 () Bool)

(assert (=> d!55589 m!215475))

(assert (=> d!55589 m!215323))

(declare-fun m!215477 () Bool)

(assert (=> bm!19109 m!215477))

(declare-fun m!215479 () Bool)

(assert (=> bm!19108 m!215479))

(assert (=> b!189392 d!55589))

(declare-fun d!55591 () Bool)

(declare-fun res!89634 () Bool)

(declare-fun e!124772 () Bool)

(assert (=> d!55591 (=> (not res!89634) (not e!124772))))

(declare-fun simpleValid!193 (LongMapFixedSize!2644) Bool)

(assert (=> d!55591 (= res!89634 (simpleValid!193 thiss!1248))))

(assert (=> d!55591 (= (valid!1105 thiss!1248) e!124772)))

(declare-fun b!189614 () Bool)

(declare-fun res!89635 () Bool)

(assert (=> b!189614 (=> (not res!89635) (not e!124772))))

(declare-fun arrayCountValidKeys!0 (array!8055 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!189614 (= res!89635 (= (arrayCountValidKeys!0 (_keys!5832 thiss!1248) #b00000000000000000000000000000000 (size!4117 (_keys!5832 thiss!1248))) (_size!1371 thiss!1248)))))

(declare-fun b!189615 () Bool)

(declare-fun res!89636 () Bool)

(assert (=> b!189615 (=> (not res!89636) (not e!124772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8055 (_ BitVec 32)) Bool)

(assert (=> b!189615 (= res!89636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5832 thiss!1248) (mask!9054 thiss!1248)))))

(declare-fun b!189616 () Bool)

(declare-datatypes ((List!2393 0))(
  ( (Nil!2390) (Cons!2389 (h!3026 (_ BitVec 64)) (t!7290 List!2393)) )
))
(declare-fun arrayNoDuplicates!0 (array!8055 (_ BitVec 32) List!2393) Bool)

(assert (=> b!189616 (= e!124772 (arrayNoDuplicates!0 (_keys!5832 thiss!1248) #b00000000000000000000000000000000 Nil!2390))))

(assert (= (and d!55591 res!89634) b!189614))

(assert (= (and b!189614 res!89635) b!189615))

(assert (= (and b!189615 res!89636) b!189616))

(declare-fun m!215481 () Bool)

(assert (=> d!55591 m!215481))

(declare-fun m!215483 () Bool)

(assert (=> b!189614 m!215483))

(declare-fun m!215485 () Bool)

(assert (=> b!189615 m!215485))

(declare-fun m!215487 () Bool)

(assert (=> b!189616 m!215487))

(assert (=> start!19264 d!55591))

(declare-fun mapNonEmpty!7639 () Bool)

(declare-fun mapRes!7639 () Bool)

(declare-fun tp!16801 () Bool)

(declare-fun e!124778 () Bool)

(assert (=> mapNonEmpty!7639 (= mapRes!7639 (and tp!16801 e!124778))))

(declare-fun mapKey!7639 () (_ BitVec 32))

(declare-fun mapValue!7639 () ValueCell!1868)

(declare-fun mapRest!7639 () (Array (_ BitVec 32) ValueCell!1868))

(assert (=> mapNonEmpty!7639 (= mapRest!7630 (store mapRest!7639 mapKey!7639 mapValue!7639))))

(declare-fun b!189623 () Bool)

(assert (=> b!189623 (= e!124778 tp_is_empty!4423)))

(declare-fun b!189624 () Bool)

(declare-fun e!124777 () Bool)

(assert (=> b!189624 (= e!124777 tp_is_empty!4423)))

(declare-fun mapIsEmpty!7639 () Bool)

(assert (=> mapIsEmpty!7639 mapRes!7639))

(declare-fun condMapEmpty!7639 () Bool)

(declare-fun mapDefault!7639 () ValueCell!1868)

(assert (=> mapNonEmpty!7630 (= condMapEmpty!7639 (= mapRest!7630 ((as const (Array (_ BitVec 32) ValueCell!1868)) mapDefault!7639)))))

(assert (=> mapNonEmpty!7630 (= tp!16785 (and e!124777 mapRes!7639))))

(assert (= (and mapNonEmpty!7630 condMapEmpty!7639) mapIsEmpty!7639))

(assert (= (and mapNonEmpty!7630 (not condMapEmpty!7639)) mapNonEmpty!7639))

(assert (= (and mapNonEmpty!7639 ((_ is ValueCellFull!1868) mapValue!7639)) b!189623))

(assert (= (and mapNonEmpty!7630 ((_ is ValueCellFull!1868) mapDefault!7639)) b!189624))

(declare-fun m!215489 () Bool)

(assert (=> mapNonEmpty!7639 m!215489))

(declare-fun b_lambda!7313 () Bool)

(assert (= b_lambda!7309 (or (and b!189389 b_free!4651) b_lambda!7313)))

(declare-fun b_lambda!7315 () Bool)

(assert (= b_lambda!7311 (or (and b!189389 b_free!4651) b_lambda!7315)))

(check-sat (not b!189539) (not bm!19094) (not bm!19096) (not b!189489) (not b!189616) (not bm!19108) (not b!189491) (not bm!19099) (not d!55591) (not b!189562) (not b!189551) (not bm!19101) (not b!189568) (not b!189541) (not b_next!4651) (not b!189566) (not d!55589) (not b!189534) (not bm!19095) (not bm!19102) (not mapNonEmpty!7639) (not b!189614) (not b!189570) (not d!55577) b_and!11271 (not b!189548) (not d!55575) (not b!189476) (not d!55569) (not b!189545) (not b!189582) (not bm!19103) (not b!189482) (not b!189543) (not b!189557) (not d!55571) (not d!55585) tp_is_empty!4423 (not b_lambda!7315) (not bm!19092) (not b!189547) (not d!55573) (not b!189615) (not b!189473) (not b!189481) (not bm!19109) (not d!55579) (not b!189564) (not b!189571) (not b_lambda!7313) (not b!189574))
(check-sat b_and!11271 (not b_next!4651))
