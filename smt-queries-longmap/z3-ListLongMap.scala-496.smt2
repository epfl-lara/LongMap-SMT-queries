; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11262 () Bool)

(assert start!11262)

(declare-fun b!92457 () Bool)

(declare-fun b_free!2341 () Bool)

(declare-fun b_next!2341 () Bool)

(assert (=> b!92457 (= b_free!2341 (not b_next!2341))))

(declare-fun tp!9284 () Bool)

(declare-fun b_and!5597 () Bool)

(assert (=> b!92457 (= tp!9284 b_and!5597)))

(declare-fun b!92460 () Bool)

(declare-fun b_free!2343 () Bool)

(declare-fun b_next!2343 () Bool)

(assert (=> b!92460 (= b_free!2343 (not b_next!2343))))

(declare-fun tp!9283 () Bool)

(declare-fun b_and!5599 () Bool)

(assert (=> b!92460 (= tp!9283 b_and!5599)))

(declare-fun b!92443 () Bool)

(declare-fun e!60269 () Bool)

(declare-fun tp_is_empty!2587 () Bool)

(assert (=> b!92443 (= e!60269 tp_is_empty!2587)))

(declare-fun b!92444 () Bool)

(declare-fun e!60265 () Bool)

(declare-fun e!60271 () Bool)

(assert (=> b!92444 (= e!60265 e!60271)))

(declare-fun res!47013 () Bool)

(assert (=> b!92444 (=> (not res!47013) (not e!60271))))

