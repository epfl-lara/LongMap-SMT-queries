; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16312 () Bool)

(assert start!16312)

(declare-fun b!162794 () Bool)

(declare-fun b_free!3769 () Bool)

(declare-fun b_next!3769 () Bool)

(assert (=> b!162794 (= b_free!3769 (not b_next!3769))))

(declare-fun tp!13877 () Bool)

(declare-fun b_and!10197 () Bool)

(assert (=> b!162794 (= tp!13877 b_and!10197)))

(declare-fun b!162789 () Bool)

(declare-fun e!106769 () Bool)

(declare-fun tp_is_empty!3571 () Bool)

(assert (=> b!162789 (= e!106769 tp_is_empty!3571)))

(declare-fun b!162790 () Bool)

(declare-fun e!106767 () Bool)

(declare-fun e!106765 () Bool)

(assert (=> b!162790 (= e!106767 e!106765)))

(declare-fun res!77091 () Bool)

(assert (=> b!162790 (=> (not res!77091) (not e!106765))))

(declare-datatypes ((SeekEntryResult!392 0))(
  ( (MissingZero!392 (index!3736 (_ BitVec 32))) (Found!392 (index!3737 (_ BitVec 32))) (Intermediate!392 (undefined!1204 Bool) (index!3738 (_ BitVec 32)) (x!18016 (_ BitVec 32))) (Undefined!392) (MissingVacant!392 (index!3739 (_ BitVec 32))) )
))
(declare-fun lt!82596 () SeekEntryResult!392)

(get-info :version)

