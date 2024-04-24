; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22082 () Bool)

(assert start!22082)

(declare-fun b!228973 () Bool)

(declare-fun b_free!6145 () Bool)

(declare-fun b_next!6145 () Bool)

(assert (=> b!228973 (= b_free!6145 (not b_next!6145))))

(declare-fun tp!21576 () Bool)

(declare-fun b_and!13057 () Bool)

(assert (=> b!228973 (= tp!21576 b_and!13057)))

(declare-fun b!228965 () Bool)

(declare-fun e!148544 () Bool)

(declare-datatypes ((SeekEntryResult!883 0))(
  ( (MissingZero!883 (index!5702 (_ BitVec 32))) (Found!883 (index!5703 (_ BitVec 32))) (Intermediate!883 (undefined!1695 Bool) (index!5704 (_ BitVec 32)) (x!23327 (_ BitVec 32))) (Undefined!883) (MissingVacant!883 (index!5705 (_ BitVec 32))) )
))
(declare-fun lt!115219 () SeekEntryResult!883)

(get-info :version)

(assert (=> b!228965 (= e!148544 ((_ is Undefined!883) lt!115219))))

(declare-fun b!228966 () Bool)

(declare-fun res!112692 () Bool)

(declare-fun e!148551 () Bool)

(assert (=> b!228966 (=> res!112692 e!148551)))

