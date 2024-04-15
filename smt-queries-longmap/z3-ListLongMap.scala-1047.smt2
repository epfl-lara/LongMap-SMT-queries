; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21968 () Bool)

(assert start!21968)

(declare-fun b!224704 () Bool)

(declare-fun b_free!6031 () Bool)

(declare-fun b_next!6031 () Bool)

(assert (=> b!224704 (= b_free!6031 (not b_next!6031))))

(declare-fun tp!21235 () Bool)

(declare-fun b_and!12903 () Bool)

(assert (=> b!224704 (= tp!21235 b_and!12903)))

(declare-fun res!110536 () Bool)

(declare-fun e!145863 () Bool)

(assert (=> start!21968 (=> (not res!110536) (not e!145863))))

(declare-datatypes ((V!7505 0))(
  ( (V!7506 (val!2991 Int)) )
))
(declare-datatypes ((ValueCell!2603 0))(
  ( (ValueCellFull!2603 (v!5005 V!7505)) (EmptyCell!2603) )
))
(declare-datatypes ((array!11021 0))(
  ( (array!11022 (arr!5229 (Array (_ BitVec 32) ValueCell!2603)) (size!5563 (_ BitVec 32))) )
))
(declare-datatypes ((array!11023 0))(
  ( (array!11024 (arr!5230 (Array (_ BitVec 32) (_ BitVec 64))) (size!5564 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3106 0))(
  ( (LongMapFixedSize!3107 (defaultEntry!4212 Int) (mask!10049 (_ BitVec 32)) (extraKeys!3949 (_ BitVec 32)) (zeroValue!4053 V!7505) (minValue!4053 V!7505) (_size!1602 (_ BitVec 32)) (_keys!6265 array!11023) (_values!4195 array!11021) (_vacant!1602 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3106)

(declare-fun valid!1263 (LongMapFixedSize!3106) Bool)

(assert (=> start!21968 (= res!110536 (valid!1263 thiss!1504))))

(assert (=> start!21968 e!145863))

(declare-fun e!145858 () Bool)

(assert (=> start!21968 e!145858))

(assert (=> start!21968 true))

(declare-fun b!224680 () Bool)

(declare-datatypes ((Unit!6718 0))(
  ( (Unit!6719) )
))
(declare-fun e!145854 () Unit!6718)

(declare-fun Unit!6720 () Unit!6718)

(assert (=> b!224680 (= e!145854 Unit!6720)))

(declare-fun b!224681 () Bool)

(declare-fun e!145850 () Bool)

(declare-fun tp_is_empty!5893 () Bool)

(assert (=> b!224681 (= e!145850 tp_is_empty!5893)))

(declare-fun b!224682 () Bool)

(declare-fun e!145861 () Bool)

(assert (=> b!224682 (= e!145861 tp_is_empty!5893)))

(declare-fun b!224683 () Bool)

(declare-fun res!110538 () Bool)

(declare-fun e!145852 () Bool)

(assert (=> b!224683 (=> (not res!110538) (not e!145852))))

(declare-fun call!20903 () Bool)

(assert (=> b!224683 (= res!110538 call!20903)))

(declare-fun e!145859 () Bool)

(assert (=> b!224683 (= e!145859 e!145852)))

(declare-fun b!224684 () Bool)

(declare-fun Unit!6721 () Unit!6718)

(assert (=> b!224684 (= e!145854 Unit!6721)))

(declare-fun lt!113100 () Unit!6718)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!81 (array!11023 array!11021 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 64) (_ BitVec 32) Int) Unit!6718)

(assert (=> b!224684 (= lt!113100 (lemmaArrayContainsKeyThenInListMap!81 (_keys!6265 thiss!1504) (_values!4195 thiss!1504) (mask!10049 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4212 thiss!1504)))))

(assert (=> b!224684 false))

(declare-fun bm!20900 () Bool)

(declare-fun call!20904 () Bool)

(declare-fun arrayContainsKey!0 (array!11023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20900 (= call!20904 (arrayContainsKey!0 (_keys!6265 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224685 () Bool)

(declare-fun res!110542 () Bool)

(declare-fun e!145851 () Bool)

(assert (=> b!224685 (=> res!110542 e!145851)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224685 (= res!110542 (or (not (= (size!5564 (_keys!6265 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10049 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5564 (_keys!6265 thiss!1504)))))))

(declare-fun b!224686 () Bool)

(declare-fun e!145862 () Bool)

(declare-fun e!145857 () Bool)

(assert (=> b!224686 (= e!145862 e!145857)))

(declare-fun res!110543 () Bool)

(assert (=> b!224686 (=> (not res!110543) (not e!145857))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224686 (= res!110543 (inRange!0 index!297 (mask!10049 thiss!1504)))))

(declare-fun lt!113102 () Unit!6718)

(declare-fun e!145855 () Unit!6718)

(assert (=> b!224686 (= lt!113102 e!145855)))

(declare-fun c!37255 () Bool)

(declare-datatypes ((tuple2!4398 0))(
  ( (tuple2!4399 (_1!2210 (_ BitVec 64)) (_2!2210 V!7505)) )
))
(declare-datatypes ((List!3326 0))(
  ( (Nil!3323) (Cons!3322 (h!3970 tuple2!4398) (t!8276 List!3326)) )
))
(declare-datatypes ((ListLongMap!3301 0))(
  ( (ListLongMap!3302 (toList!1666 List!3326)) )
))
(declare-fun contains!1541 (ListLongMap!3301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1175 (array!11023 array!11021 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 32) Int) ListLongMap!3301)

(assert (=> b!224686 (= c!37255 (contains!1541 (getCurrentListMap!1175 (_keys!6265 thiss!1504) (_values!4195 thiss!1504) (mask!10049 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4212 thiss!1504)) key!932))))

(declare-fun b!224687 () Bool)

(declare-fun res!110534 () Bool)

(assert (=> b!224687 (=> (not res!110534) (not e!145852))))

(declare-datatypes ((SeekEntryResult!859 0))(
  ( (MissingZero!859 (index!5606 (_ BitVec 32))) (Found!859 (index!5607 (_ BitVec 32))) (Intermediate!859 (undefined!1671 Bool) (index!5608 (_ BitVec 32)) (x!23150 (_ BitVec 32))) (Undefined!859) (MissingVacant!859 (index!5609 (_ BitVec 32))) )
))
(declare-fun lt!113101 () SeekEntryResult!859)

(assert (=> b!224687 (= res!110534 (= (select (arr!5230 (_keys!6265 thiss!1504)) (index!5606 lt!113101)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224688 () Bool)

(assert (=> b!224688 (= e!145851 true)))

(declare-fun lt!113095 () Bool)

(declare-datatypes ((List!3327 0))(
  ( (Nil!3324) (Cons!3323 (h!3971 (_ BitVec 64)) (t!8277 List!3327)) )
))
(declare-fun arrayNoDuplicates!0 (array!11023 (_ BitVec 32) List!3327) Bool)

(assert (=> b!224688 (= lt!113095 (arrayNoDuplicates!0 (_keys!6265 thiss!1504) #b00000000000000000000000000000000 Nil!3324))))

(declare-fun b!224689 () Bool)

(declare-fun e!145849 () Bool)

(assert (=> b!224689 (= e!145849 (not call!20904))))

(declare-fun b!224690 () Bool)

(assert (=> b!224690 (= e!145852 (not call!20904))))

(declare-fun mapNonEmpty!10009 () Bool)

(declare-fun mapRes!10009 () Bool)

(declare-fun tp!21234 () Bool)

(assert (=> mapNonEmpty!10009 (= mapRes!10009 (and tp!21234 e!145861))))

(declare-fun mapValue!10009 () ValueCell!2603)

(declare-fun mapKey!10009 () (_ BitVec 32))

(declare-fun mapRest!10009 () (Array (_ BitVec 32) ValueCell!2603))

(assert (=> mapNonEmpty!10009 (= (arr!5229 (_values!4195 thiss!1504)) (store mapRest!10009 mapKey!10009 mapValue!10009))))

(declare-fun b!224691 () Bool)

(declare-fun Unit!6722 () Unit!6718)

(assert (=> b!224691 (= e!145855 Unit!6722)))

(declare-fun lt!113096 () Unit!6718)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!237 (array!11023 array!11021 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 64) Int) Unit!6718)

(assert (=> b!224691 (= lt!113096 (lemmaInListMapThenSeekEntryOrOpenFindsIt!237 (_keys!6265 thiss!1504) (_values!4195 thiss!1504) (mask!10049 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) key!932 (defaultEntry!4212 thiss!1504)))))

(assert (=> b!224691 false))

(declare-fun b!224692 () Bool)

(declare-fun res!110545 () Bool)

(assert (=> b!224692 (= res!110545 (= (select (arr!5230 (_keys!6265 thiss!1504)) (index!5609 lt!113101)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224692 (=> (not res!110545) (not e!145849))))

(declare-fun b!224693 () Bool)

(declare-fun res!110540 () Bool)

(assert (=> b!224693 (=> res!110540 e!145851)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11023 (_ BitVec 32)) Bool)

(assert (=> b!224693 (= res!110540 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6265 thiss!1504) (mask!10049 thiss!1504))))))

(declare-fun b!224694 () Bool)

(declare-fun e!145856 () Bool)

(get-info :version)

(assert (=> b!224694 (= e!145856 ((_ is Undefined!859) lt!113101))))

(declare-fun b!224695 () Bool)

(declare-fun lt!113103 () Unit!6718)

(assert (=> b!224695 (= e!145855 lt!113103)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!236 (array!11023 array!11021 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 64) Int) Unit!6718)

(assert (=> b!224695 (= lt!113103 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!236 (_keys!6265 thiss!1504) (_values!4195 thiss!1504) (mask!10049 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) key!932 (defaultEntry!4212 thiss!1504)))))

(declare-fun c!37256 () Bool)

(assert (=> b!224695 (= c!37256 ((_ is MissingZero!859) lt!113101))))

(assert (=> b!224695 e!145859))

(declare-fun b!224696 () Bool)

(declare-fun c!37258 () Bool)

(assert (=> b!224696 (= c!37258 ((_ is MissingVacant!859) lt!113101))))

(assert (=> b!224696 (= e!145859 e!145856)))

(declare-fun b!224697 () Bool)

(assert (=> b!224697 (= e!145856 e!145849)))

(declare-fun res!110541 () Bool)

(assert (=> b!224697 (= res!110541 call!20903)))

(assert (=> b!224697 (=> (not res!110541) (not e!145849))))

(declare-fun b!224698 () Bool)

(declare-fun e!145860 () Bool)

(assert (=> b!224698 (= e!145860 (and e!145850 mapRes!10009))))

(declare-fun condMapEmpty!10009 () Bool)

(declare-fun mapDefault!10009 () ValueCell!2603)

(assert (=> b!224698 (= condMapEmpty!10009 (= (arr!5229 (_values!4195 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2603)) mapDefault!10009)))))

(declare-fun b!224699 () Bool)

(declare-fun res!110546 () Bool)

(assert (=> b!224699 (=> res!110546 e!145851)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224699 (= res!110546 (not (validKeyInArray!0 key!932)))))

(declare-fun mapIsEmpty!10009 () Bool)

(assert (=> mapIsEmpty!10009 mapRes!10009))

(declare-fun b!224700 () Bool)

(declare-fun res!110535 () Bool)

(assert (=> b!224700 (=> res!110535 e!145851)))

(declare-fun lt!113104 () Bool)

(assert (=> b!224700 (= res!110535 lt!113104)))

(declare-fun bm!20901 () Bool)

(assert (=> bm!20901 (= call!20903 (inRange!0 (ite c!37256 (index!5606 lt!113101) (index!5609 lt!113101)) (mask!10049 thiss!1504)))))

(declare-fun b!224701 () Bool)

(assert (=> b!224701 (= e!145857 (not e!145851))))

(declare-fun res!110537 () Bool)

(assert (=> b!224701 (=> res!110537 e!145851)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!224701 (= res!110537 (not (validMask!0 (mask!10049 thiss!1504))))))

(declare-fun lt!113098 () array!11023)

(declare-fun arrayCountValidKeys!0 (array!11023 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!224701 (= (arrayCountValidKeys!0 lt!113098 #b00000000000000000000000000000000 (size!5564 (_keys!6265 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6265 thiss!1504) #b00000000000000000000000000000000 (size!5564 (_keys!6265 thiss!1504)))))))

(declare-fun lt!113099 () Unit!6718)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11023 (_ BitVec 32) (_ BitVec 64)) Unit!6718)

(assert (=> b!224701 (= lt!113099 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6265 thiss!1504) index!297 key!932))))

(assert (=> b!224701 (arrayNoDuplicates!0 lt!113098 #b00000000000000000000000000000000 Nil!3324)))

(assert (=> b!224701 (= lt!113098 (array!11024 (store (arr!5230 (_keys!6265 thiss!1504)) index!297 key!932) (size!5564 (_keys!6265 thiss!1504))))))

(declare-fun lt!113097 () Unit!6718)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11023 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3327) Unit!6718)

(assert (=> b!224701 (= lt!113097 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6265 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3324))))

(declare-fun lt!113094 () Unit!6718)

(assert (=> b!224701 (= lt!113094 e!145854)))

(declare-fun c!37257 () Bool)

(assert (=> b!224701 (= c!37257 lt!113104)))

(assert (=> b!224701 (= lt!113104 (arrayContainsKey!0 (_keys!6265 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224702 () Bool)

(declare-fun res!110544 () Bool)

(assert (=> b!224702 (=> (not res!110544) (not e!145863))))

(assert (=> b!224702 (= res!110544 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224703 () Bool)

(assert (=> b!224703 (= e!145863 e!145862)))

(declare-fun res!110539 () Bool)

(assert (=> b!224703 (=> (not res!110539) (not e!145862))))

(assert (=> b!224703 (= res!110539 (or (= lt!113101 (MissingZero!859 index!297)) (= lt!113101 (MissingVacant!859 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11023 (_ BitVec 32)) SeekEntryResult!859)

(assert (=> b!224703 (= lt!113101 (seekEntryOrOpen!0 key!932 (_keys!6265 thiss!1504) (mask!10049 thiss!1504)))))

(declare-fun array_inv!3449 (array!11023) Bool)

(declare-fun array_inv!3450 (array!11021) Bool)

(assert (=> b!224704 (= e!145858 (and tp!21235 tp_is_empty!5893 (array_inv!3449 (_keys!6265 thiss!1504)) (array_inv!3450 (_values!4195 thiss!1504)) e!145860))))

(assert (= (and start!21968 res!110536) b!224702))

(assert (= (and b!224702 res!110544) b!224703))

(assert (= (and b!224703 res!110539) b!224686))

(assert (= (and b!224686 c!37255) b!224691))

(assert (= (and b!224686 (not c!37255)) b!224695))

(assert (= (and b!224695 c!37256) b!224683))

(assert (= (and b!224695 (not c!37256)) b!224696))

(assert (= (and b!224683 res!110538) b!224687))

(assert (= (and b!224687 res!110534) b!224690))

(assert (= (and b!224696 c!37258) b!224697))

(assert (= (and b!224696 (not c!37258)) b!224694))

(assert (= (and b!224697 res!110541) b!224692))

(assert (= (and b!224692 res!110545) b!224689))

(assert (= (or b!224683 b!224697) bm!20901))

(assert (= (or b!224690 b!224689) bm!20900))

(assert (= (and b!224686 res!110543) b!224701))

(assert (= (and b!224701 c!37257) b!224684))

(assert (= (and b!224701 (not c!37257)) b!224680))

(assert (= (and b!224701 (not res!110537)) b!224685))

(assert (= (and b!224685 (not res!110542)) b!224699))

(assert (= (and b!224699 (not res!110546)) b!224700))

(assert (= (and b!224700 (not res!110535)) b!224693))

(assert (= (and b!224693 (not res!110540)) b!224688))

(assert (= (and b!224698 condMapEmpty!10009) mapIsEmpty!10009))

(assert (= (and b!224698 (not condMapEmpty!10009)) mapNonEmpty!10009))

(assert (= (and mapNonEmpty!10009 ((_ is ValueCellFull!2603) mapValue!10009)) b!224682))

(assert (= (and b!224698 ((_ is ValueCellFull!2603) mapDefault!10009)) b!224681))

(assert (= b!224704 b!224698))

(assert (= start!21968 b!224704))

(declare-fun m!247033 () Bool)

(assert (=> b!224692 m!247033))

(declare-fun m!247035 () Bool)

(assert (=> b!224699 m!247035))

(declare-fun m!247037 () Bool)

(assert (=> b!224695 m!247037))

(declare-fun m!247039 () Bool)

(assert (=> bm!20900 m!247039))

(declare-fun m!247041 () Bool)

(assert (=> b!224701 m!247041))

(assert (=> b!224701 m!247039))

(declare-fun m!247043 () Bool)

(assert (=> b!224701 m!247043))

(declare-fun m!247045 () Bool)

(assert (=> b!224701 m!247045))

(declare-fun m!247047 () Bool)

(assert (=> b!224701 m!247047))

(declare-fun m!247049 () Bool)

(assert (=> b!224701 m!247049))

(declare-fun m!247051 () Bool)

(assert (=> b!224701 m!247051))

(declare-fun m!247053 () Bool)

(assert (=> b!224701 m!247053))

(declare-fun m!247055 () Bool)

(assert (=> b!224687 m!247055))

(declare-fun m!247057 () Bool)

(assert (=> b!224684 m!247057))

(declare-fun m!247059 () Bool)

(assert (=> b!224691 m!247059))

(declare-fun m!247061 () Bool)

(assert (=> bm!20901 m!247061))

(declare-fun m!247063 () Bool)

(assert (=> b!224686 m!247063))

(declare-fun m!247065 () Bool)

(assert (=> b!224686 m!247065))

(assert (=> b!224686 m!247065))

(declare-fun m!247067 () Bool)

(assert (=> b!224686 m!247067))

(declare-fun m!247069 () Bool)

(assert (=> start!21968 m!247069))

(declare-fun m!247071 () Bool)

(assert (=> b!224693 m!247071))

(declare-fun m!247073 () Bool)

(assert (=> b!224704 m!247073))

(declare-fun m!247075 () Bool)

(assert (=> b!224704 m!247075))

(declare-fun m!247077 () Bool)

(assert (=> b!224688 m!247077))

(declare-fun m!247079 () Bool)

(assert (=> mapNonEmpty!10009 m!247079))

(declare-fun m!247081 () Bool)

(assert (=> b!224703 m!247081))

(check-sat (not b!224701) (not bm!20901) (not b!224686) (not b!224691) (not b!224695) (not b_next!6031) (not bm!20900) b_and!12903 (not b!224684) tp_is_empty!5893 (not b!224699) (not b!224704) (not start!21968) (not b!224693) (not mapNonEmpty!10009) (not b!224703) (not b!224688))
(check-sat b_and!12903 (not b_next!6031))
