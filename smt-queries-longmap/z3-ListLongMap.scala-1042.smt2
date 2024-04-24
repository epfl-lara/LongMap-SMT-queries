; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21938 () Bool)

(assert start!21938)

(declare-fun b!223573 () Bool)

(declare-fun b_free!6001 () Bool)

(declare-fun b_next!6001 () Bool)

(assert (=> b!223573 (= b_free!6001 (not b_next!6001))))

(declare-fun tp!21145 () Bool)

(declare-fun b_and!12913 () Bool)

(assert (=> b!223573 (= tp!21145 b_and!12913)))

(declare-fun b!223556 () Bool)

(declare-fun res!109891 () Bool)

(declare-fun e!145213 () Bool)

(assert (=> b!223556 (=> (not res!109891) (not e!145213))))

(declare-fun call!20825 () Bool)

(assert (=> b!223556 (= res!109891 call!20825)))

(declare-fun e!145207 () Bool)

(assert (=> b!223556 (= e!145207 e!145213)))

(declare-fun b!223557 () Bool)

(declare-fun e!145222 () Bool)

(declare-fun e!145220 () Bool)

(assert (=> b!223557 (= e!145222 e!145220)))

(declare-fun res!109873 () Bool)

(assert (=> b!223557 (=> (not res!109873) (not e!145220))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7465 0))(
  ( (V!7466 (val!2976 Int)) )
))
(declare-datatypes ((ValueCell!2588 0))(
  ( (ValueCellFull!2588 (v!4997 V!7465)) (EmptyCell!2588) )
))
(declare-datatypes ((array!10967 0))(
  ( (array!10968 (arr!5203 (Array (_ BitVec 32) ValueCell!2588)) (size!5536 (_ BitVec 32))) )
))
(declare-datatypes ((array!10969 0))(
  ( (array!10970 (arr!5204 (Array (_ BitVec 32) (_ BitVec 64))) (size!5537 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3076 0))(
  ( (LongMapFixedSize!3077 (defaultEntry!4197 Int) (mask!10025 (_ BitVec 32)) (extraKeys!3934 (_ BitVec 32)) (zeroValue!4038 V!7465) (minValue!4038 V!7465) (_size!1587 (_ BitVec 32)) (_keys!6251 array!10969) (_values!4180 array!10967) (_vacant!1587 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3076)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223557 (= res!109873 (inRange!0 index!297 (mask!10025 thiss!1504)))))

(declare-datatypes ((Unit!6673 0))(
  ( (Unit!6674) )
))
(declare-fun lt!112979 () Unit!6673)

(declare-fun e!145217 () Unit!6673)

(assert (=> b!223557 (= lt!112979 e!145217)))

(declare-fun c!37116 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4328 0))(
  ( (tuple2!4329 (_1!2175 (_ BitVec 64)) (_2!2175 V!7465)) )
))
(declare-datatypes ((List!3228 0))(
  ( (Nil!3225) (Cons!3224 (h!3872 tuple2!4328) (t!8179 List!3228)) )
))
(declare-datatypes ((ListLongMap!3243 0))(
  ( (ListLongMap!3244 (toList!1637 List!3228)) )
))
(declare-fun contains!1514 (ListLongMap!3243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1169 (array!10969 array!10967 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 32) Int) ListLongMap!3243)

(assert (=> b!223557 (= c!37116 (contains!1514 (getCurrentListMap!1169 (_keys!6251 thiss!1504) (_values!4180 thiss!1504) (mask!10025 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4197 thiss!1504)) key!932))))

(declare-fun b!223558 () Bool)

(declare-fun e!145218 () Bool)

(declare-fun e!145208 () Bool)

(assert (=> b!223558 (= e!145218 e!145208)))

(declare-fun res!109887 () Bool)

(assert (=> b!223558 (= res!109887 call!20825)))

(assert (=> b!223558 (=> (not res!109887) (not e!145208))))

(declare-fun mapIsEmpty!9964 () Bool)

(declare-fun mapRes!9964 () Bool)

(assert (=> mapIsEmpty!9964 mapRes!9964))

(declare-fun mapNonEmpty!9964 () Bool)

(declare-fun tp!21144 () Bool)

(declare-fun e!145211 () Bool)

(assert (=> mapNonEmpty!9964 (= mapRes!9964 (and tp!21144 e!145211))))

(declare-fun mapKey!9964 () (_ BitVec 32))

(declare-fun mapRest!9964 () (Array (_ BitVec 32) ValueCell!2588))

(declare-fun mapValue!9964 () ValueCell!2588)

(assert (=> mapNonEmpty!9964 (= (arr!5203 (_values!4180 thiss!1504)) (store mapRest!9964 mapKey!9964 mapValue!9964))))

(declare-fun b!223559 () Bool)

(declare-fun res!109879 () Bool)

(declare-fun e!145212 () Bool)

(assert (=> b!223559 (=> (not res!109879) (not e!145212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223559 (= res!109879 (validKeyInArray!0 key!932))))

(declare-fun b!223560 () Bool)

(declare-fun e!145223 () Bool)

(declare-fun e!145221 () Bool)

(assert (=> b!223560 (= e!145223 (and e!145221 mapRes!9964))))

(declare-fun condMapEmpty!9964 () Bool)

(declare-fun mapDefault!9964 () ValueCell!2588)

(assert (=> b!223560 (= condMapEmpty!9964 (= (arr!5203 (_values!4180 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2588)) mapDefault!9964)))))

(declare-fun b!223561 () Bool)

(declare-fun e!145206 () Unit!6673)

(declare-fun Unit!6675 () Unit!6673)

(assert (=> b!223561 (= e!145206 Unit!6675)))

(declare-fun b!223562 () Bool)

(declare-fun res!109890 () Bool)

(assert (=> b!223562 (=> (not res!109890) (not e!145212))))

(assert (=> b!223562 (= res!109890 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5537 (_keys!6251 thiss!1504)))))))

