; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19932 () Bool)

(assert start!19932)

(declare-fun b!195594 () Bool)

(declare-fun b_free!4729 () Bool)

(declare-fun b_next!4729 () Bool)

(assert (=> b!195594 (= b_free!4729 (not b_next!4729))))

(declare-fun tp!17068 () Bool)

(declare-fun b_and!11489 () Bool)

(assert (=> b!195594 (= tp!17068 b_and!11489)))

(declare-fun b!195597 () Bool)

(declare-fun b_free!4731 () Bool)

(declare-fun b_next!4731 () Bool)

(assert (=> b!195597 (= b_free!4731 (not b_next!4731))))

(declare-fun tp!17070 () Bool)

(declare-fun b_and!11491 () Bool)

(assert (=> b!195597 (= tp!17070 b_and!11491)))

(declare-fun b!195586 () Bool)

(declare-fun e!128646 () Bool)

(declare-fun e!128657 () Bool)

(declare-fun mapRes!7794 () Bool)

(assert (=> b!195586 (= e!128646 (and e!128657 mapRes!7794))))

(declare-fun condMapEmpty!7794 () Bool)

(declare-datatypes ((V!5649 0))(
  ( (V!5650 (val!2295 Int)) )
))
(declare-datatypes ((ValueCell!1907 0))(
  ( (ValueCellFull!1907 (v!4264 V!5649)) (EmptyCell!1907) )
))
(declare-datatypes ((array!8243 0))(
  ( (array!8244 (arr!3878 (Array (_ BitVec 32) (_ BitVec 64))) (size!4203 (_ BitVec 32))) )
))
(declare-datatypes ((array!8245 0))(
  ( (array!8246 (arr!3879 (Array (_ BitVec 32) ValueCell!1907)) (size!4204 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2722 0))(
  ( (LongMapFixedSize!2723 (defaultEntry!3975 Int) (mask!9251 (_ BitVec 32)) (extraKeys!3712 (_ BitVec 32)) (zeroValue!3816 V!5649) (minValue!3816 V!5649) (_size!1410 (_ BitVec 32)) (_keys!5974 array!8243) (_values!3958 array!8245) (_vacant!1410 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3504 0))(
  ( (tuple2!3505 (_1!1763 Bool) (_2!1763 LongMapFixedSize!2722)) )
))
(declare-fun err!99 () tuple2!3504)

(declare-fun mapDefault!7794 () ValueCell!1907)

(assert (=> b!195586 (= condMapEmpty!7794 (= (arr!3879 (_values!3958 (_2!1763 err!99))) ((as const (Array (_ BitVec 32) ValueCell!1907)) mapDefault!7794)))))

(declare-fun b!195587 () Bool)

(declare-fun e!128647 () Bool)

(declare-fun e!128650 () Bool)

(assert (=> b!195587 (= e!128647 e!128650)))

(declare-fun res!92323 () Bool)

(assert (=> b!195587 (=> (not res!92323) (not e!128650))))

(declare-datatypes ((SeekEntryResult!687 0))(
  ( (MissingZero!687 (index!4918 (_ BitVec 32))) (Found!687 (index!4919 (_ BitVec 32))) (Intermediate!687 (undefined!1499 Bool) (index!4920 (_ BitVec 32)) (x!20742 (_ BitVec 32))) (Undefined!687) (MissingVacant!687 (index!4921 (_ BitVec 32))) )
))
(declare-fun lt!97534 () SeekEntryResult!687)

(get-info :version)

(assert (=> b!195587 (= res!92323 (and (not ((_ is Undefined!687) lt!97534)) (not ((_ is MissingVacant!687) lt!97534)) (not ((_ is MissingZero!687) lt!97534)) (not ((_ is Found!687) lt!97534))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun thiss!1248 () LongMapFixedSize!2722)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8243 (_ BitVec 32)) SeekEntryResult!687)

(assert (=> b!195587 (= lt!97534 (seekEntryOrOpen!0 key!828 (_keys!5974 thiss!1248) (mask!9251 thiss!1248)))))

(declare-fun b!195588 () Bool)

(declare-fun e!128658 () Bool)

(declare-fun e!128648 () Bool)

(assert (=> b!195588 (= e!128658 e!128648)))

(declare-datatypes ((tuple2!3506 0))(
  ( (tuple2!3507 (_1!1764 (_ BitVec 64)) (_2!1764 V!5649)) )
))
(declare-datatypes ((List!2412 0))(
  ( (Nil!2409) (Cons!2408 (h!3050 tuple2!3506) (t!7335 List!2412)) )
))
(declare-datatypes ((ListLongMap!2425 0))(
  ( (ListLongMap!2426 (toList!1228 List!2412)) )
))
(declare-fun lt!97532 () ListLongMap!2425)

(declare-fun call!19740 () ListLongMap!2425)

(assert (=> b!195588 (= lt!97532 call!19740)))

(declare-fun res!92320 () Bool)

(declare-fun contains!1367 (ListLongMap!2425 (_ BitVec 64)) Bool)

(assert (=> b!195588 (= res!92320 (not (contains!1367 lt!97532 key!828)))))

(assert (=> b!195588 (=> res!92320 e!128648)))

(declare-fun b!195589 () Bool)

(declare-fun e!128649 () Bool)

(declare-fun tp_is_empty!4501 () Bool)

(assert (=> b!195589 (= e!128649 tp_is_empty!4501)))

(declare-fun bm!19736 () Bool)

(declare-fun call!19739 () ListLongMap!2425)

(declare-fun map!2024 (LongMapFixedSize!2722) ListLongMap!2425)

(assert (=> bm!19736 (= call!19739 (map!2024 thiss!1248))))

(declare-fun b!195590 () Bool)

(assert (=> b!195590 (= e!128658 (not (= call!19740 call!19739)))))

(declare-fun b!195591 () Bool)

(declare-fun e!128652 () Bool)

(assert (=> b!195591 (= e!128652 tp_is_empty!4501)))

(declare-fun b!195592 () Bool)

(declare-fun e!128656 () Bool)

(assert (=> b!195592 (= e!128656 tp_is_empty!4501)))

(declare-fun mapNonEmpty!7794 () Bool)

(declare-fun mapRes!7795 () Bool)

(declare-fun tp!17071 () Bool)

(assert (=> mapNonEmpty!7794 (= mapRes!7795 (and tp!17071 e!128649))))

(declare-fun mapKey!7795 () (_ BitVec 32))

(declare-fun mapValue!7794 () ValueCell!1907)

(declare-fun mapRest!7795 () (Array (_ BitVec 32) ValueCell!1907))

(assert (=> mapNonEmpty!7794 (= (arr!3879 (_values!3958 thiss!1248)) (store mapRest!7795 mapKey!7795 mapValue!7794))))

(declare-fun res!92322 () Bool)

(assert (=> start!19932 (=> (not res!92322) (not e!128647))))

(declare-fun valid!1135 (LongMapFixedSize!2722) Bool)

(assert (=> start!19932 (= res!92322 (valid!1135 thiss!1248))))

(assert (=> start!19932 e!128647))

(declare-fun e!128651 () Bool)

(assert (=> start!19932 e!128651))

(assert (=> start!19932 true))

(assert (=> start!19932 tp_is_empty!4501))

(declare-fun b!195593 () Bool)

(declare-fun v!309 () V!5649)

(declare-fun +!321 (ListLongMap!2425 tuple2!3506) ListLongMap!2425)

(assert (=> b!195593 (= e!128648 (not (= lt!97532 (+!321 call!19739 (tuple2!3507 key!828 v!309)))))))

(declare-fun e!128645 () Bool)

(declare-fun array_inv!2507 (array!8243) Bool)

(declare-fun array_inv!2508 (array!8245) Bool)

(assert (=> b!195594 (= e!128645 (and tp!17068 tp_is_empty!4501 (array_inv!2507 (_keys!5974 (_2!1763 err!99))) (array_inv!2508 (_values!3958 (_2!1763 err!99))) e!128646))))

(declare-fun b!195595 () Bool)

(declare-fun res!92321 () Bool)

(assert (=> b!195595 (=> (not res!92321) (not e!128647))))

(assert (=> b!195595 (= res!92321 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7794 () Bool)

(assert (=> mapIsEmpty!7794 mapRes!7795))

(declare-fun b!195596 () Bool)

(declare-fun e!128653 () Bool)

(assert (=> b!195596 (= e!128650 e!128653)))

(declare-fun res!92324 () Bool)

(assert (=> b!195596 (=> res!92324 e!128653)))

(declare-fun lt!97533 () tuple2!3504)

(assert (=> b!195596 (= res!92324 (not (valid!1135 (_2!1763 lt!97533))))))

(assert (=> b!195596 (= lt!97533 err!99)))

(assert (=> b!195596 true))

(assert (=> b!195596 e!128645))

(declare-fun bm!19737 () Bool)

(assert (=> bm!19737 (= call!19740 (map!2024 (_2!1763 lt!97533)))))

(declare-fun e!128644 () Bool)

(assert (=> b!195597 (= e!128651 (and tp!17070 tp_is_empty!4501 (array_inv!2507 (_keys!5974 thiss!1248)) (array_inv!2508 (_values!3958 thiss!1248)) e!128644))))

(declare-fun b!195598 () Bool)

(assert (=> b!195598 (= e!128657 tp_is_empty!4501)))

(declare-fun b!195599 () Bool)

(assert (=> b!195599 (= e!128653 e!128658)))

(declare-fun c!35418 () Bool)

(assert (=> b!195599 (= c!35418 (_1!1763 lt!97533))))

(declare-fun b!195600 () Bool)

(assert (=> b!195600 (= e!128644 (and e!128652 mapRes!7795))))

(declare-fun condMapEmpty!7795 () Bool)

(declare-fun mapDefault!7795 () ValueCell!1907)

(assert (=> b!195600 (= condMapEmpty!7795 (= (arr!3879 (_values!3958 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1907)) mapDefault!7795)))))

(declare-fun mapIsEmpty!7795 () Bool)

(assert (=> mapIsEmpty!7795 mapRes!7794))

(declare-fun mapNonEmpty!7795 () Bool)

(declare-fun tp!17069 () Bool)

(assert (=> mapNonEmpty!7795 (= mapRes!7794 (and tp!17069 e!128656))))

(declare-fun mapKey!7794 () (_ BitVec 32))

(declare-fun mapValue!7795 () ValueCell!1907)

(declare-fun mapRest!7794 () (Array (_ BitVec 32) ValueCell!1907))

(assert (=> mapNonEmpty!7795 (= (arr!3879 (_values!3958 (_2!1763 err!99))) (store mapRest!7794 mapKey!7794 mapValue!7795))))

(assert (= (and start!19932 res!92322) b!195595))

(assert (= (and b!195595 res!92321) b!195587))

(assert (= (and b!195587 res!92323) b!195596))

(assert (= (and b!195586 condMapEmpty!7794) mapIsEmpty!7795))

(assert (= (and b!195586 (not condMapEmpty!7794)) mapNonEmpty!7795))

(assert (= (and mapNonEmpty!7795 ((_ is ValueCellFull!1907) mapValue!7795)) b!195592))

(assert (= (and b!195586 ((_ is ValueCellFull!1907) mapDefault!7794)) b!195598))

(assert (= b!195594 b!195586))

(assert (= b!195596 b!195594))

(assert (= (and b!195596 (not res!92324)) b!195599))

(assert (= (and b!195599 c!35418) b!195588))

(assert (= (and b!195599 (not c!35418)) b!195590))

(assert (= (and b!195588 (not res!92320)) b!195593))

(assert (= (or b!195593 b!195590) bm!19736))

(assert (= (or b!195588 b!195590) bm!19737))

(assert (= (and b!195600 condMapEmpty!7795) mapIsEmpty!7794))

(assert (= (and b!195600 (not condMapEmpty!7795)) mapNonEmpty!7794))

(assert (= (and mapNonEmpty!7794 ((_ is ValueCellFull!1907) mapValue!7794)) b!195589))

(assert (= (and b!195600 ((_ is ValueCellFull!1907) mapDefault!7795)) b!195591))

(assert (= b!195597 b!195600))

(assert (= start!19932 b!195597))

(declare-fun m!223295 () Bool)

(assert (=> b!195594 m!223295))

(declare-fun m!223297 () Bool)

(assert (=> b!195594 m!223297))

(declare-fun m!223299 () Bool)

(assert (=> mapNonEmpty!7795 m!223299))

(declare-fun m!223301 () Bool)

(assert (=> b!195597 m!223301))

(declare-fun m!223303 () Bool)

(assert (=> b!195597 m!223303))

(declare-fun m!223305 () Bool)

(assert (=> b!195587 m!223305))

(declare-fun m!223307 () Bool)

(assert (=> bm!19736 m!223307))

(declare-fun m!223309 () Bool)

(assert (=> bm!19737 m!223309))

(declare-fun m!223311 () Bool)

(assert (=> b!195596 m!223311))

(declare-fun m!223313 () Bool)

(assert (=> start!19932 m!223313))

(declare-fun m!223315 () Bool)

(assert (=> b!195588 m!223315))

(declare-fun m!223317 () Bool)

(assert (=> b!195593 m!223317))

(declare-fun m!223319 () Bool)

(assert (=> mapNonEmpty!7794 m!223319))

(check-sat (not b!195594) (not b!195587) (not b!195593) b_and!11491 (not mapNonEmpty!7795) tp_is_empty!4501 (not b!195596) (not b!195597) (not bm!19736) (not mapNonEmpty!7794) (not start!19932) (not b_next!4731) (not b!195588) (not bm!19737) (not b_next!4729) b_and!11489)
(check-sat b_and!11489 b_and!11491 (not b_next!4731) (not b_next!4729))
(get-model)

(declare-fun b!195703 () Bool)

(declare-fun e!128755 () SeekEntryResult!687)

(declare-fun lt!97561 () SeekEntryResult!687)

(assert (=> b!195703 (= e!128755 (Found!687 (index!4920 lt!97561)))))

(declare-fun d!57573 () Bool)

(declare-fun lt!97560 () SeekEntryResult!687)

(assert (=> d!57573 (and (or ((_ is Undefined!687) lt!97560) (not ((_ is Found!687) lt!97560)) (and (bvsge (index!4919 lt!97560) #b00000000000000000000000000000000) (bvslt (index!4919 lt!97560) (size!4203 (_keys!5974 thiss!1248))))) (or ((_ is Undefined!687) lt!97560) ((_ is Found!687) lt!97560) (not ((_ is MissingZero!687) lt!97560)) (and (bvsge (index!4918 lt!97560) #b00000000000000000000000000000000) (bvslt (index!4918 lt!97560) (size!4203 (_keys!5974 thiss!1248))))) (or ((_ is Undefined!687) lt!97560) ((_ is Found!687) lt!97560) ((_ is MissingZero!687) lt!97560) (not ((_ is MissingVacant!687) lt!97560)) (and (bvsge (index!4921 lt!97560) #b00000000000000000000000000000000) (bvslt (index!4921 lt!97560) (size!4203 (_keys!5974 thiss!1248))))) (or ((_ is Undefined!687) lt!97560) (ite ((_ is Found!687) lt!97560) (= (select (arr!3878 (_keys!5974 thiss!1248)) (index!4919 lt!97560)) key!828) (ite ((_ is MissingZero!687) lt!97560) (= (select (arr!3878 (_keys!5974 thiss!1248)) (index!4918 lt!97560)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!687) lt!97560) (= (select (arr!3878 (_keys!5974 thiss!1248)) (index!4921 lt!97560)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!128757 () SeekEntryResult!687)

(assert (=> d!57573 (= lt!97560 e!128757)))

(declare-fun c!35432 () Bool)

(assert (=> d!57573 (= c!35432 (and ((_ is Intermediate!687) lt!97561) (undefined!1499 lt!97561)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8243 (_ BitVec 32)) SeekEntryResult!687)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!57573 (= lt!97561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9251 thiss!1248)) key!828 (_keys!5974 thiss!1248) (mask!9251 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!57573 (validMask!0 (mask!9251 thiss!1248))))

(assert (=> d!57573 (= (seekEntryOrOpen!0 key!828 (_keys!5974 thiss!1248) (mask!9251 thiss!1248)) lt!97560)))

(declare-fun b!195704 () Bool)

(declare-fun c!35431 () Bool)

(declare-fun lt!97559 () (_ BitVec 64))

(assert (=> b!195704 (= c!35431 (= lt!97559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128756 () SeekEntryResult!687)

(assert (=> b!195704 (= e!128755 e!128756)))

(declare-fun b!195705 () Bool)

(assert (=> b!195705 (= e!128756 (MissingZero!687 (index!4920 lt!97561)))))

(declare-fun b!195706 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8243 (_ BitVec 32)) SeekEntryResult!687)

(assert (=> b!195706 (= e!128756 (seekKeyOrZeroReturnVacant!0 (x!20742 lt!97561) (index!4920 lt!97561) (index!4920 lt!97561) key!828 (_keys!5974 thiss!1248) (mask!9251 thiss!1248)))))

(declare-fun b!195707 () Bool)

(assert (=> b!195707 (= e!128757 e!128755)))

(assert (=> b!195707 (= lt!97559 (select (arr!3878 (_keys!5974 thiss!1248)) (index!4920 lt!97561)))))

(declare-fun c!35433 () Bool)

(assert (=> b!195707 (= c!35433 (= lt!97559 key!828))))

(declare-fun b!195708 () Bool)

(assert (=> b!195708 (= e!128757 Undefined!687)))

(assert (= (and d!57573 c!35432) b!195708))

(assert (= (and d!57573 (not c!35432)) b!195707))

(assert (= (and b!195707 c!35433) b!195703))

(assert (= (and b!195707 (not c!35433)) b!195704))

(assert (= (and b!195704 c!35431) b!195705))

(assert (= (and b!195704 (not c!35431)) b!195706))

(declare-fun m!223373 () Bool)

(assert (=> d!57573 m!223373))

(declare-fun m!223375 () Bool)

(assert (=> d!57573 m!223375))

(declare-fun m!223377 () Bool)

(assert (=> d!57573 m!223377))

(declare-fun m!223379 () Bool)

(assert (=> d!57573 m!223379))

(declare-fun m!223381 () Bool)

(assert (=> d!57573 m!223381))

(assert (=> d!57573 m!223381))

(declare-fun m!223383 () Bool)

(assert (=> d!57573 m!223383))

(declare-fun m!223385 () Bool)

(assert (=> b!195706 m!223385))

(declare-fun m!223387 () Bool)

(assert (=> b!195707 m!223387))

(assert (=> b!195587 d!57573))

(declare-fun d!57575 () Bool)

(declare-fun res!92361 () Bool)

(declare-fun e!128760 () Bool)

(assert (=> d!57575 (=> (not res!92361) (not e!128760))))

(declare-fun simpleValid!206 (LongMapFixedSize!2722) Bool)

(assert (=> d!57575 (= res!92361 (simpleValid!206 (_2!1763 lt!97533)))))

(assert (=> d!57575 (= (valid!1135 (_2!1763 lt!97533)) e!128760)))

(declare-fun b!195715 () Bool)

(declare-fun res!92362 () Bool)

(assert (=> b!195715 (=> (not res!92362) (not e!128760))))

(declare-fun arrayCountValidKeys!0 (array!8243 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!195715 (= res!92362 (= (arrayCountValidKeys!0 (_keys!5974 (_2!1763 lt!97533)) #b00000000000000000000000000000000 (size!4203 (_keys!5974 (_2!1763 lt!97533)))) (_size!1410 (_2!1763 lt!97533))))))

(declare-fun b!195716 () Bool)

(declare-fun res!92363 () Bool)

(assert (=> b!195716 (=> (not res!92363) (not e!128760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8243 (_ BitVec 32)) Bool)

(assert (=> b!195716 (= res!92363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5974 (_2!1763 lt!97533)) (mask!9251 (_2!1763 lt!97533))))))

(declare-fun b!195717 () Bool)

(declare-datatypes ((List!2414 0))(
  ( (Nil!2411) (Cons!2410 (h!3052 (_ BitVec 64)) (t!7337 List!2414)) )
))
(declare-fun arrayNoDuplicates!0 (array!8243 (_ BitVec 32) List!2414) Bool)

(assert (=> b!195717 (= e!128760 (arrayNoDuplicates!0 (_keys!5974 (_2!1763 lt!97533)) #b00000000000000000000000000000000 Nil!2411))))

(assert (= (and d!57575 res!92361) b!195715))

(assert (= (and b!195715 res!92362) b!195716))

(assert (= (and b!195716 res!92363) b!195717))

(declare-fun m!223389 () Bool)

(assert (=> d!57575 m!223389))

(declare-fun m!223391 () Bool)

(assert (=> b!195715 m!223391))

(declare-fun m!223393 () Bool)

(assert (=> b!195716 m!223393))

(declare-fun m!223395 () Bool)

(assert (=> b!195717 m!223395))

(assert (=> b!195596 d!57575))

(declare-fun d!57577 () Bool)

(declare-fun e!128766 () Bool)

(assert (=> d!57577 e!128766))

(declare-fun res!92366 () Bool)

(assert (=> d!57577 (=> res!92366 e!128766)))

(declare-fun lt!97572 () Bool)

(assert (=> d!57577 (= res!92366 (not lt!97572))))

(declare-fun lt!97573 () Bool)

(assert (=> d!57577 (= lt!97572 lt!97573)))

(declare-datatypes ((Unit!5919 0))(
  ( (Unit!5920) )
))
(declare-fun lt!97571 () Unit!5919)

(declare-fun e!128765 () Unit!5919)

(assert (=> d!57577 (= lt!97571 e!128765)))

(declare-fun c!35436 () Bool)

(assert (=> d!57577 (= c!35436 lt!97573)))

(declare-fun containsKey!250 (List!2412 (_ BitVec 64)) Bool)

(assert (=> d!57577 (= lt!97573 (containsKey!250 (toList!1228 lt!97532) key!828))))

(assert (=> d!57577 (= (contains!1367 lt!97532 key!828) lt!97572)))

(declare-fun b!195724 () Bool)

(declare-fun lt!97570 () Unit!5919)

(assert (=> b!195724 (= e!128765 lt!97570)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!198 (List!2412 (_ BitVec 64)) Unit!5919)

(assert (=> b!195724 (= lt!97570 (lemmaContainsKeyImpliesGetValueByKeyDefined!198 (toList!1228 lt!97532) key!828))))

(declare-datatypes ((Option!253 0))(
  ( (Some!252 (v!4267 V!5649)) (None!251) )
))
(declare-fun isDefined!199 (Option!253) Bool)

(declare-fun getValueByKey!247 (List!2412 (_ BitVec 64)) Option!253)

(assert (=> b!195724 (isDefined!199 (getValueByKey!247 (toList!1228 lt!97532) key!828))))

(declare-fun b!195725 () Bool)

(declare-fun Unit!5921 () Unit!5919)

(assert (=> b!195725 (= e!128765 Unit!5921)))

(declare-fun b!195726 () Bool)

(assert (=> b!195726 (= e!128766 (isDefined!199 (getValueByKey!247 (toList!1228 lt!97532) key!828)))))

(assert (= (and d!57577 c!35436) b!195724))

(assert (= (and d!57577 (not c!35436)) b!195725))

(assert (= (and d!57577 (not res!92366)) b!195726))

(declare-fun m!223397 () Bool)

(assert (=> d!57577 m!223397))

(declare-fun m!223399 () Bool)

(assert (=> b!195724 m!223399))

(declare-fun m!223401 () Bool)

(assert (=> b!195724 m!223401))

(assert (=> b!195724 m!223401))

(declare-fun m!223403 () Bool)

(assert (=> b!195724 m!223403))

(assert (=> b!195726 m!223401))

(assert (=> b!195726 m!223401))

(assert (=> b!195726 m!223403))

(assert (=> b!195588 d!57577))

(declare-fun d!57579 () Bool)

(declare-fun res!92367 () Bool)

(declare-fun e!128767 () Bool)

(assert (=> d!57579 (=> (not res!92367) (not e!128767))))

(assert (=> d!57579 (= res!92367 (simpleValid!206 thiss!1248))))

(assert (=> d!57579 (= (valid!1135 thiss!1248) e!128767)))

(declare-fun b!195727 () Bool)

(declare-fun res!92368 () Bool)

(assert (=> b!195727 (=> (not res!92368) (not e!128767))))

(assert (=> b!195727 (= res!92368 (= (arrayCountValidKeys!0 (_keys!5974 thiss!1248) #b00000000000000000000000000000000 (size!4203 (_keys!5974 thiss!1248))) (_size!1410 thiss!1248)))))

(declare-fun b!195728 () Bool)

(declare-fun res!92369 () Bool)

(assert (=> b!195728 (=> (not res!92369) (not e!128767))))

(assert (=> b!195728 (= res!92369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5974 thiss!1248) (mask!9251 thiss!1248)))))

(declare-fun b!195729 () Bool)

(assert (=> b!195729 (= e!128767 (arrayNoDuplicates!0 (_keys!5974 thiss!1248) #b00000000000000000000000000000000 Nil!2411))))

(assert (= (and d!57579 res!92367) b!195727))

(assert (= (and b!195727 res!92368) b!195728))

(assert (= (and b!195728 res!92369) b!195729))

(declare-fun m!223405 () Bool)

(assert (=> d!57579 m!223405))

(declare-fun m!223407 () Bool)

(assert (=> b!195727 m!223407))

(declare-fun m!223409 () Bool)

(assert (=> b!195728 m!223409))

(declare-fun m!223411 () Bool)

(assert (=> b!195729 m!223411))

(assert (=> start!19932 d!57579))

(declare-fun d!57581 () Bool)

(assert (=> d!57581 (= (array_inv!2507 (_keys!5974 thiss!1248)) (bvsge (size!4203 (_keys!5974 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195597 d!57581))

(declare-fun d!57583 () Bool)

(assert (=> d!57583 (= (array_inv!2508 (_values!3958 thiss!1248)) (bvsge (size!4204 (_values!3958 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195597 d!57583))

(declare-fun d!57585 () Bool)

(declare-fun getCurrentListMap!880 (array!8243 array!8245 (_ BitVec 32) (_ BitVec 32) V!5649 V!5649 (_ BitVec 32) Int) ListLongMap!2425)

(assert (=> d!57585 (= (map!2024 thiss!1248) (getCurrentListMap!880 (_keys!5974 thiss!1248) (_values!3958 thiss!1248) (mask!9251 thiss!1248) (extraKeys!3712 thiss!1248) (zeroValue!3816 thiss!1248) (minValue!3816 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3975 thiss!1248)))))

(declare-fun bs!7830 () Bool)

(assert (= bs!7830 d!57585))

(declare-fun m!223413 () Bool)

(assert (=> bs!7830 m!223413))

(assert (=> bm!19736 d!57585))

(declare-fun d!57587 () Bool)

(declare-fun e!128770 () Bool)

(assert (=> d!57587 e!128770))

(declare-fun res!92375 () Bool)

(assert (=> d!57587 (=> (not res!92375) (not e!128770))))

(declare-fun lt!97582 () ListLongMap!2425)

(assert (=> d!57587 (= res!92375 (contains!1367 lt!97582 (_1!1764 (tuple2!3507 key!828 v!309))))))

(declare-fun lt!97584 () List!2412)

(assert (=> d!57587 (= lt!97582 (ListLongMap!2426 lt!97584))))

(declare-fun lt!97583 () Unit!5919)

(declare-fun lt!97585 () Unit!5919)

(assert (=> d!57587 (= lt!97583 lt!97585)))

(assert (=> d!57587 (= (getValueByKey!247 lt!97584 (_1!1764 (tuple2!3507 key!828 v!309))) (Some!252 (_2!1764 (tuple2!3507 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!134 (List!2412 (_ BitVec 64) V!5649) Unit!5919)

(assert (=> d!57587 (= lt!97585 (lemmaContainsTupThenGetReturnValue!134 lt!97584 (_1!1764 (tuple2!3507 key!828 v!309)) (_2!1764 (tuple2!3507 key!828 v!309))))))

(declare-fun insertStrictlySorted!137 (List!2412 (_ BitVec 64) V!5649) List!2412)

(assert (=> d!57587 (= lt!97584 (insertStrictlySorted!137 (toList!1228 call!19739) (_1!1764 (tuple2!3507 key!828 v!309)) (_2!1764 (tuple2!3507 key!828 v!309))))))

(assert (=> d!57587 (= (+!321 call!19739 (tuple2!3507 key!828 v!309)) lt!97582)))

(declare-fun b!195734 () Bool)

(declare-fun res!92374 () Bool)

(assert (=> b!195734 (=> (not res!92374) (not e!128770))))

(assert (=> b!195734 (= res!92374 (= (getValueByKey!247 (toList!1228 lt!97582) (_1!1764 (tuple2!3507 key!828 v!309))) (Some!252 (_2!1764 (tuple2!3507 key!828 v!309)))))))

(declare-fun b!195735 () Bool)

(declare-fun contains!1368 (List!2412 tuple2!3506) Bool)

(assert (=> b!195735 (= e!128770 (contains!1368 (toList!1228 lt!97582) (tuple2!3507 key!828 v!309)))))

(assert (= (and d!57587 res!92375) b!195734))

(assert (= (and b!195734 res!92374) b!195735))

(declare-fun m!223415 () Bool)

(assert (=> d!57587 m!223415))

(declare-fun m!223417 () Bool)

(assert (=> d!57587 m!223417))

(declare-fun m!223419 () Bool)

(assert (=> d!57587 m!223419))

(declare-fun m!223421 () Bool)

(assert (=> d!57587 m!223421))

(declare-fun m!223423 () Bool)

(assert (=> b!195734 m!223423))

(declare-fun m!223425 () Bool)

(assert (=> b!195735 m!223425))

(assert (=> b!195593 d!57587))

(declare-fun d!57589 () Bool)

(assert (=> d!57589 (= (map!2024 (_2!1763 lt!97533)) (getCurrentListMap!880 (_keys!5974 (_2!1763 lt!97533)) (_values!3958 (_2!1763 lt!97533)) (mask!9251 (_2!1763 lt!97533)) (extraKeys!3712 (_2!1763 lt!97533)) (zeroValue!3816 (_2!1763 lt!97533)) (minValue!3816 (_2!1763 lt!97533)) #b00000000000000000000000000000000 (defaultEntry!3975 (_2!1763 lt!97533))))))

(declare-fun bs!7831 () Bool)

(assert (= bs!7831 d!57589))

(declare-fun m!223427 () Bool)

(assert (=> bs!7831 m!223427))

(assert (=> bm!19737 d!57589))

(declare-fun d!57591 () Bool)

(assert (=> d!57591 (= (array_inv!2507 (_keys!5974 (_2!1763 err!99))) (bvsge (size!4203 (_keys!5974 (_2!1763 err!99))) #b00000000000000000000000000000000))))

(assert (=> b!195594 d!57591))

(declare-fun d!57593 () Bool)

(assert (=> d!57593 (= (array_inv!2508 (_values!3958 (_2!1763 err!99))) (bvsge (size!4204 (_values!3958 (_2!1763 err!99))) #b00000000000000000000000000000000))))

(assert (=> b!195594 d!57593))

(declare-fun b!195743 () Bool)

(declare-fun e!128775 () Bool)

(assert (=> b!195743 (= e!128775 tp_is_empty!4501)))

(declare-fun condMapEmpty!7810 () Bool)

(declare-fun mapDefault!7810 () ValueCell!1907)

(assert (=> mapNonEmpty!7794 (= condMapEmpty!7810 (= mapRest!7795 ((as const (Array (_ BitVec 32) ValueCell!1907)) mapDefault!7810)))))

(declare-fun mapRes!7810 () Bool)

(assert (=> mapNonEmpty!7794 (= tp!17071 (and e!128775 mapRes!7810))))

(declare-fun mapNonEmpty!7810 () Bool)

(declare-fun tp!17098 () Bool)

(declare-fun e!128776 () Bool)

(assert (=> mapNonEmpty!7810 (= mapRes!7810 (and tp!17098 e!128776))))

(declare-fun mapRest!7810 () (Array (_ BitVec 32) ValueCell!1907))

(declare-fun mapKey!7810 () (_ BitVec 32))

(declare-fun mapValue!7810 () ValueCell!1907)

(assert (=> mapNonEmpty!7810 (= mapRest!7795 (store mapRest!7810 mapKey!7810 mapValue!7810))))

(declare-fun mapIsEmpty!7810 () Bool)

(assert (=> mapIsEmpty!7810 mapRes!7810))

(declare-fun b!195742 () Bool)

(assert (=> b!195742 (= e!128776 tp_is_empty!4501)))

(assert (= (and mapNonEmpty!7794 condMapEmpty!7810) mapIsEmpty!7810))

(assert (= (and mapNonEmpty!7794 (not condMapEmpty!7810)) mapNonEmpty!7810))

(assert (= (and mapNonEmpty!7810 ((_ is ValueCellFull!1907) mapValue!7810)) b!195742))

(assert (= (and mapNonEmpty!7794 ((_ is ValueCellFull!1907) mapDefault!7810)) b!195743))

(declare-fun m!223429 () Bool)

(assert (=> mapNonEmpty!7810 m!223429))

(declare-fun b!195745 () Bool)

(declare-fun e!128777 () Bool)

(assert (=> b!195745 (= e!128777 tp_is_empty!4501)))

(declare-fun condMapEmpty!7811 () Bool)

(declare-fun mapDefault!7811 () ValueCell!1907)

(assert (=> mapNonEmpty!7795 (= condMapEmpty!7811 (= mapRest!7794 ((as const (Array (_ BitVec 32) ValueCell!1907)) mapDefault!7811)))))

(declare-fun mapRes!7811 () Bool)

(assert (=> mapNonEmpty!7795 (= tp!17069 (and e!128777 mapRes!7811))))

(declare-fun mapNonEmpty!7811 () Bool)

(declare-fun tp!17099 () Bool)

(declare-fun e!128778 () Bool)

(assert (=> mapNonEmpty!7811 (= mapRes!7811 (and tp!17099 e!128778))))

(declare-fun mapRest!7811 () (Array (_ BitVec 32) ValueCell!1907))

(declare-fun mapKey!7811 () (_ BitVec 32))

(declare-fun mapValue!7811 () ValueCell!1907)

(assert (=> mapNonEmpty!7811 (= mapRest!7794 (store mapRest!7811 mapKey!7811 mapValue!7811))))

(declare-fun mapIsEmpty!7811 () Bool)

(assert (=> mapIsEmpty!7811 mapRes!7811))

(declare-fun b!195744 () Bool)

(assert (=> b!195744 (= e!128778 tp_is_empty!4501)))

(assert (= (and mapNonEmpty!7795 condMapEmpty!7811) mapIsEmpty!7811))

(assert (= (and mapNonEmpty!7795 (not condMapEmpty!7811)) mapNonEmpty!7811))

(assert (= (and mapNonEmpty!7811 ((_ is ValueCellFull!1907) mapValue!7811)) b!195744))

(assert (= (and mapNonEmpty!7795 ((_ is ValueCellFull!1907) mapDefault!7811)) b!195745))

(declare-fun m!223431 () Bool)

(assert (=> mapNonEmpty!7811 m!223431))

(check-sat (not d!57589) (not b!195728) (not b!195717) (not mapNonEmpty!7810) (not d!57577) (not d!57585) (not b!195716) b_and!11491 (not mapNonEmpty!7811) (not b!195734) (not b!195735) (not d!57573) (not b!195726) (not d!57575) (not b_next!4731) (not b!195724) (not b!195729) tp_is_empty!4501 (not b!195706) (not d!57579) (not b!195727) (not d!57587) (not b!195715) (not b_next!4729) b_and!11489)
(check-sat b_and!11489 b_and!11491 (not b_next!4731) (not b_next!4729))
