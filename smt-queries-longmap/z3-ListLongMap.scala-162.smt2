; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3044 () Bool)

(assert start!3044)

(declare-fun b!18219 () Bool)

(declare-fun b_free!651 () Bool)

(declare-fun b_next!651 () Bool)

(assert (=> b!18219 (= b_free!651 (not b_next!651))))

(declare-fun tp!3144 () Bool)

(declare-fun b_and!1299 () Bool)

(assert (=> b!18219 (= tp!3144 b_and!1299)))

(declare-fun bm!622 () Bool)

(declare-datatypes ((V!1045 0))(
  ( (V!1046 (val!484 Int)) )
))
(declare-datatypes ((tuple2!790 0))(
  ( (tuple2!791 (_1!396 (_ BitVec 64)) (_2!396 V!1045)) )
))
(declare-datatypes ((List!539 0))(
  ( (Nil!536) (Cons!535 (h!1101 tuple2!790) (t!3178 List!539)) )
))
(declare-datatypes ((ListLongMap!537 0))(
  ( (ListLongMap!538 (toList!284 List!539)) )
))
(declare-fun call!625 () ListLongMap!537)

(declare-datatypes ((ValueCell!258 0))(
  ( (ValueCellFull!258 (v!1472 V!1045)) (EmptyCell!258) )
))
(declare-datatypes ((array!1035 0))(
  ( (array!1036 (arr!499 (Array (_ BitVec 32) ValueCell!258)) (size!589 (_ BitVec 32))) )
))
(declare-datatypes ((array!1037 0))(
  ( (array!1038 (arr!500 (Array (_ BitVec 32) (_ BitVec 64))) (size!590 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!102 0))(
  ( (LongMapFixedSize!103 (defaultEntry!1662 Int) (mask!4595 (_ BitVec 32)) (extraKeys!1575 (_ BitVec 32)) (zeroValue!1598 V!1045) (minValue!1598 V!1045) (_size!83 (_ BitVec 32)) (_keys!3087 array!1037) (_values!1659 array!1035) (_vacant!83 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!102 0))(
  ( (Cell!103 (v!1473 LongMapFixedSize!102)) )
))
(declare-datatypes ((LongMap!102 0))(
  ( (LongMap!103 (underlying!62 Cell!102)) )
))
(declare-fun thiss!848 () LongMap!102)

(declare-fun map!354 (LongMap!102) ListLongMap!537)

(assert (=> bm!622 (= call!625 (map!354 thiss!848))))

(declare-fun mapNonEmpty!807 () Bool)

(declare-fun mapRes!807 () Bool)

(declare-fun tp!3143 () Bool)

(declare-fun e!11698 () Bool)

(assert (=> mapNonEmpty!807 (= mapRes!807 (and tp!3143 e!11698))))

(declare-fun mapRest!807 () (Array (_ BitVec 32) ValueCell!258))

(declare-fun mapValue!807 () ValueCell!258)

(declare-fun mapKey!807 () (_ BitVec 32))

(assert (=> mapNonEmpty!807 (= (arr!499 (_values!1659 (v!1473 (underlying!62 thiss!848)))) (store mapRest!807 mapKey!807 mapValue!807))))

(declare-fun b!18218 () Bool)

(declare-datatypes ((tuple2!792 0))(
  ( (tuple2!793 (_1!397 Bool) (_2!397 LongMap!102)) )
))
(declare-fun e!11695 () tuple2!792)

(assert (=> b!18218 (= e!11695 (tuple2!793 true thiss!848))))

(declare-fun e!11694 () Bool)

(declare-fun tp_is_empty!915 () Bool)

(declare-fun e!11699 () Bool)

(declare-fun array_inv!343 (array!1037) Bool)

(declare-fun array_inv!344 (array!1035) Bool)

(assert (=> b!18219 (= e!11694 (and tp!3144 tp_is_empty!915 (array_inv!343 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) (array_inv!344 (_values!1659 (v!1473 (underlying!62 thiss!848)))) e!11699))))

(declare-fun mapIsEmpty!807 () Bool)

(assert (=> mapIsEmpty!807 mapRes!807))

(declare-fun b!18220 () Bool)

(assert (=> b!18220 (= e!11698 tp_is_empty!915)))

(declare-fun b!18221 () Bool)

(declare-fun e!11697 () Bool)

(assert (=> b!18221 (= e!11697 tp_is_empty!915)))

(declare-fun bm!623 () Bool)

(declare-fun call!626 () ListLongMap!537)

(declare-fun lt!4707 () LongMap!102)

(assert (=> bm!623 (= call!626 (map!354 lt!4707))))

(declare-fun b!18223 () Bool)

(assert (=> b!18223 (= e!11699 (and e!11697 mapRes!807))))

(declare-fun condMapEmpty!807 () Bool)

(declare-fun mapDefault!807 () ValueCell!258)

(assert (=> b!18223 (= condMapEmpty!807 (= (arr!499 (_values!1659 (v!1473 (underlying!62 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!258)) mapDefault!807)))))

(declare-fun b!18224 () Bool)

(declare-fun e!11703 () Bool)

(assert (=> b!18224 (= e!11703 e!11694)))

(declare-fun b!18225 () Bool)

(declare-fun e!11696 () Bool)

(assert (=> b!18225 (= e!11696 (not (= call!626 call!625)))))

(declare-fun b!18226 () Bool)

(declare-fun e!11692 () Bool)

(assert (=> b!18226 (= e!11692 e!11696)))

(declare-fun c!1831 () Bool)

(declare-datatypes ((tuple2!794 0))(
  ( (tuple2!795 (_1!398 Bool) (_2!398 LongMapFixedSize!102)) )
))
(declare-fun lt!4708 () tuple2!794)

(assert (=> b!18226 (= c!1831 (_1!398 lt!4708))))

(declare-fun res!12759 () Bool)

(declare-fun e!11700 () Bool)

(assert (=> start!3044 (=> (not res!12759) (not e!11700))))

(declare-fun valid!47 (LongMap!102) Bool)

(assert (=> start!3044 (= res!12759 (valid!47 thiss!848))))

(assert (=> start!3044 e!11700))

(declare-fun e!11693 () Bool)

(assert (=> start!3044 e!11693))

(assert (=> start!3044 true))

(assert (=> start!3044 tp_is_empty!915))

(declare-fun b!18222 () Bool)

(declare-fun e!11701 () Bool)

(assert (=> b!18222 (= e!11700 e!11701)))

(declare-fun res!12760 () Bool)

(assert (=> b!18222 (=> (not res!12760) (not e!11701))))

(declare-fun lt!4705 () tuple2!792)

(assert (=> b!18222 (= res!12760 (_1!397 lt!4705))))

(assert (=> b!18222 (= lt!4705 e!11695)))

(declare-fun c!1830 () Bool)

(declare-fun imbalanced!28 (LongMap!102) Bool)

(assert (=> b!18222 (= c!1830 (imbalanced!28 thiss!848))))

(declare-fun b!18227 () Bool)

(assert (=> b!18227 (= e!11701 e!11692)))

(declare-fun res!12758 () Bool)

(assert (=> b!18227 (=> res!12758 e!11692)))

(assert (=> b!18227 (= res!12758 (not (valid!47 lt!4707)))))

(assert (=> b!18227 (= lt!4707 (LongMap!103 (Cell!103 (_2!398 lt!4708))))))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun v!259 () V!1045)

(declare-fun update!12 (LongMapFixedSize!102 (_ BitVec 64) V!1045) tuple2!794)

(assert (=> b!18227 (= lt!4708 (update!12 (v!1473 (underlying!62 (_2!397 lt!4705))) key!682 v!259))))

(declare-fun b!18228 () Bool)

(assert (=> b!18228 (= e!11693 e!11703)))

(declare-fun b!18229 () Bool)

(declare-fun repack!23 (LongMap!102) tuple2!792)

(assert (=> b!18229 (= e!11695 (repack!23 thiss!848))))

(declare-fun lt!4706 () ListLongMap!537)

(declare-fun e!11704 () Bool)

(declare-fun b!18230 () Bool)

(declare-fun +!36 (ListLongMap!537 tuple2!790) ListLongMap!537)

(assert (=> b!18230 (= e!11704 (not (= lt!4706 (+!36 call!625 (tuple2!791 key!682 v!259)))))))

(declare-fun b!18231 () Bool)

(assert (=> b!18231 (= e!11696 e!11704)))

(assert (=> b!18231 (= lt!4706 call!626)))

(declare-fun res!12757 () Bool)

(declare-fun contains!216 (ListLongMap!537 (_ BitVec 64)) Bool)

(assert (=> b!18231 (= res!12757 (not (contains!216 lt!4706 key!682)))))

(assert (=> b!18231 (=> res!12757 e!11704)))

(assert (= (and start!3044 res!12759) b!18222))

(assert (= (and b!18222 c!1830) b!18229))

(assert (= (and b!18222 (not c!1830)) b!18218))

(assert (= (and b!18222 res!12760) b!18227))

(assert (= (and b!18227 (not res!12758)) b!18226))

(assert (= (and b!18226 c!1831) b!18231))

(assert (= (and b!18226 (not c!1831)) b!18225))

(assert (= (and b!18231 (not res!12757)) b!18230))

(assert (= (or b!18230 b!18225) bm!622))

(assert (= (or b!18231 b!18225) bm!623))

(assert (= (and b!18223 condMapEmpty!807) mapIsEmpty!807))

(assert (= (and b!18223 (not condMapEmpty!807)) mapNonEmpty!807))

(get-info :version)

(assert (= (and mapNonEmpty!807 ((_ is ValueCellFull!258) mapValue!807)) b!18220))

(assert (= (and b!18223 ((_ is ValueCellFull!258) mapDefault!807)) b!18221))

(assert (= b!18219 b!18223))

(assert (= b!18224 b!18219))

(assert (= b!18228 b!18224))

(assert (= start!3044 b!18228))

(declare-fun m!12663 () Bool)

(assert (=> b!18231 m!12663))

(declare-fun m!12665 () Bool)

(assert (=> mapNonEmpty!807 m!12665))

(declare-fun m!12667 () Bool)

(assert (=> b!18229 m!12667))

(declare-fun m!12669 () Bool)

(assert (=> b!18219 m!12669))

(declare-fun m!12671 () Bool)

(assert (=> b!18219 m!12671))

(declare-fun m!12673 () Bool)

(assert (=> b!18230 m!12673))

(declare-fun m!12675 () Bool)

(assert (=> bm!623 m!12675))

(declare-fun m!12677 () Bool)

(assert (=> b!18227 m!12677))

(declare-fun m!12679 () Bool)

(assert (=> b!18227 m!12679))

(declare-fun m!12681 () Bool)

(assert (=> start!3044 m!12681))

(declare-fun m!12683 () Bool)

(assert (=> b!18222 m!12683))

(declare-fun m!12685 () Bool)

(assert (=> bm!622 m!12685))

(check-sat (not b!18230) tp_is_empty!915 (not b!18227) (not start!3044) (not bm!623) (not b_next!651) (not mapNonEmpty!807) (not b!18222) (not bm!622) (not b!18231) (not b!18229) (not b!18219) b_and!1299)
(check-sat b_and!1299 (not b_next!651))
(get-model)

(declare-fun d!3421 () Bool)

(declare-fun e!11746 () Bool)

(assert (=> d!3421 e!11746))

(declare-fun res!12778 () Bool)

(assert (=> d!3421 (=> (not res!12778) (not e!11746))))

(declare-fun lt!4731 () ListLongMap!537)

(assert (=> d!3421 (= res!12778 (contains!216 lt!4731 (_1!396 (tuple2!791 key!682 v!259))))))

(declare-fun lt!4729 () List!539)

(assert (=> d!3421 (= lt!4731 (ListLongMap!538 lt!4729))))

(declare-datatypes ((Unit!352 0))(
  ( (Unit!353) )
))
(declare-fun lt!4732 () Unit!352)

(declare-fun lt!4730 () Unit!352)

(assert (=> d!3421 (= lt!4732 lt!4730)))

(declare-datatypes ((Option!65 0))(
  ( (Some!64 (v!1480 V!1045)) (None!63) )
))
(declare-fun getValueByKey!59 (List!539 (_ BitVec 64)) Option!65)

(assert (=> d!3421 (= (getValueByKey!59 lt!4729 (_1!396 (tuple2!791 key!682 v!259))) (Some!64 (_2!396 (tuple2!791 key!682 v!259))))))

(declare-fun lemmaContainsTupThenGetReturnValue!16 (List!539 (_ BitVec 64) V!1045) Unit!352)

(assert (=> d!3421 (= lt!4730 (lemmaContainsTupThenGetReturnValue!16 lt!4729 (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259))))))

(declare-fun insertStrictlySorted!16 (List!539 (_ BitVec 64) V!1045) List!539)

(assert (=> d!3421 (= lt!4729 (insertStrictlySorted!16 (toList!284 call!625) (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259))))))

(assert (=> d!3421 (= (+!36 call!625 (tuple2!791 key!682 v!259)) lt!4731)))

(declare-fun b!18278 () Bool)

(declare-fun res!12777 () Bool)

(assert (=> b!18278 (=> (not res!12777) (not e!11746))))

(assert (=> b!18278 (= res!12777 (= (getValueByKey!59 (toList!284 lt!4731) (_1!396 (tuple2!791 key!682 v!259))) (Some!64 (_2!396 (tuple2!791 key!682 v!259)))))))

(declare-fun b!18279 () Bool)

(declare-fun contains!217 (List!539 tuple2!790) Bool)

(assert (=> b!18279 (= e!11746 (contains!217 (toList!284 lt!4731) (tuple2!791 key!682 v!259)))))

(assert (= (and d!3421 res!12778) b!18278))

(assert (= (and b!18278 res!12777) b!18279))

(declare-fun m!12711 () Bool)

(assert (=> d!3421 m!12711))

(declare-fun m!12713 () Bool)

(assert (=> d!3421 m!12713))

(declare-fun m!12715 () Bool)

(assert (=> d!3421 m!12715))

(declare-fun m!12717 () Bool)

(assert (=> d!3421 m!12717))

(declare-fun m!12719 () Bool)

(assert (=> b!18278 m!12719))

(declare-fun m!12721 () Bool)

(assert (=> b!18279 m!12721))

(assert (=> b!18230 d!3421))

(declare-fun d!3423 () Bool)

(declare-fun map!356 (LongMapFixedSize!102) ListLongMap!537)

(assert (=> d!3423 (= (map!354 thiss!848) (map!356 (v!1473 (underlying!62 thiss!848))))))

(declare-fun bs!840 () Bool)

(assert (= bs!840 d!3423))

(declare-fun m!12723 () Bool)

(assert (=> bs!840 m!12723))

(assert (=> bm!622 d!3423))

(declare-fun d!3425 () Bool)

(declare-fun valid!49 (LongMapFixedSize!102) Bool)

(assert (=> d!3425 (= (valid!47 thiss!848) (valid!49 (v!1473 (underlying!62 thiss!848))))))

(declare-fun bs!841 () Bool)

(assert (= bs!841 d!3425))

(declare-fun m!12725 () Bool)

(assert (=> bs!841 m!12725))

(assert (=> start!3044 d!3425))

(declare-fun d!3427 () Bool)

(declare-fun e!11751 () Bool)

(assert (=> d!3427 e!11751))

(declare-fun res!12781 () Bool)

(assert (=> d!3427 (=> res!12781 e!11751)))

(declare-fun lt!4742 () Bool)

(assert (=> d!3427 (= res!12781 (not lt!4742))))

(declare-fun lt!4743 () Bool)

(assert (=> d!3427 (= lt!4742 lt!4743)))

(declare-fun lt!4744 () Unit!352)

(declare-fun e!11752 () Unit!352)

(assert (=> d!3427 (= lt!4744 e!11752)))

(declare-fun c!1840 () Bool)

(assert (=> d!3427 (= c!1840 lt!4743)))

(declare-fun containsKey!23 (List!539 (_ BitVec 64)) Bool)

(assert (=> d!3427 (= lt!4743 (containsKey!23 (toList!284 lt!4706) key!682))))

(assert (=> d!3427 (= (contains!216 lt!4706 key!682) lt!4742)))

(declare-fun b!18286 () Bool)

(declare-fun lt!4741 () Unit!352)

(assert (=> b!18286 (= e!11752 lt!4741)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!20 (List!539 (_ BitVec 64)) Unit!352)

(assert (=> b!18286 (= lt!4741 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!284 lt!4706) key!682))))

(declare-fun isDefined!21 (Option!65) Bool)

(assert (=> b!18286 (isDefined!21 (getValueByKey!59 (toList!284 lt!4706) key!682))))

(declare-fun b!18287 () Bool)

(declare-fun Unit!354 () Unit!352)

(assert (=> b!18287 (= e!11752 Unit!354)))

(declare-fun b!18288 () Bool)

(assert (=> b!18288 (= e!11751 (isDefined!21 (getValueByKey!59 (toList!284 lt!4706) key!682)))))

(assert (= (and d!3427 c!1840) b!18286))

(assert (= (and d!3427 (not c!1840)) b!18287))

(assert (= (and d!3427 (not res!12781)) b!18288))

(declare-fun m!12727 () Bool)

(assert (=> d!3427 m!12727))

(declare-fun m!12729 () Bool)

(assert (=> b!18286 m!12729))

(declare-fun m!12731 () Bool)

(assert (=> b!18286 m!12731))

(assert (=> b!18286 m!12731))

(declare-fun m!12733 () Bool)

(assert (=> b!18286 m!12733))

(assert (=> b!18288 m!12731))

(assert (=> b!18288 m!12731))

(assert (=> b!18288 m!12733))

(assert (=> b!18231 d!3427))

(declare-fun d!3429 () Bool)

(assert (=> d!3429 (= (map!354 lt!4707) (map!356 (v!1473 (underlying!62 lt!4707))))))

(declare-fun bs!842 () Bool)

(assert (= bs!842 d!3429))

(declare-fun m!12735 () Bool)

(assert (=> bs!842 m!12735))

(assert (=> bm!623 d!3429))

(declare-fun d!3431 () Bool)

(assert (=> d!3431 (= (valid!47 lt!4707) (valid!49 (v!1473 (underlying!62 lt!4707))))))

(declare-fun bs!843 () Bool)

(assert (= bs!843 d!3431))

(declare-fun m!12737 () Bool)

(assert (=> bs!843 m!12737))

(assert (=> b!18227 d!3431))

(declare-fun bm!678 () Bool)

(declare-fun call!698 () Bool)

(declare-fun call!681 () Bool)

(assert (=> bm!678 (= call!698 call!681)))

(declare-fun bm!679 () Bool)

(declare-fun call!685 () ListLongMap!537)

(declare-fun lt!4806 () tuple2!794)

(assert (=> bm!679 (= call!685 (map!356 (_2!398 lt!4806)))))

(declare-fun bm!680 () Bool)

(declare-datatypes ((SeekEntryResult!43 0))(
  ( (MissingZero!43 (index!2291 (_ BitVec 32))) (Found!43 (index!2292 (_ BitVec 32))) (Intermediate!43 (undefined!855 Bool) (index!2293 (_ BitVec 32)) (x!4488 (_ BitVec 32))) (Undefined!43) (MissingVacant!43 (index!2294 (_ BitVec 32))) )
))
(declare-fun call!700 () SeekEntryResult!43)

(declare-fun call!684 () SeekEntryResult!43)

(assert (=> bm!680 (= call!700 call!684)))

(declare-fun b!18365 () Bool)

(declare-fun e!11808 () Bool)

(declare-fun call!689 () Bool)

(assert (=> b!18365 (= e!11808 (not call!689))))

(declare-fun b!18366 () Bool)

(declare-fun res!12822 () Bool)

(declare-fun lt!4813 () SeekEntryResult!43)

(assert (=> b!18366 (= res!12822 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2294 lt!4813)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11796 () Bool)

(assert (=> b!18366 (=> (not res!12822) (not e!11796))))

(declare-fun b!18367 () Bool)

(declare-fun lt!4824 () Unit!352)

(declare-fun lt!4800 () Unit!352)

(assert (=> b!18367 (= lt!4824 lt!4800)))

(declare-fun call!696 () ListLongMap!537)

(declare-fun lt!4805 () SeekEntryResult!43)

(assert (=> b!18367 (contains!216 call!696 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805)))))

(declare-fun lt!4811 () array!1035)

(declare-fun lemmaValidKeyInArrayIsInListMap!2 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 32) Int) Unit!352)

