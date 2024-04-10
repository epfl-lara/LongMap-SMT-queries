; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15842 () Bool)

(assert start!15842)

(declare-fun b!157780 () Bool)

(declare-fun b_free!3459 () Bool)

(declare-fun b_next!3459 () Bool)

(assert (=> b!157780 (= b_free!3459 (not b_next!3459))))

(declare-fun tp!12915 () Bool)

(declare-fun b_and!9873 () Bool)

(assert (=> b!157780 (= tp!12915 b_and!9873)))

(declare-fun mapNonEmpty!5548 () Bool)

(declare-fun mapRes!5548 () Bool)

(declare-fun tp!12916 () Bool)

(declare-fun e!103340 () Bool)

(assert (=> mapNonEmpty!5548 (= mapRes!5548 (and tp!12916 e!103340))))

(declare-fun mapKey!5548 () (_ BitVec 32))

(declare-datatypes ((V!3995 0))(
  ( (V!3996 (val!1675 Int)) )
))
(declare-datatypes ((ValueCell!1287 0))(
  ( (ValueCellFull!1287 (v!3540 V!3995)) (EmptyCell!1287) )
))
(declare-fun mapValue!5548 () ValueCell!1287)

(declare-datatypes ((array!5583 0))(
  ( (array!5584 (arr!2645 (Array (_ BitVec 32) (_ BitVec 64))) (size!2925 (_ BitVec 32))) )
))
(declare-datatypes ((array!5585 0))(
  ( (array!5586 (arr!2646 (Array (_ BitVec 32) ValueCell!1287)) (size!2926 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1482 0))(
  ( (LongMapFixedSize!1483 (defaultEntry!3183 Int) (mask!7674 (_ BitVec 32)) (extraKeys!2924 (_ BitVec 32)) (zeroValue!3026 V!3995) (minValue!3026 V!3995) (_size!790 (_ BitVec 32)) (_keys!4960 array!5583) (_values!3166 array!5585) (_vacant!790 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1482)

(declare-fun mapRest!5548 () (Array (_ BitVec 32) ValueCell!1287))

(assert (=> mapNonEmpty!5548 (= (arr!2646 (_values!3166 thiss!1248)) (store mapRest!5548 mapKey!5548 mapValue!5548))))

(declare-fun res!74566 () Bool)

(declare-fun e!103344 () Bool)

(assert (=> start!15842 (=> (not res!74566) (not e!103344))))

(declare-fun valid!702 (LongMapFixedSize!1482) Bool)

(assert (=> start!15842 (= res!74566 (valid!702 thiss!1248))))

(assert (=> start!15842 e!103344))

(declare-fun e!103341 () Bool)

(assert (=> start!15842 e!103341))

(assert (=> start!15842 true))

(declare-fun b!157778 () Bool)

(declare-fun res!74564 () Bool)

(assert (=> b!157778 (=> (not res!74564) (not e!103344))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157778 (= res!74564 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157779 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157779 (= e!103344 (not (validMask!0 (mask!7674 thiss!1248))))))

(declare-fun e!103342 () Bool)

(declare-fun tp_is_empty!3261 () Bool)

(declare-fun array_inv!1683 (array!5583) Bool)

(declare-fun array_inv!1684 (array!5585) Bool)

(assert (=> b!157780 (= e!103341 (and tp!12915 tp_is_empty!3261 (array_inv!1683 (_keys!4960 thiss!1248)) (array_inv!1684 (_values!3166 thiss!1248)) e!103342))))

(declare-fun mapIsEmpty!5548 () Bool)

(assert (=> mapIsEmpty!5548 mapRes!5548))

(declare-fun b!157781 () Bool)

(assert (=> b!157781 (= e!103340 tp_is_empty!3261)))

(declare-fun b!157782 () Bool)

(declare-fun e!103345 () Bool)

(assert (=> b!157782 (= e!103342 (and e!103345 mapRes!5548))))

(declare-fun condMapEmpty!5548 () Bool)

(declare-fun mapDefault!5548 () ValueCell!1287)

(assert (=> b!157782 (= condMapEmpty!5548 (= (arr!2646 (_values!3166 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1287)) mapDefault!5548)))))

(declare-fun b!157783 () Bool)

(assert (=> b!157783 (= e!103345 tp_is_empty!3261)))

(declare-fun b!157784 () Bool)

(declare-fun res!74565 () Bool)

(assert (=> b!157784 (=> (not res!74565) (not e!103344))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!289 0))(
  ( (MissingZero!289 (index!3324 (_ BitVec 32))) (Found!289 (index!3325 (_ BitVec 32))) (Intermediate!289 (undefined!1101 Bool) (index!3326 (_ BitVec 32)) (x!17389 (_ BitVec 32))) (Undefined!289) (MissingVacant!289 (index!3327 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5583 (_ BitVec 32)) SeekEntryResult!289)

(assert (=> b!157784 (= res!74565 ((_ is Undefined!289) (seekEntryOrOpen!0 key!828 (_keys!4960 thiss!1248) (mask!7674 thiss!1248))))))

(assert (= (and start!15842 res!74566) b!157778))

(assert (= (and b!157778 res!74564) b!157784))

(assert (= (and b!157784 res!74565) b!157779))

(assert (= (and b!157782 condMapEmpty!5548) mapIsEmpty!5548))

(assert (= (and b!157782 (not condMapEmpty!5548)) mapNonEmpty!5548))

(assert (= (and mapNonEmpty!5548 ((_ is ValueCellFull!1287) mapValue!5548)) b!157781))

(assert (= (and b!157782 ((_ is ValueCellFull!1287) mapDefault!5548)) b!157783))

(assert (= b!157780 b!157782))

(assert (= start!15842 b!157780))

(declare-fun m!190833 () Bool)

(assert (=> mapNonEmpty!5548 m!190833))

(declare-fun m!190835 () Bool)

(assert (=> b!157780 m!190835))

(declare-fun m!190837 () Bool)

(assert (=> b!157780 m!190837))

(declare-fun m!190839 () Bool)

(assert (=> b!157784 m!190839))

(declare-fun m!190841 () Bool)

(assert (=> start!15842 m!190841))

(declare-fun m!190843 () Bool)

(assert (=> b!157779 m!190843))

(check-sat (not mapNonEmpty!5548) b_and!9873 (not b!157784) (not b!157779) (not b_next!3459) (not start!15842) tp_is_empty!3261 (not b!157780))
(check-sat b_and!9873 (not b_next!3459))
(get-model)

(declare-fun d!51097 () Bool)

(assert (=> d!51097 (= (array_inv!1683 (_keys!4960 thiss!1248)) (bvsge (size!2925 (_keys!4960 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157780 d!51097))

(declare-fun d!51099 () Bool)

(assert (=> d!51099 (= (array_inv!1684 (_values!3166 thiss!1248)) (bvsge (size!2926 (_values!3166 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157780 d!51099))

(declare-fun d!51101 () Bool)

(declare-fun res!74582 () Bool)

(declare-fun e!103366 () Bool)

(assert (=> d!51101 (=> (not res!74582) (not e!103366))))

(declare-fun simpleValid!109 (LongMapFixedSize!1482) Bool)

(assert (=> d!51101 (= res!74582 (simpleValid!109 thiss!1248))))

(assert (=> d!51101 (= (valid!702 thiss!1248) e!103366)))

(declare-fun b!157812 () Bool)

(declare-fun res!74583 () Bool)

(assert (=> b!157812 (=> (not res!74583) (not e!103366))))

(declare-fun arrayCountValidKeys!0 (array!5583 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157812 (= res!74583 (= (arrayCountValidKeys!0 (_keys!4960 thiss!1248) #b00000000000000000000000000000000 (size!2925 (_keys!4960 thiss!1248))) (_size!790 thiss!1248)))))

(declare-fun b!157813 () Bool)

(declare-fun res!74584 () Bool)

(assert (=> b!157813 (=> (not res!74584) (not e!103366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5583 (_ BitVec 32)) Bool)

(assert (=> b!157813 (= res!74584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4960 thiss!1248) (mask!7674 thiss!1248)))))

(declare-fun b!157814 () Bool)

(declare-datatypes ((List!1886 0))(
  ( (Nil!1883) (Cons!1882 (h!2491 (_ BitVec 64)) (t!6688 List!1886)) )
))
(declare-fun arrayNoDuplicates!0 (array!5583 (_ BitVec 32) List!1886) Bool)

(assert (=> b!157814 (= e!103366 (arrayNoDuplicates!0 (_keys!4960 thiss!1248) #b00000000000000000000000000000000 Nil!1883))))

(assert (= (and d!51101 res!74582) b!157812))

(assert (= (and b!157812 res!74583) b!157813))

(assert (= (and b!157813 res!74584) b!157814))

(declare-fun m!190857 () Bool)

(assert (=> d!51101 m!190857))

(declare-fun m!190859 () Bool)

(assert (=> b!157812 m!190859))

(declare-fun m!190861 () Bool)

(assert (=> b!157813 m!190861))

(declare-fun m!190863 () Bool)

(assert (=> b!157814 m!190863))

(assert (=> start!15842 d!51101))

(declare-fun d!51103 () Bool)

(declare-fun lt!81756 () SeekEntryResult!289)

(assert (=> d!51103 (and (or ((_ is Undefined!289) lt!81756) (not ((_ is Found!289) lt!81756)) (and (bvsge (index!3325 lt!81756) #b00000000000000000000000000000000) (bvslt (index!3325 lt!81756) (size!2925 (_keys!4960 thiss!1248))))) (or ((_ is Undefined!289) lt!81756) ((_ is Found!289) lt!81756) (not ((_ is MissingZero!289) lt!81756)) (and (bvsge (index!3324 lt!81756) #b00000000000000000000000000000000) (bvslt (index!3324 lt!81756) (size!2925 (_keys!4960 thiss!1248))))) (or ((_ is Undefined!289) lt!81756) ((_ is Found!289) lt!81756) ((_ is MissingZero!289) lt!81756) (not ((_ is MissingVacant!289) lt!81756)) (and (bvsge (index!3327 lt!81756) #b00000000000000000000000000000000) (bvslt (index!3327 lt!81756) (size!2925 (_keys!4960 thiss!1248))))) (or ((_ is Undefined!289) lt!81756) (ite ((_ is Found!289) lt!81756) (= (select (arr!2645 (_keys!4960 thiss!1248)) (index!3325 lt!81756)) key!828) (ite ((_ is MissingZero!289) lt!81756) (= (select (arr!2645 (_keys!4960 thiss!1248)) (index!3324 lt!81756)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!289) lt!81756) (= (select (arr!2645 (_keys!4960 thiss!1248)) (index!3327 lt!81756)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!103373 () SeekEntryResult!289)

(assert (=> d!51103 (= lt!81756 e!103373)))

(declare-fun c!29724 () Bool)

(declare-fun lt!81757 () SeekEntryResult!289)

(assert (=> d!51103 (= c!29724 (and ((_ is Intermediate!289) lt!81757) (undefined!1101 lt!81757)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5583 (_ BitVec 32)) SeekEntryResult!289)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51103 (= lt!81757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7674 thiss!1248)) key!828 (_keys!4960 thiss!1248) (mask!7674 thiss!1248)))))

(assert (=> d!51103 (validMask!0 (mask!7674 thiss!1248))))

(assert (=> d!51103 (= (seekEntryOrOpen!0 key!828 (_keys!4960 thiss!1248) (mask!7674 thiss!1248)) lt!81756)))

(declare-fun b!157827 () Bool)

(declare-fun e!103375 () SeekEntryResult!289)

(assert (=> b!157827 (= e!103375 (MissingZero!289 (index!3326 lt!81757)))))

(declare-fun b!157828 () Bool)

(declare-fun c!29723 () Bool)

(declare-fun lt!81755 () (_ BitVec 64))

(assert (=> b!157828 (= c!29723 (= lt!81755 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103374 () SeekEntryResult!289)

(assert (=> b!157828 (= e!103374 e!103375)))

(declare-fun b!157829 () Bool)

(assert (=> b!157829 (= e!103373 e!103374)))

(assert (=> b!157829 (= lt!81755 (select (arr!2645 (_keys!4960 thiss!1248)) (index!3326 lt!81757)))))

(declare-fun c!29725 () Bool)

(assert (=> b!157829 (= c!29725 (= lt!81755 key!828))))

(declare-fun b!157830 () Bool)

(assert (=> b!157830 (= e!103374 (Found!289 (index!3326 lt!81757)))))

(declare-fun b!157831 () Bool)

(assert (=> b!157831 (= e!103373 Undefined!289)))

(declare-fun b!157832 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5583 (_ BitVec 32)) SeekEntryResult!289)

(assert (=> b!157832 (= e!103375 (seekKeyOrZeroReturnVacant!0 (x!17389 lt!81757) (index!3326 lt!81757) (index!3326 lt!81757) key!828 (_keys!4960 thiss!1248) (mask!7674 thiss!1248)))))

(assert (= (and d!51103 c!29724) b!157831))

(assert (= (and d!51103 (not c!29724)) b!157829))

(assert (= (and b!157829 c!29725) b!157830))

(assert (= (and b!157829 (not c!29725)) b!157828))

(assert (= (and b!157828 c!29723) b!157827))

(assert (= (and b!157828 (not c!29723)) b!157832))

(declare-fun m!190865 () Bool)

(assert (=> d!51103 m!190865))

(assert (=> d!51103 m!190843))

(declare-fun m!190867 () Bool)

(assert (=> d!51103 m!190867))

(declare-fun m!190869 () Bool)

(assert (=> d!51103 m!190869))

(declare-fun m!190871 () Bool)

(assert (=> d!51103 m!190871))

(assert (=> d!51103 m!190871))

(declare-fun m!190873 () Bool)

(assert (=> d!51103 m!190873))

(declare-fun m!190875 () Bool)

(assert (=> b!157829 m!190875))

(declare-fun m!190877 () Bool)

(assert (=> b!157832 m!190877))

(assert (=> b!157784 d!51103))

(declare-fun d!51105 () Bool)

(assert (=> d!51105 (= (validMask!0 (mask!7674 thiss!1248)) (and (or (= (mask!7674 thiss!1248) #b00000000000000000000000000000111) (= (mask!7674 thiss!1248) #b00000000000000000000000000001111) (= (mask!7674 thiss!1248) #b00000000000000000000000000011111) (= (mask!7674 thiss!1248) #b00000000000000000000000000111111) (= (mask!7674 thiss!1248) #b00000000000000000000000001111111) (= (mask!7674 thiss!1248) #b00000000000000000000000011111111) (= (mask!7674 thiss!1248) #b00000000000000000000000111111111) (= (mask!7674 thiss!1248) #b00000000000000000000001111111111) (= (mask!7674 thiss!1248) #b00000000000000000000011111111111) (= (mask!7674 thiss!1248) #b00000000000000000000111111111111) (= (mask!7674 thiss!1248) #b00000000000000000001111111111111) (= (mask!7674 thiss!1248) #b00000000000000000011111111111111) (= (mask!7674 thiss!1248) #b00000000000000000111111111111111) (= (mask!7674 thiss!1248) #b00000000000000001111111111111111) (= (mask!7674 thiss!1248) #b00000000000000011111111111111111) (= (mask!7674 thiss!1248) #b00000000000000111111111111111111) (= (mask!7674 thiss!1248) #b00000000000001111111111111111111) (= (mask!7674 thiss!1248) #b00000000000011111111111111111111) (= (mask!7674 thiss!1248) #b00000000000111111111111111111111) (= (mask!7674 thiss!1248) #b00000000001111111111111111111111) (= (mask!7674 thiss!1248) #b00000000011111111111111111111111) (= (mask!7674 thiss!1248) #b00000000111111111111111111111111) (= (mask!7674 thiss!1248) #b00000001111111111111111111111111) (= (mask!7674 thiss!1248) #b00000011111111111111111111111111) (= (mask!7674 thiss!1248) #b00000111111111111111111111111111) (= (mask!7674 thiss!1248) #b00001111111111111111111111111111) (= (mask!7674 thiss!1248) #b00011111111111111111111111111111) (= (mask!7674 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7674 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157779 d!51105))

(declare-fun condMapEmpty!5554 () Bool)

(declare-fun mapDefault!5554 () ValueCell!1287)

(assert (=> mapNonEmpty!5548 (= condMapEmpty!5554 (= mapRest!5548 ((as const (Array (_ BitVec 32) ValueCell!1287)) mapDefault!5554)))))

(declare-fun e!103380 () Bool)

(declare-fun mapRes!5554 () Bool)

(assert (=> mapNonEmpty!5548 (= tp!12916 (and e!103380 mapRes!5554))))

(declare-fun b!157839 () Bool)

(declare-fun e!103381 () Bool)

(assert (=> b!157839 (= e!103381 tp_is_empty!3261)))

(declare-fun mapNonEmpty!5554 () Bool)

(declare-fun tp!12925 () Bool)

(assert (=> mapNonEmpty!5554 (= mapRes!5554 (and tp!12925 e!103381))))

(declare-fun mapRest!5554 () (Array (_ BitVec 32) ValueCell!1287))

(declare-fun mapValue!5554 () ValueCell!1287)

(declare-fun mapKey!5554 () (_ BitVec 32))

(assert (=> mapNonEmpty!5554 (= mapRest!5548 (store mapRest!5554 mapKey!5554 mapValue!5554))))

(declare-fun b!157840 () Bool)

(assert (=> b!157840 (= e!103380 tp_is_empty!3261)))

(declare-fun mapIsEmpty!5554 () Bool)

(assert (=> mapIsEmpty!5554 mapRes!5554))

(assert (= (and mapNonEmpty!5548 condMapEmpty!5554) mapIsEmpty!5554))

(assert (= (and mapNonEmpty!5548 (not condMapEmpty!5554)) mapNonEmpty!5554))

(assert (= (and mapNonEmpty!5554 ((_ is ValueCellFull!1287) mapValue!5554)) b!157839))

(assert (= (and mapNonEmpty!5548 ((_ is ValueCellFull!1287) mapDefault!5554)) b!157840))

(declare-fun m!190879 () Bool)

(assert (=> mapNonEmpty!5554 m!190879))

(check-sat (not mapNonEmpty!5554) b_and!9873 (not d!51101) (not d!51103) (not b!157812) tp_is_empty!3261 (not b!157832) (not b_next!3459) (not b!157813) (not b!157814))
(check-sat b_and!9873 (not b_next!3459))