(declare-fun b!223563 () Bool)

(declare-fun Unit!6676 () Unit!6673)

(assert (=> b!223563 (= e!145217 Unit!6676)))

(declare-fun lt!112980 () Unit!6673)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!227 (array!10969 array!10967 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 64) Int) Unit!6673)

(assert (=> b!223563 (= lt!112980 (lemmaInListMapThenSeekEntryOrOpenFindsIt!227 (_keys!6251 thiss!1504) (_values!4180 thiss!1504) (mask!10025 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) key!932 (defaultEntry!4197 thiss!1504)))))

(assert (=> b!223563 false))

(declare-fun b!223564 () Bool)

(declare-fun tp_is_empty!5863 () Bool)

(assert (=> b!223564 (= e!145211 tp_is_empty!5863)))

(declare-fun b!223565 () Bool)

(declare-fun e!145219 () Bool)

(declare-fun e!145209 () Bool)

(assert (=> b!223565 (= e!145219 e!145209)))

(declare-fun res!109876 () Bool)

(assert (=> b!223565 (=> (not res!109876) (not e!145209))))

(assert (=> b!223565 (= res!109876 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!223566 () Bool)

(declare-fun res!109885 () Bool)

(assert (=> b!223566 (=> (not res!109885) (not e!145212))))

(declare-datatypes ((List!3229 0))(
  ( (Nil!3226) (Cons!3225 (h!3873 (_ BitVec 64)) (t!8180 List!3229)) )
))
(declare-fun noDuplicate!78 (List!3229) Bool)

(assert (=> b!223566 (= res!109885 (noDuplicate!78 Nil!3226))))

(declare-fun b!223567 () Bool)

(declare-fun e!145215 () Bool)

(declare-fun contains!1515 (List!3229 (_ BitVec 64)) Bool)

(assert (=> b!223567 (= e!145215 (contains!1515 Nil!3226 key!932))))

(declare-fun b!223568 () Bool)

(declare-fun call!20826 () Bool)

(assert (=> b!223568 (= e!145208 (not call!20826))))

(declare-fun b!223569 () Bool)

(declare-fun res!109880 () Bool)

(assert (=> b!223569 (=> (not res!109880) (not e!145212))))

(assert (=> b!223569 (= res!109880 (not (contains!1515 Nil!3226 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223570 () Bool)

(declare-fun res!109872 () Bool)

(assert (=> b!223570 (=> (not res!109872) (not e!145212))))

(assert (=> b!223570 (= res!109872 (not (contains!1515 Nil!3226 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!20822 () Bool)

(declare-fun arrayContainsKey!0 (array!10969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20822 (= call!20826 (arrayContainsKey!0 (_keys!6251 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223571 () Bool)

(declare-fun res!109888 () Bool)

(assert (=> b!223571 (=> (not res!109888) (not e!145212))))

(assert (=> b!223571 (= res!109888 e!145219)))

(declare-fun res!109886 () Bool)

(assert (=> b!223571 (=> res!109886 e!145219)))

(assert (=> b!223571 (= res!109886 e!145215)))

(declare-fun res!109884 () Bool)

(assert (=> b!223571 (=> (not res!109884) (not e!145215))))

(assert (=> b!223571 (= res!109884 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223572 () Bool)

(declare-fun res!109883 () Bool)

(declare-fun e!145214 () Bool)

(assert (=> b!223572 (=> (not res!109883) (not e!145214))))

(assert (=> b!223572 (= res!109883 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!145210 () Bool)

(declare-fun array_inv!3415 (array!10969) Bool)

(declare-fun array_inv!3416 (array!10967) Bool)

(assert (=> b!223573 (= e!145210 (and tp!21145 tp_is_empty!5863 (array_inv!3415 (_keys!6251 thiss!1504)) (array_inv!3416 (_values!4180 thiss!1504)) e!145223))))

(declare-fun b!223574 () Bool)

(assert (=> b!223574 (= e!145214 e!145222)))

(declare-fun res!109874 () Bool)

(assert (=> b!223574 (=> (not res!109874) (not e!145222))))

(declare-datatypes ((SeekEntryResult!820 0))(
  ( (MissingZero!820 (index!5450 (_ BitVec 32))) (Found!820 (index!5451 (_ BitVec 32))) (Intermediate!820 (undefined!1632 Bool) (index!5452 (_ BitVec 32)) (x!23072 (_ BitVec 32))) (Undefined!820) (MissingVacant!820 (index!5453 (_ BitVec 32))) )
))
(declare-fun lt!112977 () SeekEntryResult!820)

(assert (=> b!223574 (= res!109874 (or (= lt!112977 (MissingZero!820 index!297)) (= lt!112977 (MissingVacant!820 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10969 (_ BitVec 32)) SeekEntryResult!820)

(assert (=> b!223574 (= lt!112977 (seekEntryOrOpen!0 key!932 (_keys!6251 thiss!1504) (mask!10025 thiss!1504)))))

(declare-fun b!223575 () Bool)

(assert (=> b!223575 (= e!145220 e!145212)))

(declare-fun res!109877 () Bool)

(assert (=> b!223575 (=> (not res!109877) (not e!145212))))

(assert (=> b!223575 (= res!109877 (and (bvslt (size!5537 (_keys!6251 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5537 (_keys!6251 thiss!1504)))))))

(declare-fun lt!112978 () Unit!6673)

(assert (=> b!223575 (= lt!112978 e!145206)))

(declare-fun c!37114 () Bool)

(declare-fun lt!112984 () Bool)

(assert (=> b!223575 (= c!37114 lt!112984)))

(assert (=> b!223575 (= lt!112984 (arrayContainsKey!0 (_keys!6251 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223576 () Bool)

(assert (=> b!223576 (= e!145212 false)))

(declare-fun lt!112983 () Bool)

(assert (=> b!223576 (= lt!112983 (contains!1515 Nil!3226 key!932))))

(declare-fun b!223577 () Bool)

(get-info :version)

(assert (=> b!223577 (= e!145218 ((_ is Undefined!820) lt!112977))))

(declare-fun b!223578 () Bool)

(declare-fun res!109881 () Bool)

(assert (=> b!223578 (=> (not res!109881) (not e!145212))))

(declare-fun arrayNoDuplicates!0 (array!10969 (_ BitVec 32) List!3229) Bool)

(assert (=> b!223578 (= res!109881 (arrayNoDuplicates!0 (_keys!6251 thiss!1504) #b00000000000000000000000000000000 Nil!3226))))

(declare-fun b!223579 () Bool)

(assert (=> b!223579 (= e!145221 tp_is_empty!5863)))

(declare-fun c!37117 () Bool)

(declare-fun bm!20823 () Bool)

(assert (=> bm!20823 (= call!20825 (inRange!0 (ite c!37117 (index!5450 lt!112977) (index!5453 lt!112977)) (mask!10025 thiss!1504)))))

(declare-fun b!223580 () Bool)

(declare-fun res!109875 () Bool)

(assert (=> b!223580 (=> (not res!109875) (not e!145212))))

(assert (=> b!223580 (= res!109875 (not lt!112984))))

(declare-fun b!223581 () Bool)

(assert (=> b!223581 (= e!145209 (not (contains!1515 Nil!3226 key!932)))))

(declare-fun b!223582 () Bool)

(declare-fun res!109882 () Bool)

(assert (=> b!223582 (=> (not res!109882) (not e!145213))))

(assert (=> b!223582 (= res!109882 (= (select (arr!5204 (_keys!6251 thiss!1504)) (index!5450 lt!112977)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223583 () Bool)

(declare-fun c!37115 () Bool)

(assert (=> b!223583 (= c!37115 ((_ is MissingVacant!820) lt!112977))))

(assert (=> b!223583 (= e!145207 e!145218)))

(declare-fun b!223584 () Bool)

(declare-fun Unit!6677 () Unit!6673)

(assert (=> b!223584 (= e!145206 Unit!6677)))

(declare-fun lt!112981 () Unit!6673)

(declare-fun lemmaArrayContainsKeyThenInListMap!66 (array!10969 array!10967 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 64) (_ BitVec 32) Int) Unit!6673)

(assert (=> b!223584 (= lt!112981 (lemmaArrayContainsKeyThenInListMap!66 (_keys!6251 thiss!1504) (_values!4180 thiss!1504) (mask!10025 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4197 thiss!1504)))))

(assert (=> b!223584 false))

(declare-fun b!223585 () Bool)

(declare-fun res!109878 () Bool)

(assert (=> b!223585 (= res!109878 (= (select (arr!5204 (_keys!6251 thiss!1504)) (index!5453 lt!112977)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223585 (=> (not res!109878) (not e!145208))))

(declare-fun b!223586 () Bool)

(declare-fun lt!112982 () Unit!6673)

(assert (=> b!223586 (= e!145217 lt!112982)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!222 (array!10969 array!10967 (_ BitVec 32) (_ BitVec 32) V!7465 V!7465 (_ BitVec 64) Int) Unit!6673)

(assert (=> b!223586 (= lt!112982 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!222 (_keys!6251 thiss!1504) (_values!4180 thiss!1504) (mask!10025 thiss!1504) (extraKeys!3934 thiss!1504) (zeroValue!4038 thiss!1504) (minValue!4038 thiss!1504) key!932 (defaultEntry!4197 thiss!1504)))))

(assert (=> b!223586 (= c!37117 ((_ is MissingZero!820) lt!112977))))

(assert (=> b!223586 e!145207))

(declare-fun b!223587 () Bool)

(assert (=> b!223587 (= e!145213 (not call!20826))))

(declare-fun res!109889 () Bool)

(assert (=> start!21938 (=> (not res!109889) (not e!145214))))

(declare-fun valid!1245 (LongMapFixedSize!3076) Bool)

(assert (=> start!21938 (= res!109889 (valid!1245 thiss!1504))))

(assert (=> start!21938 e!145214))

(assert (=> start!21938 e!145210))

(assert (=> start!21938 true))

(assert (= (and start!21938 res!109889) b!223572))

(assert (= (and b!223572 res!109883) b!223574))

(assert (= (and b!223574 res!109874) b!223557))

(assert (= (and b!223557 c!37116) b!223563))

(assert (= (and b!223557 (not c!37116)) b!223586))

(assert (= (and b!223586 c!37117) b!223556))

(assert (= (and b!223586 (not c!37117)) b!223583))

(assert (= (and b!223556 res!109891) b!223582))

(assert (= (and b!223582 res!109882) b!223587))

(assert (= (and b!223583 c!37115) b!223558))

(assert (= (and b!223583 (not c!37115)) b!223577))

(assert (= (and b!223558 res!109887) b!223585))

(assert (= (and b!223585 res!109878) b!223568))

(assert (= (or b!223556 b!223558) bm!20823))

(assert (= (or b!223587 b!223568) bm!20822))

(assert (= (and b!223557 res!109873) b!223575))

(assert (= (and b!223575 c!37114) b!223584))

(assert (= (and b!223575 (not c!37114)) b!223561))

(assert (= (and b!223575 res!109877) b!223566))

(assert (= (and b!223566 res!109885) b!223570))

(assert (= (and b!223570 res!109872) b!223569))

(assert (= (and b!223569 res!109880) b!223571))

(assert (= (and b!223571 res!109884) b!223567))

(assert (= (and b!223571 (not res!109886)) b!223565))

(assert (= (and b!223565 res!109876) b!223581))

(assert (= (and b!223571 res!109888) b!223578))

(assert (= (and b!223578 res!109881) b!223562))

(assert (= (and b!223562 res!109890) b!223559))

(assert (= (and b!223559 res!109879) b!223580))

(assert (= (and b!223580 res!109875) b!223576))

(assert (= (and b!223560 condMapEmpty!9964) mapIsEmpty!9964))

(assert (= (and b!223560 (not condMapEmpty!9964)) mapNonEmpty!9964))

(assert (= (and mapNonEmpty!9964 ((_ is ValueCellFull!2588) mapValue!9964)) b!223564))

(assert (= (and b!223560 ((_ is ValueCellFull!2588) mapDefault!9964)) b!223579))

(assert (= b!223573 b!223560))

(assert (= start!21938 b!223573))

(declare-fun m!247219 () Bool)

(assert (=> b!223586 m!247219))

(declare-fun m!247221 () Bool)

(assert (=> b!223578 m!247221))

(declare-fun m!247223 () Bool)

(assert (=> start!21938 m!247223))

(declare-fun m!247225 () Bool)

(assert (=> b!223574 m!247225))

(declare-fun m!247227 () Bool)

(assert (=> b!223559 m!247227))

(declare-fun m!247229 () Bool)

(assert (=> b!223566 m!247229))

(declare-fun m!247231 () Bool)

(assert (=> b!223567 m!247231))

(assert (=> b!223581 m!247231))

(declare-fun m!247233 () Bool)

(assert (=> bm!20823 m!247233))

(declare-fun m!247235 () Bool)

(assert (=> b!223584 m!247235))

(declare-fun m!247237 () Bool)

(assert (=> b!223563 m!247237))

(declare-fun m!247239 () Bool)

(assert (=> b!223582 m!247239))

(assert (=> b!223576 m!247231))

(declare-fun m!247241 () Bool)

(assert (=> b!223557 m!247241))

(declare-fun m!247243 () Bool)

(assert (=> b!223557 m!247243))

(assert (=> b!223557 m!247243))

(declare-fun m!247245 () Bool)

(assert (=> b!223557 m!247245))

(declare-fun m!247247 () Bool)

(assert (=> b!223569 m!247247))

(declare-fun m!247249 () Bool)

(assert (=> b!223570 m!247249))

(declare-fun m!247251 () Bool)

(assert (=> bm!20822 m!247251))

(declare-fun m!247253 () Bool)

(assert (=> b!223573 m!247253))

(declare-fun m!247255 () Bool)

(assert (=> b!223573 m!247255))

(assert (=> b!223575 m!247251))

(declare-fun m!247257 () Bool)

(assert (=> b!223585 m!247257))

(declare-fun m!247259 () Bool)

(assert (=> mapNonEmpty!9964 m!247259))

(check-sat (not b!223557) b_and!12913 (not b!223578) (not b!223566) (not b!223567) (not b!223575) (not b!223563) (not b!223570) (not b!223581) (not b!223569) (not b!223576) (not bm!20822) (not b!223586) (not b!223559) (not bm!20823) (not b!223573) (not b!223574) tp_is_empty!5863 (not mapNonEmpty!9964) (not b_next!6001) (not start!21938) (not b!223584))
(check-sat b_and!12913 (not b_next!6001))
