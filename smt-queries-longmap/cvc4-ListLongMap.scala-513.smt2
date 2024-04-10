; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12522 () Bool)

(assert start!12522)

(declare-fun b!107646 () Bool)

(declare-fun b_free!2553 () Bool)

(declare-fun b_next!2553 () Bool)

(assert (=> b!107646 (= b_free!2553 (not b_next!2553))))

(declare-fun tp!9990 () Bool)

(declare-fun b_and!6651 () Bool)

(assert (=> b!107646 (= tp!9990 b_and!6651)))

(declare-fun b!107651 () Bool)

(declare-fun b_free!2555 () Bool)

(declare-fun b_next!2555 () Bool)

(assert (=> b!107651 (= b_free!2555 (not b_next!2555))))

(declare-fun tp!9991 () Bool)

(declare-fun b_and!6653 () Bool)

(assert (=> b!107651 (= tp!9991 b_and!6653)))

(declare-fun b!107639 () Bool)

(declare-fun e!70103 () Bool)

(declare-fun e!70096 () Bool)

(assert (=> b!107639 (= e!70103 e!70096)))

(declare-fun b!107640 () Bool)

(declare-fun e!70097 () Bool)

(declare-fun tp_is_empty!2693 () Bool)

(assert (=> b!107640 (= e!70097 tp_is_empty!2693)))

(declare-fun b!107641 () Bool)

(declare-datatypes ((Unit!3325 0))(
  ( (Unit!3326) )
))
(declare-fun e!70102 () Unit!3325)

(declare-fun Unit!3327 () Unit!3325)

(assert (=> b!107641 (= e!70102 Unit!3327)))

(declare-fun b!107642 () Bool)

(declare-fun e!70101 () Bool)

(assert (=> b!107642 (= e!70101 e!70103)))

(declare-fun b!107643 () Bool)

(declare-fun e!70100 () Bool)

(declare-fun e!70110 () Bool)

(assert (=> b!107643 (= e!70100 e!70110)))

(declare-fun res!53428 () Bool)

(assert (=> b!107643 (=> (not res!53428) (not e!70110))))

