; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11316 () Bool)

(assert start!11316)

(declare-fun b!93420 () Bool)

(declare-fun b_free!2377 () Bool)

(declare-fun b_next!2377 () Bool)

(assert (=> b!93420 (= b_free!2377 (not b_next!2377))))

(declare-fun tp!9395 () Bool)

(declare-fun b_and!5689 () Bool)

(assert (=> b!93420 (= tp!9395 b_and!5689)))

(declare-fun b!93427 () Bool)

(declare-fun b_free!2379 () Bool)

(declare-fun b_next!2379 () Bool)

(assert (=> b!93427 (= b_free!2379 (not b_next!2379))))

(declare-fun tp!9396 () Bool)

(declare-fun b_and!5691 () Bool)

(assert (=> b!93427 (= tp!9396 b_and!5691)))

(declare-fun mapNonEmpty!3647 () Bool)

(declare-fun mapRes!3648 () Bool)

(declare-fun tp!9393 () Bool)

(declare-fun e!60974 () Bool)

(assert (=> mapNonEmpty!3647 (= mapRes!3648 (and tp!9393 e!60974))))

(declare-fun mapKey!3647 () (_ BitVec 32))

(declare-datatypes ((V!3121 0))(
  ( (V!3122 (val!1347 Int)) )
))
(declare-datatypes ((array!4163 0))(
  ( (array!4164 (arr!1978 (Array (_ BitVec 32) (_ BitVec 64))) (size!2227 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!959 0))(
  ( (ValueCellFull!959 (v!2745 V!3121)) (EmptyCell!959) )
))
(declare-datatypes ((array!4165 0))(
  ( (array!4166 (arr!1979 (Array (_ BitVec 32) ValueCell!959)) (size!2228 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!826 0))(
  ( (LongMapFixedSize!827 (defaultEntry!2430 Int) (mask!6501 (_ BitVec 32)) (extraKeys!2259 (_ BitVec 32)) (zeroValue!2317 V!3121) (minValue!2317 V!3121) (_size!462 (_ BitVec 32)) (_keys!4111 array!4163) (_values!2413 array!4165) (_vacant!462 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!826)

(declare-fun mapValue!3647 () ValueCell!959)

(declare-fun mapRest!3648 () (Array (_ BitVec 32) ValueCell!959))

(assert (=> mapNonEmpty!3647 (= (arr!1979 (_values!2413 newMap!16)) (store mapRest!3648 mapKey!3647 mapValue!3647))))

(declare-fun b!93411 () Bool)

(declare-fun e!60978 () Bool)

(declare-fun e!60977 () Bool)

(assert (=> b!93411 (= e!60978 e!60977)))

(declare-fun res!47413 () Bool)

(assert (=> b!93411 (=> (not res!47413) (not e!60977))))

(declare-datatypes ((tuple2!2292 0))(
  ( (tuple2!2293 (_1!1157 Bool) (_2!1157 LongMapFixedSize!826)) )
))
(declare-fun lt!46231 () tuple2!2292)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!93411 (= res!47413 (and (_1!1157 lt!46231) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2789 0))(
  ( (Unit!2790) )
))
(declare-fun lt!46230 () Unit!2789)

(declare-fun e!60981 () Unit!2789)

(assert (=> b!93411 (= lt!46230 e!60981)))

(declare-datatypes ((tuple2!2294 0))(
  ( (tuple2!2295 (_1!1158 (_ BitVec 64)) (_2!1158 V!3121)) )
))
(declare-datatypes ((List!1570 0))(
  ( (Nil!1567) (Cons!1566 (h!2158 tuple2!2294) (t!5451 List!1570)) )
))
(declare-datatypes ((ListLongMap!1495 0))(
  ( (ListLongMap!1496 (toList!763 List!1570)) )
))
(declare-fun lt!46232 () ListLongMap!1495)

(declare-datatypes ((Cell!618 0))(
  ( (Cell!619 (v!2746 LongMapFixedSize!826)) )
))
(declare-datatypes ((LongMap!618 0))(
  ( (LongMap!619 (underlying!320 Cell!618)) )
))
(declare-fun thiss!992 () LongMap!618)

(declare-fun c!15543 () Bool)

(declare-fun contains!783 (ListLongMap!1495 (_ BitVec 64)) Bool)

(assert (=> b!93411 (= c!15543 (contains!783 lt!46232 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(declare-fun update!139 (LongMapFixedSize!826 (_ BitVec 64) V!3121) tuple2!2292)

(declare-fun get!1261 (ValueCell!959 V!3121) V!3121)

(declare-fun dynLambda!362 (Int (_ BitVec 64)) V!3121)

(assert (=> b!93411 (= lt!46231 (update!139 newMap!16 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!93412 () Bool)

(declare-fun e!60979 () Bool)

(declare-fun e!60982 () Bool)

(assert (=> b!93412 (= e!60979 (and e!60982 mapRes!3648))))

(declare-fun condMapEmpty!3648 () Bool)

(declare-fun mapDefault!3648 () ValueCell!959)

(assert (=> b!93412 (= condMapEmpty!3648 (= (arr!1979 (_values!2413 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!959)) mapDefault!3648)))))

(declare-fun b!93413 () Bool)

(declare-fun e!60983 () Bool)

(declare-fun e!60973 () Bool)

(declare-fun mapRes!3647 () Bool)

(assert (=> b!93413 (= e!60983 (and e!60973 mapRes!3647))))

(declare-fun condMapEmpty!3647 () Bool)

(declare-fun mapDefault!3647 () ValueCell!959)

(assert (=> b!93413 (= condMapEmpty!3647 (= (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!959)) mapDefault!3647)))))

(declare-fun b!93414 () Bool)

(declare-fun e!60971 () Bool)

(declare-fun e!60976 () Bool)

(assert (=> b!93414 (= e!60971 e!60976)))

(declare-fun res!47411 () Bool)

(declare-fun e!60972 () Bool)

(assert (=> start!11316 (=> (not res!47411) (not e!60972))))

(declare-fun valid!378 (LongMap!618) Bool)

(assert (=> start!11316 (= res!47411 (valid!378 thiss!992))))

(assert (=> start!11316 e!60972))

(declare-fun e!60984 () Bool)

(assert (=> start!11316 e!60984))

(assert (=> start!11316 true))

(declare-fun e!60980 () Bool)

(assert (=> start!11316 e!60980))

(declare-fun b!93415 () Bool)

(declare-fun Unit!2791 () Unit!2789)

(assert (=> b!93415 (= e!60981 Unit!2791)))

(declare-fun b!93416 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!93416 (= e!60977 (not (validMask!0 (mask!6501 (v!2746 (underlying!320 thiss!992))))))))

(declare-fun mapNonEmpty!3648 () Bool)

(declare-fun tp!9394 () Bool)

(declare-fun e!60970 () Bool)

(assert (=> mapNonEmpty!3648 (= mapRes!3647 (and tp!9394 e!60970))))

(declare-fun mapValue!3648 () ValueCell!959)

(declare-fun mapRest!3647 () (Array (_ BitVec 32) ValueCell!959))

(declare-fun mapKey!3648 () (_ BitVec 32))

(assert (=> mapNonEmpty!3648 (= (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) (store mapRest!3647 mapKey!3648 mapValue!3648))))

(declare-fun b!93417 () Bool)

(declare-fun tp_is_empty!2605 () Bool)

(assert (=> b!93417 (= e!60973 tp_is_empty!2605)))

(declare-fun b!93418 () Bool)

(assert (=> b!93418 (= e!60972 e!60978)))

(declare-fun res!47410 () Bool)

(assert (=> b!93418 (=> (not res!47410) (not e!60978))))

(declare-fun lt!46228 () ListLongMap!1495)

(assert (=> b!93418 (= res!47410 (and (= lt!46228 lt!46232) (not (= (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1228 (LongMapFixedSize!826) ListLongMap!1495)

(assert (=> b!93418 (= lt!46232 (map!1228 newMap!16))))

(declare-fun getCurrentListMap!446 (array!4163 array!4165 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 32) Int) ListLongMap!1495)

(assert (=> b!93418 (= lt!46228 (getCurrentListMap!446 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (_values!2413 (v!2746 (underlying!320 thiss!992))) (mask!6501 (v!2746 (underlying!320 thiss!992))) (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) (minValue!2317 (v!2746 (underlying!320 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))))))

(declare-fun b!93419 () Bool)

(declare-fun res!47412 () Bool)

(assert (=> b!93419 (=> (not res!47412) (not e!60972))))

(assert (=> b!93419 (= res!47412 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6501 newMap!16)) (_size!462 (v!2746 (underlying!320 thiss!992)))))))

(declare-fun array_inv!1237 (array!4163) Bool)

(declare-fun array_inv!1238 (array!4165) Bool)

(assert (=> b!93420 (= e!60976 (and tp!9395 tp_is_empty!2605 (array_inv!1237 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (array_inv!1238 (_values!2413 (v!2746 (underlying!320 thiss!992)))) e!60983))))

(declare-fun mapIsEmpty!3647 () Bool)

(assert (=> mapIsEmpty!3647 mapRes!3648))

(declare-fun b!93421 () Bool)

(assert (=> b!93421 (= e!60982 tp_is_empty!2605)))

(declare-fun b!93422 () Bool)

(assert (=> b!93422 (= e!60970 tp_is_empty!2605)))

(declare-fun mapIsEmpty!3648 () Bool)

(assert (=> mapIsEmpty!3648 mapRes!3647))

(declare-fun b!93423 () Bool)

(declare-fun res!47409 () Bool)

(assert (=> b!93423 (=> (not res!47409) (not e!60972))))

(declare-fun valid!379 (LongMapFixedSize!826) Bool)

(assert (=> b!93423 (= res!47409 (valid!379 newMap!16))))

(declare-fun b!93424 () Bool)

(assert (=> b!93424 (= e!60984 e!60971)))

(declare-fun b!93425 () Bool)

(declare-fun res!47414 () Bool)

(assert (=> b!93425 (=> (not res!47414) (not e!60972))))

(assert (=> b!93425 (= res!47414 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992)))))))))

(declare-fun b!93426 () Bool)

(declare-fun Unit!2792 () Unit!2789)

(assert (=> b!93426 (= e!60981 Unit!2792)))

(declare-fun lt!46227 () Unit!2789)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!88 (array!4163 array!4165 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 64) (_ BitVec 32) Int) Unit!2789)

(assert (=> b!93426 (= lt!46227 (lemmaListMapContainsThenArrayContainsFrom!88 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (_values!2413 (v!2746 (underlying!320 thiss!992))) (mask!6501 (v!2746 (underlying!320 thiss!992))) (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) (minValue!2317 (v!2746 (underlying!320 thiss!992))) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!93426 (arrayContainsKey!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!46229 () Unit!2789)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4163 (_ BitVec 32) (_ BitVec 32)) Unit!2789)

(assert (=> b!93426 (= lt!46229 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1571 0))(
  ( (Nil!1568) (Cons!1567 (h!2159 (_ BitVec 64)) (t!5452 List!1571)) )
))
(declare-fun arrayNoDuplicates!0 (array!4163 (_ BitVec 32) List!1571) Bool)

(assert (=> b!93426 (arrayNoDuplicates!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) from!355 Nil!1568)))

(declare-fun lt!46226 () Unit!2789)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4163 (_ BitVec 32) (_ BitVec 64) List!1571) Unit!2789)

(assert (=> b!93426 (= lt!46226 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (Cons!1567 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) Nil!1568)))))

(assert (=> b!93426 false))

(assert (=> b!93427 (= e!60980 (and tp!9396 tp_is_empty!2605 (array_inv!1237 (_keys!4111 newMap!16)) (array_inv!1238 (_values!2413 newMap!16)) e!60979))))

(declare-fun b!93428 () Bool)

(assert (=> b!93428 (= e!60974 tp_is_empty!2605)))

(assert (= (and start!11316 res!47411) b!93425))

(assert (= (and b!93425 res!47414) b!93423))

(assert (= (and b!93423 res!47409) b!93419))

(assert (= (and b!93419 res!47412) b!93418))

(assert (= (and b!93418 res!47410) b!93411))

(assert (= (and b!93411 c!15543) b!93426))

(assert (= (and b!93411 (not c!15543)) b!93415))

(assert (= (and b!93411 res!47413) b!93416))

(assert (= (and b!93413 condMapEmpty!3647) mapIsEmpty!3648))

(assert (= (and b!93413 (not condMapEmpty!3647)) mapNonEmpty!3648))

(get-info :version)

(assert (= (and mapNonEmpty!3648 ((_ is ValueCellFull!959) mapValue!3648)) b!93422))

(assert (= (and b!93413 ((_ is ValueCellFull!959) mapDefault!3647)) b!93417))

(assert (= b!93420 b!93413))

(assert (= b!93414 b!93420))

(assert (= b!93424 b!93414))

(assert (= start!11316 b!93424))

(assert (= (and b!93412 condMapEmpty!3648) mapIsEmpty!3647))

(assert (= (and b!93412 (not condMapEmpty!3648)) mapNonEmpty!3647))

(assert (= (and mapNonEmpty!3647 ((_ is ValueCellFull!959) mapValue!3647)) b!93428))

(assert (= (and b!93412 ((_ is ValueCellFull!959) mapDefault!3648)) b!93421))

(assert (= b!93427 b!93412))

(assert (= start!11316 b!93427))

(declare-fun b_lambda!4119 () Bool)

(assert (=> (not b_lambda!4119) (not b!93411)))

(declare-fun t!5448 () Bool)

(declare-fun tb!1849 () Bool)

(assert (=> (and b!93420 (= (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))) t!5448) tb!1849))

(declare-fun result!3157 () Bool)

(assert (=> tb!1849 (= result!3157 tp_is_empty!2605)))

(assert (=> b!93411 t!5448))

(declare-fun b_and!5693 () Bool)

(assert (= b_and!5689 (and (=> t!5448 result!3157) b_and!5693)))

(declare-fun t!5450 () Bool)

(declare-fun tb!1851 () Bool)

(assert (=> (and b!93427 (= (defaultEntry!2430 newMap!16) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))) t!5450) tb!1851))

