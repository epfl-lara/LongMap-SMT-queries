; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80706 () Bool)

(assert start!80706)

(declare-fun b!946549 () Bool)

(declare-fun b_free!18109 () Bool)

(declare-fun b_next!18109 () Bool)

(assert (=> b!946549 (= b_free!18109 (not b_next!18109))))

(declare-fun tp!62851 () Bool)

(declare-fun b_and!29541 () Bool)

(assert (=> b!946549 (= tp!62851 b_and!29541)))

(declare-fun b!946547 () Bool)

(declare-fun e!532503 () Bool)

(declare-datatypes ((SeekEntryResult!9048 0))(
  ( (MissingZero!9048 (index!38563 (_ BitVec 32))) (Found!9048 (index!38564 (_ BitVec 32))) (Intermediate!9048 (undefined!9860 Bool) (index!38565 (_ BitVec 32)) (x!81241 (_ BitVec 32))) (Undefined!9048) (MissingVacant!9048 (index!38566 (_ BitVec 32))) )
))
(declare-fun lt!426430 () SeekEntryResult!9048)

(declare-datatypes ((V!32455 0))(
  ( (V!32456 (val!10359 Int)) )
))
(declare-datatypes ((ValueCell!9827 0))(
  ( (ValueCellFull!9827 (v!12890 V!32455)) (EmptyCell!9827) )
))
(declare-datatypes ((array!57261 0))(
  ( (array!57262 (arr!27547 (Array (_ BitVec 32) ValueCell!9827)) (size!28016 (_ BitVec 32))) )
))
(declare-datatypes ((array!57263 0))(
  ( (array!57264 (arr!27548 (Array (_ BitVec 32) (_ BitVec 64))) (size!28017 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4804 0))(
  ( (LongMapFixedSize!4805 (defaultEntry!5699 Int) (mask!27416 (_ BitVec 32)) (extraKeys!5431 (_ BitVec 32)) (zeroValue!5535 V!32455) (minValue!5535 V!32455) (_size!2457 (_ BitVec 32)) (_keys!10609 array!57263) (_values!5722 array!57261) (_vacant!2457 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4804)

(get-info :version)

(assert (=> b!946547 (= e!532503 (and ((_ is Found!9048) lt!426430) (bvsge (index!38564 lt!426430) #b00000000000000000000000000000000) (bvslt (index!38564 lt!426430) (size!28017 (_keys!10609 thiss!1141))) (bvsge (size!28017 (_keys!10609 thiss!1141)) #b01111111111111111111111111111111)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57263 (_ BitVec 32)) SeekEntryResult!9048)

(assert (=> b!946547 (= lt!426430 (seekEntry!0 key!756 (_keys!10609 thiss!1141) (mask!27416 thiss!1141)))))

(declare-fun b!946548 () Bool)

(declare-fun res!635396 () Bool)

(assert (=> b!946548 (=> (not res!635396) (not e!532503))))

(assert (=> b!946548 (= res!635396 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!20617 () Bool)

(declare-fun e!532505 () Bool)

(declare-fun e!532508 () Bool)

(declare-fun array_inv!21478 (array!57263) Bool)

(declare-fun array_inv!21479 (array!57261) Bool)

(assert (=> b!946549 (= e!532508 (and tp!62851 tp_is_empty!20617 (array_inv!21478 (_keys!10609 thiss!1141)) (array_inv!21479 (_values!5722 thiss!1141)) e!532505))))

(declare-fun b!946550 () Bool)

(declare-fun e!532506 () Bool)

(assert (=> b!946550 (= e!532506 tp_is_empty!20617)))

(declare-fun mapIsEmpty!32765 () Bool)

(declare-fun mapRes!32765 () Bool)

(assert (=> mapIsEmpty!32765 mapRes!32765))

(declare-fun b!946552 () Bool)

(assert (=> b!946552 (= e!532505 (and e!532506 mapRes!32765))))

(declare-fun condMapEmpty!32765 () Bool)

(declare-fun mapDefault!32765 () ValueCell!9827)

(assert (=> b!946552 (= condMapEmpty!32765 (= (arr!27547 (_values!5722 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9827)) mapDefault!32765)))))

(declare-fun mapNonEmpty!32765 () Bool)

(declare-fun tp!62852 () Bool)

(declare-fun e!532507 () Bool)

(assert (=> mapNonEmpty!32765 (= mapRes!32765 (and tp!62852 e!532507))))

(declare-fun mapKey!32765 () (_ BitVec 32))

(declare-fun mapRest!32765 () (Array (_ BitVec 32) ValueCell!9827))

(declare-fun mapValue!32765 () ValueCell!9827)

(assert (=> mapNonEmpty!32765 (= (arr!27547 (_values!5722 thiss!1141)) (store mapRest!32765 mapKey!32765 mapValue!32765))))

(declare-fun res!635395 () Bool)

(assert (=> start!80706 (=> (not res!635395) (not e!532503))))

(declare-fun valid!1841 (LongMapFixedSize!4804) Bool)

(assert (=> start!80706 (= res!635395 (valid!1841 thiss!1141))))

(assert (=> start!80706 e!532503))

(assert (=> start!80706 e!532508))

(assert (=> start!80706 true))

(declare-fun b!946551 () Bool)

(assert (=> b!946551 (= e!532507 tp_is_empty!20617)))

(assert (= (and start!80706 res!635395) b!946548))

(assert (= (and b!946548 res!635396) b!946547))

(assert (= (and b!946552 condMapEmpty!32765) mapIsEmpty!32765))

(assert (= (and b!946552 (not condMapEmpty!32765)) mapNonEmpty!32765))

(assert (= (and mapNonEmpty!32765 ((_ is ValueCellFull!9827) mapValue!32765)) b!946551))

(assert (= (and b!946552 ((_ is ValueCellFull!9827) mapDefault!32765)) b!946550))

(assert (= b!946549 b!946552))

(assert (= start!80706 b!946549))

(declare-fun m!880665 () Bool)

(assert (=> b!946547 m!880665))

(declare-fun m!880667 () Bool)

(assert (=> b!946549 m!880667))

(declare-fun m!880669 () Bool)

(assert (=> b!946549 m!880669))

(declare-fun m!880671 () Bool)

(assert (=> mapNonEmpty!32765 m!880671))

(declare-fun m!880673 () Bool)

(assert (=> start!80706 m!880673))

(check-sat (not b_next!18109) b_and!29541 tp_is_empty!20617 (not start!80706) (not b!946547) (not b!946549) (not mapNonEmpty!32765))
(check-sat b_and!29541 (not b_next!18109))
(get-model)

(declare-fun d!114747 () Bool)

(assert (=> d!114747 (= (array_inv!21478 (_keys!10609 thiss!1141)) (bvsge (size!28017 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946549 d!114747))

(declare-fun d!114749 () Bool)

(assert (=> d!114749 (= (array_inv!21479 (_values!5722 thiss!1141)) (bvsge (size!28016 (_values!5722 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946549 d!114749))

(declare-fun b!946601 () Bool)

(declare-fun e!532551 () SeekEntryResult!9048)

(declare-fun lt!426446 () SeekEntryResult!9048)

(assert (=> b!946601 (= e!532551 (MissingZero!9048 (index!38565 lt!426446)))))

(declare-fun b!946602 () Bool)

(declare-fun e!532552 () SeekEntryResult!9048)

(assert (=> b!946602 (= e!532552 Undefined!9048)))

(declare-fun b!946603 () Bool)

(declare-fun c!98728 () Bool)

(declare-fun lt!426448 () (_ BitVec 64))

(assert (=> b!946603 (= c!98728 (= lt!426448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532553 () SeekEntryResult!9048)

(assert (=> b!946603 (= e!532553 e!532551)))

(declare-fun b!946604 () Bool)

(declare-fun lt!426445 () SeekEntryResult!9048)

(assert (=> b!946604 (= e!532551 (ite ((_ is MissingVacant!9048) lt!426445) (MissingZero!9048 (index!38566 lt!426445)) lt!426445))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57263 (_ BitVec 32)) SeekEntryResult!9048)

(assert (=> b!946604 (= lt!426445 (seekKeyOrZeroReturnVacant!0 (x!81241 lt!426446) (index!38565 lt!426446) (index!38565 lt!426446) key!756 (_keys!10609 thiss!1141) (mask!27416 thiss!1141)))))

(declare-fun d!114751 () Bool)

(declare-fun lt!426447 () SeekEntryResult!9048)

(assert (=> d!114751 (and (or ((_ is MissingVacant!9048) lt!426447) (not ((_ is Found!9048) lt!426447)) (and (bvsge (index!38564 lt!426447) #b00000000000000000000000000000000) (bvslt (index!38564 lt!426447) (size!28017 (_keys!10609 thiss!1141))))) (not ((_ is MissingVacant!9048) lt!426447)) (or (not ((_ is Found!9048) lt!426447)) (= (select (arr!27548 (_keys!10609 thiss!1141)) (index!38564 lt!426447)) key!756)))))

(assert (=> d!114751 (= lt!426447 e!532552)))

(declare-fun c!98727 () Bool)

(assert (=> d!114751 (= c!98727 (and ((_ is Intermediate!9048) lt!426446) (undefined!9860 lt!426446)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57263 (_ BitVec 32)) SeekEntryResult!9048)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114751 (= lt!426446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27416 thiss!1141)) key!756 (_keys!10609 thiss!1141) (mask!27416 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114751 (validMask!0 (mask!27416 thiss!1141))))

(assert (=> d!114751 (= (seekEntry!0 key!756 (_keys!10609 thiss!1141) (mask!27416 thiss!1141)) lt!426447)))

(declare-fun b!946605 () Bool)

(assert (=> b!946605 (= e!532552 e!532553)))

(assert (=> b!946605 (= lt!426448 (select (arr!27548 (_keys!10609 thiss!1141)) (index!38565 lt!426446)))))

(declare-fun c!98729 () Bool)

(assert (=> b!946605 (= c!98729 (= lt!426448 key!756))))

(declare-fun b!946606 () Bool)

(assert (=> b!946606 (= e!532553 (Found!9048 (index!38565 lt!426446)))))

(assert (= (and d!114751 c!98727) b!946602))

(assert (= (and d!114751 (not c!98727)) b!946605))

(assert (= (and b!946605 c!98729) b!946606))

(assert (= (and b!946605 (not c!98729)) b!946603))

(assert (= (and b!946603 c!98728) b!946601))

(assert (= (and b!946603 (not c!98728)) b!946604))

(declare-fun m!880695 () Bool)

(assert (=> b!946604 m!880695))

(declare-fun m!880697 () Bool)

(assert (=> d!114751 m!880697))

(declare-fun m!880699 () Bool)

(assert (=> d!114751 m!880699))

(assert (=> d!114751 m!880699))

(declare-fun m!880701 () Bool)

(assert (=> d!114751 m!880701))

(declare-fun m!880703 () Bool)

(assert (=> d!114751 m!880703))

(declare-fun m!880705 () Bool)

(assert (=> b!946605 m!880705))

(assert (=> b!946547 d!114751))

(declare-fun d!114753 () Bool)

(declare-fun res!635415 () Bool)

(declare-fun e!532556 () Bool)

(assert (=> d!114753 (=> (not res!635415) (not e!532556))))

(declare-fun simpleValid!353 (LongMapFixedSize!4804) Bool)

(assert (=> d!114753 (= res!635415 (simpleValid!353 thiss!1141))))

(assert (=> d!114753 (= (valid!1841 thiss!1141) e!532556)))

(declare-fun b!946613 () Bool)

(declare-fun res!635416 () Bool)

(assert (=> b!946613 (=> (not res!635416) (not e!532556))))

(declare-fun arrayCountValidKeys!0 (array!57263 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946613 (= res!635416 (= (arrayCountValidKeys!0 (_keys!10609 thiss!1141) #b00000000000000000000000000000000 (size!28017 (_keys!10609 thiss!1141))) (_size!2457 thiss!1141)))))

(declare-fun b!946614 () Bool)

(declare-fun res!635417 () Bool)

(assert (=> b!946614 (=> (not res!635417) (not e!532556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57263 (_ BitVec 32)) Bool)

(assert (=> b!946614 (= res!635417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10609 thiss!1141) (mask!27416 thiss!1141)))))

(declare-fun b!946615 () Bool)

(declare-datatypes ((List!19278 0))(
  ( (Nil!19275) (Cons!19274 (h!20431 (_ BitVec 64)) (t!27591 List!19278)) )
))
(declare-fun arrayNoDuplicates!0 (array!57263 (_ BitVec 32) List!19278) Bool)

(assert (=> b!946615 (= e!532556 (arrayNoDuplicates!0 (_keys!10609 thiss!1141) #b00000000000000000000000000000000 Nil!19275))))

(assert (= (and d!114753 res!635415) b!946613))

(assert (= (and b!946613 res!635416) b!946614))

(assert (= (and b!946614 res!635417) b!946615))

(declare-fun m!880707 () Bool)

(assert (=> d!114753 m!880707))

(declare-fun m!880709 () Bool)

(assert (=> b!946613 m!880709))

(declare-fun m!880711 () Bool)

(assert (=> b!946614 m!880711))

(declare-fun m!880713 () Bool)

(assert (=> b!946615 m!880713))

(assert (=> start!80706 d!114753))

(declare-fun condMapEmpty!32774 () Bool)

(declare-fun mapDefault!32774 () ValueCell!9827)

(assert (=> mapNonEmpty!32765 (= condMapEmpty!32774 (= mapRest!32765 ((as const (Array (_ BitVec 32) ValueCell!9827)) mapDefault!32774)))))

(declare-fun e!532562 () Bool)

(declare-fun mapRes!32774 () Bool)

(assert (=> mapNonEmpty!32765 (= tp!62852 (and e!532562 mapRes!32774))))

(declare-fun b!946622 () Bool)

(declare-fun e!532561 () Bool)

(assert (=> b!946622 (= e!532561 tp_is_empty!20617)))

(declare-fun mapIsEmpty!32774 () Bool)

(assert (=> mapIsEmpty!32774 mapRes!32774))

(declare-fun b!946623 () Bool)

(assert (=> b!946623 (= e!532562 tp_is_empty!20617)))

(declare-fun mapNonEmpty!32774 () Bool)

(declare-fun tp!62867 () Bool)

(assert (=> mapNonEmpty!32774 (= mapRes!32774 (and tp!62867 e!532561))))

(declare-fun mapKey!32774 () (_ BitVec 32))

(declare-fun mapRest!32774 () (Array (_ BitVec 32) ValueCell!9827))

(declare-fun mapValue!32774 () ValueCell!9827)

(assert (=> mapNonEmpty!32774 (= mapRest!32765 (store mapRest!32774 mapKey!32774 mapValue!32774))))

(assert (= (and mapNonEmpty!32765 condMapEmpty!32774) mapIsEmpty!32774))

(assert (= (and mapNonEmpty!32765 (not condMapEmpty!32774)) mapNonEmpty!32774))

(assert (= (and mapNonEmpty!32774 ((_ is ValueCellFull!9827) mapValue!32774)) b!946622))

(assert (= (and mapNonEmpty!32765 ((_ is ValueCellFull!9827) mapDefault!32774)) b!946623))

(declare-fun m!880715 () Bool)

(assert (=> mapNonEmpty!32774 m!880715))

(check-sat (not b_next!18109) b_and!29541 (not b!946604) tp_is_empty!20617 (not b!946613) (not b!946615) (not d!114753) (not mapNonEmpty!32774) (not d!114751) (not b!946614))
(check-sat b_and!29541 (not b_next!18109))
(get-model)

(declare-fun d!114755 () Bool)

(declare-fun res!635427 () Bool)

(declare-fun e!532565 () Bool)

(assert (=> d!114755 (=> (not res!635427) (not e!532565))))

(assert (=> d!114755 (= res!635427 (validMask!0 (mask!27416 thiss!1141)))))

(assert (=> d!114755 (= (simpleValid!353 thiss!1141) e!532565)))

(declare-fun b!946634 () Bool)

(declare-fun res!635429 () Bool)

(assert (=> b!946634 (=> (not res!635429) (not e!532565))))

(declare-fun size!28022 (LongMapFixedSize!4804) (_ BitVec 32))

(assert (=> b!946634 (= res!635429 (= (size!28022 thiss!1141) (bvadd (_size!2457 thiss!1141) (bvsdiv (bvadd (extraKeys!5431 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!946632 () Bool)

(declare-fun res!635428 () Bool)

(assert (=> b!946632 (=> (not res!635428) (not e!532565))))

(assert (=> b!946632 (= res!635428 (and (= (size!28016 (_values!5722 thiss!1141)) (bvadd (mask!27416 thiss!1141) #b00000000000000000000000000000001)) (= (size!28017 (_keys!10609 thiss!1141)) (size!28016 (_values!5722 thiss!1141))) (bvsge (_size!2457 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2457 thiss!1141) (bvadd (mask!27416 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!946633 () Bool)

(declare-fun res!635426 () Bool)

(assert (=> b!946633 (=> (not res!635426) (not e!532565))))

(assert (=> b!946633 (= res!635426 (bvsge (size!28022 thiss!1141) (_size!2457 thiss!1141)))))

(declare-fun b!946635 () Bool)

(assert (=> b!946635 (= e!532565 (and (bvsge (extraKeys!5431 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5431 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2457 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114755 res!635427) b!946632))

(assert (= (and b!946632 res!635428) b!946633))

(assert (= (and b!946633 res!635426) b!946634))

(assert (= (and b!946634 res!635429) b!946635))

(assert (=> d!114755 m!880703))

(declare-fun m!880717 () Bool)

(assert (=> b!946634 m!880717))

(assert (=> b!946633 m!880717))

(assert (=> d!114753 d!114755))

(declare-fun b!946648 () Bool)

(declare-fun e!532572 () SeekEntryResult!9048)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946648 (= e!532572 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81241 lt!426446) #b00000000000000000000000000000001) (nextIndex!0 (index!38565 lt!426446) (bvadd (x!81241 lt!426446) #b00000000000000000000000000000001) (mask!27416 thiss!1141)) (index!38565 lt!426446) key!756 (_keys!10609 thiss!1141) (mask!27416 thiss!1141)))))

(declare-fun b!946649 () Bool)

(declare-fun e!532573 () SeekEntryResult!9048)

(assert (=> b!946649 (= e!532573 (Found!9048 (index!38565 lt!426446)))))

(declare-fun d!114757 () Bool)

(declare-fun lt!426454 () SeekEntryResult!9048)

(assert (=> d!114757 (and (or ((_ is Undefined!9048) lt!426454) (not ((_ is Found!9048) lt!426454)) (and (bvsge (index!38564 lt!426454) #b00000000000000000000000000000000) (bvslt (index!38564 lt!426454) (size!28017 (_keys!10609 thiss!1141))))) (or ((_ is Undefined!9048) lt!426454) ((_ is Found!9048) lt!426454) (not ((_ is MissingVacant!9048) lt!426454)) (not (= (index!38566 lt!426454) (index!38565 lt!426446))) (and (bvsge (index!38566 lt!426454) #b00000000000000000000000000000000) (bvslt (index!38566 lt!426454) (size!28017 (_keys!10609 thiss!1141))))) (or ((_ is Undefined!9048) lt!426454) (ite ((_ is Found!9048) lt!426454) (= (select (arr!27548 (_keys!10609 thiss!1141)) (index!38564 lt!426454)) key!756) (and ((_ is MissingVacant!9048) lt!426454) (= (index!38566 lt!426454) (index!38565 lt!426446)) (= (select (arr!27548 (_keys!10609 thiss!1141)) (index!38566 lt!426454)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!532574 () SeekEntryResult!9048)

(assert (=> d!114757 (= lt!426454 e!532574)))

(declare-fun c!98737 () Bool)

(assert (=> d!114757 (= c!98737 (bvsge (x!81241 lt!426446) #b01111111111111111111111111111110))))

(declare-fun lt!426453 () (_ BitVec 64))

(assert (=> d!114757 (= lt!426453 (select (arr!27548 (_keys!10609 thiss!1141)) (index!38565 lt!426446)))))

(assert (=> d!114757 (validMask!0 (mask!27416 thiss!1141))))

(assert (=> d!114757 (= (seekKeyOrZeroReturnVacant!0 (x!81241 lt!426446) (index!38565 lt!426446) (index!38565 lt!426446) key!756 (_keys!10609 thiss!1141) (mask!27416 thiss!1141)) lt!426454)))

(declare-fun b!946650 () Bool)

(assert (=> b!946650 (= e!532574 e!532573)))

(declare-fun c!98738 () Bool)

(assert (=> b!946650 (= c!98738 (= lt!426453 key!756))))

(declare-fun b!946651 () Bool)

(assert (=> b!946651 (= e!532574 Undefined!9048)))

(declare-fun b!946652 () Bool)

(declare-fun c!98736 () Bool)

(assert (=> b!946652 (= c!98736 (= lt!426453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946652 (= e!532573 e!532572)))

(declare-fun b!946653 () Bool)

(assert (=> b!946653 (= e!532572 (MissingVacant!9048 (index!38565 lt!426446)))))

(assert (= (and d!114757 c!98737) b!946651))

(assert (= (and d!114757 (not c!98737)) b!946650))

(assert (= (and b!946650 c!98738) b!946649))

(assert (= (and b!946650 (not c!98738)) b!946652))

(assert (= (and b!946652 c!98736) b!946653))

(assert (= (and b!946652 (not c!98736)) b!946648))

(declare-fun m!880719 () Bool)

(assert (=> b!946648 m!880719))

(assert (=> b!946648 m!880719))

(declare-fun m!880721 () Bool)

(assert (=> b!946648 m!880721))

(declare-fun m!880723 () Bool)

(assert (=> d!114757 m!880723))

(declare-fun m!880725 () Bool)

(assert (=> d!114757 m!880725))

(assert (=> d!114757 m!880705))

(assert (=> d!114757 m!880703))

(assert (=> b!946604 d!114757))

(declare-fun b!946662 () Bool)

(declare-fun e!532580 () (_ BitVec 32))

(declare-fun call!41106 () (_ BitVec 32))

(assert (=> b!946662 (= e!532580 call!41106)))

(declare-fun d!114759 () Bool)

(declare-fun lt!426457 () (_ BitVec 32))

(assert (=> d!114759 (and (bvsge lt!426457 #b00000000000000000000000000000000) (bvsle lt!426457 (bvsub (size!28017 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!532579 () (_ BitVec 32))

(assert (=> d!114759 (= lt!426457 e!532579)))

(declare-fun c!98743 () Bool)

(assert (=> d!114759 (= c!98743 (bvsge #b00000000000000000000000000000000 (size!28017 (_keys!10609 thiss!1141))))))

(assert (=> d!114759 (and (bvsle #b00000000000000000000000000000000 (size!28017 (_keys!10609 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28017 (_keys!10609 thiss!1141)) (size!28017 (_keys!10609 thiss!1141))))))

(assert (=> d!114759 (= (arrayCountValidKeys!0 (_keys!10609 thiss!1141) #b00000000000000000000000000000000 (size!28017 (_keys!10609 thiss!1141))) lt!426457)))

(declare-fun bm!41103 () Bool)

(assert (=> bm!41103 (= call!41106 (arrayCountValidKeys!0 (_keys!10609 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28017 (_keys!10609 thiss!1141))))))

(declare-fun b!946663 () Bool)

(assert (=> b!946663 (= e!532579 e!532580)))

(declare-fun c!98744 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946663 (= c!98744 (validKeyInArray!0 (select (arr!27548 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946664 () Bool)

(assert (=> b!946664 (= e!532580 (bvadd #b00000000000000000000000000000001 call!41106))))

(declare-fun b!946665 () Bool)

(assert (=> b!946665 (= e!532579 #b00000000000000000000000000000000)))

(assert (= (and d!114759 c!98743) b!946665))

(assert (= (and d!114759 (not c!98743)) b!946663))

(assert (= (and b!946663 c!98744) b!946664))

(assert (= (and b!946663 (not c!98744)) b!946662))

(assert (= (or b!946664 b!946662) bm!41103))

(declare-fun m!880727 () Bool)

(assert (=> bm!41103 m!880727))

(declare-fun m!880729 () Bool)

(assert (=> b!946663 m!880729))

(assert (=> b!946663 m!880729))

(declare-fun m!880731 () Bool)

(assert (=> b!946663 m!880731))

(assert (=> b!946613 d!114759))

(declare-fun b!946684 () Bool)

(declare-fun lt!426463 () SeekEntryResult!9048)

(assert (=> b!946684 (and (bvsge (index!38565 lt!426463) #b00000000000000000000000000000000) (bvslt (index!38565 lt!426463) (size!28017 (_keys!10609 thiss!1141))))))

(declare-fun res!635437 () Bool)

(assert (=> b!946684 (= res!635437 (= (select (arr!27548 (_keys!10609 thiss!1141)) (index!38565 lt!426463)) key!756))))

(declare-fun e!532591 () Bool)

(assert (=> b!946684 (=> res!635437 e!532591)))

(declare-fun e!532595 () Bool)

(assert (=> b!946684 (= e!532595 e!532591)))

(declare-fun b!946685 () Bool)

(declare-fun e!532592 () SeekEntryResult!9048)

(declare-fun e!532594 () SeekEntryResult!9048)

(assert (=> b!946685 (= e!532592 e!532594)))

(declare-fun c!98751 () Bool)

(declare-fun lt!426462 () (_ BitVec 64))

(assert (=> b!946685 (= c!98751 (or (= lt!426462 key!756) (= (bvadd lt!426462 lt!426462) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!946686 () Bool)

(assert (=> b!946686 (= e!532594 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27416 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27416 thiss!1141)) key!756 (_keys!10609 thiss!1141) (mask!27416 thiss!1141)))))

(declare-fun b!946687 () Bool)

(assert (=> b!946687 (= e!532594 (Intermediate!9048 false (toIndex!0 key!756 (mask!27416 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946688 () Bool)

(declare-fun e!532593 () Bool)

(assert (=> b!946688 (= e!532593 e!532595)))

(declare-fun res!635436 () Bool)

(assert (=> b!946688 (= res!635436 (and ((_ is Intermediate!9048) lt!426463) (not (undefined!9860 lt!426463)) (bvslt (x!81241 lt!426463) #b01111111111111111111111111111110) (bvsge (x!81241 lt!426463) #b00000000000000000000000000000000) (bvsge (x!81241 lt!426463) #b00000000000000000000000000000000)))))

(assert (=> b!946688 (=> (not res!635436) (not e!532595))))

(declare-fun b!946689 () Bool)

(assert (=> b!946689 (= e!532593 (bvsge (x!81241 lt!426463) #b01111111111111111111111111111110))))

(declare-fun d!114761 () Bool)

(assert (=> d!114761 e!532593))

(declare-fun c!98753 () Bool)

(assert (=> d!114761 (= c!98753 (and ((_ is Intermediate!9048) lt!426463) (undefined!9860 lt!426463)))))

(assert (=> d!114761 (= lt!426463 e!532592)))

(declare-fun c!98752 () Bool)

(assert (=> d!114761 (= c!98752 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114761 (= lt!426462 (select (arr!27548 (_keys!10609 thiss!1141)) (toIndex!0 key!756 (mask!27416 thiss!1141))))))

(assert (=> d!114761 (validMask!0 (mask!27416 thiss!1141))))

(assert (=> d!114761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27416 thiss!1141)) key!756 (_keys!10609 thiss!1141) (mask!27416 thiss!1141)) lt!426463)))

(declare-fun b!946690 () Bool)

(assert (=> b!946690 (and (bvsge (index!38565 lt!426463) #b00000000000000000000000000000000) (bvslt (index!38565 lt!426463) (size!28017 (_keys!10609 thiss!1141))))))

(assert (=> b!946690 (= e!532591 (= (select (arr!27548 (_keys!10609 thiss!1141)) (index!38565 lt!426463)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!946691 () Bool)

(assert (=> b!946691 (and (bvsge (index!38565 lt!426463) #b00000000000000000000000000000000) (bvslt (index!38565 lt!426463) (size!28017 (_keys!10609 thiss!1141))))))

(declare-fun res!635438 () Bool)

(assert (=> b!946691 (= res!635438 (= (select (arr!27548 (_keys!10609 thiss!1141)) (index!38565 lt!426463)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946691 (=> res!635438 e!532591)))

(declare-fun b!946692 () Bool)

(assert (=> b!946692 (= e!532592 (Intermediate!9048 true (toIndex!0 key!756 (mask!27416 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!114761 c!98752) b!946692))

(assert (= (and d!114761 (not c!98752)) b!946685))

(assert (= (and b!946685 c!98751) b!946687))

(assert (= (and b!946685 (not c!98751)) b!946686))

(assert (= (and d!114761 c!98753) b!946689))

(assert (= (and d!114761 (not c!98753)) b!946688))

(assert (= (and b!946688 res!635436) b!946684))

(assert (= (and b!946684 (not res!635437)) b!946691))

(assert (= (and b!946691 (not res!635438)) b!946690))

(assert (=> d!114761 m!880699))

(declare-fun m!880733 () Bool)

(assert (=> d!114761 m!880733))

(assert (=> d!114761 m!880703))

(declare-fun m!880735 () Bool)

(assert (=> b!946684 m!880735))

(assert (=> b!946686 m!880699))

(declare-fun m!880737 () Bool)

(assert (=> b!946686 m!880737))

(assert (=> b!946686 m!880737))

(declare-fun m!880739 () Bool)

(assert (=> b!946686 m!880739))

(assert (=> b!946690 m!880735))

(assert (=> b!946691 m!880735))

(assert (=> d!114751 d!114761))

(declare-fun d!114763 () Bool)

(declare-fun lt!426469 () (_ BitVec 32))

(declare-fun lt!426468 () (_ BitVec 32))

(assert (=> d!114763 (= lt!426469 (bvmul (bvxor lt!426468 (bvlshr lt!426468 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114763 (= lt!426468 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114763 (and (bvsge (mask!27416 thiss!1141) #b00000000000000000000000000000000) (let ((res!635439 (let ((h!20432 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81258 (bvmul (bvxor h!20432 (bvlshr h!20432 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81258 (bvlshr x!81258 #b00000000000000000000000000001101)) (mask!27416 thiss!1141)))))) (and (bvslt res!635439 (bvadd (mask!27416 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635439 #b00000000000000000000000000000000))))))

(assert (=> d!114763 (= (toIndex!0 key!756 (mask!27416 thiss!1141)) (bvand (bvxor lt!426469 (bvlshr lt!426469 #b00000000000000000000000000001101)) (mask!27416 thiss!1141)))))

(assert (=> d!114751 d!114763))

(declare-fun d!114765 () Bool)

(assert (=> d!114765 (= (validMask!0 (mask!27416 thiss!1141)) (and (or (= (mask!27416 thiss!1141) #b00000000000000000000000000000111) (= (mask!27416 thiss!1141) #b00000000000000000000000000001111) (= (mask!27416 thiss!1141) #b00000000000000000000000000011111) (= (mask!27416 thiss!1141) #b00000000000000000000000000111111) (= (mask!27416 thiss!1141) #b00000000000000000000000001111111) (= (mask!27416 thiss!1141) #b00000000000000000000000011111111) (= (mask!27416 thiss!1141) #b00000000000000000000000111111111) (= (mask!27416 thiss!1141) #b00000000000000000000001111111111) (= (mask!27416 thiss!1141) #b00000000000000000000011111111111) (= (mask!27416 thiss!1141) #b00000000000000000000111111111111) (= (mask!27416 thiss!1141) #b00000000000000000001111111111111) (= (mask!27416 thiss!1141) #b00000000000000000011111111111111) (= (mask!27416 thiss!1141) #b00000000000000000111111111111111) (= (mask!27416 thiss!1141) #b00000000000000001111111111111111) (= (mask!27416 thiss!1141) #b00000000000000011111111111111111) (= (mask!27416 thiss!1141) #b00000000000000111111111111111111) (= (mask!27416 thiss!1141) #b00000000000001111111111111111111) (= (mask!27416 thiss!1141) #b00000000000011111111111111111111) (= (mask!27416 thiss!1141) #b00000000000111111111111111111111) (= (mask!27416 thiss!1141) #b00000000001111111111111111111111) (= (mask!27416 thiss!1141) #b00000000011111111111111111111111) (= (mask!27416 thiss!1141) #b00000000111111111111111111111111) (= (mask!27416 thiss!1141) #b00000001111111111111111111111111) (= (mask!27416 thiss!1141) #b00000011111111111111111111111111) (= (mask!27416 thiss!1141) #b00000111111111111111111111111111) (= (mask!27416 thiss!1141) #b00001111111111111111111111111111) (= (mask!27416 thiss!1141) #b00011111111111111111111111111111) (= (mask!27416 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27416 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> d!114751 d!114765))

(declare-fun b!946701 () Bool)

(declare-fun e!532603 () Bool)

(declare-fun call!41109 () Bool)

(assert (=> b!946701 (= e!532603 call!41109)))

(declare-fun b!946702 () Bool)

(declare-fun e!532602 () Bool)

(assert (=> b!946702 (= e!532602 call!41109)))

(declare-fun bm!41106 () Bool)

(assert (=> bm!41106 (= call!41109 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10609 thiss!1141) (mask!27416 thiss!1141)))))

(declare-fun d!114767 () Bool)

(declare-fun res!635444 () Bool)

(declare-fun e!532604 () Bool)

(assert (=> d!114767 (=> res!635444 e!532604)))

(assert (=> d!114767 (= res!635444 (bvsge #b00000000000000000000000000000000 (size!28017 (_keys!10609 thiss!1141))))))

(assert (=> d!114767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10609 thiss!1141) (mask!27416 thiss!1141)) e!532604)))

(declare-fun b!946703 () Bool)

(assert (=> b!946703 (= e!532602 e!532603)))

(declare-fun lt!426477 () (_ BitVec 64))

(assert (=> b!946703 (= lt!426477 (select (arr!27548 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31865 0))(
  ( (Unit!31866) )
))
(declare-fun lt!426478 () Unit!31865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57263 (_ BitVec 64) (_ BitVec 32)) Unit!31865)

(assert (=> b!946703 (= lt!426478 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10609 thiss!1141) lt!426477 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946703 (arrayContainsKey!0 (_keys!10609 thiss!1141) lt!426477 #b00000000000000000000000000000000)))

(declare-fun lt!426476 () Unit!31865)

(assert (=> b!946703 (= lt!426476 lt!426478)))

(declare-fun res!635445 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57263 (_ BitVec 32)) SeekEntryResult!9048)

(assert (=> b!946703 (= res!635445 (= (seekEntryOrOpen!0 (select (arr!27548 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000) (_keys!10609 thiss!1141) (mask!27416 thiss!1141)) (Found!9048 #b00000000000000000000000000000000)))))

(assert (=> b!946703 (=> (not res!635445) (not e!532603))))

(declare-fun b!946704 () Bool)

(assert (=> b!946704 (= e!532604 e!532602)))

(declare-fun c!98756 () Bool)

(assert (=> b!946704 (= c!98756 (validKeyInArray!0 (select (arr!27548 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114767 (not res!635444)) b!946704))

(assert (= (and b!946704 c!98756) b!946703))

(assert (= (and b!946704 (not c!98756)) b!946702))

(assert (= (and b!946703 res!635445) b!946701))

(assert (= (or b!946701 b!946702) bm!41106))

(declare-fun m!880741 () Bool)

(assert (=> bm!41106 m!880741))

(assert (=> b!946703 m!880729))

(declare-fun m!880743 () Bool)

(assert (=> b!946703 m!880743))

(declare-fun m!880745 () Bool)

(assert (=> b!946703 m!880745))

(assert (=> b!946703 m!880729))

(declare-fun m!880747 () Bool)

(assert (=> b!946703 m!880747))

(assert (=> b!946704 m!880729))

(assert (=> b!946704 m!880729))

(assert (=> b!946704 m!880731))

(assert (=> b!946614 d!114767))

(declare-fun b!946715 () Bool)

(declare-fun e!532615 () Bool)

(declare-fun call!41112 () Bool)

(assert (=> b!946715 (= e!532615 call!41112)))

(declare-fun b!946716 () Bool)

(declare-fun e!532613 () Bool)

(assert (=> b!946716 (= e!532613 e!532615)))

(declare-fun c!98759 () Bool)

(assert (=> b!946716 (= c!98759 (validKeyInArray!0 (select (arr!27548 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946717 () Bool)

(declare-fun e!532614 () Bool)

(assert (=> b!946717 (= e!532614 e!532613)))

(declare-fun res!635453 () Bool)

(assert (=> b!946717 (=> (not res!635453) (not e!532613))))

(declare-fun e!532616 () Bool)

(assert (=> b!946717 (= res!635453 (not e!532616))))

(declare-fun res!635452 () Bool)

(assert (=> b!946717 (=> (not res!635452) (not e!532616))))

(assert (=> b!946717 (= res!635452 (validKeyInArray!0 (select (arr!27548 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946718 () Bool)

(declare-fun contains!5195 (List!19278 (_ BitVec 64)) Bool)

(assert (=> b!946718 (= e!532616 (contains!5195 Nil!19275 (select (arr!27548 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114769 () Bool)

(declare-fun res!635454 () Bool)

(assert (=> d!114769 (=> res!635454 e!532614)))

(assert (=> d!114769 (= res!635454 (bvsge #b00000000000000000000000000000000 (size!28017 (_keys!10609 thiss!1141))))))

(assert (=> d!114769 (= (arrayNoDuplicates!0 (_keys!10609 thiss!1141) #b00000000000000000000000000000000 Nil!19275) e!532614)))

(declare-fun b!946719 () Bool)

(assert (=> b!946719 (= e!532615 call!41112)))

(declare-fun bm!41109 () Bool)

(assert (=> bm!41109 (= call!41112 (arrayNoDuplicates!0 (_keys!10609 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98759 (Cons!19274 (select (arr!27548 (_keys!10609 thiss!1141)) #b00000000000000000000000000000000) Nil!19275) Nil!19275)))))

(assert (= (and d!114769 (not res!635454)) b!946717))

(assert (= (and b!946717 res!635452) b!946718))

(assert (= (and b!946717 res!635453) b!946716))

(assert (= (and b!946716 c!98759) b!946715))

(assert (= (and b!946716 (not c!98759)) b!946719))

(assert (= (or b!946715 b!946719) bm!41109))

(assert (=> b!946716 m!880729))

(assert (=> b!946716 m!880729))

(assert (=> b!946716 m!880731))

(assert (=> b!946717 m!880729))

(assert (=> b!946717 m!880729))

(assert (=> b!946717 m!880731))

(assert (=> b!946718 m!880729))

(assert (=> b!946718 m!880729))

(declare-fun m!880749 () Bool)

(assert (=> b!946718 m!880749))

(assert (=> bm!41109 m!880729))

(declare-fun m!880751 () Bool)

(assert (=> bm!41109 m!880751))

(assert (=> b!946615 d!114769))

(declare-fun condMapEmpty!32775 () Bool)

(declare-fun mapDefault!32775 () ValueCell!9827)

(assert (=> mapNonEmpty!32774 (= condMapEmpty!32775 (= mapRest!32774 ((as const (Array (_ BitVec 32) ValueCell!9827)) mapDefault!32775)))))

(declare-fun e!532618 () Bool)

(declare-fun mapRes!32775 () Bool)

(assert (=> mapNonEmpty!32774 (= tp!62867 (and e!532618 mapRes!32775))))

(declare-fun b!946720 () Bool)

(declare-fun e!532617 () Bool)

(assert (=> b!946720 (= e!532617 tp_is_empty!20617)))

(declare-fun mapIsEmpty!32775 () Bool)

(assert (=> mapIsEmpty!32775 mapRes!32775))

(declare-fun b!946721 () Bool)

(assert (=> b!946721 (= e!532618 tp_is_empty!20617)))

(declare-fun mapNonEmpty!32775 () Bool)

(declare-fun tp!62868 () Bool)

(assert (=> mapNonEmpty!32775 (= mapRes!32775 (and tp!62868 e!532617))))

(declare-fun mapRest!32775 () (Array (_ BitVec 32) ValueCell!9827))

(declare-fun mapValue!32775 () ValueCell!9827)

(declare-fun mapKey!32775 () (_ BitVec 32))

(assert (=> mapNonEmpty!32775 (= mapRest!32774 (store mapRest!32775 mapKey!32775 mapValue!32775))))

(assert (= (and mapNonEmpty!32774 condMapEmpty!32775) mapIsEmpty!32775))

(assert (= (and mapNonEmpty!32774 (not condMapEmpty!32775)) mapNonEmpty!32775))

(assert (= (and mapNonEmpty!32775 ((_ is ValueCellFull!9827) mapValue!32775)) b!946720))

(assert (= (and mapNonEmpty!32774 ((_ is ValueCellFull!9827) mapDefault!32775)) b!946721))

(declare-fun m!880753 () Bool)

(assert (=> mapNonEmpty!32775 m!880753))

(check-sat (not b_next!18109) b_and!29541 (not b!946648) (not mapNonEmpty!32775) tp_is_empty!20617 (not d!114757) (not b!946703) (not d!114761) (not b!946704) (not b!946717) (not bm!41106) (not b!946634) (not d!114755) (not b!946663) (not b!946716) (not bm!41103) (not bm!41109) (not b!946718) (not b!946633) (not b!946686))
(check-sat b_and!29541 (not b_next!18109))
