; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12134 () Bool)

(assert start!12134)

(declare-fun b!102276 () Bool)

(declare-fun b_free!2473 () Bool)

(declare-fun b_next!2473 () Bool)

(assert (=> b!102276 (= b_free!2473 (not b_next!2473))))

(declare-fun tp!9730 () Bool)

(declare-fun b_and!6295 () Bool)

(assert (=> b!102276 (= tp!9730 b_and!6295)))

(declare-fun b!102269 () Bool)

(declare-fun b_free!2475 () Bool)

(declare-fun b_next!2475 () Bool)

(assert (=> b!102269 (= b_free!2475 (not b_next!2475))))

(declare-fun tp!9731 () Bool)

(declare-fun b_and!6297 () Bool)

(assert (=> b!102269 (= tp!9731 b_and!6297)))

(declare-fun b!102270 () Bool)

(declare-fun res!51198 () Bool)

(declare-fun e!66558 () Bool)

(assert (=> b!102270 (=> (not res!51198) (not e!66558))))

(declare-datatypes ((V!3185 0))(
  ( (V!3186 (val!1371 Int)) )
))
(declare-datatypes ((array!4293 0))(
  ( (array!4294 (arr!2037 (Array (_ BitVec 32) (_ BitVec 64))) (size!2291 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!983 0))(
  ( (ValueCellFull!983 (v!2853 V!3185)) (EmptyCell!983) )
))
(declare-datatypes ((array!4295 0))(
  ( (array!4296 (arr!2038 (Array (_ BitVec 32) ValueCell!983)) (size!2292 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!874 0))(
  ( (LongMapFixedSize!875 (defaultEntry!2548 Int) (mask!6677 (_ BitVec 32)) (extraKeys!2357 (_ BitVec 32)) (zeroValue!2425 V!3185) (minValue!2425 V!3185) (_size!486 (_ BitVec 32)) (_keys!4250 array!4293) (_values!2531 array!4295) (_vacant!486 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!674 0))(
  ( (Cell!675 (v!2854 LongMapFixedSize!874)) )
))
(declare-datatypes ((LongMap!674 0))(
  ( (LongMap!675 (underlying!348 Cell!674)) )
))
(declare-fun thiss!992 () LongMap!674)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4293 (_ BitVec 32)) Bool)

(assert (=> b!102270 (= res!51198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4250 (v!2854 (underlying!348 thiss!992))) (mask!6677 (v!2854 (underlying!348 thiss!992)))))))

(declare-fun b!102271 () Bool)

(declare-fun e!66567 () Bool)

(declare-fun tp_is_empty!2653 () Bool)

(assert (=> b!102271 (= e!66567 tp_is_empty!2653)))

(declare-fun b!102272 () Bool)

(declare-datatypes ((Unit!3114 0))(
  ( (Unit!3115) )
))
(declare-fun e!66557 () Unit!3114)

(declare-fun Unit!3116 () Unit!3114)

(assert (=> b!102272 (= e!66557 Unit!3116)))

(declare-fun lt!52030 () Unit!3114)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!96 (array!4293 array!4295 (_ BitVec 32) (_ BitVec 32) V!3185 V!3185 (_ BitVec 64) (_ BitVec 32) Int) Unit!3114)

(assert (=> b!102272 (= lt!52030 (lemmaListMapContainsThenArrayContainsFrom!96 (_keys!4250 (v!2854 (underlying!348 thiss!992))) (_values!2531 (v!2854 (underlying!348 thiss!992))) (mask!6677 (v!2854 (underlying!348 thiss!992))) (extraKeys!2357 (v!2854 (underlying!348 thiss!992))) (zeroValue!2425 (v!2854 (underlying!348 thiss!992))) (minValue!2425 (v!2854 (underlying!348 thiss!992))) (select (arr!2037 (_keys!4250 (v!2854 (underlying!348 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2548 (v!2854 (underlying!348 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102272 (arrayContainsKey!0 (_keys!4250 (v!2854 (underlying!348 thiss!992))) (select (arr!2037 (_keys!4250 (v!2854 (underlying!348 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!52027 () Unit!3114)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4293 (_ BitVec 32) (_ BitVec 32)) Unit!3114)

(assert (=> b!102272 (= lt!52027 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4250 (v!2854 (underlying!348 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1595 0))(
  ( (Nil!1592) (Cons!1591 (h!2187 (_ BitVec 64)) (t!5617 List!1595)) )
))
(declare-fun arrayNoDuplicates!0 (array!4293 (_ BitVec 32) List!1595) Bool)

(assert (=> b!102272 (arrayNoDuplicates!0 (_keys!4250 (v!2854 (underlying!348 thiss!992))) from!355 Nil!1592)))

(declare-fun lt!52033 () Unit!3114)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4293 (_ BitVec 32) (_ BitVec 64) List!1595) Unit!3114)

(assert (=> b!102272 (= lt!52033 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4250 (v!2854 (underlying!348 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2037 (_keys!4250 (v!2854 (underlying!348 thiss!992)))) from!355) (Cons!1591 (select (arr!2037 (_keys!4250 (v!2854 (underlying!348 thiss!992)))) from!355) Nil!1592)))))

(assert (=> b!102272 false))

(declare-fun mapIsEmpty!3839 () Bool)

(declare-fun mapRes!3839 () Bool)

(assert (=> mapIsEmpty!3839 mapRes!3839))

(declare-fun b!102273 () Bool)

(declare-fun e!66556 () Bool)

(assert (=> b!102273 (= e!66556 tp_is_empty!2653)))

(declare-fun b!102274 () Bool)

(declare-fun e!66566 () Bool)

(declare-fun e!66559 () Bool)

(assert (=> b!102274 (= e!66566 e!66559)))

(declare-fun res!51195 () Bool)

(assert (=> b!102274 (=> (not res!51195) (not e!66559))))

(declare-datatypes ((tuple2!2370 0))(
  ( (tuple2!2371 (_1!1196 (_ BitVec 64)) (_2!1196 V!3185)) )
))
(declare-datatypes ((List!1596 0))(
  ( (Nil!1593) (Cons!1592 (h!2188 tuple2!2370) (t!5618 List!1596)) )
))
(declare-datatypes ((ListLongMap!1551 0))(
  ( (ListLongMap!1552 (toList!791 List!1596)) )
))
(declare-fun lt!52029 () ListLongMap!1551)

(declare-fun lt!52031 () ListLongMap!1551)

(assert (=> b!102274 (= res!51195 (and (= lt!52029 lt!52031) (not (= (select (arr!2037 (_keys!4250 (v!2854 (underlying!348 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2037 (_keys!4250 (v!2854 (underlying!348 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!874)

(declare-fun map!1270 (LongMapFixedSize!874) ListLongMap!1551)

(assert (=> b!102274 (= lt!52031 (map!1270 newMap!16))))

(declare-fun getCurrentListMap!481 (array!4293 array!4295 (_ BitVec 32) (_ BitVec 32) V!3185 V!3185 (_ BitVec 32) Int) ListLongMap!1551)

(assert (=> b!102274 (= lt!52029 (getCurrentListMap!481 (_keys!4250 (v!2854 (underlying!348 thiss!992))) (_values!2531 (v!2854 (underlying!348 thiss!992))) (mask!6677 (v!2854 (underlying!348 thiss!992))) (extraKeys!2357 (v!2854 (underlying!348 thiss!992))) (zeroValue!2425 (v!2854 (underlying!348 thiss!992))) (minValue!2425 (v!2854 (underlying!348 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2548 (v!2854 (underlying!348 thiss!992)))))))

(declare-fun b!102275 () Bool)

(declare-fun Unit!3117 () Unit!3114)

(assert (=> b!102275 (= e!66557 Unit!3117)))

(declare-fun e!66562 () Bool)

(declare-fun e!66561 () Bool)

(declare-fun array_inv!1275 (array!4293) Bool)

(declare-fun array_inv!1276 (array!4295) Bool)

(assert (=> b!102276 (= e!66562 (and tp!9730 tp_is_empty!2653 (array_inv!1275 (_keys!4250 (v!2854 (underlying!348 thiss!992)))) (array_inv!1276 (_values!2531 (v!2854 (underlying!348 thiss!992)))) e!66561))))

(declare-fun b!102277 () Bool)

(declare-fun res!51201 () Bool)

(assert (=> b!102277 (=> (not res!51201) (not e!66566))))

(declare-fun valid!401 (LongMapFixedSize!874) Bool)

(assert (=> b!102277 (= res!51201 (valid!401 newMap!16))))

(declare-fun mapNonEmpty!3839 () Bool)

(declare-fun tp!9729 () Bool)

(assert (=> mapNonEmpty!3839 (= mapRes!3839 (and tp!9729 e!66567))))

(declare-fun mapValue!3839 () ValueCell!983)

(declare-fun mapKey!3840 () (_ BitVec 32))

(declare-fun mapRest!3840 () (Array (_ BitVec 32) ValueCell!983))

(assert (=> mapNonEmpty!3839 (= (arr!2038 (_values!2531 (v!2854 (underlying!348 thiss!992)))) (store mapRest!3840 mapKey!3840 mapValue!3839))))

(declare-fun b!102278 () Bool)

(declare-fun res!51193 () Bool)

(assert (=> b!102278 (=> (not res!51193) (not e!66558))))

(assert (=> b!102278 (= res!51193 (arrayNoDuplicates!0 (_keys!4250 (v!2854 (underlying!348 thiss!992))) #b00000000000000000000000000000000 Nil!1592))))

(declare-fun b!102279 () Bool)

(declare-fun e!66565 () Bool)

(assert (=> b!102279 (= e!66565 tp_is_empty!2653)))

(declare-fun b!102280 () Bool)

(declare-fun res!51194 () Bool)

(assert (=> b!102280 (=> (not res!51194) (not e!66566))))

(assert (=> b!102280 (= res!51194 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6677 newMap!16)) (_size!486 (v!2854 (underlying!348 thiss!992)))))))

(declare-fun b!102281 () Bool)

(declare-fun e!66554 () Bool)

(declare-fun e!66564 () Bool)

(assert (=> b!102281 (= e!66554 e!66564)))

(declare-fun b!102282 () Bool)

(declare-fun res!51202 () Bool)

(assert (=> b!102282 (=> (not res!51202) (not e!66558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!102282 (= res!51202 (validMask!0 (mask!6677 (v!2854 (underlying!348 thiss!992)))))))

(declare-fun b!102283 () Bool)

(declare-fun e!66563 () Bool)

(declare-fun mapRes!3840 () Bool)

(assert (=> b!102283 (= e!66563 (and e!66565 mapRes!3840))))

(declare-fun condMapEmpty!3839 () Bool)

(declare-fun mapDefault!3839 () ValueCell!983)