(declare-datatypes ((V!3237 0))(
  ( (V!3238 (val!1391 Int)) )
))
(declare-datatypes ((array!4379 0))(
  ( (array!4380 (arr!2077 (Array (_ BitVec 32) (_ BitVec 64))) (size!2333 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1003 0))(
  ( (ValueCellFull!1003 (v!2915 V!3237)) (EmptyCell!1003) )
))
(declare-datatypes ((array!4381 0))(
  ( (array!4382 (arr!2078 (Array (_ BitVec 32) ValueCell!1003)) (size!2334 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!914 0))(
  ( (LongMapFixedSize!915 (defaultEntry!2607 Int) (mask!6765 (_ BitVec 32)) (extraKeys!2408 (_ BitVec 32)) (zeroValue!2480 V!3237) (minValue!2480 V!3237) (_size!506 (_ BitVec 32)) (_keys!4317 array!4379) (_values!2590 array!4381) (_vacant!506 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2432 0))(
  ( (tuple2!2433 (_1!1227 Bool) (_2!1227 LongMapFixedSize!914)) )
))
(declare-fun lt!55218 () tuple2!2432)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!107643 (= res!53428 (and (_1!1227 lt!55218) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!55222 () Unit!3325)

(assert (=> b!107643 (= lt!55222 e!70102)))

(declare-datatypes ((Cell!714 0))(
  ( (Cell!715 (v!2916 LongMapFixedSize!914)) )
))
(declare-datatypes ((LongMap!714 0))(
  ( (LongMap!715 (underlying!368 Cell!714)) )
))
(declare-fun thiss!992 () LongMap!714)

(declare-fun c!18852 () Bool)

(declare-datatypes ((tuple2!2434 0))(
  ( (tuple2!2435 (_1!1228 (_ BitVec 64)) (_2!1228 V!3237)) )
))
(declare-datatypes ((List!1627 0))(
  ( (Nil!1624) (Cons!1623 (h!2221 tuple2!2434) (t!5747 List!1627)) )
))
(declare-datatypes ((ListLongMap!1587 0))(
  ( (ListLongMap!1588 (toList!809 List!1627)) )
))
(declare-fun lt!55223 () ListLongMap!1587)

(declare-fun contains!835 (ListLongMap!1587 (_ BitVec 64)) Bool)

(assert (=> b!107643 (= c!18852 (contains!835 lt!55223 (select (arr!2077 (_keys!4317 (v!2916 (underlying!368 thiss!992)))) from!355)))))

(declare-fun lt!55226 () V!3237)

(declare-fun newMap!16 () LongMapFixedSize!914)

(declare-fun update!161 (LongMapFixedSize!914 (_ BitVec 64) V!3237) tuple2!2432)

(assert (=> b!107643 (= lt!55218 (update!161 newMap!16 (select (arr!2077 (_keys!4317 (v!2916 (underlying!368 thiss!992)))) from!355) lt!55226))))

(declare-fun b!107644 () Bool)

(declare-fun Unit!3328 () Unit!3325)

(assert (=> b!107644 (= e!70102 Unit!3328)))

(declare-fun lt!55221 () Unit!3325)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!110 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3237 V!3237 (_ BitVec 64) (_ BitVec 32) Int) Unit!3325)

(assert (=> b!107644 (= lt!55221 (lemmaListMapContainsThenArrayContainsFrom!110 (_keys!4317 (v!2916 (underlying!368 thiss!992))) (_values!2590 (v!2916 (underlying!368 thiss!992))) (mask!6765 (v!2916 (underlying!368 thiss!992))) (extraKeys!2408 (v!2916 (underlying!368 thiss!992))) (zeroValue!2480 (v!2916 (underlying!368 thiss!992))) (minValue!2480 (v!2916 (underlying!368 thiss!992))) (select (arr!2077 (_keys!4317 (v!2916 (underlying!368 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2607 (v!2916 (underlying!368 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!107644 (arrayContainsKey!0 (_keys!4317 (v!2916 (underlying!368 thiss!992))) (select (arr!2077 (_keys!4317 (v!2916 (underlying!368 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!55220 () Unit!3325)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4379 (_ BitVec 32) (_ BitVec 32)) Unit!3325)

(assert (=> b!107644 (= lt!55220 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4317 (v!2916 (underlying!368 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1628 0))(
  ( (Nil!1625) (Cons!1624 (h!2222 (_ BitVec 64)) (t!5748 List!1628)) )
))
(declare-fun arrayNoDuplicates!0 (array!4379 (_ BitVec 32) List!1628) Bool)

(assert (=> b!107644 (arrayNoDuplicates!0 (_keys!4317 (v!2916 (underlying!368 thiss!992))) from!355 Nil!1625)))

(declare-fun lt!55216 () Unit!3325)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4379 (_ BitVec 32) (_ BitVec 64) List!1628) Unit!3325)

(assert (=> b!107644 (= lt!55216 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4317 (v!2916 (underlying!368 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2077 (_keys!4317 (v!2916 (underlying!368 thiss!992)))) from!355) (Cons!1624 (select (arr!2077 (_keys!4317 (v!2916 (underlying!368 thiss!992)))) from!355) Nil!1625)))))

(assert (=> b!107644 false))

(declare-fun b!107645 () Bool)

(declare-fun e!70109 () Bool)

(declare-fun e!70106 () Bool)

(assert (=> b!107645 (= e!70109 e!70106)))

(declare-fun res!53426 () Bool)

(assert (=> b!107645 (=> (not res!53426) (not e!70106))))

(declare-fun lt!55227 () ListLongMap!1587)

(assert (=> b!107645 (= res!53426 (= lt!55227 lt!55223))))

(declare-fun map!1295 (LongMapFixedSize!914) ListLongMap!1587)

(assert (=> b!107645 (= lt!55223 (map!1295 newMap!16))))

(declare-fun getCurrentListMap!494 (array!4379 array!4381 (_ BitVec 32) (_ BitVec 32) V!3237 V!3237 (_ BitVec 32) Int) ListLongMap!1587)

(assert (=> b!107645 (= lt!55227 (getCurrentListMap!494 (_keys!4317 (v!2916 (underlying!368 thiss!992))) (_values!2590 (v!2916 (underlying!368 thiss!992))) (mask!6765 (v!2916 (underlying!368 thiss!992))) (extraKeys!2408 (v!2916 (underlying!368 thiss!992))) (zeroValue!2480 (v!2916 (underlying!368 thiss!992))) (minValue!2480 (v!2916 (underlying!368 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2607 (v!2916 (underlying!368 thiss!992)))))))

(declare-fun e!70105 () Bool)

(declare-fun array_inv!1309 (array!4379) Bool)

(declare-fun array_inv!1310 (array!4381) Bool)

(assert (=> b!107646 (= e!70096 (and tp!9990 tp_is_empty!2693 (array_inv!1309 (_keys!4317 (v!2916 (underlying!368 thiss!992)))) (array_inv!1310 (_values!2590 (v!2916 (underlying!368 thiss!992)))) e!70105))))

(declare-fun b!107647 () Bool)

(declare-fun e!70099 () Bool)

(assert (=> b!107647 (= e!70099 tp_is_empty!2693)))

(declare-fun mapNonEmpty!3979 () Bool)

(declare-fun mapRes!3980 () Bool)

(declare-fun tp!9992 () Bool)

(declare-fun e!70104 () Bool)

(assert (=> mapNonEmpty!3979 (= mapRes!3980 (and tp!9992 e!70104))))

(declare-fun mapKey!3980 () (_ BitVec 32))

(declare-fun mapValue!3980 () ValueCell!1003)

(declare-fun mapRest!3980 () (Array (_ BitVec 32) ValueCell!1003))

(assert (=> mapNonEmpty!3979 (= (arr!2078 (_values!2590 (v!2916 (underlying!368 thiss!992)))) (store mapRest!3980 mapKey!3980 mapValue!3980))))

(declare-fun b!107648 () Bool)

(declare-fun e!70108 () Bool)

(assert (=> b!107648 (= e!70105 (and e!70108 mapRes!3980))))

(declare-fun condMapEmpty!3979 () Bool)

(declare-fun mapDefault!3980 () ValueCell!1003)

