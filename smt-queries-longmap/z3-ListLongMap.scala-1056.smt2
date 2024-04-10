; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22020 () Bool)

(assert start!22020)

(declare-fun b!226928 () Bool)

(declare-fun b_free!6087 () Bool)

(declare-fun b_next!6087 () Bool)

(assert (=> b!226928 (= b_free!6087 (not b_next!6087))))

(declare-fun tp!21402 () Bool)

(declare-fun b_and!12985 () Bool)

(assert (=> b!226928 (= tp!21402 b_and!12985)))

(declare-fun b!226917 () Bool)

(declare-fun c!37620 () Bool)

(declare-datatypes ((SeekEntryResult!889 0))(
  ( (MissingZero!889 (index!5726 (_ BitVec 32))) (Found!889 (index!5727 (_ BitVec 32))) (Intermediate!889 (undefined!1701 Bool) (index!5728 (_ BitVec 32)) (x!23253 (_ BitVec 32))) (Undefined!889) (MissingVacant!889 (index!5729 (_ BitVec 32))) )
))
(declare-fun lt!114201 () SeekEntryResult!889)

(get-info :version)

(assert (=> b!226917 (= c!37620 ((_ is MissingVacant!889) lt!114201))))

(declare-fun e!147219 () Bool)

(declare-fun e!147221 () Bool)

(assert (=> b!226917 (= e!147219 e!147221)))

(declare-fun b!226918 () Bool)

(declare-fun res!111717 () Bool)

(declare-fun e!147211 () Bool)

