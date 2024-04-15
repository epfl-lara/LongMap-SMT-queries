; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75544 () Bool)

(assert start!75544)

(declare-fun b!888577 () Bool)

(declare-fun b_free!15589 () Bool)

(declare-fun b_next!15589 () Bool)

(assert (=> b!888577 (= b_free!15589 (not b_next!15589))))

(declare-fun tp!54722 () Bool)

(declare-fun b_and!25803 () Bool)

(assert (=> b!888577 (= tp!54722 b_and!25803)))

(declare-fun b!888571 () Bool)

(declare-fun e!495180 () Bool)

(declare-fun e!495177 () Bool)

(declare-fun mapRes!28416 () Bool)

(assert (=> b!888571 (= e!495180 (and e!495177 mapRes!28416))))

(declare-fun condMapEmpty!28416 () Bool)

(declare-datatypes ((array!51789 0))(
  ( (array!51790 (arr!24905 (Array (_ BitVec 32) (_ BitVec 64))) (size!25349 (_ BitVec 32))) )
))
(declare-datatypes ((V!28855 0))(
  ( (V!28856 (val!9009 Int)) )
))
(declare-datatypes ((ValueCell!8477 0))(
  ( (ValueCellFull!8477 (v!11478 V!28855)) (EmptyCell!8477) )
))
(declare-datatypes ((array!51791 0))(
  ( (array!51792 (arr!24906 (Array (_ BitVec 32) ValueCell!8477)) (size!25350 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3970 0))(
  ( (LongMapFixedSize!3971 (defaultEntry!5182 Int) (mask!25607 (_ BitVec 32)) (extraKeys!4876 (_ BitVec 32)) (zeroValue!4980 V!28855) (minValue!4980 V!28855) (_size!2040 (_ BitVec 32)) (_keys!9858 array!51789) (_values!5167 array!51791) (_vacant!2040 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3970)

(declare-fun mapDefault!28416 () ValueCell!8477)

(assert (=> b!888571 (= condMapEmpty!28416 (= (arr!24906 (_values!5167 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8477)) mapDefault!28416)))))

(declare-fun b!888572 () Bool)

(declare-fun e!495179 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!446 0))(
  ( (Some!445 (v!11479 V!28855)) (None!444) )
))
(declare-fun isDefined!321 (Option!446) Bool)

(declare-datatypes ((tuple2!11958 0))(
  ( (tuple2!11959 (_1!5990 (_ BitVec 64)) (_2!5990 V!28855)) )
))
(declare-datatypes ((List!17701 0))(
  ( (Nil!17698) (Cons!17697 (h!18828 tuple2!11958) (t!24991 List!17701)) )
))
(declare-fun getValueByKey!440 (List!17701 (_ BitVec 64)) Option!446)

(declare-datatypes ((ListLongMap!10645 0))(
  ( (ListLongMap!10646 (toList!5338 List!17701)) )
))
(declare-fun map!12102 (LongMapFixedSize!3970) ListLongMap!10645)

(assert (=> b!888572 (= e!495179 (not (isDefined!321 (getValueByKey!440 (toList!5338 (map!12102 thiss!1181)) key!785))))))

(declare-fun res!602384 () Bool)

(assert (=> start!75544 (=> (not res!602384) (not e!495179))))

(declare-fun valid!1554 (LongMapFixedSize!3970) Bool)

(assert (=> start!75544 (= res!602384 (valid!1554 thiss!1181))))

(assert (=> start!75544 e!495179))

(declare-fun e!495178 () Bool)

(assert (=> start!75544 e!495178))

(assert (=> start!75544 true))

(declare-fun b!888573 () Bool)

(declare-fun res!602383 () Bool)

(assert (=> b!888573 (=> (not res!602383) (not e!495179))))

(assert (=> b!888573 (= res!602383 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888574 () Bool)

(declare-fun e!495176 () Bool)

(declare-fun tp_is_empty!17917 () Bool)

(assert (=> b!888574 (= e!495176 tp_is_empty!17917)))

(declare-fun b!888575 () Bool)

(declare-fun res!602385 () Bool)

(assert (=> b!888575 (=> (not res!602385) (not e!495179))))

(declare-fun contains!4305 (LongMapFixedSize!3970 (_ BitVec 64)) Bool)

(assert (=> b!888575 (= res!602385 (contains!4305 thiss!1181 key!785))))

(declare-fun b!888576 () Bool)

(assert (=> b!888576 (= e!495177 tp_is_empty!17917)))

(declare-fun mapNonEmpty!28416 () Bool)

(declare-fun tp!54723 () Bool)

(assert (=> mapNonEmpty!28416 (= mapRes!28416 (and tp!54723 e!495176))))

(declare-fun mapRest!28416 () (Array (_ BitVec 32) ValueCell!8477))

(declare-fun mapKey!28416 () (_ BitVec 32))

(declare-fun mapValue!28416 () ValueCell!8477)

(assert (=> mapNonEmpty!28416 (= (arr!24906 (_values!5167 thiss!1181)) (store mapRest!28416 mapKey!28416 mapValue!28416))))

(declare-fun array_inv!19640 (array!51789) Bool)

(declare-fun array_inv!19641 (array!51791) Bool)

(assert (=> b!888577 (= e!495178 (and tp!54722 tp_is_empty!17917 (array_inv!19640 (_keys!9858 thiss!1181)) (array_inv!19641 (_values!5167 thiss!1181)) e!495180))))

(declare-fun mapIsEmpty!28416 () Bool)

(assert (=> mapIsEmpty!28416 mapRes!28416))

(assert (= (and start!75544 res!602384) b!888573))

(assert (= (and b!888573 res!602383) b!888575))

(assert (= (and b!888575 res!602385) b!888572))

(assert (= (and b!888571 condMapEmpty!28416) mapIsEmpty!28416))

(assert (= (and b!888571 (not condMapEmpty!28416)) mapNonEmpty!28416))

(get-info :version)

(assert (= (and mapNonEmpty!28416 ((_ is ValueCellFull!8477) mapValue!28416)) b!888574))

(assert (= (and b!888571 ((_ is ValueCellFull!8477) mapDefault!28416)) b!888576))

(assert (= b!888577 b!888571))

(assert (= start!75544 b!888577))

(declare-fun m!827245 () Bool)

(assert (=> b!888572 m!827245))

(declare-fun m!827247 () Bool)

(assert (=> b!888572 m!827247))

(assert (=> b!888572 m!827247))

(declare-fun m!827249 () Bool)

(assert (=> b!888572 m!827249))

(declare-fun m!827251 () Bool)

(assert (=> b!888577 m!827251))

(declare-fun m!827253 () Bool)

(assert (=> b!888577 m!827253))

(declare-fun m!827255 () Bool)

(assert (=> b!888575 m!827255))

(declare-fun m!827257 () Bool)

(assert (=> mapNonEmpty!28416 m!827257))

(declare-fun m!827259 () Bool)

(assert (=> start!75544 m!827259))

(check-sat tp_is_empty!17917 (not b!888577) (not mapNonEmpty!28416) (not b!888572) b_and!25803 (not b!888575) (not b_next!15589) (not start!75544))
(check-sat b_and!25803 (not b_next!15589))
(get-model)

(declare-fun d!109905 () Bool)

(declare-fun isEmpty!682 (Option!446) Bool)

(assert (=> d!109905 (= (isDefined!321 (getValueByKey!440 (toList!5338 (map!12102 thiss!1181)) key!785)) (not (isEmpty!682 (getValueByKey!440 (toList!5338 (map!12102 thiss!1181)) key!785))))))

(declare-fun bs!24900 () Bool)

(assert (= bs!24900 d!109905))

(assert (=> bs!24900 m!827247))

(declare-fun m!827293 () Bool)

(assert (=> bs!24900 m!827293))

(assert (=> b!888572 d!109905))

(declare-fun d!109907 () Bool)

(declare-fun c!93840 () Bool)

(assert (=> d!109907 (= c!93840 (and ((_ is Cons!17697) (toList!5338 (map!12102 thiss!1181))) (= (_1!5990 (h!18828 (toList!5338 (map!12102 thiss!1181)))) key!785)))))

(declare-fun e!495222 () Option!446)

(assert (=> d!109907 (= (getValueByKey!440 (toList!5338 (map!12102 thiss!1181)) key!785) e!495222)))

(declare-fun b!888628 () Bool)

(assert (=> b!888628 (= e!495222 (Some!445 (_2!5990 (h!18828 (toList!5338 (map!12102 thiss!1181))))))))

(declare-fun b!888629 () Bool)

(declare-fun e!495223 () Option!446)

(assert (=> b!888629 (= e!495222 e!495223)))

(declare-fun c!93841 () Bool)

(assert (=> b!888629 (= c!93841 (and ((_ is Cons!17697) (toList!5338 (map!12102 thiss!1181))) (not (= (_1!5990 (h!18828 (toList!5338 (map!12102 thiss!1181)))) key!785))))))

(declare-fun b!888630 () Bool)

(assert (=> b!888630 (= e!495223 (getValueByKey!440 (t!24991 (toList!5338 (map!12102 thiss!1181))) key!785))))

(declare-fun b!888631 () Bool)

(assert (=> b!888631 (= e!495223 None!444)))

(assert (= (and d!109907 c!93840) b!888628))

(assert (= (and d!109907 (not c!93840)) b!888629))

(assert (= (and b!888629 c!93841) b!888630))

(assert (= (and b!888629 (not c!93841)) b!888631))

(declare-fun m!827295 () Bool)

(assert (=> b!888630 m!827295))

(assert (=> b!888572 d!109907))

(declare-fun d!109909 () Bool)

(declare-fun getCurrentListMap!2568 (array!51789 array!51791 (_ BitVec 32) (_ BitVec 32) V!28855 V!28855 (_ BitVec 32) Int) ListLongMap!10645)

(assert (=> d!109909 (= (map!12102 thiss!1181) (getCurrentListMap!2568 (_keys!9858 thiss!1181) (_values!5167 thiss!1181) (mask!25607 thiss!1181) (extraKeys!4876 thiss!1181) (zeroValue!4980 thiss!1181) (minValue!4980 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5182 thiss!1181)))))

(declare-fun bs!24901 () Bool)

(assert (= bs!24901 d!109909))

(declare-fun m!827297 () Bool)

(assert (=> bs!24901 m!827297))

(assert (=> b!888572 d!109909))

(declare-fun d!109911 () Bool)

(declare-fun res!602410 () Bool)

(declare-fun e!495226 () Bool)

(assert (=> d!109911 (=> (not res!602410) (not e!495226))))

(declare-fun simpleValid!291 (LongMapFixedSize!3970) Bool)

(assert (=> d!109911 (= res!602410 (simpleValid!291 thiss!1181))))

(assert (=> d!109911 (= (valid!1554 thiss!1181) e!495226)))

(declare-fun b!888638 () Bool)

(declare-fun res!602411 () Bool)

(assert (=> b!888638 (=> (not res!602411) (not e!495226))))

(declare-fun arrayCountValidKeys!0 (array!51789 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888638 (= res!602411 (= (arrayCountValidKeys!0 (_keys!9858 thiss!1181) #b00000000000000000000000000000000 (size!25349 (_keys!9858 thiss!1181))) (_size!2040 thiss!1181)))))

(declare-fun b!888639 () Bool)

(declare-fun res!602412 () Bool)

(assert (=> b!888639 (=> (not res!602412) (not e!495226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51789 (_ BitVec 32)) Bool)

(assert (=> b!888639 (= res!602412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9858 thiss!1181) (mask!25607 thiss!1181)))))

(declare-fun b!888640 () Bool)

(declare-datatypes ((List!17704 0))(
  ( (Nil!17701) (Cons!17700 (h!18831 (_ BitVec 64)) (t!24994 List!17704)) )
))
(declare-fun arrayNoDuplicates!0 (array!51789 (_ BitVec 32) List!17704) Bool)

(assert (=> b!888640 (= e!495226 (arrayNoDuplicates!0 (_keys!9858 thiss!1181) #b00000000000000000000000000000000 Nil!17701))))

(assert (= (and d!109911 res!602410) b!888638))

(assert (= (and b!888638 res!602411) b!888639))

(assert (= (and b!888639 res!602412) b!888640))

(declare-fun m!827299 () Bool)

(assert (=> d!109911 m!827299))

(declare-fun m!827301 () Bool)

(assert (=> b!888638 m!827301))

(declare-fun m!827303 () Bool)

(assert (=> b!888639 m!827303))

(declare-fun m!827305 () Bool)

(assert (=> b!888640 m!827305))

(assert (=> start!75544 d!109911))

(declare-fun d!109913 () Bool)

(assert (=> d!109913 (= (array_inv!19640 (_keys!9858 thiss!1181)) (bvsge (size!25349 (_keys!9858 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888577 d!109913))

(declare-fun d!109915 () Bool)

(assert (=> d!109915 (= (array_inv!19641 (_values!5167 thiss!1181)) (bvsge (size!25350 (_values!5167 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888577 d!109915))

(declare-fun b!888661 () Bool)

(declare-datatypes ((Unit!30216 0))(
  ( (Unit!30217) )
))
(declare-fun e!495239 () Unit!30216)

(declare-fun Unit!30218 () Unit!30216)

(assert (=> b!888661 (= e!495239 Unit!30218)))

(declare-fun b!888662 () Bool)

(declare-fun e!495241 () Bool)

(assert (=> b!888662 (= e!495241 (not (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!888663 () Bool)

(assert (=> b!888663 false))

(declare-fun lt!401720 () Unit!30216)

(declare-fun lt!401724 () Unit!30216)

(assert (=> b!888663 (= lt!401720 lt!401724)))

(declare-datatypes ((SeekEntryResult!8764 0))(
  ( (MissingZero!8764 (index!37427 (_ BitVec 32))) (Found!8764 (index!37428 (_ BitVec 32))) (Intermediate!8764 (undefined!9576 Bool) (index!37429 (_ BitVec 32)) (x!75419 (_ BitVec 32))) (Undefined!8764) (MissingVacant!8764 (index!37430 (_ BitVec 32))) )
))
(declare-fun lt!401725 () SeekEntryResult!8764)

(declare-fun lt!401732 () (_ BitVec 32))

(assert (=> b!888663 (and ((_ is Found!8764) lt!401725) (= (index!37428 lt!401725) lt!401732))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51789 (_ BitVec 32)) SeekEntryResult!8764)

(assert (=> b!888663 (= lt!401725 (seekEntry!0 key!785 (_keys!9858 thiss!1181) (mask!25607 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51789 (_ BitVec 32)) Unit!30216)

(assert (=> b!888663 (= lt!401724 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401732 (_keys!9858 thiss!1181) (mask!25607 thiss!1181)))))

(declare-fun lt!401723 () Unit!30216)

(declare-fun lt!401729 () Unit!30216)

(assert (=> b!888663 (= lt!401723 lt!401729)))

(assert (=> b!888663 (arrayForallSeekEntryOrOpenFound!0 lt!401732 (_keys!9858 thiss!1181) (mask!25607 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30216)

(assert (=> b!888663 (= lt!401729 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9858 thiss!1181) (mask!25607 thiss!1181) #b00000000000000000000000000000000 lt!401732))))

(declare-fun arrayScanForKey!0 (array!51789 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888663 (= lt!401732 (arrayScanForKey!0 (_keys!9858 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!401726 () Unit!30216)

(declare-fun lt!401722 () Unit!30216)

(assert (=> b!888663 (= lt!401726 lt!401722)))

(declare-fun e!495237 () Bool)

(assert (=> b!888663 e!495237))

(declare-fun c!93856 () Bool)

(assert (=> b!888663 (= c!93856 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!166 (array!51789 array!51791 (_ BitVec 32) (_ BitVec 32) V!28855 V!28855 (_ BitVec 64) Int) Unit!30216)

(assert (=> b!888663 (= lt!401722 (lemmaKeyInListMapIsInArray!166 (_keys!9858 thiss!1181) (_values!5167 thiss!1181) (mask!25607 thiss!1181) (extraKeys!4876 thiss!1181) (zeroValue!4980 thiss!1181) (minValue!4980 thiss!1181) key!785 (defaultEntry!5182 thiss!1181)))))

(declare-fun Unit!30219 () Unit!30216)

(assert (=> b!888663 (= e!495239 Unit!30219)))

(declare-fun b!888664 () Bool)

(declare-fun e!495238 () Bool)

(assert (=> b!888664 (= e!495241 e!495238)))

(declare-fun c!93853 () Bool)

(assert (=> b!888664 (= c!93853 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888665 () Bool)

(declare-fun c!93852 () Bool)

(declare-fun lt!401728 () SeekEntryResult!8764)

(assert (=> b!888665 (= c!93852 ((_ is Found!8764) lt!401728))))

(assert (=> b!888665 (= lt!401728 (seekEntry!0 key!785 (_keys!9858 thiss!1181) (mask!25607 thiss!1181)))))

(declare-fun e!495240 () Bool)

(assert (=> b!888665 (= e!495238 e!495240)))

(declare-fun bm!39461 () Bool)

(declare-fun call!39466 () ListLongMap!10645)

(assert (=> bm!39461 (= call!39466 (getCurrentListMap!2568 (_keys!9858 thiss!1181) (_values!5167 thiss!1181) (mask!25607 thiss!1181) (extraKeys!4876 thiss!1181) (zeroValue!4980 thiss!1181) (minValue!4980 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5182 thiss!1181)))))

(declare-fun bm!39462 () Bool)

(declare-fun call!39465 () Bool)

(declare-fun contains!4308 (ListLongMap!10645 (_ BitVec 64)) Bool)

(assert (=> bm!39462 (= call!39465 (contains!4308 call!39466 (ite c!93852 (select (arr!24905 (_keys!9858 thiss!1181)) (index!37428 lt!401728)) key!785)))))

(declare-fun b!888666 () Bool)

(assert (=> b!888666 (= e!495237 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888667 () Bool)

(assert (=> b!888667 (= e!495240 true)))

(declare-fun lt!401730 () Unit!30216)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51789 (_ BitVec 64) (_ BitVec 32)) Unit!30216)

(assert (=> b!888667 (= lt!401730 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9858 thiss!1181) key!785 (index!37428 lt!401728)))))

(declare-fun call!39464 () Bool)

(assert (=> b!888667 call!39464))

(declare-fun lt!401719 () Unit!30216)

(assert (=> b!888667 (= lt!401719 lt!401730)))

(declare-fun lt!401718 () Unit!30216)

(declare-fun lemmaValidKeyInArrayIsInListMap!204 (array!51789 array!51791 (_ BitVec 32) (_ BitVec 32) V!28855 V!28855 (_ BitVec 32) Int) Unit!30216)

(assert (=> b!888667 (= lt!401718 (lemmaValidKeyInArrayIsInListMap!204 (_keys!9858 thiss!1181) (_values!5167 thiss!1181) (mask!25607 thiss!1181) (extraKeys!4876 thiss!1181) (zeroValue!4980 thiss!1181) (minValue!4980 thiss!1181) (index!37428 lt!401728) (defaultEntry!5182 thiss!1181)))))

(assert (=> b!888667 call!39465))

(declare-fun lt!401721 () Unit!30216)

(assert (=> b!888667 (= lt!401721 lt!401718)))

(declare-fun b!888668 () Bool)

(assert (=> b!888668 (= e!495238 (not (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888669 () Bool)

(assert (=> b!888669 (= e!495237 call!39464)))

(declare-fun bm!39463 () Bool)

(declare-fun arrayContainsKey!0 (array!51789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39463 (= call!39464 (arrayContainsKey!0 (_keys!9858 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun d!109917 () Bool)

(declare-fun lt!401731 () Bool)

(assert (=> d!109917 (= lt!401731 (contains!4308 (map!12102 thiss!1181) key!785))))

(assert (=> d!109917 (= lt!401731 e!495241)))

(declare-fun c!93855 () Bool)

(assert (=> d!109917 (= c!93855 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109917 (valid!1554 thiss!1181)))

(assert (=> d!109917 (= (contains!4305 thiss!1181 key!785) lt!401731)))

(declare-fun b!888670 () Bool)

(assert (=> b!888670 (= e!495240 false)))

(declare-fun c!93854 () Bool)

(assert (=> b!888670 (= c!93854 call!39465)))

(declare-fun lt!401727 () Unit!30216)

(assert (=> b!888670 (= lt!401727 e!495239)))

(assert (= (and d!109917 c!93855) b!888662))

(assert (= (and d!109917 (not c!93855)) b!888664))

(assert (= (and b!888664 c!93853) b!888668))

(assert (= (and b!888664 (not c!93853)) b!888665))

(assert (= (and b!888665 c!93852) b!888667))

(assert (= (and b!888665 (not c!93852)) b!888670))

(assert (= (and b!888670 c!93854) b!888663))

(assert (= (and b!888670 (not c!93854)) b!888661))

(assert (= (and b!888663 c!93856) b!888669))

(assert (= (and b!888663 (not c!93856)) b!888666))

(assert (= (or b!888667 b!888669) bm!39463))

(assert (= (or b!888667 b!888670) bm!39461))

(assert (= (or b!888667 b!888670) bm!39462))

(declare-fun m!827307 () Bool)

(assert (=> bm!39463 m!827307))

(declare-fun m!827309 () Bool)

(assert (=> b!888665 m!827309))

(declare-fun m!827311 () Bool)

(assert (=> bm!39462 m!827311))

(declare-fun m!827313 () Bool)

(assert (=> bm!39462 m!827313))

(declare-fun m!827315 () Bool)

(assert (=> b!888663 m!827315))

(declare-fun m!827317 () Bool)

(assert (=> b!888663 m!827317))

(declare-fun m!827319 () Bool)

(assert (=> b!888663 m!827319))

(assert (=> b!888663 m!827309))

(declare-fun m!827321 () Bool)

(assert (=> b!888663 m!827321))

(declare-fun m!827323 () Bool)

(assert (=> b!888663 m!827323))

(assert (=> d!109917 m!827245))

(assert (=> d!109917 m!827245))

(declare-fun m!827325 () Bool)

(assert (=> d!109917 m!827325))

(assert (=> d!109917 m!827259))

(declare-fun m!827327 () Bool)

(assert (=> b!888667 m!827327))

(declare-fun m!827329 () Bool)

(assert (=> b!888667 m!827329))

(assert (=> bm!39461 m!827297))

(assert (=> b!888575 d!109917))

(declare-fun mapIsEmpty!28425 () Bool)

(declare-fun mapRes!28425 () Bool)

(assert (=> mapIsEmpty!28425 mapRes!28425))

(declare-fun b!888678 () Bool)

(declare-fun e!495246 () Bool)

(assert (=> b!888678 (= e!495246 tp_is_empty!17917)))

(declare-fun mapNonEmpty!28425 () Bool)

(declare-fun tp!54738 () Bool)

(declare-fun e!495247 () Bool)

(assert (=> mapNonEmpty!28425 (= mapRes!28425 (and tp!54738 e!495247))))

(declare-fun mapRest!28425 () (Array (_ BitVec 32) ValueCell!8477))

(declare-fun mapValue!28425 () ValueCell!8477)

(declare-fun mapKey!28425 () (_ BitVec 32))

(assert (=> mapNonEmpty!28425 (= mapRest!28416 (store mapRest!28425 mapKey!28425 mapValue!28425))))

(declare-fun condMapEmpty!28425 () Bool)

(declare-fun mapDefault!28425 () ValueCell!8477)

(assert (=> mapNonEmpty!28416 (= condMapEmpty!28425 (= mapRest!28416 ((as const (Array (_ BitVec 32) ValueCell!8477)) mapDefault!28425)))))

(assert (=> mapNonEmpty!28416 (= tp!54723 (and e!495246 mapRes!28425))))

(declare-fun b!888677 () Bool)

(assert (=> b!888677 (= e!495247 tp_is_empty!17917)))

(assert (= (and mapNonEmpty!28416 condMapEmpty!28425) mapIsEmpty!28425))

(assert (= (and mapNonEmpty!28416 (not condMapEmpty!28425)) mapNonEmpty!28425))

(assert (= (and mapNonEmpty!28425 ((_ is ValueCellFull!8477) mapValue!28425)) b!888677))

(assert (= (and mapNonEmpty!28416 ((_ is ValueCellFull!8477) mapDefault!28425)) b!888678))

(declare-fun m!827331 () Bool)

(assert (=> mapNonEmpty!28425 m!827331))

(check-sat tp_is_empty!17917 (not d!109905) (not b!888638) (not b!888665) (not d!109909) (not b!888667) (not b!888640) (not bm!39461) (not b!888630) (not bm!39462) (not d!109911) (not b!888639) (not b_next!15589) (not b!888663) (not mapNonEmpty!28425) (not bm!39463) (not d!109917) b_and!25803)
(check-sat b_and!25803 (not b_next!15589))
