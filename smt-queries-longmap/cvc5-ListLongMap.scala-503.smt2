; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11650 () Bool)

(assert start!11650)

(declare-fun b!97419 () Bool)

(declare-fun b_free!2425 () Bool)

(declare-fun b_next!2425 () Bool)

(assert (=> b!97419 (= b_free!2425 (not b_next!2425))))

(declare-fun tp!9559 () Bool)

(declare-fun b_and!5979 () Bool)

(assert (=> b!97419 (= tp!9559 b_and!5979)))

(declare-fun b!97423 () Bool)

(declare-fun b_free!2427 () Bool)

(declare-fun b_next!2427 () Bool)

(assert (=> b!97423 (= b_free!2427 (not b_next!2427))))

(declare-fun tp!9558 () Bool)

(declare-fun b_and!5981 () Bool)

(assert (=> b!97423 (= tp!9558 b_and!5981)))

(declare-fun res!49093 () Bool)

(declare-fun e!63527 () Bool)

(assert (=> start!11650 (=> (not res!49093) (not e!63527))))

(declare-datatypes ((V!3153 0))(
  ( (V!3154 (val!1359 Int)) )
))
(declare-datatypes ((array!4237 0))(
  ( (array!4238 (arr!2013 (Array (_ BitVec 32) (_ BitVec 64))) (size!2263 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!971 0))(
  ( (ValueCellFull!971 (v!2797 V!3153)) (EmptyCell!971) )
))
(declare-datatypes ((array!4239 0))(
  ( (array!4240 (arr!2014 (Array (_ BitVec 32) ValueCell!971)) (size!2264 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!850 0))(
  ( (LongMapFixedSize!851 (defaultEntry!2480 Int) (mask!6577 (_ BitVec 32)) (extraKeys!2301 (_ BitVec 32)) (zeroValue!2363 V!3153) (minValue!2363 V!3153) (_size!474 (_ BitVec 32)) (_keys!4170 array!4237) (_values!2463 array!4239) (_vacant!474 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!650 0))(
  ( (Cell!651 (v!2798 LongMapFixedSize!850)) )
))
(declare-datatypes ((LongMap!650 0))(
  ( (LongMap!651 (underlying!336 Cell!650)) )
))
(declare-fun thiss!992 () LongMap!650)

(declare-fun valid!383 (LongMap!650) Bool)

(assert (=> start!11650 (= res!49093 (valid!383 thiss!992))))

(assert (=> start!11650 e!63527))

(declare-fun e!63535 () Bool)

(assert (=> start!11650 e!63535))

(assert (=> start!11650 true))

(declare-fun e!63530 () Bool)

(assert (=> start!11650 e!63530))

(declare-fun mapIsEmpty!3739 () Bool)

(declare-fun mapRes!3739 () Bool)

(assert (=> mapIsEmpty!3739 mapRes!3739))

(declare-fun b!97407 () Bool)

(declare-fun e!63526 () Bool)

(assert (=> b!97407 (= e!63527 e!63526)))

(declare-fun res!49094 () Bool)

(assert (=> b!97407 (=> (not res!49094) (not e!63526))))

(declare-datatypes ((tuple2!2334 0))(
  ( (tuple2!2335 (_1!1178 (_ BitVec 64)) (_2!1178 V!3153)) )
))
(declare-datatypes ((List!1579 0))(
  ( (Nil!1576) (Cons!1575 (h!2169 tuple2!2334) (t!5529 List!1579)) )
))
(declare-datatypes ((ListLongMap!1533 0))(
  ( (ListLongMap!1534 (toList!782 List!1579)) )
))
(declare-fun lt!48800 () ListLongMap!1533)

(declare-fun lt!48799 () ListLongMap!1533)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!97407 (= res!49094 (and (= lt!48799 lt!48800) (not (= (select (arr!2013 (_keys!4170 (v!2798 (underlying!336 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2013 (_keys!4170 (v!2798 (underlying!336 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!850)

(declare-fun map!1254 (LongMapFixedSize!850) ListLongMap!1533)

(assert (=> b!97407 (= lt!48800 (map!1254 newMap!16))))

(declare-fun getCurrentListMap!473 (array!4237 array!4239 (_ BitVec 32) (_ BitVec 32) V!3153 V!3153 (_ BitVec 32) Int) ListLongMap!1533)

(assert (=> b!97407 (= lt!48799 (getCurrentListMap!473 (_keys!4170 (v!2798 (underlying!336 thiss!992))) (_values!2463 (v!2798 (underlying!336 thiss!992))) (mask!6577 (v!2798 (underlying!336 thiss!992))) (extraKeys!2301 (v!2798 (underlying!336 thiss!992))) (zeroValue!2363 (v!2798 (underlying!336 thiss!992))) (minValue!2363 (v!2798 (underlying!336 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2480 (v!2798 (underlying!336 thiss!992)))))))

(declare-fun b!97408 () Bool)

(declare-fun e!63533 () Bool)

(declare-fun e!63528 () Bool)

(assert (=> b!97408 (= e!63533 e!63528)))

(declare-fun b!97409 () Bool)

(declare-fun e!63523 () Bool)

(declare-fun tp_is_empty!2629 () Bool)

(assert (=> b!97409 (= e!63523 tp_is_empty!2629)))

(declare-fun b!97410 () Bool)

(declare-fun e!63521 () Bool)

(assert (=> b!97410 (= e!63521 tp_is_empty!2629)))

(declare-fun b!97411 () Bool)

(declare-fun e!63532 () Bool)

(assert (=> b!97411 (= e!63526 e!63532)))

(declare-fun res!49089 () Bool)

(assert (=> b!97411 (=> (not res!49089) (not e!63532))))

(declare-datatypes ((tuple2!2336 0))(
  ( (tuple2!2337 (_1!1179 Bool) (_2!1179 LongMapFixedSize!850)) )
))
(declare-fun lt!48798 () tuple2!2336)

(assert (=> b!97411 (= res!49089 (and (_1!1179 lt!48798) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2935 0))(
  ( (Unit!2936) )
))
(declare-fun lt!48797 () Unit!2935)

(declare-fun e!63524 () Unit!2935)

(assert (=> b!97411 (= lt!48797 e!63524)))

(declare-fun c!16482 () Bool)

(declare-fun contains!799 (ListLongMap!1533 (_ BitVec 64)) Bool)

(assert (=> b!97411 (= c!16482 (contains!799 lt!48800 (select (arr!2013 (_keys!4170 (v!2798 (underlying!336 thiss!992)))) from!355)))))

(declare-fun update!139 (LongMapFixedSize!850 (_ BitVec 64) V!3153) tuple2!2336)

(declare-fun get!1279 (ValueCell!971 V!3153) V!3153)

(declare-fun dynLambda!367 (Int (_ BitVec 64)) V!3153)

(assert (=> b!97411 (= lt!48798 (update!139 newMap!16 (select (arr!2013 (_keys!4170 (v!2798 (underlying!336 thiss!992)))) from!355) (get!1279 (select (arr!2014 (_values!2463 (v!2798 (underlying!336 thiss!992)))) from!355) (dynLambda!367 (defaultEntry!2480 (v!2798 (underlying!336 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!97412 () Bool)

(declare-fun e!63525 () Bool)

(declare-fun e!63522 () Bool)

(assert (=> b!97412 (= e!63525 (and e!63522 mapRes!3739))))

(declare-fun condMapEmpty!3740 () Bool)

(declare-fun mapDefault!3740 () ValueCell!971)

