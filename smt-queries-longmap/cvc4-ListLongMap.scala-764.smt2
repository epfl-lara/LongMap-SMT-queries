; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18018 () Bool)

(assert start!18018)

(declare-fun b!179433 () Bool)

(declare-fun b_free!4427 () Bool)

(declare-fun b_next!4427 () Bool)

(assert (=> b!179433 (= b_free!4427 (not b_next!4427))))

(declare-fun tp!16005 () Bool)

(declare-fun b_and!10957 () Bool)

(assert (=> b!179433 (= tp!16005 b_and!10957)))

(declare-fun mapIsEmpty!7186 () Bool)

(declare-fun mapRes!7186 () Bool)

(assert (=> mapIsEmpty!7186 mapRes!7186))

(declare-fun b!179430 () Bool)

(declare-fun res!84988 () Bool)

(declare-fun e!118209 () Bool)

(assert (=> b!179430 (=> (not res!84988) (not e!118209))))

(declare-datatypes ((V!5245 0))(
  ( (V!5246 (val!2144 Int)) )
))
(declare-datatypes ((ValueCell!1756 0))(
  ( (ValueCellFull!1756 (v!4031 V!5245)) (EmptyCell!1756) )
))
(declare-datatypes ((array!7563 0))(
  ( (array!7564 (arr!3583 (Array (_ BitVec 32) (_ BitVec 64))) (size!3891 (_ BitVec 32))) )
))
(declare-datatypes ((array!7565 0))(
  ( (array!7566 (arr!3584 (Array (_ BitVec 32) ValueCell!1756)) (size!3892 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2420 0))(
  ( (LongMapFixedSize!2421 (defaultEntry!3684 Int) (mask!8665 (_ BitVec 32)) (extraKeys!3421 (_ BitVec 32)) (zeroValue!3525 V!5245) (minValue!3525 V!5245) (_size!1259 (_ BitVec 32)) (_keys!5571 array!7563) (_values!3667 array!7565) (_vacant!1259 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2420)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179430 (= res!84988 (validMask!0 (mask!8665 thiss!1248)))))

(declare-fun b!179431 () Bool)

(declare-fun res!84993 () Bool)

(assert (=> b!179431 (=> (not res!84993) (not e!118209))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3334 0))(
  ( (tuple2!3335 (_1!1678 (_ BitVec 64)) (_2!1678 V!5245)) )
))
(declare-datatypes ((List!2277 0))(
  ( (Nil!2274) (Cons!2273 (h!2898 tuple2!3334) (t!7121 List!2277)) )
))
(declare-datatypes ((ListLongMap!2261 0))(
  ( (ListLongMap!2262 (toList!1146 List!2277)) )
))
(declare-fun contains!1220 (ListLongMap!2261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!798 (array!7563 array!7565 (_ BitVec 32) (_ BitVec 32) V!5245 V!5245 (_ BitVec 32) Int) ListLongMap!2261)

(assert (=> b!179431 (= res!84993 (not (contains!1220 (getCurrentListMap!798 (_keys!5571 thiss!1248) (_values!3667 thiss!1248) (mask!8665 thiss!1248) (extraKeys!3421 thiss!1248) (zeroValue!3525 thiss!1248) (minValue!3525 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3684 thiss!1248)) key!828)))))

(declare-fun b!179432 () Bool)

(declare-datatypes ((List!2278 0))(
  ( (Nil!2275) (Cons!2274 (h!2899 (_ BitVec 64)) (t!7122 List!2278)) )
))
(declare-fun arrayNoDuplicates!0 (array!7563 (_ BitVec 32) List!2278) Bool)

(assert (=> b!179432 (= e!118209 (not (arrayNoDuplicates!0 (_keys!5571 thiss!1248) #b00000000000000000000000000000000 Nil!2275)))))

(declare-fun tp_is_empty!4199 () Bool)

(declare-fun e!118207 () Bool)

(declare-fun e!118210 () Bool)

(declare-fun array_inv!2309 (array!7563) Bool)

(declare-fun array_inv!2310 (array!7565) Bool)

(assert (=> b!179433 (= e!118210 (and tp!16005 tp_is_empty!4199 (array_inv!2309 (_keys!5571 thiss!1248)) (array_inv!2310 (_values!3667 thiss!1248)) e!118207))))

(declare-fun b!179434 () Bool)

(declare-fun res!84989 () Bool)

(assert (=> b!179434 (=> (not res!84989) (not e!118209))))

(assert (=> b!179434 (= res!84989 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179435 () Bool)

(declare-fun e!118206 () Bool)

(assert (=> b!179435 (= e!118206 tp_is_empty!4199)))

(declare-fun b!179436 () Bool)

(assert (=> b!179436 (= e!118207 (and e!118206 mapRes!7186))))

(declare-fun condMapEmpty!7186 () Bool)

(declare-fun mapDefault!7186 () ValueCell!1756)