(declare-fun result!3161 () Bool)

(assert (= result!3161 result!3157))

(assert (=> b!93411 t!5450))

(declare-fun b_and!5695 () Bool)

(assert (= b_and!5691 (and (=> t!5450 result!3161) b_and!5695)))

(declare-fun m!100685 () Bool)

(assert (=> b!93423 m!100685))

(declare-fun m!100687 () Bool)

(assert (=> b!93416 m!100687))

(declare-fun m!100689 () Bool)

(assert (=> b!93418 m!100689))

(declare-fun m!100691 () Bool)

(assert (=> b!93418 m!100691))

(declare-fun m!100693 () Bool)

(assert (=> b!93418 m!100693))

(declare-fun m!100695 () Bool)

(assert (=> start!11316 m!100695))

(declare-fun m!100697 () Bool)

(assert (=> mapNonEmpty!3648 m!100697))

(declare-fun m!100699 () Bool)

(assert (=> b!93427 m!100699))

(declare-fun m!100701 () Bool)

(assert (=> b!93427 m!100701))

(declare-fun m!100703 () Bool)

(assert (=> b!93411 m!100703))

(declare-fun m!100705 () Bool)

(assert (=> b!93411 m!100705))

(declare-fun m!100707 () Bool)

(assert (=> b!93411 m!100707))

(assert (=> b!93411 m!100689))

(assert (=> b!93411 m!100705))

(assert (=> b!93411 m!100689))

(declare-fun m!100709 () Bool)

(assert (=> b!93411 m!100709))

(assert (=> b!93411 m!100689))

(assert (=> b!93411 m!100707))

(declare-fun m!100711 () Bool)

(assert (=> b!93411 m!100711))

(assert (=> b!93411 m!100703))

(declare-fun m!100713 () Bool)

(assert (=> mapNonEmpty!3647 m!100713))

(declare-fun m!100715 () Bool)

(assert (=> b!93420 m!100715))

(declare-fun m!100717 () Bool)

(assert (=> b!93420 m!100717))

(declare-fun m!100719 () Bool)

(assert (=> b!93426 m!100719))

(declare-fun m!100721 () Bool)

(assert (=> b!93426 m!100721))

(assert (=> b!93426 m!100689))

(declare-fun m!100723 () Bool)

(assert (=> b!93426 m!100723))

(assert (=> b!93426 m!100689))

(assert (=> b!93426 m!100689))

(declare-fun m!100725 () Bool)

(assert (=> b!93426 m!100725))

(assert (=> b!93426 m!100689))

(declare-fun m!100727 () Bool)

(assert (=> b!93426 m!100727))

(check-sat (not b!93426) b_and!5695 (not b!93411) (not b!93423) b_and!5693 (not b_lambda!4119) (not b!93416) (not b!93427) (not b!93420) (not start!11316) (not b_next!2379) (not mapNonEmpty!3648) (not mapNonEmpty!3647) (not b!93418) tp_is_empty!2605 (not b_next!2377))
(check-sat b_and!5693 b_and!5695 (not b_next!2377) (not b_next!2379))
(get-model)

(declare-fun b_lambda!4125 () Bool)

(assert (= b_lambda!4119 (or (and b!93420 b_free!2377) (and b!93427 b_free!2379 (= (defaultEntry!2430 newMap!16) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))))) b_lambda!4125)))

(check-sat b_and!5695 (not b!93411) (not b!93423) b_and!5693 (not b!93416) (not b!93426) (not b_lambda!4125) (not b!93427) (not b!93420) (not start!11316) (not b_next!2379) (not mapNonEmpty!3648) (not mapNonEmpty!3647) (not b!93418) tp_is_empty!2605 (not b_next!2377))
(check-sat b_and!5693 b_and!5695 (not b_next!2377) (not b_next!2379))
(get-model)

(declare-fun d!24479 () Bool)

