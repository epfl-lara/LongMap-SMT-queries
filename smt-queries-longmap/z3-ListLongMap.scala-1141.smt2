; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23580 () Bool)

(assert start!23580)

(declare-fun b!247866 () Bool)

(declare-fun b_free!6595 () Bool)

(declare-fun b_next!6595 () Bool)

(assert (=> b!247866 (= b_free!6595 (not b_next!6595))))

(declare-fun tp!23033 () Bool)

(declare-fun b_and!13611 () Bool)

(assert (=> b!247866 (= tp!23033 b_and!13611)))

(declare-fun b!247855 () Bool)

(declare-fun e!160784 () Bool)

(declare-fun tp_is_empty!6457 () Bool)

(assert (=> b!247855 (= e!160784 tp_is_empty!6457)))

(declare-fun b!247856 () Bool)

(declare-fun e!160792 () Bool)

(declare-fun call!23194 () Bool)

(assert (=> b!247856 (= e!160792 (not call!23194))))

(declare-fun bm!23191 () Bool)

(declare-datatypes ((V!8257 0))(
  ( (V!8258 (val!3273 Int)) )
))
(declare-datatypes ((ValueCell!2885 0))(
  ( (ValueCellFull!2885 (v!5332 V!8257)) (EmptyCell!2885) )
))
(declare-datatypes ((array!12219 0))(
  ( (array!12220 (arr!5797 (Array (_ BitVec 32) ValueCell!2885)) (size!6140 (_ BitVec 32))) )
))
(declare-datatypes ((array!12221 0))(
  ( (array!12222 (arr!5798 (Array (_ BitVec 32) (_ BitVec 64))) (size!6141 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3670 0))(
  ( (LongMapFixedSize!3671 (defaultEntry!4584 Int) (mask!10726 (_ BitVec 32)) (extraKeys!4321 (_ BitVec 32)) (zeroValue!4425 V!8257) (minValue!4425 V!8257) (_size!1884 (_ BitVec 32)) (_keys!6706 array!12221) (_values!4567 array!12219) (_vacant!1884 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3670)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23191 (= call!23194 (arrayContainsKey!0 (_keys!6706 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247857 () Bool)

(declare-fun e!160787 () Bool)

(declare-fun e!160789 () Bool)

(assert (=> b!247857 (= e!160787 e!160789)))

(declare-fun res!121476 () Bool)

(assert (=> b!247857 (=> (not res!121476) (not e!160789))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247857 (= res!121476 (inRange!0 index!297 (mask!10726 thiss!1504)))))

(declare-datatypes ((Unit!7646 0))(
  ( (Unit!7647) )
))
(declare-fun lt!124156 () Unit!7646)

(declare-fun e!160785 () Unit!7646)

(assert (=> b!247857 (= lt!124156 e!160785)))

(declare-fun c!41508 () Bool)

(declare-datatypes ((tuple2!4746 0))(
  ( (tuple2!4747 (_1!2384 (_ BitVec 64)) (_2!2384 V!8257)) )
))
(declare-datatypes ((List!3622 0))(
  ( (Nil!3619) (Cons!3618 (h!4276 tuple2!4746) (t!8637 List!3622)) )
))
(declare-datatypes ((ListLongMap!3661 0))(
  ( (ListLongMap!3662 (toList!1846 List!3622)) )
))
(declare-fun contains!1776 (ListLongMap!3661 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1378 (array!12221 array!12219 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 32) Int) ListLongMap!3661)

(assert (=> b!247857 (= c!41508 (contains!1776 (getCurrentListMap!1378 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)) key!932))))

(declare-fun b!247858 () Bool)

(declare-fun e!160791 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12221 (_ BitVec 32)) Bool)

(assert (=> b!247858 (= e!160791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6706 thiss!1504) (mask!10726 thiss!1504)))))

(declare-fun b!247860 () Bool)

(declare-fun res!121479 () Bool)

(assert (=> b!247860 (=> (not res!121479) (not e!160792))))

(declare-datatypes ((SeekEntryResult!1073 0))(
  ( (MissingZero!1073 (index!6462 (_ BitVec 32))) (Found!1073 (index!6463 (_ BitVec 32))) (Intermediate!1073 (undefined!1885 Bool) (index!6464 (_ BitVec 32)) (x!24517 (_ BitVec 32))) (Undefined!1073) (MissingVacant!1073 (index!6465 (_ BitVec 32))) )
))
(declare-fun lt!124152 () SeekEntryResult!1073)

(assert (=> b!247860 (= res!121479 (= (select (arr!5798 (_keys!6706 thiss!1504)) (index!6462 lt!124152)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247861 () Bool)

(declare-fun e!160788 () Bool)

(declare-fun e!160793 () Bool)

(declare-fun mapRes!10961 () Bool)

(assert (=> b!247861 (= e!160788 (and e!160793 mapRes!10961))))

(declare-fun condMapEmpty!10961 () Bool)

(declare-fun mapDefault!10961 () ValueCell!2885)

(assert (=> b!247861 (= condMapEmpty!10961 (= (arr!5797 (_values!4567 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2885)) mapDefault!10961)))))

(declare-fun c!41509 () Bool)

(declare-fun bm!23192 () Bool)

(declare-fun call!23195 () Bool)

(assert (=> bm!23192 (= call!23195 (inRange!0 (ite c!41509 (index!6462 lt!124152) (index!6465 lt!124152)) (mask!10726 thiss!1504)))))

(declare-fun b!247862 () Bool)

(assert (=> b!247862 (= e!160793 tp_is_empty!6457)))

(declare-fun b!247863 () Bool)

(declare-fun res!121473 () Bool)

(declare-fun e!160797 () Bool)

(assert (=> b!247863 (=> (not res!121473) (not e!160797))))

(assert (=> b!247863 (= res!121473 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10961 () Bool)

(assert (=> mapIsEmpty!10961 mapRes!10961))

(declare-fun b!247864 () Bool)

(declare-fun res!121480 () Bool)

(assert (=> b!247864 (=> res!121480 e!160791)))

(declare-fun lt!124153 () Bool)

(assert (=> b!247864 (= res!121480 lt!124153)))

(declare-fun b!247865 () Bool)

(declare-fun Unit!7648 () Unit!7646)

(assert (=> b!247865 (= e!160785 Unit!7648)))

(declare-fun lt!124159 () Unit!7646)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!382 (array!12221 array!12219 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) Int) Unit!7646)

(assert (=> b!247865 (= lt!124159 (lemmaInListMapThenSeekEntryOrOpenFindsIt!382 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)))))

(assert (=> b!247865 false))

(declare-fun e!160795 () Bool)

(declare-fun array_inv!3811 (array!12221) Bool)

(declare-fun array_inv!3812 (array!12219) Bool)

(assert (=> b!247866 (= e!160795 (and tp!23033 tp_is_empty!6457 (array_inv!3811 (_keys!6706 thiss!1504)) (array_inv!3812 (_values!4567 thiss!1504)) e!160788))))

(declare-fun b!247867 () Bool)

(declare-fun e!160783 () Bool)

(declare-fun e!160796 () Bool)

(assert (=> b!247867 (= e!160783 e!160796)))

(declare-fun res!121472 () Bool)

(assert (=> b!247867 (= res!121472 call!23195)))

(assert (=> b!247867 (=> (not res!121472) (not e!160796))))

(declare-fun b!247859 () Bool)

(declare-fun e!160794 () Unit!7646)

(declare-fun Unit!7649 () Unit!7646)

(assert (=> b!247859 (= e!160794 Unit!7649)))

(declare-fun lt!124157 () Unit!7646)

(declare-fun lemmaArrayContainsKeyThenInListMap!201 (array!12221 array!12219 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) (_ BitVec 32) Int) Unit!7646)

(assert (=> b!247859 (= lt!124157 (lemmaArrayContainsKeyThenInListMap!201 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(assert (=> b!247859 false))

(declare-fun res!121477 () Bool)

(assert (=> start!23580 (=> (not res!121477) (not e!160797))))

(declare-fun valid!1446 (LongMapFixedSize!3670) Bool)

(assert (=> start!23580 (= res!121477 (valid!1446 thiss!1504))))

(assert (=> start!23580 e!160797))

(assert (=> start!23580 e!160795))

(assert (=> start!23580 true))

(declare-fun b!247868 () Bool)

(declare-fun c!41511 () Bool)

(get-info :version)

(assert (=> b!247868 (= c!41511 ((_ is MissingVacant!1073) lt!124152))))

(declare-fun e!160786 () Bool)

(assert (=> b!247868 (= e!160786 e!160783)))

(declare-fun b!247869 () Bool)

(declare-fun lt!124160 () Unit!7646)

(assert (=> b!247869 (= e!160785 lt!124160)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!376 (array!12221 array!12219 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) Int) Unit!7646)

(assert (=> b!247869 (= lt!124160 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!376 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)))))

(assert (=> b!247869 (= c!41509 ((_ is MissingZero!1073) lt!124152))))

(assert (=> b!247869 e!160786))

(declare-fun b!247870 () Bool)

(declare-fun res!121469 () Bool)

(assert (=> b!247870 (=> res!121469 e!160791)))

(assert (=> b!247870 (= res!121469 (or (not (= (size!6141 (_keys!6706 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10726 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6141 (_keys!6706 thiss!1504)))))))

(declare-fun b!247871 () Bool)

(assert (=> b!247871 (= e!160783 ((_ is Undefined!1073) lt!124152))))

(declare-fun b!247872 () Bool)

(declare-fun res!121470 () Bool)

(assert (=> b!247872 (=> (not res!121470) (not e!160792))))

(assert (=> b!247872 (= res!121470 call!23195)))

(assert (=> b!247872 (= e!160786 e!160792)))

(declare-fun b!247873 () Bool)

(assert (=> b!247873 (= e!160797 e!160787)))

(declare-fun res!121471 () Bool)

(assert (=> b!247873 (=> (not res!121471) (not e!160787))))

(assert (=> b!247873 (= res!121471 (or (= lt!124152 (MissingZero!1073 index!297)) (= lt!124152 (MissingVacant!1073 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12221 (_ BitVec 32)) SeekEntryResult!1073)

(assert (=> b!247873 (= lt!124152 (seekEntryOrOpen!0 key!932 (_keys!6706 thiss!1504) (mask!10726 thiss!1504)))))

(declare-fun b!247874 () Bool)

(declare-fun res!121474 () Bool)

(assert (=> b!247874 (= res!121474 (= (select (arr!5798 (_keys!6706 thiss!1504)) (index!6465 lt!124152)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247874 (=> (not res!121474) (not e!160796))))

(declare-fun b!247875 () Bool)

(declare-fun res!121478 () Bool)

(assert (=> b!247875 (=> res!121478 e!160791)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247875 (= res!121478 (not (validKeyInArray!0 key!932)))))

(declare-fun b!247876 () Bool)

(assert (=> b!247876 (= e!160796 (not call!23194))))

(declare-fun mapNonEmpty!10961 () Bool)

(declare-fun tp!23032 () Bool)

(assert (=> mapNonEmpty!10961 (= mapRes!10961 (and tp!23032 e!160784))))

(declare-fun mapValue!10961 () ValueCell!2885)

(declare-fun mapKey!10961 () (_ BitVec 32))

(declare-fun mapRest!10961 () (Array (_ BitVec 32) ValueCell!2885))

(assert (=> mapNonEmpty!10961 (= (arr!5797 (_values!4567 thiss!1504)) (store mapRest!10961 mapKey!10961 mapValue!10961))))

(declare-fun b!247877 () Bool)

(declare-fun Unit!7650 () Unit!7646)

(assert (=> b!247877 (= e!160794 Unit!7650)))

(declare-fun b!247878 () Bool)

(assert (=> b!247878 (= e!160789 (not e!160791))))

(declare-fun res!121475 () Bool)

(assert (=> b!247878 (=> res!121475 e!160791)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247878 (= res!121475 (not (validMask!0 (mask!10726 thiss!1504))))))

(declare-fun lt!124151 () array!12221)

(declare-fun arrayCountValidKeys!0 (array!12221 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247878 (= (arrayCountValidKeys!0 lt!124151 #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6706 thiss!1504) #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504)))))))

(declare-fun lt!124158 () Unit!7646)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12221 (_ BitVec 32) (_ BitVec 64)) Unit!7646)

(assert (=> b!247878 (= lt!124158 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6706 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3623 0))(
  ( (Nil!3620) (Cons!3619 (h!4277 (_ BitVec 64)) (t!8638 List!3623)) )
))
(declare-fun arrayNoDuplicates!0 (array!12221 (_ BitVec 32) List!3623) Bool)

(assert (=> b!247878 (arrayNoDuplicates!0 lt!124151 #b00000000000000000000000000000000 Nil!3620)))

(assert (=> b!247878 (= lt!124151 (array!12222 (store (arr!5798 (_keys!6706 thiss!1504)) index!297 key!932) (size!6141 (_keys!6706 thiss!1504))))))

(declare-fun lt!124155 () Unit!7646)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12221 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3623) Unit!7646)

(assert (=> b!247878 (= lt!124155 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6706 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3620))))

(declare-fun lt!124154 () Unit!7646)

(assert (=> b!247878 (= lt!124154 e!160794)))

(declare-fun c!41510 () Bool)

(assert (=> b!247878 (= c!41510 lt!124153)))

(assert (=> b!247878 (= lt!124153 (arrayContainsKey!0 (_keys!6706 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!23580 res!121477) b!247863))

(assert (= (and b!247863 res!121473) b!247873))

(assert (= (and b!247873 res!121471) b!247857))

(assert (= (and b!247857 c!41508) b!247865))

(assert (= (and b!247857 (not c!41508)) b!247869))

(assert (= (and b!247869 c!41509) b!247872))

(assert (= (and b!247869 (not c!41509)) b!247868))

(assert (= (and b!247872 res!121470) b!247860))

(assert (= (and b!247860 res!121479) b!247856))

(assert (= (and b!247868 c!41511) b!247867))

(assert (= (and b!247868 (not c!41511)) b!247871))

(assert (= (and b!247867 res!121472) b!247874))

(assert (= (and b!247874 res!121474) b!247876))

(assert (= (or b!247872 b!247867) bm!23192))

(assert (= (or b!247856 b!247876) bm!23191))

(assert (= (and b!247857 res!121476) b!247878))

(assert (= (and b!247878 c!41510) b!247859))

(assert (= (and b!247878 (not c!41510)) b!247877))

(assert (= (and b!247878 (not res!121475)) b!247870))

(assert (= (and b!247870 (not res!121469)) b!247875))

(assert (= (and b!247875 (not res!121478)) b!247864))

(assert (= (and b!247864 (not res!121480)) b!247858))

(assert (= (and b!247861 condMapEmpty!10961) mapIsEmpty!10961))

(assert (= (and b!247861 (not condMapEmpty!10961)) mapNonEmpty!10961))

(assert (= (and mapNonEmpty!10961 ((_ is ValueCellFull!2885) mapValue!10961)) b!247855))

(assert (= (and b!247861 ((_ is ValueCellFull!2885) mapDefault!10961)) b!247862))

(assert (= b!247866 b!247861))

(assert (= start!23580 b!247866))

(declare-fun m!264939 () Bool)

(assert (=> bm!23191 m!264939))

(declare-fun m!264941 () Bool)

(assert (=> b!247878 m!264941))

(assert (=> b!247878 m!264939))

(declare-fun m!264943 () Bool)

(assert (=> b!247878 m!264943))

(declare-fun m!264945 () Bool)

(assert (=> b!247878 m!264945))

(declare-fun m!264947 () Bool)

(assert (=> b!247878 m!264947))

(declare-fun m!264949 () Bool)

(assert (=> b!247878 m!264949))

(declare-fun m!264951 () Bool)

(assert (=> b!247878 m!264951))

(declare-fun m!264953 () Bool)

(assert (=> b!247878 m!264953))

(declare-fun m!264955 () Bool)

(assert (=> b!247866 m!264955))

(declare-fun m!264957 () Bool)

(assert (=> b!247866 m!264957))

(declare-fun m!264959 () Bool)

(assert (=> b!247858 m!264959))

(declare-fun m!264961 () Bool)

(assert (=> b!247873 m!264961))

(declare-fun m!264963 () Bool)

(assert (=> b!247857 m!264963))

(declare-fun m!264965 () Bool)

(assert (=> b!247857 m!264965))

(assert (=> b!247857 m!264965))

(declare-fun m!264967 () Bool)

(assert (=> b!247857 m!264967))

(declare-fun m!264969 () Bool)

(assert (=> bm!23192 m!264969))

(declare-fun m!264971 () Bool)

(assert (=> b!247874 m!264971))

(declare-fun m!264973 () Bool)

(assert (=> start!23580 m!264973))

(declare-fun m!264975 () Bool)

(assert (=> b!247860 m!264975))

(declare-fun m!264977 () Bool)

(assert (=> b!247865 m!264977))

(declare-fun m!264979 () Bool)

(assert (=> b!247869 m!264979))

(declare-fun m!264981 () Bool)

(assert (=> b!247875 m!264981))

(declare-fun m!264983 () Bool)

(assert (=> b!247859 m!264983))

(declare-fun m!264985 () Bool)

(assert (=> mapNonEmpty!10961 m!264985))

(check-sat (not b!247873) (not b!247869) (not b!247878) (not start!23580) b_and!13611 (not b!247875) (not b!247865) (not b_next!6595) (not bm!23191) (not b!247866) tp_is_empty!6457 (not bm!23192) (not b!247857) (not mapNonEmpty!10961) (not b!247859) (not b!247858))
(check-sat b_and!13611 (not b_next!6595))
(get-model)

(declare-fun d!60557 () Bool)

(declare-fun e!160890 () Bool)

(assert (=> d!60557 e!160890))

(declare-fun res!121558 () Bool)

(assert (=> d!60557 (=> (not res!121558) (not e!160890))))

(declare-fun lt!124225 () SeekEntryResult!1073)

(assert (=> d!60557 (= res!121558 ((_ is Found!1073) lt!124225))))

(assert (=> d!60557 (= lt!124225 (seekEntryOrOpen!0 key!932 (_keys!6706 thiss!1504) (mask!10726 thiss!1504)))))

(declare-fun lt!124226 () Unit!7646)

(declare-fun choose!1171 (array!12221 array!12219 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) Int) Unit!7646)

(assert (=> d!60557 (= lt!124226 (choose!1171 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)))))

(assert (=> d!60557 (validMask!0 (mask!10726 thiss!1504))))

(assert (=> d!60557 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!382 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)) lt!124226)))

(declare-fun b!248027 () Bool)

(declare-fun res!121557 () Bool)

(assert (=> b!248027 (=> (not res!121557) (not e!160890))))

(assert (=> b!248027 (= res!121557 (inRange!0 (index!6463 lt!124225) (mask!10726 thiss!1504)))))

(declare-fun b!248028 () Bool)

(assert (=> b!248028 (= e!160890 (= (select (arr!5798 (_keys!6706 thiss!1504)) (index!6463 lt!124225)) key!932))))

(assert (=> b!248028 (and (bvsge (index!6463 lt!124225) #b00000000000000000000000000000000) (bvslt (index!6463 lt!124225) (size!6141 (_keys!6706 thiss!1504))))))

(assert (= (and d!60557 res!121558) b!248027))

(assert (= (and b!248027 res!121557) b!248028))

(assert (=> d!60557 m!264961))

(declare-fun m!265083 () Bool)

(assert (=> d!60557 m!265083))

(assert (=> d!60557 m!264941))

(declare-fun m!265085 () Bool)

(assert (=> b!248027 m!265085))

(declare-fun m!265087 () Bool)

(assert (=> b!248028 m!265087))

(assert (=> b!247865 d!60557))

(declare-fun d!60559 () Bool)

(assert (=> d!60559 (= (inRange!0 index!297 (mask!10726 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10726 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!247857 d!60559))

(declare-fun d!60561 () Bool)

(declare-fun e!160895 () Bool)

(assert (=> d!60561 e!160895))

(declare-fun res!121561 () Bool)

(assert (=> d!60561 (=> res!121561 e!160895)))

(declare-fun lt!124236 () Bool)

(assert (=> d!60561 (= res!121561 (not lt!124236))))

(declare-fun lt!124237 () Bool)

(assert (=> d!60561 (= lt!124236 lt!124237)))

(declare-fun lt!124238 () Unit!7646)

(declare-fun e!160896 () Unit!7646)

(assert (=> d!60561 (= lt!124238 e!160896)))

(declare-fun c!41538 () Bool)

(assert (=> d!60561 (= c!41538 lt!124237)))

(declare-fun containsKey!285 (List!3622 (_ BitVec 64)) Bool)

(assert (=> d!60561 (= lt!124237 (containsKey!285 (toList!1846 (getCurrentListMap!1378 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504))) key!932))))

(assert (=> d!60561 (= (contains!1776 (getCurrentListMap!1378 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)) key!932) lt!124236)))

(declare-fun b!248035 () Bool)

(declare-fun lt!124235 () Unit!7646)

(assert (=> b!248035 (= e!160896 lt!124235)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!233 (List!3622 (_ BitVec 64)) Unit!7646)

(assert (=> b!248035 (= lt!124235 (lemmaContainsKeyImpliesGetValueByKeyDefined!233 (toList!1846 (getCurrentListMap!1378 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504))) key!932))))

(declare-datatypes ((Option!300 0))(
  ( (Some!299 (v!5335 V!8257)) (None!298) )
))
(declare-fun isDefined!234 (Option!300) Bool)

(declare-fun getValueByKey!294 (List!3622 (_ BitVec 64)) Option!300)

(assert (=> b!248035 (isDefined!234 (getValueByKey!294 (toList!1846 (getCurrentListMap!1378 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504))) key!932))))

(declare-fun b!248036 () Bool)

(declare-fun Unit!7658 () Unit!7646)

(assert (=> b!248036 (= e!160896 Unit!7658)))

(declare-fun b!248037 () Bool)

(assert (=> b!248037 (= e!160895 (isDefined!234 (getValueByKey!294 (toList!1846 (getCurrentListMap!1378 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504))) key!932)))))

(assert (= (and d!60561 c!41538) b!248035))

(assert (= (and d!60561 (not c!41538)) b!248036))

(assert (= (and d!60561 (not res!121561)) b!248037))

(declare-fun m!265089 () Bool)

(assert (=> d!60561 m!265089))

(declare-fun m!265091 () Bool)

(assert (=> b!248035 m!265091))

(declare-fun m!265093 () Bool)

(assert (=> b!248035 m!265093))

(assert (=> b!248035 m!265093))

(declare-fun m!265095 () Bool)

(assert (=> b!248035 m!265095))

(assert (=> b!248037 m!265093))

(assert (=> b!248037 m!265093))

(assert (=> b!248037 m!265095))

(assert (=> b!247857 d!60561))

(declare-fun b!248080 () Bool)

(declare-fun e!160933 () Bool)

(declare-fun e!160925 () Bool)

(assert (=> b!248080 (= e!160933 e!160925)))

(declare-fun res!121585 () Bool)

(assert (=> b!248080 (=> (not res!121585) (not e!160925))))

(declare-fun lt!124286 () ListLongMap!3661)

(assert (=> b!248080 (= res!121585 (contains!1776 lt!124286 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!248080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))))))

(declare-fun b!248081 () Bool)

(declare-fun e!160930 () ListLongMap!3661)

(declare-fun call!23222 () ListLongMap!3661)

(assert (=> b!248081 (= e!160930 call!23222)))

(declare-fun b!248083 () Bool)

(declare-fun e!160924 () Unit!7646)

(declare-fun Unit!7659 () Unit!7646)

(assert (=> b!248083 (= e!160924 Unit!7659)))

(declare-fun bm!23219 () Bool)

(declare-fun call!23225 () ListLongMap!3661)

(declare-fun call!23224 () ListLongMap!3661)

(assert (=> bm!23219 (= call!23225 call!23224)))

(declare-fun bm!23220 () Bool)

(declare-fun call!23227 () Bool)

(assert (=> bm!23220 (= call!23227 (contains!1776 lt!124286 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248084 () Bool)

(declare-fun c!41554 () Bool)

(assert (=> b!248084 (= c!41554 (and (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!160928 () ListLongMap!3661)

(assert (=> b!248084 (= e!160928 e!160930)))

(declare-fun bm!23221 () Bool)

(declare-fun call!23228 () ListLongMap!3661)

(assert (=> bm!23221 (= call!23222 call!23228)))

(declare-fun b!248085 () Bool)

(declare-fun e!160931 () Bool)

(declare-fun e!160926 () Bool)

(assert (=> b!248085 (= e!160931 e!160926)))

(declare-fun c!41551 () Bool)

(assert (=> b!248085 (= c!41551 (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248086 () Bool)

(declare-fun e!160934 () ListLongMap!3661)

(assert (=> b!248086 (= e!160934 e!160928)))

(declare-fun c!41556 () Bool)

(assert (=> b!248086 (= c!41556 (and (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248087 () Bool)

(declare-fun e!160932 () Bool)

(declare-fun call!23223 () Bool)

(assert (=> b!248087 (= e!160932 (not call!23223))))

(declare-fun b!248088 () Bool)

(declare-fun res!121581 () Bool)

(assert (=> b!248088 (=> (not res!121581) (not e!160931))))

(assert (=> b!248088 (= res!121581 e!160932)))

(declare-fun c!41553 () Bool)

(assert (=> b!248088 (= c!41553 (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!248089 () Bool)

(declare-fun e!160927 () Bool)

(assert (=> b!248089 (= e!160927 (validKeyInArray!0 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248090 () Bool)

(declare-fun e!160923 () Bool)

(assert (=> b!248090 (= e!160926 e!160923)))

(declare-fun res!121584 () Bool)

(assert (=> b!248090 (= res!121584 call!23227)))

(assert (=> b!248090 (=> (not res!121584) (not e!160923))))

(declare-fun b!248091 () Bool)

(declare-fun lt!124304 () Unit!7646)

(assert (=> b!248091 (= e!160924 lt!124304)))

(declare-fun lt!124289 () ListLongMap!3661)

(declare-fun getCurrentListMapNoExtraKeys!551 (array!12221 array!12219 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 32) Int) ListLongMap!3661)

(assert (=> b!248091 (= lt!124289 (getCurrentListMapNoExtraKeys!551 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(declare-fun lt!124290 () (_ BitVec 64))

(assert (=> b!248091 (= lt!124290 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124285 () (_ BitVec 64))

(assert (=> b!248091 (= lt!124285 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124296 () Unit!7646)

(declare-fun addStillContains!211 (ListLongMap!3661 (_ BitVec 64) V!8257 (_ BitVec 64)) Unit!7646)

(assert (=> b!248091 (= lt!124296 (addStillContains!211 lt!124289 lt!124290 (zeroValue!4425 thiss!1504) lt!124285))))

(declare-fun +!662 (ListLongMap!3661 tuple2!4746) ListLongMap!3661)

(assert (=> b!248091 (contains!1776 (+!662 lt!124289 (tuple2!4747 lt!124290 (zeroValue!4425 thiss!1504))) lt!124285)))

(declare-fun lt!124298 () Unit!7646)

(assert (=> b!248091 (= lt!124298 lt!124296)))

(declare-fun lt!124288 () ListLongMap!3661)

(assert (=> b!248091 (= lt!124288 (getCurrentListMapNoExtraKeys!551 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(declare-fun lt!124297 () (_ BitVec 64))

(assert (=> b!248091 (= lt!124297 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124284 () (_ BitVec 64))

(assert (=> b!248091 (= lt!124284 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124295 () Unit!7646)

(declare-fun addApplyDifferent!211 (ListLongMap!3661 (_ BitVec 64) V!8257 (_ BitVec 64)) Unit!7646)

(assert (=> b!248091 (= lt!124295 (addApplyDifferent!211 lt!124288 lt!124297 (minValue!4425 thiss!1504) lt!124284))))

(declare-fun apply!235 (ListLongMap!3661 (_ BitVec 64)) V!8257)

(assert (=> b!248091 (= (apply!235 (+!662 lt!124288 (tuple2!4747 lt!124297 (minValue!4425 thiss!1504))) lt!124284) (apply!235 lt!124288 lt!124284))))

(declare-fun lt!124302 () Unit!7646)

(assert (=> b!248091 (= lt!124302 lt!124295)))

(declare-fun lt!124293 () ListLongMap!3661)

(assert (=> b!248091 (= lt!124293 (getCurrentListMapNoExtraKeys!551 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(declare-fun lt!124300 () (_ BitVec 64))

(assert (=> b!248091 (= lt!124300 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124292 () (_ BitVec 64))

(assert (=> b!248091 (= lt!124292 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124301 () Unit!7646)

(assert (=> b!248091 (= lt!124301 (addApplyDifferent!211 lt!124293 lt!124300 (zeroValue!4425 thiss!1504) lt!124292))))

(assert (=> b!248091 (= (apply!235 (+!662 lt!124293 (tuple2!4747 lt!124300 (zeroValue!4425 thiss!1504))) lt!124292) (apply!235 lt!124293 lt!124292))))

(declare-fun lt!124287 () Unit!7646)

(assert (=> b!248091 (= lt!124287 lt!124301)))

(declare-fun lt!124299 () ListLongMap!3661)

(assert (=> b!248091 (= lt!124299 (getCurrentListMapNoExtraKeys!551 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(declare-fun lt!124303 () (_ BitVec 64))

(assert (=> b!248091 (= lt!124303 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124283 () (_ BitVec 64))

(assert (=> b!248091 (= lt!124283 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248091 (= lt!124304 (addApplyDifferent!211 lt!124299 lt!124303 (minValue!4425 thiss!1504) lt!124283))))

(assert (=> b!248091 (= (apply!235 (+!662 lt!124299 (tuple2!4747 lt!124303 (minValue!4425 thiss!1504))) lt!124283) (apply!235 lt!124299 lt!124283))))

(declare-fun b!248092 () Bool)

(declare-fun e!160935 () Bool)

(assert (=> b!248092 (= e!160935 (validKeyInArray!0 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248093 () Bool)

(declare-fun e!160929 () Bool)

(assert (=> b!248093 (= e!160929 (= (apply!235 lt!124286 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4425 thiss!1504)))))

(declare-fun bm!23222 () Bool)

(assert (=> bm!23222 (= call!23224 (getCurrentListMapNoExtraKeys!551 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(declare-fun d!60563 () Bool)

(assert (=> d!60563 e!160931))

(declare-fun res!121582 () Bool)

(assert (=> d!60563 (=> (not res!121582) (not e!160931))))

(assert (=> d!60563 (= res!121582 (or (bvsge #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))))))))

(declare-fun lt!124291 () ListLongMap!3661)

(assert (=> d!60563 (= lt!124286 lt!124291)))

(declare-fun lt!124294 () Unit!7646)

(assert (=> d!60563 (= lt!124294 e!160924)))

(declare-fun c!41552 () Bool)

(assert (=> d!60563 (= c!41552 e!160935)))

(declare-fun res!121586 () Bool)

(assert (=> d!60563 (=> (not res!121586) (not e!160935))))

(assert (=> d!60563 (= res!121586 (bvslt #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))))))

(assert (=> d!60563 (= lt!124291 e!160934)))

(declare-fun c!41555 () Bool)

(assert (=> d!60563 (= c!41555 (and (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4321 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60563 (validMask!0 (mask!10726 thiss!1504))))

(assert (=> d!60563 (= (getCurrentListMap!1378 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)) lt!124286)))

(declare-fun b!248082 () Bool)

(declare-fun res!121583 () Bool)

(assert (=> b!248082 (=> (not res!121583) (not e!160931))))

(assert (=> b!248082 (= res!121583 e!160933)))

(declare-fun res!121580 () Bool)

(assert (=> b!248082 (=> res!121580 e!160933)))

(assert (=> b!248082 (= res!121580 (not e!160927))))

(declare-fun res!121587 () Bool)

(assert (=> b!248082 (=> (not res!121587) (not e!160927))))

(assert (=> b!248082 (= res!121587 (bvslt #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))))))

(declare-fun b!248094 () Bool)

(assert (=> b!248094 (= e!160934 (+!662 call!23228 (tuple2!4747 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4425 thiss!1504))))))

(declare-fun bm!23223 () Bool)

(declare-fun call!23226 () ListLongMap!3661)

(assert (=> bm!23223 (= call!23226 call!23225)))

(declare-fun b!248095 () Bool)

(assert (=> b!248095 (= e!160932 e!160929)))

(declare-fun res!121588 () Bool)

(assert (=> b!248095 (= res!121588 call!23223)))

(assert (=> b!248095 (=> (not res!121588) (not e!160929))))

(declare-fun b!248096 () Bool)

(assert (=> b!248096 (= e!160923 (= (apply!235 lt!124286 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4425 thiss!1504)))))

(declare-fun bm!23224 () Bool)

(assert (=> bm!23224 (= call!23223 (contains!1776 lt!124286 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248097 () Bool)

(declare-fun get!2982 (ValueCell!2885 V!8257) V!8257)

(declare-fun dynLambda!578 (Int (_ BitVec 64)) V!8257)

(assert (=> b!248097 (= e!160925 (= (apply!235 lt!124286 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000)) (get!2982 (select (arr!5797 (_values!4567 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!578 (defaultEntry!4584 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!248097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6140 (_values!4567 thiss!1504))))))

(assert (=> b!248097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))))))

(declare-fun b!248098 () Bool)

(assert (=> b!248098 (= e!160930 call!23226)))

(declare-fun b!248099 () Bool)

(assert (=> b!248099 (= e!160926 (not call!23227))))

(declare-fun bm!23225 () Bool)

(assert (=> bm!23225 (= call!23228 (+!662 (ite c!41555 call!23224 (ite c!41556 call!23225 call!23226)) (ite (or c!41555 c!41556) (tuple2!4747 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4425 thiss!1504)) (tuple2!4747 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4425 thiss!1504)))))))

(declare-fun b!248100 () Bool)

(assert (=> b!248100 (= e!160928 call!23222)))

(assert (= (and d!60563 c!41555) b!248094))

(assert (= (and d!60563 (not c!41555)) b!248086))

(assert (= (and b!248086 c!41556) b!248100))

(assert (= (and b!248086 (not c!41556)) b!248084))

(assert (= (and b!248084 c!41554) b!248081))

(assert (= (and b!248084 (not c!41554)) b!248098))

(assert (= (or b!248081 b!248098) bm!23223))

(assert (= (or b!248100 bm!23223) bm!23219))

(assert (= (or b!248100 b!248081) bm!23221))

(assert (= (or b!248094 bm!23219) bm!23222))

(assert (= (or b!248094 bm!23221) bm!23225))

(assert (= (and d!60563 res!121586) b!248092))

(assert (= (and d!60563 c!41552) b!248091))

(assert (= (and d!60563 (not c!41552)) b!248083))

(assert (= (and d!60563 res!121582) b!248082))

(assert (= (and b!248082 res!121587) b!248089))

(assert (= (and b!248082 (not res!121580)) b!248080))

(assert (= (and b!248080 res!121585) b!248097))

(assert (= (and b!248082 res!121583) b!248088))

(assert (= (and b!248088 c!41553) b!248095))

(assert (= (and b!248088 (not c!41553)) b!248087))

(assert (= (and b!248095 res!121588) b!248093))

(assert (= (or b!248095 b!248087) bm!23224))

(assert (= (and b!248088 res!121581) b!248085))

(assert (= (and b!248085 c!41551) b!248090))

(assert (= (and b!248085 (not c!41551)) b!248099))

(assert (= (and b!248090 res!121584) b!248096))

(assert (= (or b!248090 b!248099) bm!23220))

(declare-fun b_lambda!8073 () Bool)

(assert (=> (not b_lambda!8073) (not b!248097)))

(declare-fun t!8642 () Bool)

(declare-fun tb!2975 () Bool)

(assert (=> (and b!247866 (= (defaultEntry!4584 thiss!1504) (defaultEntry!4584 thiss!1504)) t!8642) tb!2975))

(declare-fun result!5263 () Bool)

(assert (=> tb!2975 (= result!5263 tp_is_empty!6457)))

(assert (=> b!248097 t!8642))

(declare-fun b_and!13617 () Bool)

(assert (= b_and!13611 (and (=> t!8642 result!5263) b_and!13617)))

(declare-fun m!265097 () Bool)

(assert (=> bm!23225 m!265097))

(declare-fun m!265099 () Bool)

(assert (=> bm!23222 m!265099))

(declare-fun m!265101 () Bool)

(assert (=> b!248080 m!265101))

(assert (=> b!248080 m!265101))

(declare-fun m!265103 () Bool)

(assert (=> b!248080 m!265103))

(assert (=> d!60563 m!264941))

(declare-fun m!265105 () Bool)

(assert (=> b!248097 m!265105))

(assert (=> b!248097 m!265101))

(declare-fun m!265107 () Bool)

(assert (=> b!248097 m!265107))

(declare-fun m!265109 () Bool)

(assert (=> b!248097 m!265109))

(assert (=> b!248097 m!265101))

(assert (=> b!248097 m!265109))

(assert (=> b!248097 m!265105))

(declare-fun m!265111 () Bool)

(assert (=> b!248097 m!265111))

(assert (=> b!248089 m!265101))

(assert (=> b!248089 m!265101))

(declare-fun m!265113 () Bool)

(assert (=> b!248089 m!265113))

(declare-fun m!265115 () Bool)

(assert (=> b!248093 m!265115))

(assert (=> b!248092 m!265101))

(assert (=> b!248092 m!265101))

(assert (=> b!248092 m!265113))

(declare-fun m!265117 () Bool)

(assert (=> b!248096 m!265117))

(declare-fun m!265119 () Bool)

(assert (=> bm!23220 m!265119))

(declare-fun m!265121 () Bool)

(assert (=> bm!23224 m!265121))

(declare-fun m!265123 () Bool)

(assert (=> b!248094 m!265123))

(declare-fun m!265125 () Bool)

(assert (=> b!248091 m!265125))

(declare-fun m!265127 () Bool)

(assert (=> b!248091 m!265127))

(declare-fun m!265129 () Bool)

(assert (=> b!248091 m!265129))

(declare-fun m!265131 () Bool)

(assert (=> b!248091 m!265131))

(declare-fun m!265133 () Bool)

(assert (=> b!248091 m!265133))

(declare-fun m!265135 () Bool)

(assert (=> b!248091 m!265135))

(declare-fun m!265137 () Bool)

(assert (=> b!248091 m!265137))

(declare-fun m!265139 () Bool)

(assert (=> b!248091 m!265139))

(declare-fun m!265141 () Bool)

(assert (=> b!248091 m!265141))

(declare-fun m!265143 () Bool)

(assert (=> b!248091 m!265143))

(declare-fun m!265145 () Bool)

(assert (=> b!248091 m!265145))

(declare-fun m!265147 () Bool)

(assert (=> b!248091 m!265147))

(assert (=> b!248091 m!265137))

(declare-fun m!265149 () Bool)

(assert (=> b!248091 m!265149))

(assert (=> b!248091 m!265139))

(declare-fun m!265151 () Bool)

(assert (=> b!248091 m!265151))

(assert (=> b!248091 m!265099))

(assert (=> b!248091 m!265101))

(assert (=> b!248091 m!265129))

(assert (=> b!248091 m!265135))

(declare-fun m!265153 () Bool)

(assert (=> b!248091 m!265153))

(assert (=> b!247857 d!60563))

(declare-fun d!60565 () Bool)

(assert (=> d!60565 (= (array_inv!3811 (_keys!6706 thiss!1504)) (bvsge (size!6141 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247866 d!60565))

(declare-fun d!60567 () Bool)

(assert (=> d!60567 (= (array_inv!3812 (_values!4567 thiss!1504)) (bvsge (size!6140 (_values!4567 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247866 d!60567))

(declare-fun d!60569 () Bool)

(declare-fun res!121595 () Bool)

(declare-fun e!160938 () Bool)

(assert (=> d!60569 (=> (not res!121595) (not e!160938))))

(declare-fun simpleValid!258 (LongMapFixedSize!3670) Bool)

(assert (=> d!60569 (= res!121595 (simpleValid!258 thiss!1504))))

(assert (=> d!60569 (= (valid!1446 thiss!1504) e!160938)))

(declare-fun b!248109 () Bool)

(declare-fun res!121596 () Bool)

(assert (=> b!248109 (=> (not res!121596) (not e!160938))))

(assert (=> b!248109 (= res!121596 (= (arrayCountValidKeys!0 (_keys!6706 thiss!1504) #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))) (_size!1884 thiss!1504)))))

(declare-fun b!248110 () Bool)

(declare-fun res!121597 () Bool)

(assert (=> b!248110 (=> (not res!121597) (not e!160938))))

(assert (=> b!248110 (= res!121597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6706 thiss!1504) (mask!10726 thiss!1504)))))

(declare-fun b!248111 () Bool)

(assert (=> b!248111 (= e!160938 (arrayNoDuplicates!0 (_keys!6706 thiss!1504) #b00000000000000000000000000000000 Nil!3620))))

(assert (= (and d!60569 res!121595) b!248109))

(assert (= (and b!248109 res!121596) b!248110))

(assert (= (and b!248110 res!121597) b!248111))

(declare-fun m!265155 () Bool)

(assert (=> d!60569 m!265155))

(assert (=> b!248109 m!264951))

(assert (=> b!248110 m!264959))

(declare-fun m!265157 () Bool)

(assert (=> b!248111 m!265157))

(assert (=> start!23580 d!60569))

(declare-fun d!60571 () Bool)

(assert (=> d!60571 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!247875 d!60571))

(declare-fun d!60573 () Bool)

(declare-fun res!121602 () Bool)

(declare-fun e!160943 () Bool)

(assert (=> d!60573 (=> res!121602 e!160943)))

(assert (=> d!60573 (= res!121602 (= (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60573 (= (arrayContainsKey!0 (_keys!6706 thiss!1504) key!932 #b00000000000000000000000000000000) e!160943)))

(declare-fun b!248116 () Bool)

(declare-fun e!160944 () Bool)

(assert (=> b!248116 (= e!160943 e!160944)))

(declare-fun res!121603 () Bool)

(assert (=> b!248116 (=> (not res!121603) (not e!160944))))

(assert (=> b!248116 (= res!121603 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6141 (_keys!6706 thiss!1504))))))

(declare-fun b!248117 () Bool)

(assert (=> b!248117 (= e!160944 (arrayContainsKey!0 (_keys!6706 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60573 (not res!121602)) b!248116))

(assert (= (and b!248116 res!121603) b!248117))

(assert (=> d!60573 m!265101))

(declare-fun m!265159 () Bool)

(assert (=> b!248117 m!265159))

(assert (=> bm!23191 d!60573))

(declare-fun d!60575 () Bool)

(assert (=> d!60575 (contains!1776 (getCurrentListMap!1378 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)) key!932)))

(declare-fun lt!124307 () Unit!7646)

(declare-fun choose!1172 (array!12221 array!12219 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) (_ BitVec 32) Int) Unit!7646)

(assert (=> d!60575 (= lt!124307 (choose!1172 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)))))

(assert (=> d!60575 (validMask!0 (mask!10726 thiss!1504))))

(assert (=> d!60575 (= (lemmaArrayContainsKeyThenInListMap!201 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4584 thiss!1504)) lt!124307)))

(declare-fun bs!8950 () Bool)

(assert (= bs!8950 d!60575))

(assert (=> bs!8950 m!264965))

(assert (=> bs!8950 m!264965))

(assert (=> bs!8950 m!264967))

(declare-fun m!265161 () Bool)

(assert (=> bs!8950 m!265161))

(assert (=> bs!8950 m!264941))

(assert (=> b!247859 d!60575))

(declare-fun bm!23228 () Bool)

(declare-fun call!23231 () Bool)

(declare-fun c!41559 () Bool)

(assert (=> bm!23228 (= call!23231 (arrayNoDuplicates!0 lt!124151 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41559 (Cons!3619 (select (arr!5798 lt!124151) #b00000000000000000000000000000000) Nil!3620) Nil!3620)))))

(declare-fun b!248128 () Bool)

(declare-fun e!160953 () Bool)

(declare-fun e!160954 () Bool)

(assert (=> b!248128 (= e!160953 e!160954)))

(assert (=> b!248128 (= c!41559 (validKeyInArray!0 (select (arr!5798 lt!124151) #b00000000000000000000000000000000)))))

(declare-fun d!60577 () Bool)

(declare-fun res!121611 () Bool)

(declare-fun e!160955 () Bool)

(assert (=> d!60577 (=> res!121611 e!160955)))

(assert (=> d!60577 (= res!121611 (bvsge #b00000000000000000000000000000000 (size!6141 lt!124151)))))

(assert (=> d!60577 (= (arrayNoDuplicates!0 lt!124151 #b00000000000000000000000000000000 Nil!3620) e!160955)))

(declare-fun b!248129 () Bool)

(declare-fun e!160956 () Bool)

(declare-fun contains!1778 (List!3623 (_ BitVec 64)) Bool)

(assert (=> b!248129 (= e!160956 (contains!1778 Nil!3620 (select (arr!5798 lt!124151) #b00000000000000000000000000000000)))))

(declare-fun b!248130 () Bool)

(assert (=> b!248130 (= e!160954 call!23231)))

(declare-fun b!248131 () Bool)

(assert (=> b!248131 (= e!160954 call!23231)))

(declare-fun b!248132 () Bool)

(assert (=> b!248132 (= e!160955 e!160953)))

(declare-fun res!121610 () Bool)

(assert (=> b!248132 (=> (not res!121610) (not e!160953))))

(assert (=> b!248132 (= res!121610 (not e!160956))))

(declare-fun res!121612 () Bool)

(assert (=> b!248132 (=> (not res!121612) (not e!160956))))

(assert (=> b!248132 (= res!121612 (validKeyInArray!0 (select (arr!5798 lt!124151) #b00000000000000000000000000000000)))))

(assert (= (and d!60577 (not res!121611)) b!248132))

(assert (= (and b!248132 res!121612) b!248129))

(assert (= (and b!248132 res!121610) b!248128))

(assert (= (and b!248128 c!41559) b!248130))

(assert (= (and b!248128 (not c!41559)) b!248131))

(assert (= (or b!248130 b!248131) bm!23228))

(declare-fun m!265163 () Bool)

(assert (=> bm!23228 m!265163))

(declare-fun m!265165 () Bool)

(assert (=> bm!23228 m!265165))

(assert (=> b!248128 m!265163))

(assert (=> b!248128 m!265163))

(declare-fun m!265167 () Bool)

(assert (=> b!248128 m!265167))

(assert (=> b!248129 m!265163))

(assert (=> b!248129 m!265163))

(declare-fun m!265169 () Bool)

(assert (=> b!248129 m!265169))

(assert (=> b!248132 m!265163))

(assert (=> b!248132 m!265163))

(assert (=> b!248132 m!265167))

(assert (=> b!247878 d!60577))

(declare-fun b!248143 () Bool)

(declare-fun e!160962 () Bool)

(assert (=> b!248143 (= e!160962 (bvslt (size!6141 (_keys!6706 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!248141 () Bool)

(declare-fun res!121623 () Bool)

(assert (=> b!248141 (=> (not res!121623) (not e!160962))))

(assert (=> b!248141 (= res!121623 (not (validKeyInArray!0 (select (arr!5798 (_keys!6706 thiss!1504)) index!297))))))

(declare-fun e!160961 () Bool)

(declare-fun b!248144 () Bool)

(assert (=> b!248144 (= e!160961 (= (arrayCountValidKeys!0 (array!12222 (store (arr!5798 (_keys!6706 thiss!1504)) index!297 key!932) (size!6141 (_keys!6706 thiss!1504))) #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6706 thiss!1504) #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!248142 () Bool)

(declare-fun res!121624 () Bool)

(assert (=> b!248142 (=> (not res!121624) (not e!160962))))

(assert (=> b!248142 (= res!121624 (validKeyInArray!0 key!932))))

(declare-fun d!60579 () Bool)

(assert (=> d!60579 e!160961))

(declare-fun res!121622 () Bool)

(assert (=> d!60579 (=> (not res!121622) (not e!160961))))

(assert (=> d!60579 (= res!121622 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6141 (_keys!6706 thiss!1504)))))))

(declare-fun lt!124310 () Unit!7646)

(declare-fun choose!1 (array!12221 (_ BitVec 32) (_ BitVec 64)) Unit!7646)

(assert (=> d!60579 (= lt!124310 (choose!1 (_keys!6706 thiss!1504) index!297 key!932))))

(assert (=> d!60579 e!160962))

(declare-fun res!121621 () Bool)

(assert (=> d!60579 (=> (not res!121621) (not e!160962))))

(assert (=> d!60579 (= res!121621 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6141 (_keys!6706 thiss!1504)))))))

(assert (=> d!60579 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6706 thiss!1504) index!297 key!932) lt!124310)))

(assert (= (and d!60579 res!121621) b!248141))

(assert (= (and b!248141 res!121623) b!248142))

(assert (= (and b!248142 res!121624) b!248143))

(assert (= (and d!60579 res!121622) b!248144))

(declare-fun m!265171 () Bool)

(assert (=> b!248141 m!265171))

(assert (=> b!248141 m!265171))

(declare-fun m!265173 () Bool)

(assert (=> b!248141 m!265173))

(assert (=> b!248144 m!264949))

(declare-fun m!265175 () Bool)

(assert (=> b!248144 m!265175))

(assert (=> b!248144 m!264951))

(assert (=> b!248142 m!264981))

(declare-fun m!265177 () Bool)

(assert (=> d!60579 m!265177))

(assert (=> b!247878 d!60579))

(declare-fun b!248153 () Bool)

(declare-fun e!160967 () (_ BitVec 32))

(declare-fun e!160968 () (_ BitVec 32))

(assert (=> b!248153 (= e!160967 e!160968)))

(declare-fun c!41565 () Bool)

(assert (=> b!248153 (= c!41565 (validKeyInArray!0 (select (arr!5798 lt!124151) #b00000000000000000000000000000000)))))

(declare-fun b!248154 () Bool)

(declare-fun call!23234 () (_ BitVec 32))

(assert (=> b!248154 (= e!160968 call!23234)))

(declare-fun bm!23231 () Bool)

(assert (=> bm!23231 (= call!23234 (arrayCountValidKeys!0 lt!124151 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6141 (_keys!6706 thiss!1504))))))

(declare-fun d!60581 () Bool)

(declare-fun lt!124313 () (_ BitVec 32))

(assert (=> d!60581 (and (bvsge lt!124313 #b00000000000000000000000000000000) (bvsle lt!124313 (bvsub (size!6141 lt!124151) #b00000000000000000000000000000000)))))

(assert (=> d!60581 (= lt!124313 e!160967)))

(declare-fun c!41564 () Bool)

(assert (=> d!60581 (= c!41564 (bvsge #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))))))

(assert (=> d!60581 (and (bvsle #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6141 (_keys!6706 thiss!1504)) (size!6141 lt!124151)))))

(assert (=> d!60581 (= (arrayCountValidKeys!0 lt!124151 #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))) lt!124313)))

(declare-fun b!248155 () Bool)

(assert (=> b!248155 (= e!160967 #b00000000000000000000000000000000)))

(declare-fun b!248156 () Bool)

(assert (=> b!248156 (= e!160968 (bvadd #b00000000000000000000000000000001 call!23234))))

(assert (= (and d!60581 c!41564) b!248155))

(assert (= (and d!60581 (not c!41564)) b!248153))

(assert (= (and b!248153 c!41565) b!248156))

(assert (= (and b!248153 (not c!41565)) b!248154))

(assert (= (or b!248156 b!248154) bm!23231))

(assert (=> b!248153 m!265163))

(assert (=> b!248153 m!265163))

(assert (=> b!248153 m!265167))

(declare-fun m!265179 () Bool)

(assert (=> bm!23231 m!265179))

(assert (=> b!247878 d!60581))

(assert (=> b!247878 d!60573))

(declare-fun b!248157 () Bool)

(declare-fun e!160969 () (_ BitVec 32))

(declare-fun e!160970 () (_ BitVec 32))

(assert (=> b!248157 (= e!160969 e!160970)))

(declare-fun c!41567 () Bool)

(assert (=> b!248157 (= c!41567 (validKeyInArray!0 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248158 () Bool)

(declare-fun call!23235 () (_ BitVec 32))

(assert (=> b!248158 (= e!160970 call!23235)))

(declare-fun bm!23232 () Bool)

(assert (=> bm!23232 (= call!23235 (arrayCountValidKeys!0 (_keys!6706 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6141 (_keys!6706 thiss!1504))))))

(declare-fun d!60583 () Bool)

(declare-fun lt!124314 () (_ BitVec 32))

(assert (=> d!60583 (and (bvsge lt!124314 #b00000000000000000000000000000000) (bvsle lt!124314 (bvsub (size!6141 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60583 (= lt!124314 e!160969)))

(declare-fun c!41566 () Bool)

(assert (=> d!60583 (= c!41566 (bvsge #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))))))

(assert (=> d!60583 (and (bvsle #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6141 (_keys!6706 thiss!1504)) (size!6141 (_keys!6706 thiss!1504))))))

(assert (=> d!60583 (= (arrayCountValidKeys!0 (_keys!6706 thiss!1504) #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))) lt!124314)))

(declare-fun b!248159 () Bool)

(assert (=> b!248159 (= e!160969 #b00000000000000000000000000000000)))

(declare-fun b!248160 () Bool)

(assert (=> b!248160 (= e!160970 (bvadd #b00000000000000000000000000000001 call!23235))))

(assert (= (and d!60583 c!41566) b!248159))

(assert (= (and d!60583 (not c!41566)) b!248157))

(assert (= (and b!248157 c!41567) b!248160))

(assert (= (and b!248157 (not c!41567)) b!248158))

(assert (= (or b!248160 b!248158) bm!23232))

(assert (=> b!248157 m!265101))

(assert (=> b!248157 m!265101))

(assert (=> b!248157 m!265113))

(declare-fun m!265181 () Bool)

(assert (=> bm!23232 m!265181))

(assert (=> b!247878 d!60583))

(declare-fun d!60585 () Bool)

(assert (=> d!60585 (= (validMask!0 (mask!10726 thiss!1504)) (and (or (= (mask!10726 thiss!1504) #b00000000000000000000000000000111) (= (mask!10726 thiss!1504) #b00000000000000000000000000001111) (= (mask!10726 thiss!1504) #b00000000000000000000000000011111) (= (mask!10726 thiss!1504) #b00000000000000000000000000111111) (= (mask!10726 thiss!1504) #b00000000000000000000000001111111) (= (mask!10726 thiss!1504) #b00000000000000000000000011111111) (= (mask!10726 thiss!1504) #b00000000000000000000000111111111) (= (mask!10726 thiss!1504) #b00000000000000000000001111111111) (= (mask!10726 thiss!1504) #b00000000000000000000011111111111) (= (mask!10726 thiss!1504) #b00000000000000000000111111111111) (= (mask!10726 thiss!1504) #b00000000000000000001111111111111) (= (mask!10726 thiss!1504) #b00000000000000000011111111111111) (= (mask!10726 thiss!1504) #b00000000000000000111111111111111) (= (mask!10726 thiss!1504) #b00000000000000001111111111111111) (= (mask!10726 thiss!1504) #b00000000000000011111111111111111) (= (mask!10726 thiss!1504) #b00000000000000111111111111111111) (= (mask!10726 thiss!1504) #b00000000000001111111111111111111) (= (mask!10726 thiss!1504) #b00000000000011111111111111111111) (= (mask!10726 thiss!1504) #b00000000000111111111111111111111) (= (mask!10726 thiss!1504) #b00000000001111111111111111111111) (= (mask!10726 thiss!1504) #b00000000011111111111111111111111) (= (mask!10726 thiss!1504) #b00000000111111111111111111111111) (= (mask!10726 thiss!1504) #b00000001111111111111111111111111) (= (mask!10726 thiss!1504) #b00000011111111111111111111111111) (= (mask!10726 thiss!1504) #b00000111111111111111111111111111) (= (mask!10726 thiss!1504) #b00001111111111111111111111111111) (= (mask!10726 thiss!1504) #b00011111111111111111111111111111) (= (mask!10726 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10726 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!247878 d!60585))

(declare-fun d!60587 () Bool)

(declare-fun e!160973 () Bool)

(assert (=> d!60587 e!160973))

(declare-fun res!121627 () Bool)

(assert (=> d!60587 (=> (not res!121627) (not e!160973))))

(assert (=> d!60587 (= res!121627 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6141 (_keys!6706 thiss!1504)))))))

(declare-fun lt!124317 () Unit!7646)

(declare-fun choose!41 (array!12221 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3623) Unit!7646)

(assert (=> d!60587 (= lt!124317 (choose!41 (_keys!6706 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3620))))

(assert (=> d!60587 (bvslt (size!6141 (_keys!6706 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60587 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6706 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3620) lt!124317)))

(declare-fun b!248163 () Bool)

(assert (=> b!248163 (= e!160973 (arrayNoDuplicates!0 (array!12222 (store (arr!5798 (_keys!6706 thiss!1504)) index!297 key!932) (size!6141 (_keys!6706 thiss!1504))) #b00000000000000000000000000000000 Nil!3620))))

(assert (= (and d!60587 res!121627) b!248163))

(declare-fun m!265183 () Bool)

(assert (=> d!60587 m!265183))

(assert (=> b!248163 m!264949))

(declare-fun m!265185 () Bool)

(assert (=> b!248163 m!265185))

(assert (=> b!247878 d!60587))

(declare-fun d!60589 () Bool)

(declare-fun res!121632 () Bool)

(declare-fun e!160980 () Bool)

(assert (=> d!60589 (=> res!121632 e!160980)))

(assert (=> d!60589 (= res!121632 (bvsge #b00000000000000000000000000000000 (size!6141 (_keys!6706 thiss!1504))))))

(assert (=> d!60589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6706 thiss!1504) (mask!10726 thiss!1504)) e!160980)))

(declare-fun b!248172 () Bool)

(declare-fun e!160981 () Bool)

(declare-fun e!160982 () Bool)

(assert (=> b!248172 (= e!160981 e!160982)))

(declare-fun lt!124324 () (_ BitVec 64))

(assert (=> b!248172 (= lt!124324 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124326 () Unit!7646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12221 (_ BitVec 64) (_ BitVec 32)) Unit!7646)

(assert (=> b!248172 (= lt!124326 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6706 thiss!1504) lt!124324 #b00000000000000000000000000000000))))

(assert (=> b!248172 (arrayContainsKey!0 (_keys!6706 thiss!1504) lt!124324 #b00000000000000000000000000000000)))

(declare-fun lt!124325 () Unit!7646)

(assert (=> b!248172 (= lt!124325 lt!124326)))

(declare-fun res!121633 () Bool)

(assert (=> b!248172 (= res!121633 (= (seekEntryOrOpen!0 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000) (_keys!6706 thiss!1504) (mask!10726 thiss!1504)) (Found!1073 #b00000000000000000000000000000000)))))

(assert (=> b!248172 (=> (not res!121633) (not e!160982))))

(declare-fun bm!23235 () Bool)

(declare-fun call!23238 () Bool)

(assert (=> bm!23235 (= call!23238 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6706 thiss!1504) (mask!10726 thiss!1504)))))

(declare-fun b!248173 () Bool)

(assert (=> b!248173 (= e!160981 call!23238)))

(declare-fun b!248174 () Bool)

(assert (=> b!248174 (= e!160982 call!23238)))

(declare-fun b!248175 () Bool)

(assert (=> b!248175 (= e!160980 e!160981)))

(declare-fun c!41570 () Bool)

(assert (=> b!248175 (= c!41570 (validKeyInArray!0 (select (arr!5798 (_keys!6706 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60589 (not res!121632)) b!248175))

(assert (= (and b!248175 c!41570) b!248172))

(assert (= (and b!248175 (not c!41570)) b!248173))

(assert (= (and b!248172 res!121633) b!248174))

(assert (= (or b!248174 b!248173) bm!23235))

(assert (=> b!248172 m!265101))

(declare-fun m!265187 () Bool)

(assert (=> b!248172 m!265187))

(declare-fun m!265189 () Bool)

(assert (=> b!248172 m!265189))

(assert (=> b!248172 m!265101))

(declare-fun m!265191 () Bool)

(assert (=> b!248172 m!265191))

(declare-fun m!265193 () Bool)

(assert (=> bm!23235 m!265193))

(assert (=> b!248175 m!265101))

(assert (=> b!248175 m!265101))

(assert (=> b!248175 m!265113))

(assert (=> b!247858 d!60589))

(declare-fun d!60591 () Bool)

(assert (=> d!60591 (= (inRange!0 (ite c!41509 (index!6462 lt!124152) (index!6465 lt!124152)) (mask!10726 thiss!1504)) (and (bvsge (ite c!41509 (index!6462 lt!124152) (index!6465 lt!124152)) #b00000000000000000000000000000000) (bvslt (ite c!41509 (index!6462 lt!124152) (index!6465 lt!124152)) (bvadd (mask!10726 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23192 d!60591))

(declare-fun b!248192 () Bool)

(declare-fun e!160993 () Bool)

(declare-fun e!160991 () Bool)

(assert (=> b!248192 (= e!160993 e!160991)))

(declare-fun c!41575 () Bool)

(declare-fun lt!124331 () SeekEntryResult!1073)

(assert (=> b!248192 (= c!41575 ((_ is MissingVacant!1073) lt!124331))))

(declare-fun b!248193 () Bool)

(declare-fun res!121643 () Bool)

(declare-fun e!160992 () Bool)

(assert (=> b!248193 (=> (not res!121643) (not e!160992))))

(assert (=> b!248193 (= res!121643 (= (select (arr!5798 (_keys!6706 thiss!1504)) (index!6465 lt!124331)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248193 (and (bvsge (index!6465 lt!124331) #b00000000000000000000000000000000) (bvslt (index!6465 lt!124331) (size!6141 (_keys!6706 thiss!1504))))))

(declare-fun b!248194 () Bool)

(declare-fun call!23244 () Bool)

(assert (=> b!248194 (= e!160992 (not call!23244))))

(declare-fun b!248195 () Bool)

(assert (=> b!248195 (and (bvsge (index!6462 lt!124331) #b00000000000000000000000000000000) (bvslt (index!6462 lt!124331) (size!6141 (_keys!6706 thiss!1504))))))

(declare-fun res!121642 () Bool)

(assert (=> b!248195 (= res!121642 (= (select (arr!5798 (_keys!6706 thiss!1504)) (index!6462 lt!124331)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160994 () Bool)

(assert (=> b!248195 (=> (not res!121642) (not e!160994))))

(declare-fun b!248197 () Bool)

(assert (=> b!248197 (= e!160991 ((_ is Undefined!1073) lt!124331))))

(declare-fun bm!23240 () Bool)

(assert (=> bm!23240 (= call!23244 (arrayContainsKey!0 (_keys!6706 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248198 () Bool)

(assert (=> b!248198 (= e!160994 (not call!23244))))

(declare-fun b!248196 () Bool)

(assert (=> b!248196 (= e!160993 e!160994)))

(declare-fun res!121644 () Bool)

(declare-fun call!23243 () Bool)

(assert (=> b!248196 (= res!121644 call!23243)))

(assert (=> b!248196 (=> (not res!121644) (not e!160994))))

(declare-fun d!60593 () Bool)

(assert (=> d!60593 e!160993))

(declare-fun c!41576 () Bool)

(assert (=> d!60593 (= c!41576 ((_ is MissingZero!1073) lt!124331))))

(assert (=> d!60593 (= lt!124331 (seekEntryOrOpen!0 key!932 (_keys!6706 thiss!1504) (mask!10726 thiss!1504)))))

(declare-fun lt!124332 () Unit!7646)

(declare-fun choose!1173 (array!12221 array!12219 (_ BitVec 32) (_ BitVec 32) V!8257 V!8257 (_ BitVec 64) Int) Unit!7646)

(assert (=> d!60593 (= lt!124332 (choose!1173 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)))))

(assert (=> d!60593 (validMask!0 (mask!10726 thiss!1504))))

(assert (=> d!60593 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!376 (_keys!6706 thiss!1504) (_values!4567 thiss!1504) (mask!10726 thiss!1504) (extraKeys!4321 thiss!1504) (zeroValue!4425 thiss!1504) (minValue!4425 thiss!1504) key!932 (defaultEntry!4584 thiss!1504)) lt!124332)))

(declare-fun bm!23241 () Bool)

(assert (=> bm!23241 (= call!23243 (inRange!0 (ite c!41576 (index!6462 lt!124331) (index!6465 lt!124331)) (mask!10726 thiss!1504)))))

(declare-fun b!248199 () Bool)

(declare-fun res!121645 () Bool)

(assert (=> b!248199 (=> (not res!121645) (not e!160992))))

(assert (=> b!248199 (= res!121645 call!23243)))

(assert (=> b!248199 (= e!160991 e!160992)))

(assert (= (and d!60593 c!41576) b!248196))

(assert (= (and d!60593 (not c!41576)) b!248192))

(assert (= (and b!248196 res!121644) b!248195))

(assert (= (and b!248195 res!121642) b!248198))

(assert (= (and b!248192 c!41575) b!248199))

(assert (= (and b!248192 (not c!41575)) b!248197))

(assert (= (and b!248199 res!121645) b!248193))

(assert (= (and b!248193 res!121643) b!248194))

(assert (= (or b!248196 b!248199) bm!23241))

(assert (= (or b!248198 b!248194) bm!23240))

(assert (=> bm!23240 m!264939))

(declare-fun m!265195 () Bool)

(assert (=> bm!23241 m!265195))

(declare-fun m!265197 () Bool)

(assert (=> b!248193 m!265197))

(declare-fun m!265199 () Bool)

(assert (=> b!248195 m!265199))

(assert (=> d!60593 m!264961))

(declare-fun m!265201 () Bool)

(assert (=> d!60593 m!265201))

(assert (=> d!60593 m!264941))

(assert (=> b!247869 d!60593))

(declare-fun b!248212 () Bool)

(declare-fun e!161002 () SeekEntryResult!1073)

(declare-fun lt!124339 () SeekEntryResult!1073)

(assert (=> b!248212 (= e!161002 (MissingZero!1073 (index!6464 lt!124339)))))

(declare-fun b!248213 () Bool)

(declare-fun c!41585 () Bool)

(declare-fun lt!124341 () (_ BitVec 64))

(assert (=> b!248213 (= c!41585 (= lt!124341 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161003 () SeekEntryResult!1073)

(assert (=> b!248213 (= e!161003 e!161002)))

(declare-fun b!248214 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12221 (_ BitVec 32)) SeekEntryResult!1073)

(assert (=> b!248214 (= e!161002 (seekKeyOrZeroReturnVacant!0 (x!24517 lt!124339) (index!6464 lt!124339) (index!6464 lt!124339) key!932 (_keys!6706 thiss!1504) (mask!10726 thiss!1504)))))

(declare-fun b!248215 () Bool)

(declare-fun e!161001 () SeekEntryResult!1073)

(assert (=> b!248215 (= e!161001 Undefined!1073)))

(declare-fun d!60595 () Bool)

(declare-fun lt!124340 () SeekEntryResult!1073)

(assert (=> d!60595 (and (or ((_ is Undefined!1073) lt!124340) (not ((_ is Found!1073) lt!124340)) (and (bvsge (index!6463 lt!124340) #b00000000000000000000000000000000) (bvslt (index!6463 lt!124340) (size!6141 (_keys!6706 thiss!1504))))) (or ((_ is Undefined!1073) lt!124340) ((_ is Found!1073) lt!124340) (not ((_ is MissingZero!1073) lt!124340)) (and (bvsge (index!6462 lt!124340) #b00000000000000000000000000000000) (bvslt (index!6462 lt!124340) (size!6141 (_keys!6706 thiss!1504))))) (or ((_ is Undefined!1073) lt!124340) ((_ is Found!1073) lt!124340) ((_ is MissingZero!1073) lt!124340) (not ((_ is MissingVacant!1073) lt!124340)) (and (bvsge (index!6465 lt!124340) #b00000000000000000000000000000000) (bvslt (index!6465 lt!124340) (size!6141 (_keys!6706 thiss!1504))))) (or ((_ is Undefined!1073) lt!124340) (ite ((_ is Found!1073) lt!124340) (= (select (arr!5798 (_keys!6706 thiss!1504)) (index!6463 lt!124340)) key!932) (ite ((_ is MissingZero!1073) lt!124340) (= (select (arr!5798 (_keys!6706 thiss!1504)) (index!6462 lt!124340)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1073) lt!124340) (= (select (arr!5798 (_keys!6706 thiss!1504)) (index!6465 lt!124340)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60595 (= lt!124340 e!161001)))

(declare-fun c!41584 () Bool)

(assert (=> d!60595 (= c!41584 (and ((_ is Intermediate!1073) lt!124339) (undefined!1885 lt!124339)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12221 (_ BitVec 32)) SeekEntryResult!1073)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60595 (= lt!124339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10726 thiss!1504)) key!932 (_keys!6706 thiss!1504) (mask!10726 thiss!1504)))))

(assert (=> d!60595 (validMask!0 (mask!10726 thiss!1504))))

(assert (=> d!60595 (= (seekEntryOrOpen!0 key!932 (_keys!6706 thiss!1504) (mask!10726 thiss!1504)) lt!124340)))

(declare-fun b!248216 () Bool)

(assert (=> b!248216 (= e!161001 e!161003)))

(assert (=> b!248216 (= lt!124341 (select (arr!5798 (_keys!6706 thiss!1504)) (index!6464 lt!124339)))))

(declare-fun c!41583 () Bool)

(assert (=> b!248216 (= c!41583 (= lt!124341 key!932))))

(declare-fun b!248217 () Bool)

(assert (=> b!248217 (= e!161003 (Found!1073 (index!6464 lt!124339)))))

(assert (= (and d!60595 c!41584) b!248215))

(assert (= (and d!60595 (not c!41584)) b!248216))

(assert (= (and b!248216 c!41583) b!248217))

(assert (= (and b!248216 (not c!41583)) b!248213))

(assert (= (and b!248213 c!41585) b!248212))

(assert (= (and b!248213 (not c!41585)) b!248214))

(declare-fun m!265203 () Bool)

(assert (=> b!248214 m!265203))

(assert (=> d!60595 m!264941))

(declare-fun m!265205 () Bool)

(assert (=> d!60595 m!265205))

(declare-fun m!265207 () Bool)

(assert (=> d!60595 m!265207))

(declare-fun m!265209 () Bool)

(assert (=> d!60595 m!265209))

(declare-fun m!265211 () Bool)

(assert (=> d!60595 m!265211))

(declare-fun m!265213 () Bool)

(assert (=> d!60595 m!265213))

(assert (=> d!60595 m!265205))

(declare-fun m!265215 () Bool)

(assert (=> b!248216 m!265215))

(assert (=> b!247873 d!60595))

(declare-fun b!248224 () Bool)

(declare-fun e!161009 () Bool)

(assert (=> b!248224 (= e!161009 tp_is_empty!6457)))

(declare-fun b!248225 () Bool)

(declare-fun e!161008 () Bool)

(assert (=> b!248225 (= e!161008 tp_is_empty!6457)))

(declare-fun mapIsEmpty!10970 () Bool)

(declare-fun mapRes!10970 () Bool)

(assert (=> mapIsEmpty!10970 mapRes!10970))

(declare-fun mapNonEmpty!10970 () Bool)

(declare-fun tp!23048 () Bool)

(assert (=> mapNonEmpty!10970 (= mapRes!10970 (and tp!23048 e!161009))))

(declare-fun mapValue!10970 () ValueCell!2885)

(declare-fun mapKey!10970 () (_ BitVec 32))

(declare-fun mapRest!10970 () (Array (_ BitVec 32) ValueCell!2885))

(assert (=> mapNonEmpty!10970 (= mapRest!10961 (store mapRest!10970 mapKey!10970 mapValue!10970))))

(declare-fun condMapEmpty!10970 () Bool)

(declare-fun mapDefault!10970 () ValueCell!2885)

(assert (=> mapNonEmpty!10961 (= condMapEmpty!10970 (= mapRest!10961 ((as const (Array (_ BitVec 32) ValueCell!2885)) mapDefault!10970)))))

(assert (=> mapNonEmpty!10961 (= tp!23032 (and e!161008 mapRes!10970))))

(assert (= (and mapNonEmpty!10961 condMapEmpty!10970) mapIsEmpty!10970))

(assert (= (and mapNonEmpty!10961 (not condMapEmpty!10970)) mapNonEmpty!10970))

(assert (= (and mapNonEmpty!10970 ((_ is ValueCellFull!2885) mapValue!10970)) b!248224))

(assert (= (and mapNonEmpty!10961 ((_ is ValueCellFull!2885) mapDefault!10970)) b!248225))

(declare-fun m!265217 () Bool)

(assert (=> mapNonEmpty!10970 m!265217))

(declare-fun b_lambda!8075 () Bool)

(assert (= b_lambda!8073 (or (and b!247866 b_free!6595) b_lambda!8075)))

(check-sat (not d!60593) (not b!248092) (not b!248109) (not b!248142) (not b!248110) (not bm!23231) (not b!248163) (not bm!23232) (not b!248080) (not b!248129) (not d!60563) (not d!60569) (not b!248093) tp_is_empty!6457 (not d!60561) (not b!248111) (not bm!23228) (not bm!23225) (not b!248128) (not d!60557) (not b!248141) (not b!248157) (not b!248027) (not b!248175) (not b!248214) (not b!248153) (not d!60579) (not b!248094) (not b!248035) (not b!248117) b_and!13617 (not bm!23220) (not bm!23240) (not b!248089) (not d!60587) (not d!60575) (not b!248097) (not b!248172) (not bm!23224) (not b!248037) (not d!60595) (not b!248096) (not b!248132) (not b_next!6595) (not bm!23222) (not b!248091) (not bm!23235) (not b_lambda!8075) (not bm!23241) (not b!248144) (not mapNonEmpty!10970))
(check-sat b_and!13617 (not b_next!6595))
