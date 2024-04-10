; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18142 () Bool)

(assert start!18142)

(declare-fun b!180641 () Bool)

(declare-fun b_free!4467 () Bool)

(declare-fun b_next!4467 () Bool)

(assert (=> b!180641 (= b_free!4467 (not b_next!4467))))

(declare-fun tp!16141 () Bool)

(declare-fun b_and!11003 () Bool)

(assert (=> b!180641 (= tp!16141 b_and!11003)))

(declare-fun res!85553 () Bool)

(declare-fun e!118999 () Bool)

(assert (=> start!18142 (=> (not res!85553) (not e!118999))))

(declare-datatypes ((V!5299 0))(
  ( (V!5300 (val!2164 Int)) )
))
(declare-datatypes ((ValueCell!1776 0))(
  ( (ValueCellFull!1776 (v!4058 V!5299)) (EmptyCell!1776) )
))
(declare-datatypes ((array!7653 0))(
  ( (array!7654 (arr!3623 (Array (_ BitVec 32) (_ BitVec 64))) (size!3931 (_ BitVec 32))) )
))
(declare-datatypes ((array!7655 0))(
  ( (array!7656 (arr!3624 (Array (_ BitVec 32) ValueCell!1776)) (size!3932 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2460 0))(
  ( (LongMapFixedSize!2461 (defaultEntry!3707 Int) (mask!8712 (_ BitVec 32)) (extraKeys!3444 (_ BitVec 32)) (zeroValue!3548 V!5299) (minValue!3548 V!5299) (_size!1279 (_ BitVec 32)) (_keys!5601 array!7653) (_values!3690 array!7655) (_vacant!1279 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2460)

(declare-fun valid!1022 (LongMapFixedSize!2460) Bool)

(assert (=> start!18142 (= res!85553 (valid!1022 thiss!1248))))

(assert (=> start!18142 e!118999))

(declare-fun e!118998 () Bool)

(assert (=> start!18142 e!118998))

(assert (=> start!18142 true))

(declare-fun b!180633 () Bool)

(declare-fun e!118995 () Bool)

(declare-fun tp_is_empty!4239 () Bool)

(assert (=> b!180633 (= e!118995 tp_is_empty!4239)))

(declare-fun b!180634 () Bool)

(declare-fun e!119001 () Bool)

(declare-fun mapRes!7261 () Bool)

(assert (=> b!180634 (= e!119001 (and e!118995 mapRes!7261))))

(declare-fun condMapEmpty!7261 () Bool)

(declare-fun mapDefault!7261 () ValueCell!1776)

(assert (=> b!180634 (= condMapEmpty!7261 (= (arr!3624 (_values!3690 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1776)) mapDefault!7261)))))

(declare-fun mapNonEmpty!7261 () Bool)

(declare-fun tp!16140 () Bool)

(declare-fun e!118997 () Bool)

(assert (=> mapNonEmpty!7261 (= mapRes!7261 (and tp!16140 e!118997))))

(declare-fun mapRest!7261 () (Array (_ BitVec 32) ValueCell!1776))

(declare-fun mapValue!7261 () ValueCell!1776)

(declare-fun mapKey!7261 () (_ BitVec 32))

(assert (=> mapNonEmpty!7261 (= (arr!3624 (_values!3690 thiss!1248)) (store mapRest!7261 mapKey!7261 mapValue!7261))))

(declare-fun b!180635 () Bool)

(declare-fun res!85555 () Bool)

(declare-fun e!119000 () Bool)

(assert (=> b!180635 (=> (not res!85555) (not e!119000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!180635 (= res!85555 (validMask!0 (mask!8712 thiss!1248)))))

(declare-fun b!180636 () Bool)

(assert (=> b!180636 (= e!118999 e!119000)))

(declare-fun res!85552 () Bool)

(assert (=> b!180636 (=> (not res!85552) (not e!119000))))

(declare-datatypes ((SeekEntryResult!595 0))(
  ( (MissingZero!595 (index!4550 (_ BitVec 32))) (Found!595 (index!4551 (_ BitVec 32))) (Intermediate!595 (undefined!1407 Bool) (index!4552 (_ BitVec 32)) (x!19747 (_ BitVec 32))) (Undefined!595) (MissingVacant!595 (index!4553 (_ BitVec 32))) )
))
(declare-fun lt!89273 () SeekEntryResult!595)

(get-info :version)

(assert (=> b!180636 (= res!85552 (and (not ((_ is Undefined!595) lt!89273)) (not ((_ is MissingVacant!595) lt!89273)) (not ((_ is MissingZero!595) lt!89273)) ((_ is Found!595) lt!89273)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7653 (_ BitVec 32)) SeekEntryResult!595)

(assert (=> b!180636 (= lt!89273 (seekEntryOrOpen!0 key!828 (_keys!5601 thiss!1248) (mask!8712 thiss!1248)))))

(declare-fun b!180637 () Bool)

(declare-fun res!85551 () Bool)

(assert (=> b!180637 (=> (not res!85551) (not e!119000))))

(declare-datatypes ((tuple2!3374 0))(
  ( (tuple2!3375 (_1!1698 (_ BitVec 64)) (_2!1698 V!5299)) )
))
(declare-datatypes ((List!2299 0))(
  ( (Nil!2296) (Cons!2295 (h!2920 tuple2!3374) (t!7149 List!2299)) )
))
(declare-datatypes ((ListLongMap!2291 0))(
  ( (ListLongMap!2292 (toList!1161 List!2299)) )
))
(declare-fun contains!1237 (ListLongMap!2291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!809 (array!7653 array!7655 (_ BitVec 32) (_ BitVec 32) V!5299 V!5299 (_ BitVec 32) Int) ListLongMap!2291)

(assert (=> b!180637 (= res!85551 (contains!1237 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)) key!828))))

(declare-fun b!180638 () Bool)

(assert (=> b!180638 (= e!118997 tp_is_empty!4239)))

(declare-fun b!180639 () Bool)

(assert (=> b!180639 (= e!119000 (not (= (size!3932 (_values!3690 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8712 thiss!1248)))))))

(declare-fun b!180640 () Bool)

(declare-fun res!85554 () Bool)

(assert (=> b!180640 (=> (not res!85554) (not e!118999))))

(assert (=> b!180640 (= res!85554 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2333 (array!7653) Bool)

(declare-fun array_inv!2334 (array!7655) Bool)

(assert (=> b!180641 (= e!118998 (and tp!16141 tp_is_empty!4239 (array_inv!2333 (_keys!5601 thiss!1248)) (array_inv!2334 (_values!3690 thiss!1248)) e!119001))))

(declare-fun mapIsEmpty!7261 () Bool)

(assert (=> mapIsEmpty!7261 mapRes!7261))

(assert (= (and start!18142 res!85553) b!180640))

(assert (= (and b!180640 res!85554) b!180636))

(assert (= (and b!180636 res!85552) b!180637))

(assert (= (and b!180637 res!85551) b!180635))

(assert (= (and b!180635 res!85555) b!180639))

(assert (= (and b!180634 condMapEmpty!7261) mapIsEmpty!7261))

(assert (= (and b!180634 (not condMapEmpty!7261)) mapNonEmpty!7261))

(assert (= (and mapNonEmpty!7261 ((_ is ValueCellFull!1776) mapValue!7261)) b!180638))

(assert (= (and b!180634 ((_ is ValueCellFull!1776) mapDefault!7261)) b!180633))

(assert (= b!180641 b!180634))

(assert (= start!18142 b!180641))

(declare-fun m!208615 () Bool)

(assert (=> mapNonEmpty!7261 m!208615))

(declare-fun m!208617 () Bool)

(assert (=> b!180636 m!208617))

(declare-fun m!208619 () Bool)

(assert (=> b!180641 m!208619))

(declare-fun m!208621 () Bool)

(assert (=> b!180641 m!208621))

(declare-fun m!208623 () Bool)

(assert (=> b!180635 m!208623))

(declare-fun m!208625 () Bool)

(assert (=> b!180637 m!208625))

(assert (=> b!180637 m!208625))

(declare-fun m!208627 () Bool)

(assert (=> b!180637 m!208627))

(declare-fun m!208629 () Bool)

(assert (=> start!18142 m!208629))

(check-sat (not start!18142) (not b!180637) (not mapNonEmpty!7261) (not b!180641) b_and!11003 (not b_next!4467) tp_is_empty!4239 (not b!180635) (not b!180636))
(check-sat b_and!11003 (not b_next!4467))
(get-model)

(declare-fun d!54249 () Bool)

(assert (=> d!54249 (= (array_inv!2333 (_keys!5601 thiss!1248)) (bvsge (size!3931 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180641 d!54249))

(declare-fun d!54251 () Bool)

(assert (=> d!54251 (= (array_inv!2334 (_values!3690 thiss!1248)) (bvsge (size!3932 (_values!3690 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180641 d!54251))

(declare-fun d!54253 () Bool)

(assert (=> d!54253 (= (validMask!0 (mask!8712 thiss!1248)) (and (or (= (mask!8712 thiss!1248) #b00000000000000000000000000000111) (= (mask!8712 thiss!1248) #b00000000000000000000000000001111) (= (mask!8712 thiss!1248) #b00000000000000000000000000011111) (= (mask!8712 thiss!1248) #b00000000000000000000000000111111) (= (mask!8712 thiss!1248) #b00000000000000000000000001111111) (= (mask!8712 thiss!1248) #b00000000000000000000000011111111) (= (mask!8712 thiss!1248) #b00000000000000000000000111111111) (= (mask!8712 thiss!1248) #b00000000000000000000001111111111) (= (mask!8712 thiss!1248) #b00000000000000000000011111111111) (= (mask!8712 thiss!1248) #b00000000000000000000111111111111) (= (mask!8712 thiss!1248) #b00000000000000000001111111111111) (= (mask!8712 thiss!1248) #b00000000000000000011111111111111) (= (mask!8712 thiss!1248) #b00000000000000000111111111111111) (= (mask!8712 thiss!1248) #b00000000000000001111111111111111) (= (mask!8712 thiss!1248) #b00000000000000011111111111111111) (= (mask!8712 thiss!1248) #b00000000000000111111111111111111) (= (mask!8712 thiss!1248) #b00000000000001111111111111111111) (= (mask!8712 thiss!1248) #b00000000000011111111111111111111) (= (mask!8712 thiss!1248) #b00000000000111111111111111111111) (= (mask!8712 thiss!1248) #b00000000001111111111111111111111) (= (mask!8712 thiss!1248) #b00000000011111111111111111111111) (= (mask!8712 thiss!1248) #b00000000111111111111111111111111) (= (mask!8712 thiss!1248) #b00000001111111111111111111111111) (= (mask!8712 thiss!1248) #b00000011111111111111111111111111) (= (mask!8712 thiss!1248) #b00000111111111111111111111111111) (= (mask!8712 thiss!1248) #b00001111111111111111111111111111) (= (mask!8712 thiss!1248) #b00011111111111111111111111111111) (= (mask!8712 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8712 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!180635 d!54253))

(declare-fun d!54255 () Bool)

(declare-fun res!85577 () Bool)

(declare-fun e!119025 () Bool)

(assert (=> d!54255 (=> (not res!85577) (not e!119025))))

(declare-fun simpleValid!166 (LongMapFixedSize!2460) Bool)

(assert (=> d!54255 (= res!85577 (simpleValid!166 thiss!1248))))

(assert (=> d!54255 (= (valid!1022 thiss!1248) e!119025)))

(declare-fun b!180675 () Bool)

(declare-fun res!85578 () Bool)

(assert (=> b!180675 (=> (not res!85578) (not e!119025))))

(declare-fun arrayCountValidKeys!0 (array!7653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180675 (= res!85578 (= (arrayCountValidKeys!0 (_keys!5601 thiss!1248) #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))) (_size!1279 thiss!1248)))))

(declare-fun b!180676 () Bool)

(declare-fun res!85579 () Bool)

(assert (=> b!180676 (=> (not res!85579) (not e!119025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7653 (_ BitVec 32)) Bool)

(assert (=> b!180676 (= res!85579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5601 thiss!1248) (mask!8712 thiss!1248)))))

(declare-fun b!180677 () Bool)

(declare-datatypes ((List!2301 0))(
  ( (Nil!2298) (Cons!2297 (h!2922 (_ BitVec 64)) (t!7153 List!2301)) )
))
(declare-fun arrayNoDuplicates!0 (array!7653 (_ BitVec 32) List!2301) Bool)

(assert (=> b!180677 (= e!119025 (arrayNoDuplicates!0 (_keys!5601 thiss!1248) #b00000000000000000000000000000000 Nil!2298))))

(assert (= (and d!54255 res!85577) b!180675))

(assert (= (and b!180675 res!85578) b!180676))

(assert (= (and b!180676 res!85579) b!180677))

(declare-fun m!208647 () Bool)

(assert (=> d!54255 m!208647))

(declare-fun m!208649 () Bool)

(assert (=> b!180675 m!208649))

(declare-fun m!208651 () Bool)

(assert (=> b!180676 m!208651))

(declare-fun m!208653 () Bool)

(assert (=> b!180677 m!208653))

(assert (=> start!18142 d!54255))

(declare-fun d!54257 () Bool)

(declare-fun e!119030 () Bool)

(assert (=> d!54257 e!119030))

(declare-fun res!85582 () Bool)

(assert (=> d!54257 (=> res!85582 e!119030)))

(declare-fun lt!89286 () Bool)

(assert (=> d!54257 (= res!85582 (not lt!89286))))

(declare-fun lt!89288 () Bool)

(assert (=> d!54257 (= lt!89286 lt!89288)))

(declare-datatypes ((Unit!5496 0))(
  ( (Unit!5497) )
))
(declare-fun lt!89287 () Unit!5496)

(declare-fun e!119031 () Unit!5496)

(assert (=> d!54257 (= lt!89287 e!119031)))

(declare-fun c!32345 () Bool)

(assert (=> d!54257 (= c!32345 lt!89288)))

(declare-fun containsKey!211 (List!2299 (_ BitVec 64)) Bool)

(assert (=> d!54257 (= lt!89288 (containsKey!211 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828))))

(assert (=> d!54257 (= (contains!1237 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)) key!828) lt!89286)))

(declare-fun b!180684 () Bool)

(declare-fun lt!89285 () Unit!5496)

(assert (=> b!180684 (= e!119031 lt!89285)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!159 (List!2299 (_ BitVec 64)) Unit!5496)

(assert (=> b!180684 (= lt!89285 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828))))

(declare-datatypes ((Option!213 0))(
  ( (Some!212 (v!4060 V!5299)) (None!211) )
))
(declare-fun isDefined!160 (Option!213) Bool)

(declare-fun getValueByKey!207 (List!2299 (_ BitVec 64)) Option!213)

(assert (=> b!180684 (isDefined!160 (getValueByKey!207 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828))))

(declare-fun b!180685 () Bool)

(declare-fun Unit!5498 () Unit!5496)

(assert (=> b!180685 (= e!119031 Unit!5498)))

(declare-fun b!180686 () Bool)

(assert (=> b!180686 (= e!119030 (isDefined!160 (getValueByKey!207 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828)))))

(assert (= (and d!54257 c!32345) b!180684))

(assert (= (and d!54257 (not c!32345)) b!180685))

(assert (= (and d!54257 (not res!85582)) b!180686))

(declare-fun m!208655 () Bool)

(assert (=> d!54257 m!208655))

(declare-fun m!208657 () Bool)

(assert (=> b!180684 m!208657))

(declare-fun m!208659 () Bool)

(assert (=> b!180684 m!208659))

(assert (=> b!180684 m!208659))

(declare-fun m!208661 () Bool)

(assert (=> b!180684 m!208661))

(assert (=> b!180686 m!208659))

(assert (=> b!180686 m!208659))

(assert (=> b!180686 m!208661))

(assert (=> b!180637 d!54257))

(declare-fun b!180729 () Bool)

(declare-fun c!32363 () Bool)

(assert (=> b!180729 (= c!32363 (and (not (= (bvand (extraKeys!3444 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3444 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!119065 () ListLongMap!2291)

(declare-fun e!119058 () ListLongMap!2291)

(assert (=> b!180729 (= e!119065 e!119058)))

(declare-fun bm!18268 () Bool)

(declare-fun call!18273 () Bool)

(declare-fun lt!89343 () ListLongMap!2291)

(assert (=> bm!18268 (= call!18273 (contains!1237 lt!89343 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180731 () Bool)

(declare-fun e!119059 () Bool)

(assert (=> b!180731 (= e!119059 (not call!18273))))

(declare-fun b!180732 () Bool)

(declare-fun e!119069 () Bool)

(declare-fun call!18275 () Bool)

(assert (=> b!180732 (= e!119069 (not call!18275))))

(declare-fun bm!18269 () Bool)

(declare-fun call!18277 () ListLongMap!2291)

(declare-fun call!18276 () ListLongMap!2291)

(assert (=> bm!18269 (= call!18277 call!18276)))

(declare-fun b!180733 () Bool)

(declare-fun res!85603 () Bool)

(declare-fun e!119070 () Bool)

(assert (=> b!180733 (=> (not res!85603) (not e!119070))))

(declare-fun e!119067 () Bool)

(assert (=> b!180733 (= res!85603 e!119067)))

(declare-fun res!85608 () Bool)

(assert (=> b!180733 (=> res!85608 e!119067)))

(declare-fun e!119062 () Bool)

(assert (=> b!180733 (= res!85608 (not e!119062))))

(declare-fun res!85609 () Bool)

(assert (=> b!180733 (=> (not res!85609) (not e!119062))))

(assert (=> b!180733 (= res!85609 (bvslt #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(declare-fun bm!18270 () Bool)

(assert (=> bm!18270 (= call!18275 (contains!1237 lt!89343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180734 () Bool)

(declare-fun e!119068 () Bool)

(declare-fun apply!150 (ListLongMap!2291 (_ BitVec 64)) V!5299)

(assert (=> b!180734 (= e!119068 (= (apply!150 lt!89343 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3548 thiss!1248)))))

(declare-fun b!180735 () Bool)

(declare-fun e!119064 () Bool)

(assert (=> b!180735 (= e!119064 (= (apply!150 lt!89343 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3548 thiss!1248)))))

(declare-fun b!180736 () Bool)

(declare-fun call!18271 () ListLongMap!2291)

(assert (=> b!180736 (= e!119058 call!18271)))

(declare-fun call!18272 () ListLongMap!2291)

(declare-fun c!32361 () Bool)

(declare-fun c!32359 () Bool)

(declare-fun bm!18271 () Bool)

(declare-fun +!270 (ListLongMap!2291 tuple2!3374) ListLongMap!2291)

(assert (=> bm!18271 (= call!18272 (+!270 (ite c!32359 call!18276 (ite c!32361 call!18277 call!18271)) (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))))))

(declare-fun b!180737 () Bool)

(declare-fun e!119063 () Unit!5496)

(declare-fun lt!89335 () Unit!5496)

(assert (=> b!180737 (= e!119063 lt!89335)))

(declare-fun lt!89352 () ListLongMap!2291)

(declare-fun getCurrentListMapNoExtraKeys!183 (array!7653 array!7655 (_ BitVec 32) (_ BitVec 32) V!5299 V!5299 (_ BitVec 32) Int) ListLongMap!2291)

(assert (=> b!180737 (= lt!89352 (getCurrentListMapNoExtraKeys!183 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))))

(declare-fun lt!89336 () (_ BitVec 64))

(assert (=> b!180737 (= lt!89336 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89340 () (_ BitVec 64))

(assert (=> b!180737 (= lt!89340 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89345 () Unit!5496)

(declare-fun addStillContains!126 (ListLongMap!2291 (_ BitVec 64) V!5299 (_ BitVec 64)) Unit!5496)

(assert (=> b!180737 (= lt!89345 (addStillContains!126 lt!89352 lt!89336 (zeroValue!3548 thiss!1248) lt!89340))))

(assert (=> b!180737 (contains!1237 (+!270 lt!89352 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248))) lt!89340)))

(declare-fun lt!89354 () Unit!5496)

(assert (=> b!180737 (= lt!89354 lt!89345)))

(declare-fun lt!89342 () ListLongMap!2291)

(assert (=> b!180737 (= lt!89342 (getCurrentListMapNoExtraKeys!183 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))))

(declare-fun lt!89344 () (_ BitVec 64))

(assert (=> b!180737 (= lt!89344 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89351 () (_ BitVec 64))

(assert (=> b!180737 (= lt!89351 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89347 () Unit!5496)

(declare-fun addApplyDifferent!126 (ListLongMap!2291 (_ BitVec 64) V!5299 (_ BitVec 64)) Unit!5496)

(assert (=> b!180737 (= lt!89347 (addApplyDifferent!126 lt!89342 lt!89344 (minValue!3548 thiss!1248) lt!89351))))

(assert (=> b!180737 (= (apply!150 (+!270 lt!89342 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248))) lt!89351) (apply!150 lt!89342 lt!89351))))

(declare-fun lt!89338 () Unit!5496)

(assert (=> b!180737 (= lt!89338 lt!89347)))

(declare-fun lt!89349 () ListLongMap!2291)

(assert (=> b!180737 (= lt!89349 (getCurrentListMapNoExtraKeys!183 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))))

(declare-fun lt!89341 () (_ BitVec 64))

(assert (=> b!180737 (= lt!89341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89348 () (_ BitVec 64))

(assert (=> b!180737 (= lt!89348 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89350 () Unit!5496)

(assert (=> b!180737 (= lt!89350 (addApplyDifferent!126 lt!89349 lt!89341 (zeroValue!3548 thiss!1248) lt!89348))))

(assert (=> b!180737 (= (apply!150 (+!270 lt!89349 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248))) lt!89348) (apply!150 lt!89349 lt!89348))))

(declare-fun lt!89353 () Unit!5496)

(assert (=> b!180737 (= lt!89353 lt!89350)))

(declare-fun lt!89334 () ListLongMap!2291)

(assert (=> b!180737 (= lt!89334 (getCurrentListMapNoExtraKeys!183 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))))

(declare-fun lt!89339 () (_ BitVec 64))

(assert (=> b!180737 (= lt!89339 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89346 () (_ BitVec 64))

(assert (=> b!180737 (= lt!89346 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180737 (= lt!89335 (addApplyDifferent!126 lt!89334 lt!89339 (minValue!3548 thiss!1248) lt!89346))))

(assert (=> b!180737 (= (apply!150 (+!270 lt!89334 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248))) lt!89346) (apply!150 lt!89334 lt!89346))))

(declare-fun b!180738 () Bool)

(declare-fun res!85607 () Bool)

(assert (=> b!180738 (=> (not res!85607) (not e!119070))))

(assert (=> b!180738 (= res!85607 e!119069)))

(declare-fun c!32358 () Bool)

(assert (=> b!180738 (= c!32358 (not (= (bvand (extraKeys!3444 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!180739 () Bool)

(declare-fun call!18274 () ListLongMap!2291)

(assert (=> b!180739 (= e!119065 call!18274)))

(declare-fun b!180740 () Bool)

(declare-fun e!119060 () Bool)

(declare-fun get!2067 (ValueCell!1776 V!5299) V!5299)

(declare-fun dynLambda!493 (Int (_ BitVec 64)) V!5299)

(assert (=> b!180740 (= e!119060 (= (apply!150 lt!89343 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)) (get!2067 (select (arr!3624 (_values!3690 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3707 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3932 (_values!3690 thiss!1248))))))

(assert (=> b!180740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(declare-fun b!180741 () Bool)

(assert (=> b!180741 (= e!119069 e!119064)))

(declare-fun res!85605 () Bool)

(assert (=> b!180741 (= res!85605 call!18275)))

(assert (=> b!180741 (=> (not res!85605) (not e!119064))))

(declare-fun b!180730 () Bool)

(assert (=> b!180730 (= e!119070 e!119059)))

(declare-fun c!32362 () Bool)

(assert (=> b!180730 (= c!32362 (not (= (bvand (extraKeys!3444 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!54259 () Bool)

(assert (=> d!54259 e!119070))

(declare-fun res!85601 () Bool)

(assert (=> d!54259 (=> (not res!85601) (not e!119070))))

(assert (=> d!54259 (= res!85601 (or (bvsge #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))))

(declare-fun lt!89333 () ListLongMap!2291)

(assert (=> d!54259 (= lt!89343 lt!89333)))

(declare-fun lt!89337 () Unit!5496)

(assert (=> d!54259 (= lt!89337 e!119063)))

(declare-fun c!32360 () Bool)

(declare-fun e!119061 () Bool)

(assert (=> d!54259 (= c!32360 e!119061)))

(declare-fun res!85604 () Bool)

(assert (=> d!54259 (=> (not res!85604) (not e!119061))))

(assert (=> d!54259 (= res!85604 (bvslt #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(declare-fun e!119066 () ListLongMap!2291)

(assert (=> d!54259 (= lt!89333 e!119066)))

(assert (=> d!54259 (= c!32359 (and (not (= (bvand (extraKeys!3444 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3444 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54259 (validMask!0 (mask!8712 thiss!1248))))

(assert (=> d!54259 (= (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)) lt!89343)))

(declare-fun b!180742 () Bool)

(assert (=> b!180742 (= e!119058 call!18274)))

(declare-fun b!180743 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!180743 (= e!119062 (validKeyInArray!0 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180744 () Bool)

(assert (=> b!180744 (= e!119059 e!119068)))

(declare-fun res!85602 () Bool)

(assert (=> b!180744 (= res!85602 call!18273)))

(assert (=> b!180744 (=> (not res!85602) (not e!119068))))

(declare-fun b!180745 () Bool)

(assert (=> b!180745 (= e!119066 (+!270 call!18272 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))))))

(declare-fun b!180746 () Bool)

(assert (=> b!180746 (= e!119066 e!119065)))

(assert (=> b!180746 (= c!32361 (and (not (= (bvand (extraKeys!3444 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3444 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18272 () Bool)

(assert (=> bm!18272 (= call!18276 (getCurrentListMapNoExtraKeys!183 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))))

(declare-fun b!180747 () Bool)

(declare-fun Unit!5499 () Unit!5496)

(assert (=> b!180747 (= e!119063 Unit!5499)))

(declare-fun b!180748 () Bool)

(assert (=> b!180748 (= e!119067 e!119060)))

(declare-fun res!85606 () Bool)

(assert (=> b!180748 (=> (not res!85606) (not e!119060))))

(assert (=> b!180748 (= res!85606 (contains!1237 lt!89343 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(declare-fun bm!18273 () Bool)

(assert (=> bm!18273 (= call!18274 call!18272)))

(declare-fun bm!18274 () Bool)

(assert (=> bm!18274 (= call!18271 call!18277)))

(declare-fun b!180749 () Bool)

(assert (=> b!180749 (= e!119061 (validKeyInArray!0 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54259 c!32359) b!180745))

(assert (= (and d!54259 (not c!32359)) b!180746))

(assert (= (and b!180746 c!32361) b!180739))

(assert (= (and b!180746 (not c!32361)) b!180729))

(assert (= (and b!180729 c!32363) b!180742))

(assert (= (and b!180729 (not c!32363)) b!180736))

(assert (= (or b!180742 b!180736) bm!18274))

(assert (= (or b!180739 bm!18274) bm!18269))

(assert (= (or b!180739 b!180742) bm!18273))

(assert (= (or b!180745 bm!18269) bm!18272))

(assert (= (or b!180745 bm!18273) bm!18271))

(assert (= (and d!54259 res!85604) b!180749))

(assert (= (and d!54259 c!32360) b!180737))

(assert (= (and d!54259 (not c!32360)) b!180747))

(assert (= (and d!54259 res!85601) b!180733))

(assert (= (and b!180733 res!85609) b!180743))

(assert (= (and b!180733 (not res!85608)) b!180748))

(assert (= (and b!180748 res!85606) b!180740))

(assert (= (and b!180733 res!85603) b!180738))

(assert (= (and b!180738 c!32358) b!180741))

(assert (= (and b!180738 (not c!32358)) b!180732))

(assert (= (and b!180741 res!85605) b!180735))

(assert (= (or b!180741 b!180732) bm!18270))

(assert (= (and b!180738 res!85607) b!180730))

(assert (= (and b!180730 c!32362) b!180744))

(assert (= (and b!180730 (not c!32362)) b!180731))

(assert (= (and b!180744 res!85602) b!180734))

(assert (= (or b!180744 b!180731) bm!18268))

(declare-fun b_lambda!7123 () Bool)

(assert (=> (not b_lambda!7123) (not b!180740)))

(declare-fun t!7152 () Bool)

(declare-fun tb!2811 () Bool)

(assert (=> (and b!180641 (= (defaultEntry!3707 thiss!1248) (defaultEntry!3707 thiss!1248)) t!7152) tb!2811))

(declare-fun result!4711 () Bool)

(assert (=> tb!2811 (= result!4711 tp_is_empty!4239)))

(assert (=> b!180740 t!7152))

(declare-fun b_and!11007 () Bool)

(assert (= b_and!11003 (and (=> t!7152 result!4711) b_and!11007)))

(assert (=> d!54259 m!208623))

(declare-fun m!208663 () Bool)

(assert (=> b!180737 m!208663))

(declare-fun m!208665 () Bool)

(assert (=> b!180737 m!208665))

(declare-fun m!208667 () Bool)

(assert (=> b!180737 m!208667))

(declare-fun m!208669 () Bool)

(assert (=> b!180737 m!208669))

(declare-fun m!208671 () Bool)

(assert (=> b!180737 m!208671))

(declare-fun m!208673 () Bool)

(assert (=> b!180737 m!208673))

(declare-fun m!208675 () Bool)

(assert (=> b!180737 m!208675))

(declare-fun m!208677 () Bool)

(assert (=> b!180737 m!208677))

(declare-fun m!208679 () Bool)

(assert (=> b!180737 m!208679))

(declare-fun m!208681 () Bool)

(assert (=> b!180737 m!208681))

(declare-fun m!208683 () Bool)

(assert (=> b!180737 m!208683))

(declare-fun m!208685 () Bool)

(assert (=> b!180737 m!208685))

(assert (=> b!180737 m!208669))

(declare-fun m!208687 () Bool)

(assert (=> b!180737 m!208687))

(assert (=> b!180737 m!208665))

(declare-fun m!208689 () Bool)

(assert (=> b!180737 m!208689))

(assert (=> b!180737 m!208673))

(declare-fun m!208691 () Bool)

(assert (=> b!180737 m!208691))

(assert (=> b!180737 m!208681))

(declare-fun m!208693 () Bool)

(assert (=> b!180737 m!208693))

(declare-fun m!208695 () Bool)

(assert (=> b!180737 m!208695))

(declare-fun m!208697 () Bool)

(assert (=> bm!18270 m!208697))

(assert (=> bm!18272 m!208677))

(declare-fun m!208699 () Bool)

(assert (=> b!180735 m!208699))

(declare-fun m!208701 () Bool)

(assert (=> b!180734 m!208701))

(declare-fun m!208703 () Bool)

(assert (=> b!180745 m!208703))

(assert (=> b!180740 m!208695))

(declare-fun m!208705 () Bool)

(assert (=> b!180740 m!208705))

(declare-fun m!208707 () Bool)

(assert (=> b!180740 m!208707))

(declare-fun m!208709 () Bool)

(assert (=> b!180740 m!208709))

(declare-fun m!208711 () Bool)

(assert (=> b!180740 m!208711))

(assert (=> b!180740 m!208709))

(assert (=> b!180740 m!208707))

(assert (=> b!180740 m!208695))

(assert (=> b!180748 m!208695))

(assert (=> b!180748 m!208695))

(declare-fun m!208713 () Bool)

(assert (=> b!180748 m!208713))

(declare-fun m!208715 () Bool)

(assert (=> bm!18268 m!208715))

(declare-fun m!208717 () Bool)

(assert (=> bm!18271 m!208717))

(assert (=> b!180743 m!208695))

(assert (=> b!180743 m!208695))

(declare-fun m!208719 () Bool)

(assert (=> b!180743 m!208719))

(assert (=> b!180749 m!208695))

(assert (=> b!180749 m!208695))

(assert (=> b!180749 m!208719))

(assert (=> b!180637 d!54259))

(declare-fun b!180764 () Bool)

(declare-fun e!119079 () SeekEntryResult!595)

(declare-fun lt!89363 () SeekEntryResult!595)

(assert (=> b!180764 (= e!119079 (MissingZero!595 (index!4552 lt!89363)))))

(declare-fun b!180765 () Bool)

(declare-fun c!32370 () Bool)

(declare-fun lt!89361 () (_ BitVec 64))

(assert (=> b!180765 (= c!32370 (= lt!89361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119077 () SeekEntryResult!595)

(assert (=> b!180765 (= e!119077 e!119079)))

(declare-fun b!180766 () Bool)

(declare-fun e!119078 () SeekEntryResult!595)

(assert (=> b!180766 (= e!119078 e!119077)))

(assert (=> b!180766 (= lt!89361 (select (arr!3623 (_keys!5601 thiss!1248)) (index!4552 lt!89363)))))

(declare-fun c!32372 () Bool)

(assert (=> b!180766 (= c!32372 (= lt!89361 key!828))))

(declare-fun d!54261 () Bool)

(declare-fun lt!89362 () SeekEntryResult!595)

(assert (=> d!54261 (and (or ((_ is Undefined!595) lt!89362) (not ((_ is Found!595) lt!89362)) (and (bvsge (index!4551 lt!89362) #b00000000000000000000000000000000) (bvslt (index!4551 lt!89362) (size!3931 (_keys!5601 thiss!1248))))) (or ((_ is Undefined!595) lt!89362) ((_ is Found!595) lt!89362) (not ((_ is MissingZero!595) lt!89362)) (and (bvsge (index!4550 lt!89362) #b00000000000000000000000000000000) (bvslt (index!4550 lt!89362) (size!3931 (_keys!5601 thiss!1248))))) (or ((_ is Undefined!595) lt!89362) ((_ is Found!595) lt!89362) ((_ is MissingZero!595) lt!89362) (not ((_ is MissingVacant!595) lt!89362)) (and (bvsge (index!4553 lt!89362) #b00000000000000000000000000000000) (bvslt (index!4553 lt!89362) (size!3931 (_keys!5601 thiss!1248))))) (or ((_ is Undefined!595) lt!89362) (ite ((_ is Found!595) lt!89362) (= (select (arr!3623 (_keys!5601 thiss!1248)) (index!4551 lt!89362)) key!828) (ite ((_ is MissingZero!595) lt!89362) (= (select (arr!3623 (_keys!5601 thiss!1248)) (index!4550 lt!89362)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!595) lt!89362) (= (select (arr!3623 (_keys!5601 thiss!1248)) (index!4553 lt!89362)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54261 (= lt!89362 e!119078)))

(declare-fun c!32371 () Bool)

(assert (=> d!54261 (= c!32371 (and ((_ is Intermediate!595) lt!89363) (undefined!1407 lt!89363)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7653 (_ BitVec 32)) SeekEntryResult!595)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54261 (= lt!89363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8712 thiss!1248)) key!828 (_keys!5601 thiss!1248) (mask!8712 thiss!1248)))))

(assert (=> d!54261 (validMask!0 (mask!8712 thiss!1248))))

(assert (=> d!54261 (= (seekEntryOrOpen!0 key!828 (_keys!5601 thiss!1248) (mask!8712 thiss!1248)) lt!89362)))

(declare-fun b!180767 () Bool)

(assert (=> b!180767 (= e!119078 Undefined!595)))

(declare-fun b!180768 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7653 (_ BitVec 32)) SeekEntryResult!595)

(assert (=> b!180768 (= e!119079 (seekKeyOrZeroReturnVacant!0 (x!19747 lt!89363) (index!4552 lt!89363) (index!4552 lt!89363) key!828 (_keys!5601 thiss!1248) (mask!8712 thiss!1248)))))

(declare-fun b!180769 () Bool)

(assert (=> b!180769 (= e!119077 (Found!595 (index!4552 lt!89363)))))

(assert (= (and d!54261 c!32371) b!180767))

(assert (= (and d!54261 (not c!32371)) b!180766))

(assert (= (and b!180766 c!32372) b!180769))

(assert (= (and b!180766 (not c!32372)) b!180765))

(assert (= (and b!180765 c!32370) b!180764))

(assert (= (and b!180765 (not c!32370)) b!180768))

(declare-fun m!208721 () Bool)

(assert (=> b!180766 m!208721))

(assert (=> d!54261 m!208623))

(declare-fun m!208723 () Bool)

(assert (=> d!54261 m!208723))

(declare-fun m!208725 () Bool)

(assert (=> d!54261 m!208725))

(declare-fun m!208727 () Bool)

(assert (=> d!54261 m!208727))

(assert (=> d!54261 m!208725))

(declare-fun m!208729 () Bool)

(assert (=> d!54261 m!208729))

(declare-fun m!208731 () Bool)

(assert (=> d!54261 m!208731))

(declare-fun m!208733 () Bool)

(assert (=> b!180768 m!208733))

(assert (=> b!180636 d!54261))

(declare-fun mapNonEmpty!7267 () Bool)

(declare-fun mapRes!7267 () Bool)

(declare-fun tp!16150 () Bool)

(declare-fun e!119085 () Bool)

(assert (=> mapNonEmpty!7267 (= mapRes!7267 (and tp!16150 e!119085))))

(declare-fun mapValue!7267 () ValueCell!1776)

(declare-fun mapKey!7267 () (_ BitVec 32))

(declare-fun mapRest!7267 () (Array (_ BitVec 32) ValueCell!1776))

(assert (=> mapNonEmpty!7267 (= mapRest!7261 (store mapRest!7267 mapKey!7267 mapValue!7267))))

(declare-fun condMapEmpty!7267 () Bool)

(declare-fun mapDefault!7267 () ValueCell!1776)

(assert (=> mapNonEmpty!7261 (= condMapEmpty!7267 (= mapRest!7261 ((as const (Array (_ BitVec 32) ValueCell!1776)) mapDefault!7267)))))

(declare-fun e!119084 () Bool)

(assert (=> mapNonEmpty!7261 (= tp!16140 (and e!119084 mapRes!7267))))

(declare-fun b!180777 () Bool)

(assert (=> b!180777 (= e!119084 tp_is_empty!4239)))

(declare-fun b!180776 () Bool)

(assert (=> b!180776 (= e!119085 tp_is_empty!4239)))

(declare-fun mapIsEmpty!7267 () Bool)

(assert (=> mapIsEmpty!7267 mapRes!7267))

(assert (= (and mapNonEmpty!7261 condMapEmpty!7267) mapIsEmpty!7267))

(assert (= (and mapNonEmpty!7261 (not condMapEmpty!7267)) mapNonEmpty!7267))

(assert (= (and mapNonEmpty!7267 ((_ is ValueCellFull!1776) mapValue!7267)) b!180776))

(assert (= (and mapNonEmpty!7261 ((_ is ValueCellFull!1776) mapDefault!7267)) b!180777))

(declare-fun m!208735 () Bool)

(assert (=> mapNonEmpty!7267 m!208735))

(declare-fun b_lambda!7125 () Bool)

(assert (= b_lambda!7123 (or (and b!180641 b_free!4467) b_lambda!7125)))

(check-sat (not b!180675) (not d!54261) (not b!180686) (not d!54257) (not bm!18272) (not b_next!4467) (not b!180748) (not b!180743) (not b!180676) (not b!180677) (not b!180737) (not b!180768) (not b!180684) (not mapNonEmpty!7267) (not bm!18271) (not bm!18268) (not b!180745) (not d!54259) (not b_lambda!7125) tp_is_empty!4239 (not b!180734) b_and!11007 (not b!180740) (not b!180749) (not b!180735) (not d!54255) (not bm!18270))
(check-sat b_and!11007 (not b_next!4467))
(get-model)

(declare-fun d!54263 () Bool)

(declare-fun get!2068 (Option!213) V!5299)

(assert (=> d!54263 (= (apply!150 lt!89343 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2068 (getValueByKey!207 (toList!1161 lt!89343) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7380 () Bool)

(assert (= bs!7380 d!54263))

(declare-fun m!208737 () Bool)

(assert (=> bs!7380 m!208737))

(assert (=> bs!7380 m!208737))

(declare-fun m!208739 () Bool)

(assert (=> bs!7380 m!208739))

(assert (=> b!180735 d!54263))

(declare-fun d!54265 () Bool)

(assert (=> d!54265 (= (apply!150 lt!89343 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2068 (getValueByKey!207 (toList!1161 lt!89343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7381 () Bool)

(assert (= bs!7381 d!54265))

(declare-fun m!208741 () Bool)

(assert (=> bs!7381 m!208741))

(assert (=> bs!7381 m!208741))

(declare-fun m!208743 () Bool)

(assert (=> bs!7381 m!208743))

(assert (=> b!180734 d!54265))

(declare-fun d!54267 () Bool)

(declare-fun isEmpty!455 (Option!213) Bool)

(assert (=> d!54267 (= (isDefined!160 (getValueByKey!207 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828)) (not (isEmpty!455 (getValueByKey!207 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828))))))

(declare-fun bs!7382 () Bool)

(assert (= bs!7382 d!54267))

(assert (=> bs!7382 m!208659))

(declare-fun m!208745 () Bool)

(assert (=> bs!7382 m!208745))

(assert (=> b!180686 d!54267))

(declare-fun b!180787 () Bool)

(declare-fun e!119090 () Option!213)

(declare-fun e!119091 () Option!213)

(assert (=> b!180787 (= e!119090 e!119091)))

(declare-fun c!32378 () Bool)

(assert (=> b!180787 (= c!32378 (and ((_ is Cons!2295) (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))) (not (= (_1!1698 (h!2920 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))))) key!828))))))

(declare-fun b!180786 () Bool)

(assert (=> b!180786 (= e!119090 (Some!212 (_2!1698 (h!2920 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))))))))

(declare-fun b!180789 () Bool)

(assert (=> b!180789 (= e!119091 None!211)))

(declare-fun d!54269 () Bool)

(declare-fun c!32377 () Bool)

(assert (=> d!54269 (= c!32377 (and ((_ is Cons!2295) (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))) (= (_1!1698 (h!2920 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))))) key!828)))))

(assert (=> d!54269 (= (getValueByKey!207 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828) e!119090)))

(declare-fun b!180788 () Bool)

(assert (=> b!180788 (= e!119091 (getValueByKey!207 (t!7149 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))) key!828))))

(assert (= (and d!54269 c!32377) b!180786))

(assert (= (and d!54269 (not c!32377)) b!180787))

(assert (= (and b!180787 c!32378) b!180788))

(assert (= (and b!180787 (not c!32378)) b!180789))

(declare-fun m!208747 () Bool)

(assert (=> b!180788 m!208747))

(assert (=> b!180686 d!54269))

(declare-fun d!54271 () Bool)

(assert (=> d!54271 (= (validKeyInArray!0 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180743 d!54271))

(assert (=> d!54259 d!54253))

(declare-fun d!54273 () Bool)

(declare-fun e!119092 () Bool)

(assert (=> d!54273 e!119092))

(declare-fun res!85610 () Bool)

(assert (=> d!54273 (=> res!85610 e!119092)))

(declare-fun lt!89365 () Bool)

(assert (=> d!54273 (= res!85610 (not lt!89365))))

(declare-fun lt!89367 () Bool)

(assert (=> d!54273 (= lt!89365 lt!89367)))

(declare-fun lt!89366 () Unit!5496)

(declare-fun e!119093 () Unit!5496)

(assert (=> d!54273 (= lt!89366 e!119093)))

(declare-fun c!32379 () Bool)

(assert (=> d!54273 (= c!32379 lt!89367)))

(assert (=> d!54273 (= lt!89367 (containsKey!211 (toList!1161 lt!89343) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54273 (= (contains!1237 lt!89343 #b0000000000000000000000000000000000000000000000000000000000000000) lt!89365)))

(declare-fun b!180790 () Bool)

(declare-fun lt!89364 () Unit!5496)

(assert (=> b!180790 (= e!119093 lt!89364)))

(assert (=> b!180790 (= lt!89364 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1161 lt!89343) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180790 (isDefined!160 (getValueByKey!207 (toList!1161 lt!89343) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180791 () Bool)

(declare-fun Unit!5500 () Unit!5496)

(assert (=> b!180791 (= e!119093 Unit!5500)))

(declare-fun b!180792 () Bool)

(assert (=> b!180792 (= e!119092 (isDefined!160 (getValueByKey!207 (toList!1161 lt!89343) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54273 c!32379) b!180790))

(assert (= (and d!54273 (not c!32379)) b!180791))

(assert (= (and d!54273 (not res!85610)) b!180792))

(declare-fun m!208749 () Bool)

(assert (=> d!54273 m!208749))

(declare-fun m!208751 () Bool)

(assert (=> b!180790 m!208751))

(assert (=> b!180790 m!208737))

(assert (=> b!180790 m!208737))

(declare-fun m!208753 () Bool)

(assert (=> b!180790 m!208753))

(assert (=> b!180792 m!208737))

(assert (=> b!180792 m!208737))

(assert (=> b!180792 m!208753))

(assert (=> bm!18270 d!54273))

(declare-fun b!180811 () Bool)

(declare-fun lt!89373 () SeekEntryResult!595)

(assert (=> b!180811 (and (bvsge (index!4552 lt!89373) #b00000000000000000000000000000000) (bvslt (index!4552 lt!89373) (size!3931 (_keys!5601 thiss!1248))))))

(declare-fun res!85619 () Bool)

(assert (=> b!180811 (= res!85619 (= (select (arr!3623 (_keys!5601 thiss!1248)) (index!4552 lt!89373)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119108 () Bool)

(assert (=> b!180811 (=> res!85619 e!119108)))

(declare-fun b!180812 () Bool)

(assert (=> b!180812 (and (bvsge (index!4552 lt!89373) #b00000000000000000000000000000000) (bvslt (index!4552 lt!89373) (size!3931 (_keys!5601 thiss!1248))))))

(assert (=> b!180812 (= e!119108 (= (select (arr!3623 (_keys!5601 thiss!1248)) (index!4552 lt!89373)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180813 () Bool)

(declare-fun e!119106 () Bool)

(assert (=> b!180813 (= e!119106 (bvsge (x!19747 lt!89373) #b01111111111111111111111111111110))))

(declare-fun b!180814 () Bool)

(assert (=> b!180814 (and (bvsge (index!4552 lt!89373) #b00000000000000000000000000000000) (bvslt (index!4552 lt!89373) (size!3931 (_keys!5601 thiss!1248))))))

(declare-fun res!85617 () Bool)

(assert (=> b!180814 (= res!85617 (= (select (arr!3623 (_keys!5601 thiss!1248)) (index!4552 lt!89373)) key!828))))

(assert (=> b!180814 (=> res!85617 e!119108)))

(declare-fun e!119105 () Bool)

(assert (=> b!180814 (= e!119105 e!119108)))

(declare-fun b!180815 () Bool)

(declare-fun e!119104 () SeekEntryResult!595)

(assert (=> b!180815 (= e!119104 (Intermediate!595 false (toIndex!0 key!828 (mask!8712 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!180816 () Bool)

(declare-fun e!119107 () SeekEntryResult!595)

(assert (=> b!180816 (= e!119107 (Intermediate!595 true (toIndex!0 key!828 (mask!8712 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!180817 () Bool)

(assert (=> b!180817 (= e!119106 e!119105)))

(declare-fun res!85618 () Bool)

(assert (=> b!180817 (= res!85618 (and ((_ is Intermediate!595) lt!89373) (not (undefined!1407 lt!89373)) (bvslt (x!19747 lt!89373) #b01111111111111111111111111111110) (bvsge (x!19747 lt!89373) #b00000000000000000000000000000000) (bvsge (x!19747 lt!89373) #b00000000000000000000000000000000)))))

(assert (=> b!180817 (=> (not res!85618) (not e!119105))))

(declare-fun d!54275 () Bool)

(assert (=> d!54275 e!119106))

(declare-fun c!32387 () Bool)

(assert (=> d!54275 (= c!32387 (and ((_ is Intermediate!595) lt!89373) (undefined!1407 lt!89373)))))

(assert (=> d!54275 (= lt!89373 e!119107)))

(declare-fun c!32386 () Bool)

(assert (=> d!54275 (= c!32386 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!89372 () (_ BitVec 64))

(assert (=> d!54275 (= lt!89372 (select (arr!3623 (_keys!5601 thiss!1248)) (toIndex!0 key!828 (mask!8712 thiss!1248))))))

(assert (=> d!54275 (validMask!0 (mask!8712 thiss!1248))))

(assert (=> d!54275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8712 thiss!1248)) key!828 (_keys!5601 thiss!1248) (mask!8712 thiss!1248)) lt!89373)))

(declare-fun b!180818 () Bool)

(assert (=> b!180818 (= e!119107 e!119104)))

(declare-fun c!32388 () Bool)

(assert (=> b!180818 (= c!32388 (or (= lt!89372 key!828) (= (bvadd lt!89372 lt!89372) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180819 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180819 (= e!119104 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8712 thiss!1248)) #b00000000000000000000000000000000 (mask!8712 thiss!1248)) key!828 (_keys!5601 thiss!1248) (mask!8712 thiss!1248)))))

(assert (= (and d!54275 c!32386) b!180816))

(assert (= (and d!54275 (not c!32386)) b!180818))

(assert (= (and b!180818 c!32388) b!180815))

(assert (= (and b!180818 (not c!32388)) b!180819))

(assert (= (and d!54275 c!32387) b!180813))

(assert (= (and d!54275 (not c!32387)) b!180817))

(assert (= (and b!180817 res!85618) b!180814))

(assert (= (and b!180814 (not res!85617)) b!180811))

(assert (= (and b!180811 (not res!85619)) b!180812))

(declare-fun m!208755 () Bool)

(assert (=> b!180811 m!208755))

(assert (=> b!180819 m!208725))

(declare-fun m!208757 () Bool)

(assert (=> b!180819 m!208757))

(assert (=> b!180819 m!208757))

(declare-fun m!208759 () Bool)

(assert (=> b!180819 m!208759))

(assert (=> b!180812 m!208755))

(assert (=> d!54275 m!208725))

(declare-fun m!208761 () Bool)

(assert (=> d!54275 m!208761))

(assert (=> d!54275 m!208623))

(assert (=> b!180814 m!208755))

(assert (=> d!54261 d!54275))

(declare-fun d!54277 () Bool)

(declare-fun lt!89379 () (_ BitVec 32))

(declare-fun lt!89378 () (_ BitVec 32))

(assert (=> d!54277 (= lt!89379 (bvmul (bvxor lt!89378 (bvlshr lt!89378 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54277 (= lt!89378 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54277 (and (bvsge (mask!8712 thiss!1248) #b00000000000000000000000000000000) (let ((res!85620 (let ((h!2923 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19764 (bvmul (bvxor h!2923 (bvlshr h!2923 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19764 (bvlshr x!19764 #b00000000000000000000000000001101)) (mask!8712 thiss!1248)))))) (and (bvslt res!85620 (bvadd (mask!8712 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!85620 #b00000000000000000000000000000000))))))

(assert (=> d!54277 (= (toIndex!0 key!828 (mask!8712 thiss!1248)) (bvand (bvxor lt!89379 (bvlshr lt!89379 #b00000000000000000000000000001101)) (mask!8712 thiss!1248)))))

(assert (=> d!54261 d!54277))

(assert (=> d!54261 d!54253))

(declare-fun d!54279 () Bool)

(assert (=> d!54279 (isDefined!160 (getValueByKey!207 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828))))

(declare-fun lt!89382 () Unit!5496)

(declare-fun choose!958 (List!2299 (_ BitVec 64)) Unit!5496)

(assert (=> d!54279 (= lt!89382 (choose!958 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828))))

(declare-fun e!119111 () Bool)

(assert (=> d!54279 e!119111))

(declare-fun res!85623 () Bool)

(assert (=> d!54279 (=> (not res!85623) (not e!119111))))

(declare-fun isStrictlySorted!341 (List!2299) Bool)

(assert (=> d!54279 (= res!85623 (isStrictlySorted!341 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))))))

(assert (=> d!54279 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828) lt!89382)))

(declare-fun b!180822 () Bool)

(assert (=> b!180822 (= e!119111 (containsKey!211 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828))))

(assert (= (and d!54279 res!85623) b!180822))

(assert (=> d!54279 m!208659))

(assert (=> d!54279 m!208659))

(assert (=> d!54279 m!208661))

(declare-fun m!208763 () Bool)

(assert (=> d!54279 m!208763))

(declare-fun m!208765 () Bool)

(assert (=> d!54279 m!208765))

(assert (=> b!180822 m!208655))

(assert (=> b!180684 d!54279))

(assert (=> b!180684 d!54267))

(assert (=> b!180684 d!54269))

(declare-fun b!180835 () Bool)

(declare-fun c!32395 () Bool)

(declare-fun lt!89388 () (_ BitVec 64))

(assert (=> b!180835 (= c!32395 (= lt!89388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119119 () SeekEntryResult!595)

(declare-fun e!119120 () SeekEntryResult!595)

(assert (=> b!180835 (= e!119119 e!119120)))

(declare-fun b!180836 () Bool)

(assert (=> b!180836 (= e!119120 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19747 lt!89363) #b00000000000000000000000000000001) (nextIndex!0 (index!4552 lt!89363) (x!19747 lt!89363) (mask!8712 thiss!1248)) (index!4552 lt!89363) key!828 (_keys!5601 thiss!1248) (mask!8712 thiss!1248)))))

(declare-fun b!180837 () Bool)

(assert (=> b!180837 (= e!119119 (Found!595 (index!4552 lt!89363)))))

(declare-fun b!180838 () Bool)

(assert (=> b!180838 (= e!119120 (MissingVacant!595 (index!4552 lt!89363)))))

(declare-fun b!180839 () Bool)

(declare-fun e!119118 () SeekEntryResult!595)

(assert (=> b!180839 (= e!119118 e!119119)))

(declare-fun c!32397 () Bool)

(assert (=> b!180839 (= c!32397 (= lt!89388 key!828))))

(declare-fun b!180840 () Bool)

(assert (=> b!180840 (= e!119118 Undefined!595)))

(declare-fun lt!89387 () SeekEntryResult!595)

(declare-fun d!54281 () Bool)

(assert (=> d!54281 (and (or ((_ is Undefined!595) lt!89387) (not ((_ is Found!595) lt!89387)) (and (bvsge (index!4551 lt!89387) #b00000000000000000000000000000000) (bvslt (index!4551 lt!89387) (size!3931 (_keys!5601 thiss!1248))))) (or ((_ is Undefined!595) lt!89387) ((_ is Found!595) lt!89387) (not ((_ is MissingVacant!595) lt!89387)) (not (= (index!4553 lt!89387) (index!4552 lt!89363))) (and (bvsge (index!4553 lt!89387) #b00000000000000000000000000000000) (bvslt (index!4553 lt!89387) (size!3931 (_keys!5601 thiss!1248))))) (or ((_ is Undefined!595) lt!89387) (ite ((_ is Found!595) lt!89387) (= (select (arr!3623 (_keys!5601 thiss!1248)) (index!4551 lt!89387)) key!828) (and ((_ is MissingVacant!595) lt!89387) (= (index!4553 lt!89387) (index!4552 lt!89363)) (= (select (arr!3623 (_keys!5601 thiss!1248)) (index!4553 lt!89387)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54281 (= lt!89387 e!119118)))

(declare-fun c!32396 () Bool)

(assert (=> d!54281 (= c!32396 (bvsge (x!19747 lt!89363) #b01111111111111111111111111111110))))

(assert (=> d!54281 (= lt!89388 (select (arr!3623 (_keys!5601 thiss!1248)) (index!4552 lt!89363)))))

(assert (=> d!54281 (validMask!0 (mask!8712 thiss!1248))))

(assert (=> d!54281 (= (seekKeyOrZeroReturnVacant!0 (x!19747 lt!89363) (index!4552 lt!89363) (index!4552 lt!89363) key!828 (_keys!5601 thiss!1248) (mask!8712 thiss!1248)) lt!89387)))

(assert (= (and d!54281 c!32396) b!180840))

(assert (= (and d!54281 (not c!32396)) b!180839))

(assert (= (and b!180839 c!32397) b!180837))

(assert (= (and b!180839 (not c!32397)) b!180835))

(assert (= (and b!180835 c!32395) b!180838))

(assert (= (and b!180835 (not c!32395)) b!180836))

(declare-fun m!208767 () Bool)

(assert (=> b!180836 m!208767))

(assert (=> b!180836 m!208767))

(declare-fun m!208769 () Bool)

(assert (=> b!180836 m!208769))

(declare-fun m!208771 () Bool)

(assert (=> d!54281 m!208771))

(declare-fun m!208773 () Bool)

(assert (=> d!54281 m!208773))

(assert (=> d!54281 m!208721))

(assert (=> d!54281 m!208623))

(assert (=> b!180768 d!54281))

(assert (=> b!180749 d!54271))

(declare-fun d!54283 () Bool)

(assert (=> d!54283 (= (apply!150 lt!89343 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)) (get!2068 (getValueByKey!207 (toList!1161 lt!89343) (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7383 () Bool)

(assert (= bs!7383 d!54283))

(assert (=> bs!7383 m!208695))

(declare-fun m!208775 () Bool)

(assert (=> bs!7383 m!208775))

(assert (=> bs!7383 m!208775))

(declare-fun m!208777 () Bool)

(assert (=> bs!7383 m!208777))

(assert (=> b!180740 d!54283))

(declare-fun d!54285 () Bool)

(declare-fun c!32400 () Bool)

(assert (=> d!54285 (= c!32400 ((_ is ValueCellFull!1776) (select (arr!3624 (_values!3690 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119123 () V!5299)

(assert (=> d!54285 (= (get!2067 (select (arr!3624 (_values!3690 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3707 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119123)))

(declare-fun b!180845 () Bool)

(declare-fun get!2069 (ValueCell!1776 V!5299) V!5299)

(assert (=> b!180845 (= e!119123 (get!2069 (select (arr!3624 (_values!3690 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3707 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180846 () Bool)

(declare-fun get!2070 (ValueCell!1776 V!5299) V!5299)

(assert (=> b!180846 (= e!119123 (get!2070 (select (arr!3624 (_values!3690 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3707 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54285 c!32400) b!180845))

(assert (= (and d!54285 (not c!32400)) b!180846))

(assert (=> b!180845 m!208707))

(assert (=> b!180845 m!208709))

(declare-fun m!208779 () Bool)

(assert (=> b!180845 m!208779))

(assert (=> b!180846 m!208707))

(assert (=> b!180846 m!208709))

(declare-fun m!208781 () Bool)

(assert (=> b!180846 m!208781))

(assert (=> b!180740 d!54285))

(declare-fun d!54287 () Bool)

(declare-fun res!85631 () Bool)

(declare-fun e!119133 () Bool)

(assert (=> d!54287 (=> res!85631 e!119133)))

(assert (=> d!54287 (= res!85631 (bvsge #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(assert (=> d!54287 (= (arrayNoDuplicates!0 (_keys!5601 thiss!1248) #b00000000000000000000000000000000 Nil!2298) e!119133)))

(declare-fun bm!18277 () Bool)

(declare-fun call!18280 () Bool)

(declare-fun c!32403 () Bool)

(assert (=> bm!18277 (= call!18280 (arrayNoDuplicates!0 (_keys!5601 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32403 (Cons!2297 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000) Nil!2298) Nil!2298)))))

(declare-fun b!180857 () Bool)

(declare-fun e!119132 () Bool)

(assert (=> b!180857 (= e!119132 call!18280)))

(declare-fun b!180858 () Bool)

(assert (=> b!180858 (= e!119132 call!18280)))

(declare-fun b!180859 () Bool)

(declare-fun e!119134 () Bool)

(declare-fun contains!1239 (List!2301 (_ BitVec 64)) Bool)

(assert (=> b!180859 (= e!119134 (contains!1239 Nil!2298 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180860 () Bool)

(declare-fun e!119135 () Bool)

(assert (=> b!180860 (= e!119133 e!119135)))

(declare-fun res!85632 () Bool)

(assert (=> b!180860 (=> (not res!85632) (not e!119135))))

(assert (=> b!180860 (= res!85632 (not e!119134))))

(declare-fun res!85630 () Bool)

(assert (=> b!180860 (=> (not res!85630) (not e!119134))))

(assert (=> b!180860 (= res!85630 (validKeyInArray!0 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180861 () Bool)

(assert (=> b!180861 (= e!119135 e!119132)))

(assert (=> b!180861 (= c!32403 (validKeyInArray!0 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54287 (not res!85631)) b!180860))

(assert (= (and b!180860 res!85630) b!180859))

(assert (= (and b!180860 res!85632) b!180861))

(assert (= (and b!180861 c!32403) b!180858))

(assert (= (and b!180861 (not c!32403)) b!180857))

(assert (= (or b!180858 b!180857) bm!18277))

(assert (=> bm!18277 m!208695))

(declare-fun m!208783 () Bool)

(assert (=> bm!18277 m!208783))

(assert (=> b!180859 m!208695))

(assert (=> b!180859 m!208695))

(declare-fun m!208785 () Bool)

(assert (=> b!180859 m!208785))

(assert (=> b!180860 m!208695))

(assert (=> b!180860 m!208695))

(assert (=> b!180860 m!208719))

(assert (=> b!180861 m!208695))

(assert (=> b!180861 m!208695))

(assert (=> b!180861 m!208719))

(assert (=> b!180677 d!54287))

(declare-fun d!54289 () Bool)

(declare-fun res!85637 () Bool)

(declare-fun e!119140 () Bool)

(assert (=> d!54289 (=> res!85637 e!119140)))

(assert (=> d!54289 (= res!85637 (and ((_ is Cons!2295) (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))) (= (_1!1698 (h!2920 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))))) key!828)))))

(assert (=> d!54289 (= (containsKey!211 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))) key!828) e!119140)))

(declare-fun b!180866 () Bool)

(declare-fun e!119141 () Bool)

(assert (=> b!180866 (= e!119140 e!119141)))

(declare-fun res!85638 () Bool)

(assert (=> b!180866 (=> (not res!85638) (not e!119141))))

(assert (=> b!180866 (= res!85638 (and (or (not ((_ is Cons!2295) (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))))) (bvsle (_1!1698 (h!2920 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))))) key!828)) ((_ is Cons!2295) (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))) (bvslt (_1!1698 (h!2920 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248))))) key!828)))))

(declare-fun b!180867 () Bool)

(assert (=> b!180867 (= e!119141 (containsKey!211 (t!7149 (toList!1161 (getCurrentListMap!809 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)))) key!828))))

(assert (= (and d!54289 (not res!85637)) b!180866))

(assert (= (and b!180866 res!85638) b!180867))

(declare-fun m!208787 () Bool)

(assert (=> b!180867 m!208787))

(assert (=> d!54257 d!54289))

(declare-fun d!54291 () Bool)

(declare-fun e!119142 () Bool)

(assert (=> d!54291 e!119142))

(declare-fun res!85639 () Bool)

(assert (=> d!54291 (=> res!85639 e!119142)))

(declare-fun lt!89390 () Bool)

(assert (=> d!54291 (= res!85639 (not lt!89390))))

(declare-fun lt!89392 () Bool)

(assert (=> d!54291 (= lt!89390 lt!89392)))

(declare-fun lt!89391 () Unit!5496)

(declare-fun e!119143 () Unit!5496)

(assert (=> d!54291 (= lt!89391 e!119143)))

(declare-fun c!32404 () Bool)

(assert (=> d!54291 (= c!32404 lt!89392)))

(assert (=> d!54291 (= lt!89392 (containsKey!211 (toList!1161 lt!89343) (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54291 (= (contains!1237 lt!89343 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)) lt!89390)))

(declare-fun b!180868 () Bool)

(declare-fun lt!89389 () Unit!5496)

(assert (=> b!180868 (= e!119143 lt!89389)))

(assert (=> b!180868 (= lt!89389 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1161 lt!89343) (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180868 (isDefined!160 (getValueByKey!207 (toList!1161 lt!89343) (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180869 () Bool)

(declare-fun Unit!5501 () Unit!5496)

(assert (=> b!180869 (= e!119143 Unit!5501)))

(declare-fun b!180870 () Bool)

(assert (=> b!180870 (= e!119142 (isDefined!160 (getValueByKey!207 (toList!1161 lt!89343) (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54291 c!32404) b!180868))

(assert (= (and d!54291 (not c!32404)) b!180869))

(assert (= (and d!54291 (not res!85639)) b!180870))

(assert (=> d!54291 m!208695))

(declare-fun m!208789 () Bool)

(assert (=> d!54291 m!208789))

(assert (=> b!180868 m!208695))

(declare-fun m!208791 () Bool)

(assert (=> b!180868 m!208791))

(assert (=> b!180868 m!208695))

(assert (=> b!180868 m!208775))

(assert (=> b!180868 m!208775))

(declare-fun m!208793 () Bool)

(assert (=> b!180868 m!208793))

(assert (=> b!180870 m!208695))

(assert (=> b!180870 m!208775))

(assert (=> b!180870 m!208775))

(assert (=> b!180870 m!208793))

(assert (=> b!180748 d!54291))

(declare-fun b!180879 () Bool)

(declare-fun e!119150 () Bool)

(declare-fun e!119151 () Bool)

(assert (=> b!180879 (= e!119150 e!119151)))

(declare-fun lt!89400 () (_ BitVec 64))

(assert (=> b!180879 (= lt!89400 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89399 () Unit!5496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7653 (_ BitVec 64) (_ BitVec 32)) Unit!5496)

(assert (=> b!180879 (= lt!89399 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5601 thiss!1248) lt!89400 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!180879 (arrayContainsKey!0 (_keys!5601 thiss!1248) lt!89400 #b00000000000000000000000000000000)))

(declare-fun lt!89401 () Unit!5496)

(assert (=> b!180879 (= lt!89401 lt!89399)))

(declare-fun res!85645 () Bool)

(assert (=> b!180879 (= res!85645 (= (seekEntryOrOpen!0 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000) (_keys!5601 thiss!1248) (mask!8712 thiss!1248)) (Found!595 #b00000000000000000000000000000000)))))

(assert (=> b!180879 (=> (not res!85645) (not e!119151))))

(declare-fun b!180880 () Bool)

(declare-fun e!119152 () Bool)

(assert (=> b!180880 (= e!119152 e!119150)))

(declare-fun c!32407 () Bool)

(assert (=> b!180880 (= c!32407 (validKeyInArray!0 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54293 () Bool)

(declare-fun res!85644 () Bool)

(assert (=> d!54293 (=> res!85644 e!119152)))

(assert (=> d!54293 (= res!85644 (bvsge #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(assert (=> d!54293 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5601 thiss!1248) (mask!8712 thiss!1248)) e!119152)))

(declare-fun b!180881 () Bool)

(declare-fun call!18283 () Bool)

(assert (=> b!180881 (= e!119151 call!18283)))

(declare-fun bm!18280 () Bool)

(assert (=> bm!18280 (= call!18283 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5601 thiss!1248) (mask!8712 thiss!1248)))))

(declare-fun b!180882 () Bool)

(assert (=> b!180882 (= e!119150 call!18283)))

(assert (= (and d!54293 (not res!85644)) b!180880))

(assert (= (and b!180880 c!32407) b!180879))

(assert (= (and b!180880 (not c!32407)) b!180882))

(assert (= (and b!180879 res!85645) b!180881))

(assert (= (or b!180881 b!180882) bm!18280))

(assert (=> b!180879 m!208695))

(declare-fun m!208795 () Bool)

(assert (=> b!180879 m!208795))

(declare-fun m!208797 () Bool)

(assert (=> b!180879 m!208797))

(assert (=> b!180879 m!208695))

(declare-fun m!208799 () Bool)

(assert (=> b!180879 m!208799))

(assert (=> b!180880 m!208695))

(assert (=> b!180880 m!208695))

(assert (=> b!180880 m!208719))

(declare-fun m!208801 () Bool)

(assert (=> bm!18280 m!208801))

(assert (=> b!180676 d!54293))

(declare-fun d!54295 () Bool)

(declare-fun e!119153 () Bool)

(assert (=> d!54295 e!119153))

(declare-fun res!85646 () Bool)

(assert (=> d!54295 (=> res!85646 e!119153)))

(declare-fun lt!89403 () Bool)

(assert (=> d!54295 (= res!85646 (not lt!89403))))

(declare-fun lt!89405 () Bool)

(assert (=> d!54295 (= lt!89403 lt!89405)))

(declare-fun lt!89404 () Unit!5496)

(declare-fun e!119154 () Unit!5496)

(assert (=> d!54295 (= lt!89404 e!119154)))

(declare-fun c!32408 () Bool)

(assert (=> d!54295 (= c!32408 lt!89405)))

(assert (=> d!54295 (= lt!89405 (containsKey!211 (toList!1161 lt!89343) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54295 (= (contains!1237 lt!89343 #b1000000000000000000000000000000000000000000000000000000000000000) lt!89403)))

(declare-fun b!180883 () Bool)

(declare-fun lt!89402 () Unit!5496)

(assert (=> b!180883 (= e!119154 lt!89402)))

(assert (=> b!180883 (= lt!89402 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1161 lt!89343) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180883 (isDefined!160 (getValueByKey!207 (toList!1161 lt!89343) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180884 () Bool)

(declare-fun Unit!5502 () Unit!5496)

(assert (=> b!180884 (= e!119154 Unit!5502)))

(declare-fun b!180885 () Bool)

(assert (=> b!180885 (= e!119153 (isDefined!160 (getValueByKey!207 (toList!1161 lt!89343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54295 c!32408) b!180883))

(assert (= (and d!54295 (not c!32408)) b!180884))

(assert (= (and d!54295 (not res!85646)) b!180885))

(declare-fun m!208803 () Bool)

(assert (=> d!54295 m!208803))

(declare-fun m!208805 () Bool)

(assert (=> b!180883 m!208805))

(assert (=> b!180883 m!208741))

(assert (=> b!180883 m!208741))

(declare-fun m!208807 () Bool)

(assert (=> b!180883 m!208807))

(assert (=> b!180885 m!208741))

(assert (=> b!180885 m!208741))

(assert (=> b!180885 m!208807))

(assert (=> bm!18268 d!54295))

(declare-fun bm!18283 () Bool)

(declare-fun call!18286 () (_ BitVec 32))

(assert (=> bm!18283 (= call!18286 (arrayCountValidKeys!0 (_keys!5601 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3931 (_keys!5601 thiss!1248))))))

(declare-fun d!54297 () Bool)

(declare-fun lt!89408 () (_ BitVec 32))

(assert (=> d!54297 (and (bvsge lt!89408 #b00000000000000000000000000000000) (bvsle lt!89408 (bvsub (size!3931 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119159 () (_ BitVec 32))

(assert (=> d!54297 (= lt!89408 e!119159)))

(declare-fun c!32413 () Bool)

(assert (=> d!54297 (= c!32413 (bvsge #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(assert (=> d!54297 (and (bvsle #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3931 (_keys!5601 thiss!1248)) (size!3931 (_keys!5601 thiss!1248))))))

(assert (=> d!54297 (= (arrayCountValidKeys!0 (_keys!5601 thiss!1248) #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))) lt!89408)))

(declare-fun b!180894 () Bool)

(declare-fun e!119160 () (_ BitVec 32))

(assert (=> b!180894 (= e!119160 (bvadd #b00000000000000000000000000000001 call!18286))))

(declare-fun b!180895 () Bool)

(assert (=> b!180895 (= e!119159 e!119160)))

(declare-fun c!32414 () Bool)

(assert (=> b!180895 (= c!32414 (validKeyInArray!0 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180896 () Bool)

(assert (=> b!180896 (= e!119159 #b00000000000000000000000000000000)))

(declare-fun b!180897 () Bool)

(assert (=> b!180897 (= e!119160 call!18286)))

(assert (= (and d!54297 c!32413) b!180896))

(assert (= (and d!54297 (not c!32413)) b!180895))

(assert (= (and b!180895 c!32414) b!180894))

(assert (= (and b!180895 (not c!32414)) b!180897))

(assert (= (or b!180894 b!180897) bm!18283))

(declare-fun m!208809 () Bool)

(assert (=> bm!18283 m!208809))

(assert (=> b!180895 m!208695))

(assert (=> b!180895 m!208695))

(assert (=> b!180895 m!208719))

(assert (=> b!180675 d!54297))

(declare-fun d!54299 () Bool)

(assert (=> d!54299 (= (apply!150 (+!270 lt!89342 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248))) lt!89351) (get!2068 (getValueByKey!207 (toList!1161 (+!270 lt!89342 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248)))) lt!89351)))))

(declare-fun bs!7384 () Bool)

(assert (= bs!7384 d!54299))

(declare-fun m!208811 () Bool)

(assert (=> bs!7384 m!208811))

(assert (=> bs!7384 m!208811))

(declare-fun m!208813 () Bool)

(assert (=> bs!7384 m!208813))

(assert (=> b!180737 d!54299))

(declare-fun b!180922 () Bool)

(declare-fun e!119180 () ListLongMap!2291)

(assert (=> b!180922 (= e!119180 (ListLongMap!2292 Nil!2296))))

(declare-fun bm!18286 () Bool)

(declare-fun call!18289 () ListLongMap!2291)

(assert (=> bm!18286 (= call!18289 (getCurrentListMapNoExtraKeys!183 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3707 thiss!1248)))))

(declare-fun b!180923 () Bool)

(declare-fun res!85657 () Bool)

(declare-fun e!119175 () Bool)

(assert (=> b!180923 (=> (not res!85657) (not e!119175))))

(declare-fun lt!89425 () ListLongMap!2291)

(assert (=> b!180923 (= res!85657 (not (contains!1237 lt!89425 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180924 () Bool)

(declare-fun e!119178 () Bool)

(declare-fun e!119179 () Bool)

(assert (=> b!180924 (= e!119178 e!119179)))

(assert (=> b!180924 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(declare-fun res!85658 () Bool)

(assert (=> b!180924 (= res!85658 (contains!1237 lt!89425 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180924 (=> (not res!85658) (not e!119179))))

(declare-fun b!180925 () Bool)

(declare-fun e!119177 () ListLongMap!2291)

(assert (=> b!180925 (= e!119180 e!119177)))

(declare-fun c!32423 () Bool)

(assert (=> b!180925 (= c!32423 (validKeyInArray!0 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180926 () Bool)

(declare-fun e!119181 () Bool)

(declare-fun isEmpty!456 (ListLongMap!2291) Bool)

(assert (=> b!180926 (= e!119181 (isEmpty!456 lt!89425))))

(declare-fun b!180927 () Bool)

(assert (=> b!180927 (= e!119177 call!18289)))

(declare-fun b!180928 () Bool)

(assert (=> b!180928 (= e!119175 e!119178)))

(declare-fun c!32424 () Bool)

(declare-fun e!119176 () Bool)

(assert (=> b!180928 (= c!32424 e!119176)))

(declare-fun res!85656 () Bool)

(assert (=> b!180928 (=> (not res!85656) (not e!119176))))

(assert (=> b!180928 (= res!85656 (bvslt #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(declare-fun b!180929 () Bool)

(declare-fun lt!89423 () Unit!5496)

(declare-fun lt!89424 () Unit!5496)

(assert (=> b!180929 (= lt!89423 lt!89424)))

(declare-fun lt!89428 () (_ BitVec 64))

(declare-fun lt!89426 () V!5299)

(declare-fun lt!89429 () ListLongMap!2291)

(declare-fun lt!89427 () (_ BitVec 64))

(assert (=> b!180929 (not (contains!1237 (+!270 lt!89429 (tuple2!3375 lt!89427 lt!89426)) lt!89428))))

(declare-fun addStillNotContains!81 (ListLongMap!2291 (_ BitVec 64) V!5299 (_ BitVec 64)) Unit!5496)

(assert (=> b!180929 (= lt!89424 (addStillNotContains!81 lt!89429 lt!89427 lt!89426 lt!89428))))

(assert (=> b!180929 (= lt!89428 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!180929 (= lt!89426 (get!2067 (select (arr!3624 (_values!3690 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3707 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180929 (= lt!89427 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180929 (= lt!89429 call!18289)))

(assert (=> b!180929 (= e!119177 (+!270 call!18289 (tuple2!3375 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000) (get!2067 (select (arr!3624 (_values!3690 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3707 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!54301 () Bool)

(assert (=> d!54301 e!119175))

(declare-fun res!85655 () Bool)

(assert (=> d!54301 (=> (not res!85655) (not e!119175))))

(assert (=> d!54301 (= res!85655 (not (contains!1237 lt!89425 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54301 (= lt!89425 e!119180)))

(declare-fun c!32426 () Bool)

(assert (=> d!54301 (= c!32426 (bvsge #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(assert (=> d!54301 (validMask!0 (mask!8712 thiss!1248))))

(assert (=> d!54301 (= (getCurrentListMapNoExtraKeys!183 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3707 thiss!1248)) lt!89425)))

(declare-fun b!180930 () Bool)

(assert (=> b!180930 (= e!119178 e!119181)))

(declare-fun c!32425 () Bool)

(assert (=> b!180930 (= c!32425 (bvslt #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(declare-fun b!180931 () Bool)

(assert (=> b!180931 (= e!119181 (= lt!89425 (getCurrentListMapNoExtraKeys!183 (_keys!5601 thiss!1248) (_values!3690 thiss!1248) (mask!8712 thiss!1248) (extraKeys!3444 thiss!1248) (zeroValue!3548 thiss!1248) (minValue!3548 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3707 thiss!1248))))))

(declare-fun b!180932 () Bool)

(assert (=> b!180932 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3931 (_keys!5601 thiss!1248))))))

(assert (=> b!180932 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3932 (_values!3690 thiss!1248))))))

(assert (=> b!180932 (= e!119179 (= (apply!150 lt!89425 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)) (get!2067 (select (arr!3624 (_values!3690 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3707 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!180933 () Bool)

(assert (=> b!180933 (= e!119176 (validKeyInArray!0 (select (arr!3623 (_keys!5601 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180933 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!54301 c!32426) b!180922))

(assert (= (and d!54301 (not c!32426)) b!180925))

(assert (= (and b!180925 c!32423) b!180929))

(assert (= (and b!180925 (not c!32423)) b!180927))

(assert (= (or b!180929 b!180927) bm!18286))

(assert (= (and d!54301 res!85655) b!180923))

(assert (= (and b!180923 res!85657) b!180928))

(assert (= (and b!180928 res!85656) b!180933))

(assert (= (and b!180928 c!32424) b!180924))

(assert (= (and b!180928 (not c!32424)) b!180930))

(assert (= (and b!180924 res!85658) b!180932))

(assert (= (and b!180930 c!32425) b!180931))

(assert (= (and b!180930 (not c!32425)) b!180926))

(declare-fun b_lambda!7127 () Bool)

(assert (=> (not b_lambda!7127) (not b!180929)))

(assert (=> b!180929 t!7152))

(declare-fun b_and!11009 () Bool)

(assert (= b_and!11007 (and (=> t!7152 result!4711) b_and!11009)))

(declare-fun b_lambda!7129 () Bool)

(assert (=> (not b_lambda!7129) (not b!180932)))

(assert (=> b!180932 t!7152))

(declare-fun b_and!11011 () Bool)

(assert (= b_and!11009 (and (=> t!7152 result!4711) b_and!11011)))

(declare-fun m!208815 () Bool)

(assert (=> b!180926 m!208815))

(declare-fun m!208817 () Bool)

(assert (=> b!180923 m!208817))

(assert (=> b!180924 m!208695))

(assert (=> b!180924 m!208695))

(declare-fun m!208819 () Bool)

(assert (=> b!180924 m!208819))

(assert (=> b!180932 m!208707))

(assert (=> b!180932 m!208709))

(assert (=> b!180932 m!208711))

(assert (=> b!180932 m!208695))

(declare-fun m!208821 () Bool)

(assert (=> b!180932 m!208821))

(assert (=> b!180932 m!208707))

(assert (=> b!180932 m!208709))

(assert (=> b!180932 m!208695))

(declare-fun m!208823 () Bool)

(assert (=> b!180931 m!208823))

(declare-fun m!208825 () Bool)

(assert (=> d!54301 m!208825))

(assert (=> d!54301 m!208623))

(declare-fun m!208827 () Bool)

(assert (=> b!180929 m!208827))

(assert (=> b!180929 m!208827))

(declare-fun m!208829 () Bool)

(assert (=> b!180929 m!208829))

(assert (=> b!180929 m!208707))

(assert (=> b!180929 m!208709))

(assert (=> b!180929 m!208711))

(assert (=> b!180929 m!208707))

(declare-fun m!208831 () Bool)

(assert (=> b!180929 m!208831))

(declare-fun m!208833 () Bool)

(assert (=> b!180929 m!208833))

(assert (=> b!180929 m!208709))

(assert (=> b!180929 m!208695))

(assert (=> b!180925 m!208695))

(assert (=> b!180925 m!208695))

(assert (=> b!180925 m!208719))

(assert (=> b!180933 m!208695))

(assert (=> b!180933 m!208695))

(assert (=> b!180933 m!208719))

(assert (=> bm!18286 m!208823))

(assert (=> b!180737 d!54301))

(declare-fun d!54303 () Bool)

(assert (=> d!54303 (contains!1237 (+!270 lt!89352 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248))) lt!89340)))

(declare-fun lt!89432 () Unit!5496)

(declare-fun choose!959 (ListLongMap!2291 (_ BitVec 64) V!5299 (_ BitVec 64)) Unit!5496)

(assert (=> d!54303 (= lt!89432 (choose!959 lt!89352 lt!89336 (zeroValue!3548 thiss!1248) lt!89340))))

(assert (=> d!54303 (contains!1237 lt!89352 lt!89340)))

(assert (=> d!54303 (= (addStillContains!126 lt!89352 lt!89336 (zeroValue!3548 thiss!1248) lt!89340) lt!89432)))

(declare-fun bs!7385 () Bool)

(assert (= bs!7385 d!54303))

(assert (=> bs!7385 m!208665))

(assert (=> bs!7385 m!208665))

(assert (=> bs!7385 m!208689))

(declare-fun m!208835 () Bool)

(assert (=> bs!7385 m!208835))

(declare-fun m!208837 () Bool)

(assert (=> bs!7385 m!208837))

(assert (=> b!180737 d!54303))

(declare-fun d!54305 () Bool)

(assert (=> d!54305 (= (apply!150 (+!270 lt!89349 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248))) lt!89348) (apply!150 lt!89349 lt!89348))))

(declare-fun lt!89435 () Unit!5496)

(declare-fun choose!960 (ListLongMap!2291 (_ BitVec 64) V!5299 (_ BitVec 64)) Unit!5496)

(assert (=> d!54305 (= lt!89435 (choose!960 lt!89349 lt!89341 (zeroValue!3548 thiss!1248) lt!89348))))

(declare-fun e!119184 () Bool)

(assert (=> d!54305 e!119184))

(declare-fun res!85661 () Bool)

(assert (=> d!54305 (=> (not res!85661) (not e!119184))))

(assert (=> d!54305 (= res!85661 (contains!1237 lt!89349 lt!89348))))

(assert (=> d!54305 (= (addApplyDifferent!126 lt!89349 lt!89341 (zeroValue!3548 thiss!1248) lt!89348) lt!89435)))

(declare-fun b!180938 () Bool)

(assert (=> b!180938 (= e!119184 (not (= lt!89348 lt!89341)))))

(assert (= (and d!54305 res!85661) b!180938))

(declare-fun m!208839 () Bool)

(assert (=> d!54305 m!208839))

(declare-fun m!208841 () Bool)

(assert (=> d!54305 m!208841))

(assert (=> d!54305 m!208663))

(assert (=> d!54305 m!208681))

(assert (=> d!54305 m!208681))

(assert (=> d!54305 m!208693))

(assert (=> b!180737 d!54305))

(declare-fun d!54307 () Bool)

(assert (=> d!54307 (= (apply!150 (+!270 lt!89334 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248))) lt!89346) (apply!150 lt!89334 lt!89346))))

(declare-fun lt!89436 () Unit!5496)

(assert (=> d!54307 (= lt!89436 (choose!960 lt!89334 lt!89339 (minValue!3548 thiss!1248) lt!89346))))

(declare-fun e!119185 () Bool)

(assert (=> d!54307 e!119185))

(declare-fun res!85662 () Bool)

(assert (=> d!54307 (=> (not res!85662) (not e!119185))))

(assert (=> d!54307 (= res!85662 (contains!1237 lt!89334 lt!89346))))

(assert (=> d!54307 (= (addApplyDifferent!126 lt!89334 lt!89339 (minValue!3548 thiss!1248) lt!89346) lt!89436)))

(declare-fun b!180939 () Bool)

(assert (=> b!180939 (= e!119185 (not (= lt!89346 lt!89339)))))

(assert (= (and d!54307 res!85662) b!180939))

(declare-fun m!208843 () Bool)

(assert (=> d!54307 m!208843))

(declare-fun m!208845 () Bool)

(assert (=> d!54307 m!208845))

(assert (=> d!54307 m!208691))

(assert (=> d!54307 m!208669))

(assert (=> d!54307 m!208669))

(assert (=> d!54307 m!208671))

(assert (=> b!180737 d!54307))

(declare-fun d!54309 () Bool)

(declare-fun e!119188 () Bool)

(assert (=> d!54309 e!119188))

(declare-fun res!85667 () Bool)

(assert (=> d!54309 (=> (not res!85667) (not e!119188))))

(declare-fun lt!89447 () ListLongMap!2291)

(assert (=> d!54309 (= res!85667 (contains!1237 lt!89447 (_1!1698 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248)))))))

(declare-fun lt!89445 () List!2299)

(assert (=> d!54309 (= lt!89447 (ListLongMap!2292 lt!89445))))

(declare-fun lt!89446 () Unit!5496)

(declare-fun lt!89448 () Unit!5496)

(assert (=> d!54309 (= lt!89446 lt!89448)))

(assert (=> d!54309 (= (getValueByKey!207 lt!89445 (_1!1698 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248)))) (Some!212 (_2!1698 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!109 (List!2299 (_ BitVec 64) V!5299) Unit!5496)

(assert (=> d!54309 (= lt!89448 (lemmaContainsTupThenGetReturnValue!109 lt!89445 (_1!1698 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248))) (_2!1698 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248)))))))

(declare-fun insertStrictlySorted!112 (List!2299 (_ BitVec 64) V!5299) List!2299)

(assert (=> d!54309 (= lt!89445 (insertStrictlySorted!112 (toList!1161 lt!89334) (_1!1698 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248))) (_2!1698 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248)))))))

(assert (=> d!54309 (= (+!270 lt!89334 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248))) lt!89447)))

(declare-fun b!180944 () Bool)

(declare-fun res!85668 () Bool)

(assert (=> b!180944 (=> (not res!85668) (not e!119188))))

(assert (=> b!180944 (= res!85668 (= (getValueByKey!207 (toList!1161 lt!89447) (_1!1698 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248)))) (Some!212 (_2!1698 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248))))))))

(declare-fun b!180945 () Bool)

(declare-fun contains!1240 (List!2299 tuple2!3374) Bool)

(assert (=> b!180945 (= e!119188 (contains!1240 (toList!1161 lt!89447) (tuple2!3375 lt!89339 (minValue!3548 thiss!1248))))))

(assert (= (and d!54309 res!85667) b!180944))

(assert (= (and b!180944 res!85668) b!180945))

(declare-fun m!208847 () Bool)

(assert (=> d!54309 m!208847))

(declare-fun m!208849 () Bool)

(assert (=> d!54309 m!208849))

(declare-fun m!208851 () Bool)

(assert (=> d!54309 m!208851))

(declare-fun m!208853 () Bool)

(assert (=> d!54309 m!208853))

(declare-fun m!208855 () Bool)

(assert (=> b!180944 m!208855))

(declare-fun m!208857 () Bool)

(assert (=> b!180945 m!208857))

(assert (=> b!180737 d!54309))

(declare-fun d!54311 () Bool)

(declare-fun e!119189 () Bool)

(assert (=> d!54311 e!119189))

(declare-fun res!85669 () Bool)

(assert (=> d!54311 (=> (not res!85669) (not e!119189))))

(declare-fun lt!89451 () ListLongMap!2291)

(assert (=> d!54311 (= res!85669 (contains!1237 lt!89451 (_1!1698 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248)))))))

(declare-fun lt!89449 () List!2299)

(assert (=> d!54311 (= lt!89451 (ListLongMap!2292 lt!89449))))

(declare-fun lt!89450 () Unit!5496)

(declare-fun lt!89452 () Unit!5496)

(assert (=> d!54311 (= lt!89450 lt!89452)))

(assert (=> d!54311 (= (getValueByKey!207 lt!89449 (_1!1698 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248)))) (Some!212 (_2!1698 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248)))))))

(assert (=> d!54311 (= lt!89452 (lemmaContainsTupThenGetReturnValue!109 lt!89449 (_1!1698 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248))) (_2!1698 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248)))))))

(assert (=> d!54311 (= lt!89449 (insertStrictlySorted!112 (toList!1161 lt!89349) (_1!1698 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248))) (_2!1698 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248)))))))

(assert (=> d!54311 (= (+!270 lt!89349 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248))) lt!89451)))

(declare-fun b!180946 () Bool)

(declare-fun res!85670 () Bool)

(assert (=> b!180946 (=> (not res!85670) (not e!119189))))

(assert (=> b!180946 (= res!85670 (= (getValueByKey!207 (toList!1161 lt!89451) (_1!1698 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248)))) (Some!212 (_2!1698 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248))))))))

(declare-fun b!180947 () Bool)

(assert (=> b!180947 (= e!119189 (contains!1240 (toList!1161 lt!89451) (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248))))))

(assert (= (and d!54311 res!85669) b!180946))

(assert (= (and b!180946 res!85670) b!180947))

(declare-fun m!208859 () Bool)

(assert (=> d!54311 m!208859))

(declare-fun m!208861 () Bool)

(assert (=> d!54311 m!208861))

(declare-fun m!208863 () Bool)

(assert (=> d!54311 m!208863))

(declare-fun m!208865 () Bool)

(assert (=> d!54311 m!208865))

(declare-fun m!208867 () Bool)

(assert (=> b!180946 m!208867))

(declare-fun m!208869 () Bool)

(assert (=> b!180947 m!208869))

(assert (=> b!180737 d!54311))

(declare-fun d!54313 () Bool)

(declare-fun e!119190 () Bool)

(assert (=> d!54313 e!119190))

(declare-fun res!85671 () Bool)

(assert (=> d!54313 (=> res!85671 e!119190)))

(declare-fun lt!89454 () Bool)

(assert (=> d!54313 (= res!85671 (not lt!89454))))

(declare-fun lt!89456 () Bool)

(assert (=> d!54313 (= lt!89454 lt!89456)))

(declare-fun lt!89455 () Unit!5496)

(declare-fun e!119191 () Unit!5496)

(assert (=> d!54313 (= lt!89455 e!119191)))

(declare-fun c!32427 () Bool)

(assert (=> d!54313 (= c!32427 lt!89456)))

(assert (=> d!54313 (= lt!89456 (containsKey!211 (toList!1161 (+!270 lt!89352 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248)))) lt!89340))))

(assert (=> d!54313 (= (contains!1237 (+!270 lt!89352 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248))) lt!89340) lt!89454)))

(declare-fun b!180948 () Bool)

(declare-fun lt!89453 () Unit!5496)

(assert (=> b!180948 (= e!119191 lt!89453)))

(assert (=> b!180948 (= lt!89453 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1161 (+!270 lt!89352 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248)))) lt!89340))))

(assert (=> b!180948 (isDefined!160 (getValueByKey!207 (toList!1161 (+!270 lt!89352 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248)))) lt!89340))))

(declare-fun b!180949 () Bool)

(declare-fun Unit!5503 () Unit!5496)

(assert (=> b!180949 (= e!119191 Unit!5503)))

(declare-fun b!180950 () Bool)

(assert (=> b!180950 (= e!119190 (isDefined!160 (getValueByKey!207 (toList!1161 (+!270 lt!89352 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248)))) lt!89340)))))

(assert (= (and d!54313 c!32427) b!180948))

(assert (= (and d!54313 (not c!32427)) b!180949))

(assert (= (and d!54313 (not res!85671)) b!180950))

(declare-fun m!208871 () Bool)

(assert (=> d!54313 m!208871))

(declare-fun m!208873 () Bool)

(assert (=> b!180948 m!208873))

(declare-fun m!208875 () Bool)

(assert (=> b!180948 m!208875))

(assert (=> b!180948 m!208875))

(declare-fun m!208877 () Bool)

(assert (=> b!180948 m!208877))

(assert (=> b!180950 m!208875))

(assert (=> b!180950 m!208875))

(assert (=> b!180950 m!208877))

(assert (=> b!180737 d!54313))

(declare-fun d!54315 () Bool)

(assert (=> d!54315 (= (apply!150 lt!89349 lt!89348) (get!2068 (getValueByKey!207 (toList!1161 lt!89349) lt!89348)))))

(declare-fun bs!7386 () Bool)

(assert (= bs!7386 d!54315))

(declare-fun m!208879 () Bool)

(assert (=> bs!7386 m!208879))

(assert (=> bs!7386 m!208879))

(declare-fun m!208881 () Bool)

(assert (=> bs!7386 m!208881))

(assert (=> b!180737 d!54315))

(declare-fun d!54317 () Bool)

(assert (=> d!54317 (= (apply!150 lt!89342 lt!89351) (get!2068 (getValueByKey!207 (toList!1161 lt!89342) lt!89351)))))

(declare-fun bs!7387 () Bool)

(assert (= bs!7387 d!54317))

(declare-fun m!208883 () Bool)

(assert (=> bs!7387 m!208883))

(assert (=> bs!7387 m!208883))

(declare-fun m!208885 () Bool)

(assert (=> bs!7387 m!208885))

(assert (=> b!180737 d!54317))

(declare-fun d!54319 () Bool)

(declare-fun e!119192 () Bool)

(assert (=> d!54319 e!119192))

(declare-fun res!85672 () Bool)

(assert (=> d!54319 (=> (not res!85672) (not e!119192))))

(declare-fun lt!89459 () ListLongMap!2291)

(assert (=> d!54319 (= res!85672 (contains!1237 lt!89459 (_1!1698 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248)))))))

(declare-fun lt!89457 () List!2299)

(assert (=> d!54319 (= lt!89459 (ListLongMap!2292 lt!89457))))

(declare-fun lt!89458 () Unit!5496)

(declare-fun lt!89460 () Unit!5496)

(assert (=> d!54319 (= lt!89458 lt!89460)))

(assert (=> d!54319 (= (getValueByKey!207 lt!89457 (_1!1698 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248)))) (Some!212 (_2!1698 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248)))))))

(assert (=> d!54319 (= lt!89460 (lemmaContainsTupThenGetReturnValue!109 lt!89457 (_1!1698 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248))) (_2!1698 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248)))))))

(assert (=> d!54319 (= lt!89457 (insertStrictlySorted!112 (toList!1161 lt!89342) (_1!1698 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248))) (_2!1698 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248)))))))

(assert (=> d!54319 (= (+!270 lt!89342 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248))) lt!89459)))

(declare-fun b!180951 () Bool)

(declare-fun res!85673 () Bool)

(assert (=> b!180951 (=> (not res!85673) (not e!119192))))

(assert (=> b!180951 (= res!85673 (= (getValueByKey!207 (toList!1161 lt!89459) (_1!1698 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248)))) (Some!212 (_2!1698 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248))))))))

(declare-fun b!180952 () Bool)

(assert (=> b!180952 (= e!119192 (contains!1240 (toList!1161 lt!89459) (tuple2!3375 lt!89344 (minValue!3548 thiss!1248))))))

(assert (= (and d!54319 res!85672) b!180951))

(assert (= (and b!180951 res!85673) b!180952))

(declare-fun m!208887 () Bool)

(assert (=> d!54319 m!208887))

(declare-fun m!208889 () Bool)

(assert (=> d!54319 m!208889))

(declare-fun m!208891 () Bool)

(assert (=> d!54319 m!208891))

(declare-fun m!208893 () Bool)

(assert (=> d!54319 m!208893))

(declare-fun m!208895 () Bool)

(assert (=> b!180951 m!208895))

(declare-fun m!208897 () Bool)

(assert (=> b!180952 m!208897))

(assert (=> b!180737 d!54319))

(declare-fun d!54321 () Bool)

(assert (=> d!54321 (= (apply!150 (+!270 lt!89334 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248))) lt!89346) (get!2068 (getValueByKey!207 (toList!1161 (+!270 lt!89334 (tuple2!3375 lt!89339 (minValue!3548 thiss!1248)))) lt!89346)))))

(declare-fun bs!7388 () Bool)

(assert (= bs!7388 d!54321))

(declare-fun m!208899 () Bool)

(assert (=> bs!7388 m!208899))

(assert (=> bs!7388 m!208899))

(declare-fun m!208901 () Bool)

(assert (=> bs!7388 m!208901))

(assert (=> b!180737 d!54321))

(declare-fun d!54323 () Bool)

(assert (=> d!54323 (= (apply!150 (+!270 lt!89342 (tuple2!3375 lt!89344 (minValue!3548 thiss!1248))) lt!89351) (apply!150 lt!89342 lt!89351))))

(declare-fun lt!89461 () Unit!5496)

(assert (=> d!54323 (= lt!89461 (choose!960 lt!89342 lt!89344 (minValue!3548 thiss!1248) lt!89351))))

(declare-fun e!119193 () Bool)

(assert (=> d!54323 e!119193))

(declare-fun res!85674 () Bool)

(assert (=> d!54323 (=> (not res!85674) (not e!119193))))

(assert (=> d!54323 (= res!85674 (contains!1237 lt!89342 lt!89351))))

(assert (=> d!54323 (= (addApplyDifferent!126 lt!89342 lt!89344 (minValue!3548 thiss!1248) lt!89351) lt!89461)))

(declare-fun b!180953 () Bool)

(assert (=> b!180953 (= e!119193 (not (= lt!89351 lt!89344)))))

(assert (= (and d!54323 res!85674) b!180953))

(declare-fun m!208903 () Bool)

(assert (=> d!54323 m!208903))

(declare-fun m!208905 () Bool)

(assert (=> d!54323 m!208905))

(assert (=> d!54323 m!208683))

(assert (=> d!54323 m!208673))

(assert (=> d!54323 m!208673))

(assert (=> d!54323 m!208675))

(assert (=> b!180737 d!54323))

(declare-fun d!54325 () Bool)

(declare-fun e!119194 () Bool)

(assert (=> d!54325 e!119194))

(declare-fun res!85675 () Bool)

(assert (=> d!54325 (=> (not res!85675) (not e!119194))))

(declare-fun lt!89464 () ListLongMap!2291)

(assert (=> d!54325 (= res!85675 (contains!1237 lt!89464 (_1!1698 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248)))))))

(declare-fun lt!89462 () List!2299)

(assert (=> d!54325 (= lt!89464 (ListLongMap!2292 lt!89462))))

(declare-fun lt!89463 () Unit!5496)

(declare-fun lt!89465 () Unit!5496)

(assert (=> d!54325 (= lt!89463 lt!89465)))

(assert (=> d!54325 (= (getValueByKey!207 lt!89462 (_1!1698 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248)))) (Some!212 (_2!1698 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248)))))))

(assert (=> d!54325 (= lt!89465 (lemmaContainsTupThenGetReturnValue!109 lt!89462 (_1!1698 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248))) (_2!1698 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248)))))))

(assert (=> d!54325 (= lt!89462 (insertStrictlySorted!112 (toList!1161 lt!89352) (_1!1698 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248))) (_2!1698 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248)))))))

(assert (=> d!54325 (= (+!270 lt!89352 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248))) lt!89464)))

(declare-fun b!180954 () Bool)

(declare-fun res!85676 () Bool)

(assert (=> b!180954 (=> (not res!85676) (not e!119194))))

(assert (=> b!180954 (= res!85676 (= (getValueByKey!207 (toList!1161 lt!89464) (_1!1698 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248)))) (Some!212 (_2!1698 (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248))))))))

(declare-fun b!180955 () Bool)

(assert (=> b!180955 (= e!119194 (contains!1240 (toList!1161 lt!89464) (tuple2!3375 lt!89336 (zeroValue!3548 thiss!1248))))))

(assert (= (and d!54325 res!85675) b!180954))

(assert (= (and b!180954 res!85676) b!180955))

(declare-fun m!208907 () Bool)

(assert (=> d!54325 m!208907))

(declare-fun m!208909 () Bool)

(assert (=> d!54325 m!208909))

(declare-fun m!208911 () Bool)

(assert (=> d!54325 m!208911))

(declare-fun m!208913 () Bool)

(assert (=> d!54325 m!208913))

(declare-fun m!208915 () Bool)

(assert (=> b!180954 m!208915))

(declare-fun m!208917 () Bool)

(assert (=> b!180955 m!208917))

(assert (=> b!180737 d!54325))

(declare-fun d!54327 () Bool)

(assert (=> d!54327 (= (apply!150 lt!89334 lt!89346) (get!2068 (getValueByKey!207 (toList!1161 lt!89334) lt!89346)))))

(declare-fun bs!7389 () Bool)

(assert (= bs!7389 d!54327))

(declare-fun m!208919 () Bool)

(assert (=> bs!7389 m!208919))

(assert (=> bs!7389 m!208919))

(declare-fun m!208921 () Bool)

(assert (=> bs!7389 m!208921))

(assert (=> b!180737 d!54327))

(declare-fun d!54329 () Bool)

(assert (=> d!54329 (= (apply!150 (+!270 lt!89349 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248))) lt!89348) (get!2068 (getValueByKey!207 (toList!1161 (+!270 lt!89349 (tuple2!3375 lt!89341 (zeroValue!3548 thiss!1248)))) lt!89348)))))

(declare-fun bs!7390 () Bool)

(assert (= bs!7390 d!54329))

(declare-fun m!208923 () Bool)

(assert (=> bs!7390 m!208923))

(assert (=> bs!7390 m!208923))

(declare-fun m!208925 () Bool)

(assert (=> bs!7390 m!208925))

(assert (=> b!180737 d!54329))

(declare-fun b!180964 () Bool)

(declare-fun res!85685 () Bool)

(declare-fun e!119197 () Bool)

(assert (=> b!180964 (=> (not res!85685) (not e!119197))))

(assert (=> b!180964 (= res!85685 (and (= (size!3932 (_values!3690 thiss!1248)) (bvadd (mask!8712 thiss!1248) #b00000000000000000000000000000001)) (= (size!3931 (_keys!5601 thiss!1248)) (size!3932 (_values!3690 thiss!1248))) (bvsge (_size!1279 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1279 thiss!1248) (bvadd (mask!8712 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!180965 () Bool)

(declare-fun res!85687 () Bool)

(assert (=> b!180965 (=> (not res!85687) (not e!119197))))

(declare-fun size!3935 (LongMapFixedSize!2460) (_ BitVec 32))

(assert (=> b!180965 (= res!85687 (bvsge (size!3935 thiss!1248) (_size!1279 thiss!1248)))))

(declare-fun d!54331 () Bool)

(declare-fun res!85688 () Bool)

(assert (=> d!54331 (=> (not res!85688) (not e!119197))))

(assert (=> d!54331 (= res!85688 (validMask!0 (mask!8712 thiss!1248)))))

(assert (=> d!54331 (= (simpleValid!166 thiss!1248) e!119197)))

(declare-fun b!180967 () Bool)

(assert (=> b!180967 (= e!119197 (and (bvsge (extraKeys!3444 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3444 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1279 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!180966 () Bool)

(declare-fun res!85686 () Bool)

(assert (=> b!180966 (=> (not res!85686) (not e!119197))))

(assert (=> b!180966 (= res!85686 (= (size!3935 thiss!1248) (bvadd (_size!1279 thiss!1248) (bvsdiv (bvadd (extraKeys!3444 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!54331 res!85688) b!180964))

(assert (= (and b!180964 res!85685) b!180965))

(assert (= (and b!180965 res!85687) b!180966))

(assert (= (and b!180966 res!85686) b!180967))

(declare-fun m!208927 () Bool)

(assert (=> b!180965 m!208927))

(assert (=> d!54331 m!208623))

(assert (=> b!180966 m!208927))

(assert (=> d!54255 d!54331))

(assert (=> bm!18272 d!54301))

(declare-fun d!54333 () Bool)

(declare-fun e!119198 () Bool)

(assert (=> d!54333 e!119198))

(declare-fun res!85689 () Bool)

(assert (=> d!54333 (=> (not res!85689) (not e!119198))))

(declare-fun lt!89468 () ListLongMap!2291)

(assert (=> d!54333 (= res!85689 (contains!1237 lt!89468 (_1!1698 (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))))))))

(declare-fun lt!89466 () List!2299)

(assert (=> d!54333 (= lt!89468 (ListLongMap!2292 lt!89466))))

(declare-fun lt!89467 () Unit!5496)

(declare-fun lt!89469 () Unit!5496)

(assert (=> d!54333 (= lt!89467 lt!89469)))

(assert (=> d!54333 (= (getValueByKey!207 lt!89466 (_1!1698 (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))))) (Some!212 (_2!1698 (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))))))))

(assert (=> d!54333 (= lt!89469 (lemmaContainsTupThenGetReturnValue!109 lt!89466 (_1!1698 (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))) (_2!1698 (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))))))))

(assert (=> d!54333 (= lt!89466 (insertStrictlySorted!112 (toList!1161 (ite c!32359 call!18276 (ite c!32361 call!18277 call!18271))) (_1!1698 (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))) (_2!1698 (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))))))))

(assert (=> d!54333 (= (+!270 (ite c!32359 call!18276 (ite c!32361 call!18277 call!18271)) (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))) lt!89468)))

(declare-fun b!180968 () Bool)

(declare-fun res!85690 () Bool)

(assert (=> b!180968 (=> (not res!85690) (not e!119198))))

(assert (=> b!180968 (= res!85690 (= (getValueByKey!207 (toList!1161 lt!89468) (_1!1698 (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))))) (Some!212 (_2!1698 (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))))))))

(declare-fun b!180969 () Bool)

(assert (=> b!180969 (= e!119198 (contains!1240 (toList!1161 lt!89468) (ite (or c!32359 c!32361) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3548 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))))))

(assert (= (and d!54333 res!85689) b!180968))

(assert (= (and b!180968 res!85690) b!180969))

(declare-fun m!208929 () Bool)

(assert (=> d!54333 m!208929))

(declare-fun m!208931 () Bool)

(assert (=> d!54333 m!208931))

(declare-fun m!208933 () Bool)

(assert (=> d!54333 m!208933))

(declare-fun m!208935 () Bool)

(assert (=> d!54333 m!208935))

(declare-fun m!208937 () Bool)

(assert (=> b!180968 m!208937))

(declare-fun m!208939 () Bool)

(assert (=> b!180969 m!208939))

(assert (=> bm!18271 d!54333))

(declare-fun d!54335 () Bool)

(declare-fun e!119199 () Bool)

(assert (=> d!54335 e!119199))

(declare-fun res!85691 () Bool)

(assert (=> d!54335 (=> (not res!85691) (not e!119199))))

(declare-fun lt!89472 () ListLongMap!2291)

(assert (=> d!54335 (= res!85691 (contains!1237 lt!89472 (_1!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))))))

(declare-fun lt!89470 () List!2299)

(assert (=> d!54335 (= lt!89472 (ListLongMap!2292 lt!89470))))

(declare-fun lt!89471 () Unit!5496)

(declare-fun lt!89473 () Unit!5496)

(assert (=> d!54335 (= lt!89471 lt!89473)))

(assert (=> d!54335 (= (getValueByKey!207 lt!89470 (_1!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))) (Some!212 (_2!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))))))

(assert (=> d!54335 (= lt!89473 (lemmaContainsTupThenGetReturnValue!109 lt!89470 (_1!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))) (_2!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))))))

(assert (=> d!54335 (= lt!89470 (insertStrictlySorted!112 (toList!1161 call!18272) (_1!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))) (_2!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))))))

(assert (=> d!54335 (= (+!270 call!18272 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))) lt!89472)))

(declare-fun b!180970 () Bool)

(declare-fun res!85692 () Bool)

(assert (=> b!180970 (=> (not res!85692) (not e!119199))))

(assert (=> b!180970 (= res!85692 (= (getValueByKey!207 (toList!1161 lt!89472) (_1!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248)))) (Some!212 (_2!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))))))))

(declare-fun b!180971 () Bool)

(assert (=> b!180971 (= e!119199 (contains!1240 (toList!1161 lt!89472) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3548 thiss!1248))))))

(assert (= (and d!54335 res!85691) b!180970))

(assert (= (and b!180970 res!85692) b!180971))

(declare-fun m!208941 () Bool)

(assert (=> d!54335 m!208941))

(declare-fun m!208943 () Bool)

(assert (=> d!54335 m!208943))

(declare-fun m!208945 () Bool)

(assert (=> d!54335 m!208945))

(declare-fun m!208947 () Bool)

(assert (=> d!54335 m!208947))

(declare-fun m!208949 () Bool)

(assert (=> b!180970 m!208949))

(declare-fun m!208951 () Bool)

(assert (=> b!180971 m!208951))

(assert (=> b!180745 d!54335))

(declare-fun mapNonEmpty!7268 () Bool)

(declare-fun mapRes!7268 () Bool)

(declare-fun tp!16151 () Bool)

(declare-fun e!119201 () Bool)

(assert (=> mapNonEmpty!7268 (= mapRes!7268 (and tp!16151 e!119201))))

(declare-fun mapRest!7268 () (Array (_ BitVec 32) ValueCell!1776))

(declare-fun mapKey!7268 () (_ BitVec 32))

(declare-fun mapValue!7268 () ValueCell!1776)

(assert (=> mapNonEmpty!7268 (= mapRest!7267 (store mapRest!7268 mapKey!7268 mapValue!7268))))

(declare-fun condMapEmpty!7268 () Bool)

(declare-fun mapDefault!7268 () ValueCell!1776)

(assert (=> mapNonEmpty!7267 (= condMapEmpty!7268 (= mapRest!7267 ((as const (Array (_ BitVec 32) ValueCell!1776)) mapDefault!7268)))))

(declare-fun e!119200 () Bool)

(assert (=> mapNonEmpty!7267 (= tp!16150 (and e!119200 mapRes!7268))))

(declare-fun b!180973 () Bool)

(assert (=> b!180973 (= e!119200 tp_is_empty!4239)))

(declare-fun b!180972 () Bool)

(assert (=> b!180972 (= e!119201 tp_is_empty!4239)))

(declare-fun mapIsEmpty!7268 () Bool)

(assert (=> mapIsEmpty!7268 mapRes!7268))

(assert (= (and mapNonEmpty!7267 condMapEmpty!7268) mapIsEmpty!7268))

(assert (= (and mapNonEmpty!7267 (not condMapEmpty!7268)) mapNonEmpty!7268))

(assert (= (and mapNonEmpty!7268 ((_ is ValueCellFull!1776) mapValue!7268)) b!180972))

(assert (= (and mapNonEmpty!7267 ((_ is ValueCellFull!1776) mapDefault!7268)) b!180973))

(declare-fun m!208953 () Bool)

(assert (=> mapNonEmpty!7268 m!208953))

(declare-fun b_lambda!7131 () Bool)

(assert (= b_lambda!7129 (or (and b!180641 b_free!4467) b_lambda!7131)))

(declare-fun b_lambda!7133 () Bool)

(assert (= b_lambda!7127 (or (and b!180641 b_free!4467) b_lambda!7133)))

(check-sat (not d!54299) (not b!180954) (not b!180952) (not b!180932) (not b!180955) (not b!180966) (not b!180895) (not b!180933) (not b!180951) (not d!54283) (not b!180950) (not d!54321) (not bm!18286) (not d!54305) (not b!180836) (not b!180969) (not b!180947) (not b!180948) (not b!180860) (not b!180879) (not b!180870) (not b!180944) (not b!180924) (not b!180925) (not b!180965) (not b!180792) (not b_lambda!7133) (not bm!18277) (not d!54267) (not b!180946) (not b!180885) (not b!180788) (not bm!18280) (not b!180923) (not b!180883) (not d!54327) (not d!54263) (not b!180880) (not b_next!4467) (not d!54315) (not b_lambda!7125) (not b!180868) tp_is_empty!4239 (not d!54279) (not d!54329) (not d!54303) b_and!11011 (not b!180845) (not b!180970) (not b!180846) (not d!54307) (not d!54291) (not b!180861) (not b!180867) (not b!180968) (not d!54325) (not d!54265) (not d!54317) (not d!54331) (not d!54319) (not d!54311) (not b!180819) (not d!54295) (not d!54273) (not b!180790) (not b!180931) (not bm!18283) (not d!54333) (not d!54323) (not b!180929) (not b_lambda!7131) (not mapNonEmpty!7268) (not b!180822) (not d!54301) (not d!54275) (not b!180971) (not d!54335) (not b!180945) (not d!54309) (not d!54281) (not b!180926) (not b!180859) (not d!54313))
(check-sat b_and!11011 (not b_next!4467))
