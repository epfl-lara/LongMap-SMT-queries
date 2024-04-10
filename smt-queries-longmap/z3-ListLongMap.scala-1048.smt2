; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21972 () Bool)

(assert start!21972)

(declare-fun b!225140 () Bool)

(declare-fun b_free!6039 () Bool)

(declare-fun b_next!6039 () Bool)

(assert (=> b!225140 (= b_free!6039 (not b_next!6039))))

(declare-fun tp!21258 () Bool)

(declare-fun b_and!12937 () Bool)

(assert (=> b!225140 (= tp!21258 b_and!12937)))

(declare-fun mapIsEmpty!10021 () Bool)

(declare-fun mapRes!10021 () Bool)

(assert (=> mapIsEmpty!10021 mapRes!10021))

(declare-fun b!225127 () Bool)

(declare-datatypes ((Unit!6785 0))(
  ( (Unit!6786) )
))
(declare-fun e!146131 () Unit!6785)

(declare-fun Unit!6787 () Unit!6785)

(assert (=> b!225127 (= e!146131 Unit!6787)))

(declare-fun lt!113407 () Unit!6785)

(declare-datatypes ((V!7515 0))(
  ( (V!7516 (val!2995 Int)) )
))
(declare-datatypes ((ValueCell!2607 0))(
  ( (ValueCellFull!2607 (v!5015 V!7515)) (EmptyCell!2607) )
))
(declare-datatypes ((array!11045 0))(
  ( (array!11046 (arr!5242 (Array (_ BitVec 32) ValueCell!2607)) (size!5575 (_ BitVec 32))) )
))
(declare-datatypes ((array!11047 0))(
  ( (array!11048 (arr!5243 (Array (_ BitVec 32) (_ BitVec 64))) (size!5576 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3114 0))(
  ( (LongMapFixedSize!3115 (defaultEntry!4216 Int) (mask!10056 (_ BitVec 32)) (extraKeys!3953 (_ BitVec 32)) (zeroValue!4057 V!7515) (minValue!4057 V!7515) (_size!1606 (_ BitVec 32)) (_keys!6270 array!11047) (_values!4199 array!11045) (_vacant!1606 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3114)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!85 (array!11047 array!11045 (_ BitVec 32) (_ BitVec 32) V!7515 V!7515 (_ BitVec 64) (_ BitVec 32) Int) Unit!6785)

(assert (=> b!225127 (= lt!113407 (lemmaArrayContainsKeyThenInListMap!85 (_keys!6270 thiss!1504) (_values!4199 thiss!1504) (mask!10056 thiss!1504) (extraKeys!3953 thiss!1504) (zeroValue!4057 thiss!1504) (minValue!4057 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4216 thiss!1504)))))

(assert (=> b!225127 false))

(declare-fun b!225128 () Bool)

(declare-fun e!146139 () Bool)

(declare-fun e!146134 () Bool)

(assert (=> b!225128 (= e!146139 (not e!146134))))

(declare-fun res!110794 () Bool)

(assert (=> b!225128 (=> res!110794 e!146134)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225128 (= res!110794 (not (validMask!0 (mask!10056 thiss!1504))))))

(declare-fun lt!113415 () array!11047)

(declare-fun arrayCountValidKeys!0 (array!11047 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225128 (= (arrayCountValidKeys!0 lt!113415 #b00000000000000000000000000000000 (size!5576 (_keys!6270 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6270 thiss!1504) #b00000000000000000000000000000000 (size!5576 (_keys!6270 thiss!1504)))))))

(declare-fun lt!113413 () Unit!6785)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11047 (_ BitVec 32) (_ BitVec 64)) Unit!6785)

(assert (=> b!225128 (= lt!113413 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6270 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3350 0))(
  ( (Nil!3347) (Cons!3346 (h!3994 (_ BitVec 64)) (t!8309 List!3350)) )
))
(declare-fun arrayNoDuplicates!0 (array!11047 (_ BitVec 32) List!3350) Bool)

(assert (=> b!225128 (arrayNoDuplicates!0 lt!113415 #b00000000000000000000000000000000 Nil!3347)))

(assert (=> b!225128 (= lt!113415 (array!11048 (store (arr!5243 (_keys!6270 thiss!1504)) index!297 key!932) (size!5576 (_keys!6270 thiss!1504))))))

(declare-fun lt!113416 () Unit!6785)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11047 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3350) Unit!6785)

(assert (=> b!225128 (= lt!113416 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6270 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3347))))

(declare-fun lt!113417 () Unit!6785)

(assert (=> b!225128 (= lt!113417 e!146131)))

(declare-fun c!37329 () Bool)

(declare-fun lt!113412 () Bool)

(assert (=> b!225128 (= c!37329 lt!113412)))

(declare-fun arrayContainsKey!0 (array!11047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225128 (= lt!113412 (arrayContainsKey!0 (_keys!6270 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10021 () Bool)

(declare-fun tp!21259 () Bool)

(declare-fun e!146137 () Bool)

(assert (=> mapNonEmpty!10021 (= mapRes!10021 (and tp!21259 e!146137))))

(declare-fun mapKey!10021 () (_ BitVec 32))

(declare-fun mapRest!10021 () (Array (_ BitVec 32) ValueCell!2607))

(declare-fun mapValue!10021 () ValueCell!2607)

(assert (=> mapNonEmpty!10021 (= (arr!5242 (_values!4199 thiss!1504)) (store mapRest!10021 mapKey!10021 mapValue!10021))))

(declare-fun b!225129 () Bool)

(declare-fun res!110796 () Bool)

(declare-fun e!146142 () Bool)

(assert (=> b!225129 (=> (not res!110796) (not e!146142))))

(assert (=> b!225129 (= res!110796 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!225131 () Bool)

(declare-fun tp_is_empty!5901 () Bool)

(assert (=> b!225131 (= e!146137 tp_is_empty!5901)))

(declare-fun b!225132 () Bool)

(declare-fun e!146141 () Unit!6785)

(declare-fun lt!113409 () Unit!6785)

(assert (=> b!225132 (= e!146141 lt!113409)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!257 (array!11047 array!11045 (_ BitVec 32) (_ BitVec 32) V!7515 V!7515 (_ BitVec 64) Int) Unit!6785)

(assert (=> b!225132 (= lt!113409 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!257 (_keys!6270 thiss!1504) (_values!4199 thiss!1504) (mask!10056 thiss!1504) (extraKeys!3953 thiss!1504) (zeroValue!4057 thiss!1504) (minValue!4057 thiss!1504) key!932 (defaultEntry!4216 thiss!1504)))))

(declare-fun c!37330 () Bool)

(declare-datatypes ((SeekEntryResult!865 0))(
  ( (MissingZero!865 (index!5630 (_ BitVec 32))) (Found!865 (index!5631 (_ BitVec 32))) (Intermediate!865 (undefined!1677 Bool) (index!5632 (_ BitVec 32)) (x!23165 (_ BitVec 32))) (Undefined!865) (MissingVacant!865 (index!5633 (_ BitVec 32))) )
))
(declare-fun lt!113410 () SeekEntryResult!865)

(get-info :version)

(assert (=> b!225132 (= c!37330 ((_ is MissingZero!865) lt!113410))))

(declare-fun e!146136 () Bool)

(assert (=> b!225132 e!146136))

(declare-fun bm!20948 () Bool)

(declare-fun call!20951 () Bool)

(assert (=> bm!20948 (= call!20951 (arrayContainsKey!0 (_keys!6270 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225133 () Bool)

(declare-fun e!146143 () Bool)

(assert (=> b!225133 (= e!146142 e!146143)))

(declare-fun res!110797 () Bool)

(assert (=> b!225133 (=> (not res!110797) (not e!146143))))

(assert (=> b!225133 (= res!110797 (or (= lt!113410 (MissingZero!865 index!297)) (= lt!113410 (MissingVacant!865 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11047 (_ BitVec 32)) SeekEntryResult!865)

(assert (=> b!225133 (= lt!113410 (seekEntryOrOpen!0 key!932 (_keys!6270 thiss!1504) (mask!10056 thiss!1504)))))

(declare-fun b!225134 () Bool)

(declare-fun res!110792 () Bool)

(assert (=> b!225134 (=> res!110792 e!146134)))

(assert (=> b!225134 (= res!110792 (or (not (= (size!5576 (_keys!6270 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10056 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5576 (_keys!6270 thiss!1504)))))))

(declare-fun b!225135 () Bool)

(declare-fun res!110789 () Bool)

(declare-fun e!146144 () Bool)

(assert (=> b!225135 (=> (not res!110789) (not e!146144))))

(declare-fun call!20952 () Bool)

(assert (=> b!225135 (= res!110789 call!20952)))

(assert (=> b!225135 (= e!146136 e!146144)))

(declare-fun b!225136 () Bool)

(declare-fun res!110785 () Bool)

(assert (=> b!225136 (=> (not res!110785) (not e!146144))))

(assert (=> b!225136 (= res!110785 (= (select (arr!5243 (_keys!6270 thiss!1504)) (index!5630 lt!113410)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225137 () Bool)

(declare-fun res!110793 () Bool)

(assert (=> b!225137 (=> res!110793 e!146134)))

(assert (=> b!225137 (= res!110793 lt!113412)))

(declare-fun b!225138 () Bool)

(declare-fun e!146130 () Bool)

(assert (=> b!225138 (= e!146130 tp_is_empty!5901)))

(declare-fun b!225139 () Bool)

(assert (=> b!225139 (= e!146143 e!146139)))

(declare-fun res!110786 () Bool)

(assert (=> b!225139 (=> (not res!110786) (not e!146139))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225139 (= res!110786 (inRange!0 index!297 (mask!10056 thiss!1504)))))

(declare-fun lt!113408 () Unit!6785)

(assert (=> b!225139 (= lt!113408 e!146141)))

(declare-fun c!37332 () Bool)

(declare-datatypes ((tuple2!4438 0))(
  ( (tuple2!4439 (_1!2230 (_ BitVec 64)) (_2!2230 V!7515)) )
))
(declare-datatypes ((List!3351 0))(
  ( (Nil!3348) (Cons!3347 (h!3995 tuple2!4438) (t!8310 List!3351)) )
))
(declare-datatypes ((ListLongMap!3351 0))(
  ( (ListLongMap!3352 (toList!1691 List!3351)) )
))
(declare-fun contains!1565 (ListLongMap!3351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1219 (array!11047 array!11045 (_ BitVec 32) (_ BitVec 32) V!7515 V!7515 (_ BitVec 32) Int) ListLongMap!3351)

(assert (=> b!225139 (= c!37332 (contains!1565 (getCurrentListMap!1219 (_keys!6270 thiss!1504) (_values!4199 thiss!1504) (mask!10056 thiss!1504) (extraKeys!3953 thiss!1504) (zeroValue!4057 thiss!1504) (minValue!4057 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4216 thiss!1504)) key!932))))

(declare-fun e!146132 () Bool)

(declare-fun e!146138 () Bool)

(declare-fun array_inv!3471 (array!11047) Bool)

(declare-fun array_inv!3472 (array!11045) Bool)

(assert (=> b!225140 (= e!146132 (and tp!21258 tp_is_empty!5901 (array_inv!3471 (_keys!6270 thiss!1504)) (array_inv!3472 (_values!4199 thiss!1504)) e!146138))))

(declare-fun b!225141 () Bool)

(assert (=> b!225141 (= e!146134 true)))

(declare-fun lt!113414 () Bool)

(assert (=> b!225141 (= lt!113414 (arrayNoDuplicates!0 (_keys!6270 thiss!1504) #b00000000000000000000000000000000 Nil!3347))))

(declare-fun b!225142 () Bool)

(declare-fun res!110788 () Bool)

(assert (=> b!225142 (=> res!110788 e!146134)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11047 (_ BitVec 32)) Bool)

(assert (=> b!225142 (= res!110788 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6270 thiss!1504) (mask!10056 thiss!1504))))))

(declare-fun b!225143 () Bool)

(declare-fun res!110787 () Bool)

(assert (=> b!225143 (= res!110787 (= (select (arr!5243 (_keys!6270 thiss!1504)) (index!5633 lt!113410)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146133 () Bool)

(assert (=> b!225143 (=> (not res!110787) (not e!146133))))

(declare-fun b!225144 () Bool)

(declare-fun c!37331 () Bool)

(assert (=> b!225144 (= c!37331 ((_ is MissingVacant!865) lt!113410))))

(declare-fun e!146135 () Bool)

(assert (=> b!225144 (= e!146136 e!146135)))

(declare-fun b!225145 () Bool)

(declare-fun res!110790 () Bool)

(assert (=> b!225145 (=> res!110790 e!146134)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225145 (= res!110790 (not (validKeyInArray!0 key!932)))))

(declare-fun res!110795 () Bool)

(assert (=> start!21972 (=> (not res!110795) (not e!146142))))

(declare-fun valid!1256 (LongMapFixedSize!3114) Bool)

(assert (=> start!21972 (= res!110795 (valid!1256 thiss!1504))))

(assert (=> start!21972 e!146142))

(assert (=> start!21972 e!146132))

(assert (=> start!21972 true))

(declare-fun b!225130 () Bool)

(declare-fun Unit!6788 () Unit!6785)

(assert (=> b!225130 (= e!146131 Unit!6788)))

(declare-fun b!225146 () Bool)

(assert (=> b!225146 (= e!146135 e!146133)))

(declare-fun res!110791 () Bool)

(assert (=> b!225146 (= res!110791 call!20952)))

(assert (=> b!225146 (=> (not res!110791) (not e!146133))))

(declare-fun b!225147 () Bool)

(assert (=> b!225147 (= e!146133 (not call!20951))))

(declare-fun b!225148 () Bool)

(assert (=> b!225148 (= e!146135 ((_ is Undefined!865) lt!113410))))

(declare-fun b!225149 () Bool)

(assert (=> b!225149 (= e!146138 (and e!146130 mapRes!10021))))

(declare-fun condMapEmpty!10021 () Bool)

(declare-fun mapDefault!10021 () ValueCell!2607)

(assert (=> b!225149 (= condMapEmpty!10021 (= (arr!5242 (_values!4199 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2607)) mapDefault!10021)))))

(declare-fun b!225150 () Bool)

(declare-fun Unit!6789 () Unit!6785)

(assert (=> b!225150 (= e!146141 Unit!6789)))

(declare-fun lt!113411 () Unit!6785)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!246 (array!11047 array!11045 (_ BitVec 32) (_ BitVec 32) V!7515 V!7515 (_ BitVec 64) Int) Unit!6785)

(assert (=> b!225150 (= lt!113411 (lemmaInListMapThenSeekEntryOrOpenFindsIt!246 (_keys!6270 thiss!1504) (_values!4199 thiss!1504) (mask!10056 thiss!1504) (extraKeys!3953 thiss!1504) (zeroValue!4057 thiss!1504) (minValue!4057 thiss!1504) key!932 (defaultEntry!4216 thiss!1504)))))

(assert (=> b!225150 false))

(declare-fun bm!20949 () Bool)

(assert (=> bm!20949 (= call!20952 (inRange!0 (ite c!37330 (index!5630 lt!113410) (index!5633 lt!113410)) (mask!10056 thiss!1504)))))

(declare-fun b!225151 () Bool)

(assert (=> b!225151 (= e!146144 (not call!20951))))

(assert (= (and start!21972 res!110795) b!225129))

(assert (= (and b!225129 res!110796) b!225133))

(assert (= (and b!225133 res!110797) b!225139))

(assert (= (and b!225139 c!37332) b!225150))

(assert (= (and b!225139 (not c!37332)) b!225132))

(assert (= (and b!225132 c!37330) b!225135))

(assert (= (and b!225132 (not c!37330)) b!225144))

(assert (= (and b!225135 res!110789) b!225136))

(assert (= (and b!225136 res!110785) b!225151))

(assert (= (and b!225144 c!37331) b!225146))

(assert (= (and b!225144 (not c!37331)) b!225148))

(assert (= (and b!225146 res!110791) b!225143))

(assert (= (and b!225143 res!110787) b!225147))

(assert (= (or b!225135 b!225146) bm!20949))

(assert (= (or b!225151 b!225147) bm!20948))

(assert (= (and b!225139 res!110786) b!225128))

(assert (= (and b!225128 c!37329) b!225127))

(assert (= (and b!225128 (not c!37329)) b!225130))

(assert (= (and b!225128 (not res!110794)) b!225134))

(assert (= (and b!225134 (not res!110792)) b!225145))

(assert (= (and b!225145 (not res!110790)) b!225137))

(assert (= (and b!225137 (not res!110793)) b!225142))

(assert (= (and b!225142 (not res!110788)) b!225141))

(assert (= (and b!225149 condMapEmpty!10021) mapIsEmpty!10021))

(assert (= (and b!225149 (not condMapEmpty!10021)) mapNonEmpty!10021))

(assert (= (and mapNonEmpty!10021 ((_ is ValueCellFull!2607) mapValue!10021)) b!225131))

(assert (= (and b!225149 ((_ is ValueCellFull!2607) mapDefault!10021)) b!225138))

(assert (= b!225140 b!225149))

(assert (= start!21972 b!225140))

(declare-fun m!247849 () Bool)

(assert (=> b!225150 m!247849))

(declare-fun m!247851 () Bool)

(assert (=> b!225141 m!247851))

(declare-fun m!247853 () Bool)

(assert (=> bm!20948 m!247853))

(declare-fun m!247855 () Bool)

(assert (=> b!225140 m!247855))

(declare-fun m!247857 () Bool)

(assert (=> b!225140 m!247857))

(declare-fun m!247859 () Bool)

(assert (=> b!225136 m!247859))

(declare-fun m!247861 () Bool)

(assert (=> bm!20949 m!247861))

(declare-fun m!247863 () Bool)

(assert (=> b!225132 m!247863))

(declare-fun m!247865 () Bool)

(assert (=> mapNonEmpty!10021 m!247865))

(declare-fun m!247867 () Bool)

(assert (=> b!225127 m!247867))

(assert (=> b!225128 m!247853))

(declare-fun m!247869 () Bool)

(assert (=> b!225128 m!247869))

(declare-fun m!247871 () Bool)

(assert (=> b!225128 m!247871))

(declare-fun m!247873 () Bool)

(assert (=> b!225128 m!247873))

(declare-fun m!247875 () Bool)

(assert (=> b!225128 m!247875))

(declare-fun m!247877 () Bool)

(assert (=> b!225128 m!247877))

(declare-fun m!247879 () Bool)

(assert (=> b!225128 m!247879))

(declare-fun m!247881 () Bool)

(assert (=> b!225128 m!247881))

(declare-fun m!247883 () Bool)

(assert (=> start!21972 m!247883))

(declare-fun m!247885 () Bool)

(assert (=> b!225143 m!247885))

(declare-fun m!247887 () Bool)

(assert (=> b!225142 m!247887))

(declare-fun m!247889 () Bool)

(assert (=> b!225139 m!247889))

(declare-fun m!247891 () Bool)

(assert (=> b!225139 m!247891))

(assert (=> b!225139 m!247891))

(declare-fun m!247893 () Bool)

(assert (=> b!225139 m!247893))

(declare-fun m!247895 () Bool)

(assert (=> b!225145 m!247895))

(declare-fun m!247897 () Bool)

(assert (=> b!225133 m!247897))

(check-sat b_and!12937 (not mapNonEmpty!10021) (not b!225141) (not b!225142) (not b!225140) (not b!225128) (not b!225145) (not b!225150) (not bm!20949) (not b!225139) (not b!225132) (not b!225127) (not bm!20948) (not b_next!6039) (not b!225133) (not start!21972) tp_is_empty!5901)
(check-sat b_and!12937 (not b_next!6039))
