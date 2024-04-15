; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25132 () Bool)

(assert start!25132)

(declare-fun b!261642 () Bool)

(declare-fun b_free!6775 () Bool)

(declare-fun b_next!6775 () Bool)

(assert (=> b!261642 (= b_free!6775 (not b_next!6775))))

(declare-fun tp!23656 () Bool)

(declare-fun b_and!13883 () Bool)

(assert (=> b!261642 (= tp!23656 b_and!13883)))

(declare-fun b!261637 () Bool)

(declare-fun e!169544 () Bool)

(declare-fun tp_is_empty!6637 () Bool)

(assert (=> b!261637 (= e!169544 tp_is_empty!6637)))

(declare-fun b!261638 () Bool)

(declare-fun res!127800 () Bool)

(declare-fun e!169537 () Bool)

(assert (=> b!261638 (=> (not res!127800) (not e!169537))))

(declare-datatypes ((V!8497 0))(
  ( (V!8498 (val!3363 Int)) )
))
(declare-datatypes ((ValueCell!2975 0))(
  ( (ValueCellFull!2975 (v!5482 V!8497)) (EmptyCell!2975) )
))
(declare-datatypes ((array!12623 0))(
  ( (array!12624 (arr!5973 (Array (_ BitVec 32) ValueCell!2975)) (size!6325 (_ BitVec 32))) )
))
(declare-datatypes ((array!12625 0))(
  ( (array!12626 (arr!5974 (Array (_ BitVec 32) (_ BitVec 64))) (size!6326 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3850 0))(
  ( (LongMapFixedSize!3851 (defaultEntry!4823 Int) (mask!11172 (_ BitVec 32)) (extraKeys!4560 (_ BitVec 32)) (zeroValue!4664 V!8497) (minValue!4664 V!8497) (_size!1974 (_ BitVec 32)) (_keys!7010 array!12625) (_values!4806 array!12623) (_vacant!1974 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3850)

(declare-datatypes ((SeekEntryResult!1185 0))(
  ( (MissingZero!1185 (index!6910 (_ BitVec 32))) (Found!1185 (index!6911 (_ BitVec 32))) (Intermediate!1185 (undefined!1997 Bool) (index!6912 (_ BitVec 32)) (x!25182 (_ BitVec 32))) (Undefined!1185) (MissingVacant!1185 (index!6913 (_ BitVec 32))) )
))
(declare-fun lt!132037 () SeekEntryResult!1185)

(assert (=> b!261638 (= res!127800 (= (select (arr!5974 (_keys!7010 thiss!1504)) (index!6910 lt!132037)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24970 () Bool)

(declare-fun c!44562 () Bool)

(declare-fun call!24974 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24970 (= call!24974 (inRange!0 (ite c!44562 (index!6910 lt!132037) (index!6913 lt!132037)) (mask!11172 thiss!1504)))))

(declare-fun b!261639 () Bool)

(declare-fun e!169546 () Bool)

(assert (=> b!261639 (= e!169546 tp_is_empty!6637)))

(declare-fun bm!24971 () Bool)

(declare-fun call!24973 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24971 (= call!24973 (arrayContainsKey!0 (_keys!7010 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261640 () Bool)

(declare-datatypes ((Unit!8095 0))(
  ( (Unit!8096) )
))
(declare-fun e!169538 () Unit!8095)

(declare-fun lt!132039 () Unit!8095)

(assert (=> b!261640 (= e!169538 lt!132039)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!444 (array!12625 array!12623 (_ BitVec 32) (_ BitVec 32) V!8497 V!8497 (_ BitVec 64) Int) Unit!8095)

(assert (=> b!261640 (= lt!132039 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!444 (_keys!7010 thiss!1504) (_values!4806 thiss!1504) (mask!11172 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) key!932 (defaultEntry!4823 thiss!1504)))))

(get-info :version)

(assert (=> b!261640 (= c!44562 ((_ is MissingZero!1185) lt!132037))))

(declare-fun e!169545 () Bool)

(assert (=> b!261640 e!169545))

(declare-fun b!261641 () Bool)

(declare-fun Unit!8097 () Unit!8095)

(assert (=> b!261641 (= e!169538 Unit!8097)))

(declare-fun lt!132042 () Unit!8095)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!442 (array!12625 array!12623 (_ BitVec 32) (_ BitVec 32) V!8497 V!8497 (_ BitVec 64) Int) Unit!8095)

(assert (=> b!261641 (= lt!132042 (lemmaInListMapThenSeekEntryOrOpenFindsIt!442 (_keys!7010 thiss!1504) (_values!4806 thiss!1504) (mask!11172 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) key!932 (defaultEntry!4823 thiss!1504)))))

(assert (=> b!261641 false))

(declare-fun e!169543 () Bool)

(declare-fun e!169533 () Bool)

(declare-fun array_inv!3953 (array!12625) Bool)

(declare-fun array_inv!3954 (array!12623) Bool)

(assert (=> b!261642 (= e!169533 (and tp!23656 tp_is_empty!6637 (array_inv!3953 (_keys!7010 thiss!1504)) (array_inv!3954 (_values!4806 thiss!1504)) e!169543))))

(declare-fun mapIsEmpty!11314 () Bool)

(declare-fun mapRes!11314 () Bool)

(assert (=> mapIsEmpty!11314 mapRes!11314))

(declare-fun b!261643 () Bool)

(assert (=> b!261643 (= e!169537 (not call!24973))))

(declare-fun b!261644 () Bool)

(declare-fun res!127801 () Bool)

(assert (=> b!261644 (= res!127801 (= (select (arr!5974 (_keys!7010 thiss!1504)) (index!6913 lt!132037)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169539 () Bool)

(assert (=> b!261644 (=> (not res!127801) (not e!169539))))

(declare-fun b!261645 () Bool)

(declare-fun e!169536 () Bool)

(declare-fun e!169541 () Bool)

(assert (=> b!261645 (= e!169536 e!169541)))

(declare-fun res!127799 () Bool)

(assert (=> b!261645 (=> (not res!127799) (not e!169541))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!261645 (= res!127799 (inRange!0 index!297 (mask!11172 thiss!1504)))))

(declare-fun lt!132034 () Unit!8095)

(assert (=> b!261645 (= lt!132034 e!169538)))

(declare-fun c!44561 () Bool)

(declare-datatypes ((tuple2!4908 0))(
  ( (tuple2!4909 (_1!2465 (_ BitVec 64)) (_2!2465 V!8497)) )
))
(declare-datatypes ((List!3806 0))(
  ( (Nil!3803) (Cons!3802 (h!4468 tuple2!4908) (t!8870 List!3806)) )
))
(declare-datatypes ((ListLongMap!3811 0))(
  ( (ListLongMap!3812 (toList!1921 List!3806)) )
))
(declare-fun lt!132047 () ListLongMap!3811)

(declare-fun contains!1879 (ListLongMap!3811 (_ BitVec 64)) Bool)

(assert (=> b!261645 (= c!44561 (contains!1879 lt!132047 key!932))))

(declare-fun getCurrentListMap!1430 (array!12625 array!12623 (_ BitVec 32) (_ BitVec 32) V!8497 V!8497 (_ BitVec 32) Int) ListLongMap!3811)

(assert (=> b!261645 (= lt!132047 (getCurrentListMap!1430 (_keys!7010 thiss!1504) (_values!4806 thiss!1504) (mask!11172 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4823 thiss!1504)))))

(declare-fun b!261646 () Bool)

(declare-fun res!127798 () Bool)

(assert (=> b!261646 (=> (not res!127798) (not e!169537))))

(assert (=> b!261646 (= res!127798 call!24974)))

(assert (=> b!261646 (= e!169545 e!169537)))

(declare-fun b!261647 () Bool)

(assert (=> b!261647 (= e!169539 (not call!24973))))

(declare-fun b!261648 () Bool)

(declare-fun res!127797 () Bool)

(declare-fun e!169535 () Bool)

(assert (=> b!261648 (=> (not res!127797) (not e!169535))))

(assert (=> b!261648 (= res!127797 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!11314 () Bool)

(declare-fun tp!23655 () Bool)

(assert (=> mapNonEmpty!11314 (= mapRes!11314 (and tp!23655 e!169544))))

(declare-fun mapKey!11314 () (_ BitVec 32))

(declare-fun mapValue!11314 () ValueCell!2975)

(declare-fun mapRest!11314 () (Array (_ BitVec 32) ValueCell!2975))

(assert (=> mapNonEmpty!11314 (= (arr!5973 (_values!4806 thiss!1504)) (store mapRest!11314 mapKey!11314 mapValue!11314))))

(declare-fun b!261649 () Bool)

(declare-fun e!169540 () Unit!8095)

(declare-fun Unit!8098 () Unit!8095)

(assert (=> b!261649 (= e!169540 Unit!8098)))

(declare-fun b!261650 () Bool)

(declare-fun e!169542 () Bool)

(assert (=> b!261650 (= e!169542 ((_ is Undefined!1185) lt!132037))))

(declare-fun b!261651 () Bool)

(assert (=> b!261651 (= e!169535 e!169536)))

(declare-fun res!127795 () Bool)

(assert (=> b!261651 (=> (not res!127795) (not e!169536))))

(assert (=> b!261651 (= res!127795 (or (= lt!132037 (MissingZero!1185 index!297)) (= lt!132037 (MissingVacant!1185 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12625 (_ BitVec 32)) SeekEntryResult!1185)

(assert (=> b!261651 (= lt!132037 (seekEntryOrOpen!0 key!932 (_keys!7010 thiss!1504) (mask!11172 thiss!1504)))))

(declare-fun b!261652 () Bool)

(declare-fun c!44559 () Bool)

(assert (=> b!261652 (= c!44559 ((_ is MissingVacant!1185) lt!132037))))

(assert (=> b!261652 (= e!169545 e!169542)))

(declare-fun res!127802 () Bool)

(assert (=> start!25132 (=> (not res!127802) (not e!169535))))

(declare-fun valid!1507 (LongMapFixedSize!3850) Bool)

(assert (=> start!25132 (= res!127802 (valid!1507 thiss!1504))))

(assert (=> start!25132 e!169535))

(assert (=> start!25132 e!169533))

(assert (=> start!25132 true))

(assert (=> start!25132 tp_is_empty!6637))

(declare-fun b!261653 () Bool)

(declare-fun Unit!8099 () Unit!8095)

(assert (=> b!261653 (= e!169540 Unit!8099)))

(declare-fun lt!132038 () Unit!8095)

(declare-fun lemmaArrayContainsKeyThenInListMap!255 (array!12625 array!12623 (_ BitVec 32) (_ BitVec 32) V!8497 V!8497 (_ BitVec 64) (_ BitVec 32) Int) Unit!8095)

(assert (=> b!261653 (= lt!132038 (lemmaArrayContainsKeyThenInListMap!255 (_keys!7010 thiss!1504) (_values!4806 thiss!1504) (mask!11172 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4823 thiss!1504)))))

(assert (=> b!261653 false))

(declare-fun b!261654 () Bool)

(assert (=> b!261654 (= e!169543 (and e!169546 mapRes!11314))))

(declare-fun condMapEmpty!11314 () Bool)

(declare-fun mapDefault!11314 () ValueCell!2975)

(assert (=> b!261654 (= condMapEmpty!11314 (= (arr!5973 (_values!4806 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2975)) mapDefault!11314)))))

(declare-fun b!261655 () Bool)

(assert (=> b!261655 (= e!169542 e!169539)))

(declare-fun res!127796 () Bool)

(assert (=> b!261655 (= res!127796 call!24974)))

(assert (=> b!261655 (=> (not res!127796) (not e!169539))))

(declare-fun b!261656 () Bool)

(assert (=> b!261656 (= e!169541 (not true))))

(declare-fun lt!132040 () array!12625)

(declare-fun arrayCountValidKeys!0 (array!12625 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261656 (= (arrayCountValidKeys!0 lt!132040 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132046 () Unit!8095)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12625 (_ BitVec 32)) Unit!8095)

(assert (=> b!261656 (= lt!132046 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132040 index!297))))

(assert (=> b!261656 (arrayContainsKey!0 lt!132040 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132041 () Unit!8095)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12625 (_ BitVec 64) (_ BitVec 32)) Unit!8095)

(assert (=> b!261656 (= lt!132041 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132040 key!932 index!297))))

(declare-fun v!346 () V!8497)

(declare-fun +!708 (ListLongMap!3811 tuple2!4908) ListLongMap!3811)

(assert (=> b!261656 (= (+!708 lt!132047 (tuple2!4909 key!932 v!346)) (getCurrentListMap!1430 lt!132040 (array!12624 (store (arr!5973 (_values!4806 thiss!1504)) index!297 (ValueCellFull!2975 v!346)) (size!6325 (_values!4806 thiss!1504))) (mask!11172 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4823 thiss!1504)))))

(declare-fun lt!132036 () Unit!8095)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!119 (array!12625 array!12623 (_ BitVec 32) (_ BitVec 32) V!8497 V!8497 (_ BitVec 32) (_ BitVec 64) V!8497 Int) Unit!8095)

(assert (=> b!261656 (= lt!132036 (lemmaAddValidKeyToArrayThenAddPairToListMap!119 (_keys!7010 thiss!1504) (_values!4806 thiss!1504) (mask!11172 thiss!1504) (extraKeys!4560 thiss!1504) (zeroValue!4664 thiss!1504) (minValue!4664 thiss!1504) index!297 key!932 v!346 (defaultEntry!4823 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12625 (_ BitVec 32)) Bool)

(assert (=> b!261656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132040 (mask!11172 thiss!1504))))

(declare-fun lt!132035 () Unit!8095)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12625 (_ BitVec 32) (_ BitVec 32)) Unit!8095)

(assert (=> b!261656 (= lt!132035 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7010 thiss!1504) index!297 (mask!11172 thiss!1504)))))

(assert (=> b!261656 (= (arrayCountValidKeys!0 lt!132040 #b00000000000000000000000000000000 (size!6326 (_keys!7010 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7010 thiss!1504) #b00000000000000000000000000000000 (size!6326 (_keys!7010 thiss!1504)))))))

(declare-fun lt!132044 () Unit!8095)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12625 (_ BitVec 32) (_ BitVec 64)) Unit!8095)

(assert (=> b!261656 (= lt!132044 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7010 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3807 0))(
  ( (Nil!3804) (Cons!3803 (h!4469 (_ BitVec 64)) (t!8871 List!3807)) )
))
(declare-fun arrayNoDuplicates!0 (array!12625 (_ BitVec 32) List!3807) Bool)

(assert (=> b!261656 (arrayNoDuplicates!0 lt!132040 #b00000000000000000000000000000000 Nil!3804)))

(assert (=> b!261656 (= lt!132040 (array!12626 (store (arr!5974 (_keys!7010 thiss!1504)) index!297 key!932) (size!6326 (_keys!7010 thiss!1504))))))

(declare-fun lt!132045 () Unit!8095)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3807) Unit!8095)

(assert (=> b!261656 (= lt!132045 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7010 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3804))))

(declare-fun lt!132043 () Unit!8095)

(assert (=> b!261656 (= lt!132043 e!169540)))

(declare-fun c!44560 () Bool)

(assert (=> b!261656 (= c!44560 (arrayContainsKey!0 (_keys!7010 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!25132 res!127802) b!261648))

(assert (= (and b!261648 res!127797) b!261651))

(assert (= (and b!261651 res!127795) b!261645))

(assert (= (and b!261645 c!44561) b!261641))

(assert (= (and b!261645 (not c!44561)) b!261640))

(assert (= (and b!261640 c!44562) b!261646))

(assert (= (and b!261640 (not c!44562)) b!261652))

(assert (= (and b!261646 res!127798) b!261638))

(assert (= (and b!261638 res!127800) b!261643))

(assert (= (and b!261652 c!44559) b!261655))

(assert (= (and b!261652 (not c!44559)) b!261650))

(assert (= (and b!261655 res!127796) b!261644))

(assert (= (and b!261644 res!127801) b!261647))

(assert (= (or b!261646 b!261655) bm!24970))

(assert (= (or b!261643 b!261647) bm!24971))

(assert (= (and b!261645 res!127799) b!261656))

(assert (= (and b!261656 c!44560) b!261653))

(assert (= (and b!261656 (not c!44560)) b!261649))

(assert (= (and b!261654 condMapEmpty!11314) mapIsEmpty!11314))

(assert (= (and b!261654 (not condMapEmpty!11314)) mapNonEmpty!11314))

(assert (= (and mapNonEmpty!11314 ((_ is ValueCellFull!2975) mapValue!11314)) b!261637))

(assert (= (and b!261654 ((_ is ValueCellFull!2975) mapDefault!11314)) b!261639))

(assert (= b!261642 b!261654))

(assert (= start!25132 b!261642))

(declare-fun m!277255 () Bool)

(assert (=> b!261638 m!277255))

(declare-fun m!277257 () Bool)

(assert (=> bm!24971 m!277257))

(declare-fun m!277259 () Bool)

(assert (=> b!261645 m!277259))

(declare-fun m!277261 () Bool)

(assert (=> b!261645 m!277261))

(declare-fun m!277263 () Bool)

(assert (=> b!261645 m!277263))

(declare-fun m!277265 () Bool)

(assert (=> b!261641 m!277265))

(declare-fun m!277267 () Bool)

(assert (=> b!261653 m!277267))

(declare-fun m!277269 () Bool)

(assert (=> b!261640 m!277269))

(declare-fun m!277271 () Bool)

(assert (=> start!25132 m!277271))

(declare-fun m!277273 () Bool)

(assert (=> b!261642 m!277273))

(declare-fun m!277275 () Bool)

(assert (=> b!261642 m!277275))

(declare-fun m!277277 () Bool)

(assert (=> b!261651 m!277277))

(declare-fun m!277279 () Bool)

(assert (=> b!261644 m!277279))

(declare-fun m!277281 () Bool)

(assert (=> b!261656 m!277281))

(declare-fun m!277283 () Bool)

(assert (=> b!261656 m!277283))

(declare-fun m!277285 () Bool)

(assert (=> b!261656 m!277285))

(declare-fun m!277287 () Bool)

(assert (=> b!261656 m!277287))

(declare-fun m!277289 () Bool)

(assert (=> b!261656 m!277289))

(declare-fun m!277291 () Bool)

(assert (=> b!261656 m!277291))

(declare-fun m!277293 () Bool)

(assert (=> b!261656 m!277293))

(declare-fun m!277295 () Bool)

(assert (=> b!261656 m!277295))

(assert (=> b!261656 m!277257))

(declare-fun m!277297 () Bool)

(assert (=> b!261656 m!277297))

(declare-fun m!277299 () Bool)

(assert (=> b!261656 m!277299))

(declare-fun m!277301 () Bool)

(assert (=> b!261656 m!277301))

(declare-fun m!277303 () Bool)

(assert (=> b!261656 m!277303))

(declare-fun m!277305 () Bool)

(assert (=> b!261656 m!277305))

(declare-fun m!277307 () Bool)

(assert (=> b!261656 m!277307))

(declare-fun m!277309 () Bool)

(assert (=> b!261656 m!277309))

(declare-fun m!277311 () Bool)

(assert (=> b!261656 m!277311))

(declare-fun m!277313 () Bool)

(assert (=> mapNonEmpty!11314 m!277313))

(declare-fun m!277315 () Bool)

(assert (=> bm!24970 m!277315))

(check-sat (not mapNonEmpty!11314) (not bm!24971) (not b!261641) b_and!13883 (not b!261653) (not b!261656) (not b!261645) (not b_next!6775) (not b!261640) (not start!25132) (not bm!24970) (not b!261651) (not b!261642) tp_is_empty!6637)
(check-sat b_and!13883 (not b_next!6775))
