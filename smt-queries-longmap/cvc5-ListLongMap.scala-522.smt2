; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13122 () Bool)

(assert start!13122)

(declare-fun b!114953 () Bool)

(declare-fun b_free!2653 () Bool)

(declare-fun b_next!2653 () Bool)

(assert (=> b!114953 (= b_free!2653 (not b_next!2653))))

(declare-fun tp!10322 () Bool)

(declare-fun b_and!7111 () Bool)

(assert (=> b!114953 (= tp!10322 b_and!7111)))

(declare-fun b!114946 () Bool)

(declare-fun b_free!2655 () Bool)

(declare-fun b_next!2655 () Bool)

(assert (=> b!114946 (= b_free!2655 (not b_next!2655))))

(declare-fun tp!10324 () Bool)

(declare-fun b_and!7113 () Bool)

(assert (=> b!114946 (= tp!10324 b_and!7113)))

(declare-fun b!114940 () Bool)

(declare-fun e!74847 () Bool)

(assert (=> b!114940 (= e!74847 false)))

(declare-datatypes ((Unit!3593 0))(
  ( (Unit!3594) )
))
(declare-fun lt!59915 () Unit!3593)

(declare-fun e!74833 () Unit!3593)

(assert (=> b!114940 (= lt!59915 e!74833)))

(declare-datatypes ((V!3305 0))(
  ( (V!3306 (val!1416 Int)) )
))
(declare-datatypes ((array!4489 0))(
  ( (array!4490 (arr!2127 (Array (_ BitVec 32) (_ BitVec 64))) (size!2387 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1028 0))(
  ( (ValueCellFull!1028 (v!3001 V!3305)) (EmptyCell!1028) )
))
(declare-datatypes ((array!4491 0))(
  ( (array!4492 (arr!2128 (Array (_ BitVec 32) ValueCell!1028)) (size!2388 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!964 0))(
  ( (LongMapFixedSize!965 (defaultEntry!2691 Int) (mask!6891 (_ BitVec 32)) (extraKeys!2480 (_ BitVec 32)) (zeroValue!2558 V!3305) (minValue!2558 V!3305) (_size!531 (_ BitVec 32)) (_keys!4413 array!4489) (_values!2674 array!4491) (_vacant!531 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!764 0))(
  ( (Cell!765 (v!3002 LongMapFixedSize!964)) )
))
(declare-datatypes ((LongMap!764 0))(
  ( (LongMap!765 (underlying!393 Cell!764)) )
))
(declare-fun thiss!992 () LongMap!764)

(declare-datatypes ((tuple2!2492 0))(
  ( (tuple2!2493 (_1!1257 (_ BitVec 64)) (_2!1257 V!3305)) )
))
(declare-datatypes ((List!1659 0))(
  ( (Nil!1656) (Cons!1655 (h!2255 tuple2!2492) (t!5905 List!1659)) )
))
(declare-datatypes ((ListLongMap!1621 0))(
  ( (ListLongMap!1622 (toList!826 List!1659)) )
))
(declare-fun lt!59913 () ListLongMap!1621)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun c!20519 () Bool)

(declare-fun contains!858 (ListLongMap!1621 (_ BitVec 64)) Bool)

(assert (=> b!114940 (= c!20519 (contains!858 lt!59913 (select (arr!2127 (_keys!4413 (v!3002 (underlying!393 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!964)

(declare-datatypes ((tuple2!2494 0))(
  ( (tuple2!2495 (_1!1258 Bool) (_2!1258 LongMapFixedSize!964)) )
))
(declare-fun lt!59916 () tuple2!2494)

(declare-fun update!174 (LongMapFixedSize!964 (_ BitVec 64) V!3305) tuple2!2494)

(declare-fun get!1385 (ValueCell!1028 V!3305) V!3305)

(declare-fun dynLambda!401 (Int (_ BitVec 64)) V!3305)

(assert (=> b!114940 (= lt!59916 (update!174 newMap!16 (select (arr!2127 (_keys!4413 (v!3002 (underlying!393 thiss!992)))) from!355) (get!1385 (select (arr!2128 (_values!2674 (v!3002 (underlying!393 thiss!992)))) from!355) (dynLambda!401 (defaultEntry!2691 (v!3002 (underlying!393 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!114941 () Bool)

(declare-fun Unit!3595 () Unit!3593)

(assert (=> b!114941 (= e!74833 Unit!3595)))

(declare-fun lt!59911 () Unit!3593)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!124 (array!4489 array!4491 (_ BitVec 32) (_ BitVec 32) V!3305 V!3305 (_ BitVec 64) (_ BitVec 32) Int) Unit!3593)

(assert (=> b!114941 (= lt!59911 (lemmaListMapContainsThenArrayContainsFrom!124 (_keys!4413 (v!3002 (underlying!393 thiss!992))) (_values!2674 (v!3002 (underlying!393 thiss!992))) (mask!6891 (v!3002 (underlying!393 thiss!992))) (extraKeys!2480 (v!3002 (underlying!393 thiss!992))) (zeroValue!2558 (v!3002 (underlying!393 thiss!992))) (minValue!2558 (v!3002 (underlying!393 thiss!992))) (select (arr!2127 (_keys!4413 (v!3002 (underlying!393 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2691 (v!3002 (underlying!393 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114941 (arrayContainsKey!0 (_keys!4413 (v!3002 (underlying!393 thiss!992))) (select (arr!2127 (_keys!4413 (v!3002 (underlying!393 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59910 () Unit!3593)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4489 (_ BitVec 32) (_ BitVec 32)) Unit!3593)

(assert (=> b!114941 (= lt!59910 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4413 (v!3002 (underlying!393 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1660 0))(
  ( (Nil!1657) (Cons!1656 (h!2256 (_ BitVec 64)) (t!5906 List!1660)) )
))
(declare-fun arrayNoDuplicates!0 (array!4489 (_ BitVec 32) List!1660) Bool)

(assert (=> b!114941 (arrayNoDuplicates!0 (_keys!4413 (v!3002 (underlying!393 thiss!992))) from!355 Nil!1657)))

(declare-fun lt!59912 () Unit!3593)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4489 (_ BitVec 32) (_ BitVec 64) List!1660) Unit!3593)

(assert (=> b!114941 (= lt!59912 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4413 (v!3002 (underlying!393 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2127 (_keys!4413 (v!3002 (underlying!393 thiss!992)))) from!355) (Cons!1656 (select (arr!2127 (_keys!4413 (v!3002 (underlying!393 thiss!992)))) from!355) Nil!1657)))))

(assert (=> b!114941 false))

(declare-fun b!114942 () Bool)

(declare-fun e!74835 () Bool)

(declare-fun e!74836 () Bool)

(assert (=> b!114942 (= e!74835 e!74836)))

(declare-fun mapIsEmpty!4161 () Bool)

(declare-fun mapRes!4161 () Bool)

(assert (=> mapIsEmpty!4161 mapRes!4161))

(declare-fun b!114943 () Bool)

(declare-fun e!74838 () Bool)

(declare-fun e!74840 () Bool)

(declare-fun mapRes!4162 () Bool)

(assert (=> b!114943 (= e!74838 (and e!74840 mapRes!4162))))

(declare-fun condMapEmpty!4162 () Bool)

(declare-fun mapDefault!4161 () ValueCell!1028)

