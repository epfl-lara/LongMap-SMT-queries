; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16270 () Bool)

(assert start!16270)

(declare-fun b!162320 () Bool)

(declare-fun b_free!3731 () Bool)

(declare-fun b_next!3731 () Bool)

(assert (=> b!162320 (= b_free!3731 (not b_next!3731))))

(declare-fun tp!13763 () Bool)

(declare-fun b_and!10145 () Bool)

(assert (=> b!162320 (= tp!13763 b_and!10145)))

(declare-fun b!162318 () Bool)

(declare-fun e!106335 () Bool)

(declare-fun tp_is_empty!3533 () Bool)

(assert (=> b!162318 (= e!106335 tp_is_empty!3533)))

(declare-fun mapNonEmpty!5987 () Bool)

(declare-fun mapRes!5987 () Bool)

(declare-fun tp!13762 () Bool)

(declare-fun e!106333 () Bool)

(assert (=> mapNonEmpty!5987 (= mapRes!5987 (and tp!13762 e!106333))))

(declare-datatypes ((V!4357 0))(
  ( (V!4358 (val!1811 Int)) )
))
(declare-datatypes ((ValueCell!1423 0))(
  ( (ValueCellFull!1423 (v!3676 V!4357)) (EmptyCell!1423) )
))
(declare-fun mapValue!5987 () ValueCell!1423)

(declare-fun mapKey!5987 () (_ BitVec 32))

(declare-datatypes ((array!6145 0))(
  ( (array!6146 (arr!2917 (Array (_ BitVec 32) (_ BitVec 64))) (size!3201 (_ BitVec 32))) )
))
(declare-datatypes ((array!6147 0))(
  ( (array!6148 (arr!2918 (Array (_ BitVec 32) ValueCell!1423)) (size!3202 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1754 0))(
  ( (LongMapFixedSize!1755 (defaultEntry!3319 Int) (mask!7937 (_ BitVec 32)) (extraKeys!3060 (_ BitVec 32)) (zeroValue!3162 V!4357) (minValue!3162 V!4357) (_size!926 (_ BitVec 32)) (_keys!5120 array!6145) (_values!3302 array!6147) (_vacant!926 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1754)

(declare-fun mapRest!5987 () (Array (_ BitVec 32) ValueCell!1423))

(assert (=> mapNonEmpty!5987 (= (arr!2918 (_values!3302 thiss!1248)) (store mapRest!5987 mapKey!5987 mapValue!5987))))

(declare-fun b!162319 () Bool)

(declare-fun e!106336 () Bool)

(declare-datatypes ((SeekEntryResult!380 0))(
  ( (MissingZero!380 (index!3688 (_ BitVec 32))) (Found!380 (index!3689 (_ BitVec 32))) (Intermediate!380 (undefined!1192 Bool) (index!3690 (_ BitVec 32)) (x!17948 (_ BitVec 32))) (Undefined!380) (MissingVacant!380 (index!3691 (_ BitVec 32))) )
))
(declare-fun lt!82417 () SeekEntryResult!380)

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162319 (= e!106336 (and (not (is-Undefined!380 lt!82417)) (not (is-MissingVacant!380 lt!82417)) (is-MissingZero!380 lt!82417) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6145 (_ BitVec 32)) SeekEntryResult!380)

(assert (=> b!162319 (= lt!82417 (seekEntryOrOpen!0 key!828 (_keys!5120 thiss!1248) (mask!7937 thiss!1248)))))

(declare-fun e!106337 () Bool)

(declare-fun e!106338 () Bool)

(declare-fun array_inv!1867 (array!6145) Bool)

(declare-fun array_inv!1868 (array!6147) Bool)

(assert (=> b!162320 (= e!106338 (and tp!13763 tp_is_empty!3533 (array_inv!1867 (_keys!5120 thiss!1248)) (array_inv!1868 (_values!3302 thiss!1248)) e!106337))))

(declare-fun b!162321 () Bool)

(assert (=> b!162321 (= e!106337 (and e!106335 mapRes!5987))))

(declare-fun condMapEmpty!5987 () Bool)

(declare-fun mapDefault!5987 () ValueCell!1423)

