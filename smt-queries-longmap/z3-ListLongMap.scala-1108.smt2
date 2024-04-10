; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22876 () Bool)

(assert start!22876)

(declare-fun b!238326 () Bool)

(declare-fun b_free!6399 () Bool)

(declare-fun b_next!6399 () Bool)

(assert (=> b!238326 (= b_free!6399 (not b_next!6399))))

(declare-fun tp!22398 () Bool)

(declare-fun b_and!13363 () Bool)

(assert (=> b!238326 (= tp!22398 b_and!13363)))

(declare-fun e!154744 () Bool)

(declare-fun tp_is_empty!6261 () Bool)

(declare-datatypes ((V!7995 0))(
  ( (V!7996 (val!3175 Int)) )
))
(declare-datatypes ((ValueCell!2787 0))(
  ( (ValueCellFull!2787 (v!5212 V!7995)) (EmptyCell!2787) )
))
(declare-datatypes ((array!11799 0))(
  ( (array!11800 (arr!5602 (Array (_ BitVec 32) ValueCell!2787)) (size!5943 (_ BitVec 32))) )
))
(declare-datatypes ((array!11801 0))(
  ( (array!11802 (arr!5603 (Array (_ BitVec 32) (_ BitVec 64))) (size!5944 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3474 0))(
  ( (LongMapFixedSize!3475 (defaultEntry!4421 Int) (mask!10452 (_ BitVec 32)) (extraKeys!4158 (_ BitVec 32)) (zeroValue!4262 V!7995) (minValue!4262 V!7995) (_size!1786 (_ BitVec 32)) (_keys!6521 array!11801) (_values!4404 array!11799) (_vacant!1786 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3474)

(declare-fun e!154740 () Bool)

(declare-fun array_inv!3703 (array!11801) Bool)

(declare-fun array_inv!3704 (array!11799) Bool)

(assert (=> b!238326 (= e!154744 (and tp!22398 tp_is_empty!6261 (array_inv!3703 (_keys!6521 thiss!1504)) (array_inv!3704 (_values!4404 thiss!1504)) e!154740))))

(declare-fun b!238327 () Bool)

(declare-fun e!154741 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!238327 (= e!154741 (not (validKeyInArray!0 key!932)))))

(declare-fun b!238328 () Bool)

(declare-fun e!154746 () Bool)

(declare-fun mapRes!10620 () Bool)

(assert (=> b!238328 (= e!154740 (and e!154746 mapRes!10620))))

(declare-fun condMapEmpty!10620 () Bool)

(declare-fun mapDefault!10620 () ValueCell!2787)

(assert (=> b!238328 (= condMapEmpty!10620 (= (arr!5602 (_values!4404 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2787)) mapDefault!10620)))))

(declare-fun b!238329 () Bool)

(assert (=> b!238329 (= e!154746 tp_is_empty!6261)))

(declare-fun b!238330 () Bool)

(declare-fun res!116792 () Bool)

(assert (=> b!238330 (=> (not res!116792) (not e!154741))))

(declare-datatypes ((List!3578 0))(
  ( (Nil!3575) (Cons!3574 (h!4230 (_ BitVec 64)) (t!8571 List!3578)) )
))
(declare-fun arrayNoDuplicates!0 (array!11801 (_ BitVec 32) List!3578) Bool)

(assert (=> b!238330 (= res!116792 (arrayNoDuplicates!0 (_keys!6521 thiss!1504) #b00000000000000000000000000000000 Nil!3575))))

(declare-fun mapNonEmpty!10620 () Bool)

(declare-fun tp!22397 () Bool)

(declare-fun e!154742 () Bool)

(assert (=> mapNonEmpty!10620 (= mapRes!10620 (and tp!22397 e!154742))))

(declare-fun mapValue!10620 () ValueCell!2787)

(declare-fun mapKey!10620 () (_ BitVec 32))

(declare-fun mapRest!10620 () (Array (_ BitVec 32) ValueCell!2787))

(assert (=> mapNonEmpty!10620 (= (arr!5602 (_values!4404 thiss!1504)) (store mapRest!10620 mapKey!10620 mapValue!10620))))

(declare-fun b!238331 () Bool)

(declare-fun res!116794 () Bool)

(assert (=> b!238331 (=> (not res!116794) (not e!154741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238331 (= res!116794 (validMask!0 (mask!10452 thiss!1504)))))

(declare-fun res!116791 () Bool)

(declare-fun e!154745 () Bool)

(assert (=> start!22876 (=> (not res!116791) (not e!154745))))

(declare-fun valid!1372 (LongMapFixedSize!3474) Bool)

(assert (=> start!22876 (= res!116791 (valid!1372 thiss!1504))))

(assert (=> start!22876 e!154745))

(assert (=> start!22876 e!154744))

(assert (=> start!22876 true))

(declare-fun b!238332 () Bool)

(declare-fun res!116793 () Bool)

(assert (=> b!238332 (=> (not res!116793) (not e!154741))))

(declare-datatypes ((tuple2!4680 0))(
  ( (tuple2!4681 (_1!2351 (_ BitVec 64)) (_2!2351 V!7995)) )
))
(declare-datatypes ((List!3579 0))(
  ( (Nil!3576) (Cons!3575 (h!4231 tuple2!4680) (t!8572 List!3579)) )
))
(declare-datatypes ((ListLongMap!3593 0))(
  ( (ListLongMap!3594 (toList!1812 List!3579)) )
))
(declare-fun contains!1699 (ListLongMap!3593 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1340 (array!11801 array!11799 (_ BitVec 32) (_ BitVec 32) V!7995 V!7995 (_ BitVec 32) Int) ListLongMap!3593)

(assert (=> b!238332 (= res!116793 (not (contains!1699 (getCurrentListMap!1340 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504)) key!932)))))

(declare-fun b!238333 () Bool)

(assert (=> b!238333 (= e!154742 tp_is_empty!6261)))

(declare-fun b!238334 () Bool)

(declare-fun res!116788 () Bool)

(assert (=> b!238334 (=> (not res!116788) (not e!154741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11801 (_ BitVec 32)) Bool)

(assert (=> b!238334 (= res!116788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6521 thiss!1504) (mask!10452 thiss!1504)))))

(declare-fun b!238335 () Bool)

(declare-fun res!116795 () Bool)

(assert (=> b!238335 (=> (not res!116795) (not e!154741))))

(assert (=> b!238335 (= res!116795 (and (= (size!5943 (_values!4404 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10452 thiss!1504))) (= (size!5944 (_keys!6521 thiss!1504)) (size!5943 (_values!4404 thiss!1504))) (bvsge (mask!10452 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4158 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4158 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!10620 () Bool)

(assert (=> mapIsEmpty!10620 mapRes!10620))

(declare-fun b!238336 () Bool)

(assert (=> b!238336 (= e!154745 e!154741)))

(declare-fun res!116789 () Bool)

(assert (=> b!238336 (=> (not res!116789) (not e!154741))))

(declare-datatypes ((SeekEntryResult!1016 0))(
  ( (MissingZero!1016 (index!6234 (_ BitVec 32))) (Found!1016 (index!6235 (_ BitVec 32))) (Intermediate!1016 (undefined!1828 Bool) (index!6236 (_ BitVec 32)) (x!24030 (_ BitVec 32))) (Undefined!1016) (MissingVacant!1016 (index!6237 (_ BitVec 32))) )
))
(declare-fun lt!120504 () SeekEntryResult!1016)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238336 (= res!116789 (or (= lt!120504 (MissingZero!1016 index!297)) (= lt!120504 (MissingVacant!1016 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11801 (_ BitVec 32)) SeekEntryResult!1016)

(assert (=> b!238336 (= lt!120504 (seekEntryOrOpen!0 key!932 (_keys!6521 thiss!1504) (mask!10452 thiss!1504)))))

(declare-fun b!238337 () Bool)

(declare-fun res!116790 () Bool)

(assert (=> b!238337 (=> (not res!116790) (not e!154745))))

(assert (=> b!238337 (= res!116790 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22876 res!116791) b!238337))

(assert (= (and b!238337 res!116790) b!238336))

(assert (= (and b!238336 res!116789) b!238332))

(assert (= (and b!238332 res!116793) b!238331))

(assert (= (and b!238331 res!116794) b!238335))

(assert (= (and b!238335 res!116795) b!238334))

(assert (= (and b!238334 res!116788) b!238330))

(assert (= (and b!238330 res!116792) b!238327))

(assert (= (and b!238328 condMapEmpty!10620) mapIsEmpty!10620))

(assert (= (and b!238328 (not condMapEmpty!10620)) mapNonEmpty!10620))

(get-info :version)

(assert (= (and mapNonEmpty!10620 ((_ is ValueCellFull!2787) mapValue!10620)) b!238333))

(assert (= (and b!238328 ((_ is ValueCellFull!2787) mapDefault!10620)) b!238329))

(assert (= b!238326 b!238328))

(assert (= start!22876 b!238326))

(declare-fun m!258907 () Bool)

(assert (=> b!238330 m!258907))

(declare-fun m!258909 () Bool)

(assert (=> b!238327 m!258909))

(declare-fun m!258911 () Bool)

(assert (=> b!238331 m!258911))

(declare-fun m!258913 () Bool)

(assert (=> b!238332 m!258913))

(assert (=> b!238332 m!258913))

(declare-fun m!258915 () Bool)

(assert (=> b!238332 m!258915))

(declare-fun m!258917 () Bool)

(assert (=> b!238326 m!258917))

(declare-fun m!258919 () Bool)

(assert (=> b!238326 m!258919))

(declare-fun m!258921 () Bool)

(assert (=> mapNonEmpty!10620 m!258921))

(declare-fun m!258923 () Bool)

(assert (=> start!22876 m!258923))

(declare-fun m!258925 () Bool)

(assert (=> b!238334 m!258925))

(declare-fun m!258927 () Bool)

(assert (=> b!238336 m!258927))

(check-sat (not b!238331) (not b!238330) tp_is_empty!6261 (not start!22876) (not b!238336) (not b_next!6399) (not b!238327) b_and!13363 (not mapNonEmpty!10620) (not b!238334) (not b!238332) (not b!238326))
(check-sat b_and!13363 (not b_next!6399))
(get-model)

(declare-fun d!59749 () Bool)

(declare-fun e!154772 () Bool)

(assert (=> d!59749 e!154772))

(declare-fun res!116822 () Bool)

(assert (=> d!59749 (=> res!116822 e!154772)))

(declare-fun lt!120518 () Bool)

(assert (=> d!59749 (= res!116822 (not lt!120518))))

(declare-fun lt!120517 () Bool)

(assert (=> d!59749 (= lt!120518 lt!120517)))

(declare-datatypes ((Unit!7316 0))(
  ( (Unit!7317) )
))
(declare-fun lt!120519 () Unit!7316)

(declare-fun e!154773 () Unit!7316)

(assert (=> d!59749 (= lt!120519 e!154773)))

(declare-fun c!39752 () Bool)

(assert (=> d!59749 (= c!39752 lt!120517)))

(declare-fun containsKey!270 (List!3579 (_ BitVec 64)) Bool)

(assert (=> d!59749 (= lt!120517 (containsKey!270 (toList!1812 (getCurrentListMap!1340 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504))) key!932))))

(assert (=> d!59749 (= (contains!1699 (getCurrentListMap!1340 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504)) key!932) lt!120518)))

(declare-fun b!238380 () Bool)

(declare-fun lt!120516 () Unit!7316)

(assert (=> b!238380 (= e!154773 lt!120516)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!218 (List!3579 (_ BitVec 64)) Unit!7316)

(assert (=> b!238380 (= lt!120516 (lemmaContainsKeyImpliesGetValueByKeyDefined!218 (toList!1812 (getCurrentListMap!1340 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504))) key!932))))

(declare-datatypes ((Option!284 0))(
  ( (Some!283 (v!5214 V!7995)) (None!282) )
))
(declare-fun isDefined!219 (Option!284) Bool)

(declare-fun getValueByKey!278 (List!3579 (_ BitVec 64)) Option!284)

(assert (=> b!238380 (isDefined!219 (getValueByKey!278 (toList!1812 (getCurrentListMap!1340 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504))) key!932))))

(declare-fun b!238381 () Bool)

(declare-fun Unit!7318 () Unit!7316)

(assert (=> b!238381 (= e!154773 Unit!7318)))

(declare-fun b!238382 () Bool)

(assert (=> b!238382 (= e!154772 (isDefined!219 (getValueByKey!278 (toList!1812 (getCurrentListMap!1340 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504))) key!932)))))

(assert (= (and d!59749 c!39752) b!238380))

(assert (= (and d!59749 (not c!39752)) b!238381))

(assert (= (and d!59749 (not res!116822)) b!238382))

(declare-fun m!258951 () Bool)

(assert (=> d!59749 m!258951))

(declare-fun m!258953 () Bool)

(assert (=> b!238380 m!258953))

(declare-fun m!258955 () Bool)

(assert (=> b!238380 m!258955))

(assert (=> b!238380 m!258955))

(declare-fun m!258957 () Bool)

(assert (=> b!238380 m!258957))

(assert (=> b!238382 m!258955))

(assert (=> b!238382 m!258955))

(assert (=> b!238382 m!258957))

(assert (=> b!238332 d!59749))

(declare-fun bm!22167 () Bool)

(declare-fun call!22171 () ListLongMap!3593)

(declare-fun call!22175 () ListLongMap!3593)

(assert (=> bm!22167 (= call!22171 call!22175)))

(declare-fun bm!22168 () Bool)

(declare-fun call!22176 () ListLongMap!3593)

(declare-fun getCurrentListMapNoExtraKeys!542 (array!11801 array!11799 (_ BitVec 32) (_ BitVec 32) V!7995 V!7995 (_ BitVec 32) Int) ListLongMap!3593)

(assert (=> bm!22168 (= call!22176 (getCurrentListMapNoExtraKeys!542 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504)))))

(declare-fun b!238425 () Bool)

(declare-fun e!154808 () Unit!7316)

(declare-fun lt!120575 () Unit!7316)

(assert (=> b!238425 (= e!154808 lt!120575)))

(declare-fun lt!120576 () ListLongMap!3593)

(assert (=> b!238425 (= lt!120576 (getCurrentListMapNoExtraKeys!542 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504)))))

(declare-fun lt!120580 () (_ BitVec 64))

(assert (=> b!238425 (= lt!120580 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120577 () (_ BitVec 64))

(assert (=> b!238425 (= lt!120577 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120566 () Unit!7316)

(declare-fun addStillContains!196 (ListLongMap!3593 (_ BitVec 64) V!7995 (_ BitVec 64)) Unit!7316)

(assert (=> b!238425 (= lt!120566 (addStillContains!196 lt!120576 lt!120580 (zeroValue!4262 thiss!1504) lt!120577))))

(declare-fun +!647 (ListLongMap!3593 tuple2!4680) ListLongMap!3593)

(assert (=> b!238425 (contains!1699 (+!647 lt!120576 (tuple2!4681 lt!120580 (zeroValue!4262 thiss!1504))) lt!120577)))

(declare-fun lt!120582 () Unit!7316)

(assert (=> b!238425 (= lt!120582 lt!120566)))

(declare-fun lt!120572 () ListLongMap!3593)

(assert (=> b!238425 (= lt!120572 (getCurrentListMapNoExtraKeys!542 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504)))))

(declare-fun lt!120570 () (_ BitVec 64))

(assert (=> b!238425 (= lt!120570 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120573 () (_ BitVec 64))

(assert (=> b!238425 (= lt!120573 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120571 () Unit!7316)

(declare-fun addApplyDifferent!196 (ListLongMap!3593 (_ BitVec 64) V!7995 (_ BitVec 64)) Unit!7316)

(assert (=> b!238425 (= lt!120571 (addApplyDifferent!196 lt!120572 lt!120570 (minValue!4262 thiss!1504) lt!120573))))

(declare-fun apply!220 (ListLongMap!3593 (_ BitVec 64)) V!7995)

(assert (=> b!238425 (= (apply!220 (+!647 lt!120572 (tuple2!4681 lt!120570 (minValue!4262 thiss!1504))) lt!120573) (apply!220 lt!120572 lt!120573))))

(declare-fun lt!120565 () Unit!7316)

(assert (=> b!238425 (= lt!120565 lt!120571)))

(declare-fun lt!120583 () ListLongMap!3593)

(assert (=> b!238425 (= lt!120583 (getCurrentListMapNoExtraKeys!542 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504)))))

(declare-fun lt!120578 () (_ BitVec 64))

(assert (=> b!238425 (= lt!120578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120567 () (_ BitVec 64))

(assert (=> b!238425 (= lt!120567 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120584 () Unit!7316)

(assert (=> b!238425 (= lt!120584 (addApplyDifferent!196 lt!120583 lt!120578 (zeroValue!4262 thiss!1504) lt!120567))))

(assert (=> b!238425 (= (apply!220 (+!647 lt!120583 (tuple2!4681 lt!120578 (zeroValue!4262 thiss!1504))) lt!120567) (apply!220 lt!120583 lt!120567))))

(declare-fun lt!120585 () Unit!7316)

(assert (=> b!238425 (= lt!120585 lt!120584)))

(declare-fun lt!120579 () ListLongMap!3593)

(assert (=> b!238425 (= lt!120579 (getCurrentListMapNoExtraKeys!542 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504)))))

(declare-fun lt!120568 () (_ BitVec 64))

(assert (=> b!238425 (= lt!120568 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120581 () (_ BitVec 64))

(assert (=> b!238425 (= lt!120581 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238425 (= lt!120575 (addApplyDifferent!196 lt!120579 lt!120568 (minValue!4262 thiss!1504) lt!120581))))

(assert (=> b!238425 (= (apply!220 (+!647 lt!120579 (tuple2!4681 lt!120568 (minValue!4262 thiss!1504))) lt!120581) (apply!220 lt!120579 lt!120581))))

(declare-fun bm!22169 () Bool)

(declare-fun call!22173 () Bool)

(declare-fun lt!120564 () ListLongMap!3593)

(assert (=> bm!22169 (= call!22173 (contains!1699 lt!120564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238426 () Bool)

(declare-fun e!154800 () ListLongMap!3593)

(declare-fun call!22170 () ListLongMap!3593)

(assert (=> b!238426 (= e!154800 call!22170)))

(declare-fun bm!22170 () Bool)

(declare-fun call!22172 () Bool)

(assert (=> bm!22170 (= call!22172 (contains!1699 lt!120564 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238427 () Bool)

(declare-fun e!154812 () Bool)

(declare-fun e!154803 () Bool)

(assert (=> b!238427 (= e!154812 e!154803)))

(declare-fun c!39765 () Bool)

(assert (=> b!238427 (= c!39765 (not (= (bvand (extraKeys!4158 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238428 () Bool)

(declare-fun res!116846 () Bool)

(assert (=> b!238428 (=> (not res!116846) (not e!154812))))

(declare-fun e!154809 () Bool)

(assert (=> b!238428 (= res!116846 e!154809)))

(declare-fun res!116849 () Bool)

(assert (=> b!238428 (=> res!116849 e!154809)))

(declare-fun e!154804 () Bool)

(assert (=> b!238428 (= res!116849 (not e!154804))))

(declare-fun res!116842 () Bool)

(assert (=> b!238428 (=> (not res!116842) (not e!154804))))

(assert (=> b!238428 (= res!116842 (bvslt #b00000000000000000000000000000000 (size!5944 (_keys!6521 thiss!1504))))))

(declare-fun b!238429 () Bool)

(declare-fun c!39770 () Bool)

(assert (=> b!238429 (= c!39770 (and (not (= (bvand (extraKeys!4158 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4158 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!154801 () ListLongMap!3593)

(assert (=> b!238429 (= e!154800 e!154801)))

(declare-fun b!238430 () Bool)

(declare-fun e!154805 () Bool)

(declare-fun get!2889 (ValueCell!2787 V!7995) V!7995)

(declare-fun dynLambda!563 (Int (_ BitVec 64)) V!7995)

(assert (=> b!238430 (= e!154805 (= (apply!220 lt!120564 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000)) (get!2889 (select (arr!5602 (_values!4404 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!563 (defaultEntry!4421 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!238430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5943 (_values!4404 thiss!1504))))))

(assert (=> b!238430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5944 (_keys!6521 thiss!1504))))))

(declare-fun b!238431 () Bool)

(declare-fun e!154806 () Bool)

(declare-fun e!154810 () Bool)

(assert (=> b!238431 (= e!154806 e!154810)))

(declare-fun res!116843 () Bool)

(assert (=> b!238431 (= res!116843 call!22173)))

(assert (=> b!238431 (=> (not res!116843) (not e!154810))))

(declare-fun b!238432 () Bool)

(assert (=> b!238432 (= e!154806 (not call!22173))))

(declare-fun b!238433 () Bool)

(assert (=> b!238433 (= e!154809 e!154805)))

(declare-fun res!116848 () Bool)

(assert (=> b!238433 (=> (not res!116848) (not e!154805))))

(assert (=> b!238433 (= res!116848 (contains!1699 lt!120564 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!238433 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5944 (_keys!6521 thiss!1504))))))

(declare-fun b!238434 () Bool)

(declare-fun e!154802 () Bool)

(assert (=> b!238434 (= e!154803 e!154802)))

(declare-fun res!116847 () Bool)

(assert (=> b!238434 (= res!116847 call!22172)))

(assert (=> b!238434 (=> (not res!116847) (not e!154802))))

(declare-fun b!238435 () Bool)

(declare-fun Unit!7319 () Unit!7316)

(assert (=> b!238435 (= e!154808 Unit!7319)))

(declare-fun d!59751 () Bool)

(assert (=> d!59751 e!154812))

(declare-fun res!116844 () Bool)

(assert (=> d!59751 (=> (not res!116844) (not e!154812))))

(assert (=> d!59751 (= res!116844 (or (bvsge #b00000000000000000000000000000000 (size!5944 (_keys!6521 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5944 (_keys!6521 thiss!1504))))))))

(declare-fun lt!120574 () ListLongMap!3593)

(assert (=> d!59751 (= lt!120564 lt!120574)))

(declare-fun lt!120569 () Unit!7316)

(assert (=> d!59751 (= lt!120569 e!154808)))

(declare-fun c!39767 () Bool)

(declare-fun e!154811 () Bool)

(assert (=> d!59751 (= c!39767 e!154811)))

(declare-fun res!116845 () Bool)

(assert (=> d!59751 (=> (not res!116845) (not e!154811))))

(assert (=> d!59751 (= res!116845 (bvslt #b00000000000000000000000000000000 (size!5944 (_keys!6521 thiss!1504))))))

(declare-fun e!154807 () ListLongMap!3593)

(assert (=> d!59751 (= lt!120574 e!154807)))

(declare-fun c!39769 () Bool)

(assert (=> d!59751 (= c!39769 (and (not (= (bvand (extraKeys!4158 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4158 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59751 (validMask!0 (mask!10452 thiss!1504))))

(assert (=> d!59751 (= (getCurrentListMap!1340 (_keys!6521 thiss!1504) (_values!4404 thiss!1504) (mask!10452 thiss!1504) (extraKeys!4158 thiss!1504) (zeroValue!4262 thiss!1504) (minValue!4262 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4421 thiss!1504)) lt!120564)))

(declare-fun bm!22171 () Bool)

(declare-fun call!22174 () ListLongMap!3593)

(assert (=> bm!22171 (= call!22170 call!22174)))

(declare-fun b!238436 () Bool)

(assert (=> b!238436 (= e!154807 e!154800)))

(declare-fun c!39768 () Bool)

(assert (=> b!238436 (= c!39768 (and (not (= (bvand (extraKeys!4158 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4158 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238437 () Bool)

(assert (=> b!238437 (= e!154810 (= (apply!220 lt!120564 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4262 thiss!1504)))))

(declare-fun b!238438 () Bool)

(assert (=> b!238438 (= e!154807 (+!647 call!22174 (tuple2!4681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4262 thiss!1504))))))

(declare-fun bm!22172 () Bool)

(assert (=> bm!22172 (= call!22175 call!22176)))

(declare-fun b!238439 () Bool)

(declare-fun res!116841 () Bool)

(assert (=> b!238439 (=> (not res!116841) (not e!154812))))

(assert (=> b!238439 (= res!116841 e!154806)))

(declare-fun c!39766 () Bool)

(assert (=> b!238439 (= c!39766 (not (= (bvand (extraKeys!4158 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!238440 () Bool)

(assert (=> b!238440 (= e!154802 (= (apply!220 lt!120564 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4262 thiss!1504)))))

(declare-fun b!238441 () Bool)

(assert (=> b!238441 (= e!154801 call!22170)))

(declare-fun b!238442 () Bool)

(assert (=> b!238442 (= e!154804 (validKeyInArray!0 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238443 () Bool)

(assert (=> b!238443 (= e!154803 (not call!22172))))

(declare-fun bm!22173 () Bool)

(assert (=> bm!22173 (= call!22174 (+!647 (ite c!39769 call!22176 (ite c!39768 call!22175 call!22171)) (ite (or c!39769 c!39768) (tuple2!4681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4262 thiss!1504)) (tuple2!4681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4262 thiss!1504)))))))

(declare-fun b!238444 () Bool)

(assert (=> b!238444 (= e!154801 call!22171)))

(declare-fun b!238445 () Bool)

(assert (=> b!238445 (= e!154811 (validKeyInArray!0 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59751 c!39769) b!238438))

(assert (= (and d!59751 (not c!39769)) b!238436))

(assert (= (and b!238436 c!39768) b!238426))

(assert (= (and b!238436 (not c!39768)) b!238429))

(assert (= (and b!238429 c!39770) b!238441))

(assert (= (and b!238429 (not c!39770)) b!238444))

(assert (= (or b!238441 b!238444) bm!22167))

(assert (= (or b!238426 bm!22167) bm!22172))

(assert (= (or b!238426 b!238441) bm!22171))

(assert (= (or b!238438 bm!22172) bm!22168))

(assert (= (or b!238438 bm!22171) bm!22173))

(assert (= (and d!59751 res!116845) b!238445))

(assert (= (and d!59751 c!39767) b!238425))

(assert (= (and d!59751 (not c!39767)) b!238435))

(assert (= (and d!59751 res!116844) b!238428))

(assert (= (and b!238428 res!116842) b!238442))

(assert (= (and b!238428 (not res!116849)) b!238433))

(assert (= (and b!238433 res!116848) b!238430))

(assert (= (and b!238428 res!116846) b!238439))

(assert (= (and b!238439 c!39766) b!238431))

(assert (= (and b!238439 (not c!39766)) b!238432))

(assert (= (and b!238431 res!116843) b!238437))

(assert (= (or b!238431 b!238432) bm!22169))

(assert (= (and b!238439 res!116841) b!238427))

(assert (= (and b!238427 c!39765) b!238434))

(assert (= (and b!238427 (not c!39765)) b!238443))

(assert (= (and b!238434 res!116847) b!238440))

(assert (= (or b!238434 b!238443) bm!22170))

(declare-fun b_lambda!7975 () Bool)

(assert (=> (not b_lambda!7975) (not b!238430)))

(declare-fun t!8575 () Bool)

(declare-fun tb!2953 () Bool)

(assert (=> (and b!238326 (= (defaultEntry!4421 thiss!1504) (defaultEntry!4421 thiss!1504)) t!8575) tb!2953))

(declare-fun result!5181 () Bool)

(assert (=> tb!2953 (= result!5181 tp_is_empty!6261)))

(assert (=> b!238430 t!8575))

(declare-fun b_and!13367 () Bool)

(assert (= b_and!13363 (and (=> t!8575 result!5181) b_and!13367)))

(declare-fun m!258959 () Bool)

(assert (=> b!238430 m!258959))

(assert (=> b!238430 m!258959))

(declare-fun m!258961 () Bool)

(assert (=> b!238430 m!258961))

(declare-fun m!258963 () Bool)

(assert (=> b!238430 m!258963))

(declare-fun m!258965 () Bool)

(assert (=> b!238430 m!258965))

(assert (=> b!238430 m!258963))

(declare-fun m!258967 () Bool)

(assert (=> b!238430 m!258967))

(assert (=> b!238430 m!258965))

(declare-fun m!258969 () Bool)

(assert (=> bm!22168 m!258969))

(declare-fun m!258971 () Bool)

(assert (=> b!238438 m!258971))

(declare-fun m!258973 () Bool)

(assert (=> bm!22169 m!258973))

(declare-fun m!258975 () Bool)

(assert (=> b!238440 m!258975))

(declare-fun m!258977 () Bool)

(assert (=> bm!22170 m!258977))

(declare-fun m!258979 () Bool)

(assert (=> b!238437 m!258979))

(assert (=> b!238445 m!258959))

(assert (=> b!238445 m!258959))

(declare-fun m!258981 () Bool)

(assert (=> b!238445 m!258981))

(assert (=> b!238442 m!258959))

(assert (=> b!238442 m!258959))

(assert (=> b!238442 m!258981))

(declare-fun m!258983 () Bool)

(assert (=> bm!22173 m!258983))

(assert (=> d!59751 m!258911))

(declare-fun m!258985 () Bool)

(assert (=> b!238425 m!258985))

(declare-fun m!258987 () Bool)

(assert (=> b!238425 m!258987))

(declare-fun m!258989 () Bool)

(assert (=> b!238425 m!258989))

(declare-fun m!258991 () Bool)

(assert (=> b!238425 m!258991))

(declare-fun m!258993 () Bool)

(assert (=> b!238425 m!258993))

(declare-fun m!258995 () Bool)

(assert (=> b!238425 m!258995))

(declare-fun m!258997 () Bool)

(assert (=> b!238425 m!258997))

(declare-fun m!258999 () Bool)

(assert (=> b!238425 m!258999))

(assert (=> b!238425 m!258985))

(declare-fun m!259001 () Bool)

(assert (=> b!238425 m!259001))

(declare-fun m!259003 () Bool)

(assert (=> b!238425 m!259003))

(declare-fun m!259005 () Bool)

(assert (=> b!238425 m!259005))

(assert (=> b!238425 m!258969))

(assert (=> b!238425 m!258999))

(declare-fun m!259007 () Bool)

(assert (=> b!238425 m!259007))

(assert (=> b!238425 m!259003))

(declare-fun m!259009 () Bool)

(assert (=> b!238425 m!259009))

(declare-fun m!259011 () Bool)

(assert (=> b!238425 m!259011))

(assert (=> b!238425 m!258989))

(assert (=> b!238425 m!258959))

(declare-fun m!259013 () Bool)

(assert (=> b!238425 m!259013))

(assert (=> b!238433 m!258959))

(assert (=> b!238433 m!258959))

(declare-fun m!259015 () Bool)

(assert (=> b!238433 m!259015))

(assert (=> b!238332 d!59751))

(declare-fun b!238460 () Bool)

(declare-fun e!154820 () SeekEntryResult!1016)

(declare-fun e!154821 () SeekEntryResult!1016)

(assert (=> b!238460 (= e!154820 e!154821)))

(declare-fun lt!120594 () (_ BitVec 64))

(declare-fun lt!120593 () SeekEntryResult!1016)

(assert (=> b!238460 (= lt!120594 (select (arr!5603 (_keys!6521 thiss!1504)) (index!6236 lt!120593)))))

(declare-fun c!39778 () Bool)

(assert (=> b!238460 (= c!39778 (= lt!120594 key!932))))

(declare-fun b!238461 () Bool)

(declare-fun c!39779 () Bool)

(assert (=> b!238461 (= c!39779 (= lt!120594 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154819 () SeekEntryResult!1016)

(assert (=> b!238461 (= e!154821 e!154819)))

(declare-fun b!238462 () Bool)

(assert (=> b!238462 (= e!154819 (MissingZero!1016 (index!6236 lt!120593)))))

(declare-fun d!59753 () Bool)

(declare-fun lt!120592 () SeekEntryResult!1016)

(assert (=> d!59753 (and (or ((_ is Undefined!1016) lt!120592) (not ((_ is Found!1016) lt!120592)) (and (bvsge (index!6235 lt!120592) #b00000000000000000000000000000000) (bvslt (index!6235 lt!120592) (size!5944 (_keys!6521 thiss!1504))))) (or ((_ is Undefined!1016) lt!120592) ((_ is Found!1016) lt!120592) (not ((_ is MissingZero!1016) lt!120592)) (and (bvsge (index!6234 lt!120592) #b00000000000000000000000000000000) (bvslt (index!6234 lt!120592) (size!5944 (_keys!6521 thiss!1504))))) (or ((_ is Undefined!1016) lt!120592) ((_ is Found!1016) lt!120592) ((_ is MissingZero!1016) lt!120592) (not ((_ is MissingVacant!1016) lt!120592)) (and (bvsge (index!6237 lt!120592) #b00000000000000000000000000000000) (bvslt (index!6237 lt!120592) (size!5944 (_keys!6521 thiss!1504))))) (or ((_ is Undefined!1016) lt!120592) (ite ((_ is Found!1016) lt!120592) (= (select (arr!5603 (_keys!6521 thiss!1504)) (index!6235 lt!120592)) key!932) (ite ((_ is MissingZero!1016) lt!120592) (= (select (arr!5603 (_keys!6521 thiss!1504)) (index!6234 lt!120592)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1016) lt!120592) (= (select (arr!5603 (_keys!6521 thiss!1504)) (index!6237 lt!120592)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59753 (= lt!120592 e!154820)))

(declare-fun c!39777 () Bool)

(assert (=> d!59753 (= c!39777 (and ((_ is Intermediate!1016) lt!120593) (undefined!1828 lt!120593)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11801 (_ BitVec 32)) SeekEntryResult!1016)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59753 (= lt!120593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10452 thiss!1504)) key!932 (_keys!6521 thiss!1504) (mask!10452 thiss!1504)))))

(assert (=> d!59753 (validMask!0 (mask!10452 thiss!1504))))

(assert (=> d!59753 (= (seekEntryOrOpen!0 key!932 (_keys!6521 thiss!1504) (mask!10452 thiss!1504)) lt!120592)))

(declare-fun b!238463 () Bool)

(assert (=> b!238463 (= e!154820 Undefined!1016)))

(declare-fun b!238464 () Bool)

(assert (=> b!238464 (= e!154821 (Found!1016 (index!6236 lt!120593)))))

(declare-fun b!238465 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11801 (_ BitVec 32)) SeekEntryResult!1016)

(assert (=> b!238465 (= e!154819 (seekKeyOrZeroReturnVacant!0 (x!24030 lt!120593) (index!6236 lt!120593) (index!6236 lt!120593) key!932 (_keys!6521 thiss!1504) (mask!10452 thiss!1504)))))

(assert (= (and d!59753 c!39777) b!238463))

(assert (= (and d!59753 (not c!39777)) b!238460))

(assert (= (and b!238460 c!39778) b!238464))

(assert (= (and b!238460 (not c!39778)) b!238461))

(assert (= (and b!238461 c!39779) b!238462))

(assert (= (and b!238461 (not c!39779)) b!238465))

(declare-fun m!259017 () Bool)

(assert (=> b!238460 m!259017))

(assert (=> d!59753 m!258911))

(declare-fun m!259019 () Bool)

(assert (=> d!59753 m!259019))

(declare-fun m!259021 () Bool)

(assert (=> d!59753 m!259021))

(declare-fun m!259023 () Bool)

(assert (=> d!59753 m!259023))

(assert (=> d!59753 m!259019))

(declare-fun m!259025 () Bool)

(assert (=> d!59753 m!259025))

(declare-fun m!259027 () Bool)

(assert (=> d!59753 m!259027))

(declare-fun m!259029 () Bool)

(assert (=> b!238465 m!259029))

(assert (=> b!238336 d!59753))

(declare-fun d!59755 () Bool)

(declare-fun res!116856 () Bool)

(declare-fun e!154824 () Bool)

(assert (=> d!59755 (=> (not res!116856) (not e!154824))))

(declare-fun simpleValid!243 (LongMapFixedSize!3474) Bool)

(assert (=> d!59755 (= res!116856 (simpleValid!243 thiss!1504))))

(assert (=> d!59755 (= (valid!1372 thiss!1504) e!154824)))

(declare-fun b!238472 () Bool)

(declare-fun res!116857 () Bool)

(assert (=> b!238472 (=> (not res!116857) (not e!154824))))

(declare-fun arrayCountValidKeys!0 (array!11801 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!238472 (= res!116857 (= (arrayCountValidKeys!0 (_keys!6521 thiss!1504) #b00000000000000000000000000000000 (size!5944 (_keys!6521 thiss!1504))) (_size!1786 thiss!1504)))))

(declare-fun b!238473 () Bool)

(declare-fun res!116858 () Bool)

(assert (=> b!238473 (=> (not res!116858) (not e!154824))))

(assert (=> b!238473 (= res!116858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6521 thiss!1504) (mask!10452 thiss!1504)))))

(declare-fun b!238474 () Bool)

(assert (=> b!238474 (= e!154824 (arrayNoDuplicates!0 (_keys!6521 thiss!1504) #b00000000000000000000000000000000 Nil!3575))))

(assert (= (and d!59755 res!116856) b!238472))

(assert (= (and b!238472 res!116857) b!238473))

(assert (= (and b!238473 res!116858) b!238474))

(declare-fun m!259031 () Bool)

(assert (=> d!59755 m!259031))

(declare-fun m!259033 () Bool)

(assert (=> b!238472 m!259033))

(assert (=> b!238473 m!258925))

(assert (=> b!238474 m!258907))

(assert (=> start!22876 d!59755))

(declare-fun b!238483 () Bool)

(declare-fun e!154833 () Bool)

(declare-fun call!22179 () Bool)

(assert (=> b!238483 (= e!154833 call!22179)))

(declare-fun b!238484 () Bool)

(declare-fun e!154831 () Bool)

(assert (=> b!238484 (= e!154831 e!154833)))

(declare-fun c!39782 () Bool)

(assert (=> b!238484 (= c!39782 (validKeyInArray!0 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59757 () Bool)

(declare-fun res!116863 () Bool)

(assert (=> d!59757 (=> res!116863 e!154831)))

(assert (=> d!59757 (= res!116863 (bvsge #b00000000000000000000000000000000 (size!5944 (_keys!6521 thiss!1504))))))

(assert (=> d!59757 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6521 thiss!1504) (mask!10452 thiss!1504)) e!154831)))

(declare-fun b!238485 () Bool)

(declare-fun e!154832 () Bool)

(assert (=> b!238485 (= e!154833 e!154832)))

(declare-fun lt!120601 () (_ BitVec 64))

(assert (=> b!238485 (= lt!120601 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120602 () Unit!7316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11801 (_ BitVec 64) (_ BitVec 32)) Unit!7316)

(assert (=> b!238485 (= lt!120602 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6521 thiss!1504) lt!120601 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238485 (arrayContainsKey!0 (_keys!6521 thiss!1504) lt!120601 #b00000000000000000000000000000000)))

(declare-fun lt!120603 () Unit!7316)

(assert (=> b!238485 (= lt!120603 lt!120602)))

(declare-fun res!116864 () Bool)

(assert (=> b!238485 (= res!116864 (= (seekEntryOrOpen!0 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000) (_keys!6521 thiss!1504) (mask!10452 thiss!1504)) (Found!1016 #b00000000000000000000000000000000)))))

(assert (=> b!238485 (=> (not res!116864) (not e!154832))))

(declare-fun b!238486 () Bool)

(assert (=> b!238486 (= e!154832 call!22179)))

(declare-fun bm!22176 () Bool)

(assert (=> bm!22176 (= call!22179 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6521 thiss!1504) (mask!10452 thiss!1504)))))

(assert (= (and d!59757 (not res!116863)) b!238484))

(assert (= (and b!238484 c!39782) b!238485))

(assert (= (and b!238484 (not c!39782)) b!238483))

(assert (= (and b!238485 res!116864) b!238486))

(assert (= (or b!238486 b!238483) bm!22176))

(assert (=> b!238484 m!258959))

(assert (=> b!238484 m!258959))

(assert (=> b!238484 m!258981))

(assert (=> b!238485 m!258959))

(declare-fun m!259035 () Bool)

(assert (=> b!238485 m!259035))

(declare-fun m!259037 () Bool)

(assert (=> b!238485 m!259037))

(assert (=> b!238485 m!258959))

(declare-fun m!259039 () Bool)

(assert (=> b!238485 m!259039))

(declare-fun m!259041 () Bool)

(assert (=> bm!22176 m!259041))

(assert (=> b!238334 d!59757))

(declare-fun d!59759 () Bool)

(declare-fun res!116871 () Bool)

(declare-fun e!154844 () Bool)

(assert (=> d!59759 (=> res!116871 e!154844)))

(assert (=> d!59759 (= res!116871 (bvsge #b00000000000000000000000000000000 (size!5944 (_keys!6521 thiss!1504))))))

(assert (=> d!59759 (= (arrayNoDuplicates!0 (_keys!6521 thiss!1504) #b00000000000000000000000000000000 Nil!3575) e!154844)))

(declare-fun b!238497 () Bool)

(declare-fun e!154843 () Bool)

(declare-fun e!154845 () Bool)

(assert (=> b!238497 (= e!154843 e!154845)))

(declare-fun c!39785 () Bool)

(assert (=> b!238497 (= c!39785 (validKeyInArray!0 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238498 () Bool)

(declare-fun call!22182 () Bool)

(assert (=> b!238498 (= e!154845 call!22182)))

(declare-fun b!238499 () Bool)

(assert (=> b!238499 (= e!154845 call!22182)))

(declare-fun b!238500 () Bool)

(assert (=> b!238500 (= e!154844 e!154843)))

(declare-fun res!116873 () Bool)

(assert (=> b!238500 (=> (not res!116873) (not e!154843))))

(declare-fun e!154842 () Bool)

(assert (=> b!238500 (= res!116873 (not e!154842))))

(declare-fun res!116872 () Bool)

(assert (=> b!238500 (=> (not res!116872) (not e!154842))))

(assert (=> b!238500 (= res!116872 (validKeyInArray!0 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238501 () Bool)

(declare-fun contains!1701 (List!3578 (_ BitVec 64)) Bool)

(assert (=> b!238501 (= e!154842 (contains!1701 Nil!3575 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22179 () Bool)

(assert (=> bm!22179 (= call!22182 (arrayNoDuplicates!0 (_keys!6521 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39785 (Cons!3574 (select (arr!5603 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000) Nil!3575) Nil!3575)))))

(assert (= (and d!59759 (not res!116871)) b!238500))

(assert (= (and b!238500 res!116872) b!238501))

(assert (= (and b!238500 res!116873) b!238497))

(assert (= (and b!238497 c!39785) b!238499))

(assert (= (and b!238497 (not c!39785)) b!238498))

(assert (= (or b!238499 b!238498) bm!22179))

(assert (=> b!238497 m!258959))

(assert (=> b!238497 m!258959))

(assert (=> b!238497 m!258981))

(assert (=> b!238500 m!258959))

(assert (=> b!238500 m!258959))

(assert (=> b!238500 m!258981))

(assert (=> b!238501 m!258959))

(assert (=> b!238501 m!258959))

(declare-fun m!259043 () Bool)

(assert (=> b!238501 m!259043))

(assert (=> bm!22179 m!258959))

(declare-fun m!259045 () Bool)

(assert (=> bm!22179 m!259045))

(assert (=> b!238330 d!59759))

(declare-fun d!59761 () Bool)

(assert (=> d!59761 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!238327 d!59761))

(declare-fun d!59763 () Bool)

(assert (=> d!59763 (= (validMask!0 (mask!10452 thiss!1504)) (and (or (= (mask!10452 thiss!1504) #b00000000000000000000000000000111) (= (mask!10452 thiss!1504) #b00000000000000000000000000001111) (= (mask!10452 thiss!1504) #b00000000000000000000000000011111) (= (mask!10452 thiss!1504) #b00000000000000000000000000111111) (= (mask!10452 thiss!1504) #b00000000000000000000000001111111) (= (mask!10452 thiss!1504) #b00000000000000000000000011111111) (= (mask!10452 thiss!1504) #b00000000000000000000000111111111) (= (mask!10452 thiss!1504) #b00000000000000000000001111111111) (= (mask!10452 thiss!1504) #b00000000000000000000011111111111) (= (mask!10452 thiss!1504) #b00000000000000000000111111111111) (= (mask!10452 thiss!1504) #b00000000000000000001111111111111) (= (mask!10452 thiss!1504) #b00000000000000000011111111111111) (= (mask!10452 thiss!1504) #b00000000000000000111111111111111) (= (mask!10452 thiss!1504) #b00000000000000001111111111111111) (= (mask!10452 thiss!1504) #b00000000000000011111111111111111) (= (mask!10452 thiss!1504) #b00000000000000111111111111111111) (= (mask!10452 thiss!1504) #b00000000000001111111111111111111) (= (mask!10452 thiss!1504) #b00000000000011111111111111111111) (= (mask!10452 thiss!1504) #b00000000000111111111111111111111) (= (mask!10452 thiss!1504) #b00000000001111111111111111111111) (= (mask!10452 thiss!1504) #b00000000011111111111111111111111) (= (mask!10452 thiss!1504) #b00000000111111111111111111111111) (= (mask!10452 thiss!1504) #b00000001111111111111111111111111) (= (mask!10452 thiss!1504) #b00000011111111111111111111111111) (= (mask!10452 thiss!1504) #b00000111111111111111111111111111) (= (mask!10452 thiss!1504) #b00001111111111111111111111111111) (= (mask!10452 thiss!1504) #b00011111111111111111111111111111) (= (mask!10452 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10452 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!238331 d!59763))

(declare-fun d!59765 () Bool)

(assert (=> d!59765 (= (array_inv!3703 (_keys!6521 thiss!1504)) (bvsge (size!5944 (_keys!6521 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238326 d!59765))

(declare-fun d!59767 () Bool)

(assert (=> d!59767 (= (array_inv!3704 (_values!4404 thiss!1504)) (bvsge (size!5943 (_values!4404 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238326 d!59767))

(declare-fun mapNonEmpty!10626 () Bool)

(declare-fun mapRes!10626 () Bool)

(declare-fun tp!22407 () Bool)

(declare-fun e!154851 () Bool)

(assert (=> mapNonEmpty!10626 (= mapRes!10626 (and tp!22407 e!154851))))

(declare-fun mapKey!10626 () (_ BitVec 32))

(declare-fun mapRest!10626 () (Array (_ BitVec 32) ValueCell!2787))

(declare-fun mapValue!10626 () ValueCell!2787)

(assert (=> mapNonEmpty!10626 (= mapRest!10620 (store mapRest!10626 mapKey!10626 mapValue!10626))))

(declare-fun b!238509 () Bool)

(declare-fun e!154850 () Bool)

(assert (=> b!238509 (= e!154850 tp_is_empty!6261)))

(declare-fun b!238508 () Bool)

(assert (=> b!238508 (= e!154851 tp_is_empty!6261)))

(declare-fun mapIsEmpty!10626 () Bool)

(assert (=> mapIsEmpty!10626 mapRes!10626))

(declare-fun condMapEmpty!10626 () Bool)

(declare-fun mapDefault!10626 () ValueCell!2787)

(assert (=> mapNonEmpty!10620 (= condMapEmpty!10626 (= mapRest!10620 ((as const (Array (_ BitVec 32) ValueCell!2787)) mapDefault!10626)))))

(assert (=> mapNonEmpty!10620 (= tp!22397 (and e!154850 mapRes!10626))))

(assert (= (and mapNonEmpty!10620 condMapEmpty!10626) mapIsEmpty!10626))

(assert (= (and mapNonEmpty!10620 (not condMapEmpty!10626)) mapNonEmpty!10626))

(assert (= (and mapNonEmpty!10626 ((_ is ValueCellFull!2787) mapValue!10626)) b!238508))

(assert (= (and mapNonEmpty!10620 ((_ is ValueCellFull!2787) mapDefault!10626)) b!238509))

(declare-fun m!259047 () Bool)

(assert (=> mapNonEmpty!10626 m!259047))

(declare-fun b_lambda!7977 () Bool)

(assert (= b_lambda!7975 (or (and b!238326 b_free!6399) b_lambda!7977)))

(check-sat (not b!238472) (not b!238437) tp_is_empty!6261 (not b!238497) (not b!238501) (not bm!22179) (not b!238425) (not bm!22168) (not b!238442) (not d!59753) (not b!238500) (not b_lambda!7977) (not b_next!6399) (not b!238380) (not bm!22176) (not b!238445) (not b!238440) (not b!238484) (not d!59749) (not b!238430) (not b!238465) (not b!238433) b_and!13367 (not d!59755) (not b!238382) (not bm!22170) (not b!238474) (not bm!22173) (not b!238438) (not d!59751) (not mapNonEmpty!10626) (not b!238485) (not bm!22169) (not b!238473))
(check-sat b_and!13367 (not b_next!6399))