(declare-datatypes ((V!3097 0))(
  ( (V!3098 (val!1338 Int)) )
))
(declare-datatypes ((array!4125 0))(
  ( (array!4126 (arr!1960 (Array (_ BitVec 32) (_ BitVec 64))) (size!2209 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!950 0))(
  ( (ValueCellFull!950 (v!2725 V!3097)) (EmptyCell!950) )
))
(declare-datatypes ((array!4127 0))(
  ( (array!4128 (arr!1961 (Array (_ BitVec 32) ValueCell!950)) (size!2210 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!808 0))(
  ( (LongMapFixedSize!809 (defaultEntry!2418 Int) (mask!6483 (_ BitVec 32)) (extraKeys!2247 (_ BitVec 32)) (zeroValue!2305 V!3097) (minValue!2305 V!3097) (_size!453 (_ BitVec 32)) (_keys!4099 array!4125) (_values!2401 array!4127) (_vacant!453 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2260 0))(
  ( (tuple2!2261 (_1!1141 Bool) (_2!1141 LongMapFixedSize!808)) )
))
(declare-fun lt!45380 () tuple2!2260)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!92444 (= res!47013 (and (_1!1141 lt!45380) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2759 0))(
  ( (Unit!2760) )
))
(declare-fun lt!45389 () Unit!2759)

(declare-fun e!60270 () Unit!2759)

(assert (=> b!92444 (= lt!45389 e!60270)))

(declare-datatypes ((Cell!600 0))(
  ( (Cell!601 (v!2726 LongMapFixedSize!808)) )
))
(declare-datatypes ((LongMap!600 0))(
  ( (LongMap!601 (underlying!311 Cell!600)) )
))
(declare-fun thiss!992 () LongMap!600)

(declare-datatypes ((tuple2!2262 0))(
  ( (tuple2!2263 (_1!1142 (_ BitVec 64)) (_2!1142 V!3097)) )
))
(declare-datatypes ((List!1557 0))(
  ( (Nil!1554) (Cons!1553 (h!2145 tuple2!2262) (t!5402 List!1557)) )
))
(declare-datatypes ((ListLongMap!1479 0))(
  ( (ListLongMap!1480 (toList!755 List!1557)) )
))
(declare-fun lt!45379 () ListLongMap!1479)

(declare-fun c!15408 () Bool)

(declare-fun contains!775 (ListLongMap!1479 (_ BitVec 64)) Bool)

(assert (=> b!92444 (= c!15408 (contains!775 lt!45379 (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355)))))

(declare-fun lt!45375 () V!3097)

(declare-fun newMap!16 () LongMapFixedSize!808)

(declare-fun update!133 (LongMapFixedSize!808 (_ BitVec 64) V!3097) tuple2!2260)

(assert (=> b!92444 (= lt!45380 (update!133 newMap!16 (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355) lt!45375))))

(declare-fun res!47009 () Bool)

(declare-fun e!60272 () Bool)

(assert (=> start!11262 (=> (not res!47009) (not e!60272))))

(declare-fun valid!365 (LongMap!600) Bool)

(assert (=> start!11262 (= res!47009 (valid!365 thiss!992))))

(assert (=> start!11262 e!60272))

(declare-fun e!60263 () Bool)

(assert (=> start!11262 e!60263))

(assert (=> start!11262 true))

(declare-fun e!60267 () Bool)

(assert (=> start!11262 e!60267))

(declare-fun b!92445 () Bool)

(declare-fun e!60266 () Bool)

(assert (=> b!92445 (= e!60266 tp_is_empty!2587)))

(declare-fun b!92446 () Bool)

(declare-fun res!47010 () Bool)

(declare-fun e!60264 () Bool)

(assert (=> b!92446 (=> res!47010 e!60264)))

(assert (=> b!92446 (= res!47010 (bvslt (bvadd #b00000000000000000000000000000001 (mask!6483 (_2!1141 lt!45380))) (_size!453 (v!2726 (underlying!311 thiss!992)))))))

(declare-fun b!92447 () Bool)

(declare-fun lt!45392 () ListLongMap!1479)

(declare-fun getCurrentListMap!438 (array!4125 array!4127 (_ BitVec 32) (_ BitVec 32) V!3097 V!3097 (_ BitVec 32) Int) ListLongMap!1479)

(assert (=> b!92447 (= e!60264 (= (getCurrentListMap!438 (_keys!4099 (v!2726 (underlying!311 thiss!992))) (_values!2401 (v!2726 (underlying!311 thiss!992))) (mask!6483 (v!2726 (underlying!311 thiss!992))) (extraKeys!2247 (v!2726 (underlying!311 thiss!992))) (zeroValue!2305 (v!2726 (underlying!311 thiss!992))) (minValue!2305 (v!2726 (underlying!311 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2418 (v!2726 (underlying!311 thiss!992)))) lt!45392))))

(declare-fun b!92448 () Bool)

(declare-fun res!47012 () Bool)

(assert (=> b!92448 (=> (not res!47012) (not e!60272))))

(assert (=> b!92448 (= res!47012 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2209 (_keys!4099 (v!2726 (underlying!311 thiss!992)))))))))

(declare-fun b!92449 () Bool)

(declare-fun res!47016 () Bool)

(assert (=> b!92449 (=> (not res!47016) (not e!60272))))

(declare-fun valid!366 (LongMapFixedSize!808) Bool)

(assert (=> b!92449 (= res!47016 (valid!366 newMap!16))))

(declare-fun b!92450 () Bool)

(declare-fun res!47015 () Bool)

(assert (=> b!92450 (=> (not res!47015) (not e!60272))))

(assert (=> b!92450 (= res!47015 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6483 newMap!16)) (_size!453 (v!2726 (underlying!311 thiss!992)))))))

(declare-fun b!92451 () Bool)

(declare-fun e!60262 () Bool)

(assert (=> b!92451 (= e!60272 e!60262)))

(declare-fun res!47011 () Bool)

(assert (=> b!92451 (=> (not res!47011) (not e!60262))))

(declare-fun lt!45383 () ListLongMap!1479)

(assert (=> b!92451 (= res!47011 (= lt!45383 lt!45379))))

(declare-fun map!1216 (LongMapFixedSize!808) ListLongMap!1479)

(assert (=> b!92451 (= lt!45379 (map!1216 newMap!16))))

(assert (=> b!92451 (= lt!45383 (getCurrentListMap!438 (_keys!4099 (v!2726 (underlying!311 thiss!992))) (_values!2401 (v!2726 (underlying!311 thiss!992))) (mask!6483 (v!2726 (underlying!311 thiss!992))) (extraKeys!2247 (v!2726 (underlying!311 thiss!992))) (zeroValue!2305 (v!2726 (underlying!311 thiss!992))) (minValue!2305 (v!2726 (underlying!311 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2418 (v!2726 (underlying!311 thiss!992)))))))

(declare-fun b!92452 () Bool)

(declare-fun e!60260 () Bool)

(declare-fun e!60268 () Bool)

(declare-fun mapRes!3589 () Bool)

(assert (=> b!92452 (= e!60260 (and e!60268 mapRes!3589))))

(declare-fun condMapEmpty!3590 () Bool)

(declare-fun mapDefault!3589 () ValueCell!950)

(assert (=> b!92452 (= condMapEmpty!3590 (= (arr!1961 (_values!2401 (v!2726 (underlying!311 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!950)) mapDefault!3589)))))

(declare-fun b!92453 () Bool)

(declare-fun Unit!2761 () Unit!2759)

(assert (=> b!92453 (= e!60270 Unit!2761)))

(declare-fun lt!45387 () Unit!2759)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!83 (array!4125 array!4127 (_ BitVec 32) (_ BitVec 32) V!3097 V!3097 (_ BitVec 64) (_ BitVec 32) Int) Unit!2759)

(assert (=> b!92453 (= lt!45387 (lemmaListMapContainsThenArrayContainsFrom!83 (_keys!4099 (v!2726 (underlying!311 thiss!992))) (_values!2401 (v!2726 (underlying!311 thiss!992))) (mask!6483 (v!2726 (underlying!311 thiss!992))) (extraKeys!2247 (v!2726 (underlying!311 thiss!992))) (zeroValue!2305 (v!2726 (underlying!311 thiss!992))) (minValue!2305 (v!2726 (underlying!311 thiss!992))) (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2418 (v!2726 (underlying!311 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!92453 (arrayContainsKey!0 (_keys!4099 (v!2726 (underlying!311 thiss!992))) (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!45386 () Unit!2759)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4125 (_ BitVec 32) (_ BitVec 32)) Unit!2759)

(assert (=> b!92453 (= lt!45386 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4099 (v!2726 (underlying!311 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1558 0))(
  ( (Nil!1555) (Cons!1554 (h!2146 (_ BitVec 64)) (t!5403 List!1558)) )
))
(declare-fun arrayNoDuplicates!0 (array!4125 (_ BitVec 32) List!1558) Bool)

(assert (=> b!92453 (arrayNoDuplicates!0 (_keys!4099 (v!2726 (underlying!311 thiss!992))) from!355 Nil!1555)))

(declare-fun lt!45381 () Unit!2759)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4125 (_ BitVec 32) (_ BitVec 64) List!1558) Unit!2759)

(assert (=> b!92453 (= lt!45381 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4099 (v!2726 (underlying!311 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355) (Cons!1554 (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355) Nil!1555)))))

(assert (=> b!92453 false))

(declare-fun b!92454 () Bool)

(declare-fun res!47014 () Bool)

(assert (=> b!92454 (=> res!47014 e!60264)))

(assert (=> b!92454 (= res!47014 (not (valid!366 (_2!1141 lt!45380))))))

(declare-fun b!92455 () Bool)

(declare-fun e!60255 () Bool)

(declare-fun e!60261 () Bool)

(assert (=> b!92455 (= e!60255 e!60261)))

(declare-fun mapNonEmpty!3589 () Bool)

(declare-fun tp!9282 () Bool)

(assert (=> mapNonEmpty!3589 (= mapRes!3589 (and tp!9282 e!60269))))

(declare-fun mapValue!3589 () ValueCell!950)

(declare-fun mapKey!3590 () (_ BitVec 32))

(declare-fun mapRest!3589 () (Array (_ BitVec 32) ValueCell!950))

(assert (=> mapNonEmpty!3589 (= (arr!1961 (_values!2401 (v!2726 (underlying!311 thiss!992)))) (store mapRest!3589 mapKey!3590 mapValue!3589))))

(declare-fun b!92456 () Bool)

(declare-fun Unit!2762 () Unit!2759)

(assert (=> b!92456 (= e!60270 Unit!2762)))

(declare-fun array_inv!1225 (array!4125) Bool)

(declare-fun array_inv!1226 (array!4127) Bool)

(assert (=> b!92457 (= e!60261 (and tp!9284 tp_is_empty!2587 (array_inv!1225 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) (array_inv!1226 (_values!2401 (v!2726 (underlying!311 thiss!992)))) e!60260))))

(declare-fun b!92458 () Bool)

(assert (=> b!92458 (= e!60271 (not e!60264))))

(declare-fun res!47018 () Bool)

(assert (=> b!92458 (=> res!47018 e!60264)))

(declare-fun lt!45391 () ListLongMap!1479)

(assert (=> b!92458 (= res!47018 (or (not (= lt!45391 lt!45392)) (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2209 (_keys!4099 (v!2726 (underlying!311 thiss!992)))))))))

(assert (=> b!92458 (= lt!45392 (map!1216 (_2!1141 lt!45380)))))

(assert (=> b!92458 (= lt!45391 (getCurrentListMap!438 (_keys!4099 (v!2726 (underlying!311 thiss!992))) (_values!2401 (v!2726 (underlying!311 thiss!992))) (mask!6483 (v!2726 (underlying!311 thiss!992))) (extraKeys!2247 (v!2726 (underlying!311 thiss!992))) (zeroValue!2305 (v!2726 (underlying!311 thiss!992))) (minValue!2305 (v!2726 (underlying!311 thiss!992))) from!355 (defaultEntry!2418 (v!2726 (underlying!311 thiss!992)))))))

(declare-fun lt!45376 () ListLongMap!1479)

(declare-fun lt!45390 () tuple2!2262)

(declare-fun lt!45382 () tuple2!2262)

(declare-fun lt!45377 () ListLongMap!1479)

(declare-fun +!120 (ListLongMap!1479 tuple2!2262) ListLongMap!1479)

(assert (=> b!92458 (= (+!120 lt!45376 lt!45390) (+!120 (+!120 lt!45377 lt!45390) lt!45382))))

(assert (=> b!92458 (= lt!45390 (tuple2!2263 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2305 (v!2726 (underlying!311 thiss!992)))))))

(declare-fun lt!45374 () Unit!2759)

(declare-fun addCommutativeForDiffKeys!39 (ListLongMap!1479 (_ BitVec 64) V!3097 (_ BitVec 64) V!3097) Unit!2759)

(assert (=> b!92458 (= lt!45374 (addCommutativeForDiffKeys!39 lt!45377 (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355) lt!45375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2305 (v!2726 (underlying!311 thiss!992)))))))

(declare-fun lt!45384 () ListLongMap!1479)

(assert (=> b!92458 (= lt!45384 lt!45376)))

(assert (=> b!92458 (= lt!45376 (+!120 lt!45377 lt!45382))))

(declare-fun lt!45378 () ListLongMap!1479)

(declare-fun lt!45388 () tuple2!2262)

(assert (=> b!92458 (= lt!45384 (+!120 lt!45378 lt!45388))))

(declare-fun lt!45393 () ListLongMap!1479)

(assert (=> b!92458 (= lt!45377 (+!120 lt!45393 lt!45388))))

(assert (=> b!92458 (= lt!45388 (tuple2!2263 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2305 (v!2726 (underlying!311 thiss!992)))))))

(assert (=> b!92458 (= lt!45378 (+!120 lt!45393 lt!45382))))

(assert (=> b!92458 (= lt!45382 (tuple2!2263 (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355) lt!45375))))

(declare-fun lt!45385 () Unit!2759)

(assert (=> b!92458 (= lt!45385 (addCommutativeForDiffKeys!39 lt!45393 (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355) lt!45375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2305 (v!2726 (underlying!311 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!84 (array!4125 array!4127 (_ BitVec 32) (_ BitVec 32) V!3097 V!3097 (_ BitVec 32) Int) ListLongMap!1479)

(assert (=> b!92458 (= lt!45393 (getCurrentListMapNoExtraKeys!84 (_keys!4099 (v!2726 (underlying!311 thiss!992))) (_values!2401 (v!2726 (underlying!311 thiss!992))) (mask!6483 (v!2726 (underlying!311 thiss!992))) (extraKeys!2247 (v!2726 (underlying!311 thiss!992))) (zeroValue!2305 (v!2726 (underlying!311 thiss!992))) (minValue!2305 (v!2726 (underlying!311 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2418 (v!2726 (underlying!311 thiss!992)))))))

(declare-fun b!92459 () Bool)

(assert (=> b!92459 (= e!60263 e!60255)))

(declare-fun mapIsEmpty!3589 () Bool)

(assert (=> mapIsEmpty!3589 mapRes!3589))

(declare-fun e!60259 () Bool)

(assert (=> b!92460 (= e!60267 (and tp!9283 tp_is_empty!2587 (array_inv!1225 (_keys!4099 newMap!16)) (array_inv!1226 (_values!2401 newMap!16)) e!60259))))

(declare-fun mapNonEmpty!3590 () Bool)

(declare-fun mapRes!3590 () Bool)

(declare-fun tp!9281 () Bool)

(assert (=> mapNonEmpty!3590 (= mapRes!3590 (and tp!9281 e!60266))))

(declare-fun mapValue!3590 () ValueCell!950)

(declare-fun mapRest!3590 () (Array (_ BitVec 32) ValueCell!950))

(declare-fun mapKey!3589 () (_ BitVec 32))

(assert (=> mapNonEmpty!3590 (= (arr!1961 (_values!2401 newMap!16)) (store mapRest!3590 mapKey!3589 mapValue!3590))))

(declare-fun b!92461 () Bool)

(assert (=> b!92461 (= e!60262 e!60265)))

(declare-fun res!47017 () Bool)

(assert (=> b!92461 (=> (not res!47017) (not e!60265))))

(assert (=> b!92461 (= res!47017 (and (not (= (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1960 (_keys!4099 (v!2726 (underlying!311 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1247 (ValueCell!950 V!3097) V!3097)

(declare-fun dynLambda!356 (Int (_ BitVec 64)) V!3097)

(assert (=> b!92461 (= lt!45375 (get!1247 (select (arr!1961 (_values!2401 (v!2726 (underlying!311 thiss!992)))) from!355) (dynLambda!356 (defaultEntry!2418 (v!2726 (underlying!311 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92462 () Bool)

(declare-fun e!60258 () Bool)

(assert (=> b!92462 (= e!60259 (and e!60258 mapRes!3590))))

(declare-fun condMapEmpty!3589 () Bool)

(declare-fun mapDefault!3590 () ValueCell!950)

(assert (=> b!92462 (= condMapEmpty!3589 (= (arr!1961 (_values!2401 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!950)) mapDefault!3590)))))

(declare-fun b!92463 () Bool)

(assert (=> b!92463 (= e!60258 tp_is_empty!2587)))

(declare-fun mapIsEmpty!3590 () Bool)

(assert (=> mapIsEmpty!3590 mapRes!3590))

(declare-fun b!92464 () Bool)

(assert (=> b!92464 (= e!60268 tp_is_empty!2587)))

(assert (= (and start!11262 res!47009) b!92448))

(assert (= (and b!92448 res!47012) b!92449))

(assert (= (and b!92449 res!47016) b!92450))

(assert (= (and b!92450 res!47015) b!92451))

(assert (= (and b!92451 res!47011) b!92461))

(assert (= (and b!92461 res!47017) b!92444))

(assert (= (and b!92444 c!15408) b!92453))

(assert (= (and b!92444 (not c!15408)) b!92456))

(assert (= (and b!92444 res!47013) b!92458))

(assert (= (and b!92458 (not res!47018)) b!92454))

(assert (= (and b!92454 (not res!47014)) b!92446))

(assert (= (and b!92446 (not res!47010)) b!92447))

(assert (= (and b!92452 condMapEmpty!3590) mapIsEmpty!3589))

(assert (= (and b!92452 (not condMapEmpty!3590)) mapNonEmpty!3589))

(get-info :version)

(assert (= (and mapNonEmpty!3589 ((_ is ValueCellFull!950) mapValue!3589)) b!92443))

(assert (= (and b!92452 ((_ is ValueCellFull!950) mapDefault!3589)) b!92464))

(assert (= b!92457 b!92452))

(assert (= b!92455 b!92457))

(assert (= b!92459 b!92455))

(assert (= start!11262 b!92459))

(assert (= (and b!92462 condMapEmpty!3589) mapIsEmpty!3590))

(assert (= (and b!92462 (not condMapEmpty!3589)) mapNonEmpty!3590))

(assert (= (and mapNonEmpty!3590 ((_ is ValueCellFull!950) mapValue!3590)) b!92445))

(assert (= (and b!92462 ((_ is ValueCellFull!950) mapDefault!3590)) b!92463))

(assert (= b!92460 b!92462))

(assert (= start!11262 b!92460))

(declare-fun b_lambda!4079 () Bool)

(assert (=> (not b_lambda!4079) (not b!92461)))

(declare-fun t!5399 () Bool)

(declare-fun tb!1813 () Bool)

(assert (=> (and b!92457 (= (defaultEntry!2418 (v!2726 (underlying!311 thiss!992))) (defaultEntry!2418 (v!2726 (underlying!311 thiss!992)))) t!5399) tb!1813))

(declare-fun result!3101 () Bool)

(assert (=> tb!1813 (= result!3101 tp_is_empty!2587)))

(assert (=> b!92461 t!5399))

(declare-fun b_and!5601 () Bool)

(assert (= b_and!5597 (and (=> t!5399 result!3101) b_and!5601)))

(declare-fun t!5401 () Bool)

(declare-fun tb!1815 () Bool)

(assert (=> (and b!92460 (= (defaultEntry!2418 newMap!16) (defaultEntry!2418 (v!2726 (underlying!311 thiss!992)))) t!5401) tb!1815))

(declare-fun result!3105 () Bool)

(assert (= result!3105 result!3101))

(assert (=> b!92461 t!5401))

(declare-fun b_and!5603 () Bool)

(assert (= b_and!5599 (and (=> t!5401 result!3105) b_and!5603)))

(declare-fun m!99655 () Bool)

(assert (=> b!92444 m!99655))

(assert (=> b!92444 m!99655))

(declare-fun m!99657 () Bool)

(assert (=> b!92444 m!99657))

(assert (=> b!92444 m!99655))

(declare-fun m!99659 () Bool)

(assert (=> b!92444 m!99659))

(declare-fun m!99661 () Bool)

(assert (=> b!92449 m!99661))

(declare-fun m!99663 () Bool)

(assert (=> mapNonEmpty!3590 m!99663))

(declare-fun m!99665 () Bool)

(assert (=> b!92451 m!99665))

(declare-fun m!99667 () Bool)

(assert (=> b!92451 m!99667))

(declare-fun m!99669 () Bool)

(assert (=> start!11262 m!99669))

(assert (=> b!92461 m!99655))

(declare-fun m!99671 () Bool)

(assert (=> b!92461 m!99671))

(declare-fun m!99673 () Bool)

(assert (=> b!92461 m!99673))

(assert (=> b!92461 m!99671))

(assert (=> b!92461 m!99673))

(declare-fun m!99675 () Bool)

(assert (=> b!92461 m!99675))

(declare-fun m!99677 () Bool)

(assert (=> b!92454 m!99677))

(declare-fun m!99679 () Bool)

(assert (=> b!92458 m!99679))

(declare-fun m!99681 () Bool)

(assert (=> b!92458 m!99681))

(assert (=> b!92458 m!99655))

(declare-fun m!99683 () Bool)

(assert (=> b!92458 m!99683))

(declare-fun m!99685 () Bool)

(assert (=> b!92458 m!99685))

(assert (=> b!92458 m!99655))

(declare-fun m!99687 () Bool)

(assert (=> b!92458 m!99687))

(declare-fun m!99689 () Bool)

(assert (=> b!92458 m!99689))

(declare-fun m!99691 () Bool)

(assert (=> b!92458 m!99691))

(assert (=> b!92458 m!99687))

(declare-fun m!99693 () Bool)

(assert (=> b!92458 m!99693))

(declare-fun m!99695 () Bool)

(assert (=> b!92458 m!99695))

(declare-fun m!99697 () Bool)

(assert (=> b!92458 m!99697))

(declare-fun m!99699 () Bool)

(assert (=> b!92458 m!99699))

(assert (=> b!92458 m!99655))

(declare-fun m!99701 () Bool)

(assert (=> b!92458 m!99701))

(declare-fun m!99703 () Bool)

(assert (=> b!92460 m!99703))

(declare-fun m!99705 () Bool)

(assert (=> b!92460 m!99705))

(declare-fun m!99707 () Bool)

(assert (=> b!92457 m!99707))

(declare-fun m!99709 () Bool)

(assert (=> b!92457 m!99709))

(declare-fun m!99711 () Bool)

(assert (=> b!92447 m!99711))

(declare-fun m!99713 () Bool)

(assert (=> mapNonEmpty!3589 m!99713))

(declare-fun m!99715 () Bool)

(assert (=> b!92453 m!99715))

(declare-fun m!99717 () Bool)

(assert (=> b!92453 m!99717))

(assert (=> b!92453 m!99655))

(declare-fun m!99719 () Bool)

(assert (=> b!92453 m!99719))

(assert (=> b!92453 m!99655))

(assert (=> b!92453 m!99655))

(declare-fun m!99721 () Bool)

(assert (=> b!92453 m!99721))

(assert (=> b!92453 m!99655))

(declare-fun m!99723 () Bool)

(assert (=> b!92453 m!99723))

(check-sat b_and!5601 (not mapNonEmpty!3590) (not start!11262) (not b!92447) (not b!92444) (not b!92453) (not b!92457) (not b!92451) b_and!5603 (not b!92449) (not b!92454) (not b!92460) (not b_next!2341) tp_is_empty!2587 (not b!92458) (not b_lambda!4079) (not b_next!2343) (not b!92461) (not mapNonEmpty!3589))
(check-sat b_and!5601 b_and!5603 (not b_next!2341) (not b_next!2343))
