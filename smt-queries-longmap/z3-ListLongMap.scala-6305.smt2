; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80714 () Bool)

(assert start!80714)

(declare-fun b!946557 () Bool)

(declare-fun b_free!18151 () Bool)

(declare-fun b_next!18151 () Bool)

(assert (=> b!946557 (= b_free!18151 (not b_next!18151))))

(declare-fun tp!63003 () Bool)

(declare-fun b_and!29547 () Bool)

(assert (=> b!946557 (= tp!63003 b_and!29547)))

(declare-fun b!946556 () Bool)

(declare-fun e!532640 () Bool)

(declare-fun e!532638 () Bool)

(declare-fun mapRes!32853 () Bool)

(assert (=> b!946556 (= e!532640 (and e!532638 mapRes!32853))))

(declare-fun condMapEmpty!32853 () Bool)

(declare-datatypes ((V!32511 0))(
  ( (V!32512 (val!10380 Int)) )
))
(declare-datatypes ((ValueCell!9848 0))(
  ( (ValueCellFull!9848 (v!12913 V!32511)) (EmptyCell!9848) )
))
(declare-datatypes ((array!57273 0))(
  ( (array!57274 (arr!27551 (Array (_ BitVec 32) ValueCell!9848)) (size!28025 (_ BitVec 32))) )
))
(declare-datatypes ((array!57275 0))(
  ( (array!57276 (arr!27552 (Array (_ BitVec 32) (_ BitVec 64))) (size!28026 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4846 0))(
  ( (LongMapFixedSize!4847 (defaultEntry!5720 Int) (mask!27430 (_ BitVec 32)) (extraKeys!5452 (_ BitVec 32)) (zeroValue!5556 V!32511) (minValue!5556 V!32511) (_size!2478 (_ BitVec 32)) (_keys!10616 array!57275) (_values!5743 array!57273) (_vacant!2478 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4846)

(declare-fun mapDefault!32853 () ValueCell!9848)

(assert (=> b!946556 (= condMapEmpty!32853 (= (arr!27551 (_values!5743 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9848)) mapDefault!32853)))))

(declare-fun mapNonEmpty!32853 () Bool)

(declare-fun tp!63002 () Bool)

(declare-fun e!532642 () Bool)

(assert (=> mapNonEmpty!32853 (= mapRes!32853 (and tp!63002 e!532642))))

(declare-fun mapKey!32853 () (_ BitVec 32))

(declare-fun mapRest!32853 () (Array (_ BitVec 32) ValueCell!9848))

(declare-fun mapValue!32853 () ValueCell!9848)

(assert (=> mapNonEmpty!32853 (= (arr!27551 (_values!5743 thiss!1141)) (store mapRest!32853 mapKey!32853 mapValue!32853))))

(declare-fun e!532639 () Bool)

(declare-fun tp_is_empty!20659 () Bool)

(declare-fun array_inv!21450 (array!57275) Bool)

(declare-fun array_inv!21451 (array!57273) Bool)

(assert (=> b!946557 (= e!532639 (and tp!63003 tp_is_empty!20659 (array_inv!21450 (_keys!10616 thiss!1141)) (array_inv!21451 (_values!5743 thiss!1141)) e!532640))))

(declare-fun b!946558 () Bool)

(assert (=> b!946558 (= e!532642 tp_is_empty!20659)))

(declare-fun mapIsEmpty!32853 () Bool)

(assert (=> mapIsEmpty!32853 mapRes!32853))

(declare-fun b!946559 () Bool)

(assert (=> b!946559 (= e!532638 tp_is_empty!20659)))

(declare-fun b!946560 () Bool)

(declare-fun res!635417 () Bool)

(declare-fun e!532644 () Bool)

(assert (=> b!946560 (=> (not res!635417) (not e!532644))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946560 (= res!635417 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946561 () Bool)

(declare-fun e!532637 () Bool)

(assert (=> b!946561 (= e!532644 e!532637)))

(declare-fun res!635415 () Bool)

(assert (=> b!946561 (=> (not res!635415) (not e!532637))))

(declare-datatypes ((SeekEntryResult!9105 0))(
  ( (MissingZero!9105 (index!38791 (_ BitVec 32))) (Found!9105 (index!38792 (_ BitVec 32))) (Intermediate!9105 (undefined!9917 Bool) (index!38793 (_ BitVec 32)) (x!81427 (_ BitVec 32))) (Undefined!9105) (MissingVacant!9105 (index!38794 (_ BitVec 32))) )
))
(declare-fun lt!426163 () SeekEntryResult!9105)

(get-info :version)

(assert (=> b!946561 (= res!635415 ((_ is Found!9105) lt!426163))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57275 (_ BitVec 32)) SeekEntryResult!9105)

(assert (=> b!946561 (= lt!426163 (seekEntry!0 key!756 (_keys!10616 thiss!1141) (mask!27430 thiss!1141)))))

(declare-fun b!946562 () Bool)

(declare-fun e!532641 () Bool)

(assert (=> b!946562 (= e!532637 (not e!532641))))

(declare-fun res!635416 () Bool)

(assert (=> b!946562 (=> res!635416 e!532641)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946562 (= res!635416 (not (validMask!0 (mask!27430 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946562 (arrayContainsKey!0 (_keys!10616 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31794 0))(
  ( (Unit!31795) )
))
(declare-fun lt!426162 () Unit!31794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57275 (_ BitVec 64) (_ BitVec 32)) Unit!31794)

(assert (=> b!946562 (= lt!426162 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10616 thiss!1141) key!756 (index!38792 lt!426163)))))

(declare-fun res!635414 () Bool)

(assert (=> start!80714 (=> (not res!635414) (not e!532644))))

(declare-fun valid!1851 (LongMapFixedSize!4846) Bool)

(assert (=> start!80714 (= res!635414 (valid!1851 thiss!1141))))

(assert (=> start!80714 e!532644))

(assert (=> start!80714 e!532639))

(assert (=> start!80714 true))

(declare-fun b!946563 () Bool)

(assert (=> b!946563 (= e!532641 (or (not (= (size!28025 (_values!5743 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27430 thiss!1141)))) (not (= (size!28026 (_keys!10616 thiss!1141)) (size!28025 (_values!5743 thiss!1141)))) (bvslt (mask!27430 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5452 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5452 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!80714 res!635414) b!946560))

(assert (= (and b!946560 res!635417) b!946561))

(assert (= (and b!946561 res!635415) b!946562))

(assert (= (and b!946562 (not res!635416)) b!946563))

(assert (= (and b!946556 condMapEmpty!32853) mapIsEmpty!32853))

(assert (= (and b!946556 (not condMapEmpty!32853)) mapNonEmpty!32853))

(assert (= (and mapNonEmpty!32853 ((_ is ValueCellFull!9848) mapValue!32853)) b!946558))

(assert (= (and b!946556 ((_ is ValueCellFull!9848) mapDefault!32853)) b!946559))

(assert (= b!946557 b!946556))

(assert (= start!80714 b!946557))

(declare-fun m!879255 () Bool)

(assert (=> b!946562 m!879255))

(declare-fun m!879257 () Bool)

(assert (=> b!946562 m!879257))

(declare-fun m!879259 () Bool)

(assert (=> b!946562 m!879259))

(declare-fun m!879261 () Bool)

(assert (=> b!946561 m!879261))

(declare-fun m!879263 () Bool)

(assert (=> start!80714 m!879263))

(declare-fun m!879265 () Bool)

(assert (=> mapNonEmpty!32853 m!879265))

(declare-fun m!879267 () Bool)

(assert (=> b!946557 m!879267))

(declare-fun m!879269 () Bool)

(assert (=> b!946557 m!879269))

(check-sat (not b_next!18151) (not start!80714) (not mapNonEmpty!32853) b_and!29547 tp_is_empty!20659 (not b!946557) (not b!946561) (not b!946562))
(check-sat b_and!29547 (not b_next!18151))
(get-model)

(declare-fun d!114399 () Bool)

(assert (=> d!114399 (= (validMask!0 (mask!27430 thiss!1141)) (and (or (= (mask!27430 thiss!1141) #b00000000000000000000000000000111) (= (mask!27430 thiss!1141) #b00000000000000000000000000001111) (= (mask!27430 thiss!1141) #b00000000000000000000000000011111) (= (mask!27430 thiss!1141) #b00000000000000000000000000111111) (= (mask!27430 thiss!1141) #b00000000000000000000000001111111) (= (mask!27430 thiss!1141) #b00000000000000000000000011111111) (= (mask!27430 thiss!1141) #b00000000000000000000000111111111) (= (mask!27430 thiss!1141) #b00000000000000000000001111111111) (= (mask!27430 thiss!1141) #b00000000000000000000011111111111) (= (mask!27430 thiss!1141) #b00000000000000000000111111111111) (= (mask!27430 thiss!1141) #b00000000000000000001111111111111) (= (mask!27430 thiss!1141) #b00000000000000000011111111111111) (= (mask!27430 thiss!1141) #b00000000000000000111111111111111) (= (mask!27430 thiss!1141) #b00000000000000001111111111111111) (= (mask!27430 thiss!1141) #b00000000000000011111111111111111) (= (mask!27430 thiss!1141) #b00000000000000111111111111111111) (= (mask!27430 thiss!1141) #b00000000000001111111111111111111) (= (mask!27430 thiss!1141) #b00000000000011111111111111111111) (= (mask!27430 thiss!1141) #b00000000000111111111111111111111) (= (mask!27430 thiss!1141) #b00000000001111111111111111111111) (= (mask!27430 thiss!1141) #b00000000011111111111111111111111) (= (mask!27430 thiss!1141) #b00000000111111111111111111111111) (= (mask!27430 thiss!1141) #b00000001111111111111111111111111) (= (mask!27430 thiss!1141) #b00000011111111111111111111111111) (= (mask!27430 thiss!1141) #b00000111111111111111111111111111) (= (mask!27430 thiss!1141) #b00001111111111111111111111111111) (= (mask!27430 thiss!1141) #b00011111111111111111111111111111) (= (mask!27430 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27430 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946562 d!114399))

(declare-fun d!114401 () Bool)

(declare-fun res!635446 () Bool)

(declare-fun e!532697 () Bool)

(assert (=> d!114401 (=> res!635446 e!532697)))

(assert (=> d!114401 (= res!635446 (= (select (arr!27552 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114401 (= (arrayContainsKey!0 (_keys!10616 thiss!1141) key!756 #b00000000000000000000000000000000) e!532697)))

(declare-fun b!946616 () Bool)

(declare-fun e!532698 () Bool)

(assert (=> b!946616 (= e!532697 e!532698)))

(declare-fun res!635447 () Bool)

(assert (=> b!946616 (=> (not res!635447) (not e!532698))))

(assert (=> b!946616 (= res!635447 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28026 (_keys!10616 thiss!1141))))))

(declare-fun b!946617 () Bool)

(assert (=> b!946617 (= e!532698 (arrayContainsKey!0 (_keys!10616 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114401 (not res!635446)) b!946616))

(assert (= (and b!946616 res!635447) b!946617))

(declare-fun m!879303 () Bool)

(assert (=> d!114401 m!879303))

(declare-fun m!879305 () Bool)

(assert (=> b!946617 m!879305))

(assert (=> b!946562 d!114401))

(declare-fun d!114403 () Bool)

(assert (=> d!114403 (arrayContainsKey!0 (_keys!10616 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426178 () Unit!31794)

(declare-fun choose!13 (array!57275 (_ BitVec 64) (_ BitVec 32)) Unit!31794)

(assert (=> d!114403 (= lt!426178 (choose!13 (_keys!10616 thiss!1141) key!756 (index!38792 lt!426163)))))

(assert (=> d!114403 (bvsge (index!38792 lt!426163) #b00000000000000000000000000000000)))

(assert (=> d!114403 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10616 thiss!1141) key!756 (index!38792 lt!426163)) lt!426178)))

(declare-fun bs!26582 () Bool)

(assert (= bs!26582 d!114403))

(assert (=> bs!26582 m!879257))

(declare-fun m!879307 () Bool)

(assert (=> bs!26582 m!879307))

(assert (=> b!946562 d!114403))

(declare-fun d!114405 () Bool)

(assert (=> d!114405 (= (array_inv!21450 (_keys!10616 thiss!1141)) (bvsge (size!28026 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946557 d!114405))

(declare-fun d!114407 () Bool)

(assert (=> d!114407 (= (array_inv!21451 (_values!5743 thiss!1141)) (bvsge (size!28025 (_values!5743 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946557 d!114407))

(declare-fun b!946630 () Bool)

(declare-fun e!532707 () SeekEntryResult!9105)

(declare-fun lt!426187 () SeekEntryResult!9105)

(assert (=> b!946630 (= e!532707 (MissingZero!9105 (index!38793 lt!426187)))))

(declare-fun b!946631 () Bool)

(declare-fun lt!426188 () SeekEntryResult!9105)

(assert (=> b!946631 (= e!532707 (ite ((_ is MissingVacant!9105) lt!426188) (MissingZero!9105 (index!38794 lt!426188)) lt!426188))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57275 (_ BitVec 32)) SeekEntryResult!9105)

(assert (=> b!946631 (= lt!426188 (seekKeyOrZeroReturnVacant!0 (x!81427 lt!426187) (index!38793 lt!426187) (index!38793 lt!426187) key!756 (_keys!10616 thiss!1141) (mask!27430 thiss!1141)))))

(declare-fun b!946632 () Bool)

(declare-fun c!98565 () Bool)

(declare-fun lt!426190 () (_ BitVec 64))

(assert (=> b!946632 (= c!98565 (= lt!426190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532706 () SeekEntryResult!9105)

(assert (=> b!946632 (= e!532706 e!532707)))

(declare-fun b!946633 () Bool)

(declare-fun e!532705 () SeekEntryResult!9105)

(assert (=> b!946633 (= e!532705 Undefined!9105)))

(declare-fun d!114409 () Bool)

(declare-fun lt!426189 () SeekEntryResult!9105)

(assert (=> d!114409 (and (or ((_ is MissingVacant!9105) lt!426189) (not ((_ is Found!9105) lt!426189)) (and (bvsge (index!38792 lt!426189) #b00000000000000000000000000000000) (bvslt (index!38792 lt!426189) (size!28026 (_keys!10616 thiss!1141))))) (not ((_ is MissingVacant!9105) lt!426189)) (or (not ((_ is Found!9105) lt!426189)) (= (select (arr!27552 (_keys!10616 thiss!1141)) (index!38792 lt!426189)) key!756)))))

(assert (=> d!114409 (= lt!426189 e!532705)))

(declare-fun c!98564 () Bool)

(assert (=> d!114409 (= c!98564 (and ((_ is Intermediate!9105) lt!426187) (undefined!9917 lt!426187)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57275 (_ BitVec 32)) SeekEntryResult!9105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114409 (= lt!426187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27430 thiss!1141)) key!756 (_keys!10616 thiss!1141) (mask!27430 thiss!1141)))))

(assert (=> d!114409 (validMask!0 (mask!27430 thiss!1141))))

(assert (=> d!114409 (= (seekEntry!0 key!756 (_keys!10616 thiss!1141) (mask!27430 thiss!1141)) lt!426189)))

(declare-fun b!946634 () Bool)

(assert (=> b!946634 (= e!532705 e!532706)))

(assert (=> b!946634 (= lt!426190 (select (arr!27552 (_keys!10616 thiss!1141)) (index!38793 lt!426187)))))

(declare-fun c!98563 () Bool)

(assert (=> b!946634 (= c!98563 (= lt!426190 key!756))))

(declare-fun b!946635 () Bool)

(assert (=> b!946635 (= e!532706 (Found!9105 (index!38793 lt!426187)))))

(assert (= (and d!114409 c!98564) b!946633))

(assert (= (and d!114409 (not c!98564)) b!946634))

(assert (= (and b!946634 c!98563) b!946635))

(assert (= (and b!946634 (not c!98563)) b!946632))

(assert (= (and b!946632 c!98565) b!946630))

(assert (= (and b!946632 (not c!98565)) b!946631))

(declare-fun m!879309 () Bool)

(assert (=> b!946631 m!879309))

(declare-fun m!879311 () Bool)

(assert (=> d!114409 m!879311))

(declare-fun m!879313 () Bool)

(assert (=> d!114409 m!879313))

(assert (=> d!114409 m!879313))

(declare-fun m!879315 () Bool)

(assert (=> d!114409 m!879315))

(assert (=> d!114409 m!879255))

(declare-fun m!879317 () Bool)

(assert (=> b!946634 m!879317))

(assert (=> b!946561 d!114409))

(declare-fun d!114411 () Bool)

(declare-fun res!635454 () Bool)

(declare-fun e!532710 () Bool)

(assert (=> d!114411 (=> (not res!635454) (not e!532710))))

(declare-fun simpleValid!360 (LongMapFixedSize!4846) Bool)

(assert (=> d!114411 (= res!635454 (simpleValid!360 thiss!1141))))

(assert (=> d!114411 (= (valid!1851 thiss!1141) e!532710)))

(declare-fun b!946642 () Bool)

(declare-fun res!635455 () Bool)

(assert (=> b!946642 (=> (not res!635455) (not e!532710))))

(declare-fun arrayCountValidKeys!0 (array!57275 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946642 (= res!635455 (= (arrayCountValidKeys!0 (_keys!10616 thiss!1141) #b00000000000000000000000000000000 (size!28026 (_keys!10616 thiss!1141))) (_size!2478 thiss!1141)))))

(declare-fun b!946643 () Bool)

(declare-fun res!635456 () Bool)

(assert (=> b!946643 (=> (not res!635456) (not e!532710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57275 (_ BitVec 32)) Bool)

(assert (=> b!946643 (= res!635456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10616 thiss!1141) (mask!27430 thiss!1141)))))

(declare-fun b!946644 () Bool)

(declare-datatypes ((List!19305 0))(
  ( (Nil!19302) (Cons!19301 (h!20456 (_ BitVec 64)) (t!27617 List!19305)) )
))
(declare-fun arrayNoDuplicates!0 (array!57275 (_ BitVec 32) List!19305) Bool)

(assert (=> b!946644 (= e!532710 (arrayNoDuplicates!0 (_keys!10616 thiss!1141) #b00000000000000000000000000000000 Nil!19302))))

(assert (= (and d!114411 res!635454) b!946642))

(assert (= (and b!946642 res!635455) b!946643))

(assert (= (and b!946643 res!635456) b!946644))

(declare-fun m!879319 () Bool)

(assert (=> d!114411 m!879319))

(declare-fun m!879321 () Bool)

(assert (=> b!946642 m!879321))

(declare-fun m!879323 () Bool)

(assert (=> b!946643 m!879323))

(declare-fun m!879325 () Bool)

(assert (=> b!946644 m!879325))

(assert (=> start!80714 d!114411))

(declare-fun b!946652 () Bool)

(declare-fun e!532716 () Bool)

(assert (=> b!946652 (= e!532716 tp_is_empty!20659)))

(declare-fun mapNonEmpty!32862 () Bool)

(declare-fun mapRes!32862 () Bool)

(declare-fun tp!63018 () Bool)

(declare-fun e!532715 () Bool)

(assert (=> mapNonEmpty!32862 (= mapRes!32862 (and tp!63018 e!532715))))

(declare-fun mapKey!32862 () (_ BitVec 32))

(declare-fun mapValue!32862 () ValueCell!9848)

(declare-fun mapRest!32862 () (Array (_ BitVec 32) ValueCell!9848))

(assert (=> mapNonEmpty!32862 (= mapRest!32853 (store mapRest!32862 mapKey!32862 mapValue!32862))))

(declare-fun mapIsEmpty!32862 () Bool)

(assert (=> mapIsEmpty!32862 mapRes!32862))

(declare-fun b!946651 () Bool)

(assert (=> b!946651 (= e!532715 tp_is_empty!20659)))

(declare-fun condMapEmpty!32862 () Bool)

(declare-fun mapDefault!32862 () ValueCell!9848)

(assert (=> mapNonEmpty!32853 (= condMapEmpty!32862 (= mapRest!32853 ((as const (Array (_ BitVec 32) ValueCell!9848)) mapDefault!32862)))))

(assert (=> mapNonEmpty!32853 (= tp!63002 (and e!532716 mapRes!32862))))

(assert (= (and mapNonEmpty!32853 condMapEmpty!32862) mapIsEmpty!32862))

(assert (= (and mapNonEmpty!32853 (not condMapEmpty!32862)) mapNonEmpty!32862))

(assert (= (and mapNonEmpty!32862 ((_ is ValueCellFull!9848) mapValue!32862)) b!946651))

(assert (= (and mapNonEmpty!32853 ((_ is ValueCellFull!9848) mapDefault!32862)) b!946652))

(declare-fun m!879327 () Bool)

(assert (=> mapNonEmpty!32862 m!879327))

(check-sat (not mapNonEmpty!32862) b_and!29547 (not b!946631) tp_is_empty!20659 (not b!946643) (not d!114403) (not b!946644) (not b!946642) (not d!114411) (not d!114409) (not b_next!18151) (not b!946617))
(check-sat b_and!29547 (not b_next!18151))
(get-model)

(declare-fun bm!41068 () Bool)

(declare-fun call!41071 () (_ BitVec 32))

(assert (=> bm!41068 (= call!41071 (arrayCountValidKeys!0 (_keys!10616 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28026 (_keys!10616 thiss!1141))))))

(declare-fun b!946661 () Bool)

(declare-fun e!532722 () (_ BitVec 32))

(declare-fun e!532721 () (_ BitVec 32))

(assert (=> b!946661 (= e!532722 e!532721)))

(declare-fun c!98570 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946661 (= c!98570 (validKeyInArray!0 (select (arr!27552 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946663 () Bool)

(assert (=> b!946663 (= e!532722 #b00000000000000000000000000000000)))

(declare-fun b!946664 () Bool)

(assert (=> b!946664 (= e!532721 call!41071)))

(declare-fun d!114413 () Bool)

(declare-fun lt!426193 () (_ BitVec 32))

(assert (=> d!114413 (and (bvsge lt!426193 #b00000000000000000000000000000000) (bvsle lt!426193 (bvsub (size!28026 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114413 (= lt!426193 e!532722)))

(declare-fun c!98571 () Bool)

(assert (=> d!114413 (= c!98571 (bvsge #b00000000000000000000000000000000 (size!28026 (_keys!10616 thiss!1141))))))

(assert (=> d!114413 (and (bvsle #b00000000000000000000000000000000 (size!28026 (_keys!10616 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28026 (_keys!10616 thiss!1141)) (size!28026 (_keys!10616 thiss!1141))))))

(assert (=> d!114413 (= (arrayCountValidKeys!0 (_keys!10616 thiss!1141) #b00000000000000000000000000000000 (size!28026 (_keys!10616 thiss!1141))) lt!426193)))

(declare-fun b!946662 () Bool)

(assert (=> b!946662 (= e!532721 (bvadd #b00000000000000000000000000000001 call!41071))))

(assert (= (and d!114413 c!98571) b!946663))

(assert (= (and d!114413 (not c!98571)) b!946661))

(assert (= (and b!946661 c!98570) b!946662))

(assert (= (and b!946661 (not c!98570)) b!946664))

(assert (= (or b!946662 b!946664) bm!41068))

(declare-fun m!879329 () Bool)

(assert (=> bm!41068 m!879329))

(assert (=> b!946661 m!879303))

(assert (=> b!946661 m!879303))

(declare-fun m!879331 () Bool)

(assert (=> b!946661 m!879331))

(assert (=> b!946642 d!114413))

(declare-fun d!114415 () Bool)

(declare-fun res!635457 () Bool)

(declare-fun e!532723 () Bool)

(assert (=> d!114415 (=> res!635457 e!532723)))

(assert (=> d!114415 (= res!635457 (= (select (arr!27552 (_keys!10616 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114415 (= (arrayContainsKey!0 (_keys!10616 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!532723)))

(declare-fun b!946665 () Bool)

(declare-fun e!532724 () Bool)

(assert (=> b!946665 (= e!532723 e!532724)))

(declare-fun res!635458 () Bool)

(assert (=> b!946665 (=> (not res!635458) (not e!532724))))

(assert (=> b!946665 (= res!635458 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28026 (_keys!10616 thiss!1141))))))

(declare-fun b!946666 () Bool)

(assert (=> b!946666 (= e!532724 (arrayContainsKey!0 (_keys!10616 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114415 (not res!635457)) b!946665))

(assert (= (and b!946665 res!635458) b!946666))

(declare-fun m!879333 () Bool)

(assert (=> d!114415 m!879333))

(declare-fun m!879335 () Bool)

(assert (=> b!946666 m!879335))

(assert (=> b!946617 d!114415))

(declare-fun b!946675 () Bool)

(declare-fun e!532733 () Bool)

(declare-fun call!41074 () Bool)

(assert (=> b!946675 (= e!532733 call!41074)))

(declare-fun bm!41071 () Bool)

(assert (=> bm!41071 (= call!41074 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10616 thiss!1141) (mask!27430 thiss!1141)))))

(declare-fun b!946676 () Bool)

(declare-fun e!532732 () Bool)

(assert (=> b!946676 (= e!532732 e!532733)))

(declare-fun lt!426201 () (_ BitVec 64))

(assert (=> b!946676 (= lt!426201 (select (arr!27552 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426202 () Unit!31794)

(assert (=> b!946676 (= lt!426202 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10616 thiss!1141) lt!426201 #b00000000000000000000000000000000))))

(assert (=> b!946676 (arrayContainsKey!0 (_keys!10616 thiss!1141) lt!426201 #b00000000000000000000000000000000)))

(declare-fun lt!426200 () Unit!31794)

(assert (=> b!946676 (= lt!426200 lt!426202)))

(declare-fun res!635463 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57275 (_ BitVec 32)) SeekEntryResult!9105)

(assert (=> b!946676 (= res!635463 (= (seekEntryOrOpen!0 (select (arr!27552 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000) (_keys!10616 thiss!1141) (mask!27430 thiss!1141)) (Found!9105 #b00000000000000000000000000000000)))))

(assert (=> b!946676 (=> (not res!635463) (not e!532733))))

(declare-fun b!946677 () Bool)

(assert (=> b!946677 (= e!532732 call!41074)))

(declare-fun b!946678 () Bool)

(declare-fun e!532731 () Bool)

(assert (=> b!946678 (= e!532731 e!532732)))

(declare-fun c!98574 () Bool)

(assert (=> b!946678 (= c!98574 (validKeyInArray!0 (select (arr!27552 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114417 () Bool)

(declare-fun res!635464 () Bool)

(assert (=> d!114417 (=> res!635464 e!532731)))

(assert (=> d!114417 (= res!635464 (bvsge #b00000000000000000000000000000000 (size!28026 (_keys!10616 thiss!1141))))))

(assert (=> d!114417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10616 thiss!1141) (mask!27430 thiss!1141)) e!532731)))

(assert (= (and d!114417 (not res!635464)) b!946678))

(assert (= (and b!946678 c!98574) b!946676))

(assert (= (and b!946678 (not c!98574)) b!946677))

(assert (= (and b!946676 res!635463) b!946675))

(assert (= (or b!946675 b!946677) bm!41071))

(declare-fun m!879337 () Bool)

(assert (=> bm!41071 m!879337))

(assert (=> b!946676 m!879303))

(declare-fun m!879339 () Bool)

(assert (=> b!946676 m!879339))

(declare-fun m!879341 () Bool)

(assert (=> b!946676 m!879341))

(assert (=> b!946676 m!879303))

(declare-fun m!879343 () Bool)

(assert (=> b!946676 m!879343))

(assert (=> b!946678 m!879303))

(assert (=> b!946678 m!879303))

(assert (=> b!946678 m!879331))

(assert (=> b!946643 d!114417))

(assert (=> d!114403 d!114401))

(declare-fun d!114419 () Bool)

(assert (=> d!114419 (arrayContainsKey!0 (_keys!10616 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114419 true))

(declare-fun _$60!436 () Unit!31794)

(assert (=> d!114419 (= (choose!13 (_keys!10616 thiss!1141) key!756 (index!38792 lt!426163)) _$60!436)))

(declare-fun bs!26583 () Bool)

(assert (= bs!26583 d!114419))

(assert (=> bs!26583 m!879257))

(assert (=> d!114403 d!114419))

(declare-fun b!946689 () Bool)

(declare-fun e!532743 () Bool)

(declare-fun e!532744 () Bool)

(assert (=> b!946689 (= e!532743 e!532744)))

(declare-fun res!635473 () Bool)

(assert (=> b!946689 (=> (not res!635473) (not e!532744))))

(declare-fun e!532742 () Bool)

(assert (=> b!946689 (= res!635473 (not e!532742))))

(declare-fun res!635471 () Bool)

(assert (=> b!946689 (=> (not res!635471) (not e!532742))))

(assert (=> b!946689 (= res!635471 (validKeyInArray!0 (select (arr!27552 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946690 () Bool)

(declare-fun e!532745 () Bool)

(declare-fun call!41077 () Bool)

(assert (=> b!946690 (= e!532745 call!41077)))

(declare-fun b!946691 () Bool)

(assert (=> b!946691 (= e!532745 call!41077)))

(declare-fun bm!41074 () Bool)

(declare-fun c!98577 () Bool)

(assert (=> bm!41074 (= call!41077 (arrayNoDuplicates!0 (_keys!10616 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98577 (Cons!19301 (select (arr!27552 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000) Nil!19302) Nil!19302)))))

(declare-fun b!946693 () Bool)

(declare-fun contains!5159 (List!19305 (_ BitVec 64)) Bool)

(assert (=> b!946693 (= e!532742 (contains!5159 Nil!19302 (select (arr!27552 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114421 () Bool)

(declare-fun res!635472 () Bool)

(assert (=> d!114421 (=> res!635472 e!532743)))

(assert (=> d!114421 (= res!635472 (bvsge #b00000000000000000000000000000000 (size!28026 (_keys!10616 thiss!1141))))))

(assert (=> d!114421 (= (arrayNoDuplicates!0 (_keys!10616 thiss!1141) #b00000000000000000000000000000000 Nil!19302) e!532743)))

(declare-fun b!946692 () Bool)

(assert (=> b!946692 (= e!532744 e!532745)))

(assert (=> b!946692 (= c!98577 (validKeyInArray!0 (select (arr!27552 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114421 (not res!635472)) b!946689))

(assert (= (and b!946689 res!635471) b!946693))

(assert (= (and b!946689 res!635473) b!946692))

(assert (= (and b!946692 c!98577) b!946690))

(assert (= (and b!946692 (not c!98577)) b!946691))

(assert (= (or b!946690 b!946691) bm!41074))

(assert (=> b!946689 m!879303))

(assert (=> b!946689 m!879303))

(assert (=> b!946689 m!879331))

(assert (=> bm!41074 m!879303))

(declare-fun m!879345 () Bool)

(assert (=> bm!41074 m!879345))

(assert (=> b!946693 m!879303))

(assert (=> b!946693 m!879303))

(declare-fun m!879347 () Bool)

(assert (=> b!946693 m!879347))

(assert (=> b!946692 m!879303))

(assert (=> b!946692 m!879303))

(assert (=> b!946692 m!879331))

(assert (=> b!946644 d!114421))

(declare-fun b!946712 () Bool)

(declare-fun e!532758 () SeekEntryResult!9105)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946712 (= e!532758 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27430 thiss!1141)) #b00000000000000000000000000000000 (mask!27430 thiss!1141)) key!756 (_keys!10616 thiss!1141) (mask!27430 thiss!1141)))))

(declare-fun b!946713 () Bool)

(declare-fun e!532757 () SeekEntryResult!9105)

(assert (=> b!946713 (= e!532757 e!532758)))

(declare-fun c!98586 () Bool)

(declare-fun lt!426207 () (_ BitVec 64))

(assert (=> b!946713 (= c!98586 (or (= lt!426207 key!756) (= (bvadd lt!426207 lt!426207) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!946714 () Bool)

(assert (=> b!946714 (= e!532757 (Intermediate!9105 true (toIndex!0 key!756 (mask!27430 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946715 () Bool)

(declare-fun lt!426208 () SeekEntryResult!9105)

(assert (=> b!946715 (and (bvsge (index!38793 lt!426208) #b00000000000000000000000000000000) (bvslt (index!38793 lt!426208) (size!28026 (_keys!10616 thiss!1141))))))

(declare-fun res!635482 () Bool)

(assert (=> b!946715 (= res!635482 (= (select (arr!27552 (_keys!10616 thiss!1141)) (index!38793 lt!426208)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532760 () Bool)

(assert (=> b!946715 (=> res!635482 e!532760)))

(declare-fun b!946716 () Bool)

(assert (=> b!946716 (and (bvsge (index!38793 lt!426208) #b00000000000000000000000000000000) (bvslt (index!38793 lt!426208) (size!28026 (_keys!10616 thiss!1141))))))

(assert (=> b!946716 (= e!532760 (= (select (arr!27552 (_keys!10616 thiss!1141)) (index!38793 lt!426208)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!946717 () Bool)

(assert (=> b!946717 (and (bvsge (index!38793 lt!426208) #b00000000000000000000000000000000) (bvslt (index!38793 lt!426208) (size!28026 (_keys!10616 thiss!1141))))))

(declare-fun res!635481 () Bool)

(assert (=> b!946717 (= res!635481 (= (select (arr!27552 (_keys!10616 thiss!1141)) (index!38793 lt!426208)) key!756))))

(assert (=> b!946717 (=> res!635481 e!532760)))

(declare-fun e!532759 () Bool)

(assert (=> b!946717 (= e!532759 e!532760)))

(declare-fun d!114423 () Bool)

(declare-fun e!532756 () Bool)

(assert (=> d!114423 e!532756))

(declare-fun c!98584 () Bool)

(assert (=> d!114423 (= c!98584 (and ((_ is Intermediate!9105) lt!426208) (undefined!9917 lt!426208)))))

(assert (=> d!114423 (= lt!426208 e!532757)))

(declare-fun c!98585 () Bool)

(assert (=> d!114423 (= c!98585 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114423 (= lt!426207 (select (arr!27552 (_keys!10616 thiss!1141)) (toIndex!0 key!756 (mask!27430 thiss!1141))))))

(assert (=> d!114423 (validMask!0 (mask!27430 thiss!1141))))

(assert (=> d!114423 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27430 thiss!1141)) key!756 (_keys!10616 thiss!1141) (mask!27430 thiss!1141)) lt!426208)))

(declare-fun b!946718 () Bool)

(assert (=> b!946718 (= e!532756 (bvsge (x!81427 lt!426208) #b01111111111111111111111111111110))))

(declare-fun b!946719 () Bool)

(assert (=> b!946719 (= e!532756 e!532759)))

(declare-fun res!635480 () Bool)

(assert (=> b!946719 (= res!635480 (and ((_ is Intermediate!9105) lt!426208) (not (undefined!9917 lt!426208)) (bvslt (x!81427 lt!426208) #b01111111111111111111111111111110) (bvsge (x!81427 lt!426208) #b00000000000000000000000000000000) (bvsge (x!81427 lt!426208) #b00000000000000000000000000000000)))))

(assert (=> b!946719 (=> (not res!635480) (not e!532759))))

(declare-fun b!946720 () Bool)

(assert (=> b!946720 (= e!532758 (Intermediate!9105 false (toIndex!0 key!756 (mask!27430 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!114423 c!98585) b!946714))

(assert (= (and d!114423 (not c!98585)) b!946713))

(assert (= (and b!946713 c!98586) b!946720))

(assert (= (and b!946713 (not c!98586)) b!946712))

(assert (= (and d!114423 c!98584) b!946718))

(assert (= (and d!114423 (not c!98584)) b!946719))

(assert (= (and b!946719 res!635480) b!946717))

(assert (= (and b!946717 (not res!635481)) b!946715))

(assert (= (and b!946715 (not res!635482)) b!946716))

(assert (=> b!946712 m!879313))

(declare-fun m!879349 () Bool)

(assert (=> b!946712 m!879349))

(assert (=> b!946712 m!879349))

(declare-fun m!879351 () Bool)

(assert (=> b!946712 m!879351))

(declare-fun m!879353 () Bool)

(assert (=> b!946716 m!879353))

(assert (=> b!946715 m!879353))

(assert (=> d!114423 m!879313))

(declare-fun m!879355 () Bool)

(assert (=> d!114423 m!879355))

(assert (=> d!114423 m!879255))

(assert (=> b!946717 m!879353))

(assert (=> d!114409 d!114423))

(declare-fun d!114425 () Bool)

(declare-fun lt!426214 () (_ BitVec 32))

(declare-fun lt!426213 () (_ BitVec 32))

(assert (=> d!114425 (= lt!426214 (bvmul (bvxor lt!426213 (bvlshr lt!426213 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114425 (= lt!426213 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114425 (and (bvsge (mask!27430 thiss!1141) #b00000000000000000000000000000000) (let ((res!635483 (let ((h!20457 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81445 (bvmul (bvxor h!20457 (bvlshr h!20457 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81445 (bvlshr x!81445 #b00000000000000000000000000001101)) (mask!27430 thiss!1141)))))) (and (bvslt res!635483 (bvadd (mask!27430 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635483 #b00000000000000000000000000000000))))))

(assert (=> d!114425 (= (toIndex!0 key!756 (mask!27430 thiss!1141)) (bvand (bvxor lt!426214 (bvlshr lt!426214 #b00000000000000000000000000001101)) (mask!27430 thiss!1141)))))

(assert (=> d!114409 d!114425))

(assert (=> d!114409 d!114399))

(declare-fun b!946732 () Bool)

(declare-fun e!532763 () Bool)

(assert (=> b!946732 (= e!532763 (and (bvsge (extraKeys!5452 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5452 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2478 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!946729 () Bool)

(declare-fun res!635495 () Bool)

(assert (=> b!946729 (=> (not res!635495) (not e!532763))))

(assert (=> b!946729 (= res!635495 (and (= (size!28025 (_values!5743 thiss!1141)) (bvadd (mask!27430 thiss!1141) #b00000000000000000000000000000001)) (= (size!28026 (_keys!10616 thiss!1141)) (size!28025 (_values!5743 thiss!1141))) (bvsge (_size!2478 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2478 thiss!1141) (bvadd (mask!27430 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!946730 () Bool)

(declare-fun res!635494 () Bool)

(assert (=> b!946730 (=> (not res!635494) (not e!532763))))

(declare-fun size!28031 (LongMapFixedSize!4846) (_ BitVec 32))

(assert (=> b!946730 (= res!635494 (bvsge (size!28031 thiss!1141) (_size!2478 thiss!1141)))))

(declare-fun b!946731 () Bool)

(declare-fun res!635492 () Bool)

(assert (=> b!946731 (=> (not res!635492) (not e!532763))))

(assert (=> b!946731 (= res!635492 (= (size!28031 thiss!1141) (bvadd (_size!2478 thiss!1141) (bvsdiv (bvadd (extraKeys!5452 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!114427 () Bool)

(declare-fun res!635493 () Bool)

(assert (=> d!114427 (=> (not res!635493) (not e!532763))))

(assert (=> d!114427 (= res!635493 (validMask!0 (mask!27430 thiss!1141)))))

(assert (=> d!114427 (= (simpleValid!360 thiss!1141) e!532763)))

(assert (= (and d!114427 res!635493) b!946729))

(assert (= (and b!946729 res!635495) b!946730))

(assert (= (and b!946730 res!635494) b!946731))

(assert (= (and b!946731 res!635492) b!946732))

(declare-fun m!879357 () Bool)

(assert (=> b!946730 m!879357))

(assert (=> b!946731 m!879357))

(assert (=> d!114427 m!879255))

(assert (=> d!114411 d!114427))

(declare-fun b!946745 () Bool)

(declare-fun e!532772 () SeekEntryResult!9105)

(assert (=> b!946745 (= e!532772 Undefined!9105)))

(declare-fun b!946746 () Bool)

(declare-fun e!532770 () SeekEntryResult!9105)

(assert (=> b!946746 (= e!532770 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81427 lt!426187) #b00000000000000000000000000000001) (nextIndex!0 (index!38793 lt!426187) (x!81427 lt!426187) (mask!27430 thiss!1141)) (index!38793 lt!426187) key!756 (_keys!10616 thiss!1141) (mask!27430 thiss!1141)))))

(declare-fun b!946747 () Bool)

(declare-fun c!98595 () Bool)

(declare-fun lt!426219 () (_ BitVec 64))

(assert (=> b!946747 (= c!98595 (= lt!426219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532771 () SeekEntryResult!9105)

(assert (=> b!946747 (= e!532771 e!532770)))

(declare-fun d!114429 () Bool)

(declare-fun lt!426220 () SeekEntryResult!9105)

(assert (=> d!114429 (and (or ((_ is Undefined!9105) lt!426220) (not ((_ is Found!9105) lt!426220)) (and (bvsge (index!38792 lt!426220) #b00000000000000000000000000000000) (bvslt (index!38792 lt!426220) (size!28026 (_keys!10616 thiss!1141))))) (or ((_ is Undefined!9105) lt!426220) ((_ is Found!9105) lt!426220) (not ((_ is MissingVacant!9105) lt!426220)) (not (= (index!38794 lt!426220) (index!38793 lt!426187))) (and (bvsge (index!38794 lt!426220) #b00000000000000000000000000000000) (bvslt (index!38794 lt!426220) (size!28026 (_keys!10616 thiss!1141))))) (or ((_ is Undefined!9105) lt!426220) (ite ((_ is Found!9105) lt!426220) (= (select (arr!27552 (_keys!10616 thiss!1141)) (index!38792 lt!426220)) key!756) (and ((_ is MissingVacant!9105) lt!426220) (= (index!38794 lt!426220) (index!38793 lt!426187)) (= (select (arr!27552 (_keys!10616 thiss!1141)) (index!38794 lt!426220)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114429 (= lt!426220 e!532772)))

(declare-fun c!98593 () Bool)

(assert (=> d!114429 (= c!98593 (bvsge (x!81427 lt!426187) #b01111111111111111111111111111110))))

(assert (=> d!114429 (= lt!426219 (select (arr!27552 (_keys!10616 thiss!1141)) (index!38793 lt!426187)))))

(assert (=> d!114429 (validMask!0 (mask!27430 thiss!1141))))

(assert (=> d!114429 (= (seekKeyOrZeroReturnVacant!0 (x!81427 lt!426187) (index!38793 lt!426187) (index!38793 lt!426187) key!756 (_keys!10616 thiss!1141) (mask!27430 thiss!1141)) lt!426220)))

(declare-fun b!946748 () Bool)

(assert (=> b!946748 (= e!532770 (MissingVacant!9105 (index!38793 lt!426187)))))

(declare-fun b!946749 () Bool)

(assert (=> b!946749 (= e!532771 (Found!9105 (index!38793 lt!426187)))))

(declare-fun b!946750 () Bool)

(assert (=> b!946750 (= e!532772 e!532771)))

(declare-fun c!98594 () Bool)

(assert (=> b!946750 (= c!98594 (= lt!426219 key!756))))

(assert (= (and d!114429 c!98593) b!946745))

(assert (= (and d!114429 (not c!98593)) b!946750))

(assert (= (and b!946750 c!98594) b!946749))

(assert (= (and b!946750 (not c!98594)) b!946747))

(assert (= (and b!946747 c!98595) b!946748))

(assert (= (and b!946747 (not c!98595)) b!946746))

(declare-fun m!879359 () Bool)

(assert (=> b!946746 m!879359))

(assert (=> b!946746 m!879359))

(declare-fun m!879361 () Bool)

(assert (=> b!946746 m!879361))

(declare-fun m!879363 () Bool)

(assert (=> d!114429 m!879363))

(declare-fun m!879365 () Bool)

(assert (=> d!114429 m!879365))

(assert (=> d!114429 m!879317))

(assert (=> d!114429 m!879255))

(assert (=> b!946631 d!114429))

(declare-fun b!946752 () Bool)

(declare-fun e!532774 () Bool)

(assert (=> b!946752 (= e!532774 tp_is_empty!20659)))

(declare-fun mapNonEmpty!32863 () Bool)

(declare-fun mapRes!32863 () Bool)

(declare-fun tp!63019 () Bool)

(declare-fun e!532773 () Bool)

(assert (=> mapNonEmpty!32863 (= mapRes!32863 (and tp!63019 e!532773))))

(declare-fun mapKey!32863 () (_ BitVec 32))

(declare-fun mapRest!32863 () (Array (_ BitVec 32) ValueCell!9848))

(declare-fun mapValue!32863 () ValueCell!9848)

(assert (=> mapNonEmpty!32863 (= mapRest!32862 (store mapRest!32863 mapKey!32863 mapValue!32863))))

(declare-fun mapIsEmpty!32863 () Bool)

(assert (=> mapIsEmpty!32863 mapRes!32863))

(declare-fun b!946751 () Bool)

(assert (=> b!946751 (= e!532773 tp_is_empty!20659)))

(declare-fun condMapEmpty!32863 () Bool)

(declare-fun mapDefault!32863 () ValueCell!9848)

(assert (=> mapNonEmpty!32862 (= condMapEmpty!32863 (= mapRest!32862 ((as const (Array (_ BitVec 32) ValueCell!9848)) mapDefault!32863)))))

(assert (=> mapNonEmpty!32862 (= tp!63018 (and e!532774 mapRes!32863))))

(assert (= (and mapNonEmpty!32862 condMapEmpty!32863) mapIsEmpty!32863))

(assert (= (and mapNonEmpty!32862 (not condMapEmpty!32863)) mapNonEmpty!32863))

(assert (= (and mapNonEmpty!32863 ((_ is ValueCellFull!9848) mapValue!32863)) b!946751))

(assert (= (and mapNonEmpty!32862 ((_ is ValueCellFull!9848) mapDefault!32863)) b!946752))

(declare-fun m!879367 () Bool)

(assert (=> mapNonEmpty!32863 m!879367))

(check-sat (not b_next!18151) (not bm!41071) (not d!114427) (not b!946731) (not bm!41074) (not d!114419) (not b!946692) b_and!29547 (not b!946678) (not b!946676) (not bm!41068) (not d!114423) (not mapNonEmpty!32863) (not b!946661) (not b!946730) tp_is_empty!20659 (not b!946712) (not b!946666) (not b!946746) (not b!946689) (not d!114429) (not b!946693))
(check-sat b_and!29547 (not b_next!18151))
