; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21846 () Bool)

(assert start!21846)

(declare-fun b!220143 () Bool)

(declare-fun b_free!5913 () Bool)

(declare-fun b_next!5913 () Bool)

(assert (=> b!220143 (= b_free!5913 (not b_next!5913))))

(declare-fun tp!20880 () Bool)

(declare-fun b_and!12811 () Bool)

(assert (=> b!220143 (= tp!20880 b_and!12811)))

(declare-fun b!220126 () Bool)

(declare-fun c!36641 () Bool)

(declare-datatypes ((SeekEntryResult!807 0))(
  ( (MissingZero!807 (index!5398 (_ BitVec 32))) (Found!807 (index!5399 (_ BitVec 32))) (Intermediate!807 (undefined!1619 Bool) (index!5400 (_ BitVec 32)) (x!22939 (_ BitVec 32))) (Undefined!807) (MissingVacant!807 (index!5401 (_ BitVec 32))) )
))
(declare-fun lt!112109 () SeekEntryResult!807)

(get-info :version)

(assert (=> b!220126 (= c!36641 ((_ is MissingVacant!807) lt!112109))))

(declare-fun e!143151 () Bool)

(declare-fun e!143147 () Bool)

(assert (=> b!220126 (= e!143151 e!143147)))

(declare-fun mapNonEmpty!9832 () Bool)

(declare-fun mapRes!9832 () Bool)

(declare-fun tp!20881 () Bool)

(declare-fun e!143141 () Bool)

(assert (=> mapNonEmpty!9832 (= mapRes!9832 (and tp!20881 e!143141))))

(declare-datatypes ((V!7347 0))(
  ( (V!7348 (val!2932 Int)) )
))
(declare-datatypes ((ValueCell!2544 0))(
  ( (ValueCellFull!2544 (v!4952 V!7347)) (EmptyCell!2544) )
))
(declare-fun mapValue!9832 () ValueCell!2544)

