; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13072 () Bool)

(assert start!13072)

(declare-fun b!114193 () Bool)

(declare-fun b_free!2621 () Bool)

(declare-fun b_next!2621 () Bool)

(assert (=> b!114193 (= b_free!2621 (not b_next!2621))))

(declare-fun tp!10221 () Bool)

(declare-fun b_and!7035 () Bool)

(assert (=> b!114193 (= tp!10221 b_and!7035)))

(declare-fun b!114197 () Bool)

(declare-fun b_free!2623 () Bool)

(declare-fun b_next!2623 () Bool)

(assert (=> b!114197 (= b_free!2623 (not b_next!2623))))

(declare-fun tp!10223 () Bool)

(declare-fun b_and!7037 () Bool)

(assert (=> b!114197 (= tp!10223 b_and!7037)))

(declare-fun mapNonEmpty!4109 () Bool)

(declare-fun mapRes!4109 () Bool)

(declare-fun tp!10224 () Bool)

(declare-fun e!74267 () Bool)

(assert (=> mapNonEmpty!4109 (= mapRes!4109 (and tp!10224 e!74267))))

(declare-fun mapKey!4109 () (_ BitVec 32))

(declare-datatypes ((V!3283 0))(
  ( (V!3284 (val!1408 Int)) )
))
(declare-datatypes ((ValueCell!1020 0))(
  ( (ValueCellFull!1020 (v!2983 V!3283)) (EmptyCell!1020) )
))
(declare-fun mapRest!4110 () (Array (_ BitVec 32) ValueCell!1020))

(declare-fun mapValue!4110 () ValueCell!1020)

