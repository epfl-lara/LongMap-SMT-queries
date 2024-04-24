; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24514 () Bool)

(assert start!24514)

(declare-fun b!256714 () Bool)

(declare-fun b_free!6721 () Bool)

(declare-fun b_next!6721 () Bool)

(assert (=> b!256714 (= b_free!6721 (not b_next!6721))))

(declare-fun tp!23466 () Bool)

(declare-fun b_and!13797 () Bool)

(assert (=> b!256714 (= tp!23466 b_and!13797)))

(declare-fun b!256706 () Bool)

(declare-fun e!166405 () Bool)

(declare-fun e!166404 () Bool)

(assert (=> b!256706 (= e!166405 (not e!166404))))

(declare-fun res!125584 () Bool)

(assert (=> b!256706 (=> (not res!125584) (not e!166404))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8425 0))(
  ( (V!8426 (val!3336 Int)) )
))
(declare-datatypes ((ValueCell!2948 0))(
  ( (ValueCellFull!2948 (v!5426 V!8425)) (EmptyCell!2948) )
))
(declare-datatypes ((array!12505 0))(
  ( (array!12506 (arr!5923 (Array (_ BitVec 32) ValueCell!2948)) (size!6270 (_ BitVec 32))) )
))
(declare-datatypes ((array!12507 0))(
  ( (array!12508 (arr!5924 (Array (_ BitVec 32) (_ BitVec 64))) (size!6271 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3796 0))(
  ( (LongMapFixedSize!3797 (defaultEntry!4736 Int) (mask!11014 (_ BitVec 32)) (extraKeys!4473 (_ BitVec 32)) (zeroValue!4577 V!8425) (minValue!4577 V!8425) (_size!1947 (_ BitVec 32)) (_keys!6900 array!12507) (_values!4719 array!12505) (_vacant!1947 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3796)

(assert (=> b!256706 (= res!125584 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6271 (_keys!6900 thiss!1504)))))))

(declare-fun lt!128967 () array!12507)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!256706 (arrayContainsKey!0 lt!128967 key!932 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!7937 0))(
  ( (Unit!7938) )
))
(declare-fun lt!128970 () Unit!7937)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12507 (_ BitVec 64) (_ BitVec 32)) Unit!7937)

(assert (=> b!256706 (= lt!128970 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128967 key!932 index!297))))

(declare-fun v!346 () V!8425)

(declare-datatypes ((tuple2!4828 0))(
  ( (tuple2!4829 (_1!2425 (_ BitVec 64)) (_2!2425 V!8425)) )
))
(declare-datatypes ((List!3706 0))(
  ( (Nil!3703) (Cons!3702 (h!4364 tuple2!4828) (t!8755 List!3706)) )
))
(declare-datatypes ((ListLongMap!3743 0))(
  ( (ListLongMap!3744 (toList!1887 List!3706)) )
))
(declare-fun lt!128968 () ListLongMap!3743)

(declare-fun +!684 (ListLongMap!3743 tuple2!4828) ListLongMap!3743)

(declare-fun getCurrentListMap!1419 (array!12507 array!12505 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 32) Int) ListLongMap!3743)