(declare-datatypes ((V!7657 0))(
  ( (V!7658 (val!3048 Int)) )
))
(declare-datatypes ((ValueCell!2660 0))(
  ( (ValueCellFull!2660 (v!5069 V!7657)) (EmptyCell!2660) )
))
(declare-datatypes ((array!11255 0))(
  ( (array!11256 (arr!5347 (Array (_ BitVec 32) ValueCell!2660)) (size!5680 (_ BitVec 32))) )
))
(declare-datatypes ((array!11257 0))(
  ( (array!11258 (arr!5348 (Array (_ BitVec 32) (_ BitVec 64))) (size!5681 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3220 0))(
  ( (LongMapFixedSize!3221 (defaultEntry!4269 Int) (mask!10145 (_ BitVec 32)) (extraKeys!4006 (_ BitVec 32)) (zeroValue!4110 V!7657) (minValue!4110 V!7657) (_size!1659 (_ BitVec 32)) (_keys!6323 array!11257) (_values!4252 array!11255) (_vacant!1659 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3220)

(assert (=> b!228966 (= res!112692 (or (not (= (size!5680 (_values!4252 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10145 thiss!1504)))) (not (= (size!5681 (_keys!6323 thiss!1504)) (size!5680 (_values!4252 thiss!1504)))) (bvslt (mask!10145 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4006 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4006 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228967 () Bool)

(assert (=> b!228967 (= e!148551 true)))

(declare-fun lt!115220 () Bool)

(declare-datatypes ((List!3339 0))(
  ( (Nil!3336) (Cons!3335 (h!3983 (_ BitVec 64)) (t!8290 List!3339)) )
))
(declare-fun arrayNoDuplicates!0 (array!11257 (_ BitVec 32) List!3339) Bool)

(assert (=> b!228967 (= lt!115220 (arrayNoDuplicates!0 (_keys!6323 thiss!1504) #b00000000000000000000000000000000 Nil!3336))))

(declare-fun b!228968 () Bool)

(declare-fun e!148540 () Bool)

(declare-fun e!148552 () Bool)

(assert (=> b!228968 (= e!148540 e!148552)))

(declare-fun res!112695 () Bool)

(assert (=> b!228968 (=> (not res!112695) (not e!148552))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228968 (= res!112695 (inRange!0 index!297 (mask!10145 thiss!1504)))))

(declare-datatypes ((Unit!6946 0))(
  ( (Unit!6947) )
))
(declare-fun lt!115221 () Unit!6946)

(declare-fun e!148546 () Unit!6946)

(assert (=> b!228968 (= lt!115221 e!148546)))

(declare-fun c!37979 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4424 0))(
  ( (tuple2!4425 (_1!2223 (_ BitVec 64)) (_2!2223 V!7657)) )
))
(declare-datatypes ((List!3340 0))(
  ( (Nil!3337) (Cons!3336 (h!3984 tuple2!4424) (t!8291 List!3340)) )
))
(declare-datatypes ((ListLongMap!3339 0))(
  ( (ListLongMap!3340 (toList!1685 List!3340)) )
))
(declare-fun contains!1574 (ListLongMap!3339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1217 (array!11257 array!11255 (_ BitVec 32) (_ BitVec 32) V!7657 V!7657 (_ BitVec 32) Int) ListLongMap!3339)

(assert (=> b!228968 (= c!37979 (contains!1574 (getCurrentListMap!1217 (_keys!6323 thiss!1504) (_values!4252 thiss!1504) (mask!10145 thiss!1504) (extraKeys!4006 thiss!1504) (zeroValue!4110 thiss!1504) (minValue!4110 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4269 thiss!1504)) key!932))))

(declare-fun b!228969 () Bool)

(declare-fun e!148543 () Unit!6946)

(declare-fun Unit!6948 () Unit!6946)

(assert (=> b!228969 (= e!148543 Unit!6948)))

(declare-fun b!228970 () Bool)

(declare-fun lt!115222 () Unit!6946)

(assert (=> b!228970 (= e!148546 lt!115222)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!270 (array!11257 array!11255 (_ BitVec 32) (_ BitVec 32) V!7657 V!7657 (_ BitVec 64) Int) Unit!6946)

(assert (=> b!228970 (= lt!115222 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!270 (_keys!6323 thiss!1504) (_values!4252 thiss!1504) (mask!10145 thiss!1504) (extraKeys!4006 thiss!1504) (zeroValue!4110 thiss!1504) (minValue!4110 thiss!1504) key!932 (defaultEntry!4269 thiss!1504)))))

(declare-fun c!37978 () Bool)

(assert (=> b!228970 (= c!37978 ((_ is MissingZero!883) lt!115219))))

(declare-fun e!148542 () Bool)

(assert (=> b!228970 e!148542))

(declare-fun b!228971 () Bool)

(declare-fun e!148553 () Bool)

(assert (=> b!228971 (= e!148544 e!148553)))

(declare-fun res!112691 () Bool)

(declare-fun call!21258 () Bool)

(assert (=> b!228971 (= res!112691 call!21258)))

(assert (=> b!228971 (=> (not res!112691) (not e!148553))))

(declare-fun b!228972 () Bool)

(declare-fun c!37980 () Bool)

(assert (=> b!228972 (= c!37980 ((_ is MissingVacant!883) lt!115219))))

(assert (=> b!228972 (= e!148542 e!148544)))

(declare-fun e!148541 () Bool)

(declare-fun tp_is_empty!6007 () Bool)

(declare-fun e!148545 () Bool)

(declare-fun array_inv!3511 (array!11257) Bool)

(declare-fun array_inv!3512 (array!11255) Bool)

(assert (=> b!228973 (= e!148541 (and tp!21576 tp_is_empty!6007 (array_inv!3511 (_keys!6323 thiss!1504)) (array_inv!3512 (_values!4252 thiss!1504)) e!148545))))

(declare-fun b!228974 () Bool)

(declare-fun e!148549 () Bool)

(declare-fun mapRes!10180 () Bool)

(assert (=> b!228974 (= e!148545 (and e!148549 mapRes!10180))))

(declare-fun condMapEmpty!10180 () Bool)

(declare-fun mapDefault!10180 () ValueCell!2660)

(assert (=> b!228974 (= condMapEmpty!10180 (= (arr!5347 (_values!4252 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2660)) mapDefault!10180)))))

(declare-fun mapNonEmpty!10180 () Bool)

(declare-fun tp!21577 () Bool)

(declare-fun e!148547 () Bool)

(assert (=> mapNonEmpty!10180 (= mapRes!10180 (and tp!21577 e!148547))))

(declare-fun mapValue!10180 () ValueCell!2660)

(declare-fun mapRest!10180 () (Array (_ BitVec 32) ValueCell!2660))

(declare-fun mapKey!10180 () (_ BitVec 32))

(assert (=> mapNonEmpty!10180 (= (arr!5347 (_values!4252 thiss!1504)) (store mapRest!10180 mapKey!10180 mapValue!10180))))

(declare-fun b!228975 () Bool)

(declare-fun res!112696 () Bool)

(assert (=> b!228975 (= res!112696 (= (select (arr!5348 (_keys!6323 thiss!1504)) (index!5705 lt!115219)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228975 (=> (not res!112696) (not e!148553))))

(declare-fun b!228976 () Bool)

(declare-fun res!112690 () Bool)

(declare-fun e!148550 () Bool)

(assert (=> b!228976 (=> (not res!112690) (not e!148550))))

(assert (=> b!228976 (= res!112690 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10180 () Bool)

(assert (=> mapIsEmpty!10180 mapRes!10180))

(declare-fun b!228977 () Bool)

(assert (=> b!228977 (= e!148550 e!148540)))

(declare-fun res!112693 () Bool)

(assert (=> b!228977 (=> (not res!112693) (not e!148540))))

(assert (=> b!228977 (= res!112693 (or (= lt!115219 (MissingZero!883 index!297)) (= lt!115219 (MissingVacant!883 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11257 (_ BitVec 32)) SeekEntryResult!883)

(assert (=> b!228977 (= lt!115219 (seekEntryOrOpen!0 key!932 (_keys!6323 thiss!1504) (mask!10145 thiss!1504)))))

(declare-fun res!112694 () Bool)

(assert (=> start!22082 (=> (not res!112694) (not e!148550))))

(declare-fun valid!1295 (LongMapFixedSize!3220) Bool)

(assert (=> start!22082 (= res!112694 (valid!1295 thiss!1504))))

(assert (=> start!22082 e!148550))

(assert (=> start!22082 e!148541))

(assert (=> start!22082 true))

(declare-fun bm!21254 () Bool)

(assert (=> bm!21254 (= call!21258 (inRange!0 (ite c!37978 (index!5702 lt!115219) (index!5705 lt!115219)) (mask!10145 thiss!1504)))))

(declare-fun b!228978 () Bool)

(declare-fun Unit!6949 () Unit!6946)

(assert (=> b!228978 (= e!148543 Unit!6949)))

(declare-fun lt!115216 () Unit!6946)

(declare-fun lemmaArrayContainsKeyThenInListMap!117 (array!11257 array!11255 (_ BitVec 32) (_ BitVec 32) V!7657 V!7657 (_ BitVec 64) (_ BitVec 32) Int) Unit!6946)

(assert (=> b!228978 (= lt!115216 (lemmaArrayContainsKeyThenInListMap!117 (_keys!6323 thiss!1504) (_values!4252 thiss!1504) (mask!10145 thiss!1504) (extraKeys!4006 thiss!1504) (zeroValue!4110 thiss!1504) (minValue!4110 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4269 thiss!1504)))))

(assert (=> b!228978 false))

(declare-fun b!228979 () Bool)

(declare-fun res!112689 () Bool)

(declare-fun e!148548 () Bool)

(assert (=> b!228979 (=> (not res!112689) (not e!148548))))

(assert (=> b!228979 (= res!112689 (= (select (arr!5348 (_keys!6323 thiss!1504)) (index!5702 lt!115219)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!228980 () Bool)

(assert (=> b!228980 (= e!148547 tp_is_empty!6007)))

(declare-fun b!228981 () Bool)

(assert (=> b!228981 (= e!148552 (not e!148551))))

(declare-fun res!112699 () Bool)

(assert (=> b!228981 (=> res!112699 e!148551)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228981 (= res!112699 (not (validMask!0 (mask!10145 thiss!1504))))))

(declare-fun lt!115217 () array!11257)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11257 (_ BitVec 32)) Bool)

(assert (=> b!228981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115217 (mask!10145 thiss!1504))))

(declare-fun lt!115223 () Unit!6946)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11257 (_ BitVec 32) (_ BitVec 32)) Unit!6946)

(assert (=> b!228981 (= lt!115223 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6323 thiss!1504) index!297 (mask!10145 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11257 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228981 (= (arrayCountValidKeys!0 lt!115217 #b00000000000000000000000000000000 (size!5681 (_keys!6323 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6323 thiss!1504) #b00000000000000000000000000000000 (size!5681 (_keys!6323 thiss!1504)))))))

(declare-fun lt!115215 () Unit!6946)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11257 (_ BitVec 32) (_ BitVec 64)) Unit!6946)

(assert (=> b!228981 (= lt!115215 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6323 thiss!1504) index!297 key!932))))

(assert (=> b!228981 (arrayNoDuplicates!0 lt!115217 #b00000000000000000000000000000000 Nil!3336)))

(assert (=> b!228981 (= lt!115217 (array!11258 (store (arr!5348 (_keys!6323 thiss!1504)) index!297 key!932) (size!5681 (_keys!6323 thiss!1504))))))

(declare-fun lt!115225 () Unit!6946)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3339) Unit!6946)

(assert (=> b!228981 (= lt!115225 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6323 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3336))))

(declare-fun lt!115224 () Unit!6946)

(assert (=> b!228981 (= lt!115224 e!148543)))

(declare-fun c!37981 () Bool)

(declare-fun arrayContainsKey!0 (array!11257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228981 (= c!37981 (arrayContainsKey!0 (_keys!6323 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!21255 () Bool)

(declare-fun call!21257 () Bool)

(assert (=> bm!21255 (= call!21257 (arrayContainsKey!0 (_keys!6323 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228982 () Bool)

(declare-fun res!112698 () Bool)

(assert (=> b!228982 (=> (not res!112698) (not e!148548))))

(assert (=> b!228982 (= res!112698 call!21258)))

(assert (=> b!228982 (= e!148542 e!148548)))

(declare-fun b!228983 () Bool)

(assert (=> b!228983 (= e!148549 tp_is_empty!6007)))

(declare-fun b!228984 () Bool)

(declare-fun res!112697 () Bool)

(assert (=> b!228984 (=> res!112697 e!148551)))

(assert (=> b!228984 (= res!112697 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6323 thiss!1504) (mask!10145 thiss!1504))))))

(declare-fun b!228985 () Bool)

(assert (=> b!228985 (= e!148548 (not call!21257))))

(declare-fun b!228986 () Bool)

(declare-fun Unit!6950 () Unit!6946)

(assert (=> b!228986 (= e!148546 Unit!6950)))

(declare-fun lt!115218 () Unit!6946)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!277 (array!11257 array!11255 (_ BitVec 32) (_ BitVec 32) V!7657 V!7657 (_ BitVec 64) Int) Unit!6946)

(assert (=> b!228986 (= lt!115218 (lemmaInListMapThenSeekEntryOrOpenFindsIt!277 (_keys!6323 thiss!1504) (_values!4252 thiss!1504) (mask!10145 thiss!1504) (extraKeys!4006 thiss!1504) (zeroValue!4110 thiss!1504) (minValue!4110 thiss!1504) key!932 (defaultEntry!4269 thiss!1504)))))

(assert (=> b!228986 false))

(declare-fun b!228987 () Bool)

(assert (=> b!228987 (= e!148553 (not call!21257))))

(assert (= (and start!22082 res!112694) b!228976))

(assert (= (and b!228976 res!112690) b!228977))

(assert (= (and b!228977 res!112693) b!228968))

(assert (= (and b!228968 c!37979) b!228986))

(assert (= (and b!228968 (not c!37979)) b!228970))

(assert (= (and b!228970 c!37978) b!228982))

(assert (= (and b!228970 (not c!37978)) b!228972))

(assert (= (and b!228982 res!112698) b!228979))

(assert (= (and b!228979 res!112689) b!228985))

(assert (= (and b!228972 c!37980) b!228971))

(assert (= (and b!228972 (not c!37980)) b!228965))

(assert (= (and b!228971 res!112691) b!228975))

(assert (= (and b!228975 res!112696) b!228987))

(assert (= (or b!228982 b!228971) bm!21254))

(assert (= (or b!228985 b!228987) bm!21255))

(assert (= (and b!228968 res!112695) b!228981))

(assert (= (and b!228981 c!37981) b!228978))

(assert (= (and b!228981 (not c!37981)) b!228969))

(assert (= (and b!228981 (not res!112699)) b!228966))

(assert (= (and b!228966 (not res!112692)) b!228984))

(assert (= (and b!228984 (not res!112697)) b!228967))

(assert (= (and b!228974 condMapEmpty!10180) mapIsEmpty!10180))

(assert (= (and b!228974 (not condMapEmpty!10180)) mapNonEmpty!10180))

(assert (= (and mapNonEmpty!10180 ((_ is ValueCellFull!2660) mapValue!10180)) b!228980))

(assert (= (and b!228974 ((_ is ValueCellFull!2660) mapDefault!10180)) b!228983))

(assert (= b!228973 b!228974))

(assert (= start!22082 b!228973))

(declare-fun m!250741 () Bool)

(assert (=> b!228979 m!250741))

(declare-fun m!250743 () Bool)

(assert (=> b!228975 m!250743))

(declare-fun m!250745 () Bool)

(assert (=> b!228968 m!250745))

(declare-fun m!250747 () Bool)

(assert (=> b!228968 m!250747))

(assert (=> b!228968 m!250747))

(declare-fun m!250749 () Bool)

(assert (=> b!228968 m!250749))

(declare-fun m!250751 () Bool)

(assert (=> b!228984 m!250751))

(declare-fun m!250753 () Bool)

(assert (=> mapNonEmpty!10180 m!250753))

(declare-fun m!250755 () Bool)

(assert (=> start!22082 m!250755))

(declare-fun m!250757 () Bool)

(assert (=> b!228978 m!250757))

(declare-fun m!250759 () Bool)

(assert (=> bm!21254 m!250759))

(declare-fun m!250761 () Bool)

(assert (=> b!228967 m!250761))

(declare-fun m!250763 () Bool)

(assert (=> b!228970 m!250763))

(declare-fun m!250765 () Bool)

(assert (=> bm!21255 m!250765))

(declare-fun m!250767 () Bool)

(assert (=> b!228973 m!250767))

(declare-fun m!250769 () Bool)

(assert (=> b!228973 m!250769))

(declare-fun m!250771 () Bool)

(assert (=> b!228986 m!250771))

(declare-fun m!250773 () Bool)

(assert (=> b!228981 m!250773))

(assert (=> b!228981 m!250765))

(declare-fun m!250775 () Bool)

(assert (=> b!228981 m!250775))

(declare-fun m!250777 () Bool)

(assert (=> b!228981 m!250777))

(declare-fun m!250779 () Bool)

(assert (=> b!228981 m!250779))

(declare-fun m!250781 () Bool)

(assert (=> b!228981 m!250781))

(declare-fun m!250783 () Bool)

(assert (=> b!228981 m!250783))

(declare-fun m!250785 () Bool)

(assert (=> b!228981 m!250785))

(declare-fun m!250787 () Bool)

(assert (=> b!228981 m!250787))

(declare-fun m!250789 () Bool)

(assert (=> b!228981 m!250789))

(declare-fun m!250791 () Bool)

(assert (=> b!228977 m!250791))

(check-sat (not start!22082) (not b!228968) (not b!228967) (not bm!21255) (not b_next!6145) (not b!228973) (not b!228970) tp_is_empty!6007 b_and!13057 (not mapNonEmpty!10180) (not b!228981) (not bm!21254) (not b!228977) (not b!228986) (not b!228984) (not b!228978))
(check-sat b_and!13057 (not b_next!6145))