(assert (=> d!24479 (= (array_inv!1237 (_keys!4111 newMap!16)) (bvsge (size!2227 (_keys!4111 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!93427 d!24479))

(declare-fun d!24481 () Bool)

(assert (=> d!24481 (= (array_inv!1238 (_values!2413 newMap!16)) (bvsge (size!2228 (_values!2413 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!93427 d!24481))

(declare-fun d!24483 () Bool)

(assert (=> d!24483 (= (map!1228 newMap!16) (getCurrentListMap!446 (_keys!4111 newMap!16) (_values!2413 newMap!16) (mask!6501 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2430 newMap!16)))))

(declare-fun bs!3849 () Bool)

(assert (= bs!3849 d!24483))

(declare-fun m!100817 () Bool)

(assert (=> bs!3849 m!100817))

(assert (=> b!93418 d!24483))

(declare-fun b!93585 () Bool)

(declare-fun e!61117 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!93585 (= e!61117 (validKeyInArray!0 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93586 () Bool)

(declare-fun e!61112 () ListLongMap!1495)

(declare-fun call!9270 () ListLongMap!1495)

(declare-fun +!125 (ListLongMap!1495 tuple2!2294) ListLongMap!1495)

(assert (=> b!93586 (= e!61112 (+!125 call!9270 (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2317 (v!2746 (underlying!320 thiss!992))))))))

(declare-fun b!93587 () Bool)

(declare-fun res!47476 () Bool)

(declare-fun e!61111 () Bool)

(assert (=> b!93587 (=> (not res!47476) (not e!61111))))

(declare-fun e!61108 () Bool)

(assert (=> b!93587 (= res!47476 e!61108)))

(declare-fun res!47474 () Bool)

(assert (=> b!93587 (=> res!47474 e!61108)))

(assert (=> b!93587 (= res!47474 (not e!61117))))

(declare-fun res!47477 () Bool)

(assert (=> b!93587 (=> (not res!47477) (not e!61117))))

(assert (=> b!93587 (= res!47477 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992))))))))

(declare-fun b!93588 () Bool)

(declare-fun e!61114 () Bool)

(assert (=> b!93588 (= e!61111 e!61114)))

(declare-fun c!15565 () Bool)

(assert (=> b!93588 (= c!15565 (not (= (bvand (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93589 () Bool)

(declare-fun e!61120 () Bool)

(declare-fun e!61119 () Bool)

(assert (=> b!93589 (= e!61120 e!61119)))

(declare-fun res!47475 () Bool)

(declare-fun call!9274 () Bool)

(assert (=> b!93589 (= res!47475 call!9274)))

(assert (=> b!93589 (=> (not res!47475) (not e!61119))))

(declare-fun b!93590 () Bool)

(declare-fun e!61110 () Bool)

(assert (=> b!93590 (= e!61110 (validKeyInArray!0 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!9266 () Bool)

(declare-fun call!9273 () ListLongMap!1495)

(declare-fun getCurrentListMapNoExtraKeys!89 (array!4163 array!4165 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 32) Int) ListLongMap!1495)

(assert (=> bm!9266 (= call!9273 (getCurrentListMapNoExtraKeys!89 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (_values!2413 (v!2746 (underlying!320 thiss!992))) (mask!6501 (v!2746 (underlying!320 thiss!992))) (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) (minValue!2317 (v!2746 (underlying!320 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))))))

(declare-fun b!93591 () Bool)

(declare-fun e!61115 () ListLongMap!1495)

(assert (=> b!93591 (= e!61112 e!61115)))

(declare-fun c!15563 () Bool)

(assert (=> b!93591 (= c!15563 (and (not (= (bvand (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9267 () Bool)

(declare-fun call!9275 () Bool)

(declare-fun lt!46339 () ListLongMap!1495)

(assert (=> bm!9267 (= call!9275 (contains!783 lt!46339 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93592 () Bool)

(assert (=> b!93592 (= e!61114 (not call!9275))))

(declare-fun b!93593 () Bool)

(assert (=> b!93593 (= e!61120 (not call!9274))))

(declare-fun b!93594 () Bool)

(declare-fun res!47469 () Bool)

(assert (=> b!93594 (=> (not res!47469) (not e!61111))))

(assert (=> b!93594 (= res!47469 e!61120)))

(declare-fun c!15566 () Bool)

(assert (=> b!93594 (= c!15566 (not (= (bvand (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!9268 () Bool)

(assert (=> bm!9268 (= call!9274 (contains!783 lt!46339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93596 () Bool)

(declare-fun e!61118 () ListLongMap!1495)

(declare-fun call!9269 () ListLongMap!1495)

(assert (=> b!93596 (= e!61118 call!9269)))

(declare-fun bm!9269 () Bool)

(declare-fun call!9272 () ListLongMap!1495)

(assert (=> bm!9269 (= call!9269 call!9272)))

(declare-fun b!93597 () Bool)

(declare-fun c!15562 () Bool)

(assert (=> b!93597 (= c!15562 (and (not (= (bvand (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!93597 (= e!61115 e!61118)))

(declare-fun b!93598 () Bool)

(declare-fun e!61109 () Bool)

(declare-fun apply!89 (ListLongMap!1495 (_ BitVec 64)) V!3121)

(assert (=> b!93598 (= e!61109 (= (apply!89 lt!46339 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2317 (v!2746 (underlying!320 thiss!992)))))))

(declare-fun b!93599 () Bool)

(assert (=> b!93599 (= e!61114 e!61109)))

(declare-fun res!47473 () Bool)

(assert (=> b!93599 (= res!47473 call!9275)))

(assert (=> b!93599 (=> (not res!47473) (not e!61109))))

(declare-fun bm!9270 () Bool)

(assert (=> bm!9270 (= call!9272 call!9273)))

(declare-fun b!93600 () Bool)

(declare-fun call!9271 () ListLongMap!1495)

(assert (=> b!93600 (= e!61115 call!9271)))

(declare-fun c!15567 () Bool)

(declare-fun bm!9271 () Bool)

(assert (=> bm!9271 (= call!9270 (+!125 (ite c!15567 call!9273 (ite c!15563 call!9272 call!9269)) (ite (or c!15567 c!15563) (tuple2!2295 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2317 (v!2746 (underlying!320 thiss!992)))) (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2317 (v!2746 (underlying!320 thiss!992)))))))))

(declare-fun b!93601 () Bool)

(declare-fun e!61113 () Unit!2789)

(declare-fun lt!46337 () Unit!2789)

(assert (=> b!93601 (= e!61113 lt!46337)))

(declare-fun lt!46340 () ListLongMap!1495)

(assert (=> b!93601 (= lt!46340 (getCurrentListMapNoExtraKeys!89 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (_values!2413 (v!2746 (underlying!320 thiss!992))) (mask!6501 (v!2746 (underlying!320 thiss!992))) (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) (minValue!2317 (v!2746 (underlying!320 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))))))

(declare-fun lt!46323 () (_ BitVec 64))

(assert (=> b!93601 (= lt!46323 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46327 () (_ BitVec 64))

(assert (=> b!93601 (= lt!46327 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46332 () Unit!2789)

(declare-fun addStillContains!65 (ListLongMap!1495 (_ BitVec 64) V!3121 (_ BitVec 64)) Unit!2789)

(assert (=> b!93601 (= lt!46332 (addStillContains!65 lt!46340 lt!46323 (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) lt!46327))))

(assert (=> b!93601 (contains!783 (+!125 lt!46340 (tuple2!2295 lt!46323 (zeroValue!2317 (v!2746 (underlying!320 thiss!992))))) lt!46327)))

(declare-fun lt!46338 () Unit!2789)

(assert (=> b!93601 (= lt!46338 lt!46332)))

(declare-fun lt!46331 () ListLongMap!1495)

(assert (=> b!93601 (= lt!46331 (getCurrentListMapNoExtraKeys!89 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (_values!2413 (v!2746 (underlying!320 thiss!992))) (mask!6501 (v!2746 (underlying!320 thiss!992))) (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) (minValue!2317 (v!2746 (underlying!320 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))))))

(declare-fun lt!46324 () (_ BitVec 64))

(assert (=> b!93601 (= lt!46324 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46335 () (_ BitVec 64))

(assert (=> b!93601 (= lt!46335 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46321 () Unit!2789)

(declare-fun addApplyDifferent!65 (ListLongMap!1495 (_ BitVec 64) V!3121 (_ BitVec 64)) Unit!2789)

(assert (=> b!93601 (= lt!46321 (addApplyDifferent!65 lt!46331 lt!46324 (minValue!2317 (v!2746 (underlying!320 thiss!992))) lt!46335))))

(assert (=> b!93601 (= (apply!89 (+!125 lt!46331 (tuple2!2295 lt!46324 (minValue!2317 (v!2746 (underlying!320 thiss!992))))) lt!46335) (apply!89 lt!46331 lt!46335))))

(declare-fun lt!46334 () Unit!2789)

(assert (=> b!93601 (= lt!46334 lt!46321)))

(declare-fun lt!46325 () ListLongMap!1495)

(assert (=> b!93601 (= lt!46325 (getCurrentListMapNoExtraKeys!89 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (_values!2413 (v!2746 (underlying!320 thiss!992))) (mask!6501 (v!2746 (underlying!320 thiss!992))) (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) (minValue!2317 (v!2746 (underlying!320 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))))))

(declare-fun lt!46320 () (_ BitVec 64))

(assert (=> b!93601 (= lt!46320 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46336 () (_ BitVec 64))

(assert (=> b!93601 (= lt!46336 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46319 () Unit!2789)

(assert (=> b!93601 (= lt!46319 (addApplyDifferent!65 lt!46325 lt!46320 (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) lt!46336))))

(assert (=> b!93601 (= (apply!89 (+!125 lt!46325 (tuple2!2295 lt!46320 (zeroValue!2317 (v!2746 (underlying!320 thiss!992))))) lt!46336) (apply!89 lt!46325 lt!46336))))

(declare-fun lt!46333 () Unit!2789)

(assert (=> b!93601 (= lt!46333 lt!46319)))

(declare-fun lt!46326 () ListLongMap!1495)

(assert (=> b!93601 (= lt!46326 (getCurrentListMapNoExtraKeys!89 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (_values!2413 (v!2746 (underlying!320 thiss!992))) (mask!6501 (v!2746 (underlying!320 thiss!992))) (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) (minValue!2317 (v!2746 (underlying!320 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))))))

(declare-fun lt!46322 () (_ BitVec 64))

(assert (=> b!93601 (= lt!46322 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46330 () (_ BitVec 64))

(assert (=> b!93601 (= lt!46330 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!93601 (= lt!46337 (addApplyDifferent!65 lt!46326 lt!46322 (minValue!2317 (v!2746 (underlying!320 thiss!992))) lt!46330))))

(assert (=> b!93601 (= (apply!89 (+!125 lt!46326 (tuple2!2295 lt!46322 (minValue!2317 (v!2746 (underlying!320 thiss!992))))) lt!46330) (apply!89 lt!46326 lt!46330))))

(declare-fun b!93602 () Bool)

(declare-fun Unit!2796 () Unit!2789)

(assert (=> b!93602 (= e!61113 Unit!2796)))

(declare-fun e!61116 () Bool)

(declare-fun b!93603 () Bool)

(assert (=> b!93603 (= e!61116 (= (apply!89 lt!46339 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93603 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2228 (_values!2413 (v!2746 (underlying!320 thiss!992))))))))

(assert (=> b!93603 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992))))))))

(declare-fun bm!9272 () Bool)

(assert (=> bm!9272 (= call!9271 call!9270)))

(declare-fun b!93595 () Bool)

(assert (=> b!93595 (= e!61118 call!9271)))

(declare-fun d!24485 () Bool)

(assert (=> d!24485 e!61111))

(declare-fun res!47471 () Bool)

(assert (=> d!24485 (=> (not res!47471) (not e!61111))))

(assert (=> d!24485 (= res!47471 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992))))))))))

(declare-fun lt!46328 () ListLongMap!1495)

(assert (=> d!24485 (= lt!46339 lt!46328)))

(declare-fun lt!46329 () Unit!2789)

(assert (=> d!24485 (= lt!46329 e!61113)))

(declare-fun c!15564 () Bool)

(assert (=> d!24485 (= c!15564 e!61110)))

(declare-fun res!47470 () Bool)

(assert (=> d!24485 (=> (not res!47470) (not e!61110))))

(assert (=> d!24485 (= res!47470 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992))))))))

(assert (=> d!24485 (= lt!46328 e!61112)))

(assert (=> d!24485 (= c!15567 (and (not (= (bvand (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24485 (validMask!0 (mask!6501 (v!2746 (underlying!320 thiss!992))))))

(assert (=> d!24485 (= (getCurrentListMap!446 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (_values!2413 (v!2746 (underlying!320 thiss!992))) (mask!6501 (v!2746 (underlying!320 thiss!992))) (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) (minValue!2317 (v!2746 (underlying!320 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))) lt!46339)))

(declare-fun b!93604 () Bool)

(assert (=> b!93604 (= e!61119 (= (apply!89 lt!46339 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2317 (v!2746 (underlying!320 thiss!992)))))))

(declare-fun b!93605 () Bool)

(assert (=> b!93605 (= e!61108 e!61116)))

(declare-fun res!47472 () Bool)

(assert (=> b!93605 (=> (not res!47472) (not e!61116))))

(assert (=> b!93605 (= res!47472 (contains!783 lt!46339 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93605 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992))))))))

(assert (= (and d!24485 c!15567) b!93586))

(assert (= (and d!24485 (not c!15567)) b!93591))

(assert (= (and b!93591 c!15563) b!93600))

(assert (= (and b!93591 (not c!15563)) b!93597))

(assert (= (and b!93597 c!15562) b!93595))

(assert (= (and b!93597 (not c!15562)) b!93596))

(assert (= (or b!93595 b!93596) bm!9269))

(assert (= (or b!93600 bm!9269) bm!9270))

(assert (= (or b!93600 b!93595) bm!9272))

(assert (= (or b!93586 bm!9270) bm!9266))

(assert (= (or b!93586 bm!9272) bm!9271))

(assert (= (and d!24485 res!47470) b!93590))

(assert (= (and d!24485 c!15564) b!93601))

(assert (= (and d!24485 (not c!15564)) b!93602))

(assert (= (and d!24485 res!47471) b!93587))

(assert (= (and b!93587 res!47477) b!93585))

(assert (= (and b!93587 (not res!47474)) b!93605))

(assert (= (and b!93605 res!47472) b!93603))

(assert (= (and b!93587 res!47476) b!93594))

(assert (= (and b!93594 c!15566) b!93589))

(assert (= (and b!93594 (not c!15566)) b!93593))

(assert (= (and b!93589 res!47475) b!93604))

(assert (= (or b!93589 b!93593) bm!9268))

(assert (= (and b!93594 res!47469) b!93588))

(assert (= (and b!93588 c!15565) b!93599))

(assert (= (and b!93588 (not c!15565)) b!93592))

(assert (= (and b!93599 res!47473) b!93598))

(assert (= (or b!93599 b!93592) bm!9267))

(declare-fun b_lambda!4127 () Bool)

(assert (=> (not b_lambda!4127) (not b!93603)))

(assert (=> b!93603 t!5448))

(declare-fun b_and!5713 () Bool)

(assert (= b_and!5693 (and (=> t!5448 result!3157) b_and!5713)))

(assert (=> b!93603 t!5450))

(declare-fun b_and!5715 () Bool)

(assert (= b_and!5695 (and (=> t!5450 result!3161) b_and!5715)))

(declare-fun m!100819 () Bool)

(assert (=> b!93598 m!100819))

(declare-fun m!100821 () Bool)

(assert (=> bm!9266 m!100821))

(declare-fun m!100823 () Bool)

(assert (=> b!93603 m!100823))

(assert (=> b!93603 m!100705))

(declare-fun m!100825 () Bool)

(assert (=> b!93603 m!100825))

(assert (=> b!93603 m!100825))

(declare-fun m!100827 () Bool)

(assert (=> b!93603 m!100827))

(assert (=> b!93603 m!100823))

(assert (=> b!93603 m!100705))

(declare-fun m!100829 () Bool)

(assert (=> b!93603 m!100829))

(declare-fun m!100831 () Bool)

(assert (=> b!93601 m!100831))

(declare-fun m!100833 () Bool)

(assert (=> b!93601 m!100833))

(declare-fun m!100835 () Bool)

(assert (=> b!93601 m!100835))

(declare-fun m!100837 () Bool)

(assert (=> b!93601 m!100837))

(declare-fun m!100839 () Bool)

(assert (=> b!93601 m!100839))

(declare-fun m!100841 () Bool)

(assert (=> b!93601 m!100841))

(declare-fun m!100843 () Bool)

(assert (=> b!93601 m!100843))

(assert (=> b!93601 m!100841))

(declare-fun m!100845 () Bool)

(assert (=> b!93601 m!100845))

(assert (=> b!93601 m!100821))

(assert (=> b!93601 m!100825))

(declare-fun m!100847 () Bool)

(assert (=> b!93601 m!100847))

(declare-fun m!100849 () Bool)

(assert (=> b!93601 m!100849))

(assert (=> b!93601 m!100833))

(declare-fun m!100851 () Bool)

(assert (=> b!93601 m!100851))

(declare-fun m!100853 () Bool)

(assert (=> b!93601 m!100853))

(assert (=> b!93601 m!100853))

(declare-fun m!100855 () Bool)

(assert (=> b!93601 m!100855))

(declare-fun m!100857 () Bool)

(assert (=> b!93601 m!100857))

(declare-fun m!100859 () Bool)

(assert (=> b!93601 m!100859))

(assert (=> b!93601 m!100847))

(declare-fun m!100861 () Bool)

(assert (=> b!93586 m!100861))

(assert (=> b!93585 m!100825))

(assert (=> b!93585 m!100825))

(declare-fun m!100863 () Bool)

(assert (=> b!93585 m!100863))

(declare-fun m!100865 () Bool)

(assert (=> bm!9268 m!100865))

(assert (=> b!93590 m!100825))

(assert (=> b!93590 m!100825))

(assert (=> b!93590 m!100863))

(assert (=> d!24485 m!100687))

(declare-fun m!100867 () Bool)

(assert (=> b!93604 m!100867))

(assert (=> b!93605 m!100825))

(assert (=> b!93605 m!100825))

(declare-fun m!100869 () Bool)

(assert (=> b!93605 m!100869))

(declare-fun m!100871 () Bool)

(assert (=> bm!9267 m!100871))

(declare-fun m!100873 () Bool)

(assert (=> bm!9271 m!100873))

(assert (=> b!93418 d!24485))

(declare-fun d!24487 () Bool)

(assert (=> d!24487 (not (arrayContainsKey!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46343 () Unit!2789)

(declare-fun choose!68 (array!4163 (_ BitVec 32) (_ BitVec 64) List!1571) Unit!2789)

(assert (=> d!24487 (= lt!46343 (choose!68 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (Cons!1567 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) Nil!1568)))))

(assert (=> d!24487 (bvslt (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24487 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (Cons!1567 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) Nil!1568)) lt!46343)))

(declare-fun bs!3850 () Bool)

(assert (= bs!3850 d!24487))

(assert (=> bs!3850 m!100689))

(assert (=> bs!3850 m!100725))

(assert (=> bs!3850 m!100689))

(declare-fun m!100875 () Bool)

(assert (=> bs!3850 m!100875))

(assert (=> b!93426 d!24487))

(declare-fun d!24489 () Bool)

(assert (=> d!24489 (arrayNoDuplicates!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) from!355 Nil!1568)))

(declare-fun lt!46346 () Unit!2789)

(declare-fun choose!39 (array!4163 (_ BitVec 32) (_ BitVec 32)) Unit!2789)

(assert (=> d!24489 (= lt!46346 (choose!39 (_keys!4111 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24489 (bvslt (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24489 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000000 from!355) lt!46346)))

(declare-fun bs!3851 () Bool)

(assert (= bs!3851 d!24489))

(assert (=> bs!3851 m!100721))

(declare-fun m!100877 () Bool)

(assert (=> bs!3851 m!100877))

(assert (=> b!93426 d!24489))

(declare-fun d!24491 () Bool)

(declare-fun res!47482 () Bool)

(declare-fun e!61125 () Bool)

(assert (=> d!24491 (=> res!47482 e!61125)))

(assert (=> d!24491 (= res!47482 (= (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(assert (=> d!24491 (= (arrayContainsKey!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!61125)))

(declare-fun b!93610 () Bool)

(declare-fun e!61126 () Bool)

(assert (=> b!93610 (= e!61125 e!61126)))

(declare-fun res!47483 () Bool)

(assert (=> b!93610 (=> (not res!47483) (not e!61126))))

(assert (=> b!93610 (= res!47483 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992))))))))

(declare-fun b!93611 () Bool)

(assert (=> b!93611 (= e!61126 (arrayContainsKey!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24491 (not res!47482)) b!93610))

(assert (= (and b!93610 res!47483) b!93611))

(assert (=> d!24491 m!100825))

(assert (=> b!93611 m!100689))

(declare-fun m!100879 () Bool)

(assert (=> b!93611 m!100879))

(assert (=> b!93426 d!24491))

(declare-fun d!24493 () Bool)

(declare-fun e!61129 () Bool)

(assert (=> d!24493 e!61129))

(declare-fun c!15570 () Bool)

(assert (=> d!24493 (= c!15570 (and (not (= (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!46349 () Unit!2789)

(declare-fun choose!565 (array!4163 array!4165 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 64) (_ BitVec 32) Int) Unit!2789)

(assert (=> d!24493 (= lt!46349 (choose!565 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (_values!2413 (v!2746 (underlying!320 thiss!992))) (mask!6501 (v!2746 (underlying!320 thiss!992))) (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) (minValue!2317 (v!2746 (underlying!320 thiss!992))) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))))))

(assert (=> d!24493 (validMask!0 (mask!6501 (v!2746 (underlying!320 thiss!992))))))

(assert (=> d!24493 (= (lemmaListMapContainsThenArrayContainsFrom!88 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (_values!2413 (v!2746 (underlying!320 thiss!992))) (mask!6501 (v!2746 (underlying!320 thiss!992))) (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) (zeroValue!2317 (v!2746 (underlying!320 thiss!992))) (minValue!2317 (v!2746 (underlying!320 thiss!992))) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992)))) lt!46349)))

(declare-fun b!93616 () Bool)

(assert (=> b!93616 (= e!61129 (arrayContainsKey!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!93617 () Bool)

(assert (=> b!93617 (= e!61129 (ite (= (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2259 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24493 c!15570) b!93616))

(assert (= (and d!24493 (not c!15570)) b!93617))

(assert (=> d!24493 m!100689))

(declare-fun m!100881 () Bool)

(assert (=> d!24493 m!100881))

(assert (=> d!24493 m!100687))

(assert (=> b!93616 m!100689))

(assert (=> b!93616 m!100725))

(assert (=> b!93426 d!24493))

(declare-fun b!93628 () Bool)

(declare-fun e!61140 () Bool)

(declare-fun contains!785 (List!1571 (_ BitVec 64)) Bool)

(assert (=> b!93628 (= e!61140 (contains!785 Nil!1568 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(declare-fun d!24495 () Bool)

(declare-fun res!47490 () Bool)

(declare-fun e!61138 () Bool)

(assert (=> d!24495 (=> res!47490 e!61138)))

(assert (=> d!24495 (= res!47490 (bvsge from!355 (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992))))))))

(assert (=> d!24495 (= (arrayNoDuplicates!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) from!355 Nil!1568) e!61138)))

(declare-fun b!93629 () Bool)

(declare-fun e!61139 () Bool)

(declare-fun e!61141 () Bool)

(assert (=> b!93629 (= e!61139 e!61141)))

(declare-fun c!15573 () Bool)

(assert (=> b!93629 (= c!15573 (validKeyInArray!0 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(declare-fun call!9278 () Bool)

(declare-fun bm!9275 () Bool)

(assert (=> bm!9275 (= call!9278 (arrayNoDuplicates!0 (_keys!4111 (v!2746 (underlying!320 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15573 (Cons!1567 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) Nil!1568) Nil!1568)))))

(declare-fun b!93630 () Bool)

(assert (=> b!93630 (= e!61141 call!9278)))

(declare-fun b!93631 () Bool)

(assert (=> b!93631 (= e!61141 call!9278)))

(declare-fun b!93632 () Bool)

(assert (=> b!93632 (= e!61138 e!61139)))

(declare-fun res!47492 () Bool)

(assert (=> b!93632 (=> (not res!47492) (not e!61139))))

(assert (=> b!93632 (= res!47492 (not e!61140))))

(declare-fun res!47491 () Bool)

(assert (=> b!93632 (=> (not res!47491) (not e!61140))))

(assert (=> b!93632 (= res!47491 (validKeyInArray!0 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(assert (= (and d!24495 (not res!47490)) b!93632))

(assert (= (and b!93632 res!47491) b!93628))

(assert (= (and b!93632 res!47492) b!93629))

(assert (= (and b!93629 c!15573) b!93630))

(assert (= (and b!93629 (not c!15573)) b!93631))

(assert (= (or b!93630 b!93631) bm!9275))

(assert (=> b!93628 m!100689))

(assert (=> b!93628 m!100689))

(declare-fun m!100883 () Bool)

(assert (=> b!93628 m!100883))

(assert (=> b!93629 m!100689))

(assert (=> b!93629 m!100689))

(declare-fun m!100885 () Bool)

(assert (=> b!93629 m!100885))

(assert (=> bm!9275 m!100689))

(declare-fun m!100887 () Bool)

(assert (=> bm!9275 m!100887))

(assert (=> b!93632 m!100689))

(assert (=> b!93632 m!100689))

(assert (=> b!93632 m!100885))

(assert (=> b!93426 d!24495))

(declare-fun d!24497 () Bool)

(assert (=> d!24497 (= (valid!378 thiss!992) (valid!379 (v!2746 (underlying!320 thiss!992))))))

(declare-fun bs!3852 () Bool)

(assert (= bs!3852 d!24497))

(declare-fun m!100889 () Bool)

(assert (=> bs!3852 m!100889))

(assert (=> start!11316 d!24497))

(declare-fun d!24499 () Bool)

(declare-fun e!61146 () Bool)

(assert (=> d!24499 e!61146))

(declare-fun res!47495 () Bool)

(assert (=> d!24499 (=> res!47495 e!61146)))

(declare-fun lt!46361 () Bool)

(assert (=> d!24499 (= res!47495 (not lt!46361))))

(declare-fun lt!46358 () Bool)

(assert (=> d!24499 (= lt!46361 lt!46358)))

(declare-fun lt!46360 () Unit!2789)

(declare-fun e!61147 () Unit!2789)

(assert (=> d!24499 (= lt!46360 e!61147)))

(declare-fun c!15576 () Bool)

(assert (=> d!24499 (= c!15576 lt!46358)))

(declare-fun containsKey!149 (List!1570 (_ BitVec 64)) Bool)

(assert (=> d!24499 (= lt!46358 (containsKey!149 (toList!763 lt!46232) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(assert (=> d!24499 (= (contains!783 lt!46232 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)) lt!46361)))

(declare-fun b!93639 () Bool)

(declare-fun lt!46359 () Unit!2789)

(assert (=> b!93639 (= e!61147 lt!46359)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!98 (List!1570 (_ BitVec 64)) Unit!2789)

(assert (=> b!93639 (= lt!46359 (lemmaContainsKeyImpliesGetValueByKeyDefined!98 (toList!763 lt!46232) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(declare-datatypes ((Option!151 0))(
  ( (Some!150 (v!2752 V!3121)) (None!149) )
))
(declare-fun isDefined!99 (Option!151) Bool)

(declare-fun getValueByKey!145 (List!1570 (_ BitVec 64)) Option!151)

(assert (=> b!93639 (isDefined!99 (getValueByKey!145 (toList!763 lt!46232) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(declare-fun b!93640 () Bool)

(declare-fun Unit!2797 () Unit!2789)

(assert (=> b!93640 (= e!61147 Unit!2797)))

(declare-fun b!93641 () Bool)

(assert (=> b!93641 (= e!61146 (isDefined!99 (getValueByKey!145 (toList!763 lt!46232) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355))))))

(assert (= (and d!24499 c!15576) b!93639))

(assert (= (and d!24499 (not c!15576)) b!93640))

(assert (= (and d!24499 (not res!47495)) b!93641))

(assert (=> d!24499 m!100689))

(declare-fun m!100891 () Bool)

(assert (=> d!24499 m!100891))

(assert (=> b!93639 m!100689))

(declare-fun m!100893 () Bool)

(assert (=> b!93639 m!100893))

(assert (=> b!93639 m!100689))

(declare-fun m!100895 () Bool)

(assert (=> b!93639 m!100895))

(assert (=> b!93639 m!100895))

(declare-fun m!100897 () Bool)

(assert (=> b!93639 m!100897))

(assert (=> b!93641 m!100689))

(assert (=> b!93641 m!100895))

(assert (=> b!93641 m!100895))

(assert (=> b!93641 m!100897))

(assert (=> b!93411 d!24499))

(declare-fun b!93726 () Bool)

(declare-fun e!61193 () ListLongMap!1495)

(declare-fun call!9340 () ListLongMap!1495)

(assert (=> b!93726 (= e!61193 call!9340)))

(declare-fun bm!9324 () Bool)

(declare-fun call!9331 () ListLongMap!1495)

(declare-fun lt!46439 () tuple2!2292)

(assert (=> bm!9324 (= call!9331 (map!1228 (_2!1157 lt!46439)))))

(declare-fun b!93727 () Bool)

(declare-fun e!61195 () Bool)

(declare-fun call!9334 () Bool)

(assert (=> b!93727 (= e!61195 (not call!9334))))

(declare-fun bm!9325 () Bool)

(declare-datatypes ((SeekEntryResult!253 0))(
  ( (MissingZero!253 (index!3153 (_ BitVec 32))) (Found!253 (index!3154 (_ BitVec 32))) (Intermediate!253 (undefined!1065 Bool) (index!3155 (_ BitVec 32)) (x!12616 (_ BitVec 32))) (Undefined!253) (MissingVacant!253 (index!3156 (_ BitVec 32))) )
))
(declare-fun call!9337 () SeekEntryResult!253)

(declare-fun call!9330 () SeekEntryResult!253)

(assert (=> bm!9325 (= call!9337 call!9330)))

(declare-fun b!93728 () Bool)

(declare-fun lt!46420 () Unit!2789)

(declare-fun lt!46435 () Unit!2789)

(assert (=> b!93728 (= lt!46420 lt!46435)))

(declare-fun lt!46433 () SeekEntryResult!253)

(assert (=> b!93728 (contains!783 call!9340 (select (arr!1978 (_keys!4111 newMap!16)) (index!3154 lt!46433)))))

(declare-fun lt!46419 () array!4165)

(declare-fun lemmaValidKeyInArrayIsInListMap!97 (array!4163 array!4165 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 32) Int) Unit!2789)

(assert (=> b!93728 (= lt!46435 (lemmaValidKeyInArrayIsInListMap!97 (_keys!4111 newMap!16) lt!46419 (mask!6501 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (index!3154 lt!46433) (defaultEntry!2430 newMap!16)))))

(assert (=> b!93728 (= lt!46419 (array!4166 (store (arr!1979 (_values!2413 newMap!16)) (index!3154 lt!46433) (ValueCellFull!959 (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2228 (_values!2413 newMap!16))))))

(declare-fun lt!46431 () Unit!2789)

(declare-fun lt!46434 () Unit!2789)

(assert (=> b!93728 (= lt!46431 lt!46434)))

(declare-fun call!9336 () ListLongMap!1495)

(declare-fun call!9349 () ListLongMap!1495)

(assert (=> b!93728 (= call!9336 call!9349)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!38 (array!4163 array!4165 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 32) (_ BitVec 64) V!3121 Int) Unit!2789)

(assert (=> b!93728 (= lt!46434 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!38 (_keys!4111 newMap!16) (_values!2413 newMap!16) (mask!6501 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (index!3154 lt!46433) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2430 newMap!16)))))

(declare-fun lt!46418 () Unit!2789)

(declare-fun e!61208 () Unit!2789)

(assert (=> b!93728 (= lt!46418 e!61208)))

(declare-fun c!15611 () Bool)

(declare-fun call!9345 () Bool)

(assert (=> b!93728 (= c!15611 call!9345)))

(declare-fun e!61204 () tuple2!2292)

(assert (=> b!93728 (= e!61204 (tuple2!2293 true (LongMapFixedSize!827 (defaultEntry!2430 newMap!16) (mask!6501 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (_size!462 newMap!16) (_keys!4111 newMap!16) (array!4166 (store (arr!1979 (_values!2413 newMap!16)) (index!3154 lt!46433) (ValueCellFull!959 (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2228 (_values!2413 newMap!16))) (_vacant!462 newMap!16))))))

(declare-fun b!93729 () Bool)

(declare-fun e!61205 () ListLongMap!1495)

(declare-fun call!9335 () ListLongMap!1495)

(assert (=> b!93729 (= e!61205 call!9335)))

(declare-fun call!9350 () Unit!2789)

(declare-fun bm!9326 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!38 (array!4163 array!4165 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 64) Int) Unit!2789)

(assert (=> bm!9326 (= call!9350 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!38 (_keys!4111 newMap!16) (_values!2413 newMap!16) (mask!6501 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (defaultEntry!2430 newMap!16)))))

(declare-fun bm!9327 () Bool)

(declare-fun call!9339 () Bool)

(declare-fun call!9344 () Bool)

(assert (=> bm!9327 (= call!9339 call!9344)))

(declare-fun b!93730 () Bool)

(declare-fun e!61209 () tuple2!2292)

(declare-fun e!61198 () tuple2!2292)

(assert (=> b!93730 (= e!61209 e!61198)))

(declare-fun c!15614 () Bool)

(assert (=> b!93730 (= c!15614 (= (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93731 () Bool)

(declare-fun res!47536 () Bool)

(assert (=> b!93731 (=> (not res!47536) (not e!61195))))

(declare-fun call!9329 () Bool)

(assert (=> b!93731 (= res!47536 call!9329)))

(declare-fun e!61203 () Bool)

(assert (=> b!93731 (= e!61203 e!61195)))

(declare-fun c!15617 () Bool)

(declare-fun lt!46425 () SeekEntryResult!253)

(declare-fun lt!46436 () SeekEntryResult!253)

(declare-fun lt!46442 () SeekEntryResult!253)

(declare-fun c!15615 () Bool)

(declare-fun c!15606 () Bool)

(declare-fun c!15605 () Bool)

(declare-fun lt!46422 () SeekEntryResult!253)

(declare-fun bm!9328 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!9328 (= call!9344 (inRange!0 (ite c!15605 (ite c!15606 (index!3154 lt!46425) (ite c!15615 (index!3153 lt!46422) (index!3156 lt!46422))) (ite c!15611 (index!3154 lt!46442) (ite c!15617 (index!3153 lt!46436) (index!3156 lt!46436)))) (mask!6501 newMap!16)))))

(declare-fun b!93732 () Bool)

(declare-fun res!47524 () Bool)

(assert (=> b!93732 (= res!47524 (= (select (arr!1978 (_keys!4111 newMap!16)) (index!3156 lt!46422)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!61196 () Bool)

(assert (=> b!93732 (=> (not res!47524) (not e!61196))))

(declare-fun bm!9329 () Bool)

(declare-fun call!9333 () Bool)

(assert (=> bm!9329 (= call!9333 call!9344)))

(declare-fun b!93733 () Bool)

(declare-fun e!61199 () Bool)

(declare-fun e!61213 () Bool)

(assert (=> b!93733 (= e!61199 e!61213)))

(declare-fun c!15613 () Bool)

(assert (=> b!93733 (= c!15613 (_1!1157 lt!46439))))

(declare-fun bm!9330 () Bool)

(assert (=> bm!9330 (= call!9329 call!9339)))

(declare-fun bm!9331 () Bool)

(assert (=> bm!9331 (= call!9335 call!9349)))

(declare-fun bm!9332 () Bool)

(declare-fun c!15618 () Bool)

(assert (=> bm!9332 (= call!9349 (getCurrentListMap!446 (_keys!4111 newMap!16) (ite c!15618 (_values!2413 newMap!16) (array!4166 (store (arr!1979 (_values!2413 newMap!16)) (index!3154 lt!46433) (ValueCellFull!959 (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2228 (_values!2413 newMap!16)))) (mask!6501 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2430 newMap!16)))))

(declare-fun b!93734 () Bool)

(declare-fun e!61202 () Bool)

(assert (=> b!93734 (= e!61202 (= (select (arr!1978 (_keys!4111 newMap!16)) (index!3154 lt!46425)) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(declare-fun b!93735 () Bool)

(declare-fun res!47532 () Bool)

(assert (=> b!93735 (= res!47532 (= (select (arr!1978 (_keys!4111 newMap!16)) (index!3156 lt!46436)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!61201 () Bool)

(assert (=> b!93735 (=> (not res!47532) (not e!61201))))

(declare-fun bm!9333 () Bool)

(declare-fun call!9328 () ListLongMap!1495)

(assert (=> bm!9333 (= call!9328 (map!1228 newMap!16))))

(declare-fun d!24501 () Bool)

(assert (=> d!24501 e!61199))

(declare-fun res!47531 () Bool)

(assert (=> d!24501 (=> (not res!47531) (not e!61199))))

(assert (=> d!24501 (= res!47531 (valid!379 (_2!1157 lt!46439)))))

(assert (=> d!24501 (= lt!46439 e!61209)))

(assert (=> d!24501 (= c!15618 (= (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (bvneg (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355))))))

(assert (=> d!24501 (valid!379 newMap!16)))

(assert (=> d!24501 (= (update!139 newMap!16 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!46439)))

(declare-fun b!93736 () Bool)

(declare-fun e!61200 () Unit!2789)

(declare-fun lt!46417 () Unit!2789)

(assert (=> b!93736 (= e!61200 lt!46417)))

(assert (=> b!93736 (= lt!46417 call!9350)))

(assert (=> b!93736 (= lt!46422 call!9337)))

(assert (=> b!93736 (= c!15615 ((_ is MissingZero!253) lt!46422))))

(assert (=> b!93736 e!61203))

(declare-fun bm!9334 () Bool)

(declare-fun call!9327 () Bool)

(assert (=> bm!9334 (= call!9334 call!9327)))

(declare-fun bm!9335 () Bool)

(declare-fun call!9346 () ListLongMap!1495)

(assert (=> bm!9335 (= call!9340 call!9346)))

(declare-fun bm!9336 () Bool)

(declare-fun call!9343 () ListLongMap!1495)

(assert (=> bm!9336 (= call!9343 call!9336)))

(declare-fun b!93737 () Bool)

(declare-fun e!61211 () tuple2!2292)

(declare-fun lt!46429 () tuple2!2292)

(assert (=> b!93737 (= e!61211 (tuple2!2293 (_1!1157 lt!46429) (_2!1157 lt!46429)))))

(declare-fun call!9347 () tuple2!2292)

(assert (=> b!93737 (= lt!46429 call!9347)))

(declare-fun b!93738 () Bool)

(declare-fun lt!46437 () Unit!2789)

(declare-fun lt!46427 () Unit!2789)

(assert (=> b!93738 (= lt!46437 lt!46427)))

(declare-fun call!9338 () ListLongMap!1495)

(assert (=> b!93738 (= call!9343 call!9338)))

(declare-fun lt!46430 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!38 (array!4163 array!4165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 V!3121 Int) Unit!2789)

(assert (=> b!93738 (= lt!46427 (lemmaChangeLongMinValueKeyThenAddPairToListMap!38 (_keys!4111 newMap!16) (_values!2413 newMap!16) (mask!6501 newMap!16) (extraKeys!2259 newMap!16) lt!46430 (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2430 newMap!16)))))

(assert (=> b!93738 (= lt!46430 (bvor (extraKeys!2259 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!93738 (= e!61198 (tuple2!2293 true (LongMapFixedSize!827 (defaultEntry!2430 newMap!16) (mask!6501 newMap!16) (bvor (extraKeys!2259 newMap!16) #b00000000000000000000000000000010) (zeroValue!2317 newMap!16) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!462 newMap!16) (_keys!4111 newMap!16) (_values!2413 newMap!16) (_vacant!462 newMap!16))))))

(declare-fun bm!9337 () Bool)

(declare-fun call!9348 () Bool)

(assert (=> bm!9337 (= call!9348 call!9333)))

(declare-fun b!93739 () Bool)

(declare-fun c!15609 () Bool)

(assert (=> b!93739 (= c!15609 ((_ is MissingVacant!253) lt!46422))))

(declare-fun e!61210 () Bool)

(assert (=> b!93739 (= e!61203 e!61210)))

(declare-fun b!93740 () Bool)

(assert (=> b!93740 (= e!61193 (getCurrentListMap!446 (_keys!4111 newMap!16) (_values!2413 newMap!16) (mask!6501 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2430 newMap!16)))))

(declare-fun lt!46426 () (_ BitVec 32))

(declare-fun bm!9338 () Bool)

(assert (=> bm!9338 (= call!9346 (getCurrentListMap!446 (_keys!4111 newMap!16) (ite (or c!15618 c!15605) (_values!2413 newMap!16) lt!46419) (mask!6501 newMap!16) (ite c!15618 (ite c!15614 lt!46426 lt!46430) (extraKeys!2259 newMap!16)) (ite (and c!15618 c!15614) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2317 newMap!16)) (ite c!15618 (ite c!15614 (minValue!2317 newMap!16) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2317 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2430 newMap!16)))))

(declare-fun bm!9339 () Bool)

(declare-fun c!15607 () Bool)

(assert (=> bm!9339 (= c!15607 c!15605)))

(assert (=> bm!9339 (= call!9345 (contains!783 e!61193 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(declare-fun b!93741 () Bool)

(declare-fun lt!46428 () Unit!2789)

(assert (=> b!93741 (= e!61208 lt!46428)))

(declare-fun call!9341 () Unit!2789)

(assert (=> b!93741 (= lt!46428 call!9341)))

(declare-fun call!9332 () SeekEntryResult!253)

(assert (=> b!93741 (= lt!46442 call!9332)))

(declare-fun res!47527 () Bool)

(assert (=> b!93741 (= res!47527 ((_ is Found!253) lt!46442))))

(declare-fun e!61212 () Bool)

(assert (=> b!93741 (=> (not res!47527) (not e!61212))))

(assert (=> b!93741 e!61212))

(declare-fun b!93742 () Bool)

(declare-fun Unit!2798 () Unit!2789)

(assert (=> b!93742 (= e!61208 Unit!2798)))

(declare-fun lt!46416 () Unit!2789)

(assert (=> b!93742 (= lt!46416 call!9350)))

(assert (=> b!93742 (= lt!46436 call!9332)))

(assert (=> b!93742 (= c!15617 ((_ is MissingZero!253) lt!46436))))

(declare-fun e!61207 () Bool)

(assert (=> b!93742 e!61207))

(declare-fun lt!46432 () Unit!2789)

(assert (=> b!93742 (= lt!46432 lt!46416)))

(assert (=> b!93742 false))

(declare-fun b!93743 () Bool)

(declare-fun lt!46423 () tuple2!2292)

(assert (=> b!93743 (= lt!46423 call!9347)))

(assert (=> b!93743 (= e!61204 (tuple2!2293 (_1!1157 lt!46423) (_2!1157 lt!46423)))))

(declare-fun b!93744 () Bool)

(declare-fun e!61197 () Bool)

(assert (=> b!93744 (= e!61197 ((_ is Undefined!253) lt!46436))))

(declare-fun b!93745 () Bool)

(declare-fun Unit!2799 () Unit!2789)

(assert (=> b!93745 (= e!61200 Unit!2799)))

(declare-fun lt!46421 () Unit!2789)

(assert (=> b!93745 (= lt!46421 call!9341)))

(assert (=> b!93745 (= lt!46425 call!9337)))

(declare-fun res!47530 () Bool)

(assert (=> b!93745 (= res!47530 ((_ is Found!253) lt!46425))))

(assert (=> b!93745 (=> (not res!47530) (not e!61202))))

(assert (=> b!93745 e!61202))

(declare-fun lt!46440 () Unit!2789)

(assert (=> b!93745 (= lt!46440 lt!46421)))

(assert (=> b!93745 false))

(declare-fun b!93746 () Bool)

(declare-fun e!61206 () Bool)

(assert (=> b!93746 (= e!61213 e!61206)))

(declare-fun res!47535 () Bool)

(assert (=> b!93746 (= res!47535 (contains!783 call!9331 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(assert (=> b!93746 (=> (not res!47535) (not e!61206))))

(declare-fun b!93747 () Bool)

(declare-fun call!9342 () Bool)

(assert (=> b!93747 (= e!61201 (not call!9342))))

(declare-fun b!93748 () Bool)

(assert (=> b!93748 (= e!61211 e!61204)))

(declare-fun c!15610 () Bool)

(assert (=> b!93748 (= c!15610 ((_ is MissingZero!253) lt!46433))))

(declare-fun b!93749 () Bool)

(declare-fun c!15608 () Bool)

(assert (=> b!93749 (= c!15608 ((_ is MissingVacant!253) lt!46433))))

(declare-fun e!61194 () tuple2!2292)

(assert (=> b!93749 (= e!61194 e!61211)))

(declare-fun b!93750 () Bool)

(declare-fun res!47537 () Bool)

(declare-fun e!61192 () Bool)

(assert (=> b!93750 (=> (not res!47537) (not e!61192))))

(assert (=> b!93750 (= res!47537 call!9348)))

(assert (=> b!93750 (= e!61207 e!61192)))

(declare-fun b!93751 () Bool)

(assert (=> b!93751 (= e!61212 (= (select (arr!1978 (_keys!4111 newMap!16)) (index!3154 lt!46442)) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(declare-fun bm!9340 () Bool)

(declare-fun updateHelperNewKey!38 (LongMapFixedSize!826 (_ BitVec 64) V!3121 (_ BitVec 32)) tuple2!2292)

(assert (=> bm!9340 (= call!9347 (updateHelperNewKey!38 newMap!16 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!15608 (index!3156 lt!46433) (index!3153 lt!46433))))))

(declare-fun bm!9341 () Bool)

(assert (=> bm!9341 (= call!9342 call!9327)))

(declare-fun b!93752 () Bool)

(assert (=> b!93752 (= e!61196 (not call!9334))))

(declare-fun b!93753 () Bool)

(declare-fun res!47528 () Bool)

(assert (=> b!93753 (= res!47528 call!9333)))

(assert (=> b!93753 (=> (not res!47528) (not e!61212))))

(declare-fun b!93754 () Bool)

(declare-fun c!15612 () Bool)

(assert (=> b!93754 (= c!15612 ((_ is MissingVacant!253) lt!46436))))

(assert (=> b!93754 (= e!61207 e!61197)))

(declare-fun b!93755 () Bool)

(assert (=> b!93755 (= e!61205 (getCurrentListMap!446 (_keys!4111 newMap!16) (_values!2413 newMap!16) (mask!6501 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2430 newMap!16)))))

(declare-fun b!93756 () Bool)

(declare-fun res!47526 () Bool)

(assert (=> b!93756 (=> (not res!47526) (not e!61195))))

(assert (=> b!93756 (= res!47526 (= (select (arr!1978 (_keys!4111 newMap!16)) (index!3153 lt!46422)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93757 () Bool)

(assert (=> b!93757 (= e!61206 (= call!9331 (+!125 call!9328 (tuple2!2295 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!93758 () Bool)

(assert (=> b!93758 (= e!61210 ((_ is Undefined!253) lt!46422))))

(declare-fun b!93759 () Bool)

(declare-fun res!47525 () Bool)

(assert (=> b!93759 (=> (not res!47525) (not e!61192))))

(assert (=> b!93759 (= res!47525 (= (select (arr!1978 (_keys!4111 newMap!16)) (index!3153 lt!46436)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93760 () Bool)

(declare-fun lt!46438 () Unit!2789)

(declare-fun lt!46441 () Unit!2789)

(assert (=> b!93760 (= lt!46438 lt!46441)))

(assert (=> b!93760 (= call!9343 call!9338)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!38 (array!4163 array!4165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 V!3121 Int) Unit!2789)

(assert (=> b!93760 (= lt!46441 (lemmaChangeZeroKeyThenAddPairToListMap!38 (_keys!4111 newMap!16) (_values!2413 newMap!16) (mask!6501 newMap!16) (extraKeys!2259 newMap!16) lt!46426 (zeroValue!2317 newMap!16) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2317 newMap!16) (defaultEntry!2430 newMap!16)))))

(assert (=> b!93760 (= lt!46426 (bvor (extraKeys!2259 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!93760 (= e!61198 (tuple2!2293 true (LongMapFixedSize!827 (defaultEntry!2430 newMap!16) (mask!6501 newMap!16) (bvor (extraKeys!2259 newMap!16) #b00000000000000000000000000000001) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2317 newMap!16) (_size!462 newMap!16) (_keys!4111 newMap!16) (_values!2413 newMap!16) (_vacant!462 newMap!16))))))

(declare-fun bm!9342 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4163 (_ BitVec 32)) SeekEntryResult!253)

(assert (=> bm!9342 (= call!9330 (seekEntryOrOpen!0 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (_keys!4111 newMap!16) (mask!6501 newMap!16)))))

(declare-fun bm!9343 () Bool)

(assert (=> bm!9343 (= call!9336 (+!125 e!61205 (ite c!15618 (ite c!15614 (tuple2!2295 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2295 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2295 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!15616 () Bool)

(assert (=> bm!9343 (= c!15616 c!15618)))

(declare-fun b!93761 () Bool)

(assert (=> b!93761 (= e!61210 e!61196)))

(declare-fun res!47529 () Bool)

(assert (=> b!93761 (= res!47529 call!9329)))

(assert (=> b!93761 (=> (not res!47529) (not e!61196))))

(declare-fun bm!9344 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!38 (array!4163 array!4165 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 64) Int) Unit!2789)

(assert (=> bm!9344 (= call!9341 (lemmaInListMapThenSeekEntryOrOpenFindsIt!38 (_keys!4111 newMap!16) (_values!2413 newMap!16) (mask!6501 newMap!16) (extraKeys!2259 newMap!16) (zeroValue!2317 newMap!16) (minValue!2317 newMap!16) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (defaultEntry!2430 newMap!16)))))

(declare-fun b!93762 () Bool)

(assert (=> b!93762 (= e!61192 (not call!9342))))

(declare-fun b!93763 () Bool)

(declare-fun lt!46424 () Unit!2789)

(assert (=> b!93763 (= lt!46424 e!61200)))

(assert (=> b!93763 (= c!15606 call!9345)))

(assert (=> b!93763 (= e!61194 (tuple2!2293 false newMap!16))))

(declare-fun bm!9345 () Bool)

(assert (=> bm!9345 (= call!9332 call!9330)))

(declare-fun b!93764 () Bool)

(assert (=> b!93764 (= e!61197 e!61201)))

(declare-fun res!47534 () Bool)

(assert (=> b!93764 (= res!47534 call!9348)))

(assert (=> b!93764 (=> (not res!47534) (not e!61201))))

(declare-fun b!93765 () Bool)

(declare-fun res!47533 () Bool)

(assert (=> b!93765 (= res!47533 call!9339)))

(assert (=> b!93765 (=> (not res!47533) (not e!61202))))

(declare-fun bm!9346 () Bool)

(assert (=> bm!9346 (= call!9338 call!9346)))

(declare-fun b!93766 () Bool)

(assert (=> b!93766 (= e!61213 (= call!9331 call!9328))))

(declare-fun bm!9347 () Bool)

(assert (=> bm!9347 (= call!9327 (arrayContainsKey!0 (_keys!4111 newMap!16) (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!93767 () Bool)

(assert (=> b!93767 (= e!61209 e!61194)))

(assert (=> b!93767 (= lt!46433 (seekEntryOrOpen!0 (select (arr!1978 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) from!355) (_keys!4111 newMap!16) (mask!6501 newMap!16)))))

(assert (=> b!93767 (= c!15605 ((_ is Undefined!253) lt!46433))))

(assert (= (and d!24501 c!15618) b!93730))

(assert (= (and d!24501 (not c!15618)) b!93767))

(assert (= (and b!93730 c!15614) b!93760))

(assert (= (and b!93730 (not c!15614)) b!93738))

(assert (= (or b!93760 b!93738) bm!9346))

(assert (= (or b!93760 b!93738) bm!9331))

(assert (= (or b!93760 b!93738) bm!9336))

(assert (= (and b!93767 c!15605) b!93763))

(assert (= (and b!93767 (not c!15605)) b!93749))

(assert (= (and b!93763 c!15606) b!93745))

(assert (= (and b!93763 (not c!15606)) b!93736))

(assert (= (and b!93745 res!47530) b!93765))

(assert (= (and b!93765 res!47533) b!93734))

(assert (= (and b!93736 c!15615) b!93731))

(assert (= (and b!93736 (not c!15615)) b!93739))

(assert (= (and b!93731 res!47536) b!93756))

(assert (= (and b!93756 res!47526) b!93727))

(assert (= (and b!93739 c!15609) b!93761))

(assert (= (and b!93739 (not c!15609)) b!93758))

(assert (= (and b!93761 res!47529) b!93732))

(assert (= (and b!93732 res!47524) b!93752))

(assert (= (or b!93731 b!93761) bm!9330))

(assert (= (or b!93727 b!93752) bm!9334))

(assert (= (or b!93765 bm!9330) bm!9327))

(assert (= (or b!93745 b!93736) bm!9325))

(assert (= (and b!93749 c!15608) b!93737))

(assert (= (and b!93749 (not c!15608)) b!93748))

(assert (= (and b!93748 c!15610) b!93743))

(assert (= (and b!93748 (not c!15610)) b!93728))

(assert (= (and b!93728 c!15611) b!93741))

(assert (= (and b!93728 (not c!15611)) b!93742))

(assert (= (and b!93741 res!47527) b!93753))

(assert (= (and b!93753 res!47528) b!93751))

(assert (= (and b!93742 c!15617) b!93750))

(assert (= (and b!93742 (not c!15617)) b!93754))

(assert (= (and b!93750 res!47537) b!93759))

(assert (= (and b!93759 res!47525) b!93762))

(assert (= (and b!93754 c!15612) b!93764))

(assert (= (and b!93754 (not c!15612)) b!93744))

(assert (= (and b!93764 res!47534) b!93735))

(assert (= (and b!93735 res!47532) b!93747))

(assert (= (or b!93750 b!93764) bm!9337))

(assert (= (or b!93762 b!93747) bm!9341))

(assert (= (or b!93753 bm!9337) bm!9329))

(assert (= (or b!93741 b!93742) bm!9345))

(assert (= (or b!93737 b!93743) bm!9340))

(assert (= (or bm!9327 bm!9329) bm!9328))

(assert (= (or bm!9325 bm!9345) bm!9342))

(assert (= (or b!93736 b!93742) bm!9326))

(assert (= (or bm!9334 bm!9341) bm!9347))

(assert (= (or b!93763 b!93728) bm!9335))

(assert (= (or b!93745 b!93741) bm!9344))

(assert (= (or b!93763 b!93728) bm!9339))

(assert (= (and bm!9339 c!15607) b!93726))

(assert (= (and bm!9339 (not c!15607)) b!93740))

(assert (= (or bm!9346 bm!9335) bm!9338))

(assert (= (or bm!9331 b!93728) bm!9332))

(assert (= (or bm!9336 b!93728) bm!9343))

(assert (= (and bm!9343 c!15616) b!93729))

(assert (= (and bm!9343 (not c!15616)) b!93755))

(assert (= (and d!24501 res!47531) b!93733))

(assert (= (and b!93733 c!15613) b!93746))

(assert (= (and b!93733 (not c!15613)) b!93766))

(assert (= (and b!93746 res!47535) b!93757))

(assert (= (or b!93757 b!93766) bm!9333))

(assert (= (or b!93746 b!93757 b!93766) bm!9324))

(assert (=> b!93767 m!100689))

(declare-fun m!100899 () Bool)

(assert (=> b!93767 m!100899))

(declare-fun m!100901 () Bool)

(assert (=> bm!9343 m!100901))

(declare-fun m!100903 () Bool)

(assert (=> bm!9328 m!100903))

(assert (=> b!93738 m!100707))

(declare-fun m!100905 () Bool)

(assert (=> b!93738 m!100905))

(assert (=> bm!9342 m!100689))

(assert (=> bm!9342 m!100899))

(assert (=> b!93746 m!100689))

(declare-fun m!100907 () Bool)

(assert (=> b!93746 m!100907))

(declare-fun m!100909 () Bool)

(assert (=> b!93757 m!100909))

(assert (=> bm!9344 m!100689))

(declare-fun m!100911 () Bool)

(assert (=> bm!9344 m!100911))

(declare-fun m!100913 () Bool)

(assert (=> b!93751 m!100913))

(declare-fun m!100915 () Bool)

(assert (=> b!93756 m!100915))

(assert (=> b!93755 m!100817))

(assert (=> bm!9333 m!100691))

(declare-fun m!100917 () Bool)

(assert (=> bm!9332 m!100917))

(declare-fun m!100919 () Bool)

(assert (=> bm!9332 m!100919))

(assert (=> bm!9347 m!100689))

(declare-fun m!100921 () Bool)

(assert (=> bm!9347 m!100921))

(assert (=> bm!9340 m!100689))

(assert (=> bm!9340 m!100707))

(declare-fun m!100923 () Bool)

(assert (=> bm!9340 m!100923))

(assert (=> bm!9326 m!100689))

(declare-fun m!100925 () Bool)

(assert (=> bm!9326 m!100925))

(assert (=> b!93728 m!100689))

(assert (=> b!93728 m!100707))

(declare-fun m!100927 () Bool)

(assert (=> b!93728 m!100927))

(declare-fun m!100929 () Bool)

(assert (=> b!93728 m!100929))

(declare-fun m!100931 () Bool)

(assert (=> b!93728 m!100931))

(assert (=> b!93728 m!100917))

(declare-fun m!100933 () Bool)

(assert (=> b!93728 m!100933))

(assert (=> b!93728 m!100929))

(declare-fun m!100935 () Bool)

(assert (=> b!93759 m!100935))

(declare-fun m!100937 () Bool)

(assert (=> b!93732 m!100937))

(assert (=> bm!9339 m!100689))

(declare-fun m!100939 () Bool)

(assert (=> bm!9339 m!100939))

(declare-fun m!100941 () Bool)

(assert (=> bm!9324 m!100941))

(declare-fun m!100943 () Bool)

(assert (=> bm!9338 m!100943))

(assert (=> b!93760 m!100707))

(declare-fun m!100945 () Bool)

(assert (=> b!93760 m!100945))

(declare-fun m!100947 () Bool)

(assert (=> b!93734 m!100947))

(declare-fun m!100949 () Bool)

(assert (=> d!24501 m!100949))

(assert (=> d!24501 m!100685))

(declare-fun m!100951 () Bool)

(assert (=> b!93735 m!100951))

(assert (=> b!93740 m!100817))

(assert (=> b!93411 d!24501))

(declare-fun d!24503 () Bool)

(declare-fun c!15621 () Bool)

(assert (=> d!24503 (= c!15621 ((_ is ValueCellFull!959) (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355)))))

(declare-fun e!61216 () V!3121)

(assert (=> d!24503 (= (get!1261 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!61216)))

(declare-fun b!93772 () Bool)

(declare-fun get!1263 (ValueCell!959 V!3121) V!3121)

(assert (=> b!93772 (= e!61216 (get!1263 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93773 () Bool)

(declare-fun get!1264 (ValueCell!959 V!3121) V!3121)

(assert (=> b!93773 (= e!61216 (get!1264 (select (arr!1979 (_values!2413 (v!2746 (underlying!320 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24503 c!15621) b!93772))

(assert (= (and d!24503 (not c!15621)) b!93773))

(assert (=> b!93772 m!100703))

(assert (=> b!93772 m!100705))

(declare-fun m!100953 () Bool)

(assert (=> b!93772 m!100953))

(assert (=> b!93773 m!100703))

(assert (=> b!93773 m!100705))

(declare-fun m!100955 () Bool)

(assert (=> b!93773 m!100955))

(assert (=> b!93411 d!24503))

(declare-fun d!24505 () Bool)

(assert (=> d!24505 (= (validMask!0 (mask!6501 (v!2746 (underlying!320 thiss!992)))) (and (or (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000000111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000001111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000011111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000000111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000001111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000011111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000000111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000001111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000011111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000000111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000001111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000011111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000000111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000001111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000011111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000000111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000001111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000011111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000000111111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000001111111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000011111111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000000111111111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000001111111111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000011111111111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00000111111111111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00001111111111111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00011111111111111111111111111111) (= (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6501 (v!2746 (underlying!320 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!93416 d!24505))

(declare-fun d!24507 () Bool)

(assert (=> d!24507 (= (array_inv!1237 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) (bvsge (size!2227 (_keys!4111 (v!2746 (underlying!320 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!93420 d!24507))

(declare-fun d!24509 () Bool)

(assert (=> d!24509 (= (array_inv!1238 (_values!2413 (v!2746 (underlying!320 thiss!992)))) (bvsge (size!2228 (_values!2413 (v!2746 (underlying!320 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!93420 d!24509))

(declare-fun d!24511 () Bool)

(declare-fun res!47544 () Bool)

(declare-fun e!61219 () Bool)

(assert (=> d!24511 (=> (not res!47544) (not e!61219))))

(declare-fun simpleValid!65 (LongMapFixedSize!826) Bool)

(assert (=> d!24511 (= res!47544 (simpleValid!65 newMap!16))))

(assert (=> d!24511 (= (valid!379 newMap!16) e!61219)))

(declare-fun b!93780 () Bool)

(declare-fun res!47545 () Bool)

(assert (=> b!93780 (=> (not res!47545) (not e!61219))))

(declare-fun arrayCountValidKeys!0 (array!4163 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!93780 (= res!47545 (= (arrayCountValidKeys!0 (_keys!4111 newMap!16) #b00000000000000000000000000000000 (size!2227 (_keys!4111 newMap!16))) (_size!462 newMap!16)))))

(declare-fun b!93781 () Bool)

(declare-fun res!47546 () Bool)

(assert (=> b!93781 (=> (not res!47546) (not e!61219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4163 (_ BitVec 32)) Bool)

(assert (=> b!93781 (= res!47546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4111 newMap!16) (mask!6501 newMap!16)))))

(declare-fun b!93782 () Bool)

(assert (=> b!93782 (= e!61219 (arrayNoDuplicates!0 (_keys!4111 newMap!16) #b00000000000000000000000000000000 Nil!1568))))

(assert (= (and d!24511 res!47544) b!93780))

(assert (= (and b!93780 res!47545) b!93781))

(assert (= (and b!93781 res!47546) b!93782))

(declare-fun m!100957 () Bool)

(assert (=> d!24511 m!100957))

(declare-fun m!100959 () Bool)

(assert (=> b!93780 m!100959))

(declare-fun m!100961 () Bool)

(assert (=> b!93781 m!100961))

(declare-fun m!100963 () Bool)

(assert (=> b!93782 m!100963))

(assert (=> b!93423 d!24511))

(declare-fun mapNonEmpty!3663 () Bool)

(declare-fun mapRes!3663 () Bool)

(declare-fun tp!9423 () Bool)

(declare-fun e!61225 () Bool)

(assert (=> mapNonEmpty!3663 (= mapRes!3663 (and tp!9423 e!61225))))

(declare-fun mapKey!3663 () (_ BitVec 32))

(declare-fun mapRest!3663 () (Array (_ BitVec 32) ValueCell!959))

(declare-fun mapValue!3663 () ValueCell!959)

(assert (=> mapNonEmpty!3663 (= mapRest!3647 (store mapRest!3663 mapKey!3663 mapValue!3663))))

(declare-fun b!93789 () Bool)

(assert (=> b!93789 (= e!61225 tp_is_empty!2605)))

(declare-fun mapIsEmpty!3663 () Bool)

(assert (=> mapIsEmpty!3663 mapRes!3663))

(declare-fun condMapEmpty!3663 () Bool)

(declare-fun mapDefault!3663 () ValueCell!959)

(assert (=> mapNonEmpty!3648 (= condMapEmpty!3663 (= mapRest!3647 ((as const (Array (_ BitVec 32) ValueCell!959)) mapDefault!3663)))))

(declare-fun e!61224 () Bool)

(assert (=> mapNonEmpty!3648 (= tp!9394 (and e!61224 mapRes!3663))))

(declare-fun b!93790 () Bool)

(assert (=> b!93790 (= e!61224 tp_is_empty!2605)))

(assert (= (and mapNonEmpty!3648 condMapEmpty!3663) mapIsEmpty!3663))

(assert (= (and mapNonEmpty!3648 (not condMapEmpty!3663)) mapNonEmpty!3663))

(assert (= (and mapNonEmpty!3663 ((_ is ValueCellFull!959) mapValue!3663)) b!93789))

(assert (= (and mapNonEmpty!3648 ((_ is ValueCellFull!959) mapDefault!3663)) b!93790))

(declare-fun m!100965 () Bool)

(assert (=> mapNonEmpty!3663 m!100965))

(declare-fun mapNonEmpty!3664 () Bool)

(declare-fun mapRes!3664 () Bool)

(declare-fun tp!9424 () Bool)

(declare-fun e!61227 () Bool)

(assert (=> mapNonEmpty!3664 (= mapRes!3664 (and tp!9424 e!61227))))

(declare-fun mapValue!3664 () ValueCell!959)

(declare-fun mapKey!3664 () (_ BitVec 32))

(declare-fun mapRest!3664 () (Array (_ BitVec 32) ValueCell!959))

(assert (=> mapNonEmpty!3664 (= mapRest!3648 (store mapRest!3664 mapKey!3664 mapValue!3664))))

(declare-fun b!93791 () Bool)

(assert (=> b!93791 (= e!61227 tp_is_empty!2605)))

(declare-fun mapIsEmpty!3664 () Bool)

(assert (=> mapIsEmpty!3664 mapRes!3664))

(declare-fun condMapEmpty!3664 () Bool)

(declare-fun mapDefault!3664 () ValueCell!959)

(assert (=> mapNonEmpty!3647 (= condMapEmpty!3664 (= mapRest!3648 ((as const (Array (_ BitVec 32) ValueCell!959)) mapDefault!3664)))))

(declare-fun e!61226 () Bool)

(assert (=> mapNonEmpty!3647 (= tp!9393 (and e!61226 mapRes!3664))))

(declare-fun b!93792 () Bool)

(assert (=> b!93792 (= e!61226 tp_is_empty!2605)))

(assert (= (and mapNonEmpty!3647 condMapEmpty!3664) mapIsEmpty!3664))

(assert (= (and mapNonEmpty!3647 (not condMapEmpty!3664)) mapNonEmpty!3664))

(assert (= (and mapNonEmpty!3664 ((_ is ValueCellFull!959) mapValue!3664)) b!93791))

(assert (= (and mapNonEmpty!3647 ((_ is ValueCellFull!959) mapDefault!3664)) b!93792))

(declare-fun m!100967 () Bool)

(assert (=> mapNonEmpty!3664 m!100967))

(declare-fun b_lambda!4129 () Bool)

(assert (= b_lambda!4127 (or (and b!93420 b_free!2377) (and b!93427 b_free!2379 (= (defaultEntry!2430 newMap!16) (defaultEntry!2430 (v!2746 (underlying!320 thiss!992))))) b_lambda!4129)))

(check-sat (not b!93772) (not b!93603) (not b_lambda!4125) (not b!93590) (not b!93767) (not b!93601) (not bm!9324) (not b!93746) (not b!93755) (not b_lambda!4129) (not b!93728) (not bm!9332) (not mapNonEmpty!3663) (not bm!9271) (not b!93586) (not b!93585) (not bm!9338) (not b!93639) (not mapNonEmpty!3664) (not d!24501) b_and!5713 (not d!24497) (not b!93781) (not b!93760) (not b!93605) (not b!93611) (not d!24511) (not bm!9326) (not d!24485) (not bm!9347) (not b!93598) (not d!24483) (not bm!9267) (not b!93780) (not b!93738) (not bm!9342) (not d!24499) (not b!93629) (not b!93757) (not d!24493) (not b!93773) (not b!93782) (not bm!9275) (not b!93616) (not bm!9343) (not d!24487) (not b!93628) (not b!93641) (not b_next!2379) (not bm!9266) (not bm!9339) (not b!93604) (not bm!9328) (not d!24489) b_and!5715 tp_is_empty!2605 (not b_next!2377) (not b!93740) (not bm!9333) (not bm!9340) (not b!93632) (not bm!9268) (not bm!9344))
(check-sat b_and!5713 b_and!5715 (not b_next!2377) (not b_next!2379))