(assert (=> b!256706 (= (+!684 lt!128968 (tuple2!4829 key!932 v!346)) (getCurrentListMap!1419 lt!128967 (array!12506 (store (arr!5923 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6270 (_values!4719 thiss!1504))) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!128971 () Unit!7937)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!99 (array!12507 array!12505 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 32) (_ BitVec 64) V!8425 Int) Unit!7937)

(assert (=> b!256706 (= lt!128971 (lemmaAddValidKeyToArrayThenAddPairToListMap!99 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) index!297 key!932 v!346 (defaultEntry!4736 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12507 (_ BitVec 32)) Bool)

(assert (=> b!256706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128967 (mask!11014 thiss!1504))))

(declare-fun lt!128975 () Unit!7937)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12507 (_ BitVec 32) (_ BitVec 32)) Unit!7937)

(assert (=> b!256706 (= lt!128975 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6900 thiss!1504) index!297 (mask!11014 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12507 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!256706 (= (arrayCountValidKeys!0 lt!128967 #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6900 thiss!1504) #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504)))))))

(declare-fun lt!128969 () Unit!7937)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12507 (_ BitVec 32) (_ BitVec 64)) Unit!7937)

(assert (=> b!256706 (= lt!128969 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6900 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3707 0))(
  ( (Nil!3704) (Cons!3703 (h!4365 (_ BitVec 64)) (t!8756 List!3707)) )
))
(declare-fun arrayNoDuplicates!0 (array!12507 (_ BitVec 32) List!3707) Bool)

(assert (=> b!256706 (arrayNoDuplicates!0 lt!128967 #b00000000000000000000000000000000 Nil!3704)))

(assert (=> b!256706 (= lt!128967 (array!12508 (store (arr!5924 (_keys!6900 thiss!1504)) index!297 key!932) (size!6271 (_keys!6900 thiss!1504))))))

(declare-fun lt!128972 () Unit!7937)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12507 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3707) Unit!7937)

(assert (=> b!256706 (= lt!128972 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6900 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3704))))

(declare-fun lt!128965 () Unit!7937)

(declare-fun e!166394 () Unit!7937)

(assert (=> b!256706 (= lt!128965 e!166394)))

(declare-fun c!43410 () Bool)

(assert (=> b!256706 (= c!43410 (arrayContainsKey!0 (_keys!6900 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256707 () Bool)

(declare-fun e!166406 () Bool)

(declare-fun call!24317 () Bool)

(assert (=> b!256707 (= e!166406 (not call!24317))))

(declare-fun b!256708 () Bool)

(declare-fun e!166400 () Bool)

(declare-fun e!166402 () Bool)

(assert (=> b!256708 (= e!166400 e!166402)))

(declare-fun res!125590 () Bool)

(assert (=> b!256708 (=> (not res!125590) (not e!166402))))

(declare-datatypes ((SeekEntryResult!1132 0))(
  ( (MissingZero!1132 (index!6698 (_ BitVec 32))) (Found!1132 (index!6699 (_ BitVec 32))) (Intermediate!1132 (undefined!1944 Bool) (index!6700 (_ BitVec 32)) (x!24946 (_ BitVec 32))) (Undefined!1132) (MissingVacant!1132 (index!6701 (_ BitVec 32))) )
))
(declare-fun lt!128963 () SeekEntryResult!1132)

(assert (=> b!256708 (= res!125590 (or (= lt!128963 (MissingZero!1132 index!297)) (= lt!128963 (MissingVacant!1132 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12507 (_ BitVec 32)) SeekEntryResult!1132)

(assert (=> b!256708 (= lt!128963 (seekEntryOrOpen!0 key!932 (_keys!6900 thiss!1504) (mask!11014 thiss!1504)))))

(declare-fun b!256709 () Bool)

(declare-fun res!125589 () Bool)

(declare-fun e!166397 () Bool)

(assert (=> b!256709 (=> (not res!125589) (not e!166397))))

(declare-fun call!24316 () Bool)

(assert (=> b!256709 (= res!125589 call!24316)))

(declare-fun e!166398 () Bool)

(assert (=> b!256709 (= e!166398 e!166397)))

(declare-fun b!256710 () Bool)

(declare-fun e!166403 () Bool)

(declare-fun e!166401 () Bool)

(declare-fun mapRes!11205 () Bool)

(assert (=> b!256710 (= e!166403 (and e!166401 mapRes!11205))))

(declare-fun condMapEmpty!11205 () Bool)

(declare-fun mapDefault!11205 () ValueCell!2948)

(assert (=> b!256710 (= condMapEmpty!11205 (= (arr!5923 (_values!4719 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2948)) mapDefault!11205)))))

(declare-fun bm!24313 () Bool)

(assert (=> bm!24313 (= call!24317 (arrayContainsKey!0 (_keys!6900 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256711 () Bool)

(declare-fun res!125588 () Bool)

(assert (=> b!256711 (=> (not res!125588) (not e!166400))))

(assert (=> b!256711 (= res!125588 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!256712 () Bool)

(assert (=> b!256712 (= e!166404 (bvslt (size!6271 (_keys!6900 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!256713 () Bool)

(declare-fun e!166399 () Bool)

(declare-fun tp_is_empty!6583 () Bool)

(assert (=> b!256713 (= e!166399 tp_is_empty!6583)))

(declare-fun e!166395 () Bool)

(declare-fun array_inv!3895 (array!12507) Bool)

(declare-fun array_inv!3896 (array!12505) Bool)

(assert (=> b!256714 (= e!166395 (and tp!23466 tp_is_empty!6583 (array_inv!3895 (_keys!6900 thiss!1504)) (array_inv!3896 (_values!4719 thiss!1504)) e!166403))))

(declare-fun mapNonEmpty!11205 () Bool)

(declare-fun tp!23465 () Bool)

(assert (=> mapNonEmpty!11205 (= mapRes!11205 (and tp!23465 e!166399))))

(declare-fun mapValue!11205 () ValueCell!2948)

(declare-fun mapKey!11205 () (_ BitVec 32))

(declare-fun mapRest!11205 () (Array (_ BitVec 32) ValueCell!2948))

(assert (=> mapNonEmpty!11205 (= (arr!5923 (_values!4719 thiss!1504)) (store mapRest!11205 mapKey!11205 mapValue!11205))))

(declare-fun mapIsEmpty!11205 () Bool)

(assert (=> mapIsEmpty!11205 mapRes!11205))

(declare-fun b!256716 () Bool)

(assert (=> b!256716 (= e!166402 e!166405)))

(declare-fun res!125583 () Bool)

(assert (=> b!256716 (=> (not res!125583) (not e!166405))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256716 (= res!125583 (inRange!0 index!297 (mask!11014 thiss!1504)))))

(declare-fun lt!128974 () Unit!7937)

(declare-fun e!166393 () Unit!7937)

(assert (=> b!256716 (= lt!128974 e!166393)))

(declare-fun c!43408 () Bool)

(declare-fun contains!1842 (ListLongMap!3743 (_ BitVec 64)) Bool)

(assert (=> b!256716 (= c!43408 (contains!1842 lt!128968 key!932))))

(assert (=> b!256716 (= lt!128968 (getCurrentListMap!1419 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun b!256717 () Bool)

(declare-fun e!166396 () Bool)

(assert (=> b!256717 (= e!166396 e!166406)))

(declare-fun res!125582 () Bool)

(assert (=> b!256717 (= res!125582 call!24316)))

(assert (=> b!256717 (=> (not res!125582) (not e!166406))))

(declare-fun b!256718 () Bool)

(declare-fun res!125586 () Bool)

(assert (=> b!256718 (=> (not res!125586) (not e!166404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!256718 (= res!125586 (validKeyInArray!0 key!932))))

(declare-fun b!256719 () Bool)

(assert (=> b!256719 (= e!166397 (not call!24317))))

(declare-fun b!256715 () Bool)

(declare-fun res!125587 () Bool)

(assert (=> b!256715 (=> (not res!125587) (not e!166397))))

(assert (=> b!256715 (= res!125587 (= (select (arr!5924 (_keys!6900 thiss!1504)) (index!6698 lt!128963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!125591 () Bool)

(assert (=> start!24514 (=> (not res!125591) (not e!166400))))

(declare-fun valid!1489 (LongMapFixedSize!3796) Bool)

(assert (=> start!24514 (= res!125591 (valid!1489 thiss!1504))))

(assert (=> start!24514 e!166400))

(assert (=> start!24514 e!166395))

(assert (=> start!24514 true))

(assert (=> start!24514 tp_is_empty!6583))

(declare-fun b!256720 () Bool)

(get-info :version)

(assert (=> b!256720 (= e!166396 ((_ is Undefined!1132) lt!128963))))

(declare-fun b!256721 () Bool)

(assert (=> b!256721 (= e!166401 tp_is_empty!6583)))

(declare-fun c!43409 () Bool)

(declare-fun bm!24314 () Bool)

(assert (=> bm!24314 (= call!24316 (inRange!0 (ite c!43409 (index!6698 lt!128963) (index!6701 lt!128963)) (mask!11014 thiss!1504)))))

(declare-fun b!256722 () Bool)

(declare-fun res!125585 () Bool)

(assert (=> b!256722 (= res!125585 (= (select (arr!5924 (_keys!6900 thiss!1504)) (index!6701 lt!128963)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256722 (=> (not res!125585) (not e!166406))))

(declare-fun b!256723 () Bool)

(declare-fun c!43411 () Bool)

(assert (=> b!256723 (= c!43411 ((_ is MissingVacant!1132) lt!128963))))

(assert (=> b!256723 (= e!166398 e!166396)))

(declare-fun b!256724 () Bool)

(declare-fun Unit!7939 () Unit!7937)

(assert (=> b!256724 (= e!166393 Unit!7939)))

(declare-fun lt!128966 () Unit!7937)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!424 (array!12507 array!12505 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) Int) Unit!7937)

(assert (=> b!256724 (= lt!128966 (lemmaInListMapThenSeekEntryOrOpenFindsIt!424 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)))))

(assert (=> b!256724 false))

(declare-fun b!256725 () Bool)

(declare-fun lt!128964 () Unit!7937)

(assert (=> b!256725 (= e!166393 lt!128964)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!417 (array!12507 array!12505 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) Int) Unit!7937)

(assert (=> b!256725 (= lt!128964 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!417 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)))))

(assert (=> b!256725 (= c!43409 ((_ is MissingZero!1132) lt!128963))))

(assert (=> b!256725 e!166398))

(declare-fun b!256726 () Bool)

(declare-fun Unit!7940 () Unit!7937)

(assert (=> b!256726 (= e!166394 Unit!7940)))

(declare-fun b!256727 () Bool)

(declare-fun Unit!7941 () Unit!7937)

(assert (=> b!256727 (= e!166394 Unit!7941)))

(declare-fun lt!128973 () Unit!7937)

(declare-fun lemmaArrayContainsKeyThenInListMap!241 (array!12507 array!12505 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) (_ BitVec 32) Int) Unit!7937)

(assert (=> b!256727 (= lt!128973 (lemmaArrayContainsKeyThenInListMap!241 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(assert (=> b!256727 false))

(assert (= (and start!24514 res!125591) b!256711))

(assert (= (and b!256711 res!125588) b!256708))

(assert (= (and b!256708 res!125590) b!256716))

(assert (= (and b!256716 c!43408) b!256724))

(assert (= (and b!256716 (not c!43408)) b!256725))

(assert (= (and b!256725 c!43409) b!256709))

(assert (= (and b!256725 (not c!43409)) b!256723))

(assert (= (and b!256709 res!125589) b!256715))

(assert (= (and b!256715 res!125587) b!256719))

(assert (= (and b!256723 c!43411) b!256717))

(assert (= (and b!256723 (not c!43411)) b!256720))

(assert (= (and b!256717 res!125582) b!256722))

(assert (= (and b!256722 res!125585) b!256707))

(assert (= (or b!256709 b!256717) bm!24314))

(assert (= (or b!256719 b!256707) bm!24313))

(assert (= (and b!256716 res!125583) b!256706))

(assert (= (and b!256706 c!43410) b!256727))

(assert (= (and b!256706 (not c!43410)) b!256726))

(assert (= (and b!256706 res!125584) b!256718))

(assert (= (and b!256718 res!125586) b!256712))

(assert (= (and b!256710 condMapEmpty!11205) mapIsEmpty!11205))

(assert (= (and b!256710 (not condMapEmpty!11205)) mapNonEmpty!11205))

(assert (= (and mapNonEmpty!11205 ((_ is ValueCellFull!2948) mapValue!11205)) b!256713))

(assert (= (and b!256710 ((_ is ValueCellFull!2948) mapDefault!11205)) b!256721))

(assert (= b!256714 b!256710))

(assert (= start!24514 b!256714))

(declare-fun m!272197 () Bool)

(assert (=> b!256727 m!272197))

(declare-fun m!272199 () Bool)

(assert (=> mapNonEmpty!11205 m!272199))

(declare-fun m!272201 () Bool)

(assert (=> bm!24313 m!272201))

(declare-fun m!272203 () Bool)

(assert (=> bm!24314 m!272203))

(declare-fun m!272205 () Bool)

(assert (=> b!256708 m!272205))

(declare-fun m!272207 () Bool)

(assert (=> b!256718 m!272207))

(declare-fun m!272209 () Bool)

(assert (=> start!24514 m!272209))

(declare-fun m!272211 () Bool)

(assert (=> b!256724 m!272211))

(declare-fun m!272213 () Bool)

(assert (=> b!256725 m!272213))

(declare-fun m!272215 () Bool)

(assert (=> b!256715 m!272215))

(declare-fun m!272217 () Bool)

(assert (=> b!256722 m!272217))

(assert (=> b!256706 m!272201))

(declare-fun m!272219 () Bool)

(assert (=> b!256706 m!272219))

(declare-fun m!272221 () Bool)

(assert (=> b!256706 m!272221))

(declare-fun m!272223 () Bool)

(assert (=> b!256706 m!272223))

(declare-fun m!272225 () Bool)

(assert (=> b!256706 m!272225))

(declare-fun m!272227 () Bool)

(assert (=> b!256706 m!272227))

(declare-fun m!272229 () Bool)

(assert (=> b!256706 m!272229))

(declare-fun m!272231 () Bool)

(assert (=> b!256706 m!272231))

(declare-fun m!272233 () Bool)

(assert (=> b!256706 m!272233))

(declare-fun m!272235 () Bool)

(assert (=> b!256706 m!272235))

(declare-fun m!272237 () Bool)

(assert (=> b!256706 m!272237))

(declare-fun m!272239 () Bool)

(assert (=> b!256706 m!272239))

(declare-fun m!272241 () Bool)

(assert (=> b!256706 m!272241))

(declare-fun m!272243 () Bool)

(assert (=> b!256706 m!272243))

(declare-fun m!272245 () Bool)

(assert (=> b!256706 m!272245))

(declare-fun m!272247 () Bool)

(assert (=> b!256716 m!272247))

(declare-fun m!272249 () Bool)

(assert (=> b!256716 m!272249))

(declare-fun m!272251 () Bool)

(assert (=> b!256716 m!272251))

(declare-fun m!272253 () Bool)

(assert (=> b!256714 m!272253))

(declare-fun m!272255 () Bool)

(assert (=> b!256714 m!272255))

(check-sat (not bm!24313) (not mapNonEmpty!11205) (not b!256706) (not b_next!6721) (not b!256724) (not b!256725) (not bm!24314) (not b!256714) (not b!256708) (not b!256718) (not start!24514) (not b!256716) (not b!256727) b_and!13797 tp_is_empty!6583)
(check-sat b_and!13797 (not b_next!6721))
(get-model)

(declare-fun d!61791 () Bool)

(assert (=> d!61791 (= (array_inv!3895 (_keys!6900 thiss!1504)) (bvsge (size!6271 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256714 d!61791))

(declare-fun d!61793 () Bool)

(assert (=> d!61793 (= (array_inv!3896 (_values!4719 thiss!1504)) (bvsge (size!6270 (_values!4719 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256714 d!61793))

(declare-fun d!61795 () Bool)

(assert (=> d!61795 (= (inRange!0 (ite c!43409 (index!6698 lt!128963) (index!6701 lt!128963)) (mask!11014 thiss!1504)) (and (bvsge (ite c!43409 (index!6698 lt!128963) (index!6701 lt!128963)) #b00000000000000000000000000000000) (bvslt (ite c!43409 (index!6698 lt!128963) (index!6701 lt!128963)) (bvadd (mask!11014 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24314 d!61795))

(declare-fun d!61797 () Bool)

(declare-fun lt!129062 () SeekEntryResult!1132)

(assert (=> d!61797 (and (or ((_ is Undefined!1132) lt!129062) (not ((_ is Found!1132) lt!129062)) (and (bvsge (index!6699 lt!129062) #b00000000000000000000000000000000) (bvslt (index!6699 lt!129062) (size!6271 (_keys!6900 thiss!1504))))) (or ((_ is Undefined!1132) lt!129062) ((_ is Found!1132) lt!129062) (not ((_ is MissingZero!1132) lt!129062)) (and (bvsge (index!6698 lt!129062) #b00000000000000000000000000000000) (bvslt (index!6698 lt!129062) (size!6271 (_keys!6900 thiss!1504))))) (or ((_ is Undefined!1132) lt!129062) ((_ is Found!1132) lt!129062) ((_ is MissingZero!1132) lt!129062) (not ((_ is MissingVacant!1132) lt!129062)) (and (bvsge (index!6701 lt!129062) #b00000000000000000000000000000000) (bvslt (index!6701 lt!129062) (size!6271 (_keys!6900 thiss!1504))))) (or ((_ is Undefined!1132) lt!129062) (ite ((_ is Found!1132) lt!129062) (= (select (arr!5924 (_keys!6900 thiss!1504)) (index!6699 lt!129062)) key!932) (ite ((_ is MissingZero!1132) lt!129062) (= (select (arr!5924 (_keys!6900 thiss!1504)) (index!6698 lt!129062)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1132) lt!129062) (= (select (arr!5924 (_keys!6900 thiss!1504)) (index!6701 lt!129062)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!166505 () SeekEntryResult!1132)

(assert (=> d!61797 (= lt!129062 e!166505)))

(declare-fun c!43442 () Bool)

(declare-fun lt!129061 () SeekEntryResult!1132)

(assert (=> d!61797 (= c!43442 (and ((_ is Intermediate!1132) lt!129061) (undefined!1944 lt!129061)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12507 (_ BitVec 32)) SeekEntryResult!1132)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61797 (= lt!129061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11014 thiss!1504)) key!932 (_keys!6900 thiss!1504) (mask!11014 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61797 (validMask!0 (mask!11014 thiss!1504))))

(assert (=> d!61797 (= (seekEntryOrOpen!0 key!932 (_keys!6900 thiss!1504) (mask!11014 thiss!1504)) lt!129062)))

(declare-fun b!256872 () Bool)

(assert (=> b!256872 (= e!166505 Undefined!1132)))

(declare-fun b!256873 () Bool)

(declare-fun c!43443 () Bool)

(declare-fun lt!129060 () (_ BitVec 64))

(assert (=> b!256873 (= c!43443 (= lt!129060 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166504 () SeekEntryResult!1132)

(declare-fun e!166506 () SeekEntryResult!1132)

(assert (=> b!256873 (= e!166504 e!166506)))

(declare-fun b!256874 () Bool)

(assert (=> b!256874 (= e!166505 e!166504)))

(assert (=> b!256874 (= lt!129060 (select (arr!5924 (_keys!6900 thiss!1504)) (index!6700 lt!129061)))))

(declare-fun c!43444 () Bool)

(assert (=> b!256874 (= c!43444 (= lt!129060 key!932))))

(declare-fun b!256875 () Bool)

(assert (=> b!256875 (= e!166506 (MissingZero!1132 (index!6700 lt!129061)))))

(declare-fun b!256876 () Bool)

(assert (=> b!256876 (= e!166504 (Found!1132 (index!6700 lt!129061)))))

(declare-fun b!256877 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12507 (_ BitVec 32)) SeekEntryResult!1132)

(assert (=> b!256877 (= e!166506 (seekKeyOrZeroReturnVacant!0 (x!24946 lt!129061) (index!6700 lt!129061) (index!6700 lt!129061) key!932 (_keys!6900 thiss!1504) (mask!11014 thiss!1504)))))

(assert (= (and d!61797 c!43442) b!256872))

(assert (= (and d!61797 (not c!43442)) b!256874))

(assert (= (and b!256874 c!43444) b!256876))

(assert (= (and b!256874 (not c!43444)) b!256873))

(assert (= (and b!256873 c!43443) b!256875))

(assert (= (and b!256873 (not c!43443)) b!256877))

(declare-fun m!272377 () Bool)

(assert (=> d!61797 m!272377))

(declare-fun m!272379 () Bool)

(assert (=> d!61797 m!272379))

(assert (=> d!61797 m!272377))

(declare-fun m!272381 () Bool)

(assert (=> d!61797 m!272381))

(declare-fun m!272383 () Bool)

(assert (=> d!61797 m!272383))

(declare-fun m!272385 () Bool)

(assert (=> d!61797 m!272385))

(declare-fun m!272387 () Bool)

(assert (=> d!61797 m!272387))

(declare-fun m!272389 () Bool)

(assert (=> b!256874 m!272389))

(declare-fun m!272391 () Bool)

(assert (=> b!256877 m!272391))

(assert (=> b!256708 d!61797))

(declare-fun d!61799 () Bool)

(assert (=> d!61799 (= (inRange!0 index!297 (mask!11014 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11014 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!256716 d!61799))

(declare-fun d!61801 () Bool)

(declare-fun e!166511 () Bool)

(assert (=> d!61801 e!166511))

(declare-fun res!125654 () Bool)

(assert (=> d!61801 (=> res!125654 e!166511)))

(declare-fun lt!129074 () Bool)

(assert (=> d!61801 (= res!125654 (not lt!129074))))

(declare-fun lt!129073 () Bool)

(assert (=> d!61801 (= lt!129074 lt!129073)))

(declare-fun lt!129071 () Unit!7937)

(declare-fun e!166512 () Unit!7937)

(assert (=> d!61801 (= lt!129071 e!166512)))

(declare-fun c!43447 () Bool)

(assert (=> d!61801 (= c!43447 lt!129073)))

(declare-fun containsKey!302 (List!3706 (_ BitVec 64)) Bool)

(assert (=> d!61801 (= lt!129073 (containsKey!302 (toList!1887 lt!128968) key!932))))

(assert (=> d!61801 (= (contains!1842 lt!128968 key!932) lt!129074)))

(declare-fun b!256884 () Bool)

(declare-fun lt!129072 () Unit!7937)

(assert (=> b!256884 (= e!166512 lt!129072)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!250 (List!3706 (_ BitVec 64)) Unit!7937)

(assert (=> b!256884 (= lt!129072 (lemmaContainsKeyImpliesGetValueByKeyDefined!250 (toList!1887 lt!128968) key!932))))

(declare-datatypes ((Option!317 0))(
  ( (Some!316 (v!5431 V!8425)) (None!315) )
))
(declare-fun isDefined!251 (Option!317) Bool)

(declare-fun getValueByKey!311 (List!3706 (_ BitVec 64)) Option!317)

(assert (=> b!256884 (isDefined!251 (getValueByKey!311 (toList!1887 lt!128968) key!932))))

(declare-fun b!256885 () Bool)

(declare-fun Unit!7952 () Unit!7937)

(assert (=> b!256885 (= e!166512 Unit!7952)))

(declare-fun b!256886 () Bool)

(assert (=> b!256886 (= e!166511 (isDefined!251 (getValueByKey!311 (toList!1887 lt!128968) key!932)))))

(assert (= (and d!61801 c!43447) b!256884))

(assert (= (and d!61801 (not c!43447)) b!256885))

(assert (= (and d!61801 (not res!125654)) b!256886))

(declare-fun m!272393 () Bool)

(assert (=> d!61801 m!272393))

(declare-fun m!272395 () Bool)

(assert (=> b!256884 m!272395))

(declare-fun m!272397 () Bool)

(assert (=> b!256884 m!272397))

(assert (=> b!256884 m!272397))

(declare-fun m!272399 () Bool)

(assert (=> b!256884 m!272399))

(assert (=> b!256886 m!272397))

(assert (=> b!256886 m!272397))

(assert (=> b!256886 m!272399))

(assert (=> b!256716 d!61801))

(declare-fun call!24349 () ListLongMap!3743)

(declare-fun c!43464 () Bool)

(declare-fun bm!24341 () Bool)

(declare-fun c!43460 () Bool)

(declare-fun call!24348 () ListLongMap!3743)

(declare-fun call!24350 () ListLongMap!3743)

(declare-fun call!24345 () ListLongMap!3743)

(assert (=> bm!24341 (= call!24345 (+!684 (ite c!43464 call!24349 (ite c!43460 call!24348 call!24350)) (ite (or c!43464 c!43460) (tuple2!4829 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4577 thiss!1504)) (tuple2!4829 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4577 thiss!1504)))))))

(declare-fun d!61803 () Bool)

(declare-fun e!166541 () Bool)

(assert (=> d!61803 e!166541))

(declare-fun res!125675 () Bool)

(assert (=> d!61803 (=> (not res!125675) (not e!166541))))

(assert (=> d!61803 (= res!125675 (or (bvsge #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))))))))

(declare-fun lt!129121 () ListLongMap!3743)

(declare-fun lt!129123 () ListLongMap!3743)

(assert (=> d!61803 (= lt!129121 lt!129123)))

(declare-fun lt!129131 () Unit!7937)

(declare-fun e!166549 () Unit!7937)

(assert (=> d!61803 (= lt!129131 e!166549)))

(declare-fun c!43462 () Bool)

(declare-fun e!166543 () Bool)

(assert (=> d!61803 (= c!43462 e!166543)))

(declare-fun res!125673 () Bool)

(assert (=> d!61803 (=> (not res!125673) (not e!166543))))

(assert (=> d!61803 (= res!125673 (bvslt #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))))))

(declare-fun e!166550 () ListLongMap!3743)

(assert (=> d!61803 (= lt!129123 e!166550)))

(assert (=> d!61803 (= c!43464 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61803 (validMask!0 (mask!11014 thiss!1504))))

(assert (=> d!61803 (= (getCurrentListMap!1419 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)) lt!129121)))

(declare-fun b!256929 () Bool)

(declare-fun lt!129140 () Unit!7937)

(assert (=> b!256929 (= e!166549 lt!129140)))

(declare-fun lt!129124 () ListLongMap!3743)

(declare-fun getCurrentListMapNoExtraKeys!568 (array!12507 array!12505 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 32) Int) ListLongMap!3743)

(assert (=> b!256929 (= lt!129124 (getCurrentListMapNoExtraKeys!568 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!129137 () (_ BitVec 64))

(assert (=> b!256929 (= lt!129137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129130 () (_ BitVec 64))

(assert (=> b!256929 (= lt!129130 (select (arr!5924 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129120 () Unit!7937)

(declare-fun addStillContains!228 (ListLongMap!3743 (_ BitVec 64) V!8425 (_ BitVec 64)) Unit!7937)

(assert (=> b!256929 (= lt!129120 (addStillContains!228 lt!129124 lt!129137 (zeroValue!4577 thiss!1504) lt!129130))))

(assert (=> b!256929 (contains!1842 (+!684 lt!129124 (tuple2!4829 lt!129137 (zeroValue!4577 thiss!1504))) lt!129130)))

(declare-fun lt!129132 () Unit!7937)

(assert (=> b!256929 (= lt!129132 lt!129120)))

(declare-fun lt!129128 () ListLongMap!3743)

(assert (=> b!256929 (= lt!129128 (getCurrentListMapNoExtraKeys!568 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!129136 () (_ BitVec 64))

(assert (=> b!256929 (= lt!129136 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129122 () (_ BitVec 64))

(assert (=> b!256929 (= lt!129122 (select (arr!5924 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129134 () Unit!7937)

(declare-fun addApplyDifferent!228 (ListLongMap!3743 (_ BitVec 64) V!8425 (_ BitVec 64)) Unit!7937)

(assert (=> b!256929 (= lt!129134 (addApplyDifferent!228 lt!129128 lt!129136 (minValue!4577 thiss!1504) lt!129122))))

(declare-fun apply!252 (ListLongMap!3743 (_ BitVec 64)) V!8425)

(assert (=> b!256929 (= (apply!252 (+!684 lt!129128 (tuple2!4829 lt!129136 (minValue!4577 thiss!1504))) lt!129122) (apply!252 lt!129128 lt!129122))))

(declare-fun lt!129119 () Unit!7937)

(assert (=> b!256929 (= lt!129119 lt!129134)))

(declare-fun lt!129138 () ListLongMap!3743)

(assert (=> b!256929 (= lt!129138 (getCurrentListMapNoExtraKeys!568 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!129125 () (_ BitVec 64))

(assert (=> b!256929 (= lt!129125 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129133 () (_ BitVec 64))

(assert (=> b!256929 (= lt!129133 (select (arr!5924 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129126 () Unit!7937)

(assert (=> b!256929 (= lt!129126 (addApplyDifferent!228 lt!129138 lt!129125 (zeroValue!4577 thiss!1504) lt!129133))))

(assert (=> b!256929 (= (apply!252 (+!684 lt!129138 (tuple2!4829 lt!129125 (zeroValue!4577 thiss!1504))) lt!129133) (apply!252 lt!129138 lt!129133))))

(declare-fun lt!129127 () Unit!7937)

(assert (=> b!256929 (= lt!129127 lt!129126)))

(declare-fun lt!129135 () ListLongMap!3743)

(assert (=> b!256929 (= lt!129135 (getCurrentListMapNoExtraKeys!568 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!129139 () (_ BitVec 64))

(assert (=> b!256929 (= lt!129139 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129129 () (_ BitVec 64))

(assert (=> b!256929 (= lt!129129 (select (arr!5924 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256929 (= lt!129140 (addApplyDifferent!228 lt!129135 lt!129139 (minValue!4577 thiss!1504) lt!129129))))

(assert (=> b!256929 (= (apply!252 (+!684 lt!129135 (tuple2!4829 lt!129139 (minValue!4577 thiss!1504))) lt!129129) (apply!252 lt!129135 lt!129129))))

(declare-fun b!256930 () Bool)

(declare-fun e!166540 () Bool)

(assert (=> b!256930 (= e!166540 (= (apply!252 lt!129121 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4577 thiss!1504)))))

(declare-fun b!256931 () Bool)

(declare-fun e!166545 () Bool)

(assert (=> b!256931 (= e!166545 e!166540)))

(declare-fun res!125680 () Bool)

(declare-fun call!24346 () Bool)

(assert (=> b!256931 (= res!125680 call!24346)))

(assert (=> b!256931 (=> (not res!125680) (not e!166540))))

(declare-fun b!256932 () Bool)

(declare-fun c!43463 () Bool)

(assert (=> b!256932 (= c!43463 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!166546 () ListLongMap!3743)

(declare-fun e!166547 () ListLongMap!3743)

(assert (=> b!256932 (= e!166546 e!166547)))

(declare-fun b!256933 () Bool)

(assert (=> b!256933 (= e!166550 (+!684 call!24345 (tuple2!4829 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4577 thiss!1504))))))

(declare-fun b!256934 () Bool)

(declare-fun e!166551 () Bool)

(declare-fun e!166542 () Bool)

(assert (=> b!256934 (= e!166551 e!166542)))

(declare-fun res!125677 () Bool)

(assert (=> b!256934 (=> (not res!125677) (not e!166542))))

(assert (=> b!256934 (= res!125677 (contains!1842 lt!129121 (select (arr!5924 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!256934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))))))

(declare-fun b!256935 () Bool)

(assert (=> b!256935 (= e!166545 (not call!24346))))

(declare-fun b!256936 () Bool)

(assert (=> b!256936 (= e!166550 e!166546)))

(assert (=> b!256936 (= c!43460 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256937 () Bool)

(declare-fun e!166548 () Bool)

(assert (=> b!256937 (= e!166548 (= (apply!252 lt!129121 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4577 thiss!1504)))))

(declare-fun b!256938 () Bool)

(declare-fun res!125676 () Bool)

(assert (=> b!256938 (=> (not res!125676) (not e!166541))))

(assert (=> b!256938 (= res!125676 e!166551)))

(declare-fun res!125679 () Bool)

(assert (=> b!256938 (=> res!125679 e!166551)))

(declare-fun e!166544 () Bool)

(assert (=> b!256938 (= res!125679 (not e!166544))))

(declare-fun res!125674 () Bool)

(assert (=> b!256938 (=> (not res!125674) (not e!166544))))

(assert (=> b!256938 (= res!125674 (bvslt #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))))))

(declare-fun bm!24342 () Bool)

(assert (=> bm!24342 (= call!24350 call!24348)))

(declare-fun b!256939 () Bool)

(declare-fun e!166539 () Bool)

(assert (=> b!256939 (= e!166539 e!166548)))

(declare-fun res!125681 () Bool)

(declare-fun call!24347 () Bool)

(assert (=> b!256939 (= res!125681 call!24347)))

(assert (=> b!256939 (=> (not res!125681) (not e!166548))))

(declare-fun b!256940 () Bool)

(assert (=> b!256940 (= e!166543 (validKeyInArray!0 (select (arr!5924 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24343 () Bool)

(assert (=> bm!24343 (= call!24346 (contains!1842 lt!129121 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256941 () Bool)

(declare-fun Unit!7953 () Unit!7937)

(assert (=> b!256941 (= e!166549 Unit!7953)))

(declare-fun bm!24344 () Bool)

(assert (=> bm!24344 (= call!24348 call!24349)))

(declare-fun b!256942 () Bool)

(declare-fun res!125678 () Bool)

(assert (=> b!256942 (=> (not res!125678) (not e!166541))))

(assert (=> b!256942 (= res!125678 e!166539)))

(declare-fun c!43461 () Bool)

(assert (=> b!256942 (= c!43461 (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24345 () Bool)

(declare-fun call!24344 () ListLongMap!3743)

(assert (=> bm!24345 (= call!24344 call!24345)))

(declare-fun b!256943 () Bool)

(assert (=> b!256943 (= e!166539 (not call!24347))))

(declare-fun b!256944 () Bool)

(assert (=> b!256944 (= e!166547 call!24344)))

(declare-fun b!256945 () Bool)

(assert (=> b!256945 (= e!166546 call!24344)))

(declare-fun bm!24346 () Bool)

(assert (=> bm!24346 (= call!24349 (getCurrentListMapNoExtraKeys!568 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun b!256946 () Bool)

(assert (=> b!256946 (= e!166547 call!24350)))

(declare-fun b!256947 () Bool)

(assert (=> b!256947 (= e!166544 (validKeyInArray!0 (select (arr!5924 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256948 () Bool)

(assert (=> b!256948 (= e!166541 e!166545)))

(declare-fun c!43465 () Bool)

(assert (=> b!256948 (= c!43465 (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256949 () Bool)

(declare-fun get!3053 (ValueCell!2948 V!8425) V!8425)

(declare-fun dynLambda!595 (Int (_ BitVec 64)) V!8425)

(assert (=> b!256949 (= e!166542 (= (apply!252 lt!129121 (select (arr!5924 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000)) (get!3053 (select (arr!5923 (_values!4719 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!595 (defaultEntry!4736 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6270 (_values!4719 thiss!1504))))))

(assert (=> b!256949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))))))

(declare-fun bm!24347 () Bool)

(assert (=> bm!24347 (= call!24347 (contains!1842 lt!129121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!61803 c!43464) b!256933))

(assert (= (and d!61803 (not c!43464)) b!256936))

(assert (= (and b!256936 c!43460) b!256945))

(assert (= (and b!256936 (not c!43460)) b!256932))

(assert (= (and b!256932 c!43463) b!256944))

(assert (= (and b!256932 (not c!43463)) b!256946))

(assert (= (or b!256944 b!256946) bm!24342))

(assert (= (or b!256945 bm!24342) bm!24344))

(assert (= (or b!256945 b!256944) bm!24345))

(assert (= (or b!256933 bm!24344) bm!24346))

(assert (= (or b!256933 bm!24345) bm!24341))

(assert (= (and d!61803 res!125673) b!256940))

(assert (= (and d!61803 c!43462) b!256929))

(assert (= (and d!61803 (not c!43462)) b!256941))

(assert (= (and d!61803 res!125675) b!256938))

(assert (= (and b!256938 res!125674) b!256947))

(assert (= (and b!256938 (not res!125679)) b!256934))

(assert (= (and b!256934 res!125677) b!256949))

(assert (= (and b!256938 res!125676) b!256942))

(assert (= (and b!256942 c!43461) b!256939))

(assert (= (and b!256942 (not c!43461)) b!256943))

(assert (= (and b!256939 res!125681) b!256937))

(assert (= (or b!256939 b!256943) bm!24347))

(assert (= (and b!256942 res!125678) b!256948))

(assert (= (and b!256948 c!43465) b!256931))

(assert (= (and b!256948 (not c!43465)) b!256935))

(assert (= (and b!256931 res!125680) b!256930))

(assert (= (or b!256931 b!256935) bm!24343))

(declare-fun b_lambda!8193 () Bool)

(assert (=> (not b_lambda!8193) (not b!256949)))

(declare-fun t!8762 () Bool)

(declare-fun tb!3009 () Bool)

(assert (=> (and b!256714 (= (defaultEntry!4736 thiss!1504) (defaultEntry!4736 thiss!1504)) t!8762) tb!3009))

(declare-fun result!5365 () Bool)

(assert (=> tb!3009 (= result!5365 tp_is_empty!6583)))

(assert (=> b!256949 t!8762))

(declare-fun b_and!13803 () Bool)

(assert (= b_and!13797 (and (=> t!8762 result!5365) b_and!13803)))

(declare-fun m!272401 () Bool)

(assert (=> b!256947 m!272401))

(assert (=> b!256947 m!272401))

(declare-fun m!272403 () Bool)

(assert (=> b!256947 m!272403))

(declare-fun m!272405 () Bool)

(assert (=> b!256933 m!272405))

(declare-fun m!272407 () Bool)

(assert (=> bm!24341 m!272407))

(declare-fun m!272409 () Bool)

(assert (=> bm!24347 m!272409))

(declare-fun m!272411 () Bool)

(assert (=> bm!24343 m!272411))

(declare-fun m!272413 () Bool)

(assert (=> b!256929 m!272413))

(declare-fun m!272415 () Bool)

(assert (=> b!256929 m!272415))

(declare-fun m!272417 () Bool)

(assert (=> b!256929 m!272417))

(declare-fun m!272419 () Bool)

(assert (=> b!256929 m!272419))

(declare-fun m!272421 () Bool)

(assert (=> b!256929 m!272421))

(declare-fun m!272423 () Bool)

(assert (=> b!256929 m!272423))

(declare-fun m!272425 () Bool)

(assert (=> b!256929 m!272425))

(assert (=> b!256929 m!272423))

(declare-fun m!272427 () Bool)

(assert (=> b!256929 m!272427))

(assert (=> b!256929 m!272413))

(declare-fun m!272429 () Bool)

(assert (=> b!256929 m!272429))

(declare-fun m!272431 () Bool)

(assert (=> b!256929 m!272431))

(assert (=> b!256929 m!272419))

(declare-fun m!272433 () Bool)

(assert (=> b!256929 m!272433))

(declare-fun m!272435 () Bool)

(assert (=> b!256929 m!272435))

(assert (=> b!256929 m!272401))

(declare-fun m!272437 () Bool)

(assert (=> b!256929 m!272437))

(declare-fun m!272439 () Bool)

(assert (=> b!256929 m!272439))

(declare-fun m!272441 () Bool)

(assert (=> b!256929 m!272441))

(assert (=> b!256929 m!272421))

(declare-fun m!272443 () Bool)

(assert (=> b!256929 m!272443))

(assert (=> d!61803 m!272381))

(assert (=> b!256934 m!272401))

(assert (=> b!256934 m!272401))

(declare-fun m!272445 () Bool)

(assert (=> b!256934 m!272445))

(assert (=> b!256940 m!272401))

(assert (=> b!256940 m!272401))

(assert (=> b!256940 m!272403))

(assert (=> bm!24346 m!272437))

(declare-fun m!272447 () Bool)

(assert (=> b!256949 m!272447))

(declare-fun m!272449 () Bool)

(assert (=> b!256949 m!272449))

(declare-fun m!272451 () Bool)

(assert (=> b!256949 m!272451))

(assert (=> b!256949 m!272447))

(assert (=> b!256949 m!272401))

(assert (=> b!256949 m!272401))

(declare-fun m!272453 () Bool)

(assert (=> b!256949 m!272453))

(assert (=> b!256949 m!272449))

(declare-fun m!272455 () Bool)

(assert (=> b!256937 m!272455))

(declare-fun m!272457 () Bool)

(assert (=> b!256930 m!272457))

(assert (=> b!256716 d!61803))

(declare-fun d!61805 () Bool)

(declare-fun res!125688 () Bool)

(declare-fun e!166554 () Bool)

(assert (=> d!61805 (=> (not res!125688) (not e!166554))))

(declare-fun simpleValid!275 (LongMapFixedSize!3796) Bool)

(assert (=> d!61805 (= res!125688 (simpleValid!275 thiss!1504))))

(assert (=> d!61805 (= (valid!1489 thiss!1504) e!166554)))

(declare-fun b!256958 () Bool)

(declare-fun res!125689 () Bool)

(assert (=> b!256958 (=> (not res!125689) (not e!166554))))

(assert (=> b!256958 (= res!125689 (= (arrayCountValidKeys!0 (_keys!6900 thiss!1504) #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))) (_size!1947 thiss!1504)))))

(declare-fun b!256959 () Bool)

(declare-fun res!125690 () Bool)

(assert (=> b!256959 (=> (not res!125690) (not e!166554))))

(assert (=> b!256959 (= res!125690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6900 thiss!1504) (mask!11014 thiss!1504)))))

(declare-fun b!256960 () Bool)

(assert (=> b!256960 (= e!166554 (arrayNoDuplicates!0 (_keys!6900 thiss!1504) #b00000000000000000000000000000000 Nil!3704))))

(assert (= (and d!61805 res!125688) b!256958))

(assert (= (and b!256958 res!125689) b!256959))

(assert (= (and b!256959 res!125690) b!256960))

(declare-fun m!272459 () Bool)

(assert (=> d!61805 m!272459))

(assert (=> b!256958 m!272239))

(declare-fun m!272461 () Bool)

(assert (=> b!256959 m!272461))

(declare-fun m!272463 () Bool)

(assert (=> b!256960 m!272463))

(assert (=> start!24514 d!61805))

(declare-fun b!256977 () Bool)

(declare-fun e!166565 () Bool)

(declare-fun e!166566 () Bool)

(assert (=> b!256977 (= e!166565 e!166566)))

(declare-fun res!125701 () Bool)

(declare-fun call!24355 () Bool)

(assert (=> b!256977 (= res!125701 call!24355)))

(assert (=> b!256977 (=> (not res!125701) (not e!166566))))

(declare-fun b!256978 () Bool)

(declare-fun res!125700 () Bool)

(declare-fun e!166563 () Bool)

(assert (=> b!256978 (=> (not res!125700) (not e!166563))))

(declare-fun lt!129146 () SeekEntryResult!1132)

(assert (=> b!256978 (= res!125700 (= (select (arr!5924 (_keys!6900 thiss!1504)) (index!6701 lt!129146)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256978 (and (bvsge (index!6701 lt!129146) #b00000000000000000000000000000000) (bvslt (index!6701 lt!129146) (size!6271 (_keys!6900 thiss!1504))))))

(declare-fun b!256979 () Bool)

(declare-fun e!166564 () Bool)

(assert (=> b!256979 (= e!166565 e!166564)))

(declare-fun c!43471 () Bool)

(assert (=> b!256979 (= c!43471 ((_ is MissingVacant!1132) lt!129146))))

(declare-fun b!256980 () Bool)

(assert (=> b!256980 (and (bvsge (index!6698 lt!129146) #b00000000000000000000000000000000) (bvslt (index!6698 lt!129146) (size!6271 (_keys!6900 thiss!1504))))))

(declare-fun res!125699 () Bool)

(assert (=> b!256980 (= res!125699 (= (select (arr!5924 (_keys!6900 thiss!1504)) (index!6698 lt!129146)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256980 (=> (not res!125699) (not e!166566))))

(declare-fun c!43470 () Bool)

(declare-fun bm!24352 () Bool)

(assert (=> bm!24352 (= call!24355 (inRange!0 (ite c!43470 (index!6698 lt!129146) (index!6701 lt!129146)) (mask!11014 thiss!1504)))))

(declare-fun b!256981 () Bool)

(assert (=> b!256981 (= e!166564 ((_ is Undefined!1132) lt!129146))))

(declare-fun b!256982 () Bool)

(declare-fun res!125702 () Bool)

(assert (=> b!256982 (=> (not res!125702) (not e!166563))))

(assert (=> b!256982 (= res!125702 call!24355)))

(assert (=> b!256982 (= e!166564 e!166563)))

(declare-fun bm!24353 () Bool)

(declare-fun call!24356 () Bool)

(assert (=> bm!24353 (= call!24356 (arrayContainsKey!0 (_keys!6900 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256984 () Bool)

(assert (=> b!256984 (= e!166563 (not call!24356))))

(declare-fun d!61807 () Bool)

(assert (=> d!61807 e!166565))

(assert (=> d!61807 (= c!43470 ((_ is MissingZero!1132) lt!129146))))

(assert (=> d!61807 (= lt!129146 (seekEntryOrOpen!0 key!932 (_keys!6900 thiss!1504) (mask!11014 thiss!1504)))))

(declare-fun lt!129145 () Unit!7937)

(declare-fun choose!1239 (array!12507 array!12505 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) Int) Unit!7937)

(assert (=> d!61807 (= lt!129145 (choose!1239 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)))))

(assert (=> d!61807 (validMask!0 (mask!11014 thiss!1504))))

(assert (=> d!61807 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!417 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)) lt!129145)))

(declare-fun b!256983 () Bool)

(assert (=> b!256983 (= e!166566 (not call!24356))))

(assert (= (and d!61807 c!43470) b!256977))

(assert (= (and d!61807 (not c!43470)) b!256979))

(assert (= (and b!256977 res!125701) b!256980))

(assert (= (and b!256980 res!125699) b!256983))

(assert (= (and b!256979 c!43471) b!256982))

(assert (= (and b!256979 (not c!43471)) b!256981))

(assert (= (and b!256982 res!125702) b!256978))

(assert (= (and b!256978 res!125700) b!256984))

(assert (= (or b!256977 b!256982) bm!24352))

(assert (= (or b!256983 b!256984) bm!24353))

(assert (=> bm!24353 m!272201))

(assert (=> d!61807 m!272205))

(declare-fun m!272465 () Bool)

(assert (=> d!61807 m!272465))

(assert (=> d!61807 m!272381))

(declare-fun m!272467 () Bool)

(assert (=> b!256978 m!272467))

(declare-fun m!272469 () Bool)

(assert (=> b!256980 m!272469))

(declare-fun m!272471 () Bool)

(assert (=> bm!24352 m!272471))

(assert (=> b!256725 d!61807))

(declare-fun d!61809 () Bool)

(declare-fun e!166569 () Bool)

(assert (=> d!61809 e!166569))

(declare-fun res!125707 () Bool)

(assert (=> d!61809 (=> (not res!125707) (not e!166569))))

(declare-fun lt!129152 () SeekEntryResult!1132)

(assert (=> d!61809 (= res!125707 ((_ is Found!1132) lt!129152))))

(assert (=> d!61809 (= lt!129152 (seekEntryOrOpen!0 key!932 (_keys!6900 thiss!1504) (mask!11014 thiss!1504)))))

(declare-fun lt!129151 () Unit!7937)

(declare-fun choose!1240 (array!12507 array!12505 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) Int) Unit!7937)

(assert (=> d!61809 (= lt!129151 (choose!1240 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)))))

(assert (=> d!61809 (validMask!0 (mask!11014 thiss!1504))))

(assert (=> d!61809 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!424 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)) lt!129151)))

(declare-fun b!256989 () Bool)

(declare-fun res!125708 () Bool)

(assert (=> b!256989 (=> (not res!125708) (not e!166569))))

(assert (=> b!256989 (= res!125708 (inRange!0 (index!6699 lt!129152) (mask!11014 thiss!1504)))))

(declare-fun b!256990 () Bool)

(assert (=> b!256990 (= e!166569 (= (select (arr!5924 (_keys!6900 thiss!1504)) (index!6699 lt!129152)) key!932))))

(assert (=> b!256990 (and (bvsge (index!6699 lt!129152) #b00000000000000000000000000000000) (bvslt (index!6699 lt!129152) (size!6271 (_keys!6900 thiss!1504))))))

(assert (= (and d!61809 res!125707) b!256989))

(assert (= (and b!256989 res!125708) b!256990))

(assert (=> d!61809 m!272205))

(declare-fun m!272473 () Bool)

(assert (=> d!61809 m!272473))

(assert (=> d!61809 m!272381))

(declare-fun m!272475 () Bool)

(assert (=> b!256989 m!272475))

(declare-fun m!272477 () Bool)

(assert (=> b!256990 m!272477))

(assert (=> b!256724 d!61809))

(declare-fun b!256999 () Bool)

(declare-fun e!166576 () Bool)

(declare-fun e!166577 () Bool)

(assert (=> b!256999 (= e!166576 e!166577)))

(declare-fun c!43474 () Bool)

(assert (=> b!256999 (= c!43474 (validKeyInArray!0 (select (arr!5924 lt!128967) #b00000000000000000000000000000000)))))

(declare-fun b!257000 () Bool)

(declare-fun e!166578 () Bool)

(declare-fun call!24359 () Bool)

(assert (=> b!257000 (= e!166578 call!24359)))

(declare-fun d!61811 () Bool)

(declare-fun res!125713 () Bool)

(assert (=> d!61811 (=> res!125713 e!166576)))

(assert (=> d!61811 (= res!125713 (bvsge #b00000000000000000000000000000000 (size!6271 lt!128967)))))

(assert (=> d!61811 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128967 (mask!11014 thiss!1504)) e!166576)))

(declare-fun b!257001 () Bool)

(assert (=> b!257001 (= e!166577 call!24359)))

(declare-fun bm!24356 () Bool)

(assert (=> bm!24356 (= call!24359 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128967 (mask!11014 thiss!1504)))))

(declare-fun b!257002 () Bool)

(assert (=> b!257002 (= e!166577 e!166578)))

(declare-fun lt!129161 () (_ BitVec 64))

(assert (=> b!257002 (= lt!129161 (select (arr!5924 lt!128967) #b00000000000000000000000000000000))))

(declare-fun lt!129160 () Unit!7937)

(assert (=> b!257002 (= lt!129160 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128967 lt!129161 #b00000000000000000000000000000000))))

(assert (=> b!257002 (arrayContainsKey!0 lt!128967 lt!129161 #b00000000000000000000000000000000)))

(declare-fun lt!129159 () Unit!7937)

(assert (=> b!257002 (= lt!129159 lt!129160)))

(declare-fun res!125714 () Bool)

(assert (=> b!257002 (= res!125714 (= (seekEntryOrOpen!0 (select (arr!5924 lt!128967) #b00000000000000000000000000000000) lt!128967 (mask!11014 thiss!1504)) (Found!1132 #b00000000000000000000000000000000)))))

(assert (=> b!257002 (=> (not res!125714) (not e!166578))))

(assert (= (and d!61811 (not res!125713)) b!256999))

(assert (= (and b!256999 c!43474) b!257002))

(assert (= (and b!256999 (not c!43474)) b!257001))

(assert (= (and b!257002 res!125714) b!257000))

(assert (= (or b!257000 b!257001) bm!24356))

(declare-fun m!272479 () Bool)

(assert (=> b!256999 m!272479))

(assert (=> b!256999 m!272479))

(declare-fun m!272481 () Bool)

(assert (=> b!256999 m!272481))

(declare-fun m!272483 () Bool)

(assert (=> bm!24356 m!272483))

(assert (=> b!257002 m!272479))

(declare-fun m!272485 () Bool)

(assert (=> b!257002 m!272485))

(declare-fun m!272487 () Bool)

(assert (=> b!257002 m!272487))

(assert (=> b!257002 m!272479))

(declare-fun m!272489 () Bool)

(assert (=> b!257002 m!272489))

(assert (=> b!256706 d!61811))

(declare-fun d!61813 () Bool)

(declare-fun e!166584 () Bool)

(assert (=> d!61813 e!166584))

(declare-fun res!125724 () Bool)

(assert (=> d!61813 (=> (not res!125724) (not e!166584))))

(assert (=> d!61813 (= res!125724 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6271 (_keys!6900 thiss!1504)))))))

(declare-fun lt!129164 () Unit!7937)

(declare-fun choose!1 (array!12507 (_ BitVec 32) (_ BitVec 64)) Unit!7937)

(assert (=> d!61813 (= lt!129164 (choose!1 (_keys!6900 thiss!1504) index!297 key!932))))

(declare-fun e!166583 () Bool)

(assert (=> d!61813 e!166583))

(declare-fun res!125726 () Bool)

(assert (=> d!61813 (=> (not res!125726) (not e!166583))))

(assert (=> d!61813 (= res!125726 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6271 (_keys!6900 thiss!1504)))))))

(assert (=> d!61813 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6900 thiss!1504) index!297 key!932) lt!129164)))

(declare-fun b!257012 () Bool)

(declare-fun res!125725 () Bool)

(assert (=> b!257012 (=> (not res!125725) (not e!166583))))

(assert (=> b!257012 (= res!125725 (validKeyInArray!0 key!932))))

(declare-fun b!257013 () Bool)

(assert (=> b!257013 (= e!166583 (bvslt (size!6271 (_keys!6900 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!257014 () Bool)

(assert (=> b!257014 (= e!166584 (= (arrayCountValidKeys!0 (array!12508 (store (arr!5924 (_keys!6900 thiss!1504)) index!297 key!932) (size!6271 (_keys!6900 thiss!1504))) #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6900 thiss!1504) #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!257011 () Bool)

(declare-fun res!125723 () Bool)

(assert (=> b!257011 (=> (not res!125723) (not e!166583))))

(assert (=> b!257011 (= res!125723 (not (validKeyInArray!0 (select (arr!5924 (_keys!6900 thiss!1504)) index!297))))))

(assert (= (and d!61813 res!125726) b!257011))

(assert (= (and b!257011 res!125723) b!257012))

(assert (= (and b!257012 res!125725) b!257013))

(assert (= (and d!61813 res!125724) b!257014))

(declare-fun m!272491 () Bool)

(assert (=> d!61813 m!272491))

(assert (=> b!257012 m!272207))

(assert (=> b!257014 m!272245))

(declare-fun m!272493 () Bool)

(assert (=> b!257014 m!272493))

(assert (=> b!257014 m!272239))

(declare-fun m!272495 () Bool)

(assert (=> b!257011 m!272495))

(assert (=> b!257011 m!272495))

(declare-fun m!272497 () Bool)

(assert (=> b!257011 m!272497))

(assert (=> b!256706 d!61813))

(declare-fun d!61815 () Bool)

(declare-fun lt!129167 () (_ BitVec 32))

(assert (=> d!61815 (and (bvsge lt!129167 #b00000000000000000000000000000000) (bvsle lt!129167 (bvsub (size!6271 lt!128967) #b00000000000000000000000000000000)))))

(declare-fun e!166589 () (_ BitVec 32))

(assert (=> d!61815 (= lt!129167 e!166589)))

(declare-fun c!43480 () Bool)

(assert (=> d!61815 (= c!43480 (bvsge #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))))))

(assert (=> d!61815 (and (bvsle #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6271 (_keys!6900 thiss!1504)) (size!6271 lt!128967)))))

(assert (=> d!61815 (= (arrayCountValidKeys!0 lt!128967 #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))) lt!129167)))

(declare-fun b!257023 () Bool)

(declare-fun e!166590 () (_ BitVec 32))

(assert (=> b!257023 (= e!166589 e!166590)))

(declare-fun c!43479 () Bool)

(assert (=> b!257023 (= c!43479 (validKeyInArray!0 (select (arr!5924 lt!128967) #b00000000000000000000000000000000)))))

(declare-fun b!257024 () Bool)

(assert (=> b!257024 (= e!166589 #b00000000000000000000000000000000)))

(declare-fun b!257025 () Bool)

(declare-fun call!24362 () (_ BitVec 32))

(assert (=> b!257025 (= e!166590 (bvadd #b00000000000000000000000000000001 call!24362))))

(declare-fun b!257026 () Bool)

(assert (=> b!257026 (= e!166590 call!24362)))

(declare-fun bm!24359 () Bool)

(assert (=> bm!24359 (= call!24362 (arrayCountValidKeys!0 lt!128967 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6271 (_keys!6900 thiss!1504))))))

(assert (= (and d!61815 c!43480) b!257024))

(assert (= (and d!61815 (not c!43480)) b!257023))

(assert (= (and b!257023 c!43479) b!257025))

(assert (= (and b!257023 (not c!43479)) b!257026))

(assert (= (or b!257025 b!257026) bm!24359))

(assert (=> b!257023 m!272479))

(assert (=> b!257023 m!272479))

(assert (=> b!257023 m!272481))

(declare-fun m!272499 () Bool)

(assert (=> bm!24359 m!272499))

(assert (=> b!256706 d!61815))

(declare-fun d!61817 () Bool)

(declare-fun res!125731 () Bool)

(declare-fun e!166595 () Bool)

(assert (=> d!61817 (=> res!125731 e!166595)))

(assert (=> d!61817 (= res!125731 (= (select (arr!5924 lt!128967) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61817 (= (arrayContainsKey!0 lt!128967 key!932 #b00000000000000000000000000000000) e!166595)))

(declare-fun b!257031 () Bool)

(declare-fun e!166596 () Bool)

(assert (=> b!257031 (= e!166595 e!166596)))

(declare-fun res!125732 () Bool)

(assert (=> b!257031 (=> (not res!125732) (not e!166596))))

(assert (=> b!257031 (= res!125732 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6271 lt!128967)))))

(declare-fun b!257032 () Bool)

(assert (=> b!257032 (= e!166596 (arrayContainsKey!0 lt!128967 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61817 (not res!125731)) b!257031))

(assert (= (and b!257031 res!125732) b!257032))

(assert (=> d!61817 m!272479))

(declare-fun m!272501 () Bool)

(assert (=> b!257032 m!272501))

(assert (=> b!256706 d!61817))

(declare-fun d!61819 () Bool)

(declare-fun lt!129168 () (_ BitVec 32))

(assert (=> d!61819 (and (bvsge lt!129168 #b00000000000000000000000000000000) (bvsle lt!129168 (bvsub (size!6271 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!166597 () (_ BitVec 32))

(assert (=> d!61819 (= lt!129168 e!166597)))

(declare-fun c!43482 () Bool)

(assert (=> d!61819 (= c!43482 (bvsge #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))))))

(assert (=> d!61819 (and (bvsle #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6271 (_keys!6900 thiss!1504)) (size!6271 (_keys!6900 thiss!1504))))))

(assert (=> d!61819 (= (arrayCountValidKeys!0 (_keys!6900 thiss!1504) #b00000000000000000000000000000000 (size!6271 (_keys!6900 thiss!1504))) lt!129168)))

(declare-fun b!257033 () Bool)

(declare-fun e!166598 () (_ BitVec 32))

(assert (=> b!257033 (= e!166597 e!166598)))

(declare-fun c!43481 () Bool)

(assert (=> b!257033 (= c!43481 (validKeyInArray!0 (select (arr!5924 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257034 () Bool)

(assert (=> b!257034 (= e!166597 #b00000000000000000000000000000000)))

(declare-fun b!257035 () Bool)

(declare-fun call!24363 () (_ BitVec 32))

(assert (=> b!257035 (= e!166598 (bvadd #b00000000000000000000000000000001 call!24363))))

(declare-fun b!257036 () Bool)

(assert (=> b!257036 (= e!166598 call!24363)))

(declare-fun bm!24360 () Bool)

(assert (=> bm!24360 (= call!24363 (arrayCountValidKeys!0 (_keys!6900 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6271 (_keys!6900 thiss!1504))))))

(assert (= (and d!61819 c!43482) b!257034))

(assert (= (and d!61819 (not c!43482)) b!257033))

(assert (= (and b!257033 c!43481) b!257035))

(assert (= (and b!257033 (not c!43481)) b!257036))

(assert (= (or b!257035 b!257036) bm!24360))

(assert (=> b!257033 m!272401))

(assert (=> b!257033 m!272401))

(assert (=> b!257033 m!272403))

(declare-fun m!272503 () Bool)

(assert (=> bm!24360 m!272503))

(assert (=> b!256706 d!61819))

(declare-fun d!61821 () Bool)

(declare-fun e!166601 () Bool)

(assert (=> d!61821 e!166601))

(declare-fun res!125735 () Bool)

(assert (=> d!61821 (=> (not res!125735) (not e!166601))))

(assert (=> d!61821 (= res!125735 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6271 (_keys!6900 thiss!1504))) (bvslt index!297 (size!6270 (_values!4719 thiss!1504)))))))

(declare-fun lt!129171 () Unit!7937)

(declare-fun choose!1241 (array!12507 array!12505 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 32) (_ BitVec 64) V!8425 Int) Unit!7937)

(assert (=> d!61821 (= lt!129171 (choose!1241 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) index!297 key!932 v!346 (defaultEntry!4736 thiss!1504)))))

(assert (=> d!61821 (validMask!0 (mask!11014 thiss!1504))))

(assert (=> d!61821 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!99 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) index!297 key!932 v!346 (defaultEntry!4736 thiss!1504)) lt!129171)))

(declare-fun b!257039 () Bool)

(assert (=> b!257039 (= e!166601 (= (+!684 (getCurrentListMap!1419 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)) (tuple2!4829 key!932 v!346)) (getCurrentListMap!1419 (array!12508 (store (arr!5924 (_keys!6900 thiss!1504)) index!297 key!932) (size!6271 (_keys!6900 thiss!1504))) (array!12506 (store (arr!5923 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6270 (_values!4719 thiss!1504))) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504))))))

(assert (= (and d!61821 res!125735) b!257039))

(declare-fun m!272505 () Bool)

(assert (=> d!61821 m!272505))

(assert (=> d!61821 m!272381))

(declare-fun m!272507 () Bool)

(assert (=> b!257039 m!272507))

(assert (=> b!257039 m!272251))

(assert (=> b!257039 m!272223))

(assert (=> b!257039 m!272251))

(declare-fun m!272509 () Bool)

(assert (=> b!257039 m!272509))

(assert (=> b!257039 m!272245))

(assert (=> b!256706 d!61821))

(declare-fun d!61823 () Bool)

(assert (=> d!61823 (arrayContainsKey!0 lt!128967 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129174 () Unit!7937)

(declare-fun choose!13 (array!12507 (_ BitVec 64) (_ BitVec 32)) Unit!7937)

(assert (=> d!61823 (= lt!129174 (choose!13 lt!128967 key!932 index!297))))

(assert (=> d!61823 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61823 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128967 key!932 index!297) lt!129174)))

(declare-fun bs!9094 () Bool)

(assert (= bs!9094 d!61823))

(assert (=> bs!9094 m!272243))

(declare-fun m!272511 () Bool)

(assert (=> bs!9094 m!272511))

(assert (=> b!256706 d!61823))

(declare-fun d!61825 () Bool)

(declare-fun res!125736 () Bool)

(declare-fun e!166602 () Bool)

(assert (=> d!61825 (=> res!125736 e!166602)))

(assert (=> d!61825 (= res!125736 (= (select (arr!5924 (_keys!6900 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61825 (= (arrayContainsKey!0 (_keys!6900 thiss!1504) key!932 #b00000000000000000000000000000000) e!166602)))

(declare-fun b!257040 () Bool)

(declare-fun e!166603 () Bool)

(assert (=> b!257040 (= e!166602 e!166603)))

(declare-fun res!125737 () Bool)

(assert (=> b!257040 (=> (not res!125737) (not e!166603))))

(assert (=> b!257040 (= res!125737 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6271 (_keys!6900 thiss!1504))))))

(declare-fun b!257041 () Bool)

(assert (=> b!257041 (= e!166603 (arrayContainsKey!0 (_keys!6900 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61825 (not res!125736)) b!257040))

(assert (= (and b!257040 res!125737) b!257041))

(assert (=> d!61825 m!272401))

(declare-fun m!272513 () Bool)

(assert (=> b!257041 m!272513))

(assert (=> b!256706 d!61825))

(declare-fun d!61827 () Bool)

(declare-fun e!166606 () Bool)

(assert (=> d!61827 e!166606))

(declare-fun res!125740 () Bool)

(assert (=> d!61827 (=> (not res!125740) (not e!166606))))

(assert (=> d!61827 (= res!125740 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6271 (_keys!6900 thiss!1504)))))))

(declare-fun lt!129177 () Unit!7937)

(declare-fun choose!102 ((_ BitVec 64) array!12507 (_ BitVec 32) (_ BitVec 32)) Unit!7937)

(assert (=> d!61827 (= lt!129177 (choose!102 key!932 (_keys!6900 thiss!1504) index!297 (mask!11014 thiss!1504)))))

(assert (=> d!61827 (validMask!0 (mask!11014 thiss!1504))))

(assert (=> d!61827 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6900 thiss!1504) index!297 (mask!11014 thiss!1504)) lt!129177)))

(declare-fun b!257044 () Bool)

(assert (=> b!257044 (= e!166606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12508 (store (arr!5924 (_keys!6900 thiss!1504)) index!297 key!932) (size!6271 (_keys!6900 thiss!1504))) (mask!11014 thiss!1504)))))

(assert (= (and d!61827 res!125740) b!257044))

(declare-fun m!272515 () Bool)

(assert (=> d!61827 m!272515))

(assert (=> d!61827 m!272381))

(assert (=> b!257044 m!272245))

(declare-fun m!272517 () Bool)

(assert (=> b!257044 m!272517))

(assert (=> b!256706 d!61827))

(declare-fun call!24370 () ListLongMap!3743)

(declare-fun c!43483 () Bool)

(declare-fun call!24365 () ListLongMap!3743)

(declare-fun c!43487 () Bool)

(declare-fun bm!24361 () Bool)

(declare-fun call!24368 () ListLongMap!3743)

(declare-fun call!24369 () ListLongMap!3743)

(assert (=> bm!24361 (= call!24365 (+!684 (ite c!43487 call!24369 (ite c!43483 call!24368 call!24370)) (ite (or c!43487 c!43483) (tuple2!4829 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4577 thiss!1504)) (tuple2!4829 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4577 thiss!1504)))))))

(declare-fun d!61829 () Bool)

(declare-fun e!166609 () Bool)

(assert (=> d!61829 e!166609))

(declare-fun res!125743 () Bool)

(assert (=> d!61829 (=> (not res!125743) (not e!166609))))

(assert (=> d!61829 (= res!125743 (or (bvsge #b00000000000000000000000000000000 (size!6271 lt!128967)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6271 lt!128967)))))))

(declare-fun lt!129180 () ListLongMap!3743)

(declare-fun lt!129182 () ListLongMap!3743)

(assert (=> d!61829 (= lt!129180 lt!129182)))

(declare-fun lt!129190 () Unit!7937)

(declare-fun e!166617 () Unit!7937)

(assert (=> d!61829 (= lt!129190 e!166617)))

(declare-fun c!43485 () Bool)

(declare-fun e!166611 () Bool)

(assert (=> d!61829 (= c!43485 e!166611)))

(declare-fun res!125741 () Bool)

(assert (=> d!61829 (=> (not res!125741) (not e!166611))))

(assert (=> d!61829 (= res!125741 (bvslt #b00000000000000000000000000000000 (size!6271 lt!128967)))))

(declare-fun e!166618 () ListLongMap!3743)

(assert (=> d!61829 (= lt!129182 e!166618)))

(assert (=> d!61829 (= c!43487 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61829 (validMask!0 (mask!11014 thiss!1504))))

(assert (=> d!61829 (= (getCurrentListMap!1419 lt!128967 (array!12506 (store (arr!5923 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6270 (_values!4719 thiss!1504))) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)) lt!129180)))

(declare-fun b!257045 () Bool)

(declare-fun lt!129199 () Unit!7937)

(assert (=> b!257045 (= e!166617 lt!129199)))

(declare-fun lt!129183 () ListLongMap!3743)

(assert (=> b!257045 (= lt!129183 (getCurrentListMapNoExtraKeys!568 lt!128967 (array!12506 (store (arr!5923 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6270 (_values!4719 thiss!1504))) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!129196 () (_ BitVec 64))

(assert (=> b!257045 (= lt!129196 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129189 () (_ BitVec 64))

(assert (=> b!257045 (= lt!129189 (select (arr!5924 lt!128967) #b00000000000000000000000000000000))))

(declare-fun lt!129179 () Unit!7937)

(assert (=> b!257045 (= lt!129179 (addStillContains!228 lt!129183 lt!129196 (zeroValue!4577 thiss!1504) lt!129189))))

(assert (=> b!257045 (contains!1842 (+!684 lt!129183 (tuple2!4829 lt!129196 (zeroValue!4577 thiss!1504))) lt!129189)))

(declare-fun lt!129191 () Unit!7937)

(assert (=> b!257045 (= lt!129191 lt!129179)))

(declare-fun lt!129187 () ListLongMap!3743)

(assert (=> b!257045 (= lt!129187 (getCurrentListMapNoExtraKeys!568 lt!128967 (array!12506 (store (arr!5923 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6270 (_values!4719 thiss!1504))) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!129195 () (_ BitVec 64))

(assert (=> b!257045 (= lt!129195 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129181 () (_ BitVec 64))

(assert (=> b!257045 (= lt!129181 (select (arr!5924 lt!128967) #b00000000000000000000000000000000))))

(declare-fun lt!129193 () Unit!7937)

(assert (=> b!257045 (= lt!129193 (addApplyDifferent!228 lt!129187 lt!129195 (minValue!4577 thiss!1504) lt!129181))))

(assert (=> b!257045 (= (apply!252 (+!684 lt!129187 (tuple2!4829 lt!129195 (minValue!4577 thiss!1504))) lt!129181) (apply!252 lt!129187 lt!129181))))

(declare-fun lt!129178 () Unit!7937)

(assert (=> b!257045 (= lt!129178 lt!129193)))

(declare-fun lt!129197 () ListLongMap!3743)

(assert (=> b!257045 (= lt!129197 (getCurrentListMapNoExtraKeys!568 lt!128967 (array!12506 (store (arr!5923 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6270 (_values!4719 thiss!1504))) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!129184 () (_ BitVec 64))

(assert (=> b!257045 (= lt!129184 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129192 () (_ BitVec 64))

(assert (=> b!257045 (= lt!129192 (select (arr!5924 lt!128967) #b00000000000000000000000000000000))))

(declare-fun lt!129185 () Unit!7937)

(assert (=> b!257045 (= lt!129185 (addApplyDifferent!228 lt!129197 lt!129184 (zeroValue!4577 thiss!1504) lt!129192))))

(assert (=> b!257045 (= (apply!252 (+!684 lt!129197 (tuple2!4829 lt!129184 (zeroValue!4577 thiss!1504))) lt!129192) (apply!252 lt!129197 lt!129192))))

(declare-fun lt!129186 () Unit!7937)

(assert (=> b!257045 (= lt!129186 lt!129185)))

(declare-fun lt!129194 () ListLongMap!3743)

(assert (=> b!257045 (= lt!129194 (getCurrentListMapNoExtraKeys!568 lt!128967 (array!12506 (store (arr!5923 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6270 (_values!4719 thiss!1504))) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!129198 () (_ BitVec 64))

(assert (=> b!257045 (= lt!129198 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129188 () (_ BitVec 64))

(assert (=> b!257045 (= lt!129188 (select (arr!5924 lt!128967) #b00000000000000000000000000000000))))

(assert (=> b!257045 (= lt!129199 (addApplyDifferent!228 lt!129194 lt!129198 (minValue!4577 thiss!1504) lt!129188))))

(assert (=> b!257045 (= (apply!252 (+!684 lt!129194 (tuple2!4829 lt!129198 (minValue!4577 thiss!1504))) lt!129188) (apply!252 lt!129194 lt!129188))))

(declare-fun b!257046 () Bool)

(declare-fun e!166608 () Bool)

(assert (=> b!257046 (= e!166608 (= (apply!252 lt!129180 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4577 thiss!1504)))))

(declare-fun b!257047 () Bool)

(declare-fun e!166613 () Bool)

(assert (=> b!257047 (= e!166613 e!166608)))

(declare-fun res!125748 () Bool)

(declare-fun call!24366 () Bool)

(assert (=> b!257047 (= res!125748 call!24366)))

(assert (=> b!257047 (=> (not res!125748) (not e!166608))))

(declare-fun b!257048 () Bool)

(declare-fun c!43486 () Bool)

(assert (=> b!257048 (= c!43486 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!166614 () ListLongMap!3743)

(declare-fun e!166615 () ListLongMap!3743)

(assert (=> b!257048 (= e!166614 e!166615)))

(declare-fun b!257049 () Bool)

(assert (=> b!257049 (= e!166618 (+!684 call!24365 (tuple2!4829 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4577 thiss!1504))))))

(declare-fun b!257050 () Bool)

(declare-fun e!166619 () Bool)

(declare-fun e!166610 () Bool)

(assert (=> b!257050 (= e!166619 e!166610)))

(declare-fun res!125745 () Bool)

(assert (=> b!257050 (=> (not res!125745) (not e!166610))))

(assert (=> b!257050 (= res!125745 (contains!1842 lt!129180 (select (arr!5924 lt!128967) #b00000000000000000000000000000000)))))

(assert (=> b!257050 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6271 lt!128967)))))

(declare-fun b!257051 () Bool)

(assert (=> b!257051 (= e!166613 (not call!24366))))

(declare-fun b!257052 () Bool)

(assert (=> b!257052 (= e!166618 e!166614)))

(assert (=> b!257052 (= c!43483 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257053 () Bool)

(declare-fun e!166616 () Bool)

(assert (=> b!257053 (= e!166616 (= (apply!252 lt!129180 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4577 thiss!1504)))))

(declare-fun b!257054 () Bool)

(declare-fun res!125744 () Bool)

(assert (=> b!257054 (=> (not res!125744) (not e!166609))))

(assert (=> b!257054 (= res!125744 e!166619)))

(declare-fun res!125747 () Bool)

(assert (=> b!257054 (=> res!125747 e!166619)))

(declare-fun e!166612 () Bool)

(assert (=> b!257054 (= res!125747 (not e!166612))))

(declare-fun res!125742 () Bool)

(assert (=> b!257054 (=> (not res!125742) (not e!166612))))

(assert (=> b!257054 (= res!125742 (bvslt #b00000000000000000000000000000000 (size!6271 lt!128967)))))

(declare-fun bm!24362 () Bool)

(assert (=> bm!24362 (= call!24370 call!24368)))

(declare-fun b!257055 () Bool)

(declare-fun e!166607 () Bool)

(assert (=> b!257055 (= e!166607 e!166616)))

(declare-fun res!125749 () Bool)

(declare-fun call!24367 () Bool)

(assert (=> b!257055 (= res!125749 call!24367)))

(assert (=> b!257055 (=> (not res!125749) (not e!166616))))

(declare-fun b!257056 () Bool)

(assert (=> b!257056 (= e!166611 (validKeyInArray!0 (select (arr!5924 lt!128967) #b00000000000000000000000000000000)))))

(declare-fun bm!24363 () Bool)

(assert (=> bm!24363 (= call!24366 (contains!1842 lt!129180 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257057 () Bool)

(declare-fun Unit!7954 () Unit!7937)

(assert (=> b!257057 (= e!166617 Unit!7954)))

(declare-fun bm!24364 () Bool)

(assert (=> bm!24364 (= call!24368 call!24369)))

(declare-fun b!257058 () Bool)

(declare-fun res!125746 () Bool)

(assert (=> b!257058 (=> (not res!125746) (not e!166609))))

(assert (=> b!257058 (= res!125746 e!166607)))

(declare-fun c!43484 () Bool)

(assert (=> b!257058 (= c!43484 (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24365 () Bool)

(declare-fun call!24364 () ListLongMap!3743)

(assert (=> bm!24365 (= call!24364 call!24365)))

(declare-fun b!257059 () Bool)

(assert (=> b!257059 (= e!166607 (not call!24367))))

(declare-fun b!257060 () Bool)

(assert (=> b!257060 (= e!166615 call!24364)))

(declare-fun b!257061 () Bool)

(assert (=> b!257061 (= e!166614 call!24364)))

(declare-fun bm!24366 () Bool)

(assert (=> bm!24366 (= call!24369 (getCurrentListMapNoExtraKeys!568 lt!128967 (array!12506 (store (arr!5923 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6270 (_values!4719 thiss!1504))) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun b!257062 () Bool)

(assert (=> b!257062 (= e!166615 call!24370)))

(declare-fun b!257063 () Bool)

(assert (=> b!257063 (= e!166612 (validKeyInArray!0 (select (arr!5924 lt!128967) #b00000000000000000000000000000000)))))

(declare-fun b!257064 () Bool)

(assert (=> b!257064 (= e!166609 e!166613)))

(declare-fun c!43488 () Bool)

(assert (=> b!257064 (= c!43488 (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257065 () Bool)

(assert (=> b!257065 (= e!166610 (= (apply!252 lt!129180 (select (arr!5924 lt!128967) #b00000000000000000000000000000000)) (get!3053 (select (arr!5923 (array!12506 (store (arr!5923 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6270 (_values!4719 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!595 (defaultEntry!4736 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6270 (array!12506 (store (arr!5923 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6270 (_values!4719 thiss!1504))))))))

(assert (=> b!257065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6271 lt!128967)))))

(declare-fun bm!24367 () Bool)

(assert (=> bm!24367 (= call!24367 (contains!1842 lt!129180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!61829 c!43487) b!257049))

(assert (= (and d!61829 (not c!43487)) b!257052))

(assert (= (and b!257052 c!43483) b!257061))

(assert (= (and b!257052 (not c!43483)) b!257048))

(assert (= (and b!257048 c!43486) b!257060))

(assert (= (and b!257048 (not c!43486)) b!257062))

(assert (= (or b!257060 b!257062) bm!24362))

(assert (= (or b!257061 bm!24362) bm!24364))

(assert (= (or b!257061 b!257060) bm!24365))

(assert (= (or b!257049 bm!24364) bm!24366))

(assert (= (or b!257049 bm!24365) bm!24361))

(assert (= (and d!61829 res!125741) b!257056))

(assert (= (and d!61829 c!43485) b!257045))

(assert (= (and d!61829 (not c!43485)) b!257057))

(assert (= (and d!61829 res!125743) b!257054))

(assert (= (and b!257054 res!125742) b!257063))

(assert (= (and b!257054 (not res!125747)) b!257050))

(assert (= (and b!257050 res!125745) b!257065))

(assert (= (and b!257054 res!125744) b!257058))

(assert (= (and b!257058 c!43484) b!257055))

(assert (= (and b!257058 (not c!43484)) b!257059))

(assert (= (and b!257055 res!125749) b!257053))

(assert (= (or b!257055 b!257059) bm!24367))

(assert (= (and b!257058 res!125746) b!257064))

(assert (= (and b!257064 c!43488) b!257047))

(assert (= (and b!257064 (not c!43488)) b!257051))

(assert (= (and b!257047 res!125748) b!257046))

(assert (= (or b!257047 b!257051) bm!24363))

(declare-fun b_lambda!8195 () Bool)

(assert (=> (not b_lambda!8195) (not b!257065)))

(assert (=> b!257065 t!8762))

(declare-fun b_and!13805 () Bool)

(assert (= b_and!13803 (and (=> t!8762 result!5365) b_and!13805)))

(assert (=> b!257063 m!272479))

(assert (=> b!257063 m!272479))

(assert (=> b!257063 m!272481))

(declare-fun m!272519 () Bool)

(assert (=> b!257049 m!272519))

(declare-fun m!272521 () Bool)

(assert (=> bm!24361 m!272521))

(declare-fun m!272523 () Bool)

(assert (=> bm!24367 m!272523))

(declare-fun m!272525 () Bool)

(assert (=> bm!24363 m!272525))

(declare-fun m!272527 () Bool)

(assert (=> b!257045 m!272527))

(declare-fun m!272529 () Bool)

(assert (=> b!257045 m!272529))

(declare-fun m!272531 () Bool)

(assert (=> b!257045 m!272531))

(declare-fun m!272533 () Bool)

(assert (=> b!257045 m!272533))

(declare-fun m!272535 () Bool)

(assert (=> b!257045 m!272535))

(declare-fun m!272537 () Bool)

(assert (=> b!257045 m!272537))

(declare-fun m!272539 () Bool)

(assert (=> b!257045 m!272539))

(assert (=> b!257045 m!272537))

(declare-fun m!272541 () Bool)

(assert (=> b!257045 m!272541))

(assert (=> b!257045 m!272527))

(declare-fun m!272543 () Bool)

(assert (=> b!257045 m!272543))

(declare-fun m!272545 () Bool)

(assert (=> b!257045 m!272545))

(assert (=> b!257045 m!272533))

(declare-fun m!272547 () Bool)

(assert (=> b!257045 m!272547))

(declare-fun m!272549 () Bool)

(assert (=> b!257045 m!272549))

(assert (=> b!257045 m!272479))

(declare-fun m!272551 () Bool)

(assert (=> b!257045 m!272551))

(declare-fun m!272553 () Bool)

(assert (=> b!257045 m!272553))

(declare-fun m!272555 () Bool)

(assert (=> b!257045 m!272555))

(assert (=> b!257045 m!272535))

(declare-fun m!272557 () Bool)

(assert (=> b!257045 m!272557))

(assert (=> d!61829 m!272381))

(assert (=> b!257050 m!272479))

(assert (=> b!257050 m!272479))

(declare-fun m!272559 () Bool)

(assert (=> b!257050 m!272559))

(assert (=> b!257056 m!272479))

(assert (=> b!257056 m!272479))

(assert (=> b!257056 m!272481))

(assert (=> bm!24366 m!272551))

(declare-fun m!272561 () Bool)

(assert (=> b!257065 m!272561))

(assert (=> b!257065 m!272449))

(declare-fun m!272563 () Bool)

(assert (=> b!257065 m!272563))

(assert (=> b!257065 m!272561))

(assert (=> b!257065 m!272479))

(assert (=> b!257065 m!272479))

(declare-fun m!272565 () Bool)

(assert (=> b!257065 m!272565))

(assert (=> b!257065 m!272449))

(declare-fun m!272567 () Bool)

(assert (=> b!257053 m!272567))

(declare-fun m!272569 () Bool)

(assert (=> b!257046 m!272569))

(assert (=> b!256706 d!61829))

(declare-fun d!61831 () Bool)

(declare-fun e!166622 () Bool)

(assert (=> d!61831 e!166622))

(declare-fun res!125755 () Bool)

(assert (=> d!61831 (=> (not res!125755) (not e!166622))))

(declare-fun lt!129210 () ListLongMap!3743)

(assert (=> d!61831 (= res!125755 (contains!1842 lt!129210 (_1!2425 (tuple2!4829 key!932 v!346))))))

(declare-fun lt!129211 () List!3706)

(assert (=> d!61831 (= lt!129210 (ListLongMap!3744 lt!129211))))

(declare-fun lt!129209 () Unit!7937)

(declare-fun lt!129208 () Unit!7937)

(assert (=> d!61831 (= lt!129209 lt!129208)))

(assert (=> d!61831 (= (getValueByKey!311 lt!129211 (_1!2425 (tuple2!4829 key!932 v!346))) (Some!316 (_2!2425 (tuple2!4829 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!167 (List!3706 (_ BitVec 64) V!8425) Unit!7937)

(assert (=> d!61831 (= lt!129208 (lemmaContainsTupThenGetReturnValue!167 lt!129211 (_1!2425 (tuple2!4829 key!932 v!346)) (_2!2425 (tuple2!4829 key!932 v!346))))))

(declare-fun insertStrictlySorted!170 (List!3706 (_ BitVec 64) V!8425) List!3706)

(assert (=> d!61831 (= lt!129211 (insertStrictlySorted!170 (toList!1887 lt!128968) (_1!2425 (tuple2!4829 key!932 v!346)) (_2!2425 (tuple2!4829 key!932 v!346))))))

(assert (=> d!61831 (= (+!684 lt!128968 (tuple2!4829 key!932 v!346)) lt!129210)))

(declare-fun b!257070 () Bool)

(declare-fun res!125754 () Bool)

(assert (=> b!257070 (=> (not res!125754) (not e!166622))))

(assert (=> b!257070 (= res!125754 (= (getValueByKey!311 (toList!1887 lt!129210) (_1!2425 (tuple2!4829 key!932 v!346))) (Some!316 (_2!2425 (tuple2!4829 key!932 v!346)))))))

(declare-fun b!257071 () Bool)

(declare-fun contains!1845 (List!3706 tuple2!4828) Bool)

(assert (=> b!257071 (= e!166622 (contains!1845 (toList!1887 lt!129210) (tuple2!4829 key!932 v!346)))))

(assert (= (and d!61831 res!125755) b!257070))

(assert (= (and b!257070 res!125754) b!257071))

(declare-fun m!272571 () Bool)

(assert (=> d!61831 m!272571))

(declare-fun m!272573 () Bool)

(assert (=> d!61831 m!272573))

(declare-fun m!272575 () Bool)

(assert (=> d!61831 m!272575))

(declare-fun m!272577 () Bool)

(assert (=> d!61831 m!272577))

(declare-fun m!272579 () Bool)

(assert (=> b!257070 m!272579))

(declare-fun m!272581 () Bool)

(assert (=> b!257071 m!272581))

(assert (=> b!256706 d!61831))

(declare-fun d!61833 () Bool)

(declare-fun e!166625 () Bool)

(assert (=> d!61833 e!166625))

(declare-fun res!125758 () Bool)

(assert (=> d!61833 (=> (not res!125758) (not e!166625))))

(assert (=> d!61833 (= res!125758 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6271 (_keys!6900 thiss!1504)))))))

(declare-fun lt!129214 () Unit!7937)

(declare-fun choose!41 (array!12507 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3707) Unit!7937)

(assert (=> d!61833 (= lt!129214 (choose!41 (_keys!6900 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3704))))

(assert (=> d!61833 (bvslt (size!6271 (_keys!6900 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61833 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6900 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3704) lt!129214)))

(declare-fun b!257074 () Bool)

(assert (=> b!257074 (= e!166625 (arrayNoDuplicates!0 (array!12508 (store (arr!5924 (_keys!6900 thiss!1504)) index!297 key!932) (size!6271 (_keys!6900 thiss!1504))) #b00000000000000000000000000000000 Nil!3704))))

(assert (= (and d!61833 res!125758) b!257074))

(declare-fun m!272583 () Bool)

(assert (=> d!61833 m!272583))

(assert (=> b!257074 m!272245))

(declare-fun m!272585 () Bool)

(assert (=> b!257074 m!272585))

(assert (=> b!256706 d!61833))

(declare-fun b!257085 () Bool)

(declare-fun e!166636 () Bool)

(declare-fun call!24373 () Bool)

(assert (=> b!257085 (= e!166636 call!24373)))

(declare-fun d!61835 () Bool)

(declare-fun res!125767 () Bool)

(declare-fun e!166634 () Bool)

(assert (=> d!61835 (=> res!125767 e!166634)))

(assert (=> d!61835 (= res!125767 (bvsge #b00000000000000000000000000000000 (size!6271 lt!128967)))))

(assert (=> d!61835 (= (arrayNoDuplicates!0 lt!128967 #b00000000000000000000000000000000 Nil!3704) e!166634)))

(declare-fun b!257086 () Bool)

(declare-fun e!166637 () Bool)

(assert (=> b!257086 (= e!166637 e!166636)))

(declare-fun c!43491 () Bool)

(assert (=> b!257086 (= c!43491 (validKeyInArray!0 (select (arr!5924 lt!128967) #b00000000000000000000000000000000)))))

(declare-fun bm!24370 () Bool)

(assert (=> bm!24370 (= call!24373 (arrayNoDuplicates!0 lt!128967 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43491 (Cons!3703 (select (arr!5924 lt!128967) #b00000000000000000000000000000000) Nil!3704) Nil!3704)))))

(declare-fun b!257087 () Bool)

(assert (=> b!257087 (= e!166636 call!24373)))

(declare-fun b!257088 () Bool)

(declare-fun e!166635 () Bool)

(declare-fun contains!1846 (List!3707 (_ BitVec 64)) Bool)

(assert (=> b!257088 (= e!166635 (contains!1846 Nil!3704 (select (arr!5924 lt!128967) #b00000000000000000000000000000000)))))

(declare-fun b!257089 () Bool)

(assert (=> b!257089 (= e!166634 e!166637)))

(declare-fun res!125765 () Bool)

(assert (=> b!257089 (=> (not res!125765) (not e!166637))))

(assert (=> b!257089 (= res!125765 (not e!166635))))

(declare-fun res!125766 () Bool)

(assert (=> b!257089 (=> (not res!125766) (not e!166635))))

(assert (=> b!257089 (= res!125766 (validKeyInArray!0 (select (arr!5924 lt!128967) #b00000000000000000000000000000000)))))

(assert (= (and d!61835 (not res!125767)) b!257089))

(assert (= (and b!257089 res!125766) b!257088))

(assert (= (and b!257089 res!125765) b!257086))

(assert (= (and b!257086 c!43491) b!257087))

(assert (= (and b!257086 (not c!43491)) b!257085))

(assert (= (or b!257087 b!257085) bm!24370))

(assert (=> b!257086 m!272479))

(assert (=> b!257086 m!272479))

(assert (=> b!257086 m!272481))

(assert (=> bm!24370 m!272479))

(declare-fun m!272587 () Bool)

(assert (=> bm!24370 m!272587))

(assert (=> b!257088 m!272479))

(assert (=> b!257088 m!272479))

(declare-fun m!272589 () Bool)

(assert (=> b!257088 m!272589))

(assert (=> b!257089 m!272479))

(assert (=> b!257089 m!272479))

(assert (=> b!257089 m!272481))

(assert (=> b!256706 d!61835))

(assert (=> bm!24313 d!61825))

(declare-fun d!61837 () Bool)

(assert (=> d!61837 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256718 d!61837))

(declare-fun d!61839 () Bool)

(assert (=> d!61839 (contains!1842 (getCurrentListMap!1419 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)) key!932)))

(declare-fun lt!129217 () Unit!7937)

(declare-fun choose!1242 (array!12507 array!12505 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) (_ BitVec 32) Int) Unit!7937)

(assert (=> d!61839 (= lt!129217 (choose!1242 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(assert (=> d!61839 (validMask!0 (mask!11014 thiss!1504))))

(assert (=> d!61839 (= (lemmaArrayContainsKeyThenInListMap!241 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)) lt!129217)))

(declare-fun bs!9095 () Bool)

(assert (= bs!9095 d!61839))

(assert (=> bs!9095 m!272251))

(assert (=> bs!9095 m!272251))

(declare-fun m!272591 () Bool)

(assert (=> bs!9095 m!272591))

(declare-fun m!272593 () Bool)

(assert (=> bs!9095 m!272593))

(assert (=> bs!9095 m!272381))

(assert (=> b!256727 d!61839))

(declare-fun mapNonEmpty!11214 () Bool)

(declare-fun mapRes!11214 () Bool)

(declare-fun tp!23481 () Bool)

(declare-fun e!166642 () Bool)

(assert (=> mapNonEmpty!11214 (= mapRes!11214 (and tp!23481 e!166642))))

(declare-fun mapKey!11214 () (_ BitVec 32))

(declare-fun mapValue!11214 () ValueCell!2948)

(declare-fun mapRest!11214 () (Array (_ BitVec 32) ValueCell!2948))

(assert (=> mapNonEmpty!11214 (= mapRest!11205 (store mapRest!11214 mapKey!11214 mapValue!11214))))

(declare-fun mapIsEmpty!11214 () Bool)

(assert (=> mapIsEmpty!11214 mapRes!11214))

(declare-fun b!257096 () Bool)

(assert (=> b!257096 (= e!166642 tp_is_empty!6583)))

(declare-fun condMapEmpty!11214 () Bool)

(declare-fun mapDefault!11214 () ValueCell!2948)

(assert (=> mapNonEmpty!11205 (= condMapEmpty!11214 (= mapRest!11205 ((as const (Array (_ BitVec 32) ValueCell!2948)) mapDefault!11214)))))

(declare-fun e!166643 () Bool)

(assert (=> mapNonEmpty!11205 (= tp!23465 (and e!166643 mapRes!11214))))

(declare-fun b!257097 () Bool)

(assert (=> b!257097 (= e!166643 tp_is_empty!6583)))

(assert (= (and mapNonEmpty!11205 condMapEmpty!11214) mapIsEmpty!11214))

(assert (= (and mapNonEmpty!11205 (not condMapEmpty!11214)) mapNonEmpty!11214))

(assert (= (and mapNonEmpty!11214 ((_ is ValueCellFull!2948) mapValue!11214)) b!257096))

(assert (= (and mapNonEmpty!11205 ((_ is ValueCellFull!2948) mapDefault!11214)) b!257097))

(declare-fun m!272595 () Bool)

(assert (=> mapNonEmpty!11214 m!272595))

(declare-fun b_lambda!8197 () Bool)

(assert (= b_lambda!8195 (or (and b!256714 b_free!6721) b_lambda!8197)))

(declare-fun b_lambda!8199 () Bool)

(assert (= b_lambda!8193 (or (and b!256714 b_free!6721) b_lambda!8199)))

(check-sat (not d!61829) (not b!257049) (not bm!24363) (not b!257050) (not bm!24370) (not d!61797) (not bm!24341) (not b!256929) (not b!256949) (not bm!24366) (not d!61801) (not bm!24361) (not b!256937) (not d!61807) (not d!61833) (not d!61831) (not b!256959) (not b!256960) (not b!256886) (not b!256884) (not b!256947) (not bm!24346) (not b!257023) (not bm!24353) (not bm!24347) (not b!257045) (not b!257002) (not b!257074) (not b!257070) (not b!257086) (not b_next!6721) (not b_lambda!8199) (not b!256930) (not b!257071) (not bm!24343) (not b!257053) (not b!257089) (not b!256877) (not b!256940) (not bm!24356) (not d!61803) (not b!256933) (not b!257046) (not bm!24359) (not mapNonEmpty!11214) (not bm!24360) (not d!61805) (not b!257032) (not b!256934) (not b!257063) (not d!61823) (not b!257039) (not d!61839) (not bm!24367) (not b!257011) tp_is_empty!6583 (not d!61827) (not b!257014) (not d!61809) (not d!61813) (not b!256989) (not d!61821) b_and!13805 (not bm!24352) (not b!257041) (not b!257065) (not b!256999) (not b!257012) (not b_lambda!8197) (not b!257056) (not b!256958) (not b!257044) (not b!257033) (not b!257088))
(check-sat b_and!13805 (not b_next!6721))
