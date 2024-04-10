; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18618 () Bool)

(assert start!18618)

(declare-fun b!184333 () Bool)

(declare-fun b_free!4547 () Bool)

(declare-fun b_next!4547 () Bool)

(assert (=> b!184333 (= b_free!4547 (not b_next!4547))))

(declare-fun tp!16423 () Bool)

(declare-fun b_and!11131 () Bool)

(assert (=> b!184333 (= tp!16423 b_and!11131)))

(declare-fun b!184326 () Bool)

(declare-fun res!87217 () Bool)

(declare-fun e!121342 () Bool)

(assert (=> b!184326 (=> (not res!87217) (not e!121342))))

(declare-datatypes ((V!5405 0))(
  ( (V!5406 (val!2204 Int)) )
))
(declare-datatypes ((ValueCell!1816 0))(
  ( (ValueCellFull!1816 (v!4110 V!5405)) (EmptyCell!1816) )
))
(declare-datatypes ((array!7837 0))(
  ( (array!7838 (arr!3703 (Array (_ BitVec 32) (_ BitVec 64))) (size!4017 (_ BitVec 32))) )
))
(declare-datatypes ((array!7839 0))(
  ( (array!7840 (arr!3704 (Array (_ BitVec 32) ValueCell!1816)) (size!4018 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2540 0))(
  ( (LongMapFixedSize!2541 (defaultEntry!3765 Int) (mask!8847 (_ BitVec 32)) (extraKeys!3502 (_ BitVec 32)) (zeroValue!3606 V!5405) (minValue!3606 V!5405) (_size!1319 (_ BitVec 32)) (_keys!5692 array!7837) (_values!3748 array!7839) (_vacant!1319 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2540)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184326 (= res!87217 (validMask!0 (mask!8847 thiss!1248)))))

(declare-fun b!184327 () Bool)

(declare-fun res!87216 () Bool)

(assert (=> b!184327 (=> (not res!87216) (not e!121342))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3432 0))(
  ( (tuple2!3433 (_1!1727 (_ BitVec 64)) (_2!1727 V!5405)) )
))
(declare-datatypes ((List!2346 0))(
  ( (Nil!2343) (Cons!2342 (h!2973 tuple2!3432) (t!7220 List!2346)) )
))
(declare-datatypes ((ListLongMap!2349 0))(
  ( (ListLongMap!2350 (toList!1190 List!2346)) )
))
(declare-fun contains!1280 (ListLongMap!2349 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!838 (array!7837 array!7839 (_ BitVec 32) (_ BitVec 32) V!5405 V!5405 (_ BitVec 32) Int) ListLongMap!2349)

(assert (=> b!184327 (= res!87216 (not (contains!1280 (getCurrentListMap!838 (_keys!5692 thiss!1248) (_values!3748 thiss!1248) (mask!8847 thiss!1248) (extraKeys!3502 thiss!1248) (zeroValue!3606 thiss!1248) (minValue!3606 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3765 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!7423 () Bool)

(declare-fun mapRes!7423 () Bool)

(declare-fun tp!16422 () Bool)

(declare-fun e!121340 () Bool)

(assert (=> mapNonEmpty!7423 (= mapRes!7423 (and tp!16422 e!121340))))

(declare-fun mapRest!7423 () (Array (_ BitVec 32) ValueCell!1816))

(declare-fun mapKey!7423 () (_ BitVec 32))

(declare-fun mapValue!7423 () ValueCell!1816)

(assert (=> mapNonEmpty!7423 (= (arr!3704 (_values!3748 thiss!1248)) (store mapRest!7423 mapKey!7423 mapValue!7423))))

(declare-fun b!184328 () Bool)

(declare-fun res!87220 () Bool)

(declare-fun e!121344 () Bool)

(assert (=> b!184328 (=> (not res!87220) (not e!121344))))

(assert (=> b!184328 (= res!87220 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7423 () Bool)

(assert (=> mapIsEmpty!7423 mapRes!7423))

(declare-fun b!184329 () Bool)

(assert (=> b!184329 (= e!121342 (and (= (size!4018 (_values!3748 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8847 thiss!1248))) (= (size!4017 (_keys!5692 thiss!1248)) (size!4018 (_values!3748 thiss!1248))) (bvsge (mask!8847 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3502 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!184330 () Bool)

(declare-fun e!121341 () Bool)

(declare-fun e!121343 () Bool)

(assert (=> b!184330 (= e!121341 (and e!121343 mapRes!7423))))

(declare-fun condMapEmpty!7423 () Bool)

(declare-fun mapDefault!7423 () ValueCell!1816)

