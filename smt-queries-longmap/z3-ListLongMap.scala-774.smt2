; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18274 () Bool)

(assert start!18274)

(declare-fun b!181600 () Bool)

(declare-fun b_free!4485 () Bool)

(declare-fun b_next!4485 () Bool)

(assert (=> b!181600 (= b_free!4485 (not b_next!4485))))

(declare-fun tp!16205 () Bool)

(declare-fun b_and!11035 () Bool)

(assert (=> b!181600 (= tp!16205 b_and!11035)))

(declare-fun res!85972 () Bool)

(declare-fun e!119610 () Bool)

(assert (=> start!18274 (=> (not res!85972) (not e!119610))))

(declare-datatypes ((V!5323 0))(
  ( (V!5324 (val!2173 Int)) )
))
(declare-datatypes ((ValueCell!1785 0))(
  ( (ValueCellFull!1785 (v!4070 V!5323)) (EmptyCell!1785) )
))
(declare-datatypes ((array!7695 0))(
  ( (array!7696 (arr!3641 (Array (_ BitVec 32) (_ BitVec 64))) (size!3951 (_ BitVec 32))) )
))
(declare-datatypes ((array!7697 0))(
  ( (array!7698 (arr!3642 (Array (_ BitVec 32) ValueCell!1785)) (size!3952 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2478 0))(
  ( (LongMapFixedSize!2479 (defaultEntry!3721 Int) (mask!8746 (_ BitVec 32)) (extraKeys!3458 (_ BitVec 32)) (zeroValue!3562 V!5323) (minValue!3562 V!5323) (_size!1288 (_ BitVec 32)) (_keys!5624 array!7695) (_values!3704 array!7697) (_vacant!1288 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2478)

(declare-fun valid!1027 (LongMapFixedSize!2478) Bool)

(assert (=> start!18274 (= res!85972 (valid!1027 thiss!1248))))

(assert (=> start!18274 e!119610))

(declare-fun e!119611 () Bool)

(assert (=> start!18274 e!119611))

(assert (=> start!18274 true))

(declare-fun mapNonEmpty!7299 () Bool)

(declare-fun mapRes!7299 () Bool)

(declare-fun tp!16206 () Bool)

(declare-fun e!119608 () Bool)

(assert (=> mapNonEmpty!7299 (= mapRes!7299 (and tp!16206 e!119608))))

(declare-fun mapKey!7299 () (_ BitVec 32))

(declare-fun mapValue!7299 () ValueCell!1785)

(declare-fun mapRest!7299 () (Array (_ BitVec 32) ValueCell!1785))

(assert (=> mapNonEmpty!7299 (= (arr!3642 (_values!3704 thiss!1248)) (store mapRest!7299 mapKey!7299 mapValue!7299))))

(declare-fun b!181595 () Bool)

(declare-fun res!85970 () Bool)

(declare-fun e!119609 () Bool)

(assert (=> b!181595 (=> (not res!85970) (not e!119609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181595 (= res!85970 (validMask!0 (mask!8746 thiss!1248)))))

(declare-fun b!181596 () Bool)

(declare-fun tp_is_empty!4257 () Bool)

(assert (=> b!181596 (= e!119608 tp_is_empty!4257)))

(declare-fun b!181597 () Bool)

(assert (=> b!181597 (= e!119610 e!119609)))

(declare-fun res!85973 () Bool)

(assert (=> b!181597 (=> (not res!85973) (not e!119609))))

(declare-datatypes ((SeekEntryResult!602 0))(
  ( (MissingZero!602 (index!4578 (_ BitVec 32))) (Found!602 (index!4579 (_ BitVec 32))) (Intermediate!602 (undefined!1414 Bool) (index!4580 (_ BitVec 32)) (x!19824 (_ BitVec 32))) (Undefined!602) (MissingVacant!602 (index!4581 (_ BitVec 32))) )
))
(declare-fun lt!89781 () SeekEntryResult!602)

(get-info :version)

(assert (=> b!181597 (= res!85973 (and (not ((_ is Undefined!602) lt!89781)) (not ((_ is MissingVacant!602) lt!89781)) (not ((_ is MissingZero!602) lt!89781)) ((_ is Found!602) lt!89781)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7695 (_ BitVec 32)) SeekEntryResult!602)

(assert (=> b!181597 (= lt!89781 (seekEntryOrOpen!0 key!828 (_keys!5624 thiss!1248) (mask!8746 thiss!1248)))))

(declare-fun b!181598 () Bool)

(declare-fun e!119607 () Bool)

(declare-fun e!119606 () Bool)

(assert (=> b!181598 (= e!119607 (and e!119606 mapRes!7299))))

(declare-fun condMapEmpty!7299 () Bool)

(declare-fun mapDefault!7299 () ValueCell!1785)

(assert (=> b!181598 (= condMapEmpty!7299 (= (arr!3642 (_values!3704 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1785)) mapDefault!7299)))))

(declare-fun mapIsEmpty!7299 () Bool)

(assert (=> mapIsEmpty!7299 mapRes!7299))

(declare-fun b!181599 () Bool)

(assert (=> b!181599 (= e!119609 (and (= (size!3952 (_values!3704 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8746 thiss!1248))) (= (size!3951 (_keys!5624 thiss!1248)) (size!3952 (_values!3704 thiss!1248))) (bvsge (mask!8746 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3458 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun array_inv!2345 (array!7695) Bool)

(declare-fun array_inv!2346 (array!7697) Bool)

(assert (=> b!181600 (= e!119611 (and tp!16205 tp_is_empty!4257 (array_inv!2345 (_keys!5624 thiss!1248)) (array_inv!2346 (_values!3704 thiss!1248)) e!119607))))

(declare-fun b!181601 () Bool)

(assert (=> b!181601 (= e!119606 tp_is_empty!4257)))

(declare-fun b!181602 () Bool)

(declare-fun res!85969 () Bool)

(assert (=> b!181602 (=> (not res!85969) (not e!119609))))

(declare-datatypes ((tuple2!3390 0))(
  ( (tuple2!3391 (_1!1706 (_ BitVec 64)) (_2!1706 V!5323)) )
))
(declare-datatypes ((List!2310 0))(
  ( (Nil!2307) (Cons!2306 (h!2933 tuple2!3390) (t!7166 List!2310)) )
))
(declare-datatypes ((ListLongMap!2307 0))(
  ( (ListLongMap!2308 (toList!1169 List!2310)) )
))
(declare-fun contains!1249 (ListLongMap!2307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!817 (array!7695 array!7697 (_ BitVec 32) (_ BitVec 32) V!5323 V!5323 (_ BitVec 32) Int) ListLongMap!2307)

(assert (=> b!181602 (= res!85969 (contains!1249 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)) key!828))))

(declare-fun b!181603 () Bool)

(declare-fun res!85971 () Bool)

(assert (=> b!181603 (=> (not res!85971) (not e!119610))))

(assert (=> b!181603 (= res!85971 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!18274 res!85972) b!181603))

(assert (= (and b!181603 res!85971) b!181597))

(assert (= (and b!181597 res!85973) b!181602))

(assert (= (and b!181602 res!85969) b!181595))

(assert (= (and b!181595 res!85970) b!181599))

(assert (= (and b!181598 condMapEmpty!7299) mapIsEmpty!7299))

(assert (= (and b!181598 (not condMapEmpty!7299)) mapNonEmpty!7299))

(assert (= (and mapNonEmpty!7299 ((_ is ValueCellFull!1785) mapValue!7299)) b!181596))

(assert (= (and b!181598 ((_ is ValueCellFull!1785) mapDefault!7299)) b!181601))

(assert (= b!181600 b!181598))

(assert (= start!18274 b!181600))

(declare-fun m!209465 () Bool)

(assert (=> b!181595 m!209465))

(declare-fun m!209467 () Bool)

(assert (=> b!181602 m!209467))

(assert (=> b!181602 m!209467))

(declare-fun m!209469 () Bool)

(assert (=> b!181602 m!209469))

(declare-fun m!209471 () Bool)

(assert (=> start!18274 m!209471))

(declare-fun m!209473 () Bool)

(assert (=> mapNonEmpty!7299 m!209473))

(declare-fun m!209475 () Bool)

(assert (=> b!181600 m!209475))

(declare-fun m!209477 () Bool)

(assert (=> b!181600 m!209477))

(declare-fun m!209479 () Bool)

(assert (=> b!181597 m!209479))

(check-sat (not b!181600) (not b!181597) tp_is_empty!4257 (not b_next!4485) (not b!181595) (not b!181602) (not mapNonEmpty!7299) (not start!18274) b_and!11035)
(check-sat b_and!11035 (not b_next!4485))
(get-model)

(declare-fun d!54445 () Bool)

(assert (=> d!54445 (= (array_inv!2345 (_keys!5624 thiss!1248)) (bvsge (size!3951 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181600 d!54445))

(declare-fun d!54447 () Bool)

(assert (=> d!54447 (= (array_inv!2346 (_values!3704 thiss!1248)) (bvsge (size!3952 (_values!3704 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181600 d!54447))

(declare-fun d!54449 () Bool)

(assert (=> d!54449 (= (validMask!0 (mask!8746 thiss!1248)) (and (or (= (mask!8746 thiss!1248) #b00000000000000000000000000000111) (= (mask!8746 thiss!1248) #b00000000000000000000000000001111) (= (mask!8746 thiss!1248) #b00000000000000000000000000011111) (= (mask!8746 thiss!1248) #b00000000000000000000000000111111) (= (mask!8746 thiss!1248) #b00000000000000000000000001111111) (= (mask!8746 thiss!1248) #b00000000000000000000000011111111) (= (mask!8746 thiss!1248) #b00000000000000000000000111111111) (= (mask!8746 thiss!1248) #b00000000000000000000001111111111) (= (mask!8746 thiss!1248) #b00000000000000000000011111111111) (= (mask!8746 thiss!1248) #b00000000000000000000111111111111) (= (mask!8746 thiss!1248) #b00000000000000000001111111111111) (= (mask!8746 thiss!1248) #b00000000000000000011111111111111) (= (mask!8746 thiss!1248) #b00000000000000000111111111111111) (= (mask!8746 thiss!1248) #b00000000000000001111111111111111) (= (mask!8746 thiss!1248) #b00000000000000011111111111111111) (= (mask!8746 thiss!1248) #b00000000000000111111111111111111) (= (mask!8746 thiss!1248) #b00000000000001111111111111111111) (= (mask!8746 thiss!1248) #b00000000000011111111111111111111) (= (mask!8746 thiss!1248) #b00000000000111111111111111111111) (= (mask!8746 thiss!1248) #b00000000001111111111111111111111) (= (mask!8746 thiss!1248) #b00000000011111111111111111111111) (= (mask!8746 thiss!1248) #b00000000111111111111111111111111) (= (mask!8746 thiss!1248) #b00000001111111111111111111111111) (= (mask!8746 thiss!1248) #b00000011111111111111111111111111) (= (mask!8746 thiss!1248) #b00000111111111111111111111111111) (= (mask!8746 thiss!1248) #b00001111111111111111111111111111) (= (mask!8746 thiss!1248) #b00011111111111111111111111111111) (= (mask!8746 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8746 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!181595 d!54449))

(declare-fun d!54451 () Bool)

(declare-fun res!85995 () Bool)

(declare-fun e!119635 () Bool)

(assert (=> d!54451 (=> (not res!85995) (not e!119635))))

(declare-fun simpleValid!169 (LongMapFixedSize!2478) Bool)

(assert (=> d!54451 (= res!85995 (simpleValid!169 thiss!1248))))

(assert (=> d!54451 (= (valid!1027 thiss!1248) e!119635)))

(declare-fun b!181637 () Bool)

(declare-fun res!85996 () Bool)

(assert (=> b!181637 (=> (not res!85996) (not e!119635))))

(declare-fun arrayCountValidKeys!0 (array!7695 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181637 (= res!85996 (= (arrayCountValidKeys!0 (_keys!5624 thiss!1248) #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))) (_size!1288 thiss!1248)))))

(declare-fun b!181638 () Bool)

(declare-fun res!85997 () Bool)

(assert (=> b!181638 (=> (not res!85997) (not e!119635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7695 (_ BitVec 32)) Bool)

(assert (=> b!181638 (= res!85997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5624 thiss!1248) (mask!8746 thiss!1248)))))

(declare-fun b!181639 () Bool)

(declare-datatypes ((List!2312 0))(
  ( (Nil!2309) (Cons!2308 (h!2935 (_ BitVec 64)) (t!7170 List!2312)) )
))
(declare-fun arrayNoDuplicates!0 (array!7695 (_ BitVec 32) List!2312) Bool)

(assert (=> b!181639 (= e!119635 (arrayNoDuplicates!0 (_keys!5624 thiss!1248) #b00000000000000000000000000000000 Nil!2309))))

(assert (= (and d!54451 res!85995) b!181637))

(assert (= (and b!181637 res!85996) b!181638))

(assert (= (and b!181638 res!85997) b!181639))

(declare-fun m!209497 () Bool)

(assert (=> d!54451 m!209497))

(declare-fun m!209499 () Bool)

(assert (=> b!181637 m!209499))

(declare-fun m!209501 () Bool)

(assert (=> b!181638 m!209501))

(declare-fun m!209503 () Bool)

(assert (=> b!181639 m!209503))

(assert (=> start!18274 d!54451))

(declare-fun b!181652 () Bool)

(declare-fun e!119642 () SeekEntryResult!602)

(declare-fun e!119643 () SeekEntryResult!602)

(assert (=> b!181652 (= e!119642 e!119643)))

(declare-fun lt!89791 () (_ BitVec 64))

(declare-fun lt!89793 () SeekEntryResult!602)

(assert (=> b!181652 (= lt!89791 (select (arr!3641 (_keys!5624 thiss!1248)) (index!4580 lt!89793)))))

(declare-fun c!32550 () Bool)

(assert (=> b!181652 (= c!32550 (= lt!89791 key!828))))

(declare-fun d!54453 () Bool)

(declare-fun lt!89792 () SeekEntryResult!602)

(assert (=> d!54453 (and (or ((_ is Undefined!602) lt!89792) (not ((_ is Found!602) lt!89792)) (and (bvsge (index!4579 lt!89792) #b00000000000000000000000000000000) (bvslt (index!4579 lt!89792) (size!3951 (_keys!5624 thiss!1248))))) (or ((_ is Undefined!602) lt!89792) ((_ is Found!602) lt!89792) (not ((_ is MissingZero!602) lt!89792)) (and (bvsge (index!4578 lt!89792) #b00000000000000000000000000000000) (bvslt (index!4578 lt!89792) (size!3951 (_keys!5624 thiss!1248))))) (or ((_ is Undefined!602) lt!89792) ((_ is Found!602) lt!89792) ((_ is MissingZero!602) lt!89792) (not ((_ is MissingVacant!602) lt!89792)) (and (bvsge (index!4581 lt!89792) #b00000000000000000000000000000000) (bvslt (index!4581 lt!89792) (size!3951 (_keys!5624 thiss!1248))))) (or ((_ is Undefined!602) lt!89792) (ite ((_ is Found!602) lt!89792) (= (select (arr!3641 (_keys!5624 thiss!1248)) (index!4579 lt!89792)) key!828) (ite ((_ is MissingZero!602) lt!89792) (= (select (arr!3641 (_keys!5624 thiss!1248)) (index!4578 lt!89792)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!602) lt!89792) (= (select (arr!3641 (_keys!5624 thiss!1248)) (index!4581 lt!89792)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54453 (= lt!89792 e!119642)))

(declare-fun c!32551 () Bool)

(assert (=> d!54453 (= c!32551 (and ((_ is Intermediate!602) lt!89793) (undefined!1414 lt!89793)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7695 (_ BitVec 32)) SeekEntryResult!602)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54453 (= lt!89793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8746 thiss!1248)) key!828 (_keys!5624 thiss!1248) (mask!8746 thiss!1248)))))

(assert (=> d!54453 (validMask!0 (mask!8746 thiss!1248))))

(assert (=> d!54453 (= (seekEntryOrOpen!0 key!828 (_keys!5624 thiss!1248) (mask!8746 thiss!1248)) lt!89792)))

(declare-fun b!181653 () Bool)

(assert (=> b!181653 (= e!119642 Undefined!602)))

(declare-fun b!181654 () Bool)

(declare-fun c!32549 () Bool)

(assert (=> b!181654 (= c!32549 (= lt!89791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119644 () SeekEntryResult!602)

(assert (=> b!181654 (= e!119643 e!119644)))

(declare-fun b!181655 () Bool)

(assert (=> b!181655 (= e!119644 (MissingZero!602 (index!4580 lt!89793)))))

(declare-fun b!181656 () Bool)

(assert (=> b!181656 (= e!119643 (Found!602 (index!4580 lt!89793)))))

(declare-fun b!181657 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7695 (_ BitVec 32)) SeekEntryResult!602)

(assert (=> b!181657 (= e!119644 (seekKeyOrZeroReturnVacant!0 (x!19824 lt!89793) (index!4580 lt!89793) (index!4580 lt!89793) key!828 (_keys!5624 thiss!1248) (mask!8746 thiss!1248)))))

(assert (= (and d!54453 c!32551) b!181653))

(assert (= (and d!54453 (not c!32551)) b!181652))

(assert (= (and b!181652 c!32550) b!181656))

(assert (= (and b!181652 (not c!32550)) b!181654))

(assert (= (and b!181654 c!32549) b!181655))

(assert (= (and b!181654 (not c!32549)) b!181657))

(declare-fun m!209505 () Bool)

(assert (=> b!181652 m!209505))

(declare-fun m!209507 () Bool)

(assert (=> d!54453 m!209507))

(declare-fun m!209509 () Bool)

(assert (=> d!54453 m!209509))

(declare-fun m!209511 () Bool)

(assert (=> d!54453 m!209511))

(declare-fun m!209513 () Bool)

(assert (=> d!54453 m!209513))

(assert (=> d!54453 m!209465))

(assert (=> d!54453 m!209513))

(declare-fun m!209515 () Bool)

(assert (=> d!54453 m!209515))

(declare-fun m!209517 () Bool)

(assert (=> b!181657 m!209517))

(assert (=> b!181597 d!54453))

(declare-fun d!54455 () Bool)

(declare-fun e!119650 () Bool)

(assert (=> d!54455 e!119650))

(declare-fun res!86000 () Bool)

(assert (=> d!54455 (=> res!86000 e!119650)))

(declare-fun lt!89803 () Bool)

(assert (=> d!54455 (= res!86000 (not lt!89803))))

(declare-fun lt!89805 () Bool)

(assert (=> d!54455 (= lt!89803 lt!89805)))

(declare-datatypes ((Unit!5516 0))(
  ( (Unit!5517) )
))
(declare-fun lt!89804 () Unit!5516)

(declare-fun e!119649 () Unit!5516)

(assert (=> d!54455 (= lt!89804 e!119649)))

(declare-fun c!32554 () Bool)

(assert (=> d!54455 (= c!32554 lt!89805)))

(declare-fun containsKey!214 (List!2310 (_ BitVec 64)) Bool)

(assert (=> d!54455 (= lt!89805 (containsKey!214 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828))))

(assert (=> d!54455 (= (contains!1249 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)) key!828) lt!89803)))

(declare-fun b!181664 () Bool)

(declare-fun lt!89802 () Unit!5516)

(assert (=> b!181664 (= e!119649 lt!89802)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!162 (List!2310 (_ BitVec 64)) Unit!5516)

(assert (=> b!181664 (= lt!89802 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828))))

(declare-datatypes ((Option!216 0))(
  ( (Some!215 (v!4072 V!5323)) (None!214) )
))
(declare-fun isDefined!163 (Option!216) Bool)

(declare-fun getValueByKey!210 (List!2310 (_ BitVec 64)) Option!216)

(assert (=> b!181664 (isDefined!163 (getValueByKey!210 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828))))

(declare-fun b!181665 () Bool)

(declare-fun Unit!5518 () Unit!5516)

(assert (=> b!181665 (= e!119649 Unit!5518)))

(declare-fun b!181666 () Bool)

(assert (=> b!181666 (= e!119650 (isDefined!163 (getValueByKey!210 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828)))))

(assert (= (and d!54455 c!32554) b!181664))

(assert (= (and d!54455 (not c!32554)) b!181665))

(assert (= (and d!54455 (not res!86000)) b!181666))

(declare-fun m!209519 () Bool)

(assert (=> d!54455 m!209519))

(declare-fun m!209521 () Bool)

(assert (=> b!181664 m!209521))

(declare-fun m!209523 () Bool)

(assert (=> b!181664 m!209523))

(assert (=> b!181664 m!209523))

(declare-fun m!209525 () Bool)

(assert (=> b!181664 m!209525))

(assert (=> b!181666 m!209523))

(assert (=> b!181666 m!209523))

(assert (=> b!181666 m!209525))

(assert (=> b!181602 d!54455))

(declare-fun b!181709 () Bool)

(declare-fun e!119681 () Bool)

(declare-fun call!18358 () Bool)

(assert (=> b!181709 (= e!119681 (not call!18358))))

(declare-fun b!181710 () Bool)

(declare-fun res!86027 () Bool)

(declare-fun e!119679 () Bool)

(assert (=> b!181710 (=> (not res!86027) (not e!119679))))

(assert (=> b!181710 (= res!86027 e!119681)))

(declare-fun c!32567 () Bool)

(assert (=> b!181710 (= c!32567 (not (= (bvand (extraKeys!3458 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!181711 () Bool)

(declare-fun c!32569 () Bool)

(assert (=> b!181711 (= c!32569 (and (not (= (bvand (extraKeys!3458 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3458 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!119689 () ListLongMap!2307)

(declare-fun e!119678 () ListLongMap!2307)

(assert (=> b!181711 (= e!119689 e!119678)))

(declare-fun b!181712 () Bool)

(declare-fun e!119677 () Bool)

(declare-fun lt!89868 () ListLongMap!2307)

(declare-fun apply!153 (ListLongMap!2307 (_ BitVec 64)) V!5323)

(declare-fun get!2082 (ValueCell!1785 V!5323) V!5323)

(declare-fun dynLambda!496 (Int (_ BitVec 64)) V!5323)

(assert (=> b!181712 (= e!119677 (= (apply!153 lt!89868 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)) (get!2082 (select (arr!3642 (_values!3704 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3721 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3952 (_values!3704 thiss!1248))))))

(assert (=> b!181712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(declare-fun bm!18355 () Bool)

(assert (=> bm!18355 (= call!18358 (contains!1249 lt!89868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181713 () Bool)

(declare-fun e!119686 () Bool)

(assert (=> b!181713 (= e!119686 e!119677)))

(declare-fun res!86023 () Bool)

(assert (=> b!181713 (=> (not res!86023) (not e!119677))))

(assert (=> b!181713 (= res!86023 (contains!1249 lt!89868 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181713 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(declare-fun b!181714 () Bool)

(declare-fun e!119688 () ListLongMap!2307)

(declare-fun call!18362 () ListLongMap!2307)

(declare-fun +!273 (ListLongMap!2307 tuple2!3390) ListLongMap!2307)

(assert (=> b!181714 (= e!119688 (+!273 call!18362 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))))))

(declare-fun bm!18356 () Bool)

(declare-fun call!18360 () Bool)

(assert (=> bm!18356 (= call!18360 (contains!1249 lt!89868 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181715 () Bool)

(declare-fun e!119683 () Unit!5516)

(declare-fun Unit!5519 () Unit!5516)

(assert (=> b!181715 (= e!119683 Unit!5519)))

(declare-fun bm!18357 () Bool)

(declare-fun call!18363 () ListLongMap!2307)

(declare-fun call!18364 () ListLongMap!2307)

(assert (=> bm!18357 (= call!18363 call!18364)))

(declare-fun b!181716 () Bool)

(declare-fun e!119682 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!181716 (= e!119682 (validKeyInArray!0 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18358 () Bool)

(declare-fun call!18361 () ListLongMap!2307)

(assert (=> bm!18358 (= call!18361 call!18363)))

(declare-fun b!181718 () Bool)

(assert (=> b!181718 (= e!119688 e!119689)))

(declare-fun c!32570 () Bool)

(assert (=> b!181718 (= c!32570 (and (not (= (bvand (extraKeys!3458 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3458 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181719 () Bool)

(declare-fun e!119687 () Bool)

(assert (=> b!181719 (= e!119679 e!119687)))

(declare-fun c!32571 () Bool)

(assert (=> b!181719 (= c!32571 (not (= (bvand (extraKeys!3458 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181720 () Bool)

(declare-fun e!119685 () Bool)

(assert (=> b!181720 (= e!119685 (validKeyInArray!0 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181721 () Bool)

(assert (=> b!181721 (= e!119687 (not call!18360))))

(declare-fun b!181722 () Bool)

(declare-fun call!18359 () ListLongMap!2307)

(assert (=> b!181722 (= e!119678 call!18359)))

(declare-fun b!181723 () Bool)

(declare-fun e!119684 () Bool)

(assert (=> b!181723 (= e!119684 (= (apply!153 lt!89868 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3562 thiss!1248)))))

(declare-fun b!181724 () Bool)

(assert (=> b!181724 (= e!119689 call!18359)))

(declare-fun b!181725 () Bool)

(assert (=> b!181725 (= e!119678 call!18361)))

(declare-fun bm!18359 () Bool)

(assert (=> bm!18359 (= call!18359 call!18362)))

(declare-fun c!32572 () Bool)

(declare-fun bm!18360 () Bool)

(assert (=> bm!18360 (= call!18362 (+!273 (ite c!32572 call!18364 (ite c!32570 call!18363 call!18361)) (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))))))

(declare-fun b!181726 () Bool)

(declare-fun res!86024 () Bool)

(assert (=> b!181726 (=> (not res!86024) (not e!119679))))

(assert (=> b!181726 (= res!86024 e!119686)))

(declare-fun res!86022 () Bool)

(assert (=> b!181726 (=> res!86022 e!119686)))

(assert (=> b!181726 (= res!86022 (not e!119682))))

(declare-fun res!86025 () Bool)

(assert (=> b!181726 (=> (not res!86025) (not e!119682))))

(assert (=> b!181726 (= res!86025 (bvslt #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(declare-fun b!181727 () Bool)

(declare-fun lt!89855 () Unit!5516)

(assert (=> b!181727 (= e!119683 lt!89855)))

(declare-fun lt!89865 () ListLongMap!2307)

(declare-fun getCurrentListMapNoExtraKeys!186 (array!7695 array!7697 (_ BitVec 32) (_ BitVec 32) V!5323 V!5323 (_ BitVec 32) Int) ListLongMap!2307)

(assert (=> b!181727 (= lt!89865 (getCurrentListMapNoExtraKeys!186 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))))

(declare-fun lt!89850 () (_ BitVec 64))

(assert (=> b!181727 (= lt!89850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89860 () (_ BitVec 64))

(assert (=> b!181727 (= lt!89860 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89856 () Unit!5516)

(declare-fun addStillContains!129 (ListLongMap!2307 (_ BitVec 64) V!5323 (_ BitVec 64)) Unit!5516)

(assert (=> b!181727 (= lt!89856 (addStillContains!129 lt!89865 lt!89850 (zeroValue!3562 thiss!1248) lt!89860))))

(assert (=> b!181727 (contains!1249 (+!273 lt!89865 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248))) lt!89860)))

(declare-fun lt!89862 () Unit!5516)

(assert (=> b!181727 (= lt!89862 lt!89856)))

(declare-fun lt!89863 () ListLongMap!2307)

(assert (=> b!181727 (= lt!89863 (getCurrentListMapNoExtraKeys!186 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))))

(declare-fun lt!89854 () (_ BitVec 64))

(assert (=> b!181727 (= lt!89854 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89852 () (_ BitVec 64))

(assert (=> b!181727 (= lt!89852 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89857 () Unit!5516)

(declare-fun addApplyDifferent!129 (ListLongMap!2307 (_ BitVec 64) V!5323 (_ BitVec 64)) Unit!5516)

(assert (=> b!181727 (= lt!89857 (addApplyDifferent!129 lt!89863 lt!89854 (minValue!3562 thiss!1248) lt!89852))))

(assert (=> b!181727 (= (apply!153 (+!273 lt!89863 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248))) lt!89852) (apply!153 lt!89863 lt!89852))))

(declare-fun lt!89861 () Unit!5516)

(assert (=> b!181727 (= lt!89861 lt!89857)))

(declare-fun lt!89851 () ListLongMap!2307)

(assert (=> b!181727 (= lt!89851 (getCurrentListMapNoExtraKeys!186 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))))

(declare-fun lt!89871 () (_ BitVec 64))

(assert (=> b!181727 (= lt!89871 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89869 () (_ BitVec 64))

(assert (=> b!181727 (= lt!89869 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89853 () Unit!5516)

(assert (=> b!181727 (= lt!89853 (addApplyDifferent!129 lt!89851 lt!89871 (zeroValue!3562 thiss!1248) lt!89869))))

(assert (=> b!181727 (= (apply!153 (+!273 lt!89851 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248))) lt!89869) (apply!153 lt!89851 lt!89869))))

(declare-fun lt!89858 () Unit!5516)

(assert (=> b!181727 (= lt!89858 lt!89853)))

(declare-fun lt!89866 () ListLongMap!2307)

(assert (=> b!181727 (= lt!89866 (getCurrentListMapNoExtraKeys!186 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))))

(declare-fun lt!89859 () (_ BitVec 64))

(assert (=> b!181727 (= lt!89859 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89870 () (_ BitVec 64))

(assert (=> b!181727 (= lt!89870 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181727 (= lt!89855 (addApplyDifferent!129 lt!89866 lt!89859 (minValue!3562 thiss!1248) lt!89870))))

(assert (=> b!181727 (= (apply!153 (+!273 lt!89866 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248))) lt!89870) (apply!153 lt!89866 lt!89870))))

(declare-fun b!181728 () Bool)

(declare-fun e!119680 () Bool)

(assert (=> b!181728 (= e!119687 e!119680)))

(declare-fun res!86020 () Bool)

(assert (=> b!181728 (= res!86020 call!18360)))

(assert (=> b!181728 (=> (not res!86020) (not e!119680))))

(declare-fun bm!18361 () Bool)

(assert (=> bm!18361 (= call!18364 (getCurrentListMapNoExtraKeys!186 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))))

(declare-fun b!181729 () Bool)

(assert (=> b!181729 (= e!119681 e!119684)))

(declare-fun res!86026 () Bool)

(assert (=> b!181729 (= res!86026 call!18358)))

(assert (=> b!181729 (=> (not res!86026) (not e!119684))))

(declare-fun b!181717 () Bool)

(assert (=> b!181717 (= e!119680 (= (apply!153 lt!89868 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3562 thiss!1248)))))

(declare-fun d!54457 () Bool)

(assert (=> d!54457 e!119679))

(declare-fun res!86021 () Bool)

(assert (=> d!54457 (=> (not res!86021) (not e!119679))))

(assert (=> d!54457 (= res!86021 (or (bvsge #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))))

(declare-fun lt!89867 () ListLongMap!2307)

(assert (=> d!54457 (= lt!89868 lt!89867)))

(declare-fun lt!89864 () Unit!5516)

(assert (=> d!54457 (= lt!89864 e!119683)))

(declare-fun c!32568 () Bool)

(assert (=> d!54457 (= c!32568 e!119685)))

(declare-fun res!86019 () Bool)

(assert (=> d!54457 (=> (not res!86019) (not e!119685))))

(assert (=> d!54457 (= res!86019 (bvslt #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(assert (=> d!54457 (= lt!89867 e!119688)))

(assert (=> d!54457 (= c!32572 (and (not (= (bvand (extraKeys!3458 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3458 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54457 (validMask!0 (mask!8746 thiss!1248))))

(assert (=> d!54457 (= (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)) lt!89868)))

(assert (= (and d!54457 c!32572) b!181714))

(assert (= (and d!54457 (not c!32572)) b!181718))

(assert (= (and b!181718 c!32570) b!181724))

(assert (= (and b!181718 (not c!32570)) b!181711))

(assert (= (and b!181711 c!32569) b!181722))

(assert (= (and b!181711 (not c!32569)) b!181725))

(assert (= (or b!181722 b!181725) bm!18358))

(assert (= (or b!181724 bm!18358) bm!18357))

(assert (= (or b!181724 b!181722) bm!18359))

(assert (= (or b!181714 bm!18357) bm!18361))

(assert (= (or b!181714 bm!18359) bm!18360))

(assert (= (and d!54457 res!86019) b!181720))

(assert (= (and d!54457 c!32568) b!181727))

(assert (= (and d!54457 (not c!32568)) b!181715))

(assert (= (and d!54457 res!86021) b!181726))

(assert (= (and b!181726 res!86025) b!181716))

(assert (= (and b!181726 (not res!86022)) b!181713))

(assert (= (and b!181713 res!86023) b!181712))

(assert (= (and b!181726 res!86024) b!181710))

(assert (= (and b!181710 c!32567) b!181729))

(assert (= (and b!181710 (not c!32567)) b!181709))

(assert (= (and b!181729 res!86026) b!181723))

(assert (= (or b!181729 b!181709) bm!18355))

(assert (= (and b!181710 res!86027) b!181719))

(assert (= (and b!181719 c!32571) b!181728))

(assert (= (and b!181719 (not c!32571)) b!181721))

(assert (= (and b!181728 res!86020) b!181717))

(assert (= (or b!181728 b!181721) bm!18356))

(declare-fun b_lambda!7151 () Bool)

(assert (=> (not b_lambda!7151) (not b!181712)))

(declare-fun t!7169 () Bool)

(declare-fun tb!2817 () Bool)

(assert (=> (and b!181600 (= (defaultEntry!3721 thiss!1248) (defaultEntry!3721 thiss!1248)) t!7169) tb!2817))

(declare-fun result!4729 () Bool)

(assert (=> tb!2817 (= result!4729 tp_is_empty!4257)))

(assert (=> b!181712 t!7169))

(declare-fun b_and!11039 () Bool)

(assert (= b_and!11035 (and (=> t!7169 result!4729) b_and!11039)))

(declare-fun m!209527 () Bool)

(assert (=> b!181723 m!209527))

(declare-fun m!209529 () Bool)

(assert (=> bm!18361 m!209529))

(declare-fun m!209531 () Bool)

(assert (=> b!181717 m!209531))

(declare-fun m!209533 () Bool)

(assert (=> b!181716 m!209533))

(assert (=> b!181716 m!209533))

(declare-fun m!209535 () Bool)

(assert (=> b!181716 m!209535))

(declare-fun m!209537 () Bool)

(assert (=> b!181714 m!209537))

(declare-fun m!209539 () Bool)

(assert (=> bm!18355 m!209539))

(assert (=> d!54457 m!209465))

(declare-fun m!209541 () Bool)

(assert (=> b!181727 m!209541))

(declare-fun m!209543 () Bool)

(assert (=> b!181727 m!209543))

(declare-fun m!209545 () Bool)

(assert (=> b!181727 m!209545))

(declare-fun m!209547 () Bool)

(assert (=> b!181727 m!209547))

(assert (=> b!181727 m!209541))

(declare-fun m!209549 () Bool)

(assert (=> b!181727 m!209549))

(declare-fun m!209551 () Bool)

(assert (=> b!181727 m!209551))

(declare-fun m!209553 () Bool)

(assert (=> b!181727 m!209553))

(declare-fun m!209555 () Bool)

(assert (=> b!181727 m!209555))

(declare-fun m!209557 () Bool)

(assert (=> b!181727 m!209557))

(declare-fun m!209559 () Bool)

(assert (=> b!181727 m!209559))

(declare-fun m!209561 () Bool)

(assert (=> b!181727 m!209561))

(assert (=> b!181727 m!209559))

(assert (=> b!181727 m!209551))

(declare-fun m!209563 () Bool)

(assert (=> b!181727 m!209563))

(declare-fun m!209565 () Bool)

(assert (=> b!181727 m!209565))

(declare-fun m!209567 () Bool)

(assert (=> b!181727 m!209567))

(assert (=> b!181727 m!209529))

(assert (=> b!181727 m!209545))

(declare-fun m!209569 () Bool)

(assert (=> b!181727 m!209569))

(assert (=> b!181727 m!209533))

(declare-fun m!209571 () Bool)

(assert (=> b!181712 m!209571))

(declare-fun m!209573 () Bool)

(assert (=> b!181712 m!209573))

(assert (=> b!181712 m!209571))

(assert (=> b!181712 m!209573))

(declare-fun m!209575 () Bool)

(assert (=> b!181712 m!209575))

(assert (=> b!181712 m!209533))

(assert (=> b!181712 m!209533))

(declare-fun m!209577 () Bool)

(assert (=> b!181712 m!209577))

(declare-fun m!209579 () Bool)

(assert (=> bm!18360 m!209579))

(assert (=> b!181720 m!209533))

(assert (=> b!181720 m!209533))

(assert (=> b!181720 m!209535))

(declare-fun m!209581 () Bool)

(assert (=> bm!18356 m!209581))

(assert (=> b!181713 m!209533))

(assert (=> b!181713 m!209533))

(declare-fun m!209583 () Bool)

(assert (=> b!181713 m!209583))

(assert (=> b!181602 d!54457))

(declare-fun b!181738 () Bool)

(declare-fun e!119694 () Bool)

(assert (=> b!181738 (= e!119694 tp_is_empty!4257)))

(declare-fun condMapEmpty!7305 () Bool)

(declare-fun mapDefault!7305 () ValueCell!1785)

(assert (=> mapNonEmpty!7299 (= condMapEmpty!7305 (= mapRest!7299 ((as const (Array (_ BitVec 32) ValueCell!1785)) mapDefault!7305)))))

(declare-fun e!119695 () Bool)

(declare-fun mapRes!7305 () Bool)

(assert (=> mapNonEmpty!7299 (= tp!16206 (and e!119695 mapRes!7305))))

(declare-fun b!181739 () Bool)

(assert (=> b!181739 (= e!119695 tp_is_empty!4257)))

(declare-fun mapNonEmpty!7305 () Bool)

(declare-fun tp!16215 () Bool)

(assert (=> mapNonEmpty!7305 (= mapRes!7305 (and tp!16215 e!119694))))

(declare-fun mapValue!7305 () ValueCell!1785)

(declare-fun mapKey!7305 () (_ BitVec 32))

(declare-fun mapRest!7305 () (Array (_ BitVec 32) ValueCell!1785))

(assert (=> mapNonEmpty!7305 (= mapRest!7299 (store mapRest!7305 mapKey!7305 mapValue!7305))))

(declare-fun mapIsEmpty!7305 () Bool)

(assert (=> mapIsEmpty!7305 mapRes!7305))

(assert (= (and mapNonEmpty!7299 condMapEmpty!7305) mapIsEmpty!7305))

(assert (= (and mapNonEmpty!7299 (not condMapEmpty!7305)) mapNonEmpty!7305))

(assert (= (and mapNonEmpty!7305 ((_ is ValueCellFull!1785) mapValue!7305)) b!181738))

(assert (= (and mapNonEmpty!7299 ((_ is ValueCellFull!1785) mapDefault!7305)) b!181739))

(declare-fun m!209585 () Bool)

(assert (=> mapNonEmpty!7305 m!209585))

(declare-fun b_lambda!7153 () Bool)

(assert (= b_lambda!7151 (or (and b!181600 b_free!4485) b_lambda!7153)))

(check-sat (not b!181664) (not d!54453) (not b!181714) (not d!54455) (not b!181717) (not b_next!4485) (not b!181666) (not b!181712) (not bm!18356) (not bm!18361) (not mapNonEmpty!7305) (not b!181638) (not b!181723) (not b!181713) tp_is_empty!4257 (not b!181657) (not b_lambda!7153) (not b!181716) (not bm!18355) (not b!181727) (not b!181639) (not bm!18360) (not b!181637) (not d!54457) (not d!54451) b_and!11039 (not b!181720))
(check-sat b_and!11039 (not b_next!4485))
(get-model)

(declare-fun b!181764 () Bool)

(assert (=> b!181764 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(assert (=> b!181764 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3952 (_values!3704 thiss!1248))))))

(declare-fun e!119710 () Bool)

(declare-fun lt!89886 () ListLongMap!2307)

(assert (=> b!181764 (= e!119710 (= (apply!153 lt!89886 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)) (get!2082 (select (arr!3642 (_values!3704 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3721 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!181765 () Bool)

(declare-fun e!119711 () Bool)

(assert (=> b!181765 (= e!119711 e!119710)))

(assert (=> b!181765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(declare-fun res!86039 () Bool)

(assert (=> b!181765 (= res!86039 (contains!1249 lt!89886 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181765 (=> (not res!86039) (not e!119710))))

(declare-fun b!181766 () Bool)

(declare-fun e!119714 () Bool)

(assert (=> b!181766 (= e!119714 (= lt!89886 (getCurrentListMapNoExtraKeys!186 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3721 thiss!1248))))))

(declare-fun d!54459 () Bool)

(declare-fun e!119716 () Bool)

(assert (=> d!54459 e!119716))

(declare-fun res!86038 () Bool)

(assert (=> d!54459 (=> (not res!86038) (not e!119716))))

(assert (=> d!54459 (= res!86038 (not (contains!1249 lt!89886 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!119713 () ListLongMap!2307)

(assert (=> d!54459 (= lt!89886 e!119713)))

(declare-fun c!32582 () Bool)

(assert (=> d!54459 (= c!32582 (bvsge #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(assert (=> d!54459 (validMask!0 (mask!8746 thiss!1248))))

(assert (=> d!54459 (= (getCurrentListMapNoExtraKeys!186 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)) lt!89886)))

(declare-fun b!181767 () Bool)

(declare-fun res!86037 () Bool)

(assert (=> b!181767 (=> (not res!86037) (not e!119716))))

(assert (=> b!181767 (= res!86037 (not (contains!1249 lt!89886 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181768 () Bool)

(declare-fun isEmpty!459 (ListLongMap!2307) Bool)

(assert (=> b!181768 (= e!119714 (isEmpty!459 lt!89886))))

(declare-fun b!181769 () Bool)

(declare-fun lt!89888 () Unit!5516)

(declare-fun lt!89890 () Unit!5516)

(assert (=> b!181769 (= lt!89888 lt!89890)))

(declare-fun lt!89887 () (_ BitVec 64))

(declare-fun lt!89891 () ListLongMap!2307)

(declare-fun lt!89889 () (_ BitVec 64))

(declare-fun lt!89892 () V!5323)

(assert (=> b!181769 (not (contains!1249 (+!273 lt!89891 (tuple2!3391 lt!89887 lt!89892)) lt!89889))))

(declare-fun addStillNotContains!83 (ListLongMap!2307 (_ BitVec 64) V!5323 (_ BitVec 64)) Unit!5516)

(assert (=> b!181769 (= lt!89890 (addStillNotContains!83 lt!89891 lt!89887 lt!89892 lt!89889))))

(assert (=> b!181769 (= lt!89889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!181769 (= lt!89892 (get!2082 (select (arr!3642 (_values!3704 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3721 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181769 (= lt!89887 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18367 () ListLongMap!2307)

(assert (=> b!181769 (= lt!89891 call!18367)))

(declare-fun e!119715 () ListLongMap!2307)

(assert (=> b!181769 (= e!119715 (+!273 call!18367 (tuple2!3391 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000) (get!2082 (select (arr!3642 (_values!3704 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3721 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!181770 () Bool)

(declare-fun e!119712 () Bool)

(assert (=> b!181770 (= e!119712 (validKeyInArray!0 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181770 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!181771 () Bool)

(assert (=> b!181771 (= e!119716 e!119711)))

(declare-fun c!32584 () Bool)

(assert (=> b!181771 (= c!32584 e!119712)))

(declare-fun res!86036 () Bool)

(assert (=> b!181771 (=> (not res!86036) (not e!119712))))

(assert (=> b!181771 (= res!86036 (bvslt #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(declare-fun bm!18364 () Bool)

(assert (=> bm!18364 (= call!18367 (getCurrentListMapNoExtraKeys!186 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3721 thiss!1248)))))

(declare-fun b!181772 () Bool)

(assert (=> b!181772 (= e!119715 call!18367)))

(declare-fun b!181773 () Bool)

(assert (=> b!181773 (= e!119711 e!119714)))

(declare-fun c!32583 () Bool)

(assert (=> b!181773 (= c!32583 (bvslt #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(declare-fun b!181774 () Bool)

(assert (=> b!181774 (= e!119713 e!119715)))

(declare-fun c!32581 () Bool)

(assert (=> b!181774 (= c!32581 (validKeyInArray!0 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181775 () Bool)

(assert (=> b!181775 (= e!119713 (ListLongMap!2308 Nil!2307))))

(assert (= (and d!54459 c!32582) b!181775))

(assert (= (and d!54459 (not c!32582)) b!181774))

(assert (= (and b!181774 c!32581) b!181769))

(assert (= (and b!181774 (not c!32581)) b!181772))

(assert (= (or b!181769 b!181772) bm!18364))

(assert (= (and d!54459 res!86038) b!181767))

(assert (= (and b!181767 res!86037) b!181771))

(assert (= (and b!181771 res!86036) b!181770))

(assert (= (and b!181771 c!32584) b!181765))

(assert (= (and b!181771 (not c!32584)) b!181773))

(assert (= (and b!181765 res!86039) b!181764))

(assert (= (and b!181773 c!32583) b!181766))

(assert (= (and b!181773 (not c!32583)) b!181768))

(declare-fun b_lambda!7155 () Bool)

(assert (=> (not b_lambda!7155) (not b!181764)))

(assert (=> b!181764 t!7169))

(declare-fun b_and!11041 () Bool)

(assert (= b_and!11039 (and (=> t!7169 result!4729) b_and!11041)))

(declare-fun b_lambda!7157 () Bool)

(assert (=> (not b_lambda!7157) (not b!181769)))

(assert (=> b!181769 t!7169))

(declare-fun b_and!11043 () Bool)

(assert (= b_and!11041 (and (=> t!7169 result!4729) b_and!11043)))

(assert (=> b!181765 m!209533))

(assert (=> b!181765 m!209533))

(declare-fun m!209587 () Bool)

(assert (=> b!181765 m!209587))

(declare-fun m!209589 () Bool)

(assert (=> b!181768 m!209589))

(declare-fun m!209591 () Bool)

(assert (=> b!181766 m!209591))

(assert (=> b!181770 m!209533))

(assert (=> b!181770 m!209533))

(assert (=> b!181770 m!209535))

(declare-fun m!209593 () Bool)

(assert (=> d!54459 m!209593))

(assert (=> d!54459 m!209465))

(assert (=> b!181774 m!209533))

(assert (=> b!181774 m!209533))

(assert (=> b!181774 m!209535))

(assert (=> b!181764 m!209571))

(assert (=> b!181764 m!209573))

(assert (=> b!181764 m!209575))

(assert (=> b!181764 m!209573))

(assert (=> b!181764 m!209533))

(declare-fun m!209595 () Bool)

(assert (=> b!181764 m!209595))

(assert (=> b!181764 m!209533))

(assert (=> b!181764 m!209571))

(declare-fun m!209597 () Bool)

(assert (=> b!181767 m!209597))

(assert (=> bm!18364 m!209591))

(declare-fun m!209599 () Bool)

(assert (=> b!181769 m!209599))

(assert (=> b!181769 m!209571))

(assert (=> b!181769 m!209573))

(assert (=> b!181769 m!209575))

(assert (=> b!181769 m!209573))

(declare-fun m!209601 () Bool)

(assert (=> b!181769 m!209601))

(assert (=> b!181769 m!209601))

(declare-fun m!209603 () Bool)

(assert (=> b!181769 m!209603))

(assert (=> b!181769 m!209533))

(declare-fun m!209605 () Bool)

(assert (=> b!181769 m!209605))

(assert (=> b!181769 m!209571))

(assert (=> b!181727 d!54459))

(declare-fun d!54461 () Bool)

(declare-fun get!2083 (Option!216) V!5323)

(assert (=> d!54461 (= (apply!153 (+!273 lt!89851 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248))) lt!89869) (get!2083 (getValueByKey!210 (toList!1169 (+!273 lt!89851 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248)))) lt!89869)))))

(declare-fun bs!7411 () Bool)

(assert (= bs!7411 d!54461))

(declare-fun m!209607 () Bool)

(assert (=> bs!7411 m!209607))

(assert (=> bs!7411 m!209607))

(declare-fun m!209609 () Bool)

(assert (=> bs!7411 m!209609))

(assert (=> b!181727 d!54461))

(declare-fun d!54463 () Bool)

(assert (=> d!54463 (= (apply!153 (+!273 lt!89866 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248))) lt!89870) (get!2083 (getValueByKey!210 (toList!1169 (+!273 lt!89866 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248)))) lt!89870)))))

(declare-fun bs!7412 () Bool)

(assert (= bs!7412 d!54463))

(declare-fun m!209611 () Bool)

(assert (=> bs!7412 m!209611))

(assert (=> bs!7412 m!209611))

(declare-fun m!209613 () Bool)

(assert (=> bs!7412 m!209613))

(assert (=> b!181727 d!54463))

(declare-fun d!54465 () Bool)

(assert (=> d!54465 (= (apply!153 lt!89851 lt!89869) (get!2083 (getValueByKey!210 (toList!1169 lt!89851) lt!89869)))))

(declare-fun bs!7413 () Bool)

(assert (= bs!7413 d!54465))

(declare-fun m!209615 () Bool)

(assert (=> bs!7413 m!209615))

(assert (=> bs!7413 m!209615))

(declare-fun m!209617 () Bool)

(assert (=> bs!7413 m!209617))

(assert (=> b!181727 d!54465))

(declare-fun d!54467 () Bool)

(declare-fun e!119719 () Bool)

(assert (=> d!54467 e!119719))

(declare-fun res!86044 () Bool)

(assert (=> d!54467 (=> (not res!86044) (not e!119719))))

(declare-fun lt!89904 () ListLongMap!2307)

(assert (=> d!54467 (= res!86044 (contains!1249 lt!89904 (_1!1706 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248)))))))

(declare-fun lt!89903 () List!2310)

(assert (=> d!54467 (= lt!89904 (ListLongMap!2308 lt!89903))))

(declare-fun lt!89902 () Unit!5516)

(declare-fun lt!89901 () Unit!5516)

(assert (=> d!54467 (= lt!89902 lt!89901)))

(assert (=> d!54467 (= (getValueByKey!210 lt!89903 (_1!1706 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248)))) (Some!215 (_2!1706 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!111 (List!2310 (_ BitVec 64) V!5323) Unit!5516)

(assert (=> d!54467 (= lt!89901 (lemmaContainsTupThenGetReturnValue!111 lt!89903 (_1!1706 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248))) (_2!1706 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248)))))))

(declare-fun insertStrictlySorted!114 (List!2310 (_ BitVec 64) V!5323) List!2310)

(assert (=> d!54467 (= lt!89903 (insertStrictlySorted!114 (toList!1169 lt!89865) (_1!1706 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248))) (_2!1706 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248)))))))

(assert (=> d!54467 (= (+!273 lt!89865 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248))) lt!89904)))

(declare-fun b!181780 () Bool)

(declare-fun res!86045 () Bool)

(assert (=> b!181780 (=> (not res!86045) (not e!119719))))

(assert (=> b!181780 (= res!86045 (= (getValueByKey!210 (toList!1169 lt!89904) (_1!1706 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248)))) (Some!215 (_2!1706 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248))))))))

(declare-fun b!181781 () Bool)

(declare-fun contains!1251 (List!2310 tuple2!3390) Bool)

(assert (=> b!181781 (= e!119719 (contains!1251 (toList!1169 lt!89904) (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248))))))

(assert (= (and d!54467 res!86044) b!181780))

(assert (= (and b!181780 res!86045) b!181781))

(declare-fun m!209619 () Bool)

(assert (=> d!54467 m!209619))

(declare-fun m!209621 () Bool)

(assert (=> d!54467 m!209621))

(declare-fun m!209623 () Bool)

(assert (=> d!54467 m!209623))

(declare-fun m!209625 () Bool)

(assert (=> d!54467 m!209625))

(declare-fun m!209627 () Bool)

(assert (=> b!181780 m!209627))

(declare-fun m!209629 () Bool)

(assert (=> b!181781 m!209629))

(assert (=> b!181727 d!54467))

(declare-fun d!54469 () Bool)

(assert (=> d!54469 (= (apply!153 lt!89866 lt!89870) (get!2083 (getValueByKey!210 (toList!1169 lt!89866) lt!89870)))))

(declare-fun bs!7414 () Bool)

(assert (= bs!7414 d!54469))

(declare-fun m!209631 () Bool)

(assert (=> bs!7414 m!209631))

(assert (=> bs!7414 m!209631))

(declare-fun m!209633 () Bool)

(assert (=> bs!7414 m!209633))

(assert (=> b!181727 d!54469))

(declare-fun d!54471 () Bool)

(declare-fun e!119720 () Bool)

(assert (=> d!54471 e!119720))

(declare-fun res!86046 () Bool)

(assert (=> d!54471 (=> (not res!86046) (not e!119720))))

(declare-fun lt!89908 () ListLongMap!2307)

(assert (=> d!54471 (= res!86046 (contains!1249 lt!89908 (_1!1706 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248)))))))

(declare-fun lt!89907 () List!2310)

(assert (=> d!54471 (= lt!89908 (ListLongMap!2308 lt!89907))))

(declare-fun lt!89906 () Unit!5516)

(declare-fun lt!89905 () Unit!5516)

(assert (=> d!54471 (= lt!89906 lt!89905)))

(assert (=> d!54471 (= (getValueByKey!210 lt!89907 (_1!1706 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248)))) (Some!215 (_2!1706 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248)))))))

(assert (=> d!54471 (= lt!89905 (lemmaContainsTupThenGetReturnValue!111 lt!89907 (_1!1706 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248))) (_2!1706 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248)))))))

(assert (=> d!54471 (= lt!89907 (insertStrictlySorted!114 (toList!1169 lt!89866) (_1!1706 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248))) (_2!1706 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248)))))))

(assert (=> d!54471 (= (+!273 lt!89866 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248))) lt!89908)))

(declare-fun b!181782 () Bool)

(declare-fun res!86047 () Bool)

(assert (=> b!181782 (=> (not res!86047) (not e!119720))))

(assert (=> b!181782 (= res!86047 (= (getValueByKey!210 (toList!1169 lt!89908) (_1!1706 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248)))) (Some!215 (_2!1706 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248))))))))

(declare-fun b!181783 () Bool)

(assert (=> b!181783 (= e!119720 (contains!1251 (toList!1169 lt!89908) (tuple2!3391 lt!89859 (minValue!3562 thiss!1248))))))

(assert (= (and d!54471 res!86046) b!181782))

(assert (= (and b!181782 res!86047) b!181783))

(declare-fun m!209635 () Bool)

(assert (=> d!54471 m!209635))

(declare-fun m!209637 () Bool)

(assert (=> d!54471 m!209637))

(declare-fun m!209639 () Bool)

(assert (=> d!54471 m!209639))

(declare-fun m!209641 () Bool)

(assert (=> d!54471 m!209641))

(declare-fun m!209643 () Bool)

(assert (=> b!181782 m!209643))

(declare-fun m!209645 () Bool)

(assert (=> b!181783 m!209645))

(assert (=> b!181727 d!54471))

(declare-fun d!54473 () Bool)

(assert (=> d!54473 (= (apply!153 (+!273 lt!89863 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248))) lt!89852) (get!2083 (getValueByKey!210 (toList!1169 (+!273 lt!89863 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248)))) lt!89852)))))

(declare-fun bs!7415 () Bool)

(assert (= bs!7415 d!54473))

(declare-fun m!209647 () Bool)

(assert (=> bs!7415 m!209647))

(assert (=> bs!7415 m!209647))

(declare-fun m!209649 () Bool)

(assert (=> bs!7415 m!209649))

(assert (=> b!181727 d!54473))

(declare-fun d!54475 () Bool)

(declare-fun e!119721 () Bool)

(assert (=> d!54475 e!119721))

(declare-fun res!86048 () Bool)

(assert (=> d!54475 (=> (not res!86048) (not e!119721))))

(declare-fun lt!89912 () ListLongMap!2307)

(assert (=> d!54475 (= res!86048 (contains!1249 lt!89912 (_1!1706 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248)))))))

(declare-fun lt!89911 () List!2310)

(assert (=> d!54475 (= lt!89912 (ListLongMap!2308 lt!89911))))

(declare-fun lt!89910 () Unit!5516)

(declare-fun lt!89909 () Unit!5516)

(assert (=> d!54475 (= lt!89910 lt!89909)))

(assert (=> d!54475 (= (getValueByKey!210 lt!89911 (_1!1706 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248)))) (Some!215 (_2!1706 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248)))))))

(assert (=> d!54475 (= lt!89909 (lemmaContainsTupThenGetReturnValue!111 lt!89911 (_1!1706 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248))) (_2!1706 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248)))))))

(assert (=> d!54475 (= lt!89911 (insertStrictlySorted!114 (toList!1169 lt!89863) (_1!1706 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248))) (_2!1706 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248)))))))

(assert (=> d!54475 (= (+!273 lt!89863 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248))) lt!89912)))

(declare-fun b!181784 () Bool)

(declare-fun res!86049 () Bool)

(assert (=> b!181784 (=> (not res!86049) (not e!119721))))

(assert (=> b!181784 (= res!86049 (= (getValueByKey!210 (toList!1169 lt!89912) (_1!1706 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248)))) (Some!215 (_2!1706 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248))))))))

(declare-fun b!181785 () Bool)

(assert (=> b!181785 (= e!119721 (contains!1251 (toList!1169 lt!89912) (tuple2!3391 lt!89854 (minValue!3562 thiss!1248))))))

(assert (= (and d!54475 res!86048) b!181784))

(assert (= (and b!181784 res!86049) b!181785))

(declare-fun m!209651 () Bool)

(assert (=> d!54475 m!209651))

(declare-fun m!209653 () Bool)

(assert (=> d!54475 m!209653))

(declare-fun m!209655 () Bool)

(assert (=> d!54475 m!209655))

(declare-fun m!209657 () Bool)

(assert (=> d!54475 m!209657))

(declare-fun m!209659 () Bool)

(assert (=> b!181784 m!209659))

(declare-fun m!209661 () Bool)

(assert (=> b!181785 m!209661))

(assert (=> b!181727 d!54475))

(declare-fun d!54477 () Bool)

(assert (=> d!54477 (= (apply!153 (+!273 lt!89851 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248))) lt!89869) (apply!153 lt!89851 lt!89869))))

(declare-fun lt!89915 () Unit!5516)

(declare-fun choose!964 (ListLongMap!2307 (_ BitVec 64) V!5323 (_ BitVec 64)) Unit!5516)

(assert (=> d!54477 (= lt!89915 (choose!964 lt!89851 lt!89871 (zeroValue!3562 thiss!1248) lt!89869))))

(declare-fun e!119724 () Bool)

(assert (=> d!54477 e!119724))

(declare-fun res!86052 () Bool)

(assert (=> d!54477 (=> (not res!86052) (not e!119724))))

(assert (=> d!54477 (= res!86052 (contains!1249 lt!89851 lt!89869))))

(assert (=> d!54477 (= (addApplyDifferent!129 lt!89851 lt!89871 (zeroValue!3562 thiss!1248) lt!89869) lt!89915)))

(declare-fun b!181789 () Bool)

(assert (=> b!181789 (= e!119724 (not (= lt!89869 lt!89871)))))

(assert (= (and d!54477 res!86052) b!181789))

(assert (=> d!54477 m!209565))

(declare-fun m!209663 () Bool)

(assert (=> d!54477 m!209663))

(assert (=> d!54477 m!209559))

(assert (=> d!54477 m!209559))

(assert (=> d!54477 m!209561))

(declare-fun m!209665 () Bool)

(assert (=> d!54477 m!209665))

(assert (=> b!181727 d!54477))

(declare-fun d!54479 () Bool)

(assert (=> d!54479 (contains!1249 (+!273 lt!89865 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248))) lt!89860)))

(declare-fun lt!89918 () Unit!5516)

(declare-fun choose!965 (ListLongMap!2307 (_ BitVec 64) V!5323 (_ BitVec 64)) Unit!5516)

(assert (=> d!54479 (= lt!89918 (choose!965 lt!89865 lt!89850 (zeroValue!3562 thiss!1248) lt!89860))))

(assert (=> d!54479 (contains!1249 lt!89865 lt!89860)))

(assert (=> d!54479 (= (addStillContains!129 lt!89865 lt!89850 (zeroValue!3562 thiss!1248) lt!89860) lt!89918)))

(declare-fun bs!7416 () Bool)

(assert (= bs!7416 d!54479))

(assert (=> bs!7416 m!209541))

(assert (=> bs!7416 m!209541))

(assert (=> bs!7416 m!209543))

(declare-fun m!209667 () Bool)

(assert (=> bs!7416 m!209667))

(declare-fun m!209669 () Bool)

(assert (=> bs!7416 m!209669))

(assert (=> b!181727 d!54479))

(declare-fun d!54481 () Bool)

(assert (=> d!54481 (= (apply!153 lt!89863 lt!89852) (get!2083 (getValueByKey!210 (toList!1169 lt!89863) lt!89852)))))

(declare-fun bs!7417 () Bool)

(assert (= bs!7417 d!54481))

(declare-fun m!209671 () Bool)

(assert (=> bs!7417 m!209671))

(assert (=> bs!7417 m!209671))

(declare-fun m!209673 () Bool)

(assert (=> bs!7417 m!209673))

(assert (=> b!181727 d!54481))

(declare-fun d!54483 () Bool)

(assert (=> d!54483 (= (apply!153 (+!273 lt!89863 (tuple2!3391 lt!89854 (minValue!3562 thiss!1248))) lt!89852) (apply!153 lt!89863 lt!89852))))

(declare-fun lt!89919 () Unit!5516)

(assert (=> d!54483 (= lt!89919 (choose!964 lt!89863 lt!89854 (minValue!3562 thiss!1248) lt!89852))))

(declare-fun e!119725 () Bool)

(assert (=> d!54483 e!119725))

(declare-fun res!86053 () Bool)

(assert (=> d!54483 (=> (not res!86053) (not e!119725))))

(assert (=> d!54483 (= res!86053 (contains!1249 lt!89863 lt!89852))))

(assert (=> d!54483 (= (addApplyDifferent!129 lt!89863 lt!89854 (minValue!3562 thiss!1248) lt!89852) lt!89919)))

(declare-fun b!181791 () Bool)

(assert (=> b!181791 (= e!119725 (not (= lt!89852 lt!89854)))))

(assert (= (and d!54483 res!86053) b!181791))

(assert (=> d!54483 m!209567))

(declare-fun m!209675 () Bool)

(assert (=> d!54483 m!209675))

(assert (=> d!54483 m!209545))

(assert (=> d!54483 m!209545))

(assert (=> d!54483 m!209547))

(declare-fun m!209677 () Bool)

(assert (=> d!54483 m!209677))

(assert (=> b!181727 d!54483))

(declare-fun d!54485 () Bool)

(assert (=> d!54485 (= (apply!153 (+!273 lt!89866 (tuple2!3391 lt!89859 (minValue!3562 thiss!1248))) lt!89870) (apply!153 lt!89866 lt!89870))))

(declare-fun lt!89920 () Unit!5516)

(assert (=> d!54485 (= lt!89920 (choose!964 lt!89866 lt!89859 (minValue!3562 thiss!1248) lt!89870))))

(declare-fun e!119726 () Bool)

(assert (=> d!54485 e!119726))

(declare-fun res!86054 () Bool)

(assert (=> d!54485 (=> (not res!86054) (not e!119726))))

(assert (=> d!54485 (= res!86054 (contains!1249 lt!89866 lt!89870))))

(assert (=> d!54485 (= (addApplyDifferent!129 lt!89866 lt!89859 (minValue!3562 thiss!1248) lt!89870) lt!89920)))

(declare-fun b!181792 () Bool)

(assert (=> b!181792 (= e!119726 (not (= lt!89870 lt!89859)))))

(assert (= (and d!54485 res!86054) b!181792))

(assert (=> d!54485 m!209549))

(declare-fun m!209679 () Bool)

(assert (=> d!54485 m!209679))

(assert (=> d!54485 m!209551))

(assert (=> d!54485 m!209551))

(assert (=> d!54485 m!209563))

(declare-fun m!209681 () Bool)

(assert (=> d!54485 m!209681))

(assert (=> b!181727 d!54485))

(declare-fun d!54487 () Bool)

(declare-fun e!119728 () Bool)

(assert (=> d!54487 e!119728))

(declare-fun res!86055 () Bool)

(assert (=> d!54487 (=> res!86055 e!119728)))

(declare-fun lt!89922 () Bool)

(assert (=> d!54487 (= res!86055 (not lt!89922))))

(declare-fun lt!89924 () Bool)

(assert (=> d!54487 (= lt!89922 lt!89924)))

(declare-fun lt!89923 () Unit!5516)

(declare-fun e!119727 () Unit!5516)

(assert (=> d!54487 (= lt!89923 e!119727)))

(declare-fun c!32585 () Bool)

(assert (=> d!54487 (= c!32585 lt!89924)))

(assert (=> d!54487 (= lt!89924 (containsKey!214 (toList!1169 (+!273 lt!89865 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248)))) lt!89860))))

(assert (=> d!54487 (= (contains!1249 (+!273 lt!89865 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248))) lt!89860) lt!89922)))

(declare-fun b!181793 () Bool)

(declare-fun lt!89921 () Unit!5516)

(assert (=> b!181793 (= e!119727 lt!89921)))

(assert (=> b!181793 (= lt!89921 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1169 (+!273 lt!89865 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248)))) lt!89860))))

(assert (=> b!181793 (isDefined!163 (getValueByKey!210 (toList!1169 (+!273 lt!89865 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248)))) lt!89860))))

(declare-fun b!181794 () Bool)

(declare-fun Unit!5520 () Unit!5516)

(assert (=> b!181794 (= e!119727 Unit!5520)))

(declare-fun b!181795 () Bool)

(assert (=> b!181795 (= e!119728 (isDefined!163 (getValueByKey!210 (toList!1169 (+!273 lt!89865 (tuple2!3391 lt!89850 (zeroValue!3562 thiss!1248)))) lt!89860)))))

(assert (= (and d!54487 c!32585) b!181793))

(assert (= (and d!54487 (not c!32585)) b!181794))

(assert (= (and d!54487 (not res!86055)) b!181795))

(declare-fun m!209683 () Bool)

(assert (=> d!54487 m!209683))

(declare-fun m!209685 () Bool)

(assert (=> b!181793 m!209685))

(declare-fun m!209687 () Bool)

(assert (=> b!181793 m!209687))

(assert (=> b!181793 m!209687))

(declare-fun m!209689 () Bool)

(assert (=> b!181793 m!209689))

(assert (=> b!181795 m!209687))

(assert (=> b!181795 m!209687))

(assert (=> b!181795 m!209689))

(assert (=> b!181727 d!54487))

(declare-fun d!54489 () Bool)

(declare-fun e!119729 () Bool)

(assert (=> d!54489 e!119729))

(declare-fun res!86056 () Bool)

(assert (=> d!54489 (=> (not res!86056) (not e!119729))))

(declare-fun lt!89928 () ListLongMap!2307)

(assert (=> d!54489 (= res!86056 (contains!1249 lt!89928 (_1!1706 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248)))))))

(declare-fun lt!89927 () List!2310)

(assert (=> d!54489 (= lt!89928 (ListLongMap!2308 lt!89927))))

(declare-fun lt!89926 () Unit!5516)

(declare-fun lt!89925 () Unit!5516)

(assert (=> d!54489 (= lt!89926 lt!89925)))

(assert (=> d!54489 (= (getValueByKey!210 lt!89927 (_1!1706 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248)))) (Some!215 (_2!1706 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248)))))))

(assert (=> d!54489 (= lt!89925 (lemmaContainsTupThenGetReturnValue!111 lt!89927 (_1!1706 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248))) (_2!1706 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248)))))))

(assert (=> d!54489 (= lt!89927 (insertStrictlySorted!114 (toList!1169 lt!89851) (_1!1706 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248))) (_2!1706 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248)))))))

(assert (=> d!54489 (= (+!273 lt!89851 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248))) lt!89928)))

(declare-fun b!181796 () Bool)

(declare-fun res!86057 () Bool)

(assert (=> b!181796 (=> (not res!86057) (not e!119729))))

(assert (=> b!181796 (= res!86057 (= (getValueByKey!210 (toList!1169 lt!89928) (_1!1706 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248)))) (Some!215 (_2!1706 (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248))))))))

(declare-fun b!181797 () Bool)

(assert (=> b!181797 (= e!119729 (contains!1251 (toList!1169 lt!89928) (tuple2!3391 lt!89871 (zeroValue!3562 thiss!1248))))))

(assert (= (and d!54489 res!86056) b!181796))

(assert (= (and b!181796 res!86057) b!181797))

(declare-fun m!209691 () Bool)

(assert (=> d!54489 m!209691))

(declare-fun m!209693 () Bool)

(assert (=> d!54489 m!209693))

(declare-fun m!209695 () Bool)

(assert (=> d!54489 m!209695))

(declare-fun m!209697 () Bool)

(assert (=> d!54489 m!209697))

(declare-fun m!209699 () Bool)

(assert (=> b!181796 m!209699))

(declare-fun m!209701 () Bool)

(assert (=> b!181797 m!209701))

(assert (=> b!181727 d!54489))

(declare-fun d!54491 () Bool)

(assert (=> d!54491 (= (apply!153 lt!89868 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)) (get!2083 (getValueByKey!210 (toList!1169 lt!89868) (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7418 () Bool)

(assert (= bs!7418 d!54491))

(assert (=> bs!7418 m!209533))

(declare-fun m!209703 () Bool)

(assert (=> bs!7418 m!209703))

(assert (=> bs!7418 m!209703))

(declare-fun m!209705 () Bool)

(assert (=> bs!7418 m!209705))

(assert (=> b!181712 d!54491))

(declare-fun d!54493 () Bool)

(declare-fun c!32588 () Bool)

(assert (=> d!54493 (= c!32588 ((_ is ValueCellFull!1785) (select (arr!3642 (_values!3704 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119732 () V!5323)

(assert (=> d!54493 (= (get!2082 (select (arr!3642 (_values!3704 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3721 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119732)))

(declare-fun b!181802 () Bool)

(declare-fun get!2084 (ValueCell!1785 V!5323) V!5323)

(assert (=> b!181802 (= e!119732 (get!2084 (select (arr!3642 (_values!3704 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3721 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181803 () Bool)

(declare-fun get!2085 (ValueCell!1785 V!5323) V!5323)

(assert (=> b!181803 (= e!119732 (get!2085 (select (arr!3642 (_values!3704 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3721 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54493 c!32588) b!181802))

(assert (= (and d!54493 (not c!32588)) b!181803))

(assert (=> b!181802 m!209571))

(assert (=> b!181802 m!209573))

(declare-fun m!209707 () Bool)

(assert (=> b!181802 m!209707))

(assert (=> b!181803 m!209571))

(assert (=> b!181803 m!209573))

(declare-fun m!209709 () Bool)

(assert (=> b!181803 m!209709))

(assert (=> b!181712 d!54493))

(declare-fun d!54495 () Bool)

(declare-fun res!86062 () Bool)

(declare-fun e!119737 () Bool)

(assert (=> d!54495 (=> res!86062 e!119737)))

(assert (=> d!54495 (= res!86062 (and ((_ is Cons!2306) (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))) (= (_1!1706 (h!2933 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))))) key!828)))))

(assert (=> d!54495 (= (containsKey!214 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828) e!119737)))

(declare-fun b!181808 () Bool)

(declare-fun e!119738 () Bool)

(assert (=> b!181808 (= e!119737 e!119738)))

(declare-fun res!86063 () Bool)

(assert (=> b!181808 (=> (not res!86063) (not e!119738))))

(assert (=> b!181808 (= res!86063 (and (or (not ((_ is Cons!2306) (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))))) (bvsle (_1!1706 (h!2933 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))))) key!828)) ((_ is Cons!2306) (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))) (bvslt (_1!1706 (h!2933 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))))) key!828)))))

(declare-fun b!181809 () Bool)

(assert (=> b!181809 (= e!119738 (containsKey!214 (t!7166 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))) key!828))))

(assert (= (and d!54495 (not res!86062)) b!181808))

(assert (= (and b!181808 res!86063) b!181809))

(declare-fun m!209711 () Bool)

(assert (=> b!181809 m!209711))

(assert (=> d!54455 d!54495))

(declare-fun d!54497 () Bool)

(declare-fun e!119740 () Bool)

(assert (=> d!54497 e!119740))

(declare-fun res!86064 () Bool)

(assert (=> d!54497 (=> res!86064 e!119740)))

(declare-fun lt!89930 () Bool)

(assert (=> d!54497 (= res!86064 (not lt!89930))))

(declare-fun lt!89932 () Bool)

(assert (=> d!54497 (= lt!89930 lt!89932)))

(declare-fun lt!89931 () Unit!5516)

(declare-fun e!119739 () Unit!5516)

(assert (=> d!54497 (= lt!89931 e!119739)))

(declare-fun c!32589 () Bool)

(assert (=> d!54497 (= c!32589 lt!89932)))

(assert (=> d!54497 (= lt!89932 (containsKey!214 (toList!1169 lt!89868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54497 (= (contains!1249 lt!89868 #b0000000000000000000000000000000000000000000000000000000000000000) lt!89930)))

(declare-fun b!181810 () Bool)

(declare-fun lt!89929 () Unit!5516)

(assert (=> b!181810 (= e!119739 lt!89929)))

(assert (=> b!181810 (= lt!89929 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1169 lt!89868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181810 (isDefined!163 (getValueByKey!210 (toList!1169 lt!89868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181811 () Bool)

(declare-fun Unit!5521 () Unit!5516)

(assert (=> b!181811 (= e!119739 Unit!5521)))

(declare-fun b!181812 () Bool)

(assert (=> b!181812 (= e!119740 (isDefined!163 (getValueByKey!210 (toList!1169 lt!89868) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54497 c!32589) b!181810))

(assert (= (and d!54497 (not c!32589)) b!181811))

(assert (= (and d!54497 (not res!86064)) b!181812))

(declare-fun m!209713 () Bool)

(assert (=> d!54497 m!209713))

(declare-fun m!209715 () Bool)

(assert (=> b!181810 m!209715))

(declare-fun m!209717 () Bool)

(assert (=> b!181810 m!209717))

(assert (=> b!181810 m!209717))

(declare-fun m!209719 () Bool)

(assert (=> b!181810 m!209719))

(assert (=> b!181812 m!209717))

(assert (=> b!181812 m!209717))

(assert (=> b!181812 m!209719))

(assert (=> bm!18355 d!54497))

(assert (=> bm!18361 d!54459))

(declare-fun d!54499 () Bool)

(assert (=> d!54499 (= (validKeyInArray!0 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181720 d!54499))

(declare-fun d!54501 () Bool)

(declare-fun e!119741 () Bool)

(assert (=> d!54501 e!119741))

(declare-fun res!86065 () Bool)

(assert (=> d!54501 (=> (not res!86065) (not e!119741))))

(declare-fun lt!89936 () ListLongMap!2307)

(assert (=> d!54501 (= res!86065 (contains!1249 lt!89936 (_1!1706 (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))))))))

(declare-fun lt!89935 () List!2310)

(assert (=> d!54501 (= lt!89936 (ListLongMap!2308 lt!89935))))

(declare-fun lt!89934 () Unit!5516)

(declare-fun lt!89933 () Unit!5516)

(assert (=> d!54501 (= lt!89934 lt!89933)))

(assert (=> d!54501 (= (getValueByKey!210 lt!89935 (_1!1706 (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))))) (Some!215 (_2!1706 (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))))))))

(assert (=> d!54501 (= lt!89933 (lemmaContainsTupThenGetReturnValue!111 lt!89935 (_1!1706 (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))) (_2!1706 (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))))))))

(assert (=> d!54501 (= lt!89935 (insertStrictlySorted!114 (toList!1169 (ite c!32572 call!18364 (ite c!32570 call!18363 call!18361))) (_1!1706 (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))) (_2!1706 (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))))))))

(assert (=> d!54501 (= (+!273 (ite c!32572 call!18364 (ite c!32570 call!18363 call!18361)) (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))) lt!89936)))

(declare-fun b!181813 () Bool)

(declare-fun res!86066 () Bool)

(assert (=> b!181813 (=> (not res!86066) (not e!119741))))

(assert (=> b!181813 (= res!86066 (= (getValueByKey!210 (toList!1169 lt!89936) (_1!1706 (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))))) (Some!215 (_2!1706 (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))))))))

(declare-fun b!181814 () Bool)

(assert (=> b!181814 (= e!119741 (contains!1251 (toList!1169 lt!89936) (ite (or c!32572 c!32570) (tuple2!3391 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3562 thiss!1248)) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))))))

(assert (= (and d!54501 res!86065) b!181813))

(assert (= (and b!181813 res!86066) b!181814))

(declare-fun m!209721 () Bool)

(assert (=> d!54501 m!209721))

(declare-fun m!209723 () Bool)

(assert (=> d!54501 m!209723))

(declare-fun m!209725 () Bool)

(assert (=> d!54501 m!209725))

(declare-fun m!209727 () Bool)

(assert (=> d!54501 m!209727))

(declare-fun m!209729 () Bool)

(assert (=> b!181813 m!209729))

(declare-fun m!209731 () Bool)

(assert (=> b!181814 m!209731))

(assert (=> bm!18360 d!54501))

(declare-fun d!54503 () Bool)

(assert (=> d!54503 (= (apply!153 lt!89868 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2083 (getValueByKey!210 (toList!1169 lt!89868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7419 () Bool)

(assert (= bs!7419 d!54503))

(declare-fun m!209733 () Bool)

(assert (=> bs!7419 m!209733))

(assert (=> bs!7419 m!209733))

(declare-fun m!209735 () Bool)

(assert (=> bs!7419 m!209735))

(assert (=> b!181717 d!54503))

(declare-fun d!54505 () Bool)

(declare-fun isEmpty!460 (Option!216) Bool)

(assert (=> d!54505 (= (isDefined!163 (getValueByKey!210 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828)) (not (isEmpty!460 (getValueByKey!210 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828))))))

(declare-fun bs!7420 () Bool)

(assert (= bs!7420 d!54505))

(assert (=> bs!7420 m!209523))

(declare-fun m!209737 () Bool)

(assert (=> bs!7420 m!209737))

(assert (=> b!181666 d!54505))

(declare-fun d!54507 () Bool)

(declare-fun c!32594 () Bool)

(assert (=> d!54507 (= c!32594 (and ((_ is Cons!2306) (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))) (= (_1!1706 (h!2933 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))))) key!828)))))

(declare-fun e!119746 () Option!216)

(assert (=> d!54507 (= (getValueByKey!210 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828) e!119746)))

(declare-fun b!181826 () Bool)

(declare-fun e!119747 () Option!216)

(assert (=> b!181826 (= e!119747 None!214)))

(declare-fun b!181823 () Bool)

(assert (=> b!181823 (= e!119746 (Some!215 (_2!1706 (h!2933 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))))))))

(declare-fun b!181824 () Bool)

(assert (=> b!181824 (= e!119746 e!119747)))

(declare-fun c!32595 () Bool)

(assert (=> b!181824 (= c!32595 (and ((_ is Cons!2306) (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))) (not (= (_1!1706 (h!2933 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))))) key!828))))))

(declare-fun b!181825 () Bool)

(assert (=> b!181825 (= e!119747 (getValueByKey!210 (t!7166 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))) key!828))))

(assert (= (and d!54507 c!32594) b!181823))

(assert (= (and d!54507 (not c!32594)) b!181824))

(assert (= (and b!181824 c!32595) b!181825))

(assert (= (and b!181824 (not c!32595)) b!181826))

(declare-fun m!209739 () Bool)

(assert (=> b!181825 m!209739))

(assert (=> b!181666 d!54507))

(declare-fun d!54509 () Bool)

(declare-fun e!119761 () Bool)

(assert (=> d!54509 e!119761))

(declare-fun c!32602 () Bool)

(declare-fun lt!89942 () SeekEntryResult!602)

(assert (=> d!54509 (= c!32602 (and ((_ is Intermediate!602) lt!89942) (undefined!1414 lt!89942)))))

(declare-fun e!119762 () SeekEntryResult!602)

(assert (=> d!54509 (= lt!89942 e!119762)))

(declare-fun c!32604 () Bool)

(assert (=> d!54509 (= c!32604 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!89941 () (_ BitVec 64))

(assert (=> d!54509 (= lt!89941 (select (arr!3641 (_keys!5624 thiss!1248)) (toIndex!0 key!828 (mask!8746 thiss!1248))))))

(assert (=> d!54509 (validMask!0 (mask!8746 thiss!1248))))

(assert (=> d!54509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8746 thiss!1248)) key!828 (_keys!5624 thiss!1248) (mask!8746 thiss!1248)) lt!89942)))

(declare-fun b!181845 () Bool)

(declare-fun e!119760 () SeekEntryResult!602)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181845 (= e!119760 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8746 thiss!1248)) #b00000000000000000000000000000000 (mask!8746 thiss!1248)) key!828 (_keys!5624 thiss!1248) (mask!8746 thiss!1248)))))

(declare-fun b!181846 () Bool)

(assert (=> b!181846 (and (bvsge (index!4580 lt!89942) #b00000000000000000000000000000000) (bvslt (index!4580 lt!89942) (size!3951 (_keys!5624 thiss!1248))))))

(declare-fun res!86074 () Bool)

(assert (=> b!181846 (= res!86074 (= (select (arr!3641 (_keys!5624 thiss!1248)) (index!4580 lt!89942)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119758 () Bool)

(assert (=> b!181846 (=> res!86074 e!119758)))

(declare-fun b!181847 () Bool)

(declare-fun e!119759 () Bool)

(assert (=> b!181847 (= e!119761 e!119759)))

(declare-fun res!86075 () Bool)

(assert (=> b!181847 (= res!86075 (and ((_ is Intermediate!602) lt!89942) (not (undefined!1414 lt!89942)) (bvslt (x!19824 lt!89942) #b01111111111111111111111111111110) (bvsge (x!19824 lt!89942) #b00000000000000000000000000000000) (bvsge (x!19824 lt!89942) #b00000000000000000000000000000000)))))

(assert (=> b!181847 (=> (not res!86075) (not e!119759))))

(declare-fun b!181848 () Bool)

(assert (=> b!181848 (= e!119760 (Intermediate!602 false (toIndex!0 key!828 (mask!8746 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181849 () Bool)

(assert (=> b!181849 (and (bvsge (index!4580 lt!89942) #b00000000000000000000000000000000) (bvslt (index!4580 lt!89942) (size!3951 (_keys!5624 thiss!1248))))))

(assert (=> b!181849 (= e!119758 (= (select (arr!3641 (_keys!5624 thiss!1248)) (index!4580 lt!89942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181850 () Bool)

(assert (=> b!181850 (= e!119762 e!119760)))

(declare-fun c!32603 () Bool)

(assert (=> b!181850 (= c!32603 (or (= lt!89941 key!828) (= (bvadd lt!89941 lt!89941) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181851 () Bool)

(assert (=> b!181851 (and (bvsge (index!4580 lt!89942) #b00000000000000000000000000000000) (bvslt (index!4580 lt!89942) (size!3951 (_keys!5624 thiss!1248))))))

(declare-fun res!86073 () Bool)

(assert (=> b!181851 (= res!86073 (= (select (arr!3641 (_keys!5624 thiss!1248)) (index!4580 lt!89942)) key!828))))

(assert (=> b!181851 (=> res!86073 e!119758)))

(assert (=> b!181851 (= e!119759 e!119758)))

(declare-fun b!181852 () Bool)

(assert (=> b!181852 (= e!119762 (Intermediate!602 true (toIndex!0 key!828 (mask!8746 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181853 () Bool)

(assert (=> b!181853 (= e!119761 (bvsge (x!19824 lt!89942) #b01111111111111111111111111111110))))

(assert (= (and d!54509 c!32604) b!181852))

(assert (= (and d!54509 (not c!32604)) b!181850))

(assert (= (and b!181850 c!32603) b!181848))

(assert (= (and b!181850 (not c!32603)) b!181845))

(assert (= (and d!54509 c!32602) b!181853))

(assert (= (and d!54509 (not c!32602)) b!181847))

(assert (= (and b!181847 res!86075) b!181851))

(assert (= (and b!181851 (not res!86073)) b!181846))

(assert (= (and b!181846 (not res!86074)) b!181849))

(assert (=> b!181845 m!209513))

(declare-fun m!209741 () Bool)

(assert (=> b!181845 m!209741))

(assert (=> b!181845 m!209741))

(declare-fun m!209743 () Bool)

(assert (=> b!181845 m!209743))

(declare-fun m!209745 () Bool)

(assert (=> b!181851 m!209745))

(assert (=> d!54509 m!209513))

(declare-fun m!209747 () Bool)

(assert (=> d!54509 m!209747))

(assert (=> d!54509 m!209465))

(assert (=> b!181846 m!209745))

(assert (=> b!181849 m!209745))

(assert (=> d!54453 d!54509))

(declare-fun d!54511 () Bool)

(declare-fun lt!89948 () (_ BitVec 32))

(declare-fun lt!89947 () (_ BitVec 32))

(assert (=> d!54511 (= lt!89948 (bvmul (bvxor lt!89947 (bvlshr lt!89947 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54511 (= lt!89947 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54511 (and (bvsge (mask!8746 thiss!1248) #b00000000000000000000000000000000) (let ((res!86076 (let ((h!2936 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19841 (bvmul (bvxor h!2936 (bvlshr h!2936 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19841 (bvlshr x!19841 #b00000000000000000000000000001101)) (mask!8746 thiss!1248)))))) (and (bvslt res!86076 (bvadd (mask!8746 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!86076 #b00000000000000000000000000000000))))))

(assert (=> d!54511 (= (toIndex!0 key!828 (mask!8746 thiss!1248)) (bvand (bvxor lt!89948 (bvlshr lt!89948 #b00000000000000000000000000001101)) (mask!8746 thiss!1248)))))

(assert (=> d!54453 d!54511))

(assert (=> d!54453 d!54449))

(declare-fun b!181866 () Bool)

(declare-fun e!119769 () SeekEntryResult!602)

(assert (=> b!181866 (= e!119769 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19824 lt!89793) #b00000000000000000000000000000001) (nextIndex!0 (index!4580 lt!89793) (x!19824 lt!89793) (mask!8746 thiss!1248)) (index!4580 lt!89793) key!828 (_keys!5624 thiss!1248) (mask!8746 thiss!1248)))))

(declare-fun b!181867 () Bool)

(declare-fun e!119771 () SeekEntryResult!602)

(assert (=> b!181867 (= e!119771 (Found!602 (index!4580 lt!89793)))))

(declare-fun b!181868 () Bool)

(assert (=> b!181868 (= e!119769 (MissingVacant!602 (index!4580 lt!89793)))))

(declare-fun b!181869 () Bool)

(declare-fun e!119770 () SeekEntryResult!602)

(assert (=> b!181869 (= e!119770 e!119771)))

(declare-fun c!32611 () Bool)

(declare-fun lt!89953 () (_ BitVec 64))

(assert (=> b!181869 (= c!32611 (= lt!89953 key!828))))

(declare-fun b!181870 () Bool)

(assert (=> b!181870 (= e!119770 Undefined!602)))

(declare-fun b!181871 () Bool)

(declare-fun c!32612 () Bool)

(assert (=> b!181871 (= c!32612 (= lt!89953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181871 (= e!119771 e!119769)))

(declare-fun d!54513 () Bool)

(declare-fun lt!89954 () SeekEntryResult!602)

(assert (=> d!54513 (and (or ((_ is Undefined!602) lt!89954) (not ((_ is Found!602) lt!89954)) (and (bvsge (index!4579 lt!89954) #b00000000000000000000000000000000) (bvslt (index!4579 lt!89954) (size!3951 (_keys!5624 thiss!1248))))) (or ((_ is Undefined!602) lt!89954) ((_ is Found!602) lt!89954) (not ((_ is MissingVacant!602) lt!89954)) (not (= (index!4581 lt!89954) (index!4580 lt!89793))) (and (bvsge (index!4581 lt!89954) #b00000000000000000000000000000000) (bvslt (index!4581 lt!89954) (size!3951 (_keys!5624 thiss!1248))))) (or ((_ is Undefined!602) lt!89954) (ite ((_ is Found!602) lt!89954) (= (select (arr!3641 (_keys!5624 thiss!1248)) (index!4579 lt!89954)) key!828) (and ((_ is MissingVacant!602) lt!89954) (= (index!4581 lt!89954) (index!4580 lt!89793)) (= (select (arr!3641 (_keys!5624 thiss!1248)) (index!4581 lt!89954)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54513 (= lt!89954 e!119770)))

(declare-fun c!32613 () Bool)

(assert (=> d!54513 (= c!32613 (bvsge (x!19824 lt!89793) #b01111111111111111111111111111110))))

(assert (=> d!54513 (= lt!89953 (select (arr!3641 (_keys!5624 thiss!1248)) (index!4580 lt!89793)))))

(assert (=> d!54513 (validMask!0 (mask!8746 thiss!1248))))

(assert (=> d!54513 (= (seekKeyOrZeroReturnVacant!0 (x!19824 lt!89793) (index!4580 lt!89793) (index!4580 lt!89793) key!828 (_keys!5624 thiss!1248) (mask!8746 thiss!1248)) lt!89954)))

(assert (= (and d!54513 c!32613) b!181870))

(assert (= (and d!54513 (not c!32613)) b!181869))

(assert (= (and b!181869 c!32611) b!181867))

(assert (= (and b!181869 (not c!32611)) b!181871))

(assert (= (and b!181871 c!32612) b!181868))

(assert (= (and b!181871 (not c!32612)) b!181866))

(declare-fun m!209749 () Bool)

(assert (=> b!181866 m!209749))

(assert (=> b!181866 m!209749))

(declare-fun m!209751 () Bool)

(assert (=> b!181866 m!209751))

(declare-fun m!209753 () Bool)

(assert (=> d!54513 m!209753))

(declare-fun m!209755 () Bool)

(assert (=> d!54513 m!209755))

(assert (=> d!54513 m!209505))

(assert (=> d!54513 m!209465))

(assert (=> b!181657 d!54513))

(declare-fun b!181880 () Bool)

(declare-fun e!119779 () Bool)

(declare-fun call!18370 () Bool)

(assert (=> b!181880 (= e!119779 call!18370)))

(declare-fun b!181881 () Bool)

(declare-fun e!119780 () Bool)

(declare-fun e!119778 () Bool)

(assert (=> b!181881 (= e!119780 e!119778)))

(declare-fun c!32616 () Bool)

(assert (=> b!181881 (= c!32616 (validKeyInArray!0 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54515 () Bool)

(declare-fun res!86081 () Bool)

(assert (=> d!54515 (=> res!86081 e!119780)))

(assert (=> d!54515 (= res!86081 (bvsge #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(assert (=> d!54515 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5624 thiss!1248) (mask!8746 thiss!1248)) e!119780)))

(declare-fun b!181882 () Bool)

(assert (=> b!181882 (= e!119778 call!18370)))

(declare-fun b!181883 () Bool)

(assert (=> b!181883 (= e!119778 e!119779)))

(declare-fun lt!89962 () (_ BitVec 64))

(assert (=> b!181883 (= lt!89962 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89963 () Unit!5516)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7695 (_ BitVec 64) (_ BitVec 32)) Unit!5516)

(assert (=> b!181883 (= lt!89963 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5624 thiss!1248) lt!89962 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!181883 (arrayContainsKey!0 (_keys!5624 thiss!1248) lt!89962 #b00000000000000000000000000000000)))

(declare-fun lt!89961 () Unit!5516)

(assert (=> b!181883 (= lt!89961 lt!89963)))

(declare-fun res!86082 () Bool)

(assert (=> b!181883 (= res!86082 (= (seekEntryOrOpen!0 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000) (_keys!5624 thiss!1248) (mask!8746 thiss!1248)) (Found!602 #b00000000000000000000000000000000)))))

(assert (=> b!181883 (=> (not res!86082) (not e!119779))))

(declare-fun bm!18367 () Bool)

(assert (=> bm!18367 (= call!18370 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5624 thiss!1248) (mask!8746 thiss!1248)))))

(assert (= (and d!54515 (not res!86081)) b!181881))

(assert (= (and b!181881 c!32616) b!181883))

(assert (= (and b!181881 (not c!32616)) b!181882))

(assert (= (and b!181883 res!86082) b!181880))

(assert (= (or b!181880 b!181882) bm!18367))

(assert (=> b!181881 m!209533))

(assert (=> b!181881 m!209533))

(assert (=> b!181881 m!209535))

(assert (=> b!181883 m!209533))

(declare-fun m!209757 () Bool)

(assert (=> b!181883 m!209757))

(declare-fun m!209759 () Bool)

(assert (=> b!181883 m!209759))

(assert (=> b!181883 m!209533))

(declare-fun m!209761 () Bool)

(assert (=> b!181883 m!209761))

(declare-fun m!209763 () Bool)

(assert (=> bm!18367 m!209763))

(assert (=> b!181638 d!54515))

(declare-fun b!181894 () Bool)

(declare-fun e!119790 () Bool)

(declare-fun call!18373 () Bool)

(assert (=> b!181894 (= e!119790 call!18373)))

(declare-fun b!181895 () Bool)

(declare-fun e!119789 () Bool)

(assert (=> b!181895 (= e!119789 e!119790)))

(declare-fun c!32619 () Bool)

(assert (=> b!181895 (= c!32619 (validKeyInArray!0 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181896 () Bool)

(declare-fun e!119791 () Bool)

(assert (=> b!181896 (= e!119791 e!119789)))

(declare-fun res!86090 () Bool)

(assert (=> b!181896 (=> (not res!86090) (not e!119789))))

(declare-fun e!119792 () Bool)

(assert (=> b!181896 (= res!86090 (not e!119792))))

(declare-fun res!86089 () Bool)

(assert (=> b!181896 (=> (not res!86089) (not e!119792))))

(assert (=> b!181896 (= res!86089 (validKeyInArray!0 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181897 () Bool)

(declare-fun contains!1252 (List!2312 (_ BitVec 64)) Bool)

(assert (=> b!181897 (= e!119792 (contains!1252 Nil!2309 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54517 () Bool)

(declare-fun res!86091 () Bool)

(assert (=> d!54517 (=> res!86091 e!119791)))

(assert (=> d!54517 (= res!86091 (bvsge #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(assert (=> d!54517 (= (arrayNoDuplicates!0 (_keys!5624 thiss!1248) #b00000000000000000000000000000000 Nil!2309) e!119791)))

(declare-fun b!181898 () Bool)

(assert (=> b!181898 (= e!119790 call!18373)))

(declare-fun bm!18370 () Bool)

(assert (=> bm!18370 (= call!18373 (arrayNoDuplicates!0 (_keys!5624 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32619 (Cons!2308 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000) Nil!2309) Nil!2309)))))

(assert (= (and d!54517 (not res!86091)) b!181896))

(assert (= (and b!181896 res!86089) b!181897))

(assert (= (and b!181896 res!86090) b!181895))

(assert (= (and b!181895 c!32619) b!181898))

(assert (= (and b!181895 (not c!32619)) b!181894))

(assert (= (or b!181898 b!181894) bm!18370))

(assert (=> b!181895 m!209533))

(assert (=> b!181895 m!209533))

(assert (=> b!181895 m!209535))

(assert (=> b!181896 m!209533))

(assert (=> b!181896 m!209533))

(assert (=> b!181896 m!209535))

(assert (=> b!181897 m!209533))

(assert (=> b!181897 m!209533))

(declare-fun m!209765 () Bool)

(assert (=> b!181897 m!209765))

(assert (=> bm!18370 m!209533))

(declare-fun m!209767 () Bool)

(assert (=> bm!18370 m!209767))

(assert (=> b!181639 d!54517))

(assert (=> b!181716 d!54499))

(declare-fun d!54519 () Bool)

(declare-fun e!119794 () Bool)

(assert (=> d!54519 e!119794))

(declare-fun res!86092 () Bool)

(assert (=> d!54519 (=> res!86092 e!119794)))

(declare-fun lt!89965 () Bool)

(assert (=> d!54519 (= res!86092 (not lt!89965))))

(declare-fun lt!89967 () Bool)

(assert (=> d!54519 (= lt!89965 lt!89967)))

(declare-fun lt!89966 () Unit!5516)

(declare-fun e!119793 () Unit!5516)

(assert (=> d!54519 (= lt!89966 e!119793)))

(declare-fun c!32620 () Bool)

(assert (=> d!54519 (= c!32620 lt!89967)))

(assert (=> d!54519 (= lt!89967 (containsKey!214 (toList!1169 lt!89868) (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54519 (= (contains!1249 lt!89868 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)) lt!89965)))

(declare-fun b!181899 () Bool)

(declare-fun lt!89964 () Unit!5516)

(assert (=> b!181899 (= e!119793 lt!89964)))

(assert (=> b!181899 (= lt!89964 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1169 lt!89868) (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181899 (isDefined!163 (getValueByKey!210 (toList!1169 lt!89868) (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181900 () Bool)

(declare-fun Unit!5522 () Unit!5516)

(assert (=> b!181900 (= e!119793 Unit!5522)))

(declare-fun b!181901 () Bool)

(assert (=> b!181901 (= e!119794 (isDefined!163 (getValueByKey!210 (toList!1169 lt!89868) (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54519 c!32620) b!181899))

(assert (= (and d!54519 (not c!32620)) b!181900))

(assert (= (and d!54519 (not res!86092)) b!181901))

(assert (=> d!54519 m!209533))

(declare-fun m!209769 () Bool)

(assert (=> d!54519 m!209769))

(assert (=> b!181899 m!209533))

(declare-fun m!209771 () Bool)

(assert (=> b!181899 m!209771))

(assert (=> b!181899 m!209533))

(assert (=> b!181899 m!209703))

(assert (=> b!181899 m!209703))

(declare-fun m!209773 () Bool)

(assert (=> b!181899 m!209773))

(assert (=> b!181901 m!209533))

(assert (=> b!181901 m!209703))

(assert (=> b!181901 m!209703))

(assert (=> b!181901 m!209773))

(assert (=> b!181713 d!54519))

(declare-fun d!54521 () Bool)

(declare-fun e!119795 () Bool)

(assert (=> d!54521 e!119795))

(declare-fun res!86093 () Bool)

(assert (=> d!54521 (=> (not res!86093) (not e!119795))))

(declare-fun lt!89971 () ListLongMap!2307)

(assert (=> d!54521 (= res!86093 (contains!1249 lt!89971 (_1!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))))))

(declare-fun lt!89970 () List!2310)

(assert (=> d!54521 (= lt!89971 (ListLongMap!2308 lt!89970))))

(declare-fun lt!89969 () Unit!5516)

(declare-fun lt!89968 () Unit!5516)

(assert (=> d!54521 (= lt!89969 lt!89968)))

(assert (=> d!54521 (= (getValueByKey!210 lt!89970 (_1!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))) (Some!215 (_2!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))))))

(assert (=> d!54521 (= lt!89968 (lemmaContainsTupThenGetReturnValue!111 lt!89970 (_1!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))) (_2!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))))))

(assert (=> d!54521 (= lt!89970 (insertStrictlySorted!114 (toList!1169 call!18362) (_1!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))) (_2!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))))))

(assert (=> d!54521 (= (+!273 call!18362 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))) lt!89971)))

(declare-fun b!181902 () Bool)

(declare-fun res!86094 () Bool)

(assert (=> b!181902 (=> (not res!86094) (not e!119795))))

(assert (=> b!181902 (= res!86094 (= (getValueByKey!210 (toList!1169 lt!89971) (_1!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248)))) (Some!215 (_2!1706 (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))))))))

(declare-fun b!181903 () Bool)

(assert (=> b!181903 (= e!119795 (contains!1251 (toList!1169 lt!89971) (tuple2!3391 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3562 thiss!1248))))))

(assert (= (and d!54521 res!86093) b!181902))

(assert (= (and b!181902 res!86094) b!181903))

(declare-fun m!209775 () Bool)

(assert (=> d!54521 m!209775))

(declare-fun m!209777 () Bool)

(assert (=> d!54521 m!209777))

(declare-fun m!209779 () Bool)

(assert (=> d!54521 m!209779))

(declare-fun m!209781 () Bool)

(assert (=> d!54521 m!209781))

(declare-fun m!209783 () Bool)

(assert (=> b!181902 m!209783))

(declare-fun m!209785 () Bool)

(assert (=> b!181903 m!209785))

(assert (=> b!181714 d!54521))

(declare-fun d!54523 () Bool)

(assert (=> d!54523 (isDefined!163 (getValueByKey!210 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828))))

(declare-fun lt!89974 () Unit!5516)

(declare-fun choose!966 (List!2310 (_ BitVec 64)) Unit!5516)

(assert (=> d!54523 (= lt!89974 (choose!966 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828))))

(declare-fun e!119798 () Bool)

(assert (=> d!54523 e!119798))

(declare-fun res!86097 () Bool)

(assert (=> d!54523 (=> (not res!86097) (not e!119798))))

(declare-fun isStrictlySorted!343 (List!2310) Bool)

(assert (=> d!54523 (= res!86097 (isStrictlySorted!343 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248)))))))

(assert (=> d!54523 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828) lt!89974)))

(declare-fun b!181906 () Bool)

(assert (=> b!181906 (= e!119798 (containsKey!214 (toList!1169 (getCurrentListMap!817 (_keys!5624 thiss!1248) (_values!3704 thiss!1248) (mask!8746 thiss!1248) (extraKeys!3458 thiss!1248) (zeroValue!3562 thiss!1248) (minValue!3562 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3721 thiss!1248))) key!828))))

(assert (= (and d!54523 res!86097) b!181906))

(assert (=> d!54523 m!209523))

(assert (=> d!54523 m!209523))

(assert (=> d!54523 m!209525))

(declare-fun m!209787 () Bool)

(assert (=> d!54523 m!209787))

(declare-fun m!209789 () Bool)

(assert (=> d!54523 m!209789))

(assert (=> b!181906 m!209519))

(assert (=> b!181664 d!54523))

(assert (=> b!181664 d!54505))

(assert (=> b!181664 d!54507))

(declare-fun b!181916 () Bool)

(declare-fun res!86109 () Bool)

(declare-fun e!119801 () Bool)

(assert (=> b!181916 (=> (not res!86109) (not e!119801))))

(declare-fun size!3955 (LongMapFixedSize!2478) (_ BitVec 32))

(assert (=> b!181916 (= res!86109 (bvsge (size!3955 thiss!1248) (_size!1288 thiss!1248)))))

(declare-fun b!181915 () Bool)

(declare-fun res!86106 () Bool)

(assert (=> b!181915 (=> (not res!86106) (not e!119801))))

(assert (=> b!181915 (= res!86106 (and (= (size!3952 (_values!3704 thiss!1248)) (bvadd (mask!8746 thiss!1248) #b00000000000000000000000000000001)) (= (size!3951 (_keys!5624 thiss!1248)) (size!3952 (_values!3704 thiss!1248))) (bvsge (_size!1288 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1288 thiss!1248) (bvadd (mask!8746 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!54525 () Bool)

(declare-fun res!86108 () Bool)

(assert (=> d!54525 (=> (not res!86108) (not e!119801))))

(assert (=> d!54525 (= res!86108 (validMask!0 (mask!8746 thiss!1248)))))

(assert (=> d!54525 (= (simpleValid!169 thiss!1248) e!119801)))

(declare-fun b!181917 () Bool)

(declare-fun res!86107 () Bool)

(assert (=> b!181917 (=> (not res!86107) (not e!119801))))

(assert (=> b!181917 (= res!86107 (= (size!3955 thiss!1248) (bvadd (_size!1288 thiss!1248) (bvsdiv (bvadd (extraKeys!3458 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!181918 () Bool)

(assert (=> b!181918 (= e!119801 (and (bvsge (extraKeys!3458 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3458 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1288 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!54525 res!86108) b!181915))

(assert (= (and b!181915 res!86106) b!181916))

(assert (= (and b!181916 res!86109) b!181917))

(assert (= (and b!181917 res!86107) b!181918))

(declare-fun m!209791 () Bool)

(assert (=> b!181916 m!209791))

(assert (=> d!54525 m!209465))

(assert (=> b!181917 m!209791))

(assert (=> d!54451 d!54525))

(declare-fun d!54527 () Bool)

(assert (=> d!54527 (= (apply!153 lt!89868 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2083 (getValueByKey!210 (toList!1169 lt!89868) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7421 () Bool)

(assert (= bs!7421 d!54527))

(assert (=> bs!7421 m!209717))

(assert (=> bs!7421 m!209717))

(declare-fun m!209793 () Bool)

(assert (=> bs!7421 m!209793))

(assert (=> b!181723 d!54527))

(assert (=> d!54457 d!54449))

(declare-fun d!54529 () Bool)

(declare-fun lt!89977 () (_ BitVec 32))

(assert (=> d!54529 (and (bvsge lt!89977 #b00000000000000000000000000000000) (bvsle lt!89977 (bvsub (size!3951 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119807 () (_ BitVec 32))

(assert (=> d!54529 (= lt!89977 e!119807)))

(declare-fun c!32625 () Bool)

(assert (=> d!54529 (= c!32625 (bvsge #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))))))

(assert (=> d!54529 (and (bvsle #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3951 (_keys!5624 thiss!1248)) (size!3951 (_keys!5624 thiss!1248))))))

(assert (=> d!54529 (= (arrayCountValidKeys!0 (_keys!5624 thiss!1248) #b00000000000000000000000000000000 (size!3951 (_keys!5624 thiss!1248))) lt!89977)))

(declare-fun b!181927 () Bool)

(declare-fun e!119806 () (_ BitVec 32))

(declare-fun call!18376 () (_ BitVec 32))

(assert (=> b!181927 (= e!119806 call!18376)))

(declare-fun b!181928 () Bool)

(assert (=> b!181928 (= e!119807 #b00000000000000000000000000000000)))

(declare-fun b!181929 () Bool)

(assert (=> b!181929 (= e!119807 e!119806)))

(declare-fun c!32626 () Bool)

(assert (=> b!181929 (= c!32626 (validKeyInArray!0 (select (arr!3641 (_keys!5624 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181930 () Bool)

(assert (=> b!181930 (= e!119806 (bvadd #b00000000000000000000000000000001 call!18376))))

(declare-fun bm!18373 () Bool)

(assert (=> bm!18373 (= call!18376 (arrayCountValidKeys!0 (_keys!5624 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3951 (_keys!5624 thiss!1248))))))

(assert (= (and d!54529 c!32625) b!181928))

(assert (= (and d!54529 (not c!32625)) b!181929))

(assert (= (and b!181929 c!32626) b!181930))

(assert (= (and b!181929 (not c!32626)) b!181927))

(assert (= (or b!181930 b!181927) bm!18373))

(assert (=> b!181929 m!209533))

(assert (=> b!181929 m!209533))

(assert (=> b!181929 m!209535))

(declare-fun m!209795 () Bool)

(assert (=> bm!18373 m!209795))

(assert (=> b!181637 d!54529))

(declare-fun d!54531 () Bool)

(declare-fun e!119809 () Bool)

(assert (=> d!54531 e!119809))

(declare-fun res!86110 () Bool)

(assert (=> d!54531 (=> res!86110 e!119809)))

(declare-fun lt!89979 () Bool)

(assert (=> d!54531 (= res!86110 (not lt!89979))))

(declare-fun lt!89981 () Bool)

(assert (=> d!54531 (= lt!89979 lt!89981)))

(declare-fun lt!89980 () Unit!5516)

(declare-fun e!119808 () Unit!5516)

(assert (=> d!54531 (= lt!89980 e!119808)))

(declare-fun c!32627 () Bool)

(assert (=> d!54531 (= c!32627 lt!89981)))

(assert (=> d!54531 (= lt!89981 (containsKey!214 (toList!1169 lt!89868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54531 (= (contains!1249 lt!89868 #b1000000000000000000000000000000000000000000000000000000000000000) lt!89979)))

(declare-fun b!181931 () Bool)

(declare-fun lt!89978 () Unit!5516)

(assert (=> b!181931 (= e!119808 lt!89978)))

(assert (=> b!181931 (= lt!89978 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1169 lt!89868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181931 (isDefined!163 (getValueByKey!210 (toList!1169 lt!89868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181932 () Bool)

(declare-fun Unit!5523 () Unit!5516)

(assert (=> b!181932 (= e!119808 Unit!5523)))

(declare-fun b!181933 () Bool)

(assert (=> b!181933 (= e!119809 (isDefined!163 (getValueByKey!210 (toList!1169 lt!89868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54531 c!32627) b!181931))

(assert (= (and d!54531 (not c!32627)) b!181932))

(assert (= (and d!54531 (not res!86110)) b!181933))

(declare-fun m!209797 () Bool)

(assert (=> d!54531 m!209797))

(declare-fun m!209799 () Bool)

(assert (=> b!181931 m!209799))

(assert (=> b!181931 m!209733))

(assert (=> b!181931 m!209733))

(declare-fun m!209801 () Bool)

(assert (=> b!181931 m!209801))

(assert (=> b!181933 m!209733))

(assert (=> b!181933 m!209733))

(assert (=> b!181933 m!209801))

(assert (=> bm!18356 d!54531))

(declare-fun b!181934 () Bool)

(declare-fun e!119810 () Bool)

(assert (=> b!181934 (= e!119810 tp_is_empty!4257)))

(declare-fun condMapEmpty!7306 () Bool)

(declare-fun mapDefault!7306 () ValueCell!1785)

(assert (=> mapNonEmpty!7305 (= condMapEmpty!7306 (= mapRest!7305 ((as const (Array (_ BitVec 32) ValueCell!1785)) mapDefault!7306)))))

(declare-fun e!119811 () Bool)

(declare-fun mapRes!7306 () Bool)

(assert (=> mapNonEmpty!7305 (= tp!16215 (and e!119811 mapRes!7306))))

(declare-fun b!181935 () Bool)

(assert (=> b!181935 (= e!119811 tp_is_empty!4257)))

(declare-fun mapNonEmpty!7306 () Bool)

(declare-fun tp!16216 () Bool)

(assert (=> mapNonEmpty!7306 (= mapRes!7306 (and tp!16216 e!119810))))

(declare-fun mapKey!7306 () (_ BitVec 32))

(declare-fun mapRest!7306 () (Array (_ BitVec 32) ValueCell!1785))

(declare-fun mapValue!7306 () ValueCell!1785)

(assert (=> mapNonEmpty!7306 (= mapRest!7305 (store mapRest!7306 mapKey!7306 mapValue!7306))))

(declare-fun mapIsEmpty!7306 () Bool)

(assert (=> mapIsEmpty!7306 mapRes!7306))

(assert (= (and mapNonEmpty!7305 condMapEmpty!7306) mapIsEmpty!7306))

(assert (= (and mapNonEmpty!7305 (not condMapEmpty!7306)) mapNonEmpty!7306))

(assert (= (and mapNonEmpty!7306 ((_ is ValueCellFull!1785) mapValue!7306)) b!181934))

(assert (= (and mapNonEmpty!7305 ((_ is ValueCellFull!1785) mapDefault!7306)) b!181935))

(declare-fun m!209803 () Bool)

(assert (=> mapNonEmpty!7306 m!209803))

(declare-fun b_lambda!7159 () Bool)

(assert (= b_lambda!7157 (or (and b!181600 b_free!4485) b_lambda!7159)))

(declare-fun b_lambda!7161 () Bool)

(assert (= b_lambda!7155 (or (and b!181600 b_free!4485) b_lambda!7161)))

(check-sat (not b!181883) (not d!54513) (not bm!18367) (not d!54519) (not b!181917) (not d!54489) (not d!54505) (not d!54461) (not d!54479) (not d!54501) (not d!54523) (not b!181782) (not bm!18373) (not d!54525) (not d!54459) (not b!181796) (not b!181933) (not b!181812) (not b_lambda!7161) (not b!181765) (not mapNonEmpty!7306) (not b!181810) (not b!181897) (not d!54521) (not b!181931) (not d!54475) (not b!181881) (not b!181929) (not d!54487) (not d!54471) (not b!181899) b_and!11043 (not d!54531) (not b!181825) (not d!54473) (not d!54509) (not b!181780) (not b!181916) (not b!181766) (not b!181866) (not b_lambda!7159) (not d!54465) (not d!54491) tp_is_empty!4257 (not d!54469) (not b!181813) (not b!181784) (not d!54527) (not d!54497) (not bm!18370) (not b!181774) (not d!54467) (not d!54485) (not b!181895) (not bm!18364) (not b!181764) (not b!181901) (not b!181781) (not b!181783) (not b!181793) (not b!181845) (not b_lambda!7153) (not b!181803) (not b_next!4485) (not d!54503) (not b!181768) (not b!181896) (not b!181814) (not d!54477) (not b!181769) (not b!181795) (not b!181802) (not b!181770) (not b!181767) (not b!181809) (not b!181797) (not d!54483) (not d!54481) (not d!54463) (not b!181906) (not b!181902) (not b!181903) (not b!181785))
(check-sat b_and!11043 (not b_next!4485))
