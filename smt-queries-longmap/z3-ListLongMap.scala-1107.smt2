; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22854 () Bool)

(assert start!22854)

(declare-fun b!238104 () Bool)

(declare-fun b_free!6391 () Bool)

(declare-fun b_next!6391 () Bool)

(assert (=> b!238104 (= b_free!6391 (not b_next!6391))))

(declare-fun tp!22371 () Bool)

(declare-fun b_and!13367 () Bool)

(assert (=> b!238104 (= tp!22371 b_and!13367)))

(declare-fun b!238100 () Bool)

(declare-fun res!116668 () Bool)

(declare-fun e!154602 () Bool)

(assert (=> b!238100 (=> (not res!116668) (not e!154602))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!238100 (= res!116668 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238101 () Bool)

(declare-fun res!116669 () Bool)

(declare-fun e!154596 () Bool)

(assert (=> b!238101 (=> (not res!116669) (not e!154596))))

(declare-datatypes ((V!7985 0))(
  ( (V!7986 (val!3171 Int)) )
))
(declare-datatypes ((ValueCell!2783 0))(
  ( (ValueCellFull!2783 (v!5208 V!7985)) (EmptyCell!2783) )
))
(declare-datatypes ((array!11779 0))(
  ( (array!11780 (arr!5593 (Array (_ BitVec 32) ValueCell!2783)) (size!5934 (_ BitVec 32))) )
))
(declare-datatypes ((array!11781 0))(
  ( (array!11782 (arr!5594 (Array (_ BitVec 32) (_ BitVec 64))) (size!5935 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3466 0))(
  ( (LongMapFixedSize!3467 (defaultEntry!4416 Int) (mask!10442 (_ BitVec 32)) (extraKeys!4153 (_ BitVec 32)) (zeroValue!4257 V!7985) (minValue!4257 V!7985) (_size!1782 (_ BitVec 32)) (_keys!6514 array!11781) (_values!4399 array!11779) (_vacant!1782 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3466)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238101 (= res!116669 (validMask!0 (mask!10442 thiss!1504)))))

(declare-fun b!238102 () Bool)

(declare-fun res!116667 () Bool)

(assert (=> b!238102 (=> (not res!116667) (not e!154596))))

(declare-datatypes ((tuple2!4598 0))(
  ( (tuple2!4599 (_1!2310 (_ BitVec 64)) (_2!2310 V!7985)) )
))
(declare-datatypes ((List!3491 0))(
  ( (Nil!3488) (Cons!3487 (h!4143 tuple2!4598) (t!8474 List!3491)) )
))
(declare-datatypes ((ListLongMap!3513 0))(
  ( (ListLongMap!3514 (toList!1772 List!3491)) )
))
(declare-fun contains!1672 (ListLongMap!3513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1304 (array!11781 array!11779 (_ BitVec 32) (_ BitVec 32) V!7985 V!7985 (_ BitVec 32) Int) ListLongMap!3513)

(assert (=> b!238102 (= res!116667 (not (contains!1672 (getCurrentListMap!1304 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)) key!932)))))

(declare-fun b!238103 () Bool)

(assert (=> b!238103 (= e!154602 e!154596)))

(declare-fun res!116672 () Bool)

(assert (=> b!238103 (=> (not res!116672) (not e!154596))))

(declare-datatypes ((SeekEntryResult!986 0))(
  ( (MissingZero!986 (index!6114 (_ BitVec 32))) (Found!986 (index!6115 (_ BitVec 32))) (Intermediate!986 (undefined!1798 Bool) (index!6116 (_ BitVec 32)) (x!23982 (_ BitVec 32))) (Undefined!986) (MissingVacant!986 (index!6117 (_ BitVec 32))) )
))
(declare-fun lt!120455 () SeekEntryResult!986)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238103 (= res!116672 (or (= lt!120455 (MissingZero!986 index!297)) (= lt!120455 (MissingVacant!986 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11781 (_ BitVec 32)) SeekEntryResult!986)

(assert (=> b!238103 (= lt!120455 (seekEntryOrOpen!0 key!932 (_keys!6514 thiss!1504) (mask!10442 thiss!1504)))))

(declare-fun e!154598 () Bool)

(declare-fun tp_is_empty!6253 () Bool)

(declare-fun e!154601 () Bool)

(declare-fun array_inv!3675 (array!11781) Bool)

(declare-fun array_inv!3676 (array!11779) Bool)

(assert (=> b!238104 (= e!154598 (and tp!22371 tp_is_empty!6253 (array_inv!3675 (_keys!6514 thiss!1504)) (array_inv!3676 (_values!4399 thiss!1504)) e!154601))))

(declare-fun res!116666 () Bool)

(assert (=> start!22854 (=> (not res!116666) (not e!154602))))

(declare-fun valid!1382 (LongMapFixedSize!3466) Bool)

(assert (=> start!22854 (= res!116666 (valid!1382 thiss!1504))))

(assert (=> start!22854 e!154602))

(assert (=> start!22854 e!154598))

(assert (=> start!22854 true))

(declare-fun b!238105 () Bool)

(declare-fun e!154600 () Bool)

(declare-fun mapRes!10605 () Bool)

(assert (=> b!238105 (= e!154601 (and e!154600 mapRes!10605))))

(declare-fun condMapEmpty!10605 () Bool)

(declare-fun mapDefault!10605 () ValueCell!2783)

(assert (=> b!238105 (= condMapEmpty!10605 (= (arr!5593 (_values!4399 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2783)) mapDefault!10605)))))

(declare-fun b!238106 () Bool)

(declare-fun res!116670 () Bool)

(assert (=> b!238106 (=> (not res!116670) (not e!154596))))

(assert (=> b!238106 (= res!116670 (and (= (size!5934 (_values!4399 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10442 thiss!1504))) (= (size!5935 (_keys!6514 thiss!1504)) (size!5934 (_values!4399 thiss!1504))) (bvsge (mask!10442 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4153 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4153 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!238107 () Bool)

(declare-fun res!116671 () Bool)

(assert (=> b!238107 (=> (not res!116671) (not e!154596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11781 (_ BitVec 32)) Bool)

(assert (=> b!238107 (= res!116671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6514 thiss!1504) (mask!10442 thiss!1504)))))

(declare-fun b!238108 () Bool)

(assert (=> b!238108 (= e!154600 tp_is_empty!6253)))

(declare-fun b!238109 () Bool)

(declare-datatypes ((List!3492 0))(
  ( (Nil!3489) (Cons!3488 (h!4144 (_ BitVec 64)) (t!8475 List!3492)) )
))
(declare-fun arrayNoDuplicates!0 (array!11781 (_ BitVec 32) List!3492) Bool)

(assert (=> b!238109 (= e!154596 (not (arrayNoDuplicates!0 (_keys!6514 thiss!1504) #b00000000000000000000000000000000 Nil!3489)))))

(declare-fun b!238110 () Bool)

(declare-fun e!154599 () Bool)

(assert (=> b!238110 (= e!154599 tp_is_empty!6253)))

(declare-fun mapIsEmpty!10605 () Bool)

(assert (=> mapIsEmpty!10605 mapRes!10605))

(declare-fun mapNonEmpty!10605 () Bool)

(declare-fun tp!22370 () Bool)

(assert (=> mapNonEmpty!10605 (= mapRes!10605 (and tp!22370 e!154599))))

(declare-fun mapKey!10605 () (_ BitVec 32))

(declare-fun mapRest!10605 () (Array (_ BitVec 32) ValueCell!2783))

(declare-fun mapValue!10605 () ValueCell!2783)

(assert (=> mapNonEmpty!10605 (= (arr!5593 (_values!4399 thiss!1504)) (store mapRest!10605 mapKey!10605 mapValue!10605))))

(assert (= (and start!22854 res!116666) b!238100))

(assert (= (and b!238100 res!116668) b!238103))

(assert (= (and b!238103 res!116672) b!238102))

(assert (= (and b!238102 res!116667) b!238101))

(assert (= (and b!238101 res!116669) b!238106))

(assert (= (and b!238106 res!116670) b!238107))

(assert (= (and b!238107 res!116671) b!238109))

(assert (= (and b!238105 condMapEmpty!10605) mapIsEmpty!10605))

(assert (= (and b!238105 (not condMapEmpty!10605)) mapNonEmpty!10605))

(get-info :version)

(assert (= (and mapNonEmpty!10605 ((_ is ValueCellFull!2783) mapValue!10605)) b!238110))

(assert (= (and b!238105 ((_ is ValueCellFull!2783) mapDefault!10605)) b!238108))

(assert (= b!238104 b!238105))

(assert (= start!22854 b!238104))

(declare-fun m!258909 () Bool)

(assert (=> b!238101 m!258909))

(declare-fun m!258911 () Bool)

(assert (=> mapNonEmpty!10605 m!258911))

(declare-fun m!258913 () Bool)

(assert (=> b!238102 m!258913))

(assert (=> b!238102 m!258913))

(declare-fun m!258915 () Bool)

(assert (=> b!238102 m!258915))

(declare-fun m!258917 () Bool)

(assert (=> start!22854 m!258917))

(declare-fun m!258919 () Bool)

(assert (=> b!238104 m!258919))

(declare-fun m!258921 () Bool)

(assert (=> b!238104 m!258921))

(declare-fun m!258923 () Bool)

(assert (=> b!238103 m!258923))

(declare-fun m!258925 () Bool)

(assert (=> b!238109 m!258925))

(declare-fun m!258927 () Bool)

(assert (=> b!238107 m!258927))

(check-sat tp_is_empty!6253 b_and!13367 (not b!238107) (not b!238104) (not b!238103) (not b!238102) (not b!238109) (not b!238101) (not mapNonEmpty!10605) (not b_next!6391) (not start!22854))
(check-sat b_and!13367 (not b_next!6391))
(get-model)

(declare-fun d!59803 () Bool)

(declare-fun e!154650 () Bool)

(assert (=> d!59803 e!154650))

(declare-fun res!116717 () Bool)

(assert (=> d!59803 (=> res!116717 e!154650)))

(declare-fun lt!120472 () Bool)

(assert (=> d!59803 (= res!116717 (not lt!120472))))

(declare-fun lt!120471 () Bool)

(assert (=> d!59803 (= lt!120472 lt!120471)))

(declare-datatypes ((Unit!7299 0))(
  ( (Unit!7300) )
))
(declare-fun lt!120470 () Unit!7299)

(declare-fun e!154649 () Unit!7299)

(assert (=> d!59803 (= lt!120470 e!154649)))

(declare-fun c!39729 () Bool)

(assert (=> d!59803 (= c!39729 lt!120471)))

(declare-fun containsKey!269 (List!3491 (_ BitVec 64)) Bool)

(assert (=> d!59803 (= lt!120471 (containsKey!269 (toList!1772 (getCurrentListMap!1304 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504))) key!932))))

(assert (=> d!59803 (= (contains!1672 (getCurrentListMap!1304 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)) key!932) lt!120472)))

(declare-fun b!238183 () Bool)

(declare-fun lt!120473 () Unit!7299)

(assert (=> b!238183 (= e!154649 lt!120473)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!217 (List!3491 (_ BitVec 64)) Unit!7299)

(assert (=> b!238183 (= lt!120473 (lemmaContainsKeyImpliesGetValueByKeyDefined!217 (toList!1772 (getCurrentListMap!1304 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504))) key!932))))

(declare-datatypes ((Option!284 0))(
  ( (Some!283 (v!5211 V!7985)) (None!282) )
))
(declare-fun isDefined!218 (Option!284) Bool)

(declare-fun getValueByKey!278 (List!3491 (_ BitVec 64)) Option!284)

(assert (=> b!238183 (isDefined!218 (getValueByKey!278 (toList!1772 (getCurrentListMap!1304 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504))) key!932))))

(declare-fun b!238184 () Bool)

(declare-fun Unit!7301 () Unit!7299)

(assert (=> b!238184 (= e!154649 Unit!7301)))

(declare-fun b!238185 () Bool)

(assert (=> b!238185 (= e!154650 (isDefined!218 (getValueByKey!278 (toList!1772 (getCurrentListMap!1304 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504))) key!932)))))

(assert (= (and d!59803 c!39729) b!238183))

(assert (= (and d!59803 (not c!39729)) b!238184))

(assert (= (and d!59803 (not res!116717)) b!238185))

(declare-fun m!258969 () Bool)

(assert (=> d!59803 m!258969))

(declare-fun m!258971 () Bool)

(assert (=> b!238183 m!258971))

(declare-fun m!258973 () Bool)

(assert (=> b!238183 m!258973))

(assert (=> b!238183 m!258973))

(declare-fun m!258975 () Bool)

(assert (=> b!238183 m!258975))

(assert (=> b!238185 m!258973))

(assert (=> b!238185 m!258973))

(assert (=> b!238185 m!258975))

(assert (=> b!238102 d!59803))

(declare-fun b!238228 () Bool)

(declare-fun e!154688 () Bool)

(declare-fun e!154682 () Bool)

(assert (=> b!238228 (= e!154688 e!154682)))

(declare-fun res!116744 () Bool)

(declare-fun call!22132 () Bool)

(assert (=> b!238228 (= res!116744 call!22132)))

(assert (=> b!238228 (=> (not res!116744) (not e!154682))))

(declare-fun b!238229 () Bool)

(declare-fun lt!120528 () ListLongMap!3513)

(declare-fun apply!219 (ListLongMap!3513 (_ BitVec 64)) V!7985)

(assert (=> b!238229 (= e!154682 (= (apply!219 lt!120528 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4257 thiss!1504)))))

(declare-fun b!238230 () Bool)

(declare-fun e!154684 () Unit!7299)

(declare-fun lt!120539 () Unit!7299)

(assert (=> b!238230 (= e!154684 lt!120539)))

(declare-fun lt!120520 () ListLongMap!3513)

(declare-fun getCurrentListMapNoExtraKeys!535 (array!11781 array!11779 (_ BitVec 32) (_ BitVec 32) V!7985 V!7985 (_ BitVec 32) Int) ListLongMap!3513)

(assert (=> b!238230 (= lt!120520 (getCurrentListMapNoExtraKeys!535 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)))))

(declare-fun lt!120529 () (_ BitVec 64))

(assert (=> b!238230 (= lt!120529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120536 () (_ BitVec 64))

(assert (=> b!238230 (= lt!120536 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120519 () Unit!7299)

(declare-fun addStillContains!195 (ListLongMap!3513 (_ BitVec 64) V!7985 (_ BitVec 64)) Unit!7299)

(assert (=> b!238230 (= lt!120519 (addStillContains!195 lt!120520 lt!120529 (zeroValue!4257 thiss!1504) lt!120536))))

(declare-fun +!646 (ListLongMap!3513 tuple2!4598) ListLongMap!3513)

(assert (=> b!238230 (contains!1672 (+!646 lt!120520 (tuple2!4599 lt!120529 (zeroValue!4257 thiss!1504))) lt!120536)))

(declare-fun lt!120533 () Unit!7299)

(assert (=> b!238230 (= lt!120533 lt!120519)))

(declare-fun lt!120524 () ListLongMap!3513)

(assert (=> b!238230 (= lt!120524 (getCurrentListMapNoExtraKeys!535 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)))))

(declare-fun lt!120537 () (_ BitVec 64))

(assert (=> b!238230 (= lt!120537 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120532 () (_ BitVec 64))

(assert (=> b!238230 (= lt!120532 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120527 () Unit!7299)

(declare-fun addApplyDifferent!195 (ListLongMap!3513 (_ BitVec 64) V!7985 (_ BitVec 64)) Unit!7299)

(assert (=> b!238230 (= lt!120527 (addApplyDifferent!195 lt!120524 lt!120537 (minValue!4257 thiss!1504) lt!120532))))

(assert (=> b!238230 (= (apply!219 (+!646 lt!120524 (tuple2!4599 lt!120537 (minValue!4257 thiss!1504))) lt!120532) (apply!219 lt!120524 lt!120532))))

(declare-fun lt!120521 () Unit!7299)

(assert (=> b!238230 (= lt!120521 lt!120527)))

(declare-fun lt!120518 () ListLongMap!3513)

(assert (=> b!238230 (= lt!120518 (getCurrentListMapNoExtraKeys!535 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)))))

(declare-fun lt!120526 () (_ BitVec 64))

(assert (=> b!238230 (= lt!120526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120525 () (_ BitVec 64))

(assert (=> b!238230 (= lt!120525 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120522 () Unit!7299)

(assert (=> b!238230 (= lt!120522 (addApplyDifferent!195 lt!120518 lt!120526 (zeroValue!4257 thiss!1504) lt!120525))))

(assert (=> b!238230 (= (apply!219 (+!646 lt!120518 (tuple2!4599 lt!120526 (zeroValue!4257 thiss!1504))) lt!120525) (apply!219 lt!120518 lt!120525))))

(declare-fun lt!120530 () Unit!7299)

(assert (=> b!238230 (= lt!120530 lt!120522)))

(declare-fun lt!120538 () ListLongMap!3513)

(assert (=> b!238230 (= lt!120538 (getCurrentListMapNoExtraKeys!535 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)))))

(declare-fun lt!120523 () (_ BitVec 64))

(assert (=> b!238230 (= lt!120523 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120534 () (_ BitVec 64))

(assert (=> b!238230 (= lt!120534 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238230 (= lt!120539 (addApplyDifferent!195 lt!120538 lt!120523 (minValue!4257 thiss!1504) lt!120534))))

(assert (=> b!238230 (= (apply!219 (+!646 lt!120538 (tuple2!4599 lt!120523 (minValue!4257 thiss!1504))) lt!120534) (apply!219 lt!120538 lt!120534))))

(declare-fun bm!22128 () Bool)

(declare-fun call!22137 () ListLongMap!3513)

(declare-fun call!22131 () ListLongMap!3513)

(assert (=> bm!22128 (= call!22137 call!22131)))

(declare-fun b!238231 () Bool)

(declare-fun res!116743 () Bool)

(declare-fun e!154679 () Bool)

(assert (=> b!238231 (=> (not res!116743) (not e!154679))))

(declare-fun e!154686 () Bool)

(assert (=> b!238231 (= res!116743 e!154686)))

(declare-fun c!39747 () Bool)

(assert (=> b!238231 (= c!39747 (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22129 () Bool)

(declare-fun call!22135 () ListLongMap!3513)

(declare-fun call!22136 () ListLongMap!3513)

(assert (=> bm!22129 (= call!22135 call!22136)))

(declare-fun b!238232 () Bool)

(declare-fun e!154683 () Bool)

(declare-fun get!2892 (ValueCell!2783 V!7985) V!7985)

(declare-fun dynLambda!562 (Int (_ BitVec 64)) V!7985)

(assert (=> b!238232 (= e!154683 (= (apply!219 lt!120528 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000)) (get!2892 (select (arr!5593 (_values!4399 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!562 (defaultEntry!4416 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!238232 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5934 (_values!4399 thiss!1504))))))

(assert (=> b!238232 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5935 (_keys!6514 thiss!1504))))))

(declare-fun d!59805 () Bool)

(assert (=> d!59805 e!154679))

(declare-fun res!116737 () Bool)

(assert (=> d!59805 (=> (not res!116737) (not e!154679))))

(assert (=> d!59805 (= res!116737 (or (bvsge #b00000000000000000000000000000000 (size!5935 (_keys!6514 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5935 (_keys!6514 thiss!1504))))))))

(declare-fun lt!120531 () ListLongMap!3513)

(assert (=> d!59805 (= lt!120528 lt!120531)))

(declare-fun lt!120535 () Unit!7299)

(assert (=> d!59805 (= lt!120535 e!154684)))

(declare-fun c!39746 () Bool)

(declare-fun e!154678 () Bool)

(assert (=> d!59805 (= c!39746 e!154678)))

(declare-fun res!116742 () Bool)

(assert (=> d!59805 (=> (not res!116742) (not e!154678))))

(assert (=> d!59805 (= res!116742 (bvslt #b00000000000000000000000000000000 (size!5935 (_keys!6514 thiss!1504))))))

(declare-fun e!154681 () ListLongMap!3513)

(assert (=> d!59805 (= lt!120531 e!154681)))

(declare-fun c!39744 () Bool)

(assert (=> d!59805 (= c!39744 (and (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59805 (validMask!0 (mask!10442 thiss!1504))))

(assert (=> d!59805 (= (getCurrentListMap!1304 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)) lt!120528)))

(declare-fun b!238233 () Bool)

(declare-fun c!39745 () Bool)

(assert (=> b!238233 (= c!39745 (and (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!154687 () ListLongMap!3513)

(declare-fun e!154685 () ListLongMap!3513)

(assert (=> b!238233 (= e!154687 e!154685)))

(declare-fun b!238234 () Bool)

(assert (=> b!238234 (= e!154685 call!22135)))

(declare-fun bm!22130 () Bool)

(declare-fun call!22134 () ListLongMap!3513)

(assert (=> bm!22130 (= call!22131 call!22134)))

(declare-fun b!238235 () Bool)

(assert (=> b!238235 (= e!154687 call!22135)))

(declare-fun b!238236 () Bool)

(assert (=> b!238236 (= e!154685 call!22137)))

(declare-fun b!238237 () Bool)

(declare-fun e!154677 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!238237 (= e!154677 (validKeyInArray!0 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238238 () Bool)

(assert (=> b!238238 (= e!154678 (validKeyInArray!0 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238239 () Bool)

(declare-fun e!154680 () Bool)

(assert (=> b!238239 (= e!154680 e!154683)))

(declare-fun res!116739 () Bool)

(assert (=> b!238239 (=> (not res!116739) (not e!154683))))

(assert (=> b!238239 (= res!116739 (contains!1672 lt!120528 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!238239 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5935 (_keys!6514 thiss!1504))))))

(declare-fun b!238240 () Bool)

(assert (=> b!238240 (= e!154679 e!154688)))

(declare-fun c!39743 () Bool)

(assert (=> b!238240 (= c!39743 (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22131 () Bool)

(assert (=> bm!22131 (= call!22132 (contains!1672 lt!120528 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22132 () Bool)

(declare-fun call!22133 () Bool)

(assert (=> bm!22132 (= call!22133 (contains!1672 lt!120528 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22133 () Bool)

(declare-fun c!39742 () Bool)

(assert (=> bm!22133 (= call!22136 (+!646 (ite c!39744 call!22134 (ite c!39742 call!22131 call!22137)) (ite (or c!39744 c!39742) (tuple2!4599 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4257 thiss!1504)) (tuple2!4599 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4257 thiss!1504)))))))

(declare-fun b!238241 () Bool)

(declare-fun e!154689 () Bool)

(assert (=> b!238241 (= e!154686 e!154689)))

(declare-fun res!116741 () Bool)

(assert (=> b!238241 (= res!116741 call!22133)))

(assert (=> b!238241 (=> (not res!116741) (not e!154689))))

(declare-fun b!238242 () Bool)

(assert (=> b!238242 (= e!154689 (= (apply!219 lt!120528 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4257 thiss!1504)))))

(declare-fun b!238243 () Bool)

(declare-fun Unit!7302 () Unit!7299)

(assert (=> b!238243 (= e!154684 Unit!7302)))

(declare-fun b!238244 () Bool)

(assert (=> b!238244 (= e!154688 (not call!22132))))

(declare-fun b!238245 () Bool)

(assert (=> b!238245 (= e!154681 (+!646 call!22136 (tuple2!4599 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4257 thiss!1504))))))

(declare-fun b!238246 () Bool)

(assert (=> b!238246 (= e!154686 (not call!22133))))

(declare-fun b!238247 () Bool)

(assert (=> b!238247 (= e!154681 e!154687)))

(assert (=> b!238247 (= c!39742 (and (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238248 () Bool)

(declare-fun res!116738 () Bool)

(assert (=> b!238248 (=> (not res!116738) (not e!154679))))

(assert (=> b!238248 (= res!116738 e!154680)))

(declare-fun res!116736 () Bool)

(assert (=> b!238248 (=> res!116736 e!154680)))

(assert (=> b!238248 (= res!116736 (not e!154677))))

(declare-fun res!116740 () Bool)

(assert (=> b!238248 (=> (not res!116740) (not e!154677))))

(assert (=> b!238248 (= res!116740 (bvslt #b00000000000000000000000000000000 (size!5935 (_keys!6514 thiss!1504))))))

(declare-fun bm!22134 () Bool)

(assert (=> bm!22134 (= call!22134 (getCurrentListMapNoExtraKeys!535 (_keys!6514 thiss!1504) (_values!4399 thiss!1504) (mask!10442 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)))))

(assert (= (and d!59805 c!39744) b!238245))

(assert (= (and d!59805 (not c!39744)) b!238247))

(assert (= (and b!238247 c!39742) b!238235))

(assert (= (and b!238247 (not c!39742)) b!238233))

(assert (= (and b!238233 c!39745) b!238234))

(assert (= (and b!238233 (not c!39745)) b!238236))

(assert (= (or b!238234 b!238236) bm!22128))

(assert (= (or b!238235 bm!22128) bm!22130))

(assert (= (or b!238235 b!238234) bm!22129))

(assert (= (or b!238245 bm!22130) bm!22134))

(assert (= (or b!238245 bm!22129) bm!22133))

(assert (= (and d!59805 res!116742) b!238238))

(assert (= (and d!59805 c!39746) b!238230))

(assert (= (and d!59805 (not c!39746)) b!238243))

(assert (= (and d!59805 res!116737) b!238248))

(assert (= (and b!238248 res!116740) b!238237))

(assert (= (and b!238248 (not res!116736)) b!238239))

(assert (= (and b!238239 res!116739) b!238232))

(assert (= (and b!238248 res!116738) b!238231))

(assert (= (and b!238231 c!39747) b!238241))

(assert (= (and b!238231 (not c!39747)) b!238246))

(assert (= (and b!238241 res!116741) b!238242))

(assert (= (or b!238241 b!238246) bm!22132))

(assert (= (and b!238231 res!116743) b!238240))

(assert (= (and b!238240 c!39743) b!238228))

(assert (= (and b!238240 (not c!39743)) b!238244))

(assert (= (and b!238228 res!116744) b!238229))

(assert (= (or b!238228 b!238244) bm!22131))

(declare-fun b_lambda!7993 () Bool)

(assert (=> (not b_lambda!7993) (not b!238232)))

(declare-fun t!8479 () Bool)

(declare-fun tb!2943 () Bool)

(assert (=> (and b!238104 (= (defaultEntry!4416 thiss!1504) (defaultEntry!4416 thiss!1504)) t!8479) tb!2943))

(declare-fun result!5167 () Bool)

(assert (=> tb!2943 (= result!5167 tp_is_empty!6253)))

(assert (=> b!238232 t!8479))

(declare-fun b_and!13373 () Bool)

(assert (= b_and!13367 (and (=> t!8479 result!5167) b_and!13373)))

(declare-fun m!258977 () Bool)

(assert (=> b!238239 m!258977))

(assert (=> b!238239 m!258977))

(declare-fun m!258979 () Bool)

(assert (=> b!238239 m!258979))

(declare-fun m!258981 () Bool)

(assert (=> b!238230 m!258981))

(declare-fun m!258983 () Bool)

(assert (=> b!238230 m!258983))

(assert (=> b!238230 m!258981))

(declare-fun m!258985 () Bool)

(assert (=> b!238230 m!258985))

(declare-fun m!258987 () Bool)

(assert (=> b!238230 m!258987))

(declare-fun m!258989 () Bool)

(assert (=> b!238230 m!258989))

(declare-fun m!258991 () Bool)

(assert (=> b!238230 m!258991))

(assert (=> b!238230 m!258985))

(declare-fun m!258993 () Bool)

(assert (=> b!238230 m!258993))

(assert (=> b!238230 m!258977))

(declare-fun m!258995 () Bool)

(assert (=> b!238230 m!258995))

(declare-fun m!258997 () Bool)

(assert (=> b!238230 m!258997))

(assert (=> b!238230 m!258987))

(declare-fun m!258999 () Bool)

(assert (=> b!238230 m!258999))

(assert (=> b!238230 m!258995))

(declare-fun m!259001 () Bool)

(assert (=> b!238230 m!259001))

(declare-fun m!259003 () Bool)

(assert (=> b!238230 m!259003))

(declare-fun m!259005 () Bool)

(assert (=> b!238230 m!259005))

(declare-fun m!259007 () Bool)

(assert (=> b!238230 m!259007))

(declare-fun m!259009 () Bool)

(assert (=> b!238230 m!259009))

(declare-fun m!259011 () Bool)

(assert (=> b!238230 m!259011))

(assert (=> bm!22134 m!258999))

(assert (=> b!238232 m!258977))

(declare-fun m!259013 () Bool)

(assert (=> b!238232 m!259013))

(assert (=> b!238232 m!258977))

(declare-fun m!259015 () Bool)

(assert (=> b!238232 m!259015))

(declare-fun m!259017 () Bool)

(assert (=> b!238232 m!259017))

(assert (=> b!238232 m!259015))

(assert (=> b!238232 m!259017))

(declare-fun m!259019 () Bool)

(assert (=> b!238232 m!259019))

(declare-fun m!259021 () Bool)

(assert (=> b!238245 m!259021))

(assert (=> b!238238 m!258977))

(assert (=> b!238238 m!258977))

(declare-fun m!259023 () Bool)

(assert (=> b!238238 m!259023))

(declare-fun m!259025 () Bool)

(assert (=> bm!22132 m!259025))

(declare-fun m!259027 () Bool)

(assert (=> b!238242 m!259027))

(declare-fun m!259029 () Bool)

(assert (=> b!238229 m!259029))

(declare-fun m!259031 () Bool)

(assert (=> bm!22133 m!259031))

(assert (=> b!238237 m!258977))

(assert (=> b!238237 m!258977))

(assert (=> b!238237 m!259023))

(assert (=> d!59805 m!258909))

(declare-fun m!259033 () Bool)

(assert (=> bm!22131 m!259033))

(assert (=> b!238102 d!59805))

(declare-fun b!238259 () Bool)

(declare-fun e!154697 () Bool)

(declare-fun call!22140 () Bool)

(assert (=> b!238259 (= e!154697 call!22140)))

(declare-fun b!238260 () Bool)

(declare-fun e!154698 () Bool)

(declare-fun e!154696 () Bool)

(assert (=> b!238260 (= e!154698 e!154696)))

(declare-fun c!39750 () Bool)

(assert (=> b!238260 (= c!39750 (validKeyInArray!0 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59807 () Bool)

(declare-fun res!116749 () Bool)

(assert (=> d!59807 (=> res!116749 e!154698)))

(assert (=> d!59807 (= res!116749 (bvsge #b00000000000000000000000000000000 (size!5935 (_keys!6514 thiss!1504))))))

(assert (=> d!59807 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6514 thiss!1504) (mask!10442 thiss!1504)) e!154698)))

(declare-fun b!238261 () Bool)

(assert (=> b!238261 (= e!154696 e!154697)))

(declare-fun lt!120548 () (_ BitVec 64))

(assert (=> b!238261 (= lt!120548 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120547 () Unit!7299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11781 (_ BitVec 64) (_ BitVec 32)) Unit!7299)

(assert (=> b!238261 (= lt!120547 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6514 thiss!1504) lt!120548 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238261 (arrayContainsKey!0 (_keys!6514 thiss!1504) lt!120548 #b00000000000000000000000000000000)))

(declare-fun lt!120546 () Unit!7299)

(assert (=> b!238261 (= lt!120546 lt!120547)))

(declare-fun res!116750 () Bool)

(assert (=> b!238261 (= res!116750 (= (seekEntryOrOpen!0 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000) (_keys!6514 thiss!1504) (mask!10442 thiss!1504)) (Found!986 #b00000000000000000000000000000000)))))

(assert (=> b!238261 (=> (not res!116750) (not e!154697))))

(declare-fun bm!22137 () Bool)

(assert (=> bm!22137 (= call!22140 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6514 thiss!1504) (mask!10442 thiss!1504)))))

(declare-fun b!238262 () Bool)

(assert (=> b!238262 (= e!154696 call!22140)))

(assert (= (and d!59807 (not res!116749)) b!238260))

(assert (= (and b!238260 c!39750) b!238261))

(assert (= (and b!238260 (not c!39750)) b!238262))

(assert (= (and b!238261 res!116750) b!238259))

(assert (= (or b!238259 b!238262) bm!22137))

(assert (=> b!238260 m!258977))

(assert (=> b!238260 m!258977))

(assert (=> b!238260 m!259023))

(assert (=> b!238261 m!258977))

(declare-fun m!259035 () Bool)

(assert (=> b!238261 m!259035))

(declare-fun m!259037 () Bool)

(assert (=> b!238261 m!259037))

(assert (=> b!238261 m!258977))

(declare-fun m!259039 () Bool)

(assert (=> b!238261 m!259039))

(declare-fun m!259041 () Bool)

(assert (=> bm!22137 m!259041))

(assert (=> b!238107 d!59807))

(declare-fun d!59809 () Bool)

(assert (=> d!59809 (= (validMask!0 (mask!10442 thiss!1504)) (and (or (= (mask!10442 thiss!1504) #b00000000000000000000000000000111) (= (mask!10442 thiss!1504) #b00000000000000000000000000001111) (= (mask!10442 thiss!1504) #b00000000000000000000000000011111) (= (mask!10442 thiss!1504) #b00000000000000000000000000111111) (= (mask!10442 thiss!1504) #b00000000000000000000000001111111) (= (mask!10442 thiss!1504) #b00000000000000000000000011111111) (= (mask!10442 thiss!1504) #b00000000000000000000000111111111) (= (mask!10442 thiss!1504) #b00000000000000000000001111111111) (= (mask!10442 thiss!1504) #b00000000000000000000011111111111) (= (mask!10442 thiss!1504) #b00000000000000000000111111111111) (= (mask!10442 thiss!1504) #b00000000000000000001111111111111) (= (mask!10442 thiss!1504) #b00000000000000000011111111111111) (= (mask!10442 thiss!1504) #b00000000000000000111111111111111) (= (mask!10442 thiss!1504) #b00000000000000001111111111111111) (= (mask!10442 thiss!1504) #b00000000000000011111111111111111) (= (mask!10442 thiss!1504) #b00000000000000111111111111111111) (= (mask!10442 thiss!1504) #b00000000000001111111111111111111) (= (mask!10442 thiss!1504) #b00000000000011111111111111111111) (= (mask!10442 thiss!1504) #b00000000000111111111111111111111) (= (mask!10442 thiss!1504) #b00000000001111111111111111111111) (= (mask!10442 thiss!1504) #b00000000011111111111111111111111) (= (mask!10442 thiss!1504) #b00000000111111111111111111111111) (= (mask!10442 thiss!1504) #b00000001111111111111111111111111) (= (mask!10442 thiss!1504) #b00000011111111111111111111111111) (= (mask!10442 thiss!1504) #b00000111111111111111111111111111) (= (mask!10442 thiss!1504) #b00001111111111111111111111111111) (= (mask!10442 thiss!1504) #b00011111111111111111111111111111) (= (mask!10442 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10442 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!238101 d!59809))

(declare-fun d!59811 () Bool)

(declare-fun res!116757 () Bool)

(declare-fun e!154701 () Bool)

(assert (=> d!59811 (=> (not res!116757) (not e!154701))))

(declare-fun simpleValid!242 (LongMapFixedSize!3466) Bool)

(assert (=> d!59811 (= res!116757 (simpleValid!242 thiss!1504))))

(assert (=> d!59811 (= (valid!1382 thiss!1504) e!154701)))

(declare-fun b!238269 () Bool)

(declare-fun res!116758 () Bool)

(assert (=> b!238269 (=> (not res!116758) (not e!154701))))

(declare-fun arrayCountValidKeys!0 (array!11781 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!238269 (= res!116758 (= (arrayCountValidKeys!0 (_keys!6514 thiss!1504) #b00000000000000000000000000000000 (size!5935 (_keys!6514 thiss!1504))) (_size!1782 thiss!1504)))))

(declare-fun b!238270 () Bool)

(declare-fun res!116759 () Bool)

(assert (=> b!238270 (=> (not res!116759) (not e!154701))))

(assert (=> b!238270 (= res!116759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6514 thiss!1504) (mask!10442 thiss!1504)))))

(declare-fun b!238271 () Bool)

(assert (=> b!238271 (= e!154701 (arrayNoDuplicates!0 (_keys!6514 thiss!1504) #b00000000000000000000000000000000 Nil!3489))))

(assert (= (and d!59811 res!116757) b!238269))

(assert (= (and b!238269 res!116758) b!238270))

(assert (= (and b!238270 res!116759) b!238271))

(declare-fun m!259043 () Bool)

(assert (=> d!59811 m!259043))

(declare-fun m!259045 () Bool)

(assert (=> b!238269 m!259045))

(assert (=> b!238270 m!258927))

(assert (=> b!238271 m!258925))

(assert (=> start!22854 d!59811))

(declare-fun b!238284 () Bool)

(declare-fun c!39757 () Bool)

(declare-fun lt!120557 () (_ BitVec 64))

(assert (=> b!238284 (= c!39757 (= lt!120557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154710 () SeekEntryResult!986)

(declare-fun e!154708 () SeekEntryResult!986)

(assert (=> b!238284 (= e!154710 e!154708)))

(declare-fun b!238285 () Bool)

(declare-fun e!154709 () SeekEntryResult!986)

(assert (=> b!238285 (= e!154709 e!154710)))

(declare-fun lt!120555 () SeekEntryResult!986)

(assert (=> b!238285 (= lt!120557 (select (arr!5594 (_keys!6514 thiss!1504)) (index!6116 lt!120555)))))

(declare-fun c!39759 () Bool)

(assert (=> b!238285 (= c!39759 (= lt!120557 key!932))))

(declare-fun b!238286 () Bool)

(assert (=> b!238286 (= e!154709 Undefined!986)))

(declare-fun d!59813 () Bool)

(declare-fun lt!120556 () SeekEntryResult!986)

(assert (=> d!59813 (and (or ((_ is Undefined!986) lt!120556) (not ((_ is Found!986) lt!120556)) (and (bvsge (index!6115 lt!120556) #b00000000000000000000000000000000) (bvslt (index!6115 lt!120556) (size!5935 (_keys!6514 thiss!1504))))) (or ((_ is Undefined!986) lt!120556) ((_ is Found!986) lt!120556) (not ((_ is MissingZero!986) lt!120556)) (and (bvsge (index!6114 lt!120556) #b00000000000000000000000000000000) (bvslt (index!6114 lt!120556) (size!5935 (_keys!6514 thiss!1504))))) (or ((_ is Undefined!986) lt!120556) ((_ is Found!986) lt!120556) ((_ is MissingZero!986) lt!120556) (not ((_ is MissingVacant!986) lt!120556)) (and (bvsge (index!6117 lt!120556) #b00000000000000000000000000000000) (bvslt (index!6117 lt!120556) (size!5935 (_keys!6514 thiss!1504))))) (or ((_ is Undefined!986) lt!120556) (ite ((_ is Found!986) lt!120556) (= (select (arr!5594 (_keys!6514 thiss!1504)) (index!6115 lt!120556)) key!932) (ite ((_ is MissingZero!986) lt!120556) (= (select (arr!5594 (_keys!6514 thiss!1504)) (index!6114 lt!120556)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!986) lt!120556) (= (select (arr!5594 (_keys!6514 thiss!1504)) (index!6117 lt!120556)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59813 (= lt!120556 e!154709)))

(declare-fun c!39758 () Bool)

(assert (=> d!59813 (= c!39758 (and ((_ is Intermediate!986) lt!120555) (undefined!1798 lt!120555)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11781 (_ BitVec 32)) SeekEntryResult!986)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59813 (= lt!120555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10442 thiss!1504)) key!932 (_keys!6514 thiss!1504) (mask!10442 thiss!1504)))))

(assert (=> d!59813 (validMask!0 (mask!10442 thiss!1504))))

(assert (=> d!59813 (= (seekEntryOrOpen!0 key!932 (_keys!6514 thiss!1504) (mask!10442 thiss!1504)) lt!120556)))

(declare-fun b!238287 () Bool)

(assert (=> b!238287 (= e!154708 (MissingZero!986 (index!6116 lt!120555)))))

(declare-fun b!238288 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11781 (_ BitVec 32)) SeekEntryResult!986)

(assert (=> b!238288 (= e!154708 (seekKeyOrZeroReturnVacant!0 (x!23982 lt!120555) (index!6116 lt!120555) (index!6116 lt!120555) key!932 (_keys!6514 thiss!1504) (mask!10442 thiss!1504)))))

(declare-fun b!238289 () Bool)

(assert (=> b!238289 (= e!154710 (Found!986 (index!6116 lt!120555)))))

(assert (= (and d!59813 c!39758) b!238286))

(assert (= (and d!59813 (not c!39758)) b!238285))

(assert (= (and b!238285 c!39759) b!238289))

(assert (= (and b!238285 (not c!39759)) b!238284))

(assert (= (and b!238284 c!39757) b!238287))

(assert (= (and b!238284 (not c!39757)) b!238288))

(declare-fun m!259047 () Bool)

(assert (=> b!238285 m!259047))

(declare-fun m!259049 () Bool)

(assert (=> d!59813 m!259049))

(declare-fun m!259051 () Bool)

(assert (=> d!59813 m!259051))

(assert (=> d!59813 m!259051))

(declare-fun m!259053 () Bool)

(assert (=> d!59813 m!259053))

(assert (=> d!59813 m!258909))

(declare-fun m!259055 () Bool)

(assert (=> d!59813 m!259055))

(declare-fun m!259057 () Bool)

(assert (=> d!59813 m!259057))

(declare-fun m!259059 () Bool)

(assert (=> b!238288 m!259059))

(assert (=> b!238103 d!59813))

(declare-fun d!59815 () Bool)

(assert (=> d!59815 (= (array_inv!3675 (_keys!6514 thiss!1504)) (bvsge (size!5935 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238104 d!59815))

(declare-fun d!59817 () Bool)

(assert (=> d!59817 (= (array_inv!3676 (_values!4399 thiss!1504)) (bvsge (size!5934 (_values!4399 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238104 d!59817))

(declare-fun b!238300 () Bool)

(declare-fun e!154721 () Bool)

(declare-fun call!22143 () Bool)

(assert (=> b!238300 (= e!154721 call!22143)))

(declare-fun b!238301 () Bool)

(declare-fun e!154719 () Bool)

(declare-fun e!154720 () Bool)

(assert (=> b!238301 (= e!154719 e!154720)))

(declare-fun res!116767 () Bool)

(assert (=> b!238301 (=> (not res!116767) (not e!154720))))

(declare-fun e!154722 () Bool)

(assert (=> b!238301 (= res!116767 (not e!154722))))

(declare-fun res!116768 () Bool)

(assert (=> b!238301 (=> (not res!116768) (not e!154722))))

(assert (=> b!238301 (= res!116768 (validKeyInArray!0 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238302 () Bool)

(declare-fun contains!1675 (List!3492 (_ BitVec 64)) Bool)

(assert (=> b!238302 (= e!154722 (contains!1675 Nil!3489 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238303 () Bool)

(assert (=> b!238303 (= e!154720 e!154721)))

(declare-fun c!39762 () Bool)

(assert (=> b!238303 (= c!39762 (validKeyInArray!0 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238304 () Bool)

(assert (=> b!238304 (= e!154721 call!22143)))

(declare-fun d!59819 () Bool)

(declare-fun res!116766 () Bool)

(assert (=> d!59819 (=> res!116766 e!154719)))

(assert (=> d!59819 (= res!116766 (bvsge #b00000000000000000000000000000000 (size!5935 (_keys!6514 thiss!1504))))))

(assert (=> d!59819 (= (arrayNoDuplicates!0 (_keys!6514 thiss!1504) #b00000000000000000000000000000000 Nil!3489) e!154719)))

(declare-fun bm!22140 () Bool)

(assert (=> bm!22140 (= call!22143 (arrayNoDuplicates!0 (_keys!6514 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39762 (Cons!3488 (select (arr!5594 (_keys!6514 thiss!1504)) #b00000000000000000000000000000000) Nil!3489) Nil!3489)))))

(assert (= (and d!59819 (not res!116766)) b!238301))

(assert (= (and b!238301 res!116768) b!238302))

(assert (= (and b!238301 res!116767) b!238303))

(assert (= (and b!238303 c!39762) b!238304))

(assert (= (and b!238303 (not c!39762)) b!238300))

(assert (= (or b!238304 b!238300) bm!22140))

(assert (=> b!238301 m!258977))

(assert (=> b!238301 m!258977))

(assert (=> b!238301 m!259023))

(assert (=> b!238302 m!258977))

(assert (=> b!238302 m!258977))

(declare-fun m!259061 () Bool)

(assert (=> b!238302 m!259061))

(assert (=> b!238303 m!258977))

(assert (=> b!238303 m!258977))

(assert (=> b!238303 m!259023))

(assert (=> bm!22140 m!258977))

(declare-fun m!259063 () Bool)

(assert (=> bm!22140 m!259063))

(assert (=> b!238109 d!59819))

(declare-fun b!238312 () Bool)

(declare-fun e!154727 () Bool)

(assert (=> b!238312 (= e!154727 tp_is_empty!6253)))

(declare-fun mapIsEmpty!10614 () Bool)

(declare-fun mapRes!10614 () Bool)

(assert (=> mapIsEmpty!10614 mapRes!10614))

(declare-fun mapNonEmpty!10614 () Bool)

(declare-fun tp!22386 () Bool)

(declare-fun e!154728 () Bool)

(assert (=> mapNonEmpty!10614 (= mapRes!10614 (and tp!22386 e!154728))))

(declare-fun mapRest!10614 () (Array (_ BitVec 32) ValueCell!2783))

(declare-fun mapValue!10614 () ValueCell!2783)

(declare-fun mapKey!10614 () (_ BitVec 32))

(assert (=> mapNonEmpty!10614 (= mapRest!10605 (store mapRest!10614 mapKey!10614 mapValue!10614))))

(declare-fun b!238311 () Bool)

(assert (=> b!238311 (= e!154728 tp_is_empty!6253)))

(declare-fun condMapEmpty!10614 () Bool)

(declare-fun mapDefault!10614 () ValueCell!2783)

(assert (=> mapNonEmpty!10605 (= condMapEmpty!10614 (= mapRest!10605 ((as const (Array (_ BitVec 32) ValueCell!2783)) mapDefault!10614)))))

(assert (=> mapNonEmpty!10605 (= tp!22370 (and e!154727 mapRes!10614))))

(assert (= (and mapNonEmpty!10605 condMapEmpty!10614) mapIsEmpty!10614))

(assert (= (and mapNonEmpty!10605 (not condMapEmpty!10614)) mapNonEmpty!10614))

(assert (= (and mapNonEmpty!10614 ((_ is ValueCellFull!2783) mapValue!10614)) b!238311))

(assert (= (and mapNonEmpty!10605 ((_ is ValueCellFull!2783) mapDefault!10614)) b!238312))

(declare-fun m!259065 () Bool)

(assert (=> mapNonEmpty!10614 m!259065))

(declare-fun b_lambda!7995 () Bool)

(assert (= b_lambda!7993 (or (and b!238104 b_free!6391) b_lambda!7995)))

(check-sat (not b!238238) (not b_lambda!7995) (not bm!22140) (not b!238303) (not b_next!6391) (not bm!22131) (not b!238245) (not mapNonEmpty!10614) (not d!59803) (not bm!22137) (not b!238288) (not b!238261) (not b!238260) tp_is_empty!6253 (not b!238270) b_and!13373 (not d!59811) (not b!238185) (not d!59805) (not b!238232) (not bm!22133) (not b!238183) (not b!238230) (not b!238237) (not b!238269) (not b!238242) (not b!238271) (not b!238301) (not bm!22134) (not bm!22132) (not b!238229) (not b!238239) (not b!238302) (not d!59813))
(check-sat b_and!13373 (not b_next!6391))
