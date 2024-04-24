; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21944 () Bool)

(assert start!21944)

(declare-fun b!223873 () Bool)

(declare-fun b_free!6007 () Bool)

(declare-fun b_next!6007 () Bool)

(assert (=> b!223873 (= b_free!6007 (not b_next!6007))))

(declare-fun tp!21163 () Bool)

(declare-fun b_and!12919 () Bool)

(assert (=> b!223873 (= tp!21163 b_and!12919)))

(declare-fun b!223844 () Bool)

(declare-fun res!110066 () Bool)

(declare-fun e!145377 () Bool)

(assert (=> b!223844 (=> (not res!110066) (not e!145377))))

(declare-fun e!145381 () Bool)

(assert (=> b!223844 (= res!110066 e!145381)))

(declare-fun res!110060 () Bool)

(assert (=> b!223844 (=> res!110060 e!145381)))

(declare-fun e!145372 () Bool)

(assert (=> b!223844 (= res!110060 e!145372)))

(declare-fun res!110052 () Bool)

(assert (=> b!223844 (=> (not res!110052) (not e!145372))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223844 (= res!110052 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223845 () Bool)

(declare-fun e!145383 () Bool)

(declare-fun e!145375 () Bool)

(assert (=> b!223845 (= e!145383 e!145375)))

(declare-fun res!110056 () Bool)

(assert (=> b!223845 (=> (not res!110056) (not e!145375))))

(declare-datatypes ((V!7473 0))(
  ( (V!7474 (val!2979 Int)) )
))
(declare-datatypes ((ValueCell!2591 0))(
  ( (ValueCellFull!2591 (v!5000 V!7473)) (EmptyCell!2591) )
))
(declare-datatypes ((array!10979 0))(
  ( (array!10980 (arr!5209 (Array (_ BitVec 32) ValueCell!2591)) (size!5542 (_ BitVec 32))) )
))
(declare-datatypes ((array!10981 0))(
  ( (array!10982 (arr!5210 (Array (_ BitVec 32) (_ BitVec 64))) (size!5543 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3082 0))(
  ( (LongMapFixedSize!3083 (defaultEntry!4200 Int) (mask!10030 (_ BitVec 32)) (extraKeys!3937 (_ BitVec 32)) (zeroValue!4041 V!7473) (minValue!4041 V!7473) (_size!1590 (_ BitVec 32)) (_keys!6254 array!10981) (_values!4183 array!10979) (_vacant!1590 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3082)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223845 (= res!110056 (inRange!0 index!297 (mask!10030 thiss!1504)))))

(declare-datatypes ((Unit!6688 0))(
  ( (Unit!6689) )
))
(declare-fun lt!113052 () Unit!6688)

(declare-fun e!145376 () Unit!6688)

(assert (=> b!223845 (= lt!113052 e!145376)))

(declare-fun c!37150 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4332 0))(
  ( (tuple2!4333 (_1!2177 (_ BitVec 64)) (_2!2177 V!7473)) )
))
(declare-datatypes ((List!3233 0))(
  ( (Nil!3230) (Cons!3229 (h!3877 tuple2!4332) (t!8184 List!3233)) )
))
(declare-datatypes ((ListLongMap!3247 0))(
  ( (ListLongMap!3248 (toList!1639 List!3233)) )
))
(declare-fun contains!1519 (ListLongMap!3247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1171 (array!10981 array!10979 (_ BitVec 32) (_ BitVec 32) V!7473 V!7473 (_ BitVec 32) Int) ListLongMap!3247)

(assert (=> b!223845 (= c!37150 (contains!1519 (getCurrentListMap!1171 (_keys!6254 thiss!1504) (_values!4183 thiss!1504) (mask!10030 thiss!1504) (extraKeys!3937 thiss!1504) (zeroValue!4041 thiss!1504) (minValue!4041 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4200 thiss!1504)) key!932))))

(declare-fun b!223846 () Bool)

(declare-datatypes ((List!3234 0))(
  ( (Nil!3231) (Cons!3230 (h!3878 (_ BitVec 64)) (t!8185 List!3234)) )
))
(declare-fun contains!1520 (List!3234 (_ BitVec 64)) Bool)

(assert (=> b!223846 (= e!145372 (contains!1520 Nil!3231 key!932))))

(declare-fun b!223847 () Bool)

(declare-fun e!145368 () Unit!6688)

(declare-fun Unit!6690 () Unit!6688)

(assert (=> b!223847 (= e!145368 Unit!6690)))

(declare-fun lt!113054 () Unit!6688)

(declare-fun lemmaArrayContainsKeyThenInListMap!69 (array!10981 array!10979 (_ BitVec 32) (_ BitVec 32) V!7473 V!7473 (_ BitVec 64) (_ BitVec 32) Int) Unit!6688)

(assert (=> b!223847 (= lt!113054 (lemmaArrayContainsKeyThenInListMap!69 (_keys!6254 thiss!1504) (_values!4183 thiss!1504) (mask!10030 thiss!1504) (extraKeys!3937 thiss!1504) (zeroValue!4041 thiss!1504) (minValue!4041 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4200 thiss!1504)))))

(assert (=> b!223847 false))

(declare-fun b!223848 () Bool)

(declare-fun res!110064 () Bool)

(assert (=> b!223848 (=> (not res!110064) (not e!145377))))

(assert (=> b!223848 (= res!110064 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5543 (_keys!6254 thiss!1504)))))))

(declare-fun b!223849 () Bool)

(declare-fun e!145371 () Bool)

(declare-fun e!145379 () Bool)

(assert (=> b!223849 (= e!145371 e!145379)))

(declare-fun res!110053 () Bool)

(declare-fun call!20844 () Bool)

(assert (=> b!223849 (= res!110053 call!20844)))

(assert (=> b!223849 (=> (not res!110053) (not e!145379))))

(declare-fun b!223850 () Bool)

(declare-fun res!110054 () Bool)

(assert (=> b!223850 (=> (not res!110054) (not e!145377))))

(assert (=> b!223850 (= res!110054 (not (contains!1520 Nil!3231 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223851 () Bool)

(declare-fun c!37153 () Bool)

(declare-datatypes ((SeekEntryResult!823 0))(
  ( (MissingZero!823 (index!5462 (_ BitVec 32))) (Found!823 (index!5463 (_ BitVec 32))) (Intermediate!823 (undefined!1635 Bool) (index!5464 (_ BitVec 32)) (x!23083 (_ BitVec 32))) (Undefined!823) (MissingVacant!823 (index!5465 (_ BitVec 32))) )
))
(declare-fun lt!113056 () SeekEntryResult!823)

(get-info :version)

(assert (=> b!223851 (= c!37153 ((_ is MissingVacant!823) lt!113056))))

(declare-fun e!145385 () Bool)

(assert (=> b!223851 (= e!145385 e!145371)))

(declare-fun b!223852 () Bool)

(declare-fun e!145384 () Bool)

(declare-fun e!145370 () Bool)

(declare-fun mapRes!9973 () Bool)

(assert (=> b!223852 (= e!145384 (and e!145370 mapRes!9973))))

(declare-fun condMapEmpty!9973 () Bool)

(declare-fun mapDefault!9973 () ValueCell!2591)

(assert (=> b!223852 (= condMapEmpty!9973 (= (arr!5209 (_values!4183 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2591)) mapDefault!9973)))))

(declare-fun mapIsEmpty!9973 () Bool)

(assert (=> mapIsEmpty!9973 mapRes!9973))

(declare-fun b!223853 () Bool)

(declare-fun res!110070 () Bool)

(assert (=> b!223853 (=> (not res!110070) (not e!145377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223853 (= res!110070 (validKeyInArray!0 key!932))))

(declare-fun bm!20840 () Bool)

(declare-fun c!37152 () Bool)

(assert (=> bm!20840 (= call!20844 (inRange!0 (ite c!37152 (index!5462 lt!113056) (index!5465 lt!113056)) (mask!10030 thiss!1504)))))

(declare-fun res!110061 () Bool)

(declare-fun e!145380 () Bool)

(assert (=> start!21944 (=> (not res!110061) (not e!145380))))

(declare-fun valid!1247 (LongMapFixedSize!3082) Bool)

(assert (=> start!21944 (= res!110061 (valid!1247 thiss!1504))))

(assert (=> start!21944 e!145380))

(declare-fun e!145382 () Bool)

(assert (=> start!21944 e!145382))

(assert (=> start!21944 true))

(declare-fun b!223854 () Bool)

(declare-fun Unit!6691 () Unit!6688)

(assert (=> b!223854 (= e!145368 Unit!6691)))

(declare-fun b!223855 () Bool)

(declare-fun e!145378 () Bool)

(assert (=> b!223855 (= e!145378 (not (contains!1520 Nil!3231 key!932)))))

(declare-fun b!223856 () Bool)

(declare-fun res!110067 () Bool)

(assert (=> b!223856 (=> (not res!110067) (not e!145380))))

(assert (=> b!223856 (= res!110067 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223857 () Bool)

(declare-fun e!145373 () Bool)

(declare-fun tp_is_empty!5869 () Bool)

(assert (=> b!223857 (= e!145373 tp_is_empty!5869)))

(declare-fun b!223858 () Bool)

(assert (=> b!223858 (= e!145370 tp_is_empty!5869)))

(declare-fun b!223859 () Bool)

(declare-fun res!110062 () Bool)

(assert (=> b!223859 (= res!110062 (= (select (arr!5210 (_keys!6254 thiss!1504)) (index!5465 lt!113056)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223859 (=> (not res!110062) (not e!145379))))

(declare-fun b!223860 () Bool)

(assert (=> b!223860 (= e!145380 e!145383)))

(declare-fun res!110058 () Bool)

(assert (=> b!223860 (=> (not res!110058) (not e!145383))))

(assert (=> b!223860 (= res!110058 (or (= lt!113056 (MissingZero!823 index!297)) (= lt!113056 (MissingVacant!823 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10981 (_ BitVec 32)) SeekEntryResult!823)

(assert (=> b!223860 (= lt!113056 (seekEntryOrOpen!0 key!932 (_keys!6254 thiss!1504) (mask!10030 thiss!1504)))))

(declare-fun b!223861 () Bool)

(assert (=> b!223861 (= e!145371 ((_ is Undefined!823) lt!113056))))

(declare-fun b!223862 () Bool)

(assert (=> b!223862 (= e!145377 false)))

(declare-fun lt!113053 () Bool)

(assert (=> b!223862 (= lt!113053 (contains!1520 Nil!3231 key!932))))

(declare-fun b!223863 () Bool)

(declare-fun res!110057 () Bool)

(assert (=> b!223863 (=> (not res!110057) (not e!145377))))

(assert (=> b!223863 (= res!110057 (not (contains!1520 Nil!3231 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!9973 () Bool)

(declare-fun tp!21162 () Bool)

(assert (=> mapNonEmpty!9973 (= mapRes!9973 (and tp!21162 e!145373))))

(declare-fun mapKey!9973 () (_ BitVec 32))

(declare-fun mapValue!9973 () ValueCell!2591)

(declare-fun mapRest!9973 () (Array (_ BitVec 32) ValueCell!2591))

(assert (=> mapNonEmpty!9973 (= (arr!5209 (_values!4183 thiss!1504)) (store mapRest!9973 mapKey!9973 mapValue!9973))))

(declare-fun b!223864 () Bool)

(declare-fun res!110068 () Bool)

(declare-fun e!145369 () Bool)

(assert (=> b!223864 (=> (not res!110068) (not e!145369))))

(assert (=> b!223864 (= res!110068 call!20844)))

(assert (=> b!223864 (= e!145385 e!145369)))

(declare-fun b!223865 () Bool)

(assert (=> b!223865 (= e!145375 e!145377)))

(declare-fun res!110065 () Bool)

(assert (=> b!223865 (=> (not res!110065) (not e!145377))))

(assert (=> b!223865 (= res!110065 (and (bvslt (size!5543 (_keys!6254 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5543 (_keys!6254 thiss!1504)))))))

(declare-fun lt!113049 () Unit!6688)

(assert (=> b!223865 (= lt!113049 e!145368)))

(declare-fun c!37151 () Bool)

(declare-fun lt!113055 () Bool)

(assert (=> b!223865 (= c!37151 lt!113055)))

(declare-fun arrayContainsKey!0 (array!10981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223865 (= lt!113055 (arrayContainsKey!0 (_keys!6254 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20841 () Bool)

(declare-fun call!20843 () Bool)

(assert (=> bm!20841 (= call!20843 (arrayContainsKey!0 (_keys!6254 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223866 () Bool)

(assert (=> b!223866 (= e!145369 (not call!20843))))

(declare-fun b!223867 () Bool)

(declare-fun res!110063 () Bool)

(assert (=> b!223867 (=> (not res!110063) (not e!145377))))

(declare-fun arrayNoDuplicates!0 (array!10981 (_ BitVec 32) List!3234) Bool)

(assert (=> b!223867 (= res!110063 (arrayNoDuplicates!0 (_keys!6254 thiss!1504) #b00000000000000000000000000000000 Nil!3231))))

(declare-fun b!223868 () Bool)

(declare-fun res!110055 () Bool)

(assert (=> b!223868 (=> (not res!110055) (not e!145377))))

(declare-fun noDuplicate!80 (List!3234) Bool)

(assert (=> b!223868 (= res!110055 (noDuplicate!80 Nil!3231))))

(declare-fun b!223869 () Bool)

(assert (=> b!223869 (= e!145379 (not call!20843))))

(declare-fun b!223870 () Bool)

(declare-fun res!110069 () Bool)

(assert (=> b!223870 (=> (not res!110069) (not e!145377))))

(assert (=> b!223870 (= res!110069 (not lt!113055))))

(declare-fun b!223871 () Bool)

(declare-fun lt!113050 () Unit!6688)

(assert (=> b!223871 (= e!145376 lt!113050)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!224 (array!10981 array!10979 (_ BitVec 32) (_ BitVec 32) V!7473 V!7473 (_ BitVec 64) Int) Unit!6688)

(assert (=> b!223871 (= lt!113050 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!224 (_keys!6254 thiss!1504) (_values!4183 thiss!1504) (mask!10030 thiss!1504) (extraKeys!3937 thiss!1504) (zeroValue!4041 thiss!1504) (minValue!4041 thiss!1504) key!932 (defaultEntry!4200 thiss!1504)))))

(assert (=> b!223871 (= c!37152 ((_ is MissingZero!823) lt!113056))))

(assert (=> b!223871 e!145385))

(declare-fun b!223872 () Bool)

(assert (=> b!223872 (= e!145381 e!145378)))

(declare-fun res!110059 () Bool)

(assert (=> b!223872 (=> (not res!110059) (not e!145378))))

(assert (=> b!223872 (= res!110059 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun array_inv!3421 (array!10981) Bool)

(declare-fun array_inv!3422 (array!10979) Bool)

(assert (=> b!223873 (= e!145382 (and tp!21163 tp_is_empty!5869 (array_inv!3421 (_keys!6254 thiss!1504)) (array_inv!3422 (_values!4183 thiss!1504)) e!145384))))

(declare-fun b!223874 () Bool)

(declare-fun res!110071 () Bool)

(assert (=> b!223874 (=> (not res!110071) (not e!145369))))

(assert (=> b!223874 (= res!110071 (= (select (arr!5210 (_keys!6254 thiss!1504)) (index!5462 lt!113056)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223875 () Bool)

(declare-fun Unit!6692 () Unit!6688)

(assert (=> b!223875 (= e!145376 Unit!6692)))

(declare-fun lt!113051 () Unit!6688)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!230 (array!10981 array!10979 (_ BitVec 32) (_ BitVec 32) V!7473 V!7473 (_ BitVec 64) Int) Unit!6688)

(assert (=> b!223875 (= lt!113051 (lemmaInListMapThenSeekEntryOrOpenFindsIt!230 (_keys!6254 thiss!1504) (_values!4183 thiss!1504) (mask!10030 thiss!1504) (extraKeys!3937 thiss!1504) (zeroValue!4041 thiss!1504) (minValue!4041 thiss!1504) key!932 (defaultEntry!4200 thiss!1504)))))

(assert (=> b!223875 false))

(assert (= (and start!21944 res!110061) b!223856))

(assert (= (and b!223856 res!110067) b!223860))

(assert (= (and b!223860 res!110058) b!223845))

(assert (= (and b!223845 c!37150) b!223875))

(assert (= (and b!223845 (not c!37150)) b!223871))

(assert (= (and b!223871 c!37152) b!223864))

(assert (= (and b!223871 (not c!37152)) b!223851))

(assert (= (and b!223864 res!110068) b!223874))

(assert (= (and b!223874 res!110071) b!223866))

(assert (= (and b!223851 c!37153) b!223849))

(assert (= (and b!223851 (not c!37153)) b!223861))

(assert (= (and b!223849 res!110053) b!223859))

(assert (= (and b!223859 res!110062) b!223869))

(assert (= (or b!223864 b!223849) bm!20840))

(assert (= (or b!223866 b!223869) bm!20841))

(assert (= (and b!223845 res!110056) b!223865))

(assert (= (and b!223865 c!37151) b!223847))

(assert (= (and b!223865 (not c!37151)) b!223854))

(assert (= (and b!223865 res!110065) b!223868))

(assert (= (and b!223868 res!110055) b!223850))

(assert (= (and b!223850 res!110054) b!223863))

(assert (= (and b!223863 res!110057) b!223844))

(assert (= (and b!223844 res!110052) b!223846))

(assert (= (and b!223844 (not res!110060)) b!223872))

(assert (= (and b!223872 res!110059) b!223855))

(assert (= (and b!223844 res!110066) b!223867))

(assert (= (and b!223867 res!110063) b!223848))

(assert (= (and b!223848 res!110064) b!223853))

(assert (= (and b!223853 res!110070) b!223870))

(assert (= (and b!223870 res!110069) b!223862))

(assert (= (and b!223852 condMapEmpty!9973) mapIsEmpty!9973))

(assert (= (and b!223852 (not condMapEmpty!9973)) mapNonEmpty!9973))

(assert (= (and mapNonEmpty!9973 ((_ is ValueCellFull!2591) mapValue!9973)) b!223857))

(assert (= (and b!223852 ((_ is ValueCellFull!2591) mapDefault!9973)) b!223858))

(assert (= b!223873 b!223852))

(assert (= start!21944 b!223873))

(declare-fun m!247345 () Bool)

(assert (=> b!223867 m!247345))

(declare-fun m!247347 () Bool)

(assert (=> b!223874 m!247347))

(declare-fun m!247349 () Bool)

(assert (=> bm!20841 m!247349))

(declare-fun m!247351 () Bool)

(assert (=> b!223846 m!247351))

(declare-fun m!247353 () Bool)

(assert (=> b!223868 m!247353))

(declare-fun m!247355 () Bool)

(assert (=> b!223860 m!247355))

(declare-fun m!247357 () Bool)

(assert (=> start!21944 m!247357))

(declare-fun m!247359 () Bool)

(assert (=> b!223845 m!247359))

(declare-fun m!247361 () Bool)

(assert (=> b!223845 m!247361))

(assert (=> b!223845 m!247361))

(declare-fun m!247363 () Bool)

(assert (=> b!223845 m!247363))

(assert (=> b!223862 m!247351))

(assert (=> b!223855 m!247351))

(declare-fun m!247365 () Bool)

(assert (=> mapNonEmpty!9973 m!247365))

(declare-fun m!247367 () Bool)

(assert (=> b!223873 m!247367))

(declare-fun m!247369 () Bool)

(assert (=> b!223873 m!247369))

(assert (=> b!223865 m!247349))

(declare-fun m!247371 () Bool)

(assert (=> bm!20840 m!247371))

(declare-fun m!247373 () Bool)

(assert (=> b!223847 m!247373))

(declare-fun m!247375 () Bool)

(assert (=> b!223871 m!247375))

(declare-fun m!247377 () Bool)

(assert (=> b!223853 m!247377))

(declare-fun m!247379 () Bool)

(assert (=> b!223875 m!247379))

(declare-fun m!247381 () Bool)

(assert (=> b!223850 m!247381))

(declare-fun m!247383 () Bool)

(assert (=> b!223863 m!247383))

(declare-fun m!247385 () Bool)

(assert (=> b!223859 m!247385))

(check-sat (not b!223855) (not b!223868) b_and!12919 (not b_next!6007) (not b!223853) (not b!223850) (not b!223846) (not mapNonEmpty!9973) (not b!223862) (not b!223845) (not start!21944) (not bm!20840) (not b!223875) (not b!223860) tp_is_empty!5869 (not bm!20841) (not b!223867) (not b!223863) (not b!223865) (not b!223871) (not b!223873) (not b!223847))
(check-sat b_and!12919 (not b_next!6007))
