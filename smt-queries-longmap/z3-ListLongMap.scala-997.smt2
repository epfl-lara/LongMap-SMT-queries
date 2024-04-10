; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21520 () Bool)

(assert start!21520)

(declare-fun b!215847 () Bool)

(declare-fun b_free!5733 () Bool)

(declare-fun b_next!5733 () Bool)

(assert (=> b!215847 (= b_free!5733 (not b_next!5733))))

(declare-fun tp!20320 () Bool)

(declare-fun b_and!12623 () Bool)

(assert (=> b!215847 (= tp!20320 b_and!12623)))

(declare-fun mapIsEmpty!9542 () Bool)

(declare-fun mapRes!9542 () Bool)

(assert (=> mapIsEmpty!9542 mapRes!9542))

(declare-fun b!215841 () Bool)

(declare-fun e!140431 () Bool)

(declare-fun e!140428 () Bool)

(assert (=> b!215841 (= e!140431 (and e!140428 mapRes!9542))))

(declare-fun condMapEmpty!9542 () Bool)

(declare-datatypes ((V!7107 0))(
  ( (V!7108 (val!2842 Int)) )
))
(declare-datatypes ((ValueCell!2454 0))(
  ( (ValueCellFull!2454 (v!4860 V!7107)) (EmptyCell!2454) )
))
(declare-datatypes ((array!10421 0))(
  ( (array!10422 (arr!4936 (Array (_ BitVec 32) ValueCell!2454)) (size!5267 (_ BitVec 32))) )
))
(declare-datatypes ((array!10423 0))(
  ( (array!10424 (arr!4937 (Array (_ BitVec 32) (_ BitVec 64))) (size!5268 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2808 0))(
  ( (LongMapFixedSize!2809 (defaultEntry!4054 Int) (mask!9768 (_ BitVec 32)) (extraKeys!3791 (_ BitVec 32)) (zeroValue!3895 V!7107) (minValue!3895 V!7107) (_size!1453 (_ BitVec 32)) (_keys!6093 array!10423) (_values!4037 array!10421) (_vacant!1453 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2808)

(declare-fun mapDefault!9542 () ValueCell!2454)

(assert (=> b!215841 (= condMapEmpty!9542 (= (arr!4936 (_values!4037 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2454)) mapDefault!9542)))))

(declare-fun b!215842 () Bool)

(declare-fun e!140426 () Bool)

(declare-fun e!140427 () Bool)

(assert (=> b!215842 (= e!140426 e!140427)))

(declare-fun res!105552 () Bool)

(assert (=> b!215842 (=> (not res!105552) (not e!140427))))

(declare-datatypes ((SeekEntryResult!736 0))(
  ( (MissingZero!736 (index!5114 (_ BitVec 32))) (Found!736 (index!5115 (_ BitVec 32))) (Intermediate!736 (undefined!1548 Bool) (index!5116 (_ BitVec 32)) (x!22559 (_ BitVec 32))) (Undefined!736) (MissingVacant!736 (index!5117 (_ BitVec 32))) )
))
(declare-fun lt!111042 () SeekEntryResult!736)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215842 (= res!105552 (or (= lt!111042 (MissingZero!736 index!297)) (= lt!111042 (MissingVacant!736 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10423 (_ BitVec 32)) SeekEntryResult!736)

(assert (=> b!215842 (= lt!111042 (seekEntryOrOpen!0 key!932 (_keys!6093 thiss!1504) (mask!9768 thiss!1504)))))

(declare-fun b!215843 () Bool)

(declare-fun res!105554 () Bool)

(assert (=> b!215843 (=> (not res!105554) (not e!140427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215843 (= res!105554 (validMask!0 (mask!9768 thiss!1504)))))

(declare-fun b!215844 () Bool)

(declare-fun tp_is_empty!5595 () Bool)

(assert (=> b!215844 (= e!140428 tp_is_empty!5595)))

(declare-fun b!215845 () Bool)

(declare-fun res!105553 () Bool)

(assert (=> b!215845 (=> (not res!105553) (not e!140426))))

(assert (=> b!215845 (= res!105553 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!215846 () Bool)

(assert (=> b!215846 (= e!140427 (and (= (size!5267 (_values!4037 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9768 thiss!1504))) (= (size!5268 (_keys!6093 thiss!1504)) (size!5267 (_values!4037 thiss!1504))) (bvsge (mask!9768 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3791 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3791 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun e!140429 () Bool)

(declare-fun array_inv!3265 (array!10423) Bool)

(declare-fun array_inv!3266 (array!10421) Bool)

(assert (=> b!215847 (= e!140429 (and tp!20320 tp_is_empty!5595 (array_inv!3265 (_keys!6093 thiss!1504)) (array_inv!3266 (_values!4037 thiss!1504)) e!140431))))

(declare-fun mapNonEmpty!9542 () Bool)

(declare-fun tp!20321 () Bool)

(declare-fun e!140432 () Bool)

(assert (=> mapNonEmpty!9542 (= mapRes!9542 (and tp!20321 e!140432))))

(declare-fun mapRest!9542 () (Array (_ BitVec 32) ValueCell!2454))

(declare-fun mapValue!9542 () ValueCell!2454)

(declare-fun mapKey!9542 () (_ BitVec 32))

(assert (=> mapNonEmpty!9542 (= (arr!4936 (_values!4037 thiss!1504)) (store mapRest!9542 mapKey!9542 mapValue!9542))))

(declare-fun b!215848 () Bool)

(assert (=> b!215848 (= e!140432 tp_is_empty!5595)))

(declare-fun res!105551 () Bool)

(assert (=> start!21520 (=> (not res!105551) (not e!140426))))

(declare-fun valid!1142 (LongMapFixedSize!2808) Bool)

(assert (=> start!21520 (= res!105551 (valid!1142 thiss!1504))))

(assert (=> start!21520 e!140426))

(assert (=> start!21520 e!140429))

(assert (=> start!21520 true))

(assert (= (and start!21520 res!105551) b!215845))

(assert (= (and b!215845 res!105553) b!215842))

(assert (= (and b!215842 res!105552) b!215843))

(assert (= (and b!215843 res!105554) b!215846))

(assert (= (and b!215841 condMapEmpty!9542) mapIsEmpty!9542))

(assert (= (and b!215841 (not condMapEmpty!9542)) mapNonEmpty!9542))

(get-info :version)

(assert (= (and mapNonEmpty!9542 ((_ is ValueCellFull!2454) mapValue!9542)) b!215848))

(assert (= (and b!215841 ((_ is ValueCellFull!2454) mapDefault!9542)) b!215844))

(assert (= b!215847 b!215841))

(assert (= start!21520 b!215847))

(declare-fun m!242839 () Bool)

(assert (=> b!215842 m!242839))

(declare-fun m!242841 () Bool)

(assert (=> start!21520 m!242841))

(declare-fun m!242843 () Bool)

(assert (=> b!215843 m!242843))

(declare-fun m!242845 () Bool)

(assert (=> mapNonEmpty!9542 m!242845))

(declare-fun m!242847 () Bool)

(assert (=> b!215847 m!242847))

(declare-fun m!242849 () Bool)

(assert (=> b!215847 m!242849))

(check-sat (not mapNonEmpty!9542) (not start!21520) (not b!215847) (not b!215842) (not b!215843) b_and!12623 (not b_next!5733) tp_is_empty!5595)
(check-sat b_and!12623 (not b_next!5733))
(get-model)

(declare-fun d!58485 () Bool)

(assert (=> d!58485 (= (validMask!0 (mask!9768 thiss!1504)) (and (or (= (mask!9768 thiss!1504) #b00000000000000000000000000000111) (= (mask!9768 thiss!1504) #b00000000000000000000000000001111) (= (mask!9768 thiss!1504) #b00000000000000000000000000011111) (= (mask!9768 thiss!1504) #b00000000000000000000000000111111) (= (mask!9768 thiss!1504) #b00000000000000000000000001111111) (= (mask!9768 thiss!1504) #b00000000000000000000000011111111) (= (mask!9768 thiss!1504) #b00000000000000000000000111111111) (= (mask!9768 thiss!1504) #b00000000000000000000001111111111) (= (mask!9768 thiss!1504) #b00000000000000000000011111111111) (= (mask!9768 thiss!1504) #b00000000000000000000111111111111) (= (mask!9768 thiss!1504) #b00000000000000000001111111111111) (= (mask!9768 thiss!1504) #b00000000000000000011111111111111) (= (mask!9768 thiss!1504) #b00000000000000000111111111111111) (= (mask!9768 thiss!1504) #b00000000000000001111111111111111) (= (mask!9768 thiss!1504) #b00000000000000011111111111111111) (= (mask!9768 thiss!1504) #b00000000000000111111111111111111) (= (mask!9768 thiss!1504) #b00000000000001111111111111111111) (= (mask!9768 thiss!1504) #b00000000000011111111111111111111) (= (mask!9768 thiss!1504) #b00000000000111111111111111111111) (= (mask!9768 thiss!1504) #b00000000001111111111111111111111) (= (mask!9768 thiss!1504) #b00000000011111111111111111111111) (= (mask!9768 thiss!1504) #b00000000111111111111111111111111) (= (mask!9768 thiss!1504) #b00000001111111111111111111111111) (= (mask!9768 thiss!1504) #b00000011111111111111111111111111) (= (mask!9768 thiss!1504) #b00000111111111111111111111111111) (= (mask!9768 thiss!1504) #b00001111111111111111111111111111) (= (mask!9768 thiss!1504) #b00011111111111111111111111111111) (= (mask!9768 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9768 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215843 d!58485))

(declare-fun d!58487 () Bool)

(declare-fun res!105573 () Bool)

(declare-fun e!140456 () Bool)

(assert (=> d!58487 (=> (not res!105573) (not e!140456))))

(declare-fun simpleValid!220 (LongMapFixedSize!2808) Bool)

(assert (=> d!58487 (= res!105573 (simpleValid!220 thiss!1504))))

(assert (=> d!58487 (= (valid!1142 thiss!1504) e!140456)))

(declare-fun b!215879 () Bool)

(declare-fun res!105574 () Bool)

(assert (=> b!215879 (=> (not res!105574) (not e!140456))))

(declare-fun arrayCountValidKeys!0 (array!10423 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215879 (= res!105574 (= (arrayCountValidKeys!0 (_keys!6093 thiss!1504) #b00000000000000000000000000000000 (size!5268 (_keys!6093 thiss!1504))) (_size!1453 thiss!1504)))))

(declare-fun b!215880 () Bool)

(declare-fun res!105575 () Bool)

(assert (=> b!215880 (=> (not res!105575) (not e!140456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10423 (_ BitVec 32)) Bool)

(assert (=> b!215880 (= res!105575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6093 thiss!1504) (mask!9768 thiss!1504)))))

(declare-fun b!215881 () Bool)

(declare-datatypes ((List!3139 0))(
  ( (Nil!3136) (Cons!3135 (h!3781 (_ BitVec 64)) (t!8094 List!3139)) )
))
(declare-fun arrayNoDuplicates!0 (array!10423 (_ BitVec 32) List!3139) Bool)

(assert (=> b!215881 (= e!140456 (arrayNoDuplicates!0 (_keys!6093 thiss!1504) #b00000000000000000000000000000000 Nil!3136))))

(assert (= (and d!58487 res!105573) b!215879))

(assert (= (and b!215879 res!105574) b!215880))

(assert (= (and b!215880 res!105575) b!215881))

(declare-fun m!242863 () Bool)

(assert (=> d!58487 m!242863))

(declare-fun m!242865 () Bool)

(assert (=> b!215879 m!242865))

(declare-fun m!242867 () Bool)

(assert (=> b!215880 m!242867))

(declare-fun m!242869 () Bool)

(assert (=> b!215881 m!242869))

(assert (=> start!21520 d!58487))

(declare-fun b!215894 () Bool)

(declare-fun c!36256 () Bool)

(declare-fun lt!111052 () (_ BitVec 64))

(assert (=> b!215894 (= c!36256 (= lt!111052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140464 () SeekEntryResult!736)

(declare-fun e!140465 () SeekEntryResult!736)

(assert (=> b!215894 (= e!140464 e!140465)))

(declare-fun b!215895 () Bool)

(declare-fun e!140463 () SeekEntryResult!736)

(assert (=> b!215895 (= e!140463 Undefined!736)))

(declare-fun d!58489 () Bool)

(declare-fun lt!111053 () SeekEntryResult!736)

(assert (=> d!58489 (and (or ((_ is Undefined!736) lt!111053) (not ((_ is Found!736) lt!111053)) (and (bvsge (index!5115 lt!111053) #b00000000000000000000000000000000) (bvslt (index!5115 lt!111053) (size!5268 (_keys!6093 thiss!1504))))) (or ((_ is Undefined!736) lt!111053) ((_ is Found!736) lt!111053) (not ((_ is MissingZero!736) lt!111053)) (and (bvsge (index!5114 lt!111053) #b00000000000000000000000000000000) (bvslt (index!5114 lt!111053) (size!5268 (_keys!6093 thiss!1504))))) (or ((_ is Undefined!736) lt!111053) ((_ is Found!736) lt!111053) ((_ is MissingZero!736) lt!111053) (not ((_ is MissingVacant!736) lt!111053)) (and (bvsge (index!5117 lt!111053) #b00000000000000000000000000000000) (bvslt (index!5117 lt!111053) (size!5268 (_keys!6093 thiss!1504))))) (or ((_ is Undefined!736) lt!111053) (ite ((_ is Found!736) lt!111053) (= (select (arr!4937 (_keys!6093 thiss!1504)) (index!5115 lt!111053)) key!932) (ite ((_ is MissingZero!736) lt!111053) (= (select (arr!4937 (_keys!6093 thiss!1504)) (index!5114 lt!111053)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!736) lt!111053) (= (select (arr!4937 (_keys!6093 thiss!1504)) (index!5117 lt!111053)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58489 (= lt!111053 e!140463)))

(declare-fun c!36257 () Bool)

(declare-fun lt!111054 () SeekEntryResult!736)

(assert (=> d!58489 (= c!36257 (and ((_ is Intermediate!736) lt!111054) (undefined!1548 lt!111054)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10423 (_ BitVec 32)) SeekEntryResult!736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58489 (= lt!111054 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9768 thiss!1504)) key!932 (_keys!6093 thiss!1504) (mask!9768 thiss!1504)))))

(assert (=> d!58489 (validMask!0 (mask!9768 thiss!1504))))

(assert (=> d!58489 (= (seekEntryOrOpen!0 key!932 (_keys!6093 thiss!1504) (mask!9768 thiss!1504)) lt!111053)))

(declare-fun b!215896 () Bool)

(assert (=> b!215896 (= e!140464 (Found!736 (index!5116 lt!111054)))))

(declare-fun b!215897 () Bool)

(assert (=> b!215897 (= e!140463 e!140464)))

(assert (=> b!215897 (= lt!111052 (select (arr!4937 (_keys!6093 thiss!1504)) (index!5116 lt!111054)))))

(declare-fun c!36255 () Bool)

(assert (=> b!215897 (= c!36255 (= lt!111052 key!932))))

(declare-fun b!215898 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10423 (_ BitVec 32)) SeekEntryResult!736)

(assert (=> b!215898 (= e!140465 (seekKeyOrZeroReturnVacant!0 (x!22559 lt!111054) (index!5116 lt!111054) (index!5116 lt!111054) key!932 (_keys!6093 thiss!1504) (mask!9768 thiss!1504)))))

(declare-fun b!215899 () Bool)

(assert (=> b!215899 (= e!140465 (MissingZero!736 (index!5116 lt!111054)))))

(assert (= (and d!58489 c!36257) b!215895))

(assert (= (and d!58489 (not c!36257)) b!215897))

(assert (= (and b!215897 c!36255) b!215896))

(assert (= (and b!215897 (not c!36255)) b!215894))

(assert (= (and b!215894 c!36256) b!215899))

(assert (= (and b!215894 (not c!36256)) b!215898))

(declare-fun m!242871 () Bool)

(assert (=> d!58489 m!242871))

(declare-fun m!242873 () Bool)

(assert (=> d!58489 m!242873))

(declare-fun m!242875 () Bool)

(assert (=> d!58489 m!242875))

(declare-fun m!242877 () Bool)

(assert (=> d!58489 m!242877))

(assert (=> d!58489 m!242843))

(declare-fun m!242879 () Bool)

(assert (=> d!58489 m!242879))

(assert (=> d!58489 m!242873))

(declare-fun m!242881 () Bool)

(assert (=> b!215897 m!242881))

(declare-fun m!242883 () Bool)

(assert (=> b!215898 m!242883))

(assert (=> b!215842 d!58489))

(declare-fun d!58491 () Bool)

(assert (=> d!58491 (= (array_inv!3265 (_keys!6093 thiss!1504)) (bvsge (size!5268 (_keys!6093 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215847 d!58491))

(declare-fun d!58493 () Bool)

(assert (=> d!58493 (= (array_inv!3266 (_values!4037 thiss!1504)) (bvsge (size!5267 (_values!4037 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215847 d!58493))

(declare-fun b!215906 () Bool)

(declare-fun e!140471 () Bool)

(assert (=> b!215906 (= e!140471 tp_is_empty!5595)))

(declare-fun mapNonEmpty!9548 () Bool)

(declare-fun mapRes!9548 () Bool)

(declare-fun tp!20330 () Bool)

(assert (=> mapNonEmpty!9548 (= mapRes!9548 (and tp!20330 e!140471))))

(declare-fun mapRest!9548 () (Array (_ BitVec 32) ValueCell!2454))

(declare-fun mapKey!9548 () (_ BitVec 32))

(declare-fun mapValue!9548 () ValueCell!2454)

(assert (=> mapNonEmpty!9548 (= mapRest!9542 (store mapRest!9548 mapKey!9548 mapValue!9548))))

(declare-fun condMapEmpty!9548 () Bool)

(declare-fun mapDefault!9548 () ValueCell!2454)

(assert (=> mapNonEmpty!9542 (= condMapEmpty!9548 (= mapRest!9542 ((as const (Array (_ BitVec 32) ValueCell!2454)) mapDefault!9548)))))

(declare-fun e!140470 () Bool)

(assert (=> mapNonEmpty!9542 (= tp!20321 (and e!140470 mapRes!9548))))

(declare-fun mapIsEmpty!9548 () Bool)

(assert (=> mapIsEmpty!9548 mapRes!9548))

(declare-fun b!215907 () Bool)

(assert (=> b!215907 (= e!140470 tp_is_empty!5595)))

(assert (= (and mapNonEmpty!9542 condMapEmpty!9548) mapIsEmpty!9548))

(assert (= (and mapNonEmpty!9542 (not condMapEmpty!9548)) mapNonEmpty!9548))

(assert (= (and mapNonEmpty!9548 ((_ is ValueCellFull!2454) mapValue!9548)) b!215906))

(assert (= (and mapNonEmpty!9542 ((_ is ValueCellFull!2454) mapDefault!9548)) b!215907))

(declare-fun m!242885 () Bool)

(assert (=> mapNonEmpty!9548 m!242885))

(check-sat (not b!215880) (not mapNonEmpty!9548) (not d!58487) (not b!215898) (not b!215879) b_and!12623 (not b_next!5733) (not d!58489) tp_is_empty!5595 (not b!215881))
(check-sat b_and!12623 (not b_next!5733))
(get-model)

(declare-fun b!215918 () Bool)

(declare-fun res!105585 () Bool)

(declare-fun e!140474 () Bool)

(assert (=> b!215918 (=> (not res!105585) (not e!140474))))

(declare-fun size!5271 (LongMapFixedSize!2808) (_ BitVec 32))

(assert (=> b!215918 (= res!105585 (= (size!5271 thiss!1504) (bvadd (_size!1453 thiss!1504) (bvsdiv (bvadd (extraKeys!3791 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!215919 () Bool)

(assert (=> b!215919 (= e!140474 (and (bvsge (extraKeys!3791 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3791 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1453 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215917 () Bool)

(declare-fun res!105584 () Bool)

(assert (=> b!215917 (=> (not res!105584) (not e!140474))))

(assert (=> b!215917 (= res!105584 (bvsge (size!5271 thiss!1504) (_size!1453 thiss!1504)))))

(declare-fun d!58495 () Bool)

(declare-fun res!105587 () Bool)

(assert (=> d!58495 (=> (not res!105587) (not e!140474))))

(assert (=> d!58495 (= res!105587 (validMask!0 (mask!9768 thiss!1504)))))

(assert (=> d!58495 (= (simpleValid!220 thiss!1504) e!140474)))

(declare-fun b!215916 () Bool)

(declare-fun res!105586 () Bool)

(assert (=> b!215916 (=> (not res!105586) (not e!140474))))

(assert (=> b!215916 (= res!105586 (and (= (size!5267 (_values!4037 thiss!1504)) (bvadd (mask!9768 thiss!1504) #b00000000000000000000000000000001)) (= (size!5268 (_keys!6093 thiss!1504)) (size!5267 (_values!4037 thiss!1504))) (bvsge (_size!1453 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1453 thiss!1504) (bvadd (mask!9768 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!58495 res!105587) b!215916))

(assert (= (and b!215916 res!105586) b!215917))

(assert (= (and b!215917 res!105584) b!215918))

(assert (= (and b!215918 res!105585) b!215919))

(declare-fun m!242887 () Bool)

(assert (=> b!215918 m!242887))

(assert (=> b!215917 m!242887))

(assert (=> d!58495 m!242843))

(assert (=> d!58487 d!58495))

(declare-fun b!215930 () Bool)

(declare-fun e!140486 () Bool)

(declare-fun contains!1431 (List!3139 (_ BitVec 64)) Bool)

(assert (=> b!215930 (= e!140486 (contains!1431 Nil!3136 (select (arr!4937 (_keys!6093 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215931 () Bool)

(declare-fun e!140483 () Bool)

(declare-fun e!140485 () Bool)

(assert (=> b!215931 (= e!140483 e!140485)))

(declare-fun c!36260 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215931 (= c!36260 (validKeyInArray!0 (select (arr!4937 (_keys!6093 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215932 () Bool)

(declare-fun e!140484 () Bool)

(assert (=> b!215932 (= e!140484 e!140483)))

(declare-fun res!105595 () Bool)

(assert (=> b!215932 (=> (not res!105595) (not e!140483))))

(assert (=> b!215932 (= res!105595 (not e!140486))))

(declare-fun res!105596 () Bool)

(assert (=> b!215932 (=> (not res!105596) (not e!140486))))

(assert (=> b!215932 (= res!105596 (validKeyInArray!0 (select (arr!4937 (_keys!6093 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215933 () Bool)

(declare-fun call!20361 () Bool)

(assert (=> b!215933 (= e!140485 call!20361)))

(declare-fun b!215934 () Bool)

(assert (=> b!215934 (= e!140485 call!20361)))

(declare-fun d!58497 () Bool)

(declare-fun res!105594 () Bool)

(assert (=> d!58497 (=> res!105594 e!140484)))

(assert (=> d!58497 (= res!105594 (bvsge #b00000000000000000000000000000000 (size!5268 (_keys!6093 thiss!1504))))))

(assert (=> d!58497 (= (arrayNoDuplicates!0 (_keys!6093 thiss!1504) #b00000000000000000000000000000000 Nil!3136) e!140484)))

(declare-fun bm!20358 () Bool)

(assert (=> bm!20358 (= call!20361 (arrayNoDuplicates!0 (_keys!6093 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36260 (Cons!3135 (select (arr!4937 (_keys!6093 thiss!1504)) #b00000000000000000000000000000000) Nil!3136) Nil!3136)))))

(assert (= (and d!58497 (not res!105594)) b!215932))

(assert (= (and b!215932 res!105596) b!215930))

(assert (= (and b!215932 res!105595) b!215931))

(assert (= (and b!215931 c!36260) b!215933))

(assert (= (and b!215931 (not c!36260)) b!215934))

(assert (= (or b!215933 b!215934) bm!20358))

(declare-fun m!242889 () Bool)

(assert (=> b!215930 m!242889))

(assert (=> b!215930 m!242889))

(declare-fun m!242891 () Bool)

(assert (=> b!215930 m!242891))

(assert (=> b!215931 m!242889))

(assert (=> b!215931 m!242889))

(declare-fun m!242893 () Bool)

(assert (=> b!215931 m!242893))

(assert (=> b!215932 m!242889))

(assert (=> b!215932 m!242889))

(assert (=> b!215932 m!242893))

(assert (=> bm!20358 m!242889))

(declare-fun m!242895 () Bool)

(assert (=> bm!20358 m!242895))

(assert (=> b!215881 d!58497))

(declare-fun d!58499 () Bool)

(declare-fun e!140499 () Bool)

(assert (=> d!58499 e!140499))

(declare-fun c!36267 () Bool)

(declare-fun lt!111059 () SeekEntryResult!736)

(assert (=> d!58499 (= c!36267 (and ((_ is Intermediate!736) lt!111059) (undefined!1548 lt!111059)))))

(declare-fun e!140497 () SeekEntryResult!736)

(assert (=> d!58499 (= lt!111059 e!140497)))

(declare-fun c!36269 () Bool)

(assert (=> d!58499 (= c!36269 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!111060 () (_ BitVec 64))

(assert (=> d!58499 (= lt!111060 (select (arr!4937 (_keys!6093 thiss!1504)) (toIndex!0 key!932 (mask!9768 thiss!1504))))))

(assert (=> d!58499 (validMask!0 (mask!9768 thiss!1504))))

(assert (=> d!58499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9768 thiss!1504)) key!932 (_keys!6093 thiss!1504) (mask!9768 thiss!1504)) lt!111059)))

(declare-fun b!215953 () Bool)

(declare-fun e!140501 () Bool)

(assert (=> b!215953 (= e!140499 e!140501)))

(declare-fun res!105604 () Bool)

(assert (=> b!215953 (= res!105604 (and ((_ is Intermediate!736) lt!111059) (not (undefined!1548 lt!111059)) (bvslt (x!22559 lt!111059) #b01111111111111111111111111111110) (bvsge (x!22559 lt!111059) #b00000000000000000000000000000000) (bvsge (x!22559 lt!111059) #b00000000000000000000000000000000)))))

(assert (=> b!215953 (=> (not res!105604) (not e!140501))))

(declare-fun b!215954 () Bool)

(declare-fun e!140498 () SeekEntryResult!736)

(assert (=> b!215954 (= e!140498 (Intermediate!736 false (toIndex!0 key!932 (mask!9768 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215955 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215955 (= e!140498 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9768 thiss!1504)) #b00000000000000000000000000000000 (mask!9768 thiss!1504)) key!932 (_keys!6093 thiss!1504) (mask!9768 thiss!1504)))))

(declare-fun b!215956 () Bool)

(assert (=> b!215956 (and (bvsge (index!5116 lt!111059) #b00000000000000000000000000000000) (bvslt (index!5116 lt!111059) (size!5268 (_keys!6093 thiss!1504))))))

(declare-fun e!140500 () Bool)

(assert (=> b!215956 (= e!140500 (= (select (arr!4937 (_keys!6093 thiss!1504)) (index!5116 lt!111059)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!215957 () Bool)

(assert (=> b!215957 (and (bvsge (index!5116 lt!111059) #b00000000000000000000000000000000) (bvslt (index!5116 lt!111059) (size!5268 (_keys!6093 thiss!1504))))))

(declare-fun res!105603 () Bool)

(assert (=> b!215957 (= res!105603 (= (select (arr!4937 (_keys!6093 thiss!1504)) (index!5116 lt!111059)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215957 (=> res!105603 e!140500)))

(declare-fun b!215958 () Bool)

(assert (=> b!215958 (= e!140499 (bvsge (x!22559 lt!111059) #b01111111111111111111111111111110))))

(declare-fun b!215959 () Bool)

(assert (=> b!215959 (= e!140497 (Intermediate!736 true (toIndex!0 key!932 (mask!9768 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215960 () Bool)

(assert (=> b!215960 (= e!140497 e!140498)))

(declare-fun c!36268 () Bool)

(assert (=> b!215960 (= c!36268 (or (= lt!111060 key!932) (= (bvadd lt!111060 lt!111060) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215961 () Bool)

(assert (=> b!215961 (and (bvsge (index!5116 lt!111059) #b00000000000000000000000000000000) (bvslt (index!5116 lt!111059) (size!5268 (_keys!6093 thiss!1504))))))

(declare-fun res!105605 () Bool)

(assert (=> b!215961 (= res!105605 (= (select (arr!4937 (_keys!6093 thiss!1504)) (index!5116 lt!111059)) key!932))))

(assert (=> b!215961 (=> res!105605 e!140500)))

(assert (=> b!215961 (= e!140501 e!140500)))

(assert (= (and d!58499 c!36269) b!215959))

(assert (= (and d!58499 (not c!36269)) b!215960))

(assert (= (and b!215960 c!36268) b!215954))

(assert (= (and b!215960 (not c!36268)) b!215955))

(assert (= (and d!58499 c!36267) b!215958))

(assert (= (and d!58499 (not c!36267)) b!215953))

(assert (= (and b!215953 res!105604) b!215961))

(assert (= (and b!215961 (not res!105605)) b!215957))

(assert (= (and b!215957 (not res!105603)) b!215956))

(declare-fun m!242897 () Bool)

(assert (=> b!215956 m!242897))

(assert (=> b!215955 m!242873))

(declare-fun m!242899 () Bool)

(assert (=> b!215955 m!242899))

(assert (=> b!215955 m!242899))

(declare-fun m!242901 () Bool)

(assert (=> b!215955 m!242901))

(assert (=> b!215957 m!242897))

(assert (=> b!215961 m!242897))

(assert (=> d!58499 m!242873))

(declare-fun m!242903 () Bool)

(assert (=> d!58499 m!242903))

(assert (=> d!58499 m!242843))

(assert (=> d!58489 d!58499))

(declare-fun d!58501 () Bool)

(declare-fun lt!111066 () (_ BitVec 32))

(declare-fun lt!111065 () (_ BitVec 32))

(assert (=> d!58501 (= lt!111066 (bvmul (bvxor lt!111065 (bvlshr lt!111065 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58501 (= lt!111065 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58501 (and (bvsge (mask!9768 thiss!1504) #b00000000000000000000000000000000) (let ((res!105606 (let ((h!3782 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22575 (bvmul (bvxor h!3782 (bvlshr h!3782 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22575 (bvlshr x!22575 #b00000000000000000000000000001101)) (mask!9768 thiss!1504)))))) (and (bvslt res!105606 (bvadd (mask!9768 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105606 #b00000000000000000000000000000000))))))

(assert (=> d!58501 (= (toIndex!0 key!932 (mask!9768 thiss!1504)) (bvand (bvxor lt!111066 (bvlshr lt!111066 #b00000000000000000000000000001101)) (mask!9768 thiss!1504)))))

(assert (=> d!58489 d!58501))

(assert (=> d!58489 d!58485))

(declare-fun bm!20361 () Bool)

(declare-fun call!20364 () Bool)

(assert (=> bm!20361 (= call!20364 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6093 thiss!1504) (mask!9768 thiss!1504)))))

(declare-fun b!215971 () Bool)

(declare-fun e!140508 () Bool)

(declare-fun e!140509 () Bool)

(assert (=> b!215971 (= e!140508 e!140509)))

(declare-fun lt!111075 () (_ BitVec 64))

(assert (=> b!215971 (= lt!111075 (select (arr!4937 (_keys!6093 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6500 0))(
  ( (Unit!6501) )
))
(declare-fun lt!111074 () Unit!6500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10423 (_ BitVec 64) (_ BitVec 32)) Unit!6500)

(assert (=> b!215971 (= lt!111074 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6093 thiss!1504) lt!111075 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215971 (arrayContainsKey!0 (_keys!6093 thiss!1504) lt!111075 #b00000000000000000000000000000000)))

(declare-fun lt!111073 () Unit!6500)

(assert (=> b!215971 (= lt!111073 lt!111074)))

(declare-fun res!105612 () Bool)

(assert (=> b!215971 (= res!105612 (= (seekEntryOrOpen!0 (select (arr!4937 (_keys!6093 thiss!1504)) #b00000000000000000000000000000000) (_keys!6093 thiss!1504) (mask!9768 thiss!1504)) (Found!736 #b00000000000000000000000000000000)))))

(assert (=> b!215971 (=> (not res!105612) (not e!140509))))

(declare-fun b!215972 () Bool)

(declare-fun e!140510 () Bool)

(assert (=> b!215972 (= e!140510 e!140508)))

(declare-fun c!36272 () Bool)

(assert (=> b!215972 (= c!36272 (validKeyInArray!0 (select (arr!4937 (_keys!6093 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215973 () Bool)

(assert (=> b!215973 (= e!140508 call!20364)))

(declare-fun b!215970 () Bool)

(assert (=> b!215970 (= e!140509 call!20364)))

(declare-fun d!58503 () Bool)

(declare-fun res!105611 () Bool)

(assert (=> d!58503 (=> res!105611 e!140510)))

(assert (=> d!58503 (= res!105611 (bvsge #b00000000000000000000000000000000 (size!5268 (_keys!6093 thiss!1504))))))

(assert (=> d!58503 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6093 thiss!1504) (mask!9768 thiss!1504)) e!140510)))

(assert (= (and d!58503 (not res!105611)) b!215972))

(assert (= (and b!215972 c!36272) b!215971))

(assert (= (and b!215972 (not c!36272)) b!215973))

(assert (= (and b!215971 res!105612) b!215970))

(assert (= (or b!215970 b!215973) bm!20361))

(declare-fun m!242905 () Bool)

(assert (=> bm!20361 m!242905))

(assert (=> b!215971 m!242889))

(declare-fun m!242907 () Bool)

(assert (=> b!215971 m!242907))

(declare-fun m!242909 () Bool)

(assert (=> b!215971 m!242909))

(assert (=> b!215971 m!242889))

(declare-fun m!242911 () Bool)

(assert (=> b!215971 m!242911))

(assert (=> b!215972 m!242889))

(assert (=> b!215972 m!242889))

(assert (=> b!215972 m!242893))

(assert (=> b!215880 d!58503))

(declare-fun b!215982 () Bool)

(declare-fun e!140516 () (_ BitVec 32))

(assert (=> b!215982 (= e!140516 #b00000000000000000000000000000000)))

(declare-fun b!215983 () Bool)

(declare-fun e!140515 () (_ BitVec 32))

(assert (=> b!215983 (= e!140516 e!140515)))

(declare-fun c!36277 () Bool)

(assert (=> b!215983 (= c!36277 (validKeyInArray!0 (select (arr!4937 (_keys!6093 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215984 () Bool)

(declare-fun call!20367 () (_ BitVec 32))

(assert (=> b!215984 (= e!140515 (bvadd #b00000000000000000000000000000001 call!20367))))

(declare-fun bm!20364 () Bool)

(assert (=> bm!20364 (= call!20367 (arrayCountValidKeys!0 (_keys!6093 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5268 (_keys!6093 thiss!1504))))))

(declare-fun d!58505 () Bool)

(declare-fun lt!111078 () (_ BitVec 32))

(assert (=> d!58505 (and (bvsge lt!111078 #b00000000000000000000000000000000) (bvsle lt!111078 (bvsub (size!5268 (_keys!6093 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58505 (= lt!111078 e!140516)))

(declare-fun c!36278 () Bool)

(assert (=> d!58505 (= c!36278 (bvsge #b00000000000000000000000000000000 (size!5268 (_keys!6093 thiss!1504))))))

(assert (=> d!58505 (and (bvsle #b00000000000000000000000000000000 (size!5268 (_keys!6093 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5268 (_keys!6093 thiss!1504)) (size!5268 (_keys!6093 thiss!1504))))))

(assert (=> d!58505 (= (arrayCountValidKeys!0 (_keys!6093 thiss!1504) #b00000000000000000000000000000000 (size!5268 (_keys!6093 thiss!1504))) lt!111078)))

(declare-fun b!215985 () Bool)

(assert (=> b!215985 (= e!140515 call!20367)))

(assert (= (and d!58505 c!36278) b!215982))

(assert (= (and d!58505 (not c!36278)) b!215983))

(assert (= (and b!215983 c!36277) b!215984))

(assert (= (and b!215983 (not c!36277)) b!215985))

(assert (= (or b!215984 b!215985) bm!20364))

(assert (=> b!215983 m!242889))

(assert (=> b!215983 m!242889))

(assert (=> b!215983 m!242893))

(declare-fun m!242913 () Bool)

(assert (=> bm!20364 m!242913))

(assert (=> b!215879 d!58505))

(declare-fun b!215998 () Bool)

(declare-fun c!36287 () Bool)

(declare-fun lt!111084 () (_ BitVec 64))

(assert (=> b!215998 (= c!36287 (= lt!111084 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140525 () SeekEntryResult!736)

(declare-fun e!140524 () SeekEntryResult!736)

(assert (=> b!215998 (= e!140525 e!140524)))

(declare-fun b!216000 () Bool)

(assert (=> b!216000 (= e!140524 (MissingVacant!736 (index!5116 lt!111054)))))

(declare-fun b!216001 () Bool)

(declare-fun e!140523 () SeekEntryResult!736)

(assert (=> b!216001 (= e!140523 e!140525)))

(declare-fun c!36286 () Bool)

(assert (=> b!216001 (= c!36286 (= lt!111084 key!932))))

(declare-fun lt!111083 () SeekEntryResult!736)

(declare-fun d!58507 () Bool)

(assert (=> d!58507 (and (or ((_ is Undefined!736) lt!111083) (not ((_ is Found!736) lt!111083)) (and (bvsge (index!5115 lt!111083) #b00000000000000000000000000000000) (bvslt (index!5115 lt!111083) (size!5268 (_keys!6093 thiss!1504))))) (or ((_ is Undefined!736) lt!111083) ((_ is Found!736) lt!111083) (not ((_ is MissingVacant!736) lt!111083)) (not (= (index!5117 lt!111083) (index!5116 lt!111054))) (and (bvsge (index!5117 lt!111083) #b00000000000000000000000000000000) (bvslt (index!5117 lt!111083) (size!5268 (_keys!6093 thiss!1504))))) (or ((_ is Undefined!736) lt!111083) (ite ((_ is Found!736) lt!111083) (= (select (arr!4937 (_keys!6093 thiss!1504)) (index!5115 lt!111083)) key!932) (and ((_ is MissingVacant!736) lt!111083) (= (index!5117 lt!111083) (index!5116 lt!111054)) (= (select (arr!4937 (_keys!6093 thiss!1504)) (index!5117 lt!111083)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58507 (= lt!111083 e!140523)))

(declare-fun c!36285 () Bool)

(assert (=> d!58507 (= c!36285 (bvsge (x!22559 lt!111054) #b01111111111111111111111111111110))))

(assert (=> d!58507 (= lt!111084 (select (arr!4937 (_keys!6093 thiss!1504)) (index!5116 lt!111054)))))

(assert (=> d!58507 (validMask!0 (mask!9768 thiss!1504))))

(assert (=> d!58507 (= (seekKeyOrZeroReturnVacant!0 (x!22559 lt!111054) (index!5116 lt!111054) (index!5116 lt!111054) key!932 (_keys!6093 thiss!1504) (mask!9768 thiss!1504)) lt!111083)))

(declare-fun b!215999 () Bool)

(assert (=> b!215999 (= e!140525 (Found!736 (index!5116 lt!111054)))))

(declare-fun b!216002 () Bool)

(assert (=> b!216002 (= e!140523 Undefined!736)))

(declare-fun b!216003 () Bool)

(assert (=> b!216003 (= e!140524 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22559 lt!111054) #b00000000000000000000000000000001) (nextIndex!0 (index!5116 lt!111054) (x!22559 lt!111054) (mask!9768 thiss!1504)) (index!5116 lt!111054) key!932 (_keys!6093 thiss!1504) (mask!9768 thiss!1504)))))

(assert (= (and d!58507 c!36285) b!216002))

(assert (= (and d!58507 (not c!36285)) b!216001))

(assert (= (and b!216001 c!36286) b!215999))

(assert (= (and b!216001 (not c!36286)) b!215998))

(assert (= (and b!215998 c!36287) b!216000))

(assert (= (and b!215998 (not c!36287)) b!216003))

(declare-fun m!242915 () Bool)

(assert (=> d!58507 m!242915))

(declare-fun m!242917 () Bool)

(assert (=> d!58507 m!242917))

(assert (=> d!58507 m!242881))

(assert (=> d!58507 m!242843))

(declare-fun m!242919 () Bool)

(assert (=> b!216003 m!242919))

(assert (=> b!216003 m!242919))

(declare-fun m!242921 () Bool)

(assert (=> b!216003 m!242921))

(assert (=> b!215898 d!58507))

(declare-fun b!216004 () Bool)

(declare-fun e!140527 () Bool)

(assert (=> b!216004 (= e!140527 tp_is_empty!5595)))

(declare-fun mapNonEmpty!9549 () Bool)

(declare-fun mapRes!9549 () Bool)

(declare-fun tp!20331 () Bool)

(assert (=> mapNonEmpty!9549 (= mapRes!9549 (and tp!20331 e!140527))))

(declare-fun mapKey!9549 () (_ BitVec 32))

(declare-fun mapRest!9549 () (Array (_ BitVec 32) ValueCell!2454))

(declare-fun mapValue!9549 () ValueCell!2454)

(assert (=> mapNonEmpty!9549 (= mapRest!9548 (store mapRest!9549 mapKey!9549 mapValue!9549))))

(declare-fun condMapEmpty!9549 () Bool)

(declare-fun mapDefault!9549 () ValueCell!2454)

(assert (=> mapNonEmpty!9548 (= condMapEmpty!9549 (= mapRest!9548 ((as const (Array (_ BitVec 32) ValueCell!2454)) mapDefault!9549)))))

(declare-fun e!140526 () Bool)

(assert (=> mapNonEmpty!9548 (= tp!20330 (and e!140526 mapRes!9549))))

(declare-fun mapIsEmpty!9549 () Bool)

(assert (=> mapIsEmpty!9549 mapRes!9549))

(declare-fun b!216005 () Bool)

(assert (=> b!216005 (= e!140526 tp_is_empty!5595)))

(assert (= (and mapNonEmpty!9548 condMapEmpty!9549) mapIsEmpty!9549))

(assert (= (and mapNonEmpty!9548 (not condMapEmpty!9549)) mapNonEmpty!9549))

(assert (= (and mapNonEmpty!9549 ((_ is ValueCellFull!2454) mapValue!9549)) b!216004))

(assert (= (and mapNonEmpty!9548 ((_ is ValueCellFull!2454) mapDefault!9549)) b!216005))

(declare-fun m!242923 () Bool)

(assert (=> mapNonEmpty!9549 m!242923))

(check-sat (not b!215917) (not b!215931) (not bm!20364) (not b!215972) (not bm!20358) b_and!12623 (not b_next!5733) (not mapNonEmpty!9549) (not b!215930) (not b!215955) (not b!215983) (not d!58495) (not b!215918) (not b!215971) (not d!58499) (not b!215932) (not bm!20361) (not b!216003) tp_is_empty!5595 (not d!58507))
(check-sat b_and!12623 (not b_next!5733))
