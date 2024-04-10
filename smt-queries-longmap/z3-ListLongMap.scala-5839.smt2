; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75410 () Bool)

(assert start!75410)

(declare-fun b!887859 () Bool)

(declare-fun b_free!15537 () Bool)

(declare-fun b_next!15537 () Bool)

(assert (=> b!887859 (= b_free!15537 (not b_next!15537))))

(declare-fun tp!54554 () Bool)

(declare-fun b_and!25773 () Bool)

(assert (=> b!887859 (= tp!54554 b_and!25773)))

(declare-fun b!887853 () Bool)

(declare-fun e!494572 () Bool)

(declare-datatypes ((V!28785 0))(
  ( (V!28786 (val!8983 Int)) )
))
(declare-datatypes ((array!51696 0))(
  ( (array!51697 (arr!24861 (Array (_ BitVec 32) (_ BitVec 64))) (size!25301 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8451 0))(
  ( (ValueCellFull!8451 (v!11452 V!28785)) (EmptyCell!8451) )
))
(declare-datatypes ((array!51698 0))(
  ( (array!51699 (arr!24862 (Array (_ BitVec 32) ValueCell!8451)) (size!25302 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3918 0))(
  ( (LongMapFixedSize!3919 (defaultEntry!5150 Int) (mask!25556 (_ BitVec 32)) (extraKeys!4844 (_ BitVec 32)) (zeroValue!4948 V!28785) (minValue!4948 V!28785) (_size!2014 (_ BitVec 32)) (_keys!9827 array!51696) (_values!5135 array!51698) (_vacant!2014 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1078 0))(
  ( (Cell!1079 (v!11453 LongMapFixedSize!3918)) )
))
(declare-datatypes ((LongMap!1078 0))(
  ( (LongMap!1079 (underlying!550 Cell!1078)) )
))
(declare-fun thiss!821 () LongMap!1078)

(declare-fun key!666 () (_ BitVec 64))

(declare-fun contains!4314 (LongMapFixedSize!3918 (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!11928 0))(
  ( (tuple2!11929 (_1!5975 (_ BitVec 64)) (_2!5975 V!28785)) )
))
(declare-datatypes ((List!17686 0))(
  ( (Nil!17683) (Cons!17682 (h!18813 tuple2!11928) (t!24981 List!17686)) )
))
(declare-datatypes ((ListLongMap!10625 0))(
  ( (ListLongMap!10626 (toList!5328 List!17686)) )
))
(declare-fun contains!4315 (ListLongMap!10625 (_ BitVec 64)) Bool)

(declare-fun map!12098 (LongMap!1078) ListLongMap!10625)

(assert (=> b!887853 (= e!494572 (not (= (contains!4314 (v!11453 (underlying!550 thiss!821)) key!666) (contains!4315 (map!12098 thiss!821) key!666))))))

(declare-fun res!602216 () Bool)

(assert (=> start!75410 (=> (not res!602216) (not e!494572))))

(declare-fun valid!1527 (LongMap!1078) Bool)

(assert (=> start!75410 (= res!602216 (valid!1527 thiss!821))))

(assert (=> start!75410 e!494572))

(declare-fun e!494579 () Bool)

(assert (=> start!75410 e!494579))

(assert (=> start!75410 true))

(declare-fun b!887854 () Bool)

(declare-fun e!494577 () Bool)

(declare-fun e!494575 () Bool)

(assert (=> b!887854 (= e!494577 e!494575)))

(declare-fun b!887855 () Bool)

(declare-fun e!494574 () Bool)

(declare-fun tp_is_empty!17865 () Bool)

(assert (=> b!887855 (= e!494574 tp_is_empty!17865)))

(declare-fun b!887856 () Bool)

(declare-fun e!494578 () Bool)

(declare-fun mapRes!28327 () Bool)

(assert (=> b!887856 (= e!494578 (and e!494574 mapRes!28327))))

(declare-fun condMapEmpty!28327 () Bool)

(declare-fun mapDefault!28327 () ValueCell!8451)

(assert (=> b!887856 (= condMapEmpty!28327 (= (arr!24862 (_values!5135 (v!11453 (underlying!550 thiss!821)))) ((as const (Array (_ BitVec 32) ValueCell!8451)) mapDefault!28327)))))

(declare-fun b!887857 () Bool)

(assert (=> b!887857 (= e!494579 e!494577)))

(declare-fun b!887858 () Bool)

(declare-fun e!494573 () Bool)

(assert (=> b!887858 (= e!494573 tp_is_empty!17865)))

(declare-fun array_inv!19566 (array!51696) Bool)

(declare-fun array_inv!19567 (array!51698) Bool)

(assert (=> b!887859 (= e!494575 (and tp!54554 tp_is_empty!17865 (array_inv!19566 (_keys!9827 (v!11453 (underlying!550 thiss!821)))) (array_inv!19567 (_values!5135 (v!11453 (underlying!550 thiss!821)))) e!494578))))

(declare-fun mapNonEmpty!28327 () Bool)

(declare-fun tp!54555 () Bool)

(assert (=> mapNonEmpty!28327 (= mapRes!28327 (and tp!54555 e!494573))))

(declare-fun mapKey!28327 () (_ BitVec 32))

(declare-fun mapRest!28327 () (Array (_ BitVec 32) ValueCell!8451))

(declare-fun mapValue!28327 () ValueCell!8451)

(assert (=> mapNonEmpty!28327 (= (arr!24862 (_values!5135 (v!11453 (underlying!550 thiss!821)))) (store mapRest!28327 mapKey!28327 mapValue!28327))))

(declare-fun mapIsEmpty!28327 () Bool)

(assert (=> mapIsEmpty!28327 mapRes!28327))

(assert (= (and start!75410 res!602216) b!887853))

(assert (= (and b!887856 condMapEmpty!28327) mapIsEmpty!28327))

(assert (= (and b!887856 (not condMapEmpty!28327)) mapNonEmpty!28327))

(get-info :version)

(assert (= (and mapNonEmpty!28327 ((_ is ValueCellFull!8451) mapValue!28327)) b!887858))

(assert (= (and b!887856 ((_ is ValueCellFull!8451) mapDefault!28327)) b!887855))

(assert (= b!887859 b!887856))

(assert (= b!887854 b!887859))

(assert (= b!887857 b!887854))

(assert (= start!75410 b!887857))

(declare-fun m!827333 () Bool)

(assert (=> b!887853 m!827333))

(declare-fun m!827335 () Bool)

(assert (=> b!887853 m!827335))

(assert (=> b!887853 m!827335))

(declare-fun m!827337 () Bool)

(assert (=> b!887853 m!827337))

(declare-fun m!827339 () Bool)

(assert (=> start!75410 m!827339))

(declare-fun m!827341 () Bool)

(assert (=> b!887859 m!827341))

(declare-fun m!827343 () Bool)

(assert (=> b!887859 m!827343))

(declare-fun m!827345 () Bool)

(assert (=> mapNonEmpty!28327 m!827345))

(check-sat tp_is_empty!17865 (not mapNonEmpty!28327) (not b_next!15537) b_and!25773 (not b!887853) (not b!887859) (not start!75410))
(check-sat b_and!25773 (not b_next!15537))
(get-model)

(declare-fun d!109973 () Bool)

(declare-fun valid!1529 (LongMapFixedSize!3918) Bool)

(assert (=> d!109973 (= (valid!1527 thiss!821) (valid!1529 (v!11453 (underlying!550 thiss!821))))))

(declare-fun bs!24894 () Bool)

(assert (= bs!24894 d!109973))

(declare-fun m!827361 () Bool)

(assert (=> bs!24894 m!827361))

(assert (=> start!75410 d!109973))

(declare-fun d!109975 () Bool)

(assert (=> d!109975 (= (array_inv!19566 (_keys!9827 (v!11453 (underlying!550 thiss!821)))) (bvsge (size!25301 (_keys!9827 (v!11453 (underlying!550 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!887859 d!109975))

(declare-fun d!109977 () Bool)

(assert (=> d!109977 (= (array_inv!19567 (_values!5135 (v!11453 (underlying!550 thiss!821)))) (bvsge (size!25302 (_values!5135 (v!11453 (underlying!550 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!887859 d!109977))

(declare-fun b!887901 () Bool)

(declare-fun e!494614 () Bool)

(assert (=> b!887901 (= e!494614 true)))

(declare-datatypes ((SeekEntryResult!8765 0))(
  ( (MissingZero!8765 (index!37431 (_ BitVec 32))) (Found!8765 (index!37432 (_ BitVec 32))) (Intermediate!8765 (undefined!9577 Bool) (index!37433 (_ BitVec 32)) (x!75313 (_ BitVec 32))) (Undefined!8765) (MissingVacant!8765 (index!37434 (_ BitVec 32))) )
))
(declare-fun lt!401504 () SeekEntryResult!8765)

(declare-datatypes ((Unit!30255 0))(
  ( (Unit!30256) )
))
(declare-fun lt!401499 () Unit!30255)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51696 (_ BitVec 64) (_ BitVec 32)) Unit!30255)

(assert (=> b!887901 (= lt!401499 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9827 (v!11453 (underlying!550 thiss!821))) key!666 (index!37432 lt!401504)))))

(declare-fun call!39403 () Bool)

(assert (=> b!887901 call!39403))

(declare-fun lt!401507 () Unit!30255)

(assert (=> b!887901 (= lt!401507 lt!401499)))

(declare-fun lt!401500 () Unit!30255)

(declare-fun lemmaValidKeyInArrayIsInListMap!203 (array!51696 array!51698 (_ BitVec 32) (_ BitVec 32) V!28785 V!28785 (_ BitVec 32) Int) Unit!30255)

(assert (=> b!887901 (= lt!401500 (lemmaValidKeyInArrayIsInListMap!203 (_keys!9827 (v!11453 (underlying!550 thiss!821))) (_values!5135 (v!11453 (underlying!550 thiss!821))) (mask!25556 (v!11453 (underlying!550 thiss!821))) (extraKeys!4844 (v!11453 (underlying!550 thiss!821))) (zeroValue!4948 (v!11453 (underlying!550 thiss!821))) (minValue!4948 (v!11453 (underlying!550 thiss!821))) (index!37432 lt!401504) (defaultEntry!5150 (v!11453 (underlying!550 thiss!821)))))))

(declare-fun call!39402 () Bool)

(assert (=> b!887901 call!39402))

(declare-fun lt!401495 () Unit!30255)

(assert (=> b!887901 (= lt!401495 lt!401500)))

(declare-fun b!887902 () Bool)

(assert (=> b!887902 false))

(declare-fun lt!401494 () Unit!30255)

(declare-fun lt!401502 () Unit!30255)

(assert (=> b!887902 (= lt!401494 lt!401502)))

(declare-fun lt!401506 () SeekEntryResult!8765)

(declare-fun lt!401503 () (_ BitVec 32))

(assert (=> b!887902 (and ((_ is Found!8765) lt!401506) (= (index!37432 lt!401506) lt!401503))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51696 (_ BitVec 32)) SeekEntryResult!8765)

(assert (=> b!887902 (= lt!401506 (seekEntry!0 key!666 (_keys!9827 (v!11453 (underlying!550 thiss!821))) (mask!25556 (v!11453 (underlying!550 thiss!821)))))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51696 (_ BitVec 32)) Unit!30255)

(assert (=> b!887902 (= lt!401502 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!666 lt!401503 (_keys!9827 (v!11453 (underlying!550 thiss!821))) (mask!25556 (v!11453 (underlying!550 thiss!821)))))))

(declare-fun lt!401501 () Unit!30255)

(declare-fun lt!401498 () Unit!30255)

(assert (=> b!887902 (= lt!401501 lt!401498)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51696 (_ BitVec 32)) Bool)

(assert (=> b!887902 (arrayForallSeekEntryOrOpenFound!0 lt!401503 (_keys!9827 (v!11453 (underlying!550 thiss!821))) (mask!25556 (v!11453 (underlying!550 thiss!821))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30255)

(assert (=> b!887902 (= lt!401498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9827 (v!11453 (underlying!550 thiss!821))) (mask!25556 (v!11453 (underlying!550 thiss!821))) #b00000000000000000000000000000000 lt!401503))))

(declare-fun arrayScanForKey!0 (array!51696 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887902 (= lt!401503 (arrayScanForKey!0 (_keys!9827 (v!11453 (underlying!550 thiss!821))) key!666 #b00000000000000000000000000000000))))

(declare-fun lt!401493 () Unit!30255)

(declare-fun lt!401496 () Unit!30255)

(assert (=> b!887902 (= lt!401493 lt!401496)))

(declare-fun e!494616 () Bool)

(assert (=> b!887902 e!494616))

(declare-fun c!93748 () Bool)

(assert (=> b!887902 (= c!93748 (and (not (= key!666 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!666 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!156 (array!51696 array!51698 (_ BitVec 32) (_ BitVec 32) V!28785 V!28785 (_ BitVec 64) Int) Unit!30255)

(assert (=> b!887902 (= lt!401496 (lemmaKeyInListMapIsInArray!156 (_keys!9827 (v!11453 (underlying!550 thiss!821))) (_values!5135 (v!11453 (underlying!550 thiss!821))) (mask!25556 (v!11453 (underlying!550 thiss!821))) (extraKeys!4844 (v!11453 (underlying!550 thiss!821))) (zeroValue!4948 (v!11453 (underlying!550 thiss!821))) (minValue!4948 (v!11453 (underlying!550 thiss!821))) key!666 (defaultEntry!5150 (v!11453 (underlying!550 thiss!821)))))))

(declare-fun e!494617 () Unit!30255)

(declare-fun Unit!30257 () Unit!30255)

(assert (=> b!887902 (= e!494617 Unit!30257)))

(declare-fun b!887904 () Bool)

(assert (=> b!887904 (= e!494616 call!39403)))

(declare-fun b!887905 () Bool)

(declare-fun c!93749 () Bool)

(assert (=> b!887905 (= c!93749 ((_ is Found!8765) lt!401504))))

(assert (=> b!887905 (= lt!401504 (seekEntry!0 key!666 (_keys!9827 (v!11453 (underlying!550 thiss!821))) (mask!25556 (v!11453 (underlying!550 thiss!821)))))))

(declare-fun e!494615 () Bool)

(assert (=> b!887905 (= e!494615 e!494614)))

(declare-fun bm!39398 () Bool)

(declare-fun call!39401 () ListLongMap!10625)

(assert (=> bm!39398 (= call!39402 (contains!4315 call!39401 (ite c!93749 (select (arr!24861 (_keys!9827 (v!11453 (underlying!550 thiss!821)))) (index!37432 lt!401504)) key!666)))))

(declare-fun bm!39399 () Bool)

(declare-fun arrayContainsKey!0 (array!51696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39399 (= call!39403 (arrayContainsKey!0 (_keys!9827 (v!11453 (underlying!550 thiss!821))) key!666 #b00000000000000000000000000000000))))

(declare-fun b!887906 () Bool)

(assert (=> b!887906 (= e!494615 (not (= (bvand (extraKeys!4844 (v!11453 (underlying!550 thiss!821))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!887907 () Bool)

(assert (=> b!887907 (= e!494614 false)))

(declare-fun c!93750 () Bool)

(assert (=> b!887907 (= c!93750 call!39402)))

(declare-fun lt!401497 () Unit!30255)

(assert (=> b!887907 (= lt!401497 e!494617)))

(declare-fun b!887903 () Bool)

(declare-fun e!494618 () Bool)

(assert (=> b!887903 (= e!494618 e!494615)))

(declare-fun c!93747 () Bool)

(assert (=> b!887903 (= c!93747 (= key!666 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!109979 () Bool)

(declare-fun lt!401505 () Bool)

(declare-fun map!12099 (LongMapFixedSize!3918) ListLongMap!10625)

(assert (=> d!109979 (= lt!401505 (contains!4315 (map!12099 (v!11453 (underlying!550 thiss!821))) key!666))))

(assert (=> d!109979 (= lt!401505 e!494618)))

(declare-fun c!93751 () Bool)

(assert (=> d!109979 (= c!93751 (= key!666 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109979 (valid!1529 (v!11453 (underlying!550 thiss!821)))))

(assert (=> d!109979 (= (contains!4314 (v!11453 (underlying!550 thiss!821)) key!666) lt!401505)))

(declare-fun b!887908 () Bool)

(assert (=> b!887908 (= e!494616 (ite (= key!666 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4844 (v!11453 (underlying!550 thiss!821))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4844 (v!11453 (underlying!550 thiss!821))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!39400 () Bool)

(declare-fun getCurrentListMap!2614 (array!51696 array!51698 (_ BitVec 32) (_ BitVec 32) V!28785 V!28785 (_ BitVec 32) Int) ListLongMap!10625)

(assert (=> bm!39400 (= call!39401 (getCurrentListMap!2614 (_keys!9827 (v!11453 (underlying!550 thiss!821))) (_values!5135 (v!11453 (underlying!550 thiss!821))) (mask!25556 (v!11453 (underlying!550 thiss!821))) (extraKeys!4844 (v!11453 (underlying!550 thiss!821))) (zeroValue!4948 (v!11453 (underlying!550 thiss!821))) (minValue!4948 (v!11453 (underlying!550 thiss!821))) #b00000000000000000000000000000000 (defaultEntry!5150 (v!11453 (underlying!550 thiss!821)))))))

(declare-fun b!887909 () Bool)

(declare-fun Unit!30258 () Unit!30255)

(assert (=> b!887909 (= e!494617 Unit!30258)))

(declare-fun b!887910 () Bool)

(assert (=> b!887910 (= e!494618 (not (= (bvand (extraKeys!4844 (v!11453 (underlying!550 thiss!821))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!109979 c!93751) b!887910))

(assert (= (and d!109979 (not c!93751)) b!887903))

(assert (= (and b!887903 c!93747) b!887906))

(assert (= (and b!887903 (not c!93747)) b!887905))

(assert (= (and b!887905 c!93749) b!887901))

(assert (= (and b!887905 (not c!93749)) b!887907))

(assert (= (and b!887907 c!93750) b!887902))

(assert (= (and b!887907 (not c!93750)) b!887909))

(assert (= (and b!887902 c!93748) b!887904))

(assert (= (and b!887902 (not c!93748)) b!887908))

(assert (= (or b!887901 b!887907) bm!39400))

(assert (= (or b!887901 b!887904) bm!39399))

(assert (= (or b!887901 b!887907) bm!39398))

(declare-fun m!827363 () Bool)

(assert (=> bm!39400 m!827363))

(declare-fun m!827365 () Bool)

(assert (=> bm!39399 m!827365))

(declare-fun m!827367 () Bool)

(assert (=> bm!39398 m!827367))

(declare-fun m!827369 () Bool)

(assert (=> bm!39398 m!827369))

(declare-fun m!827371 () Bool)

(assert (=> d!109979 m!827371))

(assert (=> d!109979 m!827371))

(declare-fun m!827373 () Bool)

(assert (=> d!109979 m!827373))

(assert (=> d!109979 m!827361))

(declare-fun m!827375 () Bool)

(assert (=> b!887902 m!827375))

(declare-fun m!827377 () Bool)

(assert (=> b!887902 m!827377))

(declare-fun m!827379 () Bool)

(assert (=> b!887902 m!827379))

(declare-fun m!827381 () Bool)

(assert (=> b!887902 m!827381))

(declare-fun m!827383 () Bool)

(assert (=> b!887902 m!827383))

(declare-fun m!827385 () Bool)

(assert (=> b!887902 m!827385))

(declare-fun m!827387 () Bool)

(assert (=> b!887901 m!827387))

(declare-fun m!827389 () Bool)

(assert (=> b!887901 m!827389))

(assert (=> b!887905 m!827375))

(assert (=> b!887853 d!109979))

(declare-fun d!109981 () Bool)

(declare-fun e!494623 () Bool)

(assert (=> d!109981 e!494623))

(declare-fun res!602222 () Bool)

(assert (=> d!109981 (=> res!602222 e!494623)))

(declare-fun lt!401518 () Bool)

(assert (=> d!109981 (= res!602222 (not lt!401518))))

(declare-fun lt!401519 () Bool)

(assert (=> d!109981 (= lt!401518 lt!401519)))

(declare-fun lt!401516 () Unit!30255)

(declare-fun e!494624 () Unit!30255)

(assert (=> d!109981 (= lt!401516 e!494624)))

(declare-fun c!93754 () Bool)

(assert (=> d!109981 (= c!93754 lt!401519)))

(declare-fun containsKey!418 (List!17686 (_ BitVec 64)) Bool)

(assert (=> d!109981 (= lt!401519 (containsKey!418 (toList!5328 (map!12098 thiss!821)) key!666))))

(assert (=> d!109981 (= (contains!4315 (map!12098 thiss!821) key!666) lt!401518)))

(declare-fun b!887917 () Bool)

(declare-fun lt!401517 () Unit!30255)

(assert (=> b!887917 (= e!494624 lt!401517)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!314 (List!17686 (_ BitVec 64)) Unit!30255)

(assert (=> b!887917 (= lt!401517 (lemmaContainsKeyImpliesGetValueByKeyDefined!314 (toList!5328 (map!12098 thiss!821)) key!666))))

(declare-datatypes ((Option!444 0))(
  ( (Some!443 (v!11456 V!28785)) (None!442) )
))
(declare-fun isDefined!317 (Option!444) Bool)

(declare-fun getValueByKey!438 (List!17686 (_ BitVec 64)) Option!444)

(assert (=> b!887917 (isDefined!317 (getValueByKey!438 (toList!5328 (map!12098 thiss!821)) key!666))))

(declare-fun b!887918 () Bool)

(declare-fun Unit!30259 () Unit!30255)

(assert (=> b!887918 (= e!494624 Unit!30259)))

(declare-fun b!887919 () Bool)

(assert (=> b!887919 (= e!494623 (isDefined!317 (getValueByKey!438 (toList!5328 (map!12098 thiss!821)) key!666)))))

(assert (= (and d!109981 c!93754) b!887917))

(assert (= (and d!109981 (not c!93754)) b!887918))

(assert (= (and d!109981 (not res!602222)) b!887919))

(declare-fun m!827391 () Bool)

(assert (=> d!109981 m!827391))

(declare-fun m!827393 () Bool)

(assert (=> b!887917 m!827393))

(declare-fun m!827395 () Bool)

(assert (=> b!887917 m!827395))

(assert (=> b!887917 m!827395))

(declare-fun m!827397 () Bool)

(assert (=> b!887917 m!827397))

(assert (=> b!887919 m!827395))

(assert (=> b!887919 m!827395))

(assert (=> b!887919 m!827397))

(assert (=> b!887853 d!109981))

(declare-fun d!109983 () Bool)

(assert (=> d!109983 (= (map!12098 thiss!821) (map!12099 (v!11453 (underlying!550 thiss!821))))))

(declare-fun bs!24895 () Bool)

(assert (= bs!24895 d!109983))

(assert (=> bs!24895 m!827371))

(assert (=> b!887853 d!109983))

(declare-fun b!887927 () Bool)

(declare-fun e!494629 () Bool)

(assert (=> b!887927 (= e!494629 tp_is_empty!17865)))

(declare-fun mapIsEmpty!28333 () Bool)

(declare-fun mapRes!28333 () Bool)

(assert (=> mapIsEmpty!28333 mapRes!28333))

(declare-fun condMapEmpty!28333 () Bool)

(declare-fun mapDefault!28333 () ValueCell!8451)

(assert (=> mapNonEmpty!28327 (= condMapEmpty!28333 (= mapRest!28327 ((as const (Array (_ BitVec 32) ValueCell!8451)) mapDefault!28333)))))

(assert (=> mapNonEmpty!28327 (= tp!54555 (and e!494629 mapRes!28333))))

(declare-fun b!887926 () Bool)

(declare-fun e!494630 () Bool)

(assert (=> b!887926 (= e!494630 tp_is_empty!17865)))

(declare-fun mapNonEmpty!28333 () Bool)

(declare-fun tp!54564 () Bool)

(assert (=> mapNonEmpty!28333 (= mapRes!28333 (and tp!54564 e!494630))))

(declare-fun mapRest!28333 () (Array (_ BitVec 32) ValueCell!8451))

(declare-fun mapValue!28333 () ValueCell!8451)

(declare-fun mapKey!28333 () (_ BitVec 32))

(assert (=> mapNonEmpty!28333 (= mapRest!28327 (store mapRest!28333 mapKey!28333 mapValue!28333))))

(assert (= (and mapNonEmpty!28327 condMapEmpty!28333) mapIsEmpty!28333))

(assert (= (and mapNonEmpty!28327 (not condMapEmpty!28333)) mapNonEmpty!28333))

(assert (= (and mapNonEmpty!28333 ((_ is ValueCellFull!8451) mapValue!28333)) b!887926))

(assert (= (and mapNonEmpty!28327 ((_ is ValueCellFull!8451) mapDefault!28333)) b!887927))

(declare-fun m!827399 () Bool)

(assert (=> mapNonEmpty!28333 m!827399))

(check-sat (not bm!39400) (not mapNonEmpty!28333) tp_is_empty!17865 (not d!109981) (not d!109983) b_and!25773 (not b!887901) (not d!109979) (not b_next!15537) (not b!887905) (not bm!39399) (not d!109973) (not b!887917) (not b!887902) (not bm!39398) (not b!887919))
(check-sat b_and!25773 (not b_next!15537))
