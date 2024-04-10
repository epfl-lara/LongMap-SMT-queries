; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8244 () Bool)

(assert start!8244)

(declare-fun b!52378 () Bool)

(declare-fun b_free!1653 () Bool)

(declare-fun b_next!1653 () Bool)

(assert (=> b!52378 (= b_free!1653 (not b_next!1653))))

(declare-fun tp!7059 () Bool)

(declare-fun b_and!2863 () Bool)

(assert (=> b!52378 (= tp!7059 b_and!2863)))

(declare-fun b!52387 () Bool)

(declare-fun b_free!1655 () Bool)

(declare-fun b_next!1655 () Bool)

(assert (=> b!52387 (= b_free!1655 (not b_next!1655))))

(declare-fun tp!7061 () Bool)

(declare-fun b_and!2865 () Bool)

(assert (=> b!52387 (= tp!7061 b_and!2865)))

(declare-fun e!34097 () Bool)

(declare-datatypes ((V!2637 0))(
  ( (V!2638 (val!1166 Int)) )
))
(declare-datatypes ((array!3409 0))(
  ( (array!3410 (arr!1627 (Array (_ BitVec 32) (_ BitVec 64))) (size!1856 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!778 0))(
  ( (ValueCellFull!778 (v!2221 V!2637)) (EmptyCell!778) )
))
(declare-datatypes ((array!3411 0))(
  ( (array!3412 (arr!1628 (Array (_ BitVec 32) ValueCell!778)) (size!1857 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!464 0))(
  ( (LongMapFixedSize!465 (defaultEntry!1946 Int) (mask!5769 (_ BitVec 32)) (extraKeys!1837 (_ BitVec 32)) (zeroValue!1864 V!2637) (minValue!1864 V!2637) (_size!281 (_ BitVec 32)) (_keys!3566 array!3409) (_values!1929 array!3411) (_vacant!281 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!286 0))(
  ( (Cell!287 (v!2222 LongMapFixedSize!464)) )
))
(declare-datatypes ((LongMap!286 0))(
  ( (LongMap!287 (underlying!154 Cell!286)) )
))
(declare-fun thiss!992 () LongMap!286)

(declare-fun e!34095 () Bool)

(declare-fun tp_is_empty!2243 () Bool)

(declare-fun array_inv!1003 (array!3409) Bool)

(declare-fun array_inv!1004 (array!3411) Bool)

(assert (=> b!52378 (= e!34097 (and tp!7059 tp_is_empty!2243 (array_inv!1003 (_keys!3566 (v!2222 (underlying!154 thiss!992)))) (array_inv!1004 (_values!1929 (v!2222 (underlying!154 thiss!992)))) e!34095))))

(declare-fun mapIsEmpty!2399 () Bool)

(declare-fun mapRes!2399 () Bool)

(assert (=> mapIsEmpty!2399 mapRes!2399))

(declare-fun b!52379 () Bool)

(declare-fun e!34098 () Bool)

(declare-fun e!34100 () Bool)

(assert (=> b!52379 (= e!34098 e!34100)))

(declare-fun b!52380 () Bool)

(declare-fun e!34088 () Bool)

(assert (=> b!52380 (= e!34088 tp_is_empty!2243)))

(declare-fun b!52381 () Bool)

(declare-fun e!34093 () Bool)

(assert (=> b!52381 (= e!34093 false)))

(declare-datatypes ((tuple2!1846 0))(
  ( (tuple2!1847 (_1!934 (_ BitVec 64)) (_2!934 V!2637)) )
))
(declare-datatypes ((List!1339 0))(
  ( (Nil!1336) (Cons!1335 (h!1915 tuple2!1846) (t!4373 List!1339)) )
))
(declare-datatypes ((ListLongMap!1261 0))(
  ( (ListLongMap!1262 (toList!646 List!1339)) )
))
(declare-fun lt!21276 () ListLongMap!1261)

(declare-fun newMap!16 () LongMapFixedSize!464)

(declare-fun map!1010 (LongMapFixedSize!464) ListLongMap!1261)

(assert (=> b!52381 (= lt!21276 (map!1010 newMap!16))))

(declare-fun lt!21275 () ListLongMap!1261)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!359 (array!3409 array!3411 (_ BitVec 32) (_ BitVec 32) V!2637 V!2637 (_ BitVec 32) Int) ListLongMap!1261)

(assert (=> b!52381 (= lt!21275 (getCurrentListMap!359 (_keys!3566 (v!2222 (underlying!154 thiss!992))) (_values!1929 (v!2222 (underlying!154 thiss!992))) (mask!5769 (v!2222 (underlying!154 thiss!992))) (extraKeys!1837 (v!2222 (underlying!154 thiss!992))) (zeroValue!1864 (v!2222 (underlying!154 thiss!992))) (minValue!1864 (v!2222 (underlying!154 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1946 (v!2222 (underlying!154 thiss!992)))))))

(declare-fun mapNonEmpty!2399 () Bool)

(declare-fun tp!7062 () Bool)

(declare-fun e!34092 () Bool)

(assert (=> mapNonEmpty!2399 (= mapRes!2399 (and tp!7062 e!34092))))

(declare-fun mapValue!2399 () ValueCell!778)

(declare-fun mapRest!2400 () (Array (_ BitVec 32) ValueCell!778))

(declare-fun mapKey!2400 () (_ BitVec 32))

(assert (=> mapNonEmpty!2399 (= (arr!1628 (_values!1929 newMap!16)) (store mapRest!2400 mapKey!2400 mapValue!2399))))

(declare-fun mapNonEmpty!2400 () Bool)

(declare-fun mapRes!2400 () Bool)

(declare-fun tp!7060 () Bool)

(declare-fun e!34099 () Bool)

(assert (=> mapNonEmpty!2400 (= mapRes!2400 (and tp!7060 e!34099))))

(declare-fun mapRest!2399 () (Array (_ BitVec 32) ValueCell!778))

(declare-fun mapValue!2400 () ValueCell!778)

(declare-fun mapKey!2399 () (_ BitVec 32))

(assert (=> mapNonEmpty!2400 (= (arr!1628 (_values!1929 (v!2222 (underlying!154 thiss!992)))) (store mapRest!2399 mapKey!2399 mapValue!2400))))

(declare-fun b!52383 () Bool)

(assert (=> b!52383 (= e!34099 tp_is_empty!2243)))

(declare-fun b!52384 () Bool)

(declare-fun res!29790 () Bool)

(assert (=> b!52384 (=> (not res!29790) (not e!34093))))

(assert (=> b!52384 (= res!29790 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5769 newMap!16)) (_size!281 (v!2222 (underlying!154 thiss!992)))))))

(declare-fun b!52385 () Bool)

(declare-fun res!29791 () Bool)

(assert (=> b!52385 (=> (not res!29791) (not e!34093))))

(assert (=> b!52385 (= res!29791 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1856 (_keys!3566 (v!2222 (underlying!154 thiss!992)))))))))

(declare-fun b!52386 () Bool)

(declare-fun e!34094 () Bool)

(declare-fun e!34091 () Bool)

(assert (=> b!52386 (= e!34094 (and e!34091 mapRes!2399))))

(declare-fun condMapEmpty!2399 () Bool)

(declare-fun mapDefault!2399 () ValueCell!778)

