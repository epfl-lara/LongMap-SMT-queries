; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15860 () Bool)

(assert start!15860)

(declare-fun b!157909 () Bool)

(declare-fun b_free!3463 () Bool)

(declare-fun b_next!3463 () Bool)

(assert (=> b!157909 (= b_free!3463 (not b_next!3463))))

(declare-fun tp!12931 () Bool)

(declare-fun b_and!9891 () Bool)

(assert (=> b!157909 (= tp!12931 b_and!9891)))

(declare-fun b!157904 () Bool)

(declare-fun res!74614 () Bool)

(declare-fun e!103420 () Bool)

(assert (=> b!157904 (=> (not res!74614) (not e!103420))))

(declare-datatypes ((V!4001 0))(
  ( (V!4002 (val!1677 Int)) )
))
(declare-datatypes ((ValueCell!1289 0))(
  ( (ValueCellFull!1289 (v!3543 V!4001)) (EmptyCell!1289) )
))
(declare-datatypes ((array!5579 0))(
  ( (array!5580 (arr!2642 (Array (_ BitVec 32) (_ BitVec 64))) (size!2922 (_ BitVec 32))) )
))
(declare-datatypes ((array!5581 0))(
  ( (array!5582 (arr!2643 (Array (_ BitVec 32) ValueCell!1289)) (size!2923 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1486 0))(
  ( (LongMapFixedSize!1487 (defaultEntry!3185 Int) (mask!7680 (_ BitVec 32)) (extraKeys!2926 (_ BitVec 32)) (zeroValue!3028 V!4001) (minValue!3028 V!4001) (_size!792 (_ BitVec 32)) (_keys!4963 array!5579) (_values!3168 array!5581) (_vacant!792 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1486)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157904 (= res!74614 (validMask!0 (mask!7680 thiss!1248)))))

(declare-fun mapIsEmpty!5557 () Bool)

(declare-fun mapRes!5557 () Bool)

(assert (=> mapIsEmpty!5557 mapRes!5557))

(declare-fun b!157905 () Bool)

(declare-fun res!74615 () Bool)

(assert (=> b!157905 (=> (not res!74615) (not e!103420))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!284 0))(
  ( (MissingZero!284 (index!3304 (_ BitVec 32))) (Found!284 (index!3305 (_ BitVec 32))) (Intermediate!284 (undefined!1096 Bool) (index!3306 (_ BitVec 32)) (x!17400 (_ BitVec 32))) (Undefined!284) (MissingVacant!284 (index!3307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5579 (_ BitVec 32)) SeekEntryResult!284)

(assert (=> b!157905 (= res!74615 ((_ is Undefined!284) (seekEntryOrOpen!0 key!828 (_keys!4963 thiss!1248) (mask!7680 thiss!1248))))))

(declare-fun mapNonEmpty!5557 () Bool)

(declare-fun tp!12930 () Bool)

(declare-fun e!103421 () Bool)

(assert (=> mapNonEmpty!5557 (= mapRes!5557 (and tp!12930 e!103421))))

(declare-fun mapKey!5557 () (_ BitVec 32))

(declare-fun mapRest!5557 () (Array (_ BitVec 32) ValueCell!1289))

(declare-fun mapValue!5557 () ValueCell!1289)

(assert (=> mapNonEmpty!5557 (= (arr!2643 (_values!3168 thiss!1248)) (store mapRest!5557 mapKey!5557 mapValue!5557))))

(declare-fun b!157906 () Bool)

(assert (=> b!157906 (= e!103420 (not (= (size!2923 (_values!3168 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7680 thiss!1248)))))))

(declare-fun b!157907 () Bool)

(declare-fun e!103423 () Bool)

(declare-fun e!103418 () Bool)

(assert (=> b!157907 (= e!103423 (and e!103418 mapRes!5557))))

(declare-fun condMapEmpty!5557 () Bool)

(declare-fun mapDefault!5557 () ValueCell!1289)

(assert (=> b!157907 (= condMapEmpty!5557 (= (arr!2643 (_values!3168 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1289)) mapDefault!5557)))))

(declare-fun res!74616 () Bool)

(assert (=> start!15860 (=> (not res!74616) (not e!103420))))

(declare-fun valid!721 (LongMapFixedSize!1486) Bool)

(assert (=> start!15860 (= res!74616 (valid!721 thiss!1248))))

(assert (=> start!15860 e!103420))

(declare-fun e!103419 () Bool)

(assert (=> start!15860 e!103419))

(assert (=> start!15860 true))

(declare-fun b!157908 () Bool)

(declare-fun res!74617 () Bool)

(assert (=> b!157908 (=> (not res!74617) (not e!103420))))

(assert (=> b!157908 (= res!74617 (not (= key!828 (bvneg key!828))))))

(declare-fun tp_is_empty!3265 () Bool)

(declare-fun array_inv!1683 (array!5579) Bool)

(declare-fun array_inv!1684 (array!5581) Bool)

(assert (=> b!157909 (= e!103419 (and tp!12931 tp_is_empty!3265 (array_inv!1683 (_keys!4963 thiss!1248)) (array_inv!1684 (_values!3168 thiss!1248)) e!103423))))

(declare-fun b!157910 () Bool)

(assert (=> b!157910 (= e!103418 tp_is_empty!3265)))

(declare-fun b!157911 () Bool)

(assert (=> b!157911 (= e!103421 tp_is_empty!3265)))

(assert (= (and start!15860 res!74616) b!157908))

(assert (= (and b!157908 res!74617) b!157905))

(assert (= (and b!157905 res!74615) b!157904))

(assert (= (and b!157904 res!74614) b!157906))

(assert (= (and b!157907 condMapEmpty!5557) mapIsEmpty!5557))

(assert (= (and b!157907 (not condMapEmpty!5557)) mapNonEmpty!5557))

(assert (= (and mapNonEmpty!5557 ((_ is ValueCellFull!1289) mapValue!5557)) b!157911))

(assert (= (and b!157907 ((_ is ValueCellFull!1289) mapDefault!5557)) b!157910))

(assert (= b!157909 b!157907))

(assert (= start!15860 b!157909))

(declare-fun m!191063 () Bool)

(assert (=> b!157905 m!191063))

(declare-fun m!191065 () Bool)

(assert (=> b!157909 m!191065))

(declare-fun m!191067 () Bool)

(assert (=> b!157909 m!191067))

(declare-fun m!191069 () Bool)

(assert (=> mapNonEmpty!5557 m!191069))

(declare-fun m!191071 () Bool)

(assert (=> start!15860 m!191071))

(declare-fun m!191073 () Bool)

(assert (=> b!157904 m!191073))

(check-sat tp_is_empty!3265 (not b!157909) (not mapNonEmpty!5557) (not start!15860) b_and!9891 (not b_next!3463) (not b!157904) (not b!157905))
(check-sat b_and!9891 (not b_next!3463))
(get-model)

(declare-fun b!157972 () Bool)

(declare-fun e!103467 () SeekEntryResult!284)

(declare-fun lt!81825 () SeekEntryResult!284)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5579 (_ BitVec 32)) SeekEntryResult!284)

(assert (=> b!157972 (= e!103467 (seekKeyOrZeroReturnVacant!0 (x!17400 lt!81825) (index!3306 lt!81825) (index!3306 lt!81825) key!828 (_keys!4963 thiss!1248) (mask!7680 thiss!1248)))))

(declare-fun b!157973 () Bool)

(declare-fun c!29746 () Bool)

(declare-fun lt!81824 () (_ BitVec 64))

(assert (=> b!157973 (= c!29746 (= lt!81824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103466 () SeekEntryResult!284)

(assert (=> b!157973 (= e!103466 e!103467)))

(declare-fun b!157974 () Bool)

(assert (=> b!157974 (= e!103467 (MissingZero!284 (index!3306 lt!81825)))))

(declare-fun b!157975 () Bool)

(declare-fun e!103468 () SeekEntryResult!284)

(assert (=> b!157975 (= e!103468 Undefined!284)))

(declare-fun d!51183 () Bool)

(declare-fun lt!81823 () SeekEntryResult!284)

(assert (=> d!51183 (and (or ((_ is Undefined!284) lt!81823) (not ((_ is Found!284) lt!81823)) (and (bvsge (index!3305 lt!81823) #b00000000000000000000000000000000) (bvslt (index!3305 lt!81823) (size!2922 (_keys!4963 thiss!1248))))) (or ((_ is Undefined!284) lt!81823) ((_ is Found!284) lt!81823) (not ((_ is MissingZero!284) lt!81823)) (and (bvsge (index!3304 lt!81823) #b00000000000000000000000000000000) (bvslt (index!3304 lt!81823) (size!2922 (_keys!4963 thiss!1248))))) (or ((_ is Undefined!284) lt!81823) ((_ is Found!284) lt!81823) ((_ is MissingZero!284) lt!81823) (not ((_ is MissingVacant!284) lt!81823)) (and (bvsge (index!3307 lt!81823) #b00000000000000000000000000000000) (bvslt (index!3307 lt!81823) (size!2922 (_keys!4963 thiss!1248))))) (or ((_ is Undefined!284) lt!81823) (ite ((_ is Found!284) lt!81823) (= (select (arr!2642 (_keys!4963 thiss!1248)) (index!3305 lt!81823)) key!828) (ite ((_ is MissingZero!284) lt!81823) (= (select (arr!2642 (_keys!4963 thiss!1248)) (index!3304 lt!81823)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!284) lt!81823) (= (select (arr!2642 (_keys!4963 thiss!1248)) (index!3307 lt!81823)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51183 (= lt!81823 e!103468)))

(declare-fun c!29745 () Bool)

(assert (=> d!51183 (= c!29745 (and ((_ is Intermediate!284) lt!81825) (undefined!1096 lt!81825)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5579 (_ BitVec 32)) SeekEntryResult!284)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51183 (= lt!81825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7680 thiss!1248)) key!828 (_keys!4963 thiss!1248) (mask!7680 thiss!1248)))))

(assert (=> d!51183 (validMask!0 (mask!7680 thiss!1248))))

(assert (=> d!51183 (= (seekEntryOrOpen!0 key!828 (_keys!4963 thiss!1248) (mask!7680 thiss!1248)) lt!81823)))

(declare-fun b!157976 () Bool)

(assert (=> b!157976 (= e!103468 e!103466)))

(assert (=> b!157976 (= lt!81824 (select (arr!2642 (_keys!4963 thiss!1248)) (index!3306 lt!81825)))))

(declare-fun c!29747 () Bool)

(assert (=> b!157976 (= c!29747 (= lt!81824 key!828))))

(declare-fun b!157977 () Bool)

(assert (=> b!157977 (= e!103466 (Found!284 (index!3306 lt!81825)))))

(assert (= (and d!51183 c!29745) b!157975))

(assert (= (and d!51183 (not c!29745)) b!157976))

(assert (= (and b!157976 c!29747) b!157977))

(assert (= (and b!157976 (not c!29747)) b!157973))

(assert (= (and b!157973 c!29746) b!157974))

(assert (= (and b!157973 (not c!29746)) b!157972))

(declare-fun m!191099 () Bool)

(assert (=> b!157972 m!191099))

(declare-fun m!191101 () Bool)

(assert (=> d!51183 m!191101))

(declare-fun m!191103 () Bool)

(assert (=> d!51183 m!191103))

(declare-fun m!191105 () Bool)

(assert (=> d!51183 m!191105))

(declare-fun m!191107 () Bool)

(assert (=> d!51183 m!191107))

(declare-fun m!191109 () Bool)

(assert (=> d!51183 m!191109))

(assert (=> d!51183 m!191073))

(assert (=> d!51183 m!191101))

(declare-fun m!191111 () Bool)

(assert (=> b!157976 m!191111))

(assert (=> b!157905 d!51183))

(declare-fun d!51185 () Bool)

(assert (=> d!51185 (= (array_inv!1683 (_keys!4963 thiss!1248)) (bvsge (size!2922 (_keys!4963 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157909 d!51185))

(declare-fun d!51187 () Bool)

(assert (=> d!51187 (= (array_inv!1684 (_values!3168 thiss!1248)) (bvsge (size!2923 (_values!3168 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157909 d!51187))

(declare-fun d!51189 () Bool)

(assert (=> d!51189 (= (validMask!0 (mask!7680 thiss!1248)) (and (or (= (mask!7680 thiss!1248) #b00000000000000000000000000000111) (= (mask!7680 thiss!1248) #b00000000000000000000000000001111) (= (mask!7680 thiss!1248) #b00000000000000000000000000011111) (= (mask!7680 thiss!1248) #b00000000000000000000000000111111) (= (mask!7680 thiss!1248) #b00000000000000000000000001111111) (= (mask!7680 thiss!1248) #b00000000000000000000000011111111) (= (mask!7680 thiss!1248) #b00000000000000000000000111111111) (= (mask!7680 thiss!1248) #b00000000000000000000001111111111) (= (mask!7680 thiss!1248) #b00000000000000000000011111111111) (= (mask!7680 thiss!1248) #b00000000000000000000111111111111) (= (mask!7680 thiss!1248) #b00000000000000000001111111111111) (= (mask!7680 thiss!1248) #b00000000000000000011111111111111) (= (mask!7680 thiss!1248) #b00000000000000000111111111111111) (= (mask!7680 thiss!1248) #b00000000000000001111111111111111) (= (mask!7680 thiss!1248) #b00000000000000011111111111111111) (= (mask!7680 thiss!1248) #b00000000000000111111111111111111) (= (mask!7680 thiss!1248) #b00000000000001111111111111111111) (= (mask!7680 thiss!1248) #b00000000000011111111111111111111) (= (mask!7680 thiss!1248) #b00000000000111111111111111111111) (= (mask!7680 thiss!1248) #b00000000001111111111111111111111) (= (mask!7680 thiss!1248) #b00000000011111111111111111111111) (= (mask!7680 thiss!1248) #b00000000111111111111111111111111) (= (mask!7680 thiss!1248) #b00000001111111111111111111111111) (= (mask!7680 thiss!1248) #b00000011111111111111111111111111) (= (mask!7680 thiss!1248) #b00000111111111111111111111111111) (= (mask!7680 thiss!1248) #b00001111111111111111111111111111) (= (mask!7680 thiss!1248) #b00011111111111111111111111111111) (= (mask!7680 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7680 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157904 d!51189))

(declare-fun d!51191 () Bool)

(declare-fun res!74648 () Bool)

(declare-fun e!103471 () Bool)

(assert (=> d!51191 (=> (not res!74648) (not e!103471))))

(declare-fun simpleValid!110 (LongMapFixedSize!1486) Bool)

(assert (=> d!51191 (= res!74648 (simpleValid!110 thiss!1248))))

(assert (=> d!51191 (= (valid!721 thiss!1248) e!103471)))

(declare-fun b!157984 () Bool)

(declare-fun res!74649 () Bool)

(assert (=> b!157984 (=> (not res!74649) (not e!103471))))

(declare-fun arrayCountValidKeys!0 (array!5579 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157984 (= res!74649 (= (arrayCountValidKeys!0 (_keys!4963 thiss!1248) #b00000000000000000000000000000000 (size!2922 (_keys!4963 thiss!1248))) (_size!792 thiss!1248)))))

(declare-fun b!157985 () Bool)

(declare-fun res!74650 () Bool)

(assert (=> b!157985 (=> (not res!74650) (not e!103471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5579 (_ BitVec 32)) Bool)

(assert (=> b!157985 (= res!74650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4963 thiss!1248) (mask!7680 thiss!1248)))))

(declare-fun b!157986 () Bool)

(declare-datatypes ((List!1871 0))(
  ( (Nil!1868) (Cons!1867 (h!2476 (_ BitVec 64)) (t!6665 List!1871)) )
))
(declare-fun arrayNoDuplicates!0 (array!5579 (_ BitVec 32) List!1871) Bool)

(assert (=> b!157986 (= e!103471 (arrayNoDuplicates!0 (_keys!4963 thiss!1248) #b00000000000000000000000000000000 Nil!1868))))

(assert (= (and d!51191 res!74648) b!157984))

(assert (= (and b!157984 res!74649) b!157985))

(assert (= (and b!157985 res!74650) b!157986))

(declare-fun m!191113 () Bool)

(assert (=> d!51191 m!191113))

(declare-fun m!191115 () Bool)

(assert (=> b!157984 m!191115))

(declare-fun m!191117 () Bool)

(assert (=> b!157985 m!191117))

(declare-fun m!191119 () Bool)

(assert (=> b!157986 m!191119))

(assert (=> start!15860 d!51191))

(declare-fun b!157994 () Bool)

(declare-fun e!103477 () Bool)

(assert (=> b!157994 (= e!103477 tp_is_empty!3265)))

(declare-fun mapNonEmpty!5566 () Bool)

(declare-fun mapRes!5566 () Bool)

(declare-fun tp!12946 () Bool)

(declare-fun e!103476 () Bool)

(assert (=> mapNonEmpty!5566 (= mapRes!5566 (and tp!12946 e!103476))))

(declare-fun mapRest!5566 () (Array (_ BitVec 32) ValueCell!1289))

(declare-fun mapKey!5566 () (_ BitVec 32))

(declare-fun mapValue!5566 () ValueCell!1289)

(assert (=> mapNonEmpty!5566 (= mapRest!5557 (store mapRest!5566 mapKey!5566 mapValue!5566))))

(declare-fun mapIsEmpty!5566 () Bool)

(assert (=> mapIsEmpty!5566 mapRes!5566))

(declare-fun b!157993 () Bool)

(assert (=> b!157993 (= e!103476 tp_is_empty!3265)))

(declare-fun condMapEmpty!5566 () Bool)

(declare-fun mapDefault!5566 () ValueCell!1289)

(assert (=> mapNonEmpty!5557 (= condMapEmpty!5566 (= mapRest!5557 ((as const (Array (_ BitVec 32) ValueCell!1289)) mapDefault!5566)))))

(assert (=> mapNonEmpty!5557 (= tp!12930 (and e!103477 mapRes!5566))))

(assert (= (and mapNonEmpty!5557 condMapEmpty!5566) mapIsEmpty!5566))

(assert (= (and mapNonEmpty!5557 (not condMapEmpty!5566)) mapNonEmpty!5566))

(assert (= (and mapNonEmpty!5566 ((_ is ValueCellFull!1289) mapValue!5566)) b!157993))

(assert (= (and mapNonEmpty!5557 ((_ is ValueCellFull!1289) mapDefault!5566)) b!157994))

(declare-fun m!191121 () Bool)

(assert (=> mapNonEmpty!5566 m!191121))

(check-sat (not b!157984) (not d!51191) (not d!51183) (not mapNonEmpty!5566) (not b_next!3463) (not b!157985) (not b!157986) tp_is_empty!3265 (not b!157972) b_and!9891)
(check-sat b_and!9891 (not b_next!3463))
(get-model)

(declare-fun bm!17221 () Bool)

(declare-fun call!17224 () Bool)

(declare-fun c!29750 () Bool)

(assert (=> bm!17221 (= call!17224 (arrayNoDuplicates!0 (_keys!4963 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29750 (Cons!1867 (select (arr!2642 (_keys!4963 thiss!1248)) #b00000000000000000000000000000000) Nil!1868) Nil!1868)))))

(declare-fun b!158005 () Bool)

(declare-fun e!103489 () Bool)

(assert (=> b!158005 (= e!103489 call!17224)))

(declare-fun b!158006 () Bool)

(assert (=> b!158006 (= e!103489 call!17224)))

(declare-fun d!51193 () Bool)

(declare-fun res!74657 () Bool)

(declare-fun e!103488 () Bool)

(assert (=> d!51193 (=> res!74657 e!103488)))

(assert (=> d!51193 (= res!74657 (bvsge #b00000000000000000000000000000000 (size!2922 (_keys!4963 thiss!1248))))))

(assert (=> d!51193 (= (arrayNoDuplicates!0 (_keys!4963 thiss!1248) #b00000000000000000000000000000000 Nil!1868) e!103488)))

(declare-fun b!158007 () Bool)

(declare-fun e!103487 () Bool)

(assert (=> b!158007 (= e!103487 e!103489)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158007 (= c!29750 (validKeyInArray!0 (select (arr!2642 (_keys!4963 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158008 () Bool)

(assert (=> b!158008 (= e!103488 e!103487)))

(declare-fun res!74659 () Bool)

(assert (=> b!158008 (=> (not res!74659) (not e!103487))))

(declare-fun e!103486 () Bool)

(assert (=> b!158008 (= res!74659 (not e!103486))))

(declare-fun res!74658 () Bool)

(assert (=> b!158008 (=> (not res!74658) (not e!103486))))

(assert (=> b!158008 (= res!74658 (validKeyInArray!0 (select (arr!2642 (_keys!4963 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158009 () Bool)

(declare-fun contains!962 (List!1871 (_ BitVec 64)) Bool)

(assert (=> b!158009 (= e!103486 (contains!962 Nil!1868 (select (arr!2642 (_keys!4963 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51193 (not res!74657)) b!158008))

(assert (= (and b!158008 res!74658) b!158009))

(assert (= (and b!158008 res!74659) b!158007))

(assert (= (and b!158007 c!29750) b!158006))

(assert (= (and b!158007 (not c!29750)) b!158005))

(assert (= (or b!158006 b!158005) bm!17221))

(declare-fun m!191123 () Bool)

(assert (=> bm!17221 m!191123))

(declare-fun m!191125 () Bool)

(assert (=> bm!17221 m!191125))

(assert (=> b!158007 m!191123))

(assert (=> b!158007 m!191123))

(declare-fun m!191127 () Bool)

(assert (=> b!158007 m!191127))

(assert (=> b!158008 m!191123))

(assert (=> b!158008 m!191123))

(assert (=> b!158008 m!191127))

(assert (=> b!158009 m!191123))

(assert (=> b!158009 m!191123))

(declare-fun m!191129 () Bool)

(assert (=> b!158009 m!191129))

(assert (=> b!157986 d!51193))

(declare-fun b!158023 () Bool)

(declare-fun e!103496 () SeekEntryResult!284)

(declare-fun e!103497 () SeekEntryResult!284)

(assert (=> b!158023 (= e!103496 e!103497)))

(declare-fun c!29758 () Bool)

(declare-fun lt!81830 () (_ BitVec 64))

(assert (=> b!158023 (= c!29758 (= lt!81830 key!828))))

(declare-fun e!103498 () SeekEntryResult!284)

(declare-fun b!158024 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158024 (= e!103498 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17400 lt!81825) #b00000000000000000000000000000001) (nextIndex!0 (index!3306 lt!81825) (bvadd (x!17400 lt!81825) #b00000000000000000000000000000001) (mask!7680 thiss!1248)) (index!3306 lt!81825) key!828 (_keys!4963 thiss!1248) (mask!7680 thiss!1248)))))

(declare-fun b!158025 () Bool)

(assert (=> b!158025 (= e!103498 (MissingVacant!284 (index!3306 lt!81825)))))

(declare-fun b!158026 () Bool)

(declare-fun c!29759 () Bool)

(assert (=> b!158026 (= c!29759 (= lt!81830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158026 (= e!103497 e!103498)))

(declare-fun b!158027 () Bool)

(assert (=> b!158027 (= e!103496 Undefined!284)))

(declare-fun lt!81831 () SeekEntryResult!284)

(declare-fun d!51195 () Bool)

(assert (=> d!51195 (and (or ((_ is Undefined!284) lt!81831) (not ((_ is Found!284) lt!81831)) (and (bvsge (index!3305 lt!81831) #b00000000000000000000000000000000) (bvslt (index!3305 lt!81831) (size!2922 (_keys!4963 thiss!1248))))) (or ((_ is Undefined!284) lt!81831) ((_ is Found!284) lt!81831) (not ((_ is MissingVacant!284) lt!81831)) (not (= (index!3307 lt!81831) (index!3306 lt!81825))) (and (bvsge (index!3307 lt!81831) #b00000000000000000000000000000000) (bvslt (index!3307 lt!81831) (size!2922 (_keys!4963 thiss!1248))))) (or ((_ is Undefined!284) lt!81831) (ite ((_ is Found!284) lt!81831) (= (select (arr!2642 (_keys!4963 thiss!1248)) (index!3305 lt!81831)) key!828) (and ((_ is MissingVacant!284) lt!81831) (= (index!3307 lt!81831) (index!3306 lt!81825)) (= (select (arr!2642 (_keys!4963 thiss!1248)) (index!3307 lt!81831)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51195 (= lt!81831 e!103496)))

(declare-fun c!29757 () Bool)

(assert (=> d!51195 (= c!29757 (bvsge (x!17400 lt!81825) #b01111111111111111111111111111110))))

(assert (=> d!51195 (= lt!81830 (select (arr!2642 (_keys!4963 thiss!1248)) (index!3306 lt!81825)))))

(assert (=> d!51195 (validMask!0 (mask!7680 thiss!1248))))

(assert (=> d!51195 (= (seekKeyOrZeroReturnVacant!0 (x!17400 lt!81825) (index!3306 lt!81825) (index!3306 lt!81825) key!828 (_keys!4963 thiss!1248) (mask!7680 thiss!1248)) lt!81831)))

(declare-fun b!158022 () Bool)

(assert (=> b!158022 (= e!103497 (Found!284 (index!3306 lt!81825)))))

(assert (= (and d!51195 c!29757) b!158027))

(assert (= (and d!51195 (not c!29757)) b!158023))

(assert (= (and b!158023 c!29758) b!158022))

(assert (= (and b!158023 (not c!29758)) b!158026))

(assert (= (and b!158026 c!29759) b!158025))

(assert (= (and b!158026 (not c!29759)) b!158024))

(declare-fun m!191131 () Bool)

(assert (=> b!158024 m!191131))

(assert (=> b!158024 m!191131))

(declare-fun m!191133 () Bool)

(assert (=> b!158024 m!191133))

(declare-fun m!191135 () Bool)

(assert (=> d!51195 m!191135))

(declare-fun m!191137 () Bool)

(assert (=> d!51195 m!191137))

(assert (=> d!51195 m!191111))

(assert (=> d!51195 m!191073))

(assert (=> b!157972 d!51195))

(declare-fun b!158046 () Bool)

(declare-fun lt!81837 () SeekEntryResult!284)

(assert (=> b!158046 (and (bvsge (index!3306 lt!81837) #b00000000000000000000000000000000) (bvslt (index!3306 lt!81837) (size!2922 (_keys!4963 thiss!1248))))))

(declare-fun res!74668 () Bool)

(assert (=> b!158046 (= res!74668 (= (select (arr!2642 (_keys!4963 thiss!1248)) (index!3306 lt!81837)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103511 () Bool)

(assert (=> b!158046 (=> res!74668 e!103511)))

(declare-fun b!158047 () Bool)

(assert (=> b!158047 (and (bvsge (index!3306 lt!81837) #b00000000000000000000000000000000) (bvslt (index!3306 lt!81837) (size!2922 (_keys!4963 thiss!1248))))))

(declare-fun res!74667 () Bool)

(assert (=> b!158047 (= res!74667 (= (select (arr!2642 (_keys!4963 thiss!1248)) (index!3306 lt!81837)) key!828))))

(assert (=> b!158047 (=> res!74667 e!103511)))

(declare-fun e!103513 () Bool)

(assert (=> b!158047 (= e!103513 e!103511)))

(declare-fun b!158049 () Bool)

(declare-fun e!103512 () SeekEntryResult!284)

(assert (=> b!158049 (= e!103512 (Intermediate!284 true (toIndex!0 key!828 (mask!7680 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158050 () Bool)

(declare-fun e!103509 () Bool)

(assert (=> b!158050 (= e!103509 e!103513)))

(declare-fun res!74666 () Bool)

(assert (=> b!158050 (= res!74666 (and ((_ is Intermediate!284) lt!81837) (not (undefined!1096 lt!81837)) (bvslt (x!17400 lt!81837) #b01111111111111111111111111111110) (bvsge (x!17400 lt!81837) #b00000000000000000000000000000000) (bvsge (x!17400 lt!81837) #b00000000000000000000000000000000)))))

(assert (=> b!158050 (=> (not res!74666) (not e!103513))))

(declare-fun b!158051 () Bool)

(declare-fun e!103510 () SeekEntryResult!284)

(assert (=> b!158051 (= e!103510 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7680 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!7680 thiss!1248)) key!828 (_keys!4963 thiss!1248) (mask!7680 thiss!1248)))))

(declare-fun b!158052 () Bool)

(assert (=> b!158052 (= e!103509 (bvsge (x!17400 lt!81837) #b01111111111111111111111111111110))))

(declare-fun d!51197 () Bool)

(assert (=> d!51197 e!103509))

(declare-fun c!29767 () Bool)

(assert (=> d!51197 (= c!29767 (and ((_ is Intermediate!284) lt!81837) (undefined!1096 lt!81837)))))

(assert (=> d!51197 (= lt!81837 e!103512)))

(declare-fun c!29768 () Bool)

(assert (=> d!51197 (= c!29768 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!81836 () (_ BitVec 64))

(assert (=> d!51197 (= lt!81836 (select (arr!2642 (_keys!4963 thiss!1248)) (toIndex!0 key!828 (mask!7680 thiss!1248))))))

(assert (=> d!51197 (validMask!0 (mask!7680 thiss!1248))))

(assert (=> d!51197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7680 thiss!1248)) key!828 (_keys!4963 thiss!1248) (mask!7680 thiss!1248)) lt!81837)))

(declare-fun b!158048 () Bool)

(assert (=> b!158048 (= e!103512 e!103510)))

(declare-fun c!29766 () Bool)

(assert (=> b!158048 (= c!29766 (or (= lt!81836 key!828) (= (bvadd lt!81836 lt!81836) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!158053 () Bool)

(assert (=> b!158053 (= e!103510 (Intermediate!284 false (toIndex!0 key!828 (mask!7680 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158054 () Bool)

(assert (=> b!158054 (and (bvsge (index!3306 lt!81837) #b00000000000000000000000000000000) (bvslt (index!3306 lt!81837) (size!2922 (_keys!4963 thiss!1248))))))

(assert (=> b!158054 (= e!103511 (= (select (arr!2642 (_keys!4963 thiss!1248)) (index!3306 lt!81837)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!51197 c!29768) b!158049))

(assert (= (and d!51197 (not c!29768)) b!158048))

(assert (= (and b!158048 c!29766) b!158053))

(assert (= (and b!158048 (not c!29766)) b!158051))

(assert (= (and d!51197 c!29767) b!158052))

(assert (= (and d!51197 (not c!29767)) b!158050))

(assert (= (and b!158050 res!74666) b!158047))

(assert (= (and b!158047 (not res!74667)) b!158046))

(assert (= (and b!158046 (not res!74668)) b!158054))

(declare-fun m!191139 () Bool)

(assert (=> b!158047 m!191139))

(assert (=> b!158054 m!191139))

(assert (=> b!158051 m!191101))

(declare-fun m!191141 () Bool)

(assert (=> b!158051 m!191141))

(assert (=> b!158051 m!191141))

(declare-fun m!191143 () Bool)

(assert (=> b!158051 m!191143))

(assert (=> b!158046 m!191139))

(assert (=> d!51197 m!191101))

(declare-fun m!191145 () Bool)

(assert (=> d!51197 m!191145))

(assert (=> d!51197 m!191073))

(assert (=> d!51183 d!51197))

(declare-fun d!51199 () Bool)

(declare-fun lt!81843 () (_ BitVec 32))

(declare-fun lt!81842 () (_ BitVec 32))

(assert (=> d!51199 (= lt!81843 (bvmul (bvxor lt!81842 (bvlshr lt!81842 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51199 (= lt!81842 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51199 (and (bvsge (mask!7680 thiss!1248) #b00000000000000000000000000000000) (let ((res!74669 (let ((h!2477 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17418 (bvmul (bvxor h!2477 (bvlshr h!2477 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17418 (bvlshr x!17418 #b00000000000000000000000000001101)) (mask!7680 thiss!1248)))))) (and (bvslt res!74669 (bvadd (mask!7680 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74669 #b00000000000000000000000000000000))))))

(assert (=> d!51199 (= (toIndex!0 key!828 (mask!7680 thiss!1248)) (bvand (bvxor lt!81843 (bvlshr lt!81843 #b00000000000000000000000000001101)) (mask!7680 thiss!1248)))))

(assert (=> d!51183 d!51199))

(assert (=> d!51183 d!51189))

(declare-fun bm!17224 () Bool)

(declare-fun call!17227 () Bool)

(assert (=> bm!17224 (= call!17227 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4963 thiss!1248) (mask!7680 thiss!1248)))))

(declare-fun b!158063 () Bool)

(declare-fun e!103522 () Bool)

(assert (=> b!158063 (= e!103522 call!17227)))

(declare-fun d!51201 () Bool)

(declare-fun res!74674 () Bool)

(declare-fun e!103520 () Bool)

(assert (=> d!51201 (=> res!74674 e!103520)))

(assert (=> d!51201 (= res!74674 (bvsge #b00000000000000000000000000000000 (size!2922 (_keys!4963 thiss!1248))))))

(assert (=> d!51201 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4963 thiss!1248) (mask!7680 thiss!1248)) e!103520)))

(declare-fun b!158064 () Bool)

(declare-fun e!103521 () Bool)

(assert (=> b!158064 (= e!103521 e!103522)))

(declare-fun lt!81850 () (_ BitVec 64))

(assert (=> b!158064 (= lt!81850 (select (arr!2642 (_keys!4963 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4987 0))(
  ( (Unit!4988) )
))
(declare-fun lt!81851 () Unit!4987)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5579 (_ BitVec 64) (_ BitVec 32)) Unit!4987)

(assert (=> b!158064 (= lt!81851 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4963 thiss!1248) lt!81850 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158064 (arrayContainsKey!0 (_keys!4963 thiss!1248) lt!81850 #b00000000000000000000000000000000)))

(declare-fun lt!81852 () Unit!4987)

(assert (=> b!158064 (= lt!81852 lt!81851)))

(declare-fun res!74675 () Bool)

(assert (=> b!158064 (= res!74675 (= (seekEntryOrOpen!0 (select (arr!2642 (_keys!4963 thiss!1248)) #b00000000000000000000000000000000) (_keys!4963 thiss!1248) (mask!7680 thiss!1248)) (Found!284 #b00000000000000000000000000000000)))))

(assert (=> b!158064 (=> (not res!74675) (not e!103522))))

(declare-fun b!158065 () Bool)

(assert (=> b!158065 (= e!103520 e!103521)))

(declare-fun c!29771 () Bool)

(assert (=> b!158065 (= c!29771 (validKeyInArray!0 (select (arr!2642 (_keys!4963 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158066 () Bool)

(assert (=> b!158066 (= e!103521 call!17227)))

(assert (= (and d!51201 (not res!74674)) b!158065))

(assert (= (and b!158065 c!29771) b!158064))

(assert (= (and b!158065 (not c!29771)) b!158066))

(assert (= (and b!158064 res!74675) b!158063))

(assert (= (or b!158063 b!158066) bm!17224))

(declare-fun m!191147 () Bool)

(assert (=> bm!17224 m!191147))

(assert (=> b!158064 m!191123))

(declare-fun m!191149 () Bool)

(assert (=> b!158064 m!191149))

(declare-fun m!191151 () Bool)

(assert (=> b!158064 m!191151))

(assert (=> b!158064 m!191123))

(declare-fun m!191153 () Bool)

(assert (=> b!158064 m!191153))

(assert (=> b!158065 m!191123))

(assert (=> b!158065 m!191123))

(assert (=> b!158065 m!191127))

(assert (=> b!157985 d!51201))

(declare-fun b!158075 () Bool)

(declare-fun e!103528 () (_ BitVec 32))

(declare-fun call!17230 () (_ BitVec 32))

(assert (=> b!158075 (= e!103528 call!17230)))

(declare-fun b!158076 () Bool)

(assert (=> b!158076 (= e!103528 (bvadd #b00000000000000000000000000000001 call!17230))))

(declare-fun d!51203 () Bool)

(declare-fun lt!81855 () (_ BitVec 32))

(assert (=> d!51203 (and (bvsge lt!81855 #b00000000000000000000000000000000) (bvsle lt!81855 (bvsub (size!2922 (_keys!4963 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103527 () (_ BitVec 32))

(assert (=> d!51203 (= lt!81855 e!103527)))

(declare-fun c!29776 () Bool)

(assert (=> d!51203 (= c!29776 (bvsge #b00000000000000000000000000000000 (size!2922 (_keys!4963 thiss!1248))))))

(assert (=> d!51203 (and (bvsle #b00000000000000000000000000000000 (size!2922 (_keys!4963 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2922 (_keys!4963 thiss!1248)) (size!2922 (_keys!4963 thiss!1248))))))

(assert (=> d!51203 (= (arrayCountValidKeys!0 (_keys!4963 thiss!1248) #b00000000000000000000000000000000 (size!2922 (_keys!4963 thiss!1248))) lt!81855)))

(declare-fun bm!17227 () Bool)

(assert (=> bm!17227 (= call!17230 (arrayCountValidKeys!0 (_keys!4963 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2922 (_keys!4963 thiss!1248))))))

(declare-fun b!158077 () Bool)

(assert (=> b!158077 (= e!103527 e!103528)))

(declare-fun c!29777 () Bool)

(assert (=> b!158077 (= c!29777 (validKeyInArray!0 (select (arr!2642 (_keys!4963 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158078 () Bool)

(assert (=> b!158078 (= e!103527 #b00000000000000000000000000000000)))

(assert (= (and d!51203 c!29776) b!158078))

(assert (= (and d!51203 (not c!29776)) b!158077))

(assert (= (and b!158077 c!29777) b!158076))

(assert (= (and b!158077 (not c!29777)) b!158075))

(assert (= (or b!158076 b!158075) bm!17227))

(declare-fun m!191155 () Bool)

(assert (=> bm!17227 m!191155))

(assert (=> b!158077 m!191123))

(assert (=> b!158077 m!191123))

(assert (=> b!158077 m!191127))

(assert (=> b!157984 d!51203))

(declare-fun d!51205 () Bool)

(declare-fun res!74684 () Bool)

(declare-fun e!103531 () Bool)

(assert (=> d!51205 (=> (not res!74684) (not e!103531))))

(assert (=> d!51205 (= res!74684 (validMask!0 (mask!7680 thiss!1248)))))

(assert (=> d!51205 (= (simpleValid!110 thiss!1248) e!103531)))

(declare-fun b!158089 () Bool)

(declare-fun res!74687 () Bool)

(assert (=> b!158089 (=> (not res!74687) (not e!103531))))

(declare-fun size!2928 (LongMapFixedSize!1486) (_ BitVec 32))

(assert (=> b!158089 (= res!74687 (= (size!2928 thiss!1248) (bvadd (_size!792 thiss!1248) (bvsdiv (bvadd (extraKeys!2926 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!158090 () Bool)

(assert (=> b!158090 (= e!103531 (and (bvsge (extraKeys!2926 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2926 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!792 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158087 () Bool)

(declare-fun res!74686 () Bool)

(assert (=> b!158087 (=> (not res!74686) (not e!103531))))

(assert (=> b!158087 (= res!74686 (and (= (size!2923 (_values!3168 thiss!1248)) (bvadd (mask!7680 thiss!1248) #b00000000000000000000000000000001)) (= (size!2922 (_keys!4963 thiss!1248)) (size!2923 (_values!3168 thiss!1248))) (bvsge (_size!792 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!792 thiss!1248) (bvadd (mask!7680 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!158088 () Bool)

(declare-fun res!74685 () Bool)

(assert (=> b!158088 (=> (not res!74685) (not e!103531))))

(assert (=> b!158088 (= res!74685 (bvsge (size!2928 thiss!1248) (_size!792 thiss!1248)))))

(assert (= (and d!51205 res!74684) b!158087))

(assert (= (and b!158087 res!74686) b!158088))

(assert (= (and b!158088 res!74685) b!158089))

(assert (= (and b!158089 res!74687) b!158090))

(assert (=> d!51205 m!191073))

(declare-fun m!191157 () Bool)

(assert (=> b!158089 m!191157))

(assert (=> b!158088 m!191157))

(assert (=> d!51191 d!51205))

(declare-fun b!158092 () Bool)

(declare-fun e!103533 () Bool)

(assert (=> b!158092 (= e!103533 tp_is_empty!3265)))

(declare-fun mapNonEmpty!5567 () Bool)

(declare-fun mapRes!5567 () Bool)

(declare-fun tp!12947 () Bool)

(declare-fun e!103532 () Bool)

(assert (=> mapNonEmpty!5567 (= mapRes!5567 (and tp!12947 e!103532))))

(declare-fun mapRest!5567 () (Array (_ BitVec 32) ValueCell!1289))

(declare-fun mapValue!5567 () ValueCell!1289)

(declare-fun mapKey!5567 () (_ BitVec 32))

(assert (=> mapNonEmpty!5567 (= mapRest!5566 (store mapRest!5567 mapKey!5567 mapValue!5567))))

(declare-fun mapIsEmpty!5567 () Bool)

(assert (=> mapIsEmpty!5567 mapRes!5567))

(declare-fun b!158091 () Bool)

(assert (=> b!158091 (= e!103532 tp_is_empty!3265)))

(declare-fun condMapEmpty!5567 () Bool)

(declare-fun mapDefault!5567 () ValueCell!1289)

(assert (=> mapNonEmpty!5566 (= condMapEmpty!5567 (= mapRest!5566 ((as const (Array (_ BitVec 32) ValueCell!1289)) mapDefault!5567)))))

(assert (=> mapNonEmpty!5566 (= tp!12946 (and e!103533 mapRes!5567))))

(assert (= (and mapNonEmpty!5566 condMapEmpty!5567) mapIsEmpty!5567))

(assert (= (and mapNonEmpty!5566 (not condMapEmpty!5567)) mapNonEmpty!5567))

(assert (= (and mapNonEmpty!5567 ((_ is ValueCellFull!1289) mapValue!5567)) b!158091))

(assert (= (and mapNonEmpty!5566 ((_ is ValueCellFull!1289) mapDefault!5567)) b!158092))

(declare-fun m!191159 () Bool)

(assert (=> mapNonEmpty!5567 m!191159))

(check-sat tp_is_empty!3265 (not bm!17227) (not b!158051) (not d!51197) (not b!158024) (not b!158064) (not bm!17224) (not d!51195) b_and!9891 (not bm!17221) (not b_next!3463) (not d!51205) (not b!158065) (not b!158008) (not b!158077) (not b!158088) (not b!158007) (not b!158009) (not mapNonEmpty!5567) (not b!158089))
(check-sat b_and!9891 (not b_next!3463))
