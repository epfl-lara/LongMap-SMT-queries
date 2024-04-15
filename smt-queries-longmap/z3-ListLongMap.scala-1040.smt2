; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21926 () Bool)

(assert start!21926)

(declare-fun b!222797 () Bool)

(declare-fun b_free!5989 () Bool)

(declare-fun b_next!5989 () Bool)

(assert (=> b!222797 (= b_free!5989 (not b_next!5989))))

(declare-fun tp!21109 () Bool)

(declare-fun b_and!12861 () Bool)

(assert (=> b!222797 (= tp!21109 b_and!12861)))

(declare-fun b!222779 () Bool)

(declare-fun e!144769 () Bool)

(declare-fun e!144768 () Bool)

(assert (=> b!222779 (= e!144769 e!144768)))

(declare-fun res!109398 () Bool)

(assert (=> b!222779 (=> (not res!109398) (not e!144768))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7449 0))(
  ( (V!7450 (val!2970 Int)) )
))
(declare-datatypes ((ValueCell!2582 0))(
  ( (ValueCellFull!2582 (v!4984 V!7449)) (EmptyCell!2582) )
))
(declare-datatypes ((array!10937 0))(
  ( (array!10938 (arr!5187 (Array (_ BitVec 32) ValueCell!2582)) (size!5521 (_ BitVec 32))) )
))
(declare-datatypes ((array!10939 0))(
  ( (array!10940 (arr!5188 (Array (_ BitVec 32) (_ BitVec 64))) (size!5522 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3064 0))(
  ( (LongMapFixedSize!3065 (defaultEntry!4191 Int) (mask!10014 (_ BitVec 32)) (extraKeys!3928 (_ BitVec 32)) (zeroValue!4032 V!7449) (minValue!4032 V!7449) (_size!1581 (_ BitVec 32)) (_keys!6244 array!10939) (_values!4174 array!10937) (_vacant!1581 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3064)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222779 (= res!109398 (inRange!0 index!297 (mask!10014 thiss!1504)))))

(declare-datatypes ((Unit!6632 0))(
  ( (Unit!6633) )
))
(declare-fun lt!112599 () Unit!6632)

(declare-fun e!144770 () Unit!6632)

(assert (=> b!222779 (= lt!112599 e!144770)))

(declare-fun c!37004 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4372 0))(
  ( (tuple2!4373 (_1!2197 (_ BitVec 64)) (_2!2197 V!7449)) )
))
(declare-datatypes ((List!3295 0))(
  ( (Nil!3292) (Cons!3291 (h!3939 tuple2!4372) (t!8245 List!3295)) )
))
(declare-datatypes ((ListLongMap!3275 0))(
  ( (ListLongMap!3276 (toList!1653 List!3295)) )
))
(declare-fun contains!1511 (ListLongMap!3275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1162 (array!10939 array!10937 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 32) Int) ListLongMap!3275)

(assert (=> b!222779 (= c!37004 (contains!1511 (getCurrentListMap!1162 (_keys!6244 thiss!1504) (_values!4174 thiss!1504) (mask!10014 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4191 thiss!1504)) key!932))))

(declare-fun b!222780 () Bool)

(declare-fun e!144774 () Bool)

(declare-fun e!144761 () Bool)

(assert (=> b!222780 (= e!144774 e!144761)))

(declare-fun res!109389 () Bool)

(assert (=> b!222780 (=> res!109389 e!144761)))

(assert (=> b!222780 (= res!109389 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222781 () Bool)

(declare-fun e!144764 () Unit!6632)

(declare-fun Unit!6634 () Unit!6632)

(assert (=> b!222781 (= e!144764 Unit!6634)))

(declare-fun lt!112595 () Unit!6632)

(declare-fun lemmaArrayContainsKeyThenInListMap!64 (array!10939 array!10937 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 64) (_ BitVec 32) Int) Unit!6632)

(assert (=> b!222781 (= lt!112595 (lemmaArrayContainsKeyThenInListMap!64 (_keys!6244 thiss!1504) (_values!4174 thiss!1504) (mask!10014 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4191 thiss!1504)))))

(assert (=> b!222781 false))

(declare-fun b!222782 () Bool)

(declare-fun e!144759 () Bool)

(declare-datatypes ((SeekEntryResult!838 0))(
  ( (MissingZero!838 (index!5522 (_ BitVec 32))) (Found!838 (index!5523 (_ BitVec 32))) (Intermediate!838 (undefined!1650 Bool) (index!5524 (_ BitVec 32)) (x!23073 (_ BitVec 32))) (Undefined!838) (MissingVacant!838 (index!5525 (_ BitVec 32))) )
))
(declare-fun lt!112598 () SeekEntryResult!838)

(get-info :version)

(assert (=> b!222782 (= e!144759 ((_ is Undefined!838) lt!112598))))

(declare-fun b!222783 () Bool)

(declare-fun res!109409 () Bool)

(declare-fun e!144757 () Bool)

(assert (=> b!222783 (=> res!109409 e!144757)))

(declare-datatypes ((List!3296 0))(
  ( (Nil!3293) (Cons!3292 (h!3940 (_ BitVec 64)) (t!8246 List!3296)) )
))
(declare-fun arrayNoDuplicates!0 (array!10939 (_ BitVec 32) List!3296) Bool)

(assert (=> b!222783 (= res!109409 (not (arrayNoDuplicates!0 (_keys!6244 thiss!1504) #b00000000000000000000000000000000 Nil!3293)))))

(declare-fun b!222784 () Bool)

(declare-fun res!109399 () Bool)

(assert (=> b!222784 (=> res!109399 e!144757)))

(assert (=> b!222784 (= res!109399 e!144774)))

(declare-fun res!109397 () Bool)

(assert (=> b!222784 (=> (not res!109397) (not e!144774))))

(declare-fun e!144762 () Bool)

(assert (=> b!222784 (= res!109397 e!144762)))

(declare-fun res!109393 () Bool)

(assert (=> b!222784 (=> res!109393 e!144762)))

(assert (=> b!222784 (= res!109393 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222785 () Bool)

(declare-fun res!109402 () Bool)

(assert (=> b!222785 (=> res!109402 e!144757)))

(assert (=> b!222785 (= res!109402 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5522 (_keys!6244 thiss!1504)))))))

(declare-fun b!222786 () Bool)

(declare-fun res!109404 () Bool)

(declare-fun e!144763 () Bool)

(assert (=> b!222786 (=> (not res!109404) (not e!144763))))

(assert (=> b!222786 (= res!109404 (= (select (arr!5188 (_keys!6244 thiss!1504)) (index!5522 lt!112598)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222787 () Bool)

(declare-fun e!144766 () Bool)

(declare-fun call!20778 () Bool)

(assert (=> b!222787 (= e!144766 (not call!20778))))

(declare-fun b!222788 () Bool)

(assert (=> b!222788 (= e!144757 true)))

(declare-fun res!109407 () Bool)

(declare-fun e!144758 () Bool)

(assert (=> start!21926 (=> (not res!109407) (not e!144758))))

(declare-fun valid!1250 (LongMapFixedSize!3064) Bool)

(assert (=> start!21926 (= res!109407 (valid!1250 thiss!1504))))

(assert (=> start!21926 e!144758))

(declare-fun e!144760 () Bool)

(assert (=> start!21926 e!144760))

(assert (=> start!21926 true))

(declare-fun b!222789 () Bool)

(assert (=> b!222789 (= e!144759 e!144766)))

(declare-fun res!109394 () Bool)

(declare-fun call!20777 () Bool)

(assert (=> b!222789 (= res!109394 call!20777)))

(assert (=> b!222789 (=> (not res!109394) (not e!144766))))

(declare-fun b!222790 () Bool)

(declare-fun contains!1512 (List!3296 (_ BitVec 64)) Bool)

(assert (=> b!222790 (= e!144761 (contains!1512 Nil!3293 key!932))))

(declare-fun b!222791 () Bool)

(assert (=> b!222791 (= e!144763 (not call!20778))))

(declare-fun b!222792 () Bool)

(assert (=> b!222792 (= e!144768 false)))

(declare-fun lt!112596 () Bool)

(assert (=> b!222792 (= lt!112596 e!144757)))

(declare-fun res!109406 () Bool)

(assert (=> b!222792 (=> res!109406 e!144757)))

(assert (=> b!222792 (= res!109406 (or (bvsge (size!5522 (_keys!6244 thiss!1504)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!5522 (_keys!6244 thiss!1504)))))))

(declare-fun lt!112597 () Unit!6632)

(assert (=> b!222792 (= lt!112597 e!144764)))

(declare-fun c!37005 () Bool)

(declare-fun lt!112593 () Bool)

(assert (=> b!222792 (= c!37005 lt!112593)))

(declare-fun arrayContainsKey!0 (array!10939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222792 (= lt!112593 (arrayContainsKey!0 (_keys!6244 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222793 () Bool)

(declare-fun res!109400 () Bool)

(assert (=> b!222793 (=> res!109400 e!144757)))

(assert (=> b!222793 (= res!109400 (contains!1512 Nil!3293 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!9946 () Bool)

(declare-fun mapRes!9946 () Bool)

(assert (=> mapIsEmpty!9946 mapRes!9946))

(declare-fun b!222794 () Bool)

(declare-fun res!109405 () Bool)

(assert (=> b!222794 (=> res!109405 e!144757)))

(assert (=> b!222794 (= res!109405 lt!112593)))

(declare-fun b!222795 () Bool)

(declare-fun e!144772 () Bool)

(declare-fun tp_is_empty!5851 () Bool)

(assert (=> b!222795 (= e!144772 tp_is_empty!5851)))

(declare-fun b!222796 () Bool)

(declare-fun Unit!6635 () Unit!6632)

(assert (=> b!222796 (= e!144764 Unit!6635)))

(declare-fun e!144771 () Bool)

(declare-fun array_inv!3419 (array!10939) Bool)

(declare-fun array_inv!3420 (array!10937) Bool)

(assert (=> b!222797 (= e!144760 (and tp!21109 tp_is_empty!5851 (array_inv!3419 (_keys!6244 thiss!1504)) (array_inv!3420 (_values!4174 thiss!1504)) e!144771))))

(declare-fun b!222798 () Bool)

(declare-fun res!109401 () Bool)

(assert (=> b!222798 (=> res!109401 e!144757)))

(assert (=> b!222798 (= res!109401 (not (contains!1512 Nil!3293 key!932)))))

(declare-fun b!222799 () Bool)

(declare-fun res!109390 () Bool)

(assert (=> b!222799 (=> (not res!109390) (not e!144763))))

(assert (=> b!222799 (= res!109390 call!20777)))

(declare-fun e!144767 () Bool)

(assert (=> b!222799 (= e!144767 e!144763)))

(declare-fun b!222800 () Bool)

(assert (=> b!222800 (= e!144758 e!144769)))

(declare-fun res!109403 () Bool)

(assert (=> b!222800 (=> (not res!109403) (not e!144769))))

(assert (=> b!222800 (= res!109403 (or (= lt!112598 (MissingZero!838 index!297)) (= lt!112598 (MissingVacant!838 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10939 (_ BitVec 32)) SeekEntryResult!838)

(assert (=> b!222800 (= lt!112598 (seekEntryOrOpen!0 key!932 (_keys!6244 thiss!1504) (mask!10014 thiss!1504)))))

(declare-fun mapNonEmpty!9946 () Bool)

(declare-fun tp!21108 () Bool)

(assert (=> mapNonEmpty!9946 (= mapRes!9946 (and tp!21108 e!144772))))

(declare-fun mapKey!9946 () (_ BitVec 32))

(declare-fun mapValue!9946 () ValueCell!2582)

(declare-fun mapRest!9946 () (Array (_ BitVec 32) ValueCell!2582))

(assert (=> mapNonEmpty!9946 (= (arr!5187 (_values!4174 thiss!1504)) (store mapRest!9946 mapKey!9946 mapValue!9946))))

(declare-fun b!222801 () Bool)

(declare-fun res!109396 () Bool)

(assert (=> b!222801 (=> (not res!109396) (not e!144758))))

(assert (=> b!222801 (= res!109396 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222802 () Bool)

(declare-fun res!109392 () Bool)

(assert (=> b!222802 (=> res!109392 e!144757)))

(declare-fun noDuplicate!74 (List!3296) Bool)

(assert (=> b!222802 (= res!109392 (not (noDuplicate!74 Nil!3293)))))

(declare-fun b!222803 () Bool)

(declare-fun c!37006 () Bool)

(assert (=> b!222803 (= c!37006 ((_ is MissingVacant!838) lt!112598))))

(assert (=> b!222803 (= e!144767 e!144759)))

(declare-fun b!222804 () Bool)

(declare-fun res!109408 () Bool)

(assert (=> b!222804 (=> res!109408 e!144757)))

(assert (=> b!222804 (= res!109408 (contains!1512 Nil!3293 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222805 () Bool)

(declare-fun e!144773 () Bool)

(assert (=> b!222805 (= e!144773 tp_is_empty!5851)))

(declare-fun b!222806 () Bool)

(declare-fun res!109391 () Bool)

(assert (=> b!222806 (=> res!109391 e!144757)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!222806 (= res!109391 (not (validKeyInArray!0 key!932)))))

(declare-fun bm!20774 () Bool)

(declare-fun c!37003 () Bool)

(assert (=> bm!20774 (= call!20777 (inRange!0 (ite c!37003 (index!5522 lt!112598) (index!5525 lt!112598)) (mask!10014 thiss!1504)))))

(declare-fun b!222807 () Bool)

(assert (=> b!222807 (= e!144771 (and e!144773 mapRes!9946))))

(declare-fun condMapEmpty!9946 () Bool)

(declare-fun mapDefault!9946 () ValueCell!2582)

(assert (=> b!222807 (= condMapEmpty!9946 (= (arr!5187 (_values!4174 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2582)) mapDefault!9946)))))

(declare-fun b!222808 () Bool)

(assert (=> b!222808 (= e!144762 (not (contains!1512 Nil!3293 key!932)))))

(declare-fun b!222809 () Bool)

(declare-fun lt!112600 () Unit!6632)

(assert (=> b!222809 (= e!144770 lt!112600)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!222 (array!10939 array!10937 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 64) Int) Unit!6632)

(assert (=> b!222809 (= lt!112600 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!222 (_keys!6244 thiss!1504) (_values!4174 thiss!1504) (mask!10014 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) key!932 (defaultEntry!4191 thiss!1504)))))

(assert (=> b!222809 (= c!37003 ((_ is MissingZero!838) lt!112598))))

(assert (=> b!222809 e!144767))

(declare-fun b!222810 () Bool)

(declare-fun res!109395 () Bool)

(assert (=> b!222810 (= res!109395 (= (select (arr!5188 (_keys!6244 thiss!1504)) (index!5525 lt!112598)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222810 (=> (not res!109395) (not e!144766))))

(declare-fun b!222811 () Bool)

(declare-fun Unit!6636 () Unit!6632)

(assert (=> b!222811 (= e!144770 Unit!6636)))

(declare-fun lt!112594 () Unit!6632)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!221 (array!10939 array!10937 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 64) Int) Unit!6632)

(assert (=> b!222811 (= lt!112594 (lemmaInListMapThenSeekEntryOrOpenFindsIt!221 (_keys!6244 thiss!1504) (_values!4174 thiss!1504) (mask!10014 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) key!932 (defaultEntry!4191 thiss!1504)))))

(assert (=> b!222811 false))

(declare-fun bm!20775 () Bool)

(assert (=> bm!20775 (= call!20778 (arrayContainsKey!0 (_keys!6244 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!21926 res!109407) b!222801))

(assert (= (and b!222801 res!109396) b!222800))

(assert (= (and b!222800 res!109403) b!222779))

(assert (= (and b!222779 c!37004) b!222811))

(assert (= (and b!222779 (not c!37004)) b!222809))

(assert (= (and b!222809 c!37003) b!222799))

(assert (= (and b!222809 (not c!37003)) b!222803))

(assert (= (and b!222799 res!109390) b!222786))

(assert (= (and b!222786 res!109404) b!222791))

(assert (= (and b!222803 c!37006) b!222789))

(assert (= (and b!222803 (not c!37006)) b!222782))

(assert (= (and b!222789 res!109394) b!222810))

(assert (= (and b!222810 res!109395) b!222787))

(assert (= (or b!222799 b!222789) bm!20774))

(assert (= (or b!222791 b!222787) bm!20775))

(assert (= (and b!222779 res!109398) b!222792))

(assert (= (and b!222792 c!37005) b!222781))

(assert (= (and b!222792 (not c!37005)) b!222796))

(assert (= (and b!222792 (not res!109406)) b!222802))

(assert (= (and b!222802 (not res!109392)) b!222793))

(assert (= (and b!222793 (not res!109400)) b!222804))

(assert (= (and b!222804 (not res!109408)) b!222784))

(assert (= (and b!222784 (not res!109393)) b!222808))

(assert (= (and b!222784 res!109397) b!222780))

(assert (= (and b!222780 (not res!109389)) b!222790))

(assert (= (and b!222784 (not res!109399)) b!222783))

(assert (= (and b!222783 (not res!109409)) b!222785))

(assert (= (and b!222785 (not res!109402)) b!222806))

(assert (= (and b!222806 (not res!109391)) b!222794))

(assert (= (and b!222794 (not res!109405)) b!222798))

(assert (= (and b!222798 (not res!109401)) b!222788))

(assert (= (and b!222807 condMapEmpty!9946) mapIsEmpty!9946))

(assert (= (and b!222807 (not condMapEmpty!9946)) mapNonEmpty!9946))

(assert (= (and mapNonEmpty!9946 ((_ is ValueCellFull!2582) mapValue!9946)) b!222795))

(assert (= (and b!222807 ((_ is ValueCellFull!2582) mapDefault!9946)) b!222805))

(assert (= b!222797 b!222807))

(assert (= start!21926 b!222797))

(declare-fun m!246169 () Bool)

(assert (=> b!222797 m!246169))

(declare-fun m!246171 () Bool)

(assert (=> b!222797 m!246171))

(declare-fun m!246173 () Bool)

(assert (=> b!222798 m!246173))

(declare-fun m!246175 () Bool)

(assert (=> bm!20775 m!246175))

(declare-fun m!246177 () Bool)

(assert (=> b!222779 m!246177))

(declare-fun m!246179 () Bool)

(assert (=> b!222779 m!246179))

(assert (=> b!222779 m!246179))

(declare-fun m!246181 () Bool)

(assert (=> b!222779 m!246181))

(declare-fun m!246183 () Bool)

(assert (=> b!222809 m!246183))

(declare-fun m!246185 () Bool)

(assert (=> b!222793 m!246185))

(declare-fun m!246187 () Bool)

(assert (=> b!222800 m!246187))

(assert (=> b!222808 m!246173))

(declare-fun m!246189 () Bool)

(assert (=> start!21926 m!246189))

(declare-fun m!246191 () Bool)

(assert (=> b!222786 m!246191))

(declare-fun m!246193 () Bool)

(assert (=> b!222783 m!246193))

(assert (=> b!222790 m!246173))

(declare-fun m!246195 () Bool)

(assert (=> b!222810 m!246195))

(declare-fun m!246197 () Bool)

(assert (=> bm!20774 m!246197))

(declare-fun m!246199 () Bool)

(assert (=> b!222781 m!246199))

(declare-fun m!246201 () Bool)

(assert (=> b!222802 m!246201))

(declare-fun m!246203 () Bool)

(assert (=> b!222804 m!246203))

(declare-fun m!246205 () Bool)

(assert (=> mapNonEmpty!9946 m!246205))

(assert (=> b!222792 m!246175))

(declare-fun m!246207 () Bool)

(assert (=> b!222806 m!246207))

(declare-fun m!246209 () Bool)

(assert (=> b!222811 m!246209))

(check-sat (not b!222797) (not b!222779) (not b!222802) (not b!222811) (not mapNonEmpty!9946) (not bm!20775) (not bm!20774) (not b!222808) (not b!222783) (not b!222781) (not b!222790) (not b!222804) tp_is_empty!5851 (not start!21926) (not b!222793) b_and!12861 (not b!222792) (not b!222806) (not b!222800) (not b!222798) (not b!222809) (not b_next!5989))
(check-sat b_and!12861 (not b_next!5989))
