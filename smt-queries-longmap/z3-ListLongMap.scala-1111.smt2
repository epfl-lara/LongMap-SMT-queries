; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22916 () Bool)

(assert start!22916)

(declare-fun b!238883 () Bool)

(declare-fun b_free!6415 () Bool)

(declare-fun b_next!6415 () Bool)

(assert (=> b!238883 (= b_free!6415 (not b_next!6415))))

(declare-fun tp!22449 () Bool)

(declare-fun b_and!13395 () Bool)

(assert (=> b!238883 (= tp!22449 b_and!13395)))

(declare-fun b!238867 () Bool)

(declare-datatypes ((Unit!7312 0))(
  ( (Unit!7313) )
))
(declare-fun e!155085 () Unit!7312)

(declare-fun lt!120726 () Unit!7312)

(assert (=> b!238867 (= e!155085 lt!120726)))

(declare-datatypes ((V!8017 0))(
  ( (V!8018 (val!3183 Int)) )
))
(declare-datatypes ((ValueCell!2795 0))(
  ( (ValueCellFull!2795 (v!5222 V!8017)) (EmptyCell!2795) )
))
(declare-datatypes ((array!11831 0))(
  ( (array!11832 (arr!5617 (Array (_ BitVec 32) ValueCell!2795)) (size!5958 (_ BitVec 32))) )
))
(declare-datatypes ((array!11833 0))(
  ( (array!11834 (arr!5618 (Array (_ BitVec 32) (_ BitVec 64))) (size!5959 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3490 0))(
  ( (LongMapFixedSize!3491 (defaultEntry!4430 Int) (mask!10470 (_ BitVec 32)) (extraKeys!4167 (_ BitVec 32)) (zeroValue!4271 V!8017) (minValue!4271 V!8017) (_size!1794 (_ BitVec 32)) (_keys!6532 array!11833) (_values!4413 array!11831) (_vacant!1794 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3490)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!317 (array!11833 array!11831 (_ BitVec 32) (_ BitVec 32) V!8017 V!8017 (_ BitVec 64) Int) Unit!7312)

(assert (=> b!238867 (= lt!120726 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!317 (_keys!6532 thiss!1504) (_values!4413 thiss!1504) (mask!10470 thiss!1504) (extraKeys!4167 thiss!1504) (zeroValue!4271 thiss!1504) (minValue!4271 thiss!1504) key!932 (defaultEntry!4430 thiss!1504)))))

(declare-fun c!39833 () Bool)

(declare-datatypes ((SeekEntryResult!992 0))(
  ( (MissingZero!992 (index!6138 (_ BitVec 32))) (Found!992 (index!6139 (_ BitVec 32))) (Intermediate!992 (undefined!1804 Bool) (index!6140 (_ BitVec 32)) (x!24040 (_ BitVec 32))) (Undefined!992) (MissingVacant!992 (index!6141 (_ BitVec 32))) )
))
(declare-fun lt!120727 () SeekEntryResult!992)

(get-info :version)

(assert (=> b!238867 (= c!39833 ((_ is MissingZero!992) lt!120727))))

(declare-fun e!155087 () Bool)

(assert (=> b!238867 e!155087))

(declare-fun b!238868 () Bool)

(declare-fun e!155094 () Bool)

(declare-fun call!22194 () Bool)

(assert (=> b!238868 (= e!155094 (not call!22194))))

(declare-fun b!238869 () Bool)

(declare-fun res!117060 () Bool)

(assert (=> b!238869 (= res!117060 (= (select (arr!5618 (_keys!6532 thiss!1504)) (index!6141 lt!120727)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155090 () Bool)

(assert (=> b!238869 (=> (not res!117060) (not e!155090))))

(declare-fun b!238870 () Bool)

(declare-fun res!117064 () Bool)

(declare-fun e!155093 () Bool)

(assert (=> b!238870 (=> (not res!117064) (not e!155093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238870 (= res!117064 (validMask!0 (mask!10470 thiss!1504)))))

(declare-fun b!238871 () Bool)

(declare-fun c!39832 () Bool)

(assert (=> b!238871 (= c!39832 ((_ is MissingVacant!992) lt!120727))))

(declare-fun e!155088 () Bool)

(assert (=> b!238871 (= e!155087 e!155088)))

(declare-fun b!238872 () Bool)

(assert (=> b!238872 (= e!155093 (not (= (size!5958 (_values!4413 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10470 thiss!1504)))))))

(declare-fun b!238873 () Bool)

(declare-fun e!155091 () Bool)

(declare-fun e!155084 () Bool)

(declare-fun mapRes!10647 () Bool)

(assert (=> b!238873 (= e!155091 (and e!155084 mapRes!10647))))

(declare-fun condMapEmpty!10647 () Bool)

(declare-fun mapDefault!10647 () ValueCell!2795)

(assert (=> b!238873 (= condMapEmpty!10647 (= (arr!5617 (_values!4413 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2795)) mapDefault!10647)))))

(declare-fun b!238875 () Bool)

(assert (=> b!238875 (= e!155090 (not call!22194))))

(declare-fun b!238876 () Bool)

(declare-fun e!155083 () Bool)

(declare-fun e!155086 () Bool)

(assert (=> b!238876 (= e!155083 e!155086)))

(declare-fun res!117068 () Bool)

(assert (=> b!238876 (=> (not res!117068) (not e!155086))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238876 (= res!117068 (or (= lt!120727 (MissingZero!992 index!297)) (= lt!120727 (MissingVacant!992 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11833 (_ BitVec 32)) SeekEntryResult!992)

(assert (=> b!238876 (= lt!120727 (seekEntryOrOpen!0 key!932 (_keys!6532 thiss!1504) (mask!10470 thiss!1504)))))

(declare-fun b!238877 () Bool)

(declare-fun tp_is_empty!6277 () Bool)

(assert (=> b!238877 (= e!155084 tp_is_empty!6277)))

(declare-fun b!238878 () Bool)

(assert (=> b!238878 (= e!155088 e!155090)))

(declare-fun res!117065 () Bool)

(declare-fun call!22193 () Bool)

(assert (=> b!238878 (= res!117065 call!22193)))

(assert (=> b!238878 (=> (not res!117065) (not e!155090))))

(declare-fun b!238879 () Bool)

(declare-fun res!117061 () Bool)

(assert (=> b!238879 (=> (not res!117061) (not e!155083))))

(assert (=> b!238879 (= res!117061 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238880 () Bool)

(assert (=> b!238880 (= e!155086 e!155093)))

(declare-fun res!117062 () Bool)

(assert (=> b!238880 (=> (not res!117062) (not e!155093))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!238880 (= res!117062 (inRange!0 index!297 (mask!10470 thiss!1504)))))

(declare-fun lt!120728 () Unit!7312)

(assert (=> b!238880 (= lt!120728 e!155085)))

(declare-fun c!39834 () Bool)

(declare-datatypes ((tuple2!4618 0))(
  ( (tuple2!4619 (_1!2320 (_ BitVec 64)) (_2!2320 V!8017)) )
))
(declare-datatypes ((List!3506 0))(
  ( (Nil!3503) (Cons!3502 (h!4158 tuple2!4618) (t!8493 List!3506)) )
))
(declare-datatypes ((ListLongMap!3533 0))(
  ( (ListLongMap!3534 (toList!1782 List!3506)) )
))
(declare-fun contains!1684 (ListLongMap!3533 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1314 (array!11833 array!11831 (_ BitVec 32) (_ BitVec 32) V!8017 V!8017 (_ BitVec 32) Int) ListLongMap!3533)

(assert (=> b!238880 (= c!39834 (contains!1684 (getCurrentListMap!1314 (_keys!6532 thiss!1504) (_values!4413 thiss!1504) (mask!10470 thiss!1504) (extraKeys!4167 thiss!1504) (zeroValue!4271 thiss!1504) (minValue!4271 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4430 thiss!1504)) key!932))))

(declare-fun b!238881 () Bool)

(declare-fun Unit!7314 () Unit!7312)

(assert (=> b!238881 (= e!155085 Unit!7314)))

(declare-fun lt!120725 () Unit!7312)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!324 (array!11833 array!11831 (_ BitVec 32) (_ BitVec 32) V!8017 V!8017 (_ BitVec 64) Int) Unit!7312)

(assert (=> b!238881 (= lt!120725 (lemmaInListMapThenSeekEntryOrOpenFindsIt!324 (_keys!6532 thiss!1504) (_values!4413 thiss!1504) (mask!10470 thiss!1504) (extraKeys!4167 thiss!1504) (zeroValue!4271 thiss!1504) (minValue!4271 thiss!1504) key!932 (defaultEntry!4430 thiss!1504)))))

(assert (=> b!238881 false))

(declare-fun bm!22190 () Bool)

(declare-fun arrayContainsKey!0 (array!11833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22190 (= call!22194 (arrayContainsKey!0 (_keys!6532 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22191 () Bool)

(assert (=> bm!22191 (= call!22193 (inRange!0 (ite c!39833 (index!6138 lt!120727) (index!6141 lt!120727)) (mask!10470 thiss!1504)))))

(declare-fun b!238882 () Bool)

(assert (=> b!238882 (= e!155088 ((_ is Undefined!992) lt!120727))))

(declare-fun e!155082 () Bool)

(declare-fun array_inv!3691 (array!11833) Bool)

(declare-fun array_inv!3692 (array!11831) Bool)

(assert (=> b!238883 (= e!155082 (and tp!22449 tp_is_empty!6277 (array_inv!3691 (_keys!6532 thiss!1504)) (array_inv!3692 (_values!4413 thiss!1504)) e!155091))))

(declare-fun b!238884 () Bool)

(declare-fun e!155089 () Bool)

(assert (=> b!238884 (= e!155089 tp_is_empty!6277)))

(declare-fun mapNonEmpty!10647 () Bool)

(declare-fun tp!22448 () Bool)

(assert (=> mapNonEmpty!10647 (= mapRes!10647 (and tp!22448 e!155089))))

(declare-fun mapValue!10647 () ValueCell!2795)

(declare-fun mapKey!10647 () (_ BitVec 32))

(declare-fun mapRest!10647 () (Array (_ BitVec 32) ValueCell!2795))

(assert (=> mapNonEmpty!10647 (= (arr!5617 (_values!4413 thiss!1504)) (store mapRest!10647 mapKey!10647 mapValue!10647))))

(declare-fun b!238885 () Bool)

(declare-fun res!117066 () Bool)

(assert (=> b!238885 (=> (not res!117066) (not e!155093))))

(assert (=> b!238885 (= res!117066 (arrayContainsKey!0 (_keys!6532 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238874 () Bool)

(declare-fun res!117067 () Bool)

(assert (=> b!238874 (=> (not res!117067) (not e!155094))))

(assert (=> b!238874 (= res!117067 (= (select (arr!5618 (_keys!6532 thiss!1504)) (index!6138 lt!120727)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!117059 () Bool)

(assert (=> start!22916 (=> (not res!117059) (not e!155083))))

(declare-fun valid!1388 (LongMapFixedSize!3490) Bool)

(assert (=> start!22916 (= res!117059 (valid!1388 thiss!1504))))

(assert (=> start!22916 e!155083))

(assert (=> start!22916 e!155082))

(assert (=> start!22916 true))

(declare-fun mapIsEmpty!10647 () Bool)

(assert (=> mapIsEmpty!10647 mapRes!10647))

(declare-fun b!238886 () Bool)

(declare-fun res!117063 () Bool)

(assert (=> b!238886 (=> (not res!117063) (not e!155094))))

(assert (=> b!238886 (= res!117063 call!22193)))

(assert (=> b!238886 (= e!155087 e!155094)))

(assert (= (and start!22916 res!117059) b!238879))

(assert (= (and b!238879 res!117061) b!238876))

(assert (= (and b!238876 res!117068) b!238880))

(assert (= (and b!238880 c!39834) b!238881))

(assert (= (and b!238880 (not c!39834)) b!238867))

(assert (= (and b!238867 c!39833) b!238886))

(assert (= (and b!238867 (not c!39833)) b!238871))

(assert (= (and b!238886 res!117063) b!238874))

(assert (= (and b!238874 res!117067) b!238868))

(assert (= (and b!238871 c!39832) b!238878))

(assert (= (and b!238871 (not c!39832)) b!238882))

(assert (= (and b!238878 res!117065) b!238869))

(assert (= (and b!238869 res!117060) b!238875))

(assert (= (or b!238886 b!238878) bm!22191))

(assert (= (or b!238868 b!238875) bm!22190))

(assert (= (and b!238880 res!117062) b!238885))

(assert (= (and b!238885 res!117066) b!238870))

(assert (= (and b!238870 res!117064) b!238872))

(assert (= (and b!238873 condMapEmpty!10647) mapIsEmpty!10647))

(assert (= (and b!238873 (not condMapEmpty!10647)) mapNonEmpty!10647))

(assert (= (and mapNonEmpty!10647 ((_ is ValueCellFull!2795) mapValue!10647)) b!238884))

(assert (= (and b!238873 ((_ is ValueCellFull!2795) mapDefault!10647)) b!238877))

(assert (= b!238883 b!238873))

(assert (= start!22916 b!238883))

(declare-fun m!259381 () Bool)

(assert (=> start!22916 m!259381))

(declare-fun m!259383 () Bool)

(assert (=> bm!22190 m!259383))

(declare-fun m!259385 () Bool)

(assert (=> b!238876 m!259385))

(declare-fun m!259387 () Bool)

(assert (=> b!238867 m!259387))

(declare-fun m!259389 () Bool)

(assert (=> b!238883 m!259389))

(declare-fun m!259391 () Bool)

(assert (=> b!238883 m!259391))

(declare-fun m!259393 () Bool)

(assert (=> b!238880 m!259393))

(declare-fun m!259395 () Bool)

(assert (=> b!238880 m!259395))

(assert (=> b!238880 m!259395))

(declare-fun m!259397 () Bool)

(assert (=> b!238880 m!259397))

(assert (=> b!238885 m!259383))

(declare-fun m!259399 () Bool)

(assert (=> bm!22191 m!259399))

(declare-fun m!259401 () Bool)

(assert (=> b!238881 m!259401))

(declare-fun m!259403 () Bool)

(assert (=> b!238869 m!259403))

(declare-fun m!259405 () Bool)

(assert (=> b!238870 m!259405))

(declare-fun m!259407 () Bool)

(assert (=> b!238874 m!259407))

(declare-fun m!259409 () Bool)

(assert (=> mapNonEmpty!10647 m!259409))

(check-sat (not b!238881) (not bm!22191) (not b_next!6415) (not bm!22190) tp_is_empty!6277 b_and!13395 (not mapNonEmpty!10647) (not b!238867) (not b!238880) (not b!238883) (not b!238870) (not b!238876) (not start!22916) (not b!238885))
(check-sat b_and!13395 (not b_next!6415))
