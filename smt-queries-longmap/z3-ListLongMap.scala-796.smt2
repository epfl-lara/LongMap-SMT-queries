; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19070 () Bool)

(assert start!19070)

(declare-fun b!187645 () Bool)

(declare-fun b_free!4615 () Bool)

(declare-fun b_next!4615 () Bool)

(assert (=> b!187645 (= b_free!4615 (not b_next!4615))))

(declare-fun tp!16661 () Bool)

(declare-fun b_and!11213 () Bool)

(assert (=> b!187645 (= tp!16661 b_and!11213)))

(declare-fun mapIsEmpty!7560 () Bool)

(declare-fun mapRes!7560 () Bool)

(assert (=> mapIsEmpty!7560 mapRes!7560))

(declare-fun b!187639 () Bool)

(declare-fun e!123486 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5497 0))(
  ( (V!5498 (val!2238 Int)) )
))
(declare-datatypes ((ValueCell!1850 0))(
  ( (ValueCellFull!1850 (v!4148 V!5497)) (EmptyCell!1850) )
))
(declare-datatypes ((array!7973 0))(
  ( (array!7974 (arr!3760 (Array (_ BitVec 32) (_ BitVec 64))) (size!4080 (_ BitVec 32))) )
))
(declare-datatypes ((array!7975 0))(
  ( (array!7976 (arr!3761 (Array (_ BitVec 32) ValueCell!1850)) (size!4081 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2608 0))(
  ( (LongMapFixedSize!2609 (defaultEntry!3830 Int) (mask!8983 (_ BitVec 32)) (extraKeys!3567 (_ BitVec 32)) (zeroValue!3671 V!5497) (minValue!3671 V!5497) (_size!1353 (_ BitVec 32)) (_keys!5784 array!7973) (_values!3813 array!7975) (_vacant!1353 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2608)

(declare-datatypes ((SeekEntryResult!653 0))(
  ( (MissingZero!653 (index!4782 (_ BitVec 32))) (Found!653 (index!4783 (_ BitVec 32))) (Intermediate!653 (undefined!1465 Bool) (index!4784 (_ BitVec 32)) (x!20312 (_ BitVec 32))) (Undefined!653) (MissingVacant!653 (index!4785 (_ BitVec 32))) )
))
(declare-fun lt!92741 () SeekEntryResult!653)

(assert (=> b!187639 (= e!123486 (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4783 lt!92741)) key!828))))

(declare-fun mapNonEmpty!7560 () Bool)

(declare-fun tp!16662 () Bool)

(declare-fun e!123482 () Bool)

(assert (=> mapNonEmpty!7560 (= mapRes!7560 (and tp!16662 e!123482))))

(declare-fun mapValue!7560 () ValueCell!1850)

(declare-fun mapRest!7560 () (Array (_ BitVec 32) ValueCell!1850))

(declare-fun mapKey!7560 () (_ BitVec 32))

(assert (=> mapNonEmpty!7560 (= (arr!3761 (_values!3813 thiss!1248)) (store mapRest!7560 mapKey!7560 mapValue!7560))))

(declare-fun b!187640 () Bool)

(declare-fun e!123491 () Bool)

(declare-fun e!123483 () Bool)

(assert (=> b!187640 (= e!123491 e!123483)))

(declare-fun res!88692 () Bool)

(assert (=> b!187640 (=> (not res!88692) (not e!123483))))

(get-info :version)

(assert (=> b!187640 (= res!88692 (and (not ((_ is Undefined!653) lt!92741)) (not ((_ is MissingVacant!653) lt!92741)) (not ((_ is MissingZero!653) lt!92741)) ((_ is Found!653) lt!92741)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7973 (_ BitVec 32)) SeekEntryResult!653)

(assert (=> b!187640 (= lt!92741 (seekEntryOrOpen!0 key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(declare-fun b!187641 () Bool)

(declare-datatypes ((Unit!5627 0))(
  ( (Unit!5628) )
))
(declare-fun e!123488 () Unit!5627)

(declare-fun lt!92739 () Unit!5627)

(assert (=> b!187641 (= e!123488 lt!92739)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!151 (array!7973 array!7975 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 64) Int) Unit!5627)

(assert (=> b!187641 (= lt!92739 (lemmaInListMapThenSeekEntryOrOpenFindsIt!151 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)))))

(declare-fun res!88688 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187641 (= res!88688 (inRange!0 (index!4783 lt!92741) (mask!8983 thiss!1248)))))

(assert (=> b!187641 (=> (not res!88688) (not e!123486))))

(assert (=> b!187641 e!123486))

(declare-fun b!187642 () Bool)

(declare-fun res!88690 () Bool)

(assert (=> b!187642 (=> (not res!88690) (not e!123491))))

(assert (=> b!187642 (= res!88690 (not (= key!828 (bvneg key!828))))))

(declare-fun b!187643 () Bool)

(declare-fun e!123487 () Bool)

(assert (=> b!187643 (= e!123487 (and (= (size!4081 (_values!3813 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8983 thiss!1248))) (= (size!4080 (_keys!5784 thiss!1248)) (size!4081 (_values!3813 thiss!1248))) (bvsge (mask!8983 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3567 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3567 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!187644 () Bool)

(declare-fun e!123489 () Bool)

(declare-fun tp_is_empty!4387 () Bool)

(assert (=> b!187644 (= e!123489 tp_is_empty!4387)))

(declare-fun e!123490 () Bool)

(declare-fun e!123484 () Bool)

(declare-fun array_inv!2433 (array!7973) Bool)

(declare-fun array_inv!2434 (array!7975) Bool)

(assert (=> b!187645 (= e!123484 (and tp!16661 tp_is_empty!4387 (array_inv!2433 (_keys!5784 thiss!1248)) (array_inv!2434 (_values!3813 thiss!1248)) e!123490))))

(declare-fun res!88691 () Bool)

(assert (=> start!19070 (=> (not res!88691) (not e!123491))))

(declare-fun valid!1093 (LongMapFixedSize!2608) Bool)

(assert (=> start!19070 (= res!88691 (valid!1093 thiss!1248))))

(assert (=> start!19070 e!123491))

(assert (=> start!19070 e!123484))

(assert (=> start!19070 true))

(declare-fun b!187646 () Bool)

(assert (=> b!187646 (= e!123483 e!123487)))

(declare-fun res!88689 () Bool)

(assert (=> b!187646 (=> (not res!88689) (not e!123487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187646 (= res!88689 (validMask!0 (mask!8983 thiss!1248)))))

(declare-fun lt!92740 () Unit!5627)

(assert (=> b!187646 (= lt!92740 e!123488)))

(declare-fun c!33707 () Bool)

(declare-datatypes ((tuple2!3446 0))(
  ( (tuple2!3447 (_1!1734 (_ BitVec 64)) (_2!1734 V!5497)) )
))
(declare-datatypes ((List!2373 0))(
  ( (Nil!2370) (Cons!2369 (h!3005 tuple2!3446) (t!7258 List!2373)) )
))
(declare-datatypes ((ListLongMap!2355 0))(
  ( (ListLongMap!2356 (toList!1193 List!2373)) )
))
(declare-fun contains!1301 (ListLongMap!2355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!826 (array!7973 array!7975 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 32) Int) ListLongMap!2355)

(assert (=> b!187646 (= c!33707 (contains!1301 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)) key!828))))

(declare-fun b!187647 () Bool)

(declare-fun Unit!5629 () Unit!5627)

(assert (=> b!187647 (= e!123488 Unit!5629)))

(declare-fun lt!92738 () Unit!5627)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!149 (array!7973 array!7975 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 64) Int) Unit!5627)

(assert (=> b!187647 (= lt!92738 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!149 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)))))

(assert (=> b!187647 false))

(declare-fun b!187648 () Bool)

(assert (=> b!187648 (= e!123490 (and e!123489 mapRes!7560))))

(declare-fun condMapEmpty!7560 () Bool)

(declare-fun mapDefault!7560 () ValueCell!1850)

(assert (=> b!187648 (= condMapEmpty!7560 (= (arr!3761 (_values!3813 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1850)) mapDefault!7560)))))

(declare-fun b!187649 () Bool)

(assert (=> b!187649 (= e!123482 tp_is_empty!4387)))

(assert (= (and start!19070 res!88691) b!187642))

(assert (= (and b!187642 res!88690) b!187640))

(assert (= (and b!187640 res!88692) b!187646))

(assert (= (and b!187646 c!33707) b!187641))

(assert (= (and b!187646 (not c!33707)) b!187647))

(assert (= (and b!187641 res!88688) b!187639))

(assert (= (and b!187646 res!88689) b!187643))

(assert (= (and b!187648 condMapEmpty!7560) mapIsEmpty!7560))

(assert (= (and b!187648 (not condMapEmpty!7560)) mapNonEmpty!7560))

(assert (= (and mapNonEmpty!7560 ((_ is ValueCellFull!1850) mapValue!7560)) b!187649))

(assert (= (and b!187648 ((_ is ValueCellFull!1850) mapDefault!7560)) b!187644))

(assert (= b!187645 b!187648))

(assert (= start!19070 b!187645))

(declare-fun m!213937 () Bool)

(assert (=> b!187641 m!213937))

(declare-fun m!213939 () Bool)

(assert (=> b!187641 m!213939))

(declare-fun m!213941 () Bool)

(assert (=> start!19070 m!213941))

(declare-fun m!213943 () Bool)

(assert (=> b!187639 m!213943))

(declare-fun m!213945 () Bool)

(assert (=> b!187647 m!213945))

(declare-fun m!213947 () Bool)

(assert (=> b!187646 m!213947))

(declare-fun m!213949 () Bool)

(assert (=> b!187646 m!213949))

(assert (=> b!187646 m!213949))

(declare-fun m!213951 () Bool)

(assert (=> b!187646 m!213951))

(declare-fun m!213953 () Bool)

(assert (=> mapNonEmpty!7560 m!213953))

(declare-fun m!213955 () Bool)

(assert (=> b!187640 m!213955))

(declare-fun m!213957 () Bool)

(assert (=> b!187645 m!213957))

(declare-fun m!213959 () Bool)

(assert (=> b!187645 m!213959))

(check-sat (not start!19070) (not b!187641) (not b!187647) tp_is_empty!4387 (not b!187645) b_and!11213 (not b!187640) (not mapNonEmpty!7560) (not b_next!4615) (not b!187646))
(check-sat b_and!11213 (not b_next!4615))
(get-model)

(declare-fun d!55357 () Bool)

(assert (=> d!55357 (= (array_inv!2433 (_keys!5784 thiss!1248)) (bvsge (size!4080 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187645 d!55357))

(declare-fun d!55359 () Bool)

(assert (=> d!55359 (= (array_inv!2434 (_values!3813 thiss!1248)) (bvsge (size!4081 (_values!3813 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187645 d!55359))

(declare-fun b!187728 () Bool)

(declare-fun e!123560 () SeekEntryResult!653)

(declare-fun lt!92772 () SeekEntryResult!653)

(assert (=> b!187728 (= e!123560 (Found!653 (index!4784 lt!92772)))))

(declare-fun b!187729 () Bool)

(declare-fun e!123558 () SeekEntryResult!653)

(assert (=> b!187729 (= e!123558 Undefined!653)))

(declare-fun b!187730 () Bool)

(assert (=> b!187730 (= e!123558 e!123560)))

(declare-fun lt!92774 () (_ BitVec 64))

(assert (=> b!187730 (= lt!92774 (select (arr!3760 (_keys!5784 thiss!1248)) (index!4784 lt!92772)))))

(declare-fun c!33722 () Bool)

(assert (=> b!187730 (= c!33722 (= lt!92774 key!828))))

(declare-fun d!55361 () Bool)

(declare-fun lt!92773 () SeekEntryResult!653)

(assert (=> d!55361 (and (or ((_ is Undefined!653) lt!92773) (not ((_ is Found!653) lt!92773)) (and (bvsge (index!4783 lt!92773) #b00000000000000000000000000000000) (bvslt (index!4783 lt!92773) (size!4080 (_keys!5784 thiss!1248))))) (or ((_ is Undefined!653) lt!92773) ((_ is Found!653) lt!92773) (not ((_ is MissingZero!653) lt!92773)) (and (bvsge (index!4782 lt!92773) #b00000000000000000000000000000000) (bvslt (index!4782 lt!92773) (size!4080 (_keys!5784 thiss!1248))))) (or ((_ is Undefined!653) lt!92773) ((_ is Found!653) lt!92773) ((_ is MissingZero!653) lt!92773) (not ((_ is MissingVacant!653) lt!92773)) (and (bvsge (index!4785 lt!92773) #b00000000000000000000000000000000) (bvslt (index!4785 lt!92773) (size!4080 (_keys!5784 thiss!1248))))) (or ((_ is Undefined!653) lt!92773) (ite ((_ is Found!653) lt!92773) (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4783 lt!92773)) key!828) (ite ((_ is MissingZero!653) lt!92773) (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4782 lt!92773)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!653) lt!92773) (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4785 lt!92773)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55361 (= lt!92773 e!123558)))

(declare-fun c!33721 () Bool)

(assert (=> d!55361 (= c!33721 (and ((_ is Intermediate!653) lt!92772) (undefined!1465 lt!92772)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7973 (_ BitVec 32)) SeekEntryResult!653)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55361 (= lt!92772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8983 thiss!1248)) key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(assert (=> d!55361 (validMask!0 (mask!8983 thiss!1248))))

(assert (=> d!55361 (= (seekEntryOrOpen!0 key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)) lt!92773)))

(declare-fun e!123559 () SeekEntryResult!653)

(declare-fun b!187731 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7973 (_ BitVec 32)) SeekEntryResult!653)

(assert (=> b!187731 (= e!123559 (seekKeyOrZeroReturnVacant!0 (x!20312 lt!92772) (index!4784 lt!92772) (index!4784 lt!92772) key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(declare-fun b!187732 () Bool)

(declare-fun c!33720 () Bool)

(assert (=> b!187732 (= c!33720 (= lt!92774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187732 (= e!123560 e!123559)))

(declare-fun b!187733 () Bool)

(assert (=> b!187733 (= e!123559 (MissingZero!653 (index!4784 lt!92772)))))

(assert (= (and d!55361 c!33721) b!187729))

(assert (= (and d!55361 (not c!33721)) b!187730))

(assert (= (and b!187730 c!33722) b!187728))

(assert (= (and b!187730 (not c!33722)) b!187732))

(assert (= (and b!187732 c!33720) b!187733))

(assert (= (and b!187732 (not c!33720)) b!187731))

(declare-fun m!214009 () Bool)

(assert (=> b!187730 m!214009))

(declare-fun m!214011 () Bool)

(assert (=> d!55361 m!214011))

(declare-fun m!214013 () Bool)

(assert (=> d!55361 m!214013))

(declare-fun m!214015 () Bool)

(assert (=> d!55361 m!214015))

(declare-fun m!214017 () Bool)

(assert (=> d!55361 m!214017))

(assert (=> d!55361 m!213947))

(declare-fun m!214019 () Bool)

(assert (=> d!55361 m!214019))

(assert (=> d!55361 m!214015))

(declare-fun m!214021 () Bool)

(assert (=> b!187731 m!214021))

(assert (=> b!187640 d!55361))

(declare-fun d!55363 () Bool)

(declare-fun e!123563 () Bool)

(assert (=> d!55363 e!123563))

(declare-fun res!88728 () Bool)

(assert (=> d!55363 (=> (not res!88728) (not e!123563))))

(declare-fun lt!92780 () SeekEntryResult!653)

(assert (=> d!55363 (= res!88728 ((_ is Found!653) lt!92780))))

(assert (=> d!55363 (= lt!92780 (seekEntryOrOpen!0 key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(declare-fun lt!92779 () Unit!5627)

(declare-fun choose!1008 (array!7973 array!7975 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 64) Int) Unit!5627)

(assert (=> d!55363 (= lt!92779 (choose!1008 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)))))

(assert (=> d!55363 (validMask!0 (mask!8983 thiss!1248))))

(assert (=> d!55363 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!151 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)) lt!92779)))

(declare-fun b!187738 () Bool)

(declare-fun res!88727 () Bool)

(assert (=> b!187738 (=> (not res!88727) (not e!123563))))

(assert (=> b!187738 (= res!88727 (inRange!0 (index!4783 lt!92780) (mask!8983 thiss!1248)))))

(declare-fun b!187739 () Bool)

(assert (=> b!187739 (= e!123563 (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4783 lt!92780)) key!828))))

(assert (=> b!187739 (and (bvsge (index!4783 lt!92780) #b00000000000000000000000000000000) (bvslt (index!4783 lt!92780) (size!4080 (_keys!5784 thiss!1248))))))

(assert (= (and d!55363 res!88728) b!187738))

(assert (= (and b!187738 res!88727) b!187739))

(assert (=> d!55363 m!213955))

(declare-fun m!214023 () Bool)

(assert (=> d!55363 m!214023))

(assert (=> d!55363 m!213947))

(declare-fun m!214025 () Bool)

(assert (=> b!187738 m!214025))

(declare-fun m!214027 () Bool)

(assert (=> b!187739 m!214027))

(assert (=> b!187641 d!55363))

(declare-fun d!55365 () Bool)

(assert (=> d!55365 (= (inRange!0 (index!4783 lt!92741) (mask!8983 thiss!1248)) (and (bvsge (index!4783 lt!92741) #b00000000000000000000000000000000) (bvslt (index!4783 lt!92741) (bvadd (mask!8983 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187641 d!55365))

(declare-fun d!55367 () Bool)

(assert (=> d!55367 (= (validMask!0 (mask!8983 thiss!1248)) (and (or (= (mask!8983 thiss!1248) #b00000000000000000000000000000111) (= (mask!8983 thiss!1248) #b00000000000000000000000000001111) (= (mask!8983 thiss!1248) #b00000000000000000000000000011111) (= (mask!8983 thiss!1248) #b00000000000000000000000000111111) (= (mask!8983 thiss!1248) #b00000000000000000000000001111111) (= (mask!8983 thiss!1248) #b00000000000000000000000011111111) (= (mask!8983 thiss!1248) #b00000000000000000000000111111111) (= (mask!8983 thiss!1248) #b00000000000000000000001111111111) (= (mask!8983 thiss!1248) #b00000000000000000000011111111111) (= (mask!8983 thiss!1248) #b00000000000000000000111111111111) (= (mask!8983 thiss!1248) #b00000000000000000001111111111111) (= (mask!8983 thiss!1248) #b00000000000000000011111111111111) (= (mask!8983 thiss!1248) #b00000000000000000111111111111111) (= (mask!8983 thiss!1248) #b00000000000000001111111111111111) (= (mask!8983 thiss!1248) #b00000000000000011111111111111111) (= (mask!8983 thiss!1248) #b00000000000000111111111111111111) (= (mask!8983 thiss!1248) #b00000000000001111111111111111111) (= (mask!8983 thiss!1248) #b00000000000011111111111111111111) (= (mask!8983 thiss!1248) #b00000000000111111111111111111111) (= (mask!8983 thiss!1248) #b00000000001111111111111111111111) (= (mask!8983 thiss!1248) #b00000000011111111111111111111111) (= (mask!8983 thiss!1248) #b00000000111111111111111111111111) (= (mask!8983 thiss!1248) #b00000001111111111111111111111111) (= (mask!8983 thiss!1248) #b00000011111111111111111111111111) (= (mask!8983 thiss!1248) #b00000111111111111111111111111111) (= (mask!8983 thiss!1248) #b00001111111111111111111111111111) (= (mask!8983 thiss!1248) #b00011111111111111111111111111111) (= (mask!8983 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8983 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!187646 d!55367))

(declare-fun d!55369 () Bool)

(declare-fun e!123568 () Bool)

(assert (=> d!55369 e!123568))

(declare-fun res!88731 () Bool)

(assert (=> d!55369 (=> res!88731 e!123568)))

(declare-fun lt!92791 () Bool)

(assert (=> d!55369 (= res!88731 (not lt!92791))))

(declare-fun lt!92792 () Bool)

(assert (=> d!55369 (= lt!92791 lt!92792)))

(declare-fun lt!92789 () Unit!5627)

(declare-fun e!123569 () Unit!5627)

(assert (=> d!55369 (= lt!92789 e!123569)))

(declare-fun c!33725 () Bool)

(assert (=> d!55369 (= c!33725 lt!92792)))

(declare-fun containsKey!231 (List!2373 (_ BitVec 64)) Bool)

(assert (=> d!55369 (= lt!92792 (containsKey!231 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(assert (=> d!55369 (= (contains!1301 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)) key!828) lt!92791)))

(declare-fun b!187746 () Bool)

(declare-fun lt!92790 () Unit!5627)

(assert (=> b!187746 (= e!123569 lt!92790)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!180 (List!2373 (_ BitVec 64)) Unit!5627)

(assert (=> b!187746 (= lt!92790 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(declare-datatypes ((Option!233 0))(
  ( (Some!232 (v!4151 V!5497)) (None!231) )
))
(declare-fun isDefined!181 (Option!233) Bool)

(declare-fun getValueByKey!227 (List!2373 (_ BitVec 64)) Option!233)

(assert (=> b!187746 (isDefined!181 (getValueByKey!227 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(declare-fun b!187747 () Bool)

(declare-fun Unit!5633 () Unit!5627)

(assert (=> b!187747 (= e!123569 Unit!5633)))

(declare-fun b!187748 () Bool)

(assert (=> b!187748 (= e!123568 (isDefined!181 (getValueByKey!227 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828)))))

(assert (= (and d!55369 c!33725) b!187746))

(assert (= (and d!55369 (not c!33725)) b!187747))

(assert (= (and d!55369 (not res!88731)) b!187748))

(declare-fun m!214029 () Bool)

(assert (=> d!55369 m!214029))

(declare-fun m!214031 () Bool)

(assert (=> b!187746 m!214031))

(declare-fun m!214033 () Bool)

(assert (=> b!187746 m!214033))

(assert (=> b!187746 m!214033))

(declare-fun m!214035 () Bool)

(assert (=> b!187746 m!214035))

(assert (=> b!187748 m!214033))

(assert (=> b!187748 m!214033))

(assert (=> b!187748 m!214035))

(assert (=> b!187646 d!55369))

(declare-fun b!187791 () Bool)

(declare-fun e!123605 () Unit!5627)

(declare-fun lt!92838 () Unit!5627)

(assert (=> b!187791 (= e!123605 lt!92838)))

(declare-fun lt!92837 () ListLongMap!2355)

(declare-fun getCurrentListMapNoExtraKeys!193 (array!7973 array!7975 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 32) Int) ListLongMap!2355)

(assert (=> b!187791 (= lt!92837 (getCurrentListMapNoExtraKeys!193 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))

(declare-fun lt!92847 () (_ BitVec 64))

(assert (=> b!187791 (= lt!92847 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92858 () (_ BitVec 64))

(assert (=> b!187791 (= lt!92858 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92845 () Unit!5627)

(declare-fun addStillContains!148 (ListLongMap!2355 (_ BitVec 64) V!5497 (_ BitVec 64)) Unit!5627)

(assert (=> b!187791 (= lt!92845 (addStillContains!148 lt!92837 lt!92847 (zeroValue!3671 thiss!1248) lt!92858))))

(declare-fun +!289 (ListLongMap!2355 tuple2!3446) ListLongMap!2355)

(assert (=> b!187791 (contains!1301 (+!289 lt!92837 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248))) lt!92858)))

(declare-fun lt!92839 () Unit!5627)

(assert (=> b!187791 (= lt!92839 lt!92845)))

(declare-fun lt!92852 () ListLongMap!2355)

(assert (=> b!187791 (= lt!92852 (getCurrentListMapNoExtraKeys!193 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))

(declare-fun lt!92842 () (_ BitVec 64))

(assert (=> b!187791 (= lt!92842 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92841 () (_ BitVec 64))

(assert (=> b!187791 (= lt!92841 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92849 () Unit!5627)

(declare-fun addApplyDifferent!148 (ListLongMap!2355 (_ BitVec 64) V!5497 (_ BitVec 64)) Unit!5627)

(assert (=> b!187791 (= lt!92849 (addApplyDifferent!148 lt!92852 lt!92842 (minValue!3671 thiss!1248) lt!92841))))

(declare-fun apply!172 (ListLongMap!2355 (_ BitVec 64)) V!5497)

(assert (=> b!187791 (= (apply!172 (+!289 lt!92852 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248))) lt!92841) (apply!172 lt!92852 lt!92841))))

(declare-fun lt!92851 () Unit!5627)

(assert (=> b!187791 (= lt!92851 lt!92849)))

(declare-fun lt!92857 () ListLongMap!2355)

(assert (=> b!187791 (= lt!92857 (getCurrentListMapNoExtraKeys!193 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))

(declare-fun lt!92854 () (_ BitVec 64))

(assert (=> b!187791 (= lt!92854 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92856 () (_ BitVec 64))

(assert (=> b!187791 (= lt!92856 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92840 () Unit!5627)

(assert (=> b!187791 (= lt!92840 (addApplyDifferent!148 lt!92857 lt!92854 (zeroValue!3671 thiss!1248) lt!92856))))

(assert (=> b!187791 (= (apply!172 (+!289 lt!92857 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248))) lt!92856) (apply!172 lt!92857 lt!92856))))

(declare-fun lt!92844 () Unit!5627)

(assert (=> b!187791 (= lt!92844 lt!92840)))

(declare-fun lt!92850 () ListLongMap!2355)

(assert (=> b!187791 (= lt!92850 (getCurrentListMapNoExtraKeys!193 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))

(declare-fun lt!92846 () (_ BitVec 64))

(assert (=> b!187791 (= lt!92846 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92853 () (_ BitVec 64))

(assert (=> b!187791 (= lt!92853 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187791 (= lt!92838 (addApplyDifferent!148 lt!92850 lt!92846 (minValue!3671 thiss!1248) lt!92853))))

(assert (=> b!187791 (= (apply!172 (+!289 lt!92850 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248))) lt!92853) (apply!172 lt!92850 lt!92853))))

(declare-fun b!187792 () Bool)

(declare-fun e!123604 () ListLongMap!2355)

(declare-fun call!18920 () ListLongMap!2355)

(assert (=> b!187792 (= e!123604 call!18920)))

(declare-fun b!187793 () Bool)

(declare-fun e!123596 () Bool)

(declare-fun e!123599 () Bool)

(assert (=> b!187793 (= e!123596 e!123599)))

(declare-fun res!88751 () Bool)

(declare-fun call!18919 () Bool)

(assert (=> b!187793 (= res!88751 call!18919)))

(assert (=> b!187793 (=> (not res!88751) (not e!123599))))

(declare-fun b!187794 () Bool)

(declare-fun res!88755 () Bool)

(declare-fun e!123608 () Bool)

(assert (=> b!187794 (=> (not res!88755) (not e!123608))))

(declare-fun e!123607 () Bool)

(assert (=> b!187794 (= res!88755 e!123607)))

(declare-fun res!88758 () Bool)

(assert (=> b!187794 (=> res!88758 e!123607)))

(declare-fun e!123602 () Bool)

(assert (=> b!187794 (= res!88758 (not e!123602))))

(declare-fun res!88754 () Bool)

(assert (=> b!187794 (=> (not res!88754) (not e!123602))))

(assert (=> b!187794 (= res!88754 (bvslt #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun b!187795 () Bool)

(declare-fun lt!92848 () ListLongMap!2355)

(assert (=> b!187795 (= e!123599 (= (apply!172 lt!92848 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3671 thiss!1248)))))

(declare-fun bm!18916 () Bool)

(declare-fun call!18925 () ListLongMap!2355)

(declare-fun call!18922 () ListLongMap!2355)

(assert (=> bm!18916 (= call!18925 call!18922)))

(declare-fun b!187796 () Bool)

(declare-fun e!123598 () Bool)

(declare-fun call!18924 () Bool)

(assert (=> b!187796 (= e!123598 (not call!18924))))

(declare-fun b!187797 () Bool)

(declare-fun e!123603 () Bool)

(declare-fun get!2166 (ValueCell!1850 V!5497) V!5497)

(declare-fun dynLambda!506 (Int (_ BitVec 64)) V!5497)

(assert (=> b!187797 (= e!123603 (= (apply!172 lt!92848 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)) (get!2166 (select (arr!3761 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4081 (_values!3813 thiss!1248))))))

(assert (=> b!187797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun b!187798 () Bool)

(assert (=> b!187798 (= e!123604 call!18925)))

(declare-fun b!187799 () Bool)

(declare-fun e!123600 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!187799 (= e!123600 (validKeyInArray!0 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18917 () Bool)

(declare-fun call!18921 () ListLongMap!2355)

(declare-fun call!18923 () ListLongMap!2355)

(assert (=> bm!18917 (= call!18921 call!18923)))

(declare-fun bm!18918 () Bool)

(assert (=> bm!18918 (= call!18923 (getCurrentListMapNoExtraKeys!193 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))

(declare-fun b!187800 () Bool)

(assert (=> b!187800 (= e!123607 e!123603)))

(declare-fun res!88756 () Bool)

(assert (=> b!187800 (=> (not res!88756) (not e!123603))))

(assert (=> b!187800 (= res!88756 (contains!1301 lt!92848 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187800 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun b!187801 () Bool)

(declare-fun e!123601 () ListLongMap!2355)

(assert (=> b!187801 (= e!123601 call!18925)))

(declare-fun b!187802 () Bool)

(assert (=> b!187802 (= e!123602 (validKeyInArray!0 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187803 () Bool)

(declare-fun Unit!5634 () Unit!5627)

(assert (=> b!187803 (= e!123605 Unit!5634)))

(declare-fun bm!18919 () Bool)

(assert (=> bm!18919 (= call!18924 (contains!1301 lt!92848 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187804 () Bool)

(declare-fun e!123606 () ListLongMap!2355)

(assert (=> b!187804 (= e!123606 e!123601)))

(declare-fun c!33739 () Bool)

(assert (=> b!187804 (= c!33739 (and (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18920 () Bool)

(assert (=> bm!18920 (= call!18919 (contains!1301 lt!92848 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187805 () Bool)

(declare-fun res!88750 () Bool)

(assert (=> b!187805 (=> (not res!88750) (not e!123608))))

(assert (=> b!187805 (= res!88750 e!123598)))

(declare-fun c!33740 () Bool)

(assert (=> b!187805 (= c!33740 (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!33743 () Bool)

(declare-fun bm!18921 () Bool)

(assert (=> bm!18921 (= call!18922 (+!289 (ite c!33743 call!18923 (ite c!33739 call!18921 call!18920)) (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(declare-fun b!187806 () Bool)

(assert (=> b!187806 (= e!123596 (not call!18919))))

(declare-fun b!187807 () Bool)

(declare-fun e!123597 () Bool)

(assert (=> b!187807 (= e!123598 e!123597)))

(declare-fun res!88757 () Bool)

(assert (=> b!187807 (= res!88757 call!18924)))

(assert (=> b!187807 (=> (not res!88757) (not e!123597))))

(declare-fun d!55371 () Bool)

(assert (=> d!55371 e!123608))

(declare-fun res!88753 () Bool)

(assert (=> d!55371 (=> (not res!88753) (not e!123608))))

(assert (=> d!55371 (= res!88753 (or (bvsge #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))))

(declare-fun lt!92855 () ListLongMap!2355)

(assert (=> d!55371 (= lt!92848 lt!92855)))

(declare-fun lt!92843 () Unit!5627)

(assert (=> d!55371 (= lt!92843 e!123605)))

(declare-fun c!33742 () Bool)

(assert (=> d!55371 (= c!33742 e!123600)))

(declare-fun res!88752 () Bool)

(assert (=> d!55371 (=> (not res!88752) (not e!123600))))

(assert (=> d!55371 (= res!88752 (bvslt #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(assert (=> d!55371 (= lt!92855 e!123606)))

(assert (=> d!55371 (= c!33743 (and (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55371 (validMask!0 (mask!8983 thiss!1248))))

(assert (=> d!55371 (= (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)) lt!92848)))

(declare-fun b!187808 () Bool)

(assert (=> b!187808 (= e!123597 (= (apply!172 lt!92848 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3671 thiss!1248)))))

(declare-fun b!187809 () Bool)

(assert (=> b!187809 (= e!123608 e!123596)))

(declare-fun c!33738 () Bool)

(assert (=> b!187809 (= c!33738 (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18922 () Bool)

(assert (=> bm!18922 (= call!18920 call!18921)))

(declare-fun b!187810 () Bool)

(assert (=> b!187810 (= e!123606 (+!289 call!18922 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))

(declare-fun b!187811 () Bool)

(declare-fun c!33741 () Bool)

(assert (=> b!187811 (= c!33741 (and (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!187811 (= e!123601 e!123604)))

(assert (= (and d!55371 c!33743) b!187810))

(assert (= (and d!55371 (not c!33743)) b!187804))

(assert (= (and b!187804 c!33739) b!187801))

(assert (= (and b!187804 (not c!33739)) b!187811))

(assert (= (and b!187811 c!33741) b!187798))

(assert (= (and b!187811 (not c!33741)) b!187792))

(assert (= (or b!187798 b!187792) bm!18922))

(assert (= (or b!187801 bm!18922) bm!18917))

(assert (= (or b!187801 b!187798) bm!18916))

(assert (= (or b!187810 bm!18917) bm!18918))

(assert (= (or b!187810 bm!18916) bm!18921))

(assert (= (and d!55371 res!88752) b!187799))

(assert (= (and d!55371 c!33742) b!187791))

(assert (= (and d!55371 (not c!33742)) b!187803))

(assert (= (and d!55371 res!88753) b!187794))

(assert (= (and b!187794 res!88754) b!187802))

(assert (= (and b!187794 (not res!88758)) b!187800))

(assert (= (and b!187800 res!88756) b!187797))

(assert (= (and b!187794 res!88755) b!187805))

(assert (= (and b!187805 c!33740) b!187807))

(assert (= (and b!187805 (not c!33740)) b!187796))

(assert (= (and b!187807 res!88757) b!187808))

(assert (= (or b!187807 b!187796) bm!18919))

(assert (= (and b!187805 res!88750) b!187809))

(assert (= (and b!187809 c!33738) b!187793))

(assert (= (and b!187809 (not c!33738)) b!187806))

(assert (= (and b!187793 res!88751) b!187795))

(assert (= (or b!187793 b!187806) bm!18920))

(declare-fun b_lambda!7281 () Bool)

(assert (=> (not b_lambda!7281) (not b!187797)))

(declare-fun t!7261 () Bool)

(declare-fun tb!2847 () Bool)

(assert (=> (and b!187645 (= (defaultEntry!3830 thiss!1248) (defaultEntry!3830 thiss!1248)) t!7261) tb!2847))

(declare-fun result!4835 () Bool)

(assert (=> tb!2847 (= result!4835 tp_is_empty!4387)))

(assert (=> b!187797 t!7261))

(declare-fun b_and!11219 () Bool)

(assert (= b_and!11213 (and (=> t!7261 result!4835) b_and!11219)))

(declare-fun m!214037 () Bool)

(assert (=> b!187799 m!214037))

(assert (=> b!187799 m!214037))

(declare-fun m!214039 () Bool)

(assert (=> b!187799 m!214039))

(declare-fun m!214041 () Bool)

(assert (=> bm!18921 m!214041))

(declare-fun m!214043 () Bool)

(assert (=> b!187808 m!214043))

(assert (=> b!187802 m!214037))

(assert (=> b!187802 m!214037))

(assert (=> b!187802 m!214039))

(declare-fun m!214045 () Bool)

(assert (=> bm!18920 m!214045))

(assert (=> b!187797 m!214037))

(declare-fun m!214047 () Bool)

(assert (=> b!187797 m!214047))

(declare-fun m!214049 () Bool)

(assert (=> b!187797 m!214049))

(assert (=> b!187797 m!214037))

(declare-fun m!214051 () Bool)

(assert (=> b!187797 m!214051))

(assert (=> b!187797 m!214051))

(assert (=> b!187797 m!214049))

(declare-fun m!214053 () Bool)

(assert (=> b!187797 m!214053))

(declare-fun m!214055 () Bool)

(assert (=> bm!18918 m!214055))

(declare-fun m!214057 () Bool)

(assert (=> b!187810 m!214057))

(assert (=> b!187800 m!214037))

(assert (=> b!187800 m!214037))

(declare-fun m!214059 () Bool)

(assert (=> b!187800 m!214059))

(assert (=> b!187791 m!214055))

(declare-fun m!214061 () Bool)

(assert (=> b!187791 m!214061))

(declare-fun m!214063 () Bool)

(assert (=> b!187791 m!214063))

(declare-fun m!214065 () Bool)

(assert (=> b!187791 m!214065))

(declare-fun m!214067 () Bool)

(assert (=> b!187791 m!214067))

(declare-fun m!214069 () Bool)

(assert (=> b!187791 m!214069))

(declare-fun m!214071 () Bool)

(assert (=> b!187791 m!214071))

(declare-fun m!214073 () Bool)

(assert (=> b!187791 m!214073))

(assert (=> b!187791 m!214063))

(assert (=> b!187791 m!214067))

(declare-fun m!214075 () Bool)

(assert (=> b!187791 m!214075))

(declare-fun m!214077 () Bool)

(assert (=> b!187791 m!214077))

(declare-fun m!214079 () Bool)

(assert (=> b!187791 m!214079))

(declare-fun m!214081 () Bool)

(assert (=> b!187791 m!214081))

(declare-fun m!214083 () Bool)

(assert (=> b!187791 m!214083))

(assert (=> b!187791 m!214037))

(assert (=> b!187791 m!214071))

(declare-fun m!214085 () Bool)

(assert (=> b!187791 m!214085))

(declare-fun m!214087 () Bool)

(assert (=> b!187791 m!214087))

(assert (=> b!187791 m!214081))

(declare-fun m!214089 () Bool)

(assert (=> b!187791 m!214089))

(declare-fun m!214091 () Bool)

(assert (=> bm!18919 m!214091))

(assert (=> d!55371 m!213947))

(declare-fun m!214093 () Bool)

(assert (=> b!187795 m!214093))

(assert (=> b!187646 d!55371))

(declare-fun b!187830 () Bool)

(declare-fun e!123620 () Bool)

(declare-fun lt!92864 () SeekEntryResult!653)

(assert (=> b!187830 (= e!123620 ((_ is Undefined!653) lt!92864))))

(declare-fun b!187831 () Bool)

(assert (=> b!187831 (and (bvsge (index!4782 lt!92864) #b00000000000000000000000000000000) (bvslt (index!4782 lt!92864) (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun res!88767 () Bool)

(assert (=> b!187831 (= res!88767 (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4782 lt!92864)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123617 () Bool)

(assert (=> b!187831 (=> (not res!88767) (not e!123617))))

(declare-fun b!187832 () Bool)

(declare-fun call!18930 () Bool)

(assert (=> b!187832 (= e!123617 (not call!18930))))

(declare-fun bm!18927 () Bool)

(declare-fun arrayContainsKey!0 (array!7973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18927 (= call!18930 (arrayContainsKey!0 (_keys!5784 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!187833 () Bool)

(declare-fun e!123618 () Bool)

(assert (=> b!187833 (= e!123618 (not call!18930))))

(declare-fun b!187834 () Bool)

(declare-fun e!123619 () Bool)

(assert (=> b!187834 (= e!123619 e!123620)))

(declare-fun c!33748 () Bool)

(assert (=> b!187834 (= c!33748 ((_ is MissingVacant!653) lt!92864))))

(declare-fun c!33749 () Bool)

(declare-fun bm!18928 () Bool)

(declare-fun call!18931 () Bool)

(assert (=> bm!18928 (= call!18931 (inRange!0 (ite c!33749 (index!4782 lt!92864) (index!4785 lt!92864)) (mask!8983 thiss!1248)))))

(declare-fun b!187835 () Bool)

(assert (=> b!187835 (= e!123619 e!123617)))

(declare-fun res!88770 () Bool)

(assert (=> b!187835 (= res!88770 call!18931)))

(assert (=> b!187835 (=> (not res!88770) (not e!123617))))

(declare-fun d!55373 () Bool)

(assert (=> d!55373 e!123619))

(assert (=> d!55373 (= c!33749 ((_ is MissingZero!653) lt!92864))))

(assert (=> d!55373 (= lt!92864 (seekEntryOrOpen!0 key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(declare-fun lt!92863 () Unit!5627)

(declare-fun choose!1009 (array!7973 array!7975 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 64) Int) Unit!5627)

(assert (=> d!55373 (= lt!92863 (choose!1009 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)))))

(assert (=> d!55373 (validMask!0 (mask!8983 thiss!1248))))

(assert (=> d!55373 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!149 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)) lt!92863)))

(declare-fun b!187836 () Bool)

(declare-fun res!88768 () Bool)

(assert (=> b!187836 (=> (not res!88768) (not e!123618))))

(assert (=> b!187836 (= res!88768 (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4785 lt!92864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187836 (and (bvsge (index!4785 lt!92864) #b00000000000000000000000000000000) (bvslt (index!4785 lt!92864) (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun b!187837 () Bool)

(declare-fun res!88769 () Bool)

(assert (=> b!187837 (=> (not res!88769) (not e!123618))))

(assert (=> b!187837 (= res!88769 call!18931)))

(assert (=> b!187837 (= e!123620 e!123618)))

(assert (= (and d!55373 c!33749) b!187835))

(assert (= (and d!55373 (not c!33749)) b!187834))

(assert (= (and b!187835 res!88770) b!187831))

(assert (= (and b!187831 res!88767) b!187832))

(assert (= (and b!187834 c!33748) b!187837))

(assert (= (and b!187834 (not c!33748)) b!187830))

(assert (= (and b!187837 res!88769) b!187836))

(assert (= (and b!187836 res!88768) b!187833))

(assert (= (or b!187835 b!187837) bm!18928))

(assert (= (or b!187832 b!187833) bm!18927))

(declare-fun m!214095 () Bool)

(assert (=> b!187831 m!214095))

(assert (=> d!55373 m!213955))

(declare-fun m!214097 () Bool)

(assert (=> d!55373 m!214097))

(assert (=> d!55373 m!213947))

(declare-fun m!214099 () Bool)

(assert (=> bm!18927 m!214099))

(declare-fun m!214101 () Bool)

(assert (=> bm!18928 m!214101))

(declare-fun m!214103 () Bool)

(assert (=> b!187836 m!214103))

(assert (=> b!187647 d!55373))

(declare-fun d!55375 () Bool)

(declare-fun res!88777 () Bool)

(declare-fun e!123623 () Bool)

(assert (=> d!55375 (=> (not res!88777) (not e!123623))))

(declare-fun simpleValid!188 (LongMapFixedSize!2608) Bool)

(assert (=> d!55375 (= res!88777 (simpleValid!188 thiss!1248))))

(assert (=> d!55375 (= (valid!1093 thiss!1248) e!123623)))

(declare-fun b!187844 () Bool)

(declare-fun res!88778 () Bool)

(assert (=> b!187844 (=> (not res!88778) (not e!123623))))

(declare-fun arrayCountValidKeys!0 (array!7973 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187844 (= res!88778 (= (arrayCountValidKeys!0 (_keys!5784 thiss!1248) #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))) (_size!1353 thiss!1248)))))

(declare-fun b!187845 () Bool)

(declare-fun res!88779 () Bool)

(assert (=> b!187845 (=> (not res!88779) (not e!123623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7973 (_ BitVec 32)) Bool)

(assert (=> b!187845 (= res!88779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(declare-fun b!187846 () Bool)

(declare-datatypes ((List!2375 0))(
  ( (Nil!2372) (Cons!2371 (h!3007 (_ BitVec 64)) (t!7262 List!2375)) )
))
(declare-fun arrayNoDuplicates!0 (array!7973 (_ BitVec 32) List!2375) Bool)

(assert (=> b!187846 (= e!123623 (arrayNoDuplicates!0 (_keys!5784 thiss!1248) #b00000000000000000000000000000000 Nil!2372))))

(assert (= (and d!55375 res!88777) b!187844))

(assert (= (and b!187844 res!88778) b!187845))

(assert (= (and b!187845 res!88779) b!187846))

(declare-fun m!214105 () Bool)

(assert (=> d!55375 m!214105))

(declare-fun m!214107 () Bool)

(assert (=> b!187844 m!214107))

(declare-fun m!214109 () Bool)

(assert (=> b!187845 m!214109))

(declare-fun m!214111 () Bool)

(assert (=> b!187846 m!214111))

(assert (=> start!19070 d!55375))

(declare-fun mapIsEmpty!7569 () Bool)

(declare-fun mapRes!7569 () Bool)

(assert (=> mapIsEmpty!7569 mapRes!7569))

(declare-fun b!187854 () Bool)

(declare-fun e!123628 () Bool)

(assert (=> b!187854 (= e!123628 tp_is_empty!4387)))

(declare-fun b!187853 () Bool)

(declare-fun e!123629 () Bool)

(assert (=> b!187853 (= e!123629 tp_is_empty!4387)))

(declare-fun mapNonEmpty!7569 () Bool)

(declare-fun tp!16677 () Bool)

(assert (=> mapNonEmpty!7569 (= mapRes!7569 (and tp!16677 e!123629))))

(declare-fun mapRest!7569 () (Array (_ BitVec 32) ValueCell!1850))

(declare-fun mapKey!7569 () (_ BitVec 32))

(declare-fun mapValue!7569 () ValueCell!1850)

(assert (=> mapNonEmpty!7569 (= mapRest!7560 (store mapRest!7569 mapKey!7569 mapValue!7569))))

(declare-fun condMapEmpty!7569 () Bool)

(declare-fun mapDefault!7569 () ValueCell!1850)

(assert (=> mapNonEmpty!7560 (= condMapEmpty!7569 (= mapRest!7560 ((as const (Array (_ BitVec 32) ValueCell!1850)) mapDefault!7569)))))

(assert (=> mapNonEmpty!7560 (= tp!16662 (and e!123628 mapRes!7569))))

(assert (= (and mapNonEmpty!7560 condMapEmpty!7569) mapIsEmpty!7569))

(assert (= (and mapNonEmpty!7560 (not condMapEmpty!7569)) mapNonEmpty!7569))

(assert (= (and mapNonEmpty!7569 ((_ is ValueCellFull!1850) mapValue!7569)) b!187853))

(assert (= (and mapNonEmpty!7560 ((_ is ValueCellFull!1850) mapDefault!7569)) b!187854))

(declare-fun m!214113 () Bool)

(assert (=> mapNonEmpty!7569 m!214113))

(declare-fun b_lambda!7283 () Bool)

(assert (= b_lambda!7281 (or (and b!187645 b_free!4615) b_lambda!7283)))

(check-sat (not b_lambda!7283) (not bm!18921) (not d!55375) (not b!187738) (not b!187846) (not b!187797) (not b!187802) (not b!187748) (not b_next!4615) (not b!187810) (not b!187800) (not b!187791) (not b!187746) (not d!55371) (not d!55369) (not bm!18919) (not d!55361) (not b!187795) (not b!187845) (not bm!18928) (not d!55373) (not mapNonEmpty!7569) (not d!55363) (not bm!18927) (not bm!18920) tp_is_empty!4387 (not bm!18918) (not b!187799) (not b!187808) (not b!187844) b_and!11219 (not b!187731))
(check-sat b_and!11219 (not b_next!4615))
(get-model)

(declare-fun d!55377 () Bool)

(declare-fun e!123630 () Bool)

(assert (=> d!55377 e!123630))

(declare-fun res!88780 () Bool)

(assert (=> d!55377 (=> res!88780 e!123630)))

(declare-fun lt!92867 () Bool)

(assert (=> d!55377 (= res!88780 (not lt!92867))))

(declare-fun lt!92868 () Bool)

(assert (=> d!55377 (= lt!92867 lt!92868)))

(declare-fun lt!92865 () Unit!5627)

(declare-fun e!123631 () Unit!5627)

(assert (=> d!55377 (= lt!92865 e!123631)))

(declare-fun c!33750 () Bool)

(assert (=> d!55377 (= c!33750 lt!92868)))

(assert (=> d!55377 (= lt!92868 (containsKey!231 (toList!1193 lt!92848) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55377 (= (contains!1301 lt!92848 #b0000000000000000000000000000000000000000000000000000000000000000) lt!92867)))

(declare-fun b!187855 () Bool)

(declare-fun lt!92866 () Unit!5627)

(assert (=> b!187855 (= e!123631 lt!92866)))

(assert (=> b!187855 (= lt!92866 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1193 lt!92848) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187855 (isDefined!181 (getValueByKey!227 (toList!1193 lt!92848) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187856 () Bool)

(declare-fun Unit!5635 () Unit!5627)

(assert (=> b!187856 (= e!123631 Unit!5635)))

(declare-fun b!187857 () Bool)

(assert (=> b!187857 (= e!123630 (isDefined!181 (getValueByKey!227 (toList!1193 lt!92848) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55377 c!33750) b!187855))

(assert (= (and d!55377 (not c!33750)) b!187856))

(assert (= (and d!55377 (not res!88780)) b!187857))

(declare-fun m!214115 () Bool)

(assert (=> d!55377 m!214115))

(declare-fun m!214117 () Bool)

(assert (=> b!187855 m!214117))

(declare-fun m!214119 () Bool)

(assert (=> b!187855 m!214119))

(assert (=> b!187855 m!214119))

(declare-fun m!214121 () Bool)

(assert (=> b!187855 m!214121))

(assert (=> b!187857 m!214119))

(assert (=> b!187857 m!214119))

(assert (=> b!187857 m!214121))

(assert (=> bm!18919 d!55377))

(assert (=> d!55373 d!55361))

(declare-fun b!187874 () Bool)

(declare-fun e!123640 () Bool)

(declare-fun call!18937 () Bool)

(assert (=> b!187874 (= e!123640 (not call!18937))))

(declare-fun b!187875 () Bool)

(declare-fun res!88791 () Bool)

(declare-fun lt!92871 () SeekEntryResult!653)

(assert (=> b!187875 (= res!88791 (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4782 lt!92871)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187875 (=> (not res!88791) (not e!123640))))

(declare-fun c!33755 () Bool)

(declare-fun call!18936 () Bool)

(declare-fun bm!18933 () Bool)

(assert (=> bm!18933 (= call!18936 (inRange!0 (ite c!33755 (index!4782 lt!92871) (index!4785 lt!92871)) (mask!8983 thiss!1248)))))

(declare-fun b!187876 () Bool)

(declare-fun e!123641 () Bool)

(assert (=> b!187876 (= e!123641 e!123640)))

(declare-fun res!88792 () Bool)

(assert (=> b!187876 (= res!88792 call!18936)))

(assert (=> b!187876 (=> (not res!88792) (not e!123640))))

(declare-fun b!187877 () Bool)

(declare-fun res!88790 () Bool)

(declare-fun e!123643 () Bool)

(assert (=> b!187877 (=> (not res!88790) (not e!123643))))

(assert (=> b!187877 (= res!88790 (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4785 lt!92871)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187878 () Bool)

(declare-fun e!123642 () Bool)

(assert (=> b!187878 (= e!123642 ((_ is Undefined!653) lt!92871))))

(declare-fun d!55379 () Bool)

(assert (=> d!55379 e!123641))

(assert (=> d!55379 (= c!33755 ((_ is MissingZero!653) lt!92871))))

(assert (=> d!55379 (= lt!92871 (seekEntryOrOpen!0 key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(assert (=> d!55379 true))

(declare-fun _$34!1072 () Unit!5627)

(assert (=> d!55379 (= (choose!1009 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)) _$34!1072)))

(declare-fun b!187879 () Bool)

(assert (=> b!187879 (= e!123643 (not call!18937))))

(declare-fun bm!18934 () Bool)

(assert (=> bm!18934 (= call!18937 (arrayContainsKey!0 (_keys!5784 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!187880 () Bool)

(assert (=> b!187880 (= e!123641 e!123642)))

(declare-fun c!33756 () Bool)

(assert (=> b!187880 (= c!33756 ((_ is MissingVacant!653) lt!92871))))

(declare-fun b!187881 () Bool)

(declare-fun res!88789 () Bool)

(assert (=> b!187881 (=> (not res!88789) (not e!123643))))

(assert (=> b!187881 (= res!88789 call!18936)))

(assert (=> b!187881 (= e!123642 e!123643)))

(assert (= (and d!55379 c!33755) b!187876))

(assert (= (and d!55379 (not c!33755)) b!187880))

(assert (= (and b!187876 res!88792) b!187875))

(assert (= (and b!187875 res!88791) b!187874))

(assert (= (and b!187880 c!33756) b!187881))

(assert (= (and b!187880 (not c!33756)) b!187878))

(assert (= (and b!187881 res!88789) b!187877))

(assert (= (and b!187877 res!88790) b!187879))

(assert (= (or b!187876 b!187881) bm!18933))

(assert (= (or b!187874 b!187879) bm!18934))

(assert (=> bm!18934 m!214099))

(declare-fun m!214123 () Bool)

(assert (=> b!187875 m!214123))

(declare-fun m!214125 () Bool)

(assert (=> bm!18933 m!214125))

(declare-fun m!214127 () Bool)

(assert (=> b!187877 m!214127))

(assert (=> d!55379 m!213955))

(assert (=> d!55373 d!55379))

(assert (=> d!55373 d!55367))

(declare-fun d!55381 () Bool)

(declare-fun res!88797 () Bool)

(declare-fun e!123648 () Bool)

(assert (=> d!55381 (=> res!88797 e!123648)))

(assert (=> d!55381 (= res!88797 (and ((_ is Cons!2369) (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) (= (_1!1734 (h!3005 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) key!828)))))

(assert (=> d!55381 (= (containsKey!231 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828) e!123648)))

(declare-fun b!187886 () Bool)

(declare-fun e!123649 () Bool)

(assert (=> b!187886 (= e!123648 e!123649)))

(declare-fun res!88798 () Bool)

(assert (=> b!187886 (=> (not res!88798) (not e!123649))))

(assert (=> b!187886 (= res!88798 (and (or (not ((_ is Cons!2369) (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) (bvsle (_1!1734 (h!3005 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) key!828)) ((_ is Cons!2369) (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) (bvslt (_1!1734 (h!3005 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) key!828)))))

(declare-fun b!187887 () Bool)

(assert (=> b!187887 (= e!123649 (containsKey!231 (t!7258 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) key!828))))

(assert (= (and d!55381 (not res!88797)) b!187886))

(assert (= (and b!187886 res!88798) b!187887))

(declare-fun m!214129 () Bool)

(assert (=> b!187887 m!214129))

(assert (=> d!55369 d!55381))

(declare-fun d!55383 () Bool)

(assert (=> d!55383 (= (validKeyInArray!0 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187802 d!55383))

(declare-fun d!55385 () Bool)

(assert (=> d!55385 (= (inRange!0 (index!4783 lt!92780) (mask!8983 thiss!1248)) (and (bvsge (index!4783 lt!92780) #b00000000000000000000000000000000) (bvslt (index!4783 lt!92780) (bvadd (mask!8983 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187738 d!55385))

(declare-fun d!55387 () Bool)

(declare-fun e!123650 () Bool)

(assert (=> d!55387 e!123650))

(declare-fun res!88799 () Bool)

(assert (=> d!55387 (=> res!88799 e!123650)))

(declare-fun lt!92874 () Bool)

(assert (=> d!55387 (= res!88799 (not lt!92874))))

(declare-fun lt!92875 () Bool)

(assert (=> d!55387 (= lt!92874 lt!92875)))

(declare-fun lt!92872 () Unit!5627)

(declare-fun e!123651 () Unit!5627)

(assert (=> d!55387 (= lt!92872 e!123651)))

(declare-fun c!33757 () Bool)

(assert (=> d!55387 (= c!33757 lt!92875)))

(assert (=> d!55387 (= lt!92875 (containsKey!231 (toList!1193 (+!289 lt!92837 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248)))) lt!92858))))

(assert (=> d!55387 (= (contains!1301 (+!289 lt!92837 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248))) lt!92858) lt!92874)))

(declare-fun b!187888 () Bool)

(declare-fun lt!92873 () Unit!5627)

(assert (=> b!187888 (= e!123651 lt!92873)))

(assert (=> b!187888 (= lt!92873 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1193 (+!289 lt!92837 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248)))) lt!92858))))

(assert (=> b!187888 (isDefined!181 (getValueByKey!227 (toList!1193 (+!289 lt!92837 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248)))) lt!92858))))

(declare-fun b!187889 () Bool)

(declare-fun Unit!5636 () Unit!5627)

(assert (=> b!187889 (= e!123651 Unit!5636)))

(declare-fun b!187890 () Bool)

(assert (=> b!187890 (= e!123650 (isDefined!181 (getValueByKey!227 (toList!1193 (+!289 lt!92837 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248)))) lt!92858)))))

(assert (= (and d!55387 c!33757) b!187888))

(assert (= (and d!55387 (not c!33757)) b!187889))

(assert (= (and d!55387 (not res!88799)) b!187890))

(declare-fun m!214131 () Bool)

(assert (=> d!55387 m!214131))

(declare-fun m!214133 () Bool)

(assert (=> b!187888 m!214133))

(declare-fun m!214135 () Bool)

(assert (=> b!187888 m!214135))

(assert (=> b!187888 m!214135))

(declare-fun m!214137 () Bool)

(assert (=> b!187888 m!214137))

(assert (=> b!187890 m!214135))

(assert (=> b!187890 m!214135))

(assert (=> b!187890 m!214137))

(assert (=> b!187791 d!55387))

(declare-fun d!55389 () Bool)

(assert (=> d!55389 (= (apply!172 (+!289 lt!92857 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248))) lt!92856) (apply!172 lt!92857 lt!92856))))

(declare-fun lt!92878 () Unit!5627)

(declare-fun choose!1010 (ListLongMap!2355 (_ BitVec 64) V!5497 (_ BitVec 64)) Unit!5627)

(assert (=> d!55389 (= lt!92878 (choose!1010 lt!92857 lt!92854 (zeroValue!3671 thiss!1248) lt!92856))))

(declare-fun e!123654 () Bool)

(assert (=> d!55389 e!123654))

(declare-fun res!88802 () Bool)

(assert (=> d!55389 (=> (not res!88802) (not e!123654))))

(assert (=> d!55389 (= res!88802 (contains!1301 lt!92857 lt!92856))))

(assert (=> d!55389 (= (addApplyDifferent!148 lt!92857 lt!92854 (zeroValue!3671 thiss!1248) lt!92856) lt!92878)))

(declare-fun b!187894 () Bool)

(assert (=> b!187894 (= e!123654 (not (= lt!92856 lt!92854)))))

(assert (= (and d!55389 res!88802) b!187894))

(declare-fun m!214139 () Bool)

(assert (=> d!55389 m!214139))

(assert (=> d!55389 m!214063))

(declare-fun m!214141 () Bool)

(assert (=> d!55389 m!214141))

(assert (=> d!55389 m!214063))

(assert (=> d!55389 m!214065))

(assert (=> d!55389 m!214077))

(assert (=> b!187791 d!55389))

(declare-fun d!55391 () Bool)

(declare-fun e!123671 () Bool)

(assert (=> d!55391 e!123671))

(declare-fun res!88811 () Bool)

(assert (=> d!55391 (=> (not res!88811) (not e!123671))))

(declare-fun lt!92896 () ListLongMap!2355)

(assert (=> d!55391 (= res!88811 (not (contains!1301 lt!92896 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!123670 () ListLongMap!2355)

(assert (=> d!55391 (= lt!92896 e!123670)))

(declare-fun c!33767 () Bool)

(assert (=> d!55391 (= c!33767 (bvsge #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(assert (=> d!55391 (validMask!0 (mask!8983 thiss!1248))))

(assert (=> d!55391 (= (getCurrentListMapNoExtraKeys!193 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)) lt!92896)))

(declare-fun b!187919 () Bool)

(declare-fun e!123672 () Bool)

(declare-fun e!123675 () Bool)

(assert (=> b!187919 (= e!123672 e!123675)))

(assert (=> b!187919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun res!88814 () Bool)

(assert (=> b!187919 (= res!88814 (contains!1301 lt!92896 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187919 (=> (not res!88814) (not e!123675))))

(declare-fun bm!18937 () Bool)

(declare-fun call!18940 () ListLongMap!2355)

(assert (=> bm!18937 (= call!18940 (getCurrentListMapNoExtraKeys!193 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3830 thiss!1248)))))

(declare-fun b!187920 () Bool)

(declare-fun e!123674 () Bool)

(assert (=> b!187920 (= e!123674 (validKeyInArray!0 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187920 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!187921 () Bool)

(declare-fun e!123669 () ListLongMap!2355)

(assert (=> b!187921 (= e!123670 e!123669)))

(declare-fun c!33766 () Bool)

(assert (=> b!187921 (= c!33766 (validKeyInArray!0 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187922 () Bool)

(assert (=> b!187922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(assert (=> b!187922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4081 (_values!3813 thiss!1248))))))

(assert (=> b!187922 (= e!123675 (= (apply!172 lt!92896 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)) (get!2166 (select (arr!3761 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!187923 () Bool)

(declare-fun e!123673 () Bool)

(assert (=> b!187923 (= e!123673 (= lt!92896 (getCurrentListMapNoExtraKeys!193 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3830 thiss!1248))))))

(declare-fun b!187924 () Bool)

(assert (=> b!187924 (= e!123671 e!123672)))

(declare-fun c!33769 () Bool)

(assert (=> b!187924 (= c!33769 e!123674)))

(declare-fun res!88813 () Bool)

(assert (=> b!187924 (=> (not res!88813) (not e!123674))))

(assert (=> b!187924 (= res!88813 (bvslt #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun b!187925 () Bool)

(assert (=> b!187925 (= e!123672 e!123673)))

(declare-fun c!33768 () Bool)

(assert (=> b!187925 (= c!33768 (bvslt #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun b!187926 () Bool)

(assert (=> b!187926 (= e!123669 call!18940)))

(declare-fun b!187927 () Bool)

(declare-fun isEmpty!481 (ListLongMap!2355) Bool)

(assert (=> b!187927 (= e!123673 (isEmpty!481 lt!92896))))

(declare-fun b!187928 () Bool)

(declare-fun lt!92895 () Unit!5627)

(declare-fun lt!92897 () Unit!5627)

(assert (=> b!187928 (= lt!92895 lt!92897)))

(declare-fun lt!92899 () V!5497)

(declare-fun lt!92893 () (_ BitVec 64))

(declare-fun lt!92894 () (_ BitVec 64))

(declare-fun lt!92898 () ListLongMap!2355)

(assert (=> b!187928 (not (contains!1301 (+!289 lt!92898 (tuple2!3447 lt!92894 lt!92899)) lt!92893))))

(declare-fun addStillNotContains!93 (ListLongMap!2355 (_ BitVec 64) V!5497 (_ BitVec 64)) Unit!5627)

(assert (=> b!187928 (= lt!92897 (addStillNotContains!93 lt!92898 lt!92894 lt!92899 lt!92893))))

(assert (=> b!187928 (= lt!92893 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!187928 (= lt!92899 (get!2166 (select (arr!3761 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187928 (= lt!92894 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187928 (= lt!92898 call!18940)))

(assert (=> b!187928 (= e!123669 (+!289 call!18940 (tuple2!3447 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000) (get!2166 (select (arr!3761 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!187929 () Bool)

(declare-fun res!88812 () Bool)

(assert (=> b!187929 (=> (not res!88812) (not e!123671))))

(assert (=> b!187929 (= res!88812 (not (contains!1301 lt!92896 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187930 () Bool)

(assert (=> b!187930 (= e!123670 (ListLongMap!2356 Nil!2370))))

(assert (= (and d!55391 c!33767) b!187930))

(assert (= (and d!55391 (not c!33767)) b!187921))

(assert (= (and b!187921 c!33766) b!187928))

(assert (= (and b!187921 (not c!33766)) b!187926))

(assert (= (or b!187928 b!187926) bm!18937))

(assert (= (and d!55391 res!88811) b!187929))

(assert (= (and b!187929 res!88812) b!187924))

(assert (= (and b!187924 res!88813) b!187920))

(assert (= (and b!187924 c!33769) b!187919))

(assert (= (and b!187924 (not c!33769)) b!187925))

(assert (= (and b!187919 res!88814) b!187922))

(assert (= (and b!187925 c!33768) b!187923))

(assert (= (and b!187925 (not c!33768)) b!187927))

(declare-fun b_lambda!7285 () Bool)

(assert (=> (not b_lambda!7285) (not b!187922)))

(assert (=> b!187922 t!7261))

(declare-fun b_and!11221 () Bool)

(assert (= b_and!11219 (and (=> t!7261 result!4835) b_and!11221)))

(declare-fun b_lambda!7287 () Bool)

(assert (=> (not b_lambda!7287) (not b!187928)))

(assert (=> b!187928 t!7261))

(declare-fun b_and!11223 () Bool)

(assert (= b_and!11221 (and (=> t!7261 result!4835) b_and!11223)))

(assert (=> b!187921 m!214037))

(assert (=> b!187921 m!214037))

(assert (=> b!187921 m!214039))

(assert (=> b!187919 m!214037))

(assert (=> b!187919 m!214037))

(declare-fun m!214143 () Bool)

(assert (=> b!187919 m!214143))

(declare-fun m!214145 () Bool)

(assert (=> b!187923 m!214145))

(declare-fun m!214147 () Bool)

(assert (=> b!187929 m!214147))

(assert (=> b!187922 m!214051))

(assert (=> b!187922 m!214051))

(assert (=> b!187922 m!214049))

(assert (=> b!187922 m!214053))

(assert (=> b!187922 m!214037))

(assert (=> b!187922 m!214049))

(assert (=> b!187922 m!214037))

(declare-fun m!214149 () Bool)

(assert (=> b!187922 m!214149))

(declare-fun m!214151 () Bool)

(assert (=> d!55391 m!214151))

(assert (=> d!55391 m!213947))

(assert (=> bm!18937 m!214145))

(assert (=> b!187920 m!214037))

(assert (=> b!187920 m!214037))

(assert (=> b!187920 m!214039))

(assert (=> b!187928 m!214051))

(assert (=> b!187928 m!214049))

(declare-fun m!214153 () Bool)

(assert (=> b!187928 m!214153))

(declare-fun m!214155 () Bool)

(assert (=> b!187928 m!214155))

(assert (=> b!187928 m!214051))

(assert (=> b!187928 m!214049))

(assert (=> b!187928 m!214053))

(assert (=> b!187928 m!214037))

(declare-fun m!214157 () Bool)

(assert (=> b!187928 m!214157))

(assert (=> b!187928 m!214155))

(declare-fun m!214159 () Bool)

(assert (=> b!187928 m!214159))

(declare-fun m!214161 () Bool)

(assert (=> b!187927 m!214161))

(assert (=> b!187791 d!55391))

(declare-fun d!55393 () Bool)

(declare-fun e!123678 () Bool)

(assert (=> d!55393 e!123678))

(declare-fun res!88820 () Bool)

(assert (=> d!55393 (=> (not res!88820) (not e!123678))))

(declare-fun lt!92911 () ListLongMap!2355)

(assert (=> d!55393 (= res!88820 (contains!1301 lt!92911 (_1!1734 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248)))))))

(declare-fun lt!92909 () List!2373)

(assert (=> d!55393 (= lt!92911 (ListLongMap!2356 lt!92909))))

(declare-fun lt!92908 () Unit!5627)

(declare-fun lt!92910 () Unit!5627)

(assert (=> d!55393 (= lt!92908 lt!92910)))

(assert (=> d!55393 (= (getValueByKey!227 lt!92909 (_1!1734 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248)))) (Some!232 (_2!1734 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!121 (List!2373 (_ BitVec 64) V!5497) Unit!5627)

(assert (=> d!55393 (= lt!92910 (lemmaContainsTupThenGetReturnValue!121 lt!92909 (_1!1734 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248))) (_2!1734 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248)))))))

(declare-fun insertStrictlySorted!124 (List!2373 (_ BitVec 64) V!5497) List!2373)

(assert (=> d!55393 (= lt!92909 (insertStrictlySorted!124 (toList!1193 lt!92837) (_1!1734 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248))) (_2!1734 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248)))))))

(assert (=> d!55393 (= (+!289 lt!92837 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248))) lt!92911)))

(declare-fun b!187935 () Bool)

(declare-fun res!88819 () Bool)

(assert (=> b!187935 (=> (not res!88819) (not e!123678))))

(assert (=> b!187935 (= res!88819 (= (getValueByKey!227 (toList!1193 lt!92911) (_1!1734 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248)))) (Some!232 (_2!1734 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248))))))))

(declare-fun b!187936 () Bool)

(declare-fun contains!1303 (List!2373 tuple2!3446) Bool)

(assert (=> b!187936 (= e!123678 (contains!1303 (toList!1193 lt!92911) (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248))))))

(assert (= (and d!55393 res!88820) b!187935))

(assert (= (and b!187935 res!88819) b!187936))

(declare-fun m!214163 () Bool)

(assert (=> d!55393 m!214163))

(declare-fun m!214165 () Bool)

(assert (=> d!55393 m!214165))

(declare-fun m!214167 () Bool)

(assert (=> d!55393 m!214167))

(declare-fun m!214169 () Bool)

(assert (=> d!55393 m!214169))

(declare-fun m!214171 () Bool)

(assert (=> b!187935 m!214171))

(declare-fun m!214173 () Bool)

(assert (=> b!187936 m!214173))

(assert (=> b!187791 d!55393))

(declare-fun d!55395 () Bool)

(assert (=> d!55395 (contains!1301 (+!289 lt!92837 (tuple2!3447 lt!92847 (zeroValue!3671 thiss!1248))) lt!92858)))

(declare-fun lt!92914 () Unit!5627)

(declare-fun choose!1011 (ListLongMap!2355 (_ BitVec 64) V!5497 (_ BitVec 64)) Unit!5627)

(assert (=> d!55395 (= lt!92914 (choose!1011 lt!92837 lt!92847 (zeroValue!3671 thiss!1248) lt!92858))))

(assert (=> d!55395 (contains!1301 lt!92837 lt!92858)))

(assert (=> d!55395 (= (addStillContains!148 lt!92837 lt!92847 (zeroValue!3671 thiss!1248) lt!92858) lt!92914)))

(declare-fun bs!7551 () Bool)

(assert (= bs!7551 d!55395))

(assert (=> bs!7551 m!214071))

(assert (=> bs!7551 m!214071))

(assert (=> bs!7551 m!214073))

(declare-fun m!214175 () Bool)

(assert (=> bs!7551 m!214175))

(declare-fun m!214177 () Bool)

(assert (=> bs!7551 m!214177))

(assert (=> b!187791 d!55395))

(declare-fun d!55397 () Bool)

(assert (=> d!55397 (= (apply!172 (+!289 lt!92852 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248))) lt!92841) (apply!172 lt!92852 lt!92841))))

(declare-fun lt!92915 () Unit!5627)

(assert (=> d!55397 (= lt!92915 (choose!1010 lt!92852 lt!92842 (minValue!3671 thiss!1248) lt!92841))))

(declare-fun e!123679 () Bool)

(assert (=> d!55397 e!123679))

(declare-fun res!88821 () Bool)

(assert (=> d!55397 (=> (not res!88821) (not e!123679))))

(assert (=> d!55397 (= res!88821 (contains!1301 lt!92852 lt!92841))))

(assert (=> d!55397 (= (addApplyDifferent!148 lt!92852 lt!92842 (minValue!3671 thiss!1248) lt!92841) lt!92915)))

(declare-fun b!187938 () Bool)

(assert (=> b!187938 (= e!123679 (not (= lt!92841 lt!92842)))))

(assert (= (and d!55397 res!88821) b!187938))

(declare-fun m!214179 () Bool)

(assert (=> d!55397 m!214179))

(assert (=> d!55397 m!214081))

(declare-fun m!214181 () Bool)

(assert (=> d!55397 m!214181))

(assert (=> d!55397 m!214081))

(assert (=> d!55397 m!214083))

(assert (=> d!55397 m!214079))

(assert (=> b!187791 d!55397))

(declare-fun d!55399 () Bool)

(declare-fun get!2167 (Option!233) V!5497)

(assert (=> d!55399 (= (apply!172 lt!92852 lt!92841) (get!2167 (getValueByKey!227 (toList!1193 lt!92852) lt!92841)))))

(declare-fun bs!7552 () Bool)

(assert (= bs!7552 d!55399))

(declare-fun m!214183 () Bool)

(assert (=> bs!7552 m!214183))

(assert (=> bs!7552 m!214183))

(declare-fun m!214185 () Bool)

(assert (=> bs!7552 m!214185))

(assert (=> b!187791 d!55399))

(declare-fun d!55401 () Bool)

(declare-fun e!123680 () Bool)

(assert (=> d!55401 e!123680))

(declare-fun res!88823 () Bool)

(assert (=> d!55401 (=> (not res!88823) (not e!123680))))

(declare-fun lt!92919 () ListLongMap!2355)

(assert (=> d!55401 (= res!88823 (contains!1301 lt!92919 (_1!1734 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248)))))))

(declare-fun lt!92917 () List!2373)

(assert (=> d!55401 (= lt!92919 (ListLongMap!2356 lt!92917))))

(declare-fun lt!92916 () Unit!5627)

(declare-fun lt!92918 () Unit!5627)

(assert (=> d!55401 (= lt!92916 lt!92918)))

(assert (=> d!55401 (= (getValueByKey!227 lt!92917 (_1!1734 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248)))) (Some!232 (_2!1734 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248)))))))

(assert (=> d!55401 (= lt!92918 (lemmaContainsTupThenGetReturnValue!121 lt!92917 (_1!1734 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248))) (_2!1734 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248)))))))

(assert (=> d!55401 (= lt!92917 (insertStrictlySorted!124 (toList!1193 lt!92857) (_1!1734 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248))) (_2!1734 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248)))))))

(assert (=> d!55401 (= (+!289 lt!92857 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248))) lt!92919)))

(declare-fun b!187939 () Bool)

(declare-fun res!88822 () Bool)

(assert (=> b!187939 (=> (not res!88822) (not e!123680))))

(assert (=> b!187939 (= res!88822 (= (getValueByKey!227 (toList!1193 lt!92919) (_1!1734 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248)))) (Some!232 (_2!1734 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248))))))))

(declare-fun b!187940 () Bool)

(assert (=> b!187940 (= e!123680 (contains!1303 (toList!1193 lt!92919) (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248))))))

(assert (= (and d!55401 res!88823) b!187939))

(assert (= (and b!187939 res!88822) b!187940))

(declare-fun m!214187 () Bool)

(assert (=> d!55401 m!214187))

(declare-fun m!214189 () Bool)

(assert (=> d!55401 m!214189))

(declare-fun m!214191 () Bool)

(assert (=> d!55401 m!214191))

(declare-fun m!214193 () Bool)

(assert (=> d!55401 m!214193))

(declare-fun m!214195 () Bool)

(assert (=> b!187939 m!214195))

(declare-fun m!214197 () Bool)

(assert (=> b!187940 m!214197))

(assert (=> b!187791 d!55401))

(declare-fun d!55403 () Bool)

(assert (=> d!55403 (= (apply!172 (+!289 lt!92857 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248))) lt!92856) (get!2167 (getValueByKey!227 (toList!1193 (+!289 lt!92857 (tuple2!3447 lt!92854 (zeroValue!3671 thiss!1248)))) lt!92856)))))

(declare-fun bs!7553 () Bool)

(assert (= bs!7553 d!55403))

(declare-fun m!214199 () Bool)

(assert (=> bs!7553 m!214199))

(assert (=> bs!7553 m!214199))

(declare-fun m!214201 () Bool)

(assert (=> bs!7553 m!214201))

(assert (=> b!187791 d!55403))

(declare-fun d!55405 () Bool)

(assert (=> d!55405 (= (apply!172 (+!289 lt!92850 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248))) lt!92853) (get!2167 (getValueByKey!227 (toList!1193 (+!289 lt!92850 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248)))) lt!92853)))))

(declare-fun bs!7554 () Bool)

(assert (= bs!7554 d!55405))

(declare-fun m!214203 () Bool)

(assert (=> bs!7554 m!214203))

(assert (=> bs!7554 m!214203))

(declare-fun m!214205 () Bool)

(assert (=> bs!7554 m!214205))

(assert (=> b!187791 d!55405))

(declare-fun d!55407 () Bool)

(declare-fun e!123681 () Bool)

(assert (=> d!55407 e!123681))

(declare-fun res!88825 () Bool)

(assert (=> d!55407 (=> (not res!88825) (not e!123681))))

(declare-fun lt!92923 () ListLongMap!2355)

(assert (=> d!55407 (= res!88825 (contains!1301 lt!92923 (_1!1734 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248)))))))

(declare-fun lt!92921 () List!2373)

(assert (=> d!55407 (= lt!92923 (ListLongMap!2356 lt!92921))))

(declare-fun lt!92920 () Unit!5627)

(declare-fun lt!92922 () Unit!5627)

(assert (=> d!55407 (= lt!92920 lt!92922)))

(assert (=> d!55407 (= (getValueByKey!227 lt!92921 (_1!1734 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248)))) (Some!232 (_2!1734 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248)))))))

(assert (=> d!55407 (= lt!92922 (lemmaContainsTupThenGetReturnValue!121 lt!92921 (_1!1734 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248))) (_2!1734 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248)))))))

(assert (=> d!55407 (= lt!92921 (insertStrictlySorted!124 (toList!1193 lt!92850) (_1!1734 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248))) (_2!1734 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248)))))))

(assert (=> d!55407 (= (+!289 lt!92850 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248))) lt!92923)))

(declare-fun b!187941 () Bool)

(declare-fun res!88824 () Bool)

(assert (=> b!187941 (=> (not res!88824) (not e!123681))))

(assert (=> b!187941 (= res!88824 (= (getValueByKey!227 (toList!1193 lt!92923) (_1!1734 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248)))) (Some!232 (_2!1734 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248))))))))

(declare-fun b!187942 () Bool)

(assert (=> b!187942 (= e!123681 (contains!1303 (toList!1193 lt!92923) (tuple2!3447 lt!92846 (minValue!3671 thiss!1248))))))

(assert (= (and d!55407 res!88825) b!187941))

(assert (= (and b!187941 res!88824) b!187942))

(declare-fun m!214207 () Bool)

(assert (=> d!55407 m!214207))

(declare-fun m!214209 () Bool)

(assert (=> d!55407 m!214209))

(declare-fun m!214211 () Bool)

(assert (=> d!55407 m!214211))

(declare-fun m!214213 () Bool)

(assert (=> d!55407 m!214213))

(declare-fun m!214215 () Bool)

(assert (=> b!187941 m!214215))

(declare-fun m!214217 () Bool)

(assert (=> b!187942 m!214217))

(assert (=> b!187791 d!55407))

(declare-fun d!55409 () Bool)

(assert (=> d!55409 (= (apply!172 lt!92850 lt!92853) (get!2167 (getValueByKey!227 (toList!1193 lt!92850) lt!92853)))))

(declare-fun bs!7555 () Bool)

(assert (= bs!7555 d!55409))

(declare-fun m!214219 () Bool)

(assert (=> bs!7555 m!214219))

(assert (=> bs!7555 m!214219))

(declare-fun m!214221 () Bool)

(assert (=> bs!7555 m!214221))

(assert (=> b!187791 d!55409))

(declare-fun d!55411 () Bool)

(assert (=> d!55411 (= (apply!172 lt!92857 lt!92856) (get!2167 (getValueByKey!227 (toList!1193 lt!92857) lt!92856)))))

(declare-fun bs!7556 () Bool)

(assert (= bs!7556 d!55411))

(declare-fun m!214223 () Bool)

(assert (=> bs!7556 m!214223))

(assert (=> bs!7556 m!214223))

(declare-fun m!214225 () Bool)

(assert (=> bs!7556 m!214225))

(assert (=> b!187791 d!55411))

(declare-fun d!55413 () Bool)

(declare-fun e!123682 () Bool)

(assert (=> d!55413 e!123682))

(declare-fun res!88827 () Bool)

(assert (=> d!55413 (=> (not res!88827) (not e!123682))))

(declare-fun lt!92927 () ListLongMap!2355)

(assert (=> d!55413 (= res!88827 (contains!1301 lt!92927 (_1!1734 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248)))))))

(declare-fun lt!92925 () List!2373)

(assert (=> d!55413 (= lt!92927 (ListLongMap!2356 lt!92925))))

(declare-fun lt!92924 () Unit!5627)

(declare-fun lt!92926 () Unit!5627)

(assert (=> d!55413 (= lt!92924 lt!92926)))

(assert (=> d!55413 (= (getValueByKey!227 lt!92925 (_1!1734 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248)))) (Some!232 (_2!1734 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248)))))))

(assert (=> d!55413 (= lt!92926 (lemmaContainsTupThenGetReturnValue!121 lt!92925 (_1!1734 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248))) (_2!1734 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248)))))))

(assert (=> d!55413 (= lt!92925 (insertStrictlySorted!124 (toList!1193 lt!92852) (_1!1734 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248))) (_2!1734 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248)))))))

(assert (=> d!55413 (= (+!289 lt!92852 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248))) lt!92927)))

(declare-fun b!187943 () Bool)

(declare-fun res!88826 () Bool)

(assert (=> b!187943 (=> (not res!88826) (not e!123682))))

(assert (=> b!187943 (= res!88826 (= (getValueByKey!227 (toList!1193 lt!92927) (_1!1734 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248)))) (Some!232 (_2!1734 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248))))))))

(declare-fun b!187944 () Bool)

(assert (=> b!187944 (= e!123682 (contains!1303 (toList!1193 lt!92927) (tuple2!3447 lt!92842 (minValue!3671 thiss!1248))))))

(assert (= (and d!55413 res!88827) b!187943))

(assert (= (and b!187943 res!88826) b!187944))

(declare-fun m!214227 () Bool)

(assert (=> d!55413 m!214227))

(declare-fun m!214229 () Bool)

(assert (=> d!55413 m!214229))

(declare-fun m!214231 () Bool)

(assert (=> d!55413 m!214231))

(declare-fun m!214233 () Bool)

(assert (=> d!55413 m!214233))

(declare-fun m!214235 () Bool)

(assert (=> b!187943 m!214235))

(declare-fun m!214237 () Bool)

(assert (=> b!187944 m!214237))

(assert (=> b!187791 d!55413))

(declare-fun d!55415 () Bool)

(assert (=> d!55415 (= (apply!172 (+!289 lt!92850 (tuple2!3447 lt!92846 (minValue!3671 thiss!1248))) lt!92853) (apply!172 lt!92850 lt!92853))))

(declare-fun lt!92928 () Unit!5627)

(assert (=> d!55415 (= lt!92928 (choose!1010 lt!92850 lt!92846 (minValue!3671 thiss!1248) lt!92853))))

(declare-fun e!123683 () Bool)

(assert (=> d!55415 e!123683))

(declare-fun res!88828 () Bool)

(assert (=> d!55415 (=> (not res!88828) (not e!123683))))

(assert (=> d!55415 (= res!88828 (contains!1301 lt!92850 lt!92853))))

(assert (=> d!55415 (= (addApplyDifferent!148 lt!92850 lt!92846 (minValue!3671 thiss!1248) lt!92853) lt!92928)))

(declare-fun b!187945 () Bool)

(assert (=> b!187945 (= e!123683 (not (= lt!92853 lt!92846)))))

(assert (= (and d!55415 res!88828) b!187945))

(declare-fun m!214239 () Bool)

(assert (=> d!55415 m!214239))

(assert (=> d!55415 m!214067))

(declare-fun m!214241 () Bool)

(assert (=> d!55415 m!214241))

(assert (=> d!55415 m!214067))

(assert (=> d!55415 m!214075))

(assert (=> d!55415 m!214089))

(assert (=> b!187791 d!55415))

(declare-fun d!55417 () Bool)

(assert (=> d!55417 (= (apply!172 (+!289 lt!92852 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248))) lt!92841) (get!2167 (getValueByKey!227 (toList!1193 (+!289 lt!92852 (tuple2!3447 lt!92842 (minValue!3671 thiss!1248)))) lt!92841)))))

(declare-fun bs!7557 () Bool)

(assert (= bs!7557 d!55417))

(declare-fun m!214243 () Bool)

(assert (=> bs!7557 m!214243))

(assert (=> bs!7557 m!214243))

(declare-fun m!214245 () Bool)

(assert (=> bs!7557 m!214245))

(assert (=> b!187791 d!55417))

(declare-fun b!187964 () Bool)

(declare-fun e!123697 () SeekEntryResult!653)

(declare-fun e!123696 () SeekEntryResult!653)

(assert (=> b!187964 (= e!123697 e!123696)))

(declare-fun c!33778 () Bool)

(declare-fun lt!92934 () (_ BitVec 64))

(assert (=> b!187964 (= c!33778 (or (= lt!92934 key!828) (= (bvadd lt!92934 lt!92934) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187965 () Bool)

(assert (=> b!187965 (= e!123696 (Intermediate!653 false (toIndex!0 key!828 (mask!8983 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!187966 () Bool)

(assert (=> b!187966 (= e!123697 (Intermediate!653 true (toIndex!0 key!828 (mask!8983 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!187967 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187967 (= e!123696 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8983 thiss!1248)) #b00000000000000000000000000000000 (mask!8983 thiss!1248)) key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(declare-fun b!187968 () Bool)

(declare-fun lt!92933 () SeekEntryResult!653)

(assert (=> b!187968 (and (bvsge (index!4784 lt!92933) #b00000000000000000000000000000000) (bvslt (index!4784 lt!92933) (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun res!88835 () Bool)

(assert (=> b!187968 (= res!88835 (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4784 lt!92933)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123695 () Bool)

(assert (=> b!187968 (=> res!88835 e!123695)))

(declare-fun b!187969 () Bool)

(assert (=> b!187969 (and (bvsge (index!4784 lt!92933) #b00000000000000000000000000000000) (bvslt (index!4784 lt!92933) (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun res!88836 () Bool)

(assert (=> b!187969 (= res!88836 (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4784 lt!92933)) key!828))))

(assert (=> b!187969 (=> res!88836 e!123695)))

(declare-fun e!123698 () Bool)

(assert (=> b!187969 (= e!123698 e!123695)))

(declare-fun b!187970 () Bool)

(declare-fun e!123694 () Bool)

(assert (=> b!187970 (= e!123694 (bvsge (x!20312 lt!92933) #b01111111111111111111111111111110))))

(declare-fun b!187971 () Bool)

(assert (=> b!187971 (= e!123694 e!123698)))

(declare-fun res!88837 () Bool)

(assert (=> b!187971 (= res!88837 (and ((_ is Intermediate!653) lt!92933) (not (undefined!1465 lt!92933)) (bvslt (x!20312 lt!92933) #b01111111111111111111111111111110) (bvsge (x!20312 lt!92933) #b00000000000000000000000000000000) (bvsge (x!20312 lt!92933) #b00000000000000000000000000000000)))))

(assert (=> b!187971 (=> (not res!88837) (not e!123698))))

(declare-fun b!187972 () Bool)

(assert (=> b!187972 (and (bvsge (index!4784 lt!92933) #b00000000000000000000000000000000) (bvslt (index!4784 lt!92933) (size!4080 (_keys!5784 thiss!1248))))))

(assert (=> b!187972 (= e!123695 (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4784 lt!92933)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55419 () Bool)

(assert (=> d!55419 e!123694))

(declare-fun c!33777 () Bool)

(assert (=> d!55419 (= c!33777 (and ((_ is Intermediate!653) lt!92933) (undefined!1465 lt!92933)))))

(assert (=> d!55419 (= lt!92933 e!123697)))

(declare-fun c!33776 () Bool)

(assert (=> d!55419 (= c!33776 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!55419 (= lt!92934 (select (arr!3760 (_keys!5784 thiss!1248)) (toIndex!0 key!828 (mask!8983 thiss!1248))))))

(assert (=> d!55419 (validMask!0 (mask!8983 thiss!1248))))

(assert (=> d!55419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8983 thiss!1248)) key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)) lt!92933)))

(assert (= (and d!55419 c!33776) b!187966))

(assert (= (and d!55419 (not c!33776)) b!187964))

(assert (= (and b!187964 c!33778) b!187965))

(assert (= (and b!187964 (not c!33778)) b!187967))

(assert (= (and d!55419 c!33777) b!187970))

(assert (= (and d!55419 (not c!33777)) b!187971))

(assert (= (and b!187971 res!88837) b!187969))

(assert (= (and b!187969 (not res!88836)) b!187968))

(assert (= (and b!187968 (not res!88835)) b!187972))

(declare-fun m!214247 () Bool)

(assert (=> b!187972 m!214247))

(assert (=> d!55419 m!214015))

(declare-fun m!214249 () Bool)

(assert (=> d!55419 m!214249))

(assert (=> d!55419 m!213947))

(assert (=> b!187967 m!214015))

(declare-fun m!214251 () Bool)

(assert (=> b!187967 m!214251))

(assert (=> b!187967 m!214251))

(declare-fun m!214253 () Bool)

(assert (=> b!187967 m!214253))

(assert (=> b!187969 m!214247))

(assert (=> b!187968 m!214247))

(assert (=> d!55361 d!55419))

(declare-fun d!55421 () Bool)

(declare-fun lt!92940 () (_ BitVec 32))

(declare-fun lt!92939 () (_ BitVec 32))

(assert (=> d!55421 (= lt!92940 (bvmul (bvxor lt!92939 (bvlshr lt!92939 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55421 (= lt!92939 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55421 (and (bvsge (mask!8983 thiss!1248) #b00000000000000000000000000000000) (let ((res!88838 (let ((h!3008 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20331 (bvmul (bvxor h!3008 (bvlshr h!3008 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20331 (bvlshr x!20331 #b00000000000000000000000000001101)) (mask!8983 thiss!1248)))))) (and (bvslt res!88838 (bvadd (mask!8983 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88838 #b00000000000000000000000000000000))))))

(assert (=> d!55421 (= (toIndex!0 key!828 (mask!8983 thiss!1248)) (bvand (bvxor lt!92940 (bvlshr lt!92940 #b00000000000000000000000000001101)) (mask!8983 thiss!1248)))))

(assert (=> d!55361 d!55421))

(assert (=> d!55361 d!55367))

(declare-fun d!55423 () Bool)

(assert (=> d!55423 (= (apply!172 lt!92848 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2167 (getValueByKey!227 (toList!1193 lt!92848) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7558 () Bool)

(assert (= bs!7558 d!55423))

(assert (=> bs!7558 m!214119))

(assert (=> bs!7558 m!214119))

(declare-fun m!214255 () Bool)

(assert (=> bs!7558 m!214255))

(assert (=> b!187808 d!55423))

(declare-fun d!55425 () Bool)

(declare-fun e!123699 () Bool)

(assert (=> d!55425 e!123699))

(declare-fun res!88839 () Bool)

(assert (=> d!55425 (=> res!88839 e!123699)))

(declare-fun lt!92943 () Bool)

(assert (=> d!55425 (= res!88839 (not lt!92943))))

(declare-fun lt!92944 () Bool)

(assert (=> d!55425 (= lt!92943 lt!92944)))

(declare-fun lt!92941 () Unit!5627)

(declare-fun e!123700 () Unit!5627)

(assert (=> d!55425 (= lt!92941 e!123700)))

(declare-fun c!33779 () Bool)

(assert (=> d!55425 (= c!33779 lt!92944)))

(assert (=> d!55425 (= lt!92944 (containsKey!231 (toList!1193 lt!92848) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55425 (= (contains!1301 lt!92848 #b1000000000000000000000000000000000000000000000000000000000000000) lt!92943)))

(declare-fun b!187973 () Bool)

(declare-fun lt!92942 () Unit!5627)

(assert (=> b!187973 (= e!123700 lt!92942)))

(assert (=> b!187973 (= lt!92942 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1193 lt!92848) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187973 (isDefined!181 (getValueByKey!227 (toList!1193 lt!92848) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187974 () Bool)

(declare-fun Unit!5637 () Unit!5627)

(assert (=> b!187974 (= e!123700 Unit!5637)))

(declare-fun b!187975 () Bool)

(assert (=> b!187975 (= e!123699 (isDefined!181 (getValueByKey!227 (toList!1193 lt!92848) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55425 c!33779) b!187973))

(assert (= (and d!55425 (not c!33779)) b!187974))

(assert (= (and d!55425 (not res!88839)) b!187975))

(declare-fun m!214257 () Bool)

(assert (=> d!55425 m!214257))

(declare-fun m!214259 () Bool)

(assert (=> b!187973 m!214259))

(declare-fun m!214261 () Bool)

(assert (=> b!187973 m!214261))

(assert (=> b!187973 m!214261))

(declare-fun m!214263 () Bool)

(assert (=> b!187973 m!214263))

(assert (=> b!187975 m!214261))

(assert (=> b!187975 m!214261))

(assert (=> b!187975 m!214263))

(assert (=> bm!18920 d!55425))

(assert (=> d!55371 d!55367))

(declare-fun d!55427 () Bool)

(declare-fun e!123701 () Bool)

(assert (=> d!55427 e!123701))

(declare-fun res!88841 () Bool)

(assert (=> d!55427 (=> (not res!88841) (not e!123701))))

(declare-fun lt!92948 () ListLongMap!2355)

(assert (=> d!55427 (= res!88841 (contains!1301 lt!92948 (_1!1734 (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))))

(declare-fun lt!92946 () List!2373)

(assert (=> d!55427 (= lt!92948 (ListLongMap!2356 lt!92946))))

(declare-fun lt!92945 () Unit!5627)

(declare-fun lt!92947 () Unit!5627)

(assert (=> d!55427 (= lt!92945 lt!92947)))

(assert (=> d!55427 (= (getValueByKey!227 lt!92946 (_1!1734 (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))) (Some!232 (_2!1734 (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))))

(assert (=> d!55427 (= lt!92947 (lemmaContainsTupThenGetReturnValue!121 lt!92946 (_1!1734 (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))) (_2!1734 (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))))

(assert (=> d!55427 (= lt!92946 (insertStrictlySorted!124 (toList!1193 (ite c!33743 call!18923 (ite c!33739 call!18921 call!18920))) (_1!1734 (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))) (_2!1734 (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))))

(assert (=> d!55427 (= (+!289 (ite c!33743 call!18923 (ite c!33739 call!18921 call!18920)) (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))) lt!92948)))

(declare-fun b!187976 () Bool)

(declare-fun res!88840 () Bool)

(assert (=> b!187976 (=> (not res!88840) (not e!123701))))

(assert (=> b!187976 (= res!88840 (= (getValueByKey!227 (toList!1193 lt!92948) (_1!1734 (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))) (Some!232 (_2!1734 (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))))

(declare-fun b!187977 () Bool)

(assert (=> b!187977 (= e!123701 (contains!1303 (toList!1193 lt!92948) (ite (or c!33743 c!33739) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(assert (= (and d!55427 res!88841) b!187976))

(assert (= (and b!187976 res!88840) b!187977))

(declare-fun m!214265 () Bool)

(assert (=> d!55427 m!214265))

(declare-fun m!214267 () Bool)

(assert (=> d!55427 m!214267))

(declare-fun m!214269 () Bool)

(assert (=> d!55427 m!214269))

(declare-fun m!214271 () Bool)

(assert (=> d!55427 m!214271))

(declare-fun m!214273 () Bool)

(assert (=> b!187976 m!214273))

(declare-fun m!214275 () Bool)

(assert (=> b!187977 m!214275))

(assert (=> bm!18921 d!55427))

(declare-fun d!55429 () Bool)

(declare-fun e!123702 () Bool)

(assert (=> d!55429 e!123702))

(declare-fun res!88843 () Bool)

(assert (=> d!55429 (=> (not res!88843) (not e!123702))))

(declare-fun lt!92952 () ListLongMap!2355)

(assert (=> d!55429 (= res!88843 (contains!1301 lt!92952 (_1!1734 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(declare-fun lt!92950 () List!2373)

(assert (=> d!55429 (= lt!92952 (ListLongMap!2356 lt!92950))))

(declare-fun lt!92949 () Unit!5627)

(declare-fun lt!92951 () Unit!5627)

(assert (=> d!55429 (= lt!92949 lt!92951)))

(assert (=> d!55429 (= (getValueByKey!227 lt!92950 (_1!1734 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))) (Some!232 (_2!1734 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(assert (=> d!55429 (= lt!92951 (lemmaContainsTupThenGetReturnValue!121 lt!92950 (_1!1734 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))) (_2!1734 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(assert (=> d!55429 (= lt!92950 (insertStrictlySorted!124 (toList!1193 call!18922) (_1!1734 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))) (_2!1734 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(assert (=> d!55429 (= (+!289 call!18922 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))) lt!92952)))

(declare-fun b!187978 () Bool)

(declare-fun res!88842 () Bool)

(assert (=> b!187978 (=> (not res!88842) (not e!123702))))

(assert (=> b!187978 (= res!88842 (= (getValueByKey!227 (toList!1193 lt!92952) (_1!1734 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))) (Some!232 (_2!1734 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))))

(declare-fun b!187979 () Bool)

(assert (=> b!187979 (= e!123702 (contains!1303 (toList!1193 lt!92952) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))

(assert (= (and d!55429 res!88843) b!187978))

(assert (= (and b!187978 res!88842) b!187979))

(declare-fun m!214277 () Bool)

(assert (=> d!55429 m!214277))

(declare-fun m!214279 () Bool)

(assert (=> d!55429 m!214279))

(declare-fun m!214281 () Bool)

(assert (=> d!55429 m!214281))

(declare-fun m!214283 () Bool)

(assert (=> d!55429 m!214283))

(declare-fun m!214285 () Bool)

(assert (=> b!187978 m!214285))

(declare-fun m!214287 () Bool)

(assert (=> b!187979 m!214287))

(assert (=> b!187810 d!55429))

(declare-fun b!187991 () Bool)

(declare-fun e!123705 () Bool)

(assert (=> b!187991 (= e!123705 (and (bvsge (extraKeys!3567 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3567 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1353 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!187989 () Bool)

(declare-fun res!88854 () Bool)

(assert (=> b!187989 (=> (not res!88854) (not e!123705))))

(declare-fun size!4086 (LongMapFixedSize!2608) (_ BitVec 32))

(assert (=> b!187989 (= res!88854 (bvsge (size!4086 thiss!1248) (_size!1353 thiss!1248)))))

(declare-fun d!55431 () Bool)

(declare-fun res!88853 () Bool)

(assert (=> d!55431 (=> (not res!88853) (not e!123705))))

(assert (=> d!55431 (= res!88853 (validMask!0 (mask!8983 thiss!1248)))))

(assert (=> d!55431 (= (simpleValid!188 thiss!1248) e!123705)))

(declare-fun b!187988 () Bool)

(declare-fun res!88855 () Bool)

(assert (=> b!187988 (=> (not res!88855) (not e!123705))))

(assert (=> b!187988 (= res!88855 (and (= (size!4081 (_values!3813 thiss!1248)) (bvadd (mask!8983 thiss!1248) #b00000000000000000000000000000001)) (= (size!4080 (_keys!5784 thiss!1248)) (size!4081 (_values!3813 thiss!1248))) (bvsge (_size!1353 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1353 thiss!1248) (bvadd (mask!8983 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!187990 () Bool)

(declare-fun res!88852 () Bool)

(assert (=> b!187990 (=> (not res!88852) (not e!123705))))

(assert (=> b!187990 (= res!88852 (= (size!4086 thiss!1248) (bvadd (_size!1353 thiss!1248) (bvsdiv (bvadd (extraKeys!3567 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!55431 res!88853) b!187988))

(assert (= (and b!187988 res!88855) b!187989))

(assert (= (and b!187989 res!88854) b!187990))

(assert (= (and b!187990 res!88852) b!187991))

(declare-fun m!214289 () Bool)

(assert (=> b!187989 m!214289))

(assert (=> d!55431 m!213947))

(assert (=> b!187990 m!214289))

(assert (=> d!55375 d!55431))

(declare-fun b!188000 () Bool)

(declare-fun e!123711 () (_ BitVec 32))

(assert (=> b!188000 (= e!123711 #b00000000000000000000000000000000)))

(declare-fun b!188001 () Bool)

(declare-fun e!123710 () (_ BitVec 32))

(assert (=> b!188001 (= e!123711 e!123710)))

(declare-fun c!33785 () Bool)

(assert (=> b!188001 (= c!33785 (validKeyInArray!0 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188003 () Bool)

(declare-fun call!18943 () (_ BitVec 32))

(assert (=> b!188003 (= e!123710 call!18943)))

(declare-fun bm!18940 () Bool)

(assert (=> bm!18940 (= call!18943 (arrayCountValidKeys!0 (_keys!5784 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun b!188002 () Bool)

(assert (=> b!188002 (= e!123710 (bvadd #b00000000000000000000000000000001 call!18943))))

(declare-fun d!55433 () Bool)

(declare-fun lt!92955 () (_ BitVec 32))

(assert (=> d!55433 (and (bvsge lt!92955 #b00000000000000000000000000000000) (bvsle lt!92955 (bvsub (size!4080 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55433 (= lt!92955 e!123711)))

(declare-fun c!33784 () Bool)

(assert (=> d!55433 (= c!33784 (bvsge #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(assert (=> d!55433 (and (bvsle #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4080 (_keys!5784 thiss!1248)) (size!4080 (_keys!5784 thiss!1248))))))

(assert (=> d!55433 (= (arrayCountValidKeys!0 (_keys!5784 thiss!1248) #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))) lt!92955)))

(assert (= (and d!55433 c!33784) b!188000))

(assert (= (and d!55433 (not c!33784)) b!188001))

(assert (= (and b!188001 c!33785) b!188002))

(assert (= (and b!188001 (not c!33785)) b!188003))

(assert (= (or b!188002 b!188003) bm!18940))

(assert (=> b!188001 m!214037))

(assert (=> b!188001 m!214037))

(assert (=> b!188001 m!214039))

(declare-fun m!214291 () Bool)

(assert (=> bm!18940 m!214291))

(assert (=> b!187844 d!55433))

(declare-fun d!55435 () Bool)

(assert (=> d!55435 (isDefined!181 (getValueByKey!227 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(declare-fun lt!92958 () Unit!5627)

(declare-fun choose!1012 (List!2373 (_ BitVec 64)) Unit!5627)

(assert (=> d!55435 (= lt!92958 (choose!1012 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(declare-fun e!123714 () Bool)

(assert (=> d!55435 e!123714))

(declare-fun res!88858 () Bool)

(assert (=> d!55435 (=> (not res!88858) (not e!123714))))

(declare-fun isStrictlySorted!347 (List!2373) Bool)

(assert (=> d!55435 (= res!88858 (isStrictlySorted!347 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))))

(assert (=> d!55435 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828) lt!92958)))

(declare-fun b!188006 () Bool)

(assert (=> b!188006 (= e!123714 (containsKey!231 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(assert (= (and d!55435 res!88858) b!188006))

(assert (=> d!55435 m!214033))

(assert (=> d!55435 m!214033))

(assert (=> d!55435 m!214035))

(declare-fun m!214293 () Bool)

(assert (=> d!55435 m!214293))

(declare-fun m!214295 () Bool)

(assert (=> d!55435 m!214295))

(assert (=> b!188006 m!214029))

(assert (=> b!187746 d!55435))

(declare-fun d!55437 () Bool)

(declare-fun isEmpty!482 (Option!233) Bool)

(assert (=> d!55437 (= (isDefined!181 (getValueByKey!227 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828)) (not (isEmpty!482 (getValueByKey!227 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))))

(declare-fun bs!7559 () Bool)

(assert (= bs!7559 d!55437))

(assert (=> bs!7559 m!214033))

(declare-fun m!214297 () Bool)

(assert (=> bs!7559 m!214297))

(assert (=> b!187746 d!55437))

(declare-fun b!188017 () Bool)

(declare-fun e!123720 () Option!233)

(assert (=> b!188017 (= e!123720 (getValueByKey!227 (t!7258 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) key!828))))

(declare-fun d!55439 () Bool)

(declare-fun c!33790 () Bool)

(assert (=> d!55439 (= c!33790 (and ((_ is Cons!2369) (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) (= (_1!1734 (h!3005 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) key!828)))))

(declare-fun e!123719 () Option!233)

(assert (=> d!55439 (= (getValueByKey!227 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828) e!123719)))

(declare-fun b!188016 () Bool)

(assert (=> b!188016 (= e!123719 e!123720)))

(declare-fun c!33791 () Bool)

(assert (=> b!188016 (= c!33791 (and ((_ is Cons!2369) (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) (not (= (_1!1734 (h!3005 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) key!828))))))

(declare-fun b!188015 () Bool)

(assert (=> b!188015 (= e!123719 (Some!232 (_2!1734 (h!3005 (toList!1193 (getCurrentListMap!826 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))))))

(declare-fun b!188018 () Bool)

(assert (=> b!188018 (= e!123720 None!231)))

(assert (= (and d!55439 c!33790) b!188015))

(assert (= (and d!55439 (not c!33790)) b!188016))

(assert (= (and b!188016 c!33791) b!188017))

(assert (= (and b!188016 (not c!33791)) b!188018))

(declare-fun m!214299 () Bool)

(assert (=> b!188017 m!214299))

(assert (=> b!187746 d!55439))

(assert (=> d!55363 d!55361))

(declare-fun d!55441 () Bool)

(declare-fun e!123723 () Bool)

(assert (=> d!55441 e!123723))

(declare-fun res!88863 () Bool)

(assert (=> d!55441 (=> (not res!88863) (not e!123723))))

(declare-fun lt!92961 () SeekEntryResult!653)

(assert (=> d!55441 (= res!88863 ((_ is Found!653) lt!92961))))

(assert (=> d!55441 (= lt!92961 (seekEntryOrOpen!0 key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(assert (=> d!55441 true))

(declare-fun _$33!135 () Unit!5627)

(assert (=> d!55441 (= (choose!1008 (_keys!5784 thiss!1248) (_values!3813 thiss!1248) (mask!8983 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)) _$33!135)))

(declare-fun b!188023 () Bool)

(declare-fun res!88864 () Bool)

(assert (=> b!188023 (=> (not res!88864) (not e!123723))))

(assert (=> b!188023 (= res!88864 (inRange!0 (index!4783 lt!92961) (mask!8983 thiss!1248)))))

(declare-fun b!188024 () Bool)

(assert (=> b!188024 (= e!123723 (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4783 lt!92961)) key!828))))

(assert (= (and d!55441 res!88863) b!188023))

(assert (= (and b!188023 res!88864) b!188024))

(assert (=> d!55441 m!213955))

(declare-fun m!214301 () Bool)

(assert (=> b!188023 m!214301))

(declare-fun m!214303 () Bool)

(assert (=> b!188024 m!214303))

(assert (=> d!55363 d!55441))

(assert (=> d!55363 d!55367))

(declare-fun d!55443 () Bool)

(declare-fun res!88870 () Bool)

(declare-fun e!123730 () Bool)

(assert (=> d!55443 (=> res!88870 e!123730)))

(assert (=> d!55443 (= res!88870 (bvsge #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(assert (=> d!55443 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)) e!123730)))

(declare-fun b!188033 () Bool)

(declare-fun e!123731 () Bool)

(assert (=> b!188033 (= e!123730 e!123731)))

(declare-fun c!33794 () Bool)

(assert (=> b!188033 (= c!33794 (validKeyInArray!0 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18943 () Bool)

(declare-fun call!18946 () Bool)

(assert (=> bm!18943 (= call!18946 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(declare-fun b!188034 () Bool)

(declare-fun e!123732 () Bool)

(assert (=> b!188034 (= e!123731 e!123732)))

(declare-fun lt!92970 () (_ BitVec 64))

(assert (=> b!188034 (= lt!92970 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92968 () Unit!5627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7973 (_ BitVec 64) (_ BitVec 32)) Unit!5627)

(assert (=> b!188034 (= lt!92968 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5784 thiss!1248) lt!92970 #b00000000000000000000000000000000))))

(assert (=> b!188034 (arrayContainsKey!0 (_keys!5784 thiss!1248) lt!92970 #b00000000000000000000000000000000)))

(declare-fun lt!92969 () Unit!5627)

(assert (=> b!188034 (= lt!92969 lt!92968)))

(declare-fun res!88869 () Bool)

(assert (=> b!188034 (= res!88869 (= (seekEntryOrOpen!0 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000) (_keys!5784 thiss!1248) (mask!8983 thiss!1248)) (Found!653 #b00000000000000000000000000000000)))))

(assert (=> b!188034 (=> (not res!88869) (not e!123732))))

(declare-fun b!188035 () Bool)

(assert (=> b!188035 (= e!123732 call!18946)))

(declare-fun b!188036 () Bool)

(assert (=> b!188036 (= e!123731 call!18946)))

(assert (= (and d!55443 (not res!88870)) b!188033))

(assert (= (and b!188033 c!33794) b!188034))

(assert (= (and b!188033 (not c!33794)) b!188036))

(assert (= (and b!188034 res!88869) b!188035))

(assert (= (or b!188035 b!188036) bm!18943))

(assert (=> b!188033 m!214037))

(assert (=> b!188033 m!214037))

(assert (=> b!188033 m!214039))

(declare-fun m!214305 () Bool)

(assert (=> bm!18943 m!214305))

(assert (=> b!188034 m!214037))

(declare-fun m!214307 () Bool)

(assert (=> b!188034 m!214307))

(declare-fun m!214309 () Bool)

(assert (=> b!188034 m!214309))

(assert (=> b!188034 m!214037))

(declare-fun m!214311 () Bool)

(assert (=> b!188034 m!214311))

(assert (=> b!187845 d!55443))

(declare-fun d!55445 () Bool)

(assert (=> d!55445 (= (apply!172 lt!92848 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)) (get!2167 (getValueByKey!227 (toList!1193 lt!92848) (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7560 () Bool)

(assert (= bs!7560 d!55445))

(assert (=> bs!7560 m!214037))

(declare-fun m!214313 () Bool)

(assert (=> bs!7560 m!214313))

(assert (=> bs!7560 m!214313))

(declare-fun m!214315 () Bool)

(assert (=> bs!7560 m!214315))

(assert (=> b!187797 d!55445))

(declare-fun d!55447 () Bool)

(declare-fun c!33797 () Bool)

(assert (=> d!55447 (= c!33797 ((_ is ValueCellFull!1850) (select (arr!3761 (_values!3813 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!123735 () V!5497)

(assert (=> d!55447 (= (get!2166 (select (arr!3761 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!123735)))

(declare-fun b!188041 () Bool)

(declare-fun get!2168 (ValueCell!1850 V!5497) V!5497)

(assert (=> b!188041 (= e!123735 (get!2168 (select (arr!3761 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!188042 () Bool)

(declare-fun get!2169 (ValueCell!1850 V!5497) V!5497)

(assert (=> b!188042 (= e!123735 (get!2169 (select (arr!3761 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55447 c!33797) b!188041))

(assert (= (and d!55447 (not c!33797)) b!188042))

(assert (=> b!188041 m!214051))

(assert (=> b!188041 m!214049))

(declare-fun m!214317 () Bool)

(assert (=> b!188041 m!214317))

(assert (=> b!188042 m!214051))

(assert (=> b!188042 m!214049))

(declare-fun m!214319 () Bool)

(assert (=> b!188042 m!214319))

(assert (=> b!187797 d!55447))

(declare-fun d!55449 () Bool)

(assert (=> d!55449 (= (apply!172 lt!92848 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2167 (getValueByKey!227 (toList!1193 lt!92848) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7561 () Bool)

(assert (= bs!7561 d!55449))

(assert (=> bs!7561 m!214261))

(assert (=> bs!7561 m!214261))

(declare-fun m!214321 () Bool)

(assert (=> bs!7561 m!214321))

(assert (=> b!187795 d!55449))

(assert (=> bm!18918 d!55391))

(declare-fun d!55451 () Bool)

(assert (=> d!55451 (= (inRange!0 (ite c!33749 (index!4782 lt!92864) (index!4785 lt!92864)) (mask!8983 thiss!1248)) (and (bvsge (ite c!33749 (index!4782 lt!92864) (index!4785 lt!92864)) #b00000000000000000000000000000000) (bvslt (ite c!33749 (index!4782 lt!92864) (index!4785 lt!92864)) (bvadd (mask!8983 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18928 d!55451))

(declare-fun d!55453 () Bool)

(declare-fun e!123736 () Bool)

(assert (=> d!55453 e!123736))

(declare-fun res!88871 () Bool)

(assert (=> d!55453 (=> res!88871 e!123736)))

(declare-fun lt!92973 () Bool)

(assert (=> d!55453 (= res!88871 (not lt!92973))))

(declare-fun lt!92974 () Bool)

(assert (=> d!55453 (= lt!92973 lt!92974)))

(declare-fun lt!92971 () Unit!5627)

(declare-fun e!123737 () Unit!5627)

(assert (=> d!55453 (= lt!92971 e!123737)))

(declare-fun c!33798 () Bool)

(assert (=> d!55453 (= c!33798 lt!92974)))

(assert (=> d!55453 (= lt!92974 (containsKey!231 (toList!1193 lt!92848) (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55453 (= (contains!1301 lt!92848 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)) lt!92973)))

(declare-fun b!188043 () Bool)

(declare-fun lt!92972 () Unit!5627)

(assert (=> b!188043 (= e!123737 lt!92972)))

(assert (=> b!188043 (= lt!92972 (lemmaContainsKeyImpliesGetValueByKeyDefined!180 (toList!1193 lt!92848) (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188043 (isDefined!181 (getValueByKey!227 (toList!1193 lt!92848) (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188044 () Bool)

(declare-fun Unit!5638 () Unit!5627)

(assert (=> b!188044 (= e!123737 Unit!5638)))

(declare-fun b!188045 () Bool)

(assert (=> b!188045 (= e!123736 (isDefined!181 (getValueByKey!227 (toList!1193 lt!92848) (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55453 c!33798) b!188043))

(assert (= (and d!55453 (not c!33798)) b!188044))

(assert (= (and d!55453 (not res!88871)) b!188045))

(assert (=> d!55453 m!214037))

(declare-fun m!214323 () Bool)

(assert (=> d!55453 m!214323))

(assert (=> b!188043 m!214037))

(declare-fun m!214325 () Bool)

(assert (=> b!188043 m!214325))

(assert (=> b!188043 m!214037))

(assert (=> b!188043 m!214313))

(assert (=> b!188043 m!214313))

(declare-fun m!214327 () Bool)

(assert (=> b!188043 m!214327))

(assert (=> b!188045 m!214037))

(assert (=> b!188045 m!214313))

(assert (=> b!188045 m!214313))

(assert (=> b!188045 m!214327))

(assert (=> b!187800 d!55453))

(declare-fun b!188056 () Bool)

(declare-fun e!123746 () Bool)

(declare-fun call!18949 () Bool)

(assert (=> b!188056 (= e!123746 call!18949)))

(declare-fun b!188057 () Bool)

(declare-fun e!123748 () Bool)

(declare-fun e!123747 () Bool)

(assert (=> b!188057 (= e!123748 e!123747)))

(declare-fun res!88878 () Bool)

(assert (=> b!188057 (=> (not res!88878) (not e!123747))))

(declare-fun e!123749 () Bool)

(assert (=> b!188057 (= res!88878 (not e!123749))))

(declare-fun res!88880 () Bool)

(assert (=> b!188057 (=> (not res!88880) (not e!123749))))

(assert (=> b!188057 (= res!88880 (validKeyInArray!0 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188058 () Bool)

(assert (=> b!188058 (= e!123747 e!123746)))

(declare-fun c!33801 () Bool)

(assert (=> b!188058 (= c!33801 (validKeyInArray!0 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55455 () Bool)

(declare-fun res!88879 () Bool)

(assert (=> d!55455 (=> res!88879 e!123748)))

(assert (=> d!55455 (= res!88879 (bvsge #b00000000000000000000000000000000 (size!4080 (_keys!5784 thiss!1248))))))

(assert (=> d!55455 (= (arrayNoDuplicates!0 (_keys!5784 thiss!1248) #b00000000000000000000000000000000 Nil!2372) e!123748)))

(declare-fun bm!18946 () Bool)

(assert (=> bm!18946 (= call!18949 (arrayNoDuplicates!0 (_keys!5784 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33801 (Cons!2371 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000) Nil!2372) Nil!2372)))))

(declare-fun b!188059 () Bool)

(assert (=> b!188059 (= e!123746 call!18949)))

(declare-fun b!188060 () Bool)

(declare-fun contains!1304 (List!2375 (_ BitVec 64)) Bool)

(assert (=> b!188060 (= e!123749 (contains!1304 Nil!2372 (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55455 (not res!88879)) b!188057))

(assert (= (and b!188057 res!88880) b!188060))

(assert (= (and b!188057 res!88878) b!188058))

(assert (= (and b!188058 c!33801) b!188056))

(assert (= (and b!188058 (not c!33801)) b!188059))

(assert (= (or b!188056 b!188059) bm!18946))

(assert (=> b!188057 m!214037))

(assert (=> b!188057 m!214037))

(assert (=> b!188057 m!214039))

(assert (=> b!188058 m!214037))

(assert (=> b!188058 m!214037))

(assert (=> b!188058 m!214039))

(assert (=> bm!18946 m!214037))

(declare-fun m!214329 () Bool)

(assert (=> bm!18946 m!214329))

(assert (=> b!188060 m!214037))

(assert (=> b!188060 m!214037))

(declare-fun m!214331 () Bool)

(assert (=> b!188060 m!214331))

(assert (=> b!187846 d!55455))

(assert (=> b!187748 d!55437))

(assert (=> b!187748 d!55439))

(declare-fun d!55457 () Bool)

(declare-fun res!88885 () Bool)

(declare-fun e!123754 () Bool)

(assert (=> d!55457 (=> res!88885 e!123754)))

(assert (=> d!55457 (= res!88885 (= (select (arr!3760 (_keys!5784 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55457 (= (arrayContainsKey!0 (_keys!5784 thiss!1248) key!828 #b00000000000000000000000000000000) e!123754)))

(declare-fun b!188065 () Bool)

(declare-fun e!123755 () Bool)

(assert (=> b!188065 (= e!123754 e!123755)))

(declare-fun res!88886 () Bool)

(assert (=> b!188065 (=> (not res!88886) (not e!123755))))

(assert (=> b!188065 (= res!88886 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4080 (_keys!5784 thiss!1248))))))

(declare-fun b!188066 () Bool)

(assert (=> b!188066 (= e!123755 (arrayContainsKey!0 (_keys!5784 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55457 (not res!88885)) b!188065))

(assert (= (and b!188065 res!88886) b!188066))

(assert (=> d!55457 m!214037))

(declare-fun m!214333 () Bool)

(assert (=> b!188066 m!214333))

(assert (=> bm!18927 d!55457))

(assert (=> b!187799 d!55383))

(declare-fun b!188079 () Bool)

(declare-fun e!123763 () SeekEntryResult!653)

(assert (=> b!188079 (= e!123763 (Found!653 (index!4784 lt!92772)))))

(declare-fun e!123764 () SeekEntryResult!653)

(declare-fun b!188080 () Bool)

(assert (=> b!188080 (= e!123764 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20312 lt!92772) #b00000000000000000000000000000001) (nextIndex!0 (index!4784 lt!92772) (x!20312 lt!92772) (mask!8983 thiss!1248)) (index!4784 lt!92772) key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)))))

(declare-fun b!188082 () Bool)

(declare-fun c!33808 () Bool)

(declare-fun lt!92979 () (_ BitVec 64))

(assert (=> b!188082 (= c!33808 (= lt!92979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188082 (= e!123763 e!123764)))

(declare-fun lt!92980 () SeekEntryResult!653)

(declare-fun d!55459 () Bool)

(assert (=> d!55459 (and (or ((_ is Undefined!653) lt!92980) (not ((_ is Found!653) lt!92980)) (and (bvsge (index!4783 lt!92980) #b00000000000000000000000000000000) (bvslt (index!4783 lt!92980) (size!4080 (_keys!5784 thiss!1248))))) (or ((_ is Undefined!653) lt!92980) ((_ is Found!653) lt!92980) (not ((_ is MissingVacant!653) lt!92980)) (not (= (index!4785 lt!92980) (index!4784 lt!92772))) (and (bvsge (index!4785 lt!92980) #b00000000000000000000000000000000) (bvslt (index!4785 lt!92980) (size!4080 (_keys!5784 thiss!1248))))) (or ((_ is Undefined!653) lt!92980) (ite ((_ is Found!653) lt!92980) (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4783 lt!92980)) key!828) (and ((_ is MissingVacant!653) lt!92980) (= (index!4785 lt!92980) (index!4784 lt!92772)) (= (select (arr!3760 (_keys!5784 thiss!1248)) (index!4785 lt!92980)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!123762 () SeekEntryResult!653)

(assert (=> d!55459 (= lt!92980 e!123762)))

(declare-fun c!33810 () Bool)

(assert (=> d!55459 (= c!33810 (bvsge (x!20312 lt!92772) #b01111111111111111111111111111110))))

(assert (=> d!55459 (= lt!92979 (select (arr!3760 (_keys!5784 thiss!1248)) (index!4784 lt!92772)))))

(assert (=> d!55459 (validMask!0 (mask!8983 thiss!1248))))

(assert (=> d!55459 (= (seekKeyOrZeroReturnVacant!0 (x!20312 lt!92772) (index!4784 lt!92772) (index!4784 lt!92772) key!828 (_keys!5784 thiss!1248) (mask!8983 thiss!1248)) lt!92980)))

(declare-fun b!188081 () Bool)

(assert (=> b!188081 (= e!123762 e!123763)))

(declare-fun c!33809 () Bool)

(assert (=> b!188081 (= c!33809 (= lt!92979 key!828))))

(declare-fun b!188083 () Bool)

(assert (=> b!188083 (= e!123762 Undefined!653)))

(declare-fun b!188084 () Bool)

(assert (=> b!188084 (= e!123764 (MissingVacant!653 (index!4784 lt!92772)))))

(assert (= (and d!55459 c!33810) b!188083))

(assert (= (and d!55459 (not c!33810)) b!188081))

(assert (= (and b!188081 c!33809) b!188079))

(assert (= (and b!188081 (not c!33809)) b!188082))

(assert (= (and b!188082 c!33808) b!188084))

(assert (= (and b!188082 (not c!33808)) b!188080))

(declare-fun m!214335 () Bool)

(assert (=> b!188080 m!214335))

(assert (=> b!188080 m!214335))

(declare-fun m!214337 () Bool)

(assert (=> b!188080 m!214337))

(declare-fun m!214339 () Bool)

(assert (=> d!55459 m!214339))

(declare-fun m!214341 () Bool)

(assert (=> d!55459 m!214341))

(assert (=> d!55459 m!214009))

(assert (=> d!55459 m!213947))

(assert (=> b!187731 d!55459))

(declare-fun mapIsEmpty!7570 () Bool)

(declare-fun mapRes!7570 () Bool)

(assert (=> mapIsEmpty!7570 mapRes!7570))

(declare-fun b!188086 () Bool)

(declare-fun e!123765 () Bool)

(assert (=> b!188086 (= e!123765 tp_is_empty!4387)))

(declare-fun b!188085 () Bool)

(declare-fun e!123766 () Bool)

(assert (=> b!188085 (= e!123766 tp_is_empty!4387)))

(declare-fun mapNonEmpty!7570 () Bool)

(declare-fun tp!16678 () Bool)

(assert (=> mapNonEmpty!7570 (= mapRes!7570 (and tp!16678 e!123766))))

(declare-fun mapValue!7570 () ValueCell!1850)

(declare-fun mapRest!7570 () (Array (_ BitVec 32) ValueCell!1850))

(declare-fun mapKey!7570 () (_ BitVec 32))

(assert (=> mapNonEmpty!7570 (= mapRest!7569 (store mapRest!7570 mapKey!7570 mapValue!7570))))

(declare-fun condMapEmpty!7570 () Bool)

(declare-fun mapDefault!7570 () ValueCell!1850)

(assert (=> mapNonEmpty!7569 (= condMapEmpty!7570 (= mapRest!7569 ((as const (Array (_ BitVec 32) ValueCell!1850)) mapDefault!7570)))))

(assert (=> mapNonEmpty!7569 (= tp!16677 (and e!123765 mapRes!7570))))

(assert (= (and mapNonEmpty!7569 condMapEmpty!7570) mapIsEmpty!7570))

(assert (= (and mapNonEmpty!7569 (not condMapEmpty!7570)) mapNonEmpty!7570))

(assert (= (and mapNonEmpty!7570 ((_ is ValueCellFull!1850) mapValue!7570)) b!188085))

(assert (= (and mapNonEmpty!7569 ((_ is ValueCellFull!1850) mapDefault!7570)) b!188086))

(declare-fun m!214343 () Bool)

(assert (=> mapNonEmpty!7570 m!214343))

(declare-fun b_lambda!7289 () Bool)

(assert (= b_lambda!7285 (or (and b!187645 b_free!4615) b_lambda!7289)))

(declare-fun b_lambda!7291 () Bool)

(assert (= b_lambda!7287 (or (and b!187645 b_free!4615) b_lambda!7291)))

(check-sat (not b!187929) (not b!187922) (not d!55425) (not b!187920) (not d!55389) (not b!187989) (not b!187935) (not b!187944) (not b!188045) (not b!187887) (not d!55379) (not b!188017) (not d!55405) (not d!55377) (not d!55445) (not b_lambda!7283) (not b!188001) (not d!55411) (not d!55395) (not b!187923) (not b!187973) (not b!187928) (not d!55409) (not b!188006) (not d!55423) (not b!187976) (not b!188057) (not d!55407) (not bm!18946) (not b!188023) (not b!188066) (not d!55427) (not d!55459) (not b!187936) (not b_lambda!7291) (not b!188043) (not d!55435) (not d!55401) (not bm!18943) (not b!187855) (not b!187977) (not b!187942) (not b!187939) tp_is_empty!4387 (not b!188058) (not d!55441) (not bm!18940) (not d!55413) (not b_lambda!7289) (not b!187979) (not b!188060) (not b!187919) (not d!55415) (not b!187943) (not b!187921) (not d!55431) (not d!55403) (not d!55391) (not mapNonEmpty!7570) (not b!187990) (not bm!18937) (not d!55449) b_and!11223 (not b!188041) (not b!187888) (not b!187978) (not d!55417) (not b!188034) (not b!187975) (not b!187967) (not d!55399) (not d!55393) (not b!187890) (not d!55387) (not b!188080) (not d!55429) (not d!55453) (not b!188033) (not bm!18933) (not d!55437) (not b_next!4615) (not bm!18934) (not b!187940) (not b!188042) (not d!55419) (not b!187927) (not b!187857) (not d!55397) (not b!187941))
(check-sat b_and!11223 (not b_next!4615))
