; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23368 () Bool)

(assert start!23368)

(declare-fun b!245727 () Bool)

(declare-fun b_free!6561 () Bool)

(declare-fun b_next!6561 () Bool)

(assert (=> b!245727 (= b_free!6561 (not b_next!6561))))

(declare-fun tp!22917 () Bool)

(declare-fun b_and!13551 () Bool)

(assert (=> b!245727 (= tp!22917 b_and!13551)))

(declare-fun bm!22947 () Bool)

(declare-fun call!22951 () Bool)

(declare-datatypes ((V!8211 0))(
  ( (V!8212 (val!3256 Int)) )
))
(declare-datatypes ((ValueCell!2868 0))(
  ( (ValueCellFull!2868 (v!5309 V!8211)) (EmptyCell!2868) )
))
(declare-datatypes ((array!12145 0))(
  ( (array!12146 (arr!5764 (Array (_ BitVec 32) ValueCell!2868)) (size!6106 (_ BitVec 32))) )
))
(declare-datatypes ((array!12147 0))(
  ( (array!12148 (arr!5765 (Array (_ BitVec 32) (_ BitVec 64))) (size!6107 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3636 0))(
  ( (LongMapFixedSize!3637 (defaultEntry!4547 Int) (mask!10661 (_ BitVec 32)) (extraKeys!4284 (_ BitVec 32)) (zeroValue!4388 V!8211) (minValue!4388 V!8211) (_size!1867 (_ BitVec 32)) (_keys!6662 array!12147) (_values!4530 array!12145) (_vacant!1867 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3636)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22947 (= call!22951 (arrayContainsKey!0 (_keys!6662 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245715 () Bool)

(declare-fun e!159420 () Bool)

(declare-datatypes ((SeekEntryResult!1091 0))(
  ( (MissingZero!1091 (index!6534 (_ BitVec 32))) (Found!1091 (index!6535 (_ BitVec 32))) (Intermediate!1091 (undefined!1903 Bool) (index!6536 (_ BitVec 32)) (x!24439 (_ BitVec 32))) (Undefined!1091) (MissingVacant!1091 (index!6537 (_ BitVec 32))) )
))
(declare-fun lt!123061 () SeekEntryResult!1091)

(get-info :version)

(assert (=> b!245715 (= e!159420 ((_ is Undefined!1091) lt!123061))))

(declare-fun b!245716 () Bool)

(declare-datatypes ((Unit!7585 0))(
  ( (Unit!7586) )
))
(declare-fun e!159421 () Unit!7585)

(declare-fun Unit!7587 () Unit!7585)

(assert (=> b!245716 (= e!159421 Unit!7587)))

(declare-fun lt!123062 () Unit!7585)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!373 (array!12147 array!12145 (_ BitVec 32) (_ BitVec 32) V!8211 V!8211 (_ BitVec 64) Int) Unit!7585)

(assert (=> b!245716 (= lt!123062 (lemmaInListMapThenSeekEntryOrOpenFindsIt!373 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 (defaultEntry!4547 thiss!1504)))))

(assert (=> b!245716 false))

(declare-fun mapIsEmpty!10897 () Bool)

(declare-fun mapRes!10897 () Bool)

(assert (=> mapIsEmpty!10897 mapRes!10897))

(declare-fun b!245717 () Bool)

(declare-fun e!159414 () Bool)

(assert (=> b!245717 (= e!159420 e!159414)))

(declare-fun res!120509 () Bool)

(declare-fun call!22950 () Bool)

(assert (=> b!245717 (= res!120509 call!22950)))

(assert (=> b!245717 (=> (not res!120509) (not e!159414))))

(declare-fun b!245718 () Bool)

(declare-fun e!159416 () Bool)

(declare-fun tp_is_empty!6423 () Bool)

(assert (=> b!245718 (= e!159416 tp_is_empty!6423)))

(declare-fun b!245719 () Bool)

(declare-fun e!159422 () Bool)

(assert (=> b!245719 (= e!159422 (not call!22951))))

(declare-fun b!245721 () Bool)

(declare-fun res!120510 () Bool)

(assert (=> b!245721 (= res!120510 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6537 lt!123061)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245721 (=> (not res!120510) (not e!159414))))

(declare-fun b!245722 () Bool)

(declare-fun res!120514 () Bool)

(assert (=> b!245722 (=> (not res!120514) (not e!159422))))

(assert (=> b!245722 (= res!120514 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6534 lt!123061)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245723 () Bool)

(declare-fun e!159426 () Bool)

(assert (=> b!245723 (= e!159426 (and e!159416 mapRes!10897))))

(declare-fun condMapEmpty!10897 () Bool)

(declare-fun mapDefault!10897 () ValueCell!2868)

(assert (=> b!245723 (= condMapEmpty!10897 (= (arr!5764 (_values!4530 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2868)) mapDefault!10897)))))

(declare-fun b!245724 () Bool)

(declare-fun lt!123056 () Unit!7585)

(assert (=> b!245724 (= e!159421 lt!123056)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!378 (array!12147 array!12145 (_ BitVec 32) (_ BitVec 32) V!8211 V!8211 (_ BitVec 64) Int) Unit!7585)

(assert (=> b!245724 (= lt!123056 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!378 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 (defaultEntry!4547 thiss!1504)))))

(declare-fun c!41045 () Bool)

(assert (=> b!245724 (= c!41045 ((_ is MissingZero!1091) lt!123061))))

(declare-fun e!159424 () Bool)

(assert (=> b!245724 e!159424))

(declare-fun bm!22948 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22948 (= call!22950 (inRange!0 (ite c!41045 (index!6534 lt!123061) (index!6537 lt!123061)) (mask!10661 thiss!1504)))))

(declare-fun b!245725 () Bool)

(declare-fun e!159419 () Bool)

(declare-fun e!159412 () Bool)

(assert (=> b!245725 (= e!159419 e!159412)))

(declare-fun res!120513 () Bool)

(assert (=> b!245725 (=> (not res!120513) (not e!159412))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!245725 (= res!120513 (inRange!0 index!297 (mask!10661 thiss!1504)))))

(declare-fun lt!123057 () Unit!7585)

(assert (=> b!245725 (= lt!123057 e!159421)))

(declare-fun c!41042 () Bool)

(declare-datatypes ((tuple2!4790 0))(
  ( (tuple2!4791 (_1!2406 (_ BitVec 64)) (_2!2406 V!8211)) )
))
(declare-datatypes ((List!3672 0))(
  ( (Nil!3669) (Cons!3668 (h!4325 tuple2!4790) (t!8687 List!3672)) )
))
(declare-datatypes ((ListLongMap!3703 0))(
  ( (ListLongMap!3704 (toList!1867 List!3672)) )
))
(declare-fun contains!1776 (ListLongMap!3703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1395 (array!12147 array!12145 (_ BitVec 32) (_ BitVec 32) V!8211 V!8211 (_ BitVec 32) Int) ListLongMap!3703)

(assert (=> b!245725 (= c!41042 (contains!1776 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)) key!932))))

(declare-fun b!245726 () Bool)

(declare-fun res!120508 () Bool)

(assert (=> b!245726 (=> (not res!120508) (not e!159422))))

(assert (=> b!245726 (= res!120508 call!22950)))

(assert (=> b!245726 (= e!159424 e!159422)))

(declare-fun e!159415 () Bool)

(declare-fun array_inv!3807 (array!12147) Bool)

(declare-fun array_inv!3808 (array!12145) Bool)

(assert (=> b!245727 (= e!159415 (and tp!22917 tp_is_empty!6423 (array_inv!3807 (_keys!6662 thiss!1504)) (array_inv!3808 (_values!4530 thiss!1504)) e!159426))))

(declare-fun b!245728 () Bool)

(declare-fun e!159423 () Bool)

(assert (=> b!245728 (= e!159423 e!159419)))

(declare-fun res!120511 () Bool)

(assert (=> b!245728 (=> (not res!120511) (not e!159419))))

(assert (=> b!245728 (= res!120511 (or (= lt!123061 (MissingZero!1091 index!297)) (= lt!123061 (MissingVacant!1091 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12147 (_ BitVec 32)) SeekEntryResult!1091)

(assert (=> b!245728 (= lt!123061 (seekEntryOrOpen!0 key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(declare-fun b!245729 () Bool)

(declare-fun res!120516 () Bool)

(assert (=> b!245729 (=> (not res!120516) (not e!159423))))

(assert (=> b!245729 (= res!120516 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!245730 () Bool)

(declare-fun e!159418 () Bool)

(assert (=> b!245730 (= e!159418 (= (size!6107 (_keys!6662 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10661 thiss!1504))))))

(declare-fun mapNonEmpty!10897 () Bool)

(declare-fun tp!22918 () Bool)

(declare-fun e!159413 () Bool)

(assert (=> mapNonEmpty!10897 (= mapRes!10897 (and tp!22918 e!159413))))

(declare-fun mapValue!10897 () ValueCell!2868)

(declare-fun mapKey!10897 () (_ BitVec 32))

(declare-fun mapRest!10897 () (Array (_ BitVec 32) ValueCell!2868))

(assert (=> mapNonEmpty!10897 (= (arr!5764 (_values!4530 thiss!1504)) (store mapRest!10897 mapKey!10897 mapValue!10897))))

(declare-fun b!245731 () Bool)

(assert (=> b!245731 (= e!159412 (not e!159418))))

(declare-fun res!120512 () Bool)

(assert (=> b!245731 (=> res!120512 e!159418)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!245731 (= res!120512 (not (validMask!0 (mask!10661 thiss!1504))))))

(declare-fun lt!123058 () array!12147)

(declare-fun arrayCountValidKeys!0 (array!12147 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245731 (= (arrayCountValidKeys!0 lt!123058 #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6662 thiss!1504) #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504)))))))

(declare-fun lt!123059 () Unit!7585)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12147 (_ BitVec 32) (_ BitVec 64)) Unit!7585)

(assert (=> b!245731 (= lt!123059 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6662 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3673 0))(
  ( (Nil!3670) (Cons!3669 (h!4326 (_ BitVec 64)) (t!8688 List!3673)) )
))
(declare-fun arrayNoDuplicates!0 (array!12147 (_ BitVec 32) List!3673) Bool)

(assert (=> b!245731 (arrayNoDuplicates!0 lt!123058 #b00000000000000000000000000000000 Nil!3670)))

(assert (=> b!245731 (= lt!123058 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun lt!123055 () Unit!7585)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12147 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3673) Unit!7585)

(assert (=> b!245731 (= lt!123055 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6662 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3670))))

(declare-fun lt!123060 () Unit!7585)

(declare-fun e!159417 () Unit!7585)

(assert (=> b!245731 (= lt!123060 e!159417)))

(declare-fun c!41044 () Bool)

(assert (=> b!245731 (= c!41044 (arrayContainsKey!0 (_keys!6662 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245732 () Bool)

(assert (=> b!245732 (= e!159413 tp_is_empty!6423)))

(declare-fun b!245733 () Bool)

(declare-fun c!41043 () Bool)

(assert (=> b!245733 (= c!41043 ((_ is MissingVacant!1091) lt!123061))))

(assert (=> b!245733 (= e!159424 e!159420)))

(declare-fun b!245734 () Bool)

(declare-fun Unit!7588 () Unit!7585)

(assert (=> b!245734 (= e!159417 Unit!7588)))

(declare-fun b!245735 () Bool)

(declare-fun Unit!7589 () Unit!7585)

(assert (=> b!245735 (= e!159417 Unit!7589)))

(declare-fun lt!123063 () Unit!7585)

(declare-fun lemmaArrayContainsKeyThenInListMap!175 (array!12147 array!12145 (_ BitVec 32) (_ BitVec 32) V!8211 V!8211 (_ BitVec 64) (_ BitVec 32) Int) Unit!7585)

(assert (=> b!245735 (= lt!123063 (lemmaArrayContainsKeyThenInListMap!175 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))))

(assert (=> b!245735 false))

(declare-fun res!120515 () Bool)

(assert (=> start!23368 (=> (not res!120515) (not e!159423))))

(declare-fun valid!1423 (LongMapFixedSize!3636) Bool)

(assert (=> start!23368 (= res!120515 (valid!1423 thiss!1504))))

(assert (=> start!23368 e!159423))

(assert (=> start!23368 e!159415))

(assert (=> start!23368 true))

(declare-fun b!245720 () Bool)

(assert (=> b!245720 (= e!159414 (not call!22951))))

(assert (= (and start!23368 res!120515) b!245729))

(assert (= (and b!245729 res!120516) b!245728))

(assert (= (and b!245728 res!120511) b!245725))

(assert (= (and b!245725 c!41042) b!245716))

(assert (= (and b!245725 (not c!41042)) b!245724))

(assert (= (and b!245724 c!41045) b!245726))

(assert (= (and b!245724 (not c!41045)) b!245733))

(assert (= (and b!245726 res!120508) b!245722))

(assert (= (and b!245722 res!120514) b!245719))

(assert (= (and b!245733 c!41043) b!245717))

(assert (= (and b!245733 (not c!41043)) b!245715))

(assert (= (and b!245717 res!120509) b!245721))

(assert (= (and b!245721 res!120510) b!245720))

(assert (= (or b!245726 b!245717) bm!22948))

(assert (= (or b!245719 b!245720) bm!22947))

(assert (= (and b!245725 res!120513) b!245731))

(assert (= (and b!245731 c!41044) b!245735))

(assert (= (and b!245731 (not c!41044)) b!245734))

(assert (= (and b!245731 (not res!120512)) b!245730))

(assert (= (and b!245723 condMapEmpty!10897) mapIsEmpty!10897))

(assert (= (and b!245723 (not condMapEmpty!10897)) mapNonEmpty!10897))

(assert (= (and mapNonEmpty!10897 ((_ is ValueCellFull!2868) mapValue!10897)) b!245732))

(assert (= (and b!245723 ((_ is ValueCellFull!2868) mapDefault!10897)) b!245718))

(assert (= b!245727 b!245723))

(assert (= start!23368 b!245727))

(declare-fun m!263217 () Bool)

(assert (=> bm!22947 m!263217))

(declare-fun m!263219 () Bool)

(assert (=> b!245735 m!263219))

(declare-fun m!263221 () Bool)

(assert (=> start!23368 m!263221))

(declare-fun m!263223 () Bool)

(assert (=> b!245721 m!263223))

(declare-fun m!263225 () Bool)

(assert (=> bm!22948 m!263225))

(declare-fun m!263227 () Bool)

(assert (=> mapNonEmpty!10897 m!263227))

(declare-fun m!263229 () Bool)

(assert (=> b!245716 m!263229))

(declare-fun m!263231 () Bool)

(assert (=> b!245724 m!263231))

(declare-fun m!263233 () Bool)

(assert (=> b!245725 m!263233))

(declare-fun m!263235 () Bool)

(assert (=> b!245725 m!263235))

(assert (=> b!245725 m!263235))

(declare-fun m!263237 () Bool)

(assert (=> b!245725 m!263237))

(declare-fun m!263239 () Bool)

(assert (=> b!245727 m!263239))

(declare-fun m!263241 () Bool)

(assert (=> b!245727 m!263241))

(declare-fun m!263243 () Bool)

(assert (=> b!245722 m!263243))

(assert (=> b!245731 m!263217))

(declare-fun m!263245 () Bool)

(assert (=> b!245731 m!263245))

(declare-fun m!263247 () Bool)

(assert (=> b!245731 m!263247))

(declare-fun m!263249 () Bool)

(assert (=> b!245731 m!263249))

(declare-fun m!263251 () Bool)

(assert (=> b!245731 m!263251))

(declare-fun m!263253 () Bool)

(assert (=> b!245731 m!263253))

(declare-fun m!263255 () Bool)

(assert (=> b!245731 m!263255))

(declare-fun m!263257 () Bool)

(assert (=> b!245731 m!263257))

(declare-fun m!263259 () Bool)

(assert (=> b!245728 m!263259))

(check-sat (not start!23368) (not b!245731) tp_is_empty!6423 (not b_next!6561) (not b!245735) b_and!13551 (not b!245725) (not bm!22947) (not mapNonEmpty!10897) (not b!245727) (not b!245724) (not b!245728) (not b!245716) (not bm!22948))
(check-sat b_and!13551 (not b_next!6561))
(get-model)

(declare-fun d!60219 () Bool)

(declare-fun e!159474 () Bool)

(assert (=> d!60219 e!159474))

(declare-fun res!120548 () Bool)

(assert (=> d!60219 (=> (not res!120548) (not e!159474))))

(declare-fun lt!123096 () SeekEntryResult!1091)

(assert (=> d!60219 (= res!120548 ((_ is Found!1091) lt!123096))))

(assert (=> d!60219 (= lt!123096 (seekEntryOrOpen!0 key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(declare-fun lt!123095 () Unit!7585)

(declare-fun choose!1149 (array!12147 array!12145 (_ BitVec 32) (_ BitVec 32) V!8211 V!8211 (_ BitVec 64) Int) Unit!7585)

(assert (=> d!60219 (= lt!123095 (choose!1149 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 (defaultEntry!4547 thiss!1504)))))

(assert (=> d!60219 (validMask!0 (mask!10661 thiss!1504))))

(assert (=> d!60219 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!373 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 (defaultEntry!4547 thiss!1504)) lt!123095)))

(declare-fun b!245803 () Bool)

(declare-fun res!120549 () Bool)

(assert (=> b!245803 (=> (not res!120549) (not e!159474))))

(assert (=> b!245803 (= res!120549 (inRange!0 (index!6535 lt!123096) (mask!10661 thiss!1504)))))

(declare-fun b!245804 () Bool)

(assert (=> b!245804 (= e!159474 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6535 lt!123096)) key!932))))

(assert (=> b!245804 (and (bvsge (index!6535 lt!123096) #b00000000000000000000000000000000) (bvslt (index!6535 lt!123096) (size!6107 (_keys!6662 thiss!1504))))))

(assert (= (and d!60219 res!120548) b!245803))

(assert (= (and b!245803 res!120549) b!245804))

(assert (=> d!60219 m!263259))

(declare-fun m!263305 () Bool)

(assert (=> d!60219 m!263305))

(assert (=> d!60219 m!263257))

(declare-fun m!263307 () Bool)

(assert (=> b!245803 m!263307))

(declare-fun m!263309 () Bool)

(assert (=> b!245804 m!263309))

(assert (=> b!245716 d!60219))

(declare-fun d!60221 () Bool)

(assert (=> d!60221 (= (inRange!0 index!297 (mask!10661 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10661 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!245725 d!60221))

(declare-fun d!60223 () Bool)

(declare-fun e!159479 () Bool)

(assert (=> d!60223 e!159479))

(declare-fun res!120552 () Bool)

(assert (=> d!60223 (=> res!120552 e!159479)))

(declare-fun lt!123108 () Bool)

(assert (=> d!60223 (= res!120552 (not lt!123108))))

(declare-fun lt!123106 () Bool)

(assert (=> d!60223 (= lt!123108 lt!123106)))

(declare-fun lt!123105 () Unit!7585)

(declare-fun e!159480 () Unit!7585)

(assert (=> d!60223 (= lt!123105 e!159480)))

(declare-fun c!41060 () Bool)

(assert (=> d!60223 (= c!41060 lt!123106)))

(declare-fun containsKey!281 (List!3672 (_ BitVec 64)) Bool)

(assert (=> d!60223 (= lt!123106 (containsKey!281 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932))))

(assert (=> d!60223 (= (contains!1776 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)) key!932) lt!123108)))

(declare-fun b!245811 () Bool)

(declare-fun lt!123107 () Unit!7585)

(assert (=> b!245811 (= e!159480 lt!123107)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!229 (List!3672 (_ BitVec 64)) Unit!7585)

(assert (=> b!245811 (= lt!123107 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932))))

(declare-datatypes ((Option!295 0))(
  ( (Some!294 (v!5311 V!8211)) (None!293) )
))
(declare-fun isDefined!230 (Option!295) Bool)

(declare-fun getValueByKey!289 (List!3672 (_ BitVec 64)) Option!295)

(assert (=> b!245811 (isDefined!230 (getValueByKey!289 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932))))

(declare-fun b!245812 () Bool)

(declare-fun Unit!7595 () Unit!7585)

(assert (=> b!245812 (= e!159480 Unit!7595)))

(declare-fun b!245813 () Bool)

(assert (=> b!245813 (= e!159479 (isDefined!230 (getValueByKey!289 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932)))))

(assert (= (and d!60223 c!41060) b!245811))

(assert (= (and d!60223 (not c!41060)) b!245812))

(assert (= (and d!60223 (not res!120552)) b!245813))

(declare-fun m!263311 () Bool)

(assert (=> d!60223 m!263311))

(declare-fun m!263313 () Bool)

(assert (=> b!245811 m!263313))

(declare-fun m!263315 () Bool)

(assert (=> b!245811 m!263315))

(assert (=> b!245811 m!263315))

(declare-fun m!263317 () Bool)

(assert (=> b!245811 m!263317))

(assert (=> b!245813 m!263315))

(assert (=> b!245813 m!263315))

(assert (=> b!245813 m!263317))

(assert (=> b!245725 d!60223))

(declare-fun bm!22969 () Bool)

(declare-fun call!22978 () ListLongMap!3703)

(declare-fun call!22972 () ListLongMap!3703)

(assert (=> bm!22969 (= call!22978 call!22972)))

(declare-fun b!245856 () Bool)

(declare-fun e!159509 () ListLongMap!3703)

(declare-fun call!22975 () ListLongMap!3703)

(assert (=> b!245856 (= e!159509 call!22975)))

(declare-fun b!245857 () Bool)

(declare-fun res!120578 () Bool)

(declare-fun e!159510 () Bool)

(assert (=> b!245857 (=> (not res!120578) (not e!159510))))

(declare-fun e!159507 () Bool)

(assert (=> b!245857 (= res!120578 e!159507)))

(declare-fun res!120575 () Bool)

(assert (=> b!245857 (=> res!120575 e!159507)))

(declare-fun e!159517 () Bool)

(assert (=> b!245857 (= res!120575 (not e!159517))))

(declare-fun res!120579 () Bool)

(assert (=> b!245857 (=> (not res!120579) (not e!159517))))

(assert (=> b!245857 (= res!120579 (bvslt #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!245858 () Bool)

(declare-fun e!159518 () Bool)

(declare-fun call!22977 () Bool)

(assert (=> b!245858 (= e!159518 (not call!22977))))

(declare-fun b!245859 () Bool)

(assert (=> b!245859 (= e!159510 e!159518)))

(declare-fun c!41074 () Bool)

(assert (=> b!245859 (= c!41074 (not (= (bvand (extraKeys!4284 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22970 () Bool)

(declare-fun call!22974 () ListLongMap!3703)

(declare-fun getCurrentListMapNoExtraKeys!553 (array!12147 array!12145 (_ BitVec 32) (_ BitVec 32) V!8211 V!8211 (_ BitVec 32) Int) ListLongMap!3703)

(assert (=> bm!22970 (= call!22974 (getCurrentListMapNoExtraKeys!553 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))))

(declare-fun bm!22971 () Bool)

(declare-fun call!22976 () Bool)

(declare-fun lt!123158 () ListLongMap!3703)

(assert (=> bm!22971 (= call!22976 (contains!1776 lt!123158 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245861 () Bool)

(declare-fun e!159508 () ListLongMap!3703)

(declare-fun call!22973 () ListLongMap!3703)

(declare-fun +!658 (ListLongMap!3703 tuple2!4790) ListLongMap!3703)

(assert (=> b!245861 (= e!159508 (+!658 call!22973 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))))))

(declare-fun b!245862 () Bool)

(declare-fun e!159519 () Unit!7585)

(declare-fun lt!123167 () Unit!7585)

(assert (=> b!245862 (= e!159519 lt!123167)))

(declare-fun lt!123155 () ListLongMap!3703)

(assert (=> b!245862 (= lt!123155 (getCurrentListMapNoExtraKeys!553 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))))

(declare-fun lt!123159 () (_ BitVec 64))

(assert (=> b!245862 (= lt!123159 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123165 () (_ BitVec 64))

(assert (=> b!245862 (= lt!123165 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123174 () Unit!7585)

(declare-fun addStillContains!207 (ListLongMap!3703 (_ BitVec 64) V!8211 (_ BitVec 64)) Unit!7585)

(assert (=> b!245862 (= lt!123174 (addStillContains!207 lt!123155 lt!123159 (zeroValue!4388 thiss!1504) lt!123165))))

(assert (=> b!245862 (contains!1776 (+!658 lt!123155 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504))) lt!123165)))

(declare-fun lt!123172 () Unit!7585)

(assert (=> b!245862 (= lt!123172 lt!123174)))

(declare-fun lt!123171 () ListLongMap!3703)

(assert (=> b!245862 (= lt!123171 (getCurrentListMapNoExtraKeys!553 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))))

(declare-fun lt!123162 () (_ BitVec 64))

(assert (=> b!245862 (= lt!123162 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123156 () (_ BitVec 64))

(assert (=> b!245862 (= lt!123156 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123154 () Unit!7585)

(declare-fun addApplyDifferent!207 (ListLongMap!3703 (_ BitVec 64) V!8211 (_ BitVec 64)) Unit!7585)

(assert (=> b!245862 (= lt!123154 (addApplyDifferent!207 lt!123171 lt!123162 (minValue!4388 thiss!1504) lt!123156))))

(declare-fun apply!231 (ListLongMap!3703 (_ BitVec 64)) V!8211)

(assert (=> b!245862 (= (apply!231 (+!658 lt!123171 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504))) lt!123156) (apply!231 lt!123171 lt!123156))))

(declare-fun lt!123164 () Unit!7585)

(assert (=> b!245862 (= lt!123164 lt!123154)))

(declare-fun lt!123157 () ListLongMap!3703)

(assert (=> b!245862 (= lt!123157 (getCurrentListMapNoExtraKeys!553 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))))

(declare-fun lt!123168 () (_ BitVec 64))

(assert (=> b!245862 (= lt!123168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123161 () (_ BitVec 64))

(assert (=> b!245862 (= lt!123161 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123163 () Unit!7585)

(assert (=> b!245862 (= lt!123163 (addApplyDifferent!207 lt!123157 lt!123168 (zeroValue!4388 thiss!1504) lt!123161))))

(assert (=> b!245862 (= (apply!231 (+!658 lt!123157 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504))) lt!123161) (apply!231 lt!123157 lt!123161))))

(declare-fun lt!123160 () Unit!7585)

(assert (=> b!245862 (= lt!123160 lt!123163)))

(declare-fun lt!123173 () ListLongMap!3703)

(assert (=> b!245862 (= lt!123173 (getCurrentListMapNoExtraKeys!553 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))))

(declare-fun lt!123153 () (_ BitVec 64))

(assert (=> b!245862 (= lt!123153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123170 () (_ BitVec 64))

(assert (=> b!245862 (= lt!123170 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245862 (= lt!123167 (addApplyDifferent!207 lt!123173 lt!123153 (minValue!4388 thiss!1504) lt!123170))))

(assert (=> b!245862 (= (apply!231 (+!658 lt!123173 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504))) lt!123170) (apply!231 lt!123173 lt!123170))))

(declare-fun c!41077 () Bool)

(declare-fun c!41073 () Bool)

(declare-fun bm!22972 () Bool)

(assert (=> bm!22972 (= call!22973 (+!658 (ite c!41077 call!22974 (ite c!41073 call!22972 call!22978)) (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))))))

(declare-fun b!245863 () Bool)

(declare-fun e!159514 () ListLongMap!3703)

(assert (=> b!245863 (= e!159514 call!22978)))

(declare-fun bm!22973 () Bool)

(assert (=> bm!22973 (= call!22972 call!22974)))

(declare-fun b!245864 () Bool)

(declare-fun e!159511 () Bool)

(declare-fun get!2957 (ValueCell!2868 V!8211) V!8211)

(declare-fun dynLambda!574 (Int (_ BitVec 64)) V!8211)

(assert (=> b!245864 (= e!159511 (= (apply!231 lt!123158 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)) (get!2957 (select (arr!5764 (_values!4530 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4547 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245864 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6106 (_values!4530 thiss!1504))))))

(assert (=> b!245864 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!245865 () Bool)

(assert (=> b!245865 (= e!159507 e!159511)))

(declare-fun res!120577 () Bool)

(assert (=> b!245865 (=> (not res!120577) (not e!159511))))

(assert (=> b!245865 (= res!120577 (contains!1776 lt!123158 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!245865 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!245866 () Bool)

(declare-fun e!159515 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!245866 (= e!159515 (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22974 () Bool)

(assert (=> bm!22974 (= call!22975 call!22973)))

(declare-fun b!245867 () Bool)

(declare-fun res!120572 () Bool)

(assert (=> b!245867 (=> (not res!120572) (not e!159510))))

(declare-fun e!159513 () Bool)

(assert (=> b!245867 (= res!120572 e!159513)))

(declare-fun c!41075 () Bool)

(assert (=> b!245867 (= c!41075 (not (= (bvand (extraKeys!4284 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!245868 () Bool)

(assert (=> b!245868 (= e!159508 e!159509)))

(assert (=> b!245868 (= c!41073 (and (not (= (bvand (extraKeys!4284 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4284 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245869 () Bool)

(declare-fun e!159512 () Bool)

(assert (=> b!245869 (= e!159513 e!159512)))

(declare-fun res!120571 () Bool)

(assert (=> b!245869 (= res!120571 call!22976)))

(assert (=> b!245869 (=> (not res!120571) (not e!159512))))

(declare-fun b!245870 () Bool)

(assert (=> b!245870 (= e!159512 (= (apply!231 lt!123158 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4388 thiss!1504)))))

(declare-fun b!245871 () Bool)

(assert (=> b!245871 (= e!159513 (not call!22976))))

(declare-fun b!245860 () Bool)

(declare-fun Unit!7596 () Unit!7585)

(assert (=> b!245860 (= e!159519 Unit!7596)))

(declare-fun d!60225 () Bool)

(assert (=> d!60225 e!159510))

(declare-fun res!120576 () Bool)

(assert (=> d!60225 (=> (not res!120576) (not e!159510))))

(assert (=> d!60225 (= res!120576 (or (bvsge #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))))

(declare-fun lt!123166 () ListLongMap!3703)

(assert (=> d!60225 (= lt!123158 lt!123166)))

(declare-fun lt!123169 () Unit!7585)

(assert (=> d!60225 (= lt!123169 e!159519)))

(declare-fun c!41078 () Bool)

(assert (=> d!60225 (= c!41078 e!159515)))

(declare-fun res!120573 () Bool)

(assert (=> d!60225 (=> (not res!120573) (not e!159515))))

(assert (=> d!60225 (= res!120573 (bvslt #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60225 (= lt!123166 e!159508)))

(assert (=> d!60225 (= c!41077 (and (not (= (bvand (extraKeys!4284 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4284 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60225 (validMask!0 (mask!10661 thiss!1504))))

(assert (=> d!60225 (= (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)) lt!123158)))

(declare-fun b!245872 () Bool)

(declare-fun e!159516 () Bool)

(assert (=> b!245872 (= e!159518 e!159516)))

(declare-fun res!120574 () Bool)

(assert (=> b!245872 (= res!120574 call!22977)))

(assert (=> b!245872 (=> (not res!120574) (not e!159516))))

(declare-fun b!245873 () Bool)

(declare-fun c!41076 () Bool)

(assert (=> b!245873 (= c!41076 (and (not (= (bvand (extraKeys!4284 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4284 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!245873 (= e!159509 e!159514)))

(declare-fun bm!22975 () Bool)

(assert (=> bm!22975 (= call!22977 (contains!1776 lt!123158 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245874 () Bool)

(assert (=> b!245874 (= e!159514 call!22975)))

(declare-fun b!245875 () Bool)

(assert (=> b!245875 (= e!159516 (= (apply!231 lt!123158 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4388 thiss!1504)))))

(declare-fun b!245876 () Bool)

(assert (=> b!245876 (= e!159517 (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60225 c!41077) b!245861))

(assert (= (and d!60225 (not c!41077)) b!245868))

(assert (= (and b!245868 c!41073) b!245856))

(assert (= (and b!245868 (not c!41073)) b!245873))

(assert (= (and b!245873 c!41076) b!245874))

(assert (= (and b!245873 (not c!41076)) b!245863))

(assert (= (or b!245874 b!245863) bm!22969))

(assert (= (or b!245856 bm!22969) bm!22973))

(assert (= (or b!245856 b!245874) bm!22974))

(assert (= (or b!245861 bm!22973) bm!22970))

(assert (= (or b!245861 bm!22974) bm!22972))

(assert (= (and d!60225 res!120573) b!245866))

(assert (= (and d!60225 c!41078) b!245862))

(assert (= (and d!60225 (not c!41078)) b!245860))

(assert (= (and d!60225 res!120576) b!245857))

(assert (= (and b!245857 res!120579) b!245876))

(assert (= (and b!245857 (not res!120575)) b!245865))

(assert (= (and b!245865 res!120577) b!245864))

(assert (= (and b!245857 res!120578) b!245867))

(assert (= (and b!245867 c!41075) b!245869))

(assert (= (and b!245867 (not c!41075)) b!245871))

(assert (= (and b!245869 res!120571) b!245870))

(assert (= (or b!245869 b!245871) bm!22971))

(assert (= (and b!245867 res!120572) b!245859))

(assert (= (and b!245859 c!41074) b!245872))

(assert (= (and b!245859 (not c!41074)) b!245858))

(assert (= (and b!245872 res!120574) b!245875))

(assert (= (or b!245872 b!245858) bm!22975))

(declare-fun b_lambda!8027 () Bool)

(assert (=> (not b_lambda!8027) (not b!245864)))

(declare-fun t!8692 () Bool)

(declare-fun tb!2975 () Bool)

(assert (=> (and b!245727 (= (defaultEntry!4547 thiss!1504) (defaultEntry!4547 thiss!1504)) t!8692) tb!2975))

(declare-fun result!5247 () Bool)

(assert (=> tb!2975 (= result!5247 tp_is_empty!6423)))

(assert (=> b!245864 t!8692))

(declare-fun b_and!13555 () Bool)

(assert (= b_and!13551 (and (=> t!8692 result!5247) b_and!13555)))

(declare-fun m!263319 () Bool)

(assert (=> b!245876 m!263319))

(assert (=> b!245876 m!263319))

(declare-fun m!263321 () Bool)

(assert (=> b!245876 m!263321))

(declare-fun m!263323 () Bool)

(assert (=> b!245875 m!263323))

(declare-fun m!263325 () Bool)

(assert (=> bm!22972 m!263325))

(assert (=> d!60225 m!263257))

(assert (=> b!245866 m!263319))

(assert (=> b!245866 m!263319))

(assert (=> b!245866 m!263321))

(declare-fun m!263327 () Bool)

(assert (=> b!245870 m!263327))

(declare-fun m!263329 () Bool)

(assert (=> bm!22975 m!263329))

(assert (=> b!245865 m!263319))

(assert (=> b!245865 m!263319))

(declare-fun m!263331 () Bool)

(assert (=> b!245865 m!263331))

(declare-fun m!263333 () Bool)

(assert (=> b!245864 m!263333))

(declare-fun m!263335 () Bool)

(assert (=> b!245864 m!263335))

(assert (=> b!245864 m!263333))

(declare-fun m!263337 () Bool)

(assert (=> b!245864 m!263337))

(assert (=> b!245864 m!263319))

(declare-fun m!263339 () Bool)

(assert (=> b!245864 m!263339))

(assert (=> b!245864 m!263335))

(assert (=> b!245864 m!263319))

(declare-fun m!263341 () Bool)

(assert (=> b!245861 m!263341))

(declare-fun m!263343 () Bool)

(assert (=> bm!22971 m!263343))

(declare-fun m!263345 () Bool)

(assert (=> bm!22970 m!263345))

(declare-fun m!263347 () Bool)

(assert (=> b!245862 m!263347))

(declare-fun m!263349 () Bool)

(assert (=> b!245862 m!263349))

(declare-fun m!263351 () Bool)

(assert (=> b!245862 m!263351))

(declare-fun m!263353 () Bool)

(assert (=> b!245862 m!263353))

(declare-fun m!263355 () Bool)

(assert (=> b!245862 m!263355))

(assert (=> b!245862 m!263345))

(declare-fun m!263357 () Bool)

(assert (=> b!245862 m!263357))

(assert (=> b!245862 m!263357))

(declare-fun m!263359 () Bool)

(assert (=> b!245862 m!263359))

(assert (=> b!245862 m!263319))

(declare-fun m!263361 () Bool)

(assert (=> b!245862 m!263361))

(assert (=> b!245862 m!263353))

(declare-fun m!263363 () Bool)

(assert (=> b!245862 m!263363))

(declare-fun m!263365 () Bool)

(assert (=> b!245862 m!263365))

(declare-fun m!263367 () Bool)

(assert (=> b!245862 m!263367))

(declare-fun m!263369 () Bool)

(assert (=> b!245862 m!263369))

(declare-fun m!263371 () Bool)

(assert (=> b!245862 m!263371))

(assert (=> b!245862 m!263349))

(declare-fun m!263373 () Bool)

(assert (=> b!245862 m!263373))

(assert (=> b!245862 m!263371))

(declare-fun m!263375 () Bool)

(assert (=> b!245862 m!263375))

(assert (=> b!245725 d!60225))

(declare-fun d!60227 () Bool)

(assert (=> d!60227 (= (inRange!0 (ite c!41045 (index!6534 lt!123061) (index!6537 lt!123061)) (mask!10661 thiss!1504)) (and (bvsge (ite c!41045 (index!6534 lt!123061) (index!6537 lt!123061)) #b00000000000000000000000000000000) (bvslt (ite c!41045 (index!6534 lt!123061) (index!6537 lt!123061)) (bvadd (mask!10661 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22948 d!60227))

(declare-fun d!60229 () Bool)

(declare-fun lt!123183 () SeekEntryResult!1091)

(assert (=> d!60229 (and (or ((_ is Undefined!1091) lt!123183) (not ((_ is Found!1091) lt!123183)) (and (bvsge (index!6535 lt!123183) #b00000000000000000000000000000000) (bvslt (index!6535 lt!123183) (size!6107 (_keys!6662 thiss!1504))))) (or ((_ is Undefined!1091) lt!123183) ((_ is Found!1091) lt!123183) (not ((_ is MissingZero!1091) lt!123183)) (and (bvsge (index!6534 lt!123183) #b00000000000000000000000000000000) (bvslt (index!6534 lt!123183) (size!6107 (_keys!6662 thiss!1504))))) (or ((_ is Undefined!1091) lt!123183) ((_ is Found!1091) lt!123183) ((_ is MissingZero!1091) lt!123183) (not ((_ is MissingVacant!1091) lt!123183)) (and (bvsge (index!6537 lt!123183) #b00000000000000000000000000000000) (bvslt (index!6537 lt!123183) (size!6107 (_keys!6662 thiss!1504))))) (or ((_ is Undefined!1091) lt!123183) (ite ((_ is Found!1091) lt!123183) (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6535 lt!123183)) key!932) (ite ((_ is MissingZero!1091) lt!123183) (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6534 lt!123183)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1091) lt!123183) (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6537 lt!123183)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!159528 () SeekEntryResult!1091)

(assert (=> d!60229 (= lt!123183 e!159528)))

(declare-fun c!41085 () Bool)

(declare-fun lt!123181 () SeekEntryResult!1091)

(assert (=> d!60229 (= c!41085 (and ((_ is Intermediate!1091) lt!123181) (undefined!1903 lt!123181)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12147 (_ BitVec 32)) SeekEntryResult!1091)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60229 (= lt!123181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10661 thiss!1504)) key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(assert (=> d!60229 (validMask!0 (mask!10661 thiss!1504))))

(assert (=> d!60229 (= (seekEntryOrOpen!0 key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)) lt!123183)))

(declare-fun b!245891 () Bool)

(declare-fun e!159526 () SeekEntryResult!1091)

(assert (=> b!245891 (= e!159526 (Found!1091 (index!6536 lt!123181)))))

(declare-fun b!245892 () Bool)

(declare-fun c!41087 () Bool)

(declare-fun lt!123182 () (_ BitVec 64))

(assert (=> b!245892 (= c!41087 (= lt!123182 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159527 () SeekEntryResult!1091)

(assert (=> b!245892 (= e!159526 e!159527)))

(declare-fun b!245893 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12147 (_ BitVec 32)) SeekEntryResult!1091)

(assert (=> b!245893 (= e!159527 (seekKeyOrZeroReturnVacant!0 (x!24439 lt!123181) (index!6536 lt!123181) (index!6536 lt!123181) key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(declare-fun b!245894 () Bool)

(assert (=> b!245894 (= e!159527 (MissingZero!1091 (index!6536 lt!123181)))))

(declare-fun b!245895 () Bool)

(assert (=> b!245895 (= e!159528 e!159526)))

(assert (=> b!245895 (= lt!123182 (select (arr!5765 (_keys!6662 thiss!1504)) (index!6536 lt!123181)))))

(declare-fun c!41086 () Bool)

(assert (=> b!245895 (= c!41086 (= lt!123182 key!932))))

(declare-fun b!245896 () Bool)

(assert (=> b!245896 (= e!159528 Undefined!1091)))

(assert (= (and d!60229 c!41085) b!245896))

(assert (= (and d!60229 (not c!41085)) b!245895))

(assert (= (and b!245895 c!41086) b!245891))

(assert (= (and b!245895 (not c!41086)) b!245892))

(assert (= (and b!245892 c!41087) b!245894))

(assert (= (and b!245892 (not c!41087)) b!245893))

(declare-fun m!263377 () Bool)

(assert (=> d!60229 m!263377))

(declare-fun m!263379 () Bool)

(assert (=> d!60229 m!263379))

(declare-fun m!263381 () Bool)

(assert (=> d!60229 m!263381))

(declare-fun m!263383 () Bool)

(assert (=> d!60229 m!263383))

(declare-fun m!263385 () Bool)

(assert (=> d!60229 m!263385))

(assert (=> d!60229 m!263257))

(assert (=> d!60229 m!263377))

(declare-fun m!263387 () Bool)

(assert (=> b!245893 m!263387))

(declare-fun m!263389 () Bool)

(assert (=> b!245895 m!263389))

(assert (=> b!245728 d!60229))

(declare-fun d!60231 () Bool)

(declare-fun res!120584 () Bool)

(declare-fun e!159533 () Bool)

(assert (=> d!60231 (=> res!120584 e!159533)))

(assert (=> d!60231 (= res!120584 (= (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60231 (= (arrayContainsKey!0 (_keys!6662 thiss!1504) key!932 #b00000000000000000000000000000000) e!159533)))

(declare-fun b!245901 () Bool)

(declare-fun e!159534 () Bool)

(assert (=> b!245901 (= e!159533 e!159534)))

(declare-fun res!120585 () Bool)

(assert (=> b!245901 (=> (not res!120585) (not e!159534))))

(assert (=> b!245901 (= res!120585 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!245902 () Bool)

(assert (=> b!245902 (= e!159534 (arrayContainsKey!0 (_keys!6662 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60231 (not res!120584)) b!245901))

(assert (= (and b!245901 res!120585) b!245902))

(assert (=> d!60231 m!263319))

(declare-fun m!263391 () Bool)

(assert (=> b!245902 m!263391))

(assert (=> bm!22947 d!60231))

(declare-fun call!22983 () Bool)

(declare-fun lt!123188 () SeekEntryResult!1091)

(declare-fun bm!22980 () Bool)

(declare-fun c!41093 () Bool)

(assert (=> bm!22980 (= call!22983 (inRange!0 (ite c!41093 (index!6534 lt!123188) (index!6537 lt!123188)) (mask!10661 thiss!1504)))))

(declare-fun b!245919 () Bool)

(assert (=> b!245919 (and (bvsge (index!6534 lt!123188) #b00000000000000000000000000000000) (bvslt (index!6534 lt!123188) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun res!120594 () Bool)

(assert (=> b!245919 (= res!120594 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6534 lt!123188)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159545 () Bool)

(assert (=> b!245919 (=> (not res!120594) (not e!159545))))

(declare-fun b!245920 () Bool)

(declare-fun e!159543 () Bool)

(assert (=> b!245920 (= e!159543 e!159545)))

(declare-fun res!120597 () Bool)

(assert (=> b!245920 (= res!120597 call!22983)))

(assert (=> b!245920 (=> (not res!120597) (not e!159545))))

(declare-fun b!245921 () Bool)

(declare-fun e!159546 () Bool)

(declare-fun call!22984 () Bool)

(assert (=> b!245921 (= e!159546 (not call!22984))))

(declare-fun b!245922 () Bool)

(declare-fun e!159544 () Bool)

(assert (=> b!245922 (= e!159544 ((_ is Undefined!1091) lt!123188))))

(declare-fun b!245923 () Bool)

(assert (=> b!245923 (= e!159545 (not call!22984))))

(declare-fun b!245925 () Bool)

(assert (=> b!245925 (= e!159543 e!159544)))

(declare-fun c!41092 () Bool)

(assert (=> b!245925 (= c!41092 ((_ is MissingVacant!1091) lt!123188))))

(declare-fun bm!22981 () Bool)

(assert (=> bm!22981 (= call!22984 (arrayContainsKey!0 (_keys!6662 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245926 () Bool)

(declare-fun res!120595 () Bool)

(assert (=> b!245926 (=> (not res!120595) (not e!159546))))

(assert (=> b!245926 (= res!120595 call!22983)))

(assert (=> b!245926 (= e!159544 e!159546)))

(declare-fun b!245924 () Bool)

(declare-fun res!120596 () Bool)

(assert (=> b!245924 (=> (not res!120596) (not e!159546))))

(assert (=> b!245924 (= res!120596 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6537 lt!123188)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245924 (and (bvsge (index!6537 lt!123188) #b00000000000000000000000000000000) (bvslt (index!6537 lt!123188) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun d!60233 () Bool)

(assert (=> d!60233 e!159543))

(assert (=> d!60233 (= c!41093 ((_ is MissingZero!1091) lt!123188))))

(assert (=> d!60233 (= lt!123188 (seekEntryOrOpen!0 key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(declare-fun lt!123189 () Unit!7585)

(declare-fun choose!1150 (array!12147 array!12145 (_ BitVec 32) (_ BitVec 32) V!8211 V!8211 (_ BitVec 64) Int) Unit!7585)

(assert (=> d!60233 (= lt!123189 (choose!1150 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 (defaultEntry!4547 thiss!1504)))))

(assert (=> d!60233 (validMask!0 (mask!10661 thiss!1504))))

(assert (=> d!60233 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!378 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 (defaultEntry!4547 thiss!1504)) lt!123189)))

(assert (= (and d!60233 c!41093) b!245920))

(assert (= (and d!60233 (not c!41093)) b!245925))

(assert (= (and b!245920 res!120597) b!245919))

(assert (= (and b!245919 res!120594) b!245923))

(assert (= (and b!245925 c!41092) b!245926))

(assert (= (and b!245925 (not c!41092)) b!245922))

(assert (= (and b!245926 res!120595) b!245924))

(assert (= (and b!245924 res!120596) b!245921))

(assert (= (or b!245920 b!245926) bm!22980))

(assert (= (or b!245923 b!245921) bm!22981))

(assert (=> bm!22981 m!263217))

(declare-fun m!263393 () Bool)

(assert (=> bm!22980 m!263393))

(assert (=> d!60233 m!263259))

(declare-fun m!263395 () Bool)

(assert (=> d!60233 m!263395))

(assert (=> d!60233 m!263257))

(declare-fun m!263397 () Bool)

(assert (=> b!245924 m!263397))

(declare-fun m!263399 () Bool)

(assert (=> b!245919 m!263399))

(assert (=> b!245724 d!60233))

(declare-fun b!245935 () Bool)

(declare-fun res!120609 () Bool)

(declare-fun e!159551 () Bool)

(assert (=> b!245935 (=> (not res!120609) (not e!159551))))

(assert (=> b!245935 (= res!120609 (not (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) index!297))))))

(declare-fun b!245936 () Bool)

(declare-fun res!120607 () Bool)

(assert (=> b!245936 (=> (not res!120607) (not e!159551))))

(assert (=> b!245936 (= res!120607 (validKeyInArray!0 key!932))))

(declare-fun b!245937 () Bool)

(assert (=> b!245937 (= e!159551 (bvslt (size!6107 (_keys!6662 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun e!159552 () Bool)

(declare-fun b!245938 () Bool)

(assert (=> b!245938 (= e!159552 (= (arrayCountValidKeys!0 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))) #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6662 thiss!1504) #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!60235 () Bool)

(assert (=> d!60235 e!159552))

(declare-fun res!120608 () Bool)

(assert (=> d!60235 (=> (not res!120608) (not e!159552))))

(assert (=> d!60235 (= res!120608 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6107 (_keys!6662 thiss!1504)))))))

(declare-fun lt!123192 () Unit!7585)

(declare-fun choose!1 (array!12147 (_ BitVec 32) (_ BitVec 64)) Unit!7585)

(assert (=> d!60235 (= lt!123192 (choose!1 (_keys!6662 thiss!1504) index!297 key!932))))

(assert (=> d!60235 e!159551))

(declare-fun res!120606 () Bool)

(assert (=> d!60235 (=> (not res!120606) (not e!159551))))

(assert (=> d!60235 (= res!120606 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6107 (_keys!6662 thiss!1504)))))))

(assert (=> d!60235 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6662 thiss!1504) index!297 key!932) lt!123192)))

(assert (= (and d!60235 res!120606) b!245935))

(assert (= (and b!245935 res!120609) b!245936))

(assert (= (and b!245936 res!120607) b!245937))

(assert (= (and d!60235 res!120608) b!245938))

(declare-fun m!263401 () Bool)

(assert (=> b!245935 m!263401))

(assert (=> b!245935 m!263401))

(declare-fun m!263403 () Bool)

(assert (=> b!245935 m!263403))

(declare-fun m!263405 () Bool)

(assert (=> b!245936 m!263405))

(assert (=> b!245938 m!263249))

(declare-fun m!263407 () Bool)

(assert (=> b!245938 m!263407))

(assert (=> b!245938 m!263251))

(declare-fun m!263409 () Bool)

(assert (=> d!60235 m!263409))

(assert (=> b!245731 d!60235))

(assert (=> b!245731 d!60231))

(declare-fun bm!22984 () Bool)

(declare-fun call!22987 () (_ BitVec 32))

(assert (=> bm!22984 (= call!22987 (arrayCountValidKeys!0 (_keys!6662 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!245947 () Bool)

(declare-fun e!159558 () (_ BitVec 32))

(assert (=> b!245947 (= e!159558 call!22987)))

(declare-fun b!245949 () Bool)

(assert (=> b!245949 (= e!159558 (bvadd #b00000000000000000000000000000001 call!22987))))

(declare-fun b!245950 () Bool)

(declare-fun e!159557 () (_ BitVec 32))

(assert (=> b!245950 (= e!159557 e!159558)))

(declare-fun c!41098 () Bool)

(assert (=> b!245950 (= c!41098 (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60237 () Bool)

(declare-fun lt!123195 () (_ BitVec 32))

(assert (=> d!60237 (and (bvsge lt!123195 #b00000000000000000000000000000000) (bvsle lt!123195 (bvsub (size!6107 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60237 (= lt!123195 e!159557)))

(declare-fun c!41099 () Bool)

(assert (=> d!60237 (= c!41099 (bvsge #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60237 (and (bvsle #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6107 (_keys!6662 thiss!1504)) (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60237 (= (arrayCountValidKeys!0 (_keys!6662 thiss!1504) #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) lt!123195)))

(declare-fun b!245948 () Bool)

(assert (=> b!245948 (= e!159557 #b00000000000000000000000000000000)))

(assert (= (and d!60237 c!41099) b!245948))

(assert (= (and d!60237 (not c!41099)) b!245950))

(assert (= (and b!245950 c!41098) b!245949))

(assert (= (and b!245950 (not c!41098)) b!245947))

(assert (= (or b!245949 b!245947) bm!22984))

(declare-fun m!263411 () Bool)

(assert (=> bm!22984 m!263411))

(assert (=> b!245950 m!263319))

(assert (=> b!245950 m!263319))

(assert (=> b!245950 m!263321))

(assert (=> b!245731 d!60237))

(declare-fun d!60239 () Bool)

(assert (=> d!60239 (= (validMask!0 (mask!10661 thiss!1504)) (and (or (= (mask!10661 thiss!1504) #b00000000000000000000000000000111) (= (mask!10661 thiss!1504) #b00000000000000000000000000001111) (= (mask!10661 thiss!1504) #b00000000000000000000000000011111) (= (mask!10661 thiss!1504) #b00000000000000000000000000111111) (= (mask!10661 thiss!1504) #b00000000000000000000000001111111) (= (mask!10661 thiss!1504) #b00000000000000000000000011111111) (= (mask!10661 thiss!1504) #b00000000000000000000000111111111) (= (mask!10661 thiss!1504) #b00000000000000000000001111111111) (= (mask!10661 thiss!1504) #b00000000000000000000011111111111) (= (mask!10661 thiss!1504) #b00000000000000000000111111111111) (= (mask!10661 thiss!1504) #b00000000000000000001111111111111) (= (mask!10661 thiss!1504) #b00000000000000000011111111111111) (= (mask!10661 thiss!1504) #b00000000000000000111111111111111) (= (mask!10661 thiss!1504) #b00000000000000001111111111111111) (= (mask!10661 thiss!1504) #b00000000000000011111111111111111) (= (mask!10661 thiss!1504) #b00000000000000111111111111111111) (= (mask!10661 thiss!1504) #b00000000000001111111111111111111) (= (mask!10661 thiss!1504) #b00000000000011111111111111111111) (= (mask!10661 thiss!1504) #b00000000000111111111111111111111) (= (mask!10661 thiss!1504) #b00000000001111111111111111111111) (= (mask!10661 thiss!1504) #b00000000011111111111111111111111) (= (mask!10661 thiss!1504) #b00000000111111111111111111111111) (= (mask!10661 thiss!1504) #b00000001111111111111111111111111) (= (mask!10661 thiss!1504) #b00000011111111111111111111111111) (= (mask!10661 thiss!1504) #b00000111111111111111111111111111) (= (mask!10661 thiss!1504) #b00001111111111111111111111111111) (= (mask!10661 thiss!1504) #b00011111111111111111111111111111) (= (mask!10661 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10661 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!245731 d!60239))

(declare-fun bm!22985 () Bool)

(declare-fun call!22988 () (_ BitVec 32))

(assert (=> bm!22985 (= call!22988 (arrayCountValidKeys!0 lt!123058 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!245951 () Bool)

(declare-fun e!159560 () (_ BitVec 32))

(assert (=> b!245951 (= e!159560 call!22988)))

(declare-fun b!245953 () Bool)

(assert (=> b!245953 (= e!159560 (bvadd #b00000000000000000000000000000001 call!22988))))

(declare-fun b!245954 () Bool)

(declare-fun e!159559 () (_ BitVec 32))

(assert (=> b!245954 (= e!159559 e!159560)))

(declare-fun c!41100 () Bool)

(assert (=> b!245954 (= c!41100 (validKeyInArray!0 (select (arr!5765 lt!123058) #b00000000000000000000000000000000)))))

(declare-fun d!60241 () Bool)

(declare-fun lt!123196 () (_ BitVec 32))

(assert (=> d!60241 (and (bvsge lt!123196 #b00000000000000000000000000000000) (bvsle lt!123196 (bvsub (size!6107 lt!123058) #b00000000000000000000000000000000)))))

(assert (=> d!60241 (= lt!123196 e!159559)))

(declare-fun c!41101 () Bool)

(assert (=> d!60241 (= c!41101 (bvsge #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60241 (and (bvsle #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6107 (_keys!6662 thiss!1504)) (size!6107 lt!123058)))))

(assert (=> d!60241 (= (arrayCountValidKeys!0 lt!123058 #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) lt!123196)))

(declare-fun b!245952 () Bool)

(assert (=> b!245952 (= e!159559 #b00000000000000000000000000000000)))

(assert (= (and d!60241 c!41101) b!245952))

(assert (= (and d!60241 (not c!41101)) b!245954))

(assert (= (and b!245954 c!41100) b!245953))

(assert (= (and b!245954 (not c!41100)) b!245951))

(assert (= (or b!245953 b!245951) bm!22985))

(declare-fun m!263413 () Bool)

(assert (=> bm!22985 m!263413))

(declare-fun m!263415 () Bool)

(assert (=> b!245954 m!263415))

(assert (=> b!245954 m!263415))

(declare-fun m!263417 () Bool)

(assert (=> b!245954 m!263417))

(assert (=> b!245731 d!60241))

(declare-fun d!60243 () Bool)

(declare-fun e!159563 () Bool)

(assert (=> d!60243 e!159563))

(declare-fun res!120612 () Bool)

(assert (=> d!60243 (=> (not res!120612) (not e!159563))))

(assert (=> d!60243 (= res!120612 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6107 (_keys!6662 thiss!1504)))))))

(declare-fun lt!123199 () Unit!7585)

(declare-fun choose!41 (array!12147 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3673) Unit!7585)

(assert (=> d!60243 (= lt!123199 (choose!41 (_keys!6662 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3670))))

(assert (=> d!60243 (bvslt (size!6107 (_keys!6662 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60243 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6662 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3670) lt!123199)))

(declare-fun b!245957 () Bool)

(assert (=> b!245957 (= e!159563 (arrayNoDuplicates!0 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))) #b00000000000000000000000000000000 Nil!3670))))

(assert (= (and d!60243 res!120612) b!245957))

(declare-fun m!263419 () Bool)

(assert (=> d!60243 m!263419))

(assert (=> b!245957 m!263249))

(declare-fun m!263421 () Bool)

(assert (=> b!245957 m!263421))

(assert (=> b!245731 d!60243))

(declare-fun d!60245 () Bool)

(declare-fun res!120619 () Bool)

(declare-fun e!159572 () Bool)

(assert (=> d!60245 (=> res!120619 e!159572)))

(assert (=> d!60245 (= res!120619 (bvsge #b00000000000000000000000000000000 (size!6107 lt!123058)))))

(assert (=> d!60245 (= (arrayNoDuplicates!0 lt!123058 #b00000000000000000000000000000000 Nil!3670) e!159572)))

(declare-fun b!245968 () Bool)

(declare-fun e!159575 () Bool)

(declare-fun contains!1778 (List!3673 (_ BitVec 64)) Bool)

(assert (=> b!245968 (= e!159575 (contains!1778 Nil!3670 (select (arr!5765 lt!123058) #b00000000000000000000000000000000)))))

(declare-fun bm!22988 () Bool)

(declare-fun call!22991 () Bool)

(declare-fun c!41104 () Bool)

(assert (=> bm!22988 (= call!22991 (arrayNoDuplicates!0 lt!123058 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41104 (Cons!3669 (select (arr!5765 lt!123058) #b00000000000000000000000000000000) Nil!3670) Nil!3670)))))

(declare-fun b!245969 () Bool)

(declare-fun e!159574 () Bool)

(assert (=> b!245969 (= e!159574 call!22991)))

(declare-fun b!245970 () Bool)

(declare-fun e!159573 () Bool)

(assert (=> b!245970 (= e!159573 e!159574)))

(assert (=> b!245970 (= c!41104 (validKeyInArray!0 (select (arr!5765 lt!123058) #b00000000000000000000000000000000)))))

(declare-fun b!245971 () Bool)

(assert (=> b!245971 (= e!159572 e!159573)))

(declare-fun res!120621 () Bool)

(assert (=> b!245971 (=> (not res!120621) (not e!159573))))

(assert (=> b!245971 (= res!120621 (not e!159575))))

(declare-fun res!120620 () Bool)

(assert (=> b!245971 (=> (not res!120620) (not e!159575))))

(assert (=> b!245971 (= res!120620 (validKeyInArray!0 (select (arr!5765 lt!123058) #b00000000000000000000000000000000)))))

(declare-fun b!245972 () Bool)

(assert (=> b!245972 (= e!159574 call!22991)))

(assert (= (and d!60245 (not res!120619)) b!245971))

(assert (= (and b!245971 res!120620) b!245968))

(assert (= (and b!245971 res!120621) b!245970))

(assert (= (and b!245970 c!41104) b!245972))

(assert (= (and b!245970 (not c!41104)) b!245969))

(assert (= (or b!245972 b!245969) bm!22988))

(assert (=> b!245968 m!263415))

(assert (=> b!245968 m!263415))

(declare-fun m!263423 () Bool)

(assert (=> b!245968 m!263423))

(assert (=> bm!22988 m!263415))

(declare-fun m!263425 () Bool)

(assert (=> bm!22988 m!263425))

(assert (=> b!245970 m!263415))

(assert (=> b!245970 m!263415))

(assert (=> b!245970 m!263417))

(assert (=> b!245971 m!263415))

(assert (=> b!245971 m!263415))

(assert (=> b!245971 m!263417))

(assert (=> b!245731 d!60245))

(declare-fun d!60247 () Bool)

(assert (=> d!60247 (= (array_inv!3807 (_keys!6662 thiss!1504)) (bvsge (size!6107 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245727 d!60247))

(declare-fun d!60249 () Bool)

(assert (=> d!60249 (= (array_inv!3808 (_values!4530 thiss!1504)) (bvsge (size!6106 (_values!4530 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245727 d!60249))

(declare-fun d!60251 () Bool)

(declare-fun res!120628 () Bool)

(declare-fun e!159578 () Bool)

(assert (=> d!60251 (=> (not res!120628) (not e!159578))))

(declare-fun simpleValid!254 (LongMapFixedSize!3636) Bool)

(assert (=> d!60251 (= res!120628 (simpleValid!254 thiss!1504))))

(assert (=> d!60251 (= (valid!1423 thiss!1504) e!159578)))

(declare-fun b!245979 () Bool)

(declare-fun res!120629 () Bool)

(assert (=> b!245979 (=> (not res!120629) (not e!159578))))

(assert (=> b!245979 (= res!120629 (= (arrayCountValidKeys!0 (_keys!6662 thiss!1504) #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) (_size!1867 thiss!1504)))))

(declare-fun b!245980 () Bool)

(declare-fun res!120630 () Bool)

(assert (=> b!245980 (=> (not res!120630) (not e!159578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12147 (_ BitVec 32)) Bool)

(assert (=> b!245980 (= res!120630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(declare-fun b!245981 () Bool)

(assert (=> b!245981 (= e!159578 (arrayNoDuplicates!0 (_keys!6662 thiss!1504) #b00000000000000000000000000000000 Nil!3670))))

(assert (= (and d!60251 res!120628) b!245979))

(assert (= (and b!245979 res!120629) b!245980))

(assert (= (and b!245980 res!120630) b!245981))

(declare-fun m!263427 () Bool)

(assert (=> d!60251 m!263427))

(assert (=> b!245979 m!263251))

(declare-fun m!263429 () Bool)

(assert (=> b!245980 m!263429))

(declare-fun m!263431 () Bool)

(assert (=> b!245981 m!263431))

(assert (=> start!23368 d!60251))

(declare-fun d!60253 () Bool)

(assert (=> d!60253 (contains!1776 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)) key!932)))

(declare-fun lt!123202 () Unit!7585)

(declare-fun choose!1151 (array!12147 array!12145 (_ BitVec 32) (_ BitVec 32) V!8211 V!8211 (_ BitVec 64) (_ BitVec 32) Int) Unit!7585)

(assert (=> d!60253 (= lt!123202 (choose!1151 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))))

(assert (=> d!60253 (validMask!0 (mask!10661 thiss!1504))))

(assert (=> d!60253 (= (lemmaArrayContainsKeyThenInListMap!175 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)) lt!123202)))

(declare-fun bs!8895 () Bool)

(assert (= bs!8895 d!60253))

(assert (=> bs!8895 m!263235))

(assert (=> bs!8895 m!263235))

(assert (=> bs!8895 m!263237))

(declare-fun m!263433 () Bool)

(assert (=> bs!8895 m!263433))

(assert (=> bs!8895 m!263257))

(assert (=> b!245735 d!60253))

(declare-fun mapIsEmpty!10903 () Bool)

(declare-fun mapRes!10903 () Bool)

(assert (=> mapIsEmpty!10903 mapRes!10903))

(declare-fun condMapEmpty!10903 () Bool)

(declare-fun mapDefault!10903 () ValueCell!2868)

(assert (=> mapNonEmpty!10897 (= condMapEmpty!10903 (= mapRest!10897 ((as const (Array (_ BitVec 32) ValueCell!2868)) mapDefault!10903)))))

(declare-fun e!159584 () Bool)

(assert (=> mapNonEmpty!10897 (= tp!22918 (and e!159584 mapRes!10903))))

(declare-fun mapNonEmpty!10903 () Bool)

(declare-fun tp!22927 () Bool)

(declare-fun e!159583 () Bool)

(assert (=> mapNonEmpty!10903 (= mapRes!10903 (and tp!22927 e!159583))))

(declare-fun mapRest!10903 () (Array (_ BitVec 32) ValueCell!2868))

(declare-fun mapValue!10903 () ValueCell!2868)

(declare-fun mapKey!10903 () (_ BitVec 32))

(assert (=> mapNonEmpty!10903 (= mapRest!10897 (store mapRest!10903 mapKey!10903 mapValue!10903))))

(declare-fun b!245988 () Bool)

(assert (=> b!245988 (= e!159583 tp_is_empty!6423)))

(declare-fun b!245989 () Bool)

(assert (=> b!245989 (= e!159584 tp_is_empty!6423)))

(assert (= (and mapNonEmpty!10897 condMapEmpty!10903) mapIsEmpty!10903))

(assert (= (and mapNonEmpty!10897 (not condMapEmpty!10903)) mapNonEmpty!10903))

(assert (= (and mapNonEmpty!10903 ((_ is ValueCellFull!2868) mapValue!10903)) b!245988))

(assert (= (and mapNonEmpty!10897 ((_ is ValueCellFull!2868) mapDefault!10903)) b!245989))

(declare-fun m!263435 () Bool)

(assert (=> mapNonEmpty!10903 m!263435))

(declare-fun b_lambda!8029 () Bool)

(assert (= b_lambda!8027 (or (and b!245727 b_free!6561) b_lambda!8029)))

(check-sat b_and!13555 (not d!60223) (not bm!22980) tp_is_empty!6423 (not b_lambda!8029) (not d!60253) (not b!245861) (not b!245811) (not d!60235) (not b!245954) (not b!245803) (not bm!22971) (not bm!22981) (not b!245981) (not b!245870) (not bm!22970) (not bm!22972) (not b!245936) (not b!245968) (not d!60219) (not b!245865) (not b!245935) (not b!245950) (not bm!22985) (not b!245893) (not b!245866) (not b_next!6561) (not bm!22975) (not b!245957) (not b!245938) (not b!245862) (not d!60251) (not d!60225) (not b!245902) (not mapNonEmpty!10903) (not d!60229) (not b!245813) (not b!245875) (not b!245971) (not b!245864) (not bm!22988) (not bm!22984) (not b!245970) (not d!60233) (not d!60243) (not b!245980) (not b!245876) (not b!245979))
(check-sat b_and!13555 (not b_next!6561))
(get-model)

(declare-fun d!60255 () Bool)

(assert (=> d!60255 (isDefined!230 (getValueByKey!289 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932))))

(declare-fun lt!123205 () Unit!7585)

(declare-fun choose!1152 (List!3672 (_ BitVec 64)) Unit!7585)

(assert (=> d!60255 (= lt!123205 (choose!1152 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932))))

(declare-fun e!159587 () Bool)

(assert (=> d!60255 e!159587))

(declare-fun res!120633 () Bool)

(assert (=> d!60255 (=> (not res!120633) (not e!159587))))

(declare-fun isStrictlySorted!368 (List!3672) Bool)

(assert (=> d!60255 (= res!120633 (isStrictlySorted!368 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))))))

(assert (=> d!60255 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932) lt!123205)))

(declare-fun b!245992 () Bool)

(assert (=> b!245992 (= e!159587 (containsKey!281 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932))))

(assert (= (and d!60255 res!120633) b!245992))

(assert (=> d!60255 m!263315))

(assert (=> d!60255 m!263315))

(assert (=> d!60255 m!263317))

(declare-fun m!263437 () Bool)

(assert (=> d!60255 m!263437))

(declare-fun m!263439 () Bool)

(assert (=> d!60255 m!263439))

(assert (=> b!245992 m!263311))

(assert (=> b!245811 d!60255))

(declare-fun d!60257 () Bool)

(declare-fun isEmpty!522 (Option!295) Bool)

(assert (=> d!60257 (= (isDefined!230 (getValueByKey!289 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932)) (not (isEmpty!522 (getValueByKey!289 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932))))))

(declare-fun bs!8896 () Bool)

(assert (= bs!8896 d!60257))

(assert (=> bs!8896 m!263315))

(declare-fun m!263441 () Bool)

(assert (=> bs!8896 m!263441))

(assert (=> b!245811 d!60257))

(declare-fun b!246001 () Bool)

(declare-fun e!159592 () Option!295)

(assert (=> b!246001 (= e!159592 (Some!294 (_2!2406 (h!4325 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))))))))

(declare-fun d!60259 () Bool)

(declare-fun c!41109 () Bool)

(assert (=> d!60259 (= c!41109 (and ((_ is Cons!3668) (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))) (= (_1!2406 (h!4325 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))))) key!932)))))

(assert (=> d!60259 (= (getValueByKey!289 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932) e!159592)))

(declare-fun b!246003 () Bool)

(declare-fun e!159593 () Option!295)

(assert (=> b!246003 (= e!159593 (getValueByKey!289 (t!8687 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))) key!932))))

(declare-fun b!246002 () Bool)

(assert (=> b!246002 (= e!159592 e!159593)))

(declare-fun c!41110 () Bool)

(assert (=> b!246002 (= c!41110 (and ((_ is Cons!3668) (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))) (not (= (_1!2406 (h!4325 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))))) key!932))))))

(declare-fun b!246004 () Bool)

(assert (=> b!246004 (= e!159593 None!293)))

(assert (= (and d!60259 c!41109) b!246001))

(assert (= (and d!60259 (not c!41109)) b!246002))

(assert (= (and b!246002 c!41110) b!246003))

(assert (= (and b!246002 (not c!41110)) b!246004))

(declare-fun m!263443 () Bool)

(assert (=> b!246003 m!263443))

(assert (=> b!245811 d!60259))

(declare-fun d!60261 () Bool)

(declare-fun e!159594 () Bool)

(assert (=> d!60261 e!159594))

(declare-fun res!120634 () Bool)

(assert (=> d!60261 (=> res!120634 e!159594)))

(declare-fun lt!123209 () Bool)

(assert (=> d!60261 (= res!120634 (not lt!123209))))

(declare-fun lt!123207 () Bool)

(assert (=> d!60261 (= lt!123209 lt!123207)))

(declare-fun lt!123206 () Unit!7585)

(declare-fun e!159595 () Unit!7585)

(assert (=> d!60261 (= lt!123206 e!159595)))

(declare-fun c!41111 () Bool)

(assert (=> d!60261 (= c!41111 lt!123207)))

(assert (=> d!60261 (= lt!123207 (containsKey!281 (toList!1867 lt!123158) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60261 (= (contains!1776 lt!123158 #b0000000000000000000000000000000000000000000000000000000000000000) lt!123209)))

(declare-fun b!246005 () Bool)

(declare-fun lt!123208 () Unit!7585)

(assert (=> b!246005 (= e!159595 lt!123208)))

(assert (=> b!246005 (= lt!123208 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1867 lt!123158) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246005 (isDefined!230 (getValueByKey!289 (toList!1867 lt!123158) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246006 () Bool)

(declare-fun Unit!7597 () Unit!7585)

(assert (=> b!246006 (= e!159595 Unit!7597)))

(declare-fun b!246007 () Bool)

(assert (=> b!246007 (= e!159594 (isDefined!230 (getValueByKey!289 (toList!1867 lt!123158) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60261 c!41111) b!246005))

(assert (= (and d!60261 (not c!41111)) b!246006))

(assert (= (and d!60261 (not res!120634)) b!246007))

(declare-fun m!263445 () Bool)

(assert (=> d!60261 m!263445))

(declare-fun m!263447 () Bool)

(assert (=> b!246005 m!263447))

(declare-fun m!263449 () Bool)

(assert (=> b!246005 m!263449))

(assert (=> b!246005 m!263449))

(declare-fun m!263451 () Bool)

(assert (=> b!246005 m!263451))

(assert (=> b!246007 m!263449))

(assert (=> b!246007 m!263449))

(assert (=> b!246007 m!263451))

(assert (=> bm!22971 d!60261))

(declare-fun d!60263 () Bool)

(declare-fun res!120635 () Bool)

(declare-fun e!159596 () Bool)

(assert (=> d!60263 (=> res!120635 e!159596)))

(assert (=> d!60263 (= res!120635 (= (select (arr!5765 (_keys!6662 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!60263 (= (arrayContainsKey!0 (_keys!6662 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!159596)))

(declare-fun b!246008 () Bool)

(declare-fun e!159597 () Bool)

(assert (=> b!246008 (= e!159596 e!159597)))

(declare-fun res!120636 () Bool)

(assert (=> b!246008 (=> (not res!120636) (not e!159597))))

(assert (=> b!246008 (= res!120636 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!246009 () Bool)

(assert (=> b!246009 (= e!159597 (arrayContainsKey!0 (_keys!6662 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!60263 (not res!120635)) b!246008))

(assert (= (and b!246008 res!120636) b!246009))

(declare-fun m!263453 () Bool)

(assert (=> d!60263 m!263453))

(declare-fun m!263455 () Bool)

(assert (=> b!246009 m!263455))

(assert (=> b!245902 d!60263))

(declare-fun b!246034 () Bool)

(declare-fun e!159615 () Bool)

(declare-fun lt!123226 () ListLongMap!3703)

(assert (=> b!246034 (= e!159615 (= lt!123226 (getCurrentListMapNoExtraKeys!553 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4547 thiss!1504))))))

(declare-fun b!246035 () Bool)

(declare-fun e!159612 () ListLongMap!3703)

(declare-fun call!22994 () ListLongMap!3703)

(assert (=> b!246035 (= e!159612 call!22994)))

(declare-fun b!246036 () Bool)

(declare-fun e!159616 () Bool)

(assert (=> b!246036 (= e!159616 e!159615)))

(declare-fun c!41122 () Bool)

(assert (=> b!246036 (= c!41122 (bvslt #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!246037 () Bool)

(declare-fun isEmpty!523 (ListLongMap!3703) Bool)

(assert (=> b!246037 (= e!159615 (isEmpty!523 lt!123226))))

(declare-fun b!246038 () Bool)

(assert (=> b!246038 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> b!246038 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6106 (_values!4530 thiss!1504))))))

(declare-fun e!159617 () Bool)

(assert (=> b!246038 (= e!159617 (= (apply!231 lt!123226 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)) (get!2957 (select (arr!5764 (_values!4530 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4547 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246040 () Bool)

(declare-fun lt!123230 () Unit!7585)

(declare-fun lt!123228 () Unit!7585)

(assert (=> b!246040 (= lt!123230 lt!123228)))

(declare-fun lt!123227 () (_ BitVec 64))

(declare-fun lt!123229 () V!8211)

(declare-fun lt!123224 () ListLongMap!3703)

(declare-fun lt!123225 () (_ BitVec 64))

(assert (=> b!246040 (not (contains!1776 (+!658 lt!123224 (tuple2!4791 lt!123225 lt!123229)) lt!123227))))

(declare-fun addStillNotContains!120 (ListLongMap!3703 (_ BitVec 64) V!8211 (_ BitVec 64)) Unit!7585)

(assert (=> b!246040 (= lt!123228 (addStillNotContains!120 lt!123224 lt!123225 lt!123229 lt!123227))))

(assert (=> b!246040 (= lt!123227 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!246040 (= lt!123229 (get!2957 (select (arr!5764 (_values!4530 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4547 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!246040 (= lt!123225 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246040 (= lt!123224 call!22994)))

(assert (=> b!246040 (= e!159612 (+!658 call!22994 (tuple2!4791 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000) (get!2957 (select (arr!5764 (_values!4530 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4547 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!246041 () Bool)

(declare-fun e!159614 () ListLongMap!3703)

(assert (=> b!246041 (= e!159614 e!159612)))

(declare-fun c!41121 () Bool)

(assert (=> b!246041 (= c!41121 (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22991 () Bool)

(assert (=> bm!22991 (= call!22994 (getCurrentListMapNoExtraKeys!553 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4547 thiss!1504)))))

(declare-fun b!246042 () Bool)

(assert (=> b!246042 (= e!159614 (ListLongMap!3704 Nil!3669))))

(declare-fun b!246043 () Bool)

(declare-fun e!159618 () Bool)

(assert (=> b!246043 (= e!159618 e!159616)))

(declare-fun c!41123 () Bool)

(declare-fun e!159613 () Bool)

(assert (=> b!246043 (= c!41123 e!159613)))

(declare-fun res!120646 () Bool)

(assert (=> b!246043 (=> (not res!120646) (not e!159613))))

(assert (=> b!246043 (= res!120646 (bvslt #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!246044 () Bool)

(assert (=> b!246044 (= e!159613 (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246044 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!246045 () Bool)

(declare-fun res!120647 () Bool)

(assert (=> b!246045 (=> (not res!120647) (not e!159618))))

(assert (=> b!246045 (= res!120647 (not (contains!1776 lt!123226 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!60265 () Bool)

(assert (=> d!60265 e!159618))

(declare-fun res!120645 () Bool)

(assert (=> d!60265 (=> (not res!120645) (not e!159618))))

(assert (=> d!60265 (= res!120645 (not (contains!1776 lt!123226 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60265 (= lt!123226 e!159614)))

(declare-fun c!41120 () Bool)

(assert (=> d!60265 (= c!41120 (bvsge #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60265 (validMask!0 (mask!10661 thiss!1504))))

(assert (=> d!60265 (= (getCurrentListMapNoExtraKeys!553 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)) lt!123226)))

(declare-fun b!246039 () Bool)

(assert (=> b!246039 (= e!159616 e!159617)))

(assert (=> b!246039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun res!120648 () Bool)

(assert (=> b!246039 (= res!120648 (contains!1776 lt!123226 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246039 (=> (not res!120648) (not e!159617))))

(assert (= (and d!60265 c!41120) b!246042))

(assert (= (and d!60265 (not c!41120)) b!246041))

(assert (= (and b!246041 c!41121) b!246040))

(assert (= (and b!246041 (not c!41121)) b!246035))

(assert (= (or b!246040 b!246035) bm!22991))

(assert (= (and d!60265 res!120645) b!246045))

(assert (= (and b!246045 res!120647) b!246043))

(assert (= (and b!246043 res!120646) b!246044))

(assert (= (and b!246043 c!41123) b!246039))

(assert (= (and b!246043 (not c!41123)) b!246036))

(assert (= (and b!246039 res!120648) b!246038))

(assert (= (and b!246036 c!41122) b!246034))

(assert (= (and b!246036 (not c!41122)) b!246037))

(declare-fun b_lambda!8031 () Bool)

(assert (=> (not b_lambda!8031) (not b!246038)))

(assert (=> b!246038 t!8692))

(declare-fun b_and!13557 () Bool)

(assert (= b_and!13555 (and (=> t!8692 result!5247) b_and!13557)))

(declare-fun b_lambda!8033 () Bool)

(assert (=> (not b_lambda!8033) (not b!246040)))

(assert (=> b!246040 t!8692))

(declare-fun b_and!13559 () Bool)

(assert (= b_and!13557 (and (=> t!8692 result!5247) b_and!13559)))

(declare-fun m!263457 () Bool)

(assert (=> bm!22991 m!263457))

(assert (=> b!246038 m!263335))

(assert (=> b!246038 m!263319))

(assert (=> b!246038 m!263335))

(assert (=> b!246038 m!263333))

(assert (=> b!246038 m!263337))

(assert (=> b!246038 m!263333))

(assert (=> b!246038 m!263319))

(declare-fun m!263459 () Bool)

(assert (=> b!246038 m!263459))

(declare-fun m!263461 () Bool)

(assert (=> b!246040 m!263461))

(declare-fun m!263463 () Bool)

(assert (=> b!246040 m!263463))

(declare-fun m!263465 () Bool)

(assert (=> b!246040 m!263465))

(assert (=> b!246040 m!263335))

(assert (=> b!246040 m!263319))

(assert (=> b!246040 m!263335))

(assert (=> b!246040 m!263333))

(assert (=> b!246040 m!263337))

(declare-fun m!263467 () Bool)

(assert (=> b!246040 m!263467))

(assert (=> b!246040 m!263463))

(assert (=> b!246040 m!263333))

(assert (=> b!246039 m!263319))

(assert (=> b!246039 m!263319))

(declare-fun m!263469 () Bool)

(assert (=> b!246039 m!263469))

(declare-fun m!263471 () Bool)

(assert (=> d!60265 m!263471))

(assert (=> d!60265 m!263257))

(assert (=> b!246041 m!263319))

(assert (=> b!246041 m!263319))

(assert (=> b!246041 m!263321))

(declare-fun m!263473 () Bool)

(assert (=> b!246045 m!263473))

(declare-fun m!263475 () Bool)

(assert (=> b!246037 m!263475))

(assert (=> b!246034 m!263457))

(assert (=> b!246044 m!263319))

(assert (=> b!246044 m!263319))

(assert (=> b!246044 m!263321))

(assert (=> bm!22970 d!60265))

(assert (=> bm!22981 d!60231))

(declare-fun d!60267 () Bool)

(declare-fun get!2958 (Option!295) V!8211)

(assert (=> d!60267 (= (apply!231 lt!123158 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2958 (getValueByKey!289 (toList!1867 lt!123158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8897 () Bool)

(assert (= bs!8897 d!60267))

(declare-fun m!263477 () Bool)

(assert (=> bs!8897 m!263477))

(assert (=> bs!8897 m!263477))

(declare-fun m!263479 () Bool)

(assert (=> bs!8897 m!263479))

(assert (=> b!245875 d!60267))

(declare-fun b!246058 () Bool)

(declare-fun e!159627 () SeekEntryResult!1091)

(declare-fun e!159625 () SeekEntryResult!1091)

(assert (=> b!246058 (= e!159627 e!159625)))

(declare-fun c!41130 () Bool)

(declare-fun lt!123235 () (_ BitVec 64))

(assert (=> b!246058 (= c!41130 (= lt!123235 key!932))))

(declare-fun b!246059 () Bool)

(assert (=> b!246059 (= e!159625 (Found!1091 (index!6536 lt!123181)))))

(declare-fun b!246060 () Bool)

(assert (=> b!246060 (= e!159627 Undefined!1091)))

(declare-fun b!246061 () Bool)

(declare-fun e!159626 () SeekEntryResult!1091)

(assert (=> b!246061 (= e!159626 (MissingVacant!1091 (index!6536 lt!123181)))))

(declare-fun lt!123236 () SeekEntryResult!1091)

(declare-fun d!60269 () Bool)

(assert (=> d!60269 (and (or ((_ is Undefined!1091) lt!123236) (not ((_ is Found!1091) lt!123236)) (and (bvsge (index!6535 lt!123236) #b00000000000000000000000000000000) (bvslt (index!6535 lt!123236) (size!6107 (_keys!6662 thiss!1504))))) (or ((_ is Undefined!1091) lt!123236) ((_ is Found!1091) lt!123236) (not ((_ is MissingVacant!1091) lt!123236)) (not (= (index!6537 lt!123236) (index!6536 lt!123181))) (and (bvsge (index!6537 lt!123236) #b00000000000000000000000000000000) (bvslt (index!6537 lt!123236) (size!6107 (_keys!6662 thiss!1504))))) (or ((_ is Undefined!1091) lt!123236) (ite ((_ is Found!1091) lt!123236) (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6535 lt!123236)) key!932) (and ((_ is MissingVacant!1091) lt!123236) (= (index!6537 lt!123236) (index!6536 lt!123181)) (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6537 lt!123236)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!60269 (= lt!123236 e!159627)))

(declare-fun c!41131 () Bool)

(assert (=> d!60269 (= c!41131 (bvsge (x!24439 lt!123181) #b01111111111111111111111111111110))))

(assert (=> d!60269 (= lt!123235 (select (arr!5765 (_keys!6662 thiss!1504)) (index!6536 lt!123181)))))

(assert (=> d!60269 (validMask!0 (mask!10661 thiss!1504))))

(assert (=> d!60269 (= (seekKeyOrZeroReturnVacant!0 (x!24439 lt!123181) (index!6536 lt!123181) (index!6536 lt!123181) key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)) lt!123236)))

(declare-fun b!246062 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!246062 (= e!159626 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24439 lt!123181) #b00000000000000000000000000000001) (nextIndex!0 (index!6536 lt!123181) (x!24439 lt!123181) (mask!10661 thiss!1504)) (index!6536 lt!123181) key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(declare-fun b!246063 () Bool)

(declare-fun c!41132 () Bool)

(assert (=> b!246063 (= c!41132 (= lt!123235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246063 (= e!159625 e!159626)))

(assert (= (and d!60269 c!41131) b!246060))

(assert (= (and d!60269 (not c!41131)) b!246058))

(assert (= (and b!246058 c!41130) b!246059))

(assert (= (and b!246058 (not c!41130)) b!246063))

(assert (= (and b!246063 c!41132) b!246061))

(assert (= (and b!246063 (not c!41132)) b!246062))

(declare-fun m!263481 () Bool)

(assert (=> d!60269 m!263481))

(declare-fun m!263483 () Bool)

(assert (=> d!60269 m!263483))

(assert (=> d!60269 m!263389))

(assert (=> d!60269 m!263257))

(declare-fun m!263485 () Bool)

(assert (=> b!246062 m!263485))

(assert (=> b!246062 m!263485))

(declare-fun m!263487 () Bool)

(assert (=> b!246062 m!263487))

(assert (=> b!245893 d!60269))

(declare-fun d!60271 () Bool)

(assert (=> d!60271 (= (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245876 d!60271))

(declare-fun d!60273 () Bool)

(assert (=> d!60273 (arrayNoDuplicates!0 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))) #b00000000000000000000000000000000 Nil!3670)))

(assert (=> d!60273 true))

(declare-fun _$65!71 () Unit!7585)

(assert (=> d!60273 (= (choose!41 (_keys!6662 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3670) _$65!71)))

(declare-fun bs!8898 () Bool)

(assert (= bs!8898 d!60273))

(assert (=> bs!8898 m!263249))

(assert (=> bs!8898 m!263421))

(assert (=> d!60243 d!60273))

(declare-fun d!60275 () Bool)

(declare-fun e!159628 () Bool)

(assert (=> d!60275 e!159628))

(declare-fun res!120649 () Bool)

(assert (=> d!60275 (=> res!120649 e!159628)))

(declare-fun lt!123240 () Bool)

(assert (=> d!60275 (= res!120649 (not lt!123240))))

(declare-fun lt!123238 () Bool)

(assert (=> d!60275 (= lt!123240 lt!123238)))

(declare-fun lt!123237 () Unit!7585)

(declare-fun e!159629 () Unit!7585)

(assert (=> d!60275 (= lt!123237 e!159629)))

(declare-fun c!41133 () Bool)

(assert (=> d!60275 (= c!41133 lt!123238)))

(assert (=> d!60275 (= lt!123238 (containsKey!281 (toList!1867 lt!123158) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60275 (= (contains!1776 lt!123158 #b1000000000000000000000000000000000000000000000000000000000000000) lt!123240)))

(declare-fun b!246064 () Bool)

(declare-fun lt!123239 () Unit!7585)

(assert (=> b!246064 (= e!159629 lt!123239)))

(assert (=> b!246064 (= lt!123239 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1867 lt!123158) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246064 (isDefined!230 (getValueByKey!289 (toList!1867 lt!123158) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246065 () Bool)

(declare-fun Unit!7598 () Unit!7585)

(assert (=> b!246065 (= e!159629 Unit!7598)))

(declare-fun b!246066 () Bool)

(assert (=> b!246066 (= e!159628 (isDefined!230 (getValueByKey!289 (toList!1867 lt!123158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60275 c!41133) b!246064))

(assert (= (and d!60275 (not c!41133)) b!246065))

(assert (= (and d!60275 (not res!120649)) b!246066))

(declare-fun m!263489 () Bool)

(assert (=> d!60275 m!263489))

(declare-fun m!263491 () Bool)

(assert (=> b!246064 m!263491))

(assert (=> b!246064 m!263477))

(assert (=> b!246064 m!263477))

(declare-fun m!263493 () Bool)

(assert (=> b!246064 m!263493))

(assert (=> b!246066 m!263477))

(assert (=> b!246066 m!263477))

(assert (=> b!246066 m!263493))

(assert (=> bm!22975 d!60275))

(assert (=> d!60219 d!60229))

(declare-fun d!60277 () Bool)

(declare-fun e!159632 () Bool)

(assert (=> d!60277 e!159632))

(declare-fun res!120655 () Bool)

(assert (=> d!60277 (=> (not res!120655) (not e!159632))))

(declare-fun lt!123243 () SeekEntryResult!1091)

(assert (=> d!60277 (= res!120655 ((_ is Found!1091) lt!123243))))

(assert (=> d!60277 (= lt!123243 (seekEntryOrOpen!0 key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(assert (=> d!60277 true))

(declare-fun _$33!159 () Unit!7585)

(assert (=> d!60277 (= (choose!1149 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 (defaultEntry!4547 thiss!1504)) _$33!159)))

(declare-fun b!246071 () Bool)

(declare-fun res!120654 () Bool)

(assert (=> b!246071 (=> (not res!120654) (not e!159632))))

(assert (=> b!246071 (= res!120654 (inRange!0 (index!6535 lt!123243) (mask!10661 thiss!1504)))))

(declare-fun b!246072 () Bool)

(assert (=> b!246072 (= e!159632 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6535 lt!123243)) key!932))))

(assert (= (and d!60277 res!120655) b!246071))

(assert (= (and b!246071 res!120654) b!246072))

(assert (=> d!60277 m!263259))

(declare-fun m!263495 () Bool)

(assert (=> b!246071 m!263495))

(declare-fun m!263497 () Bool)

(assert (=> b!246072 m!263497))

(assert (=> d!60219 d!60277))

(assert (=> d!60219 d!60239))

(declare-fun d!60279 () Bool)

(declare-fun res!120656 () Bool)

(declare-fun e!159633 () Bool)

(assert (=> d!60279 (=> res!120656 e!159633)))

(assert (=> d!60279 (= res!120656 (bvsge #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60279 (= (arrayNoDuplicates!0 (_keys!6662 thiss!1504) #b00000000000000000000000000000000 Nil!3670) e!159633)))

(declare-fun b!246073 () Bool)

(declare-fun e!159636 () Bool)

(assert (=> b!246073 (= e!159636 (contains!1778 Nil!3670 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22992 () Bool)

(declare-fun call!22995 () Bool)

(declare-fun c!41134 () Bool)

(assert (=> bm!22992 (= call!22995 (arrayNoDuplicates!0 (_keys!6662 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41134 (Cons!3669 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000) Nil!3670) Nil!3670)))))

(declare-fun b!246074 () Bool)

(declare-fun e!159635 () Bool)

(assert (=> b!246074 (= e!159635 call!22995)))

(declare-fun b!246075 () Bool)

(declare-fun e!159634 () Bool)

(assert (=> b!246075 (= e!159634 e!159635)))

(assert (=> b!246075 (= c!41134 (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246076 () Bool)

(assert (=> b!246076 (= e!159633 e!159634)))

(declare-fun res!120658 () Bool)

(assert (=> b!246076 (=> (not res!120658) (not e!159634))))

(assert (=> b!246076 (= res!120658 (not e!159636))))

(declare-fun res!120657 () Bool)

(assert (=> b!246076 (=> (not res!120657) (not e!159636))))

(assert (=> b!246076 (= res!120657 (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246077 () Bool)

(assert (=> b!246077 (= e!159635 call!22995)))

(assert (= (and d!60279 (not res!120656)) b!246076))

(assert (= (and b!246076 res!120657) b!246073))

(assert (= (and b!246076 res!120658) b!246075))

(assert (= (and b!246075 c!41134) b!246077))

(assert (= (and b!246075 (not c!41134)) b!246074))

(assert (= (or b!246077 b!246074) bm!22992))

(assert (=> b!246073 m!263319))

(assert (=> b!246073 m!263319))

(declare-fun m!263499 () Bool)

(assert (=> b!246073 m!263499))

(assert (=> bm!22992 m!263319))

(declare-fun m!263501 () Bool)

(assert (=> bm!22992 m!263501))

(assert (=> b!246075 m!263319))

(assert (=> b!246075 m!263319))

(assert (=> b!246075 m!263321))

(assert (=> b!246076 m!263319))

(assert (=> b!246076 m!263319))

(assert (=> b!246076 m!263321))

(assert (=> b!245981 d!60279))

(assert (=> b!245979 d!60237))

(declare-fun d!60281 () Bool)

(declare-fun e!159639 () Bool)

(assert (=> d!60281 e!159639))

(declare-fun res!120664 () Bool)

(assert (=> d!60281 (=> (not res!120664) (not e!159639))))

(declare-fun lt!123255 () ListLongMap!3703)

(assert (=> d!60281 (= res!120664 (contains!1776 lt!123255 (_1!2406 (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))))))))

(declare-fun lt!123253 () List!3672)

(assert (=> d!60281 (= lt!123255 (ListLongMap!3704 lt!123253))))

(declare-fun lt!123252 () Unit!7585)

(declare-fun lt!123254 () Unit!7585)

(assert (=> d!60281 (= lt!123252 lt!123254)))

(assert (=> d!60281 (= (getValueByKey!289 lt!123253 (_1!2406 (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))))) (Some!294 (_2!2406 (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!156 (List!3672 (_ BitVec 64) V!8211) Unit!7585)

(assert (=> d!60281 (= lt!123254 (lemmaContainsTupThenGetReturnValue!156 lt!123253 (_1!2406 (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))) (_2!2406 (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))))))))

(declare-fun insertStrictlySorted!159 (List!3672 (_ BitVec 64) V!8211) List!3672)

(assert (=> d!60281 (= lt!123253 (insertStrictlySorted!159 (toList!1867 (ite c!41077 call!22974 (ite c!41073 call!22972 call!22978))) (_1!2406 (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))) (_2!2406 (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))))))))

(assert (=> d!60281 (= (+!658 (ite c!41077 call!22974 (ite c!41073 call!22972 call!22978)) (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))) lt!123255)))

(declare-fun b!246082 () Bool)

(declare-fun res!120663 () Bool)

(assert (=> b!246082 (=> (not res!120663) (not e!159639))))

(assert (=> b!246082 (= res!120663 (= (getValueByKey!289 (toList!1867 lt!123255) (_1!2406 (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))))) (Some!294 (_2!2406 (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))))))))

(declare-fun b!246083 () Bool)

(declare-fun contains!1779 (List!3672 tuple2!4790) Bool)

(assert (=> b!246083 (= e!159639 (contains!1779 (toList!1867 lt!123255) (ite (or c!41077 c!41073) (tuple2!4791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4388 thiss!1504)) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))))))

(assert (= (and d!60281 res!120664) b!246082))

(assert (= (and b!246082 res!120663) b!246083))

(declare-fun m!263503 () Bool)

(assert (=> d!60281 m!263503))

(declare-fun m!263505 () Bool)

(assert (=> d!60281 m!263505))

(declare-fun m!263507 () Bool)

(assert (=> d!60281 m!263507))

(declare-fun m!263509 () Bool)

(assert (=> d!60281 m!263509))

(declare-fun m!263511 () Bool)

(assert (=> b!246082 m!263511))

(declare-fun m!263513 () Bool)

(assert (=> b!246083 m!263513))

(assert (=> bm!22972 d!60281))

(declare-fun b!246092 () Bool)

(declare-fun e!159646 () Bool)

(declare-fun e!159648 () Bool)

(assert (=> b!246092 (= e!159646 e!159648)))

(declare-fun lt!123263 () (_ BitVec 64))

(assert (=> b!246092 (= lt!123263 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123264 () Unit!7585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12147 (_ BitVec 64) (_ BitVec 32)) Unit!7585)

(assert (=> b!246092 (= lt!123264 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6662 thiss!1504) lt!123263 #b00000000000000000000000000000000))))

(assert (=> b!246092 (arrayContainsKey!0 (_keys!6662 thiss!1504) lt!123263 #b00000000000000000000000000000000)))

(declare-fun lt!123262 () Unit!7585)

(assert (=> b!246092 (= lt!123262 lt!123264)))

(declare-fun res!120670 () Bool)

(assert (=> b!246092 (= res!120670 (= (seekEntryOrOpen!0 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000) (_keys!6662 thiss!1504) (mask!10661 thiss!1504)) (Found!1091 #b00000000000000000000000000000000)))))

(assert (=> b!246092 (=> (not res!120670) (not e!159648))))

(declare-fun b!246093 () Bool)

(declare-fun call!22998 () Bool)

(assert (=> b!246093 (= e!159646 call!22998)))

(declare-fun bm!22995 () Bool)

(assert (=> bm!22995 (= call!22998 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(declare-fun b!246095 () Bool)

(declare-fun e!159647 () Bool)

(assert (=> b!246095 (= e!159647 e!159646)))

(declare-fun c!41137 () Bool)

(assert (=> b!246095 (= c!41137 (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60283 () Bool)

(declare-fun res!120669 () Bool)

(assert (=> d!60283 (=> res!120669 e!159647)))

(assert (=> d!60283 (= res!120669 (bvsge #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60283 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)) e!159647)))

(declare-fun b!246094 () Bool)

(assert (=> b!246094 (= e!159648 call!22998)))

(assert (= (and d!60283 (not res!120669)) b!246095))

(assert (= (and b!246095 c!41137) b!246092))

(assert (= (and b!246095 (not c!41137)) b!246093))

(assert (= (and b!246092 res!120670) b!246094))

(assert (= (or b!246094 b!246093) bm!22995))

(assert (=> b!246092 m!263319))

(declare-fun m!263515 () Bool)

(assert (=> b!246092 m!263515))

(declare-fun m!263517 () Bool)

(assert (=> b!246092 m!263517))

(assert (=> b!246092 m!263319))

(declare-fun m!263519 () Bool)

(assert (=> b!246092 m!263519))

(declare-fun m!263521 () Bool)

(assert (=> bm!22995 m!263521))

(assert (=> b!246095 m!263319))

(assert (=> b!246095 m!263319))

(assert (=> b!246095 m!263321))

(assert (=> b!245980 d!60283))

(declare-fun bm!22996 () Bool)

(declare-fun call!22999 () (_ BitVec 32))

(assert (=> bm!22996 (= call!22999 (arrayCountValidKeys!0 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!246096 () Bool)

(declare-fun e!159650 () (_ BitVec 32))

(assert (=> b!246096 (= e!159650 call!22999)))

(declare-fun b!246098 () Bool)

(assert (=> b!246098 (= e!159650 (bvadd #b00000000000000000000000000000001 call!22999))))

(declare-fun b!246099 () Bool)

(declare-fun e!159649 () (_ BitVec 32))

(assert (=> b!246099 (= e!159649 e!159650)))

(declare-fun c!41138 () Bool)

(assert (=> b!246099 (= c!41138 (validKeyInArray!0 (select (arr!5765 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!60285 () Bool)

(declare-fun lt!123265 () (_ BitVec 32))

(assert (=> d!60285 (and (bvsge lt!123265 #b00000000000000000000000000000000) (bvsle lt!123265 (bvsub (size!6107 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!60285 (= lt!123265 e!159649)))

(declare-fun c!41139 () Bool)

(assert (=> d!60285 (= c!41139 (bvsge #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60285 (and (bvsle #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6107 (_keys!6662 thiss!1504)) (size!6107 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))))))))

(assert (=> d!60285 (= (arrayCountValidKeys!0 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))) #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) lt!123265)))

(declare-fun b!246097 () Bool)

(assert (=> b!246097 (= e!159649 #b00000000000000000000000000000000)))

(assert (= (and d!60285 c!41139) b!246097))

(assert (= (and d!60285 (not c!41139)) b!246099))

(assert (= (and b!246099 c!41138) b!246098))

(assert (= (and b!246099 (not c!41138)) b!246096))

(assert (= (or b!246098 b!246096) bm!22996))

(declare-fun m!263523 () Bool)

(assert (=> bm!22996 m!263523))

(declare-fun m!263525 () Bool)

(assert (=> b!246099 m!263525))

(assert (=> b!246099 m!263525))

(declare-fun m!263527 () Bool)

(assert (=> b!246099 m!263527))

(assert (=> b!245938 d!60285))

(assert (=> b!245938 d!60237))

(declare-fun d!60287 () Bool)

(declare-fun res!120671 () Bool)

(declare-fun e!159651 () Bool)

(assert (=> d!60287 (=> res!120671 e!159651)))

(assert (=> d!60287 (= res!120671 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 lt!123058)))))

(assert (=> d!60287 (= (arrayNoDuplicates!0 lt!123058 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41104 (Cons!3669 (select (arr!5765 lt!123058) #b00000000000000000000000000000000) Nil!3670) Nil!3670)) e!159651)))

(declare-fun b!246100 () Bool)

(declare-fun e!159654 () Bool)

(assert (=> b!246100 (= e!159654 (contains!1778 (ite c!41104 (Cons!3669 (select (arr!5765 lt!123058) #b00000000000000000000000000000000) Nil!3670) Nil!3670) (select (arr!5765 lt!123058) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!22997 () Bool)

(declare-fun call!23000 () Bool)

(declare-fun c!41140 () Bool)

(assert (=> bm!22997 (= call!23000 (arrayNoDuplicates!0 lt!123058 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!41140 (Cons!3669 (select (arr!5765 lt!123058) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!41104 (Cons!3669 (select (arr!5765 lt!123058) #b00000000000000000000000000000000) Nil!3670) Nil!3670)) (ite c!41104 (Cons!3669 (select (arr!5765 lt!123058) #b00000000000000000000000000000000) Nil!3670) Nil!3670))))))

(declare-fun b!246101 () Bool)

(declare-fun e!159653 () Bool)

(assert (=> b!246101 (= e!159653 call!23000)))

(declare-fun b!246102 () Bool)

(declare-fun e!159652 () Bool)

(assert (=> b!246102 (= e!159652 e!159653)))

(assert (=> b!246102 (= c!41140 (validKeyInArray!0 (select (arr!5765 lt!123058) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!246103 () Bool)

(assert (=> b!246103 (= e!159651 e!159652)))

(declare-fun res!120673 () Bool)

(assert (=> b!246103 (=> (not res!120673) (not e!159652))))

(assert (=> b!246103 (= res!120673 (not e!159654))))

(declare-fun res!120672 () Bool)

(assert (=> b!246103 (=> (not res!120672) (not e!159654))))

(assert (=> b!246103 (= res!120672 (validKeyInArray!0 (select (arr!5765 lt!123058) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!246104 () Bool)

(assert (=> b!246104 (= e!159653 call!23000)))

(assert (= (and d!60287 (not res!120671)) b!246103))

(assert (= (and b!246103 res!120672) b!246100))

(assert (= (and b!246103 res!120673) b!246102))

(assert (= (and b!246102 c!41140) b!246104))

(assert (= (and b!246102 (not c!41140)) b!246101))

(assert (= (or b!246104 b!246101) bm!22997))

(declare-fun m!263529 () Bool)

(assert (=> b!246100 m!263529))

(assert (=> b!246100 m!263529))

(declare-fun m!263531 () Bool)

(assert (=> b!246100 m!263531))

(assert (=> bm!22997 m!263529))

(declare-fun m!263533 () Bool)

(assert (=> bm!22997 m!263533))

(assert (=> b!246102 m!263529))

(assert (=> b!246102 m!263529))

(declare-fun m!263535 () Bool)

(assert (=> b!246102 m!263535))

(assert (=> b!246103 m!263529))

(assert (=> b!246103 m!263529))

(assert (=> b!246103 m!263535))

(assert (=> bm!22988 d!60287))

(declare-fun d!60289 () Bool)

(assert (=> d!60289 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245936 d!60289))

(assert (=> d!60233 d!60229))

(declare-fun b!246121 () Bool)

(declare-fun res!120685 () Bool)

(declare-fun lt!123268 () SeekEntryResult!1091)

(assert (=> b!246121 (= res!120685 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6534 lt!123268)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159664 () Bool)

(assert (=> b!246121 (=> (not res!120685) (not e!159664))))

(declare-fun c!41145 () Bool)

(declare-fun bm!23002 () Bool)

(declare-fun call!23006 () Bool)

(assert (=> bm!23002 (= call!23006 (inRange!0 (ite c!41145 (index!6534 lt!123268) (index!6537 lt!123268)) (mask!10661 thiss!1504)))))

(declare-fun b!246122 () Bool)

(declare-fun res!120682 () Bool)

(declare-fun e!159665 () Bool)

(assert (=> b!246122 (=> (not res!120682) (not e!159665))))

(assert (=> b!246122 (= res!120682 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6537 lt!123268)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246123 () Bool)

(declare-fun call!23005 () Bool)

(assert (=> b!246123 (= e!159664 (not call!23005))))

(declare-fun b!246124 () Bool)

(declare-fun e!159666 () Bool)

(assert (=> b!246124 (= e!159666 ((_ is Undefined!1091) lt!123268))))

(declare-fun b!246125 () Bool)

(declare-fun e!159663 () Bool)

(assert (=> b!246125 (= e!159663 e!159664)))

(declare-fun res!120684 () Bool)

(assert (=> b!246125 (= res!120684 call!23006)))

(assert (=> b!246125 (=> (not res!120684) (not e!159664))))

(declare-fun d!60291 () Bool)

(assert (=> d!60291 e!159663))

(assert (=> d!60291 (= c!41145 ((_ is MissingZero!1091) lt!123268))))

(assert (=> d!60291 (= lt!123268 (seekEntryOrOpen!0 key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(assert (=> d!60291 true))

(declare-fun _$34!1104 () Unit!7585)

(assert (=> d!60291 (= (choose!1150 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 (defaultEntry!4547 thiss!1504)) _$34!1104)))

(declare-fun b!246126 () Bool)

(assert (=> b!246126 (= e!159663 e!159666)))

(declare-fun c!41146 () Bool)

(assert (=> b!246126 (= c!41146 ((_ is MissingVacant!1091) lt!123268))))

(declare-fun b!246127 () Bool)

(declare-fun res!120683 () Bool)

(assert (=> b!246127 (=> (not res!120683) (not e!159665))))

(assert (=> b!246127 (= res!120683 call!23006)))

(assert (=> b!246127 (= e!159666 e!159665)))

(declare-fun b!246128 () Bool)

(assert (=> b!246128 (= e!159665 (not call!23005))))

(declare-fun bm!23003 () Bool)

(assert (=> bm!23003 (= call!23005 (arrayContainsKey!0 (_keys!6662 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!60291 c!41145) b!246125))

(assert (= (and d!60291 (not c!41145)) b!246126))

(assert (= (and b!246125 res!120684) b!246121))

(assert (= (and b!246121 res!120685) b!246123))

(assert (= (and b!246126 c!41146) b!246127))

(assert (= (and b!246126 (not c!41146)) b!246124))

(assert (= (and b!246127 res!120683) b!246122))

(assert (= (and b!246122 res!120682) b!246128))

(assert (= (or b!246125 b!246127) bm!23002))

(assert (= (or b!246123 b!246128) bm!23003))

(assert (=> bm!23003 m!263217))

(declare-fun m!263537 () Bool)

(assert (=> bm!23002 m!263537))

(assert (=> d!60291 m!263259))

(declare-fun m!263539 () Bool)

(assert (=> b!246122 m!263539))

(declare-fun m!263541 () Bool)

(assert (=> b!246121 m!263541))

(assert (=> d!60233 d!60291))

(assert (=> d!60233 d!60239))

(declare-fun d!60293 () Bool)

(declare-fun e!159667 () Bool)

(assert (=> d!60293 e!159667))

(declare-fun res!120687 () Bool)

(assert (=> d!60293 (=> (not res!120687) (not e!159667))))

(declare-fun lt!123272 () ListLongMap!3703)

(assert (=> d!60293 (= res!120687 (contains!1776 lt!123272 (_1!2406 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504)))))))

(declare-fun lt!123270 () List!3672)

(assert (=> d!60293 (= lt!123272 (ListLongMap!3704 lt!123270))))

(declare-fun lt!123269 () Unit!7585)

(declare-fun lt!123271 () Unit!7585)

(assert (=> d!60293 (= lt!123269 lt!123271)))

(assert (=> d!60293 (= (getValueByKey!289 lt!123270 (_1!2406 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504)))) (Some!294 (_2!2406 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504)))))))

(assert (=> d!60293 (= lt!123271 (lemmaContainsTupThenGetReturnValue!156 lt!123270 (_1!2406 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504))) (_2!2406 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504)))))))

(assert (=> d!60293 (= lt!123270 (insertStrictlySorted!159 (toList!1867 lt!123173) (_1!2406 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504))) (_2!2406 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504)))))))

(assert (=> d!60293 (= (+!658 lt!123173 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504))) lt!123272)))

(declare-fun b!246129 () Bool)

(declare-fun res!120686 () Bool)

(assert (=> b!246129 (=> (not res!120686) (not e!159667))))

(assert (=> b!246129 (= res!120686 (= (getValueByKey!289 (toList!1867 lt!123272) (_1!2406 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504)))) (Some!294 (_2!2406 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504))))))))

(declare-fun b!246130 () Bool)

(assert (=> b!246130 (= e!159667 (contains!1779 (toList!1867 lt!123272) (tuple2!4791 lt!123153 (minValue!4388 thiss!1504))))))

(assert (= (and d!60293 res!120687) b!246129))

(assert (= (and b!246129 res!120686) b!246130))

(declare-fun m!263543 () Bool)

(assert (=> d!60293 m!263543))

(declare-fun m!263545 () Bool)

(assert (=> d!60293 m!263545))

(declare-fun m!263547 () Bool)

(assert (=> d!60293 m!263547))

(declare-fun m!263549 () Bool)

(assert (=> d!60293 m!263549))

(declare-fun m!263551 () Bool)

(assert (=> b!246129 m!263551))

(declare-fun m!263553 () Bool)

(assert (=> b!246130 m!263553))

(assert (=> b!245862 d!60293))

(declare-fun d!60295 () Bool)

(declare-fun e!159668 () Bool)

(assert (=> d!60295 e!159668))

(declare-fun res!120689 () Bool)

(assert (=> d!60295 (=> (not res!120689) (not e!159668))))

(declare-fun lt!123276 () ListLongMap!3703)

(assert (=> d!60295 (= res!120689 (contains!1776 lt!123276 (_1!2406 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504)))))))

(declare-fun lt!123274 () List!3672)

(assert (=> d!60295 (= lt!123276 (ListLongMap!3704 lt!123274))))

(declare-fun lt!123273 () Unit!7585)

(declare-fun lt!123275 () Unit!7585)

(assert (=> d!60295 (= lt!123273 lt!123275)))

(assert (=> d!60295 (= (getValueByKey!289 lt!123274 (_1!2406 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504)))) (Some!294 (_2!2406 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504)))))))

(assert (=> d!60295 (= lt!123275 (lemmaContainsTupThenGetReturnValue!156 lt!123274 (_1!2406 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504))) (_2!2406 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504)))))))

(assert (=> d!60295 (= lt!123274 (insertStrictlySorted!159 (toList!1867 lt!123157) (_1!2406 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504))) (_2!2406 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504)))))))

(assert (=> d!60295 (= (+!658 lt!123157 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504))) lt!123276)))

(declare-fun b!246131 () Bool)

(declare-fun res!120688 () Bool)

(assert (=> b!246131 (=> (not res!120688) (not e!159668))))

(assert (=> b!246131 (= res!120688 (= (getValueByKey!289 (toList!1867 lt!123276) (_1!2406 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504)))) (Some!294 (_2!2406 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504))))))))

(declare-fun b!246132 () Bool)

(assert (=> b!246132 (= e!159668 (contains!1779 (toList!1867 lt!123276) (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504))))))

(assert (= (and d!60295 res!120689) b!246131))

(assert (= (and b!246131 res!120688) b!246132))

(declare-fun m!263555 () Bool)

(assert (=> d!60295 m!263555))

(declare-fun m!263557 () Bool)

(assert (=> d!60295 m!263557))

(declare-fun m!263559 () Bool)

(assert (=> d!60295 m!263559))

(declare-fun m!263561 () Bool)

(assert (=> d!60295 m!263561))

(declare-fun m!263563 () Bool)

(assert (=> b!246131 m!263563))

(declare-fun m!263565 () Bool)

(assert (=> b!246132 m!263565))

(assert (=> b!245862 d!60295))

(declare-fun d!60297 () Bool)

(assert (=> d!60297 (= (apply!231 (+!658 lt!123157 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504))) lt!123161) (get!2958 (getValueByKey!289 (toList!1867 (+!658 lt!123157 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504)))) lt!123161)))))

(declare-fun bs!8899 () Bool)

(assert (= bs!8899 d!60297))

(declare-fun m!263567 () Bool)

(assert (=> bs!8899 m!263567))

(assert (=> bs!8899 m!263567))

(declare-fun m!263569 () Bool)

(assert (=> bs!8899 m!263569))

(assert (=> b!245862 d!60297))

(declare-fun d!60299 () Bool)

(assert (=> d!60299 (= (apply!231 lt!123171 lt!123156) (get!2958 (getValueByKey!289 (toList!1867 lt!123171) lt!123156)))))

(declare-fun bs!8900 () Bool)

(assert (= bs!8900 d!60299))

(declare-fun m!263571 () Bool)

(assert (=> bs!8900 m!263571))

(assert (=> bs!8900 m!263571))

(declare-fun m!263573 () Bool)

(assert (=> bs!8900 m!263573))

(assert (=> b!245862 d!60299))

(declare-fun d!60301 () Bool)

(assert (=> d!60301 (= (apply!231 lt!123157 lt!123161) (get!2958 (getValueByKey!289 (toList!1867 lt!123157) lt!123161)))))

(declare-fun bs!8901 () Bool)

(assert (= bs!8901 d!60301))

(declare-fun m!263575 () Bool)

(assert (=> bs!8901 m!263575))

(assert (=> bs!8901 m!263575))

(declare-fun m!263577 () Bool)

(assert (=> bs!8901 m!263577))

(assert (=> b!245862 d!60301))

(declare-fun d!60303 () Bool)

(declare-fun e!159669 () Bool)

(assert (=> d!60303 e!159669))

(declare-fun res!120691 () Bool)

(assert (=> d!60303 (=> (not res!120691) (not e!159669))))

(declare-fun lt!123280 () ListLongMap!3703)

(assert (=> d!60303 (= res!120691 (contains!1776 lt!123280 (_1!2406 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504)))))))

(declare-fun lt!123278 () List!3672)

(assert (=> d!60303 (= lt!123280 (ListLongMap!3704 lt!123278))))

(declare-fun lt!123277 () Unit!7585)

(declare-fun lt!123279 () Unit!7585)

(assert (=> d!60303 (= lt!123277 lt!123279)))

(assert (=> d!60303 (= (getValueByKey!289 lt!123278 (_1!2406 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504)))) (Some!294 (_2!2406 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504)))))))

(assert (=> d!60303 (= lt!123279 (lemmaContainsTupThenGetReturnValue!156 lt!123278 (_1!2406 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504))) (_2!2406 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504)))))))

(assert (=> d!60303 (= lt!123278 (insertStrictlySorted!159 (toList!1867 lt!123171) (_1!2406 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504))) (_2!2406 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504)))))))

(assert (=> d!60303 (= (+!658 lt!123171 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504))) lt!123280)))

(declare-fun b!246133 () Bool)

(declare-fun res!120690 () Bool)

(assert (=> b!246133 (=> (not res!120690) (not e!159669))))

(assert (=> b!246133 (= res!120690 (= (getValueByKey!289 (toList!1867 lt!123280) (_1!2406 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504)))) (Some!294 (_2!2406 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504))))))))

(declare-fun b!246134 () Bool)

(assert (=> b!246134 (= e!159669 (contains!1779 (toList!1867 lt!123280) (tuple2!4791 lt!123162 (minValue!4388 thiss!1504))))))

(assert (= (and d!60303 res!120691) b!246133))

(assert (= (and b!246133 res!120690) b!246134))

(declare-fun m!263579 () Bool)

(assert (=> d!60303 m!263579))

(declare-fun m!263581 () Bool)

(assert (=> d!60303 m!263581))

(declare-fun m!263583 () Bool)

(assert (=> d!60303 m!263583))

(declare-fun m!263585 () Bool)

(assert (=> d!60303 m!263585))

(declare-fun m!263587 () Bool)

(assert (=> b!246133 m!263587))

(declare-fun m!263589 () Bool)

(assert (=> b!246134 m!263589))

(assert (=> b!245862 d!60303))

(declare-fun d!60305 () Bool)

(assert (=> d!60305 (= (apply!231 (+!658 lt!123173 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504))) lt!123170) (get!2958 (getValueByKey!289 (toList!1867 (+!658 lt!123173 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504)))) lt!123170)))))

(declare-fun bs!8902 () Bool)

(assert (= bs!8902 d!60305))

(declare-fun m!263591 () Bool)

(assert (=> bs!8902 m!263591))

(assert (=> bs!8902 m!263591))

(declare-fun m!263593 () Bool)

(assert (=> bs!8902 m!263593))

(assert (=> b!245862 d!60305))

(declare-fun d!60307 () Bool)

(assert (=> d!60307 (= (apply!231 lt!123173 lt!123170) (get!2958 (getValueByKey!289 (toList!1867 lt!123173) lt!123170)))))

(declare-fun bs!8903 () Bool)

(assert (= bs!8903 d!60307))

(declare-fun m!263595 () Bool)

(assert (=> bs!8903 m!263595))

(assert (=> bs!8903 m!263595))

(declare-fun m!263597 () Bool)

(assert (=> bs!8903 m!263597))

(assert (=> b!245862 d!60307))

(declare-fun d!60309 () Bool)

(assert (=> d!60309 (= (apply!231 (+!658 lt!123173 (tuple2!4791 lt!123153 (minValue!4388 thiss!1504))) lt!123170) (apply!231 lt!123173 lt!123170))))

(declare-fun lt!123283 () Unit!7585)

(declare-fun choose!1153 (ListLongMap!3703 (_ BitVec 64) V!8211 (_ BitVec 64)) Unit!7585)

(assert (=> d!60309 (= lt!123283 (choose!1153 lt!123173 lt!123153 (minValue!4388 thiss!1504) lt!123170))))

(declare-fun e!159672 () Bool)

(assert (=> d!60309 e!159672))

(declare-fun res!120694 () Bool)

(assert (=> d!60309 (=> (not res!120694) (not e!159672))))

(assert (=> d!60309 (= res!120694 (contains!1776 lt!123173 lt!123170))))

(assert (=> d!60309 (= (addApplyDifferent!207 lt!123173 lt!123153 (minValue!4388 thiss!1504) lt!123170) lt!123283)))

(declare-fun b!246138 () Bool)

(assert (=> b!246138 (= e!159672 (not (= lt!123170 lt!123153)))))

(assert (= (and d!60309 res!120694) b!246138))

(assert (=> d!60309 m!263353))

(assert (=> d!60309 m!263363))

(declare-fun m!263599 () Bool)

(assert (=> d!60309 m!263599))

(declare-fun m!263601 () Bool)

(assert (=> d!60309 m!263601))

(assert (=> d!60309 m!263367))

(assert (=> d!60309 m!263353))

(assert (=> b!245862 d!60309))

(declare-fun d!60311 () Bool)

(assert (=> d!60311 (= (apply!231 (+!658 lt!123171 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504))) lt!123156) (get!2958 (getValueByKey!289 (toList!1867 (+!658 lt!123171 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504)))) lt!123156)))))

(declare-fun bs!8904 () Bool)

(assert (= bs!8904 d!60311))

(declare-fun m!263603 () Bool)

(assert (=> bs!8904 m!263603))

(assert (=> bs!8904 m!263603))

(declare-fun m!263605 () Bool)

(assert (=> bs!8904 m!263605))

(assert (=> b!245862 d!60311))

(declare-fun d!60313 () Bool)

(assert (=> d!60313 (= (apply!231 (+!658 lt!123157 (tuple2!4791 lt!123168 (zeroValue!4388 thiss!1504))) lt!123161) (apply!231 lt!123157 lt!123161))))

(declare-fun lt!123284 () Unit!7585)

(assert (=> d!60313 (= lt!123284 (choose!1153 lt!123157 lt!123168 (zeroValue!4388 thiss!1504) lt!123161))))

(declare-fun e!159673 () Bool)

(assert (=> d!60313 e!159673))

(declare-fun res!120695 () Bool)

(assert (=> d!60313 (=> (not res!120695) (not e!159673))))

(assert (=> d!60313 (= res!120695 (contains!1776 lt!123157 lt!123161))))

(assert (=> d!60313 (= (addApplyDifferent!207 lt!123157 lt!123168 (zeroValue!4388 thiss!1504) lt!123161) lt!123284)))

(declare-fun b!246139 () Bool)

(assert (=> b!246139 (= e!159673 (not (= lt!123161 lt!123168)))))

(assert (= (and d!60313 res!120695) b!246139))

(assert (=> d!60313 m!263371))

(assert (=> d!60313 m!263375))

(declare-fun m!263607 () Bool)

(assert (=> d!60313 m!263607))

(declare-fun m!263609 () Bool)

(assert (=> d!60313 m!263609))

(assert (=> d!60313 m!263351))

(assert (=> d!60313 m!263371))

(assert (=> b!245862 d!60313))

(declare-fun d!60315 () Bool)

(assert (=> d!60315 (= (apply!231 (+!658 lt!123171 (tuple2!4791 lt!123162 (minValue!4388 thiss!1504))) lt!123156) (apply!231 lt!123171 lt!123156))))

(declare-fun lt!123285 () Unit!7585)

(assert (=> d!60315 (= lt!123285 (choose!1153 lt!123171 lt!123162 (minValue!4388 thiss!1504) lt!123156))))

(declare-fun e!159674 () Bool)

(assert (=> d!60315 e!159674))

(declare-fun res!120696 () Bool)

(assert (=> d!60315 (=> (not res!120696) (not e!159674))))

(assert (=> d!60315 (= res!120696 (contains!1776 lt!123171 lt!123156))))

(assert (=> d!60315 (= (addApplyDifferent!207 lt!123171 lt!123162 (minValue!4388 thiss!1504) lt!123156) lt!123285)))

(declare-fun b!246140 () Bool)

(assert (=> b!246140 (= e!159674 (not (= lt!123156 lt!123162)))))

(assert (= (and d!60315 res!120696) b!246140))

(assert (=> d!60315 m!263357))

(assert (=> d!60315 m!263359))

(declare-fun m!263611 () Bool)

(assert (=> d!60315 m!263611))

(declare-fun m!263613 () Bool)

(assert (=> d!60315 m!263613))

(assert (=> d!60315 m!263369))

(assert (=> d!60315 m!263357))

(assert (=> b!245862 d!60315))

(declare-fun d!60317 () Bool)

(declare-fun e!159675 () Bool)

(assert (=> d!60317 e!159675))

(declare-fun res!120697 () Bool)

(assert (=> d!60317 (=> res!120697 e!159675)))

(declare-fun lt!123289 () Bool)

(assert (=> d!60317 (= res!120697 (not lt!123289))))

(declare-fun lt!123287 () Bool)

(assert (=> d!60317 (= lt!123289 lt!123287)))

(declare-fun lt!123286 () Unit!7585)

(declare-fun e!159676 () Unit!7585)

(assert (=> d!60317 (= lt!123286 e!159676)))

(declare-fun c!41147 () Bool)

(assert (=> d!60317 (= c!41147 lt!123287)))

(assert (=> d!60317 (= lt!123287 (containsKey!281 (toList!1867 (+!658 lt!123155 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504)))) lt!123165))))

(assert (=> d!60317 (= (contains!1776 (+!658 lt!123155 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504))) lt!123165) lt!123289)))

(declare-fun b!246141 () Bool)

(declare-fun lt!123288 () Unit!7585)

(assert (=> b!246141 (= e!159676 lt!123288)))

(assert (=> b!246141 (= lt!123288 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1867 (+!658 lt!123155 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504)))) lt!123165))))

(assert (=> b!246141 (isDefined!230 (getValueByKey!289 (toList!1867 (+!658 lt!123155 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504)))) lt!123165))))

(declare-fun b!246142 () Bool)

(declare-fun Unit!7599 () Unit!7585)

(assert (=> b!246142 (= e!159676 Unit!7599)))

(declare-fun b!246143 () Bool)

(assert (=> b!246143 (= e!159675 (isDefined!230 (getValueByKey!289 (toList!1867 (+!658 lt!123155 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504)))) lt!123165)))))

(assert (= (and d!60317 c!41147) b!246141))

(assert (= (and d!60317 (not c!41147)) b!246142))

(assert (= (and d!60317 (not res!120697)) b!246143))

(declare-fun m!263615 () Bool)

(assert (=> d!60317 m!263615))

(declare-fun m!263617 () Bool)

(assert (=> b!246141 m!263617))

(declare-fun m!263619 () Bool)

(assert (=> b!246141 m!263619))

(assert (=> b!246141 m!263619))

(declare-fun m!263621 () Bool)

(assert (=> b!246141 m!263621))

(assert (=> b!246143 m!263619))

(assert (=> b!246143 m!263619))

(assert (=> b!246143 m!263621))

(assert (=> b!245862 d!60317))

(assert (=> b!245862 d!60265))

(declare-fun d!60319 () Bool)

(declare-fun e!159677 () Bool)

(assert (=> d!60319 e!159677))

(declare-fun res!120699 () Bool)

(assert (=> d!60319 (=> (not res!120699) (not e!159677))))

(declare-fun lt!123293 () ListLongMap!3703)

(assert (=> d!60319 (= res!120699 (contains!1776 lt!123293 (_1!2406 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504)))))))

(declare-fun lt!123291 () List!3672)

(assert (=> d!60319 (= lt!123293 (ListLongMap!3704 lt!123291))))

(declare-fun lt!123290 () Unit!7585)

(declare-fun lt!123292 () Unit!7585)

(assert (=> d!60319 (= lt!123290 lt!123292)))

(assert (=> d!60319 (= (getValueByKey!289 lt!123291 (_1!2406 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504)))) (Some!294 (_2!2406 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504)))))))

(assert (=> d!60319 (= lt!123292 (lemmaContainsTupThenGetReturnValue!156 lt!123291 (_1!2406 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504))) (_2!2406 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504)))))))

(assert (=> d!60319 (= lt!123291 (insertStrictlySorted!159 (toList!1867 lt!123155) (_1!2406 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504))) (_2!2406 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504)))))))

(assert (=> d!60319 (= (+!658 lt!123155 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504))) lt!123293)))

(declare-fun b!246144 () Bool)

(declare-fun res!120698 () Bool)

(assert (=> b!246144 (=> (not res!120698) (not e!159677))))

(assert (=> b!246144 (= res!120698 (= (getValueByKey!289 (toList!1867 lt!123293) (_1!2406 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504)))) (Some!294 (_2!2406 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504))))))))

(declare-fun b!246145 () Bool)

(assert (=> b!246145 (= e!159677 (contains!1779 (toList!1867 lt!123293) (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504))))))

(assert (= (and d!60319 res!120699) b!246144))

(assert (= (and b!246144 res!120698) b!246145))

(declare-fun m!263623 () Bool)

(assert (=> d!60319 m!263623))

(declare-fun m!263625 () Bool)

(assert (=> d!60319 m!263625))

(declare-fun m!263627 () Bool)

(assert (=> d!60319 m!263627))

(declare-fun m!263629 () Bool)

(assert (=> d!60319 m!263629))

(declare-fun m!263631 () Bool)

(assert (=> b!246144 m!263631))

(declare-fun m!263633 () Bool)

(assert (=> b!246145 m!263633))

(assert (=> b!245862 d!60319))

(declare-fun d!60321 () Bool)

(assert (=> d!60321 (contains!1776 (+!658 lt!123155 (tuple2!4791 lt!123159 (zeroValue!4388 thiss!1504))) lt!123165)))

(declare-fun lt!123296 () Unit!7585)

(declare-fun choose!1154 (ListLongMap!3703 (_ BitVec 64) V!8211 (_ BitVec 64)) Unit!7585)

(assert (=> d!60321 (= lt!123296 (choose!1154 lt!123155 lt!123159 (zeroValue!4388 thiss!1504) lt!123165))))

(assert (=> d!60321 (contains!1776 lt!123155 lt!123165)))

(assert (=> d!60321 (= (addStillContains!207 lt!123155 lt!123159 (zeroValue!4388 thiss!1504) lt!123165) lt!123296)))

(declare-fun bs!8905 () Bool)

(assert (= bs!8905 d!60321))

(assert (=> bs!8905 m!263349))

(assert (=> bs!8905 m!263349))

(assert (=> bs!8905 m!263373))

(declare-fun m!263635 () Bool)

(assert (=> bs!8905 m!263635))

(declare-fun m!263637 () Bool)

(assert (=> bs!8905 m!263637))

(assert (=> b!245862 d!60321))

(declare-fun d!60323 () Bool)

(declare-fun lt!123299 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!163 (List!3673) (InoxSet (_ BitVec 64)))

(assert (=> d!60323 (= lt!123299 (select (content!163 Nil!3670) (select (arr!5765 lt!123058) #b00000000000000000000000000000000)))))

(declare-fun e!159683 () Bool)

(assert (=> d!60323 (= lt!123299 e!159683)))

(declare-fun res!120705 () Bool)

(assert (=> d!60323 (=> (not res!120705) (not e!159683))))

(assert (=> d!60323 (= res!120705 ((_ is Cons!3669) Nil!3670))))

(assert (=> d!60323 (= (contains!1778 Nil!3670 (select (arr!5765 lt!123058) #b00000000000000000000000000000000)) lt!123299)))

(declare-fun b!246151 () Bool)

(declare-fun e!159682 () Bool)

(assert (=> b!246151 (= e!159683 e!159682)))

(declare-fun res!120704 () Bool)

(assert (=> b!246151 (=> res!120704 e!159682)))

(assert (=> b!246151 (= res!120704 (= (h!4326 Nil!3670) (select (arr!5765 lt!123058) #b00000000000000000000000000000000)))))

(declare-fun b!246152 () Bool)

(assert (=> b!246152 (= e!159682 (contains!1778 (t!8688 Nil!3670) (select (arr!5765 lt!123058) #b00000000000000000000000000000000)))))

(assert (= (and d!60323 res!120705) b!246151))

(assert (= (and b!246151 (not res!120704)) b!246152))

(declare-fun m!263639 () Bool)

(assert (=> d!60323 m!263639))

(assert (=> d!60323 m!263415))

(declare-fun m!263641 () Bool)

(assert (=> d!60323 m!263641))

(assert (=> b!246152 m!263415))

(declare-fun m!263643 () Bool)

(assert (=> b!246152 m!263643))

(assert (=> b!245968 d!60323))

(declare-fun b!246161 () Bool)

(declare-fun res!120715 () Bool)

(declare-fun e!159686 () Bool)

(assert (=> b!246161 (=> (not res!120715) (not e!159686))))

(assert (=> b!246161 (= res!120715 (and (= (size!6106 (_values!4530 thiss!1504)) (bvadd (mask!10661 thiss!1504) #b00000000000000000000000000000001)) (= (size!6107 (_keys!6662 thiss!1504)) (size!6106 (_values!4530 thiss!1504))) (bvsge (_size!1867 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1867 thiss!1504) (bvadd (mask!10661 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!60325 () Bool)

(declare-fun res!120717 () Bool)

(assert (=> d!60325 (=> (not res!120717) (not e!159686))))

(assert (=> d!60325 (= res!120717 (validMask!0 (mask!10661 thiss!1504)))))

(assert (=> d!60325 (= (simpleValid!254 thiss!1504) e!159686)))

(declare-fun b!246162 () Bool)

(declare-fun res!120714 () Bool)

(assert (=> b!246162 (=> (not res!120714) (not e!159686))))

(declare-fun size!6110 (LongMapFixedSize!3636) (_ BitVec 32))

(assert (=> b!246162 (= res!120714 (bvsge (size!6110 thiss!1504) (_size!1867 thiss!1504)))))

(declare-fun b!246163 () Bool)

(declare-fun res!120716 () Bool)

(assert (=> b!246163 (=> (not res!120716) (not e!159686))))

(assert (=> b!246163 (= res!120716 (= (size!6110 thiss!1504) (bvadd (_size!1867 thiss!1504) (bvsdiv (bvadd (extraKeys!4284 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!246164 () Bool)

(assert (=> b!246164 (= e!159686 (and (bvsge (extraKeys!4284 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4284 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1867 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!60325 res!120717) b!246161))

(assert (= (and b!246161 res!120715) b!246162))

(assert (= (and b!246162 res!120714) b!246163))

(assert (= (and b!246163 res!120716) b!246164))

(assert (=> d!60325 m!263257))

(declare-fun m!263645 () Bool)

(assert (=> b!246162 m!263645))

(assert (=> b!246163 m!263645))

(assert (=> d!60251 d!60325))

(declare-fun d!60327 () Bool)

(assert (=> d!60327 (= (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) index!297)) (and (not (= (select (arr!5765 (_keys!6662 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5765 (_keys!6662 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245935 d!60327))

(declare-fun d!60329 () Bool)

(declare-fun e!159687 () Bool)

(assert (=> d!60329 e!159687))

(declare-fun res!120719 () Bool)

(assert (=> d!60329 (=> (not res!120719) (not e!159687))))

(declare-fun lt!123303 () ListLongMap!3703)

(assert (=> d!60329 (= res!120719 (contains!1776 lt!123303 (_1!2406 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))))))

(declare-fun lt!123301 () List!3672)

(assert (=> d!60329 (= lt!123303 (ListLongMap!3704 lt!123301))))

(declare-fun lt!123300 () Unit!7585)

(declare-fun lt!123302 () Unit!7585)

(assert (=> d!60329 (= lt!123300 lt!123302)))

(assert (=> d!60329 (= (getValueByKey!289 lt!123301 (_1!2406 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))) (Some!294 (_2!2406 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))))))

(assert (=> d!60329 (= lt!123302 (lemmaContainsTupThenGetReturnValue!156 lt!123301 (_1!2406 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))) (_2!2406 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))))))

(assert (=> d!60329 (= lt!123301 (insertStrictlySorted!159 (toList!1867 call!22973) (_1!2406 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))) (_2!2406 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))))))

(assert (=> d!60329 (= (+!658 call!22973 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))) lt!123303)))

(declare-fun b!246165 () Bool)

(declare-fun res!120718 () Bool)

(assert (=> b!246165 (=> (not res!120718) (not e!159687))))

(assert (=> b!246165 (= res!120718 (= (getValueByKey!289 (toList!1867 lt!123303) (_1!2406 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504)))) (Some!294 (_2!2406 (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))))))))

(declare-fun b!246166 () Bool)

(assert (=> b!246166 (= e!159687 (contains!1779 (toList!1867 lt!123303) (tuple2!4791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4388 thiss!1504))))))

(assert (= (and d!60329 res!120719) b!246165))

(assert (= (and b!246165 res!120718) b!246166))

(declare-fun m!263647 () Bool)

(assert (=> d!60329 m!263647))

(declare-fun m!263649 () Bool)

(assert (=> d!60329 m!263649))

(declare-fun m!263651 () Bool)

(assert (=> d!60329 m!263651))

(declare-fun m!263653 () Bool)

(assert (=> d!60329 m!263653))

(declare-fun m!263655 () Bool)

(assert (=> b!246165 m!263655))

(declare-fun m!263657 () Bool)

(assert (=> b!246166 m!263657))

(assert (=> b!245861 d!60329))

(assert (=> b!245813 d!60257))

(assert (=> b!245813 d!60259))

(declare-fun d!60331 () Bool)

(assert (=> d!60331 (= (validKeyInArray!0 (select (arr!5765 lt!123058) #b00000000000000000000000000000000)) (and (not (= (select (arr!5765 lt!123058) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5765 lt!123058) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245954 d!60331))

(declare-fun d!60333 () Bool)

(assert (=> d!60333 (= (arrayCountValidKeys!0 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))) #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6662 thiss!1504) #b00000000000000000000000000000000 (size!6107 (_keys!6662 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!60333 true))

(declare-fun _$84!21 () Unit!7585)

(assert (=> d!60333 (= (choose!1 (_keys!6662 thiss!1504) index!297 key!932) _$84!21)))

(declare-fun bs!8906 () Bool)

(assert (= bs!8906 d!60333))

(assert (=> bs!8906 m!263249))

(assert (=> bs!8906 m!263407))

(assert (=> bs!8906 m!263251))

(assert (=> d!60235 d!60333))

(declare-fun bm!23004 () Bool)

(declare-fun call!23007 () (_ BitVec 32))

(assert (=> bm!23004 (= call!23007 (arrayCountValidKeys!0 (_keys!6662 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!246167 () Bool)

(declare-fun e!159689 () (_ BitVec 32))

(assert (=> b!246167 (= e!159689 call!23007)))

(declare-fun b!246169 () Bool)

(assert (=> b!246169 (= e!159689 (bvadd #b00000000000000000000000000000001 call!23007))))

(declare-fun b!246170 () Bool)

(declare-fun e!159688 () (_ BitVec 32))

(assert (=> b!246170 (= e!159688 e!159689)))

(declare-fun c!41148 () Bool)

(assert (=> b!246170 (= c!41148 (validKeyInArray!0 (select (arr!5765 (_keys!6662 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!60335 () Bool)

(declare-fun lt!123304 () (_ BitVec 32))

(assert (=> d!60335 (and (bvsge lt!123304 #b00000000000000000000000000000000) (bvsle lt!123304 (bvsub (size!6107 (_keys!6662 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60335 (= lt!123304 e!159688)))

(declare-fun c!41149 () Bool)

(assert (=> d!60335 (= c!41149 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60335 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6107 (_keys!6662 thiss!1504)) (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60335 (= (arrayCountValidKeys!0 (_keys!6662 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))) lt!123304)))

(declare-fun b!246168 () Bool)

(assert (=> b!246168 (= e!159688 #b00000000000000000000000000000000)))

(assert (= (and d!60335 c!41149) b!246168))

(assert (= (and d!60335 (not c!41149)) b!246170))

(assert (= (and b!246170 c!41148) b!246169))

(assert (= (and b!246170 (not c!41148)) b!246167))

(assert (= (or b!246169 b!246167) bm!23004))

(declare-fun m!263659 () Bool)

(assert (=> bm!23004 m!263659))

(assert (=> b!246170 m!263453))

(assert (=> b!246170 m!263453))

(declare-fun m!263661 () Bool)

(assert (=> b!246170 m!263661))

(assert (=> bm!22984 d!60335))

(declare-fun d!60337 () Bool)

(declare-fun e!159690 () Bool)

(assert (=> d!60337 e!159690))

(declare-fun res!120720 () Bool)

(assert (=> d!60337 (=> res!120720 e!159690)))

(declare-fun lt!123308 () Bool)

(assert (=> d!60337 (= res!120720 (not lt!123308))))

(declare-fun lt!123306 () Bool)

(assert (=> d!60337 (= lt!123308 lt!123306)))

(declare-fun lt!123305 () Unit!7585)

(declare-fun e!159691 () Unit!7585)

(assert (=> d!60337 (= lt!123305 e!159691)))

(declare-fun c!41150 () Bool)

(assert (=> d!60337 (= c!41150 lt!123306)))

(assert (=> d!60337 (= lt!123306 (containsKey!281 (toList!1867 lt!123158) (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60337 (= (contains!1776 lt!123158 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)) lt!123308)))

(declare-fun b!246171 () Bool)

(declare-fun lt!123307 () Unit!7585)

(assert (=> b!246171 (= e!159691 lt!123307)))

(assert (=> b!246171 (= lt!123307 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1867 lt!123158) (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246171 (isDefined!230 (getValueByKey!289 (toList!1867 lt!123158) (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246172 () Bool)

(declare-fun Unit!7600 () Unit!7585)

(assert (=> b!246172 (= e!159691 Unit!7600)))

(declare-fun b!246173 () Bool)

(assert (=> b!246173 (= e!159690 (isDefined!230 (getValueByKey!289 (toList!1867 lt!123158) (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!60337 c!41150) b!246171))

(assert (= (and d!60337 (not c!41150)) b!246172))

(assert (= (and d!60337 (not res!120720)) b!246173))

(assert (=> d!60337 m!263319))

(declare-fun m!263663 () Bool)

(assert (=> d!60337 m!263663))

(assert (=> b!246171 m!263319))

(declare-fun m!263665 () Bool)

(assert (=> b!246171 m!263665))

(assert (=> b!246171 m!263319))

(declare-fun m!263667 () Bool)

(assert (=> b!246171 m!263667))

(assert (=> b!246171 m!263667))

(declare-fun m!263669 () Bool)

(assert (=> b!246171 m!263669))

(assert (=> b!246173 m!263319))

(assert (=> b!246173 m!263667))

(assert (=> b!246173 m!263667))

(assert (=> b!246173 m!263669))

(assert (=> b!245865 d!60337))

(assert (=> b!245866 d!60271))

(declare-fun bm!23005 () Bool)

(declare-fun call!23008 () (_ BitVec 32))

(assert (=> bm!23005 (= call!23008 (arrayCountValidKeys!0 lt!123058 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun b!246174 () Bool)

(declare-fun e!159693 () (_ BitVec 32))

(assert (=> b!246174 (= e!159693 call!23008)))

(declare-fun b!246176 () Bool)

(assert (=> b!246176 (= e!159693 (bvadd #b00000000000000000000000000000001 call!23008))))

(declare-fun b!246177 () Bool)

(declare-fun e!159692 () (_ BitVec 32))

(assert (=> b!246177 (= e!159692 e!159693)))

(declare-fun c!41151 () Bool)

(assert (=> b!246177 (= c!41151 (validKeyInArray!0 (select (arr!5765 lt!123058) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!60339 () Bool)

(declare-fun lt!123309 () (_ BitVec 32))

(assert (=> d!60339 (and (bvsge lt!123309 #b00000000000000000000000000000000) (bvsle lt!123309 (bvsub (size!6107 lt!123058) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60339 (= lt!123309 e!159692)))

(declare-fun c!41152 () Bool)

(assert (=> d!60339 (= c!41152 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))))))

(assert (=> d!60339 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6107 (_keys!6662 thiss!1504)) (size!6107 lt!123058)))))

(assert (=> d!60339 (= (arrayCountValidKeys!0 lt!123058 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6107 (_keys!6662 thiss!1504))) lt!123309)))

(declare-fun b!246175 () Bool)

(assert (=> b!246175 (= e!159692 #b00000000000000000000000000000000)))

(assert (= (and d!60339 c!41152) b!246175))

(assert (= (and d!60339 (not c!41152)) b!246177))

(assert (= (and b!246177 c!41151) b!246176))

(assert (= (and b!246177 (not c!41151)) b!246174))

(assert (= (or b!246176 b!246174) bm!23005))

(declare-fun m!263671 () Bool)

(assert (=> bm!23005 m!263671))

(assert (=> b!246177 m!263529))

(assert (=> b!246177 m!263529))

(assert (=> b!246177 m!263535))

(assert (=> bm!22985 d!60339))

(declare-fun d!60341 () Bool)

(assert (=> d!60341 (= (apply!231 lt!123158 (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000)) (get!2958 (getValueByKey!289 (toList!1867 lt!123158) (select (arr!5765 (_keys!6662 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8907 () Bool)

(assert (= bs!8907 d!60341))

(assert (=> bs!8907 m!263319))

(assert (=> bs!8907 m!263667))

(assert (=> bs!8907 m!263667))

(declare-fun m!263673 () Bool)

(assert (=> bs!8907 m!263673))

(assert (=> b!245864 d!60341))

(declare-fun d!60343 () Bool)

(declare-fun c!41155 () Bool)

(assert (=> d!60343 (= c!41155 ((_ is ValueCellFull!2868) (select (arr!5764 (_values!4530 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!159696 () V!8211)

(assert (=> d!60343 (= (get!2957 (select (arr!5764 (_values!4530 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4547 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!159696)))

(declare-fun b!246182 () Bool)

(declare-fun get!2959 (ValueCell!2868 V!8211) V!8211)

(assert (=> b!246182 (= e!159696 (get!2959 (select (arr!5764 (_values!4530 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4547 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!246183 () Bool)

(declare-fun get!2960 (ValueCell!2868 V!8211) V!8211)

(assert (=> b!246183 (= e!159696 (get!2960 (select (arr!5764 (_values!4530 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4547 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60343 c!41155) b!246182))

(assert (= (and d!60343 (not c!41155)) b!246183))

(assert (=> b!246182 m!263335))

(assert (=> b!246182 m!263333))

(declare-fun m!263675 () Bool)

(assert (=> b!246182 m!263675))

(assert (=> b!246183 m!263335))

(assert (=> b!246183 m!263333))

(declare-fun m!263677 () Bool)

(assert (=> b!246183 m!263677))

(assert (=> b!245864 d!60343))

(declare-fun d!60345 () Bool)

(declare-fun res!120725 () Bool)

(declare-fun e!159701 () Bool)

(assert (=> d!60345 (=> res!120725 e!159701)))

(assert (=> d!60345 (= res!120725 (and ((_ is Cons!3668) (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))) (= (_1!2406 (h!4325 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))))) key!932)))))

(assert (=> d!60345 (= (containsKey!281 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))) key!932) e!159701)))

(declare-fun b!246188 () Bool)

(declare-fun e!159702 () Bool)

(assert (=> b!246188 (= e!159701 e!159702)))

(declare-fun res!120726 () Bool)

(assert (=> b!246188 (=> (not res!120726) (not e!159702))))

(assert (=> b!246188 (= res!120726 (and (or (not ((_ is Cons!3668) (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))))) (bvsle (_1!2406 (h!4325 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))))) key!932)) ((_ is Cons!3668) (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))) (bvslt (_1!2406 (h!4325 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504))))) key!932)))))

(declare-fun b!246189 () Bool)

(assert (=> b!246189 (= e!159702 (containsKey!281 (t!8687 (toList!1867 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)))) key!932))))

(assert (= (and d!60345 (not res!120725)) b!246188))

(assert (= (and b!246188 res!120726) b!246189))

(declare-fun m!263679 () Bool)

(assert (=> b!246189 m!263679))

(assert (=> d!60223 d!60345))

(assert (=> b!245970 d!60331))

(assert (=> b!245971 d!60331))

(declare-fun d!60347 () Bool)

(declare-fun res!120727 () Bool)

(declare-fun e!159703 () Bool)

(assert (=> d!60347 (=> res!120727 e!159703)))

(assert (=> d!60347 (= res!120727 (bvsge #b00000000000000000000000000000000 (size!6107 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))))))))

(assert (=> d!60347 (= (arrayNoDuplicates!0 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))) #b00000000000000000000000000000000 Nil!3670) e!159703)))

(declare-fun b!246190 () Bool)

(declare-fun e!159706 () Bool)

(assert (=> b!246190 (= e!159706 (contains!1778 Nil!3670 (select (arr!5765 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun c!41156 () Bool)

(declare-fun call!23009 () Bool)

(declare-fun bm!23006 () Bool)

(assert (=> bm!23006 (= call!23009 (arrayNoDuplicates!0 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41156 (Cons!3669 (select (arr!5765 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504)))) #b00000000000000000000000000000000) Nil!3670) Nil!3670)))))

(declare-fun b!246191 () Bool)

(declare-fun e!159705 () Bool)

(assert (=> b!246191 (= e!159705 call!23009)))

(declare-fun b!246192 () Bool)

(declare-fun e!159704 () Bool)

(assert (=> b!246192 (= e!159704 e!159705)))

(assert (=> b!246192 (= c!41156 (validKeyInArray!0 (select (arr!5765 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!246193 () Bool)

(assert (=> b!246193 (= e!159703 e!159704)))

(declare-fun res!120729 () Bool)

(assert (=> b!246193 (=> (not res!120729) (not e!159704))))

(assert (=> b!246193 (= res!120729 (not e!159706))))

(declare-fun res!120728 () Bool)

(assert (=> b!246193 (=> (not res!120728) (not e!159706))))

(assert (=> b!246193 (= res!120728 (validKeyInArray!0 (select (arr!5765 (array!12148 (store (arr!5765 (_keys!6662 thiss!1504)) index!297 key!932) (size!6107 (_keys!6662 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!246194 () Bool)

(assert (=> b!246194 (= e!159705 call!23009)))

(assert (= (and d!60347 (not res!120727)) b!246193))

(assert (= (and b!246193 res!120728) b!246190))

(assert (= (and b!246193 res!120729) b!246192))

(assert (= (and b!246192 c!41156) b!246194))

(assert (= (and b!246192 (not c!41156)) b!246191))

(assert (= (or b!246194 b!246191) bm!23006))

(assert (=> b!246190 m!263525))

(assert (=> b!246190 m!263525))

(declare-fun m!263681 () Bool)

(assert (=> b!246190 m!263681))

(assert (=> bm!23006 m!263525))

(declare-fun m!263683 () Bool)

(assert (=> bm!23006 m!263683))

(assert (=> b!246192 m!263525))

(assert (=> b!246192 m!263525))

(assert (=> b!246192 m!263527))

(assert (=> b!246193 m!263525))

(assert (=> b!246193 m!263525))

(assert (=> b!246193 m!263527))

(assert (=> b!245957 d!60347))

(declare-fun d!60349 () Bool)

(assert (=> d!60349 (= (inRange!0 (index!6535 lt!123096) (mask!10661 thiss!1504)) (and (bvsge (index!6535 lt!123096) #b00000000000000000000000000000000) (bvslt (index!6535 lt!123096) (bvadd (mask!10661 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!245803 d!60349))

(declare-fun b!246213 () Bool)

(declare-fun lt!123314 () SeekEntryResult!1091)

(assert (=> b!246213 (and (bvsge (index!6536 lt!123314) #b00000000000000000000000000000000) (bvslt (index!6536 lt!123314) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun e!159720 () Bool)

(assert (=> b!246213 (= e!159720 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6536 lt!123314)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246214 () Bool)

(assert (=> b!246214 (and (bvsge (index!6536 lt!123314) #b00000000000000000000000000000000) (bvslt (index!6536 lt!123314) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun res!120736 () Bool)

(assert (=> b!246214 (= res!120736 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6536 lt!123314)) key!932))))

(assert (=> b!246214 (=> res!120736 e!159720)))

(declare-fun e!159718 () Bool)

(assert (=> b!246214 (= e!159718 e!159720)))

(declare-fun b!246215 () Bool)

(declare-fun e!159719 () SeekEntryResult!1091)

(assert (=> b!246215 (= e!159719 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10661 thiss!1504)) #b00000000000000000000000000000000 (mask!10661 thiss!1504)) key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)))))

(declare-fun b!246216 () Bool)

(declare-fun e!159717 () Bool)

(assert (=> b!246216 (= e!159717 (bvsge (x!24439 lt!123314) #b01111111111111111111111111111110))))

(declare-fun b!246217 () Bool)

(declare-fun e!159721 () SeekEntryResult!1091)

(assert (=> b!246217 (= e!159721 (Intermediate!1091 true (toIndex!0 key!932 (mask!10661 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!60351 () Bool)

(assert (=> d!60351 e!159717))

(declare-fun c!41163 () Bool)

(assert (=> d!60351 (= c!41163 (and ((_ is Intermediate!1091) lt!123314) (undefined!1903 lt!123314)))))

(assert (=> d!60351 (= lt!123314 e!159721)))

(declare-fun c!41164 () Bool)

(assert (=> d!60351 (= c!41164 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!123315 () (_ BitVec 64))

(assert (=> d!60351 (= lt!123315 (select (arr!5765 (_keys!6662 thiss!1504)) (toIndex!0 key!932 (mask!10661 thiss!1504))))))

(assert (=> d!60351 (validMask!0 (mask!10661 thiss!1504))))

(assert (=> d!60351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10661 thiss!1504)) key!932 (_keys!6662 thiss!1504) (mask!10661 thiss!1504)) lt!123314)))

(declare-fun b!246218 () Bool)

(assert (=> b!246218 (= e!159719 (Intermediate!1091 false (toIndex!0 key!932 (mask!10661 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!246219 () Bool)

(assert (=> b!246219 (= e!159717 e!159718)))

(declare-fun res!120738 () Bool)

(assert (=> b!246219 (= res!120738 (and ((_ is Intermediate!1091) lt!123314) (not (undefined!1903 lt!123314)) (bvslt (x!24439 lt!123314) #b01111111111111111111111111111110) (bvsge (x!24439 lt!123314) #b00000000000000000000000000000000) (bvsge (x!24439 lt!123314) #b00000000000000000000000000000000)))))

(assert (=> b!246219 (=> (not res!120738) (not e!159718))))

(declare-fun b!246220 () Bool)

(assert (=> b!246220 (and (bvsge (index!6536 lt!123314) #b00000000000000000000000000000000) (bvslt (index!6536 lt!123314) (size!6107 (_keys!6662 thiss!1504))))))

(declare-fun res!120737 () Bool)

(assert (=> b!246220 (= res!120737 (= (select (arr!5765 (_keys!6662 thiss!1504)) (index!6536 lt!123314)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246220 (=> res!120737 e!159720)))

(declare-fun b!246221 () Bool)

(assert (=> b!246221 (= e!159721 e!159719)))

(declare-fun c!41165 () Bool)

(assert (=> b!246221 (= c!41165 (or (= lt!123315 key!932) (= (bvadd lt!123315 lt!123315) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60351 c!41164) b!246217))

(assert (= (and d!60351 (not c!41164)) b!246221))

(assert (= (and b!246221 c!41165) b!246218))

(assert (= (and b!246221 (not c!41165)) b!246215))

(assert (= (and d!60351 c!41163) b!246216))

(assert (= (and d!60351 (not c!41163)) b!246219))

(assert (= (and b!246219 res!120738) b!246214))

(assert (= (and b!246214 (not res!120736)) b!246220))

(assert (= (and b!246220 (not res!120737)) b!246213))

(assert (=> d!60351 m!263377))

(declare-fun m!263685 () Bool)

(assert (=> d!60351 m!263685))

(assert (=> d!60351 m!263257))

(declare-fun m!263687 () Bool)

(assert (=> b!246220 m!263687))

(assert (=> b!246214 m!263687))

(assert (=> b!246215 m!263377))

(declare-fun m!263689 () Bool)

(assert (=> b!246215 m!263689))

(assert (=> b!246215 m!263689))

(declare-fun m!263691 () Bool)

(assert (=> b!246215 m!263691))

(assert (=> b!246213 m!263687))

(assert (=> d!60229 d!60351))

(declare-fun d!60353 () Bool)

(declare-fun lt!123321 () (_ BitVec 32))

(declare-fun lt!123320 () (_ BitVec 32))

(assert (=> d!60353 (= lt!123321 (bvmul (bvxor lt!123320 (bvlshr lt!123320 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!60353 (= lt!123320 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!60353 (and (bvsge (mask!10661 thiss!1504) #b00000000000000000000000000000000) (let ((res!120739 (let ((h!4329 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24458 (bvmul (bvxor h!4329 (bvlshr h!4329 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24458 (bvlshr x!24458 #b00000000000000000000000000001101)) (mask!10661 thiss!1504)))))) (and (bvslt res!120739 (bvadd (mask!10661 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!120739 #b00000000000000000000000000000000))))))

(assert (=> d!60353 (= (toIndex!0 key!932 (mask!10661 thiss!1504)) (bvand (bvxor lt!123321 (bvlshr lt!123321 #b00000000000000000000000000001101)) (mask!10661 thiss!1504)))))

(assert (=> d!60229 d!60353))

(assert (=> d!60229 d!60239))

(assert (=> d!60253 d!60223))

(assert (=> d!60253 d!60225))

(declare-fun d!60355 () Bool)

(assert (=> d!60355 (contains!1776 (getCurrentListMap!1395 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)) key!932)))

(assert (=> d!60355 true))

(declare-fun _$17!68 () Unit!7585)

(assert (=> d!60355 (= (choose!1151 (_keys!6662 thiss!1504) (_values!4530 thiss!1504) (mask!10661 thiss!1504) (extraKeys!4284 thiss!1504) (zeroValue!4388 thiss!1504) (minValue!4388 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4547 thiss!1504)) _$17!68)))

(declare-fun bs!8908 () Bool)

(assert (= bs!8908 d!60355))

(assert (=> bs!8908 m!263235))

(assert (=> bs!8908 m!263235))

(assert (=> bs!8908 m!263237))

(assert (=> d!60253 d!60355))

(assert (=> d!60253 d!60239))

(declare-fun d!60357 () Bool)

(assert (=> d!60357 (= (apply!231 lt!123158 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2958 (getValueByKey!289 (toList!1867 lt!123158) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8909 () Bool)

(assert (= bs!8909 d!60357))

(assert (=> bs!8909 m!263449))

(assert (=> bs!8909 m!263449))

(declare-fun m!263693 () Bool)

(assert (=> bs!8909 m!263693))

(assert (=> b!245870 d!60357))

(assert (=> b!245950 d!60271))

(declare-fun d!60359 () Bool)

(assert (=> d!60359 (= (inRange!0 (ite c!41093 (index!6534 lt!123188) (index!6537 lt!123188)) (mask!10661 thiss!1504)) (and (bvsge (ite c!41093 (index!6534 lt!123188) (index!6537 lt!123188)) #b00000000000000000000000000000000) (bvslt (ite c!41093 (index!6534 lt!123188) (index!6537 lt!123188)) (bvadd (mask!10661 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22980 d!60359))

(assert (=> d!60225 d!60239))

(declare-fun mapIsEmpty!10904 () Bool)

(declare-fun mapRes!10904 () Bool)

(assert (=> mapIsEmpty!10904 mapRes!10904))

(declare-fun condMapEmpty!10904 () Bool)

(declare-fun mapDefault!10904 () ValueCell!2868)

(assert (=> mapNonEmpty!10903 (= condMapEmpty!10904 (= mapRest!10903 ((as const (Array (_ BitVec 32) ValueCell!2868)) mapDefault!10904)))))

(declare-fun e!159723 () Bool)

(assert (=> mapNonEmpty!10903 (= tp!22927 (and e!159723 mapRes!10904))))

(declare-fun mapNonEmpty!10904 () Bool)

(declare-fun tp!22928 () Bool)

(declare-fun e!159722 () Bool)

(assert (=> mapNonEmpty!10904 (= mapRes!10904 (and tp!22928 e!159722))))

(declare-fun mapKey!10904 () (_ BitVec 32))

(declare-fun mapRest!10904 () (Array (_ BitVec 32) ValueCell!2868))

(declare-fun mapValue!10904 () ValueCell!2868)

(assert (=> mapNonEmpty!10904 (= mapRest!10903 (store mapRest!10904 mapKey!10904 mapValue!10904))))

(declare-fun b!246222 () Bool)

(assert (=> b!246222 (= e!159722 tp_is_empty!6423)))

(declare-fun b!246223 () Bool)

(assert (=> b!246223 (= e!159723 tp_is_empty!6423)))

(assert (= (and mapNonEmpty!10903 condMapEmpty!10904) mapIsEmpty!10904))

(assert (= (and mapNonEmpty!10903 (not condMapEmpty!10904)) mapNonEmpty!10904))

(assert (= (and mapNonEmpty!10904 ((_ is ValueCellFull!2868) mapValue!10904)) b!246222))

(assert (= (and mapNonEmpty!10903 ((_ is ValueCellFull!2868) mapDefault!10904)) b!246223))

(declare-fun m!263695 () Bool)

(assert (=> mapNonEmpty!10904 m!263695))

(declare-fun b_lambda!8035 () Bool)

(assert (= b_lambda!8031 (or (and b!245727 b_free!6561) b_lambda!8035)))

(declare-fun b_lambda!8037 () Bool)

(assert (= b_lambda!8033 (or (and b!245727 b_free!6561) b_lambda!8037)))

(check-sat (not b!246173) (not b!246182) (not b!246102) (not b!246163) (not b_lambda!8037) (not d!60323) (not bm!23005) (not d!60257) (not d!60341) (not bm!23002) (not b!246165) (not d!60357) (not b!246130) (not d!60317) (not bm!23003) (not b!246007) (not d!60313) (not b!246003) (not b!246144) (not d!60269) (not b!246132) (not bm!23004) (not bm!22996) (not b!246171) (not b!246099) (not d!60325) (not mapNonEmpty!10904) (not d!60303) (not d!60265) (not b!246039) (not b!246129) (not b!246044) (not b!246134) (not d!60305) (not d!60307) (not b!246177) (not b!246009) (not b!246034) tp_is_empty!6423 (not bm!22991) (not d!60315) (not d!60291) (not d!60267) (not b_next!6561) (not b!246131) (not b!246162) (not d!60319) (not d!60261) (not b!246141) (not d!60275) (not b!246170) (not b!246152) (not b_lambda!8029) (not d!60277) (not b!246183) (not d!60351) (not d!60293) (not d!60311) b_and!13559 (not b!246082) (not b!246083) (not bm!22997) (not b!246133) (not b!246215) (not b!246192) (not b!246040) (not b!246092) (not b!246193) (not d!60321) (not b!246045) (not b!246041) (not b!246038) (not b!246071) (not b!246143) (not b!246190) (not d!60295) (not b!246037) (not d!60333) (not bm!23006) (not b!246062) (not d!60297) (not b!246145) (not b!246005) (not d!60329) (not b!245992) (not b!246166) (not b!246064) (not d!60281) (not b!246076) (not d!60309) (not b!246075) (not b!246066) (not b!246095) (not d!60337) (not b!246073) (not b_lambda!8035) (not bm!22992) (not b!246103) (not d!60255) (not d!60301) (not b!246100) (not d!60355) (not b!246189) (not d!60273) (not bm!22995) (not d!60299))
(check-sat b_and!13559 (not b_next!6561))
