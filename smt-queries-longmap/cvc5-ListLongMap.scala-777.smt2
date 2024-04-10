; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18406 () Bool)

(assert start!18406)

(declare-fun b!182556 () Bool)

(declare-fun b_free!4501 () Bool)

(declare-fun b_next!4501 () Bool)

(assert (=> b!182556 (= b_free!4501 (not b_next!4501))))

(declare-fun tp!16265 () Bool)

(declare-fun b_and!11065 () Bool)

(assert (=> b!182556 (= tp!16265 b_and!11065)))

(declare-fun b!182555 () Bool)

(declare-fun res!86396 () Bool)

(declare-fun e!120209 () Bool)

(assert (=> b!182555 (=> (not res!86396) (not e!120209))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!182555 (= res!86396 (not (= key!828 (bvneg key!828))))))

(declare-fun e!120208 () Bool)

(declare-fun tp_is_empty!4273 () Bool)

(declare-datatypes ((V!5345 0))(
  ( (V!5346 (val!2181 Int)) )
))
(declare-datatypes ((ValueCell!1793 0))(
  ( (ValueCellFull!1793 (v!4081 V!5345)) (EmptyCell!1793) )
))
(declare-datatypes ((array!7733 0))(
  ( (array!7734 (arr!3657 (Array (_ BitVec 32) (_ BitVec 64))) (size!3969 (_ BitVec 32))) )
))
(declare-datatypes ((array!7735 0))(
  ( (array!7736 (arr!3658 (Array (_ BitVec 32) ValueCell!1793)) (size!3970 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2494 0))(
  ( (LongMapFixedSize!2495 (defaultEntry!3734 Int) (mask!8780 (_ BitVec 32)) (extraKeys!3471 (_ BitVec 32)) (zeroValue!3575 V!5345) (minValue!3575 V!5345) (_size!1296 (_ BitVec 32)) (_keys!5647 array!7733) (_values!3717 array!7735) (_vacant!1296 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2494)

(declare-fun e!120204 () Bool)

(declare-fun array_inv!2359 (array!7733) Bool)

(declare-fun array_inv!2360 (array!7735) Bool)

(assert (=> b!182556 (= e!120204 (and tp!16265 tp_is_empty!4273 (array_inv!2359 (_keys!5647 thiss!1248)) (array_inv!2360 (_values!3717 thiss!1248)) e!120208))))

(declare-fun b!182557 () Bool)

(declare-fun e!120206 () Bool)

(assert (=> b!182557 (= e!120206 tp_is_empty!4273)))

(declare-fun b!182558 () Bool)

(declare-fun res!86394 () Bool)

(declare-fun e!120207 () Bool)

(assert (=> b!182558 (=> (not res!86394) (not e!120207))))

(declare-datatypes ((tuple2!3398 0))(
  ( (tuple2!3399 (_1!1710 (_ BitVec 64)) (_2!1710 V!5345)) )
))
(declare-datatypes ((List!2317 0))(
  ( (Nil!2314) (Cons!2313 (h!2942 tuple2!3398) (t!7179 List!2317)) )
))
(declare-datatypes ((ListLongMap!2315 0))(
  ( (ListLongMap!2316 (toList!1173 List!2317)) )
))
(declare-fun contains!1257 (ListLongMap!2315 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!821 (array!7733 array!7735 (_ BitVec 32) (_ BitVec 32) V!5345 V!5345 (_ BitVec 32) Int) ListLongMap!2315)

(assert (=> b!182558 (= res!86394 (contains!1257 (getCurrentListMap!821 (_keys!5647 thiss!1248) (_values!3717 thiss!1248) (mask!8780 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)) key!828))))

(declare-fun b!182559 () Bool)

(declare-fun res!86393 () Bool)

(assert (=> b!182559 (=> (not res!86393) (not e!120207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182559 (= res!86393 (validMask!0 (mask!8780 thiss!1248)))))

(declare-fun res!86392 () Bool)

(assert (=> start!18406 (=> (not res!86392) (not e!120209))))

(declare-fun valid!1033 (LongMapFixedSize!2494) Bool)

(assert (=> start!18406 (= res!86392 (valid!1033 thiss!1248))))

(assert (=> start!18406 e!120209))

(assert (=> start!18406 e!120204))

(assert (=> start!18406 true))

(declare-fun b!182560 () Bool)

(declare-fun res!86395 () Bool)

(assert (=> b!182560 (=> (not res!86395) (not e!120207))))

(assert (=> b!182560 (= res!86395 (and (= (size!3970 (_values!3717 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8780 thiss!1248))) (= (size!3969 (_keys!5647 thiss!1248)) (size!3970 (_values!3717 thiss!1248))) (bvsge (mask!8780 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3471 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3471 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7334 () Bool)

(declare-fun mapRes!7334 () Bool)

(declare-fun tp!16264 () Bool)

(assert (=> mapNonEmpty!7334 (= mapRes!7334 (and tp!16264 e!120206))))

(declare-fun mapKey!7334 () (_ BitVec 32))

(declare-fun mapValue!7334 () ValueCell!1793)

(declare-fun mapRest!7334 () (Array (_ BitVec 32) ValueCell!1793))

(assert (=> mapNonEmpty!7334 (= (arr!3658 (_values!3717 thiss!1248)) (store mapRest!7334 mapKey!7334 mapValue!7334))))

(declare-fun b!182561 () Bool)

(assert (=> b!182561 (= e!120209 e!120207)))

(declare-fun res!86391 () Bool)

(assert (=> b!182561 (=> (not res!86391) (not e!120207))))

(declare-datatypes ((SeekEntryResult!607 0))(
  ( (MissingZero!607 (index!4598 (_ BitVec 32))) (Found!607 (index!4599 (_ BitVec 32))) (Intermediate!607 (undefined!1419 Bool) (index!4600 (_ BitVec 32)) (x!19899 (_ BitVec 32))) (Undefined!607) (MissingVacant!607 (index!4601 (_ BitVec 32))) )
))
(declare-fun lt!90295 () SeekEntryResult!607)

(assert (=> b!182561 (= res!86391 (and (not (is-Undefined!607 lt!90295)) (not (is-MissingVacant!607 lt!90295)) (not (is-MissingZero!607 lt!90295)) (is-Found!607 lt!90295)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7733 (_ BitVec 32)) SeekEntryResult!607)

(assert (=> b!182561 (= lt!90295 (seekEntryOrOpen!0 key!828 (_keys!5647 thiss!1248) (mask!8780 thiss!1248)))))

(declare-fun b!182562 () Bool)

(declare-fun e!120203 () Bool)

(assert (=> b!182562 (= e!120208 (and e!120203 mapRes!7334))))

(declare-fun condMapEmpty!7334 () Bool)

(declare-fun mapDefault!7334 () ValueCell!1793)

