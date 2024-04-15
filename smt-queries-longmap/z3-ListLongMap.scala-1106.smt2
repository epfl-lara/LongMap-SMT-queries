; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22832 () Bool)

(assert start!22832)

(declare-fun b!237695 () Bool)

(declare-fun b_free!6385 () Bool)

(declare-fun b_next!6385 () Bool)

(assert (=> b!237695 (= b_free!6385 (not b_next!6385))))

(declare-fun tp!22350 () Bool)

(declare-fun b_and!13319 () Bool)

(assert (=> b!237695 (= tp!22350 b_and!13319)))

(declare-fun mapIsEmpty!10593 () Bool)

(declare-fun mapRes!10593 () Bool)

(assert (=> mapIsEmpty!10593 mapRes!10593))

(declare-fun b!237693 () Bool)

(declare-fun res!116453 () Bool)

(declare-fun e!154342 () Bool)

(assert (=> b!237693 (=> (not res!116453) (not e!154342))))

(declare-datatypes ((V!7977 0))(
  ( (V!7978 (val!3168 Int)) )
))
(declare-datatypes ((ValueCell!2780 0))(
  ( (ValueCellFull!2780 (v!5197 V!7977)) (EmptyCell!2780) )
))
(declare-datatypes ((array!11759 0))(
  ( (array!11760 (arr!5583 (Array (_ BitVec 32) ValueCell!2780)) (size!5925 (_ BitVec 32))) )
))
(declare-datatypes ((array!11761 0))(
  ( (array!11762 (arr!5584 (Array (_ BitVec 32) (_ BitVec 64))) (size!5926 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3460 0))(
  ( (LongMapFixedSize!3461 (defaultEntry!4412 Int) (mask!10432 (_ BitVec 32)) (extraKeys!4149 (_ BitVec 32)) (zeroValue!4253 V!7977) (minValue!4253 V!7977) (_size!1779 (_ BitVec 32)) (_keys!6507 array!11761) (_values!4395 array!11759) (_vacant!1779 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3460)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4650 0))(
  ( (tuple2!4651 (_1!2336 (_ BitVec 64)) (_2!2336 V!7977)) )
))
(declare-datatypes ((List!3563 0))(
  ( (Nil!3560) (Cons!3559 (h!4215 tuple2!4650) (t!8543 List!3563)) )
))
(declare-datatypes ((ListLongMap!3553 0))(
  ( (ListLongMap!3554 (toList!1792 List!3563)) )
))
(declare-fun contains!1681 (ListLongMap!3553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1301 (array!11761 array!11759 (_ BitVec 32) (_ BitVec 32) V!7977 V!7977 (_ BitVec 32) Int) ListLongMap!3553)

(assert (=> b!237693 (= res!116453 (not (contains!1681 (getCurrentListMap!1301 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)) key!932)))))

(declare-fun b!237694 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11761 (_ BitVec 32)) Bool)

(assert (=> b!237694 (= e!154342 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6507 thiss!1504) (mask!10432 thiss!1504))))))

(declare-fun tp_is_empty!6247 () Bool)

(declare-fun e!154337 () Bool)

(declare-fun e!154338 () Bool)

(declare-fun array_inv!3687 (array!11761) Bool)

(declare-fun array_inv!3688 (array!11759) Bool)

(assert (=> b!237695 (= e!154337 (and tp!22350 tp_is_empty!6247 (array_inv!3687 (_keys!6507 thiss!1504)) (array_inv!3688 (_values!4395 thiss!1504)) e!154338))))

(declare-fun res!116454 () Bool)

(declare-fun e!154336 () Bool)

(assert (=> start!22832 (=> (not res!116454) (not e!154336))))

(declare-fun valid!1372 (LongMapFixedSize!3460) Bool)

(assert (=> start!22832 (= res!116454 (valid!1372 thiss!1504))))

(assert (=> start!22832 e!154336))

(assert (=> start!22832 e!154337))

(assert (=> start!22832 true))

(declare-fun b!237696 () Bool)

(declare-fun res!116451 () Bool)

(assert (=> b!237696 (=> (not res!116451) (not e!154342))))

