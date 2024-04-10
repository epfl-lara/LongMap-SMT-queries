; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75502 () Bool)

(assert start!75502)

(declare-fun b!888444 () Bool)

(declare-fun b_free!15573 () Bool)

(declare-fun b_next!15573 () Bool)

(assert (=> b!888444 (= b_free!15573 (not b_next!15573))))

(declare-fun tp!54670 () Bool)

(declare-fun b_and!25811 () Bool)

(assert (=> b!888444 (= tp!54670 b_and!25811)))

(declare-fun b!888442 () Bool)

(declare-fun e!495051 () Bool)

(declare-fun tp_is_empty!17901 () Bool)

(assert (=> b!888442 (= e!495051 tp_is_empty!17901)))

(declare-fun b!888443 () Bool)

(declare-fun res!602380 () Bool)

(declare-fun e!495054 () Bool)

(assert (=> b!888443 (=> (not res!602380) (not e!495054))))

(declare-datatypes ((array!51772 0))(
  ( (array!51773 (arr!24897 (Array (_ BitVec 32) (_ BitVec 64))) (size!25338 (_ BitVec 32))) )
))
(declare-datatypes ((V!28833 0))(
  ( (V!28834 (val!9001 Int)) )
))
(declare-datatypes ((ValueCell!8469 0))(
  ( (ValueCellFull!8469 (v!11475 V!28833)) (EmptyCell!8469) )
))
(declare-datatypes ((array!51774 0))(
  ( (array!51775 (arr!24898 (Array (_ BitVec 32) ValueCell!8469)) (size!25339 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3954 0))(
  ( (LongMapFixedSize!3955 (defaultEntry!5171 Int) (mask!25593 (_ BitVec 32)) (extraKeys!4865 (_ BitVec 32)) (zeroValue!4969 V!28833) (minValue!4969 V!28833) (_size!2032 (_ BitVec 32)) (_keys!9850 array!51772) (_values!5156 array!51774) (_vacant!2032 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3954)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4324 (LongMapFixedSize!3954 (_ BitVec 64)) Bool)

(assert (=> b!888443 (= res!602380 (contains!4324 thiss!1181 key!785))))

(declare-fun b!888445 () Bool)

(declare-datatypes ((Option!447 0))(
  ( (Some!446 (v!11476 V!28833)) (None!445) )
))
(declare-fun isDefined!320 (Option!447) Bool)

(declare-datatypes ((tuple2!11934 0))(
  ( (tuple2!11935 (_1!5978 (_ BitVec 64)) (_2!5978 V!28833)) )
))
(declare-datatypes ((List!17690 0))(
  ( (Nil!17687) (Cons!17686 (h!18817 tuple2!11934) (t!24987 List!17690)) )
))
(declare-fun getValueByKey!441 (List!17690 (_ BitVec 64)) Option!447)

(declare-datatypes ((ListLongMap!10631 0))(
  ( (ListLongMap!10632 (toList!5331 List!17690)) )
))
(declare-fun map!12114 (LongMapFixedSize!3954) ListLongMap!10631)

(assert (=> b!888445 (= e!495054 (not (isDefined!320 (getValueByKey!441 (toList!5331 (map!12114 thiss!1181)) key!785))))))

(declare-fun mapNonEmpty!28388 () Bool)

(declare-fun mapRes!28388 () Bool)

(declare-fun tp!54669 () Bool)

(declare-fun e!495052 () Bool)

(assert (=> mapNonEmpty!28388 (= mapRes!28388 (and tp!54669 e!495052))))

(declare-fun mapValue!28388 () ValueCell!8469)

(declare-fun mapRest!28388 () (Array (_ BitVec 32) ValueCell!8469))

(declare-fun mapKey!28388 () (_ BitVec 32))

(assert (=> mapNonEmpty!28388 (= (arr!24898 (_values!5156 thiss!1181)) (store mapRest!28388 mapKey!28388 mapValue!28388))))

(declare-fun b!888446 () Bool)

(declare-fun res!602381 () Bool)

(assert (=> b!888446 (=> (not res!602381) (not e!495054))))

(assert (=> b!888446 (= res!602381 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888447 () Bool)

(assert (=> b!888447 (= e!495052 tp_is_empty!17901)))

(declare-fun mapIsEmpty!28388 () Bool)

(assert (=> mapIsEmpty!28388 mapRes!28388))

(declare-fun b!888448 () Bool)

(declare-fun e!495056 () Bool)

(assert (=> b!888448 (= e!495056 (and e!495051 mapRes!28388))))

(declare-fun condMapEmpty!28388 () Bool)

(declare-fun mapDefault!28388 () ValueCell!8469)

(assert (=> b!888448 (= condMapEmpty!28388 (= (arr!24898 (_values!5156 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8469)) mapDefault!28388)))))

(declare-fun res!602379 () Bool)

(assert (=> start!75502 (=> (not res!602379) (not e!495054))))

(declare-fun valid!1542 (LongMapFixedSize!3954) Bool)

(assert (=> start!75502 (= res!602379 (valid!1542 thiss!1181))))

(assert (=> start!75502 e!495054))

(declare-fun e!495053 () Bool)

(assert (=> start!75502 e!495053))

(assert (=> start!75502 true))

(declare-fun array_inv!19592 (array!51772) Bool)

(declare-fun array_inv!19593 (array!51774) Bool)

(assert (=> b!888444 (= e!495053 (and tp!54670 tp_is_empty!17901 (array_inv!19592 (_keys!9850 thiss!1181)) (array_inv!19593 (_values!5156 thiss!1181)) e!495056))))

(assert (= (and start!75502 res!602379) b!888446))

(assert (= (and b!888446 res!602381) b!888443))

(assert (= (and b!888443 res!602380) b!888445))

(assert (= (and b!888448 condMapEmpty!28388) mapIsEmpty!28388))

(assert (= (and b!888448 (not condMapEmpty!28388)) mapNonEmpty!28388))

(get-info :version)

(assert (= (and mapNonEmpty!28388 ((_ is ValueCellFull!8469) mapValue!28388)) b!888447))

(assert (= (and b!888448 ((_ is ValueCellFull!8469) mapDefault!28388)) b!888442))

(assert (= b!888444 b!888448))

(assert (= start!75502 b!888444))

(declare-fun m!827745 () Bool)

(assert (=> b!888443 m!827745))

(declare-fun m!827747 () Bool)

(assert (=> b!888445 m!827747))

(declare-fun m!827749 () Bool)

(assert (=> b!888445 m!827749))

(assert (=> b!888445 m!827749))

(declare-fun m!827751 () Bool)

(assert (=> b!888445 m!827751))

(declare-fun m!827753 () Bool)

(assert (=> mapNonEmpty!28388 m!827753))

(declare-fun m!827755 () Bool)

(assert (=> start!75502 m!827755))

(declare-fun m!827757 () Bool)

(assert (=> b!888444 m!827757))

(declare-fun m!827759 () Bool)

(assert (=> b!888444 m!827759))

(check-sat (not b!888443) (not b!888444) (not b_next!15573) (not mapNonEmpty!28388) tp_is_empty!17901 b_and!25811 (not start!75502) (not b!888445))
(check-sat b_and!25811 (not b_next!15573))
(get-model)

(declare-fun b!888490 () Bool)

(declare-fun e!495089 () Bool)

(assert (=> b!888490 (= e!495089 (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888491 () Bool)

(declare-fun e!495085 () Bool)

(assert (=> b!888491 (= e!495085 e!495089)))

(declare-fun c!93840 () Bool)

(assert (=> b!888491 (= c!93840 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888492 () Bool)

(assert (=> b!888492 (= e!495085 (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39447 () Bool)

(declare-fun call!39452 () ListLongMap!10631)

(declare-fun getCurrentListMap!2616 (array!51772 array!51774 (_ BitVec 32) (_ BitVec 32) V!28833 V!28833 (_ BitVec 32) Int) ListLongMap!10631)

(assert (=> bm!39447 (= call!39452 (getCurrentListMap!2616 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5171 thiss!1181)))))

(declare-fun b!888493 () Bool)

(declare-fun e!495086 () Bool)

(assert (=> b!888493 (= e!495086 false)))

(declare-fun c!93841 () Bool)

(declare-fun call!39451 () Bool)

(assert (=> b!888493 (= c!93841 call!39451)))

(declare-datatypes ((Unit!30267 0))(
  ( (Unit!30268) )
))
(declare-fun lt!401770 () Unit!30267)

(declare-fun e!495088 () Unit!30267)

(assert (=> b!888493 (= lt!401770 e!495088)))

(declare-fun b!888494 () Bool)

(declare-fun Unit!30269 () Unit!30267)

(assert (=> b!888494 (= e!495088 Unit!30269)))

(declare-fun d!110047 () Bool)

(declare-fun lt!401773 () Bool)

(declare-fun contains!4326 (ListLongMap!10631 (_ BitVec 64)) Bool)

(assert (=> d!110047 (= lt!401773 (contains!4326 (map!12114 thiss!1181) key!785))))

(assert (=> d!110047 (= lt!401773 e!495085)))

(declare-fun c!93842 () Bool)

(assert (=> d!110047 (= c!93842 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110047 (valid!1542 thiss!1181)))

(assert (=> d!110047 (= (contains!4324 thiss!1181 key!785) lt!401773)))

(declare-fun bm!39448 () Bool)

(declare-fun call!39450 () Bool)

(declare-fun arrayContainsKey!0 (array!51772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39448 (= call!39450 (arrayContainsKey!0 (_keys!9850 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!8767 0))(
  ( (MissingZero!8767 (index!37439 (_ BitVec 32))) (Found!8767 (index!37440 (_ BitVec 32))) (Intermediate!8767 (undefined!9579 Bool) (index!37441 (_ BitVec 32)) (x!75387 (_ BitVec 32))) (Undefined!8767) (MissingVacant!8767 (index!37442 (_ BitVec 32))) )
))
(declare-fun lt!401761 () SeekEntryResult!8767)

(declare-fun bm!39449 () Bool)

(declare-fun c!93839 () Bool)

(assert (=> bm!39449 (= call!39451 (contains!4326 call!39452 (ite c!93839 (select (arr!24897 (_keys!9850 thiss!1181)) (index!37440 lt!401761)) key!785)))))

(declare-fun b!888495 () Bool)

(declare-fun e!495087 () Bool)

(assert (=> b!888495 (= e!495087 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888496 () Bool)

(assert (=> b!888496 false))

(declare-fun lt!401767 () Unit!30267)

(declare-fun lt!401765 () Unit!30267)

(assert (=> b!888496 (= lt!401767 lt!401765)))

(declare-fun lt!401775 () SeekEntryResult!8767)

(declare-fun lt!401768 () (_ BitVec 32))

(assert (=> b!888496 (and ((_ is Found!8767) lt!401775) (= (index!37440 lt!401775) lt!401768))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51772 (_ BitVec 32)) SeekEntryResult!8767)

(assert (=> b!888496 (= lt!401775 (seekEntry!0 key!785 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51772 (_ BitVec 32)) Unit!30267)

(assert (=> b!888496 (= lt!401765 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401768 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)))))

(declare-fun lt!401774 () Unit!30267)

(declare-fun lt!401769 () Unit!30267)

(assert (=> b!888496 (= lt!401774 lt!401769)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51772 (_ BitVec 32)) Bool)

(assert (=> b!888496 (arrayForallSeekEntryOrOpenFound!0 lt!401768 (_keys!9850 thiss!1181) (mask!25593 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30267)

(assert (=> b!888496 (= lt!401769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9850 thiss!1181) (mask!25593 thiss!1181) #b00000000000000000000000000000000 lt!401768))))

(declare-fun arrayScanForKey!0 (array!51772 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888496 (= lt!401768 (arrayScanForKey!0 (_keys!9850 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!401764 () Unit!30267)

(declare-fun lt!401762 () Unit!30267)

(assert (=> b!888496 (= lt!401764 lt!401762)))

(assert (=> b!888496 e!495087))

(declare-fun c!93838 () Bool)

(assert (=> b!888496 (= c!93838 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!158 (array!51772 array!51774 (_ BitVec 32) (_ BitVec 32) V!28833 V!28833 (_ BitVec 64) Int) Unit!30267)

(assert (=> b!888496 (= lt!401762 (lemmaKeyInListMapIsInArray!158 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) key!785 (defaultEntry!5171 thiss!1181)))))

(declare-fun Unit!30270 () Unit!30267)

(assert (=> b!888496 (= e!495088 Unit!30270)))

(declare-fun b!888497 () Bool)

(assert (=> b!888497 (= c!93839 ((_ is Found!8767) lt!401761))))

(assert (=> b!888497 (= lt!401761 (seekEntry!0 key!785 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)))))

(assert (=> b!888497 (= e!495089 e!495086)))

(declare-fun b!888498 () Bool)

(assert (=> b!888498 (= e!495087 call!39450)))

(declare-fun b!888499 () Bool)

(assert (=> b!888499 (= e!495086 true)))

(declare-fun lt!401766 () Unit!30267)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51772 (_ BitVec 64) (_ BitVec 32)) Unit!30267)

(assert (=> b!888499 (= lt!401766 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9850 thiss!1181) key!785 (index!37440 lt!401761)))))

(assert (=> b!888499 call!39450))

(declare-fun lt!401763 () Unit!30267)

(assert (=> b!888499 (= lt!401763 lt!401766)))

(declare-fun lt!401772 () Unit!30267)

(declare-fun lemmaValidKeyInArrayIsInListMap!205 (array!51772 array!51774 (_ BitVec 32) (_ BitVec 32) V!28833 V!28833 (_ BitVec 32) Int) Unit!30267)

(assert (=> b!888499 (= lt!401772 (lemmaValidKeyInArrayIsInListMap!205 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) (index!37440 lt!401761) (defaultEntry!5171 thiss!1181)))))

(assert (=> b!888499 call!39451))

(declare-fun lt!401771 () Unit!30267)

(assert (=> b!888499 (= lt!401771 lt!401772)))

(assert (= (and d!110047 c!93842) b!888492))

(assert (= (and d!110047 (not c!93842)) b!888491))

(assert (= (and b!888491 c!93840) b!888490))

(assert (= (and b!888491 (not c!93840)) b!888497))

(assert (= (and b!888497 c!93839) b!888499))

(assert (= (and b!888497 (not c!93839)) b!888493))

(assert (= (and b!888493 c!93841) b!888496))

(assert (= (and b!888493 (not c!93841)) b!888494))

(assert (= (and b!888496 c!93838) b!888498))

(assert (= (and b!888496 (not c!93838)) b!888495))

(assert (= (or b!888499 b!888498) bm!39448))

(assert (= (or b!888499 b!888493) bm!39447))

(assert (= (or b!888499 b!888493) bm!39449))

(declare-fun m!827777 () Bool)

(assert (=> b!888497 m!827777))

(assert (=> d!110047 m!827747))

(assert (=> d!110047 m!827747))

(declare-fun m!827779 () Bool)

(assert (=> d!110047 m!827779))

(assert (=> d!110047 m!827755))

(declare-fun m!827781 () Bool)

(assert (=> bm!39449 m!827781))

(declare-fun m!827783 () Bool)

(assert (=> bm!39449 m!827783))

(declare-fun m!827785 () Bool)

(assert (=> b!888496 m!827785))

(declare-fun m!827787 () Bool)

(assert (=> b!888496 m!827787))

(assert (=> b!888496 m!827777))

(declare-fun m!827789 () Bool)

(assert (=> b!888496 m!827789))

(declare-fun m!827791 () Bool)

(assert (=> b!888496 m!827791))

(declare-fun m!827793 () Bool)

(assert (=> b!888496 m!827793))

(declare-fun m!827795 () Bool)

(assert (=> bm!39448 m!827795))

(declare-fun m!827797 () Bool)

(assert (=> bm!39447 m!827797))

(declare-fun m!827799 () Bool)

(assert (=> b!888499 m!827799))

(declare-fun m!827801 () Bool)

(assert (=> b!888499 m!827801))

(assert (=> b!888443 d!110047))

(declare-fun d!110049 () Bool)

(declare-fun isEmpty!676 (Option!447) Bool)

(assert (=> d!110049 (= (isDefined!320 (getValueByKey!441 (toList!5331 (map!12114 thiss!1181)) key!785)) (not (isEmpty!676 (getValueByKey!441 (toList!5331 (map!12114 thiss!1181)) key!785))))))

(declare-fun bs!24919 () Bool)

(assert (= bs!24919 d!110049))

(assert (=> bs!24919 m!827749))

(declare-fun m!827803 () Bool)

(assert (=> bs!24919 m!827803))

(assert (=> b!888445 d!110049))

(declare-fun b!888511 () Bool)

(declare-fun e!495095 () Option!447)

(assert (=> b!888511 (= e!495095 None!445)))

(declare-fun b!888508 () Bool)

(declare-fun e!495094 () Option!447)

(assert (=> b!888508 (= e!495094 (Some!446 (_2!5978 (h!18817 (toList!5331 (map!12114 thiss!1181))))))))

(declare-fun b!888510 () Bool)

(assert (=> b!888510 (= e!495095 (getValueByKey!441 (t!24987 (toList!5331 (map!12114 thiss!1181))) key!785))))

(declare-fun d!110051 () Bool)

(declare-fun c!93847 () Bool)

(assert (=> d!110051 (= c!93847 (and ((_ is Cons!17686) (toList!5331 (map!12114 thiss!1181))) (= (_1!5978 (h!18817 (toList!5331 (map!12114 thiss!1181)))) key!785)))))

(assert (=> d!110051 (= (getValueByKey!441 (toList!5331 (map!12114 thiss!1181)) key!785) e!495094)))

(declare-fun b!888509 () Bool)

(assert (=> b!888509 (= e!495094 e!495095)))

(declare-fun c!93848 () Bool)

(assert (=> b!888509 (= c!93848 (and ((_ is Cons!17686) (toList!5331 (map!12114 thiss!1181))) (not (= (_1!5978 (h!18817 (toList!5331 (map!12114 thiss!1181)))) key!785))))))

(assert (= (and d!110051 c!93847) b!888508))

(assert (= (and d!110051 (not c!93847)) b!888509))

(assert (= (and b!888509 c!93848) b!888510))

(assert (= (and b!888509 (not c!93848)) b!888511))

(declare-fun m!827805 () Bool)

(assert (=> b!888510 m!827805))

(assert (=> b!888445 d!110051))

(declare-fun d!110053 () Bool)

(assert (=> d!110053 (= (map!12114 thiss!1181) (getCurrentListMap!2616 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5171 thiss!1181)))))

(declare-fun bs!24920 () Bool)

(assert (= bs!24920 d!110053))

(assert (=> bs!24920 m!827797))

(assert (=> b!888445 d!110053))

(declare-fun d!110055 () Bool)

(declare-fun res!602397 () Bool)

(declare-fun e!495098 () Bool)

(assert (=> d!110055 (=> (not res!602397) (not e!495098))))

(declare-fun simpleValid!290 (LongMapFixedSize!3954) Bool)

(assert (=> d!110055 (= res!602397 (simpleValid!290 thiss!1181))))

(assert (=> d!110055 (= (valid!1542 thiss!1181) e!495098)))

(declare-fun b!888518 () Bool)

(declare-fun res!602398 () Bool)

(assert (=> b!888518 (=> (not res!602398) (not e!495098))))

(declare-fun arrayCountValidKeys!0 (array!51772 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888518 (= res!602398 (= (arrayCountValidKeys!0 (_keys!9850 thiss!1181) #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))) (_size!2032 thiss!1181)))))

(declare-fun b!888519 () Bool)

(declare-fun res!602399 () Bool)

(assert (=> b!888519 (=> (not res!602399) (not e!495098))))

(assert (=> b!888519 (= res!602399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)))))

(declare-fun b!888520 () Bool)

(declare-datatypes ((List!17692 0))(
  ( (Nil!17689) (Cons!17688 (h!18819 (_ BitVec 64)) (t!24989 List!17692)) )
))
(declare-fun arrayNoDuplicates!0 (array!51772 (_ BitVec 32) List!17692) Bool)

(assert (=> b!888520 (= e!495098 (arrayNoDuplicates!0 (_keys!9850 thiss!1181) #b00000000000000000000000000000000 Nil!17689))))

(assert (= (and d!110055 res!602397) b!888518))

(assert (= (and b!888518 res!602398) b!888519))

(assert (= (and b!888519 res!602399) b!888520))

(declare-fun m!827807 () Bool)

(assert (=> d!110055 m!827807))

(declare-fun m!827809 () Bool)

(assert (=> b!888518 m!827809))

(declare-fun m!827811 () Bool)

(assert (=> b!888519 m!827811))

(declare-fun m!827813 () Bool)

(assert (=> b!888520 m!827813))

(assert (=> start!75502 d!110055))

(declare-fun d!110057 () Bool)

(assert (=> d!110057 (= (array_inv!19592 (_keys!9850 thiss!1181)) (bvsge (size!25338 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888444 d!110057))

(declare-fun d!110059 () Bool)

(assert (=> d!110059 (= (array_inv!19593 (_values!5156 thiss!1181)) (bvsge (size!25339 (_values!5156 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888444 d!110059))

(declare-fun b!888528 () Bool)

(declare-fun e!495104 () Bool)

(assert (=> b!888528 (= e!495104 tp_is_empty!17901)))

(declare-fun condMapEmpty!28394 () Bool)

(declare-fun mapDefault!28394 () ValueCell!8469)

(assert (=> mapNonEmpty!28388 (= condMapEmpty!28394 (= mapRest!28388 ((as const (Array (_ BitVec 32) ValueCell!8469)) mapDefault!28394)))))

(declare-fun mapRes!28394 () Bool)

(assert (=> mapNonEmpty!28388 (= tp!54669 (and e!495104 mapRes!28394))))

(declare-fun mapNonEmpty!28394 () Bool)

(declare-fun tp!54679 () Bool)

(declare-fun e!495103 () Bool)

(assert (=> mapNonEmpty!28394 (= mapRes!28394 (and tp!54679 e!495103))))

(declare-fun mapValue!28394 () ValueCell!8469)

(declare-fun mapRest!28394 () (Array (_ BitVec 32) ValueCell!8469))

(declare-fun mapKey!28394 () (_ BitVec 32))

(assert (=> mapNonEmpty!28394 (= mapRest!28388 (store mapRest!28394 mapKey!28394 mapValue!28394))))

(declare-fun mapIsEmpty!28394 () Bool)

(assert (=> mapIsEmpty!28394 mapRes!28394))

(declare-fun b!888527 () Bool)

(assert (=> b!888527 (= e!495103 tp_is_empty!17901)))

(assert (= (and mapNonEmpty!28388 condMapEmpty!28394) mapIsEmpty!28394))

(assert (= (and mapNonEmpty!28388 (not condMapEmpty!28394)) mapNonEmpty!28394))

(assert (= (and mapNonEmpty!28394 ((_ is ValueCellFull!8469) mapValue!28394)) b!888527))

(assert (= (and mapNonEmpty!28388 ((_ is ValueCellFull!8469) mapDefault!28394)) b!888528))

(declare-fun m!827815 () Bool)

(assert (=> mapNonEmpty!28394 m!827815))

(check-sat (not b!888520) (not b!888518) (not b!888510) (not d!110049) (not b!888519) (not b!888497) (not d!110053) (not bm!39449) (not d!110055) (not bm!39447) (not b!888499) (not b!888496) tp_is_empty!17901 b_and!25811 (not bm!39448) (not b_next!15573) (not mapNonEmpty!28394) (not d!110047))
(check-sat b_and!25811 (not b_next!15573))
(get-model)

(declare-fun d!110061 () Bool)

(declare-fun res!602404 () Bool)

(declare-fun e!495109 () Bool)

(assert (=> d!110061 (=> res!602404 e!495109)))

(assert (=> d!110061 (= res!602404 (= (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110061 (= (arrayContainsKey!0 (_keys!9850 thiss!1181) key!785 #b00000000000000000000000000000000) e!495109)))

(declare-fun b!888533 () Bool)

(declare-fun e!495110 () Bool)

(assert (=> b!888533 (= e!495109 e!495110)))

(declare-fun res!602405 () Bool)

(assert (=> b!888533 (=> (not res!602405) (not e!495110))))

(assert (=> b!888533 (= res!602405 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25338 (_keys!9850 thiss!1181))))))

(declare-fun b!888534 () Bool)

(assert (=> b!888534 (= e!495110 (arrayContainsKey!0 (_keys!9850 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110061 (not res!602404)) b!888533))

(assert (= (and b!888533 res!602405) b!888534))

(declare-fun m!827817 () Bool)

(assert (=> d!110061 m!827817))

(declare-fun m!827819 () Bool)

(assert (=> b!888534 m!827819))

(assert (=> bm!39448 d!110061))

(declare-fun bm!39464 () Bool)

(declare-fun call!39472 () Bool)

(declare-fun lt!401823 () ListLongMap!10631)

(assert (=> bm!39464 (= call!39472 (contains!4326 lt!401823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888577 () Bool)

(declare-fun e!495141 () Bool)

(declare-fun apply!399 (ListLongMap!10631 (_ BitVec 64)) V!28833)

(assert (=> b!888577 (= e!495141 (= (apply!399 lt!401823 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4969 thiss!1181)))))

(declare-fun b!888578 () Bool)

(declare-fun e!495140 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!888578 (= e!495140 (validKeyInArray!0 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888579 () Bool)

(declare-fun e!495145 () Bool)

(assert (=> b!888579 (= e!495145 (not call!39472))))

(declare-fun b!888580 () Bool)

(declare-fun e!495139 () Unit!30267)

(declare-fun Unit!30271 () Unit!30267)

(assert (=> b!888580 (= e!495139 Unit!30271)))

(declare-fun bm!39465 () Bool)

(declare-fun call!39468 () ListLongMap!10631)

(declare-fun call!39467 () ListLongMap!10631)

(assert (=> bm!39465 (= call!39468 call!39467)))

(declare-fun b!888582 () Bool)

(declare-fun e!495138 () Bool)

(assert (=> b!888582 (= e!495138 (validKeyInArray!0 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888583 () Bool)

(declare-fun res!602432 () Bool)

(declare-fun e!495148 () Bool)

(assert (=> b!888583 (=> (not res!602432) (not e!495148))))

(declare-fun e!495146 () Bool)

(assert (=> b!888583 (= res!602432 e!495146)))

(declare-fun res!602424 () Bool)

(assert (=> b!888583 (=> res!602424 e!495146)))

(assert (=> b!888583 (= res!602424 (not e!495140))))

(declare-fun res!602425 () Bool)

(assert (=> b!888583 (=> (not res!602425) (not e!495140))))

(assert (=> b!888583 (= res!602425 (bvslt #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))))))

(declare-fun b!888584 () Bool)

(declare-fun e!495137 () Bool)

(assert (=> b!888584 (= e!495146 e!495137)))

(declare-fun res!602430 () Bool)

(assert (=> b!888584 (=> (not res!602430) (not e!495137))))

(assert (=> b!888584 (= res!602430 (contains!4326 lt!401823 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!888584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))))))

(declare-fun b!888585 () Bool)

(declare-fun e!495144 () ListLongMap!10631)

(declare-fun call!39469 () ListLongMap!10631)

(assert (=> b!888585 (= e!495144 call!39469)))

(declare-fun b!888586 () Bool)

(declare-fun e!495143 () ListLongMap!10631)

(assert (=> b!888586 (= e!495143 call!39469)))

(declare-fun b!888587 () Bool)

(declare-fun e!495147 () Bool)

(declare-fun e!495149 () Bool)

(assert (=> b!888587 (= e!495147 e!495149)))

(declare-fun res!602427 () Bool)

(declare-fun call!39473 () Bool)

(assert (=> b!888587 (= res!602427 call!39473)))

(assert (=> b!888587 (=> (not res!602427) (not e!495149))))

(declare-fun b!888588 () Bool)

(assert (=> b!888588 (= e!495148 e!495145)))

(declare-fun c!93866 () Bool)

(assert (=> b!888588 (= c!93866 (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39466 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3273 (array!51772 array!51774 (_ BitVec 32) (_ BitVec 32) V!28833 V!28833 (_ BitVec 32) Int) ListLongMap!10631)

(assert (=> bm!39466 (= call!39467 (getCurrentListMapNoExtraKeys!3273 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5171 thiss!1181)))))

(declare-fun b!888589 () Bool)

(assert (=> b!888589 (= e!495149 (= (apply!399 lt!401823 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4969 thiss!1181)))))

(declare-fun b!888590 () Bool)

(declare-fun e!495142 () ListLongMap!10631)

(declare-fun call!39471 () ListLongMap!10631)

(declare-fun +!2586 (ListLongMap!10631 tuple2!11934) ListLongMap!10631)

(assert (=> b!888590 (= e!495142 (+!2586 call!39471 (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4969 thiss!1181))))))

(declare-fun bm!39467 () Bool)

(assert (=> bm!39467 (= call!39469 call!39471)))

(declare-fun b!888591 () Bool)

(declare-fun lt!401830 () Unit!30267)

(assert (=> b!888591 (= e!495139 lt!401830)))

(declare-fun lt!401821 () ListLongMap!10631)

(assert (=> b!888591 (= lt!401821 (getCurrentListMapNoExtraKeys!3273 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5171 thiss!1181)))))

(declare-fun lt!401839 () (_ BitVec 64))

(assert (=> b!888591 (= lt!401839 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401826 () (_ BitVec 64))

(assert (=> b!888591 (= lt!401826 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401824 () Unit!30267)

(declare-fun addStillContains!327 (ListLongMap!10631 (_ BitVec 64) V!28833 (_ BitVec 64)) Unit!30267)

(assert (=> b!888591 (= lt!401824 (addStillContains!327 lt!401821 lt!401839 (zeroValue!4969 thiss!1181) lt!401826))))

(assert (=> b!888591 (contains!4326 (+!2586 lt!401821 (tuple2!11935 lt!401839 (zeroValue!4969 thiss!1181))) lt!401826)))

(declare-fun lt!401827 () Unit!30267)

(assert (=> b!888591 (= lt!401827 lt!401824)))

(declare-fun lt!401828 () ListLongMap!10631)

(assert (=> b!888591 (= lt!401828 (getCurrentListMapNoExtraKeys!3273 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5171 thiss!1181)))))

(declare-fun lt!401829 () (_ BitVec 64))

(assert (=> b!888591 (= lt!401829 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401831 () (_ BitVec 64))

(assert (=> b!888591 (= lt!401831 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401833 () Unit!30267)

(declare-fun addApplyDifferent!327 (ListLongMap!10631 (_ BitVec 64) V!28833 (_ BitVec 64)) Unit!30267)

(assert (=> b!888591 (= lt!401833 (addApplyDifferent!327 lt!401828 lt!401829 (minValue!4969 thiss!1181) lt!401831))))

(assert (=> b!888591 (= (apply!399 (+!2586 lt!401828 (tuple2!11935 lt!401829 (minValue!4969 thiss!1181))) lt!401831) (apply!399 lt!401828 lt!401831))))

(declare-fun lt!401835 () Unit!30267)

(assert (=> b!888591 (= lt!401835 lt!401833)))

(declare-fun lt!401838 () ListLongMap!10631)

(assert (=> b!888591 (= lt!401838 (getCurrentListMapNoExtraKeys!3273 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5171 thiss!1181)))))

(declare-fun lt!401841 () (_ BitVec 64))

(assert (=> b!888591 (= lt!401841 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401836 () (_ BitVec 64))

(assert (=> b!888591 (= lt!401836 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401820 () Unit!30267)

(assert (=> b!888591 (= lt!401820 (addApplyDifferent!327 lt!401838 lt!401841 (zeroValue!4969 thiss!1181) lt!401836))))

(assert (=> b!888591 (= (apply!399 (+!2586 lt!401838 (tuple2!11935 lt!401841 (zeroValue!4969 thiss!1181))) lt!401836) (apply!399 lt!401838 lt!401836))))

(declare-fun lt!401832 () Unit!30267)

(assert (=> b!888591 (= lt!401832 lt!401820)))

(declare-fun lt!401822 () ListLongMap!10631)

(assert (=> b!888591 (= lt!401822 (getCurrentListMapNoExtraKeys!3273 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5171 thiss!1181)))))

(declare-fun lt!401837 () (_ BitVec 64))

(assert (=> b!888591 (= lt!401837 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401825 () (_ BitVec 64))

(assert (=> b!888591 (= lt!401825 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888591 (= lt!401830 (addApplyDifferent!327 lt!401822 lt!401837 (minValue!4969 thiss!1181) lt!401825))))

(assert (=> b!888591 (= (apply!399 (+!2586 lt!401822 (tuple2!11935 lt!401837 (minValue!4969 thiss!1181))) lt!401825) (apply!399 lt!401822 lt!401825))))

(declare-fun b!888592 () Bool)

(assert (=> b!888592 (= e!495142 e!495143)))

(declare-fun c!93865 () Bool)

(assert (=> b!888592 (= c!93865 (and (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39468 () Bool)

(declare-fun call!39470 () ListLongMap!10631)

(assert (=> bm!39468 (= call!39470 call!39468)))

(declare-fun bm!39469 () Bool)

(assert (=> bm!39469 (= call!39473 (contains!4326 lt!401823 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888593 () Bool)

(assert (=> b!888593 (= e!495144 call!39470)))

(declare-fun b!888594 () Bool)

(declare-fun res!602426 () Bool)

(assert (=> b!888594 (=> (not res!602426) (not e!495148))))

(assert (=> b!888594 (= res!602426 e!495147)))

(declare-fun c!93862 () Bool)

(assert (=> b!888594 (= c!93862 (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!110063 () Bool)

(assert (=> d!110063 e!495148))

(declare-fun res!602429 () Bool)

(assert (=> d!110063 (=> (not res!602429) (not e!495148))))

(assert (=> d!110063 (= res!602429 (or (bvsge #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))))))))

(declare-fun lt!401840 () ListLongMap!10631)

(assert (=> d!110063 (= lt!401823 lt!401840)))

(declare-fun lt!401834 () Unit!30267)

(assert (=> d!110063 (= lt!401834 e!495139)))

(declare-fun c!93864 () Bool)

(assert (=> d!110063 (= c!93864 e!495138)))

(declare-fun res!602431 () Bool)

(assert (=> d!110063 (=> (not res!602431) (not e!495138))))

(assert (=> d!110063 (= res!602431 (bvslt #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))))))

(assert (=> d!110063 (= lt!401840 e!495142)))

(declare-fun c!93861 () Bool)

(assert (=> d!110063 (= c!93861 (and (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110063 (validMask!0 (mask!25593 thiss!1181))))

(assert (=> d!110063 (= (getCurrentListMap!2616 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5171 thiss!1181)) lt!401823)))

(declare-fun b!888581 () Bool)

(declare-fun get!13150 (ValueCell!8469 V!28833) V!28833)

(declare-fun dynLambda!1290 (Int (_ BitVec 64)) V!28833)

(assert (=> b!888581 (= e!495137 (= (apply!399 lt!401823 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000)) (get!13150 (select (arr!24898 (_values!5156 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1290 (defaultEntry!5171 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!888581 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25339 (_values!5156 thiss!1181))))))

(assert (=> b!888581 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))))))

(declare-fun b!888595 () Bool)

(assert (=> b!888595 (= e!495147 (not call!39473))))

(declare-fun b!888596 () Bool)

(assert (=> b!888596 (= e!495145 e!495141)))

(declare-fun res!602428 () Bool)

(assert (=> b!888596 (= res!602428 call!39472)))

(assert (=> b!888596 (=> (not res!602428) (not e!495141))))

(declare-fun bm!39470 () Bool)

(assert (=> bm!39470 (= call!39471 (+!2586 (ite c!93861 call!39467 (ite c!93865 call!39468 call!39470)) (ite (or c!93861 c!93865) (tuple2!11935 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4969 thiss!1181)) (tuple2!11935 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4969 thiss!1181)))))))

(declare-fun b!888597 () Bool)

(declare-fun c!93863 () Bool)

(assert (=> b!888597 (= c!93863 (and (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!888597 (= e!495143 e!495144)))

(assert (= (and d!110063 c!93861) b!888590))

(assert (= (and d!110063 (not c!93861)) b!888592))

(assert (= (and b!888592 c!93865) b!888586))

(assert (= (and b!888592 (not c!93865)) b!888597))

(assert (= (and b!888597 c!93863) b!888585))

(assert (= (and b!888597 (not c!93863)) b!888593))

(assert (= (or b!888585 b!888593) bm!39468))

(assert (= (or b!888586 bm!39468) bm!39465))

(assert (= (or b!888586 b!888585) bm!39467))

(assert (= (or b!888590 bm!39465) bm!39466))

(assert (= (or b!888590 bm!39467) bm!39470))

(assert (= (and d!110063 res!602431) b!888582))

(assert (= (and d!110063 c!93864) b!888591))

(assert (= (and d!110063 (not c!93864)) b!888580))

(assert (= (and d!110063 res!602429) b!888583))

(assert (= (and b!888583 res!602425) b!888578))

(assert (= (and b!888583 (not res!602424)) b!888584))

(assert (= (and b!888584 res!602430) b!888581))

(assert (= (and b!888583 res!602432) b!888594))

(assert (= (and b!888594 c!93862) b!888587))

(assert (= (and b!888594 (not c!93862)) b!888595))

(assert (= (and b!888587 res!602427) b!888589))

(assert (= (or b!888587 b!888595) bm!39469))

(assert (= (and b!888594 res!602426) b!888588))

(assert (= (and b!888588 c!93866) b!888596))

(assert (= (and b!888588 (not c!93866)) b!888579))

(assert (= (and b!888596 res!602428) b!888577))

(assert (= (or b!888596 b!888579) bm!39464))

(declare-fun b_lambda!12879 () Bool)

(assert (=> (not b_lambda!12879) (not b!888581)))

(declare-fun t!24991 () Bool)

(declare-fun tb!5149 () Bool)

(assert (=> (and b!888444 (= (defaultEntry!5171 thiss!1181) (defaultEntry!5171 thiss!1181)) t!24991) tb!5149))

(declare-fun result!10001 () Bool)

(assert (=> tb!5149 (= result!10001 tp_is_empty!17901)))

(assert (=> b!888581 t!24991))

(declare-fun b_and!25815 () Bool)

(assert (= b_and!25811 (and (=> t!24991 result!10001) b_and!25815)))

(declare-fun m!827821 () Bool)

(assert (=> bm!39470 m!827821))

(declare-fun m!827823 () Bool)

(assert (=> b!888589 m!827823))

(declare-fun m!827825 () Bool)

(assert (=> b!888590 m!827825))

(assert (=> b!888584 m!827817))

(assert (=> b!888584 m!827817))

(declare-fun m!827827 () Bool)

(assert (=> b!888584 m!827827))

(declare-fun m!827829 () Bool)

(assert (=> b!888591 m!827829))

(declare-fun m!827831 () Bool)

(assert (=> b!888591 m!827831))

(assert (=> b!888591 m!827831))

(declare-fun m!827833 () Bool)

(assert (=> b!888591 m!827833))

(declare-fun m!827835 () Bool)

(assert (=> b!888591 m!827835))

(declare-fun m!827837 () Bool)

(assert (=> b!888591 m!827837))

(declare-fun m!827839 () Bool)

(assert (=> b!888591 m!827839))

(assert (=> b!888591 m!827817))

(declare-fun m!827841 () Bool)

(assert (=> b!888591 m!827841))

(declare-fun m!827843 () Bool)

(assert (=> b!888591 m!827843))

(declare-fun m!827845 () Bool)

(assert (=> b!888591 m!827845))

(declare-fun m!827847 () Bool)

(assert (=> b!888591 m!827847))

(declare-fun m!827849 () Bool)

(assert (=> b!888591 m!827849))

(assert (=> b!888591 m!827845))

(declare-fun m!827851 () Bool)

(assert (=> b!888591 m!827851))

(declare-fun m!827853 () Bool)

(assert (=> b!888591 m!827853))

(assert (=> b!888591 m!827835))

(declare-fun m!827855 () Bool)

(assert (=> b!888591 m!827855))

(declare-fun m!827857 () Bool)

(assert (=> b!888591 m!827857))

(declare-fun m!827859 () Bool)

(assert (=> b!888591 m!827859))

(assert (=> b!888591 m!827855))

(declare-fun m!827861 () Bool)

(assert (=> b!888581 m!827861))

(assert (=> b!888581 m!827861))

(declare-fun m!827863 () Bool)

(assert (=> b!888581 m!827863))

(declare-fun m!827865 () Bool)

(assert (=> b!888581 m!827865))

(assert (=> b!888581 m!827817))

(assert (=> b!888581 m!827863))

(assert (=> b!888581 m!827817))

(declare-fun m!827867 () Bool)

(assert (=> b!888581 m!827867))

(declare-fun m!827869 () Bool)

(assert (=> bm!39469 m!827869))

(assert (=> bm!39466 m!827859))

(declare-fun m!827871 () Bool)

(assert (=> d!110063 m!827871))

(assert (=> b!888578 m!827817))

(assert (=> b!888578 m!827817))

(declare-fun m!827873 () Bool)

(assert (=> b!888578 m!827873))

(declare-fun m!827875 () Bool)

(assert (=> b!888577 m!827875))

(declare-fun m!827877 () Bool)

(assert (=> bm!39464 m!827877))

(assert (=> b!888582 m!827817))

(assert (=> b!888582 m!827817))

(assert (=> b!888582 m!827873))

(assert (=> d!110053 d!110063))

(declare-fun d!110065 () Bool)

(declare-fun e!495155 () Bool)

(assert (=> d!110065 e!495155))

(declare-fun res!602435 () Bool)

(assert (=> d!110065 (=> res!602435 e!495155)))

(declare-fun lt!401853 () Bool)

(assert (=> d!110065 (= res!602435 (not lt!401853))))

(declare-fun lt!401852 () Bool)

(assert (=> d!110065 (= lt!401853 lt!401852)))

(declare-fun lt!401851 () Unit!30267)

(declare-fun e!495154 () Unit!30267)

(assert (=> d!110065 (= lt!401851 e!495154)))

(declare-fun c!93869 () Bool)

(assert (=> d!110065 (= c!93869 lt!401852)))

(declare-fun containsKey!420 (List!17690 (_ BitVec 64)) Bool)

(assert (=> d!110065 (= lt!401852 (containsKey!420 (toList!5331 call!39452) (ite c!93839 (select (arr!24897 (_keys!9850 thiss!1181)) (index!37440 lt!401761)) key!785)))))

(assert (=> d!110065 (= (contains!4326 call!39452 (ite c!93839 (select (arr!24897 (_keys!9850 thiss!1181)) (index!37440 lt!401761)) key!785)) lt!401853)))

(declare-fun b!888606 () Bool)

(declare-fun lt!401850 () Unit!30267)

(assert (=> b!888606 (= e!495154 lt!401850)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!316 (List!17690 (_ BitVec 64)) Unit!30267)

(assert (=> b!888606 (= lt!401850 (lemmaContainsKeyImpliesGetValueByKeyDefined!316 (toList!5331 call!39452) (ite c!93839 (select (arr!24897 (_keys!9850 thiss!1181)) (index!37440 lt!401761)) key!785)))))

(assert (=> b!888606 (isDefined!320 (getValueByKey!441 (toList!5331 call!39452) (ite c!93839 (select (arr!24897 (_keys!9850 thiss!1181)) (index!37440 lt!401761)) key!785)))))

(declare-fun b!888607 () Bool)

(declare-fun Unit!30272 () Unit!30267)

(assert (=> b!888607 (= e!495154 Unit!30272)))

(declare-fun b!888608 () Bool)

(assert (=> b!888608 (= e!495155 (isDefined!320 (getValueByKey!441 (toList!5331 call!39452) (ite c!93839 (select (arr!24897 (_keys!9850 thiss!1181)) (index!37440 lt!401761)) key!785))))))

(assert (= (and d!110065 c!93869) b!888606))

(assert (= (and d!110065 (not c!93869)) b!888607))

(assert (= (and d!110065 (not res!602435)) b!888608))

(declare-fun m!827879 () Bool)

(assert (=> d!110065 m!827879))

(declare-fun m!827881 () Bool)

(assert (=> b!888606 m!827881))

(declare-fun m!827883 () Bool)

(assert (=> b!888606 m!827883))

(assert (=> b!888606 m!827883))

(declare-fun m!827885 () Bool)

(assert (=> b!888606 m!827885))

(assert (=> b!888608 m!827883))

(assert (=> b!888608 m!827883))

(assert (=> b!888608 m!827885))

(assert (=> bm!39449 d!110065))

(declare-fun d!110067 () Bool)

(assert (=> d!110067 (= (isEmpty!676 (getValueByKey!441 (toList!5331 (map!12114 thiss!1181)) key!785)) (not ((_ is Some!446) (getValueByKey!441 (toList!5331 (map!12114 thiss!1181)) key!785))))))

(assert (=> d!110049 d!110067))

(declare-fun d!110069 () Bool)

(declare-fun lt!401865 () SeekEntryResult!8767)

(assert (=> d!110069 (and (or ((_ is MissingVacant!8767) lt!401865) (not ((_ is Found!8767) lt!401865)) (and (bvsge (index!37440 lt!401865) #b00000000000000000000000000000000) (bvslt (index!37440 lt!401865) (size!25338 (_keys!9850 thiss!1181))))) (not ((_ is MissingVacant!8767) lt!401865)) (or (not ((_ is Found!8767) lt!401865)) (= (select (arr!24897 (_keys!9850 thiss!1181)) (index!37440 lt!401865)) key!785)))))

(declare-fun e!495162 () SeekEntryResult!8767)

(assert (=> d!110069 (= lt!401865 e!495162)))

(declare-fun c!93878 () Bool)

(declare-fun lt!401863 () SeekEntryResult!8767)

(assert (=> d!110069 (= c!93878 (and ((_ is Intermediate!8767) lt!401863) (undefined!9579 lt!401863)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51772 (_ BitVec 32)) SeekEntryResult!8767)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110069 (= lt!401863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25593 thiss!1181)) key!785 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)))))

(assert (=> d!110069 (validMask!0 (mask!25593 thiss!1181))))

(assert (=> d!110069 (= (seekEntry!0 key!785 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)) lt!401865)))

(declare-fun b!888621 () Bool)

(declare-fun e!495163 () SeekEntryResult!8767)

(assert (=> b!888621 (= e!495163 (MissingZero!8767 (index!37441 lt!401863)))))

(declare-fun b!888622 () Bool)

(declare-fun lt!401862 () SeekEntryResult!8767)

(assert (=> b!888622 (= e!495163 (ite ((_ is MissingVacant!8767) lt!401862) (MissingZero!8767 (index!37442 lt!401862)) lt!401862))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51772 (_ BitVec 32)) SeekEntryResult!8767)

(assert (=> b!888622 (= lt!401862 (seekKeyOrZeroReturnVacant!0 (x!75387 lt!401863) (index!37441 lt!401863) (index!37441 lt!401863) key!785 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)))))

(declare-fun b!888623 () Bool)

(assert (=> b!888623 (= e!495162 Undefined!8767)))

(declare-fun b!888624 () Bool)

(declare-fun e!495164 () SeekEntryResult!8767)

(assert (=> b!888624 (= e!495164 (Found!8767 (index!37441 lt!401863)))))

(declare-fun b!888625 () Bool)

(declare-fun c!93877 () Bool)

(declare-fun lt!401864 () (_ BitVec 64))

(assert (=> b!888625 (= c!93877 (= lt!401864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!888625 (= e!495164 e!495163)))

(declare-fun b!888626 () Bool)

(assert (=> b!888626 (= e!495162 e!495164)))

(assert (=> b!888626 (= lt!401864 (select (arr!24897 (_keys!9850 thiss!1181)) (index!37441 lt!401863)))))

(declare-fun c!93876 () Bool)

(assert (=> b!888626 (= c!93876 (= lt!401864 key!785))))

(assert (= (and d!110069 c!93878) b!888623))

(assert (= (and d!110069 (not c!93878)) b!888626))

(assert (= (and b!888626 c!93876) b!888624))

(assert (= (and b!888626 (not c!93876)) b!888625))

(assert (= (and b!888625 c!93877) b!888621))

(assert (= (and b!888625 (not c!93877)) b!888622))

(declare-fun m!827887 () Bool)

(assert (=> d!110069 m!827887))

(declare-fun m!827889 () Bool)

(assert (=> d!110069 m!827889))

(assert (=> d!110069 m!827889))

(declare-fun m!827891 () Bool)

(assert (=> d!110069 m!827891))

(assert (=> d!110069 m!827871))

(declare-fun m!827893 () Bool)

(assert (=> b!888622 m!827893))

(declare-fun m!827895 () Bool)

(assert (=> b!888626 m!827895))

(assert (=> b!888497 d!110069))

(declare-fun d!110071 () Bool)

(declare-fun e!495167 () Bool)

(assert (=> d!110071 e!495167))

(declare-fun c!93881 () Bool)

(assert (=> d!110071 (= c!93881 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401868 () Unit!30267)

(declare-fun choose!1458 (array!51772 array!51774 (_ BitVec 32) (_ BitVec 32) V!28833 V!28833 (_ BitVec 64) Int) Unit!30267)

(assert (=> d!110071 (= lt!401868 (choose!1458 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) key!785 (defaultEntry!5171 thiss!1181)))))

(assert (=> d!110071 (validMask!0 (mask!25593 thiss!1181))))

(assert (=> d!110071 (= (lemmaKeyInListMapIsInArray!158 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) key!785 (defaultEntry!5171 thiss!1181)) lt!401868)))

(declare-fun b!888631 () Bool)

(assert (=> b!888631 (= e!495167 (arrayContainsKey!0 (_keys!9850 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!888632 () Bool)

(assert (=> b!888632 (= e!495167 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4865 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110071 c!93881) b!888631))

(assert (= (and d!110071 (not c!93881)) b!888632))

(declare-fun m!827897 () Bool)

(assert (=> d!110071 m!827897))

(assert (=> d!110071 m!827871))

(assert (=> b!888631 m!827795))

(assert (=> b!888496 d!110071))

(declare-fun d!110073 () Bool)

(assert (=> d!110073 (arrayForallSeekEntryOrOpenFound!0 lt!401768 (_keys!9850 thiss!1181) (mask!25593 thiss!1181))))

(declare-fun lt!401871 () Unit!30267)

(declare-fun choose!38 (array!51772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30267)

(assert (=> d!110073 (= lt!401871 (choose!38 (_keys!9850 thiss!1181) (mask!25593 thiss!1181) #b00000000000000000000000000000000 lt!401768))))

(assert (=> d!110073 (validMask!0 (mask!25593 thiss!1181))))

(assert (=> d!110073 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9850 thiss!1181) (mask!25593 thiss!1181) #b00000000000000000000000000000000 lt!401768) lt!401871)))

(declare-fun bs!24921 () Bool)

(assert (= bs!24921 d!110073))

(assert (=> bs!24921 m!827793))

(declare-fun m!827899 () Bool)

(assert (=> bs!24921 m!827899))

(assert (=> bs!24921 m!827871))

(assert (=> b!888496 d!110073))

(assert (=> b!888496 d!110069))

(declare-fun d!110075 () Bool)

(declare-fun lt!401877 () SeekEntryResult!8767)

(assert (=> d!110075 (and ((_ is Found!8767) lt!401877) (= (index!37440 lt!401877) lt!401768))))

(assert (=> d!110075 (= lt!401877 (seekEntry!0 key!785 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)))))

(declare-fun lt!401876 () Unit!30267)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!51772 (_ BitVec 32)) Unit!30267)

(assert (=> d!110075 (= lt!401876 (choose!0 key!785 lt!401768 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)))))

(assert (=> d!110075 (validMask!0 (mask!25593 thiss!1181))))

(assert (=> d!110075 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401768 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)) lt!401876)))

(declare-fun bs!24922 () Bool)

(assert (= bs!24922 d!110075))

(assert (=> bs!24922 m!827777))

(declare-fun m!827901 () Bool)

(assert (=> bs!24922 m!827901))

(assert (=> bs!24922 m!827871))

(assert (=> b!888496 d!110075))

(declare-fun d!110077 () Bool)

(declare-fun lt!401880 () (_ BitVec 32))

(assert (=> d!110077 (and (or (bvslt lt!401880 #b00000000000000000000000000000000) (bvsge lt!401880 (size!25338 (_keys!9850 thiss!1181))) (and (bvsge lt!401880 #b00000000000000000000000000000000) (bvslt lt!401880 (size!25338 (_keys!9850 thiss!1181))))) (bvsge lt!401880 #b00000000000000000000000000000000) (bvslt lt!401880 (size!25338 (_keys!9850 thiss!1181))) (= (select (arr!24897 (_keys!9850 thiss!1181)) lt!401880) key!785))))

(declare-fun e!495170 () (_ BitVec 32))

(assert (=> d!110077 (= lt!401880 e!495170)))

(declare-fun c!93884 () Bool)

(assert (=> d!110077 (= c!93884 (= (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))) (bvslt (size!25338 (_keys!9850 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110077 (= (arrayScanForKey!0 (_keys!9850 thiss!1181) key!785 #b00000000000000000000000000000000) lt!401880)))

(declare-fun b!888637 () Bool)

(assert (=> b!888637 (= e!495170 #b00000000000000000000000000000000)))

(declare-fun b!888638 () Bool)

(assert (=> b!888638 (= e!495170 (arrayScanForKey!0 (_keys!9850 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110077 c!93884) b!888637))

(assert (= (and d!110077 (not c!93884)) b!888638))

(declare-fun m!827903 () Bool)

(assert (=> d!110077 m!827903))

(assert (=> d!110077 m!827817))

(declare-fun m!827905 () Bool)

(assert (=> b!888638 m!827905))

(assert (=> b!888496 d!110077))

(declare-fun d!110079 () Bool)

(declare-fun res!602440 () Bool)

(declare-fun e!495178 () Bool)

(assert (=> d!110079 (=> res!602440 e!495178)))

(assert (=> d!110079 (= res!602440 (bvsge lt!401768 (size!25338 (_keys!9850 thiss!1181))))))

(assert (=> d!110079 (= (arrayForallSeekEntryOrOpenFound!0 lt!401768 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)) e!495178)))

(declare-fun b!888647 () Bool)

(declare-fun e!495179 () Bool)

(assert (=> b!888647 (= e!495178 e!495179)))

(declare-fun c!93887 () Bool)

(assert (=> b!888647 (= c!93887 (validKeyInArray!0 (select (arr!24897 (_keys!9850 thiss!1181)) lt!401768)))))

(declare-fun b!888648 () Bool)

(declare-fun call!39476 () Bool)

(assert (=> b!888648 (= e!495179 call!39476)))

(declare-fun b!888649 () Bool)

(declare-fun e!495177 () Bool)

(assert (=> b!888649 (= e!495177 call!39476)))

(declare-fun b!888650 () Bool)

(assert (=> b!888650 (= e!495179 e!495177)))

(declare-fun lt!401889 () (_ BitVec 64))

(assert (=> b!888650 (= lt!401889 (select (arr!24897 (_keys!9850 thiss!1181)) lt!401768))))

(declare-fun lt!401888 () Unit!30267)

(assert (=> b!888650 (= lt!401888 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9850 thiss!1181) lt!401889 lt!401768))))

(assert (=> b!888650 (arrayContainsKey!0 (_keys!9850 thiss!1181) lt!401889 #b00000000000000000000000000000000)))

(declare-fun lt!401887 () Unit!30267)

(assert (=> b!888650 (= lt!401887 lt!401888)))

(declare-fun res!602441 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51772 (_ BitVec 32)) SeekEntryResult!8767)

(assert (=> b!888650 (= res!602441 (= (seekEntryOrOpen!0 (select (arr!24897 (_keys!9850 thiss!1181)) lt!401768) (_keys!9850 thiss!1181) (mask!25593 thiss!1181)) (Found!8767 lt!401768)))))

(assert (=> b!888650 (=> (not res!602441) (not e!495177))))

(declare-fun bm!39473 () Bool)

(assert (=> bm!39473 (= call!39476 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!401768 #b00000000000000000000000000000001) (_keys!9850 thiss!1181) (mask!25593 thiss!1181)))))

(assert (= (and d!110079 (not res!602440)) b!888647))

(assert (= (and b!888647 c!93887) b!888650))

(assert (= (and b!888647 (not c!93887)) b!888648))

(assert (= (and b!888650 res!602441) b!888649))

(assert (= (or b!888649 b!888648) bm!39473))

(declare-fun m!827907 () Bool)

(assert (=> b!888647 m!827907))

(assert (=> b!888647 m!827907))

(declare-fun m!827909 () Bool)

(assert (=> b!888647 m!827909))

(assert (=> b!888650 m!827907))

(declare-fun m!827911 () Bool)

(assert (=> b!888650 m!827911))

(declare-fun m!827913 () Bool)

(assert (=> b!888650 m!827913))

(assert (=> b!888650 m!827907))

(declare-fun m!827915 () Bool)

(assert (=> b!888650 m!827915))

(declare-fun m!827917 () Bool)

(assert (=> bm!39473 m!827917))

(assert (=> b!888496 d!110079))

(declare-fun b!888654 () Bool)

(declare-fun e!495181 () Option!447)

(assert (=> b!888654 (= e!495181 None!445)))

(declare-fun b!888651 () Bool)

(declare-fun e!495180 () Option!447)

(assert (=> b!888651 (= e!495180 (Some!446 (_2!5978 (h!18817 (t!24987 (toList!5331 (map!12114 thiss!1181)))))))))

(declare-fun b!888653 () Bool)

(assert (=> b!888653 (= e!495181 (getValueByKey!441 (t!24987 (t!24987 (toList!5331 (map!12114 thiss!1181)))) key!785))))

(declare-fun d!110081 () Bool)

(declare-fun c!93888 () Bool)

(assert (=> d!110081 (= c!93888 (and ((_ is Cons!17686) (t!24987 (toList!5331 (map!12114 thiss!1181)))) (= (_1!5978 (h!18817 (t!24987 (toList!5331 (map!12114 thiss!1181))))) key!785)))))

(assert (=> d!110081 (= (getValueByKey!441 (t!24987 (toList!5331 (map!12114 thiss!1181))) key!785) e!495180)))

(declare-fun b!888652 () Bool)

(assert (=> b!888652 (= e!495180 e!495181)))

(declare-fun c!93889 () Bool)

(assert (=> b!888652 (= c!93889 (and ((_ is Cons!17686) (t!24987 (toList!5331 (map!12114 thiss!1181)))) (not (= (_1!5978 (h!18817 (t!24987 (toList!5331 (map!12114 thiss!1181))))) key!785))))))

(assert (= (and d!110081 c!93888) b!888651))

(assert (= (and d!110081 (not c!93888)) b!888652))

(assert (= (and b!888652 c!93889) b!888653))

(assert (= (and b!888652 (not c!93889)) b!888654))

(declare-fun m!827919 () Bool)

(assert (=> b!888653 m!827919))

(assert (=> b!888510 d!110081))

(declare-fun b!888665 () Bool)

(declare-fun res!602453 () Bool)

(declare-fun e!495184 () Bool)

(assert (=> b!888665 (=> (not res!602453) (not e!495184))))

(declare-fun size!25342 (LongMapFixedSize!3954) (_ BitVec 32))

(assert (=> b!888665 (= res!602453 (= (size!25342 thiss!1181) (bvadd (_size!2032 thiss!1181) (bvsdiv (bvadd (extraKeys!4865 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!888666 () Bool)

(assert (=> b!888666 (= e!495184 (and (bvsge (extraKeys!4865 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4865 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2032 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!888663 () Bool)

(declare-fun res!602451 () Bool)

(assert (=> b!888663 (=> (not res!602451) (not e!495184))))

(assert (=> b!888663 (= res!602451 (and (= (size!25339 (_values!5156 thiss!1181)) (bvadd (mask!25593 thiss!1181) #b00000000000000000000000000000001)) (= (size!25338 (_keys!9850 thiss!1181)) (size!25339 (_values!5156 thiss!1181))) (bvsge (_size!2032 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2032 thiss!1181) (bvadd (mask!25593 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!110083 () Bool)

(declare-fun res!602452 () Bool)

(assert (=> d!110083 (=> (not res!602452) (not e!495184))))

(assert (=> d!110083 (= res!602452 (validMask!0 (mask!25593 thiss!1181)))))

(assert (=> d!110083 (= (simpleValid!290 thiss!1181) e!495184)))

(declare-fun b!888664 () Bool)

(declare-fun res!602450 () Bool)

(assert (=> b!888664 (=> (not res!602450) (not e!495184))))

(assert (=> b!888664 (= res!602450 (bvsge (size!25342 thiss!1181) (_size!2032 thiss!1181)))))

(assert (= (and d!110083 res!602452) b!888663))

(assert (= (and b!888663 res!602451) b!888664))

(assert (= (and b!888664 res!602450) b!888665))

(assert (= (and b!888665 res!602453) b!888666))

(declare-fun m!827921 () Bool)

(assert (=> b!888665 m!827921))

(assert (=> d!110083 m!827871))

(assert (=> b!888664 m!827921))

(assert (=> d!110055 d!110083))

(declare-fun b!888675 () Bool)

(declare-fun e!495190 () (_ BitVec 32))

(assert (=> b!888675 (= e!495190 #b00000000000000000000000000000000)))

(declare-fun b!888676 () Bool)

(declare-fun e!495189 () (_ BitVec 32))

(declare-fun call!39479 () (_ BitVec 32))

(assert (=> b!888676 (= e!495189 (bvadd #b00000000000000000000000000000001 call!39479))))

(declare-fun d!110085 () Bool)

(declare-fun lt!401892 () (_ BitVec 32))

(assert (=> d!110085 (and (bvsge lt!401892 #b00000000000000000000000000000000) (bvsle lt!401892 (bvsub (size!25338 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110085 (= lt!401892 e!495190)))

(declare-fun c!93895 () Bool)

(assert (=> d!110085 (= c!93895 (bvsge #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))))))

(assert (=> d!110085 (and (bvsle #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25338 (_keys!9850 thiss!1181)) (size!25338 (_keys!9850 thiss!1181))))))

(assert (=> d!110085 (= (arrayCountValidKeys!0 (_keys!9850 thiss!1181) #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))) lt!401892)))

(declare-fun b!888677 () Bool)

(assert (=> b!888677 (= e!495190 e!495189)))

(declare-fun c!93894 () Bool)

(assert (=> b!888677 (= c!93894 (validKeyInArray!0 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888678 () Bool)

(assert (=> b!888678 (= e!495189 call!39479)))

(declare-fun bm!39476 () Bool)

(assert (=> bm!39476 (= call!39479 (arrayCountValidKeys!0 (_keys!9850 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25338 (_keys!9850 thiss!1181))))))

(assert (= (and d!110085 c!93895) b!888675))

(assert (= (and d!110085 (not c!93895)) b!888677))

(assert (= (and b!888677 c!93894) b!888676))

(assert (= (and b!888677 (not c!93894)) b!888678))

(assert (= (or b!888676 b!888678) bm!39476))

(assert (=> b!888677 m!827817))

(assert (=> b!888677 m!827817))

(assert (=> b!888677 m!827873))

(declare-fun m!827923 () Bool)

(assert (=> bm!39476 m!827923))

(assert (=> b!888518 d!110085))

(declare-fun d!110087 () Bool)

(assert (=> d!110087 (arrayContainsKey!0 (_keys!9850 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!401895 () Unit!30267)

(declare-fun choose!13 (array!51772 (_ BitVec 64) (_ BitVec 32)) Unit!30267)

(assert (=> d!110087 (= lt!401895 (choose!13 (_keys!9850 thiss!1181) key!785 (index!37440 lt!401761)))))

(assert (=> d!110087 (bvsge (index!37440 lt!401761) #b00000000000000000000000000000000)))

(assert (=> d!110087 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9850 thiss!1181) key!785 (index!37440 lt!401761)) lt!401895)))

(declare-fun bs!24923 () Bool)

(assert (= bs!24923 d!110087))

(assert (=> bs!24923 m!827795))

(declare-fun m!827925 () Bool)

(assert (=> bs!24923 m!827925))

(assert (=> b!888499 d!110087))

(declare-fun d!110089 () Bool)

(declare-fun e!495193 () Bool)

(assert (=> d!110089 e!495193))

(declare-fun res!602456 () Bool)

(assert (=> d!110089 (=> (not res!602456) (not e!495193))))

(assert (=> d!110089 (= res!602456 (and (bvsge (index!37440 lt!401761) #b00000000000000000000000000000000) (bvslt (index!37440 lt!401761) (size!25338 (_keys!9850 thiss!1181)))))))

(declare-fun lt!401898 () Unit!30267)

(declare-fun choose!1459 (array!51772 array!51774 (_ BitVec 32) (_ BitVec 32) V!28833 V!28833 (_ BitVec 32) Int) Unit!30267)

(assert (=> d!110089 (= lt!401898 (choose!1459 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) (index!37440 lt!401761) (defaultEntry!5171 thiss!1181)))))

(assert (=> d!110089 (validMask!0 (mask!25593 thiss!1181))))

(assert (=> d!110089 (= (lemmaValidKeyInArrayIsInListMap!205 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) (index!37440 lt!401761) (defaultEntry!5171 thiss!1181)) lt!401898)))

(declare-fun b!888681 () Bool)

(assert (=> b!888681 (= e!495193 (contains!4326 (getCurrentListMap!2616 (_keys!9850 thiss!1181) (_values!5156 thiss!1181) (mask!25593 thiss!1181) (extraKeys!4865 thiss!1181) (zeroValue!4969 thiss!1181) (minValue!4969 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5171 thiss!1181)) (select (arr!24897 (_keys!9850 thiss!1181)) (index!37440 lt!401761))))))

(assert (= (and d!110089 res!602456) b!888681))

(declare-fun m!827927 () Bool)

(assert (=> d!110089 m!827927))

(assert (=> d!110089 m!827871))

(assert (=> b!888681 m!827797))

(assert (=> b!888681 m!827781))

(assert (=> b!888681 m!827797))

(assert (=> b!888681 m!827781))

(declare-fun m!827929 () Bool)

(assert (=> b!888681 m!827929))

(assert (=> b!888499 d!110089))

(assert (=> bm!39447 d!110063))

(declare-fun b!888692 () Bool)

(declare-fun e!495202 () Bool)

(declare-fun e!495204 () Bool)

(assert (=> b!888692 (= e!495202 e!495204)))

(declare-fun res!602463 () Bool)

(assert (=> b!888692 (=> (not res!602463) (not e!495204))))

(declare-fun e!495205 () Bool)

(assert (=> b!888692 (= res!602463 (not e!495205))))

(declare-fun res!602464 () Bool)

(assert (=> b!888692 (=> (not res!602464) (not e!495205))))

(assert (=> b!888692 (= res!602464 (validKeyInArray!0 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888693 () Bool)

(declare-fun e!495203 () Bool)

(declare-fun call!39482 () Bool)

(assert (=> b!888693 (= e!495203 call!39482)))

(declare-fun b!888695 () Bool)

(assert (=> b!888695 (= e!495203 call!39482)))

(declare-fun bm!39479 () Bool)

(declare-fun c!93898 () Bool)

(assert (=> bm!39479 (= call!39482 (arrayNoDuplicates!0 (_keys!9850 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93898 (Cons!17688 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000) Nil!17689) Nil!17689)))))

(declare-fun b!888696 () Bool)

(assert (=> b!888696 (= e!495204 e!495203)))

(assert (=> b!888696 (= c!93898 (validKeyInArray!0 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110091 () Bool)

(declare-fun res!602465 () Bool)

(assert (=> d!110091 (=> res!602465 e!495202)))

(assert (=> d!110091 (= res!602465 (bvsge #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))))))

(assert (=> d!110091 (= (arrayNoDuplicates!0 (_keys!9850 thiss!1181) #b00000000000000000000000000000000 Nil!17689) e!495202)))

(declare-fun b!888694 () Bool)

(declare-fun contains!4327 (List!17692 (_ BitVec 64)) Bool)

(assert (=> b!888694 (= e!495205 (contains!4327 Nil!17689 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110091 (not res!602465)) b!888692))

(assert (= (and b!888692 res!602464) b!888694))

(assert (= (and b!888692 res!602463) b!888696))

(assert (= (and b!888696 c!93898) b!888693))

(assert (= (and b!888696 (not c!93898)) b!888695))

(assert (= (or b!888693 b!888695) bm!39479))

(assert (=> b!888692 m!827817))

(assert (=> b!888692 m!827817))

(assert (=> b!888692 m!827873))

(assert (=> bm!39479 m!827817))

(declare-fun m!827931 () Bool)

(assert (=> bm!39479 m!827931))

(assert (=> b!888696 m!827817))

(assert (=> b!888696 m!827817))

(assert (=> b!888696 m!827873))

(assert (=> b!888694 m!827817))

(assert (=> b!888694 m!827817))

(declare-fun m!827933 () Bool)

(assert (=> b!888694 m!827933))

(assert (=> b!888520 d!110091))

(declare-fun d!110093 () Bool)

(declare-fun res!602466 () Bool)

(declare-fun e!495207 () Bool)

(assert (=> d!110093 (=> res!602466 e!495207)))

(assert (=> d!110093 (= res!602466 (bvsge #b00000000000000000000000000000000 (size!25338 (_keys!9850 thiss!1181))))))

(assert (=> d!110093 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9850 thiss!1181) (mask!25593 thiss!1181)) e!495207)))

(declare-fun b!888697 () Bool)

(declare-fun e!495208 () Bool)

(assert (=> b!888697 (= e!495207 e!495208)))

(declare-fun c!93899 () Bool)

(assert (=> b!888697 (= c!93899 (validKeyInArray!0 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888698 () Bool)

(declare-fun call!39483 () Bool)

(assert (=> b!888698 (= e!495208 call!39483)))

(declare-fun b!888699 () Bool)

(declare-fun e!495206 () Bool)

(assert (=> b!888699 (= e!495206 call!39483)))

(declare-fun b!888700 () Bool)

(assert (=> b!888700 (= e!495208 e!495206)))

(declare-fun lt!401901 () (_ BitVec 64))

(assert (=> b!888700 (= lt!401901 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401900 () Unit!30267)

(assert (=> b!888700 (= lt!401900 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9850 thiss!1181) lt!401901 #b00000000000000000000000000000000))))

(assert (=> b!888700 (arrayContainsKey!0 (_keys!9850 thiss!1181) lt!401901 #b00000000000000000000000000000000)))

(declare-fun lt!401899 () Unit!30267)

(assert (=> b!888700 (= lt!401899 lt!401900)))

(declare-fun res!602467 () Bool)

(assert (=> b!888700 (= res!602467 (= (seekEntryOrOpen!0 (select (arr!24897 (_keys!9850 thiss!1181)) #b00000000000000000000000000000000) (_keys!9850 thiss!1181) (mask!25593 thiss!1181)) (Found!8767 #b00000000000000000000000000000000)))))

(assert (=> b!888700 (=> (not res!602467) (not e!495206))))

(declare-fun bm!39480 () Bool)

(assert (=> bm!39480 (= call!39483 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9850 thiss!1181) (mask!25593 thiss!1181)))))

(assert (= (and d!110093 (not res!602466)) b!888697))

(assert (= (and b!888697 c!93899) b!888700))

(assert (= (and b!888697 (not c!93899)) b!888698))

(assert (= (and b!888700 res!602467) b!888699))

(assert (= (or b!888699 b!888698) bm!39480))

(assert (=> b!888697 m!827817))

(assert (=> b!888697 m!827817))

(assert (=> b!888697 m!827873))

(assert (=> b!888700 m!827817))

(declare-fun m!827935 () Bool)

(assert (=> b!888700 m!827935))

(declare-fun m!827937 () Bool)

(assert (=> b!888700 m!827937))

(assert (=> b!888700 m!827817))

(declare-fun m!827939 () Bool)

(assert (=> b!888700 m!827939))

(declare-fun m!827941 () Bool)

(assert (=> bm!39480 m!827941))

(assert (=> b!888519 d!110093))

(declare-fun d!110095 () Bool)

(declare-fun e!495210 () Bool)

(assert (=> d!110095 e!495210))

(declare-fun res!602468 () Bool)

(assert (=> d!110095 (=> res!602468 e!495210)))

(declare-fun lt!401905 () Bool)

(assert (=> d!110095 (= res!602468 (not lt!401905))))

(declare-fun lt!401904 () Bool)

(assert (=> d!110095 (= lt!401905 lt!401904)))

(declare-fun lt!401903 () Unit!30267)

(declare-fun e!495209 () Unit!30267)

(assert (=> d!110095 (= lt!401903 e!495209)))

(declare-fun c!93900 () Bool)

(assert (=> d!110095 (= c!93900 lt!401904)))

(assert (=> d!110095 (= lt!401904 (containsKey!420 (toList!5331 (map!12114 thiss!1181)) key!785))))

(assert (=> d!110095 (= (contains!4326 (map!12114 thiss!1181) key!785) lt!401905)))

(declare-fun b!888701 () Bool)

(declare-fun lt!401902 () Unit!30267)

(assert (=> b!888701 (= e!495209 lt!401902)))

(assert (=> b!888701 (= lt!401902 (lemmaContainsKeyImpliesGetValueByKeyDefined!316 (toList!5331 (map!12114 thiss!1181)) key!785))))

(assert (=> b!888701 (isDefined!320 (getValueByKey!441 (toList!5331 (map!12114 thiss!1181)) key!785))))

(declare-fun b!888702 () Bool)

(declare-fun Unit!30273 () Unit!30267)

(assert (=> b!888702 (= e!495209 Unit!30273)))

(declare-fun b!888703 () Bool)

(assert (=> b!888703 (= e!495210 (isDefined!320 (getValueByKey!441 (toList!5331 (map!12114 thiss!1181)) key!785)))))

(assert (= (and d!110095 c!93900) b!888701))

(assert (= (and d!110095 (not c!93900)) b!888702))

(assert (= (and d!110095 (not res!602468)) b!888703))

(declare-fun m!827943 () Bool)

(assert (=> d!110095 m!827943))

(declare-fun m!827945 () Bool)

(assert (=> b!888701 m!827945))

(assert (=> b!888701 m!827749))

(assert (=> b!888701 m!827749))

(assert (=> b!888701 m!827751))

(assert (=> b!888703 m!827749))

(assert (=> b!888703 m!827749))

(assert (=> b!888703 m!827751))

(assert (=> d!110047 d!110095))

(assert (=> d!110047 d!110053))

(assert (=> d!110047 d!110055))

(declare-fun b!888705 () Bool)

(declare-fun e!495212 () Bool)

(assert (=> b!888705 (= e!495212 tp_is_empty!17901)))

(declare-fun condMapEmpty!28395 () Bool)

(declare-fun mapDefault!28395 () ValueCell!8469)

(assert (=> mapNonEmpty!28394 (= condMapEmpty!28395 (= mapRest!28394 ((as const (Array (_ BitVec 32) ValueCell!8469)) mapDefault!28395)))))

(declare-fun mapRes!28395 () Bool)

(assert (=> mapNonEmpty!28394 (= tp!54679 (and e!495212 mapRes!28395))))

(declare-fun mapNonEmpty!28395 () Bool)

(declare-fun tp!54680 () Bool)

(declare-fun e!495211 () Bool)

(assert (=> mapNonEmpty!28395 (= mapRes!28395 (and tp!54680 e!495211))))

(declare-fun mapKey!28395 () (_ BitVec 32))

(declare-fun mapValue!28395 () ValueCell!8469)

(declare-fun mapRest!28395 () (Array (_ BitVec 32) ValueCell!8469))

(assert (=> mapNonEmpty!28395 (= mapRest!28394 (store mapRest!28395 mapKey!28395 mapValue!28395))))

(declare-fun mapIsEmpty!28395 () Bool)

(assert (=> mapIsEmpty!28395 mapRes!28395))

(declare-fun b!888704 () Bool)

(assert (=> b!888704 (= e!495211 tp_is_empty!17901)))

(assert (= (and mapNonEmpty!28394 condMapEmpty!28395) mapIsEmpty!28395))

(assert (= (and mapNonEmpty!28394 (not condMapEmpty!28395)) mapNonEmpty!28395))

(assert (= (and mapNonEmpty!28395 ((_ is ValueCellFull!8469) mapValue!28395)) b!888704))

(assert (= (and mapNonEmpty!28394 ((_ is ValueCellFull!8469) mapDefault!28395)) b!888705))

(declare-fun m!827947 () Bool)

(assert (=> mapNonEmpty!28395 m!827947))

(declare-fun b_lambda!12881 () Bool)

(assert (= b_lambda!12879 (or (and b!888444 b_free!15573) b_lambda!12881)))

(check-sat (not b!888694) (not d!110095) (not b!888638) (not d!110069) tp_is_empty!17901 (not b!888606) (not bm!39479) (not b!888696) (not bm!39464) (not b!888700) b_and!25815 (not b!888534) (not b!888622) (not b!888703) (not b!888647) (not bm!39469) (not d!110075) (not b!888701) (not b!888584) (not b!888653) (not b!888692) (not bm!39470) (not d!110083) (not b!888650) (not d!110087) (not b!888681) (not d!110071) (not bm!39476) (not b!888590) (not d!110073) (not b!888664) (not b!888578) (not b_lambda!12881) (not mapNonEmpty!28395) (not b_next!15573) (not bm!39466) (not b!888665) (not b!888677) (not bm!39473) (not b!888608) (not d!110089) (not d!110063) (not b!888697) (not b!888581) (not b!888631) (not b!888591) (not b!888589) (not bm!39480) (not d!110065) (not b!888577) (not b!888582))
(check-sat b_and!25815 (not b_next!15573))
