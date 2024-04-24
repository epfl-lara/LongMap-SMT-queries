; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22052 () Bool)

(assert start!22052)

(declare-fun b!227935 () Bool)

(declare-fun b_free!6115 () Bool)

(declare-fun b_next!6115 () Bool)

(assert (=> b!227935 (= b_free!6115 (not b_next!6115))))

(declare-fun tp!21486 () Bool)

(declare-fun b_and!13027 () Bool)

(assert (=> b!227935 (= tp!21486 b_and!13027)))

(declare-fun b!227930 () Bool)

(declare-datatypes ((Unit!6895 0))(
  ( (Unit!6896) )
))
(declare-fun e!147868 () Unit!6895)

(declare-fun Unit!6897 () Unit!6895)

(assert (=> b!227930 (= e!147868 Unit!6897)))

(declare-fun lt!114724 () Unit!6895)

(declare-datatypes ((V!7617 0))(
  ( (V!7618 (val!3033 Int)) )
))
(declare-datatypes ((ValueCell!2645 0))(
  ( (ValueCellFull!2645 (v!5054 V!7617)) (EmptyCell!2645) )
))
(declare-datatypes ((array!11195 0))(
  ( (array!11196 (arr!5317 (Array (_ BitVec 32) ValueCell!2645)) (size!5650 (_ BitVec 32))) )
))
(declare-datatypes ((array!11197 0))(
  ( (array!11198 (arr!5318 (Array (_ BitVec 32) (_ BitVec 64))) (size!5651 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3190 0))(
  ( (LongMapFixedSize!3191 (defaultEntry!4254 Int) (mask!10120 (_ BitVec 32)) (extraKeys!3991 (_ BitVec 32)) (zeroValue!4095 V!7617) (minValue!4095 V!7617) (_size!1644 (_ BitVec 32)) (_keys!6308 array!11197) (_values!4237 array!11195) (_vacant!1644 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3190)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!108 (array!11197 array!11195 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 64) (_ BitVec 32) Int) Unit!6895)

(assert (=> b!227930 (= lt!114724 (lemmaArrayContainsKeyThenInListMap!108 (_keys!6308 thiss!1504) (_values!4237 thiss!1504) (mask!10120 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4254 thiss!1504)))))

(assert (=> b!227930 false))

(declare-fun b!227931 () Bool)

(declare-fun e!147876 () Bool)

(declare-fun e!147873 () Bool)

(assert (=> b!227931 (= e!147876 e!147873)))

(declare-fun res!112194 () Bool)

(assert (=> b!227931 (=> (not res!112194) (not e!147873))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227931 (= res!112194 (inRange!0 index!297 (mask!10120 thiss!1504)))))

(declare-fun lt!114721 () Unit!6895)

(declare-fun e!147869 () Unit!6895)

(assert (=> b!227931 (= lt!114721 e!147869)))

(declare-fun c!37799 () Bool)

(declare-datatypes ((tuple2!4404 0))(
  ( (tuple2!4405 (_1!2213 (_ BitVec 64)) (_2!2213 V!7617)) )
))
(declare-datatypes ((List!3316 0))(
  ( (Nil!3313) (Cons!3312 (h!3960 tuple2!4404) (t!8267 List!3316)) )
))
(declare-datatypes ((ListLongMap!3319 0))(
  ( (ListLongMap!3320 (toList!1675 List!3316)) )
))
(declare-fun contains!1564 (ListLongMap!3319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1207 (array!11197 array!11195 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 32) Int) ListLongMap!3319)

(assert (=> b!227931 (= c!37799 (contains!1564 (getCurrentListMap!1207 (_keys!6308 thiss!1504) (_values!4237 thiss!1504) (mask!10120 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4254 thiss!1504)) key!932))))

(declare-fun b!227932 () Bool)

(declare-fun res!112199 () Bool)

(declare-fun e!147878 () Bool)

(assert (=> b!227932 (=> res!112199 e!147878)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11197 (_ BitVec 32)) Bool)

(assert (=> b!227932 (= res!112199 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6308 thiss!1504) (mask!10120 thiss!1504))))))

(declare-fun b!227933 () Bool)

(declare-fun Unit!6898 () Unit!6895)

(assert (=> b!227933 (= e!147868 Unit!6898)))

(declare-fun res!112203 () Bool)

(declare-fun e!147877 () Bool)

(assert (=> start!22052 (=> (not res!112203) (not e!147877))))

(declare-fun valid!1285 (LongMapFixedSize!3190) Bool)

(assert (=> start!22052 (= res!112203 (valid!1285 thiss!1504))))

(assert (=> start!22052 e!147877))

(declare-fun e!147866 () Bool)

(assert (=> start!22052 e!147866))

(assert (=> start!22052 true))

(declare-fun b!227934 () Bool)

(assert (=> b!227934 (= e!147873 (not e!147878))))

(declare-fun res!112202 () Bool)

(assert (=> b!227934 (=> res!112202 e!147878)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227934 (= res!112202 (not (validMask!0 (mask!10120 thiss!1504))))))

(declare-fun lt!114726 () array!11197)

(assert (=> b!227934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114726 (mask!10120 thiss!1504))))

