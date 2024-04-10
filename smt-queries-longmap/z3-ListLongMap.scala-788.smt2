; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18774 () Bool)

(assert start!18774)

(declare-fun b!185535 () Bool)

(declare-fun b_free!4569 () Bool)

(declare-fun b_next!4569 () Bool)

(assert (=> b!185535 (= b_free!4569 (not b_next!4569))))

(declare-fun tp!16503 () Bool)

(declare-fun b_and!11169 () Bool)

(assert (=> b!185535 (= tp!16503 b_and!11169)))

(declare-fun b!185532 () Bool)

(declare-fun res!87772 () Bool)

(declare-fun e!122089 () Bool)

(assert (=> b!185532 (=> (not res!87772) (not e!122089))))

(declare-datatypes ((V!5435 0))(
  ( (V!5436 (val!2215 Int)) )
))
(declare-datatypes ((ValueCell!1827 0))(
  ( (ValueCellFull!1827 (v!4125 V!5435)) (EmptyCell!1827) )
))
(declare-datatypes ((array!7889 0))(
  ( (array!7890 (arr!3725 (Array (_ BitVec 32) (_ BitVec 64))) (size!4041 (_ BitVec 32))) )
))
(declare-datatypes ((array!7891 0))(
  ( (array!7892 (arr!3726 (Array (_ BitVec 32) ValueCell!1827)) (size!4042 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2562 0))(
  ( (LongMapFixedSize!2563 (defaultEntry!3782 Int) (mask!8890 (_ BitVec 32)) (extraKeys!3519 (_ BitVec 32)) (zeroValue!3623 V!5435) (minValue!3623 V!5435) (_size!1330 (_ BitVec 32)) (_keys!5721 array!7889) (_values!3765 array!7891) (_vacant!1330 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2562)

(assert (=> b!185532 (= res!87772 (and (= (size!4042 (_values!3765 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8890 thiss!1248))) (= (size!4041 (_keys!5721 thiss!1248)) (size!4042 (_values!3765 thiss!1248))) (bvsge (mask!8890 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3519 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3519 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!185533 () Bool)

(declare-fun e!122084 () Bool)

(assert (=> b!185533 (= e!122084 e!122089)))

(declare-fun res!87770 () Bool)

(assert (=> b!185533 (=> (not res!87770) (not e!122089))))

(declare-datatypes ((SeekEntryResult!634 0))(
  ( (MissingZero!634 (index!4706 (_ BitVec 32))) (Found!634 (index!4707 (_ BitVec 32))) (Intermediate!634 (undefined!1446 Bool) (index!4708 (_ BitVec 32)) (x!20146 (_ BitVec 32))) (Undefined!634) (MissingVacant!634 (index!4709 (_ BitVec 32))) )
))
(declare-fun lt!91752 () SeekEntryResult!634)

(get-info :version)

(assert (=> b!185533 (= res!87770 (and (not ((_ is Undefined!634) lt!91752)) (not ((_ is MissingVacant!634) lt!91752)) (not ((_ is MissingZero!634) lt!91752)) ((_ is Found!634) lt!91752)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7889 (_ BitVec 32)) SeekEntryResult!634)

(assert (=> b!185533 (= lt!91752 (seekEntryOrOpen!0 key!828 (_keys!5721 thiss!1248) (mask!8890 thiss!1248)))))

(declare-fun b!185534 () Bool)

(declare-fun res!87769 () Bool)

(assert (=> b!185534 (=> (not res!87769) (not e!122089))))

(declare-datatypes ((tuple2!3450 0))(
  ( (tuple2!3451 (_1!1736 (_ BitVec 64)) (_2!1736 V!5435)) )
))
(declare-datatypes ((List!2361 0))(
  ( (Nil!2358) (Cons!2357 (h!2990 tuple2!3450) (t!7243 List!2361)) )
))
(declare-datatypes ((ListLongMap!2367 0))(
  ( (ListLongMap!2368 (toList!1199 List!2361)) )
))
(declare-fun contains!1294 (ListLongMap!2367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!847 (array!7889 array!7891 (_ BitVec 32) (_ BitVec 32) V!5435 V!5435 (_ BitVec 32) Int) ListLongMap!2367)

(assert (=> b!185534 (= res!87769 (not (contains!1294 (getCurrentListMap!847 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248)) key!828)))))

(declare-fun tp_is_empty!4341 () Bool)

(declare-fun e!122087 () Bool)

(declare-fun e!122085 () Bool)

(declare-fun array_inv!2411 (array!7889) Bool)

(declare-fun array_inv!2412 (array!7891) Bool)

(assert (=> b!185535 (= e!122085 (and tp!16503 tp_is_empty!4341 (array_inv!2411 (_keys!5721 thiss!1248)) (array_inv!2412 (_values!3765 thiss!1248)) e!122087))))

(declare-fun res!87771 () Bool)

(assert (=> start!18774 (=> (not res!87771) (not e!122084))))

(declare-fun valid!1057 (LongMapFixedSize!2562) Bool)

(assert (=> start!18774 (= res!87771 (valid!1057 thiss!1248))))

(assert (=> start!18774 e!122084))

(assert (=> start!18774 e!122085))

(assert (=> start!18774 true))

(declare-fun b!185536 () Bool)

(declare-fun e!122086 () Bool)

(assert (=> b!185536 (= e!122086 tp_is_empty!4341)))

(declare-fun b!185537 () Bool)

(declare-fun e!122083 () Bool)

(assert (=> b!185537 (= e!122083 tp_is_empty!4341)))

(declare-fun mapIsEmpty!7470 () Bool)

(declare-fun mapRes!7470 () Bool)

(assert (=> mapIsEmpty!7470 mapRes!7470))

(declare-fun b!185538 () Bool)

(declare-fun res!87767 () Bool)

(assert (=> b!185538 (=> (not res!87767) (not e!122089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185538 (= res!87767 (validMask!0 (mask!8890 thiss!1248)))))

(declare-fun b!185539 () Bool)

(declare-fun res!87768 () Bool)

(assert (=> b!185539 (=> (not res!87768) (not e!122089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7889 (_ BitVec 32)) Bool)

(assert (=> b!185539 (= res!87768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5721 thiss!1248) (mask!8890 thiss!1248)))))

(declare-fun b!185540 () Bool)

(assert (=> b!185540 (= e!122087 (and e!122086 mapRes!7470))))

(declare-fun condMapEmpty!7470 () Bool)

(declare-fun mapDefault!7470 () ValueCell!1827)

(assert (=> b!185540 (= condMapEmpty!7470 (= (arr!3726 (_values!3765 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1827)) mapDefault!7470)))))

(declare-fun b!185541 () Bool)

(declare-fun res!87773 () Bool)

(assert (=> b!185541 (=> (not res!87773) (not e!122084))))

(assert (=> b!185541 (= res!87773 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185542 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!185542 (= e!122089 (not (validKeyInArray!0 key!828)))))

(declare-fun b!185543 () Bool)

(declare-fun res!87766 () Bool)

(assert (=> b!185543 (=> (not res!87766) (not e!122089))))

(declare-datatypes ((List!2362 0))(
  ( (Nil!2359) (Cons!2358 (h!2991 (_ BitVec 64)) (t!7244 List!2362)) )
))
(declare-fun arrayNoDuplicates!0 (array!7889 (_ BitVec 32) List!2362) Bool)

(assert (=> b!185543 (= res!87766 (arrayNoDuplicates!0 (_keys!5721 thiss!1248) #b00000000000000000000000000000000 Nil!2359))))

(declare-fun mapNonEmpty!7470 () Bool)

(declare-fun tp!16502 () Bool)

(assert (=> mapNonEmpty!7470 (= mapRes!7470 (and tp!16502 e!122083))))

(declare-fun mapValue!7470 () ValueCell!1827)

(declare-fun mapKey!7470 () (_ BitVec 32))

(declare-fun mapRest!7470 () (Array (_ BitVec 32) ValueCell!1827))

(assert (=> mapNonEmpty!7470 (= (arr!3726 (_values!3765 thiss!1248)) (store mapRest!7470 mapKey!7470 mapValue!7470))))

(assert (= (and start!18774 res!87771) b!185541))

(assert (= (and b!185541 res!87773) b!185533))

(assert (= (and b!185533 res!87770) b!185534))

(assert (= (and b!185534 res!87769) b!185538))

(assert (= (and b!185538 res!87767) b!185532))

(assert (= (and b!185532 res!87772) b!185539))

(assert (= (and b!185539 res!87768) b!185543))

(assert (= (and b!185543 res!87766) b!185542))

(assert (= (and b!185540 condMapEmpty!7470) mapIsEmpty!7470))

(assert (= (and b!185540 (not condMapEmpty!7470)) mapNonEmpty!7470))

(assert (= (and mapNonEmpty!7470 ((_ is ValueCellFull!1827) mapValue!7470)) b!185537))

(assert (= (and b!185540 ((_ is ValueCellFull!1827) mapDefault!7470)) b!185536))

(assert (= b!185535 b!185540))

(assert (= start!18774 b!185535))

(declare-fun m!212723 () Bool)

(assert (=> start!18774 m!212723))

(declare-fun m!212725 () Bool)

(assert (=> b!185533 m!212725))

(declare-fun m!212727 () Bool)

(assert (=> b!185542 m!212727))

(declare-fun m!212729 () Bool)

(assert (=> b!185535 m!212729))

(declare-fun m!212731 () Bool)

(assert (=> b!185535 m!212731))

(declare-fun m!212733 () Bool)

(assert (=> b!185538 m!212733))

(declare-fun m!212735 () Bool)

(assert (=> b!185534 m!212735))

(assert (=> b!185534 m!212735))

(declare-fun m!212737 () Bool)

(assert (=> b!185534 m!212737))

(declare-fun m!212739 () Bool)

(assert (=> b!185543 m!212739))

(declare-fun m!212741 () Bool)

(assert (=> mapNonEmpty!7470 m!212741))

(declare-fun m!212743 () Bool)

(assert (=> b!185539 m!212743))

(check-sat (not b!185535) (not start!18774) (not b_next!4569) tp_is_empty!4341 (not b!185539) (not b!185534) b_and!11169 (not b!185542) (not b!185533) (not b!185538) (not mapNonEmpty!7470) (not b!185543))
(check-sat b_and!11169 (not b_next!4569))
(get-model)

(declare-fun d!55117 () Bool)

(assert (=> d!55117 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185542 d!55117))

(declare-fun d!55119 () Bool)

(declare-fun res!87804 () Bool)

(declare-fun e!122113 () Bool)

(assert (=> d!55119 (=> (not res!87804) (not e!122113))))

(declare-fun simpleValid!182 (LongMapFixedSize!2562) Bool)

(assert (=> d!55119 (= res!87804 (simpleValid!182 thiss!1248))))

(assert (=> d!55119 (= (valid!1057 thiss!1248) e!122113)))

(declare-fun b!185586 () Bool)

(declare-fun res!87805 () Bool)

(assert (=> b!185586 (=> (not res!87805) (not e!122113))))

(declare-fun arrayCountValidKeys!0 (array!7889 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!185586 (= res!87805 (= (arrayCountValidKeys!0 (_keys!5721 thiss!1248) #b00000000000000000000000000000000 (size!4041 (_keys!5721 thiss!1248))) (_size!1330 thiss!1248)))))

(declare-fun b!185587 () Bool)

(declare-fun res!87806 () Bool)

(assert (=> b!185587 (=> (not res!87806) (not e!122113))))

(assert (=> b!185587 (= res!87806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5721 thiss!1248) (mask!8890 thiss!1248)))))

(declare-fun b!185588 () Bool)

(assert (=> b!185588 (= e!122113 (arrayNoDuplicates!0 (_keys!5721 thiss!1248) #b00000000000000000000000000000000 Nil!2359))))

(assert (= (and d!55119 res!87804) b!185586))

(assert (= (and b!185586 res!87805) b!185587))

(assert (= (and b!185587 res!87806) b!185588))

(declare-fun m!212767 () Bool)

(assert (=> d!55119 m!212767))

(declare-fun m!212769 () Bool)

(assert (=> b!185586 m!212769))

(assert (=> b!185587 m!212743))

(assert (=> b!185588 m!212739))

(assert (=> start!18774 d!55119))

(declare-fun bm!18712 () Bool)

(declare-fun call!18715 () Bool)

(assert (=> bm!18712 (= call!18715 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5721 thiss!1248) (mask!8890 thiss!1248)))))

(declare-fun b!185597 () Bool)

(declare-fun e!122121 () Bool)

(assert (=> b!185597 (= e!122121 call!18715)))

(declare-fun b!185598 () Bool)

(declare-fun e!122120 () Bool)

(assert (=> b!185598 (= e!122121 e!122120)))

(declare-fun lt!91763 () (_ BitVec 64))

(assert (=> b!185598 (= lt!91763 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5592 0))(
  ( (Unit!5593) )
))
(declare-fun lt!91764 () Unit!5592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7889 (_ BitVec 64) (_ BitVec 32)) Unit!5592)

(assert (=> b!185598 (= lt!91764 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5721 thiss!1248) lt!91763 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!185598 (arrayContainsKey!0 (_keys!5721 thiss!1248) lt!91763 #b00000000000000000000000000000000)))

(declare-fun lt!91762 () Unit!5592)

(assert (=> b!185598 (= lt!91762 lt!91764)))

(declare-fun res!87812 () Bool)

(assert (=> b!185598 (= res!87812 (= (seekEntryOrOpen!0 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000) (_keys!5721 thiss!1248) (mask!8890 thiss!1248)) (Found!634 #b00000000000000000000000000000000)))))

(assert (=> b!185598 (=> (not res!87812) (not e!122120))))

(declare-fun b!185599 () Bool)

(assert (=> b!185599 (= e!122120 call!18715)))

(declare-fun d!55121 () Bool)

(declare-fun res!87811 () Bool)

(declare-fun e!122122 () Bool)

(assert (=> d!55121 (=> res!87811 e!122122)))

(assert (=> d!55121 (= res!87811 (bvsge #b00000000000000000000000000000000 (size!4041 (_keys!5721 thiss!1248))))))

(assert (=> d!55121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5721 thiss!1248) (mask!8890 thiss!1248)) e!122122)))

(declare-fun b!185600 () Bool)

(assert (=> b!185600 (= e!122122 e!122121)))

(declare-fun c!33289 () Bool)

(assert (=> b!185600 (= c!33289 (validKeyInArray!0 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55121 (not res!87811)) b!185600))

(assert (= (and b!185600 c!33289) b!185598))

(assert (= (and b!185600 (not c!33289)) b!185597))

(assert (= (and b!185598 res!87812) b!185599))

(assert (= (or b!185599 b!185597) bm!18712))

(declare-fun m!212771 () Bool)

(assert (=> bm!18712 m!212771))

(declare-fun m!212773 () Bool)

(assert (=> b!185598 m!212773))

(declare-fun m!212775 () Bool)

(assert (=> b!185598 m!212775))

(declare-fun m!212777 () Bool)

(assert (=> b!185598 m!212777))

(assert (=> b!185598 m!212773))

(declare-fun m!212779 () Bool)

(assert (=> b!185598 m!212779))

(assert (=> b!185600 m!212773))

(assert (=> b!185600 m!212773))

(declare-fun m!212781 () Bool)

(assert (=> b!185600 m!212781))

(assert (=> b!185539 d!55121))

(declare-fun d!55123 () Bool)

(assert (=> d!55123 (= (array_inv!2411 (_keys!5721 thiss!1248)) (bvsge (size!4041 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185535 d!55123))

(declare-fun d!55125 () Bool)

(assert (=> d!55125 (= (array_inv!2412 (_values!3765 thiss!1248)) (bvsge (size!4042 (_values!3765 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185535 d!55125))

(declare-fun d!55127 () Bool)

(declare-fun lt!91772 () SeekEntryResult!634)

(assert (=> d!55127 (and (or ((_ is Undefined!634) lt!91772) (not ((_ is Found!634) lt!91772)) (and (bvsge (index!4707 lt!91772) #b00000000000000000000000000000000) (bvslt (index!4707 lt!91772) (size!4041 (_keys!5721 thiss!1248))))) (or ((_ is Undefined!634) lt!91772) ((_ is Found!634) lt!91772) (not ((_ is MissingZero!634) lt!91772)) (and (bvsge (index!4706 lt!91772) #b00000000000000000000000000000000) (bvslt (index!4706 lt!91772) (size!4041 (_keys!5721 thiss!1248))))) (or ((_ is Undefined!634) lt!91772) ((_ is Found!634) lt!91772) ((_ is MissingZero!634) lt!91772) (not ((_ is MissingVacant!634) lt!91772)) (and (bvsge (index!4709 lt!91772) #b00000000000000000000000000000000) (bvslt (index!4709 lt!91772) (size!4041 (_keys!5721 thiss!1248))))) (or ((_ is Undefined!634) lt!91772) (ite ((_ is Found!634) lt!91772) (= (select (arr!3725 (_keys!5721 thiss!1248)) (index!4707 lt!91772)) key!828) (ite ((_ is MissingZero!634) lt!91772) (= (select (arr!3725 (_keys!5721 thiss!1248)) (index!4706 lt!91772)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!634) lt!91772) (= (select (arr!3725 (_keys!5721 thiss!1248)) (index!4709 lt!91772)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!122131 () SeekEntryResult!634)

(assert (=> d!55127 (= lt!91772 e!122131)))

(declare-fun c!33296 () Bool)

(declare-fun lt!91771 () SeekEntryResult!634)

(assert (=> d!55127 (= c!33296 (and ((_ is Intermediate!634) lt!91771) (undefined!1446 lt!91771)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7889 (_ BitVec 32)) SeekEntryResult!634)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55127 (= lt!91771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8890 thiss!1248)) key!828 (_keys!5721 thiss!1248) (mask!8890 thiss!1248)))))

(assert (=> d!55127 (validMask!0 (mask!8890 thiss!1248))))

(assert (=> d!55127 (= (seekEntryOrOpen!0 key!828 (_keys!5721 thiss!1248) (mask!8890 thiss!1248)) lt!91772)))

(declare-fun b!185613 () Bool)

(declare-fun c!33298 () Bool)

(declare-fun lt!91773 () (_ BitVec 64))

(assert (=> b!185613 (= c!33298 (= lt!91773 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122129 () SeekEntryResult!634)

(declare-fun e!122130 () SeekEntryResult!634)

(assert (=> b!185613 (= e!122129 e!122130)))

(declare-fun b!185614 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7889 (_ BitVec 32)) SeekEntryResult!634)

(assert (=> b!185614 (= e!122130 (seekKeyOrZeroReturnVacant!0 (x!20146 lt!91771) (index!4708 lt!91771) (index!4708 lt!91771) key!828 (_keys!5721 thiss!1248) (mask!8890 thiss!1248)))))

(declare-fun b!185615 () Bool)

(assert (=> b!185615 (= e!122130 (MissingZero!634 (index!4708 lt!91771)))))

(declare-fun b!185616 () Bool)

(assert (=> b!185616 (= e!122129 (Found!634 (index!4708 lt!91771)))))

(declare-fun b!185617 () Bool)

(assert (=> b!185617 (= e!122131 Undefined!634)))

(declare-fun b!185618 () Bool)

(assert (=> b!185618 (= e!122131 e!122129)))

(assert (=> b!185618 (= lt!91773 (select (arr!3725 (_keys!5721 thiss!1248)) (index!4708 lt!91771)))))

(declare-fun c!33297 () Bool)

(assert (=> b!185618 (= c!33297 (= lt!91773 key!828))))

(assert (= (and d!55127 c!33296) b!185617))

(assert (= (and d!55127 (not c!33296)) b!185618))

(assert (= (and b!185618 c!33297) b!185616))

(assert (= (and b!185618 (not c!33297)) b!185613))

(assert (= (and b!185613 c!33298) b!185615))

(assert (= (and b!185613 (not c!33298)) b!185614))

(assert (=> d!55127 m!212733))

(declare-fun m!212783 () Bool)

(assert (=> d!55127 m!212783))

(declare-fun m!212785 () Bool)

(assert (=> d!55127 m!212785))

(declare-fun m!212787 () Bool)

(assert (=> d!55127 m!212787))

(assert (=> d!55127 m!212787))

(declare-fun m!212789 () Bool)

(assert (=> d!55127 m!212789))

(declare-fun m!212791 () Bool)

(assert (=> d!55127 m!212791))

(declare-fun m!212793 () Bool)

(assert (=> b!185614 m!212793))

(declare-fun m!212795 () Bool)

(assert (=> b!185618 m!212795))

(assert (=> b!185533 d!55127))

(declare-fun bm!18715 () Bool)

(declare-fun call!18718 () Bool)

(declare-fun c!33301 () Bool)

(assert (=> bm!18715 (= call!18718 (arrayNoDuplicates!0 (_keys!5721 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33301 (Cons!2358 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000) Nil!2359) Nil!2359)))))

(declare-fun b!185629 () Bool)

(declare-fun e!122143 () Bool)

(declare-fun e!122142 () Bool)

(assert (=> b!185629 (= e!122143 e!122142)))

(assert (=> b!185629 (= c!33301 (validKeyInArray!0 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55129 () Bool)

(declare-fun res!87820 () Bool)

(declare-fun e!122141 () Bool)

(assert (=> d!55129 (=> res!87820 e!122141)))

(assert (=> d!55129 (= res!87820 (bvsge #b00000000000000000000000000000000 (size!4041 (_keys!5721 thiss!1248))))))

(assert (=> d!55129 (= (arrayNoDuplicates!0 (_keys!5721 thiss!1248) #b00000000000000000000000000000000 Nil!2359) e!122141)))

(declare-fun b!185630 () Bool)

(assert (=> b!185630 (= e!122142 call!18718)))

(declare-fun b!185631 () Bool)

(assert (=> b!185631 (= e!122141 e!122143)))

(declare-fun res!87821 () Bool)

(assert (=> b!185631 (=> (not res!87821) (not e!122143))))

(declare-fun e!122140 () Bool)

(assert (=> b!185631 (= res!87821 (not e!122140))))

(declare-fun res!87819 () Bool)

(assert (=> b!185631 (=> (not res!87819) (not e!122140))))

(assert (=> b!185631 (= res!87819 (validKeyInArray!0 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185632 () Bool)

(declare-fun contains!1295 (List!2362 (_ BitVec 64)) Bool)

(assert (=> b!185632 (= e!122140 (contains!1295 Nil!2359 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185633 () Bool)

(assert (=> b!185633 (= e!122142 call!18718)))

(assert (= (and d!55129 (not res!87820)) b!185631))

(assert (= (and b!185631 res!87819) b!185632))

(assert (= (and b!185631 res!87821) b!185629))

(assert (= (and b!185629 c!33301) b!185630))

(assert (= (and b!185629 (not c!33301)) b!185633))

(assert (= (or b!185630 b!185633) bm!18715))

(assert (=> bm!18715 m!212773))

(declare-fun m!212797 () Bool)

(assert (=> bm!18715 m!212797))

(assert (=> b!185629 m!212773))

(assert (=> b!185629 m!212773))

(assert (=> b!185629 m!212781))

(assert (=> b!185631 m!212773))

(assert (=> b!185631 m!212773))

(assert (=> b!185631 m!212781))

(assert (=> b!185632 m!212773))

(assert (=> b!185632 m!212773))

(declare-fun m!212799 () Bool)

(assert (=> b!185632 m!212799))

(assert (=> b!185543 d!55129))

(declare-fun d!55131 () Bool)

(assert (=> d!55131 (= (validMask!0 (mask!8890 thiss!1248)) (and (or (= (mask!8890 thiss!1248) #b00000000000000000000000000000111) (= (mask!8890 thiss!1248) #b00000000000000000000000000001111) (= (mask!8890 thiss!1248) #b00000000000000000000000000011111) (= (mask!8890 thiss!1248) #b00000000000000000000000000111111) (= (mask!8890 thiss!1248) #b00000000000000000000000001111111) (= (mask!8890 thiss!1248) #b00000000000000000000000011111111) (= (mask!8890 thiss!1248) #b00000000000000000000000111111111) (= (mask!8890 thiss!1248) #b00000000000000000000001111111111) (= (mask!8890 thiss!1248) #b00000000000000000000011111111111) (= (mask!8890 thiss!1248) #b00000000000000000000111111111111) (= (mask!8890 thiss!1248) #b00000000000000000001111111111111) (= (mask!8890 thiss!1248) #b00000000000000000011111111111111) (= (mask!8890 thiss!1248) #b00000000000000000111111111111111) (= (mask!8890 thiss!1248) #b00000000000000001111111111111111) (= (mask!8890 thiss!1248) #b00000000000000011111111111111111) (= (mask!8890 thiss!1248) #b00000000000000111111111111111111) (= (mask!8890 thiss!1248) #b00000000000001111111111111111111) (= (mask!8890 thiss!1248) #b00000000000011111111111111111111) (= (mask!8890 thiss!1248) #b00000000000111111111111111111111) (= (mask!8890 thiss!1248) #b00000000001111111111111111111111) (= (mask!8890 thiss!1248) #b00000000011111111111111111111111) (= (mask!8890 thiss!1248) #b00000000111111111111111111111111) (= (mask!8890 thiss!1248) #b00000001111111111111111111111111) (= (mask!8890 thiss!1248) #b00000011111111111111111111111111) (= (mask!8890 thiss!1248) #b00000111111111111111111111111111) (= (mask!8890 thiss!1248) #b00001111111111111111111111111111) (= (mask!8890 thiss!1248) #b00011111111111111111111111111111) (= (mask!8890 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8890 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185538 d!55131))

(declare-fun d!55133 () Bool)

(declare-fun e!122149 () Bool)

(assert (=> d!55133 e!122149))

(declare-fun res!87824 () Bool)

(assert (=> d!55133 (=> res!87824 e!122149)))

(declare-fun lt!91783 () Bool)

(assert (=> d!55133 (= res!87824 (not lt!91783))))

(declare-fun lt!91784 () Bool)

(assert (=> d!55133 (= lt!91783 lt!91784)))

(declare-fun lt!91782 () Unit!5592)

(declare-fun e!122148 () Unit!5592)

(assert (=> d!55133 (= lt!91782 e!122148)))

(declare-fun c!33304 () Bool)

(assert (=> d!55133 (= c!33304 lt!91784)))

(declare-fun containsKey!227 (List!2361 (_ BitVec 64)) Bool)

(assert (=> d!55133 (= lt!91784 (containsKey!227 (toList!1199 (getCurrentListMap!847 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248))) key!828))))

(assert (=> d!55133 (= (contains!1294 (getCurrentListMap!847 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248)) key!828) lt!91783)))

(declare-fun b!185640 () Bool)

(declare-fun lt!91785 () Unit!5592)

(assert (=> b!185640 (= e!122148 lt!91785)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!175 (List!2361 (_ BitVec 64)) Unit!5592)

(assert (=> b!185640 (= lt!91785 (lemmaContainsKeyImpliesGetValueByKeyDefined!175 (toList!1199 (getCurrentListMap!847 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248))) key!828))))

(declare-datatypes ((Option!229 0))(
  ( (Some!228 (v!4127 V!5435)) (None!227) )
))
(declare-fun isDefined!176 (Option!229) Bool)

(declare-fun getValueByKey!223 (List!2361 (_ BitVec 64)) Option!229)

(assert (=> b!185640 (isDefined!176 (getValueByKey!223 (toList!1199 (getCurrentListMap!847 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248))) key!828))))

(declare-fun b!185641 () Bool)

(declare-fun Unit!5594 () Unit!5592)

(assert (=> b!185641 (= e!122148 Unit!5594)))

(declare-fun b!185642 () Bool)

(assert (=> b!185642 (= e!122149 (isDefined!176 (getValueByKey!223 (toList!1199 (getCurrentListMap!847 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248))) key!828)))))

(assert (= (and d!55133 c!33304) b!185640))

(assert (= (and d!55133 (not c!33304)) b!185641))

(assert (= (and d!55133 (not res!87824)) b!185642))

(declare-fun m!212801 () Bool)

(assert (=> d!55133 m!212801))

(declare-fun m!212803 () Bool)

(assert (=> b!185640 m!212803))

(declare-fun m!212805 () Bool)

(assert (=> b!185640 m!212805))

(assert (=> b!185640 m!212805))

(declare-fun m!212807 () Bool)

(assert (=> b!185640 m!212807))

(assert (=> b!185642 m!212805))

(assert (=> b!185642 m!212805))

(assert (=> b!185642 m!212807))

(assert (=> b!185534 d!55133))

(declare-fun b!185685 () Bool)

(declare-fun e!122187 () Bool)

(declare-fun lt!91838 () ListLongMap!2367)

(declare-fun apply!166 (ListLongMap!2367 (_ BitVec 64)) V!5435)

(assert (=> b!185685 (= e!122187 (= (apply!166 lt!91838 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3623 thiss!1248)))))

(declare-fun bm!18730 () Bool)

(declare-fun call!18739 () ListLongMap!2367)

(declare-fun getCurrentListMapNoExtraKeys!199 (array!7889 array!7891 (_ BitVec 32) (_ BitVec 32) V!5435 V!5435 (_ BitVec 32) Int) ListLongMap!2367)

(assert (=> bm!18730 (= call!18739 (getCurrentListMapNoExtraKeys!199 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248)))))

(declare-fun b!185686 () Bool)

(declare-fun e!122178 () ListLongMap!2367)

(declare-fun call!18736 () ListLongMap!2367)

(assert (=> b!185686 (= e!122178 call!18736)))

(declare-fun b!185687 () Bool)

(declare-fun e!122184 () ListLongMap!2367)

(declare-fun call!18734 () ListLongMap!2367)

(assert (=> b!185687 (= e!122184 call!18734)))

(declare-fun b!185688 () Bool)

(declare-fun e!122176 () Bool)

(declare-fun e!122182 () Bool)

(assert (=> b!185688 (= e!122176 e!122182)))

(declare-fun c!33321 () Bool)

(assert (=> b!185688 (= c!33321 (not (= (bvand (extraKeys!3519 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18731 () Bool)

(declare-fun call!18733 () ListLongMap!2367)

(assert (=> bm!18731 (= call!18733 call!18739)))

(declare-fun bm!18732 () Bool)

(declare-fun call!18738 () Bool)

(assert (=> bm!18732 (= call!18738 (contains!1294 lt!91838 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18733 () Bool)

(declare-fun call!18737 () Bool)

(assert (=> bm!18733 (= call!18737 (contains!1294 lt!91838 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185689 () Bool)

(declare-fun e!122185 () Unit!5592)

(declare-fun Unit!5595 () Unit!5592)

(assert (=> b!185689 (= e!122185 Unit!5595)))

(declare-fun d!55135 () Bool)

(assert (=> d!55135 e!122176))

(declare-fun res!87851 () Bool)

(assert (=> d!55135 (=> (not res!87851) (not e!122176))))

(assert (=> d!55135 (= res!87851 (or (bvsge #b00000000000000000000000000000000 (size!4041 (_keys!5721 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4041 (_keys!5721 thiss!1248))))))))

(declare-fun lt!91833 () ListLongMap!2367)

(assert (=> d!55135 (= lt!91838 lt!91833)))

(declare-fun lt!91850 () Unit!5592)

(assert (=> d!55135 (= lt!91850 e!122185)))

(declare-fun c!33320 () Bool)

(declare-fun e!122188 () Bool)

(assert (=> d!55135 (= c!33320 e!122188)))

(declare-fun res!87849 () Bool)

(assert (=> d!55135 (=> (not res!87849) (not e!122188))))

(assert (=> d!55135 (= res!87849 (bvslt #b00000000000000000000000000000000 (size!4041 (_keys!5721 thiss!1248))))))

(declare-fun e!122177 () ListLongMap!2367)

(assert (=> d!55135 (= lt!91833 e!122177)))

(declare-fun c!33317 () Bool)

(assert (=> d!55135 (= c!33317 (and (not (= (bvand (extraKeys!3519 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3519 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55135 (validMask!0 (mask!8890 thiss!1248))))

(assert (=> d!55135 (= (getCurrentListMap!847 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248)) lt!91838)))

(declare-fun b!185690 () Bool)

(declare-fun call!18735 () ListLongMap!2367)

(declare-fun +!286 (ListLongMap!2367 tuple2!3450) ListLongMap!2367)

(assert (=> b!185690 (= e!122177 (+!286 call!18735 (tuple2!3451 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3623 thiss!1248))))))

(declare-fun b!185691 () Bool)

(declare-fun e!122181 () Bool)

(assert (=> b!185691 (= e!122182 e!122181)))

(declare-fun res!87844 () Bool)

(assert (=> b!185691 (= res!87844 call!18738)))

(assert (=> b!185691 (=> (not res!87844) (not e!122181))))

(declare-fun b!185692 () Bool)

(assert (=> b!185692 (= e!122182 (not call!18738))))

(declare-fun b!185693 () Bool)

(declare-fun e!122180 () Bool)

(declare-fun get!2141 (ValueCell!1827 V!5435) V!5435)

(declare-fun dynLambda!509 (Int (_ BitVec 64)) V!5435)

(assert (=> b!185693 (= e!122180 (= (apply!166 lt!91838 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000)) (get!2141 (select (arr!3726 (_values!3765 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!509 (defaultEntry!3782 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4042 (_values!3765 thiss!1248))))))

(assert (=> b!185693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4041 (_keys!5721 thiss!1248))))))

(declare-fun b!185694 () Bool)

(assert (=> b!185694 (= e!122188 (validKeyInArray!0 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun c!33319 () Bool)

(declare-fun bm!18734 () Bool)

(assert (=> bm!18734 (= call!18735 (+!286 (ite c!33317 call!18739 (ite c!33319 call!18733 call!18736)) (ite (or c!33317 c!33319) (tuple2!3451 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3623 thiss!1248)) (tuple2!3451 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3623 thiss!1248)))))))

(declare-fun b!185695 () Bool)

(declare-fun e!122183 () Bool)

(assert (=> b!185695 (= e!122183 (validKeyInArray!0 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185696 () Bool)

(declare-fun res!87846 () Bool)

(assert (=> b!185696 (=> (not res!87846) (not e!122176))))

(declare-fun e!122186 () Bool)

(assert (=> b!185696 (= res!87846 e!122186)))

(declare-fun c!33318 () Bool)

(assert (=> b!185696 (= c!33318 (not (= (bvand (extraKeys!3519 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18735 () Bool)

(assert (=> bm!18735 (= call!18734 call!18735)))

(declare-fun b!185697 () Bool)

(assert (=> b!185697 (= e!122186 (not call!18737))))

(declare-fun b!185698 () Bool)

(assert (=> b!185698 (= e!122181 (= (apply!166 lt!91838 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3623 thiss!1248)))))

(declare-fun b!185699 () Bool)

(declare-fun lt!91830 () Unit!5592)

(assert (=> b!185699 (= e!122185 lt!91830)))

(declare-fun lt!91849 () ListLongMap!2367)

(assert (=> b!185699 (= lt!91849 (getCurrentListMapNoExtraKeys!199 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248)))))

(declare-fun lt!91840 () (_ BitVec 64))

(assert (=> b!185699 (= lt!91840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91851 () (_ BitVec 64))

(assert (=> b!185699 (= lt!91851 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91842 () Unit!5592)

(declare-fun addStillContains!142 (ListLongMap!2367 (_ BitVec 64) V!5435 (_ BitVec 64)) Unit!5592)

(assert (=> b!185699 (= lt!91842 (addStillContains!142 lt!91849 lt!91840 (zeroValue!3623 thiss!1248) lt!91851))))

(assert (=> b!185699 (contains!1294 (+!286 lt!91849 (tuple2!3451 lt!91840 (zeroValue!3623 thiss!1248))) lt!91851)))

(declare-fun lt!91837 () Unit!5592)

(assert (=> b!185699 (= lt!91837 lt!91842)))

(declare-fun lt!91832 () ListLongMap!2367)

(assert (=> b!185699 (= lt!91832 (getCurrentListMapNoExtraKeys!199 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248)))))

(declare-fun lt!91841 () (_ BitVec 64))

(assert (=> b!185699 (= lt!91841 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91843 () (_ BitVec 64))

(assert (=> b!185699 (= lt!91843 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91847 () Unit!5592)

(declare-fun addApplyDifferent!142 (ListLongMap!2367 (_ BitVec 64) V!5435 (_ BitVec 64)) Unit!5592)

(assert (=> b!185699 (= lt!91847 (addApplyDifferent!142 lt!91832 lt!91841 (minValue!3623 thiss!1248) lt!91843))))

(assert (=> b!185699 (= (apply!166 (+!286 lt!91832 (tuple2!3451 lt!91841 (minValue!3623 thiss!1248))) lt!91843) (apply!166 lt!91832 lt!91843))))

(declare-fun lt!91834 () Unit!5592)

(assert (=> b!185699 (= lt!91834 lt!91847)))

(declare-fun lt!91848 () ListLongMap!2367)

(assert (=> b!185699 (= lt!91848 (getCurrentListMapNoExtraKeys!199 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248)))))

(declare-fun lt!91836 () (_ BitVec 64))

(assert (=> b!185699 (= lt!91836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91839 () (_ BitVec 64))

(assert (=> b!185699 (= lt!91839 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91831 () Unit!5592)

(assert (=> b!185699 (= lt!91831 (addApplyDifferent!142 lt!91848 lt!91836 (zeroValue!3623 thiss!1248) lt!91839))))

(assert (=> b!185699 (= (apply!166 (+!286 lt!91848 (tuple2!3451 lt!91836 (zeroValue!3623 thiss!1248))) lt!91839) (apply!166 lt!91848 lt!91839))))

(declare-fun lt!91845 () Unit!5592)

(assert (=> b!185699 (= lt!91845 lt!91831)))

(declare-fun lt!91835 () ListLongMap!2367)

(assert (=> b!185699 (= lt!91835 (getCurrentListMapNoExtraKeys!199 (_keys!5721 thiss!1248) (_values!3765 thiss!1248) (mask!8890 thiss!1248) (extraKeys!3519 thiss!1248) (zeroValue!3623 thiss!1248) (minValue!3623 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3782 thiss!1248)))))

(declare-fun lt!91846 () (_ BitVec 64))

(assert (=> b!185699 (= lt!91846 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91844 () (_ BitVec 64))

(assert (=> b!185699 (= lt!91844 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185699 (= lt!91830 (addApplyDifferent!142 lt!91835 lt!91846 (minValue!3623 thiss!1248) lt!91844))))

(assert (=> b!185699 (= (apply!166 (+!286 lt!91835 (tuple2!3451 lt!91846 (minValue!3623 thiss!1248))) lt!91844) (apply!166 lt!91835 lt!91844))))

(declare-fun b!185700 () Bool)

(assert (=> b!185700 (= e!122178 call!18734)))

(declare-fun b!185701 () Bool)

(declare-fun e!122179 () Bool)

(assert (=> b!185701 (= e!122179 e!122180)))

(declare-fun res!87847 () Bool)

(assert (=> b!185701 (=> (not res!87847) (not e!122180))))

(assert (=> b!185701 (= res!87847 (contains!1294 lt!91838 (select (arr!3725 (_keys!5721 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185701 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4041 (_keys!5721 thiss!1248))))))

(declare-fun b!185702 () Bool)

(declare-fun res!87850 () Bool)

(assert (=> b!185702 (=> (not res!87850) (not e!122176))))

(assert (=> b!185702 (= res!87850 e!122179)))

(declare-fun res!87848 () Bool)

(assert (=> b!185702 (=> res!87848 e!122179)))

(assert (=> b!185702 (= res!87848 (not e!122183))))

(declare-fun res!87843 () Bool)

(assert (=> b!185702 (=> (not res!87843) (not e!122183))))

(assert (=> b!185702 (= res!87843 (bvslt #b00000000000000000000000000000000 (size!4041 (_keys!5721 thiss!1248))))))

(declare-fun b!185703 () Bool)

(declare-fun c!33322 () Bool)

(assert (=> b!185703 (= c!33322 (and (not (= (bvand (extraKeys!3519 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3519 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!185703 (= e!122184 e!122178)))

(declare-fun bm!18736 () Bool)

(assert (=> bm!18736 (= call!18736 call!18733)))

(declare-fun b!185704 () Bool)

(assert (=> b!185704 (= e!122177 e!122184)))

(assert (=> b!185704 (= c!33319 (and (not (= (bvand (extraKeys!3519 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3519 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185705 () Bool)

(assert (=> b!185705 (= e!122186 e!122187)))

(declare-fun res!87845 () Bool)

(assert (=> b!185705 (= res!87845 call!18737)))

(assert (=> b!185705 (=> (not res!87845) (not e!122187))))

(assert (= (and d!55135 c!33317) b!185690))

(assert (= (and d!55135 (not c!33317)) b!185704))

(assert (= (and b!185704 c!33319) b!185687))

(assert (= (and b!185704 (not c!33319)) b!185703))

(assert (= (and b!185703 c!33322) b!185700))

(assert (= (and b!185703 (not c!33322)) b!185686))

(assert (= (or b!185700 b!185686) bm!18736))

(assert (= (or b!185687 bm!18736) bm!18731))

(assert (= (or b!185687 b!185700) bm!18735))

(assert (= (or b!185690 bm!18731) bm!18730))

(assert (= (or b!185690 bm!18735) bm!18734))

(assert (= (and d!55135 res!87849) b!185694))

(assert (= (and d!55135 c!33320) b!185699))

(assert (= (and d!55135 (not c!33320)) b!185689))

(assert (= (and d!55135 res!87851) b!185702))

(assert (= (and b!185702 res!87843) b!185695))

(assert (= (and b!185702 (not res!87848)) b!185701))

(assert (= (and b!185701 res!87847) b!185693))

(assert (= (and b!185702 res!87850) b!185696))

(assert (= (and b!185696 c!33318) b!185705))

(assert (= (and b!185696 (not c!33318)) b!185697))

(assert (= (and b!185705 res!87845) b!185685))

(assert (= (or b!185705 b!185697) bm!18733))

(assert (= (and b!185696 res!87846) b!185688))

(assert (= (and b!185688 c!33321) b!185691))

(assert (= (and b!185688 (not c!33321)) b!185692))

(assert (= (and b!185691 res!87844) b!185698))

(assert (= (or b!185691 b!185692) bm!18732))

(declare-fun b_lambda!7251 () Bool)

(assert (=> (not b_lambda!7251) (not b!185693)))

(declare-fun t!7246 () Bool)

(declare-fun tb!2843 () Bool)

(assert (=> (and b!185535 (= (defaultEntry!3782 thiss!1248) (defaultEntry!3782 thiss!1248)) t!7246) tb!2843))

(declare-fun result!4807 () Bool)

(assert (=> tb!2843 (= result!4807 tp_is_empty!4341)))

(assert (=> b!185693 t!7246))

(declare-fun b_and!11173 () Bool)

(assert (= b_and!11169 (and (=> t!7246 result!4807) b_and!11173)))

(assert (=> d!55135 m!212733))

(declare-fun m!212809 () Bool)

(assert (=> bm!18733 m!212809))

(assert (=> b!185695 m!212773))

(assert (=> b!185695 m!212773))

(assert (=> b!185695 m!212781))

(declare-fun m!212811 () Bool)

(assert (=> bm!18730 m!212811))

(declare-fun m!212813 () Bool)

(assert (=> b!185693 m!212813))

(assert (=> b!185693 m!212773))

(declare-fun m!212815 () Bool)

(assert (=> b!185693 m!212815))

(declare-fun m!212817 () Bool)

(assert (=> b!185693 m!212817))

(assert (=> b!185693 m!212773))

(assert (=> b!185693 m!212817))

(assert (=> b!185693 m!212813))

(declare-fun m!212819 () Bool)

(assert (=> b!185693 m!212819))

(assert (=> b!185694 m!212773))

(assert (=> b!185694 m!212773))

(assert (=> b!185694 m!212781))

(declare-fun m!212821 () Bool)

(assert (=> bm!18734 m!212821))

(declare-fun m!212823 () Bool)

(assert (=> b!185698 m!212823))

(declare-fun m!212825 () Bool)

(assert (=> b!185699 m!212825))

(declare-fun m!212827 () Bool)

(assert (=> b!185699 m!212827))

(declare-fun m!212829 () Bool)

(assert (=> b!185699 m!212829))

(assert (=> b!185699 m!212827))

(declare-fun m!212831 () Bool)

(assert (=> b!185699 m!212831))

(declare-fun m!212833 () Bool)

(assert (=> b!185699 m!212833))

(declare-fun m!212835 () Bool)

(assert (=> b!185699 m!212835))

(assert (=> b!185699 m!212825))

(declare-fun m!212837 () Bool)

(assert (=> b!185699 m!212837))

(declare-fun m!212839 () Bool)

(assert (=> b!185699 m!212839))

(declare-fun m!212841 () Bool)

(assert (=> b!185699 m!212841))

(declare-fun m!212843 () Bool)

(assert (=> b!185699 m!212843))

(declare-fun m!212845 () Bool)

(assert (=> b!185699 m!212845))

(declare-fun m!212847 () Bool)

(assert (=> b!185699 m!212847))

(declare-fun m!212849 () Bool)

(assert (=> b!185699 m!212849))

(assert (=> b!185699 m!212833))

(declare-fun m!212851 () Bool)

(assert (=> b!185699 m!212851))

(declare-fun m!212853 () Bool)

(assert (=> b!185699 m!212853))

(assert (=> b!185699 m!212845))

(assert (=> b!185699 m!212773))

(assert (=> b!185699 m!212811))

(declare-fun m!212855 () Bool)

(assert (=> b!185690 m!212855))

(assert (=> b!185701 m!212773))

(assert (=> b!185701 m!212773))

(declare-fun m!212857 () Bool)

(assert (=> b!185701 m!212857))

(declare-fun m!212859 () Bool)

(assert (=> bm!18732 m!212859))

(declare-fun m!212861 () Bool)

(assert (=> b!185685 m!212861))

(assert (=> b!185534 d!55135))

(declare-fun b!185715 () Bool)

(declare-fun e!122193 () Bool)

(assert (=> b!185715 (= e!122193 tp_is_empty!4341)))

(declare-fun b!185714 () Bool)

(declare-fun e!122194 () Bool)

(assert (=> b!185714 (= e!122194 tp_is_empty!4341)))

(declare-fun mapIsEmpty!7476 () Bool)

(declare-fun mapRes!7476 () Bool)

(assert (=> mapIsEmpty!7476 mapRes!7476))

(declare-fun mapNonEmpty!7476 () Bool)

(declare-fun tp!16512 () Bool)

(assert (=> mapNonEmpty!7476 (= mapRes!7476 (and tp!16512 e!122194))))

(declare-fun mapRest!7476 () (Array (_ BitVec 32) ValueCell!1827))

(declare-fun mapValue!7476 () ValueCell!1827)

(declare-fun mapKey!7476 () (_ BitVec 32))

(assert (=> mapNonEmpty!7476 (= mapRest!7470 (store mapRest!7476 mapKey!7476 mapValue!7476))))

(declare-fun condMapEmpty!7476 () Bool)

(declare-fun mapDefault!7476 () ValueCell!1827)

(assert (=> mapNonEmpty!7470 (= condMapEmpty!7476 (= mapRest!7470 ((as const (Array (_ BitVec 32) ValueCell!1827)) mapDefault!7476)))))

(assert (=> mapNonEmpty!7470 (= tp!16502 (and e!122193 mapRes!7476))))

(assert (= (and mapNonEmpty!7470 condMapEmpty!7476) mapIsEmpty!7476))

(assert (= (and mapNonEmpty!7470 (not condMapEmpty!7476)) mapNonEmpty!7476))

(assert (= (and mapNonEmpty!7476 ((_ is ValueCellFull!1827) mapValue!7476)) b!185714))

(assert (= (and mapNonEmpty!7470 ((_ is ValueCellFull!1827) mapDefault!7476)) b!185715))

(declare-fun m!212863 () Bool)

(assert (=> mapNonEmpty!7476 m!212863))

(declare-fun b_lambda!7253 () Bool)

(assert (= b_lambda!7251 (or (and b!185535 b_free!4569) b_lambda!7253)))

(check-sat (not b_next!4569) (not b!185614) (not bm!18732) (not bm!18734) (not d!55133) (not b!185629) (not b!185695) (not b_lambda!7253) (not b!185642) (not d!55135) (not bm!18712) (not b!185600) (not d!55119) (not b!185685) (not b!185640) (not d!55127) tp_is_empty!4341 (not b!185701) (not b!185598) (not b!185586) (not b!185631) (not b!185694) (not bm!18730) (not bm!18715) (not b!185699) (not b!185587) (not b!185690) (not mapNonEmpty!7476) (not b!185693) b_and!11173 (not b!185632) (not b!185588) (not bm!18733) (not b!185698))
(check-sat b_and!11173 (not b_next!4569))