(declare-datatypes ((array!4455 0))(
  ( (array!4456 (arr!2111 (Array (_ BitVec 32) (_ BitVec 64))) (size!2371 (_ BitVec 32))) )
))
(declare-datatypes ((array!4457 0))(
  ( (array!4458 (arr!2112 (Array (_ BitVec 32) ValueCell!1020)) (size!2372 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!948 0))(
  ( (LongMapFixedSize!949 (defaultEntry!2680 Int) (mask!6874 (_ BitVec 32)) (extraKeys!2469 (_ BitVec 32)) (zeroValue!2547 V!3283) (minValue!2547 V!3283) (_size!523 (_ BitVec 32)) (_keys!4402 array!4455) (_values!2663 array!4457) (_vacant!523 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!748 0))(
  ( (Cell!749 (v!2984 LongMapFixedSize!948)) )
))
(declare-datatypes ((LongMap!748 0))(
  ( (LongMap!749 (underlying!385 Cell!748)) )
))
(declare-fun thiss!992 () LongMap!748)

(assert (=> mapNonEmpty!4109 (= (arr!2112 (_values!2663 (v!2984 (underlying!385 thiss!992)))) (store mapRest!4110 mapKey!4109 mapValue!4110))))

(declare-fun mapIsEmpty!4109 () Bool)

(declare-fun mapRes!4110 () Bool)

(assert (=> mapIsEmpty!4109 mapRes!4110))

(declare-fun b!114183 () Bool)

(declare-fun e!74266 () Bool)

(declare-fun e!74280 () Bool)

(assert (=> b!114183 (= e!74266 e!74280)))

(declare-fun b!114184 () Bool)

(declare-fun e!74269 () Bool)

(declare-fun e!74279 () Bool)

(assert (=> b!114184 (= e!74269 e!74279)))

(declare-fun res!56216 () Bool)

(assert (=> b!114184 (=> (not res!56216) (not e!74279))))

(declare-datatypes ((tuple2!2474 0))(
  ( (tuple2!2475 (_1!1248 (_ BitVec 64)) (_2!1248 V!3283)) )
))
(declare-datatypes ((List!1649 0))(
  ( (Nil!1646) (Cons!1645 (h!2245 tuple2!2474) (t!5863 List!1649)) )
))
(declare-datatypes ((ListLongMap!1611 0))(
  ( (ListLongMap!1612 (toList!821 List!1649)) )
))
(declare-fun lt!59381 () ListLongMap!1611)

(declare-fun lt!59379 () ListLongMap!1611)

(assert (=> b!114184 (= res!56216 (= lt!59381 lt!59379))))

(declare-fun newMap!16 () LongMapFixedSize!948)

(declare-fun map!1317 (LongMapFixedSize!948) ListLongMap!1611)

(assert (=> b!114184 (= lt!59379 (map!1317 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!504 (array!4455 array!4457 (_ BitVec 32) (_ BitVec 32) V!3283 V!3283 (_ BitVec 32) Int) ListLongMap!1611)

(assert (=> b!114184 (= lt!59381 (getCurrentListMap!504 (_keys!4402 (v!2984 (underlying!385 thiss!992))) (_values!2663 (v!2984 (underlying!385 thiss!992))) (mask!6874 (v!2984 (underlying!385 thiss!992))) (extraKeys!2469 (v!2984 (underlying!385 thiss!992))) (zeroValue!2547 (v!2984 (underlying!385 thiss!992))) (minValue!2547 (v!2984 (underlying!385 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2680 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun b!114185 () Bool)

(declare-fun e!74277 () Bool)

(declare-fun e!74278 () Bool)

(assert (=> b!114185 (= e!74277 e!74278)))

(declare-fun res!56218 () Bool)

(assert (=> b!114185 (=> (not res!56218) (not e!74278))))

(declare-datatypes ((tuple2!2476 0))(
  ( (tuple2!2477 (_1!1249 Bool) (_2!1249 LongMapFixedSize!948)) )
))
(declare-fun lt!59372 () tuple2!2476)

(assert (=> b!114185 (= res!56218 (and (_1!1249 lt!59372) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3565 0))(
  ( (Unit!3566) )
))
(declare-fun lt!59380 () Unit!3565)

(declare-fun e!74268 () Unit!3565)

(assert (=> b!114185 (= lt!59380 e!74268)))

(declare-fun c!20417 () Bool)

(declare-fun contains!852 (ListLongMap!1611 (_ BitVec 64)) Bool)

(assert (=> b!114185 (= c!20417 (contains!852 lt!59379 (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355)))))

(declare-fun lt!59378 () V!3283)

(declare-fun update!170 (LongMapFixedSize!948 (_ BitVec 64) V!3283) tuple2!2476)

(assert (=> b!114185 (= lt!59372 (update!170 newMap!16 (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355) lt!59378))))

(declare-fun b!114186 () Bool)

(declare-fun res!56220 () Bool)

(assert (=> b!114186 (=> (not res!56220) (not e!74269))))

(assert (=> b!114186 (= res!56220 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6874 newMap!16)) (_size!523 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun b!114188 () Bool)

(assert (=> b!114188 (= e!74279 e!74277)))

(declare-fun res!56219 () Bool)

(assert (=> b!114188 (=> (not res!56219) (not e!74277))))

(assert (=> b!114188 (= res!56219 (and (not (= (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1373 (ValueCell!1020 V!3283) V!3283)

(declare-fun dynLambda!397 (Int (_ BitVec 64)) V!3283)

(assert (=> b!114188 (= lt!59378 (get!1373 (select (arr!2112 (_values!2663 (v!2984 (underlying!385 thiss!992)))) from!355) (dynLambda!397 (defaultEntry!2680 (v!2984 (underlying!385 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114189 () Bool)

(declare-fun e!74274 () Bool)

(assert (=> b!114189 (= e!74274 e!74266)))

(declare-fun b!114190 () Bool)

(declare-fun e!74281 () Bool)

(declare-fun tp_is_empty!2727 () Bool)

(assert (=> b!114190 (= e!74281 tp_is_empty!2727)))

(declare-fun b!114191 () Bool)

(assert (=> b!114191 (= e!74278 (not true))))

(declare-fun lt!59366 () Bool)

(declare-fun valid!445 (LongMapFixedSize!948) Bool)

(assert (=> b!114191 (= lt!59366 (valid!445 (_2!1249 lt!59372)))))

(declare-fun lt!59384 () ListLongMap!1611)

(declare-fun lt!59369 () tuple2!2474)

(declare-fun lt!59368 () tuple2!2474)

(declare-fun lt!59376 () ListLongMap!1611)

(declare-fun +!159 (ListLongMap!1611 tuple2!2474) ListLongMap!1611)

(assert (=> b!114191 (= (+!159 lt!59376 lt!59368) (+!159 (+!159 lt!59384 lt!59368) lt!59369))))

(assert (=> b!114191 (= lt!59368 (tuple2!2475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2547 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun lt!59373 () Unit!3565)

(declare-fun addCommutativeForDiffKeys!71 (ListLongMap!1611 (_ BitVec 64) V!3283 (_ BitVec 64) V!3283) Unit!3565)

(assert (=> b!114191 (= lt!59373 (addCommutativeForDiffKeys!71 lt!59384 (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355) lt!59378 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2547 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun lt!59370 () ListLongMap!1611)

(assert (=> b!114191 (= lt!59370 lt!59376)))

(assert (=> b!114191 (= lt!59376 (+!159 lt!59384 lt!59369))))

(declare-fun lt!59375 () ListLongMap!1611)

(declare-fun lt!59382 () tuple2!2474)

(assert (=> b!114191 (= lt!59370 (+!159 lt!59375 lt!59382))))

(declare-fun lt!59374 () ListLongMap!1611)

(assert (=> b!114191 (= lt!59384 (+!159 lt!59374 lt!59382))))

(assert (=> b!114191 (= lt!59382 (tuple2!2475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2547 (v!2984 (underlying!385 thiss!992)))))))

(assert (=> b!114191 (= lt!59375 (+!159 lt!59374 lt!59369))))

(assert (=> b!114191 (= lt!59369 (tuple2!2475 (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355) lt!59378))))

(declare-fun lt!59377 () Unit!3565)

(assert (=> b!114191 (= lt!59377 (addCommutativeForDiffKeys!71 lt!59374 (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355) lt!59378 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2547 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!125 (array!4455 array!4457 (_ BitVec 32) (_ BitVec 32) V!3283 V!3283 (_ BitVec 32) Int) ListLongMap!1611)

(assert (=> b!114191 (= lt!59374 (getCurrentListMapNoExtraKeys!125 (_keys!4402 (v!2984 (underlying!385 thiss!992))) (_values!2663 (v!2984 (underlying!385 thiss!992))) (mask!6874 (v!2984 (underlying!385 thiss!992))) (extraKeys!2469 (v!2984 (underlying!385 thiss!992))) (zeroValue!2547 (v!2984 (underlying!385 thiss!992))) (minValue!2547 (v!2984 (underlying!385 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2680 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun b!114192 () Bool)

(declare-fun res!56217 () Bool)

(assert (=> b!114192 (=> (not res!56217) (not e!74269))))

(assert (=> b!114192 (= res!56217 (valid!445 newMap!16))))

(declare-fun e!74275 () Bool)

(declare-fun array_inv!1327 (array!4455) Bool)

(declare-fun array_inv!1328 (array!4457) Bool)

(assert (=> b!114193 (= e!74280 (and tp!10221 tp_is_empty!2727 (array_inv!1327 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) (array_inv!1328 (_values!2663 (v!2984 (underlying!385 thiss!992)))) e!74275))))

(declare-fun mapIsEmpty!4110 () Bool)

(assert (=> mapIsEmpty!4110 mapRes!4109))

(declare-fun mapNonEmpty!4110 () Bool)

(declare-fun tp!10222 () Bool)

(declare-fun e!74282 () Bool)

(assert (=> mapNonEmpty!4110 (= mapRes!4110 (and tp!10222 e!74282))))

(declare-fun mapRest!4109 () (Array (_ BitVec 32) ValueCell!1020))

(declare-fun mapValue!4109 () ValueCell!1020)

(declare-fun mapKey!4110 () (_ BitVec 32))

(assert (=> mapNonEmpty!4110 (= (arr!2112 (_values!2663 newMap!16)) (store mapRest!4109 mapKey!4110 mapValue!4109))))

(declare-fun res!56215 () Bool)

(assert (=> start!13072 (=> (not res!56215) (not e!74269))))

(declare-fun valid!446 (LongMap!748) Bool)

(assert (=> start!13072 (= res!56215 (valid!446 thiss!992))))

(assert (=> start!13072 e!74269))

(assert (=> start!13072 e!74274))

(assert (=> start!13072 true))

(declare-fun e!74273 () Bool)

(assert (=> start!13072 e!74273))

(declare-fun b!114187 () Bool)

(declare-fun Unit!3567 () Unit!3565)

(assert (=> b!114187 (= e!74268 Unit!3567)))

(declare-fun b!114194 () Bool)

(assert (=> b!114194 (= e!74267 tp_is_empty!2727)))

(declare-fun b!114195 () Bool)

(assert (=> b!114195 (= e!74282 tp_is_empty!2727)))

(declare-fun b!114196 () Bool)

(declare-fun e!74271 () Bool)

(assert (=> b!114196 (= e!74271 (and e!74281 mapRes!4110))))

(declare-fun condMapEmpty!4109 () Bool)

(declare-fun mapDefault!4110 () ValueCell!1020)

(assert (=> b!114196 (= condMapEmpty!4109 (= (arr!2112 (_values!2663 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1020)) mapDefault!4110)))))

(assert (=> b!114197 (= e!74273 (and tp!10223 tp_is_empty!2727 (array_inv!1327 (_keys!4402 newMap!16)) (array_inv!1328 (_values!2663 newMap!16)) e!74271))))

(declare-fun b!114198 () Bool)

(declare-fun Unit!3568 () Unit!3565)

(assert (=> b!114198 (= e!74268 Unit!3568)))

(declare-fun lt!59383 () Unit!3565)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!119 (array!4455 array!4457 (_ BitVec 32) (_ BitVec 32) V!3283 V!3283 (_ BitVec 64) (_ BitVec 32) Int) Unit!3565)

(assert (=> b!114198 (= lt!59383 (lemmaListMapContainsThenArrayContainsFrom!119 (_keys!4402 (v!2984 (underlying!385 thiss!992))) (_values!2663 (v!2984 (underlying!385 thiss!992))) (mask!6874 (v!2984 (underlying!385 thiss!992))) (extraKeys!2469 (v!2984 (underlying!385 thiss!992))) (zeroValue!2547 (v!2984 (underlying!385 thiss!992))) (minValue!2547 (v!2984 (underlying!385 thiss!992))) (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2680 (v!2984 (underlying!385 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114198 (arrayContainsKey!0 (_keys!4402 (v!2984 (underlying!385 thiss!992))) (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59371 () Unit!3565)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4455 (_ BitVec 32) (_ BitVec 32)) Unit!3565)

(assert (=> b!114198 (= lt!59371 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4402 (v!2984 (underlying!385 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1650 0))(
  ( (Nil!1647) (Cons!1646 (h!2246 (_ BitVec 64)) (t!5864 List!1650)) )
))
(declare-fun arrayNoDuplicates!0 (array!4455 (_ BitVec 32) List!1650) Bool)

(assert (=> b!114198 (arrayNoDuplicates!0 (_keys!4402 (v!2984 (underlying!385 thiss!992))) from!355 Nil!1647)))

(declare-fun lt!59367 () Unit!3565)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4455 (_ BitVec 32) (_ BitVec 64) List!1650) Unit!3565)

(assert (=> b!114198 (= lt!59367 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4402 (v!2984 (underlying!385 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355) (Cons!1646 (select (arr!2111 (_keys!4402 (v!2984 (underlying!385 thiss!992)))) from!355) Nil!1647)))))

(assert (=> b!114198 false))

(declare-fun b!114199 () Bool)

(declare-fun e!74270 () Bool)

(assert (=> b!114199 (= e!74270 tp_is_empty!2727)))

(declare-fun b!114200 () Bool)

(declare-fun res!56221 () Bool)

(assert (=> b!114200 (=> (not res!56221) (not e!74269))))

(assert (=> b!114200 (= res!56221 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2371 (_keys!4402 (v!2984 (underlying!385 thiss!992)))))))))

(declare-fun b!114201 () Bool)

(assert (=> b!114201 (= e!74275 (and e!74270 mapRes!4109))))

(declare-fun condMapEmpty!4110 () Bool)

(declare-fun mapDefault!4109 () ValueCell!1020)

(assert (=> b!114201 (= condMapEmpty!4110 (= (arr!2112 (_values!2663 (v!2984 (underlying!385 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1020)) mapDefault!4109)))))

(assert (= (and start!13072 res!56215) b!114200))

(assert (= (and b!114200 res!56221) b!114192))

(assert (= (and b!114192 res!56217) b!114186))

(assert (= (and b!114186 res!56220) b!114184))

(assert (= (and b!114184 res!56216) b!114188))

(assert (= (and b!114188 res!56219) b!114185))

(assert (= (and b!114185 c!20417) b!114198))

(assert (= (and b!114185 (not c!20417)) b!114187))

(assert (= (and b!114185 res!56218) b!114191))

(assert (= (and b!114201 condMapEmpty!4110) mapIsEmpty!4110))

(assert (= (and b!114201 (not condMapEmpty!4110)) mapNonEmpty!4109))

(get-info :version)

(assert (= (and mapNonEmpty!4109 ((_ is ValueCellFull!1020) mapValue!4110)) b!114194))

(assert (= (and b!114201 ((_ is ValueCellFull!1020) mapDefault!4109)) b!114199))

(assert (= b!114193 b!114201))

(assert (= b!114183 b!114193))

(assert (= b!114189 b!114183))

(assert (= start!13072 b!114189))

(assert (= (and b!114196 condMapEmpty!4109) mapIsEmpty!4109))

(assert (= (and b!114196 (not condMapEmpty!4109)) mapNonEmpty!4110))

(assert (= (and mapNonEmpty!4110 ((_ is ValueCellFull!1020) mapValue!4109)) b!114195))

(assert (= (and b!114196 ((_ is ValueCellFull!1020) mapDefault!4110)) b!114190))

(assert (= b!114197 b!114196))

(assert (= start!13072 b!114197))

(declare-fun b_lambda!5107 () Bool)

(assert (=> (not b_lambda!5107) (not b!114188)))

(declare-fun t!5860 () Bool)

(declare-fun tb!2177 () Bool)

(assert (=> (and b!114193 (= (defaultEntry!2680 (v!2984 (underlying!385 thiss!992))) (defaultEntry!2680 (v!2984 (underlying!385 thiss!992)))) t!5860) tb!2177))

(declare-fun result!3635 () Bool)

(assert (=> tb!2177 (= result!3635 tp_is_empty!2727)))

(assert (=> b!114188 t!5860))

(declare-fun b_and!7039 () Bool)

(assert (= b_and!7035 (and (=> t!5860 result!3635) b_and!7039)))

(declare-fun t!5862 () Bool)

(declare-fun tb!2179 () Bool)

(assert (=> (and b!114197 (= (defaultEntry!2680 newMap!16) (defaultEntry!2680 (v!2984 (underlying!385 thiss!992)))) t!5862) tb!2179))

(declare-fun result!3639 () Bool)

(assert (= result!3639 result!3635))

(assert (=> b!114188 t!5862))

(declare-fun b_and!7041 () Bool)

(assert (= b_and!7037 (and (=> t!5862 result!3639) b_and!7041)))

(declare-fun m!130537 () Bool)

(assert (=> mapNonEmpty!4110 m!130537))

(declare-fun m!130539 () Bool)

(assert (=> b!114192 m!130539))

(declare-fun m!130541 () Bool)

(assert (=> start!13072 m!130541))

(declare-fun m!130543 () Bool)

(assert (=> mapNonEmpty!4109 m!130543))

(declare-fun m!130545 () Bool)

(assert (=> b!114198 m!130545))

(declare-fun m!130547 () Bool)

(assert (=> b!114198 m!130547))

(declare-fun m!130549 () Bool)

(assert (=> b!114198 m!130549))

(declare-fun m!130551 () Bool)

(assert (=> b!114198 m!130551))

(assert (=> b!114198 m!130549))

(assert (=> b!114198 m!130549))

(declare-fun m!130553 () Bool)

(assert (=> b!114198 m!130553))

(assert (=> b!114198 m!130549))

(declare-fun m!130555 () Bool)

(assert (=> b!114198 m!130555))

(assert (=> b!114185 m!130549))

(assert (=> b!114185 m!130549))

(declare-fun m!130557 () Bool)

(assert (=> b!114185 m!130557))

(assert (=> b!114185 m!130549))

(declare-fun m!130559 () Bool)

(assert (=> b!114185 m!130559))

(declare-fun m!130561 () Bool)

(assert (=> b!114191 m!130561))

(assert (=> b!114191 m!130549))

(declare-fun m!130563 () Bool)

(assert (=> b!114191 m!130563))

(assert (=> b!114191 m!130561))

(declare-fun m!130565 () Bool)

(assert (=> b!114191 m!130565))

(declare-fun m!130567 () Bool)

(assert (=> b!114191 m!130567))

(assert (=> b!114191 m!130549))

(declare-fun m!130569 () Bool)

(assert (=> b!114191 m!130569))

(assert (=> b!114191 m!130549))

(declare-fun m!130571 () Bool)

(assert (=> b!114191 m!130571))

(declare-fun m!130573 () Bool)

(assert (=> b!114191 m!130573))

(declare-fun m!130575 () Bool)

(assert (=> b!114191 m!130575))

(declare-fun m!130577 () Bool)

(assert (=> b!114191 m!130577))

(declare-fun m!130579 () Bool)

(assert (=> b!114191 m!130579))

(declare-fun m!130581 () Bool)

(assert (=> b!114191 m!130581))

(declare-fun m!130583 () Bool)

(assert (=> b!114197 m!130583))

(declare-fun m!130585 () Bool)

(assert (=> b!114197 m!130585))

(assert (=> b!114188 m!130549))

(declare-fun m!130587 () Bool)

(assert (=> b!114188 m!130587))

(declare-fun m!130589 () Bool)

(assert (=> b!114188 m!130589))

(assert (=> b!114188 m!130587))

(assert (=> b!114188 m!130589))

(declare-fun m!130591 () Bool)

(assert (=> b!114188 m!130591))

(declare-fun m!130593 () Bool)

(assert (=> b!114193 m!130593))

(declare-fun m!130595 () Bool)

(assert (=> b!114193 m!130595))

(declare-fun m!130597 () Bool)

(assert (=> b!114184 m!130597))

(declare-fun m!130599 () Bool)

(assert (=> b!114184 m!130599))

(check-sat (not b_next!2621) tp_is_empty!2727 (not start!13072) (not b!114192) (not b_next!2623) (not b!114193) (not b!114184) b_and!7041 (not b_lambda!5107) (not b!114197) (not mapNonEmpty!4109) b_and!7039 (not b!114185) (not mapNonEmpty!4110) (not b!114191) (not b!114188) (not b!114198))
(check-sat b_and!7039 b_and!7041 (not b_next!2621) (not b_next!2623))
