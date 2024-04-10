; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11258 () Bool)

(assert start!11258)

(declare-fun b!92582 () Bool)

(declare-fun b_free!2341 () Bool)

(declare-fun b_next!2341 () Bool)

(assert (=> b!92582 (= b_free!2341 (not b_next!2341))))

(declare-fun tp!9283 () Bool)

(declare-fun b_and!5611 () Bool)

(assert (=> b!92582 (= tp!9283 b_and!5611)))

(declare-fun b!92585 () Bool)

(declare-fun b_free!2343 () Bool)

(declare-fun b_next!2343 () Bool)

(assert (=> b!92585 (= b_free!2343 (not b_next!2343))))

(declare-fun tp!9281 () Bool)

(declare-fun b_and!5613 () Bool)

(assert (=> b!92585 (= tp!9281 b_and!5613)))

(declare-fun b!92581 () Bool)

(declare-fun res!47073 () Bool)

(declare-fun e!60358 () Bool)

(assert (=> b!92581 (=> res!47073 e!60358)))

(declare-datatypes ((V!3097 0))(
  ( (V!3098 (val!1338 Int)) )
))
(declare-datatypes ((array!4145 0))(
  ( (array!4146 (arr!1971 (Array (_ BitVec 32) (_ BitVec 64))) (size!2219 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!950 0))(
  ( (ValueCellFull!950 (v!2731 V!3097)) (EmptyCell!950) )
))
(declare-datatypes ((array!4147 0))(
  ( (array!4148 (arr!1972 (Array (_ BitVec 32) ValueCell!950)) (size!2220 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!808 0))(
  ( (LongMapFixedSize!809 (defaultEntry!2418 Int) (mask!6484 (_ BitVec 32)) (extraKeys!2247 (_ BitVec 32)) (zeroValue!2305 V!3097) (minValue!2305 V!3097) (_size!453 (_ BitVec 32)) (_keys!4100 array!4145) (_values!2401 array!4147) (_vacant!453 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2274 0))(
  ( (tuple2!2275 (_1!1148 Bool) (_2!1148 LongMapFixedSize!808)) )
))
(declare-fun lt!45488 () tuple2!2274)

(declare-datatypes ((Cell!608 0))(
  ( (Cell!609 (v!2732 LongMapFixedSize!808)) )
))
(declare-datatypes ((LongMap!608 0))(
  ( (LongMap!609 (underlying!315 Cell!608)) )
))
(declare-fun thiss!992 () LongMap!608)

(assert (=> b!92581 (= res!47073 (bvslt (bvadd #b00000000000000000000000000000001 (mask!6484 (_2!1148 lt!45488))) (_size!453 (v!2732 (underlying!315 thiss!992)))))))

(declare-fun tp_is_empty!2587 () Bool)

(declare-fun e!60353 () Bool)

(declare-fun e!60345 () Bool)

(declare-fun array_inv!1221 (array!4145) Bool)

(declare-fun array_inv!1222 (array!4147) Bool)

(assert (=> b!92582 (= e!60353 (and tp!9283 tp_is_empty!2587 (array_inv!1221 (_keys!4100 (v!2732 (underlying!315 thiss!992)))) (array_inv!1222 (_values!2401 (v!2732 (underlying!315 thiss!992)))) e!60345))))

(declare-fun b!92583 () Bool)

(declare-fun res!47068 () Bool)

(declare-fun e!60349 () Bool)

(assert (=> b!92583 (=> (not res!47068) (not e!60349))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!92583 (= res!47068 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2219 (_keys!4100 (v!2732 (underlying!315 thiss!992)))))))))

(declare-fun b!92584 () Bool)

(declare-fun e!60355 () Bool)

(declare-fun e!60347 () Bool)

(assert (=> b!92584 (= e!60355 e!60347)))

(declare-fun res!47070 () Bool)

(assert (=> b!92584 (=> (not res!47070) (not e!60347))))

(assert (=> b!92584 (= res!47070 (and (_1!1148 lt!45488) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2760 0))(
  ( (Unit!2761) )
))
(declare-fun lt!45476 () Unit!2760)

(declare-fun e!60357 () Unit!2760)

(assert (=> b!92584 (= lt!45476 e!60357)))

(declare-fun c!15448 () Bool)

(declare-datatypes ((tuple2!2276 0))(
  ( (tuple2!2277 (_1!1149 (_ BitVec 64)) (_2!1149 V!3097)) )
))
(declare-datatypes ((List!1554 0))(
  ( (Nil!1551) (Cons!1550 (h!2142 tuple2!2276) (t!5404 List!1554)) )
))
(declare-datatypes ((ListLongMap!1503 0))(
  ( (ListLongMap!1504 (toList!767 List!1554)) )
))
(declare-fun lt!45483 () ListLongMap!1503)

(declare-fun contains!781 (ListLongMap!1503 (_ BitVec 64)) Bool)

(assert (=> b!92584 (= c!15448 (contains!781 lt!45483 (select (arr!1971 (_keys!4100 (v!2732 (underlying!315 thiss!992)))) from!355)))))

(declare-fun lt!45492 () V!3097)

(declare-fun newMap!16 () LongMapFixedSize!808)

(declare-fun update!128 (LongMapFixedSize!808 (_ BitVec 64) V!3097) tuple2!2274)

(assert (=> b!92584 (= lt!45488 (update!128 newMap!16 (select (arr!1971 (_keys!4100 (v!2732 (underlying!315 thiss!992)))) from!355) lt!45492))))

(declare-fun e!60343 () Bool)

(declare-fun e!60356 () Bool)

(assert (=> b!92585 (= e!60343 (and tp!9281 tp_is_empty!2587 (array_inv!1221 (_keys!4100 newMap!16)) (array_inv!1222 (_values!2401 newMap!16)) e!60356))))

(declare-fun res!47072 () Bool)

(assert (=> start!11258 (=> (not res!47072) (not e!60349))))

(declare-fun valid!357 (LongMap!608) Bool)

(assert (=> start!11258 (= res!47072 (valid!357 thiss!992))))

(assert (=> start!11258 e!60349))

(declare-fun e!60348 () Bool)

(assert (=> start!11258 e!60348))

(assert (=> start!11258 true))

(assert (=> start!11258 e!60343))

(declare-fun b!92586 () Bool)

(declare-fun Unit!2762 () Unit!2760)

(assert (=> b!92586 (= e!60357 Unit!2762)))

(declare-fun lt!45484 () Unit!2760)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!79 (array!4145 array!4147 (_ BitVec 32) (_ BitVec 32) V!3097 V!3097 (_ BitVec 64) (_ BitVec 32) Int) Unit!2760)

(assert (=> b!92586 (= lt!45484 (lemmaListMapContainsThenArrayContainsFrom!79 (_keys!4100 (v!2732 (underlying!315 thiss!992))) (_values!2401 (v!2732 (underlying!315 thiss!992))) (mask!6484 (v!2732 (underlying!315 thiss!992))) (extraKeys!2247 (v!2732 (underlying!315 thiss!992))) (zeroValue!2305 (v!2732 (underlying!315 thiss!992))) (minValue!2305 (v!2732 (underlying!315 thiss!992))) (select (arr!1971 (_keys!4100 (v!2732 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2418 (v!2732 (underlying!315 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!92586 (arrayContainsKey!0 (_keys!4100 (v!2732 (underlying!315 thiss!992))) (select (arr!1971 (_keys!4100 (v!2732 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!45475 () Unit!2760)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4145 (_ BitVec 32) (_ BitVec 32)) Unit!2760)

(assert (=> b!92586 (= lt!45475 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4100 (v!2732 (underlying!315 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1555 0))(
  ( (Nil!1552) (Cons!1551 (h!2143 (_ BitVec 64)) (t!5405 List!1555)) )
))
(declare-fun arrayNoDuplicates!0 (array!4145 (_ BitVec 32) List!1555) Bool)

(assert (=> b!92586 (arrayNoDuplicates!0 (_keys!4100 (v!2732 (underlying!315 thiss!992))) from!355 Nil!1552)))

(declare-fun lt!45485 () Unit!2760)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4145 (_ BitVec 32) (_ BitVec 64) List!1555) Unit!2760)

(assert (=> b!92586 (= lt!45485 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4100 (v!2732 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1971 (_keys!4100 (v!2732 (underlying!315 thiss!992)))) from!355) (Cons!1551 (select (arr!1971 (_keys!4100 (v!2732 (underlying!315 thiss!992)))) from!355) Nil!1552)))))

(assert (=> b!92586 false))

(declare-fun b!92587 () Bool)

(declare-fun e!60351 () Bool)

(assert (=> b!92587 (= e!60348 e!60351)))

(declare-fun b!92588 () Bool)

(declare-fun e!60354 () Bool)

(assert (=> b!92588 (= e!60354 tp_is_empty!2587)))

(declare-fun mapNonEmpty!3589 () Bool)

(declare-fun mapRes!3590 () Bool)

(declare-fun tp!9284 () Bool)

(declare-fun e!60352 () Bool)

(assert (=> mapNonEmpty!3589 (= mapRes!3590 (and tp!9284 e!60352))))

(declare-fun mapValue!3589 () ValueCell!950)

(declare-fun mapKey!3589 () (_ BitVec 32))

(declare-fun mapRest!3589 () (Array (_ BitVec 32) ValueCell!950))

(assert (=> mapNonEmpty!3589 (= (arr!1972 (_values!2401 (v!2732 (underlying!315 thiss!992)))) (store mapRest!3589 mapKey!3589 mapValue!3589))))

(declare-fun mapIsEmpty!3589 () Bool)

(assert (=> mapIsEmpty!3589 mapRes!3590))

(declare-fun mapNonEmpty!3590 () Bool)

(declare-fun mapRes!3589 () Bool)

(declare-fun tp!9282 () Bool)

(assert (=> mapNonEmpty!3590 (= mapRes!3589 (and tp!9282 e!60354))))

(declare-fun mapValue!3590 () ValueCell!950)

(declare-fun mapKey!3590 () (_ BitVec 32))

(declare-fun mapRest!3590 () (Array (_ BitVec 32) ValueCell!950))

(assert (=> mapNonEmpty!3590 (= (arr!1972 (_values!2401 newMap!16)) (store mapRest!3590 mapKey!3590 mapValue!3590))))

(declare-fun b!92589 () Bool)

(declare-fun e!60359 () Bool)

(assert (=> b!92589 (= e!60359 e!60355)))

(declare-fun res!47069 () Bool)

(assert (=> b!92589 (=> (not res!47069) (not e!60355))))

(assert (=> b!92589 (= res!47069 (and (not (= (select (arr!1971 (_keys!4100 (v!2732 (underlying!315 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1971 (_keys!4100 (v!2732 (underlying!315 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1243 (ValueCell!950 V!3097) V!3097)

(declare-fun dynLambda!355 (Int (_ BitVec 64)) V!3097)

(assert (=> b!92589 (= lt!45492 (get!1243 (select (arr!1972 (_values!2401 (v!2732 (underlying!315 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2418 (v!2732 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92590 () Bool)

(assert (=> b!92590 (= e!60349 e!60359)))

(declare-fun res!47067 () Bool)

(assert (=> b!92590 (=> (not res!47067) (not e!60359))))

(declare-fun lt!45486 () ListLongMap!1503)

(assert (=> b!92590 (= res!47067 (= lt!45486 lt!45483))))

(declare-fun map!1226 (LongMapFixedSize!808) ListLongMap!1503)

(assert (=> b!92590 (= lt!45483 (map!1226 newMap!16))))

(declare-fun getCurrentListMap!459 (array!4145 array!4147 (_ BitVec 32) (_ BitVec 32) V!3097 V!3097 (_ BitVec 32) Int) ListLongMap!1503)

(assert (=> b!92590 (= lt!45486 (getCurrentListMap!459 (_keys!4100 (v!2732 (underlying!315 thiss!992))) (_values!2401 (v!2732 (underlying!315 thiss!992))) (mask!6484 (v!2732 (underlying!315 thiss!992))) (extraKeys!2247 (v!2732 (underlying!315 thiss!992))) (zeroValue!2305 (v!2732 (underlying!315 thiss!992))) (minValue!2305 (v!2732 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2418 (v!2732 (underlying!315 thiss!992)))))))

(declare-fun b!92591 () Bool)

(declare-fun e!60344 () Bool)

(assert (=> b!92591 (= e!60344 tp_is_empty!2587)))

(declare-fun b!92592 () Bool)

(assert (=> b!92592 (= e!60356 (and e!60344 mapRes!3589))))

(declare-fun condMapEmpty!3590 () Bool)

(declare-fun mapDefault!3590 () ValueCell!950)

