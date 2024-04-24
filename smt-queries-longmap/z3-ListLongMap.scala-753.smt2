; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17670 () Bool)

(assert start!17670)

(declare-fun b!176640 () Bool)

(declare-fun b_free!4357 () Bool)

(declare-fun b_next!4357 () Bool)

(assert (=> b!176640 (= b_free!4357 (not b_next!4357))))

(declare-fun tp!15764 () Bool)

(declare-fun b_and!10867 () Bool)

(assert (=> b!176640 (= tp!15764 b_and!10867)))

(declare-fun b!176635 () Bool)

(declare-fun res!83700 () Bool)

(declare-fun e!116520 () Bool)

(assert (=> b!176635 (=> (not res!83700) (not e!116520))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5153 0))(
  ( (V!5154 (val!2109 Int)) )
))
(declare-datatypes ((ValueCell!1721 0))(
  ( (ValueCellFull!1721 (v!3988 V!5153)) (EmptyCell!1721) )
))
(declare-datatypes ((array!7391 0))(
  ( (array!7392 (arr!3506 (Array (_ BitVec 32) (_ BitVec 64))) (size!3810 (_ BitVec 32))) )
))
(declare-datatypes ((array!7393 0))(
  ( (array!7394 (arr!3507 (Array (_ BitVec 32) ValueCell!1721)) (size!3811 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2350 0))(
  ( (LongMapFixedSize!2351 (defaultEntry!3636 Int) (mask!8558 (_ BitVec 32)) (extraKeys!3373 (_ BitVec 32)) (zeroValue!3477 V!5153) (minValue!3477 V!5153) (_size!1224 (_ BitVec 32)) (_keys!5499 array!7391) (_values!3619 array!7393) (_vacant!1224 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2350)

(get-info :version)

(declare-datatypes ((SeekEntryResult!553 0))(
  ( (MissingZero!553 (index!4380 (_ BitVec 32))) (Found!553 (index!4381 (_ BitVec 32))) (Intermediate!553 (undefined!1365 Bool) (index!4382 (_ BitVec 32)) (x!19381 (_ BitVec 32))) (Undefined!553) (MissingVacant!553 (index!4383 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7391 (_ BitVec 32)) SeekEntryResult!553)

(assert (=> b!176635 (= res!83700 ((_ is Undefined!553) (seekEntryOrOpen!0 key!828 (_keys!5499 thiss!1248) (mask!8558 thiss!1248))))))

(declare-fun b!176636 () Bool)

(declare-fun res!83705 () Bool)

(assert (=> b!176636 (=> (not res!83705) (not e!116520))))

(assert (=> b!176636 (= res!83705 (and (= (size!3811 (_values!3619 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8558 thiss!1248))) (= (size!3810 (_keys!5499 thiss!1248)) (size!3811 (_values!3619 thiss!1248))) (bvsge (mask!8558 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3373 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3373 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!176637 () Bool)

(declare-fun e!116518 () Bool)

(declare-fun tp_is_empty!4129 () Bool)

(assert (=> b!176637 (= e!116518 tp_is_empty!4129)))

(declare-fun b!176638 () Bool)

(declare-datatypes ((List!2215 0))(
  ( (Nil!2212) (Cons!2211 (h!2832 (_ BitVec 64)) (t!7033 List!2215)) )
))
(declare-fun arrayNoDuplicates!0 (array!7391 (_ BitVec 32) List!2215) Bool)

(assert (=> b!176638 (= e!116520 (not (arrayNoDuplicates!0 (_keys!5499 thiss!1248) #b00000000000000000000000000000000 Nil!2212)))))

(declare-fun res!83699 () Bool)

(assert (=> start!17670 (=> (not res!83699) (not e!116520))))

(declare-fun valid!1007 (LongMapFixedSize!2350) Bool)

(assert (=> start!17670 (= res!83699 (valid!1007 thiss!1248))))

(assert (=> start!17670 e!116520))

(declare-fun e!116517 () Bool)

(assert (=> start!17670 e!116517))

(assert (=> start!17670 true))

(declare-fun b!176639 () Bool)

(declare-fun res!83703 () Bool)

(assert (=> b!176639 (=> (not res!83703) (not e!116520))))

(assert (=> b!176639 (= res!83703 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7050 () Bool)

(declare-fun mapRes!7050 () Bool)

(declare-fun tp!15765 () Bool)

(declare-fun e!116521 () Bool)

(assert (=> mapNonEmpty!7050 (= mapRes!7050 (and tp!15765 e!116521))))

(declare-fun mapRest!7050 () (Array (_ BitVec 32) ValueCell!1721))

(declare-fun mapKey!7050 () (_ BitVec 32))

(declare-fun mapValue!7050 () ValueCell!1721)

(assert (=> mapNonEmpty!7050 (= (arr!3507 (_values!3619 thiss!1248)) (store mapRest!7050 mapKey!7050 mapValue!7050))))

(declare-fun e!116519 () Bool)

(declare-fun array_inv!2263 (array!7391) Bool)

(declare-fun array_inv!2264 (array!7393) Bool)

(assert (=> b!176640 (= e!116517 (and tp!15764 tp_is_empty!4129 (array_inv!2263 (_keys!5499 thiss!1248)) (array_inv!2264 (_values!3619 thiss!1248)) e!116519))))

(declare-fun b!176641 () Bool)

(assert (=> b!176641 (= e!116521 tp_is_empty!4129)))

(declare-fun b!176642 () Bool)

(declare-fun res!83704 () Bool)

(assert (=> b!176642 (=> (not res!83704) (not e!116520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7391 (_ BitVec 32)) Bool)

(assert (=> b!176642 (= res!83704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5499 thiss!1248) (mask!8558 thiss!1248)))))

(declare-fun b!176643 () Bool)

(assert (=> b!176643 (= e!116519 (and e!116518 mapRes!7050))))

(declare-fun condMapEmpty!7050 () Bool)

(declare-fun mapDefault!7050 () ValueCell!1721)

(assert (=> b!176643 (= condMapEmpty!7050 (= (arr!3507 (_values!3619 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1721)) mapDefault!7050)))))

(declare-fun mapIsEmpty!7050 () Bool)

(assert (=> mapIsEmpty!7050 mapRes!7050))

(declare-fun b!176644 () Bool)

(declare-fun res!83702 () Bool)

(assert (=> b!176644 (=> (not res!83702) (not e!116520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176644 (= res!83702 (validMask!0 (mask!8558 thiss!1248)))))

(declare-fun b!176645 () Bool)

(declare-fun res!83701 () Bool)

(assert (=> b!176645 (=> (not res!83701) (not e!116520))))

(declare-datatypes ((tuple2!3240 0))(
  ( (tuple2!3241 (_1!1631 (_ BitVec 64)) (_2!1631 V!5153)) )
))
(declare-datatypes ((List!2216 0))(
  ( (Nil!2213) (Cons!2212 (h!2833 tuple2!3240) (t!7034 List!2216)) )
))
(declare-datatypes ((ListLongMap!2173 0))(
  ( (ListLongMap!2174 (toList!1102 List!2216)) )
))
(declare-fun contains!1177 (ListLongMap!2173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!757 (array!7391 array!7393 (_ BitVec 32) (_ BitVec 32) V!5153 V!5153 (_ BitVec 32) Int) ListLongMap!2173)

(assert (=> b!176645 (= res!83701 (contains!1177 (getCurrentListMap!757 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)) key!828))))

(assert (= (and start!17670 res!83699) b!176639))

(assert (= (and b!176639 res!83703) b!176635))

(assert (= (and b!176635 res!83700) b!176645))

(assert (= (and b!176645 res!83701) b!176644))

(assert (= (and b!176644 res!83702) b!176636))

(assert (= (and b!176636 res!83705) b!176642))

(assert (= (and b!176642 res!83704) b!176638))

(assert (= (and b!176643 condMapEmpty!7050) mapIsEmpty!7050))

(assert (= (and b!176643 (not condMapEmpty!7050)) mapNonEmpty!7050))

(assert (= (and mapNonEmpty!7050 ((_ is ValueCellFull!1721) mapValue!7050)) b!176641))

(assert (= (and b!176643 ((_ is ValueCellFull!1721) mapDefault!7050)) b!176637))

(assert (= b!176640 b!176643))

(assert (= start!17670 b!176640))

(declare-fun m!205545 () Bool)

(assert (=> mapNonEmpty!7050 m!205545))

(declare-fun m!205547 () Bool)

(assert (=> b!176645 m!205547))

(assert (=> b!176645 m!205547))

(declare-fun m!205549 () Bool)

(assert (=> b!176645 m!205549))

(declare-fun m!205551 () Bool)

(assert (=> b!176638 m!205551))

(declare-fun m!205553 () Bool)

(assert (=> b!176642 m!205553))

(declare-fun m!205555 () Bool)

(assert (=> b!176644 m!205555))

(declare-fun m!205557 () Bool)

(assert (=> start!17670 m!205557))

(declare-fun m!205559 () Bool)

(assert (=> b!176640 m!205559))

(declare-fun m!205561 () Bool)

(assert (=> b!176640 m!205561))

(declare-fun m!205563 () Bool)

(assert (=> b!176635 m!205563))

(check-sat tp_is_empty!4129 (not b_next!4357) (not b!176645) (not b!176640) (not mapNonEmpty!7050) (not b!176644) (not start!17670) (not b!176642) (not b!176635) b_and!10867 (not b!176638))
(check-sat b_and!10867 (not b_next!4357))
(get-model)

(declare-fun d!53761 () Bool)

(declare-fun res!83754 () Bool)

(declare-fun e!116561 () Bool)

(assert (=> d!53761 (=> (not res!83754) (not e!116561))))

(declare-fun simpleValid!152 (LongMapFixedSize!2350) Bool)

(assert (=> d!53761 (= res!83754 (simpleValid!152 thiss!1248))))

(assert (=> d!53761 (= (valid!1007 thiss!1248) e!116561)))

(declare-fun b!176718 () Bool)

(declare-fun res!83755 () Bool)

(assert (=> b!176718 (=> (not res!83755) (not e!116561))))

(declare-fun arrayCountValidKeys!0 (array!7391 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176718 (= res!83755 (= (arrayCountValidKeys!0 (_keys!5499 thiss!1248) #b00000000000000000000000000000000 (size!3810 (_keys!5499 thiss!1248))) (_size!1224 thiss!1248)))))

(declare-fun b!176719 () Bool)

(declare-fun res!83756 () Bool)

(assert (=> b!176719 (=> (not res!83756) (not e!116561))))

(assert (=> b!176719 (= res!83756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5499 thiss!1248) (mask!8558 thiss!1248)))))

(declare-fun b!176720 () Bool)

(assert (=> b!176720 (= e!116561 (arrayNoDuplicates!0 (_keys!5499 thiss!1248) #b00000000000000000000000000000000 Nil!2212))))

(assert (= (and d!53761 res!83754) b!176718))

(assert (= (and b!176718 res!83755) b!176719))

(assert (= (and b!176719 res!83756) b!176720))

(declare-fun m!205605 () Bool)

(assert (=> d!53761 m!205605))

(declare-fun m!205607 () Bool)

(assert (=> b!176718 m!205607))

(assert (=> b!176719 m!205553))

(assert (=> b!176720 m!205551))

(assert (=> start!17670 d!53761))

(declare-fun bm!17857 () Bool)

(declare-fun call!17860 () Bool)

(assert (=> bm!17857 (= call!17860 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5499 thiss!1248) (mask!8558 thiss!1248)))))

(declare-fun b!176729 () Bool)

(declare-fun e!116568 () Bool)

(declare-fun e!116569 () Bool)

(assert (=> b!176729 (= e!116568 e!116569)))

(declare-fun c!31676 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176729 (= c!31676 (validKeyInArray!0 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176730 () Bool)

(declare-fun e!116570 () Bool)

(assert (=> b!176730 (= e!116569 e!116570)))

(declare-fun lt!87443 () (_ BitVec 64))

(assert (=> b!176730 (= lt!87443 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5409 0))(
  ( (Unit!5410) )
))
(declare-fun lt!87441 () Unit!5409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7391 (_ BitVec 64) (_ BitVec 32)) Unit!5409)

(assert (=> b!176730 (= lt!87441 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5499 thiss!1248) lt!87443 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!176730 (arrayContainsKey!0 (_keys!5499 thiss!1248) lt!87443 #b00000000000000000000000000000000)))

(declare-fun lt!87442 () Unit!5409)

(assert (=> b!176730 (= lt!87442 lt!87441)))

(declare-fun res!83761 () Bool)

(assert (=> b!176730 (= res!83761 (= (seekEntryOrOpen!0 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000) (_keys!5499 thiss!1248) (mask!8558 thiss!1248)) (Found!553 #b00000000000000000000000000000000)))))

(assert (=> b!176730 (=> (not res!83761) (not e!116570))))

(declare-fun b!176731 () Bool)

(assert (=> b!176731 (= e!116570 call!17860)))

(declare-fun b!176732 () Bool)

(assert (=> b!176732 (= e!116569 call!17860)))

(declare-fun d!53763 () Bool)

(declare-fun res!83762 () Bool)

(assert (=> d!53763 (=> res!83762 e!116568)))

(assert (=> d!53763 (= res!83762 (bvsge #b00000000000000000000000000000000 (size!3810 (_keys!5499 thiss!1248))))))

(assert (=> d!53763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5499 thiss!1248) (mask!8558 thiss!1248)) e!116568)))

(assert (= (and d!53763 (not res!83762)) b!176729))

(assert (= (and b!176729 c!31676) b!176730))

(assert (= (and b!176729 (not c!31676)) b!176732))

(assert (= (and b!176730 res!83761) b!176731))

(assert (= (or b!176731 b!176732) bm!17857))

(declare-fun m!205609 () Bool)

(assert (=> bm!17857 m!205609))

(declare-fun m!205611 () Bool)

(assert (=> b!176729 m!205611))

(assert (=> b!176729 m!205611))

(declare-fun m!205613 () Bool)

(assert (=> b!176729 m!205613))

(assert (=> b!176730 m!205611))

(declare-fun m!205615 () Bool)

(assert (=> b!176730 m!205615))

(declare-fun m!205617 () Bool)

(assert (=> b!176730 m!205617))

(assert (=> b!176730 m!205611))

(declare-fun m!205619 () Bool)

(assert (=> b!176730 m!205619))

(assert (=> b!176642 d!53763))

(declare-fun b!176743 () Bool)

(declare-fun e!116580 () Bool)

(declare-fun e!116579 () Bool)

(assert (=> b!176743 (= e!116580 e!116579)))

(declare-fun res!83770 () Bool)

(assert (=> b!176743 (=> (not res!83770) (not e!116579))))

(declare-fun e!116581 () Bool)

(assert (=> b!176743 (= res!83770 (not e!116581))))

(declare-fun res!83771 () Bool)

(assert (=> b!176743 (=> (not res!83771) (not e!116581))))

(assert (=> b!176743 (= res!83771 (validKeyInArray!0 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17860 () Bool)

(declare-fun call!17863 () Bool)

(declare-fun c!31679 () Bool)

(assert (=> bm!17860 (= call!17863 (arrayNoDuplicates!0 (_keys!5499 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31679 (Cons!2211 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000) Nil!2212) Nil!2212)))))

(declare-fun d!53765 () Bool)

(declare-fun res!83769 () Bool)

(assert (=> d!53765 (=> res!83769 e!116580)))

(assert (=> d!53765 (= res!83769 (bvsge #b00000000000000000000000000000000 (size!3810 (_keys!5499 thiss!1248))))))

(assert (=> d!53765 (= (arrayNoDuplicates!0 (_keys!5499 thiss!1248) #b00000000000000000000000000000000 Nil!2212) e!116580)))

(declare-fun b!176744 () Bool)

(declare-fun e!116582 () Bool)

(assert (=> b!176744 (= e!116579 e!116582)))

(assert (=> b!176744 (= c!31679 (validKeyInArray!0 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176745 () Bool)

(declare-fun contains!1178 (List!2215 (_ BitVec 64)) Bool)

(assert (=> b!176745 (= e!116581 (contains!1178 Nil!2212 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176746 () Bool)

(assert (=> b!176746 (= e!116582 call!17863)))

(declare-fun b!176747 () Bool)

(assert (=> b!176747 (= e!116582 call!17863)))

(assert (= (and d!53765 (not res!83769)) b!176743))

(assert (= (and b!176743 res!83771) b!176745))

(assert (= (and b!176743 res!83770) b!176744))

(assert (= (and b!176744 c!31679) b!176746))

(assert (= (and b!176744 (not c!31679)) b!176747))

(assert (= (or b!176746 b!176747) bm!17860))

(assert (=> b!176743 m!205611))

(assert (=> b!176743 m!205611))

(assert (=> b!176743 m!205613))

(assert (=> bm!17860 m!205611))

(declare-fun m!205621 () Bool)

(assert (=> bm!17860 m!205621))

(assert (=> b!176744 m!205611))

(assert (=> b!176744 m!205611))

(assert (=> b!176744 m!205613))

(assert (=> b!176745 m!205611))

(assert (=> b!176745 m!205611))

(declare-fun m!205623 () Bool)

(assert (=> b!176745 m!205623))

(assert (=> b!176638 d!53765))

(declare-fun d!53767 () Bool)

(declare-fun e!116588 () Bool)

(assert (=> d!53767 e!116588))

(declare-fun res!83774 () Bool)

(assert (=> d!53767 (=> res!83774 e!116588)))

(declare-fun lt!87452 () Bool)

(assert (=> d!53767 (= res!83774 (not lt!87452))))

(declare-fun lt!87453 () Bool)

(assert (=> d!53767 (= lt!87452 lt!87453)))

(declare-fun lt!87455 () Unit!5409)

(declare-fun e!116587 () Unit!5409)

(assert (=> d!53767 (= lt!87455 e!116587)))

(declare-fun c!31682 () Bool)

(assert (=> d!53767 (= c!31682 lt!87453)))

(declare-fun containsKey!197 (List!2216 (_ BitVec 64)) Bool)

(assert (=> d!53767 (= lt!87453 (containsKey!197 (toList!1102 (getCurrentListMap!757 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248))) key!828))))

(assert (=> d!53767 (= (contains!1177 (getCurrentListMap!757 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)) key!828) lt!87452)))

(declare-fun b!176754 () Bool)

(declare-fun lt!87454 () Unit!5409)

(assert (=> b!176754 (= e!116587 lt!87454)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!145 (List!2216 (_ BitVec 64)) Unit!5409)

(assert (=> b!176754 (= lt!87454 (lemmaContainsKeyImpliesGetValueByKeyDefined!145 (toList!1102 (getCurrentListMap!757 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248))) key!828))))

(declare-datatypes ((Option!200 0))(
  ( (Some!199 (v!3991 V!5153)) (None!198) )
))
(declare-fun isDefined!146 (Option!200) Bool)

(declare-fun getValueByKey!194 (List!2216 (_ BitVec 64)) Option!200)

(assert (=> b!176754 (isDefined!146 (getValueByKey!194 (toList!1102 (getCurrentListMap!757 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248))) key!828))))

(declare-fun b!176755 () Bool)

(declare-fun Unit!5411 () Unit!5409)

(assert (=> b!176755 (= e!116587 Unit!5411)))

(declare-fun b!176756 () Bool)

(assert (=> b!176756 (= e!116588 (isDefined!146 (getValueByKey!194 (toList!1102 (getCurrentListMap!757 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248))) key!828)))))

(assert (= (and d!53767 c!31682) b!176754))

(assert (= (and d!53767 (not c!31682)) b!176755))

(assert (= (and d!53767 (not res!83774)) b!176756))

(declare-fun m!205625 () Bool)

(assert (=> d!53767 m!205625))

(declare-fun m!205627 () Bool)

(assert (=> b!176754 m!205627))

(declare-fun m!205629 () Bool)

(assert (=> b!176754 m!205629))

(assert (=> b!176754 m!205629))

(declare-fun m!205631 () Bool)

(assert (=> b!176754 m!205631))

(assert (=> b!176756 m!205629))

(assert (=> b!176756 m!205629))

(assert (=> b!176756 m!205631))

(assert (=> b!176645 d!53767))

(declare-fun b!176799 () Bool)

(declare-fun e!116622 () Bool)

(declare-fun call!17884 () Bool)

(assert (=> b!176799 (= e!116622 (not call!17884))))

(declare-fun b!176800 () Bool)

(declare-fun c!31697 () Bool)

(assert (=> b!176800 (= c!31697 (and (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!116625 () ListLongMap!2173)

(declare-fun e!116623 () ListLongMap!2173)

(assert (=> b!176800 (= e!116625 e!116623)))

(declare-fun b!176801 () Bool)

(declare-fun e!116616 () Bool)

(assert (=> b!176801 (= e!116622 e!116616)))

(declare-fun res!83798 () Bool)

(assert (=> b!176801 (= res!83798 call!17884)))

(assert (=> b!176801 (=> (not res!83798) (not e!116616))))

(declare-fun b!176802 () Bool)

(declare-fun e!116626 () Bool)

(declare-fun e!116627 () Bool)

(assert (=> b!176802 (= e!116626 e!116627)))

(declare-fun res!83795 () Bool)

(assert (=> b!176802 (=> (not res!83795) (not e!116627))))

(declare-fun lt!87510 () ListLongMap!2173)

(assert (=> b!176802 (= res!83795 (contains!1177 lt!87510 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3810 (_keys!5499 thiss!1248))))))

(declare-fun d!53769 () Bool)

(declare-fun e!116621 () Bool)

(assert (=> d!53769 e!116621))

(declare-fun res!83794 () Bool)

(assert (=> d!53769 (=> (not res!83794) (not e!116621))))

(assert (=> d!53769 (= res!83794 (or (bvsge #b00000000000000000000000000000000 (size!3810 (_keys!5499 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3810 (_keys!5499 thiss!1248))))))))

(declare-fun lt!87500 () ListLongMap!2173)

(assert (=> d!53769 (= lt!87510 lt!87500)))

(declare-fun lt!87519 () Unit!5409)

(declare-fun e!116624 () Unit!5409)

(assert (=> d!53769 (= lt!87519 e!116624)))

(declare-fun c!31699 () Bool)

(declare-fun e!116615 () Bool)

(assert (=> d!53769 (= c!31699 e!116615)))

(declare-fun res!83797 () Bool)

(assert (=> d!53769 (=> (not res!83797) (not e!116615))))

(assert (=> d!53769 (= res!83797 (bvslt #b00000000000000000000000000000000 (size!3810 (_keys!5499 thiss!1248))))))

(declare-fun e!116618 () ListLongMap!2173)

(assert (=> d!53769 (= lt!87500 e!116618)))

(declare-fun c!31696 () Bool)

(assert (=> d!53769 (= c!31696 (and (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53769 (validMask!0 (mask!8558 thiss!1248))))

(assert (=> d!53769 (= (getCurrentListMap!757 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)) lt!87510)))

(declare-fun b!176803 () Bool)

(declare-fun Unit!5412 () Unit!5409)

(assert (=> b!176803 (= e!116624 Unit!5412)))

(declare-fun bm!17875 () Bool)

(assert (=> bm!17875 (= call!17884 (contains!1177 lt!87510 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176804 () Bool)

(declare-fun apply!138 (ListLongMap!2173 (_ BitVec 64)) V!5153)

(declare-fun get!2013 (ValueCell!1721 V!5153) V!5153)

(declare-fun dynLambda!481 (Int (_ BitVec 64)) V!5153)

(assert (=> b!176804 (= e!116627 (= (apply!138 lt!87510 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000)) (get!2013 (select (arr!3507 (_values!3619 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!481 (defaultEntry!3636 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3811 (_values!3619 thiss!1248))))))

(assert (=> b!176804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3810 (_keys!5499 thiss!1248))))))

(declare-fun bm!17876 () Bool)

(declare-fun call!17881 () ListLongMap!2173)

(declare-fun call!17883 () ListLongMap!2173)

(assert (=> bm!17876 (= call!17881 call!17883)))

(declare-fun b!176805 () Bool)

(declare-fun e!116617 () Bool)

(declare-fun e!116620 () Bool)

(assert (=> b!176805 (= e!116617 e!116620)))

(declare-fun res!83801 () Bool)

(declare-fun call!17879 () Bool)

(assert (=> b!176805 (= res!83801 call!17879)))

(assert (=> b!176805 (=> (not res!83801) (not e!116620))))

(declare-fun b!176806 () Bool)

(declare-fun e!116619 () Bool)

(assert (=> b!176806 (= e!116619 (validKeyInArray!0 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176807 () Bool)

(declare-fun call!17880 () ListLongMap!2173)

(assert (=> b!176807 (= e!116625 call!17880)))

(declare-fun bm!17877 () Bool)

(declare-fun call!17878 () ListLongMap!2173)

(assert (=> bm!17877 (= call!17883 call!17878)))

(declare-fun b!176808 () Bool)

(declare-fun res!83796 () Bool)

(assert (=> b!176808 (=> (not res!83796) (not e!116621))))

(assert (=> b!176808 (= res!83796 e!116626)))

(declare-fun res!83800 () Bool)

(assert (=> b!176808 (=> res!83800 e!116626)))

(assert (=> b!176808 (= res!83800 (not e!116619))))

(declare-fun res!83799 () Bool)

(assert (=> b!176808 (=> (not res!83799) (not e!116619))))

(assert (=> b!176808 (= res!83799 (bvslt #b00000000000000000000000000000000 (size!3810 (_keys!5499 thiss!1248))))))

(declare-fun b!176809 () Bool)

(assert (=> b!176809 (= e!116618 e!116625)))

(declare-fun c!31695 () Bool)

(assert (=> b!176809 (= c!31695 (and (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176810 () Bool)

(assert (=> b!176810 (= e!116621 e!116622)))

(declare-fun c!31698 () Bool)

(assert (=> b!176810 (= c!31698 (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176811 () Bool)

(assert (=> b!176811 (= e!116623 call!17881)))

(declare-fun bm!17878 () Bool)

(assert (=> bm!17878 (= call!17879 (contains!1177 lt!87510 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17879 () Bool)

(declare-fun call!17882 () ListLongMap!2173)

(assert (=> bm!17879 (= call!17880 call!17882)))

(declare-fun b!176812 () Bool)

(assert (=> b!176812 (= e!116615 (validKeyInArray!0 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176813 () Bool)

(assert (=> b!176813 (= e!116617 (not call!17879))))

(declare-fun b!176814 () Bool)

(declare-fun +!255 (ListLongMap!2173 tuple2!3240) ListLongMap!2173)

(assert (=> b!176814 (= e!116618 (+!255 call!17882 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3477 thiss!1248))))))

(declare-fun b!176815 () Bool)

(assert (=> b!176815 (= e!116623 call!17880)))

(declare-fun b!176816 () Bool)

(declare-fun lt!87503 () Unit!5409)

(assert (=> b!176816 (= e!116624 lt!87503)))

(declare-fun lt!87517 () ListLongMap!2173)

(declare-fun getCurrentListMapNoExtraKeys!169 (array!7391 array!7393 (_ BitVec 32) (_ BitVec 32) V!5153 V!5153 (_ BitVec 32) Int) ListLongMap!2173)

(assert (=> b!176816 (= lt!87517 (getCurrentListMapNoExtraKeys!169 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)))))

(declare-fun lt!87506 () (_ BitVec 64))

(assert (=> b!176816 (= lt!87506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87504 () (_ BitVec 64))

(assert (=> b!176816 (= lt!87504 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87502 () Unit!5409)

(declare-fun addStillContains!114 (ListLongMap!2173 (_ BitVec 64) V!5153 (_ BitVec 64)) Unit!5409)

(assert (=> b!176816 (= lt!87502 (addStillContains!114 lt!87517 lt!87506 (zeroValue!3477 thiss!1248) lt!87504))))

(assert (=> b!176816 (contains!1177 (+!255 lt!87517 (tuple2!3241 lt!87506 (zeroValue!3477 thiss!1248))) lt!87504)))

(declare-fun lt!87516 () Unit!5409)

(assert (=> b!176816 (= lt!87516 lt!87502)))

(declare-fun lt!87501 () ListLongMap!2173)

(assert (=> b!176816 (= lt!87501 (getCurrentListMapNoExtraKeys!169 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)))))

(declare-fun lt!87507 () (_ BitVec 64))

(assert (=> b!176816 (= lt!87507 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87508 () (_ BitVec 64))

(assert (=> b!176816 (= lt!87508 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87513 () Unit!5409)

(declare-fun addApplyDifferent!114 (ListLongMap!2173 (_ BitVec 64) V!5153 (_ BitVec 64)) Unit!5409)

(assert (=> b!176816 (= lt!87513 (addApplyDifferent!114 lt!87501 lt!87507 (minValue!3477 thiss!1248) lt!87508))))

(assert (=> b!176816 (= (apply!138 (+!255 lt!87501 (tuple2!3241 lt!87507 (minValue!3477 thiss!1248))) lt!87508) (apply!138 lt!87501 lt!87508))))

(declare-fun lt!87512 () Unit!5409)

(assert (=> b!176816 (= lt!87512 lt!87513)))

(declare-fun lt!87521 () ListLongMap!2173)

(assert (=> b!176816 (= lt!87521 (getCurrentListMapNoExtraKeys!169 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)))))

(declare-fun lt!87505 () (_ BitVec 64))

(assert (=> b!176816 (= lt!87505 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87520 () (_ BitVec 64))

(assert (=> b!176816 (= lt!87520 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87515 () Unit!5409)

(assert (=> b!176816 (= lt!87515 (addApplyDifferent!114 lt!87521 lt!87505 (zeroValue!3477 thiss!1248) lt!87520))))

(assert (=> b!176816 (= (apply!138 (+!255 lt!87521 (tuple2!3241 lt!87505 (zeroValue!3477 thiss!1248))) lt!87520) (apply!138 lt!87521 lt!87520))))

(declare-fun lt!87509 () Unit!5409)

(assert (=> b!176816 (= lt!87509 lt!87515)))

(declare-fun lt!87518 () ListLongMap!2173)

(assert (=> b!176816 (= lt!87518 (getCurrentListMapNoExtraKeys!169 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)))))

(declare-fun lt!87514 () (_ BitVec 64))

(assert (=> b!176816 (= lt!87514 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87511 () (_ BitVec 64))

(assert (=> b!176816 (= lt!87511 (select (arr!3506 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176816 (= lt!87503 (addApplyDifferent!114 lt!87518 lt!87514 (minValue!3477 thiss!1248) lt!87511))))

(assert (=> b!176816 (= (apply!138 (+!255 lt!87518 (tuple2!3241 lt!87514 (minValue!3477 thiss!1248))) lt!87511) (apply!138 lt!87518 lt!87511))))

(declare-fun b!176817 () Bool)

(assert (=> b!176817 (= e!116620 (= (apply!138 lt!87510 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3477 thiss!1248)))))

(declare-fun bm!17880 () Bool)

(assert (=> bm!17880 (= call!17878 (getCurrentListMapNoExtraKeys!169 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)))))

(declare-fun bm!17881 () Bool)

(assert (=> bm!17881 (= call!17882 (+!255 (ite c!31696 call!17878 (ite c!31695 call!17883 call!17881)) (ite (or c!31696 c!31695) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3477 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3477 thiss!1248)))))))

(declare-fun b!176818 () Bool)

(assert (=> b!176818 (= e!116616 (= (apply!138 lt!87510 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3477 thiss!1248)))))

(declare-fun b!176819 () Bool)

(declare-fun res!83793 () Bool)

(assert (=> b!176819 (=> (not res!83793) (not e!116621))))

(assert (=> b!176819 (= res!83793 e!116617)))

(declare-fun c!31700 () Bool)

(assert (=> b!176819 (= c!31700 (not (= (bvand (extraKeys!3373 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!53769 c!31696) b!176814))

(assert (= (and d!53769 (not c!31696)) b!176809))

(assert (= (and b!176809 c!31695) b!176807))

(assert (= (and b!176809 (not c!31695)) b!176800))

(assert (= (and b!176800 c!31697) b!176815))

(assert (= (and b!176800 (not c!31697)) b!176811))

(assert (= (or b!176815 b!176811) bm!17876))

(assert (= (or b!176807 bm!17876) bm!17877))

(assert (= (or b!176807 b!176815) bm!17879))

(assert (= (or b!176814 bm!17877) bm!17880))

(assert (= (or b!176814 bm!17879) bm!17881))

(assert (= (and d!53769 res!83797) b!176812))

(assert (= (and d!53769 c!31699) b!176816))

(assert (= (and d!53769 (not c!31699)) b!176803))

(assert (= (and d!53769 res!83794) b!176808))

(assert (= (and b!176808 res!83799) b!176806))

(assert (= (and b!176808 (not res!83800)) b!176802))

(assert (= (and b!176802 res!83795) b!176804))

(assert (= (and b!176808 res!83796) b!176819))

(assert (= (and b!176819 c!31700) b!176805))

(assert (= (and b!176819 (not c!31700)) b!176813))

(assert (= (and b!176805 res!83801) b!176817))

(assert (= (or b!176805 b!176813) bm!17878))

(assert (= (and b!176819 res!83793) b!176810))

(assert (= (and b!176810 c!31698) b!176801))

(assert (= (and b!176810 (not c!31698)) b!176799))

(assert (= (and b!176801 res!83798) b!176818))

(assert (= (or b!176801 b!176799) bm!17875))

(declare-fun b_lambda!7065 () Bool)

(assert (=> (not b_lambda!7065) (not b!176804)))

(declare-fun t!7037 () Bool)

(declare-fun tb!2779 () Bool)

(assert (=> (and b!176640 (= (defaultEntry!3636 thiss!1248) (defaultEntry!3636 thiss!1248)) t!7037) tb!2779))

(declare-fun result!4627 () Bool)

(assert (=> tb!2779 (= result!4627 tp_is_empty!4129)))

(assert (=> b!176804 t!7037))

(declare-fun b_and!10873 () Bool)

(assert (= b_and!10867 (and (=> t!7037 result!4627) b_and!10873)))

(assert (=> b!176806 m!205611))

(assert (=> b!176806 m!205611))

(assert (=> b!176806 m!205613))

(declare-fun m!205633 () Bool)

(assert (=> b!176817 m!205633))

(declare-fun m!205635 () Bool)

(assert (=> bm!17875 m!205635))

(assert (=> b!176802 m!205611))

(assert (=> b!176802 m!205611))

(declare-fun m!205637 () Bool)

(assert (=> b!176802 m!205637))

(declare-fun m!205639 () Bool)

(assert (=> bm!17880 m!205639))

(declare-fun m!205641 () Bool)

(assert (=> bm!17881 m!205641))

(assert (=> b!176816 m!205611))

(declare-fun m!205643 () Bool)

(assert (=> b!176816 m!205643))

(declare-fun m!205645 () Bool)

(assert (=> b!176816 m!205645))

(assert (=> b!176816 m!205643))

(declare-fun m!205647 () Bool)

(assert (=> b!176816 m!205647))

(declare-fun m!205649 () Bool)

(assert (=> b!176816 m!205649))

(assert (=> b!176816 m!205639))

(declare-fun m!205651 () Bool)

(assert (=> b!176816 m!205651))

(declare-fun m!205653 () Bool)

(assert (=> b!176816 m!205653))

(declare-fun m!205655 () Bool)

(assert (=> b!176816 m!205655))

(declare-fun m!205657 () Bool)

(assert (=> b!176816 m!205657))

(assert (=> b!176816 m!205651))

(declare-fun m!205659 () Bool)

(assert (=> b!176816 m!205659))

(declare-fun m!205661 () Bool)

(assert (=> b!176816 m!205661))

(declare-fun m!205663 () Bool)

(assert (=> b!176816 m!205663))

(assert (=> b!176816 m!205657))

(declare-fun m!205665 () Bool)

(assert (=> b!176816 m!205665))

(declare-fun m!205667 () Bool)

(assert (=> b!176816 m!205667))

(declare-fun m!205669 () Bool)

(assert (=> b!176816 m!205669))

(assert (=> b!176816 m!205661))

(declare-fun m!205671 () Bool)

(assert (=> b!176816 m!205671))

(declare-fun m!205673 () Bool)

(assert (=> b!176814 m!205673))

(declare-fun m!205675 () Bool)

(assert (=> bm!17878 m!205675))

(assert (=> b!176804 m!205611))

(declare-fun m!205677 () Bool)

(assert (=> b!176804 m!205677))

(declare-fun m!205679 () Bool)

(assert (=> b!176804 m!205679))

(assert (=> b!176804 m!205611))

(declare-fun m!205681 () Bool)

(assert (=> b!176804 m!205681))

(assert (=> b!176804 m!205679))

(assert (=> b!176804 m!205677))

(declare-fun m!205683 () Bool)

(assert (=> b!176804 m!205683))

(declare-fun m!205685 () Bool)

(assert (=> b!176818 m!205685))

(assert (=> b!176812 m!205611))

(assert (=> b!176812 m!205611))

(assert (=> b!176812 m!205613))

(assert (=> d!53769 m!205555))

(assert (=> b!176645 d!53769))

(declare-fun d!53771 () Bool)

(assert (=> d!53771 (= (array_inv!2263 (_keys!5499 thiss!1248)) (bvsge (size!3810 (_keys!5499 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176640 d!53771))

(declare-fun d!53773 () Bool)

(assert (=> d!53773 (= (array_inv!2264 (_values!3619 thiss!1248)) (bvsge (size!3811 (_values!3619 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176640 d!53773))

(declare-fun b!176834 () Bool)

(declare-fun c!31709 () Bool)

(declare-fun lt!87530 () (_ BitVec 64))

(assert (=> b!176834 (= c!31709 (= lt!87530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116635 () SeekEntryResult!553)

(declare-fun e!116636 () SeekEntryResult!553)

(assert (=> b!176834 (= e!116635 e!116636)))

(declare-fun d!53775 () Bool)

(declare-fun lt!87529 () SeekEntryResult!553)

(assert (=> d!53775 (and (or ((_ is Undefined!553) lt!87529) (not ((_ is Found!553) lt!87529)) (and (bvsge (index!4381 lt!87529) #b00000000000000000000000000000000) (bvslt (index!4381 lt!87529) (size!3810 (_keys!5499 thiss!1248))))) (or ((_ is Undefined!553) lt!87529) ((_ is Found!553) lt!87529) (not ((_ is MissingZero!553) lt!87529)) (and (bvsge (index!4380 lt!87529) #b00000000000000000000000000000000) (bvslt (index!4380 lt!87529) (size!3810 (_keys!5499 thiss!1248))))) (or ((_ is Undefined!553) lt!87529) ((_ is Found!553) lt!87529) ((_ is MissingZero!553) lt!87529) (not ((_ is MissingVacant!553) lt!87529)) (and (bvsge (index!4383 lt!87529) #b00000000000000000000000000000000) (bvslt (index!4383 lt!87529) (size!3810 (_keys!5499 thiss!1248))))) (or ((_ is Undefined!553) lt!87529) (ite ((_ is Found!553) lt!87529) (= (select (arr!3506 (_keys!5499 thiss!1248)) (index!4381 lt!87529)) key!828) (ite ((_ is MissingZero!553) lt!87529) (= (select (arr!3506 (_keys!5499 thiss!1248)) (index!4380 lt!87529)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!553) lt!87529) (= (select (arr!3506 (_keys!5499 thiss!1248)) (index!4383 lt!87529)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!116634 () SeekEntryResult!553)

(assert (=> d!53775 (= lt!87529 e!116634)))

(declare-fun c!31707 () Bool)

(declare-fun lt!87528 () SeekEntryResult!553)

(assert (=> d!53775 (= c!31707 (and ((_ is Intermediate!553) lt!87528) (undefined!1365 lt!87528)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7391 (_ BitVec 32)) SeekEntryResult!553)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53775 (= lt!87528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8558 thiss!1248)) key!828 (_keys!5499 thiss!1248) (mask!8558 thiss!1248)))))

(assert (=> d!53775 (validMask!0 (mask!8558 thiss!1248))))

(assert (=> d!53775 (= (seekEntryOrOpen!0 key!828 (_keys!5499 thiss!1248) (mask!8558 thiss!1248)) lt!87529)))

(declare-fun b!176835 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7391 (_ BitVec 32)) SeekEntryResult!553)

(assert (=> b!176835 (= e!116636 (seekKeyOrZeroReturnVacant!0 (x!19381 lt!87528) (index!4382 lt!87528) (index!4382 lt!87528) key!828 (_keys!5499 thiss!1248) (mask!8558 thiss!1248)))))

(declare-fun b!176836 () Bool)

(assert (=> b!176836 (= e!116634 Undefined!553)))

(declare-fun b!176837 () Bool)

(assert (=> b!176837 (= e!116635 (Found!553 (index!4382 lt!87528)))))

(declare-fun b!176838 () Bool)

(assert (=> b!176838 (= e!116634 e!116635)))

(assert (=> b!176838 (= lt!87530 (select (arr!3506 (_keys!5499 thiss!1248)) (index!4382 lt!87528)))))

(declare-fun c!31708 () Bool)

(assert (=> b!176838 (= c!31708 (= lt!87530 key!828))))

(declare-fun b!176839 () Bool)

(assert (=> b!176839 (= e!116636 (MissingZero!553 (index!4382 lt!87528)))))

(assert (= (and d!53775 c!31707) b!176836))

(assert (= (and d!53775 (not c!31707)) b!176838))

(assert (= (and b!176838 c!31708) b!176837))

(assert (= (and b!176838 (not c!31708)) b!176834))

(assert (= (and b!176834 c!31709) b!176839))

(assert (= (and b!176834 (not c!31709)) b!176835))

(declare-fun m!205687 () Bool)

(assert (=> d!53775 m!205687))

(assert (=> d!53775 m!205555))

(declare-fun m!205689 () Bool)

(assert (=> d!53775 m!205689))

(declare-fun m!205691 () Bool)

(assert (=> d!53775 m!205691))

(assert (=> d!53775 m!205687))

(declare-fun m!205693 () Bool)

(assert (=> d!53775 m!205693))

(declare-fun m!205695 () Bool)

(assert (=> d!53775 m!205695))

(declare-fun m!205697 () Bool)

(assert (=> b!176835 m!205697))

(declare-fun m!205699 () Bool)

(assert (=> b!176838 m!205699))

(assert (=> b!176635 d!53775))

(declare-fun d!53777 () Bool)

(assert (=> d!53777 (= (validMask!0 (mask!8558 thiss!1248)) (and (or (= (mask!8558 thiss!1248) #b00000000000000000000000000000111) (= (mask!8558 thiss!1248) #b00000000000000000000000000001111) (= (mask!8558 thiss!1248) #b00000000000000000000000000011111) (= (mask!8558 thiss!1248) #b00000000000000000000000000111111) (= (mask!8558 thiss!1248) #b00000000000000000000000001111111) (= (mask!8558 thiss!1248) #b00000000000000000000000011111111) (= (mask!8558 thiss!1248) #b00000000000000000000000111111111) (= (mask!8558 thiss!1248) #b00000000000000000000001111111111) (= (mask!8558 thiss!1248) #b00000000000000000000011111111111) (= (mask!8558 thiss!1248) #b00000000000000000000111111111111) (= (mask!8558 thiss!1248) #b00000000000000000001111111111111) (= (mask!8558 thiss!1248) #b00000000000000000011111111111111) (= (mask!8558 thiss!1248) #b00000000000000000111111111111111) (= (mask!8558 thiss!1248) #b00000000000000001111111111111111) (= (mask!8558 thiss!1248) #b00000000000000011111111111111111) (= (mask!8558 thiss!1248) #b00000000000000111111111111111111) (= (mask!8558 thiss!1248) #b00000000000001111111111111111111) (= (mask!8558 thiss!1248) #b00000000000011111111111111111111) (= (mask!8558 thiss!1248) #b00000000000111111111111111111111) (= (mask!8558 thiss!1248) #b00000000001111111111111111111111) (= (mask!8558 thiss!1248) #b00000000011111111111111111111111) (= (mask!8558 thiss!1248) #b00000000111111111111111111111111) (= (mask!8558 thiss!1248) #b00000001111111111111111111111111) (= (mask!8558 thiss!1248) #b00000011111111111111111111111111) (= (mask!8558 thiss!1248) #b00000111111111111111111111111111) (= (mask!8558 thiss!1248) #b00001111111111111111111111111111) (= (mask!8558 thiss!1248) #b00011111111111111111111111111111) (= (mask!8558 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8558 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176644 d!53777))

(declare-fun b!176846 () Bool)

(declare-fun e!116642 () Bool)

(assert (=> b!176846 (= e!116642 tp_is_empty!4129)))

(declare-fun b!176847 () Bool)

(declare-fun e!116641 () Bool)

(assert (=> b!176847 (= e!116641 tp_is_empty!4129)))

(declare-fun mapNonEmpty!7059 () Bool)

(declare-fun mapRes!7059 () Bool)

(declare-fun tp!15780 () Bool)

(assert (=> mapNonEmpty!7059 (= mapRes!7059 (and tp!15780 e!116642))))

(declare-fun mapRest!7059 () (Array (_ BitVec 32) ValueCell!1721))

(declare-fun mapValue!7059 () ValueCell!1721)

(declare-fun mapKey!7059 () (_ BitVec 32))

(assert (=> mapNonEmpty!7059 (= mapRest!7050 (store mapRest!7059 mapKey!7059 mapValue!7059))))

(declare-fun condMapEmpty!7059 () Bool)

(declare-fun mapDefault!7059 () ValueCell!1721)

(assert (=> mapNonEmpty!7050 (= condMapEmpty!7059 (= mapRest!7050 ((as const (Array (_ BitVec 32) ValueCell!1721)) mapDefault!7059)))))

(assert (=> mapNonEmpty!7050 (= tp!15765 (and e!116641 mapRes!7059))))

(declare-fun mapIsEmpty!7059 () Bool)

(assert (=> mapIsEmpty!7059 mapRes!7059))

(assert (= (and mapNonEmpty!7050 condMapEmpty!7059) mapIsEmpty!7059))

(assert (= (and mapNonEmpty!7050 (not condMapEmpty!7059)) mapNonEmpty!7059))

(assert (= (and mapNonEmpty!7059 ((_ is ValueCellFull!1721) mapValue!7059)) b!176846))

(assert (= (and mapNonEmpty!7050 ((_ is ValueCellFull!1721) mapDefault!7059)) b!176847))

(declare-fun m!205701 () Bool)

(assert (=> mapNonEmpty!7059 m!205701))

(declare-fun b_lambda!7067 () Bool)

(assert (= b_lambda!7065 (or (and b!176640 b_free!4357) b_lambda!7067)))

(check-sat (not bm!17875) tp_is_empty!4129 (not b!176804) (not b!176744) (not d!53769) (not b_next!4357) (not b!176756) (not b!176818) (not b!176812) (not mapNonEmpty!7059) (not b!176729) (not bm!17878) (not d!53761) (not b!176835) (not b!176816) (not b_lambda!7067) b_and!10873 (not bm!17881) (not bm!17857) (not b!176814) (not b!176719) (not bm!17860) (not b!176743) (not b!176730) (not b!176817) (not d!53775) (not b!176745) (not d!53767) (not b!176802) (not bm!17880) (not b!176718) (not b!176754) (not b!176806) (not b!176720))
(check-sat b_and!10873 (not b_next!4357))
