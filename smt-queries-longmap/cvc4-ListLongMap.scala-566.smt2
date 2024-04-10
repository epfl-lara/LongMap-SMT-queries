; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15452 () Bool)

(assert start!15452)

(declare-fun b!153528 () Bool)

(declare-fun b_free!3189 () Bool)

(declare-fun b_next!3189 () Bool)

(assert (=> b!153528 (= b_free!3189 (not b_next!3189))))

(declare-fun tp!12084 () Bool)

(declare-fun b_and!9547 () Bool)

(assert (=> b!153528 (= tp!12084 b_and!9547)))

(declare-fun b!153522 () Bool)

(declare-fun b_free!3191 () Bool)

(declare-fun b_next!3191 () Bool)

(assert (=> b!153522 (= b_free!3191 (not b_next!3191))))

(declare-fun tp!12083 () Bool)

(declare-fun b_and!9549 () Bool)

(assert (=> b!153522 (= tp!12083 b_and!9549)))

(declare-fun mapNonEmpty!5119 () Bool)

(declare-fun mapRes!5120 () Bool)

(declare-fun tp!12086 () Bool)

(declare-fun e!100241 () Bool)

(assert (=> mapNonEmpty!5119 (= mapRes!5120 (and tp!12086 e!100241))))

(declare-datatypes ((V!3661 0))(
  ( (V!3662 (val!1550 Int)) )
))
(declare-datatypes ((array!5071 0))(
  ( (array!5072 (arr!2395 (Array (_ BitVec 32) (_ BitVec 64))) (size!2672 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1162 0))(
  ( (ValueCellFull!1162 (v!3402 V!3661)) (EmptyCell!1162) )
))
(declare-datatypes ((array!5073 0))(
  ( (array!5074 (arr!2396 (Array (_ BitVec 32) ValueCell!1162)) (size!2673 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1232 0))(
  ( (LongMapFixedSize!1233 (defaultEntry!3055 Int) (mask!7453 (_ BitVec 32)) (extraKeys!2796 (_ BitVec 32)) (zeroValue!2898 V!3661) (minValue!2898 V!3661) (_size!665 (_ BitVec 32)) (_keys!4828 array!5071) (_values!3038 array!5073) (_vacant!665 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1232)

(declare-fun mapValue!5120 () ValueCell!1162)

(declare-fun mapKey!5119 () (_ BitVec 32))

(declare-fun mapRest!5120 () (Array (_ BitVec 32) ValueCell!1162))

(assert (=> mapNonEmpty!5119 (= (arr!2396 (_values!3038 newMap!16)) (store mapRest!5120 mapKey!5119 mapValue!5120))))

(declare-fun b!153514 () Bool)

(declare-fun res!72558 () Bool)

(declare-fun e!100242 () Bool)

(assert (=> b!153514 (=> (not res!72558) (not e!100242))))

(declare-fun valid!604 (LongMapFixedSize!1232) Bool)

(assert (=> b!153514 (= res!72558 (valid!604 newMap!16))))

(declare-fun b!153515 () Bool)

(declare-fun e!100236 () Bool)

(assert (=> b!153515 (= e!100236 false)))

(declare-datatypes ((Unit!4892 0))(
  ( (Unit!4893) )
))
(declare-fun lt!80665 () Unit!4892)

(declare-fun e!100230 () Unit!4892)

(assert (=> b!153515 (= lt!80665 e!100230)))

(declare-datatypes ((Cell!1014 0))(
  ( (Cell!1015 (v!3403 LongMapFixedSize!1232)) )
))
(declare-datatypes ((LongMap!1014 0))(
  ( (LongMap!1015 (underlying!518 Cell!1014)) )
))
(declare-fun thiss!992 () LongMap!1014)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun c!29460 () Bool)

(declare-datatypes ((tuple2!2814 0))(
  ( (tuple2!2815 (_1!1418 (_ BitVec 64)) (_2!1418 V!3661)) )
))
(declare-datatypes ((List!1801 0))(
  ( (Nil!1798) (Cons!1797 (h!2406 tuple2!2814) (t!6591 List!1801)) )
))
(declare-datatypes ((ListLongMap!1807 0))(
  ( (ListLongMap!1808 (toList!919 List!1801)) )
))
(declare-fun lt!80664 () ListLongMap!1807)

(declare-fun contains!966 (ListLongMap!1807 (_ BitVec 64)) Bool)

(assert (=> b!153515 (= c!29460 (contains!966 lt!80664 (select (arr!2395 (_keys!4828 (v!3403 (underlying!518 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2816 0))(
  ( (tuple2!2817 (_1!1419 Bool) (_2!1419 LongMapFixedSize!1232)) )
))
(declare-fun lt!80667 () tuple2!2816)

(declare-fun update!237 (LongMapFixedSize!1232 (_ BitVec 64) V!3661) tuple2!2816)

(declare-fun get!1600 (ValueCell!1162 V!3661) V!3661)

(declare-fun dynLambda!469 (Int (_ BitVec 64)) V!3661)

(assert (=> b!153515 (= lt!80667 (update!237 newMap!16 (select (arr!2395 (_keys!4828 (v!3403 (underlying!518 thiss!992)))) from!355) (get!1600 (select (arr!2396 (_values!3038 (v!3403 (underlying!518 thiss!992)))) from!355) (dynLambda!469 (defaultEntry!3055 (v!3403 (underlying!518 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!72560 () Bool)

(assert (=> start!15452 (=> (not res!72560) (not e!100242))))

(declare-fun valid!605 (LongMap!1014) Bool)

(assert (=> start!15452 (= res!72560 (valid!605 thiss!992))))

(assert (=> start!15452 e!100242))

(declare-fun e!100238 () Bool)

(assert (=> start!15452 e!100238))

(assert (=> start!15452 true))

(declare-fun e!100231 () Bool)

(assert (=> start!15452 e!100231))

(declare-fun b!153516 () Bool)

(declare-fun e!100232 () Bool)

(declare-fun e!100244 () Bool)

(assert (=> b!153516 (= e!100232 e!100244)))

(declare-fun b!153517 () Bool)

(declare-fun res!72559 () Bool)

(assert (=> b!153517 (=> (not res!72559) (not e!100242))))

(assert (=> b!153517 (= res!72559 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7453 newMap!16)) (_size!665 (v!3403 (underlying!518 thiss!992)))))))

(declare-fun mapNonEmpty!5120 () Bool)

(declare-fun mapRes!5119 () Bool)

(declare-fun tp!12085 () Bool)

(declare-fun e!100240 () Bool)

(assert (=> mapNonEmpty!5120 (= mapRes!5119 (and tp!12085 e!100240))))

(declare-fun mapKey!5120 () (_ BitVec 32))

(declare-fun mapValue!5119 () ValueCell!1162)

(declare-fun mapRest!5119 () (Array (_ BitVec 32) ValueCell!1162))

(assert (=> mapNonEmpty!5120 (= (arr!2396 (_values!3038 (v!3403 (underlying!518 thiss!992)))) (store mapRest!5119 mapKey!5120 mapValue!5119))))

(declare-fun b!153518 () Bool)

(assert (=> b!153518 (= e!100238 e!100232)))

(declare-fun b!153519 () Bool)

(declare-fun e!100239 () Bool)

(declare-fun e!100237 () Bool)

(assert (=> b!153519 (= e!100239 (and e!100237 mapRes!5119))))

(declare-fun condMapEmpty!5119 () Bool)

(declare-fun mapDefault!5119 () ValueCell!1162)

