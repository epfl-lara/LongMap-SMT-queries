; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18276 () Bool)

(assert start!18276)

(declare-fun b!181623 () Bool)

(declare-fun b_free!4483 () Bool)

(declare-fun b_next!4483 () Bool)

(assert (=> b!181623 (= b_free!4483 (not b_next!4483))))

(declare-fun tp!16200 () Bool)

(declare-fun b_and!11047 () Bool)

(assert (=> b!181623 (= tp!16200 b_and!11047)))

(declare-fun res!85975 () Bool)

(declare-fun e!119609 () Bool)

(assert (=> start!18276 (=> (not res!85975) (not e!119609))))

(declare-datatypes ((V!5321 0))(
  ( (V!5322 (val!2172 Int)) )
))
(declare-datatypes ((ValueCell!1784 0))(
  ( (ValueCellFull!1784 (v!4070 V!5321)) (EmptyCell!1784) )
))
(declare-datatypes ((array!7677 0))(
  ( (array!7678 (arr!3632 (Array (_ BitVec 32) (_ BitVec 64))) (size!3942 (_ BitVec 32))) )
))
(declare-datatypes ((array!7679 0))(
  ( (array!7680 (arr!3633 (Array (_ BitVec 32) ValueCell!1784)) (size!3943 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2476 0))(
  ( (LongMapFixedSize!2477 (defaultEntry!3720 Int) (mask!8745 (_ BitVec 32)) (extraKeys!3457 (_ BitVec 32)) (zeroValue!3561 V!5321) (minValue!3561 V!5321) (_size!1287 (_ BitVec 32)) (_keys!5623 array!7677) (_values!3703 array!7679) (_vacant!1287 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2476)

(declare-fun valid!1050 (LongMapFixedSize!2476) Bool)

(assert (=> start!18276 (= res!85975 (valid!1050 thiss!1248))))

(assert (=> start!18276 e!119609))

(declare-fun e!119610 () Bool)

(assert (=> start!18276 e!119610))

(assert (=> start!18276 true))

(declare-fun b!181615 () Bool)

(declare-fun e!119612 () Bool)

(assert (=> b!181615 (= e!119609 e!119612)))

(declare-fun res!85978 () Bool)

(assert (=> b!181615 (=> (not res!85978) (not e!119612))))

(declare-datatypes ((SeekEntryResult!594 0))(
  ( (MissingZero!594 (index!4546 (_ BitVec 32))) (Found!594 (index!4547 (_ BitVec 32))) (Intermediate!594 (undefined!1406 Bool) (index!4548 (_ BitVec 32)) (x!19816 (_ BitVec 32))) (Undefined!594) (MissingVacant!594 (index!4549 (_ BitVec 32))) )
))
(declare-fun lt!89837 () SeekEntryResult!594)

(get-info :version)

(assert (=> b!181615 (= res!85978 (and (not ((_ is Undefined!594) lt!89837)) (not ((_ is MissingVacant!594) lt!89837)) (not ((_ is MissingZero!594) lt!89837)) ((_ is Found!594) lt!89837)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7677 (_ BitVec 32)) SeekEntryResult!594)

(assert (=> b!181615 (= lt!89837 (seekEntryOrOpen!0 key!828 (_keys!5623 thiss!1248) (mask!8745 thiss!1248)))))

(declare-fun b!181616 () Bool)

(declare-fun e!119613 () Bool)

(declare-fun tp_is_empty!4255 () Bool)

(assert (=> b!181616 (= e!119613 tp_is_empty!4255)))

(declare-fun b!181617 () Bool)

(declare-fun e!119614 () Bool)

(assert (=> b!181617 (= e!119614 tp_is_empty!4255)))

(declare-fun b!181618 () Bool)

(assert (=> b!181618 (= e!119612 (and (= (size!3943 (_values!3703 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8745 thiss!1248))) (= (size!3942 (_keys!5623 thiss!1248)) (size!3943 (_values!3703 thiss!1248))) (bvsge (mask!8745 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3457 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!7296 () Bool)

(declare-fun mapRes!7296 () Bool)

(assert (=> mapIsEmpty!7296 mapRes!7296))

(declare-fun b!181619 () Bool)

(declare-fun e!119611 () Bool)

(assert (=> b!181619 (= e!119611 (and e!119613 mapRes!7296))))

(declare-fun condMapEmpty!7296 () Bool)

(declare-fun mapDefault!7296 () ValueCell!1784)

(assert (=> b!181619 (= condMapEmpty!7296 (= (arr!3633 (_values!3703 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1784)) mapDefault!7296)))))

(declare-fun b!181620 () Bool)

(declare-fun res!85976 () Bool)

(assert (=> b!181620 (=> (not res!85976) (not e!119609))))

(assert (=> b!181620 (= res!85976 (not (= key!828 (bvneg key!828))))))

(declare-fun b!181621 () Bool)

(declare-fun res!85979 () Bool)

(assert (=> b!181621 (=> (not res!85979) (not e!119612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181621 (= res!85979 (validMask!0 (mask!8745 thiss!1248)))))

(declare-fun b!181622 () Bool)

(declare-fun res!85977 () Bool)

(assert (=> b!181622 (=> (not res!85977) (not e!119612))))

(declare-datatypes ((tuple2!3338 0))(
  ( (tuple2!3339 (_1!1680 (_ BitVec 64)) (_2!1680 V!5321)) )
))
(declare-datatypes ((List!2279 0))(
  ( (Nil!2276) (Cons!2275 (h!2902 tuple2!3338) (t!7127 List!2279)) )
))
(declare-datatypes ((ListLongMap!2259 0))(
  ( (ListLongMap!2260 (toList!1145 List!2279)) )
))
(declare-fun contains!1237 (ListLongMap!2259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!797 (array!7677 array!7679 (_ BitVec 32) (_ BitVec 32) V!5321 V!5321 (_ BitVec 32) Int) ListLongMap!2259)

(assert (=> b!181622 (= res!85977 (contains!1237 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7296 () Bool)

(declare-fun tp!16199 () Bool)

(assert (=> mapNonEmpty!7296 (= mapRes!7296 (and tp!16199 e!119614))))

(declare-fun mapKey!7296 () (_ BitVec 32))

(declare-fun mapValue!7296 () ValueCell!1784)

(declare-fun mapRest!7296 () (Array (_ BitVec 32) ValueCell!1784))

(assert (=> mapNonEmpty!7296 (= (arr!3633 (_values!3703 thiss!1248)) (store mapRest!7296 mapKey!7296 mapValue!7296))))

(declare-fun array_inv!2345 (array!7677) Bool)

(declare-fun array_inv!2346 (array!7679) Bool)

(assert (=> b!181623 (= e!119610 (and tp!16200 tp_is_empty!4255 (array_inv!2345 (_keys!5623 thiss!1248)) (array_inv!2346 (_values!3703 thiss!1248)) e!119611))))

(assert (= (and start!18276 res!85975) b!181620))

(assert (= (and b!181620 res!85976) b!181615))

(assert (= (and b!181615 res!85978) b!181622))

(assert (= (and b!181622 res!85977) b!181621))

(assert (= (and b!181621 res!85979) b!181618))

(assert (= (and b!181619 condMapEmpty!7296) mapIsEmpty!7296))

(assert (= (and b!181619 (not condMapEmpty!7296)) mapNonEmpty!7296))

(assert (= (and mapNonEmpty!7296 ((_ is ValueCellFull!1784) mapValue!7296)) b!181617))

(assert (= (and b!181619 ((_ is ValueCellFull!1784) mapDefault!7296)) b!181616))

(assert (= b!181623 b!181619))

(assert (= start!18276 b!181623))

(declare-fun m!209631 () Bool)

(assert (=> b!181615 m!209631))

(declare-fun m!209633 () Bool)

(assert (=> b!181623 m!209633))

(declare-fun m!209635 () Bool)

(assert (=> b!181623 m!209635))

(declare-fun m!209637 () Bool)

(assert (=> b!181621 m!209637))

(declare-fun m!209639 () Bool)

(assert (=> mapNonEmpty!7296 m!209639))

(declare-fun m!209641 () Bool)

(assert (=> start!18276 m!209641))

(declare-fun m!209643 () Bool)

(assert (=> b!181622 m!209643))

(assert (=> b!181622 m!209643))

(declare-fun m!209645 () Bool)

(assert (=> b!181622 m!209645))

(check-sat (not b_next!4483) (not b!181615) (not b!181621) (not mapNonEmpty!7296) (not start!18276) tp_is_empty!4255 b_and!11047 (not b!181623) (not b!181622))
(check-sat b_and!11047 (not b_next!4483))
(get-model)

(declare-fun d!54519 () Bool)

(assert (=> d!54519 (= (validMask!0 (mask!8745 thiss!1248)) (and (or (= (mask!8745 thiss!1248) #b00000000000000000000000000000111) (= (mask!8745 thiss!1248) #b00000000000000000000000000001111) (= (mask!8745 thiss!1248) #b00000000000000000000000000011111) (= (mask!8745 thiss!1248) #b00000000000000000000000000111111) (= (mask!8745 thiss!1248) #b00000000000000000000000001111111) (= (mask!8745 thiss!1248) #b00000000000000000000000011111111) (= (mask!8745 thiss!1248) #b00000000000000000000000111111111) (= (mask!8745 thiss!1248) #b00000000000000000000001111111111) (= (mask!8745 thiss!1248) #b00000000000000000000011111111111) (= (mask!8745 thiss!1248) #b00000000000000000000111111111111) (= (mask!8745 thiss!1248) #b00000000000000000001111111111111) (= (mask!8745 thiss!1248) #b00000000000000000011111111111111) (= (mask!8745 thiss!1248) #b00000000000000000111111111111111) (= (mask!8745 thiss!1248) #b00000000000000001111111111111111) (= (mask!8745 thiss!1248) #b00000000000000011111111111111111) (= (mask!8745 thiss!1248) #b00000000000000111111111111111111) (= (mask!8745 thiss!1248) #b00000000000001111111111111111111) (= (mask!8745 thiss!1248) #b00000000000011111111111111111111) (= (mask!8745 thiss!1248) #b00000000000111111111111111111111) (= (mask!8745 thiss!1248) #b00000000001111111111111111111111) (= (mask!8745 thiss!1248) #b00000000011111111111111111111111) (= (mask!8745 thiss!1248) #b00000000111111111111111111111111) (= (mask!8745 thiss!1248) #b00000001111111111111111111111111) (= (mask!8745 thiss!1248) #b00000011111111111111111111111111) (= (mask!8745 thiss!1248) #b00000111111111111111111111111111) (= (mask!8745 thiss!1248) #b00001111111111111111111111111111) (= (mask!8745 thiss!1248) #b00011111111111111111111111111111) (= (mask!8745 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8745 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!181621 d!54519))

(declare-fun d!54521 () Bool)

(declare-fun e!119661 () Bool)

(assert (=> d!54521 e!119661))

(declare-fun res!86012 () Bool)

(assert (=> d!54521 (=> res!86012 e!119661)))

(declare-fun lt!89853 () Bool)

(assert (=> d!54521 (= res!86012 (not lt!89853))))

(declare-fun lt!89855 () Bool)

(assert (=> d!54521 (= lt!89853 lt!89855)))

(declare-datatypes ((Unit!5516 0))(
  ( (Unit!5517) )
))
(declare-fun lt!89854 () Unit!5516)

(declare-fun e!119662 () Unit!5516)

(assert (=> d!54521 (= lt!89854 e!119662)))

(declare-fun c!32558 () Bool)

(assert (=> d!54521 (= c!32558 lt!89855)))

(declare-fun containsKey!214 (List!2279 (_ BitVec 64)) Bool)

(assert (=> d!54521 (= lt!89855 (containsKey!214 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(assert (=> d!54521 (= (contains!1237 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)) key!828) lt!89853)))

(declare-fun b!181684 () Bool)

(declare-fun lt!89852 () Unit!5516)

(assert (=> b!181684 (= e!119662 lt!89852)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!162 (List!2279 (_ BitVec 64)) Unit!5516)

(assert (=> b!181684 (= lt!89852 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(declare-datatypes ((Option!217 0))(
  ( (Some!216 (v!4073 V!5321)) (None!215) )
))
(declare-fun isDefined!163 (Option!217) Bool)

(declare-fun getValueByKey!211 (List!2279 (_ BitVec 64)) Option!217)

(assert (=> b!181684 (isDefined!163 (getValueByKey!211 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(declare-fun b!181685 () Bool)

(declare-fun Unit!5518 () Unit!5516)

(assert (=> b!181685 (= e!119662 Unit!5518)))

(declare-fun b!181686 () Bool)

(assert (=> b!181686 (= e!119661 (isDefined!163 (getValueByKey!211 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828)))))

(assert (= (and d!54521 c!32558) b!181684))

(assert (= (and d!54521 (not c!32558)) b!181685))

(assert (= (and d!54521 (not res!86012)) b!181686))

(declare-fun m!209679 () Bool)

(assert (=> d!54521 m!209679))

(declare-fun m!209681 () Bool)

(assert (=> b!181684 m!209681))

(declare-fun m!209683 () Bool)

(assert (=> b!181684 m!209683))

(assert (=> b!181684 m!209683))

(declare-fun m!209685 () Bool)

(assert (=> b!181684 m!209685))

(assert (=> b!181686 m!209683))

(assert (=> b!181686 m!209683))

(assert (=> b!181686 m!209685))

(assert (=> b!181622 d!54521))

(declare-fun bm!18343 () Bool)

(declare-fun call!18352 () Bool)

(declare-fun lt!89909 () ListLongMap!2259)

(assert (=> bm!18343 (= call!18352 (contains!1237 lt!89909 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181729 () Bool)

(declare-fun e!119692 () ListLongMap!2259)

(declare-fun call!18347 () ListLongMap!2259)

(assert (=> b!181729 (= e!119692 call!18347)))

(declare-fun bm!18344 () Bool)

(declare-fun call!18348 () ListLongMap!2259)

(declare-fun getCurrentListMapNoExtraKeys!184 (array!7677 array!7679 (_ BitVec 32) (_ BitVec 32) V!5321 V!5321 (_ BitVec 32) Int) ListLongMap!2259)

(assert (=> bm!18344 (= call!18348 (getCurrentListMapNoExtraKeys!184 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))

(declare-fun b!181730 () Bool)

(declare-fun e!119700 () ListLongMap!2259)

(declare-fun e!119691 () ListLongMap!2259)

(assert (=> b!181730 (= e!119700 e!119691)))

(declare-fun c!32572 () Bool)

(assert (=> b!181730 (= c!32572 (and (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181731 () Bool)

(declare-fun e!119689 () Bool)

(declare-fun apply!153 (ListLongMap!2259 (_ BitVec 64)) V!5321)

(assert (=> b!181731 (= e!119689 (= (apply!153 lt!89909 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3561 thiss!1248)))))

(declare-fun b!181732 () Bool)

(declare-fun e!119701 () Bool)

(declare-fun e!119698 () Bool)

(assert (=> b!181732 (= e!119701 e!119698)))

(declare-fun res!86039 () Bool)

(assert (=> b!181732 (=> (not res!86039) (not e!119698))))

(assert (=> b!181732 (= res!86039 (contains!1237 lt!89909 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(declare-fun bm!18345 () Bool)

(declare-fun call!18350 () ListLongMap!2259)

(assert (=> bm!18345 (= call!18350 call!18348)))

(declare-fun b!181734 () Bool)

(declare-fun get!2088 (ValueCell!1784 V!5321) V!5321)

(declare-fun dynLambda!496 (Int (_ BitVec 64)) V!5321)

(assert (=> b!181734 (= e!119698 (= (apply!153 lt!89909 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)) (get!2088 (select (arr!3633 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181734 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3943 (_values!3703 thiss!1248))))))

(assert (=> b!181734 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(declare-fun bm!18346 () Bool)

(declare-fun call!18346 () Bool)

(assert (=> bm!18346 (= call!18346 (contains!1237 lt!89909 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181735 () Bool)

(declare-fun e!119690 () Bool)

(declare-fun e!119694 () Bool)

(assert (=> b!181735 (= e!119690 e!119694)))

(declare-fun res!86032 () Bool)

(assert (=> b!181735 (= res!86032 call!18352)))

(assert (=> b!181735 (=> (not res!86032) (not e!119694))))

(declare-fun b!181736 () Bool)

(declare-fun call!18349 () ListLongMap!2259)

(declare-fun +!273 (ListLongMap!2259 tuple2!3338) ListLongMap!2259)

(assert (=> b!181736 (= e!119700 (+!273 call!18349 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))

(declare-fun b!181737 () Bool)

(declare-fun e!119695 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!181737 (= e!119695 (validKeyInArray!0 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181738 () Bool)

(declare-fun res!86037 () Bool)

(declare-fun e!119696 () Bool)

(assert (=> b!181738 (=> (not res!86037) (not e!119696))))

(assert (=> b!181738 (= res!86037 e!119690)))

(declare-fun c!32575 () Bool)

(assert (=> b!181738 (= c!32575 (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!181739 () Bool)

(declare-fun e!119697 () Unit!5516)

(declare-fun Unit!5519 () Unit!5516)

(assert (=> b!181739 (= e!119697 Unit!5519)))

(declare-fun bm!18347 () Bool)

(assert (=> bm!18347 (= call!18347 call!18349)))

(declare-fun b!181740 () Bool)

(assert (=> b!181740 (= e!119690 (not call!18352))))

(declare-fun c!32573 () Bool)

(declare-fun call!18351 () ListLongMap!2259)

(declare-fun bm!18348 () Bool)

(assert (=> bm!18348 (= call!18349 (+!273 (ite c!32573 call!18348 (ite c!32572 call!18350 call!18351)) (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(declare-fun b!181741 () Bool)

(declare-fun e!119693 () Bool)

(assert (=> b!181741 (= e!119696 e!119693)))

(declare-fun c!32574 () Bool)

(assert (=> b!181741 (= c!32574 (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181742 () Bool)

(assert (=> b!181742 (= e!119691 call!18347)))

(declare-fun d!54523 () Bool)

(assert (=> d!54523 e!119696))

(declare-fun res!86036 () Bool)

(assert (=> d!54523 (=> (not res!86036) (not e!119696))))

(assert (=> d!54523 (= res!86036 (or (bvsge #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))))

(declare-fun lt!89915 () ListLongMap!2259)

(assert (=> d!54523 (= lt!89909 lt!89915)))

(declare-fun lt!89908 () Unit!5516)

(assert (=> d!54523 (= lt!89908 e!119697)))

(declare-fun c!32571 () Bool)

(declare-fun e!119699 () Bool)

(assert (=> d!54523 (= c!32571 e!119699)))

(declare-fun res!86035 () Bool)

(assert (=> d!54523 (=> (not res!86035) (not e!119699))))

(assert (=> d!54523 (= res!86035 (bvslt #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(assert (=> d!54523 (= lt!89915 e!119700)))

(assert (=> d!54523 (= c!32573 (and (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54523 (validMask!0 (mask!8745 thiss!1248))))

(assert (=> d!54523 (= (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)) lt!89909)))

(declare-fun b!181733 () Bool)

(assert (=> b!181733 (= e!119692 call!18351)))

(declare-fun b!181743 () Bool)

(assert (=> b!181743 (= e!119699 (validKeyInArray!0 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18349 () Bool)

(assert (=> bm!18349 (= call!18351 call!18350)))

(declare-fun b!181744 () Bool)

(declare-fun lt!89904 () Unit!5516)

(assert (=> b!181744 (= e!119697 lt!89904)))

(declare-fun lt!89900 () ListLongMap!2259)

(assert (=> b!181744 (= lt!89900 (getCurrentListMapNoExtraKeys!184 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))

(declare-fun lt!89912 () (_ BitVec 64))

(assert (=> b!181744 (= lt!89912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89911 () (_ BitVec 64))

(assert (=> b!181744 (= lt!89911 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89920 () Unit!5516)

(declare-fun addStillContains!129 (ListLongMap!2259 (_ BitVec 64) V!5321 (_ BitVec 64)) Unit!5516)

(assert (=> b!181744 (= lt!89920 (addStillContains!129 lt!89900 lt!89912 (zeroValue!3561 thiss!1248) lt!89911))))

(assert (=> b!181744 (contains!1237 (+!273 lt!89900 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248))) lt!89911)))

(declare-fun lt!89913 () Unit!5516)

(assert (=> b!181744 (= lt!89913 lt!89920)))

(declare-fun lt!89918 () ListLongMap!2259)

(assert (=> b!181744 (= lt!89918 (getCurrentListMapNoExtraKeys!184 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))

(declare-fun lt!89919 () (_ BitVec 64))

(assert (=> b!181744 (= lt!89919 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89906 () (_ BitVec 64))

(assert (=> b!181744 (= lt!89906 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89901 () Unit!5516)

(declare-fun addApplyDifferent!129 (ListLongMap!2259 (_ BitVec 64) V!5321 (_ BitVec 64)) Unit!5516)

(assert (=> b!181744 (= lt!89901 (addApplyDifferent!129 lt!89918 lt!89919 (minValue!3561 thiss!1248) lt!89906))))

(assert (=> b!181744 (= (apply!153 (+!273 lt!89918 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248))) lt!89906) (apply!153 lt!89918 lt!89906))))

(declare-fun lt!89916 () Unit!5516)

(assert (=> b!181744 (= lt!89916 lt!89901)))

(declare-fun lt!89921 () ListLongMap!2259)

(assert (=> b!181744 (= lt!89921 (getCurrentListMapNoExtraKeys!184 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))

(declare-fun lt!89917 () (_ BitVec 64))

(assert (=> b!181744 (= lt!89917 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89903 () (_ BitVec 64))

(assert (=> b!181744 (= lt!89903 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89907 () Unit!5516)

(assert (=> b!181744 (= lt!89907 (addApplyDifferent!129 lt!89921 lt!89917 (zeroValue!3561 thiss!1248) lt!89903))))

(assert (=> b!181744 (= (apply!153 (+!273 lt!89921 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248))) lt!89903) (apply!153 lt!89921 lt!89903))))

(declare-fun lt!89910 () Unit!5516)

(assert (=> b!181744 (= lt!89910 lt!89907)))

(declare-fun lt!89902 () ListLongMap!2259)

(assert (=> b!181744 (= lt!89902 (getCurrentListMapNoExtraKeys!184 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))

(declare-fun lt!89914 () (_ BitVec 64))

(assert (=> b!181744 (= lt!89914 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89905 () (_ BitVec 64))

(assert (=> b!181744 (= lt!89905 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181744 (= lt!89904 (addApplyDifferent!129 lt!89902 lt!89914 (minValue!3561 thiss!1248) lt!89905))))

(assert (=> b!181744 (= (apply!153 (+!273 lt!89902 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248))) lt!89905) (apply!153 lt!89902 lt!89905))))

(declare-fun b!181745 () Bool)

(declare-fun res!86038 () Bool)

(assert (=> b!181745 (=> (not res!86038) (not e!119696))))

(assert (=> b!181745 (= res!86038 e!119701)))

(declare-fun res!86031 () Bool)

(assert (=> b!181745 (=> res!86031 e!119701)))

(assert (=> b!181745 (= res!86031 (not e!119695))))

(declare-fun res!86033 () Bool)

(assert (=> b!181745 (=> (not res!86033) (not e!119695))))

(assert (=> b!181745 (= res!86033 (bvslt #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(declare-fun b!181746 () Bool)

(assert (=> b!181746 (= e!119694 (= (apply!153 lt!89909 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3561 thiss!1248)))))

(declare-fun b!181747 () Bool)

(assert (=> b!181747 (= e!119693 (not call!18346))))

(declare-fun b!181748 () Bool)

(assert (=> b!181748 (= e!119693 e!119689)))

(declare-fun res!86034 () Bool)

(assert (=> b!181748 (= res!86034 call!18346)))

(assert (=> b!181748 (=> (not res!86034) (not e!119689))))

(declare-fun b!181749 () Bool)

(declare-fun c!32576 () Bool)

(assert (=> b!181749 (= c!32576 (and (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!181749 (= e!119691 e!119692)))

(assert (= (and d!54523 c!32573) b!181736))

(assert (= (and d!54523 (not c!32573)) b!181730))

(assert (= (and b!181730 c!32572) b!181742))

(assert (= (and b!181730 (not c!32572)) b!181749))

(assert (= (and b!181749 c!32576) b!181729))

(assert (= (and b!181749 (not c!32576)) b!181733))

(assert (= (or b!181729 b!181733) bm!18349))

(assert (= (or b!181742 bm!18349) bm!18345))

(assert (= (or b!181742 b!181729) bm!18347))

(assert (= (or b!181736 bm!18345) bm!18344))

(assert (= (or b!181736 bm!18347) bm!18348))

(assert (= (and d!54523 res!86035) b!181743))

(assert (= (and d!54523 c!32571) b!181744))

(assert (= (and d!54523 (not c!32571)) b!181739))

(assert (= (and d!54523 res!86036) b!181745))

(assert (= (and b!181745 res!86033) b!181737))

(assert (= (and b!181745 (not res!86031)) b!181732))

(assert (= (and b!181732 res!86039) b!181734))

(assert (= (and b!181745 res!86038) b!181738))

(assert (= (and b!181738 c!32575) b!181735))

(assert (= (and b!181738 (not c!32575)) b!181740))

(assert (= (and b!181735 res!86032) b!181746))

(assert (= (or b!181735 b!181740) bm!18343))

(assert (= (and b!181738 res!86037) b!181741))

(assert (= (and b!181741 c!32574) b!181748))

(assert (= (and b!181741 (not c!32574)) b!181747))

(assert (= (and b!181748 res!86034) b!181731))

(assert (= (or b!181748 b!181747) bm!18346))

(declare-fun b_lambda!7173 () Bool)

(assert (=> (not b_lambda!7173) (not b!181734)))

(declare-fun t!7129 () Bool)

(declare-fun tb!2809 () Bool)

(assert (=> (and b!181623 (= (defaultEntry!3720 thiss!1248) (defaultEntry!3720 thiss!1248)) t!7129) tb!2809))

(declare-fun result!4721 () Bool)

(assert (=> tb!2809 (= result!4721 tp_is_empty!4255)))

(assert (=> b!181734 t!7129))

(declare-fun b_and!11053 () Bool)

(assert (= b_and!11047 (and (=> t!7129 result!4721) b_and!11053)))

(declare-fun m!209687 () Bool)

(assert (=> bm!18343 m!209687))

(declare-fun m!209689 () Bool)

(assert (=> b!181734 m!209689))

(declare-fun m!209691 () Bool)

(assert (=> b!181734 m!209691))

(assert (=> b!181734 m!209689))

(declare-fun m!209693 () Bool)

(assert (=> b!181734 m!209693))

(declare-fun m!209695 () Bool)

(assert (=> b!181734 m!209695))

(declare-fun m!209697 () Bool)

(assert (=> b!181734 m!209697))

(assert (=> b!181734 m!209695))

(assert (=> b!181734 m!209693))

(declare-fun m!209699 () Bool)

(assert (=> b!181736 m!209699))

(assert (=> b!181743 m!209689))

(assert (=> b!181743 m!209689))

(declare-fun m!209701 () Bool)

(assert (=> b!181743 m!209701))

(assert (=> d!54523 m!209637))

(declare-fun m!209703 () Bool)

(assert (=> bm!18348 m!209703))

(declare-fun m!209705 () Bool)

(assert (=> bm!18346 m!209705))

(assert (=> b!181732 m!209689))

(assert (=> b!181732 m!209689))

(declare-fun m!209707 () Bool)

(assert (=> b!181732 m!209707))

(declare-fun m!209709 () Bool)

(assert (=> b!181746 m!209709))

(declare-fun m!209711 () Bool)

(assert (=> bm!18344 m!209711))

(assert (=> b!181737 m!209689))

(assert (=> b!181737 m!209689))

(assert (=> b!181737 m!209701))

(declare-fun m!209713 () Bool)

(assert (=> b!181731 m!209713))

(declare-fun m!209715 () Bool)

(assert (=> b!181744 m!209715))

(declare-fun m!209717 () Bool)

(assert (=> b!181744 m!209717))

(declare-fun m!209719 () Bool)

(assert (=> b!181744 m!209719))

(declare-fun m!209721 () Bool)

(assert (=> b!181744 m!209721))

(assert (=> b!181744 m!209711))

(declare-fun m!209723 () Bool)

(assert (=> b!181744 m!209723))

(assert (=> b!181744 m!209717))

(assert (=> b!181744 m!209689))

(declare-fun m!209725 () Bool)

(assert (=> b!181744 m!209725))

(declare-fun m!209727 () Bool)

(assert (=> b!181744 m!209727))

(declare-fun m!209729 () Bool)

(assert (=> b!181744 m!209729))

(declare-fun m!209731 () Bool)

(assert (=> b!181744 m!209731))

(declare-fun m!209733 () Bool)

(assert (=> b!181744 m!209733))

(declare-fun m!209735 () Bool)

(assert (=> b!181744 m!209735))

(declare-fun m!209737 () Bool)

(assert (=> b!181744 m!209737))

(declare-fun m!209739 () Bool)

(assert (=> b!181744 m!209739))

(assert (=> b!181744 m!209731))

(assert (=> b!181744 m!209735))

(declare-fun m!209741 () Bool)

(assert (=> b!181744 m!209741))

(declare-fun m!209743 () Bool)

(assert (=> b!181744 m!209743))

(assert (=> b!181744 m!209727))

(assert (=> b!181622 d!54523))

(declare-fun d!54525 () Bool)

(declare-fun res!86046 () Bool)

(declare-fun e!119704 () Bool)

(assert (=> d!54525 (=> (not res!86046) (not e!119704))))

(declare-fun simpleValid!169 (LongMapFixedSize!2476) Bool)

(assert (=> d!54525 (= res!86046 (simpleValid!169 thiss!1248))))

(assert (=> d!54525 (= (valid!1050 thiss!1248) e!119704)))

(declare-fun b!181758 () Bool)

(declare-fun res!86047 () Bool)

(assert (=> b!181758 (=> (not res!86047) (not e!119704))))

(declare-fun arrayCountValidKeys!0 (array!7677 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181758 (= res!86047 (= (arrayCountValidKeys!0 (_keys!5623 thiss!1248) #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))) (_size!1287 thiss!1248)))))

(declare-fun b!181759 () Bool)

(declare-fun res!86048 () Bool)

(assert (=> b!181759 (=> (not res!86048) (not e!119704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7677 (_ BitVec 32)) Bool)

(assert (=> b!181759 (= res!86048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5623 thiss!1248) (mask!8745 thiss!1248)))))

(declare-fun b!181760 () Bool)

(declare-datatypes ((List!2280 0))(
  ( (Nil!2277) (Cons!2276 (h!2903 (_ BitVec 64)) (t!7130 List!2280)) )
))
(declare-fun arrayNoDuplicates!0 (array!7677 (_ BitVec 32) List!2280) Bool)

(assert (=> b!181760 (= e!119704 (arrayNoDuplicates!0 (_keys!5623 thiss!1248) #b00000000000000000000000000000000 Nil!2277))))

(assert (= (and d!54525 res!86046) b!181758))

(assert (= (and b!181758 res!86047) b!181759))

(assert (= (and b!181759 res!86048) b!181760))

(declare-fun m!209745 () Bool)

(assert (=> d!54525 m!209745))

(declare-fun m!209747 () Bool)

(assert (=> b!181758 m!209747))

(declare-fun m!209749 () Bool)

(assert (=> b!181759 m!209749))

(declare-fun m!209751 () Bool)

(assert (=> b!181760 m!209751))

(assert (=> start!18276 d!54525))

(declare-fun d!54527 () Bool)

(declare-fun lt!89928 () SeekEntryResult!594)

(assert (=> d!54527 (and (or ((_ is Undefined!594) lt!89928) (not ((_ is Found!594) lt!89928)) (and (bvsge (index!4547 lt!89928) #b00000000000000000000000000000000) (bvslt (index!4547 lt!89928) (size!3942 (_keys!5623 thiss!1248))))) (or ((_ is Undefined!594) lt!89928) ((_ is Found!594) lt!89928) (not ((_ is MissingZero!594) lt!89928)) (and (bvsge (index!4546 lt!89928) #b00000000000000000000000000000000) (bvslt (index!4546 lt!89928) (size!3942 (_keys!5623 thiss!1248))))) (or ((_ is Undefined!594) lt!89928) ((_ is Found!594) lt!89928) ((_ is MissingZero!594) lt!89928) (not ((_ is MissingVacant!594) lt!89928)) (and (bvsge (index!4549 lt!89928) #b00000000000000000000000000000000) (bvslt (index!4549 lt!89928) (size!3942 (_keys!5623 thiss!1248))))) (or ((_ is Undefined!594) lt!89928) (ite ((_ is Found!594) lt!89928) (= (select (arr!3632 (_keys!5623 thiss!1248)) (index!4547 lt!89928)) key!828) (ite ((_ is MissingZero!594) lt!89928) (= (select (arr!3632 (_keys!5623 thiss!1248)) (index!4546 lt!89928)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!594) lt!89928) (= (select (arr!3632 (_keys!5623 thiss!1248)) (index!4549 lt!89928)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!119713 () SeekEntryResult!594)

(assert (=> d!54527 (= lt!89928 e!119713)))

(declare-fun c!32585 () Bool)

(declare-fun lt!89929 () SeekEntryResult!594)

(assert (=> d!54527 (= c!32585 (and ((_ is Intermediate!594) lt!89929) (undefined!1406 lt!89929)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7677 (_ BitVec 32)) SeekEntryResult!594)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54527 (= lt!89929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8745 thiss!1248)) key!828 (_keys!5623 thiss!1248) (mask!8745 thiss!1248)))))

(assert (=> d!54527 (validMask!0 (mask!8745 thiss!1248))))

(assert (=> d!54527 (= (seekEntryOrOpen!0 key!828 (_keys!5623 thiss!1248) (mask!8745 thiss!1248)) lt!89928)))

(declare-fun b!181773 () Bool)

(declare-fun e!119711 () SeekEntryResult!594)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7677 (_ BitVec 32)) SeekEntryResult!594)

(assert (=> b!181773 (= e!119711 (seekKeyOrZeroReturnVacant!0 (x!19816 lt!89929) (index!4548 lt!89929) (index!4548 lt!89929) key!828 (_keys!5623 thiss!1248) (mask!8745 thiss!1248)))))

(declare-fun b!181774 () Bool)

(declare-fun c!32584 () Bool)

(declare-fun lt!89930 () (_ BitVec 64))

(assert (=> b!181774 (= c!32584 (= lt!89930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119712 () SeekEntryResult!594)

(assert (=> b!181774 (= e!119712 e!119711)))

(declare-fun b!181775 () Bool)

(assert (=> b!181775 (= e!119713 Undefined!594)))

(declare-fun b!181776 () Bool)

(assert (=> b!181776 (= e!119713 e!119712)))

(assert (=> b!181776 (= lt!89930 (select (arr!3632 (_keys!5623 thiss!1248)) (index!4548 lt!89929)))))

(declare-fun c!32583 () Bool)

(assert (=> b!181776 (= c!32583 (= lt!89930 key!828))))

(declare-fun b!181777 () Bool)

(assert (=> b!181777 (= e!119711 (MissingZero!594 (index!4548 lt!89929)))))

(declare-fun b!181778 () Bool)

(assert (=> b!181778 (= e!119712 (Found!594 (index!4548 lt!89929)))))

(assert (= (and d!54527 c!32585) b!181775))

(assert (= (and d!54527 (not c!32585)) b!181776))

(assert (= (and b!181776 c!32583) b!181778))

(assert (= (and b!181776 (not c!32583)) b!181774))

(assert (= (and b!181774 c!32584) b!181777))

(assert (= (and b!181774 (not c!32584)) b!181773))

(assert (=> d!54527 m!209637))

(declare-fun m!209753 () Bool)

(assert (=> d!54527 m!209753))

(declare-fun m!209755 () Bool)

(assert (=> d!54527 m!209755))

(declare-fun m!209757 () Bool)

(assert (=> d!54527 m!209757))

(assert (=> d!54527 m!209753))

(declare-fun m!209759 () Bool)

(assert (=> d!54527 m!209759))

(declare-fun m!209761 () Bool)

(assert (=> d!54527 m!209761))

(declare-fun m!209763 () Bool)

(assert (=> b!181773 m!209763))

(declare-fun m!209765 () Bool)

(assert (=> b!181776 m!209765))

(assert (=> b!181615 d!54527))

(declare-fun d!54529 () Bool)

(assert (=> d!54529 (= (array_inv!2345 (_keys!5623 thiss!1248)) (bvsge (size!3942 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181623 d!54529))

(declare-fun d!54531 () Bool)

(assert (=> d!54531 (= (array_inv!2346 (_values!3703 thiss!1248)) (bvsge (size!3943 (_values!3703 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181623 d!54531))

(declare-fun mapIsEmpty!7305 () Bool)

(declare-fun mapRes!7305 () Bool)

(assert (=> mapIsEmpty!7305 mapRes!7305))

(declare-fun b!181786 () Bool)

(declare-fun e!119719 () Bool)

(assert (=> b!181786 (= e!119719 tp_is_empty!4255)))

(declare-fun condMapEmpty!7305 () Bool)

(declare-fun mapDefault!7305 () ValueCell!1784)

(assert (=> mapNonEmpty!7296 (= condMapEmpty!7305 (= mapRest!7296 ((as const (Array (_ BitVec 32) ValueCell!1784)) mapDefault!7305)))))

(assert (=> mapNonEmpty!7296 (= tp!16199 (and e!119719 mapRes!7305))))

(declare-fun mapNonEmpty!7305 () Bool)

(declare-fun tp!16215 () Bool)

(declare-fun e!119718 () Bool)

(assert (=> mapNonEmpty!7305 (= mapRes!7305 (and tp!16215 e!119718))))

(declare-fun mapKey!7305 () (_ BitVec 32))

(declare-fun mapValue!7305 () ValueCell!1784)

(declare-fun mapRest!7305 () (Array (_ BitVec 32) ValueCell!1784))

(assert (=> mapNonEmpty!7305 (= mapRest!7296 (store mapRest!7305 mapKey!7305 mapValue!7305))))

(declare-fun b!181785 () Bool)

(assert (=> b!181785 (= e!119718 tp_is_empty!4255)))

(assert (= (and mapNonEmpty!7296 condMapEmpty!7305) mapIsEmpty!7305))

(assert (= (and mapNonEmpty!7296 (not condMapEmpty!7305)) mapNonEmpty!7305))

(assert (= (and mapNonEmpty!7305 ((_ is ValueCellFull!1784) mapValue!7305)) b!181785))

(assert (= (and mapNonEmpty!7296 ((_ is ValueCellFull!1784) mapDefault!7305)) b!181786))

(declare-fun m!209767 () Bool)

(assert (=> mapNonEmpty!7305 m!209767))

(declare-fun b_lambda!7175 () Bool)

(assert (= b_lambda!7173 (or (and b!181623 b_free!4483) b_lambda!7175)))

(check-sat (not b!181731) b_and!11053 (not b_next!4483) (not b!181734) (not bm!18343) (not b!181746) (not b!181773) (not bm!18348) (not bm!18346) (not b!181744) (not b!181684) (not b!181758) (not b!181743) (not b!181686) (not b!181760) (not b_lambda!7175) (not d!54525) (not bm!18344) tp_is_empty!4255 (not b!181737) (not b!181736) (not d!54527) (not mapNonEmpty!7305) (not d!54521) (not b!181732) (not b!181759) (not d!54523))
(check-sat b_and!11053 (not b_next!4483))
(get-model)

(declare-fun b!181811 () Bool)

(declare-fun e!119738 () Bool)

(declare-fun e!119736 () Bool)

(assert (=> b!181811 (= e!119738 e!119736)))

(declare-fun c!32594 () Bool)

(declare-fun e!119740 () Bool)

(assert (=> b!181811 (= c!32594 e!119740)))

(declare-fun res!86060 () Bool)

(assert (=> b!181811 (=> (not res!86060) (not e!119740))))

(assert (=> b!181811 (= res!86060 (bvslt #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(declare-fun b!181812 () Bool)

(declare-fun lt!89950 () Unit!5516)

(declare-fun lt!89947 () Unit!5516)

(assert (=> b!181812 (= lt!89950 lt!89947)))

(declare-fun lt!89948 () (_ BitVec 64))

(declare-fun lt!89946 () V!5321)

(declare-fun lt!89949 () (_ BitVec 64))

(declare-fun lt!89951 () ListLongMap!2259)

(assert (=> b!181812 (not (contains!1237 (+!273 lt!89951 (tuple2!3339 lt!89949 lt!89946)) lt!89948))))

(declare-fun addStillNotContains!85 (ListLongMap!2259 (_ BitVec 64) V!5321 (_ BitVec 64)) Unit!5516)

(assert (=> b!181812 (= lt!89947 (addStillNotContains!85 lt!89951 lt!89949 lt!89946 lt!89948))))

(assert (=> b!181812 (= lt!89948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!181812 (= lt!89946 (get!2088 (select (arr!3633 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181812 (= lt!89949 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18355 () ListLongMap!2259)

(assert (=> b!181812 (= lt!89951 call!18355)))

(declare-fun e!119737 () ListLongMap!2259)

(assert (=> b!181812 (= e!119737 (+!273 call!18355 (tuple2!3339 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000) (get!2088 (select (arr!3633 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!18352 () Bool)

(assert (=> bm!18352 (= call!18355 (getCurrentListMapNoExtraKeys!184 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3720 thiss!1248)))))

(declare-fun b!181813 () Bool)

(assert (=> b!181813 (= e!119737 call!18355)))

(declare-fun d!54533 () Bool)

(assert (=> d!54533 e!119738))

(declare-fun res!86059 () Bool)

(assert (=> d!54533 (=> (not res!86059) (not e!119738))))

(declare-fun lt!89945 () ListLongMap!2259)

(assert (=> d!54533 (= res!86059 (not (contains!1237 lt!89945 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!119735 () ListLongMap!2259)

(assert (=> d!54533 (= lt!89945 e!119735)))

(declare-fun c!32596 () Bool)

(assert (=> d!54533 (= c!32596 (bvsge #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(assert (=> d!54533 (validMask!0 (mask!8745 thiss!1248))))

(assert (=> d!54533 (= (getCurrentListMapNoExtraKeys!184 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)) lt!89945)))

(declare-fun b!181814 () Bool)

(declare-fun e!119734 () Bool)

(assert (=> b!181814 (= e!119736 e!119734)))

(assert (=> b!181814 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(declare-fun res!86057 () Bool)

(assert (=> b!181814 (= res!86057 (contains!1237 lt!89945 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181814 (=> (not res!86057) (not e!119734))))

(declare-fun b!181815 () Bool)

(assert (=> b!181815 (= e!119735 e!119737)))

(declare-fun c!32595 () Bool)

(assert (=> b!181815 (= c!32595 (validKeyInArray!0 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181816 () Bool)

(assert (=> b!181816 (= e!119740 (validKeyInArray!0 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181816 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!181817 () Bool)

(declare-fun res!86058 () Bool)

(assert (=> b!181817 (=> (not res!86058) (not e!119738))))

(assert (=> b!181817 (= res!86058 (not (contains!1237 lt!89945 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181818 () Bool)

(declare-fun e!119739 () Bool)

(assert (=> b!181818 (= e!119739 (= lt!89945 (getCurrentListMapNoExtraKeys!184 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3720 thiss!1248))))))

(declare-fun b!181819 () Bool)

(declare-fun isEmpty!465 (ListLongMap!2259) Bool)

(assert (=> b!181819 (= e!119739 (isEmpty!465 lt!89945))))

(declare-fun b!181820 () Bool)

(assert (=> b!181820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(assert (=> b!181820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3943 (_values!3703 thiss!1248))))))

(assert (=> b!181820 (= e!119734 (= (apply!153 lt!89945 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)) (get!2088 (select (arr!3633 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!181821 () Bool)

(assert (=> b!181821 (= e!119736 e!119739)))

(declare-fun c!32597 () Bool)

(assert (=> b!181821 (= c!32597 (bvslt #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(declare-fun b!181822 () Bool)

(assert (=> b!181822 (= e!119735 (ListLongMap!2260 Nil!2276))))

(assert (= (and d!54533 c!32596) b!181822))

(assert (= (and d!54533 (not c!32596)) b!181815))

(assert (= (and b!181815 c!32595) b!181812))

(assert (= (and b!181815 (not c!32595)) b!181813))

(assert (= (or b!181812 b!181813) bm!18352))

(assert (= (and d!54533 res!86059) b!181817))

(assert (= (and b!181817 res!86058) b!181811))

(assert (= (and b!181811 res!86060) b!181816))

(assert (= (and b!181811 c!32594) b!181814))

(assert (= (and b!181811 (not c!32594)) b!181821))

(assert (= (and b!181814 res!86057) b!181820))

(assert (= (and b!181821 c!32597) b!181818))

(assert (= (and b!181821 (not c!32597)) b!181819))

(declare-fun b_lambda!7177 () Bool)

(assert (=> (not b_lambda!7177) (not b!181812)))

(assert (=> b!181812 t!7129))

(declare-fun b_and!11055 () Bool)

(assert (= b_and!11053 (and (=> t!7129 result!4721) b_and!11055)))

(declare-fun b_lambda!7179 () Bool)

(assert (=> (not b_lambda!7179) (not b!181820)))

(assert (=> b!181820 t!7129))

(declare-fun b_and!11057 () Bool)

(assert (= b_and!11055 (and (=> t!7129 result!4721) b_and!11057)))

(assert (=> b!181820 m!209689))

(assert (=> b!181820 m!209695))

(assert (=> b!181820 m!209689))

(declare-fun m!209769 () Bool)

(assert (=> b!181820 m!209769))

(assert (=> b!181820 m!209693))

(assert (=> b!181820 m!209693))

(assert (=> b!181820 m!209695))

(assert (=> b!181820 m!209697))

(declare-fun m!209771 () Bool)

(assert (=> b!181818 m!209771))

(declare-fun m!209773 () Bool)

(assert (=> b!181819 m!209773))

(declare-fun m!209775 () Bool)

(assert (=> d!54533 m!209775))

(assert (=> d!54533 m!209637))

(assert (=> bm!18352 m!209771))

(assert (=> b!181815 m!209689))

(assert (=> b!181815 m!209689))

(assert (=> b!181815 m!209701))

(declare-fun m!209777 () Bool)

(assert (=> b!181817 m!209777))

(assert (=> b!181816 m!209689))

(assert (=> b!181816 m!209689))

(assert (=> b!181816 m!209701))

(assert (=> b!181814 m!209689))

(assert (=> b!181814 m!209689))

(declare-fun m!209779 () Bool)

(assert (=> b!181814 m!209779))

(assert (=> b!181812 m!209689))

(assert (=> b!181812 m!209695))

(assert (=> b!181812 m!209693))

(declare-fun m!209781 () Bool)

(assert (=> b!181812 m!209781))

(declare-fun m!209783 () Bool)

(assert (=> b!181812 m!209783))

(declare-fun m!209785 () Bool)

(assert (=> b!181812 m!209785))

(assert (=> b!181812 m!209693))

(assert (=> b!181812 m!209695))

(assert (=> b!181812 m!209697))

(assert (=> b!181812 m!209783))

(declare-fun m!209787 () Bool)

(assert (=> b!181812 m!209787))

(assert (=> b!181744 d!54533))

(declare-fun d!54535 () Bool)

(declare-fun e!119743 () Bool)

(assert (=> d!54535 e!119743))

(declare-fun res!86065 () Bool)

(assert (=> d!54535 (=> (not res!86065) (not e!119743))))

(declare-fun lt!89963 () ListLongMap!2259)

(assert (=> d!54535 (= res!86065 (contains!1237 lt!89963 (_1!1680 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248)))))))

(declare-fun lt!89961 () List!2279)

(assert (=> d!54535 (= lt!89963 (ListLongMap!2260 lt!89961))))

(declare-fun lt!89962 () Unit!5516)

(declare-fun lt!89960 () Unit!5516)

(assert (=> d!54535 (= lt!89962 lt!89960)))

(assert (=> d!54535 (= (getValueByKey!211 lt!89961 (_1!1680 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248)))) (Some!216 (_2!1680 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!112 (List!2279 (_ BitVec 64) V!5321) Unit!5516)

(assert (=> d!54535 (= lt!89960 (lemmaContainsTupThenGetReturnValue!112 lt!89961 (_1!1680 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248))) (_2!1680 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248)))))))

(declare-fun insertStrictlySorted!115 (List!2279 (_ BitVec 64) V!5321) List!2279)

(assert (=> d!54535 (= lt!89961 (insertStrictlySorted!115 (toList!1145 lt!89900) (_1!1680 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248))) (_2!1680 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248)))))))

(assert (=> d!54535 (= (+!273 lt!89900 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248))) lt!89963)))

(declare-fun b!181827 () Bool)

(declare-fun res!86066 () Bool)

(assert (=> b!181827 (=> (not res!86066) (not e!119743))))

(assert (=> b!181827 (= res!86066 (= (getValueByKey!211 (toList!1145 lt!89963) (_1!1680 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248)))) (Some!216 (_2!1680 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248))))))))

(declare-fun b!181828 () Bool)

(declare-fun contains!1238 (List!2279 tuple2!3338) Bool)

(assert (=> b!181828 (= e!119743 (contains!1238 (toList!1145 lt!89963) (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248))))))

(assert (= (and d!54535 res!86065) b!181827))

(assert (= (and b!181827 res!86066) b!181828))

(declare-fun m!209789 () Bool)

(assert (=> d!54535 m!209789))

(declare-fun m!209791 () Bool)

(assert (=> d!54535 m!209791))

(declare-fun m!209793 () Bool)

(assert (=> d!54535 m!209793))

(declare-fun m!209795 () Bool)

(assert (=> d!54535 m!209795))

(declare-fun m!209797 () Bool)

(assert (=> b!181827 m!209797))

(declare-fun m!209799 () Bool)

(assert (=> b!181828 m!209799))

(assert (=> b!181744 d!54535))

(declare-fun d!54537 () Bool)

(declare-fun e!119744 () Bool)

(assert (=> d!54537 e!119744))

(declare-fun res!86067 () Bool)

(assert (=> d!54537 (=> (not res!86067) (not e!119744))))

(declare-fun lt!89967 () ListLongMap!2259)

(assert (=> d!54537 (= res!86067 (contains!1237 lt!89967 (_1!1680 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248)))))))

(declare-fun lt!89965 () List!2279)

(assert (=> d!54537 (= lt!89967 (ListLongMap!2260 lt!89965))))

(declare-fun lt!89966 () Unit!5516)

(declare-fun lt!89964 () Unit!5516)

(assert (=> d!54537 (= lt!89966 lt!89964)))

(assert (=> d!54537 (= (getValueByKey!211 lt!89965 (_1!1680 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248)))) (Some!216 (_2!1680 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248)))))))

(assert (=> d!54537 (= lt!89964 (lemmaContainsTupThenGetReturnValue!112 lt!89965 (_1!1680 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248))) (_2!1680 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248)))))))

(assert (=> d!54537 (= lt!89965 (insertStrictlySorted!115 (toList!1145 lt!89902) (_1!1680 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248))) (_2!1680 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248)))))))

(assert (=> d!54537 (= (+!273 lt!89902 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248))) lt!89967)))

(declare-fun b!181829 () Bool)

(declare-fun res!86068 () Bool)

(assert (=> b!181829 (=> (not res!86068) (not e!119744))))

(assert (=> b!181829 (= res!86068 (= (getValueByKey!211 (toList!1145 lt!89967) (_1!1680 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248)))) (Some!216 (_2!1680 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248))))))))

(declare-fun b!181830 () Bool)

(assert (=> b!181830 (= e!119744 (contains!1238 (toList!1145 lt!89967) (tuple2!3339 lt!89914 (minValue!3561 thiss!1248))))))

(assert (= (and d!54537 res!86067) b!181829))

(assert (= (and b!181829 res!86068) b!181830))

(declare-fun m!209801 () Bool)

(assert (=> d!54537 m!209801))

(declare-fun m!209803 () Bool)

(assert (=> d!54537 m!209803))

(declare-fun m!209805 () Bool)

(assert (=> d!54537 m!209805))

(declare-fun m!209807 () Bool)

(assert (=> d!54537 m!209807))

(declare-fun m!209809 () Bool)

(assert (=> b!181829 m!209809))

(declare-fun m!209811 () Bool)

(assert (=> b!181830 m!209811))

(assert (=> b!181744 d!54537))

(declare-fun d!54539 () Bool)

(declare-fun get!2089 (Option!217) V!5321)

(assert (=> d!54539 (= (apply!153 lt!89902 lt!89905) (get!2089 (getValueByKey!211 (toList!1145 lt!89902) lt!89905)))))

(declare-fun bs!7430 () Bool)

(assert (= bs!7430 d!54539))

(declare-fun m!209813 () Bool)

(assert (=> bs!7430 m!209813))

(assert (=> bs!7430 m!209813))

(declare-fun m!209815 () Bool)

(assert (=> bs!7430 m!209815))

(assert (=> b!181744 d!54539))

(declare-fun d!54541 () Bool)

(assert (=> d!54541 (= (apply!153 (+!273 lt!89921 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248))) lt!89903) (get!2089 (getValueByKey!211 (toList!1145 (+!273 lt!89921 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248)))) lt!89903)))))

(declare-fun bs!7431 () Bool)

(assert (= bs!7431 d!54541))

(declare-fun m!209817 () Bool)

(assert (=> bs!7431 m!209817))

(assert (=> bs!7431 m!209817))

(declare-fun m!209819 () Bool)

(assert (=> bs!7431 m!209819))

(assert (=> b!181744 d!54541))

(declare-fun d!54543 () Bool)

(assert (=> d!54543 (= (apply!153 (+!273 lt!89902 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248))) lt!89905) (get!2089 (getValueByKey!211 (toList!1145 (+!273 lt!89902 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248)))) lt!89905)))))

(declare-fun bs!7432 () Bool)

(assert (= bs!7432 d!54543))

(declare-fun m!209821 () Bool)

(assert (=> bs!7432 m!209821))

(assert (=> bs!7432 m!209821))

(declare-fun m!209823 () Bool)

(assert (=> bs!7432 m!209823))

(assert (=> b!181744 d!54543))

(declare-fun d!54545 () Bool)

(assert (=> d!54545 (= (apply!153 (+!273 lt!89918 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248))) lt!89906) (get!2089 (getValueByKey!211 (toList!1145 (+!273 lt!89918 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248)))) lt!89906)))))

(declare-fun bs!7433 () Bool)

(assert (= bs!7433 d!54545))

(declare-fun m!209825 () Bool)

(assert (=> bs!7433 m!209825))

(assert (=> bs!7433 m!209825))

(declare-fun m!209827 () Bool)

(assert (=> bs!7433 m!209827))

(assert (=> b!181744 d!54545))

(declare-fun d!54547 () Bool)

(assert (=> d!54547 (= (apply!153 (+!273 lt!89902 (tuple2!3339 lt!89914 (minValue!3561 thiss!1248))) lt!89905) (apply!153 lt!89902 lt!89905))))

(declare-fun lt!89970 () Unit!5516)

(declare-fun choose!971 (ListLongMap!2259 (_ BitVec 64) V!5321 (_ BitVec 64)) Unit!5516)

(assert (=> d!54547 (= lt!89970 (choose!971 lt!89902 lt!89914 (minValue!3561 thiss!1248) lt!89905))))

(declare-fun e!119747 () Bool)

(assert (=> d!54547 e!119747))

(declare-fun res!86071 () Bool)

(assert (=> d!54547 (=> (not res!86071) (not e!119747))))

(assert (=> d!54547 (= res!86071 (contains!1237 lt!89902 lt!89905))))

(assert (=> d!54547 (= (addApplyDifferent!129 lt!89902 lt!89914 (minValue!3561 thiss!1248) lt!89905) lt!89970)))

(declare-fun b!181834 () Bool)

(assert (=> b!181834 (= e!119747 (not (= lt!89905 lt!89914)))))

(assert (= (and d!54547 res!86071) b!181834))

(assert (=> d!54547 m!209723))

(assert (=> d!54547 m!209731))

(assert (=> d!54547 m!209733))

(assert (=> d!54547 m!209731))

(declare-fun m!209829 () Bool)

(assert (=> d!54547 m!209829))

(declare-fun m!209831 () Bool)

(assert (=> d!54547 m!209831))

(assert (=> b!181744 d!54547))

(declare-fun d!54549 () Bool)

(assert (=> d!54549 (= (apply!153 (+!273 lt!89921 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248))) lt!89903) (apply!153 lt!89921 lt!89903))))

(declare-fun lt!89971 () Unit!5516)

(assert (=> d!54549 (= lt!89971 (choose!971 lt!89921 lt!89917 (zeroValue!3561 thiss!1248) lt!89903))))

(declare-fun e!119748 () Bool)

(assert (=> d!54549 e!119748))

(declare-fun res!86072 () Bool)

(assert (=> d!54549 (=> (not res!86072) (not e!119748))))

(assert (=> d!54549 (= res!86072 (contains!1237 lt!89921 lt!89903))))

(assert (=> d!54549 (= (addApplyDifferent!129 lt!89921 lt!89917 (zeroValue!3561 thiss!1248) lt!89903) lt!89971)))

(declare-fun b!181835 () Bool)

(assert (=> b!181835 (= e!119748 (not (= lt!89903 lt!89917)))))

(assert (= (and d!54549 res!86072) b!181835))

(assert (=> d!54549 m!209725))

(assert (=> d!54549 m!209717))

(assert (=> d!54549 m!209719))

(assert (=> d!54549 m!209717))

(declare-fun m!209833 () Bool)

(assert (=> d!54549 m!209833))

(declare-fun m!209835 () Bool)

(assert (=> d!54549 m!209835))

(assert (=> b!181744 d!54549))

(declare-fun d!54551 () Bool)

(assert (=> d!54551 (= (apply!153 (+!273 lt!89918 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248))) lt!89906) (apply!153 lt!89918 lt!89906))))

(declare-fun lt!89972 () Unit!5516)

(assert (=> d!54551 (= lt!89972 (choose!971 lt!89918 lt!89919 (minValue!3561 thiss!1248) lt!89906))))

(declare-fun e!119749 () Bool)

(assert (=> d!54551 e!119749))

(declare-fun res!86073 () Bool)

(assert (=> d!54551 (=> (not res!86073) (not e!119749))))

(assert (=> d!54551 (= res!86073 (contains!1237 lt!89918 lt!89906))))

(assert (=> d!54551 (= (addApplyDifferent!129 lt!89918 lt!89919 (minValue!3561 thiss!1248) lt!89906) lt!89972)))

(declare-fun b!181836 () Bool)

(assert (=> b!181836 (= e!119749 (not (= lt!89906 lt!89919)))))

(assert (= (and d!54551 res!86073) b!181836))

(assert (=> d!54551 m!209721))

(assert (=> d!54551 m!209727))

(assert (=> d!54551 m!209729))

(assert (=> d!54551 m!209727))

(declare-fun m!209837 () Bool)

(assert (=> d!54551 m!209837))

(declare-fun m!209839 () Bool)

(assert (=> d!54551 m!209839))

(assert (=> b!181744 d!54551))

(declare-fun d!54553 () Bool)

(assert (=> d!54553 (= (apply!153 lt!89918 lt!89906) (get!2089 (getValueByKey!211 (toList!1145 lt!89918) lt!89906)))))

(declare-fun bs!7434 () Bool)

(assert (= bs!7434 d!54553))

(declare-fun m!209841 () Bool)

(assert (=> bs!7434 m!209841))

(assert (=> bs!7434 m!209841))

(declare-fun m!209843 () Bool)

(assert (=> bs!7434 m!209843))

(assert (=> b!181744 d!54553))

(declare-fun d!54555 () Bool)

(declare-fun e!119750 () Bool)

(assert (=> d!54555 e!119750))

(declare-fun res!86074 () Bool)

(assert (=> d!54555 (=> (not res!86074) (not e!119750))))

(declare-fun lt!89976 () ListLongMap!2259)

(assert (=> d!54555 (= res!86074 (contains!1237 lt!89976 (_1!1680 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248)))))))

(declare-fun lt!89974 () List!2279)

(assert (=> d!54555 (= lt!89976 (ListLongMap!2260 lt!89974))))

(declare-fun lt!89975 () Unit!5516)

(declare-fun lt!89973 () Unit!5516)

(assert (=> d!54555 (= lt!89975 lt!89973)))

(assert (=> d!54555 (= (getValueByKey!211 lt!89974 (_1!1680 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248)))) (Some!216 (_2!1680 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248)))))))

(assert (=> d!54555 (= lt!89973 (lemmaContainsTupThenGetReturnValue!112 lt!89974 (_1!1680 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248))) (_2!1680 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248)))))))

(assert (=> d!54555 (= lt!89974 (insertStrictlySorted!115 (toList!1145 lt!89918) (_1!1680 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248))) (_2!1680 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248)))))))

(assert (=> d!54555 (= (+!273 lt!89918 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248))) lt!89976)))

(declare-fun b!181837 () Bool)

(declare-fun res!86075 () Bool)

(assert (=> b!181837 (=> (not res!86075) (not e!119750))))

(assert (=> b!181837 (= res!86075 (= (getValueByKey!211 (toList!1145 lt!89976) (_1!1680 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248)))) (Some!216 (_2!1680 (tuple2!3339 lt!89919 (minValue!3561 thiss!1248))))))))

(declare-fun b!181838 () Bool)

(assert (=> b!181838 (= e!119750 (contains!1238 (toList!1145 lt!89976) (tuple2!3339 lt!89919 (minValue!3561 thiss!1248))))))

(assert (= (and d!54555 res!86074) b!181837))

(assert (= (and b!181837 res!86075) b!181838))

(declare-fun m!209845 () Bool)

(assert (=> d!54555 m!209845))

(declare-fun m!209847 () Bool)

(assert (=> d!54555 m!209847))

(declare-fun m!209849 () Bool)

(assert (=> d!54555 m!209849))

(declare-fun m!209851 () Bool)

(assert (=> d!54555 m!209851))

(declare-fun m!209853 () Bool)

(assert (=> b!181837 m!209853))

(declare-fun m!209855 () Bool)

(assert (=> b!181838 m!209855))

(assert (=> b!181744 d!54555))

(declare-fun d!54557 () Bool)

(assert (=> d!54557 (contains!1237 (+!273 lt!89900 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248))) lt!89911)))

(declare-fun lt!89979 () Unit!5516)

(declare-fun choose!972 (ListLongMap!2259 (_ BitVec 64) V!5321 (_ BitVec 64)) Unit!5516)

(assert (=> d!54557 (= lt!89979 (choose!972 lt!89900 lt!89912 (zeroValue!3561 thiss!1248) lt!89911))))

(assert (=> d!54557 (contains!1237 lt!89900 lt!89911)))

(assert (=> d!54557 (= (addStillContains!129 lt!89900 lt!89912 (zeroValue!3561 thiss!1248) lt!89911) lt!89979)))

(declare-fun bs!7435 () Bool)

(assert (= bs!7435 d!54557))

(assert (=> bs!7435 m!209735))

(assert (=> bs!7435 m!209735))

(assert (=> bs!7435 m!209741))

(declare-fun m!209857 () Bool)

(assert (=> bs!7435 m!209857))

(declare-fun m!209859 () Bool)

(assert (=> bs!7435 m!209859))

(assert (=> b!181744 d!54557))

(declare-fun d!54559 () Bool)

(declare-fun e!119751 () Bool)

(assert (=> d!54559 e!119751))

(declare-fun res!86076 () Bool)

(assert (=> d!54559 (=> (not res!86076) (not e!119751))))

(declare-fun lt!89983 () ListLongMap!2259)

(assert (=> d!54559 (= res!86076 (contains!1237 lt!89983 (_1!1680 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248)))))))

(declare-fun lt!89981 () List!2279)

(assert (=> d!54559 (= lt!89983 (ListLongMap!2260 lt!89981))))

(declare-fun lt!89982 () Unit!5516)

(declare-fun lt!89980 () Unit!5516)

(assert (=> d!54559 (= lt!89982 lt!89980)))

(assert (=> d!54559 (= (getValueByKey!211 lt!89981 (_1!1680 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248)))) (Some!216 (_2!1680 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248)))))))

(assert (=> d!54559 (= lt!89980 (lemmaContainsTupThenGetReturnValue!112 lt!89981 (_1!1680 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248))) (_2!1680 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248)))))))

(assert (=> d!54559 (= lt!89981 (insertStrictlySorted!115 (toList!1145 lt!89921) (_1!1680 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248))) (_2!1680 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248)))))))

(assert (=> d!54559 (= (+!273 lt!89921 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248))) lt!89983)))

(declare-fun b!181840 () Bool)

(declare-fun res!86077 () Bool)

(assert (=> b!181840 (=> (not res!86077) (not e!119751))))

(assert (=> b!181840 (= res!86077 (= (getValueByKey!211 (toList!1145 lt!89983) (_1!1680 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248)))) (Some!216 (_2!1680 (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248))))))))

(declare-fun b!181841 () Bool)

(assert (=> b!181841 (= e!119751 (contains!1238 (toList!1145 lt!89983) (tuple2!3339 lt!89917 (zeroValue!3561 thiss!1248))))))

(assert (= (and d!54559 res!86076) b!181840))

(assert (= (and b!181840 res!86077) b!181841))

(declare-fun m!209861 () Bool)

(assert (=> d!54559 m!209861))

(declare-fun m!209863 () Bool)

(assert (=> d!54559 m!209863))

(declare-fun m!209865 () Bool)

(assert (=> d!54559 m!209865))

(declare-fun m!209867 () Bool)

(assert (=> d!54559 m!209867))

(declare-fun m!209869 () Bool)

(assert (=> b!181840 m!209869))

(declare-fun m!209871 () Bool)

(assert (=> b!181841 m!209871))

(assert (=> b!181744 d!54559))

(declare-fun d!54561 () Bool)

(declare-fun e!119752 () Bool)

(assert (=> d!54561 e!119752))

(declare-fun res!86078 () Bool)

(assert (=> d!54561 (=> res!86078 e!119752)))

(declare-fun lt!89985 () Bool)

(assert (=> d!54561 (= res!86078 (not lt!89985))))

(declare-fun lt!89987 () Bool)

(assert (=> d!54561 (= lt!89985 lt!89987)))

(declare-fun lt!89986 () Unit!5516)

(declare-fun e!119753 () Unit!5516)

(assert (=> d!54561 (= lt!89986 e!119753)))

(declare-fun c!32598 () Bool)

(assert (=> d!54561 (= c!32598 lt!89987)))

(assert (=> d!54561 (= lt!89987 (containsKey!214 (toList!1145 (+!273 lt!89900 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248)))) lt!89911))))

(assert (=> d!54561 (= (contains!1237 (+!273 lt!89900 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248))) lt!89911) lt!89985)))

(declare-fun b!181842 () Bool)

(declare-fun lt!89984 () Unit!5516)

(assert (=> b!181842 (= e!119753 lt!89984)))

(assert (=> b!181842 (= lt!89984 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1145 (+!273 lt!89900 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248)))) lt!89911))))

(assert (=> b!181842 (isDefined!163 (getValueByKey!211 (toList!1145 (+!273 lt!89900 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248)))) lt!89911))))

(declare-fun b!181843 () Bool)

(declare-fun Unit!5520 () Unit!5516)

(assert (=> b!181843 (= e!119753 Unit!5520)))

(declare-fun b!181844 () Bool)

(assert (=> b!181844 (= e!119752 (isDefined!163 (getValueByKey!211 (toList!1145 (+!273 lt!89900 (tuple2!3339 lt!89912 (zeroValue!3561 thiss!1248)))) lt!89911)))))

(assert (= (and d!54561 c!32598) b!181842))

(assert (= (and d!54561 (not c!32598)) b!181843))

(assert (= (and d!54561 (not res!86078)) b!181844))

(declare-fun m!209873 () Bool)

(assert (=> d!54561 m!209873))

(declare-fun m!209875 () Bool)

(assert (=> b!181842 m!209875))

(declare-fun m!209877 () Bool)

(assert (=> b!181842 m!209877))

(assert (=> b!181842 m!209877))

(declare-fun m!209879 () Bool)

(assert (=> b!181842 m!209879))

(assert (=> b!181844 m!209877))

(assert (=> b!181844 m!209877))

(assert (=> b!181844 m!209879))

(assert (=> b!181744 d!54561))

(declare-fun d!54563 () Bool)

(assert (=> d!54563 (= (apply!153 lt!89921 lt!89903) (get!2089 (getValueByKey!211 (toList!1145 lt!89921) lt!89903)))))

(declare-fun bs!7436 () Bool)

(assert (= bs!7436 d!54563))

(declare-fun m!209881 () Bool)

(assert (=> bs!7436 m!209881))

(assert (=> bs!7436 m!209881))

(declare-fun m!209883 () Bool)

(assert (=> bs!7436 m!209883))

(assert (=> b!181744 d!54563))

(declare-fun d!54565 () Bool)

(declare-fun e!119754 () Bool)

(assert (=> d!54565 e!119754))

(declare-fun res!86079 () Bool)

(assert (=> d!54565 (=> (not res!86079) (not e!119754))))

(declare-fun lt!89991 () ListLongMap!2259)

(assert (=> d!54565 (= res!86079 (contains!1237 lt!89991 (_1!1680 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(declare-fun lt!89989 () List!2279)

(assert (=> d!54565 (= lt!89991 (ListLongMap!2260 lt!89989))))

(declare-fun lt!89990 () Unit!5516)

(declare-fun lt!89988 () Unit!5516)

(assert (=> d!54565 (= lt!89990 lt!89988)))

(assert (=> d!54565 (= (getValueByKey!211 lt!89989 (_1!1680 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))) (Some!216 (_2!1680 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(assert (=> d!54565 (= lt!89988 (lemmaContainsTupThenGetReturnValue!112 lt!89989 (_1!1680 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))) (_2!1680 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(assert (=> d!54565 (= lt!89989 (insertStrictlySorted!115 (toList!1145 call!18349) (_1!1680 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))) (_2!1680 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(assert (=> d!54565 (= (+!273 call!18349 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))) lt!89991)))

(declare-fun b!181845 () Bool)

(declare-fun res!86080 () Bool)

(assert (=> b!181845 (=> (not res!86080) (not e!119754))))

(assert (=> b!181845 (= res!86080 (= (getValueByKey!211 (toList!1145 lt!89991) (_1!1680 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))) (Some!216 (_2!1680 (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))))

(declare-fun b!181846 () Bool)

(assert (=> b!181846 (= e!119754 (contains!1238 (toList!1145 lt!89991) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))

(assert (= (and d!54565 res!86079) b!181845))

(assert (= (and b!181845 res!86080) b!181846))

(declare-fun m!209885 () Bool)

(assert (=> d!54565 m!209885))

(declare-fun m!209887 () Bool)

(assert (=> d!54565 m!209887))

(declare-fun m!209889 () Bool)

(assert (=> d!54565 m!209889))

(declare-fun m!209891 () Bool)

(assert (=> d!54565 m!209891))

(declare-fun m!209893 () Bool)

(assert (=> b!181845 m!209893))

(declare-fun m!209895 () Bool)

(assert (=> b!181846 m!209895))

(assert (=> b!181736 d!54565))

(declare-fun d!54567 () Bool)

(assert (=> d!54567 (= (validKeyInArray!0 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181737 d!54567))

(assert (=> bm!18344 d!54533))

(declare-fun d!54569 () Bool)

(assert (=> d!54569 (= (apply!153 lt!89909 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2089 (getValueByKey!211 (toList!1145 lt!89909) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7437 () Bool)

(assert (= bs!7437 d!54569))

(declare-fun m!209897 () Bool)

(assert (=> bs!7437 m!209897))

(assert (=> bs!7437 m!209897))

(declare-fun m!209899 () Bool)

(assert (=> bs!7437 m!209899))

(assert (=> b!181746 d!54569))

(declare-fun b!181855 () Bool)

(declare-fun e!119763 () Bool)

(declare-fun call!18358 () Bool)

(assert (=> b!181855 (= e!119763 call!18358)))

(declare-fun b!181856 () Bool)

(declare-fun e!119762 () Bool)

(assert (=> b!181856 (= e!119762 e!119763)))

(declare-fun c!32601 () Bool)

(assert (=> b!181856 (= c!32601 (validKeyInArray!0 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18355 () Bool)

(assert (=> bm!18355 (= call!18358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5623 thiss!1248) (mask!8745 thiss!1248)))))

(declare-fun d!54571 () Bool)

(declare-fun res!86086 () Bool)

(assert (=> d!54571 (=> res!86086 e!119762)))

(assert (=> d!54571 (= res!86086 (bvsge #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(assert (=> d!54571 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5623 thiss!1248) (mask!8745 thiss!1248)) e!119762)))

(declare-fun b!181857 () Bool)

(declare-fun e!119761 () Bool)

(assert (=> b!181857 (= e!119761 call!18358)))

(declare-fun b!181858 () Bool)

(assert (=> b!181858 (= e!119763 e!119761)))

(declare-fun lt!89999 () (_ BitVec 64))

(assert (=> b!181858 (= lt!89999 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89998 () Unit!5516)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7677 (_ BitVec 64) (_ BitVec 32)) Unit!5516)

(assert (=> b!181858 (= lt!89998 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5623 thiss!1248) lt!89999 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!181858 (arrayContainsKey!0 (_keys!5623 thiss!1248) lt!89999 #b00000000000000000000000000000000)))

(declare-fun lt!90000 () Unit!5516)

(assert (=> b!181858 (= lt!90000 lt!89998)))

(declare-fun res!86085 () Bool)

(assert (=> b!181858 (= res!86085 (= (seekEntryOrOpen!0 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000) (_keys!5623 thiss!1248) (mask!8745 thiss!1248)) (Found!594 #b00000000000000000000000000000000)))))

(assert (=> b!181858 (=> (not res!86085) (not e!119761))))

(assert (= (and d!54571 (not res!86086)) b!181856))

(assert (= (and b!181856 c!32601) b!181858))

(assert (= (and b!181856 (not c!32601)) b!181855))

(assert (= (and b!181858 res!86085) b!181857))

(assert (= (or b!181857 b!181855) bm!18355))

(assert (=> b!181856 m!209689))

(assert (=> b!181856 m!209689))

(assert (=> b!181856 m!209701))

(declare-fun m!209901 () Bool)

(assert (=> bm!18355 m!209901))

(assert (=> b!181858 m!209689))

(declare-fun m!209903 () Bool)

(assert (=> b!181858 m!209903))

(declare-fun m!209905 () Bool)

(assert (=> b!181858 m!209905))

(assert (=> b!181858 m!209689))

(declare-fun m!209907 () Bool)

(assert (=> b!181858 m!209907))

(assert (=> b!181759 d!54571))

(assert (=> b!181743 d!54567))

(declare-fun b!181877 () Bool)

(declare-fun e!119778 () SeekEntryResult!594)

(assert (=> b!181877 (= e!119778 (Intermediate!594 true (toIndex!0 key!828 (mask!8745 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181878 () Bool)

(declare-fun e!119776 () SeekEntryResult!594)

(assert (=> b!181878 (= e!119778 e!119776)))

(declare-fun c!32609 () Bool)

(declare-fun lt!90005 () (_ BitVec 64))

(assert (=> b!181878 (= c!32609 (or (= lt!90005 key!828) (= (bvadd lt!90005 lt!90005) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181879 () Bool)

(declare-fun lt!90006 () SeekEntryResult!594)

(assert (=> b!181879 (and (bvsge (index!4548 lt!90006) #b00000000000000000000000000000000) (bvslt (index!4548 lt!90006) (size!3942 (_keys!5623 thiss!1248))))))

(declare-fun e!119777 () Bool)

(assert (=> b!181879 (= e!119777 (= (select (arr!3632 (_keys!5623 thiss!1248)) (index!4548 lt!90006)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181881 () Bool)

(assert (=> b!181881 (and (bvsge (index!4548 lt!90006) #b00000000000000000000000000000000) (bvslt (index!4548 lt!90006) (size!3942 (_keys!5623 thiss!1248))))))

(declare-fun res!86093 () Bool)

(assert (=> b!181881 (= res!86093 (= (select (arr!3632 (_keys!5623 thiss!1248)) (index!4548 lt!90006)) key!828))))

(assert (=> b!181881 (=> res!86093 e!119777)))

(declare-fun e!119775 () Bool)

(assert (=> b!181881 (= e!119775 e!119777)))

(declare-fun b!181882 () Bool)

(assert (=> b!181882 (= e!119776 (Intermediate!594 false (toIndex!0 key!828 (mask!8745 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181883 () Bool)

(assert (=> b!181883 (and (bvsge (index!4548 lt!90006) #b00000000000000000000000000000000) (bvslt (index!4548 lt!90006) (size!3942 (_keys!5623 thiss!1248))))))

(declare-fun res!86095 () Bool)

(assert (=> b!181883 (= res!86095 (= (select (arr!3632 (_keys!5623 thiss!1248)) (index!4548 lt!90006)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181883 (=> res!86095 e!119777)))

(declare-fun b!181884 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181884 (= e!119776 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8745 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8745 thiss!1248)) key!828 (_keys!5623 thiss!1248) (mask!8745 thiss!1248)))))

(declare-fun b!181885 () Bool)

(declare-fun e!119774 () Bool)

(assert (=> b!181885 (= e!119774 e!119775)))

(declare-fun res!86094 () Bool)

(assert (=> b!181885 (= res!86094 (and ((_ is Intermediate!594) lt!90006) (not (undefined!1406 lt!90006)) (bvslt (x!19816 lt!90006) #b01111111111111111111111111111110) (bvsge (x!19816 lt!90006) #b00000000000000000000000000000000) (bvsge (x!19816 lt!90006) #b00000000000000000000000000000000)))))

(assert (=> b!181885 (=> (not res!86094) (not e!119775))))

(declare-fun d!54573 () Bool)

(assert (=> d!54573 e!119774))

(declare-fun c!32610 () Bool)

(assert (=> d!54573 (= c!32610 (and ((_ is Intermediate!594) lt!90006) (undefined!1406 lt!90006)))))

(assert (=> d!54573 (= lt!90006 e!119778)))

(declare-fun c!32608 () Bool)

(assert (=> d!54573 (= c!32608 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!54573 (= lt!90005 (select (arr!3632 (_keys!5623 thiss!1248)) (toIndex!0 key!828 (mask!8745 thiss!1248))))))

(assert (=> d!54573 (validMask!0 (mask!8745 thiss!1248))))

(assert (=> d!54573 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8745 thiss!1248)) key!828 (_keys!5623 thiss!1248) (mask!8745 thiss!1248)) lt!90006)))

(declare-fun b!181880 () Bool)

(assert (=> b!181880 (= e!119774 (bvsge (x!19816 lt!90006) #b01111111111111111111111111111110))))

(assert (= (and d!54573 c!32608) b!181877))

(assert (= (and d!54573 (not c!32608)) b!181878))

(assert (= (and b!181878 c!32609) b!181882))

(assert (= (and b!181878 (not c!32609)) b!181884))

(assert (= (and d!54573 c!32610) b!181880))

(assert (= (and d!54573 (not c!32610)) b!181885))

(assert (= (and b!181885 res!86094) b!181881))

(assert (= (and b!181881 (not res!86093)) b!181883))

(assert (= (and b!181883 (not res!86095)) b!181879))

(declare-fun m!209909 () Bool)

(assert (=> b!181881 m!209909))

(assert (=> d!54573 m!209753))

(declare-fun m!209911 () Bool)

(assert (=> d!54573 m!209911))

(assert (=> d!54573 m!209637))

(assert (=> b!181884 m!209753))

(declare-fun m!209913 () Bool)

(assert (=> b!181884 m!209913))

(assert (=> b!181884 m!209913))

(declare-fun m!209915 () Bool)

(assert (=> b!181884 m!209915))

(assert (=> b!181879 m!209909))

(assert (=> b!181883 m!209909))

(assert (=> d!54527 d!54573))

(declare-fun d!54575 () Bool)

(declare-fun lt!90012 () (_ BitVec 32))

(declare-fun lt!90011 () (_ BitVec 32))

(assert (=> d!54575 (= lt!90012 (bvmul (bvxor lt!90011 (bvlshr lt!90011 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54575 (= lt!90011 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54575 (and (bvsge (mask!8745 thiss!1248) #b00000000000000000000000000000000) (let ((res!86096 (let ((h!2904 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19833 (bvmul (bvxor h!2904 (bvlshr h!2904 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19833 (bvlshr x!19833 #b00000000000000000000000000001101)) (mask!8745 thiss!1248)))))) (and (bvslt res!86096 (bvadd (mask!8745 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!86096 #b00000000000000000000000000000000))))))

(assert (=> d!54575 (= (toIndex!0 key!828 (mask!8745 thiss!1248)) (bvand (bvxor lt!90012 (bvlshr lt!90012 #b00000000000000000000000000001101)) (mask!8745 thiss!1248)))))

(assert (=> d!54527 d!54575))

(assert (=> d!54527 d!54519))

(declare-fun d!54577 () Bool)

(declare-fun e!119779 () Bool)

(assert (=> d!54577 e!119779))

(declare-fun res!86097 () Bool)

(assert (=> d!54577 (=> res!86097 e!119779)))

(declare-fun lt!90014 () Bool)

(assert (=> d!54577 (= res!86097 (not lt!90014))))

(declare-fun lt!90016 () Bool)

(assert (=> d!54577 (= lt!90014 lt!90016)))

(declare-fun lt!90015 () Unit!5516)

(declare-fun e!119780 () Unit!5516)

(assert (=> d!54577 (= lt!90015 e!119780)))

(declare-fun c!32611 () Bool)

(assert (=> d!54577 (= c!32611 lt!90016)))

(assert (=> d!54577 (= lt!90016 (containsKey!214 (toList!1145 lt!89909) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54577 (= (contains!1237 lt!89909 #b1000000000000000000000000000000000000000000000000000000000000000) lt!90014)))

(declare-fun b!181886 () Bool)

(declare-fun lt!90013 () Unit!5516)

(assert (=> b!181886 (= e!119780 lt!90013)))

(assert (=> b!181886 (= lt!90013 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1145 lt!89909) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181886 (isDefined!163 (getValueByKey!211 (toList!1145 lt!89909) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181887 () Bool)

(declare-fun Unit!5521 () Unit!5516)

(assert (=> b!181887 (= e!119780 Unit!5521)))

(declare-fun b!181888 () Bool)

(assert (=> b!181888 (= e!119779 (isDefined!163 (getValueByKey!211 (toList!1145 lt!89909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54577 c!32611) b!181886))

(assert (= (and d!54577 (not c!32611)) b!181887))

(assert (= (and d!54577 (not res!86097)) b!181888))

(declare-fun m!209917 () Bool)

(assert (=> d!54577 m!209917))

(declare-fun m!209919 () Bool)

(assert (=> b!181886 m!209919))

(declare-fun m!209921 () Bool)

(assert (=> b!181886 m!209921))

(assert (=> b!181886 m!209921))

(declare-fun m!209923 () Bool)

(assert (=> b!181886 m!209923))

(assert (=> b!181888 m!209921))

(assert (=> b!181888 m!209921))

(assert (=> b!181888 m!209923))

(assert (=> bm!18346 d!54577))

(declare-fun b!181899 () Bool)

(declare-fun e!119790 () Bool)

(declare-fun call!18361 () Bool)

(assert (=> b!181899 (= e!119790 call!18361)))

(declare-fun bm!18358 () Bool)

(declare-fun c!32614 () Bool)

(assert (=> bm!18358 (= call!18361 (arrayNoDuplicates!0 (_keys!5623 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32614 (Cons!2276 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000) Nil!2277) Nil!2277)))))

(declare-fun b!181900 () Bool)

(declare-fun e!119792 () Bool)

(assert (=> b!181900 (= e!119792 e!119790)))

(assert (=> b!181900 (= c!32614 (validKeyInArray!0 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181901 () Bool)

(declare-fun e!119791 () Bool)

(assert (=> b!181901 (= e!119791 e!119792)))

(declare-fun res!86104 () Bool)

(assert (=> b!181901 (=> (not res!86104) (not e!119792))))

(declare-fun e!119789 () Bool)

(assert (=> b!181901 (= res!86104 (not e!119789))))

(declare-fun res!86106 () Bool)

(assert (=> b!181901 (=> (not res!86106) (not e!119789))))

(assert (=> b!181901 (= res!86106 (validKeyInArray!0 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181903 () Bool)

(declare-fun contains!1239 (List!2280 (_ BitVec 64)) Bool)

(assert (=> b!181903 (= e!119789 (contains!1239 Nil!2277 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181902 () Bool)

(assert (=> b!181902 (= e!119790 call!18361)))

(declare-fun d!54579 () Bool)

(declare-fun res!86105 () Bool)

(assert (=> d!54579 (=> res!86105 e!119791)))

(assert (=> d!54579 (= res!86105 (bvsge #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(assert (=> d!54579 (= (arrayNoDuplicates!0 (_keys!5623 thiss!1248) #b00000000000000000000000000000000 Nil!2277) e!119791)))

(assert (= (and d!54579 (not res!86105)) b!181901))

(assert (= (and b!181901 res!86106) b!181903))

(assert (= (and b!181901 res!86104) b!181900))

(assert (= (and b!181900 c!32614) b!181902))

(assert (= (and b!181900 (not c!32614)) b!181899))

(assert (= (or b!181902 b!181899) bm!18358))

(assert (=> bm!18358 m!209689))

(declare-fun m!209925 () Bool)

(assert (=> bm!18358 m!209925))

(assert (=> b!181900 m!209689))

(assert (=> b!181900 m!209689))

(assert (=> b!181900 m!209701))

(assert (=> b!181901 m!209689))

(assert (=> b!181901 m!209689))

(assert (=> b!181901 m!209701))

(assert (=> b!181903 m!209689))

(assert (=> b!181903 m!209689))

(declare-fun m!209927 () Bool)

(assert (=> b!181903 m!209927))

(assert (=> b!181760 d!54579))

(declare-fun d!54581 () Bool)

(declare-fun e!119793 () Bool)

(assert (=> d!54581 e!119793))

(declare-fun res!86107 () Bool)

(assert (=> d!54581 (=> res!86107 e!119793)))

(declare-fun lt!90018 () Bool)

(assert (=> d!54581 (= res!86107 (not lt!90018))))

(declare-fun lt!90020 () Bool)

(assert (=> d!54581 (= lt!90018 lt!90020)))

(declare-fun lt!90019 () Unit!5516)

(declare-fun e!119794 () Unit!5516)

(assert (=> d!54581 (= lt!90019 e!119794)))

(declare-fun c!32615 () Bool)

(assert (=> d!54581 (= c!32615 lt!90020)))

(assert (=> d!54581 (= lt!90020 (containsKey!214 (toList!1145 lt!89909) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54581 (= (contains!1237 lt!89909 #b0000000000000000000000000000000000000000000000000000000000000000) lt!90018)))

(declare-fun b!181904 () Bool)

(declare-fun lt!90017 () Unit!5516)

(assert (=> b!181904 (= e!119794 lt!90017)))

(assert (=> b!181904 (= lt!90017 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1145 lt!89909) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181904 (isDefined!163 (getValueByKey!211 (toList!1145 lt!89909) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181905 () Bool)

(declare-fun Unit!5522 () Unit!5516)

(assert (=> b!181905 (= e!119794 Unit!5522)))

(declare-fun b!181906 () Bool)

(assert (=> b!181906 (= e!119793 (isDefined!163 (getValueByKey!211 (toList!1145 lt!89909) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54581 c!32615) b!181904))

(assert (= (and d!54581 (not c!32615)) b!181905))

(assert (= (and d!54581 (not res!86107)) b!181906))

(declare-fun m!209929 () Bool)

(assert (=> d!54581 m!209929))

(declare-fun m!209931 () Bool)

(assert (=> b!181904 m!209931))

(assert (=> b!181904 m!209897))

(assert (=> b!181904 m!209897))

(declare-fun m!209933 () Bool)

(assert (=> b!181904 m!209933))

(assert (=> b!181906 m!209897))

(assert (=> b!181906 m!209897))

(assert (=> b!181906 m!209933))

(assert (=> bm!18343 d!54581))

(declare-fun d!54583 () Bool)

(assert (=> d!54583 (isDefined!163 (getValueByKey!211 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(declare-fun lt!90023 () Unit!5516)

(declare-fun choose!973 (List!2279 (_ BitVec 64)) Unit!5516)

(assert (=> d!54583 (= lt!90023 (choose!973 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(declare-fun e!119797 () Bool)

(assert (=> d!54583 e!119797))

(declare-fun res!86110 () Bool)

(assert (=> d!54583 (=> (not res!86110) (not e!119797))))

(declare-fun isStrictlySorted!330 (List!2279) Bool)

(assert (=> d!54583 (= res!86110 (isStrictlySorted!330 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))))

(assert (=> d!54583 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828) lt!90023)))

(declare-fun b!181909 () Bool)

(assert (=> b!181909 (= e!119797 (containsKey!214 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(assert (= (and d!54583 res!86110) b!181909))

(assert (=> d!54583 m!209683))

(assert (=> d!54583 m!209683))

(assert (=> d!54583 m!209685))

(declare-fun m!209935 () Bool)

(assert (=> d!54583 m!209935))

(declare-fun m!209937 () Bool)

(assert (=> d!54583 m!209937))

(assert (=> b!181909 m!209679))

(assert (=> b!181684 d!54583))

(declare-fun d!54585 () Bool)

(declare-fun isEmpty!466 (Option!217) Bool)

(assert (=> d!54585 (= (isDefined!163 (getValueByKey!211 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828)) (not (isEmpty!466 (getValueByKey!211 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))))

(declare-fun bs!7438 () Bool)

(assert (= bs!7438 d!54585))

(assert (=> bs!7438 m!209683))

(declare-fun m!209939 () Bool)

(assert (=> bs!7438 m!209939))

(assert (=> b!181684 d!54585))

(declare-fun b!181918 () Bool)

(declare-fun e!119802 () Option!217)

(assert (=> b!181918 (= e!119802 (Some!216 (_2!1680 (h!2902 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))))))

(declare-fun b!181920 () Bool)

(declare-fun e!119803 () Option!217)

(assert (=> b!181920 (= e!119803 (getValueByKey!211 (t!7127 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) key!828))))

(declare-fun b!181919 () Bool)

(assert (=> b!181919 (= e!119802 e!119803)))

(declare-fun c!32621 () Bool)

(assert (=> b!181919 (= c!32621 (and ((_ is Cons!2275) (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) (not (= (_1!1680 (h!2902 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) key!828))))))

(declare-fun b!181921 () Bool)

(assert (=> b!181921 (= e!119803 None!215)))

(declare-fun d!54587 () Bool)

(declare-fun c!32620 () Bool)

(assert (=> d!54587 (= c!32620 (and ((_ is Cons!2275) (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) (= (_1!1680 (h!2902 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) key!828)))))

(assert (=> d!54587 (= (getValueByKey!211 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828) e!119802)))

(assert (= (and d!54587 c!32620) b!181918))

(assert (= (and d!54587 (not c!32620)) b!181919))

(assert (= (and b!181919 c!32621) b!181920))

(assert (= (and b!181919 (not c!32621)) b!181921))

(declare-fun m!209941 () Bool)

(assert (=> b!181920 m!209941))

(assert (=> b!181684 d!54587))

(declare-fun d!54589 () Bool)

(declare-fun e!119804 () Bool)

(assert (=> d!54589 e!119804))

(declare-fun res!86111 () Bool)

(assert (=> d!54589 (=> (not res!86111) (not e!119804))))

(declare-fun lt!90027 () ListLongMap!2259)

(assert (=> d!54589 (= res!86111 (contains!1237 lt!90027 (_1!1680 (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))))

(declare-fun lt!90025 () List!2279)

(assert (=> d!54589 (= lt!90027 (ListLongMap!2260 lt!90025))))

(declare-fun lt!90026 () Unit!5516)

(declare-fun lt!90024 () Unit!5516)

(assert (=> d!54589 (= lt!90026 lt!90024)))

(assert (=> d!54589 (= (getValueByKey!211 lt!90025 (_1!1680 (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))) (Some!216 (_2!1680 (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))))

(assert (=> d!54589 (= lt!90024 (lemmaContainsTupThenGetReturnValue!112 lt!90025 (_1!1680 (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))) (_2!1680 (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))))

(assert (=> d!54589 (= lt!90025 (insertStrictlySorted!115 (toList!1145 (ite c!32573 call!18348 (ite c!32572 call!18350 call!18351))) (_1!1680 (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))) (_2!1680 (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))))

(assert (=> d!54589 (= (+!273 (ite c!32573 call!18348 (ite c!32572 call!18350 call!18351)) (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))) lt!90027)))

(declare-fun b!181922 () Bool)

(declare-fun res!86112 () Bool)

(assert (=> b!181922 (=> (not res!86112) (not e!119804))))

(assert (=> b!181922 (= res!86112 (= (getValueByKey!211 (toList!1145 lt!90027) (_1!1680 (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))) (Some!216 (_2!1680 (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))))

(declare-fun b!181923 () Bool)

(assert (=> b!181923 (= e!119804 (contains!1238 (toList!1145 lt!90027) (ite (or c!32573 c!32572) (tuple2!3339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(assert (= (and d!54589 res!86111) b!181922))

(assert (= (and b!181922 res!86112) b!181923))

(declare-fun m!209943 () Bool)

(assert (=> d!54589 m!209943))

(declare-fun m!209945 () Bool)

(assert (=> d!54589 m!209945))

(declare-fun m!209947 () Bool)

(assert (=> d!54589 m!209947))

(declare-fun m!209949 () Bool)

(assert (=> d!54589 m!209949))

(declare-fun m!209951 () Bool)

(assert (=> b!181922 m!209951))

(declare-fun m!209953 () Bool)

(assert (=> b!181923 m!209953))

(assert (=> bm!18348 d!54589))

(assert (=> d!54523 d!54519))

(declare-fun b!181932 () Bool)

(declare-fun res!86124 () Bool)

(declare-fun e!119807 () Bool)

(assert (=> b!181932 (=> (not res!86124) (not e!119807))))

(assert (=> b!181932 (= res!86124 (and (= (size!3943 (_values!3703 thiss!1248)) (bvadd (mask!8745 thiss!1248) #b00000000000000000000000000000001)) (= (size!3942 (_keys!5623 thiss!1248)) (size!3943 (_values!3703 thiss!1248))) (bvsge (_size!1287 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1287 thiss!1248) (bvadd (mask!8745 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!54591 () Bool)

(declare-fun res!86123 () Bool)

(assert (=> d!54591 (=> (not res!86123) (not e!119807))))

(assert (=> d!54591 (= res!86123 (validMask!0 (mask!8745 thiss!1248)))))

(assert (=> d!54591 (= (simpleValid!169 thiss!1248) e!119807)))

(declare-fun b!181934 () Bool)

(declare-fun res!86121 () Bool)

(assert (=> b!181934 (=> (not res!86121) (not e!119807))))

(declare-fun size!3948 (LongMapFixedSize!2476) (_ BitVec 32))

(assert (=> b!181934 (= res!86121 (= (size!3948 thiss!1248) (bvadd (_size!1287 thiss!1248) (bvsdiv (bvadd (extraKeys!3457 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!181935 () Bool)

(assert (=> b!181935 (= e!119807 (and (bvsge (extraKeys!3457 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3457 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1287 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!181933 () Bool)

(declare-fun res!86122 () Bool)

(assert (=> b!181933 (=> (not res!86122) (not e!119807))))

(assert (=> b!181933 (= res!86122 (bvsge (size!3948 thiss!1248) (_size!1287 thiss!1248)))))

(assert (= (and d!54591 res!86123) b!181932))

(assert (= (and b!181932 res!86124) b!181933))

(assert (= (and b!181933 res!86122) b!181934))

(assert (= (and b!181934 res!86121) b!181935))

(assert (=> d!54591 m!209637))

(declare-fun m!209955 () Bool)

(assert (=> b!181934 m!209955))

(assert (=> b!181933 m!209955))

(assert (=> d!54525 d!54591))

(declare-fun d!54593 () Bool)

(assert (=> d!54593 (= (apply!153 lt!89909 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)) (get!2089 (getValueByKey!211 (toList!1145 lt!89909) (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7439 () Bool)

(assert (= bs!7439 d!54593))

(assert (=> bs!7439 m!209689))

(declare-fun m!209957 () Bool)

(assert (=> bs!7439 m!209957))

(assert (=> bs!7439 m!209957))

(declare-fun m!209959 () Bool)

(assert (=> bs!7439 m!209959))

(assert (=> b!181734 d!54593))

(declare-fun d!54595 () Bool)

(declare-fun c!32624 () Bool)

(assert (=> d!54595 (= c!32624 ((_ is ValueCellFull!1784) (select (arr!3633 (_values!3703 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119810 () V!5321)

(assert (=> d!54595 (= (get!2088 (select (arr!3633 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119810)))

(declare-fun b!181940 () Bool)

(declare-fun get!2090 (ValueCell!1784 V!5321) V!5321)

(assert (=> b!181940 (= e!119810 (get!2090 (select (arr!3633 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181941 () Bool)

(declare-fun get!2091 (ValueCell!1784 V!5321) V!5321)

(assert (=> b!181941 (= e!119810 (get!2091 (select (arr!3633 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!496 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54595 c!32624) b!181940))

(assert (= (and d!54595 (not c!32624)) b!181941))

(assert (=> b!181940 m!209693))

(assert (=> b!181940 m!209695))

(declare-fun m!209961 () Bool)

(assert (=> b!181940 m!209961))

(assert (=> b!181941 m!209693))

(assert (=> b!181941 m!209695))

(declare-fun m!209963 () Bool)

(assert (=> b!181941 m!209963))

(assert (=> b!181734 d!54595))

(assert (=> b!181686 d!54585))

(assert (=> b!181686 d!54587))

(declare-fun b!181950 () Bool)

(declare-fun e!119815 () (_ BitVec 32))

(assert (=> b!181950 (= e!119815 #b00000000000000000000000000000000)))

(declare-fun d!54597 () Bool)

(declare-fun lt!90030 () (_ BitVec 32))

(assert (=> d!54597 (and (bvsge lt!90030 #b00000000000000000000000000000000) (bvsle lt!90030 (bvsub (size!3942 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54597 (= lt!90030 e!119815)))

(declare-fun c!32630 () Bool)

(assert (=> d!54597 (= c!32630 (bvsge #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))))))

(assert (=> d!54597 (and (bvsle #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3942 (_keys!5623 thiss!1248)) (size!3942 (_keys!5623 thiss!1248))))))

(assert (=> d!54597 (= (arrayCountValidKeys!0 (_keys!5623 thiss!1248) #b00000000000000000000000000000000 (size!3942 (_keys!5623 thiss!1248))) lt!90030)))

(declare-fun b!181951 () Bool)

(declare-fun e!119816 () (_ BitVec 32))

(declare-fun call!18364 () (_ BitVec 32))

(assert (=> b!181951 (= e!119816 (bvadd #b00000000000000000000000000000001 call!18364))))

(declare-fun b!181952 () Bool)

(assert (=> b!181952 (= e!119815 e!119816)))

(declare-fun c!32629 () Bool)

(assert (=> b!181952 (= c!32629 (validKeyInArray!0 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181953 () Bool)

(assert (=> b!181953 (= e!119816 call!18364)))

(declare-fun bm!18361 () Bool)

(assert (=> bm!18361 (= call!18364 (arrayCountValidKeys!0 (_keys!5623 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3942 (_keys!5623 thiss!1248))))))

(assert (= (and d!54597 c!32630) b!181950))

(assert (= (and d!54597 (not c!32630)) b!181952))

(assert (= (and b!181952 c!32629) b!181951))

(assert (= (and b!181952 (not c!32629)) b!181953))

(assert (= (or b!181951 b!181953) bm!18361))

(assert (=> b!181952 m!209689))

(assert (=> b!181952 m!209689))

(assert (=> b!181952 m!209701))

(declare-fun m!209965 () Bool)

(assert (=> bm!18361 m!209965))

(assert (=> b!181758 d!54597))

(declare-fun d!54599 () Bool)

(declare-fun res!86129 () Bool)

(declare-fun e!119821 () Bool)

(assert (=> d!54599 (=> res!86129 e!119821)))

(assert (=> d!54599 (= res!86129 (and ((_ is Cons!2275) (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) (= (_1!1680 (h!2902 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) key!828)))))

(assert (=> d!54599 (= (containsKey!214 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828) e!119821)))

(declare-fun b!181958 () Bool)

(declare-fun e!119822 () Bool)

(assert (=> b!181958 (= e!119821 e!119822)))

(declare-fun res!86130 () Bool)

(assert (=> b!181958 (=> (not res!86130) (not e!119822))))

(assert (=> b!181958 (= res!86130 (and (or (not ((_ is Cons!2275) (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) (bvsle (_1!1680 (h!2902 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) key!828)) ((_ is Cons!2275) (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) (bvslt (_1!1680 (h!2902 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) key!828)))))

(declare-fun b!181959 () Bool)

(assert (=> b!181959 (= e!119822 (containsKey!214 (t!7127 (toList!1145 (getCurrentListMap!797 (_keys!5623 thiss!1248) (_values!3703 thiss!1248) (mask!8745 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) key!828))))

(assert (= (and d!54599 (not res!86129)) b!181958))

(assert (= (and b!181958 res!86130) b!181959))

(declare-fun m!209967 () Bool)

(assert (=> b!181959 m!209967))

(assert (=> d!54521 d!54599))

(declare-fun d!54601 () Bool)

(assert (=> d!54601 (= (apply!153 lt!89909 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2089 (getValueByKey!211 (toList!1145 lt!89909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7440 () Bool)

(assert (= bs!7440 d!54601))

(assert (=> bs!7440 m!209921))

(assert (=> bs!7440 m!209921))

(declare-fun m!209969 () Bool)

(assert (=> bs!7440 m!209969))

(assert (=> b!181731 d!54601))

(declare-fun b!181972 () Bool)

(declare-fun e!119830 () SeekEntryResult!594)

(assert (=> b!181972 (= e!119830 (MissingVacant!594 (index!4548 lt!89929)))))

(declare-fun b!181973 () Bool)

(declare-fun e!119831 () SeekEntryResult!594)

(assert (=> b!181973 (= e!119831 Undefined!594)))

(declare-fun b!181974 () Bool)

(assert (=> b!181974 (= e!119830 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19816 lt!89929) #b00000000000000000000000000000001) (nextIndex!0 (index!4548 lt!89929) (bvadd (x!19816 lt!89929) #b00000000000000000000000000000001) (mask!8745 thiss!1248)) (index!4548 lt!89929) key!828 (_keys!5623 thiss!1248) (mask!8745 thiss!1248)))))

(declare-fun b!181976 () Bool)

(declare-fun c!32638 () Bool)

(declare-fun lt!90036 () (_ BitVec 64))

(assert (=> b!181976 (= c!32638 (= lt!90036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119829 () SeekEntryResult!594)

(assert (=> b!181976 (= e!119829 e!119830)))

(declare-fun b!181977 () Bool)

(assert (=> b!181977 (= e!119831 e!119829)))

(declare-fun c!32639 () Bool)

(assert (=> b!181977 (= c!32639 (= lt!90036 key!828))))

(declare-fun b!181975 () Bool)

(assert (=> b!181975 (= e!119829 (Found!594 (index!4548 lt!89929)))))

(declare-fun lt!90035 () SeekEntryResult!594)

(declare-fun d!54603 () Bool)

(assert (=> d!54603 (and (or ((_ is Undefined!594) lt!90035) (not ((_ is Found!594) lt!90035)) (and (bvsge (index!4547 lt!90035) #b00000000000000000000000000000000) (bvslt (index!4547 lt!90035) (size!3942 (_keys!5623 thiss!1248))))) (or ((_ is Undefined!594) lt!90035) ((_ is Found!594) lt!90035) (not ((_ is MissingVacant!594) lt!90035)) (not (= (index!4549 lt!90035) (index!4548 lt!89929))) (and (bvsge (index!4549 lt!90035) #b00000000000000000000000000000000) (bvslt (index!4549 lt!90035) (size!3942 (_keys!5623 thiss!1248))))) (or ((_ is Undefined!594) lt!90035) (ite ((_ is Found!594) lt!90035) (= (select (arr!3632 (_keys!5623 thiss!1248)) (index!4547 lt!90035)) key!828) (and ((_ is MissingVacant!594) lt!90035) (= (index!4549 lt!90035) (index!4548 lt!89929)) (= (select (arr!3632 (_keys!5623 thiss!1248)) (index!4549 lt!90035)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54603 (= lt!90035 e!119831)))

(declare-fun c!32637 () Bool)

(assert (=> d!54603 (= c!32637 (bvsge (x!19816 lt!89929) #b01111111111111111111111111111110))))

(assert (=> d!54603 (= lt!90036 (select (arr!3632 (_keys!5623 thiss!1248)) (index!4548 lt!89929)))))

(assert (=> d!54603 (validMask!0 (mask!8745 thiss!1248))))

(assert (=> d!54603 (= (seekKeyOrZeroReturnVacant!0 (x!19816 lt!89929) (index!4548 lt!89929) (index!4548 lt!89929) key!828 (_keys!5623 thiss!1248) (mask!8745 thiss!1248)) lt!90035)))

(assert (= (and d!54603 c!32637) b!181973))

(assert (= (and d!54603 (not c!32637)) b!181977))

(assert (= (and b!181977 c!32639) b!181975))

(assert (= (and b!181977 (not c!32639)) b!181976))

(assert (= (and b!181976 c!32638) b!181972))

(assert (= (and b!181976 (not c!32638)) b!181974))

(declare-fun m!209971 () Bool)

(assert (=> b!181974 m!209971))

(assert (=> b!181974 m!209971))

(declare-fun m!209973 () Bool)

(assert (=> b!181974 m!209973))

(declare-fun m!209975 () Bool)

(assert (=> d!54603 m!209975))

(declare-fun m!209977 () Bool)

(assert (=> d!54603 m!209977))

(assert (=> d!54603 m!209765))

(assert (=> d!54603 m!209637))

(assert (=> b!181773 d!54603))

(declare-fun d!54605 () Bool)

(declare-fun e!119832 () Bool)

(assert (=> d!54605 e!119832))

(declare-fun res!86131 () Bool)

(assert (=> d!54605 (=> res!86131 e!119832)))

(declare-fun lt!90038 () Bool)

(assert (=> d!54605 (= res!86131 (not lt!90038))))

(declare-fun lt!90040 () Bool)

(assert (=> d!54605 (= lt!90038 lt!90040)))

(declare-fun lt!90039 () Unit!5516)

(declare-fun e!119833 () Unit!5516)

(assert (=> d!54605 (= lt!90039 e!119833)))

(declare-fun c!32640 () Bool)

(assert (=> d!54605 (= c!32640 lt!90040)))

(assert (=> d!54605 (= lt!90040 (containsKey!214 (toList!1145 lt!89909) (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54605 (= (contains!1237 lt!89909 (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)) lt!90038)))

(declare-fun b!181978 () Bool)

(declare-fun lt!90037 () Unit!5516)

(assert (=> b!181978 (= e!119833 lt!90037)))

(assert (=> b!181978 (= lt!90037 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1145 lt!89909) (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181978 (isDefined!163 (getValueByKey!211 (toList!1145 lt!89909) (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181979 () Bool)

(declare-fun Unit!5523 () Unit!5516)

(assert (=> b!181979 (= e!119833 Unit!5523)))

(declare-fun b!181980 () Bool)

(assert (=> b!181980 (= e!119832 (isDefined!163 (getValueByKey!211 (toList!1145 lt!89909) (select (arr!3632 (_keys!5623 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54605 c!32640) b!181978))

(assert (= (and d!54605 (not c!32640)) b!181979))

(assert (= (and d!54605 (not res!86131)) b!181980))

(assert (=> d!54605 m!209689))

(declare-fun m!209979 () Bool)

(assert (=> d!54605 m!209979))

(assert (=> b!181978 m!209689))

(declare-fun m!209981 () Bool)

(assert (=> b!181978 m!209981))

(assert (=> b!181978 m!209689))

(assert (=> b!181978 m!209957))

(assert (=> b!181978 m!209957))

(declare-fun m!209983 () Bool)

(assert (=> b!181978 m!209983))

(assert (=> b!181980 m!209689))

(assert (=> b!181980 m!209957))

(assert (=> b!181980 m!209957))

(assert (=> b!181980 m!209983))

(assert (=> b!181732 d!54605))

(declare-fun mapIsEmpty!7306 () Bool)

(declare-fun mapRes!7306 () Bool)

(assert (=> mapIsEmpty!7306 mapRes!7306))

(declare-fun b!181982 () Bool)

(declare-fun e!119835 () Bool)

(assert (=> b!181982 (= e!119835 tp_is_empty!4255)))

(declare-fun condMapEmpty!7306 () Bool)

(declare-fun mapDefault!7306 () ValueCell!1784)

(assert (=> mapNonEmpty!7305 (= condMapEmpty!7306 (= mapRest!7305 ((as const (Array (_ BitVec 32) ValueCell!1784)) mapDefault!7306)))))

(assert (=> mapNonEmpty!7305 (= tp!16215 (and e!119835 mapRes!7306))))

(declare-fun mapNonEmpty!7306 () Bool)

(declare-fun tp!16216 () Bool)

(declare-fun e!119834 () Bool)

(assert (=> mapNonEmpty!7306 (= mapRes!7306 (and tp!16216 e!119834))))

(declare-fun mapKey!7306 () (_ BitVec 32))

(declare-fun mapValue!7306 () ValueCell!1784)

(declare-fun mapRest!7306 () (Array (_ BitVec 32) ValueCell!1784))

(assert (=> mapNonEmpty!7306 (= mapRest!7305 (store mapRest!7306 mapKey!7306 mapValue!7306))))

(declare-fun b!181981 () Bool)

(assert (=> b!181981 (= e!119834 tp_is_empty!4255)))

(assert (= (and mapNonEmpty!7305 condMapEmpty!7306) mapIsEmpty!7306))

(assert (= (and mapNonEmpty!7305 (not condMapEmpty!7306)) mapNonEmpty!7306))

(assert (= (and mapNonEmpty!7306 ((_ is ValueCellFull!1784) mapValue!7306)) b!181981))

(assert (= (and mapNonEmpty!7305 ((_ is ValueCellFull!1784) mapDefault!7306)) b!181982))

(declare-fun m!209985 () Bool)

(assert (=> mapNonEmpty!7306 m!209985))

(declare-fun b_lambda!7181 () Bool)

(assert (= b_lambda!7179 (or (and b!181623 b_free!4483) b_lambda!7181)))

(declare-fun b_lambda!7183 () Bool)

(assert (= b_lambda!7177 (or (and b!181623 b_free!4483) b_lambda!7183)))

(check-sat (not d!54585) (not b!181901) (not b!181884) (not b!181933) (not d!54545) (not b!181844) (not d!54591) (not bm!18358) (not b!181904) (not d!54541) (not b!181818) (not b_lambda!7181) (not d!54603) (not b!181815) (not d!54549) (not b!181817) (not d!54555) (not b!181952) (not b_next!4483) (not d!54589) (not b!181888) (not d!54537) (not b!181903) (not b!181842) (not b!181934) (not b!181974) (not b!181814) (not b!181837) (not b!181840) (not d!54593) (not b!181841) (not b!181830) (not d!54553) (not b!181858) (not d!54605) (not d!54543) (not b!181941) (not d!54539) (not d!54533) (not d!54559) (not b_lambda!7175) (not b!181922) (not bm!18355) (not b!181816) (not b!181909) (not mapNonEmpty!7306) b_and!11057 (not d!54565) (not bm!18361) (not b!181828) (not b!181978) (not d!54535) (not b!181820) (not b!181959) (not b!181900) (not b!181838) (not b!181886) (not d!54583) (not d!54573) (not d!54561) (not d!54551) (not d!54563) tp_is_empty!4255 (not b!181920) (not b!181940) (not bm!18352) (not b!181923) (not b!181819) (not b!181980) (not d!54601) (not b!181856) (not b!181827) (not d!54569) (not b!181906) (not b!181846) (not d!54547) (not b!181829) (not d!54581) (not d!54577) (not d!54557) (not b!181812) (not b_lambda!7183) (not b!181845))
(check-sat b_and!11057 (not b_next!4483))
