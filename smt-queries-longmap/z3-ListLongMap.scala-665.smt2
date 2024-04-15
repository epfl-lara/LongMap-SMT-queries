; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16434 () Bool)

(assert start!16434)

(declare-fun b!163423 () Bool)

(declare-fun b_free!3799 () Bool)

(declare-fun b_next!3799 () Bool)

(assert (=> b!163423 (= b_free!3799 (not b_next!3799))))

(declare-fun tp!13985 () Bool)

(declare-fun b_and!10187 () Bool)

(assert (=> b!163423 (= tp!13985 b_and!10187)))

(declare-fun b!163417 () Bool)

(declare-fun e!107216 () Bool)

(declare-datatypes ((V!4449 0))(
  ( (V!4450 (val!1845 Int)) )
))
(declare-datatypes ((ValueCell!1457 0))(
  ( (ValueCellFull!1457 (v!3704 V!4449)) (EmptyCell!1457) )
))
(declare-datatypes ((array!6271 0))(
  ( (array!6272 (arr!2974 (Array (_ BitVec 32) (_ BitVec 64))) (size!3262 (_ BitVec 32))) )
))
(declare-datatypes ((array!6273 0))(
  ( (array!6274 (arr!2975 (Array (_ BitVec 32) ValueCell!1457)) (size!3263 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1822 0))(
  ( (LongMapFixedSize!1823 (defaultEntry!3353 Int) (mask!8016 (_ BitVec 32)) (extraKeys!3094 (_ BitVec 32)) (zeroValue!3196 V!4449) (minValue!3196 V!4449) (_size!960 (_ BitVec 32)) (_keys!5167 array!6271) (_values!3336 array!6273) (_vacant!960 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1822)

(assert (=> b!163417 (= e!107216 (and (= (size!3263 (_values!3336 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8016 thiss!1248))) (= (size!3262 (_keys!5167 thiss!1248)) (size!3263 (_values!3336 thiss!1248))) (bvsge (mask!8016 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3094 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3094 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6107 () Bool)

(declare-fun mapRes!6107 () Bool)

(assert (=> mapIsEmpty!6107 mapRes!6107))

(declare-fun mapNonEmpty!6107 () Bool)

(declare-fun tp!13984 () Bool)

(declare-fun e!107213 () Bool)

(assert (=> mapNonEmpty!6107 (= mapRes!6107 (and tp!13984 e!107213))))

(declare-fun mapRest!6107 () (Array (_ BitVec 32) ValueCell!1457))

(declare-fun mapKey!6107 () (_ BitVec 32))

(declare-fun mapValue!6107 () ValueCell!1457)

(assert (=> mapNonEmpty!6107 (= (arr!2975 (_values!3336 thiss!1248)) (store mapRest!6107 mapKey!6107 mapValue!6107))))

(declare-fun b!163418 () Bool)

(declare-fun e!107218 () Bool)

(assert (=> b!163418 (= e!107218 e!107216)))

(declare-fun res!77305 () Bool)

(assert (=> b!163418 (=> (not res!77305) (not e!107216))))

(declare-datatypes ((SeekEntryResult!411 0))(
  ( (MissingZero!411 (index!3812 (_ BitVec 32))) (Found!411 (index!3813 (_ BitVec 32))) (Intermediate!411 (undefined!1223 Bool) (index!3814 (_ BitVec 32)) (x!18141 (_ BitVec 32))) (Undefined!411) (MissingVacant!411 (index!3815 (_ BitVec 32))) )
))
(declare-fun lt!82536 () SeekEntryResult!411)

(get-info :version)

(assert (=> b!163418 (= res!77305 (and (not ((_ is Undefined!411) lt!82536)) (not ((_ is MissingVacant!411) lt!82536)) (not ((_ is MissingZero!411) lt!82536)) ((_ is Found!411) lt!82536)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6271 (_ BitVec 32)) SeekEntryResult!411)

(assert (=> b!163418 (= lt!82536 (seekEntryOrOpen!0 key!828 (_keys!5167 thiss!1248) (mask!8016 thiss!1248)))))

(declare-fun b!163419 () Bool)

(declare-fun res!77304 () Bool)

(assert (=> b!163419 (=> (not res!77304) (not e!107216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163419 (= res!77304 (validMask!0 (mask!8016 thiss!1248)))))

(declare-fun b!163420 () Bool)

(declare-fun tp_is_empty!3601 () Bool)

(assert (=> b!163420 (= e!107213 tp_is_empty!3601)))

(declare-fun b!163421 () Bool)

(declare-fun e!107215 () Bool)

(declare-fun e!107214 () Bool)

(assert (=> b!163421 (= e!107215 (and e!107214 mapRes!6107))))

(declare-fun condMapEmpty!6107 () Bool)

(declare-fun mapDefault!6107 () ValueCell!1457)

(assert (=> b!163421 (= condMapEmpty!6107 (= (arr!2975 (_values!3336 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1457)) mapDefault!6107)))))

(declare-fun b!163422 () Bool)

(declare-fun res!77306 () Bool)

(assert (=> b!163422 (=> (not res!77306) (not e!107218))))

(assert (=> b!163422 (= res!77306 (not (= key!828 (bvneg key!828))))))

(declare-fun e!107212 () Bool)

(declare-fun array_inv!1915 (array!6271) Bool)

(declare-fun array_inv!1916 (array!6273) Bool)

(assert (=> b!163423 (= e!107212 (and tp!13985 tp_is_empty!3601 (array_inv!1915 (_keys!5167 thiss!1248)) (array_inv!1916 (_values!3336 thiss!1248)) e!107215))))

(declare-fun b!163424 () Bool)

(assert (=> b!163424 (= e!107214 tp_is_empty!3601)))

(declare-fun res!77307 () Bool)

(assert (=> start!16434 (=> (not res!77307) (not e!107218))))

(declare-fun valid!822 (LongMapFixedSize!1822) Bool)

(assert (=> start!16434 (= res!77307 (valid!822 thiss!1248))))

(assert (=> start!16434 e!107218))

(assert (=> start!16434 e!107212))

(assert (=> start!16434 true))

(assert (= (and start!16434 res!77307) b!163422))

(assert (= (and b!163422 res!77306) b!163418))

(assert (= (and b!163418 res!77305) b!163419))

(assert (= (and b!163419 res!77304) b!163417))

(assert (= (and b!163421 condMapEmpty!6107) mapIsEmpty!6107))

(assert (= (and b!163421 (not condMapEmpty!6107)) mapNonEmpty!6107))

(assert (= (and mapNonEmpty!6107 ((_ is ValueCellFull!1457) mapValue!6107)) b!163420))

(assert (= (and b!163421 ((_ is ValueCellFull!1457) mapDefault!6107)) b!163424))

(assert (= b!163423 b!163421))

(assert (= start!16434 b!163423))

(declare-fun m!193549 () Bool)

(assert (=> b!163418 m!193549))

(declare-fun m!193551 () Bool)

(assert (=> mapNonEmpty!6107 m!193551))

(declare-fun m!193553 () Bool)

(assert (=> b!163423 m!193553))

(declare-fun m!193555 () Bool)

(assert (=> b!163423 m!193555))

(declare-fun m!193557 () Bool)

(assert (=> start!16434 m!193557))

(declare-fun m!193559 () Bool)

(assert (=> b!163419 m!193559))

(check-sat (not start!16434) (not b_next!3799) (not b!163418) b_and!10187 (not mapNonEmpty!6107) (not b!163419) (not b!163423) tp_is_empty!3601)
(check-sat b_and!10187 (not b_next!3799))
(get-model)

(declare-fun d!51311 () Bool)

(assert (=> d!51311 (= (array_inv!1915 (_keys!5167 thiss!1248)) (bvsge (size!3262 (_keys!5167 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163423 d!51311))

(declare-fun d!51313 () Bool)

(assert (=> d!51313 (= (array_inv!1916 (_values!3336 thiss!1248)) (bvsge (size!3263 (_values!3336 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163423 d!51313))

(declare-fun b!163485 () Bool)

(declare-fun e!107268 () SeekEntryResult!411)

(assert (=> b!163485 (= e!107268 Undefined!411)))

(declare-fun d!51315 () Bool)

(declare-fun lt!82551 () SeekEntryResult!411)

(assert (=> d!51315 (and (or ((_ is Undefined!411) lt!82551) (not ((_ is Found!411) lt!82551)) (and (bvsge (index!3813 lt!82551) #b00000000000000000000000000000000) (bvslt (index!3813 lt!82551) (size!3262 (_keys!5167 thiss!1248))))) (or ((_ is Undefined!411) lt!82551) ((_ is Found!411) lt!82551) (not ((_ is MissingZero!411) lt!82551)) (and (bvsge (index!3812 lt!82551) #b00000000000000000000000000000000) (bvslt (index!3812 lt!82551) (size!3262 (_keys!5167 thiss!1248))))) (or ((_ is Undefined!411) lt!82551) ((_ is Found!411) lt!82551) ((_ is MissingZero!411) lt!82551) (not ((_ is MissingVacant!411) lt!82551)) (and (bvsge (index!3815 lt!82551) #b00000000000000000000000000000000) (bvslt (index!3815 lt!82551) (size!3262 (_keys!5167 thiss!1248))))) (or ((_ is Undefined!411) lt!82551) (ite ((_ is Found!411) lt!82551) (= (select (arr!2974 (_keys!5167 thiss!1248)) (index!3813 lt!82551)) key!828) (ite ((_ is MissingZero!411) lt!82551) (= (select (arr!2974 (_keys!5167 thiss!1248)) (index!3812 lt!82551)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!411) lt!82551) (= (select (arr!2974 (_keys!5167 thiss!1248)) (index!3815 lt!82551)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51315 (= lt!82551 e!107268)))

(declare-fun c!30093 () Bool)

(declare-fun lt!82549 () SeekEntryResult!411)

(assert (=> d!51315 (= c!30093 (and ((_ is Intermediate!411) lt!82549) (undefined!1223 lt!82549)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6271 (_ BitVec 32)) SeekEntryResult!411)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51315 (= lt!82549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8016 thiss!1248)) key!828 (_keys!5167 thiss!1248) (mask!8016 thiss!1248)))))

(assert (=> d!51315 (validMask!0 (mask!8016 thiss!1248))))

(assert (=> d!51315 (= (seekEntryOrOpen!0 key!828 (_keys!5167 thiss!1248) (mask!8016 thiss!1248)) lt!82551)))

(declare-fun b!163486 () Bool)

(declare-fun c!30095 () Bool)

(declare-fun lt!82550 () (_ BitVec 64))

(assert (=> b!163486 (= c!30095 (= lt!82550 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107267 () SeekEntryResult!411)

(declare-fun e!107269 () SeekEntryResult!411)

(assert (=> b!163486 (= e!107267 e!107269)))

(declare-fun b!163487 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6271 (_ BitVec 32)) SeekEntryResult!411)

(assert (=> b!163487 (= e!107269 (seekKeyOrZeroReturnVacant!0 (x!18141 lt!82549) (index!3814 lt!82549) (index!3814 lt!82549) key!828 (_keys!5167 thiss!1248) (mask!8016 thiss!1248)))))

(declare-fun b!163488 () Bool)

(assert (=> b!163488 (= e!107267 (Found!411 (index!3814 lt!82549)))))

(declare-fun b!163489 () Bool)

(assert (=> b!163489 (= e!107269 (MissingZero!411 (index!3814 lt!82549)))))

(declare-fun b!163490 () Bool)

(assert (=> b!163490 (= e!107268 e!107267)))

(assert (=> b!163490 (= lt!82550 (select (arr!2974 (_keys!5167 thiss!1248)) (index!3814 lt!82549)))))

(declare-fun c!30094 () Bool)

(assert (=> b!163490 (= c!30094 (= lt!82550 key!828))))

(assert (= (and d!51315 c!30093) b!163485))

(assert (= (and d!51315 (not c!30093)) b!163490))

(assert (= (and b!163490 c!30094) b!163488))

(assert (= (and b!163490 (not c!30094)) b!163486))

(assert (= (and b!163486 c!30095) b!163489))

(assert (= (and b!163486 (not c!30095)) b!163487))

(declare-fun m!193585 () Bool)

(assert (=> d!51315 m!193585))

(declare-fun m!193587 () Bool)

(assert (=> d!51315 m!193587))

(assert (=> d!51315 m!193585))

(declare-fun m!193589 () Bool)

(assert (=> d!51315 m!193589))

(declare-fun m!193591 () Bool)

(assert (=> d!51315 m!193591))

(declare-fun m!193593 () Bool)

(assert (=> d!51315 m!193593))

(assert (=> d!51315 m!193559))

(declare-fun m!193595 () Bool)

(assert (=> b!163487 m!193595))

(declare-fun m!193597 () Bool)

(assert (=> b!163490 m!193597))

(assert (=> b!163418 d!51315))

(declare-fun d!51317 () Bool)

(declare-fun res!77338 () Bool)

(declare-fun e!107272 () Bool)

(assert (=> d!51317 (=> (not res!77338) (not e!107272))))

(declare-fun simpleValid!123 (LongMapFixedSize!1822) Bool)

(assert (=> d!51317 (= res!77338 (simpleValid!123 thiss!1248))))

(assert (=> d!51317 (= (valid!822 thiss!1248) e!107272)))

(declare-fun b!163497 () Bool)

(declare-fun res!77339 () Bool)

(assert (=> b!163497 (=> (not res!77339) (not e!107272))))

(declare-fun arrayCountValidKeys!0 (array!6271 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163497 (= res!77339 (= (arrayCountValidKeys!0 (_keys!5167 thiss!1248) #b00000000000000000000000000000000 (size!3262 (_keys!5167 thiss!1248))) (_size!960 thiss!1248)))))

(declare-fun b!163498 () Bool)

(declare-fun res!77340 () Bool)

(assert (=> b!163498 (=> (not res!77340) (not e!107272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6271 (_ BitVec 32)) Bool)

(assert (=> b!163498 (= res!77340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5167 thiss!1248) (mask!8016 thiss!1248)))))

(declare-fun b!163499 () Bool)

(declare-datatypes ((List!1998 0))(
  ( (Nil!1995) (Cons!1994 (h!2610 (_ BitVec 64)) (t!6791 List!1998)) )
))
(declare-fun arrayNoDuplicates!0 (array!6271 (_ BitVec 32) List!1998) Bool)

(assert (=> b!163499 (= e!107272 (arrayNoDuplicates!0 (_keys!5167 thiss!1248) #b00000000000000000000000000000000 Nil!1995))))

(assert (= (and d!51317 res!77338) b!163497))

(assert (= (and b!163497 res!77339) b!163498))

(assert (= (and b!163498 res!77340) b!163499))

(declare-fun m!193599 () Bool)

(assert (=> d!51317 m!193599))

(declare-fun m!193601 () Bool)

(assert (=> b!163497 m!193601))

(declare-fun m!193603 () Bool)

(assert (=> b!163498 m!193603))

(declare-fun m!193605 () Bool)

(assert (=> b!163499 m!193605))

(assert (=> start!16434 d!51317))

(declare-fun d!51319 () Bool)

(assert (=> d!51319 (= (validMask!0 (mask!8016 thiss!1248)) (and (or (= (mask!8016 thiss!1248) #b00000000000000000000000000000111) (= (mask!8016 thiss!1248) #b00000000000000000000000000001111) (= (mask!8016 thiss!1248) #b00000000000000000000000000011111) (= (mask!8016 thiss!1248) #b00000000000000000000000000111111) (= (mask!8016 thiss!1248) #b00000000000000000000000001111111) (= (mask!8016 thiss!1248) #b00000000000000000000000011111111) (= (mask!8016 thiss!1248) #b00000000000000000000000111111111) (= (mask!8016 thiss!1248) #b00000000000000000000001111111111) (= (mask!8016 thiss!1248) #b00000000000000000000011111111111) (= (mask!8016 thiss!1248) #b00000000000000000000111111111111) (= (mask!8016 thiss!1248) #b00000000000000000001111111111111) (= (mask!8016 thiss!1248) #b00000000000000000011111111111111) (= (mask!8016 thiss!1248) #b00000000000000000111111111111111) (= (mask!8016 thiss!1248) #b00000000000000001111111111111111) (= (mask!8016 thiss!1248) #b00000000000000011111111111111111) (= (mask!8016 thiss!1248) #b00000000000000111111111111111111) (= (mask!8016 thiss!1248) #b00000000000001111111111111111111) (= (mask!8016 thiss!1248) #b00000000000011111111111111111111) (= (mask!8016 thiss!1248) #b00000000000111111111111111111111) (= (mask!8016 thiss!1248) #b00000000001111111111111111111111) (= (mask!8016 thiss!1248) #b00000000011111111111111111111111) (= (mask!8016 thiss!1248) #b00000000111111111111111111111111) (= (mask!8016 thiss!1248) #b00000001111111111111111111111111) (= (mask!8016 thiss!1248) #b00000011111111111111111111111111) (= (mask!8016 thiss!1248) #b00000111111111111111111111111111) (= (mask!8016 thiss!1248) #b00001111111111111111111111111111) (= (mask!8016 thiss!1248) #b00011111111111111111111111111111) (= (mask!8016 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8016 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163419 d!51319))

(declare-fun condMapEmpty!6116 () Bool)

(declare-fun mapDefault!6116 () ValueCell!1457)

(assert (=> mapNonEmpty!6107 (= condMapEmpty!6116 (= mapRest!6107 ((as const (Array (_ BitVec 32) ValueCell!1457)) mapDefault!6116)))))

(declare-fun e!107277 () Bool)

(declare-fun mapRes!6116 () Bool)

(assert (=> mapNonEmpty!6107 (= tp!13984 (and e!107277 mapRes!6116))))

(declare-fun b!163506 () Bool)

(declare-fun e!107278 () Bool)

(assert (=> b!163506 (= e!107278 tp_is_empty!3601)))

(declare-fun mapIsEmpty!6116 () Bool)

(assert (=> mapIsEmpty!6116 mapRes!6116))

(declare-fun mapNonEmpty!6116 () Bool)

(declare-fun tp!14000 () Bool)

(assert (=> mapNonEmpty!6116 (= mapRes!6116 (and tp!14000 e!107278))))

(declare-fun mapRest!6116 () (Array (_ BitVec 32) ValueCell!1457))

(declare-fun mapKey!6116 () (_ BitVec 32))

(declare-fun mapValue!6116 () ValueCell!1457)

(assert (=> mapNonEmpty!6116 (= mapRest!6107 (store mapRest!6116 mapKey!6116 mapValue!6116))))

(declare-fun b!163507 () Bool)

(assert (=> b!163507 (= e!107277 tp_is_empty!3601)))

(assert (= (and mapNonEmpty!6107 condMapEmpty!6116) mapIsEmpty!6116))

(assert (= (and mapNonEmpty!6107 (not condMapEmpty!6116)) mapNonEmpty!6116))

(assert (= (and mapNonEmpty!6116 ((_ is ValueCellFull!1457) mapValue!6116)) b!163506))

(assert (= (and mapNonEmpty!6107 ((_ is ValueCellFull!1457) mapDefault!6116)) b!163507))

(declare-fun m!193607 () Bool)

(assert (=> mapNonEmpty!6116 m!193607))

(check-sat (not b!163487) (not d!51315) (not b!163499) (not b_next!3799) (not d!51317) (not b!163498) tp_is_empty!3601 (not mapNonEmpty!6116) b_and!10187 (not b!163497))
(check-sat b_and!10187 (not b_next!3799))
(get-model)

(declare-fun b!163526 () Bool)

(declare-fun lt!82556 () SeekEntryResult!411)

(assert (=> b!163526 (and (bvsge (index!3814 lt!82556) #b00000000000000000000000000000000) (bvslt (index!3814 lt!82556) (size!3262 (_keys!5167 thiss!1248))))))

(declare-fun res!77348 () Bool)

(assert (=> b!163526 (= res!77348 (= (select (arr!2974 (_keys!5167 thiss!1248)) (index!3814 lt!82556)) key!828))))

(declare-fun e!107289 () Bool)

(assert (=> b!163526 (=> res!77348 e!107289)))

(declare-fun e!107291 () Bool)

(assert (=> b!163526 (= e!107291 e!107289)))

(declare-fun d!51321 () Bool)

(declare-fun e!107293 () Bool)

(assert (=> d!51321 e!107293))

(declare-fun c!30104 () Bool)

(assert (=> d!51321 (= c!30104 (and ((_ is Intermediate!411) lt!82556) (undefined!1223 lt!82556)))))

(declare-fun e!107292 () SeekEntryResult!411)

(assert (=> d!51321 (= lt!82556 e!107292)))

(declare-fun c!30102 () Bool)

(assert (=> d!51321 (= c!30102 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!82557 () (_ BitVec 64))

(assert (=> d!51321 (= lt!82557 (select (arr!2974 (_keys!5167 thiss!1248)) (toIndex!0 key!828 (mask!8016 thiss!1248))))))

(assert (=> d!51321 (validMask!0 (mask!8016 thiss!1248))))

(assert (=> d!51321 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8016 thiss!1248)) key!828 (_keys!5167 thiss!1248) (mask!8016 thiss!1248)) lt!82556)))

(declare-fun b!163527 () Bool)

(assert (=> b!163527 (and (bvsge (index!3814 lt!82556) #b00000000000000000000000000000000) (bvslt (index!3814 lt!82556) (size!3262 (_keys!5167 thiss!1248))))))

(assert (=> b!163527 (= e!107289 (= (select (arr!2974 (_keys!5167 thiss!1248)) (index!3814 lt!82556)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!163528 () Bool)

(declare-fun e!107290 () SeekEntryResult!411)

(assert (=> b!163528 (= e!107290 (Intermediate!411 false (toIndex!0 key!828 (mask!8016 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163529 () Bool)

(assert (=> b!163529 (= e!107292 e!107290)))

(declare-fun c!30103 () Bool)

(assert (=> b!163529 (= c!30103 (or (= lt!82557 key!828) (= (bvadd lt!82557 lt!82557) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!163530 () Bool)

(assert (=> b!163530 (= e!107293 (bvsge (x!18141 lt!82556) #b01111111111111111111111111111110))))

(declare-fun b!163531 () Bool)

(assert (=> b!163531 (= e!107292 (Intermediate!411 true (toIndex!0 key!828 (mask!8016 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163532 () Bool)

(assert (=> b!163532 (and (bvsge (index!3814 lt!82556) #b00000000000000000000000000000000) (bvslt (index!3814 lt!82556) (size!3262 (_keys!5167 thiss!1248))))))

(declare-fun res!77349 () Bool)

(assert (=> b!163532 (= res!77349 (= (select (arr!2974 (_keys!5167 thiss!1248)) (index!3814 lt!82556)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163532 (=> res!77349 e!107289)))

(declare-fun b!163533 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163533 (= e!107290 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8016 thiss!1248)) #b00000000000000000000000000000000 (mask!8016 thiss!1248)) key!828 (_keys!5167 thiss!1248) (mask!8016 thiss!1248)))))

(declare-fun b!163534 () Bool)

(assert (=> b!163534 (= e!107293 e!107291)))

(declare-fun res!77347 () Bool)

(assert (=> b!163534 (= res!77347 (and ((_ is Intermediate!411) lt!82556) (not (undefined!1223 lt!82556)) (bvslt (x!18141 lt!82556) #b01111111111111111111111111111110) (bvsge (x!18141 lt!82556) #b00000000000000000000000000000000) (bvsge (x!18141 lt!82556) #b00000000000000000000000000000000)))))

(assert (=> b!163534 (=> (not res!77347) (not e!107291))))

(assert (= (and d!51321 c!30102) b!163531))

(assert (= (and d!51321 (not c!30102)) b!163529))

(assert (= (and b!163529 c!30103) b!163528))

(assert (= (and b!163529 (not c!30103)) b!163533))

(assert (= (and d!51321 c!30104) b!163530))

(assert (= (and d!51321 (not c!30104)) b!163534))

(assert (= (and b!163534 res!77347) b!163526))

(assert (= (and b!163526 (not res!77348)) b!163532))

(assert (= (and b!163532 (not res!77349)) b!163527))

(declare-fun m!193609 () Bool)

(assert (=> b!163527 m!193609))

(assert (=> b!163533 m!193585))

(declare-fun m!193611 () Bool)

(assert (=> b!163533 m!193611))

(assert (=> b!163533 m!193611))

(declare-fun m!193613 () Bool)

(assert (=> b!163533 m!193613))

(assert (=> d!51321 m!193585))

(declare-fun m!193615 () Bool)

(assert (=> d!51321 m!193615))

(assert (=> d!51321 m!193559))

(assert (=> b!163526 m!193609))

(assert (=> b!163532 m!193609))

(assert (=> d!51315 d!51321))

(declare-fun d!51323 () Bool)

(declare-fun lt!82563 () (_ BitVec 32))

(declare-fun lt!82562 () (_ BitVec 32))

(assert (=> d!51323 (= lt!82563 (bvmul (bvxor lt!82562 (bvlshr lt!82562 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51323 (= lt!82562 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51323 (and (bvsge (mask!8016 thiss!1248) #b00000000000000000000000000000000) (let ((res!77350 (let ((h!2611 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18158 (bvmul (bvxor h!2611 (bvlshr h!2611 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18158 (bvlshr x!18158 #b00000000000000000000000000001101)) (mask!8016 thiss!1248)))))) (and (bvslt res!77350 (bvadd (mask!8016 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77350 #b00000000000000000000000000000000))))))

(assert (=> d!51323 (= (toIndex!0 key!828 (mask!8016 thiss!1248)) (bvand (bvxor lt!82563 (bvlshr lt!82563 #b00000000000000000000000000001101)) (mask!8016 thiss!1248)))))

(assert (=> d!51315 d!51323))

(assert (=> d!51315 d!51319))

(declare-fun b!163543 () Bool)

(declare-fun e!107298 () (_ BitVec 32))

(assert (=> b!163543 (= e!107298 #b00000000000000000000000000000000)))

(declare-fun b!163544 () Bool)

(declare-fun e!107299 () (_ BitVec 32))

(declare-fun call!17290 () (_ BitVec 32))

(assert (=> b!163544 (= e!107299 (bvadd #b00000000000000000000000000000001 call!17290))))

(declare-fun b!163545 () Bool)

(assert (=> b!163545 (= e!107299 call!17290)))

(declare-fun bm!17287 () Bool)

(assert (=> bm!17287 (= call!17290 (arrayCountValidKeys!0 (_keys!5167 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3262 (_keys!5167 thiss!1248))))))

(declare-fun d!51325 () Bool)

(declare-fun lt!82566 () (_ BitVec 32))

(assert (=> d!51325 (and (bvsge lt!82566 #b00000000000000000000000000000000) (bvsle lt!82566 (bvsub (size!3262 (_keys!5167 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51325 (= lt!82566 e!107298)))

(declare-fun c!30110 () Bool)

(assert (=> d!51325 (= c!30110 (bvsge #b00000000000000000000000000000000 (size!3262 (_keys!5167 thiss!1248))))))

(assert (=> d!51325 (and (bvsle #b00000000000000000000000000000000 (size!3262 (_keys!5167 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3262 (_keys!5167 thiss!1248)) (size!3262 (_keys!5167 thiss!1248))))))

(assert (=> d!51325 (= (arrayCountValidKeys!0 (_keys!5167 thiss!1248) #b00000000000000000000000000000000 (size!3262 (_keys!5167 thiss!1248))) lt!82566)))

(declare-fun b!163546 () Bool)

(assert (=> b!163546 (= e!107298 e!107299)))

(declare-fun c!30109 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163546 (= c!30109 (validKeyInArray!0 (select (arr!2974 (_keys!5167 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51325 c!30110) b!163543))

(assert (= (and d!51325 (not c!30110)) b!163546))

(assert (= (and b!163546 c!30109) b!163544))

(assert (= (and b!163546 (not c!30109)) b!163545))

(assert (= (or b!163544 b!163545) bm!17287))

(declare-fun m!193617 () Bool)

(assert (=> bm!17287 m!193617))

(declare-fun m!193619 () Bool)

(assert (=> b!163546 m!193619))

(assert (=> b!163546 m!193619))

(declare-fun m!193621 () Bool)

(assert (=> b!163546 m!193621))

(assert (=> b!163497 d!51325))

(declare-fun b!163556 () Bool)

(declare-fun res!77362 () Bool)

(declare-fun e!107302 () Bool)

(assert (=> b!163556 (=> (not res!77362) (not e!107302))))

(declare-fun size!3268 (LongMapFixedSize!1822) (_ BitVec 32))

(assert (=> b!163556 (= res!77362 (bvsge (size!3268 thiss!1248) (_size!960 thiss!1248)))))

(declare-fun b!163557 () Bool)

(declare-fun res!77360 () Bool)

(assert (=> b!163557 (=> (not res!77360) (not e!107302))))

(assert (=> b!163557 (= res!77360 (= (size!3268 thiss!1248) (bvadd (_size!960 thiss!1248) (bvsdiv (bvadd (extraKeys!3094 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!51327 () Bool)

(declare-fun res!77359 () Bool)

(assert (=> d!51327 (=> (not res!77359) (not e!107302))))

(assert (=> d!51327 (= res!77359 (validMask!0 (mask!8016 thiss!1248)))))

(assert (=> d!51327 (= (simpleValid!123 thiss!1248) e!107302)))

(declare-fun b!163555 () Bool)

(declare-fun res!77361 () Bool)

(assert (=> b!163555 (=> (not res!77361) (not e!107302))))

(assert (=> b!163555 (= res!77361 (and (= (size!3263 (_values!3336 thiss!1248)) (bvadd (mask!8016 thiss!1248) #b00000000000000000000000000000001)) (= (size!3262 (_keys!5167 thiss!1248)) (size!3263 (_values!3336 thiss!1248))) (bvsge (_size!960 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!960 thiss!1248) (bvadd (mask!8016 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!163558 () Bool)

(assert (=> b!163558 (= e!107302 (and (bvsge (extraKeys!3094 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3094 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!960 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!51327 res!77359) b!163555))

(assert (= (and b!163555 res!77361) b!163556))

(assert (= (and b!163556 res!77362) b!163557))

(assert (= (and b!163557 res!77360) b!163558))

(declare-fun m!193623 () Bool)

(assert (=> b!163556 m!193623))

(assert (=> b!163557 m!193623))

(assert (=> d!51327 m!193559))

(assert (=> d!51317 d!51327))

(declare-fun d!51329 () Bool)

(declare-fun res!77367 () Bool)

(declare-fun e!107309 () Bool)

(assert (=> d!51329 (=> res!77367 e!107309)))

(assert (=> d!51329 (= res!77367 (bvsge #b00000000000000000000000000000000 (size!3262 (_keys!5167 thiss!1248))))))

(assert (=> d!51329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5167 thiss!1248) (mask!8016 thiss!1248)) e!107309)))

(declare-fun b!163567 () Bool)

(declare-fun e!107310 () Bool)

(declare-fun e!107311 () Bool)

(assert (=> b!163567 (= e!107310 e!107311)))

(declare-fun lt!82575 () (_ BitVec 64))

(assert (=> b!163567 (= lt!82575 (select (arr!2974 (_keys!5167 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5011 0))(
  ( (Unit!5012) )
))
(declare-fun lt!82574 () Unit!5011)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6271 (_ BitVec 64) (_ BitVec 32)) Unit!5011)

(assert (=> b!163567 (= lt!82574 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5167 thiss!1248) lt!82575 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163567 (arrayContainsKey!0 (_keys!5167 thiss!1248) lt!82575 #b00000000000000000000000000000000)))

(declare-fun lt!82573 () Unit!5011)

(assert (=> b!163567 (= lt!82573 lt!82574)))

(declare-fun res!77368 () Bool)

(assert (=> b!163567 (= res!77368 (= (seekEntryOrOpen!0 (select (arr!2974 (_keys!5167 thiss!1248)) #b00000000000000000000000000000000) (_keys!5167 thiss!1248) (mask!8016 thiss!1248)) (Found!411 #b00000000000000000000000000000000)))))

(assert (=> b!163567 (=> (not res!77368) (not e!107311))))

(declare-fun b!163568 () Bool)

(declare-fun call!17293 () Bool)

(assert (=> b!163568 (= e!107310 call!17293)))

(declare-fun b!163569 () Bool)

(assert (=> b!163569 (= e!107309 e!107310)))

(declare-fun c!30113 () Bool)

(assert (=> b!163569 (= c!30113 (validKeyInArray!0 (select (arr!2974 (_keys!5167 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163570 () Bool)

(assert (=> b!163570 (= e!107311 call!17293)))

(declare-fun bm!17290 () Bool)

(assert (=> bm!17290 (= call!17293 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5167 thiss!1248) (mask!8016 thiss!1248)))))

(assert (= (and d!51329 (not res!77367)) b!163569))

(assert (= (and b!163569 c!30113) b!163567))

(assert (= (and b!163569 (not c!30113)) b!163568))

(assert (= (and b!163567 res!77368) b!163570))

(assert (= (or b!163570 b!163568) bm!17290))

(assert (=> b!163567 m!193619))

(declare-fun m!193625 () Bool)

(assert (=> b!163567 m!193625))

(declare-fun m!193627 () Bool)

(assert (=> b!163567 m!193627))

(assert (=> b!163567 m!193619))

(declare-fun m!193629 () Bool)

(assert (=> b!163567 m!193629))

(assert (=> b!163569 m!193619))

(assert (=> b!163569 m!193619))

(assert (=> b!163569 m!193621))

(declare-fun m!193631 () Bool)

(assert (=> bm!17290 m!193631))

(assert (=> b!163498 d!51329))

(declare-fun b!163583 () Bool)

(declare-fun c!30122 () Bool)

(declare-fun lt!82581 () (_ BitVec 64))

(assert (=> b!163583 (= c!30122 (= lt!82581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107320 () SeekEntryResult!411)

(declare-fun e!107319 () SeekEntryResult!411)

(assert (=> b!163583 (= e!107320 e!107319)))

(declare-fun d!51331 () Bool)

(declare-fun lt!82580 () SeekEntryResult!411)

(assert (=> d!51331 (and (or ((_ is Undefined!411) lt!82580) (not ((_ is Found!411) lt!82580)) (and (bvsge (index!3813 lt!82580) #b00000000000000000000000000000000) (bvslt (index!3813 lt!82580) (size!3262 (_keys!5167 thiss!1248))))) (or ((_ is Undefined!411) lt!82580) ((_ is Found!411) lt!82580) (not ((_ is MissingVacant!411) lt!82580)) (not (= (index!3815 lt!82580) (index!3814 lt!82549))) (and (bvsge (index!3815 lt!82580) #b00000000000000000000000000000000) (bvslt (index!3815 lt!82580) (size!3262 (_keys!5167 thiss!1248))))) (or ((_ is Undefined!411) lt!82580) (ite ((_ is Found!411) lt!82580) (= (select (arr!2974 (_keys!5167 thiss!1248)) (index!3813 lt!82580)) key!828) (and ((_ is MissingVacant!411) lt!82580) (= (index!3815 lt!82580) (index!3814 lt!82549)) (= (select (arr!2974 (_keys!5167 thiss!1248)) (index!3815 lt!82580)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!107318 () SeekEntryResult!411)

(assert (=> d!51331 (= lt!82580 e!107318)))

(declare-fun c!30120 () Bool)

(assert (=> d!51331 (= c!30120 (bvsge (x!18141 lt!82549) #b01111111111111111111111111111110))))

(assert (=> d!51331 (= lt!82581 (select (arr!2974 (_keys!5167 thiss!1248)) (index!3814 lt!82549)))))

(assert (=> d!51331 (validMask!0 (mask!8016 thiss!1248))))

(assert (=> d!51331 (= (seekKeyOrZeroReturnVacant!0 (x!18141 lt!82549) (index!3814 lt!82549) (index!3814 lt!82549) key!828 (_keys!5167 thiss!1248) (mask!8016 thiss!1248)) lt!82580)))

(declare-fun b!163584 () Bool)

(assert (=> b!163584 (= e!107320 (Found!411 (index!3814 lt!82549)))))

(declare-fun b!163585 () Bool)

(assert (=> b!163585 (= e!107318 e!107320)))

(declare-fun c!30121 () Bool)

(assert (=> b!163585 (= c!30121 (= lt!82581 key!828))))

(declare-fun b!163586 () Bool)

(assert (=> b!163586 (= e!107318 Undefined!411)))

(declare-fun b!163587 () Bool)

(assert (=> b!163587 (= e!107319 (MissingVacant!411 (index!3814 lt!82549)))))

(declare-fun b!163588 () Bool)

(assert (=> b!163588 (= e!107319 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18141 lt!82549) #b00000000000000000000000000000001) (nextIndex!0 (index!3814 lt!82549) (x!18141 lt!82549) (mask!8016 thiss!1248)) (index!3814 lt!82549) key!828 (_keys!5167 thiss!1248) (mask!8016 thiss!1248)))))

(assert (= (and d!51331 c!30120) b!163586))

(assert (= (and d!51331 (not c!30120)) b!163585))

(assert (= (and b!163585 c!30121) b!163584))

(assert (= (and b!163585 (not c!30121)) b!163583))

(assert (= (and b!163583 c!30122) b!163587))

(assert (= (and b!163583 (not c!30122)) b!163588))

(declare-fun m!193633 () Bool)

(assert (=> d!51331 m!193633))

(declare-fun m!193635 () Bool)

(assert (=> d!51331 m!193635))

(assert (=> d!51331 m!193597))

(assert (=> d!51331 m!193559))

(declare-fun m!193637 () Bool)

(assert (=> b!163588 m!193637))

(assert (=> b!163588 m!193637))

(declare-fun m!193639 () Bool)

(assert (=> b!163588 m!193639))

(assert (=> b!163487 d!51331))

(declare-fun b!163599 () Bool)

(declare-fun e!107330 () Bool)

(declare-fun e!107331 () Bool)

(assert (=> b!163599 (= e!107330 e!107331)))

(declare-fun res!77375 () Bool)

(assert (=> b!163599 (=> (not res!77375) (not e!107331))))

(declare-fun e!107332 () Bool)

(assert (=> b!163599 (= res!77375 (not e!107332))))

(declare-fun res!77377 () Bool)

(assert (=> b!163599 (=> (not res!77377) (not e!107332))))

(assert (=> b!163599 (= res!77377 (validKeyInArray!0 (select (arr!2974 (_keys!5167 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163600 () Bool)

(declare-fun contains!1031 (List!1998 (_ BitVec 64)) Bool)

(assert (=> b!163600 (= e!107332 (contains!1031 Nil!1995 (select (arr!2974 (_keys!5167 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163601 () Bool)

(declare-fun e!107329 () Bool)

(declare-fun call!17296 () Bool)

(assert (=> b!163601 (= e!107329 call!17296)))

(declare-fun bm!17293 () Bool)

(declare-fun c!30125 () Bool)

(assert (=> bm!17293 (= call!17296 (arrayNoDuplicates!0 (_keys!5167 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30125 (Cons!1994 (select (arr!2974 (_keys!5167 thiss!1248)) #b00000000000000000000000000000000) Nil!1995) Nil!1995)))))

(declare-fun d!51333 () Bool)

(declare-fun res!77376 () Bool)

(assert (=> d!51333 (=> res!77376 e!107330)))

(assert (=> d!51333 (= res!77376 (bvsge #b00000000000000000000000000000000 (size!3262 (_keys!5167 thiss!1248))))))

(assert (=> d!51333 (= (arrayNoDuplicates!0 (_keys!5167 thiss!1248) #b00000000000000000000000000000000 Nil!1995) e!107330)))

(declare-fun b!163602 () Bool)

(assert (=> b!163602 (= e!107331 e!107329)))

(assert (=> b!163602 (= c!30125 (validKeyInArray!0 (select (arr!2974 (_keys!5167 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163603 () Bool)

(assert (=> b!163603 (= e!107329 call!17296)))

(assert (= (and d!51333 (not res!77376)) b!163599))

(assert (= (and b!163599 res!77377) b!163600))

(assert (= (and b!163599 res!77375) b!163602))

(assert (= (and b!163602 c!30125) b!163601))

(assert (= (and b!163602 (not c!30125)) b!163603))

(assert (= (or b!163601 b!163603) bm!17293))

(assert (=> b!163599 m!193619))

(assert (=> b!163599 m!193619))

(assert (=> b!163599 m!193621))

(assert (=> b!163600 m!193619))

(assert (=> b!163600 m!193619))

(declare-fun m!193641 () Bool)

(assert (=> b!163600 m!193641))

(assert (=> bm!17293 m!193619))

(declare-fun m!193643 () Bool)

(assert (=> bm!17293 m!193643))

(assert (=> b!163602 m!193619))

(assert (=> b!163602 m!193619))

(assert (=> b!163602 m!193621))

(assert (=> b!163499 d!51333))

(declare-fun condMapEmpty!6117 () Bool)

(declare-fun mapDefault!6117 () ValueCell!1457)

(assert (=> mapNonEmpty!6116 (= condMapEmpty!6117 (= mapRest!6116 ((as const (Array (_ BitVec 32) ValueCell!1457)) mapDefault!6117)))))

(declare-fun e!107333 () Bool)

(declare-fun mapRes!6117 () Bool)

(assert (=> mapNonEmpty!6116 (= tp!14000 (and e!107333 mapRes!6117))))

(declare-fun b!163604 () Bool)

(declare-fun e!107334 () Bool)

(assert (=> b!163604 (= e!107334 tp_is_empty!3601)))

(declare-fun mapIsEmpty!6117 () Bool)

(assert (=> mapIsEmpty!6117 mapRes!6117))

(declare-fun mapNonEmpty!6117 () Bool)

(declare-fun tp!14001 () Bool)

(assert (=> mapNonEmpty!6117 (= mapRes!6117 (and tp!14001 e!107334))))

(declare-fun mapRest!6117 () (Array (_ BitVec 32) ValueCell!1457))

(declare-fun mapKey!6117 () (_ BitVec 32))

(declare-fun mapValue!6117 () ValueCell!1457)

(assert (=> mapNonEmpty!6117 (= mapRest!6116 (store mapRest!6117 mapKey!6117 mapValue!6117))))

(declare-fun b!163605 () Bool)

(assert (=> b!163605 (= e!107333 tp_is_empty!3601)))

(assert (= (and mapNonEmpty!6116 condMapEmpty!6117) mapIsEmpty!6117))

(assert (= (and mapNonEmpty!6116 (not condMapEmpty!6117)) mapNonEmpty!6117))

(assert (= (and mapNonEmpty!6117 ((_ is ValueCellFull!1457) mapValue!6117)) b!163604))

(assert (= (and mapNonEmpty!6116 ((_ is ValueCellFull!1457) mapDefault!6117)) b!163605))

(declare-fun m!193645 () Bool)

(assert (=> mapNonEmpty!6117 m!193645))

(check-sat (not d!51331) (not bm!17293) (not b!163567) (not b!163602) (not b_next!3799) (not b!163557) (not bm!17287) (not b!163546) (not mapNonEmpty!6117) (not b!163600) (not d!51327) tp_is_empty!3601 (not d!51321) (not bm!17290) (not b!163556) (not b!163588) (not b!163569) b_and!10187 (not b!163599) (not b!163533))
(check-sat b_and!10187 (not b_next!3799))