(declare-fun lt!114720 () Unit!6895)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11197 (_ BitVec 32) (_ BitVec 32)) Unit!6895)

(assert (=> b!227934 (= lt!114720 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6308 thiss!1504) index!297 (mask!10120 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11197 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227934 (= (arrayCountValidKeys!0 lt!114726 #b00000000000000000000000000000000 (size!5651 (_keys!6308 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6308 thiss!1504) #b00000000000000000000000000000000 (size!5651 (_keys!6308 thiss!1504)))))))

(declare-fun lt!114729 () Unit!6895)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11197 (_ BitVec 32) (_ BitVec 64)) Unit!6895)

(assert (=> b!227934 (= lt!114729 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6308 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3317 0))(
  ( (Nil!3314) (Cons!3313 (h!3961 (_ BitVec 64)) (t!8268 List!3317)) )
))
(declare-fun arrayNoDuplicates!0 (array!11197 (_ BitVec 32) List!3317) Bool)

(assert (=> b!227934 (arrayNoDuplicates!0 lt!114726 #b00000000000000000000000000000000 Nil!3314)))

(assert (=> b!227934 (= lt!114726 (array!11198 (store (arr!5318 (_keys!6308 thiss!1504)) index!297 key!932) (size!5651 (_keys!6308 thiss!1504))))))

(declare-fun lt!114728 () Unit!6895)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11197 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3317) Unit!6895)

(assert (=> b!227934 (= lt!114728 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6308 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3314))))

(declare-fun lt!114725 () Unit!6895)

(assert (=> b!227934 (= lt!114725 e!147868)))

(declare-fun c!37798 () Bool)

(declare-fun arrayContainsKey!0 (array!11197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227934 (= c!37798 (arrayContainsKey!0 (_keys!6308 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun tp_is_empty!5977 () Bool)

(declare-fun e!147875 () Bool)

(declare-fun array_inv!3493 (array!11197) Bool)

(declare-fun array_inv!3494 (array!11195) Bool)

(assert (=> b!227935 (= e!147866 (and tp!21486 tp_is_empty!5977 (array_inv!3493 (_keys!6308 thiss!1504)) (array_inv!3494 (_values!4237 thiss!1504)) e!147875))))

(declare-fun mapNonEmpty!10135 () Bool)

(declare-fun mapRes!10135 () Bool)

(declare-fun tp!21487 () Bool)

(declare-fun e!147872 () Bool)

(assert (=> mapNonEmpty!10135 (= mapRes!10135 (and tp!21487 e!147872))))

(declare-fun mapValue!10135 () ValueCell!2645)

(declare-fun mapKey!10135 () (_ BitVec 32))

(declare-fun mapRest!10135 () (Array (_ BitVec 32) ValueCell!2645))

(assert (=> mapNonEmpty!10135 (= (arr!5317 (_values!4237 thiss!1504)) (store mapRest!10135 mapKey!10135 mapValue!10135))))

(declare-fun b!227936 () Bool)

(declare-fun res!112201 () Bool)

(declare-fun e!147865 () Bool)

(assert (=> b!227936 (=> (not res!112201) (not e!147865))))

(declare-datatypes ((SeekEntryResult!871 0))(
  ( (MissingZero!871 (index!5654 (_ BitVec 32))) (Found!871 (index!5655 (_ BitVec 32))) (Intermediate!871 (undefined!1683 Bool) (index!5656 (_ BitVec 32)) (x!23275 (_ BitVec 32))) (Undefined!871) (MissingVacant!871 (index!5657 (_ BitVec 32))) )
))
(declare-fun lt!114723 () SeekEntryResult!871)

(assert (=> b!227936 (= res!112201 (= (select (arr!5318 (_keys!6308 thiss!1504)) (index!5654 lt!114723)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227937 () Bool)

(assert (=> b!227937 (= e!147872 tp_is_empty!5977)))

(declare-fun b!227938 () Bool)

(assert (=> b!227938 (= e!147878 true)))

(declare-fun lt!114730 () Bool)

(assert (=> b!227938 (= lt!114730 (arrayNoDuplicates!0 (_keys!6308 thiss!1504) #b00000000000000000000000000000000 Nil!3314))))

(declare-fun b!227939 () Bool)

(declare-fun res!112195 () Bool)

(assert (=> b!227939 (=> (not res!112195) (not e!147865))))

(declare-fun call!21168 () Bool)

(assert (=> b!227939 (= res!112195 call!21168)))

(declare-fun e!147867 () Bool)

(assert (=> b!227939 (= e!147867 e!147865)))

(declare-fun b!227940 () Bool)

(declare-fun e!147870 () Bool)

(get-info :version)

(assert (=> b!227940 (= e!147870 ((_ is Undefined!871) lt!114723))))

(declare-fun b!227941 () Bool)

(declare-fun lt!114722 () Unit!6895)

(assert (=> b!227941 (= e!147869 lt!114722)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!261 (array!11197 array!11195 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 64) Int) Unit!6895)

(assert (=> b!227941 (= lt!114722 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!261 (_keys!6308 thiss!1504) (_values!4237 thiss!1504) (mask!10120 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) key!932 (defaultEntry!4254 thiss!1504)))))

(declare-fun c!37800 () Bool)

(assert (=> b!227941 (= c!37800 ((_ is MissingZero!871) lt!114723))))

(assert (=> b!227941 e!147867))

(declare-fun b!227942 () Bool)

(declare-fun Unit!6899 () Unit!6895)

(assert (=> b!227942 (= e!147869 Unit!6899)))

(declare-fun lt!114727 () Unit!6895)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!268 (array!11197 array!11195 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 64) Int) Unit!6895)

(assert (=> b!227942 (= lt!114727 (lemmaInListMapThenSeekEntryOrOpenFindsIt!268 (_keys!6308 thiss!1504) (_values!4237 thiss!1504) (mask!10120 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) key!932 (defaultEntry!4254 thiss!1504)))))

(assert (=> b!227942 false))

(declare-fun b!227943 () Bool)

(declare-fun e!147874 () Bool)

(declare-fun call!21167 () Bool)

(assert (=> b!227943 (= e!147874 (not call!21167))))

(declare-fun mapIsEmpty!10135 () Bool)

(assert (=> mapIsEmpty!10135 mapRes!10135))

(declare-fun b!227944 () Bool)

(declare-fun e!147871 () Bool)

(assert (=> b!227944 (= e!147875 (and e!147871 mapRes!10135))))

(declare-fun condMapEmpty!10135 () Bool)

(declare-fun mapDefault!10135 () ValueCell!2645)

(assert (=> b!227944 (= condMapEmpty!10135 (= (arr!5317 (_values!4237 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2645)) mapDefault!10135)))))

(declare-fun b!227945 () Bool)

(declare-fun res!112204 () Bool)

(assert (=> b!227945 (=> res!112204 e!147878)))

(assert (=> b!227945 (= res!112204 (or (not (= (size!5650 (_values!4237 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10120 thiss!1504)))) (not (= (size!5651 (_keys!6308 thiss!1504)) (size!5650 (_values!4237 thiss!1504)))) (bvslt (mask!10120 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3991 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3991 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227946 () Bool)

(assert (=> b!227946 (= e!147877 e!147876)))

(declare-fun res!112200 () Bool)

(assert (=> b!227946 (=> (not res!112200) (not e!147876))))

(assert (=> b!227946 (= res!112200 (or (= lt!114723 (MissingZero!871 index!297)) (= lt!114723 (MissingVacant!871 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11197 (_ BitVec 32)) SeekEntryResult!871)

(assert (=> b!227946 (= lt!114723 (seekEntryOrOpen!0 key!932 (_keys!6308 thiss!1504) (mask!10120 thiss!1504)))))

(declare-fun bm!21164 () Bool)

(assert (=> bm!21164 (= call!21167 (arrayContainsKey!0 (_keys!6308 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227947 () Bool)

(declare-fun res!112198 () Bool)

(assert (=> b!227947 (= res!112198 (= (select (arr!5318 (_keys!6308 thiss!1504)) (index!5657 lt!114723)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227947 (=> (not res!112198) (not e!147874))))

(declare-fun b!227948 () Bool)

(declare-fun res!112197 () Bool)

(assert (=> b!227948 (=> (not res!112197) (not e!147877))))

(assert (=> b!227948 (= res!112197 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227949 () Bool)

(assert (=> b!227949 (= e!147871 tp_is_empty!5977)))

(declare-fun b!227950 () Bool)

(assert (=> b!227950 (= e!147865 (not call!21167))))

(declare-fun bm!21165 () Bool)

(assert (=> bm!21165 (= call!21168 (inRange!0 (ite c!37800 (index!5654 lt!114723) (index!5657 lt!114723)) (mask!10120 thiss!1504)))))

(declare-fun b!227951 () Bool)

(assert (=> b!227951 (= e!147870 e!147874)))

(declare-fun res!112196 () Bool)

(assert (=> b!227951 (= res!112196 call!21168)))

(assert (=> b!227951 (=> (not res!112196) (not e!147874))))

(declare-fun b!227952 () Bool)

(declare-fun c!37801 () Bool)

(assert (=> b!227952 (= c!37801 ((_ is MissingVacant!871) lt!114723))))

(assert (=> b!227952 (= e!147867 e!147870)))

(assert (= (and start!22052 res!112203) b!227948))

(assert (= (and b!227948 res!112197) b!227946))

(assert (= (and b!227946 res!112200) b!227931))

(assert (= (and b!227931 c!37799) b!227942))

(assert (= (and b!227931 (not c!37799)) b!227941))

(assert (= (and b!227941 c!37800) b!227939))

(assert (= (and b!227941 (not c!37800)) b!227952))

(assert (= (and b!227939 res!112195) b!227936))

(assert (= (and b!227936 res!112201) b!227950))

(assert (= (and b!227952 c!37801) b!227951))

(assert (= (and b!227952 (not c!37801)) b!227940))

(assert (= (and b!227951 res!112196) b!227947))

(assert (= (and b!227947 res!112198) b!227943))

(assert (= (or b!227939 b!227951) bm!21165))

(assert (= (or b!227950 b!227943) bm!21164))

(assert (= (and b!227931 res!112194) b!227934))

(assert (= (and b!227934 c!37798) b!227930))

(assert (= (and b!227934 (not c!37798)) b!227933))

(assert (= (and b!227934 (not res!112202)) b!227945))

(assert (= (and b!227945 (not res!112204)) b!227932))

(assert (= (and b!227932 (not res!112199)) b!227938))

(assert (= (and b!227944 condMapEmpty!10135) mapIsEmpty!10135))

(assert (= (and b!227944 (not condMapEmpty!10135)) mapNonEmpty!10135))

(assert (= (and mapNonEmpty!10135 ((_ is ValueCellFull!2645) mapValue!10135)) b!227937))

(assert (= (and b!227944 ((_ is ValueCellFull!2645) mapDefault!10135)) b!227949))

(assert (= b!227935 b!227944))

(assert (= start!22052 b!227935))

(declare-fun m!249961 () Bool)

(assert (=> b!227934 m!249961))

(declare-fun m!249963 () Bool)

(assert (=> b!227934 m!249963))

(declare-fun m!249965 () Bool)

(assert (=> b!227934 m!249965))

(declare-fun m!249967 () Bool)

(assert (=> b!227934 m!249967))

(declare-fun m!249969 () Bool)

(assert (=> b!227934 m!249969))

(declare-fun m!249971 () Bool)

(assert (=> b!227934 m!249971))

(declare-fun m!249973 () Bool)

(assert (=> b!227934 m!249973))

(declare-fun m!249975 () Bool)

(assert (=> b!227934 m!249975))

(declare-fun m!249977 () Bool)

(assert (=> b!227934 m!249977))

(declare-fun m!249979 () Bool)

(assert (=> b!227934 m!249979))

(declare-fun m!249981 () Bool)

(assert (=> b!227941 m!249981))

(declare-fun m!249983 () Bool)

(assert (=> b!227936 m!249983))

(declare-fun m!249985 () Bool)

(assert (=> b!227932 m!249985))

(declare-fun m!249987 () Bool)

(assert (=> bm!21165 m!249987))

(declare-fun m!249989 () Bool)

(assert (=> b!227942 m!249989))

(assert (=> bm!21164 m!249963))

(declare-fun m!249991 () Bool)

(assert (=> b!227930 m!249991))

(declare-fun m!249993 () Bool)

(assert (=> b!227935 m!249993))

(declare-fun m!249995 () Bool)

(assert (=> b!227935 m!249995))

(declare-fun m!249997 () Bool)

(assert (=> b!227938 m!249997))

(declare-fun m!249999 () Bool)

(assert (=> b!227947 m!249999))

(declare-fun m!250001 () Bool)

(assert (=> mapNonEmpty!10135 m!250001))

(declare-fun m!250003 () Bool)

(assert (=> b!227931 m!250003))

(declare-fun m!250005 () Bool)

(assert (=> b!227931 m!250005))

(assert (=> b!227931 m!250005))

(declare-fun m!250007 () Bool)

(assert (=> b!227931 m!250007))

(declare-fun m!250009 () Bool)

(assert (=> b!227946 m!250009))

(declare-fun m!250011 () Bool)

(assert (=> start!22052 m!250011))

(check-sat tp_is_empty!5977 b_and!13027 (not b!227941) (not bm!21165) (not b_next!6115) (not b!227931) (not bm!21164) (not b!227942) (not b!227938) (not b!227946) (not b!227932) (not start!22052) (not b!227930) (not mapNonEmpty!10135) (not b!227934) (not b!227935))
(check-sat b_and!13027 (not b_next!6115))