(assert (=> b!226918 (=> (not res!111717) (not e!147211))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!226918 (= res!111717 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10093 () Bool)

(declare-fun mapRes!10093 () Bool)

(declare-fun tp!21403 () Bool)

(declare-fun e!147217 () Bool)

(assert (=> mapNonEmpty!10093 (= mapRes!10093 (and tp!21403 e!147217))))

(declare-datatypes ((V!7579 0))(
  ( (V!7580 (val!3019 Int)) )
))
(declare-datatypes ((ValueCell!2631 0))(
  ( (ValueCellFull!2631 (v!5039 V!7579)) (EmptyCell!2631) )
))
(declare-fun mapValue!10093 () ValueCell!2631)

(declare-datatypes ((array!11141 0))(
  ( (array!11142 (arr!5290 (Array (_ BitVec 32) ValueCell!2631)) (size!5623 (_ BitVec 32))) )
))
(declare-datatypes ((array!11143 0))(
  ( (array!11144 (arr!5291 (Array (_ BitVec 32) (_ BitVec 64))) (size!5624 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3162 0))(
  ( (LongMapFixedSize!3163 (defaultEntry!4240 Int) (mask!10096 (_ BitVec 32)) (extraKeys!3977 (_ BitVec 32)) (zeroValue!4081 V!7579) (minValue!4081 V!7579) (_size!1630 (_ BitVec 32)) (_keys!6294 array!11143) (_values!4223 array!11141) (_vacant!1630 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3162)

(declare-fun mapKey!10093 () (_ BitVec 32))

(declare-fun mapRest!10093 () (Array (_ BitVec 32) ValueCell!2631))

(assert (=> mapNonEmpty!10093 (= (arr!5290 (_values!4223 thiss!1504)) (store mapRest!10093 mapKey!10093 mapValue!10093))))

(declare-fun b!226919 () Bool)

(declare-fun e!147224 () Bool)

(declare-fun e!147223 () Bool)

(assert (=> b!226919 (= e!147224 (not e!147223))))

(declare-fun res!111721 () Bool)

(assert (=> b!226919 (=> res!111721 e!147223)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226919 (= res!111721 (not (validMask!0 (mask!10096 thiss!1504))))))

(declare-fun lt!114199 () array!11143)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11143 (_ BitVec 32)) Bool)

(assert (=> b!226919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114199 (mask!10096 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!6873 0))(
  ( (Unit!6874) )
))
(declare-fun lt!114206 () Unit!6873)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11143 (_ BitVec 32) (_ BitVec 32)) Unit!6873)

(assert (=> b!226919 (= lt!114206 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6294 thiss!1504) index!297 (mask!10096 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11143 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226919 (= (arrayCountValidKeys!0 lt!114199 #b00000000000000000000000000000000 (size!5624 (_keys!6294 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6294 thiss!1504) #b00000000000000000000000000000000 (size!5624 (_keys!6294 thiss!1504)))))))

(declare-fun lt!114208 () Unit!6873)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11143 (_ BitVec 32) (_ BitVec 64)) Unit!6873)

(assert (=> b!226919 (= lt!114208 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6294 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3382 0))(
  ( (Nil!3379) (Cons!3378 (h!4026 (_ BitVec 64)) (t!8341 List!3382)) )
))
(declare-fun arrayNoDuplicates!0 (array!11143 (_ BitVec 32) List!3382) Bool)

(assert (=> b!226919 (arrayNoDuplicates!0 lt!114199 #b00000000000000000000000000000000 Nil!3379)))

(assert (=> b!226919 (= lt!114199 (array!11144 (store (arr!5291 (_keys!6294 thiss!1504)) index!297 key!932) (size!5624 (_keys!6294 thiss!1504))))))

(declare-fun lt!114209 () Unit!6873)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11143 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3382) Unit!6873)

(assert (=> b!226919 (= lt!114209 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6294 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3379))))

(declare-fun lt!114205 () Unit!6873)

(declare-fun e!147212 () Unit!6873)

(assert (=> b!226919 (= lt!114205 e!147212)))

(declare-fun c!37617 () Bool)

(declare-fun arrayContainsKey!0 (array!11143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226919 (= c!37617 (arrayContainsKey!0 (_keys!6294 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226920 () Bool)

(assert (=> b!226920 (= e!147221 ((_ is Undefined!889) lt!114201))))

(declare-fun c!37619 () Bool)

(declare-fun call!21096 () Bool)

(declare-fun bm!21092 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21092 (= call!21096 (inRange!0 (ite c!37619 (index!5726 lt!114201) (index!5729 lt!114201)) (mask!10096 thiss!1504)))))

(declare-fun b!226921 () Bool)

(declare-fun e!147210 () Bool)

(declare-fun call!21095 () Bool)

(assert (=> b!226921 (= e!147210 (not call!21095))))

(declare-fun b!226922 () Bool)

(declare-fun Unit!6875 () Unit!6873)

(assert (=> b!226922 (= e!147212 Unit!6875)))

(declare-fun lt!114207 () Unit!6873)

(declare-fun lemmaArrayContainsKeyThenInListMap!99 (array!11143 array!11141 (_ BitVec 32) (_ BitVec 32) V!7579 V!7579 (_ BitVec 64) (_ BitVec 32) Int) Unit!6873)

(assert (=> b!226922 (= lt!114207 (lemmaArrayContainsKeyThenInListMap!99 (_keys!6294 thiss!1504) (_values!4223 thiss!1504) (mask!10096 thiss!1504) (extraKeys!3977 thiss!1504) (zeroValue!4081 thiss!1504) (minValue!4081 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4240 thiss!1504)))))

(assert (=> b!226922 false))

(declare-fun b!226923 () Bool)

(declare-fun e!147216 () Bool)

(assert (=> b!226923 (= e!147216 e!147224)))

(declare-fun res!111716 () Bool)

(assert (=> b!226923 (=> (not res!111716) (not e!147224))))

(assert (=> b!226923 (= res!111716 (inRange!0 index!297 (mask!10096 thiss!1504)))))

(declare-fun lt!114200 () Unit!6873)

(declare-fun e!147220 () Unit!6873)

(assert (=> b!226923 (= lt!114200 e!147220)))

(declare-fun c!37618 () Bool)

(declare-datatypes ((tuple2!4464 0))(
  ( (tuple2!4465 (_1!2243 (_ BitVec 64)) (_2!2243 V!7579)) )
))
(declare-datatypes ((List!3383 0))(
  ( (Nil!3380) (Cons!3379 (h!4027 tuple2!4464) (t!8342 List!3383)) )
))
(declare-datatypes ((ListLongMap!3377 0))(
  ( (ListLongMap!3378 (toList!1704 List!3383)) )
))
(declare-fun contains!1578 (ListLongMap!3377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1232 (array!11143 array!11141 (_ BitVec 32) (_ BitVec 32) V!7579 V!7579 (_ BitVec 32) Int) ListLongMap!3377)

(assert (=> b!226923 (= c!37618 (contains!1578 (getCurrentListMap!1232 (_keys!6294 thiss!1504) (_values!4223 thiss!1504) (mask!10096 thiss!1504) (extraKeys!3977 thiss!1504) (zeroValue!4081 thiss!1504) (minValue!4081 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4240 thiss!1504)) key!932))))

(declare-fun res!111718 () Bool)

(assert (=> start!22020 (=> (not res!111718) (not e!147211))))

(declare-fun valid!1271 (LongMapFixedSize!3162) Bool)

(assert (=> start!22020 (= res!111718 (valid!1271 thiss!1504))))

(assert (=> start!22020 e!147211))

(declare-fun e!147215 () Bool)

(assert (=> start!22020 e!147215))

(assert (=> start!22020 true))

(declare-fun b!226924 () Bool)

(assert (=> b!226924 (= e!147211 e!147216)))

(declare-fun res!111719 () Bool)

(assert (=> b!226924 (=> (not res!111719) (not e!147216))))

(assert (=> b!226924 (= res!111719 (or (= lt!114201 (MissingZero!889 index!297)) (= lt!114201 (MissingVacant!889 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11143 (_ BitVec 32)) SeekEntryResult!889)

(assert (=> b!226924 (= lt!114201 (seekEntryOrOpen!0 key!932 (_keys!6294 thiss!1504) (mask!10096 thiss!1504)))))

(declare-fun b!226925 () Bool)

(assert (=> b!226925 (= e!147223 true)))

(declare-fun lt!114204 () Bool)

(assert (=> b!226925 (= lt!114204 (arrayNoDuplicates!0 (_keys!6294 thiss!1504) #b00000000000000000000000000000000 Nil!3379))))

(declare-fun b!226926 () Bool)

(declare-fun res!111720 () Bool)

(assert (=> b!226926 (=> (not res!111720) (not e!147210))))

(assert (=> b!226926 (= res!111720 (= (select (arr!5291 (_keys!6294 thiss!1504)) (index!5726 lt!114201)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226927 () Bool)

(declare-fun res!111714 () Bool)

(assert (=> b!226927 (=> res!111714 e!147223)))

(assert (=> b!226927 (= res!111714 (or (not (= (size!5623 (_values!4223 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10096 thiss!1504)))) (not (= (size!5624 (_keys!6294 thiss!1504)) (size!5623 (_values!4223 thiss!1504)))) (bvslt (mask!10096 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3977 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3977 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!5949 () Bool)

(declare-fun e!147218 () Bool)

(declare-fun array_inv!3499 (array!11143) Bool)

(declare-fun array_inv!3500 (array!11141) Bool)

(assert (=> b!226928 (= e!147215 (and tp!21402 tp_is_empty!5949 (array_inv!3499 (_keys!6294 thiss!1504)) (array_inv!3500 (_values!4223 thiss!1504)) e!147218))))

(declare-fun b!226929 () Bool)

(declare-fun e!147214 () Bool)

(assert (=> b!226929 (= e!147214 (not call!21095))))

(declare-fun b!226930 () Bool)

(declare-fun lt!114203 () Unit!6873)

(assert (=> b!226930 (= e!147220 lt!114203)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!274 (array!11143 array!11141 (_ BitVec 32) (_ BitVec 32) V!7579 V!7579 (_ BitVec 64) Int) Unit!6873)

(assert (=> b!226930 (= lt!114203 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!274 (_keys!6294 thiss!1504) (_values!4223 thiss!1504) (mask!10096 thiss!1504) (extraKeys!3977 thiss!1504) (zeroValue!4081 thiss!1504) (minValue!4081 thiss!1504) key!932 (defaultEntry!4240 thiss!1504)))))

(assert (=> b!226930 (= c!37619 ((_ is MissingZero!889) lt!114201))))

(assert (=> b!226930 e!147219))

(declare-fun b!226931 () Bool)

(declare-fun e!147213 () Bool)

(assert (=> b!226931 (= e!147213 tp_is_empty!5949)))

(declare-fun b!226932 () Bool)

(declare-fun res!111712 () Bool)

(assert (=> b!226932 (=> (not res!111712) (not e!147210))))

(assert (=> b!226932 (= res!111712 call!21096)))

(assert (=> b!226932 (= e!147219 e!147210)))

(declare-fun b!226933 () Bool)

(declare-fun Unit!6876 () Unit!6873)

(assert (=> b!226933 (= e!147212 Unit!6876)))

(declare-fun bm!21093 () Bool)

(assert (=> bm!21093 (= call!21095 (arrayContainsKey!0 (_keys!6294 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226934 () Bool)

(assert (=> b!226934 (= e!147218 (and e!147213 mapRes!10093))))

(declare-fun condMapEmpty!10093 () Bool)

(declare-fun mapDefault!10093 () ValueCell!2631)

(assert (=> b!226934 (= condMapEmpty!10093 (= (arr!5290 (_values!4223 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2631)) mapDefault!10093)))))

(declare-fun b!226935 () Bool)

(declare-fun res!111711 () Bool)

(assert (=> b!226935 (= res!111711 (= (select (arr!5291 (_keys!6294 thiss!1504)) (index!5729 lt!114201)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226935 (=> (not res!111711) (not e!147214))))

(declare-fun b!226936 () Bool)

(assert (=> b!226936 (= e!147217 tp_is_empty!5949)))

(declare-fun b!226937 () Bool)

(declare-fun res!111715 () Bool)

(assert (=> b!226937 (=> res!111715 e!147223)))

(assert (=> b!226937 (= res!111715 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6294 thiss!1504) (mask!10096 thiss!1504))))))

(declare-fun mapIsEmpty!10093 () Bool)

(assert (=> mapIsEmpty!10093 mapRes!10093))

(declare-fun b!226938 () Bool)

(assert (=> b!226938 (= e!147221 e!147214)))

(declare-fun res!111713 () Bool)

(assert (=> b!226938 (= res!111713 call!21096)))

(assert (=> b!226938 (=> (not res!111713) (not e!147214))))

(declare-fun b!226939 () Bool)

(declare-fun Unit!6877 () Unit!6873)

(assert (=> b!226939 (= e!147220 Unit!6877)))

(declare-fun lt!114202 () Unit!6873)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!260 (array!11143 array!11141 (_ BitVec 32) (_ BitVec 32) V!7579 V!7579 (_ BitVec 64) Int) Unit!6873)

(assert (=> b!226939 (= lt!114202 (lemmaInListMapThenSeekEntryOrOpenFindsIt!260 (_keys!6294 thiss!1504) (_values!4223 thiss!1504) (mask!10096 thiss!1504) (extraKeys!3977 thiss!1504) (zeroValue!4081 thiss!1504) (minValue!4081 thiss!1504) key!932 (defaultEntry!4240 thiss!1504)))))

(assert (=> b!226939 false))

(assert (= (and start!22020 res!111718) b!226918))

(assert (= (and b!226918 res!111717) b!226924))

(assert (= (and b!226924 res!111719) b!226923))

(assert (= (and b!226923 c!37618) b!226939))

(assert (= (and b!226923 (not c!37618)) b!226930))

(assert (= (and b!226930 c!37619) b!226932))

(assert (= (and b!226930 (not c!37619)) b!226917))

(assert (= (and b!226932 res!111712) b!226926))

(assert (= (and b!226926 res!111720) b!226921))

(assert (= (and b!226917 c!37620) b!226938))

(assert (= (and b!226917 (not c!37620)) b!226920))

(assert (= (and b!226938 res!111713) b!226935))

(assert (= (and b!226935 res!111711) b!226929))

(assert (= (or b!226932 b!226938) bm!21092))

(assert (= (or b!226921 b!226929) bm!21093))

(assert (= (and b!226923 res!111716) b!226919))

(assert (= (and b!226919 c!37617) b!226922))

(assert (= (and b!226919 (not c!37617)) b!226933))

(assert (= (and b!226919 (not res!111721)) b!226927))

(assert (= (and b!226927 (not res!111714)) b!226937))

(assert (= (and b!226937 (not res!111715)) b!226925))

(assert (= (and b!226934 condMapEmpty!10093) mapIsEmpty!10093))

(assert (= (and b!226934 (not condMapEmpty!10093)) mapNonEmpty!10093))

(assert (= (and mapNonEmpty!10093 ((_ is ValueCellFull!2631) mapValue!10093)) b!226936))

(assert (= (and b!226934 ((_ is ValueCellFull!2631) mapDefault!10093)) b!226931))

(assert (= b!226928 b!226934))

(assert (= start!22020 b!226928))

(declare-fun m!249051 () Bool)

(assert (=> b!226924 m!249051))

(declare-fun m!249053 () Bool)

(assert (=> b!226928 m!249053))

(declare-fun m!249055 () Bool)

(assert (=> b!226928 m!249055))

(declare-fun m!249057 () Bool)

(assert (=> b!226939 m!249057))

(declare-fun m!249059 () Bool)

(assert (=> b!226922 m!249059))

(declare-fun m!249061 () Bool)

(assert (=> b!226925 m!249061))

(declare-fun m!249063 () Bool)

(assert (=> mapNonEmpty!10093 m!249063))

(declare-fun m!249065 () Bool)

(assert (=> b!226923 m!249065))

(declare-fun m!249067 () Bool)

(assert (=> b!226923 m!249067))

(assert (=> b!226923 m!249067))

(declare-fun m!249069 () Bool)

(assert (=> b!226923 m!249069))

(declare-fun m!249071 () Bool)

(assert (=> start!22020 m!249071))

(declare-fun m!249073 () Bool)

(assert (=> b!226926 m!249073))

(declare-fun m!249075 () Bool)

(assert (=> bm!21093 m!249075))

(declare-fun m!249077 () Bool)

(assert (=> b!226935 m!249077))

(declare-fun m!249079 () Bool)

(assert (=> b!226930 m!249079))

(declare-fun m!249081 () Bool)

(assert (=> b!226937 m!249081))

(declare-fun m!249083 () Bool)

(assert (=> bm!21092 m!249083))

(declare-fun m!249085 () Bool)

(assert (=> b!226919 m!249085))

(assert (=> b!226919 m!249075))

(declare-fun m!249087 () Bool)

(assert (=> b!226919 m!249087))

(declare-fun m!249089 () Bool)

(assert (=> b!226919 m!249089))

(declare-fun m!249091 () Bool)

(assert (=> b!226919 m!249091))

(declare-fun m!249093 () Bool)

(assert (=> b!226919 m!249093))

(declare-fun m!249095 () Bool)

(assert (=> b!226919 m!249095))

(declare-fun m!249097 () Bool)

(assert (=> b!226919 m!249097))

(declare-fun m!249099 () Bool)

(assert (=> b!226919 m!249099))

(declare-fun m!249101 () Bool)

(assert (=> b!226919 m!249101))

(check-sat (not b!226928) (not b!226923) (not start!22020) (not b_next!6087) (not mapNonEmpty!10093) (not b!226919) b_and!12985 (not b!226922) (not b!226939) (not b!226924) tp_is_empty!5949 (not b!226930) (not b!226937) (not bm!21092) (not bm!21093) (not b!226925))
(check-sat b_and!12985 (not b_next!6087))
