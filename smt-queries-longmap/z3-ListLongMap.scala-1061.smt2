; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22050 () Bool)

(assert start!22050)

(declare-fun b!227957 () Bool)

(declare-fun b_free!6117 () Bool)

(declare-fun b_next!6117 () Bool)

(assert (=> b!227957 (= b_free!6117 (not b_next!6117))))

(declare-fun tp!21492 () Bool)

(declare-fun b_and!13015 () Bool)

(assert (=> b!227957 (= tp!21492 b_and!13015)))

(declare-fun mapIsEmpty!10138 () Bool)

(declare-fun mapRes!10138 () Bool)

(assert (=> mapIsEmpty!10138 mapRes!10138))

(declare-fun b!227952 () Bool)

(declare-fun e!147896 () Bool)

(declare-fun e!147888 () Bool)

(assert (=> b!227952 (= e!147896 e!147888)))

(declare-fun res!112210 () Bool)

(assert (=> b!227952 (=> (not res!112210) (not e!147888))))

(declare-datatypes ((SeekEntryResult!901 0))(
  ( (MissingZero!901 (index!5774 (_ BitVec 32))) (Found!901 (index!5775 (_ BitVec 32))) (Intermediate!901 (undefined!1713 Bool) (index!5776 (_ BitVec 32)) (x!23305 (_ BitVec 32))) (Undefined!901) (MissingVacant!901 (index!5777 (_ BitVec 32))) )
))
(declare-fun lt!114703 () SeekEntryResult!901)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!227952 (= res!112210 (or (= lt!114703 (MissingZero!901 index!297)) (= lt!114703 (MissingVacant!901 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7619 0))(
  ( (V!7620 (val!3034 Int)) )
))
(declare-datatypes ((ValueCell!2646 0))(
  ( (ValueCellFull!2646 (v!5054 V!7619)) (EmptyCell!2646) )
))
(declare-datatypes ((array!11201 0))(
  ( (array!11202 (arr!5320 (Array (_ BitVec 32) ValueCell!2646)) (size!5653 (_ BitVec 32))) )
))
(declare-datatypes ((array!11203 0))(
  ( (array!11204 (arr!5321 (Array (_ BitVec 32) (_ BitVec 64))) (size!5654 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3192 0))(
  ( (LongMapFixedSize!3193 (defaultEntry!4255 Int) (mask!10121 (_ BitVec 32)) (extraKeys!3992 (_ BitVec 32)) (zeroValue!4096 V!7619) (minValue!4096 V!7619) (_size!1645 (_ BitVec 32)) (_keys!6309 array!11203) (_values!4238 array!11201) (_vacant!1645 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3192)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11203 (_ BitVec 32)) SeekEntryResult!901)

(assert (=> b!227952 (= lt!114703 (seekEntryOrOpen!0 key!932 (_keys!6309 thiss!1504) (mask!10121 thiss!1504)))))

(declare-fun b!227953 () Bool)

(declare-fun e!147891 () Bool)

(declare-fun tp_is_empty!5979 () Bool)

(assert (=> b!227953 (= e!147891 tp_is_empty!5979)))

(declare-fun b!227954 () Bool)

(declare-fun c!37798 () Bool)

(get-info :version)

(assert (=> b!227954 (= c!37798 ((_ is MissingVacant!901) lt!114703))))

(declare-fun e!147886 () Bool)

(declare-fun e!147893 () Bool)

(assert (=> b!227954 (= e!147886 e!147893)))

(declare-fun b!227955 () Bool)

(declare-fun e!147897 () Bool)

(declare-fun call!21185 () Bool)

(assert (=> b!227955 (= e!147897 (not call!21185))))

(declare-fun b!227956 () Bool)

(declare-fun res!112208 () Bool)

(assert (=> b!227956 (=> (not res!112208) (not e!147896))))

(assert (=> b!227956 (= res!112208 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!147887 () Bool)

(declare-fun e!147892 () Bool)

(declare-fun array_inv!3519 (array!11203) Bool)

(declare-fun array_inv!3520 (array!11201) Bool)

(assert (=> b!227957 (= e!147892 (and tp!21492 tp_is_empty!5979 (array_inv!3519 (_keys!6309 thiss!1504)) (array_inv!3520 (_values!4238 thiss!1504)) e!147887))))

(declare-fun b!227958 () Bool)

(declare-fun e!147885 () Bool)

(assert (=> b!227958 (= e!147885 (not call!21185))))

(declare-fun b!227959 () Bool)

(declare-datatypes ((Unit!6921 0))(
  ( (Unit!6922) )
))
(declare-fun e!147899 () Unit!6921)

(declare-fun Unit!6923 () Unit!6921)

(assert (=> b!227959 (= e!147899 Unit!6923)))

(declare-fun lt!114700 () Unit!6921)

(declare-fun lemmaArrayContainsKeyThenInListMap!106 (array!11203 array!11201 (_ BitVec 32) (_ BitVec 32) V!7619 V!7619 (_ BitVec 64) (_ BitVec 32) Int) Unit!6921)

(assert (=> b!227959 (= lt!114700 (lemmaArrayContainsKeyThenInListMap!106 (_keys!6309 thiss!1504) (_values!4238 thiss!1504) (mask!10121 thiss!1504) (extraKeys!3992 thiss!1504) (zeroValue!4096 thiss!1504) (minValue!4096 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4255 thiss!1504)))))

(assert (=> b!227959 false))

(declare-fun b!227960 () Bool)

(declare-fun res!112209 () Bool)

(declare-fun e!147894 () Bool)

(assert (=> b!227960 (=> res!112209 e!147894)))

(assert (=> b!227960 (= res!112209 (or (not (= (size!5653 (_values!4238 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10121 thiss!1504)))) (not (= (size!5654 (_keys!6309 thiss!1504)) (size!5653 (_values!4238 thiss!1504)))) (bvslt (mask!10121 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3992 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3992 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun bm!21183 () Bool)

(declare-fun arrayContainsKey!0 (array!11203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21183 (= call!21185 (arrayContainsKey!0 (_keys!6309 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227961 () Bool)

(declare-fun e!147898 () Bool)

(assert (=> b!227961 (= e!147888 e!147898)))

(declare-fun res!112214 () Bool)

(assert (=> b!227961 (=> (not res!112214) (not e!147898))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227961 (= res!112214 (inRange!0 index!297 (mask!10121 thiss!1504)))))

(declare-fun lt!114701 () Unit!6921)

(declare-fun e!147889 () Unit!6921)

(assert (=> b!227961 (= lt!114701 e!147889)))

(declare-fun c!37800 () Bool)

(declare-datatypes ((tuple2!4480 0))(
  ( (tuple2!4481 (_1!2251 (_ BitVec 64)) (_2!2251 V!7619)) )
))
(declare-datatypes ((List!3401 0))(
  ( (Nil!3398) (Cons!3397 (h!4045 tuple2!4480) (t!8360 List!3401)) )
))
(declare-datatypes ((ListLongMap!3393 0))(
  ( (ListLongMap!3394 (toList!1712 List!3401)) )
))
(declare-fun contains!1586 (ListLongMap!3393 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1240 (array!11203 array!11201 (_ BitVec 32) (_ BitVec 32) V!7619 V!7619 (_ BitVec 32) Int) ListLongMap!3393)

(assert (=> b!227961 (= c!37800 (contains!1586 (getCurrentListMap!1240 (_keys!6309 thiss!1504) (_values!4238 thiss!1504) (mask!10121 thiss!1504) (extraKeys!3992 thiss!1504) (zeroValue!4096 thiss!1504) (minValue!4096 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4255 thiss!1504)) key!932))))

(declare-fun b!227962 () Bool)

(declare-fun res!112216 () Bool)

(assert (=> b!227962 (=> res!112216 e!147894)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11203 (_ BitVec 32)) Bool)

(assert (=> b!227962 (= res!112216 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6309 thiss!1504) (mask!10121 thiss!1504))))))

(declare-fun b!227963 () Bool)

(declare-fun lt!114697 () Unit!6921)

(assert (=> b!227963 (= e!147889 lt!114697)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!284 (array!11203 array!11201 (_ BitVec 32) (_ BitVec 32) V!7619 V!7619 (_ BitVec 64) Int) Unit!6921)

(assert (=> b!227963 (= lt!114697 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!284 (_keys!6309 thiss!1504) (_values!4238 thiss!1504) (mask!10121 thiss!1504) (extraKeys!3992 thiss!1504) (zeroValue!4096 thiss!1504) (minValue!4096 thiss!1504) key!932 (defaultEntry!4255 thiss!1504)))))

(declare-fun c!37797 () Bool)

(assert (=> b!227963 (= c!37797 ((_ is MissingZero!901) lt!114703))))

(assert (=> b!227963 e!147886))

(declare-fun b!227964 () Bool)

(declare-fun Unit!6924 () Unit!6921)

(assert (=> b!227964 (= e!147889 Unit!6924)))

(declare-fun lt!114695 () Unit!6921)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!269 (array!11203 array!11201 (_ BitVec 32) (_ BitVec 32) V!7619 V!7619 (_ BitVec 64) Int) Unit!6921)

(assert (=> b!227964 (= lt!114695 (lemmaInListMapThenSeekEntryOrOpenFindsIt!269 (_keys!6309 thiss!1504) (_values!4238 thiss!1504) (mask!10121 thiss!1504) (extraKeys!3992 thiss!1504) (zeroValue!4096 thiss!1504) (minValue!4096 thiss!1504) key!932 (defaultEntry!4255 thiss!1504)))))

(assert (=> b!227964 false))

(declare-fun b!227965 () Bool)

(assert (=> b!227965 (= e!147893 e!147897)))

(declare-fun res!112206 () Bool)

(declare-fun call!21186 () Bool)

(assert (=> b!227965 (= res!112206 call!21186)))

(assert (=> b!227965 (=> (not res!112206) (not e!147897))))

(declare-fun b!227966 () Bool)

(declare-fun e!147890 () Bool)

(assert (=> b!227966 (= e!147890 tp_is_empty!5979)))

(declare-fun b!227967 () Bool)

(declare-fun res!112207 () Bool)

(assert (=> b!227967 (= res!112207 (= (select (arr!5321 (_keys!6309 thiss!1504)) (index!5777 lt!114703)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227967 (=> (not res!112207) (not e!147897))))

(declare-fun b!227968 () Bool)

(assert (=> b!227968 (= e!147887 (and e!147891 mapRes!10138))))

(declare-fun condMapEmpty!10138 () Bool)

(declare-fun mapDefault!10138 () ValueCell!2646)

(assert (=> b!227968 (= condMapEmpty!10138 (= (arr!5320 (_values!4238 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2646)) mapDefault!10138)))))

(declare-fun res!112212 () Bool)

(assert (=> start!22050 (=> (not res!112212) (not e!147896))))

(declare-fun valid!1279 (LongMapFixedSize!3192) Bool)

(assert (=> start!22050 (= res!112212 (valid!1279 thiss!1504))))

(assert (=> start!22050 e!147896))

(assert (=> start!22050 e!147892))

(assert (=> start!22050 true))

(declare-fun bm!21182 () Bool)

(assert (=> bm!21182 (= call!21186 (inRange!0 (ite c!37797 (index!5774 lt!114703) (index!5777 lt!114703)) (mask!10121 thiss!1504)))))

(declare-fun b!227969 () Bool)

(declare-fun res!112215 () Bool)

(assert (=> b!227969 (=> (not res!112215) (not e!147885))))

(assert (=> b!227969 (= res!112215 call!21186)))

(assert (=> b!227969 (= e!147886 e!147885)))

(declare-fun b!227970 () Bool)

(assert (=> b!227970 (= e!147894 true)))

(declare-fun lt!114696 () Bool)

(declare-datatypes ((List!3402 0))(
  ( (Nil!3399) (Cons!3398 (h!4046 (_ BitVec 64)) (t!8361 List!3402)) )
))
(declare-fun arrayNoDuplicates!0 (array!11203 (_ BitVec 32) List!3402) Bool)

(assert (=> b!227970 (= lt!114696 (arrayNoDuplicates!0 (_keys!6309 thiss!1504) #b00000000000000000000000000000000 Nil!3399))))

(declare-fun b!227971 () Bool)

(assert (=> b!227971 (= e!147893 ((_ is Undefined!901) lt!114703))))

(declare-fun b!227972 () Bool)

(assert (=> b!227972 (= e!147898 (not e!147894))))

(declare-fun res!112213 () Bool)

(assert (=> b!227972 (=> res!112213 e!147894)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227972 (= res!112213 (not (validMask!0 (mask!10121 thiss!1504))))))

(declare-fun lt!114694 () array!11203)

(assert (=> b!227972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114694 (mask!10121 thiss!1504))))

(declare-fun lt!114699 () Unit!6921)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11203 (_ BitVec 32) (_ BitVec 32)) Unit!6921)

(assert (=> b!227972 (= lt!114699 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6309 thiss!1504) index!297 (mask!10121 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11203 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227972 (= (arrayCountValidKeys!0 lt!114694 #b00000000000000000000000000000000 (size!5654 (_keys!6309 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6309 thiss!1504) #b00000000000000000000000000000000 (size!5654 (_keys!6309 thiss!1504)))))))

(declare-fun lt!114698 () Unit!6921)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11203 (_ BitVec 32) (_ BitVec 64)) Unit!6921)

(assert (=> b!227972 (= lt!114698 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6309 thiss!1504) index!297 key!932))))

(assert (=> b!227972 (arrayNoDuplicates!0 lt!114694 #b00000000000000000000000000000000 Nil!3399)))

(assert (=> b!227972 (= lt!114694 (array!11204 (store (arr!5321 (_keys!6309 thiss!1504)) index!297 key!932) (size!5654 (_keys!6309 thiss!1504))))))

(declare-fun lt!114704 () Unit!6921)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11203 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3402) Unit!6921)

(assert (=> b!227972 (= lt!114704 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6309 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3399))))

(declare-fun lt!114702 () Unit!6921)

(assert (=> b!227972 (= lt!114702 e!147899)))

(declare-fun c!37799 () Bool)

(assert (=> b!227972 (= c!37799 (arrayContainsKey!0 (_keys!6309 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10138 () Bool)

(declare-fun tp!21493 () Bool)

(assert (=> mapNonEmpty!10138 (= mapRes!10138 (and tp!21493 e!147890))))

(declare-fun mapRest!10138 () (Array (_ BitVec 32) ValueCell!2646))

(declare-fun mapValue!10138 () ValueCell!2646)

(declare-fun mapKey!10138 () (_ BitVec 32))

(assert (=> mapNonEmpty!10138 (= (arr!5320 (_values!4238 thiss!1504)) (store mapRest!10138 mapKey!10138 mapValue!10138))))

(declare-fun b!227973 () Bool)

(declare-fun Unit!6925 () Unit!6921)

(assert (=> b!227973 (= e!147899 Unit!6925)))

(declare-fun b!227974 () Bool)

(declare-fun res!112211 () Bool)

(assert (=> b!227974 (=> (not res!112211) (not e!147885))))

(assert (=> b!227974 (= res!112211 (= (select (arr!5321 (_keys!6309 thiss!1504)) (index!5774 lt!114703)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!22050 res!112212) b!227956))

(assert (= (and b!227956 res!112208) b!227952))

(assert (= (and b!227952 res!112210) b!227961))

(assert (= (and b!227961 c!37800) b!227964))

(assert (= (and b!227961 (not c!37800)) b!227963))

(assert (= (and b!227963 c!37797) b!227969))

(assert (= (and b!227963 (not c!37797)) b!227954))

(assert (= (and b!227969 res!112215) b!227974))

(assert (= (and b!227974 res!112211) b!227958))

(assert (= (and b!227954 c!37798) b!227965))

(assert (= (and b!227954 (not c!37798)) b!227971))

(assert (= (and b!227965 res!112206) b!227967))

(assert (= (and b!227967 res!112207) b!227955))

(assert (= (or b!227969 b!227965) bm!21182))

(assert (= (or b!227958 b!227955) bm!21183))

(assert (= (and b!227961 res!112214) b!227972))

(assert (= (and b!227972 c!37799) b!227959))

(assert (= (and b!227972 (not c!37799)) b!227973))

(assert (= (and b!227972 (not res!112213)) b!227960))

(assert (= (and b!227960 (not res!112209)) b!227962))

(assert (= (and b!227962 (not res!112216)) b!227970))

(assert (= (and b!227968 condMapEmpty!10138) mapIsEmpty!10138))

(assert (= (and b!227968 (not condMapEmpty!10138)) mapNonEmpty!10138))

(assert (= (and mapNonEmpty!10138 ((_ is ValueCellFull!2646) mapValue!10138)) b!227966))

(assert (= (and b!227968 ((_ is ValueCellFull!2646) mapDefault!10138)) b!227953))

(assert (= b!227957 b!227968))

(assert (= start!22050 b!227957))

(declare-fun m!249831 () Bool)

(assert (=> start!22050 m!249831))

(declare-fun m!249833 () Bool)

(assert (=> mapNonEmpty!10138 m!249833))

(declare-fun m!249835 () Bool)

(assert (=> b!227964 m!249835))

(declare-fun m!249837 () Bool)

(assert (=> bm!21182 m!249837))

(declare-fun m!249839 () Bool)

(assert (=> b!227959 m!249839))

(declare-fun m!249841 () Bool)

(assert (=> b!227967 m!249841))

(declare-fun m!249843 () Bool)

(assert (=> b!227961 m!249843))

(declare-fun m!249845 () Bool)

(assert (=> b!227961 m!249845))

(assert (=> b!227961 m!249845))

(declare-fun m!249847 () Bool)

(assert (=> b!227961 m!249847))

(declare-fun m!249849 () Bool)

(assert (=> b!227974 m!249849))

(declare-fun m!249851 () Bool)

(assert (=> b!227970 m!249851))

(declare-fun m!249853 () Bool)

(assert (=> b!227952 m!249853))

(declare-fun m!249855 () Bool)

(assert (=> b!227963 m!249855))

(declare-fun m!249857 () Bool)

(assert (=> b!227957 m!249857))

(declare-fun m!249859 () Bool)

(assert (=> b!227957 m!249859))

(declare-fun m!249861 () Bool)

(assert (=> b!227962 m!249861))

(declare-fun m!249863 () Bool)

(assert (=> bm!21183 m!249863))

(declare-fun m!249865 () Bool)

(assert (=> b!227972 m!249865))

(assert (=> b!227972 m!249863))

(declare-fun m!249867 () Bool)

(assert (=> b!227972 m!249867))

(declare-fun m!249869 () Bool)

(assert (=> b!227972 m!249869))

(declare-fun m!249871 () Bool)

(assert (=> b!227972 m!249871))

(declare-fun m!249873 () Bool)

(assert (=> b!227972 m!249873))

(declare-fun m!249875 () Bool)

(assert (=> b!227972 m!249875))

(declare-fun m!249877 () Bool)

(assert (=> b!227972 m!249877))

(declare-fun m!249879 () Bool)

(assert (=> b!227972 m!249879))

(declare-fun m!249881 () Bool)

(assert (=> b!227972 m!249881))

(check-sat (not mapNonEmpty!10138) (not b!227952) (not b!227962) (not b!227970) (not b!227957) (not start!22050) (not bm!21182) (not b!227964) b_and!13015 tp_is_empty!5979 (not b_next!6117) (not b!227963) (not b!227961) (not b!227972) (not bm!21183) (not b!227959))
(check-sat b_and!13015 (not b_next!6117))
