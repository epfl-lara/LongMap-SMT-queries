; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21522 () Bool)

(assert start!21522)

(declare-fun b!215867 () Bool)

(declare-fun b_free!5731 () Bool)

(declare-fun b_next!5731 () Bool)

(assert (=> b!215867 (= b_free!5731 (not b_next!5731))))

(declare-fun tp!20315 () Bool)

(declare-fun b_and!12635 () Bool)

(assert (=> b!215867 (= tp!20315 b_and!12635)))

(declare-fun res!105561 () Bool)

(declare-fun e!140430 () Bool)

(assert (=> start!21522 (=> (not res!105561) (not e!140430))))

(declare-datatypes ((V!7105 0))(
  ( (V!7106 (val!2841 Int)) )
))
(declare-datatypes ((ValueCell!2453 0))(
  ( (ValueCellFull!2453 (v!4860 V!7105)) (EmptyCell!2453) )
))
(declare-datatypes ((array!10415 0))(
  ( (array!10416 (arr!4933 (Array (_ BitVec 32) ValueCell!2453)) (size!5264 (_ BitVec 32))) )
))
(declare-datatypes ((array!10417 0))(
  ( (array!10418 (arr!4934 (Array (_ BitVec 32) (_ BitVec 64))) (size!5265 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2806 0))(
  ( (LongMapFixedSize!2807 (defaultEntry!4053 Int) (mask!9767 (_ BitVec 32)) (extraKeys!3790 (_ BitVec 32)) (zeroValue!3894 V!7105) (minValue!3894 V!7105) (_size!1452 (_ BitVec 32)) (_keys!6092 array!10417) (_values!4036 array!10415) (_vacant!1452 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2806)

(declare-fun valid!1163 (LongMapFixedSize!2806) Bool)

(assert (=> start!21522 (= res!105561 (valid!1163 thiss!1504))))

(assert (=> start!21522 e!140430))

(declare-fun e!140432 () Bool)

(assert (=> start!21522 e!140432))

(assert (=> start!21522 true))

(declare-fun b!215864 () Bool)

(declare-fun res!105562 () Bool)

(declare-fun e!140434 () Bool)

(assert (=> b!215864 (=> (not res!105562) (not e!140434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215864 (= res!105562 (validMask!0 (mask!9767 thiss!1504)))))

(declare-fun b!215865 () Bool)

(declare-fun res!105563 () Bool)

(assert (=> b!215865 (=> (not res!105563) (not e!140430))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215865 (= res!105563 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!215866 () Bool)

(declare-fun e!140431 () Bool)

(declare-fun tp_is_empty!5593 () Bool)

(assert (=> b!215866 (= e!140431 tp_is_empty!5593)))

(declare-fun mapNonEmpty!9539 () Bool)

(declare-fun mapRes!9539 () Bool)

(declare-fun tp!20314 () Bool)

(declare-fun e!140435 () Bool)

(assert (=> mapNonEmpty!9539 (= mapRes!9539 (and tp!20314 e!140435))))

(declare-fun mapRest!9539 () (Array (_ BitVec 32) ValueCell!2453))

(declare-fun mapValue!9539 () ValueCell!2453)

(declare-fun mapKey!9539 () (_ BitVec 32))

(assert (=> mapNonEmpty!9539 (= (arr!4933 (_values!4036 thiss!1504)) (store mapRest!9539 mapKey!9539 mapValue!9539))))

(declare-fun mapIsEmpty!9539 () Bool)

(assert (=> mapIsEmpty!9539 mapRes!9539))

(declare-fun e!140433 () Bool)

(declare-fun array_inv!3241 (array!10417) Bool)

(declare-fun array_inv!3242 (array!10415) Bool)

(assert (=> b!215867 (= e!140432 (and tp!20315 tp_is_empty!5593 (array_inv!3241 (_keys!6092 thiss!1504)) (array_inv!3242 (_values!4036 thiss!1504)) e!140433))))

(declare-fun b!215868 () Bool)

(assert (=> b!215868 (= e!140433 (and e!140431 mapRes!9539))))

(declare-fun condMapEmpty!9539 () Bool)

(declare-fun mapDefault!9539 () ValueCell!2453)

(assert (=> b!215868 (= condMapEmpty!9539 (= (arr!4933 (_values!4036 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2453)) mapDefault!9539)))))

(declare-fun b!215869 () Bool)

(assert (=> b!215869 (= e!140430 e!140434)))

(declare-fun res!105560 () Bool)

(assert (=> b!215869 (=> (not res!105560) (not e!140434))))

(declare-datatypes ((SeekEntryResult!724 0))(
  ( (MissingZero!724 (index!5066 (_ BitVec 32))) (Found!724 (index!5067 (_ BitVec 32))) (Intermediate!724 (undefined!1536 Bool) (index!5068 (_ BitVec 32)) (x!22547 (_ BitVec 32))) (Undefined!724) (MissingVacant!724 (index!5069 (_ BitVec 32))) )
))
(declare-fun lt!111098 () SeekEntryResult!724)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215869 (= res!105560 (or (= lt!111098 (MissingZero!724 index!297)) (= lt!111098 (MissingVacant!724 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10417 (_ BitVec 32)) SeekEntryResult!724)

(assert (=> b!215869 (= lt!111098 (seekEntryOrOpen!0 key!932 (_keys!6092 thiss!1504) (mask!9767 thiss!1504)))))

(declare-fun b!215870 () Bool)

(assert (=> b!215870 (= e!140435 tp_is_empty!5593)))

(declare-fun b!215871 () Bool)

(assert (=> b!215871 (= e!140434 (and (= (size!5264 (_values!4036 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9767 thiss!1504))) (= (size!5265 (_keys!6092 thiss!1504)) (size!5264 (_values!4036 thiss!1504))) (bvsge (mask!9767 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3790 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3790 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!21522 res!105561) b!215865))

(assert (= (and b!215865 res!105563) b!215869))

(assert (= (and b!215869 res!105560) b!215864))

(assert (= (and b!215864 res!105562) b!215871))

(assert (= (and b!215868 condMapEmpty!9539) mapIsEmpty!9539))

(assert (= (and b!215868 (not condMapEmpty!9539)) mapNonEmpty!9539))

(get-info :version)

(assert (= (and mapNonEmpty!9539 ((_ is ValueCellFull!2453) mapValue!9539)) b!215870))

(assert (= (and b!215868 ((_ is ValueCellFull!2453) mapDefault!9539)) b!215866))

(assert (= b!215867 b!215868))

(assert (= start!21522 b!215867))

(declare-fun m!243009 () Bool)

(assert (=> b!215867 m!243009))

(declare-fun m!243011 () Bool)

(assert (=> b!215867 m!243011))

(declare-fun m!243013 () Bool)

(assert (=> b!215864 m!243013))

(declare-fun m!243015 () Bool)

(assert (=> b!215869 m!243015))

(declare-fun m!243017 () Bool)

(assert (=> start!21522 m!243017))

(declare-fun m!243019 () Bool)

(assert (=> mapNonEmpty!9539 m!243019))

(check-sat (not b!215869) tp_is_empty!5593 b_and!12635 (not b!215867) (not b!215864) (not b_next!5731) (not mapNonEmpty!9539) (not start!21522))
(check-sat b_and!12635 (not b_next!5731))
(get-model)

(declare-fun d!58559 () Bool)

(declare-fun res!105594 () Bool)

(declare-fun e!140480 () Bool)

(assert (=> d!58559 (=> (not res!105594) (not e!140480))))

(declare-fun simpleValid!220 (LongMapFixedSize!2806) Bool)

(assert (=> d!58559 (= res!105594 (simpleValid!220 thiss!1504))))

(assert (=> d!58559 (= (valid!1163 thiss!1504) e!140480)))

(declare-fun b!215926 () Bool)

(declare-fun res!105595 () Bool)

(assert (=> b!215926 (=> (not res!105595) (not e!140480))))

(declare-fun arrayCountValidKeys!0 (array!10417 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215926 (= res!105595 (= (arrayCountValidKeys!0 (_keys!6092 thiss!1504) #b00000000000000000000000000000000 (size!5265 (_keys!6092 thiss!1504))) (_size!1452 thiss!1504)))))

(declare-fun b!215927 () Bool)

(declare-fun res!105596 () Bool)

(assert (=> b!215927 (=> (not res!105596) (not e!140480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10417 (_ BitVec 32)) Bool)

(assert (=> b!215927 (= res!105596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6092 thiss!1504) (mask!9767 thiss!1504)))))

(declare-fun b!215928 () Bool)

(declare-datatypes ((List!3074 0))(
  ( (Nil!3071) (Cons!3070 (h!3716 (_ BitVec 64)) (t!8021 List!3074)) )
))
(declare-fun arrayNoDuplicates!0 (array!10417 (_ BitVec 32) List!3074) Bool)

(assert (=> b!215928 (= e!140480 (arrayNoDuplicates!0 (_keys!6092 thiss!1504) #b00000000000000000000000000000000 Nil!3071))))

(assert (= (and d!58559 res!105594) b!215926))

(assert (= (and b!215926 res!105595) b!215927))

(assert (= (and b!215927 res!105596) b!215928))

(declare-fun m!243045 () Bool)

(assert (=> d!58559 m!243045))

(declare-fun m!243047 () Bool)

(assert (=> b!215926 m!243047))

(declare-fun m!243049 () Bool)

(assert (=> b!215927 m!243049))

(declare-fun m!243051 () Bool)

(assert (=> b!215928 m!243051))

(assert (=> start!21522 d!58559))

(declare-fun d!58561 () Bool)

(assert (=> d!58561 (= (array_inv!3241 (_keys!6092 thiss!1504)) (bvsge (size!5265 (_keys!6092 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215867 d!58561))

(declare-fun d!58563 () Bool)

(assert (=> d!58563 (= (array_inv!3242 (_values!4036 thiss!1504)) (bvsge (size!5264 (_values!4036 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215867 d!58563))

(declare-fun d!58565 () Bool)

(assert (=> d!58565 (= (validMask!0 (mask!9767 thiss!1504)) (and (or (= (mask!9767 thiss!1504) #b00000000000000000000000000000111) (= (mask!9767 thiss!1504) #b00000000000000000000000000001111) (= (mask!9767 thiss!1504) #b00000000000000000000000000011111) (= (mask!9767 thiss!1504) #b00000000000000000000000000111111) (= (mask!9767 thiss!1504) #b00000000000000000000000001111111) (= (mask!9767 thiss!1504) #b00000000000000000000000011111111) (= (mask!9767 thiss!1504) #b00000000000000000000000111111111) (= (mask!9767 thiss!1504) #b00000000000000000000001111111111) (= (mask!9767 thiss!1504) #b00000000000000000000011111111111) (= (mask!9767 thiss!1504) #b00000000000000000000111111111111) (= (mask!9767 thiss!1504) #b00000000000000000001111111111111) (= (mask!9767 thiss!1504) #b00000000000000000011111111111111) (= (mask!9767 thiss!1504) #b00000000000000000111111111111111) (= (mask!9767 thiss!1504) #b00000000000000001111111111111111) (= (mask!9767 thiss!1504) #b00000000000000011111111111111111) (= (mask!9767 thiss!1504) #b00000000000000111111111111111111) (= (mask!9767 thiss!1504) #b00000000000001111111111111111111) (= (mask!9767 thiss!1504) #b00000000000011111111111111111111) (= (mask!9767 thiss!1504) #b00000000000111111111111111111111) (= (mask!9767 thiss!1504) #b00000000001111111111111111111111) (= (mask!9767 thiss!1504) #b00000000011111111111111111111111) (= (mask!9767 thiss!1504) #b00000000111111111111111111111111) (= (mask!9767 thiss!1504) #b00000001111111111111111111111111) (= (mask!9767 thiss!1504) #b00000011111111111111111111111111) (= (mask!9767 thiss!1504) #b00000111111111111111111111111111) (= (mask!9767 thiss!1504) #b00001111111111111111111111111111) (= (mask!9767 thiss!1504) #b00011111111111111111111111111111) (= (mask!9767 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9767 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215864 d!58565))

(declare-fun b!215941 () Bool)

(declare-fun e!140489 () SeekEntryResult!724)

(declare-fun lt!111112 () SeekEntryResult!724)

(assert (=> b!215941 (= e!140489 (MissingZero!724 (index!5068 lt!111112)))))

(declare-fun d!58567 () Bool)

(declare-fun lt!111111 () SeekEntryResult!724)

(assert (=> d!58567 (and (or ((_ is Undefined!724) lt!111111) (not ((_ is Found!724) lt!111111)) (and (bvsge (index!5067 lt!111111) #b00000000000000000000000000000000) (bvslt (index!5067 lt!111111) (size!5265 (_keys!6092 thiss!1504))))) (or ((_ is Undefined!724) lt!111111) ((_ is Found!724) lt!111111) (not ((_ is MissingZero!724) lt!111111)) (and (bvsge (index!5066 lt!111111) #b00000000000000000000000000000000) (bvslt (index!5066 lt!111111) (size!5265 (_keys!6092 thiss!1504))))) (or ((_ is Undefined!724) lt!111111) ((_ is Found!724) lt!111111) ((_ is MissingZero!724) lt!111111) (not ((_ is MissingVacant!724) lt!111111)) (and (bvsge (index!5069 lt!111111) #b00000000000000000000000000000000) (bvslt (index!5069 lt!111111) (size!5265 (_keys!6092 thiss!1504))))) (or ((_ is Undefined!724) lt!111111) (ite ((_ is Found!724) lt!111111) (= (select (arr!4934 (_keys!6092 thiss!1504)) (index!5067 lt!111111)) key!932) (ite ((_ is MissingZero!724) lt!111111) (= (select (arr!4934 (_keys!6092 thiss!1504)) (index!5066 lt!111111)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!724) lt!111111) (= (select (arr!4934 (_keys!6092 thiss!1504)) (index!5069 lt!111111)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140488 () SeekEntryResult!724)

(assert (=> d!58567 (= lt!111111 e!140488)))

(declare-fun c!36270 () Bool)

(assert (=> d!58567 (= c!36270 (and ((_ is Intermediate!724) lt!111112) (undefined!1536 lt!111112)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10417 (_ BitVec 32)) SeekEntryResult!724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58567 (= lt!111112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9767 thiss!1504)) key!932 (_keys!6092 thiss!1504) (mask!9767 thiss!1504)))))

(assert (=> d!58567 (validMask!0 (mask!9767 thiss!1504))))

(assert (=> d!58567 (= (seekEntryOrOpen!0 key!932 (_keys!6092 thiss!1504) (mask!9767 thiss!1504)) lt!111111)))

(declare-fun b!215942 () Bool)

(assert (=> b!215942 (= e!140488 Undefined!724)))

(declare-fun b!215943 () Bool)

(declare-fun e!140487 () SeekEntryResult!724)

(assert (=> b!215943 (= e!140487 (Found!724 (index!5068 lt!111112)))))

(declare-fun b!215944 () Bool)

(assert (=> b!215944 (= e!140488 e!140487)))

(declare-fun lt!111113 () (_ BitVec 64))

(assert (=> b!215944 (= lt!111113 (select (arr!4934 (_keys!6092 thiss!1504)) (index!5068 lt!111112)))))

(declare-fun c!36268 () Bool)

(assert (=> b!215944 (= c!36268 (= lt!111113 key!932))))

(declare-fun b!215945 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10417 (_ BitVec 32)) SeekEntryResult!724)

(assert (=> b!215945 (= e!140489 (seekKeyOrZeroReturnVacant!0 (x!22547 lt!111112) (index!5068 lt!111112) (index!5068 lt!111112) key!932 (_keys!6092 thiss!1504) (mask!9767 thiss!1504)))))

(declare-fun b!215946 () Bool)

(declare-fun c!36269 () Bool)

(assert (=> b!215946 (= c!36269 (= lt!111113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215946 (= e!140487 e!140489)))

(assert (= (and d!58567 c!36270) b!215942))

(assert (= (and d!58567 (not c!36270)) b!215944))

(assert (= (and b!215944 c!36268) b!215943))

(assert (= (and b!215944 (not c!36268)) b!215946))

(assert (= (and b!215946 c!36269) b!215941))

(assert (= (and b!215946 (not c!36269)) b!215945))

(assert (=> d!58567 m!243013))

(declare-fun m!243053 () Bool)

(assert (=> d!58567 m!243053))

(declare-fun m!243055 () Bool)

(assert (=> d!58567 m!243055))

(declare-fun m!243057 () Bool)

(assert (=> d!58567 m!243057))

(declare-fun m!243059 () Bool)

(assert (=> d!58567 m!243059))

(assert (=> d!58567 m!243055))

(declare-fun m!243061 () Bool)

(assert (=> d!58567 m!243061))

(declare-fun m!243063 () Bool)

(assert (=> b!215944 m!243063))

(declare-fun m!243065 () Bool)

(assert (=> b!215945 m!243065))

(assert (=> b!215869 d!58567))

(declare-fun b!215953 () Bool)

(declare-fun e!140495 () Bool)

(assert (=> b!215953 (= e!140495 tp_is_empty!5593)))

(declare-fun mapNonEmpty!9548 () Bool)

(declare-fun mapRes!9548 () Bool)

(declare-fun tp!20330 () Bool)

(assert (=> mapNonEmpty!9548 (= mapRes!9548 (and tp!20330 e!140495))))

(declare-fun mapValue!9548 () ValueCell!2453)

(declare-fun mapRest!9548 () (Array (_ BitVec 32) ValueCell!2453))

(declare-fun mapKey!9548 () (_ BitVec 32))

(assert (=> mapNonEmpty!9548 (= mapRest!9539 (store mapRest!9548 mapKey!9548 mapValue!9548))))

(declare-fun condMapEmpty!9548 () Bool)

(declare-fun mapDefault!9548 () ValueCell!2453)

(assert (=> mapNonEmpty!9539 (= condMapEmpty!9548 (= mapRest!9539 ((as const (Array (_ BitVec 32) ValueCell!2453)) mapDefault!9548)))))

(declare-fun e!140494 () Bool)

(assert (=> mapNonEmpty!9539 (= tp!20314 (and e!140494 mapRes!9548))))

(declare-fun mapIsEmpty!9548 () Bool)

(assert (=> mapIsEmpty!9548 mapRes!9548))

(declare-fun b!215954 () Bool)

(assert (=> b!215954 (= e!140494 tp_is_empty!5593)))

(assert (= (and mapNonEmpty!9539 condMapEmpty!9548) mapIsEmpty!9548))

(assert (= (and mapNonEmpty!9539 (not condMapEmpty!9548)) mapNonEmpty!9548))

(assert (= (and mapNonEmpty!9548 ((_ is ValueCellFull!2453) mapValue!9548)) b!215953))

(assert (= (and mapNonEmpty!9539 ((_ is ValueCellFull!2453) mapDefault!9548)) b!215954))

(declare-fun m!243067 () Bool)

(assert (=> mapNonEmpty!9548 m!243067))

(check-sat (not b!215927) (not b!215945) tp_is_empty!5593 (not b_next!5731) (not b!215928) (not d!58559) (not d!58567) (not mapNonEmpty!9548) (not b!215926) b_and!12635)
(check-sat b_and!12635 (not b_next!5731))
(get-model)

(declare-fun b!215966 () Bool)

(declare-fun e!140498 () Bool)

(assert (=> b!215966 (= e!140498 (and (bvsge (extraKeys!3790 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3790 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1452 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215964 () Bool)

(declare-fun res!105607 () Bool)

(assert (=> b!215964 (=> (not res!105607) (not e!140498))))

(declare-fun size!5270 (LongMapFixedSize!2806) (_ BitVec 32))

(assert (=> b!215964 (= res!105607 (bvsge (size!5270 thiss!1504) (_size!1452 thiss!1504)))))

(declare-fun d!58569 () Bool)

(declare-fun res!105605 () Bool)

(assert (=> d!58569 (=> (not res!105605) (not e!140498))))

(assert (=> d!58569 (= res!105605 (validMask!0 (mask!9767 thiss!1504)))))

(assert (=> d!58569 (= (simpleValid!220 thiss!1504) e!140498)))

(declare-fun b!215963 () Bool)

(declare-fun res!105608 () Bool)

(assert (=> b!215963 (=> (not res!105608) (not e!140498))))

(assert (=> b!215963 (= res!105608 (and (= (size!5264 (_values!4036 thiss!1504)) (bvadd (mask!9767 thiss!1504) #b00000000000000000000000000000001)) (= (size!5265 (_keys!6092 thiss!1504)) (size!5264 (_values!4036 thiss!1504))) (bvsge (_size!1452 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1452 thiss!1504) (bvadd (mask!9767 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!215965 () Bool)

(declare-fun res!105606 () Bool)

(assert (=> b!215965 (=> (not res!105606) (not e!140498))))

(assert (=> b!215965 (= res!105606 (= (size!5270 thiss!1504) (bvadd (_size!1452 thiss!1504) (bvsdiv (bvadd (extraKeys!3790 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!58569 res!105605) b!215963))

(assert (= (and b!215963 res!105608) b!215964))

(assert (= (and b!215964 res!105607) b!215965))

(assert (= (and b!215965 res!105606) b!215966))

(declare-fun m!243069 () Bool)

(assert (=> b!215964 m!243069))

(assert (=> d!58569 m!243013))

(assert (=> b!215965 m!243069))

(assert (=> d!58559 d!58569))

(declare-fun b!215975 () Bool)

(declare-fun e!140503 () (_ BitVec 32))

(declare-fun e!140504 () (_ BitVec 32))

(assert (=> b!215975 (= e!140503 e!140504)))

(declare-fun c!36275 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215975 (= c!36275 (validKeyInArray!0 (select (arr!4934 (_keys!6092 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58571 () Bool)

(declare-fun lt!111116 () (_ BitVec 32))

(assert (=> d!58571 (and (bvsge lt!111116 #b00000000000000000000000000000000) (bvsle lt!111116 (bvsub (size!5265 (_keys!6092 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58571 (= lt!111116 e!140503)))

(declare-fun c!36276 () Bool)

(assert (=> d!58571 (= c!36276 (bvsge #b00000000000000000000000000000000 (size!5265 (_keys!6092 thiss!1504))))))

(assert (=> d!58571 (and (bvsle #b00000000000000000000000000000000 (size!5265 (_keys!6092 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5265 (_keys!6092 thiss!1504)) (size!5265 (_keys!6092 thiss!1504))))))

(assert (=> d!58571 (= (arrayCountValidKeys!0 (_keys!6092 thiss!1504) #b00000000000000000000000000000000 (size!5265 (_keys!6092 thiss!1504))) lt!111116)))

(declare-fun b!215976 () Bool)

(declare-fun call!20349 () (_ BitVec 32))

(assert (=> b!215976 (= e!140504 (bvadd #b00000000000000000000000000000001 call!20349))))

(declare-fun bm!20346 () Bool)

(assert (=> bm!20346 (= call!20349 (arrayCountValidKeys!0 (_keys!6092 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5265 (_keys!6092 thiss!1504))))))

(declare-fun b!215977 () Bool)

(assert (=> b!215977 (= e!140504 call!20349)))

(declare-fun b!215978 () Bool)

(assert (=> b!215978 (= e!140503 #b00000000000000000000000000000000)))

(assert (= (and d!58571 c!36276) b!215978))

(assert (= (and d!58571 (not c!36276)) b!215975))

(assert (= (and b!215975 c!36275) b!215976))

(assert (= (and b!215975 (not c!36275)) b!215977))

(assert (= (or b!215976 b!215977) bm!20346))

(declare-fun m!243071 () Bool)

(assert (=> b!215975 m!243071))

(assert (=> b!215975 m!243071))

(declare-fun m!243073 () Bool)

(assert (=> b!215975 m!243073))

(declare-fun m!243075 () Bool)

(assert (=> bm!20346 m!243075))

(assert (=> b!215926 d!58571))

(declare-fun b!215991 () Bool)

(declare-fun e!140513 () SeekEntryResult!724)

(assert (=> b!215991 (= e!140513 Undefined!724)))

(declare-fun e!140511 () SeekEntryResult!724)

(declare-fun b!215992 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215992 (= e!140511 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22547 lt!111112) #b00000000000000000000000000000001) (nextIndex!0 (index!5068 lt!111112) (bvadd (x!22547 lt!111112) #b00000000000000000000000000000001) (mask!9767 thiss!1504)) (index!5068 lt!111112) key!932 (_keys!6092 thiss!1504) (mask!9767 thiss!1504)))))

(declare-fun b!215994 () Bool)

(assert (=> b!215994 (= e!140511 (MissingVacant!724 (index!5068 lt!111112)))))

(declare-fun b!215995 () Bool)

(declare-fun c!36284 () Bool)

(declare-fun lt!111121 () (_ BitVec 64))

(assert (=> b!215995 (= c!36284 (= lt!111121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140512 () SeekEntryResult!724)

(assert (=> b!215995 (= e!140512 e!140511)))

(declare-fun b!215996 () Bool)

(assert (=> b!215996 (= e!140513 e!140512)))

(declare-fun c!36283 () Bool)

(assert (=> b!215996 (= c!36283 (= lt!111121 key!932))))

(declare-fun d!58573 () Bool)

(declare-fun lt!111122 () SeekEntryResult!724)

(assert (=> d!58573 (and (or ((_ is Undefined!724) lt!111122) (not ((_ is Found!724) lt!111122)) (and (bvsge (index!5067 lt!111122) #b00000000000000000000000000000000) (bvslt (index!5067 lt!111122) (size!5265 (_keys!6092 thiss!1504))))) (or ((_ is Undefined!724) lt!111122) ((_ is Found!724) lt!111122) (not ((_ is MissingVacant!724) lt!111122)) (not (= (index!5069 lt!111122) (index!5068 lt!111112))) (and (bvsge (index!5069 lt!111122) #b00000000000000000000000000000000) (bvslt (index!5069 lt!111122) (size!5265 (_keys!6092 thiss!1504))))) (or ((_ is Undefined!724) lt!111122) (ite ((_ is Found!724) lt!111122) (= (select (arr!4934 (_keys!6092 thiss!1504)) (index!5067 lt!111122)) key!932) (and ((_ is MissingVacant!724) lt!111122) (= (index!5069 lt!111122) (index!5068 lt!111112)) (= (select (arr!4934 (_keys!6092 thiss!1504)) (index!5069 lt!111122)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58573 (= lt!111122 e!140513)))

(declare-fun c!36285 () Bool)

(assert (=> d!58573 (= c!36285 (bvsge (x!22547 lt!111112) #b01111111111111111111111111111110))))

(assert (=> d!58573 (= lt!111121 (select (arr!4934 (_keys!6092 thiss!1504)) (index!5068 lt!111112)))))

(assert (=> d!58573 (validMask!0 (mask!9767 thiss!1504))))

(assert (=> d!58573 (= (seekKeyOrZeroReturnVacant!0 (x!22547 lt!111112) (index!5068 lt!111112) (index!5068 lt!111112) key!932 (_keys!6092 thiss!1504) (mask!9767 thiss!1504)) lt!111122)))

(declare-fun b!215993 () Bool)

(assert (=> b!215993 (= e!140512 (Found!724 (index!5068 lt!111112)))))

(assert (= (and d!58573 c!36285) b!215991))

(assert (= (and d!58573 (not c!36285)) b!215996))

(assert (= (and b!215996 c!36283) b!215993))

(assert (= (and b!215996 (not c!36283)) b!215995))

(assert (= (and b!215995 c!36284) b!215994))

(assert (= (and b!215995 (not c!36284)) b!215992))

(declare-fun m!243077 () Bool)

(assert (=> b!215992 m!243077))

(assert (=> b!215992 m!243077))

(declare-fun m!243079 () Bool)

(assert (=> b!215992 m!243079))

(declare-fun m!243081 () Bool)

(assert (=> d!58573 m!243081))

(declare-fun m!243083 () Bool)

(assert (=> d!58573 m!243083))

(assert (=> d!58573 m!243063))

(assert (=> d!58573 m!243013))

(assert (=> b!215945 d!58573))

(declare-fun b!216015 () Bool)

(declare-fun lt!111128 () SeekEntryResult!724)

(assert (=> b!216015 (and (bvsge (index!5068 lt!111128) #b00000000000000000000000000000000) (bvslt (index!5068 lt!111128) (size!5265 (_keys!6092 thiss!1504))))))

(declare-fun res!105615 () Bool)

(assert (=> b!216015 (= res!105615 (= (select (arr!4934 (_keys!6092 thiss!1504)) (index!5068 lt!111128)) key!932))))

(declare-fun e!140526 () Bool)

(assert (=> b!216015 (=> res!105615 e!140526)))

(declare-fun e!140527 () Bool)

(assert (=> b!216015 (= e!140527 e!140526)))

(declare-fun b!216016 () Bool)

(assert (=> b!216016 (and (bvsge (index!5068 lt!111128) #b00000000000000000000000000000000) (bvslt (index!5068 lt!111128) (size!5265 (_keys!6092 thiss!1504))))))

(declare-fun res!105616 () Bool)

(assert (=> b!216016 (= res!105616 (= (select (arr!4934 (_keys!6092 thiss!1504)) (index!5068 lt!111128)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!216016 (=> res!105616 e!140526)))

(declare-fun b!216017 () Bool)

(assert (=> b!216017 (and (bvsge (index!5068 lt!111128) #b00000000000000000000000000000000) (bvslt (index!5068 lt!111128) (size!5265 (_keys!6092 thiss!1504))))))

(assert (=> b!216017 (= e!140526 (= (select (arr!4934 (_keys!6092 thiss!1504)) (index!5068 lt!111128)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!216018 () Bool)

(declare-fun e!140525 () SeekEntryResult!724)

(assert (=> b!216018 (= e!140525 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9767 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9767 thiss!1504)) key!932 (_keys!6092 thiss!1504) (mask!9767 thiss!1504)))))

(declare-fun b!216019 () Bool)

(declare-fun e!140528 () Bool)

(assert (=> b!216019 (= e!140528 (bvsge (x!22547 lt!111128) #b01111111111111111111111111111110))))

(declare-fun b!216020 () Bool)

(declare-fun e!140524 () SeekEntryResult!724)

(assert (=> b!216020 (= e!140524 e!140525)))

(declare-fun c!36292 () Bool)

(declare-fun lt!111127 () (_ BitVec 64))

(assert (=> b!216020 (= c!36292 (or (= lt!111127 key!932) (= (bvadd lt!111127 lt!111127) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!216021 () Bool)

(assert (=> b!216021 (= e!140524 (Intermediate!724 true (toIndex!0 key!932 (mask!9767 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!216022 () Bool)

(assert (=> b!216022 (= e!140525 (Intermediate!724 false (toIndex!0 key!932 (mask!9767 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!58575 () Bool)

(assert (=> d!58575 e!140528))

(declare-fun c!36294 () Bool)

(assert (=> d!58575 (= c!36294 (and ((_ is Intermediate!724) lt!111128) (undefined!1536 lt!111128)))))

(assert (=> d!58575 (= lt!111128 e!140524)))

(declare-fun c!36293 () Bool)

(assert (=> d!58575 (= c!36293 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!58575 (= lt!111127 (select (arr!4934 (_keys!6092 thiss!1504)) (toIndex!0 key!932 (mask!9767 thiss!1504))))))

(assert (=> d!58575 (validMask!0 (mask!9767 thiss!1504))))

(assert (=> d!58575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9767 thiss!1504)) key!932 (_keys!6092 thiss!1504) (mask!9767 thiss!1504)) lt!111128)))

(declare-fun b!216023 () Bool)

(assert (=> b!216023 (= e!140528 e!140527)))

(declare-fun res!105617 () Bool)

(assert (=> b!216023 (= res!105617 (and ((_ is Intermediate!724) lt!111128) (not (undefined!1536 lt!111128)) (bvslt (x!22547 lt!111128) #b01111111111111111111111111111110) (bvsge (x!22547 lt!111128) #b00000000000000000000000000000000) (bvsge (x!22547 lt!111128) #b00000000000000000000000000000000)))))

(assert (=> b!216023 (=> (not res!105617) (not e!140527))))

(assert (= (and d!58575 c!36293) b!216021))

(assert (= (and d!58575 (not c!36293)) b!216020))

(assert (= (and b!216020 c!36292) b!216022))

(assert (= (and b!216020 (not c!36292)) b!216018))

(assert (= (and d!58575 c!36294) b!216019))

(assert (= (and d!58575 (not c!36294)) b!216023))

(assert (= (and b!216023 res!105617) b!216015))

(assert (= (and b!216015 (not res!105615)) b!216016))

(assert (= (and b!216016 (not res!105616)) b!216017))

(assert (=> d!58575 m!243055))

(declare-fun m!243085 () Bool)

(assert (=> d!58575 m!243085))

(assert (=> d!58575 m!243013))

(declare-fun m!243087 () Bool)

(assert (=> b!216015 m!243087))

(assert (=> b!216018 m!243055))

(declare-fun m!243089 () Bool)

(assert (=> b!216018 m!243089))

(assert (=> b!216018 m!243089))

(declare-fun m!243091 () Bool)

(assert (=> b!216018 m!243091))

(assert (=> b!216017 m!243087))

(assert (=> b!216016 m!243087))

(assert (=> d!58567 d!58575))

(declare-fun d!58577 () Bool)

(declare-fun lt!111134 () (_ BitVec 32))

(declare-fun lt!111133 () (_ BitVec 32))

(assert (=> d!58577 (= lt!111134 (bvmul (bvxor lt!111133 (bvlshr lt!111133 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58577 (= lt!111133 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58577 (and (bvsge (mask!9767 thiss!1504) #b00000000000000000000000000000000) (let ((res!105618 (let ((h!3717 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22566 (bvmul (bvxor h!3717 (bvlshr h!3717 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22566 (bvlshr x!22566 #b00000000000000000000000000001101)) (mask!9767 thiss!1504)))))) (and (bvslt res!105618 (bvadd (mask!9767 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105618 #b00000000000000000000000000000000))))))

(assert (=> d!58577 (= (toIndex!0 key!932 (mask!9767 thiss!1504)) (bvand (bvxor lt!111134 (bvlshr lt!111134 #b00000000000000000000000000001101)) (mask!9767 thiss!1504)))))

(assert (=> d!58567 d!58577))

(assert (=> d!58567 d!58565))

(declare-fun b!216032 () Bool)

(declare-fun e!140537 () Bool)

(declare-fun e!140535 () Bool)

(assert (=> b!216032 (= e!140537 e!140535)))

(declare-fun c!36297 () Bool)

(assert (=> b!216032 (= c!36297 (validKeyInArray!0 (select (arr!4934 (_keys!6092 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20349 () Bool)

(declare-fun call!20352 () Bool)

(assert (=> bm!20349 (= call!20352 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6092 thiss!1504) (mask!9767 thiss!1504)))))

(declare-fun b!216033 () Bool)

(declare-fun e!140536 () Bool)

(assert (=> b!216033 (= e!140536 call!20352)))

(declare-fun d!58579 () Bool)

(declare-fun res!105623 () Bool)

(assert (=> d!58579 (=> res!105623 e!140537)))

(assert (=> d!58579 (= res!105623 (bvsge #b00000000000000000000000000000000 (size!5265 (_keys!6092 thiss!1504))))))

(assert (=> d!58579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6092 thiss!1504) (mask!9767 thiss!1504)) e!140537)))

(declare-fun b!216034 () Bool)

(assert (=> b!216034 (= e!140535 e!140536)))

(declare-fun lt!111142 () (_ BitVec 64))

(assert (=> b!216034 (= lt!111142 (select (arr!4934 (_keys!6092 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6486 0))(
  ( (Unit!6487) )
))
(declare-fun lt!111143 () Unit!6486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10417 (_ BitVec 64) (_ BitVec 32)) Unit!6486)

(assert (=> b!216034 (= lt!111143 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6092 thiss!1504) lt!111142 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!216034 (arrayContainsKey!0 (_keys!6092 thiss!1504) lt!111142 #b00000000000000000000000000000000)))

(declare-fun lt!111141 () Unit!6486)

(assert (=> b!216034 (= lt!111141 lt!111143)))

(declare-fun res!105624 () Bool)

(assert (=> b!216034 (= res!105624 (= (seekEntryOrOpen!0 (select (arr!4934 (_keys!6092 thiss!1504)) #b00000000000000000000000000000000) (_keys!6092 thiss!1504) (mask!9767 thiss!1504)) (Found!724 #b00000000000000000000000000000000)))))

(assert (=> b!216034 (=> (not res!105624) (not e!140536))))

(declare-fun b!216035 () Bool)

(assert (=> b!216035 (= e!140535 call!20352)))

(assert (= (and d!58579 (not res!105623)) b!216032))

(assert (= (and b!216032 c!36297) b!216034))

(assert (= (and b!216032 (not c!36297)) b!216035))

(assert (= (and b!216034 res!105624) b!216033))

(assert (= (or b!216033 b!216035) bm!20349))

(assert (=> b!216032 m!243071))

(assert (=> b!216032 m!243071))

(assert (=> b!216032 m!243073))

(declare-fun m!243093 () Bool)

(assert (=> bm!20349 m!243093))

(assert (=> b!216034 m!243071))

(declare-fun m!243095 () Bool)

(assert (=> b!216034 m!243095))

(declare-fun m!243097 () Bool)

(assert (=> b!216034 m!243097))

(assert (=> b!216034 m!243071))

(declare-fun m!243099 () Bool)

(assert (=> b!216034 m!243099))

(assert (=> b!215927 d!58579))

(declare-fun b!216046 () Bool)

(declare-fun e!140547 () Bool)

(declare-fun e!140549 () Bool)

(assert (=> b!216046 (= e!140547 e!140549)))

(declare-fun res!105633 () Bool)

(assert (=> b!216046 (=> (not res!105633) (not e!140549))))

(declare-fun e!140548 () Bool)

(assert (=> b!216046 (= res!105633 (not e!140548))))

(declare-fun res!105632 () Bool)

(assert (=> b!216046 (=> (not res!105632) (not e!140548))))

(assert (=> b!216046 (= res!105632 (validKeyInArray!0 (select (arr!4934 (_keys!6092 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!216047 () Bool)

(declare-fun e!140546 () Bool)

(declare-fun call!20355 () Bool)

(assert (=> b!216047 (= e!140546 call!20355)))

(declare-fun b!216048 () Bool)

(assert (=> b!216048 (= e!140549 e!140546)))

(declare-fun c!36300 () Bool)

(assert (=> b!216048 (= c!36300 (validKeyInArray!0 (select (arr!4934 (_keys!6092 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58581 () Bool)

(declare-fun res!105631 () Bool)

(assert (=> d!58581 (=> res!105631 e!140547)))

(assert (=> d!58581 (= res!105631 (bvsge #b00000000000000000000000000000000 (size!5265 (_keys!6092 thiss!1504))))))

(assert (=> d!58581 (= (arrayNoDuplicates!0 (_keys!6092 thiss!1504) #b00000000000000000000000000000000 Nil!3071) e!140547)))

(declare-fun b!216049 () Bool)

(assert (=> b!216049 (= e!140546 call!20355)))

(declare-fun bm!20352 () Bool)

(assert (=> bm!20352 (= call!20355 (arrayNoDuplicates!0 (_keys!6092 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36300 (Cons!3070 (select (arr!4934 (_keys!6092 thiss!1504)) #b00000000000000000000000000000000) Nil!3071) Nil!3071)))))

(declare-fun b!216050 () Bool)

(declare-fun contains!1414 (List!3074 (_ BitVec 64)) Bool)

(assert (=> b!216050 (= e!140548 (contains!1414 Nil!3071 (select (arr!4934 (_keys!6092 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58581 (not res!105631)) b!216046))

(assert (= (and b!216046 res!105632) b!216050))

(assert (= (and b!216046 res!105633) b!216048))

(assert (= (and b!216048 c!36300) b!216047))

(assert (= (and b!216048 (not c!36300)) b!216049))

(assert (= (or b!216047 b!216049) bm!20352))

(assert (=> b!216046 m!243071))

(assert (=> b!216046 m!243071))

(assert (=> b!216046 m!243073))

(assert (=> b!216048 m!243071))

(assert (=> b!216048 m!243071))

(assert (=> b!216048 m!243073))

(assert (=> bm!20352 m!243071))

(declare-fun m!243101 () Bool)

(assert (=> bm!20352 m!243101))

(assert (=> b!216050 m!243071))

(assert (=> b!216050 m!243071))

(declare-fun m!243103 () Bool)

(assert (=> b!216050 m!243103))

(assert (=> b!215928 d!58581))

(declare-fun b!216051 () Bool)

(declare-fun e!140551 () Bool)

(assert (=> b!216051 (= e!140551 tp_is_empty!5593)))

(declare-fun mapNonEmpty!9549 () Bool)

(declare-fun mapRes!9549 () Bool)

(declare-fun tp!20331 () Bool)

(assert (=> mapNonEmpty!9549 (= mapRes!9549 (and tp!20331 e!140551))))

(declare-fun mapKey!9549 () (_ BitVec 32))

(declare-fun mapValue!9549 () ValueCell!2453)

(declare-fun mapRest!9549 () (Array (_ BitVec 32) ValueCell!2453))

(assert (=> mapNonEmpty!9549 (= mapRest!9548 (store mapRest!9549 mapKey!9549 mapValue!9549))))

(declare-fun condMapEmpty!9549 () Bool)

(declare-fun mapDefault!9549 () ValueCell!2453)

(assert (=> mapNonEmpty!9548 (= condMapEmpty!9549 (= mapRest!9548 ((as const (Array (_ BitVec 32) ValueCell!2453)) mapDefault!9549)))))

(declare-fun e!140550 () Bool)

(assert (=> mapNonEmpty!9548 (= tp!20330 (and e!140550 mapRes!9549))))

(declare-fun mapIsEmpty!9549 () Bool)

(assert (=> mapIsEmpty!9549 mapRes!9549))

(declare-fun b!216052 () Bool)

(assert (=> b!216052 (= e!140550 tp_is_empty!5593)))

(assert (= (and mapNonEmpty!9548 condMapEmpty!9549) mapIsEmpty!9549))

(assert (= (and mapNonEmpty!9548 (not condMapEmpty!9549)) mapNonEmpty!9549))

(assert (= (and mapNonEmpty!9549 ((_ is ValueCellFull!2453) mapValue!9549)) b!216051))

(assert (= (and mapNonEmpty!9548 ((_ is ValueCellFull!2453) mapDefault!9549)) b!216052))

(declare-fun m!243105 () Bool)

(assert (=> mapNonEmpty!9549 m!243105))

(check-sat (not bm!20349) (not b!216046) (not d!58573) (not b_next!5731) (not b!215975) (not b!216050) (not bm!20352) (not d!58575) tp_is_empty!5593 b_and!12635 (not b!216032) (not b!216048) (not b!215965) (not b!216034) (not mapNonEmpty!9549) (not d!58569) (not b!215964) (not bm!20346) (not b!216018) (not b!215992))
(check-sat b_and!12635 (not b_next!5731))
