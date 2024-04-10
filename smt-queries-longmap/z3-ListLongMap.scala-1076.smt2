; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22140 () Bool)

(assert start!22140)

(declare-fun b!230893 () Bool)

(declare-fun b_free!6207 () Bool)

(declare-fun b_next!6207 () Bool)

(assert (=> b!230893 (= b_free!6207 (not b_next!6207))))

(declare-fun tp!21762 () Bool)

(declare-fun b_and!13105 () Bool)

(assert (=> b!230893 (= tp!21762 b_and!13105)))

(declare-fun b!230880 () Bool)

(declare-datatypes ((Unit!7081 0))(
  ( (Unit!7082) )
))
(declare-fun e!149856 () Unit!7081)

(declare-fun lt!116280 () Unit!7081)

(assert (=> b!230880 (= e!149856 lt!116280)))

(declare-datatypes ((V!7739 0))(
  ( (V!7740 (val!3079 Int)) )
))
(declare-datatypes ((ValueCell!2691 0))(
  ( (ValueCellFull!2691 (v!5099 V!7739)) (EmptyCell!2691) )
))
(declare-datatypes ((array!11381 0))(
  ( (array!11382 (arr!5410 (Array (_ BitVec 32) ValueCell!2691)) (size!5743 (_ BitVec 32))) )
))
(declare-datatypes ((array!11383 0))(
  ( (array!11384 (arr!5411 (Array (_ BitVec 32) (_ BitVec 64))) (size!5744 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3282 0))(
  ( (LongMapFixedSize!3283 (defaultEntry!4300 Int) (mask!10196 (_ BitVec 32)) (extraKeys!4037 (_ BitVec 32)) (zeroValue!4141 V!7739) (minValue!4141 V!7739) (_size!1690 (_ BitVec 32)) (_keys!6354 array!11383) (_values!4283 array!11381) (_vacant!1690 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3282)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!312 (array!11383 array!11381 (_ BitVec 32) (_ BitVec 32) V!7739 V!7739 (_ BitVec 64) Int) Unit!7081)

(assert (=> b!230880 (= lt!116280 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!312 (_keys!6354 thiss!1504) (_values!4283 thiss!1504) (mask!10196 thiss!1504) (extraKeys!4037 thiss!1504) (zeroValue!4141 thiss!1504) (minValue!4141 thiss!1504) key!932 (defaultEntry!4300 thiss!1504)))))

(declare-fun c!38340 () Bool)

(declare-datatypes ((SeekEntryResult!943 0))(
  ( (MissingZero!943 (index!5942 (_ BitVec 32))) (Found!943 (index!5943 (_ BitVec 32))) (Intermediate!943 (undefined!1755 Bool) (index!5944 (_ BitVec 32)) (x!23467 (_ BitVec 32))) (Undefined!943) (MissingVacant!943 (index!5945 (_ BitVec 32))) )
))
(declare-fun lt!116284 () SeekEntryResult!943)

(get-info :version)

(assert (=> b!230880 (= c!38340 ((_ is MissingZero!943) lt!116284))))

(declare-fun e!149859 () Bool)

(assert (=> b!230880 e!149859))

(declare-fun b!230881 () Bool)

(declare-fun e!149853 () Bool)

(declare-fun tp_is_empty!6069 () Bool)

(assert (=> b!230881 (= e!149853 tp_is_empty!6069)))

(declare-fun b!230882 () Bool)

(declare-fun res!113518 () Bool)

(assert (=> b!230882 (= res!113518 (= (select (arr!5411 (_keys!6354 thiss!1504)) (index!5945 lt!116284)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149863 () Bool)

(assert (=> b!230882 (=> (not res!113518) (not e!149863))))

(declare-fun mapIsEmpty!10273 () Bool)

(declare-fun mapRes!10273 () Bool)

(assert (=> mapIsEmpty!10273 mapRes!10273))

(declare-fun call!21456 () Bool)

(declare-fun bm!21452 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21452 (= call!21456 (inRange!0 (ite c!38340 (index!5942 lt!116284) (index!5945 lt!116284)) (mask!10196 thiss!1504)))))

(declare-fun b!230883 () Bool)

(declare-fun e!149858 () Bool)

(assert (=> b!230883 (= e!149858 e!149863)))

(declare-fun res!113516 () Bool)

(assert (=> b!230883 (= res!113516 call!21456)))

(assert (=> b!230883 (=> (not res!113516) (not e!149863))))

(declare-fun b!230884 () Bool)

(declare-fun res!113519 () Bool)

(declare-fun e!149860 () Bool)

(assert (=> b!230884 (=> (not res!113519) (not e!149860))))

(assert (=> b!230884 (= res!113519 call!21456)))

(assert (=> b!230884 (= e!149859 e!149860)))

(declare-fun b!230885 () Bool)

(assert (=> b!230885 (= e!149858 ((_ is Undefined!943) lt!116284))))

(declare-fun bm!21453 () Bool)

(declare-fun call!21455 () Bool)

(declare-fun arrayContainsKey!0 (array!11383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21453 (= call!21455 (arrayContainsKey!0 (_keys!6354 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230886 () Bool)

(declare-fun e!149857 () Unit!7081)

(declare-fun Unit!7083 () Unit!7081)

(assert (=> b!230886 (= e!149857 Unit!7083)))

(declare-fun b!230887 () Bool)

(declare-fun e!149854 () Bool)

(assert (=> b!230887 (= e!149854 (not true))))

(declare-fun lt!116279 () array!11383)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11383 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230887 (= (arrayCountValidKeys!0 lt!116279 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116288 () Unit!7081)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11383 (_ BitVec 32)) Unit!7081)

(assert (=> b!230887 (= lt!116288 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116279 index!297))))

(assert (=> b!230887 (arrayContainsKey!0 lt!116279 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116278 () Unit!7081)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11383 (_ BitVec 64) (_ BitVec 32)) Unit!7081)

(assert (=> b!230887 (= lt!116278 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116279 key!932 index!297))))

(declare-fun v!346 () V!7739)

(declare-datatypes ((tuple2!4542 0))(
  ( (tuple2!4543 (_1!2282 (_ BitVec 64)) (_2!2282 V!7739)) )
))
(declare-datatypes ((List!3463 0))(
  ( (Nil!3460) (Cons!3459 (h!4107 tuple2!4542) (t!8422 List!3463)) )
))
(declare-datatypes ((ListLongMap!3455 0))(
  ( (ListLongMap!3456 (toList!1743 List!3463)) )
))
(declare-fun lt!116275 () ListLongMap!3455)

(declare-fun +!609 (ListLongMap!3455 tuple2!4542) ListLongMap!3455)

(declare-fun getCurrentListMap!1271 (array!11383 array!11381 (_ BitVec 32) (_ BitVec 32) V!7739 V!7739 (_ BitVec 32) Int) ListLongMap!3455)

(assert (=> b!230887 (= (+!609 lt!116275 (tuple2!4543 key!932 v!346)) (getCurrentListMap!1271 lt!116279 (array!11382 (store (arr!5410 (_values!4283 thiss!1504)) index!297 (ValueCellFull!2691 v!346)) (size!5743 (_values!4283 thiss!1504))) (mask!10196 thiss!1504) (extraKeys!4037 thiss!1504) (zeroValue!4141 thiss!1504) (minValue!4141 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4300 thiss!1504)))))

(declare-fun lt!116281 () Unit!7081)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!63 (array!11383 array!11381 (_ BitVec 32) (_ BitVec 32) V!7739 V!7739 (_ BitVec 32) (_ BitVec 64) V!7739 Int) Unit!7081)

(assert (=> b!230887 (= lt!116281 (lemmaAddValidKeyToArrayThenAddPairToListMap!63 (_keys!6354 thiss!1504) (_values!4283 thiss!1504) (mask!10196 thiss!1504) (extraKeys!4037 thiss!1504) (zeroValue!4141 thiss!1504) (minValue!4141 thiss!1504) index!297 key!932 v!346 (defaultEntry!4300 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11383 (_ BitVec 32)) Bool)

(assert (=> b!230887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116279 (mask!10196 thiss!1504))))

(declare-fun lt!116276 () Unit!7081)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11383 (_ BitVec 32) (_ BitVec 32)) Unit!7081)

(assert (=> b!230887 (= lt!116276 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6354 thiss!1504) index!297 (mask!10196 thiss!1504)))))

(assert (=> b!230887 (= (arrayCountValidKeys!0 lt!116279 #b00000000000000000000000000000000 (size!5744 (_keys!6354 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6354 thiss!1504) #b00000000000000000000000000000000 (size!5744 (_keys!6354 thiss!1504)))))))

(declare-fun lt!116282 () Unit!7081)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11383 (_ BitVec 32) (_ BitVec 64)) Unit!7081)

(assert (=> b!230887 (= lt!116282 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6354 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3464 0))(
  ( (Nil!3461) (Cons!3460 (h!4108 (_ BitVec 64)) (t!8423 List!3464)) )
))
(declare-fun arrayNoDuplicates!0 (array!11383 (_ BitVec 32) List!3464) Bool)

(assert (=> b!230887 (arrayNoDuplicates!0 lt!116279 #b00000000000000000000000000000000 Nil!3461)))

(assert (=> b!230887 (= lt!116279 (array!11384 (store (arr!5411 (_keys!6354 thiss!1504)) index!297 key!932) (size!5744 (_keys!6354 thiss!1504))))))

(declare-fun lt!116285 () Unit!7081)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11383 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3464) Unit!7081)

(assert (=> b!230887 (= lt!116285 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6354 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3461))))

(declare-fun lt!116287 () Unit!7081)

(assert (=> b!230887 (= lt!116287 e!149857)))

(declare-fun c!38339 () Bool)

(assert (=> b!230887 (= c!38339 (arrayContainsKey!0 (_keys!6354 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230888 () Bool)

(assert (=> b!230888 (= e!149863 (not call!21455))))

(declare-fun b!230889 () Bool)

(assert (=> b!230889 (= e!149860 (not call!21455))))

(declare-fun res!113517 () Bool)

(declare-fun e!149862 () Bool)

(assert (=> start!22140 (=> (not res!113517) (not e!149862))))

(declare-fun valid!1304 (LongMapFixedSize!3282) Bool)

(assert (=> start!22140 (= res!113517 (valid!1304 thiss!1504))))

(assert (=> start!22140 e!149862))

(declare-fun e!149855 () Bool)

(assert (=> start!22140 e!149855))

(assert (=> start!22140 true))

(assert (=> start!22140 tp_is_empty!6069))

(declare-fun b!230890 () Bool)

(declare-fun c!38337 () Bool)

(assert (=> b!230890 (= c!38337 ((_ is MissingVacant!943) lt!116284))))

(assert (=> b!230890 (= e!149859 e!149858)))

(declare-fun b!230891 () Bool)

(declare-fun e!149864 () Bool)

(declare-fun e!149852 () Bool)

(assert (=> b!230891 (= e!149864 (and e!149852 mapRes!10273))))

(declare-fun condMapEmpty!10273 () Bool)

(declare-fun mapDefault!10273 () ValueCell!2691)

(assert (=> b!230891 (= condMapEmpty!10273 (= (arr!5410 (_values!4283 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2691)) mapDefault!10273)))))

(declare-fun b!230892 () Bool)

(assert (=> b!230892 (= e!149852 tp_is_empty!6069)))

(declare-fun array_inv!3567 (array!11383) Bool)

(declare-fun array_inv!3568 (array!11381) Bool)

(assert (=> b!230893 (= e!149855 (and tp!21762 tp_is_empty!6069 (array_inv!3567 (_keys!6354 thiss!1504)) (array_inv!3568 (_values!4283 thiss!1504)) e!149864))))

(declare-fun b!230894 () Bool)

(declare-fun e!149861 () Bool)

(assert (=> b!230894 (= e!149862 e!149861)))

(declare-fun res!113514 () Bool)

(assert (=> b!230894 (=> (not res!113514) (not e!149861))))

(assert (=> b!230894 (= res!113514 (or (= lt!116284 (MissingZero!943 index!297)) (= lt!116284 (MissingVacant!943 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11383 (_ BitVec 32)) SeekEntryResult!943)

(assert (=> b!230894 (= lt!116284 (seekEntryOrOpen!0 key!932 (_keys!6354 thiss!1504) (mask!10196 thiss!1504)))))

(declare-fun b!230895 () Bool)

(declare-fun Unit!7084 () Unit!7081)

(assert (=> b!230895 (= e!149856 Unit!7084)))

(declare-fun lt!116283 () Unit!7081)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!294 (array!11383 array!11381 (_ BitVec 32) (_ BitVec 32) V!7739 V!7739 (_ BitVec 64) Int) Unit!7081)

(assert (=> b!230895 (= lt!116283 (lemmaInListMapThenSeekEntryOrOpenFindsIt!294 (_keys!6354 thiss!1504) (_values!4283 thiss!1504) (mask!10196 thiss!1504) (extraKeys!4037 thiss!1504) (zeroValue!4141 thiss!1504) (minValue!4141 thiss!1504) key!932 (defaultEntry!4300 thiss!1504)))))

(assert (=> b!230895 false))

(declare-fun b!230896 () Bool)

(declare-fun res!113521 () Bool)

(assert (=> b!230896 (=> (not res!113521) (not e!149860))))

(assert (=> b!230896 (= res!113521 (= (select (arr!5411 (_keys!6354 thiss!1504)) (index!5942 lt!116284)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230897 () Bool)

(assert (=> b!230897 (= e!149861 e!149854)))

(declare-fun res!113515 () Bool)

(assert (=> b!230897 (=> (not res!113515) (not e!149854))))

(assert (=> b!230897 (= res!113515 (inRange!0 index!297 (mask!10196 thiss!1504)))))

(declare-fun lt!116277 () Unit!7081)

(assert (=> b!230897 (= lt!116277 e!149856)))

(declare-fun c!38338 () Bool)

(declare-fun contains!1615 (ListLongMap!3455 (_ BitVec 64)) Bool)

(assert (=> b!230897 (= c!38338 (contains!1615 lt!116275 key!932))))

(assert (=> b!230897 (= lt!116275 (getCurrentListMap!1271 (_keys!6354 thiss!1504) (_values!4283 thiss!1504) (mask!10196 thiss!1504) (extraKeys!4037 thiss!1504) (zeroValue!4141 thiss!1504) (minValue!4141 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4300 thiss!1504)))))

(declare-fun b!230898 () Bool)

(declare-fun Unit!7085 () Unit!7081)

(assert (=> b!230898 (= e!149857 Unit!7085)))

(declare-fun lt!116286 () Unit!7081)

(declare-fun lemmaArrayContainsKeyThenInListMap!129 (array!11383 array!11381 (_ BitVec 32) (_ BitVec 32) V!7739 V!7739 (_ BitVec 64) (_ BitVec 32) Int) Unit!7081)

(assert (=> b!230898 (= lt!116286 (lemmaArrayContainsKeyThenInListMap!129 (_keys!6354 thiss!1504) (_values!4283 thiss!1504) (mask!10196 thiss!1504) (extraKeys!4037 thiss!1504) (zeroValue!4141 thiss!1504) (minValue!4141 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4300 thiss!1504)))))

(assert (=> b!230898 false))

(declare-fun b!230899 () Bool)

(declare-fun res!113520 () Bool)

(assert (=> b!230899 (=> (not res!113520) (not e!149862))))

(assert (=> b!230899 (= res!113520 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10273 () Bool)

(declare-fun tp!21763 () Bool)

(assert (=> mapNonEmpty!10273 (= mapRes!10273 (and tp!21763 e!149853))))

(declare-fun mapRest!10273 () (Array (_ BitVec 32) ValueCell!2691))

(declare-fun mapValue!10273 () ValueCell!2691)

(declare-fun mapKey!10273 () (_ BitVec 32))

(assert (=> mapNonEmpty!10273 (= (arr!5410 (_values!4283 thiss!1504)) (store mapRest!10273 mapKey!10273 mapValue!10273))))

(assert (= (and start!22140 res!113517) b!230899))

(assert (= (and b!230899 res!113520) b!230894))

(assert (= (and b!230894 res!113514) b!230897))

(assert (= (and b!230897 c!38338) b!230895))

(assert (= (and b!230897 (not c!38338)) b!230880))

(assert (= (and b!230880 c!38340) b!230884))

(assert (= (and b!230880 (not c!38340)) b!230890))

(assert (= (and b!230884 res!113519) b!230896))

(assert (= (and b!230896 res!113521) b!230889))

(assert (= (and b!230890 c!38337) b!230883))

(assert (= (and b!230890 (not c!38337)) b!230885))

(assert (= (and b!230883 res!113516) b!230882))

(assert (= (and b!230882 res!113518) b!230888))

(assert (= (or b!230884 b!230883) bm!21452))

(assert (= (or b!230889 b!230888) bm!21453))

(assert (= (and b!230897 res!113515) b!230887))

(assert (= (and b!230887 c!38339) b!230898))

(assert (= (and b!230887 (not c!38339)) b!230886))

(assert (= (and b!230891 condMapEmpty!10273) mapIsEmpty!10273))

(assert (= (and b!230891 (not condMapEmpty!10273)) mapNonEmpty!10273))

(assert (= (and mapNonEmpty!10273 ((_ is ValueCellFull!2691) mapValue!10273)) b!230881))

(assert (= (and b!230891 ((_ is ValueCellFull!2691) mapDefault!10273)) b!230892))

(assert (= b!230893 b!230891))

(assert (= start!22140 b!230893))

(declare-fun m!252253 () Bool)

(assert (=> b!230880 m!252253))

(declare-fun m!252255 () Bool)

(assert (=> b!230893 m!252255))

(declare-fun m!252257 () Bool)

(assert (=> b!230893 m!252257))

(declare-fun m!252259 () Bool)

(assert (=> bm!21452 m!252259))

(declare-fun m!252261 () Bool)

(assert (=> b!230898 m!252261))

(declare-fun m!252263 () Bool)

(assert (=> bm!21453 m!252263))

(declare-fun m!252265 () Bool)

(assert (=> b!230895 m!252265))

(declare-fun m!252267 () Bool)

(assert (=> b!230896 m!252267))

(assert (=> b!230887 m!252263))

(declare-fun m!252269 () Bool)

(assert (=> b!230887 m!252269))

(declare-fun m!252271 () Bool)

(assert (=> b!230887 m!252271))

(declare-fun m!252273 () Bool)

(assert (=> b!230887 m!252273))

(declare-fun m!252275 () Bool)

(assert (=> b!230887 m!252275))

(declare-fun m!252277 () Bool)

(assert (=> b!230887 m!252277))

(declare-fun m!252279 () Bool)

(assert (=> b!230887 m!252279))

(declare-fun m!252281 () Bool)

(assert (=> b!230887 m!252281))

(declare-fun m!252283 () Bool)

(assert (=> b!230887 m!252283))

(declare-fun m!252285 () Bool)

(assert (=> b!230887 m!252285))

(declare-fun m!252287 () Bool)

(assert (=> b!230887 m!252287))

(declare-fun m!252289 () Bool)

(assert (=> b!230887 m!252289))

(declare-fun m!252291 () Bool)

(assert (=> b!230887 m!252291))

(declare-fun m!252293 () Bool)

(assert (=> b!230887 m!252293))

(declare-fun m!252295 () Bool)

(assert (=> b!230887 m!252295))

(declare-fun m!252297 () Bool)

(assert (=> b!230887 m!252297))

(declare-fun m!252299 () Bool)

(assert (=> b!230887 m!252299))

(declare-fun m!252301 () Bool)

(assert (=> mapNonEmpty!10273 m!252301))

(declare-fun m!252303 () Bool)

(assert (=> b!230897 m!252303))

(declare-fun m!252305 () Bool)

(assert (=> b!230897 m!252305))

(declare-fun m!252307 () Bool)

(assert (=> b!230897 m!252307))

(declare-fun m!252309 () Bool)

(assert (=> b!230882 m!252309))

(declare-fun m!252311 () Bool)

(assert (=> start!22140 m!252311))

(declare-fun m!252313 () Bool)

(assert (=> b!230894 m!252313))

(check-sat (not mapNonEmpty!10273) (not b!230898) (not start!22140) (not bm!21452) tp_is_empty!6069 (not b!230893) b_and!13105 (not b!230880) (not b!230895) (not bm!21453) (not b!230887) (not b!230894) (not b!230897) (not b_next!6207))
(check-sat b_and!13105 (not b_next!6207))
