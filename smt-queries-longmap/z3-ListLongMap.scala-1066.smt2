; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22082 () Bool)

(assert start!22082)

(declare-fun b!228785 () Bool)

(declare-fun b_free!6145 () Bool)

(declare-fun b_next!6145 () Bool)

(assert (=> b!228785 (= b_free!6145 (not b_next!6145))))

(declare-fun tp!21576 () Bool)

(declare-fun b_and!13017 () Bool)

(assert (=> b!228785 (= tp!21576 b_and!13017)))

(declare-fun b!228771 () Bool)

(declare-datatypes ((Unit!6938 0))(
  ( (Unit!6939) )
))
(declare-fun e!148420 () Unit!6938)

(declare-fun Unit!6940 () Unit!6938)

(assert (=> b!228771 (= e!148420 Unit!6940)))

(declare-fun lt!114985 () Unit!6938)

(declare-datatypes ((V!7657 0))(
  ( (V!7658 (val!3048 Int)) )
))
(declare-datatypes ((ValueCell!2660 0))(
  ( (ValueCellFull!2660 (v!5062 V!7657)) (EmptyCell!2660) )
))
(declare-datatypes ((array!11249 0))(
  ( (array!11250 (arr!5343 (Array (_ BitVec 32) ValueCell!2660)) (size!5677 (_ BitVec 32))) )
))
(declare-datatypes ((array!11251 0))(
  ( (array!11252 (arr!5344 (Array (_ BitVec 32) (_ BitVec 64))) (size!5678 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3220 0))(
  ( (LongMapFixedSize!3221 (defaultEntry!4269 Int) (mask!10144 (_ BitVec 32)) (extraKeys!4006 (_ BitVec 32)) (zeroValue!4110 V!7657) (minValue!4110 V!7657) (_size!1659 (_ BitVec 32)) (_keys!6322 array!11251) (_values!4252 array!11249) (_vacant!1659 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3220)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!276 (array!11251 array!11249 (_ BitVec 32) (_ BitVec 32) V!7657 V!7657 (_ BitVec 64) Int) Unit!6938)

(assert (=> b!228771 (= lt!114985 (lemmaInListMapThenSeekEntryOrOpenFindsIt!276 (_keys!6322 thiss!1504) (_values!4252 thiss!1504) (mask!10144 thiss!1504) (extraKeys!4006 thiss!1504) (zeroValue!4110 thiss!1504) (minValue!4110 thiss!1504) key!932 (defaultEntry!4269 thiss!1504)))))

(assert (=> b!228771 false))

(declare-fun b!228772 () Bool)

(declare-fun e!148427 () Unit!6938)

(declare-fun Unit!6941 () Unit!6938)

(assert (=> b!228772 (= e!148427 Unit!6941)))

(declare-fun b!228773 () Bool)

(declare-fun e!148416 () Bool)

(declare-fun tp_is_empty!6007 () Bool)

(assert (=> b!228773 (= e!148416 tp_is_empty!6007)))

(declare-fun b!228774 () Bool)

(declare-fun e!148421 () Bool)

(declare-fun call!21246 () Bool)

(assert (=> b!228774 (= e!148421 (not call!21246))))

(declare-fun b!228775 () Bool)

(declare-fun e!148419 () Bool)

(assert (=> b!228775 (= e!148419 tp_is_empty!6007)))

(declare-fun b!228776 () Bool)

(declare-fun Unit!6942 () Unit!6938)

(assert (=> b!228776 (= e!148427 Unit!6942)))

(declare-fun lt!114979 () Unit!6938)

(declare-fun lemmaArrayContainsKeyThenInListMap!117 (array!11251 array!11249 (_ BitVec 32) (_ BitVec 32) V!7657 V!7657 (_ BitVec 64) (_ BitVec 32) Int) Unit!6938)

(assert (=> b!228776 (= lt!114979 (lemmaArrayContainsKeyThenInListMap!117 (_keys!6322 thiss!1504) (_values!4252 thiss!1504) (mask!10144 thiss!1504) (extraKeys!4006 thiss!1504) (zeroValue!4110 thiss!1504) (minValue!4110 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4269 thiss!1504)))))

(assert (=> b!228776 false))

(declare-fun mapIsEmpty!10180 () Bool)

(declare-fun mapRes!10180 () Bool)

(assert (=> mapIsEmpty!10180 mapRes!10180))

(declare-fun res!112580 () Bool)

(declare-fun e!148422 () Bool)

(assert (=> start!22082 (=> (not res!112580) (not e!148422))))

(declare-fun valid!1300 (LongMapFixedSize!3220) Bool)

(assert (=> start!22082 (= res!112580 (valid!1300 thiss!1504))))

(assert (=> start!22082 e!148422))

(declare-fun e!148414 () Bool)

(assert (=> start!22082 e!148414))

(assert (=> start!22082 true))

(declare-fun b!228777 () Bool)

(declare-fun e!148423 () Bool)

(assert (=> b!228777 (= e!148423 (not call!21246))))

(declare-fun b!228778 () Bool)

(declare-fun res!112582 () Bool)

(assert (=> b!228778 (=> (not res!112582) (not e!148421))))

(declare-fun call!21245 () Bool)

(assert (=> b!228778 (= res!112582 call!21245)))

(declare-fun e!148426 () Bool)

(assert (=> b!228778 (= e!148426 e!148421)))

(declare-fun b!228779 () Bool)

(declare-fun res!112581 () Bool)

(declare-datatypes ((SeekEntryResult!913 0))(
  ( (MissingZero!913 (index!5822 (_ BitVec 32))) (Found!913 (index!5823 (_ BitVec 32))) (Intermediate!913 (undefined!1725 Bool) (index!5824 (_ BitVec 32)) (x!23356 (_ BitVec 32))) (Undefined!913) (MissingVacant!913 (index!5825 (_ BitVec 32))) )
))
(declare-fun lt!114975 () SeekEntryResult!913)

(assert (=> b!228779 (= res!112581 (= (select (arr!5344 (_keys!6322 thiss!1504)) (index!5825 lt!114975)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228779 (=> (not res!112581) (not e!148423))))

(declare-fun b!228780 () Bool)

(declare-fun res!112578 () Bool)

(declare-fun e!148425 () Bool)

(assert (=> b!228780 (=> res!112578 e!148425)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11251 (_ BitVec 32)) Bool)

(assert (=> b!228780 (= res!112578 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6322 thiss!1504) (mask!10144 thiss!1504))))))

(declare-fun b!228781 () Bool)

(assert (=> b!228781 (= e!148425 true)))

(declare-fun lt!114977 () Bool)

(declare-datatypes ((List!3408 0))(
  ( (Nil!3405) (Cons!3404 (h!4052 (_ BitVec 64)) (t!8358 List!3408)) )
))
(declare-fun arrayNoDuplicates!0 (array!11251 (_ BitVec 32) List!3408) Bool)

(assert (=> b!228781 (= lt!114977 (arrayNoDuplicates!0 (_keys!6322 thiss!1504) #b00000000000000000000000000000000 Nil!3405))))

(declare-fun b!228782 () Bool)

(declare-fun res!112574 () Bool)

(assert (=> b!228782 (=> res!112574 e!148425)))

(assert (=> b!228782 (= res!112574 (or (not (= (size!5677 (_values!4252 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10144 thiss!1504)))) (not (= (size!5678 (_keys!6322 thiss!1504)) (size!5677 (_values!4252 thiss!1504)))) (bvslt (mask!10144 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4006 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4006 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228783 () Bool)

(declare-fun res!112583 () Bool)

(assert (=> b!228783 (=> (not res!112583) (not e!148421))))

(assert (=> b!228783 (= res!112583 (= (select (arr!5344 (_keys!6322 thiss!1504)) (index!5822 lt!114975)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!228784 () Bool)

(declare-fun e!148418 () Bool)

(assert (=> b!228784 (= e!148418 (and e!148419 mapRes!10180))))

(declare-fun condMapEmpty!10180 () Bool)

(declare-fun mapDefault!10180 () ValueCell!2660)

(assert (=> b!228784 (= condMapEmpty!10180 (= (arr!5343 (_values!4252 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2660)) mapDefault!10180)))))

(declare-fun array_inv!3523 (array!11251) Bool)

(declare-fun array_inv!3524 (array!11249) Bool)

(assert (=> b!228785 (= e!148414 (and tp!21576 tp_is_empty!6007 (array_inv!3523 (_keys!6322 thiss!1504)) (array_inv!3524 (_values!4252 thiss!1504)) e!148418))))

(declare-fun bm!21242 () Bool)

(declare-fun c!37939 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21242 (= call!21245 (inRange!0 (ite c!37939 (index!5822 lt!114975) (index!5825 lt!114975)) (mask!10144 thiss!1504)))))

(declare-fun b!228786 () Bool)

(declare-fun e!148428 () Bool)

(declare-fun e!148415 () Bool)

(assert (=> b!228786 (= e!148428 e!148415)))

(declare-fun res!112576 () Bool)

(assert (=> b!228786 (=> (not res!112576) (not e!148415))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!228786 (= res!112576 (inRange!0 index!297 (mask!10144 thiss!1504)))))

(declare-fun lt!114976 () Unit!6938)

(assert (=> b!228786 (= lt!114976 e!148420)))

(declare-fun c!37942 () Bool)

(declare-datatypes ((tuple2!4472 0))(
  ( (tuple2!4473 (_1!2247 (_ BitVec 64)) (_2!2247 V!7657)) )
))
(declare-datatypes ((List!3409 0))(
  ( (Nil!3406) (Cons!3405 (h!4053 tuple2!4472) (t!8359 List!3409)) )
))
(declare-datatypes ((ListLongMap!3375 0))(
  ( (ListLongMap!3376 (toList!1703 List!3409)) )
))
(declare-fun contains!1578 (ListLongMap!3375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1212 (array!11251 array!11249 (_ BitVec 32) (_ BitVec 32) V!7657 V!7657 (_ BitVec 32) Int) ListLongMap!3375)

(assert (=> b!228786 (= c!37942 (contains!1578 (getCurrentListMap!1212 (_keys!6322 thiss!1504) (_values!4252 thiss!1504) (mask!10144 thiss!1504) (extraKeys!4006 thiss!1504) (zeroValue!4110 thiss!1504) (minValue!4110 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4269 thiss!1504)) key!932))))

(declare-fun b!228787 () Bool)

(declare-fun e!148417 () Bool)

(get-info :version)

(assert (=> b!228787 (= e!148417 ((_ is Undefined!913) lt!114975))))

(declare-fun b!228788 () Bool)

(declare-fun res!112579 () Bool)

(assert (=> b!228788 (=> (not res!112579) (not e!148422))))

(assert (=> b!228788 (= res!112579 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228789 () Bool)

(assert (=> b!228789 (= e!148417 e!148423)))

(declare-fun res!112575 () Bool)

(assert (=> b!228789 (= res!112575 call!21245)))

(assert (=> b!228789 (=> (not res!112575) (not e!148423))))

(declare-fun mapNonEmpty!10180 () Bool)

(declare-fun tp!21577 () Bool)

(assert (=> mapNonEmpty!10180 (= mapRes!10180 (and tp!21577 e!148416))))

(declare-fun mapKey!10180 () (_ BitVec 32))

(declare-fun mapValue!10180 () ValueCell!2660)

(declare-fun mapRest!10180 () (Array (_ BitVec 32) ValueCell!2660))

(assert (=> mapNonEmpty!10180 (= (arr!5343 (_values!4252 thiss!1504)) (store mapRest!10180 mapKey!10180 mapValue!10180))))

(declare-fun bm!21243 () Bool)

(declare-fun arrayContainsKey!0 (array!11251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21243 (= call!21246 (arrayContainsKey!0 (_keys!6322 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228790 () Bool)

(assert (=> b!228790 (= e!148422 e!148428)))

(declare-fun res!112573 () Bool)

(assert (=> b!228790 (=> (not res!112573) (not e!148428))))

(assert (=> b!228790 (= res!112573 (or (= lt!114975 (MissingZero!913 index!297)) (= lt!114975 (MissingVacant!913 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11251 (_ BitVec 32)) SeekEntryResult!913)

(assert (=> b!228790 (= lt!114975 (seekEntryOrOpen!0 key!932 (_keys!6322 thiss!1504) (mask!10144 thiss!1504)))))

(declare-fun b!228791 () Bool)

(declare-fun lt!114983 () Unit!6938)

(assert (=> b!228791 (= e!148420 lt!114983)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!273 (array!11251 array!11249 (_ BitVec 32) (_ BitVec 32) V!7657 V!7657 (_ BitVec 64) Int) Unit!6938)

(assert (=> b!228791 (= lt!114983 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!273 (_keys!6322 thiss!1504) (_values!4252 thiss!1504) (mask!10144 thiss!1504) (extraKeys!4006 thiss!1504) (zeroValue!4110 thiss!1504) (minValue!4110 thiss!1504) key!932 (defaultEntry!4269 thiss!1504)))))

(assert (=> b!228791 (= c!37939 ((_ is MissingZero!913) lt!114975))))

(assert (=> b!228791 e!148426))

(declare-fun b!228792 () Bool)

(assert (=> b!228792 (= e!148415 (not e!148425))))

(declare-fun res!112577 () Bool)

(assert (=> b!228792 (=> res!112577 e!148425)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228792 (= res!112577 (not (validMask!0 (mask!10144 thiss!1504))))))

(declare-fun lt!114984 () array!11251)

(assert (=> b!228792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114984 (mask!10144 thiss!1504))))

(declare-fun lt!114978 () Unit!6938)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11251 (_ BitVec 32) (_ BitVec 32)) Unit!6938)

(assert (=> b!228792 (= lt!114978 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6322 thiss!1504) index!297 (mask!10144 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11251 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228792 (= (arrayCountValidKeys!0 lt!114984 #b00000000000000000000000000000000 (size!5678 (_keys!6322 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6322 thiss!1504) #b00000000000000000000000000000000 (size!5678 (_keys!6322 thiss!1504)))))))

(declare-fun lt!114982 () Unit!6938)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11251 (_ BitVec 32) (_ BitVec 64)) Unit!6938)

(assert (=> b!228792 (= lt!114982 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6322 thiss!1504) index!297 key!932))))

(assert (=> b!228792 (arrayNoDuplicates!0 lt!114984 #b00000000000000000000000000000000 Nil!3405)))

(assert (=> b!228792 (= lt!114984 (array!11252 (store (arr!5344 (_keys!6322 thiss!1504)) index!297 key!932) (size!5678 (_keys!6322 thiss!1504))))))

(declare-fun lt!114980 () Unit!6938)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11251 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3408) Unit!6938)

(assert (=> b!228792 (= lt!114980 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6322 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3405))))

(declare-fun lt!114981 () Unit!6938)

(assert (=> b!228792 (= lt!114981 e!148427)))

(declare-fun c!37940 () Bool)

(assert (=> b!228792 (= c!37940 (arrayContainsKey!0 (_keys!6322 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228793 () Bool)

(declare-fun c!37941 () Bool)

(assert (=> b!228793 (= c!37941 ((_ is MissingVacant!913) lt!114975))))

(assert (=> b!228793 (= e!148426 e!148417)))

(assert (= (and start!22082 res!112580) b!228788))

(assert (= (and b!228788 res!112579) b!228790))

(assert (= (and b!228790 res!112573) b!228786))

(assert (= (and b!228786 c!37942) b!228771))

(assert (= (and b!228786 (not c!37942)) b!228791))

(assert (= (and b!228791 c!37939) b!228778))

(assert (= (and b!228791 (not c!37939)) b!228793))

(assert (= (and b!228778 res!112582) b!228783))

(assert (= (and b!228783 res!112583) b!228774))

(assert (= (and b!228793 c!37941) b!228789))

(assert (= (and b!228793 (not c!37941)) b!228787))

(assert (= (and b!228789 res!112575) b!228779))

(assert (= (and b!228779 res!112581) b!228777))

(assert (= (or b!228778 b!228789) bm!21242))

(assert (= (or b!228774 b!228777) bm!21243))

(assert (= (and b!228786 res!112576) b!228792))

(assert (= (and b!228792 c!37940) b!228776))

(assert (= (and b!228792 (not c!37940)) b!228772))

(assert (= (and b!228792 (not res!112577)) b!228782))

(assert (= (and b!228782 (not res!112574)) b!228780))

(assert (= (and b!228780 (not res!112578)) b!228781))

(assert (= (and b!228784 condMapEmpty!10180) mapIsEmpty!10180))

(assert (= (and b!228784 (not condMapEmpty!10180)) mapNonEmpty!10180))

(assert (= (and mapNonEmpty!10180 ((_ is ValueCellFull!2660) mapValue!10180)) b!228773))

(assert (= (and b!228784 ((_ is ValueCellFull!2660) mapDefault!10180)) b!228775))

(assert (= b!228785 b!228784))

(assert (= start!22082 b!228785))

(declare-fun m!249943 () Bool)

(assert (=> b!228780 m!249943))

(declare-fun m!249945 () Bool)

(assert (=> start!22082 m!249945))

(declare-fun m!249947 () Bool)

(assert (=> b!228786 m!249947))

(declare-fun m!249949 () Bool)

(assert (=> b!228786 m!249949))

(assert (=> b!228786 m!249949))

(declare-fun m!249951 () Bool)

(assert (=> b!228786 m!249951))

(declare-fun m!249953 () Bool)

(assert (=> mapNonEmpty!10180 m!249953))

(declare-fun m!249955 () Bool)

(assert (=> b!228776 m!249955))

(declare-fun m!249957 () Bool)

(assert (=> b!228790 m!249957))

(declare-fun m!249959 () Bool)

(assert (=> b!228781 m!249959))

(declare-fun m!249961 () Bool)

(assert (=> b!228779 m!249961))

(declare-fun m!249963 () Bool)

(assert (=> b!228791 m!249963))

(declare-fun m!249965 () Bool)

(assert (=> b!228785 m!249965))

(declare-fun m!249967 () Bool)

(assert (=> b!228785 m!249967))

(declare-fun m!249969 () Bool)

(assert (=> b!228783 m!249969))

(declare-fun m!249971 () Bool)

(assert (=> b!228771 m!249971))

(declare-fun m!249973 () Bool)

(assert (=> bm!21242 m!249973))

(declare-fun m!249975 () Bool)

(assert (=> b!228792 m!249975))

(declare-fun m!249977 () Bool)

(assert (=> b!228792 m!249977))

(declare-fun m!249979 () Bool)

(assert (=> b!228792 m!249979))

(declare-fun m!249981 () Bool)

(assert (=> b!228792 m!249981))

(declare-fun m!249983 () Bool)

(assert (=> b!228792 m!249983))

(declare-fun m!249985 () Bool)

(assert (=> b!228792 m!249985))

(declare-fun m!249987 () Bool)

(assert (=> b!228792 m!249987))

(declare-fun m!249989 () Bool)

(assert (=> b!228792 m!249989))

(declare-fun m!249991 () Bool)

(assert (=> b!228792 m!249991))

(declare-fun m!249993 () Bool)

(assert (=> b!228792 m!249993))

(assert (=> bm!21243 m!249977))

(check-sat (not b!228790) (not start!22082) (not b!228780) (not bm!21242) (not b!228776) (not b!228771) b_and!13017 (not bm!21243) (not b_next!6145) (not mapNonEmpty!10180) (not b!228786) (not b!228791) (not b!228792) (not b!228785) tp_is_empty!6007 (not b!228781))
(check-sat b_and!13017 (not b_next!6145))
