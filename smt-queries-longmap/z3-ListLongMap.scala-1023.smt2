; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21760 () Bool)

(assert start!21760)

(declare-fun b!218991 () Bool)

(declare-fun b_free!5889 () Bool)

(declare-fun b_next!5889 () Bool)

(assert (=> b!218991 (= b_free!5889 (not b_next!5889))))

(declare-fun tp!20805 () Bool)

(declare-fun b_and!12781 () Bool)

(assert (=> b!218991 (= tp!20805 b_and!12781)))

(declare-fun b!218977 () Bool)

(declare-fun res!107340 () Bool)

(declare-fun e!142463 () Bool)

(assert (=> b!218977 (=> (not res!107340) (not e!142463))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!218977 (= res!107340 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218978 () Bool)

(declare-fun e!142460 () Bool)

(assert (=> b!218978 (= e!142463 e!142460)))

(declare-fun res!107342 () Bool)

(assert (=> b!218978 (=> (not res!107342) (not e!142460))))

(declare-datatypes ((SeekEntryResult!795 0))(
  ( (MissingZero!795 (index!5350 (_ BitVec 32))) (Found!795 (index!5351 (_ BitVec 32))) (Intermediate!795 (undefined!1607 Bool) (index!5352 (_ BitVec 32)) (x!22877 (_ BitVec 32))) (Undefined!795) (MissingVacant!795 (index!5353 (_ BitVec 32))) )
))
(declare-fun lt!111719 () SeekEntryResult!795)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218978 (= res!107342 (or (= lt!111719 (MissingZero!795 index!297)) (= lt!111719 (MissingVacant!795 index!297))))))