(declare-datatypes ((array!10793 0))(
  ( (array!10794 (arr!5116 (Array (_ BitVec 32) ValueCell!2544)) (size!5449 (_ BitVec 32))) )
))
(declare-datatypes ((array!10795 0))(
  ( (array!10796 (arr!5117 (Array (_ BitVec 32) (_ BitVec 64))) (size!5450 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2988 0))(
  ( (LongMapFixedSize!2989 (defaultEntry!4153 Int) (mask!9951 (_ BitVec 32)) (extraKeys!3890 (_ BitVec 32)) (zeroValue!3994 V!7347) (minValue!3994 V!7347) (_size!1543 (_ BitVec 32)) (_keys!6207 array!10795) (_values!4136 array!10793) (_vacant!1543 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2988)

(declare-fun mapRest!9832 () (Array (_ BitVec 32) ValueCell!2544))

(declare-fun mapKey!9832 () (_ BitVec 32))

(assert (=> mapNonEmpty!9832 (= (arr!5116 (_values!4136 thiss!1504)) (store mapRest!9832 mapKey!9832 mapValue!9832))))

(declare-fun b!220127 () Bool)

(declare-fun res!107922 () Bool)

(declare-fun e!143146 () Bool)

(assert (=> b!220127 (=> (not res!107922) (not e!143146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220127 (= res!107922 (validMask!0 (mask!9951 thiss!1504)))))

(declare-fun b!220128 () Bool)

(declare-fun res!107925 () Bool)

(assert (=> b!220128 (= res!107925 (= (select (arr!5117 (_keys!6207 thiss!1504)) (index!5401 lt!112109)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143143 () Bool)

(assert (=> b!220128 (=> (not res!107925) (not e!143143))))

(declare-fun b!220129 () Bool)

(declare-fun e!143152 () Bool)

(declare-fun tp_is_empty!5775 () Bool)

(assert (=> b!220129 (= e!143152 tp_is_empty!5775)))

(declare-fun b!220130 () Bool)

(declare-fun e!143148 () Bool)

(declare-fun call!20574 () Bool)

(assert (=> b!220130 (= e!143148 (not call!20574))))

(declare-fun mapIsEmpty!9832 () Bool)

(assert (=> mapIsEmpty!9832 mapRes!9832))

(declare-fun b!220131 () Bool)

(declare-fun res!107927 () Bool)

(assert (=> b!220131 (=> (not res!107927) (not e!143148))))

(assert (=> b!220131 (= res!107927 (= (select (arr!5117 (_keys!6207 thiss!1504)) (index!5398 lt!112109)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220132 () Bool)

(assert (=> b!220132 (= e!143141 tp_is_empty!5775)))

(declare-fun b!220133 () Bool)

(declare-fun res!107924 () Bool)

(assert (=> b!220133 (=> (not res!107924) (not e!143148))))

(declare-fun call!20573 () Bool)

(assert (=> b!220133 (= res!107924 call!20573)))

(assert (=> b!220133 (= e!143151 e!143148)))

(declare-fun c!36640 () Bool)

(declare-fun bm!20570 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20570 (= call!20573 (inRange!0 (ite c!36640 (index!5398 lt!112109) (index!5401 lt!112109)) (mask!9951 thiss!1504)))))

(declare-fun b!220134 () Bool)

(declare-fun e!143145 () Bool)

(declare-fun e!143153 () Bool)

(assert (=> b!220134 (= e!143145 e!143153)))

(declare-fun res!107918 () Bool)

(assert (=> b!220134 (=> (not res!107918) (not e!143153))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220134 (= res!107918 (or (= lt!112109 (MissingZero!807 index!297)) (= lt!112109 (MissingVacant!807 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10795 (_ BitVec 32)) SeekEntryResult!807)

(assert (=> b!220134 (= lt!112109 (seekEntryOrOpen!0 key!932 (_keys!6207 thiss!1504) (mask!9951 thiss!1504)))))

(declare-fun b!220135 () Bool)

(declare-fun res!107928 () Bool)

(assert (=> b!220135 (=> (not res!107928) (not e!143146))))

(declare-fun arrayContainsKey!0 (array!10795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220135 (= res!107928 (arrayContainsKey!0 (_keys!6207 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!107921 () Bool)

(assert (=> start!21846 (=> (not res!107921) (not e!143145))))

(declare-fun valid!1207 (LongMapFixedSize!2988) Bool)

(assert (=> start!21846 (= res!107921 (valid!1207 thiss!1504))))

(assert (=> start!21846 e!143145))

(declare-fun e!143142 () Bool)

(assert (=> start!21846 e!143142))

(assert (=> start!21846 true))

(declare-fun b!220136 () Bool)

(assert (=> b!220136 (= e!143147 e!143143)))

(declare-fun res!107919 () Bool)

(assert (=> b!220136 (= res!107919 call!20573)))

(assert (=> b!220136 (=> (not res!107919) (not e!143143))))

(declare-fun b!220137 () Bool)

(declare-fun res!107926 () Bool)

(assert (=> b!220137 (=> (not res!107926) (not e!143145))))

(assert (=> b!220137 (= res!107926 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220138 () Bool)

(assert (=> b!220138 (= e!143146 false)))

(declare-fun lt!112110 () Bool)

(declare-datatypes ((List!3257 0))(
  ( (Nil!3254) (Cons!3253 (h!3901 (_ BitVec 64)) (t!8216 List!3257)) )
))
(declare-fun arrayNoDuplicates!0 (array!10795 (_ BitVec 32) List!3257) Bool)

(assert (=> b!220138 (= lt!112110 (arrayNoDuplicates!0 (_keys!6207 thiss!1504) #b00000000000000000000000000000000 Nil!3254))))

(declare-fun b!220139 () Bool)

(assert (=> b!220139 (= e!143143 (not call!20574))))

(declare-fun b!220140 () Bool)

(assert (=> b!220140 (= e!143153 e!143146)))

(declare-fun res!107929 () Bool)

(assert (=> b!220140 (=> (not res!107929) (not e!143146))))

(assert (=> b!220140 (= res!107929 (inRange!0 index!297 (mask!9951 thiss!1504)))))

(declare-datatypes ((Unit!6566 0))(
  ( (Unit!6567) )
))
(declare-fun lt!112111 () Unit!6566)

(declare-fun e!143149 () Unit!6566)

(assert (=> b!220140 (= lt!112111 e!143149)))

(declare-fun c!36642 () Bool)

(declare-datatypes ((tuple2!4354 0))(
  ( (tuple2!4355 (_1!2188 (_ BitVec 64)) (_2!2188 V!7347)) )
))
(declare-datatypes ((List!3258 0))(
  ( (Nil!3255) (Cons!3254 (h!3902 tuple2!4354) (t!8217 List!3258)) )
))
(declare-datatypes ((ListLongMap!3267 0))(
  ( (ListLongMap!3268 (toList!1649 List!3258)) )
))
(declare-fun contains!1492 (ListLongMap!3267 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1177 (array!10795 array!10793 (_ BitVec 32) (_ BitVec 32) V!7347 V!7347 (_ BitVec 32) Int) ListLongMap!3267)

(assert (=> b!220140 (= c!36642 (contains!1492 (getCurrentListMap!1177 (_keys!6207 thiss!1504) (_values!4136 thiss!1504) (mask!9951 thiss!1504) (extraKeys!3890 thiss!1504) (zeroValue!3994 thiss!1504) (minValue!3994 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4153 thiss!1504)) key!932))))

(declare-fun b!220141 () Bool)

(declare-fun Unit!6568 () Unit!6566)

(assert (=> b!220141 (= e!143149 Unit!6568)))

(declare-fun lt!112112 () Unit!6566)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!201 (array!10795 array!10793 (_ BitVec 32) (_ BitVec 32) V!7347 V!7347 (_ BitVec 64) Int) Unit!6566)

(assert (=> b!220141 (= lt!112112 (lemmaInListMapThenSeekEntryOrOpenFindsIt!201 (_keys!6207 thiss!1504) (_values!4136 thiss!1504) (mask!9951 thiss!1504) (extraKeys!3890 thiss!1504) (zeroValue!3994 thiss!1504) (minValue!3994 thiss!1504) key!932 (defaultEntry!4153 thiss!1504)))))

(assert (=> b!220141 false))

(declare-fun bm!20571 () Bool)

(assert (=> bm!20571 (= call!20574 (arrayContainsKey!0 (_keys!6207 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220142 () Bool)

(declare-fun res!107920 () Bool)

(assert (=> b!220142 (=> (not res!107920) (not e!143146))))

(assert (=> b!220142 (= res!107920 (and (= (size!5449 (_values!4136 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9951 thiss!1504))) (= (size!5450 (_keys!6207 thiss!1504)) (size!5449 (_values!4136 thiss!1504))) (bvsge (mask!9951 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3890 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3890 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun e!143144 () Bool)

(declare-fun array_inv!3387 (array!10795) Bool)

(declare-fun array_inv!3388 (array!10793) Bool)

(assert (=> b!220143 (= e!143142 (and tp!20880 tp_is_empty!5775 (array_inv!3387 (_keys!6207 thiss!1504)) (array_inv!3388 (_values!4136 thiss!1504)) e!143144))))

(declare-fun b!220144 () Bool)

(declare-fun lt!112108 () Unit!6566)

(assert (=> b!220144 (= e!143149 lt!112108)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!213 (array!10795 array!10793 (_ BitVec 32) (_ BitVec 32) V!7347 V!7347 (_ BitVec 64) Int) Unit!6566)

(assert (=> b!220144 (= lt!112108 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!213 (_keys!6207 thiss!1504) (_values!4136 thiss!1504) (mask!9951 thiss!1504) (extraKeys!3890 thiss!1504) (zeroValue!3994 thiss!1504) (minValue!3994 thiss!1504) key!932 (defaultEntry!4153 thiss!1504)))))

(assert (=> b!220144 (= c!36640 ((_ is MissingZero!807) lt!112109))))

(assert (=> b!220144 e!143151))

(declare-fun b!220145 () Bool)

(declare-fun res!107923 () Bool)

(assert (=> b!220145 (=> (not res!107923) (not e!143146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10795 (_ BitVec 32)) Bool)

(assert (=> b!220145 (= res!107923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6207 thiss!1504) (mask!9951 thiss!1504)))))

(declare-fun b!220146 () Bool)

(assert (=> b!220146 (= e!143147 ((_ is Undefined!807) lt!112109))))

(declare-fun b!220147 () Bool)

(assert (=> b!220147 (= e!143144 (and e!143152 mapRes!9832))))

(declare-fun condMapEmpty!9832 () Bool)

(declare-fun mapDefault!9832 () ValueCell!2544)

(assert (=> b!220147 (= condMapEmpty!9832 (= (arr!5116 (_values!4136 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2544)) mapDefault!9832)))))

(assert (= (and start!21846 res!107921) b!220137))

(assert (= (and b!220137 res!107926) b!220134))

(assert (= (and b!220134 res!107918) b!220140))

(assert (= (and b!220140 c!36642) b!220141))

(assert (= (and b!220140 (not c!36642)) b!220144))

(assert (= (and b!220144 c!36640) b!220133))

(assert (= (and b!220144 (not c!36640)) b!220126))

(assert (= (and b!220133 res!107924) b!220131))

(assert (= (and b!220131 res!107927) b!220130))

(assert (= (and b!220126 c!36641) b!220136))

(assert (= (and b!220126 (not c!36641)) b!220146))

(assert (= (and b!220136 res!107919) b!220128))

(assert (= (and b!220128 res!107925) b!220139))

(assert (= (or b!220133 b!220136) bm!20570))

(assert (= (or b!220130 b!220139) bm!20571))

(assert (= (and b!220140 res!107929) b!220135))

(assert (= (and b!220135 res!107928) b!220127))

(assert (= (and b!220127 res!107922) b!220142))

(assert (= (and b!220142 res!107920) b!220145))

(assert (= (and b!220145 res!107923) b!220138))

(assert (= (and b!220147 condMapEmpty!9832) mapIsEmpty!9832))

(assert (= (and b!220147 (not condMapEmpty!9832)) mapNonEmpty!9832))

(assert (= (and mapNonEmpty!9832 ((_ is ValueCellFull!2544) mapValue!9832)) b!220132))

(assert (= (and b!220147 ((_ is ValueCellFull!2544) mapDefault!9832)) b!220129))

(assert (= b!220143 b!220147))

(assert (= start!21846 b!220143))

(declare-fun m!245403 () Bool)

(assert (=> b!220131 m!245403))

(declare-fun m!245405 () Bool)

(assert (=> b!220141 m!245405))

(declare-fun m!245407 () Bool)

(assert (=> bm!20571 m!245407))

(declare-fun m!245409 () Bool)

(assert (=> b!220145 m!245409))

(declare-fun m!245411 () Bool)

(assert (=> b!220134 m!245411))

(declare-fun m!245413 () Bool)

(assert (=> b!220143 m!245413))

(declare-fun m!245415 () Bool)

(assert (=> b!220143 m!245415))

(declare-fun m!245417 () Bool)

(assert (=> b!220144 m!245417))

(assert (=> b!220135 m!245407))

(declare-fun m!245419 () Bool)

(assert (=> b!220138 m!245419))

(declare-fun m!245421 () Bool)

(assert (=> start!21846 m!245421))

(declare-fun m!245423 () Bool)

(assert (=> b!220127 m!245423))

(declare-fun m!245425 () Bool)

(assert (=> b!220140 m!245425))

(declare-fun m!245427 () Bool)

(assert (=> b!220140 m!245427))

(assert (=> b!220140 m!245427))

(declare-fun m!245429 () Bool)

(assert (=> b!220140 m!245429))

(declare-fun m!245431 () Bool)

(assert (=> b!220128 m!245431))

(declare-fun m!245433 () Bool)

(assert (=> bm!20570 m!245433))

(declare-fun m!245435 () Bool)

(assert (=> mapNonEmpty!9832 m!245435))

(check-sat (not b!220141) (not b!220140) (not b!220144) (not bm!20570) (not b!220138) (not b!220145) (not start!21846) (not bm!20571) tp_is_empty!5775 (not b!220143) (not b_next!5913) b_and!12811 (not b!220127) (not mapNonEmpty!9832) (not b!220135) (not b!220134))
(check-sat b_and!12811 (not b_next!5913))
