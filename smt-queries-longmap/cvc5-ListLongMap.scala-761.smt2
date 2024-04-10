; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17880 () Bool)

(assert start!17880)

(declare-fun b!178378 () Bool)

(declare-fun b_free!4405 () Bool)

(declare-fun b_next!4405 () Bool)

(assert (=> b!178378 (= b_free!4405 (not b_next!4405))))

(declare-fun tp!15928 () Bool)

(declare-fun b_and!10921 () Bool)

(assert (=> b!178378 (= tp!15928 b_and!10921)))

(declare-fun b!178377 () Bool)

(declare-fun res!84510 () Bool)

(declare-fun e!117578 () Bool)

(assert (=> b!178377 (=> (not res!84510) (not e!117578))))

(declare-datatypes ((V!5217 0))(
  ( (V!5218 (val!2133 Int)) )
))
(declare-datatypes ((ValueCell!1745 0))(
  ( (ValueCellFull!1745 (v!4017 V!5217)) (EmptyCell!1745) )
))
(declare-datatypes ((array!7513 0))(
  ( (array!7514 (arr!3561 (Array (_ BitVec 32) (_ BitVec 64))) (size!3867 (_ BitVec 32))) )
))
(declare-datatypes ((array!7515 0))(
  ( (array!7516 (arr!3562 (Array (_ BitVec 32) ValueCell!1745)) (size!3868 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2398 0))(
  ( (LongMapFixedSize!2399 (defaultEntry!3668 Int) (mask!8628 (_ BitVec 32)) (extraKeys!3405 (_ BitVec 32)) (zeroValue!3509 V!5217) (minValue!3509 V!5217) (_size!1248 (_ BitVec 32)) (_keys!5545 array!7513) (_values!3651 array!7515) (_vacant!1248 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2398)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178377 (= res!84510 (validMask!0 (mask!8628 thiss!1248)))))

(declare-fun mapIsEmpty!7142 () Bool)

(declare-fun mapRes!7142 () Bool)

(assert (=> mapIsEmpty!7142 mapRes!7142))

(declare-fun tp_is_empty!4177 () Bool)

(declare-fun e!117577 () Bool)

(declare-fun e!117581 () Bool)

(declare-fun array_inv!2287 (array!7513) Bool)

(declare-fun array_inv!2288 (array!7515) Bool)

(assert (=> b!178378 (= e!117581 (and tp!15928 tp_is_empty!4177 (array_inv!2287 (_keys!5545 thiss!1248)) (array_inv!2288 (_values!3651 thiss!1248)) e!117577))))

(declare-fun res!84512 () Bool)

(assert (=> start!17880 (=> (not res!84512) (not e!117578))))

(declare-fun valid!1004 (LongMapFixedSize!2398) Bool)

(assert (=> start!17880 (= res!84512 (valid!1004 thiss!1248))))

(assert (=> start!17880 e!117578))

(assert (=> start!17880 e!117581))

(assert (=> start!17880 true))

(declare-fun b!178379 () Bool)

(declare-fun e!117580 () Bool)

(assert (=> b!178379 (= e!117580 tp_is_empty!4177)))

(declare-fun b!178380 () Bool)

(assert (=> b!178380 (= e!117578 (and (= (size!3868 (_values!3651 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8628 thiss!1248))) (= (size!3867 (_keys!5545 thiss!1248)) (size!3868 (_values!3651 thiss!1248))) (bvsge (mask!8628 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3405 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!178381 () Bool)

(declare-fun res!84509 () Bool)

(assert (=> b!178381 (=> (not res!84509) (not e!117578))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!178381 (= res!84509 (not (= key!828 (bvneg key!828))))))

(declare-fun b!178382 () Bool)

(declare-fun res!84511 () Bool)

(assert (=> b!178382 (=> (not res!84511) (not e!117578))))

(declare-datatypes ((tuple2!3316 0))(
  ( (tuple2!3317 (_1!1669 (_ BitVec 64)) (_2!1669 V!5217)) )
))
(declare-datatypes ((List!2263 0))(
  ( (Nil!2260) (Cons!2259 (h!2882 tuple2!3316) (t!7101 List!2263)) )
))
(declare-datatypes ((ListLongMap!2243 0))(
  ( (ListLongMap!2244 (toList!1137 List!2263)) )
))
(declare-fun contains!1207 (ListLongMap!2243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!789 (array!7513 array!7515 (_ BitVec 32) (_ BitVec 32) V!5217 V!5217 (_ BitVec 32) Int) ListLongMap!2243)

(assert (=> b!178382 (= res!84511 (not (contains!1207 (getCurrentListMap!789 (_keys!5545 thiss!1248) (_values!3651 thiss!1248) (mask!8628 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)) key!828)))))

(declare-fun b!178383 () Bool)

(declare-fun res!84513 () Bool)

(assert (=> b!178383 (=> (not res!84513) (not e!117578))))

(declare-datatypes ((SeekEntryResult!574 0))(
  ( (MissingZero!574 (index!4464 (_ BitVec 32))) (Found!574 (index!4465 (_ BitVec 32))) (Intermediate!574 (undefined!1386 Bool) (index!4466 (_ BitVec 32)) (x!19542 (_ BitVec 32))) (Undefined!574) (MissingVacant!574 (index!4467 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7513 (_ BitVec 32)) SeekEntryResult!574)

(assert (=> b!178383 (= res!84513 (is-Undefined!574 (seekEntryOrOpen!0 key!828 (_keys!5545 thiss!1248) (mask!8628 thiss!1248))))))

(declare-fun b!178384 () Bool)

(assert (=> b!178384 (= e!117577 (and e!117580 mapRes!7142))))

(declare-fun condMapEmpty!7142 () Bool)

(declare-fun mapDefault!7142 () ValueCell!1745)

