; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22908 () Bool)

(assert start!22908)

(declare-fun b!238712 () Bool)

(declare-fun b_free!6411 () Bool)

(declare-fun b_next!6411 () Bool)

(assert (=> b!238712 (= b_free!6411 (not b_next!6411))))

(declare-fun tp!22436 () Bool)

(declare-fun b_and!13377 () Bool)

(assert (=> b!238712 (= tp!22436 b_and!13377)))

(declare-fun b!238704 () Bool)

(declare-datatypes ((Unit!7322 0))(
  ( (Unit!7323) )
))
(declare-fun e!154981 () Unit!7322)

(declare-fun lt!120644 () Unit!7322)

(assert (=> b!238704 (= e!154981 lt!120644)))

(declare-datatypes ((V!8011 0))(
  ( (V!8012 (val!3181 Int)) )
))
(declare-datatypes ((ValueCell!2793 0))(
  ( (ValueCellFull!2793 (v!5219 V!8011)) (EmptyCell!2793) )
))
(declare-datatypes ((array!11825 0))(
  ( (array!11826 (arr!5614 (Array (_ BitVec 32) ValueCell!2793)) (size!5955 (_ BitVec 32))) )
))
(declare-datatypes ((array!11827 0))(
  ( (array!11828 (arr!5615 (Array (_ BitVec 32) (_ BitVec 64))) (size!5956 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3486 0))(
  ( (LongMapFixedSize!3487 (defaultEntry!4428 Int) (mask!10466 (_ BitVec 32)) (extraKeys!4165 (_ BitVec 32)) (zeroValue!4269 V!8011) (minValue!4269 V!8011) (_size!1792 (_ BitVec 32)) (_keys!6530 array!11827) (_values!4411 array!11825) (_vacant!1792 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3486)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!334 (array!11827 array!11825 (_ BitVec 32) (_ BitVec 32) V!8011 V!8011 (_ BitVec 64) Int) Unit!7322)

(assert (=> b!238704 (= lt!120644 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!334 (_keys!6530 thiss!1504) (_values!4411 thiss!1504) (mask!10466 thiss!1504) (extraKeys!4165 thiss!1504) (zeroValue!4269 thiss!1504) (minValue!4269 thiss!1504) key!932 (defaultEntry!4428 thiss!1504)))))

(declare-fun c!39802 () Bool)

(declare-datatypes ((SeekEntryResult!1021 0))(
  ( (MissingZero!1021 (index!6254 (_ BitVec 32))) (Found!1021 (index!6255 (_ BitVec 32))) (Intermediate!1021 (undefined!1833 Bool) (index!6256 (_ BitVec 32)) (x!24061 (_ BitVec 32))) (Undefined!1021) (MissingVacant!1021 (index!6257 (_ BitVec 32))) )
))
(declare-fun lt!120645 () SeekEntryResult!1021)

(get-info :version)

(assert (=> b!238704 (= c!39802 ((_ is MissingZero!1021) lt!120645))))

(declare-fun e!154984 () Bool)

(assert (=> b!238704 e!154984))

(declare-fun b!238705 () Bool)

(declare-fun e!154992 () Bool)

(declare-fun call!22194 () Bool)

(assert (=> b!238705 (= e!154992 (not call!22194))))

(declare-fun b!238706 () Bool)

(declare-fun res!116982 () Bool)

(assert (=> b!238706 (= res!116982 (= (select (arr!5615 (_keys!6530 thiss!1504)) (index!6257 lt!120645)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154989 () Bool)

(assert (=> b!238706 (=> (not res!116982) (not e!154989))))

(declare-fun b!238707 () Bool)

(declare-fun e!154991 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238707 (= e!154991 (not (validMask!0 (mask!10466 thiss!1504))))))

(declare-fun b!238708 () Bool)

(declare-fun e!154986 () Bool)

(declare-fun tp_is_empty!6273 () Bool)

(assert (=> b!238708 (= e!154986 tp_is_empty!6273)))

(declare-fun b!238709 () Bool)

(declare-fun c!39801 () Bool)

(assert (=> b!238709 (= c!39801 ((_ is MissingVacant!1021) lt!120645))))

(declare-fun e!154987 () Bool)

(assert (=> b!238709 (= e!154984 e!154987)))

(declare-fun mapIsEmpty!10641 () Bool)

(declare-fun mapRes!10641 () Bool)

(assert (=> mapIsEmpty!10641 mapRes!10641))

(declare-fun b!238710 () Bool)

(declare-fun e!154988 () Bool)

(assert (=> b!238710 (= e!154988 tp_is_empty!6273)))

(declare-fun b!238711 () Bool)

(declare-fun e!154982 () Bool)

(assert (=> b!238711 (= e!154982 (and e!154988 mapRes!10641))))

(declare-fun condMapEmpty!10641 () Bool)

(declare-fun mapDefault!10641 () ValueCell!2793)

(assert (=> b!238711 (= condMapEmpty!10641 (= (arr!5614 (_values!4411 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2793)) mapDefault!10641)))))

(declare-fun e!154985 () Bool)

(declare-fun array_inv!3713 (array!11827) Bool)

(declare-fun array_inv!3714 (array!11825) Bool)

(assert (=> b!238712 (= e!154985 (and tp!22436 tp_is_empty!6273 (array_inv!3713 (_keys!6530 thiss!1504)) (array_inv!3714 (_values!4411 thiss!1504)) e!154982))))

(declare-fun b!238713 () Bool)

(declare-fun res!116988 () Bool)

(assert (=> b!238713 (=> (not res!116988) (not e!154991))))

(declare-fun arrayContainsKey!0 (array!11827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238713 (= res!116988 (arrayContainsKey!0 (_keys!6530 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10641 () Bool)

(declare-fun tp!22437 () Bool)

(assert (=> mapNonEmpty!10641 (= mapRes!10641 (and tp!22437 e!154986))))

(declare-fun mapRest!10641 () (Array (_ BitVec 32) ValueCell!2793))

(declare-fun mapKey!10641 () (_ BitVec 32))

(declare-fun mapValue!10641 () ValueCell!2793)

(assert (=> mapNonEmpty!10641 (= (arr!5614 (_values!4411 thiss!1504)) (store mapRest!10641 mapKey!10641 mapValue!10641))))

(declare-fun b!238715 () Bool)

(assert (=> b!238715 (= e!154989 (not call!22194))))

(declare-fun b!238716 () Bool)

(declare-fun res!116986 () Bool)

(assert (=> b!238716 (=> (not res!116986) (not e!154992))))

(declare-fun call!22193 () Bool)

(assert (=> b!238716 (= res!116986 call!22193)))

(assert (=> b!238716 (= e!154984 e!154992)))

(declare-fun b!238717 () Bool)

(declare-fun e!154980 () Bool)

(declare-fun e!154983 () Bool)

(assert (=> b!238717 (= e!154980 e!154983)))

(declare-fun res!116990 () Bool)

(assert (=> b!238717 (=> (not res!116990) (not e!154983))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238717 (= res!116990 (or (= lt!120645 (MissingZero!1021 index!297)) (= lt!120645 (MissingVacant!1021 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11827 (_ BitVec 32)) SeekEntryResult!1021)

(assert (=> b!238717 (= lt!120645 (seekEntryOrOpen!0 key!932 (_keys!6530 thiss!1504) (mask!10466 thiss!1504)))))

(declare-fun b!238718 () Bool)

(assert (=> b!238718 (= e!154987 e!154989)))

(declare-fun res!116987 () Bool)

(assert (=> b!238718 (= res!116987 call!22193)))

(assert (=> b!238718 (=> (not res!116987) (not e!154989))))

(declare-fun b!238719 () Bool)

(declare-fun res!116983 () Bool)

(assert (=> b!238719 (=> (not res!116983) (not e!154980))))

(assert (=> b!238719 (= res!116983 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238720 () Bool)

(assert (=> b!238720 (= e!154983 e!154991)))

(declare-fun res!116985 () Bool)

(assert (=> b!238720 (=> (not res!116985) (not e!154991))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!238720 (= res!116985 (inRange!0 index!297 (mask!10466 thiss!1504)))))

(declare-fun lt!120642 () Unit!7322)

(assert (=> b!238720 (= lt!120642 e!154981)))

(declare-fun c!39803 () Bool)

(declare-datatypes ((tuple2!4688 0))(
  ( (tuple2!4689 (_1!2355 (_ BitVec 64)) (_2!2355 V!8011)) )
))
(declare-datatypes ((List!3586 0))(
  ( (Nil!3583) (Cons!3582 (h!4238 tuple2!4688) (t!8581 List!3586)) )
))
(declare-datatypes ((ListLongMap!3601 0))(
  ( (ListLongMap!3602 (toList!1816 List!3586)) )
))
(declare-fun contains!1704 (ListLongMap!3601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1344 (array!11827 array!11825 (_ BitVec 32) (_ BitVec 32) V!8011 V!8011 (_ BitVec 32) Int) ListLongMap!3601)

(assert (=> b!238720 (= c!39803 (contains!1704 (getCurrentListMap!1344 (_keys!6530 thiss!1504) (_values!4411 thiss!1504) (mask!10466 thiss!1504) (extraKeys!4165 thiss!1504) (zeroValue!4269 thiss!1504) (minValue!4269 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4428 thiss!1504)) key!932))))

(declare-fun b!238721 () Bool)

(declare-fun Unit!7324 () Unit!7322)

(assert (=> b!238721 (= e!154981 Unit!7324)))

(declare-fun lt!120643 () Unit!7322)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!318 (array!11827 array!11825 (_ BitVec 32) (_ BitVec 32) V!8011 V!8011 (_ BitVec 64) Int) Unit!7322)

(assert (=> b!238721 (= lt!120643 (lemmaInListMapThenSeekEntryOrOpenFindsIt!318 (_keys!6530 thiss!1504) (_values!4411 thiss!1504) (mask!10466 thiss!1504) (extraKeys!4165 thiss!1504) (zeroValue!4269 thiss!1504) (minValue!4269 thiss!1504) key!932 (defaultEntry!4428 thiss!1504)))))

(assert (=> b!238721 false))

(declare-fun bm!22190 () Bool)

(assert (=> bm!22190 (= call!22194 (arrayContainsKey!0 (_keys!6530 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22191 () Bool)

(assert (=> bm!22191 (= call!22193 (inRange!0 (ite c!39802 (index!6254 lt!120645) (index!6257 lt!120645)) (mask!10466 thiss!1504)))))

(declare-fun b!238722 () Bool)

(assert (=> b!238722 (= e!154987 ((_ is Undefined!1021) lt!120645))))

(declare-fun b!238714 () Bool)

(declare-fun res!116989 () Bool)

(assert (=> b!238714 (=> (not res!116989) (not e!154992))))

(assert (=> b!238714 (= res!116989 (= (select (arr!5615 (_keys!6530 thiss!1504)) (index!6254 lt!120645)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!116984 () Bool)

(assert (=> start!22908 (=> (not res!116984) (not e!154980))))

(declare-fun valid!1375 (LongMapFixedSize!3486) Bool)

(assert (=> start!22908 (= res!116984 (valid!1375 thiss!1504))))

(assert (=> start!22908 e!154980))

(assert (=> start!22908 e!154985))

(assert (=> start!22908 true))

(assert (= (and start!22908 res!116984) b!238719))

(assert (= (and b!238719 res!116983) b!238717))

(assert (= (and b!238717 res!116990) b!238720))

(assert (= (and b!238720 c!39803) b!238721))

(assert (= (and b!238720 (not c!39803)) b!238704))

(assert (= (and b!238704 c!39802) b!238716))

(assert (= (and b!238704 (not c!39802)) b!238709))

(assert (= (and b!238716 res!116986) b!238714))

(assert (= (and b!238714 res!116989) b!238705))

(assert (= (and b!238709 c!39801) b!238718))

(assert (= (and b!238709 (not c!39801)) b!238722))

(assert (= (and b!238718 res!116987) b!238706))

(assert (= (and b!238706 res!116982) b!238715))

(assert (= (or b!238716 b!238718) bm!22191))

(assert (= (or b!238705 b!238715) bm!22190))

(assert (= (and b!238720 res!116985) b!238713))

(assert (= (and b!238713 res!116988) b!238707))

(assert (= (and b!238711 condMapEmpty!10641) mapIsEmpty!10641))

(assert (= (and b!238711 (not condMapEmpty!10641)) mapNonEmpty!10641))

(assert (= (and mapNonEmpty!10641 ((_ is ValueCellFull!2793) mapValue!10641)) b!238708))

(assert (= (and b!238711 ((_ is ValueCellFull!2793) mapDefault!10641)) b!238710))

(assert (= b!238712 b!238711))

(assert (= start!22908 b!238712))

(declare-fun m!259139 () Bool)

(assert (=> b!238712 m!259139))

(declare-fun m!259141 () Bool)

(assert (=> b!238712 m!259141))

(declare-fun m!259143 () Bool)

(assert (=> start!22908 m!259143))

(declare-fun m!259145 () Bool)

(assert (=> bm!22190 m!259145))

(declare-fun m!259147 () Bool)

(assert (=> b!238717 m!259147))

(declare-fun m!259149 () Bool)

(assert (=> b!238704 m!259149))

(declare-fun m!259151 () Bool)

(assert (=> b!238720 m!259151))

(declare-fun m!259153 () Bool)

(assert (=> b!238720 m!259153))

(assert (=> b!238720 m!259153))

(declare-fun m!259155 () Bool)

(assert (=> b!238720 m!259155))

(declare-fun m!259157 () Bool)

(assert (=> b!238714 m!259157))

(declare-fun m!259159 () Bool)

(assert (=> bm!22191 m!259159))

(declare-fun m!259161 () Bool)

(assert (=> b!238721 m!259161))

(declare-fun m!259163 () Bool)

(assert (=> b!238706 m!259163))

(declare-fun m!259165 () Bool)

(assert (=> b!238707 m!259165))

(assert (=> b!238713 m!259145))

(declare-fun m!259167 () Bool)

(assert (=> mapNonEmpty!10641 m!259167))

(check-sat (not b!238704) (not b!238721) (not bm!22191) (not b!238713) (not b!238707) b_and!13377 (not bm!22190) (not b!238717) (not start!22908) tp_is_empty!6273 (not b_next!6411) (not b!238720) (not b!238712) (not mapNonEmpty!10641))
(check-sat b_and!13377 (not b_next!6411))
