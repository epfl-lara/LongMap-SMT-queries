; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21736 () Bool)

(assert start!21736)

(declare-fun b!218665 () Bool)

(declare-fun b_free!5881 () Bool)

(declare-fun b_next!5881 () Bool)

(assert (=> b!218665 (= b_free!5881 (not b_next!5881))))

(declare-fun tp!20778 () Bool)

(declare-fun b_and!12785 () Bool)

(assert (=> b!218665 (= tp!20778 b_and!12785)))

(declare-fun bm!20390 () Bool)

(declare-fun call!20394 () Bool)

(declare-datatypes ((V!7305 0))(
  ( (V!7306 (val!2916 Int)) )
))
(declare-datatypes ((ValueCell!2528 0))(
  ( (ValueCellFull!2528 (v!4935 V!7305)) (EmptyCell!2528) )
))
(declare-datatypes ((array!10723 0))(
  ( (array!10724 (arr!5083 (Array (_ BitVec 32) ValueCell!2528)) (size!5415 (_ BitVec 32))) )
))
(declare-datatypes ((array!10725 0))(
  ( (array!10726 (arr!5084 (Array (_ BitVec 32) (_ BitVec 64))) (size!5416 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2956 0))(
  ( (LongMapFixedSize!2957 (defaultEntry!4128 Int) (mask!9907 (_ BitVec 32)) (extraKeys!3865 (_ BitVec 32)) (zeroValue!3969 V!7305) (minValue!3969 V!7305) (_size!1527 (_ BitVec 32)) (_keys!6177 array!10725) (_values!4111 array!10723) (_vacant!1527 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2956)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20390 (= call!20394 (arrayContainsKey!0 (_keys!6177 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218663 () Bool)

(declare-fun res!107202 () Bool)

(declare-fun e!142245 () Bool)

(assert (=> b!218663 (=> (not res!107202) (not e!142245))))

(declare-fun call!20393 () Bool)

(assert (=> b!218663 (= res!107202 call!20393)))

(declare-fun e!142240 () Bool)

(assert (=> b!218663 (= e!142240 e!142245)))

(declare-fun b!218664 () Bool)

(declare-fun e!142246 () Bool)

(assert (=> b!218664 (= e!142246 (bvsge #b00000000000000000000000000000000 (size!5416 (_keys!6177 thiss!1504))))))

(declare-fun mapNonEmpty!9777 () Bool)

(declare-fun mapRes!9777 () Bool)

(declare-fun tp!20777 () Bool)

(declare-fun e!142242 () Bool)

(assert (=> mapNonEmpty!9777 (= mapRes!9777 (and tp!20777 e!142242))))

(declare-fun mapKey!9777 () (_ BitVec 32))

(declare-fun mapRest!9777 () (Array (_ BitVec 32) ValueCell!2528))

(declare-fun mapValue!9777 () ValueCell!2528)

(assert (=> mapNonEmpty!9777 (= (arr!5083 (_values!4111 thiss!1504)) (store mapRest!9777 mapKey!9777 mapValue!9777))))

(declare-fun tp_is_empty!5743 () Bool)

(declare-fun e!142243 () Bool)

(declare-fun e!142250 () Bool)

(declare-fun array_inv!3343 (array!10725) Bool)

(declare-fun array_inv!3344 (array!10723) Bool)

(assert (=> b!218665 (= e!142243 (and tp!20778 tp_is_empty!5743 (array_inv!3343 (_keys!6177 thiss!1504)) (array_inv!3344 (_values!4111 thiss!1504)) e!142250))))

(declare-fun b!218666 () Bool)

(declare-fun c!36377 () Bool)

(declare-datatypes ((SeekEntryResult!768 0))(
  ( (MissingZero!768 (index!5242 (_ BitVec 32))) (Found!768 (index!5243 (_ BitVec 32))) (Intermediate!768 (undefined!1580 Bool) (index!5244 (_ BitVec 32)) (x!22832 (_ BitVec 32))) (Undefined!768) (MissingVacant!768 (index!5245 (_ BitVec 32))) )
))
(declare-fun lt!111630 () SeekEntryResult!768)

(get-info :version)

(assert (=> b!218666 (= c!36377 ((_ is MissingVacant!768) lt!111630))))

(declare-fun e!142249 () Bool)

(assert (=> b!218666 (= e!142240 e!142249)))

(declare-fun mapIsEmpty!9777 () Bool)

(assert (=> mapIsEmpty!9777 mapRes!9777))

(declare-fun b!218667 () Bool)

(declare-fun e!142251 () Bool)

(assert (=> b!218667 (= e!142251 (not call!20394))))

(declare-fun b!218668 () Bool)

(assert (=> b!218668 (= e!142242 tp_is_empty!5743)))

(declare-fun b!218669 () Bool)

(assert (=> b!218669 (= e!142249 ((_ is Undefined!768) lt!111630))))

(declare-fun b!218670 () Bool)

(declare-fun e!142248 () Bool)

(assert (=> b!218670 (= e!142248 tp_is_empty!5743)))

(declare-fun b!218671 () Bool)

(declare-fun res!107198 () Bool)

(assert (=> b!218671 (= res!107198 (= (select (arr!5084 (_keys!6177 thiss!1504)) (index!5245 lt!111630)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218671 (=> (not res!107198) (not e!142251))))

(declare-fun b!218672 () Bool)

(assert (=> b!218672 (= e!142250 (and e!142248 mapRes!9777))))

(declare-fun condMapEmpty!9777 () Bool)

(declare-fun mapDefault!9777 () ValueCell!2528)

(assert (=> b!218672 (= condMapEmpty!9777 (= (arr!5083 (_values!4111 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2528)) mapDefault!9777)))))

(declare-fun res!107205 () Bool)

(declare-fun e!142247 () Bool)

(assert (=> start!21736 (=> (not res!107205) (not e!142247))))

(declare-fun valid!1209 (LongMapFixedSize!2956) Bool)

(assert (=> start!21736 (= res!107205 (valid!1209 thiss!1504))))

(assert (=> start!21736 e!142247))

(assert (=> start!21736 e!142243))

(assert (=> start!21736 true))

(declare-fun b!218673 () Bool)

(assert (=> b!218673 (= e!142245 (not call!20394))))

(declare-fun b!218674 () Bool)

(declare-fun res!107200 () Bool)

(assert (=> b!218674 (=> (not res!107200) (not e!142245))))

(assert (=> b!218674 (= res!107200 (= (select (arr!5084 (_keys!6177 thiss!1504)) (index!5242 lt!111630)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218675 () Bool)

(declare-fun res!107199 () Bool)

(assert (=> b!218675 (=> (not res!107199) (not e!142247))))

(assert (=> b!218675 (= res!107199 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun c!36376 () Bool)

(declare-fun bm!20391 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20391 (= call!20393 (inRange!0 (ite c!36376 (index!5242 lt!111630) (index!5245 lt!111630)) (mask!9907 thiss!1504)))))

(declare-fun b!218676 () Bool)

(assert (=> b!218676 (= e!142249 e!142251)))

(declare-fun res!107201 () Bool)

(assert (=> b!218676 (= res!107201 call!20393)))

(assert (=> b!218676 (=> (not res!107201) (not e!142251))))

(declare-fun b!218677 () Bool)

(declare-datatypes ((Unit!6500 0))(
  ( (Unit!6501) )
))
(declare-fun e!142244 () Unit!6500)

(declare-fun lt!111629 () Unit!6500)

(assert (=> b!218677 (= e!142244 lt!111629)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!185 (array!10725 array!10723 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 64) Int) Unit!6500)

(assert (=> b!218677 (= lt!111629 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!185 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)))))

(assert (=> b!218677 (= c!36376 ((_ is MissingZero!768) lt!111630))))

(assert (=> b!218677 e!142240))

(declare-fun b!218678 () Bool)

(declare-fun Unit!6502 () Unit!6500)

(assert (=> b!218678 (= e!142244 Unit!6502)))

(declare-fun lt!111631 () Unit!6500)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!186 (array!10725 array!10723 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 64) Int) Unit!6500)

(assert (=> b!218678 (= lt!111631 (lemmaInListMapThenSeekEntryOrOpenFindsIt!186 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)))))

(assert (=> b!218678 false))

(declare-fun b!218679 () Bool)

(declare-fun e!142241 () Bool)

(assert (=> b!218679 (= e!142247 e!142241)))

(declare-fun res!107204 () Bool)

(assert (=> b!218679 (=> (not res!107204) (not e!142241))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218679 (= res!107204 (or (= lt!111630 (MissingZero!768 index!297)) (= lt!111630 (MissingVacant!768 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10725 (_ BitVec 32)) SeekEntryResult!768)

(assert (=> b!218679 (= lt!111630 (seekEntryOrOpen!0 key!932 (_keys!6177 thiss!1504) (mask!9907 thiss!1504)))))

(declare-fun b!218680 () Bool)

(assert (=> b!218680 (= e!142241 e!142246)))

(declare-fun res!107203 () Bool)

(assert (=> b!218680 (=> (not res!107203) (not e!142246))))

(assert (=> b!218680 (= res!107203 (inRange!0 index!297 (mask!9907 thiss!1504)))))

(declare-fun lt!111632 () Unit!6500)

(assert (=> b!218680 (= lt!111632 e!142244)))

(declare-fun c!36378 () Bool)

(declare-datatypes ((tuple2!4254 0))(
  ( (tuple2!4255 (_1!2138 (_ BitVec 64)) (_2!2138 V!7305)) )
))
(declare-datatypes ((List!3151 0))(
  ( (Nil!3148) (Cons!3147 (h!3794 tuple2!4254) (t!8098 List!3151)) )
))
(declare-datatypes ((ListLongMap!3169 0))(
  ( (ListLongMap!3170 (toList!1600 List!3151)) )
))
(declare-fun contains!1455 (ListLongMap!3169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1132 (array!10725 array!10723 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 32) Int) ListLongMap!3169)

(assert (=> b!218680 (= c!36378 (contains!1455 (getCurrentListMap!1132 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)) key!932))))

(assert (= (and start!21736 res!107205) b!218675))

(assert (= (and b!218675 res!107199) b!218679))

(assert (= (and b!218679 res!107204) b!218680))

(assert (= (and b!218680 c!36378) b!218678))

(assert (= (and b!218680 (not c!36378)) b!218677))

(assert (= (and b!218677 c!36376) b!218663))

(assert (= (and b!218677 (not c!36376)) b!218666))

(assert (= (and b!218663 res!107202) b!218674))

(assert (= (and b!218674 res!107200) b!218673))

(assert (= (and b!218666 c!36377) b!218676))

(assert (= (and b!218666 (not c!36377)) b!218669))

(assert (= (and b!218676 res!107201) b!218671))

(assert (= (and b!218671 res!107198) b!218667))

(assert (= (or b!218663 b!218676) bm!20391))

(assert (= (or b!218673 b!218667) bm!20390))

(assert (= (and b!218680 res!107203) b!218664))

(assert (= (and b!218672 condMapEmpty!9777) mapIsEmpty!9777))

(assert (= (and b!218672 (not condMapEmpty!9777)) mapNonEmpty!9777))

(assert (= (and mapNonEmpty!9777 ((_ is ValueCellFull!2528) mapValue!9777)) b!218668))

(assert (= (and b!218672 ((_ is ValueCellFull!2528) mapDefault!9777)) b!218670))

(assert (= b!218665 b!218672))

(assert (= start!21736 b!218665))

(declare-fun m!244629 () Bool)

(assert (=> b!218680 m!244629))

(declare-fun m!244631 () Bool)

(assert (=> b!218680 m!244631))

(assert (=> b!218680 m!244631))

(declare-fun m!244633 () Bool)

(assert (=> b!218680 m!244633))

(declare-fun m!244635 () Bool)

(assert (=> b!218679 m!244635))

(declare-fun m!244637 () Bool)

(assert (=> b!218677 m!244637))

(declare-fun m!244639 () Bool)

(assert (=> mapNonEmpty!9777 m!244639))

(declare-fun m!244641 () Bool)

(assert (=> bm!20391 m!244641))

(declare-fun m!244643 () Bool)

(assert (=> b!218674 m!244643))

(declare-fun m!244645 () Bool)

(assert (=> b!218665 m!244645))

(declare-fun m!244647 () Bool)

(assert (=> b!218665 m!244647))

(declare-fun m!244649 () Bool)

(assert (=> b!218671 m!244649))

(declare-fun m!244651 () Bool)

(assert (=> b!218678 m!244651))

(declare-fun m!244653 () Bool)

(assert (=> start!21736 m!244653))

(declare-fun m!244655 () Bool)

(assert (=> bm!20390 m!244655))

(check-sat tp_is_empty!5743 (not start!21736) (not mapNonEmpty!9777) b_and!12785 (not b!218679) (not b_next!5881) (not bm!20391) (not b!218678) (not b!218677) (not b!218665) (not b!218680) (not bm!20390))
(check-sat b_and!12785 (not b_next!5881))
(get-model)

(declare-fun d!58673 () Bool)

(assert (=> d!58673 (= (array_inv!3343 (_keys!6177 thiss!1504)) (bvsge (size!5416 (_keys!6177 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218665 d!58673))

(declare-fun d!58675 () Bool)

(assert (=> d!58675 (= (array_inv!3344 (_values!4111 thiss!1504)) (bvsge (size!5415 (_values!4111 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218665 d!58675))

(declare-fun b!218801 () Bool)

(declare-fun e!142337 () SeekEntryResult!768)

(assert (=> b!218801 (= e!142337 Undefined!768)))

(declare-fun b!218802 () Bool)

(declare-fun e!142338 () SeekEntryResult!768)

(declare-fun lt!111664 () SeekEntryResult!768)

(assert (=> b!218802 (= e!142338 (MissingZero!768 (index!5244 lt!111664)))))

(declare-fun d!58677 () Bool)

(declare-fun lt!111663 () SeekEntryResult!768)

(assert (=> d!58677 (and (or ((_ is Undefined!768) lt!111663) (not ((_ is Found!768) lt!111663)) (and (bvsge (index!5243 lt!111663) #b00000000000000000000000000000000) (bvslt (index!5243 lt!111663) (size!5416 (_keys!6177 thiss!1504))))) (or ((_ is Undefined!768) lt!111663) ((_ is Found!768) lt!111663) (not ((_ is MissingZero!768) lt!111663)) (and (bvsge (index!5242 lt!111663) #b00000000000000000000000000000000) (bvslt (index!5242 lt!111663) (size!5416 (_keys!6177 thiss!1504))))) (or ((_ is Undefined!768) lt!111663) ((_ is Found!768) lt!111663) ((_ is MissingZero!768) lt!111663) (not ((_ is MissingVacant!768) lt!111663)) (and (bvsge (index!5245 lt!111663) #b00000000000000000000000000000000) (bvslt (index!5245 lt!111663) (size!5416 (_keys!6177 thiss!1504))))) (or ((_ is Undefined!768) lt!111663) (ite ((_ is Found!768) lt!111663) (= (select (arr!5084 (_keys!6177 thiss!1504)) (index!5243 lt!111663)) key!932) (ite ((_ is MissingZero!768) lt!111663) (= (select (arr!5084 (_keys!6177 thiss!1504)) (index!5242 lt!111663)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!768) lt!111663) (= (select (arr!5084 (_keys!6177 thiss!1504)) (index!5245 lt!111663)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58677 (= lt!111663 e!142337)))

(declare-fun c!36404 () Bool)

(assert (=> d!58677 (= c!36404 (and ((_ is Intermediate!768) lt!111664) (undefined!1580 lt!111664)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10725 (_ BitVec 32)) SeekEntryResult!768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58677 (= lt!111664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9907 thiss!1504)) key!932 (_keys!6177 thiss!1504) (mask!9907 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!58677 (validMask!0 (mask!9907 thiss!1504))))

(assert (=> d!58677 (= (seekEntryOrOpen!0 key!932 (_keys!6177 thiss!1504) (mask!9907 thiss!1504)) lt!111663)))

(declare-fun b!218803 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10725 (_ BitVec 32)) SeekEntryResult!768)

(assert (=> b!218803 (= e!142338 (seekKeyOrZeroReturnVacant!0 (x!22832 lt!111664) (index!5244 lt!111664) (index!5244 lt!111664) key!932 (_keys!6177 thiss!1504) (mask!9907 thiss!1504)))))

(declare-fun b!218804 () Bool)

(declare-fun c!36405 () Bool)

(declare-fun lt!111665 () (_ BitVec 64))

(assert (=> b!218804 (= c!36405 (= lt!111665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142339 () SeekEntryResult!768)

(assert (=> b!218804 (= e!142339 e!142338)))

(declare-fun b!218805 () Bool)

(assert (=> b!218805 (= e!142339 (Found!768 (index!5244 lt!111664)))))

(declare-fun b!218806 () Bool)

(assert (=> b!218806 (= e!142337 e!142339)))

(assert (=> b!218806 (= lt!111665 (select (arr!5084 (_keys!6177 thiss!1504)) (index!5244 lt!111664)))))

(declare-fun c!36403 () Bool)

(assert (=> b!218806 (= c!36403 (= lt!111665 key!932))))

(assert (= (and d!58677 c!36404) b!218801))

(assert (= (and d!58677 (not c!36404)) b!218806))

(assert (= (and b!218806 c!36403) b!218805))

(assert (= (and b!218806 (not c!36403)) b!218804))

(assert (= (and b!218804 c!36405) b!218802))

(assert (= (and b!218804 (not c!36405)) b!218803))

(declare-fun m!244713 () Bool)

(assert (=> d!58677 m!244713))

(declare-fun m!244715 () Bool)

(assert (=> d!58677 m!244715))

(declare-fun m!244717 () Bool)

(assert (=> d!58677 m!244717))

(declare-fun m!244719 () Bool)

(assert (=> d!58677 m!244719))

(declare-fun m!244721 () Bool)

(assert (=> d!58677 m!244721))

(assert (=> d!58677 m!244715))

(declare-fun m!244723 () Bool)

(assert (=> d!58677 m!244723))

(declare-fun m!244725 () Bool)

(assert (=> b!218803 m!244725))

(declare-fun m!244727 () Bool)

(assert (=> b!218806 m!244727))

(assert (=> b!218679 d!58677))

(declare-fun d!58679 () Bool)

(declare-fun e!142342 () Bool)

(assert (=> d!58679 e!142342))

(declare-fun res!107259 () Bool)

(assert (=> d!58679 (=> (not res!107259) (not e!142342))))

(declare-fun lt!111670 () SeekEntryResult!768)

(assert (=> d!58679 (= res!107259 ((_ is Found!768) lt!111670))))

(assert (=> d!58679 (= lt!111670 (seekEntryOrOpen!0 key!932 (_keys!6177 thiss!1504) (mask!9907 thiss!1504)))))

(declare-fun lt!111671 () Unit!6500)

(declare-fun choose!1092 (array!10725 array!10723 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 64) Int) Unit!6500)

(assert (=> d!58679 (= lt!111671 (choose!1092 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)))))

(assert (=> d!58679 (validMask!0 (mask!9907 thiss!1504))))

(assert (=> d!58679 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!186 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)) lt!111671)))

(declare-fun b!218811 () Bool)

(declare-fun res!107258 () Bool)

(assert (=> b!218811 (=> (not res!107258) (not e!142342))))

(assert (=> b!218811 (= res!107258 (inRange!0 (index!5243 lt!111670) (mask!9907 thiss!1504)))))

(declare-fun b!218812 () Bool)

(assert (=> b!218812 (= e!142342 (= (select (arr!5084 (_keys!6177 thiss!1504)) (index!5243 lt!111670)) key!932))))

(assert (=> b!218812 (and (bvsge (index!5243 lt!111670) #b00000000000000000000000000000000) (bvslt (index!5243 lt!111670) (size!5416 (_keys!6177 thiss!1504))))))

(assert (= (and d!58679 res!107259) b!218811))

(assert (= (and b!218811 res!107258) b!218812))

(assert (=> d!58679 m!244635))

(declare-fun m!244729 () Bool)

(assert (=> d!58679 m!244729))

(assert (=> d!58679 m!244721))

(declare-fun m!244731 () Bool)

(assert (=> b!218811 m!244731))

(declare-fun m!244733 () Bool)

(assert (=> b!218812 m!244733))

(assert (=> b!218678 d!58679))

(declare-fun lt!111676 () SeekEntryResult!768)

(declare-fun call!20411 () Bool)

(declare-fun bm!20408 () Bool)

(declare-fun c!36410 () Bool)

(assert (=> bm!20408 (= call!20411 (inRange!0 (ite c!36410 (index!5242 lt!111676) (index!5245 lt!111676)) (mask!9907 thiss!1504)))))

(declare-fun d!58681 () Bool)

(declare-fun e!142353 () Bool)

(assert (=> d!58681 e!142353))

(assert (=> d!58681 (= c!36410 ((_ is MissingZero!768) lt!111676))))

(assert (=> d!58681 (= lt!111676 (seekEntryOrOpen!0 key!932 (_keys!6177 thiss!1504) (mask!9907 thiss!1504)))))

(declare-fun lt!111677 () Unit!6500)

(declare-fun choose!1093 (array!10725 array!10723 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 64) Int) Unit!6500)

(assert (=> d!58681 (= lt!111677 (choose!1093 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)))))

(assert (=> d!58681 (validMask!0 (mask!9907 thiss!1504))))

(assert (=> d!58681 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!185 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)) lt!111677)))

(declare-fun b!218829 () Bool)

(declare-fun e!142354 () Bool)

(assert (=> b!218829 (= e!142354 ((_ is Undefined!768) lt!111676))))

(declare-fun b!218830 () Bool)

(declare-fun res!107271 () Bool)

(declare-fun e!142351 () Bool)

(assert (=> b!218830 (=> (not res!107271) (not e!142351))))

(assert (=> b!218830 (= res!107271 call!20411)))

(assert (=> b!218830 (= e!142354 e!142351)))

(declare-fun b!218831 () Bool)

(assert (=> b!218831 (= e!142353 e!142354)))

(declare-fun c!36411 () Bool)

(assert (=> b!218831 (= c!36411 ((_ is MissingVacant!768) lt!111676))))

(declare-fun b!218832 () Bool)

(declare-fun call!20412 () Bool)

(assert (=> b!218832 (= e!142351 (not call!20412))))

(declare-fun b!218833 () Bool)

(declare-fun e!142352 () Bool)

(assert (=> b!218833 (= e!142353 e!142352)))

(declare-fun res!107270 () Bool)

(assert (=> b!218833 (= res!107270 call!20411)))

(assert (=> b!218833 (=> (not res!107270) (not e!142352))))

(declare-fun b!218834 () Bool)

(assert (=> b!218834 (and (bvsge (index!5242 lt!111676) #b00000000000000000000000000000000) (bvslt (index!5242 lt!111676) (size!5416 (_keys!6177 thiss!1504))))))

(declare-fun res!107268 () Bool)

(assert (=> b!218834 (= res!107268 (= (select (arr!5084 (_keys!6177 thiss!1504)) (index!5242 lt!111676)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218834 (=> (not res!107268) (not e!142352))))

(declare-fun bm!20409 () Bool)

(assert (=> bm!20409 (= call!20412 (arrayContainsKey!0 (_keys!6177 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218835 () Bool)

(assert (=> b!218835 (= e!142352 (not call!20412))))

(declare-fun b!218836 () Bool)

(declare-fun res!107269 () Bool)

(assert (=> b!218836 (=> (not res!107269) (not e!142351))))

(assert (=> b!218836 (= res!107269 (= (select (arr!5084 (_keys!6177 thiss!1504)) (index!5245 lt!111676)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218836 (and (bvsge (index!5245 lt!111676) #b00000000000000000000000000000000) (bvslt (index!5245 lt!111676) (size!5416 (_keys!6177 thiss!1504))))))

(assert (= (and d!58681 c!36410) b!218833))

(assert (= (and d!58681 (not c!36410)) b!218831))

(assert (= (and b!218833 res!107270) b!218834))

(assert (= (and b!218834 res!107268) b!218835))

(assert (= (and b!218831 c!36411) b!218830))

(assert (= (and b!218831 (not c!36411)) b!218829))

(assert (= (and b!218830 res!107271) b!218836))

(assert (= (and b!218836 res!107269) b!218832))

(assert (= (or b!218833 b!218830) bm!20408))

(assert (= (or b!218835 b!218832) bm!20409))

(assert (=> bm!20409 m!244655))

(declare-fun m!244735 () Bool)

(assert (=> b!218834 m!244735))

(declare-fun m!244737 () Bool)

(assert (=> bm!20408 m!244737))

(assert (=> d!58681 m!244635))

(declare-fun m!244739 () Bool)

(assert (=> d!58681 m!244739))

(assert (=> d!58681 m!244721))

(declare-fun m!244741 () Bool)

(assert (=> b!218836 m!244741))

(assert (=> b!218677 d!58681))

(declare-fun d!58683 () Bool)

(assert (=> d!58683 (= (inRange!0 index!297 (mask!9907 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!9907 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!218680 d!58683))

(declare-fun d!58685 () Bool)

(declare-fun e!142360 () Bool)

(assert (=> d!58685 e!142360))

(declare-fun res!107274 () Bool)

(assert (=> d!58685 (=> res!107274 e!142360)))

(declare-fun lt!111688 () Bool)

(assert (=> d!58685 (= res!107274 (not lt!111688))))

(declare-fun lt!111689 () Bool)

(assert (=> d!58685 (= lt!111688 lt!111689)))

(declare-fun lt!111687 () Unit!6500)

(declare-fun e!142359 () Unit!6500)

(assert (=> d!58685 (= lt!111687 e!142359)))

(declare-fun c!36414 () Bool)

(assert (=> d!58685 (= c!36414 lt!111689)))

(declare-fun containsKey!251 (List!3151 (_ BitVec 64)) Bool)

(assert (=> d!58685 (= lt!111689 (containsKey!251 (toList!1600 (getCurrentListMap!1132 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504))) key!932))))

(assert (=> d!58685 (= (contains!1455 (getCurrentListMap!1132 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)) key!932) lt!111688)))

(declare-fun b!218843 () Bool)

(declare-fun lt!111686 () Unit!6500)

(assert (=> b!218843 (= e!142359 lt!111686)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!199 (List!3151 (_ BitVec 64)) Unit!6500)

(assert (=> b!218843 (= lt!111686 (lemmaContainsKeyImpliesGetValueByKeyDefined!199 (toList!1600 (getCurrentListMap!1132 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504))) key!932))))

(declare-datatypes ((Option!266 0))(
  ( (Some!265 (v!4938 V!7305)) (None!264) )
))
(declare-fun isDefined!200 (Option!266) Bool)

(declare-fun getValueByKey!260 (List!3151 (_ BitVec 64)) Option!266)

(assert (=> b!218843 (isDefined!200 (getValueByKey!260 (toList!1600 (getCurrentListMap!1132 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504))) key!932))))

(declare-fun b!218844 () Bool)

(declare-fun Unit!6509 () Unit!6500)

(assert (=> b!218844 (= e!142359 Unit!6509)))

(declare-fun b!218845 () Bool)

(assert (=> b!218845 (= e!142360 (isDefined!200 (getValueByKey!260 (toList!1600 (getCurrentListMap!1132 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504))) key!932)))))

(assert (= (and d!58685 c!36414) b!218843))

(assert (= (and d!58685 (not c!36414)) b!218844))

(assert (= (and d!58685 (not res!107274)) b!218845))

(declare-fun m!244743 () Bool)

(assert (=> d!58685 m!244743))

(declare-fun m!244745 () Bool)

(assert (=> b!218843 m!244745))

(declare-fun m!244747 () Bool)

(assert (=> b!218843 m!244747))

(assert (=> b!218843 m!244747))

(declare-fun m!244749 () Bool)

(assert (=> b!218843 m!244749))

(assert (=> b!218845 m!244747))

(assert (=> b!218845 m!244747))

(assert (=> b!218845 m!244749))

(assert (=> b!218680 d!58685))

(declare-fun b!218888 () Bool)

(declare-fun e!142392 () Bool)

(declare-fun lt!111752 () ListLongMap!3169)

(declare-fun apply!201 (ListLongMap!3169 (_ BitVec 64)) V!7305)

(assert (=> b!218888 (= e!142392 (= (apply!201 lt!111752 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3969 thiss!1504)))))

(declare-fun bm!20424 () Bool)

(declare-fun call!20430 () ListLongMap!3169)

(declare-fun call!20433 () ListLongMap!3169)

(assert (=> bm!20424 (= call!20430 call!20433)))

(declare-fun b!218889 () Bool)

(declare-fun e!142394 () Bool)

(declare-fun call!20429 () Bool)

(assert (=> b!218889 (= e!142394 (not call!20429))))

(declare-fun d!58687 () Bool)

(declare-fun e!142390 () Bool)

(assert (=> d!58687 e!142390))

(declare-fun res!107300 () Bool)

(assert (=> d!58687 (=> (not res!107300) (not e!142390))))

(assert (=> d!58687 (= res!107300 (or (bvsge #b00000000000000000000000000000000 (size!5416 (_keys!6177 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5416 (_keys!6177 thiss!1504))))))))

(declare-fun lt!111737 () ListLongMap!3169)

(assert (=> d!58687 (= lt!111752 lt!111737)))

(declare-fun lt!111750 () Unit!6500)

(declare-fun e!142397 () Unit!6500)

(assert (=> d!58687 (= lt!111750 e!142397)))

(declare-fun c!36430 () Bool)

(declare-fun e!142396 () Bool)

(assert (=> d!58687 (= c!36430 e!142396)))

(declare-fun res!107294 () Bool)

(assert (=> d!58687 (=> (not res!107294) (not e!142396))))

(assert (=> d!58687 (= res!107294 (bvslt #b00000000000000000000000000000000 (size!5416 (_keys!6177 thiss!1504))))))

(declare-fun e!142388 () ListLongMap!3169)

(assert (=> d!58687 (= lt!111737 e!142388)))

(declare-fun c!36429 () Bool)

(assert (=> d!58687 (= c!36429 (and (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58687 (validMask!0 (mask!9907 thiss!1504))))

(assert (=> d!58687 (= (getCurrentListMap!1132 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)) lt!111752)))

(declare-fun b!218890 () Bool)

(declare-fun e!142398 () Bool)

(declare-fun e!142395 () Bool)

(assert (=> b!218890 (= e!142398 e!142395)))

(declare-fun res!107296 () Bool)

(assert (=> b!218890 (=> (not res!107296) (not e!142395))))

(assert (=> b!218890 (= res!107296 (contains!1455 lt!111752 (select (arr!5084 (_keys!6177 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!218890 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5416 (_keys!6177 thiss!1504))))))

(declare-fun b!218891 () Bool)

(declare-fun call!20428 () ListLongMap!3169)

(declare-fun +!591 (ListLongMap!3169 tuple2!4254) ListLongMap!3169)

(assert (=> b!218891 (= e!142388 (+!591 call!20428 (tuple2!4255 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3969 thiss!1504))))))

(declare-fun b!218892 () Bool)

(declare-fun e!142399 () Bool)

(declare-fun call!20431 () Bool)

(assert (=> b!218892 (= e!142399 (not call!20431))))

(declare-fun b!218893 () Bool)

(declare-fun e!142391 () Bool)

(assert (=> b!218893 (= e!142399 e!142391)))

(declare-fun res!107299 () Bool)

(assert (=> b!218893 (= res!107299 call!20431)))

(assert (=> b!218893 (=> (not res!107299) (not e!142391))))

(declare-fun b!218894 () Bool)

(declare-fun c!36427 () Bool)

(assert (=> b!218894 (= c!36427 (and (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!142393 () ListLongMap!3169)

(declare-fun e!142387 () ListLongMap!3169)

(assert (=> b!218894 (= e!142393 e!142387)))

(declare-fun b!218895 () Bool)

(declare-fun res!107297 () Bool)

(assert (=> b!218895 (=> (not res!107297) (not e!142390))))

(assert (=> b!218895 (= res!107297 e!142399)))

(declare-fun c!36432 () Bool)

(assert (=> b!218895 (= c!36432 (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!218896 () Bool)

(declare-fun call!20432 () ListLongMap!3169)

(assert (=> b!218896 (= e!142387 call!20432)))

(declare-fun b!218897 () Bool)

(declare-fun e!142389 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!218897 (= e!142389 (validKeyInArray!0 (select (arr!5084 (_keys!6177 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!218898 () Bool)

(assert (=> b!218898 (= e!142390 e!142394)))

(declare-fun c!36431 () Bool)

(assert (=> b!218898 (= c!36431 (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!218899 () Bool)

(assert (=> b!218899 (= e!142388 e!142393)))

(declare-fun c!36428 () Bool)

(assert (=> b!218899 (= c!36428 (and (not (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3865 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!218900 () Bool)

(assert (=> b!218900 (= e!142394 e!142392)))

(declare-fun res!107298 () Bool)

(assert (=> b!218900 (= res!107298 call!20429)))

(assert (=> b!218900 (=> (not res!107298) (not e!142392))))

(declare-fun bm!20425 () Bool)

(assert (=> bm!20425 (= call!20429 (contains!1455 lt!111752 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20426 () Bool)

(assert (=> bm!20426 (= call!20428 (+!591 (ite c!36429 call!20433 (ite c!36428 call!20430 call!20432)) (ite (or c!36429 c!36428) (tuple2!4255 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3969 thiss!1504)) (tuple2!4255 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3969 thiss!1504)))))))

(declare-fun bm!20427 () Bool)

(declare-fun call!20427 () ListLongMap!3169)

(assert (=> bm!20427 (= call!20427 call!20428)))

(declare-fun bm!20428 () Bool)

(assert (=> bm!20428 (= call!20432 call!20430)))

(declare-fun bm!20429 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!517 (array!10725 array!10723 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 32) Int) ListLongMap!3169)

(assert (=> bm!20429 (= call!20433 (getCurrentListMapNoExtraKeys!517 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)))))

(declare-fun b!218901 () Bool)

(declare-fun res!107301 () Bool)

(assert (=> b!218901 (=> (not res!107301) (not e!142390))))

(assert (=> b!218901 (= res!107301 e!142398)))

(declare-fun res!107293 () Bool)

(assert (=> b!218901 (=> res!107293 e!142398)))

(assert (=> b!218901 (= res!107293 (not e!142389))))

(declare-fun res!107295 () Bool)

(assert (=> b!218901 (=> (not res!107295) (not e!142389))))

(assert (=> b!218901 (= res!107295 (bvslt #b00000000000000000000000000000000 (size!5416 (_keys!6177 thiss!1504))))))

(declare-fun b!218902 () Bool)

(declare-fun Unit!6510 () Unit!6500)

(assert (=> b!218902 (= e!142397 Unit!6510)))

(declare-fun b!218903 () Bool)

(assert (=> b!218903 (= e!142396 (validKeyInArray!0 (select (arr!5084 (_keys!6177 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!218904 () Bool)

(assert (=> b!218904 (= e!142387 call!20427)))

(declare-fun b!218905 () Bool)

(declare-fun lt!111751 () Unit!6500)

(assert (=> b!218905 (= e!142397 lt!111751)))

(declare-fun lt!111738 () ListLongMap!3169)

(assert (=> b!218905 (= lt!111738 (getCurrentListMapNoExtraKeys!517 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)))))

(declare-fun lt!111736 () (_ BitVec 64))

(assert (=> b!218905 (= lt!111736 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111746 () (_ BitVec 64))

(assert (=> b!218905 (= lt!111746 (select (arr!5084 (_keys!6177 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111747 () Unit!6500)

(declare-fun addStillContains!177 (ListLongMap!3169 (_ BitVec 64) V!7305 (_ BitVec 64)) Unit!6500)

(assert (=> b!218905 (= lt!111747 (addStillContains!177 lt!111738 lt!111736 (zeroValue!3969 thiss!1504) lt!111746))))

(assert (=> b!218905 (contains!1455 (+!591 lt!111738 (tuple2!4255 lt!111736 (zeroValue!3969 thiss!1504))) lt!111746)))

(declare-fun lt!111748 () Unit!6500)

(assert (=> b!218905 (= lt!111748 lt!111747)))

(declare-fun lt!111745 () ListLongMap!3169)

(assert (=> b!218905 (= lt!111745 (getCurrentListMapNoExtraKeys!517 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)))))

(declare-fun lt!111749 () (_ BitVec 64))

(assert (=> b!218905 (= lt!111749 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111753 () (_ BitVec 64))

(assert (=> b!218905 (= lt!111753 (select (arr!5084 (_keys!6177 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111742 () Unit!6500)

(declare-fun addApplyDifferent!177 (ListLongMap!3169 (_ BitVec 64) V!7305 (_ BitVec 64)) Unit!6500)

(assert (=> b!218905 (= lt!111742 (addApplyDifferent!177 lt!111745 lt!111749 (minValue!3969 thiss!1504) lt!111753))))

(assert (=> b!218905 (= (apply!201 (+!591 lt!111745 (tuple2!4255 lt!111749 (minValue!3969 thiss!1504))) lt!111753) (apply!201 lt!111745 lt!111753))))

(declare-fun lt!111739 () Unit!6500)

(assert (=> b!218905 (= lt!111739 lt!111742)))

(declare-fun lt!111754 () ListLongMap!3169)

(assert (=> b!218905 (= lt!111754 (getCurrentListMapNoExtraKeys!517 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)))))

(declare-fun lt!111743 () (_ BitVec 64))

(assert (=> b!218905 (= lt!111743 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111735 () (_ BitVec 64))

(assert (=> b!218905 (= lt!111735 (select (arr!5084 (_keys!6177 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111734 () Unit!6500)

(assert (=> b!218905 (= lt!111734 (addApplyDifferent!177 lt!111754 lt!111743 (zeroValue!3969 thiss!1504) lt!111735))))

(assert (=> b!218905 (= (apply!201 (+!591 lt!111754 (tuple2!4255 lt!111743 (zeroValue!3969 thiss!1504))) lt!111735) (apply!201 lt!111754 lt!111735))))

(declare-fun lt!111741 () Unit!6500)

(assert (=> b!218905 (= lt!111741 lt!111734)))

(declare-fun lt!111740 () ListLongMap!3169)

(assert (=> b!218905 (= lt!111740 (getCurrentListMapNoExtraKeys!517 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)))))

(declare-fun lt!111755 () (_ BitVec 64))

(assert (=> b!218905 (= lt!111755 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111744 () (_ BitVec 64))

(assert (=> b!218905 (= lt!111744 (select (arr!5084 (_keys!6177 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218905 (= lt!111751 (addApplyDifferent!177 lt!111740 lt!111755 (minValue!3969 thiss!1504) lt!111744))))

(assert (=> b!218905 (= (apply!201 (+!591 lt!111740 (tuple2!4255 lt!111755 (minValue!3969 thiss!1504))) lt!111744) (apply!201 lt!111740 lt!111744))))

(declare-fun b!218906 () Bool)

(assert (=> b!218906 (= e!142391 (= (apply!201 lt!111752 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3969 thiss!1504)))))

(declare-fun bm!20430 () Bool)

(assert (=> bm!20430 (= call!20431 (contains!1455 lt!111752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218907 () Bool)

(assert (=> b!218907 (= e!142393 call!20427)))

(declare-fun b!218908 () Bool)

(declare-fun get!2677 (ValueCell!2528 V!7305) V!7305)

(declare-fun dynLambda!544 (Int (_ BitVec 64)) V!7305)

(assert (=> b!218908 (= e!142395 (= (apply!201 lt!111752 (select (arr!5084 (_keys!6177 thiss!1504)) #b00000000000000000000000000000000)) (get!2677 (select (arr!5083 (_values!4111 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!544 (defaultEntry!4128 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!218908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5415 (_values!4111 thiss!1504))))))

(assert (=> b!218908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5416 (_keys!6177 thiss!1504))))))

(assert (= (and d!58687 c!36429) b!218891))

(assert (= (and d!58687 (not c!36429)) b!218899))

(assert (= (and b!218899 c!36428) b!218907))

(assert (= (and b!218899 (not c!36428)) b!218894))

(assert (= (and b!218894 c!36427) b!218904))

(assert (= (and b!218894 (not c!36427)) b!218896))

(assert (= (or b!218904 b!218896) bm!20428))

(assert (= (or b!218907 bm!20428) bm!20424))

(assert (= (or b!218907 b!218904) bm!20427))

(assert (= (or b!218891 bm!20424) bm!20429))

(assert (= (or b!218891 bm!20427) bm!20426))

(assert (= (and d!58687 res!107294) b!218903))

(assert (= (and d!58687 c!36430) b!218905))

(assert (= (and d!58687 (not c!36430)) b!218902))

(assert (= (and d!58687 res!107300) b!218901))

(assert (= (and b!218901 res!107295) b!218897))

(assert (= (and b!218901 (not res!107293)) b!218890))

(assert (= (and b!218890 res!107296) b!218908))

(assert (= (and b!218901 res!107301) b!218895))

(assert (= (and b!218895 c!36432) b!218893))

(assert (= (and b!218895 (not c!36432)) b!218892))

(assert (= (and b!218893 res!107299) b!218906))

(assert (= (or b!218893 b!218892) bm!20430))

(assert (= (and b!218895 res!107297) b!218898))

(assert (= (and b!218898 c!36431) b!218900))

(assert (= (and b!218898 (not c!36431)) b!218889))

(assert (= (and b!218900 res!107298) b!218888))

(assert (= (or b!218900 b!218889) bm!20425))

(declare-fun b_lambda!7849 () Bool)

(assert (=> (not b_lambda!7849) (not b!218908)))

(declare-fun t!8101 () Bool)

(declare-fun tb!2907 () Bool)

(assert (=> (and b!218665 (= (defaultEntry!4128 thiss!1504) (defaultEntry!4128 thiss!1504)) t!8101) tb!2907))

(declare-fun result!5059 () Bool)

(assert (=> tb!2907 (= result!5059 tp_is_empty!5743)))

(assert (=> b!218908 t!8101))

(declare-fun b_and!12791 () Bool)

(assert (= b_and!12785 (and (=> t!8101 result!5059) b_and!12791)))

(assert (=> d!58687 m!244721))

(declare-fun m!244751 () Bool)

(assert (=> b!218908 m!244751))

(declare-fun m!244753 () Bool)

(assert (=> b!218908 m!244753))

(declare-fun m!244755 () Bool)

(assert (=> b!218908 m!244755))

(assert (=> b!218908 m!244751))

(declare-fun m!244757 () Bool)

(assert (=> b!218908 m!244757))

(assert (=> b!218908 m!244757))

(assert (=> b!218908 m!244755))

(declare-fun m!244759 () Bool)

(assert (=> b!218908 m!244759))

(assert (=> b!218897 m!244751))

(assert (=> b!218897 m!244751))

(declare-fun m!244761 () Bool)

(assert (=> b!218897 m!244761))

(declare-fun m!244763 () Bool)

(assert (=> b!218888 m!244763))

(declare-fun m!244765 () Bool)

(assert (=> b!218906 m!244765))

(assert (=> b!218890 m!244751))

(assert (=> b!218890 m!244751))

(declare-fun m!244767 () Bool)

(assert (=> b!218890 m!244767))

(declare-fun m!244769 () Bool)

(assert (=> bm!20430 m!244769))

(assert (=> b!218903 m!244751))

(assert (=> b!218903 m!244751))

(assert (=> b!218903 m!244761))

(declare-fun m!244771 () Bool)

(assert (=> bm!20429 m!244771))

(declare-fun m!244773 () Bool)

(assert (=> bm!20426 m!244773))

(assert (=> b!218905 m!244771))

(declare-fun m!244775 () Bool)

(assert (=> b!218905 m!244775))

(declare-fun m!244777 () Bool)

(assert (=> b!218905 m!244777))

(declare-fun m!244779 () Bool)

(assert (=> b!218905 m!244779))

(declare-fun m!244781 () Bool)

(assert (=> b!218905 m!244781))

(declare-fun m!244783 () Bool)

(assert (=> b!218905 m!244783))

(declare-fun m!244785 () Bool)

(assert (=> b!218905 m!244785))

(declare-fun m!244787 () Bool)

(assert (=> b!218905 m!244787))

(assert (=> b!218905 m!244779))

(declare-fun m!244789 () Bool)

(assert (=> b!218905 m!244789))

(declare-fun m!244791 () Bool)

(assert (=> b!218905 m!244791))

(assert (=> b!218905 m!244777))

(declare-fun m!244793 () Bool)

(assert (=> b!218905 m!244793))

(assert (=> b!218905 m!244781))

(declare-fun m!244795 () Bool)

(assert (=> b!218905 m!244795))

(declare-fun m!244797 () Bool)

(assert (=> b!218905 m!244797))

(declare-fun m!244799 () Bool)

(assert (=> b!218905 m!244799))

(declare-fun m!244801 () Bool)

(assert (=> b!218905 m!244801))

(assert (=> b!218905 m!244751))

(assert (=> b!218905 m!244775))

(declare-fun m!244803 () Bool)

(assert (=> b!218905 m!244803))

(declare-fun m!244805 () Bool)

(assert (=> bm!20425 m!244805))

(declare-fun m!244807 () Bool)

(assert (=> b!218891 m!244807))

(assert (=> b!218680 d!58687))

(declare-fun d!58689 () Bool)

(assert (=> d!58689 (= (inRange!0 (ite c!36376 (index!5242 lt!111630) (index!5245 lt!111630)) (mask!9907 thiss!1504)) (and (bvsge (ite c!36376 (index!5242 lt!111630) (index!5245 lt!111630)) #b00000000000000000000000000000000) (bvslt (ite c!36376 (index!5242 lt!111630) (index!5245 lt!111630)) (bvadd (mask!9907 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!20391 d!58689))

(declare-fun d!58691 () Bool)

(declare-fun res!107306 () Bool)

(declare-fun e!142404 () Bool)

(assert (=> d!58691 (=> res!107306 e!142404)))

(assert (=> d!58691 (= res!107306 (= (select (arr!5084 (_keys!6177 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!58691 (= (arrayContainsKey!0 (_keys!6177 thiss!1504) key!932 #b00000000000000000000000000000000) e!142404)))

(declare-fun b!218915 () Bool)

(declare-fun e!142405 () Bool)

(assert (=> b!218915 (= e!142404 e!142405)))

(declare-fun res!107307 () Bool)

(assert (=> b!218915 (=> (not res!107307) (not e!142405))))

(assert (=> b!218915 (= res!107307 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5416 (_keys!6177 thiss!1504))))))

(declare-fun b!218916 () Bool)

(assert (=> b!218916 (= e!142405 (arrayContainsKey!0 (_keys!6177 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!58691 (not res!107306)) b!218915))

(assert (= (and b!218915 res!107307) b!218916))

(assert (=> d!58691 m!244751))

(declare-fun m!244809 () Bool)

(assert (=> b!218916 m!244809))

(assert (=> bm!20390 d!58691))

(declare-fun d!58693 () Bool)

(declare-fun res!107314 () Bool)

(declare-fun e!142408 () Bool)

(assert (=> d!58693 (=> (not res!107314) (not e!142408))))

(declare-fun simpleValid!224 (LongMapFixedSize!2956) Bool)

(assert (=> d!58693 (= res!107314 (simpleValid!224 thiss!1504))))

(assert (=> d!58693 (= (valid!1209 thiss!1504) e!142408)))

(declare-fun b!218923 () Bool)

(declare-fun res!107315 () Bool)

(assert (=> b!218923 (=> (not res!107315) (not e!142408))))

(declare-fun arrayCountValidKeys!0 (array!10725 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!218923 (= res!107315 (= (arrayCountValidKeys!0 (_keys!6177 thiss!1504) #b00000000000000000000000000000000 (size!5416 (_keys!6177 thiss!1504))) (_size!1527 thiss!1504)))))

(declare-fun b!218924 () Bool)

(declare-fun res!107316 () Bool)

(assert (=> b!218924 (=> (not res!107316) (not e!142408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10725 (_ BitVec 32)) Bool)

(assert (=> b!218924 (= res!107316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6177 thiss!1504) (mask!9907 thiss!1504)))))

(declare-fun b!218925 () Bool)

(declare-datatypes ((List!3153 0))(
  ( (Nil!3150) (Cons!3149 (h!3796 (_ BitVec 64)) (t!8102 List!3153)) )
))
(declare-fun arrayNoDuplicates!0 (array!10725 (_ BitVec 32) List!3153) Bool)

(assert (=> b!218925 (= e!142408 (arrayNoDuplicates!0 (_keys!6177 thiss!1504) #b00000000000000000000000000000000 Nil!3150))))

(assert (= (and d!58693 res!107314) b!218923))

(assert (= (and b!218923 res!107315) b!218924))

(assert (= (and b!218924 res!107316) b!218925))

(declare-fun m!244811 () Bool)

(assert (=> d!58693 m!244811))

(declare-fun m!244813 () Bool)

(assert (=> b!218923 m!244813))

(declare-fun m!244815 () Bool)

(assert (=> b!218924 m!244815))

(declare-fun m!244817 () Bool)

(assert (=> b!218925 m!244817))

(assert (=> start!21736 d!58693))

(declare-fun b!218932 () Bool)

(declare-fun e!142413 () Bool)

(assert (=> b!218932 (= e!142413 tp_is_empty!5743)))

(declare-fun mapNonEmpty!9786 () Bool)

(declare-fun mapRes!9786 () Bool)

(declare-fun tp!20793 () Bool)

(assert (=> mapNonEmpty!9786 (= mapRes!9786 (and tp!20793 e!142413))))

(declare-fun mapKey!9786 () (_ BitVec 32))

(declare-fun mapValue!9786 () ValueCell!2528)

(declare-fun mapRest!9786 () (Array (_ BitVec 32) ValueCell!2528))

(assert (=> mapNonEmpty!9786 (= mapRest!9777 (store mapRest!9786 mapKey!9786 mapValue!9786))))

(declare-fun b!218933 () Bool)

(declare-fun e!142414 () Bool)

(assert (=> b!218933 (= e!142414 tp_is_empty!5743)))

(declare-fun condMapEmpty!9786 () Bool)

(declare-fun mapDefault!9786 () ValueCell!2528)

(assert (=> mapNonEmpty!9777 (= condMapEmpty!9786 (= mapRest!9777 ((as const (Array (_ BitVec 32) ValueCell!2528)) mapDefault!9786)))))

(assert (=> mapNonEmpty!9777 (= tp!20777 (and e!142414 mapRes!9786))))

(declare-fun mapIsEmpty!9786 () Bool)

(assert (=> mapIsEmpty!9786 mapRes!9786))

(assert (= (and mapNonEmpty!9777 condMapEmpty!9786) mapIsEmpty!9786))

(assert (= (and mapNonEmpty!9777 (not condMapEmpty!9786)) mapNonEmpty!9786))

(assert (= (and mapNonEmpty!9786 ((_ is ValueCellFull!2528) mapValue!9786)) b!218932))

(assert (= (and mapNonEmpty!9777 ((_ is ValueCellFull!2528) mapDefault!9786)) b!218933))

(declare-fun m!244819 () Bool)

(assert (=> mapNonEmpty!9786 m!244819))

(declare-fun b_lambda!7851 () Bool)

(assert (= b_lambda!7849 (or (and b!218665 b_free!5881) b_lambda!7851)))

(check-sat (not b_next!5881) (not b_lambda!7851) (not d!58687) (not b!218897) (not b!218905) (not b!218803) (not d!58679) tp_is_empty!5743 (not bm!20408) (not b!218890) (not b!218903) (not bm!20426) (not bm!20429) (not d!58685) (not bm!20409) (not bm!20430) (not b!218845) (not b!218906) (not b!218923) b_and!12791 (not d!58677) (not d!58693) (not b!218811) (not b!218925) (not b!218843) (not b!218888) (not b!218924) (not b!218891) (not b!218908) (not d!58681) (not bm!20425) (not b!218916) (not mapNonEmpty!9786))
(check-sat b_and!12791 (not b_next!5881))
