; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22914 () Bool)

(assert start!22914)

(declare-fun b!238884 () Bool)

(declare-fun b_free!6417 () Bool)

(declare-fun b_next!6417 () Bool)

(assert (=> b!238884 (= b_free!6417 (not b_next!6417))))

(declare-fun tp!22454 () Bool)

(declare-fun b_and!13383 () Bool)

(assert (=> b!238884 (= tp!22454 b_and!13383)))

(declare-fun b!238880 () Bool)

(declare-fun e!155100 () Bool)

(declare-datatypes ((V!8019 0))(
  ( (V!8020 (val!3184 Int)) )
))
(declare-datatypes ((ValueCell!2796 0))(
  ( (ValueCellFull!2796 (v!5222 V!8019)) (EmptyCell!2796) )
))
(declare-datatypes ((array!11837 0))(
  ( (array!11838 (arr!5620 (Array (_ BitVec 32) ValueCell!2796)) (size!5961 (_ BitVec 32))) )
))
(declare-datatypes ((array!11839 0))(
  ( (array!11840 (arr!5621 (Array (_ BitVec 32) (_ BitVec 64))) (size!5962 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3492 0))(
  ( (LongMapFixedSize!3493 (defaultEntry!4431 Int) (mask!10471 (_ BitVec 32)) (extraKeys!4168 (_ BitVec 32)) (zeroValue!4272 V!8019) (minValue!4272 V!8019) (_size!1795 (_ BitVec 32)) (_keys!6533 array!11839) (_values!4414 array!11837) (_vacant!1795 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3492)

(assert (=> b!238880 (= e!155100 (not (= (size!5961 (_values!4414 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10471 thiss!1504)))))))

(declare-fun c!39828 () Bool)

(declare-fun call!22211 () Bool)

(declare-fun bm!22208 () Bool)

(declare-datatypes ((SeekEntryResult!1024 0))(
  ( (MissingZero!1024 (index!6266 (_ BitVec 32))) (Found!1024 (index!6267 (_ BitVec 32))) (Intermediate!1024 (undefined!1836 Bool) (index!6268 (_ BitVec 32)) (x!24072 (_ BitVec 32))) (Undefined!1024) (MissingVacant!1024 (index!6269 (_ BitVec 32))) )
))
(declare-fun lt!120680 () SeekEntryResult!1024)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22208 (= call!22211 (inRange!0 (ite c!39828 (index!6266 lt!120680) (index!6269 lt!120680)) (mask!10471 thiss!1504)))))

(declare-fun mapNonEmpty!10650 () Bool)

(declare-fun mapRes!10650 () Bool)

(declare-fun tp!22455 () Bool)

(declare-fun e!155107 () Bool)

(assert (=> mapNonEmpty!10650 (= mapRes!10650 (and tp!22455 e!155107))))

(declare-fun mapKey!10650 () (_ BitVec 32))

(declare-fun mapValue!10650 () ValueCell!2796)

(declare-fun mapRest!10650 () (Array (_ BitVec 32) ValueCell!2796))

(assert (=> mapNonEmpty!10650 (= (arr!5620 (_values!4414 thiss!1504)) (store mapRest!10650 mapKey!10650 mapValue!10650))))

(declare-fun b!238881 () Bool)

(declare-fun res!117071 () Bool)

(declare-fun e!155097 () Bool)

(assert (=> b!238881 (=> (not res!117071) (not e!155097))))

(assert (=> b!238881 (= res!117071 (= (select (arr!5621 (_keys!6533 thiss!1504)) (index!6266 lt!120680)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238882 () Bool)

(declare-fun e!155108 () Bool)

(declare-fun e!155105 () Bool)

(assert (=> b!238882 (= e!155108 e!155105)))

(declare-fun res!117076 () Bool)

(assert (=> b!238882 (= res!117076 call!22211)))

(assert (=> b!238882 (=> (not res!117076) (not e!155105))))

(declare-fun b!238883 () Bool)

(declare-fun e!155106 () Bool)

(declare-fun e!155103 () Bool)

(assert (=> b!238883 (= e!155106 (and e!155103 mapRes!10650))))

(declare-fun condMapEmpty!10650 () Bool)

(declare-fun mapDefault!10650 () ValueCell!2796)

(assert (=> b!238883 (= condMapEmpty!10650 (= (arr!5620 (_values!4414 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2796)) mapDefault!10650)))))

(declare-fun b!238885 () Bool)

(declare-fun res!117077 () Bool)

(assert (=> b!238885 (=> (not res!117077) (not e!155100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238885 (= res!117077 (validMask!0 (mask!10471 thiss!1504)))))

(declare-fun b!238886 () Bool)

(declare-fun e!155098 () Bool)

(assert (=> b!238886 (= e!155098 e!155100)))

(declare-fun res!117074 () Bool)

(assert (=> b!238886 (=> (not res!117074) (not e!155100))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238886 (= res!117074 (inRange!0 index!297 (mask!10471 thiss!1504)))))

(declare-datatypes ((Unit!7328 0))(
  ( (Unit!7329) )
))
(declare-fun lt!120678 () Unit!7328)

(declare-fun e!155101 () Unit!7328)

(assert (=> b!238886 (= lt!120678 e!155101)))

(declare-fun c!39830 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4692 0))(
  ( (tuple2!4693 (_1!2357 (_ BitVec 64)) (_2!2357 V!8019)) )
))
(declare-datatypes ((List!3588 0))(
  ( (Nil!3585) (Cons!3584 (h!4240 tuple2!4692) (t!8583 List!3588)) )
))
(declare-datatypes ((ListLongMap!3605 0))(
  ( (ListLongMap!3606 (toList!1818 List!3588)) )
))
(declare-fun contains!1706 (ListLongMap!3605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1346 (array!11839 array!11837 (_ BitVec 32) (_ BitVec 32) V!8019 V!8019 (_ BitVec 32) Int) ListLongMap!3605)

(assert (=> b!238886 (= c!39830 (contains!1706 (getCurrentListMap!1346 (_keys!6533 thiss!1504) (_values!4414 thiss!1504) (mask!10471 thiss!1504) (extraKeys!4168 thiss!1504) (zeroValue!4272 thiss!1504) (minValue!4272 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4431 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10650 () Bool)

(assert (=> mapIsEmpty!10650 mapRes!10650))

(declare-fun b!238887 () Bool)

(declare-fun c!39829 () Bool)

(get-info :version)

(assert (=> b!238887 (= c!39829 ((_ is MissingVacant!1024) lt!120680))))

(declare-fun e!155102 () Bool)

(assert (=> b!238887 (= e!155102 e!155108)))

(declare-fun bm!22209 () Bool)

(declare-fun call!22212 () Bool)

(declare-fun arrayContainsKey!0 (array!11839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22209 (= call!22212 (arrayContainsKey!0 (_keys!6533 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238888 () Bool)

(declare-fun lt!120679 () Unit!7328)

(assert (=> b!238888 (= e!155101 lt!120679)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!335 (array!11839 array!11837 (_ BitVec 32) (_ BitVec 32) V!8019 V!8019 (_ BitVec 64) Int) Unit!7328)

(assert (=> b!238888 (= lt!120679 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!335 (_keys!6533 thiss!1504) (_values!4414 thiss!1504) (mask!10471 thiss!1504) (extraKeys!4168 thiss!1504) (zeroValue!4272 thiss!1504) (minValue!4272 thiss!1504) key!932 (defaultEntry!4431 thiss!1504)))))

(assert (=> b!238888 (= c!39828 ((_ is MissingZero!1024) lt!120680))))

(assert (=> b!238888 e!155102))

(declare-fun b!238889 () Bool)

(assert (=> b!238889 (= e!155108 ((_ is Undefined!1024) lt!120680))))

(declare-fun b!238890 () Bool)

(declare-fun e!155109 () Bool)

(assert (=> b!238890 (= e!155109 e!155098)))

(declare-fun res!117068 () Bool)

(assert (=> b!238890 (=> (not res!117068) (not e!155098))))

(assert (=> b!238890 (= res!117068 (or (= lt!120680 (MissingZero!1024 index!297)) (= lt!120680 (MissingVacant!1024 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11839 (_ BitVec 32)) SeekEntryResult!1024)

(assert (=> b!238890 (= lt!120680 (seekEntryOrOpen!0 key!932 (_keys!6533 thiss!1504) (mask!10471 thiss!1504)))))

(declare-fun b!238891 () Bool)

(declare-fun res!117075 () Bool)

(assert (=> b!238891 (= res!117075 (= (select (arr!5621 (_keys!6533 thiss!1504)) (index!6269 lt!120680)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!238891 (=> (not res!117075) (not e!155105))))

(declare-fun b!238892 () Bool)

(declare-fun res!117072 () Bool)

(assert (=> b!238892 (=> (not res!117072) (not e!155100))))

(assert (=> b!238892 (= res!117072 (arrayContainsKey!0 (_keys!6533 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!117073 () Bool)

(assert (=> start!22914 (=> (not res!117073) (not e!155109))))

(declare-fun valid!1377 (LongMapFixedSize!3492) Bool)

(assert (=> start!22914 (= res!117073 (valid!1377 thiss!1504))))

(assert (=> start!22914 e!155109))

(declare-fun e!155104 () Bool)

(assert (=> start!22914 e!155104))

(assert (=> start!22914 true))

(declare-fun tp_is_empty!6279 () Bool)

(declare-fun array_inv!3715 (array!11839) Bool)

(declare-fun array_inv!3716 (array!11837) Bool)

(assert (=> b!238884 (= e!155104 (and tp!22454 tp_is_empty!6279 (array_inv!3715 (_keys!6533 thiss!1504)) (array_inv!3716 (_values!4414 thiss!1504)) e!155106))))

(declare-fun b!238893 () Bool)

(assert (=> b!238893 (= e!155097 (not call!22212))))

(declare-fun b!238894 () Bool)

(assert (=> b!238894 (= e!155107 tp_is_empty!6279)))

(declare-fun b!238895 () Bool)

(declare-fun res!117069 () Bool)

(assert (=> b!238895 (=> (not res!117069) (not e!155109))))

(assert (=> b!238895 (= res!117069 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238896 () Bool)

(declare-fun res!117070 () Bool)

(assert (=> b!238896 (=> (not res!117070) (not e!155097))))

(assert (=> b!238896 (= res!117070 call!22211)))

(assert (=> b!238896 (= e!155102 e!155097)))

(declare-fun b!238897 () Bool)

(assert (=> b!238897 (= e!155105 (not call!22212))))

(declare-fun b!238898 () Bool)

(assert (=> b!238898 (= e!155103 tp_is_empty!6279)))

(declare-fun b!238899 () Bool)

(declare-fun Unit!7330 () Unit!7328)

(assert (=> b!238899 (= e!155101 Unit!7330)))

(declare-fun lt!120681 () Unit!7328)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!320 (array!11839 array!11837 (_ BitVec 32) (_ BitVec 32) V!8019 V!8019 (_ BitVec 64) Int) Unit!7328)

(assert (=> b!238899 (= lt!120681 (lemmaInListMapThenSeekEntryOrOpenFindsIt!320 (_keys!6533 thiss!1504) (_values!4414 thiss!1504) (mask!10471 thiss!1504) (extraKeys!4168 thiss!1504) (zeroValue!4272 thiss!1504) (minValue!4272 thiss!1504) key!932 (defaultEntry!4431 thiss!1504)))))

(assert (=> b!238899 false))

(assert (= (and start!22914 res!117073) b!238895))

(assert (= (and b!238895 res!117069) b!238890))

(assert (= (and b!238890 res!117068) b!238886))

(assert (= (and b!238886 c!39830) b!238899))

(assert (= (and b!238886 (not c!39830)) b!238888))

(assert (= (and b!238888 c!39828) b!238896))

(assert (= (and b!238888 (not c!39828)) b!238887))

(assert (= (and b!238896 res!117070) b!238881))

(assert (= (and b!238881 res!117071) b!238893))

(assert (= (and b!238887 c!39829) b!238882))

(assert (= (and b!238887 (not c!39829)) b!238889))

(assert (= (and b!238882 res!117076) b!238891))

(assert (= (and b!238891 res!117075) b!238897))

(assert (= (or b!238896 b!238882) bm!22208))

(assert (= (or b!238893 b!238897) bm!22209))

(assert (= (and b!238886 res!117074) b!238892))

(assert (= (and b!238892 res!117072) b!238885))

(assert (= (and b!238885 res!117077) b!238880))

(assert (= (and b!238883 condMapEmpty!10650) mapIsEmpty!10650))

(assert (= (and b!238883 (not condMapEmpty!10650)) mapNonEmpty!10650))

(assert (= (and mapNonEmpty!10650 ((_ is ValueCellFull!2796) mapValue!10650)) b!238894))

(assert (= (and b!238883 ((_ is ValueCellFull!2796) mapDefault!10650)) b!238898))

(assert (= b!238884 b!238883))

(assert (= start!22914 b!238884))

(declare-fun m!259229 () Bool)

(assert (=> b!238891 m!259229))

(declare-fun m!259231 () Bool)

(assert (=> b!238890 m!259231))

(declare-fun m!259233 () Bool)

(assert (=> b!238886 m!259233))

(declare-fun m!259235 () Bool)

(assert (=> b!238886 m!259235))

(assert (=> b!238886 m!259235))

(declare-fun m!259237 () Bool)

(assert (=> b!238886 m!259237))

(declare-fun m!259239 () Bool)

(assert (=> start!22914 m!259239))

(declare-fun m!259241 () Bool)

(assert (=> b!238884 m!259241))

(declare-fun m!259243 () Bool)

(assert (=> b!238884 m!259243))

(declare-fun m!259245 () Bool)

(assert (=> b!238888 m!259245))

(declare-fun m!259247 () Bool)

(assert (=> b!238881 m!259247))

(declare-fun m!259249 () Bool)

(assert (=> b!238885 m!259249))

(declare-fun m!259251 () Bool)

(assert (=> bm!22209 m!259251))

(declare-fun m!259253 () Bool)

(assert (=> mapNonEmpty!10650 m!259253))

(declare-fun m!259255 () Bool)

(assert (=> bm!22208 m!259255))

(assert (=> b!238892 m!259251))

(declare-fun m!259257 () Bool)

(assert (=> b!238899 m!259257))

(check-sat (not b!238890) tp_is_empty!6279 (not b!238886) (not bm!22209) (not b!238888) (not b!238884) (not bm!22208) (not b_next!6417) b_and!13383 (not mapNonEmpty!10650) (not start!22914) (not b!238892) (not b!238885) (not b!238899))
(check-sat b_and!13383 (not b_next!6417))