(declare-datatypes ((V!7315 0))(
  ( (V!7316 (val!2920 Int)) )
))
(declare-datatypes ((ValueCell!2532 0))(
  ( (ValueCellFull!2532 (v!4939 V!7315)) (EmptyCell!2532) )
))
(declare-datatypes ((array!10743 0))(
  ( (array!10744 (arr!5092 (Array (_ BitVec 32) ValueCell!2532)) (size!5424 (_ BitVec 32))) )
))
(declare-datatypes ((array!10745 0))(
  ( (array!10746 (arr!5093 (Array (_ BitVec 32) (_ BitVec 64))) (size!5425 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2964 0))(
  ( (LongMapFixedSize!2965 (defaultEntry!4135 Int) (mask!9918 (_ BitVec 32)) (extraKeys!3872 (_ BitVec 32)) (zeroValue!3976 V!7315) (minValue!3976 V!7315) (_size!1531 (_ BitVec 32)) (_keys!6185 array!10745) (_values!4118 array!10743) (_vacant!1531 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2964)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10745 (_ BitVec 32)) SeekEntryResult!795)

(assert (=> b!218978 (= lt!111719 (seekEntryOrOpen!0 key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(declare-fun call!20457 () Bool)

(declare-fun bm!20453 () Bool)

(declare-fun c!36435 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20453 (= call!20457 (inRange!0 (ite c!36435 (index!5350 lt!111719) (index!5353 lt!111719)) (mask!9918 thiss!1504)))))

(declare-fun b!218979 () Bool)

(declare-datatypes ((Unit!6529 0))(
  ( (Unit!6530) )
))
(declare-fun e!142462 () Unit!6529)

(declare-fun lt!111717 () Unit!6529)

(assert (=> b!218979 (= e!142462 lt!111717)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!203 (array!10745 array!10743 (_ BitVec 32) (_ BitVec 32) V!7315 V!7315 (_ BitVec 64) Int) Unit!6529)

(assert (=> b!218979 (= lt!111717 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!203 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) key!932 (defaultEntry!4135 thiss!1504)))))

(get-info :version)

(assert (=> b!218979 (= c!36435 ((_ is MissingZero!795) lt!111719))))

(declare-fun e!142468 () Bool)

(assert (=> b!218979 e!142468))

(declare-fun b!218980 () Bool)

(declare-fun e!142464 () Bool)

(declare-fun call!20456 () Bool)

(assert (=> b!218980 (= e!142464 (not call!20456))))

(declare-fun b!218981 () Bool)

(declare-fun res!107341 () Bool)

(declare-fun e!142456 () Bool)

(assert (=> b!218981 (=> (not res!107341) (not e!142456))))

(assert (=> b!218981 (= res!107341 call!20457)))

(assert (=> b!218981 (= e!142468 e!142456)))

(declare-fun b!218982 () Bool)

(declare-fun e!142461 () Bool)

(assert (=> b!218982 (= e!142461 (and (bvslt #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))) (bvsge (size!5425 (_keys!6185 thiss!1504)) #b01111111111111111111111111111111)))))

(declare-fun b!218984 () Bool)

(declare-fun Unit!6531 () Unit!6529)

(assert (=> b!218984 (= e!142462 Unit!6531)))

(declare-fun lt!111718 () Unit!6529)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!192 (array!10745 array!10743 (_ BitVec 32) (_ BitVec 32) V!7315 V!7315 (_ BitVec 64) Int) Unit!6529)

(assert (=> b!218984 (= lt!111718 (lemmaInListMapThenSeekEntryOrOpenFindsIt!192 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) key!932 (defaultEntry!4135 thiss!1504)))))

(assert (=> b!218984 false))

(declare-fun b!218985 () Bool)

(assert (=> b!218985 (= e!142456 (not call!20456))))

(declare-fun mapNonEmpty!9792 () Bool)

(declare-fun mapRes!9792 () Bool)

(declare-fun tp!20804 () Bool)

(declare-fun e!142466 () Bool)

(assert (=> mapNonEmpty!9792 (= mapRes!9792 (and tp!20804 e!142466))))

(declare-fun mapRest!9792 () (Array (_ BitVec 32) ValueCell!2532))

(declare-fun mapValue!9792 () ValueCell!2532)

(declare-fun mapKey!9792 () (_ BitVec 32))

(assert (=> mapNonEmpty!9792 (= (arr!5092 (_values!4118 thiss!1504)) (store mapRest!9792 mapKey!9792 mapValue!9792))))

(declare-fun b!218986 () Bool)

(declare-fun e!142465 () Bool)

(assert (=> b!218986 (= e!142465 ((_ is Undefined!795) lt!111719))))

(declare-fun mapIsEmpty!9792 () Bool)

(assert (=> mapIsEmpty!9792 mapRes!9792))

(declare-fun b!218987 () Bool)

(declare-fun e!142467 () Bool)

(declare-fun e!142457 () Bool)

(assert (=> b!218987 (= e!142467 (and e!142457 mapRes!9792))))

(declare-fun condMapEmpty!9792 () Bool)

(declare-fun mapDefault!9792 () ValueCell!2532)

(assert (=> b!218987 (= condMapEmpty!9792 (= (arr!5092 (_values!4118 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2532)) mapDefault!9792)))))

(declare-fun b!218988 () Bool)

(declare-fun res!107338 () Bool)

(assert (=> b!218988 (=> (not res!107338) (not e!142456))))

(assert (=> b!218988 (= res!107338 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5350 lt!111719)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218989 () Bool)

(declare-fun res!107337 () Bool)

(assert (=> b!218989 (= res!107337 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5353 lt!111719)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218989 (=> (not res!107337) (not e!142464))))

(declare-fun b!218990 () Bool)

(assert (=> b!218990 (= e!142460 e!142461)))

(declare-fun res!107339 () Bool)

(assert (=> b!218990 (=> (not res!107339) (not e!142461))))

(assert (=> b!218990 (= res!107339 (inRange!0 index!297 (mask!9918 thiss!1504)))))

(declare-fun lt!111720 () Unit!6529)

(assert (=> b!218990 (= lt!111720 e!142462)))

(declare-fun c!36436 () Bool)

(declare-datatypes ((tuple2!4334 0))(
  ( (tuple2!4335 (_1!2178 (_ BitVec 64)) (_2!2178 V!7315)) )
))
(declare-datatypes ((List!3237 0))(
  ( (Nil!3234) (Cons!3233 (h!3880 tuple2!4334) (t!8194 List!3237)) )
))
(declare-datatypes ((ListLongMap!3247 0))(
  ( (ListLongMap!3248 (toList!1639 List!3237)) )
))
(declare-fun contains!1480 (ListLongMap!3247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1167 (array!10745 array!10743 (_ BitVec 32) (_ BitVec 32) V!7315 V!7315 (_ BitVec 32) Int) ListLongMap!3247)

(assert (=> b!218990 (= c!36436 (contains!1480 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)) key!932))))

(declare-fun e!142458 () Bool)

(declare-fun tp_is_empty!5751 () Bool)

(declare-fun array_inv!3371 (array!10745) Bool)

(declare-fun array_inv!3372 (array!10743) Bool)

(assert (=> b!218991 (= e!142458 (and tp!20805 tp_is_empty!5751 (array_inv!3371 (_keys!6185 thiss!1504)) (array_inv!3372 (_values!4118 thiss!1504)) e!142467))))

(declare-fun res!107336 () Bool)

(assert (=> start!21760 (=> (not res!107336) (not e!142463))))

(declare-fun valid!1199 (LongMapFixedSize!2964) Bool)

(assert (=> start!21760 (= res!107336 (valid!1199 thiss!1504))))

(assert (=> start!21760 e!142463))

(assert (=> start!21760 e!142458))

(assert (=> start!21760 true))

(declare-fun b!218983 () Bool)

(assert (=> b!218983 (= e!142465 e!142464)))

(declare-fun res!107343 () Bool)

(assert (=> b!218983 (= res!107343 call!20457)))

(assert (=> b!218983 (=> (not res!107343) (not e!142464))))

(declare-fun b!218992 () Bool)

(declare-fun c!36437 () Bool)

(assert (=> b!218992 (= c!36437 ((_ is MissingVacant!795) lt!111719))))

(assert (=> b!218992 (= e!142468 e!142465)))

(declare-fun bm!20454 () Bool)

(declare-fun arrayContainsKey!0 (array!10745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20454 (= call!20456 (arrayContainsKey!0 (_keys!6185 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218993 () Bool)

(assert (=> b!218993 (= e!142457 tp_is_empty!5751)))

(declare-fun b!218994 () Bool)

(assert (=> b!218994 (= e!142466 tp_is_empty!5751)))

(assert (= (and start!21760 res!107336) b!218977))

(assert (= (and b!218977 res!107340) b!218978))

(assert (= (and b!218978 res!107342) b!218990))

(assert (= (and b!218990 c!36436) b!218984))

(assert (= (and b!218990 (not c!36436)) b!218979))

(assert (= (and b!218979 c!36435) b!218981))

(assert (= (and b!218979 (not c!36435)) b!218992))

(assert (= (and b!218981 res!107341) b!218988))

(assert (= (and b!218988 res!107338) b!218985))

(assert (= (and b!218992 c!36437) b!218983))

(assert (= (and b!218992 (not c!36437)) b!218986))

(assert (= (and b!218983 res!107343) b!218989))

(assert (= (and b!218989 res!107337) b!218980))

(assert (= (or b!218981 b!218983) bm!20453))

(assert (= (or b!218985 b!218980) bm!20454))

(assert (= (and b!218990 res!107339) b!218982))

(assert (= (and b!218987 condMapEmpty!9792) mapIsEmpty!9792))

(assert (= (and b!218987 (not condMapEmpty!9792)) mapNonEmpty!9792))

(assert (= (and mapNonEmpty!9792 ((_ is ValueCellFull!2532) mapValue!9792)) b!218994))

(assert (= (and b!218987 ((_ is ValueCellFull!2532) mapDefault!9792)) b!218993))

(assert (= b!218991 b!218987))

(assert (= start!21760 b!218991))

(declare-fun m!244667 () Bool)

(assert (=> start!21760 m!244667))

(declare-fun m!244669 () Bool)

(assert (=> b!218989 m!244669))

(declare-fun m!244671 () Bool)

(assert (=> b!218978 m!244671))

(declare-fun m!244673 () Bool)

(assert (=> b!218984 m!244673))

(declare-fun m!244675 () Bool)

(assert (=> b!218988 m!244675))

(declare-fun m!244677 () Bool)

(assert (=> b!218991 m!244677))

(declare-fun m!244679 () Bool)

(assert (=> b!218991 m!244679))

(declare-fun m!244681 () Bool)

(assert (=> mapNonEmpty!9792 m!244681))

(declare-fun m!244683 () Bool)

(assert (=> bm!20454 m!244683))

(declare-fun m!244685 () Bool)

(assert (=> bm!20453 m!244685))

(declare-fun m!244687 () Bool)

(assert (=> b!218979 m!244687))

(declare-fun m!244689 () Bool)

(assert (=> b!218990 m!244689))

(declare-fun m!244691 () Bool)

(assert (=> b!218990 m!244691))

(assert (=> b!218990 m!244691))

(declare-fun m!244693 () Bool)

(assert (=> b!218990 m!244693))

(check-sat (not b!218991) (not bm!20453) (not bm!20454) (not start!21760) (not b!218979) tp_is_empty!5751 (not b!218978) b_and!12781 (not b!218990) (not mapNonEmpty!9792) (not b!218984) (not b_next!5889))
(check-sat b_and!12781 (not b_next!5889))
(get-model)

(declare-fun d!58623 () Bool)

(assert (=> d!58623 (= (inRange!0 index!297 (mask!9918 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!9918 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!218990 d!58623))

(declare-fun d!58625 () Bool)

(declare-fun e!142512 () Bool)

(assert (=> d!58625 e!142512))

(declare-fun res!107370 () Bool)

(assert (=> d!58625 (=> res!107370 e!142512)))

(declare-fun lt!111744 () Bool)

(assert (=> d!58625 (= res!107370 (not lt!111744))))

(declare-fun lt!111742 () Bool)

(assert (=> d!58625 (= lt!111744 lt!111742)))

(declare-fun lt!111743 () Unit!6529)

(declare-fun e!142513 () Unit!6529)

(assert (=> d!58625 (= lt!111743 e!142513)))

(declare-fun c!36449 () Bool)

(assert (=> d!58625 (= c!36449 lt!111742)))

(declare-fun containsKey!252 (List!3237 (_ BitVec 64)) Bool)

(assert (=> d!58625 (= lt!111742 (containsKey!252 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932))))

(assert (=> d!58625 (= (contains!1480 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)) key!932) lt!111744)))

(declare-fun b!219055 () Bool)

(declare-fun lt!111741 () Unit!6529)

(assert (=> b!219055 (= e!142513 lt!111741)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!200 (List!3237 (_ BitVec 64)) Unit!6529)

(assert (=> b!219055 (= lt!111741 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932))))

(declare-datatypes ((Option!266 0))(
  ( (Some!265 (v!4941 V!7315)) (None!264) )
))
(declare-fun isDefined!201 (Option!266) Bool)

(declare-fun getValueByKey!260 (List!3237 (_ BitVec 64)) Option!266)

(assert (=> b!219055 (isDefined!201 (getValueByKey!260 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932))))

(declare-fun b!219056 () Bool)

(declare-fun Unit!6535 () Unit!6529)

(assert (=> b!219056 (= e!142513 Unit!6535)))

(declare-fun b!219057 () Bool)

(assert (=> b!219057 (= e!142512 (isDefined!201 (getValueByKey!260 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932)))))

(assert (= (and d!58625 c!36449) b!219055))

(assert (= (and d!58625 (not c!36449)) b!219056))

(assert (= (and d!58625 (not res!107370)) b!219057))

(declare-fun m!244723 () Bool)

(assert (=> d!58625 m!244723))

(declare-fun m!244725 () Bool)

(assert (=> b!219055 m!244725))

(declare-fun m!244727 () Bool)

(assert (=> b!219055 m!244727))

(assert (=> b!219055 m!244727))

(declare-fun m!244729 () Bool)

(assert (=> b!219055 m!244729))

(assert (=> b!219057 m!244727))

(assert (=> b!219057 m!244727))

(assert (=> b!219057 m!244729))

(assert (=> b!218990 d!58625))

(declare-fun bm!20475 () Bool)

(declare-fun call!20481 () ListLongMap!3247)

(declare-fun call!20482 () ListLongMap!3247)

(assert (=> bm!20475 (= call!20481 call!20482)))

(declare-fun c!36466 () Bool)

(declare-fun bm!20476 () Bool)

(declare-fun call!20480 () ListLongMap!3247)

(declare-fun c!36467 () Bool)

(declare-fun call!20483 () ListLongMap!3247)

(declare-fun +!597 (ListLongMap!3247 tuple2!4334) ListLongMap!3247)

(assert (=> bm!20476 (= call!20483 (+!597 (ite c!36466 call!20480 (ite c!36467 call!20482 call!20481)) (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))))))

(declare-fun b!219100 () Bool)

(declare-fun e!142544 () Bool)

(declare-fun e!142547 () Bool)

(assert (=> b!219100 (= e!142544 e!142547)))

(declare-fun res!107390 () Bool)

(assert (=> b!219100 (=> (not res!107390) (not e!142547))))

(declare-fun lt!111806 () ListLongMap!3247)

(assert (=> b!219100 (= res!107390 (contains!1480 lt!111806 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun b!219101 () Bool)

(declare-fun e!142545 () Unit!6529)

(declare-fun lt!111791 () Unit!6529)

(assert (=> b!219101 (= e!142545 lt!111791)))

(declare-fun lt!111798 () ListLongMap!3247)

(declare-fun getCurrentListMapNoExtraKeys!524 (array!10745 array!10743 (_ BitVec 32) (_ BitVec 32) V!7315 V!7315 (_ BitVec 32) Int) ListLongMap!3247)

(assert (=> b!219101 (= lt!111798 (getCurrentListMapNoExtraKeys!524 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))))

(declare-fun lt!111807 () (_ BitVec 64))

(assert (=> b!219101 (= lt!111807 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111800 () (_ BitVec 64))

(assert (=> b!219101 (= lt!111800 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111805 () Unit!6529)

(declare-fun addStillContains!178 (ListLongMap!3247 (_ BitVec 64) V!7315 (_ BitVec 64)) Unit!6529)

(assert (=> b!219101 (= lt!111805 (addStillContains!178 lt!111798 lt!111807 (zeroValue!3976 thiss!1504) lt!111800))))

(assert (=> b!219101 (contains!1480 (+!597 lt!111798 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504))) lt!111800)))

(declare-fun lt!111792 () Unit!6529)

(assert (=> b!219101 (= lt!111792 lt!111805)))

(declare-fun lt!111797 () ListLongMap!3247)

(assert (=> b!219101 (= lt!111797 (getCurrentListMapNoExtraKeys!524 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))))

(declare-fun lt!111808 () (_ BitVec 64))

(assert (=> b!219101 (= lt!111808 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111793 () (_ BitVec 64))

(assert (=> b!219101 (= lt!111793 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111796 () Unit!6529)

(declare-fun addApplyDifferent!178 (ListLongMap!3247 (_ BitVec 64) V!7315 (_ BitVec 64)) Unit!6529)

(assert (=> b!219101 (= lt!111796 (addApplyDifferent!178 lt!111797 lt!111808 (minValue!3976 thiss!1504) lt!111793))))

(declare-fun apply!202 (ListLongMap!3247 (_ BitVec 64)) V!7315)

(assert (=> b!219101 (= (apply!202 (+!597 lt!111797 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504))) lt!111793) (apply!202 lt!111797 lt!111793))))

(declare-fun lt!111795 () Unit!6529)

(assert (=> b!219101 (= lt!111795 lt!111796)))

(declare-fun lt!111809 () ListLongMap!3247)

(assert (=> b!219101 (= lt!111809 (getCurrentListMapNoExtraKeys!524 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))))

(declare-fun lt!111799 () (_ BitVec 64))

(assert (=> b!219101 (= lt!111799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111802 () (_ BitVec 64))

(assert (=> b!219101 (= lt!111802 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111803 () Unit!6529)

(assert (=> b!219101 (= lt!111803 (addApplyDifferent!178 lt!111809 lt!111799 (zeroValue!3976 thiss!1504) lt!111802))))

(assert (=> b!219101 (= (apply!202 (+!597 lt!111809 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504))) lt!111802) (apply!202 lt!111809 lt!111802))))

(declare-fun lt!111790 () Unit!6529)

(assert (=> b!219101 (= lt!111790 lt!111803)))

(declare-fun lt!111794 () ListLongMap!3247)

(assert (=> b!219101 (= lt!111794 (getCurrentListMapNoExtraKeys!524 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))))

(declare-fun lt!111810 () (_ BitVec 64))

(assert (=> b!219101 (= lt!111810 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111789 () (_ BitVec 64))

(assert (=> b!219101 (= lt!111789 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!219101 (= lt!111791 (addApplyDifferent!178 lt!111794 lt!111810 (minValue!3976 thiss!1504) lt!111789))))

(assert (=> b!219101 (= (apply!202 (+!597 lt!111794 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504))) lt!111789) (apply!202 lt!111794 lt!111789))))

(declare-fun bm!20477 () Bool)

(declare-fun call!20479 () ListLongMap!3247)

(assert (=> bm!20477 (= call!20479 call!20483)))

(declare-fun b!219102 () Bool)

(declare-fun e!142546 () Bool)

(declare-fun e!142548 () Bool)

(assert (=> b!219102 (= e!142546 e!142548)))

(declare-fun res!107397 () Bool)

(declare-fun call!20484 () Bool)

(assert (=> b!219102 (= res!107397 call!20484)))

(assert (=> b!219102 (=> (not res!107397) (not e!142548))))

(declare-fun bm!20478 () Bool)

(assert (=> bm!20478 (= call!20480 (getCurrentListMapNoExtraKeys!524 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))))

(declare-fun b!219104 () Bool)

(declare-fun e!142541 () ListLongMap!3247)

(assert (=> b!219104 (= e!142541 call!20479)))

(declare-fun b!219105 () Bool)

(declare-fun res!107394 () Bool)

(declare-fun e!142542 () Bool)

(assert (=> b!219105 (=> (not res!107394) (not e!142542))))

(assert (=> b!219105 (= res!107394 e!142546)))

(declare-fun c!36465 () Bool)

(assert (=> b!219105 (= c!36465 (not (= (bvand (extraKeys!3872 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20479 () Bool)

(assert (=> bm!20479 (= call!20482 call!20480)))

(declare-fun b!219106 () Bool)

(assert (=> b!219106 (= e!142546 (not call!20484))))

(declare-fun b!219107 () Bool)

(declare-fun e!142550 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!219107 (= e!142550 (validKeyInArray!0 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219108 () Bool)

(declare-fun Unit!6536 () Unit!6529)

(assert (=> b!219108 (= e!142545 Unit!6536)))

(declare-fun b!219109 () Bool)

(declare-fun e!142552 () ListLongMap!3247)

(assert (=> b!219109 (= e!142552 call!20479)))

(declare-fun b!219110 () Bool)

(declare-fun c!36462 () Bool)

(assert (=> b!219110 (= c!36462 (and (not (= (bvand (extraKeys!3872 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3872 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!219110 (= e!142541 e!142552)))

(declare-fun b!219111 () Bool)

(declare-fun res!107392 () Bool)

(assert (=> b!219111 (=> (not res!107392) (not e!142542))))

(assert (=> b!219111 (= res!107392 e!142544)))

(declare-fun res!107396 () Bool)

(assert (=> b!219111 (=> res!107396 e!142544)))

(assert (=> b!219111 (= res!107396 (not e!142550))))

(declare-fun res!107391 () Bool)

(assert (=> b!219111 (=> (not res!107391) (not e!142550))))

(assert (=> b!219111 (= res!107391 (bvslt #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun bm!20480 () Bool)

(assert (=> bm!20480 (= call!20484 (contains!1480 lt!111806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219112 () Bool)

(declare-fun get!2674 (ValueCell!2532 V!7315) V!7315)

(declare-fun dynLambda!545 (Int (_ BitVec 64)) V!7315)

(assert (=> b!219112 (= e!142547 (= (apply!202 lt!111806 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)) (get!2674 (select (arr!5092 (_values!4118 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4135 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!219112 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5424 (_values!4118 thiss!1504))))))

(assert (=> b!219112 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun b!219113 () Bool)

(assert (=> b!219113 (= e!142552 call!20481)))

(declare-fun b!219114 () Bool)

(declare-fun e!142549 () ListLongMap!3247)

(assert (=> b!219114 (= e!142549 e!142541)))

(assert (=> b!219114 (= c!36467 (and (not (= (bvand (extraKeys!3872 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3872 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!219115 () Bool)

(declare-fun e!142540 () Bool)

(declare-fun e!142543 () Bool)

(assert (=> b!219115 (= e!142540 e!142543)))

(declare-fun res!107393 () Bool)

(declare-fun call!20478 () Bool)

(assert (=> b!219115 (= res!107393 call!20478)))

(assert (=> b!219115 (=> (not res!107393) (not e!142543))))

(declare-fun b!219116 () Bool)

(assert (=> b!219116 (= e!142548 (= (apply!202 lt!111806 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3976 thiss!1504)))))

(declare-fun b!219117 () Bool)

(assert (=> b!219117 (= e!142549 (+!597 call!20483 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))))))

(declare-fun b!219118 () Bool)

(declare-fun e!142551 () Bool)

(assert (=> b!219118 (= e!142551 (validKeyInArray!0 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20481 () Bool)

(assert (=> bm!20481 (= call!20478 (contains!1480 lt!111806 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219119 () Bool)

(assert (=> b!219119 (= e!142543 (= (apply!202 lt!111806 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3976 thiss!1504)))))

(declare-fun b!219120 () Bool)

(assert (=> b!219120 (= e!142540 (not call!20478))))

(declare-fun b!219103 () Bool)

(assert (=> b!219103 (= e!142542 e!142540)))

(declare-fun c!36464 () Bool)

(assert (=> b!219103 (= c!36464 (not (= (bvand (extraKeys!3872 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!58627 () Bool)

(assert (=> d!58627 e!142542))

(declare-fun res!107395 () Bool)

(assert (=> d!58627 (=> (not res!107395) (not e!142542))))

(assert (=> d!58627 (= res!107395 (or (bvsge #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))))

(declare-fun lt!111801 () ListLongMap!3247)

(assert (=> d!58627 (= lt!111806 lt!111801)))

(declare-fun lt!111804 () Unit!6529)

(assert (=> d!58627 (= lt!111804 e!142545)))

(declare-fun c!36463 () Bool)

(assert (=> d!58627 (= c!36463 e!142551)))

(declare-fun res!107389 () Bool)

(assert (=> d!58627 (=> (not res!107389) (not e!142551))))

(assert (=> d!58627 (= res!107389 (bvslt #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(assert (=> d!58627 (= lt!111801 e!142549)))

(assert (=> d!58627 (= c!36466 (and (not (= (bvand (extraKeys!3872 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3872 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!58627 (validMask!0 (mask!9918 thiss!1504))))

(assert (=> d!58627 (= (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)) lt!111806)))

(assert (= (and d!58627 c!36466) b!219117))

(assert (= (and d!58627 (not c!36466)) b!219114))

(assert (= (and b!219114 c!36467) b!219104))

(assert (= (and b!219114 (not c!36467)) b!219110))

(assert (= (and b!219110 c!36462) b!219109))

(assert (= (and b!219110 (not c!36462)) b!219113))

(assert (= (or b!219109 b!219113) bm!20475))

(assert (= (or b!219104 bm!20475) bm!20479))

(assert (= (or b!219104 b!219109) bm!20477))

(assert (= (or b!219117 bm!20479) bm!20478))

(assert (= (or b!219117 bm!20477) bm!20476))

(assert (= (and d!58627 res!107389) b!219118))

(assert (= (and d!58627 c!36463) b!219101))

(assert (= (and d!58627 (not c!36463)) b!219108))

(assert (= (and d!58627 res!107395) b!219111))

(assert (= (and b!219111 res!107391) b!219107))

(assert (= (and b!219111 (not res!107396)) b!219100))

(assert (= (and b!219100 res!107390) b!219112))

(assert (= (and b!219111 res!107392) b!219105))

(assert (= (and b!219105 c!36465) b!219102))

(assert (= (and b!219105 (not c!36465)) b!219106))

(assert (= (and b!219102 res!107397) b!219116))

(assert (= (or b!219102 b!219106) bm!20480))

(assert (= (and b!219105 res!107394) b!219103))

(assert (= (and b!219103 c!36464) b!219115))

(assert (= (and b!219103 (not c!36464)) b!219120))

(assert (= (and b!219115 res!107393) b!219119))

(assert (= (or b!219115 b!219120) bm!20481))

(declare-fun b_lambda!7831 () Bool)

(assert (=> (not b_lambda!7831) (not b!219112)))

(declare-fun t!8197 () Bool)

(declare-fun tb!2917 () Bool)

(assert (=> (and b!218991 (= (defaultEntry!4135 thiss!1504) (defaultEntry!4135 thiss!1504)) t!8197) tb!2917))

(declare-fun result!5073 () Bool)

(assert (=> tb!2917 (= result!5073 tp_is_empty!5751)))

(assert (=> b!219112 t!8197))

(declare-fun b_and!12785 () Bool)

(assert (= b_and!12781 (and (=> t!8197 result!5073) b_and!12785)))

(declare-fun m!244731 () Bool)

(assert (=> b!219112 m!244731))

(declare-fun m!244733 () Bool)

(assert (=> b!219112 m!244733))

(declare-fun m!244735 () Bool)

(assert (=> b!219112 m!244735))

(assert (=> b!219112 m!244733))

(declare-fun m!244737 () Bool)

(assert (=> b!219112 m!244737))

(assert (=> b!219112 m!244731))

(declare-fun m!244739 () Bool)

(assert (=> b!219112 m!244739))

(assert (=> b!219112 m!244737))

(declare-fun m!244741 () Bool)

(assert (=> bm!20476 m!244741))

(declare-fun m!244743 () Bool)

(assert (=> d!58627 m!244743))

(assert (=> b!219118 m!244733))

(assert (=> b!219118 m!244733))

(declare-fun m!244745 () Bool)

(assert (=> b!219118 m!244745))

(declare-fun m!244747 () Bool)

(assert (=> bm!20478 m!244747))

(assert (=> b!219100 m!244733))

(assert (=> b!219100 m!244733))

(declare-fun m!244749 () Bool)

(assert (=> b!219100 m!244749))

(assert (=> b!219107 m!244733))

(assert (=> b!219107 m!244733))

(assert (=> b!219107 m!244745))

(declare-fun m!244751 () Bool)

(assert (=> bm!20481 m!244751))

(declare-fun m!244753 () Bool)

(assert (=> bm!20480 m!244753))

(declare-fun m!244755 () Bool)

(assert (=> b!219116 m!244755))

(declare-fun m!244757 () Bool)

(assert (=> b!219101 m!244757))

(declare-fun m!244759 () Bool)

(assert (=> b!219101 m!244759))

(declare-fun m!244761 () Bool)

(assert (=> b!219101 m!244761))

(declare-fun m!244763 () Bool)

(assert (=> b!219101 m!244763))

(declare-fun m!244765 () Bool)

(assert (=> b!219101 m!244765))

(declare-fun m!244767 () Bool)

(assert (=> b!219101 m!244767))

(declare-fun m!244769 () Bool)

(assert (=> b!219101 m!244769))

(assert (=> b!219101 m!244759))

(declare-fun m!244771 () Bool)

(assert (=> b!219101 m!244771))

(declare-fun m!244773 () Bool)

(assert (=> b!219101 m!244773))

(declare-fun m!244775 () Bool)

(assert (=> b!219101 m!244775))

(assert (=> b!219101 m!244733))

(declare-fun m!244777 () Bool)

(assert (=> b!219101 m!244777))

(declare-fun m!244779 () Bool)

(assert (=> b!219101 m!244779))

(assert (=> b!219101 m!244747))

(declare-fun m!244781 () Bool)

(assert (=> b!219101 m!244781))

(declare-fun m!244783 () Bool)

(assert (=> b!219101 m!244783))

(assert (=> b!219101 m!244767))

(assert (=> b!219101 m!244763))

(assert (=> b!219101 m!244773))

(declare-fun m!244785 () Bool)

(assert (=> b!219101 m!244785))

(declare-fun m!244787 () Bool)

(assert (=> b!219117 m!244787))

(declare-fun m!244789 () Bool)

(assert (=> b!219119 m!244789))

(assert (=> b!218990 d!58627))

(declare-fun d!58629 () Bool)

(declare-fun res!107404 () Bool)

(declare-fun e!142555 () Bool)

(assert (=> d!58629 (=> (not res!107404) (not e!142555))))

(declare-fun simpleValid!225 (LongMapFixedSize!2964) Bool)

(assert (=> d!58629 (= res!107404 (simpleValid!225 thiss!1504))))

(assert (=> d!58629 (= (valid!1199 thiss!1504) e!142555)))

(declare-fun b!219129 () Bool)

(declare-fun res!107405 () Bool)

(assert (=> b!219129 (=> (not res!107405) (not e!142555))))

(declare-fun arrayCountValidKeys!0 (array!10745 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!219129 (= res!107405 (= (arrayCountValidKeys!0 (_keys!6185 thiss!1504) #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))) (_size!1531 thiss!1504)))))

(declare-fun b!219130 () Bool)

(declare-fun res!107406 () Bool)

(assert (=> b!219130 (=> (not res!107406) (not e!142555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10745 (_ BitVec 32)) Bool)

(assert (=> b!219130 (= res!107406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(declare-fun b!219131 () Bool)

(declare-datatypes ((List!3239 0))(
  ( (Nil!3236) (Cons!3235 (h!3882 (_ BitVec 64)) (t!8198 List!3239)) )
))
(declare-fun arrayNoDuplicates!0 (array!10745 (_ BitVec 32) List!3239) Bool)

(assert (=> b!219131 (= e!142555 (arrayNoDuplicates!0 (_keys!6185 thiss!1504) #b00000000000000000000000000000000 Nil!3236))))

(assert (= (and d!58629 res!107404) b!219129))

(assert (= (and b!219129 res!107405) b!219130))

(assert (= (and b!219130 res!107406) b!219131))

(declare-fun m!244791 () Bool)

(assert (=> d!58629 m!244791))

(declare-fun m!244793 () Bool)

(assert (=> b!219129 m!244793))

(declare-fun m!244795 () Bool)

(assert (=> b!219130 m!244795))

(declare-fun m!244797 () Bool)

(assert (=> b!219131 m!244797))

(assert (=> start!21760 d!58629))

(declare-fun d!58631 () Bool)

(declare-fun e!142558 () Bool)

(assert (=> d!58631 e!142558))

(declare-fun res!107411 () Bool)

(assert (=> d!58631 (=> (not res!107411) (not e!142558))))

(declare-fun lt!111815 () SeekEntryResult!795)

(assert (=> d!58631 (= res!107411 ((_ is Found!795) lt!111815))))

(assert (=> d!58631 (= lt!111815 (seekEntryOrOpen!0 key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(declare-fun lt!111816 () Unit!6529)

(declare-fun choose!1087 (array!10745 array!10743 (_ BitVec 32) (_ BitVec 32) V!7315 V!7315 (_ BitVec 64) Int) Unit!6529)

(assert (=> d!58631 (= lt!111816 (choose!1087 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) key!932 (defaultEntry!4135 thiss!1504)))))

(assert (=> d!58631 (validMask!0 (mask!9918 thiss!1504))))

(assert (=> d!58631 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!192 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) key!932 (defaultEntry!4135 thiss!1504)) lt!111816)))

(declare-fun b!219136 () Bool)

(declare-fun res!107412 () Bool)

(assert (=> b!219136 (=> (not res!107412) (not e!142558))))

(assert (=> b!219136 (= res!107412 (inRange!0 (index!5351 lt!111815) (mask!9918 thiss!1504)))))

(declare-fun b!219137 () Bool)

(assert (=> b!219137 (= e!142558 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5351 lt!111815)) key!932))))

(assert (=> b!219137 (and (bvsge (index!5351 lt!111815) #b00000000000000000000000000000000) (bvslt (index!5351 lt!111815) (size!5425 (_keys!6185 thiss!1504))))))

(assert (= (and d!58631 res!107411) b!219136))

(assert (= (and b!219136 res!107412) b!219137))

(assert (=> d!58631 m!244671))

(declare-fun m!244799 () Bool)

(assert (=> d!58631 m!244799))

(assert (=> d!58631 m!244743))

(declare-fun m!244801 () Bool)

(assert (=> b!219136 m!244801))

(declare-fun m!244803 () Bool)

(assert (=> b!219137 m!244803))

(assert (=> b!218984 d!58631))

(declare-fun d!58633 () Bool)

(declare-fun res!107417 () Bool)

(declare-fun e!142563 () Bool)

(assert (=> d!58633 (=> res!107417 e!142563)))

(assert (=> d!58633 (= res!107417 (= (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!58633 (= (arrayContainsKey!0 (_keys!6185 thiss!1504) key!932 #b00000000000000000000000000000000) e!142563)))

(declare-fun b!219142 () Bool)

(declare-fun e!142564 () Bool)

(assert (=> b!219142 (= e!142563 e!142564)))

(declare-fun res!107418 () Bool)

(assert (=> b!219142 (=> (not res!107418) (not e!142564))))

(assert (=> b!219142 (= res!107418 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun b!219143 () Bool)

(assert (=> b!219143 (= e!142564 (arrayContainsKey!0 (_keys!6185 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!58633 (not res!107417)) b!219142))

(assert (= (and b!219142 res!107418) b!219143))

(assert (=> d!58633 m!244733))

(declare-fun m!244805 () Bool)

(assert (=> b!219143 m!244805))

(assert (=> bm!20454 d!58633))

(declare-fun b!219160 () Bool)

(declare-fun e!142574 () Bool)

(declare-fun lt!111822 () SeekEntryResult!795)

(assert (=> b!219160 (= e!142574 ((_ is Undefined!795) lt!111822))))

(declare-fun d!58635 () Bool)

(declare-fun e!142575 () Bool)

(assert (=> d!58635 e!142575))

(declare-fun c!36473 () Bool)

(assert (=> d!58635 (= c!36473 ((_ is MissingZero!795) lt!111822))))

(assert (=> d!58635 (= lt!111822 (seekEntryOrOpen!0 key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(declare-fun lt!111821 () Unit!6529)

(declare-fun choose!1088 (array!10745 array!10743 (_ BitVec 32) (_ BitVec 32) V!7315 V!7315 (_ BitVec 64) Int) Unit!6529)

(assert (=> d!58635 (= lt!111821 (choose!1088 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) key!932 (defaultEntry!4135 thiss!1504)))))

(assert (=> d!58635 (validMask!0 (mask!9918 thiss!1504))))

(assert (=> d!58635 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!203 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) key!932 (defaultEntry!4135 thiss!1504)) lt!111821)))

(declare-fun b!219161 () Bool)

(declare-fun res!107427 () Bool)

(declare-fun e!142573 () Bool)

(assert (=> b!219161 (=> (not res!107427) (not e!142573))))

(declare-fun call!20489 () Bool)

(assert (=> b!219161 (= res!107427 call!20489)))

(assert (=> b!219161 (= e!142574 e!142573)))

(declare-fun b!219162 () Bool)

(assert (=> b!219162 (and (bvsge (index!5350 lt!111822) #b00000000000000000000000000000000) (bvslt (index!5350 lt!111822) (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun res!107430 () Bool)

(assert (=> b!219162 (= res!107430 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5350 lt!111822)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142576 () Bool)

(assert (=> b!219162 (=> (not res!107430) (not e!142576))))

(declare-fun b!219163 () Bool)

(declare-fun call!20490 () Bool)

(assert (=> b!219163 (= e!142573 (not call!20490))))

(declare-fun b!219164 () Bool)

(declare-fun res!107429 () Bool)

(assert (=> b!219164 (=> (not res!107429) (not e!142573))))

(assert (=> b!219164 (= res!107429 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5353 lt!111822)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219164 (and (bvsge (index!5353 lt!111822) #b00000000000000000000000000000000) (bvslt (index!5353 lt!111822) (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun bm!20486 () Bool)

(assert (=> bm!20486 (= call!20490 (arrayContainsKey!0 (_keys!6185 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219165 () Bool)

(assert (=> b!219165 (= e!142575 e!142576)))

(declare-fun res!107428 () Bool)

(assert (=> b!219165 (= res!107428 call!20489)))

(assert (=> b!219165 (=> (not res!107428) (not e!142576))))

(declare-fun b!219166 () Bool)

(assert (=> b!219166 (= e!142576 (not call!20490))))

(declare-fun b!219167 () Bool)

(assert (=> b!219167 (= e!142575 e!142574)))

(declare-fun c!36472 () Bool)

(assert (=> b!219167 (= c!36472 ((_ is MissingVacant!795) lt!111822))))

(declare-fun bm!20487 () Bool)

(assert (=> bm!20487 (= call!20489 (inRange!0 (ite c!36473 (index!5350 lt!111822) (index!5353 lt!111822)) (mask!9918 thiss!1504)))))

(assert (= (and d!58635 c!36473) b!219165))

(assert (= (and d!58635 (not c!36473)) b!219167))

(assert (= (and b!219165 res!107428) b!219162))

(assert (= (and b!219162 res!107430) b!219166))

(assert (= (and b!219167 c!36472) b!219161))

(assert (= (and b!219167 (not c!36472)) b!219160))

(assert (= (and b!219161 res!107427) b!219164))

(assert (= (and b!219164 res!107429) b!219163))

(assert (= (or b!219165 b!219161) bm!20487))

(assert (= (or b!219166 b!219163) bm!20486))

(assert (=> d!58635 m!244671))

(declare-fun m!244807 () Bool)

(assert (=> d!58635 m!244807))

(assert (=> d!58635 m!244743))

(declare-fun m!244809 () Bool)

(assert (=> b!219164 m!244809))

(declare-fun m!244811 () Bool)

(assert (=> b!219162 m!244811))

(declare-fun m!244813 () Bool)

(assert (=> bm!20487 m!244813))

(assert (=> bm!20486 m!244683))

(assert (=> b!218979 d!58635))

(declare-fun d!58637 () Bool)

(assert (=> d!58637 (= (array_inv!3371 (_keys!6185 thiss!1504)) (bvsge (size!5425 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218991 d!58637))

(declare-fun d!58639 () Bool)

(assert (=> d!58639 (= (array_inv!3372 (_values!4118 thiss!1504)) (bvsge (size!5424 (_values!4118 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218991 d!58639))

(declare-fun b!219180 () Bool)

(declare-fun e!142585 () SeekEntryResult!795)

(declare-fun e!142583 () SeekEntryResult!795)

(assert (=> b!219180 (= e!142585 e!142583)))

(declare-fun lt!111830 () (_ BitVec 64))

(declare-fun lt!111829 () SeekEntryResult!795)

(assert (=> b!219180 (= lt!111830 (select (arr!5093 (_keys!6185 thiss!1504)) (index!5352 lt!111829)))))

(declare-fun c!36480 () Bool)

(assert (=> b!219180 (= c!36480 (= lt!111830 key!932))))

(declare-fun b!219181 () Bool)

(declare-fun e!142584 () SeekEntryResult!795)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10745 (_ BitVec 32)) SeekEntryResult!795)

(assert (=> b!219181 (= e!142584 (seekKeyOrZeroReturnVacant!0 (x!22877 lt!111829) (index!5352 lt!111829) (index!5352 lt!111829) key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(declare-fun b!219182 () Bool)

(declare-fun c!36481 () Bool)

(assert (=> b!219182 (= c!36481 (= lt!111830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219182 (= e!142583 e!142584)))

(declare-fun b!219183 () Bool)

(assert (=> b!219183 (= e!142585 Undefined!795)))

(declare-fun b!219184 () Bool)

(assert (=> b!219184 (= e!142584 (MissingZero!795 (index!5352 lt!111829)))))

(declare-fun d!58641 () Bool)

(declare-fun lt!111831 () SeekEntryResult!795)

(assert (=> d!58641 (and (or ((_ is Undefined!795) lt!111831) (not ((_ is Found!795) lt!111831)) (and (bvsge (index!5351 lt!111831) #b00000000000000000000000000000000) (bvslt (index!5351 lt!111831) (size!5425 (_keys!6185 thiss!1504))))) (or ((_ is Undefined!795) lt!111831) ((_ is Found!795) lt!111831) (not ((_ is MissingZero!795) lt!111831)) (and (bvsge (index!5350 lt!111831) #b00000000000000000000000000000000) (bvslt (index!5350 lt!111831) (size!5425 (_keys!6185 thiss!1504))))) (or ((_ is Undefined!795) lt!111831) ((_ is Found!795) lt!111831) ((_ is MissingZero!795) lt!111831) (not ((_ is MissingVacant!795) lt!111831)) (and (bvsge (index!5353 lt!111831) #b00000000000000000000000000000000) (bvslt (index!5353 lt!111831) (size!5425 (_keys!6185 thiss!1504))))) (or ((_ is Undefined!795) lt!111831) (ite ((_ is Found!795) lt!111831) (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5351 lt!111831)) key!932) (ite ((_ is MissingZero!795) lt!111831) (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5350 lt!111831)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!795) lt!111831) (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5353 lt!111831)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58641 (= lt!111831 e!142585)))

(declare-fun c!36482 () Bool)

(assert (=> d!58641 (= c!36482 (and ((_ is Intermediate!795) lt!111829) (undefined!1607 lt!111829)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10745 (_ BitVec 32)) SeekEntryResult!795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58641 (= lt!111829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9918 thiss!1504)) key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(assert (=> d!58641 (validMask!0 (mask!9918 thiss!1504))))

(assert (=> d!58641 (= (seekEntryOrOpen!0 key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)) lt!111831)))

(declare-fun b!219185 () Bool)

(assert (=> b!219185 (= e!142583 (Found!795 (index!5352 lt!111829)))))

(assert (= (and d!58641 c!36482) b!219183))

(assert (= (and d!58641 (not c!36482)) b!219180))

(assert (= (and b!219180 c!36480) b!219185))

(assert (= (and b!219180 (not c!36480)) b!219182))

(assert (= (and b!219182 c!36481) b!219184))

(assert (= (and b!219182 (not c!36481)) b!219181))

(declare-fun m!244815 () Bool)

(assert (=> b!219180 m!244815))

(declare-fun m!244817 () Bool)

(assert (=> b!219181 m!244817))

(declare-fun m!244819 () Bool)

(assert (=> d!58641 m!244819))

(declare-fun m!244821 () Bool)

(assert (=> d!58641 m!244821))

(assert (=> d!58641 m!244819))

(declare-fun m!244823 () Bool)

(assert (=> d!58641 m!244823))

(declare-fun m!244825 () Bool)

(assert (=> d!58641 m!244825))

(assert (=> d!58641 m!244743))

(declare-fun m!244827 () Bool)

(assert (=> d!58641 m!244827))

(assert (=> b!218978 d!58641))

(declare-fun d!58643 () Bool)

(assert (=> d!58643 (= (inRange!0 (ite c!36435 (index!5350 lt!111719) (index!5353 lt!111719)) (mask!9918 thiss!1504)) (and (bvsge (ite c!36435 (index!5350 lt!111719) (index!5353 lt!111719)) #b00000000000000000000000000000000) (bvslt (ite c!36435 (index!5350 lt!111719) (index!5353 lt!111719)) (bvadd (mask!9918 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!20453 d!58643))

(declare-fun mapNonEmpty!9798 () Bool)

(declare-fun mapRes!9798 () Bool)

(declare-fun tp!20814 () Bool)

(declare-fun e!142590 () Bool)

(assert (=> mapNonEmpty!9798 (= mapRes!9798 (and tp!20814 e!142590))))

(declare-fun mapRest!9798 () (Array (_ BitVec 32) ValueCell!2532))

(declare-fun mapKey!9798 () (_ BitVec 32))

(declare-fun mapValue!9798 () ValueCell!2532)

(assert (=> mapNonEmpty!9798 (= mapRest!9792 (store mapRest!9798 mapKey!9798 mapValue!9798))))

(declare-fun b!219193 () Bool)

(declare-fun e!142591 () Bool)

(assert (=> b!219193 (= e!142591 tp_is_empty!5751)))

(declare-fun mapIsEmpty!9798 () Bool)

(assert (=> mapIsEmpty!9798 mapRes!9798))

(declare-fun condMapEmpty!9798 () Bool)

(declare-fun mapDefault!9798 () ValueCell!2532)

(assert (=> mapNonEmpty!9792 (= condMapEmpty!9798 (= mapRest!9792 ((as const (Array (_ BitVec 32) ValueCell!2532)) mapDefault!9798)))))

(assert (=> mapNonEmpty!9792 (= tp!20804 (and e!142591 mapRes!9798))))

(declare-fun b!219192 () Bool)

(assert (=> b!219192 (= e!142590 tp_is_empty!5751)))

(assert (= (and mapNonEmpty!9792 condMapEmpty!9798) mapIsEmpty!9798))

(assert (= (and mapNonEmpty!9792 (not condMapEmpty!9798)) mapNonEmpty!9798))

(assert (= (and mapNonEmpty!9798 ((_ is ValueCellFull!2532) mapValue!9798)) b!219192))

(assert (= (and mapNonEmpty!9792 ((_ is ValueCellFull!2532) mapDefault!9798)) b!219193))

(declare-fun m!244829 () Bool)

(assert (=> mapNonEmpty!9798 m!244829))

(declare-fun b_lambda!7833 () Bool)

(assert (= b_lambda!7831 (or (and b!218991 b_free!5889) b_lambda!7833)))

(check-sat (not b!219055) (not b!219112) (not b!219117) b_and!12785 (not b!219119) (not b!219131) (not b!219129) (not b!219143) (not d!58635) (not b!219130) (not b!219101) (not bm!20487) (not b_next!5889) (not bm!20486) (not d!58631) (not b!219116) (not b!219181) (not d!58641) (not d!58627) (not b!219057) (not b!219100) (not b!219136) (not d!58629) (not mapNonEmpty!9798) (not b!219118) (not b!219107) (not b_lambda!7833) (not d!58625) (not bm!20476) (not bm!20480) (not bm!20478) tp_is_empty!5751 (not bm!20481))
(check-sat b_and!12785 (not b_next!5889))
(get-model)

(declare-fun d!58645 () Bool)

(assert (=> d!58645 (= (validKeyInArray!0 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!219107 d!58645))

(declare-fun d!58647 () Bool)

(declare-fun res!107435 () Bool)

(declare-fun e!142596 () Bool)

(assert (=> d!58647 (=> res!107435 e!142596)))

(assert (=> d!58647 (= res!107435 (and ((_ is Cons!3233) (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))) (= (_1!2178 (h!3880 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))))) key!932)))))

(assert (=> d!58647 (= (containsKey!252 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932) e!142596)))

(declare-fun b!219198 () Bool)

(declare-fun e!142597 () Bool)

(assert (=> b!219198 (= e!142596 e!142597)))

(declare-fun res!107436 () Bool)

(assert (=> b!219198 (=> (not res!107436) (not e!142597))))

(assert (=> b!219198 (= res!107436 (and (or (not ((_ is Cons!3233) (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))))) (bvsle (_1!2178 (h!3880 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))))) key!932)) ((_ is Cons!3233) (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))) (bvslt (_1!2178 (h!3880 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))))) key!932)))))

(declare-fun b!219199 () Bool)

(assert (=> b!219199 (= e!142597 (containsKey!252 (t!8194 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))) key!932))))

(assert (= (and d!58647 (not res!107435)) b!219198))

(assert (= (and b!219198 res!107436) b!219199))

(declare-fun m!244831 () Bool)

(assert (=> b!219199 m!244831))

(assert (=> d!58625 d!58647))

(assert (=> d!58635 d!58641))

(declare-fun d!58649 () Bool)

(declare-fun e!142606 () Bool)

(assert (=> d!58649 e!142606))

(declare-fun c!36488 () Bool)

(declare-fun lt!111834 () SeekEntryResult!795)

(assert (=> d!58649 (= c!36488 ((_ is MissingZero!795) lt!111834))))

(assert (=> d!58649 (= lt!111834 (seekEntryOrOpen!0 key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(assert (=> d!58649 true))

(declare-fun _$34!1098 () Unit!6529)

(assert (=> d!58649 (= (choose!1088 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) key!932 (defaultEntry!4135 thiss!1504)) _$34!1098)))

(declare-fun b!219216 () Bool)

(declare-fun e!142609 () Bool)

(declare-fun call!20496 () Bool)

(assert (=> b!219216 (= e!142609 (not call!20496))))

(declare-fun bm!20492 () Bool)

(declare-fun call!20495 () Bool)

(assert (=> bm!20492 (= call!20495 (inRange!0 (ite c!36488 (index!5350 lt!111834) (index!5353 lt!111834)) (mask!9918 thiss!1504)))))

(declare-fun b!219217 () Bool)

(declare-fun e!142607 () Bool)

(assert (=> b!219217 (= e!142607 (not call!20496))))

(declare-fun b!219218 () Bool)

(assert (=> b!219218 (= e!142606 e!142607)))

(declare-fun res!107445 () Bool)

(assert (=> b!219218 (= res!107445 call!20495)))

(assert (=> b!219218 (=> (not res!107445) (not e!142607))))

(declare-fun b!219219 () Bool)

(declare-fun res!107446 () Bool)

(assert (=> b!219219 (=> (not res!107446) (not e!142609))))

(assert (=> b!219219 (= res!107446 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5353 lt!111834)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219220 () Bool)

(declare-fun res!107447 () Bool)

(assert (=> b!219220 (=> (not res!107447) (not e!142609))))

(assert (=> b!219220 (= res!107447 call!20495)))

(declare-fun e!142608 () Bool)

(assert (=> b!219220 (= e!142608 e!142609)))

(declare-fun bm!20493 () Bool)

(assert (=> bm!20493 (= call!20496 (arrayContainsKey!0 (_keys!6185 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219221 () Bool)

(assert (=> b!219221 (= e!142608 ((_ is Undefined!795) lt!111834))))

(declare-fun b!219222 () Bool)

(assert (=> b!219222 (= e!142606 e!142608)))

(declare-fun c!36487 () Bool)

(assert (=> b!219222 (= c!36487 ((_ is MissingVacant!795) lt!111834))))

(declare-fun b!219223 () Bool)

(declare-fun res!107448 () Bool)

(assert (=> b!219223 (= res!107448 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5350 lt!111834)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219223 (=> (not res!107448) (not e!142607))))

(assert (= (and d!58649 c!36488) b!219218))

(assert (= (and d!58649 (not c!36488)) b!219222))

(assert (= (and b!219218 res!107445) b!219223))

(assert (= (and b!219223 res!107448) b!219217))

(assert (= (and b!219222 c!36487) b!219220))

(assert (= (and b!219222 (not c!36487)) b!219221))

(assert (= (and b!219220 res!107447) b!219219))

(assert (= (and b!219219 res!107446) b!219216))

(assert (= (or b!219218 b!219220) bm!20492))

(assert (= (or b!219217 b!219216) bm!20493))

(assert (=> d!58649 m!244671))

(declare-fun m!244833 () Bool)

(assert (=> b!219223 m!244833))

(declare-fun m!244835 () Bool)

(assert (=> b!219219 m!244835))

(assert (=> bm!20493 m!244683))

(declare-fun m!244837 () Bool)

(assert (=> bm!20492 m!244837))

(assert (=> d!58635 d!58649))

(declare-fun d!58651 () Bool)

(assert (=> d!58651 (= (validMask!0 (mask!9918 thiss!1504)) (and (or (= (mask!9918 thiss!1504) #b00000000000000000000000000000111) (= (mask!9918 thiss!1504) #b00000000000000000000000000001111) (= (mask!9918 thiss!1504) #b00000000000000000000000000011111) (= (mask!9918 thiss!1504) #b00000000000000000000000000111111) (= (mask!9918 thiss!1504) #b00000000000000000000000001111111) (= (mask!9918 thiss!1504) #b00000000000000000000000011111111) (= (mask!9918 thiss!1504) #b00000000000000000000000111111111) (= (mask!9918 thiss!1504) #b00000000000000000000001111111111) (= (mask!9918 thiss!1504) #b00000000000000000000011111111111) (= (mask!9918 thiss!1504) #b00000000000000000000111111111111) (= (mask!9918 thiss!1504) #b00000000000000000001111111111111) (= (mask!9918 thiss!1504) #b00000000000000000011111111111111) (= (mask!9918 thiss!1504) #b00000000000000000111111111111111) (= (mask!9918 thiss!1504) #b00000000000000001111111111111111) (= (mask!9918 thiss!1504) #b00000000000000011111111111111111) (= (mask!9918 thiss!1504) #b00000000000000111111111111111111) (= (mask!9918 thiss!1504) #b00000000000001111111111111111111) (= (mask!9918 thiss!1504) #b00000000000011111111111111111111) (= (mask!9918 thiss!1504) #b00000000000111111111111111111111) (= (mask!9918 thiss!1504) #b00000000001111111111111111111111) (= (mask!9918 thiss!1504) #b00000000011111111111111111111111) (= (mask!9918 thiss!1504) #b00000000111111111111111111111111) (= (mask!9918 thiss!1504) #b00000001111111111111111111111111) (= (mask!9918 thiss!1504) #b00000011111111111111111111111111) (= (mask!9918 thiss!1504) #b00000111111111111111111111111111) (= (mask!9918 thiss!1504) #b00001111111111111111111111111111) (= (mask!9918 thiss!1504) #b00011111111111111111111111111111) (= (mask!9918 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9918 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> d!58635 d!58651))

(declare-fun d!58653 () Bool)

(assert (=> d!58653 (= (inRange!0 (ite c!36473 (index!5350 lt!111822) (index!5353 lt!111822)) (mask!9918 thiss!1504)) (and (bvsge (ite c!36473 (index!5350 lt!111822) (index!5353 lt!111822)) #b00000000000000000000000000000000) (bvslt (ite c!36473 (index!5350 lt!111822) (index!5353 lt!111822)) (bvadd (mask!9918 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!20487 d!58653))

(declare-fun d!58655 () Bool)

(declare-fun res!107449 () Bool)

(declare-fun e!142610 () Bool)

(assert (=> d!58655 (=> res!107449 e!142610)))

(assert (=> d!58655 (= res!107449 (= (select (arr!5093 (_keys!6185 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!58655 (= (arrayContainsKey!0 (_keys!6185 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!142610)))

(declare-fun b!219224 () Bool)

(declare-fun e!142611 () Bool)

(assert (=> b!219224 (= e!142610 e!142611)))

(declare-fun res!107450 () Bool)

(assert (=> b!219224 (=> (not res!107450) (not e!142611))))

(assert (=> b!219224 (= res!107450 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun b!219225 () Bool)

(assert (=> b!219225 (= e!142611 (arrayContainsKey!0 (_keys!6185 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!58655 (not res!107449)) b!219224))

(assert (= (and b!219224 res!107450) b!219225))

(declare-fun m!244839 () Bool)

(assert (=> d!58655 m!244839))

(declare-fun m!244841 () Bool)

(assert (=> b!219225 m!244841))

(assert (=> b!219143 d!58655))

(assert (=> d!58631 d!58641))

(declare-fun d!58657 () Bool)

(declare-fun e!142614 () Bool)

(assert (=> d!58657 e!142614))

(declare-fun res!107455 () Bool)

(assert (=> d!58657 (=> (not res!107455) (not e!142614))))

(declare-fun lt!111837 () SeekEntryResult!795)

(assert (=> d!58657 (= res!107455 ((_ is Found!795) lt!111837))))

(assert (=> d!58657 (= lt!111837 (seekEntryOrOpen!0 key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(assert (=> d!58657 true))

(declare-fun _$33!153 () Unit!6529)

(assert (=> d!58657 (= (choose!1087 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) key!932 (defaultEntry!4135 thiss!1504)) _$33!153)))

(declare-fun b!219230 () Bool)

(declare-fun res!107456 () Bool)

(assert (=> b!219230 (=> (not res!107456) (not e!142614))))

(assert (=> b!219230 (= res!107456 (inRange!0 (index!5351 lt!111837) (mask!9918 thiss!1504)))))

(declare-fun b!219231 () Bool)

(assert (=> b!219231 (= e!142614 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5351 lt!111837)) key!932))))

(assert (= (and d!58657 res!107455) b!219230))

(assert (= (and b!219230 res!107456) b!219231))

(assert (=> d!58657 m!244671))

(declare-fun m!244843 () Bool)

(assert (=> b!219230 m!244843))

(declare-fun m!244845 () Bool)

(assert (=> b!219231 m!244845))

(assert (=> d!58631 d!58657))

(assert (=> d!58631 d!58651))

(declare-fun b!219256 () Bool)

(declare-fun e!142633 () Bool)

(declare-fun e!142629 () Bool)

(assert (=> b!219256 (= e!142633 e!142629)))

(declare-fun c!36498 () Bool)

(declare-fun e!142630 () Bool)

(assert (=> b!219256 (= c!36498 e!142630)))

(declare-fun res!107468 () Bool)

(assert (=> b!219256 (=> (not res!107468) (not e!142630))))

(assert (=> b!219256 (= res!107468 (bvslt #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun b!219257 () Bool)

(declare-fun e!142632 () Bool)

(declare-fun lt!111855 () ListLongMap!3247)

(declare-fun isEmpty!502 (ListLongMap!3247) Bool)

(assert (=> b!219257 (= e!142632 (isEmpty!502 lt!111855))))

(declare-fun b!219258 () Bool)

(assert (=> b!219258 (= e!142632 (= lt!111855 (getCurrentListMapNoExtraKeys!524 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4135 thiss!1504))))))

(declare-fun b!219259 () Bool)

(declare-fun lt!111853 () Unit!6529)

(declare-fun lt!111854 () Unit!6529)

(assert (=> b!219259 (= lt!111853 lt!111854)))

(declare-fun lt!111852 () ListLongMap!3247)

(declare-fun lt!111857 () (_ BitVec 64))

(declare-fun lt!111858 () (_ BitVec 64))

(declare-fun lt!111856 () V!7315)

(assert (=> b!219259 (not (contains!1480 (+!597 lt!111852 (tuple2!4335 lt!111858 lt!111856)) lt!111857))))

(declare-fun addStillNotContains!110 (ListLongMap!3247 (_ BitVec 64) V!7315 (_ BitVec 64)) Unit!6529)

(assert (=> b!219259 (= lt!111854 (addStillNotContains!110 lt!111852 lt!111858 lt!111856 lt!111857))))

(assert (=> b!219259 (= lt!111857 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!219259 (= lt!111856 (get!2674 (select (arr!5092 (_values!4118 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4135 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!219259 (= lt!111858 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!20499 () ListLongMap!3247)

(assert (=> b!219259 (= lt!111852 call!20499)))

(declare-fun e!142631 () ListLongMap!3247)

(assert (=> b!219259 (= e!142631 (+!597 call!20499 (tuple2!4335 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000) (get!2674 (select (arr!5092 (_values!4118 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4135 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!219260 () Bool)

(assert (=> b!219260 (= e!142631 call!20499)))

(declare-fun bm!20496 () Bool)

(assert (=> bm!20496 (= call!20499 (getCurrentListMapNoExtraKeys!524 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4135 thiss!1504)))))

(declare-fun b!219261 () Bool)

(assert (=> b!219261 (= e!142629 e!142632)))

(declare-fun c!36500 () Bool)

(assert (=> b!219261 (= c!36500 (bvslt #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun b!219262 () Bool)

(assert (=> b!219262 (= e!142630 (validKeyInArray!0 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219262 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!219264 () Bool)

(declare-fun e!142635 () ListLongMap!3247)

(assert (=> b!219264 (= e!142635 (ListLongMap!3248 Nil!3234))))

(declare-fun b!219265 () Bool)

(assert (=> b!219265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(assert (=> b!219265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5424 (_values!4118 thiss!1504))))))

(declare-fun e!142634 () Bool)

(assert (=> b!219265 (= e!142634 (= (apply!202 lt!111855 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)) (get!2674 (select (arr!5092 (_values!4118 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4135 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219266 () Bool)

(assert (=> b!219266 (= e!142629 e!142634)))

(assert (=> b!219266 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun res!107466 () Bool)

(assert (=> b!219266 (= res!107466 (contains!1480 lt!111855 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219266 (=> (not res!107466) (not e!142634))))

(declare-fun b!219267 () Bool)

(declare-fun res!107465 () Bool)

(assert (=> b!219267 (=> (not res!107465) (not e!142633))))

(assert (=> b!219267 (= res!107465 (not (contains!1480 lt!111855 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!58659 () Bool)

(assert (=> d!58659 e!142633))

(declare-fun res!107467 () Bool)

(assert (=> d!58659 (=> (not res!107467) (not e!142633))))

(assert (=> d!58659 (= res!107467 (not (contains!1480 lt!111855 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58659 (= lt!111855 e!142635)))

(declare-fun c!36497 () Bool)

(assert (=> d!58659 (= c!36497 (bvsge #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(assert (=> d!58659 (validMask!0 (mask!9918 thiss!1504))))

(assert (=> d!58659 (= (getCurrentListMapNoExtraKeys!524 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)) lt!111855)))

(declare-fun b!219263 () Bool)

(assert (=> b!219263 (= e!142635 e!142631)))

(declare-fun c!36499 () Bool)

(assert (=> b!219263 (= c!36499 (validKeyInArray!0 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58659 c!36497) b!219264))

(assert (= (and d!58659 (not c!36497)) b!219263))

(assert (= (and b!219263 c!36499) b!219259))

(assert (= (and b!219263 (not c!36499)) b!219260))

(assert (= (or b!219259 b!219260) bm!20496))

(assert (= (and d!58659 res!107467) b!219267))

(assert (= (and b!219267 res!107465) b!219256))

(assert (= (and b!219256 res!107468) b!219262))

(assert (= (and b!219256 c!36498) b!219266))

(assert (= (and b!219256 (not c!36498)) b!219261))

(assert (= (and b!219266 res!107466) b!219265))

(assert (= (and b!219261 c!36500) b!219258))

(assert (= (and b!219261 (not c!36500)) b!219257))

(declare-fun b_lambda!7835 () Bool)

(assert (=> (not b_lambda!7835) (not b!219259)))

(assert (=> b!219259 t!8197))

(declare-fun b_and!12787 () Bool)

(assert (= b_and!12785 (and (=> t!8197 result!5073) b_and!12787)))

(declare-fun b_lambda!7837 () Bool)

(assert (=> (not b_lambda!7837) (not b!219265)))

(assert (=> b!219265 t!8197))

(declare-fun b_and!12789 () Bool)

(assert (= b_and!12787 (and (=> t!8197 result!5073) b_and!12789)))

(declare-fun m!244847 () Bool)

(assert (=> b!219259 m!244847))

(assert (=> b!219259 m!244847))

(declare-fun m!244849 () Bool)

(assert (=> b!219259 m!244849))

(assert (=> b!219259 m!244737))

(declare-fun m!244851 () Bool)

(assert (=> b!219259 m!244851))

(assert (=> b!219259 m!244731))

(assert (=> b!219259 m!244737))

(assert (=> b!219259 m!244731))

(assert (=> b!219259 m!244739))

(declare-fun m!244853 () Bool)

(assert (=> b!219259 m!244853))

(assert (=> b!219259 m!244733))

(declare-fun m!244855 () Bool)

(assert (=> b!219258 m!244855))

(declare-fun m!244857 () Bool)

(assert (=> d!58659 m!244857))

(assert (=> d!58659 m!244743))

(assert (=> b!219266 m!244733))

(assert (=> b!219266 m!244733))

(declare-fun m!244859 () Bool)

(assert (=> b!219266 m!244859))

(assert (=> b!219263 m!244733))

(assert (=> b!219263 m!244733))

(assert (=> b!219263 m!244745))

(assert (=> b!219262 m!244733))

(assert (=> b!219262 m!244733))

(assert (=> b!219262 m!244745))

(assert (=> b!219265 m!244737))

(assert (=> b!219265 m!244731))

(assert (=> b!219265 m!244733))

(assert (=> b!219265 m!244733))

(declare-fun m!244861 () Bool)

(assert (=> b!219265 m!244861))

(assert (=> b!219265 m!244737))

(assert (=> b!219265 m!244731))

(assert (=> b!219265 m!244739))

(declare-fun m!244863 () Bool)

(assert (=> b!219257 m!244863))

(declare-fun m!244865 () Bool)

(assert (=> b!219267 m!244865))

(assert (=> bm!20496 m!244855))

(assert (=> bm!20478 d!58659))

(declare-fun b!219286 () Bool)

(declare-fun e!142649 () Bool)

(declare-fun lt!111863 () SeekEntryResult!795)

(assert (=> b!219286 (= e!142649 (bvsge (x!22877 lt!111863) #b01111111111111111111111111111110))))

(declare-fun d!58661 () Bool)

(assert (=> d!58661 e!142649))

(declare-fun c!36509 () Bool)

(assert (=> d!58661 (= c!36509 (and ((_ is Intermediate!795) lt!111863) (undefined!1607 lt!111863)))))

(declare-fun e!142647 () SeekEntryResult!795)

(assert (=> d!58661 (= lt!111863 e!142647)))

(declare-fun c!36507 () Bool)

(assert (=> d!58661 (= c!36507 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!111864 () (_ BitVec 64))

(assert (=> d!58661 (= lt!111864 (select (arr!5093 (_keys!6185 thiss!1504)) (toIndex!0 key!932 (mask!9918 thiss!1504))))))

(assert (=> d!58661 (validMask!0 (mask!9918 thiss!1504))))

(assert (=> d!58661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9918 thiss!1504)) key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)) lt!111863)))

(declare-fun b!219287 () Bool)

(assert (=> b!219287 (= e!142647 (Intermediate!795 true (toIndex!0 key!932 (mask!9918 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!219288 () Bool)

(declare-fun e!142650 () Bool)

(assert (=> b!219288 (= e!142649 e!142650)))

(declare-fun res!107475 () Bool)

(assert (=> b!219288 (= res!107475 (and ((_ is Intermediate!795) lt!111863) (not (undefined!1607 lt!111863)) (bvslt (x!22877 lt!111863) #b01111111111111111111111111111110) (bvsge (x!22877 lt!111863) #b00000000000000000000000000000000) (bvsge (x!22877 lt!111863) #b00000000000000000000000000000000)))))

(assert (=> b!219288 (=> (not res!107475) (not e!142650))))

(declare-fun b!219289 () Bool)

(assert (=> b!219289 (and (bvsge (index!5352 lt!111863) #b00000000000000000000000000000000) (bvslt (index!5352 lt!111863) (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun res!107476 () Bool)

(assert (=> b!219289 (= res!107476 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5352 lt!111863)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142648 () Bool)

(assert (=> b!219289 (=> res!107476 e!142648)))

(declare-fun b!219290 () Bool)

(assert (=> b!219290 (and (bvsge (index!5352 lt!111863) #b00000000000000000000000000000000) (bvslt (index!5352 lt!111863) (size!5425 (_keys!6185 thiss!1504))))))

(assert (=> b!219290 (= e!142648 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5352 lt!111863)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219291 () Bool)

(assert (=> b!219291 (and (bvsge (index!5352 lt!111863) #b00000000000000000000000000000000) (bvslt (index!5352 lt!111863) (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun res!107477 () Bool)

(assert (=> b!219291 (= res!107477 (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5352 lt!111863)) key!932))))

(assert (=> b!219291 (=> res!107477 e!142648)))

(assert (=> b!219291 (= e!142650 e!142648)))

(declare-fun b!219292 () Bool)

(declare-fun e!142646 () SeekEntryResult!795)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!219292 (= e!142646 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9918 thiss!1504)) #b00000000000000000000000000000000 (mask!9918 thiss!1504)) key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(declare-fun b!219293 () Bool)

(assert (=> b!219293 (= e!142647 e!142646)))

(declare-fun c!36508 () Bool)

(assert (=> b!219293 (= c!36508 (or (= lt!111864 key!932) (= (bvadd lt!111864 lt!111864) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!219294 () Bool)

(assert (=> b!219294 (= e!142646 (Intermediate!795 false (toIndex!0 key!932 (mask!9918 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!58661 c!36507) b!219287))

(assert (= (and d!58661 (not c!36507)) b!219293))

(assert (= (and b!219293 c!36508) b!219294))

(assert (= (and b!219293 (not c!36508)) b!219292))

(assert (= (and d!58661 c!36509) b!219286))

(assert (= (and d!58661 (not c!36509)) b!219288))

(assert (= (and b!219288 res!107475) b!219291))

(assert (= (and b!219291 (not res!107477)) b!219289))

(assert (= (and b!219289 (not res!107476)) b!219290))

(assert (=> b!219292 m!244819))

(declare-fun m!244867 () Bool)

(assert (=> b!219292 m!244867))

(assert (=> b!219292 m!244867))

(declare-fun m!244869 () Bool)

(assert (=> b!219292 m!244869))

(assert (=> d!58661 m!244819))

(declare-fun m!244871 () Bool)

(assert (=> d!58661 m!244871))

(assert (=> d!58661 m!244743))

(declare-fun m!244873 () Bool)

(assert (=> b!219291 m!244873))

(assert (=> b!219289 m!244873))

(assert (=> b!219290 m!244873))

(assert (=> d!58641 d!58661))

(declare-fun d!58663 () Bool)

(declare-fun lt!111870 () (_ BitVec 32))

(declare-fun lt!111869 () (_ BitVec 32))

(assert (=> d!58663 (= lt!111870 (bvmul (bvxor lt!111869 (bvlshr lt!111869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58663 (= lt!111869 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58663 (and (bvsge (mask!9918 thiss!1504) #b00000000000000000000000000000000) (let ((res!107478 (let ((h!3883 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22895 (bvmul (bvxor h!3883 (bvlshr h!3883 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22895 (bvlshr x!22895 #b00000000000000000000000000001101)) (mask!9918 thiss!1504)))))) (and (bvslt res!107478 (bvadd (mask!9918 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!107478 #b00000000000000000000000000000000))))))

(assert (=> d!58663 (= (toIndex!0 key!932 (mask!9918 thiss!1504)) (bvand (bvxor lt!111870 (bvlshr lt!111870 #b00000000000000000000000000001101)) (mask!9918 thiss!1504)))))

(assert (=> d!58641 d!58663))

(assert (=> d!58641 d!58651))

(declare-fun d!58665 () Bool)

(declare-fun isEmpty!503 (Option!266) Bool)

(assert (=> d!58665 (= (isDefined!201 (getValueByKey!260 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932)) (not (isEmpty!503 (getValueByKey!260 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932))))))

(declare-fun bs!8438 () Bool)

(assert (= bs!8438 d!58665))

(assert (=> bs!8438 m!244727))

(declare-fun m!244875 () Bool)

(assert (=> bs!8438 m!244875))

(assert (=> b!219057 d!58665))

(declare-fun d!58667 () Bool)

(declare-fun c!36514 () Bool)

(assert (=> d!58667 (= c!36514 (and ((_ is Cons!3233) (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))) (= (_1!2178 (h!3880 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))))) key!932)))))

(declare-fun e!142655 () Option!266)

(assert (=> d!58667 (= (getValueByKey!260 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932) e!142655)))

(declare-fun b!219303 () Bool)

(assert (=> b!219303 (= e!142655 (Some!265 (_2!2178 (h!3880 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))))))))

(declare-fun b!219306 () Bool)

(declare-fun e!142656 () Option!266)

(assert (=> b!219306 (= e!142656 None!264)))

(declare-fun b!219305 () Bool)

(assert (=> b!219305 (= e!142656 (getValueByKey!260 (t!8194 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))) key!932))))

(declare-fun b!219304 () Bool)

(assert (=> b!219304 (= e!142655 e!142656)))

(declare-fun c!36515 () Bool)

(assert (=> b!219304 (= c!36515 (and ((_ is Cons!3233) (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))) (not (= (_1!2178 (h!3880 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))))) key!932))))))

(assert (= (and d!58667 c!36514) b!219303))

(assert (= (and d!58667 (not c!36514)) b!219304))

(assert (= (and b!219304 c!36515) b!219305))

(assert (= (and b!219304 (not c!36515)) b!219306))

(declare-fun m!244877 () Bool)

(assert (=> b!219305 m!244877))

(assert (=> b!219057 d!58667))

(declare-fun d!58669 () Bool)

(declare-fun get!2675 (Option!266) V!7315)

(assert (=> d!58669 (= (apply!202 lt!111806 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2675 (getValueByKey!260 (toList!1639 lt!111806) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8439 () Bool)

(assert (= bs!8439 d!58669))

(declare-fun m!244879 () Bool)

(assert (=> bs!8439 m!244879))

(assert (=> bs!8439 m!244879))

(declare-fun m!244881 () Bool)

(assert (=> bs!8439 m!244881))

(assert (=> b!219119 d!58669))

(declare-fun d!58671 () Bool)

(declare-fun e!142657 () Bool)

(assert (=> d!58671 e!142657))

(declare-fun res!107479 () Bool)

(assert (=> d!58671 (=> res!107479 e!142657)))

(declare-fun lt!111874 () Bool)

(assert (=> d!58671 (= res!107479 (not lt!111874))))

(declare-fun lt!111872 () Bool)

(assert (=> d!58671 (= lt!111874 lt!111872)))

(declare-fun lt!111873 () Unit!6529)

(declare-fun e!142658 () Unit!6529)

(assert (=> d!58671 (= lt!111873 e!142658)))

(declare-fun c!36516 () Bool)

(assert (=> d!58671 (= c!36516 lt!111872)))

(assert (=> d!58671 (= lt!111872 (containsKey!252 (toList!1639 lt!111806) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58671 (= (contains!1480 lt!111806 #b1000000000000000000000000000000000000000000000000000000000000000) lt!111874)))

(declare-fun b!219307 () Bool)

(declare-fun lt!111871 () Unit!6529)

(assert (=> b!219307 (= e!142658 lt!111871)))

(assert (=> b!219307 (= lt!111871 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1639 lt!111806) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219307 (isDefined!201 (getValueByKey!260 (toList!1639 lt!111806) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219308 () Bool)

(declare-fun Unit!6537 () Unit!6529)

(assert (=> b!219308 (= e!142658 Unit!6537)))

(declare-fun b!219309 () Bool)

(assert (=> b!219309 (= e!142657 (isDefined!201 (getValueByKey!260 (toList!1639 lt!111806) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58671 c!36516) b!219307))

(assert (= (and d!58671 (not c!36516)) b!219308))

(assert (= (and d!58671 (not res!107479)) b!219309))

(declare-fun m!244883 () Bool)

(assert (=> d!58671 m!244883))

(declare-fun m!244885 () Bool)

(assert (=> b!219307 m!244885))

(assert (=> b!219307 m!244879))

(assert (=> b!219307 m!244879))

(declare-fun m!244887 () Bool)

(assert (=> b!219307 m!244887))

(assert (=> b!219309 m!244879))

(assert (=> b!219309 m!244879))

(assert (=> b!219309 m!244887))

(assert (=> bm!20481 d!58671))

(declare-fun d!58673 () Bool)

(assert (=> d!58673 (isDefined!201 (getValueByKey!260 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932))))

(declare-fun lt!111877 () Unit!6529)

(declare-fun choose!1089 (List!3237 (_ BitVec 64)) Unit!6529)

(assert (=> d!58673 (= lt!111877 (choose!1089 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932))))

(declare-fun e!142661 () Bool)

(assert (=> d!58673 e!142661))

(declare-fun res!107482 () Bool)

(assert (=> d!58673 (=> (not res!107482) (not e!142661))))

(declare-fun isStrictlySorted!358 (List!3237) Bool)

(assert (=> d!58673 (= res!107482 (isStrictlySorted!358 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504)))))))

(assert (=> d!58673 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932) lt!111877)))

(declare-fun b!219312 () Bool)

(assert (=> b!219312 (= e!142661 (containsKey!252 (toList!1639 (getCurrentListMap!1167 (_keys!6185 thiss!1504) (_values!4118 thiss!1504) (mask!9918 thiss!1504) (extraKeys!3872 thiss!1504) (zeroValue!3976 thiss!1504) (minValue!3976 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4135 thiss!1504))) key!932))))

(assert (= (and d!58673 res!107482) b!219312))

(assert (=> d!58673 m!244727))

(assert (=> d!58673 m!244727))

(assert (=> d!58673 m!244729))

(declare-fun m!244889 () Bool)

(assert (=> d!58673 m!244889))

(declare-fun m!244891 () Bool)

(assert (=> d!58673 m!244891))

(assert (=> b!219312 m!244723))

(assert (=> b!219055 d!58673))

(assert (=> b!219055 d!58665))

(assert (=> b!219055 d!58667))

(assert (=> bm!20486 d!58633))

(declare-fun d!58675 () Bool)

(declare-fun e!142662 () Bool)

(assert (=> d!58675 e!142662))

(declare-fun res!107483 () Bool)

(assert (=> d!58675 (=> res!107483 e!142662)))

(declare-fun lt!111881 () Bool)

(assert (=> d!58675 (= res!107483 (not lt!111881))))

(declare-fun lt!111879 () Bool)

(assert (=> d!58675 (= lt!111881 lt!111879)))

(declare-fun lt!111880 () Unit!6529)

(declare-fun e!142663 () Unit!6529)

(assert (=> d!58675 (= lt!111880 e!142663)))

(declare-fun c!36517 () Bool)

(assert (=> d!58675 (= c!36517 lt!111879)))

(assert (=> d!58675 (= lt!111879 (containsKey!252 (toList!1639 lt!111806) (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58675 (= (contains!1480 lt!111806 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)) lt!111881)))

(declare-fun b!219313 () Bool)

(declare-fun lt!111878 () Unit!6529)

(assert (=> b!219313 (= e!142663 lt!111878)))

(assert (=> b!219313 (= lt!111878 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1639 lt!111806) (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219313 (isDefined!201 (getValueByKey!260 (toList!1639 lt!111806) (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219314 () Bool)

(declare-fun Unit!6538 () Unit!6529)

(assert (=> b!219314 (= e!142663 Unit!6538)))

(declare-fun b!219315 () Bool)

(assert (=> b!219315 (= e!142662 (isDefined!201 (getValueByKey!260 (toList!1639 lt!111806) (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!58675 c!36517) b!219313))

(assert (= (and d!58675 (not c!36517)) b!219314))

(assert (= (and d!58675 (not res!107483)) b!219315))

(assert (=> d!58675 m!244733))

(declare-fun m!244893 () Bool)

(assert (=> d!58675 m!244893))

(assert (=> b!219313 m!244733))

(declare-fun m!244895 () Bool)

(assert (=> b!219313 m!244895))

(assert (=> b!219313 m!244733))

(declare-fun m!244897 () Bool)

(assert (=> b!219313 m!244897))

(assert (=> b!219313 m!244897))

(declare-fun m!244899 () Bool)

(assert (=> b!219313 m!244899))

(assert (=> b!219315 m!244733))

(assert (=> b!219315 m!244897))

(assert (=> b!219315 m!244897))

(assert (=> b!219315 m!244899))

(assert (=> b!219100 d!58675))

(declare-fun d!58677 () Bool)

(declare-fun e!142666 () Bool)

(assert (=> d!58677 e!142666))

(declare-fun res!107489 () Bool)

(assert (=> d!58677 (=> (not res!107489) (not e!142666))))

(declare-fun lt!111890 () ListLongMap!3247)

(assert (=> d!58677 (= res!107489 (contains!1480 lt!111890 (_1!2178 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))))))

(declare-fun lt!111892 () List!3237)

(assert (=> d!58677 (= lt!111890 (ListLongMap!3248 lt!111892))))

(declare-fun lt!111891 () Unit!6529)

(declare-fun lt!111893 () Unit!6529)

(assert (=> d!58677 (= lt!111891 lt!111893)))

(assert (=> d!58677 (= (getValueByKey!260 lt!111892 (_1!2178 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))) (Some!265 (_2!2178 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!146 (List!3237 (_ BitVec 64) V!7315) Unit!6529)

(assert (=> d!58677 (= lt!111893 (lemmaContainsTupThenGetReturnValue!146 lt!111892 (_1!2178 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))) (_2!2178 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))))))

(declare-fun insertStrictlySorted!149 (List!3237 (_ BitVec 64) V!7315) List!3237)

(assert (=> d!58677 (= lt!111892 (insertStrictlySorted!149 (toList!1639 call!20483) (_1!2178 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))) (_2!2178 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))))))

(assert (=> d!58677 (= (+!597 call!20483 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))) lt!111890)))

(declare-fun b!219320 () Bool)

(declare-fun res!107488 () Bool)

(assert (=> b!219320 (=> (not res!107488) (not e!142666))))

(assert (=> b!219320 (= res!107488 (= (getValueByKey!260 (toList!1639 lt!111890) (_1!2178 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))) (Some!265 (_2!2178 (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))))))))

(declare-fun b!219321 () Bool)

(declare-fun contains!1482 (List!3237 tuple2!4334) Bool)

(assert (=> b!219321 (= e!142666 (contains!1482 (toList!1639 lt!111890) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))))))

(assert (= (and d!58677 res!107489) b!219320))

(assert (= (and b!219320 res!107488) b!219321))

(declare-fun m!244901 () Bool)

(assert (=> d!58677 m!244901))

(declare-fun m!244903 () Bool)

(assert (=> d!58677 m!244903))

(declare-fun m!244905 () Bool)

(assert (=> d!58677 m!244905))

(declare-fun m!244907 () Bool)

(assert (=> d!58677 m!244907))

(declare-fun m!244909 () Bool)

(assert (=> b!219320 m!244909))

(declare-fun m!244911 () Bool)

(assert (=> b!219321 m!244911))

(assert (=> b!219117 d!58677))

(declare-fun d!58679 () Bool)

(declare-fun res!107496 () Bool)

(declare-fun e!142676 () Bool)

(assert (=> d!58679 (=> res!107496 e!142676)))

(assert (=> d!58679 (= res!107496 (bvsge #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(assert (=> d!58679 (= (arrayNoDuplicates!0 (_keys!6185 thiss!1504) #b00000000000000000000000000000000 Nil!3236) e!142676)))

(declare-fun b!219332 () Bool)

(declare-fun e!142675 () Bool)

(declare-fun call!20502 () Bool)

(assert (=> b!219332 (= e!142675 call!20502)))

(declare-fun bm!20499 () Bool)

(declare-fun c!36520 () Bool)

(assert (=> bm!20499 (= call!20502 (arrayNoDuplicates!0 (_keys!6185 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36520 (Cons!3235 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000) Nil!3236) Nil!3236)))))

(declare-fun b!219333 () Bool)

(declare-fun e!142678 () Bool)

(assert (=> b!219333 (= e!142678 e!142675)))

(assert (=> b!219333 (= c!36520 (validKeyInArray!0 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219334 () Bool)

(assert (=> b!219334 (= e!142676 e!142678)))

(declare-fun res!107497 () Bool)

(assert (=> b!219334 (=> (not res!107497) (not e!142678))))

(declare-fun e!142677 () Bool)

(assert (=> b!219334 (= res!107497 (not e!142677))))

(declare-fun res!107498 () Bool)

(assert (=> b!219334 (=> (not res!107498) (not e!142677))))

(assert (=> b!219334 (= res!107498 (validKeyInArray!0 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219335 () Bool)

(assert (=> b!219335 (= e!142675 call!20502)))

(declare-fun b!219336 () Bool)

(declare-fun contains!1483 (List!3239 (_ BitVec 64)) Bool)

(assert (=> b!219336 (= e!142677 (contains!1483 Nil!3236 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58679 (not res!107496)) b!219334))

(assert (= (and b!219334 res!107498) b!219336))

(assert (= (and b!219334 res!107497) b!219333))

(assert (= (and b!219333 c!36520) b!219332))

(assert (= (and b!219333 (not c!36520)) b!219335))

(assert (= (or b!219332 b!219335) bm!20499))

(assert (=> bm!20499 m!244733))

(declare-fun m!244913 () Bool)

(assert (=> bm!20499 m!244913))

(assert (=> b!219333 m!244733))

(assert (=> b!219333 m!244733))

(assert (=> b!219333 m!244745))

(assert (=> b!219334 m!244733))

(assert (=> b!219334 m!244733))

(assert (=> b!219334 m!244745))

(assert (=> b!219336 m!244733))

(assert (=> b!219336 m!244733))

(declare-fun m!244915 () Bool)

(assert (=> b!219336 m!244915))

(assert (=> b!219131 d!58679))

(declare-fun d!58681 () Bool)

(declare-fun e!142679 () Bool)

(assert (=> d!58681 e!142679))

(declare-fun res!107500 () Bool)

(assert (=> d!58681 (=> (not res!107500) (not e!142679))))

(declare-fun lt!111894 () ListLongMap!3247)

(assert (=> d!58681 (= res!107500 (contains!1480 lt!111894 (_1!2178 (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))))))))

(declare-fun lt!111896 () List!3237)

(assert (=> d!58681 (= lt!111894 (ListLongMap!3248 lt!111896))))

(declare-fun lt!111895 () Unit!6529)

(declare-fun lt!111897 () Unit!6529)

(assert (=> d!58681 (= lt!111895 lt!111897)))

(assert (=> d!58681 (= (getValueByKey!260 lt!111896 (_1!2178 (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))))) (Some!265 (_2!2178 (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))))))))

(assert (=> d!58681 (= lt!111897 (lemmaContainsTupThenGetReturnValue!146 lt!111896 (_1!2178 (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))) (_2!2178 (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))))))))

(assert (=> d!58681 (= lt!111896 (insertStrictlySorted!149 (toList!1639 (ite c!36466 call!20480 (ite c!36467 call!20482 call!20481))) (_1!2178 (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))) (_2!2178 (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))))))))

(assert (=> d!58681 (= (+!597 (ite c!36466 call!20480 (ite c!36467 call!20482 call!20481)) (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))) lt!111894)))

(declare-fun b!219337 () Bool)

(declare-fun res!107499 () Bool)

(assert (=> b!219337 (=> (not res!107499) (not e!142679))))

(assert (=> b!219337 (= res!107499 (= (getValueByKey!260 (toList!1639 lt!111894) (_1!2178 (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504))))) (Some!265 (_2!2178 (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))))))))

(declare-fun b!219338 () Bool)

(assert (=> b!219338 (= e!142679 (contains!1482 (toList!1639 lt!111894) (ite (or c!36466 c!36467) (tuple2!4335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3976 thiss!1504)) (tuple2!4335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3976 thiss!1504)))))))

(assert (= (and d!58681 res!107500) b!219337))

(assert (= (and b!219337 res!107499) b!219338))

(declare-fun m!244917 () Bool)

(assert (=> d!58681 m!244917))

(declare-fun m!244919 () Bool)

(assert (=> d!58681 m!244919))

(declare-fun m!244921 () Bool)

(assert (=> d!58681 m!244921))

(declare-fun m!244923 () Bool)

(assert (=> d!58681 m!244923))

(declare-fun m!244925 () Bool)

(assert (=> b!219337 m!244925))

(declare-fun m!244927 () Bool)

(assert (=> b!219338 m!244927))

(assert (=> bm!20476 d!58681))

(declare-fun d!58683 () Bool)

(assert (=> d!58683 (= (apply!202 (+!597 lt!111794 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504))) lt!111789) (apply!202 lt!111794 lt!111789))))

(declare-fun lt!111900 () Unit!6529)

(declare-fun choose!1090 (ListLongMap!3247 (_ BitVec 64) V!7315 (_ BitVec 64)) Unit!6529)

(assert (=> d!58683 (= lt!111900 (choose!1090 lt!111794 lt!111810 (minValue!3976 thiss!1504) lt!111789))))

(declare-fun e!142682 () Bool)

(assert (=> d!58683 e!142682))

(declare-fun res!107503 () Bool)

(assert (=> d!58683 (=> (not res!107503) (not e!142682))))

(assert (=> d!58683 (= res!107503 (contains!1480 lt!111794 lt!111789))))

(assert (=> d!58683 (= (addApplyDifferent!178 lt!111794 lt!111810 (minValue!3976 thiss!1504) lt!111789) lt!111900)))

(declare-fun b!219342 () Bool)

(assert (=> b!219342 (= e!142682 (not (= lt!111789 lt!111810)))))

(assert (= (and d!58683 res!107503) b!219342))

(declare-fun m!244929 () Bool)

(assert (=> d!58683 m!244929))

(assert (=> d!58683 m!244785))

(assert (=> d!58683 m!244767))

(declare-fun m!244931 () Bool)

(assert (=> d!58683 m!244931))

(assert (=> d!58683 m!244767))

(assert (=> d!58683 m!244769))

(assert (=> b!219101 d!58683))

(declare-fun d!58685 () Bool)

(assert (=> d!58685 (= (apply!202 lt!111794 lt!111789) (get!2675 (getValueByKey!260 (toList!1639 lt!111794) lt!111789)))))

(declare-fun bs!8440 () Bool)

(assert (= bs!8440 d!58685))

(declare-fun m!244933 () Bool)

(assert (=> bs!8440 m!244933))

(assert (=> bs!8440 m!244933))

(declare-fun m!244935 () Bool)

(assert (=> bs!8440 m!244935))

(assert (=> b!219101 d!58685))

(declare-fun d!58687 () Bool)

(declare-fun e!142683 () Bool)

(assert (=> d!58687 e!142683))

(declare-fun res!107505 () Bool)

(assert (=> d!58687 (=> (not res!107505) (not e!142683))))

(declare-fun lt!111901 () ListLongMap!3247)

(assert (=> d!58687 (= res!107505 (contains!1480 lt!111901 (_1!2178 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504)))))))

(declare-fun lt!111903 () List!3237)

(assert (=> d!58687 (= lt!111901 (ListLongMap!3248 lt!111903))))

(declare-fun lt!111902 () Unit!6529)

(declare-fun lt!111904 () Unit!6529)

(assert (=> d!58687 (= lt!111902 lt!111904)))

(assert (=> d!58687 (= (getValueByKey!260 lt!111903 (_1!2178 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504)))) (Some!265 (_2!2178 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504)))))))

(assert (=> d!58687 (= lt!111904 (lemmaContainsTupThenGetReturnValue!146 lt!111903 (_1!2178 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504))) (_2!2178 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504)))))))

(assert (=> d!58687 (= lt!111903 (insertStrictlySorted!149 (toList!1639 lt!111809) (_1!2178 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504))) (_2!2178 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504)))))))

(assert (=> d!58687 (= (+!597 lt!111809 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504))) lt!111901)))

(declare-fun b!219343 () Bool)

(declare-fun res!107504 () Bool)

(assert (=> b!219343 (=> (not res!107504) (not e!142683))))

(assert (=> b!219343 (= res!107504 (= (getValueByKey!260 (toList!1639 lt!111901) (_1!2178 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504)))) (Some!265 (_2!2178 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504))))))))

(declare-fun b!219344 () Bool)

(assert (=> b!219344 (= e!142683 (contains!1482 (toList!1639 lt!111901) (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504))))))

(assert (= (and d!58687 res!107505) b!219343))

(assert (= (and b!219343 res!107504) b!219344))

(declare-fun m!244937 () Bool)

(assert (=> d!58687 m!244937))

(declare-fun m!244939 () Bool)

(assert (=> d!58687 m!244939))

(declare-fun m!244941 () Bool)

(assert (=> d!58687 m!244941))

(declare-fun m!244943 () Bool)

(assert (=> d!58687 m!244943))

(declare-fun m!244945 () Bool)

(assert (=> b!219343 m!244945))

(declare-fun m!244947 () Bool)

(assert (=> b!219344 m!244947))

(assert (=> b!219101 d!58687))

(declare-fun d!58689 () Bool)

(declare-fun e!142684 () Bool)

(assert (=> d!58689 e!142684))

(declare-fun res!107507 () Bool)

(assert (=> d!58689 (=> (not res!107507) (not e!142684))))

(declare-fun lt!111905 () ListLongMap!3247)

(assert (=> d!58689 (= res!107507 (contains!1480 lt!111905 (_1!2178 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504)))))))

(declare-fun lt!111907 () List!3237)

(assert (=> d!58689 (= lt!111905 (ListLongMap!3248 lt!111907))))

(declare-fun lt!111906 () Unit!6529)

(declare-fun lt!111908 () Unit!6529)

(assert (=> d!58689 (= lt!111906 lt!111908)))

(assert (=> d!58689 (= (getValueByKey!260 lt!111907 (_1!2178 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504)))) (Some!265 (_2!2178 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504)))))))

(assert (=> d!58689 (= lt!111908 (lemmaContainsTupThenGetReturnValue!146 lt!111907 (_1!2178 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504))) (_2!2178 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504)))))))

(assert (=> d!58689 (= lt!111907 (insertStrictlySorted!149 (toList!1639 lt!111794) (_1!2178 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504))) (_2!2178 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504)))))))

(assert (=> d!58689 (= (+!597 lt!111794 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504))) lt!111905)))

(declare-fun b!219345 () Bool)

(declare-fun res!107506 () Bool)

(assert (=> b!219345 (=> (not res!107506) (not e!142684))))

(assert (=> b!219345 (= res!107506 (= (getValueByKey!260 (toList!1639 lt!111905) (_1!2178 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504)))) (Some!265 (_2!2178 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504))))))))

(declare-fun b!219346 () Bool)

(assert (=> b!219346 (= e!142684 (contains!1482 (toList!1639 lt!111905) (tuple2!4335 lt!111810 (minValue!3976 thiss!1504))))))

(assert (= (and d!58689 res!107507) b!219345))

(assert (= (and b!219345 res!107506) b!219346))

(declare-fun m!244949 () Bool)

(assert (=> d!58689 m!244949))

(declare-fun m!244951 () Bool)

(assert (=> d!58689 m!244951))

(declare-fun m!244953 () Bool)

(assert (=> d!58689 m!244953))

(declare-fun m!244955 () Bool)

(assert (=> d!58689 m!244955))

(declare-fun m!244957 () Bool)

(assert (=> b!219345 m!244957))

(declare-fun m!244959 () Bool)

(assert (=> b!219346 m!244959))

(assert (=> b!219101 d!58689))

(declare-fun d!58691 () Bool)

(declare-fun e!142685 () Bool)

(assert (=> d!58691 e!142685))

(declare-fun res!107508 () Bool)

(assert (=> d!58691 (=> res!107508 e!142685)))

(declare-fun lt!111912 () Bool)

(assert (=> d!58691 (= res!107508 (not lt!111912))))

(declare-fun lt!111910 () Bool)

(assert (=> d!58691 (= lt!111912 lt!111910)))

(declare-fun lt!111911 () Unit!6529)

(declare-fun e!142686 () Unit!6529)

(assert (=> d!58691 (= lt!111911 e!142686)))

(declare-fun c!36521 () Bool)

(assert (=> d!58691 (= c!36521 lt!111910)))

(assert (=> d!58691 (= lt!111910 (containsKey!252 (toList!1639 (+!597 lt!111798 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504)))) lt!111800))))

(assert (=> d!58691 (= (contains!1480 (+!597 lt!111798 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504))) lt!111800) lt!111912)))

(declare-fun b!219347 () Bool)

(declare-fun lt!111909 () Unit!6529)

(assert (=> b!219347 (= e!142686 lt!111909)))

(assert (=> b!219347 (= lt!111909 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1639 (+!597 lt!111798 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504)))) lt!111800))))

(assert (=> b!219347 (isDefined!201 (getValueByKey!260 (toList!1639 (+!597 lt!111798 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504)))) lt!111800))))

(declare-fun b!219348 () Bool)

(declare-fun Unit!6539 () Unit!6529)

(assert (=> b!219348 (= e!142686 Unit!6539)))

(declare-fun b!219349 () Bool)

(assert (=> b!219349 (= e!142685 (isDefined!201 (getValueByKey!260 (toList!1639 (+!597 lt!111798 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504)))) lt!111800)))))

(assert (= (and d!58691 c!36521) b!219347))

(assert (= (and d!58691 (not c!36521)) b!219348))

(assert (= (and d!58691 (not res!107508)) b!219349))

(declare-fun m!244961 () Bool)

(assert (=> d!58691 m!244961))

(declare-fun m!244963 () Bool)

(assert (=> b!219347 m!244963))

(declare-fun m!244965 () Bool)

(assert (=> b!219347 m!244965))

(assert (=> b!219347 m!244965))

(declare-fun m!244967 () Bool)

(assert (=> b!219347 m!244967))

(assert (=> b!219349 m!244965))

(assert (=> b!219349 m!244965))

(assert (=> b!219349 m!244967))

(assert (=> b!219101 d!58691))

(declare-fun d!58693 () Bool)

(assert (=> d!58693 (= (apply!202 lt!111797 lt!111793) (get!2675 (getValueByKey!260 (toList!1639 lt!111797) lt!111793)))))

(declare-fun bs!8441 () Bool)

(assert (= bs!8441 d!58693))

(declare-fun m!244969 () Bool)

(assert (=> bs!8441 m!244969))

(assert (=> bs!8441 m!244969))

(declare-fun m!244971 () Bool)

(assert (=> bs!8441 m!244971))

(assert (=> b!219101 d!58693))

(declare-fun d!58695 () Bool)

(declare-fun e!142687 () Bool)

(assert (=> d!58695 e!142687))

(declare-fun res!107510 () Bool)

(assert (=> d!58695 (=> (not res!107510) (not e!142687))))

(declare-fun lt!111913 () ListLongMap!3247)

(assert (=> d!58695 (= res!107510 (contains!1480 lt!111913 (_1!2178 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504)))))))

(declare-fun lt!111915 () List!3237)

(assert (=> d!58695 (= lt!111913 (ListLongMap!3248 lt!111915))))

(declare-fun lt!111914 () Unit!6529)

(declare-fun lt!111916 () Unit!6529)

(assert (=> d!58695 (= lt!111914 lt!111916)))

(assert (=> d!58695 (= (getValueByKey!260 lt!111915 (_1!2178 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504)))) (Some!265 (_2!2178 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504)))))))

(assert (=> d!58695 (= lt!111916 (lemmaContainsTupThenGetReturnValue!146 lt!111915 (_1!2178 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504))) (_2!2178 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504)))))))

(assert (=> d!58695 (= lt!111915 (insertStrictlySorted!149 (toList!1639 lt!111798) (_1!2178 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504))) (_2!2178 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504)))))))

(assert (=> d!58695 (= (+!597 lt!111798 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504))) lt!111913)))

(declare-fun b!219350 () Bool)

(declare-fun res!107509 () Bool)

(assert (=> b!219350 (=> (not res!107509) (not e!142687))))

(assert (=> b!219350 (= res!107509 (= (getValueByKey!260 (toList!1639 lt!111913) (_1!2178 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504)))) (Some!265 (_2!2178 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504))))))))

(declare-fun b!219351 () Bool)

(assert (=> b!219351 (= e!142687 (contains!1482 (toList!1639 lt!111913) (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504))))))

(assert (= (and d!58695 res!107510) b!219350))

(assert (= (and b!219350 res!107509) b!219351))

(declare-fun m!244973 () Bool)

(assert (=> d!58695 m!244973))

(declare-fun m!244975 () Bool)

(assert (=> d!58695 m!244975))

(declare-fun m!244977 () Bool)

(assert (=> d!58695 m!244977))

(declare-fun m!244979 () Bool)

(assert (=> d!58695 m!244979))

(declare-fun m!244981 () Bool)

(assert (=> b!219350 m!244981))

(declare-fun m!244983 () Bool)

(assert (=> b!219351 m!244983))

(assert (=> b!219101 d!58695))

(declare-fun d!58697 () Bool)

(assert (=> d!58697 (= (apply!202 (+!597 lt!111809 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504))) lt!111802) (get!2675 (getValueByKey!260 (toList!1639 (+!597 lt!111809 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504)))) lt!111802)))))

(declare-fun bs!8442 () Bool)

(assert (= bs!8442 d!58697))

(declare-fun m!244985 () Bool)

(assert (=> bs!8442 m!244985))

(assert (=> bs!8442 m!244985))

(declare-fun m!244987 () Bool)

(assert (=> bs!8442 m!244987))

(assert (=> b!219101 d!58697))

(declare-fun d!58699 () Bool)

(assert (=> d!58699 (contains!1480 (+!597 lt!111798 (tuple2!4335 lt!111807 (zeroValue!3976 thiss!1504))) lt!111800)))

(declare-fun lt!111919 () Unit!6529)

(declare-fun choose!1091 (ListLongMap!3247 (_ BitVec 64) V!7315 (_ BitVec 64)) Unit!6529)

(assert (=> d!58699 (= lt!111919 (choose!1091 lt!111798 lt!111807 (zeroValue!3976 thiss!1504) lt!111800))))

(assert (=> d!58699 (contains!1480 lt!111798 lt!111800)))

(assert (=> d!58699 (= (addStillContains!178 lt!111798 lt!111807 (zeroValue!3976 thiss!1504) lt!111800) lt!111919)))

(declare-fun bs!8443 () Bool)

(assert (= bs!8443 d!58699))

(assert (=> bs!8443 m!244773))

(assert (=> bs!8443 m!244773))

(assert (=> bs!8443 m!244775))

(declare-fun m!244989 () Bool)

(assert (=> bs!8443 m!244989))

(declare-fun m!244991 () Bool)

(assert (=> bs!8443 m!244991))

(assert (=> b!219101 d!58699))

(declare-fun d!58701 () Bool)

(declare-fun e!142688 () Bool)

(assert (=> d!58701 e!142688))

(declare-fun res!107512 () Bool)

(assert (=> d!58701 (=> (not res!107512) (not e!142688))))

(declare-fun lt!111920 () ListLongMap!3247)

(assert (=> d!58701 (= res!107512 (contains!1480 lt!111920 (_1!2178 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504)))))))

(declare-fun lt!111922 () List!3237)

(assert (=> d!58701 (= lt!111920 (ListLongMap!3248 lt!111922))))

(declare-fun lt!111921 () Unit!6529)

(declare-fun lt!111923 () Unit!6529)

(assert (=> d!58701 (= lt!111921 lt!111923)))

(assert (=> d!58701 (= (getValueByKey!260 lt!111922 (_1!2178 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504)))) (Some!265 (_2!2178 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504)))))))

(assert (=> d!58701 (= lt!111923 (lemmaContainsTupThenGetReturnValue!146 lt!111922 (_1!2178 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504))) (_2!2178 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504)))))))

(assert (=> d!58701 (= lt!111922 (insertStrictlySorted!149 (toList!1639 lt!111797) (_1!2178 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504))) (_2!2178 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504)))))))

(assert (=> d!58701 (= (+!597 lt!111797 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504))) lt!111920)))

(declare-fun b!219353 () Bool)

(declare-fun res!107511 () Bool)

(assert (=> b!219353 (=> (not res!107511) (not e!142688))))

(assert (=> b!219353 (= res!107511 (= (getValueByKey!260 (toList!1639 lt!111920) (_1!2178 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504)))) (Some!265 (_2!2178 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504))))))))

(declare-fun b!219354 () Bool)

(assert (=> b!219354 (= e!142688 (contains!1482 (toList!1639 lt!111920) (tuple2!4335 lt!111808 (minValue!3976 thiss!1504))))))

(assert (= (and d!58701 res!107512) b!219353))

(assert (= (and b!219353 res!107511) b!219354))

(declare-fun m!244993 () Bool)

(assert (=> d!58701 m!244993))

(declare-fun m!244995 () Bool)

(assert (=> d!58701 m!244995))

(declare-fun m!244997 () Bool)

(assert (=> d!58701 m!244997))

(declare-fun m!244999 () Bool)

(assert (=> d!58701 m!244999))

(declare-fun m!245001 () Bool)

(assert (=> b!219353 m!245001))

(declare-fun m!245003 () Bool)

(assert (=> b!219354 m!245003))

(assert (=> b!219101 d!58701))

(declare-fun d!58703 () Bool)

(assert (=> d!58703 (= (apply!202 (+!597 lt!111797 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504))) lt!111793) (apply!202 lt!111797 lt!111793))))

(declare-fun lt!111924 () Unit!6529)

(assert (=> d!58703 (= lt!111924 (choose!1090 lt!111797 lt!111808 (minValue!3976 thiss!1504) lt!111793))))

(declare-fun e!142689 () Bool)

(assert (=> d!58703 e!142689))

(declare-fun res!107513 () Bool)

(assert (=> d!58703 (=> (not res!107513) (not e!142689))))

(assert (=> d!58703 (= res!107513 (contains!1480 lt!111797 lt!111793))))

(assert (=> d!58703 (= (addApplyDifferent!178 lt!111797 lt!111808 (minValue!3976 thiss!1504) lt!111793) lt!111924)))

(declare-fun b!219355 () Bool)

(assert (=> b!219355 (= e!142689 (not (= lt!111793 lt!111808)))))

(assert (= (and d!58703 res!107513) b!219355))

(declare-fun m!245005 () Bool)

(assert (=> d!58703 m!245005))

(assert (=> d!58703 m!244783))

(assert (=> d!58703 m!244759))

(declare-fun m!245007 () Bool)

(assert (=> d!58703 m!245007))

(assert (=> d!58703 m!244759))

(assert (=> d!58703 m!244771))

(assert (=> b!219101 d!58703))

(declare-fun d!58705 () Bool)

(assert (=> d!58705 (= (apply!202 lt!111809 lt!111802) (get!2675 (getValueByKey!260 (toList!1639 lt!111809) lt!111802)))))

(declare-fun bs!8444 () Bool)

(assert (= bs!8444 d!58705))

(declare-fun m!245009 () Bool)

(assert (=> bs!8444 m!245009))

(assert (=> bs!8444 m!245009))

(declare-fun m!245011 () Bool)

(assert (=> bs!8444 m!245011))

(assert (=> b!219101 d!58705))

(declare-fun d!58707 () Bool)

(assert (=> d!58707 (= (apply!202 (+!597 lt!111809 (tuple2!4335 lt!111799 (zeroValue!3976 thiss!1504))) lt!111802) (apply!202 lt!111809 lt!111802))))

(declare-fun lt!111925 () Unit!6529)

(assert (=> d!58707 (= lt!111925 (choose!1090 lt!111809 lt!111799 (zeroValue!3976 thiss!1504) lt!111802))))

(declare-fun e!142690 () Bool)

(assert (=> d!58707 e!142690))

(declare-fun res!107514 () Bool)

(assert (=> d!58707 (=> (not res!107514) (not e!142690))))

(assert (=> d!58707 (= res!107514 (contains!1480 lt!111809 lt!111802))))

(assert (=> d!58707 (= (addApplyDifferent!178 lt!111809 lt!111799 (zeroValue!3976 thiss!1504) lt!111802) lt!111925)))

(declare-fun b!219356 () Bool)

(assert (=> b!219356 (= e!142690 (not (= lt!111802 lt!111799)))))

(assert (= (and d!58707 res!107514) b!219356))

(declare-fun m!245013 () Bool)

(assert (=> d!58707 m!245013))

(assert (=> d!58707 m!244757))

(assert (=> d!58707 m!244763))

(declare-fun m!245015 () Bool)

(assert (=> d!58707 m!245015))

(assert (=> d!58707 m!244763))

(assert (=> d!58707 m!244765))

(assert (=> b!219101 d!58707))

(declare-fun d!58709 () Bool)

(assert (=> d!58709 (= (apply!202 (+!597 lt!111797 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504))) lt!111793) (get!2675 (getValueByKey!260 (toList!1639 (+!597 lt!111797 (tuple2!4335 lt!111808 (minValue!3976 thiss!1504)))) lt!111793)))))

(declare-fun bs!8445 () Bool)

(assert (= bs!8445 d!58709))

(declare-fun m!245017 () Bool)

(assert (=> bs!8445 m!245017))

(assert (=> bs!8445 m!245017))

(declare-fun m!245019 () Bool)

(assert (=> bs!8445 m!245019))

(assert (=> b!219101 d!58709))

(declare-fun d!58711 () Bool)

(assert (=> d!58711 (= (apply!202 (+!597 lt!111794 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504))) lt!111789) (get!2675 (getValueByKey!260 (toList!1639 (+!597 lt!111794 (tuple2!4335 lt!111810 (minValue!3976 thiss!1504)))) lt!111789)))))

(declare-fun bs!8446 () Bool)

(assert (= bs!8446 d!58711))

(declare-fun m!245021 () Bool)

(assert (=> bs!8446 m!245021))

(assert (=> bs!8446 m!245021))

(declare-fun m!245023 () Bool)

(assert (=> bs!8446 m!245023))

(assert (=> b!219101 d!58711))

(assert (=> b!219101 d!58659))

(assert (=> b!219118 d!58645))

(declare-fun bm!20502 () Bool)

(declare-fun call!20505 () (_ BitVec 32))

(assert (=> bm!20502 (= call!20505 (arrayCountValidKeys!0 (_keys!6185 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5425 (_keys!6185 thiss!1504))))))

(declare-fun b!219365 () Bool)

(declare-fun e!142695 () (_ BitVec 32))

(assert (=> b!219365 (= e!142695 call!20505)))

(declare-fun b!219366 () Bool)

(declare-fun e!142696 () (_ BitVec 32))

(assert (=> b!219366 (= e!142696 e!142695)))

(declare-fun c!36526 () Bool)

(assert (=> b!219366 (= c!36526 (validKeyInArray!0 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219367 () Bool)

(assert (=> b!219367 (= e!142695 (bvadd #b00000000000000000000000000000001 call!20505))))

(declare-fun d!58713 () Bool)

(declare-fun lt!111928 () (_ BitVec 32))

(assert (=> d!58713 (and (bvsge lt!111928 #b00000000000000000000000000000000) (bvsle lt!111928 (bvsub (size!5425 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58713 (= lt!111928 e!142696)))

(declare-fun c!36527 () Bool)

(assert (=> d!58713 (= c!36527 (bvsge #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(assert (=> d!58713 (and (bvsle #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5425 (_keys!6185 thiss!1504)) (size!5425 (_keys!6185 thiss!1504))))))

(assert (=> d!58713 (= (arrayCountValidKeys!0 (_keys!6185 thiss!1504) #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))) lt!111928)))

(declare-fun b!219368 () Bool)

(assert (=> b!219368 (= e!142696 #b00000000000000000000000000000000)))

(assert (= (and d!58713 c!36527) b!219368))

(assert (= (and d!58713 (not c!36527)) b!219366))

(assert (= (and b!219366 c!36526) b!219367))

(assert (= (and b!219366 (not c!36526)) b!219365))

(assert (= (or b!219367 b!219365) bm!20502))

(declare-fun m!245025 () Bool)

(assert (=> bm!20502 m!245025))

(assert (=> b!219366 m!244733))

(assert (=> b!219366 m!244733))

(assert (=> b!219366 m!244745))

(assert (=> b!219129 d!58713))

(declare-fun d!58715 () Bool)

(assert (=> d!58715 (= (inRange!0 (index!5351 lt!111815) (mask!9918 thiss!1504)) (and (bvsge (index!5351 lt!111815) #b00000000000000000000000000000000) (bvslt (index!5351 lt!111815) (bvadd (mask!9918 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!219136 d!58715))

(declare-fun b!219377 () Bool)

(declare-fun res!107524 () Bool)

(declare-fun e!142699 () Bool)

(assert (=> b!219377 (=> (not res!107524) (not e!142699))))

(assert (=> b!219377 (= res!107524 (and (= (size!5424 (_values!4118 thiss!1504)) (bvadd (mask!9918 thiss!1504) #b00000000000000000000000000000001)) (= (size!5425 (_keys!6185 thiss!1504)) (size!5424 (_values!4118 thiss!1504))) (bvsge (_size!1531 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1531 thiss!1504) (bvadd (mask!9918 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!219379 () Bool)

(declare-fun res!107526 () Bool)

(assert (=> b!219379 (=> (not res!107526) (not e!142699))))

(declare-fun size!5428 (LongMapFixedSize!2964) (_ BitVec 32))

(assert (=> b!219379 (= res!107526 (= (size!5428 thiss!1504) (bvadd (_size!1531 thiss!1504) (bvsdiv (bvadd (extraKeys!3872 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!219380 () Bool)

(assert (=> b!219380 (= e!142699 (and (bvsge (extraKeys!3872 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3872 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1531 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!219378 () Bool)

(declare-fun res!107523 () Bool)

(assert (=> b!219378 (=> (not res!107523) (not e!142699))))

(assert (=> b!219378 (= res!107523 (bvsge (size!5428 thiss!1504) (_size!1531 thiss!1504)))))

(declare-fun d!58717 () Bool)

(declare-fun res!107525 () Bool)

(assert (=> d!58717 (=> (not res!107525) (not e!142699))))

(assert (=> d!58717 (= res!107525 (validMask!0 (mask!9918 thiss!1504)))))

(assert (=> d!58717 (= (simpleValid!225 thiss!1504) e!142699)))

(assert (= (and d!58717 res!107525) b!219377))

(assert (= (and b!219377 res!107524) b!219378))

(assert (= (and b!219378 res!107523) b!219379))

(assert (= (and b!219379 res!107526) b!219380))

(declare-fun m!245027 () Bool)

(assert (=> b!219379 m!245027))

(assert (=> b!219378 m!245027))

(assert (=> d!58717 m!244743))

(assert (=> d!58629 d!58717))

(declare-fun d!58719 () Bool)

(assert (=> d!58719 (= (apply!202 lt!111806 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2675 (getValueByKey!260 (toList!1639 lt!111806) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8447 () Bool)

(assert (= bs!8447 d!58719))

(declare-fun m!245029 () Bool)

(assert (=> bs!8447 m!245029))

(assert (=> bs!8447 m!245029))

(declare-fun m!245031 () Bool)

(assert (=> bs!8447 m!245031))

(assert (=> b!219116 d!58719))

(declare-fun d!58721 () Bool)

(declare-fun res!107531 () Bool)

(declare-fun e!142708 () Bool)

(assert (=> d!58721 (=> res!107531 e!142708)))

(assert (=> d!58721 (= res!107531 (bvsge #b00000000000000000000000000000000 (size!5425 (_keys!6185 thiss!1504))))))

(assert (=> d!58721 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)) e!142708)))

(declare-fun b!219389 () Bool)

(declare-fun e!142706 () Bool)

(declare-fun call!20508 () Bool)

(assert (=> b!219389 (= e!142706 call!20508)))

(declare-fun b!219390 () Bool)

(declare-fun e!142707 () Bool)

(assert (=> b!219390 (= e!142707 call!20508)))

(declare-fun bm!20505 () Bool)

(assert (=> bm!20505 (= call!20508 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(declare-fun b!219391 () Bool)

(assert (=> b!219391 (= e!142706 e!142707)))

(declare-fun lt!111935 () (_ BitVec 64))

(assert (=> b!219391 (= lt!111935 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111937 () Unit!6529)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10745 (_ BitVec 64) (_ BitVec 32)) Unit!6529)

(assert (=> b!219391 (= lt!111937 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6185 thiss!1504) lt!111935 #b00000000000000000000000000000000))))

(assert (=> b!219391 (arrayContainsKey!0 (_keys!6185 thiss!1504) lt!111935 #b00000000000000000000000000000000)))

(declare-fun lt!111936 () Unit!6529)

(assert (=> b!219391 (= lt!111936 lt!111937)))

(declare-fun res!107532 () Bool)

(assert (=> b!219391 (= res!107532 (= (seekEntryOrOpen!0 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000) (_keys!6185 thiss!1504) (mask!9918 thiss!1504)) (Found!795 #b00000000000000000000000000000000)))))

(assert (=> b!219391 (=> (not res!107532) (not e!142707))))

(declare-fun b!219392 () Bool)

(assert (=> b!219392 (= e!142708 e!142706)))

(declare-fun c!36530 () Bool)

(assert (=> b!219392 (= c!36530 (validKeyInArray!0 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58721 (not res!107531)) b!219392))

(assert (= (and b!219392 c!36530) b!219391))

(assert (= (and b!219392 (not c!36530)) b!219389))

(assert (= (and b!219391 res!107532) b!219390))

(assert (= (or b!219390 b!219389) bm!20505))

(declare-fun m!245033 () Bool)

(assert (=> bm!20505 m!245033))

(assert (=> b!219391 m!244733))

(declare-fun m!245035 () Bool)

(assert (=> b!219391 m!245035))

(declare-fun m!245037 () Bool)

(assert (=> b!219391 m!245037))

(assert (=> b!219391 m!244733))

(declare-fun m!245039 () Bool)

(assert (=> b!219391 m!245039))

(assert (=> b!219392 m!244733))

(assert (=> b!219392 m!244733))

(assert (=> b!219392 m!244745))

(assert (=> b!219130 d!58721))

(declare-fun d!58723 () Bool)

(assert (=> d!58723 (= (apply!202 lt!111806 (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000)) (get!2675 (getValueByKey!260 (toList!1639 lt!111806) (select (arr!5093 (_keys!6185 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8448 () Bool)

(assert (= bs!8448 d!58723))

(assert (=> bs!8448 m!244733))

(assert (=> bs!8448 m!244897))

(assert (=> bs!8448 m!244897))

(declare-fun m!245041 () Bool)

(assert (=> bs!8448 m!245041))

(assert (=> b!219112 d!58723))

(declare-fun d!58725 () Bool)

(declare-fun c!36533 () Bool)

(assert (=> d!58725 (= c!36533 ((_ is ValueCellFull!2532) (select (arr!5092 (_values!4118 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!142711 () V!7315)

(assert (=> d!58725 (= (get!2674 (select (arr!5092 (_values!4118 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4135 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!142711)))

(declare-fun b!219397 () Bool)

(declare-fun get!2676 (ValueCell!2532 V!7315) V!7315)

(assert (=> b!219397 (= e!142711 (get!2676 (select (arr!5092 (_values!4118 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4135 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!219398 () Bool)

(declare-fun get!2677 (ValueCell!2532 V!7315) V!7315)

(assert (=> b!219398 (= e!142711 (get!2677 (select (arr!5092 (_values!4118 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4135 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58725 c!36533) b!219397))

(assert (= (and d!58725 (not c!36533)) b!219398))

(assert (=> b!219397 m!244737))

(assert (=> b!219397 m!244731))

(declare-fun m!245043 () Bool)

(assert (=> b!219397 m!245043))

(assert (=> b!219398 m!244737))

(assert (=> b!219398 m!244731))

(declare-fun m!245045 () Bool)

(assert (=> b!219398 m!245045))

(assert (=> b!219112 d!58725))

(assert (=> d!58627 d!58651))

(declare-fun d!58727 () Bool)

(declare-fun e!142712 () Bool)

(assert (=> d!58727 e!142712))

(declare-fun res!107533 () Bool)

(assert (=> d!58727 (=> res!107533 e!142712)))

(declare-fun lt!111941 () Bool)

(assert (=> d!58727 (= res!107533 (not lt!111941))))

(declare-fun lt!111939 () Bool)

(assert (=> d!58727 (= lt!111941 lt!111939)))

(declare-fun lt!111940 () Unit!6529)

(declare-fun e!142713 () Unit!6529)

(assert (=> d!58727 (= lt!111940 e!142713)))

(declare-fun c!36534 () Bool)

(assert (=> d!58727 (= c!36534 lt!111939)))

(assert (=> d!58727 (= lt!111939 (containsKey!252 (toList!1639 lt!111806) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58727 (= (contains!1480 lt!111806 #b0000000000000000000000000000000000000000000000000000000000000000) lt!111941)))

(declare-fun b!219399 () Bool)

(declare-fun lt!111938 () Unit!6529)

(assert (=> b!219399 (= e!142713 lt!111938)))

(assert (=> b!219399 (= lt!111938 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1639 lt!111806) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219399 (isDefined!201 (getValueByKey!260 (toList!1639 lt!111806) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219400 () Bool)

(declare-fun Unit!6540 () Unit!6529)

(assert (=> b!219400 (= e!142713 Unit!6540)))

(declare-fun b!219401 () Bool)

(assert (=> b!219401 (= e!142712 (isDefined!201 (getValueByKey!260 (toList!1639 lt!111806) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58727 c!36534) b!219399))

(assert (= (and d!58727 (not c!36534)) b!219400))

(assert (= (and d!58727 (not res!107533)) b!219401))

(declare-fun m!245047 () Bool)

(assert (=> d!58727 m!245047))

(declare-fun m!245049 () Bool)

(assert (=> b!219399 m!245049))

(assert (=> b!219399 m!245029))

(assert (=> b!219399 m!245029))

(declare-fun m!245051 () Bool)

(assert (=> b!219399 m!245051))

(assert (=> b!219401 m!245029))

(assert (=> b!219401 m!245029))

(assert (=> b!219401 m!245051))

(assert (=> bm!20480 d!58727))

(declare-fun b!219414 () Bool)

(declare-fun e!142720 () SeekEntryResult!795)

(assert (=> b!219414 (= e!142720 (Found!795 (index!5352 lt!111829)))))

(declare-fun d!58729 () Bool)

(declare-fun lt!111947 () SeekEntryResult!795)

(assert (=> d!58729 (and (or ((_ is Undefined!795) lt!111947) (not ((_ is Found!795) lt!111947)) (and (bvsge (index!5351 lt!111947) #b00000000000000000000000000000000) (bvslt (index!5351 lt!111947) (size!5425 (_keys!6185 thiss!1504))))) (or ((_ is Undefined!795) lt!111947) ((_ is Found!795) lt!111947) (not ((_ is MissingVacant!795) lt!111947)) (not (= (index!5353 lt!111947) (index!5352 lt!111829))) (and (bvsge (index!5353 lt!111947) #b00000000000000000000000000000000) (bvslt (index!5353 lt!111947) (size!5425 (_keys!6185 thiss!1504))))) (or ((_ is Undefined!795) lt!111947) (ite ((_ is Found!795) lt!111947) (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5351 lt!111947)) key!932) (and ((_ is MissingVacant!795) lt!111947) (= (index!5353 lt!111947) (index!5352 lt!111829)) (= (select (arr!5093 (_keys!6185 thiss!1504)) (index!5353 lt!111947)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!142721 () SeekEntryResult!795)

(assert (=> d!58729 (= lt!111947 e!142721)))

(declare-fun c!36542 () Bool)

(assert (=> d!58729 (= c!36542 (bvsge (x!22877 lt!111829) #b01111111111111111111111111111110))))

(declare-fun lt!111946 () (_ BitVec 64))

(assert (=> d!58729 (= lt!111946 (select (arr!5093 (_keys!6185 thiss!1504)) (index!5352 lt!111829)))))

(assert (=> d!58729 (validMask!0 (mask!9918 thiss!1504))))

(assert (=> d!58729 (= (seekKeyOrZeroReturnVacant!0 (x!22877 lt!111829) (index!5352 lt!111829) (index!5352 lt!111829) key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)) lt!111947)))

(declare-fun b!219415 () Bool)

(declare-fun e!142722 () SeekEntryResult!795)

(assert (=> b!219415 (= e!142722 (MissingVacant!795 (index!5352 lt!111829)))))

(declare-fun b!219416 () Bool)

(declare-fun c!36543 () Bool)

(assert (=> b!219416 (= c!36543 (= lt!111946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219416 (= e!142720 e!142722)))

(declare-fun b!219417 () Bool)

(assert (=> b!219417 (= e!142722 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22877 lt!111829) #b00000000000000000000000000000001) (nextIndex!0 (index!5352 lt!111829) (x!22877 lt!111829) (mask!9918 thiss!1504)) (index!5352 lt!111829) key!932 (_keys!6185 thiss!1504) (mask!9918 thiss!1504)))))

(declare-fun b!219418 () Bool)

(assert (=> b!219418 (= e!142721 Undefined!795)))

(declare-fun b!219419 () Bool)

(assert (=> b!219419 (= e!142721 e!142720)))

(declare-fun c!36541 () Bool)

(assert (=> b!219419 (= c!36541 (= lt!111946 key!932))))

(assert (= (and d!58729 c!36542) b!219418))

(assert (= (and d!58729 (not c!36542)) b!219419))

(assert (= (and b!219419 c!36541) b!219414))

(assert (= (and b!219419 (not c!36541)) b!219416))

(assert (= (and b!219416 c!36543) b!219415))

(assert (= (and b!219416 (not c!36543)) b!219417))

(declare-fun m!245053 () Bool)

(assert (=> d!58729 m!245053))

(declare-fun m!245055 () Bool)

(assert (=> d!58729 m!245055))

(assert (=> d!58729 m!244815))

(assert (=> d!58729 m!244743))

(declare-fun m!245057 () Bool)

(assert (=> b!219417 m!245057))

(assert (=> b!219417 m!245057))

(declare-fun m!245059 () Bool)

(assert (=> b!219417 m!245059))

(assert (=> b!219181 d!58729))

(declare-fun mapNonEmpty!9799 () Bool)

(declare-fun mapRes!9799 () Bool)

(declare-fun tp!20815 () Bool)

(declare-fun e!142723 () Bool)

(assert (=> mapNonEmpty!9799 (= mapRes!9799 (and tp!20815 e!142723))))

(declare-fun mapRest!9799 () (Array (_ BitVec 32) ValueCell!2532))

(declare-fun mapKey!9799 () (_ BitVec 32))

(declare-fun mapValue!9799 () ValueCell!2532)

(assert (=> mapNonEmpty!9799 (= mapRest!9798 (store mapRest!9799 mapKey!9799 mapValue!9799))))

(declare-fun b!219421 () Bool)

(declare-fun e!142724 () Bool)

(assert (=> b!219421 (= e!142724 tp_is_empty!5751)))

(declare-fun mapIsEmpty!9799 () Bool)

(assert (=> mapIsEmpty!9799 mapRes!9799))

(declare-fun condMapEmpty!9799 () Bool)

(declare-fun mapDefault!9799 () ValueCell!2532)

(assert (=> mapNonEmpty!9798 (= condMapEmpty!9799 (= mapRest!9798 ((as const (Array (_ BitVec 32) ValueCell!2532)) mapDefault!9799)))))

(assert (=> mapNonEmpty!9798 (= tp!20814 (and e!142724 mapRes!9799))))

(declare-fun b!219420 () Bool)

(assert (=> b!219420 (= e!142723 tp_is_empty!5751)))

(assert (= (and mapNonEmpty!9798 condMapEmpty!9799) mapIsEmpty!9799))

(assert (= (and mapNonEmpty!9798 (not condMapEmpty!9799)) mapNonEmpty!9799))

(assert (= (and mapNonEmpty!9799 ((_ is ValueCellFull!2532) mapValue!9799)) b!219420))

(assert (= (and mapNonEmpty!9798 ((_ is ValueCellFull!2532) mapDefault!9799)) b!219421))

(declare-fun m!245061 () Bool)

(assert (=> mapNonEmpty!9799 m!245061))

(declare-fun b_lambda!7839 () Bool)

(assert (= b_lambda!7835 (or (and b!218991 b_free!5889) b_lambda!7839)))

(declare-fun b_lambda!7841 () Bool)

(assert (= b_lambda!7837 (or (and b!218991 b_free!5889) b_lambda!7841)))

(check-sat (not d!58697) (not b_lambda!7841) (not d!58723) (not d!58719) (not b!219321) (not b!219307) (not b!219320) (not d!58673) (not b!219351) (not d!58681) (not b!219344) (not b!219397) b_and!12789 (not bm!20492) (not d!58703) (not b!219263) (not b!219337) (not d!58711) (not d!58727) (not d!58717) (not b_lambda!7839) (not b!219347) (not b!219333) (not b!219417) (not b!219336) (not d!58695) (not b!219267) (not b!219379) (not b!219199) (not b!219353) (not d!58689) (not b!219309) (not b!219366) (not b!219265) (not d!58671) (not b!219230) (not b!219312) (not b!219391) (not b!219258) (not b!219315) (not b!219345) (not d!58657) (not d!58685) (not b!219354) (not d!58709) (not d!58705) (not d!58707) (not bm!20493) (not bm!20505) (not d!58677) (not d!58675) (not d!58649) (not b!219392) (not d!58729) (not b!219292) (not b!219262) (not b!219313) (not b!219338) (not b_lambda!7833) (not d!58661) (not b!219398) (not b!219349) (not b!219378) (not d!58699) (not bm!20496) (not b!219350) (not b!219343) (not d!58701) (not b!219346) (not d!58665) (not d!58687) (not bm!20499) (not b!219334) (not d!58683) (not bm!20502) (not b!219401) (not b_next!5889) (not b!219225) (not d!58669) (not d!58659) (not b!219266) (not b!219259) (not mapNonEmpty!9799) (not b!219399) (not d!58693) (not b!219257) (not b!219305) (not d!58691) tp_is_empty!5751)
(check-sat b_and!12789 (not b_next!5889))
