; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75368 () Bool)

(assert start!75368)

(declare-fun b!887562 () Bool)

(declare-fun b_free!15519 () Bool)

(declare-fun b_next!15519 () Bool)

(assert (=> b!887562 (= b_free!15519 (not b_next!15519))))

(declare-fun tp!54494 () Bool)

(declare-fun b_and!25741 () Bool)

(assert (=> b!887562 (= tp!54494 b_and!25741)))

(declare-fun b!887561 () Bool)

(declare-fun e!494303 () Bool)

(declare-fun e!494305 () Bool)

(assert (=> b!887561 (= e!494303 e!494305)))

(declare-fun c!93706 () Bool)

(declare-datatypes ((V!28761 0))(
  ( (V!28762 (val!8974 Int)) )
))
(declare-datatypes ((ValueCell!8442 0))(
  ( (ValueCellFull!8442 (v!11432 V!28761)) (EmptyCell!8442) )
))
(declare-datatypes ((array!51656 0))(
  ( (array!51657 (arr!24843 (Array (_ BitVec 32) ValueCell!8442)) (size!25283 (_ BitVec 32))) )
))
(declare-datatypes ((array!51658 0))(
  ( (array!51659 (arr!24844 (Array (_ BitVec 32) (_ BitVec 64))) (size!25284 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3900 0))(
  ( (LongMapFixedSize!3901 (defaultEntry!5141 Int) (mask!25541 (_ BitVec 32)) (extraKeys!4835 (_ BitVec 32)) (zeroValue!4939 V!28761) (minValue!4939 V!28761) (_size!2005 (_ BitVec 32)) (_keys!9818 array!51658) (_values!5126 array!51656) (_vacant!2005 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1060 0))(
  ( (Cell!1061 (v!11433 LongMapFixedSize!3900)) )
))
(declare-datatypes ((LongMap!1060 0))(
  ( (LongMap!1061 (underlying!541 Cell!1060)) )
))
(declare-fun thiss!833 () LongMap!1060)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun contains!4308 (LongMap!1060 (_ BitVec 64)) Bool)

(assert (=> b!887561 (= c!93706 (contains!4308 thiss!833 key!673))))

(declare-fun lt!401414 () V!28761)

(declare-fun apply!395 (LongMapFixedSize!3900 (_ BitVec 64)) V!28761)

(assert (=> b!887561 (= lt!401414 (apply!395 (v!11433 (underlying!541 thiss!833)) key!673))))

(declare-fun res!602168 () Bool)

(assert (=> start!75368 (=> (not res!602168) (not e!494303))))

(declare-fun valid!1520 (LongMap!1060) Bool)

(assert (=> start!75368 (= res!602168 (valid!1520 thiss!833))))

(assert (=> start!75368 e!494303))

(declare-fun e!494300 () Bool)

(assert (=> start!75368 e!494300))

(assert (=> start!75368 true))

(declare-fun e!494298 () Bool)

(declare-fun e!494306 () Bool)

(declare-fun tp_is_empty!17847 () Bool)

(declare-fun array_inv!19552 (array!51658) Bool)

(declare-fun array_inv!19553 (array!51656) Bool)

(assert (=> b!887562 (= e!494306 (and tp!54494 tp_is_empty!17847 (array_inv!19552 (_keys!9818 (v!11433 (underlying!541 thiss!833)))) (array_inv!19553 (_values!5126 (v!11433 (underlying!541 thiss!833)))) e!494298))))

(declare-fun b!887563 () Bool)

(declare-fun e!494302 () Bool)

(declare-fun mapRes!28294 () Bool)

(assert (=> b!887563 (= e!494298 (and e!494302 mapRes!28294))))

(declare-fun condMapEmpty!28294 () Bool)

(declare-fun mapDefault!28294 () ValueCell!8442)

(assert (=> b!887563 (= condMapEmpty!28294 (= (arr!24843 (_values!5126 (v!11433 (underlying!541 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8442)) mapDefault!28294)))))

(declare-fun b!887564 () Bool)

(declare-fun e!494299 () Bool)

(assert (=> b!887564 (= e!494299 e!494306)))

(declare-fun mapIsEmpty!28294 () Bool)

(assert (=> mapIsEmpty!28294 mapRes!28294))

(declare-fun b!887565 () Bool)

(declare-fun dynLambda!1287 (Int (_ BitVec 64)) V!28761)

(assert (=> b!887565 (= e!494305 (not (= lt!401414 (dynLambda!1287 (defaultEntry!5141 (v!11433 (underlying!541 thiss!833))) key!673))))))

(declare-fun b!887566 () Bool)

(assert (=> b!887566 (= e!494300 e!494299)))

(declare-fun b!887567 () Bool)

(declare-fun e!494304 () Bool)

(assert (=> b!887567 (= e!494304 tp_is_empty!17847)))

(declare-fun b!887568 () Bool)

(declare-datatypes ((Option!442 0))(
  ( (Some!441 (v!11434 V!28761)) (None!440) )
))
(declare-fun get!13128 (Option!442) V!28761)

(declare-datatypes ((tuple2!11924 0))(
  ( (tuple2!11925 (_1!5973 (_ BitVec 64)) (_2!5973 V!28761)) )
))
(declare-datatypes ((List!17683 0))(
  ( (Nil!17680) (Cons!17679 (h!18810 tuple2!11924) (t!24974 List!17683)) )
))
(declare-fun getValueByKey!436 (List!17683 (_ BitVec 64)) Option!442)

(declare-datatypes ((ListLongMap!10621 0))(
  ( (ListLongMap!10622 (toList!5326 List!17683)) )
))
(declare-fun map!12089 (LongMap!1060) ListLongMap!10621)

(assert (=> b!887568 (= e!494305 (not (= lt!401414 (get!13128 (getValueByKey!436 (toList!5326 (map!12089 thiss!833)) key!673)))))))

(declare-fun b!887569 () Bool)

(assert (=> b!887569 (= e!494302 tp_is_empty!17847)))

(declare-fun mapNonEmpty!28294 () Bool)

(declare-fun tp!54495 () Bool)

(assert (=> mapNonEmpty!28294 (= mapRes!28294 (and tp!54495 e!494304))))

(declare-fun mapRest!28294 () (Array (_ BitVec 32) ValueCell!8442))

(declare-fun mapValue!28294 () ValueCell!8442)

(declare-fun mapKey!28294 () (_ BitVec 32))

(assert (=> mapNonEmpty!28294 (= (arr!24843 (_values!5126 (v!11433 (underlying!541 thiss!833)))) (store mapRest!28294 mapKey!28294 mapValue!28294))))

(assert (= (and start!75368 res!602168) b!887561))

(assert (= (and b!887561 c!93706) b!887568))

(assert (= (and b!887561 (not c!93706)) b!887565))

(assert (= (and b!887563 condMapEmpty!28294) mapIsEmpty!28294))

(assert (= (and b!887563 (not condMapEmpty!28294)) mapNonEmpty!28294))

(get-info :version)

(assert (= (and mapNonEmpty!28294 ((_ is ValueCellFull!8442) mapValue!28294)) b!887567))

(assert (= (and b!887563 ((_ is ValueCellFull!8442) mapDefault!28294)) b!887569))

(assert (= b!887562 b!887563))

(assert (= b!887564 b!887562))

(assert (= b!887566 b!887564))

(assert (= start!75368 b!887566))

(declare-fun b_lambda!12849 () Bool)

(assert (=> (not b_lambda!12849) (not b!887565)))

(declare-fun t!24973 () Bool)

(declare-fun tb!5141 () Bool)

(assert (=> (and b!887562 (= (defaultEntry!5141 (v!11433 (underlying!541 thiss!833))) (defaultEntry!5141 (v!11433 (underlying!541 thiss!833)))) t!24973) tb!5141))

(declare-fun result!9977 () Bool)

(assert (=> tb!5141 (= result!9977 tp_is_empty!17847)))

(assert (=> b!887565 t!24973))

(declare-fun b_and!25743 () Bool)

(assert (= b_and!25741 (and (=> t!24973 result!9977) b_and!25743)))

(declare-fun m!827165 () Bool)

(assert (=> b!887561 m!827165))

(declare-fun m!827167 () Bool)

(assert (=> b!887561 m!827167))

(declare-fun m!827169 () Bool)

(assert (=> mapNonEmpty!28294 m!827169))

(declare-fun m!827171 () Bool)

(assert (=> b!887562 m!827171))

(declare-fun m!827173 () Bool)

(assert (=> b!887562 m!827173))

(declare-fun m!827175 () Bool)

(assert (=> b!887568 m!827175))

(declare-fun m!827177 () Bool)

(assert (=> b!887568 m!827177))

(assert (=> b!887568 m!827177))

(declare-fun m!827179 () Bool)

(assert (=> b!887568 m!827179))

(declare-fun m!827181 () Bool)

(assert (=> start!75368 m!827181))

(declare-fun m!827183 () Bool)

(assert (=> b!887565 m!827183))

(check-sat (not b!887562) b_and!25743 (not b!887561) (not b_lambda!12849) (not mapNonEmpty!28294) (not start!75368) (not b_next!15519) (not b!887568) tp_is_empty!17847)
(check-sat b_and!25743 (not b_next!15519))
(get-model)

(declare-fun b_lambda!12853 () Bool)

(assert (= b_lambda!12849 (or (and b!887562 b_free!15519) b_lambda!12853)))

(check-sat (not b!887562) (not b!887561) (not mapNonEmpty!28294) (not start!75368) (not b_next!15519) (not b_lambda!12853) b_and!25743 (not b!887568) tp_is_empty!17847)
(check-sat b_and!25743 (not b_next!15519))
(get-model)

(declare-fun d!109943 () Bool)

(declare-fun valid!1522 (LongMapFixedSize!3900) Bool)

(assert (=> d!109943 (= (valid!1520 thiss!833) (valid!1522 (v!11433 (underlying!541 thiss!833))))))

(declare-fun bs!24881 () Bool)

(assert (= bs!24881 d!109943))

(declare-fun m!827205 () Bool)

(assert (=> bs!24881 m!827205))

(assert (=> start!75368 d!109943))

(declare-fun d!109945 () Bool)

(declare-fun lt!401420 () Bool)

(declare-fun contains!4310 (ListLongMap!10621 (_ BitVec 64)) Bool)

(assert (=> d!109945 (= lt!401420 (contains!4310 (map!12089 thiss!833) key!673))))

(declare-fun contains!4311 (LongMapFixedSize!3900 (_ BitVec 64)) Bool)

(assert (=> d!109945 (= lt!401420 (contains!4311 (v!11433 (underlying!541 thiss!833)) key!673))))

(assert (=> d!109945 (valid!1520 thiss!833)))

(assert (=> d!109945 (= (contains!4308 thiss!833 key!673) lt!401420)))

(declare-fun bs!24882 () Bool)

(assert (= bs!24882 d!109945))

(assert (=> bs!24882 m!827175))

(assert (=> bs!24882 m!827175))

(declare-fun m!827207 () Bool)

(assert (=> bs!24882 m!827207))

(declare-fun m!827209 () Bool)

(assert (=> bs!24882 m!827209))

(assert (=> bs!24882 m!827181))

(assert (=> b!887561 d!109945))

(declare-fun b!887637 () Bool)

(declare-fun e!494360 () V!28761)

(declare-fun e!494357 () V!28761)

(assert (=> b!887637 (= e!494360 e!494357)))

(declare-datatypes ((SeekEntryResult!8764 0))(
  ( (MissingZero!8764 (index!37427 (_ BitVec 32))) (Found!8764 (index!37428 (_ BitVec 32))) (Intermediate!8764 (undefined!9576 Bool) (index!37429 (_ BitVec 32)) (x!75272 (_ BitVec 32))) (Undefined!8764) (MissingVacant!8764 (index!37430 (_ BitVec 32))) )
))
(declare-fun lt!401449 () SeekEntryResult!8764)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51658 (_ BitVec 32)) SeekEntryResult!8764)

(assert (=> b!887637 (= lt!401449 (seekEntry!0 key!673 (_keys!9818 (v!11433 (underlying!541 thiss!833))) (mask!25541 (v!11433 (underlying!541 thiss!833)))))))

(declare-datatypes ((Unit!30253 0))(
  ( (Unit!30254) )
))
(declare-fun lt!401447 () Unit!30253)

(declare-fun lemmaSeekEntryGivesInRangeIndex!2 (array!51658 array!51656 (_ BitVec 32) (_ BitVec 32) V!28761 V!28761 (_ BitVec 64)) Unit!30253)

(assert (=> b!887637 (= lt!401447 (lemmaSeekEntryGivesInRangeIndex!2 (_keys!9818 (v!11433 (underlying!541 thiss!833))) (_values!5126 (v!11433 (underlying!541 thiss!833))) (mask!25541 (v!11433 (underlying!541 thiss!833))) (extraKeys!4835 (v!11433 (underlying!541 thiss!833))) (zeroValue!4939 (v!11433 (underlying!541 thiss!833))) (minValue!4939 (v!11433 (underlying!541 thiss!833))) key!673))))

(declare-fun lt!401446 () SeekEntryResult!8764)

(assert (=> b!887637 (= lt!401446 (seekEntry!0 key!673 (_keys!9818 (v!11433 (underlying!541 thiss!833))) (mask!25541 (v!11433 (underlying!541 thiss!833)))))))

(declare-fun res!602180 () Bool)

(assert (=> b!887637 (= res!602180 (not ((_ is Found!8764) lt!401446)))))

(declare-fun e!494366 () Bool)

(assert (=> b!887637 (=> res!602180 e!494366)))

(assert (=> b!887637 e!494366))

(declare-fun lt!401443 () Unit!30253)

(assert (=> b!887637 (= lt!401443 lt!401447)))

(declare-fun c!93730 () Bool)

(assert (=> b!887637 (= c!93730 ((_ is Found!8764) lt!401449))))

(declare-fun b!887638 () Bool)

(declare-fun lt!401450 () V!28761)

(declare-fun e!494358 () Bool)

(declare-fun map!12091 (LongMapFixedSize!3900) ListLongMap!10621)

(assert (=> b!887638 (= e!494358 (= lt!401450 (get!13128 (getValueByKey!436 (toList!5326 (map!12091 (v!11433 (underlying!541 thiss!833)))) key!673))))))

(declare-fun b!887639 () Bool)

(declare-fun e!494365 () Bool)

(declare-fun call!39393 () V!28761)

(assert (=> b!887639 (= e!494365 (= call!39393 (minValue!4939 (v!11433 (underlying!541 thiss!833)))))))

(declare-fun b!887640 () Bool)

(declare-fun e!494362 () Bool)

(declare-fun get!13130 (ValueCell!8442 V!28761) V!28761)

(assert (=> b!887640 (= e!494362 (= call!39393 (get!13130 (select (arr!24843 (_values!5126 (v!11433 (underlying!541 thiss!833)))) (index!37428 lt!401449)) (dynLambda!1287 (defaultEntry!5141 (v!11433 (underlying!541 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!887641 () Bool)

(declare-fun e!494361 () V!28761)

(assert (=> b!887641 (= e!494361 (zeroValue!4939 (v!11433 (underlying!541 thiss!833))))))

(declare-fun b!887642 () Bool)

(declare-fun lt!401444 () Unit!30253)

(declare-fun lt!401445 () Unit!30253)

(assert (=> b!887642 (= lt!401444 lt!401445)))

(declare-fun e!494363 () Bool)

(assert (=> b!887642 e!494363))

(declare-fun c!93729 () Bool)

(assert (=> b!887642 (= c!93729 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lemmaKeyInListMapThenSameValueInArray!2 (array!51658 array!51656 (_ BitVec 32) (_ BitVec 32) V!28761 V!28761 (_ BitVec 64) (_ BitVec 32) Int) Unit!30253)

(assert (=> b!887642 (= lt!401445 (lemmaKeyInListMapThenSameValueInArray!2 (_keys!9818 (v!11433 (underlying!541 thiss!833))) (_values!5126 (v!11433 (underlying!541 thiss!833))) (mask!25541 (v!11433 (underlying!541 thiss!833))) (extraKeys!4835 (v!11433 (underlying!541 thiss!833))) (zeroValue!4939 (v!11433 (underlying!541 thiss!833))) (minValue!4939 (v!11433 (underlying!541 thiss!833))) key!673 (index!37428 lt!401449) (defaultEntry!5141 (v!11433 (underlying!541 thiss!833)))))))

(declare-fun lt!401453 () Unit!30253)

(declare-fun lt!401451 () Unit!30253)

(assert (=> b!887642 (= lt!401453 lt!401451)))

(declare-fun getCurrentListMap!2613 (array!51658 array!51656 (_ BitVec 32) (_ BitVec 32) V!28761 V!28761 (_ BitVec 32) Int) ListLongMap!10621)

(assert (=> b!887642 (contains!4310 (getCurrentListMap!2613 (_keys!9818 (v!11433 (underlying!541 thiss!833))) (_values!5126 (v!11433 (underlying!541 thiss!833))) (mask!25541 (v!11433 (underlying!541 thiss!833))) (extraKeys!4835 (v!11433 (underlying!541 thiss!833))) (zeroValue!4939 (v!11433 (underlying!541 thiss!833))) (minValue!4939 (v!11433 (underlying!541 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5141 (v!11433 (underlying!541 thiss!833)))) (select (arr!24844 (_keys!9818 (v!11433 (underlying!541 thiss!833)))) (index!37428 lt!401449)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!202 (array!51658 array!51656 (_ BitVec 32) (_ BitVec 32) V!28761 V!28761 (_ BitVec 32) Int) Unit!30253)

(assert (=> b!887642 (= lt!401451 (lemmaValidKeyInArrayIsInListMap!202 (_keys!9818 (v!11433 (underlying!541 thiss!833))) (_values!5126 (v!11433 (underlying!541 thiss!833))) (mask!25541 (v!11433 (underlying!541 thiss!833))) (extraKeys!4835 (v!11433 (underlying!541 thiss!833))) (zeroValue!4939 (v!11433 (underlying!541 thiss!833))) (minValue!4939 (v!11433 (underlying!541 thiss!833))) (index!37428 lt!401449) (defaultEntry!5141 (v!11433 (underlying!541 thiss!833)))))))

(declare-fun lt!401448 () Unit!30253)

(declare-fun lt!401452 () Unit!30253)

(assert (=> b!887642 (= lt!401448 lt!401452)))

(declare-fun arrayContainsKey!0 (array!51658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!887642 (arrayContainsKey!0 (_keys!9818 (v!11433 (underlying!541 thiss!833))) key!673 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51658 (_ BitVec 64) (_ BitVec 32)) Unit!30253)

(assert (=> b!887642 (= lt!401452 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9818 (v!11433 (underlying!541 thiss!833))) key!673 (index!37428 lt!401449)))))

(assert (=> b!887642 (= e!494357 (get!13130 (select (arr!24843 (_values!5126 (v!11433 (underlying!541 thiss!833)))) (index!37428 lt!401449)) (dynLambda!1287 (defaultEntry!5141 (v!11433 (underlying!541 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!887643 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!887643 (= e!494366 (inRange!0 (index!37428 lt!401446) (mask!25541 (v!11433 (underlying!541 thiss!833)))))))

(declare-fun b!887644 () Bool)

(declare-fun e!494364 () V!28761)

(assert (=> b!887644 (= e!494364 (dynLambda!1287 (defaultEntry!5141 (v!11433 (underlying!541 thiss!833))) key!673))))

(declare-fun b!887645 () Bool)

(declare-fun e!494359 () Bool)

(assert (=> b!887645 (= e!494363 e!494359)))

(declare-fun res!602183 () Bool)

(assert (=> b!887645 (= res!602183 (not (= (bvand (extraKeys!4835 (v!11433 (underlying!541 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!887645 (=> (not res!602183) (not e!494359))))

(declare-fun b!887646 () Bool)

(assert (=> b!887646 (= e!494357 (dynLambda!1287 (defaultEntry!5141 (v!11433 (underlying!541 thiss!833))) key!673))))

(declare-fun b!887647 () Bool)

(declare-fun res!602182 () Bool)

(assert (=> b!887647 (=> (not res!602182) (not e!494365))))

(assert (=> b!887647 (= res!602182 (not (= (bvand (extraKeys!4835 (v!11433 (underlying!541 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!494356 () Bool)

(assert (=> b!887647 (= e!494356 e!494365)))

(declare-fun b!887648 () Bool)

(declare-fun res!602181 () Bool)

(assert (=> b!887648 (=> (not res!602181) (not e!494362))))

(assert (=> b!887648 (= res!602181 (arrayContainsKey!0 (_keys!9818 (v!11433 (underlying!541 thiss!833))) key!673 #b00000000000000000000000000000000))))

(assert (=> b!887648 (= e!494356 e!494362)))

(declare-fun call!39391 () ListLongMap!10621)

(declare-fun bm!39389 () Bool)

(declare-fun call!39392 () V!28761)

(declare-fun call!39394 () ListLongMap!10621)

(declare-fun apply!397 (ListLongMap!10621 (_ BitVec 64)) V!28761)

(assert (=> bm!39389 (= call!39392 (apply!397 (ite c!93729 call!39391 call!39394) key!673))))

(declare-fun b!887649 () Bool)

(assert (=> b!887649 (= e!494363 e!494356)))

(declare-fun c!93724 () Bool)

(assert (=> b!887649 (= c!93724 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887650 () Bool)

(assert (=> b!887650 (= e!494358 (= lt!401450 (dynLambda!1287 (defaultEntry!5141 (v!11433 (underlying!541 thiss!833))) key!673)))))

(declare-fun b!887651 () Bool)

(assert (=> b!887651 (= e!494364 (minValue!4939 (v!11433 (underlying!541 thiss!833))))))

(declare-fun bm!39390 () Bool)

(assert (=> bm!39390 (= call!39394 call!39391)))

(declare-fun b!887652 () Bool)

(assert (=> b!887652 (= e!494360 e!494361)))

(declare-fun c!93725 () Bool)

(assert (=> b!887652 (= c!93725 (and (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4835 (v!11433 (underlying!541 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun bm!39391 () Bool)

(assert (=> bm!39391 (= call!39393 call!39392)))

(declare-fun d!109947 () Bool)

(assert (=> d!109947 e!494358))

(declare-fun c!93727 () Bool)

(assert (=> d!109947 (= c!93727 (contains!4311 (v!11433 (underlying!541 thiss!833)) key!673))))

(assert (=> d!109947 (= lt!401450 e!494360)))

(declare-fun c!93726 () Bool)

(assert (=> d!109947 (= c!93726 (= key!673 (bvneg key!673)))))

(assert (=> d!109947 (valid!1522 (v!11433 (underlying!541 thiss!833)))))

(assert (=> d!109947 (= (apply!395 (v!11433 (underlying!541 thiss!833)) key!673) lt!401450)))

(declare-fun bm!39388 () Bool)

(assert (=> bm!39388 (= call!39391 (getCurrentListMap!2613 (_keys!9818 (v!11433 (underlying!541 thiss!833))) (_values!5126 (v!11433 (underlying!541 thiss!833))) (mask!25541 (v!11433 (underlying!541 thiss!833))) (extraKeys!4835 (v!11433 (underlying!541 thiss!833))) (zeroValue!4939 (v!11433 (underlying!541 thiss!833))) (minValue!4939 (v!11433 (underlying!541 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5141 (v!11433 (underlying!541 thiss!833)))))))

(declare-fun b!887653 () Bool)

(assert (=> b!887653 (= e!494359 (= call!39392 (zeroValue!4939 (v!11433 (underlying!541 thiss!833)))))))

(declare-fun b!887654 () Bool)

(declare-fun c!93728 () Bool)

(assert (=> b!887654 (= c!93728 (and (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4835 (v!11433 (underlying!541 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!887654 (= e!494361 e!494364)))

(assert (= (and d!109947 c!93726) b!887652))

(assert (= (and d!109947 (not c!93726)) b!887637))

(assert (= (and b!887652 c!93725) b!887641))

(assert (= (and b!887652 (not c!93725)) b!887654))

(assert (= (and b!887654 c!93728) b!887651))

(assert (= (and b!887654 (not c!93728)) b!887644))

(assert (= (and b!887637 (not res!602180)) b!887643))

(assert (= (and b!887637 c!93730) b!887642))

(assert (= (and b!887637 (not c!93730)) b!887646))

(assert (= (and b!887642 c!93729) b!887645))

(assert (= (and b!887642 (not c!93729)) b!887649))

(assert (= (and b!887645 res!602183) b!887653))

(assert (= (and b!887649 c!93724) b!887647))

(assert (= (and b!887649 (not c!93724)) b!887648))

(assert (= (and b!887647 res!602182) b!887639))

(assert (= (and b!887648 res!602181) b!887640))

(assert (= (or b!887639 b!887640) bm!39390))

(assert (= (or b!887639 b!887640) bm!39391))

(assert (= (or b!887653 bm!39390) bm!39388))

(assert (= (or b!887653 bm!39391) bm!39389))

(assert (= (and d!109947 c!93727) b!887638))

(assert (= (and d!109947 (not c!93727)) b!887650))

(declare-fun b_lambda!12855 () Bool)

(assert (=> (not b_lambda!12855) (not b!887646)))

(assert (=> b!887646 t!24973))

(declare-fun b_and!25749 () Bool)

(assert (= b_and!25743 (and (=> t!24973 result!9977) b_and!25749)))

(declare-fun b_lambda!12857 () Bool)

(assert (=> (not b_lambda!12857) (not b!887644)))

(assert (=> b!887644 t!24973))

(declare-fun b_and!25751 () Bool)

(assert (= b_and!25749 (and (=> t!24973 result!9977) b_and!25751)))

(declare-fun b_lambda!12859 () Bool)

(assert (=> (not b_lambda!12859) (not b!887642)))

(declare-fun t!24979 () Bool)

(declare-fun tb!5145 () Bool)

(assert (=> (and b!887562 (= (defaultEntry!5141 (v!11433 (underlying!541 thiss!833))) (defaultEntry!5141 (v!11433 (underlying!541 thiss!833)))) t!24979) tb!5145))

(declare-fun result!9985 () Bool)

(assert (=> tb!5145 (= result!9985 tp_is_empty!17847)))

(assert (=> b!887642 t!24979))

(declare-fun b_and!25753 () Bool)

(assert (= b_and!25751 (and (=> t!24979 result!9985) b_and!25753)))

(declare-fun b_lambda!12861 () Bool)

(assert (=> (not b_lambda!12861) (not b!887650)))

(assert (=> b!887650 t!24973))

(declare-fun b_and!25755 () Bool)

(assert (= b_and!25753 (and (=> t!24973 result!9977) b_and!25755)))

(declare-fun b_lambda!12863 () Bool)

(assert (=> (not b_lambda!12863) (not b!887640)))

(assert (=> b!887640 t!24979))

(declare-fun b_and!25757 () Bool)

(assert (= b_and!25755 (and (=> t!24979 result!9985) b_and!25757)))

(declare-fun m!827211 () Bool)

(assert (=> b!887642 m!827211))

(declare-fun m!827213 () Bool)

(assert (=> b!887642 m!827213))

(declare-fun m!827215 () Bool)

(assert (=> b!887642 m!827215))

(declare-fun m!827217 () Bool)

(assert (=> b!887642 m!827217))

(assert (=> b!887642 m!827217))

(declare-fun m!827219 () Bool)

(assert (=> b!887642 m!827219))

(declare-fun m!827221 () Bool)

(assert (=> b!887642 m!827221))

(declare-fun m!827223 () Bool)

(assert (=> b!887642 m!827223))

(declare-fun m!827225 () Bool)

(assert (=> b!887642 m!827225))

(assert (=> b!887642 m!827215))

(assert (=> b!887642 m!827225))

(declare-fun m!827227 () Bool)

(assert (=> b!887642 m!827227))

(declare-fun m!827229 () Bool)

(assert (=> b!887642 m!827229))

(assert (=> b!887642 m!827219))

(assert (=> b!887640 m!827215))

(assert (=> b!887640 m!827225))

(assert (=> b!887640 m!827215))

(assert (=> b!887640 m!827225))

(assert (=> b!887640 m!827227))

(assert (=> b!887646 m!827183))

(declare-fun m!827231 () Bool)

(assert (=> b!887643 m!827231))

(assert (=> b!887648 m!827213))

(assert (=> d!109947 m!827209))

(assert (=> d!109947 m!827205))

(declare-fun m!827233 () Bool)

(assert (=> b!887638 m!827233))

(declare-fun m!827235 () Bool)

(assert (=> b!887638 m!827235))

(assert (=> b!887638 m!827235))

(declare-fun m!827237 () Bool)

(assert (=> b!887638 m!827237))

(assert (=> b!887644 m!827183))

(declare-fun m!827239 () Bool)

(assert (=> bm!39389 m!827239))

(assert (=> bm!39388 m!827217))

(declare-fun m!827241 () Bool)

(assert (=> b!887637 m!827241))

(declare-fun m!827243 () Bool)

(assert (=> b!887637 m!827243))

(assert (=> b!887650 m!827183))

(assert (=> b!887561 d!109947))

(declare-fun d!109949 () Bool)

(assert (=> d!109949 (= (array_inv!19552 (_keys!9818 (v!11433 (underlying!541 thiss!833)))) (bvsge (size!25284 (_keys!9818 (v!11433 (underlying!541 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887562 d!109949))

(declare-fun d!109951 () Bool)

(assert (=> d!109951 (= (array_inv!19553 (_values!5126 (v!11433 (underlying!541 thiss!833)))) (bvsge (size!25283 (_values!5126 (v!11433 (underlying!541 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887562 d!109951))

(declare-fun d!109953 () Bool)

(assert (=> d!109953 (= (get!13128 (getValueByKey!436 (toList!5326 (map!12089 thiss!833)) key!673)) (v!11434 (getValueByKey!436 (toList!5326 (map!12089 thiss!833)) key!673)))))

(assert (=> b!887568 d!109953))

(declare-fun b!887664 () Bool)

(declare-fun e!494371 () Option!442)

(declare-fun e!494372 () Option!442)

(assert (=> b!887664 (= e!494371 e!494372)))

(declare-fun c!93736 () Bool)

(assert (=> b!887664 (= c!93736 (and ((_ is Cons!17679) (toList!5326 (map!12089 thiss!833))) (not (= (_1!5973 (h!18810 (toList!5326 (map!12089 thiss!833)))) key!673))))))

(declare-fun b!887665 () Bool)

(assert (=> b!887665 (= e!494372 (getValueByKey!436 (t!24974 (toList!5326 (map!12089 thiss!833))) key!673))))

(declare-fun b!887663 () Bool)

(assert (=> b!887663 (= e!494371 (Some!441 (_2!5973 (h!18810 (toList!5326 (map!12089 thiss!833))))))))

(declare-fun b!887666 () Bool)

(assert (=> b!887666 (= e!494372 None!440)))

(declare-fun d!109955 () Bool)

(declare-fun c!93735 () Bool)

(assert (=> d!109955 (= c!93735 (and ((_ is Cons!17679) (toList!5326 (map!12089 thiss!833))) (= (_1!5973 (h!18810 (toList!5326 (map!12089 thiss!833)))) key!673)))))

(assert (=> d!109955 (= (getValueByKey!436 (toList!5326 (map!12089 thiss!833)) key!673) e!494371)))

(assert (= (and d!109955 c!93735) b!887663))

(assert (= (and d!109955 (not c!93735)) b!887664))

(assert (= (and b!887664 c!93736) b!887665))

(assert (= (and b!887664 (not c!93736)) b!887666))

(declare-fun m!827245 () Bool)

(assert (=> b!887665 m!827245))

(assert (=> b!887568 d!109955))

(declare-fun d!109957 () Bool)

(assert (=> d!109957 (= (map!12089 thiss!833) (map!12091 (v!11433 (underlying!541 thiss!833))))))

(declare-fun bs!24883 () Bool)

(assert (= bs!24883 d!109957))

(assert (=> bs!24883 m!827233))

(assert (=> b!887568 d!109957))

(declare-fun mapNonEmpty!28300 () Bool)

(declare-fun mapRes!28300 () Bool)

(declare-fun tp!54504 () Bool)

(declare-fun e!494378 () Bool)

(assert (=> mapNonEmpty!28300 (= mapRes!28300 (and tp!54504 e!494378))))

(declare-fun mapKey!28300 () (_ BitVec 32))

(declare-fun mapRest!28300 () (Array (_ BitVec 32) ValueCell!8442))

(declare-fun mapValue!28300 () ValueCell!8442)

(assert (=> mapNonEmpty!28300 (= mapRest!28294 (store mapRest!28300 mapKey!28300 mapValue!28300))))

(declare-fun b!887674 () Bool)

(declare-fun e!494377 () Bool)

(assert (=> b!887674 (= e!494377 tp_is_empty!17847)))

(declare-fun mapIsEmpty!28300 () Bool)

(assert (=> mapIsEmpty!28300 mapRes!28300))

(declare-fun condMapEmpty!28300 () Bool)

(declare-fun mapDefault!28300 () ValueCell!8442)

(assert (=> mapNonEmpty!28294 (= condMapEmpty!28300 (= mapRest!28294 ((as const (Array (_ BitVec 32) ValueCell!8442)) mapDefault!28300)))))

(assert (=> mapNonEmpty!28294 (= tp!54495 (and e!494377 mapRes!28300))))

(declare-fun b!887673 () Bool)

(assert (=> b!887673 (= e!494378 tp_is_empty!17847)))

(assert (= (and mapNonEmpty!28294 condMapEmpty!28300) mapIsEmpty!28300))

(assert (= (and mapNonEmpty!28294 (not condMapEmpty!28300)) mapNonEmpty!28300))

(assert (= (and mapNonEmpty!28300 ((_ is ValueCellFull!8442) mapValue!28300)) b!887673))

(assert (= (and mapNonEmpty!28294 ((_ is ValueCellFull!8442) mapDefault!28300)) b!887674))

(declare-fun m!827247 () Bool)

(assert (=> mapNonEmpty!28300 m!827247))

(declare-fun b_lambda!12865 () Bool)

(assert (= b_lambda!12863 (or (and b!887562 b_free!15519) b_lambda!12865)))

(declare-fun b_lambda!12867 () Bool)

(assert (= b_lambda!12859 (or (and b!887562 b_free!15519) b_lambda!12867)))

(declare-fun b_lambda!12869 () Bool)

(assert (= b_lambda!12857 (or (and b!887562 b_free!15519) b_lambda!12869)))

(declare-fun b_lambda!12871 () Bool)

(assert (= b_lambda!12861 (or (and b!887562 b_free!15519) b_lambda!12871)))

(declare-fun b_lambda!12873 () Bool)

(assert (= b_lambda!12855 (or (and b!887562 b_free!15519) b_lambda!12873)))

(check-sat (not b_lambda!12871) (not mapNonEmpty!28300) (not bm!39389) (not b!887648) (not b!887638) (not b_lambda!12867) (not b!887642) (not bm!39388) (not b_lambda!12873) (not d!109945) (not d!109947) (not b_next!15519) (not b!887637) (not b_lambda!12869) (not b_lambda!12853) b_and!25757 (not b!887665) (not b_lambda!12865) (not b!887643) (not d!109957) (not b!887640) (not d!109943) tp_is_empty!17847)
(check-sat b_and!25757 (not b_next!15519))
