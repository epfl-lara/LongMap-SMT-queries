; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17884 () Bool)

(assert start!17884)

(declare-fun b!178433 () Bool)

(declare-fun b_free!4409 () Bool)

(declare-fun b_next!4409 () Bool)

(assert (=> b!178433 (= b_free!4409 (not b_next!4409))))

(declare-fun tp!15940 () Bool)

(declare-fun b_and!10925 () Bool)

(assert (=> b!178433 (= tp!15940 b_and!10925)))

(declare-fun b!178431 () Bool)

(declare-fun res!84540 () Bool)

(declare-fun e!117616 () Bool)

(assert (=> b!178431 (=> (not res!84540) (not e!117616))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!178431 (= res!84540 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7148 () Bool)

(declare-fun mapRes!7148 () Bool)

(declare-fun tp!15941 () Bool)

(declare-fun e!117617 () Bool)

(assert (=> mapNonEmpty!7148 (= mapRes!7148 (and tp!15941 e!117617))))

(declare-datatypes ((V!5221 0))(
  ( (V!5222 (val!2135 Int)) )
))
(declare-datatypes ((ValueCell!1747 0))(
  ( (ValueCellFull!1747 (v!4019 V!5221)) (EmptyCell!1747) )
))
(declare-fun mapRest!7148 () (Array (_ BitVec 32) ValueCell!1747))

(declare-fun mapValue!7148 () ValueCell!1747)

(declare-datatypes ((array!7521 0))(
  ( (array!7522 (arr!3565 (Array (_ BitVec 32) (_ BitVec 64))) (size!3871 (_ BitVec 32))) )
))
(declare-datatypes ((array!7523 0))(
  ( (array!7524 (arr!3566 (Array (_ BitVec 32) ValueCell!1747)) (size!3872 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2402 0))(
  ( (LongMapFixedSize!2403 (defaultEntry!3670 Int) (mask!8630 (_ BitVec 32)) (extraKeys!3407 (_ BitVec 32)) (zeroValue!3511 V!5221) (minValue!3511 V!5221) (_size!1250 (_ BitVec 32)) (_keys!5547 array!7521) (_values!3653 array!7523) (_vacant!1250 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2402)

(declare-fun mapKey!7148 () (_ BitVec 32))

(assert (=> mapNonEmpty!7148 (= (arr!3566 (_values!3653 thiss!1248)) (store mapRest!7148 mapKey!7148 mapValue!7148))))

(declare-fun b!178432 () Bool)

(declare-fun res!84541 () Bool)

(assert (=> b!178432 (=> (not res!84541) (not e!117616))))

(declare-datatypes ((SeekEntryResult!576 0))(
  ( (MissingZero!576 (index!4472 (_ BitVec 32))) (Found!576 (index!4473 (_ BitVec 32))) (Intermediate!576 (undefined!1388 Bool) (index!4474 (_ BitVec 32)) (x!19544 (_ BitVec 32))) (Undefined!576) (MissingVacant!576 (index!4475 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7521 (_ BitVec 32)) SeekEntryResult!576)

(assert (=> b!178432 (= res!84541 (is-Undefined!576 (seekEntryOrOpen!0 key!828 (_keys!5547 thiss!1248) (mask!8630 thiss!1248))))))

(declare-fun tp_is_empty!4181 () Bool)

(declare-fun e!117615 () Bool)

(declare-fun e!117614 () Bool)

(declare-fun array_inv!2291 (array!7521) Bool)

(declare-fun array_inv!2292 (array!7523) Bool)

(assert (=> b!178433 (= e!117615 (and tp!15940 tp_is_empty!4181 (array_inv!2291 (_keys!5547 thiss!1248)) (array_inv!2292 (_values!3653 thiss!1248)) e!117614))))

(declare-fun b!178434 () Bool)

(assert (=> b!178434 (= e!117616 (and (= (size!3872 (_values!3653 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8630 thiss!1248))) (= (size!3871 (_keys!5547 thiss!1248)) (size!3872 (_values!3653 thiss!1248))) (bvsge (mask!8630 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3407 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!178435 () Bool)

(declare-fun e!117618 () Bool)

(assert (=> b!178435 (= e!117614 (and e!117618 mapRes!7148))))

(declare-fun condMapEmpty!7148 () Bool)

(declare-fun mapDefault!7148 () ValueCell!1747)

