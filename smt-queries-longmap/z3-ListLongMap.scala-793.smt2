; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18906 () Bool)

(assert start!18906)

(declare-fun b!186641 () Bool)

(declare-fun b_free!4599 () Bool)

(declare-fun b_next!4599 () Bool)

(assert (=> b!186641 (= b_free!4599 (not b_next!4599))))

(declare-fun tp!16603 () Bool)

(declare-fun b_and!11209 () Bool)

(assert (=> b!186641 (= tp!16603 b_and!11209)))

(declare-fun tp_is_empty!4371 () Bool)

(declare-fun e!122836 () Bool)

(declare-datatypes ((V!5475 0))(
  ( (V!5476 (val!2230 Int)) )
))
(declare-datatypes ((ValueCell!1842 0))(
  ( (ValueCellFull!1842 (v!4143 V!5475)) (EmptyCell!1842) )
))
(declare-datatypes ((array!7955 0))(
  ( (array!7956 (arr!3755 (Array (_ BitVec 32) (_ BitVec 64))) (size!4072 (_ BitVec 32))) )
))
(declare-datatypes ((array!7957 0))(
  ( (array!7958 (arr!3756 (Array (_ BitVec 32) ValueCell!1842)) (size!4073 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2592 0))(
  ( (LongMapFixedSize!2593 (defaultEntry!3807 Int) (mask!8938 (_ BitVec 32)) (extraKeys!3544 (_ BitVec 32)) (zeroValue!3648 V!5475) (minValue!3648 V!5475) (_size!1345 (_ BitVec 32)) (_keys!5753 array!7955) (_values!3790 array!7957) (_vacant!1345 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2592)

(declare-fun e!122841 () Bool)

(declare-fun array_inv!2427 (array!7955) Bool)

(declare-fun array_inv!2428 (array!7957) Bool)

(assert (=> b!186641 (= e!122836 (and tp!16603 tp_is_empty!4371 (array_inv!2427 (_keys!5753 thiss!1248)) (array_inv!2428 (_values!3790 thiss!1248)) e!122841))))

(declare-fun b!186642 () Bool)

(declare-fun e!122839 () Bool)

(assert (=> b!186642 (= e!122839 tp_is_empty!4371)))

(declare-fun b!186643 () Bool)

(declare-datatypes ((Unit!5621 0))(
  ( (Unit!5622) )
))
(declare-fun e!122844 () Unit!5621)

(declare-fun lt!92297 () Unit!5621)

(assert (=> b!186643 (= e!122844 lt!92297)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!146 (array!7955 array!7957 (_ BitVec 32) (_ BitVec 32) V!5475 V!5475 (_ BitVec 64) Int) Unit!5621)

(assert (=> b!186643 (= lt!92297 (lemmaInListMapThenSeekEntryOrOpenFindsIt!146 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) key!828 (defaultEntry!3807 thiss!1248)))))

(declare-fun res!88279 () Bool)

(declare-datatypes ((SeekEntryResult!644 0))(
  ( (MissingZero!644 (index!4746 (_ BitVec 32))) (Found!644 (index!4747 (_ BitVec 32))) (Intermediate!644 (undefined!1456 Bool) (index!4748 (_ BitVec 32)) (x!20234 (_ BitVec 32))) (Undefined!644) (MissingVacant!644 (index!4749 (_ BitVec 32))) )
))
(declare-fun lt!92295 () SeekEntryResult!644)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186643 (= res!88279 (inRange!0 (index!4747 lt!92295) (mask!8938 thiss!1248)))))

(declare-fun e!122837 () Bool)

(assert (=> b!186643 (=> (not res!88279) (not e!122837))))

(assert (=> b!186643 e!122837))

(declare-fun mapNonEmpty!7525 () Bool)

(declare-fun mapRes!7525 () Bool)

(declare-fun tp!16602 () Bool)

(declare-fun e!122838 () Bool)

(assert (=> mapNonEmpty!7525 (= mapRes!7525 (and tp!16602 e!122838))))

(declare-fun mapValue!7525 () ValueCell!1842)

(declare-fun mapRest!7525 () (Array (_ BitVec 32) ValueCell!1842))

(declare-fun mapKey!7525 () (_ BitVec 32))

(assert (=> mapNonEmpty!7525 (= (arr!3756 (_values!3790 thiss!1248)) (store mapRest!7525 mapKey!7525 mapValue!7525))))

(declare-fun mapIsEmpty!7525 () Bool)

(assert (=> mapIsEmpty!7525 mapRes!7525))

(declare-fun b!186644 () Bool)

(assert (=> b!186644 (= e!122838 tp_is_empty!4371)))

(declare-fun b!186645 () Bool)

(assert (=> b!186645 (= e!122841 (and e!122839 mapRes!7525))))

(declare-fun condMapEmpty!7525 () Bool)

(declare-fun mapDefault!7525 () ValueCell!1842)

(assert (=> b!186645 (= condMapEmpty!7525 (= (arr!3756 (_values!3790 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1842)) mapDefault!7525)))))

(declare-fun b!186646 () Bool)

(assert (=> b!186646 (= e!122837 (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4747 lt!92295)) key!828))))

(declare-fun res!88282 () Bool)

(declare-fun e!122843 () Bool)

(assert (=> start!18906 (=> (not res!88282) (not e!122843))))

(declare-fun valid!1067 (LongMapFixedSize!2592) Bool)

(assert (=> start!18906 (= res!88282 (valid!1067 thiss!1248))))

(assert (=> start!18906 e!122843))

(assert (=> start!18906 e!122836))

(assert (=> start!18906 true))

(declare-fun b!186647 () Bool)

(declare-fun e!122842 () Bool)

(declare-fun e!122840 () Bool)

(assert (=> b!186647 (= e!122842 e!122840)))

(declare-fun res!88281 () Bool)

(assert (=> b!186647 (=> (not res!88281) (not e!122840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!186647 (= res!88281 (validMask!0 (mask!8938 thiss!1248)))))

(declare-fun lt!92294 () Unit!5621)

(assert (=> b!186647 (= lt!92294 e!122844)))

(declare-fun c!33479 () Bool)

(declare-datatypes ((tuple2!3470 0))(
  ( (tuple2!3471 (_1!1746 (_ BitVec 64)) (_2!1746 V!5475)) )
))
(declare-datatypes ((List!2376 0))(
  ( (Nil!2373) (Cons!2372 (h!3006 tuple2!3470) (t!7264 List!2376)) )
))
(declare-datatypes ((ListLongMap!2387 0))(
  ( (ListLongMap!2388 (toList!1209 List!2376)) )
))
(declare-fun contains!1307 (ListLongMap!2387 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!857 (array!7955 array!7957 (_ BitVec 32) (_ BitVec 32) V!5475 V!5475 (_ BitVec 32) Int) ListLongMap!2387)

(assert (=> b!186647 (= c!33479 (contains!1307 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)) key!828))))

(declare-fun b!186648 () Bool)

(assert (=> b!186648 (= e!122840 (and (= (size!4073 (_values!3790 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8938 thiss!1248))) (not (= (size!4072 (_keys!5753 thiss!1248)) (size!4073 (_values!3790 thiss!1248))))))))

(declare-fun b!186649 () Bool)

(assert (=> b!186649 (= e!122843 e!122842)))

(declare-fun res!88278 () Bool)

(assert (=> b!186649 (=> (not res!88278) (not e!122842))))

(get-info :version)

(assert (=> b!186649 (= res!88278 (and (not ((_ is Undefined!644) lt!92295)) (not ((_ is MissingVacant!644) lt!92295)) (not ((_ is MissingZero!644) lt!92295)) ((_ is Found!644) lt!92295)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7955 (_ BitVec 32)) SeekEntryResult!644)

(assert (=> b!186649 (= lt!92295 (seekEntryOrOpen!0 key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(declare-fun b!186650 () Bool)

(declare-fun res!88280 () Bool)

(assert (=> b!186650 (=> (not res!88280) (not e!122843))))

(assert (=> b!186650 (= res!88280 (not (= key!828 (bvneg key!828))))))

(declare-fun b!186651 () Bool)

(declare-fun Unit!5623 () Unit!5621)

(assert (=> b!186651 (= e!122844 Unit!5623)))

(declare-fun lt!92296 () Unit!5621)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!148 (array!7955 array!7957 (_ BitVec 32) (_ BitVec 32) V!5475 V!5475 (_ BitVec 64) Int) Unit!5621)

(assert (=> b!186651 (= lt!92296 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!148 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) key!828 (defaultEntry!3807 thiss!1248)))))

(assert (=> b!186651 false))

(assert (= (and start!18906 res!88282) b!186650))

(assert (= (and b!186650 res!88280) b!186649))

(assert (= (and b!186649 res!88278) b!186647))

(assert (= (and b!186647 c!33479) b!186643))

(assert (= (and b!186647 (not c!33479)) b!186651))

(assert (= (and b!186643 res!88279) b!186646))

(assert (= (and b!186647 res!88281) b!186648))

(assert (= (and b!186645 condMapEmpty!7525) mapIsEmpty!7525))

(assert (= (and b!186645 (not condMapEmpty!7525)) mapNonEmpty!7525))

(assert (= (and mapNonEmpty!7525 ((_ is ValueCellFull!1842) mapValue!7525)) b!186644))

(assert (= (and b!186645 ((_ is ValueCellFull!1842) mapDefault!7525)) b!186642))

(assert (= b!186641 b!186645))

(assert (= start!18906 b!186641))

(declare-fun m!213583 () Bool)

(assert (=> b!186646 m!213583))

(declare-fun m!213585 () Bool)

(assert (=> b!186649 m!213585))

(declare-fun m!213587 () Bool)

(assert (=> b!186651 m!213587))

(declare-fun m!213589 () Bool)

(assert (=> start!18906 m!213589))

(declare-fun m!213591 () Bool)

(assert (=> b!186647 m!213591))

(declare-fun m!213593 () Bool)

(assert (=> b!186647 m!213593))

(assert (=> b!186647 m!213593))

(declare-fun m!213595 () Bool)

(assert (=> b!186647 m!213595))

(declare-fun m!213597 () Bool)

(assert (=> b!186643 m!213597))

(declare-fun m!213599 () Bool)

(assert (=> b!186643 m!213599))

(declare-fun m!213601 () Bool)

(assert (=> b!186641 m!213601))

(declare-fun m!213603 () Bool)

(assert (=> b!186641 m!213603))

(declare-fun m!213605 () Bool)

(assert (=> mapNonEmpty!7525 m!213605))

(check-sat tp_is_empty!4371 (not mapNonEmpty!7525) b_and!11209 (not b!186649) (not b!186643) (not b!186641) (not start!18906) (not b!186651) (not b_next!4599) (not b!186647))
(check-sat b_and!11209 (not b_next!4599))
(get-model)

(declare-fun d!55271 () Bool)

(declare-fun e!122877 () Bool)

(assert (=> d!55271 e!122877))

(declare-fun res!88302 () Bool)

(assert (=> d!55271 (=> (not res!88302) (not e!122877))))

(declare-fun lt!92315 () SeekEntryResult!644)

(assert (=> d!55271 (= res!88302 ((_ is Found!644) lt!92315))))

(assert (=> d!55271 (= lt!92315 (seekEntryOrOpen!0 key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(declare-fun lt!92314 () Unit!5621)

(declare-fun choose!989 (array!7955 array!7957 (_ BitVec 32) (_ BitVec 32) V!5475 V!5475 (_ BitVec 64) Int) Unit!5621)

(assert (=> d!55271 (= lt!92314 (choose!989 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) key!828 (defaultEntry!3807 thiss!1248)))))

(assert (=> d!55271 (validMask!0 (mask!8938 thiss!1248))))

(assert (=> d!55271 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!146 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) key!828 (defaultEntry!3807 thiss!1248)) lt!92314)))

(declare-fun b!186689 () Bool)

(declare-fun res!88303 () Bool)

(assert (=> b!186689 (=> (not res!88303) (not e!122877))))

(assert (=> b!186689 (= res!88303 (inRange!0 (index!4747 lt!92315) (mask!8938 thiss!1248)))))

(declare-fun b!186690 () Bool)

(assert (=> b!186690 (= e!122877 (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4747 lt!92315)) key!828))))

(assert (=> b!186690 (and (bvsge (index!4747 lt!92315) #b00000000000000000000000000000000) (bvslt (index!4747 lt!92315) (size!4072 (_keys!5753 thiss!1248))))))

(assert (= (and d!55271 res!88302) b!186689))

(assert (= (and b!186689 res!88303) b!186690))

(assert (=> d!55271 m!213585))

(declare-fun m!213631 () Bool)

(assert (=> d!55271 m!213631))

(assert (=> d!55271 m!213591))

(declare-fun m!213633 () Bool)

(assert (=> b!186689 m!213633))

(declare-fun m!213635 () Bool)

(assert (=> b!186690 m!213635))

(assert (=> b!186643 d!55271))

(declare-fun d!55273 () Bool)

(assert (=> d!55273 (= (inRange!0 (index!4747 lt!92295) (mask!8938 thiss!1248)) (and (bvsge (index!4747 lt!92295) #b00000000000000000000000000000000) (bvslt (index!4747 lt!92295) (bvadd (mask!8938 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186643 d!55273))

(declare-fun d!55275 () Bool)

(assert (=> d!55275 (= (validMask!0 (mask!8938 thiss!1248)) (and (or (= (mask!8938 thiss!1248) #b00000000000000000000000000000111) (= (mask!8938 thiss!1248) #b00000000000000000000000000001111) (= (mask!8938 thiss!1248) #b00000000000000000000000000011111) (= (mask!8938 thiss!1248) #b00000000000000000000000000111111) (= (mask!8938 thiss!1248) #b00000000000000000000000001111111) (= (mask!8938 thiss!1248) #b00000000000000000000000011111111) (= (mask!8938 thiss!1248) #b00000000000000000000000111111111) (= (mask!8938 thiss!1248) #b00000000000000000000001111111111) (= (mask!8938 thiss!1248) #b00000000000000000000011111111111) (= (mask!8938 thiss!1248) #b00000000000000000000111111111111) (= (mask!8938 thiss!1248) #b00000000000000000001111111111111) (= (mask!8938 thiss!1248) #b00000000000000000011111111111111) (= (mask!8938 thiss!1248) #b00000000000000000111111111111111) (= (mask!8938 thiss!1248) #b00000000000000001111111111111111) (= (mask!8938 thiss!1248) #b00000000000000011111111111111111) (= (mask!8938 thiss!1248) #b00000000000000111111111111111111) (= (mask!8938 thiss!1248) #b00000000000001111111111111111111) (= (mask!8938 thiss!1248) #b00000000000011111111111111111111) (= (mask!8938 thiss!1248) #b00000000000111111111111111111111) (= (mask!8938 thiss!1248) #b00000000001111111111111111111111) (= (mask!8938 thiss!1248) #b00000000011111111111111111111111) (= (mask!8938 thiss!1248) #b00000000111111111111111111111111) (= (mask!8938 thiss!1248) #b00000001111111111111111111111111) (= (mask!8938 thiss!1248) #b00000011111111111111111111111111) (= (mask!8938 thiss!1248) #b00000111111111111111111111111111) (= (mask!8938 thiss!1248) #b00001111111111111111111111111111) (= (mask!8938 thiss!1248) #b00011111111111111111111111111111) (= (mask!8938 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8938 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!186647 d!55275))

(declare-fun d!55277 () Bool)

(declare-fun e!122883 () Bool)

(assert (=> d!55277 e!122883))

(declare-fun res!88306 () Bool)

(assert (=> d!55277 (=> res!88306 e!122883)))

(declare-fun lt!92327 () Bool)

(assert (=> d!55277 (= res!88306 (not lt!92327))))

(declare-fun lt!92325 () Bool)

(assert (=> d!55277 (= lt!92327 lt!92325)))

(declare-fun lt!92326 () Unit!5621)

(declare-fun e!122882 () Unit!5621)

(assert (=> d!55277 (= lt!92326 e!122882)))

(declare-fun c!33485 () Bool)

(assert (=> d!55277 (= c!33485 lt!92325)))

(declare-fun containsKey!230 (List!2376 (_ BitVec 64)) Bool)

(assert (=> d!55277 (= lt!92325 (containsKey!230 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828))))

(assert (=> d!55277 (= (contains!1307 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)) key!828) lt!92327)))

(declare-fun b!186697 () Bool)

(declare-fun lt!92324 () Unit!5621)

(assert (=> b!186697 (= e!122882 lt!92324)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!178 (List!2376 (_ BitVec 64)) Unit!5621)

(assert (=> b!186697 (= lt!92324 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828))))

(declare-datatypes ((Option!232 0))(
  ( (Some!231 (v!4145 V!5475)) (None!230) )
))
(declare-fun isDefined!179 (Option!232) Bool)

(declare-fun getValueByKey!226 (List!2376 (_ BitVec 64)) Option!232)

(assert (=> b!186697 (isDefined!179 (getValueByKey!226 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828))))

(declare-fun b!186698 () Bool)

(declare-fun Unit!5627 () Unit!5621)

(assert (=> b!186698 (= e!122882 Unit!5627)))

(declare-fun b!186699 () Bool)

(assert (=> b!186699 (= e!122883 (isDefined!179 (getValueByKey!226 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828)))))

(assert (= (and d!55277 c!33485) b!186697))

(assert (= (and d!55277 (not c!33485)) b!186698))

(assert (= (and d!55277 (not res!88306)) b!186699))

(declare-fun m!213637 () Bool)

(assert (=> d!55277 m!213637))

(declare-fun m!213639 () Bool)

(assert (=> b!186697 m!213639))

(declare-fun m!213641 () Bool)

(assert (=> b!186697 m!213641))

(assert (=> b!186697 m!213641))

(declare-fun m!213643 () Bool)

(assert (=> b!186697 m!213643))

(assert (=> b!186699 m!213641))

(assert (=> b!186699 m!213641))

(assert (=> b!186699 m!213643))

(assert (=> b!186647 d!55277))

(declare-fun b!186742 () Bool)

(declare-fun e!122922 () Bool)

(declare-fun e!122921 () Bool)

(assert (=> b!186742 (= e!122922 e!122921)))

(declare-fun res!88330 () Bool)

(declare-fun call!18829 () Bool)

(assert (=> b!186742 (= res!88330 call!18829)))

(assert (=> b!186742 (=> (not res!88330) (not e!122921))))

(declare-fun b!186743 () Bool)

(declare-fun e!122914 () Bool)

(declare-fun e!122913 () Bool)

(assert (=> b!186743 (= e!122914 e!122913)))

(declare-fun c!33502 () Bool)

(assert (=> b!186743 (= c!33502 (not (= (bvand (extraKeys!3544 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18823 () Bool)

(declare-fun lt!92389 () ListLongMap!2387)

(assert (=> bm!18823 (= call!18829 (contains!1307 lt!92389 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186744 () Bool)

(declare-fun e!122912 () Unit!5621)

(declare-fun lt!92383 () Unit!5621)

(assert (=> b!186744 (= e!122912 lt!92383)))

(declare-fun lt!92384 () ListLongMap!2387)

(declare-fun getCurrentListMapNoExtraKeys!202 (array!7955 array!7957 (_ BitVec 32) (_ BitVec 32) V!5475 V!5475 (_ BitVec 32) Int) ListLongMap!2387)

(assert (=> b!186744 (= lt!92384 (getCurrentListMapNoExtraKeys!202 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))))

(declare-fun lt!92375 () (_ BitVec 64))

(assert (=> b!186744 (= lt!92375 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92377 () (_ BitVec 64))

(assert (=> b!186744 (= lt!92377 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92392 () Unit!5621)

(declare-fun addStillContains!145 (ListLongMap!2387 (_ BitVec 64) V!5475 (_ BitVec 64)) Unit!5621)

(assert (=> b!186744 (= lt!92392 (addStillContains!145 lt!92384 lt!92375 (zeroValue!3648 thiss!1248) lt!92377))))

(declare-fun +!289 (ListLongMap!2387 tuple2!3470) ListLongMap!2387)

(assert (=> b!186744 (contains!1307 (+!289 lt!92384 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248))) lt!92377)))

(declare-fun lt!92387 () Unit!5621)

(assert (=> b!186744 (= lt!92387 lt!92392)))

(declare-fun lt!92390 () ListLongMap!2387)

(assert (=> b!186744 (= lt!92390 (getCurrentListMapNoExtraKeys!202 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))))

(declare-fun lt!92373 () (_ BitVec 64))

(assert (=> b!186744 (= lt!92373 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92380 () (_ BitVec 64))

(assert (=> b!186744 (= lt!92380 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92374 () Unit!5621)

(declare-fun addApplyDifferent!145 (ListLongMap!2387 (_ BitVec 64) V!5475 (_ BitVec 64)) Unit!5621)

(assert (=> b!186744 (= lt!92374 (addApplyDifferent!145 lt!92390 lt!92373 (minValue!3648 thiss!1248) lt!92380))))

(declare-fun apply!169 (ListLongMap!2387 (_ BitVec 64)) V!5475)

(assert (=> b!186744 (= (apply!169 (+!289 lt!92390 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248))) lt!92380) (apply!169 lt!92390 lt!92380))))

(declare-fun lt!92385 () Unit!5621)

(assert (=> b!186744 (= lt!92385 lt!92374)))

(declare-fun lt!92378 () ListLongMap!2387)

(assert (=> b!186744 (= lt!92378 (getCurrentListMapNoExtraKeys!202 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))))

(declare-fun lt!92381 () (_ BitVec 64))

(assert (=> b!186744 (= lt!92381 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92376 () (_ BitVec 64))

(assert (=> b!186744 (= lt!92376 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92386 () Unit!5621)

(assert (=> b!186744 (= lt!92386 (addApplyDifferent!145 lt!92378 lt!92381 (zeroValue!3648 thiss!1248) lt!92376))))

(assert (=> b!186744 (= (apply!169 (+!289 lt!92378 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248))) lt!92376) (apply!169 lt!92378 lt!92376))))

(declare-fun lt!92382 () Unit!5621)

(assert (=> b!186744 (= lt!92382 lt!92386)))

(declare-fun lt!92391 () ListLongMap!2387)

(assert (=> b!186744 (= lt!92391 (getCurrentListMapNoExtraKeys!202 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))))

(declare-fun lt!92372 () (_ BitVec 64))

(assert (=> b!186744 (= lt!92372 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92379 () (_ BitVec 64))

(assert (=> b!186744 (= lt!92379 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186744 (= lt!92383 (addApplyDifferent!145 lt!92391 lt!92372 (minValue!3648 thiss!1248) lt!92379))))

(assert (=> b!186744 (= (apply!169 (+!289 lt!92391 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248))) lt!92379) (apply!169 lt!92391 lt!92379))))

(declare-fun bm!18824 () Bool)

(declare-fun call!18826 () ListLongMap!2387)

(assert (=> bm!18824 (= call!18826 (getCurrentListMapNoExtraKeys!202 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))))

(declare-fun b!186745 () Bool)

(declare-fun res!88332 () Bool)

(assert (=> b!186745 (=> (not res!88332) (not e!122914))))

(declare-fun e!122918 () Bool)

(assert (=> b!186745 (= res!88332 e!122918)))

(declare-fun res!88333 () Bool)

(assert (=> b!186745 (=> res!88333 e!122918)))

(declare-fun e!122911 () Bool)

(assert (=> b!186745 (= res!88333 (not e!122911))))

(declare-fun res!88328 () Bool)

(assert (=> b!186745 (=> (not res!88328) (not e!122911))))

(assert (=> b!186745 (= res!88328 (bvslt #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun b!186746 () Bool)

(assert (=> b!186746 (= e!122921 (= (apply!169 lt!92389 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3648 thiss!1248)))))

(declare-fun b!186747 () Bool)

(declare-fun e!122920 () ListLongMap!2387)

(declare-fun call!18828 () ListLongMap!2387)

(assert (=> b!186747 (= e!122920 (+!289 call!18828 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))))))

(declare-fun b!186748 () Bool)

(declare-fun e!122910 () ListLongMap!2387)

(assert (=> b!186748 (= e!122920 e!122910)))

(declare-fun c!33500 () Bool)

(assert (=> b!186748 (= c!33500 (and (not (= (bvand (extraKeys!3544 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3544 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18825 () Bool)

(declare-fun call!18832 () ListLongMap!2387)

(declare-fun call!18830 () ListLongMap!2387)

(declare-fun c!33499 () Bool)

(assert (=> bm!18825 (= call!18828 (+!289 (ite c!33499 call!18826 (ite c!33500 call!18830 call!18832)) (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))))))

(declare-fun b!186749 () Bool)

(assert (=> b!186749 (= e!122922 (not call!18829))))

(declare-fun b!186750 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!186750 (= e!122911 (validKeyInArray!0 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186751 () Bool)

(declare-fun call!18831 () Bool)

(assert (=> b!186751 (= e!122913 (not call!18831))))

(declare-fun b!186752 () Bool)

(declare-fun e!122917 () Bool)

(declare-fun get!2157 (ValueCell!1842 V!5475) V!5475)

(declare-fun dynLambda!512 (Int (_ BitVec 64)) V!5475)

(assert (=> b!186752 (= e!122917 (= (apply!169 lt!92389 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)) (get!2157 (select (arr!3756 (_values!3790 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3807 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4073 (_values!3790 thiss!1248))))))

(assert (=> b!186752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun b!186753 () Bool)

(declare-fun e!122919 () ListLongMap!2387)

(declare-fun call!18827 () ListLongMap!2387)

(assert (=> b!186753 (= e!122919 call!18827)))

(declare-fun b!186754 () Bool)

(assert (=> b!186754 (= e!122919 call!18832)))

(declare-fun bm!18826 () Bool)

(assert (=> bm!18826 (= call!18832 call!18830)))

(declare-fun bm!18827 () Bool)

(assert (=> bm!18827 (= call!18831 (contains!1307 lt!92389 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186755 () Bool)

(assert (=> b!186755 (= e!122910 call!18827)))

(declare-fun b!186756 () Bool)

(declare-fun res!88327 () Bool)

(assert (=> b!186756 (=> (not res!88327) (not e!122914))))

(assert (=> b!186756 (= res!88327 e!122922)))

(declare-fun c!33503 () Bool)

(assert (=> b!186756 (= c!33503 (not (= (bvand (extraKeys!3544 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!186757 () Bool)

(declare-fun e!122915 () Bool)

(assert (=> b!186757 (= e!122913 e!122915)))

(declare-fun res!88326 () Bool)

(assert (=> b!186757 (= res!88326 call!18831)))

(assert (=> b!186757 (=> (not res!88326) (not e!122915))))

(declare-fun b!186758 () Bool)

(assert (=> b!186758 (= e!122915 (= (apply!169 lt!92389 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3648 thiss!1248)))))

(declare-fun b!186759 () Bool)

(declare-fun e!122916 () Bool)

(assert (=> b!186759 (= e!122916 (validKeyInArray!0 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186760 () Bool)

(assert (=> b!186760 (= e!122918 e!122917)))

(declare-fun res!88329 () Bool)

(assert (=> b!186760 (=> (not res!88329) (not e!122917))))

(assert (=> b!186760 (= res!88329 (contains!1307 lt!92389 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun d!55279 () Bool)

(assert (=> d!55279 e!122914))

(declare-fun res!88331 () Bool)

(assert (=> d!55279 (=> (not res!88331) (not e!122914))))

(assert (=> d!55279 (= res!88331 (or (bvsge #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))))

(declare-fun lt!92393 () ListLongMap!2387)

(assert (=> d!55279 (= lt!92389 lt!92393)))

(declare-fun lt!92388 () Unit!5621)

(assert (=> d!55279 (= lt!92388 e!122912)))

(declare-fun c!33501 () Bool)

(assert (=> d!55279 (= c!33501 e!122916)))

(declare-fun res!88325 () Bool)

(assert (=> d!55279 (=> (not res!88325) (not e!122916))))

(assert (=> d!55279 (= res!88325 (bvslt #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(assert (=> d!55279 (= lt!92393 e!122920)))

(assert (=> d!55279 (= c!33499 (and (not (= (bvand (extraKeys!3544 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3544 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55279 (validMask!0 (mask!8938 thiss!1248))))

(assert (=> d!55279 (= (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)) lt!92389)))

(declare-fun b!186761 () Bool)

(declare-fun Unit!5628 () Unit!5621)

(assert (=> b!186761 (= e!122912 Unit!5628)))

(declare-fun bm!18828 () Bool)

(assert (=> bm!18828 (= call!18830 call!18826)))

(declare-fun bm!18829 () Bool)

(assert (=> bm!18829 (= call!18827 call!18828)))

(declare-fun b!186762 () Bool)

(declare-fun c!33498 () Bool)

(assert (=> b!186762 (= c!33498 (and (not (= (bvand (extraKeys!3544 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3544 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!186762 (= e!122910 e!122919)))

(assert (= (and d!55279 c!33499) b!186747))

(assert (= (and d!55279 (not c!33499)) b!186748))

(assert (= (and b!186748 c!33500) b!186755))

(assert (= (and b!186748 (not c!33500)) b!186762))

(assert (= (and b!186762 c!33498) b!186753))

(assert (= (and b!186762 (not c!33498)) b!186754))

(assert (= (or b!186753 b!186754) bm!18826))

(assert (= (or b!186755 bm!18826) bm!18828))

(assert (= (or b!186755 b!186753) bm!18829))

(assert (= (or b!186747 bm!18828) bm!18824))

(assert (= (or b!186747 bm!18829) bm!18825))

(assert (= (and d!55279 res!88325) b!186759))

(assert (= (and d!55279 c!33501) b!186744))

(assert (= (and d!55279 (not c!33501)) b!186761))

(assert (= (and d!55279 res!88331) b!186745))

(assert (= (and b!186745 res!88328) b!186750))

(assert (= (and b!186745 (not res!88333)) b!186760))

(assert (= (and b!186760 res!88329) b!186752))

(assert (= (and b!186745 res!88332) b!186756))

(assert (= (and b!186756 c!33503) b!186742))

(assert (= (and b!186756 (not c!33503)) b!186749))

(assert (= (and b!186742 res!88330) b!186746))

(assert (= (or b!186742 b!186749) bm!18823))

(assert (= (and b!186756 res!88327) b!186743))

(assert (= (and b!186743 c!33502) b!186757))

(assert (= (and b!186743 (not c!33502)) b!186751))

(assert (= (and b!186757 res!88326) b!186758))

(assert (= (or b!186757 b!186751) bm!18827))

(declare-fun b_lambda!7271 () Bool)

(assert (=> (not b_lambda!7271) (not b!186752)))

(declare-fun t!7267 () Bool)

(declare-fun tb!2849 () Bool)

(assert (=> (and b!186641 (= (defaultEntry!3807 thiss!1248) (defaultEntry!3807 thiss!1248)) t!7267) tb!2849))

(declare-fun result!4825 () Bool)

(assert (=> tb!2849 (= result!4825 tp_is_empty!4371)))

(assert (=> b!186752 t!7267))

(declare-fun b_and!11213 () Bool)

(assert (= b_and!11209 (and (=> t!7267 result!4825) b_and!11213)))

(declare-fun m!213645 () Bool)

(assert (=> b!186760 m!213645))

(assert (=> b!186760 m!213645))

(declare-fun m!213647 () Bool)

(assert (=> b!186760 m!213647))

(assert (=> b!186750 m!213645))

(assert (=> b!186750 m!213645))

(declare-fun m!213649 () Bool)

(assert (=> b!186750 m!213649))

(assert (=> b!186759 m!213645))

(assert (=> b!186759 m!213645))

(assert (=> b!186759 m!213649))

(declare-fun m!213651 () Bool)

(assert (=> bm!18827 m!213651))

(assert (=> b!186752 m!213645))

(declare-fun m!213653 () Bool)

(assert (=> b!186752 m!213653))

(declare-fun m!213655 () Bool)

(assert (=> b!186752 m!213655))

(assert (=> b!186752 m!213655))

(declare-fun m!213657 () Bool)

(assert (=> b!186752 m!213657))

(declare-fun m!213659 () Bool)

(assert (=> b!186752 m!213659))

(assert (=> b!186752 m!213645))

(assert (=> b!186752 m!213657))

(declare-fun m!213661 () Bool)

(assert (=> b!186758 m!213661))

(assert (=> d!55279 m!213591))

(declare-fun m!213663 () Bool)

(assert (=> bm!18825 m!213663))

(declare-fun m!213665 () Bool)

(assert (=> b!186747 m!213665))

(declare-fun m!213667 () Bool)

(assert (=> bm!18823 m!213667))

(declare-fun m!213669 () Bool)

(assert (=> b!186746 m!213669))

(declare-fun m!213671 () Bool)

(assert (=> bm!18824 m!213671))

(declare-fun m!213673 () Bool)

(assert (=> b!186744 m!213673))

(declare-fun m!213675 () Bool)

(assert (=> b!186744 m!213675))

(declare-fun m!213677 () Bool)

(assert (=> b!186744 m!213677))

(assert (=> b!186744 m!213671))

(declare-fun m!213679 () Bool)

(assert (=> b!186744 m!213679))

(declare-fun m!213681 () Bool)

(assert (=> b!186744 m!213681))

(declare-fun m!213683 () Bool)

(assert (=> b!186744 m!213683))

(declare-fun m!213685 () Bool)

(assert (=> b!186744 m!213685))

(declare-fun m!213687 () Bool)

(assert (=> b!186744 m!213687))

(declare-fun m!213689 () Bool)

(assert (=> b!186744 m!213689))

(assert (=> b!186744 m!213673))

(declare-fun m!213691 () Bool)

(assert (=> b!186744 m!213691))

(declare-fun m!213693 () Bool)

(assert (=> b!186744 m!213693))

(assert (=> b!186744 m!213679))

(assert (=> b!186744 m!213685))

(declare-fun m!213695 () Bool)

(assert (=> b!186744 m!213695))

(declare-fun m!213697 () Bool)

(assert (=> b!186744 m!213697))

(declare-fun m!213699 () Bool)

(assert (=> b!186744 m!213699))

(declare-fun m!213701 () Bool)

(assert (=> b!186744 m!213701))

(assert (=> b!186744 m!213645))

(assert (=> b!186744 m!213697))

(assert (=> b!186647 d!55279))

(declare-fun b!186781 () Bool)

(declare-fun e!122934 () Bool)

(declare-fun call!18837 () Bool)

(assert (=> b!186781 (= e!122934 (not call!18837))))

(declare-fun b!186782 () Bool)

(declare-fun e!122932 () Bool)

(assert (=> b!186782 (= e!122932 (not call!18837))))

(declare-fun c!33509 () Bool)

(declare-fun lt!92399 () SeekEntryResult!644)

(declare-fun bm!18834 () Bool)

(declare-fun call!18838 () Bool)

(assert (=> bm!18834 (= call!18838 (inRange!0 (ite c!33509 (index!4746 lt!92399) (index!4749 lt!92399)) (mask!8938 thiss!1248)))))

(declare-fun b!186783 () Bool)

(declare-fun res!88345 () Bool)

(assert (=> b!186783 (=> (not res!88345) (not e!122934))))

(assert (=> b!186783 (= res!88345 (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4749 lt!92399)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186783 (and (bvsge (index!4749 lt!92399) #b00000000000000000000000000000000) (bvslt (index!4749 lt!92399) (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun b!186784 () Bool)

(declare-fun res!88344 () Bool)

(assert (=> b!186784 (=> (not res!88344) (not e!122934))))

(assert (=> b!186784 (= res!88344 call!18838)))

(declare-fun e!122931 () Bool)

(assert (=> b!186784 (= e!122931 e!122934)))

(declare-fun b!186785 () Bool)

(assert (=> b!186785 (= e!122931 ((_ is Undefined!644) lt!92399))))

(declare-fun b!186786 () Bool)

(declare-fun e!122933 () Bool)

(assert (=> b!186786 (= e!122933 e!122932)))

(declare-fun res!88342 () Bool)

(assert (=> b!186786 (= res!88342 call!18838)))

(assert (=> b!186786 (=> (not res!88342) (not e!122932))))

(declare-fun d!55281 () Bool)

(assert (=> d!55281 e!122933))

(assert (=> d!55281 (= c!33509 ((_ is MissingZero!644) lt!92399))))

(assert (=> d!55281 (= lt!92399 (seekEntryOrOpen!0 key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(declare-fun lt!92398 () Unit!5621)

(declare-fun choose!990 (array!7955 array!7957 (_ BitVec 32) (_ BitVec 32) V!5475 V!5475 (_ BitVec 64) Int) Unit!5621)

(assert (=> d!55281 (= lt!92398 (choose!990 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) key!828 (defaultEntry!3807 thiss!1248)))))

(assert (=> d!55281 (validMask!0 (mask!8938 thiss!1248))))

(assert (=> d!55281 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!148 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) key!828 (defaultEntry!3807 thiss!1248)) lt!92398)))

(declare-fun b!186787 () Bool)

(assert (=> b!186787 (and (bvsge (index!4746 lt!92399) #b00000000000000000000000000000000) (bvslt (index!4746 lt!92399) (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun res!88343 () Bool)

(assert (=> b!186787 (= res!88343 (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4746 lt!92399)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186787 (=> (not res!88343) (not e!122932))))

(declare-fun bm!18835 () Bool)

(declare-fun arrayContainsKey!0 (array!7955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18835 (= call!18837 (arrayContainsKey!0 (_keys!5753 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!186788 () Bool)

(assert (=> b!186788 (= e!122933 e!122931)))

(declare-fun c!33508 () Bool)

(assert (=> b!186788 (= c!33508 ((_ is MissingVacant!644) lt!92399))))

(assert (= (and d!55281 c!33509) b!186786))

(assert (= (and d!55281 (not c!33509)) b!186788))

(assert (= (and b!186786 res!88342) b!186787))

(assert (= (and b!186787 res!88343) b!186782))

(assert (= (and b!186788 c!33508) b!186784))

(assert (= (and b!186788 (not c!33508)) b!186785))

(assert (= (and b!186784 res!88344) b!186783))

(assert (= (and b!186783 res!88345) b!186781))

(assert (= (or b!186786 b!186784) bm!18834))

(assert (= (or b!186782 b!186781) bm!18835))

(declare-fun m!213703 () Bool)

(assert (=> b!186787 m!213703))

(assert (=> d!55281 m!213585))

(declare-fun m!213705 () Bool)

(assert (=> d!55281 m!213705))

(assert (=> d!55281 m!213591))

(declare-fun m!213707 () Bool)

(assert (=> bm!18835 m!213707))

(declare-fun m!213709 () Bool)

(assert (=> b!186783 m!213709))

(declare-fun m!213711 () Bool)

(assert (=> bm!18834 m!213711))

(assert (=> b!186651 d!55281))

(declare-fun b!186801 () Bool)

(declare-fun e!122942 () SeekEntryResult!644)

(declare-fun lt!92407 () SeekEntryResult!644)

(assert (=> b!186801 (= e!122942 (MissingZero!644 (index!4748 lt!92407)))))

(declare-fun b!186802 () Bool)

(declare-fun e!122943 () SeekEntryResult!644)

(declare-fun e!122941 () SeekEntryResult!644)

(assert (=> b!186802 (= e!122943 e!122941)))

(declare-fun lt!92406 () (_ BitVec 64))

(assert (=> b!186802 (= lt!92406 (select (arr!3755 (_keys!5753 thiss!1248)) (index!4748 lt!92407)))))

(declare-fun c!33518 () Bool)

(assert (=> b!186802 (= c!33518 (= lt!92406 key!828))))

(declare-fun b!186803 () Bool)

(declare-fun c!33516 () Bool)

(assert (=> b!186803 (= c!33516 (= lt!92406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186803 (= e!122941 e!122942)))

(declare-fun b!186804 () Bool)

(assert (=> b!186804 (= e!122941 (Found!644 (index!4748 lt!92407)))))

(declare-fun b!186805 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7955 (_ BitVec 32)) SeekEntryResult!644)

(assert (=> b!186805 (= e!122942 (seekKeyOrZeroReturnVacant!0 (x!20234 lt!92407) (index!4748 lt!92407) (index!4748 lt!92407) key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(declare-fun b!186806 () Bool)

(assert (=> b!186806 (= e!122943 Undefined!644)))

(declare-fun d!55283 () Bool)

(declare-fun lt!92408 () SeekEntryResult!644)

(assert (=> d!55283 (and (or ((_ is Undefined!644) lt!92408) (not ((_ is Found!644) lt!92408)) (and (bvsge (index!4747 lt!92408) #b00000000000000000000000000000000) (bvslt (index!4747 lt!92408) (size!4072 (_keys!5753 thiss!1248))))) (or ((_ is Undefined!644) lt!92408) ((_ is Found!644) lt!92408) (not ((_ is MissingZero!644) lt!92408)) (and (bvsge (index!4746 lt!92408) #b00000000000000000000000000000000) (bvslt (index!4746 lt!92408) (size!4072 (_keys!5753 thiss!1248))))) (or ((_ is Undefined!644) lt!92408) ((_ is Found!644) lt!92408) ((_ is MissingZero!644) lt!92408) (not ((_ is MissingVacant!644) lt!92408)) (and (bvsge (index!4749 lt!92408) #b00000000000000000000000000000000) (bvslt (index!4749 lt!92408) (size!4072 (_keys!5753 thiss!1248))))) (or ((_ is Undefined!644) lt!92408) (ite ((_ is Found!644) lt!92408) (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4747 lt!92408)) key!828) (ite ((_ is MissingZero!644) lt!92408) (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4746 lt!92408)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!644) lt!92408) (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4749 lt!92408)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55283 (= lt!92408 e!122943)))

(declare-fun c!33517 () Bool)

(assert (=> d!55283 (= c!33517 (and ((_ is Intermediate!644) lt!92407) (undefined!1456 lt!92407)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7955 (_ BitVec 32)) SeekEntryResult!644)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55283 (= lt!92407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8938 thiss!1248)) key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(assert (=> d!55283 (validMask!0 (mask!8938 thiss!1248))))

(assert (=> d!55283 (= (seekEntryOrOpen!0 key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)) lt!92408)))

(assert (= (and d!55283 c!33517) b!186806))

(assert (= (and d!55283 (not c!33517)) b!186802))

(assert (= (and b!186802 c!33518) b!186804))

(assert (= (and b!186802 (not c!33518)) b!186803))

(assert (= (and b!186803 c!33516) b!186801))

(assert (= (and b!186803 (not c!33516)) b!186805))

(declare-fun m!213713 () Bool)

(assert (=> b!186802 m!213713))

(declare-fun m!213715 () Bool)

(assert (=> b!186805 m!213715))

(declare-fun m!213717 () Bool)

(assert (=> d!55283 m!213717))

(declare-fun m!213719 () Bool)

(assert (=> d!55283 m!213719))

(assert (=> d!55283 m!213591))

(assert (=> d!55283 m!213717))

(declare-fun m!213721 () Bool)

(assert (=> d!55283 m!213721))

(declare-fun m!213723 () Bool)

(assert (=> d!55283 m!213723))

(declare-fun m!213725 () Bool)

(assert (=> d!55283 m!213725))

(assert (=> b!186649 d!55283))

(declare-fun d!55285 () Bool)

(declare-fun res!88352 () Bool)

(declare-fun e!122946 () Bool)

(assert (=> d!55285 (=> (not res!88352) (not e!122946))))

(declare-fun simpleValid!185 (LongMapFixedSize!2592) Bool)

(assert (=> d!55285 (= res!88352 (simpleValid!185 thiss!1248))))

(assert (=> d!55285 (= (valid!1067 thiss!1248) e!122946)))

(declare-fun b!186813 () Bool)

(declare-fun res!88353 () Bool)

(assert (=> b!186813 (=> (not res!88353) (not e!122946))))

(declare-fun arrayCountValidKeys!0 (array!7955 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186813 (= res!88353 (= (arrayCountValidKeys!0 (_keys!5753 thiss!1248) #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))) (_size!1345 thiss!1248)))))

(declare-fun b!186814 () Bool)

(declare-fun res!88354 () Bool)

(assert (=> b!186814 (=> (not res!88354) (not e!122946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7955 (_ BitVec 32)) Bool)

(assert (=> b!186814 (= res!88354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(declare-fun b!186815 () Bool)

(declare-datatypes ((List!2378 0))(
  ( (Nil!2375) (Cons!2374 (h!3008 (_ BitVec 64)) (t!7268 List!2378)) )
))
(declare-fun arrayNoDuplicates!0 (array!7955 (_ BitVec 32) List!2378) Bool)

(assert (=> b!186815 (= e!122946 (arrayNoDuplicates!0 (_keys!5753 thiss!1248) #b00000000000000000000000000000000 Nil!2375))))

(assert (= (and d!55285 res!88352) b!186813))

(assert (= (and b!186813 res!88353) b!186814))

(assert (= (and b!186814 res!88354) b!186815))

(declare-fun m!213727 () Bool)

(assert (=> d!55285 m!213727))

(declare-fun m!213729 () Bool)

(assert (=> b!186813 m!213729))

(declare-fun m!213731 () Bool)

(assert (=> b!186814 m!213731))

(declare-fun m!213733 () Bool)

(assert (=> b!186815 m!213733))

(assert (=> start!18906 d!55285))

(declare-fun d!55287 () Bool)

(assert (=> d!55287 (= (array_inv!2427 (_keys!5753 thiss!1248)) (bvsge (size!4072 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186641 d!55287))

(declare-fun d!55289 () Bool)

(assert (=> d!55289 (= (array_inv!2428 (_values!3790 thiss!1248)) (bvsge (size!4073 (_values!3790 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186641 d!55289))

(declare-fun mapNonEmpty!7531 () Bool)

(declare-fun mapRes!7531 () Bool)

(declare-fun tp!16612 () Bool)

(declare-fun e!122951 () Bool)

(assert (=> mapNonEmpty!7531 (= mapRes!7531 (and tp!16612 e!122951))))

(declare-fun mapKey!7531 () (_ BitVec 32))

(declare-fun mapValue!7531 () ValueCell!1842)

(declare-fun mapRest!7531 () (Array (_ BitVec 32) ValueCell!1842))

(assert (=> mapNonEmpty!7531 (= mapRest!7525 (store mapRest!7531 mapKey!7531 mapValue!7531))))

(declare-fun condMapEmpty!7531 () Bool)

(declare-fun mapDefault!7531 () ValueCell!1842)

(assert (=> mapNonEmpty!7525 (= condMapEmpty!7531 (= mapRest!7525 ((as const (Array (_ BitVec 32) ValueCell!1842)) mapDefault!7531)))))

(declare-fun e!122952 () Bool)

(assert (=> mapNonEmpty!7525 (= tp!16602 (and e!122952 mapRes!7531))))

(declare-fun mapIsEmpty!7531 () Bool)

(assert (=> mapIsEmpty!7531 mapRes!7531))

(declare-fun b!186822 () Bool)

(assert (=> b!186822 (= e!122951 tp_is_empty!4371)))

(declare-fun b!186823 () Bool)

(assert (=> b!186823 (= e!122952 tp_is_empty!4371)))

(assert (= (and mapNonEmpty!7525 condMapEmpty!7531) mapIsEmpty!7531))

(assert (= (and mapNonEmpty!7525 (not condMapEmpty!7531)) mapNonEmpty!7531))

(assert (= (and mapNonEmpty!7531 ((_ is ValueCellFull!1842) mapValue!7531)) b!186822))

(assert (= (and mapNonEmpty!7525 ((_ is ValueCellFull!1842) mapDefault!7531)) b!186823))

(declare-fun m!213735 () Bool)

(assert (=> mapNonEmpty!7531 m!213735))

(declare-fun b_lambda!7273 () Bool)

(assert (= b_lambda!7271 (or (and b!186641 b_free!4599) b_lambda!7273)))

(check-sat (not b!186746) (not bm!18825) tp_is_empty!4371 (not b!186759) (not b!186760) (not b!186805) (not bm!18824) (not b!186813) (not b_next!4599) (not b!186697) (not b!186699) b_and!11213 (not b_lambda!7273) (not mapNonEmpty!7531) (not d!55283) (not d!55285) (not d!55279) (not bm!18823) (not b!186814) (not b!186689) (not b!186744) (not d!55281) (not bm!18827) (not d!55277) (not b!186752) (not bm!18835) (not b!186815) (not b!186758) (not bm!18834) (not d!55271) (not b!186750) (not b!186747))
(check-sat b_and!11213 (not b_next!4599))
(get-model)

(declare-fun b!186833 () Bool)

(declare-fun res!88363 () Bool)

(declare-fun e!122955 () Bool)

(assert (=> b!186833 (=> (not res!88363) (not e!122955))))

(declare-fun size!4076 (LongMapFixedSize!2592) (_ BitVec 32))

(assert (=> b!186833 (= res!88363 (bvsge (size!4076 thiss!1248) (_size!1345 thiss!1248)))))

(declare-fun d!55291 () Bool)

(declare-fun res!88366 () Bool)

(assert (=> d!55291 (=> (not res!88366) (not e!122955))))

(assert (=> d!55291 (= res!88366 (validMask!0 (mask!8938 thiss!1248)))))

(assert (=> d!55291 (= (simpleValid!185 thiss!1248) e!122955)))

(declare-fun b!186835 () Bool)

(assert (=> b!186835 (= e!122955 (and (bvsge (extraKeys!3544 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3544 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1345 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!186832 () Bool)

(declare-fun res!88365 () Bool)

(assert (=> b!186832 (=> (not res!88365) (not e!122955))))

(assert (=> b!186832 (= res!88365 (and (= (size!4073 (_values!3790 thiss!1248)) (bvadd (mask!8938 thiss!1248) #b00000000000000000000000000000001)) (= (size!4072 (_keys!5753 thiss!1248)) (size!4073 (_values!3790 thiss!1248))) (bvsge (_size!1345 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1345 thiss!1248) (bvadd (mask!8938 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!186834 () Bool)

(declare-fun res!88364 () Bool)

(assert (=> b!186834 (=> (not res!88364) (not e!122955))))

(assert (=> b!186834 (= res!88364 (= (size!4076 thiss!1248) (bvadd (_size!1345 thiss!1248) (bvsdiv (bvadd (extraKeys!3544 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!55291 res!88366) b!186832))

(assert (= (and b!186832 res!88365) b!186833))

(assert (= (and b!186833 res!88363) b!186834))

(assert (= (and b!186834 res!88364) b!186835))

(declare-fun m!213737 () Bool)

(assert (=> b!186833 m!213737))

(assert (=> d!55291 m!213591))

(assert (=> b!186834 m!213737))

(assert (=> d!55285 d!55291))

(declare-fun d!55293 () Bool)

(declare-fun lt!92411 () (_ BitVec 32))

(assert (=> d!55293 (and (bvsge lt!92411 #b00000000000000000000000000000000) (bvsle lt!92411 (bvsub (size!4072 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!122961 () (_ BitVec 32))

(assert (=> d!55293 (= lt!92411 e!122961)))

(declare-fun c!33523 () Bool)

(assert (=> d!55293 (= c!33523 (bvsge #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(assert (=> d!55293 (and (bvsle #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4072 (_keys!5753 thiss!1248)) (size!4072 (_keys!5753 thiss!1248))))))

(assert (=> d!55293 (= (arrayCountValidKeys!0 (_keys!5753 thiss!1248) #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))) lt!92411)))

(declare-fun b!186844 () Bool)

(assert (=> b!186844 (= e!122961 #b00000000000000000000000000000000)))

(declare-fun bm!18838 () Bool)

(declare-fun call!18841 () (_ BitVec 32))

(assert (=> bm!18838 (= call!18841 (arrayCountValidKeys!0 (_keys!5753 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun b!186845 () Bool)

(declare-fun e!122960 () (_ BitVec 32))

(assert (=> b!186845 (= e!122961 e!122960)))

(declare-fun c!33524 () Bool)

(assert (=> b!186845 (= c!33524 (validKeyInArray!0 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186846 () Bool)

(assert (=> b!186846 (= e!122960 call!18841)))

(declare-fun b!186847 () Bool)

(assert (=> b!186847 (= e!122960 (bvadd #b00000000000000000000000000000001 call!18841))))

(assert (= (and d!55293 c!33523) b!186844))

(assert (= (and d!55293 (not c!33523)) b!186845))

(assert (= (and b!186845 c!33524) b!186847))

(assert (= (and b!186845 (not c!33524)) b!186846))

(assert (= (or b!186847 b!186846) bm!18838))

(declare-fun m!213739 () Bool)

(assert (=> bm!18838 m!213739))

(assert (=> b!186845 m!213645))

(assert (=> b!186845 m!213645))

(assert (=> b!186845 m!213649))

(assert (=> b!186813 d!55293))

(declare-fun d!55295 () Bool)

(declare-fun e!122964 () Bool)

(assert (=> d!55295 e!122964))

(declare-fun res!88372 () Bool)

(assert (=> d!55295 (=> (not res!88372) (not e!122964))))

(declare-fun lt!92420 () ListLongMap!2387)

(assert (=> d!55295 (= res!88372 (contains!1307 lt!92420 (_1!1746 (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))))))))

(declare-fun lt!92422 () List!2376)

(assert (=> d!55295 (= lt!92420 (ListLongMap!2388 lt!92422))))

(declare-fun lt!92423 () Unit!5621)

(declare-fun lt!92421 () Unit!5621)

(assert (=> d!55295 (= lt!92423 lt!92421)))

(assert (=> d!55295 (= (getValueByKey!226 lt!92422 (_1!1746 (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))))) (Some!231 (_2!1746 (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!118 (List!2376 (_ BitVec 64) V!5475) Unit!5621)

(assert (=> d!55295 (= lt!92421 (lemmaContainsTupThenGetReturnValue!118 lt!92422 (_1!1746 (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))) (_2!1746 (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))))))))

(declare-fun insertStrictlySorted!121 (List!2376 (_ BitVec 64) V!5475) List!2376)

(assert (=> d!55295 (= lt!92422 (insertStrictlySorted!121 (toList!1209 (ite c!33499 call!18826 (ite c!33500 call!18830 call!18832))) (_1!1746 (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))) (_2!1746 (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))))))))

(assert (=> d!55295 (= (+!289 (ite c!33499 call!18826 (ite c!33500 call!18830 call!18832)) (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))) lt!92420)))

(declare-fun b!186852 () Bool)

(declare-fun res!88371 () Bool)

(assert (=> b!186852 (=> (not res!88371) (not e!122964))))

(assert (=> b!186852 (= res!88371 (= (getValueByKey!226 (toList!1209 lt!92420) (_1!1746 (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))))) (Some!231 (_2!1746 (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))))))))

(declare-fun b!186853 () Bool)

(declare-fun contains!1309 (List!2376 tuple2!3470) Bool)

(assert (=> b!186853 (= e!122964 (contains!1309 (toList!1209 lt!92420) (ite (or c!33499 c!33500) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3648 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))))))

(assert (= (and d!55295 res!88372) b!186852))

(assert (= (and b!186852 res!88371) b!186853))

(declare-fun m!213741 () Bool)

(assert (=> d!55295 m!213741))

(declare-fun m!213743 () Bool)

(assert (=> d!55295 m!213743))

(declare-fun m!213745 () Bool)

(assert (=> d!55295 m!213745))

(declare-fun m!213747 () Bool)

(assert (=> d!55295 m!213747))

(declare-fun m!213749 () Bool)

(assert (=> b!186852 m!213749))

(declare-fun m!213751 () Bool)

(assert (=> b!186853 m!213751))

(assert (=> bm!18825 d!55295))

(declare-fun d!55297 () Bool)

(declare-fun e!122965 () Bool)

(assert (=> d!55297 e!122965))

(declare-fun res!88374 () Bool)

(assert (=> d!55297 (=> (not res!88374) (not e!122965))))

(declare-fun lt!92424 () ListLongMap!2387)

(assert (=> d!55297 (= res!88374 (contains!1307 lt!92424 (_1!1746 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))))))

(declare-fun lt!92426 () List!2376)

(assert (=> d!55297 (= lt!92424 (ListLongMap!2388 lt!92426))))

(declare-fun lt!92427 () Unit!5621)

(declare-fun lt!92425 () Unit!5621)

(assert (=> d!55297 (= lt!92427 lt!92425)))

(assert (=> d!55297 (= (getValueByKey!226 lt!92426 (_1!1746 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))) (Some!231 (_2!1746 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))))))

(assert (=> d!55297 (= lt!92425 (lemmaContainsTupThenGetReturnValue!118 lt!92426 (_1!1746 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))) (_2!1746 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))))))

(assert (=> d!55297 (= lt!92426 (insertStrictlySorted!121 (toList!1209 call!18828) (_1!1746 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))) (_2!1746 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))))))

(assert (=> d!55297 (= (+!289 call!18828 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))) lt!92424)))

(declare-fun b!186854 () Bool)

(declare-fun res!88373 () Bool)

(assert (=> b!186854 (=> (not res!88373) (not e!122965))))

(assert (=> b!186854 (= res!88373 (= (getValueByKey!226 (toList!1209 lt!92424) (_1!1746 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248)))) (Some!231 (_2!1746 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))))))))

(declare-fun b!186855 () Bool)

(assert (=> b!186855 (= e!122965 (contains!1309 (toList!1209 lt!92424) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3648 thiss!1248))))))

(assert (= (and d!55297 res!88374) b!186854))

(assert (= (and b!186854 res!88373) b!186855))

(declare-fun m!213753 () Bool)

(assert (=> d!55297 m!213753))

(declare-fun m!213755 () Bool)

(assert (=> d!55297 m!213755))

(declare-fun m!213757 () Bool)

(assert (=> d!55297 m!213757))

(declare-fun m!213759 () Bool)

(assert (=> d!55297 m!213759))

(declare-fun m!213761 () Bool)

(assert (=> b!186854 m!213761))

(declare-fun m!213763 () Bool)

(assert (=> b!186855 m!213763))

(assert (=> b!186747 d!55297))

(declare-fun d!55299 () Bool)

(assert (=> d!55299 (= (inRange!0 (ite c!33509 (index!4746 lt!92399) (index!4749 lt!92399)) (mask!8938 thiss!1248)) (and (bvsge (ite c!33509 (index!4746 lt!92399) (index!4749 lt!92399)) #b00000000000000000000000000000000) (bvslt (ite c!33509 (index!4746 lt!92399) (index!4749 lt!92399)) (bvadd (mask!8938 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18834 d!55299))

(declare-fun d!55301 () Bool)

(declare-fun isEmpty!473 (Option!232) Bool)

(assert (=> d!55301 (= (isDefined!179 (getValueByKey!226 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828)) (not (isEmpty!473 (getValueByKey!226 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828))))))

(declare-fun bs!7545 () Bool)

(assert (= bs!7545 d!55301))

(assert (=> bs!7545 m!213641))

(declare-fun m!213765 () Bool)

(assert (=> bs!7545 m!213765))

(assert (=> b!186699 d!55301))

(declare-fun b!186865 () Bool)

(declare-fun e!122970 () Option!232)

(declare-fun e!122971 () Option!232)

(assert (=> b!186865 (= e!122970 e!122971)))

(declare-fun c!33530 () Bool)

(assert (=> b!186865 (= c!33530 (and ((_ is Cons!2372) (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))) (not (= (_1!1746 (h!3006 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))))) key!828))))))

(declare-fun d!55303 () Bool)

(declare-fun c!33529 () Bool)

(assert (=> d!55303 (= c!33529 (and ((_ is Cons!2372) (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))) (= (_1!1746 (h!3006 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))))) key!828)))))

(assert (=> d!55303 (= (getValueByKey!226 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828) e!122970)))

(declare-fun b!186866 () Bool)

(assert (=> b!186866 (= e!122971 (getValueByKey!226 (t!7264 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))) key!828))))

(declare-fun b!186864 () Bool)

(assert (=> b!186864 (= e!122970 (Some!231 (_2!1746 (h!3006 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))))))))

(declare-fun b!186867 () Bool)

(assert (=> b!186867 (= e!122971 None!230)))

(assert (= (and d!55303 c!33529) b!186864))

(assert (= (and d!55303 (not c!33529)) b!186865))

(assert (= (and b!186865 c!33530) b!186866))

(assert (= (and b!186865 (not c!33530)) b!186867))

(declare-fun m!213767 () Bool)

(assert (=> b!186866 m!213767))

(assert (=> b!186699 d!55303))

(declare-fun d!55305 () Bool)

(declare-fun get!2158 (Option!232) V!5475)

(assert (=> d!55305 (= (apply!169 lt!92389 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2158 (getValueByKey!226 (toList!1209 lt!92389) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7546 () Bool)

(assert (= bs!7546 d!55305))

(declare-fun m!213769 () Bool)

(assert (=> bs!7546 m!213769))

(assert (=> bs!7546 m!213769))

(declare-fun m!213771 () Bool)

(assert (=> bs!7546 m!213771))

(assert (=> b!186746 d!55305))

(declare-fun d!55307 () Bool)

(assert (=> d!55307 (isDefined!179 (getValueByKey!226 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828))))

(declare-fun lt!92430 () Unit!5621)

(declare-fun choose!991 (List!2376 (_ BitVec 64)) Unit!5621)

(assert (=> d!55307 (= lt!92430 (choose!991 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828))))

(declare-fun e!122974 () Bool)

(assert (=> d!55307 e!122974))

(declare-fun res!88377 () Bool)

(assert (=> d!55307 (=> (not res!88377) (not e!122974))))

(declare-fun isStrictlySorted!350 (List!2376) Bool)

(assert (=> d!55307 (= res!88377 (isStrictlySorted!350 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))))))

(assert (=> d!55307 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828) lt!92430)))

(declare-fun b!186870 () Bool)

(assert (=> b!186870 (= e!122974 (containsKey!230 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828))))

(assert (= (and d!55307 res!88377) b!186870))

(assert (=> d!55307 m!213641))

(assert (=> d!55307 m!213641))

(assert (=> d!55307 m!213643))

(declare-fun m!213773 () Bool)

(assert (=> d!55307 m!213773))

(declare-fun m!213775 () Bool)

(assert (=> d!55307 m!213775))

(assert (=> b!186870 m!213637))

(assert (=> b!186697 d!55307))

(assert (=> b!186697 d!55301))

(assert (=> b!186697 d!55303))

(assert (=> d!55271 d!55283))

(declare-fun d!55309 () Bool)

(declare-fun e!122977 () Bool)

(assert (=> d!55309 e!122977))

(declare-fun res!88383 () Bool)

(assert (=> d!55309 (=> (not res!88383) (not e!122977))))

(declare-fun lt!92433 () SeekEntryResult!644)

(assert (=> d!55309 (= res!88383 ((_ is Found!644) lt!92433))))

(assert (=> d!55309 (= lt!92433 (seekEntryOrOpen!0 key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(assert (=> d!55309 true))

(declare-fun _$33!129 () Unit!5621)

(assert (=> d!55309 (= (choose!989 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) key!828 (defaultEntry!3807 thiss!1248)) _$33!129)))

(declare-fun b!186875 () Bool)

(declare-fun res!88382 () Bool)

(assert (=> b!186875 (=> (not res!88382) (not e!122977))))

(assert (=> b!186875 (= res!88382 (inRange!0 (index!4747 lt!92433) (mask!8938 thiss!1248)))))

(declare-fun b!186876 () Bool)

(assert (=> b!186876 (= e!122977 (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4747 lt!92433)) key!828))))

(assert (= (and d!55309 res!88383) b!186875))

(assert (= (and b!186875 res!88382) b!186876))

(assert (=> d!55309 m!213585))

(declare-fun m!213777 () Bool)

(assert (=> b!186875 m!213777))

(declare-fun m!213779 () Bool)

(assert (=> b!186876 m!213779))

(assert (=> d!55271 d!55309))

(assert (=> d!55271 d!55275))

(declare-fun d!55311 () Bool)

(assert (=> d!55311 (= (inRange!0 (index!4747 lt!92315) (mask!8938 thiss!1248)) (and (bvsge (index!4747 lt!92315) #b00000000000000000000000000000000) (bvslt (index!4747 lt!92315) (bvadd (mask!8938 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186689 d!55311))

(declare-fun d!55313 () Bool)

(declare-fun res!88388 () Bool)

(declare-fun e!122982 () Bool)

(assert (=> d!55313 (=> res!88388 e!122982)))

(assert (=> d!55313 (= res!88388 (and ((_ is Cons!2372) (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))) (= (_1!1746 (h!3006 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))))) key!828)))))

(assert (=> d!55313 (= (containsKey!230 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))) key!828) e!122982)))

(declare-fun b!186881 () Bool)

(declare-fun e!122983 () Bool)

(assert (=> b!186881 (= e!122982 e!122983)))

(declare-fun res!88389 () Bool)

(assert (=> b!186881 (=> (not res!88389) (not e!122983))))

(assert (=> b!186881 (= res!88389 (and (or (not ((_ is Cons!2372) (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))))) (bvsle (_1!1746 (h!3006 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))))) key!828)) ((_ is Cons!2372) (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))) (bvslt (_1!1746 (h!3006 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248))))) key!828)))))

(declare-fun b!186882 () Bool)

(assert (=> b!186882 (= e!122983 (containsKey!230 (t!7264 (toList!1209 (getCurrentListMap!857 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)))) key!828))))

(assert (= (and d!55313 (not res!88388)) b!186881))

(assert (= (and b!186881 res!88389) b!186882))

(declare-fun m!213781 () Bool)

(assert (=> b!186882 m!213781))

(assert (=> d!55277 d!55313))

(declare-fun b!186895 () Bool)

(declare-fun e!122991 () SeekEntryResult!644)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186895 (= e!122991 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20234 lt!92407) #b00000000000000000000000000000001) (nextIndex!0 (index!4748 lt!92407) (x!20234 lt!92407) (mask!8938 thiss!1248)) (index!4748 lt!92407) key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(declare-fun lt!92438 () SeekEntryResult!644)

(declare-fun d!55315 () Bool)

(assert (=> d!55315 (and (or ((_ is Undefined!644) lt!92438) (not ((_ is Found!644) lt!92438)) (and (bvsge (index!4747 lt!92438) #b00000000000000000000000000000000) (bvslt (index!4747 lt!92438) (size!4072 (_keys!5753 thiss!1248))))) (or ((_ is Undefined!644) lt!92438) ((_ is Found!644) lt!92438) (not ((_ is MissingVacant!644) lt!92438)) (not (= (index!4749 lt!92438) (index!4748 lt!92407))) (and (bvsge (index!4749 lt!92438) #b00000000000000000000000000000000) (bvslt (index!4749 lt!92438) (size!4072 (_keys!5753 thiss!1248))))) (or ((_ is Undefined!644) lt!92438) (ite ((_ is Found!644) lt!92438) (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4747 lt!92438)) key!828) (and ((_ is MissingVacant!644) lt!92438) (= (index!4749 lt!92438) (index!4748 lt!92407)) (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4749 lt!92438)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!122990 () SeekEntryResult!644)

(assert (=> d!55315 (= lt!92438 e!122990)))

(declare-fun c!33539 () Bool)

(assert (=> d!55315 (= c!33539 (bvsge (x!20234 lt!92407) #b01111111111111111111111111111110))))

(declare-fun lt!92439 () (_ BitVec 64))

(assert (=> d!55315 (= lt!92439 (select (arr!3755 (_keys!5753 thiss!1248)) (index!4748 lt!92407)))))

(assert (=> d!55315 (validMask!0 (mask!8938 thiss!1248))))

(assert (=> d!55315 (= (seekKeyOrZeroReturnVacant!0 (x!20234 lt!92407) (index!4748 lt!92407) (index!4748 lt!92407) key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)) lt!92438)))

(declare-fun b!186896 () Bool)

(declare-fun e!122992 () SeekEntryResult!644)

(assert (=> b!186896 (= e!122990 e!122992)))

(declare-fun c!33538 () Bool)

(assert (=> b!186896 (= c!33538 (= lt!92439 key!828))))

(declare-fun b!186897 () Bool)

(declare-fun c!33537 () Bool)

(assert (=> b!186897 (= c!33537 (= lt!92439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186897 (= e!122992 e!122991)))

(declare-fun b!186898 () Bool)

(assert (=> b!186898 (= e!122990 Undefined!644)))

(declare-fun b!186899 () Bool)

(assert (=> b!186899 (= e!122991 (MissingVacant!644 (index!4748 lt!92407)))))

(declare-fun b!186900 () Bool)

(assert (=> b!186900 (= e!122992 (Found!644 (index!4748 lt!92407)))))

(assert (= (and d!55315 c!33539) b!186898))

(assert (= (and d!55315 (not c!33539)) b!186896))

(assert (= (and b!186896 c!33538) b!186900))

(assert (= (and b!186896 (not c!33538)) b!186897))

(assert (= (and b!186897 c!33537) b!186899))

(assert (= (and b!186897 (not c!33537)) b!186895))

(declare-fun m!213783 () Bool)

(assert (=> b!186895 m!213783))

(assert (=> b!186895 m!213783))

(declare-fun m!213785 () Bool)

(assert (=> b!186895 m!213785))

(declare-fun m!213787 () Bool)

(assert (=> d!55315 m!213787))

(declare-fun m!213789 () Bool)

(assert (=> d!55315 m!213789))

(assert (=> d!55315 m!213713))

(assert (=> d!55315 m!213591))

(assert (=> b!186805 d!55315))

(declare-fun b!186911 () Bool)

(declare-fun e!123003 () Bool)

(declare-fun e!123001 () Bool)

(assert (=> b!186911 (= e!123003 e!123001)))

(declare-fun res!88397 () Bool)

(assert (=> b!186911 (=> (not res!88397) (not e!123001))))

(declare-fun e!123002 () Bool)

(assert (=> b!186911 (= res!88397 (not e!123002))))

(declare-fun res!88396 () Bool)

(assert (=> b!186911 (=> (not res!88396) (not e!123002))))

(assert (=> b!186911 (= res!88396 (validKeyInArray!0 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18841 () Bool)

(declare-fun call!18844 () Bool)

(declare-fun c!33542 () Bool)

(assert (=> bm!18841 (= call!18844 (arrayNoDuplicates!0 (_keys!5753 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33542 (Cons!2374 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000) Nil!2375) Nil!2375)))))

(declare-fun b!186912 () Bool)

(declare-fun e!123004 () Bool)

(assert (=> b!186912 (= e!123004 call!18844)))

(declare-fun b!186913 () Bool)

(assert (=> b!186913 (= e!123001 e!123004)))

(assert (=> b!186913 (= c!33542 (validKeyInArray!0 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55317 () Bool)

(declare-fun res!88398 () Bool)

(assert (=> d!55317 (=> res!88398 e!123003)))

(assert (=> d!55317 (= res!88398 (bvsge #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(assert (=> d!55317 (= (arrayNoDuplicates!0 (_keys!5753 thiss!1248) #b00000000000000000000000000000000 Nil!2375) e!123003)))

(declare-fun b!186914 () Bool)

(declare-fun contains!1310 (List!2378 (_ BitVec 64)) Bool)

(assert (=> b!186914 (= e!123002 (contains!1310 Nil!2375 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186915 () Bool)

(assert (=> b!186915 (= e!123004 call!18844)))

(assert (= (and d!55317 (not res!88398)) b!186911))

(assert (= (and b!186911 res!88396) b!186914))

(assert (= (and b!186911 res!88397) b!186913))

(assert (= (and b!186913 c!33542) b!186912))

(assert (= (and b!186913 (not c!33542)) b!186915))

(assert (= (or b!186912 b!186915) bm!18841))

(assert (=> b!186911 m!213645))

(assert (=> b!186911 m!213645))

(assert (=> b!186911 m!213649))

(assert (=> bm!18841 m!213645))

(declare-fun m!213791 () Bool)

(assert (=> bm!18841 m!213791))

(assert (=> b!186913 m!213645))

(assert (=> b!186913 m!213645))

(assert (=> b!186913 m!213649))

(assert (=> b!186914 m!213645))

(assert (=> b!186914 m!213645))

(declare-fun m!213793 () Bool)

(assert (=> b!186914 m!213793))

(assert (=> b!186815 d!55317))

(declare-fun d!55319 () Bool)

(assert (=> d!55319 (= (apply!169 lt!92389 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)) (get!2158 (getValueByKey!226 (toList!1209 lt!92389) (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7547 () Bool)

(assert (= bs!7547 d!55319))

(assert (=> bs!7547 m!213645))

(declare-fun m!213795 () Bool)

(assert (=> bs!7547 m!213795))

(assert (=> bs!7547 m!213795))

(declare-fun m!213797 () Bool)

(assert (=> bs!7547 m!213797))

(assert (=> b!186752 d!55319))

(declare-fun d!55321 () Bool)

(declare-fun c!33545 () Bool)

(assert (=> d!55321 (= c!33545 ((_ is ValueCellFull!1842) (select (arr!3756 (_values!3790 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!123007 () V!5475)

(assert (=> d!55321 (= (get!2157 (select (arr!3756 (_values!3790 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3807 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!123007)))

(declare-fun b!186920 () Bool)

(declare-fun get!2159 (ValueCell!1842 V!5475) V!5475)

(assert (=> b!186920 (= e!123007 (get!2159 (select (arr!3756 (_values!3790 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3807 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186921 () Bool)

(declare-fun get!2160 (ValueCell!1842 V!5475) V!5475)

(assert (=> b!186921 (= e!123007 (get!2160 (select (arr!3756 (_values!3790 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3807 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55321 c!33545) b!186920))

(assert (= (and d!55321 (not c!33545)) b!186921))

(assert (=> b!186920 m!213655))

(assert (=> b!186920 m!213657))

(declare-fun m!213799 () Bool)

(assert (=> b!186920 m!213799))

(assert (=> b!186921 m!213655))

(assert (=> b!186921 m!213657))

(declare-fun m!213801 () Bool)

(assert (=> b!186921 m!213801))

(assert (=> b!186752 d!55321))

(declare-fun d!55323 () Bool)

(declare-fun res!88403 () Bool)

(declare-fun e!123012 () Bool)

(assert (=> d!55323 (=> res!88403 e!123012)))

(assert (=> d!55323 (= res!88403 (= (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55323 (= (arrayContainsKey!0 (_keys!5753 thiss!1248) key!828 #b00000000000000000000000000000000) e!123012)))

(declare-fun b!186926 () Bool)

(declare-fun e!123013 () Bool)

(assert (=> b!186926 (= e!123012 e!123013)))

(declare-fun res!88404 () Bool)

(assert (=> b!186926 (=> (not res!88404) (not e!123013))))

(assert (=> b!186926 (= res!88404 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun b!186927 () Bool)

(assert (=> b!186927 (= e!123013 (arrayContainsKey!0 (_keys!5753 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55323 (not res!88403)) b!186926))

(assert (= (and b!186926 res!88404) b!186927))

(assert (=> d!55323 m!213645))

(declare-fun m!213803 () Bool)

(assert (=> b!186927 m!213803))

(assert (=> bm!18835 d!55323))

(declare-fun d!55325 () Bool)

(assert (=> d!55325 (= (validKeyInArray!0 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186750 d!55325))

(declare-fun b!186936 () Bool)

(declare-fun e!123022 () Bool)

(declare-fun e!123020 () Bool)

(assert (=> b!186936 (= e!123022 e!123020)))

(declare-fun lt!92446 () (_ BitVec 64))

(assert (=> b!186936 (= lt!92446 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92448 () Unit!5621)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7955 (_ BitVec 64) (_ BitVec 32)) Unit!5621)

(assert (=> b!186936 (= lt!92448 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5753 thiss!1248) lt!92446 #b00000000000000000000000000000000))))

(assert (=> b!186936 (arrayContainsKey!0 (_keys!5753 thiss!1248) lt!92446 #b00000000000000000000000000000000)))

(declare-fun lt!92447 () Unit!5621)

(assert (=> b!186936 (= lt!92447 lt!92448)))

(declare-fun res!88409 () Bool)

(assert (=> b!186936 (= res!88409 (= (seekEntryOrOpen!0 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000) (_keys!5753 thiss!1248) (mask!8938 thiss!1248)) (Found!644 #b00000000000000000000000000000000)))))

(assert (=> b!186936 (=> (not res!88409) (not e!123020))))

(declare-fun b!186937 () Bool)

(declare-fun call!18847 () Bool)

(assert (=> b!186937 (= e!123020 call!18847)))

(declare-fun d!55327 () Bool)

(declare-fun res!88410 () Bool)

(declare-fun e!123021 () Bool)

(assert (=> d!55327 (=> res!88410 e!123021)))

(assert (=> d!55327 (= res!88410 (bvsge #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(assert (=> d!55327 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)) e!123021)))

(declare-fun bm!18844 () Bool)

(assert (=> bm!18844 (= call!18847 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(declare-fun b!186938 () Bool)

(assert (=> b!186938 (= e!123022 call!18847)))

(declare-fun b!186939 () Bool)

(assert (=> b!186939 (= e!123021 e!123022)))

(declare-fun c!33548 () Bool)

(assert (=> b!186939 (= c!33548 (validKeyInArray!0 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55327 (not res!88410)) b!186939))

(assert (= (and b!186939 c!33548) b!186936))

(assert (= (and b!186939 (not c!33548)) b!186938))

(assert (= (and b!186936 res!88409) b!186937))

(assert (= (or b!186937 b!186938) bm!18844))

(assert (=> b!186936 m!213645))

(declare-fun m!213805 () Bool)

(assert (=> b!186936 m!213805))

(declare-fun m!213807 () Bool)

(assert (=> b!186936 m!213807))

(assert (=> b!186936 m!213645))

(declare-fun m!213809 () Bool)

(assert (=> b!186936 m!213809))

(declare-fun m!213811 () Bool)

(assert (=> bm!18844 m!213811))

(assert (=> b!186939 m!213645))

(assert (=> b!186939 m!213645))

(assert (=> b!186939 m!213649))

(assert (=> b!186814 d!55327))

(declare-fun d!55329 () Bool)

(assert (=> d!55329 (= (apply!169 lt!92389 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2158 (getValueByKey!226 (toList!1209 lt!92389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7548 () Bool)

(assert (= bs!7548 d!55329))

(declare-fun m!213813 () Bool)

(assert (=> bs!7548 m!213813))

(assert (=> bs!7548 m!213813))

(declare-fun m!213815 () Bool)

(assert (=> bs!7548 m!213815))

(assert (=> b!186758 d!55329))

(assert (=> d!55279 d!55275))

(assert (=> d!55281 d!55283))

(declare-fun b!186957 () Bool)

(declare-fun e!123032 () Bool)

(declare-fun e!123031 () Bool)

(assert (=> b!186957 (= e!123032 e!123031)))

(declare-fun c!33553 () Bool)

(declare-fun lt!92451 () SeekEntryResult!644)

(assert (=> b!186957 (= c!33553 ((_ is MissingVacant!644) lt!92451))))

(declare-fun b!186958 () Bool)

(declare-fun res!88422 () Bool)

(declare-fun e!123034 () Bool)

(assert (=> b!186958 (=> (not res!88422) (not e!123034))))

(declare-fun call!18852 () Bool)

(assert (=> b!186958 (= res!88422 call!18852)))

(assert (=> b!186958 (= e!123031 e!123034)))

(declare-fun c!33554 () Bool)

(declare-fun bm!18849 () Bool)

(assert (=> bm!18849 (= call!18852 (inRange!0 (ite c!33554 (index!4746 lt!92451) (index!4749 lt!92451)) (mask!8938 thiss!1248)))))

(declare-fun b!186959 () Bool)

(declare-fun res!88419 () Bool)

(assert (=> b!186959 (= res!88419 (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4746 lt!92451)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123033 () Bool)

(assert (=> b!186959 (=> (not res!88419) (not e!123033))))

(declare-fun b!186960 () Bool)

(declare-fun call!18853 () Bool)

(assert (=> b!186960 (= e!123034 (not call!18853))))

(declare-fun d!55331 () Bool)

(assert (=> d!55331 e!123032))

(assert (=> d!55331 (= c!33554 ((_ is MissingZero!644) lt!92451))))

(assert (=> d!55331 (= lt!92451 (seekEntryOrOpen!0 key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(assert (=> d!55331 true))

(declare-fun _$34!1066 () Unit!5621)

(assert (=> d!55331 (= (choose!990 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) key!828 (defaultEntry!3807 thiss!1248)) _$34!1066)))

(declare-fun b!186956 () Bool)

(assert (=> b!186956 (= e!123033 (not call!18853))))

(declare-fun b!186961 () Bool)

(assert (=> b!186961 (= e!123032 e!123033)))

(declare-fun res!88420 () Bool)

(assert (=> b!186961 (= res!88420 call!18852)))

(assert (=> b!186961 (=> (not res!88420) (not e!123033))))

(declare-fun b!186962 () Bool)

(declare-fun res!88421 () Bool)

(assert (=> b!186962 (=> (not res!88421) (not e!123034))))

(assert (=> b!186962 (= res!88421 (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4749 lt!92451)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186963 () Bool)

(assert (=> b!186963 (= e!123031 ((_ is Undefined!644) lt!92451))))

(declare-fun bm!18850 () Bool)

(assert (=> bm!18850 (= call!18853 (arrayContainsKey!0 (_keys!5753 thiss!1248) key!828 #b00000000000000000000000000000000))))

(assert (= (and d!55331 c!33554) b!186961))

(assert (= (and d!55331 (not c!33554)) b!186957))

(assert (= (and b!186961 res!88420) b!186959))

(assert (= (and b!186959 res!88419) b!186956))

(assert (= (and b!186957 c!33553) b!186958))

(assert (= (and b!186957 (not c!33553)) b!186963))

(assert (= (and b!186958 res!88422) b!186962))

(assert (= (and b!186962 res!88421) b!186960))

(assert (= (or b!186961 b!186958) bm!18849))

(assert (= (or b!186956 b!186960) bm!18850))

(declare-fun m!213817 () Bool)

(assert (=> b!186959 m!213817))

(declare-fun m!213819 () Bool)

(assert (=> bm!18849 m!213819))

(assert (=> d!55331 m!213585))

(assert (=> bm!18850 m!213707))

(declare-fun m!213821 () Bool)

(assert (=> b!186962 m!213821))

(assert (=> d!55281 d!55331))

(assert (=> d!55281 d!55275))

(declare-fun d!55333 () Bool)

(declare-fun e!123036 () Bool)

(assert (=> d!55333 e!123036))

(declare-fun res!88423 () Bool)

(assert (=> d!55333 (=> res!88423 e!123036)))

(declare-fun lt!92455 () Bool)

(assert (=> d!55333 (= res!88423 (not lt!92455))))

(declare-fun lt!92453 () Bool)

(assert (=> d!55333 (= lt!92455 lt!92453)))

(declare-fun lt!92454 () Unit!5621)

(declare-fun e!123035 () Unit!5621)

(assert (=> d!55333 (= lt!92454 e!123035)))

(declare-fun c!33555 () Bool)

(assert (=> d!55333 (= c!33555 lt!92453)))

(assert (=> d!55333 (= lt!92453 (containsKey!230 (toList!1209 lt!92389) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55333 (= (contains!1307 lt!92389 #b1000000000000000000000000000000000000000000000000000000000000000) lt!92455)))

(declare-fun b!186964 () Bool)

(declare-fun lt!92452 () Unit!5621)

(assert (=> b!186964 (= e!123035 lt!92452)))

(assert (=> b!186964 (= lt!92452 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1209 lt!92389) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186964 (isDefined!179 (getValueByKey!226 (toList!1209 lt!92389) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186965 () Bool)

(declare-fun Unit!5629 () Unit!5621)

(assert (=> b!186965 (= e!123035 Unit!5629)))

(declare-fun b!186966 () Bool)

(assert (=> b!186966 (= e!123036 (isDefined!179 (getValueByKey!226 (toList!1209 lt!92389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55333 c!33555) b!186964))

(assert (= (and d!55333 (not c!33555)) b!186965))

(assert (= (and d!55333 (not res!88423)) b!186966))

(declare-fun m!213823 () Bool)

(assert (=> d!55333 m!213823))

(declare-fun m!213825 () Bool)

(assert (=> b!186964 m!213825))

(assert (=> b!186964 m!213813))

(assert (=> b!186964 m!213813))

(declare-fun m!213827 () Bool)

(assert (=> b!186964 m!213827))

(assert (=> b!186966 m!213813))

(assert (=> b!186966 m!213813))

(assert (=> b!186966 m!213827))

(assert (=> bm!18827 d!55333))

(declare-fun d!55335 () Bool)

(declare-fun e!123047 () Bool)

(assert (=> d!55335 e!123047))

(declare-fun c!33563 () Bool)

(declare-fun lt!92460 () SeekEntryResult!644)

(assert (=> d!55335 (= c!33563 (and ((_ is Intermediate!644) lt!92460) (undefined!1456 lt!92460)))))

(declare-fun e!123050 () SeekEntryResult!644)

(assert (=> d!55335 (= lt!92460 e!123050)))

(declare-fun c!33564 () Bool)

(assert (=> d!55335 (= c!33564 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!92461 () (_ BitVec 64))

(assert (=> d!55335 (= lt!92461 (select (arr!3755 (_keys!5753 thiss!1248)) (toIndex!0 key!828 (mask!8938 thiss!1248))))))

(assert (=> d!55335 (validMask!0 (mask!8938 thiss!1248))))

(assert (=> d!55335 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8938 thiss!1248)) key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)) lt!92460)))

(declare-fun b!186985 () Bool)

(declare-fun e!123048 () SeekEntryResult!644)

(assert (=> b!186985 (= e!123048 (Intermediate!644 false (toIndex!0 key!828 (mask!8938 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186986 () Bool)

(assert (=> b!186986 (= e!123050 (Intermediate!644 true (toIndex!0 key!828 (mask!8938 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186987 () Bool)

(declare-fun e!123051 () Bool)

(assert (=> b!186987 (= e!123047 e!123051)))

(declare-fun res!88430 () Bool)

(assert (=> b!186987 (= res!88430 (and ((_ is Intermediate!644) lt!92460) (not (undefined!1456 lt!92460)) (bvslt (x!20234 lt!92460) #b01111111111111111111111111111110) (bvsge (x!20234 lt!92460) #b00000000000000000000000000000000) (bvsge (x!20234 lt!92460) #b00000000000000000000000000000000)))))

(assert (=> b!186987 (=> (not res!88430) (not e!123051))))

(declare-fun b!186988 () Bool)

(assert (=> b!186988 (and (bvsge (index!4748 lt!92460) #b00000000000000000000000000000000) (bvslt (index!4748 lt!92460) (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun res!88432 () Bool)

(assert (=> b!186988 (= res!88432 (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4748 lt!92460)) key!828))))

(declare-fun e!123049 () Bool)

(assert (=> b!186988 (=> res!88432 e!123049)))

(assert (=> b!186988 (= e!123051 e!123049)))

(declare-fun b!186989 () Bool)

(assert (=> b!186989 (= e!123047 (bvsge (x!20234 lt!92460) #b01111111111111111111111111111110))))

(declare-fun b!186990 () Bool)

(assert (=> b!186990 (and (bvsge (index!4748 lt!92460) #b00000000000000000000000000000000) (bvslt (index!4748 lt!92460) (size!4072 (_keys!5753 thiss!1248))))))

(assert (=> b!186990 (= e!123049 (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4748 lt!92460)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186991 () Bool)

(assert (=> b!186991 (= e!123048 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8938 thiss!1248)) #b00000000000000000000000000000000 (mask!8938 thiss!1248)) key!828 (_keys!5753 thiss!1248) (mask!8938 thiss!1248)))))

(declare-fun b!186992 () Bool)

(assert (=> b!186992 (and (bvsge (index!4748 lt!92460) #b00000000000000000000000000000000) (bvslt (index!4748 lt!92460) (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun res!88431 () Bool)

(assert (=> b!186992 (= res!88431 (= (select (arr!3755 (_keys!5753 thiss!1248)) (index!4748 lt!92460)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186992 (=> res!88431 e!123049)))

(declare-fun b!186993 () Bool)

(assert (=> b!186993 (= e!123050 e!123048)))

(declare-fun c!33562 () Bool)

(assert (=> b!186993 (= c!33562 (or (= lt!92461 key!828) (= (bvadd lt!92461 lt!92461) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55335 c!33564) b!186986))

(assert (= (and d!55335 (not c!33564)) b!186993))

(assert (= (and b!186993 c!33562) b!186985))

(assert (= (and b!186993 (not c!33562)) b!186991))

(assert (= (and d!55335 c!33563) b!186989))

(assert (= (and d!55335 (not c!33563)) b!186987))

(assert (= (and b!186987 res!88430) b!186988))

(assert (= (and b!186988 (not res!88432)) b!186992))

(assert (= (and b!186992 (not res!88431)) b!186990))

(declare-fun m!213829 () Bool)

(assert (=> b!186990 m!213829))

(assert (=> b!186992 m!213829))

(assert (=> b!186988 m!213829))

(assert (=> d!55335 m!213717))

(declare-fun m!213831 () Bool)

(assert (=> d!55335 m!213831))

(assert (=> d!55335 m!213591))

(assert (=> b!186991 m!213717))

(declare-fun m!213833 () Bool)

(assert (=> b!186991 m!213833))

(assert (=> b!186991 m!213833))

(declare-fun m!213835 () Bool)

(assert (=> b!186991 m!213835))

(assert (=> d!55283 d!55335))

(declare-fun d!55337 () Bool)

(declare-fun lt!92467 () (_ BitVec 32))

(declare-fun lt!92466 () (_ BitVec 32))

(assert (=> d!55337 (= lt!92467 (bvmul (bvxor lt!92466 (bvlshr lt!92466 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55337 (= lt!92466 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55337 (and (bvsge (mask!8938 thiss!1248) #b00000000000000000000000000000000) (let ((res!88433 (let ((h!3009 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20252 (bvmul (bvxor h!3009 (bvlshr h!3009 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20252 (bvlshr x!20252 #b00000000000000000000000000001101)) (mask!8938 thiss!1248)))))) (and (bvslt res!88433 (bvadd (mask!8938 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88433 #b00000000000000000000000000000000))))))

(assert (=> d!55337 (= (toIndex!0 key!828 (mask!8938 thiss!1248)) (bvand (bvxor lt!92467 (bvlshr lt!92467 #b00000000000000000000000000001101)) (mask!8938 thiss!1248)))))

(assert (=> d!55283 d!55337))

(assert (=> d!55283 d!55275))

(declare-fun d!55339 () Bool)

(assert (=> d!55339 (= (apply!169 (+!289 lt!92378 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248))) lt!92376) (apply!169 lt!92378 lt!92376))))

(declare-fun lt!92470 () Unit!5621)

(declare-fun choose!992 (ListLongMap!2387 (_ BitVec 64) V!5475 (_ BitVec 64)) Unit!5621)

(assert (=> d!55339 (= lt!92470 (choose!992 lt!92378 lt!92381 (zeroValue!3648 thiss!1248) lt!92376))))

(declare-fun e!123054 () Bool)

(assert (=> d!55339 e!123054))

(declare-fun res!88436 () Bool)

(assert (=> d!55339 (=> (not res!88436) (not e!123054))))

(assert (=> d!55339 (= res!88436 (contains!1307 lt!92378 lt!92376))))

(assert (=> d!55339 (= (addApplyDifferent!145 lt!92378 lt!92381 (zeroValue!3648 thiss!1248) lt!92376) lt!92470)))

(declare-fun b!186997 () Bool)

(assert (=> b!186997 (= e!123054 (not (= lt!92376 lt!92381)))))

(assert (= (and d!55339 res!88436) b!186997))

(declare-fun m!213837 () Bool)

(assert (=> d!55339 m!213837))

(assert (=> d!55339 m!213673))

(assert (=> d!55339 m!213673))

(assert (=> d!55339 m!213691))

(declare-fun m!213839 () Bool)

(assert (=> d!55339 m!213839))

(assert (=> d!55339 m!213677))

(assert (=> b!186744 d!55339))

(declare-fun d!55341 () Bool)

(declare-fun e!123056 () Bool)

(assert (=> d!55341 e!123056))

(declare-fun res!88437 () Bool)

(assert (=> d!55341 (=> res!88437 e!123056)))

(declare-fun lt!92474 () Bool)

(assert (=> d!55341 (= res!88437 (not lt!92474))))

(declare-fun lt!92472 () Bool)

(assert (=> d!55341 (= lt!92474 lt!92472)))

(declare-fun lt!92473 () Unit!5621)

(declare-fun e!123055 () Unit!5621)

(assert (=> d!55341 (= lt!92473 e!123055)))

(declare-fun c!33565 () Bool)

(assert (=> d!55341 (= c!33565 lt!92472)))

(assert (=> d!55341 (= lt!92472 (containsKey!230 (toList!1209 (+!289 lt!92384 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248)))) lt!92377))))

(assert (=> d!55341 (= (contains!1307 (+!289 lt!92384 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248))) lt!92377) lt!92474)))

(declare-fun b!186998 () Bool)

(declare-fun lt!92471 () Unit!5621)

(assert (=> b!186998 (= e!123055 lt!92471)))

(assert (=> b!186998 (= lt!92471 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1209 (+!289 lt!92384 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248)))) lt!92377))))

(assert (=> b!186998 (isDefined!179 (getValueByKey!226 (toList!1209 (+!289 lt!92384 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248)))) lt!92377))))

(declare-fun b!186999 () Bool)

(declare-fun Unit!5630 () Unit!5621)

(assert (=> b!186999 (= e!123055 Unit!5630)))

(declare-fun b!187000 () Bool)

(assert (=> b!187000 (= e!123056 (isDefined!179 (getValueByKey!226 (toList!1209 (+!289 lt!92384 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248)))) lt!92377)))))

(assert (= (and d!55341 c!33565) b!186998))

(assert (= (and d!55341 (not c!33565)) b!186999))

(assert (= (and d!55341 (not res!88437)) b!187000))

(declare-fun m!213841 () Bool)

(assert (=> d!55341 m!213841))

(declare-fun m!213843 () Bool)

(assert (=> b!186998 m!213843))

(declare-fun m!213845 () Bool)

(assert (=> b!186998 m!213845))

(assert (=> b!186998 m!213845))

(declare-fun m!213847 () Bool)

(assert (=> b!186998 m!213847))

(assert (=> b!187000 m!213845))

(assert (=> b!187000 m!213845))

(assert (=> b!187000 m!213847))

(assert (=> b!186744 d!55341))

(declare-fun d!55343 () Bool)

(declare-fun e!123057 () Bool)

(assert (=> d!55343 e!123057))

(declare-fun res!88439 () Bool)

(assert (=> d!55343 (=> (not res!88439) (not e!123057))))

(declare-fun lt!92475 () ListLongMap!2387)

(assert (=> d!55343 (= res!88439 (contains!1307 lt!92475 (_1!1746 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248)))))))

(declare-fun lt!92477 () List!2376)

(assert (=> d!55343 (= lt!92475 (ListLongMap!2388 lt!92477))))

(declare-fun lt!92478 () Unit!5621)

(declare-fun lt!92476 () Unit!5621)

(assert (=> d!55343 (= lt!92478 lt!92476)))

(assert (=> d!55343 (= (getValueByKey!226 lt!92477 (_1!1746 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248)))) (Some!231 (_2!1746 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248)))))))

(assert (=> d!55343 (= lt!92476 (lemmaContainsTupThenGetReturnValue!118 lt!92477 (_1!1746 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248))) (_2!1746 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248)))))))

(assert (=> d!55343 (= lt!92477 (insertStrictlySorted!121 (toList!1209 lt!92390) (_1!1746 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248))) (_2!1746 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248)))))))

(assert (=> d!55343 (= (+!289 lt!92390 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248))) lt!92475)))

(declare-fun b!187001 () Bool)

(declare-fun res!88438 () Bool)

(assert (=> b!187001 (=> (not res!88438) (not e!123057))))

(assert (=> b!187001 (= res!88438 (= (getValueByKey!226 (toList!1209 lt!92475) (_1!1746 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248)))) (Some!231 (_2!1746 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248))))))))

(declare-fun b!187002 () Bool)

(assert (=> b!187002 (= e!123057 (contains!1309 (toList!1209 lt!92475) (tuple2!3471 lt!92373 (minValue!3648 thiss!1248))))))

(assert (= (and d!55343 res!88439) b!187001))

(assert (= (and b!187001 res!88438) b!187002))

(declare-fun m!213849 () Bool)

(assert (=> d!55343 m!213849))

(declare-fun m!213851 () Bool)

(assert (=> d!55343 m!213851))

(declare-fun m!213853 () Bool)

(assert (=> d!55343 m!213853))

(declare-fun m!213855 () Bool)

(assert (=> d!55343 m!213855))

(declare-fun m!213857 () Bool)

(assert (=> b!187001 m!213857))

(declare-fun m!213859 () Bool)

(assert (=> b!187002 m!213859))

(assert (=> b!186744 d!55343))

(declare-fun d!55345 () Bool)

(assert (=> d!55345 (= (apply!169 (+!289 lt!92390 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248))) lt!92380) (apply!169 lt!92390 lt!92380))))

(declare-fun lt!92479 () Unit!5621)

(assert (=> d!55345 (= lt!92479 (choose!992 lt!92390 lt!92373 (minValue!3648 thiss!1248) lt!92380))))

(declare-fun e!123058 () Bool)

(assert (=> d!55345 e!123058))

(declare-fun res!88440 () Bool)

(assert (=> d!55345 (=> (not res!88440) (not e!123058))))

(assert (=> d!55345 (= res!88440 (contains!1307 lt!92390 lt!92380))))

(assert (=> d!55345 (= (addApplyDifferent!145 lt!92390 lt!92373 (minValue!3648 thiss!1248) lt!92380) lt!92479)))

(declare-fun b!187003 () Bool)

(assert (=> b!187003 (= e!123058 (not (= lt!92380 lt!92373)))))

(assert (= (and d!55345 res!88440) b!187003))

(declare-fun m!213861 () Bool)

(assert (=> d!55345 m!213861))

(assert (=> d!55345 m!213679))

(assert (=> d!55345 m!213679))

(assert (=> d!55345 m!213681))

(declare-fun m!213863 () Bool)

(assert (=> d!55345 m!213863))

(assert (=> d!55345 m!213675))

(assert (=> b!186744 d!55345))

(declare-fun d!55347 () Bool)

(declare-fun e!123059 () Bool)

(assert (=> d!55347 e!123059))

(declare-fun res!88442 () Bool)

(assert (=> d!55347 (=> (not res!88442) (not e!123059))))

(declare-fun lt!92480 () ListLongMap!2387)

(assert (=> d!55347 (= res!88442 (contains!1307 lt!92480 (_1!1746 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248)))))))

(declare-fun lt!92482 () List!2376)

(assert (=> d!55347 (= lt!92480 (ListLongMap!2388 lt!92482))))

(declare-fun lt!92483 () Unit!5621)

(declare-fun lt!92481 () Unit!5621)

(assert (=> d!55347 (= lt!92483 lt!92481)))

(assert (=> d!55347 (= (getValueByKey!226 lt!92482 (_1!1746 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248)))) (Some!231 (_2!1746 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248)))))))

(assert (=> d!55347 (= lt!92481 (lemmaContainsTupThenGetReturnValue!118 lt!92482 (_1!1746 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248))) (_2!1746 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248)))))))

(assert (=> d!55347 (= lt!92482 (insertStrictlySorted!121 (toList!1209 lt!92391) (_1!1746 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248))) (_2!1746 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248)))))))

(assert (=> d!55347 (= (+!289 lt!92391 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248))) lt!92480)))

(declare-fun b!187004 () Bool)

(declare-fun res!88441 () Bool)

(assert (=> b!187004 (=> (not res!88441) (not e!123059))))

(assert (=> b!187004 (= res!88441 (= (getValueByKey!226 (toList!1209 lt!92480) (_1!1746 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248)))) (Some!231 (_2!1746 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248))))))))

(declare-fun b!187005 () Bool)

(assert (=> b!187005 (= e!123059 (contains!1309 (toList!1209 lt!92480) (tuple2!3471 lt!92372 (minValue!3648 thiss!1248))))))

(assert (= (and d!55347 res!88442) b!187004))

(assert (= (and b!187004 res!88441) b!187005))

(declare-fun m!213865 () Bool)

(assert (=> d!55347 m!213865))

(declare-fun m!213867 () Bool)

(assert (=> d!55347 m!213867))

(declare-fun m!213869 () Bool)

(assert (=> d!55347 m!213869))

(declare-fun m!213871 () Bool)

(assert (=> d!55347 m!213871))

(declare-fun m!213873 () Bool)

(assert (=> b!187004 m!213873))

(declare-fun m!213875 () Bool)

(assert (=> b!187005 m!213875))

(assert (=> b!186744 d!55347))

(declare-fun d!55349 () Bool)

(declare-fun e!123060 () Bool)

(assert (=> d!55349 e!123060))

(declare-fun res!88444 () Bool)

(assert (=> d!55349 (=> (not res!88444) (not e!123060))))

(declare-fun lt!92484 () ListLongMap!2387)

(assert (=> d!55349 (= res!88444 (contains!1307 lt!92484 (_1!1746 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248)))))))

(declare-fun lt!92486 () List!2376)

(assert (=> d!55349 (= lt!92484 (ListLongMap!2388 lt!92486))))

(declare-fun lt!92487 () Unit!5621)

(declare-fun lt!92485 () Unit!5621)

(assert (=> d!55349 (= lt!92487 lt!92485)))

(assert (=> d!55349 (= (getValueByKey!226 lt!92486 (_1!1746 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248)))) (Some!231 (_2!1746 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248)))))))

(assert (=> d!55349 (= lt!92485 (lemmaContainsTupThenGetReturnValue!118 lt!92486 (_1!1746 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248))) (_2!1746 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248)))))))

(assert (=> d!55349 (= lt!92486 (insertStrictlySorted!121 (toList!1209 lt!92378) (_1!1746 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248))) (_2!1746 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248)))))))

(assert (=> d!55349 (= (+!289 lt!92378 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248))) lt!92484)))

(declare-fun b!187006 () Bool)

(declare-fun res!88443 () Bool)

(assert (=> b!187006 (=> (not res!88443) (not e!123060))))

(assert (=> b!187006 (= res!88443 (= (getValueByKey!226 (toList!1209 lt!92484) (_1!1746 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248)))) (Some!231 (_2!1746 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248))))))))

(declare-fun b!187007 () Bool)

(assert (=> b!187007 (= e!123060 (contains!1309 (toList!1209 lt!92484) (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248))))))

(assert (= (and d!55349 res!88444) b!187006))

(assert (= (and b!187006 res!88443) b!187007))

(declare-fun m!213877 () Bool)

(assert (=> d!55349 m!213877))

(declare-fun m!213879 () Bool)

(assert (=> d!55349 m!213879))

(declare-fun m!213881 () Bool)

(assert (=> d!55349 m!213881))

(declare-fun m!213883 () Bool)

(assert (=> d!55349 m!213883))

(declare-fun m!213885 () Bool)

(assert (=> b!187006 m!213885))

(declare-fun m!213887 () Bool)

(assert (=> b!187007 m!213887))

(assert (=> b!186744 d!55349))

(declare-fun d!55351 () Bool)

(assert (=> d!55351 (= (apply!169 (+!289 lt!92378 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248))) lt!92376) (get!2158 (getValueByKey!226 (toList!1209 (+!289 lt!92378 (tuple2!3471 lt!92381 (zeroValue!3648 thiss!1248)))) lt!92376)))))

(declare-fun bs!7549 () Bool)

(assert (= bs!7549 d!55351))

(declare-fun m!213889 () Bool)

(assert (=> bs!7549 m!213889))

(assert (=> bs!7549 m!213889))

(declare-fun m!213891 () Bool)

(assert (=> bs!7549 m!213891))

(assert (=> b!186744 d!55351))

(declare-fun d!55353 () Bool)

(assert (=> d!55353 (= (apply!169 lt!92378 lt!92376) (get!2158 (getValueByKey!226 (toList!1209 lt!92378) lt!92376)))))

(declare-fun bs!7550 () Bool)

(assert (= bs!7550 d!55353))

(declare-fun m!213893 () Bool)

(assert (=> bs!7550 m!213893))

(assert (=> bs!7550 m!213893))

(declare-fun m!213895 () Bool)

(assert (=> bs!7550 m!213895))

(assert (=> b!186744 d!55353))

(declare-fun d!55355 () Bool)

(declare-fun e!123061 () Bool)

(assert (=> d!55355 e!123061))

(declare-fun res!88446 () Bool)

(assert (=> d!55355 (=> (not res!88446) (not e!123061))))

(declare-fun lt!92488 () ListLongMap!2387)

(assert (=> d!55355 (= res!88446 (contains!1307 lt!92488 (_1!1746 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248)))))))

(declare-fun lt!92490 () List!2376)

(assert (=> d!55355 (= lt!92488 (ListLongMap!2388 lt!92490))))

(declare-fun lt!92491 () Unit!5621)

(declare-fun lt!92489 () Unit!5621)

(assert (=> d!55355 (= lt!92491 lt!92489)))

(assert (=> d!55355 (= (getValueByKey!226 lt!92490 (_1!1746 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248)))) (Some!231 (_2!1746 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248)))))))

(assert (=> d!55355 (= lt!92489 (lemmaContainsTupThenGetReturnValue!118 lt!92490 (_1!1746 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248))) (_2!1746 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248)))))))

(assert (=> d!55355 (= lt!92490 (insertStrictlySorted!121 (toList!1209 lt!92384) (_1!1746 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248))) (_2!1746 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248)))))))

(assert (=> d!55355 (= (+!289 lt!92384 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248))) lt!92488)))

(declare-fun b!187008 () Bool)

(declare-fun res!88445 () Bool)

(assert (=> b!187008 (=> (not res!88445) (not e!123061))))

(assert (=> b!187008 (= res!88445 (= (getValueByKey!226 (toList!1209 lt!92488) (_1!1746 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248)))) (Some!231 (_2!1746 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248))))))))

(declare-fun b!187009 () Bool)

(assert (=> b!187009 (= e!123061 (contains!1309 (toList!1209 lt!92488) (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248))))))

(assert (= (and d!55355 res!88446) b!187008))

(assert (= (and b!187008 res!88445) b!187009))

(declare-fun m!213897 () Bool)

(assert (=> d!55355 m!213897))

(declare-fun m!213899 () Bool)

(assert (=> d!55355 m!213899))

(declare-fun m!213901 () Bool)

(assert (=> d!55355 m!213901))

(declare-fun m!213903 () Bool)

(assert (=> d!55355 m!213903))

(declare-fun m!213905 () Bool)

(assert (=> b!187008 m!213905))

(declare-fun m!213907 () Bool)

(assert (=> b!187009 m!213907))

(assert (=> b!186744 d!55355))

(declare-fun d!55357 () Bool)

(assert (=> d!55357 (= (apply!169 (+!289 lt!92391 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248))) lt!92379) (get!2158 (getValueByKey!226 (toList!1209 (+!289 lt!92391 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248)))) lt!92379)))))

(declare-fun bs!7551 () Bool)

(assert (= bs!7551 d!55357))

(declare-fun m!213909 () Bool)

(assert (=> bs!7551 m!213909))

(assert (=> bs!7551 m!213909))

(declare-fun m!213911 () Bool)

(assert (=> bs!7551 m!213911))

(assert (=> b!186744 d!55357))

(declare-fun b!187034 () Bool)

(declare-fun e!123082 () ListLongMap!2387)

(declare-fun call!18856 () ListLongMap!2387)

(assert (=> b!187034 (= e!123082 call!18856)))

(declare-fun b!187035 () Bool)

(declare-fun e!123076 () Bool)

(assert (=> b!187035 (= e!123076 (validKeyInArray!0 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187035 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!187036 () Bool)

(declare-fun e!123080 () Bool)

(declare-fun lt!92512 () ListLongMap!2387)

(assert (=> b!187036 (= e!123080 (= lt!92512 (getCurrentListMapNoExtraKeys!202 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3807 thiss!1248))))))

(declare-fun b!187037 () Bool)

(declare-fun res!88455 () Bool)

(declare-fun e!123079 () Bool)

(assert (=> b!187037 (=> (not res!88455) (not e!123079))))

(assert (=> b!187037 (= res!88455 (not (contains!1307 lt!92512 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187038 () Bool)

(declare-fun e!123078 () ListLongMap!2387)

(assert (=> b!187038 (= e!123078 (ListLongMap!2388 Nil!2373))))

(declare-fun d!55359 () Bool)

(assert (=> d!55359 e!123079))

(declare-fun res!88456 () Bool)

(assert (=> d!55359 (=> (not res!88456) (not e!123079))))

(assert (=> d!55359 (= res!88456 (not (contains!1307 lt!92512 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55359 (= lt!92512 e!123078)))

(declare-fun c!33576 () Bool)

(assert (=> d!55359 (= c!33576 (bvsge #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(assert (=> d!55359 (validMask!0 (mask!8938 thiss!1248))))

(assert (=> d!55359 (= (getCurrentListMapNoExtraKeys!202 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3807 thiss!1248)) lt!92512)))

(declare-fun b!187039 () Bool)

(assert (=> b!187039 (= e!123078 e!123082)))

(declare-fun c!33574 () Bool)

(assert (=> b!187039 (= c!33574 (validKeyInArray!0 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18853 () Bool)

(assert (=> bm!18853 (= call!18856 (getCurrentListMapNoExtraKeys!202 (_keys!5753 thiss!1248) (_values!3790 thiss!1248) (mask!8938 thiss!1248) (extraKeys!3544 thiss!1248) (zeroValue!3648 thiss!1248) (minValue!3648 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3807 thiss!1248)))))

(declare-fun b!187040 () Bool)

(declare-fun e!123077 () Bool)

(assert (=> b!187040 (= e!123077 e!123080)))

(declare-fun c!33577 () Bool)

(assert (=> b!187040 (= c!33577 (bvslt #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun b!187041 () Bool)

(assert (=> b!187041 (= e!123079 e!123077)))

(declare-fun c!33575 () Bool)

(assert (=> b!187041 (= c!33575 e!123076)))

(declare-fun res!88458 () Bool)

(assert (=> b!187041 (=> (not res!88458) (not e!123076))))

(assert (=> b!187041 (= res!88458 (bvslt #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun b!187042 () Bool)

(declare-fun isEmpty!474 (ListLongMap!2387) Bool)

(assert (=> b!187042 (= e!123080 (isEmpty!474 lt!92512))))

(declare-fun b!187043 () Bool)

(declare-fun e!123081 () Bool)

(assert (=> b!187043 (= e!123077 e!123081)))

(assert (=> b!187043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(declare-fun res!88457 () Bool)

(assert (=> b!187043 (= res!88457 (contains!1307 lt!92512 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187043 (=> (not res!88457) (not e!123081))))

(declare-fun b!187044 () Bool)

(assert (=> b!187044 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4072 (_keys!5753 thiss!1248))))))

(assert (=> b!187044 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4073 (_values!3790 thiss!1248))))))

(assert (=> b!187044 (= e!123081 (= (apply!169 lt!92512 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)) (get!2157 (select (arr!3756 (_values!3790 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3807 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!187045 () Bool)

(declare-fun lt!92508 () Unit!5621)

(declare-fun lt!92511 () Unit!5621)

(assert (=> b!187045 (= lt!92508 lt!92511)))

(declare-fun lt!92510 () V!5475)

(declare-fun lt!92509 () ListLongMap!2387)

(declare-fun lt!92506 () (_ BitVec 64))

(declare-fun lt!92507 () (_ BitVec 64))

(assert (=> b!187045 (not (contains!1307 (+!289 lt!92509 (tuple2!3471 lt!92506 lt!92510)) lt!92507))))

(declare-fun addStillNotContains!90 (ListLongMap!2387 (_ BitVec 64) V!5475 (_ BitVec 64)) Unit!5621)

(assert (=> b!187045 (= lt!92511 (addStillNotContains!90 lt!92509 lt!92506 lt!92510 lt!92507))))

(assert (=> b!187045 (= lt!92507 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!187045 (= lt!92510 (get!2157 (select (arr!3756 (_values!3790 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3807 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187045 (= lt!92506 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187045 (= lt!92509 call!18856)))

(assert (=> b!187045 (= e!123082 (+!289 call!18856 (tuple2!3471 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000) (get!2157 (select (arr!3756 (_values!3790 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3807 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!55359 c!33576) b!187038))

(assert (= (and d!55359 (not c!33576)) b!187039))

(assert (= (and b!187039 c!33574) b!187045))

(assert (= (and b!187039 (not c!33574)) b!187034))

(assert (= (or b!187045 b!187034) bm!18853))

(assert (= (and d!55359 res!88456) b!187037))

(assert (= (and b!187037 res!88455) b!187041))

(assert (= (and b!187041 res!88458) b!187035))

(assert (= (and b!187041 c!33575) b!187043))

(assert (= (and b!187041 (not c!33575)) b!187040))

(assert (= (and b!187043 res!88457) b!187044))

(assert (= (and b!187040 c!33577) b!187036))

(assert (= (and b!187040 (not c!33577)) b!187042))

(declare-fun b_lambda!7275 () Bool)

(assert (=> (not b_lambda!7275) (not b!187044)))

(assert (=> b!187044 t!7267))

(declare-fun b_and!11215 () Bool)

(assert (= b_and!11213 (and (=> t!7267 result!4825) b_and!11215)))

(declare-fun b_lambda!7277 () Bool)

(assert (=> (not b_lambda!7277) (not b!187045)))

(assert (=> b!187045 t!7267))

(declare-fun b_and!11217 () Bool)

(assert (= b_and!11215 (and (=> t!7267 result!4825) b_and!11217)))

(assert (=> b!187039 m!213645))

(assert (=> b!187039 m!213645))

(assert (=> b!187039 m!213649))

(assert (=> b!187043 m!213645))

(assert (=> b!187043 m!213645))

(declare-fun m!213913 () Bool)

(assert (=> b!187043 m!213913))

(declare-fun m!213915 () Bool)

(assert (=> d!55359 m!213915))

(assert (=> d!55359 m!213591))

(assert (=> b!187035 m!213645))

(assert (=> b!187035 m!213645))

(assert (=> b!187035 m!213649))

(declare-fun m!213917 () Bool)

(assert (=> b!187036 m!213917))

(declare-fun m!213919 () Bool)

(assert (=> b!187042 m!213919))

(assert (=> b!187045 m!213655))

(assert (=> b!187045 m!213657))

(assert (=> b!187045 m!213655))

(assert (=> b!187045 m!213657))

(assert (=> b!187045 m!213659))

(assert (=> b!187045 m!213645))

(declare-fun m!213921 () Bool)

(assert (=> b!187045 m!213921))

(declare-fun m!213923 () Bool)

(assert (=> b!187045 m!213923))

(declare-fun m!213925 () Bool)

(assert (=> b!187045 m!213925))

(assert (=> b!187045 m!213923))

(declare-fun m!213927 () Bool)

(assert (=> b!187045 m!213927))

(assert (=> bm!18853 m!213917))

(declare-fun m!213929 () Bool)

(assert (=> b!187037 m!213929))

(assert (=> b!187044 m!213645))

(declare-fun m!213931 () Bool)

(assert (=> b!187044 m!213931))

(assert (=> b!187044 m!213655))

(assert (=> b!187044 m!213657))

(assert (=> b!187044 m!213655))

(assert (=> b!187044 m!213657))

(assert (=> b!187044 m!213659))

(assert (=> b!187044 m!213645))

(assert (=> b!186744 d!55359))

(declare-fun d!55361 () Bool)

(assert (=> d!55361 (= (apply!169 (+!289 lt!92390 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248))) lt!92380) (get!2158 (getValueByKey!226 (toList!1209 (+!289 lt!92390 (tuple2!3471 lt!92373 (minValue!3648 thiss!1248)))) lt!92380)))))

(declare-fun bs!7552 () Bool)

(assert (= bs!7552 d!55361))

(declare-fun m!213933 () Bool)

(assert (=> bs!7552 m!213933))

(assert (=> bs!7552 m!213933))

(declare-fun m!213935 () Bool)

(assert (=> bs!7552 m!213935))

(assert (=> b!186744 d!55361))

(declare-fun d!55363 () Bool)

(assert (=> d!55363 (= (apply!169 (+!289 lt!92391 (tuple2!3471 lt!92372 (minValue!3648 thiss!1248))) lt!92379) (apply!169 lt!92391 lt!92379))))

(declare-fun lt!92513 () Unit!5621)

(assert (=> d!55363 (= lt!92513 (choose!992 lt!92391 lt!92372 (minValue!3648 thiss!1248) lt!92379))))

(declare-fun e!123083 () Bool)

(assert (=> d!55363 e!123083))

(declare-fun res!88459 () Bool)

(assert (=> d!55363 (=> (not res!88459) (not e!123083))))

(assert (=> d!55363 (= res!88459 (contains!1307 lt!92391 lt!92379))))

(assert (=> d!55363 (= (addApplyDifferent!145 lt!92391 lt!92372 (minValue!3648 thiss!1248) lt!92379) lt!92513)))

(declare-fun b!187046 () Bool)

(assert (=> b!187046 (= e!123083 (not (= lt!92379 lt!92372)))))

(assert (= (and d!55363 res!88459) b!187046))

(declare-fun m!213937 () Bool)

(assert (=> d!55363 m!213937))

(assert (=> d!55363 m!213697))

(assert (=> d!55363 m!213697))

(assert (=> d!55363 m!213699))

(declare-fun m!213939 () Bool)

(assert (=> d!55363 m!213939))

(assert (=> d!55363 m!213687))

(assert (=> b!186744 d!55363))

(declare-fun d!55365 () Bool)

(assert (=> d!55365 (= (apply!169 lt!92391 lt!92379) (get!2158 (getValueByKey!226 (toList!1209 lt!92391) lt!92379)))))

(declare-fun bs!7553 () Bool)

(assert (= bs!7553 d!55365))

(declare-fun m!213941 () Bool)

(assert (=> bs!7553 m!213941))

(assert (=> bs!7553 m!213941))

(declare-fun m!213943 () Bool)

(assert (=> bs!7553 m!213943))

(assert (=> b!186744 d!55365))

(declare-fun d!55367 () Bool)

(assert (=> d!55367 (= (apply!169 lt!92390 lt!92380) (get!2158 (getValueByKey!226 (toList!1209 lt!92390) lt!92380)))))

(declare-fun bs!7554 () Bool)

(assert (= bs!7554 d!55367))

(declare-fun m!213945 () Bool)

(assert (=> bs!7554 m!213945))

(assert (=> bs!7554 m!213945))

(declare-fun m!213947 () Bool)

(assert (=> bs!7554 m!213947))

(assert (=> b!186744 d!55367))

(declare-fun d!55369 () Bool)

(assert (=> d!55369 (contains!1307 (+!289 lt!92384 (tuple2!3471 lt!92375 (zeroValue!3648 thiss!1248))) lt!92377)))

(declare-fun lt!92516 () Unit!5621)

(declare-fun choose!993 (ListLongMap!2387 (_ BitVec 64) V!5475 (_ BitVec 64)) Unit!5621)

(assert (=> d!55369 (= lt!92516 (choose!993 lt!92384 lt!92375 (zeroValue!3648 thiss!1248) lt!92377))))

(assert (=> d!55369 (contains!1307 lt!92384 lt!92377)))

(assert (=> d!55369 (= (addStillContains!145 lt!92384 lt!92375 (zeroValue!3648 thiss!1248) lt!92377) lt!92516)))

(declare-fun bs!7555 () Bool)

(assert (= bs!7555 d!55369))

(assert (=> bs!7555 m!213685))

(assert (=> bs!7555 m!213685))

(assert (=> bs!7555 m!213695))

(declare-fun m!213949 () Bool)

(assert (=> bs!7555 m!213949))

(declare-fun m!213951 () Bool)

(assert (=> bs!7555 m!213951))

(assert (=> b!186744 d!55369))

(assert (=> bm!18824 d!55359))

(declare-fun d!55371 () Bool)

(declare-fun e!123085 () Bool)

(assert (=> d!55371 e!123085))

(declare-fun res!88460 () Bool)

(assert (=> d!55371 (=> res!88460 e!123085)))

(declare-fun lt!92520 () Bool)

(assert (=> d!55371 (= res!88460 (not lt!92520))))

(declare-fun lt!92518 () Bool)

(assert (=> d!55371 (= lt!92520 lt!92518)))

(declare-fun lt!92519 () Unit!5621)

(declare-fun e!123084 () Unit!5621)

(assert (=> d!55371 (= lt!92519 e!123084)))

(declare-fun c!33578 () Bool)

(assert (=> d!55371 (= c!33578 lt!92518)))

(assert (=> d!55371 (= lt!92518 (containsKey!230 (toList!1209 lt!92389) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55371 (= (contains!1307 lt!92389 #b0000000000000000000000000000000000000000000000000000000000000000) lt!92520)))

(declare-fun b!187048 () Bool)

(declare-fun lt!92517 () Unit!5621)

(assert (=> b!187048 (= e!123084 lt!92517)))

(assert (=> b!187048 (= lt!92517 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1209 lt!92389) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187048 (isDefined!179 (getValueByKey!226 (toList!1209 lt!92389) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187049 () Bool)

(declare-fun Unit!5631 () Unit!5621)

(assert (=> b!187049 (= e!123084 Unit!5631)))

(declare-fun b!187050 () Bool)

(assert (=> b!187050 (= e!123085 (isDefined!179 (getValueByKey!226 (toList!1209 lt!92389) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55371 c!33578) b!187048))

(assert (= (and d!55371 (not c!33578)) b!187049))

(assert (= (and d!55371 (not res!88460)) b!187050))

(declare-fun m!213953 () Bool)

(assert (=> d!55371 m!213953))

(declare-fun m!213955 () Bool)

(assert (=> b!187048 m!213955))

(assert (=> b!187048 m!213769))

(assert (=> b!187048 m!213769))

(declare-fun m!213957 () Bool)

(assert (=> b!187048 m!213957))

(assert (=> b!187050 m!213769))

(assert (=> b!187050 m!213769))

(assert (=> b!187050 m!213957))

(assert (=> bm!18823 d!55371))

(declare-fun d!55373 () Bool)

(declare-fun e!123087 () Bool)

(assert (=> d!55373 e!123087))

(declare-fun res!88461 () Bool)

(assert (=> d!55373 (=> res!88461 e!123087)))

(declare-fun lt!92524 () Bool)

(assert (=> d!55373 (= res!88461 (not lt!92524))))

(declare-fun lt!92522 () Bool)

(assert (=> d!55373 (= lt!92524 lt!92522)))

(declare-fun lt!92523 () Unit!5621)

(declare-fun e!123086 () Unit!5621)

(assert (=> d!55373 (= lt!92523 e!123086)))

(declare-fun c!33579 () Bool)

(assert (=> d!55373 (= c!33579 lt!92522)))

(assert (=> d!55373 (= lt!92522 (containsKey!230 (toList!1209 lt!92389) (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55373 (= (contains!1307 lt!92389 (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)) lt!92524)))

(declare-fun b!187051 () Bool)

(declare-fun lt!92521 () Unit!5621)

(assert (=> b!187051 (= e!123086 lt!92521)))

(assert (=> b!187051 (= lt!92521 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1209 lt!92389) (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187051 (isDefined!179 (getValueByKey!226 (toList!1209 lt!92389) (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187052 () Bool)

(declare-fun Unit!5632 () Unit!5621)

(assert (=> b!187052 (= e!123086 Unit!5632)))

(declare-fun b!187053 () Bool)

(assert (=> b!187053 (= e!123087 (isDefined!179 (getValueByKey!226 (toList!1209 lt!92389) (select (arr!3755 (_keys!5753 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55373 c!33579) b!187051))

(assert (= (and d!55373 (not c!33579)) b!187052))

(assert (= (and d!55373 (not res!88461)) b!187053))

(assert (=> d!55373 m!213645))

(declare-fun m!213959 () Bool)

(assert (=> d!55373 m!213959))

(assert (=> b!187051 m!213645))

(declare-fun m!213961 () Bool)

(assert (=> b!187051 m!213961))

(assert (=> b!187051 m!213645))

(assert (=> b!187051 m!213795))

(assert (=> b!187051 m!213795))

(declare-fun m!213963 () Bool)

(assert (=> b!187051 m!213963))

(assert (=> b!187053 m!213645))

(assert (=> b!187053 m!213795))

(assert (=> b!187053 m!213795))

(assert (=> b!187053 m!213963))

(assert (=> b!186760 d!55373))

(assert (=> b!186759 d!55325))

(declare-fun mapNonEmpty!7532 () Bool)

(declare-fun mapRes!7532 () Bool)

(declare-fun tp!16613 () Bool)

(declare-fun e!123088 () Bool)

(assert (=> mapNonEmpty!7532 (= mapRes!7532 (and tp!16613 e!123088))))

(declare-fun mapRest!7532 () (Array (_ BitVec 32) ValueCell!1842))

(declare-fun mapKey!7532 () (_ BitVec 32))

(declare-fun mapValue!7532 () ValueCell!1842)

(assert (=> mapNonEmpty!7532 (= mapRest!7531 (store mapRest!7532 mapKey!7532 mapValue!7532))))

(declare-fun condMapEmpty!7532 () Bool)

(declare-fun mapDefault!7532 () ValueCell!1842)

(assert (=> mapNonEmpty!7531 (= condMapEmpty!7532 (= mapRest!7531 ((as const (Array (_ BitVec 32) ValueCell!1842)) mapDefault!7532)))))

(declare-fun e!123089 () Bool)

(assert (=> mapNonEmpty!7531 (= tp!16612 (and e!123089 mapRes!7532))))

(declare-fun mapIsEmpty!7532 () Bool)

(assert (=> mapIsEmpty!7532 mapRes!7532))

(declare-fun b!187054 () Bool)

(assert (=> b!187054 (= e!123088 tp_is_empty!4371)))

(declare-fun b!187055 () Bool)

(assert (=> b!187055 (= e!123089 tp_is_empty!4371)))

(assert (= (and mapNonEmpty!7531 condMapEmpty!7532) mapIsEmpty!7532))

(assert (= (and mapNonEmpty!7531 (not condMapEmpty!7532)) mapNonEmpty!7532))

(assert (= (and mapNonEmpty!7532 ((_ is ValueCellFull!1842) mapValue!7532)) b!187054))

(assert (= (and mapNonEmpty!7531 ((_ is ValueCellFull!1842) mapDefault!7532)) b!187055))

(declare-fun m!213965 () Bool)

(assert (=> mapNonEmpty!7532 m!213965))

(declare-fun b_lambda!7279 () Bool)

(assert (= b_lambda!7275 (or (and b!186641 b_free!4599) b_lambda!7279)))

(declare-fun b_lambda!7281 () Bool)

(assert (= b_lambda!7277 (or (and b!186641 b_free!4599) b_lambda!7281)))

(check-sat b_and!11217 (not b!187008) (not bm!18850) (not d!55305) (not d!55347) (not d!55307) (not b!186936) (not b!187004) (not b_lambda!7273) (not b!187000) (not d!55301) (not d!55331) (not b!186866) (not b!186964) (not d!55365) (not d!55355) tp_is_empty!4371 (not d!55357) (not b_lambda!7279) (not b!186852) (not b!186920) (not b!186914) (not b!187001) (not b!186966) (not b!187051) (not d!55343) (not d!55361) (not b!187045) (not b!187002) (not bm!18849) (not b!186998) (not b!186834) (not d!55349) (not b_lambda!7281) (not b!186939) (not b!187039) (not b!186927) (not b!187050) (not b!187037) (not d!55309) (not d!55291) (not b!186913) (not b!186911) (not b!186853) (not d!55329) (not d!55297) (not d!55333) (not b!186875) (not bm!18838) (not b!186895) (not b!187006) (not b!186854) (not d!55339) (not d!55367) (not b!186870) (not d!55295) (not d!55369) (not b!187044) (not d!55345) (not b!186845) (not b!187048) (not b_next!4599) (not d!55351) (not b!187036) (not b!187053) (not b!187035) (not b!186921) (not b!187007) (not b!186991) (not b!187005) (not d!55363) (not b!186833) (not d!55319) (not b!186882) (not d!55371) (not d!55335) (not bm!18853) (not bm!18841) (not b!187042) (not b!186855) (not d!55353) (not d!55341) (not bm!18844) (not d!55359) (not d!55373) (not d!55315) (not b!187009) (not b!187043) (not mapNonEmpty!7532))
(check-sat b_and!11217 (not b_next!4599))
