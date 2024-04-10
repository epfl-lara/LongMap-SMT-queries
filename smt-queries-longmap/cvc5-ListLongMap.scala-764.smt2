; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18014 () Bool)

(assert start!18014)

(declare-fun b!179369 () Bool)

(declare-fun b_free!4423 () Bool)

(declare-fun b_next!4423 () Bool)

(assert (=> b!179369 (= b_free!4423 (not b_next!4423))))

(declare-fun tp!15993 () Bool)

(declare-fun b_and!10953 () Bool)

(assert (=> b!179369 (= tp!15993 b_and!10953)))

(declare-fun b!179364 () Bool)

(declare-fun res!84948 () Bool)

(declare-fun e!118171 () Bool)

(assert (=> b!179364 (=> (not res!84948) (not e!118171))))

(declare-datatypes ((V!5241 0))(
  ( (V!5242 (val!2142 Int)) )
))
(declare-datatypes ((ValueCell!1754 0))(
  ( (ValueCellFull!1754 (v!4029 V!5241)) (EmptyCell!1754) )
))
(declare-datatypes ((array!7555 0))(
  ( (array!7556 (arr!3579 (Array (_ BitVec 32) (_ BitVec 64))) (size!3887 (_ BitVec 32))) )
))
(declare-datatypes ((array!7557 0))(
  ( (array!7558 (arr!3580 (Array (_ BitVec 32) ValueCell!1754)) (size!3888 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2416 0))(
  ( (LongMapFixedSize!2417 (defaultEntry!3682 Int) (mask!8663 (_ BitVec 32)) (extraKeys!3419 (_ BitVec 32)) (zeroValue!3523 V!5241) (minValue!3523 V!5241) (_size!1257 (_ BitVec 32)) (_keys!5569 array!7555) (_values!3665 array!7557) (_vacant!1257 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2416)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179364 (= res!84948 (validMask!0 (mask!8663 thiss!1248)))))

(declare-fun b!179365 () Bool)

(declare-fun res!84950 () Bool)

(assert (=> b!179365 (=> (not res!84950) (not e!118171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7555 (_ BitVec 32)) Bool)

(assert (=> b!179365 (= res!84950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5569 thiss!1248) (mask!8663 thiss!1248)))))

(declare-fun b!179366 () Bool)

(declare-fun res!84946 () Bool)

(assert (=> b!179366 (=> (not res!84946) (not e!118171))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!581 0))(
  ( (MissingZero!581 (index!4492 (_ BitVec 32))) (Found!581 (index!4493 (_ BitVec 32))) (Intermediate!581 (undefined!1393 Bool) (index!4494 (_ BitVec 32)) (x!19619 (_ BitVec 32))) (Undefined!581) (MissingVacant!581 (index!4495 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7555 (_ BitVec 32)) SeekEntryResult!581)

(assert (=> b!179366 (= res!84946 (is-Undefined!581 (seekEntryOrOpen!0 key!828 (_keys!5569 thiss!1248) (mask!8663 thiss!1248))))))

(declare-fun b!179367 () Bool)

(declare-fun e!118173 () Bool)

(declare-fun tp_is_empty!4195 () Bool)

(assert (=> b!179367 (= e!118173 tp_is_empty!4195)))

(declare-fun b!179368 () Bool)

(declare-fun res!84952 () Bool)

(assert (=> b!179368 (=> (not res!84952) (not e!118171))))

(declare-datatypes ((tuple2!3330 0))(
  ( (tuple2!3331 (_1!1676 (_ BitVec 64)) (_2!1676 V!5241)) )
))
(declare-datatypes ((List!2273 0))(
  ( (Nil!2270) (Cons!2269 (h!2894 tuple2!3330) (t!7117 List!2273)) )
))
(declare-datatypes ((ListLongMap!2257 0))(
  ( (ListLongMap!2258 (toList!1144 List!2273)) )
))
(declare-fun contains!1218 (ListLongMap!2257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!796 (array!7555 array!7557 (_ BitVec 32) (_ BitVec 32) V!5241 V!5241 (_ BitVec 32) Int) ListLongMap!2257)

(assert (=> b!179368 (= res!84952 (not (contains!1218 (getCurrentListMap!796 (_keys!5569 thiss!1248) (_values!3665 thiss!1248) (mask!8663 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)) key!828)))))

(declare-fun e!118169 () Bool)

(declare-fun e!118172 () Bool)

(declare-fun array_inv!2305 (array!7555) Bool)

(declare-fun array_inv!2306 (array!7557) Bool)

(assert (=> b!179369 (= e!118169 (and tp!15993 tp_is_empty!4195 (array_inv!2305 (_keys!5569 thiss!1248)) (array_inv!2306 (_values!3665 thiss!1248)) e!118172))))

(declare-fun b!179370 () Bool)

(declare-fun e!118170 () Bool)

(assert (=> b!179370 (= e!118170 tp_is_empty!4195)))

(declare-fun mapIsEmpty!7180 () Bool)

(declare-fun mapRes!7180 () Bool)

(assert (=> mapIsEmpty!7180 mapRes!7180))

(declare-fun b!179371 () Bool)

(declare-datatypes ((List!2274 0))(
  ( (Nil!2271) (Cons!2270 (h!2895 (_ BitVec 64)) (t!7118 List!2274)) )
))
(declare-fun arrayNoDuplicates!0 (array!7555 (_ BitVec 32) List!2274) Bool)

(assert (=> b!179371 (= e!118171 (not (arrayNoDuplicates!0 (_keys!5569 thiss!1248) #b00000000000000000000000000000000 Nil!2271)))))

(declare-fun b!179372 () Bool)

(declare-fun res!84947 () Bool)

(assert (=> b!179372 (=> (not res!84947) (not e!118171))))

(assert (=> b!179372 (= res!84947 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7180 () Bool)

(declare-fun tp!15994 () Bool)

(assert (=> mapNonEmpty!7180 (= mapRes!7180 (and tp!15994 e!118170))))

(declare-fun mapRest!7180 () (Array (_ BitVec 32) ValueCell!1754))

(declare-fun mapValue!7180 () ValueCell!1754)

(declare-fun mapKey!7180 () (_ BitVec 32))

(assert (=> mapNonEmpty!7180 (= (arr!3580 (_values!3665 thiss!1248)) (store mapRest!7180 mapKey!7180 mapValue!7180))))

(declare-fun res!84951 () Bool)

(assert (=> start!18014 (=> (not res!84951) (not e!118171))))

(declare-fun valid!1010 (LongMapFixedSize!2416) Bool)

(assert (=> start!18014 (= res!84951 (valid!1010 thiss!1248))))

(assert (=> start!18014 e!118171))

(assert (=> start!18014 e!118169))

(assert (=> start!18014 true))

(declare-fun b!179373 () Bool)

(assert (=> b!179373 (= e!118172 (and e!118173 mapRes!7180))))

(declare-fun condMapEmpty!7180 () Bool)

(declare-fun mapDefault!7180 () ValueCell!1754)