(assert (=> b!237696 (= res!116451 (and (= (size!5925 (_values!4395 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10432 thiss!1504))) (= (size!5926 (_keys!6507 thiss!1504)) (size!5925 (_values!4395 thiss!1504))) (bvsge (mask!10432 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4149 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4149 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!237697 () Bool)

(declare-fun res!116450 () Bool)

(assert (=> b!237697 (=> (not res!116450) (not e!154336))))

(assert (=> b!237697 (= res!116450 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237698 () Bool)

(declare-fun res!116452 () Bool)

(assert (=> b!237698 (=> (not res!116452) (not e!154342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237698 (= res!116452 (validMask!0 (mask!10432 thiss!1504)))))

(declare-fun b!237699 () Bool)

(declare-fun e!154340 () Bool)

(assert (=> b!237699 (= e!154340 tp_is_empty!6247)))

(declare-fun b!237700 () Bool)

(declare-fun e!154339 () Bool)

(assert (=> b!237700 (= e!154339 tp_is_empty!6247)))

(declare-fun b!237701 () Bool)

(assert (=> b!237701 (= e!154336 e!154342)))

(declare-fun res!116449 () Bool)

(assert (=> b!237701 (=> (not res!116449) (not e!154342))))

(declare-datatypes ((SeekEntryResult!1009 0))(
  ( (MissingZero!1009 (index!6206 (_ BitVec 32))) (Found!1009 (index!6207 (_ BitVec 32))) (Intermediate!1009 (undefined!1821 Bool) (index!6208 (_ BitVec 32)) (x!23986 (_ BitVec 32))) (Undefined!1009) (MissingVacant!1009 (index!6209 (_ BitVec 32))) )
))
(declare-fun lt!120110 () SeekEntryResult!1009)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237701 (= res!116449 (or (= lt!120110 (MissingZero!1009 index!297)) (= lt!120110 (MissingVacant!1009 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11761 (_ BitVec 32)) SeekEntryResult!1009)

(assert (=> b!237701 (= lt!120110 (seekEntryOrOpen!0 key!932 (_keys!6507 thiss!1504) (mask!10432 thiss!1504)))))

(declare-fun mapNonEmpty!10593 () Bool)

(declare-fun tp!22349 () Bool)

(assert (=> mapNonEmpty!10593 (= mapRes!10593 (and tp!22349 e!154339))))

(declare-fun mapValue!10593 () ValueCell!2780)

(declare-fun mapRest!10593 () (Array (_ BitVec 32) ValueCell!2780))

(declare-fun mapKey!10593 () (_ BitVec 32))

(assert (=> mapNonEmpty!10593 (= (arr!5583 (_values!4395 thiss!1504)) (store mapRest!10593 mapKey!10593 mapValue!10593))))

(declare-fun b!237702 () Bool)

(assert (=> b!237702 (= e!154338 (and e!154340 mapRes!10593))))

(declare-fun condMapEmpty!10593 () Bool)

(declare-fun mapDefault!10593 () ValueCell!2780)

(assert (=> b!237702 (= condMapEmpty!10593 (= (arr!5583 (_values!4395 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2780)) mapDefault!10593)))))

(assert (= (and start!22832 res!116454) b!237697))

(assert (= (and b!237697 res!116450) b!237701))

(assert (= (and b!237701 res!116449) b!237693))

(assert (= (and b!237693 res!116453) b!237698))

(assert (= (and b!237698 res!116452) b!237696))

(assert (= (and b!237696 res!116451) b!237694))

(assert (= (and b!237702 condMapEmpty!10593) mapIsEmpty!10593))

(assert (= (and b!237702 (not condMapEmpty!10593)) mapNonEmpty!10593))

(get-info :version)

(assert (= (and mapNonEmpty!10593 ((_ is ValueCellFull!2780) mapValue!10593)) b!237700))

(assert (= (and b!237702 ((_ is ValueCellFull!2780) mapDefault!10593)) b!237699))

(assert (= b!237695 b!237702))

(assert (= start!22832 b!237695))

(declare-fun m!257961 () Bool)

(assert (=> start!22832 m!257961))

(declare-fun m!257963 () Bool)

(assert (=> b!237695 m!257963))

(declare-fun m!257965 () Bool)

(assert (=> b!237695 m!257965))

(declare-fun m!257967 () Bool)

(assert (=> b!237701 m!257967))

(declare-fun m!257969 () Bool)

(assert (=> b!237698 m!257969))

(declare-fun m!257971 () Bool)

(assert (=> b!237694 m!257971))

(declare-fun m!257973 () Bool)

(assert (=> mapNonEmpty!10593 m!257973))

(declare-fun m!257975 () Bool)

(assert (=> b!237693 m!257975))

(assert (=> b!237693 m!257975))

(declare-fun m!257977 () Bool)

(assert (=> b!237693 m!257977))

(check-sat tp_is_empty!6247 (not b!237701) (not b!237695) (not b!237698) b_and!13319 (not mapNonEmpty!10593) (not start!22832) (not b!237693) (not b_next!6385) (not b!237694))
(check-sat b_and!13319 (not b_next!6385))
(get-model)

(declare-fun b!237776 () Bool)

(declare-fun e!154392 () SeekEntryResult!1009)

(declare-fun e!154391 () SeekEntryResult!1009)

(assert (=> b!237776 (= e!154392 e!154391)))

(declare-fun lt!120123 () (_ BitVec 64))

(declare-fun lt!120124 () SeekEntryResult!1009)

(assert (=> b!237776 (= lt!120123 (select (arr!5584 (_keys!6507 thiss!1504)) (index!6208 lt!120124)))))

(declare-fun c!39661 () Bool)

(assert (=> b!237776 (= c!39661 (= lt!120123 key!932))))

(declare-fun b!237777 () Bool)

(declare-fun c!39663 () Bool)

(assert (=> b!237777 (= c!39663 (= lt!120123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154393 () SeekEntryResult!1009)

(assert (=> b!237777 (= e!154391 e!154393)))

(declare-fun b!237778 () Bool)

(assert (=> b!237778 (= e!154392 Undefined!1009)))

(declare-fun b!237779 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11761 (_ BitVec 32)) SeekEntryResult!1009)

(assert (=> b!237779 (= e!154393 (seekKeyOrZeroReturnVacant!0 (x!23986 lt!120124) (index!6208 lt!120124) (index!6208 lt!120124) key!932 (_keys!6507 thiss!1504) (mask!10432 thiss!1504)))))

(declare-fun b!237780 () Bool)

(assert (=> b!237780 (= e!154393 (MissingZero!1009 (index!6208 lt!120124)))))

(declare-fun b!237775 () Bool)

(assert (=> b!237775 (= e!154391 (Found!1009 (index!6208 lt!120124)))))

(declare-fun d!59563 () Bool)

(declare-fun lt!120125 () SeekEntryResult!1009)

(assert (=> d!59563 (and (or ((_ is Undefined!1009) lt!120125) (not ((_ is Found!1009) lt!120125)) (and (bvsge (index!6207 lt!120125) #b00000000000000000000000000000000) (bvslt (index!6207 lt!120125) (size!5926 (_keys!6507 thiss!1504))))) (or ((_ is Undefined!1009) lt!120125) ((_ is Found!1009) lt!120125) (not ((_ is MissingZero!1009) lt!120125)) (and (bvsge (index!6206 lt!120125) #b00000000000000000000000000000000) (bvslt (index!6206 lt!120125) (size!5926 (_keys!6507 thiss!1504))))) (or ((_ is Undefined!1009) lt!120125) ((_ is Found!1009) lt!120125) ((_ is MissingZero!1009) lt!120125) (not ((_ is MissingVacant!1009) lt!120125)) (and (bvsge (index!6209 lt!120125) #b00000000000000000000000000000000) (bvslt (index!6209 lt!120125) (size!5926 (_keys!6507 thiss!1504))))) (or ((_ is Undefined!1009) lt!120125) (ite ((_ is Found!1009) lt!120125) (= (select (arr!5584 (_keys!6507 thiss!1504)) (index!6207 lt!120125)) key!932) (ite ((_ is MissingZero!1009) lt!120125) (= (select (arr!5584 (_keys!6507 thiss!1504)) (index!6206 lt!120125)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1009) lt!120125) (= (select (arr!5584 (_keys!6507 thiss!1504)) (index!6209 lt!120125)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59563 (= lt!120125 e!154392)))

(declare-fun c!39662 () Bool)

(assert (=> d!59563 (= c!39662 (and ((_ is Intermediate!1009) lt!120124) (undefined!1821 lt!120124)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11761 (_ BitVec 32)) SeekEntryResult!1009)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59563 (= lt!120124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10432 thiss!1504)) key!932 (_keys!6507 thiss!1504) (mask!10432 thiss!1504)))))

(assert (=> d!59563 (validMask!0 (mask!10432 thiss!1504))))

(assert (=> d!59563 (= (seekEntryOrOpen!0 key!932 (_keys!6507 thiss!1504) (mask!10432 thiss!1504)) lt!120125)))

(assert (= (and d!59563 c!39662) b!237778))

(assert (= (and d!59563 (not c!39662)) b!237776))

(assert (= (and b!237776 c!39661) b!237775))

(assert (= (and b!237776 (not c!39661)) b!237777))

(assert (= (and b!237777 c!39663) b!237780))

(assert (= (and b!237777 (not c!39663)) b!237779))

(declare-fun m!258015 () Bool)

(assert (=> b!237776 m!258015))

(declare-fun m!258017 () Bool)

(assert (=> b!237779 m!258017))

(declare-fun m!258019 () Bool)

(assert (=> d!59563 m!258019))

(declare-fun m!258021 () Bool)

(assert (=> d!59563 m!258021))

(declare-fun m!258023 () Bool)

(assert (=> d!59563 m!258023))

(declare-fun m!258025 () Bool)

(assert (=> d!59563 m!258025))

(assert (=> d!59563 m!258019))

(assert (=> d!59563 m!257969))

(declare-fun m!258027 () Bool)

(assert (=> d!59563 m!258027))

(assert (=> b!237701 d!59563))

(declare-fun d!59565 () Bool)

(assert (=> d!59565 (= (array_inv!3687 (_keys!6507 thiss!1504)) (bvsge (size!5926 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237695 d!59565))

(declare-fun d!59567 () Bool)

(assert (=> d!59567 (= (array_inv!3688 (_values!4395 thiss!1504)) (bvsge (size!5925 (_values!4395 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237695 d!59567))

(declare-fun d!59569 () Bool)

(declare-fun res!116497 () Bool)

(declare-fun e!154396 () Bool)

(assert (=> d!59569 (=> (not res!116497) (not e!154396))))

(declare-fun simpleValid!241 (LongMapFixedSize!3460) Bool)

(assert (=> d!59569 (= res!116497 (simpleValid!241 thiss!1504))))

(assert (=> d!59569 (= (valid!1372 thiss!1504) e!154396)))

(declare-fun b!237787 () Bool)

(declare-fun res!116498 () Bool)

(assert (=> b!237787 (=> (not res!116498) (not e!154396))))

(declare-fun arrayCountValidKeys!0 (array!11761 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237787 (= res!116498 (= (arrayCountValidKeys!0 (_keys!6507 thiss!1504) #b00000000000000000000000000000000 (size!5926 (_keys!6507 thiss!1504))) (_size!1779 thiss!1504)))))

(declare-fun b!237788 () Bool)

(declare-fun res!116499 () Bool)

(assert (=> b!237788 (=> (not res!116499) (not e!154396))))

(assert (=> b!237788 (= res!116499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6507 thiss!1504) (mask!10432 thiss!1504)))))

(declare-fun b!237789 () Bool)

(declare-datatypes ((List!3564 0))(
  ( (Nil!3561) (Cons!3560 (h!4216 (_ BitVec 64)) (t!8546 List!3564)) )
))
(declare-fun arrayNoDuplicates!0 (array!11761 (_ BitVec 32) List!3564) Bool)

(assert (=> b!237789 (= e!154396 (arrayNoDuplicates!0 (_keys!6507 thiss!1504) #b00000000000000000000000000000000 Nil!3561))))

(assert (= (and d!59569 res!116497) b!237787))

(assert (= (and b!237787 res!116498) b!237788))

(assert (= (and b!237788 res!116499) b!237789))

(declare-fun m!258029 () Bool)

(assert (=> d!59569 m!258029))

(declare-fun m!258031 () Bool)

(assert (=> b!237787 m!258031))

(assert (=> b!237788 m!257971))

(declare-fun m!258033 () Bool)

(assert (=> b!237789 m!258033))

(assert (=> start!22832 d!59569))

(declare-fun b!237798 () Bool)

(declare-fun e!154405 () Bool)

(declare-fun e!154404 () Bool)

(assert (=> b!237798 (= e!154405 e!154404)))

(declare-fun lt!120134 () (_ BitVec 64))

(assert (=> b!237798 (= lt!120134 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!7300 0))(
  ( (Unit!7301) )
))
(declare-fun lt!120133 () Unit!7300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11761 (_ BitVec 64) (_ BitVec 32)) Unit!7300)

(assert (=> b!237798 (= lt!120133 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6507 thiss!1504) lt!120134 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!237798 (arrayContainsKey!0 (_keys!6507 thiss!1504) lt!120134 #b00000000000000000000000000000000)))

(declare-fun lt!120132 () Unit!7300)

(assert (=> b!237798 (= lt!120132 lt!120133)))

(declare-fun res!116504 () Bool)

(assert (=> b!237798 (= res!116504 (= (seekEntryOrOpen!0 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000) (_keys!6507 thiss!1504) (mask!10432 thiss!1504)) (Found!1009 #b00000000000000000000000000000000)))))

(assert (=> b!237798 (=> (not res!116504) (not e!154404))))

(declare-fun b!237799 () Bool)

(declare-fun e!154403 () Bool)

(assert (=> b!237799 (= e!154403 e!154405)))

(declare-fun c!39666 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237799 (= c!39666 (validKeyInArray!0 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59571 () Bool)

(declare-fun res!116505 () Bool)

(assert (=> d!59571 (=> res!116505 e!154403)))

(assert (=> d!59571 (= res!116505 (bvsge #b00000000000000000000000000000000 (size!5926 (_keys!6507 thiss!1504))))))

(assert (=> d!59571 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6507 thiss!1504) (mask!10432 thiss!1504)) e!154403)))

(declare-fun bm!22080 () Bool)

(declare-fun call!22083 () Bool)

(assert (=> bm!22080 (= call!22083 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6507 thiss!1504) (mask!10432 thiss!1504)))))

(declare-fun b!237800 () Bool)

(assert (=> b!237800 (= e!154404 call!22083)))

(declare-fun b!237801 () Bool)

(assert (=> b!237801 (= e!154405 call!22083)))

(assert (= (and d!59571 (not res!116505)) b!237799))

(assert (= (and b!237799 c!39666) b!237798))

(assert (= (and b!237799 (not c!39666)) b!237801))

(assert (= (and b!237798 res!116504) b!237800))

(assert (= (or b!237800 b!237801) bm!22080))

(declare-fun m!258035 () Bool)

(assert (=> b!237798 m!258035))

(declare-fun m!258037 () Bool)

(assert (=> b!237798 m!258037))

(declare-fun m!258039 () Bool)

(assert (=> b!237798 m!258039))

(assert (=> b!237798 m!258035))

(declare-fun m!258041 () Bool)

(assert (=> b!237798 m!258041))

(assert (=> b!237799 m!258035))

(assert (=> b!237799 m!258035))

(declare-fun m!258043 () Bool)

(assert (=> b!237799 m!258043))

(declare-fun m!258045 () Bool)

(assert (=> bm!22080 m!258045))

(assert (=> b!237694 d!59571))

(declare-fun d!59573 () Bool)

(declare-fun e!154411 () Bool)

(assert (=> d!59573 e!154411))

(declare-fun res!116508 () Bool)

(assert (=> d!59573 (=> res!116508 e!154411)))

(declare-fun lt!120143 () Bool)

(assert (=> d!59573 (= res!116508 (not lt!120143))))

(declare-fun lt!120144 () Bool)

(assert (=> d!59573 (= lt!120143 lt!120144)))

(declare-fun lt!120145 () Unit!7300)

(declare-fun e!154410 () Unit!7300)

(assert (=> d!59573 (= lt!120145 e!154410)))

(declare-fun c!39669 () Bool)

(assert (=> d!59573 (= c!39669 lt!120144)))

(declare-fun containsKey!266 (List!3563 (_ BitVec 64)) Bool)

(assert (=> d!59573 (= lt!120144 (containsKey!266 (toList!1792 (getCurrentListMap!1301 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504))) key!932))))

(assert (=> d!59573 (= (contains!1681 (getCurrentListMap!1301 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)) key!932) lt!120143)))

(declare-fun b!237808 () Bool)

(declare-fun lt!120146 () Unit!7300)

(assert (=> b!237808 (= e!154410 lt!120146)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!215 (List!3563 (_ BitVec 64)) Unit!7300)

(assert (=> b!237808 (= lt!120146 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1792 (getCurrentListMap!1301 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504))) key!932))))

(declare-datatypes ((Option!280 0))(
  ( (Some!279 (v!5200 V!7977)) (None!278) )
))
(declare-fun isDefined!216 (Option!280) Bool)

(declare-fun getValueByKey!274 (List!3563 (_ BitVec 64)) Option!280)

(assert (=> b!237808 (isDefined!216 (getValueByKey!274 (toList!1792 (getCurrentListMap!1301 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504))) key!932))))

(declare-fun b!237809 () Bool)

(declare-fun Unit!7302 () Unit!7300)

(assert (=> b!237809 (= e!154410 Unit!7302)))

(declare-fun b!237810 () Bool)

(assert (=> b!237810 (= e!154411 (isDefined!216 (getValueByKey!274 (toList!1792 (getCurrentListMap!1301 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504))) key!932)))))

(assert (= (and d!59573 c!39669) b!237808))

(assert (= (and d!59573 (not c!39669)) b!237809))

(assert (= (and d!59573 (not res!116508)) b!237810))

(declare-fun m!258047 () Bool)

(assert (=> d!59573 m!258047))

(declare-fun m!258049 () Bool)

(assert (=> b!237808 m!258049))

(declare-fun m!258051 () Bool)

(assert (=> b!237808 m!258051))

(assert (=> b!237808 m!258051))

(declare-fun m!258053 () Bool)

(assert (=> b!237808 m!258053))

(assert (=> b!237810 m!258051))

(assert (=> b!237810 m!258051))

(assert (=> b!237810 m!258053))

(assert (=> b!237693 d!59573))

(declare-fun b!237853 () Bool)

(declare-fun e!154440 () ListLongMap!3553)

(declare-fun call!22098 () ListLongMap!3553)

(assert (=> b!237853 (= e!154440 call!22098)))

(declare-fun b!237854 () Bool)

(declare-fun e!154443 () ListLongMap!3553)

(declare-fun call!22101 () ListLongMap!3553)

(assert (=> b!237854 (= e!154443 call!22101)))

(declare-fun b!237855 () Bool)

(declare-fun e!154438 () Unit!7300)

(declare-fun Unit!7303 () Unit!7300)

(assert (=> b!237855 (= e!154438 Unit!7303)))

(declare-fun b!237856 () Bool)

(declare-fun e!154441 () Bool)

(assert (=> b!237856 (= e!154441 (validKeyInArray!0 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59575 () Bool)

(declare-fun e!154444 () Bool)

(assert (=> d!59575 e!154444))

(declare-fun res!116532 () Bool)

(assert (=> d!59575 (=> (not res!116532) (not e!154444))))

(assert (=> d!59575 (= res!116532 (or (bvsge #b00000000000000000000000000000000 (size!5926 (_keys!6507 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5926 (_keys!6507 thiss!1504))))))))

(declare-fun lt!120192 () ListLongMap!3553)

(declare-fun lt!120205 () ListLongMap!3553)

(assert (=> d!59575 (= lt!120192 lt!120205)))

(declare-fun lt!120196 () Unit!7300)

(assert (=> d!59575 (= lt!120196 e!154438)))

(declare-fun c!39686 () Bool)

(assert (=> d!59575 (= c!39686 e!154441)))

(declare-fun res!116530 () Bool)

(assert (=> d!59575 (=> (not res!116530) (not e!154441))))

(assert (=> d!59575 (= res!116530 (bvslt #b00000000000000000000000000000000 (size!5926 (_keys!6507 thiss!1504))))))

(declare-fun e!154450 () ListLongMap!3553)

(assert (=> d!59575 (= lt!120205 e!154450)))

(declare-fun c!39682 () Bool)

(assert (=> d!59575 (= c!39682 (and (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59575 (validMask!0 (mask!10432 thiss!1504))))

(assert (=> d!59575 (= (getCurrentListMap!1301 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)) lt!120192)))

(declare-fun bm!22095 () Bool)

(declare-fun call!22099 () ListLongMap!3553)

(declare-fun call!22104 () ListLongMap!3553)

(assert (=> bm!22095 (= call!22099 call!22104)))

(declare-fun b!237857 () Bool)

(assert (=> b!237857 (= e!154450 e!154440)))

(declare-fun c!39685 () Bool)

(assert (=> b!237857 (= c!39685 (and (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237858 () Bool)

(declare-fun e!154447 () Bool)

(assert (=> b!237858 (= e!154447 (validKeyInArray!0 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237859 () Bool)

(declare-fun call!22100 () ListLongMap!3553)

(declare-fun +!651 (ListLongMap!3553 tuple2!4650) ListLongMap!3553)

(assert (=> b!237859 (= e!154450 (+!651 call!22100 (tuple2!4651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4253 thiss!1504))))))

(declare-fun b!237860 () Bool)

(declare-fun e!154445 () Bool)

(declare-fun apply!218 (ListLongMap!3553 (_ BitVec 64)) V!7977)

(declare-fun get!2877 (ValueCell!2780 V!7977) V!7977)

(declare-fun dynLambda!552 (Int (_ BitVec 64)) V!7977)

(assert (=> b!237860 (= e!154445 (= (apply!218 lt!120192 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000)) (get!2877 (select (arr!5583 (_values!4395 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!552 (defaultEntry!4412 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5925 (_values!4395 thiss!1504))))))

(assert (=> b!237860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5926 (_keys!6507 thiss!1504))))))

(declare-fun bm!22096 () Bool)

(declare-fun call!22103 () Bool)

(assert (=> bm!22096 (= call!22103 (contains!1681 lt!120192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237861 () Bool)

(declare-fun e!154448 () Bool)

(assert (=> b!237861 (= e!154448 e!154445)))

(declare-fun res!116529 () Bool)

(assert (=> b!237861 (=> (not res!116529) (not e!154445))))

(assert (=> b!237861 (= res!116529 (contains!1681 lt!120192 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5926 (_keys!6507 thiss!1504))))))

(declare-fun b!237862 () Bool)

(declare-fun res!116533 () Bool)

(assert (=> b!237862 (=> (not res!116533) (not e!154444))))

(assert (=> b!237862 (= res!116533 e!154448)))

(declare-fun res!116534 () Bool)

(assert (=> b!237862 (=> res!116534 e!154448)))

(assert (=> b!237862 (= res!116534 (not e!154447))))

(declare-fun res!116528 () Bool)

(assert (=> b!237862 (=> (not res!116528) (not e!154447))))

(assert (=> b!237862 (= res!116528 (bvslt #b00000000000000000000000000000000 (size!5926 (_keys!6507 thiss!1504))))))

(declare-fun b!237863 () Bool)

(declare-fun res!116531 () Bool)

(assert (=> b!237863 (=> (not res!116531) (not e!154444))))

(declare-fun e!154449 () Bool)

(assert (=> b!237863 (= res!116531 e!154449)))

(declare-fun c!39687 () Bool)

(assert (=> b!237863 (= c!39687 (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!237864 () Bool)

(declare-fun e!154439 () Bool)

(assert (=> b!237864 (= e!154439 (= (apply!218 lt!120192 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4253 thiss!1504)))))

(declare-fun bm!22097 () Bool)

(assert (=> bm!22097 (= call!22098 call!22100)))

(declare-fun bm!22098 () Bool)

(declare-fun call!22102 () Bool)

(assert (=> bm!22098 (= call!22102 (contains!1681 lt!120192 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237865 () Bool)

(declare-fun e!154442 () Bool)

(assert (=> b!237865 (= e!154444 e!154442)))

(declare-fun c!39683 () Bool)

(assert (=> b!237865 (= c!39683 (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237866 () Bool)

(assert (=> b!237866 (= e!154449 (not call!22103))))

(declare-fun b!237867 () Bool)

(declare-fun lt!120210 () Unit!7300)

(assert (=> b!237867 (= e!154438 lt!120210)))

(declare-fun lt!120211 () ListLongMap!3553)

(declare-fun getCurrentListMapNoExtraKeys!534 (array!11761 array!11759 (_ BitVec 32) (_ BitVec 32) V!7977 V!7977 (_ BitVec 32) Int) ListLongMap!3553)

(assert (=> b!237867 (= lt!120211 (getCurrentListMapNoExtraKeys!534 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)))))

(declare-fun lt!120206 () (_ BitVec 64))

(assert (=> b!237867 (= lt!120206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120198 () (_ BitVec 64))

(assert (=> b!237867 (= lt!120198 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120202 () Unit!7300)

(declare-fun addStillContains!194 (ListLongMap!3553 (_ BitVec 64) V!7977 (_ BitVec 64)) Unit!7300)

(assert (=> b!237867 (= lt!120202 (addStillContains!194 lt!120211 lt!120206 (zeroValue!4253 thiss!1504) lt!120198))))

(assert (=> b!237867 (contains!1681 (+!651 lt!120211 (tuple2!4651 lt!120206 (zeroValue!4253 thiss!1504))) lt!120198)))

(declare-fun lt!120212 () Unit!7300)

(assert (=> b!237867 (= lt!120212 lt!120202)))

(declare-fun lt!120194 () ListLongMap!3553)

(assert (=> b!237867 (= lt!120194 (getCurrentListMapNoExtraKeys!534 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)))))

(declare-fun lt!120209 () (_ BitVec 64))

(assert (=> b!237867 (= lt!120209 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120193 () (_ BitVec 64))

(assert (=> b!237867 (= lt!120193 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120199 () Unit!7300)

(declare-fun addApplyDifferent!194 (ListLongMap!3553 (_ BitVec 64) V!7977 (_ BitVec 64)) Unit!7300)

(assert (=> b!237867 (= lt!120199 (addApplyDifferent!194 lt!120194 lt!120209 (minValue!4253 thiss!1504) lt!120193))))

(assert (=> b!237867 (= (apply!218 (+!651 lt!120194 (tuple2!4651 lt!120209 (minValue!4253 thiss!1504))) lt!120193) (apply!218 lt!120194 lt!120193))))

(declare-fun lt!120197 () Unit!7300)

(assert (=> b!237867 (= lt!120197 lt!120199)))

(declare-fun lt!120200 () ListLongMap!3553)

(assert (=> b!237867 (= lt!120200 (getCurrentListMapNoExtraKeys!534 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)))))

(declare-fun lt!120191 () (_ BitVec 64))

(assert (=> b!237867 (= lt!120191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120195 () (_ BitVec 64))

(assert (=> b!237867 (= lt!120195 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120204 () Unit!7300)

(assert (=> b!237867 (= lt!120204 (addApplyDifferent!194 lt!120200 lt!120191 (zeroValue!4253 thiss!1504) lt!120195))))

(assert (=> b!237867 (= (apply!218 (+!651 lt!120200 (tuple2!4651 lt!120191 (zeroValue!4253 thiss!1504))) lt!120195) (apply!218 lt!120200 lt!120195))))

(declare-fun lt!120201 () Unit!7300)

(assert (=> b!237867 (= lt!120201 lt!120204)))

(declare-fun lt!120207 () ListLongMap!3553)

(assert (=> b!237867 (= lt!120207 (getCurrentListMapNoExtraKeys!534 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)))))

(declare-fun lt!120203 () (_ BitVec 64))

(assert (=> b!237867 (= lt!120203 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120208 () (_ BitVec 64))

(assert (=> b!237867 (= lt!120208 (select (arr!5584 (_keys!6507 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237867 (= lt!120210 (addApplyDifferent!194 lt!120207 lt!120203 (minValue!4253 thiss!1504) lt!120208))))

(assert (=> b!237867 (= (apply!218 (+!651 lt!120207 (tuple2!4651 lt!120203 (minValue!4253 thiss!1504))) lt!120208) (apply!218 lt!120207 lt!120208))))

(declare-fun b!237868 () Bool)

(assert (=> b!237868 (= e!154443 call!22098)))

(declare-fun b!237869 () Bool)

(declare-fun e!154446 () Bool)

(assert (=> b!237869 (= e!154449 e!154446)))

(declare-fun res!116535 () Bool)

(assert (=> b!237869 (= res!116535 call!22103)))

(assert (=> b!237869 (=> (not res!116535) (not e!154446))))

(declare-fun bm!22099 () Bool)

(assert (=> bm!22099 (= call!22100 (+!651 (ite c!39682 call!22104 (ite c!39685 call!22099 call!22101)) (ite (or c!39682 c!39685) (tuple2!4651 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4253 thiss!1504)) (tuple2!4651 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4253 thiss!1504)))))))

(declare-fun b!237870 () Bool)

(assert (=> b!237870 (= e!154442 e!154439)))

(declare-fun res!116527 () Bool)

(assert (=> b!237870 (= res!116527 call!22102)))

(assert (=> b!237870 (=> (not res!116527) (not e!154439))))

(declare-fun b!237871 () Bool)

(assert (=> b!237871 (= e!154446 (= (apply!218 lt!120192 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4253 thiss!1504)))))

(declare-fun b!237872 () Bool)

(assert (=> b!237872 (= e!154442 (not call!22102))))

(declare-fun b!237873 () Bool)

(declare-fun c!39684 () Bool)

(assert (=> b!237873 (= c!39684 (and (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!237873 (= e!154440 e!154443)))

(declare-fun bm!22100 () Bool)

(assert (=> bm!22100 (= call!22104 (getCurrentListMapNoExtraKeys!534 (_keys!6507 thiss!1504) (_values!4395 thiss!1504) (mask!10432 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)))))

(declare-fun bm!22101 () Bool)

(assert (=> bm!22101 (= call!22101 call!22099)))

(assert (= (and d!59575 c!39682) b!237859))

(assert (= (and d!59575 (not c!39682)) b!237857))

(assert (= (and b!237857 c!39685) b!237853))

(assert (= (and b!237857 (not c!39685)) b!237873))

(assert (= (and b!237873 c!39684) b!237868))

(assert (= (and b!237873 (not c!39684)) b!237854))

(assert (= (or b!237868 b!237854) bm!22101))

(assert (= (or b!237853 bm!22101) bm!22095))

(assert (= (or b!237853 b!237868) bm!22097))

(assert (= (or b!237859 bm!22095) bm!22100))

(assert (= (or b!237859 bm!22097) bm!22099))

(assert (= (and d!59575 res!116530) b!237856))

(assert (= (and d!59575 c!39686) b!237867))

(assert (= (and d!59575 (not c!39686)) b!237855))

(assert (= (and d!59575 res!116532) b!237862))

(assert (= (and b!237862 res!116528) b!237858))

(assert (= (and b!237862 (not res!116534)) b!237861))

(assert (= (and b!237861 res!116529) b!237860))

(assert (= (and b!237862 res!116533) b!237863))

(assert (= (and b!237863 c!39687) b!237869))

(assert (= (and b!237863 (not c!39687)) b!237866))

(assert (= (and b!237869 res!116535) b!237871))

(assert (= (or b!237869 b!237866) bm!22096))

(assert (= (and b!237863 res!116531) b!237865))

(assert (= (and b!237865 c!39683) b!237870))

(assert (= (and b!237865 (not c!39683)) b!237872))

(assert (= (and b!237870 res!116527) b!237864))

(assert (= (or b!237870 b!237872) bm!22098))

(declare-fun b_lambda!7949 () Bool)

(assert (=> (not b_lambda!7949) (not b!237860)))

(declare-fun t!8545 () Bool)

(declare-fun tb!2941 () Bool)

(assert (=> (and b!237695 (= (defaultEntry!4412 thiss!1504) (defaultEntry!4412 thiss!1504)) t!8545) tb!2941))

(declare-fun result!5161 () Bool)

(assert (=> tb!2941 (= result!5161 tp_is_empty!6247)))

(assert (=> b!237860 t!8545))

(declare-fun b_and!13325 () Bool)

(assert (= b_and!13319 (and (=> t!8545 result!5161) b_and!13325)))

(assert (=> b!237856 m!258035))

(assert (=> b!237856 m!258035))

(assert (=> b!237856 m!258043))

(declare-fun m!258055 () Bool)

(assert (=> bm!22100 m!258055))

(declare-fun m!258057 () Bool)

(assert (=> bm!22099 m!258057))

(declare-fun m!258059 () Bool)

(assert (=> b!237871 m!258059))

(declare-fun m!258061 () Bool)

(assert (=> b!237864 m!258061))

(assert (=> b!237860 m!258035))

(declare-fun m!258063 () Bool)

(assert (=> b!237860 m!258063))

(declare-fun m!258065 () Bool)

(assert (=> b!237860 m!258065))

(declare-fun m!258067 () Bool)

(assert (=> b!237860 m!258067))

(assert (=> b!237860 m!258065))

(declare-fun m!258069 () Bool)

(assert (=> b!237860 m!258069))

(assert (=> b!237860 m!258035))

(assert (=> b!237860 m!258067))

(declare-fun m!258071 () Bool)

(assert (=> bm!22096 m!258071))

(declare-fun m!258073 () Bool)

(assert (=> bm!22098 m!258073))

(assert (=> b!237861 m!258035))

(assert (=> b!237861 m!258035))

(declare-fun m!258075 () Bool)

(assert (=> b!237861 m!258075))

(assert (=> b!237858 m!258035))

(assert (=> b!237858 m!258035))

(assert (=> b!237858 m!258043))

(assert (=> b!237867 m!258055))

(declare-fun m!258077 () Bool)

(assert (=> b!237867 m!258077))

(declare-fun m!258079 () Bool)

(assert (=> b!237867 m!258079))

(declare-fun m!258081 () Bool)

(assert (=> b!237867 m!258081))

(declare-fun m!258083 () Bool)

(assert (=> b!237867 m!258083))

(declare-fun m!258085 () Bool)

(assert (=> b!237867 m!258085))

(assert (=> b!237867 m!258035))

(assert (=> b!237867 m!258077))

(declare-fun m!258087 () Bool)

(assert (=> b!237867 m!258087))

(declare-fun m!258089 () Bool)

(assert (=> b!237867 m!258089))

(assert (=> b!237867 m!258085))

(declare-fun m!258091 () Bool)

(assert (=> b!237867 m!258091))

(declare-fun m!258093 () Bool)

(assert (=> b!237867 m!258093))

(declare-fun m!258095 () Bool)

(assert (=> b!237867 m!258095))

(declare-fun m!258097 () Bool)

(assert (=> b!237867 m!258097))

(declare-fun m!258099 () Bool)

(assert (=> b!237867 m!258099))

(declare-fun m!258101 () Bool)

(assert (=> b!237867 m!258101))

(assert (=> b!237867 m!258099))

(declare-fun m!258103 () Bool)

(assert (=> b!237867 m!258103))

(assert (=> b!237867 m!258089))

(declare-fun m!258105 () Bool)

(assert (=> b!237867 m!258105))

(assert (=> d!59575 m!257969))

(declare-fun m!258107 () Bool)

(assert (=> b!237859 m!258107))

(assert (=> b!237693 d!59575))

(declare-fun d!59577 () Bool)

(assert (=> d!59577 (= (validMask!0 (mask!10432 thiss!1504)) (and (or (= (mask!10432 thiss!1504) #b00000000000000000000000000000111) (= (mask!10432 thiss!1504) #b00000000000000000000000000001111) (= (mask!10432 thiss!1504) #b00000000000000000000000000011111) (= (mask!10432 thiss!1504) #b00000000000000000000000000111111) (= (mask!10432 thiss!1504) #b00000000000000000000000001111111) (= (mask!10432 thiss!1504) #b00000000000000000000000011111111) (= (mask!10432 thiss!1504) #b00000000000000000000000111111111) (= (mask!10432 thiss!1504) #b00000000000000000000001111111111) (= (mask!10432 thiss!1504) #b00000000000000000000011111111111) (= (mask!10432 thiss!1504) #b00000000000000000000111111111111) (= (mask!10432 thiss!1504) #b00000000000000000001111111111111) (= (mask!10432 thiss!1504) #b00000000000000000011111111111111) (= (mask!10432 thiss!1504) #b00000000000000000111111111111111) (= (mask!10432 thiss!1504) #b00000000000000001111111111111111) (= (mask!10432 thiss!1504) #b00000000000000011111111111111111) (= (mask!10432 thiss!1504) #b00000000000000111111111111111111) (= (mask!10432 thiss!1504) #b00000000000001111111111111111111) (= (mask!10432 thiss!1504) #b00000000000011111111111111111111) (= (mask!10432 thiss!1504) #b00000000000111111111111111111111) (= (mask!10432 thiss!1504) #b00000000001111111111111111111111) (= (mask!10432 thiss!1504) #b00000000011111111111111111111111) (= (mask!10432 thiss!1504) #b00000000111111111111111111111111) (= (mask!10432 thiss!1504) #b00000001111111111111111111111111) (= (mask!10432 thiss!1504) #b00000011111111111111111111111111) (= (mask!10432 thiss!1504) #b00000111111111111111111111111111) (= (mask!10432 thiss!1504) #b00001111111111111111111111111111) (= (mask!10432 thiss!1504) #b00011111111111111111111111111111) (= (mask!10432 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10432 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!237698 d!59577))

(declare-fun b!237882 () Bool)

(declare-fun e!154456 () Bool)

(assert (=> b!237882 (= e!154456 tp_is_empty!6247)))

(declare-fun mapIsEmpty!10602 () Bool)

(declare-fun mapRes!10602 () Bool)

(assert (=> mapIsEmpty!10602 mapRes!10602))

(declare-fun mapNonEmpty!10602 () Bool)

(declare-fun tp!22365 () Bool)

(assert (=> mapNonEmpty!10602 (= mapRes!10602 (and tp!22365 e!154456))))

(declare-fun mapValue!10602 () ValueCell!2780)

(declare-fun mapKey!10602 () (_ BitVec 32))

(declare-fun mapRest!10602 () (Array (_ BitVec 32) ValueCell!2780))

(assert (=> mapNonEmpty!10602 (= mapRest!10593 (store mapRest!10602 mapKey!10602 mapValue!10602))))

(declare-fun condMapEmpty!10602 () Bool)

(declare-fun mapDefault!10602 () ValueCell!2780)

(assert (=> mapNonEmpty!10593 (= condMapEmpty!10602 (= mapRest!10593 ((as const (Array (_ BitVec 32) ValueCell!2780)) mapDefault!10602)))))

(declare-fun e!154455 () Bool)

(assert (=> mapNonEmpty!10593 (= tp!22349 (and e!154455 mapRes!10602))))

(declare-fun b!237883 () Bool)

(assert (=> b!237883 (= e!154455 tp_is_empty!6247)))

(assert (= (and mapNonEmpty!10593 condMapEmpty!10602) mapIsEmpty!10602))

(assert (= (and mapNonEmpty!10593 (not condMapEmpty!10602)) mapNonEmpty!10602))

(assert (= (and mapNonEmpty!10602 ((_ is ValueCellFull!2780) mapValue!10602)) b!237882))

(assert (= (and mapNonEmpty!10593 ((_ is ValueCellFull!2780) mapDefault!10602)) b!237883))

(declare-fun m!258109 () Bool)

(assert (=> mapNonEmpty!10602 m!258109))

(declare-fun b_lambda!7951 () Bool)

(assert (= b_lambda!7949 (or (and b!237695 b_free!6385) b_lambda!7951)))

(check-sat tp_is_empty!6247 (not bm!22080) (not d!59575) (not b!237808) (not bm!22096) (not d!59573) (not bm!22100) (not b!237779) (not b!237787) (not b!237799) (not b_lambda!7951) (not d!59563) (not b!237810) (not mapNonEmpty!10602) (not b!237858) b_and!13325 (not b!237856) (not bm!22099) (not b!237861) (not b!237867) (not b!237859) (not bm!22098) (not b_next!6385) (not b!237860) (not b!237789) (not b!237864) (not b!237871) (not b!237788) (not b!237798) (not d!59569))
(check-sat b_and!13325 (not b_next!6385))
