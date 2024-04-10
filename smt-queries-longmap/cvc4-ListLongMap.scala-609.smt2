; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15860 () Bool)

(assert start!15860)

(declare-fun b!157912 () Bool)

(declare-fun b_free!3467 () Bool)

(declare-fun b_next!3467 () Bool)

(assert (=> b!157912 (= b_free!3467 (not b_next!3467))))

(declare-fun tp!12942 () Bool)

(declare-fun b_and!9881 () Bool)

(assert (=> b!157912 (= tp!12942 b_and!9881)))

(declare-fun b!157905 () Bool)

(declare-fun res!74618 () Bool)

(declare-fun e!103435 () Bool)

(assert (=> b!157905 (=> (not res!74618) (not e!103435))))

(declare-datatypes ((V!4005 0))(
  ( (V!4006 (val!1679 Int)) )
))
(declare-datatypes ((ValueCell!1291 0))(
  ( (ValueCellFull!1291 (v!3544 V!4005)) (EmptyCell!1291) )
))
(declare-datatypes ((array!5601 0))(
  ( (array!5602 (arr!2653 (Array (_ BitVec 32) (_ BitVec 64))) (size!2933 (_ BitVec 32))) )
))
(declare-datatypes ((array!5603 0))(
  ( (array!5604 (arr!2654 (Array (_ BitVec 32) ValueCell!1291)) (size!2934 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1490 0))(
  ( (LongMapFixedSize!1491 (defaultEntry!3187 Int) (mask!7682 (_ BitVec 32)) (extraKeys!2928 (_ BitVec 32)) (zeroValue!3030 V!4005) (minValue!3030 V!4005) (_size!794 (_ BitVec 32)) (_keys!4965 array!5601) (_values!3170 array!5603) (_vacant!794 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1490)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157905 (= res!74618 (validMask!0 (mask!7682 thiss!1248)))))

(declare-fun b!157906 () Bool)

(declare-fun res!74620 () Bool)

(assert (=> b!157906 (=> (not res!74620) (not e!103435))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!291 0))(
  ( (MissingZero!291 (index!3332 (_ BitVec 32))) (Found!291 (index!3333 (_ BitVec 32))) (Intermediate!291 (undefined!1103 Bool) (index!3334 (_ BitVec 32)) (x!17407 (_ BitVec 32))) (Undefined!291) (MissingVacant!291 (index!3335 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5601 (_ BitVec 32)) SeekEntryResult!291)

(assert (=> b!157906 (= res!74620 (is-Undefined!291 (seekEntryOrOpen!0 key!828 (_keys!4965 thiss!1248) (mask!7682 thiss!1248))))))

(declare-fun b!157907 () Bool)

(declare-fun e!103431 () Bool)

(declare-fun tp_is_empty!3269 () Bool)

(assert (=> b!157907 (= e!103431 tp_is_empty!3269)))

(declare-fun mapNonEmpty!5563 () Bool)

(declare-fun mapRes!5563 () Bool)

(declare-fun tp!12943 () Bool)

(assert (=> mapNonEmpty!5563 (= mapRes!5563 (and tp!12943 e!103431))))

(declare-fun mapValue!5563 () ValueCell!1291)

(declare-fun mapKey!5563 () (_ BitVec 32))

(declare-fun mapRest!5563 () (Array (_ BitVec 32) ValueCell!1291))

(assert (=> mapNonEmpty!5563 (= (arr!2654 (_values!3170 thiss!1248)) (store mapRest!5563 mapKey!5563 mapValue!5563))))

(declare-fun b!157908 () Bool)

(declare-fun e!103430 () Bool)

(declare-fun e!103433 () Bool)

(assert (=> b!157908 (= e!103430 (and e!103433 mapRes!5563))))

(declare-fun condMapEmpty!5563 () Bool)

(declare-fun mapDefault!5563 () ValueCell!1291)