(assert (=> b!162790 (= res!77091 (and (not ((_ is Undefined!392) lt!82596)) (not ((_ is MissingVacant!392) lt!82596)) (not ((_ is MissingZero!392) lt!82596)) ((_ is Found!392) lt!82596)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4409 0))(
  ( (V!4410 (val!1830 Int)) )
))
(declare-datatypes ((ValueCell!1442 0))(
  ( (ValueCellFull!1442 (v!3696 V!4409)) (EmptyCell!1442) )
))
(declare-datatypes ((array!6207 0))(
  ( (array!6208 (arr!2948 (Array (_ BitVec 32) (_ BitVec 64))) (size!3232 (_ BitVec 32))) )
))
(declare-datatypes ((array!6209 0))(
  ( (array!6210 (arr!2949 (Array (_ BitVec 32) ValueCell!1442)) (size!3233 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1792 0))(
  ( (LongMapFixedSize!1793 (defaultEntry!3338 Int) (mask!7970 (_ BitVec 32)) (extraKeys!3079 (_ BitVec 32)) (zeroValue!3181 V!4409) (minValue!3181 V!4409) (_size!945 (_ BitVec 32)) (_keys!5139 array!6207) (_values!3321 array!6209) (_vacant!945 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1792)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6207 (_ BitVec 32)) SeekEntryResult!392)

(assert (=> b!162790 (= lt!82596 (seekEntryOrOpen!0 key!828 (_keys!5139 thiss!1248) (mask!7970 thiss!1248)))))

(declare-fun b!162791 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!162791 (= e!106765 (not (validMask!0 (mask!7970 thiss!1248))))))

(declare-fun b!162792 () Bool)

(declare-fun e!106770 () Bool)

(assert (=> b!162792 (= e!106770 tp_is_empty!3571)))

(declare-fun res!77093 () Bool)

(assert (=> start!16312 (=> (not res!77093) (not e!106767))))

(declare-fun valid!827 (LongMapFixedSize!1792) Bool)

(assert (=> start!16312 (= res!77093 (valid!827 thiss!1248))))

(assert (=> start!16312 e!106767))

(declare-fun e!106768 () Bool)

(assert (=> start!16312 e!106768))

(assert (=> start!16312 true))

(declare-fun b!162793 () Bool)

(declare-fun e!106764 () Bool)

(declare-fun mapRes!6044 () Bool)

(assert (=> b!162793 (= e!106764 (and e!106769 mapRes!6044))))

(declare-fun condMapEmpty!6044 () Bool)

(declare-fun mapDefault!6044 () ValueCell!1442)

(assert (=> b!162793 (= condMapEmpty!6044 (= (arr!2949 (_values!3321 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1442)) mapDefault!6044)))))

(declare-fun mapIsEmpty!6044 () Bool)

(assert (=> mapIsEmpty!6044 mapRes!6044))

(declare-fun array_inv!1893 (array!6207) Bool)

(declare-fun array_inv!1894 (array!6209) Bool)

(assert (=> b!162794 (= e!106768 (and tp!13877 tp_is_empty!3571 (array_inv!1893 (_keys!5139 thiss!1248)) (array_inv!1894 (_values!3321 thiss!1248)) e!106764))))

(declare-fun b!162795 () Bool)

(declare-fun res!77092 () Bool)

(assert (=> b!162795 (=> (not res!77092) (not e!106767))))

(assert (=> b!162795 (= res!77092 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6044 () Bool)

(declare-fun tp!13876 () Bool)

(assert (=> mapNonEmpty!6044 (= mapRes!6044 (and tp!13876 e!106770))))

(declare-fun mapKey!6044 () (_ BitVec 32))

(declare-fun mapRest!6044 () (Array (_ BitVec 32) ValueCell!1442))

(declare-fun mapValue!6044 () ValueCell!1442)

(assert (=> mapNonEmpty!6044 (= (arr!2949 (_values!3321 thiss!1248)) (store mapRest!6044 mapKey!6044 mapValue!6044))))

(assert (= (and start!16312 res!77093) b!162795))

(assert (= (and b!162795 res!77092) b!162790))

(assert (= (and b!162790 res!77091) b!162791))

(assert (= (and b!162793 condMapEmpty!6044) mapIsEmpty!6044))

(assert (= (and b!162793 (not condMapEmpty!6044)) mapNonEmpty!6044))

(assert (= (and mapNonEmpty!6044 ((_ is ValueCellFull!1442) mapValue!6044)) b!162792))

(assert (= (and b!162793 ((_ is ValueCellFull!1442) mapDefault!6044)) b!162789))

(assert (= b!162794 b!162793))

(assert (= start!16312 b!162794))

(declare-fun m!193937 () Bool)

(assert (=> b!162791 m!193937))

(declare-fun m!193939 () Bool)

(assert (=> b!162794 m!193939))

(declare-fun m!193941 () Bool)

(assert (=> b!162794 m!193941))

(declare-fun m!193943 () Bool)

(assert (=> mapNonEmpty!6044 m!193943))

(declare-fun m!193945 () Bool)

(assert (=> b!162790 m!193945))

(declare-fun m!193947 () Bool)

(assert (=> start!16312 m!193947))

(check-sat (not b!162794) (not b!162791) (not b!162790) tp_is_empty!3571 b_and!10197 (not mapNonEmpty!6044) (not start!16312) (not b_next!3769))
(check-sat b_and!10197 (not b_next!3769))
(get-model)

(declare-fun d!51431 () Bool)

(declare-fun res!77118 () Bool)

(declare-fun e!106815 () Bool)

(assert (=> d!51431 (=> (not res!77118) (not e!106815))))

(declare-fun simpleValid!118 (LongMapFixedSize!1792) Bool)

(assert (=> d!51431 (= res!77118 (simpleValid!118 thiss!1248))))

(assert (=> d!51431 (= (valid!827 thiss!1248) e!106815)))

(declare-fun b!162844 () Bool)

(declare-fun res!77119 () Bool)

(assert (=> b!162844 (=> (not res!77119) (not e!106815))))

(declare-fun arrayCountValidKeys!0 (array!6207 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!162844 (= res!77119 (= (arrayCountValidKeys!0 (_keys!5139 thiss!1248) #b00000000000000000000000000000000 (size!3232 (_keys!5139 thiss!1248))) (_size!945 thiss!1248)))))

(declare-fun b!162845 () Bool)

(declare-fun res!77120 () Bool)

(assert (=> b!162845 (=> (not res!77120) (not e!106815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6207 (_ BitVec 32)) Bool)

(assert (=> b!162845 (= res!77120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5139 thiss!1248) (mask!7970 thiss!1248)))))

(declare-fun b!162846 () Bool)

(declare-datatypes ((List!1983 0))(
  ( (Nil!1980) (Cons!1979 (h!2592 (_ BitVec 64)) (t!6777 List!1983)) )
))
(declare-fun arrayNoDuplicates!0 (array!6207 (_ BitVec 32) List!1983) Bool)

(assert (=> b!162846 (= e!106815 (arrayNoDuplicates!0 (_keys!5139 thiss!1248) #b00000000000000000000000000000000 Nil!1980))))

(assert (= (and d!51431 res!77118) b!162844))

(assert (= (and b!162844 res!77119) b!162845))

(assert (= (and b!162845 res!77120) b!162846))

(declare-fun m!193973 () Bool)

(assert (=> d!51431 m!193973))

(declare-fun m!193975 () Bool)

(assert (=> b!162844 m!193975))

(declare-fun m!193977 () Bool)

(assert (=> b!162845 m!193977))

(declare-fun m!193979 () Bool)

(assert (=> b!162846 m!193979))

(assert (=> start!16312 d!51431))

(declare-fun d!51433 () Bool)

(assert (=> d!51433 (= (validMask!0 (mask!7970 thiss!1248)) (and (or (= (mask!7970 thiss!1248) #b00000000000000000000000000000111) (= (mask!7970 thiss!1248) #b00000000000000000000000000001111) (= (mask!7970 thiss!1248) #b00000000000000000000000000011111) (= (mask!7970 thiss!1248) #b00000000000000000000000000111111) (= (mask!7970 thiss!1248) #b00000000000000000000000001111111) (= (mask!7970 thiss!1248) #b00000000000000000000000011111111) (= (mask!7970 thiss!1248) #b00000000000000000000000111111111) (= (mask!7970 thiss!1248) #b00000000000000000000001111111111) (= (mask!7970 thiss!1248) #b00000000000000000000011111111111) (= (mask!7970 thiss!1248) #b00000000000000000000111111111111) (= (mask!7970 thiss!1248) #b00000000000000000001111111111111) (= (mask!7970 thiss!1248) #b00000000000000000011111111111111) (= (mask!7970 thiss!1248) #b00000000000000000111111111111111) (= (mask!7970 thiss!1248) #b00000000000000001111111111111111) (= (mask!7970 thiss!1248) #b00000000000000011111111111111111) (= (mask!7970 thiss!1248) #b00000000000000111111111111111111) (= (mask!7970 thiss!1248) #b00000000000001111111111111111111) (= (mask!7970 thiss!1248) #b00000000000011111111111111111111) (= (mask!7970 thiss!1248) #b00000000000111111111111111111111) (= (mask!7970 thiss!1248) #b00000000001111111111111111111111) (= (mask!7970 thiss!1248) #b00000000011111111111111111111111) (= (mask!7970 thiss!1248) #b00000000111111111111111111111111) (= (mask!7970 thiss!1248) #b00000001111111111111111111111111) (= (mask!7970 thiss!1248) #b00000011111111111111111111111111) (= (mask!7970 thiss!1248) #b00000111111111111111111111111111) (= (mask!7970 thiss!1248) #b00001111111111111111111111111111) (= (mask!7970 thiss!1248) #b00011111111111111111111111111111) (= (mask!7970 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7970 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!162791 d!51433))

(declare-fun b!162859 () Bool)

(declare-fun e!106824 () SeekEntryResult!392)

(declare-fun e!106822 () SeekEntryResult!392)

(assert (=> b!162859 (= e!106824 e!106822)))

(declare-fun lt!82610 () (_ BitVec 64))

(declare-fun lt!82611 () SeekEntryResult!392)

(assert (=> b!162859 (= lt!82610 (select (arr!2948 (_keys!5139 thiss!1248)) (index!3738 lt!82611)))))

(declare-fun c!29997 () Bool)

(assert (=> b!162859 (= c!29997 (= lt!82610 key!828))))

(declare-fun b!162860 () Bool)

(declare-fun e!106823 () SeekEntryResult!392)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6207 (_ BitVec 32)) SeekEntryResult!392)

(assert (=> b!162860 (= e!106823 (seekKeyOrZeroReturnVacant!0 (x!18016 lt!82611) (index!3738 lt!82611) (index!3738 lt!82611) key!828 (_keys!5139 thiss!1248) (mask!7970 thiss!1248)))))

(declare-fun b!162861 () Bool)

(assert (=> b!162861 (= e!106824 Undefined!392)))

(declare-fun b!162862 () Bool)

(assert (=> b!162862 (= e!106822 (Found!392 (index!3738 lt!82611)))))

(declare-fun b!162864 () Bool)

(assert (=> b!162864 (= e!106823 (MissingZero!392 (index!3738 lt!82611)))))

(declare-fun b!162863 () Bool)

(declare-fun c!29999 () Bool)

(assert (=> b!162863 (= c!29999 (= lt!82610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!162863 (= e!106822 e!106823)))

(declare-fun d!51435 () Bool)

(declare-fun lt!82609 () SeekEntryResult!392)

(assert (=> d!51435 (and (or ((_ is Undefined!392) lt!82609) (not ((_ is Found!392) lt!82609)) (and (bvsge (index!3737 lt!82609) #b00000000000000000000000000000000) (bvslt (index!3737 lt!82609) (size!3232 (_keys!5139 thiss!1248))))) (or ((_ is Undefined!392) lt!82609) ((_ is Found!392) lt!82609) (not ((_ is MissingZero!392) lt!82609)) (and (bvsge (index!3736 lt!82609) #b00000000000000000000000000000000) (bvslt (index!3736 lt!82609) (size!3232 (_keys!5139 thiss!1248))))) (or ((_ is Undefined!392) lt!82609) ((_ is Found!392) lt!82609) ((_ is MissingZero!392) lt!82609) (not ((_ is MissingVacant!392) lt!82609)) (and (bvsge (index!3739 lt!82609) #b00000000000000000000000000000000) (bvslt (index!3739 lt!82609) (size!3232 (_keys!5139 thiss!1248))))) (or ((_ is Undefined!392) lt!82609) (ite ((_ is Found!392) lt!82609) (= (select (arr!2948 (_keys!5139 thiss!1248)) (index!3737 lt!82609)) key!828) (ite ((_ is MissingZero!392) lt!82609) (= (select (arr!2948 (_keys!5139 thiss!1248)) (index!3736 lt!82609)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!392) lt!82609) (= (select (arr!2948 (_keys!5139 thiss!1248)) (index!3739 lt!82609)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51435 (= lt!82609 e!106824)))

(declare-fun c!29998 () Bool)

(assert (=> d!51435 (= c!29998 (and ((_ is Intermediate!392) lt!82611) (undefined!1204 lt!82611)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6207 (_ BitVec 32)) SeekEntryResult!392)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51435 (= lt!82611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7970 thiss!1248)) key!828 (_keys!5139 thiss!1248) (mask!7970 thiss!1248)))))

(assert (=> d!51435 (validMask!0 (mask!7970 thiss!1248))))

(assert (=> d!51435 (= (seekEntryOrOpen!0 key!828 (_keys!5139 thiss!1248) (mask!7970 thiss!1248)) lt!82609)))

(assert (= (and d!51435 c!29998) b!162861))

(assert (= (and d!51435 (not c!29998)) b!162859))

(assert (= (and b!162859 c!29997) b!162862))

(assert (= (and b!162859 (not c!29997)) b!162863))

(assert (= (and b!162863 c!29999) b!162864))

(assert (= (and b!162863 (not c!29999)) b!162860))

(declare-fun m!193981 () Bool)

(assert (=> b!162859 m!193981))

(declare-fun m!193983 () Bool)

(assert (=> b!162860 m!193983))

(declare-fun m!193985 () Bool)

(assert (=> d!51435 m!193985))

(declare-fun m!193987 () Bool)

(assert (=> d!51435 m!193987))

(declare-fun m!193989 () Bool)

(assert (=> d!51435 m!193989))

(assert (=> d!51435 m!193987))

(assert (=> d!51435 m!193937))

(declare-fun m!193991 () Bool)

(assert (=> d!51435 m!193991))

(declare-fun m!193993 () Bool)

(assert (=> d!51435 m!193993))

(assert (=> b!162790 d!51435))

(declare-fun d!51437 () Bool)

(assert (=> d!51437 (= (array_inv!1893 (_keys!5139 thiss!1248)) (bvsge (size!3232 (_keys!5139 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162794 d!51437))

(declare-fun d!51439 () Bool)

(assert (=> d!51439 (= (array_inv!1894 (_values!3321 thiss!1248)) (bvsge (size!3233 (_values!3321 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162794 d!51439))

(declare-fun mapNonEmpty!6053 () Bool)

(declare-fun mapRes!6053 () Bool)

(declare-fun tp!13892 () Bool)

(declare-fun e!106829 () Bool)

(assert (=> mapNonEmpty!6053 (= mapRes!6053 (and tp!13892 e!106829))))

(declare-fun mapValue!6053 () ValueCell!1442)

(declare-fun mapRest!6053 () (Array (_ BitVec 32) ValueCell!1442))

(declare-fun mapKey!6053 () (_ BitVec 32))

(assert (=> mapNonEmpty!6053 (= mapRest!6044 (store mapRest!6053 mapKey!6053 mapValue!6053))))

(declare-fun mapIsEmpty!6053 () Bool)

(assert (=> mapIsEmpty!6053 mapRes!6053))

(declare-fun condMapEmpty!6053 () Bool)

(declare-fun mapDefault!6053 () ValueCell!1442)

(assert (=> mapNonEmpty!6044 (= condMapEmpty!6053 (= mapRest!6044 ((as const (Array (_ BitVec 32) ValueCell!1442)) mapDefault!6053)))))

(declare-fun e!106830 () Bool)

(assert (=> mapNonEmpty!6044 (= tp!13876 (and e!106830 mapRes!6053))))

(declare-fun b!162871 () Bool)

(assert (=> b!162871 (= e!106829 tp_is_empty!3571)))

(declare-fun b!162872 () Bool)

(assert (=> b!162872 (= e!106830 tp_is_empty!3571)))

(assert (= (and mapNonEmpty!6044 condMapEmpty!6053) mapIsEmpty!6053))

(assert (= (and mapNonEmpty!6044 (not condMapEmpty!6053)) mapNonEmpty!6053))

(assert (= (and mapNonEmpty!6053 ((_ is ValueCellFull!1442) mapValue!6053)) b!162871))

(assert (= (and mapNonEmpty!6044 ((_ is ValueCellFull!1442) mapDefault!6053)) b!162872))

(declare-fun m!193995 () Bool)

(assert (=> mapNonEmpty!6053 m!193995))

(check-sat (not b!162844) (not b!162845) tp_is_empty!3571 (not d!51435) (not b!162846) (not mapNonEmpty!6053) (not b!162860) b_and!10197 (not b_next!3769) (not d!51431))
(check-sat b_and!10197 (not b_next!3769))
