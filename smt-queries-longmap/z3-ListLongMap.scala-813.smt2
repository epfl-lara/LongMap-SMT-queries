; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19798 () Bool)

(assert start!19798)

(declare-fun b!193989 () Bool)

(declare-fun b_free!4719 () Bool)

(declare-fun b_next!4719 () Bool)

(assert (=> b!193989 (= b_free!4719 (not b_next!4719))))

(declare-fun tp!17026 () Bool)

(declare-fun b_and!11433 () Bool)

(assert (=> b!193989 (= tp!17026 b_and!11433)))

(declare-fun b!193982 () Bool)

(declare-fun e!127638 () Bool)

(declare-fun e!127641 () Bool)

(assert (=> b!193982 (= e!127638 (not e!127641))))

(declare-fun res!91685 () Bool)

(assert (=> b!193982 (=> (not res!91685) (not e!127641))))

(declare-datatypes ((V!5635 0))(
  ( (V!5636 (val!2290 Int)) )
))
(declare-datatypes ((ValueCell!1902 0))(
  ( (ValueCellFull!1902 (v!4252 V!5635)) (EmptyCell!1902) )
))
(declare-datatypes ((array!8233 0))(
  ( (array!8234 (arr!3875 (Array (_ BitVec 32) (_ BitVec 64))) (size!4199 (_ BitVec 32))) )
))
(declare-datatypes ((array!8235 0))(
  ( (array!8236 (arr!3876 (Array (_ BitVec 32) ValueCell!1902)) (size!4200 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2712 0))(
  ( (LongMapFixedSize!2713 (defaultEntry!3960 Int) (mask!9223 (_ BitVec 32)) (extraKeys!3697 (_ BitVec 32)) (zeroValue!3801 V!5635) (minValue!3801 V!5635) (_size!1405 (_ BitVec 32)) (_keys!5954 array!8233) (_values!3943 array!8235) (_vacant!1405 (_ BitVec 32))) )
))
(declare-fun lt!96671 () LongMapFixedSize!2712)

(declare-fun valid!1113 (LongMapFixedSize!2712) Bool)

(assert (=> b!193982 (= res!91685 (valid!1113 lt!96671))))

(declare-datatypes ((tuple2!3560 0))(
  ( (tuple2!3561 (_1!1791 (_ BitVec 64)) (_2!1791 V!5635)) )
))
(declare-datatypes ((List!2449 0))(
  ( (Nil!2446) (Cons!2445 (h!3086 tuple2!3560) (t!7375 List!2449)) )
))
(declare-datatypes ((ListLongMap!2477 0))(
  ( (ListLongMap!2478 (toList!1254 List!2449)) )
))
(declare-fun lt!96669 () ListLongMap!2477)

(declare-fun thiss!1248 () LongMapFixedSize!2712)

(declare-datatypes ((SeekEntryResult!694 0))(
  ( (MissingZero!694 (index!4946 (_ BitVec 32))) (Found!694 (index!4947 (_ BitVec 32))) (Intermediate!694 (undefined!1506 Bool) (index!4948 (_ BitVec 32)) (x!20690 (_ BitVec 32))) (Undefined!694) (MissingVacant!694 (index!4949 (_ BitVec 32))) )
))
(declare-fun lt!96677 () SeekEntryResult!694)

(declare-fun contains!1379 (ListLongMap!2477 (_ BitVec 64)) Bool)

(assert (=> b!193982 (contains!1379 lt!96669 (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))

(declare-datatypes ((Unit!5878 0))(
  ( (Unit!5879) )
))
(declare-fun lt!96670 () Unit!5878)

(declare-fun lt!96681 () array!8235)

(declare-fun lemmaValidKeyInArrayIsInListMap!147 (array!8233 array!8235 (_ BitVec 32) (_ BitVec 32) V!5635 V!5635 (_ BitVec 32) Int) Unit!5878)

(assert (=> b!193982 (= lt!96670 (lemmaValidKeyInArrayIsInListMap!147 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (index!4947 lt!96677) (defaultEntry!3960 thiss!1248)))))

(assert (=> b!193982 (= lt!96671 (LongMapFixedSize!2713 (defaultEntry!3960 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (_size!1405 thiss!1248) (_keys!5954 thiss!1248) lt!96681 (_vacant!1405 thiss!1248)))))

(declare-fun lt!96672 () ListLongMap!2477)

(assert (=> b!193982 (= lt!96672 lt!96669)))

(declare-fun getCurrentListMap!902 (array!8233 array!8235 (_ BitVec 32) (_ BitVec 32) V!5635 V!5635 (_ BitVec 32) Int) ListLongMap!2477)

(assert (=> b!193982 (= lt!96669 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96676 () ListLongMap!2477)

(declare-fun lt!96678 () tuple2!3560)

(declare-fun +!322 (ListLongMap!2477 tuple2!3560) ListLongMap!2477)

(assert (=> b!193982 (= lt!96672 (+!322 lt!96676 lt!96678))))

(declare-fun v!309 () V!5635)

(assert (=> b!193982 (= lt!96681 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!193982 (= lt!96678 (tuple2!3561 key!828 v!309))))

(declare-fun lt!96673 () Unit!5878)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!123 (array!8233 array!8235 (_ BitVec 32) (_ BitVec 32) V!5635 V!5635 (_ BitVec 32) (_ BitVec 64) V!5635 Int) Unit!5878)

(assert (=> b!193982 (= lt!96673 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!123 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (index!4947 lt!96677) key!828 v!309 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96680 () Unit!5878)

(declare-fun e!127639 () Unit!5878)

(assert (=> b!193982 (= lt!96680 e!127639)))

(declare-fun c!34982 () Bool)

(assert (=> b!193982 (= c!34982 (contains!1379 lt!96676 key!828))))

(assert (=> b!193982 (= lt!96676 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun b!193983 () Bool)

(declare-fun res!91683 () Bool)

(declare-fun e!127635 () Bool)

(assert (=> b!193983 (=> (not res!91683) (not e!127635))))

(assert (=> b!193983 (= res!91683 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193984 () Bool)

(declare-fun Unit!5880 () Unit!5878)

(assert (=> b!193984 (= e!127639 Unit!5880)))

(declare-fun lt!96679 () Unit!5878)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!196 (array!8233 array!8235 (_ BitVec 32) (_ BitVec 32) V!5635 V!5635 (_ BitVec 64) Int) Unit!5878)

(assert (=> b!193984 (= lt!96679 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!196 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) key!828 (defaultEntry!3960 thiss!1248)))))

(assert (=> b!193984 false))

(declare-fun res!91687 () Bool)

(assert (=> start!19798 (=> (not res!91687) (not e!127635))))

(assert (=> start!19798 (= res!91687 (valid!1113 thiss!1248))))

(assert (=> start!19798 e!127635))

(declare-fun e!127640 () Bool)

(assert (=> start!19798 e!127640))

(assert (=> start!19798 true))

(declare-fun tp_is_empty!4491 () Bool)

(assert (=> start!19798 tp_is_empty!4491))

(declare-fun b!193985 () Bool)

(declare-fun e!127632 () Bool)

(assert (=> b!193985 (= e!127632 tp_is_empty!4491)))

(declare-fun b!193986 () Bool)

(assert (=> b!193986 (= e!127635 e!127638)))

(declare-fun res!91684 () Bool)

(assert (=> b!193986 (=> (not res!91684) (not e!127638))))

(get-info :version)

(assert (=> b!193986 (= res!91684 (and (not ((_ is Undefined!694) lt!96677)) (not ((_ is MissingVacant!694) lt!96677)) (not ((_ is MissingZero!694) lt!96677)) ((_ is Found!694) lt!96677)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8233 (_ BitVec 32)) SeekEntryResult!694)

(assert (=> b!193986 (= lt!96677 (seekEntryOrOpen!0 key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun mapNonEmpty!7769 () Bool)

(declare-fun mapRes!7769 () Bool)

(declare-fun tp!17027 () Bool)

(assert (=> mapNonEmpty!7769 (= mapRes!7769 (and tp!17027 e!127632))))

(declare-fun mapKey!7769 () (_ BitVec 32))

(declare-fun mapRest!7769 () (Array (_ BitVec 32) ValueCell!1902))

(declare-fun mapValue!7769 () ValueCell!1902)

(assert (=> mapNonEmpty!7769 (= (arr!3876 (_values!3943 thiss!1248)) (store mapRest!7769 mapKey!7769 mapValue!7769))))

(declare-fun e!127636 () Bool)

(declare-fun b!193987 () Bool)

(assert (=> b!193987 (= e!127636 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)) key!828))))

(declare-fun mapIsEmpty!7769 () Bool)

(assert (=> mapIsEmpty!7769 mapRes!7769))

(declare-fun b!193988 () Bool)

(declare-fun e!127642 () Bool)

(declare-fun e!127637 () Bool)

(assert (=> b!193988 (= e!127642 (and e!127637 mapRes!7769))))

(declare-fun condMapEmpty!7769 () Bool)

(declare-fun mapDefault!7769 () ValueCell!1902)

(assert (=> b!193988 (= condMapEmpty!7769 (= (arr!3876 (_values!3943 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1902)) mapDefault!7769)))))

(declare-fun array_inv!2513 (array!8233) Bool)

(declare-fun array_inv!2514 (array!8235) Bool)

(assert (=> b!193989 (= e!127640 (and tp!17026 tp_is_empty!4491 (array_inv!2513 (_keys!5954 thiss!1248)) (array_inv!2514 (_values!3943 thiss!1248)) e!127642))))

(declare-fun b!193990 () Bool)

(assert (=> b!193990 (= e!127637 tp_is_empty!4491)))

(declare-fun b!193991 () Bool)

(declare-fun lt!96674 () Unit!5878)

(assert (=> b!193991 (= e!127639 lt!96674)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!186 (array!8233 array!8235 (_ BitVec 32) (_ BitVec 32) V!5635 V!5635 (_ BitVec 64) Int) Unit!5878)

(assert (=> b!193991 (= lt!96674 (lemmaInListMapThenSeekEntryOrOpenFindsIt!186 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) key!828 (defaultEntry!3960 thiss!1248)))))

(declare-fun res!91686 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193991 (= res!91686 (inRange!0 (index!4947 lt!96677) (mask!9223 thiss!1248)))))

(assert (=> b!193991 (=> (not res!91686) (not e!127636))))

(assert (=> b!193991 e!127636))

(declare-fun b!193992 () Bool)

(declare-fun e!127634 () Bool)

(assert (=> b!193992 (= e!127641 e!127634)))

(declare-fun res!91682 () Bool)

(assert (=> b!193992 (=> (not res!91682) (not e!127634))))

(declare-fun lt!96675 () ListLongMap!2477)

(assert (=> b!193992 (= res!91682 (contains!1379 lt!96675 key!828))))

(declare-fun map!2029 (LongMapFixedSize!2712) ListLongMap!2477)

(assert (=> b!193992 (= lt!96675 (map!2029 lt!96671))))

(declare-fun b!193993 () Bool)

(assert (=> b!193993 (= e!127634 (= lt!96675 (+!322 (map!2029 thiss!1248) lt!96678)))))

(assert (= (and start!19798 res!91687) b!193983))

(assert (= (and b!193983 res!91683) b!193986))

(assert (= (and b!193986 res!91684) b!193982))

(assert (= (and b!193982 c!34982) b!193991))

(assert (= (and b!193982 (not c!34982)) b!193984))

(assert (= (and b!193991 res!91686) b!193987))

(assert (= (and b!193982 res!91685) b!193992))

(assert (= (and b!193992 res!91682) b!193993))

(assert (= (and b!193988 condMapEmpty!7769) mapIsEmpty!7769))

(assert (= (and b!193988 (not condMapEmpty!7769)) mapNonEmpty!7769))

(assert (= (and mapNonEmpty!7769 ((_ is ValueCellFull!1902) mapValue!7769)) b!193985))

(assert (= (and b!193988 ((_ is ValueCellFull!1902) mapDefault!7769)) b!193990))

(assert (= b!193989 b!193988))

(assert (= start!19798 b!193989))

(declare-fun m!220729 () Bool)

(assert (=> b!193989 m!220729))

(declare-fun m!220731 () Bool)

(assert (=> b!193989 m!220731))

(declare-fun m!220733 () Bool)

(assert (=> b!193992 m!220733))

(declare-fun m!220735 () Bool)

(assert (=> b!193992 m!220735))

(declare-fun m!220737 () Bool)

(assert (=> b!193991 m!220737))

(declare-fun m!220739 () Bool)

(assert (=> b!193991 m!220739))

(declare-fun m!220741 () Bool)

(assert (=> mapNonEmpty!7769 m!220741))

(declare-fun m!220743 () Bool)

(assert (=> b!193982 m!220743))

(declare-fun m!220745 () Bool)

(assert (=> b!193982 m!220745))

(declare-fun m!220747 () Bool)

(assert (=> b!193982 m!220747))

(declare-fun m!220749 () Bool)

(assert (=> b!193982 m!220749))

(declare-fun m!220751 () Bool)

(assert (=> b!193982 m!220751))

(declare-fun m!220753 () Bool)

(assert (=> b!193982 m!220753))

(declare-fun m!220755 () Bool)

(assert (=> b!193982 m!220755))

(declare-fun m!220757 () Bool)

(assert (=> b!193982 m!220757))

(declare-fun m!220759 () Bool)

(assert (=> b!193982 m!220759))

(assert (=> b!193982 m!220759))

(declare-fun m!220761 () Bool)

(assert (=> b!193982 m!220761))

(assert (=> b!193987 m!220759))

(declare-fun m!220763 () Bool)

(assert (=> b!193984 m!220763))

(declare-fun m!220765 () Bool)

(assert (=> b!193993 m!220765))

(assert (=> b!193993 m!220765))

(declare-fun m!220767 () Bool)

(assert (=> b!193993 m!220767))

(declare-fun m!220769 () Bool)

(assert (=> start!19798 m!220769))

(declare-fun m!220771 () Bool)

(assert (=> b!193986 m!220771))

(check-sat (not b!193986) (not b!193989) (not mapNonEmpty!7769) (not b_next!4719) (not b!193991) (not b!193984) (not b!193992) tp_is_empty!4491 (not start!19798) (not b!193982) b_and!11433 (not b!193993))
(check-sat b_and!11433 (not b_next!4719))
(get-model)

(declare-fun d!56639 () Bool)

(declare-fun e!127678 () Bool)

(assert (=> d!56639 e!127678))

(declare-fun res!91710 () Bool)

(assert (=> d!56639 (=> (not res!91710) (not e!127678))))

(declare-fun lt!96729 () ListLongMap!2477)

(assert (=> d!56639 (= res!91710 (contains!1379 lt!96729 (_1!1791 lt!96678)))))

(declare-fun lt!96732 () List!2449)

(assert (=> d!56639 (= lt!96729 (ListLongMap!2478 lt!96732))))

(declare-fun lt!96730 () Unit!5878)

(declare-fun lt!96731 () Unit!5878)

(assert (=> d!56639 (= lt!96730 lt!96731)))

(declare-datatypes ((Option!251 0))(
  ( (Some!250 (v!4256 V!5635)) (None!249) )
))
(declare-fun getValueByKey!245 (List!2449 (_ BitVec 64)) Option!251)

(assert (=> d!56639 (= (getValueByKey!245 lt!96732 (_1!1791 lt!96678)) (Some!250 (_2!1791 lt!96678)))))

(declare-fun lemmaContainsTupThenGetReturnValue!132 (List!2449 (_ BitVec 64) V!5635) Unit!5878)

(assert (=> d!56639 (= lt!96731 (lemmaContainsTupThenGetReturnValue!132 lt!96732 (_1!1791 lt!96678) (_2!1791 lt!96678)))))

(declare-fun insertStrictlySorted!135 (List!2449 (_ BitVec 64) V!5635) List!2449)

(assert (=> d!56639 (= lt!96732 (insertStrictlySorted!135 (toList!1254 (map!2029 thiss!1248)) (_1!1791 lt!96678) (_2!1791 lt!96678)))))

(assert (=> d!56639 (= (+!322 (map!2029 thiss!1248) lt!96678) lt!96729)))

(declare-fun b!194034 () Bool)

(declare-fun res!91711 () Bool)

(assert (=> b!194034 (=> (not res!91711) (not e!127678))))

(assert (=> b!194034 (= res!91711 (= (getValueByKey!245 (toList!1254 lt!96729) (_1!1791 lt!96678)) (Some!250 (_2!1791 lt!96678))))))

(declare-fun b!194035 () Bool)

(declare-fun contains!1381 (List!2449 tuple2!3560) Bool)

(assert (=> b!194035 (= e!127678 (contains!1381 (toList!1254 lt!96729) lt!96678))))

(assert (= (and d!56639 res!91710) b!194034))

(assert (= (and b!194034 res!91711) b!194035))

(declare-fun m!220817 () Bool)

(assert (=> d!56639 m!220817))

(declare-fun m!220819 () Bool)

(assert (=> d!56639 m!220819))

(declare-fun m!220821 () Bool)

(assert (=> d!56639 m!220821))

(declare-fun m!220823 () Bool)

(assert (=> d!56639 m!220823))

(declare-fun m!220825 () Bool)

(assert (=> b!194034 m!220825))

(declare-fun m!220827 () Bool)

(assert (=> b!194035 m!220827))

(assert (=> b!193993 d!56639))

(declare-fun d!56641 () Bool)

(assert (=> d!56641 (= (map!2029 thiss!1248) (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun bs!7726 () Bool)

(assert (= bs!7726 d!56641))

(assert (=> bs!7726 m!220747))

(assert (=> b!193993 d!56641))

(declare-fun d!56643 () Bool)

(declare-fun e!127684 () Bool)

(assert (=> d!56643 e!127684))

(declare-fun res!91714 () Bool)

(assert (=> d!56643 (=> res!91714 e!127684)))

(declare-fun lt!96741 () Bool)

(assert (=> d!56643 (= res!91714 (not lt!96741))))

(declare-fun lt!96742 () Bool)

(assert (=> d!56643 (= lt!96741 lt!96742)))

(declare-fun lt!96743 () Unit!5878)

(declare-fun e!127683 () Unit!5878)

(assert (=> d!56643 (= lt!96743 e!127683)))

(declare-fun c!34988 () Bool)

(assert (=> d!56643 (= c!34988 lt!96742)))

(declare-fun containsKey!249 (List!2449 (_ BitVec 64)) Bool)

(assert (=> d!56643 (= lt!96742 (containsKey!249 (toList!1254 lt!96675) key!828))))

(assert (=> d!56643 (= (contains!1379 lt!96675 key!828) lt!96741)))

(declare-fun b!194042 () Bool)

(declare-fun lt!96744 () Unit!5878)

(assert (=> b!194042 (= e!127683 lt!96744)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!197 (List!2449 (_ BitVec 64)) Unit!5878)

(assert (=> b!194042 (= lt!96744 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96675) key!828))))

(declare-fun isDefined!198 (Option!251) Bool)

(assert (=> b!194042 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96675) key!828))))

(declare-fun b!194043 () Bool)

(declare-fun Unit!5884 () Unit!5878)

(assert (=> b!194043 (= e!127683 Unit!5884)))

(declare-fun b!194044 () Bool)

(assert (=> b!194044 (= e!127684 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96675) key!828)))))

(assert (= (and d!56643 c!34988) b!194042))

(assert (= (and d!56643 (not c!34988)) b!194043))

(assert (= (and d!56643 (not res!91714)) b!194044))

(declare-fun m!220829 () Bool)

(assert (=> d!56643 m!220829))

(declare-fun m!220831 () Bool)

(assert (=> b!194042 m!220831))

(declare-fun m!220833 () Bool)

(assert (=> b!194042 m!220833))

(assert (=> b!194042 m!220833))

(declare-fun m!220835 () Bool)

(assert (=> b!194042 m!220835))

(assert (=> b!194044 m!220833))

(assert (=> b!194044 m!220833))

(assert (=> b!194044 m!220835))

(assert (=> b!193992 d!56643))

(declare-fun d!56645 () Bool)

(assert (=> d!56645 (= (map!2029 lt!96671) (getCurrentListMap!902 (_keys!5954 lt!96671) (_values!3943 lt!96671) (mask!9223 lt!96671) (extraKeys!3697 lt!96671) (zeroValue!3801 lt!96671) (minValue!3801 lt!96671) #b00000000000000000000000000000000 (defaultEntry!3960 lt!96671)))))

(declare-fun bs!7727 () Bool)

(assert (= bs!7727 d!56645))

(declare-fun m!220837 () Bool)

(assert (=> bs!7727 m!220837))

(assert (=> b!193992 d!56645))

(declare-fun d!56647 () Bool)

(declare-fun res!91721 () Bool)

(declare-fun e!127687 () Bool)

(assert (=> d!56647 (=> (not res!91721) (not e!127687))))

(declare-fun simpleValid!204 (LongMapFixedSize!2712) Bool)

(assert (=> d!56647 (= res!91721 (simpleValid!204 thiss!1248))))

(assert (=> d!56647 (= (valid!1113 thiss!1248) e!127687)))

(declare-fun b!194051 () Bool)

(declare-fun res!91722 () Bool)

(assert (=> b!194051 (=> (not res!91722) (not e!127687))))

(declare-fun arrayCountValidKeys!0 (array!8233 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!194051 (= res!91722 (= (arrayCountValidKeys!0 (_keys!5954 thiss!1248) #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))) (_size!1405 thiss!1248)))))

(declare-fun b!194052 () Bool)

(declare-fun res!91723 () Bool)

(assert (=> b!194052 (=> (not res!91723) (not e!127687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8233 (_ BitVec 32)) Bool)

(assert (=> b!194052 (= res!91723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun b!194053 () Bool)

(declare-datatypes ((List!2451 0))(
  ( (Nil!2448) (Cons!2447 (h!3088 (_ BitVec 64)) (t!7379 List!2451)) )
))
(declare-fun arrayNoDuplicates!0 (array!8233 (_ BitVec 32) List!2451) Bool)

(assert (=> b!194053 (= e!127687 (arrayNoDuplicates!0 (_keys!5954 thiss!1248) #b00000000000000000000000000000000 Nil!2448))))

(assert (= (and d!56647 res!91721) b!194051))

(assert (= (and b!194051 res!91722) b!194052))

(assert (= (and b!194052 res!91723) b!194053))

(declare-fun m!220839 () Bool)

(assert (=> d!56647 m!220839))

(declare-fun m!220841 () Bool)

(assert (=> b!194051 m!220841))

(declare-fun m!220843 () Bool)

(assert (=> b!194052 m!220843))

(declare-fun m!220845 () Bool)

(assert (=> b!194053 m!220845))

(assert (=> start!19798 d!56647))

(declare-fun b!194070 () Bool)

(declare-fun e!127698 () Bool)

(declare-fun call!19615 () Bool)

(assert (=> b!194070 (= e!127698 (not call!19615))))

(declare-fun b!194071 () Bool)

(declare-fun e!127696 () Bool)

(declare-fun lt!96749 () SeekEntryResult!694)

(assert (=> b!194071 (= e!127696 ((_ is Undefined!694) lt!96749))))

(declare-fun b!194072 () Bool)

(declare-fun res!91733 () Bool)

(assert (=> b!194072 (=> (not res!91733) (not e!127698))))

(declare-fun call!19614 () Bool)

(assert (=> b!194072 (= res!91733 call!19614)))

(assert (=> b!194072 (= e!127696 e!127698)))

(declare-fun b!194073 () Bool)

(assert (=> b!194073 (and (bvsge (index!4946 lt!96749) #b00000000000000000000000000000000) (bvslt (index!4946 lt!96749) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun res!91734 () Bool)

(assert (=> b!194073 (= res!91734 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4946 lt!96749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127697 () Bool)

(assert (=> b!194073 (=> (not res!91734) (not e!127697))))

(declare-fun b!194074 () Bool)

(declare-fun e!127699 () Bool)

(assert (=> b!194074 (= e!127699 e!127696)))

(declare-fun c!34994 () Bool)

(assert (=> b!194074 (= c!34994 ((_ is MissingVacant!694) lt!96749))))

(declare-fun bm!19611 () Bool)

(declare-fun arrayContainsKey!0 (array!8233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19611 (= call!19615 (arrayContainsKey!0 (_keys!5954 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!194075 () Bool)

(assert (=> b!194075 (= e!127699 e!127697)))

(declare-fun res!91732 () Bool)

(assert (=> b!194075 (= res!91732 call!19614)))

(assert (=> b!194075 (=> (not res!91732) (not e!127697))))

(declare-fun b!194076 () Bool)

(declare-fun res!91735 () Bool)

(assert (=> b!194076 (=> (not res!91735) (not e!127698))))

(assert (=> b!194076 (= res!91735 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4949 lt!96749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194076 (and (bvsge (index!4949 lt!96749) #b00000000000000000000000000000000) (bvslt (index!4949 lt!96749) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun d!56649 () Bool)

(assert (=> d!56649 e!127699))

(declare-fun c!34993 () Bool)

(assert (=> d!56649 (= c!34993 ((_ is MissingZero!694) lt!96749))))

(assert (=> d!56649 (= lt!96749 (seekEntryOrOpen!0 key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun lt!96750 () Unit!5878)

(declare-fun choose!1063 (array!8233 array!8235 (_ BitVec 32) (_ BitVec 32) V!5635 V!5635 (_ BitVec 64) Int) Unit!5878)

(assert (=> d!56649 (= lt!96750 (choose!1063 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) key!828 (defaultEntry!3960 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!56649 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56649 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!196 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) key!828 (defaultEntry!3960 thiss!1248)) lt!96750)))

(declare-fun bm!19612 () Bool)

(assert (=> bm!19612 (= call!19614 (inRange!0 (ite c!34993 (index!4946 lt!96749) (index!4949 lt!96749)) (mask!9223 thiss!1248)))))

(declare-fun b!194077 () Bool)

(assert (=> b!194077 (= e!127697 (not call!19615))))

(assert (= (and d!56649 c!34993) b!194075))

(assert (= (and d!56649 (not c!34993)) b!194074))

(assert (= (and b!194075 res!91732) b!194073))

(assert (= (and b!194073 res!91734) b!194077))

(assert (= (and b!194074 c!34994) b!194072))

(assert (= (and b!194074 (not c!34994)) b!194071))

(assert (= (and b!194072 res!91733) b!194076))

(assert (= (and b!194076 res!91735) b!194070))

(assert (= (or b!194075 b!194072) bm!19612))

(assert (= (or b!194077 b!194070) bm!19611))

(declare-fun m!220847 () Bool)

(assert (=> bm!19612 m!220847))

(declare-fun m!220849 () Bool)

(assert (=> b!194076 m!220849))

(declare-fun m!220851 () Bool)

(assert (=> bm!19611 m!220851))

(assert (=> d!56649 m!220771))

(declare-fun m!220853 () Bool)

(assert (=> d!56649 m!220853))

(declare-fun m!220855 () Bool)

(assert (=> d!56649 m!220855))

(declare-fun m!220857 () Bool)

(assert (=> b!194073 m!220857))

(assert (=> b!193984 d!56649))

(declare-fun d!56651 () Bool)

(declare-fun res!91736 () Bool)

(declare-fun e!127700 () Bool)

(assert (=> d!56651 (=> (not res!91736) (not e!127700))))

(assert (=> d!56651 (= res!91736 (simpleValid!204 lt!96671))))

(assert (=> d!56651 (= (valid!1113 lt!96671) e!127700)))

(declare-fun b!194078 () Bool)

(declare-fun res!91737 () Bool)

(assert (=> b!194078 (=> (not res!91737) (not e!127700))))

(assert (=> b!194078 (= res!91737 (= (arrayCountValidKeys!0 (_keys!5954 lt!96671) #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))) (_size!1405 lt!96671)))))

(declare-fun b!194079 () Bool)

(declare-fun res!91738 () Bool)

(assert (=> b!194079 (=> (not res!91738) (not e!127700))))

(assert (=> b!194079 (= res!91738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5954 lt!96671) (mask!9223 lt!96671)))))

(declare-fun b!194080 () Bool)

(assert (=> b!194080 (= e!127700 (arrayNoDuplicates!0 (_keys!5954 lt!96671) #b00000000000000000000000000000000 Nil!2448))))

(assert (= (and d!56651 res!91736) b!194078))

(assert (= (and b!194078 res!91737) b!194079))

(assert (= (and b!194079 res!91738) b!194080))

(declare-fun m!220859 () Bool)

(assert (=> d!56651 m!220859))

(declare-fun m!220861 () Bool)

(assert (=> b!194078 m!220861))

(declare-fun m!220863 () Bool)

(assert (=> b!194079 m!220863))

(declare-fun m!220865 () Bool)

(assert (=> b!194080 m!220865))

(assert (=> b!193982 d!56651))

(declare-fun bm!19627 () Bool)

(declare-fun call!19635 () Bool)

(declare-fun lt!96808 () ListLongMap!2477)

(assert (=> bm!19627 (= call!19635 (contains!1379 lt!96808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194123 () Bool)

(declare-fun e!127729 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!194123 (= e!127729 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194124 () Bool)

(declare-fun e!127733 () Bool)

(declare-fun apply!188 (ListLongMap!2477 (_ BitVec 64)) V!5635)

(assert (=> b!194124 (= e!127733 (= (apply!188 lt!96808 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3801 thiss!1248)))))

(declare-fun b!194125 () Bool)

(declare-fun e!127739 () Bool)

(declare-fun call!19636 () Bool)

(assert (=> b!194125 (= e!127739 (not call!19636))))

(declare-fun b!194126 () Bool)

(declare-fun e!127728 () ListLongMap!2477)

(declare-fun call!19630 () ListLongMap!2477)

(assert (=> b!194126 (= e!127728 call!19630)))

(declare-fun call!19632 () ListLongMap!2477)

(declare-fun call!19633 () ListLongMap!2477)

(declare-fun call!19634 () ListLongMap!2477)

(declare-fun bm!19628 () Bool)

(declare-fun c!35009 () Bool)

(declare-fun c!35010 () Bool)

(assert (=> bm!19628 (= call!19634 (+!322 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630)) (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!194127 () Bool)

(declare-fun call!19631 () ListLongMap!2477)

(assert (=> b!194127 (= e!127728 call!19631)))

(declare-fun b!194128 () Bool)

(declare-fun e!127738 () Unit!5878)

(declare-fun lt!96804 () Unit!5878)

(assert (=> b!194128 (= e!127738 lt!96804)))

(declare-fun lt!96799 () ListLongMap!2477)

(declare-fun getCurrentListMapNoExtraKeys!221 (array!8233 array!8235 (_ BitVec 32) (_ BitVec 32) V!5635 V!5635 (_ BitVec 32) Int) ListLongMap!2477)

(assert (=> b!194128 (= lt!96799 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96815 () (_ BitVec 64))

(assert (=> b!194128 (= lt!96815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96795 () (_ BitVec 64))

(assert (=> b!194128 (= lt!96795 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96806 () Unit!5878)

(declare-fun addStillContains!164 (ListLongMap!2477 (_ BitVec 64) V!5635 (_ BitVec 64)) Unit!5878)

(assert (=> b!194128 (= lt!96806 (addStillContains!164 lt!96799 lt!96815 (zeroValue!3801 thiss!1248) lt!96795))))

(assert (=> b!194128 (contains!1379 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) lt!96795)))

(declare-fun lt!96814 () Unit!5878)

(assert (=> b!194128 (= lt!96814 lt!96806)))

(declare-fun lt!96801 () ListLongMap!2477)

(assert (=> b!194128 (= lt!96801 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96809 () (_ BitVec 64))

(assert (=> b!194128 (= lt!96809 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96813 () (_ BitVec 64))

(assert (=> b!194128 (= lt!96813 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96810 () Unit!5878)

(declare-fun addApplyDifferent!164 (ListLongMap!2477 (_ BitVec 64) V!5635 (_ BitVec 64)) Unit!5878)

(assert (=> b!194128 (= lt!96810 (addApplyDifferent!164 lt!96801 lt!96809 (minValue!3801 thiss!1248) lt!96813))))

(assert (=> b!194128 (= (apply!188 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) lt!96813) (apply!188 lt!96801 lt!96813))))

(declare-fun lt!96796 () Unit!5878)

(assert (=> b!194128 (= lt!96796 lt!96810)))

(declare-fun lt!96811 () ListLongMap!2477)

(assert (=> b!194128 (= lt!96811 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96802 () (_ BitVec 64))

(assert (=> b!194128 (= lt!96802 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96797 () (_ BitVec 64))

(assert (=> b!194128 (= lt!96797 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96812 () Unit!5878)

(assert (=> b!194128 (= lt!96812 (addApplyDifferent!164 lt!96811 lt!96802 (zeroValue!3801 thiss!1248) lt!96797))))

(assert (=> b!194128 (= (apply!188 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) lt!96797) (apply!188 lt!96811 lt!96797))))

(declare-fun lt!96800 () Unit!5878)

(assert (=> b!194128 (= lt!96800 lt!96812)))

(declare-fun lt!96816 () ListLongMap!2477)

(assert (=> b!194128 (= lt!96816 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96807 () (_ BitVec 64))

(assert (=> b!194128 (= lt!96807 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96798 () (_ BitVec 64))

(assert (=> b!194128 (= lt!96798 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194128 (= lt!96804 (addApplyDifferent!164 lt!96816 lt!96807 (minValue!3801 thiss!1248) lt!96798))))

(assert (=> b!194128 (= (apply!188 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) lt!96798) (apply!188 lt!96816 lt!96798))))

(declare-fun e!127730 () Bool)

(declare-fun b!194129 () Bool)

(declare-fun get!2237 (ValueCell!1902 V!5635) V!5635)

(declare-fun dynLambda!531 (Int (_ BitVec 64)) V!5635)

(assert (=> b!194129 (= e!127730 (= (apply!188 lt!96808 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4200 lt!96681)))))

(assert (=> b!194129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun d!56653 () Bool)

(declare-fun e!127731 () Bool)

(assert (=> d!56653 e!127731))

(declare-fun res!91765 () Bool)

(assert (=> d!56653 (=> (not res!91765) (not e!127731))))

(assert (=> d!56653 (= res!91765 (or (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))))

(declare-fun lt!96805 () ListLongMap!2477)

(assert (=> d!56653 (= lt!96808 lt!96805)))

(declare-fun lt!96803 () Unit!5878)

(assert (=> d!56653 (= lt!96803 e!127738)))

(declare-fun c!35012 () Bool)

(assert (=> d!56653 (= c!35012 e!127729)))

(declare-fun res!91760 () Bool)

(assert (=> d!56653 (=> (not res!91760) (not e!127729))))

(assert (=> d!56653 (= res!91760 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun e!127737 () ListLongMap!2477)

(assert (=> d!56653 (= lt!96805 e!127737)))

(assert (=> d!56653 (= c!35009 (and (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56653 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56653 (= (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) lt!96808)))

(declare-fun bm!19629 () Bool)

(assert (=> bm!19629 (= call!19636 (contains!1379 lt!96808 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194130 () Bool)

(declare-fun e!127727 () ListLongMap!2477)

(assert (=> b!194130 (= e!127727 call!19631)))

(declare-fun bm!19630 () Bool)

(assert (=> bm!19630 (= call!19631 call!19634)))

(declare-fun bm!19631 () Bool)

(assert (=> bm!19631 (= call!19630 call!19632)))

(declare-fun bm!19632 () Bool)

(assert (=> bm!19632 (= call!19633 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun b!194131 () Bool)

(assert (=> b!194131 (= e!127737 (+!322 call!19634 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(declare-fun b!194132 () Bool)

(declare-fun e!127736 () Bool)

(assert (=> b!194132 (= e!127736 e!127730)))

(declare-fun res!91757 () Bool)

(assert (=> b!194132 (=> (not res!91757) (not e!127730))))

(assert (=> b!194132 (= res!91757 (contains!1379 lt!96808 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194132 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194133 () Bool)

(assert (=> b!194133 (= e!127737 e!127727)))

(assert (=> b!194133 (= c!35010 (and (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194134 () Bool)

(declare-fun res!91763 () Bool)

(assert (=> b!194134 (=> (not res!91763) (not e!127731))))

(assert (=> b!194134 (= res!91763 e!127736)))

(declare-fun res!91758 () Bool)

(assert (=> b!194134 (=> res!91758 e!127736)))

(declare-fun e!127732 () Bool)

(assert (=> b!194134 (= res!91758 (not e!127732))))

(declare-fun res!91759 () Bool)

(assert (=> b!194134 (=> (not res!91759) (not e!127732))))

(assert (=> b!194134 (= res!91759 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194135 () Bool)

(declare-fun e!127734 () Bool)

(assert (=> b!194135 (= e!127739 e!127734)))

(declare-fun res!91762 () Bool)

(assert (=> b!194135 (= res!91762 call!19636)))

(assert (=> b!194135 (=> (not res!91762) (not e!127734))))

(declare-fun b!194136 () Bool)

(assert (=> b!194136 (= e!127734 (= (apply!188 lt!96808 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3801 thiss!1248)))))

(declare-fun bm!19633 () Bool)

(assert (=> bm!19633 (= call!19632 call!19633)))

(declare-fun b!194137 () Bool)

(declare-fun res!91761 () Bool)

(assert (=> b!194137 (=> (not res!91761) (not e!127731))))

(declare-fun e!127735 () Bool)

(assert (=> b!194137 (= res!91761 e!127735)))

(declare-fun c!35011 () Bool)

(assert (=> b!194137 (= c!35011 (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!194138 () Bool)

(declare-fun c!35007 () Bool)

(assert (=> b!194138 (= c!35007 (and (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!194138 (= e!127727 e!127728)))

(declare-fun b!194139 () Bool)

(assert (=> b!194139 (= e!127732 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194140 () Bool)

(assert (=> b!194140 (= e!127735 e!127733)))

(declare-fun res!91764 () Bool)

(assert (=> b!194140 (= res!91764 call!19635)))

(assert (=> b!194140 (=> (not res!91764) (not e!127733))))

(declare-fun b!194141 () Bool)

(assert (=> b!194141 (= e!127731 e!127739)))

(declare-fun c!35008 () Bool)

(assert (=> b!194141 (= c!35008 (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194142 () Bool)

(assert (=> b!194142 (= e!127735 (not call!19635))))

(declare-fun b!194143 () Bool)

(declare-fun Unit!5885 () Unit!5878)

(assert (=> b!194143 (= e!127738 Unit!5885)))

(assert (= (and d!56653 c!35009) b!194131))

(assert (= (and d!56653 (not c!35009)) b!194133))

(assert (= (and b!194133 c!35010) b!194130))

(assert (= (and b!194133 (not c!35010)) b!194138))

(assert (= (and b!194138 c!35007) b!194127))

(assert (= (and b!194138 (not c!35007)) b!194126))

(assert (= (or b!194127 b!194126) bm!19631))

(assert (= (or b!194130 bm!19631) bm!19633))

(assert (= (or b!194130 b!194127) bm!19630))

(assert (= (or b!194131 bm!19633) bm!19632))

(assert (= (or b!194131 bm!19630) bm!19628))

(assert (= (and d!56653 res!91760) b!194123))

(assert (= (and d!56653 c!35012) b!194128))

(assert (= (and d!56653 (not c!35012)) b!194143))

(assert (= (and d!56653 res!91765) b!194134))

(assert (= (and b!194134 res!91759) b!194139))

(assert (= (and b!194134 (not res!91758)) b!194132))

(assert (= (and b!194132 res!91757) b!194129))

(assert (= (and b!194134 res!91763) b!194137))

(assert (= (and b!194137 c!35011) b!194140))

(assert (= (and b!194137 (not c!35011)) b!194142))

(assert (= (and b!194140 res!91764) b!194124))

(assert (= (or b!194140 b!194142) bm!19627))

(assert (= (and b!194137 res!91761) b!194141))

(assert (= (and b!194141 c!35008) b!194135))

(assert (= (and b!194141 (not c!35008)) b!194125))

(assert (= (and b!194135 res!91762) b!194136))

(assert (= (or b!194135 b!194125) bm!19629))

(declare-fun b_lambda!7479 () Bool)

(assert (=> (not b_lambda!7479) (not b!194129)))

(declare-fun t!7378 () Bool)

(declare-fun tb!2887 () Bool)

(assert (=> (and b!193989 (= (defaultEntry!3960 thiss!1248) (defaultEntry!3960 thiss!1248)) t!7378) tb!2887))

(declare-fun result!4939 () Bool)

(assert (=> tb!2887 (= result!4939 tp_is_empty!4491)))

(assert (=> b!194129 t!7378))

(declare-fun b_and!11437 () Bool)

(assert (= b_and!11433 (and (=> t!7378 result!4939) b_and!11437)))

(declare-fun m!220867 () Bool)

(assert (=> bm!19632 m!220867))

(declare-fun m!220869 () Bool)

(assert (=> b!194124 m!220869))

(declare-fun m!220871 () Bool)

(assert (=> bm!19629 m!220871))

(assert (=> d!56653 m!220855))

(declare-fun m!220873 () Bool)

(assert (=> b!194131 m!220873))

(declare-fun m!220875 () Bool)

(assert (=> bm!19628 m!220875))

(declare-fun m!220877 () Bool)

(assert (=> b!194123 m!220877))

(assert (=> b!194123 m!220877))

(declare-fun m!220879 () Bool)

(assert (=> b!194123 m!220879))

(assert (=> b!194139 m!220877))

(assert (=> b!194139 m!220877))

(assert (=> b!194139 m!220879))

(assert (=> b!194129 m!220877))

(declare-fun m!220881 () Bool)

(assert (=> b!194129 m!220881))

(assert (=> b!194129 m!220877))

(declare-fun m!220883 () Bool)

(assert (=> b!194129 m!220883))

(declare-fun m!220885 () Bool)

(assert (=> b!194129 m!220885))

(assert (=> b!194129 m!220885))

(assert (=> b!194129 m!220881))

(declare-fun m!220887 () Bool)

(assert (=> b!194129 m!220887))

(declare-fun m!220889 () Bool)

(assert (=> b!194136 m!220889))

(declare-fun m!220891 () Bool)

(assert (=> b!194128 m!220891))

(declare-fun m!220893 () Bool)

(assert (=> b!194128 m!220893))

(declare-fun m!220895 () Bool)

(assert (=> b!194128 m!220895))

(declare-fun m!220897 () Bool)

(assert (=> b!194128 m!220897))

(declare-fun m!220899 () Bool)

(assert (=> b!194128 m!220899))

(declare-fun m!220901 () Bool)

(assert (=> b!194128 m!220901))

(declare-fun m!220903 () Bool)

(assert (=> b!194128 m!220903))

(declare-fun m!220905 () Bool)

(assert (=> b!194128 m!220905))

(declare-fun m!220907 () Bool)

(assert (=> b!194128 m!220907))

(assert (=> b!194128 m!220877))

(declare-fun m!220909 () Bool)

(assert (=> b!194128 m!220909))

(assert (=> b!194128 m!220893))

(assert (=> b!194128 m!220867))

(assert (=> b!194128 m!220905))

(declare-fun m!220911 () Bool)

(assert (=> b!194128 m!220911))

(declare-fun m!220913 () Bool)

(assert (=> b!194128 m!220913))

(assert (=> b!194128 m!220897))

(declare-fun m!220915 () Bool)

(assert (=> b!194128 m!220915))

(declare-fun m!220917 () Bool)

(assert (=> b!194128 m!220917))

(assert (=> b!194128 m!220901))

(declare-fun m!220919 () Bool)

(assert (=> b!194128 m!220919))

(assert (=> b!194132 m!220877))

(assert (=> b!194132 m!220877))

(declare-fun m!220921 () Bool)

(assert (=> b!194132 m!220921))

(declare-fun m!220923 () Bool)

(assert (=> bm!19627 m!220923))

(assert (=> b!193982 d!56653))

(declare-fun d!56655 () Bool)

(declare-fun e!127740 () Bool)

(assert (=> d!56655 e!127740))

(declare-fun res!91766 () Bool)

(assert (=> d!56655 (=> (not res!91766) (not e!127740))))

(declare-fun lt!96817 () ListLongMap!2477)

(assert (=> d!56655 (= res!91766 (contains!1379 lt!96817 (_1!1791 lt!96678)))))

(declare-fun lt!96820 () List!2449)

(assert (=> d!56655 (= lt!96817 (ListLongMap!2478 lt!96820))))

(declare-fun lt!96818 () Unit!5878)

(declare-fun lt!96819 () Unit!5878)

(assert (=> d!56655 (= lt!96818 lt!96819)))

(assert (=> d!56655 (= (getValueByKey!245 lt!96820 (_1!1791 lt!96678)) (Some!250 (_2!1791 lt!96678)))))

(assert (=> d!56655 (= lt!96819 (lemmaContainsTupThenGetReturnValue!132 lt!96820 (_1!1791 lt!96678) (_2!1791 lt!96678)))))

(assert (=> d!56655 (= lt!96820 (insertStrictlySorted!135 (toList!1254 lt!96676) (_1!1791 lt!96678) (_2!1791 lt!96678)))))

(assert (=> d!56655 (= (+!322 lt!96676 lt!96678) lt!96817)))

(declare-fun b!194146 () Bool)

(declare-fun res!91767 () Bool)

(assert (=> b!194146 (=> (not res!91767) (not e!127740))))

(assert (=> b!194146 (= res!91767 (= (getValueByKey!245 (toList!1254 lt!96817) (_1!1791 lt!96678)) (Some!250 (_2!1791 lt!96678))))))

(declare-fun b!194147 () Bool)

(assert (=> b!194147 (= e!127740 (contains!1381 (toList!1254 lt!96817) lt!96678))))

(assert (= (and d!56655 res!91766) b!194146))

(assert (= (and b!194146 res!91767) b!194147))

(declare-fun m!220925 () Bool)

(assert (=> d!56655 m!220925))

(declare-fun m!220927 () Bool)

(assert (=> d!56655 m!220927))

(declare-fun m!220929 () Bool)

(assert (=> d!56655 m!220929))

(declare-fun m!220931 () Bool)

(assert (=> d!56655 m!220931))

(declare-fun m!220933 () Bool)

(assert (=> b!194146 m!220933))

(declare-fun m!220935 () Bool)

(assert (=> b!194147 m!220935))

(assert (=> b!193982 d!56655))

(declare-fun d!56657 () Bool)

(declare-fun e!127742 () Bool)

(assert (=> d!56657 e!127742))

(declare-fun res!91768 () Bool)

(assert (=> d!56657 (=> res!91768 e!127742)))

(declare-fun lt!96821 () Bool)

(assert (=> d!56657 (= res!91768 (not lt!96821))))

(declare-fun lt!96822 () Bool)

(assert (=> d!56657 (= lt!96821 lt!96822)))

(declare-fun lt!96823 () Unit!5878)

(declare-fun e!127741 () Unit!5878)

(assert (=> d!56657 (= lt!96823 e!127741)))

(declare-fun c!35013 () Bool)

(assert (=> d!56657 (= c!35013 lt!96822)))

(assert (=> d!56657 (= lt!96822 (containsKey!249 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (=> d!56657 (= (contains!1379 lt!96669 (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) lt!96821)))

(declare-fun b!194148 () Bool)

(declare-fun lt!96824 () Unit!5878)

(assert (=> b!194148 (= e!127741 lt!96824)))

(assert (=> b!194148 (= lt!96824 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (=> b!194148 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(declare-fun b!194149 () Bool)

(declare-fun Unit!5886 () Unit!5878)

(assert (=> b!194149 (= e!127741 Unit!5886)))

(declare-fun b!194150 () Bool)

(assert (=> b!194150 (= e!127742 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(assert (= (and d!56657 c!35013) b!194148))

(assert (= (and d!56657 (not c!35013)) b!194149))

(assert (= (and d!56657 (not res!91768)) b!194150))

(assert (=> d!56657 m!220759))

(declare-fun m!220937 () Bool)

(assert (=> d!56657 m!220937))

(assert (=> b!194148 m!220759))

(declare-fun m!220939 () Bool)

(assert (=> b!194148 m!220939))

(assert (=> b!194148 m!220759))

(declare-fun m!220941 () Bool)

(assert (=> b!194148 m!220941))

(assert (=> b!194148 m!220941))

(declare-fun m!220943 () Bool)

(assert (=> b!194148 m!220943))

(assert (=> b!194150 m!220759))

(assert (=> b!194150 m!220941))

(assert (=> b!194150 m!220941))

(assert (=> b!194150 m!220943))

(assert (=> b!193982 d!56657))

(declare-fun d!56659 () Bool)

(declare-fun e!127745 () Bool)

(assert (=> d!56659 e!127745))

(declare-fun res!91771 () Bool)

(assert (=> d!56659 (=> (not res!91771) (not e!127745))))

(assert (=> d!56659 (= res!91771 (and (bvsge (index!4947 lt!96677) #b00000000000000000000000000000000) (bvslt (index!4947 lt!96677) (size!4199 (_keys!5954 thiss!1248)))))))

(declare-fun lt!96827 () Unit!5878)

(declare-fun choose!1064 (array!8233 array!8235 (_ BitVec 32) (_ BitVec 32) V!5635 V!5635 (_ BitVec 32) Int) Unit!5878)

(assert (=> d!56659 (= lt!96827 (choose!1064 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (index!4947 lt!96677) (defaultEntry!3960 thiss!1248)))))

(assert (=> d!56659 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56659 (= (lemmaValidKeyInArrayIsInListMap!147 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (index!4947 lt!96677) (defaultEntry!3960 thiss!1248)) lt!96827)))

(declare-fun b!194153 () Bool)

(assert (=> b!194153 (= e!127745 (contains!1379 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (= (and d!56659 res!91771) b!194153))

(declare-fun m!220945 () Bool)

(assert (=> d!56659 m!220945))

(assert (=> d!56659 m!220855))

(assert (=> b!194153 m!220749))

(assert (=> b!194153 m!220759))

(assert (=> b!194153 m!220749))

(assert (=> b!194153 m!220759))

(declare-fun m!220947 () Bool)

(assert (=> b!194153 m!220947))

(assert (=> b!193982 d!56659))

(declare-fun d!56661 () Bool)

(declare-fun e!127747 () Bool)

(assert (=> d!56661 e!127747))

(declare-fun res!91772 () Bool)

(assert (=> d!56661 (=> res!91772 e!127747)))

(declare-fun lt!96828 () Bool)

(assert (=> d!56661 (= res!91772 (not lt!96828))))

(declare-fun lt!96829 () Bool)

(assert (=> d!56661 (= lt!96828 lt!96829)))

(declare-fun lt!96830 () Unit!5878)

(declare-fun e!127746 () Unit!5878)

(assert (=> d!56661 (= lt!96830 e!127746)))

(declare-fun c!35014 () Bool)

(assert (=> d!56661 (= c!35014 lt!96829)))

(assert (=> d!56661 (= lt!96829 (containsKey!249 (toList!1254 lt!96676) key!828))))

(assert (=> d!56661 (= (contains!1379 lt!96676 key!828) lt!96828)))

(declare-fun b!194154 () Bool)

(declare-fun lt!96831 () Unit!5878)

(assert (=> b!194154 (= e!127746 lt!96831)))

(assert (=> b!194154 (= lt!96831 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96676) key!828))))

(assert (=> b!194154 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96676) key!828))))

(declare-fun b!194155 () Bool)

(declare-fun Unit!5887 () Unit!5878)

(assert (=> b!194155 (= e!127746 Unit!5887)))

(declare-fun b!194156 () Bool)

(assert (=> b!194156 (= e!127747 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96676) key!828)))))

(assert (= (and d!56661 c!35014) b!194154))

(assert (= (and d!56661 (not c!35014)) b!194155))

(assert (= (and d!56661 (not res!91772)) b!194156))

(declare-fun m!220949 () Bool)

(assert (=> d!56661 m!220949))

(declare-fun m!220951 () Bool)

(assert (=> b!194154 m!220951))

(declare-fun m!220953 () Bool)

(assert (=> b!194154 m!220953))

(assert (=> b!194154 m!220953))

(declare-fun m!220955 () Bool)

(assert (=> b!194154 m!220955))

(assert (=> b!194156 m!220953))

(assert (=> b!194156 m!220953))

(assert (=> b!194156 m!220955))

(assert (=> b!193982 d!56661))

(declare-fun bm!19634 () Bool)

(declare-fun call!19642 () Bool)

(declare-fun lt!96845 () ListLongMap!2477)

(assert (=> bm!19634 (= call!19642 (contains!1379 lt!96845 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194157 () Bool)

(declare-fun e!127750 () Bool)

(assert (=> b!194157 (= e!127750 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194158 () Bool)

(declare-fun e!127754 () Bool)

(assert (=> b!194158 (= e!127754 (= (apply!188 lt!96845 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3801 thiss!1248)))))

(declare-fun b!194159 () Bool)

(declare-fun e!127760 () Bool)

(declare-fun call!19643 () Bool)

(assert (=> b!194159 (= e!127760 (not call!19643))))

(declare-fun b!194160 () Bool)

(declare-fun e!127749 () ListLongMap!2477)

(declare-fun call!19637 () ListLongMap!2477)

(assert (=> b!194160 (= e!127749 call!19637)))

(declare-fun c!35018 () Bool)

(declare-fun call!19641 () ListLongMap!2477)

(declare-fun call!19640 () ListLongMap!2477)

(declare-fun call!19639 () ListLongMap!2477)

(declare-fun c!35017 () Bool)

(declare-fun bm!19635 () Bool)

(assert (=> bm!19635 (= call!19641 (+!322 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637)) (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!194161 () Bool)

(declare-fun call!19638 () ListLongMap!2477)

(assert (=> b!194161 (= e!127749 call!19638)))

(declare-fun b!194162 () Bool)

(declare-fun e!127759 () Unit!5878)

(declare-fun lt!96841 () Unit!5878)

(assert (=> b!194162 (= e!127759 lt!96841)))

(declare-fun lt!96836 () ListLongMap!2477)

(assert (=> b!194162 (= lt!96836 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96852 () (_ BitVec 64))

(assert (=> b!194162 (= lt!96852 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96832 () (_ BitVec 64))

(assert (=> b!194162 (= lt!96832 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96843 () Unit!5878)

(assert (=> b!194162 (= lt!96843 (addStillContains!164 lt!96836 lt!96852 (zeroValue!3801 thiss!1248) lt!96832))))

(assert (=> b!194162 (contains!1379 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) lt!96832)))

(declare-fun lt!96851 () Unit!5878)

(assert (=> b!194162 (= lt!96851 lt!96843)))

(declare-fun lt!96838 () ListLongMap!2477)

(assert (=> b!194162 (= lt!96838 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96846 () (_ BitVec 64))

(assert (=> b!194162 (= lt!96846 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96850 () (_ BitVec 64))

(assert (=> b!194162 (= lt!96850 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96847 () Unit!5878)

(assert (=> b!194162 (= lt!96847 (addApplyDifferent!164 lt!96838 lt!96846 (minValue!3801 thiss!1248) lt!96850))))

(assert (=> b!194162 (= (apply!188 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) lt!96850) (apply!188 lt!96838 lt!96850))))

(declare-fun lt!96833 () Unit!5878)

(assert (=> b!194162 (= lt!96833 lt!96847)))

(declare-fun lt!96848 () ListLongMap!2477)

(assert (=> b!194162 (= lt!96848 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96839 () (_ BitVec 64))

(assert (=> b!194162 (= lt!96839 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96834 () (_ BitVec 64))

(assert (=> b!194162 (= lt!96834 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96849 () Unit!5878)

(assert (=> b!194162 (= lt!96849 (addApplyDifferent!164 lt!96848 lt!96839 (zeroValue!3801 thiss!1248) lt!96834))))

(assert (=> b!194162 (= (apply!188 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) lt!96834) (apply!188 lt!96848 lt!96834))))

(declare-fun lt!96837 () Unit!5878)

(assert (=> b!194162 (= lt!96837 lt!96849)))

(declare-fun lt!96853 () ListLongMap!2477)

(assert (=> b!194162 (= lt!96853 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96844 () (_ BitVec 64))

(assert (=> b!194162 (= lt!96844 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96835 () (_ BitVec 64))

(assert (=> b!194162 (= lt!96835 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194162 (= lt!96841 (addApplyDifferent!164 lt!96853 lt!96844 (minValue!3801 thiss!1248) lt!96835))))

(assert (=> b!194162 (= (apply!188 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) lt!96835) (apply!188 lt!96853 lt!96835))))

(declare-fun b!194163 () Bool)

(declare-fun e!127751 () Bool)

(assert (=> b!194163 (= e!127751 (= (apply!188 lt!96845 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4200 (_values!3943 thiss!1248))))))

(assert (=> b!194163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun d!56663 () Bool)

(declare-fun e!127752 () Bool)

(assert (=> d!56663 e!127752))

(declare-fun res!91781 () Bool)

(assert (=> d!56663 (=> (not res!91781) (not e!127752))))

(assert (=> d!56663 (= res!91781 (or (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))))

(declare-fun lt!96842 () ListLongMap!2477)

(assert (=> d!56663 (= lt!96845 lt!96842)))

(declare-fun lt!96840 () Unit!5878)

(assert (=> d!56663 (= lt!96840 e!127759)))

(declare-fun c!35020 () Bool)

(assert (=> d!56663 (= c!35020 e!127750)))

(declare-fun res!91776 () Bool)

(assert (=> d!56663 (=> (not res!91776) (not e!127750))))

(assert (=> d!56663 (= res!91776 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun e!127758 () ListLongMap!2477)

(assert (=> d!56663 (= lt!96842 e!127758)))

(assert (=> d!56663 (= c!35017 (and (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56663 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56663 (= (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) lt!96845)))

(declare-fun bm!19636 () Bool)

(assert (=> bm!19636 (= call!19643 (contains!1379 lt!96845 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194164 () Bool)

(declare-fun e!127748 () ListLongMap!2477)

(assert (=> b!194164 (= e!127748 call!19638)))

(declare-fun bm!19637 () Bool)

(assert (=> bm!19637 (= call!19638 call!19641)))

(declare-fun bm!19638 () Bool)

(assert (=> bm!19638 (= call!19637 call!19639)))

(declare-fun bm!19639 () Bool)

(assert (=> bm!19639 (= call!19640 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun b!194165 () Bool)

(assert (=> b!194165 (= e!127758 (+!322 call!19641 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(declare-fun b!194166 () Bool)

(declare-fun e!127757 () Bool)

(assert (=> b!194166 (= e!127757 e!127751)))

(declare-fun res!91773 () Bool)

(assert (=> b!194166 (=> (not res!91773) (not e!127751))))

(assert (=> b!194166 (= res!91773 (contains!1379 lt!96845 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194166 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194167 () Bool)

(assert (=> b!194167 (= e!127758 e!127748)))

(assert (=> b!194167 (= c!35018 (and (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194168 () Bool)

(declare-fun res!91779 () Bool)

(assert (=> b!194168 (=> (not res!91779) (not e!127752))))

(assert (=> b!194168 (= res!91779 e!127757)))

(declare-fun res!91774 () Bool)

(assert (=> b!194168 (=> res!91774 e!127757)))

(declare-fun e!127753 () Bool)

(assert (=> b!194168 (= res!91774 (not e!127753))))

(declare-fun res!91775 () Bool)

(assert (=> b!194168 (=> (not res!91775) (not e!127753))))

(assert (=> b!194168 (= res!91775 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194169 () Bool)

(declare-fun e!127755 () Bool)

(assert (=> b!194169 (= e!127760 e!127755)))

(declare-fun res!91778 () Bool)

(assert (=> b!194169 (= res!91778 call!19643)))

(assert (=> b!194169 (=> (not res!91778) (not e!127755))))

(declare-fun b!194170 () Bool)

(assert (=> b!194170 (= e!127755 (= (apply!188 lt!96845 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3801 thiss!1248)))))

(declare-fun bm!19640 () Bool)

(assert (=> bm!19640 (= call!19639 call!19640)))

(declare-fun b!194171 () Bool)

(declare-fun res!91777 () Bool)

(assert (=> b!194171 (=> (not res!91777) (not e!127752))))

(declare-fun e!127756 () Bool)

(assert (=> b!194171 (= res!91777 e!127756)))

(declare-fun c!35019 () Bool)

(assert (=> b!194171 (= c!35019 (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!194172 () Bool)

(declare-fun c!35015 () Bool)

(assert (=> b!194172 (= c!35015 (and (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!194172 (= e!127748 e!127749)))

(declare-fun b!194173 () Bool)

(assert (=> b!194173 (= e!127753 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194174 () Bool)

(assert (=> b!194174 (= e!127756 e!127754)))

(declare-fun res!91780 () Bool)

(assert (=> b!194174 (= res!91780 call!19642)))

(assert (=> b!194174 (=> (not res!91780) (not e!127754))))

(declare-fun b!194175 () Bool)

(assert (=> b!194175 (= e!127752 e!127760)))

(declare-fun c!35016 () Bool)

(assert (=> b!194175 (= c!35016 (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194176 () Bool)

(assert (=> b!194176 (= e!127756 (not call!19642))))

(declare-fun b!194177 () Bool)

(declare-fun Unit!5888 () Unit!5878)

(assert (=> b!194177 (= e!127759 Unit!5888)))

(assert (= (and d!56663 c!35017) b!194165))

(assert (= (and d!56663 (not c!35017)) b!194167))

(assert (= (and b!194167 c!35018) b!194164))

(assert (= (and b!194167 (not c!35018)) b!194172))

(assert (= (and b!194172 c!35015) b!194161))

(assert (= (and b!194172 (not c!35015)) b!194160))

(assert (= (or b!194161 b!194160) bm!19638))

(assert (= (or b!194164 bm!19638) bm!19640))

(assert (= (or b!194164 b!194161) bm!19637))

(assert (= (or b!194165 bm!19640) bm!19639))

(assert (= (or b!194165 bm!19637) bm!19635))

(assert (= (and d!56663 res!91776) b!194157))

(assert (= (and d!56663 c!35020) b!194162))

(assert (= (and d!56663 (not c!35020)) b!194177))

(assert (= (and d!56663 res!91781) b!194168))

(assert (= (and b!194168 res!91775) b!194173))

(assert (= (and b!194168 (not res!91774)) b!194166))

(assert (= (and b!194166 res!91773) b!194163))

(assert (= (and b!194168 res!91779) b!194171))

(assert (= (and b!194171 c!35019) b!194174))

(assert (= (and b!194171 (not c!35019)) b!194176))

(assert (= (and b!194174 res!91780) b!194158))

(assert (= (or b!194174 b!194176) bm!19634))

(assert (= (and b!194171 res!91777) b!194175))

(assert (= (and b!194175 c!35016) b!194169))

(assert (= (and b!194175 (not c!35016)) b!194159))

(assert (= (and b!194169 res!91778) b!194170))

(assert (= (or b!194169 b!194159) bm!19636))

(declare-fun b_lambda!7481 () Bool)

(assert (=> (not b_lambda!7481) (not b!194163)))

(assert (=> b!194163 t!7378))

(declare-fun b_and!11439 () Bool)

(assert (= b_and!11437 (and (=> t!7378 result!4939) b_and!11439)))

(declare-fun m!220957 () Bool)

(assert (=> bm!19639 m!220957))

(declare-fun m!220959 () Bool)

(assert (=> b!194158 m!220959))

(declare-fun m!220961 () Bool)

(assert (=> bm!19636 m!220961))

(assert (=> d!56663 m!220855))

(declare-fun m!220963 () Bool)

(assert (=> b!194165 m!220963))

(declare-fun m!220965 () Bool)

(assert (=> bm!19635 m!220965))

(assert (=> b!194157 m!220877))

(assert (=> b!194157 m!220877))

(assert (=> b!194157 m!220879))

(assert (=> b!194173 m!220877))

(assert (=> b!194173 m!220877))

(assert (=> b!194173 m!220879))

(assert (=> b!194163 m!220877))

(assert (=> b!194163 m!220881))

(assert (=> b!194163 m!220877))

(declare-fun m!220967 () Bool)

(assert (=> b!194163 m!220967))

(declare-fun m!220969 () Bool)

(assert (=> b!194163 m!220969))

(assert (=> b!194163 m!220969))

(assert (=> b!194163 m!220881))

(declare-fun m!220971 () Bool)

(assert (=> b!194163 m!220971))

(declare-fun m!220973 () Bool)

(assert (=> b!194170 m!220973))

(declare-fun m!220975 () Bool)

(assert (=> b!194162 m!220975))

(declare-fun m!220977 () Bool)

(assert (=> b!194162 m!220977))

(declare-fun m!220979 () Bool)

(assert (=> b!194162 m!220979))

(declare-fun m!220981 () Bool)

(assert (=> b!194162 m!220981))

(declare-fun m!220983 () Bool)

(assert (=> b!194162 m!220983))

(declare-fun m!220985 () Bool)

(assert (=> b!194162 m!220985))

(declare-fun m!220987 () Bool)

(assert (=> b!194162 m!220987))

(declare-fun m!220989 () Bool)

(assert (=> b!194162 m!220989))

(declare-fun m!220991 () Bool)

(assert (=> b!194162 m!220991))

(assert (=> b!194162 m!220877))

(declare-fun m!220993 () Bool)

(assert (=> b!194162 m!220993))

(assert (=> b!194162 m!220977))

(assert (=> b!194162 m!220957))

(assert (=> b!194162 m!220989))

(declare-fun m!220995 () Bool)

(assert (=> b!194162 m!220995))

(declare-fun m!220997 () Bool)

(assert (=> b!194162 m!220997))

(assert (=> b!194162 m!220981))

(declare-fun m!220999 () Bool)

(assert (=> b!194162 m!220999))

(declare-fun m!221001 () Bool)

(assert (=> b!194162 m!221001))

(assert (=> b!194162 m!220985))

(declare-fun m!221003 () Bool)

(assert (=> b!194162 m!221003))

(assert (=> b!194166 m!220877))

(assert (=> b!194166 m!220877))

(declare-fun m!221005 () Bool)

(assert (=> b!194166 m!221005))

(declare-fun m!221007 () Bool)

(assert (=> bm!19634 m!221007))

(assert (=> b!193982 d!56663))

(declare-fun d!56665 () Bool)

(declare-fun e!127763 () Bool)

(assert (=> d!56665 e!127763))

(declare-fun res!91784 () Bool)

(assert (=> d!56665 (=> (not res!91784) (not e!127763))))

(assert (=> d!56665 (= res!91784 (and (bvsge (index!4947 lt!96677) #b00000000000000000000000000000000) (bvslt (index!4947 lt!96677) (size!4200 (_values!3943 thiss!1248)))))))

(declare-fun lt!96856 () Unit!5878)

(declare-fun choose!1065 (array!8233 array!8235 (_ BitVec 32) (_ BitVec 32) V!5635 V!5635 (_ BitVec 32) (_ BitVec 64) V!5635 Int) Unit!5878)

(assert (=> d!56665 (= lt!96856 (choose!1065 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (index!4947 lt!96677) key!828 v!309 (defaultEntry!3960 thiss!1248)))))

(assert (=> d!56665 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56665 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!123 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (index!4947 lt!96677) key!828 v!309 (defaultEntry!3960 thiss!1248)) lt!96856)))

(declare-fun b!194180 () Bool)

(assert (=> b!194180 (= e!127763 (= (+!322 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) (tuple2!3561 key!828 v!309)) (getCurrentListMap!902 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))))

(assert (= (and d!56665 res!91784) b!194180))

(declare-fun m!221009 () Bool)

(assert (=> d!56665 m!221009))

(assert (=> d!56665 m!220855))

(assert (=> b!194180 m!220747))

(assert (=> b!194180 m!220747))

(declare-fun m!221011 () Bool)

(assert (=> b!194180 m!221011))

(assert (=> b!194180 m!220753))

(declare-fun m!221013 () Bool)

(assert (=> b!194180 m!221013))

(assert (=> b!193982 d!56665))

(declare-fun d!56667 () Bool)

(declare-fun e!127766 () Bool)

(assert (=> d!56667 e!127766))

(declare-fun res!91789 () Bool)

(assert (=> d!56667 (=> (not res!91789) (not e!127766))))

(declare-fun lt!96861 () SeekEntryResult!694)

(assert (=> d!56667 (= res!91789 ((_ is Found!694) lt!96861))))

(assert (=> d!56667 (= lt!96861 (seekEntryOrOpen!0 key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun lt!96862 () Unit!5878)

(declare-fun choose!1066 (array!8233 array!8235 (_ BitVec 32) (_ BitVec 32) V!5635 V!5635 (_ BitVec 64) Int) Unit!5878)

(assert (=> d!56667 (= lt!96862 (choose!1066 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) key!828 (defaultEntry!3960 thiss!1248)))))

(assert (=> d!56667 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56667 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!186 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) key!828 (defaultEntry!3960 thiss!1248)) lt!96862)))

(declare-fun b!194185 () Bool)

(declare-fun res!91790 () Bool)

(assert (=> b!194185 (=> (not res!91790) (not e!127766))))

(assert (=> b!194185 (= res!91790 (inRange!0 (index!4947 lt!96861) (mask!9223 thiss!1248)))))

(declare-fun b!194186 () Bool)

(assert (=> b!194186 (= e!127766 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96861)) key!828))))

(assert (=> b!194186 (and (bvsge (index!4947 lt!96861) #b00000000000000000000000000000000) (bvslt (index!4947 lt!96861) (size!4199 (_keys!5954 thiss!1248))))))

(assert (= (and d!56667 res!91789) b!194185))

(assert (= (and b!194185 res!91790) b!194186))

(assert (=> d!56667 m!220771))

(declare-fun m!221015 () Bool)

(assert (=> d!56667 m!221015))

(assert (=> d!56667 m!220855))

(declare-fun m!221017 () Bool)

(assert (=> b!194185 m!221017))

(declare-fun m!221019 () Bool)

(assert (=> b!194186 m!221019))

(assert (=> b!193991 d!56667))

(declare-fun d!56669 () Bool)

(assert (=> d!56669 (= (inRange!0 (index!4947 lt!96677) (mask!9223 thiss!1248)) (and (bvsge (index!4947 lt!96677) #b00000000000000000000000000000000) (bvslt (index!4947 lt!96677) (bvadd (mask!9223 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193991 d!56669))

(declare-fun d!56671 () Bool)

(assert (=> d!56671 (= (array_inv!2513 (_keys!5954 thiss!1248)) (bvsge (size!4199 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193989 d!56671))

(declare-fun d!56673 () Bool)

(assert (=> d!56673 (= (array_inv!2514 (_values!3943 thiss!1248)) (bvsge (size!4200 (_values!3943 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193989 d!56673))

(declare-fun b!194199 () Bool)

(declare-fun e!127774 () SeekEntryResult!694)

(declare-fun e!127773 () SeekEntryResult!694)

(assert (=> b!194199 (= e!127774 e!127773)))

(declare-fun lt!96870 () (_ BitVec 64))

(declare-fun lt!96869 () SeekEntryResult!694)

(assert (=> b!194199 (= lt!96870 (select (arr!3875 (_keys!5954 thiss!1248)) (index!4948 lt!96869)))))

(declare-fun c!35027 () Bool)

(assert (=> b!194199 (= c!35027 (= lt!96870 key!828))))

(declare-fun e!127775 () SeekEntryResult!694)

(declare-fun b!194200 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8233 (_ BitVec 32)) SeekEntryResult!694)

(assert (=> b!194200 (= e!127775 (seekKeyOrZeroReturnVacant!0 (x!20690 lt!96869) (index!4948 lt!96869) (index!4948 lt!96869) key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun b!194201 () Bool)

(declare-fun c!35028 () Bool)

(assert (=> b!194201 (= c!35028 (= lt!96870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194201 (= e!127773 e!127775)))

(declare-fun b!194202 () Bool)

(assert (=> b!194202 (= e!127774 Undefined!694)))

(declare-fun d!56675 () Bool)

(declare-fun lt!96871 () SeekEntryResult!694)

(assert (=> d!56675 (and (or ((_ is Undefined!694) lt!96871) (not ((_ is Found!694) lt!96871)) (and (bvsge (index!4947 lt!96871) #b00000000000000000000000000000000) (bvslt (index!4947 lt!96871) (size!4199 (_keys!5954 thiss!1248))))) (or ((_ is Undefined!694) lt!96871) ((_ is Found!694) lt!96871) (not ((_ is MissingZero!694) lt!96871)) (and (bvsge (index!4946 lt!96871) #b00000000000000000000000000000000) (bvslt (index!4946 lt!96871) (size!4199 (_keys!5954 thiss!1248))))) (or ((_ is Undefined!694) lt!96871) ((_ is Found!694) lt!96871) ((_ is MissingZero!694) lt!96871) (not ((_ is MissingVacant!694) lt!96871)) (and (bvsge (index!4949 lt!96871) #b00000000000000000000000000000000) (bvslt (index!4949 lt!96871) (size!4199 (_keys!5954 thiss!1248))))) (or ((_ is Undefined!694) lt!96871) (ite ((_ is Found!694) lt!96871) (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96871)) key!828) (ite ((_ is MissingZero!694) lt!96871) (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4946 lt!96871)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!694) lt!96871) (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4949 lt!96871)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56675 (= lt!96871 e!127774)))

(declare-fun c!35029 () Bool)

(assert (=> d!56675 (= c!35029 (and ((_ is Intermediate!694) lt!96869) (undefined!1506 lt!96869)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8233 (_ BitVec 32)) SeekEntryResult!694)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56675 (= lt!96869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9223 thiss!1248)) key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(assert (=> d!56675 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56675 (= (seekEntryOrOpen!0 key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)) lt!96871)))

(declare-fun b!194203 () Bool)

(assert (=> b!194203 (= e!127773 (Found!694 (index!4948 lt!96869)))))

(declare-fun b!194204 () Bool)

(assert (=> b!194204 (= e!127775 (MissingZero!694 (index!4948 lt!96869)))))

(assert (= (and d!56675 c!35029) b!194202))

(assert (= (and d!56675 (not c!35029)) b!194199))

(assert (= (and b!194199 c!35027) b!194203))

(assert (= (and b!194199 (not c!35027)) b!194201))

(assert (= (and b!194201 c!35028) b!194204))

(assert (= (and b!194201 (not c!35028)) b!194200))

(declare-fun m!221021 () Bool)

(assert (=> b!194199 m!221021))

(declare-fun m!221023 () Bool)

(assert (=> b!194200 m!221023))

(declare-fun m!221025 () Bool)

(assert (=> d!56675 m!221025))

(declare-fun m!221027 () Bool)

(assert (=> d!56675 m!221027))

(declare-fun m!221029 () Bool)

(assert (=> d!56675 m!221029))

(assert (=> d!56675 m!220855))

(declare-fun m!221031 () Bool)

(assert (=> d!56675 m!221031))

(declare-fun m!221033 () Bool)

(assert (=> d!56675 m!221033))

(assert (=> d!56675 m!221027))

(assert (=> b!193986 d!56675))

(declare-fun mapIsEmpty!7775 () Bool)

(declare-fun mapRes!7775 () Bool)

(assert (=> mapIsEmpty!7775 mapRes!7775))

(declare-fun b!194212 () Bool)

(declare-fun e!127780 () Bool)

(assert (=> b!194212 (= e!127780 tp_is_empty!4491)))

(declare-fun condMapEmpty!7775 () Bool)

(declare-fun mapDefault!7775 () ValueCell!1902)

(assert (=> mapNonEmpty!7769 (= condMapEmpty!7775 (= mapRest!7769 ((as const (Array (_ BitVec 32) ValueCell!1902)) mapDefault!7775)))))

(assert (=> mapNonEmpty!7769 (= tp!17027 (and e!127780 mapRes!7775))))

(declare-fun mapNonEmpty!7775 () Bool)

(declare-fun tp!17036 () Bool)

(declare-fun e!127781 () Bool)

(assert (=> mapNonEmpty!7775 (= mapRes!7775 (and tp!17036 e!127781))))

(declare-fun mapRest!7775 () (Array (_ BitVec 32) ValueCell!1902))

(declare-fun mapKey!7775 () (_ BitVec 32))

(declare-fun mapValue!7775 () ValueCell!1902)

(assert (=> mapNonEmpty!7775 (= mapRest!7769 (store mapRest!7775 mapKey!7775 mapValue!7775))))

(declare-fun b!194211 () Bool)

(assert (=> b!194211 (= e!127781 tp_is_empty!4491)))

(assert (= (and mapNonEmpty!7769 condMapEmpty!7775) mapIsEmpty!7775))

(assert (= (and mapNonEmpty!7769 (not condMapEmpty!7775)) mapNonEmpty!7775))

(assert (= (and mapNonEmpty!7775 ((_ is ValueCellFull!1902) mapValue!7775)) b!194211))

(assert (= (and mapNonEmpty!7769 ((_ is ValueCellFull!1902) mapDefault!7775)) b!194212))

(declare-fun m!221035 () Bool)

(assert (=> mapNonEmpty!7775 m!221035))

(declare-fun b_lambda!7483 () Bool)

(assert (= b_lambda!7479 (or (and b!193989 b_free!4719) b_lambda!7483)))

(declare-fun b_lambda!7485 () Bool)

(assert (= b_lambda!7481 (or (and b!193989 b_free!4719) b_lambda!7485)))

(check-sat (not d!56645) (not d!56655) (not bm!19634) (not b!194139) tp_is_empty!4491 (not b!194166) (not b!194079) (not d!56659) (not d!56667) (not b!194163) (not b!194034) (not b!194158) (not bm!19635) (not b!194129) (not bm!19611) (not b!194146) (not b!194156) (not b!194200) (not b!194180) (not b!194052) (not b!194128) (not d!56649) (not mapNonEmpty!7775) (not b!194080) (not bm!19612) (not b!194157) (not b!194153) (not d!56639) (not b!194147) (not b!194173) (not d!56665) (not b!194044) (not b_next!4719) (not d!56653) (not b!194123) (not d!56647) (not d!56641) (not bm!19627) (not b_lambda!7483) (not d!56675) (not b!194170) (not b!194035) (not b!194124) (not d!56651) (not bm!19636) (not b!194185) (not b!194042) (not b!194136) (not d!56643) (not b!194148) (not d!56657) (not b!194131) (not d!56661) (not bm!19629) b_and!11439 (not b!194162) (not b!194132) (not b!194150) (not bm!19632) (not d!56663) (not b!194078) (not b!194154) (not b!194053) (not b!194165) (not bm!19628) (not b_lambda!7485) (not bm!19639) (not b!194051))
(check-sat b_and!11439 (not b_next!4719))
(get-model)

(declare-fun d!56677 () Bool)

(assert (=> d!56677 (= (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194157 d!56677))

(declare-fun b!194223 () Bool)

(declare-fun res!91799 () Bool)

(declare-fun e!127784 () Bool)

(assert (=> b!194223 (=> (not res!91799) (not e!127784))))

(declare-fun size!4203 (LongMapFixedSize!2712) (_ BitVec 32))

(assert (=> b!194223 (= res!91799 (= (size!4203 thiss!1248) (bvadd (_size!1405 thiss!1248) (bvsdiv (bvadd (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!194222 () Bool)

(declare-fun res!91801 () Bool)

(assert (=> b!194222 (=> (not res!91801) (not e!127784))))

(assert (=> b!194222 (= res!91801 (bvsge (size!4203 thiss!1248) (_size!1405 thiss!1248)))))

(declare-fun d!56679 () Bool)

(declare-fun res!91800 () Bool)

(assert (=> d!56679 (=> (not res!91800) (not e!127784))))

(assert (=> d!56679 (= res!91800 (validMask!0 (mask!9223 thiss!1248)))))

(assert (=> d!56679 (= (simpleValid!204 thiss!1248) e!127784)))

(declare-fun b!194221 () Bool)

(declare-fun res!91802 () Bool)

(assert (=> b!194221 (=> (not res!91802) (not e!127784))))

(assert (=> b!194221 (= res!91802 (and (= (size!4200 (_values!3943 thiss!1248)) (bvadd (mask!9223 thiss!1248) #b00000000000000000000000000000001)) (= (size!4199 (_keys!5954 thiss!1248)) (size!4200 (_values!3943 thiss!1248))) (bvsge (_size!1405 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1405 thiss!1248) (bvadd (mask!9223 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!194224 () Bool)

(assert (=> b!194224 (= e!127784 (and (bvsge (extraKeys!3697 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3697 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1405 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!56679 res!91800) b!194221))

(assert (= (and b!194221 res!91802) b!194222))

(assert (= (and b!194222 res!91801) b!194223))

(assert (= (and b!194223 res!91799) b!194224))

(declare-fun m!221037 () Bool)

(assert (=> b!194223 m!221037))

(assert (=> b!194222 m!221037))

(assert (=> d!56679 m!220855))

(assert (=> d!56647 d!56679))

(declare-fun d!56681 () Bool)

(declare-fun e!127786 () Bool)

(assert (=> d!56681 e!127786))

(declare-fun res!91803 () Bool)

(assert (=> d!56681 (=> res!91803 e!127786)))

(declare-fun lt!96872 () Bool)

(assert (=> d!56681 (= res!91803 (not lt!96872))))

(declare-fun lt!96873 () Bool)

(assert (=> d!56681 (= lt!96872 lt!96873)))

(declare-fun lt!96874 () Unit!5878)

(declare-fun e!127785 () Unit!5878)

(assert (=> d!56681 (= lt!96874 e!127785)))

(declare-fun c!35030 () Bool)

(assert (=> d!56681 (= c!35030 lt!96873)))

(assert (=> d!56681 (= lt!96873 (containsKey!249 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (=> d!56681 (= (contains!1379 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) lt!96872)))

(declare-fun b!194225 () Bool)

(declare-fun lt!96875 () Unit!5878)

(assert (=> b!194225 (= e!127785 lt!96875)))

(assert (=> b!194225 (= lt!96875 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (=> b!194225 (isDefined!198 (getValueByKey!245 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(declare-fun b!194226 () Bool)

(declare-fun Unit!5889 () Unit!5878)

(assert (=> b!194226 (= e!127785 Unit!5889)))

(declare-fun b!194227 () Bool)

(assert (=> b!194227 (= e!127786 (isDefined!198 (getValueByKey!245 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(assert (= (and d!56681 c!35030) b!194225))

(assert (= (and d!56681 (not c!35030)) b!194226))

(assert (= (and d!56681 (not res!91803)) b!194227))

(assert (=> d!56681 m!220759))

(declare-fun m!221039 () Bool)

(assert (=> d!56681 m!221039))

(assert (=> b!194225 m!220759))

(declare-fun m!221041 () Bool)

(assert (=> b!194225 m!221041))

(assert (=> b!194225 m!220759))

(declare-fun m!221043 () Bool)

(assert (=> b!194225 m!221043))

(assert (=> b!194225 m!221043))

(declare-fun m!221045 () Bool)

(assert (=> b!194225 m!221045))

(assert (=> b!194227 m!220759))

(assert (=> b!194227 m!221043))

(assert (=> b!194227 m!221043))

(assert (=> b!194227 m!221045))

(assert (=> b!194153 d!56681))

(assert (=> b!194153 d!56653))

(declare-fun b!194236 () Bool)

(declare-fun e!127795 () Bool)

(declare-fun e!127794 () Bool)

(assert (=> b!194236 (= e!127795 e!127794)))

(declare-fun c!35033 () Bool)

(assert (=> b!194236 (= c!35033 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194237 () Bool)

(declare-fun e!127793 () Bool)

(declare-fun call!19646 () Bool)

(assert (=> b!194237 (= e!127793 call!19646)))

(declare-fun b!194238 () Bool)

(assert (=> b!194238 (= e!127794 e!127793)))

(declare-fun lt!96882 () (_ BitVec 64))

(assert (=> b!194238 (= lt!96882 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96884 () Unit!5878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8233 (_ BitVec 64) (_ BitVec 32)) Unit!5878)

(assert (=> b!194238 (= lt!96884 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5954 thiss!1248) lt!96882 #b00000000000000000000000000000000))))

(assert (=> b!194238 (arrayContainsKey!0 (_keys!5954 thiss!1248) lt!96882 #b00000000000000000000000000000000)))

(declare-fun lt!96883 () Unit!5878)

(assert (=> b!194238 (= lt!96883 lt!96884)))

(declare-fun res!91808 () Bool)

(assert (=> b!194238 (= res!91808 (= (seekEntryOrOpen!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (_keys!5954 thiss!1248) (mask!9223 thiss!1248)) (Found!694 #b00000000000000000000000000000000)))))

(assert (=> b!194238 (=> (not res!91808) (not e!127793))))

(declare-fun d!56683 () Bool)

(declare-fun res!91809 () Bool)

(assert (=> d!56683 (=> res!91809 e!127795)))

(assert (=> d!56683 (= res!91809 (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!56683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)) e!127795)))

(declare-fun bm!19643 () Bool)

(assert (=> bm!19643 (= call!19646 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun b!194239 () Bool)

(assert (=> b!194239 (= e!127794 call!19646)))

(assert (= (and d!56683 (not res!91809)) b!194236))

(assert (= (and b!194236 c!35033) b!194238))

(assert (= (and b!194236 (not c!35033)) b!194239))

(assert (= (and b!194238 res!91808) b!194237))

(assert (= (or b!194237 b!194239) bm!19643))

(assert (=> b!194236 m!220877))

(assert (=> b!194236 m!220877))

(assert (=> b!194236 m!220879))

(assert (=> b!194238 m!220877))

(declare-fun m!221047 () Bool)

(assert (=> b!194238 m!221047))

(declare-fun m!221049 () Bool)

(assert (=> b!194238 m!221049))

(assert (=> b!194238 m!220877))

(declare-fun m!221051 () Bool)

(assert (=> b!194238 m!221051))

(declare-fun m!221053 () Bool)

(assert (=> bm!19643 m!221053))

(assert (=> b!194052 d!56683))

(declare-fun b!194258 () Bool)

(declare-fun e!127807 () Bool)

(declare-fun e!127808 () Bool)

(assert (=> b!194258 (= e!127807 e!127808)))

(declare-fun res!91818 () Bool)

(declare-fun lt!96890 () SeekEntryResult!694)

(assert (=> b!194258 (= res!91818 (and ((_ is Intermediate!694) lt!96890) (not (undefined!1506 lt!96890)) (bvslt (x!20690 lt!96890) #b01111111111111111111111111111110) (bvsge (x!20690 lt!96890) #b00000000000000000000000000000000) (bvsge (x!20690 lt!96890) #b00000000000000000000000000000000)))))

(assert (=> b!194258 (=> (not res!91818) (not e!127808))))

(declare-fun b!194259 () Bool)

(declare-fun e!127810 () SeekEntryResult!694)

(assert (=> b!194259 (= e!127810 (Intermediate!694 true (toIndex!0 key!828 (mask!9223 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!194260 () Bool)

(declare-fun e!127809 () SeekEntryResult!694)

(assert (=> b!194260 (= e!127810 e!127809)))

(declare-fun c!35040 () Bool)

(declare-fun lt!96889 () (_ BitVec 64))

(assert (=> b!194260 (= c!35040 (or (= lt!96889 key!828) (= (bvadd lt!96889 lt!96889) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194261 () Bool)

(assert (=> b!194261 (and (bvsge (index!4948 lt!96890) #b00000000000000000000000000000000) (bvslt (index!4948 lt!96890) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun res!91817 () Bool)

(assert (=> b!194261 (= res!91817 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4948 lt!96890)) key!828))))

(declare-fun e!127806 () Bool)

(assert (=> b!194261 (=> res!91817 e!127806)))

(assert (=> b!194261 (= e!127808 e!127806)))

(declare-fun b!194262 () Bool)

(assert (=> b!194262 (= e!127809 (Intermediate!694 false (toIndex!0 key!828 (mask!9223 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!194263 () Bool)

(assert (=> b!194263 (= e!127807 (bvsge (x!20690 lt!96890) #b01111111111111111111111111111110))))

(declare-fun d!56685 () Bool)

(assert (=> d!56685 e!127807))

(declare-fun c!35042 () Bool)

(assert (=> d!56685 (= c!35042 (and ((_ is Intermediate!694) lt!96890) (undefined!1506 lt!96890)))))

(assert (=> d!56685 (= lt!96890 e!127810)))

(declare-fun c!35041 () Bool)

(assert (=> d!56685 (= c!35041 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!56685 (= lt!96889 (select (arr!3875 (_keys!5954 thiss!1248)) (toIndex!0 key!828 (mask!9223 thiss!1248))))))

(assert (=> d!56685 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9223 thiss!1248)) key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)) lt!96890)))

(declare-fun b!194264 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!194264 (= e!127809 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9223 thiss!1248)) #b00000000000000000000000000000000 (mask!9223 thiss!1248)) key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun b!194265 () Bool)

(assert (=> b!194265 (and (bvsge (index!4948 lt!96890) #b00000000000000000000000000000000) (bvslt (index!4948 lt!96890) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun res!91816 () Bool)

(assert (=> b!194265 (= res!91816 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4948 lt!96890)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194265 (=> res!91816 e!127806)))

(declare-fun b!194266 () Bool)

(assert (=> b!194266 (and (bvsge (index!4948 lt!96890) #b00000000000000000000000000000000) (bvslt (index!4948 lt!96890) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> b!194266 (= e!127806 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4948 lt!96890)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56685 c!35041) b!194259))

(assert (= (and d!56685 (not c!35041)) b!194260))

(assert (= (and b!194260 c!35040) b!194262))

(assert (= (and b!194260 (not c!35040)) b!194264))

(assert (= (and d!56685 c!35042) b!194263))

(assert (= (and d!56685 (not c!35042)) b!194258))

(assert (= (and b!194258 res!91818) b!194261))

(assert (= (and b!194261 (not res!91817)) b!194265))

(assert (= (and b!194265 (not res!91816)) b!194266))

(assert (=> b!194264 m!221027))

(declare-fun m!221055 () Bool)

(assert (=> b!194264 m!221055))

(assert (=> b!194264 m!221055))

(declare-fun m!221057 () Bool)

(assert (=> b!194264 m!221057))

(assert (=> d!56685 m!221027))

(declare-fun m!221059 () Bool)

(assert (=> d!56685 m!221059))

(assert (=> d!56685 m!220855))

(declare-fun m!221061 () Bool)

(assert (=> b!194265 m!221061))

(assert (=> b!194266 m!221061))

(assert (=> b!194261 m!221061))

(assert (=> d!56675 d!56685))

(declare-fun d!56687 () Bool)

(declare-fun lt!96896 () (_ BitVec 32))

(declare-fun lt!96895 () (_ BitVec 32))

(assert (=> d!56687 (= lt!96896 (bvmul (bvxor lt!96895 (bvlshr lt!96895 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56687 (= lt!96895 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56687 (and (bvsge (mask!9223 thiss!1248) #b00000000000000000000000000000000) (let ((res!91819 (let ((h!3089 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20714 (bvmul (bvxor h!3089 (bvlshr h!3089 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20714 (bvlshr x!20714 #b00000000000000000000000000001101)) (mask!9223 thiss!1248)))))) (and (bvslt res!91819 (bvadd (mask!9223 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!91819 #b00000000000000000000000000000000))))))

(assert (=> d!56687 (= (toIndex!0 key!828 (mask!9223 thiss!1248)) (bvand (bvxor lt!96896 (bvlshr lt!96896 #b00000000000000000000000000001101)) (mask!9223 thiss!1248)))))

(assert (=> d!56675 d!56687))

(declare-fun d!56689 () Bool)

(assert (=> d!56689 (= (validMask!0 (mask!9223 thiss!1248)) (and (or (= (mask!9223 thiss!1248) #b00000000000000000000000000000111) (= (mask!9223 thiss!1248) #b00000000000000000000000000001111) (= (mask!9223 thiss!1248) #b00000000000000000000000000011111) (= (mask!9223 thiss!1248) #b00000000000000000000000000111111) (= (mask!9223 thiss!1248) #b00000000000000000000000001111111) (= (mask!9223 thiss!1248) #b00000000000000000000000011111111) (= (mask!9223 thiss!1248) #b00000000000000000000000111111111) (= (mask!9223 thiss!1248) #b00000000000000000000001111111111) (= (mask!9223 thiss!1248) #b00000000000000000000011111111111) (= (mask!9223 thiss!1248) #b00000000000000000000111111111111) (= (mask!9223 thiss!1248) #b00000000000000000001111111111111) (= (mask!9223 thiss!1248) #b00000000000000000011111111111111) (= (mask!9223 thiss!1248) #b00000000000000000111111111111111) (= (mask!9223 thiss!1248) #b00000000000000001111111111111111) (= (mask!9223 thiss!1248) #b00000000000000011111111111111111) (= (mask!9223 thiss!1248) #b00000000000000111111111111111111) (= (mask!9223 thiss!1248) #b00000000000001111111111111111111) (= (mask!9223 thiss!1248) #b00000000000011111111111111111111) (= (mask!9223 thiss!1248) #b00000000000111111111111111111111) (= (mask!9223 thiss!1248) #b00000000001111111111111111111111) (= (mask!9223 thiss!1248) #b00000000011111111111111111111111) (= (mask!9223 thiss!1248) #b00000000111111111111111111111111) (= (mask!9223 thiss!1248) #b00000001111111111111111111111111) (= (mask!9223 thiss!1248) #b00000011111111111111111111111111) (= (mask!9223 thiss!1248) #b00000111111111111111111111111111) (= (mask!9223 thiss!1248) #b00001111111111111111111111111111) (= (mask!9223 thiss!1248) #b00011111111111111111111111111111) (= (mask!9223 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9223 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> d!56675 d!56689))

(declare-fun d!56691 () Bool)

(declare-fun e!127811 () Bool)

(assert (=> d!56691 e!127811))

(declare-fun res!91820 () Bool)

(assert (=> d!56691 (=> (not res!91820) (not e!127811))))

(declare-fun lt!96897 () ListLongMap!2477)

(assert (=> d!56691 (= res!91820 (contains!1379 lt!96897 (_1!1791 (tuple2!3561 key!828 v!309))))))

(declare-fun lt!96900 () List!2449)

(assert (=> d!56691 (= lt!96897 (ListLongMap!2478 lt!96900))))

(declare-fun lt!96898 () Unit!5878)

(declare-fun lt!96899 () Unit!5878)

(assert (=> d!56691 (= lt!96898 lt!96899)))

(assert (=> d!56691 (= (getValueByKey!245 lt!96900 (_1!1791 (tuple2!3561 key!828 v!309))) (Some!250 (_2!1791 (tuple2!3561 key!828 v!309))))))

(assert (=> d!56691 (= lt!96899 (lemmaContainsTupThenGetReturnValue!132 lt!96900 (_1!1791 (tuple2!3561 key!828 v!309)) (_2!1791 (tuple2!3561 key!828 v!309))))))

(assert (=> d!56691 (= lt!96900 (insertStrictlySorted!135 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (_1!1791 (tuple2!3561 key!828 v!309)) (_2!1791 (tuple2!3561 key!828 v!309))))))

(assert (=> d!56691 (= (+!322 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) (tuple2!3561 key!828 v!309)) lt!96897)))

(declare-fun b!194267 () Bool)

(declare-fun res!91821 () Bool)

(assert (=> b!194267 (=> (not res!91821) (not e!127811))))

(assert (=> b!194267 (= res!91821 (= (getValueByKey!245 (toList!1254 lt!96897) (_1!1791 (tuple2!3561 key!828 v!309))) (Some!250 (_2!1791 (tuple2!3561 key!828 v!309)))))))

(declare-fun b!194268 () Bool)

(assert (=> b!194268 (= e!127811 (contains!1381 (toList!1254 lt!96897) (tuple2!3561 key!828 v!309)))))

(assert (= (and d!56691 res!91820) b!194267))

(assert (= (and b!194267 res!91821) b!194268))

(declare-fun m!221063 () Bool)

(assert (=> d!56691 m!221063))

(declare-fun m!221065 () Bool)

(assert (=> d!56691 m!221065))

(declare-fun m!221067 () Bool)

(assert (=> d!56691 m!221067))

(declare-fun m!221069 () Bool)

(assert (=> d!56691 m!221069))

(declare-fun m!221071 () Bool)

(assert (=> b!194267 m!221071))

(declare-fun m!221073 () Bool)

(assert (=> b!194268 m!221073))

(assert (=> b!194180 d!56691))

(assert (=> b!194180 d!56663))

(declare-fun bm!19644 () Bool)

(declare-fun call!19652 () Bool)

(declare-fun lt!96914 () ListLongMap!2477)

(assert (=> bm!19644 (= call!19652 (contains!1379 lt!96914 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194269 () Bool)

(declare-fun e!127814 () Bool)

(assert (=> b!194269 (= e!127814 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194270 () Bool)

(declare-fun e!127818 () Bool)

(assert (=> b!194270 (= e!127818 (= (apply!188 lt!96914 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3801 thiss!1248)))))

(declare-fun b!194271 () Bool)

(declare-fun e!127824 () Bool)

(declare-fun call!19653 () Bool)

(assert (=> b!194271 (= e!127824 (not call!19653))))

(declare-fun b!194272 () Bool)

(declare-fun e!127813 () ListLongMap!2477)

(declare-fun call!19647 () ListLongMap!2477)

(assert (=> b!194272 (= e!127813 call!19647)))

(declare-fun c!35045 () Bool)

(declare-fun c!35046 () Bool)

(declare-fun call!19649 () ListLongMap!2477)

(declare-fun bm!19645 () Bool)

(declare-fun call!19651 () ListLongMap!2477)

(declare-fun call!19650 () ListLongMap!2477)

(assert (=> bm!19645 (= call!19651 (+!322 (ite c!35045 call!19650 (ite c!35046 call!19649 call!19647)) (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!194273 () Bool)

(declare-fun call!19648 () ListLongMap!2477)

(assert (=> b!194273 (= e!127813 call!19648)))

(declare-fun b!194274 () Bool)

(declare-fun e!127823 () Unit!5878)

(declare-fun lt!96910 () Unit!5878)

(assert (=> b!194274 (= e!127823 lt!96910)))

(declare-fun lt!96905 () ListLongMap!2477)

(assert (=> b!194274 (= lt!96905 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96921 () (_ BitVec 64))

(assert (=> b!194274 (= lt!96921 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96901 () (_ BitVec 64))

(assert (=> b!194274 (= lt!96901 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96912 () Unit!5878)

(assert (=> b!194274 (= lt!96912 (addStillContains!164 lt!96905 lt!96921 (zeroValue!3801 thiss!1248) lt!96901))))

(assert (=> b!194274 (contains!1379 (+!322 lt!96905 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248))) lt!96901)))

(declare-fun lt!96920 () Unit!5878)

(assert (=> b!194274 (= lt!96920 lt!96912)))

(declare-fun lt!96907 () ListLongMap!2477)

(assert (=> b!194274 (= lt!96907 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96915 () (_ BitVec 64))

(assert (=> b!194274 (= lt!96915 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96919 () (_ BitVec 64))

(assert (=> b!194274 (= lt!96919 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96916 () Unit!5878)

(assert (=> b!194274 (= lt!96916 (addApplyDifferent!164 lt!96907 lt!96915 (minValue!3801 thiss!1248) lt!96919))))

(assert (=> b!194274 (= (apply!188 (+!322 lt!96907 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248))) lt!96919) (apply!188 lt!96907 lt!96919))))

(declare-fun lt!96902 () Unit!5878)

(assert (=> b!194274 (= lt!96902 lt!96916)))

(declare-fun lt!96917 () ListLongMap!2477)

(assert (=> b!194274 (= lt!96917 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96908 () (_ BitVec 64))

(assert (=> b!194274 (= lt!96908 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96903 () (_ BitVec 64))

(assert (=> b!194274 (= lt!96903 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96918 () Unit!5878)

(assert (=> b!194274 (= lt!96918 (addApplyDifferent!164 lt!96917 lt!96908 (zeroValue!3801 thiss!1248) lt!96903))))

(assert (=> b!194274 (= (apply!188 (+!322 lt!96917 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248))) lt!96903) (apply!188 lt!96917 lt!96903))))

(declare-fun lt!96906 () Unit!5878)

(assert (=> b!194274 (= lt!96906 lt!96918)))

(declare-fun lt!96922 () ListLongMap!2477)

(assert (=> b!194274 (= lt!96922 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun lt!96913 () (_ BitVec 64))

(assert (=> b!194274 (= lt!96913 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96904 () (_ BitVec 64))

(assert (=> b!194274 (= lt!96904 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194274 (= lt!96910 (addApplyDifferent!164 lt!96922 lt!96913 (minValue!3801 thiss!1248) lt!96904))))

(assert (=> b!194274 (= (apply!188 (+!322 lt!96922 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248))) lt!96904) (apply!188 lt!96922 lt!96904))))

(declare-fun e!127815 () Bool)

(declare-fun b!194275 () Bool)

(assert (=> b!194275 (= e!127815 (= (apply!188 lt!96914 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2237 (select (arr!3876 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4200 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))))))))

(assert (=> b!194275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun d!56693 () Bool)

(declare-fun e!127816 () Bool)

(assert (=> d!56693 e!127816))

(declare-fun res!91830 () Bool)

(assert (=> d!56693 (=> (not res!91830) (not e!127816))))

(assert (=> d!56693 (= res!91830 (or (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))))

(declare-fun lt!96911 () ListLongMap!2477)

(assert (=> d!56693 (= lt!96914 lt!96911)))

(declare-fun lt!96909 () Unit!5878)

(assert (=> d!56693 (= lt!96909 e!127823)))

(declare-fun c!35048 () Bool)

(assert (=> d!56693 (= c!35048 e!127814)))

(declare-fun res!91825 () Bool)

(assert (=> d!56693 (=> (not res!91825) (not e!127814))))

(assert (=> d!56693 (= res!91825 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun e!127822 () ListLongMap!2477)

(assert (=> d!56693 (= lt!96911 e!127822)))

(assert (=> d!56693 (= c!35045 (and (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56693 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56693 (= (getCurrentListMap!902 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) lt!96914)))

(declare-fun bm!19646 () Bool)

(assert (=> bm!19646 (= call!19653 (contains!1379 lt!96914 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194276 () Bool)

(declare-fun e!127812 () ListLongMap!2477)

(assert (=> b!194276 (= e!127812 call!19648)))

(declare-fun bm!19647 () Bool)

(assert (=> bm!19647 (= call!19648 call!19651)))

(declare-fun bm!19648 () Bool)

(assert (=> bm!19648 (= call!19647 call!19649)))

(declare-fun bm!19649 () Bool)

(assert (=> bm!19649 (= call!19650 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(declare-fun b!194277 () Bool)

(assert (=> b!194277 (= e!127822 (+!322 call!19651 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(declare-fun b!194278 () Bool)

(declare-fun e!127821 () Bool)

(assert (=> b!194278 (= e!127821 e!127815)))

(declare-fun res!91822 () Bool)

(assert (=> b!194278 (=> (not res!91822) (not e!127815))))

(assert (=> b!194278 (= res!91822 (contains!1379 lt!96914 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194279 () Bool)

(assert (=> b!194279 (= e!127822 e!127812)))

(assert (=> b!194279 (= c!35046 (and (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194280 () Bool)

(declare-fun res!91828 () Bool)

(assert (=> b!194280 (=> (not res!91828) (not e!127816))))

(assert (=> b!194280 (= res!91828 e!127821)))

(declare-fun res!91823 () Bool)

(assert (=> b!194280 (=> res!91823 e!127821)))

(declare-fun e!127817 () Bool)

(assert (=> b!194280 (= res!91823 (not e!127817))))

(declare-fun res!91824 () Bool)

(assert (=> b!194280 (=> (not res!91824) (not e!127817))))

(assert (=> b!194280 (= res!91824 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194281 () Bool)

(declare-fun e!127819 () Bool)

(assert (=> b!194281 (= e!127824 e!127819)))

(declare-fun res!91827 () Bool)

(assert (=> b!194281 (= res!91827 call!19653)))

(assert (=> b!194281 (=> (not res!91827) (not e!127819))))

(declare-fun b!194282 () Bool)

(assert (=> b!194282 (= e!127819 (= (apply!188 lt!96914 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3801 thiss!1248)))))

(declare-fun bm!19650 () Bool)

(assert (=> bm!19650 (= call!19649 call!19650)))

(declare-fun b!194283 () Bool)

(declare-fun res!91826 () Bool)

(assert (=> b!194283 (=> (not res!91826) (not e!127816))))

(declare-fun e!127820 () Bool)

(assert (=> b!194283 (= res!91826 e!127820)))

(declare-fun c!35047 () Bool)

(assert (=> b!194283 (= c!35047 (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!194284 () Bool)

(declare-fun c!35043 () Bool)

(assert (=> b!194284 (= c!35043 (and (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!194284 (= e!127812 e!127813)))

(declare-fun b!194285 () Bool)

(assert (=> b!194285 (= e!127817 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194286 () Bool)

(assert (=> b!194286 (= e!127820 e!127818)))

(declare-fun res!91829 () Bool)

(assert (=> b!194286 (= res!91829 call!19652)))

(assert (=> b!194286 (=> (not res!91829) (not e!127818))))

(declare-fun b!194287 () Bool)

(assert (=> b!194287 (= e!127816 e!127824)))

(declare-fun c!35044 () Bool)

(assert (=> b!194287 (= c!35044 (not (= (bvand (extraKeys!3697 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194288 () Bool)

(assert (=> b!194288 (= e!127820 (not call!19652))))

(declare-fun b!194289 () Bool)

(declare-fun Unit!5890 () Unit!5878)

(assert (=> b!194289 (= e!127823 Unit!5890)))

(assert (= (and d!56693 c!35045) b!194277))

(assert (= (and d!56693 (not c!35045)) b!194279))

(assert (= (and b!194279 c!35046) b!194276))

(assert (= (and b!194279 (not c!35046)) b!194284))

(assert (= (and b!194284 c!35043) b!194273))

(assert (= (and b!194284 (not c!35043)) b!194272))

(assert (= (or b!194273 b!194272) bm!19648))

(assert (= (or b!194276 bm!19648) bm!19650))

(assert (= (or b!194276 b!194273) bm!19647))

(assert (= (or b!194277 bm!19650) bm!19649))

(assert (= (or b!194277 bm!19647) bm!19645))

(assert (= (and d!56693 res!91825) b!194269))

(assert (= (and d!56693 c!35048) b!194274))

(assert (= (and d!56693 (not c!35048)) b!194289))

(assert (= (and d!56693 res!91830) b!194280))

(assert (= (and b!194280 res!91824) b!194285))

(assert (= (and b!194280 (not res!91823)) b!194278))

(assert (= (and b!194278 res!91822) b!194275))

(assert (= (and b!194280 res!91828) b!194283))

(assert (= (and b!194283 c!35047) b!194286))

(assert (= (and b!194283 (not c!35047)) b!194288))

(assert (= (and b!194286 res!91829) b!194270))

(assert (= (or b!194286 b!194288) bm!19644))

(assert (= (and b!194283 res!91826) b!194287))

(assert (= (and b!194287 c!35044) b!194281))

(assert (= (and b!194287 (not c!35044)) b!194271))

(assert (= (and b!194281 res!91827) b!194282))

(assert (= (or b!194281 b!194271) bm!19646))

(declare-fun b_lambda!7487 () Bool)

(assert (=> (not b_lambda!7487) (not b!194275)))

(assert (=> b!194275 t!7378))

(declare-fun b_and!11441 () Bool)

(assert (= b_and!11439 (and (=> t!7378 result!4939) b_and!11441)))

(declare-fun m!221075 () Bool)

(assert (=> bm!19649 m!221075))

(declare-fun m!221077 () Bool)

(assert (=> b!194270 m!221077))

(declare-fun m!221079 () Bool)

(assert (=> bm!19646 m!221079))

(assert (=> d!56693 m!220855))

(declare-fun m!221081 () Bool)

(assert (=> b!194277 m!221081))

(declare-fun m!221083 () Bool)

(assert (=> bm!19645 m!221083))

(assert (=> b!194269 m!220877))

(assert (=> b!194269 m!220877))

(assert (=> b!194269 m!220879))

(assert (=> b!194285 m!220877))

(assert (=> b!194285 m!220877))

(assert (=> b!194285 m!220879))

(assert (=> b!194275 m!220877))

(assert (=> b!194275 m!220881))

(assert (=> b!194275 m!220877))

(declare-fun m!221085 () Bool)

(assert (=> b!194275 m!221085))

(declare-fun m!221087 () Bool)

(assert (=> b!194275 m!221087))

(assert (=> b!194275 m!221087))

(assert (=> b!194275 m!220881))

(declare-fun m!221089 () Bool)

(assert (=> b!194275 m!221089))

(declare-fun m!221091 () Bool)

(assert (=> b!194282 m!221091))

(declare-fun m!221093 () Bool)

(assert (=> b!194274 m!221093))

(declare-fun m!221095 () Bool)

(assert (=> b!194274 m!221095))

(declare-fun m!221097 () Bool)

(assert (=> b!194274 m!221097))

(declare-fun m!221099 () Bool)

(assert (=> b!194274 m!221099))

(declare-fun m!221101 () Bool)

(assert (=> b!194274 m!221101))

(declare-fun m!221103 () Bool)

(assert (=> b!194274 m!221103))

(declare-fun m!221105 () Bool)

(assert (=> b!194274 m!221105))

(declare-fun m!221107 () Bool)

(assert (=> b!194274 m!221107))

(declare-fun m!221109 () Bool)

(assert (=> b!194274 m!221109))

(assert (=> b!194274 m!220877))

(declare-fun m!221111 () Bool)

(assert (=> b!194274 m!221111))

(assert (=> b!194274 m!221095))

(assert (=> b!194274 m!221075))

(assert (=> b!194274 m!221107))

(declare-fun m!221113 () Bool)

(assert (=> b!194274 m!221113))

(declare-fun m!221115 () Bool)

(assert (=> b!194274 m!221115))

(assert (=> b!194274 m!221099))

(declare-fun m!221117 () Bool)

(assert (=> b!194274 m!221117))

(declare-fun m!221119 () Bool)

(assert (=> b!194274 m!221119))

(assert (=> b!194274 m!221103))

(declare-fun m!221121 () Bool)

(assert (=> b!194274 m!221121))

(assert (=> b!194278 m!220877))

(assert (=> b!194278 m!220877))

(declare-fun m!221123 () Bool)

(assert (=> b!194278 m!221123))

(declare-fun m!221125 () Bool)

(assert (=> bm!19644 m!221125))

(assert (=> b!194180 d!56693))

(assert (=> b!194123 d!56677))

(declare-fun b!194292 () Bool)

(declare-fun res!91831 () Bool)

(declare-fun e!127825 () Bool)

(assert (=> b!194292 (=> (not res!91831) (not e!127825))))

(assert (=> b!194292 (= res!91831 (= (size!4203 lt!96671) (bvadd (_size!1405 lt!96671) (bvsdiv (bvadd (extraKeys!3697 lt!96671) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!194291 () Bool)

(declare-fun res!91833 () Bool)

(assert (=> b!194291 (=> (not res!91833) (not e!127825))))

(assert (=> b!194291 (= res!91833 (bvsge (size!4203 lt!96671) (_size!1405 lt!96671)))))

(declare-fun d!56695 () Bool)

(declare-fun res!91832 () Bool)

(assert (=> d!56695 (=> (not res!91832) (not e!127825))))

(assert (=> d!56695 (= res!91832 (validMask!0 (mask!9223 lt!96671)))))

(assert (=> d!56695 (= (simpleValid!204 lt!96671) e!127825)))

(declare-fun b!194290 () Bool)

(declare-fun res!91834 () Bool)

(assert (=> b!194290 (=> (not res!91834) (not e!127825))))

(assert (=> b!194290 (= res!91834 (and (= (size!4200 (_values!3943 lt!96671)) (bvadd (mask!9223 lt!96671) #b00000000000000000000000000000001)) (= (size!4199 (_keys!5954 lt!96671)) (size!4200 (_values!3943 lt!96671))) (bvsge (_size!1405 lt!96671) #b00000000000000000000000000000000) (bvsle (_size!1405 lt!96671) (bvadd (mask!9223 lt!96671) #b00000000000000000000000000000001))))))

(declare-fun b!194293 () Bool)

(assert (=> b!194293 (= e!127825 (and (bvsge (extraKeys!3697 lt!96671) #b00000000000000000000000000000000) (bvsle (extraKeys!3697 lt!96671) #b00000000000000000000000000000011) (bvsge (_vacant!1405 lt!96671) #b00000000000000000000000000000000)))))

(assert (= (and d!56695 res!91832) b!194290))

(assert (= (and b!194290 res!91834) b!194291))

(assert (= (and b!194291 res!91833) b!194292))

(assert (= (and b!194292 res!91831) b!194293))

(declare-fun m!221127 () Bool)

(assert (=> b!194292 m!221127))

(assert (=> b!194291 m!221127))

(declare-fun m!221129 () Bool)

(assert (=> d!56695 m!221129))

(assert (=> d!56651 d!56695))

(declare-fun d!56697 () Bool)

(assert (=> d!56697 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96675) key!828))))

(declare-fun lt!96925 () Unit!5878)

(declare-fun choose!1067 (List!2449 (_ BitVec 64)) Unit!5878)

(assert (=> d!56697 (= lt!96925 (choose!1067 (toList!1254 lt!96675) key!828))))

(declare-fun e!127828 () Bool)

(assert (=> d!56697 e!127828))

(declare-fun res!91837 () Bool)

(assert (=> d!56697 (=> (not res!91837) (not e!127828))))

(declare-fun isStrictlySorted!357 (List!2449) Bool)

(assert (=> d!56697 (= res!91837 (isStrictlySorted!357 (toList!1254 lt!96675)))))

(assert (=> d!56697 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96675) key!828) lt!96925)))

(declare-fun b!194296 () Bool)

(assert (=> b!194296 (= e!127828 (containsKey!249 (toList!1254 lt!96675) key!828))))

(assert (= (and d!56697 res!91837) b!194296))

(assert (=> d!56697 m!220833))

(assert (=> d!56697 m!220833))

(assert (=> d!56697 m!220835))

(declare-fun m!221131 () Bool)

(assert (=> d!56697 m!221131))

(declare-fun m!221133 () Bool)

(assert (=> d!56697 m!221133))

(assert (=> b!194296 m!220829))

(assert (=> b!194042 d!56697))

(declare-fun d!56699 () Bool)

(declare-fun isEmpty!487 (Option!251) Bool)

(assert (=> d!56699 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96675) key!828)) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96675) key!828))))))

(declare-fun bs!7728 () Bool)

(assert (= bs!7728 d!56699))

(assert (=> bs!7728 m!220833))

(declare-fun m!221135 () Bool)

(assert (=> bs!7728 m!221135))

(assert (=> b!194042 d!56699))

(declare-fun b!194306 () Bool)

(declare-fun e!127833 () Option!251)

(declare-fun e!127834 () Option!251)

(assert (=> b!194306 (= e!127833 e!127834)))

(declare-fun c!35054 () Bool)

(assert (=> b!194306 (= c!35054 (and ((_ is Cons!2445) (toList!1254 lt!96675)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96675))) key!828))))))

(declare-fun b!194305 () Bool)

(assert (=> b!194305 (= e!127833 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96675)))))))

(declare-fun b!194307 () Bool)

(assert (=> b!194307 (= e!127834 (getValueByKey!245 (t!7375 (toList!1254 lt!96675)) key!828))))

(declare-fun d!56701 () Bool)

(declare-fun c!35053 () Bool)

(assert (=> d!56701 (= c!35053 (and ((_ is Cons!2445) (toList!1254 lt!96675)) (= (_1!1791 (h!3086 (toList!1254 lt!96675))) key!828)))))

(assert (=> d!56701 (= (getValueByKey!245 (toList!1254 lt!96675) key!828) e!127833)))

(declare-fun b!194308 () Bool)

(assert (=> b!194308 (= e!127834 None!249)))

(assert (= (and d!56701 c!35053) b!194305))

(assert (= (and d!56701 (not c!35053)) b!194306))

(assert (= (and b!194306 c!35054) b!194307))

(assert (= (and b!194306 (not c!35054)) b!194308))

(declare-fun m!221137 () Bool)

(assert (=> b!194307 m!221137))

(assert (=> b!194042 d!56701))

(declare-fun d!56703 () Bool)

(declare-fun e!127835 () Bool)

(assert (=> d!56703 e!127835))

(declare-fun res!91838 () Bool)

(assert (=> d!56703 (=> (not res!91838) (not e!127835))))

(declare-fun lt!96926 () ListLongMap!2477)

(assert (=> d!56703 (= res!91838 (contains!1379 lt!96926 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun lt!96929 () List!2449)

(assert (=> d!56703 (= lt!96926 (ListLongMap!2478 lt!96929))))

(declare-fun lt!96927 () Unit!5878)

(declare-fun lt!96928 () Unit!5878)

(assert (=> d!56703 (= lt!96927 lt!96928)))

(assert (=> d!56703 (= (getValueByKey!245 lt!96929 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) (Some!250 (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!56703 (= lt!96928 (lemmaContainsTupThenGetReturnValue!132 lt!96929 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!56703 (= lt!96929 (insertStrictlySorted!135 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637))) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!56703 (= (+!322 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637)) (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!96926)))

(declare-fun b!194309 () Bool)

(declare-fun res!91839 () Bool)

(assert (=> b!194309 (=> (not res!91839) (not e!127835))))

(assert (=> b!194309 (= res!91839 (= (getValueByKey!245 (toList!1254 lt!96926) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) (Some!250 (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun b!194310 () Bool)

(assert (=> b!194310 (= e!127835 (contains!1381 (toList!1254 lt!96926) (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (= (and d!56703 res!91838) b!194309))

(assert (= (and b!194309 res!91839) b!194310))

(declare-fun m!221139 () Bool)

(assert (=> d!56703 m!221139))

(declare-fun m!221141 () Bool)

(assert (=> d!56703 m!221141))

(declare-fun m!221143 () Bool)

(assert (=> d!56703 m!221143))

(declare-fun m!221145 () Bool)

(assert (=> d!56703 m!221145))

(declare-fun m!221147 () Bool)

(assert (=> b!194309 m!221147))

(declare-fun m!221149 () Bool)

(assert (=> b!194310 m!221149))

(assert (=> bm!19635 d!56703))

(declare-fun d!56705 () Bool)

(declare-fun e!127837 () Bool)

(assert (=> d!56705 e!127837))

(declare-fun res!91840 () Bool)

(assert (=> d!56705 (=> res!91840 e!127837)))

(declare-fun lt!96930 () Bool)

(assert (=> d!56705 (= res!91840 (not lt!96930))))

(declare-fun lt!96931 () Bool)

(assert (=> d!56705 (= lt!96930 lt!96931)))

(declare-fun lt!96932 () Unit!5878)

(declare-fun e!127836 () Unit!5878)

(assert (=> d!56705 (= lt!96932 e!127836)))

(declare-fun c!35055 () Bool)

(assert (=> d!56705 (= c!35055 lt!96931)))

(assert (=> d!56705 (= lt!96931 (containsKey!249 (toList!1254 lt!96729) (_1!1791 lt!96678)))))

(assert (=> d!56705 (= (contains!1379 lt!96729 (_1!1791 lt!96678)) lt!96930)))

(declare-fun b!194311 () Bool)

(declare-fun lt!96933 () Unit!5878)

(assert (=> b!194311 (= e!127836 lt!96933)))

(assert (=> b!194311 (= lt!96933 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96729) (_1!1791 lt!96678)))))

(assert (=> b!194311 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96729) (_1!1791 lt!96678)))))

(declare-fun b!194312 () Bool)

(declare-fun Unit!5891 () Unit!5878)

(assert (=> b!194312 (= e!127836 Unit!5891)))

(declare-fun b!194313 () Bool)

(assert (=> b!194313 (= e!127837 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96729) (_1!1791 lt!96678))))))

(assert (= (and d!56705 c!35055) b!194311))

(assert (= (and d!56705 (not c!35055)) b!194312))

(assert (= (and d!56705 (not res!91840)) b!194313))

(declare-fun m!221151 () Bool)

(assert (=> d!56705 m!221151))

(declare-fun m!221153 () Bool)

(assert (=> b!194311 m!221153))

(assert (=> b!194311 m!220825))

(assert (=> b!194311 m!220825))

(declare-fun m!221155 () Bool)

(assert (=> b!194311 m!221155))

(assert (=> b!194313 m!220825))

(assert (=> b!194313 m!220825))

(assert (=> b!194313 m!221155))

(assert (=> d!56639 d!56705))

(declare-fun b!194315 () Bool)

(declare-fun e!127838 () Option!251)

(declare-fun e!127839 () Option!251)

(assert (=> b!194315 (= e!127838 e!127839)))

(declare-fun c!35057 () Bool)

(assert (=> b!194315 (= c!35057 (and ((_ is Cons!2445) lt!96732) (not (= (_1!1791 (h!3086 lt!96732)) (_1!1791 lt!96678)))))))

(declare-fun b!194314 () Bool)

(assert (=> b!194314 (= e!127838 (Some!250 (_2!1791 (h!3086 lt!96732))))))

(declare-fun b!194316 () Bool)

(assert (=> b!194316 (= e!127839 (getValueByKey!245 (t!7375 lt!96732) (_1!1791 lt!96678)))))

(declare-fun d!56707 () Bool)

(declare-fun c!35056 () Bool)

(assert (=> d!56707 (= c!35056 (and ((_ is Cons!2445) lt!96732) (= (_1!1791 (h!3086 lt!96732)) (_1!1791 lt!96678))))))

(assert (=> d!56707 (= (getValueByKey!245 lt!96732 (_1!1791 lt!96678)) e!127838)))

(declare-fun b!194317 () Bool)

(assert (=> b!194317 (= e!127839 None!249)))

(assert (= (and d!56707 c!35056) b!194314))

(assert (= (and d!56707 (not c!35056)) b!194315))

(assert (= (and b!194315 c!35057) b!194316))

(assert (= (and b!194315 (not c!35057)) b!194317))

(declare-fun m!221157 () Bool)

(assert (=> b!194316 m!221157))

(assert (=> d!56639 d!56707))

(declare-fun d!56709 () Bool)

(assert (=> d!56709 (= (getValueByKey!245 lt!96732 (_1!1791 lt!96678)) (Some!250 (_2!1791 lt!96678)))))

(declare-fun lt!96936 () Unit!5878)

(declare-fun choose!1068 (List!2449 (_ BitVec 64) V!5635) Unit!5878)

(assert (=> d!56709 (= lt!96936 (choose!1068 lt!96732 (_1!1791 lt!96678) (_2!1791 lt!96678)))))

(declare-fun e!127842 () Bool)

(assert (=> d!56709 e!127842))

(declare-fun res!91845 () Bool)

(assert (=> d!56709 (=> (not res!91845) (not e!127842))))

(assert (=> d!56709 (= res!91845 (isStrictlySorted!357 lt!96732))))

(assert (=> d!56709 (= (lemmaContainsTupThenGetReturnValue!132 lt!96732 (_1!1791 lt!96678) (_2!1791 lt!96678)) lt!96936)))

(declare-fun b!194322 () Bool)

(declare-fun res!91846 () Bool)

(assert (=> b!194322 (=> (not res!91846) (not e!127842))))

(assert (=> b!194322 (= res!91846 (containsKey!249 lt!96732 (_1!1791 lt!96678)))))

(declare-fun b!194323 () Bool)

(assert (=> b!194323 (= e!127842 (contains!1381 lt!96732 (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(assert (= (and d!56709 res!91845) b!194322))

(assert (= (and b!194322 res!91846) b!194323))

(assert (=> d!56709 m!220819))

(declare-fun m!221159 () Bool)

(assert (=> d!56709 m!221159))

(declare-fun m!221161 () Bool)

(assert (=> d!56709 m!221161))

(declare-fun m!221163 () Bool)

(assert (=> b!194322 m!221163))

(declare-fun m!221165 () Bool)

(assert (=> b!194323 m!221165))

(assert (=> d!56639 d!56709))

(declare-fun c!35067 () Bool)

(declare-fun e!127853 () List!2449)

(declare-fun call!19661 () List!2449)

(declare-fun bm!19657 () Bool)

(declare-fun $colon$colon!103 (List!2449 tuple2!3560) List!2449)

(assert (=> bm!19657 (= call!19661 ($colon$colon!103 e!127853 (ite c!35067 (h!3086 (toList!1254 (map!2029 thiss!1248))) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678)))))))

(declare-fun c!35066 () Bool)

(assert (=> bm!19657 (= c!35066 c!35067)))

(declare-fun b!194344 () Bool)

(declare-fun e!127857 () List!2449)

(declare-fun call!19660 () List!2449)

(assert (=> b!194344 (= e!127857 call!19660)))

(declare-fun b!194345 () Bool)

(declare-fun c!35068 () Bool)

(assert (=> b!194345 (= c!35068 (and ((_ is Cons!2445) (toList!1254 (map!2029 thiss!1248))) (bvsgt (_1!1791 (h!3086 (toList!1254 (map!2029 thiss!1248)))) (_1!1791 lt!96678))))))

(declare-fun e!127855 () List!2449)

(assert (=> b!194345 (= e!127857 e!127855)))

(declare-fun b!194346 () Bool)

(declare-fun e!127856 () Bool)

(declare-fun lt!96939 () List!2449)

(assert (=> b!194346 (= e!127856 (contains!1381 lt!96939 (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun bm!19658 () Bool)

(declare-fun call!19662 () List!2449)

(assert (=> bm!19658 (= call!19662 call!19660)))

(declare-fun b!194347 () Bool)

(declare-fun e!127854 () List!2449)

(assert (=> b!194347 (= e!127854 e!127857)))

(declare-fun c!35069 () Bool)

(assert (=> b!194347 (= c!35069 (and ((_ is Cons!2445) (toList!1254 (map!2029 thiss!1248))) (= (_1!1791 (h!3086 (toList!1254 (map!2029 thiss!1248)))) (_1!1791 lt!96678))))))

(declare-fun d!56711 () Bool)

(assert (=> d!56711 e!127856))

(declare-fun res!91851 () Bool)

(assert (=> d!56711 (=> (not res!91851) (not e!127856))))

(assert (=> d!56711 (= res!91851 (isStrictlySorted!357 lt!96939))))

(assert (=> d!56711 (= lt!96939 e!127854)))

(assert (=> d!56711 (= c!35067 (and ((_ is Cons!2445) (toList!1254 (map!2029 thiss!1248))) (bvslt (_1!1791 (h!3086 (toList!1254 (map!2029 thiss!1248)))) (_1!1791 lt!96678))))))

(assert (=> d!56711 (isStrictlySorted!357 (toList!1254 (map!2029 thiss!1248)))))

(assert (=> d!56711 (= (insertStrictlySorted!135 (toList!1254 (map!2029 thiss!1248)) (_1!1791 lt!96678) (_2!1791 lt!96678)) lt!96939)))

(declare-fun bm!19659 () Bool)

(assert (=> bm!19659 (= call!19660 call!19661)))

(declare-fun b!194348 () Bool)

(assert (=> b!194348 (= e!127855 call!19662)))

(declare-fun b!194349 () Bool)

(assert (=> b!194349 (= e!127853 (insertStrictlySorted!135 (t!7375 (toList!1254 (map!2029 thiss!1248))) (_1!1791 lt!96678) (_2!1791 lt!96678)))))

(declare-fun b!194350 () Bool)

(assert (=> b!194350 (= e!127855 call!19662)))

(declare-fun b!194351 () Bool)

(declare-fun res!91852 () Bool)

(assert (=> b!194351 (=> (not res!91852) (not e!127856))))

(assert (=> b!194351 (= res!91852 (containsKey!249 lt!96939 (_1!1791 lt!96678)))))

(declare-fun b!194352 () Bool)

(assert (=> b!194352 (= e!127854 call!19661)))

(declare-fun b!194353 () Bool)

(assert (=> b!194353 (= e!127853 (ite c!35069 (t!7375 (toList!1254 (map!2029 thiss!1248))) (ite c!35068 (Cons!2445 (h!3086 (toList!1254 (map!2029 thiss!1248))) (t!7375 (toList!1254 (map!2029 thiss!1248)))) Nil!2446)))))

(assert (= (and d!56711 c!35067) b!194352))

(assert (= (and d!56711 (not c!35067)) b!194347))

(assert (= (and b!194347 c!35069) b!194344))

(assert (= (and b!194347 (not c!35069)) b!194345))

(assert (= (and b!194345 c!35068) b!194350))

(assert (= (and b!194345 (not c!35068)) b!194348))

(assert (= (or b!194350 b!194348) bm!19658))

(assert (= (or b!194344 bm!19658) bm!19659))

(assert (= (or b!194352 bm!19659) bm!19657))

(assert (= (and bm!19657 c!35066) b!194349))

(assert (= (and bm!19657 (not c!35066)) b!194353))

(assert (= (and d!56711 res!91851) b!194351))

(assert (= (and b!194351 res!91852) b!194346))

(declare-fun m!221167 () Bool)

(assert (=> bm!19657 m!221167))

(declare-fun m!221169 () Bool)

(assert (=> b!194351 m!221169))

(declare-fun m!221171 () Bool)

(assert (=> b!194346 m!221171))

(declare-fun m!221173 () Bool)

(assert (=> b!194349 m!221173))

(declare-fun m!221175 () Bool)

(assert (=> d!56711 m!221175))

(declare-fun m!221177 () Bool)

(assert (=> d!56711 m!221177))

(assert (=> d!56639 d!56711))

(declare-fun d!56713 () Bool)

(declare-fun res!91857 () Bool)

(declare-fun e!127862 () Bool)

(assert (=> d!56713 (=> res!91857 e!127862)))

(assert (=> d!56713 (= res!91857 (and ((_ is Cons!2445) (toList!1254 lt!96676)) (= (_1!1791 (h!3086 (toList!1254 lt!96676))) key!828)))))

(assert (=> d!56713 (= (containsKey!249 (toList!1254 lt!96676) key!828) e!127862)))

(declare-fun b!194358 () Bool)

(declare-fun e!127863 () Bool)

(assert (=> b!194358 (= e!127862 e!127863)))

(declare-fun res!91858 () Bool)

(assert (=> b!194358 (=> (not res!91858) (not e!127863))))

(assert (=> b!194358 (= res!91858 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96676))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96676))) key!828)) ((_ is Cons!2445) (toList!1254 lt!96676)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96676))) key!828)))))

(declare-fun b!194359 () Bool)

(assert (=> b!194359 (= e!127863 (containsKey!249 (t!7375 (toList!1254 lt!96676)) key!828))))

(assert (= (and d!56713 (not res!91857)) b!194358))

(assert (= (and b!194358 res!91858) b!194359))

(declare-fun m!221179 () Bool)

(assert (=> b!194359 m!221179))

(assert (=> d!56661 d!56713))

(assert (=> d!56663 d!56689))

(declare-fun d!56715 () Bool)

(declare-fun lt!96942 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!155 (List!2449) (InoxSet tuple2!3560))

(assert (=> d!56715 (= lt!96942 (select (content!155 (toList!1254 lt!96817)) lt!96678))))

(declare-fun e!127869 () Bool)

(assert (=> d!56715 (= lt!96942 e!127869)))

(declare-fun res!91863 () Bool)

(assert (=> d!56715 (=> (not res!91863) (not e!127869))))

(assert (=> d!56715 (= res!91863 ((_ is Cons!2445) (toList!1254 lt!96817)))))

(assert (=> d!56715 (= (contains!1381 (toList!1254 lt!96817) lt!96678) lt!96942)))

(declare-fun b!194364 () Bool)

(declare-fun e!127868 () Bool)

(assert (=> b!194364 (= e!127869 e!127868)))

(declare-fun res!91864 () Bool)

(assert (=> b!194364 (=> res!91864 e!127868)))

(assert (=> b!194364 (= res!91864 (= (h!3086 (toList!1254 lt!96817)) lt!96678))))

(declare-fun b!194365 () Bool)

(assert (=> b!194365 (= e!127868 (contains!1381 (t!7375 (toList!1254 lt!96817)) lt!96678))))

(assert (= (and d!56715 res!91863) b!194364))

(assert (= (and b!194364 (not res!91864)) b!194365))

(declare-fun m!221181 () Bool)

(assert (=> d!56715 m!221181))

(declare-fun m!221183 () Bool)

(assert (=> d!56715 m!221183))

(declare-fun m!221185 () Bool)

(assert (=> b!194365 m!221185))

(assert (=> b!194147 d!56715))

(assert (=> b!194044 d!56699))

(assert (=> b!194044 d!56701))

(declare-fun b!194390 () Bool)

(declare-fun e!127887 () ListLongMap!2477)

(declare-fun e!127888 () ListLongMap!2477)

(assert (=> b!194390 (= e!127887 e!127888)))

(declare-fun c!35081 () Bool)

(assert (=> b!194390 (= c!35081 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194392 () Bool)

(declare-fun e!127890 () Bool)

(declare-fun lt!96963 () ListLongMap!2477)

(declare-fun isEmpty!488 (ListLongMap!2477) Bool)

(assert (=> b!194392 (= e!127890 (isEmpty!488 lt!96963))))

(declare-fun b!194393 () Bool)

(declare-fun call!19665 () ListLongMap!2477)

(assert (=> b!194393 (= e!127888 call!19665)))

(declare-fun b!194394 () Bool)

(declare-fun e!127889 () Bool)

(declare-fun e!127885 () Bool)

(assert (=> b!194394 (= e!127889 e!127885)))

(assert (=> b!194394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun res!91873 () Bool)

(assert (=> b!194394 (= res!91873 (contains!1379 lt!96963 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194394 (=> (not res!91873) (not e!127885))))

(declare-fun b!194395 () Bool)

(declare-fun e!127886 () Bool)

(assert (=> b!194395 (= e!127886 e!127889)))

(declare-fun c!35080 () Bool)

(declare-fun e!127884 () Bool)

(assert (=> b!194395 (= c!35080 e!127884)))

(declare-fun res!91874 () Bool)

(assert (=> b!194395 (=> (not res!91874) (not e!127884))))

(assert (=> b!194395 (= res!91874 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194396 () Bool)

(assert (=> b!194396 (= e!127884 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194396 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!194397 () Bool)

(assert (=> b!194397 (= e!127887 (ListLongMap!2478 Nil!2446))))

(declare-fun b!194398 () Bool)

(assert (=> b!194398 (= e!127890 (= lt!96963 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248))))))

(declare-fun bm!19662 () Bool)

(assert (=> bm!19662 (= call!19665 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248)))))

(declare-fun b!194399 () Bool)

(assert (=> b!194399 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> b!194399 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4200 (_values!3943 thiss!1248))))))

(assert (=> b!194399 (= e!127885 (= (apply!188 lt!96963 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194391 () Bool)

(declare-fun lt!96960 () Unit!5878)

(declare-fun lt!96961 () Unit!5878)

(assert (=> b!194391 (= lt!96960 lt!96961)))

(declare-fun lt!96959 () (_ BitVec 64))

(declare-fun lt!96962 () ListLongMap!2477)

(declare-fun lt!96957 () (_ BitVec 64))

(declare-fun lt!96958 () V!5635)

(assert (=> b!194391 (not (contains!1379 (+!322 lt!96962 (tuple2!3561 lt!96959 lt!96958)) lt!96957))))

(declare-fun addStillNotContains!97 (ListLongMap!2477 (_ BitVec 64) V!5635 (_ BitVec 64)) Unit!5878)

(assert (=> b!194391 (= lt!96961 (addStillNotContains!97 lt!96962 lt!96959 lt!96958 lt!96957))))

(assert (=> b!194391 (= lt!96957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194391 (= lt!96958 (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194391 (= lt!96959 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194391 (= lt!96962 call!19665)))

(assert (=> b!194391 (= e!127888 (+!322 call!19665 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!56717 () Bool)

(assert (=> d!56717 e!127886))

(declare-fun res!91876 () Bool)

(assert (=> d!56717 (=> (not res!91876) (not e!127886))))

(assert (=> d!56717 (= res!91876 (not (contains!1379 lt!96963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56717 (= lt!96963 e!127887)))

(declare-fun c!35078 () Bool)

(assert (=> d!56717 (= c!35078 (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!56717 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56717 (= (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) lt!96963)))

(declare-fun b!194400 () Bool)

(assert (=> b!194400 (= e!127889 e!127890)))

(declare-fun c!35079 () Bool)

(assert (=> b!194400 (= c!35079 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194401 () Bool)

(declare-fun res!91875 () Bool)

(assert (=> b!194401 (=> (not res!91875) (not e!127886))))

(assert (=> b!194401 (= res!91875 (not (contains!1379 lt!96963 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56717 c!35078) b!194397))

(assert (= (and d!56717 (not c!35078)) b!194390))

(assert (= (and b!194390 c!35081) b!194391))

(assert (= (and b!194390 (not c!35081)) b!194393))

(assert (= (or b!194391 b!194393) bm!19662))

(assert (= (and d!56717 res!91876) b!194401))

(assert (= (and b!194401 res!91875) b!194395))

(assert (= (and b!194395 res!91874) b!194396))

(assert (= (and b!194395 c!35080) b!194394))

(assert (= (and b!194395 (not c!35080)) b!194400))

(assert (= (and b!194394 res!91873) b!194399))

(assert (= (and b!194400 c!35079) b!194398))

(assert (= (and b!194400 (not c!35079)) b!194392))

(declare-fun b_lambda!7489 () Bool)

(assert (=> (not b_lambda!7489) (not b!194399)))

(assert (=> b!194399 t!7378))

(declare-fun b_and!11443 () Bool)

(assert (= b_and!11441 (and (=> t!7378 result!4939) b_and!11443)))

(declare-fun b_lambda!7491 () Bool)

(assert (=> (not b_lambda!7491) (not b!194391)))

(assert (=> b!194391 t!7378))

(declare-fun b_and!11445 () Bool)

(assert (= b_and!11443 (and (=> t!7378 result!4939) b_and!11445)))

(declare-fun m!221187 () Bool)

(assert (=> d!56717 m!221187))

(assert (=> d!56717 m!220855))

(declare-fun m!221189 () Bool)

(assert (=> bm!19662 m!221189))

(declare-fun m!221191 () Bool)

(assert (=> b!194391 m!221191))

(declare-fun m!221193 () Bool)

(assert (=> b!194391 m!221193))

(assert (=> b!194391 m!220969))

(assert (=> b!194391 m!220881))

(assert (=> b!194391 m!220971))

(assert (=> b!194391 m!221193))

(declare-fun m!221195 () Bool)

(assert (=> b!194391 m!221195))

(assert (=> b!194391 m!220877))

(declare-fun m!221197 () Bool)

(assert (=> b!194391 m!221197))

(assert (=> b!194391 m!220881))

(assert (=> b!194391 m!220969))

(assert (=> b!194396 m!220877))

(assert (=> b!194396 m!220877))

(assert (=> b!194396 m!220879))

(declare-fun m!221199 () Bool)

(assert (=> b!194392 m!221199))

(assert (=> b!194394 m!220877))

(assert (=> b!194394 m!220877))

(declare-fun m!221201 () Bool)

(assert (=> b!194394 m!221201))

(declare-fun m!221203 () Bool)

(assert (=> b!194401 m!221203))

(assert (=> b!194398 m!221189))

(assert (=> b!194399 m!220969))

(assert (=> b!194399 m!220881))

(assert (=> b!194399 m!220971))

(assert (=> b!194399 m!220877))

(declare-fun m!221205 () Bool)

(assert (=> b!194399 m!221205))

(assert (=> b!194399 m!220877))

(assert (=> b!194399 m!220881))

(assert (=> b!194399 m!220969))

(assert (=> b!194390 m!220877))

(assert (=> b!194390 m!220877))

(assert (=> b!194390 m!220879))

(assert (=> b!194162 d!56717))

(declare-fun d!56719 () Bool)

(declare-fun get!2238 (Option!251) V!5635)

(assert (=> d!56719 (= (apply!188 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) lt!96835) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) lt!96835)))))

(declare-fun bs!7729 () Bool)

(assert (= bs!7729 d!56719))

(declare-fun m!221207 () Bool)

(assert (=> bs!7729 m!221207))

(assert (=> bs!7729 m!221207))

(declare-fun m!221209 () Bool)

(assert (=> bs!7729 m!221209))

(assert (=> b!194162 d!56719))

(declare-fun d!56721 () Bool)

(assert (=> d!56721 (= (apply!188 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) lt!96835) (apply!188 lt!96853 lt!96835))))

(declare-fun lt!96966 () Unit!5878)

(declare-fun choose!1069 (ListLongMap!2477 (_ BitVec 64) V!5635 (_ BitVec 64)) Unit!5878)

(assert (=> d!56721 (= lt!96966 (choose!1069 lt!96853 lt!96844 (minValue!3801 thiss!1248) lt!96835))))

(declare-fun e!127893 () Bool)

(assert (=> d!56721 e!127893))

(declare-fun res!91879 () Bool)

(assert (=> d!56721 (=> (not res!91879) (not e!127893))))

(assert (=> d!56721 (= res!91879 (contains!1379 lt!96853 lt!96835))))

(assert (=> d!56721 (= (addApplyDifferent!164 lt!96853 lt!96844 (minValue!3801 thiss!1248) lt!96835) lt!96966)))

(declare-fun b!194405 () Bool)

(assert (=> b!194405 (= e!127893 (not (= lt!96835 lt!96844)))))

(assert (= (and d!56721 res!91879) b!194405))

(assert (=> d!56721 m!220985))

(assert (=> d!56721 m!221003))

(assert (=> d!56721 m!220985))

(declare-fun m!221211 () Bool)

(assert (=> d!56721 m!221211))

(declare-fun m!221213 () Bool)

(assert (=> d!56721 m!221213))

(assert (=> d!56721 m!220997))

(assert (=> b!194162 d!56721))

(declare-fun d!56723 () Bool)

(assert (=> d!56723 (= (apply!188 lt!96853 lt!96835) (get!2238 (getValueByKey!245 (toList!1254 lt!96853) lt!96835)))))

(declare-fun bs!7730 () Bool)

(assert (= bs!7730 d!56723))

(declare-fun m!221215 () Bool)

(assert (=> bs!7730 m!221215))

(assert (=> bs!7730 m!221215))

(declare-fun m!221217 () Bool)

(assert (=> bs!7730 m!221217))

(assert (=> b!194162 d!56723))

(declare-fun d!56725 () Bool)

(declare-fun e!127894 () Bool)

(assert (=> d!56725 e!127894))

(declare-fun res!91880 () Bool)

(assert (=> d!56725 (=> (not res!91880) (not e!127894))))

(declare-fun lt!96967 () ListLongMap!2477)

(assert (=> d!56725 (= res!91880 (contains!1379 lt!96967 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(declare-fun lt!96970 () List!2449)

(assert (=> d!56725 (= lt!96967 (ListLongMap!2478 lt!96970))))

(declare-fun lt!96968 () Unit!5878)

(declare-fun lt!96969 () Unit!5878)

(assert (=> d!56725 (= lt!96968 lt!96969)))

(assert (=> d!56725 (= (getValueByKey!245 lt!96970 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(assert (=> d!56725 (= lt!96969 (lemmaContainsTupThenGetReturnValue!132 lt!96970 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(assert (=> d!56725 (= lt!96970 (insertStrictlySorted!135 (toList!1254 lt!96853) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(assert (=> d!56725 (= (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) lt!96967)))

(declare-fun b!194406 () Bool)

(declare-fun res!91881 () Bool)

(assert (=> b!194406 (=> (not res!91881) (not e!127894))))

(assert (=> b!194406 (= res!91881 (= (getValueByKey!245 (toList!1254 lt!96967) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))))

(declare-fun b!194407 () Bool)

(assert (=> b!194407 (= e!127894 (contains!1381 (toList!1254 lt!96967) (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))

(assert (= (and d!56725 res!91880) b!194406))

(assert (= (and b!194406 res!91881) b!194407))

(declare-fun m!221219 () Bool)

(assert (=> d!56725 m!221219))

(declare-fun m!221221 () Bool)

(assert (=> d!56725 m!221221))

(declare-fun m!221223 () Bool)

(assert (=> d!56725 m!221223))

(declare-fun m!221225 () Bool)

(assert (=> d!56725 m!221225))

(declare-fun m!221227 () Bool)

(assert (=> b!194406 m!221227))

(declare-fun m!221229 () Bool)

(assert (=> b!194407 m!221229))

(assert (=> b!194162 d!56725))

(declare-fun d!56727 () Bool)

(assert (=> d!56727 (= (apply!188 lt!96848 lt!96834) (get!2238 (getValueByKey!245 (toList!1254 lt!96848) lt!96834)))))

(declare-fun bs!7731 () Bool)

(assert (= bs!7731 d!56727))

(declare-fun m!221231 () Bool)

(assert (=> bs!7731 m!221231))

(assert (=> bs!7731 m!221231))

(declare-fun m!221233 () Bool)

(assert (=> bs!7731 m!221233))

(assert (=> b!194162 d!56727))

(declare-fun d!56729 () Bool)

(assert (=> d!56729 (= (apply!188 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) lt!96850) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) lt!96850)))))

(declare-fun bs!7732 () Bool)

(assert (= bs!7732 d!56729))

(declare-fun m!221235 () Bool)

(assert (=> bs!7732 m!221235))

(assert (=> bs!7732 m!221235))

(declare-fun m!221237 () Bool)

(assert (=> bs!7732 m!221237))

(assert (=> b!194162 d!56729))

(declare-fun d!56731 () Bool)

(assert (=> d!56731 (= (apply!188 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) lt!96850) (apply!188 lt!96838 lt!96850))))

(declare-fun lt!96971 () Unit!5878)

(assert (=> d!56731 (= lt!96971 (choose!1069 lt!96838 lt!96846 (minValue!3801 thiss!1248) lt!96850))))

(declare-fun e!127895 () Bool)

(assert (=> d!56731 e!127895))

(declare-fun res!91882 () Bool)

(assert (=> d!56731 (=> (not res!91882) (not e!127895))))

(assert (=> d!56731 (= res!91882 (contains!1379 lt!96838 lt!96850))))

(assert (=> d!56731 (= (addApplyDifferent!164 lt!96838 lt!96846 (minValue!3801 thiss!1248) lt!96850) lt!96971)))

(declare-fun b!194408 () Bool)

(assert (=> b!194408 (= e!127895 (not (= lt!96850 lt!96846)))))

(assert (= (and d!56731 res!91882) b!194408))

(assert (=> d!56731 m!220981))

(assert (=> d!56731 m!220983))

(assert (=> d!56731 m!220981))

(declare-fun m!221239 () Bool)

(assert (=> d!56731 m!221239))

(declare-fun m!221241 () Bool)

(assert (=> d!56731 m!221241))

(assert (=> d!56731 m!220999))

(assert (=> b!194162 d!56731))

(declare-fun d!56733 () Bool)

(assert (=> d!56733 (= (apply!188 lt!96838 lt!96850) (get!2238 (getValueByKey!245 (toList!1254 lt!96838) lt!96850)))))

(declare-fun bs!7733 () Bool)

(assert (= bs!7733 d!56733))

(declare-fun m!221243 () Bool)

(assert (=> bs!7733 m!221243))

(assert (=> bs!7733 m!221243))

(declare-fun m!221245 () Bool)

(assert (=> bs!7733 m!221245))

(assert (=> b!194162 d!56733))

(declare-fun d!56735 () Bool)

(assert (=> d!56735 (= (apply!188 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) lt!96834) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) lt!96834)))))

(declare-fun bs!7734 () Bool)

(assert (= bs!7734 d!56735))

(declare-fun m!221247 () Bool)

(assert (=> bs!7734 m!221247))

(assert (=> bs!7734 m!221247))

(declare-fun m!221249 () Bool)

(assert (=> bs!7734 m!221249))

(assert (=> b!194162 d!56735))

(declare-fun d!56737 () Bool)

(declare-fun e!127896 () Bool)

(assert (=> d!56737 e!127896))

(declare-fun res!91883 () Bool)

(assert (=> d!56737 (=> (not res!91883) (not e!127896))))

(declare-fun lt!96972 () ListLongMap!2477)

(assert (=> d!56737 (= res!91883 (contains!1379 lt!96972 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(declare-fun lt!96975 () List!2449)

(assert (=> d!56737 (= lt!96972 (ListLongMap!2478 lt!96975))))

(declare-fun lt!96973 () Unit!5878)

(declare-fun lt!96974 () Unit!5878)

(assert (=> d!56737 (= lt!96973 lt!96974)))

(assert (=> d!56737 (= (getValueByKey!245 lt!96975 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(assert (=> d!56737 (= lt!96974 (lemmaContainsTupThenGetReturnValue!132 lt!96975 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(assert (=> d!56737 (= lt!96975 (insertStrictlySorted!135 (toList!1254 lt!96838) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(assert (=> d!56737 (= (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) lt!96972)))

(declare-fun b!194409 () Bool)

(declare-fun res!91884 () Bool)

(assert (=> b!194409 (=> (not res!91884) (not e!127896))))

(assert (=> b!194409 (= res!91884 (= (getValueByKey!245 (toList!1254 lt!96972) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))))

(declare-fun b!194410 () Bool)

(assert (=> b!194410 (= e!127896 (contains!1381 (toList!1254 lt!96972) (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))

(assert (= (and d!56737 res!91883) b!194409))

(assert (= (and b!194409 res!91884) b!194410))

(declare-fun m!221251 () Bool)

(assert (=> d!56737 m!221251))

(declare-fun m!221253 () Bool)

(assert (=> d!56737 m!221253))

(declare-fun m!221255 () Bool)

(assert (=> d!56737 m!221255))

(declare-fun m!221257 () Bool)

(assert (=> d!56737 m!221257))

(declare-fun m!221259 () Bool)

(assert (=> b!194409 m!221259))

(declare-fun m!221261 () Bool)

(assert (=> b!194410 m!221261))

(assert (=> b!194162 d!56737))

(declare-fun d!56739 () Bool)

(declare-fun e!127897 () Bool)

(assert (=> d!56739 e!127897))

(declare-fun res!91885 () Bool)

(assert (=> d!56739 (=> (not res!91885) (not e!127897))))

(declare-fun lt!96976 () ListLongMap!2477)

(assert (=> d!56739 (= res!91885 (contains!1379 lt!96976 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(declare-fun lt!96979 () List!2449)

(assert (=> d!56739 (= lt!96976 (ListLongMap!2478 lt!96979))))

(declare-fun lt!96977 () Unit!5878)

(declare-fun lt!96978 () Unit!5878)

(assert (=> d!56739 (= lt!96977 lt!96978)))

(assert (=> d!56739 (= (getValueByKey!245 lt!96979 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56739 (= lt!96978 (lemmaContainsTupThenGetReturnValue!132 lt!96979 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56739 (= lt!96979 (insertStrictlySorted!135 (toList!1254 lt!96848) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56739 (= (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) lt!96976)))

(declare-fun b!194411 () Bool)

(declare-fun res!91886 () Bool)

(assert (=> b!194411 (=> (not res!91886) (not e!127897))))

(assert (=> b!194411 (= res!91886 (= (getValueByKey!245 (toList!1254 lt!96976) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))))

(declare-fun b!194412 () Bool)

(assert (=> b!194412 (= e!127897 (contains!1381 (toList!1254 lt!96976) (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))

(assert (= (and d!56739 res!91885) b!194411))

(assert (= (and b!194411 res!91886) b!194412))

(declare-fun m!221263 () Bool)

(assert (=> d!56739 m!221263))

(declare-fun m!221265 () Bool)

(assert (=> d!56739 m!221265))

(declare-fun m!221267 () Bool)

(assert (=> d!56739 m!221267))

(declare-fun m!221269 () Bool)

(assert (=> d!56739 m!221269))

(declare-fun m!221271 () Bool)

(assert (=> b!194411 m!221271))

(declare-fun m!221273 () Bool)

(assert (=> b!194412 m!221273))

(assert (=> b!194162 d!56739))

(declare-fun d!56741 () Bool)

(declare-fun e!127898 () Bool)

(assert (=> d!56741 e!127898))

(declare-fun res!91887 () Bool)

(assert (=> d!56741 (=> (not res!91887) (not e!127898))))

(declare-fun lt!96980 () ListLongMap!2477)

(assert (=> d!56741 (= res!91887 (contains!1379 lt!96980 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(declare-fun lt!96983 () List!2449)

(assert (=> d!56741 (= lt!96980 (ListLongMap!2478 lt!96983))))

(declare-fun lt!96981 () Unit!5878)

(declare-fun lt!96982 () Unit!5878)

(assert (=> d!56741 (= lt!96981 lt!96982)))

(assert (=> d!56741 (= (getValueByKey!245 lt!96983 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56741 (= lt!96982 (lemmaContainsTupThenGetReturnValue!132 lt!96983 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56741 (= lt!96983 (insertStrictlySorted!135 (toList!1254 lt!96836) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56741 (= (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) lt!96980)))

(declare-fun b!194413 () Bool)

(declare-fun res!91888 () Bool)

(assert (=> b!194413 (=> (not res!91888) (not e!127898))))

(assert (=> b!194413 (= res!91888 (= (getValueByKey!245 (toList!1254 lt!96980) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))

(declare-fun b!194414 () Bool)

(assert (=> b!194414 (= e!127898 (contains!1381 (toList!1254 lt!96980) (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))

(assert (= (and d!56741 res!91887) b!194413))

(assert (= (and b!194413 res!91888) b!194414))

(declare-fun m!221275 () Bool)

(assert (=> d!56741 m!221275))

(declare-fun m!221277 () Bool)

(assert (=> d!56741 m!221277))

(declare-fun m!221279 () Bool)

(assert (=> d!56741 m!221279))

(declare-fun m!221281 () Bool)

(assert (=> d!56741 m!221281))

(declare-fun m!221283 () Bool)

(assert (=> b!194413 m!221283))

(declare-fun m!221285 () Bool)

(assert (=> b!194414 m!221285))

(assert (=> b!194162 d!56741))

(declare-fun d!56743 () Bool)

(declare-fun e!127900 () Bool)

(assert (=> d!56743 e!127900))

(declare-fun res!91889 () Bool)

(assert (=> d!56743 (=> res!91889 e!127900)))

(declare-fun lt!96984 () Bool)

(assert (=> d!56743 (= res!91889 (not lt!96984))))

(declare-fun lt!96985 () Bool)

(assert (=> d!56743 (= lt!96984 lt!96985)))

(declare-fun lt!96986 () Unit!5878)

(declare-fun e!127899 () Unit!5878)

(assert (=> d!56743 (= lt!96986 e!127899)))

(declare-fun c!35082 () Bool)

(assert (=> d!56743 (= c!35082 lt!96985)))

(assert (=> d!56743 (= lt!96985 (containsKey!249 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832))))

(assert (=> d!56743 (= (contains!1379 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) lt!96832) lt!96984)))

(declare-fun b!194415 () Bool)

(declare-fun lt!96987 () Unit!5878)

(assert (=> b!194415 (= e!127899 lt!96987)))

(assert (=> b!194415 (= lt!96987 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832))))

(assert (=> b!194415 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832))))

(declare-fun b!194416 () Bool)

(declare-fun Unit!5892 () Unit!5878)

(assert (=> b!194416 (= e!127899 Unit!5892)))

(declare-fun b!194417 () Bool)

(assert (=> b!194417 (= e!127900 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832)))))

(assert (= (and d!56743 c!35082) b!194415))

(assert (= (and d!56743 (not c!35082)) b!194416))

(assert (= (and d!56743 (not res!91889)) b!194417))

(declare-fun m!221287 () Bool)

(assert (=> d!56743 m!221287))

(declare-fun m!221289 () Bool)

(assert (=> b!194415 m!221289))

(declare-fun m!221291 () Bool)

(assert (=> b!194415 m!221291))

(assert (=> b!194415 m!221291))

(declare-fun m!221293 () Bool)

(assert (=> b!194415 m!221293))

(assert (=> b!194417 m!221291))

(assert (=> b!194417 m!221291))

(assert (=> b!194417 m!221293))

(assert (=> b!194162 d!56743))

(declare-fun d!56745 () Bool)

(assert (=> d!56745 (= (apply!188 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) lt!96834) (apply!188 lt!96848 lt!96834))))

(declare-fun lt!96988 () Unit!5878)

(assert (=> d!56745 (= lt!96988 (choose!1069 lt!96848 lt!96839 (zeroValue!3801 thiss!1248) lt!96834))))

(declare-fun e!127901 () Bool)

(assert (=> d!56745 e!127901))

(declare-fun res!91890 () Bool)

(assert (=> d!56745 (=> (not res!91890) (not e!127901))))

(assert (=> d!56745 (= res!91890 (contains!1379 lt!96848 lt!96834))))

(assert (=> d!56745 (= (addApplyDifferent!164 lt!96848 lt!96839 (zeroValue!3801 thiss!1248) lt!96834) lt!96988)))

(declare-fun b!194418 () Bool)

(assert (=> b!194418 (= e!127901 (not (= lt!96834 lt!96839)))))

(assert (= (and d!56745 res!91890) b!194418))

(assert (=> d!56745 m!220989))

(assert (=> d!56745 m!220991))

(assert (=> d!56745 m!220989))

(declare-fun m!221295 () Bool)

(assert (=> d!56745 m!221295))

(declare-fun m!221297 () Bool)

(assert (=> d!56745 m!221297))

(assert (=> d!56745 m!220995))

(assert (=> b!194162 d!56745))

(declare-fun d!56747 () Bool)

(assert (=> d!56747 (contains!1379 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) lt!96832)))

(declare-fun lt!96991 () Unit!5878)

(declare-fun choose!1070 (ListLongMap!2477 (_ BitVec 64) V!5635 (_ BitVec 64)) Unit!5878)

(assert (=> d!56747 (= lt!96991 (choose!1070 lt!96836 lt!96852 (zeroValue!3801 thiss!1248) lt!96832))))

(assert (=> d!56747 (contains!1379 lt!96836 lt!96832)))

(assert (=> d!56747 (= (addStillContains!164 lt!96836 lt!96852 (zeroValue!3801 thiss!1248) lt!96832) lt!96991)))

(declare-fun bs!7735 () Bool)

(assert (= bs!7735 d!56747))

(assert (=> bs!7735 m!220977))

(assert (=> bs!7735 m!220977))

(assert (=> bs!7735 m!220979))

(declare-fun m!221299 () Bool)

(assert (=> bs!7735 m!221299))

(declare-fun m!221301 () Bool)

(assert (=> bs!7735 m!221301))

(assert (=> b!194162 d!56747))

(declare-fun d!56749 () Bool)

(declare-fun e!127902 () Bool)

(assert (=> d!56749 e!127902))

(declare-fun res!91891 () Bool)

(assert (=> d!56749 (=> (not res!91891) (not e!127902))))

(declare-fun lt!96992 () ListLongMap!2477)

(assert (=> d!56749 (= res!91891 (contains!1379 lt!96992 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun lt!96995 () List!2449)

(assert (=> d!56749 (= lt!96992 (ListLongMap!2478 lt!96995))))

(declare-fun lt!96993 () Unit!5878)

(declare-fun lt!96994 () Unit!5878)

(assert (=> d!56749 (= lt!96993 lt!96994)))

(assert (=> d!56749 (= (getValueByKey!245 lt!96995 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) (Some!250 (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!56749 (= lt!96994 (lemmaContainsTupThenGetReturnValue!132 lt!96995 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!56749 (= lt!96995 (insertStrictlySorted!135 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630))) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!56749 (= (+!322 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630)) (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!96992)))

(declare-fun b!194420 () Bool)

(declare-fun res!91892 () Bool)

(assert (=> b!194420 (=> (not res!91892) (not e!127902))))

(assert (=> b!194420 (= res!91892 (= (getValueByKey!245 (toList!1254 lt!96992) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) (Some!250 (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun b!194421 () Bool)

(assert (=> b!194421 (= e!127902 (contains!1381 (toList!1254 lt!96992) (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (= (and d!56749 res!91891) b!194420))

(assert (= (and b!194420 res!91892) b!194421))

(declare-fun m!221303 () Bool)

(assert (=> d!56749 m!221303))

(declare-fun m!221305 () Bool)

(assert (=> d!56749 m!221305))

(declare-fun m!221307 () Bool)

(assert (=> d!56749 m!221307))

(declare-fun m!221309 () Bool)

(assert (=> d!56749 m!221309))

(declare-fun m!221311 () Bool)

(assert (=> b!194420 m!221311))

(declare-fun m!221313 () Bool)

(assert (=> b!194421 m!221313))

(assert (=> bm!19628 d!56749))

(declare-fun d!56751 () Bool)

(assert (=> d!56751 (= (inRange!0 (ite c!34993 (index!4946 lt!96749) (index!4949 lt!96749)) (mask!9223 thiss!1248)) (and (bvsge (ite c!34993 (index!4946 lt!96749) (index!4949 lt!96749)) #b00000000000000000000000000000000) (bvslt (ite c!34993 (index!4946 lt!96749) (index!4949 lt!96749)) (bvadd (mask!9223 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19612 d!56751))

(declare-fun d!56753 () Bool)

(declare-fun e!127904 () Bool)

(assert (=> d!56753 e!127904))

(declare-fun res!91893 () Bool)

(assert (=> d!56753 (=> res!91893 e!127904)))

(declare-fun lt!96996 () Bool)

(assert (=> d!56753 (= res!91893 (not lt!96996))))

(declare-fun lt!96997 () Bool)

(assert (=> d!56753 (= lt!96996 lt!96997)))

(declare-fun lt!96998 () Unit!5878)

(declare-fun e!127903 () Unit!5878)

(assert (=> d!56753 (= lt!96998 e!127903)))

(declare-fun c!35083 () Bool)

(assert (=> d!56753 (= c!35083 lt!96997)))

(assert (=> d!56753 (= lt!96997 (containsKey!249 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56753 (= (contains!1379 lt!96845 #b1000000000000000000000000000000000000000000000000000000000000000) lt!96996)))

(declare-fun b!194422 () Bool)

(declare-fun lt!96999 () Unit!5878)

(assert (=> b!194422 (= e!127903 lt!96999)))

(assert (=> b!194422 (= lt!96999 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194422 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194423 () Bool)

(declare-fun Unit!5893 () Unit!5878)

(assert (=> b!194423 (= e!127903 Unit!5893)))

(declare-fun b!194424 () Bool)

(assert (=> b!194424 (= e!127904 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56753 c!35083) b!194422))

(assert (= (and d!56753 (not c!35083)) b!194423))

(assert (= (and d!56753 (not res!91893)) b!194424))

(declare-fun m!221315 () Bool)

(assert (=> d!56753 m!221315))

(declare-fun m!221317 () Bool)

(assert (=> b!194422 m!221317))

(declare-fun m!221319 () Bool)

(assert (=> b!194422 m!221319))

(assert (=> b!194422 m!221319))

(declare-fun m!221321 () Bool)

(assert (=> b!194422 m!221321))

(assert (=> b!194424 m!221319))

(assert (=> b!194424 m!221319))

(assert (=> b!194424 m!221321))

(assert (=> bm!19636 d!56753))

(declare-fun d!56755 () Bool)

(assert (=> d!56755 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(declare-fun lt!97000 () Unit!5878)

(assert (=> d!56755 (= lt!97000 (choose!1067 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(declare-fun e!127905 () Bool)

(assert (=> d!56755 e!127905))

(declare-fun res!91894 () Bool)

(assert (=> d!56755 (=> (not res!91894) (not e!127905))))

(assert (=> d!56755 (= res!91894 (isStrictlySorted!357 (toList!1254 lt!96669)))))

(assert (=> d!56755 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) lt!97000)))

(declare-fun b!194425 () Bool)

(assert (=> b!194425 (= e!127905 (containsKey!249 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (= (and d!56755 res!91894) b!194425))

(assert (=> d!56755 m!220759))

(assert (=> d!56755 m!220941))

(assert (=> d!56755 m!220941))

(assert (=> d!56755 m!220943))

(assert (=> d!56755 m!220759))

(declare-fun m!221323 () Bool)

(assert (=> d!56755 m!221323))

(declare-fun m!221325 () Bool)

(assert (=> d!56755 m!221325))

(assert (=> b!194425 m!220759))

(assert (=> b!194425 m!220937))

(assert (=> b!194148 d!56755))

(declare-fun d!56757 () Bool)

(assert (=> d!56757 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))))

(declare-fun bs!7736 () Bool)

(assert (= bs!7736 d!56757))

(assert (=> bs!7736 m!220941))

(declare-fun m!221327 () Bool)

(assert (=> bs!7736 m!221327))

(assert (=> b!194148 d!56757))

(declare-fun b!194427 () Bool)

(declare-fun e!127906 () Option!251)

(declare-fun e!127907 () Option!251)

(assert (=> b!194427 (= e!127906 e!127907)))

(declare-fun c!35085 () Bool)

(assert (=> b!194427 (= c!35085 (and ((_ is Cons!2445) (toList!1254 lt!96669)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96669))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))))

(declare-fun b!194426 () Bool)

(assert (=> b!194426 (= e!127906 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96669)))))))

(declare-fun b!194428 () Bool)

(assert (=> b!194428 (= e!127907 (getValueByKey!245 (t!7375 (toList!1254 lt!96669)) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(declare-fun c!35084 () Bool)

(declare-fun d!56759 () Bool)

(assert (=> d!56759 (= c!35084 (and ((_ is Cons!2445) (toList!1254 lt!96669)) (= (_1!1791 (h!3086 (toList!1254 lt!96669))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(assert (=> d!56759 (= (getValueByKey!245 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) e!127906)))

(declare-fun b!194429 () Bool)

(assert (=> b!194429 (= e!127907 None!249)))

(assert (= (and d!56759 c!35084) b!194426))

(assert (= (and d!56759 (not c!35084)) b!194427))

(assert (= (and b!194427 c!35085) b!194428))

(assert (= (and b!194427 (not c!35085)) b!194429))

(assert (=> b!194428 m!220759))

(declare-fun m!221329 () Bool)

(assert (=> b!194428 m!221329))

(assert (=> b!194148 d!56759))

(declare-fun d!56761 () Bool)

(assert (=> d!56761 (contains!1379 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) lt!96795)))

(declare-fun lt!97001 () Unit!5878)

(assert (=> d!56761 (= lt!97001 (choose!1070 lt!96799 lt!96815 (zeroValue!3801 thiss!1248) lt!96795))))

(assert (=> d!56761 (contains!1379 lt!96799 lt!96795)))

(assert (=> d!56761 (= (addStillContains!164 lt!96799 lt!96815 (zeroValue!3801 thiss!1248) lt!96795) lt!97001)))

(declare-fun bs!7737 () Bool)

(assert (= bs!7737 d!56761))

(assert (=> bs!7737 m!220893))

(assert (=> bs!7737 m!220893))

(assert (=> bs!7737 m!220895))

(declare-fun m!221331 () Bool)

(assert (=> bs!7737 m!221331))

(declare-fun m!221333 () Bool)

(assert (=> bs!7737 m!221333))

(assert (=> b!194128 d!56761))

(declare-fun d!56763 () Bool)

(assert (=> d!56763 (= (apply!188 lt!96816 lt!96798) (get!2238 (getValueByKey!245 (toList!1254 lt!96816) lt!96798)))))

(declare-fun bs!7738 () Bool)

(assert (= bs!7738 d!56763))

(declare-fun m!221335 () Bool)

(assert (=> bs!7738 m!221335))

(assert (=> bs!7738 m!221335))

(declare-fun m!221337 () Bool)

(assert (=> bs!7738 m!221337))

(assert (=> b!194128 d!56763))

(declare-fun d!56765 () Bool)

(declare-fun e!127908 () Bool)

(assert (=> d!56765 e!127908))

(declare-fun res!91895 () Bool)

(assert (=> d!56765 (=> (not res!91895) (not e!127908))))

(declare-fun lt!97002 () ListLongMap!2477)

(assert (=> d!56765 (= res!91895 (contains!1379 lt!97002 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97005 () List!2449)

(assert (=> d!56765 (= lt!97002 (ListLongMap!2478 lt!97005))))

(declare-fun lt!97003 () Unit!5878)

(declare-fun lt!97004 () Unit!5878)

(assert (=> d!56765 (= lt!97003 lt!97004)))

(assert (=> d!56765 (= (getValueByKey!245 lt!97005 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(assert (=> d!56765 (= lt!97004 (lemmaContainsTupThenGetReturnValue!132 lt!97005 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(assert (=> d!56765 (= lt!97005 (insertStrictlySorted!135 (toList!1254 lt!96816) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(assert (=> d!56765 (= (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) lt!97002)))

(declare-fun b!194430 () Bool)

(declare-fun res!91896 () Bool)

(assert (=> b!194430 (=> (not res!91896) (not e!127908))))

(assert (=> b!194430 (= res!91896 (= (getValueByKey!245 (toList!1254 lt!97002) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))))

(declare-fun b!194431 () Bool)

(assert (=> b!194431 (= e!127908 (contains!1381 (toList!1254 lt!97002) (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))

(assert (= (and d!56765 res!91895) b!194430))

(assert (= (and b!194430 res!91896) b!194431))

(declare-fun m!221339 () Bool)

(assert (=> d!56765 m!221339))

(declare-fun m!221341 () Bool)

(assert (=> d!56765 m!221341))

(declare-fun m!221343 () Bool)

(assert (=> d!56765 m!221343))

(declare-fun m!221345 () Bool)

(assert (=> d!56765 m!221345))

(declare-fun m!221347 () Bool)

(assert (=> b!194430 m!221347))

(declare-fun m!221349 () Bool)

(assert (=> b!194431 m!221349))

(assert (=> b!194128 d!56765))

(declare-fun d!56767 () Bool)

(declare-fun e!127910 () Bool)

(assert (=> d!56767 e!127910))

(declare-fun res!91897 () Bool)

(assert (=> d!56767 (=> res!91897 e!127910)))

(declare-fun lt!97006 () Bool)

(assert (=> d!56767 (= res!91897 (not lt!97006))))

(declare-fun lt!97007 () Bool)

(assert (=> d!56767 (= lt!97006 lt!97007)))

(declare-fun lt!97008 () Unit!5878)

(declare-fun e!127909 () Unit!5878)

(assert (=> d!56767 (= lt!97008 e!127909)))

(declare-fun c!35086 () Bool)

(assert (=> d!56767 (= c!35086 lt!97007)))

(assert (=> d!56767 (= lt!97007 (containsKey!249 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795))))

(assert (=> d!56767 (= (contains!1379 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) lt!96795) lt!97006)))

(declare-fun b!194432 () Bool)

(declare-fun lt!97009 () Unit!5878)

(assert (=> b!194432 (= e!127909 lt!97009)))

(assert (=> b!194432 (= lt!97009 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795))))

(assert (=> b!194432 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795))))

(declare-fun b!194433 () Bool)

(declare-fun Unit!5894 () Unit!5878)

(assert (=> b!194433 (= e!127909 Unit!5894)))

(declare-fun b!194434 () Bool)

(assert (=> b!194434 (= e!127910 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795)))))

(assert (= (and d!56767 c!35086) b!194432))

(assert (= (and d!56767 (not c!35086)) b!194433))

(assert (= (and d!56767 (not res!91897)) b!194434))

(declare-fun m!221351 () Bool)

(assert (=> d!56767 m!221351))

(declare-fun m!221353 () Bool)

(assert (=> b!194432 m!221353))

(declare-fun m!221355 () Bool)

(assert (=> b!194432 m!221355))

(assert (=> b!194432 m!221355))

(declare-fun m!221357 () Bool)

(assert (=> b!194432 m!221357))

(assert (=> b!194434 m!221355))

(assert (=> b!194434 m!221355))

(assert (=> b!194434 m!221357))

(assert (=> b!194128 d!56767))

(declare-fun d!56769 () Bool)

(assert (=> d!56769 (= (apply!188 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) lt!96813) (apply!188 lt!96801 lt!96813))))

(declare-fun lt!97010 () Unit!5878)

(assert (=> d!56769 (= lt!97010 (choose!1069 lt!96801 lt!96809 (minValue!3801 thiss!1248) lt!96813))))

(declare-fun e!127911 () Bool)

(assert (=> d!56769 e!127911))

(declare-fun res!91898 () Bool)

(assert (=> d!56769 (=> (not res!91898) (not e!127911))))

(assert (=> d!56769 (= res!91898 (contains!1379 lt!96801 lt!96813))))

(assert (=> d!56769 (= (addApplyDifferent!164 lt!96801 lt!96809 (minValue!3801 thiss!1248) lt!96813) lt!97010)))

(declare-fun b!194435 () Bool)

(assert (=> b!194435 (= e!127911 (not (= lt!96813 lt!96809)))))

(assert (= (and d!56769 res!91898) b!194435))

(assert (=> d!56769 m!220897))

(assert (=> d!56769 m!220899))

(assert (=> d!56769 m!220897))

(declare-fun m!221359 () Bool)

(assert (=> d!56769 m!221359))

(declare-fun m!221361 () Bool)

(assert (=> d!56769 m!221361))

(assert (=> d!56769 m!220915))

(assert (=> b!194128 d!56769))

(declare-fun d!56771 () Bool)

(assert (=> d!56771 (= (apply!188 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) lt!96798) (apply!188 lt!96816 lt!96798))))

(declare-fun lt!97011 () Unit!5878)

(assert (=> d!56771 (= lt!97011 (choose!1069 lt!96816 lt!96807 (minValue!3801 thiss!1248) lt!96798))))

(declare-fun e!127912 () Bool)

(assert (=> d!56771 e!127912))

(declare-fun res!91899 () Bool)

(assert (=> d!56771 (=> (not res!91899) (not e!127912))))

(assert (=> d!56771 (= res!91899 (contains!1379 lt!96816 lt!96798))))

(assert (=> d!56771 (= (addApplyDifferent!164 lt!96816 lt!96807 (minValue!3801 thiss!1248) lt!96798) lt!97011)))

(declare-fun b!194436 () Bool)

(assert (=> b!194436 (= e!127912 (not (= lt!96798 lt!96807)))))

(assert (= (and d!56771 res!91899) b!194436))

(assert (=> d!56771 m!220901))

(assert (=> d!56771 m!220919))

(assert (=> d!56771 m!220901))

(declare-fun m!221363 () Bool)

(assert (=> d!56771 m!221363))

(declare-fun m!221365 () Bool)

(assert (=> d!56771 m!221365))

(assert (=> d!56771 m!220913))

(assert (=> b!194128 d!56771))

(declare-fun d!56773 () Bool)

(assert (=> d!56773 (= (apply!188 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) lt!96813) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) lt!96813)))))

(declare-fun bs!7739 () Bool)

(assert (= bs!7739 d!56773))

(declare-fun m!221367 () Bool)

(assert (=> bs!7739 m!221367))

(assert (=> bs!7739 m!221367))

(declare-fun m!221369 () Bool)

(assert (=> bs!7739 m!221369))

(assert (=> b!194128 d!56773))

(declare-fun d!56775 () Bool)

(assert (=> d!56775 (= (apply!188 lt!96801 lt!96813) (get!2238 (getValueByKey!245 (toList!1254 lt!96801) lt!96813)))))

(declare-fun bs!7740 () Bool)

(assert (= bs!7740 d!56775))

(declare-fun m!221371 () Bool)

(assert (=> bs!7740 m!221371))

(assert (=> bs!7740 m!221371))

(declare-fun m!221373 () Bool)

(assert (=> bs!7740 m!221373))

(assert (=> b!194128 d!56775))

(declare-fun d!56777 () Bool)

(declare-fun e!127913 () Bool)

(assert (=> d!56777 e!127913))

(declare-fun res!91900 () Bool)

(assert (=> d!56777 (=> (not res!91900) (not e!127913))))

(declare-fun lt!97012 () ListLongMap!2477)

(assert (=> d!56777 (= res!91900 (contains!1379 lt!97012 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97015 () List!2449)

(assert (=> d!56777 (= lt!97012 (ListLongMap!2478 lt!97015))))

(declare-fun lt!97013 () Unit!5878)

(declare-fun lt!97014 () Unit!5878)

(assert (=> d!56777 (= lt!97013 lt!97014)))

(assert (=> d!56777 (= (getValueByKey!245 lt!97015 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(assert (=> d!56777 (= lt!97014 (lemmaContainsTupThenGetReturnValue!132 lt!97015 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(assert (=> d!56777 (= lt!97015 (insertStrictlySorted!135 (toList!1254 lt!96801) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(assert (=> d!56777 (= (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) lt!97012)))

(declare-fun b!194437 () Bool)

(declare-fun res!91901 () Bool)

(assert (=> b!194437 (=> (not res!91901) (not e!127913))))

(assert (=> b!194437 (= res!91901 (= (getValueByKey!245 (toList!1254 lt!97012) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))))

(declare-fun b!194438 () Bool)

(assert (=> b!194438 (= e!127913 (contains!1381 (toList!1254 lt!97012) (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))

(assert (= (and d!56777 res!91900) b!194437))

(assert (= (and b!194437 res!91901) b!194438))

(declare-fun m!221375 () Bool)

(assert (=> d!56777 m!221375))

(declare-fun m!221377 () Bool)

(assert (=> d!56777 m!221377))

(declare-fun m!221379 () Bool)

(assert (=> d!56777 m!221379))

(declare-fun m!221381 () Bool)

(assert (=> d!56777 m!221381))

(declare-fun m!221383 () Bool)

(assert (=> b!194437 m!221383))

(declare-fun m!221385 () Bool)

(assert (=> b!194438 m!221385))

(assert (=> b!194128 d!56777))

(declare-fun d!56779 () Bool)

(assert (=> d!56779 (= (apply!188 lt!96811 lt!96797) (get!2238 (getValueByKey!245 (toList!1254 lt!96811) lt!96797)))))

(declare-fun bs!7741 () Bool)

(assert (= bs!7741 d!56779))

(declare-fun m!221387 () Bool)

(assert (=> bs!7741 m!221387))

(assert (=> bs!7741 m!221387))

(declare-fun m!221389 () Bool)

(assert (=> bs!7741 m!221389))

(assert (=> b!194128 d!56779))

(declare-fun d!56781 () Bool)

(declare-fun e!127914 () Bool)

(assert (=> d!56781 e!127914))

(declare-fun res!91902 () Bool)

(assert (=> d!56781 (=> (not res!91902) (not e!127914))))

(declare-fun lt!97016 () ListLongMap!2477)

(assert (=> d!56781 (= res!91902 (contains!1379 lt!97016 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(declare-fun lt!97019 () List!2449)

(assert (=> d!56781 (= lt!97016 (ListLongMap!2478 lt!97019))))

(declare-fun lt!97017 () Unit!5878)

(declare-fun lt!97018 () Unit!5878)

(assert (=> d!56781 (= lt!97017 lt!97018)))

(assert (=> d!56781 (= (getValueByKey!245 lt!97019 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56781 (= lt!97018 (lemmaContainsTupThenGetReturnValue!132 lt!97019 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56781 (= lt!97019 (insertStrictlySorted!135 (toList!1254 lt!96799) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56781 (= (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) lt!97016)))

(declare-fun b!194439 () Bool)

(declare-fun res!91903 () Bool)

(assert (=> b!194439 (=> (not res!91903) (not e!127914))))

(assert (=> b!194439 (= res!91903 (= (getValueByKey!245 (toList!1254 lt!97016) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))

(declare-fun b!194440 () Bool)

(assert (=> b!194440 (= e!127914 (contains!1381 (toList!1254 lt!97016) (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))

(assert (= (and d!56781 res!91902) b!194439))

(assert (= (and b!194439 res!91903) b!194440))

(declare-fun m!221391 () Bool)

(assert (=> d!56781 m!221391))

(declare-fun m!221393 () Bool)

(assert (=> d!56781 m!221393))

(declare-fun m!221395 () Bool)

(assert (=> d!56781 m!221395))

(declare-fun m!221397 () Bool)

(assert (=> d!56781 m!221397))

(declare-fun m!221399 () Bool)

(assert (=> b!194439 m!221399))

(declare-fun m!221401 () Bool)

(assert (=> b!194440 m!221401))

(assert (=> b!194128 d!56781))

(declare-fun d!56783 () Bool)

(declare-fun e!127915 () Bool)

(assert (=> d!56783 e!127915))

(declare-fun res!91904 () Bool)

(assert (=> d!56783 (=> (not res!91904) (not e!127915))))

(declare-fun lt!97020 () ListLongMap!2477)

(assert (=> d!56783 (= res!91904 (contains!1379 lt!97020 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(declare-fun lt!97023 () List!2449)

(assert (=> d!56783 (= lt!97020 (ListLongMap!2478 lt!97023))))

(declare-fun lt!97021 () Unit!5878)

(declare-fun lt!97022 () Unit!5878)

(assert (=> d!56783 (= lt!97021 lt!97022)))

(assert (=> d!56783 (= (getValueByKey!245 lt!97023 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56783 (= lt!97022 (lemmaContainsTupThenGetReturnValue!132 lt!97023 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56783 (= lt!97023 (insertStrictlySorted!135 (toList!1254 lt!96811) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56783 (= (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) lt!97020)))

(declare-fun b!194441 () Bool)

(declare-fun res!91905 () Bool)

(assert (=> b!194441 (=> (not res!91905) (not e!127915))))

(assert (=> b!194441 (= res!91905 (= (getValueByKey!245 (toList!1254 lt!97020) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))))

(declare-fun b!194442 () Bool)

(assert (=> b!194442 (= e!127915 (contains!1381 (toList!1254 lt!97020) (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))

(assert (= (and d!56783 res!91904) b!194441))

(assert (= (and b!194441 res!91905) b!194442))

(declare-fun m!221403 () Bool)

(assert (=> d!56783 m!221403))

(declare-fun m!221405 () Bool)

(assert (=> d!56783 m!221405))

(declare-fun m!221407 () Bool)

(assert (=> d!56783 m!221407))

(declare-fun m!221409 () Bool)

(assert (=> d!56783 m!221409))

(declare-fun m!221411 () Bool)

(assert (=> b!194441 m!221411))

(declare-fun m!221413 () Bool)

(assert (=> b!194442 m!221413))

(assert (=> b!194128 d!56783))

(declare-fun d!56785 () Bool)

(assert (=> d!56785 (= (apply!188 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) lt!96798) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) lt!96798)))))

(declare-fun bs!7742 () Bool)

(assert (= bs!7742 d!56785))

(declare-fun m!221415 () Bool)

(assert (=> bs!7742 m!221415))

(assert (=> bs!7742 m!221415))

(declare-fun m!221417 () Bool)

(assert (=> bs!7742 m!221417))

(assert (=> b!194128 d!56785))

(declare-fun d!56787 () Bool)

(assert (=> d!56787 (= (apply!188 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) lt!96797) (apply!188 lt!96811 lt!96797))))

(declare-fun lt!97024 () Unit!5878)

(assert (=> d!56787 (= lt!97024 (choose!1069 lt!96811 lt!96802 (zeroValue!3801 thiss!1248) lt!96797))))

(declare-fun e!127916 () Bool)

(assert (=> d!56787 e!127916))

(declare-fun res!91906 () Bool)

(assert (=> d!56787 (=> (not res!91906) (not e!127916))))

(assert (=> d!56787 (= res!91906 (contains!1379 lt!96811 lt!96797))))

(assert (=> d!56787 (= (addApplyDifferent!164 lt!96811 lt!96802 (zeroValue!3801 thiss!1248) lt!96797) lt!97024)))

(declare-fun b!194443 () Bool)

(assert (=> b!194443 (= e!127916 (not (= lt!96797 lt!96802)))))

(assert (= (and d!56787 res!91906) b!194443))

(assert (=> d!56787 m!220905))

(assert (=> d!56787 m!220907))

(assert (=> d!56787 m!220905))

(declare-fun m!221419 () Bool)

(assert (=> d!56787 m!221419))

(declare-fun m!221421 () Bool)

(assert (=> d!56787 m!221421))

(assert (=> d!56787 m!220911))

(assert (=> b!194128 d!56787))

(declare-fun d!56789 () Bool)

(assert (=> d!56789 (= (apply!188 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) lt!96797) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) lt!96797)))))

(declare-fun bs!7743 () Bool)

(assert (= bs!7743 d!56789))

(declare-fun m!221423 () Bool)

(assert (=> bs!7743 m!221423))

(assert (=> bs!7743 m!221423))

(declare-fun m!221425 () Bool)

(assert (=> bs!7743 m!221425))

(assert (=> b!194128 d!56789))

(declare-fun b!194444 () Bool)

(declare-fun e!127920 () ListLongMap!2477)

(declare-fun e!127921 () ListLongMap!2477)

(assert (=> b!194444 (= e!127920 e!127921)))

(declare-fun c!35090 () Bool)

(assert (=> b!194444 (= c!35090 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194446 () Bool)

(declare-fun e!127923 () Bool)

(declare-fun lt!97031 () ListLongMap!2477)

(assert (=> b!194446 (= e!127923 (isEmpty!488 lt!97031))))

(declare-fun b!194447 () Bool)

(declare-fun call!19666 () ListLongMap!2477)

(assert (=> b!194447 (= e!127921 call!19666)))

(declare-fun b!194448 () Bool)

(declare-fun e!127922 () Bool)

(declare-fun e!127918 () Bool)

(assert (=> b!194448 (= e!127922 e!127918)))

(assert (=> b!194448 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun res!91907 () Bool)

(assert (=> b!194448 (= res!91907 (contains!1379 lt!97031 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194448 (=> (not res!91907) (not e!127918))))

(declare-fun b!194449 () Bool)

(declare-fun e!127919 () Bool)

(assert (=> b!194449 (= e!127919 e!127922)))

(declare-fun c!35089 () Bool)

(declare-fun e!127917 () Bool)

(assert (=> b!194449 (= c!35089 e!127917)))

(declare-fun res!91908 () Bool)

(assert (=> b!194449 (=> (not res!91908) (not e!127917))))

(assert (=> b!194449 (= res!91908 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194450 () Bool)

(assert (=> b!194450 (= e!127917 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194450 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!194451 () Bool)

(assert (=> b!194451 (= e!127920 (ListLongMap!2478 Nil!2446))))

(declare-fun b!194452 () Bool)

(assert (=> b!194452 (= e!127923 (= lt!97031 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248))))))

(declare-fun bm!19663 () Bool)

(assert (=> bm!19663 (= call!19666 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248)))))

(declare-fun b!194453 () Bool)

(assert (=> b!194453 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> b!194453 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4200 lt!96681)))))

(assert (=> b!194453 (= e!127918 (= (apply!188 lt!97031 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194445 () Bool)

(declare-fun lt!97028 () Unit!5878)

(declare-fun lt!97029 () Unit!5878)

(assert (=> b!194445 (= lt!97028 lt!97029)))

(declare-fun lt!97026 () V!5635)

(declare-fun lt!97030 () ListLongMap!2477)

(declare-fun lt!97025 () (_ BitVec 64))

(declare-fun lt!97027 () (_ BitVec 64))

(assert (=> b!194445 (not (contains!1379 (+!322 lt!97030 (tuple2!3561 lt!97027 lt!97026)) lt!97025))))

(assert (=> b!194445 (= lt!97029 (addStillNotContains!97 lt!97030 lt!97027 lt!97026 lt!97025))))

(assert (=> b!194445 (= lt!97025 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194445 (= lt!97026 (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194445 (= lt!97027 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194445 (= lt!97030 call!19666)))

(assert (=> b!194445 (= e!127921 (+!322 call!19666 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!56791 () Bool)

(assert (=> d!56791 e!127919))

(declare-fun res!91910 () Bool)

(assert (=> d!56791 (=> (not res!91910) (not e!127919))))

(assert (=> d!56791 (= res!91910 (not (contains!1379 lt!97031 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56791 (= lt!97031 e!127920)))

(declare-fun c!35087 () Bool)

(assert (=> d!56791 (= c!35087 (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!56791 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56791 (= (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) lt!97031)))

(declare-fun b!194454 () Bool)

(assert (=> b!194454 (= e!127922 e!127923)))

(declare-fun c!35088 () Bool)

(assert (=> b!194454 (= c!35088 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194455 () Bool)

(declare-fun res!91909 () Bool)

(assert (=> b!194455 (=> (not res!91909) (not e!127919))))

(assert (=> b!194455 (= res!91909 (not (contains!1379 lt!97031 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56791 c!35087) b!194451))

(assert (= (and d!56791 (not c!35087)) b!194444))

(assert (= (and b!194444 c!35090) b!194445))

(assert (= (and b!194444 (not c!35090)) b!194447))

(assert (= (or b!194445 b!194447) bm!19663))

(assert (= (and d!56791 res!91910) b!194455))

(assert (= (and b!194455 res!91909) b!194449))

(assert (= (and b!194449 res!91908) b!194450))

(assert (= (and b!194449 c!35089) b!194448))

(assert (= (and b!194449 (not c!35089)) b!194454))

(assert (= (and b!194448 res!91907) b!194453))

(assert (= (and b!194454 c!35088) b!194452))

(assert (= (and b!194454 (not c!35088)) b!194446))

(declare-fun b_lambda!7493 () Bool)

(assert (=> (not b_lambda!7493) (not b!194453)))

(assert (=> b!194453 t!7378))

(declare-fun b_and!11447 () Bool)

(assert (= b_and!11445 (and (=> t!7378 result!4939) b_and!11447)))

(declare-fun b_lambda!7495 () Bool)

(assert (=> (not b_lambda!7495) (not b!194445)))

(assert (=> b!194445 t!7378))

(declare-fun b_and!11449 () Bool)

(assert (= b_and!11447 (and (=> t!7378 result!4939) b_and!11449)))

(declare-fun m!221427 () Bool)

(assert (=> d!56791 m!221427))

(assert (=> d!56791 m!220855))

(declare-fun m!221429 () Bool)

(assert (=> bm!19663 m!221429))

(declare-fun m!221431 () Bool)

(assert (=> b!194445 m!221431))

(declare-fun m!221433 () Bool)

(assert (=> b!194445 m!221433))

(assert (=> b!194445 m!220885))

(assert (=> b!194445 m!220881))

(assert (=> b!194445 m!220887))

(assert (=> b!194445 m!221433))

(declare-fun m!221435 () Bool)

(assert (=> b!194445 m!221435))

(assert (=> b!194445 m!220877))

(declare-fun m!221437 () Bool)

(assert (=> b!194445 m!221437))

(assert (=> b!194445 m!220881))

(assert (=> b!194445 m!220885))

(assert (=> b!194450 m!220877))

(assert (=> b!194450 m!220877))

(assert (=> b!194450 m!220879))

(declare-fun m!221439 () Bool)

(assert (=> b!194446 m!221439))

(assert (=> b!194448 m!220877))

(assert (=> b!194448 m!220877))

(declare-fun m!221441 () Bool)

(assert (=> b!194448 m!221441))

(declare-fun m!221443 () Bool)

(assert (=> b!194455 m!221443))

(assert (=> b!194452 m!221429))

(assert (=> b!194453 m!220885))

(assert (=> b!194453 m!220881))

(assert (=> b!194453 m!220887))

(assert (=> b!194453 m!220877))

(declare-fun m!221445 () Bool)

(assert (=> b!194453 m!221445))

(assert (=> b!194453 m!220877))

(assert (=> b!194453 m!220881))

(assert (=> b!194453 m!220885))

(assert (=> b!194444 m!220877))

(assert (=> b!194444 m!220877))

(assert (=> b!194444 m!220879))

(assert (=> b!194128 d!56791))

(declare-fun b!194456 () Bool)

(declare-fun e!127926 () Bool)

(declare-fun e!127925 () Bool)

(assert (=> b!194456 (= e!127926 e!127925)))

(declare-fun c!35091 () Bool)

(assert (=> b!194456 (= c!35091 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun b!194457 () Bool)

(declare-fun e!127924 () Bool)

(declare-fun call!19667 () Bool)

(assert (=> b!194457 (= e!127924 call!19667)))

(declare-fun b!194458 () Bool)

(assert (=> b!194458 (= e!127925 e!127924)))

(declare-fun lt!97032 () (_ BitVec 64))

(assert (=> b!194458 (= lt!97032 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000))))

(declare-fun lt!97034 () Unit!5878)

(assert (=> b!194458 (= lt!97034 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5954 lt!96671) lt!97032 #b00000000000000000000000000000000))))

(assert (=> b!194458 (arrayContainsKey!0 (_keys!5954 lt!96671) lt!97032 #b00000000000000000000000000000000)))

(declare-fun lt!97033 () Unit!5878)

(assert (=> b!194458 (= lt!97033 lt!97034)))

(declare-fun res!91911 () Bool)

(assert (=> b!194458 (= res!91911 (= (seekEntryOrOpen!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) (_keys!5954 lt!96671) (mask!9223 lt!96671)) (Found!694 #b00000000000000000000000000000000)))))

(assert (=> b!194458 (=> (not res!91911) (not e!127924))))

(declare-fun d!56793 () Bool)

(declare-fun res!91912 () Bool)

(assert (=> d!56793 (=> res!91912 e!127926)))

(assert (=> d!56793 (= res!91912 (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(assert (=> d!56793 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5954 lt!96671) (mask!9223 lt!96671)) e!127926)))

(declare-fun bm!19664 () Bool)

(assert (=> bm!19664 (= call!19667 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5954 lt!96671) (mask!9223 lt!96671)))))

(declare-fun b!194459 () Bool)

(assert (=> b!194459 (= e!127925 call!19667)))

(assert (= (and d!56793 (not res!91912)) b!194456))

(assert (= (and b!194456 c!35091) b!194458))

(assert (= (and b!194456 (not c!35091)) b!194459))

(assert (= (and b!194458 res!91911) b!194457))

(assert (= (or b!194457 b!194459) bm!19664))

(declare-fun m!221447 () Bool)

(assert (=> b!194456 m!221447))

(assert (=> b!194456 m!221447))

(declare-fun m!221449 () Bool)

(assert (=> b!194456 m!221449))

(assert (=> b!194458 m!221447))

(declare-fun m!221451 () Bool)

(assert (=> b!194458 m!221451))

(declare-fun m!221453 () Bool)

(assert (=> b!194458 m!221453))

(assert (=> b!194458 m!221447))

(declare-fun m!221455 () Bool)

(assert (=> b!194458 m!221455))

(declare-fun m!221457 () Bool)

(assert (=> bm!19664 m!221457))

(assert (=> b!194079 d!56793))

(declare-fun b!194461 () Bool)

(declare-fun e!127927 () Option!251)

(declare-fun e!127928 () Option!251)

(assert (=> b!194461 (= e!127927 e!127928)))

(declare-fun c!35093 () Bool)

(assert (=> b!194461 (= c!35093 (and ((_ is Cons!2445) (toList!1254 lt!96729)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96729))) (_1!1791 lt!96678)))))))

(declare-fun b!194460 () Bool)

(assert (=> b!194460 (= e!127927 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96729)))))))

(declare-fun b!194462 () Bool)

(assert (=> b!194462 (= e!127928 (getValueByKey!245 (t!7375 (toList!1254 lt!96729)) (_1!1791 lt!96678)))))

(declare-fun d!56795 () Bool)

(declare-fun c!35092 () Bool)

(assert (=> d!56795 (= c!35092 (and ((_ is Cons!2445) (toList!1254 lt!96729)) (= (_1!1791 (h!3086 (toList!1254 lt!96729))) (_1!1791 lt!96678))))))

(assert (=> d!56795 (= (getValueByKey!245 (toList!1254 lt!96729) (_1!1791 lt!96678)) e!127927)))

(declare-fun b!194463 () Bool)

(assert (=> b!194463 (= e!127928 None!249)))

(assert (= (and d!56795 c!35092) b!194460))

(assert (= (and d!56795 (not c!35092)) b!194461))

(assert (= (and b!194461 c!35093) b!194462))

(assert (= (and b!194461 (not c!35093)) b!194463))

(declare-fun m!221459 () Bool)

(assert (=> b!194462 m!221459))

(assert (=> b!194034 d!56795))

(declare-fun d!56797 () Bool)

(declare-fun res!91913 () Bool)

(declare-fun e!127929 () Bool)

(assert (=> d!56797 (=> res!91913 e!127929)))

(assert (=> d!56797 (= res!91913 (and ((_ is Cons!2445) (toList!1254 lt!96675)) (= (_1!1791 (h!3086 (toList!1254 lt!96675))) key!828)))))

(assert (=> d!56797 (= (containsKey!249 (toList!1254 lt!96675) key!828) e!127929)))

(declare-fun b!194464 () Bool)

(declare-fun e!127930 () Bool)

(assert (=> b!194464 (= e!127929 e!127930)))

(declare-fun res!91914 () Bool)

(assert (=> b!194464 (=> (not res!91914) (not e!127930))))

(assert (=> b!194464 (= res!91914 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96675))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96675))) key!828)) ((_ is Cons!2445) (toList!1254 lt!96675)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96675))) key!828)))))

(declare-fun b!194465 () Bool)

(assert (=> b!194465 (= e!127930 (containsKey!249 (t!7375 (toList!1254 lt!96675)) key!828))))

(assert (= (and d!56797 (not res!91913)) b!194464))

(assert (= (and b!194464 res!91914) b!194465))

(declare-fun m!221461 () Bool)

(assert (=> b!194465 m!221461))

(assert (=> d!56643 d!56797))

(declare-fun d!56799 () Bool)

(declare-fun e!127931 () Bool)

(assert (=> d!56799 e!127931))

(declare-fun res!91915 () Bool)

(assert (=> d!56799 (=> (not res!91915) (not e!127931))))

(declare-fun lt!97035 () ListLongMap!2477)

(assert (=> d!56799 (= res!91915 (contains!1379 lt!97035 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97038 () List!2449)

(assert (=> d!56799 (= lt!97035 (ListLongMap!2478 lt!97038))))

(declare-fun lt!97036 () Unit!5878)

(declare-fun lt!97037 () Unit!5878)

(assert (=> d!56799 (= lt!97036 lt!97037)))

(assert (=> d!56799 (= (getValueByKey!245 lt!97038 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!56799 (= lt!97037 (lemmaContainsTupThenGetReturnValue!132 lt!97038 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!56799 (= lt!97038 (insertStrictlySorted!135 (toList!1254 call!19641) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!56799 (= (+!322 call!19641 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) lt!97035)))

(declare-fun b!194466 () Bool)

(declare-fun res!91916 () Bool)

(assert (=> b!194466 (=> (not res!91916) (not e!127931))))

(assert (=> b!194466 (= res!91916 (= (getValueByKey!245 (toList!1254 lt!97035) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!194467 () Bool)

(assert (=> b!194467 (= e!127931 (contains!1381 (toList!1254 lt!97035) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(assert (= (and d!56799 res!91915) b!194466))

(assert (= (and b!194466 res!91916) b!194467))

(declare-fun m!221463 () Bool)

(assert (=> d!56799 m!221463))

(declare-fun m!221465 () Bool)

(assert (=> d!56799 m!221465))

(declare-fun m!221467 () Bool)

(assert (=> d!56799 m!221467))

(declare-fun m!221469 () Bool)

(assert (=> d!56799 m!221469))

(declare-fun m!221471 () Bool)

(assert (=> b!194466 m!221471))

(declare-fun m!221473 () Bool)

(assert (=> b!194467 m!221473))

(assert (=> b!194165 d!56799))

(assert (=> d!56649 d!56675))

(declare-fun b!194484 () Bool)

(declare-fun e!127943 () Bool)

(declare-fun call!19673 () Bool)

(assert (=> b!194484 (= e!127943 (not call!19673))))

(declare-fun lt!97041 () SeekEntryResult!694)

(declare-fun c!35099 () Bool)

(declare-fun call!19672 () Bool)

(declare-fun bm!19669 () Bool)

(assert (=> bm!19669 (= call!19672 (inRange!0 (ite c!35099 (index!4946 lt!97041) (index!4949 lt!97041)) (mask!9223 thiss!1248)))))

(declare-fun d!56801 () Bool)

(declare-fun e!127942 () Bool)

(assert (=> d!56801 e!127942))

(assert (=> d!56801 (= c!35099 ((_ is MissingZero!694) lt!97041))))

(assert (=> d!56801 (= lt!97041 (seekEntryOrOpen!0 key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(assert (=> d!56801 true))

(declare-fun _$34!1087 () Unit!5878)

(assert (=> d!56801 (= (choose!1063 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) key!828 (defaultEntry!3960 thiss!1248)) _$34!1087)))

(declare-fun b!194485 () Bool)

(declare-fun e!127940 () Bool)

(assert (=> b!194485 (= e!127942 e!127940)))

(declare-fun c!35098 () Bool)

(assert (=> b!194485 (= c!35098 ((_ is MissingVacant!694) lt!97041))))

(declare-fun b!194486 () Bool)

(declare-fun res!91928 () Bool)

(declare-fun e!127941 () Bool)

(assert (=> b!194486 (=> (not res!91928) (not e!127941))))

(assert (=> b!194486 (= res!91928 call!19672)))

(assert (=> b!194486 (= e!127940 e!127941)))

(declare-fun b!194487 () Bool)

(assert (=> b!194487 (= e!127941 (not call!19673))))

(declare-fun b!194488 () Bool)

(declare-fun res!91926 () Bool)

(assert (=> b!194488 (=> (not res!91926) (not e!127941))))

(assert (=> b!194488 (= res!91926 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4949 lt!97041)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19670 () Bool)

(assert (=> bm!19670 (= call!19673 (arrayContainsKey!0 (_keys!5954 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!194489 () Bool)

(declare-fun res!91927 () Bool)

(assert (=> b!194489 (= res!91927 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4946 lt!97041)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194489 (=> (not res!91927) (not e!127943))))

(declare-fun b!194490 () Bool)

(assert (=> b!194490 (= e!127940 ((_ is Undefined!694) lt!97041))))

(declare-fun b!194491 () Bool)

(assert (=> b!194491 (= e!127942 e!127943)))

(declare-fun res!91925 () Bool)

(assert (=> b!194491 (= res!91925 call!19672)))

(assert (=> b!194491 (=> (not res!91925) (not e!127943))))

(assert (= (and d!56801 c!35099) b!194491))

(assert (= (and d!56801 (not c!35099)) b!194485))

(assert (= (and b!194491 res!91925) b!194489))

(assert (= (and b!194489 res!91927) b!194484))

(assert (= (and b!194485 c!35098) b!194486))

(assert (= (and b!194485 (not c!35098)) b!194490))

(assert (= (and b!194486 res!91928) b!194488))

(assert (= (and b!194488 res!91926) b!194487))

(assert (= (or b!194491 b!194486) bm!19669))

(assert (= (or b!194484 b!194487) bm!19670))

(assert (=> bm!19670 m!220851))

(declare-fun m!221475 () Bool)

(assert (=> b!194489 m!221475))

(declare-fun m!221477 () Bool)

(assert (=> bm!19669 m!221477))

(declare-fun m!221479 () Bool)

(assert (=> b!194488 m!221479))

(assert (=> d!56801 m!220771))

(assert (=> d!56649 d!56801))

(assert (=> d!56649 d!56689))

(declare-fun d!56803 () Bool)

(declare-fun e!127944 () Bool)

(assert (=> d!56803 e!127944))

(declare-fun res!91929 () Bool)

(assert (=> d!56803 (=> (not res!91929) (not e!127944))))

(declare-fun lt!97042 () ListLongMap!2477)

(assert (=> d!56803 (= res!91929 (contains!1379 lt!97042 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97045 () List!2449)

(assert (=> d!56803 (= lt!97042 (ListLongMap!2478 lt!97045))))

(declare-fun lt!97043 () Unit!5878)

(declare-fun lt!97044 () Unit!5878)

(assert (=> d!56803 (= lt!97043 lt!97044)))

(assert (=> d!56803 (= (getValueByKey!245 lt!97045 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!56803 (= lt!97044 (lemmaContainsTupThenGetReturnValue!132 lt!97045 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!56803 (= lt!97045 (insertStrictlySorted!135 (toList!1254 call!19634) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!56803 (= (+!322 call!19634 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) lt!97042)))

(declare-fun b!194492 () Bool)

(declare-fun res!91930 () Bool)

(assert (=> b!194492 (=> (not res!91930) (not e!127944))))

(assert (=> b!194492 (= res!91930 (= (getValueByKey!245 (toList!1254 lt!97042) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!194493 () Bool)

(assert (=> b!194493 (= e!127944 (contains!1381 (toList!1254 lt!97042) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(assert (= (and d!56803 res!91929) b!194492))

(assert (= (and b!194492 res!91930) b!194493))

(declare-fun m!221481 () Bool)

(assert (=> d!56803 m!221481))

(declare-fun m!221483 () Bool)

(assert (=> d!56803 m!221483))

(declare-fun m!221485 () Bool)

(assert (=> d!56803 m!221485))

(declare-fun m!221487 () Bool)

(assert (=> d!56803 m!221487))

(declare-fun m!221489 () Bool)

(assert (=> b!194492 m!221489))

(declare-fun m!221491 () Bool)

(assert (=> b!194493 m!221491))

(assert (=> b!194131 d!56803))

(declare-fun d!56805 () Bool)

(assert (=> d!56805 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96676) key!828))))

(declare-fun lt!97046 () Unit!5878)

(assert (=> d!56805 (= lt!97046 (choose!1067 (toList!1254 lt!96676) key!828))))

(declare-fun e!127945 () Bool)

(assert (=> d!56805 e!127945))

(declare-fun res!91931 () Bool)

(assert (=> d!56805 (=> (not res!91931) (not e!127945))))

(assert (=> d!56805 (= res!91931 (isStrictlySorted!357 (toList!1254 lt!96676)))))

(assert (=> d!56805 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96676) key!828) lt!97046)))

(declare-fun b!194494 () Bool)

(assert (=> b!194494 (= e!127945 (containsKey!249 (toList!1254 lt!96676) key!828))))

(assert (= (and d!56805 res!91931) b!194494))

(assert (=> d!56805 m!220953))

(assert (=> d!56805 m!220953))

(assert (=> d!56805 m!220955))

(declare-fun m!221493 () Bool)

(assert (=> d!56805 m!221493))

(declare-fun m!221495 () Bool)

(assert (=> d!56805 m!221495))

(assert (=> b!194494 m!220949))

(assert (=> b!194154 d!56805))

(declare-fun d!56807 () Bool)

(assert (=> d!56807 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96676) key!828)) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96676) key!828))))))

(declare-fun bs!7744 () Bool)

(assert (= bs!7744 d!56807))

(assert (=> bs!7744 m!220953))

(declare-fun m!221497 () Bool)

(assert (=> bs!7744 m!221497))

(assert (=> b!194154 d!56807))

(declare-fun b!194496 () Bool)

(declare-fun e!127946 () Option!251)

(declare-fun e!127947 () Option!251)

(assert (=> b!194496 (= e!127946 e!127947)))

(declare-fun c!35101 () Bool)

(assert (=> b!194496 (= c!35101 (and ((_ is Cons!2445) (toList!1254 lt!96676)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96676))) key!828))))))

(declare-fun b!194495 () Bool)

(assert (=> b!194495 (= e!127946 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96676)))))))

(declare-fun b!194497 () Bool)

(assert (=> b!194497 (= e!127947 (getValueByKey!245 (t!7375 (toList!1254 lt!96676)) key!828))))

(declare-fun d!56809 () Bool)

(declare-fun c!35100 () Bool)

(assert (=> d!56809 (= c!35100 (and ((_ is Cons!2445) (toList!1254 lt!96676)) (= (_1!1791 (h!3086 (toList!1254 lt!96676))) key!828)))))

(assert (=> d!56809 (= (getValueByKey!245 (toList!1254 lt!96676) key!828) e!127946)))

(declare-fun b!194498 () Bool)

(assert (=> b!194498 (= e!127947 None!249)))

(assert (= (and d!56809 c!35100) b!194495))

(assert (= (and d!56809 (not c!35100)) b!194496))

(assert (= (and b!194496 c!35101) b!194497))

(assert (= (and b!194496 (not c!35101)) b!194498))

(declare-fun m!221499 () Bool)

(assert (=> b!194497 m!221499))

(assert (=> b!194154 d!56809))

(assert (=> b!194156 d!56807))

(assert (=> b!194156 d!56809))

(declare-fun d!56811 () Bool)

(assert (=> d!56811 (= (inRange!0 (index!4947 lt!96861) (mask!9223 thiss!1248)) (and (bvsge (index!4947 lt!96861) #b00000000000000000000000000000000) (bvslt (index!4947 lt!96861) (bvadd (mask!9223 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!194185 d!56811))

(assert (=> d!56653 d!56689))

(declare-fun d!56813 () Bool)

(assert (=> d!56813 (= (+!322 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) (tuple2!3561 key!828 v!309)) (getCurrentListMap!902 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))

(assert (=> d!56813 true))

(declare-fun _$5!158 () Unit!5878)

(assert (=> d!56813 (= (choose!1065 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (index!4947 lt!96677) key!828 v!309 (defaultEntry!3960 thiss!1248)) _$5!158)))

(declare-fun bs!7745 () Bool)

(assert (= bs!7745 d!56813))

(assert (=> bs!7745 m!220747))

(assert (=> bs!7745 m!220747))

(assert (=> bs!7745 m!221011))

(assert (=> bs!7745 m!220753))

(assert (=> bs!7745 m!221013))

(assert (=> d!56665 d!56813))

(assert (=> d!56665 d!56689))

(declare-fun d!56815 () Bool)

(assert (=> d!56815 (= (apply!188 lt!96845 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2238 (getValueByKey!245 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7746 () Bool)

(assert (= bs!7746 d!56815))

(declare-fun m!221501 () Bool)

(assert (=> bs!7746 m!221501))

(assert (=> bs!7746 m!221501))

(declare-fun m!221503 () Bool)

(assert (=> bs!7746 m!221503))

(assert (=> b!194158 d!56815))

(declare-fun d!56817 () Bool)

(declare-fun e!127949 () Bool)

(assert (=> d!56817 e!127949))

(declare-fun res!91932 () Bool)

(assert (=> d!56817 (=> res!91932 e!127949)))

(declare-fun lt!97047 () Bool)

(assert (=> d!56817 (= res!91932 (not lt!97047))))

(declare-fun lt!97048 () Bool)

(assert (=> d!56817 (= lt!97047 lt!97048)))

(declare-fun lt!97049 () Unit!5878)

(declare-fun e!127948 () Unit!5878)

(assert (=> d!56817 (= lt!97049 e!127948)))

(declare-fun c!35102 () Bool)

(assert (=> d!56817 (= c!35102 lt!97048)))

(assert (=> d!56817 (= lt!97048 (containsKey!249 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56817 (= (contains!1379 lt!96808 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97047)))

(declare-fun b!194499 () Bool)

(declare-fun lt!97050 () Unit!5878)

(assert (=> b!194499 (= e!127948 lt!97050)))

(assert (=> b!194499 (= lt!97050 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194499 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194500 () Bool)

(declare-fun Unit!5895 () Unit!5878)

(assert (=> b!194500 (= e!127948 Unit!5895)))

(declare-fun b!194501 () Bool)

(assert (=> b!194501 (= e!127949 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56817 c!35102) b!194499))

(assert (= (and d!56817 (not c!35102)) b!194500))

(assert (= (and d!56817 (not res!91932)) b!194501))

(declare-fun m!221505 () Bool)

(assert (=> d!56817 m!221505))

(declare-fun m!221507 () Bool)

(assert (=> b!194499 m!221507))

(declare-fun m!221509 () Bool)

(assert (=> b!194499 m!221509))

(assert (=> b!194499 m!221509))

(declare-fun m!221511 () Bool)

(assert (=> b!194499 m!221511))

(assert (=> b!194501 m!221509))

(assert (=> b!194501 m!221509))

(assert (=> b!194501 m!221511))

(assert (=> bm!19627 d!56817))

(assert (=> b!194173 d!56677))

(declare-fun b!194510 () Bool)

(declare-fun e!127954 () (_ BitVec 32))

(declare-fun call!19676 () (_ BitVec 32))

(assert (=> b!194510 (= e!127954 (bvadd #b00000000000000000000000000000001 call!19676))))

(declare-fun b!194511 () Bool)

(declare-fun e!127955 () (_ BitVec 32))

(assert (=> b!194511 (= e!127955 #b00000000000000000000000000000000)))

(declare-fun d!56819 () Bool)

(declare-fun lt!97053 () (_ BitVec 32))

(assert (=> d!56819 (and (bvsge lt!97053 #b00000000000000000000000000000000) (bvsle lt!97053 (bvsub (size!4199 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56819 (= lt!97053 e!127955)))

(declare-fun c!35107 () Bool)

(assert (=> d!56819 (= c!35107 (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!56819 (and (bvsle #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4199 (_keys!5954 thiss!1248)) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!56819 (= (arrayCountValidKeys!0 (_keys!5954 thiss!1248) #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))) lt!97053)))

(declare-fun bm!19673 () Bool)

(assert (=> bm!19673 (= call!19676 (arrayCountValidKeys!0 (_keys!5954 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194512 () Bool)

(assert (=> b!194512 (= e!127955 e!127954)))

(declare-fun c!35108 () Bool)

(assert (=> b!194512 (= c!35108 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194513 () Bool)

(assert (=> b!194513 (= e!127954 call!19676)))

(assert (= (and d!56819 c!35107) b!194511))

(assert (= (and d!56819 (not c!35107)) b!194512))

(assert (= (and b!194512 c!35108) b!194510))

(assert (= (and b!194512 (not c!35108)) b!194513))

(assert (= (or b!194510 b!194513) bm!19673))

(declare-fun m!221513 () Bool)

(assert (=> bm!19673 m!221513))

(assert (=> b!194512 m!220877))

(assert (=> b!194512 m!220877))

(assert (=> b!194512 m!220879))

(assert (=> b!194051 d!56819))

(declare-fun d!56821 () Bool)

(assert (=> d!56821 (= (apply!188 lt!96808 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2238 (getValueByKey!245 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7747 () Bool)

(assert (= bs!7747 d!56821))

(assert (=> bs!7747 m!221509))

(assert (=> bs!7747 m!221509))

(declare-fun m!221515 () Bool)

(assert (=> bs!7747 m!221515))

(assert (=> b!194124 d!56821))

(assert (=> b!194139 d!56677))

(declare-fun b!194524 () Bool)

(declare-fun e!127966 () Bool)

(declare-fun call!19679 () Bool)

(assert (=> b!194524 (= e!127966 call!19679)))

(declare-fun bm!19676 () Bool)

(declare-fun c!35111 () Bool)

(assert (=> bm!19676 (= call!19679 (arrayNoDuplicates!0 (_keys!5954 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35111 (Cons!2447 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) Nil!2448) Nil!2448)))))

(declare-fun b!194525 () Bool)

(declare-fun e!127965 () Bool)

(declare-fun contains!1382 (List!2451 (_ BitVec 64)) Bool)

(assert (=> b!194525 (= e!127965 (contains!1382 Nil!2448 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194526 () Bool)

(declare-fun e!127967 () Bool)

(assert (=> b!194526 (= e!127967 e!127966)))

(assert (=> b!194526 (= c!35111 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56823 () Bool)

(declare-fun res!91941 () Bool)

(declare-fun e!127964 () Bool)

(assert (=> d!56823 (=> res!91941 e!127964)))

(assert (=> d!56823 (= res!91941 (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!56823 (= (arrayNoDuplicates!0 (_keys!5954 thiss!1248) #b00000000000000000000000000000000 Nil!2448) e!127964)))

(declare-fun b!194527 () Bool)

(assert (=> b!194527 (= e!127964 e!127967)))

(declare-fun res!91940 () Bool)

(assert (=> b!194527 (=> (not res!91940) (not e!127967))))

(assert (=> b!194527 (= res!91940 (not e!127965))))

(declare-fun res!91939 () Bool)

(assert (=> b!194527 (=> (not res!91939) (not e!127965))))

(assert (=> b!194527 (= res!91939 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194528 () Bool)

(assert (=> b!194528 (= e!127966 call!19679)))

(assert (= (and d!56823 (not res!91941)) b!194527))

(assert (= (and b!194527 res!91939) b!194525))

(assert (= (and b!194527 res!91940) b!194526))

(assert (= (and b!194526 c!35111) b!194528))

(assert (= (and b!194526 (not c!35111)) b!194524))

(assert (= (or b!194528 b!194524) bm!19676))

(assert (=> bm!19676 m!220877))

(declare-fun m!221517 () Bool)

(assert (=> bm!19676 m!221517))

(assert (=> b!194525 m!220877))

(assert (=> b!194525 m!220877))

(declare-fun m!221519 () Bool)

(assert (=> b!194525 m!221519))

(assert (=> b!194526 m!220877))

(assert (=> b!194526 m!220877))

(assert (=> b!194526 m!220879))

(assert (=> b!194527 m!220877))

(assert (=> b!194527 m!220877))

(assert (=> b!194527 m!220879))

(assert (=> b!194053 d!56823))

(declare-fun b!194530 () Bool)

(declare-fun e!127968 () Option!251)

(declare-fun e!127969 () Option!251)

(assert (=> b!194530 (= e!127968 e!127969)))

(declare-fun c!35113 () Bool)

(assert (=> b!194530 (= c!35113 (and ((_ is Cons!2445) (toList!1254 lt!96817)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96817))) (_1!1791 lt!96678)))))))

(declare-fun b!194529 () Bool)

(assert (=> b!194529 (= e!127968 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96817)))))))

(declare-fun b!194531 () Bool)

(assert (=> b!194531 (= e!127969 (getValueByKey!245 (t!7375 (toList!1254 lt!96817)) (_1!1791 lt!96678)))))

(declare-fun d!56825 () Bool)

(declare-fun c!35112 () Bool)

(assert (=> d!56825 (= c!35112 (and ((_ is Cons!2445) (toList!1254 lt!96817)) (= (_1!1791 (h!3086 (toList!1254 lt!96817))) (_1!1791 lt!96678))))))

(assert (=> d!56825 (= (getValueByKey!245 (toList!1254 lt!96817) (_1!1791 lt!96678)) e!127968)))

(declare-fun b!194532 () Bool)

(assert (=> b!194532 (= e!127969 None!249)))

(assert (= (and d!56825 c!35112) b!194529))

(assert (= (and d!56825 (not c!35112)) b!194530))

(assert (= (and b!194530 c!35113) b!194531))

(assert (= (and b!194530 (not c!35113)) b!194532))

(declare-fun m!221521 () Bool)

(assert (=> b!194531 m!221521))

(assert (=> b!194146 d!56825))

(declare-fun d!56827 () Bool)

(declare-fun res!91946 () Bool)

(declare-fun e!127974 () Bool)

(assert (=> d!56827 (=> res!91946 e!127974)))

(assert (=> d!56827 (= res!91946 (= (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56827 (= (arrayContainsKey!0 (_keys!5954 thiss!1248) key!828 #b00000000000000000000000000000000) e!127974)))

(declare-fun b!194537 () Bool)

(declare-fun e!127975 () Bool)

(assert (=> b!194537 (= e!127974 e!127975)))

(declare-fun res!91947 () Bool)

(assert (=> b!194537 (=> (not res!91947) (not e!127975))))

(assert (=> b!194537 (= res!91947 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194538 () Bool)

(assert (=> b!194538 (= e!127975 (arrayContainsKey!0 (_keys!5954 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56827 (not res!91946)) b!194537))

(assert (= (and b!194537 res!91947) b!194538))

(assert (=> d!56827 m!220877))

(declare-fun m!221523 () Bool)

(assert (=> b!194538 m!221523))

(assert (=> bm!19611 d!56827))

(declare-fun d!56829 () Bool)

(assert (=> d!56829 (= (apply!188 lt!96845 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2238 (getValueByKey!245 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7748 () Bool)

(assert (= bs!7748 d!56829))

(assert (=> bs!7748 m!220877))

(declare-fun m!221525 () Bool)

(assert (=> bs!7748 m!221525))

(assert (=> bs!7748 m!221525))

(declare-fun m!221527 () Bool)

(assert (=> bs!7748 m!221527))

(assert (=> b!194163 d!56829))

(declare-fun d!56831 () Bool)

(declare-fun c!35116 () Bool)

(assert (=> d!56831 (= c!35116 ((_ is ValueCellFull!1902) (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!127978 () V!5635)

(assert (=> d!56831 (= (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!127978)))

(declare-fun b!194543 () Bool)

(declare-fun get!2239 (ValueCell!1902 V!5635) V!5635)

(assert (=> b!194543 (= e!127978 (get!2239 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194544 () Bool)

(declare-fun get!2240 (ValueCell!1902 V!5635) V!5635)

(assert (=> b!194544 (= e!127978 (get!2240 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56831 c!35116) b!194543))

(assert (= (and d!56831 (not c!35116)) b!194544))

(assert (=> b!194543 m!220969))

(assert (=> b!194543 m!220881))

(declare-fun m!221529 () Bool)

(assert (=> b!194543 m!221529))

(assert (=> b!194544 m!220969))

(assert (=> b!194544 m!220881))

(declare-fun m!221531 () Bool)

(assert (=> b!194544 m!221531))

(assert (=> b!194163 d!56831))

(declare-fun b!194545 () Bool)

(declare-fun e!127979 () (_ BitVec 32))

(declare-fun call!19680 () (_ BitVec 32))

(assert (=> b!194545 (= e!127979 (bvadd #b00000000000000000000000000000001 call!19680))))

(declare-fun b!194546 () Bool)

(declare-fun e!127980 () (_ BitVec 32))

(assert (=> b!194546 (= e!127980 #b00000000000000000000000000000000)))

(declare-fun d!56833 () Bool)

(declare-fun lt!97054 () (_ BitVec 32))

(assert (=> d!56833 (and (bvsge lt!97054 #b00000000000000000000000000000000) (bvsle lt!97054 (bvsub (size!4199 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(assert (=> d!56833 (= lt!97054 e!127980)))

(declare-fun c!35117 () Bool)

(assert (=> d!56833 (= c!35117 (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(assert (=> d!56833 (and (bvsle #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4199 (_keys!5954 lt!96671)) (size!4199 (_keys!5954 lt!96671))))))

(assert (=> d!56833 (= (arrayCountValidKeys!0 (_keys!5954 lt!96671) #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))) lt!97054)))

(declare-fun bm!19677 () Bool)

(assert (=> bm!19677 (= call!19680 (arrayCountValidKeys!0 (_keys!5954 lt!96671) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 lt!96671))))))

(declare-fun b!194547 () Bool)

(assert (=> b!194547 (= e!127980 e!127979)))

(declare-fun c!35118 () Bool)

(assert (=> b!194547 (= c!35118 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun b!194548 () Bool)

(assert (=> b!194548 (= e!127979 call!19680)))

(assert (= (and d!56833 c!35117) b!194546))

(assert (= (and d!56833 (not c!35117)) b!194547))

(assert (= (and b!194547 c!35118) b!194545))

(assert (= (and b!194547 (not c!35118)) b!194548))

(assert (= (or b!194545 b!194548) bm!19677))

(declare-fun m!221533 () Bool)

(assert (=> bm!19677 m!221533))

(assert (=> b!194547 m!221447))

(assert (=> b!194547 m!221447))

(assert (=> b!194547 m!221449))

(assert (=> b!194078 d!56833))

(assert (=> d!56641 d!56663))

(declare-fun b!194561 () Bool)

(declare-fun e!127988 () SeekEntryResult!694)

(declare-fun e!127989 () SeekEntryResult!694)

(assert (=> b!194561 (= e!127988 e!127989)))

(declare-fun c!35126 () Bool)

(declare-fun lt!97059 () (_ BitVec 64))

(assert (=> b!194561 (= c!35126 (= lt!97059 key!828))))

(declare-fun b!194562 () Bool)

(declare-fun c!35127 () Bool)

(assert (=> b!194562 (= c!35127 (= lt!97059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127987 () SeekEntryResult!694)

(assert (=> b!194562 (= e!127989 e!127987)))

(declare-fun b!194563 () Bool)

(assert (=> b!194563 (= e!127989 (Found!694 (index!4948 lt!96869)))))

(declare-fun b!194564 () Bool)

(assert (=> b!194564 (= e!127988 Undefined!694)))

(declare-fun b!194565 () Bool)

(assert (=> b!194565 (= e!127987 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20690 lt!96869) #b00000000000000000000000000000001) (nextIndex!0 (index!4948 lt!96869) (x!20690 lt!96869) (mask!9223 thiss!1248)) (index!4948 lt!96869) key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun b!194566 () Bool)

(assert (=> b!194566 (= e!127987 (MissingVacant!694 (index!4948 lt!96869)))))

(declare-fun d!56835 () Bool)

(declare-fun lt!97060 () SeekEntryResult!694)

(assert (=> d!56835 (and (or ((_ is Undefined!694) lt!97060) (not ((_ is Found!694) lt!97060)) (and (bvsge (index!4947 lt!97060) #b00000000000000000000000000000000) (bvslt (index!4947 lt!97060) (size!4199 (_keys!5954 thiss!1248))))) (or ((_ is Undefined!694) lt!97060) ((_ is Found!694) lt!97060) (not ((_ is MissingVacant!694) lt!97060)) (not (= (index!4949 lt!97060) (index!4948 lt!96869))) (and (bvsge (index!4949 lt!97060) #b00000000000000000000000000000000) (bvslt (index!4949 lt!97060) (size!4199 (_keys!5954 thiss!1248))))) (or ((_ is Undefined!694) lt!97060) (ite ((_ is Found!694) lt!97060) (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!97060)) key!828) (and ((_ is MissingVacant!694) lt!97060) (= (index!4949 lt!97060) (index!4948 lt!96869)) (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4949 lt!97060)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!56835 (= lt!97060 e!127988)))

(declare-fun c!35125 () Bool)

(assert (=> d!56835 (= c!35125 (bvsge (x!20690 lt!96869) #b01111111111111111111111111111110))))

(assert (=> d!56835 (= lt!97059 (select (arr!3875 (_keys!5954 thiss!1248)) (index!4948 lt!96869)))))

(assert (=> d!56835 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56835 (= (seekKeyOrZeroReturnVacant!0 (x!20690 lt!96869) (index!4948 lt!96869) (index!4948 lt!96869) key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)) lt!97060)))

(assert (= (and d!56835 c!35125) b!194564))

(assert (= (and d!56835 (not c!35125)) b!194561))

(assert (= (and b!194561 c!35126) b!194563))

(assert (= (and b!194561 (not c!35126)) b!194562))

(assert (= (and b!194562 c!35127) b!194566))

(assert (= (and b!194562 (not c!35127)) b!194565))

(declare-fun m!221535 () Bool)

(assert (=> b!194565 m!221535))

(assert (=> b!194565 m!221535))

(declare-fun m!221537 () Bool)

(assert (=> b!194565 m!221537))

(declare-fun m!221539 () Bool)

(assert (=> d!56835 m!221539))

(declare-fun m!221541 () Bool)

(assert (=> d!56835 m!221541))

(assert (=> d!56835 m!221021))

(assert (=> d!56835 m!220855))

(assert (=> b!194200 d!56835))

(declare-fun d!56837 () Bool)

(assert (=> d!56837 (= (apply!188 lt!96808 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2238 (getValueByKey!245 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7749 () Bool)

(assert (= bs!7749 d!56837))

(assert (=> bs!7749 m!220877))

(declare-fun m!221543 () Bool)

(assert (=> bs!7749 m!221543))

(assert (=> bs!7749 m!221543))

(declare-fun m!221545 () Bool)

(assert (=> bs!7749 m!221545))

(assert (=> b!194129 d!56837))

(declare-fun d!56839 () Bool)

(declare-fun c!35128 () Bool)

(assert (=> d!56839 (= c!35128 ((_ is ValueCellFull!1902) (select (arr!3876 lt!96681) #b00000000000000000000000000000000)))))

(declare-fun e!127990 () V!5635)

(assert (=> d!56839 (= (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!127990)))

(declare-fun b!194567 () Bool)

(assert (=> b!194567 (= e!127990 (get!2239 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194568 () Bool)

(assert (=> b!194568 (= e!127990 (get!2240 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56839 c!35128) b!194567))

(assert (= (and d!56839 (not c!35128)) b!194568))

(assert (=> b!194567 m!220885))

(assert (=> b!194567 m!220881))

(declare-fun m!221547 () Bool)

(assert (=> b!194567 m!221547))

(assert (=> b!194568 m!220885))

(assert (=> b!194568 m!220881))

(declare-fun m!221549 () Bool)

(assert (=> b!194568 m!221549))

(assert (=> b!194129 d!56839))

(declare-fun b!194569 () Bool)

(declare-fun e!127993 () Bool)

(declare-fun call!19681 () Bool)

(assert (=> b!194569 (= e!127993 call!19681)))

(declare-fun bm!19678 () Bool)

(declare-fun c!35129 () Bool)

(assert (=> bm!19678 (= call!19681 (arrayNoDuplicates!0 (_keys!5954 lt!96671) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35129 (Cons!2447 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) Nil!2448) Nil!2448)))))

(declare-fun b!194570 () Bool)

(declare-fun e!127992 () Bool)

(assert (=> b!194570 (= e!127992 (contains!1382 Nil!2448 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun b!194571 () Bool)

(declare-fun e!127994 () Bool)

(assert (=> b!194571 (= e!127994 e!127993)))

(assert (=> b!194571 (= c!35129 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun d!56841 () Bool)

(declare-fun res!91950 () Bool)

(declare-fun e!127991 () Bool)

(assert (=> d!56841 (=> res!91950 e!127991)))

(assert (=> d!56841 (= res!91950 (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(assert (=> d!56841 (= (arrayNoDuplicates!0 (_keys!5954 lt!96671) #b00000000000000000000000000000000 Nil!2448) e!127991)))

(declare-fun b!194572 () Bool)

(assert (=> b!194572 (= e!127991 e!127994)))

(declare-fun res!91949 () Bool)

(assert (=> b!194572 (=> (not res!91949) (not e!127994))))

(assert (=> b!194572 (= res!91949 (not e!127992))))

(declare-fun res!91948 () Bool)

(assert (=> b!194572 (=> (not res!91948) (not e!127992))))

(assert (=> b!194572 (= res!91948 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun b!194573 () Bool)

(assert (=> b!194573 (= e!127993 call!19681)))

(assert (= (and d!56841 (not res!91950)) b!194572))

(assert (= (and b!194572 res!91948) b!194570))

(assert (= (and b!194572 res!91949) b!194571))

(assert (= (and b!194571 c!35129) b!194573))

(assert (= (and b!194571 (not c!35129)) b!194569))

(assert (= (or b!194573 b!194569) bm!19678))

(assert (=> bm!19678 m!221447))

(declare-fun m!221551 () Bool)

(assert (=> bm!19678 m!221551))

(assert (=> b!194570 m!221447))

(assert (=> b!194570 m!221447))

(declare-fun m!221553 () Bool)

(assert (=> b!194570 m!221553))

(assert (=> b!194571 m!221447))

(assert (=> b!194571 m!221447))

(assert (=> b!194571 m!221449))

(assert (=> b!194572 m!221447))

(assert (=> b!194572 m!221447))

(assert (=> b!194572 m!221449))

(assert (=> b!194080 d!56841))

(assert (=> d!56667 d!56675))

(declare-fun d!56843 () Bool)

(declare-fun e!127997 () Bool)

(assert (=> d!56843 e!127997))

(declare-fun res!91956 () Bool)

(assert (=> d!56843 (=> (not res!91956) (not e!127997))))

(declare-fun lt!97063 () SeekEntryResult!694)

(assert (=> d!56843 (= res!91956 ((_ is Found!694) lt!97063))))

(assert (=> d!56843 (= lt!97063 (seekEntryOrOpen!0 key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(assert (=> d!56843 true))

(declare-fun _$33!150 () Unit!5878)

(assert (=> d!56843 (= (choose!1066 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) key!828 (defaultEntry!3960 thiss!1248)) _$33!150)))

(declare-fun b!194578 () Bool)

(declare-fun res!91955 () Bool)

(assert (=> b!194578 (=> (not res!91955) (not e!127997))))

(assert (=> b!194578 (= res!91955 (inRange!0 (index!4947 lt!97063) (mask!9223 thiss!1248)))))

(declare-fun b!194579 () Bool)

(assert (=> b!194579 (= e!127997 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!97063)) key!828))))

(assert (= (and d!56843 res!91956) b!194578))

(assert (= (and b!194578 res!91955) b!194579))

(assert (=> d!56843 m!220771))

(declare-fun m!221555 () Bool)

(assert (=> b!194578 m!221555))

(declare-fun m!221557 () Bool)

(assert (=> b!194579 m!221557))

(assert (=> d!56667 d!56843))

(assert (=> d!56667 d!56689))

(assert (=> b!194150 d!56757))

(assert (=> b!194150 d!56759))

(declare-fun d!56845 () Bool)

(declare-fun e!127999 () Bool)

(assert (=> d!56845 e!127999))

(declare-fun res!91957 () Bool)

(assert (=> d!56845 (=> res!91957 e!127999)))

(declare-fun lt!97064 () Bool)

(assert (=> d!56845 (= res!91957 (not lt!97064))))

(declare-fun lt!97065 () Bool)

(assert (=> d!56845 (= lt!97064 lt!97065)))

(declare-fun lt!97066 () Unit!5878)

(declare-fun e!127998 () Unit!5878)

(assert (=> d!56845 (= lt!97066 e!127998)))

(declare-fun c!35130 () Bool)

(assert (=> d!56845 (= c!35130 lt!97065)))

(assert (=> d!56845 (= lt!97065 (containsKey!249 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56845 (= (contains!1379 lt!96808 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97064)))

(declare-fun b!194580 () Bool)

(declare-fun lt!97067 () Unit!5878)

(assert (=> b!194580 (= e!127998 lt!97067)))

(assert (=> b!194580 (= lt!97067 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194580 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194581 () Bool)

(declare-fun Unit!5896 () Unit!5878)

(assert (=> b!194581 (= e!127998 Unit!5896)))

(declare-fun b!194582 () Bool)

(assert (=> b!194582 (= e!127999 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56845 c!35130) b!194580))

(assert (= (and d!56845 (not c!35130)) b!194581))

(assert (= (and d!56845 (not res!91957)) b!194582))

(declare-fun m!221559 () Bool)

(assert (=> d!56845 m!221559))

(declare-fun m!221561 () Bool)

(assert (=> b!194580 m!221561))

(declare-fun m!221563 () Bool)

(assert (=> b!194580 m!221563))

(assert (=> b!194580 m!221563))

(declare-fun m!221565 () Bool)

(assert (=> b!194580 m!221565))

(assert (=> b!194582 m!221563))

(assert (=> b!194582 m!221563))

(assert (=> b!194582 m!221565))

(assert (=> bm!19629 d!56845))

(assert (=> bm!19639 d!56717))

(declare-fun d!56847 () Bool)

(declare-fun lt!97068 () Bool)

(assert (=> d!56847 (= lt!97068 (select (content!155 (toList!1254 lt!96729)) lt!96678))))

(declare-fun e!128001 () Bool)

(assert (=> d!56847 (= lt!97068 e!128001)))

(declare-fun res!91958 () Bool)

(assert (=> d!56847 (=> (not res!91958) (not e!128001))))

(assert (=> d!56847 (= res!91958 ((_ is Cons!2445) (toList!1254 lt!96729)))))

(assert (=> d!56847 (= (contains!1381 (toList!1254 lt!96729) lt!96678) lt!97068)))

(declare-fun b!194583 () Bool)

(declare-fun e!128000 () Bool)

(assert (=> b!194583 (= e!128001 e!128000)))

(declare-fun res!91959 () Bool)

(assert (=> b!194583 (=> res!91959 e!128000)))

(assert (=> b!194583 (= res!91959 (= (h!3086 (toList!1254 lt!96729)) lt!96678))))

(declare-fun b!194584 () Bool)

(assert (=> b!194584 (= e!128000 (contains!1381 (t!7375 (toList!1254 lt!96729)) lt!96678))))

(assert (= (and d!56847 res!91958) b!194583))

(assert (= (and b!194583 (not res!91959)) b!194584))

(declare-fun m!221567 () Bool)

(assert (=> d!56847 m!221567))

(declare-fun m!221569 () Bool)

(assert (=> d!56847 m!221569))

(declare-fun m!221571 () Bool)

(assert (=> b!194584 m!221571))

(assert (=> b!194035 d!56847))

(declare-fun d!56849 () Bool)

(declare-fun e!128003 () Bool)

(assert (=> d!56849 e!128003))

(declare-fun res!91960 () Bool)

(assert (=> d!56849 (=> res!91960 e!128003)))

(declare-fun lt!97069 () Bool)

(assert (=> d!56849 (= res!91960 (not lt!97069))))

(declare-fun lt!97070 () Bool)

(assert (=> d!56849 (= lt!97069 lt!97070)))

(declare-fun lt!97071 () Unit!5878)

(declare-fun e!128002 () Unit!5878)

(assert (=> d!56849 (= lt!97071 e!128002)))

(declare-fun c!35131 () Bool)

(assert (=> d!56849 (= c!35131 lt!97070)))

(assert (=> d!56849 (= lt!97070 (containsKey!249 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56849 (= (contains!1379 lt!96845 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) lt!97069)))

(declare-fun b!194585 () Bool)

(declare-fun lt!97072 () Unit!5878)

(assert (=> b!194585 (= e!128002 lt!97072)))

(assert (=> b!194585 (= lt!97072 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194585 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194586 () Bool)

(declare-fun Unit!5897 () Unit!5878)

(assert (=> b!194586 (= e!128002 Unit!5897)))

(declare-fun b!194587 () Bool)

(assert (=> b!194587 (= e!128003 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56849 c!35131) b!194585))

(assert (= (and d!56849 (not c!35131)) b!194586))

(assert (= (and d!56849 (not res!91960)) b!194587))

(assert (=> d!56849 m!220877))

(declare-fun m!221573 () Bool)

(assert (=> d!56849 m!221573))

(assert (=> b!194585 m!220877))

(declare-fun m!221575 () Bool)

(assert (=> b!194585 m!221575))

(assert (=> b!194585 m!220877))

(assert (=> b!194585 m!221525))

(assert (=> b!194585 m!221525))

(declare-fun m!221577 () Bool)

(assert (=> b!194585 m!221577))

(assert (=> b!194587 m!220877))

(assert (=> b!194587 m!221525))

(assert (=> b!194587 m!221525))

(assert (=> b!194587 m!221577))

(assert (=> b!194166 d!56849))

(assert (=> bm!19632 d!56791))

(declare-fun bm!19679 () Bool)

(declare-fun call!19687 () Bool)

(declare-fun lt!97086 () ListLongMap!2477)

(assert (=> bm!19679 (= call!19687 (contains!1379 lt!97086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194588 () Bool)

(declare-fun e!128006 () Bool)

(assert (=> b!194588 (= e!128006 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun b!194589 () Bool)

(declare-fun e!128010 () Bool)

(assert (=> b!194589 (= e!128010 (= (apply!188 lt!97086 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3801 lt!96671)))))

(declare-fun b!194590 () Bool)

(declare-fun e!128016 () Bool)

(declare-fun call!19688 () Bool)

(assert (=> b!194590 (= e!128016 (not call!19688))))

(declare-fun b!194591 () Bool)

(declare-fun e!128005 () ListLongMap!2477)

(declare-fun call!19682 () ListLongMap!2477)

(assert (=> b!194591 (= e!128005 call!19682)))

(declare-fun call!19685 () ListLongMap!2477)

(declare-fun c!35135 () Bool)

(declare-fun c!35134 () Bool)

(declare-fun call!19684 () ListLongMap!2477)

(declare-fun bm!19680 () Bool)

(declare-fun call!19686 () ListLongMap!2477)

(assert (=> bm!19680 (= call!19686 (+!322 (ite c!35134 call!19685 (ite c!35135 call!19684 call!19682)) (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))))))

(declare-fun b!194592 () Bool)

(declare-fun call!19683 () ListLongMap!2477)

(assert (=> b!194592 (= e!128005 call!19683)))

(declare-fun b!194593 () Bool)

(declare-fun e!128015 () Unit!5878)

(declare-fun lt!97082 () Unit!5878)

(assert (=> b!194593 (= e!128015 lt!97082)))

(declare-fun lt!97077 () ListLongMap!2477)

(assert (=> b!194593 (= lt!97077 (getCurrentListMapNoExtraKeys!221 (_keys!5954 lt!96671) (_values!3943 lt!96671) (mask!9223 lt!96671) (extraKeys!3697 lt!96671) (zeroValue!3801 lt!96671) (minValue!3801 lt!96671) #b00000000000000000000000000000000 (defaultEntry!3960 lt!96671)))))

(declare-fun lt!97093 () (_ BitVec 64))

(assert (=> b!194593 (= lt!97093 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97073 () (_ BitVec 64))

(assert (=> b!194593 (= lt!97073 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000))))

(declare-fun lt!97084 () Unit!5878)

(assert (=> b!194593 (= lt!97084 (addStillContains!164 lt!97077 lt!97093 (zeroValue!3801 lt!96671) lt!97073))))

(assert (=> b!194593 (contains!1379 (+!322 lt!97077 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671))) lt!97073)))

(declare-fun lt!97092 () Unit!5878)

(assert (=> b!194593 (= lt!97092 lt!97084)))

(declare-fun lt!97079 () ListLongMap!2477)

(assert (=> b!194593 (= lt!97079 (getCurrentListMapNoExtraKeys!221 (_keys!5954 lt!96671) (_values!3943 lt!96671) (mask!9223 lt!96671) (extraKeys!3697 lt!96671) (zeroValue!3801 lt!96671) (minValue!3801 lt!96671) #b00000000000000000000000000000000 (defaultEntry!3960 lt!96671)))))

(declare-fun lt!97087 () (_ BitVec 64))

(assert (=> b!194593 (= lt!97087 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97091 () (_ BitVec 64))

(assert (=> b!194593 (= lt!97091 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000))))

(declare-fun lt!97088 () Unit!5878)

(assert (=> b!194593 (= lt!97088 (addApplyDifferent!164 lt!97079 lt!97087 (minValue!3801 lt!96671) lt!97091))))

(assert (=> b!194593 (= (apply!188 (+!322 lt!97079 (tuple2!3561 lt!97087 (minValue!3801 lt!96671))) lt!97091) (apply!188 lt!97079 lt!97091))))

(declare-fun lt!97074 () Unit!5878)

(assert (=> b!194593 (= lt!97074 lt!97088)))

(declare-fun lt!97089 () ListLongMap!2477)

(assert (=> b!194593 (= lt!97089 (getCurrentListMapNoExtraKeys!221 (_keys!5954 lt!96671) (_values!3943 lt!96671) (mask!9223 lt!96671) (extraKeys!3697 lt!96671) (zeroValue!3801 lt!96671) (minValue!3801 lt!96671) #b00000000000000000000000000000000 (defaultEntry!3960 lt!96671)))))

(declare-fun lt!97080 () (_ BitVec 64))

(assert (=> b!194593 (= lt!97080 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97075 () (_ BitVec 64))

(assert (=> b!194593 (= lt!97075 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000))))

(declare-fun lt!97090 () Unit!5878)

(assert (=> b!194593 (= lt!97090 (addApplyDifferent!164 lt!97089 lt!97080 (zeroValue!3801 lt!96671) lt!97075))))

(assert (=> b!194593 (= (apply!188 (+!322 lt!97089 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671))) lt!97075) (apply!188 lt!97089 lt!97075))))

(declare-fun lt!97078 () Unit!5878)

(assert (=> b!194593 (= lt!97078 lt!97090)))

(declare-fun lt!97094 () ListLongMap!2477)

(assert (=> b!194593 (= lt!97094 (getCurrentListMapNoExtraKeys!221 (_keys!5954 lt!96671) (_values!3943 lt!96671) (mask!9223 lt!96671) (extraKeys!3697 lt!96671) (zeroValue!3801 lt!96671) (minValue!3801 lt!96671) #b00000000000000000000000000000000 (defaultEntry!3960 lt!96671)))))

(declare-fun lt!97085 () (_ BitVec 64))

(assert (=> b!194593 (= lt!97085 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97076 () (_ BitVec 64))

(assert (=> b!194593 (= lt!97076 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000))))

(assert (=> b!194593 (= lt!97082 (addApplyDifferent!164 lt!97094 lt!97085 (minValue!3801 lt!96671) lt!97076))))

(assert (=> b!194593 (= (apply!188 (+!322 lt!97094 (tuple2!3561 lt!97085 (minValue!3801 lt!96671))) lt!97076) (apply!188 lt!97094 lt!97076))))

(declare-fun b!194594 () Bool)

(declare-fun e!128007 () Bool)

(assert (=> b!194594 (= e!128007 (= (apply!188 lt!97086 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)) (get!2237 (select (arr!3876 (_values!3943 lt!96671)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 lt!96671) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194594 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4200 (_values!3943 lt!96671))))))

(assert (=> b!194594 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(declare-fun d!56851 () Bool)

(declare-fun e!128008 () Bool)

(assert (=> d!56851 e!128008))

(declare-fun res!91969 () Bool)

(assert (=> d!56851 (=> (not res!91969) (not e!128008))))

(assert (=> d!56851 (= res!91969 (or (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))))

(declare-fun lt!97083 () ListLongMap!2477)

(assert (=> d!56851 (= lt!97086 lt!97083)))

(declare-fun lt!97081 () Unit!5878)

(assert (=> d!56851 (= lt!97081 e!128015)))

(declare-fun c!35137 () Bool)

(assert (=> d!56851 (= c!35137 e!128006)))

(declare-fun res!91964 () Bool)

(assert (=> d!56851 (=> (not res!91964) (not e!128006))))

(assert (=> d!56851 (= res!91964 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(declare-fun e!128014 () ListLongMap!2477)

(assert (=> d!56851 (= lt!97083 e!128014)))

(assert (=> d!56851 (= c!35134 (and (not (= (bvand (extraKeys!3697 lt!96671) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3697 lt!96671) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56851 (validMask!0 (mask!9223 lt!96671))))

(assert (=> d!56851 (= (getCurrentListMap!902 (_keys!5954 lt!96671) (_values!3943 lt!96671) (mask!9223 lt!96671) (extraKeys!3697 lt!96671) (zeroValue!3801 lt!96671) (minValue!3801 lt!96671) #b00000000000000000000000000000000 (defaultEntry!3960 lt!96671)) lt!97086)))

(declare-fun bm!19681 () Bool)

(assert (=> bm!19681 (= call!19688 (contains!1379 lt!97086 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194595 () Bool)

(declare-fun e!128004 () ListLongMap!2477)

(assert (=> b!194595 (= e!128004 call!19683)))

(declare-fun bm!19682 () Bool)

(assert (=> bm!19682 (= call!19683 call!19686)))

(declare-fun bm!19683 () Bool)

(assert (=> bm!19683 (= call!19682 call!19684)))

(declare-fun bm!19684 () Bool)

(assert (=> bm!19684 (= call!19685 (getCurrentListMapNoExtraKeys!221 (_keys!5954 lt!96671) (_values!3943 lt!96671) (mask!9223 lt!96671) (extraKeys!3697 lt!96671) (zeroValue!3801 lt!96671) (minValue!3801 lt!96671) #b00000000000000000000000000000000 (defaultEntry!3960 lt!96671)))))

(declare-fun b!194596 () Bool)

(assert (=> b!194596 (= e!128014 (+!322 call!19686 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))))))

(declare-fun b!194597 () Bool)

(declare-fun e!128013 () Bool)

(assert (=> b!194597 (= e!128013 e!128007)))

(declare-fun res!91961 () Bool)

(assert (=> b!194597 (=> (not res!91961) (not e!128007))))

(assert (=> b!194597 (= res!91961 (contains!1379 lt!97086 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(assert (=> b!194597 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(declare-fun b!194598 () Bool)

(assert (=> b!194598 (= e!128014 e!128004)))

(assert (=> b!194598 (= c!35135 (and (not (= (bvand (extraKeys!3697 lt!96671) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3697 lt!96671) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194599 () Bool)

(declare-fun res!91967 () Bool)

(assert (=> b!194599 (=> (not res!91967) (not e!128008))))

(assert (=> b!194599 (= res!91967 e!128013)))

(declare-fun res!91962 () Bool)

(assert (=> b!194599 (=> res!91962 e!128013)))

(declare-fun e!128009 () Bool)

(assert (=> b!194599 (= res!91962 (not e!128009))))

(declare-fun res!91963 () Bool)

(assert (=> b!194599 (=> (not res!91963) (not e!128009))))

(assert (=> b!194599 (= res!91963 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(declare-fun b!194600 () Bool)

(declare-fun e!128011 () Bool)

(assert (=> b!194600 (= e!128016 e!128011)))

(declare-fun res!91966 () Bool)

(assert (=> b!194600 (= res!91966 call!19688)))

(assert (=> b!194600 (=> (not res!91966) (not e!128011))))

(declare-fun b!194601 () Bool)

(assert (=> b!194601 (= e!128011 (= (apply!188 lt!97086 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3801 lt!96671)))))

(declare-fun bm!19685 () Bool)

(assert (=> bm!19685 (= call!19684 call!19685)))

(declare-fun b!194602 () Bool)

(declare-fun res!91965 () Bool)

(assert (=> b!194602 (=> (not res!91965) (not e!128008))))

(declare-fun e!128012 () Bool)

(assert (=> b!194602 (= res!91965 e!128012)))

(declare-fun c!35136 () Bool)

(assert (=> b!194602 (= c!35136 (not (= (bvand (extraKeys!3697 lt!96671) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!194603 () Bool)

(declare-fun c!35132 () Bool)

(assert (=> b!194603 (= c!35132 (and (not (= (bvand (extraKeys!3697 lt!96671) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3697 lt!96671) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!194603 (= e!128004 e!128005)))

(declare-fun b!194604 () Bool)

(assert (=> b!194604 (= e!128009 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun b!194605 () Bool)

(assert (=> b!194605 (= e!128012 e!128010)))

(declare-fun res!91968 () Bool)

(assert (=> b!194605 (= res!91968 call!19687)))

(assert (=> b!194605 (=> (not res!91968) (not e!128010))))

(declare-fun b!194606 () Bool)

(assert (=> b!194606 (= e!128008 e!128016)))

(declare-fun c!35133 () Bool)

(assert (=> b!194606 (= c!35133 (not (= (bvand (extraKeys!3697 lt!96671) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194607 () Bool)

(assert (=> b!194607 (= e!128012 (not call!19687))))

(declare-fun b!194608 () Bool)

(declare-fun Unit!5898 () Unit!5878)

(assert (=> b!194608 (= e!128015 Unit!5898)))

(assert (= (and d!56851 c!35134) b!194596))

(assert (= (and d!56851 (not c!35134)) b!194598))

(assert (= (and b!194598 c!35135) b!194595))

(assert (= (and b!194598 (not c!35135)) b!194603))

(assert (= (and b!194603 c!35132) b!194592))

(assert (= (and b!194603 (not c!35132)) b!194591))

(assert (= (or b!194592 b!194591) bm!19683))

(assert (= (or b!194595 bm!19683) bm!19685))

(assert (= (or b!194595 b!194592) bm!19682))

(assert (= (or b!194596 bm!19685) bm!19684))

(assert (= (or b!194596 bm!19682) bm!19680))

(assert (= (and d!56851 res!91964) b!194588))

(assert (= (and d!56851 c!35137) b!194593))

(assert (= (and d!56851 (not c!35137)) b!194608))

(assert (= (and d!56851 res!91969) b!194599))

(assert (= (and b!194599 res!91963) b!194604))

(assert (= (and b!194599 (not res!91962)) b!194597))

(assert (= (and b!194597 res!91961) b!194594))

(assert (= (and b!194599 res!91967) b!194602))

(assert (= (and b!194602 c!35136) b!194605))

(assert (= (and b!194602 (not c!35136)) b!194607))

(assert (= (and b!194605 res!91968) b!194589))

(assert (= (or b!194605 b!194607) bm!19679))

(assert (= (and b!194602 res!91965) b!194606))

(assert (= (and b!194606 c!35133) b!194600))

(assert (= (and b!194606 (not c!35133)) b!194590))

(assert (= (and b!194600 res!91966) b!194601))

(assert (= (or b!194600 b!194590) bm!19681))

(declare-fun b_lambda!7497 () Bool)

(assert (=> (not b_lambda!7497) (not b!194594)))

(declare-fun tb!2889 () Bool)

(declare-fun t!7381 () Bool)

(assert (=> (and b!193989 (= (defaultEntry!3960 thiss!1248) (defaultEntry!3960 lt!96671)) t!7381) tb!2889))

(declare-fun result!4945 () Bool)

(assert (=> tb!2889 (= result!4945 tp_is_empty!4491)))

(assert (=> b!194594 t!7381))

(declare-fun b_and!11451 () Bool)

(assert (= b_and!11449 (and (=> t!7381 result!4945) b_and!11451)))

(declare-fun m!221579 () Bool)

(assert (=> bm!19684 m!221579))

(declare-fun m!221581 () Bool)

(assert (=> b!194589 m!221581))

(declare-fun m!221583 () Bool)

(assert (=> bm!19681 m!221583))

(assert (=> d!56851 m!221129))

(declare-fun m!221585 () Bool)

(assert (=> b!194596 m!221585))

(declare-fun m!221587 () Bool)

(assert (=> bm!19680 m!221587))

(assert (=> b!194588 m!221447))

(assert (=> b!194588 m!221447))

(assert (=> b!194588 m!221449))

(assert (=> b!194604 m!221447))

(assert (=> b!194604 m!221447))

(assert (=> b!194604 m!221449))

(assert (=> b!194594 m!221447))

(declare-fun m!221589 () Bool)

(assert (=> b!194594 m!221589))

(assert (=> b!194594 m!221447))

(declare-fun m!221591 () Bool)

(assert (=> b!194594 m!221591))

(declare-fun m!221593 () Bool)

(assert (=> b!194594 m!221593))

(assert (=> b!194594 m!221593))

(assert (=> b!194594 m!221589))

(declare-fun m!221595 () Bool)

(assert (=> b!194594 m!221595))

(declare-fun m!221597 () Bool)

(assert (=> b!194601 m!221597))

(declare-fun m!221599 () Bool)

(assert (=> b!194593 m!221599))

(declare-fun m!221601 () Bool)

(assert (=> b!194593 m!221601))

(declare-fun m!221603 () Bool)

(assert (=> b!194593 m!221603))

(declare-fun m!221605 () Bool)

(assert (=> b!194593 m!221605))

(declare-fun m!221607 () Bool)

(assert (=> b!194593 m!221607))

(declare-fun m!221609 () Bool)

(assert (=> b!194593 m!221609))

(declare-fun m!221611 () Bool)

(assert (=> b!194593 m!221611))

(declare-fun m!221613 () Bool)

(assert (=> b!194593 m!221613))

(declare-fun m!221615 () Bool)

(assert (=> b!194593 m!221615))

(assert (=> b!194593 m!221447))

(declare-fun m!221617 () Bool)

(assert (=> b!194593 m!221617))

(assert (=> b!194593 m!221601))

(assert (=> b!194593 m!221579))

(assert (=> b!194593 m!221613))

(declare-fun m!221619 () Bool)

(assert (=> b!194593 m!221619))

(declare-fun m!221621 () Bool)

(assert (=> b!194593 m!221621))

(assert (=> b!194593 m!221605))

(declare-fun m!221623 () Bool)

(assert (=> b!194593 m!221623))

(declare-fun m!221625 () Bool)

(assert (=> b!194593 m!221625))

(assert (=> b!194593 m!221609))

(declare-fun m!221627 () Bool)

(assert (=> b!194593 m!221627))

(assert (=> b!194597 m!221447))

(assert (=> b!194597 m!221447))

(declare-fun m!221629 () Bool)

(assert (=> b!194597 m!221629))

(declare-fun m!221631 () Bool)

(assert (=> bm!19679 m!221631))

(assert (=> d!56645 d!56851))

(declare-fun d!56853 () Bool)

(declare-fun e!128018 () Bool)

(assert (=> d!56853 e!128018))

(declare-fun res!91970 () Bool)

(assert (=> d!56853 (=> res!91970 e!128018)))

(declare-fun lt!97095 () Bool)

(assert (=> d!56853 (= res!91970 (not lt!97095))))

(declare-fun lt!97096 () Bool)

(assert (=> d!56853 (= lt!97095 lt!97096)))

(declare-fun lt!97097 () Unit!5878)

(declare-fun e!128017 () Unit!5878)

(assert (=> d!56853 (= lt!97097 e!128017)))

(declare-fun c!35138 () Bool)

(assert (=> d!56853 (= c!35138 lt!97096)))

(assert (=> d!56853 (= lt!97096 (containsKey!249 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56853 (= (contains!1379 lt!96808 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) lt!97095)))

(declare-fun b!194609 () Bool)

(declare-fun lt!97098 () Unit!5878)

(assert (=> b!194609 (= e!128017 lt!97098)))

(assert (=> b!194609 (= lt!97098 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194609 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194610 () Bool)

(declare-fun Unit!5899 () Unit!5878)

(assert (=> b!194610 (= e!128017 Unit!5899)))

(declare-fun b!194611 () Bool)

(assert (=> b!194611 (= e!128018 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56853 c!35138) b!194609))

(assert (= (and d!56853 (not c!35138)) b!194610))

(assert (= (and d!56853 (not res!91970)) b!194611))

(assert (=> d!56853 m!220877))

(declare-fun m!221633 () Bool)

(assert (=> d!56853 m!221633))

(assert (=> b!194609 m!220877))

(declare-fun m!221635 () Bool)

(assert (=> b!194609 m!221635))

(assert (=> b!194609 m!220877))

(assert (=> b!194609 m!221543))

(assert (=> b!194609 m!221543))

(declare-fun m!221637 () Bool)

(assert (=> b!194609 m!221637))

(assert (=> b!194611 m!220877))

(assert (=> b!194611 m!221543))

(assert (=> b!194611 m!221543))

(assert (=> b!194611 m!221637))

(assert (=> b!194132 d!56853))

(declare-fun d!56855 () Bool)

(declare-fun e!128020 () Bool)

(assert (=> d!56855 e!128020))

(declare-fun res!91971 () Bool)

(assert (=> d!56855 (=> res!91971 e!128020)))

(declare-fun lt!97099 () Bool)

(assert (=> d!56855 (= res!91971 (not lt!97099))))

(declare-fun lt!97100 () Bool)

(assert (=> d!56855 (= lt!97099 lt!97100)))

(declare-fun lt!97101 () Unit!5878)

(declare-fun e!128019 () Unit!5878)

(assert (=> d!56855 (= lt!97101 e!128019)))

(declare-fun c!35139 () Bool)

(assert (=> d!56855 (= c!35139 lt!97100)))

(assert (=> d!56855 (= lt!97100 (containsKey!249 (toList!1254 lt!96817) (_1!1791 lt!96678)))))

(assert (=> d!56855 (= (contains!1379 lt!96817 (_1!1791 lt!96678)) lt!97099)))

(declare-fun b!194612 () Bool)

(declare-fun lt!97102 () Unit!5878)

(assert (=> b!194612 (= e!128019 lt!97102)))

(assert (=> b!194612 (= lt!97102 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96817) (_1!1791 lt!96678)))))

(assert (=> b!194612 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96817) (_1!1791 lt!96678)))))

(declare-fun b!194613 () Bool)

(declare-fun Unit!5900 () Unit!5878)

(assert (=> b!194613 (= e!128019 Unit!5900)))

(declare-fun b!194614 () Bool)

(assert (=> b!194614 (= e!128020 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96817) (_1!1791 lt!96678))))))

(assert (= (and d!56855 c!35139) b!194612))

(assert (= (and d!56855 (not c!35139)) b!194613))

(assert (= (and d!56855 (not res!91971)) b!194614))

(declare-fun m!221639 () Bool)

(assert (=> d!56855 m!221639))

(declare-fun m!221641 () Bool)

(assert (=> b!194612 m!221641))

(assert (=> b!194612 m!220933))

(assert (=> b!194612 m!220933))

(declare-fun m!221643 () Bool)

(assert (=> b!194612 m!221643))

(assert (=> b!194614 m!220933))

(assert (=> b!194614 m!220933))

(assert (=> b!194614 m!221643))

(assert (=> d!56655 d!56855))

(declare-fun b!194616 () Bool)

(declare-fun e!128021 () Option!251)

(declare-fun e!128022 () Option!251)

(assert (=> b!194616 (= e!128021 e!128022)))

(declare-fun c!35141 () Bool)

(assert (=> b!194616 (= c!35141 (and ((_ is Cons!2445) lt!96820) (not (= (_1!1791 (h!3086 lt!96820)) (_1!1791 lt!96678)))))))

(declare-fun b!194615 () Bool)

(assert (=> b!194615 (= e!128021 (Some!250 (_2!1791 (h!3086 lt!96820))))))

(declare-fun b!194617 () Bool)

(assert (=> b!194617 (= e!128022 (getValueByKey!245 (t!7375 lt!96820) (_1!1791 lt!96678)))))

(declare-fun d!56857 () Bool)

(declare-fun c!35140 () Bool)

(assert (=> d!56857 (= c!35140 (and ((_ is Cons!2445) lt!96820) (= (_1!1791 (h!3086 lt!96820)) (_1!1791 lt!96678))))))

(assert (=> d!56857 (= (getValueByKey!245 lt!96820 (_1!1791 lt!96678)) e!128021)))

(declare-fun b!194618 () Bool)

(assert (=> b!194618 (= e!128022 None!249)))

(assert (= (and d!56857 c!35140) b!194615))

(assert (= (and d!56857 (not c!35140)) b!194616))

(assert (= (and b!194616 c!35141) b!194617))

(assert (= (and b!194616 (not c!35141)) b!194618))

(declare-fun m!221645 () Bool)

(assert (=> b!194617 m!221645))

(assert (=> d!56655 d!56857))

(declare-fun d!56859 () Bool)

(assert (=> d!56859 (= (getValueByKey!245 lt!96820 (_1!1791 lt!96678)) (Some!250 (_2!1791 lt!96678)))))

(declare-fun lt!97103 () Unit!5878)

(assert (=> d!56859 (= lt!97103 (choose!1068 lt!96820 (_1!1791 lt!96678) (_2!1791 lt!96678)))))

(declare-fun e!128023 () Bool)

(assert (=> d!56859 e!128023))

(declare-fun res!91972 () Bool)

(assert (=> d!56859 (=> (not res!91972) (not e!128023))))

(assert (=> d!56859 (= res!91972 (isStrictlySorted!357 lt!96820))))

(assert (=> d!56859 (= (lemmaContainsTupThenGetReturnValue!132 lt!96820 (_1!1791 lt!96678) (_2!1791 lt!96678)) lt!97103)))

(declare-fun b!194619 () Bool)

(declare-fun res!91973 () Bool)

(assert (=> b!194619 (=> (not res!91973) (not e!128023))))

(assert (=> b!194619 (= res!91973 (containsKey!249 lt!96820 (_1!1791 lt!96678)))))

(declare-fun b!194620 () Bool)

(assert (=> b!194620 (= e!128023 (contains!1381 lt!96820 (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(assert (= (and d!56859 res!91972) b!194619))

(assert (= (and b!194619 res!91973) b!194620))

(assert (=> d!56859 m!220927))

(declare-fun m!221647 () Bool)

(assert (=> d!56859 m!221647))

(declare-fun m!221649 () Bool)

(assert (=> d!56859 m!221649))

(declare-fun m!221651 () Bool)

(assert (=> b!194619 m!221651))

(declare-fun m!221653 () Bool)

(assert (=> b!194620 m!221653))

(assert (=> d!56655 d!56859))

(declare-fun bm!19686 () Bool)

(declare-fun call!19690 () List!2449)

(declare-fun e!128024 () List!2449)

(declare-fun c!35143 () Bool)

(assert (=> bm!19686 (= call!19690 ($colon$colon!103 e!128024 (ite c!35143 (h!3086 (toList!1254 lt!96676)) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678)))))))

(declare-fun c!35142 () Bool)

(assert (=> bm!19686 (= c!35142 c!35143)))

(declare-fun b!194621 () Bool)

(declare-fun e!128028 () List!2449)

(declare-fun call!19689 () List!2449)

(assert (=> b!194621 (= e!128028 call!19689)))

(declare-fun b!194622 () Bool)

(declare-fun c!35144 () Bool)

(assert (=> b!194622 (= c!35144 (and ((_ is Cons!2445) (toList!1254 lt!96676)) (bvsgt (_1!1791 (h!3086 (toList!1254 lt!96676))) (_1!1791 lt!96678))))))

(declare-fun e!128026 () List!2449)

(assert (=> b!194622 (= e!128028 e!128026)))

(declare-fun b!194623 () Bool)

(declare-fun e!128027 () Bool)

(declare-fun lt!97104 () List!2449)

(assert (=> b!194623 (= e!128027 (contains!1381 lt!97104 (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun bm!19687 () Bool)

(declare-fun call!19691 () List!2449)

(assert (=> bm!19687 (= call!19691 call!19689)))

(declare-fun b!194624 () Bool)

(declare-fun e!128025 () List!2449)

(assert (=> b!194624 (= e!128025 e!128028)))

(declare-fun c!35145 () Bool)

(assert (=> b!194624 (= c!35145 (and ((_ is Cons!2445) (toList!1254 lt!96676)) (= (_1!1791 (h!3086 (toList!1254 lt!96676))) (_1!1791 lt!96678))))))

(declare-fun d!56861 () Bool)

(assert (=> d!56861 e!128027))

(declare-fun res!91974 () Bool)

(assert (=> d!56861 (=> (not res!91974) (not e!128027))))

(assert (=> d!56861 (= res!91974 (isStrictlySorted!357 lt!97104))))

(assert (=> d!56861 (= lt!97104 e!128025)))

(assert (=> d!56861 (= c!35143 (and ((_ is Cons!2445) (toList!1254 lt!96676)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96676))) (_1!1791 lt!96678))))))

(assert (=> d!56861 (isStrictlySorted!357 (toList!1254 lt!96676))))

(assert (=> d!56861 (= (insertStrictlySorted!135 (toList!1254 lt!96676) (_1!1791 lt!96678) (_2!1791 lt!96678)) lt!97104)))

(declare-fun bm!19688 () Bool)

(assert (=> bm!19688 (= call!19689 call!19690)))

(declare-fun b!194625 () Bool)

(assert (=> b!194625 (= e!128026 call!19691)))

(declare-fun b!194626 () Bool)

(assert (=> b!194626 (= e!128024 (insertStrictlySorted!135 (t!7375 (toList!1254 lt!96676)) (_1!1791 lt!96678) (_2!1791 lt!96678)))))

(declare-fun b!194627 () Bool)

(assert (=> b!194627 (= e!128026 call!19691)))

(declare-fun b!194628 () Bool)

(declare-fun res!91975 () Bool)

(assert (=> b!194628 (=> (not res!91975) (not e!128027))))

(assert (=> b!194628 (= res!91975 (containsKey!249 lt!97104 (_1!1791 lt!96678)))))

(declare-fun b!194629 () Bool)

(assert (=> b!194629 (= e!128025 call!19690)))

(declare-fun b!194630 () Bool)

(assert (=> b!194630 (= e!128024 (ite c!35145 (t!7375 (toList!1254 lt!96676)) (ite c!35144 (Cons!2445 (h!3086 (toList!1254 lt!96676)) (t!7375 (toList!1254 lt!96676))) Nil!2446)))))

(assert (= (and d!56861 c!35143) b!194629))

(assert (= (and d!56861 (not c!35143)) b!194624))

(assert (= (and b!194624 c!35145) b!194621))

(assert (= (and b!194624 (not c!35145)) b!194622))

(assert (= (and b!194622 c!35144) b!194627))

(assert (= (and b!194622 (not c!35144)) b!194625))

(assert (= (or b!194627 b!194625) bm!19687))

(assert (= (or b!194621 bm!19687) bm!19688))

(assert (= (or b!194629 bm!19688) bm!19686))

(assert (= (and bm!19686 c!35142) b!194626))

(assert (= (and bm!19686 (not c!35142)) b!194630))

(assert (= (and d!56861 res!91974) b!194628))

(assert (= (and b!194628 res!91975) b!194623))

(declare-fun m!221655 () Bool)

(assert (=> bm!19686 m!221655))

(declare-fun m!221657 () Bool)

(assert (=> b!194628 m!221657))

(declare-fun m!221659 () Bool)

(assert (=> b!194623 m!221659))

(declare-fun m!221661 () Bool)

(assert (=> b!194626 m!221661))

(declare-fun m!221663 () Bool)

(assert (=> d!56861 m!221663))

(assert (=> d!56861 m!221495))

(assert (=> d!56655 d!56861))

(declare-fun d!56863 () Bool)

(assert (=> d!56863 (= (apply!188 lt!96845 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2238 (getValueByKey!245 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7750 () Bool)

(assert (= bs!7750 d!56863))

(assert (=> bs!7750 m!221319))

(assert (=> bs!7750 m!221319))

(declare-fun m!221665 () Bool)

(assert (=> bs!7750 m!221665))

(assert (=> b!194170 d!56863))

(declare-fun d!56865 () Bool)

(declare-fun e!128030 () Bool)

(assert (=> d!56865 e!128030))

(declare-fun res!91976 () Bool)

(assert (=> d!56865 (=> res!91976 e!128030)))

(declare-fun lt!97105 () Bool)

(assert (=> d!56865 (= res!91976 (not lt!97105))))

(declare-fun lt!97106 () Bool)

(assert (=> d!56865 (= lt!97105 lt!97106)))

(declare-fun lt!97107 () Unit!5878)

(declare-fun e!128029 () Unit!5878)

(assert (=> d!56865 (= lt!97107 e!128029)))

(declare-fun c!35146 () Bool)

(assert (=> d!56865 (= c!35146 lt!97106)))

(assert (=> d!56865 (= lt!97106 (containsKey!249 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56865 (= (contains!1379 lt!96845 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97105)))

(declare-fun b!194631 () Bool)

(declare-fun lt!97108 () Unit!5878)

(assert (=> b!194631 (= e!128029 lt!97108)))

(assert (=> b!194631 (= lt!97108 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194631 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194632 () Bool)

(declare-fun Unit!5901 () Unit!5878)

(assert (=> b!194632 (= e!128029 Unit!5901)))

(declare-fun b!194633 () Bool)

(assert (=> b!194633 (= e!128030 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56865 c!35146) b!194631))

(assert (= (and d!56865 (not c!35146)) b!194632))

(assert (= (and d!56865 (not res!91976)) b!194633))

(declare-fun m!221667 () Bool)

(assert (=> d!56865 m!221667))

(declare-fun m!221669 () Bool)

(assert (=> b!194631 m!221669))

(assert (=> b!194631 m!221501))

(assert (=> b!194631 m!221501))

(declare-fun m!221671 () Bool)

(assert (=> b!194631 m!221671))

(assert (=> b!194633 m!221501))

(assert (=> b!194633 m!221501))

(assert (=> b!194633 m!221671))

(assert (=> bm!19634 d!56865))

(declare-fun d!56867 () Bool)

(declare-fun res!91977 () Bool)

(declare-fun e!128031 () Bool)

(assert (=> d!56867 (=> res!91977 e!128031)))

(assert (=> d!56867 (= res!91977 (and ((_ is Cons!2445) (toList!1254 lt!96669)) (= (_1!1791 (h!3086 (toList!1254 lt!96669))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(assert (=> d!56867 (= (containsKey!249 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) e!128031)))

(declare-fun b!194634 () Bool)

(declare-fun e!128032 () Bool)

(assert (=> b!194634 (= e!128031 e!128032)))

(declare-fun res!91978 () Bool)

(assert (=> b!194634 (=> (not res!91978) (not e!128032))))

(assert (=> b!194634 (= res!91978 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96669))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96669))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))) ((_ is Cons!2445) (toList!1254 lt!96669)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96669))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(declare-fun b!194635 () Bool)

(assert (=> b!194635 (= e!128032 (containsKey!249 (t!7375 (toList!1254 lt!96669)) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (= (and d!56867 (not res!91977)) b!194634))

(assert (= (and b!194634 res!91978) b!194635))

(assert (=> b!194635 m!220759))

(declare-fun m!221673 () Bool)

(assert (=> b!194635 m!221673))

(assert (=> d!56657 d!56867))

(declare-fun d!56869 () Bool)

(assert (=> d!56869 (contains!1379 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))

(assert (=> d!56869 true))

(declare-fun _$16!166 () Unit!5878)

(assert (=> d!56869 (= (choose!1064 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (index!4947 lt!96677) (defaultEntry!3960 thiss!1248)) _$16!166)))

(declare-fun bs!7751 () Bool)

(assert (= bs!7751 d!56869))

(assert (=> bs!7751 m!220749))

(assert (=> bs!7751 m!220759))

(assert (=> bs!7751 m!220749))

(assert (=> bs!7751 m!220759))

(assert (=> bs!7751 m!220947))

(assert (=> d!56659 d!56869))

(assert (=> d!56659 d!56689))

(declare-fun d!56871 () Bool)

(assert (=> d!56871 (= (apply!188 lt!96808 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2238 (getValueByKey!245 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7752 () Bool)

(assert (= bs!7752 d!56871))

(assert (=> bs!7752 m!221563))

(assert (=> bs!7752 m!221563))

(declare-fun m!221675 () Bool)

(assert (=> bs!7752 m!221675))

(assert (=> b!194136 d!56871))

(declare-fun mapIsEmpty!7776 () Bool)

(declare-fun mapRes!7776 () Bool)

(assert (=> mapIsEmpty!7776 mapRes!7776))

(declare-fun b!194637 () Bool)

(declare-fun e!128033 () Bool)

(assert (=> b!194637 (= e!128033 tp_is_empty!4491)))

(declare-fun condMapEmpty!7776 () Bool)

(declare-fun mapDefault!7776 () ValueCell!1902)

(assert (=> mapNonEmpty!7775 (= condMapEmpty!7776 (= mapRest!7775 ((as const (Array (_ BitVec 32) ValueCell!1902)) mapDefault!7776)))))

(assert (=> mapNonEmpty!7775 (= tp!17036 (and e!128033 mapRes!7776))))

(declare-fun mapNonEmpty!7776 () Bool)

(declare-fun tp!17037 () Bool)

(declare-fun e!128034 () Bool)

(assert (=> mapNonEmpty!7776 (= mapRes!7776 (and tp!17037 e!128034))))

(declare-fun mapRest!7776 () (Array (_ BitVec 32) ValueCell!1902))

(declare-fun mapValue!7776 () ValueCell!1902)

(declare-fun mapKey!7776 () (_ BitVec 32))

(assert (=> mapNonEmpty!7776 (= mapRest!7775 (store mapRest!7776 mapKey!7776 mapValue!7776))))

(declare-fun b!194636 () Bool)

(assert (=> b!194636 (= e!128034 tp_is_empty!4491)))

(assert (= (and mapNonEmpty!7775 condMapEmpty!7776) mapIsEmpty!7776))

(assert (= (and mapNonEmpty!7775 (not condMapEmpty!7776)) mapNonEmpty!7776))

(assert (= (and mapNonEmpty!7776 ((_ is ValueCellFull!1902) mapValue!7776)) b!194636))

(assert (= (and mapNonEmpty!7775 ((_ is ValueCellFull!1902) mapDefault!7776)) b!194637))

(declare-fun m!221677 () Bool)

(assert (=> mapNonEmpty!7776 m!221677))

(declare-fun b_lambda!7499 () Bool)

(assert (= b_lambda!7493 (or (and b!193989 b_free!4719) b_lambda!7499)))

(declare-fun b_lambda!7501 () Bool)

(assert (= b_lambda!7495 (or (and b!193989 b_free!4719) b_lambda!7501)))

(declare-fun b_lambda!7503 () Bool)

(assert (= b_lambda!7489 (or (and b!193989 b_free!4719) b_lambda!7503)))

(declare-fun b_lambda!7505 () Bool)

(assert (= b_lambda!7487 (or (and b!193989 b_free!4719) b_lambda!7505)))

(declare-fun b_lambda!7507 () Bool)

(assert (= b_lambda!7491 (or (and b!193989 b_free!4719) b_lambda!7507)))

(check-sat (not b!194392) (not b!194238) (not b_lambda!7499) (not d!56835) (not b!194424) (not b!194466) (not bm!19677) (not b!194222) (not bm!19681) (not b!194565) (not d!56711) (not d!56837) (not d!56739) (not d!56807) (not d!56789) (not b!194526) (not b!194274) (not bm!19679) (not b!194456) (not b!194446) (not d!56869) (not b!194499) (not b!194458) (not d!56741) (not b!194309) (not b!194390) (not d!56775) (not b!194359) (not b!194411) (not d!56743) (not b!194494) (not d!56691) (not b!194580) (not b!194455) (not b!194544) (not d!56679) (not bm!19644) (not b_lambda!7497) (not d!56695) (not b!194611) (not d!56845) (not d!56781) (not d!56799) (not d!56855) (not bm!19673) (not d!56733) (not b!194570) (not b!194316) (not b!194291) (not b!194597) (not d!56719) (not b!194396) (not b!194270) (not b!194267) (not b!194492) (not d!56791) (not bm!19669) (not b!194623) (not d!56717) (not b!194493) (not b!194409) (not b!194578) (not d!56821) (not b!194448) (not b!194296) (not b!194584) (not d!56735) (not d!56729) (not d!56715) (not bm!19686) (not b!194587) (not b!194462) (not d!56829) (not b!194572) (not b!194394) (not b!194277) (not b!194412) (not bm!19657) (not d!56681) (not b!194401) (not d!56847) (not d!56773) (not b!194612) (not b!194278) (not b!194596) (not b!194236) (not d!56853) (not d!56699) (not b!194346) (not b!194264) (not b!194365) (not d!56753) (not b!194619) (not d!56815) (not b!194415) (not d!56801) (not d!56769) (not b!194410) (not b!194225) (not d!56765) (not b!194268) (not b!194620) (not mapNonEmpty!7776) (not b!194631) (not d!56779) (not b!194512) (not d!56861) (not b!194438) (not b!194398) (not d!56755) (not bm!19670) (not b_next!4719) (not b!194531) (not b!194292) (not b!194601) (not d!56747) (not b!194628) (not b!194571) (not d!56761) (not b!194467) (not b!194428) (not b!194421) (not d!56771) (not b!194431) (not b!194422) (not d!56777) (not b!194282) (not b!194310) (not d!56859) (not d!56727) (not b!194441) (not bm!19663) (not b!194414) (not b!194538) (not d!56785) (not d!56685) (not d!56767) (not b_lambda!7483) (not d!56871) (not b!194567) (not d!56783) (not b!194351) (not b!194543) (not b!194609) (not b!194589) (not bm!19643) (not b!194413) (not d!56817) (not d!56805) (not bm!19646) b_and!11451 (not b_lambda!7501) (not d!56851) (not b!194525) (not b!194417) (not d!56693) (not b!194527) (not d!56745) (not b!194501) (not b!194614) (not b!194307) (not d!56723) (not b!194399) (not b_lambda!7507) (not b!194442) (not b!194450) (not d!56757) (not b!194349) (not b!194406) (not d!56763) (not d!56749) (not b!194453) (not b!194425) (not d!56843) (not d!56731) tp_is_empty!4491 (not d!56703) (not bm!19680) (not b!194444) (not b!194439) (not b!194432) (not b!194420) (not b!194452) (not b!194437) (not b!194227) (not bm!19649) (not b!194593) (not b!194434) (not d!56803) (not b!194322) (not d!56737) (not d!56721) (not d!56709) (not b!194633) (not bm!19678) (not b!194440) (not b!194323) (not b!194445) (not b!194311) (not b!194223) (not bm!19684) (not d!56849) (not d!56863) (not b!194635) (not bm!19664) (not d!56725) (not b!194588) (not b!194604) (not b!194497) (not d!56813) (not b!194626) (not b!194391) (not b!194547) (not b!194568) (not b!194465) (not b_lambda!7485) (not bm!19676) (not d!56787) (not b!194285) (not b_lambda!7505) (not b!194269) (not b!194430) (not b!194313) (not bm!19645) (not b!194585) (not d!56697) (not d!56865) (not d!56705) (not b!194407) (not b!194594) (not b_lambda!7503) (not bm!19662) (not b!194617) (not b!194275) (not b!194582))
(check-sat b_and!11451 (not b_next!4719))
(get-model)

(declare-fun lt!97109 () Bool)

(declare-fun d!56873 () Bool)

(assert (=> d!56873 (= lt!97109 (select (content!155 (toList!1254 lt!96992)) (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun e!128036 () Bool)

(assert (=> d!56873 (= lt!97109 e!128036)))

(declare-fun res!91979 () Bool)

(assert (=> d!56873 (=> (not res!91979) (not e!128036))))

(assert (=> d!56873 (= res!91979 ((_ is Cons!2445) (toList!1254 lt!96992)))))

(assert (=> d!56873 (= (contains!1381 (toList!1254 lt!96992) (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!97109)))

(declare-fun b!194638 () Bool)

(declare-fun e!128035 () Bool)

(assert (=> b!194638 (= e!128036 e!128035)))

(declare-fun res!91980 () Bool)

(assert (=> b!194638 (=> res!91980 e!128035)))

(assert (=> b!194638 (= res!91980 (= (h!3086 (toList!1254 lt!96992)) (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!194639 () Bool)

(assert (=> b!194639 (= e!128035 (contains!1381 (t!7375 (toList!1254 lt!96992)) (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (= (and d!56873 res!91979) b!194638))

(assert (= (and b!194638 (not res!91980)) b!194639))

(declare-fun m!221679 () Bool)

(assert (=> d!56873 m!221679))

(declare-fun m!221681 () Bool)

(assert (=> d!56873 m!221681))

(declare-fun m!221683 () Bool)

(assert (=> b!194639 m!221683))

(assert (=> b!194421 d!56873))

(declare-fun d!56875 () Bool)

(declare-fun res!91981 () Bool)

(declare-fun e!128037 () Bool)

(assert (=> d!56875 (=> res!91981 e!128037)))

(assert (=> d!56875 (= res!91981 (and ((_ is Cons!2445) (toList!1254 lt!96817)) (= (_1!1791 (h!3086 (toList!1254 lt!96817))) (_1!1791 lt!96678))))))

(assert (=> d!56875 (= (containsKey!249 (toList!1254 lt!96817) (_1!1791 lt!96678)) e!128037)))

(declare-fun b!194640 () Bool)

(declare-fun e!128038 () Bool)

(assert (=> b!194640 (= e!128037 e!128038)))

(declare-fun res!91982 () Bool)

(assert (=> b!194640 (=> (not res!91982) (not e!128038))))

(assert (=> b!194640 (= res!91982 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96817))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96817))) (_1!1791 lt!96678))) ((_ is Cons!2445) (toList!1254 lt!96817)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96817))) (_1!1791 lt!96678))))))

(declare-fun b!194641 () Bool)

(assert (=> b!194641 (= e!128038 (containsKey!249 (t!7375 (toList!1254 lt!96817)) (_1!1791 lt!96678)))))

(assert (= (and d!56875 (not res!91981)) b!194640))

(assert (= (and b!194640 res!91982) b!194641))

(declare-fun m!221685 () Bool)

(assert (=> b!194641 m!221685))

(assert (=> d!56855 d!56875))

(declare-fun d!56877 () Bool)

(assert (=> d!56877 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97110 () Unit!5878)

(assert (=> d!56877 (= lt!97110 (choose!1067 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128039 () Bool)

(assert (=> d!56877 e!128039))

(declare-fun res!91983 () Bool)

(assert (=> d!56877 (=> (not res!91983) (not e!128039))))

(assert (=> d!56877 (= res!91983 (isStrictlySorted!357 (toList!1254 lt!96845)))))

(assert (=> d!56877 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000) lt!97110)))

(declare-fun b!194642 () Bool)

(assert (=> b!194642 (= e!128039 (containsKey!249 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56877 res!91983) b!194642))

(assert (=> d!56877 m!221319))

(assert (=> d!56877 m!221319))

(assert (=> d!56877 m!221321))

(declare-fun m!221687 () Bool)

(assert (=> d!56877 m!221687))

(declare-fun m!221689 () Bool)

(assert (=> d!56877 m!221689))

(assert (=> b!194642 m!221315))

(assert (=> b!194422 d!56877))

(declare-fun d!56879 () Bool)

(assert (=> d!56879 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7753 () Bool)

(assert (= bs!7753 d!56879))

(assert (=> bs!7753 m!221319))

(declare-fun m!221691 () Bool)

(assert (=> bs!7753 m!221691))

(assert (=> b!194422 d!56879))

(declare-fun b!194644 () Bool)

(declare-fun e!128040 () Option!251)

(declare-fun e!128041 () Option!251)

(assert (=> b!194644 (= e!128040 e!128041)))

(declare-fun c!35148 () Bool)

(assert (=> b!194644 (= c!35148 (and ((_ is Cons!2445) (toList!1254 lt!96845)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96845))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194643 () Bool)

(assert (=> b!194643 (= e!128040 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96845)))))))

(declare-fun b!194645 () Bool)

(assert (=> b!194645 (= e!128041 (getValueByKey!245 (t!7375 (toList!1254 lt!96845)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!56881 () Bool)

(declare-fun c!35147 () Bool)

(assert (=> d!56881 (= c!35147 (and ((_ is Cons!2445) (toList!1254 lt!96845)) (= (_1!1791 (h!3086 (toList!1254 lt!96845))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56881 (= (getValueByKey!245 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000) e!128040)))

(declare-fun b!194646 () Bool)

(assert (=> b!194646 (= e!128041 None!249)))

(assert (= (and d!56881 c!35147) b!194643))

(assert (= (and d!56881 (not c!35147)) b!194644))

(assert (= (and b!194644 c!35148) b!194645))

(assert (= (and b!194644 (not c!35148)) b!194646))

(declare-fun m!221693 () Bool)

(assert (=> b!194645 m!221693))

(assert (=> b!194422 d!56881))

(declare-fun b!194648 () Bool)

(declare-fun e!128042 () Option!251)

(declare-fun e!128043 () Option!251)

(assert (=> b!194648 (= e!128042 e!128043)))

(declare-fun c!35150 () Bool)

(assert (=> b!194648 (= c!35150 (and ((_ is Cons!2445) (toList!1254 lt!97020)) (not (= (_1!1791 (h!3086 (toList!1254 lt!97020))) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))))

(declare-fun b!194647 () Bool)

(assert (=> b!194647 (= e!128042 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!97020)))))))

(declare-fun b!194649 () Bool)

(assert (=> b!194649 (= e!128043 (getValueByKey!245 (t!7375 (toList!1254 lt!97020)) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(declare-fun d!56883 () Bool)

(declare-fun c!35149 () Bool)

(assert (=> d!56883 (= c!35149 (and ((_ is Cons!2445) (toList!1254 lt!97020)) (= (_1!1791 (h!3086 (toList!1254 lt!97020))) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!56883 (= (getValueByKey!245 (toList!1254 lt!97020) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) e!128042)))

(declare-fun b!194650 () Bool)

(assert (=> b!194650 (= e!128043 None!249)))

(assert (= (and d!56883 c!35149) b!194647))

(assert (= (and d!56883 (not c!35149)) b!194648))

(assert (= (and b!194648 c!35150) b!194649))

(assert (= (and b!194648 (not c!35150)) b!194650))

(declare-fun m!221695 () Bool)

(assert (=> b!194649 m!221695))

(assert (=> b!194441 d!56883))

(declare-fun b!194652 () Bool)

(declare-fun e!128044 () Option!251)

(declare-fun e!128045 () Option!251)

(assert (=> b!194652 (= e!128044 e!128045)))

(declare-fun c!35152 () Bool)

(assert (=> b!194652 (= c!35152 (and ((_ is Cons!2445) (toList!1254 lt!97042)) (not (= (_1!1791 (h!3086 (toList!1254 lt!97042))) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun b!194651 () Bool)

(assert (=> b!194651 (= e!128044 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!97042)))))))

(declare-fun b!194653 () Bool)

(assert (=> b!194653 (= e!128045 (getValueByKey!245 (t!7375 (toList!1254 lt!97042)) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun d!56885 () Bool)

(declare-fun c!35151 () Bool)

(assert (=> d!56885 (= c!35151 (and ((_ is Cons!2445) (toList!1254 lt!97042)) (= (_1!1791 (h!3086 (toList!1254 lt!97042))) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!56885 (= (getValueByKey!245 (toList!1254 lt!97042) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) e!128044)))

(declare-fun b!194654 () Bool)

(assert (=> b!194654 (= e!128045 None!249)))

(assert (= (and d!56885 c!35151) b!194651))

(assert (= (and d!56885 (not c!35151)) b!194652))

(assert (= (and b!194652 c!35152) b!194653))

(assert (= (and b!194652 (not c!35152)) b!194654))

(declare-fun m!221697 () Bool)

(assert (=> b!194653 m!221697))

(assert (=> b!194492 d!56885))

(declare-fun d!56887 () Bool)

(assert (=> d!56887 (= ($colon$colon!103 e!127853 (ite c!35067 (h!3086 (toList!1254 (map!2029 thiss!1248))) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678)))) (Cons!2445 (ite c!35067 (h!3086 (toList!1254 (map!2029 thiss!1248))) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))) e!127853))))

(assert (=> bm!19657 d!56887))

(declare-fun d!56889 () Bool)

(declare-fun e!128047 () Bool)

(assert (=> d!56889 e!128047))

(declare-fun res!91984 () Bool)

(assert (=> d!56889 (=> res!91984 e!128047)))

(declare-fun lt!97111 () Bool)

(assert (=> d!56889 (= res!91984 (not lt!97111))))

(declare-fun lt!97112 () Bool)

(assert (=> d!56889 (= lt!97111 lt!97112)))

(declare-fun lt!97113 () Unit!5878)

(declare-fun e!128046 () Unit!5878)

(assert (=> d!56889 (= lt!97113 e!128046)))

(declare-fun c!35153 () Bool)

(assert (=> d!56889 (= c!35153 lt!97112)))

(assert (=> d!56889 (= lt!97112 (containsKey!249 (toList!1254 (+!322 lt!96962 (tuple2!3561 lt!96959 lt!96958))) lt!96957))))

(assert (=> d!56889 (= (contains!1379 (+!322 lt!96962 (tuple2!3561 lt!96959 lt!96958)) lt!96957) lt!97111)))

(declare-fun b!194655 () Bool)

(declare-fun lt!97114 () Unit!5878)

(assert (=> b!194655 (= e!128046 lt!97114)))

(assert (=> b!194655 (= lt!97114 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 (+!322 lt!96962 (tuple2!3561 lt!96959 lt!96958))) lt!96957))))

(assert (=> b!194655 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96962 (tuple2!3561 lt!96959 lt!96958))) lt!96957))))

(declare-fun b!194656 () Bool)

(declare-fun Unit!5902 () Unit!5878)

(assert (=> b!194656 (= e!128046 Unit!5902)))

(declare-fun b!194657 () Bool)

(assert (=> b!194657 (= e!128047 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96962 (tuple2!3561 lt!96959 lt!96958))) lt!96957)))))

(assert (= (and d!56889 c!35153) b!194655))

(assert (= (and d!56889 (not c!35153)) b!194656))

(assert (= (and d!56889 (not res!91984)) b!194657))

(declare-fun m!221699 () Bool)

(assert (=> d!56889 m!221699))

(declare-fun m!221701 () Bool)

(assert (=> b!194655 m!221701))

(declare-fun m!221703 () Bool)

(assert (=> b!194655 m!221703))

(assert (=> b!194655 m!221703))

(declare-fun m!221705 () Bool)

(assert (=> b!194655 m!221705))

(assert (=> b!194657 m!221703))

(assert (=> b!194657 m!221703))

(assert (=> b!194657 m!221705))

(assert (=> b!194391 d!56889))

(declare-fun d!56891 () Bool)

(declare-fun e!128048 () Bool)

(assert (=> d!56891 e!128048))

(declare-fun res!91985 () Bool)

(assert (=> d!56891 (=> (not res!91985) (not e!128048))))

(declare-fun lt!97115 () ListLongMap!2477)

(assert (=> d!56891 (= res!91985 (contains!1379 lt!97115 (_1!1791 (tuple2!3561 lt!96959 lt!96958))))))

(declare-fun lt!97118 () List!2449)

(assert (=> d!56891 (= lt!97115 (ListLongMap!2478 lt!97118))))

(declare-fun lt!97116 () Unit!5878)

(declare-fun lt!97117 () Unit!5878)

(assert (=> d!56891 (= lt!97116 lt!97117)))

(assert (=> d!56891 (= (getValueByKey!245 lt!97118 (_1!1791 (tuple2!3561 lt!96959 lt!96958))) (Some!250 (_2!1791 (tuple2!3561 lt!96959 lt!96958))))))

(assert (=> d!56891 (= lt!97117 (lemmaContainsTupThenGetReturnValue!132 lt!97118 (_1!1791 (tuple2!3561 lt!96959 lt!96958)) (_2!1791 (tuple2!3561 lt!96959 lt!96958))))))

(assert (=> d!56891 (= lt!97118 (insertStrictlySorted!135 (toList!1254 lt!96962) (_1!1791 (tuple2!3561 lt!96959 lt!96958)) (_2!1791 (tuple2!3561 lt!96959 lt!96958))))))

(assert (=> d!56891 (= (+!322 lt!96962 (tuple2!3561 lt!96959 lt!96958)) lt!97115)))

(declare-fun b!194658 () Bool)

(declare-fun res!91986 () Bool)

(assert (=> b!194658 (=> (not res!91986) (not e!128048))))

(assert (=> b!194658 (= res!91986 (= (getValueByKey!245 (toList!1254 lt!97115) (_1!1791 (tuple2!3561 lt!96959 lt!96958))) (Some!250 (_2!1791 (tuple2!3561 lt!96959 lt!96958)))))))

(declare-fun b!194659 () Bool)

(assert (=> b!194659 (= e!128048 (contains!1381 (toList!1254 lt!97115) (tuple2!3561 lt!96959 lt!96958)))))

(assert (= (and d!56891 res!91985) b!194658))

(assert (= (and b!194658 res!91986) b!194659))

(declare-fun m!221707 () Bool)

(assert (=> d!56891 m!221707))

(declare-fun m!221709 () Bool)

(assert (=> d!56891 m!221709))

(declare-fun m!221711 () Bool)

(assert (=> d!56891 m!221711))

(declare-fun m!221713 () Bool)

(assert (=> d!56891 m!221713))

(declare-fun m!221715 () Bool)

(assert (=> b!194658 m!221715))

(declare-fun m!221717 () Bool)

(assert (=> b!194659 m!221717))

(assert (=> b!194391 d!56891))

(declare-fun d!56893 () Bool)

(assert (=> d!56893 (not (contains!1379 (+!322 lt!96962 (tuple2!3561 lt!96959 lt!96958)) lt!96957))))

(declare-fun lt!97121 () Unit!5878)

(declare-fun choose!1071 (ListLongMap!2477 (_ BitVec 64) V!5635 (_ BitVec 64)) Unit!5878)

(assert (=> d!56893 (= lt!97121 (choose!1071 lt!96962 lt!96959 lt!96958 lt!96957))))

(declare-fun e!128051 () Bool)

(assert (=> d!56893 e!128051))

(declare-fun res!91989 () Bool)

(assert (=> d!56893 (=> (not res!91989) (not e!128051))))

(assert (=> d!56893 (= res!91989 (not (contains!1379 lt!96962 lt!96957)))))

(assert (=> d!56893 (= (addStillNotContains!97 lt!96962 lt!96959 lt!96958 lt!96957) lt!97121)))

(declare-fun b!194663 () Bool)

(assert (=> b!194663 (= e!128051 (not (= lt!96959 lt!96957)))))

(assert (= (and d!56893 res!91989) b!194663))

(assert (=> d!56893 m!221193))

(assert (=> d!56893 m!221193))

(assert (=> d!56893 m!221195))

(declare-fun m!221719 () Bool)

(assert (=> d!56893 m!221719))

(declare-fun m!221721 () Bool)

(assert (=> d!56893 m!221721))

(assert (=> b!194391 d!56893))

(assert (=> b!194391 d!56831))

(declare-fun d!56895 () Bool)

(declare-fun e!128052 () Bool)

(assert (=> d!56895 e!128052))

(declare-fun res!91990 () Bool)

(assert (=> d!56895 (=> (not res!91990) (not e!128052))))

(declare-fun lt!97122 () ListLongMap!2477)

(assert (=> d!56895 (= res!91990 (contains!1379 lt!97122 (_1!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!97125 () List!2449)

(assert (=> d!56895 (= lt!97122 (ListLongMap!2478 lt!97125))))

(declare-fun lt!97123 () Unit!5878)

(declare-fun lt!97124 () Unit!5878)

(assert (=> d!56895 (= lt!97123 lt!97124)))

(assert (=> d!56895 (= (getValueByKey!245 lt!97125 (_1!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!250 (_2!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56895 (= lt!97124 (lemmaContainsTupThenGetReturnValue!132 lt!97125 (_1!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56895 (= lt!97125 (insertStrictlySorted!135 (toList!1254 call!19665) (_1!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56895 (= (+!322 call!19665 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!97122)))

(declare-fun b!194664 () Bool)

(declare-fun res!91991 () Bool)

(assert (=> b!194664 (=> (not res!91991) (not e!128052))))

(assert (=> b!194664 (= res!91991 (= (getValueByKey!245 (toList!1254 lt!97122) (_1!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!250 (_2!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!194665 () Bool)

(assert (=> b!194665 (= e!128052 (contains!1381 (toList!1254 lt!97122) (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!56895 res!91990) b!194664))

(assert (= (and b!194664 res!91991) b!194665))

(declare-fun m!221723 () Bool)

(assert (=> d!56895 m!221723))

(declare-fun m!221725 () Bool)

(assert (=> d!56895 m!221725))

(declare-fun m!221727 () Bool)

(assert (=> d!56895 m!221727))

(declare-fun m!221729 () Bool)

(assert (=> d!56895 m!221729))

(declare-fun m!221731 () Bool)

(assert (=> b!194664 m!221731))

(declare-fun m!221733 () Bool)

(assert (=> b!194665 m!221733))

(assert (=> b!194391 d!56895))

(declare-fun d!56897 () Bool)

(declare-fun e!128053 () Bool)

(assert (=> d!56897 e!128053))

(declare-fun res!91992 () Bool)

(assert (=> d!56897 (=> (not res!91992) (not e!128053))))

(declare-fun lt!97126 () ListLongMap!2477)

(assert (=> d!56897 (= res!91992 (contains!1379 lt!97126 (_1!1791 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97129 () List!2449)

(assert (=> d!56897 (= lt!97126 (ListLongMap!2478 lt!97129))))

(declare-fun lt!97127 () Unit!5878)

(declare-fun lt!97128 () Unit!5878)

(assert (=> d!56897 (= lt!97127 lt!97128)))

(assert (=> d!56897 (= (getValueByKey!245 lt!97129 (_1!1791 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248)))))))

(assert (=> d!56897 (= lt!97128 (lemmaContainsTupThenGetReturnValue!132 lt!97129 (_1!1791 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248)))))))

(assert (=> d!56897 (= lt!97129 (insertStrictlySorted!135 (toList!1254 lt!96907) (_1!1791 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248)))))))

(assert (=> d!56897 (= (+!322 lt!96907 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248))) lt!97126)))

(declare-fun b!194666 () Bool)

(declare-fun res!91993 () Bool)

(assert (=> b!194666 (=> (not res!91993) (not e!128053))))

(assert (=> b!194666 (= res!91993 (= (getValueByKey!245 (toList!1254 lt!97126) (_1!1791 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248))))))))

(declare-fun b!194667 () Bool)

(assert (=> b!194667 (= e!128053 (contains!1381 (toList!1254 lt!97126) (tuple2!3561 lt!96915 (minValue!3801 thiss!1248))))))

(assert (= (and d!56897 res!91992) b!194666))

(assert (= (and b!194666 res!91993) b!194667))

(declare-fun m!221735 () Bool)

(assert (=> d!56897 m!221735))

(declare-fun m!221737 () Bool)

(assert (=> d!56897 m!221737))

(declare-fun m!221739 () Bool)

(assert (=> d!56897 m!221739))

(declare-fun m!221741 () Bool)

(assert (=> d!56897 m!221741))

(declare-fun m!221743 () Bool)

(assert (=> b!194666 m!221743))

(declare-fun m!221745 () Bool)

(assert (=> b!194667 m!221745))

(assert (=> b!194274 d!56897))

(declare-fun d!56899 () Bool)

(assert (=> d!56899 (= (apply!188 lt!96917 lt!96903) (get!2238 (getValueByKey!245 (toList!1254 lt!96917) lt!96903)))))

(declare-fun bs!7754 () Bool)

(assert (= bs!7754 d!56899))

(declare-fun m!221747 () Bool)

(assert (=> bs!7754 m!221747))

(assert (=> bs!7754 m!221747))

(declare-fun m!221749 () Bool)

(assert (=> bs!7754 m!221749))

(assert (=> b!194274 d!56899))

(declare-fun d!56901 () Bool)

(assert (=> d!56901 (= (apply!188 (+!322 lt!96917 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248))) lt!96903) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96917 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248)))) lt!96903)))))

(declare-fun bs!7755 () Bool)

(assert (= bs!7755 d!56901))

(declare-fun m!221751 () Bool)

(assert (=> bs!7755 m!221751))

(assert (=> bs!7755 m!221751))

(declare-fun m!221753 () Bool)

(assert (=> bs!7755 m!221753))

(assert (=> b!194274 d!56901))

(declare-fun b!194668 () Bool)

(declare-fun e!128057 () ListLongMap!2477)

(declare-fun e!128058 () ListLongMap!2477)

(assert (=> b!194668 (= e!128057 e!128058)))

(declare-fun c!35157 () Bool)

(assert (=> b!194668 (= c!35157 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194670 () Bool)

(declare-fun e!128060 () Bool)

(declare-fun lt!97136 () ListLongMap!2477)

(assert (=> b!194670 (= e!128060 (isEmpty!488 lt!97136))))

(declare-fun b!194671 () Bool)

(declare-fun call!19692 () ListLongMap!2477)

(assert (=> b!194671 (= e!128058 call!19692)))

(declare-fun b!194672 () Bool)

(declare-fun e!128059 () Bool)

(declare-fun e!128055 () Bool)

(assert (=> b!194672 (= e!128059 e!128055)))

(assert (=> b!194672 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun res!91994 () Bool)

(assert (=> b!194672 (= res!91994 (contains!1379 lt!97136 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194672 (=> (not res!91994) (not e!128055))))

(declare-fun b!194673 () Bool)

(declare-fun e!128056 () Bool)

(assert (=> b!194673 (= e!128056 e!128059)))

(declare-fun c!35156 () Bool)

(declare-fun e!128054 () Bool)

(assert (=> b!194673 (= c!35156 e!128054)))

(declare-fun res!91995 () Bool)

(assert (=> b!194673 (=> (not res!91995) (not e!128054))))

(assert (=> b!194673 (= res!91995 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194674 () Bool)

(assert (=> b!194674 (= e!128054 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194674 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!194675 () Bool)

(assert (=> b!194675 (= e!128057 (ListLongMap!2478 Nil!2446))))

(declare-fun b!194676 () Bool)

(assert (=> b!194676 (= e!128060 (= lt!97136 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248))))))

(declare-fun bm!19689 () Bool)

(assert (=> bm!19689 (= call!19692 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248)))))

(declare-fun b!194677 () Bool)

(assert (=> b!194677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> b!194677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4200 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))))))))

(assert (=> b!194677 (= e!128055 (= (apply!188 lt!97136 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2237 (select (arr!3876 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194669 () Bool)

(declare-fun lt!97133 () Unit!5878)

(declare-fun lt!97134 () Unit!5878)

(assert (=> b!194669 (= lt!97133 lt!97134)))

(declare-fun lt!97131 () V!5635)

(declare-fun lt!97132 () (_ BitVec 64))

(declare-fun lt!97135 () ListLongMap!2477)

(declare-fun lt!97130 () (_ BitVec 64))

(assert (=> b!194669 (not (contains!1379 (+!322 lt!97135 (tuple2!3561 lt!97132 lt!97131)) lt!97130))))

(assert (=> b!194669 (= lt!97134 (addStillNotContains!97 lt!97135 lt!97132 lt!97131 lt!97130))))

(assert (=> b!194669 (= lt!97130 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194669 (= lt!97131 (get!2237 (select (arr!3876 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194669 (= lt!97132 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194669 (= lt!97135 call!19692)))

(assert (=> b!194669 (= e!128058 (+!322 call!19692 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!56903 () Bool)

(assert (=> d!56903 e!128056))

(declare-fun res!91997 () Bool)

(assert (=> d!56903 (=> (not res!91997) (not e!128056))))

(assert (=> d!56903 (= res!91997 (not (contains!1379 lt!97136 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56903 (= lt!97136 e!128057)))

(declare-fun c!35154 () Bool)

(assert (=> d!56903 (= c!35154 (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!56903 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!56903 (= (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248))) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)) lt!97136)))

(declare-fun b!194678 () Bool)

(assert (=> b!194678 (= e!128059 e!128060)))

(declare-fun c!35155 () Bool)

(assert (=> b!194678 (= c!35155 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194679 () Bool)

(declare-fun res!91996 () Bool)

(assert (=> b!194679 (=> (not res!91996) (not e!128056))))

(assert (=> b!194679 (= res!91996 (not (contains!1379 lt!97136 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56903 c!35154) b!194675))

(assert (= (and d!56903 (not c!35154)) b!194668))

(assert (= (and b!194668 c!35157) b!194669))

(assert (= (and b!194668 (not c!35157)) b!194671))

(assert (= (or b!194669 b!194671) bm!19689))

(assert (= (and d!56903 res!91997) b!194679))

(assert (= (and b!194679 res!91996) b!194673))

(assert (= (and b!194673 res!91995) b!194674))

(assert (= (and b!194673 c!35156) b!194672))

(assert (= (and b!194673 (not c!35156)) b!194678))

(assert (= (and b!194672 res!91994) b!194677))

(assert (= (and b!194678 c!35155) b!194676))

(assert (= (and b!194678 (not c!35155)) b!194670))

(declare-fun b_lambda!7509 () Bool)

(assert (=> (not b_lambda!7509) (not b!194677)))

(assert (=> b!194677 t!7378))

(declare-fun b_and!11453 () Bool)

(assert (= b_and!11451 (and (=> t!7378 result!4939) b_and!11453)))

(declare-fun b_lambda!7511 () Bool)

(assert (=> (not b_lambda!7511) (not b!194669)))

(assert (=> b!194669 t!7378))

(declare-fun b_and!11455 () Bool)

(assert (= b_and!11453 (and (=> t!7378 result!4939) b_and!11455)))

(declare-fun m!221755 () Bool)

(assert (=> d!56903 m!221755))

(assert (=> d!56903 m!220855))

(declare-fun m!221757 () Bool)

(assert (=> bm!19689 m!221757))

(declare-fun m!221759 () Bool)

(assert (=> b!194669 m!221759))

(declare-fun m!221761 () Bool)

(assert (=> b!194669 m!221761))

(assert (=> b!194669 m!221087))

(assert (=> b!194669 m!220881))

(assert (=> b!194669 m!221089))

(assert (=> b!194669 m!221761))

(declare-fun m!221763 () Bool)

(assert (=> b!194669 m!221763))

(assert (=> b!194669 m!220877))

(declare-fun m!221765 () Bool)

(assert (=> b!194669 m!221765))

(assert (=> b!194669 m!220881))

(assert (=> b!194669 m!221087))

(assert (=> b!194674 m!220877))

(assert (=> b!194674 m!220877))

(assert (=> b!194674 m!220879))

(declare-fun m!221767 () Bool)

(assert (=> b!194670 m!221767))

(assert (=> b!194672 m!220877))

(assert (=> b!194672 m!220877))

(declare-fun m!221769 () Bool)

(assert (=> b!194672 m!221769))

(declare-fun m!221771 () Bool)

(assert (=> b!194679 m!221771))

(assert (=> b!194676 m!221757))

(assert (=> b!194677 m!221087))

(assert (=> b!194677 m!220881))

(assert (=> b!194677 m!221089))

(assert (=> b!194677 m!220877))

(declare-fun m!221773 () Bool)

(assert (=> b!194677 m!221773))

(assert (=> b!194677 m!220877))

(assert (=> b!194677 m!220881))

(assert (=> b!194677 m!221087))

(assert (=> b!194668 m!220877))

(assert (=> b!194668 m!220877))

(assert (=> b!194668 m!220879))

(assert (=> b!194274 d!56903))

(declare-fun d!56905 () Bool)

(assert (=> d!56905 (contains!1379 (+!322 lt!96905 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248))) lt!96901)))

(declare-fun lt!97137 () Unit!5878)

(assert (=> d!56905 (= lt!97137 (choose!1070 lt!96905 lt!96921 (zeroValue!3801 thiss!1248) lt!96901))))

(assert (=> d!56905 (contains!1379 lt!96905 lt!96901)))

(assert (=> d!56905 (= (addStillContains!164 lt!96905 lt!96921 (zeroValue!3801 thiss!1248) lt!96901) lt!97137)))

(declare-fun bs!7756 () Bool)

(assert (= bs!7756 d!56905))

(assert (=> bs!7756 m!221095))

(assert (=> bs!7756 m!221095))

(assert (=> bs!7756 m!221097))

(declare-fun m!221775 () Bool)

(assert (=> bs!7756 m!221775))

(declare-fun m!221777 () Bool)

(assert (=> bs!7756 m!221777))

(assert (=> b!194274 d!56905))

(declare-fun d!56907 () Bool)

(declare-fun e!128061 () Bool)

(assert (=> d!56907 e!128061))

(declare-fun res!91998 () Bool)

(assert (=> d!56907 (=> (not res!91998) (not e!128061))))

(declare-fun lt!97138 () ListLongMap!2477)

(assert (=> d!56907 (= res!91998 (contains!1379 lt!97138 (_1!1791 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248)))))))

(declare-fun lt!97141 () List!2449)

(assert (=> d!56907 (= lt!97138 (ListLongMap!2478 lt!97141))))

(declare-fun lt!97139 () Unit!5878)

(declare-fun lt!97140 () Unit!5878)

(assert (=> d!56907 (= lt!97139 lt!97140)))

(assert (=> d!56907 (= (getValueByKey!245 lt!97141 (_1!1791 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56907 (= lt!97140 (lemmaContainsTupThenGetReturnValue!132 lt!97141 (_1!1791 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56907 (= lt!97141 (insertStrictlySorted!135 (toList!1254 lt!96905) (_1!1791 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56907 (= (+!322 lt!96905 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248))) lt!97138)))

(declare-fun b!194680 () Bool)

(declare-fun res!91999 () Bool)

(assert (=> b!194680 (=> (not res!91999) (not e!128061))))

(assert (=> b!194680 (= res!91999 (= (getValueByKey!245 (toList!1254 lt!97138) (_1!1791 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248))))))))

(declare-fun b!194681 () Bool)

(assert (=> b!194681 (= e!128061 (contains!1381 (toList!1254 lt!97138) (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248))))))

(assert (= (and d!56907 res!91998) b!194680))

(assert (= (and b!194680 res!91999) b!194681))

(declare-fun m!221779 () Bool)

(assert (=> d!56907 m!221779))

(declare-fun m!221781 () Bool)

(assert (=> d!56907 m!221781))

(declare-fun m!221783 () Bool)

(assert (=> d!56907 m!221783))

(declare-fun m!221785 () Bool)

(assert (=> d!56907 m!221785))

(declare-fun m!221787 () Bool)

(assert (=> b!194680 m!221787))

(declare-fun m!221789 () Bool)

(assert (=> b!194681 m!221789))

(assert (=> b!194274 d!56907))

(declare-fun d!56909 () Bool)

(declare-fun e!128062 () Bool)

(assert (=> d!56909 e!128062))

(declare-fun res!92000 () Bool)

(assert (=> d!56909 (=> (not res!92000) (not e!128062))))

(declare-fun lt!97142 () ListLongMap!2477)

(assert (=> d!56909 (= res!92000 (contains!1379 lt!97142 (_1!1791 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248)))))))

(declare-fun lt!97145 () List!2449)

(assert (=> d!56909 (= lt!97142 (ListLongMap!2478 lt!97145))))

(declare-fun lt!97143 () Unit!5878)

(declare-fun lt!97144 () Unit!5878)

(assert (=> d!56909 (= lt!97143 lt!97144)))

(assert (=> d!56909 (= (getValueByKey!245 lt!97145 (_1!1791 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56909 (= lt!97144 (lemmaContainsTupThenGetReturnValue!132 lt!97145 (_1!1791 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56909 (= lt!97145 (insertStrictlySorted!135 (toList!1254 lt!96917) (_1!1791 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56909 (= (+!322 lt!96917 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248))) lt!97142)))

(declare-fun b!194682 () Bool)

(declare-fun res!92001 () Bool)

(assert (=> b!194682 (=> (not res!92001) (not e!128062))))

(assert (=> b!194682 (= res!92001 (= (getValueByKey!245 (toList!1254 lt!97142) (_1!1791 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248))))))))

(declare-fun b!194683 () Bool)

(assert (=> b!194683 (= e!128062 (contains!1381 (toList!1254 lt!97142) (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248))))))

(assert (= (and d!56909 res!92000) b!194682))

(assert (= (and b!194682 res!92001) b!194683))

(declare-fun m!221791 () Bool)

(assert (=> d!56909 m!221791))

(declare-fun m!221793 () Bool)

(assert (=> d!56909 m!221793))

(declare-fun m!221795 () Bool)

(assert (=> d!56909 m!221795))

(declare-fun m!221797 () Bool)

(assert (=> d!56909 m!221797))

(declare-fun m!221799 () Bool)

(assert (=> b!194682 m!221799))

(declare-fun m!221801 () Bool)

(assert (=> b!194683 m!221801))

(assert (=> b!194274 d!56909))

(declare-fun d!56911 () Bool)

(assert (=> d!56911 (= (apply!188 lt!96907 lt!96919) (get!2238 (getValueByKey!245 (toList!1254 lt!96907) lt!96919)))))

(declare-fun bs!7757 () Bool)

(assert (= bs!7757 d!56911))

(declare-fun m!221803 () Bool)

(assert (=> bs!7757 m!221803))

(assert (=> bs!7757 m!221803))

(declare-fun m!221805 () Bool)

(assert (=> bs!7757 m!221805))

(assert (=> b!194274 d!56911))

(declare-fun d!56913 () Bool)

(assert (=> d!56913 (= (apply!188 (+!322 lt!96922 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248))) lt!96904) (apply!188 lt!96922 lt!96904))))

(declare-fun lt!97146 () Unit!5878)

(assert (=> d!56913 (= lt!97146 (choose!1069 lt!96922 lt!96913 (minValue!3801 thiss!1248) lt!96904))))

(declare-fun e!128063 () Bool)

(assert (=> d!56913 e!128063))

(declare-fun res!92002 () Bool)

(assert (=> d!56913 (=> (not res!92002) (not e!128063))))

(assert (=> d!56913 (= res!92002 (contains!1379 lt!96922 lt!96904))))

(assert (=> d!56913 (= (addApplyDifferent!164 lt!96922 lt!96913 (minValue!3801 thiss!1248) lt!96904) lt!97146)))

(declare-fun b!194684 () Bool)

(assert (=> b!194684 (= e!128063 (not (= lt!96904 lt!96913)))))

(assert (= (and d!56913 res!92002) b!194684))

(assert (=> d!56913 m!221103))

(assert (=> d!56913 m!221121))

(assert (=> d!56913 m!221103))

(declare-fun m!221807 () Bool)

(assert (=> d!56913 m!221807))

(declare-fun m!221809 () Bool)

(assert (=> d!56913 m!221809))

(assert (=> d!56913 m!221115))

(assert (=> b!194274 d!56913))

(declare-fun d!56915 () Bool)

(declare-fun e!128065 () Bool)

(assert (=> d!56915 e!128065))

(declare-fun res!92003 () Bool)

(assert (=> d!56915 (=> res!92003 e!128065)))

(declare-fun lt!97147 () Bool)

(assert (=> d!56915 (= res!92003 (not lt!97147))))

(declare-fun lt!97148 () Bool)

(assert (=> d!56915 (= lt!97147 lt!97148)))

(declare-fun lt!97149 () Unit!5878)

(declare-fun e!128064 () Unit!5878)

(assert (=> d!56915 (= lt!97149 e!128064)))

(declare-fun c!35158 () Bool)

(assert (=> d!56915 (= c!35158 lt!97148)))

(assert (=> d!56915 (= lt!97148 (containsKey!249 (toList!1254 (+!322 lt!96905 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248)))) lt!96901))))

(assert (=> d!56915 (= (contains!1379 (+!322 lt!96905 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248))) lt!96901) lt!97147)))

(declare-fun b!194685 () Bool)

(declare-fun lt!97150 () Unit!5878)

(assert (=> b!194685 (= e!128064 lt!97150)))

(assert (=> b!194685 (= lt!97150 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 (+!322 lt!96905 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248)))) lt!96901))))

(assert (=> b!194685 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96905 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248)))) lt!96901))))

(declare-fun b!194686 () Bool)

(declare-fun Unit!5903 () Unit!5878)

(assert (=> b!194686 (= e!128064 Unit!5903)))

(declare-fun b!194687 () Bool)

(assert (=> b!194687 (= e!128065 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96905 (tuple2!3561 lt!96921 (zeroValue!3801 thiss!1248)))) lt!96901)))))

(assert (= (and d!56915 c!35158) b!194685))

(assert (= (and d!56915 (not c!35158)) b!194686))

(assert (= (and d!56915 (not res!92003)) b!194687))

(declare-fun m!221811 () Bool)

(assert (=> d!56915 m!221811))

(declare-fun m!221813 () Bool)

(assert (=> b!194685 m!221813))

(declare-fun m!221815 () Bool)

(assert (=> b!194685 m!221815))

(assert (=> b!194685 m!221815))

(declare-fun m!221817 () Bool)

(assert (=> b!194685 m!221817))

(assert (=> b!194687 m!221815))

(assert (=> b!194687 m!221815))

(assert (=> b!194687 m!221817))

(assert (=> b!194274 d!56915))

(declare-fun d!56917 () Bool)

(declare-fun e!128066 () Bool)

(assert (=> d!56917 e!128066))

(declare-fun res!92004 () Bool)

(assert (=> d!56917 (=> (not res!92004) (not e!128066))))

(declare-fun lt!97151 () ListLongMap!2477)

(assert (=> d!56917 (= res!92004 (contains!1379 lt!97151 (_1!1791 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97154 () List!2449)

(assert (=> d!56917 (= lt!97151 (ListLongMap!2478 lt!97154))))

(declare-fun lt!97152 () Unit!5878)

(declare-fun lt!97153 () Unit!5878)

(assert (=> d!56917 (= lt!97152 lt!97153)))

(assert (=> d!56917 (= (getValueByKey!245 lt!97154 (_1!1791 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248)))))))

(assert (=> d!56917 (= lt!97153 (lemmaContainsTupThenGetReturnValue!132 lt!97154 (_1!1791 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248)))))))

(assert (=> d!56917 (= lt!97154 (insertStrictlySorted!135 (toList!1254 lt!96922) (_1!1791 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248)))))))

(assert (=> d!56917 (= (+!322 lt!96922 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248))) lt!97151)))

(declare-fun b!194688 () Bool)

(declare-fun res!92005 () Bool)

(assert (=> b!194688 (=> (not res!92005) (not e!128066))))

(assert (=> b!194688 (= res!92005 (= (getValueByKey!245 (toList!1254 lt!97151) (_1!1791 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248))))))))

(declare-fun b!194689 () Bool)

(assert (=> b!194689 (= e!128066 (contains!1381 (toList!1254 lt!97151) (tuple2!3561 lt!96913 (minValue!3801 thiss!1248))))))

(assert (= (and d!56917 res!92004) b!194688))

(assert (= (and b!194688 res!92005) b!194689))

(declare-fun m!221819 () Bool)

(assert (=> d!56917 m!221819))

(declare-fun m!221821 () Bool)

(assert (=> d!56917 m!221821))

(declare-fun m!221823 () Bool)

(assert (=> d!56917 m!221823))

(declare-fun m!221825 () Bool)

(assert (=> d!56917 m!221825))

(declare-fun m!221827 () Bool)

(assert (=> b!194688 m!221827))

(declare-fun m!221829 () Bool)

(assert (=> b!194689 m!221829))

(assert (=> b!194274 d!56917))

(declare-fun d!56919 () Bool)

(assert (=> d!56919 (= (apply!188 lt!96922 lt!96904) (get!2238 (getValueByKey!245 (toList!1254 lt!96922) lt!96904)))))

(declare-fun bs!7758 () Bool)

(assert (= bs!7758 d!56919))

(declare-fun m!221831 () Bool)

(assert (=> bs!7758 m!221831))

(assert (=> bs!7758 m!221831))

(declare-fun m!221833 () Bool)

(assert (=> bs!7758 m!221833))

(assert (=> b!194274 d!56919))

(declare-fun d!56921 () Bool)

(assert (=> d!56921 (= (apply!188 (+!322 lt!96907 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248))) lt!96919) (apply!188 lt!96907 lt!96919))))

(declare-fun lt!97155 () Unit!5878)

(assert (=> d!56921 (= lt!97155 (choose!1069 lt!96907 lt!96915 (minValue!3801 thiss!1248) lt!96919))))

(declare-fun e!128067 () Bool)

(assert (=> d!56921 e!128067))

(declare-fun res!92006 () Bool)

(assert (=> d!56921 (=> (not res!92006) (not e!128067))))

(assert (=> d!56921 (= res!92006 (contains!1379 lt!96907 lt!96919))))

(assert (=> d!56921 (= (addApplyDifferent!164 lt!96907 lt!96915 (minValue!3801 thiss!1248) lt!96919) lt!97155)))

(declare-fun b!194690 () Bool)

(assert (=> b!194690 (= e!128067 (not (= lt!96919 lt!96915)))))

(assert (= (and d!56921 res!92006) b!194690))

(assert (=> d!56921 m!221099))

(assert (=> d!56921 m!221101))

(assert (=> d!56921 m!221099))

(declare-fun m!221835 () Bool)

(assert (=> d!56921 m!221835))

(declare-fun m!221837 () Bool)

(assert (=> d!56921 m!221837))

(assert (=> d!56921 m!221117))

(assert (=> b!194274 d!56921))

(declare-fun d!56923 () Bool)

(assert (=> d!56923 (= (apply!188 (+!322 lt!96917 (tuple2!3561 lt!96908 (zeroValue!3801 thiss!1248))) lt!96903) (apply!188 lt!96917 lt!96903))))

(declare-fun lt!97156 () Unit!5878)

(assert (=> d!56923 (= lt!97156 (choose!1069 lt!96917 lt!96908 (zeroValue!3801 thiss!1248) lt!96903))))

(declare-fun e!128068 () Bool)

(assert (=> d!56923 e!128068))

(declare-fun res!92007 () Bool)

(assert (=> d!56923 (=> (not res!92007) (not e!128068))))

(assert (=> d!56923 (= res!92007 (contains!1379 lt!96917 lt!96903))))

(assert (=> d!56923 (= (addApplyDifferent!164 lt!96917 lt!96908 (zeroValue!3801 thiss!1248) lt!96903) lt!97156)))

(declare-fun b!194691 () Bool)

(assert (=> b!194691 (= e!128068 (not (= lt!96903 lt!96908)))))

(assert (= (and d!56923 res!92007) b!194691))

(assert (=> d!56923 m!221107))

(assert (=> d!56923 m!221109))

(assert (=> d!56923 m!221107))

(declare-fun m!221839 () Bool)

(assert (=> d!56923 m!221839))

(declare-fun m!221841 () Bool)

(assert (=> d!56923 m!221841))

(assert (=> d!56923 m!221113))

(assert (=> b!194274 d!56923))

(declare-fun d!56925 () Bool)

(assert (=> d!56925 (= (apply!188 (+!322 lt!96907 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248))) lt!96919) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96907 (tuple2!3561 lt!96915 (minValue!3801 thiss!1248)))) lt!96919)))))

(declare-fun bs!7759 () Bool)

(assert (= bs!7759 d!56925))

(declare-fun m!221843 () Bool)

(assert (=> bs!7759 m!221843))

(assert (=> bs!7759 m!221843))

(declare-fun m!221845 () Bool)

(assert (=> bs!7759 m!221845))

(assert (=> b!194274 d!56925))

(declare-fun d!56927 () Bool)

(assert (=> d!56927 (= (apply!188 (+!322 lt!96922 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248))) lt!96904) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96922 (tuple2!3561 lt!96913 (minValue!3801 thiss!1248)))) lt!96904)))))

(declare-fun bs!7760 () Bool)

(assert (= bs!7760 d!56927))

(declare-fun m!221847 () Bool)

(assert (=> bs!7760 m!221847))

(assert (=> bs!7760 m!221847))

(declare-fun m!221849 () Bool)

(assert (=> bs!7760 m!221849))

(assert (=> b!194274 d!56927))

(declare-fun d!56929 () Bool)

(assert (=> d!56929 (= (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96676) key!828)) (not ((_ is Some!250) (getValueByKey!245 (toList!1254 lt!96676) key!828))))))

(assert (=> d!56807 d!56929))

(declare-fun d!56931 () Bool)

(assert (=> d!56931 (= (size!4203 thiss!1248) (bvadd (_size!1405 thiss!1248) (bvsdiv (bvadd (extraKeys!3697 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!194223 d!56931))

(declare-fun d!56933 () Bool)

(declare-fun e!128070 () Bool)

(assert (=> d!56933 e!128070))

(declare-fun res!92008 () Bool)

(assert (=> d!56933 (=> res!92008 e!128070)))

(declare-fun lt!97157 () Bool)

(assert (=> d!56933 (= res!92008 (not lt!97157))))

(declare-fun lt!97158 () Bool)

(assert (=> d!56933 (= lt!97157 lt!97158)))

(declare-fun lt!97159 () Unit!5878)

(declare-fun e!128069 () Unit!5878)

(assert (=> d!56933 (= lt!97159 e!128069)))

(declare-fun c!35159 () Bool)

(assert (=> d!56933 (= c!35159 lt!97158)))

(assert (=> d!56933 (= lt!97158 (containsKey!249 (toList!1254 lt!97031) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56933 (= (contains!1379 lt!97031 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) lt!97157)))

(declare-fun b!194692 () Bool)

(declare-fun lt!97160 () Unit!5878)

(assert (=> b!194692 (= e!128069 lt!97160)))

(assert (=> b!194692 (= lt!97160 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97031) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194692 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97031) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194693 () Bool)

(declare-fun Unit!5904 () Unit!5878)

(assert (=> b!194693 (= e!128069 Unit!5904)))

(declare-fun b!194694 () Bool)

(assert (=> b!194694 (= e!128070 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97031) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56933 c!35159) b!194692))

(assert (= (and d!56933 (not c!35159)) b!194693))

(assert (= (and d!56933 (not res!92008)) b!194694))

(assert (=> d!56933 m!220877))

(declare-fun m!221851 () Bool)

(assert (=> d!56933 m!221851))

(assert (=> b!194692 m!220877))

(declare-fun m!221853 () Bool)

(assert (=> b!194692 m!221853))

(assert (=> b!194692 m!220877))

(declare-fun m!221855 () Bool)

(assert (=> b!194692 m!221855))

(assert (=> b!194692 m!221855))

(declare-fun m!221857 () Bool)

(assert (=> b!194692 m!221857))

(assert (=> b!194694 m!220877))

(assert (=> b!194694 m!221855))

(assert (=> b!194694 m!221855))

(assert (=> b!194694 m!221857))

(assert (=> b!194448 d!56933))

(declare-fun d!56935 () Bool)

(declare-fun res!92009 () Bool)

(declare-fun e!128071 () Bool)

(assert (=> d!56935 (=> res!92009 e!128071)))

(assert (=> d!56935 (= res!92009 (and ((_ is Cons!2445) (toList!1254 lt!96845)) (= (_1!1791 (h!3086 (toList!1254 lt!96845))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56935 (= (containsKey!249 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000) e!128071)))

(declare-fun b!194695 () Bool)

(declare-fun e!128072 () Bool)

(assert (=> b!194695 (= e!128071 e!128072)))

(declare-fun res!92010 () Bool)

(assert (=> b!194695 (=> (not res!92010) (not e!128072))))

(assert (=> b!194695 (= res!92010 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96845))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96845))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2445) (toList!1254 lt!96845)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96845))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194696 () Bool)

(assert (=> b!194696 (= e!128072 (containsKey!249 (t!7375 (toList!1254 lt!96845)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56935 (not res!92009)) b!194695))

(assert (= (and b!194695 res!92010) b!194696))

(declare-fun m!221859 () Bool)

(assert (=> b!194696 m!221859))

(assert (=> d!56865 d!56935))

(declare-fun b!194698 () Bool)

(declare-fun e!128073 () Option!251)

(declare-fun e!128074 () Option!251)

(assert (=> b!194698 (= e!128073 e!128074)))

(declare-fun c!35161 () Bool)

(assert (=> b!194698 (= c!35161 (and ((_ is Cons!2445) (toList!1254 lt!96972)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96972))) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))))

(declare-fun b!194697 () Bool)

(assert (=> b!194697 (= e!128073 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96972)))))))

(declare-fun b!194699 () Bool)

(assert (=> b!194699 (= e!128074 (getValueByKey!245 (t!7375 (toList!1254 lt!96972)) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(declare-fun d!56937 () Bool)

(declare-fun c!35160 () Bool)

(assert (=> d!56937 (= c!35160 (and ((_ is Cons!2445) (toList!1254 lt!96972)) (= (_1!1791 (h!3086 (toList!1254 lt!96972))) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))))

(assert (=> d!56937 (= (getValueByKey!245 (toList!1254 lt!96972) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) e!128073)))

(declare-fun b!194700 () Bool)

(assert (=> b!194700 (= e!128074 None!249)))

(assert (= (and d!56937 c!35160) b!194697))

(assert (= (and d!56937 (not c!35160)) b!194698))

(assert (= (and b!194698 c!35161) b!194699))

(assert (= (and b!194698 (not c!35161)) b!194700))

(declare-fun m!221861 () Bool)

(assert (=> b!194699 m!221861))

(assert (=> b!194409 d!56937))

(declare-fun d!56939 () Bool)

(assert (=> d!56939 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96817) (_1!1791 lt!96678)))))

(declare-fun lt!97161 () Unit!5878)

(assert (=> d!56939 (= lt!97161 (choose!1067 (toList!1254 lt!96817) (_1!1791 lt!96678)))))

(declare-fun e!128075 () Bool)

(assert (=> d!56939 e!128075))

(declare-fun res!92011 () Bool)

(assert (=> d!56939 (=> (not res!92011) (not e!128075))))

(assert (=> d!56939 (= res!92011 (isStrictlySorted!357 (toList!1254 lt!96817)))))

(assert (=> d!56939 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96817) (_1!1791 lt!96678)) lt!97161)))

(declare-fun b!194701 () Bool)

(assert (=> b!194701 (= e!128075 (containsKey!249 (toList!1254 lt!96817) (_1!1791 lt!96678)))))

(assert (= (and d!56939 res!92011) b!194701))

(assert (=> d!56939 m!220933))

(assert (=> d!56939 m!220933))

(assert (=> d!56939 m!221643))

(declare-fun m!221863 () Bool)

(assert (=> d!56939 m!221863))

(declare-fun m!221865 () Bool)

(assert (=> d!56939 m!221865))

(assert (=> b!194701 m!221639))

(assert (=> b!194612 d!56939))

(declare-fun d!56941 () Bool)

(assert (=> d!56941 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96817) (_1!1791 lt!96678))) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96817) (_1!1791 lt!96678)))))))

(declare-fun bs!7761 () Bool)

(assert (= bs!7761 d!56941))

(assert (=> bs!7761 m!220933))

(declare-fun m!221867 () Bool)

(assert (=> bs!7761 m!221867))

(assert (=> b!194612 d!56941))

(assert (=> b!194612 d!56825))

(declare-fun d!56943 () Bool)

(assert (=> d!56943 (= (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) lt!96813)) (v!4256 (getValueByKey!245 (toList!1254 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) lt!96813)))))

(assert (=> d!56773 d!56943))

(declare-fun b!194703 () Bool)

(declare-fun e!128076 () Option!251)

(declare-fun e!128077 () Option!251)

(assert (=> b!194703 (= e!128076 e!128077)))

(declare-fun c!35163 () Bool)

(assert (=> b!194703 (= c!35163 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))) (not (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))) lt!96813))))))

(declare-fun b!194702 () Bool)

(assert (=> b!194702 (= e!128076 (Some!250 (_2!1791 (h!3086 (toList!1254 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))))))

(declare-fun b!194704 () Bool)

(assert (=> b!194704 (= e!128077 (getValueByKey!245 (t!7375 (toList!1254 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))) lt!96813))))

(declare-fun c!35162 () Bool)

(declare-fun d!56945 () Bool)

(assert (=> d!56945 (= c!35162 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))) (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))) lt!96813)))))

(assert (=> d!56945 (= (getValueByKey!245 (toList!1254 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) lt!96813) e!128076)))

(declare-fun b!194705 () Bool)

(assert (=> b!194705 (= e!128077 None!249)))

(assert (= (and d!56945 c!35162) b!194702))

(assert (= (and d!56945 (not c!35162)) b!194703))

(assert (= (and b!194703 c!35163) b!194704))

(assert (= (and b!194703 (not c!35163)) b!194705))

(declare-fun m!221869 () Bool)

(assert (=> b!194704 m!221869))

(assert (=> d!56773 d!56945))

(declare-fun d!56947 () Bool)

(assert (=> d!56947 (arrayContainsKey!0 (_keys!5954 lt!96671) lt!97032 #b00000000000000000000000000000000)))

(declare-fun lt!97164 () Unit!5878)

(declare-fun choose!13 (array!8233 (_ BitVec 64) (_ BitVec 32)) Unit!5878)

(assert (=> d!56947 (= lt!97164 (choose!13 (_keys!5954 lt!96671) lt!97032 #b00000000000000000000000000000000))))

(assert (=> d!56947 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!56947 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5954 lt!96671) lt!97032 #b00000000000000000000000000000000) lt!97164)))

(declare-fun bs!7762 () Bool)

(assert (= bs!7762 d!56947))

(assert (=> bs!7762 m!221453))

(declare-fun m!221871 () Bool)

(assert (=> bs!7762 m!221871))

(assert (=> b!194458 d!56947))

(declare-fun d!56949 () Bool)

(declare-fun res!92012 () Bool)

(declare-fun e!128078 () Bool)

(assert (=> d!56949 (=> res!92012 e!128078)))

(assert (=> d!56949 (= res!92012 (= (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) lt!97032))))

(assert (=> d!56949 (= (arrayContainsKey!0 (_keys!5954 lt!96671) lt!97032 #b00000000000000000000000000000000) e!128078)))

(declare-fun b!194706 () Bool)

(declare-fun e!128079 () Bool)

(assert (=> b!194706 (= e!128078 e!128079)))

(declare-fun res!92013 () Bool)

(assert (=> b!194706 (=> (not res!92013) (not e!128079))))

(assert (=> b!194706 (= res!92013 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 lt!96671))))))

(declare-fun b!194707 () Bool)

(assert (=> b!194707 (= e!128079 (arrayContainsKey!0 (_keys!5954 lt!96671) lt!97032 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56949 (not res!92012)) b!194706))

(assert (= (and b!194706 res!92013) b!194707))

(assert (=> d!56949 m!221447))

(declare-fun m!221873 () Bool)

(assert (=> b!194707 m!221873))

(assert (=> b!194458 d!56949))

(declare-fun b!194708 () Bool)

(declare-fun e!128081 () SeekEntryResult!694)

(declare-fun e!128080 () SeekEntryResult!694)

(assert (=> b!194708 (= e!128081 e!128080)))

(declare-fun lt!97166 () (_ BitVec 64))

(declare-fun lt!97165 () SeekEntryResult!694)

(assert (=> b!194708 (= lt!97166 (select (arr!3875 (_keys!5954 lt!96671)) (index!4948 lt!97165)))))

(declare-fun c!35164 () Bool)

(assert (=> b!194708 (= c!35164 (= lt!97166 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun b!194709 () Bool)

(declare-fun e!128082 () SeekEntryResult!694)

(assert (=> b!194709 (= e!128082 (seekKeyOrZeroReturnVacant!0 (x!20690 lt!97165) (index!4948 lt!97165) (index!4948 lt!97165) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) (_keys!5954 lt!96671) (mask!9223 lt!96671)))))

(declare-fun b!194710 () Bool)

(declare-fun c!35165 () Bool)

(assert (=> b!194710 (= c!35165 (= lt!97166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194710 (= e!128080 e!128082)))

(declare-fun b!194711 () Bool)

(assert (=> b!194711 (= e!128081 Undefined!694)))

(declare-fun d!56951 () Bool)

(declare-fun lt!97167 () SeekEntryResult!694)

(assert (=> d!56951 (and (or ((_ is Undefined!694) lt!97167) (not ((_ is Found!694) lt!97167)) (and (bvsge (index!4947 lt!97167) #b00000000000000000000000000000000) (bvslt (index!4947 lt!97167) (size!4199 (_keys!5954 lt!96671))))) (or ((_ is Undefined!694) lt!97167) ((_ is Found!694) lt!97167) (not ((_ is MissingZero!694) lt!97167)) (and (bvsge (index!4946 lt!97167) #b00000000000000000000000000000000) (bvslt (index!4946 lt!97167) (size!4199 (_keys!5954 lt!96671))))) (or ((_ is Undefined!694) lt!97167) ((_ is Found!694) lt!97167) ((_ is MissingZero!694) lt!97167) (not ((_ is MissingVacant!694) lt!97167)) (and (bvsge (index!4949 lt!97167) #b00000000000000000000000000000000) (bvslt (index!4949 lt!97167) (size!4199 (_keys!5954 lt!96671))))) (or ((_ is Undefined!694) lt!97167) (ite ((_ is Found!694) lt!97167) (= (select (arr!3875 (_keys!5954 lt!96671)) (index!4947 lt!97167)) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!694) lt!97167) (= (select (arr!3875 (_keys!5954 lt!96671)) (index!4946 lt!97167)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!694) lt!97167) (= (select (arr!3875 (_keys!5954 lt!96671)) (index!4949 lt!97167)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56951 (= lt!97167 e!128081)))

(declare-fun c!35166 () Bool)

(assert (=> d!56951 (= c!35166 (and ((_ is Intermediate!694) lt!97165) (undefined!1506 lt!97165)))))

(assert (=> d!56951 (= lt!97165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) (mask!9223 lt!96671)) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) (_keys!5954 lt!96671) (mask!9223 lt!96671)))))

(assert (=> d!56951 (validMask!0 (mask!9223 lt!96671))))

(assert (=> d!56951 (= (seekEntryOrOpen!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) (_keys!5954 lt!96671) (mask!9223 lt!96671)) lt!97167)))

(declare-fun b!194712 () Bool)

(assert (=> b!194712 (= e!128080 (Found!694 (index!4948 lt!97165)))))

(declare-fun b!194713 () Bool)

(assert (=> b!194713 (= e!128082 (MissingZero!694 (index!4948 lt!97165)))))

(assert (= (and d!56951 c!35166) b!194711))

(assert (= (and d!56951 (not c!35166)) b!194708))

(assert (= (and b!194708 c!35164) b!194712))

(assert (= (and b!194708 (not c!35164)) b!194710))

(assert (= (and b!194710 c!35165) b!194713))

(assert (= (and b!194710 (not c!35165)) b!194709))

(declare-fun m!221875 () Bool)

(assert (=> b!194708 m!221875))

(assert (=> b!194709 m!221447))

(declare-fun m!221877 () Bool)

(assert (=> b!194709 m!221877))

(declare-fun m!221879 () Bool)

(assert (=> d!56951 m!221879))

(declare-fun m!221881 () Bool)

(assert (=> d!56951 m!221881))

(assert (=> d!56951 m!221447))

(declare-fun m!221883 () Bool)

(assert (=> d!56951 m!221883))

(assert (=> d!56951 m!221129))

(declare-fun m!221885 () Bool)

(assert (=> d!56951 m!221885))

(declare-fun m!221887 () Bool)

(assert (=> d!56951 m!221887))

(assert (=> d!56951 m!221447))

(assert (=> d!56951 m!221881))

(assert (=> b!194458 d!56951))

(declare-fun d!56953 () Bool)

(assert (=> d!56953 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7763 () Bool)

(assert (= bs!7763 d!56953))

(assert (=> bs!7763 m!221543))

(declare-fun m!221889 () Bool)

(assert (=> bs!7763 m!221889))

(assert (=> b!194611 d!56953))

(declare-fun b!194715 () Bool)

(declare-fun e!128083 () Option!251)

(declare-fun e!128084 () Option!251)

(assert (=> b!194715 (= e!128083 e!128084)))

(declare-fun c!35168 () Bool)

(assert (=> b!194715 (= c!35168 (and ((_ is Cons!2445) (toList!1254 lt!96808)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96808))) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!194714 () Bool)

(assert (=> b!194714 (= e!128083 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96808)))))))

(declare-fun b!194716 () Bool)

(assert (=> b!194716 (= e!128084 (getValueByKey!245 (t!7375 (toList!1254 lt!96808)) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56955 () Bool)

(declare-fun c!35167 () Bool)

(assert (=> d!56955 (= c!35167 (and ((_ is Cons!2445) (toList!1254 lt!96808)) (= (_1!1791 (h!3086 (toList!1254 lt!96808))) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!56955 (= (getValueByKey!245 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) e!128083)))

(declare-fun b!194717 () Bool)

(assert (=> b!194717 (= e!128084 None!249)))

(assert (= (and d!56955 c!35167) b!194714))

(assert (= (and d!56955 (not c!35167)) b!194715))

(assert (= (and b!194715 c!35168) b!194716))

(assert (= (and b!194715 (not c!35168)) b!194717))

(assert (=> b!194716 m!220877))

(declare-fun m!221891 () Bool)

(assert (=> b!194716 m!221891))

(assert (=> b!194611 d!56955))

(assert (=> d!56697 d!56699))

(assert (=> d!56697 d!56701))

(declare-fun d!56957 () Bool)

(assert (=> d!56957 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96675) key!828))))

(assert (=> d!56957 true))

(declare-fun _$12!449 () Unit!5878)

(assert (=> d!56957 (= (choose!1067 (toList!1254 lt!96675) key!828) _$12!449)))

(declare-fun bs!7764 () Bool)

(assert (= bs!7764 d!56957))

(assert (=> bs!7764 m!220833))

(assert (=> bs!7764 m!220833))

(assert (=> bs!7764 m!220835))

(assert (=> d!56697 d!56957))

(declare-fun d!56959 () Bool)

(declare-fun res!92018 () Bool)

(declare-fun e!128089 () Bool)

(assert (=> d!56959 (=> res!92018 e!128089)))

(assert (=> d!56959 (= res!92018 (or ((_ is Nil!2446) (toList!1254 lt!96675)) ((_ is Nil!2446) (t!7375 (toList!1254 lt!96675)))))))

(assert (=> d!56959 (= (isStrictlySorted!357 (toList!1254 lt!96675)) e!128089)))

(declare-fun b!194722 () Bool)

(declare-fun e!128090 () Bool)

(assert (=> b!194722 (= e!128089 e!128090)))

(declare-fun res!92019 () Bool)

(assert (=> b!194722 (=> (not res!92019) (not e!128090))))

(assert (=> b!194722 (= res!92019 (bvslt (_1!1791 (h!3086 (toList!1254 lt!96675))) (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96675))))))))

(declare-fun b!194723 () Bool)

(assert (=> b!194723 (= e!128090 (isStrictlySorted!357 (t!7375 (toList!1254 lt!96675))))))

(assert (= (and d!56959 (not res!92018)) b!194722))

(assert (= (and b!194722 res!92019) b!194723))

(declare-fun m!221893 () Bool)

(assert (=> b!194723 m!221893))

(assert (=> d!56697 d!56959))

(declare-fun b!194725 () Bool)

(declare-fun e!128091 () Option!251)

(declare-fun e!128092 () Option!251)

(assert (=> b!194725 (= e!128091 e!128092)))

(declare-fun c!35170 () Bool)

(assert (=> b!194725 (= c!35170 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96669))) (not (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96669)))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))))

(declare-fun b!194724 () Bool)

(assert (=> b!194724 (= e!128091 (Some!250 (_2!1791 (h!3086 (t!7375 (toList!1254 lt!96669))))))))

(declare-fun b!194726 () Bool)

(assert (=> b!194726 (= e!128092 (getValueByKey!245 (t!7375 (t!7375 (toList!1254 lt!96669))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(declare-fun c!35169 () Bool)

(declare-fun d!56961 () Bool)

(assert (=> d!56961 (= c!35169 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96669))) (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96669)))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(assert (=> d!56961 (= (getValueByKey!245 (t!7375 (toList!1254 lt!96669)) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) e!128091)))

(declare-fun b!194727 () Bool)

(assert (=> b!194727 (= e!128092 None!249)))

(assert (= (and d!56961 c!35169) b!194724))

(assert (= (and d!56961 (not c!35169)) b!194725))

(assert (= (and b!194725 c!35170) b!194726))

(assert (= (and b!194725 (not c!35170)) b!194727))

(assert (=> b!194726 m!220759))

(declare-fun m!221895 () Bool)

(assert (=> b!194726 m!221895))

(assert (=> b!194428 d!56961))

(declare-fun b!194728 () Bool)

(declare-fun e!128093 () (_ BitVec 32))

(declare-fun call!19693 () (_ BitVec 32))

(assert (=> b!194728 (= e!128093 (bvadd #b00000000000000000000000000000001 call!19693))))

(declare-fun b!194729 () Bool)

(declare-fun e!128094 () (_ BitVec 32))

(assert (=> b!194729 (= e!128094 #b00000000000000000000000000000000)))

(declare-fun d!56963 () Bool)

(declare-fun lt!97168 () (_ BitVec 32))

(assert (=> d!56963 (and (bvsge lt!97168 #b00000000000000000000000000000000) (bvsle lt!97168 (bvsub (size!4199 (_keys!5954 lt!96671)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!56963 (= lt!97168 e!128094)))

(declare-fun c!35171 () Bool)

(assert (=> d!56963 (= c!35171 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 lt!96671))))))

(assert (=> d!56963 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 lt!96671))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!4199 (_keys!5954 lt!96671)) (size!4199 (_keys!5954 lt!96671))))))

(assert (=> d!56963 (= (arrayCountValidKeys!0 (_keys!5954 lt!96671) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 lt!96671))) lt!97168)))

(declare-fun bm!19690 () Bool)

(assert (=> bm!19690 (= call!19693 (arrayCountValidKeys!0 (_keys!5954 lt!96671) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!4199 (_keys!5954 lt!96671))))))

(declare-fun b!194730 () Bool)

(assert (=> b!194730 (= e!128094 e!128093)))

(declare-fun c!35172 () Bool)

(assert (=> b!194730 (= c!35172 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194731 () Bool)

(assert (=> b!194731 (= e!128093 call!19693)))

(assert (= (and d!56963 c!35171) b!194729))

(assert (= (and d!56963 (not c!35171)) b!194730))

(assert (= (and b!194730 c!35172) b!194728))

(assert (= (and b!194730 (not c!35172)) b!194731))

(assert (= (or b!194728 b!194731) bm!19690))

(declare-fun m!221897 () Bool)

(assert (=> bm!19690 m!221897))

(declare-fun m!221899 () Bool)

(assert (=> b!194730 m!221899))

(assert (=> b!194730 m!221899))

(declare-fun m!221901 () Bool)

(assert (=> b!194730 m!221901))

(assert (=> bm!19677 d!56963))

(declare-fun d!56965 () Bool)

(declare-fun e!128096 () Bool)

(assert (=> d!56965 e!128096))

(declare-fun res!92020 () Bool)

(assert (=> d!56965 (=> res!92020 e!128096)))

(declare-fun lt!97169 () Bool)

(assert (=> d!56965 (= res!92020 (not lt!97169))))

(declare-fun lt!97170 () Bool)

(assert (=> d!56965 (= lt!97169 lt!97170)))

(declare-fun lt!97171 () Unit!5878)

(declare-fun e!128095 () Unit!5878)

(assert (=> d!56965 (= lt!97171 e!128095)))

(declare-fun c!35173 () Bool)

(assert (=> d!56965 (= c!35173 lt!97170)))

(assert (=> d!56965 (= lt!97170 (containsKey!249 (toList!1254 lt!97020) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!56965 (= (contains!1379 lt!97020 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) lt!97169)))

(declare-fun b!194732 () Bool)

(declare-fun lt!97172 () Unit!5878)

(assert (=> b!194732 (= e!128095 lt!97172)))

(assert (=> b!194732 (= lt!97172 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97020) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(assert (=> b!194732 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97020) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!194733 () Bool)

(declare-fun Unit!5905 () Unit!5878)

(assert (=> b!194733 (= e!128095 Unit!5905)))

(declare-fun b!194734 () Bool)

(assert (=> b!194734 (= e!128096 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97020) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))))

(assert (= (and d!56965 c!35173) b!194732))

(assert (= (and d!56965 (not c!35173)) b!194733))

(assert (= (and d!56965 (not res!92020)) b!194734))

(declare-fun m!221903 () Bool)

(assert (=> d!56965 m!221903))

(declare-fun m!221905 () Bool)

(assert (=> b!194732 m!221905))

(assert (=> b!194732 m!221411))

(assert (=> b!194732 m!221411))

(declare-fun m!221907 () Bool)

(assert (=> b!194732 m!221907))

(assert (=> b!194734 m!221411))

(assert (=> b!194734 m!221411))

(assert (=> b!194734 m!221907))

(assert (=> d!56783 d!56965))

(declare-fun b!194736 () Bool)

(declare-fun e!128097 () Option!251)

(declare-fun e!128098 () Option!251)

(assert (=> b!194736 (= e!128097 e!128098)))

(declare-fun c!35175 () Bool)

(assert (=> b!194736 (= c!35175 (and ((_ is Cons!2445) lt!97023) (not (= (_1!1791 (h!3086 lt!97023)) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))))

(declare-fun b!194735 () Bool)

(assert (=> b!194735 (= e!128097 (Some!250 (_2!1791 (h!3086 lt!97023))))))

(declare-fun b!194737 () Bool)

(assert (=> b!194737 (= e!128098 (getValueByKey!245 (t!7375 lt!97023) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(declare-fun d!56967 () Bool)

(declare-fun c!35174 () Bool)

(assert (=> d!56967 (= c!35174 (and ((_ is Cons!2445) lt!97023) (= (_1!1791 (h!3086 lt!97023)) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!56967 (= (getValueByKey!245 lt!97023 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) e!128097)))

(declare-fun b!194738 () Bool)

(assert (=> b!194738 (= e!128098 None!249)))

(assert (= (and d!56967 c!35174) b!194735))

(assert (= (and d!56967 (not c!35174)) b!194736))

(assert (= (and b!194736 c!35175) b!194737))

(assert (= (and b!194736 (not c!35175)) b!194738))

(declare-fun m!221909 () Bool)

(assert (=> b!194737 m!221909))

(assert (=> d!56783 d!56967))

(declare-fun d!56969 () Bool)

(assert (=> d!56969 (= (getValueByKey!245 lt!97023 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(declare-fun lt!97173 () Unit!5878)

(assert (=> d!56969 (= lt!97173 (choose!1068 lt!97023 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(declare-fun e!128099 () Bool)

(assert (=> d!56969 e!128099))

(declare-fun res!92021 () Bool)

(assert (=> d!56969 (=> (not res!92021) (not e!128099))))

(assert (=> d!56969 (= res!92021 (isStrictlySorted!357 lt!97023))))

(assert (=> d!56969 (= (lemmaContainsTupThenGetReturnValue!132 lt!97023 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) lt!97173)))

(declare-fun b!194739 () Bool)

(declare-fun res!92022 () Bool)

(assert (=> b!194739 (=> (not res!92022) (not e!128099))))

(assert (=> b!194739 (= res!92022 (containsKey!249 lt!97023 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!194740 () Bool)

(assert (=> b!194740 (= e!128099 (contains!1381 lt!97023 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))))

(assert (= (and d!56969 res!92021) b!194739))

(assert (= (and b!194739 res!92022) b!194740))

(assert (=> d!56969 m!221405))

(declare-fun m!221911 () Bool)

(assert (=> d!56969 m!221911))

(declare-fun m!221913 () Bool)

(assert (=> d!56969 m!221913))

(declare-fun m!221915 () Bool)

(assert (=> b!194739 m!221915))

(declare-fun m!221917 () Bool)

(assert (=> b!194740 m!221917))

(assert (=> d!56783 d!56969))

(declare-fun e!128100 () List!2449)

(declare-fun bm!19691 () Bool)

(declare-fun call!19695 () List!2449)

(declare-fun c!35177 () Bool)

(assert (=> bm!19691 (= call!19695 ($colon$colon!103 e!128100 (ite c!35177 (h!3086 (toList!1254 lt!96811)) (tuple2!3561 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))))

(declare-fun c!35176 () Bool)

(assert (=> bm!19691 (= c!35176 c!35177)))

(declare-fun b!194741 () Bool)

(declare-fun e!128104 () List!2449)

(declare-fun call!19694 () List!2449)

(assert (=> b!194741 (= e!128104 call!19694)))

(declare-fun b!194742 () Bool)

(declare-fun c!35178 () Bool)

(assert (=> b!194742 (= c!35178 (and ((_ is Cons!2445) (toList!1254 lt!96811)) (bvsgt (_1!1791 (h!3086 (toList!1254 lt!96811))) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))))

(declare-fun e!128102 () List!2449)

(assert (=> b!194742 (= e!128104 e!128102)))

(declare-fun e!128103 () Bool)

(declare-fun lt!97174 () List!2449)

(declare-fun b!194743 () Bool)

(assert (=> b!194743 (= e!128103 (contains!1381 lt!97174 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))))

(declare-fun bm!19692 () Bool)

(declare-fun call!19696 () List!2449)

(assert (=> bm!19692 (= call!19696 call!19694)))

(declare-fun b!194744 () Bool)

(declare-fun e!128101 () List!2449)

(assert (=> b!194744 (= e!128101 e!128104)))

(declare-fun c!35179 () Bool)

(assert (=> b!194744 (= c!35179 (and ((_ is Cons!2445) (toList!1254 lt!96811)) (= (_1!1791 (h!3086 (toList!1254 lt!96811))) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))))

(declare-fun d!56971 () Bool)

(assert (=> d!56971 e!128103))

(declare-fun res!92023 () Bool)

(assert (=> d!56971 (=> (not res!92023) (not e!128103))))

(assert (=> d!56971 (= res!92023 (isStrictlySorted!357 lt!97174))))

(assert (=> d!56971 (= lt!97174 e!128101)))

(assert (=> d!56971 (= c!35177 (and ((_ is Cons!2445) (toList!1254 lt!96811)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96811))) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!56971 (isStrictlySorted!357 (toList!1254 lt!96811))))

(assert (=> d!56971 (= (insertStrictlySorted!135 (toList!1254 lt!96811) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) lt!97174)))

(declare-fun bm!19693 () Bool)

(assert (=> bm!19693 (= call!19694 call!19695)))

(declare-fun b!194745 () Bool)

(assert (=> b!194745 (= e!128102 call!19696)))

(declare-fun b!194746 () Bool)

(assert (=> b!194746 (= e!128100 (insertStrictlySorted!135 (t!7375 (toList!1254 lt!96811)) (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!194747 () Bool)

(assert (=> b!194747 (= e!128102 call!19696)))

(declare-fun b!194748 () Bool)

(declare-fun res!92024 () Bool)

(assert (=> b!194748 (=> (not res!92024) (not e!128103))))

(assert (=> b!194748 (= res!92024 (containsKey!249 lt!97174 (_1!1791 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!194749 () Bool)

(assert (=> b!194749 (= e!128101 call!19695)))

(declare-fun b!194750 () Bool)

(assert (=> b!194750 (= e!128100 (ite c!35179 (t!7375 (toList!1254 lt!96811)) (ite c!35178 (Cons!2445 (h!3086 (toList!1254 lt!96811)) (t!7375 (toList!1254 lt!96811))) Nil!2446)))))

(assert (= (and d!56971 c!35177) b!194749))

(assert (= (and d!56971 (not c!35177)) b!194744))

(assert (= (and b!194744 c!35179) b!194741))

(assert (= (and b!194744 (not c!35179)) b!194742))

(assert (= (and b!194742 c!35178) b!194747))

(assert (= (and b!194742 (not c!35178)) b!194745))

(assert (= (or b!194747 b!194745) bm!19692))

(assert (= (or b!194741 bm!19692) bm!19693))

(assert (= (or b!194749 bm!19693) bm!19691))

(assert (= (and bm!19691 c!35176) b!194746))

(assert (= (and bm!19691 (not c!35176)) b!194750))

(assert (= (and d!56971 res!92023) b!194748))

(assert (= (and b!194748 res!92024) b!194743))

(declare-fun m!221919 () Bool)

(assert (=> bm!19691 m!221919))

(declare-fun m!221921 () Bool)

(assert (=> b!194748 m!221921))

(declare-fun m!221923 () Bool)

(assert (=> b!194743 m!221923))

(declare-fun m!221925 () Bool)

(assert (=> b!194746 m!221925))

(declare-fun m!221927 () Bool)

(assert (=> d!56971 m!221927))

(declare-fun m!221929 () Bool)

(assert (=> d!56971 m!221929))

(assert (=> d!56783 d!56971))

(declare-fun d!56973 () Bool)

(assert (=> d!56973 (= (apply!188 lt!96963 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2238 (getValueByKey!245 (toList!1254 lt!96963) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7765 () Bool)

(assert (= bs!7765 d!56973))

(assert (=> bs!7765 m!220877))

(declare-fun m!221931 () Bool)

(assert (=> bs!7765 m!221931))

(assert (=> bs!7765 m!221931))

(declare-fun m!221933 () Bool)

(assert (=> bs!7765 m!221933))

(assert (=> b!194399 d!56973))

(assert (=> b!194399 d!56831))

(declare-fun d!56975 () Bool)

(declare-fun e!128106 () Bool)

(assert (=> d!56975 e!128106))

(declare-fun res!92025 () Bool)

(assert (=> d!56975 (=> res!92025 e!128106)))

(declare-fun lt!97175 () Bool)

(assert (=> d!56975 (= res!92025 (not lt!97175))))

(declare-fun lt!97176 () Bool)

(assert (=> d!56975 (= lt!97175 lt!97176)))

(declare-fun lt!97177 () Unit!5878)

(declare-fun e!128105 () Unit!5878)

(assert (=> d!56975 (= lt!97177 e!128105)))

(declare-fun c!35180 () Bool)

(assert (=> d!56975 (= c!35180 lt!97176)))

(assert (=> d!56975 (= lt!97176 (containsKey!249 (toList!1254 lt!97042) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!56975 (= (contains!1379 lt!97042 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!97175)))

(declare-fun b!194751 () Bool)

(declare-fun lt!97178 () Unit!5878)

(assert (=> b!194751 (= e!128105 lt!97178)))

(assert (=> b!194751 (= lt!97178 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97042) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> b!194751 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97042) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!194752 () Bool)

(declare-fun Unit!5906 () Unit!5878)

(assert (=> b!194752 (= e!128105 Unit!5906)))

(declare-fun b!194753 () Bool)

(assert (=> b!194753 (= e!128106 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97042) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (= (and d!56975 c!35180) b!194751))

(assert (= (and d!56975 (not c!35180)) b!194752))

(assert (= (and d!56975 (not res!92025)) b!194753))

(declare-fun m!221935 () Bool)

(assert (=> d!56975 m!221935))

(declare-fun m!221937 () Bool)

(assert (=> b!194751 m!221937))

(assert (=> b!194751 m!221489))

(assert (=> b!194751 m!221489))

(declare-fun m!221939 () Bool)

(assert (=> b!194751 m!221939))

(assert (=> b!194753 m!221489))

(assert (=> b!194753 m!221489))

(assert (=> b!194753 m!221939))

(assert (=> d!56803 d!56975))

(declare-fun b!194755 () Bool)

(declare-fun e!128107 () Option!251)

(declare-fun e!128108 () Option!251)

(assert (=> b!194755 (= e!128107 e!128108)))

(declare-fun c!35182 () Bool)

(assert (=> b!194755 (= c!35182 (and ((_ is Cons!2445) lt!97045) (not (= (_1!1791 (h!3086 lt!97045)) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun b!194754 () Bool)

(assert (=> b!194754 (= e!128107 (Some!250 (_2!1791 (h!3086 lt!97045))))))

(declare-fun b!194756 () Bool)

(assert (=> b!194756 (= e!128108 (getValueByKey!245 (t!7375 lt!97045) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun d!56977 () Bool)

(declare-fun c!35181 () Bool)

(assert (=> d!56977 (= c!35181 (and ((_ is Cons!2445) lt!97045) (= (_1!1791 (h!3086 lt!97045)) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!56977 (= (getValueByKey!245 lt!97045 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) e!128107)))

(declare-fun b!194757 () Bool)

(assert (=> b!194757 (= e!128108 None!249)))

(assert (= (and d!56977 c!35181) b!194754))

(assert (= (and d!56977 (not c!35181)) b!194755))

(assert (= (and b!194755 c!35182) b!194756))

(assert (= (and b!194755 (not c!35182)) b!194757))

(declare-fun m!221941 () Bool)

(assert (=> b!194756 m!221941))

(assert (=> d!56803 d!56977))

(declare-fun d!56979 () Bool)

(assert (=> d!56979 (= (getValueByKey!245 lt!97045 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97179 () Unit!5878)

(assert (=> d!56979 (= lt!97179 (choose!1068 lt!97045 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun e!128109 () Bool)

(assert (=> d!56979 e!128109))

(declare-fun res!92026 () Bool)

(assert (=> d!56979 (=> (not res!92026) (not e!128109))))

(assert (=> d!56979 (= res!92026 (isStrictlySorted!357 lt!97045))))

(assert (=> d!56979 (= (lemmaContainsTupThenGetReturnValue!132 lt!97045 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!97179)))

(declare-fun b!194758 () Bool)

(declare-fun res!92027 () Bool)

(assert (=> b!194758 (=> (not res!92027) (not e!128109))))

(assert (=> b!194758 (= res!92027 (containsKey!249 lt!97045 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!194759 () Bool)

(assert (=> b!194759 (= e!128109 (contains!1381 lt!97045 (tuple2!3561 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (= (and d!56979 res!92026) b!194758))

(assert (= (and b!194758 res!92027) b!194759))

(assert (=> d!56979 m!221483))

(declare-fun m!221943 () Bool)

(assert (=> d!56979 m!221943))

(declare-fun m!221945 () Bool)

(assert (=> d!56979 m!221945))

(declare-fun m!221947 () Bool)

(assert (=> b!194758 m!221947))

(declare-fun m!221949 () Bool)

(assert (=> b!194759 m!221949))

(assert (=> d!56803 d!56979))

(declare-fun bm!19694 () Bool)

(declare-fun c!35184 () Bool)

(declare-fun call!19698 () List!2449)

(declare-fun e!128110 () List!2449)

(assert (=> bm!19694 (= call!19698 ($colon$colon!103 e!128110 (ite c!35184 (h!3086 (toList!1254 call!19634)) (tuple2!3561 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun c!35183 () Bool)

(assert (=> bm!19694 (= c!35183 c!35184)))

(declare-fun b!194760 () Bool)

(declare-fun e!128114 () List!2449)

(declare-fun call!19697 () List!2449)

(assert (=> b!194760 (= e!128114 call!19697)))

(declare-fun b!194761 () Bool)

(declare-fun c!35185 () Bool)

(assert (=> b!194761 (= c!35185 (and ((_ is Cons!2445) (toList!1254 call!19634)) (bvsgt (_1!1791 (h!3086 (toList!1254 call!19634))) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun e!128112 () List!2449)

(assert (=> b!194761 (= e!128114 e!128112)))

(declare-fun b!194762 () Bool)

(declare-fun e!128113 () Bool)

(declare-fun lt!97180 () List!2449)

(assert (=> b!194762 (= e!128113 (contains!1381 lt!97180 (tuple2!3561 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun bm!19695 () Bool)

(declare-fun call!19699 () List!2449)

(assert (=> bm!19695 (= call!19699 call!19697)))

(declare-fun b!194763 () Bool)

(declare-fun e!128111 () List!2449)

(assert (=> b!194763 (= e!128111 e!128114)))

(declare-fun c!35186 () Bool)

(assert (=> b!194763 (= c!35186 (and ((_ is Cons!2445) (toList!1254 call!19634)) (= (_1!1791 (h!3086 (toList!1254 call!19634))) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun d!56981 () Bool)

(assert (=> d!56981 e!128113))

(declare-fun res!92028 () Bool)

(assert (=> d!56981 (=> (not res!92028) (not e!128113))))

(assert (=> d!56981 (= res!92028 (isStrictlySorted!357 lt!97180))))

(assert (=> d!56981 (= lt!97180 e!128111)))

(assert (=> d!56981 (= c!35184 (and ((_ is Cons!2445) (toList!1254 call!19634)) (bvslt (_1!1791 (h!3086 (toList!1254 call!19634))) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!56981 (isStrictlySorted!357 (toList!1254 call!19634))))

(assert (=> d!56981 (= (insertStrictlySorted!135 (toList!1254 call!19634) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!97180)))

(declare-fun bm!19696 () Bool)

(assert (=> bm!19696 (= call!19697 call!19698)))

(declare-fun b!194764 () Bool)

(assert (=> b!194764 (= e!128112 call!19699)))

(declare-fun b!194765 () Bool)

(assert (=> b!194765 (= e!128110 (insertStrictlySorted!135 (t!7375 (toList!1254 call!19634)) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!194766 () Bool)

(assert (=> b!194766 (= e!128112 call!19699)))

(declare-fun b!194767 () Bool)

(declare-fun res!92029 () Bool)

(assert (=> b!194767 (=> (not res!92029) (not e!128113))))

(assert (=> b!194767 (= res!92029 (containsKey!249 lt!97180 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!194768 () Bool)

(assert (=> b!194768 (= e!128111 call!19698)))

(declare-fun b!194769 () Bool)

(assert (=> b!194769 (= e!128110 (ite c!35186 (t!7375 (toList!1254 call!19634)) (ite c!35185 (Cons!2445 (h!3086 (toList!1254 call!19634)) (t!7375 (toList!1254 call!19634))) Nil!2446)))))

(assert (= (and d!56981 c!35184) b!194768))

(assert (= (and d!56981 (not c!35184)) b!194763))

(assert (= (and b!194763 c!35186) b!194760))

(assert (= (and b!194763 (not c!35186)) b!194761))

(assert (= (and b!194761 c!35185) b!194766))

(assert (= (and b!194761 (not c!35185)) b!194764))

(assert (= (or b!194766 b!194764) bm!19695))

(assert (= (or b!194760 bm!19695) bm!19696))

(assert (= (or b!194768 bm!19696) bm!19694))

(assert (= (and bm!19694 c!35183) b!194765))

(assert (= (and bm!19694 (not c!35183)) b!194769))

(assert (= (and d!56981 res!92028) b!194767))

(assert (= (and b!194767 res!92029) b!194762))

(declare-fun m!221951 () Bool)

(assert (=> bm!19694 m!221951))

(declare-fun m!221953 () Bool)

(assert (=> b!194767 m!221953))

(declare-fun m!221955 () Bool)

(assert (=> b!194762 m!221955))

(declare-fun m!221957 () Bool)

(assert (=> b!194765 m!221957))

(declare-fun m!221959 () Bool)

(assert (=> d!56981 m!221959))

(declare-fun m!221961 () Bool)

(assert (=> d!56981 m!221961))

(assert (=> d!56803 d!56981))

(assert (=> d!56747 d!56743))

(assert (=> d!56747 d!56741))

(declare-fun d!56983 () Bool)

(assert (=> d!56983 (contains!1379 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) lt!96832)))

(assert (=> d!56983 true))

(declare-fun _$35!416 () Unit!5878)

(assert (=> d!56983 (= (choose!1070 lt!96836 lt!96852 (zeroValue!3801 thiss!1248) lt!96832) _$35!416)))

(declare-fun bs!7766 () Bool)

(assert (= bs!7766 d!56983))

(assert (=> bs!7766 m!220977))

(assert (=> bs!7766 m!220977))

(assert (=> bs!7766 m!220979))

(assert (=> d!56747 d!56983))

(declare-fun d!56985 () Bool)

(declare-fun e!128116 () Bool)

(assert (=> d!56985 e!128116))

(declare-fun res!92030 () Bool)

(assert (=> d!56985 (=> res!92030 e!128116)))

(declare-fun lt!97181 () Bool)

(assert (=> d!56985 (= res!92030 (not lt!97181))))

(declare-fun lt!97182 () Bool)

(assert (=> d!56985 (= lt!97181 lt!97182)))

(declare-fun lt!97183 () Unit!5878)

(declare-fun e!128115 () Unit!5878)

(assert (=> d!56985 (= lt!97183 e!128115)))

(declare-fun c!35187 () Bool)

(assert (=> d!56985 (= c!35187 lt!97182)))

(assert (=> d!56985 (= lt!97182 (containsKey!249 (toList!1254 lt!96836) lt!96832))))

(assert (=> d!56985 (= (contains!1379 lt!96836 lt!96832) lt!97181)))

(declare-fun b!194771 () Bool)

(declare-fun lt!97184 () Unit!5878)

(assert (=> b!194771 (= e!128115 lt!97184)))

(assert (=> b!194771 (= lt!97184 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96836) lt!96832))))

(assert (=> b!194771 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96836) lt!96832))))

(declare-fun b!194772 () Bool)

(declare-fun Unit!5907 () Unit!5878)

(assert (=> b!194772 (= e!128115 Unit!5907)))

(declare-fun b!194773 () Bool)

(assert (=> b!194773 (= e!128116 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96836) lt!96832)))))

(assert (= (and d!56985 c!35187) b!194771))

(assert (= (and d!56985 (not c!35187)) b!194772))

(assert (= (and d!56985 (not res!92030)) b!194773))

(declare-fun m!221963 () Bool)

(assert (=> d!56985 m!221963))

(declare-fun m!221965 () Bool)

(assert (=> b!194771 m!221965))

(declare-fun m!221967 () Bool)

(assert (=> b!194771 m!221967))

(assert (=> b!194771 m!221967))

(declare-fun m!221969 () Bool)

(assert (=> b!194771 m!221969))

(assert (=> b!194773 m!221967))

(assert (=> b!194773 m!221967))

(assert (=> b!194773 m!221969))

(assert (=> d!56747 d!56985))

(declare-fun d!56987 () Bool)

(assert (=> d!56987 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97185 () Unit!5878)

(assert (=> d!56987 (= lt!97185 (choose!1067 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128117 () Bool)

(assert (=> d!56987 e!128117))

(declare-fun res!92031 () Bool)

(assert (=> d!56987 (=> (not res!92031) (not e!128117))))

(assert (=> d!56987 (= res!92031 (isStrictlySorted!357 (toList!1254 lt!96845)))))

(assert (=> d!56987 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000) lt!97185)))

(declare-fun b!194774 () Bool)

(assert (=> b!194774 (= e!128117 (containsKey!249 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56987 res!92031) b!194774))

(assert (=> d!56987 m!221501))

(assert (=> d!56987 m!221501))

(assert (=> d!56987 m!221671))

(declare-fun m!221971 () Bool)

(assert (=> d!56987 m!221971))

(assert (=> d!56987 m!221689))

(assert (=> b!194774 m!221667))

(assert (=> b!194631 d!56987))

(declare-fun d!56989 () Bool)

(assert (=> d!56989 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7767 () Bool)

(assert (= bs!7767 d!56989))

(assert (=> bs!7767 m!221501))

(declare-fun m!221973 () Bool)

(assert (=> bs!7767 m!221973))

(assert (=> b!194631 d!56989))

(declare-fun b!194776 () Bool)

(declare-fun e!128118 () Option!251)

(declare-fun e!128119 () Option!251)

(assert (=> b!194776 (= e!128118 e!128119)))

(declare-fun c!35189 () Bool)

(assert (=> b!194776 (= c!35189 (and ((_ is Cons!2445) (toList!1254 lt!96845)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96845))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194775 () Bool)

(assert (=> b!194775 (= e!128118 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96845)))))))

(declare-fun b!194777 () Bool)

(assert (=> b!194777 (= e!128119 (getValueByKey!245 (t!7375 (toList!1254 lt!96845)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!56991 () Bool)

(declare-fun c!35188 () Bool)

(assert (=> d!56991 (= c!35188 (and ((_ is Cons!2445) (toList!1254 lt!96845)) (= (_1!1791 (h!3086 (toList!1254 lt!96845))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56991 (= (getValueByKey!245 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000) e!128118)))

(declare-fun b!194778 () Bool)

(assert (=> b!194778 (= e!128119 None!249)))

(assert (= (and d!56991 c!35188) b!194775))

(assert (= (and d!56991 (not c!35188)) b!194776))

(assert (= (and b!194776 c!35189) b!194777))

(assert (= (and b!194776 (not c!35189)) b!194778))

(declare-fun m!221975 () Bool)

(assert (=> b!194777 m!221975))

(assert (=> b!194631 d!56991))

(assert (=> b!194526 d!56677))

(declare-fun d!56993 () Bool)

(assert (=> d!56993 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96853) lt!96835)) (v!4256 (getValueByKey!245 (toList!1254 lt!96853) lt!96835)))))

(assert (=> d!56723 d!56993))

(declare-fun b!194780 () Bool)

(declare-fun e!128120 () Option!251)

(declare-fun e!128121 () Option!251)

(assert (=> b!194780 (= e!128120 e!128121)))

(declare-fun c!35191 () Bool)

(assert (=> b!194780 (= c!35191 (and ((_ is Cons!2445) (toList!1254 lt!96853)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96853))) lt!96835))))))

(declare-fun b!194779 () Bool)

(assert (=> b!194779 (= e!128120 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96853)))))))

(declare-fun b!194781 () Bool)

(assert (=> b!194781 (= e!128121 (getValueByKey!245 (t!7375 (toList!1254 lt!96853)) lt!96835))))

(declare-fun d!56995 () Bool)

(declare-fun c!35190 () Bool)

(assert (=> d!56995 (= c!35190 (and ((_ is Cons!2445) (toList!1254 lt!96853)) (= (_1!1791 (h!3086 (toList!1254 lt!96853))) lt!96835)))))

(assert (=> d!56995 (= (getValueByKey!245 (toList!1254 lt!96853) lt!96835) e!128120)))

(declare-fun b!194782 () Bool)

(assert (=> b!194782 (= e!128121 None!249)))

(assert (= (and d!56995 c!35190) b!194779))

(assert (= (and d!56995 (not c!35190)) b!194780))

(assert (= (and b!194780 c!35191) b!194781))

(assert (= (and b!194780 (not c!35191)) b!194782))

(declare-fun m!221977 () Bool)

(assert (=> b!194781 m!221977))

(assert (=> d!56723 d!56995))

(declare-fun d!56997 () Bool)

(assert (=> d!56997 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96801) lt!96813)) (v!4256 (getValueByKey!245 (toList!1254 lt!96801) lt!96813)))))

(assert (=> d!56775 d!56997))

(declare-fun b!194784 () Bool)

(declare-fun e!128122 () Option!251)

(declare-fun e!128123 () Option!251)

(assert (=> b!194784 (= e!128122 e!128123)))

(declare-fun c!35193 () Bool)

(assert (=> b!194784 (= c!35193 (and ((_ is Cons!2445) (toList!1254 lt!96801)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96801))) lt!96813))))))

(declare-fun b!194783 () Bool)

(assert (=> b!194783 (= e!128122 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96801)))))))

(declare-fun b!194785 () Bool)

(assert (=> b!194785 (= e!128123 (getValueByKey!245 (t!7375 (toList!1254 lt!96801)) lt!96813))))

(declare-fun d!56999 () Bool)

(declare-fun c!35192 () Bool)

(assert (=> d!56999 (= c!35192 (and ((_ is Cons!2445) (toList!1254 lt!96801)) (= (_1!1791 (h!3086 (toList!1254 lt!96801))) lt!96813)))))

(assert (=> d!56999 (= (getValueByKey!245 (toList!1254 lt!96801) lt!96813) e!128122)))

(declare-fun b!194786 () Bool)

(assert (=> b!194786 (= e!128123 None!249)))

(assert (= (and d!56999 c!35192) b!194783))

(assert (= (and d!56999 (not c!35192)) b!194784))

(assert (= (and b!194784 c!35193) b!194785))

(assert (= (and b!194784 (not c!35193)) b!194786))

(declare-fun m!221979 () Bool)

(assert (=> b!194785 m!221979))

(assert (=> d!56775 d!56999))

(declare-fun b!194787 () Bool)

(declare-fun e!128124 () (_ BitVec 32))

(declare-fun call!19700 () (_ BitVec 32))

(assert (=> b!194787 (= e!128124 (bvadd #b00000000000000000000000000000001 call!19700))))

(declare-fun b!194788 () Bool)

(declare-fun e!128125 () (_ BitVec 32))

(assert (=> b!194788 (= e!128125 #b00000000000000000000000000000000)))

(declare-fun d!57001 () Bool)

(declare-fun lt!97186 () (_ BitVec 32))

(assert (=> d!57001 (and (bvsge lt!97186 #b00000000000000000000000000000000) (bvsle lt!97186 (bvsub (size!4199 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!57001 (= lt!97186 e!128125)))

(declare-fun c!35194 () Bool)

(assert (=> d!57001 (= c!35194 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!57001 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!4199 (_keys!5954 thiss!1248)) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!57001 (= (arrayCountValidKeys!0 (_keys!5954 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))) lt!97186)))

(declare-fun bm!19697 () Bool)

(assert (=> bm!19697 (= call!19700 (arrayCountValidKeys!0 (_keys!5954 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194789 () Bool)

(assert (=> b!194789 (= e!128125 e!128124)))

(declare-fun c!35195 () Bool)

(assert (=> b!194789 (= c!35195 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194790 () Bool)

(assert (=> b!194790 (= e!128124 call!19700)))

(assert (= (and d!57001 c!35194) b!194788))

(assert (= (and d!57001 (not c!35194)) b!194789))

(assert (= (and b!194789 c!35195) b!194787))

(assert (= (and b!194789 (not c!35195)) b!194790))

(assert (= (or b!194787 b!194790) bm!19697))

(declare-fun m!221981 () Bool)

(assert (=> bm!19697 m!221981))

(declare-fun m!221983 () Bool)

(assert (=> b!194789 m!221983))

(assert (=> b!194789 m!221983))

(declare-fun m!221985 () Bool)

(assert (=> b!194789 m!221985))

(assert (=> bm!19673 d!57001))

(assert (=> b!194285 d!56677))

(declare-fun d!57003 () Bool)

(assert (=> d!57003 (= (isDefined!198 (getValueByKey!245 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))) (not (isEmpty!487 (getValueByKey!245 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))))

(declare-fun bs!7768 () Bool)

(assert (= bs!7768 d!57003))

(assert (=> bs!7768 m!221043))

(declare-fun m!221987 () Bool)

(assert (=> bs!7768 m!221987))

(assert (=> b!194227 d!57003))

(declare-fun b!194792 () Bool)

(declare-fun e!128126 () Option!251)

(declare-fun e!128127 () Option!251)

(assert (=> b!194792 (= e!128126 e!128127)))

(declare-fun c!35197 () Bool)

(assert (=> b!194792 (= c!35197 (and ((_ is Cons!2445) (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (not (= (_1!1791 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))))

(declare-fun b!194791 () Bool)

(assert (=> b!194791 (= e!128126 (Some!250 (_2!1791 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))))))

(declare-fun b!194793 () Bool)

(assert (=> b!194793 (= e!128127 (getValueByKey!245 (t!7375 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(declare-fun c!35196 () Bool)

(declare-fun d!57005 () Bool)

(assert (=> d!57005 (= c!35196 (and ((_ is Cons!2445) (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (= (_1!1791 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(assert (=> d!57005 (= (getValueByKey!245 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) e!128126)))

(declare-fun b!194794 () Bool)

(assert (=> b!194794 (= e!128127 None!249)))

(assert (= (and d!57005 c!35196) b!194791))

(assert (= (and d!57005 (not c!35196)) b!194792))

(assert (= (and b!194792 c!35197) b!194793))

(assert (= (and b!194792 (not c!35197)) b!194794))

(assert (=> b!194793 m!220759))

(declare-fun m!221989 () Bool)

(assert (=> b!194793 m!221989))

(assert (=> b!194227 d!57005))

(assert (=> d!56835 d!56689))

(declare-fun d!57007 () Bool)

(declare-fun e!128129 () Bool)

(assert (=> d!57007 e!128129))

(declare-fun res!92032 () Bool)

(assert (=> d!57007 (=> res!92032 e!128129)))

(declare-fun lt!97187 () Bool)

(assert (=> d!57007 (= res!92032 (not lt!97187))))

(declare-fun lt!97188 () Bool)

(assert (=> d!57007 (= lt!97187 lt!97188)))

(declare-fun lt!97189 () Unit!5878)

(declare-fun e!128128 () Unit!5878)

(assert (=> d!57007 (= lt!97189 e!128128)))

(declare-fun c!35198 () Bool)

(assert (=> d!57007 (= c!35198 lt!97188)))

(assert (=> d!57007 (= lt!97188 (containsKey!249 (toList!1254 lt!96976) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!57007 (= (contains!1379 lt!96976 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) lt!97187)))

(declare-fun b!194795 () Bool)

(declare-fun lt!97190 () Unit!5878)

(assert (=> b!194795 (= e!128128 lt!97190)))

(assert (=> b!194795 (= lt!97190 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96976) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(assert (=> b!194795 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96976) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!194796 () Bool)

(declare-fun Unit!5908 () Unit!5878)

(assert (=> b!194796 (= e!128128 Unit!5908)))

(declare-fun b!194797 () Bool)

(assert (=> b!194797 (= e!128129 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96976) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))))

(assert (= (and d!57007 c!35198) b!194795))

(assert (= (and d!57007 (not c!35198)) b!194796))

(assert (= (and d!57007 (not res!92032)) b!194797))

(declare-fun m!221991 () Bool)

(assert (=> d!57007 m!221991))

(declare-fun m!221993 () Bool)

(assert (=> b!194795 m!221993))

(assert (=> b!194795 m!221271))

(assert (=> b!194795 m!221271))

(declare-fun m!221995 () Bool)

(assert (=> b!194795 m!221995))

(assert (=> b!194797 m!221271))

(assert (=> b!194797 m!221271))

(assert (=> b!194797 m!221995))

(assert (=> d!56739 d!57007))

(declare-fun b!194799 () Bool)

(declare-fun e!128130 () Option!251)

(declare-fun e!128131 () Option!251)

(assert (=> b!194799 (= e!128130 e!128131)))

(declare-fun c!35200 () Bool)

(assert (=> b!194799 (= c!35200 (and ((_ is Cons!2445) lt!96979) (not (= (_1!1791 (h!3086 lt!96979)) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))))

(declare-fun b!194798 () Bool)

(assert (=> b!194798 (= e!128130 (Some!250 (_2!1791 (h!3086 lt!96979))))))

(declare-fun b!194800 () Bool)

(assert (=> b!194800 (= e!128131 (getValueByKey!245 (t!7375 lt!96979) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(declare-fun c!35199 () Bool)

(declare-fun d!57009 () Bool)

(assert (=> d!57009 (= c!35199 (and ((_ is Cons!2445) lt!96979) (= (_1!1791 (h!3086 lt!96979)) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57009 (= (getValueByKey!245 lt!96979 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) e!128130)))

(declare-fun b!194801 () Bool)

(assert (=> b!194801 (= e!128131 None!249)))

(assert (= (and d!57009 c!35199) b!194798))

(assert (= (and d!57009 (not c!35199)) b!194799))

(assert (= (and b!194799 c!35200) b!194800))

(assert (= (and b!194799 (not c!35200)) b!194801))

(declare-fun m!221997 () Bool)

(assert (=> b!194800 m!221997))

(assert (=> d!56739 d!57009))

(declare-fun d!57011 () Bool)

(assert (=> d!57011 (= (getValueByKey!245 lt!96979 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(declare-fun lt!97191 () Unit!5878)

(assert (=> d!57011 (= lt!97191 (choose!1068 lt!96979 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(declare-fun e!128132 () Bool)

(assert (=> d!57011 e!128132))

(declare-fun res!92033 () Bool)

(assert (=> d!57011 (=> (not res!92033) (not e!128132))))

(assert (=> d!57011 (= res!92033 (isStrictlySorted!357 lt!96979))))

(assert (=> d!57011 (= (lemmaContainsTupThenGetReturnValue!132 lt!96979 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) lt!97191)))

(declare-fun b!194802 () Bool)

(declare-fun res!92034 () Bool)

(assert (=> b!194802 (=> (not res!92034) (not e!128132))))

(assert (=> b!194802 (= res!92034 (containsKey!249 lt!96979 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!194803 () Bool)

(assert (=> b!194803 (= e!128132 (contains!1381 lt!96979 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))))

(assert (= (and d!57011 res!92033) b!194802))

(assert (= (and b!194802 res!92034) b!194803))

(assert (=> d!57011 m!221265))

(declare-fun m!221999 () Bool)

(assert (=> d!57011 m!221999))

(declare-fun m!222001 () Bool)

(assert (=> d!57011 m!222001))

(declare-fun m!222003 () Bool)

(assert (=> b!194802 m!222003))

(declare-fun m!222005 () Bool)

(assert (=> b!194803 m!222005))

(assert (=> d!56739 d!57011))

(declare-fun e!128133 () List!2449)

(declare-fun c!35202 () Bool)

(declare-fun call!19702 () List!2449)

(declare-fun bm!19698 () Bool)

(assert (=> bm!19698 (= call!19702 ($colon$colon!103 e!128133 (ite c!35202 (h!3086 (toList!1254 lt!96848)) (tuple2!3561 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))))

(declare-fun c!35201 () Bool)

(assert (=> bm!19698 (= c!35201 c!35202)))

(declare-fun b!194804 () Bool)

(declare-fun e!128137 () List!2449)

(declare-fun call!19701 () List!2449)

(assert (=> b!194804 (= e!128137 call!19701)))

(declare-fun b!194805 () Bool)

(declare-fun c!35203 () Bool)

(assert (=> b!194805 (= c!35203 (and ((_ is Cons!2445) (toList!1254 lt!96848)) (bvsgt (_1!1791 (h!3086 (toList!1254 lt!96848))) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))))

(declare-fun e!128135 () List!2449)

(assert (=> b!194805 (= e!128137 e!128135)))

(declare-fun e!128136 () Bool)

(declare-fun lt!97192 () List!2449)

(declare-fun b!194806 () Bool)

(assert (=> b!194806 (= e!128136 (contains!1381 lt!97192 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))))

(declare-fun bm!19699 () Bool)

(declare-fun call!19703 () List!2449)

(assert (=> bm!19699 (= call!19703 call!19701)))

(declare-fun b!194807 () Bool)

(declare-fun e!128134 () List!2449)

(assert (=> b!194807 (= e!128134 e!128137)))

(declare-fun c!35204 () Bool)

(assert (=> b!194807 (= c!35204 (and ((_ is Cons!2445) (toList!1254 lt!96848)) (= (_1!1791 (h!3086 (toList!1254 lt!96848))) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))))

(declare-fun d!57013 () Bool)

(assert (=> d!57013 e!128136))

(declare-fun res!92035 () Bool)

(assert (=> d!57013 (=> (not res!92035) (not e!128136))))

(assert (=> d!57013 (= res!92035 (isStrictlySorted!357 lt!97192))))

(assert (=> d!57013 (= lt!97192 e!128134)))

(assert (=> d!57013 (= c!35202 (and ((_ is Cons!2445) (toList!1254 lt!96848)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96848))) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57013 (isStrictlySorted!357 (toList!1254 lt!96848))))

(assert (=> d!57013 (= (insertStrictlySorted!135 (toList!1254 lt!96848) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) lt!97192)))

(declare-fun bm!19700 () Bool)

(assert (=> bm!19700 (= call!19701 call!19702)))

(declare-fun b!194808 () Bool)

(assert (=> b!194808 (= e!128135 call!19703)))

(declare-fun b!194809 () Bool)

(assert (=> b!194809 (= e!128133 (insertStrictlySorted!135 (t!7375 (toList!1254 lt!96848)) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!194810 () Bool)

(assert (=> b!194810 (= e!128135 call!19703)))

(declare-fun b!194811 () Bool)

(declare-fun res!92036 () Bool)

(assert (=> b!194811 (=> (not res!92036) (not e!128136))))

(assert (=> b!194811 (= res!92036 (containsKey!249 lt!97192 (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!194812 () Bool)

(assert (=> b!194812 (= e!128134 call!19702)))

(declare-fun b!194813 () Bool)

(assert (=> b!194813 (= e!128133 (ite c!35204 (t!7375 (toList!1254 lt!96848)) (ite c!35203 (Cons!2445 (h!3086 (toList!1254 lt!96848)) (t!7375 (toList!1254 lt!96848))) Nil!2446)))))

(assert (= (and d!57013 c!35202) b!194812))

(assert (= (and d!57013 (not c!35202)) b!194807))

(assert (= (and b!194807 c!35204) b!194804))

(assert (= (and b!194807 (not c!35204)) b!194805))

(assert (= (and b!194805 c!35203) b!194810))

(assert (= (and b!194805 (not c!35203)) b!194808))

(assert (= (or b!194810 b!194808) bm!19699))

(assert (= (or b!194804 bm!19699) bm!19700))

(assert (= (or b!194812 bm!19700) bm!19698))

(assert (= (and bm!19698 c!35201) b!194809))

(assert (= (and bm!19698 (not c!35201)) b!194813))

(assert (= (and d!57013 res!92035) b!194811))

(assert (= (and b!194811 res!92036) b!194806))

(declare-fun m!222007 () Bool)

(assert (=> bm!19698 m!222007))

(declare-fun m!222009 () Bool)

(assert (=> b!194811 m!222009))

(declare-fun m!222011 () Bool)

(assert (=> b!194806 m!222011))

(declare-fun m!222013 () Bool)

(assert (=> b!194809 m!222013))

(declare-fun m!222015 () Bool)

(assert (=> d!57013 m!222015))

(declare-fun m!222017 () Bool)

(assert (=> d!57013 m!222017))

(assert (=> d!56739 d!57013))

(declare-fun d!57015 () Bool)

(declare-fun lt!97193 () Bool)

(assert (=> d!57015 (= lt!97193 (select (content!155 lt!97104) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun e!128139 () Bool)

(assert (=> d!57015 (= lt!97193 e!128139)))

(declare-fun res!92037 () Bool)

(assert (=> d!57015 (=> (not res!92037) (not e!128139))))

(assert (=> d!57015 (= res!92037 ((_ is Cons!2445) lt!97104))))

(assert (=> d!57015 (= (contains!1381 lt!97104 (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))) lt!97193)))

(declare-fun b!194814 () Bool)

(declare-fun e!128138 () Bool)

(assert (=> b!194814 (= e!128139 e!128138)))

(declare-fun res!92038 () Bool)

(assert (=> b!194814 (=> res!92038 e!128138)))

(assert (=> b!194814 (= res!92038 (= (h!3086 lt!97104) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun b!194815 () Bool)

(assert (=> b!194815 (= e!128138 (contains!1381 (t!7375 lt!97104) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(assert (= (and d!57015 res!92037) b!194814))

(assert (= (and b!194814 (not res!92038)) b!194815))

(declare-fun m!222019 () Bool)

(assert (=> d!57015 m!222019))

(declare-fun m!222021 () Bool)

(assert (=> d!57015 m!222021))

(declare-fun m!222023 () Bool)

(assert (=> b!194815 m!222023))

(assert (=> b!194623 d!57015))

(assert (=> d!56709 d!56707))

(declare-fun d!57017 () Bool)

(assert (=> d!57017 (= (getValueByKey!245 lt!96732 (_1!1791 lt!96678)) (Some!250 (_2!1791 lt!96678)))))

(assert (=> d!57017 true))

(declare-fun _$22!539 () Unit!5878)

(assert (=> d!57017 (= (choose!1068 lt!96732 (_1!1791 lt!96678) (_2!1791 lt!96678)) _$22!539)))

(declare-fun bs!7769 () Bool)

(assert (= bs!7769 d!57017))

(assert (=> bs!7769 m!220819))

(assert (=> d!56709 d!57017))

(declare-fun d!57019 () Bool)

(declare-fun res!92039 () Bool)

(declare-fun e!128140 () Bool)

(assert (=> d!57019 (=> res!92039 e!128140)))

(assert (=> d!57019 (= res!92039 (or ((_ is Nil!2446) lt!96732) ((_ is Nil!2446) (t!7375 lt!96732))))))

(assert (=> d!57019 (= (isStrictlySorted!357 lt!96732) e!128140)))

(declare-fun b!194816 () Bool)

(declare-fun e!128141 () Bool)

(assert (=> b!194816 (= e!128140 e!128141)))

(declare-fun res!92040 () Bool)

(assert (=> b!194816 (=> (not res!92040) (not e!128141))))

(assert (=> b!194816 (= res!92040 (bvslt (_1!1791 (h!3086 lt!96732)) (_1!1791 (h!3086 (t!7375 lt!96732)))))))

(declare-fun b!194817 () Bool)

(assert (=> b!194817 (= e!128141 (isStrictlySorted!357 (t!7375 lt!96732)))))

(assert (= (and d!57019 (not res!92039)) b!194816))

(assert (= (and b!194816 res!92040) b!194817))

(declare-fun m!222025 () Bool)

(assert (=> b!194817 m!222025))

(assert (=> d!56709 d!57019))

(declare-fun d!57021 () Bool)

(declare-fun e!128143 () Bool)

(assert (=> d!57021 e!128143))

(declare-fun res!92041 () Bool)

(assert (=> d!57021 (=> res!92041 e!128143)))

(declare-fun lt!97194 () Bool)

(assert (=> d!57021 (= res!92041 (not lt!97194))))

(declare-fun lt!97195 () Bool)

(assert (=> d!57021 (= lt!97194 lt!97195)))

(declare-fun lt!97196 () Unit!5878)

(declare-fun e!128142 () Unit!5878)

(assert (=> d!57021 (= lt!97196 e!128142)))

(declare-fun c!35205 () Bool)

(assert (=> d!57021 (= c!35205 lt!97195)))

(assert (=> d!57021 (= lt!97195 (containsKey!249 (toList!1254 lt!96967) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(assert (=> d!57021 (= (contains!1379 lt!96967 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) lt!97194)))

(declare-fun b!194818 () Bool)

(declare-fun lt!97197 () Unit!5878)

(assert (=> b!194818 (= e!128142 lt!97197)))

(assert (=> b!194818 (= lt!97197 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96967) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(assert (=> b!194818 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96967) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(declare-fun b!194819 () Bool)

(declare-fun Unit!5909 () Unit!5878)

(assert (=> b!194819 (= e!128142 Unit!5909)))

(declare-fun b!194820 () Bool)

(assert (=> b!194820 (= e!128143 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96967) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))))

(assert (= (and d!57021 c!35205) b!194818))

(assert (= (and d!57021 (not c!35205)) b!194819))

(assert (= (and d!57021 (not res!92041)) b!194820))

(declare-fun m!222027 () Bool)

(assert (=> d!57021 m!222027))

(declare-fun m!222029 () Bool)

(assert (=> b!194818 m!222029))

(assert (=> b!194818 m!221227))

(assert (=> b!194818 m!221227))

(declare-fun m!222031 () Bool)

(assert (=> b!194818 m!222031))

(assert (=> b!194820 m!221227))

(assert (=> b!194820 m!221227))

(assert (=> b!194820 m!222031))

(assert (=> d!56725 d!57021))

(declare-fun b!194822 () Bool)

(declare-fun e!128144 () Option!251)

(declare-fun e!128145 () Option!251)

(assert (=> b!194822 (= e!128144 e!128145)))

(declare-fun c!35207 () Bool)

(assert (=> b!194822 (= c!35207 (and ((_ is Cons!2445) lt!96970) (not (= (_1!1791 (h!3086 lt!96970)) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))))

(declare-fun b!194821 () Bool)

(assert (=> b!194821 (= e!128144 (Some!250 (_2!1791 (h!3086 lt!96970))))))

(declare-fun b!194823 () Bool)

(assert (=> b!194823 (= e!128145 (getValueByKey!245 (t!7375 lt!96970) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(declare-fun d!57023 () Bool)

(declare-fun c!35206 () Bool)

(assert (=> d!57023 (= c!35206 (and ((_ is Cons!2445) lt!96970) (= (_1!1791 (h!3086 lt!96970)) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))))

(assert (=> d!57023 (= (getValueByKey!245 lt!96970 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) e!128144)))

(declare-fun b!194824 () Bool)

(assert (=> b!194824 (= e!128145 None!249)))

(assert (= (and d!57023 c!35206) b!194821))

(assert (= (and d!57023 (not c!35206)) b!194822))

(assert (= (and b!194822 c!35207) b!194823))

(assert (= (and b!194822 (not c!35207)) b!194824))

(declare-fun m!222033 () Bool)

(assert (=> b!194823 m!222033))

(assert (=> d!56725 d!57023))

(declare-fun d!57025 () Bool)

(assert (=> d!57025 (= (getValueByKey!245 lt!96970 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97198 () Unit!5878)

(assert (=> d!57025 (= lt!97198 (choose!1068 lt!96970 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(declare-fun e!128146 () Bool)

(assert (=> d!57025 e!128146))

(declare-fun res!92042 () Bool)

(assert (=> d!57025 (=> (not res!92042) (not e!128146))))

(assert (=> d!57025 (= res!92042 (isStrictlySorted!357 lt!96970))))

(assert (=> d!57025 (= (lemmaContainsTupThenGetReturnValue!132 lt!96970 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) lt!97198)))

(declare-fun b!194825 () Bool)

(declare-fun res!92043 () Bool)

(assert (=> b!194825 (=> (not res!92043) (not e!128146))))

(assert (=> b!194825 (= res!92043 (containsKey!249 lt!96970 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(declare-fun b!194826 () Bool)

(assert (=> b!194826 (= e!128146 (contains!1381 lt!96970 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))))

(assert (= (and d!57025 res!92042) b!194825))

(assert (= (and b!194825 res!92043) b!194826))

(assert (=> d!57025 m!221221))

(declare-fun m!222035 () Bool)

(assert (=> d!57025 m!222035))

(declare-fun m!222037 () Bool)

(assert (=> d!57025 m!222037))

(declare-fun m!222039 () Bool)

(assert (=> b!194825 m!222039))

(declare-fun m!222041 () Bool)

(assert (=> b!194826 m!222041))

(assert (=> d!56725 d!57025))

(declare-fun bm!19701 () Bool)

(declare-fun call!19705 () List!2449)

(declare-fun e!128147 () List!2449)

(declare-fun c!35209 () Bool)

(assert (=> bm!19701 (= call!19705 ($colon$colon!103 e!128147 (ite c!35209 (h!3086 (toList!1254 lt!96853)) (tuple2!3561 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))))

(declare-fun c!35208 () Bool)

(assert (=> bm!19701 (= c!35208 c!35209)))

(declare-fun b!194827 () Bool)

(declare-fun e!128151 () List!2449)

(declare-fun call!19704 () List!2449)

(assert (=> b!194827 (= e!128151 call!19704)))

(declare-fun b!194828 () Bool)

(declare-fun c!35210 () Bool)

(assert (=> b!194828 (= c!35210 (and ((_ is Cons!2445) (toList!1254 lt!96853)) (bvsgt (_1!1791 (h!3086 (toList!1254 lt!96853))) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))))

(declare-fun e!128149 () List!2449)

(assert (=> b!194828 (= e!128151 e!128149)))

(declare-fun lt!97199 () List!2449)

(declare-fun e!128150 () Bool)

(declare-fun b!194829 () Bool)

(assert (=> b!194829 (= e!128150 (contains!1381 lt!97199 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))))

(declare-fun bm!19702 () Bool)

(declare-fun call!19706 () List!2449)

(assert (=> bm!19702 (= call!19706 call!19704)))

(declare-fun b!194830 () Bool)

(declare-fun e!128148 () List!2449)

(assert (=> b!194830 (= e!128148 e!128151)))

(declare-fun c!35211 () Bool)

(assert (=> b!194830 (= c!35211 (and ((_ is Cons!2445) (toList!1254 lt!96853)) (= (_1!1791 (h!3086 (toList!1254 lt!96853))) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))))

(declare-fun d!57027 () Bool)

(assert (=> d!57027 e!128150))

(declare-fun res!92044 () Bool)

(assert (=> d!57027 (=> (not res!92044) (not e!128150))))

(assert (=> d!57027 (= res!92044 (isStrictlySorted!357 lt!97199))))

(assert (=> d!57027 (= lt!97199 e!128148)))

(assert (=> d!57027 (= c!35209 (and ((_ is Cons!2445) (toList!1254 lt!96853)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96853))) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))))

(assert (=> d!57027 (isStrictlySorted!357 (toList!1254 lt!96853))))

(assert (=> d!57027 (= (insertStrictlySorted!135 (toList!1254 lt!96853) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) lt!97199)))

(declare-fun bm!19703 () Bool)

(assert (=> bm!19703 (= call!19704 call!19705)))

(declare-fun b!194831 () Bool)

(assert (=> b!194831 (= e!128149 call!19706)))

(declare-fun b!194832 () Bool)

(assert (=> b!194832 (= e!128147 (insertStrictlySorted!135 (t!7375 (toList!1254 lt!96853)) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(declare-fun b!194833 () Bool)

(assert (=> b!194833 (= e!128149 call!19706)))

(declare-fun b!194834 () Bool)

(declare-fun res!92045 () Bool)

(assert (=> b!194834 (=> (not res!92045) (not e!128150))))

(assert (=> b!194834 (= res!92045 (containsKey!249 lt!97199 (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(declare-fun b!194835 () Bool)

(assert (=> b!194835 (= e!128148 call!19705)))

(declare-fun b!194836 () Bool)

(assert (=> b!194836 (= e!128147 (ite c!35211 (t!7375 (toList!1254 lt!96853)) (ite c!35210 (Cons!2445 (h!3086 (toList!1254 lt!96853)) (t!7375 (toList!1254 lt!96853))) Nil!2446)))))

(assert (= (and d!57027 c!35209) b!194835))

(assert (= (and d!57027 (not c!35209)) b!194830))

(assert (= (and b!194830 c!35211) b!194827))

(assert (= (and b!194830 (not c!35211)) b!194828))

(assert (= (and b!194828 c!35210) b!194833))

(assert (= (and b!194828 (not c!35210)) b!194831))

(assert (= (or b!194833 b!194831) bm!19702))

(assert (= (or b!194827 bm!19702) bm!19703))

(assert (= (or b!194835 bm!19703) bm!19701))

(assert (= (and bm!19701 c!35208) b!194832))

(assert (= (and bm!19701 (not c!35208)) b!194836))

(assert (= (and d!57027 res!92044) b!194834))

(assert (= (and b!194834 res!92045) b!194829))

(declare-fun m!222043 () Bool)

(assert (=> bm!19701 m!222043))

(declare-fun m!222045 () Bool)

(assert (=> b!194834 m!222045))

(declare-fun m!222047 () Bool)

(assert (=> b!194829 m!222047))

(declare-fun m!222049 () Bool)

(assert (=> b!194832 m!222049))

(declare-fun m!222051 () Bool)

(assert (=> d!57027 m!222051))

(declare-fun m!222053 () Bool)

(assert (=> d!57027 m!222053))

(assert (=> d!56725 d!57027))

(assert (=> d!56771 d!56763))

(assert (=> d!56771 d!56765))

(declare-fun d!57029 () Bool)

(declare-fun e!128153 () Bool)

(assert (=> d!57029 e!128153))

(declare-fun res!92046 () Bool)

(assert (=> d!57029 (=> res!92046 e!128153)))

(declare-fun lt!97200 () Bool)

(assert (=> d!57029 (= res!92046 (not lt!97200))))

(declare-fun lt!97201 () Bool)

(assert (=> d!57029 (= lt!97200 lt!97201)))

(declare-fun lt!97202 () Unit!5878)

(declare-fun e!128152 () Unit!5878)

(assert (=> d!57029 (= lt!97202 e!128152)))

(declare-fun c!35212 () Bool)

(assert (=> d!57029 (= c!35212 lt!97201)))

(assert (=> d!57029 (= lt!97201 (containsKey!249 (toList!1254 lt!96816) lt!96798))))

(assert (=> d!57029 (= (contains!1379 lt!96816 lt!96798) lt!97200)))

(declare-fun b!194837 () Bool)

(declare-fun lt!97203 () Unit!5878)

(assert (=> b!194837 (= e!128152 lt!97203)))

(assert (=> b!194837 (= lt!97203 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96816) lt!96798))))

(assert (=> b!194837 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96816) lt!96798))))

(declare-fun b!194838 () Bool)

(declare-fun Unit!5910 () Unit!5878)

(assert (=> b!194838 (= e!128152 Unit!5910)))

(declare-fun b!194839 () Bool)

(assert (=> b!194839 (= e!128153 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96816) lt!96798)))))

(assert (= (and d!57029 c!35212) b!194837))

(assert (= (and d!57029 (not c!35212)) b!194838))

(assert (= (and d!57029 (not res!92046)) b!194839))

(declare-fun m!222055 () Bool)

(assert (=> d!57029 m!222055))

(declare-fun m!222057 () Bool)

(assert (=> b!194837 m!222057))

(assert (=> b!194837 m!221335))

(assert (=> b!194837 m!221335))

(declare-fun m!222059 () Bool)

(assert (=> b!194837 m!222059))

(assert (=> b!194839 m!221335))

(assert (=> b!194839 m!221335))

(assert (=> b!194839 m!222059))

(assert (=> d!56771 d!57029))

(assert (=> d!56771 d!56785))

(declare-fun d!57031 () Bool)

(assert (=> d!57031 (= (apply!188 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) lt!96798) (apply!188 lt!96816 lt!96798))))

(assert (=> d!57031 true))

(declare-fun _$34!1090 () Unit!5878)

(assert (=> d!57031 (= (choose!1069 lt!96816 lt!96807 (minValue!3801 thiss!1248) lt!96798) _$34!1090)))

(declare-fun bs!7770 () Bool)

(assert (= bs!7770 d!57031))

(assert (=> bs!7770 m!220901))

(assert (=> bs!7770 m!220901))

(assert (=> bs!7770 m!220919))

(assert (=> bs!7770 m!220913))

(assert (=> d!56771 d!57031))

(assert (=> b!194390 d!56677))

(declare-fun d!57033 () Bool)

(assert (=> d!57033 (= (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) lt!96835)) (v!4256 (getValueByKey!245 (toList!1254 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) lt!96835)))))

(assert (=> d!56719 d!57033))

(declare-fun b!194842 () Bool)

(declare-fun e!128154 () Option!251)

(declare-fun e!128155 () Option!251)

(assert (=> b!194842 (= e!128154 e!128155)))

(declare-fun c!35214 () Bool)

(assert (=> b!194842 (= c!35214 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))) (not (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))) lt!96835))))))

(declare-fun b!194841 () Bool)

(assert (=> b!194841 (= e!128154 (Some!250 (_2!1791 (h!3086 (toList!1254 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))))))

(declare-fun b!194843 () Bool)

(assert (=> b!194843 (= e!128155 (getValueByKey!245 (t!7375 (toList!1254 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))) lt!96835))))

(declare-fun d!57035 () Bool)

(declare-fun c!35213 () Bool)

(assert (=> d!57035 (= c!35213 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))) (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))) lt!96835)))))

(assert (=> d!57035 (= (getValueByKey!245 (toList!1254 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) lt!96835) e!128154)))

(declare-fun b!194844 () Bool)

(assert (=> b!194844 (= e!128155 None!249)))

(assert (= (and d!57035 c!35213) b!194841))

(assert (= (and d!57035 (not c!35213)) b!194842))

(assert (= (and b!194842 c!35214) b!194843))

(assert (= (and b!194842 (not c!35214)) b!194844))

(declare-fun m!222061 () Bool)

(assert (=> b!194843 m!222061))

(assert (=> d!56719 d!57035))

(assert (=> d!56745 d!56739))

(assert (=> d!56745 d!56727))

(declare-fun d!57037 () Bool)

(assert (=> d!57037 (= (apply!188 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) lt!96834) (apply!188 lt!96848 lt!96834))))

(assert (=> d!57037 true))

(declare-fun _$34!1091 () Unit!5878)

(assert (=> d!57037 (= (choose!1069 lt!96848 lt!96839 (zeroValue!3801 thiss!1248) lt!96834) _$34!1091)))

(declare-fun bs!7771 () Bool)

(assert (= bs!7771 d!57037))

(assert (=> bs!7771 m!220989))

(assert (=> bs!7771 m!220989))

(assert (=> bs!7771 m!220991))

(assert (=> bs!7771 m!220995))

(assert (=> d!56745 d!57037))

(declare-fun d!57039 () Bool)

(declare-fun e!128157 () Bool)

(assert (=> d!57039 e!128157))

(declare-fun res!92047 () Bool)

(assert (=> d!57039 (=> res!92047 e!128157)))

(declare-fun lt!97204 () Bool)

(assert (=> d!57039 (= res!92047 (not lt!97204))))

(declare-fun lt!97205 () Bool)

(assert (=> d!57039 (= lt!97204 lt!97205)))

(declare-fun lt!97206 () Unit!5878)

(declare-fun e!128156 () Unit!5878)

(assert (=> d!57039 (= lt!97206 e!128156)))

(declare-fun c!35215 () Bool)

(assert (=> d!57039 (= c!35215 lt!97205)))

(assert (=> d!57039 (= lt!97205 (containsKey!249 (toList!1254 lt!96848) lt!96834))))

(assert (=> d!57039 (= (contains!1379 lt!96848 lt!96834) lt!97204)))

(declare-fun b!194845 () Bool)

(declare-fun lt!97207 () Unit!5878)

(assert (=> b!194845 (= e!128156 lt!97207)))

(assert (=> b!194845 (= lt!97207 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96848) lt!96834))))

(assert (=> b!194845 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96848) lt!96834))))

(declare-fun b!194846 () Bool)

(declare-fun Unit!5911 () Unit!5878)

(assert (=> b!194846 (= e!128156 Unit!5911)))

(declare-fun b!194847 () Bool)

(assert (=> b!194847 (= e!128157 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96848) lt!96834)))))

(assert (= (and d!57039 c!35215) b!194845))

(assert (= (and d!57039 (not c!35215)) b!194846))

(assert (= (and d!57039 (not res!92047)) b!194847))

(declare-fun m!222063 () Bool)

(assert (=> d!57039 m!222063))

(declare-fun m!222065 () Bool)

(assert (=> b!194845 m!222065))

(assert (=> b!194845 m!221231))

(assert (=> b!194845 m!221231))

(declare-fun m!222067 () Bool)

(assert (=> b!194845 m!222067))

(assert (=> b!194847 m!221231))

(assert (=> b!194847 m!221231))

(assert (=> b!194847 m!222067))

(assert (=> d!56745 d!57039))

(assert (=> d!56745 d!56735))

(assert (=> b!194222 d!56931))

(declare-fun b!194849 () Bool)

(declare-fun e!128158 () Option!251)

(declare-fun e!128159 () Option!251)

(assert (=> b!194849 (= e!128158 e!128159)))

(declare-fun c!35217 () Bool)

(assert (=> b!194849 (= c!35217 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96675))) (not (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96675)))) key!828))))))

(declare-fun b!194848 () Bool)

(assert (=> b!194848 (= e!128158 (Some!250 (_2!1791 (h!3086 (t!7375 (toList!1254 lt!96675))))))))

(declare-fun b!194850 () Bool)

(assert (=> b!194850 (= e!128159 (getValueByKey!245 (t!7375 (t!7375 (toList!1254 lt!96675))) key!828))))

(declare-fun d!57041 () Bool)

(declare-fun c!35216 () Bool)

(assert (=> d!57041 (= c!35216 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96675))) (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96675)))) key!828)))))

(assert (=> d!57041 (= (getValueByKey!245 (t!7375 (toList!1254 lt!96675)) key!828) e!128158)))

(declare-fun b!194851 () Bool)

(assert (=> b!194851 (= e!128159 None!249)))

(assert (= (and d!57041 c!35216) b!194848))

(assert (= (and d!57041 (not c!35216)) b!194849))

(assert (= (and b!194849 c!35217) b!194850))

(assert (= (and b!194849 (not c!35217)) b!194851))

(declare-fun m!222069 () Bool)

(assert (=> b!194850 m!222069))

(assert (=> b!194307 d!57041))

(declare-fun d!57043 () Bool)

(assert (=> d!57043 (= (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194571 d!57043))

(assert (=> b!194572 d!57043))

(declare-fun b!194852 () Bool)

(declare-fun e!128161 () SeekEntryResult!694)

(declare-fun e!128162 () SeekEntryResult!694)

(assert (=> b!194852 (= e!128161 e!128162)))

(declare-fun c!35219 () Bool)

(declare-fun lt!97208 () (_ BitVec 64))

(assert (=> b!194852 (= c!35219 (= lt!97208 key!828))))

(declare-fun b!194853 () Bool)

(declare-fun c!35220 () Bool)

(assert (=> b!194853 (= c!35220 (= lt!97208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128160 () SeekEntryResult!694)

(assert (=> b!194853 (= e!128162 e!128160)))

(declare-fun b!194854 () Bool)

(assert (=> b!194854 (= e!128162 (Found!694 (nextIndex!0 (index!4948 lt!96869) (x!20690 lt!96869) (mask!9223 thiss!1248))))))

(declare-fun b!194855 () Bool)

(assert (=> b!194855 (= e!128161 Undefined!694)))

(declare-fun b!194856 () Bool)

(assert (=> b!194856 (= e!128160 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20690 lt!96869) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (index!4948 lt!96869) (x!20690 lt!96869) (mask!9223 thiss!1248)) (bvadd (x!20690 lt!96869) #b00000000000000000000000000000001) (mask!9223 thiss!1248)) (index!4948 lt!96869) key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun b!194857 () Bool)

(assert (=> b!194857 (= e!128160 (MissingVacant!694 (index!4948 lt!96869)))))

(declare-fun lt!97209 () SeekEntryResult!694)

(declare-fun d!57045 () Bool)

(assert (=> d!57045 (and (or ((_ is Undefined!694) lt!97209) (not ((_ is Found!694) lt!97209)) (and (bvsge (index!4947 lt!97209) #b00000000000000000000000000000000) (bvslt (index!4947 lt!97209) (size!4199 (_keys!5954 thiss!1248))))) (or ((_ is Undefined!694) lt!97209) ((_ is Found!694) lt!97209) (not ((_ is MissingVacant!694) lt!97209)) (not (= (index!4949 lt!97209) (index!4948 lt!96869))) (and (bvsge (index!4949 lt!97209) #b00000000000000000000000000000000) (bvslt (index!4949 lt!97209) (size!4199 (_keys!5954 thiss!1248))))) (or ((_ is Undefined!694) lt!97209) (ite ((_ is Found!694) lt!97209) (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!97209)) key!828) (and ((_ is MissingVacant!694) lt!97209) (= (index!4949 lt!97209) (index!4948 lt!96869)) (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4949 lt!97209)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!57045 (= lt!97209 e!128161)))

(declare-fun c!35218 () Bool)

(assert (=> d!57045 (= c!35218 (bvsge (bvadd (x!20690 lt!96869) #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!57045 (= lt!97208 (select (arr!3875 (_keys!5954 thiss!1248)) (nextIndex!0 (index!4948 lt!96869) (x!20690 lt!96869) (mask!9223 thiss!1248))))))

(assert (=> d!57045 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!57045 (= (seekKeyOrZeroReturnVacant!0 (bvadd (x!20690 lt!96869) #b00000000000000000000000000000001) (nextIndex!0 (index!4948 lt!96869) (x!20690 lt!96869) (mask!9223 thiss!1248)) (index!4948 lt!96869) key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)) lt!97209)))

(assert (= (and d!57045 c!35218) b!194855))

(assert (= (and d!57045 (not c!35218)) b!194852))

(assert (= (and b!194852 c!35219) b!194854))

(assert (= (and b!194852 (not c!35219)) b!194853))

(assert (= (and b!194853 c!35220) b!194857))

(assert (= (and b!194853 (not c!35220)) b!194856))

(assert (=> b!194856 m!221535))

(declare-fun m!222071 () Bool)

(assert (=> b!194856 m!222071))

(assert (=> b!194856 m!222071))

(declare-fun m!222073 () Bool)

(assert (=> b!194856 m!222073))

(declare-fun m!222075 () Bool)

(assert (=> d!57045 m!222075))

(declare-fun m!222077 () Bool)

(assert (=> d!57045 m!222077))

(assert (=> d!57045 m!221535))

(declare-fun m!222079 () Bool)

(assert (=> d!57045 m!222079))

(assert (=> d!57045 m!220855))

(assert (=> b!194565 d!57045))

(declare-fun d!57047 () Bool)

(declare-fun lt!97212 () (_ BitVec 32))

(assert (=> d!57047 (and (bvsge lt!97212 #b00000000000000000000000000000000) (bvslt lt!97212 (bvadd (mask!9223 thiss!1248) #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!57047 (= lt!97212 (choose!52 (index!4948 lt!96869) (x!20690 lt!96869) (mask!9223 thiss!1248)))))

(assert (=> d!57047 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!57047 (= (nextIndex!0 (index!4948 lt!96869) (x!20690 lt!96869) (mask!9223 thiss!1248)) lt!97212)))

(declare-fun bs!7772 () Bool)

(assert (= bs!7772 d!57047))

(declare-fun m!222081 () Bool)

(assert (=> bs!7772 m!222081))

(assert (=> bs!7772 m!220855))

(assert (=> b!194565 d!57047))

(assert (=> b!194296 d!56797))

(declare-fun d!57049 () Bool)

(declare-fun e!128164 () Bool)

(assert (=> d!57049 e!128164))

(declare-fun res!92048 () Bool)

(assert (=> d!57049 (=> res!92048 e!128164)))

(declare-fun lt!97213 () Bool)

(assert (=> d!57049 (= res!92048 (not lt!97213))))

(declare-fun lt!97214 () Bool)

(assert (=> d!57049 (= lt!97213 lt!97214)))

(declare-fun lt!97215 () Unit!5878)

(declare-fun e!128163 () Unit!5878)

(assert (=> d!57049 (= lt!97215 e!128163)))

(declare-fun c!35221 () Bool)

(assert (=> d!57049 (= c!35221 lt!97214)))

(assert (=> d!57049 (= lt!97214 (containsKey!249 (toList!1254 lt!96992) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!57049 (= (contains!1379 lt!96992 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) lt!97213)))

(declare-fun b!194858 () Bool)

(declare-fun lt!97216 () Unit!5878)

(assert (=> b!194858 (= e!128163 lt!97216)))

(assert (=> b!194858 (= lt!97216 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96992) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> b!194858 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96992) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!194859 () Bool)

(declare-fun Unit!5912 () Unit!5878)

(assert (=> b!194859 (= e!128163 Unit!5912)))

(declare-fun b!194860 () Bool)

(assert (=> b!194860 (= e!128164 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96992) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(assert (= (and d!57049 c!35221) b!194858))

(assert (= (and d!57049 (not c!35221)) b!194859))

(assert (= (and d!57049 (not res!92048)) b!194860))

(declare-fun m!222083 () Bool)

(assert (=> d!57049 m!222083))

(declare-fun m!222085 () Bool)

(assert (=> b!194858 m!222085))

(assert (=> b!194858 m!221311))

(assert (=> b!194858 m!221311))

(declare-fun m!222087 () Bool)

(assert (=> b!194858 m!222087))

(assert (=> b!194860 m!221311))

(assert (=> b!194860 m!221311))

(assert (=> b!194860 m!222087))

(assert (=> d!56749 d!57049))

(declare-fun b!194862 () Bool)

(declare-fun e!128165 () Option!251)

(declare-fun e!128166 () Option!251)

(assert (=> b!194862 (= e!128165 e!128166)))

(declare-fun c!35223 () Bool)

(assert (=> b!194862 (= c!35223 (and ((_ is Cons!2445) lt!96995) (not (= (_1!1791 (h!3086 lt!96995)) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))))

(declare-fun b!194861 () Bool)

(assert (=> b!194861 (= e!128165 (Some!250 (_2!1791 (h!3086 lt!96995))))))

(declare-fun b!194863 () Bool)

(assert (=> b!194863 (= e!128166 (getValueByKey!245 (t!7375 lt!96995) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun c!35222 () Bool)

(declare-fun d!57051 () Bool)

(assert (=> d!57051 (= c!35222 (and ((_ is Cons!2445) lt!96995) (= (_1!1791 (h!3086 lt!96995)) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(assert (=> d!57051 (= (getValueByKey!245 lt!96995 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) e!128165)))

(declare-fun b!194864 () Bool)

(assert (=> b!194864 (= e!128166 None!249)))

(assert (= (and d!57051 c!35222) b!194861))

(assert (= (and d!57051 (not c!35222)) b!194862))

(assert (= (and b!194862 c!35223) b!194863))

(assert (= (and b!194862 (not c!35223)) b!194864))

(declare-fun m!222089 () Bool)

(assert (=> b!194863 m!222089))

(assert (=> d!56749 d!57051))

(declare-fun d!57053 () Bool)

(assert (=> d!57053 (= (getValueByKey!245 lt!96995 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) (Some!250 (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun lt!97217 () Unit!5878)

(assert (=> d!57053 (= lt!97217 (choose!1068 lt!96995 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun e!128167 () Bool)

(assert (=> d!57053 e!128167))

(declare-fun res!92049 () Bool)

(assert (=> d!57053 (=> (not res!92049) (not e!128167))))

(assert (=> d!57053 (= res!92049 (isStrictlySorted!357 lt!96995))))

(assert (=> d!57053 (= (lemmaContainsTupThenGetReturnValue!132 lt!96995 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) lt!97217)))

(declare-fun b!194865 () Bool)

(declare-fun res!92050 () Bool)

(assert (=> b!194865 (=> (not res!92050) (not e!128167))))

(assert (=> b!194865 (= res!92050 (containsKey!249 lt!96995 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!194866 () Bool)

(assert (=> b!194866 (= e!128167 (contains!1381 lt!96995 (tuple2!3561 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(assert (= (and d!57053 res!92049) b!194865))

(assert (= (and b!194865 res!92050) b!194866))

(assert (=> d!57053 m!221305))

(declare-fun m!222091 () Bool)

(assert (=> d!57053 m!222091))

(declare-fun m!222093 () Bool)

(assert (=> d!57053 m!222093))

(declare-fun m!222095 () Bool)

(assert (=> b!194865 m!222095))

(declare-fun m!222097 () Bool)

(assert (=> b!194866 m!222097))

(assert (=> d!56749 d!57053))

(declare-fun bm!19704 () Bool)

(declare-fun e!128168 () List!2449)

(declare-fun c!35225 () Bool)

(declare-fun call!19708 () List!2449)

(assert (=> bm!19704 (= call!19708 ($colon$colon!103 e!128168 (ite c!35225 (h!3086 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630)))) (tuple2!3561 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))))

(declare-fun c!35224 () Bool)

(assert (=> bm!19704 (= c!35224 c!35225)))

(declare-fun b!194867 () Bool)

(declare-fun e!128172 () List!2449)

(declare-fun call!19707 () List!2449)

(assert (=> b!194867 (= e!128172 call!19707)))

(declare-fun b!194868 () Bool)

(declare-fun c!35226 () Bool)

(assert (=> b!194868 (= c!35226 (and ((_ is Cons!2445) (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630)))) (bvsgt (_1!1791 (h!3086 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630))))) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun e!128170 () List!2449)

(assert (=> b!194868 (= e!128172 e!128170)))

(declare-fun e!128171 () Bool)

(declare-fun b!194869 () Bool)

(declare-fun lt!97218 () List!2449)

(assert (=> b!194869 (= e!128171 (contains!1381 lt!97218 (tuple2!3561 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun bm!19705 () Bool)

(declare-fun call!19709 () List!2449)

(assert (=> bm!19705 (= call!19709 call!19707)))

(declare-fun b!194870 () Bool)

(declare-fun e!128169 () List!2449)

(assert (=> b!194870 (= e!128169 e!128172)))

(declare-fun c!35227 () Bool)

(assert (=> b!194870 (= c!35227 (and ((_ is Cons!2445) (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630)))) (= (_1!1791 (h!3086 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630))))) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun d!57055 () Bool)

(assert (=> d!57055 e!128171))

(declare-fun res!92051 () Bool)

(assert (=> d!57055 (=> (not res!92051) (not e!128171))))

(assert (=> d!57055 (= res!92051 (isStrictlySorted!357 lt!97218))))

(assert (=> d!57055 (= lt!97218 e!128169)))

(assert (=> d!57055 (= c!35225 (and ((_ is Cons!2445) (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630)))) (bvslt (_1!1791 (h!3086 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630))))) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(assert (=> d!57055 (isStrictlySorted!357 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630))))))

(assert (=> d!57055 (= (insertStrictlySorted!135 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630))) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) lt!97218)))

(declare-fun bm!19706 () Bool)

(assert (=> bm!19706 (= call!19707 call!19708)))

(declare-fun b!194871 () Bool)

(assert (=> b!194871 (= e!128170 call!19709)))

(declare-fun b!194872 () Bool)

(assert (=> b!194872 (= e!128168 (insertStrictlySorted!135 (t!7375 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630)))) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!194873 () Bool)

(assert (=> b!194873 (= e!128170 call!19709)))

(declare-fun b!194874 () Bool)

(declare-fun res!92052 () Bool)

(assert (=> b!194874 (=> (not res!92052) (not e!128171))))

(assert (=> b!194874 (= res!92052 (containsKey!249 lt!97218 (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!194875 () Bool)

(assert (=> b!194875 (= e!128169 call!19708)))

(declare-fun b!194876 () Bool)

(assert (=> b!194876 (= e!128168 (ite c!35227 (t!7375 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630)))) (ite c!35226 (Cons!2445 (h!3086 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630)))) (t!7375 (toList!1254 (ite c!35009 call!19633 (ite c!35010 call!19632 call!19630))))) Nil!2446)))))

(assert (= (and d!57055 c!35225) b!194875))

(assert (= (and d!57055 (not c!35225)) b!194870))

(assert (= (and b!194870 c!35227) b!194867))

(assert (= (and b!194870 (not c!35227)) b!194868))

(assert (= (and b!194868 c!35226) b!194873))

(assert (= (and b!194868 (not c!35226)) b!194871))

(assert (= (or b!194873 b!194871) bm!19705))

(assert (= (or b!194867 bm!19705) bm!19706))

(assert (= (or b!194875 bm!19706) bm!19704))

(assert (= (and bm!19704 c!35224) b!194872))

(assert (= (and bm!19704 (not c!35224)) b!194876))

(assert (= (and d!57055 res!92051) b!194874))

(assert (= (and b!194874 res!92052) b!194869))

(declare-fun m!222099 () Bool)

(assert (=> bm!19704 m!222099))

(declare-fun m!222101 () Bool)

(assert (=> b!194874 m!222101))

(declare-fun m!222103 () Bool)

(assert (=> b!194869 m!222103))

(declare-fun m!222105 () Bool)

(assert (=> b!194872 m!222105))

(declare-fun m!222107 () Bool)

(assert (=> d!57055 m!222107))

(declare-fun m!222109 () Bool)

(assert (=> d!57055 m!222109))

(assert (=> d!56749 d!57055))

(declare-fun d!57057 () Bool)

(declare-fun res!92053 () Bool)

(declare-fun e!128173 () Bool)

(assert (=> d!57057 (=> res!92053 e!128173)))

(assert (=> d!57057 (= res!92053 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96669))) (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96669)))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(assert (=> d!57057 (= (containsKey!249 (t!7375 (toList!1254 lt!96669)) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) e!128173)))

(declare-fun b!194877 () Bool)

(declare-fun e!128174 () Bool)

(assert (=> b!194877 (= e!128173 e!128174)))

(declare-fun res!92054 () Bool)

(assert (=> b!194877 (=> (not res!92054) (not e!128174))))

(assert (=> b!194877 (= res!92054 (and (or (not ((_ is Cons!2445) (t!7375 (toList!1254 lt!96669)))) (bvsle (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96669)))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))) ((_ is Cons!2445) (t!7375 (toList!1254 lt!96669))) (bvslt (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96669)))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(declare-fun b!194878 () Bool)

(assert (=> b!194878 (= e!128174 (containsKey!249 (t!7375 (t!7375 (toList!1254 lt!96669))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (= (and d!57057 (not res!92053)) b!194877))

(assert (= (and b!194877 res!92054) b!194878))

(assert (=> b!194878 m!220759))

(declare-fun m!222111 () Bool)

(assert (=> b!194878 m!222111))

(assert (=> b!194635 d!57057))

(declare-fun d!57059 () Bool)

(declare-fun lt!97219 () Bool)

(assert (=> d!57059 (= lt!97219 (select (content!155 (toList!1254 lt!96976)) (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))

(declare-fun e!128176 () Bool)

(assert (=> d!57059 (= lt!97219 e!128176)))

(declare-fun res!92055 () Bool)

(assert (=> d!57059 (=> (not res!92055) (not e!128176))))

(assert (=> d!57059 (= res!92055 ((_ is Cons!2445) (toList!1254 lt!96976)))))

(assert (=> d!57059 (= (contains!1381 (toList!1254 lt!96976) (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))) lt!97219)))

(declare-fun b!194879 () Bool)

(declare-fun e!128175 () Bool)

(assert (=> b!194879 (= e!128176 e!128175)))

(declare-fun res!92056 () Bool)

(assert (=> b!194879 (=> res!92056 e!128175)))

(assert (=> b!194879 (= res!92056 (= (h!3086 (toList!1254 lt!96976)) (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))

(declare-fun b!194880 () Bool)

(assert (=> b!194880 (= e!128175 (contains!1381 (t!7375 (toList!1254 lt!96976)) (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))

(assert (= (and d!57059 res!92055) b!194879))

(assert (= (and b!194879 (not res!92056)) b!194880))

(declare-fun m!222113 () Bool)

(assert (=> d!57059 m!222113))

(declare-fun m!222115 () Bool)

(assert (=> d!57059 m!222115))

(declare-fun m!222117 () Bool)

(assert (=> b!194880 m!222117))

(assert (=> b!194412 d!57059))

(declare-fun d!57061 () Bool)

(declare-fun lt!97220 () Bool)

(assert (=> d!57061 (= lt!97220 (select (content!155 (toList!1254 lt!96967)) (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))

(declare-fun e!128178 () Bool)

(assert (=> d!57061 (= lt!97220 e!128178)))

(declare-fun res!92057 () Bool)

(assert (=> d!57061 (=> (not res!92057) (not e!128178))))

(assert (=> d!57061 (= res!92057 ((_ is Cons!2445) (toList!1254 lt!96967)))))

(assert (=> d!57061 (= (contains!1381 (toList!1254 lt!96967) (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) lt!97220)))

(declare-fun b!194881 () Bool)

(declare-fun e!128177 () Bool)

(assert (=> b!194881 (= e!128178 e!128177)))

(declare-fun res!92058 () Bool)

(assert (=> b!194881 (=> res!92058 e!128177)))

(assert (=> b!194881 (= res!92058 (= (h!3086 (toList!1254 lt!96967)) (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))

(declare-fun b!194882 () Bool)

(assert (=> b!194882 (= e!128177 (contains!1381 (t!7375 (toList!1254 lt!96967)) (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))

(assert (= (and d!57061 res!92057) b!194881))

(assert (= (and b!194881 (not res!92058)) b!194882))

(declare-fun m!222119 () Bool)

(assert (=> d!57061 m!222119))

(declare-fun m!222121 () Bool)

(assert (=> d!57061 m!222121))

(declare-fun m!222123 () Bool)

(assert (=> b!194882 m!222123))

(assert (=> b!194407 d!57061))

(declare-fun call!19711 () List!2449)

(declare-fun e!128179 () List!2449)

(declare-fun bm!19707 () Bool)

(declare-fun c!35229 () Bool)

(assert (=> bm!19707 (= call!19711 ($colon$colon!103 e!128179 (ite c!35229 (h!3086 (t!7375 (toList!1254 (map!2029 thiss!1248)))) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678)))))))

(declare-fun c!35228 () Bool)

(assert (=> bm!19707 (= c!35228 c!35229)))

(declare-fun b!194883 () Bool)

(declare-fun e!128183 () List!2449)

(declare-fun call!19710 () List!2449)

(assert (=> b!194883 (= e!128183 call!19710)))

(declare-fun b!194884 () Bool)

(declare-fun c!35230 () Bool)

(assert (=> b!194884 (= c!35230 (and ((_ is Cons!2445) (t!7375 (toList!1254 (map!2029 thiss!1248)))) (bvsgt (_1!1791 (h!3086 (t!7375 (toList!1254 (map!2029 thiss!1248))))) (_1!1791 lt!96678))))))

(declare-fun e!128181 () List!2449)

(assert (=> b!194884 (= e!128183 e!128181)))

(declare-fun b!194885 () Bool)

(declare-fun e!128182 () Bool)

(declare-fun lt!97221 () List!2449)

(assert (=> b!194885 (= e!128182 (contains!1381 lt!97221 (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun bm!19708 () Bool)

(declare-fun call!19712 () List!2449)

(assert (=> bm!19708 (= call!19712 call!19710)))

(declare-fun b!194886 () Bool)

(declare-fun e!128180 () List!2449)

(assert (=> b!194886 (= e!128180 e!128183)))

(declare-fun c!35231 () Bool)

(assert (=> b!194886 (= c!35231 (and ((_ is Cons!2445) (t!7375 (toList!1254 (map!2029 thiss!1248)))) (= (_1!1791 (h!3086 (t!7375 (toList!1254 (map!2029 thiss!1248))))) (_1!1791 lt!96678))))))

(declare-fun d!57063 () Bool)

(assert (=> d!57063 e!128182))

(declare-fun res!92059 () Bool)

(assert (=> d!57063 (=> (not res!92059) (not e!128182))))

(assert (=> d!57063 (= res!92059 (isStrictlySorted!357 lt!97221))))

(assert (=> d!57063 (= lt!97221 e!128180)))

(assert (=> d!57063 (= c!35229 (and ((_ is Cons!2445) (t!7375 (toList!1254 (map!2029 thiss!1248)))) (bvslt (_1!1791 (h!3086 (t!7375 (toList!1254 (map!2029 thiss!1248))))) (_1!1791 lt!96678))))))

(assert (=> d!57063 (isStrictlySorted!357 (t!7375 (toList!1254 (map!2029 thiss!1248))))))

(assert (=> d!57063 (= (insertStrictlySorted!135 (t!7375 (toList!1254 (map!2029 thiss!1248))) (_1!1791 lt!96678) (_2!1791 lt!96678)) lt!97221)))

(declare-fun bm!19709 () Bool)

(assert (=> bm!19709 (= call!19710 call!19711)))

(declare-fun b!194887 () Bool)

(assert (=> b!194887 (= e!128181 call!19712)))

(declare-fun b!194888 () Bool)

(assert (=> b!194888 (= e!128179 (insertStrictlySorted!135 (t!7375 (t!7375 (toList!1254 (map!2029 thiss!1248)))) (_1!1791 lt!96678) (_2!1791 lt!96678)))))

(declare-fun b!194889 () Bool)

(assert (=> b!194889 (= e!128181 call!19712)))

(declare-fun b!194890 () Bool)

(declare-fun res!92060 () Bool)

(assert (=> b!194890 (=> (not res!92060) (not e!128182))))

(assert (=> b!194890 (= res!92060 (containsKey!249 lt!97221 (_1!1791 lt!96678)))))

(declare-fun b!194891 () Bool)

(assert (=> b!194891 (= e!128180 call!19711)))

(declare-fun b!194892 () Bool)

(assert (=> b!194892 (= e!128179 (ite c!35231 (t!7375 (t!7375 (toList!1254 (map!2029 thiss!1248)))) (ite c!35230 (Cons!2445 (h!3086 (t!7375 (toList!1254 (map!2029 thiss!1248)))) (t!7375 (t!7375 (toList!1254 (map!2029 thiss!1248))))) Nil!2446)))))

(assert (= (and d!57063 c!35229) b!194891))

(assert (= (and d!57063 (not c!35229)) b!194886))

(assert (= (and b!194886 c!35231) b!194883))

(assert (= (and b!194886 (not c!35231)) b!194884))

(assert (= (and b!194884 c!35230) b!194889))

(assert (= (and b!194884 (not c!35230)) b!194887))

(assert (= (or b!194889 b!194887) bm!19708))

(assert (= (or b!194883 bm!19708) bm!19709))

(assert (= (or b!194891 bm!19709) bm!19707))

(assert (= (and bm!19707 c!35228) b!194888))

(assert (= (and bm!19707 (not c!35228)) b!194892))

(assert (= (and d!57063 res!92059) b!194890))

(assert (= (and b!194890 res!92060) b!194885))

(declare-fun m!222125 () Bool)

(assert (=> bm!19707 m!222125))

(declare-fun m!222127 () Bool)

(assert (=> b!194890 m!222127))

(declare-fun m!222129 () Bool)

(assert (=> b!194885 m!222129))

(declare-fun m!222131 () Bool)

(assert (=> b!194888 m!222131))

(declare-fun m!222133 () Bool)

(assert (=> d!57063 m!222133))

(declare-fun m!222135 () Bool)

(assert (=> d!57063 m!222135))

(assert (=> b!194349 d!57063))

(declare-fun b!194893 () Bool)

(declare-fun e!128187 () ListLongMap!2477)

(declare-fun e!128188 () ListLongMap!2477)

(assert (=> b!194893 (= e!128187 e!128188)))

(declare-fun c!35235 () Bool)

(assert (=> b!194893 (= c!35235 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194895 () Bool)

(declare-fun e!128190 () Bool)

(declare-fun lt!97228 () ListLongMap!2477)

(assert (=> b!194895 (= e!128190 (isEmpty!488 lt!97228))))

(declare-fun b!194896 () Bool)

(declare-fun call!19713 () ListLongMap!2477)

(assert (=> b!194896 (= e!128188 call!19713)))

(declare-fun b!194897 () Bool)

(declare-fun e!128189 () Bool)

(declare-fun e!128185 () Bool)

(assert (=> b!194897 (= e!128189 e!128185)))

(assert (=> b!194897 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun res!92061 () Bool)

(assert (=> b!194897 (= res!92061 (contains!1379 lt!97228 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!194897 (=> (not res!92061) (not e!128185))))

(declare-fun b!194898 () Bool)

(declare-fun e!128186 () Bool)

(assert (=> b!194898 (= e!128186 e!128189)))

(declare-fun c!35234 () Bool)

(declare-fun e!128184 () Bool)

(assert (=> b!194898 (= c!35234 e!128184)))

(declare-fun res!92062 () Bool)

(assert (=> b!194898 (=> (not res!92062) (not e!128184))))

(assert (=> b!194898 (= res!92062 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194899 () Bool)

(assert (=> b!194899 (= e!128184 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!194899 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!194900 () Bool)

(assert (=> b!194900 (= e!128187 (ListLongMap!2478 Nil!2446))))

(declare-fun b!194901 () Bool)

(assert (=> b!194901 (= e!128190 (= lt!97228 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248))))))

(declare-fun bm!19710 () Bool)

(assert (=> bm!19710 (= call!19713 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248)))))

(declare-fun b!194902 () Bool)

(assert (=> b!194902 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> b!194902 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4200 (_values!3943 thiss!1248))))))

(assert (=> b!194902 (= e!128185 (= (apply!188 lt!97228 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194894 () Bool)

(declare-fun lt!97225 () Unit!5878)

(declare-fun lt!97226 () Unit!5878)

(assert (=> b!194894 (= lt!97225 lt!97226)))

(declare-fun lt!97227 () ListLongMap!2477)

(declare-fun lt!97224 () (_ BitVec 64))

(declare-fun lt!97222 () (_ BitVec 64))

(declare-fun lt!97223 () V!5635)

(assert (=> b!194894 (not (contains!1379 (+!322 lt!97227 (tuple2!3561 lt!97224 lt!97223)) lt!97222))))

(assert (=> b!194894 (= lt!97226 (addStillNotContains!97 lt!97227 lt!97224 lt!97223 lt!97222))))

(assert (=> b!194894 (= lt!97222 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194894 (= lt!97223 (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194894 (= lt!97224 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!194894 (= lt!97227 call!19713)))

(assert (=> b!194894 (= e!128188 (+!322 call!19713 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!2237 (select (arr!3876 (_values!3943 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!57065 () Bool)

(assert (=> d!57065 e!128186))

(declare-fun res!92064 () Bool)

(assert (=> d!57065 (=> (not res!92064) (not e!128186))))

(assert (=> d!57065 (= res!92064 (not (contains!1379 lt!97228 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57065 (= lt!97228 e!128187)))

(declare-fun c!35232 () Bool)

(assert (=> d!57065 (= c!35232 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!57065 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!57065 (= (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248)) lt!97228)))

(declare-fun b!194903 () Bool)

(assert (=> b!194903 (= e!128189 e!128190)))

(declare-fun c!35233 () Bool)

(assert (=> b!194903 (= c!35233 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!194904 () Bool)

(declare-fun res!92063 () Bool)

(assert (=> b!194904 (=> (not res!92063) (not e!128186))))

(assert (=> b!194904 (= res!92063 (not (contains!1379 lt!97228 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57065 c!35232) b!194900))

(assert (= (and d!57065 (not c!35232)) b!194893))

(assert (= (and b!194893 c!35235) b!194894))

(assert (= (and b!194893 (not c!35235)) b!194896))

(assert (= (or b!194894 b!194896) bm!19710))

(assert (= (and d!57065 res!92064) b!194904))

(assert (= (and b!194904 res!92063) b!194898))

(assert (= (and b!194898 res!92062) b!194899))

(assert (= (and b!194898 c!35234) b!194897))

(assert (= (and b!194898 (not c!35234)) b!194903))

(assert (= (and b!194897 res!92061) b!194902))

(assert (= (and b!194903 c!35233) b!194901))

(assert (= (and b!194903 (not c!35233)) b!194895))

(declare-fun b_lambda!7513 () Bool)

(assert (=> (not b_lambda!7513) (not b!194902)))

(assert (=> b!194902 t!7378))

(declare-fun b_and!11457 () Bool)

(assert (= b_and!11455 (and (=> t!7378 result!4939) b_and!11457)))

(declare-fun b_lambda!7515 () Bool)

(assert (=> (not b_lambda!7515) (not b!194894)))

(assert (=> b!194894 t!7378))

(declare-fun b_and!11459 () Bool)

(assert (= b_and!11457 (and (=> t!7378 result!4939) b_and!11459)))

(declare-fun m!222137 () Bool)

(assert (=> d!57065 m!222137))

(assert (=> d!57065 m!220855))

(declare-fun m!222139 () Bool)

(assert (=> bm!19710 m!222139))

(declare-fun m!222141 () Bool)

(assert (=> b!194894 m!222141))

(declare-fun m!222143 () Bool)

(assert (=> b!194894 m!222143))

(declare-fun m!222145 () Bool)

(assert (=> b!194894 m!222145))

(assert (=> b!194894 m!220881))

(declare-fun m!222147 () Bool)

(assert (=> b!194894 m!222147))

(assert (=> b!194894 m!222143))

(declare-fun m!222149 () Bool)

(assert (=> b!194894 m!222149))

(assert (=> b!194894 m!221983))

(declare-fun m!222151 () Bool)

(assert (=> b!194894 m!222151))

(assert (=> b!194894 m!220881))

(assert (=> b!194894 m!222145))

(assert (=> b!194899 m!221983))

(assert (=> b!194899 m!221983))

(assert (=> b!194899 m!221985))

(declare-fun m!222153 () Bool)

(assert (=> b!194895 m!222153))

(assert (=> b!194897 m!221983))

(assert (=> b!194897 m!221983))

(declare-fun m!222155 () Bool)

(assert (=> b!194897 m!222155))

(declare-fun m!222157 () Bool)

(assert (=> b!194904 m!222157))

(assert (=> b!194901 m!222139))

(assert (=> b!194902 m!222145))

(assert (=> b!194902 m!220881))

(assert (=> b!194902 m!222147))

(assert (=> b!194902 m!221983))

(declare-fun m!222159 () Bool)

(assert (=> b!194902 m!222159))

(assert (=> b!194902 m!221983))

(assert (=> b!194902 m!220881))

(assert (=> b!194902 m!222145))

(assert (=> b!194893 m!221983))

(assert (=> b!194893 m!221983))

(assert (=> b!194893 m!221985))

(assert (=> bm!19662 d!57065))

(declare-fun d!57067 () Bool)

(declare-fun e!128192 () Bool)

(assert (=> d!57067 e!128192))

(declare-fun res!92065 () Bool)

(assert (=> d!57067 (=> res!92065 e!128192)))

(declare-fun lt!97229 () Bool)

(assert (=> d!57067 (= res!92065 (not lt!97229))))

(declare-fun lt!97230 () Bool)

(assert (=> d!57067 (= lt!97229 lt!97230)))

(declare-fun lt!97231 () Unit!5878)

(declare-fun e!128191 () Unit!5878)

(assert (=> d!57067 (= lt!97231 e!128191)))

(declare-fun c!35236 () Bool)

(assert (=> d!57067 (= c!35236 lt!97230)))

(assert (=> d!57067 (= lt!97230 (containsKey!249 (toList!1254 lt!96914) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!57067 (= (contains!1379 lt!96914 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) lt!97229)))

(declare-fun b!194905 () Bool)

(declare-fun lt!97232 () Unit!5878)

(assert (=> b!194905 (= e!128191 lt!97232)))

(assert (=> b!194905 (= lt!97232 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96914) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194905 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96914) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194906 () Bool)

(declare-fun Unit!5913 () Unit!5878)

(assert (=> b!194906 (= e!128191 Unit!5913)))

(declare-fun b!194907 () Bool)

(assert (=> b!194907 (= e!128192 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96914) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!57067 c!35236) b!194905))

(assert (= (and d!57067 (not c!35236)) b!194906))

(assert (= (and d!57067 (not res!92065)) b!194907))

(assert (=> d!57067 m!220877))

(declare-fun m!222161 () Bool)

(assert (=> d!57067 m!222161))

(assert (=> b!194905 m!220877))

(declare-fun m!222163 () Bool)

(assert (=> b!194905 m!222163))

(assert (=> b!194905 m!220877))

(declare-fun m!222165 () Bool)

(assert (=> b!194905 m!222165))

(assert (=> b!194905 m!222165))

(declare-fun m!222167 () Bool)

(assert (=> b!194905 m!222167))

(assert (=> b!194907 m!220877))

(assert (=> b!194907 m!222165))

(assert (=> b!194907 m!222165))

(assert (=> b!194907 m!222167))

(assert (=> b!194278 d!57067))

(declare-fun d!57069 () Bool)

(declare-fun res!92066 () Bool)

(declare-fun e!128193 () Bool)

(assert (=> d!57069 (=> res!92066 e!128193)))

(assert (=> d!57069 (= res!92066 (and ((_ is Cons!2445) (toList!1254 lt!96845)) (= (_1!1791 (h!3086 (toList!1254 lt!96845))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57069 (= (containsKey!249 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000) e!128193)))

(declare-fun b!194908 () Bool)

(declare-fun e!128194 () Bool)

(assert (=> b!194908 (= e!128193 e!128194)))

(declare-fun res!92067 () Bool)

(assert (=> b!194908 (=> (not res!92067) (not e!128194))))

(assert (=> b!194908 (= res!92067 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96845))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96845))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2445) (toList!1254 lt!96845)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96845))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194909 () Bool)

(assert (=> b!194909 (= e!128194 (containsKey!249 (t!7375 (toList!1254 lt!96845)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57069 (not res!92066)) b!194908))

(assert (= (and b!194908 res!92067) b!194909))

(declare-fun m!222169 () Bool)

(assert (=> b!194909 m!222169))

(assert (=> d!56753 d!57069))

(declare-fun d!57071 () Bool)

(declare-fun e!128196 () Bool)

(assert (=> d!57071 e!128196))

(declare-fun res!92068 () Bool)

(assert (=> d!57071 (=> res!92068 e!128196)))

(declare-fun lt!97233 () Bool)

(assert (=> d!57071 (= res!92068 (not lt!97233))))

(declare-fun lt!97234 () Bool)

(assert (=> d!57071 (= lt!97233 lt!97234)))

(declare-fun lt!97235 () Unit!5878)

(declare-fun e!128195 () Unit!5878)

(assert (=> d!57071 (= lt!97235 e!128195)))

(declare-fun c!35237 () Bool)

(assert (=> d!57071 (= c!35237 lt!97234)))

(assert (=> d!57071 (= lt!97234 (containsKey!249 (toList!1254 lt!97031) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57071 (= (contains!1379 lt!97031 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97233)))

(declare-fun b!194910 () Bool)

(declare-fun lt!97236 () Unit!5878)

(assert (=> b!194910 (= e!128195 lt!97236)))

(assert (=> b!194910 (= lt!97236 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97031) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194910 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97031) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194911 () Bool)

(declare-fun Unit!5914 () Unit!5878)

(assert (=> b!194911 (= e!128195 Unit!5914)))

(declare-fun b!194912 () Bool)

(assert (=> b!194912 (= e!128196 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57071 c!35237) b!194910))

(assert (= (and d!57071 (not c!35237)) b!194911))

(assert (= (and d!57071 (not res!92068)) b!194912))

(declare-fun m!222171 () Bool)

(assert (=> d!57071 m!222171))

(declare-fun m!222173 () Bool)

(assert (=> b!194910 m!222173))

(declare-fun m!222175 () Bool)

(assert (=> b!194910 m!222175))

(assert (=> b!194910 m!222175))

(declare-fun m!222177 () Bool)

(assert (=> b!194910 m!222177))

(assert (=> b!194912 m!222175))

(assert (=> b!194912 m!222175))

(assert (=> b!194912 m!222177))

(assert (=> b!194455 d!57071))

(declare-fun d!57073 () Bool)

(assert (=> d!57073 (= (apply!188 lt!97086 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2238 (getValueByKey!245 (toList!1254 lt!97086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7773 () Bool)

(assert (= bs!7773 d!57073))

(declare-fun m!222179 () Bool)

(assert (=> bs!7773 m!222179))

(assert (=> bs!7773 m!222179))

(declare-fun m!222181 () Bool)

(assert (=> bs!7773 m!222181))

(assert (=> b!194601 d!57073))

(declare-fun d!57075 () Bool)

(declare-fun lt!97239 () Bool)

(declare-fun content!156 (List!2451) (InoxSet (_ BitVec 64)))

(assert (=> d!57075 (= lt!97239 (select (content!156 Nil!2448) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!128201 () Bool)

(assert (=> d!57075 (= lt!97239 e!128201)))

(declare-fun res!92073 () Bool)

(assert (=> d!57075 (=> (not res!92073) (not e!128201))))

(assert (=> d!57075 (= res!92073 ((_ is Cons!2447) Nil!2448))))

(assert (=> d!57075 (= (contains!1382 Nil!2448 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) lt!97239)))

(declare-fun b!194917 () Bool)

(declare-fun e!128202 () Bool)

(assert (=> b!194917 (= e!128201 e!128202)))

(declare-fun res!92074 () Bool)

(assert (=> b!194917 (=> res!92074 e!128202)))

(assert (=> b!194917 (= res!92074 (= (h!3088 Nil!2448) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194918 () Bool)

(assert (=> b!194918 (= e!128202 (contains!1382 (t!7379 Nil!2448) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57075 res!92073) b!194917))

(assert (= (and b!194917 (not res!92074)) b!194918))

(declare-fun m!222183 () Bool)

(assert (=> d!57075 m!222183))

(assert (=> d!57075 m!220877))

(declare-fun m!222185 () Bool)

(assert (=> d!57075 m!222185))

(assert (=> b!194918 m!220877))

(declare-fun m!222187 () Bool)

(assert (=> b!194918 m!222187))

(assert (=> b!194525 d!57075))

(assert (=> b!194425 d!56867))

(declare-fun b!194919 () Bool)

(declare-fun e!128205 () Bool)

(declare-fun e!128204 () Bool)

(assert (=> b!194919 (= e!128205 e!128204)))

(declare-fun c!35238 () Bool)

(assert (=> b!194919 (= c!35238 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194920 () Bool)

(declare-fun e!128203 () Bool)

(declare-fun call!19714 () Bool)

(assert (=> b!194920 (= e!128203 call!19714)))

(declare-fun b!194921 () Bool)

(assert (=> b!194921 (= e!128204 e!128203)))

(declare-fun lt!97240 () (_ BitVec 64))

(assert (=> b!194921 (= lt!97240 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!97242 () Unit!5878)

(assert (=> b!194921 (= lt!97242 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5954 thiss!1248) lt!97240 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!194921 (arrayContainsKey!0 (_keys!5954 thiss!1248) lt!97240 #b00000000000000000000000000000000)))

(declare-fun lt!97241 () Unit!5878)

(assert (=> b!194921 (= lt!97241 lt!97242)))

(declare-fun res!92075 () Bool)

(assert (=> b!194921 (= res!92075 (= (seekEntryOrOpen!0 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5954 thiss!1248) (mask!9223 thiss!1248)) (Found!694 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!194921 (=> (not res!92075) (not e!128203))))

(declare-fun d!57077 () Bool)

(declare-fun res!92076 () Bool)

(assert (=> d!57077 (=> res!92076 e!128205)))

(assert (=> d!57077 (= res!92076 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!57077 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5954 thiss!1248) (mask!9223 thiss!1248)) e!128205)))

(declare-fun bm!19711 () Bool)

(assert (=> bm!19711 (= call!19714 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun b!194922 () Bool)

(assert (=> b!194922 (= e!128204 call!19714)))

(assert (= (and d!57077 (not res!92076)) b!194919))

(assert (= (and b!194919 c!35238) b!194921))

(assert (= (and b!194919 (not c!35238)) b!194922))

(assert (= (and b!194921 res!92075) b!194920))

(assert (= (or b!194920 b!194922) bm!19711))

(assert (=> b!194919 m!221983))

(assert (=> b!194919 m!221983))

(assert (=> b!194919 m!221985))

(assert (=> b!194921 m!221983))

(declare-fun m!222189 () Bool)

(assert (=> b!194921 m!222189))

(declare-fun m!222191 () Bool)

(assert (=> b!194921 m!222191))

(assert (=> b!194921 m!221983))

(declare-fun m!222193 () Bool)

(assert (=> b!194921 m!222193))

(declare-fun m!222195 () Bool)

(assert (=> bm!19711 m!222195))

(assert (=> bm!19643 d!57077))

(declare-fun d!57079 () Bool)

(assert (=> d!57079 (= (apply!188 lt!97086 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2238 (getValueByKey!245 (toList!1254 lt!97086) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7774 () Bool)

(assert (= bs!7774 d!57079))

(declare-fun m!222197 () Bool)

(assert (=> bs!7774 m!222197))

(assert (=> bs!7774 m!222197))

(declare-fun m!222199 () Bool)

(assert (=> bs!7774 m!222199))

(assert (=> b!194589 d!57079))

(declare-fun b!194924 () Bool)

(declare-fun e!128206 () Option!251)

(declare-fun e!128207 () Option!251)

(assert (=> b!194924 (= e!128206 e!128207)))

(declare-fun c!35240 () Bool)

(assert (=> b!194924 (= c!35240 (and ((_ is Cons!2445) (toList!1254 lt!96992)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96992))) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))))

(declare-fun b!194923 () Bool)

(assert (=> b!194923 (= e!128206 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96992)))))))

(declare-fun b!194925 () Bool)

(assert (=> b!194925 (= e!128207 (getValueByKey!245 (t!7375 (toList!1254 lt!96992)) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun d!57081 () Bool)

(declare-fun c!35239 () Bool)

(assert (=> d!57081 (= c!35239 (and ((_ is Cons!2445) (toList!1254 lt!96992)) (= (_1!1791 (h!3086 (toList!1254 lt!96992))) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(assert (=> d!57081 (= (getValueByKey!245 (toList!1254 lt!96992) (_1!1791 (ite (or c!35009 c!35010) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) e!128206)))

(declare-fun b!194926 () Bool)

(assert (=> b!194926 (= e!128207 None!249)))

(assert (= (and d!57081 c!35239) b!194923))

(assert (= (and d!57081 (not c!35239)) b!194924))

(assert (= (and b!194924 c!35240) b!194925))

(assert (= (and b!194924 (not c!35240)) b!194926))

(declare-fun m!222201 () Bool)

(assert (=> b!194925 m!222201))

(assert (=> b!194420 d!57081))

(declare-fun d!57083 () Bool)

(assert (=> d!57083 (= (validMask!0 (mask!9223 lt!96671)) (and (or (= (mask!9223 lt!96671) #b00000000000000000000000000000111) (= (mask!9223 lt!96671) #b00000000000000000000000000001111) (= (mask!9223 lt!96671) #b00000000000000000000000000011111) (= (mask!9223 lt!96671) #b00000000000000000000000000111111) (= (mask!9223 lt!96671) #b00000000000000000000000001111111) (= (mask!9223 lt!96671) #b00000000000000000000000011111111) (= (mask!9223 lt!96671) #b00000000000000000000000111111111) (= (mask!9223 lt!96671) #b00000000000000000000001111111111) (= (mask!9223 lt!96671) #b00000000000000000000011111111111) (= (mask!9223 lt!96671) #b00000000000000000000111111111111) (= (mask!9223 lt!96671) #b00000000000000000001111111111111) (= (mask!9223 lt!96671) #b00000000000000000011111111111111) (= (mask!9223 lt!96671) #b00000000000000000111111111111111) (= (mask!9223 lt!96671) #b00000000000000001111111111111111) (= (mask!9223 lt!96671) #b00000000000000011111111111111111) (= (mask!9223 lt!96671) #b00000000000000111111111111111111) (= (mask!9223 lt!96671) #b00000000000001111111111111111111) (= (mask!9223 lt!96671) #b00000000000011111111111111111111) (= (mask!9223 lt!96671) #b00000000000111111111111111111111) (= (mask!9223 lt!96671) #b00000000001111111111111111111111) (= (mask!9223 lt!96671) #b00000000011111111111111111111111) (= (mask!9223 lt!96671) #b00000000111111111111111111111111) (= (mask!9223 lt!96671) #b00000001111111111111111111111111) (= (mask!9223 lt!96671) #b00000011111111111111111111111111) (= (mask!9223 lt!96671) #b00000111111111111111111111111111) (= (mask!9223 lt!96671) #b00001111111111111111111111111111) (= (mask!9223 lt!96671) #b00011111111111111111111111111111) (= (mask!9223 lt!96671) #b00111111111111111111111111111111)) (bvsle (mask!9223 lt!96671) #b00111111111111111111111111111111)))))

(assert (=> d!56851 d!57083))

(declare-fun d!57085 () Bool)

(declare-fun res!92077 () Bool)

(declare-fun e!128208 () Bool)

(assert (=> d!57085 (=> res!92077 e!128208)))

(assert (=> d!57085 (= res!92077 (and ((_ is Cons!2445) (toList!1254 lt!96808)) (= (_1!1791 (h!3086 (toList!1254 lt!96808))) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!57085 (= (containsKey!249 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) e!128208)))

(declare-fun b!194927 () Bool)

(declare-fun e!128209 () Bool)

(assert (=> b!194927 (= e!128208 e!128209)))

(declare-fun res!92078 () Bool)

(assert (=> b!194927 (=> (not res!92078) (not e!128209))))

(assert (=> b!194927 (= res!92078 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96808))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96808))) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2445) (toList!1254 lt!96808)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96808))) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!194928 () Bool)

(assert (=> b!194928 (= e!128209 (containsKey!249 (t!7375 (toList!1254 lt!96808)) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57085 (not res!92077)) b!194927))

(assert (= (and b!194927 res!92078) b!194928))

(assert (=> b!194928 m!220877))

(declare-fun m!222203 () Bool)

(assert (=> b!194928 m!222203))

(assert (=> d!56853 d!57085))

(declare-fun d!57087 () Bool)

(declare-fun isEmpty!489 (List!2449) Bool)

(assert (=> d!57087 (= (isEmpty!488 lt!97031) (isEmpty!489 (toList!1254 lt!97031)))))

(declare-fun bs!7775 () Bool)

(assert (= bs!7775 d!57087))

(declare-fun m!222205 () Bool)

(assert (=> bs!7775 m!222205))

(assert (=> b!194446 d!57087))

(declare-fun d!57089 () Bool)

(declare-fun e!128211 () Bool)

(assert (=> d!57089 e!128211))

(declare-fun res!92079 () Bool)

(assert (=> d!57089 (=> res!92079 e!128211)))

(declare-fun lt!97243 () Bool)

(assert (=> d!57089 (= res!92079 (not lt!97243))))

(declare-fun lt!97244 () Bool)

(assert (=> d!57089 (= lt!97243 lt!97244)))

(declare-fun lt!97245 () Unit!5878)

(declare-fun e!128210 () Unit!5878)

(assert (=> d!57089 (= lt!97245 e!128210)))

(declare-fun c!35241 () Bool)

(assert (=> d!57089 (= c!35241 lt!97244)))

(assert (=> d!57089 (= lt!97244 (containsKey!249 (toList!1254 lt!97086) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57089 (= (contains!1379 lt!97086 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97243)))

(declare-fun b!194929 () Bool)

(declare-fun lt!97246 () Unit!5878)

(assert (=> b!194929 (= e!128210 lt!97246)))

(assert (=> b!194929 (= lt!97246 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97086) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194929 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97086) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194930 () Bool)

(declare-fun Unit!5915 () Unit!5878)

(assert (=> b!194930 (= e!128210 Unit!5915)))

(declare-fun b!194931 () Bool)

(assert (=> b!194931 (= e!128211 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57089 c!35241) b!194929))

(assert (= (and d!57089 (not c!35241)) b!194930))

(assert (= (and d!57089 (not res!92079)) b!194931))

(declare-fun m!222207 () Bool)

(assert (=> d!57089 m!222207))

(declare-fun m!222209 () Bool)

(assert (=> b!194929 m!222209))

(assert (=> b!194929 m!222179))

(assert (=> b!194929 m!222179))

(declare-fun m!222211 () Bool)

(assert (=> b!194929 m!222211))

(assert (=> b!194931 m!222179))

(assert (=> b!194931 m!222179))

(assert (=> b!194931 m!222211))

(assert (=> bm!19681 d!57089))

(assert (=> bm!19670 d!56827))

(declare-fun d!57091 () Bool)

(declare-fun e!128212 () Bool)

(assert (=> d!57091 e!128212))

(declare-fun res!92080 () Bool)

(assert (=> d!57091 (=> (not res!92080) (not e!128212))))

(declare-fun lt!97247 () ListLongMap!2477)

(assert (=> d!57091 (= res!92080 (contains!1379 lt!97247 (_1!1791 (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun lt!97250 () List!2449)

(assert (=> d!57091 (= lt!97247 (ListLongMap!2478 lt!97250))))

(declare-fun lt!97248 () Unit!5878)

(declare-fun lt!97249 () Unit!5878)

(assert (=> d!57091 (= lt!97248 lt!97249)))

(assert (=> d!57091 (= (getValueByKey!245 lt!97250 (_1!1791 (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) (Some!250 (_2!1791 (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!57091 (= lt!97249 (lemmaContainsTupThenGetReturnValue!132 lt!97250 (_1!1791 (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!57091 (= lt!97250 (insertStrictlySorted!135 (toList!1254 (ite c!35045 call!19650 (ite c!35046 call!19649 call!19647))) (_1!1791 (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!57091 (= (+!322 (ite c!35045 call!19650 (ite c!35046 call!19649 call!19647)) (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!97247)))

(declare-fun b!194932 () Bool)

(declare-fun res!92081 () Bool)

(assert (=> b!194932 (=> (not res!92081) (not e!128212))))

(assert (=> b!194932 (= res!92081 (= (getValueByKey!245 (toList!1254 lt!97247) (_1!1791 (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) (Some!250 (_2!1791 (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun b!194933 () Bool)

(assert (=> b!194933 (= e!128212 (contains!1381 (toList!1254 lt!97247) (ite (or c!35045 c!35046) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (= (and d!57091 res!92080) b!194932))

(assert (= (and b!194932 res!92081) b!194933))

(declare-fun m!222213 () Bool)

(assert (=> d!57091 m!222213))

(declare-fun m!222215 () Bool)

(assert (=> d!57091 m!222215))

(declare-fun m!222217 () Bool)

(assert (=> d!57091 m!222217))

(declare-fun m!222219 () Bool)

(assert (=> d!57091 m!222219))

(declare-fun m!222221 () Bool)

(assert (=> b!194932 m!222221))

(declare-fun m!222223 () Bool)

(assert (=> b!194933 m!222223))

(assert (=> bm!19645 d!57091))

(declare-fun d!57093 () Bool)

(declare-fun e!128214 () Bool)

(assert (=> d!57093 e!128214))

(declare-fun res!92082 () Bool)

(assert (=> d!57093 (=> res!92082 e!128214)))

(declare-fun lt!97251 () Bool)

(assert (=> d!57093 (= res!92082 (not lt!97251))))

(declare-fun lt!97252 () Bool)

(assert (=> d!57093 (= lt!97251 lt!97252)))

(declare-fun lt!97253 () Unit!5878)

(declare-fun e!128213 () Unit!5878)

(assert (=> d!57093 (= lt!97253 e!128213)))

(declare-fun c!35242 () Bool)

(assert (=> d!57093 (= c!35242 lt!97252)))

(assert (=> d!57093 (= lt!97252 (containsKey!249 (toList!1254 lt!97012) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(assert (=> d!57093 (= (contains!1379 lt!97012 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) lt!97251)))

(declare-fun b!194934 () Bool)

(declare-fun lt!97254 () Unit!5878)

(assert (=> b!194934 (= e!128213 lt!97254)))

(assert (=> b!194934 (= lt!97254 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97012) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(assert (=> b!194934 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97012) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(declare-fun b!194935 () Bool)

(declare-fun Unit!5916 () Unit!5878)

(assert (=> b!194935 (= e!128213 Unit!5916)))

(declare-fun b!194936 () Bool)

(assert (=> b!194936 (= e!128214 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97012) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))))

(assert (= (and d!57093 c!35242) b!194934))

(assert (= (and d!57093 (not c!35242)) b!194935))

(assert (= (and d!57093 (not res!92082)) b!194936))

(declare-fun m!222225 () Bool)

(assert (=> d!57093 m!222225))

(declare-fun m!222227 () Bool)

(assert (=> b!194934 m!222227))

(assert (=> b!194934 m!221383))

(assert (=> b!194934 m!221383))

(declare-fun m!222229 () Bool)

(assert (=> b!194934 m!222229))

(assert (=> b!194936 m!221383))

(assert (=> b!194936 m!221383))

(assert (=> b!194936 m!222229))

(assert (=> d!56777 d!57093))

(declare-fun b!194938 () Bool)

(declare-fun e!128215 () Option!251)

(declare-fun e!128216 () Option!251)

(assert (=> b!194938 (= e!128215 e!128216)))

(declare-fun c!35244 () Bool)

(assert (=> b!194938 (= c!35244 (and ((_ is Cons!2445) lt!97015) (not (= (_1!1791 (h!3086 lt!97015)) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))))

(declare-fun b!194937 () Bool)

(assert (=> b!194937 (= e!128215 (Some!250 (_2!1791 (h!3086 lt!97015))))))

(declare-fun b!194939 () Bool)

(assert (=> b!194939 (= e!128216 (getValueByKey!245 (t!7375 lt!97015) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(declare-fun d!57095 () Bool)

(declare-fun c!35243 () Bool)

(assert (=> d!57095 (= c!35243 (and ((_ is Cons!2445) lt!97015) (= (_1!1791 (h!3086 lt!97015)) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))))

(assert (=> d!57095 (= (getValueByKey!245 lt!97015 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) e!128215)))

(declare-fun b!194940 () Bool)

(assert (=> b!194940 (= e!128216 None!249)))

(assert (= (and d!57095 c!35243) b!194937))

(assert (= (and d!57095 (not c!35243)) b!194938))

(assert (= (and b!194938 c!35244) b!194939))

(assert (= (and b!194938 (not c!35244)) b!194940))

(declare-fun m!222231 () Bool)

(assert (=> b!194939 m!222231))

(assert (=> d!56777 d!57095))

(declare-fun d!57097 () Bool)

(assert (=> d!57097 (= (getValueByKey!245 lt!97015 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97255 () Unit!5878)

(assert (=> d!57097 (= lt!97255 (choose!1068 lt!97015 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(declare-fun e!128217 () Bool)

(assert (=> d!57097 e!128217))

(declare-fun res!92083 () Bool)

(assert (=> d!57097 (=> (not res!92083) (not e!128217))))

(assert (=> d!57097 (= res!92083 (isStrictlySorted!357 lt!97015))))

(assert (=> d!57097 (= (lemmaContainsTupThenGetReturnValue!132 lt!97015 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) lt!97255)))

(declare-fun b!194941 () Bool)

(declare-fun res!92084 () Bool)

(assert (=> b!194941 (=> (not res!92084) (not e!128217))))

(assert (=> b!194941 (= res!92084 (containsKey!249 lt!97015 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(declare-fun b!194942 () Bool)

(assert (=> b!194942 (= e!128217 (contains!1381 lt!97015 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))))

(assert (= (and d!57097 res!92083) b!194941))

(assert (= (and b!194941 res!92084) b!194942))

(assert (=> d!57097 m!221377))

(declare-fun m!222233 () Bool)

(assert (=> d!57097 m!222233))

(declare-fun m!222235 () Bool)

(assert (=> d!57097 m!222235))

(declare-fun m!222237 () Bool)

(assert (=> b!194941 m!222237))

(declare-fun m!222239 () Bool)

(assert (=> b!194942 m!222239))

(assert (=> d!56777 d!57097))

(declare-fun e!128218 () List!2449)

(declare-fun call!19716 () List!2449)

(declare-fun bm!19712 () Bool)

(declare-fun c!35246 () Bool)

(assert (=> bm!19712 (= call!19716 ($colon$colon!103 e!128218 (ite c!35246 (h!3086 (toList!1254 lt!96801)) (tuple2!3561 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))))

(declare-fun c!35245 () Bool)

(assert (=> bm!19712 (= c!35245 c!35246)))

(declare-fun b!194943 () Bool)

(declare-fun e!128222 () List!2449)

(declare-fun call!19715 () List!2449)

(assert (=> b!194943 (= e!128222 call!19715)))

(declare-fun c!35247 () Bool)

(declare-fun b!194944 () Bool)

(assert (=> b!194944 (= c!35247 (and ((_ is Cons!2445) (toList!1254 lt!96801)) (bvsgt (_1!1791 (h!3086 (toList!1254 lt!96801))) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))))

(declare-fun e!128220 () List!2449)

(assert (=> b!194944 (= e!128222 e!128220)))

(declare-fun b!194945 () Bool)

(declare-fun e!128221 () Bool)

(declare-fun lt!97256 () List!2449)

(assert (=> b!194945 (= e!128221 (contains!1381 lt!97256 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))))

(declare-fun bm!19713 () Bool)

(declare-fun call!19717 () List!2449)

(assert (=> bm!19713 (= call!19717 call!19715)))

(declare-fun b!194946 () Bool)

(declare-fun e!128219 () List!2449)

(assert (=> b!194946 (= e!128219 e!128222)))

(declare-fun c!35248 () Bool)

(assert (=> b!194946 (= c!35248 (and ((_ is Cons!2445) (toList!1254 lt!96801)) (= (_1!1791 (h!3086 (toList!1254 lt!96801))) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))))

(declare-fun d!57099 () Bool)

(assert (=> d!57099 e!128221))

(declare-fun res!92085 () Bool)

(assert (=> d!57099 (=> (not res!92085) (not e!128221))))

(assert (=> d!57099 (= res!92085 (isStrictlySorted!357 lt!97256))))

(assert (=> d!57099 (= lt!97256 e!128219)))

(assert (=> d!57099 (= c!35246 (and ((_ is Cons!2445) (toList!1254 lt!96801)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96801))) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))))

(assert (=> d!57099 (isStrictlySorted!357 (toList!1254 lt!96801))))

(assert (=> d!57099 (= (insertStrictlySorted!135 (toList!1254 lt!96801) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) lt!97256)))

(declare-fun bm!19714 () Bool)

(assert (=> bm!19714 (= call!19715 call!19716)))

(declare-fun b!194947 () Bool)

(assert (=> b!194947 (= e!128220 call!19717)))

(declare-fun b!194948 () Bool)

(assert (=> b!194948 (= e!128218 (insertStrictlySorted!135 (t!7375 (toList!1254 lt!96801)) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(declare-fun b!194949 () Bool)

(assert (=> b!194949 (= e!128220 call!19717)))

(declare-fun b!194950 () Bool)

(declare-fun res!92086 () Bool)

(assert (=> b!194950 (=> (not res!92086) (not e!128221))))

(assert (=> b!194950 (= res!92086 (containsKey!249 lt!97256 (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(declare-fun b!194951 () Bool)

(assert (=> b!194951 (= e!128219 call!19716)))

(declare-fun b!194952 () Bool)

(assert (=> b!194952 (= e!128218 (ite c!35248 (t!7375 (toList!1254 lt!96801)) (ite c!35247 (Cons!2445 (h!3086 (toList!1254 lt!96801)) (t!7375 (toList!1254 lt!96801))) Nil!2446)))))

(assert (= (and d!57099 c!35246) b!194951))

(assert (= (and d!57099 (not c!35246)) b!194946))

(assert (= (and b!194946 c!35248) b!194943))

(assert (= (and b!194946 (not c!35248)) b!194944))

(assert (= (and b!194944 c!35247) b!194949))

(assert (= (and b!194944 (not c!35247)) b!194947))

(assert (= (or b!194949 b!194947) bm!19713))

(assert (= (or b!194943 bm!19713) bm!19714))

(assert (= (or b!194951 bm!19714) bm!19712))

(assert (= (and bm!19712 c!35245) b!194948))

(assert (= (and bm!19712 (not c!35245)) b!194952))

(assert (= (and d!57099 res!92085) b!194950))

(assert (= (and b!194950 res!92086) b!194945))

(declare-fun m!222241 () Bool)

(assert (=> bm!19712 m!222241))

(declare-fun m!222243 () Bool)

(assert (=> b!194950 m!222243))

(declare-fun m!222245 () Bool)

(assert (=> b!194945 m!222245))

(declare-fun m!222247 () Bool)

(assert (=> b!194948 m!222247))

(declare-fun m!222249 () Bool)

(assert (=> d!57099 m!222249))

(declare-fun m!222251 () Bool)

(assert (=> d!57099 m!222251))

(assert (=> d!56777 d!57099))

(declare-fun d!57101 () Bool)

(declare-fun lt!97257 () Bool)

(assert (=> d!57101 (= lt!97257 (select (content!156 Nil!2448) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun e!128223 () Bool)

(assert (=> d!57101 (= lt!97257 e!128223)))

(declare-fun res!92087 () Bool)

(assert (=> d!57101 (=> (not res!92087) (not e!128223))))

(assert (=> d!57101 (= res!92087 ((_ is Cons!2447) Nil!2448))))

(assert (=> d!57101 (= (contains!1382 Nil!2448 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)) lt!97257)))

(declare-fun b!194953 () Bool)

(declare-fun e!128224 () Bool)

(assert (=> b!194953 (= e!128223 e!128224)))

(declare-fun res!92088 () Bool)

(assert (=> b!194953 (=> res!92088 e!128224)))

(assert (=> b!194953 (= res!92088 (= (h!3088 Nil!2448) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun b!194954 () Bool)

(assert (=> b!194954 (= e!128224 (contains!1382 (t!7379 Nil!2448) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(assert (= (and d!57101 res!92087) b!194953))

(assert (= (and b!194953 (not res!92088)) b!194954))

(assert (=> d!57101 m!222183))

(assert (=> d!57101 m!221447))

(declare-fun m!222253 () Bool)

(assert (=> d!57101 m!222253))

(assert (=> b!194954 m!221447))

(declare-fun m!222255 () Bool)

(assert (=> b!194954 m!222255))

(assert (=> b!194570 d!57101))

(declare-fun d!57103 () Bool)

(assert (=> d!57103 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4256 (getValueByKey!245 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56821 d!57103))

(declare-fun b!194956 () Bool)

(declare-fun e!128225 () Option!251)

(declare-fun e!128226 () Option!251)

(assert (=> b!194956 (= e!128225 e!128226)))

(declare-fun c!35250 () Bool)

(assert (=> b!194956 (= c!35250 (and ((_ is Cons!2445) (toList!1254 lt!96808)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96808))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194955 () Bool)

(assert (=> b!194955 (= e!128225 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96808)))))))

(declare-fun b!194957 () Bool)

(assert (=> b!194957 (= e!128226 (getValueByKey!245 (t!7375 (toList!1254 lt!96808)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!57105 () Bool)

(declare-fun c!35249 () Bool)

(assert (=> d!57105 (= c!35249 (and ((_ is Cons!2445) (toList!1254 lt!96808)) (= (_1!1791 (h!3086 (toList!1254 lt!96808))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57105 (= (getValueByKey!245 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000) e!128225)))

(declare-fun b!194958 () Bool)

(assert (=> b!194958 (= e!128226 None!249)))

(assert (= (and d!57105 c!35249) b!194955))

(assert (= (and d!57105 (not c!35249)) b!194956))

(assert (= (and b!194956 c!35250) b!194957))

(assert (= (and b!194956 (not c!35250)) b!194958))

(declare-fun m!222257 () Bool)

(assert (=> b!194957 m!222257))

(assert (=> d!56821 d!57105))

(declare-fun b!194960 () Bool)

(declare-fun e!128227 () Option!251)

(declare-fun e!128228 () Option!251)

(assert (=> b!194960 (= e!128227 e!128228)))

(declare-fun c!35252 () Bool)

(assert (=> b!194960 (= c!35252 (and ((_ is Cons!2445) (toList!1254 lt!96976)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96976))) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))))

(declare-fun b!194959 () Bool)

(assert (=> b!194959 (= e!128227 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96976)))))))

(declare-fun b!194961 () Bool)

(assert (=> b!194961 (= e!128228 (getValueByKey!245 (t!7375 (toList!1254 lt!96976)) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))))

(declare-fun d!57107 () Bool)

(declare-fun c!35251 () Bool)

(assert (=> d!57107 (= c!35251 (and ((_ is Cons!2445) (toList!1254 lt!96976)) (= (_1!1791 (h!3086 (toList!1254 lt!96976))) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57107 (= (getValueByKey!245 (toList!1254 lt!96976) (_1!1791 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) e!128227)))

(declare-fun b!194962 () Bool)

(assert (=> b!194962 (= e!128228 None!249)))

(assert (= (and d!57107 c!35251) b!194959))

(assert (= (and d!57107 (not c!35251)) b!194960))

(assert (= (and b!194960 c!35252) b!194961))

(assert (= (and b!194960 (not c!35252)) b!194962))

(declare-fun m!222259 () Bool)

(assert (=> b!194961 m!222259))

(assert (=> b!194411 d!57107))

(declare-fun b!194964 () Bool)

(declare-fun e!128229 () Option!251)

(declare-fun e!128230 () Option!251)

(assert (=> b!194964 (= e!128229 e!128230)))

(declare-fun c!35254 () Bool)

(assert (=> b!194964 (= c!35254 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96817))) (not (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96817)))) (_1!1791 lt!96678)))))))

(declare-fun b!194963 () Bool)

(assert (=> b!194963 (= e!128229 (Some!250 (_2!1791 (h!3086 (t!7375 (toList!1254 lt!96817))))))))

(declare-fun b!194965 () Bool)

(assert (=> b!194965 (= e!128230 (getValueByKey!245 (t!7375 (t!7375 (toList!1254 lt!96817))) (_1!1791 lt!96678)))))

(declare-fun d!57109 () Bool)

(declare-fun c!35253 () Bool)

(assert (=> d!57109 (= c!35253 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96817))) (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96817)))) (_1!1791 lt!96678))))))

(assert (=> d!57109 (= (getValueByKey!245 (t!7375 (toList!1254 lt!96817)) (_1!1791 lt!96678)) e!128229)))

(declare-fun b!194966 () Bool)

(assert (=> b!194966 (= e!128230 None!249)))

(assert (= (and d!57109 c!35253) b!194963))

(assert (= (and d!57109 (not c!35253)) b!194964))

(assert (= (and b!194964 c!35254) b!194965))

(assert (= (and b!194964 (not c!35254)) b!194966))

(declare-fun m!222261 () Bool)

(assert (=> b!194965 m!222261))

(assert (=> b!194531 d!57109))

(declare-fun b!194968 () Bool)

(declare-fun e!128231 () Option!251)

(declare-fun e!128232 () Option!251)

(assert (=> b!194968 (= e!128231 e!128232)))

(declare-fun c!35256 () Bool)

(assert (=> b!194968 (= c!35256 (and ((_ is Cons!2445) (toList!1254 lt!96967)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96967))) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))))

(declare-fun b!194967 () Bool)

(assert (=> b!194967 (= e!128231 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96967)))))))

(declare-fun b!194969 () Bool)

(assert (=> b!194969 (= e!128232 (getValueByKey!245 (t!7375 (toList!1254 lt!96967)) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))))))

(declare-fun d!57111 () Bool)

(declare-fun c!35255 () Bool)

(assert (=> d!57111 (= c!35255 (and ((_ is Cons!2445) (toList!1254 lt!96967)) (= (_1!1791 (h!3086 (toList!1254 lt!96967))) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))))))))

(assert (=> d!57111 (= (getValueByKey!245 (toList!1254 lt!96967) (_1!1791 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248)))) e!128231)))

(declare-fun b!194970 () Bool)

(assert (=> b!194970 (= e!128232 None!249)))

(assert (= (and d!57111 c!35255) b!194967))

(assert (= (and d!57111 (not c!35255)) b!194968))

(assert (= (and b!194968 c!35256) b!194969))

(assert (= (and b!194968 (not c!35256)) b!194970))

(declare-fun m!222263 () Bool)

(assert (=> b!194969 m!222263))

(assert (=> b!194406 d!57111))

(assert (=> b!194456 d!57043))

(declare-fun d!57113 () Bool)

(assert (=> d!57113 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!97258 () Unit!5878)

(assert (=> d!57113 (= lt!97258 (choose!1067 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!128233 () Bool)

(assert (=> d!57113 e!128233))

(declare-fun res!92089 () Bool)

(assert (=> d!57113 (=> (not res!92089) (not e!128233))))

(assert (=> d!57113 (= res!92089 (isStrictlySorted!357 (toList!1254 lt!96808)))))

(assert (=> d!57113 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) lt!97258)))

(declare-fun b!194971 () Bool)

(assert (=> b!194971 (= e!128233 (containsKey!249 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57113 res!92089) b!194971))

(assert (=> d!57113 m!220877))

(assert (=> d!57113 m!221543))

(assert (=> d!57113 m!221543))

(assert (=> d!57113 m!221637))

(assert (=> d!57113 m!220877))

(declare-fun m!222265 () Bool)

(assert (=> d!57113 m!222265))

(declare-fun m!222267 () Bool)

(assert (=> d!57113 m!222267))

(assert (=> b!194971 m!220877))

(assert (=> b!194971 m!221633))

(assert (=> b!194609 d!57113))

(assert (=> b!194609 d!56953))

(assert (=> b!194609 d!56955))

(assert (=> b!194398 d!57065))

(declare-fun d!57115 () Bool)

(declare-fun e!128234 () Bool)

(assert (=> d!57115 e!128234))

(declare-fun res!92090 () Bool)

(assert (=> d!57115 (=> (not res!92090) (not e!128234))))

(declare-fun lt!97259 () ListLongMap!2477)

(assert (=> d!57115 (= res!92090 (contains!1379 lt!97259 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97262 () List!2449)

(assert (=> d!57115 (= lt!97259 (ListLongMap!2478 lt!97262))))

(declare-fun lt!97260 () Unit!5878)

(declare-fun lt!97261 () Unit!5878)

(assert (=> d!57115 (= lt!97260 lt!97261)))

(assert (=> d!57115 (= (getValueByKey!245 lt!97262 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!57115 (= lt!97261 (lemmaContainsTupThenGetReturnValue!132 lt!97262 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!57115 (= lt!97262 (insertStrictlySorted!135 (toList!1254 call!19651) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!57115 (= (+!322 call!19651 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) lt!97259)))

(declare-fun b!194972 () Bool)

(declare-fun res!92091 () Bool)

(assert (=> b!194972 (=> (not res!92091) (not e!128234))))

(assert (=> b!194972 (= res!92091 (= (getValueByKey!245 (toList!1254 lt!97259) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!194973 () Bool)

(assert (=> b!194973 (= e!128234 (contains!1381 (toList!1254 lt!97259) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(assert (= (and d!57115 res!92090) b!194972))

(assert (= (and b!194972 res!92091) b!194973))

(declare-fun m!222269 () Bool)

(assert (=> d!57115 m!222269))

(declare-fun m!222271 () Bool)

(assert (=> d!57115 m!222271))

(declare-fun m!222273 () Bool)

(assert (=> d!57115 m!222273))

(declare-fun m!222275 () Bool)

(assert (=> d!57115 m!222275))

(declare-fun m!222277 () Bool)

(assert (=> b!194972 m!222277))

(declare-fun m!222279 () Bool)

(assert (=> b!194973 m!222279))

(assert (=> b!194277 d!57115))

(declare-fun d!57117 () Bool)

(assert (=> d!57117 (= (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) lt!96797)) (v!4256 (getValueByKey!245 (toList!1254 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) lt!96797)))))

(assert (=> d!56789 d!57117))

(declare-fun b!194975 () Bool)

(declare-fun e!128235 () Option!251)

(declare-fun e!128236 () Option!251)

(assert (=> b!194975 (= e!128235 e!128236)))

(declare-fun c!35258 () Bool)

(assert (=> b!194975 (= c!35258 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))) (not (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))) lt!96797))))))

(declare-fun b!194974 () Bool)

(assert (=> b!194974 (= e!128235 (Some!250 (_2!1791 (h!3086 (toList!1254 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))))))

(declare-fun b!194976 () Bool)

(assert (=> b!194976 (= e!128236 (getValueByKey!245 (t!7375 (toList!1254 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))) lt!96797))))

(declare-fun d!57119 () Bool)

(declare-fun c!35257 () Bool)

(assert (=> d!57119 (= c!35257 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))) (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))))) lt!96797)))))

(assert (=> d!57119 (= (getValueByKey!245 (toList!1254 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248)))) lt!96797) e!128235)))

(declare-fun b!194977 () Bool)

(assert (=> b!194977 (= e!128236 None!249)))

(assert (= (and d!57119 c!35257) b!194974))

(assert (= (and d!57119 (not c!35257)) b!194975))

(assert (= (and b!194975 c!35258) b!194976))

(assert (= (and b!194975 (not c!35258)) b!194977))

(declare-fun m!222281 () Bool)

(assert (=> b!194976 m!222281))

(assert (=> d!56789 d!57119))

(declare-fun d!57121 () Bool)

(declare-fun res!92092 () Bool)

(declare-fun e!128237 () Bool)

(assert (=> d!57121 (=> res!92092 e!128237)))

(assert (=> d!57121 (= res!92092 (or ((_ is Nil!2446) lt!96939) ((_ is Nil!2446) (t!7375 lt!96939))))))

(assert (=> d!57121 (= (isStrictlySorted!357 lt!96939) e!128237)))

(declare-fun b!194978 () Bool)

(declare-fun e!128238 () Bool)

(assert (=> b!194978 (= e!128237 e!128238)))

(declare-fun res!92093 () Bool)

(assert (=> b!194978 (=> (not res!92093) (not e!128238))))

(assert (=> b!194978 (= res!92093 (bvslt (_1!1791 (h!3086 lt!96939)) (_1!1791 (h!3086 (t!7375 lt!96939)))))))

(declare-fun b!194979 () Bool)

(assert (=> b!194979 (= e!128238 (isStrictlySorted!357 (t!7375 lt!96939)))))

(assert (= (and d!57121 (not res!92092)) b!194978))

(assert (= (and b!194978 res!92093) b!194979))

(declare-fun m!222283 () Bool)

(assert (=> b!194979 m!222283))

(assert (=> d!56711 d!57121))

(declare-fun d!57123 () Bool)

(declare-fun res!92094 () Bool)

(declare-fun e!128239 () Bool)

(assert (=> d!57123 (=> res!92094 e!128239)))

(assert (=> d!57123 (= res!92094 (or ((_ is Nil!2446) (toList!1254 (map!2029 thiss!1248))) ((_ is Nil!2446) (t!7375 (toList!1254 (map!2029 thiss!1248))))))))

(assert (=> d!57123 (= (isStrictlySorted!357 (toList!1254 (map!2029 thiss!1248))) e!128239)))

(declare-fun b!194980 () Bool)

(declare-fun e!128240 () Bool)

(assert (=> b!194980 (= e!128239 e!128240)))

(declare-fun res!92095 () Bool)

(assert (=> b!194980 (=> (not res!92095) (not e!128240))))

(assert (=> b!194980 (= res!92095 (bvslt (_1!1791 (h!3086 (toList!1254 (map!2029 thiss!1248)))) (_1!1791 (h!3086 (t!7375 (toList!1254 (map!2029 thiss!1248)))))))))

(declare-fun b!194981 () Bool)

(assert (=> b!194981 (= e!128240 (isStrictlySorted!357 (t!7375 (toList!1254 (map!2029 thiss!1248)))))))

(assert (= (and d!57123 (not res!92094)) b!194980))

(assert (= (and b!194980 res!92095) b!194981))

(assert (=> b!194981 m!222135))

(assert (=> d!56711 d!57123))

(declare-fun b!194982 () Bool)

(declare-fun e!128243 () Bool)

(declare-fun call!19718 () Bool)

(assert (=> b!194982 (= e!128243 call!19718)))

(declare-fun c!35259 () Bool)

(declare-fun bm!19715 () Bool)

(assert (=> bm!19715 (= call!19718 (arrayNoDuplicates!0 (_keys!5954 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!35259 (Cons!2447 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!35111 (Cons!2447 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) Nil!2448) Nil!2448)) (ite c!35111 (Cons!2447 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) Nil!2448) Nil!2448))))))

(declare-fun b!194983 () Bool)

(declare-fun e!128242 () Bool)

(assert (=> b!194983 (= e!128242 (contains!1382 (ite c!35111 (Cons!2447 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) Nil!2448) Nil!2448) (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194984 () Bool)

(declare-fun e!128244 () Bool)

(assert (=> b!194984 (= e!128244 e!128243)))

(assert (=> b!194984 (= c!35259 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!57125 () Bool)

(declare-fun res!92098 () Bool)

(declare-fun e!128241 () Bool)

(assert (=> d!57125 (=> res!92098 e!128241)))

(assert (=> d!57125 (= res!92098 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!57125 (= (arrayNoDuplicates!0 (_keys!5954 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35111 (Cons!2447 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) Nil!2448) Nil!2448)) e!128241)))

(declare-fun b!194985 () Bool)

(assert (=> b!194985 (= e!128241 e!128244)))

(declare-fun res!92097 () Bool)

(assert (=> b!194985 (=> (not res!92097) (not e!128244))))

(assert (=> b!194985 (= res!92097 (not e!128242))))

(declare-fun res!92096 () Bool)

(assert (=> b!194985 (=> (not res!92096) (not e!128242))))

(assert (=> b!194985 (= res!92096 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194986 () Bool)

(assert (=> b!194986 (= e!128243 call!19718)))

(assert (= (and d!57125 (not res!92098)) b!194985))

(assert (= (and b!194985 res!92096) b!194983))

(assert (= (and b!194985 res!92097) b!194984))

(assert (= (and b!194984 c!35259) b!194986))

(assert (= (and b!194984 (not c!35259)) b!194982))

(assert (= (or b!194986 b!194982) bm!19715))

(assert (=> bm!19715 m!221983))

(declare-fun m!222285 () Bool)

(assert (=> bm!19715 m!222285))

(assert (=> b!194983 m!221983))

(assert (=> b!194983 m!221983))

(declare-fun m!222287 () Bool)

(assert (=> b!194983 m!222287))

(assert (=> b!194984 m!221983))

(assert (=> b!194984 m!221983))

(assert (=> b!194984 m!221985))

(assert (=> b!194985 m!221983))

(assert (=> b!194985 m!221983))

(assert (=> b!194985 m!221985))

(assert (=> bm!19676 d!57125))

(declare-fun lt!97263 () Bool)

(declare-fun d!57127 () Bool)

(assert (=> d!57127 (= lt!97263 (select (content!155 (toList!1254 lt!97012)) (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))

(declare-fun e!128246 () Bool)

(assert (=> d!57127 (= lt!97263 e!128246)))

(declare-fun res!92099 () Bool)

(assert (=> d!57127 (=> (not res!92099) (not e!128246))))

(assert (=> d!57127 (= res!92099 ((_ is Cons!2445) (toList!1254 lt!97012)))))

(assert (=> d!57127 (= (contains!1381 (toList!1254 lt!97012) (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) lt!97263)))

(declare-fun b!194987 () Bool)

(declare-fun e!128245 () Bool)

(assert (=> b!194987 (= e!128246 e!128245)))

(declare-fun res!92100 () Bool)

(assert (=> b!194987 (=> res!92100 e!128245)))

(assert (=> b!194987 (= res!92100 (= (h!3086 (toList!1254 lt!97012)) (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))

(declare-fun b!194988 () Bool)

(assert (=> b!194988 (= e!128245 (contains!1381 (t!7375 (toList!1254 lt!97012)) (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))

(assert (= (and d!57127 res!92099) b!194987))

(assert (= (and b!194987 (not res!92100)) b!194988))

(declare-fun m!222289 () Bool)

(assert (=> d!57127 m!222289))

(declare-fun m!222291 () Bool)

(assert (=> d!57127 m!222291))

(declare-fun m!222293 () Bool)

(assert (=> b!194988 m!222293))

(assert (=> b!194438 d!57127))

(declare-fun d!57129 () Bool)

(assert (=> d!57129 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7776 () Bool)

(assert (= bs!7776 d!57129))

(assert (=> bs!7776 m!221525))

(declare-fun m!222295 () Bool)

(assert (=> bs!7776 m!222295))

(assert (=> b!194587 d!57129))

(declare-fun b!194990 () Bool)

(declare-fun e!128247 () Option!251)

(declare-fun e!128248 () Option!251)

(assert (=> b!194990 (= e!128247 e!128248)))

(declare-fun c!35261 () Bool)

(assert (=> b!194990 (= c!35261 (and ((_ is Cons!2445) (toList!1254 lt!96845)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96845))) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!194989 () Bool)

(assert (=> b!194989 (= e!128247 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96845)))))))

(declare-fun b!194991 () Bool)

(assert (=> b!194991 (= e!128248 (getValueByKey!245 (t!7375 (toList!1254 lt!96845)) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!57131 () Bool)

(declare-fun c!35260 () Bool)

(assert (=> d!57131 (= c!35260 (and ((_ is Cons!2445) (toList!1254 lt!96845)) (= (_1!1791 (h!3086 (toList!1254 lt!96845))) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!57131 (= (getValueByKey!245 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) e!128247)))

(declare-fun b!194992 () Bool)

(assert (=> b!194992 (= e!128248 None!249)))

(assert (= (and d!57131 c!35260) b!194989))

(assert (= (and d!57131 (not c!35260)) b!194990))

(assert (= (and b!194990 c!35261) b!194991))

(assert (= (and b!194990 (not c!35261)) b!194992))

(assert (=> b!194991 m!220877))

(declare-fun m!222297 () Bool)

(assert (=> b!194991 m!222297))

(assert (=> b!194587 d!57131))

(assert (=> d!56843 d!56675))

(declare-fun b!194994 () Bool)

(declare-fun e!128249 () Option!251)

(declare-fun e!128250 () Option!251)

(assert (=> b!194994 (= e!128249 e!128250)))

(declare-fun c!35263 () Bool)

(assert (=> b!194994 (= c!35263 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96729))) (not (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96729)))) (_1!1791 lt!96678)))))))

(declare-fun b!194993 () Bool)

(assert (=> b!194993 (= e!128249 (Some!250 (_2!1791 (h!3086 (t!7375 (toList!1254 lt!96729))))))))

(declare-fun b!194995 () Bool)

(assert (=> b!194995 (= e!128250 (getValueByKey!245 (t!7375 (t!7375 (toList!1254 lt!96729))) (_1!1791 lt!96678)))))

(declare-fun d!57133 () Bool)

(declare-fun c!35262 () Bool)

(assert (=> d!57133 (= c!35262 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96729))) (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96729)))) (_1!1791 lt!96678))))))

(assert (=> d!57133 (= (getValueByKey!245 (t!7375 (toList!1254 lt!96729)) (_1!1791 lt!96678)) e!128249)))

(declare-fun b!194996 () Bool)

(assert (=> b!194996 (= e!128250 None!249)))

(assert (= (and d!57133 c!35262) b!194993))

(assert (= (and d!57133 (not c!35262)) b!194994))

(assert (= (and b!194994 c!35263) b!194995))

(assert (= (and b!194994 (not c!35263)) b!194996))

(declare-fun m!222299 () Bool)

(assert (=> b!194995 m!222299))

(assert (=> b!194462 d!57133))

(assert (=> d!56805 d!56807))

(assert (=> d!56805 d!56809))

(declare-fun d!57135 () Bool)

(assert (=> d!57135 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96676) key!828))))

(assert (=> d!57135 true))

(declare-fun _$12!450 () Unit!5878)

(assert (=> d!57135 (= (choose!1067 (toList!1254 lt!96676) key!828) _$12!450)))

(declare-fun bs!7777 () Bool)

(assert (= bs!7777 d!57135))

(assert (=> bs!7777 m!220953))

(assert (=> bs!7777 m!220953))

(assert (=> bs!7777 m!220955))

(assert (=> d!56805 d!57135))

(declare-fun d!57137 () Bool)

(declare-fun res!92101 () Bool)

(declare-fun e!128251 () Bool)

(assert (=> d!57137 (=> res!92101 e!128251)))

(assert (=> d!57137 (= res!92101 (or ((_ is Nil!2446) (toList!1254 lt!96676)) ((_ is Nil!2446) (t!7375 (toList!1254 lt!96676)))))))

(assert (=> d!57137 (= (isStrictlySorted!357 (toList!1254 lt!96676)) e!128251)))

(declare-fun b!194997 () Bool)

(declare-fun e!128252 () Bool)

(assert (=> b!194997 (= e!128251 e!128252)))

(declare-fun res!92102 () Bool)

(assert (=> b!194997 (=> (not res!92102) (not e!128252))))

(assert (=> b!194997 (= res!92102 (bvslt (_1!1791 (h!3086 (toList!1254 lt!96676))) (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96676))))))))

(declare-fun b!194998 () Bool)

(assert (=> b!194998 (= e!128252 (isStrictlySorted!357 (t!7375 (toList!1254 lt!96676))))))

(assert (= (and d!57137 (not res!92101)) b!194997))

(assert (= (and b!194997 res!92102) b!194998))

(declare-fun m!222301 () Bool)

(assert (=> b!194998 m!222301))

(assert (=> d!56805 d!57137))

(declare-fun d!57139 () Bool)

(assert (=> d!57139 (arrayContainsKey!0 (_keys!5954 thiss!1248) lt!96882 #b00000000000000000000000000000000)))

(declare-fun lt!97264 () Unit!5878)

(assert (=> d!57139 (= lt!97264 (choose!13 (_keys!5954 thiss!1248) lt!96882 #b00000000000000000000000000000000))))

(assert (=> d!57139 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!57139 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5954 thiss!1248) lt!96882 #b00000000000000000000000000000000) lt!97264)))

(declare-fun bs!7778 () Bool)

(assert (= bs!7778 d!57139))

(assert (=> bs!7778 m!221049))

(declare-fun m!222303 () Bool)

(assert (=> bs!7778 m!222303))

(assert (=> b!194238 d!57139))

(declare-fun d!57141 () Bool)

(declare-fun res!92103 () Bool)

(declare-fun e!128253 () Bool)

(assert (=> d!57141 (=> res!92103 e!128253)))

(assert (=> d!57141 (= res!92103 (= (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) lt!96882))))

(assert (=> d!57141 (= (arrayContainsKey!0 (_keys!5954 thiss!1248) lt!96882 #b00000000000000000000000000000000) e!128253)))

(declare-fun b!194999 () Bool)

(declare-fun e!128254 () Bool)

(assert (=> b!194999 (= e!128253 e!128254)))

(declare-fun res!92104 () Bool)

(assert (=> b!194999 (=> (not res!92104) (not e!128254))))

(assert (=> b!194999 (= res!92104 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!195000 () Bool)

(assert (=> b!195000 (= e!128254 (arrayContainsKey!0 (_keys!5954 thiss!1248) lt!96882 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!57141 (not res!92103)) b!194999))

(assert (= (and b!194999 res!92104) b!195000))

(assert (=> d!57141 m!220877))

(declare-fun m!222305 () Bool)

(assert (=> b!195000 m!222305))

(assert (=> b!194238 d!57141))

(declare-fun b!195001 () Bool)

(declare-fun e!128256 () SeekEntryResult!694)

(declare-fun e!128255 () SeekEntryResult!694)

(assert (=> b!195001 (= e!128256 e!128255)))

(declare-fun lt!97266 () (_ BitVec 64))

(declare-fun lt!97265 () SeekEntryResult!694)

(assert (=> b!195001 (= lt!97266 (select (arr!3875 (_keys!5954 thiss!1248)) (index!4948 lt!97265)))))

(declare-fun c!35264 () Bool)

(assert (=> b!195001 (= c!35264 (= lt!97266 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!195002 () Bool)

(declare-fun e!128257 () SeekEntryResult!694)

(assert (=> b!195002 (= e!128257 (seekKeyOrZeroReturnVacant!0 (x!20690 lt!97265) (index!4948 lt!97265) (index!4948 lt!97265) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun b!195003 () Bool)

(declare-fun c!35265 () Bool)

(assert (=> b!195003 (= c!35265 (= lt!97266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195003 (= e!128255 e!128257)))

(declare-fun b!195004 () Bool)

(assert (=> b!195004 (= e!128256 Undefined!694)))

(declare-fun d!57143 () Bool)

(declare-fun lt!97267 () SeekEntryResult!694)

(assert (=> d!57143 (and (or ((_ is Undefined!694) lt!97267) (not ((_ is Found!694) lt!97267)) (and (bvsge (index!4947 lt!97267) #b00000000000000000000000000000000) (bvslt (index!4947 lt!97267) (size!4199 (_keys!5954 thiss!1248))))) (or ((_ is Undefined!694) lt!97267) ((_ is Found!694) lt!97267) (not ((_ is MissingZero!694) lt!97267)) (and (bvsge (index!4946 lt!97267) #b00000000000000000000000000000000) (bvslt (index!4946 lt!97267) (size!4199 (_keys!5954 thiss!1248))))) (or ((_ is Undefined!694) lt!97267) ((_ is Found!694) lt!97267) ((_ is MissingZero!694) lt!97267) (not ((_ is MissingVacant!694) lt!97267)) (and (bvsge (index!4949 lt!97267) #b00000000000000000000000000000000) (bvslt (index!4949 lt!97267) (size!4199 (_keys!5954 thiss!1248))))) (or ((_ is Undefined!694) lt!97267) (ite ((_ is Found!694) lt!97267) (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!97267)) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!694) lt!97267) (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4946 lt!97267)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!694) lt!97267) (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4949 lt!97267)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57143 (= lt!97267 e!128256)))

(declare-fun c!35266 () Bool)

(assert (=> d!57143 (= c!35266 (and ((_ is Intermediate!694) lt!97265) (undefined!1506 lt!97265)))))

(assert (=> d!57143 (= lt!97265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (mask!9223 thiss!1248)) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(assert (=> d!57143 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!57143 (= (seekEntryOrOpen!0 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (_keys!5954 thiss!1248) (mask!9223 thiss!1248)) lt!97267)))

(declare-fun b!195005 () Bool)

(assert (=> b!195005 (= e!128255 (Found!694 (index!4948 lt!97265)))))

(declare-fun b!195006 () Bool)

(assert (=> b!195006 (= e!128257 (MissingZero!694 (index!4948 lt!97265)))))

(assert (= (and d!57143 c!35266) b!195004))

(assert (= (and d!57143 (not c!35266)) b!195001))

(assert (= (and b!195001 c!35264) b!195005))

(assert (= (and b!195001 (not c!35264)) b!195003))

(assert (= (and b!195003 c!35265) b!195006))

(assert (= (and b!195003 (not c!35265)) b!195002))

(declare-fun m!222307 () Bool)

(assert (=> b!195001 m!222307))

(assert (=> b!195002 m!220877))

(declare-fun m!222309 () Bool)

(assert (=> b!195002 m!222309))

(declare-fun m!222311 () Bool)

(assert (=> d!57143 m!222311))

(declare-fun m!222313 () Bool)

(assert (=> d!57143 m!222313))

(assert (=> d!57143 m!220877))

(declare-fun m!222315 () Bool)

(assert (=> d!57143 m!222315))

(assert (=> d!57143 m!220855))

(declare-fun m!222317 () Bool)

(assert (=> d!57143 m!222317))

(declare-fun m!222319 () Bool)

(assert (=> d!57143 m!222319))

(assert (=> d!57143 m!220877))

(assert (=> d!57143 m!222313))

(assert (=> b!194238 d!57143))

(assert (=> b!194588 d!57043))

(declare-fun d!57145 () Bool)

(assert (=> d!57145 (= (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) lt!96798)) (v!4256 (getValueByKey!245 (toList!1254 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) lt!96798)))))

(assert (=> d!56785 d!57145))

(declare-fun b!195008 () Bool)

(declare-fun e!128258 () Option!251)

(declare-fun e!128259 () Option!251)

(assert (=> b!195008 (= e!128258 e!128259)))

(declare-fun c!35268 () Bool)

(assert (=> b!195008 (= c!35268 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))) (not (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))) lt!96798))))))

(declare-fun b!195007 () Bool)

(assert (=> b!195007 (= e!128258 (Some!250 (_2!1791 (h!3086 (toList!1254 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))))))

(declare-fun b!195009 () Bool)

(assert (=> b!195009 (= e!128259 (getValueByKey!245 (t!7375 (toList!1254 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))) lt!96798))))

(declare-fun d!57147 () Bool)

(declare-fun c!35267 () Bool)

(assert (=> d!57147 (= c!35267 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))) (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))) lt!96798)))))

(assert (=> d!57147 (= (getValueByKey!245 (toList!1254 (+!322 lt!96816 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) lt!96798) e!128258)))

(declare-fun b!195010 () Bool)

(assert (=> b!195010 (= e!128259 None!249)))

(assert (= (and d!57147 c!35267) b!195007))

(assert (= (and d!57147 (not c!35267)) b!195008))

(assert (= (and b!195008 c!35268) b!195009))

(assert (= (and b!195008 (not c!35268)) b!195010))

(declare-fun m!222321 () Bool)

(assert (=> b!195009 m!222321))

(assert (=> d!56785 d!57147))

(assert (=> d!56761 d!56767))

(assert (=> d!56761 d!56781))

(declare-fun d!57149 () Bool)

(assert (=> d!57149 (contains!1379 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) lt!96795)))

(assert (=> d!57149 true))

(declare-fun _$35!417 () Unit!5878)

(assert (=> d!57149 (= (choose!1070 lt!96799 lt!96815 (zeroValue!3801 thiss!1248) lt!96795) _$35!417)))

(declare-fun bs!7779 () Bool)

(assert (= bs!7779 d!57149))

(assert (=> bs!7779 m!220893))

(assert (=> bs!7779 m!220893))

(assert (=> bs!7779 m!220895))

(assert (=> d!56761 d!57149))

(declare-fun d!57151 () Bool)

(declare-fun e!128261 () Bool)

(assert (=> d!57151 e!128261))

(declare-fun res!92105 () Bool)

(assert (=> d!57151 (=> res!92105 e!128261)))

(declare-fun lt!97268 () Bool)

(assert (=> d!57151 (= res!92105 (not lt!97268))))

(declare-fun lt!97269 () Bool)

(assert (=> d!57151 (= lt!97268 lt!97269)))

(declare-fun lt!97270 () Unit!5878)

(declare-fun e!128260 () Unit!5878)

(assert (=> d!57151 (= lt!97270 e!128260)))

(declare-fun c!35269 () Bool)

(assert (=> d!57151 (= c!35269 lt!97269)))

(assert (=> d!57151 (= lt!97269 (containsKey!249 (toList!1254 lt!96799) lt!96795))))

(assert (=> d!57151 (= (contains!1379 lt!96799 lt!96795) lt!97268)))

(declare-fun b!195011 () Bool)

(declare-fun lt!97271 () Unit!5878)

(assert (=> b!195011 (= e!128260 lt!97271)))

(assert (=> b!195011 (= lt!97271 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96799) lt!96795))))

(assert (=> b!195011 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96799) lt!96795))))

(declare-fun b!195012 () Bool)

(declare-fun Unit!5917 () Unit!5878)

(assert (=> b!195012 (= e!128260 Unit!5917)))

(declare-fun b!195013 () Bool)

(assert (=> b!195013 (= e!128261 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96799) lt!96795)))))

(assert (= (and d!57151 c!35269) b!195011))

(assert (= (and d!57151 (not c!35269)) b!195012))

(assert (= (and d!57151 (not res!92105)) b!195013))

(declare-fun m!222323 () Bool)

(assert (=> d!57151 m!222323))

(declare-fun m!222325 () Bool)

(assert (=> b!195011 m!222325))

(declare-fun m!222327 () Bool)

(assert (=> b!195011 m!222327))

(assert (=> b!195011 m!222327))

(declare-fun m!222329 () Bool)

(assert (=> b!195011 m!222329))

(assert (=> b!195013 m!222327))

(assert (=> b!195013 m!222327))

(assert (=> b!195013 m!222329))

(assert (=> d!56761 d!57151))

(declare-fun d!57153 () Bool)

(declare-fun e!128263 () Bool)

(assert (=> d!57153 e!128263))

(declare-fun res!92106 () Bool)

(assert (=> d!57153 (=> res!92106 e!128263)))

(declare-fun lt!97272 () Bool)

(assert (=> d!57153 (= res!92106 (not lt!97272))))

(declare-fun lt!97273 () Bool)

(assert (=> d!57153 (= lt!97272 lt!97273)))

(declare-fun lt!97274 () Unit!5878)

(declare-fun e!128262 () Unit!5878)

(assert (=> d!57153 (= lt!97274 e!128262)))

(declare-fun c!35270 () Bool)

(assert (=> d!57153 (= c!35270 lt!97273)))

(assert (=> d!57153 (= lt!97273 (containsKey!249 (toList!1254 lt!97031) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57153 (= (contains!1379 lt!97031 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97272)))

(declare-fun b!195014 () Bool)

(declare-fun lt!97275 () Unit!5878)

(assert (=> b!195014 (= e!128262 lt!97275)))

(assert (=> b!195014 (= lt!97275 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97031) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195014 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97031) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195015 () Bool)

(declare-fun Unit!5918 () Unit!5878)

(assert (=> b!195015 (= e!128262 Unit!5918)))

(declare-fun b!195016 () Bool)

(assert (=> b!195016 (= e!128263 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97031) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57153 c!35270) b!195014))

(assert (= (and d!57153 (not c!35270)) b!195015))

(assert (= (and d!57153 (not res!92106)) b!195016))

(declare-fun m!222331 () Bool)

(assert (=> d!57153 m!222331))

(declare-fun m!222333 () Bool)

(assert (=> b!195014 m!222333))

(declare-fun m!222335 () Bool)

(assert (=> b!195014 m!222335))

(assert (=> b!195014 m!222335))

(declare-fun m!222337 () Bool)

(assert (=> b!195014 m!222337))

(assert (=> b!195016 m!222335))

(assert (=> b!195016 m!222335))

(assert (=> b!195016 m!222337))

(assert (=> d!56791 d!57153))

(assert (=> d!56791 d!56689))

(declare-fun d!57155 () Bool)

(assert (=> d!57155 (isDefined!198 (getValueByKey!245 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(declare-fun lt!97276 () Unit!5878)

(assert (=> d!57155 (= lt!97276 (choose!1067 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(declare-fun e!128264 () Bool)

(assert (=> d!57155 e!128264))

(declare-fun res!92107 () Bool)

(assert (=> d!57155 (=> (not res!92107) (not e!128264))))

(assert (=> d!57155 (= res!92107 (isStrictlySorted!357 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))))))

(assert (=> d!57155 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) lt!97276)))

(declare-fun b!195017 () Bool)

(assert (=> b!195017 (= e!128264 (containsKey!249 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (= (and d!57155 res!92107) b!195017))

(assert (=> d!57155 m!220759))

(assert (=> d!57155 m!221043))

(assert (=> d!57155 m!221043))

(assert (=> d!57155 m!221045))

(assert (=> d!57155 m!220759))

(declare-fun m!222339 () Bool)

(assert (=> d!57155 m!222339))

(declare-fun m!222341 () Bool)

(assert (=> d!57155 m!222341))

(assert (=> b!195017 m!220759))

(assert (=> b!195017 m!221039))

(assert (=> b!194225 d!57155))

(assert (=> b!194225 d!57003))

(assert (=> b!194225 d!57005))

(declare-fun d!57157 () Bool)

(assert (=> d!57157 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))) (v!4256 (getValueByKey!245 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!56829 d!57157))

(assert (=> d!56829 d!57131))

(declare-fun d!57159 () Bool)

(declare-fun e!128265 () Bool)

(assert (=> d!57159 e!128265))

(declare-fun res!92108 () Bool)

(assert (=> d!57159 (=> (not res!92108) (not e!128265))))

(declare-fun lt!97277 () ListLongMap!2477)

(assert (=> d!57159 (= res!92108 (contains!1379 lt!97277 (_1!1791 (tuple2!3561 lt!97027 lt!97026))))))

(declare-fun lt!97280 () List!2449)

(assert (=> d!57159 (= lt!97277 (ListLongMap!2478 lt!97280))))

(declare-fun lt!97278 () Unit!5878)

(declare-fun lt!97279 () Unit!5878)

(assert (=> d!57159 (= lt!97278 lt!97279)))

(assert (=> d!57159 (= (getValueByKey!245 lt!97280 (_1!1791 (tuple2!3561 lt!97027 lt!97026))) (Some!250 (_2!1791 (tuple2!3561 lt!97027 lt!97026))))))

(assert (=> d!57159 (= lt!97279 (lemmaContainsTupThenGetReturnValue!132 lt!97280 (_1!1791 (tuple2!3561 lt!97027 lt!97026)) (_2!1791 (tuple2!3561 lt!97027 lt!97026))))))

(assert (=> d!57159 (= lt!97280 (insertStrictlySorted!135 (toList!1254 lt!97030) (_1!1791 (tuple2!3561 lt!97027 lt!97026)) (_2!1791 (tuple2!3561 lt!97027 lt!97026))))))

(assert (=> d!57159 (= (+!322 lt!97030 (tuple2!3561 lt!97027 lt!97026)) lt!97277)))

(declare-fun b!195018 () Bool)

(declare-fun res!92109 () Bool)

(assert (=> b!195018 (=> (not res!92109) (not e!128265))))

(assert (=> b!195018 (= res!92109 (= (getValueByKey!245 (toList!1254 lt!97277) (_1!1791 (tuple2!3561 lt!97027 lt!97026))) (Some!250 (_2!1791 (tuple2!3561 lt!97027 lt!97026)))))))

(declare-fun b!195019 () Bool)

(assert (=> b!195019 (= e!128265 (contains!1381 (toList!1254 lt!97277) (tuple2!3561 lt!97027 lt!97026)))))

(assert (= (and d!57159 res!92108) b!195018))

(assert (= (and b!195018 res!92109) b!195019))

(declare-fun m!222343 () Bool)

(assert (=> d!57159 m!222343))

(declare-fun m!222345 () Bool)

(assert (=> d!57159 m!222345))

(declare-fun m!222347 () Bool)

(assert (=> d!57159 m!222347))

(declare-fun m!222349 () Bool)

(assert (=> d!57159 m!222349))

(declare-fun m!222351 () Bool)

(assert (=> b!195018 m!222351))

(declare-fun m!222353 () Bool)

(assert (=> b!195019 m!222353))

(assert (=> b!194445 d!57159))

(assert (=> b!194445 d!56839))

(declare-fun d!57161 () Bool)

(declare-fun e!128266 () Bool)

(assert (=> d!57161 e!128266))

(declare-fun res!92110 () Bool)

(assert (=> d!57161 (=> (not res!92110) (not e!128266))))

(declare-fun lt!97281 () ListLongMap!2477)

(assert (=> d!57161 (= res!92110 (contains!1379 lt!97281 (_1!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!97284 () List!2449)

(assert (=> d!57161 (= lt!97281 (ListLongMap!2478 lt!97284))))

(declare-fun lt!97282 () Unit!5878)

(declare-fun lt!97283 () Unit!5878)

(assert (=> d!57161 (= lt!97282 lt!97283)))

(assert (=> d!57161 (= (getValueByKey!245 lt!97284 (_1!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!250 (_2!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57161 (= lt!97283 (lemmaContainsTupThenGetReturnValue!132 lt!97284 (_1!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57161 (= lt!97284 (insertStrictlySorted!135 (toList!1254 call!19666) (_1!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57161 (= (+!322 call!19666 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!97281)))

(declare-fun b!195020 () Bool)

(declare-fun res!92111 () Bool)

(assert (=> b!195020 (=> (not res!92111) (not e!128266))))

(assert (=> b!195020 (= res!92111 (= (getValueByKey!245 (toList!1254 lt!97281) (_1!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!250 (_2!1791 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!195021 () Bool)

(assert (=> b!195021 (= e!128266 (contains!1381 (toList!1254 lt!97281) (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!57161 res!92110) b!195020))

(assert (= (and b!195020 res!92111) b!195021))

(declare-fun m!222355 () Bool)

(assert (=> d!57161 m!222355))

(declare-fun m!222357 () Bool)

(assert (=> d!57161 m!222357))

(declare-fun m!222359 () Bool)

(assert (=> d!57161 m!222359))

(declare-fun m!222361 () Bool)

(assert (=> d!57161 m!222361))

(declare-fun m!222363 () Bool)

(assert (=> b!195020 m!222363))

(declare-fun m!222365 () Bool)

(assert (=> b!195021 m!222365))

(assert (=> b!194445 d!57161))

(declare-fun d!57163 () Bool)

(assert (=> d!57163 (not (contains!1379 (+!322 lt!97030 (tuple2!3561 lt!97027 lt!97026)) lt!97025))))

(declare-fun lt!97285 () Unit!5878)

(assert (=> d!57163 (= lt!97285 (choose!1071 lt!97030 lt!97027 lt!97026 lt!97025))))

(declare-fun e!128267 () Bool)

(assert (=> d!57163 e!128267))

(declare-fun res!92112 () Bool)

(assert (=> d!57163 (=> (not res!92112) (not e!128267))))

(assert (=> d!57163 (= res!92112 (not (contains!1379 lt!97030 lt!97025)))))

(assert (=> d!57163 (= (addStillNotContains!97 lt!97030 lt!97027 lt!97026 lt!97025) lt!97285)))

(declare-fun b!195022 () Bool)

(assert (=> b!195022 (= e!128267 (not (= lt!97027 lt!97025)))))

(assert (= (and d!57163 res!92112) b!195022))

(assert (=> d!57163 m!221433))

(assert (=> d!57163 m!221433))

(assert (=> d!57163 m!221435))

(declare-fun m!222367 () Bool)

(assert (=> d!57163 m!222367))

(declare-fun m!222369 () Bool)

(assert (=> d!57163 m!222369))

(assert (=> b!194445 d!57163))

(declare-fun d!57165 () Bool)

(declare-fun e!128269 () Bool)

(assert (=> d!57165 e!128269))

(declare-fun res!92113 () Bool)

(assert (=> d!57165 (=> res!92113 e!128269)))

(declare-fun lt!97286 () Bool)

(assert (=> d!57165 (= res!92113 (not lt!97286))))

(declare-fun lt!97287 () Bool)

(assert (=> d!57165 (= lt!97286 lt!97287)))

(declare-fun lt!97288 () Unit!5878)

(declare-fun e!128268 () Unit!5878)

(assert (=> d!57165 (= lt!97288 e!128268)))

(declare-fun c!35271 () Bool)

(assert (=> d!57165 (= c!35271 lt!97287)))

(assert (=> d!57165 (= lt!97287 (containsKey!249 (toList!1254 (+!322 lt!97030 (tuple2!3561 lt!97027 lt!97026))) lt!97025))))

(assert (=> d!57165 (= (contains!1379 (+!322 lt!97030 (tuple2!3561 lt!97027 lt!97026)) lt!97025) lt!97286)))

(declare-fun b!195023 () Bool)

(declare-fun lt!97289 () Unit!5878)

(assert (=> b!195023 (= e!128268 lt!97289)))

(assert (=> b!195023 (= lt!97289 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 (+!322 lt!97030 (tuple2!3561 lt!97027 lt!97026))) lt!97025))))

(assert (=> b!195023 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!97030 (tuple2!3561 lt!97027 lt!97026))) lt!97025))))

(declare-fun b!195024 () Bool)

(declare-fun Unit!5919 () Unit!5878)

(assert (=> b!195024 (= e!128268 Unit!5919)))

(declare-fun b!195025 () Bool)

(assert (=> b!195025 (= e!128269 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!97030 (tuple2!3561 lt!97027 lt!97026))) lt!97025)))))

(assert (= (and d!57165 c!35271) b!195023))

(assert (= (and d!57165 (not c!35271)) b!195024))

(assert (= (and d!57165 (not res!92113)) b!195025))

(declare-fun m!222371 () Bool)

(assert (=> d!57165 m!222371))

(declare-fun m!222373 () Bool)

(assert (=> b!195023 m!222373))

(declare-fun m!222375 () Bool)

(assert (=> b!195023 m!222375))

(assert (=> b!195023 m!222375))

(declare-fun m!222377 () Bool)

(assert (=> b!195023 m!222377))

(assert (=> b!195025 m!222375))

(assert (=> b!195025 m!222375))

(assert (=> b!195025 m!222377))

(assert (=> b!194445 d!57165))

(declare-fun d!57167 () Bool)

(assert (=> d!57167 (= (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))) (not ((_ is Some!250) (getValueByKey!245 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))))

(assert (=> d!56757 d!57167))

(declare-fun d!57169 () Bool)

(declare-fun lt!97290 () Bool)

(assert (=> d!57169 (= lt!97290 (select (content!155 lt!96732) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun e!128271 () Bool)

(assert (=> d!57169 (= lt!97290 e!128271)))

(declare-fun res!92114 () Bool)

(assert (=> d!57169 (=> (not res!92114) (not e!128271))))

(assert (=> d!57169 (= res!92114 ((_ is Cons!2445) lt!96732))))

(assert (=> d!57169 (= (contains!1381 lt!96732 (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))) lt!97290)))

(declare-fun b!195026 () Bool)

(declare-fun e!128270 () Bool)

(assert (=> b!195026 (= e!128271 e!128270)))

(declare-fun res!92115 () Bool)

(assert (=> b!195026 (=> res!92115 e!128270)))

(assert (=> b!195026 (= res!92115 (= (h!3086 lt!96732) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun b!195027 () Bool)

(assert (=> b!195027 (= e!128270 (contains!1381 (t!7375 lt!96732) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(assert (= (and d!57169 res!92114) b!195026))

(assert (= (and b!195026 (not res!92115)) b!195027))

(declare-fun m!222379 () Bool)

(assert (=> d!57169 m!222379))

(declare-fun m!222381 () Bool)

(assert (=> d!57169 m!222381))

(declare-fun m!222383 () Bool)

(assert (=> b!195027 m!222383))

(assert (=> b!194323 d!57169))

(declare-fun d!57171 () Bool)

(declare-fun e!128273 () Bool)

(assert (=> d!57171 e!128273))

(declare-fun res!92116 () Bool)

(assert (=> d!57171 (=> res!92116 e!128273)))

(declare-fun lt!97291 () Bool)

(assert (=> d!57171 (= res!92116 (not lt!97291))))

(declare-fun lt!97292 () Bool)

(assert (=> d!57171 (= lt!97291 lt!97292)))

(declare-fun lt!97293 () Unit!5878)

(declare-fun e!128272 () Unit!5878)

(assert (=> d!57171 (= lt!97293 e!128272)))

(declare-fun c!35272 () Bool)

(assert (=> d!57171 (= c!35272 lt!97292)))

(assert (=> d!57171 (= lt!97292 (containsKey!249 (toList!1254 lt!96811) lt!96797))))

(assert (=> d!57171 (= (contains!1379 lt!96811 lt!96797) lt!97291)))

(declare-fun b!195028 () Bool)

(declare-fun lt!97294 () Unit!5878)

(assert (=> b!195028 (= e!128272 lt!97294)))

(assert (=> b!195028 (= lt!97294 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96811) lt!96797))))

(assert (=> b!195028 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96811) lt!96797))))

(declare-fun b!195029 () Bool)

(declare-fun Unit!5920 () Unit!5878)

(assert (=> b!195029 (= e!128272 Unit!5920)))

(declare-fun b!195030 () Bool)

(assert (=> b!195030 (= e!128273 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96811) lt!96797)))))

(assert (= (and d!57171 c!35272) b!195028))

(assert (= (and d!57171 (not c!35272)) b!195029))

(assert (= (and d!57171 (not res!92116)) b!195030))

(declare-fun m!222385 () Bool)

(assert (=> d!57171 m!222385))

(declare-fun m!222387 () Bool)

(assert (=> b!195028 m!222387))

(assert (=> b!195028 m!221387))

(assert (=> b!195028 m!221387))

(declare-fun m!222389 () Bool)

(assert (=> b!195028 m!222389))

(assert (=> b!195030 m!221387))

(assert (=> b!195030 m!221387))

(assert (=> b!195030 m!222389))

(assert (=> d!56787 d!57171))

(assert (=> d!56787 d!56789))

(declare-fun d!57173 () Bool)

(assert (=> d!57173 (= (apply!188 (+!322 lt!96811 (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) lt!96797) (apply!188 lt!96811 lt!96797))))

(assert (=> d!57173 true))

(declare-fun _$34!1092 () Unit!5878)

(assert (=> d!57173 (= (choose!1069 lt!96811 lt!96802 (zeroValue!3801 thiss!1248) lt!96797) _$34!1092)))

(declare-fun bs!7780 () Bool)

(assert (= bs!7780 d!57173))

(assert (=> bs!7780 m!220905))

(assert (=> bs!7780 m!220905))

(assert (=> bs!7780 m!220907))

(assert (=> bs!7780 m!220911))

(assert (=> d!56787 d!57173))

(assert (=> d!56787 d!56779))

(assert (=> d!56787 d!56783))

(declare-fun d!57175 () Bool)

(assert (=> d!57175 (= (apply!188 lt!97086 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)) (get!2238 (getValueByKey!245 (toList!1254 lt!97086) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000))))))

(declare-fun bs!7781 () Bool)

(assert (= bs!7781 d!57175))

(assert (=> bs!7781 m!221447))

(declare-fun m!222391 () Bool)

(assert (=> bs!7781 m!222391))

(assert (=> bs!7781 m!222391))

(declare-fun m!222393 () Bool)

(assert (=> bs!7781 m!222393))

(assert (=> b!194594 d!57175))

(declare-fun d!57177 () Bool)

(declare-fun c!35273 () Bool)

(assert (=> d!57177 (= c!35273 ((_ is ValueCellFull!1902) (select (arr!3876 (_values!3943 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun e!128274 () V!5635)

(assert (=> d!57177 (= (get!2237 (select (arr!3876 (_values!3943 lt!96671)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 lt!96671) #b0000000000000000000000000000000000000000000000000000000000000000)) e!128274)))

(declare-fun b!195031 () Bool)

(assert (=> b!195031 (= e!128274 (get!2239 (select (arr!3876 (_values!3943 lt!96671)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 lt!96671) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195032 () Bool)

(assert (=> b!195032 (= e!128274 (get!2240 (select (arr!3876 (_values!3943 lt!96671)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 lt!96671) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57177 c!35273) b!195031))

(assert (= (and d!57177 (not c!35273)) b!195032))

(assert (=> b!195031 m!221593))

(assert (=> b!195031 m!221589))

(declare-fun m!222395 () Bool)

(assert (=> b!195031 m!222395))

(assert (=> b!195032 m!221593))

(assert (=> b!195032 m!221589))

(declare-fun m!222397 () Bool)

(assert (=> b!195032 m!222397))

(assert (=> b!194594 d!57177))

(declare-fun d!57179 () Bool)

(declare-fun e!128276 () Bool)

(assert (=> d!57179 e!128276))

(declare-fun res!92117 () Bool)

(assert (=> d!57179 (=> res!92117 e!128276)))

(declare-fun lt!97295 () Bool)

(assert (=> d!57179 (= res!92117 (not lt!97295))))

(declare-fun lt!97296 () Bool)

(assert (=> d!57179 (= lt!97295 lt!97296)))

(declare-fun lt!97297 () Unit!5878)

(declare-fun e!128275 () Unit!5878)

(assert (=> d!57179 (= lt!97297 e!128275)))

(declare-fun c!35274 () Bool)

(assert (=> d!57179 (= c!35274 lt!97296)))

(assert (=> d!57179 (= lt!97296 (containsKey!249 (toList!1254 lt!96980) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!57179 (= (contains!1379 lt!96980 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!97295)))

(declare-fun b!195033 () Bool)

(declare-fun lt!97298 () Unit!5878)

(assert (=> b!195033 (= e!128275 lt!97298)))

(assert (=> b!195033 (= lt!97298 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96980) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(assert (=> b!195033 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96980) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!195034 () Bool)

(declare-fun Unit!5921 () Unit!5878)

(assert (=> b!195034 (= e!128275 Unit!5921)))

(declare-fun b!195035 () Bool)

(assert (=> b!195035 (= e!128276 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96980) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))

(assert (= (and d!57179 c!35274) b!195033))

(assert (= (and d!57179 (not c!35274)) b!195034))

(assert (= (and d!57179 (not res!92117)) b!195035))

(declare-fun m!222399 () Bool)

(assert (=> d!57179 m!222399))

(declare-fun m!222401 () Bool)

(assert (=> b!195033 m!222401))

(assert (=> b!195033 m!221283))

(assert (=> b!195033 m!221283))

(declare-fun m!222403 () Bool)

(assert (=> b!195033 m!222403))

(assert (=> b!195035 m!221283))

(assert (=> b!195035 m!221283))

(assert (=> b!195035 m!222403))

(assert (=> d!56741 d!57179))

(declare-fun b!195037 () Bool)

(declare-fun e!128277 () Option!251)

(declare-fun e!128278 () Option!251)

(assert (=> b!195037 (= e!128277 e!128278)))

(declare-fun c!35276 () Bool)

(assert (=> b!195037 (= c!35276 (and ((_ is Cons!2445) lt!96983) (not (= (_1!1791 (h!3086 lt!96983)) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))))

(declare-fun b!195036 () Bool)

(assert (=> b!195036 (= e!128277 (Some!250 (_2!1791 (h!3086 lt!96983))))))

(declare-fun b!195038 () Bool)

(assert (=> b!195038 (= e!128278 (getValueByKey!245 (t!7375 lt!96983) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(declare-fun d!57181 () Bool)

(declare-fun c!35275 () Bool)

(assert (=> d!57181 (= c!35275 (and ((_ is Cons!2445) lt!96983) (= (_1!1791 (h!3086 lt!96983)) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57181 (= (getValueByKey!245 lt!96983 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) e!128277)))

(declare-fun b!195039 () Bool)

(assert (=> b!195039 (= e!128278 None!249)))

(assert (= (and d!57181 c!35275) b!195036))

(assert (= (and d!57181 (not c!35275)) b!195037))

(assert (= (and b!195037 c!35276) b!195038))

(assert (= (and b!195037 (not c!35276)) b!195039))

(declare-fun m!222405 () Bool)

(assert (=> b!195038 m!222405))

(assert (=> d!56741 d!57181))

(declare-fun d!57183 () Bool)

(assert (=> d!57183 (= (getValueByKey!245 lt!96983 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(declare-fun lt!97299 () Unit!5878)

(assert (=> d!57183 (= lt!97299 (choose!1068 lt!96983 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(declare-fun e!128279 () Bool)

(assert (=> d!57183 e!128279))

(declare-fun res!92118 () Bool)

(assert (=> d!57183 (=> (not res!92118) (not e!128279))))

(assert (=> d!57183 (= res!92118 (isStrictlySorted!357 lt!96983))))

(assert (=> d!57183 (= (lemmaContainsTupThenGetReturnValue!132 lt!96983 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!97299)))

(declare-fun b!195040 () Bool)

(declare-fun res!92119 () Bool)

(assert (=> b!195040 (=> (not res!92119) (not e!128279))))

(assert (=> b!195040 (= res!92119 (containsKey!249 lt!96983 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!195041 () Bool)

(assert (=> b!195041 (= e!128279 (contains!1381 lt!96983 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))

(assert (= (and d!57183 res!92118) b!195040))

(assert (= (and b!195040 res!92119) b!195041))

(assert (=> d!57183 m!221277))

(declare-fun m!222407 () Bool)

(assert (=> d!57183 m!222407))

(declare-fun m!222409 () Bool)

(assert (=> d!57183 m!222409))

(declare-fun m!222411 () Bool)

(assert (=> b!195040 m!222411))

(declare-fun m!222413 () Bool)

(assert (=> b!195041 m!222413))

(assert (=> d!56741 d!57183))

(declare-fun call!19720 () List!2449)

(declare-fun e!128280 () List!2449)

(declare-fun c!35278 () Bool)

(declare-fun bm!19716 () Bool)

(assert (=> bm!19716 (= call!19720 ($colon$colon!103 e!128280 (ite c!35278 (h!3086 (toList!1254 lt!96836)) (tuple2!3561 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))))

(declare-fun c!35277 () Bool)

(assert (=> bm!19716 (= c!35277 c!35278)))

(declare-fun b!195042 () Bool)

(declare-fun e!128284 () List!2449)

(declare-fun call!19719 () List!2449)

(assert (=> b!195042 (= e!128284 call!19719)))

(declare-fun c!35279 () Bool)

(declare-fun b!195043 () Bool)

(assert (=> b!195043 (= c!35279 (and ((_ is Cons!2445) (toList!1254 lt!96836)) (bvsgt (_1!1791 (h!3086 (toList!1254 lt!96836))) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))

(declare-fun e!128282 () List!2449)

(assert (=> b!195043 (= e!128284 e!128282)))

(declare-fun e!128283 () Bool)

(declare-fun b!195044 () Bool)

(declare-fun lt!97300 () List!2449)

(assert (=> b!195044 (= e!128283 (contains!1381 lt!97300 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))

(declare-fun bm!19717 () Bool)

(declare-fun call!19721 () List!2449)

(assert (=> bm!19717 (= call!19721 call!19719)))

(declare-fun b!195045 () Bool)

(declare-fun e!128281 () List!2449)

(assert (=> b!195045 (= e!128281 e!128284)))

(declare-fun c!35280 () Bool)

(assert (=> b!195045 (= c!35280 (and ((_ is Cons!2445) (toList!1254 lt!96836)) (= (_1!1791 (h!3086 (toList!1254 lt!96836))) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))

(declare-fun d!57185 () Bool)

(assert (=> d!57185 e!128283))

(declare-fun res!92120 () Bool)

(assert (=> d!57185 (=> (not res!92120) (not e!128283))))

(assert (=> d!57185 (= res!92120 (isStrictlySorted!357 lt!97300))))

(assert (=> d!57185 (= lt!97300 e!128281)))

(assert (=> d!57185 (= c!35278 (and ((_ is Cons!2445) (toList!1254 lt!96836)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96836))) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57185 (isStrictlySorted!357 (toList!1254 lt!96836))))

(assert (=> d!57185 (= (insertStrictlySorted!135 (toList!1254 lt!96836) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!97300)))

(declare-fun bm!19718 () Bool)

(assert (=> bm!19718 (= call!19719 call!19720)))

(declare-fun b!195046 () Bool)

(assert (=> b!195046 (= e!128282 call!19721)))

(declare-fun b!195047 () Bool)

(assert (=> b!195047 (= e!128280 (insertStrictlySorted!135 (t!7375 (toList!1254 lt!96836)) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!195048 () Bool)

(assert (=> b!195048 (= e!128282 call!19721)))

(declare-fun b!195049 () Bool)

(declare-fun res!92121 () Bool)

(assert (=> b!195049 (=> (not res!92121) (not e!128283))))

(assert (=> b!195049 (= res!92121 (containsKey!249 lt!97300 (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!195050 () Bool)

(assert (=> b!195050 (= e!128281 call!19720)))

(declare-fun b!195051 () Bool)

(assert (=> b!195051 (= e!128280 (ite c!35280 (t!7375 (toList!1254 lt!96836)) (ite c!35279 (Cons!2445 (h!3086 (toList!1254 lt!96836)) (t!7375 (toList!1254 lt!96836))) Nil!2446)))))

(assert (= (and d!57185 c!35278) b!195050))

(assert (= (and d!57185 (not c!35278)) b!195045))

(assert (= (and b!195045 c!35280) b!195042))

(assert (= (and b!195045 (not c!35280)) b!195043))

(assert (= (and b!195043 c!35279) b!195048))

(assert (= (and b!195043 (not c!35279)) b!195046))

(assert (= (or b!195048 b!195046) bm!19717))

(assert (= (or b!195042 bm!19717) bm!19718))

(assert (= (or b!195050 bm!19718) bm!19716))

(assert (= (and bm!19716 c!35277) b!195047))

(assert (= (and bm!19716 (not c!35277)) b!195051))

(assert (= (and d!57185 res!92120) b!195049))

(assert (= (and b!195049 res!92121) b!195044))

(declare-fun m!222415 () Bool)

(assert (=> bm!19716 m!222415))

(declare-fun m!222417 () Bool)

(assert (=> b!195049 m!222417))

(declare-fun m!222419 () Bool)

(assert (=> b!195044 m!222419))

(declare-fun m!222421 () Bool)

(assert (=> b!195047 m!222421))

(declare-fun m!222423 () Bool)

(assert (=> d!57185 m!222423))

(declare-fun m!222425 () Bool)

(assert (=> d!57185 m!222425))

(assert (=> d!56741 d!57185))

(declare-fun d!57187 () Bool)

(declare-fun res!92122 () Bool)

(declare-fun e!128285 () Bool)

(assert (=> d!57187 (=> res!92122 e!128285)))

(assert (=> d!57187 (= res!92122 (or ((_ is Nil!2446) lt!97104) ((_ is Nil!2446) (t!7375 lt!97104))))))

(assert (=> d!57187 (= (isStrictlySorted!357 lt!97104) e!128285)))

(declare-fun b!195052 () Bool)

(declare-fun e!128286 () Bool)

(assert (=> b!195052 (= e!128285 e!128286)))

(declare-fun res!92123 () Bool)

(assert (=> b!195052 (=> (not res!92123) (not e!128286))))

(assert (=> b!195052 (= res!92123 (bvslt (_1!1791 (h!3086 lt!97104)) (_1!1791 (h!3086 (t!7375 lt!97104)))))))

(declare-fun b!195053 () Bool)

(assert (=> b!195053 (= e!128286 (isStrictlySorted!357 (t!7375 lt!97104)))))

(assert (= (and d!57187 (not res!92122)) b!195052))

(assert (= (and b!195052 res!92123) b!195053))

(declare-fun m!222427 () Bool)

(assert (=> b!195053 m!222427))

(assert (=> d!56861 d!57187))

(assert (=> d!56861 d!57137))

(declare-fun d!57189 () Bool)

(assert (=> d!57189 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96816) lt!96798)) (v!4256 (getValueByKey!245 (toList!1254 lt!96816) lt!96798)))))

(assert (=> d!56763 d!57189))

(declare-fun b!195055 () Bool)

(declare-fun e!128287 () Option!251)

(declare-fun e!128288 () Option!251)

(assert (=> b!195055 (= e!128287 e!128288)))

(declare-fun c!35282 () Bool)

(assert (=> b!195055 (= c!35282 (and ((_ is Cons!2445) (toList!1254 lt!96816)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96816))) lt!96798))))))

(declare-fun b!195054 () Bool)

(assert (=> b!195054 (= e!128287 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96816)))))))

(declare-fun b!195056 () Bool)

(assert (=> b!195056 (= e!128288 (getValueByKey!245 (t!7375 (toList!1254 lt!96816)) lt!96798))))

(declare-fun d!57191 () Bool)

(declare-fun c!35281 () Bool)

(assert (=> d!57191 (= c!35281 (and ((_ is Cons!2445) (toList!1254 lt!96816)) (= (_1!1791 (h!3086 (toList!1254 lt!96816))) lt!96798)))))

(assert (=> d!57191 (= (getValueByKey!245 (toList!1254 lt!96816) lt!96798) e!128287)))

(declare-fun b!195057 () Bool)

(assert (=> b!195057 (= e!128288 None!249)))

(assert (= (and d!57191 c!35281) b!195054))

(assert (= (and d!57191 (not c!35281)) b!195055))

(assert (= (and b!195055 c!35282) b!195056))

(assert (= (and b!195055 (not c!35282)) b!195057))

(declare-fun m!222429 () Bool)

(assert (=> b!195056 m!222429))

(assert (=> d!56763 d!57191))

(declare-fun b!195058 () Bool)

(declare-fun e!128291 () Bool)

(declare-fun call!19722 () Bool)

(assert (=> b!195058 (= e!128291 call!19722)))

(declare-fun bm!19719 () Bool)

(declare-fun c!35283 () Bool)

(assert (=> bm!19719 (= call!19722 (arrayNoDuplicates!0 (_keys!5954 lt!96671) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!35283 (Cons!2447 (select (arr!3875 (_keys!5954 lt!96671)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!35129 (Cons!2447 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) Nil!2448) Nil!2448)) (ite c!35129 (Cons!2447 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) Nil!2448) Nil!2448))))))

(declare-fun b!195059 () Bool)

(declare-fun e!128290 () Bool)

(assert (=> b!195059 (= e!128290 (contains!1382 (ite c!35129 (Cons!2447 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) Nil!2448) Nil!2448) (select (arr!3875 (_keys!5954 lt!96671)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195060 () Bool)

(declare-fun e!128292 () Bool)

(assert (=> b!195060 (= e!128292 e!128291)))

(assert (=> b!195060 (= c!35283 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!57193 () Bool)

(declare-fun res!92126 () Bool)

(declare-fun e!128289 () Bool)

(assert (=> d!57193 (=> res!92126 e!128289)))

(assert (=> d!57193 (= res!92126 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 lt!96671))))))

(assert (=> d!57193 (= (arrayNoDuplicates!0 (_keys!5954 lt!96671) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35129 (Cons!2447 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) Nil!2448) Nil!2448)) e!128289)))

(declare-fun b!195061 () Bool)

(assert (=> b!195061 (= e!128289 e!128292)))

(declare-fun res!92125 () Bool)

(assert (=> b!195061 (=> (not res!92125) (not e!128292))))

(assert (=> b!195061 (= res!92125 (not e!128290))))

(declare-fun res!92124 () Bool)

(assert (=> b!195061 (=> (not res!92124) (not e!128290))))

(assert (=> b!195061 (= res!92124 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195062 () Bool)

(assert (=> b!195062 (= e!128291 call!19722)))

(assert (= (and d!57193 (not res!92126)) b!195061))

(assert (= (and b!195061 res!92124) b!195059))

(assert (= (and b!195061 res!92125) b!195060))

(assert (= (and b!195060 c!35283) b!195062))

(assert (= (and b!195060 (not c!35283)) b!195058))

(assert (= (or b!195062 b!195058) bm!19719))

(assert (=> bm!19719 m!221899))

(declare-fun m!222431 () Bool)

(assert (=> bm!19719 m!222431))

(assert (=> b!195059 m!221899))

(assert (=> b!195059 m!221899))

(declare-fun m!222433 () Bool)

(assert (=> b!195059 m!222433))

(assert (=> b!195060 m!221899))

(assert (=> b!195060 m!221899))

(assert (=> b!195060 m!221901))

(assert (=> b!195061 m!221899))

(assert (=> b!195061 m!221899))

(assert (=> b!195061 m!221901))

(assert (=> bm!19678 d!57193))

(declare-fun d!57195 () Bool)

(assert (=> d!57195 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96848) lt!96834)) (v!4256 (getValueByKey!245 (toList!1254 lt!96848) lt!96834)))))

(assert (=> d!56727 d!57195))

(declare-fun b!195064 () Bool)

(declare-fun e!128293 () Option!251)

(declare-fun e!128294 () Option!251)

(assert (=> b!195064 (= e!128293 e!128294)))

(declare-fun c!35285 () Bool)

(assert (=> b!195064 (= c!35285 (and ((_ is Cons!2445) (toList!1254 lt!96848)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96848))) lt!96834))))))

(declare-fun b!195063 () Bool)

(assert (=> b!195063 (= e!128293 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96848)))))))

(declare-fun b!195065 () Bool)

(assert (=> b!195065 (= e!128294 (getValueByKey!245 (t!7375 (toList!1254 lt!96848)) lt!96834))))

(declare-fun d!57197 () Bool)

(declare-fun c!35284 () Bool)

(assert (=> d!57197 (= c!35284 (and ((_ is Cons!2445) (toList!1254 lt!96848)) (= (_1!1791 (h!3086 (toList!1254 lt!96848))) lt!96834)))))

(assert (=> d!57197 (= (getValueByKey!245 (toList!1254 lt!96848) lt!96834) e!128293)))

(declare-fun b!195066 () Bool)

(assert (=> b!195066 (= e!128294 None!249)))

(assert (= (and d!57197 c!35284) b!195063))

(assert (= (and d!57197 (not c!35284)) b!195064))

(assert (= (and b!195064 c!35285) b!195065))

(assert (= (and b!195064 (not c!35285)) b!195066))

(declare-fun m!222435 () Bool)

(assert (=> b!195065 m!222435))

(assert (=> d!56727 d!57197))

(declare-fun d!57199 () Bool)

(declare-fun res!92127 () Bool)

(declare-fun e!128295 () Bool)

(assert (=> d!57199 (=> res!92127 e!128295)))

(assert (=> d!57199 (= res!92127 (and ((_ is Cons!2445) lt!97104) (= (_1!1791 (h!3086 lt!97104)) (_1!1791 lt!96678))))))

(assert (=> d!57199 (= (containsKey!249 lt!97104 (_1!1791 lt!96678)) e!128295)))

(declare-fun b!195067 () Bool)

(declare-fun e!128296 () Bool)

(assert (=> b!195067 (= e!128295 e!128296)))

(declare-fun res!92128 () Bool)

(assert (=> b!195067 (=> (not res!92128) (not e!128296))))

(assert (=> b!195067 (= res!92128 (and (or (not ((_ is Cons!2445) lt!97104)) (bvsle (_1!1791 (h!3086 lt!97104)) (_1!1791 lt!96678))) ((_ is Cons!2445) lt!97104) (bvslt (_1!1791 (h!3086 lt!97104)) (_1!1791 lt!96678))))))

(declare-fun b!195068 () Bool)

(assert (=> b!195068 (= e!128296 (containsKey!249 (t!7375 lt!97104) (_1!1791 lt!96678)))))

(assert (= (and d!57199 (not res!92127)) b!195067))

(assert (= (and b!195067 res!92128) b!195068))

(declare-fun m!222437 () Bool)

(assert (=> b!195068 m!222437))

(assert (=> b!194628 d!57199))

(declare-fun d!57201 () Bool)

(declare-fun c!35288 () Bool)

(assert (=> d!57201 (= c!35288 ((_ is Nil!2446) (toList!1254 lt!96729)))))

(declare-fun e!128299 () (InoxSet tuple2!3560))

(assert (=> d!57201 (= (content!155 (toList!1254 lt!96729)) e!128299)))

(declare-fun b!195073 () Bool)

(assert (=> b!195073 (= e!128299 ((as const (Array tuple2!3560 Bool)) false))))

(declare-fun b!195074 () Bool)

(assert (=> b!195074 (= e!128299 ((_ map or) (store ((as const (Array tuple2!3560 Bool)) false) (h!3086 (toList!1254 lt!96729)) true) (content!155 (t!7375 (toList!1254 lt!96729)))))))

(assert (= (and d!57201 c!35288) b!195073))

(assert (= (and d!57201 (not c!35288)) b!195074))

(declare-fun m!222439 () Bool)

(assert (=> b!195074 m!222439))

(declare-fun m!222441 () Bool)

(assert (=> b!195074 m!222441))

(assert (=> d!56847 d!57201))

(declare-fun d!57203 () Bool)

(declare-fun res!92129 () Bool)

(declare-fun e!128300 () Bool)

(assert (=> d!57203 (=> res!92129 e!128300)))

(assert (=> d!57203 (= res!92129 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96676))) (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96676)))) key!828)))))

(assert (=> d!57203 (= (containsKey!249 (t!7375 (toList!1254 lt!96676)) key!828) e!128300)))

(declare-fun b!195075 () Bool)

(declare-fun e!128301 () Bool)

(assert (=> b!195075 (= e!128300 e!128301)))

(declare-fun res!92130 () Bool)

(assert (=> b!195075 (=> (not res!92130) (not e!128301))))

(assert (=> b!195075 (= res!92130 (and (or (not ((_ is Cons!2445) (t!7375 (toList!1254 lt!96676)))) (bvsle (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96676)))) key!828)) ((_ is Cons!2445) (t!7375 (toList!1254 lt!96676))) (bvslt (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96676)))) key!828)))))

(declare-fun b!195076 () Bool)

(assert (=> b!195076 (= e!128301 (containsKey!249 (t!7375 (t!7375 (toList!1254 lt!96676))) key!828))))

(assert (= (and d!57203 (not res!92129)) b!195075))

(assert (= (and b!195075 res!92130) b!195076))

(declare-fun m!222443 () Bool)

(assert (=> b!195076 m!222443))

(assert (=> b!194359 d!57203))

(assert (=> d!56859 d!56857))

(declare-fun d!57205 () Bool)

(assert (=> d!57205 (= (getValueByKey!245 lt!96820 (_1!1791 lt!96678)) (Some!250 (_2!1791 lt!96678)))))

(assert (=> d!57205 true))

(declare-fun _$22!540 () Unit!5878)

(assert (=> d!57205 (= (choose!1068 lt!96820 (_1!1791 lt!96678) (_2!1791 lt!96678)) _$22!540)))

(declare-fun bs!7782 () Bool)

(assert (= bs!7782 d!57205))

(assert (=> bs!7782 m!220927))

(assert (=> d!56859 d!57205))

(declare-fun d!57207 () Bool)

(declare-fun res!92131 () Bool)

(declare-fun e!128302 () Bool)

(assert (=> d!57207 (=> res!92131 e!128302)))

(assert (=> d!57207 (= res!92131 (or ((_ is Nil!2446) lt!96820) ((_ is Nil!2446) (t!7375 lt!96820))))))

(assert (=> d!57207 (= (isStrictlySorted!357 lt!96820) e!128302)))

(declare-fun b!195077 () Bool)

(declare-fun e!128303 () Bool)

(assert (=> b!195077 (= e!128302 e!128303)))

(declare-fun res!92132 () Bool)

(assert (=> b!195077 (=> (not res!92132) (not e!128303))))

(assert (=> b!195077 (= res!92132 (bvslt (_1!1791 (h!3086 lt!96820)) (_1!1791 (h!3086 (t!7375 lt!96820)))))))

(declare-fun b!195078 () Bool)

(assert (=> b!195078 (= e!128303 (isStrictlySorted!357 (t!7375 lt!96820)))))

(assert (= (and d!57207 (not res!92131)) b!195077))

(assert (= (and b!195077 res!92132) b!195078))

(declare-fun m!222445 () Bool)

(assert (=> b!195078 m!222445))

(assert (=> d!56859 d!57207))

(declare-fun d!57209 () Bool)

(assert (=> d!57209 (= (apply!188 lt!97031 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2238 (getValueByKey!245 (toList!1254 lt!97031) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7783 () Bool)

(assert (= bs!7783 d!57209))

(assert (=> bs!7783 m!220877))

(assert (=> bs!7783 m!221855))

(assert (=> bs!7783 m!221855))

(declare-fun m!222447 () Bool)

(assert (=> bs!7783 m!222447))

(assert (=> b!194453 d!57209))

(assert (=> b!194453 d!56839))

(assert (=> bm!19649 d!56903))

(declare-fun lt!97301 () Bool)

(declare-fun d!57211 () Bool)

(assert (=> d!57211 (= lt!97301 (select (content!155 (toList!1254 lt!96980)) (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))

(declare-fun e!128305 () Bool)

(assert (=> d!57211 (= lt!97301 e!128305)))

(declare-fun res!92133 () Bool)

(assert (=> d!57211 (=> (not res!92133) (not e!128305))))

(assert (=> d!57211 (= res!92133 ((_ is Cons!2445) (toList!1254 lt!96980)))))

(assert (=> d!57211 (= (contains!1381 (toList!1254 lt!96980) (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))) lt!97301)))

(declare-fun b!195079 () Bool)

(declare-fun e!128304 () Bool)

(assert (=> b!195079 (= e!128305 e!128304)))

(declare-fun res!92134 () Bool)

(assert (=> b!195079 (=> res!92134 e!128304)))

(assert (=> b!195079 (= res!92134 (= (h!3086 (toList!1254 lt!96980)) (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))

(declare-fun b!195080 () Bool)

(assert (=> b!195080 (= e!128304 (contains!1381 (t!7375 (toList!1254 lt!96980)) (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))

(assert (= (and d!57211 res!92133) b!195079))

(assert (= (and b!195079 (not res!92134)) b!195080))

(declare-fun m!222449 () Bool)

(assert (=> d!57211 m!222449))

(declare-fun m!222451 () Bool)

(assert (=> d!57211 m!222451))

(declare-fun m!222453 () Bool)

(assert (=> b!195080 m!222453))

(assert (=> b!194414 d!57211))

(declare-fun b!195081 () Bool)

(declare-fun e!128307 () Bool)

(declare-fun e!128308 () Bool)

(assert (=> b!195081 (= e!128307 e!128308)))

(declare-fun res!92137 () Bool)

(declare-fun lt!97303 () SeekEntryResult!694)

(assert (=> b!195081 (= res!92137 (and ((_ is Intermediate!694) lt!97303) (not (undefined!1506 lt!97303)) (bvslt (x!20690 lt!97303) #b01111111111111111111111111111110) (bvsge (x!20690 lt!97303) #b00000000000000000000000000000000) (bvsge (x!20690 lt!97303) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195081 (=> (not res!92137) (not e!128308))))

(declare-fun b!195082 () Bool)

(declare-fun e!128310 () SeekEntryResult!694)

(assert (=> b!195082 (= e!128310 (Intermediate!694 true (nextIndex!0 (toIndex!0 key!828 (mask!9223 thiss!1248)) #b00000000000000000000000000000000 (mask!9223 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!195083 () Bool)

(declare-fun e!128309 () SeekEntryResult!694)

(assert (=> b!195083 (= e!128310 e!128309)))

(declare-fun c!35289 () Bool)

(declare-fun lt!97302 () (_ BitVec 64))

(assert (=> b!195083 (= c!35289 (or (= lt!97302 key!828) (= (bvadd lt!97302 lt!97302) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195084 () Bool)

(assert (=> b!195084 (and (bvsge (index!4948 lt!97303) #b00000000000000000000000000000000) (bvslt (index!4948 lt!97303) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun res!92136 () Bool)

(assert (=> b!195084 (= res!92136 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4948 lt!97303)) key!828))))

(declare-fun e!128306 () Bool)

(assert (=> b!195084 (=> res!92136 e!128306)))

(assert (=> b!195084 (= e!128308 e!128306)))

(declare-fun b!195085 () Bool)

(assert (=> b!195085 (= e!128309 (Intermediate!694 false (nextIndex!0 (toIndex!0 key!828 (mask!9223 thiss!1248)) #b00000000000000000000000000000000 (mask!9223 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!195086 () Bool)

(assert (=> b!195086 (= e!128307 (bvsge (x!20690 lt!97303) #b01111111111111111111111111111110))))

(declare-fun d!57213 () Bool)

(assert (=> d!57213 e!128307))

(declare-fun c!35291 () Bool)

(assert (=> d!57213 (= c!35291 (and ((_ is Intermediate!694) lt!97303) (undefined!1506 lt!97303)))))

(assert (=> d!57213 (= lt!97303 e!128310)))

(declare-fun c!35290 () Bool)

(assert (=> d!57213 (= c!35290 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!57213 (= lt!97302 (select (arr!3875 (_keys!5954 thiss!1248)) (nextIndex!0 (toIndex!0 key!828 (mask!9223 thiss!1248)) #b00000000000000000000000000000000 (mask!9223 thiss!1248))))))

(assert (=> d!57213 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!57213 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9223 thiss!1248)) #b00000000000000000000000000000000 (mask!9223 thiss!1248)) key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)) lt!97303)))

(declare-fun b!195087 () Bool)

(assert (=> b!195087 (= e!128309 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 key!828 (mask!9223 thiss!1248)) #b00000000000000000000000000000000 (mask!9223 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9223 thiss!1248)) key!828 (_keys!5954 thiss!1248) (mask!9223 thiss!1248)))))

(declare-fun b!195088 () Bool)

(assert (=> b!195088 (and (bvsge (index!4948 lt!97303) #b00000000000000000000000000000000) (bvslt (index!4948 lt!97303) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun res!92135 () Bool)

(assert (=> b!195088 (= res!92135 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4948 lt!97303)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195088 (=> res!92135 e!128306)))

(declare-fun b!195089 () Bool)

(assert (=> b!195089 (and (bvsge (index!4948 lt!97303) #b00000000000000000000000000000000) (bvslt (index!4948 lt!97303) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> b!195089 (= e!128306 (= (select (arr!3875 (_keys!5954 thiss!1248)) (index!4948 lt!97303)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57213 c!35290) b!195082))

(assert (= (and d!57213 (not c!35290)) b!195083))

(assert (= (and b!195083 c!35289) b!195085))

(assert (= (and b!195083 (not c!35289)) b!195087))

(assert (= (and d!57213 c!35291) b!195086))

(assert (= (and d!57213 (not c!35291)) b!195081))

(assert (= (and b!195081 res!92137) b!195084))

(assert (= (and b!195084 (not res!92136)) b!195088))

(assert (= (and b!195088 (not res!92135)) b!195089))

(assert (=> b!195087 m!221055))

(declare-fun m!222455 () Bool)

(assert (=> b!195087 m!222455))

(assert (=> b!195087 m!222455))

(declare-fun m!222457 () Bool)

(assert (=> b!195087 m!222457))

(assert (=> d!57213 m!221055))

(declare-fun m!222459 () Bool)

(assert (=> d!57213 m!222459))

(assert (=> d!57213 m!220855))

(declare-fun m!222461 () Bool)

(assert (=> b!195088 m!222461))

(assert (=> b!195089 m!222461))

(assert (=> b!195084 m!222461))

(assert (=> b!194264 d!57213))

(declare-fun d!57215 () Bool)

(declare-fun lt!97304 () (_ BitVec 32))

(assert (=> d!57215 (and (bvsge lt!97304 #b00000000000000000000000000000000) (bvslt lt!97304 (bvadd (mask!9223 thiss!1248) #b00000000000000000000000000000001)))))

(assert (=> d!57215 (= lt!97304 (choose!52 (toIndex!0 key!828 (mask!9223 thiss!1248)) #b00000000000000000000000000000000 (mask!9223 thiss!1248)))))

(assert (=> d!57215 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!57215 (= (nextIndex!0 (toIndex!0 key!828 (mask!9223 thiss!1248)) #b00000000000000000000000000000000 (mask!9223 thiss!1248)) lt!97304)))

(declare-fun bs!7784 () Bool)

(assert (= bs!7784 d!57215))

(assert (=> bs!7784 m!221027))

(declare-fun m!222463 () Bool)

(assert (=> bs!7784 m!222463))

(assert (=> bs!7784 m!220855))

(assert (=> b!194264 d!57215))

(declare-fun d!57217 () Bool)

(assert (=> d!57217 (= (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96675) key!828)) (not ((_ is Some!250) (getValueByKey!245 (toList!1254 lt!96675) key!828))))))

(assert (=> d!56699 d!57217))

(declare-fun b!195091 () Bool)

(declare-fun e!128311 () Option!251)

(declare-fun e!128312 () Option!251)

(assert (=> b!195091 (= e!128311 e!128312)))

(declare-fun c!35293 () Bool)

(assert (=> b!195091 (= c!35293 (and ((_ is Cons!2445) (toList!1254 lt!97012)) (not (= (_1!1791 (h!3086 (toList!1254 lt!97012))) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))))

(declare-fun b!195090 () Bool)

(assert (=> b!195090 (= e!128311 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!97012)))))))

(declare-fun b!195092 () Bool)

(assert (=> b!195092 (= e!128312 (getValueByKey!245 (t!7375 (toList!1254 lt!97012)) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))))))

(declare-fun d!57219 () Bool)

(declare-fun c!35292 () Bool)

(assert (=> d!57219 (= c!35292 (and ((_ is Cons!2445) (toList!1254 lt!97012)) (= (_1!1791 (h!3086 (toList!1254 lt!97012))) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))))))))

(assert (=> d!57219 (= (getValueByKey!245 (toList!1254 lt!97012) (_1!1791 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248)))) e!128311)))

(declare-fun b!195093 () Bool)

(assert (=> b!195093 (= e!128312 None!249)))

(assert (= (and d!57219 c!35292) b!195090))

(assert (= (and d!57219 (not c!35292)) b!195091))

(assert (= (and b!195091 c!35293) b!195092))

(assert (= (and b!195091 (not c!35293)) b!195093))

(declare-fun m!222465 () Bool)

(assert (=> b!195092 m!222465))

(assert (=> b!194437 d!57219))

(assert (=> d!56769 d!56775))

(assert (=> d!56769 d!56777))

(declare-fun d!57221 () Bool)

(assert (=> d!57221 (= (apply!188 (+!322 lt!96801 (tuple2!3561 lt!96809 (minValue!3801 thiss!1248))) lt!96813) (apply!188 lt!96801 lt!96813))))

(assert (=> d!57221 true))

(declare-fun _$34!1093 () Unit!5878)

(assert (=> d!57221 (= (choose!1069 lt!96801 lt!96809 (minValue!3801 thiss!1248) lt!96813) _$34!1093)))

(declare-fun bs!7785 () Bool)

(assert (= bs!7785 d!57221))

(assert (=> bs!7785 m!220897))

(assert (=> bs!7785 m!220897))

(assert (=> bs!7785 m!220899))

(assert (=> bs!7785 m!220915))

(assert (=> d!56769 d!57221))

(declare-fun d!57223 () Bool)

(declare-fun e!128314 () Bool)

(assert (=> d!57223 e!128314))

(declare-fun res!92138 () Bool)

(assert (=> d!57223 (=> res!92138 e!128314)))

(declare-fun lt!97305 () Bool)

(assert (=> d!57223 (= res!92138 (not lt!97305))))

(declare-fun lt!97306 () Bool)

(assert (=> d!57223 (= lt!97305 lt!97306)))

(declare-fun lt!97307 () Unit!5878)

(declare-fun e!128313 () Unit!5878)

(assert (=> d!57223 (= lt!97307 e!128313)))

(declare-fun c!35294 () Bool)

(assert (=> d!57223 (= c!35294 lt!97306)))

(assert (=> d!57223 (= lt!97306 (containsKey!249 (toList!1254 lt!96801) lt!96813))))

(assert (=> d!57223 (= (contains!1379 lt!96801 lt!96813) lt!97305)))

(declare-fun b!195094 () Bool)

(declare-fun lt!97308 () Unit!5878)

(assert (=> b!195094 (= e!128313 lt!97308)))

(assert (=> b!195094 (= lt!97308 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96801) lt!96813))))

(assert (=> b!195094 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96801) lt!96813))))

(declare-fun b!195095 () Bool)

(declare-fun Unit!5922 () Unit!5878)

(assert (=> b!195095 (= e!128313 Unit!5922)))

(declare-fun b!195096 () Bool)

(assert (=> b!195096 (= e!128314 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96801) lt!96813)))))

(assert (= (and d!57223 c!35294) b!195094))

(assert (= (and d!57223 (not c!35294)) b!195095))

(assert (= (and d!57223 (not res!92138)) b!195096))

(declare-fun m!222467 () Bool)

(assert (=> d!57223 m!222467))

(declare-fun m!222469 () Bool)

(assert (=> b!195094 m!222469))

(assert (=> b!195094 m!221371))

(assert (=> b!195094 m!221371))

(declare-fun m!222471 () Bool)

(assert (=> b!195094 m!222471))

(assert (=> b!195096 m!221371))

(assert (=> b!195096 m!221371))

(assert (=> b!195096 m!222471))

(assert (=> d!56769 d!57223))

(assert (=> d!56769 d!56773))

(declare-fun d!57225 () Bool)

(declare-fun e!128316 () Bool)

(assert (=> d!57225 e!128316))

(declare-fun res!92139 () Bool)

(assert (=> d!57225 (=> res!92139 e!128316)))

(declare-fun lt!97309 () Bool)

(assert (=> d!57225 (= res!92139 (not lt!97309))))

(declare-fun lt!97310 () Bool)

(assert (=> d!57225 (= lt!97309 lt!97310)))

(declare-fun lt!97311 () Unit!5878)

(declare-fun e!128315 () Unit!5878)

(assert (=> d!57225 (= lt!97311 e!128315)))

(declare-fun c!35295 () Bool)

(assert (=> d!57225 (= c!35295 lt!97310)))

(assert (=> d!57225 (= lt!97310 (containsKey!249 (toList!1254 lt!97086) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57225 (= (contains!1379 lt!97086 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97309)))

(declare-fun b!195097 () Bool)

(declare-fun lt!97312 () Unit!5878)

(assert (=> b!195097 (= e!128315 lt!97312)))

(assert (=> b!195097 (= lt!97312 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97086) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195097 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97086) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195098 () Bool)

(declare-fun Unit!5923 () Unit!5878)

(assert (=> b!195098 (= e!128315 Unit!5923)))

(declare-fun b!195099 () Bool)

(assert (=> b!195099 (= e!128316 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97086) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57225 c!35295) b!195097))

(assert (= (and d!57225 (not c!35295)) b!195098))

(assert (= (and d!57225 (not res!92139)) b!195099))

(declare-fun m!222473 () Bool)

(assert (=> d!57225 m!222473))

(declare-fun m!222475 () Bool)

(assert (=> b!195097 m!222475))

(assert (=> b!195097 m!222197))

(assert (=> b!195097 m!222197))

(declare-fun m!222477 () Bool)

(assert (=> b!195097 m!222477))

(assert (=> b!195099 m!222197))

(assert (=> b!195099 m!222197))

(assert (=> b!195099 m!222477))

(assert (=> bm!19679 d!57225))

(declare-fun d!57227 () Bool)

(assert (=> d!57227 (= (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832)) (not (isEmpty!487 (getValueByKey!245 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832))))))

(declare-fun bs!7786 () Bool)

(assert (= bs!7786 d!57227))

(assert (=> bs!7786 m!221291))

(declare-fun m!222479 () Bool)

(assert (=> bs!7786 m!222479))

(assert (=> b!194417 d!57227))

(declare-fun b!195101 () Bool)

(declare-fun e!128317 () Option!251)

(declare-fun e!128318 () Option!251)

(assert (=> b!195101 (= e!128317 e!128318)))

(declare-fun c!35297 () Bool)

(assert (=> b!195101 (= c!35297 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))) (not (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))) lt!96832))))))

(declare-fun b!195100 () Bool)

(assert (=> b!195100 (= e!128317 (Some!250 (_2!1791 (h!3086 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))))

(declare-fun b!195102 () Bool)

(assert (=> b!195102 (= e!128318 (getValueByKey!245 (t!7375 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))) lt!96832))))

(declare-fun c!35296 () Bool)

(declare-fun d!57229 () Bool)

(assert (=> d!57229 (= c!35296 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))) (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))) lt!96832)))))

(assert (=> d!57229 (= (getValueByKey!245 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832) e!128317)))

(declare-fun b!195103 () Bool)

(assert (=> b!195103 (= e!128318 None!249)))

(assert (= (and d!57229 c!35296) b!195100))

(assert (= (and d!57229 (not c!35296)) b!195101))

(assert (= (and b!195101 c!35297) b!195102))

(assert (= (and b!195101 (not c!35297)) b!195103))

(declare-fun m!222481 () Bool)

(assert (=> b!195102 m!222481))

(assert (=> b!194417 d!57229))

(declare-fun d!57231 () Bool)

(declare-fun lt!97313 () Bool)

(assert (=> d!57231 (= lt!97313 (select (content!155 (toList!1254 lt!97035)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(declare-fun e!128320 () Bool)

(assert (=> d!57231 (= lt!97313 e!128320)))

(declare-fun res!92140 () Bool)

(assert (=> d!57231 (=> (not res!92140) (not e!128320))))

(assert (=> d!57231 (= res!92140 ((_ is Cons!2445) (toList!1254 lt!97035)))))

(assert (=> d!57231 (= (contains!1381 (toList!1254 lt!97035) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) lt!97313)))

(declare-fun b!195104 () Bool)

(declare-fun e!128319 () Bool)

(assert (=> b!195104 (= e!128320 e!128319)))

(declare-fun res!92141 () Bool)

(assert (=> b!195104 (=> res!92141 e!128319)))

(assert (=> b!195104 (= res!92141 (= (h!3086 (toList!1254 lt!97035)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(declare-fun b!195105 () Bool)

(assert (=> b!195105 (= e!128319 (contains!1381 (t!7375 (toList!1254 lt!97035)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(assert (= (and d!57231 res!92140) b!195104))

(assert (= (and b!195104 (not res!92141)) b!195105))

(declare-fun m!222483 () Bool)

(assert (=> d!57231 m!222483))

(declare-fun m!222485 () Bool)

(assert (=> d!57231 m!222485))

(declare-fun m!222487 () Bool)

(assert (=> b!195105 m!222487))

(assert (=> b!194467 d!57231))

(declare-fun d!57233 () Bool)

(declare-fun lt!97314 () Bool)

(assert (=> d!57233 (= lt!97314 (select (content!155 (toList!1254 lt!96926)) (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun e!128322 () Bool)

(assert (=> d!57233 (= lt!97314 e!128322)))

(declare-fun res!92142 () Bool)

(assert (=> d!57233 (=> (not res!92142) (not e!128322))))

(assert (=> d!57233 (= res!92142 ((_ is Cons!2445) (toList!1254 lt!96926)))))

(assert (=> d!57233 (= (contains!1381 (toList!1254 lt!96926) (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!97314)))

(declare-fun b!195106 () Bool)

(declare-fun e!128321 () Bool)

(assert (=> b!195106 (= e!128322 e!128321)))

(declare-fun res!92143 () Bool)

(assert (=> b!195106 (=> res!92143 e!128321)))

(assert (=> b!195106 (= res!92143 (= (h!3086 (toList!1254 lt!96926)) (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!195107 () Bool)

(assert (=> b!195107 (= e!128321 (contains!1381 (t!7375 (toList!1254 lt!96926)) (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (= (and d!57233 res!92142) b!195106))

(assert (= (and b!195106 (not res!92143)) b!195107))

(declare-fun m!222489 () Bool)

(assert (=> d!57233 m!222489))

(declare-fun m!222491 () Bool)

(assert (=> d!57233 m!222491))

(declare-fun m!222493 () Bool)

(assert (=> b!195107 m!222493))

(assert (=> b!194310 d!57233))

(declare-fun d!57235 () Bool)

(assert (=> d!57235 (= ($colon$colon!103 e!128024 (ite c!35143 (h!3086 (toList!1254 lt!96676)) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678)))) (Cons!2445 (ite c!35143 (h!3086 (toList!1254 lt!96676)) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))) e!128024))))

(assert (=> bm!19686 d!57235))

(assert (=> d!56679 d!56689))

(declare-fun d!57237 () Bool)

(assert (=> d!57237 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7787 () Bool)

(assert (= bs!7787 d!57237))

(assert (=> bs!7787 m!221563))

(declare-fun m!222495 () Bool)

(assert (=> bs!7787 m!222495))

(assert (=> b!194582 d!57237))

(declare-fun b!195109 () Bool)

(declare-fun e!128323 () Option!251)

(declare-fun e!128324 () Option!251)

(assert (=> b!195109 (= e!128323 e!128324)))

(declare-fun c!35299 () Bool)

(assert (=> b!195109 (= c!35299 (and ((_ is Cons!2445) (toList!1254 lt!96808)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96808))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!195108 () Bool)

(assert (=> b!195108 (= e!128323 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96808)))))))

(declare-fun b!195110 () Bool)

(assert (=> b!195110 (= e!128324 (getValueByKey!245 (t!7375 (toList!1254 lt!96808)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!57239 () Bool)

(declare-fun c!35298 () Bool)

(assert (=> d!57239 (= c!35298 (and ((_ is Cons!2445) (toList!1254 lt!96808)) (= (_1!1791 (h!3086 (toList!1254 lt!96808))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57239 (= (getValueByKey!245 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000) e!128323)))

(declare-fun b!195111 () Bool)

(assert (=> b!195111 (= e!128324 None!249)))

(assert (= (and d!57239 c!35298) b!195108))

(assert (= (and d!57239 (not c!35298)) b!195109))

(assert (= (and b!195109 c!35299) b!195110))

(assert (= (and b!195109 (not c!35299)) b!195111))

(declare-fun m!222497 () Bool)

(assert (=> b!195110 m!222497))

(assert (=> b!194582 d!57239))

(declare-fun lt!97315 () Bool)

(declare-fun d!57241 () Bool)

(assert (=> d!57241 (= lt!97315 (select (content!155 (toList!1254 lt!97002)) (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))

(declare-fun e!128326 () Bool)

(assert (=> d!57241 (= lt!97315 e!128326)))

(declare-fun res!92144 () Bool)

(assert (=> d!57241 (=> (not res!92144) (not e!128326))))

(assert (=> d!57241 (= res!92144 ((_ is Cons!2445) (toList!1254 lt!97002)))))

(assert (=> d!57241 (= (contains!1381 (toList!1254 lt!97002) (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) lt!97315)))

(declare-fun b!195112 () Bool)

(declare-fun e!128325 () Bool)

(assert (=> b!195112 (= e!128326 e!128325)))

(declare-fun res!92145 () Bool)

(assert (=> b!195112 (=> res!92145 e!128325)))

(assert (=> b!195112 (= res!92145 (= (h!3086 (toList!1254 lt!97002)) (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))

(declare-fun b!195113 () Bool)

(assert (=> b!195113 (= e!128325 (contains!1381 (t!7375 (toList!1254 lt!97002)) (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))

(assert (= (and d!57241 res!92144) b!195112))

(assert (= (and b!195112 (not res!92145)) b!195113))

(declare-fun m!222499 () Bool)

(assert (=> d!57241 m!222499))

(declare-fun m!222501 () Bool)

(assert (=> d!57241 m!222501))

(declare-fun m!222503 () Bool)

(assert (=> b!195113 m!222503))

(assert (=> b!194431 d!57241))

(declare-fun d!57243 () Bool)

(declare-fun res!92146 () Bool)

(declare-fun e!128327 () Bool)

(assert (=> d!57243 (=> res!92146 e!128327)))

(assert (=> d!57243 (= res!92146 (and ((_ is Cons!2445) lt!96732) (= (_1!1791 (h!3086 lt!96732)) (_1!1791 lt!96678))))))

(assert (=> d!57243 (= (containsKey!249 lt!96732 (_1!1791 lt!96678)) e!128327)))

(declare-fun b!195114 () Bool)

(declare-fun e!128328 () Bool)

(assert (=> b!195114 (= e!128327 e!128328)))

(declare-fun res!92147 () Bool)

(assert (=> b!195114 (=> (not res!92147) (not e!128328))))

(assert (=> b!195114 (= res!92147 (and (or (not ((_ is Cons!2445) lt!96732)) (bvsle (_1!1791 (h!3086 lt!96732)) (_1!1791 lt!96678))) ((_ is Cons!2445) lt!96732) (bvslt (_1!1791 (h!3086 lt!96732)) (_1!1791 lt!96678))))))

(declare-fun b!195115 () Bool)

(assert (=> b!195115 (= e!128328 (containsKey!249 (t!7375 lt!96732) (_1!1791 lt!96678)))))

(assert (= (and d!57243 (not res!92146)) b!195114))

(assert (= (and b!195114 res!92147) b!195115))

(declare-fun m!222505 () Bool)

(assert (=> b!195115 m!222505))

(assert (=> b!194322 d!57243))

(assert (=> b!194444 d!56677))

(declare-fun d!57245 () Bool)

(declare-fun e!128329 () Bool)

(assert (=> d!57245 e!128329))

(declare-fun res!92148 () Bool)

(assert (=> d!57245 (=> (not res!92148) (not e!128329))))

(declare-fun lt!97316 () ListLongMap!2477)

(assert (=> d!57245 (= res!92148 (contains!1379 lt!97316 (_1!1791 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671)))))))

(declare-fun lt!97319 () List!2449)

(assert (=> d!57245 (= lt!97316 (ListLongMap!2478 lt!97319))))

(declare-fun lt!97317 () Unit!5878)

(declare-fun lt!97318 () Unit!5878)

(assert (=> d!57245 (= lt!97317 lt!97318)))

(assert (=> d!57245 (= (getValueByKey!245 lt!97319 (_1!1791 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671)))) (Some!250 (_2!1791 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671)))))))

(assert (=> d!57245 (= lt!97318 (lemmaContainsTupThenGetReturnValue!132 lt!97319 (_1!1791 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671))) (_2!1791 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671)))))))

(assert (=> d!57245 (= lt!97319 (insertStrictlySorted!135 (toList!1254 lt!97077) (_1!1791 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671))) (_2!1791 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671)))))))

(assert (=> d!57245 (= (+!322 lt!97077 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671))) lt!97316)))

(declare-fun b!195116 () Bool)

(declare-fun res!92149 () Bool)

(assert (=> b!195116 (=> (not res!92149) (not e!128329))))

(assert (=> b!195116 (= res!92149 (= (getValueByKey!245 (toList!1254 lt!97316) (_1!1791 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671)))) (Some!250 (_2!1791 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671))))))))

(declare-fun b!195117 () Bool)

(assert (=> b!195117 (= e!128329 (contains!1381 (toList!1254 lt!97316) (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671))))))

(assert (= (and d!57245 res!92148) b!195116))

(assert (= (and b!195116 res!92149) b!195117))

(declare-fun m!222507 () Bool)

(assert (=> d!57245 m!222507))

(declare-fun m!222509 () Bool)

(assert (=> d!57245 m!222509))

(declare-fun m!222511 () Bool)

(assert (=> d!57245 m!222511))

(declare-fun m!222513 () Bool)

(assert (=> d!57245 m!222513))

(declare-fun m!222515 () Bool)

(assert (=> b!195116 m!222515))

(declare-fun m!222517 () Bool)

(assert (=> b!195117 m!222517))

(assert (=> b!194593 d!57245))

(declare-fun d!57247 () Bool)

(declare-fun e!128331 () Bool)

(assert (=> d!57247 e!128331))

(declare-fun res!92150 () Bool)

(assert (=> d!57247 (=> res!92150 e!128331)))

(declare-fun lt!97320 () Bool)

(assert (=> d!57247 (= res!92150 (not lt!97320))))

(declare-fun lt!97321 () Bool)

(assert (=> d!57247 (= lt!97320 lt!97321)))

(declare-fun lt!97322 () Unit!5878)

(declare-fun e!128330 () Unit!5878)

(assert (=> d!57247 (= lt!97322 e!128330)))

(declare-fun c!35300 () Bool)

(assert (=> d!57247 (= c!35300 lt!97321)))

(assert (=> d!57247 (= lt!97321 (containsKey!249 (toList!1254 (+!322 lt!97077 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671)))) lt!97073))))

(assert (=> d!57247 (= (contains!1379 (+!322 lt!97077 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671))) lt!97073) lt!97320)))

(declare-fun b!195118 () Bool)

(declare-fun lt!97323 () Unit!5878)

(assert (=> b!195118 (= e!128330 lt!97323)))

(assert (=> b!195118 (= lt!97323 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 (+!322 lt!97077 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671)))) lt!97073))))

(assert (=> b!195118 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!97077 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671)))) lt!97073))))

(declare-fun b!195119 () Bool)

(declare-fun Unit!5924 () Unit!5878)

(assert (=> b!195119 (= e!128330 Unit!5924)))

(declare-fun b!195120 () Bool)

(assert (=> b!195120 (= e!128331 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!97077 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671)))) lt!97073)))))

(assert (= (and d!57247 c!35300) b!195118))

(assert (= (and d!57247 (not c!35300)) b!195119))

(assert (= (and d!57247 (not res!92150)) b!195120))

(declare-fun m!222519 () Bool)

(assert (=> d!57247 m!222519))

(declare-fun m!222521 () Bool)

(assert (=> b!195118 m!222521))

(declare-fun m!222523 () Bool)

(assert (=> b!195118 m!222523))

(assert (=> b!195118 m!222523))

(declare-fun m!222525 () Bool)

(assert (=> b!195118 m!222525))

(assert (=> b!195120 m!222523))

(assert (=> b!195120 m!222523))

(assert (=> b!195120 m!222525))

(assert (=> b!194593 d!57247))

(declare-fun d!57249 () Bool)

(assert (=> d!57249 (= (apply!188 (+!322 lt!97094 (tuple2!3561 lt!97085 (minValue!3801 lt!96671))) lt!97076) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!97094 (tuple2!3561 lt!97085 (minValue!3801 lt!96671)))) lt!97076)))))

(declare-fun bs!7788 () Bool)

(assert (= bs!7788 d!57249))

(declare-fun m!222527 () Bool)

(assert (=> bs!7788 m!222527))

(assert (=> bs!7788 m!222527))

(declare-fun m!222529 () Bool)

(assert (=> bs!7788 m!222529))

(assert (=> b!194593 d!57249))

(declare-fun d!57251 () Bool)

(assert (=> d!57251 (= (apply!188 lt!97094 lt!97076) (get!2238 (getValueByKey!245 (toList!1254 lt!97094) lt!97076)))))

(declare-fun bs!7789 () Bool)

(assert (= bs!7789 d!57251))

(declare-fun m!222531 () Bool)

(assert (=> bs!7789 m!222531))

(assert (=> bs!7789 m!222531))

(declare-fun m!222533 () Bool)

(assert (=> bs!7789 m!222533))

(assert (=> b!194593 d!57251))

(declare-fun d!57253 () Bool)

(declare-fun e!128332 () Bool)

(assert (=> d!57253 e!128332))

(declare-fun res!92151 () Bool)

(assert (=> d!57253 (=> (not res!92151) (not e!128332))))

(declare-fun lt!97324 () ListLongMap!2477)

(assert (=> d!57253 (= res!92151 (contains!1379 lt!97324 (_1!1791 (tuple2!3561 lt!97085 (minValue!3801 lt!96671)))))))

(declare-fun lt!97327 () List!2449)

(assert (=> d!57253 (= lt!97324 (ListLongMap!2478 lt!97327))))

(declare-fun lt!97325 () Unit!5878)

(declare-fun lt!97326 () Unit!5878)

(assert (=> d!57253 (= lt!97325 lt!97326)))

(assert (=> d!57253 (= (getValueByKey!245 lt!97327 (_1!1791 (tuple2!3561 lt!97085 (minValue!3801 lt!96671)))) (Some!250 (_2!1791 (tuple2!3561 lt!97085 (minValue!3801 lt!96671)))))))

(assert (=> d!57253 (= lt!97326 (lemmaContainsTupThenGetReturnValue!132 lt!97327 (_1!1791 (tuple2!3561 lt!97085 (minValue!3801 lt!96671))) (_2!1791 (tuple2!3561 lt!97085 (minValue!3801 lt!96671)))))))

(assert (=> d!57253 (= lt!97327 (insertStrictlySorted!135 (toList!1254 lt!97094) (_1!1791 (tuple2!3561 lt!97085 (minValue!3801 lt!96671))) (_2!1791 (tuple2!3561 lt!97085 (minValue!3801 lt!96671)))))))

(assert (=> d!57253 (= (+!322 lt!97094 (tuple2!3561 lt!97085 (minValue!3801 lt!96671))) lt!97324)))

(declare-fun b!195121 () Bool)

(declare-fun res!92152 () Bool)

(assert (=> b!195121 (=> (not res!92152) (not e!128332))))

(assert (=> b!195121 (= res!92152 (= (getValueByKey!245 (toList!1254 lt!97324) (_1!1791 (tuple2!3561 lt!97085 (minValue!3801 lt!96671)))) (Some!250 (_2!1791 (tuple2!3561 lt!97085 (minValue!3801 lt!96671))))))))

(declare-fun b!195122 () Bool)

(assert (=> b!195122 (= e!128332 (contains!1381 (toList!1254 lt!97324) (tuple2!3561 lt!97085 (minValue!3801 lt!96671))))))

(assert (= (and d!57253 res!92151) b!195121))

(assert (= (and b!195121 res!92152) b!195122))

(declare-fun m!222535 () Bool)

(assert (=> d!57253 m!222535))

(declare-fun m!222537 () Bool)

(assert (=> d!57253 m!222537))

(declare-fun m!222539 () Bool)

(assert (=> d!57253 m!222539))

(declare-fun m!222541 () Bool)

(assert (=> d!57253 m!222541))

(declare-fun m!222543 () Bool)

(assert (=> b!195121 m!222543))

(declare-fun m!222545 () Bool)

(assert (=> b!195122 m!222545))

(assert (=> b!194593 d!57253))

(declare-fun d!57255 () Bool)

(declare-fun e!128333 () Bool)

(assert (=> d!57255 e!128333))

(declare-fun res!92153 () Bool)

(assert (=> d!57255 (=> (not res!92153) (not e!128333))))

(declare-fun lt!97328 () ListLongMap!2477)

(assert (=> d!57255 (= res!92153 (contains!1379 lt!97328 (_1!1791 (tuple2!3561 lt!97087 (minValue!3801 lt!96671)))))))

(declare-fun lt!97331 () List!2449)

(assert (=> d!57255 (= lt!97328 (ListLongMap!2478 lt!97331))))

(declare-fun lt!97329 () Unit!5878)

(declare-fun lt!97330 () Unit!5878)

(assert (=> d!57255 (= lt!97329 lt!97330)))

(assert (=> d!57255 (= (getValueByKey!245 lt!97331 (_1!1791 (tuple2!3561 lt!97087 (minValue!3801 lt!96671)))) (Some!250 (_2!1791 (tuple2!3561 lt!97087 (minValue!3801 lt!96671)))))))

(assert (=> d!57255 (= lt!97330 (lemmaContainsTupThenGetReturnValue!132 lt!97331 (_1!1791 (tuple2!3561 lt!97087 (minValue!3801 lt!96671))) (_2!1791 (tuple2!3561 lt!97087 (minValue!3801 lt!96671)))))))

(assert (=> d!57255 (= lt!97331 (insertStrictlySorted!135 (toList!1254 lt!97079) (_1!1791 (tuple2!3561 lt!97087 (minValue!3801 lt!96671))) (_2!1791 (tuple2!3561 lt!97087 (minValue!3801 lt!96671)))))))

(assert (=> d!57255 (= (+!322 lt!97079 (tuple2!3561 lt!97087 (minValue!3801 lt!96671))) lt!97328)))

(declare-fun b!195123 () Bool)

(declare-fun res!92154 () Bool)

(assert (=> b!195123 (=> (not res!92154) (not e!128333))))

(assert (=> b!195123 (= res!92154 (= (getValueByKey!245 (toList!1254 lt!97328) (_1!1791 (tuple2!3561 lt!97087 (minValue!3801 lt!96671)))) (Some!250 (_2!1791 (tuple2!3561 lt!97087 (minValue!3801 lt!96671))))))))

(declare-fun b!195124 () Bool)

(assert (=> b!195124 (= e!128333 (contains!1381 (toList!1254 lt!97328) (tuple2!3561 lt!97087 (minValue!3801 lt!96671))))))

(assert (= (and d!57255 res!92153) b!195123))

(assert (= (and b!195123 res!92154) b!195124))

(declare-fun m!222547 () Bool)

(assert (=> d!57255 m!222547))

(declare-fun m!222549 () Bool)

(assert (=> d!57255 m!222549))

(declare-fun m!222551 () Bool)

(assert (=> d!57255 m!222551))

(declare-fun m!222553 () Bool)

(assert (=> d!57255 m!222553))

(declare-fun m!222555 () Bool)

(assert (=> b!195123 m!222555))

(declare-fun m!222557 () Bool)

(assert (=> b!195124 m!222557))

(assert (=> b!194593 d!57255))

(declare-fun d!57257 () Bool)

(assert (=> d!57257 (= (apply!188 (+!322 lt!97094 (tuple2!3561 lt!97085 (minValue!3801 lt!96671))) lt!97076) (apply!188 lt!97094 lt!97076))))

(declare-fun lt!97332 () Unit!5878)

(assert (=> d!57257 (= lt!97332 (choose!1069 lt!97094 lt!97085 (minValue!3801 lt!96671) lt!97076))))

(declare-fun e!128334 () Bool)

(assert (=> d!57257 e!128334))

(declare-fun res!92155 () Bool)

(assert (=> d!57257 (=> (not res!92155) (not e!128334))))

(assert (=> d!57257 (= res!92155 (contains!1379 lt!97094 lt!97076))))

(assert (=> d!57257 (= (addApplyDifferent!164 lt!97094 lt!97085 (minValue!3801 lt!96671) lt!97076) lt!97332)))

(declare-fun b!195125 () Bool)

(assert (=> b!195125 (= e!128334 (not (= lt!97076 lt!97085)))))

(assert (= (and d!57257 res!92155) b!195125))

(assert (=> d!57257 m!221609))

(assert (=> d!57257 m!221627))

(assert (=> d!57257 m!221609))

(declare-fun m!222559 () Bool)

(assert (=> d!57257 m!222559))

(declare-fun m!222561 () Bool)

(assert (=> d!57257 m!222561))

(assert (=> d!57257 m!221621))

(assert (=> b!194593 d!57257))

(declare-fun d!57259 () Bool)

(declare-fun e!128335 () Bool)

(assert (=> d!57259 e!128335))

(declare-fun res!92156 () Bool)

(assert (=> d!57259 (=> (not res!92156) (not e!128335))))

(declare-fun lt!97333 () ListLongMap!2477)

(assert (=> d!57259 (= res!92156 (contains!1379 lt!97333 (_1!1791 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671)))))))

(declare-fun lt!97336 () List!2449)

(assert (=> d!57259 (= lt!97333 (ListLongMap!2478 lt!97336))))

(declare-fun lt!97334 () Unit!5878)

(declare-fun lt!97335 () Unit!5878)

(assert (=> d!57259 (= lt!97334 lt!97335)))

(assert (=> d!57259 (= (getValueByKey!245 lt!97336 (_1!1791 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671)))) (Some!250 (_2!1791 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671)))))))

(assert (=> d!57259 (= lt!97335 (lemmaContainsTupThenGetReturnValue!132 lt!97336 (_1!1791 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671))) (_2!1791 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671)))))))

(assert (=> d!57259 (= lt!97336 (insertStrictlySorted!135 (toList!1254 lt!97089) (_1!1791 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671))) (_2!1791 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671)))))))

(assert (=> d!57259 (= (+!322 lt!97089 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671))) lt!97333)))

(declare-fun b!195126 () Bool)

(declare-fun res!92157 () Bool)

(assert (=> b!195126 (=> (not res!92157) (not e!128335))))

(assert (=> b!195126 (= res!92157 (= (getValueByKey!245 (toList!1254 lt!97333) (_1!1791 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671)))) (Some!250 (_2!1791 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671))))))))

(declare-fun b!195127 () Bool)

(assert (=> b!195127 (= e!128335 (contains!1381 (toList!1254 lt!97333) (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671))))))

(assert (= (and d!57259 res!92156) b!195126))

(assert (= (and b!195126 res!92157) b!195127))

(declare-fun m!222563 () Bool)

(assert (=> d!57259 m!222563))

(declare-fun m!222565 () Bool)

(assert (=> d!57259 m!222565))

(declare-fun m!222567 () Bool)

(assert (=> d!57259 m!222567))

(declare-fun m!222569 () Bool)

(assert (=> d!57259 m!222569))

(declare-fun m!222571 () Bool)

(assert (=> b!195126 m!222571))

(declare-fun m!222573 () Bool)

(assert (=> b!195127 m!222573))

(assert (=> b!194593 d!57259))

(declare-fun d!57261 () Bool)

(assert (=> d!57261 (= (apply!188 lt!97089 lt!97075) (get!2238 (getValueByKey!245 (toList!1254 lt!97089) lt!97075)))))

(declare-fun bs!7790 () Bool)

(assert (= bs!7790 d!57261))

(declare-fun m!222575 () Bool)

(assert (=> bs!7790 m!222575))

(assert (=> bs!7790 m!222575))

(declare-fun m!222577 () Bool)

(assert (=> bs!7790 m!222577))

(assert (=> b!194593 d!57261))

(declare-fun d!57263 () Bool)

(assert (=> d!57263 (= (apply!188 (+!322 lt!97089 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671))) lt!97075) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!97089 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671)))) lt!97075)))))

(declare-fun bs!7791 () Bool)

(assert (= bs!7791 d!57263))

(declare-fun m!222579 () Bool)

(assert (=> bs!7791 m!222579))

(assert (=> bs!7791 m!222579))

(declare-fun m!222581 () Bool)

(assert (=> bs!7791 m!222581))

(assert (=> b!194593 d!57263))

(declare-fun d!57265 () Bool)

(assert (=> d!57265 (contains!1379 (+!322 lt!97077 (tuple2!3561 lt!97093 (zeroValue!3801 lt!96671))) lt!97073)))

(declare-fun lt!97337 () Unit!5878)

(assert (=> d!57265 (= lt!97337 (choose!1070 lt!97077 lt!97093 (zeroValue!3801 lt!96671) lt!97073))))

(assert (=> d!57265 (contains!1379 lt!97077 lt!97073)))

(assert (=> d!57265 (= (addStillContains!164 lt!97077 lt!97093 (zeroValue!3801 lt!96671) lt!97073) lt!97337)))

(declare-fun bs!7792 () Bool)

(assert (= bs!7792 d!57265))

(assert (=> bs!7792 m!221601))

(assert (=> bs!7792 m!221601))

(assert (=> bs!7792 m!221603))

(declare-fun m!222583 () Bool)

(assert (=> bs!7792 m!222583))

(declare-fun m!222585 () Bool)

(assert (=> bs!7792 m!222585))

(assert (=> b!194593 d!57265))

(declare-fun d!57267 () Bool)

(assert (=> d!57267 (= (apply!188 (+!322 lt!97079 (tuple2!3561 lt!97087 (minValue!3801 lt!96671))) lt!97091) (apply!188 lt!97079 lt!97091))))

(declare-fun lt!97338 () Unit!5878)

(assert (=> d!57267 (= lt!97338 (choose!1069 lt!97079 lt!97087 (minValue!3801 lt!96671) lt!97091))))

(declare-fun e!128336 () Bool)

(assert (=> d!57267 e!128336))

(declare-fun res!92158 () Bool)

(assert (=> d!57267 (=> (not res!92158) (not e!128336))))

(assert (=> d!57267 (= res!92158 (contains!1379 lt!97079 lt!97091))))

(assert (=> d!57267 (= (addApplyDifferent!164 lt!97079 lt!97087 (minValue!3801 lt!96671) lt!97091) lt!97338)))

(declare-fun b!195128 () Bool)

(assert (=> b!195128 (= e!128336 (not (= lt!97091 lt!97087)))))

(assert (= (and d!57267 res!92158) b!195128))

(assert (=> d!57267 m!221605))

(assert (=> d!57267 m!221607))

(assert (=> d!57267 m!221605))

(declare-fun m!222587 () Bool)

(assert (=> d!57267 m!222587))

(declare-fun m!222589 () Bool)

(assert (=> d!57267 m!222589))

(assert (=> d!57267 m!221623))

(assert (=> b!194593 d!57267))

(declare-fun d!57269 () Bool)

(assert (=> d!57269 (= (apply!188 (+!322 lt!97079 (tuple2!3561 lt!97087 (minValue!3801 lt!96671))) lt!97091) (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!97079 (tuple2!3561 lt!97087 (minValue!3801 lt!96671)))) lt!97091)))))

(declare-fun bs!7793 () Bool)

(assert (= bs!7793 d!57269))

(declare-fun m!222591 () Bool)

(assert (=> bs!7793 m!222591))

(assert (=> bs!7793 m!222591))

(declare-fun m!222593 () Bool)

(assert (=> bs!7793 m!222593))

(assert (=> b!194593 d!57269))

(declare-fun d!57271 () Bool)

(assert (=> d!57271 (= (apply!188 (+!322 lt!97089 (tuple2!3561 lt!97080 (zeroValue!3801 lt!96671))) lt!97075) (apply!188 lt!97089 lt!97075))))

(declare-fun lt!97339 () Unit!5878)

(assert (=> d!57271 (= lt!97339 (choose!1069 lt!97089 lt!97080 (zeroValue!3801 lt!96671) lt!97075))))

(declare-fun e!128337 () Bool)

(assert (=> d!57271 e!128337))

(declare-fun res!92159 () Bool)

(assert (=> d!57271 (=> (not res!92159) (not e!128337))))

(assert (=> d!57271 (= res!92159 (contains!1379 lt!97089 lt!97075))))

(assert (=> d!57271 (= (addApplyDifferent!164 lt!97089 lt!97080 (zeroValue!3801 lt!96671) lt!97075) lt!97339)))

(declare-fun b!195129 () Bool)

(assert (=> b!195129 (= e!128337 (not (= lt!97075 lt!97080)))))

(assert (= (and d!57271 res!92159) b!195129))

(assert (=> d!57271 m!221613))

(assert (=> d!57271 m!221615))

(assert (=> d!57271 m!221613))

(declare-fun m!222595 () Bool)

(assert (=> d!57271 m!222595))

(declare-fun m!222597 () Bool)

(assert (=> d!57271 m!222597))

(assert (=> d!57271 m!221619))

(assert (=> b!194593 d!57271))

(declare-fun b!195130 () Bool)

(declare-fun e!128341 () ListLongMap!2477)

(declare-fun e!128342 () ListLongMap!2477)

(assert (=> b!195130 (= e!128341 e!128342)))

(declare-fun c!35304 () Bool)

(assert (=> b!195130 (= c!35304 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun b!195132 () Bool)

(declare-fun e!128344 () Bool)

(declare-fun lt!97346 () ListLongMap!2477)

(assert (=> b!195132 (= e!128344 (isEmpty!488 lt!97346))))

(declare-fun b!195133 () Bool)

(declare-fun call!19723 () ListLongMap!2477)

(assert (=> b!195133 (= e!128342 call!19723)))

(declare-fun b!195134 () Bool)

(declare-fun e!128343 () Bool)

(declare-fun e!128339 () Bool)

(assert (=> b!195134 (= e!128343 e!128339)))

(assert (=> b!195134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(declare-fun res!92160 () Bool)

(assert (=> b!195134 (= res!92160 (contains!1379 lt!97346 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(assert (=> b!195134 (=> (not res!92160) (not e!128339))))

(declare-fun b!195135 () Bool)

(declare-fun e!128340 () Bool)

(assert (=> b!195135 (= e!128340 e!128343)))

(declare-fun c!35303 () Bool)

(declare-fun e!128338 () Bool)

(assert (=> b!195135 (= c!35303 e!128338)))

(declare-fun res!92161 () Bool)

(assert (=> b!195135 (=> (not res!92161) (not e!128338))))

(assert (=> b!195135 (= res!92161 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(declare-fun b!195136 () Bool)

(assert (=> b!195136 (= e!128338 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(assert (=> b!195136 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!195137 () Bool)

(assert (=> b!195137 (= e!128341 (ListLongMap!2478 Nil!2446))))

(declare-fun b!195138 () Bool)

(assert (=> b!195138 (= e!128344 (= lt!97346 (getCurrentListMapNoExtraKeys!221 (_keys!5954 lt!96671) (_values!3943 lt!96671) (mask!9223 lt!96671) (extraKeys!3697 lt!96671) (zeroValue!3801 lt!96671) (minValue!3801 lt!96671) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3960 lt!96671))))))

(declare-fun bm!19720 () Bool)

(assert (=> bm!19720 (= call!19723 (getCurrentListMapNoExtraKeys!221 (_keys!5954 lt!96671) (_values!3943 lt!96671) (mask!9223 lt!96671) (extraKeys!3697 lt!96671) (zeroValue!3801 lt!96671) (minValue!3801 lt!96671) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3960 lt!96671)))))

(declare-fun b!195139 () Bool)

(assert (=> b!195139 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(assert (=> b!195139 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4200 (_values!3943 lt!96671))))))

(assert (=> b!195139 (= e!128339 (= (apply!188 lt!97346 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)) (get!2237 (select (arr!3876 (_values!3943 lt!96671)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 lt!96671) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!195131 () Bool)

(declare-fun lt!97343 () Unit!5878)

(declare-fun lt!97344 () Unit!5878)

(assert (=> b!195131 (= lt!97343 lt!97344)))

(declare-fun lt!97341 () V!5635)

(declare-fun lt!97340 () (_ BitVec 64))

(declare-fun lt!97345 () ListLongMap!2477)

(declare-fun lt!97342 () (_ BitVec 64))

(assert (=> b!195131 (not (contains!1379 (+!322 lt!97345 (tuple2!3561 lt!97342 lt!97341)) lt!97340))))

(assert (=> b!195131 (= lt!97344 (addStillNotContains!97 lt!97345 lt!97342 lt!97341 lt!97340))))

(assert (=> b!195131 (= lt!97340 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!195131 (= lt!97341 (get!2237 (select (arr!3876 (_values!3943 lt!96671)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 lt!96671) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195131 (= lt!97342 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000))))

(assert (=> b!195131 (= lt!97345 call!19723)))

(assert (=> b!195131 (= e!128342 (+!322 call!19723 (tuple2!3561 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000) (get!2237 (select (arr!3876 (_values!3943 lt!96671)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 lt!96671) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!57273 () Bool)

(assert (=> d!57273 e!128340))

(declare-fun res!92163 () Bool)

(assert (=> d!57273 (=> (not res!92163) (not e!128340))))

(assert (=> d!57273 (= res!92163 (not (contains!1379 lt!97346 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57273 (= lt!97346 e!128341)))

(declare-fun c!35301 () Bool)

(assert (=> d!57273 (= c!35301 (bvsge #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(assert (=> d!57273 (validMask!0 (mask!9223 lt!96671))))

(assert (=> d!57273 (= (getCurrentListMapNoExtraKeys!221 (_keys!5954 lt!96671) (_values!3943 lt!96671) (mask!9223 lt!96671) (extraKeys!3697 lt!96671) (zeroValue!3801 lt!96671) (minValue!3801 lt!96671) #b00000000000000000000000000000000 (defaultEntry!3960 lt!96671)) lt!97346)))

(declare-fun b!195140 () Bool)

(assert (=> b!195140 (= e!128343 e!128344)))

(declare-fun c!35302 () Bool)

(assert (=> b!195140 (= c!35302 (bvslt #b00000000000000000000000000000000 (size!4199 (_keys!5954 lt!96671))))))

(declare-fun b!195141 () Bool)

(declare-fun res!92162 () Bool)

(assert (=> b!195141 (=> (not res!92162) (not e!128340))))

(assert (=> b!195141 (= res!92162 (not (contains!1379 lt!97346 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57273 c!35301) b!195137))

(assert (= (and d!57273 (not c!35301)) b!195130))

(assert (= (and b!195130 c!35304) b!195131))

(assert (= (and b!195130 (not c!35304)) b!195133))

(assert (= (or b!195131 b!195133) bm!19720))

(assert (= (and d!57273 res!92163) b!195141))

(assert (= (and b!195141 res!92162) b!195135))

(assert (= (and b!195135 res!92161) b!195136))

(assert (= (and b!195135 c!35303) b!195134))

(assert (= (and b!195135 (not c!35303)) b!195140))

(assert (= (and b!195134 res!92160) b!195139))

(assert (= (and b!195140 c!35302) b!195138))

(assert (= (and b!195140 (not c!35302)) b!195132))

(declare-fun b_lambda!7517 () Bool)

(assert (=> (not b_lambda!7517) (not b!195139)))

(assert (=> b!195139 t!7381))

(declare-fun b_and!11461 () Bool)

(assert (= b_and!11459 (and (=> t!7381 result!4945) b_and!11461)))

(declare-fun b_lambda!7519 () Bool)

(assert (=> (not b_lambda!7519) (not b!195131)))

(assert (=> b!195131 t!7381))

(declare-fun b_and!11463 () Bool)

(assert (= b_and!11461 (and (=> t!7381 result!4945) b_and!11463)))

(declare-fun m!222599 () Bool)

(assert (=> d!57273 m!222599))

(assert (=> d!57273 m!221129))

(declare-fun m!222601 () Bool)

(assert (=> bm!19720 m!222601))

(declare-fun m!222603 () Bool)

(assert (=> b!195131 m!222603))

(declare-fun m!222605 () Bool)

(assert (=> b!195131 m!222605))

(assert (=> b!195131 m!221593))

(assert (=> b!195131 m!221589))

(assert (=> b!195131 m!221595))

(assert (=> b!195131 m!222605))

(declare-fun m!222607 () Bool)

(assert (=> b!195131 m!222607))

(assert (=> b!195131 m!221447))

(declare-fun m!222609 () Bool)

(assert (=> b!195131 m!222609))

(assert (=> b!195131 m!221589))

(assert (=> b!195131 m!221593))

(assert (=> b!195136 m!221447))

(assert (=> b!195136 m!221447))

(assert (=> b!195136 m!221449))

(declare-fun m!222611 () Bool)

(assert (=> b!195132 m!222611))

(assert (=> b!195134 m!221447))

(assert (=> b!195134 m!221447))

(declare-fun m!222613 () Bool)

(assert (=> b!195134 m!222613))

(declare-fun m!222615 () Bool)

(assert (=> b!195141 m!222615))

(assert (=> b!195138 m!222601))

(assert (=> b!195139 m!221593))

(assert (=> b!195139 m!221589))

(assert (=> b!195139 m!221595))

(assert (=> b!195139 m!221447))

(declare-fun m!222617 () Bool)

(assert (=> b!195139 m!222617))

(assert (=> b!195139 m!221447))

(assert (=> b!195139 m!221589))

(assert (=> b!195139 m!221593))

(assert (=> b!195130 m!221447))

(assert (=> b!195130 m!221447))

(assert (=> b!195130 m!221449))

(assert (=> b!194593 d!57273))

(declare-fun d!57275 () Bool)

(assert (=> d!57275 (= (apply!188 lt!97079 lt!97091) (get!2238 (getValueByKey!245 (toList!1254 lt!97079) lt!97091)))))

(declare-fun bs!7794 () Bool)

(assert (= bs!7794 d!57275))

(declare-fun m!222619 () Bool)

(assert (=> bs!7794 m!222619))

(assert (=> bs!7794 m!222619))

(declare-fun m!222621 () Bool)

(assert (=> bs!7794 m!222621))

(assert (=> b!194593 d!57275))

(declare-fun d!57277 () Bool)

(declare-fun e!128346 () Bool)

(assert (=> d!57277 e!128346))

(declare-fun res!92164 () Bool)

(assert (=> d!57277 (=> res!92164 e!128346)))

(declare-fun lt!97347 () Bool)

(assert (=> d!57277 (= res!92164 (not lt!97347))))

(declare-fun lt!97348 () Bool)

(assert (=> d!57277 (= lt!97347 lt!97348)))

(declare-fun lt!97349 () Unit!5878)

(declare-fun e!128345 () Unit!5878)

(assert (=> d!57277 (= lt!97349 e!128345)))

(declare-fun c!35305 () Bool)

(assert (=> d!57277 (= c!35305 lt!97348)))

(assert (=> d!57277 (= lt!97348 (containsKey!249 (toList!1254 lt!96897) (_1!1791 (tuple2!3561 key!828 v!309))))))

(assert (=> d!57277 (= (contains!1379 lt!96897 (_1!1791 (tuple2!3561 key!828 v!309))) lt!97347)))

(declare-fun b!195142 () Bool)

(declare-fun lt!97350 () Unit!5878)

(assert (=> b!195142 (= e!128345 lt!97350)))

(assert (=> b!195142 (= lt!97350 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96897) (_1!1791 (tuple2!3561 key!828 v!309))))))

(assert (=> b!195142 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96897) (_1!1791 (tuple2!3561 key!828 v!309))))))

(declare-fun b!195143 () Bool)

(declare-fun Unit!5925 () Unit!5878)

(assert (=> b!195143 (= e!128345 Unit!5925)))

(declare-fun b!195144 () Bool)

(assert (=> b!195144 (= e!128346 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96897) (_1!1791 (tuple2!3561 key!828 v!309)))))))

(assert (= (and d!57277 c!35305) b!195142))

(assert (= (and d!57277 (not c!35305)) b!195143))

(assert (= (and d!57277 (not res!92164)) b!195144))

(declare-fun m!222623 () Bool)

(assert (=> d!57277 m!222623))

(declare-fun m!222625 () Bool)

(assert (=> b!195142 m!222625))

(assert (=> b!195142 m!221071))

(assert (=> b!195142 m!221071))

(declare-fun m!222627 () Bool)

(assert (=> b!195142 m!222627))

(assert (=> b!195144 m!221071))

(assert (=> b!195144 m!221071))

(assert (=> b!195144 m!222627))

(assert (=> d!56691 d!57277))

(declare-fun b!195146 () Bool)

(declare-fun e!128347 () Option!251)

(declare-fun e!128348 () Option!251)

(assert (=> b!195146 (= e!128347 e!128348)))

(declare-fun c!35307 () Bool)

(assert (=> b!195146 (= c!35307 (and ((_ is Cons!2445) lt!96900) (not (= (_1!1791 (h!3086 lt!96900)) (_1!1791 (tuple2!3561 key!828 v!309))))))))

(declare-fun b!195145 () Bool)

(assert (=> b!195145 (= e!128347 (Some!250 (_2!1791 (h!3086 lt!96900))))))

(declare-fun b!195147 () Bool)

(assert (=> b!195147 (= e!128348 (getValueByKey!245 (t!7375 lt!96900) (_1!1791 (tuple2!3561 key!828 v!309))))))

(declare-fun d!57279 () Bool)

(declare-fun c!35306 () Bool)

(assert (=> d!57279 (= c!35306 (and ((_ is Cons!2445) lt!96900) (= (_1!1791 (h!3086 lt!96900)) (_1!1791 (tuple2!3561 key!828 v!309)))))))

(assert (=> d!57279 (= (getValueByKey!245 lt!96900 (_1!1791 (tuple2!3561 key!828 v!309))) e!128347)))

(declare-fun b!195148 () Bool)

(assert (=> b!195148 (= e!128348 None!249)))

(assert (= (and d!57279 c!35306) b!195145))

(assert (= (and d!57279 (not c!35306)) b!195146))

(assert (= (and b!195146 c!35307) b!195147))

(assert (= (and b!195146 (not c!35307)) b!195148))

(declare-fun m!222629 () Bool)

(assert (=> b!195147 m!222629))

(assert (=> d!56691 d!57279))

(declare-fun d!57281 () Bool)

(assert (=> d!57281 (= (getValueByKey!245 lt!96900 (_1!1791 (tuple2!3561 key!828 v!309))) (Some!250 (_2!1791 (tuple2!3561 key!828 v!309))))))

(declare-fun lt!97351 () Unit!5878)

(assert (=> d!57281 (= lt!97351 (choose!1068 lt!96900 (_1!1791 (tuple2!3561 key!828 v!309)) (_2!1791 (tuple2!3561 key!828 v!309))))))

(declare-fun e!128349 () Bool)

(assert (=> d!57281 e!128349))

(declare-fun res!92165 () Bool)

(assert (=> d!57281 (=> (not res!92165) (not e!128349))))

(assert (=> d!57281 (= res!92165 (isStrictlySorted!357 lt!96900))))

(assert (=> d!57281 (= (lemmaContainsTupThenGetReturnValue!132 lt!96900 (_1!1791 (tuple2!3561 key!828 v!309)) (_2!1791 (tuple2!3561 key!828 v!309))) lt!97351)))

(declare-fun b!195149 () Bool)

(declare-fun res!92166 () Bool)

(assert (=> b!195149 (=> (not res!92166) (not e!128349))))

(assert (=> b!195149 (= res!92166 (containsKey!249 lt!96900 (_1!1791 (tuple2!3561 key!828 v!309))))))

(declare-fun b!195150 () Bool)

(assert (=> b!195150 (= e!128349 (contains!1381 lt!96900 (tuple2!3561 (_1!1791 (tuple2!3561 key!828 v!309)) (_2!1791 (tuple2!3561 key!828 v!309)))))))

(assert (= (and d!57281 res!92165) b!195149))

(assert (= (and b!195149 res!92166) b!195150))

(assert (=> d!57281 m!221065))

(declare-fun m!222631 () Bool)

(assert (=> d!57281 m!222631))

(declare-fun m!222633 () Bool)

(assert (=> d!57281 m!222633))

(declare-fun m!222635 () Bool)

(assert (=> b!195149 m!222635))

(declare-fun m!222637 () Bool)

(assert (=> b!195150 m!222637))

(assert (=> d!56691 d!57281))

(declare-fun bm!19721 () Bool)

(declare-fun c!35309 () Bool)

(declare-fun call!19725 () List!2449)

(declare-fun e!128350 () List!2449)

(assert (=> bm!19721 (= call!19725 ($colon$colon!103 e!128350 (ite c!35309 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (tuple2!3561 (_1!1791 (tuple2!3561 key!828 v!309)) (_2!1791 (tuple2!3561 key!828 v!309))))))))

(declare-fun c!35308 () Bool)

(assert (=> bm!19721 (= c!35308 c!35309)))

(declare-fun b!195151 () Bool)

(declare-fun e!128354 () List!2449)

(declare-fun call!19724 () List!2449)

(assert (=> b!195151 (= e!128354 call!19724)))

(declare-fun c!35310 () Bool)

(declare-fun b!195152 () Bool)

(assert (=> b!195152 (= c!35310 (and ((_ is Cons!2445) (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (bvsgt (_1!1791 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))) (_1!1791 (tuple2!3561 key!828 v!309)))))))

(declare-fun e!128352 () List!2449)

(assert (=> b!195152 (= e!128354 e!128352)))

(declare-fun b!195153 () Bool)

(declare-fun e!128353 () Bool)

(declare-fun lt!97352 () List!2449)

(assert (=> b!195153 (= e!128353 (contains!1381 lt!97352 (tuple2!3561 (_1!1791 (tuple2!3561 key!828 v!309)) (_2!1791 (tuple2!3561 key!828 v!309)))))))

(declare-fun bm!19722 () Bool)

(declare-fun call!19726 () List!2449)

(assert (=> bm!19722 (= call!19726 call!19724)))

(declare-fun b!195154 () Bool)

(declare-fun e!128351 () List!2449)

(assert (=> b!195154 (= e!128351 e!128354)))

(declare-fun c!35311 () Bool)

(assert (=> b!195154 (= c!35311 (and ((_ is Cons!2445) (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (= (_1!1791 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))) (_1!1791 (tuple2!3561 key!828 v!309)))))))

(declare-fun d!57283 () Bool)

(assert (=> d!57283 e!128353))

(declare-fun res!92167 () Bool)

(assert (=> d!57283 (=> (not res!92167) (not e!128353))))

(assert (=> d!57283 (= res!92167 (isStrictlySorted!357 lt!97352))))

(assert (=> d!57283 (= lt!97352 e!128351)))

(assert (=> d!57283 (= c!35309 (and ((_ is Cons!2445) (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (bvslt (_1!1791 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))) (_1!1791 (tuple2!3561 key!828 v!309)))))))

(assert (=> d!57283 (isStrictlySorted!357 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))))

(assert (=> d!57283 (= (insertStrictlySorted!135 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (_1!1791 (tuple2!3561 key!828 v!309)) (_2!1791 (tuple2!3561 key!828 v!309))) lt!97352)))

(declare-fun bm!19723 () Bool)

(assert (=> bm!19723 (= call!19724 call!19725)))

(declare-fun b!195155 () Bool)

(assert (=> b!195155 (= e!128352 call!19726)))

(declare-fun b!195156 () Bool)

(assert (=> b!195156 (= e!128350 (insertStrictlySorted!135 (t!7375 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (_1!1791 (tuple2!3561 key!828 v!309)) (_2!1791 (tuple2!3561 key!828 v!309))))))

(declare-fun b!195157 () Bool)

(assert (=> b!195157 (= e!128352 call!19726)))

(declare-fun b!195158 () Bool)

(declare-fun res!92168 () Bool)

(assert (=> b!195158 (=> (not res!92168) (not e!128353))))

(assert (=> b!195158 (= res!92168 (containsKey!249 lt!97352 (_1!1791 (tuple2!3561 key!828 v!309))))))

(declare-fun b!195159 () Bool)

(assert (=> b!195159 (= e!128351 call!19725)))

(declare-fun b!195160 () Bool)

(assert (=> b!195160 (= e!128350 (ite c!35311 (t!7375 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (ite c!35310 (Cons!2445 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (t!7375 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) (_values!3943 thiss!1248) (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))) Nil!2446)))))

(assert (= (and d!57283 c!35309) b!195159))

(assert (= (and d!57283 (not c!35309)) b!195154))

(assert (= (and b!195154 c!35311) b!195151))

(assert (= (and b!195154 (not c!35311)) b!195152))

(assert (= (and b!195152 c!35310) b!195157))

(assert (= (and b!195152 (not c!35310)) b!195155))

(assert (= (or b!195157 b!195155) bm!19722))

(assert (= (or b!195151 bm!19722) bm!19723))

(assert (= (or b!195159 bm!19723) bm!19721))

(assert (= (and bm!19721 c!35308) b!195156))

(assert (= (and bm!19721 (not c!35308)) b!195160))

(assert (= (and d!57283 res!92167) b!195158))

(assert (= (and b!195158 res!92168) b!195153))

(declare-fun m!222639 () Bool)

(assert (=> bm!19721 m!222639))

(declare-fun m!222641 () Bool)

(assert (=> b!195158 m!222641))

(declare-fun m!222643 () Bool)

(assert (=> b!195153 m!222643))

(declare-fun m!222645 () Bool)

(assert (=> b!195156 m!222645))

(declare-fun m!222647 () Bool)

(assert (=> d!57283 m!222647))

(declare-fun m!222649 () Bool)

(assert (=> d!57283 m!222649))

(assert (=> d!56691 d!57283))

(declare-fun d!57285 () Bool)

(declare-fun res!92169 () Bool)

(declare-fun e!128355 () Bool)

(assert (=> d!57285 (=> res!92169 e!128355)))

(assert (=> d!57285 (= res!92169 (and ((_ is Cons!2445) (toList!1254 lt!96845)) (= (_1!1791 (h!3086 (toList!1254 lt!96845))) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!57285 (= (containsKey!249 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) e!128355)))

(declare-fun b!195161 () Bool)

(declare-fun e!128356 () Bool)

(assert (=> b!195161 (= e!128355 e!128356)))

(declare-fun res!92170 () Bool)

(assert (=> b!195161 (=> (not res!92170) (not e!128356))))

(assert (=> b!195161 (= res!92170 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96845))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96845))) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2445) (toList!1254 lt!96845)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96845))) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!195162 () Bool)

(assert (=> b!195162 (= e!128356 (containsKey!249 (t!7375 (toList!1254 lt!96845)) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57285 (not res!92169)) b!195161))

(assert (= (and b!195161 res!92170) b!195162))

(assert (=> b!195162 m!220877))

(declare-fun m!222651 () Bool)

(assert (=> b!195162 m!222651))

(assert (=> d!56849 d!57285))

(declare-fun d!57287 () Bool)

(assert (=> d!57287 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96729) (_1!1791 lt!96678))) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96729) (_1!1791 lt!96678)))))))

(declare-fun bs!7795 () Bool)

(assert (= bs!7795 d!57287))

(assert (=> bs!7795 m!220825))

(declare-fun m!222653 () Bool)

(assert (=> bs!7795 m!222653))

(assert (=> b!194313 d!57287))

(assert (=> b!194313 d!56795))

(declare-fun d!57289 () Bool)

(assert (=> d!57289 (= (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795)) (not (isEmpty!487 (getValueByKey!245 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795))))))

(declare-fun bs!7796 () Bool)

(assert (= bs!7796 d!57289))

(assert (=> bs!7796 m!221355))

(declare-fun m!222655 () Bool)

(assert (=> bs!7796 m!222655))

(assert (=> b!194434 d!57289))

(declare-fun b!195164 () Bool)

(declare-fun e!128357 () Option!251)

(declare-fun e!128358 () Option!251)

(assert (=> b!195164 (= e!128357 e!128358)))

(declare-fun c!35313 () Bool)

(assert (=> b!195164 (= c!35313 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))) (not (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))) lt!96795))))))

(declare-fun b!195163 () Bool)

(assert (=> b!195163 (= e!128357 (Some!250 (_2!1791 (h!3086 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))))

(declare-fun b!195165 () Bool)

(assert (=> b!195165 (= e!128358 (getValueByKey!245 (t!7375 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))) lt!96795))))

(declare-fun d!57291 () Bool)

(declare-fun c!35312 () Bool)

(assert (=> d!57291 (= c!35312 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))) (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))) lt!96795)))))

(assert (=> d!57291 (= (getValueByKey!245 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795) e!128357)))

(declare-fun b!195166 () Bool)

(assert (=> b!195166 (= e!128358 None!249)))

(assert (= (and d!57291 c!35312) b!195163))

(assert (= (and d!57291 (not c!35312)) b!195164))

(assert (= (and b!195164 c!35313) b!195165))

(assert (= (and b!195164 (not c!35313)) b!195166))

(declare-fun m!222657 () Bool)

(assert (=> b!195165 m!222657))

(assert (=> b!194434 d!57291))

(declare-fun d!57293 () Bool)

(assert (=> d!57293 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96811) lt!96797)) (v!4256 (getValueByKey!245 (toList!1254 lt!96811) lt!96797)))))

(assert (=> d!56779 d!57293))

(declare-fun b!195168 () Bool)

(declare-fun e!128359 () Option!251)

(declare-fun e!128360 () Option!251)

(assert (=> b!195168 (= e!128359 e!128360)))

(declare-fun c!35315 () Bool)

(assert (=> b!195168 (= c!35315 (and ((_ is Cons!2445) (toList!1254 lt!96811)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96811))) lt!96797))))))

(declare-fun b!195167 () Bool)

(assert (=> b!195167 (= e!128359 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96811)))))))

(declare-fun b!195169 () Bool)

(assert (=> b!195169 (= e!128360 (getValueByKey!245 (t!7375 (toList!1254 lt!96811)) lt!96797))))

(declare-fun d!57295 () Bool)

(declare-fun c!35314 () Bool)

(assert (=> d!57295 (= c!35314 (and ((_ is Cons!2445) (toList!1254 lt!96811)) (= (_1!1791 (h!3086 (toList!1254 lt!96811))) lt!96797)))))

(assert (=> d!57295 (= (getValueByKey!245 (toList!1254 lt!96811) lt!96797) e!128359)))

(declare-fun b!195170 () Bool)

(assert (=> b!195170 (= e!128360 None!249)))

(assert (= (and d!57295 c!35314) b!195167))

(assert (= (and d!57295 (not c!35314)) b!195168))

(assert (= (and b!195168 c!35315) b!195169))

(assert (= (and b!195168 (not c!35315)) b!195170))

(declare-fun m!222659 () Bool)

(assert (=> b!195169 m!222659))

(assert (=> d!56779 d!57295))

(declare-fun c!35317 () Bool)

(declare-fun e!128361 () List!2449)

(declare-fun call!19728 () List!2449)

(declare-fun bm!19724 () Bool)

(assert (=> bm!19724 (= call!19728 ($colon$colon!103 e!128361 (ite c!35317 (h!3086 (t!7375 (toList!1254 lt!96676))) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678)))))))

(declare-fun c!35316 () Bool)

(assert (=> bm!19724 (= c!35316 c!35317)))

(declare-fun b!195171 () Bool)

(declare-fun e!128365 () List!2449)

(declare-fun call!19727 () List!2449)

(assert (=> b!195171 (= e!128365 call!19727)))

(declare-fun b!195172 () Bool)

(declare-fun c!35318 () Bool)

(assert (=> b!195172 (= c!35318 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96676))) (bvsgt (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96676)))) (_1!1791 lt!96678))))))

(declare-fun e!128363 () List!2449)

(assert (=> b!195172 (= e!128365 e!128363)))

(declare-fun b!195173 () Bool)

(declare-fun e!128364 () Bool)

(declare-fun lt!97353 () List!2449)

(assert (=> b!195173 (= e!128364 (contains!1381 lt!97353 (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun bm!19725 () Bool)

(declare-fun call!19729 () List!2449)

(assert (=> bm!19725 (= call!19729 call!19727)))

(declare-fun b!195174 () Bool)

(declare-fun e!128362 () List!2449)

(assert (=> b!195174 (= e!128362 e!128365)))

(declare-fun c!35319 () Bool)

(assert (=> b!195174 (= c!35319 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96676))) (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96676)))) (_1!1791 lt!96678))))))

(declare-fun d!57297 () Bool)

(assert (=> d!57297 e!128364))

(declare-fun res!92171 () Bool)

(assert (=> d!57297 (=> (not res!92171) (not e!128364))))

(assert (=> d!57297 (= res!92171 (isStrictlySorted!357 lt!97353))))

(assert (=> d!57297 (= lt!97353 e!128362)))

(assert (=> d!57297 (= c!35317 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96676))) (bvslt (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96676)))) (_1!1791 lt!96678))))))

(assert (=> d!57297 (isStrictlySorted!357 (t!7375 (toList!1254 lt!96676)))))

(assert (=> d!57297 (= (insertStrictlySorted!135 (t!7375 (toList!1254 lt!96676)) (_1!1791 lt!96678) (_2!1791 lt!96678)) lt!97353)))

(declare-fun bm!19726 () Bool)

(assert (=> bm!19726 (= call!19727 call!19728)))

(declare-fun b!195175 () Bool)

(assert (=> b!195175 (= e!128363 call!19729)))

(declare-fun b!195176 () Bool)

(assert (=> b!195176 (= e!128361 (insertStrictlySorted!135 (t!7375 (t!7375 (toList!1254 lt!96676))) (_1!1791 lt!96678) (_2!1791 lt!96678)))))

(declare-fun b!195177 () Bool)

(assert (=> b!195177 (= e!128363 call!19729)))

(declare-fun b!195178 () Bool)

(declare-fun res!92172 () Bool)

(assert (=> b!195178 (=> (not res!92172) (not e!128364))))

(assert (=> b!195178 (= res!92172 (containsKey!249 lt!97353 (_1!1791 lt!96678)))))

(declare-fun b!195179 () Bool)

(assert (=> b!195179 (= e!128362 call!19728)))

(declare-fun b!195180 () Bool)

(assert (=> b!195180 (= e!128361 (ite c!35319 (t!7375 (t!7375 (toList!1254 lt!96676))) (ite c!35318 (Cons!2445 (h!3086 (t!7375 (toList!1254 lt!96676))) (t!7375 (t!7375 (toList!1254 lt!96676)))) Nil!2446)))))

(assert (= (and d!57297 c!35317) b!195179))

(assert (= (and d!57297 (not c!35317)) b!195174))

(assert (= (and b!195174 c!35319) b!195171))

(assert (= (and b!195174 (not c!35319)) b!195172))

(assert (= (and b!195172 c!35318) b!195177))

(assert (= (and b!195172 (not c!35318)) b!195175))

(assert (= (or b!195177 b!195175) bm!19725))

(assert (= (or b!195171 bm!19725) bm!19726))

(assert (= (or b!195179 bm!19726) bm!19724))

(assert (= (and bm!19724 c!35316) b!195176))

(assert (= (and bm!19724 (not c!35316)) b!195180))

(assert (= (and d!57297 res!92171) b!195178))

(assert (= (and b!195178 res!92172) b!195173))

(declare-fun m!222661 () Bool)

(assert (=> bm!19724 m!222661))

(declare-fun m!222663 () Bool)

(assert (=> b!195178 m!222663))

(declare-fun m!222665 () Bool)

(assert (=> b!195173 m!222665))

(declare-fun m!222667 () Bool)

(assert (=> b!195176 m!222667))

(declare-fun m!222669 () Bool)

(assert (=> d!57297 m!222669))

(assert (=> d!57297 m!222301))

(assert (=> b!194626 d!57297))

(declare-fun d!57299 () Bool)

(declare-fun e!128367 () Bool)

(assert (=> d!57299 e!128367))

(declare-fun res!92173 () Bool)

(assert (=> d!57299 (=> res!92173 e!128367)))

(declare-fun lt!97354 () Bool)

(assert (=> d!57299 (= res!92173 (not lt!97354))))

(declare-fun lt!97355 () Bool)

(assert (=> d!57299 (= lt!97354 lt!97355)))

(declare-fun lt!97356 () Unit!5878)

(declare-fun e!128366 () Unit!5878)

(assert (=> d!57299 (= lt!97356 e!128366)))

(declare-fun c!35320 () Bool)

(assert (=> d!57299 (= c!35320 lt!97355)))

(assert (=> d!57299 (= lt!97355 (containsKey!249 (toList!1254 lt!97035) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> d!57299 (= (contains!1379 lt!97035 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!97354)))

(declare-fun b!195181 () Bool)

(declare-fun lt!97357 () Unit!5878)

(assert (=> b!195181 (= e!128366 lt!97357)))

(assert (=> b!195181 (= lt!97357 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97035) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(assert (=> b!195181 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97035) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!195182 () Bool)

(declare-fun Unit!5926 () Unit!5878)

(assert (=> b!195182 (= e!128366 Unit!5926)))

(declare-fun b!195183 () Bool)

(assert (=> b!195183 (= e!128367 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97035) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (= (and d!57299 c!35320) b!195181))

(assert (= (and d!57299 (not c!35320)) b!195182))

(assert (= (and d!57299 (not res!92173)) b!195183))

(declare-fun m!222671 () Bool)

(assert (=> d!57299 m!222671))

(declare-fun m!222673 () Bool)

(assert (=> b!195181 m!222673))

(assert (=> b!195181 m!221471))

(assert (=> b!195181 m!221471))

(declare-fun m!222675 () Bool)

(assert (=> b!195181 m!222675))

(assert (=> b!195183 m!221471))

(assert (=> b!195183 m!221471))

(assert (=> b!195183 m!222675))

(assert (=> d!56799 d!57299))

(declare-fun b!195185 () Bool)

(declare-fun e!128368 () Option!251)

(declare-fun e!128369 () Option!251)

(assert (=> b!195185 (= e!128368 e!128369)))

(declare-fun c!35322 () Bool)

(assert (=> b!195185 (= c!35322 (and ((_ is Cons!2445) lt!97038) (not (= (_1!1791 (h!3086 lt!97038)) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun b!195184 () Bool)

(assert (=> b!195184 (= e!128368 (Some!250 (_2!1791 (h!3086 lt!97038))))))

(declare-fun b!195186 () Bool)

(assert (=> b!195186 (= e!128369 (getValueByKey!245 (t!7375 lt!97038) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun d!57301 () Bool)

(declare-fun c!35321 () Bool)

(assert (=> d!57301 (= c!35321 (and ((_ is Cons!2445) lt!97038) (= (_1!1791 (h!3086 lt!97038)) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!57301 (= (getValueByKey!245 lt!97038 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) e!128368)))

(declare-fun b!195187 () Bool)

(assert (=> b!195187 (= e!128369 None!249)))

(assert (= (and d!57301 c!35321) b!195184))

(assert (= (and d!57301 (not c!35321)) b!195185))

(assert (= (and b!195185 c!35322) b!195186))

(assert (= (and b!195185 (not c!35322)) b!195187))

(declare-fun m!222677 () Bool)

(assert (=> b!195186 m!222677))

(assert (=> d!56799 d!57301))

(declare-fun d!57303 () Bool)

(assert (=> d!57303 (= (getValueByKey!245 lt!97038 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97358 () Unit!5878)

(assert (=> d!57303 (= lt!97358 (choose!1068 lt!97038 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun e!128370 () Bool)

(assert (=> d!57303 e!128370))

(declare-fun res!92174 () Bool)

(assert (=> d!57303 (=> (not res!92174) (not e!128370))))

(assert (=> d!57303 (= res!92174 (isStrictlySorted!357 lt!97038))))

(assert (=> d!57303 (= (lemmaContainsTupThenGetReturnValue!132 lt!97038 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!97358)))

(declare-fun b!195188 () Bool)

(declare-fun res!92175 () Bool)

(assert (=> b!195188 (=> (not res!92175) (not e!128370))))

(assert (=> b!195188 (= res!92175 (containsKey!249 lt!97038 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!195189 () Bool)

(assert (=> b!195189 (= e!128370 (contains!1381 lt!97038 (tuple2!3561 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (= (and d!57303 res!92174) b!195188))

(assert (= (and b!195188 res!92175) b!195189))

(assert (=> d!57303 m!221465))

(declare-fun m!222679 () Bool)

(assert (=> d!57303 m!222679))

(declare-fun m!222681 () Bool)

(assert (=> d!57303 m!222681))

(declare-fun m!222683 () Bool)

(assert (=> b!195188 m!222683))

(declare-fun m!222685 () Bool)

(assert (=> b!195189 m!222685))

(assert (=> d!56799 d!57303))

(declare-fun c!35324 () Bool)

(declare-fun bm!19727 () Bool)

(declare-fun e!128371 () List!2449)

(declare-fun call!19731 () List!2449)

(assert (=> bm!19727 (= call!19731 ($colon$colon!103 e!128371 (ite c!35324 (h!3086 (toList!1254 call!19641)) (tuple2!3561 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun c!35323 () Bool)

(assert (=> bm!19727 (= c!35323 c!35324)))

(declare-fun b!195190 () Bool)

(declare-fun e!128375 () List!2449)

(declare-fun call!19730 () List!2449)

(assert (=> b!195190 (= e!128375 call!19730)))

(declare-fun b!195191 () Bool)

(declare-fun c!35325 () Bool)

(assert (=> b!195191 (= c!35325 (and ((_ is Cons!2445) (toList!1254 call!19641)) (bvsgt (_1!1791 (h!3086 (toList!1254 call!19641))) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun e!128373 () List!2449)

(assert (=> b!195191 (= e!128375 e!128373)))

(declare-fun b!195192 () Bool)

(declare-fun e!128374 () Bool)

(declare-fun lt!97359 () List!2449)

(assert (=> b!195192 (= e!128374 (contains!1381 lt!97359 (tuple2!3561 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun bm!19728 () Bool)

(declare-fun call!19732 () List!2449)

(assert (=> bm!19728 (= call!19732 call!19730)))

(declare-fun b!195193 () Bool)

(declare-fun e!128372 () List!2449)

(assert (=> b!195193 (= e!128372 e!128375)))

(declare-fun c!35326 () Bool)

(assert (=> b!195193 (= c!35326 (and ((_ is Cons!2445) (toList!1254 call!19641)) (= (_1!1791 (h!3086 (toList!1254 call!19641))) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun d!57305 () Bool)

(assert (=> d!57305 e!128374))

(declare-fun res!92176 () Bool)

(assert (=> d!57305 (=> (not res!92176) (not e!128374))))

(assert (=> d!57305 (= res!92176 (isStrictlySorted!357 lt!97359))))

(assert (=> d!57305 (= lt!97359 e!128372)))

(assert (=> d!57305 (= c!35324 (and ((_ is Cons!2445) (toList!1254 call!19641)) (bvslt (_1!1791 (h!3086 (toList!1254 call!19641))) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!57305 (isStrictlySorted!357 (toList!1254 call!19641))))

(assert (=> d!57305 (= (insertStrictlySorted!135 (toList!1254 call!19641) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) lt!97359)))

(declare-fun bm!19729 () Bool)

(assert (=> bm!19729 (= call!19730 call!19731)))

(declare-fun b!195194 () Bool)

(assert (=> b!195194 (= e!128373 call!19732)))

(declare-fun b!195195 () Bool)

(assert (=> b!195195 (= e!128371 (insertStrictlySorted!135 (t!7375 (toList!1254 call!19641)) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!195196 () Bool)

(assert (=> b!195196 (= e!128373 call!19732)))

(declare-fun b!195197 () Bool)

(declare-fun res!92177 () Bool)

(assert (=> b!195197 (=> (not res!92177) (not e!128374))))

(assert (=> b!195197 (= res!92177 (containsKey!249 lt!97359 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun b!195198 () Bool)

(assert (=> b!195198 (= e!128372 call!19731)))

(declare-fun b!195199 () Bool)

(assert (=> b!195199 (= e!128371 (ite c!35326 (t!7375 (toList!1254 call!19641)) (ite c!35325 (Cons!2445 (h!3086 (toList!1254 call!19641)) (t!7375 (toList!1254 call!19641))) Nil!2446)))))

(assert (= (and d!57305 c!35324) b!195198))

(assert (= (and d!57305 (not c!35324)) b!195193))

(assert (= (and b!195193 c!35326) b!195190))

(assert (= (and b!195193 (not c!35326)) b!195191))

(assert (= (and b!195191 c!35325) b!195196))

(assert (= (and b!195191 (not c!35325)) b!195194))

(assert (= (or b!195196 b!195194) bm!19728))

(assert (= (or b!195190 bm!19728) bm!19729))

(assert (= (or b!195198 bm!19729) bm!19727))

(assert (= (and bm!19727 c!35323) b!195195))

(assert (= (and bm!19727 (not c!35323)) b!195199))

(assert (= (and d!57305 res!92176) b!195197))

(assert (= (and b!195197 res!92177) b!195192))

(declare-fun m!222687 () Bool)

(assert (=> bm!19727 m!222687))

(declare-fun m!222689 () Bool)

(assert (=> b!195197 m!222689))

(declare-fun m!222691 () Bool)

(assert (=> b!195192 m!222691))

(declare-fun m!222693 () Bool)

(assert (=> b!195195 m!222693))

(declare-fun m!222695 () Bool)

(assert (=> d!57305 m!222695))

(declare-fun m!222697 () Bool)

(assert (=> d!57305 m!222697))

(assert (=> d!56799 d!57305))

(declare-fun d!57307 () Bool)

(assert (=> d!57307 (= (get!2240 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194568 d!57307))

(declare-fun b!195200 () Bool)

(declare-fun e!128379 () ListLongMap!2477)

(declare-fun e!128380 () ListLongMap!2477)

(assert (=> b!195200 (= e!128379 e!128380)))

(declare-fun c!35330 () Bool)

(assert (=> b!195200 (= c!35330 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195202 () Bool)

(declare-fun e!128382 () Bool)

(declare-fun lt!97366 () ListLongMap!2477)

(assert (=> b!195202 (= e!128382 (isEmpty!488 lt!97366))))

(declare-fun b!195203 () Bool)

(declare-fun call!19733 () ListLongMap!2477)

(assert (=> b!195203 (= e!128380 call!19733)))

(declare-fun b!195204 () Bool)

(declare-fun e!128381 () Bool)

(declare-fun e!128377 () Bool)

(assert (=> b!195204 (= e!128381 e!128377)))

(assert (=> b!195204 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun res!92178 () Bool)

(assert (=> b!195204 (= res!92178 (contains!1379 lt!97366 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195204 (=> (not res!92178) (not e!128377))))

(declare-fun b!195205 () Bool)

(declare-fun e!128378 () Bool)

(assert (=> b!195205 (= e!128378 e!128381)))

(declare-fun c!35329 () Bool)

(declare-fun e!128376 () Bool)

(assert (=> b!195205 (= c!35329 e!128376)))

(declare-fun res!92179 () Bool)

(assert (=> b!195205 (=> (not res!92179) (not e!128376))))

(assert (=> b!195205 (= res!92179 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!195206 () Bool)

(assert (=> b!195206 (= e!128376 (validKeyInArray!0 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195206 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!195207 () Bool)

(assert (=> b!195207 (= e!128379 (ListLongMap!2478 Nil!2446))))

(declare-fun b!195208 () Bool)

(assert (=> b!195208 (= e!128382 (= lt!97366 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248))))))

(declare-fun bm!19730 () Bool)

(assert (=> bm!19730 (= call!19733 (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248)))))

(declare-fun b!195209 () Bool)

(assert (=> b!195209 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> b!195209 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4200 lt!96681)))))

(assert (=> b!195209 (= e!128377 (= (apply!188 lt!97366 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!2237 (select (arr!3876 lt!96681) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!195201 () Bool)

(declare-fun lt!97363 () Unit!5878)

(declare-fun lt!97364 () Unit!5878)

(assert (=> b!195201 (= lt!97363 lt!97364)))

(declare-fun lt!97365 () ListLongMap!2477)

(declare-fun lt!97360 () (_ BitVec 64))

(declare-fun lt!97362 () (_ BitVec 64))

(declare-fun lt!97361 () V!5635)

(assert (=> b!195201 (not (contains!1379 (+!322 lt!97365 (tuple2!3561 lt!97362 lt!97361)) lt!97360))))

(assert (=> b!195201 (= lt!97364 (addStillNotContains!97 lt!97365 lt!97362 lt!97361 lt!97360))))

(assert (=> b!195201 (= lt!97360 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!195201 (= lt!97361 (get!2237 (select (arr!3876 lt!96681) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195201 (= lt!97362 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!195201 (= lt!97365 call!19733)))

(assert (=> b!195201 (= e!128380 (+!322 call!19733 (tuple2!3561 (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!2237 (select (arr!3876 lt!96681) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!57309 () Bool)

(assert (=> d!57309 e!128378))

(declare-fun res!92181 () Bool)

(assert (=> d!57309 (=> (not res!92181) (not e!128378))))

(assert (=> d!57309 (= res!92181 (not (contains!1379 lt!97366 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57309 (= lt!97366 e!128379)))

(declare-fun c!35327 () Bool)

(assert (=> d!57309 (= c!35327 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(assert (=> d!57309 (validMask!0 (mask!9223 thiss!1248))))

(assert (=> d!57309 (= (getCurrentListMapNoExtraKeys!221 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3960 thiss!1248)) lt!97366)))

(declare-fun b!195210 () Bool)

(assert (=> b!195210 (= e!128381 e!128382)))

(declare-fun c!35328 () Bool)

(assert (=> b!195210 (= c!35328 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!195211 () Bool)

(declare-fun res!92180 () Bool)

(assert (=> b!195211 (=> (not res!92180) (not e!128378))))

(assert (=> b!195211 (= res!92180 (not (contains!1379 lt!97366 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57309 c!35327) b!195207))

(assert (= (and d!57309 (not c!35327)) b!195200))

(assert (= (and b!195200 c!35330) b!195201))

(assert (= (and b!195200 (not c!35330)) b!195203))

(assert (= (or b!195201 b!195203) bm!19730))

(assert (= (and d!57309 res!92181) b!195211))

(assert (= (and b!195211 res!92180) b!195205))

(assert (= (and b!195205 res!92179) b!195206))

(assert (= (and b!195205 c!35329) b!195204))

(assert (= (and b!195205 (not c!35329)) b!195210))

(assert (= (and b!195204 res!92178) b!195209))

(assert (= (and b!195210 c!35328) b!195208))

(assert (= (and b!195210 (not c!35328)) b!195202))

(declare-fun b_lambda!7521 () Bool)

(assert (=> (not b_lambda!7521) (not b!195209)))

(assert (=> b!195209 t!7378))

(declare-fun b_and!11465 () Bool)

(assert (= b_and!11463 (and (=> t!7378 result!4939) b_and!11465)))

(declare-fun b_lambda!7523 () Bool)

(assert (=> (not b_lambda!7523) (not b!195201)))

(assert (=> b!195201 t!7378))

(declare-fun b_and!11467 () Bool)

(assert (= b_and!11465 (and (=> t!7378 result!4939) b_and!11467)))

(declare-fun m!222699 () Bool)

(assert (=> d!57309 m!222699))

(assert (=> d!57309 m!220855))

(declare-fun m!222701 () Bool)

(assert (=> bm!19730 m!222701))

(declare-fun m!222703 () Bool)

(assert (=> b!195201 m!222703))

(declare-fun m!222705 () Bool)

(assert (=> b!195201 m!222705))

(declare-fun m!222707 () Bool)

(assert (=> b!195201 m!222707))

(assert (=> b!195201 m!220881))

(declare-fun m!222709 () Bool)

(assert (=> b!195201 m!222709))

(assert (=> b!195201 m!222705))

(declare-fun m!222711 () Bool)

(assert (=> b!195201 m!222711))

(assert (=> b!195201 m!221983))

(declare-fun m!222713 () Bool)

(assert (=> b!195201 m!222713))

(assert (=> b!195201 m!220881))

(assert (=> b!195201 m!222707))

(assert (=> b!195206 m!221983))

(assert (=> b!195206 m!221983))

(assert (=> b!195206 m!221985))

(declare-fun m!222715 () Bool)

(assert (=> b!195202 m!222715))

(assert (=> b!195204 m!221983))

(assert (=> b!195204 m!221983))

(declare-fun m!222717 () Bool)

(assert (=> b!195204 m!222717))

(declare-fun m!222719 () Bool)

(assert (=> b!195211 m!222719))

(assert (=> b!195208 m!222701))

(assert (=> b!195209 m!222707))

(assert (=> b!195209 m!220881))

(assert (=> b!195209 m!222709))

(assert (=> b!195209 m!221983))

(declare-fun m!222721 () Bool)

(assert (=> b!195209 m!222721))

(assert (=> b!195209 m!221983))

(assert (=> b!195209 m!220881))

(assert (=> b!195209 m!222707))

(assert (=> b!195200 m!221983))

(assert (=> b!195200 m!221983))

(assert (=> b!195200 m!221985))

(assert (=> bm!19663 d!57309))

(declare-fun d!57311 () Bool)

(declare-fun res!92182 () Bool)

(declare-fun e!128383 () Bool)

(assert (=> d!57311 (=> res!92182 e!128383)))

(assert (=> d!57311 (= res!92182 (and ((_ is Cons!2445) (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (= (_1!1791 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(assert (=> d!57311 (= (containsKey!249 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) e!128383)))

(declare-fun b!195212 () Bool)

(declare-fun e!128384 () Bool)

(assert (=> b!195212 (= e!128383 e!128384)))

(declare-fun res!92183 () Bool)

(assert (=> b!195212 (=> (not res!92183) (not e!128384))))

(assert (=> b!195212 (= res!92183 (and (or (not ((_ is Cons!2445) (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))) (bvsle (_1!1791 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))) ((_ is Cons!2445) (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (bvslt (_1!1791 (h!3086 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248))))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677)))))))

(declare-fun b!195213 () Bool)

(assert (=> b!195213 (= e!128384 (containsKey!249 (t!7375 (toList!1254 (getCurrentListMap!902 (_keys!5954 thiss!1248) lt!96681 (mask!9223 thiss!1248) (extraKeys!3697 thiss!1248) (zeroValue!3801 thiss!1248) (minValue!3801 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3960 thiss!1248)))) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (= (and d!57311 (not res!92182)) b!195212))

(assert (= (and b!195212 res!92183) b!195213))

(assert (=> b!195213 m!220759))

(declare-fun m!222723 () Bool)

(assert (=> b!195213 m!222723))

(assert (=> d!56681 d!57311))

(assert (=> b!194396 d!56677))

(declare-fun d!57313 () Bool)

(assert (=> d!57313 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!97367 () Unit!5878)

(assert (=> d!57313 (= lt!97367 (choose!1067 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!128385 () Bool)

(assert (=> d!57313 e!128385))

(declare-fun res!92184 () Bool)

(assert (=> d!57313 (=> (not res!92184) (not e!128385))))

(assert (=> d!57313 (= res!92184 (isStrictlySorted!357 (toList!1254 lt!96845)))))

(assert (=> d!57313 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) lt!97367)))

(declare-fun b!195214 () Bool)

(assert (=> b!195214 (= e!128385 (containsKey!249 (toList!1254 lt!96845) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57313 res!92184) b!195214))

(assert (=> d!57313 m!220877))

(assert (=> d!57313 m!221525))

(assert (=> d!57313 m!221525))

(assert (=> d!57313 m!221577))

(assert (=> d!57313 m!220877))

(declare-fun m!222725 () Bool)

(assert (=> d!57313 m!222725))

(assert (=> d!57313 m!221689))

(assert (=> b!195214 m!220877))

(assert (=> b!195214 m!221573))

(assert (=> b!194585 d!57313))

(assert (=> b!194585 d!57129))

(assert (=> b!194585 d!57131))

(declare-fun b!195216 () Bool)

(declare-fun e!128386 () Option!251)

(declare-fun e!128387 () Option!251)

(assert (=> b!195216 (= e!128386 e!128387)))

(declare-fun c!35332 () Bool)

(assert (=> b!195216 (= c!35332 (and ((_ is Cons!2445) (toList!1254 lt!96980)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96980))) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))))

(declare-fun b!195215 () Bool)

(assert (=> b!195215 (= e!128386 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96980)))))))

(declare-fun b!195217 () Bool)

(assert (=> b!195217 (= e!128387 (getValueByKey!245 (t!7375 (toList!1254 lt!96980)) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))))

(declare-fun d!57315 () Bool)

(declare-fun c!35331 () Bool)

(assert (=> d!57315 (= c!35331 (and ((_ is Cons!2445) (toList!1254 lt!96980)) (= (_1!1791 (h!3086 (toList!1254 lt!96980))) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57315 (= (getValueByKey!245 (toList!1254 lt!96980) (_1!1791 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) e!128386)))

(declare-fun b!195218 () Bool)

(assert (=> b!195218 (= e!128387 None!249)))

(assert (= (and d!57315 c!35331) b!195215))

(assert (= (and d!57315 (not c!35331)) b!195216))

(assert (= (and b!195216 c!35332) b!195217))

(assert (= (and b!195216 (not c!35332)) b!195218))

(declare-fun m!222727 () Bool)

(assert (=> b!195217 m!222727))

(assert (=> b!194413 d!57315))

(declare-fun d!57317 () Bool)

(declare-fun lt!97368 () Bool)

(assert (=> d!57317 (= lt!97368 (select (content!155 (toList!1254 lt!96897)) (tuple2!3561 key!828 v!309)))))

(declare-fun e!128389 () Bool)

(assert (=> d!57317 (= lt!97368 e!128389)))

(declare-fun res!92185 () Bool)

(assert (=> d!57317 (=> (not res!92185) (not e!128389))))

(assert (=> d!57317 (= res!92185 ((_ is Cons!2445) (toList!1254 lt!96897)))))

(assert (=> d!57317 (= (contains!1381 (toList!1254 lt!96897) (tuple2!3561 key!828 v!309)) lt!97368)))

(declare-fun b!195219 () Bool)

(declare-fun e!128388 () Bool)

(assert (=> b!195219 (= e!128389 e!128388)))

(declare-fun res!92186 () Bool)

(assert (=> b!195219 (=> res!92186 e!128388)))

(assert (=> b!195219 (= res!92186 (= (h!3086 (toList!1254 lt!96897)) (tuple2!3561 key!828 v!309)))))

(declare-fun b!195220 () Bool)

(assert (=> b!195220 (= e!128388 (contains!1381 (t!7375 (toList!1254 lt!96897)) (tuple2!3561 key!828 v!309)))))

(assert (= (and d!57317 res!92185) b!195219))

(assert (= (and b!195219 (not res!92186)) b!195220))

(declare-fun m!222729 () Bool)

(assert (=> d!57317 m!222729))

(declare-fun m!222731 () Bool)

(assert (=> d!57317 m!222731))

(declare-fun m!222733 () Bool)

(assert (=> b!195220 m!222733))

(assert (=> b!194268 d!57317))

(assert (=> b!194236 d!56677))

(declare-fun d!57319 () Bool)

(declare-fun lt!97369 () Bool)

(assert (=> d!57319 (= lt!97369 (select (content!155 (t!7375 (toList!1254 lt!96729))) lt!96678))))

(declare-fun e!128391 () Bool)

(assert (=> d!57319 (= lt!97369 e!128391)))

(declare-fun res!92187 () Bool)

(assert (=> d!57319 (=> (not res!92187) (not e!128391))))

(assert (=> d!57319 (= res!92187 ((_ is Cons!2445) (t!7375 (toList!1254 lt!96729))))))

(assert (=> d!57319 (= (contains!1381 (t!7375 (toList!1254 lt!96729)) lt!96678) lt!97369)))

(declare-fun b!195221 () Bool)

(declare-fun e!128390 () Bool)

(assert (=> b!195221 (= e!128391 e!128390)))

(declare-fun res!92188 () Bool)

(assert (=> b!195221 (=> res!92188 e!128390)))

(assert (=> b!195221 (= res!92188 (= (h!3086 (t!7375 (toList!1254 lt!96729))) lt!96678))))

(declare-fun b!195222 () Bool)

(assert (=> b!195222 (= e!128390 (contains!1381 (t!7375 (t!7375 (toList!1254 lt!96729))) lt!96678))))

(assert (= (and d!57319 res!92187) b!195221))

(assert (= (and b!195221 (not res!92188)) b!195222))

(assert (=> d!57319 m!222441))

(declare-fun m!222735 () Bool)

(assert (=> d!57319 m!222735))

(declare-fun m!222737 () Bool)

(assert (=> b!195222 m!222737))

(assert (=> b!194584 d!57319))

(declare-fun b!195224 () Bool)

(declare-fun e!128392 () Option!251)

(declare-fun e!128393 () Option!251)

(assert (=> b!195224 (= e!128392 e!128393)))

(declare-fun c!35334 () Bool)

(assert (=> b!195224 (= c!35334 (and ((_ is Cons!2445) (toList!1254 lt!97035)) (not (= (_1!1791 (h!3086 (toList!1254 lt!97035))) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun b!195223 () Bool)

(assert (=> b!195223 (= e!128392 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!97035)))))))

(declare-fun b!195225 () Bool)

(assert (=> b!195225 (= e!128393 (getValueByKey!245 (t!7375 (toList!1254 lt!97035)) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))

(declare-fun d!57321 () Bool)

(declare-fun c!35333 () Bool)

(assert (=> d!57321 (= c!35333 (and ((_ is Cons!2445) (toList!1254 lt!97035)) (= (_1!1791 (h!3086 (toList!1254 lt!97035))) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!57321 (= (getValueByKey!245 (toList!1254 lt!97035) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) e!128392)))

(declare-fun b!195226 () Bool)

(assert (=> b!195226 (= e!128393 None!249)))

(assert (= (and d!57321 c!35333) b!195223))

(assert (= (and d!57321 (not c!35333)) b!195224))

(assert (= (and b!195224 c!35334) b!195225))

(assert (= (and b!195224 (not c!35334)) b!195226))

(declare-fun m!222739 () Bool)

(assert (=> b!195225 m!222739))

(assert (=> b!194466 d!57321))

(declare-fun d!57323 () Bool)

(assert (=> d!57323 (= (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!487 (getValueByKey!245 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7797 () Bool)

(assert (= bs!7797 d!57323))

(assert (=> bs!7797 m!221509))

(declare-fun m!222741 () Bool)

(assert (=> bs!7797 m!222741))

(assert (=> b!194501 d!57323))

(assert (=> b!194501 d!57105))

(declare-fun b!195228 () Bool)

(declare-fun e!128394 () Option!251)

(declare-fun e!128395 () Option!251)

(assert (=> b!195228 (= e!128394 e!128395)))

(declare-fun c!35336 () Bool)

(assert (=> b!195228 (= c!35336 (and ((_ is Cons!2445) (toList!1254 lt!96926)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96926))) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))))

(declare-fun b!195227 () Bool)

(assert (=> b!195227 (= e!128394 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96926)))))))

(declare-fun b!195229 () Bool)

(assert (=> b!195229 (= e!128395 (getValueByKey!245 (t!7375 (toList!1254 lt!96926)) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun d!57325 () Bool)

(declare-fun c!35335 () Bool)

(assert (=> d!57325 (= c!35335 (and ((_ is Cons!2445) (toList!1254 lt!96926)) (= (_1!1791 (h!3086 (toList!1254 lt!96926))) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(assert (=> d!57325 (= (getValueByKey!245 (toList!1254 lt!96926) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) e!128394)))

(declare-fun b!195230 () Bool)

(assert (=> b!195230 (= e!128395 None!249)))

(assert (= (and d!57325 c!35335) b!195227))

(assert (= (and d!57325 (not c!35335)) b!195228))

(assert (= (and b!195228 c!35336) b!195229))

(assert (= (and b!195228 (not c!35336)) b!195230))

(declare-fun m!222743 () Bool)

(assert (=> b!195229 m!222743))

(assert (=> b!194309 d!57325))

(declare-fun b!195232 () Bool)

(declare-fun e!128396 () Option!251)

(declare-fun e!128397 () Option!251)

(assert (=> b!195232 (= e!128396 e!128397)))

(declare-fun c!35338 () Bool)

(assert (=> b!195232 (= c!35338 (and ((_ is Cons!2445) (toList!1254 lt!97002)) (not (= (_1!1791 (h!3086 (toList!1254 lt!97002))) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))))

(declare-fun b!195231 () Bool)

(assert (=> b!195231 (= e!128396 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!97002)))))))

(declare-fun b!195233 () Bool)

(assert (=> b!195233 (= e!128397 (getValueByKey!245 (t!7375 (toList!1254 lt!97002)) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(declare-fun c!35337 () Bool)

(declare-fun d!57327 () Bool)

(assert (=> d!57327 (= c!35337 (and ((_ is Cons!2445) (toList!1254 lt!97002)) (= (_1!1791 (h!3086 (toList!1254 lt!97002))) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))))

(assert (=> d!57327 (= (getValueByKey!245 (toList!1254 lt!97002) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) e!128396)))

(declare-fun b!195234 () Bool)

(assert (=> b!195234 (= e!128397 None!249)))

(assert (= (and d!57327 c!35337) b!195231))

(assert (= (and d!57327 (not c!35337)) b!195232))

(assert (= (and b!195232 c!35338) b!195233))

(assert (= (and b!195232 (not c!35338)) b!195234))

(declare-fun m!222745 () Bool)

(assert (=> b!195233 m!222745))

(assert (=> b!194430 d!57327))

(declare-fun d!57329 () Bool)

(assert (=> d!57329 (= (apply!188 lt!96914 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2238 (getValueByKey!245 (toList!1254 lt!96914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7798 () Bool)

(assert (= bs!7798 d!57329))

(declare-fun m!222747 () Bool)

(assert (=> bs!7798 m!222747))

(assert (=> bs!7798 m!222747))

(declare-fun m!222749 () Bool)

(assert (=> bs!7798 m!222749))

(assert (=> b!194270 d!57329))

(declare-fun d!57331 () Bool)

(assert (=> d!57331 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4256 (getValueByKey!245 (toList!1254 lt!96845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56815 d!57331))

(assert (=> d!56815 d!56991))

(declare-fun d!57333 () Bool)

(assert (=> d!57333 (= (get!2240 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194544 d!57333))

(declare-fun d!57335 () Bool)

(declare-fun lt!97370 () Bool)

(assert (=> d!57335 (= lt!97370 (select (content!155 (toList!1254 lt!97016)) (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))

(declare-fun e!128399 () Bool)

(assert (=> d!57335 (= lt!97370 e!128399)))

(declare-fun res!92189 () Bool)

(assert (=> d!57335 (=> (not res!92189) (not e!128399))))

(assert (=> d!57335 (= res!92189 ((_ is Cons!2445) (toList!1254 lt!97016)))))

(assert (=> d!57335 (= (contains!1381 (toList!1254 lt!97016) (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) lt!97370)))

(declare-fun b!195235 () Bool)

(declare-fun e!128398 () Bool)

(assert (=> b!195235 (= e!128399 e!128398)))

(declare-fun res!92190 () Bool)

(assert (=> b!195235 (=> res!92190 e!128398)))

(assert (=> b!195235 (= res!92190 (= (h!3086 (toList!1254 lt!97016)) (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))

(declare-fun b!195236 () Bool)

(assert (=> b!195236 (= e!128398 (contains!1381 (t!7375 (toList!1254 lt!97016)) (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))

(assert (= (and d!57335 res!92189) b!195235))

(assert (= (and b!195235 (not res!92190)) b!195236))

(declare-fun m!222751 () Bool)

(assert (=> d!57335 m!222751))

(declare-fun m!222753 () Bool)

(assert (=> d!57335 m!222753))

(declare-fun m!222755 () Bool)

(assert (=> b!195236 m!222755))

(assert (=> b!194440 d!57335))

(declare-fun d!57337 () Bool)

(assert (=> d!57337 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!4256 (getValueByKey!245 (toList!1254 lt!96845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56863 d!57337))

(assert (=> d!56863 d!56881))

(declare-fun d!57339 () Bool)

(assert (=> d!57339 (= (inRange!0 (index!4947 lt!97063) (mask!9223 thiss!1248)) (and (bvsge (index!4947 lt!97063) #b00000000000000000000000000000000) (bvslt (index!4947 lt!97063) (bvadd (mask!9223 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!194578 d!57339))

(declare-fun d!57341 () Bool)

(declare-fun res!92191 () Bool)

(declare-fun e!128400 () Bool)

(assert (=> d!57341 (=> res!92191 e!128400)))

(assert (=> d!57341 (= res!92191 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))) (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))) lt!96832)))))

(assert (=> d!57341 (= (containsKey!249 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832) e!128400)))

(declare-fun b!195237 () Bool)

(declare-fun e!128401 () Bool)

(assert (=> b!195237 (= e!128400 e!128401)))

(declare-fun res!92192 () Bool)

(assert (=> b!195237 (=> (not res!92192) (not e!128401))))

(assert (=> b!195237 (= res!92192 (and (or (not ((_ is Cons!2445) (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))) (bvsle (_1!1791 (h!3086 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))) lt!96832)) ((_ is Cons!2445) (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))) (bvslt (_1!1791 (h!3086 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))))) lt!96832)))))

(declare-fun b!195238 () Bool)

(assert (=> b!195238 (= e!128401 (containsKey!249 (t!7375 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))) lt!96832))))

(assert (= (and d!57341 (not res!92191)) b!195237))

(assert (= (and b!195237 res!92192) b!195238))

(declare-fun m!222757 () Bool)

(assert (=> b!195238 m!222757))

(assert (=> d!56743 d!57341))

(declare-fun d!57343 () Bool)

(assert (=> d!57343 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96838) lt!96850)) (v!4256 (getValueByKey!245 (toList!1254 lt!96838) lt!96850)))))

(assert (=> d!56733 d!57343))

(declare-fun b!195240 () Bool)

(declare-fun e!128402 () Option!251)

(declare-fun e!128403 () Option!251)

(assert (=> b!195240 (= e!128402 e!128403)))

(declare-fun c!35340 () Bool)

(assert (=> b!195240 (= c!35340 (and ((_ is Cons!2445) (toList!1254 lt!96838)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96838))) lt!96850))))))

(declare-fun b!195239 () Bool)

(assert (=> b!195239 (= e!128402 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96838)))))))

(declare-fun b!195241 () Bool)

(assert (=> b!195241 (= e!128403 (getValueByKey!245 (t!7375 (toList!1254 lt!96838)) lt!96850))))

(declare-fun d!57345 () Bool)

(declare-fun c!35339 () Bool)

(assert (=> d!57345 (= c!35339 (and ((_ is Cons!2445) (toList!1254 lt!96838)) (= (_1!1791 (h!3086 (toList!1254 lt!96838))) lt!96850)))))

(assert (=> d!57345 (= (getValueByKey!245 (toList!1254 lt!96838) lt!96850) e!128402)))

(declare-fun b!195242 () Bool)

(assert (=> b!195242 (= e!128403 None!249)))

(assert (= (and d!57345 c!35339) b!195239))

(assert (= (and d!57345 (not c!35339)) b!195240))

(assert (= (and b!195240 c!35340) b!195241))

(assert (= (and b!195240 (not c!35340)) b!195242))

(declare-fun m!222759 () Bool)

(assert (=> b!195241 m!222759))

(assert (=> d!56733 d!57345))

(declare-fun d!57347 () Bool)

(assert (=> d!57347 (= (get!2239 (select (arr!3876 lt!96681) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4252 (select (arr!3876 lt!96681) #b00000000000000000000000000000000)))))

(assert (=> b!194567 d!57347))

(assert (=> b!194452 d!57309))

(declare-fun d!57349 () Bool)

(declare-fun e!128405 () Bool)

(assert (=> d!57349 e!128405))

(declare-fun res!92193 () Bool)

(assert (=> d!57349 (=> res!92193 e!128405)))

(declare-fun lt!97371 () Bool)

(assert (=> d!57349 (= res!92193 (not lt!97371))))

(declare-fun lt!97372 () Bool)

(assert (=> d!57349 (= lt!97371 lt!97372)))

(declare-fun lt!97373 () Unit!5878)

(declare-fun e!128404 () Unit!5878)

(assert (=> d!57349 (= lt!97373 e!128404)))

(declare-fun c!35341 () Bool)

(assert (=> d!57349 (= c!35341 lt!97372)))

(assert (=> d!57349 (= lt!97372 (containsKey!249 (toList!1254 lt!97086) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(assert (=> d!57349 (= (contains!1379 lt!97086 (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)) lt!97371)))

(declare-fun b!195243 () Bool)

(declare-fun lt!97374 () Unit!5878)

(assert (=> b!195243 (= e!128404 lt!97374)))

(assert (=> b!195243 (= lt!97374 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97086) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(assert (=> b!195243 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97086) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000)))))

(declare-fun b!195244 () Bool)

(declare-fun Unit!5927 () Unit!5878)

(assert (=> b!195244 (= e!128404 Unit!5927)))

(declare-fun b!195245 () Bool)

(assert (=> b!195245 (= e!128405 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97086) (select (arr!3875 (_keys!5954 lt!96671)) #b00000000000000000000000000000000))))))

(assert (= (and d!57349 c!35341) b!195243))

(assert (= (and d!57349 (not c!35341)) b!195244))

(assert (= (and d!57349 (not res!92193)) b!195245))

(assert (=> d!57349 m!221447))

(declare-fun m!222761 () Bool)

(assert (=> d!57349 m!222761))

(assert (=> b!195243 m!221447))

(declare-fun m!222763 () Bool)

(assert (=> b!195243 m!222763))

(assert (=> b!195243 m!221447))

(assert (=> b!195243 m!222391))

(assert (=> b!195243 m!222391))

(declare-fun m!222765 () Bool)

(assert (=> b!195243 m!222765))

(assert (=> b!195245 m!221447))

(assert (=> b!195245 m!222391))

(assert (=> b!195245 m!222391))

(assert (=> b!195245 m!222765))

(assert (=> b!194597 d!57349))

(declare-fun b!195247 () Bool)

(declare-fun e!128406 () Option!251)

(declare-fun e!128407 () Option!251)

(assert (=> b!195247 (= e!128406 e!128407)))

(declare-fun c!35343 () Bool)

(assert (=> b!195247 (= c!35343 (and ((_ is Cons!2445) (toList!1254 lt!96897)) (not (= (_1!1791 (h!3086 (toList!1254 lt!96897))) (_1!1791 (tuple2!3561 key!828 v!309))))))))

(declare-fun b!195246 () Bool)

(assert (=> b!195246 (= e!128406 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!96897)))))))

(declare-fun b!195248 () Bool)

(assert (=> b!195248 (= e!128407 (getValueByKey!245 (t!7375 (toList!1254 lt!96897)) (_1!1791 (tuple2!3561 key!828 v!309))))))

(declare-fun d!57351 () Bool)

(declare-fun c!35342 () Bool)

(assert (=> d!57351 (= c!35342 (and ((_ is Cons!2445) (toList!1254 lt!96897)) (= (_1!1791 (h!3086 (toList!1254 lt!96897))) (_1!1791 (tuple2!3561 key!828 v!309)))))))

(assert (=> d!57351 (= (getValueByKey!245 (toList!1254 lt!96897) (_1!1791 (tuple2!3561 key!828 v!309))) e!128406)))

(declare-fun b!195249 () Bool)

(assert (=> b!195249 (= e!128407 None!249)))

(assert (= (and d!57351 c!35342) b!195246))

(assert (= (and d!57351 (not c!35342)) b!195247))

(assert (= (and b!195247 c!35343) b!195248))

(assert (= (and b!195247 (not c!35343)) b!195249))

(declare-fun m!222767 () Bool)

(assert (=> b!195248 m!222767))

(assert (=> b!194267 d!57351))

(declare-fun d!57353 () Bool)

(declare-fun e!128409 () Bool)

(assert (=> d!57353 e!128409))

(declare-fun res!92194 () Bool)

(assert (=> d!57353 (=> res!92194 e!128409)))

(declare-fun lt!97375 () Bool)

(assert (=> d!57353 (= res!92194 (not lt!97375))))

(declare-fun lt!97376 () Bool)

(assert (=> d!57353 (= lt!97375 lt!97376)))

(declare-fun lt!97377 () Unit!5878)

(declare-fun e!128408 () Unit!5878)

(assert (=> d!57353 (= lt!97377 e!128408)))

(declare-fun c!35344 () Bool)

(assert (=> d!57353 (= c!35344 lt!97376)))

(assert (=> d!57353 (= lt!97376 (containsKey!249 (toList!1254 lt!96926) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> d!57353 (= (contains!1379 lt!96926 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) lt!97375)))

(declare-fun b!195250 () Bool)

(declare-fun lt!97378 () Unit!5878)

(assert (=> b!195250 (= e!128408 lt!97378)))

(assert (=> b!195250 (= lt!97378 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96926) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(assert (=> b!195250 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96926) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!195251 () Bool)

(declare-fun Unit!5928 () Unit!5878)

(assert (=> b!195251 (= e!128408 Unit!5928)))

(declare-fun b!195252 () Bool)

(assert (=> b!195252 (= e!128409 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96926) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(assert (= (and d!57353 c!35344) b!195250))

(assert (= (and d!57353 (not c!35344)) b!195251))

(assert (= (and d!57353 (not res!92194)) b!195252))

(declare-fun m!222769 () Bool)

(assert (=> d!57353 m!222769))

(declare-fun m!222771 () Bool)

(assert (=> b!195250 m!222771))

(assert (=> b!195250 m!221147))

(assert (=> b!195250 m!221147))

(declare-fun m!222773 () Bool)

(assert (=> b!195250 m!222773))

(assert (=> b!195252 m!221147))

(assert (=> b!195252 m!221147))

(assert (=> b!195252 m!222773))

(assert (=> d!56703 d!57353))

(declare-fun b!195254 () Bool)

(declare-fun e!128410 () Option!251)

(declare-fun e!128411 () Option!251)

(assert (=> b!195254 (= e!128410 e!128411)))

(declare-fun c!35346 () Bool)

(assert (=> b!195254 (= c!35346 (and ((_ is Cons!2445) lt!96929) (not (= (_1!1791 (h!3086 lt!96929)) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))))

(declare-fun b!195253 () Bool)

(assert (=> b!195253 (= e!128410 (Some!250 (_2!1791 (h!3086 lt!96929))))))

(declare-fun b!195255 () Bool)

(assert (=> b!195255 (= e!128411 (getValueByKey!245 (t!7375 lt!96929) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun d!57355 () Bool)

(declare-fun c!35345 () Bool)

(assert (=> d!57355 (= c!35345 (and ((_ is Cons!2445) lt!96929) (= (_1!1791 (h!3086 lt!96929)) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(assert (=> d!57355 (= (getValueByKey!245 lt!96929 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) e!128410)))

(declare-fun b!195256 () Bool)

(assert (=> b!195256 (= e!128411 None!249)))

(assert (= (and d!57355 c!35345) b!195253))

(assert (= (and d!57355 (not c!35345)) b!195254))

(assert (= (and b!195254 c!35346) b!195255))

(assert (= (and b!195254 (not c!35346)) b!195256))

(declare-fun m!222775 () Bool)

(assert (=> b!195255 m!222775))

(assert (=> d!56703 d!57355))

(declare-fun d!57357 () Bool)

(assert (=> d!57357 (= (getValueByKey!245 lt!96929 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) (Some!250 (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun lt!97379 () Unit!5878)

(assert (=> d!57357 (= lt!97379 (choose!1068 lt!96929 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun e!128412 () Bool)

(assert (=> d!57357 e!128412))

(declare-fun res!92195 () Bool)

(assert (=> d!57357 (=> (not res!92195) (not e!128412))))

(assert (=> d!57357 (= res!92195 (isStrictlySorted!357 lt!96929))))

(assert (=> d!57357 (= (lemmaContainsTupThenGetReturnValue!132 lt!96929 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) lt!97379)))

(declare-fun b!195257 () Bool)

(declare-fun res!92196 () Bool)

(assert (=> b!195257 (=> (not res!92196) (not e!128412))))

(assert (=> b!195257 (= res!92196 (containsKey!249 lt!96929 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!195258 () Bool)

(assert (=> b!195258 (= e!128412 (contains!1381 lt!96929 (tuple2!3561 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(assert (= (and d!57357 res!92195) b!195257))

(assert (= (and b!195257 res!92196) b!195258))

(assert (=> d!57357 m!221141))

(declare-fun m!222777 () Bool)

(assert (=> d!57357 m!222777))

(declare-fun m!222779 () Bool)

(assert (=> d!57357 m!222779))

(declare-fun m!222781 () Bool)

(assert (=> b!195257 m!222781))

(declare-fun m!222783 () Bool)

(assert (=> b!195258 m!222783))

(assert (=> d!56703 d!57357))

(declare-fun bm!19731 () Bool)

(declare-fun e!128413 () List!2449)

(declare-fun c!35348 () Bool)

(declare-fun call!19735 () List!2449)

(assert (=> bm!19731 (= call!19735 ($colon$colon!103 e!128413 (ite c!35348 (h!3086 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637)))) (tuple2!3561 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))))

(declare-fun c!35347 () Bool)

(assert (=> bm!19731 (= c!35347 c!35348)))

(declare-fun b!195259 () Bool)

(declare-fun e!128417 () List!2449)

(declare-fun call!19734 () List!2449)

(assert (=> b!195259 (= e!128417 call!19734)))

(declare-fun b!195260 () Bool)

(declare-fun c!35349 () Bool)

(assert (=> b!195260 (= c!35349 (and ((_ is Cons!2445) (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637)))) (bvsgt (_1!1791 (h!3086 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637))))) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun e!128415 () List!2449)

(assert (=> b!195260 (= e!128417 e!128415)))

(declare-fun e!128416 () Bool)

(declare-fun lt!97380 () List!2449)

(declare-fun b!195261 () Bool)

(assert (=> b!195261 (= e!128416 (contains!1381 lt!97380 (tuple2!3561 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun bm!19732 () Bool)

(declare-fun call!19736 () List!2449)

(assert (=> bm!19732 (= call!19736 call!19734)))

(declare-fun b!195262 () Bool)

(declare-fun e!128414 () List!2449)

(assert (=> b!195262 (= e!128414 e!128417)))

(declare-fun c!35350 () Bool)

(assert (=> b!195262 (= c!35350 (and ((_ is Cons!2445) (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637)))) (= (_1!1791 (h!3086 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637))))) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(declare-fun d!57359 () Bool)

(assert (=> d!57359 e!128416))

(declare-fun res!92197 () Bool)

(assert (=> d!57359 (=> (not res!92197) (not e!128416))))

(assert (=> d!57359 (= res!92197 (isStrictlySorted!357 lt!97380))))

(assert (=> d!57359 (= lt!97380 e!128414)))

(assert (=> d!57359 (= c!35348 (and ((_ is Cons!2445) (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637)))) (bvslt (_1!1791 (h!3086 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637))))) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))))))))

(assert (=> d!57359 (isStrictlySorted!357 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637))))))

(assert (=> d!57359 (= (insertStrictlySorted!135 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637))) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))) lt!97380)))

(declare-fun bm!19733 () Bool)

(assert (=> bm!19733 (= call!19734 call!19735)))

(declare-fun b!195263 () Bool)

(assert (=> b!195263 (= e!128415 call!19736)))

(declare-fun b!195264 () Bool)

(assert (=> b!195264 (= e!128413 (insertStrictlySorted!135 (t!7375 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637)))) (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248)))) (_2!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!195265 () Bool)

(assert (=> b!195265 (= e!128415 call!19736)))

(declare-fun b!195266 () Bool)

(declare-fun res!92198 () Bool)

(assert (=> b!195266 (=> (not res!92198) (not e!128416))))

(assert (=> b!195266 (= res!92198 (containsKey!249 lt!97380 (_1!1791 (ite (or c!35017 c!35018) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 thiss!1248)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))))

(declare-fun b!195267 () Bool)

(assert (=> b!195267 (= e!128414 call!19735)))

(declare-fun b!195268 () Bool)

(assert (=> b!195268 (= e!128413 (ite c!35350 (t!7375 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637)))) (ite c!35349 (Cons!2445 (h!3086 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637)))) (t!7375 (toList!1254 (ite c!35017 call!19640 (ite c!35018 call!19639 call!19637))))) Nil!2446)))))

(assert (= (and d!57359 c!35348) b!195267))

(assert (= (and d!57359 (not c!35348)) b!195262))

(assert (= (and b!195262 c!35350) b!195259))

(assert (= (and b!195262 (not c!35350)) b!195260))

(assert (= (and b!195260 c!35349) b!195265))

(assert (= (and b!195260 (not c!35349)) b!195263))

(assert (= (or b!195265 b!195263) bm!19732))

(assert (= (or b!195259 bm!19732) bm!19733))

(assert (= (or b!195267 bm!19733) bm!19731))

(assert (= (and bm!19731 c!35347) b!195264))

(assert (= (and bm!19731 (not c!35347)) b!195268))

(assert (= (and d!57359 res!92197) b!195266))

(assert (= (and b!195266 res!92198) b!195261))

(declare-fun m!222785 () Bool)

(assert (=> bm!19731 m!222785))

(declare-fun m!222787 () Bool)

(assert (=> b!195266 m!222787))

(declare-fun m!222789 () Bool)

(assert (=> b!195261 m!222789))

(declare-fun m!222791 () Bool)

(assert (=> b!195264 m!222791))

(declare-fun m!222793 () Bool)

(assert (=> d!57359 m!222793))

(declare-fun m!222795 () Bool)

(assert (=> d!57359 m!222795))

(assert (=> d!56703 d!57359))

(declare-fun d!57361 () Bool)

(assert (=> d!57361 (= (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) lt!96850)) (v!4256 (getValueByKey!245 (toList!1254 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) lt!96850)))))

(assert (=> d!56729 d!57361))

(declare-fun b!195270 () Bool)

(declare-fun e!128418 () Option!251)

(declare-fun e!128419 () Option!251)

(assert (=> b!195270 (= e!128418 e!128419)))

(declare-fun c!35352 () Bool)

(assert (=> b!195270 (= c!35352 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))) (not (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))) lt!96850))))))

(declare-fun b!195269 () Bool)

(assert (=> b!195269 (= e!128418 (Some!250 (_2!1791 (h!3086 (toList!1254 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))))))

(declare-fun b!195271 () Bool)

(assert (=> b!195271 (= e!128419 (getValueByKey!245 (t!7375 (toList!1254 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))) lt!96850))))

(declare-fun d!57363 () Bool)

(declare-fun c!35351 () Bool)

(assert (=> d!57363 (= c!35351 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))) (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))) lt!96850)))))

(assert (=> d!57363 (= (getValueByKey!245 (toList!1254 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) lt!96850) e!128418)))

(declare-fun b!195272 () Bool)

(assert (=> b!195272 (= e!128419 None!249)))

(assert (= (and d!57363 c!35351) b!195269))

(assert (= (and d!57363 (not c!35351)) b!195270))

(assert (= (and b!195270 c!35352) b!195271))

(assert (= (and b!195270 (not c!35352)) b!195272))

(declare-fun m!222797 () Bool)

(assert (=> b!195271 m!222797))

(assert (=> d!56729 d!57363))

(declare-fun d!57365 () Bool)

(declare-fun e!128421 () Bool)

(assert (=> d!57365 e!128421))

(declare-fun res!92199 () Bool)

(assert (=> d!57365 (=> res!92199 e!128421)))

(declare-fun lt!97381 () Bool)

(assert (=> d!57365 (= res!92199 (not lt!97381))))

(declare-fun lt!97382 () Bool)

(assert (=> d!57365 (= lt!97381 lt!97382)))

(declare-fun lt!97383 () Unit!5878)

(declare-fun e!128420 () Unit!5878)

(assert (=> d!57365 (= lt!97383 e!128420)))

(declare-fun c!35353 () Bool)

(assert (=> d!57365 (= c!35353 lt!97382)))

(assert (=> d!57365 (= lt!97382 (containsKey!249 (toList!1254 lt!97002) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(assert (=> d!57365 (= (contains!1379 lt!97002 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) lt!97381)))

(declare-fun b!195273 () Bool)

(declare-fun lt!97384 () Unit!5878)

(assert (=> b!195273 (= e!128420 lt!97384)))

(assert (=> b!195273 (= lt!97384 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97002) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(assert (=> b!195273 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97002) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(declare-fun b!195274 () Bool)

(declare-fun Unit!5929 () Unit!5878)

(assert (=> b!195274 (= e!128420 Unit!5929)))

(declare-fun b!195275 () Bool)

(assert (=> b!195275 (= e!128421 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97002) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))))

(assert (= (and d!57365 c!35353) b!195273))

(assert (= (and d!57365 (not c!35353)) b!195274))

(assert (= (and d!57365 (not res!92199)) b!195275))

(declare-fun m!222799 () Bool)

(assert (=> d!57365 m!222799))

(declare-fun m!222801 () Bool)

(assert (=> b!195273 m!222801))

(assert (=> b!195273 m!221347))

(assert (=> b!195273 m!221347))

(declare-fun m!222803 () Bool)

(assert (=> b!195273 m!222803))

(assert (=> b!195275 m!221347))

(assert (=> b!195275 m!221347))

(assert (=> b!195275 m!222803))

(assert (=> d!56765 d!57365))

(declare-fun b!195277 () Bool)

(declare-fun e!128422 () Option!251)

(declare-fun e!128423 () Option!251)

(assert (=> b!195277 (= e!128422 e!128423)))

(declare-fun c!35355 () Bool)

(assert (=> b!195277 (= c!35355 (and ((_ is Cons!2445) lt!97005) (not (= (_1!1791 (h!3086 lt!97005)) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))))

(declare-fun b!195276 () Bool)

(assert (=> b!195276 (= e!128422 (Some!250 (_2!1791 (h!3086 lt!97005))))))

(declare-fun b!195278 () Bool)

(assert (=> b!195278 (= e!128423 (getValueByKey!245 (t!7375 lt!97005) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(declare-fun d!57367 () Bool)

(declare-fun c!35354 () Bool)

(assert (=> d!57367 (= c!35354 (and ((_ is Cons!2445) lt!97005) (= (_1!1791 (h!3086 lt!97005)) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))))

(assert (=> d!57367 (= (getValueByKey!245 lt!97005 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) e!128422)))

(declare-fun b!195279 () Bool)

(assert (=> b!195279 (= e!128423 None!249)))

(assert (= (and d!57367 c!35354) b!195276))

(assert (= (and d!57367 (not c!35354)) b!195277))

(assert (= (and b!195277 c!35355) b!195278))

(assert (= (and b!195277 (not c!35355)) b!195279))

(declare-fun m!222805 () Bool)

(assert (=> b!195278 m!222805))

(assert (=> d!56765 d!57367))

(declare-fun d!57369 () Bool)

(assert (=> d!57369 (= (getValueByKey!245 lt!97005 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97385 () Unit!5878)

(assert (=> d!57369 (= lt!97385 (choose!1068 lt!97005 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(declare-fun e!128424 () Bool)

(assert (=> d!57369 e!128424))

(declare-fun res!92200 () Bool)

(assert (=> d!57369 (=> (not res!92200) (not e!128424))))

(assert (=> d!57369 (= res!92200 (isStrictlySorted!357 lt!97005))))

(assert (=> d!57369 (= (lemmaContainsTupThenGetReturnValue!132 lt!97005 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) lt!97385)))

(declare-fun b!195280 () Bool)

(declare-fun res!92201 () Bool)

(assert (=> b!195280 (=> (not res!92201) (not e!128424))))

(assert (=> b!195280 (= res!92201 (containsKey!249 lt!97005 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(declare-fun b!195281 () Bool)

(assert (=> b!195281 (= e!128424 (contains!1381 lt!97005 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))))

(assert (= (and d!57369 res!92200) b!195280))

(assert (= (and b!195280 res!92201) b!195281))

(assert (=> d!57369 m!221341))

(declare-fun m!222807 () Bool)

(assert (=> d!57369 m!222807))

(declare-fun m!222809 () Bool)

(assert (=> d!57369 m!222809))

(declare-fun m!222811 () Bool)

(assert (=> b!195280 m!222811))

(declare-fun m!222813 () Bool)

(assert (=> b!195281 m!222813))

(assert (=> d!56765 d!57369))

(declare-fun call!19738 () List!2449)

(declare-fun bm!19734 () Bool)

(declare-fun c!35357 () Bool)

(declare-fun e!128425 () List!2449)

(assert (=> bm!19734 (= call!19738 ($colon$colon!103 e!128425 (ite c!35357 (h!3086 (toList!1254 lt!96816)) (tuple2!3561 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))))

(declare-fun c!35356 () Bool)

(assert (=> bm!19734 (= c!35356 c!35357)))

(declare-fun b!195282 () Bool)

(declare-fun e!128429 () List!2449)

(declare-fun call!19737 () List!2449)

(assert (=> b!195282 (= e!128429 call!19737)))

(declare-fun b!195283 () Bool)

(declare-fun c!35358 () Bool)

(assert (=> b!195283 (= c!35358 (and ((_ is Cons!2445) (toList!1254 lt!96816)) (bvsgt (_1!1791 (h!3086 (toList!1254 lt!96816))) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))))

(declare-fun e!128427 () List!2449)

(assert (=> b!195283 (= e!128429 e!128427)))

(declare-fun lt!97386 () List!2449)

(declare-fun e!128428 () Bool)

(declare-fun b!195284 () Bool)

(assert (=> b!195284 (= e!128428 (contains!1381 lt!97386 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))))

(declare-fun bm!19735 () Bool)

(declare-fun call!19739 () List!2449)

(assert (=> bm!19735 (= call!19739 call!19737)))

(declare-fun b!195285 () Bool)

(declare-fun e!128426 () List!2449)

(assert (=> b!195285 (= e!128426 e!128429)))

(declare-fun c!35359 () Bool)

(assert (=> b!195285 (= c!35359 (and ((_ is Cons!2445) (toList!1254 lt!96816)) (= (_1!1791 (h!3086 (toList!1254 lt!96816))) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))))

(declare-fun d!57371 () Bool)

(assert (=> d!57371 e!128428))

(declare-fun res!92202 () Bool)

(assert (=> d!57371 (=> (not res!92202) (not e!128428))))

(assert (=> d!57371 (= res!92202 (isStrictlySorted!357 lt!97386))))

(assert (=> d!57371 (= lt!97386 e!128426)))

(assert (=> d!57371 (= c!35357 (and ((_ is Cons!2445) (toList!1254 lt!96816)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96816))) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))))))))

(assert (=> d!57371 (isStrictlySorted!357 (toList!1254 lt!96816))))

(assert (=> d!57371 (= (insertStrictlySorted!135 (toList!1254 lt!96816) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))) lt!97386)))

(declare-fun bm!19736 () Bool)

(assert (=> bm!19736 (= call!19737 call!19738)))

(declare-fun b!195286 () Bool)

(assert (=> b!195286 (= e!128427 call!19739)))

(declare-fun b!195287 () Bool)

(assert (=> b!195287 (= e!128425 (insertStrictlySorted!135 (t!7375 (toList!1254 lt!96816)) (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(declare-fun b!195288 () Bool)

(assert (=> b!195288 (= e!128427 call!19739)))

(declare-fun b!195289 () Bool)

(declare-fun res!92203 () Bool)

(assert (=> b!195289 (=> (not res!92203) (not e!128428))))

(assert (=> b!195289 (= res!92203 (containsKey!249 lt!97386 (_1!1791 (tuple2!3561 lt!96807 (minValue!3801 thiss!1248)))))))

(declare-fun b!195290 () Bool)

(assert (=> b!195290 (= e!128426 call!19738)))

(declare-fun b!195291 () Bool)

(assert (=> b!195291 (= e!128425 (ite c!35359 (t!7375 (toList!1254 lt!96816)) (ite c!35358 (Cons!2445 (h!3086 (toList!1254 lt!96816)) (t!7375 (toList!1254 lt!96816))) Nil!2446)))))

(assert (= (and d!57371 c!35357) b!195290))

(assert (= (and d!57371 (not c!35357)) b!195285))

(assert (= (and b!195285 c!35359) b!195282))

(assert (= (and b!195285 (not c!35359)) b!195283))

(assert (= (and b!195283 c!35358) b!195288))

(assert (= (and b!195283 (not c!35358)) b!195286))

(assert (= (or b!195288 b!195286) bm!19735))

(assert (= (or b!195282 bm!19735) bm!19736))

(assert (= (or b!195290 bm!19736) bm!19734))

(assert (= (and bm!19734 c!35356) b!195287))

(assert (= (and bm!19734 (not c!35356)) b!195291))

(assert (= (and d!57371 res!92202) b!195289))

(assert (= (and b!195289 res!92203) b!195284))

(declare-fun m!222815 () Bool)

(assert (=> bm!19734 m!222815))

(declare-fun m!222817 () Bool)

(assert (=> b!195289 m!222817))

(declare-fun m!222819 () Bool)

(assert (=> b!195284 m!222819))

(declare-fun m!222821 () Bool)

(assert (=> b!195287 m!222821))

(declare-fun m!222823 () Bool)

(assert (=> d!57371 m!222823))

(declare-fun m!222825 () Bool)

(assert (=> d!57371 m!222825))

(assert (=> d!56765 d!57371))

(assert (=> d!56755 d!56757))

(assert (=> d!56755 d!56759))

(declare-fun d!57373 () Bool)

(assert (=> d!57373 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))))))

(assert (=> d!57373 true))

(declare-fun _$12!451 () Unit!5878)

(assert (=> d!57373 (= (choose!1067 (toList!1254 lt!96669) (select (arr!3875 (_keys!5954 thiss!1248)) (index!4947 lt!96677))) _$12!451)))

(declare-fun bs!7799 () Bool)

(assert (= bs!7799 d!57373))

(assert (=> bs!7799 m!220759))

(assert (=> bs!7799 m!220941))

(assert (=> bs!7799 m!220941))

(assert (=> bs!7799 m!220943))

(assert (=> d!56755 d!57373))

(declare-fun d!57375 () Bool)

(declare-fun res!92204 () Bool)

(declare-fun e!128430 () Bool)

(assert (=> d!57375 (=> res!92204 e!128430)))

(assert (=> d!57375 (= res!92204 (or ((_ is Nil!2446) (toList!1254 lt!96669)) ((_ is Nil!2446) (t!7375 (toList!1254 lt!96669)))))))

(assert (=> d!57375 (= (isStrictlySorted!357 (toList!1254 lt!96669)) e!128430)))

(declare-fun b!195292 () Bool)

(declare-fun e!128431 () Bool)

(assert (=> b!195292 (= e!128430 e!128431)))

(declare-fun res!92205 () Bool)

(assert (=> b!195292 (=> (not res!92205) (not e!128431))))

(assert (=> b!195292 (= res!92205 (bvslt (_1!1791 (h!3086 (toList!1254 lt!96669))) (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96669))))))))

(declare-fun b!195293 () Bool)

(assert (=> b!195293 (= e!128431 (isStrictlySorted!357 (t!7375 (toList!1254 lt!96669))))))

(assert (= (and d!57375 (not res!92204)) b!195292))

(assert (= (and b!195292 res!92205) b!195293))

(declare-fun m!222827 () Bool)

(assert (=> b!195293 m!222827))

(assert (=> d!56755 d!57375))

(assert (=> d!56869 d!56681))

(assert (=> d!56869 d!56653))

(declare-fun d!57377 () Bool)

(assert (=> d!57377 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832))))

(declare-fun lt!97387 () Unit!5878)

(assert (=> d!57377 (= lt!97387 (choose!1067 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832))))

(declare-fun e!128432 () Bool)

(assert (=> d!57377 e!128432))

(declare-fun res!92206 () Bool)

(assert (=> d!57377 (=> (not res!92206) (not e!128432))))

(assert (=> d!57377 (= res!92206 (isStrictlySorted!357 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57377 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832) lt!97387)))

(declare-fun b!195294 () Bool)

(assert (=> b!195294 (= e!128432 (containsKey!249 (toList!1254 (+!322 lt!96836 (tuple2!3561 lt!96852 (zeroValue!3801 thiss!1248)))) lt!96832))))

(assert (= (and d!57377 res!92206) b!195294))

(assert (=> d!57377 m!221291))

(assert (=> d!57377 m!221291))

(assert (=> d!57377 m!221293))

(declare-fun m!222829 () Bool)

(assert (=> d!57377 m!222829))

(declare-fun m!222831 () Bool)

(assert (=> d!57377 m!222831))

(assert (=> b!195294 m!221287))

(assert (=> b!194415 d!57377))

(assert (=> b!194415 d!57227))

(assert (=> b!194415 d!57229))

(declare-fun d!57379 () Bool)

(declare-fun lt!97388 () Bool)

(assert (=> d!57379 (= lt!97388 (select (content!155 lt!96820) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun e!128434 () Bool)

(assert (=> d!57379 (= lt!97388 e!128434)))

(declare-fun res!92207 () Bool)

(assert (=> d!57379 (=> (not res!92207) (not e!128434))))

(assert (=> d!57379 (= res!92207 ((_ is Cons!2445) lt!96820))))

(assert (=> d!57379 (= (contains!1381 lt!96820 (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))) lt!97388)))

(declare-fun b!195295 () Bool)

(declare-fun e!128433 () Bool)

(assert (=> b!195295 (= e!128434 e!128433)))

(declare-fun res!92208 () Bool)

(assert (=> b!195295 (=> res!92208 e!128433)))

(assert (=> b!195295 (= res!92208 (= (h!3086 lt!96820) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun b!195296 () Bool)

(assert (=> b!195296 (= e!128433 (contains!1381 (t!7375 lt!96820) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(assert (= (and d!57379 res!92207) b!195295))

(assert (= (and b!195295 (not res!92208)) b!195296))

(declare-fun m!222833 () Bool)

(assert (=> d!57379 m!222833))

(declare-fun m!222835 () Bool)

(assert (=> d!57379 m!222835))

(declare-fun m!222837 () Bool)

(assert (=> b!195296 m!222837))

(assert (=> b!194620 d!57379))

(declare-fun d!57381 () Bool)

(assert (=> d!57381 (= (apply!188 lt!96914 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2238 (getValueByKey!245 (toList!1254 lt!96914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7800 () Bool)

(assert (= bs!7800 d!57381))

(declare-fun m!222839 () Bool)

(assert (=> bs!7800 m!222839))

(assert (=> bs!7800 m!222839))

(declare-fun m!222841 () Bool)

(assert (=> bs!7800 m!222841))

(assert (=> b!194282 d!57381))

(declare-fun b!195298 () Bool)

(declare-fun e!128435 () Option!251)

(declare-fun e!128436 () Option!251)

(assert (=> b!195298 (= e!128435 e!128436)))

(declare-fun c!35361 () Bool)

(assert (=> b!195298 (= c!35361 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96676))) (not (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96676)))) key!828))))))

(declare-fun b!195297 () Bool)

(assert (=> b!195297 (= e!128435 (Some!250 (_2!1791 (h!3086 (t!7375 (toList!1254 lt!96676))))))))

(declare-fun b!195299 () Bool)

(assert (=> b!195299 (= e!128436 (getValueByKey!245 (t!7375 (t!7375 (toList!1254 lt!96676))) key!828))))

(declare-fun d!57383 () Bool)

(declare-fun c!35360 () Bool)

(assert (=> d!57383 (= c!35360 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96676))) (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96676)))) key!828)))))

(assert (=> d!57383 (= (getValueByKey!245 (t!7375 (toList!1254 lt!96676)) key!828) e!128435)))

(declare-fun b!195300 () Bool)

(assert (=> b!195300 (= e!128436 None!249)))

(assert (= (and d!57383 c!35360) b!195297))

(assert (= (and d!57383 (not c!35360)) b!195298))

(assert (= (and b!195298 c!35361) b!195299))

(assert (= (and b!195298 (not c!35361)) b!195300))

(declare-fun m!222843 () Bool)

(assert (=> b!195299 m!222843))

(assert (=> b!194497 d!57383))

(assert (=> b!194604 d!57043))

(declare-fun d!57385 () Bool)

(assert (=> d!57385 (= (apply!188 (+!322 lt!96838 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) lt!96850) (apply!188 lt!96838 lt!96850))))

(assert (=> d!57385 true))

(declare-fun _$34!1094 () Unit!5878)

(assert (=> d!57385 (= (choose!1069 lt!96838 lt!96846 (minValue!3801 thiss!1248) lt!96850) _$34!1094)))

(declare-fun bs!7801 () Bool)

(assert (= bs!7801 d!57385))

(assert (=> bs!7801 m!220981))

(assert (=> bs!7801 m!220981))

(assert (=> bs!7801 m!220983))

(assert (=> bs!7801 m!220999))

(assert (=> d!56731 d!57385))

(declare-fun d!57387 () Bool)

(declare-fun e!128438 () Bool)

(assert (=> d!57387 e!128438))

(declare-fun res!92209 () Bool)

(assert (=> d!57387 (=> res!92209 e!128438)))

(declare-fun lt!97389 () Bool)

(assert (=> d!57387 (= res!92209 (not lt!97389))))

(declare-fun lt!97390 () Bool)

(assert (=> d!57387 (= lt!97389 lt!97390)))

(declare-fun lt!97391 () Unit!5878)

(declare-fun e!128437 () Unit!5878)

(assert (=> d!57387 (= lt!97391 e!128437)))

(declare-fun c!35362 () Bool)

(assert (=> d!57387 (= c!35362 lt!97390)))

(assert (=> d!57387 (= lt!97390 (containsKey!249 (toList!1254 lt!96838) lt!96850))))

(assert (=> d!57387 (= (contains!1379 lt!96838 lt!96850) lt!97389)))

(declare-fun b!195301 () Bool)

(declare-fun lt!97392 () Unit!5878)

(assert (=> b!195301 (= e!128437 lt!97392)))

(assert (=> b!195301 (= lt!97392 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96838) lt!96850))))

(assert (=> b!195301 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96838) lt!96850))))

(declare-fun b!195302 () Bool)

(declare-fun Unit!5930 () Unit!5878)

(assert (=> b!195302 (= e!128437 Unit!5930)))

(declare-fun b!195303 () Bool)

(assert (=> b!195303 (= e!128438 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96838) lt!96850)))))

(assert (= (and d!57387 c!35362) b!195301))

(assert (= (and d!57387 (not c!35362)) b!195302))

(assert (= (and d!57387 (not res!92209)) b!195303))

(declare-fun m!222845 () Bool)

(assert (=> d!57387 m!222845))

(declare-fun m!222847 () Bool)

(assert (=> b!195301 m!222847))

(assert (=> b!195301 m!221243))

(assert (=> b!195301 m!221243))

(declare-fun m!222849 () Bool)

(assert (=> b!195301 m!222849))

(assert (=> b!195303 m!221243))

(assert (=> b!195303 m!221243))

(assert (=> b!195303 m!222849))

(assert (=> d!56731 d!57387))

(assert (=> d!56731 d!56729))

(assert (=> d!56731 d!56733))

(assert (=> d!56731 d!56737))

(declare-fun d!57389 () Bool)

(assert (=> d!57389 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97393 () Unit!5878)

(assert (=> d!57389 (= lt!97393 (choose!1067 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128439 () Bool)

(assert (=> d!57389 e!128439))

(declare-fun res!92210 () Bool)

(assert (=> d!57389 (=> (not res!92210) (not e!128439))))

(assert (=> d!57389 (= res!92210 (isStrictlySorted!357 (toList!1254 lt!96808)))))

(assert (=> d!57389 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000) lt!97393)))

(declare-fun b!195304 () Bool)

(assert (=> b!195304 (= e!128439 (containsKey!249 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57389 res!92210) b!195304))

(assert (=> d!57389 m!221563))

(assert (=> d!57389 m!221563))

(assert (=> d!57389 m!221565))

(declare-fun m!222851 () Bool)

(assert (=> d!57389 m!222851))

(assert (=> d!57389 m!222267))

(assert (=> b!195304 m!221559))

(assert (=> b!194580 d!57389))

(assert (=> b!194580 d!57237))

(assert (=> b!194580 d!57239))

(declare-fun d!57391 () Bool)

(assert (=> d!57391 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))) (v!4256 (getValueByKey!245 (toList!1254 lt!96808) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!56837 d!57391))

(assert (=> d!56837 d!56955))

(assert (=> d!56695 d!57083))

(assert (=> b!194494 d!56713))

(declare-fun d!57393 () Bool)

(declare-fun e!128440 () Bool)

(assert (=> d!57393 e!128440))

(declare-fun res!92211 () Bool)

(assert (=> d!57393 (=> (not res!92211) (not e!128440))))

(declare-fun lt!97394 () ListLongMap!2477)

(assert (=> d!57393 (= res!92211 (contains!1379 lt!97394 (_1!1791 (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))))))))

(declare-fun lt!97397 () List!2449)

(assert (=> d!57393 (= lt!97394 (ListLongMap!2478 lt!97397))))

(declare-fun lt!97395 () Unit!5878)

(declare-fun lt!97396 () Unit!5878)

(assert (=> d!57393 (= lt!97395 lt!97396)))

(assert (=> d!57393 (= (getValueByKey!245 lt!97397 (_1!1791 (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))))) (Some!250 (_2!1791 (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))))))))

(assert (=> d!57393 (= lt!97396 (lemmaContainsTupThenGetReturnValue!132 lt!97397 (_1!1791 (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))) (_2!1791 (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))))))))

(assert (=> d!57393 (= lt!97397 (insertStrictlySorted!135 (toList!1254 (ite c!35134 call!19685 (ite c!35135 call!19684 call!19682))) (_1!1791 (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))) (_2!1791 (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))))))))

(assert (=> d!57393 (= (+!322 (ite c!35134 call!19685 (ite c!35135 call!19684 call!19682)) (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))) lt!97394)))

(declare-fun b!195305 () Bool)

(declare-fun res!92212 () Bool)

(assert (=> b!195305 (=> (not res!92212) (not e!128440))))

(assert (=> b!195305 (= res!92212 (= (getValueByKey!245 (toList!1254 lt!97394) (_1!1791 (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))))) (Some!250 (_2!1791 (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))))))))

(declare-fun b!195306 () Bool)

(assert (=> b!195306 (= e!128440 (contains!1381 (toList!1254 lt!97394) (ite (or c!35134 c!35135) (tuple2!3561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3801 lt!96671)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))))))

(assert (= (and d!57393 res!92211) b!195305))

(assert (= (and b!195305 res!92212) b!195306))

(declare-fun m!222853 () Bool)

(assert (=> d!57393 m!222853))

(declare-fun m!222855 () Bool)

(assert (=> d!57393 m!222855))

(declare-fun m!222857 () Bool)

(assert (=> d!57393 m!222857))

(declare-fun m!222859 () Bool)

(assert (=> d!57393 m!222859))

(declare-fun m!222861 () Bool)

(assert (=> b!195305 m!222861))

(declare-fun m!222863 () Bool)

(assert (=> b!195306 m!222863))

(assert (=> bm!19680 d!57393))

(declare-fun d!57395 () Bool)

(assert (=> d!57395 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96729) (_1!1791 lt!96678)))))

(declare-fun lt!97398 () Unit!5878)

(assert (=> d!57395 (= lt!97398 (choose!1067 (toList!1254 lt!96729) (_1!1791 lt!96678)))))

(declare-fun e!128441 () Bool)

(assert (=> d!57395 e!128441))

(declare-fun res!92213 () Bool)

(assert (=> d!57395 (=> (not res!92213) (not e!128441))))

(assert (=> d!57395 (= res!92213 (isStrictlySorted!357 (toList!1254 lt!96729)))))

(assert (=> d!57395 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96729) (_1!1791 lt!96678)) lt!97398)))

(declare-fun b!195307 () Bool)

(assert (=> b!195307 (= e!128441 (containsKey!249 (toList!1254 lt!96729) (_1!1791 lt!96678)))))

(assert (= (and d!57395 res!92213) b!195307))

(assert (=> d!57395 m!220825))

(assert (=> d!57395 m!220825))

(assert (=> d!57395 m!221155))

(declare-fun m!222865 () Bool)

(assert (=> d!57395 m!222865))

(declare-fun m!222867 () Bool)

(assert (=> d!57395 m!222867))

(assert (=> b!195307 m!221151))

(assert (=> b!194311 d!57395))

(assert (=> b!194311 d!57287))

(assert (=> b!194311 d!56795))

(declare-fun d!57397 () Bool)

(assert (=> d!57397 (= (get!2239 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4252 (select (arr!3876 (_values!3943 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194543 d!57397))

(assert (=> b!194269 d!56677))

(declare-fun b!195309 () Bool)

(declare-fun e!128442 () Option!251)

(declare-fun e!128443 () Option!251)

(assert (=> b!195309 (= e!128442 e!128443)))

(declare-fun c!35364 () Bool)

(assert (=> b!195309 (= c!35364 (and ((_ is Cons!2445) (toList!1254 lt!97016)) (not (= (_1!1791 (h!3086 (toList!1254 lt!97016))) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))))

(declare-fun b!195308 () Bool)

(assert (=> b!195308 (= e!128442 (Some!250 (_2!1791 (h!3086 (toList!1254 lt!97016)))))))

(declare-fun b!195310 () Bool)

(assert (=> b!195310 (= e!128443 (getValueByKey!245 (t!7375 (toList!1254 lt!97016)) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(declare-fun d!57399 () Bool)

(declare-fun c!35363 () Bool)

(assert (=> d!57399 (= c!35363 (and ((_ is Cons!2445) (toList!1254 lt!97016)) (= (_1!1791 (h!3086 (toList!1254 lt!97016))) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57399 (= (getValueByKey!245 (toList!1254 lt!97016) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) e!128442)))

(declare-fun b!195311 () Bool)

(assert (=> b!195311 (= e!128443 None!249)))

(assert (= (and d!57399 c!35363) b!195308))

(assert (= (and d!57399 (not c!35363)) b!195309))

(assert (= (and b!195309 c!35364) b!195310))

(assert (= (and b!195309 (not c!35364)) b!195311))

(declare-fun m!222869 () Bool)

(assert (=> b!195310 m!222869))

(assert (=> b!194439 d!57399))

(declare-fun d!57401 () Bool)

(assert (=> d!57401 (isDefined!198 (getValueByKey!245 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795))))

(declare-fun lt!97399 () Unit!5878)

(assert (=> d!57401 (= lt!97399 (choose!1067 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795))))

(declare-fun e!128444 () Bool)

(assert (=> d!57401 e!128444))

(declare-fun res!92214 () Bool)

(assert (=> d!57401 (=> (not res!92214) (not e!128444))))

(assert (=> d!57401 (= res!92214 (isStrictlySorted!357 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57401 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795) lt!97399)))

(declare-fun b!195312 () Bool)

(assert (=> b!195312 (= e!128444 (containsKey!249 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795))))

(assert (= (and d!57401 res!92214) b!195312))

(assert (=> d!57401 m!221355))

(assert (=> d!57401 m!221355))

(assert (=> d!57401 m!221357))

(declare-fun m!222871 () Bool)

(assert (=> d!57401 m!222871))

(declare-fun m!222873 () Bool)

(assert (=> d!57401 m!222873))

(assert (=> b!195312 m!221351))

(assert (=> b!194432 d!57401))

(assert (=> b!194432 d!57289))

(assert (=> b!194432 d!57291))

(assert (=> d!56813 d!56691))

(assert (=> d!56813 d!56663))

(assert (=> d!56813 d!56693))

(assert (=> b!194424 d!56879))

(assert (=> b!194424 d!56881))

(assert (=> d!56693 d!56689))

(declare-fun d!57403 () Bool)

(declare-fun res!92215 () Bool)

(declare-fun e!128445 () Bool)

(assert (=> d!57403 (=> res!92215 e!128445)))

(assert (=> d!57403 (= res!92215 (and ((_ is Cons!2445) (toList!1254 lt!96808)) (= (_1!1791 (h!3086 (toList!1254 lt!96808))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57403 (= (containsKey!249 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000) e!128445)))

(declare-fun b!195313 () Bool)

(declare-fun e!128446 () Bool)

(assert (=> b!195313 (= e!128445 e!128446)))

(declare-fun res!92216 () Bool)

(assert (=> b!195313 (=> (not res!92216) (not e!128446))))

(assert (=> b!195313 (= res!92216 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96808))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96808))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2445) (toList!1254 lt!96808)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96808))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195314 () Bool)

(assert (=> b!195314 (= e!128446 (containsKey!249 (t!7375 (toList!1254 lt!96808)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57403 (not res!92215)) b!195313))

(assert (= (and b!195313 res!92216) b!195314))

(declare-fun m!222875 () Bool)

(assert (=> b!195314 m!222875))

(assert (=> d!56817 d!57403))

(declare-fun d!57405 () Bool)

(assert (=> d!57405 (= (size!4203 lt!96671) (bvadd (_size!1405 lt!96671) (bvsdiv (bvadd (extraKeys!3697 lt!96671) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!194292 d!57405))

(assert (=> d!56685 d!56689))

(assert (=> b!194450 d!56677))

(assert (=> bm!19684 d!57273))

(declare-fun d!57407 () Bool)

(declare-fun e!128448 () Bool)

(assert (=> d!57407 e!128448))

(declare-fun res!92217 () Bool)

(assert (=> d!57407 (=> res!92217 e!128448)))

(declare-fun lt!97400 () Bool)

(assert (=> d!57407 (= res!92217 (not lt!97400))))

(declare-fun lt!97401 () Bool)

(assert (=> d!57407 (= lt!97400 lt!97401)))

(declare-fun lt!97402 () Unit!5878)

(declare-fun e!128447 () Unit!5878)

(assert (=> d!57407 (= lt!97402 e!128447)))

(declare-fun c!35365 () Bool)

(assert (=> d!57407 (= c!35365 lt!97401)))

(assert (=> d!57407 (= lt!97401 (containsKey!249 (toList!1254 lt!96963) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!57407 (= (contains!1379 lt!96963 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) lt!97400)))

(declare-fun b!195315 () Bool)

(declare-fun lt!97403 () Unit!5878)

(assert (=> b!195315 (= e!128447 lt!97403)))

(assert (=> b!195315 (= lt!97403 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96963) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!195315 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96963) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!195316 () Bool)

(declare-fun Unit!5931 () Unit!5878)

(assert (=> b!195316 (= e!128447 Unit!5931)))

(declare-fun b!195317 () Bool)

(assert (=> b!195317 (= e!128448 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96963) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!57407 c!35365) b!195315))

(assert (= (and d!57407 (not c!35365)) b!195316))

(assert (= (and d!57407 (not res!92217)) b!195317))

(assert (=> d!57407 m!220877))

(declare-fun m!222877 () Bool)

(assert (=> d!57407 m!222877))

(assert (=> b!195315 m!220877))

(declare-fun m!222879 () Bool)

(assert (=> b!195315 m!222879))

(assert (=> b!195315 m!220877))

(assert (=> b!195315 m!221931))

(assert (=> b!195315 m!221931))

(declare-fun m!222881 () Bool)

(assert (=> b!195315 m!222881))

(assert (=> b!195317 m!220877))

(assert (=> b!195317 m!221931))

(assert (=> b!195317 m!221931))

(assert (=> b!195317 m!222881))

(assert (=> b!194394 d!57407))

(declare-fun d!57409 () Bool)

(declare-fun lt!97404 () Bool)

(assert (=> d!57409 (= lt!97404 (select (content!155 lt!96939) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun e!128450 () Bool)

(assert (=> d!57409 (= lt!97404 e!128450)))

(declare-fun res!92218 () Bool)

(assert (=> d!57409 (=> (not res!92218) (not e!128450))))

(assert (=> d!57409 (= res!92218 ((_ is Cons!2445) lt!96939))))

(assert (=> d!57409 (= (contains!1381 lt!96939 (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))) lt!97404)))

(declare-fun b!195318 () Bool)

(declare-fun e!128449 () Bool)

(assert (=> b!195318 (= e!128450 e!128449)))

(declare-fun res!92219 () Bool)

(assert (=> b!195318 (=> res!92219 e!128449)))

(assert (=> b!195318 (= res!92219 (= (h!3086 lt!96939) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(declare-fun b!195319 () Bool)

(assert (=> b!195319 (= e!128449 (contains!1381 (t!7375 lt!96939) (tuple2!3561 (_1!1791 lt!96678) (_2!1791 lt!96678))))))

(assert (= (and d!57409 res!92218) b!195318))

(assert (= (and b!195318 (not res!92219)) b!195319))

(declare-fun m!222883 () Bool)

(assert (=> d!57409 m!222883))

(declare-fun m!222885 () Bool)

(assert (=> d!57409 m!222885))

(declare-fun m!222887 () Bool)

(assert (=> b!195319 m!222887))

(assert (=> b!194346 d!57409))

(declare-fun d!57411 () Bool)

(declare-fun e!128451 () Bool)

(assert (=> d!57411 e!128451))

(declare-fun res!92220 () Bool)

(assert (=> d!57411 (=> (not res!92220) (not e!128451))))

(declare-fun lt!97405 () ListLongMap!2477)

(assert (=> d!57411 (= res!92220 (contains!1379 lt!97405 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))))))

(declare-fun lt!97408 () List!2449)

(assert (=> d!57411 (= lt!97405 (ListLongMap!2478 lt!97408))))

(declare-fun lt!97406 () Unit!5878)

(declare-fun lt!97407 () Unit!5878)

(assert (=> d!57411 (= lt!97406 lt!97407)))

(assert (=> d!57411 (= (getValueByKey!245 lt!97408 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))) (Some!250 (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))))))

(assert (=> d!57411 (= lt!97407 (lemmaContainsTupThenGetReturnValue!132 lt!97408 (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))))))

(assert (=> d!57411 (= lt!97408 (insertStrictlySorted!135 (toList!1254 call!19686) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))) (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))))))

(assert (=> d!57411 (= (+!322 call!19686 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))) lt!97405)))

(declare-fun b!195320 () Bool)

(declare-fun res!92221 () Bool)

(assert (=> b!195320 (=> (not res!92221) (not e!128451))))

(assert (=> b!195320 (= res!92221 (= (getValueByKey!245 (toList!1254 lt!97405) (_1!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671)))) (Some!250 (_2!1791 (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))))))))

(declare-fun b!195321 () Bool)

(assert (=> b!195321 (= e!128451 (contains!1381 (toList!1254 lt!97405) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 lt!96671))))))

(assert (= (and d!57411 res!92220) b!195320))

(assert (= (and b!195320 res!92221) b!195321))

(declare-fun m!222889 () Bool)

(assert (=> d!57411 m!222889))

(declare-fun m!222891 () Bool)

(assert (=> d!57411 m!222891))

(declare-fun m!222893 () Bool)

(assert (=> d!57411 m!222893))

(declare-fun m!222895 () Bool)

(assert (=> d!57411 m!222895))

(declare-fun m!222897 () Bool)

(assert (=> b!195320 m!222897))

(declare-fun m!222899 () Bool)

(assert (=> b!195321 m!222899))

(assert (=> b!194596 d!57411))

(declare-fun d!57413 () Bool)

(assert (=> d!57413 (= (get!2238 (getValueByKey!245 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!4256 (getValueByKey!245 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56871 d!57413))

(assert (=> d!56871 d!57239))

(assert (=> d!56801 d!56675))

(assert (=> b!194614 d!56941))

(assert (=> b!194614 d!56825))

(declare-fun d!57415 () Bool)

(declare-fun e!128453 () Bool)

(assert (=> d!57415 e!128453))

(declare-fun res!92222 () Bool)

(assert (=> d!57415 (=> res!92222 e!128453)))

(declare-fun lt!97409 () Bool)

(assert (=> d!57415 (= res!92222 (not lt!97409))))

(declare-fun lt!97410 () Bool)

(assert (=> d!57415 (= lt!97409 lt!97410)))

(declare-fun lt!97411 () Unit!5878)

(declare-fun e!128452 () Unit!5878)

(assert (=> d!57415 (= lt!97411 e!128452)))

(declare-fun c!35366 () Bool)

(assert (=> d!57415 (= c!35366 lt!97410)))

(assert (=> d!57415 (= lt!97410 (containsKey!249 (toList!1254 lt!97016) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(assert (=> d!57415 (= (contains!1379 lt!97016 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!97409)))

(declare-fun b!195322 () Bool)

(declare-fun lt!97412 () Unit!5878)

(assert (=> b!195322 (= e!128452 lt!97412)))

(assert (=> b!195322 (= lt!97412 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!97016) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(assert (=> b!195322 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97016) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!195323 () Bool)

(declare-fun Unit!5932 () Unit!5878)

(assert (=> b!195323 (= e!128452 Unit!5932)))

(declare-fun b!195324 () Bool)

(assert (=> b!195324 (= e!128453 (isDefined!198 (getValueByKey!245 (toList!1254 lt!97016) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))

(assert (= (and d!57415 c!35366) b!195322))

(assert (= (and d!57415 (not c!35366)) b!195323))

(assert (= (and d!57415 (not res!92222)) b!195324))

(declare-fun m!222901 () Bool)

(assert (=> d!57415 m!222901))

(declare-fun m!222903 () Bool)

(assert (=> b!195322 m!222903))

(assert (=> b!195322 m!221399))

(assert (=> b!195322 m!221399))

(declare-fun m!222905 () Bool)

(assert (=> b!195322 m!222905))

(assert (=> b!195324 m!221399))

(assert (=> b!195324 m!221399))

(assert (=> b!195324 m!222905))

(assert (=> d!56781 d!57415))

(declare-fun b!195326 () Bool)

(declare-fun e!128454 () Option!251)

(declare-fun e!128455 () Option!251)

(assert (=> b!195326 (= e!128454 e!128455)))

(declare-fun c!35368 () Bool)

(assert (=> b!195326 (= c!35368 (and ((_ is Cons!2445) lt!97019) (not (= (_1!1791 (h!3086 lt!97019)) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))))

(declare-fun b!195325 () Bool)

(assert (=> b!195325 (= e!128454 (Some!250 (_2!1791 (h!3086 lt!97019))))))

(declare-fun b!195327 () Bool)

(assert (=> b!195327 (= e!128455 (getValueByKey!245 (t!7375 lt!97019) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(declare-fun d!57417 () Bool)

(declare-fun c!35367 () Bool)

(assert (=> d!57417 (= c!35367 (and ((_ is Cons!2445) lt!97019) (= (_1!1791 (h!3086 lt!97019)) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57417 (= (getValueByKey!245 lt!97019 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) e!128454)))

(declare-fun b!195328 () Bool)

(assert (=> b!195328 (= e!128455 None!249)))

(assert (= (and d!57417 c!35367) b!195325))

(assert (= (and d!57417 (not c!35367)) b!195326))

(assert (= (and b!195326 c!35368) b!195327))

(assert (= (and b!195326 (not c!35368)) b!195328))

(declare-fun m!222907 () Bool)

(assert (=> b!195327 m!222907))

(assert (=> d!56781 d!57417))

(declare-fun d!57419 () Bool)

(assert (=> d!57419 (= (getValueByKey!245 lt!97019 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(declare-fun lt!97413 () Unit!5878)

(assert (=> d!57419 (= lt!97413 (choose!1068 lt!97019 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(declare-fun e!128456 () Bool)

(assert (=> d!57419 e!128456))

(declare-fun res!92223 () Bool)

(assert (=> d!57419 (=> (not res!92223) (not e!128456))))

(assert (=> d!57419 (= res!92223 (isStrictlySorted!357 lt!97019))))

(assert (=> d!57419 (= (lemmaContainsTupThenGetReturnValue!132 lt!97019 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!97413)))

(declare-fun b!195329 () Bool)

(declare-fun res!92224 () Bool)

(assert (=> b!195329 (=> (not res!92224) (not e!128456))))

(assert (=> b!195329 (= res!92224 (containsKey!249 lt!97019 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!195330 () Bool)

(assert (=> b!195330 (= e!128456 (contains!1381 lt!97019 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))

(assert (= (and d!57419 res!92223) b!195329))

(assert (= (and b!195329 res!92224) b!195330))

(assert (=> d!57419 m!221393))

(declare-fun m!222909 () Bool)

(assert (=> d!57419 m!222909))

(declare-fun m!222911 () Bool)

(assert (=> d!57419 m!222911))

(declare-fun m!222913 () Bool)

(assert (=> b!195329 m!222913))

(declare-fun m!222915 () Bool)

(assert (=> b!195330 m!222915))

(assert (=> d!56781 d!57419))

(declare-fun call!19741 () List!2449)

(declare-fun e!128457 () List!2449)

(declare-fun bm!19737 () Bool)

(declare-fun c!35370 () Bool)

(assert (=> bm!19737 (= call!19741 ($colon$colon!103 e!128457 (ite c!35370 (h!3086 (toList!1254 lt!96799)) (tuple2!3561 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))))

(declare-fun c!35369 () Bool)

(assert (=> bm!19737 (= c!35369 c!35370)))

(declare-fun b!195331 () Bool)

(declare-fun e!128461 () List!2449)

(declare-fun call!19740 () List!2449)

(assert (=> b!195331 (= e!128461 call!19740)))

(declare-fun c!35371 () Bool)

(declare-fun b!195332 () Bool)

(assert (=> b!195332 (= c!35371 (and ((_ is Cons!2445) (toList!1254 lt!96799)) (bvsgt (_1!1791 (h!3086 (toList!1254 lt!96799))) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))

(declare-fun e!128459 () List!2449)

(assert (=> b!195332 (= e!128461 e!128459)))

(declare-fun lt!97414 () List!2449)

(declare-fun e!128460 () Bool)

(declare-fun b!195333 () Bool)

(assert (=> b!195333 (= e!128460 (contains!1381 lt!97414 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))

(declare-fun bm!19738 () Bool)

(declare-fun call!19742 () List!2449)

(assert (=> bm!19738 (= call!19742 call!19740)))

(declare-fun b!195334 () Bool)

(declare-fun e!128458 () List!2449)

(assert (=> b!195334 (= e!128458 e!128461)))

(declare-fun c!35372 () Bool)

(assert (=> b!195334 (= c!35372 (and ((_ is Cons!2445) (toList!1254 lt!96799)) (= (_1!1791 (h!3086 (toList!1254 lt!96799))) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))

(declare-fun d!57421 () Bool)

(assert (=> d!57421 e!128460))

(declare-fun res!92225 () Bool)

(assert (=> d!57421 (=> (not res!92225) (not e!128460))))

(assert (=> d!57421 (= res!92225 (isStrictlySorted!357 lt!97414))))

(assert (=> d!57421 (= lt!97414 e!128458)))

(assert (=> d!57421 (= c!35370 (and ((_ is Cons!2445) (toList!1254 lt!96799)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96799))) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))))))

(assert (=> d!57421 (isStrictlySorted!357 (toList!1254 lt!96799))))

(assert (=> d!57421 (= (insertStrictlySorted!135 (toList!1254 lt!96799) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!97414)))

(declare-fun bm!19739 () Bool)

(assert (=> bm!19739 (= call!19740 call!19741)))

(declare-fun b!195335 () Bool)

(assert (=> b!195335 (= e!128459 call!19742)))

(declare-fun b!195336 () Bool)

(assert (=> b!195336 (= e!128457 (insertStrictlySorted!135 (t!7375 (toList!1254 lt!96799)) (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!195337 () Bool)

(assert (=> b!195337 (= e!128459 call!19742)))

(declare-fun b!195338 () Bool)

(declare-fun res!92226 () Bool)

(assert (=> b!195338 (=> (not res!92226) (not e!128460))))

(assert (=> b!195338 (= res!92226 (containsKey!249 lt!97414 (_1!1791 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))))

(declare-fun b!195339 () Bool)

(assert (=> b!195339 (= e!128458 call!19741)))

(declare-fun b!195340 () Bool)

(assert (=> b!195340 (= e!128457 (ite c!35372 (t!7375 (toList!1254 lt!96799)) (ite c!35371 (Cons!2445 (h!3086 (toList!1254 lt!96799)) (t!7375 (toList!1254 lt!96799))) Nil!2446)))))

(assert (= (and d!57421 c!35370) b!195339))

(assert (= (and d!57421 (not c!35370)) b!195334))

(assert (= (and b!195334 c!35372) b!195331))

(assert (= (and b!195334 (not c!35372)) b!195332))

(assert (= (and b!195332 c!35371) b!195337))

(assert (= (and b!195332 (not c!35371)) b!195335))

(assert (= (or b!195337 b!195335) bm!19738))

(assert (= (or b!195331 bm!19738) bm!19739))

(assert (= (or b!195339 bm!19739) bm!19737))

(assert (= (and bm!19737 c!35369) b!195336))

(assert (= (and bm!19737 (not c!35369)) b!195340))

(assert (= (and d!57421 res!92225) b!195338))

(assert (= (and b!195338 res!92226) b!195333))

(declare-fun m!222917 () Bool)

(assert (=> bm!19737 m!222917))

(declare-fun m!222919 () Bool)

(assert (=> b!195338 m!222919))

(declare-fun m!222921 () Bool)

(assert (=> b!195333 m!222921))

(declare-fun m!222923 () Bool)

(assert (=> b!195336 m!222923))

(declare-fun m!222925 () Bool)

(assert (=> d!57421 m!222925))

(declare-fun m!222927 () Bool)

(assert (=> d!57421 m!222927))

(assert (=> d!56781 d!57421))

(declare-fun d!57423 () Bool)

(assert (=> d!57423 (= (get!2238 (getValueByKey!245 (toList!1254 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) lt!96834)) (v!4256 (getValueByKey!245 (toList!1254 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) lt!96834)))))

(assert (=> d!56735 d!57423))

(declare-fun b!195342 () Bool)

(declare-fun e!128462 () Option!251)

(declare-fun e!128463 () Option!251)

(assert (=> b!195342 (= e!128462 e!128463)))

(declare-fun c!35374 () Bool)

(assert (=> b!195342 (= c!35374 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))) (not (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))) lt!96834))))))

(declare-fun b!195341 () Bool)

(assert (=> b!195341 (= e!128462 (Some!250 (_2!1791 (h!3086 (toList!1254 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))))))))

(declare-fun b!195343 () Bool)

(assert (=> b!195343 (= e!128463 (getValueByKey!245 (t!7375 (toList!1254 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))) lt!96834))))

(declare-fun d!57425 () Bool)

(declare-fun c!35373 () Bool)

(assert (=> d!57425 (= c!35373 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248))))) (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))))) lt!96834)))))

(assert (=> d!57425 (= (getValueByKey!245 (toList!1254 (+!322 lt!96848 (tuple2!3561 lt!96839 (zeroValue!3801 thiss!1248)))) lt!96834) e!128462)))

(declare-fun b!195344 () Bool)

(assert (=> b!195344 (= e!128463 None!249)))

(assert (= (and d!57425 c!35373) b!195341))

(assert (= (and d!57425 (not c!35373)) b!195342))

(assert (= (and b!195342 c!35374) b!195343))

(assert (= (and b!195342 (not c!35374)) b!195344))

(declare-fun m!222929 () Bool)

(assert (=> b!195343 m!222929))

(assert (=> d!56735 d!57425))

(declare-fun d!57427 () Bool)

(declare-fun res!92227 () Bool)

(declare-fun e!128464 () Bool)

(assert (=> d!57427 (=> res!92227 e!128464)))

(assert (=> d!57427 (= res!92227 (and ((_ is Cons!2445) lt!96820) (= (_1!1791 (h!3086 lt!96820)) (_1!1791 lt!96678))))))

(assert (=> d!57427 (= (containsKey!249 lt!96820 (_1!1791 lt!96678)) e!128464)))

(declare-fun b!195345 () Bool)

(declare-fun e!128465 () Bool)

(assert (=> b!195345 (= e!128464 e!128465)))

(declare-fun res!92228 () Bool)

(assert (=> b!195345 (=> (not res!92228) (not e!128465))))

(assert (=> b!195345 (= res!92228 (and (or (not ((_ is Cons!2445) lt!96820)) (bvsle (_1!1791 (h!3086 lt!96820)) (_1!1791 lt!96678))) ((_ is Cons!2445) lt!96820) (bvslt (_1!1791 (h!3086 lt!96820)) (_1!1791 lt!96678))))))

(declare-fun b!195346 () Bool)

(assert (=> b!195346 (= e!128465 (containsKey!249 (t!7375 lt!96820) (_1!1791 lt!96678)))))

(assert (= (and d!57427 (not res!92227)) b!195345))

(assert (= (and b!195345 res!92228) b!195346))

(declare-fun m!222931 () Bool)

(assert (=> b!195346 m!222931))

(assert (=> b!194619 d!57427))

(declare-fun d!57429 () Bool)

(declare-fun e!128467 () Bool)

(assert (=> d!57429 e!128467))

(declare-fun res!92229 () Bool)

(assert (=> d!57429 (=> res!92229 e!128467)))

(declare-fun lt!97415 () Bool)

(assert (=> d!57429 (= res!92229 (not lt!97415))))

(declare-fun lt!97416 () Bool)

(assert (=> d!57429 (= lt!97415 lt!97416)))

(declare-fun lt!97417 () Unit!5878)

(declare-fun e!128466 () Unit!5878)

(assert (=> d!57429 (= lt!97417 e!128466)))

(declare-fun c!35375 () Bool)

(assert (=> d!57429 (= c!35375 lt!97416)))

(assert (=> d!57429 (= lt!97416 (containsKey!249 (toList!1254 lt!96963) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57429 (= (contains!1379 lt!96963 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97415)))

(declare-fun b!195347 () Bool)

(declare-fun lt!97418 () Unit!5878)

(assert (=> b!195347 (= e!128466 lt!97418)))

(assert (=> b!195347 (= lt!97418 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96963) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195347 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96963) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195348 () Bool)

(declare-fun Unit!5933 () Unit!5878)

(assert (=> b!195348 (= e!128466 Unit!5933)))

(declare-fun b!195349 () Bool)

(assert (=> b!195349 (= e!128467 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57429 c!35375) b!195347))

(assert (= (and d!57429 (not c!35375)) b!195348))

(assert (= (and d!57429 (not res!92229)) b!195349))

(declare-fun m!222933 () Bool)

(assert (=> d!57429 m!222933))

(declare-fun m!222935 () Bool)

(assert (=> b!195347 m!222935))

(declare-fun m!222937 () Bool)

(assert (=> b!195347 m!222937))

(assert (=> b!195347 m!222937))

(declare-fun m!222939 () Bool)

(assert (=> b!195347 m!222939))

(assert (=> b!195349 m!222937))

(assert (=> b!195349 m!222937))

(assert (=> b!195349 m!222939))

(assert (=> b!194401 d!57429))

(declare-fun d!57431 () Bool)

(assert (=> d!57431 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97419 () Unit!5878)

(assert (=> d!57431 (= lt!97419 (choose!1067 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128468 () Bool)

(assert (=> d!57431 e!128468))

(declare-fun res!92230 () Bool)

(assert (=> d!57431 (=> (not res!92230) (not e!128468))))

(assert (=> d!57431 (= res!92230 (isStrictlySorted!357 (toList!1254 lt!96808)))))

(assert (=> d!57431 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000) lt!97419)))

(declare-fun b!195350 () Bool)

(assert (=> b!195350 (= e!128468 (containsKey!249 (toList!1254 lt!96808) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57431 res!92230) b!195350))

(assert (=> d!57431 m!221509))

(assert (=> d!57431 m!221509))

(assert (=> d!57431 m!221511))

(declare-fun m!222941 () Bool)

(assert (=> d!57431 m!222941))

(assert (=> d!57431 m!222267))

(assert (=> b!195350 m!221505))

(assert (=> b!194499 d!57431))

(assert (=> b!194499 d!57323))

(assert (=> b!194499 d!57105))

(assert (=> b!194547 d!57043))

(declare-fun b!195352 () Bool)

(declare-fun e!128469 () Option!251)

(declare-fun e!128470 () Option!251)

(assert (=> b!195352 (= e!128469 e!128470)))

(declare-fun c!35377 () Bool)

(assert (=> b!195352 (= c!35377 (and ((_ is Cons!2445) (t!7375 lt!96732)) (not (= (_1!1791 (h!3086 (t!7375 lt!96732))) (_1!1791 lt!96678)))))))

(declare-fun b!195351 () Bool)

(assert (=> b!195351 (= e!128469 (Some!250 (_2!1791 (h!3086 (t!7375 lt!96732)))))))

(declare-fun b!195353 () Bool)

(assert (=> b!195353 (= e!128470 (getValueByKey!245 (t!7375 (t!7375 lt!96732)) (_1!1791 lt!96678)))))

(declare-fun d!57433 () Bool)

(declare-fun c!35376 () Bool)

(assert (=> d!57433 (= c!35376 (and ((_ is Cons!2445) (t!7375 lt!96732)) (= (_1!1791 (h!3086 (t!7375 lt!96732))) (_1!1791 lt!96678))))))

(assert (=> d!57433 (= (getValueByKey!245 (t!7375 lt!96732) (_1!1791 lt!96678)) e!128469)))

(declare-fun b!195354 () Bool)

(assert (=> b!195354 (= e!128470 None!249)))

(assert (= (and d!57433 c!35376) b!195351))

(assert (= (and d!57433 (not c!35376)) b!195352))

(assert (= (and b!195352 c!35377) b!195353))

(assert (= (and b!195352 (not c!35377)) b!195354))

(declare-fun m!222943 () Bool)

(assert (=> b!195353 m!222943))

(assert (=> b!194316 d!57433))

(assert (=> b!194633 d!56989))

(assert (=> b!194633 d!56991))

(declare-fun d!57435 () Bool)

(declare-fun e!128472 () Bool)

(assert (=> d!57435 e!128472))

(declare-fun res!92231 () Bool)

(assert (=> d!57435 (=> res!92231 e!128472)))

(declare-fun lt!97420 () Bool)

(assert (=> d!57435 (= res!92231 (not lt!97420))))

(declare-fun lt!97421 () Bool)

(assert (=> d!57435 (= lt!97420 lt!97421)))

(declare-fun lt!97422 () Unit!5878)

(declare-fun e!128471 () Unit!5878)

(assert (=> d!57435 (= lt!97422 e!128471)))

(declare-fun c!35378 () Bool)

(assert (=> d!57435 (= c!35378 lt!97421)))

(assert (=> d!57435 (= lt!97421 (containsKey!249 (toList!1254 lt!96914) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57435 (= (contains!1379 lt!96914 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97420)))

(declare-fun b!195355 () Bool)

(declare-fun lt!97423 () Unit!5878)

(assert (=> b!195355 (= e!128471 lt!97423)))

(assert (=> b!195355 (= lt!97423 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96914) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195355 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96914) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195356 () Bool)

(declare-fun Unit!5934 () Unit!5878)

(assert (=> b!195356 (= e!128471 Unit!5934)))

(declare-fun b!195357 () Bool)

(assert (=> b!195357 (= e!128472 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57435 c!35378) b!195355))

(assert (= (and d!57435 (not c!35378)) b!195356))

(assert (= (and d!57435 (not res!92231)) b!195357))

(declare-fun m!222945 () Bool)

(assert (=> d!57435 m!222945))

(declare-fun m!222947 () Bool)

(assert (=> b!195355 m!222947))

(assert (=> b!195355 m!222747))

(assert (=> b!195355 m!222747))

(declare-fun m!222949 () Bool)

(assert (=> b!195355 m!222949))

(assert (=> b!195357 m!222747))

(assert (=> b!195357 m!222747))

(assert (=> b!195357 m!222949))

(assert (=> bm!19644 d!57435))

(declare-fun d!57437 () Bool)

(assert (=> d!57437 (= (inRange!0 (ite c!35099 (index!4946 lt!97041) (index!4949 lt!97041)) (mask!9223 thiss!1248)) (and (bvsge (ite c!35099 (index!4946 lt!97041) (index!4949 lt!97041)) #b00000000000000000000000000000000) (bvslt (ite c!35099 (index!4946 lt!97041) (index!4949 lt!97041)) (bvadd (mask!9223 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19669 d!57437))

(assert (=> b!194512 d!56677))

(declare-fun d!57439 () Bool)

(declare-fun e!128474 () Bool)

(assert (=> d!57439 e!128474))

(declare-fun res!92232 () Bool)

(assert (=> d!57439 (=> res!92232 e!128474)))

(declare-fun lt!97424 () Bool)

(assert (=> d!57439 (= res!92232 (not lt!97424))))

(declare-fun lt!97425 () Bool)

(assert (=> d!57439 (= lt!97424 lt!97425)))

(declare-fun lt!97426 () Unit!5878)

(declare-fun e!128473 () Unit!5878)

(assert (=> d!57439 (= lt!97426 e!128473)))

(declare-fun c!35379 () Bool)

(assert (=> d!57439 (= c!35379 lt!97425)))

(assert (=> d!57439 (= lt!97425 (containsKey!249 (toList!1254 lt!96972) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(assert (=> d!57439 (= (contains!1379 lt!96972 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) lt!97424)))

(declare-fun b!195358 () Bool)

(declare-fun lt!97427 () Unit!5878)

(assert (=> b!195358 (= e!128473 lt!97427)))

(assert (=> b!195358 (= lt!97427 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96972) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(assert (=> b!195358 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96972) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(declare-fun b!195359 () Bool)

(declare-fun Unit!5935 () Unit!5878)

(assert (=> b!195359 (= e!128473 Unit!5935)))

(declare-fun b!195360 () Bool)

(assert (=> b!195360 (= e!128474 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96972) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))))

(assert (= (and d!57439 c!35379) b!195358))

(assert (= (and d!57439 (not c!35379)) b!195359))

(assert (= (and d!57439 (not res!92232)) b!195360))

(declare-fun m!222951 () Bool)

(assert (=> d!57439 m!222951))

(declare-fun m!222953 () Bool)

(assert (=> b!195358 m!222953))

(assert (=> b!195358 m!221259))

(assert (=> b!195358 m!221259))

(declare-fun m!222955 () Bool)

(assert (=> b!195358 m!222955))

(assert (=> b!195360 m!221259))

(assert (=> b!195360 m!221259))

(assert (=> b!195360 m!222955))

(assert (=> d!56737 d!57439))

(declare-fun b!195362 () Bool)

(declare-fun e!128475 () Option!251)

(declare-fun e!128476 () Option!251)

(assert (=> b!195362 (= e!128475 e!128476)))

(declare-fun c!35381 () Bool)

(assert (=> b!195362 (= c!35381 (and ((_ is Cons!2445) lt!96975) (not (= (_1!1791 (h!3086 lt!96975)) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))))

(declare-fun b!195361 () Bool)

(assert (=> b!195361 (= e!128475 (Some!250 (_2!1791 (h!3086 lt!96975))))))

(declare-fun b!195363 () Bool)

(assert (=> b!195363 (= e!128476 (getValueByKey!245 (t!7375 lt!96975) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(declare-fun d!57441 () Bool)

(declare-fun c!35380 () Bool)

(assert (=> d!57441 (= c!35380 (and ((_ is Cons!2445) lt!96975) (= (_1!1791 (h!3086 lt!96975)) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))))

(assert (=> d!57441 (= (getValueByKey!245 lt!96975 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) e!128475)))

(declare-fun b!195364 () Bool)

(assert (=> b!195364 (= e!128476 None!249)))

(assert (= (and d!57441 c!35380) b!195361))

(assert (= (and d!57441 (not c!35380)) b!195362))

(assert (= (and b!195362 c!35381) b!195363))

(assert (= (and b!195362 (not c!35381)) b!195364))

(declare-fun m!222957 () Bool)

(assert (=> b!195363 m!222957))

(assert (=> d!56737 d!57441))

(declare-fun d!57443 () Bool)

(assert (=> d!57443 (= (getValueByKey!245 lt!96975 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) (Some!250 (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(declare-fun lt!97428 () Unit!5878)

(assert (=> d!57443 (= lt!97428 (choose!1068 lt!96975 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(declare-fun e!128477 () Bool)

(assert (=> d!57443 e!128477))

(declare-fun res!92233 () Bool)

(assert (=> d!57443 (=> (not res!92233) (not e!128477))))

(assert (=> d!57443 (= res!92233 (isStrictlySorted!357 lt!96975))))

(assert (=> d!57443 (= (lemmaContainsTupThenGetReturnValue!132 lt!96975 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) lt!97428)))

(declare-fun b!195365 () Bool)

(declare-fun res!92234 () Bool)

(assert (=> b!195365 (=> (not res!92234) (not e!128477))))

(assert (=> b!195365 (= res!92234 (containsKey!249 lt!96975 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(declare-fun b!195366 () Bool)

(assert (=> b!195366 (= e!128477 (contains!1381 lt!96975 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))))

(assert (= (and d!57443 res!92233) b!195365))

(assert (= (and b!195365 res!92234) b!195366))

(assert (=> d!57443 m!221253))

(declare-fun m!222959 () Bool)

(assert (=> d!57443 m!222959))

(declare-fun m!222961 () Bool)

(assert (=> d!57443 m!222961))

(declare-fun m!222963 () Bool)

(assert (=> b!195365 m!222963))

(declare-fun m!222965 () Bool)

(assert (=> b!195366 m!222965))

(assert (=> d!56737 d!57443))

(declare-fun call!19744 () List!2449)

(declare-fun c!35383 () Bool)

(declare-fun e!128478 () List!2449)

(declare-fun bm!19740 () Bool)

(assert (=> bm!19740 (= call!19744 ($colon$colon!103 e!128478 (ite c!35383 (h!3086 (toList!1254 lt!96838)) (tuple2!3561 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))))

(declare-fun c!35382 () Bool)

(assert (=> bm!19740 (= c!35382 c!35383)))

(declare-fun b!195367 () Bool)

(declare-fun e!128482 () List!2449)

(declare-fun call!19743 () List!2449)

(assert (=> b!195367 (= e!128482 call!19743)))

(declare-fun b!195368 () Bool)

(declare-fun c!35384 () Bool)

(assert (=> b!195368 (= c!35384 (and ((_ is Cons!2445) (toList!1254 lt!96838)) (bvsgt (_1!1791 (h!3086 (toList!1254 lt!96838))) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))))

(declare-fun e!128480 () List!2449)

(assert (=> b!195368 (= e!128482 e!128480)))

(declare-fun lt!97429 () List!2449)

(declare-fun b!195369 () Bool)

(declare-fun e!128481 () Bool)

(assert (=> b!195369 (= e!128481 (contains!1381 lt!97429 (tuple2!3561 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))))

(declare-fun bm!19741 () Bool)

(declare-fun call!19745 () List!2449)

(assert (=> bm!19741 (= call!19745 call!19743)))

(declare-fun b!195370 () Bool)

(declare-fun e!128479 () List!2449)

(assert (=> b!195370 (= e!128479 e!128482)))

(declare-fun c!35385 () Bool)

(assert (=> b!195370 (= c!35385 (and ((_ is Cons!2445) (toList!1254 lt!96838)) (= (_1!1791 (h!3086 (toList!1254 lt!96838))) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))))

(declare-fun d!57445 () Bool)

(assert (=> d!57445 e!128481))

(declare-fun res!92235 () Bool)

(assert (=> d!57445 (=> (not res!92235) (not e!128481))))

(assert (=> d!57445 (= res!92235 (isStrictlySorted!357 lt!97429))))

(assert (=> d!57445 (= lt!97429 e!128479)))

(assert (=> d!57445 (= c!35383 (and ((_ is Cons!2445) (toList!1254 lt!96838)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96838))) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))))

(assert (=> d!57445 (isStrictlySorted!357 (toList!1254 lt!96838))))

(assert (=> d!57445 (= (insertStrictlySorted!135 (toList!1254 lt!96838) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))) lt!97429)))

(declare-fun bm!19742 () Bool)

(assert (=> bm!19742 (= call!19743 call!19744)))

(declare-fun b!195371 () Bool)

(assert (=> b!195371 (= e!128480 call!19745)))

(declare-fun b!195372 () Bool)

(assert (=> b!195372 (= e!128478 (insertStrictlySorted!135 (t!7375 (toList!1254 lt!96838)) (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) (_2!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(declare-fun b!195373 () Bool)

(assert (=> b!195373 (= e!128480 call!19745)))

(declare-fun b!195374 () Bool)

(declare-fun res!92236 () Bool)

(assert (=> b!195374 (=> (not res!92236) (not e!128481))))

(assert (=> b!195374 (= res!92236 (containsKey!249 lt!97429 (_1!1791 (tuple2!3561 lt!96846 (minValue!3801 thiss!1248)))))))

(declare-fun b!195375 () Bool)

(assert (=> b!195375 (= e!128479 call!19744)))

(declare-fun b!195376 () Bool)

(assert (=> b!195376 (= e!128478 (ite c!35385 (t!7375 (toList!1254 lt!96838)) (ite c!35384 (Cons!2445 (h!3086 (toList!1254 lt!96838)) (t!7375 (toList!1254 lt!96838))) Nil!2446)))))

(assert (= (and d!57445 c!35383) b!195375))

(assert (= (and d!57445 (not c!35383)) b!195370))

(assert (= (and b!195370 c!35385) b!195367))

(assert (= (and b!195370 (not c!35385)) b!195368))

(assert (= (and b!195368 c!35384) b!195373))

(assert (= (and b!195368 (not c!35384)) b!195371))

(assert (= (or b!195373 b!195371) bm!19741))

(assert (= (or b!195367 bm!19741) bm!19742))

(assert (= (or b!195375 bm!19742) bm!19740))

(assert (= (and bm!19740 c!35382) b!195372))

(assert (= (and bm!19740 (not c!35382)) b!195376))

(assert (= (and d!57445 res!92235) b!195374))

(assert (= (and b!195374 res!92236) b!195369))

(declare-fun m!222967 () Bool)

(assert (=> bm!19740 m!222967))

(declare-fun m!222969 () Bool)

(assert (=> b!195374 m!222969))

(declare-fun m!222971 () Bool)

(assert (=> b!195369 m!222971))

(declare-fun m!222973 () Bool)

(assert (=> b!195372 m!222973))

(declare-fun m!222975 () Bool)

(assert (=> d!57445 m!222975))

(declare-fun m!222977 () Bool)

(assert (=> d!57445 m!222977))

(assert (=> d!56737 d!57445))

(declare-fun d!57447 () Bool)

(declare-fun lt!97430 () Bool)

(assert (=> d!57447 (= lt!97430 (select (content!155 (toList!1254 lt!97042)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(declare-fun e!128484 () Bool)

(assert (=> d!57447 (= lt!97430 e!128484)))

(declare-fun res!92237 () Bool)

(assert (=> d!57447 (=> (not res!92237) (not e!128484))))

(assert (=> d!57447 (= res!92237 ((_ is Cons!2445) (toList!1254 lt!97042)))))

(assert (=> d!57447 (= (contains!1381 (toList!1254 lt!97042) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))) lt!97430)))

(declare-fun b!195377 () Bool)

(declare-fun e!128483 () Bool)

(assert (=> b!195377 (= e!128484 e!128483)))

(declare-fun res!92238 () Bool)

(assert (=> b!195377 (=> res!92238 e!128483)))

(assert (=> b!195377 (= res!92238 (= (h!3086 (toList!1254 lt!97042)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(declare-fun b!195378 () Bool)

(assert (=> b!195378 (= e!128483 (contains!1381 (t!7375 (toList!1254 lt!97042)) (tuple2!3561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3801 thiss!1248))))))

(assert (= (and d!57447 res!92237) b!195377))

(assert (= (and b!195377 (not res!92238)) b!195378))

(declare-fun m!222979 () Bool)

(assert (=> d!57447 m!222979))

(declare-fun m!222981 () Bool)

(assert (=> d!57447 m!222981))

(declare-fun m!222983 () Bool)

(assert (=> b!195378 m!222983))

(assert (=> b!194493 d!57447))

(declare-fun lt!97431 () Bool)

(declare-fun d!57449 () Bool)

(assert (=> d!57449 (= lt!97431 (select (content!155 (toList!1254 lt!97020)) (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))

(declare-fun e!128486 () Bool)

(assert (=> d!57449 (= lt!97431 e!128486)))

(declare-fun res!92239 () Bool)

(assert (=> d!57449 (=> (not res!92239) (not e!128486))))

(assert (=> d!57449 (= res!92239 ((_ is Cons!2445) (toList!1254 lt!97020)))))

(assert (=> d!57449 (= (contains!1381 (toList!1254 lt!97020) (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))) lt!97431)))

(declare-fun b!195379 () Bool)

(declare-fun e!128485 () Bool)

(assert (=> b!195379 (= e!128486 e!128485)))

(declare-fun res!92240 () Bool)

(assert (=> b!195379 (=> res!92240 e!128485)))

(assert (=> b!195379 (= res!92240 (= (h!3086 (toList!1254 lt!97020)) (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))

(declare-fun b!195380 () Bool)

(assert (=> b!195380 (= e!128485 (contains!1381 (t!7375 (toList!1254 lt!97020)) (tuple2!3561 lt!96802 (zeroValue!3801 thiss!1248))))))

(assert (= (and d!57449 res!92239) b!195379))

(assert (= (and b!195379 (not res!92240)) b!195380))

(declare-fun m!222985 () Bool)

(assert (=> d!57449 m!222985))

(declare-fun m!222987 () Bool)

(assert (=> d!57449 m!222987))

(declare-fun m!222989 () Bool)

(assert (=> b!195380 m!222989))

(assert (=> b!194442 d!57449))

(declare-fun d!57451 () Bool)

(declare-fun e!128488 () Bool)

(assert (=> d!57451 e!128488))

(declare-fun res!92241 () Bool)

(assert (=> d!57451 (=> res!92241 e!128488)))

(declare-fun lt!97432 () Bool)

(assert (=> d!57451 (= res!92241 (not lt!97432))))

(declare-fun lt!97433 () Bool)

(assert (=> d!57451 (= lt!97432 lt!97433)))

(declare-fun lt!97434 () Unit!5878)

(declare-fun e!128487 () Unit!5878)

(assert (=> d!57451 (= lt!97434 e!128487)))

(declare-fun c!35386 () Bool)

(assert (=> d!57451 (= c!35386 lt!97433)))

(assert (=> d!57451 (= lt!97433 (containsKey!249 (toList!1254 lt!96963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57451 (= (contains!1379 lt!96963 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97432)))

(declare-fun b!195381 () Bool)

(declare-fun lt!97435 () Unit!5878)

(assert (=> b!195381 (= e!128487 lt!97435)))

(assert (=> b!195381 (= lt!97435 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195381 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195382 () Bool)

(declare-fun Unit!5936 () Unit!5878)

(assert (=> b!195382 (= e!128487 Unit!5936)))

(declare-fun b!195383 () Bool)

(assert (=> b!195383 (= e!128488 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57451 c!35386) b!195381))

(assert (= (and d!57451 (not c!35386)) b!195382))

(assert (= (and d!57451 (not res!92241)) b!195383))

(declare-fun m!222991 () Bool)

(assert (=> d!57451 m!222991))

(declare-fun m!222993 () Bool)

(assert (=> b!195381 m!222993))

(declare-fun m!222995 () Bool)

(assert (=> b!195381 m!222995))

(assert (=> b!195381 m!222995))

(declare-fun m!222997 () Bool)

(assert (=> b!195381 m!222997))

(assert (=> b!195383 m!222995))

(assert (=> b!195383 m!222995))

(assert (=> b!195383 m!222997))

(assert (=> d!56717 d!57451))

(assert (=> d!56717 d!56689))

(declare-fun d!57453 () Bool)

(declare-fun res!92242 () Bool)

(declare-fun e!128489 () Bool)

(assert (=> d!57453 (=> res!92242 e!128489)))

(assert (=> d!57453 (= res!92242 (and ((_ is Cons!2445) (t!7375 (toList!1254 lt!96675))) (= (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96675)))) key!828)))))

(assert (=> d!57453 (= (containsKey!249 (t!7375 (toList!1254 lt!96675)) key!828) e!128489)))

(declare-fun b!195384 () Bool)

(declare-fun e!128490 () Bool)

(assert (=> b!195384 (= e!128489 e!128490)))

(declare-fun res!92243 () Bool)

(assert (=> b!195384 (=> (not res!92243) (not e!128490))))

(assert (=> b!195384 (= res!92243 (and (or (not ((_ is Cons!2445) (t!7375 (toList!1254 lt!96675)))) (bvsle (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96675)))) key!828)) ((_ is Cons!2445) (t!7375 (toList!1254 lt!96675))) (bvslt (_1!1791 (h!3086 (t!7375 (toList!1254 lt!96675)))) key!828)))))

(declare-fun b!195385 () Bool)

(assert (=> b!195385 (= e!128490 (containsKey!249 (t!7375 (t!7375 (toList!1254 lt!96675))) key!828))))

(assert (= (and d!57453 (not res!92242)) b!195384))

(assert (= (and b!195384 res!92243) b!195385))

(declare-fun m!222999 () Bool)

(assert (=> b!195385 m!222999))

(assert (=> b!194465 d!57453))

(declare-fun b!195387 () Bool)

(declare-fun e!128491 () Option!251)

(declare-fun e!128492 () Option!251)

(assert (=> b!195387 (= e!128491 e!128492)))

(declare-fun c!35388 () Bool)

(assert (=> b!195387 (= c!35388 (and ((_ is Cons!2445) (t!7375 lt!96820)) (not (= (_1!1791 (h!3086 (t!7375 lt!96820))) (_1!1791 lt!96678)))))))

(declare-fun b!195386 () Bool)

(assert (=> b!195386 (= e!128491 (Some!250 (_2!1791 (h!3086 (t!7375 lt!96820)))))))

(declare-fun b!195388 () Bool)

(assert (=> b!195388 (= e!128492 (getValueByKey!245 (t!7375 (t!7375 lt!96820)) (_1!1791 lt!96678)))))

(declare-fun d!57455 () Bool)

(declare-fun c!35387 () Bool)

(assert (=> d!57455 (= c!35387 (and ((_ is Cons!2445) (t!7375 lt!96820)) (= (_1!1791 (h!3086 (t!7375 lt!96820))) (_1!1791 lt!96678))))))

(assert (=> d!57455 (= (getValueByKey!245 (t!7375 lt!96820) (_1!1791 lt!96678)) e!128491)))

(declare-fun b!195389 () Bool)

(assert (=> b!195389 (= e!128492 None!249)))

(assert (= (and d!57455 c!35387) b!195386))

(assert (= (and d!57455 (not c!35387)) b!195387))

(assert (= (and b!195387 c!35388) b!195388))

(assert (= (and b!195387 (not c!35388)) b!195389))

(declare-fun m!223001 () Bool)

(assert (=> b!195388 m!223001))

(assert (=> b!194617 d!57455))

(assert (=> b!194291 d!57405))

(declare-fun d!57457 () Bool)

(assert (=> d!57457 (= (isEmpty!488 lt!96963) (isEmpty!489 (toList!1254 lt!96963)))))

(declare-fun bs!7802 () Bool)

(assert (= bs!7802 d!57457))

(declare-fun m!223003 () Bool)

(assert (=> bs!7802 m!223003))

(assert (=> b!194392 d!57457))

(declare-fun d!57459 () Bool)

(assert (=> d!57459 (= (apply!188 lt!96914 (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000)) (get!2238 (getValueByKey!245 (toList!1254 lt!96914) (select (arr!3875 (_keys!5954 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7803 () Bool)

(assert (= bs!7803 d!57459))

(assert (=> bs!7803 m!220877))

(assert (=> bs!7803 m!222165))

(assert (=> bs!7803 m!222165))

(declare-fun m!223005 () Bool)

(assert (=> bs!7803 m!223005))

(assert (=> b!194275 d!57459))

(declare-fun d!57461 () Bool)

(declare-fun c!35389 () Bool)

(assert (=> d!57461 (= c!35389 ((_ is ValueCellFull!1902) (select (arr!3876 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!128493 () V!5635)

(assert (=> d!57461 (= (get!2237 (select (arr!3876 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!128493)))

(declare-fun b!195390 () Bool)

(assert (=> b!195390 (= e!128493 (get!2239 (select (arr!3876 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195391 () Bool)

(assert (=> b!195391 (= e!128493 (get!2240 (select (arr!3876 (array!8236 (store (arr!3876 (_values!3943 thiss!1248)) (index!4947 lt!96677) (ValueCellFull!1902 v!309)) (size!4200 (_values!3943 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3960 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57461 c!35389) b!195390))

(assert (= (and d!57461 (not c!35389)) b!195391))

(assert (=> b!195390 m!221087))

(assert (=> b!195390 m!220881))

(declare-fun m!223007 () Bool)

(assert (=> b!195390 m!223007))

(assert (=> b!195391 m!221087))

(assert (=> b!195391 m!220881))

(declare-fun m!223009 () Bool)

(assert (=> b!195391 m!223009))

(assert (=> b!194275 d!57461))

(declare-fun d!57463 () Bool)

(declare-fun e!128495 () Bool)

(assert (=> d!57463 e!128495))

(declare-fun res!92244 () Bool)

(assert (=> d!57463 (=> res!92244 e!128495)))

(declare-fun lt!97436 () Bool)

(assert (=> d!57463 (= res!92244 (not lt!97436))))

(declare-fun lt!97437 () Bool)

(assert (=> d!57463 (= lt!97436 lt!97437)))

(declare-fun lt!97438 () Unit!5878)

(declare-fun e!128494 () Unit!5878)

(assert (=> d!57463 (= lt!97438 e!128494)))

(declare-fun c!35390 () Bool)

(assert (=> d!57463 (= c!35390 lt!97437)))

(assert (=> d!57463 (= lt!97437 (containsKey!249 (toList!1254 lt!96914) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57463 (= (contains!1379 lt!96914 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97436)))

(declare-fun b!195392 () Bool)

(declare-fun lt!97439 () Unit!5878)

(assert (=> b!195392 (= e!128494 lt!97439)))

(assert (=> b!195392 (= lt!97439 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96914) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195392 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96914) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195393 () Bool)

(declare-fun Unit!5937 () Unit!5878)

(assert (=> b!195393 (= e!128494 Unit!5937)))

(declare-fun b!195394 () Bool)

(assert (=> b!195394 (= e!128495 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57463 c!35390) b!195392))

(assert (= (and d!57463 (not c!35390)) b!195393))

(assert (= (and d!57463 (not res!92244)) b!195394))

(declare-fun m!223011 () Bool)

(assert (=> d!57463 m!223011))

(declare-fun m!223013 () Bool)

(assert (=> b!195392 m!223013))

(assert (=> b!195392 m!222839))

(assert (=> b!195392 m!222839))

(declare-fun m!223015 () Bool)

(assert (=> b!195392 m!223015))

(assert (=> b!195394 m!222839))

(assert (=> b!195394 m!222839))

(assert (=> b!195394 m!223015))

(assert (=> bm!19646 d!57463))

(declare-fun d!57465 () Bool)

(declare-fun res!92245 () Bool)

(declare-fun e!128496 () Bool)

(assert (=> d!57465 (=> res!92245 e!128496)))

(assert (=> d!57465 (= res!92245 (and ((_ is Cons!2445) (toList!1254 lt!96808)) (= (_1!1791 (h!3086 (toList!1254 lt!96808))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57465 (= (containsKey!249 (toList!1254 lt!96808) #b1000000000000000000000000000000000000000000000000000000000000000) e!128496)))

(declare-fun b!195395 () Bool)

(declare-fun e!128497 () Bool)

(assert (=> b!195395 (= e!128496 e!128497)))

(declare-fun res!92246 () Bool)

(assert (=> b!195395 (=> (not res!92246) (not e!128497))))

(assert (=> b!195395 (= res!92246 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96808))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96808))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2445) (toList!1254 lt!96808)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96808))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195396 () Bool)

(assert (=> b!195396 (= e!128497 (containsKey!249 (t!7375 (toList!1254 lt!96808)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57465 (not res!92245)) b!195395))

(assert (= (and b!195395 res!92246) b!195396))

(declare-fun m!223017 () Bool)

(assert (=> b!195396 m!223017))

(assert (=> d!56845 d!57465))

(declare-fun lt!97440 () Bool)

(declare-fun d!57467 () Bool)

(assert (=> d!57467 (= lt!97440 (select (content!155 (toList!1254 lt!96972)) (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))

(declare-fun e!128499 () Bool)

(assert (=> d!57467 (= lt!97440 e!128499)))

(declare-fun res!92247 () Bool)

(assert (=> d!57467 (=> (not res!92247) (not e!128499))))

(assert (=> d!57467 (= res!92247 ((_ is Cons!2445) (toList!1254 lt!96972)))))

(assert (=> d!57467 (= (contains!1381 (toList!1254 lt!96972) (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))) lt!97440)))

(declare-fun b!195397 () Bool)

(declare-fun e!128498 () Bool)

(assert (=> b!195397 (= e!128499 e!128498)))

(declare-fun res!92248 () Bool)

(assert (=> b!195397 (=> res!92248 e!128498)))

(assert (=> b!195397 (= res!92248 (= (h!3086 (toList!1254 lt!96972)) (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))

(declare-fun b!195398 () Bool)

(assert (=> b!195398 (= e!128498 (contains!1381 (t!7375 (toList!1254 lt!96972)) (tuple2!3561 lt!96846 (minValue!3801 thiss!1248))))))

(assert (= (and d!57467 res!92247) b!195397))

(assert (= (and b!195397 (not res!92248)) b!195398))

(declare-fun m!223019 () Bool)

(assert (=> d!57467 m!223019))

(declare-fun m!223021 () Bool)

(assert (=> d!57467 m!223021))

(declare-fun m!223023 () Bool)

(assert (=> b!195398 m!223023))

(assert (=> b!194410 d!57467))

(declare-fun d!57469 () Bool)

(declare-fun c!35391 () Bool)

(assert (=> d!57469 (= c!35391 ((_ is Nil!2446) (toList!1254 lt!96817)))))

(declare-fun e!128500 () (InoxSet tuple2!3560))

(assert (=> d!57469 (= (content!155 (toList!1254 lt!96817)) e!128500)))

(declare-fun b!195399 () Bool)

(assert (=> b!195399 (= e!128500 ((as const (Array tuple2!3560 Bool)) false))))

(declare-fun b!195400 () Bool)

(assert (=> b!195400 (= e!128500 ((_ map or) (store ((as const (Array tuple2!3560 Bool)) false) (h!3086 (toList!1254 lt!96817)) true) (content!155 (t!7375 (toList!1254 lt!96817)))))))

(assert (= (and d!57469 c!35391) b!195399))

(assert (= (and d!57469 (not c!35391)) b!195400))

(declare-fun m!223025 () Bool)

(assert (=> b!195400 m!223025))

(declare-fun m!223027 () Bool)

(assert (=> b!195400 m!223027))

(assert (=> d!56715 d!57469))

(declare-fun d!57471 () Bool)

(declare-fun res!92249 () Bool)

(declare-fun e!128501 () Bool)

(assert (=> d!57471 (=> res!92249 e!128501)))

(assert (=> d!57471 (= res!92249 (and ((_ is Cons!2445) (toList!1254 lt!96729)) (= (_1!1791 (h!3086 (toList!1254 lt!96729))) (_1!1791 lt!96678))))))

(assert (=> d!57471 (= (containsKey!249 (toList!1254 lt!96729) (_1!1791 lt!96678)) e!128501)))

(declare-fun b!195401 () Bool)

(declare-fun e!128502 () Bool)

(assert (=> b!195401 (= e!128501 e!128502)))

(declare-fun res!92250 () Bool)

(assert (=> b!195401 (=> (not res!92250) (not e!128502))))

(assert (=> b!195401 (= res!92250 (and (or (not ((_ is Cons!2445) (toList!1254 lt!96729))) (bvsle (_1!1791 (h!3086 (toList!1254 lt!96729))) (_1!1791 lt!96678))) ((_ is Cons!2445) (toList!1254 lt!96729)) (bvslt (_1!1791 (h!3086 (toList!1254 lt!96729))) (_1!1791 lt!96678))))))

(declare-fun b!195402 () Bool)

(assert (=> b!195402 (= e!128502 (containsKey!249 (t!7375 (toList!1254 lt!96729)) (_1!1791 lt!96678)))))

(assert (= (and d!57471 (not res!92249)) b!195401))

(assert (= (and b!195401 res!92250) b!195402))

(declare-fun m!223029 () Bool)

(assert (=> b!195402 m!223029))

(assert (=> d!56705 d!57471))

(declare-fun d!57473 () Bool)

(declare-fun res!92251 () Bool)

(declare-fun e!128503 () Bool)

(assert (=> d!57473 (=> res!92251 e!128503)))

(assert (=> d!57473 (= res!92251 (and ((_ is Cons!2445) (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))) (= (_1!1791 (h!3086 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))) lt!96795)))))

(assert (=> d!57473 (= (containsKey!249 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))) lt!96795) e!128503)))

(declare-fun b!195403 () Bool)

(declare-fun e!128504 () Bool)

(assert (=> b!195403 (= e!128503 e!128504)))

(declare-fun res!92252 () Bool)

(assert (=> b!195403 (=> (not res!92252) (not e!128504))))

(assert (=> b!195403 (= res!92252 (and (or (not ((_ is Cons!2445) (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))) (bvsle (_1!1791 (h!3086 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))) lt!96795)) ((_ is Cons!2445) (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))) (bvslt (_1!1791 (h!3086 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248)))))) lt!96795)))))

(declare-fun b!195404 () Bool)

(assert (=> b!195404 (= e!128504 (containsKey!249 (t!7375 (toList!1254 (+!322 lt!96799 (tuple2!3561 lt!96815 (zeroValue!3801 thiss!1248))))) lt!96795))))

(assert (= (and d!57473 (not res!92251)) b!195403))

(assert (= (and b!195403 res!92252) b!195404))

(declare-fun m!223031 () Bool)

(assert (=> b!195404 m!223031))

(assert (=> d!56767 d!57473))

(assert (=> d!56721 d!56719))

(assert (=> d!56721 d!56723))

(assert (=> d!56721 d!56725))

(declare-fun d!57475 () Bool)

(assert (=> d!57475 (= (apply!188 (+!322 lt!96853 (tuple2!3561 lt!96844 (minValue!3801 thiss!1248))) lt!96835) (apply!188 lt!96853 lt!96835))))

(assert (=> d!57475 true))

(declare-fun _$34!1095 () Unit!5878)

(assert (=> d!57475 (= (choose!1069 lt!96853 lt!96844 (minValue!3801 thiss!1248) lt!96835) _$34!1095)))

(declare-fun bs!7804 () Bool)

(assert (= bs!7804 d!57475))

(assert (=> bs!7804 m!220985))

(assert (=> bs!7804 m!220985))

(assert (=> bs!7804 m!221003))

(assert (=> bs!7804 m!220997))

(assert (=> d!56721 d!57475))

(declare-fun d!57477 () Bool)

(declare-fun e!128506 () Bool)

(assert (=> d!57477 e!128506))

(declare-fun res!92253 () Bool)

(assert (=> d!57477 (=> res!92253 e!128506)))

(declare-fun lt!97441 () Bool)

(assert (=> d!57477 (= res!92253 (not lt!97441))))

(declare-fun lt!97442 () Bool)

(assert (=> d!57477 (= lt!97441 lt!97442)))

(declare-fun lt!97443 () Unit!5878)

(declare-fun e!128505 () Unit!5878)

(assert (=> d!57477 (= lt!97443 e!128505)))

(declare-fun c!35392 () Bool)

(assert (=> d!57477 (= c!35392 lt!97442)))

(assert (=> d!57477 (= lt!97442 (containsKey!249 (toList!1254 lt!96853) lt!96835))))

(assert (=> d!57477 (= (contains!1379 lt!96853 lt!96835) lt!97441)))

(declare-fun b!195405 () Bool)

(declare-fun lt!97444 () Unit!5878)

(assert (=> b!195405 (= e!128505 lt!97444)))

(assert (=> b!195405 (= lt!97444 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1254 lt!96853) lt!96835))))

(assert (=> b!195405 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96853) lt!96835))))

(declare-fun b!195406 () Bool)

(declare-fun Unit!5938 () Unit!5878)

(assert (=> b!195406 (= e!128505 Unit!5938)))

(declare-fun b!195407 () Bool)

(assert (=> b!195407 (= e!128506 (isDefined!198 (getValueByKey!245 (toList!1254 lt!96853) lt!96835)))))

(assert (= (and d!57477 c!35392) b!195405))

(assert (= (and d!57477 (not c!35392)) b!195406))

(assert (= (and d!57477 (not res!92253)) b!195407))

(declare-fun m!223033 () Bool)

(assert (=> d!57477 m!223033))

(declare-fun m!223035 () Bool)

(assert (=> b!195405 m!223035))

(assert (=> b!195405 m!221215))

(assert (=> b!195405 m!221215))

(declare-fun m!223037 () Bool)

(assert (=> b!195405 m!223037))

(assert (=> b!195407 m!221215))

(assert (=> b!195407 m!221215))

(assert (=> b!195407 m!223037))

(assert (=> d!56721 d!57477))

(declare-fun b!195408 () Bool)

(declare-fun e!128509 () Bool)

(declare-fun e!128508 () Bool)

(assert (=> b!195408 (= e!128509 e!128508)))

(declare-fun c!35393 () Bool)

(assert (=> b!195408 (= c!35393 (validKeyInArray!0 (select (arr!3875 (_keys!5954 lt!96671)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195409 () Bool)

(declare-fun e!128507 () Bool)

(declare-fun call!19746 () Bool)

(assert (=> b!195409 (= e!128507 call!19746)))

(declare-fun b!195410 () Bool)

(assert (=> b!195410 (= e!128508 e!128507)))

(declare-fun lt!97445 () (_ BitVec 64))

(assert (=> b!195410 (= lt!97445 (select (arr!3875 (_keys!5954 lt!96671)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!97447 () Unit!5878)

(assert (=> b!195410 (= lt!97447 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5954 lt!96671) lt!97445 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!195410 (arrayContainsKey!0 (_keys!5954 lt!96671) lt!97445 #b00000000000000000000000000000000)))

(declare-fun lt!97446 () Unit!5878)

(assert (=> b!195410 (= lt!97446 lt!97447)))

(declare-fun res!92254 () Bool)

(assert (=> b!195410 (= res!92254 (= (seekEntryOrOpen!0 (select (arr!3875 (_keys!5954 lt!96671)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5954 lt!96671) (mask!9223 lt!96671)) (Found!694 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195410 (=> (not res!92254) (not e!128507))))

(declare-fun d!57479 () Bool)

(declare-fun res!92255 () Bool)

(assert (=> d!57479 (=> res!92255 e!128509)))

(assert (=> d!57479 (= res!92255 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4199 (_keys!5954 lt!96671))))))

(assert (=> d!57479 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5954 lt!96671) (mask!9223 lt!96671)) e!128509)))

(declare-fun bm!19743 () Bool)

(assert (=> bm!19743 (= call!19746 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5954 lt!96671) (mask!9223 lt!96671)))))

(declare-fun b!195411 () Bool)

(assert (=> b!195411 (= e!128508 call!19746)))

(assert (= (and d!57479 (not res!92255)) b!195408))

(assert (= (and b!195408 c!35393) b!195410))

(assert (= (and b!195408 (not c!35393)) b!195411))

(assert (= (and b!195410 res!92254) b!195409))

(assert (= (or b!195409 b!195411) bm!19743))

(assert (=> b!195408 m!221899))

(assert (=> b!195408 m!221899))

(assert (=> b!195408 m!221901))

(assert (=> b!195410 m!221899))

(declare-fun m!223039 () Bool)

(assert (=> b!195410 m!223039))

(declare-fun m!223041 () Bool)

(assert (=> b!195410 m!223041))

(assert (=> b!195410 m!221899))

(declare-fun m!223043 () Bool)

(assert (=> b!195410 m!223043))

(declare-fun m!223045 () Bool)

(assert (=> bm!19743 m!223045))

(assert (=> bm!19664 d!57479))

(declare-fun d!57481 () Bool)

(declare-fun res!92256 () Bool)

(declare-fun e!128510 () Bool)

(assert (=> d!57481 (=> res!92256 e!128510)))

(assert (=> d!57481 (= res!92256 (and ((_ is Cons!2445) lt!96939) (= (_1!1791 (h!3086 lt!96939)) (_1!1791 lt!96678))))))

(assert (=> d!57481 (= (containsKey!249 lt!96939 (_1!1791 lt!96678)) e!128510)))

(declare-fun b!195412 () Bool)

(declare-fun e!128511 () Bool)

(assert (=> b!195412 (= e!128510 e!128511)))

(declare-fun res!92257 () Bool)

(assert (=> b!195412 (=> (not res!92257) (not e!128511))))

(assert (=> b!195412 (= res!92257 (and (or (not ((_ is Cons!2445) lt!96939)) (bvsle (_1!1791 (h!3086 lt!96939)) (_1!1791 lt!96678))) ((_ is Cons!2445) lt!96939) (bvslt (_1!1791 (h!3086 lt!96939)) (_1!1791 lt!96678))))))

(declare-fun b!195413 () Bool)

(assert (=> b!195413 (= e!128511 (containsKey!249 (t!7375 lt!96939) (_1!1791 lt!96678)))))

(assert (= (and d!57481 (not res!92256)) b!195412))

(assert (= (and b!195412 res!92257) b!195413))

(declare-fun m!223047 () Bool)

(assert (=> b!195413 m!223047))

(assert (=> b!194351 d!57481))

(declare-fun d!57483 () Bool)

(declare-fun res!92258 () Bool)

(declare-fun e!128512 () Bool)

(assert (=> d!57483 (=> res!92258 e!128512)))

(assert (=> d!57483 (= res!92258 (= (select (arr!3875 (_keys!5954 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!828))))

(assert (=> d!57483 (= (arrayContainsKey!0 (_keys!5954 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!128512)))

(declare-fun b!195414 () Bool)

(declare-fun e!128513 () Bool)

(assert (=> b!195414 (= e!128512 e!128513)))

(declare-fun res!92259 () Bool)

(assert (=> b!195414 (=> (not res!92259) (not e!128513))))

(assert (=> b!195414 (= res!92259 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!4199 (_keys!5954 thiss!1248))))))

(declare-fun b!195415 () Bool)

(assert (=> b!195415 (= e!128513 (arrayContainsKey!0 (_keys!5954 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!57483 (not res!92258)) b!195414))

(assert (= (and b!195414 res!92259) b!195415))

(assert (=> d!57483 m!221983))

(declare-fun m!223049 () Bool)

(assert (=> b!195415 m!223049))

(assert (=> b!194538 d!57483))

(declare-fun d!57485 () Bool)

(declare-fun lt!97448 () Bool)

(assert (=> d!57485 (= lt!97448 (select (content!155 (t!7375 (toList!1254 lt!96817))) lt!96678))))

(declare-fun e!128515 () Bool)

(assert (=> d!57485 (= lt!97448 e!128515)))

(declare-fun res!92260 () Bool)

(assert (=> d!57485 (=> (not res!92260) (not e!128515))))

(assert (=> d!57485 (= res!92260 ((_ is Cons!2445) (t!7375 (toList!1254 lt!96817))))))

(assert (=> d!57485 (= (contains!1381 (t!7375 (toList!1254 lt!96817)) lt!96678) lt!97448)))

(declare-fun b!195416 () Bool)

(declare-fun e!128514 () Bool)

(assert (=> b!195416 (= e!128515 e!128514)))

(declare-fun res!92261 () Bool)

(assert (=> b!195416 (=> res!92261 e!128514)))

(assert (=> b!195416 (= res!92261 (= (h!3086 (t!7375 (toList!1254 lt!96817))) lt!96678))))

(declare-fun b!195417 () Bool)

(assert (=> b!195417 (= e!128514 (contains!1381 (t!7375 (t!7375 (toList!1254 lt!96817))) lt!96678))))

(assert (= (and d!57485 res!92260) b!195416))

(assert (= (and b!195416 (not res!92261)) b!195417))

(assert (=> d!57485 m!223027))

(declare-fun m!223051 () Bool)

(assert (=> d!57485 m!223051))

(declare-fun m!223053 () Bool)

(assert (=> b!195417 m!223053))

(assert (=> b!194365 d!57485))

(assert (=> b!194527 d!56677))

(declare-fun mapIsEmpty!7777 () Bool)

(declare-fun mapRes!7777 () Bool)

(assert (=> mapIsEmpty!7777 mapRes!7777))

(declare-fun b!195419 () Bool)

(declare-fun e!128516 () Bool)

(assert (=> b!195419 (= e!128516 tp_is_empty!4491)))

(declare-fun condMapEmpty!7777 () Bool)

(declare-fun mapDefault!7777 () ValueCell!1902)

(assert (=> mapNonEmpty!7776 (= condMapEmpty!7777 (= mapRest!7776 ((as const (Array (_ BitVec 32) ValueCell!1902)) mapDefault!7777)))))

(assert (=> mapNonEmpty!7776 (= tp!17037 (and e!128516 mapRes!7777))))

(declare-fun mapNonEmpty!7777 () Bool)

(declare-fun tp!17038 () Bool)

(declare-fun e!128517 () Bool)

(assert (=> mapNonEmpty!7777 (= mapRes!7777 (and tp!17038 e!128517))))

(declare-fun mapValue!7777 () ValueCell!1902)

(declare-fun mapKey!7777 () (_ BitVec 32))

(declare-fun mapRest!7777 () (Array (_ BitVec 32) ValueCell!1902))

(assert (=> mapNonEmpty!7777 (= mapRest!7776 (store mapRest!7777 mapKey!7777 mapValue!7777))))

(declare-fun b!195418 () Bool)

(assert (=> b!195418 (= e!128517 tp_is_empty!4491)))

(assert (= (and mapNonEmpty!7776 condMapEmpty!7777) mapIsEmpty!7777))

(assert (= (and mapNonEmpty!7776 (not condMapEmpty!7777)) mapNonEmpty!7777))

(assert (= (and mapNonEmpty!7777 ((_ is ValueCellFull!1902) mapValue!7777)) b!195418))

(assert (= (and mapNonEmpty!7776 ((_ is ValueCellFull!1902) mapDefault!7777)) b!195419))

(declare-fun m!223055 () Bool)

(assert (=> mapNonEmpty!7777 m!223055))

(declare-fun b_lambda!7525 () Bool)

(assert (= b_lambda!7509 (or (and b!193989 b_free!4719) b_lambda!7525)))

(declare-fun b_lambda!7527 () Bool)

(assert (= b_lambda!7513 (or (and b!193989 b_free!4719) b_lambda!7527)))

(declare-fun b_lambda!7529 () Bool)

(assert (= b_lambda!7521 (or (and b!193989 b_free!4719) b_lambda!7529)))

(declare-fun b_lambda!7531 () Bool)

(assert (= b_lambda!7511 (or (and b!193989 b_free!4719) b_lambda!7531)))

(declare-fun b_lambda!7533 () Bool)

(assert (= b_lambda!7523 (or (and b!193989 b_free!4719) b_lambda!7533)))

(declare-fun b_lambda!7535 () Bool)

(assert (= b_lambda!7497 (or (and b!193989 b_free!4719 (= (defaultEntry!3960 thiss!1248) (defaultEntry!3960 lt!96671))) b_lambda!7535)))

(declare-fun b_lambda!7537 () Bool)

(assert (= b_lambda!7515 (or (and b!193989 b_free!4719) b_lambda!7537)))

(check-sat (not d!56895) (not d!57039) (not d!56901) (not b_lambda!7499) (not bm!19730) (not b!195214) (not b!195016) (not b!194800) (not b!194665) (not bm!19727) (not d!56951) (not bm!19720) (not d!57097) (not b!195327) (not b!195105) (not b!195407) (not b!195023) (not b!194872) (not d!57273) (not b!195299) (not b!194843) (not b!195153) (not b!195388) (not b!194676) (not d!57447) (not d!56907) (not d!56891) (not d!57211) (not b!194785) (not b!195217) (not b!195357) (not b!194979) (not b!195319) (not d!57385) (not d!56917) (not d!57129) (not d!56921) (not d!57429) (not d!57335) (not d!57245) (not d!57025) (not b!195225) (not b!195197) (not b!195378) (not b!194912) (not b_lambda!7527) (not d!56905) (not d!57183) (not b!194789) (not b!195176) (not d!57007) (not d!57093) (not b_lambda!7531) (not d!57275) (not b!195102) (not b!195306) (not b!194925) (not b!194653) (not d!57205) (not d!57161) (not b!194689) (not b!194918) (not b!194740) (not d!57265) (not d!57389) (not b!195130) (not b_lambda!7537) (not b!195229) (not b!195059) (not b!195374) (not b!195278) (not b!195065) (not b!194885) (not d!57287) (not b!194677) (not b!194957) (not b!195149) (not b!194972) (not b!194869) (not d!56957) (not b!194756) (not d!57143) (not b!195366) (not b_lambda!7525) (not d!57349) (not b!194681) (not b!194730) (not b!195122) (not b!195178) (not b!194829) (not b!194899) (not d!57257) (not d!57411) (not b!194734) (not d!57451) (not d!56913) (not b!195027) (not b!195206) (not b!195000) (not b!194921) (not b!194825) (not b!195117) (not d!57271) (not d!56973) (not b!195236) (not d!57011) (not bm!19712) (not b!195021) (not bm!19743) (not b!194897) (not b!194973) (not d!56889) (not b!194936) (not b!194707) (not b!195400) (not b!195107) (not b!195056) (not d!56941) (not d!57179) (not b!194773) (not b!195258) (not b_lambda!7519) (not b!195156) (not b!195013) (not b!194878) b_and!11467 (not b!194909) (not b!194657) (not d!56899) (not d!57087) (not b!195338) (not b!195271) (not b!195312) (not b!195305) (not bm!19697) (not b!195162) (not b!195142) (not d!57173) (not d!57475) (not b!195358) (not d!57319) (not b!195139) (not b!194850) (not d!57303) (not bm!19690) (not d!56915) (not d!57289) (not b!194837) (not d!57101) (not d!57485) (not d!57421) (not b!195033) (not b!195350) (not b!194670) (not d!56909) (not b!194995) (not b!194696) (not b!195360) (not d!57115) (not b!195068) (not b!194726) (not b!194969) (not b!195372) (not b!195017) (not d!57467) (not b!195123) (not b!194839) (not d!57215) (not d!57409) (not d!57029) (not d!57113) (not b!194664) (not b!195183) (not b!194832) (not b!195273) (not d!56969) (not d!57155) (not d!56953) (not b!195150) (not b!195202) (not d!57089) (not d!57237) (not b!194818) (not d!56933) (not d!57457) (not d!57477) (not d!56877) (not b!194945) (not d!56893) (not d!57379) (not b!194971) (not d!56897) (not b!194866) (not d!56927) (not d!57055) (not d!57213) (not b!195336) (not b!195304) (not b!194985) (not b!195092) (not b!194834) (not b!195076) (not b!194863) (not b!194694) (not b!195243) (not b!194826) (not b!194771) (not b!195030) (not b!195347) (not b!195320) (not d!57371) (not b!194739) (not b!195186) (not d!57299) (not d!57445) (not d!57377) (not b!194699) (not b!195369) (not b!194905) (not d!56879) (not b!194672) (not b!195044) (not b!194642) (not b!195353) (not b!195355) (not b!194856) (not d!57359) (not b!194941) (not d!56981) (not b!194659) (not b!195296) (not b!195074) (not d!56919) (not d!57393) (not d!57255) (not b!195310) (not b!195413) (not b!195141) (not d!57003) (not d!57259) (not d!57401) (not b!195322) (not d!57263) (not b!195261) (not bm!19721) (not b!194902) (not b!194988) (not d!57313) (not b!195394) (not b_lambda!7517) (not b!194685) (not b!194679) (not d!57435) (not b!195248) (not b!195289) (not b!195405) (not b!195032) (not d!57127) (not b!194894) (not bm!19691) (not b!194781) (not b!194667) (not d!57247) (not b!194759) (not b!195343) (not b!195281) (not b_next!4719) (not b!195040) (not bm!19711) (not b!195314) (not d!57407) (not d!57329) (not b!195011) (not b!195009) (not b!195121) (not d!57135) (not b!194965) (not d!57027) (not d!57381) (not b!194942) (not d!57365) (not b!194901) (not d!57049) (not b!194932) (not d!57415) (not d!57233) (not bm!19710) (not b!195031) (not b!194795) (not b!195120) (not b!195255) (not d!57419) (not b!195250) (not b!195392) (not b!195035) (not d!57323) (not b!194658) (not d!57037) (not bm!19704) (not d!57021) (not d!56939) (not b!194762) (not b!194954) (not d!57149) (not b!194858) (not b!195078) (not b!194811) (not d!57431) (not b!195294) (not b!194933) (not d!57013) (not b!194823) (not b!194753) (not b!194890) (not d!57261) (not d!56925) (not d!57151) (not b!195188) (not d!57061) (not d!57065) (not b!195181) (not b!195324) (not b!194655) (not b!195099) (not b!194806) (not bm!19724) (not b!195124) (not bm!19740) (not b!194688) (not d!57047) (not b!195408) (not d!57253) (not b!194777) (not b!195391) (not b!194888) (not b!195303) (not d!57139) (not b_lambda!7483) (not d!57373) (not d!57053) (not b!195252) (not b!195087) (not d!57353) (not b!195241) (not d!56923) (not b!195266) (not d!56911) (not b!195002) (not b!195047) (not d!57221) (not d!57305) (not d!57031) (not d!57185) (not bm!19734) (not b!194919) (not b!195020) (not b!194815) (not b!194758) (not bm!19698) (not b!194817) (not b!195134) (not d!57063) (not b!194802) (not d!57015) (not b!195220) (not b!194865) (not b!195211) (not b!194692) (not d!57075) (not b!195189) (not d!56987) (not d!57169) (not b!195060) (not bm!19737) (not d!56965) (not b!195126) (not b!194767) (not b_lambda!7501) (not b!195222) (not d!57449) (not b!194674) (not b!194748) (not d!57073) (not b!195363) (not b!194797) (not b!195346) (not b!195192) (not d!57443) (not b!194645) (not d!56979) (not b!194976) (not b!194701) (not bm!19689) (not b!195329) (not b!194950) (not b!194666) (not b!194904) (not b!194981) (not b!195038) (not bm!19719) (not b!195284) (not d!57071) (not d!57297) (not b!195115) (not d!56975) (not d!57159) (not b!195321) (not b_lambda!7507) (not b!195381) (not b!195275) (not b!195118) (not b!195293) (not b!194984) (not b_lambda!7529) (not d!57281) (not b!194991) (not b!194929) (not b!195132) (not b!194847) (not b!195410) (not b!195113) (not b!195165) (not b!195396) (not b!195014) (not b!194746) (not d!56989) (not b!195349) (not b!195127) (not b!195158) (not b!195264) (not d!57079) (not b!194880) (not b!195404) (not b!195380) (not b!195200) (not d!57459) (not b!195018) (not b!195028) (not b!195307) (not d!57277) (not b!194931) (not b!194687) (not b!194709) (not b!194743) (not b!194860) (not b!195201) (not b!195315) (not b!195053) (not b!195402) (not d!56947) (not b!195208) (not b!194907) (not d!57231) (not bm!19715) (not d!57171) (not b!194893) (not d!57357) (not b!194723) (not b!194983) (not b!195213) (not b!194895) (not d!57249) (not b!194704) (not d!57387) (not b!195097) (not d!56971) (not b!194961) (not b_lambda!7535) (not b!195390) tp_is_empty!4491 (not d!57209) (not d!56983) (not b!195238) (not b!194751) (not b!195173) (not b!195049) (not b!195417) (not b!194774) (not b!195138) (not b!194845) (not b!194732) (not b!195365) (not bm!19707) (not b!195209) (not mapNonEmpty!7777) (not b!195061) (not b!194682) (not b!194928) (not d!57283) (not d!57395) (not d!57227) (not b!194716) (not b!195096) (not d!57309) (not b!194874) (not b!195233) (not b!195110) (not d!57045) (not b!195204) (not d!56985) (not d!57059) (not b!195317) (not b!195131) (not b_lambda!7533) (not b!194668) (not d!57153) (not b!195080) (not b!195245) (not b!194803) (not d!57267) (not bm!19701) (not d!56903) (not b!195094) (not b!195136) (not b!194998) (not b!194649) (not b!195287) (not b!195257) (not d!57225) (not b!195280) (not b!195385) (not b!195147) (not b!195333) (not b!195025) (not b!194948) (not b!194820) (not b!195116) (not b!194639) (not d!57439) (not d!57463) (not b!195330) (not d!56873) (not b!194882) (not b_lambda!7485) (not b!194737) (not d!57017) (not b!194809) (not b!195169) (not b!195144) (not bm!19694) (not d!57369) (not d!57099) (not b!195398) (not d!57165) (not d!57317) (not d!57223) (not b!194765) (not b!195195) (not d!57175) (not b!195301) (not b!194683) (not d!57091) (not b!194680) (not b!194934) (not b!194910) (not d!57241) (not b!194641) (not b_lambda!7505) (not d!57269) (not d!57251) (not d!57163) (not b!195019) (not bm!19716) (not b!195383) (not b!195041) (not bm!19731) (not b!194669) (not b!194793) (not d!57067) (not b!194939) (not b_lambda!7503) (not b!195415))
(check-sat b_and!11467 (not b_next!4719))