(assert (=> b!18367 (= lt!4800 (lemmaValidKeyInArrayIsInListMap!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (index!2292 lt!4805) (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> b!18367 (= lt!4811 (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun lt!4808 () Unit!352)

(declare-fun lt!4815 () Unit!352)

(assert (=> b!18367 (= lt!4808 lt!4815)))

(declare-fun call!695 () ListLongMap!537)

(declare-fun getCurrentListMap!121 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 32) Int) ListLongMap!537)

(assert (=> b!18367 (= call!695 (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 32) (_ BitVec 64) V!1045 Int) Unit!352)

(assert (=> b!18367 (= lt!4815 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (index!2292 lt!4805) key!682 v!259 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!4819 () Unit!352)

(declare-fun e!11812 () Unit!352)

(assert (=> b!18367 (= lt!4819 e!11812)))

(declare-fun c!1872 () Bool)

(declare-fun call!694 () Bool)

(assert (=> b!18367 (= c!1872 call!694)))

(declare-fun e!11802 () tuple2!794)

(assert (=> b!18367 (= e!11802 (tuple2!795 true (LongMapFixedSize!103 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_size!83 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (_vacant!83 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18368 () Bool)

(declare-fun e!11803 () tuple2!794)

(declare-fun lt!4816 () tuple2!794)

(assert (=> b!18368 (= e!11803 (tuple2!795 (_1!398 lt!4816) (_2!398 lt!4816)))))

(declare-fun call!688 () tuple2!794)

(assert (=> b!18368 (= lt!4816 call!688)))

(declare-fun b!18369 () Bool)

(declare-fun c!1867 () Bool)

(declare-fun lt!4818 () SeekEntryResult!43)

(assert (=> b!18369 (= c!1867 ((_ is MissingVacant!43) lt!4818))))

(declare-fun e!11801 () Bool)

(declare-fun e!11806 () Bool)

(assert (=> b!18369 (= e!11801 e!11806)))

(declare-fun c!1876 () Bool)

(declare-fun call!691 () Bool)

(declare-fun c!1866 () Bool)

(declare-fun lt!4823 () SeekEntryResult!43)

(declare-fun c!1871 () Bool)

(declare-fun c!1873 () Bool)

(declare-fun bm!681 () Bool)

(declare-fun lt!4812 () SeekEntryResult!43)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!681 (= call!691 (inRange!0 (ite c!1866 (ite c!1871 (index!2292 lt!4812) (ite c!1873 (index!2291 lt!4818) (index!2294 lt!4818))) (ite c!1872 (index!2292 lt!4823) (ite c!1876 (index!2291 lt!4813) (index!2294 lt!4813)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun bm!682 () Bool)

(declare-fun call!690 () Bool)

(assert (=> bm!682 (= call!690 call!691)))

(declare-fun c!1869 () Bool)

(declare-fun lt!4825 () (_ BitVec 32))

(declare-fun bm!683 () Bool)

(declare-fun c!1874 () Bool)

(assert (=> bm!683 (= call!696 (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun call!697 () ListLongMap!537)

(declare-fun b!18370 () Bool)

(declare-fun e!11797 () Bool)

(assert (=> b!18370 (= e!11797 (= call!685 (+!36 call!697 (tuple2!791 key!682 v!259))))))

(declare-fun b!18371 () Bool)

(declare-fun res!12819 () Bool)

(assert (=> b!18371 (= res!12819 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2294 lt!4818)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18371 (=> (not res!12819) (not e!11808))))

(declare-fun b!18372 () Bool)

(declare-fun res!12812 () Bool)

(declare-fun e!11799 () Bool)

(assert (=> b!18372 (=> (not res!12812) (not e!11799))))

(assert (=> b!18372 (= res!12812 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2291 lt!4818)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18373 () Bool)

(declare-fun e!11810 () Bool)

(assert (=> b!18373 (= e!11810 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4823)) key!682))))

(declare-fun bm!684 () Bool)

(declare-fun call!693 () ListLongMap!537)

(assert (=> bm!684 (= call!693 call!695)))

(declare-fun b!18374 () Bool)

(assert (=> b!18374 (= e!11803 e!11802)))

(declare-fun c!1868 () Bool)

(assert (=> b!18374 (= c!1868 ((_ is MissingZero!43) lt!4805))))

(declare-fun bm!685 () Bool)

(declare-fun call!704 () Unit!352)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 64) Int) Unit!352)

(assert (=> bm!685 (= call!704 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18375 () Bool)

(declare-fun lt!4820 () tuple2!794)

(assert (=> b!18375 (= lt!4820 call!688)))

(assert (=> b!18375 (= e!11802 (tuple2!795 (_1!398 lt!4820) (_2!398 lt!4820)))))

(declare-fun b!18376 () Bool)

(declare-fun e!11807 () Bool)

(assert (=> b!18376 (= e!11807 e!11796)))

(declare-fun res!12818 () Bool)

(assert (=> b!18376 (= res!12818 call!698)))

(assert (=> b!18376 (=> (not res!12818) (not e!11796))))

(declare-fun b!18377 () Bool)

(declare-fun e!11798 () Unit!352)

(declare-fun lt!4814 () Unit!352)

(assert (=> b!18377 (= e!11798 lt!4814)))

(assert (=> b!18377 (= lt!4814 call!704)))

(assert (=> b!18377 (= lt!4818 call!700)))

(assert (=> b!18377 (= c!1873 ((_ is MissingZero!43) lt!4818))))

(assert (=> b!18377 e!11801))

(declare-fun b!18378 () Bool)

(declare-fun Unit!355 () Unit!352)

(assert (=> b!18378 (= e!11812 Unit!355)))

(declare-fun lt!4799 () Unit!352)

(assert (=> b!18378 (= lt!4799 call!704)))

(declare-fun call!692 () SeekEntryResult!43)

(assert (=> b!18378 (= lt!4813 call!692)))

(assert (=> b!18378 (= c!1876 ((_ is MissingZero!43) lt!4813))))

(declare-fun e!11800 () Bool)

(assert (=> b!18378 e!11800))

(declare-fun lt!4802 () Unit!352)

(assert (=> b!18378 (= lt!4802 lt!4799)))

(assert (=> b!18378 false))

(declare-fun bm!686 () Bool)

(assert (=> bm!686 (= call!681 call!691)))

(declare-fun b!18379 () Bool)

(declare-fun res!12823 () Bool)

(assert (=> b!18379 (= res!12823 call!690)))

(declare-fun e!11809 () Bool)

(assert (=> b!18379 (=> (not res!12823) (not e!11809))))

(declare-fun bm!687 () Bool)

(declare-fun call!701 () Bool)

(assert (=> bm!687 (= call!701 call!690)))

(declare-fun bm!688 () Bool)

(declare-fun call!699 () Bool)

(assert (=> bm!688 (= call!689 call!699)))

(declare-fun b!18380 () Bool)

(assert (=> b!18380 (= e!11807 ((_ is Undefined!43) lt!4813))))

(declare-fun b!18381 () Bool)

(declare-fun lt!4804 () Unit!352)

(declare-fun lt!4822 () Unit!352)

(assert (=> b!18381 (= lt!4804 lt!4822)))

(declare-fun call!683 () ListLongMap!537)

(assert (=> b!18381 (= call!693 call!683)))

(declare-fun lt!4807 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!2 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 V!1045 Int) Unit!352)

(assert (=> b!18381 (= lt!4822 (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4807 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> b!18381 (= lt!4807 (bvor (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000001))))

(declare-fun e!11795 () tuple2!794)

(assert (=> b!18381 (= e!11795 (tuple2!795 true (LongMapFixedSize!103 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (bvor (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000001) v!259 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_size!83 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_vacant!83 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun call!702 () ListLongMap!537)

(declare-fun bm!689 () Bool)

(assert (=> bm!689 (= call!702 (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18382 () Bool)

(declare-fun call!686 () Bool)

(assert (=> b!18382 (= e!11796 (not call!686))))

(declare-fun b!18383 () Bool)

(assert (=> b!18383 (= e!11799 (not call!689))))

(declare-fun call!687 () ListLongMap!537)

(declare-fun call!703 () ListLongMap!537)

(declare-fun bm!690 () Bool)

(assert (=> bm!690 (= call!695 (+!36 (ite c!1869 (ite c!1874 call!703 call!683) call!687) (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259))))))

(declare-fun b!18384 () Bool)

(declare-fun c!1865 () Bool)

(assert (=> b!18384 (= c!1865 ((_ is MissingVacant!43) lt!4805))))

(declare-fun e!11793 () tuple2!794)

(assert (=> b!18384 (= e!11793 e!11803)))

(declare-fun bm!691 () Bool)

(assert (=> bm!691 (= call!697 (map!356 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(declare-fun bm!692 () Bool)

(declare-fun call!682 () Unit!352)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 64) Int) Unit!352)

(assert (=> bm!692 (= call!682 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun d!3433 () Bool)

(declare-fun e!11805 () Bool)

(assert (=> d!3433 e!11805))

(declare-fun res!12820 () Bool)

(assert (=> d!3433 (=> (not res!12820) (not e!11805))))

(assert (=> d!3433 (= res!12820 (valid!49 (_2!398 lt!4806)))))

(declare-fun e!11811 () tuple2!794)

(assert (=> d!3433 (= lt!4806 e!11811)))

(assert (=> d!3433 (= c!1869 (= key!682 (bvneg key!682)))))

(assert (=> d!3433 (valid!49 (v!1473 (underlying!62 (_2!397 lt!4705))))))

(assert (=> d!3433 (= (update!12 (v!1473 (underlying!62 (_2!397 lt!4705))) key!682 v!259) lt!4806)))

(declare-fun b!18385 () Bool)

(declare-fun Unit!356 () Unit!352)

(assert (=> b!18385 (= e!11798 Unit!356)))

(declare-fun lt!4821 () Unit!352)

(assert (=> b!18385 (= lt!4821 call!682)))

(assert (=> b!18385 (= lt!4812 call!700)))

(declare-fun res!12821 () Bool)

(assert (=> b!18385 (= res!12821 ((_ is Found!43) lt!4812))))

(assert (=> b!18385 (=> (not res!12821) (not e!11809))))

(assert (=> b!18385 e!11809))

(declare-fun lt!4809 () Unit!352)

(assert (=> b!18385 (= lt!4809 lt!4821)))

(assert (=> b!18385 false))

(declare-fun b!18386 () Bool)

(declare-fun res!12810 () Bool)

(declare-fun e!11794 () Bool)

(assert (=> b!18386 (=> (not res!12810) (not e!11794))))

(assert (=> b!18386 (= res!12810 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2291 lt!4813)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18387 () Bool)

(declare-fun lt!4801 () Unit!352)

(assert (=> b!18387 (= e!11812 lt!4801)))

(assert (=> b!18387 (= lt!4801 call!682)))

(assert (=> b!18387 (= lt!4823 call!692)))

(declare-fun res!12813 () Bool)

(assert (=> b!18387 (= res!12813 ((_ is Found!43) lt!4823))))

(assert (=> b!18387 (=> (not res!12813) (not e!11810))))

(assert (=> b!18387 e!11810))

(declare-fun bm!693 () Bool)

(assert (=> bm!693 (= call!683 call!702)))

(declare-fun b!18388 () Bool)

(declare-fun e!11804 () Bool)

(assert (=> b!18388 (= e!11805 e!11804)))

(declare-fun c!1875 () Bool)

(assert (=> b!18388 (= c!1875 (_1!398 lt!4806))))

(declare-fun b!18389 () Bool)

(declare-fun res!12811 () Bool)

(assert (=> b!18389 (=> (not res!12811) (not e!11794))))

(assert (=> b!18389 (= res!12811 call!698)))

(assert (=> b!18389 (= e!11800 e!11794)))

(declare-fun b!18390 () Bool)

(declare-fun res!12814 () Bool)

(assert (=> b!18390 (=> (not res!12814) (not e!11799))))

(assert (=> b!18390 (= res!12814 call!701)))

(assert (=> b!18390 (= e!11801 e!11799)))

(declare-fun b!18391 () Bool)

(assert (=> b!18391 (= e!11806 ((_ is Undefined!43) lt!4818))))

(declare-fun bm!694 () Bool)

(declare-fun updateHelperNewKey!2 (LongMapFixedSize!102 (_ BitVec 64) V!1045 (_ BitVec 32)) tuple2!794)

(assert (=> bm!694 (= call!688 (updateHelperNewKey!2 (v!1473 (underlying!62 (_2!397 lt!4705))) key!682 v!259 (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805))))))

(declare-fun b!18392 () Bool)

(assert (=> b!18392 (= e!11804 e!11797)))

(declare-fun res!12817 () Bool)

(assert (=> b!18392 (= res!12817 (contains!216 call!685 key!682))))

(assert (=> b!18392 (=> (not res!12817) (not e!11797))))

(declare-fun b!18393 () Bool)

(declare-fun lt!4803 () Unit!352)

(declare-fun lt!4817 () Unit!352)

(assert (=> b!18393 (= lt!4803 lt!4817)))

(assert (=> b!18393 (= call!693 call!703)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 V!1045 Int) Unit!352)

(assert (=> b!18393 (= lt!4817 (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> b!18393 (= lt!4825 (bvor (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000010))))

(assert (=> b!18393 (= e!11795 (tuple2!795 true (LongMapFixedSize!103 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (bvor (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000010) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259 (_size!83 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_vacant!83 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18394 () Bool)

(assert (=> b!18394 (= e!11811 e!11793)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1037 (_ BitVec 32)) SeekEntryResult!43)

(assert (=> b!18394 (= lt!4805 (seekEntryOrOpen!0 key!682 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> b!18394 (= c!1866 ((_ is Undefined!43) lt!4805))))

(declare-fun b!18395 () Bool)

(assert (=> b!18395 (= e!11794 (not call!686))))

(declare-fun b!18396 () Bool)

(declare-fun res!12816 () Bool)

(assert (=> b!18396 (= res!12816 call!681)))

(assert (=> b!18396 (=> (not res!12816) (not e!11810))))

(declare-fun bm!695 () Bool)

(declare-fun arrayContainsKey!0 (array!1037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!695 (= call!699 (arrayContainsKey!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 #b00000000000000000000000000000000))))

(declare-fun bm!696 () Bool)

(assert (=> bm!696 (= call!686 call!699)))

(declare-fun b!18397 () Bool)

(assert (=> b!18397 (= e!11809 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4812)) key!682))))

(declare-fun bm!697 () Bool)

(assert (=> bm!697 (= call!684 (seekEntryOrOpen!0 key!682 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun bm!698 () Bool)

(assert (=> bm!698 (= call!687 call!702)))

(declare-fun b!18398 () Bool)

(declare-fun lt!4810 () Unit!352)

(assert (=> b!18398 (= lt!4810 e!11798)))

(assert (=> b!18398 (= c!1871 call!694)))

(assert (=> b!18398 (= e!11793 (tuple2!795 false (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(declare-fun bm!699 () Bool)

(assert (=> bm!699 (= call!692 call!684)))

(declare-fun b!18399 () Bool)

(assert (=> b!18399 (= e!11804 (= call!685 call!697))))

(declare-fun bm!700 () Bool)

(assert (=> bm!700 (= call!703 call!696)))

(declare-fun b!18400 () Bool)

(declare-fun c!1870 () Bool)

(assert (=> b!18400 (= c!1870 ((_ is MissingVacant!43) lt!4813))))

(assert (=> b!18400 (= e!11800 e!11807)))

(declare-fun bm!701 () Bool)

(assert (=> bm!701 (= call!694 (contains!216 call!687 key!682))))

(declare-fun b!18401 () Bool)

(assert (=> b!18401 (= e!11811 e!11795)))

(assert (=> b!18401 (= c!1874 (= key!682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18402 () Bool)

(assert (=> b!18402 (= e!11806 e!11808)))

(declare-fun res!12815 () Bool)

(assert (=> b!18402 (= res!12815 call!701)))

(assert (=> b!18402 (=> (not res!12815) (not e!11808))))

(assert (= (and d!3433 c!1869) b!18401))

(assert (= (and d!3433 (not c!1869)) b!18394))

(assert (= (and b!18401 c!1874) b!18381))

(assert (= (and b!18401 (not c!1874)) b!18393))

(assert (= (or b!18381 b!18393) bm!693))

(assert (= (or b!18381 b!18393) bm!700))

(assert (= (or b!18381 b!18393) bm!684))

(assert (= (and b!18394 c!1866) b!18398))

(assert (= (and b!18394 (not c!1866)) b!18384))

(assert (= (and b!18398 c!1871) b!18385))

(assert (= (and b!18398 (not c!1871)) b!18377))

(assert (= (and b!18385 res!12821) b!18379))

(assert (= (and b!18379 res!12823) b!18397))

(assert (= (and b!18377 c!1873) b!18390))

(assert (= (and b!18377 (not c!1873)) b!18369))

(assert (= (and b!18390 res!12814) b!18372))

(assert (= (and b!18372 res!12812) b!18383))

(assert (= (and b!18369 c!1867) b!18402))

(assert (= (and b!18369 (not c!1867)) b!18391))

(assert (= (and b!18402 res!12815) b!18371))

(assert (= (and b!18371 res!12819) b!18365))

(assert (= (or b!18390 b!18402) bm!687))

(assert (= (or b!18383 b!18365) bm!688))

(assert (= (or b!18379 bm!687) bm!682))

(assert (= (or b!18385 b!18377) bm!680))

(assert (= (and b!18384 c!1865) b!18368))

(assert (= (and b!18384 (not c!1865)) b!18374))

(assert (= (and b!18374 c!1868) b!18375))

(assert (= (and b!18374 (not c!1868)) b!18367))

(assert (= (and b!18367 c!1872) b!18387))

(assert (= (and b!18367 (not c!1872)) b!18378))

(assert (= (and b!18387 res!12813) b!18396))

(assert (= (and b!18396 res!12816) b!18373))

(assert (= (and b!18378 c!1876) b!18389))

(assert (= (and b!18378 (not c!1876)) b!18400))

(assert (= (and b!18389 res!12811) b!18386))

(assert (= (and b!18386 res!12810) b!18395))

(assert (= (and b!18400 c!1870) b!18376))

(assert (= (and b!18400 (not c!1870)) b!18380))

(assert (= (and b!18376 res!12818) b!18366))

(assert (= (and b!18366 res!12822) b!18382))

(assert (= (or b!18389 b!18376) bm!678))

(assert (= (or b!18395 b!18382) bm!696))

(assert (= (or b!18396 bm!678) bm!686))

(assert (= (or b!18387 b!18378) bm!699))

(assert (= (or b!18368 b!18375) bm!694))

(assert (= (or bm!688 bm!696) bm!695))

(assert (= (or b!18385 b!18387) bm!692))

(assert (= (or b!18398 b!18367) bm!698))

(assert (= (or bm!682 bm!686) bm!681))

(assert (= (or b!18377 b!18378) bm!685))

(assert (= (or bm!680 bm!699) bm!697))

(assert (= (or b!18398 b!18367) bm!701))

(assert (= (or bm!684 b!18367) bm!690))

(assert (= (or bm!693 bm!698) bm!689))

(assert (= (or bm!700 b!18367) bm!683))

(assert (= (and d!3433 res!12820) b!18388))

(assert (= (and b!18388 c!1875) b!18392))

(assert (= (and b!18388 (not c!1875)) b!18399))

(assert (= (and b!18392 res!12817) b!18370))

(assert (= (or b!18370 b!18399) bm!691))

(assert (= (or b!18392 b!18370 b!18399) bm!679))

(declare-fun m!12739 () Bool)

(assert (=> b!18372 m!12739))

(declare-fun m!12741 () Bool)

(assert (=> b!18386 m!12741))

(declare-fun m!12743 () Bool)

(assert (=> b!18381 m!12743))

(declare-fun m!12745 () Bool)

(assert (=> b!18392 m!12745))

(declare-fun m!12747 () Bool)

(assert (=> b!18366 m!12747))

(declare-fun m!12749 () Bool)

(assert (=> b!18397 m!12749))

(declare-fun m!12751 () Bool)

(assert (=> b!18373 m!12751))

(declare-fun m!12753 () Bool)

(assert (=> bm!691 m!12753))

(declare-fun m!12755 () Bool)

(assert (=> bm!683 m!12755))

(declare-fun m!12757 () Bool)

(assert (=> bm!689 m!12757))

(declare-fun m!12759 () Bool)

(assert (=> b!18371 m!12759))

(declare-fun m!12761 () Bool)

(assert (=> bm!679 m!12761))

(declare-fun m!12763 () Bool)

(assert (=> b!18393 m!12763))

(declare-fun m!12765 () Bool)

(assert (=> b!18370 m!12765))

(declare-fun m!12767 () Bool)

(assert (=> bm!701 m!12767))

(declare-fun m!12769 () Bool)

(assert (=> bm!685 m!12769))

(declare-fun m!12771 () Bool)

(assert (=> bm!692 m!12771))

(declare-fun m!12773 () Bool)

(assert (=> bm!695 m!12773))

(declare-fun m!12775 () Bool)

(assert (=> bm!690 m!12775))

(declare-fun m!12777 () Bool)

(assert (=> bm!697 m!12777))

(declare-fun m!12779 () Bool)

(assert (=> bm!681 m!12779))

(declare-fun m!12781 () Bool)

(assert (=> b!18367 m!12781))

(declare-fun m!12783 () Bool)

(assert (=> b!18367 m!12783))

(declare-fun m!12785 () Bool)

(assert (=> b!18367 m!12785))

(declare-fun m!12787 () Bool)

(assert (=> b!18367 m!12787))

(declare-fun m!12789 () Bool)

(assert (=> b!18367 m!12789))

(assert (=> b!18367 m!12785))

(declare-fun m!12791 () Bool)

(assert (=> b!18367 m!12791))

(declare-fun m!12793 () Bool)

(assert (=> bm!694 m!12793))

(assert (=> b!18394 m!12777))

(declare-fun m!12795 () Bool)

(assert (=> d!3433 m!12795))

(declare-fun m!12797 () Bool)

(assert (=> d!3433 m!12797))

(assert (=> b!18227 d!3433))

(declare-fun d!3435 () Bool)

(assert (=> d!3435 (= (imbalanced!28 thiss!848) (or (bvsgt (bvmul #b00000000000000000000000000000010 (bvadd (_size!83 (v!1473 (underlying!62 thiss!848))) (_vacant!83 (v!1473 (underlying!62 thiss!848))))) (mask!4595 (v!1473 (underlying!62 thiss!848)))) (bvsgt (_vacant!83 (v!1473 (underlying!62 thiss!848))) (_size!83 (v!1473 (underlying!62 thiss!848))))))))

(assert (=> b!18222 d!3435))

(declare-fun d!3437 () Bool)

(assert (=> d!3437 (= (array_inv!343 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) (bvsge (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18219 d!3437))

(declare-fun d!3439 () Bool)

(assert (=> d!3439 (= (array_inv!344 (_values!1659 (v!1473 (underlying!62 thiss!848)))) (bvsge (size!589 (_values!1659 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18219 d!3439))

(declare-fun bm!710 () Bool)

(declare-fun call!715 () tuple2!794)

(declare-fun call!716 () tuple2!794)

(assert (=> bm!710 (= call!715 call!716)))

(declare-fun bm!711 () Bool)

(declare-fun call!713 () LongMapFixedSize!102)

(declare-fun lt!4847 () (_ BitVec 32))

(declare-fun getNewLongMapFixedSize!8 ((_ BitVec 32) Int) LongMapFixedSize!102)

(assert (=> bm!711 (= call!713 (getNewLongMapFixedSize!8 lt!4847 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848)))))))

(declare-fun d!3441 () Bool)

(declare-fun e!11825 () Bool)

(assert (=> d!3441 e!11825))

(declare-fun res!12826 () Bool)

(assert (=> d!3441 (=> res!12826 e!11825)))

(declare-fun lt!4848 () tuple2!792)

(assert (=> d!3441 (= res!12826 (= (_1!397 lt!4848) false))))

(declare-datatypes ((tuple3!2 0))(
  ( (tuple3!3 (_1!401 Bool) (_2!401 Cell!102) (_3!1 LongMap!102)) )
))
(declare-fun lt!4853 () tuple3!2)

(assert (=> d!3441 (= lt!4848 (tuple2!793 (_1!401 lt!4853) (_3!1 lt!4853)))))

(declare-fun e!11823 () tuple3!2)

(assert (=> d!3441 (= lt!4853 e!11823)))

(declare-fun c!1886 () Bool)

(declare-datatypes ((tuple2!800 0))(
  ( (tuple2!801 (_1!402 Bool) (_2!402 Cell!102)) )
))
(declare-fun lt!4854 () tuple2!800)

(assert (=> d!3441 (= c!1886 (not (_1!402 lt!4854)))))

(declare-fun e!11826 () tuple2!800)

(assert (=> d!3441 (= lt!4854 e!11826)))

(declare-fun c!1887 () Bool)

(assert (=> d!3441 (= c!1887 (and (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!4852 () Cell!102)

(assert (=> d!3441 (= lt!4852 (Cell!103 (getNewLongMapFixedSize!8 lt!4847 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848))))))))

(declare-fun computeNewMask!2 (LongMap!102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3441 (= lt!4847 (computeNewMask!2 thiss!848 (mask!4595 (v!1473 (underlying!62 thiss!848))) (_vacant!83 (v!1473 (underlying!62 thiss!848))) (_size!83 (v!1473 (underlying!62 thiss!848)))))))

(assert (=> d!3441 (valid!47 thiss!848)))

(assert (=> d!3441 (= (repack!23 thiss!848) lt!4848)))

(declare-fun b!18421 () Bool)

(declare-fun lt!4849 () tuple2!794)

(assert (=> b!18421 (= e!11823 (ite (_1!398 lt!4849) (tuple3!3 true (underlying!62 thiss!848) (LongMap!103 (Cell!103 (_2!398 lt!4849)))) (tuple3!3 false (Cell!103 (_2!398 lt!4849)) thiss!848)))))

(declare-fun repackFrom!2 (LongMap!102 LongMapFixedSize!102 (_ BitVec 32)) tuple2!794)

(assert (=> b!18421 (= lt!4849 (repackFrom!2 thiss!848 (v!1473 (_2!402 lt!4854)) (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun b!18422 () Bool)

(declare-fun lt!4851 () tuple2!794)

(assert (=> b!18422 (= lt!4851 call!715)))

(declare-fun e!11824 () tuple2!800)

(assert (=> b!18422 (= e!11824 (tuple2!801 (_1!398 lt!4851) (Cell!103 (_2!398 lt!4851))))))

(declare-fun b!18423 () Bool)

(assert (=> b!18423 (= e!11826 e!11824)))

(declare-fun c!1888 () Bool)

(assert (=> b!18423 (= c!1888 (and (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!4846 () tuple2!794)

(declare-fun call!714 () LongMapFixedSize!102)

(declare-fun bm!712 () Bool)

(assert (=> bm!712 (= call!716 (update!12 (ite c!1887 (_2!398 lt!4846) call!714) (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848)))))))))

(declare-fun b!18424 () Bool)

(declare-fun e!11827 () tuple2!800)

(assert (=> b!18424 (= e!11827 (tuple2!801 true lt!4852))))

(declare-fun b!18425 () Bool)

(assert (=> b!18425 (= e!11823 (tuple3!3 false (_2!402 lt!4854) thiss!848))))

(declare-fun b!18426 () Bool)

(assert (=> b!18426 (= e!11825 (= (map!354 (_2!397 lt!4848)) (map!354 thiss!848)))))

(declare-fun b!18427 () Bool)

(declare-fun lt!4850 () tuple2!794)

(assert (=> b!18427 (= e!11827 (tuple2!801 (_1!398 lt!4850) (Cell!103 (_2!398 lt!4850))))))

(assert (=> b!18427 (= lt!4850 call!715)))

(declare-fun bm!713 () Bool)

(assert (=> bm!713 (= call!714 call!713)))

(declare-fun b!18428 () Bool)

(declare-fun c!1885 () Bool)

(assert (=> b!18428 (= c!1885 (and (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!18428 (= e!11824 e!11827)))

(declare-fun b!18429 () Bool)

(declare-fun lt!4855 () tuple2!794)

(assert (=> b!18429 (= e!11826 (tuple2!801 (and (_1!398 lt!4846) (_1!398 lt!4855)) (Cell!103 (_2!398 lt!4855))))))

(assert (=> b!18429 (= lt!4846 (update!12 call!713 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))))))

(assert (=> b!18429 (= lt!4855 call!716)))

(assert (= (and d!3441 c!1887) b!18429))

(assert (= (and d!3441 (not c!1887)) b!18423))

(assert (= (and b!18423 c!1888) b!18422))

(assert (= (and b!18423 (not c!1888)) b!18428))

(assert (= (and b!18428 c!1885) b!18427))

(assert (= (and b!18428 (not c!1885)) b!18424))

(assert (= (or b!18422 b!18427) bm!713))

(assert (= (or b!18422 b!18427) bm!710))

(assert (= (or b!18429 bm!710) bm!712))

(assert (= (or b!18429 bm!713) bm!711))

(assert (= (and d!3441 c!1886) b!18425))

(assert (= (and d!3441 (not c!1886)) b!18421))

(assert (= (and d!3441 (not res!12826)) b!18426))

(declare-fun m!12799 () Bool)

(assert (=> d!3441 m!12799))

(declare-fun m!12801 () Bool)

(assert (=> d!3441 m!12801))

(assert (=> d!3441 m!12681))

(assert (=> bm!711 m!12799))

(declare-fun m!12803 () Bool)

(assert (=> b!18421 m!12803))

(declare-fun m!12805 () Bool)

(assert (=> bm!712 m!12805))

(declare-fun m!12807 () Bool)

(assert (=> b!18429 m!12807))

(declare-fun m!12809 () Bool)

(assert (=> b!18426 m!12809))

(assert (=> b!18426 m!12685))

(assert (=> b!18229 d!3441))

(declare-fun mapNonEmpty!813 () Bool)

(declare-fun mapRes!813 () Bool)

(declare-fun tp!3153 () Bool)

(declare-fun e!11833 () Bool)

(assert (=> mapNonEmpty!813 (= mapRes!813 (and tp!3153 e!11833))))

(declare-fun mapValue!813 () ValueCell!258)

(declare-fun mapRest!813 () (Array (_ BitVec 32) ValueCell!258))

(declare-fun mapKey!813 () (_ BitVec 32))

(assert (=> mapNonEmpty!813 (= mapRest!807 (store mapRest!813 mapKey!813 mapValue!813))))

(declare-fun mapIsEmpty!813 () Bool)

(assert (=> mapIsEmpty!813 mapRes!813))

(declare-fun b!18437 () Bool)

(declare-fun e!11832 () Bool)

(assert (=> b!18437 (= e!11832 tp_is_empty!915)))

(declare-fun b!18436 () Bool)

(assert (=> b!18436 (= e!11833 tp_is_empty!915)))

(declare-fun condMapEmpty!813 () Bool)

(declare-fun mapDefault!813 () ValueCell!258)

(assert (=> mapNonEmpty!807 (= condMapEmpty!813 (= mapRest!807 ((as const (Array (_ BitVec 32) ValueCell!258)) mapDefault!813)))))

(assert (=> mapNonEmpty!807 (= tp!3143 (and e!11832 mapRes!813))))

(assert (= (and mapNonEmpty!807 condMapEmpty!813) mapIsEmpty!813))

(assert (= (and mapNonEmpty!807 (not condMapEmpty!813)) mapNonEmpty!813))

(assert (= (and mapNonEmpty!813 ((_ is ValueCellFull!258) mapValue!813)) b!18436))

(assert (= (and mapNonEmpty!807 ((_ is ValueCellFull!258) mapDefault!813)) b!18437))

(declare-fun m!12811 () Bool)

(assert (=> mapNonEmpty!813 m!12811))

(check-sat (not bm!712) (not b!18392) tp_is_empty!915 (not d!3425) (not b!18421) (not bm!679) (not b!18394) (not b!18370) (not d!3433) (not bm!683) (not bm!691) (not d!3431) (not bm!694) (not b!18426) (not bm!697) (not bm!692) (not b!18393) b_and!1299 (not b!18429) (not b!18286) (not d!3421) (not bm!685) (not bm!711) (not bm!695) (not b_next!651) (not b!18367) (not bm!701) (not d!3427) (not bm!690) (not b!18381) (not b!18288) (not d!3423) (not bm!689) (not d!3429) (not bm!681) (not mapNonEmpty!813) (not b!18278) (not b!18279) (not d!3441))
(check-sat b_and!1299 (not b_next!651))
(get-model)

(declare-fun b!18454 () Bool)

(declare-fun e!11843 () Bool)

(declare-fun e!11844 () Bool)

(assert (=> b!18454 (= e!11843 e!11844)))

(declare-fun c!1893 () Bool)

(declare-fun lt!4860 () SeekEntryResult!43)

(assert (=> b!18454 (= c!1893 ((_ is MissingVacant!43) lt!4860))))

(declare-fun b!18455 () Bool)

(assert (=> b!18455 (= e!11844 ((_ is Undefined!43) lt!4860))))

(declare-fun b!18457 () Bool)

(declare-fun e!11842 () Bool)

(declare-fun call!722 () Bool)

(assert (=> b!18457 (= e!11842 (not call!722))))

(declare-fun b!18458 () Bool)

(assert (=> b!18458 (and (bvsge (index!2291 lt!4860) #b00000000000000000000000000000000) (bvslt (index!2291 lt!4860) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun res!12835 () Bool)

(assert (=> b!18458 (= res!12835 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2291 lt!4860)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18458 (=> (not res!12835) (not e!11842))))

(declare-fun b!18459 () Bool)

(assert (=> b!18459 (= e!11843 e!11842)))

(declare-fun res!12836 () Bool)

(declare-fun call!721 () Bool)

(assert (=> b!18459 (= res!12836 call!721)))

(assert (=> b!18459 (=> (not res!12836) (not e!11842))))

(declare-fun b!18460 () Bool)

(declare-fun res!12837 () Bool)

(declare-fun e!11845 () Bool)

(assert (=> b!18460 (=> (not res!12837) (not e!11845))))

(assert (=> b!18460 (= res!12837 call!721)))

(assert (=> b!18460 (= e!11844 e!11845)))

(declare-fun b!18461 () Bool)

(declare-fun res!12838 () Bool)

(assert (=> b!18461 (=> (not res!12838) (not e!11845))))

(assert (=> b!18461 (= res!12838 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2294 lt!4860)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18461 (and (bvsge (index!2294 lt!4860) #b00000000000000000000000000000000) (bvslt (index!2294 lt!4860) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun d!3443 () Bool)

(assert (=> d!3443 e!11843))

(declare-fun c!1894 () Bool)

(assert (=> d!3443 (= c!1894 ((_ is MissingZero!43) lt!4860))))

(assert (=> d!3443 (= lt!4860 (seekEntryOrOpen!0 key!682 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!4861 () Unit!352)

(declare-fun choose!186 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 64) Int) Unit!352)

(assert (=> d!3443 (= lt!4861 (choose!186 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3443 (validMask!0 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3443 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!4861)))

(declare-fun b!18456 () Bool)

(assert (=> b!18456 (= e!11845 (not call!722))))

(declare-fun bm!718 () Bool)

(assert (=> bm!718 (= call!721 (inRange!0 (ite c!1894 (index!2291 lt!4860) (index!2294 lt!4860)) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun bm!719 () Bool)

(assert (=> bm!719 (= call!722 (arrayContainsKey!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 #b00000000000000000000000000000000))))

(assert (= (and d!3443 c!1894) b!18459))

(assert (= (and d!3443 (not c!1894)) b!18454))

(assert (= (and b!18459 res!12836) b!18458))

(assert (= (and b!18458 res!12835) b!18457))

(assert (= (and b!18454 c!1893) b!18460))

(assert (= (and b!18454 (not c!1893)) b!18455))

(assert (= (and b!18460 res!12837) b!18461))

(assert (= (and b!18461 res!12838) b!18456))

(assert (= (or b!18459 b!18460) bm!718))

(assert (= (or b!18457 b!18456) bm!719))

(declare-fun m!12813 () Bool)

(assert (=> b!18458 m!12813))

(declare-fun m!12815 () Bool)

(assert (=> b!18461 m!12815))

(declare-fun m!12817 () Bool)

(assert (=> bm!718 m!12817))

(assert (=> bm!719 m!12773))

(assert (=> d!3443 m!12777))

(declare-fun m!12819 () Bool)

(assert (=> d!3443 m!12819))

(declare-fun m!12821 () Bool)

(assert (=> d!3443 m!12821))

(assert (=> bm!685 d!3443))

(declare-fun b!18496 () Bool)

(declare-fun res!12861 () Bool)

(declare-fun e!11866 () Bool)

(assert (=> b!18496 (=> (not res!12861) (not e!11866))))

(declare-fun call!733 () Bool)

(assert (=> b!18496 (= res!12861 call!733)))

(declare-fun e!11865 () Bool)

(assert (=> b!18496 (= e!11865 e!11866)))

(declare-fun b!18497 () Bool)

(declare-fun e!11863 () Bool)

(declare-fun lt!4930 () tuple2!794)

(assert (=> b!18497 (= e!11863 (= (map!356 (_2!398 lt!4930)) (+!36 (map!356 (v!1473 (underlying!62 (_2!397 lt!4705)))) (tuple2!791 key!682 v!259))))))

(declare-fun bm!728 () Bool)

(declare-fun call!732 () Bool)

(assert (=> bm!728 (= call!732 (arrayContainsKey!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 #b00000000000000000000000000000000))))

(declare-fun b!18498 () Bool)

(declare-fun e!11864 () Unit!352)

(declare-fun Unit!357 () Unit!352)

(assert (=> b!18498 (= e!11864 Unit!357)))

(declare-fun b!18499 () Bool)

(declare-fun e!11867 () Bool)

(assert (=> b!18499 (= e!11867 (not call!732))))

(declare-fun b!18500 () Bool)

(declare-fun res!12859 () Bool)

(assert (=> b!18500 (=> (not res!12859) (not e!11863))))

(assert (=> b!18500 (= res!12859 (contains!216 (map!356 (_2!398 lt!4930)) key!682))))

(declare-fun b!18501 () Bool)

(declare-fun e!11868 () Bool)

(declare-fun lt!4931 () SeekEntryResult!43)

(assert (=> b!18501 (= e!11868 ((_ is Undefined!43) lt!4931))))

(declare-fun b!18502 () Bool)

(declare-fun res!12857 () Bool)

(assert (=> b!18502 (=> (not res!12857) (not e!11863))))

(assert (=> b!18502 (= res!12857 (valid!49 (_2!398 lt!4930)))))

(declare-fun b!18503 () Bool)

(declare-fun Unit!358 () Unit!352)

(assert (=> b!18503 (= e!11864 Unit!358)))

(declare-fun lt!4945 () Unit!352)

(declare-fun lemmaArrayContainsKeyThenInListMap!1 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 64) (_ BitVec 32) Int) Unit!352)

(assert (=> b!18503 (= lt!4945 (lemmaArrayContainsKeyThenInListMap!1 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> b!18503 (contains!216 (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) key!682)))

(declare-fun lt!4922 () Unit!352)

(assert (=> b!18503 (= lt!4922 lt!4945)))

(assert (=> b!18503 false))

(declare-fun d!3445 () Bool)

(assert (=> d!3445 e!11863))

(declare-fun res!12864 () Bool)

(assert (=> d!3445 (=> (not res!12864) (not e!11863))))

(assert (=> d!3445 (= res!12864 (_1!398 lt!4930))))

(assert (=> d!3445 (= lt!4930 (tuple2!795 true (LongMapFixedSize!103 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (bvadd (_size!83 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000001) (array!1038 (store (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (_vacant!83 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun lt!4934 () Unit!352)

(declare-fun lt!4951 () Unit!352)

(assert (=> d!3445 (= lt!4934 lt!4951)))

(declare-fun lt!4949 () array!1037)

(declare-fun lt!4936 () array!1035)

(assert (=> d!3445 (contains!216 (getCurrentListMap!121 lt!4949 lt!4936 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) (select (store (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805))))))

(assert (=> d!3445 (= lt!4951 (lemmaValidKeyInArrayIsInListMap!2 lt!4949 lt!4936 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> d!3445 (= lt!4936 (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(assert (=> d!3445 (= lt!4949 (array!1038 (store (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun lt!4950 () Unit!352)

(declare-fun lt!4925 () Unit!352)

(assert (=> d!3445 (= lt!4950 lt!4925)))

(declare-fun lt!4942 () array!1037)

(declare-fun arrayCountValidKeys!0 (array!1037 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3445 (= (arrayCountValidKeys!0 lt!4942 (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) (bvadd (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!1037 (_ BitVec 32)) Unit!352)

(assert (=> d!3445 (= lt!4925 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!4942 (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805))))))

(assert (=> d!3445 (= lt!4942 (array!1038 (store (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun lt!4943 () Unit!352)

(declare-fun lt!4932 () Unit!352)

(assert (=> d!3445 (= lt!4943 lt!4932)))

(declare-fun lt!4946 () array!1037)

(assert (=> d!3445 (arrayContainsKey!0 lt!4946 key!682 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1037 (_ BitVec 64) (_ BitVec 32)) Unit!352)

(assert (=> d!3445 (= lt!4932 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!4946 key!682 (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805))))))

(assert (=> d!3445 (= lt!4946 (array!1038 (store (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun lt!4941 () Unit!352)

(declare-fun lt!4926 () Unit!352)

(assert (=> d!3445 (= lt!4941 lt!4926)))

(assert (=> d!3445 (= (+!36 (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) (tuple2!791 key!682 v!259)) (getCurrentListMap!121 (array!1038 (store (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!1 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 32) (_ BitVec 64) V!1045 Int) Unit!352)

(assert (=> d!3445 (= lt!4926 (lemmaAddValidKeyToArrayThenAddPairToListMap!1 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682 v!259 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!4948 () Unit!352)

(declare-fun lt!4947 () Unit!352)

(assert (=> d!3445 (= lt!4948 lt!4947)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1037 (_ BitVec 32)) Bool)

(assert (=> d!3445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!1038 (store (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!1037 (_ BitVec 32) (_ BitVec 32)) Unit!352)

(assert (=> d!3445 (= lt!4947 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!682 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!4940 () Unit!352)

(declare-fun lt!4929 () Unit!352)

(assert (=> d!3445 (= lt!4940 lt!4929)))

(assert (=> d!3445 (= (arrayCountValidKeys!0 (array!1038 (store (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (bvadd (arrayCountValidKeys!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!1037 (_ BitVec 32) (_ BitVec 64)) Unit!352)

(assert (=> d!3445 (= lt!4929 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682))))

(declare-fun lt!4944 () Unit!352)

(declare-fun lt!4938 () Unit!352)

(assert (=> d!3445 (= lt!4944 lt!4938)))

(declare-fun lt!4923 () (_ BitVec 32))

(declare-datatypes ((List!541 0))(
  ( (Nil!538) (Cons!537 (h!1103 (_ BitVec 64)) (t!3184 List!541)) )
))
(declare-fun lt!4927 () List!541)

(declare-fun arrayNoDuplicates!0 (array!1037 (_ BitVec 32) List!541) Bool)

(assert (=> d!3445 (arrayNoDuplicates!0 (array!1038 (store (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) key!682) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) lt!4923 lt!4927)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!1037 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!541) Unit!352)

(assert (=> d!3445 (= lt!4938 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805)) lt!4923 lt!4927))))

(assert (=> d!3445 (= lt!4927 Nil!538)))

(assert (=> d!3445 (= lt!4923 #b00000000000000000000000000000000)))

(declare-fun lt!4928 () Unit!352)

(assert (=> d!3445 (= lt!4928 e!11864)))

(declare-fun c!1903 () Bool)

(assert (=> d!3445 (= c!1903 (arrayContainsKey!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 #b00000000000000000000000000000000))))

(declare-fun lt!4933 () Unit!352)

(declare-fun e!11869 () Unit!352)

(assert (=> d!3445 (= lt!4933 e!11869)))

(declare-fun c!1904 () Bool)

(assert (=> d!3445 (= c!1904 (contains!216 (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) key!682))))

(assert (=> d!3445 (valid!49 (v!1473 (underlying!62 (_2!397 lt!4705))))))

(assert (=> d!3445 (= (updateHelperNewKey!2 (v!1473 (underlying!62 (_2!397 lt!4705))) key!682 v!259 (ite c!1865 (index!2294 lt!4805) (index!2291 lt!4805))) lt!4930)))

(declare-fun b!18504 () Bool)

(declare-fun res!12865 () Bool)

(assert (=> b!18504 (= res!12865 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2294 lt!4931)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18504 (=> (not res!12865) (not e!11867))))

(declare-fun b!18505 () Bool)

(assert (=> b!18505 (= e!11868 e!11867)))

(declare-fun res!12863 () Bool)

(assert (=> b!18505 (= res!12863 call!733)))

(assert (=> b!18505 (=> (not res!12863) (not e!11867))))

(declare-fun b!18506 () Bool)

(declare-fun lt!4924 () Unit!352)

(assert (=> b!18506 (= e!11869 lt!4924)))

(assert (=> b!18506 (= lt!4924 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun call!731 () SeekEntryResult!43)

(assert (=> b!18506 (= lt!4931 call!731)))

(declare-fun c!1906 () Bool)

(assert (=> b!18506 (= c!1906 ((_ is MissingZero!43) lt!4931))))

(assert (=> b!18506 e!11865))

(declare-fun b!18507 () Bool)

(declare-fun c!1905 () Bool)

(assert (=> b!18507 (= c!1905 ((_ is MissingVacant!43) lt!4931))))

(assert (=> b!18507 (= e!11865 e!11868)))

(declare-fun call!734 () Bool)

(declare-fun lt!4937 () SeekEntryResult!43)

(declare-fun bm!729 () Bool)

(assert (=> bm!729 (= call!734 (inRange!0 (ite c!1904 (index!2292 lt!4937) (ite c!1906 (index!2291 lt!4931) (index!2294 lt!4931))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun bm!730 () Bool)

(assert (=> bm!730 (= call!733 call!734)))

(declare-fun b!18508 () Bool)

(declare-fun res!12862 () Bool)

(assert (=> b!18508 (= res!12862 call!734)))

(declare-fun e!11862 () Bool)

(assert (=> b!18508 (=> (not res!12862) (not e!11862))))

(declare-fun b!18509 () Bool)

(declare-fun res!12860 () Bool)

(assert (=> b!18509 (=> (not res!12860) (not e!11866))))

(assert (=> b!18509 (= res!12860 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2291 lt!4931)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!731 () Bool)

(assert (=> bm!731 (= call!731 (seekEntryOrOpen!0 key!682 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18510 () Bool)

(declare-fun Unit!359 () Unit!352)

(assert (=> b!18510 (= e!11869 Unit!359)))

(declare-fun lt!4935 () Unit!352)

(assert (=> b!18510 (= lt!4935 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> b!18510 (= lt!4937 call!731)))

(declare-fun res!12858 () Bool)

(assert (=> b!18510 (= res!12858 ((_ is Found!43) lt!4937))))

(assert (=> b!18510 (=> (not res!12858) (not e!11862))))

(assert (=> b!18510 e!11862))

(declare-fun lt!4939 () Unit!352)

(assert (=> b!18510 (= lt!4939 lt!4935)))

(assert (=> b!18510 false))

(declare-fun b!18511 () Bool)

(assert (=> b!18511 (= e!11862 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4937)) key!682))))

(declare-fun b!18512 () Bool)

(assert (=> b!18512 (= e!11866 (not call!732))))

(assert (= (and d!3445 c!1904) b!18510))

(assert (= (and d!3445 (not c!1904)) b!18506))

(assert (= (and b!18510 res!12858) b!18508))

(assert (= (and b!18508 res!12862) b!18511))

(assert (= (and b!18506 c!1906) b!18496))

(assert (= (and b!18506 (not c!1906)) b!18507))

(assert (= (and b!18496 res!12861) b!18509))

(assert (= (and b!18509 res!12860) b!18512))

(assert (= (and b!18507 c!1905) b!18505))

(assert (= (and b!18507 (not c!1905)) b!18501))

(assert (= (and b!18505 res!12863) b!18504))

(assert (= (and b!18504 res!12865) b!18499))

(assert (= (or b!18496 b!18505) bm!730))

(assert (= (or b!18512 b!18499) bm!728))

(assert (= (or b!18508 bm!730) bm!729))

(assert (= (or b!18510 b!18506) bm!731))

(assert (= (and d!3445 c!1903) b!18503))

(assert (= (and d!3445 (not c!1903)) b!18498))

(assert (= (and d!3445 res!12864) b!18502))

(assert (= (and b!18502 res!12857) b!18500))

(assert (= (and b!18500 res!12859) b!18497))

(assert (=> b!18506 m!12769))

(declare-fun m!12823 () Bool)

(assert (=> b!18503 m!12823))

(declare-fun m!12825 () Bool)

(assert (=> b!18503 m!12825))

(assert (=> b!18503 m!12825))

(declare-fun m!12827 () Bool)

(assert (=> b!18503 m!12827))

(declare-fun m!12829 () Bool)

(assert (=> bm!729 m!12829))

(assert (=> b!18510 m!12771))

(assert (=> bm!728 m!12773))

(declare-fun m!12831 () Bool)

(assert (=> b!18497 m!12831))

(assert (=> b!18497 m!12753))

(assert (=> b!18497 m!12753))

(declare-fun m!12833 () Bool)

(assert (=> b!18497 m!12833))

(declare-fun m!12835 () Bool)

(assert (=> b!18509 m!12835))

(declare-fun m!12837 () Bool)

(assert (=> b!18511 m!12837))

(declare-fun m!12839 () Bool)

(assert (=> d!3445 m!12839))

(declare-fun m!12841 () Bool)

(assert (=> d!3445 m!12841))

(assert (=> d!3445 m!12825))

(assert (=> d!3445 m!12797))

(assert (=> d!3445 m!12773))

(declare-fun m!12843 () Bool)

(assert (=> d!3445 m!12843))

(declare-fun m!12845 () Bool)

(assert (=> d!3445 m!12845))

(declare-fun m!12847 () Bool)

(assert (=> d!3445 m!12847))

(declare-fun m!12849 () Bool)

(assert (=> d!3445 m!12849))

(assert (=> d!3445 m!12825))

(assert (=> d!3445 m!12827))

(declare-fun m!12851 () Bool)

(assert (=> d!3445 m!12851))

(declare-fun m!12853 () Bool)

(assert (=> d!3445 m!12853))

(declare-fun m!12855 () Bool)

(assert (=> d!3445 m!12855))

(declare-fun m!12857 () Bool)

(assert (=> d!3445 m!12857))

(declare-fun m!12859 () Bool)

(assert (=> d!3445 m!12859))

(declare-fun m!12861 () Bool)

(assert (=> d!3445 m!12861))

(declare-fun m!12863 () Bool)

(assert (=> d!3445 m!12863))

(declare-fun m!12865 () Bool)

(assert (=> d!3445 m!12865))

(declare-fun m!12867 () Bool)

(assert (=> d!3445 m!12867))

(declare-fun m!12869 () Bool)

(assert (=> d!3445 m!12869))

(declare-fun m!12871 () Bool)

(assert (=> d!3445 m!12871))

(assert (=> d!3445 m!12825))

(declare-fun m!12873 () Bool)

(assert (=> d!3445 m!12873))

(declare-fun m!12875 () Bool)

(assert (=> d!3445 m!12875))

(assert (=> d!3445 m!12865))

(declare-fun m!12877 () Bool)

(assert (=> d!3445 m!12877))

(assert (=> d!3445 m!12867))

(assert (=> b!18500 m!12831))

(assert (=> b!18500 m!12831))

(declare-fun m!12879 () Bool)

(assert (=> b!18500 m!12879))

(declare-fun m!12881 () Bool)

(assert (=> b!18502 m!12881))

(declare-fun m!12883 () Bool)

(assert (=> b!18504 m!12883))

(assert (=> bm!731 m!12777))

(assert (=> bm!694 d!3445))

(declare-fun d!3447 () Bool)

(assert (=> d!3447 (= (map!356 (v!1473 (underlying!62 lt!4707))) (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 lt!4707))) (_values!1659 (v!1473 (underlying!62 lt!4707))) (mask!4595 (v!1473 (underlying!62 lt!4707))) (extraKeys!1575 (v!1473 (underlying!62 lt!4707))) (zeroValue!1598 (v!1473 (underlying!62 lt!4707))) (minValue!1598 (v!1473 (underlying!62 lt!4707))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 lt!4707)))))))

(declare-fun bs!844 () Bool)

(assert (= bs!844 d!3447))

(declare-fun m!12885 () Bool)

(assert (=> bs!844 m!12885))

(assert (=> d!3429 d!3447))

(declare-fun d!3449 () Bool)

(assert (=> d!3449 (= (map!356 (v!1473 (underlying!62 thiss!848))) (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 thiss!848))) (_values!1659 (v!1473 (underlying!62 thiss!848))) (mask!4595 (v!1473 (underlying!62 thiss!848))) (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848)))))))

(declare-fun bs!845 () Bool)

(assert (= bs!845 d!3449))

(declare-fun m!12887 () Bool)

(assert (=> bs!845 m!12887))

(assert (=> d!3423 d!3449))

(declare-fun bm!732 () Bool)

(declare-fun call!752 () Bool)

(declare-fun call!735 () Bool)

(assert (=> bm!732 (= call!752 call!735)))

(declare-fun bm!733 () Bool)

(declare-fun call!739 () ListLongMap!537)

(declare-fun lt!4959 () tuple2!794)

(assert (=> bm!733 (= call!739 (map!356 (_2!398 lt!4959)))))

(declare-fun bm!734 () Bool)

(declare-fun call!754 () SeekEntryResult!43)

(declare-fun call!738 () SeekEntryResult!43)

(assert (=> bm!734 (= call!754 call!738)))

(declare-fun b!18513 () Bool)

(declare-fun e!11885 () Bool)

(declare-fun call!743 () Bool)

(assert (=> b!18513 (= e!11885 (not call!743))))

(declare-fun b!18514 () Bool)

(declare-fun res!12878 () Bool)

(declare-fun lt!4966 () SeekEntryResult!43)

(assert (=> b!18514 (= res!12878 (= (select (arr!500 (_keys!3087 call!713)) (index!2294 lt!4966)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11873 () Bool)

(assert (=> b!18514 (=> (not res!12878) (not e!11873))))

(declare-fun b!18515 () Bool)

(declare-fun lt!4977 () Unit!352)

(declare-fun lt!4953 () Unit!352)

(assert (=> b!18515 (= lt!4977 lt!4953)))

(declare-fun call!750 () ListLongMap!537)

(declare-fun lt!4958 () SeekEntryResult!43)

(assert (=> b!18515 (contains!216 call!750 (select (arr!500 (_keys!3087 call!713)) (index!2292 lt!4958)))))

(declare-fun lt!4964 () array!1035)

(assert (=> b!18515 (= lt!4953 (lemmaValidKeyInArrayIsInListMap!2 (_keys!3087 call!713) lt!4964 (mask!4595 call!713) (extraKeys!1575 call!713) (zeroValue!1598 call!713) (minValue!1598 call!713) (index!2292 lt!4958) (defaultEntry!1662 call!713)))))

(assert (=> b!18515 (= lt!4964 (array!1036 (store (arr!499 (_values!1659 call!713)) (index!2292 lt!4958) (ValueCellFull!258 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))))) (size!589 (_values!1659 call!713))))))

(declare-fun lt!4961 () Unit!352)

(declare-fun lt!4968 () Unit!352)

(assert (=> b!18515 (= lt!4961 lt!4968)))

(declare-fun call!749 () ListLongMap!537)

(assert (=> b!18515 (= call!749 (getCurrentListMap!121 (_keys!3087 call!713) (array!1036 (store (arr!499 (_values!1659 call!713)) (index!2292 lt!4958) (ValueCellFull!258 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))))) (size!589 (_values!1659 call!713))) (mask!4595 call!713) (extraKeys!1575 call!713) (zeroValue!1598 call!713) (minValue!1598 call!713) #b00000000000000000000000000000000 (defaultEntry!1662 call!713)))))

(assert (=> b!18515 (= lt!4968 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3087 call!713) (_values!1659 call!713) (mask!4595 call!713) (extraKeys!1575 call!713) (zeroValue!1598 call!713) (minValue!1598 call!713) (index!2292 lt!4958) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (defaultEntry!1662 call!713)))))

(declare-fun lt!4972 () Unit!352)

(declare-fun e!11889 () Unit!352)

(assert (=> b!18515 (= lt!4972 e!11889)))

(declare-fun c!1914 () Bool)

(declare-fun call!748 () Bool)

(assert (=> b!18515 (= c!1914 call!748)))

(declare-fun e!11879 () tuple2!794)

(assert (=> b!18515 (= e!11879 (tuple2!795 true (LongMapFixedSize!103 (defaultEntry!1662 call!713) (mask!4595 call!713) (extraKeys!1575 call!713) (zeroValue!1598 call!713) (minValue!1598 call!713) (_size!83 call!713) (_keys!3087 call!713) (array!1036 (store (arr!499 (_values!1659 call!713)) (index!2292 lt!4958) (ValueCellFull!258 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))))) (size!589 (_values!1659 call!713))) (_vacant!83 call!713))))))

(declare-fun b!18516 () Bool)

(declare-fun e!11880 () tuple2!794)

(declare-fun lt!4969 () tuple2!794)

(assert (=> b!18516 (= e!11880 (tuple2!795 (_1!398 lt!4969) (_2!398 lt!4969)))))

(declare-fun call!742 () tuple2!794)

(assert (=> b!18516 (= lt!4969 call!742)))

(declare-fun b!18517 () Bool)

(declare-fun c!1909 () Bool)

(declare-fun lt!4971 () SeekEntryResult!43)

(assert (=> b!18517 (= c!1909 ((_ is MissingVacant!43) lt!4971))))

(declare-fun e!11878 () Bool)

(declare-fun e!11883 () Bool)

(assert (=> b!18517 (= e!11878 e!11883)))

(declare-fun c!1915 () Bool)

(declare-fun lt!4965 () SeekEntryResult!43)

(declare-fun c!1908 () Bool)

(declare-fun c!1913 () Bool)

(declare-fun bm!735 () Bool)

(declare-fun call!745 () Bool)

(declare-fun lt!4976 () SeekEntryResult!43)

(declare-fun c!1918 () Bool)

(assert (=> bm!735 (= call!745 (inRange!0 (ite c!1908 (ite c!1913 (index!2292 lt!4965) (ite c!1915 (index!2291 lt!4971) (index!2294 lt!4971))) (ite c!1914 (index!2292 lt!4976) (ite c!1918 (index!2291 lt!4966) (index!2294 lt!4966)))) (mask!4595 call!713)))))

(declare-fun bm!736 () Bool)

(declare-fun call!744 () Bool)

(assert (=> bm!736 (= call!744 call!745)))

(declare-fun c!1911 () Bool)

(declare-fun c!1916 () Bool)

(declare-fun lt!4978 () (_ BitVec 32))

(declare-fun bm!737 () Bool)

(assert (=> bm!737 (= call!750 (getCurrentListMap!121 (_keys!3087 call!713) (ite c!1911 (_values!1659 call!713) lt!4964) (mask!4595 call!713) (ite c!1911 (ite c!1916 (extraKeys!1575 call!713) lt!4978) (extraKeys!1575 call!713)) (zeroValue!1598 call!713) (ite c!1911 (ite c!1916 (minValue!1598 call!713) (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))) (minValue!1598 call!713)) #b00000000000000000000000000000000 (defaultEntry!1662 call!713)))))

(declare-fun call!751 () ListLongMap!537)

(declare-fun b!18518 () Bool)

(declare-fun e!11874 () Bool)

(assert (=> b!18518 (= e!11874 (= call!739 (+!36 call!751 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))))))))

(declare-fun b!18519 () Bool)

(declare-fun res!12875 () Bool)

(assert (=> b!18519 (= res!12875 (= (select (arr!500 (_keys!3087 call!713)) (index!2294 lt!4971)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18519 (=> (not res!12875) (not e!11885))))

(declare-fun b!18520 () Bool)

(declare-fun res!12868 () Bool)

(declare-fun e!11876 () Bool)

(assert (=> b!18520 (=> (not res!12868) (not e!11876))))

(assert (=> b!18520 (= res!12868 (= (select (arr!500 (_keys!3087 call!713)) (index!2291 lt!4971)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18521 () Bool)

(declare-fun e!11887 () Bool)

(assert (=> b!18521 (= e!11887 (= (select (arr!500 (_keys!3087 call!713)) (index!2292 lt!4976)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!738 () Bool)

(declare-fun call!747 () ListLongMap!537)

(assert (=> bm!738 (= call!747 call!749)))

(declare-fun b!18522 () Bool)

(assert (=> b!18522 (= e!11880 e!11879)))

(declare-fun c!1910 () Bool)

(assert (=> b!18522 (= c!1910 ((_ is MissingZero!43) lt!4958))))

(declare-fun bm!739 () Bool)

(declare-fun call!758 () Unit!352)

(assert (=> bm!739 (= call!758 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3087 call!713) (_values!1659 call!713) (mask!4595 call!713) (extraKeys!1575 call!713) (zeroValue!1598 call!713) (minValue!1598 call!713) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1662 call!713)))))

(declare-fun b!18523 () Bool)

(declare-fun lt!4973 () tuple2!794)

(assert (=> b!18523 (= lt!4973 call!742)))

(assert (=> b!18523 (= e!11879 (tuple2!795 (_1!398 lt!4973) (_2!398 lt!4973)))))

(declare-fun b!18524 () Bool)

(declare-fun e!11884 () Bool)

(assert (=> b!18524 (= e!11884 e!11873)))

(declare-fun res!12874 () Bool)

(assert (=> b!18524 (= res!12874 call!752)))

(assert (=> b!18524 (=> (not res!12874) (not e!11873))))

(declare-fun b!18525 () Bool)

(declare-fun e!11875 () Unit!352)

(declare-fun lt!4967 () Unit!352)

(assert (=> b!18525 (= e!11875 lt!4967)))

(assert (=> b!18525 (= lt!4967 call!758)))

(assert (=> b!18525 (= lt!4971 call!754)))

(assert (=> b!18525 (= c!1915 ((_ is MissingZero!43) lt!4971))))

(assert (=> b!18525 e!11878))

(declare-fun b!18526 () Bool)

(declare-fun Unit!360 () Unit!352)

(assert (=> b!18526 (= e!11889 Unit!360)))

(declare-fun lt!4952 () Unit!352)

(assert (=> b!18526 (= lt!4952 call!758)))

(declare-fun call!746 () SeekEntryResult!43)

(assert (=> b!18526 (= lt!4966 call!746)))

(assert (=> b!18526 (= c!1918 ((_ is MissingZero!43) lt!4966))))

(declare-fun e!11877 () Bool)

(assert (=> b!18526 e!11877))

(declare-fun lt!4955 () Unit!352)

(assert (=> b!18526 (= lt!4955 lt!4952)))

(assert (=> b!18526 false))

(declare-fun bm!740 () Bool)

(assert (=> bm!740 (= call!735 call!745)))

(declare-fun b!18527 () Bool)

(declare-fun res!12879 () Bool)

(assert (=> b!18527 (= res!12879 call!744)))

(declare-fun e!11886 () Bool)

(assert (=> b!18527 (=> (not res!12879) (not e!11886))))

(declare-fun bm!741 () Bool)

(declare-fun call!755 () Bool)

(assert (=> bm!741 (= call!755 call!744)))

(declare-fun bm!742 () Bool)

(declare-fun call!753 () Bool)

(assert (=> bm!742 (= call!743 call!753)))

(declare-fun b!18528 () Bool)

(assert (=> b!18528 (= e!11884 ((_ is Undefined!43) lt!4966))))

(declare-fun b!18529 () Bool)

(declare-fun lt!4957 () Unit!352)

(declare-fun lt!4975 () Unit!352)

(assert (=> b!18529 (= lt!4957 lt!4975)))

(declare-fun call!737 () ListLongMap!537)

(assert (=> b!18529 (= call!747 call!737)))

(declare-fun lt!4960 () (_ BitVec 32))

(assert (=> b!18529 (= lt!4975 (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3087 call!713) (_values!1659 call!713) (mask!4595 call!713) (extraKeys!1575 call!713) lt!4960 (zeroValue!1598 call!713) (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 call!713) (defaultEntry!1662 call!713)))))

(assert (=> b!18529 (= lt!4960 (bvor (extraKeys!1575 call!713) #b00000000000000000000000000000001))))

(declare-fun e!11872 () tuple2!794)

(assert (=> b!18529 (= e!11872 (tuple2!795 true (LongMapFixedSize!103 (defaultEntry!1662 call!713) (mask!4595 call!713) (bvor (extraKeys!1575 call!713) #b00000000000000000000000000000001) (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 call!713) (_size!83 call!713) (_keys!3087 call!713) (_values!1659 call!713) (_vacant!83 call!713))))))

(declare-fun bm!743 () Bool)

(declare-fun call!756 () ListLongMap!537)

(assert (=> bm!743 (= call!756 (getCurrentListMap!121 (_keys!3087 call!713) (_values!1659 call!713) (mask!4595 call!713) (ite (and c!1911 c!1916) lt!4960 (extraKeys!1575 call!713)) (ite (and c!1911 c!1916) (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (zeroValue!1598 call!713)) (minValue!1598 call!713) #b00000000000000000000000000000000 (defaultEntry!1662 call!713)))))

(declare-fun b!18530 () Bool)

(declare-fun call!740 () Bool)

(assert (=> b!18530 (= e!11873 (not call!740))))

(declare-fun b!18531 () Bool)

(assert (=> b!18531 (= e!11876 (not call!743))))

(declare-fun call!741 () ListLongMap!537)

(declare-fun bm!744 () Bool)

(declare-fun call!757 () ListLongMap!537)

(assert (=> bm!744 (= call!749 (+!36 (ite c!1911 (ite c!1916 call!757 call!737) call!741) (ite c!1911 (ite c!1916 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))))) (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))))))))

(declare-fun b!18532 () Bool)

(declare-fun c!1907 () Bool)

(assert (=> b!18532 (= c!1907 ((_ is MissingVacant!43) lt!4958))))

(declare-fun e!11870 () tuple2!794)

(assert (=> b!18532 (= e!11870 e!11880)))

(declare-fun bm!745 () Bool)

(assert (=> bm!745 (= call!751 (map!356 call!713))))

(declare-fun bm!746 () Bool)

(declare-fun call!736 () Unit!352)

(assert (=> bm!746 (= call!736 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3087 call!713) (_values!1659 call!713) (mask!4595 call!713) (extraKeys!1575 call!713) (zeroValue!1598 call!713) (minValue!1598 call!713) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1662 call!713)))))

(declare-fun d!3451 () Bool)

(declare-fun e!11882 () Bool)

(assert (=> d!3451 e!11882))

(declare-fun res!12876 () Bool)

(assert (=> d!3451 (=> (not res!12876) (not e!11882))))

(assert (=> d!3451 (= res!12876 (valid!49 (_2!398 lt!4959)))))

(declare-fun e!11888 () tuple2!794)

(assert (=> d!3451 (= lt!4959 e!11888)))

(assert (=> d!3451 (= c!1911 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3451 (valid!49 call!713)))

(assert (=> d!3451 (= (update!12 call!713 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))) lt!4959)))

(declare-fun b!18533 () Bool)

(declare-fun Unit!361 () Unit!352)

(assert (=> b!18533 (= e!11875 Unit!361)))

(declare-fun lt!4974 () Unit!352)

(assert (=> b!18533 (= lt!4974 call!736)))

(assert (=> b!18533 (= lt!4965 call!754)))

(declare-fun res!12877 () Bool)

(assert (=> b!18533 (= res!12877 ((_ is Found!43) lt!4965))))

(assert (=> b!18533 (=> (not res!12877) (not e!11886))))

(assert (=> b!18533 e!11886))

(declare-fun lt!4962 () Unit!352)

(assert (=> b!18533 (= lt!4962 lt!4974)))

(assert (=> b!18533 false))

(declare-fun b!18534 () Bool)

(declare-fun res!12866 () Bool)

(declare-fun e!11871 () Bool)

(assert (=> b!18534 (=> (not res!12866) (not e!11871))))

(assert (=> b!18534 (= res!12866 (= (select (arr!500 (_keys!3087 call!713)) (index!2291 lt!4966)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18535 () Bool)

(declare-fun lt!4954 () Unit!352)

(assert (=> b!18535 (= e!11889 lt!4954)))

(assert (=> b!18535 (= lt!4954 call!736)))

(assert (=> b!18535 (= lt!4976 call!746)))

(declare-fun res!12869 () Bool)

(assert (=> b!18535 (= res!12869 ((_ is Found!43) lt!4976))))

(assert (=> b!18535 (=> (not res!12869) (not e!11887))))

(assert (=> b!18535 e!11887))

(declare-fun bm!747 () Bool)

(assert (=> bm!747 (= call!737 call!756)))

(declare-fun b!18536 () Bool)

(declare-fun e!11881 () Bool)

(assert (=> b!18536 (= e!11882 e!11881)))

(declare-fun c!1917 () Bool)

(assert (=> b!18536 (= c!1917 (_1!398 lt!4959))))

(declare-fun b!18537 () Bool)

(declare-fun res!12867 () Bool)

(assert (=> b!18537 (=> (not res!12867) (not e!11871))))

(assert (=> b!18537 (= res!12867 call!752)))

(assert (=> b!18537 (= e!11877 e!11871)))

(declare-fun b!18538 () Bool)

(declare-fun res!12870 () Bool)

(assert (=> b!18538 (=> (not res!12870) (not e!11876))))

(assert (=> b!18538 (= res!12870 call!755)))

(assert (=> b!18538 (= e!11878 e!11876)))

(declare-fun b!18539 () Bool)

(assert (=> b!18539 (= e!11883 ((_ is Undefined!43) lt!4971))))

(declare-fun bm!748 () Bool)

(assert (=> bm!748 (= call!742 (updateHelperNewKey!2 call!713 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1907 (index!2294 lt!4958) (index!2291 lt!4958))))))

(declare-fun b!18540 () Bool)

(assert (=> b!18540 (= e!11881 e!11874)))

(declare-fun res!12873 () Bool)

(assert (=> b!18540 (= res!12873 (contains!216 call!739 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18540 (=> (not res!12873) (not e!11874))))

(declare-fun b!18541 () Bool)

(declare-fun lt!4956 () Unit!352)

(declare-fun lt!4970 () Unit!352)

(assert (=> b!18541 (= lt!4956 lt!4970)))

(assert (=> b!18541 (= call!747 call!757)))

(assert (=> b!18541 (= lt!4970 (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3087 call!713) (_values!1659 call!713) (mask!4595 call!713) (extraKeys!1575 call!713) lt!4978 (zeroValue!1598 call!713) (minValue!1598 call!713) (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (defaultEntry!1662 call!713)))))

(assert (=> b!18541 (= lt!4978 (bvor (extraKeys!1575 call!713) #b00000000000000000000000000000010))))

(assert (=> b!18541 (= e!11872 (tuple2!795 true (LongMapFixedSize!103 (defaultEntry!1662 call!713) (mask!4595 call!713) (bvor (extraKeys!1575 call!713) #b00000000000000000000000000000010) (zeroValue!1598 call!713) (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (_size!83 call!713) (_keys!3087 call!713) (_values!1659 call!713) (_vacant!83 call!713))))))

(declare-fun b!18542 () Bool)

(assert (=> b!18542 (= e!11888 e!11870)))

(assert (=> b!18542 (= lt!4958 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3087 call!713) (mask!4595 call!713)))))

(assert (=> b!18542 (= c!1908 ((_ is Undefined!43) lt!4958))))

(declare-fun b!18543 () Bool)

(assert (=> b!18543 (= e!11871 (not call!740))))

(declare-fun b!18544 () Bool)

(declare-fun res!12872 () Bool)

(assert (=> b!18544 (= res!12872 call!735)))

(assert (=> b!18544 (=> (not res!12872) (not e!11887))))

(declare-fun bm!749 () Bool)

(assert (=> bm!749 (= call!753 (arrayContainsKey!0 (_keys!3087 call!713) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun bm!750 () Bool)

(assert (=> bm!750 (= call!740 call!753)))

(declare-fun b!18545 () Bool)

(assert (=> b!18545 (= e!11886 (= (select (arr!500 (_keys!3087 call!713)) (index!2292 lt!4965)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!751 () Bool)

(assert (=> bm!751 (= call!738 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3087 call!713) (mask!4595 call!713)))))

(declare-fun bm!752 () Bool)

(assert (=> bm!752 (= call!741 call!756)))

(declare-fun b!18546 () Bool)

(declare-fun lt!4963 () Unit!352)

(assert (=> b!18546 (= lt!4963 e!11875)))

(assert (=> b!18546 (= c!1913 call!748)))

(assert (=> b!18546 (= e!11870 (tuple2!795 false call!713))))

(declare-fun bm!753 () Bool)

(assert (=> bm!753 (= call!746 call!738)))

(declare-fun b!18547 () Bool)

(assert (=> b!18547 (= e!11881 (= call!739 call!751))))

(declare-fun bm!754 () Bool)

(assert (=> bm!754 (= call!757 call!750)))

(declare-fun b!18548 () Bool)

(declare-fun c!1912 () Bool)

(assert (=> b!18548 (= c!1912 ((_ is MissingVacant!43) lt!4966))))

(assert (=> b!18548 (= e!11877 e!11884)))

(declare-fun bm!755 () Bool)

(assert (=> bm!755 (= call!748 (contains!216 call!741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18549 () Bool)

(assert (=> b!18549 (= e!11888 e!11872)))

(assert (=> b!18549 (= c!1916 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18550 () Bool)

(assert (=> b!18550 (= e!11883 e!11885)))

(declare-fun res!12871 () Bool)

(assert (=> b!18550 (= res!12871 call!755)))

(assert (=> b!18550 (=> (not res!12871) (not e!11885))))

(assert (= (and d!3451 c!1911) b!18549))

(assert (= (and d!3451 (not c!1911)) b!18542))

(assert (= (and b!18549 c!1916) b!18529))

(assert (= (and b!18549 (not c!1916)) b!18541))

(assert (= (or b!18529 b!18541) bm!747))

(assert (= (or b!18529 b!18541) bm!754))

(assert (= (or b!18529 b!18541) bm!738))

(assert (= (and b!18542 c!1908) b!18546))

(assert (= (and b!18542 (not c!1908)) b!18532))

(assert (= (and b!18546 c!1913) b!18533))

(assert (= (and b!18546 (not c!1913)) b!18525))

(assert (= (and b!18533 res!12877) b!18527))

(assert (= (and b!18527 res!12879) b!18545))

(assert (= (and b!18525 c!1915) b!18538))

(assert (= (and b!18525 (not c!1915)) b!18517))

(assert (= (and b!18538 res!12870) b!18520))

(assert (= (and b!18520 res!12868) b!18531))

(assert (= (and b!18517 c!1909) b!18550))

(assert (= (and b!18517 (not c!1909)) b!18539))

(assert (= (and b!18550 res!12871) b!18519))

(assert (= (and b!18519 res!12875) b!18513))

(assert (= (or b!18538 b!18550) bm!741))

(assert (= (or b!18531 b!18513) bm!742))

(assert (= (or b!18527 bm!741) bm!736))

(assert (= (or b!18533 b!18525) bm!734))

(assert (= (and b!18532 c!1907) b!18516))

(assert (= (and b!18532 (not c!1907)) b!18522))

(assert (= (and b!18522 c!1910) b!18523))

(assert (= (and b!18522 (not c!1910)) b!18515))

(assert (= (and b!18515 c!1914) b!18535))

(assert (= (and b!18515 (not c!1914)) b!18526))

(assert (= (and b!18535 res!12869) b!18544))

(assert (= (and b!18544 res!12872) b!18521))

(assert (= (and b!18526 c!1918) b!18537))

(assert (= (and b!18526 (not c!1918)) b!18548))

(assert (= (and b!18537 res!12867) b!18534))

(assert (= (and b!18534 res!12866) b!18543))

(assert (= (and b!18548 c!1912) b!18524))

(assert (= (and b!18548 (not c!1912)) b!18528))

(assert (= (and b!18524 res!12874) b!18514))

(assert (= (and b!18514 res!12878) b!18530))

(assert (= (or b!18537 b!18524) bm!732))

(assert (= (or b!18543 b!18530) bm!750))

(assert (= (or b!18544 bm!732) bm!740))

(assert (= (or b!18535 b!18526) bm!753))

(assert (= (or b!18516 b!18523) bm!748))

(assert (= (or bm!742 bm!750) bm!749))

(assert (= (or b!18533 b!18535) bm!746))

(assert (= (or b!18546 b!18515) bm!752))

(assert (= (or bm!736 bm!740) bm!735))

(assert (= (or b!18525 b!18526) bm!739))

(assert (= (or bm!734 bm!753) bm!751))

(assert (= (or b!18546 b!18515) bm!755))

(assert (= (or bm!738 b!18515) bm!744))

(assert (= (or bm!747 bm!752) bm!743))

(assert (= (or bm!754 b!18515) bm!737))

(assert (= (and d!3451 res!12876) b!18536))

(assert (= (and b!18536 c!1917) b!18540))

(assert (= (and b!18536 (not c!1917)) b!18547))

(assert (= (and b!18540 res!12873) b!18518))

(assert (= (or b!18518 b!18547) bm!745))

(assert (= (or b!18540 b!18518 b!18547) bm!733))

(declare-fun m!12889 () Bool)

(assert (=> b!18520 m!12889))

(declare-fun m!12891 () Bool)

(assert (=> b!18534 m!12891))

(declare-fun m!12893 () Bool)

(assert (=> b!18529 m!12893))

(declare-fun m!12895 () Bool)

(assert (=> b!18540 m!12895))

(declare-fun m!12897 () Bool)

(assert (=> b!18514 m!12897))

(declare-fun m!12899 () Bool)

(assert (=> b!18545 m!12899))

(declare-fun m!12901 () Bool)

(assert (=> b!18521 m!12901))

(declare-fun m!12903 () Bool)

(assert (=> bm!745 m!12903))

(declare-fun m!12905 () Bool)

(assert (=> bm!737 m!12905))

(declare-fun m!12907 () Bool)

(assert (=> bm!743 m!12907))

(declare-fun m!12909 () Bool)

(assert (=> b!18519 m!12909))

(declare-fun m!12911 () Bool)

(assert (=> bm!733 m!12911))

(declare-fun m!12913 () Bool)

(assert (=> b!18541 m!12913))

(declare-fun m!12915 () Bool)

(assert (=> b!18518 m!12915))

(declare-fun m!12917 () Bool)

(assert (=> bm!755 m!12917))

(declare-fun m!12919 () Bool)

(assert (=> bm!739 m!12919))

(declare-fun m!12921 () Bool)

(assert (=> bm!746 m!12921))

(declare-fun m!12923 () Bool)

(assert (=> bm!749 m!12923))

(declare-fun m!12925 () Bool)

(assert (=> bm!744 m!12925))

(declare-fun m!12927 () Bool)

(assert (=> bm!751 m!12927))

(declare-fun m!12929 () Bool)

(assert (=> bm!735 m!12929))

(declare-fun m!12931 () Bool)

(assert (=> b!18515 m!12931))

(declare-fun m!12933 () Bool)

(assert (=> b!18515 m!12933))

(declare-fun m!12935 () Bool)

(assert (=> b!18515 m!12935))

(declare-fun m!12937 () Bool)

(assert (=> b!18515 m!12937))

(declare-fun m!12939 () Bool)

(assert (=> b!18515 m!12939))

(assert (=> b!18515 m!12935))

(declare-fun m!12941 () Bool)

(assert (=> b!18515 m!12941))

(declare-fun m!12943 () Bool)

(assert (=> bm!748 m!12943))

(assert (=> b!18542 m!12927))

(declare-fun m!12945 () Bool)

(assert (=> d!3451 m!12945))

(declare-fun m!12947 () Bool)

(assert (=> d!3451 m!12947))

(assert (=> b!18429 d!3451))

(declare-fun d!3453 () Bool)

(declare-fun lt!4981 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!14 (List!539) (InoxSet tuple2!790))

(assert (=> d!3453 (= lt!4981 (select (content!14 (toList!284 lt!4731)) (tuple2!791 key!682 v!259)))))

(declare-fun e!11895 () Bool)

(assert (=> d!3453 (= lt!4981 e!11895)))

(declare-fun res!12884 () Bool)

(assert (=> d!3453 (=> (not res!12884) (not e!11895))))

(assert (=> d!3453 (= res!12884 ((_ is Cons!535) (toList!284 lt!4731)))))

(assert (=> d!3453 (= (contains!217 (toList!284 lt!4731) (tuple2!791 key!682 v!259)) lt!4981)))

(declare-fun b!18555 () Bool)

(declare-fun e!11894 () Bool)

(assert (=> b!18555 (= e!11895 e!11894)))

(declare-fun res!12885 () Bool)

(assert (=> b!18555 (=> res!12885 e!11894)))

(assert (=> b!18555 (= res!12885 (= (h!1101 (toList!284 lt!4731)) (tuple2!791 key!682 v!259)))))

(declare-fun b!18556 () Bool)

(assert (=> b!18556 (= e!11894 (contains!217 (t!3178 (toList!284 lt!4731)) (tuple2!791 key!682 v!259)))))

(assert (= (and d!3453 res!12884) b!18555))

(assert (= (and b!18555 (not res!12885)) b!18556))

(declare-fun m!12949 () Bool)

(assert (=> d!3453 m!12949))

(declare-fun m!12951 () Bool)

(assert (=> d!3453 m!12951))

(declare-fun m!12953 () Bool)

(assert (=> b!18556 m!12953))

(assert (=> b!18279 d!3453))

(declare-fun d!3455 () Bool)

(assert (=> d!3455 (= (+!36 (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259 #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!4984 () Unit!352)

(declare-fun choose!187 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 V!1045 Int) Unit!352)

(assert (=> d!3455 (= lt!4984 (choose!187 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> d!3455 (validMask!0 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3455 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!4984)))

(declare-fun bs!846 () Bool)

(assert (= bs!846 d!3455))

(assert (=> bs!846 m!12821))

(assert (=> bs!846 m!12825))

(declare-fun m!12955 () Bool)

(assert (=> bs!846 m!12955))

(declare-fun m!12957 () Bool)

(assert (=> bs!846 m!12957))

(assert (=> bs!846 m!12825))

(declare-fun m!12959 () Bool)

(assert (=> bs!846 m!12959))

(assert (=> b!18393 d!3455))

(declare-fun d!3457 () Bool)

(declare-fun res!12892 () Bool)

(declare-fun e!11898 () Bool)

(assert (=> d!3457 (=> (not res!12892) (not e!11898))))

(declare-fun simpleValid!9 (LongMapFixedSize!102) Bool)

(assert (=> d!3457 (= res!12892 (simpleValid!9 (v!1473 (underlying!62 thiss!848))))))

(assert (=> d!3457 (= (valid!49 (v!1473 (underlying!62 thiss!848))) e!11898)))

(declare-fun b!18563 () Bool)

(declare-fun res!12893 () Bool)

(assert (=> b!18563 (=> (not res!12893) (not e!11898))))

(assert (=> b!18563 (= res!12893 (= (arrayCountValidKeys!0 (_keys!3087 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848))))) (_size!83 (v!1473 (underlying!62 thiss!848)))))))

(declare-fun b!18564 () Bool)

(declare-fun res!12894 () Bool)

(assert (=> b!18564 (=> (not res!12894) (not e!11898))))

(assert (=> b!18564 (= res!12894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3087 (v!1473 (underlying!62 thiss!848))) (mask!4595 (v!1473 (underlying!62 thiss!848)))))))

(declare-fun b!18565 () Bool)

(assert (=> b!18565 (= e!11898 (arrayNoDuplicates!0 (_keys!3087 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000000 Nil!538))))

(assert (= (and d!3457 res!12892) b!18563))

(assert (= (and b!18563 res!12893) b!18564))

(assert (= (and b!18564 res!12894) b!18565))

(declare-fun m!12961 () Bool)

(assert (=> d!3457 m!12961))

(declare-fun m!12963 () Bool)

(assert (=> b!18563 m!12963))

(declare-fun m!12965 () Bool)

(assert (=> b!18564 m!12965))

(declare-fun m!12967 () Bool)

(assert (=> b!18565 m!12967))

(assert (=> d!3425 d!3457))

(declare-fun d!3459 () Bool)

(assert (=> d!3459 (isDefined!21 (getValueByKey!59 (toList!284 lt!4706) key!682))))

(declare-fun lt!4987 () Unit!352)

(declare-fun choose!188 (List!539 (_ BitVec 64)) Unit!352)

(assert (=> d!3459 (= lt!4987 (choose!188 (toList!284 lt!4706) key!682))))

(declare-fun e!11901 () Bool)

(assert (=> d!3459 e!11901))

(declare-fun res!12897 () Bool)

(assert (=> d!3459 (=> (not res!12897) (not e!11901))))

(declare-fun isStrictlySorted!170 (List!539) Bool)

(assert (=> d!3459 (= res!12897 (isStrictlySorted!170 (toList!284 lt!4706)))))

(assert (=> d!3459 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!284 lt!4706) key!682) lt!4987)))

(declare-fun b!18568 () Bool)

(assert (=> b!18568 (= e!11901 (containsKey!23 (toList!284 lt!4706) key!682))))

(assert (= (and d!3459 res!12897) b!18568))

(assert (=> d!3459 m!12731))

(assert (=> d!3459 m!12731))

(assert (=> d!3459 m!12733))

(declare-fun m!12969 () Bool)

(assert (=> d!3459 m!12969))

(declare-fun m!12971 () Bool)

(assert (=> d!3459 m!12971))

(assert (=> b!18568 m!12727))

(assert (=> b!18286 d!3459))

(declare-fun d!3461 () Bool)

(declare-fun isEmpty!170 (Option!65) Bool)

(assert (=> d!3461 (= (isDefined!21 (getValueByKey!59 (toList!284 lt!4706) key!682)) (not (isEmpty!170 (getValueByKey!59 (toList!284 lt!4706) key!682))))))

(declare-fun bs!847 () Bool)

(assert (= bs!847 d!3461))

(assert (=> bs!847 m!12731))

(declare-fun m!12973 () Bool)

(assert (=> bs!847 m!12973))

(assert (=> b!18286 d!3461))

(declare-fun b!18577 () Bool)

(declare-fun e!11906 () Option!65)

(assert (=> b!18577 (= e!11906 (Some!64 (_2!396 (h!1101 (toList!284 lt!4706)))))))

(declare-fun b!18580 () Bool)

(declare-fun e!11907 () Option!65)

(assert (=> b!18580 (= e!11907 None!63)))

(declare-fun b!18578 () Bool)

(assert (=> b!18578 (= e!11906 e!11907)))

(declare-fun c!1924 () Bool)

(assert (=> b!18578 (= c!1924 (and ((_ is Cons!535) (toList!284 lt!4706)) (not (= (_1!396 (h!1101 (toList!284 lt!4706))) key!682))))))

(declare-fun d!3463 () Bool)

(declare-fun c!1923 () Bool)

(assert (=> d!3463 (= c!1923 (and ((_ is Cons!535) (toList!284 lt!4706)) (= (_1!396 (h!1101 (toList!284 lt!4706))) key!682)))))

(assert (=> d!3463 (= (getValueByKey!59 (toList!284 lt!4706) key!682) e!11906)))

(declare-fun b!18579 () Bool)

(assert (=> b!18579 (= e!11907 (getValueByKey!59 (t!3178 (toList!284 lt!4706)) key!682))))

(assert (= (and d!3463 c!1923) b!18577))

(assert (= (and d!3463 (not c!1923)) b!18578))

(assert (= (and b!18578 c!1924) b!18579))

(assert (= (and b!18578 (not c!1924)) b!18580))

(declare-fun m!12975 () Bool)

(assert (=> b!18579 m!12975))

(assert (=> b!18286 d!3463))

(declare-fun d!3465 () Bool)

(declare-fun e!11908 () Bool)

(assert (=> d!3465 e!11908))

(declare-fun res!12898 () Bool)

(assert (=> d!3465 (=> res!12898 e!11908)))

(declare-fun lt!4989 () Bool)

(assert (=> d!3465 (= res!12898 (not lt!4989))))

(declare-fun lt!4990 () Bool)

(assert (=> d!3465 (= lt!4989 lt!4990)))

(declare-fun lt!4991 () Unit!352)

(declare-fun e!11909 () Unit!352)

(assert (=> d!3465 (= lt!4991 e!11909)))

(declare-fun c!1925 () Bool)

(assert (=> d!3465 (= c!1925 lt!4990)))

(assert (=> d!3465 (= lt!4990 (containsKey!23 (toList!284 call!685) key!682))))

(assert (=> d!3465 (= (contains!216 call!685 key!682) lt!4989)))

(declare-fun b!18581 () Bool)

(declare-fun lt!4988 () Unit!352)

(assert (=> b!18581 (= e!11909 lt!4988)))

(assert (=> b!18581 (= lt!4988 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!284 call!685) key!682))))

(assert (=> b!18581 (isDefined!21 (getValueByKey!59 (toList!284 call!685) key!682))))

(declare-fun b!18582 () Bool)

(declare-fun Unit!362 () Unit!352)

(assert (=> b!18582 (= e!11909 Unit!362)))

(declare-fun b!18583 () Bool)

(assert (=> b!18583 (= e!11908 (isDefined!21 (getValueByKey!59 (toList!284 call!685) key!682)))))

(assert (= (and d!3465 c!1925) b!18581))

(assert (= (and d!3465 (not c!1925)) b!18582))

(assert (= (and d!3465 (not res!12898)) b!18583))

(declare-fun m!12977 () Bool)

(assert (=> d!3465 m!12977))

(declare-fun m!12979 () Bool)

(assert (=> b!18581 m!12979))

(declare-fun m!12981 () Bool)

(assert (=> b!18581 m!12981))

(assert (=> b!18581 m!12981))

(declare-fun m!12983 () Bool)

(assert (=> b!18581 m!12983))

(assert (=> b!18583 m!12981))

(assert (=> b!18583 m!12981))

(assert (=> b!18583 m!12983))

(assert (=> b!18392 d!3465))

(declare-fun d!3467 () Bool)

(assert (=> d!3467 (= (map!356 (_2!398 lt!4806)) (getCurrentListMap!121 (_keys!3087 (_2!398 lt!4806)) (_values!1659 (_2!398 lt!4806)) (mask!4595 (_2!398 lt!4806)) (extraKeys!1575 (_2!398 lt!4806)) (zeroValue!1598 (_2!398 lt!4806)) (minValue!1598 (_2!398 lt!4806)) #b00000000000000000000000000000000 (defaultEntry!1662 (_2!398 lt!4806))))))

(declare-fun bs!848 () Bool)

(assert (= bs!848 d!3467))

(declare-fun m!12985 () Bool)

(assert (=> bs!848 m!12985))

(assert (=> bm!679 d!3467))

(declare-fun d!3469 () Bool)

(declare-fun res!12899 () Bool)

(declare-fun e!11910 () Bool)

(assert (=> d!3469 (=> (not res!12899) (not e!11910))))

(assert (=> d!3469 (= res!12899 (simpleValid!9 (_2!398 lt!4806)))))

(assert (=> d!3469 (= (valid!49 (_2!398 lt!4806)) e!11910)))

(declare-fun b!18584 () Bool)

(declare-fun res!12900 () Bool)

(assert (=> b!18584 (=> (not res!12900) (not e!11910))))

(assert (=> b!18584 (= res!12900 (= (arrayCountValidKeys!0 (_keys!3087 (_2!398 lt!4806)) #b00000000000000000000000000000000 (size!590 (_keys!3087 (_2!398 lt!4806)))) (_size!83 (_2!398 lt!4806))))))

(declare-fun b!18585 () Bool)

(declare-fun res!12901 () Bool)

(assert (=> b!18585 (=> (not res!12901) (not e!11910))))

(assert (=> b!18585 (= res!12901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3087 (_2!398 lt!4806)) (mask!4595 (_2!398 lt!4806))))))

(declare-fun b!18586 () Bool)

(assert (=> b!18586 (= e!11910 (arrayNoDuplicates!0 (_keys!3087 (_2!398 lt!4806)) #b00000000000000000000000000000000 Nil!538))))

(assert (= (and d!3469 res!12899) b!18584))

(assert (= (and b!18584 res!12900) b!18585))

(assert (= (and b!18585 res!12901) b!18586))

(declare-fun m!12987 () Bool)

(assert (=> d!3469 m!12987))

(declare-fun m!12989 () Bool)

(assert (=> b!18584 m!12989))

(declare-fun m!12991 () Bool)

(assert (=> b!18585 m!12991))

(declare-fun m!12993 () Bool)

(assert (=> b!18586 m!12993))

(assert (=> d!3433 d!3469))

(declare-fun d!3471 () Bool)

(declare-fun res!12902 () Bool)

(declare-fun e!11911 () Bool)

(assert (=> d!3471 (=> (not res!12902) (not e!11911))))

(assert (=> d!3471 (= res!12902 (simpleValid!9 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3471 (= (valid!49 (v!1473 (underlying!62 (_2!397 lt!4705)))) e!11911)))

(declare-fun b!18587 () Bool)

(declare-fun res!12903 () Bool)

(assert (=> b!18587 (=> (not res!12903) (not e!11911))))

(assert (=> b!18587 (= res!12903 (= (arrayCountValidKeys!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (_size!83 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18588 () Bool)

(declare-fun res!12904 () Bool)

(assert (=> b!18588 (=> (not res!12904) (not e!11911))))

(assert (=> b!18588 (= res!12904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18589 () Bool)

(assert (=> b!18589 (= e!11911 (arrayNoDuplicates!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 Nil!538))))

(assert (= (and d!3471 res!12902) b!18587))

(assert (= (and b!18587 res!12903) b!18588))

(assert (= (and b!18588 res!12904) b!18589))

(declare-fun m!12995 () Bool)

(assert (=> d!3471 m!12995))

(assert (=> b!18587 m!12857))

(declare-fun m!12997 () Bool)

(assert (=> b!18588 m!12997))

(declare-fun m!12999 () Bool)

(assert (=> b!18589 m!12999))

(assert (=> d!3433 d!3471))

(declare-fun d!3473 () Bool)

(declare-fun res!12905 () Bool)

(declare-fun e!11912 () Bool)

(assert (=> d!3473 (=> (not res!12905) (not e!11912))))

(assert (=> d!3473 (= res!12905 (simpleValid!9 (v!1473 (underlying!62 lt!4707))))))

(assert (=> d!3473 (= (valid!49 (v!1473 (underlying!62 lt!4707))) e!11912)))

(declare-fun b!18590 () Bool)

(declare-fun res!12906 () Bool)

(assert (=> b!18590 (=> (not res!12906) (not e!11912))))

(assert (=> b!18590 (= res!12906 (= (arrayCountValidKeys!0 (_keys!3087 (v!1473 (underlying!62 lt!4707))) #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 lt!4707))))) (_size!83 (v!1473 (underlying!62 lt!4707)))))))

(declare-fun b!18591 () Bool)

(declare-fun res!12907 () Bool)

(assert (=> b!18591 (=> (not res!12907) (not e!11912))))

(assert (=> b!18591 (= res!12907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3087 (v!1473 (underlying!62 lt!4707))) (mask!4595 (v!1473 (underlying!62 lt!4707)))))))

(declare-fun b!18592 () Bool)

(assert (=> b!18592 (= e!11912 (arrayNoDuplicates!0 (_keys!3087 (v!1473 (underlying!62 lt!4707))) #b00000000000000000000000000000000 Nil!538))))

(assert (= (and d!3473 res!12905) b!18590))

(assert (= (and b!18590 res!12906) b!18591))

(assert (= (and b!18591 res!12907) b!18592))

(declare-fun m!13001 () Bool)

(assert (=> d!3473 m!13001))

(declare-fun m!13003 () Bool)

(assert (=> b!18590 m!13003))

(declare-fun m!13005 () Bool)

(assert (=> b!18591 m!13005))

(declare-fun m!13007 () Bool)

(assert (=> b!18592 m!13007))

(assert (=> d!3431 d!3473))

(declare-fun d!3475 () Bool)

(assert (=> d!3475 (= (+!36 (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259)) (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4807 v!259 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!4994 () Unit!352)

(declare-fun choose!189 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 V!1045 Int) Unit!352)

(assert (=> d!3475 (= lt!4994 (choose!189 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4807 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> d!3475 (validMask!0 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3475 (= (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4807 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!4994)))

(declare-fun bs!849 () Bool)

(assert (= bs!849 d!3475))

(declare-fun m!13009 () Bool)

(assert (=> bs!849 m!13009))

(assert (=> bs!849 m!12825))

(declare-fun m!13011 () Bool)

(assert (=> bs!849 m!13011))

(declare-fun m!13013 () Bool)

(assert (=> bs!849 m!13013))

(assert (=> bs!849 m!12825))

(assert (=> bs!849 m!12821))

(assert (=> b!18381 d!3475))

(declare-fun d!3477 () Bool)

(declare-fun e!11913 () Bool)

(assert (=> d!3477 e!11913))

(declare-fun res!12908 () Bool)

(assert (=> d!3477 (=> res!12908 e!11913)))

(declare-fun lt!4996 () Bool)

(assert (=> d!3477 (= res!12908 (not lt!4996))))

(declare-fun lt!4997 () Bool)

(assert (=> d!3477 (= lt!4996 lt!4997)))

(declare-fun lt!4998 () Unit!352)

(declare-fun e!11914 () Unit!352)

(assert (=> d!3477 (= lt!4998 e!11914)))

(declare-fun c!1926 () Bool)

(assert (=> d!3477 (= c!1926 lt!4997)))

(assert (=> d!3477 (= lt!4997 (containsKey!23 (toList!284 call!696) (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805))))))

(assert (=> d!3477 (= (contains!216 call!696 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805))) lt!4996)))

(declare-fun b!18593 () Bool)

(declare-fun lt!4995 () Unit!352)

(assert (=> b!18593 (= e!11914 lt!4995)))

(assert (=> b!18593 (= lt!4995 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!284 call!696) (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805))))))

(assert (=> b!18593 (isDefined!21 (getValueByKey!59 (toList!284 call!696) (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805))))))

(declare-fun b!18594 () Bool)

(declare-fun Unit!363 () Unit!352)

(assert (=> b!18594 (= e!11914 Unit!363)))

(declare-fun b!18595 () Bool)

(assert (=> b!18595 (= e!11913 (isDefined!21 (getValueByKey!59 (toList!284 call!696) (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805)))))))

(assert (= (and d!3477 c!1926) b!18593))

(assert (= (and d!3477 (not c!1926)) b!18594))

(assert (= (and d!3477 (not res!12908)) b!18595))

(assert (=> d!3477 m!12785))

(declare-fun m!13015 () Bool)

(assert (=> d!3477 m!13015))

(assert (=> b!18593 m!12785))

(declare-fun m!13017 () Bool)

(assert (=> b!18593 m!13017))

(assert (=> b!18593 m!12785))

(declare-fun m!13019 () Bool)

(assert (=> b!18593 m!13019))

(assert (=> b!18593 m!13019))

(declare-fun m!13021 () Bool)

(assert (=> b!18593 m!13021))

(assert (=> b!18595 m!12785))

(assert (=> b!18595 m!13019))

(assert (=> b!18595 m!13019))

(assert (=> b!18595 m!13021))

(assert (=> b!18367 d!3477))

(declare-fun d!3479 () Bool)

(declare-fun e!11917 () Bool)

(assert (=> d!3479 e!11917))

(declare-fun res!12911 () Bool)

(assert (=> d!3479 (=> (not res!12911) (not e!11917))))

(assert (=> d!3479 (= res!12911 (and (bvsge (index!2292 lt!4805) #b00000000000000000000000000000000) (bvslt (index!2292 lt!4805) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))))))))

(declare-fun lt!5001 () Unit!352)

(declare-fun choose!190 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 32) Int) Unit!352)

(assert (=> d!3479 (= lt!5001 (choose!190 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (index!2292 lt!4805) (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> d!3479 (validMask!0 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3479 (= (lemmaValidKeyInArrayIsInListMap!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (index!2292 lt!4805) (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5001)))

(declare-fun b!18598 () Bool)

(assert (=> b!18598 (= e!11917 (contains!216 (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805))))))

(assert (= (and d!3479 res!12911) b!18598))

(declare-fun m!13023 () Bool)

(assert (=> d!3479 m!13023))

(assert (=> d!3479 m!12821))

(declare-fun m!13025 () Bool)

(assert (=> b!18598 m!13025))

(assert (=> b!18598 m!12785))

(assert (=> b!18598 m!13025))

(assert (=> b!18598 m!12785))

(declare-fun m!13027 () Bool)

(assert (=> b!18598 m!13027))

(assert (=> b!18367 d!3479))

(declare-fun bm!770 () Bool)

(declare-fun call!773 () ListLongMap!537)

(declare-fun call!776 () ListLongMap!537)

(assert (=> bm!770 (= call!773 call!776)))

(declare-fun b!18641 () Bool)

(declare-fun res!12933 () Bool)

(declare-fun e!11952 () Bool)

(assert (=> b!18641 (=> (not res!12933) (not e!11952))))

(declare-fun e!11953 () Bool)

(assert (=> b!18641 (= res!12933 e!11953)))

(declare-fun res!12937 () Bool)

(assert (=> b!18641 (=> res!12937 e!11953)))

(declare-fun e!11954 () Bool)

(assert (=> b!18641 (= res!12937 (not e!11954))))

(declare-fun res!12936 () Bool)

(assert (=> b!18641 (=> (not res!12936) (not e!11954))))

(assert (=> b!18641 (= res!12936 (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18642 () Bool)

(declare-fun e!11945 () ListLongMap!537)

(declare-fun call!774 () ListLongMap!537)

(assert (=> b!18642 (= e!11945 (+!36 call!774 (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18643 () Bool)

(declare-fun e!11951 () Bool)

(declare-fun e!11946 () Bool)

(assert (=> b!18643 (= e!11951 e!11946)))

(declare-fun res!12934 () Bool)

(declare-fun call!777 () Bool)

(assert (=> b!18643 (= res!12934 call!777)))

(assert (=> b!18643 (=> (not res!12934) (not e!11946))))

(declare-fun bm!771 () Bool)

(declare-fun call!775 () ListLongMap!537)

(assert (=> bm!771 (= call!775 call!774)))

(declare-fun bm!772 () Bool)

(declare-fun call!778 () Bool)

(declare-fun lt!5067 () ListLongMap!537)

(assert (=> bm!772 (= call!778 (contains!216 lt!5067 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!773 () Bool)

(assert (=> bm!773 (= call!777 (contains!216 lt!5067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18644 () Bool)

(declare-fun c!1944 () Bool)

(assert (=> b!18644 (= c!1944 (and (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!11948 () ListLongMap!537)

(declare-fun e!11950 () ListLongMap!537)

(assert (=> b!18644 (= e!11948 e!11950)))

(declare-fun b!18645 () Bool)

(declare-fun call!779 () ListLongMap!537)

(assert (=> b!18645 (= e!11950 call!779)))

(declare-fun b!18646 () Bool)

(assert (=> b!18646 (= e!11948 call!775)))

(declare-fun b!18647 () Bool)

(assert (=> b!18647 (= e!11945 e!11948)))

(declare-fun c!1939 () Bool)

(assert (=> b!18647 (= c!1939 (and (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!774 () Bool)

(declare-fun c!1941 () Bool)

(assert (=> bm!774 (= call!774 (+!36 (ite c!1941 call!776 (ite c!1939 call!773 call!779)) (ite (or c!1941 c!1939) (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))))))

(declare-fun b!18648 () Bool)

(assert (=> b!18648 (= e!11951 (not call!777))))

(declare-fun d!3481 () Bool)

(assert (=> d!3481 e!11952))

(declare-fun res!12935 () Bool)

(assert (=> d!3481 (=> (not res!12935) (not e!11952))))

(assert (=> d!3481 (= res!12935 (or (bvsge #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))))

(declare-fun lt!5054 () ListLongMap!537)

(assert (=> d!3481 (= lt!5067 lt!5054)))

(declare-fun lt!5049 () Unit!352)

(declare-fun e!11956 () Unit!352)

(assert (=> d!3481 (= lt!5049 e!11956)))

(declare-fun c!1942 () Bool)

(declare-fun e!11949 () Bool)

(assert (=> d!3481 (= c!1942 e!11949)))

(declare-fun res!12930 () Bool)

(assert (=> d!3481 (=> (not res!12930) (not e!11949))))

(assert (=> d!3481 (= res!12930 (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(assert (=> d!3481 (= lt!5054 e!11945)))

(assert (=> d!3481 (= c!1941 (and (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3481 (validMask!0 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3481 (= (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5067)))

(declare-fun b!18649 () Bool)

(declare-fun e!11944 () Bool)

(assert (=> b!18649 (= e!11952 e!11944)))

(declare-fun c!1940 () Bool)

(assert (=> b!18649 (= c!1940 (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18650 () Bool)

(declare-fun apply!27 (ListLongMap!537 (_ BitVec 64)) V!1045)

(assert (=> b!18650 (= e!11946 (= (apply!27 lt!5067 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun e!11955 () Bool)

(declare-fun b!18651 () Bool)

(declare-fun get!348 (ValueCell!258 V!1045) V!1045)

(declare-fun dynLambda!133 (Int (_ BitVec 64)) V!1045)

(assert (=> b!18651 (= e!11955 (= (apply!27 lt!5067 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)) (get!348 (select (arr!499 (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))))) #b00000000000000000000000000000000) (dynLambda!133 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!589 (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))))

(assert (=> b!18651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18652 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!18652 (= e!11954 (validKeyInArray!0 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)))))

(declare-fun b!18653 () Bool)

(assert (=> b!18653 (= e!11944 (not call!778))))

(declare-fun b!18654 () Bool)

(declare-fun Unit!364 () Unit!352)

(assert (=> b!18654 (= e!11956 Unit!364)))

(declare-fun bm!775 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!12 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 32) Int) ListLongMap!537)

(assert (=> bm!775 (= call!776 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18655 () Bool)

(assert (=> b!18655 (= e!11949 (validKeyInArray!0 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)))))

(declare-fun b!18656 () Bool)

(declare-fun e!11947 () Bool)

(assert (=> b!18656 (= e!11947 (= (apply!27 lt!5067 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun bm!776 () Bool)

(assert (=> bm!776 (= call!779 call!773)))

(declare-fun b!18657 () Bool)

(assert (=> b!18657 (= e!11944 e!11947)))

(declare-fun res!12932 () Bool)

(assert (=> b!18657 (= res!12932 call!778)))

(assert (=> b!18657 (=> (not res!12932) (not e!11947))))

(declare-fun b!18658 () Bool)

(declare-fun res!12938 () Bool)

(assert (=> b!18658 (=> (not res!12938) (not e!11952))))

(assert (=> b!18658 (= res!12938 e!11951)))

(declare-fun c!1943 () Bool)

(assert (=> b!18658 (= c!1943 (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!18659 () Bool)

(assert (=> b!18659 (= e!11950 call!775)))

(declare-fun b!18660 () Bool)

(declare-fun lt!5059 () Unit!352)

(assert (=> b!18660 (= e!11956 lt!5059)))

(declare-fun lt!5065 () ListLongMap!537)

(assert (=> b!18660 (= lt!5065 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5047 () (_ BitVec 64))

(assert (=> b!18660 (= lt!5047 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5058 () (_ BitVec 64))

(assert (=> b!18660 (= lt!5058 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(declare-fun lt!5051 () Unit!352)

(declare-fun addStillContains!12 (ListLongMap!537 (_ BitVec 64) V!1045 (_ BitVec 64)) Unit!352)

(assert (=> b!18660 (= lt!5051 (addStillContains!12 lt!5065 lt!5047 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!5058))))

(assert (=> b!18660 (contains!216 (+!36 lt!5065 (tuple2!791 lt!5047 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))) lt!5058)))

(declare-fun lt!5055 () Unit!352)

(assert (=> b!18660 (= lt!5055 lt!5051)))

(declare-fun lt!5062 () ListLongMap!537)

(assert (=> b!18660 (= lt!5062 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5050 () (_ BitVec 64))

(assert (=> b!18660 (= lt!5050 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5046 () (_ BitVec 64))

(assert (=> b!18660 (= lt!5046 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(declare-fun lt!5060 () Unit!352)

(declare-fun addApplyDifferent!12 (ListLongMap!537 (_ BitVec 64) V!1045 (_ BitVec 64)) Unit!352)

(assert (=> b!18660 (= lt!5060 (addApplyDifferent!12 lt!5062 lt!5050 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!5046))))

(assert (=> b!18660 (= (apply!27 (+!36 lt!5062 (tuple2!791 lt!5050 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))) lt!5046) (apply!27 lt!5062 lt!5046))))

(declare-fun lt!5061 () Unit!352)

(assert (=> b!18660 (= lt!5061 lt!5060)))

(declare-fun lt!5064 () ListLongMap!537)

(assert (=> b!18660 (= lt!5064 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5063 () (_ BitVec 64))

(assert (=> b!18660 (= lt!5063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5053 () (_ BitVec 64))

(assert (=> b!18660 (= lt!5053 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(declare-fun lt!5056 () Unit!352)

(assert (=> b!18660 (= lt!5056 (addApplyDifferent!12 lt!5064 lt!5063 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!5053))))

(assert (=> b!18660 (= (apply!27 (+!36 lt!5064 (tuple2!791 lt!5063 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))) lt!5053) (apply!27 lt!5064 lt!5053))))

(declare-fun lt!5066 () Unit!352)

(assert (=> b!18660 (= lt!5066 lt!5056)))

(declare-fun lt!5048 () ListLongMap!537)

(assert (=> b!18660 (= lt!5048 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5052 () (_ BitVec 64))

(assert (=> b!18660 (= lt!5052 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5057 () (_ BitVec 64))

(assert (=> b!18660 (= lt!5057 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(assert (=> b!18660 (= lt!5059 (addApplyDifferent!12 lt!5048 lt!5052 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!5057))))

(assert (=> b!18660 (= (apply!27 (+!36 lt!5048 (tuple2!791 lt!5052 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))) lt!5057) (apply!27 lt!5048 lt!5057))))

(declare-fun b!18661 () Bool)

(assert (=> b!18661 (= e!11953 e!11955)))

(declare-fun res!12931 () Bool)

(assert (=> b!18661 (=> (not res!12931) (not e!11955))))

(assert (=> b!18661 (= res!12931 (contains!216 lt!5067 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)))))

(assert (=> b!18661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(assert (= (and d!3481 c!1941) b!18642))

(assert (= (and d!3481 (not c!1941)) b!18647))

(assert (= (and b!18647 c!1939) b!18646))

(assert (= (and b!18647 (not c!1939)) b!18644))

(assert (= (and b!18644 c!1944) b!18659))

(assert (= (and b!18644 (not c!1944)) b!18645))

(assert (= (or b!18659 b!18645) bm!776))

(assert (= (or b!18646 bm!776) bm!770))

(assert (= (or b!18646 b!18659) bm!771))

(assert (= (or b!18642 bm!770) bm!775))

(assert (= (or b!18642 bm!771) bm!774))

(assert (= (and d!3481 res!12930) b!18655))

(assert (= (and d!3481 c!1942) b!18660))

(assert (= (and d!3481 (not c!1942)) b!18654))

(assert (= (and d!3481 res!12935) b!18641))

(assert (= (and b!18641 res!12936) b!18652))

(assert (= (and b!18641 (not res!12937)) b!18661))

(assert (= (and b!18661 res!12931) b!18651))

(assert (= (and b!18641 res!12933) b!18658))

(assert (= (and b!18658 c!1943) b!18643))

(assert (= (and b!18658 (not c!1943)) b!18648))

(assert (= (and b!18643 res!12934) b!18650))

(assert (= (or b!18643 b!18648) bm!773))

(assert (= (and b!18658 res!12938) b!18649))

(assert (= (and b!18649 c!1940) b!18657))

(assert (= (and b!18649 (not c!1940)) b!18653))

(assert (= (and b!18657 res!12932) b!18656))

(assert (= (or b!18657 b!18653) bm!772))

(declare-fun b_lambda!1447 () Bool)

(assert (=> (not b_lambda!1447) (not b!18651)))

(declare-fun tb!627 () Bool)

(declare-fun t!3181 () Bool)

(assert (=> (and b!18219 (= (defaultEntry!1662 (v!1473 (underlying!62 thiss!848))) (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) t!3181) tb!627))

(declare-fun result!1011 () Bool)

(assert (=> tb!627 (= result!1011 tp_is_empty!915)))

(assert (=> b!18651 t!3181))

(declare-fun b_and!1303 () Bool)

(assert (= b_and!1299 (and (=> t!3181 result!1011) b_and!1303)))

(declare-fun m!13029 () Bool)

(assert (=> bm!774 m!13029))

(declare-fun m!13031 () Bool)

(assert (=> bm!775 m!13031))

(declare-fun m!13033 () Bool)

(assert (=> bm!772 m!13033))

(declare-fun m!13035 () Bool)

(assert (=> b!18660 m!13035))

(declare-fun m!13037 () Bool)

(assert (=> b!18660 m!13037))

(declare-fun m!13039 () Bool)

(assert (=> b!18660 m!13039))

(declare-fun m!13041 () Bool)

(assert (=> b!18660 m!13041))

(declare-fun m!13043 () Bool)

(assert (=> b!18660 m!13043))

(assert (=> b!18660 m!13039))

(declare-fun m!13045 () Bool)

(assert (=> b!18660 m!13045))

(declare-fun m!13047 () Bool)

(assert (=> b!18660 m!13047))

(assert (=> b!18660 m!13031))

(declare-fun m!13049 () Bool)

(assert (=> b!18660 m!13049))

(declare-fun m!13051 () Bool)

(assert (=> b!18660 m!13051))

(assert (=> b!18660 m!13045))

(declare-fun m!13053 () Bool)

(assert (=> b!18660 m!13053))

(declare-fun m!13055 () Bool)

(assert (=> b!18660 m!13055))

(declare-fun m!13057 () Bool)

(assert (=> b!18660 m!13057))

(assert (=> b!18660 m!13043))

(declare-fun m!13059 () Bool)

(assert (=> b!18660 m!13059))

(declare-fun m!13061 () Bool)

(assert (=> b!18660 m!13061))

(assert (=> b!18660 m!13049))

(declare-fun m!13063 () Bool)

(assert (=> b!18660 m!13063))

(declare-fun m!13065 () Bool)

(assert (=> b!18660 m!13065))

(assert (=> d!3481 m!12821))

(assert (=> b!18652 m!13061))

(assert (=> b!18652 m!13061))

(declare-fun m!13067 () Bool)

(assert (=> b!18652 m!13067))

(declare-fun m!13069 () Bool)

(assert (=> b!18656 m!13069))

(assert (=> b!18655 m!13061))

(assert (=> b!18655 m!13061))

(assert (=> b!18655 m!13067))

(declare-fun m!13071 () Bool)

(assert (=> b!18650 m!13071))

(declare-fun m!13073 () Bool)

(assert (=> b!18651 m!13073))

(assert (=> b!18651 m!13061))

(assert (=> b!18651 m!13073))

(declare-fun m!13075 () Bool)

(assert (=> b!18651 m!13075))

(declare-fun m!13077 () Bool)

(assert (=> b!18651 m!13077))

(assert (=> b!18651 m!13061))

(declare-fun m!13079 () Bool)

(assert (=> b!18651 m!13079))

(assert (=> b!18651 m!13075))

(declare-fun m!13081 () Bool)

(assert (=> bm!773 m!13081))

(assert (=> b!18661 m!13061))

(assert (=> b!18661 m!13061))

(declare-fun m!13083 () Bool)

(assert (=> b!18661 m!13083))

(declare-fun m!13085 () Bool)

(assert (=> b!18642 m!13085))

(assert (=> b!18367 d!3481))

(declare-fun d!3483 () Bool)

(declare-fun e!11959 () Bool)

(assert (=> d!3483 e!11959))

(declare-fun res!12941 () Bool)

(assert (=> d!3483 (=> (not res!12941) (not e!11959))))

(assert (=> d!3483 (= res!12941 (and (bvsge (index!2292 lt!4805) #b00000000000000000000000000000000) (bvslt (index!2292 lt!4805) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))))))))

(declare-fun lt!5070 () Unit!352)

(declare-fun choose!191 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 32) (_ BitVec 64) V!1045 Int) Unit!352)

(assert (=> d!3483 (= lt!5070 (choose!191 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (index!2292 lt!4805) key!682 v!259 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> d!3483 (validMask!0 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3483 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (index!2292 lt!4805) key!682 v!259 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5070)))

(declare-fun b!18666 () Bool)

(assert (=> b!18666 (= e!11959 (= (+!36 (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) (tuple2!791 key!682 v!259)) (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (array!1036 (store (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!4805) (ValueCellFull!258 v!259)) (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(assert (= (and d!3483 res!12941) b!18666))

(declare-fun m!13087 () Bool)

(assert (=> d!3483 m!13087))

(assert (=> d!3483 m!12821))

(assert (=> b!18666 m!12825))

(assert (=> b!18666 m!12825))

(assert (=> b!18666 m!12873))

(assert (=> b!18666 m!12789))

(assert (=> b!18666 m!12781))

(assert (=> b!18367 d!3483))

(declare-fun b!18667 () Bool)

(declare-fun e!11960 () Option!65)

(assert (=> b!18667 (= e!11960 (Some!64 (_2!396 (h!1101 (toList!284 lt!4731)))))))

(declare-fun b!18670 () Bool)

(declare-fun e!11961 () Option!65)

(assert (=> b!18670 (= e!11961 None!63)))

(declare-fun b!18668 () Bool)

(assert (=> b!18668 (= e!11960 e!11961)))

(declare-fun c!1946 () Bool)

(assert (=> b!18668 (= c!1946 (and ((_ is Cons!535) (toList!284 lt!4731)) (not (= (_1!396 (h!1101 (toList!284 lt!4731))) (_1!396 (tuple2!791 key!682 v!259))))))))

(declare-fun c!1945 () Bool)

(declare-fun d!3485 () Bool)

(assert (=> d!3485 (= c!1945 (and ((_ is Cons!535) (toList!284 lt!4731)) (= (_1!396 (h!1101 (toList!284 lt!4731))) (_1!396 (tuple2!791 key!682 v!259)))))))

(assert (=> d!3485 (= (getValueByKey!59 (toList!284 lt!4731) (_1!396 (tuple2!791 key!682 v!259))) e!11960)))

(declare-fun b!18669 () Bool)

(assert (=> b!18669 (= e!11961 (getValueByKey!59 (t!3178 (toList!284 lt!4731)) (_1!396 (tuple2!791 key!682 v!259))))))

(assert (= (and d!3485 c!1945) b!18667))

(assert (= (and d!3485 (not c!1945)) b!18668))

(assert (= (and b!18668 c!1946) b!18669))

(assert (= (and b!18668 (not c!1946)) b!18670))

(declare-fun m!13089 () Bool)

(assert (=> b!18669 m!13089))

(assert (=> b!18278 d!3485))

(declare-fun b!18683 () Bool)

(declare-fun e!11970 () SeekEntryResult!43)

(declare-fun e!11968 () SeekEntryResult!43)

(assert (=> b!18683 (= e!11970 e!11968)))

(declare-fun lt!5078 () (_ BitVec 64))

(declare-fun lt!5079 () SeekEntryResult!43)

(assert (=> b!18683 (= lt!5078 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2293 lt!5079)))))

(declare-fun c!1953 () Bool)

(assert (=> b!18683 (= c!1953 (= lt!5078 key!682))))

(declare-fun b!18684 () Bool)

(declare-fun c!1955 () Bool)

(assert (=> b!18684 (= c!1955 (= lt!5078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!11969 () SeekEntryResult!43)

(assert (=> b!18684 (= e!11968 e!11969)))

(declare-fun b!18685 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1037 (_ BitVec 32)) SeekEntryResult!43)

(assert (=> b!18685 (= e!11969 (seekKeyOrZeroReturnVacant!0 (x!4488 lt!5079) (index!2293 lt!5079) (index!2293 lt!5079) key!682 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18686 () Bool)

(assert (=> b!18686 (= e!11970 Undefined!43)))

(declare-fun d!3487 () Bool)

(declare-fun lt!5077 () SeekEntryResult!43)

(assert (=> d!3487 (and (or ((_ is Undefined!43) lt!5077) (not ((_ is Found!43) lt!5077)) (and (bvsge (index!2292 lt!5077) #b00000000000000000000000000000000) (bvslt (index!2292 lt!5077) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))) (or ((_ is Undefined!43) lt!5077) ((_ is Found!43) lt!5077) (not ((_ is MissingZero!43) lt!5077)) (and (bvsge (index!2291 lt!5077) #b00000000000000000000000000000000) (bvslt (index!2291 lt!5077) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))) (or ((_ is Undefined!43) lt!5077) ((_ is Found!43) lt!5077) ((_ is MissingZero!43) lt!5077) (not ((_ is MissingVacant!43) lt!5077)) (and (bvsge (index!2294 lt!5077) #b00000000000000000000000000000000) (bvslt (index!2294 lt!5077) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))) (or ((_ is Undefined!43) lt!5077) (ite ((_ is Found!43) lt!5077) (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!5077)) key!682) (ite ((_ is MissingZero!43) lt!5077) (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2291 lt!5077)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!43) lt!5077) (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2294 lt!5077)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!3487 (= lt!5077 e!11970)))

(declare-fun c!1954 () Bool)

(assert (=> d!3487 (= c!1954 (and ((_ is Intermediate!43) lt!5079) (undefined!855 lt!5079)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!1037 (_ BitVec 32)) SeekEntryResult!43)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3487 (= lt!5079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!682 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))) key!682 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> d!3487 (validMask!0 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3487 (= (seekEntryOrOpen!0 key!682 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5077)))

(declare-fun b!18687 () Bool)

(assert (=> b!18687 (= e!11968 (Found!43 (index!2293 lt!5079)))))

(declare-fun b!18688 () Bool)

(assert (=> b!18688 (= e!11969 (MissingZero!43 (index!2293 lt!5079)))))

(assert (= (and d!3487 c!1954) b!18686))

(assert (= (and d!3487 (not c!1954)) b!18683))

(assert (= (and b!18683 c!1953) b!18687))

(assert (= (and b!18683 (not c!1953)) b!18684))

(assert (= (and b!18684 c!1955) b!18688))

(assert (= (and b!18684 (not c!1955)) b!18685))

(declare-fun m!13091 () Bool)

(assert (=> b!18683 m!13091))

(declare-fun m!13093 () Bool)

(assert (=> b!18685 m!13093))

(declare-fun m!13095 () Bool)

(assert (=> d!3487 m!13095))

(declare-fun m!13097 () Bool)

(assert (=> d!3487 m!13097))

(declare-fun m!13099 () Bool)

(assert (=> d!3487 m!13099))

(assert (=> d!3487 m!13095))

(declare-fun m!13101 () Bool)

(assert (=> d!3487 m!13101))

(assert (=> d!3487 m!12821))

(declare-fun m!13103 () Bool)

(assert (=> d!3487 m!13103))

(assert (=> b!18394 d!3487))

(declare-fun d!3489 () Bool)

(assert (=> d!3489 (= (inRange!0 (ite c!1866 (ite c!1871 (index!2292 lt!4812) (ite c!1873 (index!2291 lt!4818) (index!2294 lt!4818))) (ite c!1872 (index!2292 lt!4823) (ite c!1876 (index!2291 lt!4813) (index!2294 lt!4813)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))) (and (bvsge (ite c!1866 (ite c!1871 (index!2292 lt!4812) (ite c!1873 (index!2291 lt!4818) (index!2294 lt!4818))) (ite c!1872 (index!2292 lt!4823) (ite c!1876 (index!2291 lt!4813) (index!2294 lt!4813)))) #b00000000000000000000000000000000) (bvslt (ite c!1866 (ite c!1871 (index!2292 lt!4812) (ite c!1873 (index!2291 lt!4818) (index!2294 lt!4818))) (ite c!1872 (index!2292 lt!4823) (ite c!1876 (index!2291 lt!4813) (index!2294 lt!4813)))) (bvadd (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000001))))))

(assert (=> bm!681 d!3489))

(declare-fun bm!777 () Bool)

(declare-fun call!780 () ListLongMap!537)

(declare-fun call!783 () ListLongMap!537)

(assert (=> bm!777 (= call!780 call!783)))

(declare-fun b!18689 () Bool)

(declare-fun res!12945 () Bool)

(declare-fun e!11979 () Bool)

(assert (=> b!18689 (=> (not res!12945) (not e!11979))))

(declare-fun e!11980 () Bool)

(assert (=> b!18689 (= res!12945 e!11980)))

(declare-fun res!12949 () Bool)

(assert (=> b!18689 (=> res!12949 e!11980)))

(declare-fun e!11981 () Bool)

(assert (=> b!18689 (= res!12949 (not e!11981))))

(declare-fun res!12948 () Bool)

(assert (=> b!18689 (=> (not res!12948) (not e!11981))))

(assert (=> b!18689 (= res!12948 (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18690 () Bool)

(declare-fun e!11972 () ListLongMap!537)

(declare-fun call!781 () ListLongMap!537)

(assert (=> b!18690 (= e!11972 (+!36 call!781 (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18691 () Bool)

(declare-fun e!11978 () Bool)

(declare-fun e!11973 () Bool)

(assert (=> b!18691 (= e!11978 e!11973)))

(declare-fun res!12946 () Bool)

(declare-fun call!784 () Bool)

(assert (=> b!18691 (= res!12946 call!784)))

(assert (=> b!18691 (=> (not res!12946) (not e!11973))))

(declare-fun bm!778 () Bool)

(declare-fun call!782 () ListLongMap!537)

(assert (=> bm!778 (= call!782 call!781)))

(declare-fun bm!779 () Bool)

(declare-fun call!785 () Bool)

(declare-fun lt!5101 () ListLongMap!537)

(assert (=> bm!779 (= call!785 (contains!216 lt!5101 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!780 () Bool)

(assert (=> bm!780 (= call!784 (contains!216 lt!5101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!1961 () Bool)

(declare-fun b!18692 () Bool)

(assert (=> b!18692 (= c!1961 (and (not (= (bvand (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!11975 () ListLongMap!537)

(declare-fun e!11977 () ListLongMap!537)

(assert (=> b!18692 (= e!11975 e!11977)))

(declare-fun b!18693 () Bool)

(declare-fun call!786 () ListLongMap!537)

(assert (=> b!18693 (= e!11977 call!786)))

(declare-fun b!18694 () Bool)

(assert (=> b!18694 (= e!11975 call!782)))

(declare-fun b!18695 () Bool)

(assert (=> b!18695 (= e!11972 e!11975)))

(declare-fun c!1956 () Bool)

(assert (=> b!18695 (= c!1956 (and (not (= (bvand (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!1958 () Bool)

(declare-fun bm!781 () Bool)

(assert (=> bm!781 (= call!781 (+!36 (ite c!1958 call!783 (ite c!1956 call!780 call!786)) (ite (or c!1958 c!1956) (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))))))

(declare-fun b!18696 () Bool)

(assert (=> b!18696 (= e!11978 (not call!784))))

(declare-fun d!3491 () Bool)

(assert (=> d!3491 e!11979))

(declare-fun res!12947 () Bool)

(assert (=> d!3491 (=> (not res!12947) (not e!11979))))

(assert (=> d!3491 (= res!12947 (or (bvsge #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))))

(declare-fun lt!5088 () ListLongMap!537)

(assert (=> d!3491 (= lt!5101 lt!5088)))

(declare-fun lt!5083 () Unit!352)

(declare-fun e!11983 () Unit!352)

(assert (=> d!3491 (= lt!5083 e!11983)))

(declare-fun c!1959 () Bool)

(declare-fun e!11976 () Bool)

(assert (=> d!3491 (= c!1959 e!11976)))

(declare-fun res!12942 () Bool)

(assert (=> d!3491 (=> (not res!12942) (not e!11976))))

(assert (=> d!3491 (= res!12942 (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(assert (=> d!3491 (= lt!5088 e!11972)))

(assert (=> d!3491 (= c!1958 (and (not (= (bvand (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3491 (validMask!0 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3491 (= (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5101)))

(declare-fun b!18697 () Bool)

(declare-fun e!11971 () Bool)

(assert (=> b!18697 (= e!11979 e!11971)))

(declare-fun c!1957 () Bool)

(assert (=> b!18697 (= c!1957 (not (= (bvand (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18698 () Bool)

(assert (=> b!18698 (= e!11973 (= (apply!27 lt!5101 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18699 () Bool)

(declare-fun e!11982 () Bool)

(assert (=> b!18699 (= e!11982 (= (apply!27 lt!5101 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)) (get!348 (select (arr!499 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000) (dynLambda!133 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18699 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!589 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(assert (=> b!18699 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18700 () Bool)

(assert (=> b!18700 (= e!11981 (validKeyInArray!0 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)))))

(declare-fun b!18701 () Bool)

(assert (=> b!18701 (= e!11971 (not call!785))))

(declare-fun b!18702 () Bool)

(declare-fun Unit!365 () Unit!352)

(assert (=> b!18702 (= e!11983 Unit!365)))

(declare-fun bm!782 () Bool)

(assert (=> bm!782 (= call!783 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18703 () Bool)

(assert (=> b!18703 (= e!11976 (validKeyInArray!0 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)))))

(declare-fun b!18704 () Bool)

(declare-fun e!11974 () Bool)

(assert (=> b!18704 (= e!11974 (= (apply!27 lt!5101 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun bm!783 () Bool)

(assert (=> bm!783 (= call!786 call!780)))

(declare-fun b!18705 () Bool)

(assert (=> b!18705 (= e!11971 e!11974)))

(declare-fun res!12944 () Bool)

(assert (=> b!18705 (= res!12944 call!785)))

(assert (=> b!18705 (=> (not res!12944) (not e!11974))))

(declare-fun b!18706 () Bool)

(declare-fun res!12950 () Bool)

(assert (=> b!18706 (=> (not res!12950) (not e!11979))))

(assert (=> b!18706 (= res!12950 e!11978)))

(declare-fun c!1960 () Bool)

(assert (=> b!18706 (= c!1960 (not (= (bvand (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!18707 () Bool)

(assert (=> b!18707 (= e!11977 call!782)))

(declare-fun b!18708 () Bool)

(declare-fun lt!5093 () Unit!352)

(assert (=> b!18708 (= e!11983 lt!5093)))

(declare-fun lt!5099 () ListLongMap!537)

(assert (=> b!18708 (= lt!5099 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5081 () (_ BitVec 64))

(assert (=> b!18708 (= lt!5081 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5092 () (_ BitVec 64))

(assert (=> b!18708 (= lt!5092 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(declare-fun lt!5085 () Unit!352)

(assert (=> b!18708 (= lt!5085 (addStillContains!12 lt!5099 lt!5081 (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5092))))

(assert (=> b!18708 (contains!216 (+!36 lt!5099 (tuple2!791 lt!5081 (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))) lt!5092)))

(declare-fun lt!5089 () Unit!352)

(assert (=> b!18708 (= lt!5089 lt!5085)))

(declare-fun lt!5096 () ListLongMap!537)

(assert (=> b!18708 (= lt!5096 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5084 () (_ BitVec 64))

(assert (=> b!18708 (= lt!5084 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5080 () (_ BitVec 64))

(assert (=> b!18708 (= lt!5080 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(declare-fun lt!5094 () Unit!352)

(assert (=> b!18708 (= lt!5094 (addApplyDifferent!12 lt!5096 lt!5084 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!5080))))

(assert (=> b!18708 (= (apply!27 (+!36 lt!5096 (tuple2!791 lt!5084 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))) lt!5080) (apply!27 lt!5096 lt!5080))))

(declare-fun lt!5095 () Unit!352)

(assert (=> b!18708 (= lt!5095 lt!5094)))

(declare-fun lt!5098 () ListLongMap!537)

(assert (=> b!18708 (= lt!5098 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5097 () (_ BitVec 64))

(assert (=> b!18708 (= lt!5097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5087 () (_ BitVec 64))

(assert (=> b!18708 (= lt!5087 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(declare-fun lt!5090 () Unit!352)

(assert (=> b!18708 (= lt!5090 (addApplyDifferent!12 lt!5098 lt!5097 (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5087))))

(assert (=> b!18708 (= (apply!27 (+!36 lt!5098 (tuple2!791 lt!5097 (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))) lt!5087) (apply!27 lt!5098 lt!5087))))

(declare-fun lt!5100 () Unit!352)

(assert (=> b!18708 (= lt!5100 lt!5090)))

(declare-fun lt!5082 () ListLongMap!537)

(assert (=> b!18708 (= lt!5082 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite (and c!1869 c!1874) lt!4807 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (ite (and c!1869 c!1874) v!259 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5086 () (_ BitVec 64))

(assert (=> b!18708 (= lt!5086 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5091 () (_ BitVec 64))

(assert (=> b!18708 (= lt!5091 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(assert (=> b!18708 (= lt!5093 (addApplyDifferent!12 lt!5082 lt!5086 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!5091))))

(assert (=> b!18708 (= (apply!27 (+!36 lt!5082 (tuple2!791 lt!5086 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))) lt!5091) (apply!27 lt!5082 lt!5091))))

(declare-fun b!18709 () Bool)

(assert (=> b!18709 (= e!11980 e!11982)))

(declare-fun res!12943 () Bool)

(assert (=> b!18709 (=> (not res!12943) (not e!11982))))

(assert (=> b!18709 (= res!12943 (contains!216 lt!5101 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)))))

(assert (=> b!18709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(assert (= (and d!3491 c!1958) b!18690))

(assert (= (and d!3491 (not c!1958)) b!18695))

(assert (= (and b!18695 c!1956) b!18694))

(assert (= (and b!18695 (not c!1956)) b!18692))

(assert (= (and b!18692 c!1961) b!18707))

(assert (= (and b!18692 (not c!1961)) b!18693))

(assert (= (or b!18707 b!18693) bm!783))

(assert (= (or b!18694 bm!783) bm!777))

(assert (= (or b!18694 b!18707) bm!778))

(assert (= (or b!18690 bm!777) bm!782))

(assert (= (or b!18690 bm!778) bm!781))

(assert (= (and d!3491 res!12942) b!18703))

(assert (= (and d!3491 c!1959) b!18708))

(assert (= (and d!3491 (not c!1959)) b!18702))

(assert (= (and d!3491 res!12947) b!18689))

(assert (= (and b!18689 res!12948) b!18700))

(assert (= (and b!18689 (not res!12949)) b!18709))

(assert (= (and b!18709 res!12943) b!18699))

(assert (= (and b!18689 res!12945) b!18706))

(assert (= (and b!18706 c!1960) b!18691))

(assert (= (and b!18706 (not c!1960)) b!18696))

(assert (= (and b!18691 res!12946) b!18698))

(assert (= (or b!18691 b!18696) bm!780))

(assert (= (and b!18706 res!12950) b!18697))

(assert (= (and b!18697 c!1957) b!18705))

(assert (= (and b!18697 (not c!1957)) b!18701))

(assert (= (and b!18705 res!12944) b!18704))

(assert (= (or b!18705 b!18701) bm!779))

(declare-fun b_lambda!1449 () Bool)

(assert (=> (not b_lambda!1449) (not b!18699)))

(assert (=> b!18699 t!3181))

(declare-fun b_and!1305 () Bool)

(assert (= b_and!1303 (and (=> t!3181 result!1011) b_and!1305)))

(declare-fun m!13105 () Bool)

(assert (=> bm!781 m!13105))

(declare-fun m!13107 () Bool)

(assert (=> bm!782 m!13107))

(declare-fun m!13109 () Bool)

(assert (=> bm!779 m!13109))

(declare-fun m!13111 () Bool)

(assert (=> b!18708 m!13111))

(declare-fun m!13113 () Bool)

(assert (=> b!18708 m!13113))

(declare-fun m!13115 () Bool)

(assert (=> b!18708 m!13115))

(declare-fun m!13117 () Bool)

(assert (=> b!18708 m!13117))

(declare-fun m!13119 () Bool)

(assert (=> b!18708 m!13119))

(assert (=> b!18708 m!13115))

(declare-fun m!13121 () Bool)

(assert (=> b!18708 m!13121))

(declare-fun m!13123 () Bool)

(assert (=> b!18708 m!13123))

(assert (=> b!18708 m!13107))

(declare-fun m!13125 () Bool)

(assert (=> b!18708 m!13125))

(declare-fun m!13127 () Bool)

(assert (=> b!18708 m!13127))

(assert (=> b!18708 m!13121))

(declare-fun m!13129 () Bool)

(assert (=> b!18708 m!13129))

(declare-fun m!13131 () Bool)

(assert (=> b!18708 m!13131))

(declare-fun m!13133 () Bool)

(assert (=> b!18708 m!13133))

(assert (=> b!18708 m!13119))

(declare-fun m!13135 () Bool)

(assert (=> b!18708 m!13135))

(assert (=> b!18708 m!13061))

(assert (=> b!18708 m!13125))

(declare-fun m!13137 () Bool)

(assert (=> b!18708 m!13137))

(declare-fun m!13139 () Bool)

(assert (=> b!18708 m!13139))

(assert (=> d!3491 m!12821))

(assert (=> b!18700 m!13061))

(assert (=> b!18700 m!13061))

(assert (=> b!18700 m!13067))

(declare-fun m!13141 () Bool)

(assert (=> b!18704 m!13141))

(assert (=> b!18703 m!13061))

(assert (=> b!18703 m!13061))

(assert (=> b!18703 m!13067))

(declare-fun m!13143 () Bool)

(assert (=> b!18698 m!13143))

(declare-fun m!13145 () Bool)

(assert (=> b!18699 m!13145))

(assert (=> b!18699 m!13061))

(assert (=> b!18699 m!13145))

(assert (=> b!18699 m!13075))

(declare-fun m!13147 () Bool)

(assert (=> b!18699 m!13147))

(assert (=> b!18699 m!13061))

(declare-fun m!13149 () Bool)

(assert (=> b!18699 m!13149))

(assert (=> b!18699 m!13075))

(declare-fun m!13151 () Bool)

(assert (=> bm!780 m!13151))

(assert (=> b!18709 m!13061))

(assert (=> b!18709 m!13061))

(declare-fun m!13153 () Bool)

(assert (=> b!18709 m!13153))

(declare-fun m!13155 () Bool)

(assert (=> b!18690 m!13155))

(assert (=> bm!689 d!3491))

(declare-fun d!3493 () Bool)

(declare-fun res!12955 () Bool)

(declare-fun e!11988 () Bool)

(assert (=> d!3493 (=> res!12955 e!11988)))

(assert (=> d!3493 (= res!12955 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000) key!682))))

(assert (=> d!3493 (= (arrayContainsKey!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 #b00000000000000000000000000000000) e!11988)))

(declare-fun b!18714 () Bool)

(declare-fun e!11989 () Bool)

(assert (=> b!18714 (= e!11988 e!11989)))

(declare-fun res!12956 () Bool)

(assert (=> b!18714 (=> (not res!12956) (not e!11989))))

(assert (=> b!18714 (= res!12956 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18715 () Bool)

(assert (=> b!18715 (= e!11989 (arrayContainsKey!0 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!3493 (not res!12955)) b!18714))

(assert (= (and b!18714 res!12956) b!18715))

(assert (=> d!3493 m!13061))

(declare-fun m!13157 () Bool)

(assert (=> b!18715 m!13157))

(assert (=> bm!695 d!3493))

(declare-fun d!3495 () Bool)

(declare-fun e!11990 () Bool)

(assert (=> d!3495 e!11990))

(declare-fun res!12958 () Bool)

(assert (=> d!3495 (=> (not res!12958) (not e!11990))))

(declare-fun lt!5104 () ListLongMap!537)

(assert (=> d!3495 (= res!12958 (contains!216 lt!5104 (_1!396 (tuple2!791 key!682 v!259))))))

(declare-fun lt!5102 () List!539)

(assert (=> d!3495 (= lt!5104 (ListLongMap!538 lt!5102))))

(declare-fun lt!5105 () Unit!352)

(declare-fun lt!5103 () Unit!352)

(assert (=> d!3495 (= lt!5105 lt!5103)))

(assert (=> d!3495 (= (getValueByKey!59 lt!5102 (_1!396 (tuple2!791 key!682 v!259))) (Some!64 (_2!396 (tuple2!791 key!682 v!259))))))

(assert (=> d!3495 (= lt!5103 (lemmaContainsTupThenGetReturnValue!16 lt!5102 (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259))))))

(assert (=> d!3495 (= lt!5102 (insertStrictlySorted!16 (toList!284 call!697) (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259))))))

(assert (=> d!3495 (= (+!36 call!697 (tuple2!791 key!682 v!259)) lt!5104)))

(declare-fun b!18716 () Bool)

(declare-fun res!12957 () Bool)

(assert (=> b!18716 (=> (not res!12957) (not e!11990))))

(assert (=> b!18716 (= res!12957 (= (getValueByKey!59 (toList!284 lt!5104) (_1!396 (tuple2!791 key!682 v!259))) (Some!64 (_2!396 (tuple2!791 key!682 v!259)))))))

(declare-fun b!18717 () Bool)

(assert (=> b!18717 (= e!11990 (contains!217 (toList!284 lt!5104) (tuple2!791 key!682 v!259)))))

(assert (= (and d!3495 res!12958) b!18716))

(assert (= (and b!18716 res!12957) b!18717))

(declare-fun m!13159 () Bool)

(assert (=> d!3495 m!13159))

(declare-fun m!13161 () Bool)

(assert (=> d!3495 m!13161))

(declare-fun m!13163 () Bool)

(assert (=> d!3495 m!13163))

(declare-fun m!13165 () Bool)

(assert (=> d!3495 m!13165))

(declare-fun m!13167 () Bool)

(assert (=> b!18716 m!13167))

(declare-fun m!13169 () Bool)

(assert (=> b!18717 m!13169))

(assert (=> b!18370 d!3495))

(declare-fun b!18746 () Bool)

(declare-fun e!12007 () tuple2!794)

(declare-fun lt!5192 () tuple2!794)

(assert (=> b!18746 (= e!12007 (tuple2!795 (_1!398 lt!5192) (_2!398 lt!5192)))))

(declare-fun lt!5201 () ListLongMap!537)

(declare-fun call!820 () ListLongMap!537)

(assert (=> b!18746 (= lt!5201 call!820)))

(declare-fun lt!5179 () (_ BitVec 64))

(assert (=> b!18746 (= lt!5179 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5186 () Unit!352)

(declare-fun call!824 () Unit!352)

(assert (=> b!18746 (= lt!5186 call!824)))

(declare-fun call!821 () ListLongMap!537)

(declare-fun call!814 () ListLongMap!537)

(assert (=> b!18746 (= call!821 call!814)))

(declare-fun lt!5188 () Unit!352)

(assert (=> b!18746 (= lt!5188 lt!5186)))

(declare-fun lt!5170 () ListLongMap!537)

(declare-fun call!816 () ListLongMap!537)

(assert (=> b!18746 (= lt!5170 call!816)))

(declare-fun lt!5184 () (_ BitVec 64))

(assert (=> b!18746 (= lt!5184 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5181 () Unit!352)

(declare-fun call!819 () Unit!352)

(assert (=> b!18746 (= lt!5181 call!819)))

(declare-fun call!813 () ListLongMap!537)

(declare-fun call!825 () ListLongMap!537)

(assert (=> b!18746 (= call!813 call!825)))

(declare-fun lt!5176 () Unit!352)

(assert (=> b!18746 (= lt!5176 lt!5181)))

(declare-fun call!822 () tuple2!794)

(assert (=> b!18746 (= lt!5192 call!822)))

(declare-fun b!18747 () Bool)

(declare-fun e!12010 () tuple2!794)

(assert (=> b!18747 (= e!12010 (tuple2!795 true (v!1473 (_2!402 lt!4854))))))

(declare-fun c!1976 () Bool)

(declare-fun bm!810 () Bool)

(declare-fun lt!5187 () (_ BitVec 64))

(declare-fun lt!5174 () V!1045)

(declare-fun lt!5175 () ListLongMap!537)

(declare-fun lt!5190 () (_ BitVec 64))

(declare-fun call!815 () ListLongMap!537)

(assert (=> bm!810 (= call!815 (+!36 (ite c!1976 lt!5170 lt!5175) (ite c!1976 (tuple2!791 lt!5190 lt!5174) (tuple2!791 lt!5187 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))))))))

(declare-fun bm!811 () Bool)

(declare-fun call!817 () ListLongMap!537)

(declare-fun lt!5198 () (_ BitVec 64))

(declare-fun call!818 () ListLongMap!537)

(assert (=> bm!811 (= call!825 (+!36 (ite c!1976 call!817 call!818) (ite c!1976 (tuple2!791 lt!5190 lt!5174) (tuple2!791 lt!5198 (minValue!1598 (v!1473 (underlying!62 thiss!848)))))))))

(declare-fun c!1979 () Bool)

(declare-fun bm!812 () Bool)

(declare-fun lt!5172 () tuple2!794)

(assert (=> bm!812 (= call!822 (repackFrom!2 thiss!848 (ite c!1979 (_2!398 lt!5172) (v!1473 (_2!402 lt!4854))) (bvsub (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun bm!813 () Bool)

(declare-fun lt!5197 () ListLongMap!537)

(declare-fun addCommutativeForDiffKeys!2 (ListLongMap!537 (_ BitVec 64) V!1045 (_ BitVec 64) V!1045) Unit!352)

(assert (=> bm!813 (= call!819 (addCommutativeForDiffKeys!2 (ite c!1976 lt!5170 lt!5197) lt!5190 lt!5174 (ite c!1976 lt!5184 lt!5198) (minValue!1598 (v!1473 (underlying!62 thiss!848)))))))

(declare-fun bm!814 () Bool)

(assert (=> bm!814 (= call!817 (+!36 (ite c!1976 lt!5170 lt!5175) (ite c!1976 (tuple2!791 lt!5184 (minValue!1598 (v!1473 (underlying!62 thiss!848)))) (tuple2!791 lt!5190 lt!5174))))))

(declare-fun bm!815 () Bool)

(assert (=> bm!815 (= call!813 (+!36 (ite c!1976 call!815 call!820) (ite c!1976 (tuple2!791 lt!5184 (minValue!1598 (v!1473 (underlying!62 thiss!848)))) (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))))))))

(declare-fun lt!5194 () (_ BitVec 32))

(declare-fun e!12014 () Bool)

(declare-fun b!18748 () Bool)

(assert (=> b!18748 (= e!12014 (arrayContainsKey!0 (_keys!3087 (v!1473 (underlying!62 thiss!848))) lt!5190 lt!5194))))

(declare-fun b!18749 () Bool)

(declare-fun e!12011 () tuple2!794)

(assert (=> b!18749 (= e!12011 (tuple2!795 false (_2!398 lt!5172)))))

(declare-fun b!18750 () Bool)

(assert (=> b!18750 (= e!12007 (tuple2!795 true (_2!398 lt!5172)))))

(assert (=> b!18750 (= lt!5175 call!820)))

(assert (=> b!18750 (= lt!5187 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5193 () Unit!352)

(assert (=> b!18750 (= lt!5193 call!824)))

(assert (=> b!18750 (= call!821 call!816)))

(declare-fun lt!5191 () Unit!352)

(assert (=> b!18750 (= lt!5191 lt!5193)))

(assert (=> b!18750 (= lt!5197 call!813)))

(assert (=> b!18750 (= lt!5198 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5185 () Unit!352)

(assert (=> b!18750 (= lt!5185 call!819)))

(assert (=> b!18750 (= call!825 call!814)))

(declare-fun lt!5189 () Unit!352)

(assert (=> b!18750 (= lt!5189 lt!5185)))

(declare-fun b!18752 () Bool)

(declare-fun e!12013 () Unit!352)

(declare-fun Unit!366 () Unit!352)

(assert (=> b!18752 (= e!12013 Unit!366)))

(declare-fun bm!816 () Bool)

(declare-fun call!823 () ListLongMap!537)

(assert (=> bm!816 (= call!821 (+!36 (ite c!1976 call!823 call!817) (ite c!1976 (tuple2!791 lt!5179 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))) (tuple2!791 lt!5187 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))))))))

(declare-fun b!18753 () Bool)

(declare-fun e!12009 () tuple2!794)

(assert (=> b!18753 (= e!12009 e!12010)))

(declare-fun c!1978 () Bool)

(assert (=> b!18753 (= c!1978 (bvsgt (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!817 () Bool)

(assert (=> bm!817 (= call!824 (addCommutativeForDiffKeys!2 (ite c!1976 lt!5201 lt!5175) lt!5190 lt!5174 (ite c!1976 lt!5179 lt!5187) (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))))))

(declare-fun b!18754 () Bool)

(assert (=> b!18754 (= e!12009 e!12011)))

(assert (=> b!18754 (= lt!5172 (update!12 (v!1473 (_2!402 lt!4854)) lt!5190 lt!5174))))

(declare-fun c!1975 () Bool)

(declare-fun lt!5195 () ListLongMap!537)

(assert (=> b!18754 (= c!1975 (contains!216 lt!5195 lt!5190))))

(declare-fun lt!5199 () Unit!352)

(assert (=> b!18754 (= lt!5199 e!12013)))

(declare-fun c!1974 () Bool)

(assert (=> b!18754 (= c!1974 (_1!398 lt!5172))))

(declare-fun bm!818 () Bool)

(assert (=> bm!818 (= call!818 (+!36 (ite c!1976 lt!5201 lt!5197) (ite c!1976 (tuple2!791 lt!5179 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))) (tuple2!791 lt!5190 lt!5174))))))

(declare-fun b!18755 () Bool)

(declare-fun e!12008 () Bool)

(declare-fun lt!5196 () tuple2!794)

(assert (=> b!18755 (= e!12008 (= (map!356 (_2!398 lt!5196)) (map!356 (v!1473 (underlying!62 thiss!848)))))))

(declare-fun bm!819 () Bool)

(assert (=> bm!819 (= call!816 (+!36 (ite c!1976 call!820 call!815) (ite c!1976 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 thiss!848)))) (tuple2!791 lt!5190 lt!5174))))))

(declare-fun bm!820 () Bool)

(assert (=> bm!820 (= call!820 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 thiss!848))) (_values!1659 (v!1473 (underlying!62 thiss!848))) (mask!4595 (v!1473 (underlying!62 thiss!848))) (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))) (bvadd (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1662 (v!1473 (underlying!62 thiss!848)))))))

(declare-fun bm!821 () Bool)

(assert (=> bm!821 (= call!814 (+!36 (ite c!1976 call!818 call!823) (tuple2!791 lt!5190 lt!5174)))))

(declare-fun bm!822 () Bool)

(assert (=> bm!822 (= call!823 (+!36 (ite c!1976 lt!5201 lt!5197) (ite c!1976 (tuple2!791 lt!5190 lt!5174) (tuple2!791 lt!5198 (minValue!1598 (v!1473 (underlying!62 thiss!848)))))))))

(declare-fun b!18756 () Bool)

(declare-fun lt!5183 () tuple2!794)

(assert (=> b!18756 (= lt!5183 call!822)))

(assert (=> b!18756 (= e!12010 (tuple2!795 (_1!398 lt!5183) (_2!398 lt!5183)))))

(declare-fun b!18757 () Bool)

(declare-fun e!12012 () Bool)

(assert (=> b!18757 (= e!12012 e!12008)))

(declare-fun res!12963 () Bool)

(assert (=> b!18757 (=> (not res!12963) (not e!12008))))

(assert (=> b!18757 (= res!12963 (valid!49 (_2!398 lt!5196)))))

(declare-fun b!18751 () Bool)

(assert (=> b!18751 (= e!12014 (ite (= lt!5190 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3497 () Bool)

(assert (=> d!3497 e!12012))

(declare-fun res!12964 () Bool)

(assert (=> d!3497 (=> res!12964 e!12012)))

(assert (=> d!3497 (= res!12964 (not (_1!398 lt!5196)))))

(assert (=> d!3497 (= lt!5196 e!12009)))

(assert (=> d!3497 (= c!1979 (and (not (= lt!5190 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!5190 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3497 (= lt!5195 (map!356 (v!1473 (_2!402 lt!4854))))))

(assert (=> d!3497 (= lt!5174 (get!348 (select (arr!499 (_values!1659 (v!1473 (underlying!62 thiss!848)))) (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001)) (dynLambda!133 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3497 (= lt!5190 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001)))))

(assert (=> d!3497 (valid!47 thiss!848)))

(assert (=> d!3497 (= (repackFrom!2 thiss!848 (v!1473 (_2!402 lt!4854)) (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001)) lt!5196)))

(declare-fun b!18758 () Bool)

(assert (=> b!18758 false))

(declare-fun lt!5180 () Unit!352)

(declare-fun lt!5178 () Unit!352)

(assert (=> b!18758 (= lt!5180 lt!5178)))

(declare-fun lt!5177 () (_ BitVec 32))

(assert (=> b!18758 (not (arrayContainsKey!0 (_keys!3087 (v!1473 (underlying!62 thiss!848))) lt!5190 lt!5177))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!1037 (_ BitVec 32) (_ BitVec 64) List!541) Unit!352)

(assert (=> b!18758 (= lt!5178 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3087 (v!1473 (underlying!62 thiss!848))) lt!5177 lt!5190 (Cons!537 lt!5190 Nil!538)))))

(assert (=> b!18758 (= lt!5177 (bvadd (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!5182 () Unit!352)

(declare-fun lt!5171 () Unit!352)

(assert (=> b!18758 (= lt!5182 lt!5171)))

(assert (=> b!18758 (arrayNoDuplicates!0 (_keys!3087 (v!1473 (underlying!62 thiss!848))) (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001) Nil!538)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!1037 (_ BitVec 32) (_ BitVec 32)) Unit!352)

(assert (=> b!18758 (= lt!5171 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3087 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000000 (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5173 () Unit!352)

(declare-fun lt!5200 () Unit!352)

(assert (=> b!18758 (= lt!5173 lt!5200)))

(assert (=> b!18758 e!12014))

(declare-fun c!1977 () Bool)

(assert (=> b!18758 (= c!1977 (and (not (= lt!5190 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!5190 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!2 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 64) (_ BitVec 32) Int) Unit!352)

(assert (=> b!18758 (= lt!5200 (lemmaListMapContainsThenArrayContainsFrom!2 (_keys!3087 (v!1473 (underlying!62 thiss!848))) (_values!1659 (v!1473 (underlying!62 thiss!848))) (mask!4595 (v!1473 (underlying!62 thiss!848))) (extraKeys!1575 (v!1473 (underlying!62 thiss!848))) (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))) lt!5190 lt!5194 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848)))))))

(assert (=> b!18758 (= lt!5194 (bvadd (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!367 () Unit!352)

(assert (=> b!18758 (= e!12013 Unit!367)))

(declare-fun b!18759 () Bool)

(assert (=> b!18759 (= c!1976 (bvsgt (bvsub (size!590 (_keys!3087 (v!1473 (underlying!62 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!18759 (= e!12011 e!12007)))

(assert (= (and d!3497 c!1979) b!18754))

(assert (= (and d!3497 (not c!1979)) b!18753))

(assert (= (and b!18754 c!1975) b!18758))

(assert (= (and b!18754 (not c!1975)) b!18752))

(assert (= (and b!18758 c!1977) b!18748))

(assert (= (and b!18758 (not c!1977)) b!18751))

(assert (= (and b!18754 c!1974) b!18759))

(assert (= (and b!18754 (not c!1974)) b!18749))

(assert (= (and b!18759 c!1976) b!18746))

(assert (= (and b!18759 (not c!1976)) b!18750))

(assert (= (or b!18746 b!18750) bm!822))

(assert (= (or b!18746 b!18750) bm!810))

(assert (= (or b!18746 b!18750) bm!820))

(assert (= (or b!18746 b!18750) bm!814))

(assert (= (or b!18746 b!18750) bm!818))

(assert (= (or b!18746 b!18750) bm!813))

(assert (= (or b!18746 b!18750) bm!817))

(assert (= (or b!18746 b!18750) bm!811))

(assert (= (or b!18746 b!18750) bm!816))

(assert (= (or b!18746 b!18750) bm!815))

(assert (= (or b!18746 b!18750) bm!821))

(assert (= (or b!18746 b!18750) bm!819))

(assert (= (and b!18753 c!1978) b!18756))

(assert (= (and b!18753 (not c!1978)) b!18747))

(assert (= (or b!18746 b!18756) bm!812))

(assert (= (and d!3497 (not res!12964)) b!18757))

(assert (= (and b!18757 res!12963) b!18755))

(declare-fun b_lambda!1451 () Bool)

(assert (=> (not b_lambda!1451) (not d!3497)))

(declare-fun t!3183 () Bool)

(declare-fun tb!629 () Bool)

(assert (=> (and b!18219 (= (defaultEntry!1662 (v!1473 (underlying!62 thiss!848))) (defaultEntry!1662 (v!1473 (underlying!62 thiss!848)))) t!3183) tb!629))

(declare-fun result!1015 () Bool)

(assert (=> tb!629 (= result!1015 tp_is_empty!915)))

(assert (=> d!3497 t!3183))

(declare-fun b_and!1307 () Bool)

(assert (= b_and!1305 (and (=> t!3183 result!1015) b_and!1307)))

(declare-fun m!13171 () Bool)

(assert (=> b!18748 m!13171))

(declare-fun m!13173 () Bool)

(assert (=> bm!813 m!13173))

(declare-fun m!13175 () Bool)

(assert (=> bm!811 m!13175))

(declare-fun m!13177 () Bool)

(assert (=> bm!812 m!13177))

(declare-fun m!13179 () Bool)

(assert (=> bm!819 m!13179))

(declare-fun m!13181 () Bool)

(assert (=> bm!814 m!13181))

(declare-fun m!13183 () Bool)

(assert (=> bm!815 m!13183))

(declare-fun m!13185 () Bool)

(assert (=> b!18757 m!13185))

(declare-fun m!13187 () Bool)

(assert (=> bm!821 m!13187))

(declare-fun m!13189 () Bool)

(assert (=> bm!810 m!13189))

(declare-fun m!13191 () Bool)

(assert (=> bm!822 m!13191))

(declare-fun m!13193 () Bool)

(assert (=> bm!816 m!13193))

(declare-fun m!13195 () Bool)

(assert (=> b!18758 m!13195))

(declare-fun m!13197 () Bool)

(assert (=> b!18758 m!13197))

(declare-fun m!13199 () Bool)

(assert (=> b!18758 m!13199))

(declare-fun m!13201 () Bool)

(assert (=> b!18758 m!13201))

(declare-fun m!13203 () Bool)

(assert (=> b!18758 m!13203))

(declare-fun m!13205 () Bool)

(assert (=> bm!817 m!13205))

(declare-fun m!13207 () Bool)

(assert (=> b!18755 m!13207))

(assert (=> b!18755 m!12723))

(assert (=> d!3497 m!12681))

(declare-fun m!13209 () Bool)

(assert (=> d!3497 m!13209))

(declare-fun m!13211 () Bool)

(assert (=> d!3497 m!13211))

(declare-fun m!13213 () Bool)

(assert (=> d!3497 m!13213))

(assert (=> d!3497 m!13211))

(assert (=> d!3497 m!13209))

(declare-fun m!13215 () Bool)

(assert (=> d!3497 m!13215))

(declare-fun m!13217 () Bool)

(assert (=> d!3497 m!13217))

(declare-fun m!13219 () Bool)

(assert (=> bm!820 m!13219))

(declare-fun m!13221 () Bool)

(assert (=> bm!818 m!13221))

(declare-fun m!13223 () Bool)

(assert (=> b!18754 m!13223))

(declare-fun m!13225 () Bool)

(assert (=> b!18754 m!13225))

(assert (=> b!18421 d!3497))

(assert (=> b!18288 d!3461))

(assert (=> b!18288 d!3463))

(declare-fun d!3499 () Bool)

(declare-fun e!12023 () Bool)

(assert (=> d!3499 e!12023))

(declare-fun res!12969 () Bool)

(assert (=> d!3499 (=> (not res!12969) (not e!12023))))

(declare-fun lt!5268 () LongMapFixedSize!102)

(assert (=> d!3499 (= res!12969 (valid!49 lt!5268))))

(declare-fun lt!5261 () LongMapFixedSize!102)

(assert (=> d!3499 (= lt!5268 lt!5261)))

(declare-fun lt!5254 () Unit!352)

(declare-fun e!12021 () Unit!352)

(assert (=> d!3499 (= lt!5254 e!12021)))

(declare-fun c!1984 () Bool)

(assert (=> d!3499 (= c!1984 (not (= (map!356 lt!5261) (ListLongMap!538 Nil!536))))))

(declare-fun lt!5250 () Unit!352)

(declare-fun lt!5248 () Unit!352)

(assert (=> d!3499 (= lt!5250 lt!5248)))

(declare-fun lt!5251 () array!1037)

(declare-fun lt!5266 () (_ BitVec 32))

(declare-fun lt!5270 () List!541)

(assert (=> d!3499 (arrayNoDuplicates!0 lt!5251 lt!5266 lt!5270)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1037 (_ BitVec 32) (_ BitVec 32) List!541) Unit!352)

(assert (=> d!3499 (= lt!5248 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5251 lt!5266 (bvadd lt!4847 #b00000000000000000000000000000001) lt!5270))))

(assert (=> d!3499 (= lt!5270 Nil!538)))

(assert (=> d!3499 (= lt!5266 #b00000000000000000000000000000000)))

(assert (=> d!3499 (= lt!5251 (array!1038 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4847 #b00000000000000000000000000000001)))))

(declare-fun lt!5263 () Unit!352)

(declare-fun lt!5264 () Unit!352)

(assert (=> d!3499 (= lt!5263 lt!5264)))

(declare-fun lt!5269 () (_ BitVec 32))

(declare-fun lt!5260 () array!1037)

(assert (=> d!3499 (arrayForallSeekEntryOrOpenFound!0 lt!5269 lt!5260 lt!4847)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1037 (_ BitVec 32) (_ BitVec 32)) Unit!352)

(assert (=> d!3499 (= lt!5264 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5260 lt!4847 lt!5269))))

(assert (=> d!3499 (= lt!5269 #b00000000000000000000000000000000)))

(assert (=> d!3499 (= lt!5260 (array!1038 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4847 #b00000000000000000000000000000001)))))

(declare-fun lt!5267 () Unit!352)

(declare-fun lt!5259 () Unit!352)

(assert (=> d!3499 (= lt!5267 lt!5259)))

(declare-fun lt!5256 () array!1037)

(declare-fun lt!5253 () (_ BitVec 32))

(declare-fun lt!5262 () (_ BitVec 32))

(assert (=> d!3499 (= (arrayCountValidKeys!0 lt!5256 lt!5253 lt!5262) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1037 (_ BitVec 32) (_ BitVec 32)) Unit!352)

(assert (=> d!3499 (= lt!5259 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5256 lt!5253 lt!5262))))

(assert (=> d!3499 (= lt!5262 (bvadd lt!4847 #b00000000000000000000000000000001))))

(assert (=> d!3499 (= lt!5253 #b00000000000000000000000000000000)))

(assert (=> d!3499 (= lt!5256 (array!1038 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4847 #b00000000000000000000000000000001)))))

(assert (=> d!3499 (= lt!5261 (LongMapFixedSize!103 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848))) lt!4847 #b00000000000000000000000000000000 (dynLambda!133 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!133 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1038 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4847 #b00000000000000000000000000000001)) (array!1036 ((as const (Array (_ BitVec 32) ValueCell!258)) EmptyCell!258) (bvadd lt!4847 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3499 (validMask!0 lt!4847)))

(assert (=> d!3499 (= (getNewLongMapFixedSize!8 lt!4847 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848)))) lt!5268)))

(declare-fun b!18772 () Bool)

(assert (=> b!18772 (= e!12023 (= (map!356 lt!5268) (ListLongMap!538 Nil!536)))))

(declare-fun b!18773 () Bool)

(declare-fun e!12022 () Bool)

(declare-fun lt!5255 () array!1037)

(declare-fun lt!5265 () tuple2!790)

(assert (=> b!18773 (= e!12022 (arrayContainsKey!0 lt!5255 (_1!396 lt!5265) #b00000000000000000000000000000000))))

(declare-fun b!18774 () Bool)

(declare-fun Unit!368 () Unit!352)

(assert (=> b!18774 (= e!12021 Unit!368)))

(declare-fun head!819 (List!539) tuple2!790)

(assert (=> b!18774 (= lt!5265 (head!819 (toList!284 (map!356 lt!5261))))))

(assert (=> b!18774 (= lt!5255 (array!1038 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4847 #b00000000000000000000000000000001)))))

(declare-fun lt!5257 () (_ BitVec 32))

(assert (=> b!18774 (= lt!5257 #b00000000000000000000000000000000)))

(declare-fun lt!5258 () Unit!352)

(declare-fun lemmaKeyInListMapIsInArray!80 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 64) Int) Unit!352)

(assert (=> b!18774 (= lt!5258 (lemmaKeyInListMapIsInArray!80 lt!5255 (array!1036 ((as const (Array (_ BitVec 32) ValueCell!258)) EmptyCell!258) (bvadd lt!4847 #b00000000000000000000000000000001)) lt!4847 lt!5257 (dynLambda!133 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!133 (defaultEntry!1662 (v!1473 (underlying!62 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!396 lt!5265) (defaultEntry!1662 (v!1473 (underlying!62 thiss!848)))))))

(declare-fun c!1985 () Bool)

(assert (=> b!18774 (= c!1985 (and (not (= (_1!396 lt!5265) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!396 lt!5265) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18774 e!12022))

(declare-fun lt!5252 () Unit!352)

(assert (=> b!18774 (= lt!5252 lt!5258)))

(declare-fun lt!5249 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1037 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!18774 (= lt!5249 (arrayScanForKey!0 (array!1038 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4847 #b00000000000000000000000000000001)) (_1!396 lt!5265) #b00000000000000000000000000000000))))

(assert (=> b!18774 false))

(declare-fun b!18775 () Bool)

(assert (=> b!18775 (= e!12022 (ite (= (_1!396 lt!5265) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5257 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5257 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!18776 () Bool)

(declare-fun res!12970 () Bool)

(assert (=> b!18776 (=> (not res!12970) (not e!12023))))

(assert (=> b!18776 (= res!12970 (= (mask!4595 lt!5268) lt!4847))))

(declare-fun b!18777 () Bool)

(declare-fun Unit!369 () Unit!352)

(assert (=> b!18777 (= e!12021 Unit!369)))

(assert (= (and d!3499 c!1984) b!18774))

(assert (= (and d!3499 (not c!1984)) b!18777))

(assert (= (and b!18774 c!1985) b!18773))

(assert (= (and b!18774 (not c!1985)) b!18775))

(assert (= (and d!3499 res!12969) b!18776))

(assert (= (and b!18776 res!12970) b!18772))

(declare-fun b_lambda!1453 () Bool)

(assert (=> (not b_lambda!1453) (not d!3499)))

(assert (=> d!3499 t!3183))

(declare-fun b_and!1309 () Bool)

(assert (= b_and!1307 (and (=> t!3183 result!1015) b_and!1309)))

(declare-fun b_lambda!1455 () Bool)

(assert (=> (not b_lambda!1455) (not b!18774)))

(assert (=> b!18774 t!3183))

(declare-fun b_and!1311 () Bool)

(assert (= b_and!1309 (and (=> t!3183 result!1015) b_and!1311)))

(declare-fun m!13227 () Bool)

(assert (=> d!3499 m!13227))

(declare-fun m!13229 () Bool)

(assert (=> d!3499 m!13229))

(declare-fun m!13231 () Bool)

(assert (=> d!3499 m!13231))

(declare-fun m!13233 () Bool)

(assert (=> d!3499 m!13233))

(assert (=> d!3499 m!13211))

(declare-fun m!13235 () Bool)

(assert (=> d!3499 m!13235))

(declare-fun m!13237 () Bool)

(assert (=> d!3499 m!13237))

(declare-fun m!13239 () Bool)

(assert (=> d!3499 m!13239))

(declare-fun m!13241 () Bool)

(assert (=> d!3499 m!13241))

(declare-fun m!13243 () Bool)

(assert (=> d!3499 m!13243))

(declare-fun m!13245 () Bool)

(assert (=> b!18772 m!13245))

(declare-fun m!13247 () Bool)

(assert (=> b!18773 m!13247))

(assert (=> b!18774 m!13211))

(assert (=> b!18774 m!13211))

(declare-fun m!13249 () Bool)

(assert (=> b!18774 m!13249))

(declare-fun m!13251 () Bool)

(assert (=> b!18774 m!13251))

(assert (=> b!18774 m!13233))

(assert (=> b!18774 m!13211))

(declare-fun m!13253 () Bool)

(assert (=> b!18774 m!13253))

(assert (=> d!3441 d!3499))

(declare-fun d!3501 () Bool)

(declare-fun e!12029 () Bool)

(assert (=> d!3501 e!12029))

(declare-fun res!12973 () Bool)

(assert (=> d!3501 (=> (not res!12973) (not e!12029))))

(declare-fun lt!5275 () (_ BitVec 32))

(assert (=> d!3501 (= res!12973 (validMask!0 lt!5275))))

(declare-datatypes ((tuple2!802 0))(
  ( (tuple2!803 (_1!403 Unit!352) (_2!403 (_ BitVec 32))) )
))
(declare-fun e!12028 () tuple2!802)

(assert (=> d!3501 (= lt!5275 (_2!403 e!12028))))

(declare-fun c!1988 () Bool)

(declare-fun lt!5276 () tuple2!802)

(assert (=> d!3501 (= c!1988 (and (bvsgt (_2!403 lt!5276) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!83 (v!1473 (underlying!62 thiss!848)))) (_2!403 lt!5276)) (bvsge (bvadd (bvand (bvashr (_2!403 lt!5276) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!83 (v!1473 (underlying!62 thiss!848))))))))

(declare-fun Unit!370 () Unit!352)

(declare-fun Unit!371 () Unit!352)

(assert (=> d!3501 (= lt!5276 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!83 (v!1473 (underlying!62 thiss!848))) (_vacant!83 (v!1473 (underlying!62 thiss!848))))) (mask!4595 (v!1473 (underlying!62 thiss!848)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!83 (v!1473 (underlying!62 thiss!848)))) (mask!4595 (v!1473 (underlying!62 thiss!848))))) (tuple2!803 Unit!370 (bvand (bvadd (bvshl (mask!4595 (v!1473 (underlying!62 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!803 Unit!371 (mask!4595 (v!1473 (underlying!62 thiss!848))))))))

(assert (=> d!3501 (validMask!0 (mask!4595 (v!1473 (underlying!62 thiss!848))))))

(assert (=> d!3501 (= (computeNewMask!2 thiss!848 (mask!4595 (v!1473 (underlying!62 thiss!848))) (_vacant!83 (v!1473 (underlying!62 thiss!848))) (_size!83 (v!1473 (underlying!62 thiss!848)))) lt!5275)))

(declare-fun b!18784 () Bool)

(declare-fun computeNewMaskWhile!2 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!802)

(assert (=> b!18784 (= e!12028 (computeNewMaskWhile!2 (_size!83 (v!1473 (underlying!62 thiss!848))) (_vacant!83 (v!1473 (underlying!62 thiss!848))) (mask!4595 (v!1473 (underlying!62 thiss!848))) (_2!403 lt!5276)))))

(declare-fun b!18785 () Bool)

(declare-fun Unit!372 () Unit!352)

(assert (=> b!18785 (= e!12028 (tuple2!803 Unit!372 (_2!403 lt!5276)))))

(declare-fun b!18786 () Bool)

(assert (=> b!18786 (= e!12029 (bvsle (_size!83 (v!1473 (underlying!62 thiss!848))) (bvadd lt!5275 #b00000000000000000000000000000001)))))

(assert (= (and d!3501 c!1988) b!18784))

(assert (= (and d!3501 (not c!1988)) b!18785))

(assert (= (and d!3501 res!12973) b!18786))

(declare-fun m!13255 () Bool)

(assert (=> d!3501 m!13255))

(declare-fun m!13257 () Bool)

(assert (=> d!3501 m!13257))

(declare-fun m!13259 () Bool)

(assert (=> b!18784 m!13259))

(assert (=> d!3441 d!3501))

(assert (=> d!3441 d!3425))

(declare-fun bm!823 () Bool)

(declare-fun call!826 () ListLongMap!537)

(declare-fun call!829 () ListLongMap!537)

(assert (=> bm!823 (= call!826 call!829)))

(declare-fun b!18787 () Bool)

(declare-fun res!12977 () Bool)

(declare-fun e!12038 () Bool)

(assert (=> b!18787 (=> (not res!12977) (not e!12038))))

(declare-fun e!12039 () Bool)

(assert (=> b!18787 (= res!12977 e!12039)))

(declare-fun res!12981 () Bool)

(assert (=> b!18787 (=> res!12981 e!12039)))

(declare-fun e!12040 () Bool)

(assert (=> b!18787 (= res!12981 (not e!12040))))

(declare-fun res!12980 () Bool)

(assert (=> b!18787 (=> (not res!12980) (not e!12040))))

(assert (=> b!18787 (= res!12980 (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18788 () Bool)

(declare-fun call!827 () ListLongMap!537)

(declare-fun e!12031 () ListLongMap!537)

(assert (=> b!18788 (= e!12031 (+!36 call!827 (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))))))

(declare-fun b!18789 () Bool)

(declare-fun e!12037 () Bool)

(declare-fun e!12032 () Bool)

(assert (=> b!18789 (= e!12037 e!12032)))

(declare-fun res!12978 () Bool)

(declare-fun call!830 () Bool)

(assert (=> b!18789 (= res!12978 call!830)))

(assert (=> b!18789 (=> (not res!12978) (not e!12032))))

(declare-fun bm!824 () Bool)

(declare-fun call!828 () ListLongMap!537)

(assert (=> bm!824 (= call!828 call!827)))

(declare-fun bm!825 () Bool)

(declare-fun call!831 () Bool)

(declare-fun lt!5298 () ListLongMap!537)

(assert (=> bm!825 (= call!831 (contains!216 lt!5298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!826 () Bool)

(assert (=> bm!826 (= call!830 (contains!216 lt!5298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!1994 () Bool)

(declare-fun b!18790 () Bool)

(assert (=> b!18790 (= c!1994 (and (not (= (bvand (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!12034 () ListLongMap!537)

(declare-fun e!12036 () ListLongMap!537)

(assert (=> b!18790 (= e!12034 e!12036)))

(declare-fun b!18791 () Bool)

(declare-fun call!832 () ListLongMap!537)

(assert (=> b!18791 (= e!12036 call!832)))

(declare-fun b!18792 () Bool)

(assert (=> b!18792 (= e!12034 call!828)))

(declare-fun b!18793 () Bool)

(assert (=> b!18793 (= e!12031 e!12034)))

(declare-fun c!1989 () Bool)

(assert (=> b!18793 (= c!1989 (and (not (= (bvand (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!1991 () Bool)

(declare-fun bm!827 () Bool)

(assert (=> bm!827 (= call!827 (+!36 (ite c!1991 call!829 (ite c!1989 call!826 call!832)) (ite (or c!1991 c!1989) (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))))

(declare-fun b!18794 () Bool)

(assert (=> b!18794 (= e!12037 (not call!830))))

(declare-fun d!3503 () Bool)

(assert (=> d!3503 e!12038))

(declare-fun res!12979 () Bool)

(assert (=> d!3503 (=> (not res!12979) (not e!12038))))

(assert (=> d!3503 (= res!12979 (or (bvsge #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))))

(declare-fun lt!5285 () ListLongMap!537)

(assert (=> d!3503 (= lt!5298 lt!5285)))

(declare-fun lt!5280 () Unit!352)

(declare-fun e!12042 () Unit!352)

(assert (=> d!3503 (= lt!5280 e!12042)))

(declare-fun c!1992 () Bool)

(declare-fun e!12035 () Bool)

(assert (=> d!3503 (= c!1992 e!12035)))

(declare-fun res!12974 () Bool)

(assert (=> d!3503 (=> (not res!12974) (not e!12035))))

(assert (=> d!3503 (= res!12974 (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(assert (=> d!3503 (= lt!5285 e!12031)))

(assert (=> d!3503 (= c!1991 (and (not (= (bvand (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3503 (validMask!0 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3503 (= (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5298)))

(declare-fun b!18795 () Bool)

(declare-fun e!12030 () Bool)

(assert (=> b!18795 (= e!12038 e!12030)))

(declare-fun c!1990 () Bool)

(assert (=> b!18795 (= c!1990 (not (= (bvand (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18796 () Bool)

(assert (=> b!18796 (= e!12032 (= (apply!27 lt!5298 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18797 () Bool)

(declare-fun e!12041 () Bool)

(assert (=> b!18797 (= e!12041 (= (apply!27 lt!5298 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)) (get!348 (select (arr!499 (ite c!1869 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811)) #b00000000000000000000000000000000) (dynLambda!133 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!589 (ite c!1869 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811))))))

(assert (=> b!18797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun b!18798 () Bool)

(assert (=> b!18798 (= e!12040 (validKeyInArray!0 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)))))

(declare-fun b!18799 () Bool)

(assert (=> b!18799 (= e!12030 (not call!831))))

(declare-fun b!18800 () Bool)

(declare-fun Unit!373 () Unit!352)

(assert (=> b!18800 (= e!12042 Unit!373)))

(declare-fun bm!828 () Bool)

(assert (=> bm!828 (= call!829 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18801 () Bool)

(assert (=> b!18801 (= e!12035 (validKeyInArray!0 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)))))

(declare-fun b!18802 () Bool)

(declare-fun e!12033 () Bool)

(assert (=> b!18802 (= e!12033 (= (apply!27 lt!5298 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(declare-fun bm!829 () Bool)

(assert (=> bm!829 (= call!832 call!826)))

(declare-fun b!18803 () Bool)

(assert (=> b!18803 (= e!12030 e!12033)))

(declare-fun res!12976 () Bool)

(assert (=> b!18803 (= res!12976 call!831)))

(assert (=> b!18803 (=> (not res!12976) (not e!12033))))

(declare-fun b!18804 () Bool)

(declare-fun res!12982 () Bool)

(assert (=> b!18804 (=> (not res!12982) (not e!12038))))

(assert (=> b!18804 (= res!12982 e!12037)))

(declare-fun c!1993 () Bool)

(assert (=> b!18804 (= c!1993 (not (= (bvand (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!18805 () Bool)

(assert (=> b!18805 (= e!12036 call!828)))

(declare-fun b!18806 () Bool)

(declare-fun lt!5290 () Unit!352)

(assert (=> b!18806 (= e!12042 lt!5290)))

(declare-fun lt!5296 () ListLongMap!537)

(assert (=> b!18806 (= lt!5296 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5278 () (_ BitVec 64))

(assert (=> b!18806 (= lt!5278 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5289 () (_ BitVec 64))

(assert (=> b!18806 (= lt!5289 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(declare-fun lt!5282 () Unit!352)

(assert (=> b!18806 (= lt!5282 (addStillContains!12 lt!5296 lt!5278 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!5289))))

(assert (=> b!18806 (contains!216 (+!36 lt!5296 (tuple2!791 lt!5278 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))) lt!5289)))

(declare-fun lt!5286 () Unit!352)

(assert (=> b!18806 (= lt!5286 lt!5282)))

(declare-fun lt!5293 () ListLongMap!537)

(assert (=> b!18806 (= lt!5293 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5281 () (_ BitVec 64))

(assert (=> b!18806 (= lt!5281 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5277 () (_ BitVec 64))

(assert (=> b!18806 (= lt!5277 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(declare-fun lt!5291 () Unit!352)

(assert (=> b!18806 (= lt!5291 (addApplyDifferent!12 lt!5293 lt!5281 (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5277))))

(assert (=> b!18806 (= (apply!27 (+!36 lt!5293 (tuple2!791 lt!5281 (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))) lt!5277) (apply!27 lt!5293 lt!5277))))

(declare-fun lt!5292 () Unit!352)

(assert (=> b!18806 (= lt!5292 lt!5291)))

(declare-fun lt!5295 () ListLongMap!537)

(assert (=> b!18806 (= lt!5295 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5294 () (_ BitVec 64))

(assert (=> b!18806 (= lt!5294 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5284 () (_ BitVec 64))

(assert (=> b!18806 (= lt!5284 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(declare-fun lt!5287 () Unit!352)

(assert (=> b!18806 (= lt!5287 (addApplyDifferent!12 lt!5295 lt!5294 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!5284))))

(assert (=> b!18806 (= (apply!27 (+!36 lt!5295 (tuple2!791 lt!5294 (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))))) lt!5284) (apply!27 lt!5295 lt!5284))))

(declare-fun lt!5297 () Unit!352)

(assert (=> b!18806 (= lt!5297 lt!5287)))

(declare-fun lt!5279 () ListLongMap!537)

(assert (=> b!18806 (= lt!5279 (getCurrentListMapNoExtraKeys!12 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4811) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) lt!4825) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705))))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5283 () (_ BitVec 64))

(assert (=> b!18806 (= lt!5283 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!5288 () (_ BitVec 64))

(assert (=> b!18806 (= lt!5288 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000))))

(assert (=> b!18806 (= lt!5290 (addApplyDifferent!12 lt!5279 lt!5283 (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5288))))

(assert (=> b!18806 (= (apply!27 (+!36 lt!5279 (tuple2!791 lt!5283 (ite c!1869 (ite c!1874 (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) v!259) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705))))))) lt!5288) (apply!27 lt!5279 lt!5288))))

(declare-fun b!18807 () Bool)

(assert (=> b!18807 (= e!12039 e!12041)))

(declare-fun res!12975 () Bool)

(assert (=> b!18807 (=> (not res!12975) (not e!12041))))

(assert (=> b!18807 (= res!12975 (contains!216 lt!5298 (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) #b00000000000000000000000000000000)))))

(assert (=> b!18807 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(assert (= (and d!3503 c!1991) b!18788))

(assert (= (and d!3503 (not c!1991)) b!18793))

(assert (= (and b!18793 c!1989) b!18792))

(assert (= (and b!18793 (not c!1989)) b!18790))

(assert (= (and b!18790 c!1994) b!18805))

(assert (= (and b!18790 (not c!1994)) b!18791))

(assert (= (or b!18805 b!18791) bm!829))

(assert (= (or b!18792 bm!829) bm!823))

(assert (= (or b!18792 b!18805) bm!824))

(assert (= (or b!18788 bm!823) bm!828))

(assert (= (or b!18788 bm!824) bm!827))

(assert (= (and d!3503 res!12974) b!18801))

(assert (= (and d!3503 c!1992) b!18806))

(assert (= (and d!3503 (not c!1992)) b!18800))

(assert (= (and d!3503 res!12979) b!18787))

(assert (= (and b!18787 res!12980) b!18798))

(assert (= (and b!18787 (not res!12981)) b!18807))

(assert (= (and b!18807 res!12975) b!18797))

(assert (= (and b!18787 res!12977) b!18804))

(assert (= (and b!18804 c!1993) b!18789))

(assert (= (and b!18804 (not c!1993)) b!18794))

(assert (= (and b!18789 res!12978) b!18796))

(assert (= (or b!18789 b!18794) bm!826))

(assert (= (and b!18804 res!12982) b!18795))

(assert (= (and b!18795 c!1990) b!18803))

(assert (= (and b!18795 (not c!1990)) b!18799))

(assert (= (and b!18803 res!12976) b!18802))

(assert (= (or b!18803 b!18799) bm!825))

(declare-fun b_lambda!1457 () Bool)

(assert (=> (not b_lambda!1457) (not b!18797)))

(assert (=> b!18797 t!3181))

(declare-fun b_and!1313 () Bool)

(assert (= b_and!1311 (and (=> t!3181 result!1011) b_and!1313)))

(declare-fun m!13261 () Bool)

(assert (=> bm!827 m!13261))

(declare-fun m!13263 () Bool)

(assert (=> bm!828 m!13263))

(declare-fun m!13265 () Bool)

(assert (=> bm!825 m!13265))

(declare-fun m!13267 () Bool)

(assert (=> b!18806 m!13267))

(declare-fun m!13269 () Bool)

(assert (=> b!18806 m!13269))

(declare-fun m!13271 () Bool)

(assert (=> b!18806 m!13271))

(declare-fun m!13273 () Bool)

(assert (=> b!18806 m!13273))

(declare-fun m!13275 () Bool)

(assert (=> b!18806 m!13275))

(assert (=> b!18806 m!13271))

(declare-fun m!13277 () Bool)

(assert (=> b!18806 m!13277))

(declare-fun m!13279 () Bool)

(assert (=> b!18806 m!13279))

(assert (=> b!18806 m!13263))

(declare-fun m!13281 () Bool)

(assert (=> b!18806 m!13281))

(declare-fun m!13283 () Bool)

(assert (=> b!18806 m!13283))

(assert (=> b!18806 m!13277))

(declare-fun m!13285 () Bool)

(assert (=> b!18806 m!13285))

(declare-fun m!13287 () Bool)

(assert (=> b!18806 m!13287))

(declare-fun m!13289 () Bool)

(assert (=> b!18806 m!13289))

(assert (=> b!18806 m!13275))

(declare-fun m!13291 () Bool)

(assert (=> b!18806 m!13291))

(assert (=> b!18806 m!13061))

(assert (=> b!18806 m!13281))

(declare-fun m!13293 () Bool)

(assert (=> b!18806 m!13293))

(declare-fun m!13295 () Bool)

(assert (=> b!18806 m!13295))

(assert (=> d!3503 m!12821))

(assert (=> b!18798 m!13061))

(assert (=> b!18798 m!13061))

(assert (=> b!18798 m!13067))

(declare-fun m!13297 () Bool)

(assert (=> b!18802 m!13297))

(assert (=> b!18801 m!13061))

(assert (=> b!18801 m!13061))

(assert (=> b!18801 m!13067))

(declare-fun m!13299 () Bool)

(assert (=> b!18796 m!13299))

(declare-fun m!13301 () Bool)

(assert (=> b!18797 m!13301))

(assert (=> b!18797 m!13061))

(assert (=> b!18797 m!13301))

(assert (=> b!18797 m!13075))

(declare-fun m!13303 () Bool)

(assert (=> b!18797 m!13303))

(assert (=> b!18797 m!13061))

(declare-fun m!13305 () Bool)

(assert (=> b!18797 m!13305))

(assert (=> b!18797 m!13075))

(declare-fun m!13307 () Bool)

(assert (=> bm!826 m!13307))

(assert (=> b!18807 m!13061))

(assert (=> b!18807 m!13061))

(declare-fun m!13309 () Bool)

(assert (=> b!18807 m!13309))

(declare-fun m!13311 () Bool)

(assert (=> b!18788 m!13311))

(assert (=> bm!683 d!3503))

(declare-fun d!3505 () Bool)

(declare-fun e!12043 () Bool)

(assert (=> d!3505 e!12043))

(declare-fun res!12984 () Bool)

(assert (=> d!3505 (=> (not res!12984) (not e!12043))))

(declare-fun lt!5301 () ListLongMap!537)

(assert (=> d!3505 (= res!12984 (contains!216 lt!5301 (_1!396 (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259)))))))

(declare-fun lt!5299 () List!539)

(assert (=> d!3505 (= lt!5301 (ListLongMap!538 lt!5299))))

(declare-fun lt!5302 () Unit!352)

(declare-fun lt!5300 () Unit!352)

(assert (=> d!3505 (= lt!5302 lt!5300)))

(assert (=> d!3505 (= (getValueByKey!59 lt!5299 (_1!396 (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259)))) (Some!64 (_2!396 (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259)))))))

(assert (=> d!3505 (= lt!5300 (lemmaContainsTupThenGetReturnValue!16 lt!5299 (_1!396 (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259))) (_2!396 (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259)))))))

(assert (=> d!3505 (= lt!5299 (insertStrictlySorted!16 (toList!284 (ite c!1869 (ite c!1874 call!703 call!683) call!687)) (_1!396 (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259))) (_2!396 (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259)))))))

(assert (=> d!3505 (= (+!36 (ite c!1869 (ite c!1874 call!703 call!683) call!687) (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259))) lt!5301)))

(declare-fun b!18808 () Bool)

(declare-fun res!12983 () Bool)

(assert (=> b!18808 (=> (not res!12983) (not e!12043))))

(assert (=> b!18808 (= res!12983 (= (getValueByKey!59 (toList!284 lt!5301) (_1!396 (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259)))) (Some!64 (_2!396 (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259))))))))

(declare-fun b!18809 () Bool)

(assert (=> b!18809 (= e!12043 (contains!217 (toList!284 lt!5301) (ite c!1869 (ite c!1874 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 v!259) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 v!259)) (tuple2!791 key!682 v!259))))))

(assert (= (and d!3505 res!12984) b!18808))

(assert (= (and b!18808 res!12983) b!18809))

(declare-fun m!13313 () Bool)

(assert (=> d!3505 m!13313))

(declare-fun m!13315 () Bool)

(assert (=> d!3505 m!13315))

(declare-fun m!13317 () Bool)

(assert (=> d!3505 m!13317))

(declare-fun m!13319 () Bool)

(assert (=> d!3505 m!13319))

(declare-fun m!13321 () Bool)

(assert (=> b!18808 m!13321))

(declare-fun m!13323 () Bool)

(assert (=> b!18809 m!13323))

(assert (=> bm!690 d!3505))

(assert (=> bm!711 d!3499))

(assert (=> bm!697 d!3487))

(declare-fun bm!830 () Bool)

(declare-fun call!850 () Bool)

(declare-fun call!833 () Bool)

(assert (=> bm!830 (= call!850 call!833)))

(declare-fun bm!831 () Bool)

(declare-fun call!837 () ListLongMap!537)

(declare-fun lt!5310 () tuple2!794)

(assert (=> bm!831 (= call!837 (map!356 (_2!398 lt!5310)))))

(declare-fun bm!832 () Bool)

(declare-fun call!852 () SeekEntryResult!43)

(declare-fun call!836 () SeekEntryResult!43)

(assert (=> bm!832 (= call!852 call!836)))

(declare-fun b!18810 () Bool)

(declare-fun e!12059 () Bool)

(declare-fun call!841 () Bool)

(assert (=> b!18810 (= e!12059 (not call!841))))

(declare-fun lt!5317 () SeekEntryResult!43)

(declare-fun res!12997 () Bool)

(declare-fun b!18811 () Bool)

(assert (=> b!18811 (= res!12997 (= (select (arr!500 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714))) (index!2294 lt!5317)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!12047 () Bool)

(assert (=> b!18811 (=> (not res!12997) (not e!12047))))

(declare-fun b!18812 () Bool)

(declare-fun lt!5328 () Unit!352)

(declare-fun lt!5304 () Unit!352)

(assert (=> b!18812 (= lt!5328 lt!5304)))

(declare-fun call!848 () ListLongMap!537)

(declare-fun lt!5309 () SeekEntryResult!43)

(assert (=> b!18812 (contains!216 call!848 (select (arr!500 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714))) (index!2292 lt!5309)))))

(declare-fun lt!5315 () array!1035)

(assert (=> b!18812 (= lt!5304 (lemmaValidKeyInArrayIsInListMap!2 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) lt!5315 (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (index!2292 lt!5309) (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714))))))

(assert (=> b!18812 (= lt!5315 (array!1036 (store (arr!499 (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714))) (index!2292 lt!5309) (ValueCellFull!258 (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))))) (size!589 (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)))))))

(declare-fun lt!5312 () Unit!352)

(declare-fun lt!5319 () Unit!352)

(assert (=> b!18812 (= lt!5312 lt!5319)))

(declare-fun call!847 () ListLongMap!537)

(assert (=> b!18812 (= call!847 (getCurrentListMap!121 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (array!1036 (store (arr!499 (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714))) (index!2292 lt!5309) (ValueCellFull!258 (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))))) (size!589 (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)))) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) #b00000000000000000000000000000000 (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714))))))

(assert (=> b!18812 (= lt!5319 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!2 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (index!2292 lt!5309) (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))) (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714))))))

(declare-fun lt!5323 () Unit!352)

(declare-fun e!12063 () Unit!352)

(assert (=> b!18812 (= lt!5323 e!12063)))

(declare-fun c!2002 () Bool)

(declare-fun call!846 () Bool)

(assert (=> b!18812 (= c!2002 call!846)))

(declare-fun e!12053 () tuple2!794)

(assert (=> b!18812 (= e!12053 (tuple2!795 true (LongMapFixedSize!103 (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (_size!83 (ite c!1887 (_2!398 lt!4846) call!714)) (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (array!1036 (store (arr!499 (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714))) (index!2292 lt!5309) (ValueCellFull!258 (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))))) (size!589 (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)))) (_vacant!83 (ite c!1887 (_2!398 lt!4846) call!714)))))))

(declare-fun b!18813 () Bool)

(declare-fun e!12054 () tuple2!794)

(declare-fun lt!5320 () tuple2!794)

(assert (=> b!18813 (= e!12054 (tuple2!795 (_1!398 lt!5320) (_2!398 lt!5320)))))

(declare-fun call!840 () tuple2!794)

(assert (=> b!18813 (= lt!5320 call!840)))

(declare-fun b!18814 () Bool)

(declare-fun c!1997 () Bool)

(declare-fun lt!5322 () SeekEntryResult!43)

(assert (=> b!18814 (= c!1997 ((_ is MissingVacant!43) lt!5322))))

(declare-fun e!12052 () Bool)

(declare-fun e!12057 () Bool)

(assert (=> b!18814 (= e!12052 e!12057)))

(declare-fun call!843 () Bool)

(declare-fun lt!5316 () SeekEntryResult!43)

(declare-fun lt!5327 () SeekEntryResult!43)

(declare-fun c!2006 () Bool)

(declare-fun c!2003 () Bool)

(declare-fun c!1996 () Bool)

(declare-fun bm!833 () Bool)

(declare-fun c!2001 () Bool)

(assert (=> bm!833 (= call!843 (inRange!0 (ite c!1996 (ite c!2001 (index!2292 lt!5316) (ite c!2003 (index!2291 lt!5322) (index!2294 lt!5322))) (ite c!2002 (index!2292 lt!5327) (ite c!2006 (index!2291 lt!5317) (index!2294 lt!5317)))) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714))))))

(declare-fun bm!834 () Bool)

(declare-fun call!842 () Bool)

(assert (=> bm!834 (= call!842 call!843)))

(declare-fun lt!5329 () (_ BitVec 32))

(declare-fun c!1999 () Bool)

(declare-fun bm!835 () Bool)

(declare-fun c!2004 () Bool)

(assert (=> bm!835 (= call!848 (getCurrentListMap!121 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (ite c!1999 (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)) lt!5315) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (ite c!1999 (ite c!2004 (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) lt!5329) (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714))) (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (ite c!1999 (ite c!2004 (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848)))))) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714))) #b00000000000000000000000000000000 (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714))))))

(declare-fun call!849 () ListLongMap!537)

(declare-fun b!18815 () Bool)

(declare-fun e!12048 () Bool)

(assert (=> b!18815 (= e!12048 (= call!837 (+!36 call!849 (tuple2!791 (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848)))))))))))

(declare-fun res!12994 () Bool)

(declare-fun b!18816 () Bool)

(assert (=> b!18816 (= res!12994 (= (select (arr!500 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714))) (index!2294 lt!5322)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!18816 (=> (not res!12994) (not e!12059))))

(declare-fun b!18817 () Bool)

(declare-fun res!12987 () Bool)

(declare-fun e!12050 () Bool)

(assert (=> b!18817 (=> (not res!12987) (not e!12050))))

(assert (=> b!18817 (= res!12987 (= (select (arr!500 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714))) (index!2291 lt!5322)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18818 () Bool)

(declare-fun e!12061 () Bool)

(assert (=> b!18818 (= e!12061 (= (select (arr!500 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714))) (index!2292 lt!5327)) (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!836 () Bool)

(declare-fun call!845 () ListLongMap!537)

(assert (=> bm!836 (= call!845 call!847)))

(declare-fun b!18819 () Bool)

(assert (=> b!18819 (= e!12054 e!12053)))

(declare-fun c!1998 () Bool)

(assert (=> b!18819 (= c!1998 ((_ is MissingZero!43) lt!5309))))

(declare-fun call!856 () Unit!352)

(declare-fun bm!837 () Bool)

(assert (=> bm!837 (= call!856 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!2 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714))))))

(declare-fun b!18820 () Bool)

(declare-fun lt!5324 () tuple2!794)

(assert (=> b!18820 (= lt!5324 call!840)))

(assert (=> b!18820 (= e!12053 (tuple2!795 (_1!398 lt!5324) (_2!398 lt!5324)))))

(declare-fun b!18821 () Bool)

(declare-fun e!12058 () Bool)

(assert (=> b!18821 (= e!12058 e!12047)))

(declare-fun res!12993 () Bool)

(assert (=> b!18821 (= res!12993 call!850)))

(assert (=> b!18821 (=> (not res!12993) (not e!12047))))

(declare-fun b!18822 () Bool)

(declare-fun e!12049 () Unit!352)

(declare-fun lt!5318 () Unit!352)

(assert (=> b!18822 (= e!12049 lt!5318)))

(assert (=> b!18822 (= lt!5318 call!856)))

(assert (=> b!18822 (= lt!5322 call!852)))

(assert (=> b!18822 (= c!2003 ((_ is MissingZero!43) lt!5322))))

(assert (=> b!18822 e!12052))

(declare-fun b!18823 () Bool)

(declare-fun Unit!374 () Unit!352)

(assert (=> b!18823 (= e!12063 Unit!374)))

(declare-fun lt!5303 () Unit!352)

(assert (=> b!18823 (= lt!5303 call!856)))

(declare-fun call!844 () SeekEntryResult!43)

(assert (=> b!18823 (= lt!5317 call!844)))

(assert (=> b!18823 (= c!2006 ((_ is MissingZero!43) lt!5317))))

(declare-fun e!12051 () Bool)

(assert (=> b!18823 e!12051))

(declare-fun lt!5306 () Unit!352)

(assert (=> b!18823 (= lt!5306 lt!5303)))

(assert (=> b!18823 false))

(declare-fun bm!838 () Bool)

(assert (=> bm!838 (= call!833 call!843)))

(declare-fun b!18824 () Bool)

(declare-fun res!12998 () Bool)

(assert (=> b!18824 (= res!12998 call!842)))

(declare-fun e!12060 () Bool)

(assert (=> b!18824 (=> (not res!12998) (not e!12060))))

(declare-fun bm!839 () Bool)

(declare-fun call!853 () Bool)

(assert (=> bm!839 (= call!853 call!842)))

(declare-fun bm!840 () Bool)

(declare-fun call!851 () Bool)

(assert (=> bm!840 (= call!841 call!851)))

(declare-fun b!18825 () Bool)

(assert (=> b!18825 (= e!12058 ((_ is Undefined!43) lt!5317))))

(declare-fun b!18826 () Bool)

(declare-fun lt!5308 () Unit!352)

(declare-fun lt!5326 () Unit!352)

(assert (=> b!18826 (= lt!5308 lt!5326)))

(declare-fun call!835 () ListLongMap!537)

(assert (=> b!18826 (= call!845 call!835)))

(declare-fun lt!5311 () (_ BitVec 32))

(assert (=> b!18826 (= lt!5326 (lemmaChangeZeroKeyThenAddPairToListMap!2 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) lt!5311 (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714))))))

(assert (=> b!18826 (= lt!5311 (bvor (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) #b00000000000000000000000000000001))))

(declare-fun e!12046 () tuple2!794)

(assert (=> b!18826 (= e!12046 (tuple2!795 true (LongMapFixedSize!103 (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (bvor (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) #b00000000000000000000000000000001) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (_size!83 (ite c!1887 (_2!398 lt!4846) call!714)) (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)) (_vacant!83 (ite c!1887 (_2!398 lt!4846) call!714)))))))

(declare-fun bm!841 () Bool)

(declare-fun call!854 () ListLongMap!537)

(assert (=> bm!841 (= call!854 (getCurrentListMap!121 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (ite (and c!1999 c!2004) lt!5311 (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714))) (ite (and c!1999 c!2004) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))) (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714))) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) #b00000000000000000000000000000000 (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714))))))

(declare-fun b!18827 () Bool)

(declare-fun call!838 () Bool)

(assert (=> b!18827 (= e!12047 (not call!838))))

(declare-fun b!18828 () Bool)

(assert (=> b!18828 (= e!12050 (not call!841))))

(declare-fun call!855 () ListLongMap!537)

(declare-fun call!839 () ListLongMap!537)

(declare-fun bm!842 () Bool)

(assert (=> bm!842 (= call!847 (+!36 (ite c!1999 (ite c!2004 call!855 call!835) call!839) (ite c!1999 (ite c!2004 (tuple2!791 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848)))))) (tuple2!791 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))))) (tuple2!791 (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848)))))))))))

(declare-fun b!18829 () Bool)

(declare-fun c!1995 () Bool)

(assert (=> b!18829 (= c!1995 ((_ is MissingVacant!43) lt!5309))))

(declare-fun e!12044 () tuple2!794)

(assert (=> b!18829 (= e!12044 e!12054)))

(declare-fun bm!843 () Bool)

(assert (=> bm!843 (= call!849 (map!356 (ite c!1887 (_2!398 lt!4846) call!714)))))

(declare-fun bm!844 () Bool)

(declare-fun call!834 () Unit!352)

(assert (=> bm!844 (= call!834 (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714))))))

(declare-fun d!3507 () Bool)

(declare-fun e!12056 () Bool)

(assert (=> d!3507 e!12056))

(declare-fun res!12995 () Bool)

(assert (=> d!3507 (=> (not res!12995) (not e!12056))))

(assert (=> d!3507 (= res!12995 (valid!49 (_2!398 lt!5310)))))

(declare-fun e!12062 () tuple2!794)

(assert (=> d!3507 (= lt!5310 e!12062)))

(assert (=> d!3507 (= c!1999 (= (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3507 (valid!49 (ite c!1887 (_2!398 lt!4846) call!714))))

(assert (=> d!3507 (= (update!12 (ite c!1887 (_2!398 lt!4846) call!714) (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848)))))) lt!5310)))

(declare-fun b!18830 () Bool)

(declare-fun Unit!375 () Unit!352)

(assert (=> b!18830 (= e!12049 Unit!375)))

(declare-fun lt!5325 () Unit!352)

(assert (=> b!18830 (= lt!5325 call!834)))

(assert (=> b!18830 (= lt!5316 call!852)))

(declare-fun res!12996 () Bool)

(assert (=> b!18830 (= res!12996 ((_ is Found!43) lt!5316))))

(assert (=> b!18830 (=> (not res!12996) (not e!12060))))

(assert (=> b!18830 e!12060))

(declare-fun lt!5313 () Unit!352)

(assert (=> b!18830 (= lt!5313 lt!5325)))

(assert (=> b!18830 false))

(declare-fun b!18831 () Bool)

(declare-fun res!12985 () Bool)

(declare-fun e!12045 () Bool)

(assert (=> b!18831 (=> (not res!12985) (not e!12045))))

(assert (=> b!18831 (= res!12985 (= (select (arr!500 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714))) (index!2291 lt!5317)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18832 () Bool)

(declare-fun lt!5305 () Unit!352)

(assert (=> b!18832 (= e!12063 lt!5305)))

(assert (=> b!18832 (= lt!5305 call!834)))

(assert (=> b!18832 (= lt!5327 call!844)))

(declare-fun res!12988 () Bool)

(assert (=> b!18832 (= res!12988 ((_ is Found!43) lt!5327))))

(assert (=> b!18832 (=> (not res!12988) (not e!12061))))

(assert (=> b!18832 e!12061))

(declare-fun bm!845 () Bool)

(assert (=> bm!845 (= call!835 call!854)))

(declare-fun b!18833 () Bool)

(declare-fun e!12055 () Bool)

(assert (=> b!18833 (= e!12056 e!12055)))

(declare-fun c!2005 () Bool)

(assert (=> b!18833 (= c!2005 (_1!398 lt!5310))))

(declare-fun b!18834 () Bool)

(declare-fun res!12986 () Bool)

(assert (=> b!18834 (=> (not res!12986) (not e!12045))))

(assert (=> b!18834 (= res!12986 call!850)))

(assert (=> b!18834 (= e!12051 e!12045)))

(declare-fun b!18835 () Bool)

(declare-fun res!12989 () Bool)

(assert (=> b!18835 (=> (not res!12989) (not e!12050))))

(assert (=> b!18835 (= res!12989 call!853)))

(assert (=> b!18835 (= e!12052 e!12050)))

(declare-fun b!18836 () Bool)

(assert (=> b!18836 (= e!12057 ((_ is Undefined!43) lt!5322))))

(declare-fun bm!846 () Bool)

(assert (=> bm!846 (= call!840 (updateHelperNewKey!2 (ite c!1887 (_2!398 lt!4846) call!714) (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))) (ite c!1995 (index!2294 lt!5309) (index!2291 lt!5309))))))

(declare-fun b!18837 () Bool)

(assert (=> b!18837 (= e!12055 e!12048)))

(declare-fun res!12992 () Bool)

(assert (=> b!18837 (= res!12992 (contains!216 call!837 (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!18837 (=> (not res!12992) (not e!12048))))

(declare-fun b!18838 () Bool)

(declare-fun lt!5307 () Unit!352)

(declare-fun lt!5321 () Unit!352)

(assert (=> b!18838 (= lt!5307 lt!5321)))

(assert (=> b!18838 (= call!845 call!855)))

(assert (=> b!18838 (= lt!5321 (lemmaChangeLongMinValueKeyThenAddPairToListMap!2 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) lt!5329 (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (minValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))) (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714))))))

(assert (=> b!18838 (= lt!5329 (bvor (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) #b00000000000000000000000000000010))))

(assert (=> b!18838 (= e!12046 (tuple2!795 true (LongMapFixedSize!103 (defaultEntry!1662 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714)) (bvor (extraKeys!1575 (ite c!1887 (_2!398 lt!4846) call!714)) #b00000000000000000000000000000010) (zeroValue!1598 (ite c!1887 (_2!398 lt!4846) call!714)) (ite c!1887 (minValue!1598 (v!1473 (underlying!62 thiss!848))) (ite c!1888 (zeroValue!1598 (v!1473 (underlying!62 thiss!848))) (minValue!1598 (v!1473 (underlying!62 thiss!848))))) (_size!83 (ite c!1887 (_2!398 lt!4846) call!714)) (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (_values!1659 (ite c!1887 (_2!398 lt!4846) call!714)) (_vacant!83 (ite c!1887 (_2!398 lt!4846) call!714)))))))

(declare-fun b!18839 () Bool)

(assert (=> b!18839 (= e!12062 e!12044)))

(assert (=> b!18839 (= lt!5309 (seekEntryOrOpen!0 (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714))))))

(assert (=> b!18839 (= c!1996 ((_ is Undefined!43) lt!5309))))

(declare-fun b!18840 () Bool)

(assert (=> b!18840 (= e!12045 (not call!838))))

(declare-fun b!18841 () Bool)

(declare-fun res!12991 () Bool)

(assert (=> b!18841 (= res!12991 call!833)))

(assert (=> b!18841 (=> (not res!12991) (not e!12061))))

(declare-fun bm!847 () Bool)

(assert (=> bm!847 (= call!851 (arrayContainsKey!0 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun bm!848 () Bool)

(assert (=> bm!848 (= call!838 call!851)))

(declare-fun b!18842 () Bool)

(assert (=> b!18842 (= e!12060 (= (select (arr!500 (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714))) (index!2292 lt!5316)) (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!849 () Bool)

(assert (=> bm!849 (= call!836 (seekEntryOrOpen!0 (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3087 (ite c!1887 (_2!398 lt!4846) call!714)) (mask!4595 (ite c!1887 (_2!398 lt!4846) call!714))))))

(declare-fun bm!850 () Bool)

(assert (=> bm!850 (= call!839 call!854)))

(declare-fun b!18843 () Bool)

(declare-fun lt!5314 () Unit!352)

(assert (=> b!18843 (= lt!5314 e!12049)))

(assert (=> b!18843 (= c!2001 call!846)))

(assert (=> b!18843 (= e!12044 (tuple2!795 false (ite c!1887 (_2!398 lt!4846) call!714)))))

(declare-fun bm!851 () Bool)

(assert (=> bm!851 (= call!844 call!836)))

(declare-fun b!18844 () Bool)

(assert (=> b!18844 (= e!12055 (= call!837 call!849))))

(declare-fun bm!852 () Bool)

(assert (=> bm!852 (= call!855 call!848)))

(declare-fun b!18845 () Bool)

(declare-fun c!2000 () Bool)

(assert (=> b!18845 (= c!2000 ((_ is MissingVacant!43) lt!5317))))

(assert (=> b!18845 (= e!12051 e!12058)))

(declare-fun bm!853 () Bool)

(assert (=> bm!853 (= call!846 (contains!216 call!839 (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!18846 () Bool)

(assert (=> b!18846 (= e!12062 e!12046)))

(assert (=> b!18846 (= c!2004 (= (ite c!1887 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!18847 () Bool)

(assert (=> b!18847 (= e!12057 e!12059)))

(declare-fun res!12990 () Bool)

(assert (=> b!18847 (= res!12990 call!853)))

(assert (=> b!18847 (=> (not res!12990) (not e!12059))))

(assert (= (and d!3507 c!1999) b!18846))

(assert (= (and d!3507 (not c!1999)) b!18839))

(assert (= (and b!18846 c!2004) b!18826))

(assert (= (and b!18846 (not c!2004)) b!18838))

(assert (= (or b!18826 b!18838) bm!845))

(assert (= (or b!18826 b!18838) bm!852))

(assert (= (or b!18826 b!18838) bm!836))

(assert (= (and b!18839 c!1996) b!18843))

(assert (= (and b!18839 (not c!1996)) b!18829))

(assert (= (and b!18843 c!2001) b!18830))

(assert (= (and b!18843 (not c!2001)) b!18822))

(assert (= (and b!18830 res!12996) b!18824))

(assert (= (and b!18824 res!12998) b!18842))

(assert (= (and b!18822 c!2003) b!18835))

(assert (= (and b!18822 (not c!2003)) b!18814))

(assert (= (and b!18835 res!12989) b!18817))

(assert (= (and b!18817 res!12987) b!18828))

(assert (= (and b!18814 c!1997) b!18847))

(assert (= (and b!18814 (not c!1997)) b!18836))

(assert (= (and b!18847 res!12990) b!18816))

(assert (= (and b!18816 res!12994) b!18810))

(assert (= (or b!18835 b!18847) bm!839))

(assert (= (or b!18828 b!18810) bm!840))

(assert (= (or b!18824 bm!839) bm!834))

(assert (= (or b!18830 b!18822) bm!832))

(assert (= (and b!18829 c!1995) b!18813))

(assert (= (and b!18829 (not c!1995)) b!18819))

(assert (= (and b!18819 c!1998) b!18820))

(assert (= (and b!18819 (not c!1998)) b!18812))

(assert (= (and b!18812 c!2002) b!18832))

(assert (= (and b!18812 (not c!2002)) b!18823))

(assert (= (and b!18832 res!12988) b!18841))

(assert (= (and b!18841 res!12991) b!18818))

(assert (= (and b!18823 c!2006) b!18834))

(assert (= (and b!18823 (not c!2006)) b!18845))

(assert (= (and b!18834 res!12986) b!18831))

(assert (= (and b!18831 res!12985) b!18840))

(assert (= (and b!18845 c!2000) b!18821))

(assert (= (and b!18845 (not c!2000)) b!18825))

(assert (= (and b!18821 res!12993) b!18811))

(assert (= (and b!18811 res!12997) b!18827))

(assert (= (or b!18834 b!18821) bm!830))

(assert (= (or b!18840 b!18827) bm!848))

(assert (= (or b!18841 bm!830) bm!838))

(assert (= (or b!18832 b!18823) bm!851))

(assert (= (or b!18813 b!18820) bm!846))

(assert (= (or bm!840 bm!848) bm!847))

(assert (= (or b!18830 b!18832) bm!844))

(assert (= (or b!18843 b!18812) bm!850))

(assert (= (or bm!834 bm!838) bm!833))

(assert (= (or b!18822 b!18823) bm!837))

(assert (= (or bm!832 bm!851) bm!849))

(assert (= (or b!18843 b!18812) bm!853))

(assert (= (or bm!836 b!18812) bm!842))

(assert (= (or bm!845 bm!850) bm!841))

(assert (= (or bm!852 b!18812) bm!835))

(assert (= (and d!3507 res!12995) b!18833))

(assert (= (and b!18833 c!2005) b!18837))

(assert (= (and b!18833 (not c!2005)) b!18844))

(assert (= (and b!18837 res!12992) b!18815))

(assert (= (or b!18815 b!18844) bm!843))

(assert (= (or b!18837 b!18815 b!18844) bm!831))

(declare-fun m!13325 () Bool)

(assert (=> b!18817 m!13325))

(declare-fun m!13327 () Bool)

(assert (=> b!18831 m!13327))

(declare-fun m!13329 () Bool)

(assert (=> b!18826 m!13329))

(declare-fun m!13331 () Bool)

(assert (=> b!18837 m!13331))

(declare-fun m!13333 () Bool)

(assert (=> b!18811 m!13333))

(declare-fun m!13335 () Bool)

(assert (=> b!18842 m!13335))

(declare-fun m!13337 () Bool)

(assert (=> b!18818 m!13337))

(declare-fun m!13339 () Bool)

(assert (=> bm!843 m!13339))

(declare-fun m!13341 () Bool)

(assert (=> bm!835 m!13341))

(declare-fun m!13343 () Bool)

(assert (=> bm!841 m!13343))

(declare-fun m!13345 () Bool)

(assert (=> b!18816 m!13345))

(declare-fun m!13347 () Bool)

(assert (=> bm!831 m!13347))

(declare-fun m!13349 () Bool)

(assert (=> b!18838 m!13349))

(declare-fun m!13351 () Bool)

(assert (=> b!18815 m!13351))

(declare-fun m!13353 () Bool)

(assert (=> bm!853 m!13353))

(declare-fun m!13355 () Bool)

(assert (=> bm!837 m!13355))

(declare-fun m!13357 () Bool)

(assert (=> bm!844 m!13357))

(declare-fun m!13359 () Bool)

(assert (=> bm!847 m!13359))

(declare-fun m!13361 () Bool)

(assert (=> bm!842 m!13361))

(declare-fun m!13363 () Bool)

(assert (=> bm!849 m!13363))

(declare-fun m!13365 () Bool)

(assert (=> bm!833 m!13365))

(declare-fun m!13367 () Bool)

(assert (=> b!18812 m!13367))

(declare-fun m!13369 () Bool)

(assert (=> b!18812 m!13369))

(declare-fun m!13371 () Bool)

(assert (=> b!18812 m!13371))

(declare-fun m!13373 () Bool)

(assert (=> b!18812 m!13373))

(declare-fun m!13375 () Bool)

(assert (=> b!18812 m!13375))

(assert (=> b!18812 m!13371))

(declare-fun m!13377 () Bool)

(assert (=> b!18812 m!13377))

(declare-fun m!13379 () Bool)

(assert (=> bm!846 m!13379))

(assert (=> b!18839 m!13363))

(declare-fun m!13381 () Bool)

(assert (=> d!3507 m!13381))

(declare-fun m!13383 () Bool)

(assert (=> d!3507 m!13383))

(assert (=> bm!712 d!3507))

(declare-fun d!3509 () Bool)

(declare-fun e!12066 () Bool)

(assert (=> d!3509 e!12066))

(declare-fun res!13004 () Bool)

(assert (=> d!3509 (=> (not res!13004) (not e!12066))))

(declare-fun lt!5334 () SeekEntryResult!43)

(assert (=> d!3509 (= res!13004 ((_ is Found!43) lt!5334))))

(assert (=> d!3509 (= lt!5334 (seekEntryOrOpen!0 key!682 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun lt!5335 () Unit!352)

(declare-fun choose!192 (array!1037 array!1035 (_ BitVec 32) (_ BitVec 32) V!1045 V!1045 (_ BitVec 64) Int) Unit!352)

(assert (=> d!3509 (= lt!5335 (choose!192 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(assert (=> d!3509 (validMask!0 (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))))))

(assert (=> d!3509 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!2 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) key!682 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))) lt!5335)))

(declare-fun b!18852 () Bool)

(declare-fun res!13003 () Bool)

(assert (=> b!18852 (=> (not res!13003) (not e!12066))))

(assert (=> b!18852 (= res!13003 (inRange!0 (index!2292 lt!5334) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun b!18853 () Bool)

(assert (=> b!18853 (= e!12066 (= (select (arr!500 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705))))) (index!2292 lt!5334)) key!682))))

(assert (=> b!18853 (and (bvsge (index!2292 lt!5334) #b00000000000000000000000000000000) (bvslt (index!2292 lt!5334) (size!590 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))))))))

(assert (= (and d!3509 res!13004) b!18852))

(assert (= (and b!18852 res!13003) b!18853))

(assert (=> d!3509 m!12777))

(declare-fun m!13385 () Bool)

(assert (=> d!3509 m!13385))

(assert (=> d!3509 m!12821))

(declare-fun m!13387 () Bool)

(assert (=> b!18852 m!13387))

(declare-fun m!13389 () Bool)

(assert (=> b!18853 m!13389))

(assert (=> bm!692 d!3509))

(declare-fun d!3511 () Bool)

(declare-fun e!12067 () Bool)

(assert (=> d!3511 e!12067))

(declare-fun res!13005 () Bool)

(assert (=> d!3511 (=> res!13005 e!12067)))

(declare-fun lt!5337 () Bool)

(assert (=> d!3511 (= res!13005 (not lt!5337))))

(declare-fun lt!5338 () Bool)

(assert (=> d!3511 (= lt!5337 lt!5338)))

(declare-fun lt!5339 () Unit!352)

(declare-fun e!12068 () Unit!352)

(assert (=> d!3511 (= lt!5339 e!12068)))

(declare-fun c!2007 () Bool)

(assert (=> d!3511 (= c!2007 lt!5338)))

(assert (=> d!3511 (= lt!5338 (containsKey!23 (toList!284 lt!4731) (_1!396 (tuple2!791 key!682 v!259))))))

(assert (=> d!3511 (= (contains!216 lt!4731 (_1!396 (tuple2!791 key!682 v!259))) lt!5337)))

(declare-fun b!18854 () Bool)

(declare-fun lt!5336 () Unit!352)

(assert (=> b!18854 (= e!12068 lt!5336)))

(assert (=> b!18854 (= lt!5336 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!284 lt!4731) (_1!396 (tuple2!791 key!682 v!259))))))

(assert (=> b!18854 (isDefined!21 (getValueByKey!59 (toList!284 lt!4731) (_1!396 (tuple2!791 key!682 v!259))))))

(declare-fun b!18855 () Bool)

(declare-fun Unit!376 () Unit!352)

(assert (=> b!18855 (= e!12068 Unit!376)))

(declare-fun b!18856 () Bool)

(assert (=> b!18856 (= e!12067 (isDefined!21 (getValueByKey!59 (toList!284 lt!4731) (_1!396 (tuple2!791 key!682 v!259)))))))

(assert (= (and d!3511 c!2007) b!18854))

(assert (= (and d!3511 (not c!2007)) b!18855))

(assert (= (and d!3511 (not res!13005)) b!18856))

(declare-fun m!13391 () Bool)

(assert (=> d!3511 m!13391))

(declare-fun m!13393 () Bool)

(assert (=> b!18854 m!13393))

(assert (=> b!18854 m!12719))

(assert (=> b!18854 m!12719))

(declare-fun m!13395 () Bool)

(assert (=> b!18854 m!13395))

(assert (=> b!18856 m!12719))

(assert (=> b!18856 m!12719))

(assert (=> b!18856 m!13395))

(assert (=> d!3421 d!3511))

(declare-fun b!18857 () Bool)

(declare-fun e!12069 () Option!65)

(assert (=> b!18857 (= e!12069 (Some!64 (_2!396 (h!1101 lt!4729))))))

(declare-fun b!18860 () Bool)

(declare-fun e!12070 () Option!65)

(assert (=> b!18860 (= e!12070 None!63)))

(declare-fun b!18858 () Bool)

(assert (=> b!18858 (= e!12069 e!12070)))

(declare-fun c!2009 () Bool)

(assert (=> b!18858 (= c!2009 (and ((_ is Cons!535) lt!4729) (not (= (_1!396 (h!1101 lt!4729)) (_1!396 (tuple2!791 key!682 v!259))))))))

(declare-fun c!2008 () Bool)

(declare-fun d!3513 () Bool)

(assert (=> d!3513 (= c!2008 (and ((_ is Cons!535) lt!4729) (= (_1!396 (h!1101 lt!4729)) (_1!396 (tuple2!791 key!682 v!259)))))))

(assert (=> d!3513 (= (getValueByKey!59 lt!4729 (_1!396 (tuple2!791 key!682 v!259))) e!12069)))

(declare-fun b!18859 () Bool)

(assert (=> b!18859 (= e!12070 (getValueByKey!59 (t!3178 lt!4729) (_1!396 (tuple2!791 key!682 v!259))))))

(assert (= (and d!3513 c!2008) b!18857))

(assert (= (and d!3513 (not c!2008)) b!18858))

(assert (= (and b!18858 c!2009) b!18859))

(assert (= (and b!18858 (not c!2009)) b!18860))

(declare-fun m!13397 () Bool)

(assert (=> b!18859 m!13397))

(assert (=> d!3421 d!3513))

(declare-fun d!3515 () Bool)

(assert (=> d!3515 (= (getValueByKey!59 lt!4729 (_1!396 (tuple2!791 key!682 v!259))) (Some!64 (_2!396 (tuple2!791 key!682 v!259))))))

(declare-fun lt!5342 () Unit!352)

(declare-fun choose!193 (List!539 (_ BitVec 64) V!1045) Unit!352)

(assert (=> d!3515 (= lt!5342 (choose!193 lt!4729 (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259))))))

(declare-fun e!12073 () Bool)

(assert (=> d!3515 e!12073))

(declare-fun res!13010 () Bool)

(assert (=> d!3515 (=> (not res!13010) (not e!12073))))

(assert (=> d!3515 (= res!13010 (isStrictlySorted!170 lt!4729))))

(assert (=> d!3515 (= (lemmaContainsTupThenGetReturnValue!16 lt!4729 (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259))) lt!5342)))

(declare-fun b!18865 () Bool)

(declare-fun res!13011 () Bool)

(assert (=> b!18865 (=> (not res!13011) (not e!12073))))

(assert (=> b!18865 (= res!13011 (containsKey!23 lt!4729 (_1!396 (tuple2!791 key!682 v!259))))))

(declare-fun b!18866 () Bool)

(assert (=> b!18866 (= e!12073 (contains!217 lt!4729 (tuple2!791 (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259)))))))

(assert (= (and d!3515 res!13010) b!18865))

(assert (= (and b!18865 res!13011) b!18866))

(assert (=> d!3515 m!12713))

(declare-fun m!13399 () Bool)

(assert (=> d!3515 m!13399))

(declare-fun m!13401 () Bool)

(assert (=> d!3515 m!13401))

(declare-fun m!13403 () Bool)

(assert (=> b!18865 m!13403))

(declare-fun m!13405 () Bool)

(assert (=> b!18866 m!13405))

(assert (=> d!3421 d!3515))

(declare-fun b!18887 () Bool)

(declare-fun e!12084 () List!539)

(declare-fun e!12087 () List!539)

(assert (=> b!18887 (= e!12084 e!12087)))

(declare-fun c!2018 () Bool)

(assert (=> b!18887 (= c!2018 (and ((_ is Cons!535) (toList!284 call!625)) (= (_1!396 (h!1101 (toList!284 call!625))) (_1!396 (tuple2!791 key!682 v!259)))))))

(declare-fun e!12086 () List!539)

(declare-fun b!18888 () Bool)

(assert (=> b!18888 (= e!12086 (insertStrictlySorted!16 (t!3178 (toList!284 call!625)) (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259))))))

(declare-fun bm!860 () Bool)

(declare-fun call!864 () List!539)

(declare-fun call!863 () List!539)

(assert (=> bm!860 (= call!864 call!863)))

(declare-fun lt!5345 () List!539)

(declare-fun e!12088 () Bool)

(declare-fun b!18889 () Bool)

(assert (=> b!18889 (= e!12088 (contains!217 lt!5345 (tuple2!791 (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259)))))))

(declare-fun b!18890 () Bool)

(declare-fun res!13016 () Bool)

(assert (=> b!18890 (=> (not res!13016) (not e!12088))))

(assert (=> b!18890 (= res!13016 (containsKey!23 lt!5345 (_1!396 (tuple2!791 key!682 v!259))))))

(declare-fun d!3517 () Bool)

(assert (=> d!3517 e!12088))

(declare-fun res!13017 () Bool)

(assert (=> d!3517 (=> (not res!13017) (not e!12088))))

(assert (=> d!3517 (= res!13017 (isStrictlySorted!170 lt!5345))))

(assert (=> d!3517 (= lt!5345 e!12084)))

(declare-fun c!2019 () Bool)

(assert (=> d!3517 (= c!2019 (and ((_ is Cons!535) (toList!284 call!625)) (bvslt (_1!396 (h!1101 (toList!284 call!625))) (_1!396 (tuple2!791 key!682 v!259)))))))

(assert (=> d!3517 (isStrictlySorted!170 (toList!284 call!625))))

(assert (=> d!3517 (= (insertStrictlySorted!16 (toList!284 call!625) (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259))) lt!5345)))

(declare-fun c!2021 () Bool)

(declare-fun b!18891 () Bool)

(assert (=> b!18891 (= e!12086 (ite c!2018 (t!3178 (toList!284 call!625)) (ite c!2021 (Cons!535 (h!1101 (toList!284 call!625)) (t!3178 (toList!284 call!625))) Nil!536)))))

(declare-fun b!18892 () Bool)

(assert (=> b!18892 (= c!2021 (and ((_ is Cons!535) (toList!284 call!625)) (bvsgt (_1!396 (h!1101 (toList!284 call!625))) (_1!396 (tuple2!791 key!682 v!259)))))))

(declare-fun e!12085 () List!539)

(assert (=> b!18892 (= e!12087 e!12085)))

(declare-fun b!18893 () Bool)

(assert (=> b!18893 (= e!12087 call!863)))

(declare-fun b!18894 () Bool)

(assert (=> b!18894 (= e!12085 call!864)))

(declare-fun bm!861 () Bool)

(declare-fun call!865 () List!539)

(declare-fun $colon$colon!30 (List!539 tuple2!790) List!539)

(assert (=> bm!861 (= call!865 ($colon$colon!30 e!12086 (ite c!2019 (h!1101 (toList!284 call!625)) (tuple2!791 (_1!396 (tuple2!791 key!682 v!259)) (_2!396 (tuple2!791 key!682 v!259))))))))

(declare-fun c!2020 () Bool)

(assert (=> bm!861 (= c!2020 c!2019)))

(declare-fun b!18895 () Bool)

(assert (=> b!18895 (= e!12085 call!864)))

(declare-fun b!18896 () Bool)

(assert (=> b!18896 (= e!12084 call!865)))

(declare-fun bm!862 () Bool)

(assert (=> bm!862 (= call!863 call!865)))

(assert (= (and d!3517 c!2019) b!18896))

(assert (= (and d!3517 (not c!2019)) b!18887))

(assert (= (and b!18887 c!2018) b!18893))

(assert (= (and b!18887 (not c!2018)) b!18892))

(assert (= (and b!18892 c!2021) b!18894))

(assert (= (and b!18892 (not c!2021)) b!18895))

(assert (= (or b!18894 b!18895) bm!860))

(assert (= (or b!18893 bm!860) bm!862))

(assert (= (or b!18896 bm!862) bm!861))

(assert (= (and bm!861 c!2020) b!18888))

(assert (= (and bm!861 (not c!2020)) b!18891))

(assert (= (and d!3517 res!13017) b!18890))

(assert (= (and b!18890 res!13016) b!18889))

(declare-fun m!13407 () Bool)

(assert (=> b!18889 m!13407))

(declare-fun m!13409 () Bool)

(assert (=> d!3517 m!13409))

(declare-fun m!13411 () Bool)

(assert (=> d!3517 m!13411))

(declare-fun m!13413 () Bool)

(assert (=> b!18890 m!13413))

(declare-fun m!13415 () Bool)

(assert (=> bm!861 m!13415))

(declare-fun m!13417 () Bool)

(assert (=> b!18888 m!13417))

(assert (=> d!3421 d!3517))

(declare-fun d!3519 () Bool)

(assert (=> d!3519 (= (map!356 (v!1473 (underlying!62 (_2!397 lt!4705)))) (getCurrentListMap!121 (_keys!3087 (v!1473 (underlying!62 (_2!397 lt!4705)))) (_values!1659 (v!1473 (underlying!62 (_2!397 lt!4705)))) (mask!4595 (v!1473 (underlying!62 (_2!397 lt!4705)))) (extraKeys!1575 (v!1473 (underlying!62 (_2!397 lt!4705)))) (zeroValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) (minValue!1598 (v!1473 (underlying!62 (_2!397 lt!4705)))) #b00000000000000000000000000000000 (defaultEntry!1662 (v!1473 (underlying!62 (_2!397 lt!4705))))))))

(declare-fun bs!850 () Bool)

(assert (= bs!850 d!3519))

(assert (=> bs!850 m!12825))

(assert (=> bm!691 d!3519))

(declare-fun d!3521 () Bool)

(assert (=> d!3521 (= (map!354 (_2!397 lt!4848)) (map!356 (v!1473 (underlying!62 (_2!397 lt!4848)))))))

(declare-fun bs!851 () Bool)

(assert (= bs!851 d!3521))

(declare-fun m!13419 () Bool)

(assert (=> bs!851 m!13419))

(assert (=> b!18426 d!3521))

(assert (=> b!18426 d!3423))

(declare-fun d!3523 () Bool)

(declare-fun e!12089 () Bool)

(assert (=> d!3523 e!12089))

(declare-fun res!13018 () Bool)

(assert (=> d!3523 (=> res!13018 e!12089)))

(declare-fun lt!5347 () Bool)

(assert (=> d!3523 (= res!13018 (not lt!5347))))

(declare-fun lt!5348 () Bool)

(assert (=> d!3523 (= lt!5347 lt!5348)))

(declare-fun lt!5349 () Unit!352)

(declare-fun e!12090 () Unit!352)

(assert (=> d!3523 (= lt!5349 e!12090)))

(declare-fun c!2022 () Bool)

(assert (=> d!3523 (= c!2022 lt!5348)))

(assert (=> d!3523 (= lt!5348 (containsKey!23 (toList!284 call!687) key!682))))

(assert (=> d!3523 (= (contains!216 call!687 key!682) lt!5347)))

(declare-fun b!18897 () Bool)

(declare-fun lt!5346 () Unit!352)

(assert (=> b!18897 (= e!12090 lt!5346)))

(assert (=> b!18897 (= lt!5346 (lemmaContainsKeyImpliesGetValueByKeyDefined!20 (toList!284 call!687) key!682))))

(assert (=> b!18897 (isDefined!21 (getValueByKey!59 (toList!284 call!687) key!682))))

(declare-fun b!18898 () Bool)

(declare-fun Unit!377 () Unit!352)

(assert (=> b!18898 (= e!12090 Unit!377)))

(declare-fun b!18899 () Bool)

(assert (=> b!18899 (= e!12089 (isDefined!21 (getValueByKey!59 (toList!284 call!687) key!682)))))

(assert (= (and d!3523 c!2022) b!18897))

(assert (= (and d!3523 (not c!2022)) b!18898))

(assert (= (and d!3523 (not res!13018)) b!18899))

(declare-fun m!13421 () Bool)

(assert (=> d!3523 m!13421))

(declare-fun m!13423 () Bool)

(assert (=> b!18897 m!13423))

(declare-fun m!13425 () Bool)

(assert (=> b!18897 m!13425))

(assert (=> b!18897 m!13425))

(declare-fun m!13427 () Bool)

(assert (=> b!18897 m!13427))

(assert (=> b!18899 m!13425))

(assert (=> b!18899 m!13425))

(assert (=> b!18899 m!13427))

(assert (=> bm!701 d!3523))

(declare-fun d!3525 () Bool)

(declare-fun res!13023 () Bool)

(declare-fun e!12095 () Bool)

(assert (=> d!3525 (=> res!13023 e!12095)))

(assert (=> d!3525 (= res!13023 (and ((_ is Cons!535) (toList!284 lt!4706)) (= (_1!396 (h!1101 (toList!284 lt!4706))) key!682)))))

(assert (=> d!3525 (= (containsKey!23 (toList!284 lt!4706) key!682) e!12095)))

(declare-fun b!18904 () Bool)

(declare-fun e!12096 () Bool)

(assert (=> b!18904 (= e!12095 e!12096)))

(declare-fun res!13024 () Bool)

(assert (=> b!18904 (=> (not res!13024) (not e!12096))))

(assert (=> b!18904 (= res!13024 (and (or (not ((_ is Cons!535) (toList!284 lt!4706))) (bvsle (_1!396 (h!1101 (toList!284 lt!4706))) key!682)) ((_ is Cons!535) (toList!284 lt!4706)) (bvslt (_1!396 (h!1101 (toList!284 lt!4706))) key!682)))))

(declare-fun b!18905 () Bool)

(assert (=> b!18905 (= e!12096 (containsKey!23 (t!3178 (toList!284 lt!4706)) key!682))))

(assert (= (and d!3525 (not res!13023)) b!18904))

(assert (= (and b!18904 res!13024) b!18905))

(declare-fun m!13429 () Bool)

(assert (=> b!18905 m!13429))

(assert (=> d!3427 d!3525))

(declare-fun mapNonEmpty!814 () Bool)

(declare-fun mapRes!814 () Bool)

(declare-fun tp!3154 () Bool)

(declare-fun e!12098 () Bool)

(assert (=> mapNonEmpty!814 (= mapRes!814 (and tp!3154 e!12098))))

(declare-fun mapValue!814 () ValueCell!258)

(declare-fun mapRest!814 () (Array (_ BitVec 32) ValueCell!258))

(declare-fun mapKey!814 () (_ BitVec 32))

(assert (=> mapNonEmpty!814 (= mapRest!813 (store mapRest!814 mapKey!814 mapValue!814))))

(declare-fun mapIsEmpty!814 () Bool)

(assert (=> mapIsEmpty!814 mapRes!814))

(declare-fun b!18907 () Bool)

(declare-fun e!12097 () Bool)

(assert (=> b!18907 (= e!12097 tp_is_empty!915)))

(declare-fun b!18906 () Bool)

(assert (=> b!18906 (= e!12098 tp_is_empty!915)))

(declare-fun condMapEmpty!814 () Bool)

(declare-fun mapDefault!814 () ValueCell!258)

(assert (=> mapNonEmpty!813 (= condMapEmpty!814 (= mapRest!813 ((as const (Array (_ BitVec 32) ValueCell!258)) mapDefault!814)))))

(assert (=> mapNonEmpty!813 (= tp!3153 (and e!12097 mapRes!814))))

(assert (= (and mapNonEmpty!813 condMapEmpty!814) mapIsEmpty!814))

(assert (= (and mapNonEmpty!813 (not condMapEmpty!814)) mapNonEmpty!814))

(assert (= (and mapNonEmpty!814 ((_ is ValueCellFull!258) mapValue!814)) b!18906))

(assert (= (and mapNonEmpty!813 ((_ is ValueCellFull!258) mapDefault!814)) b!18907))

(declare-fun m!13431 () Bool)

(assert (=> mapNonEmpty!814 m!13431))

(declare-fun b_lambda!1459 () Bool)

(assert (= b_lambda!1455 (or (and b!18219 b_free!651) b_lambda!1459)))

(declare-fun b_lambda!1461 () Bool)

(assert (= b_lambda!1453 (or (and b!18219 b_free!651) b_lambda!1461)))

(declare-fun b_lambda!1463 () Bool)

(assert (= b_lambda!1451 (or (and b!18219 b_free!651) b_lambda!1463)))

(check-sat (not d!3491) (not b!18708) (not bm!822) (not b!18703) (not d!3443) (not bm!816) (not bm!819) (not b!18529) (not b!18748) (not b!18754) (not bm!781) (not bm!813) (not bm!755) (not bm!718) (not b!18590) (not bm!835) (not bm!782) (not bm!828) (not b!18755) (not b!18661) (not b!18852) (not bm!818) (not b!18826) (not b!18503) (not bm!773) (not b!18717) (not b_lambda!1459) (not b!18809) (not d!3487) (not bm!812) (not d!3481) (not b!18716) (not d!3509) (not d!3447) (not d!3495) (not bm!728) (not b!18704) (not b!18690) (not b!18890) (not b!18772) (not bm!774) (not b!18784) (not d!3449) (not bm!733) (not bm!842) (not b!18839) (not b!18655) (not b!18583) (not b!18588) (not b!18802) (not d!3453) (not b!18812) (not bm!811) (not bm!831) (not bm!837) (not d!3471) (not b!18758) (not b!18579) (not b!18592) (not b!18564) (not b!18854) (not bm!861) tp_is_empty!915 (not bm!843) (not b!18889) (not d!3457) (not b!18788) (not b!18856) (not b!18815) (not b!18651) (not b!18593) (not bm!749) (not b!18806) (not d!3511) (not bm!729) (not b!18563) (not b!18565) (not bm!731) (not d!3507) (not b!18715) (not b!18556) (not d!3503) (not bm!814) (not bm!844) (not b_lambda!1457) (not d!3445) (not b!18897) (not b!18500) (not bm!821) (not bm!775) (not b!18584) (not bm!751) (not bm!853) (not bm!779) (not b!18808) (not b!18773) (not bm!846) (not b!18700) (not b!18510) (not d!3461) (not b!18642) (not b!18540) (not b!18905) (not bm!719) (not b!18807) (not bm!841) (not b!18506) (not b_lambda!1447) (not b!18838) (not b!18497) (not d!3477) (not b!18568) (not d!3499) (not b!18541) (not bm!746) (not b_next!651) (not b!18666) (not d!3467) (not bm!748) (not b!18591) (not b!18542) (not b!18899) (not b!18698) (not d!3519) (not b!18866) (not bm!847) (not bm!833) (not b!18859) (not d!3501) (not b!18774) (not d!3473) (not d!3517) (not bm!772) b_and!1313 (not b!18589) (not b!18757) (not b!18598) (not b!18837) (not b!18581) (not mapNonEmpty!814) (not bm!825) (not b!18502) (not d!3505) (not d!3465) (not bm!826) (not b!18595) (not b!18650) (not b!18518) (not b!18587) (not b!18796) (not bm!743) (not bm!739) (not d!3497) (not b!18888) (not bm!780) (not d!3479) (not b!18652) (not b!18865) (not b!18709) (not b!18798) (not b!18797) (not b_lambda!1461) (not b!18699) (not bm!820) (not d!3521) (not bm!815) (not b!18586) (not b!18685) (not b!18660) (not bm!735) (not b_lambda!1449) (not bm!810) (not b!18515) (not bm!737) (not bm!849) (not d!3451) (not b!18669) (not b_lambda!1463) (not bm!745) (not bm!827) (not d!3523) (not d!3483) (not bm!817) (not d!3475) (not b!18656) (not d!3459) (not b!18801) (not bm!744) (not d!3515) (not d!3469) (not d!3455) (not b!18585))
(check-sat b_and!1313 (not b_next!651))
