; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18808 () Bool)

(assert start!18808)

(declare-fun b!185883 () Bool)

(declare-fun b_free!4583 () Bool)

(declare-fun b_next!4583 () Bool)

(assert (=> b!185883 (= b_free!4583 (not b_next!4583))))

(declare-fun tp!16548 () Bool)

(declare-fun b_and!11185 () Bool)

(assert (=> b!185883 (= tp!16548 b_and!11185)))

(declare-fun b!185879 () Bool)

(declare-fun res!87950 () Bool)

(declare-fun e!122314 () Bool)

(assert (=> b!185879 (=> (not res!87950) (not e!122314))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!185879 (= res!87950 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185880 () Bool)

(declare-fun e!122315 () Bool)

(declare-fun tp_is_empty!4355 () Bool)

(assert (=> b!185880 (= e!122315 tp_is_empty!4355)))

(declare-fun res!87947 () Bool)

(assert (=> start!18808 (=> (not res!87947) (not e!122314))))

(declare-datatypes ((V!5453 0))(
  ( (V!5454 (val!2222 Int)) )
))
(declare-datatypes ((ValueCell!1834 0))(
  ( (ValueCellFull!1834 (v!4133 V!5453)) (EmptyCell!1834) )
))
(declare-datatypes ((array!7919 0))(
  ( (array!7920 (arr!3739 (Array (_ BitVec 32) (_ BitVec 64))) (size!4055 (_ BitVec 32))) )
))
(declare-datatypes ((array!7921 0))(
  ( (array!7922 (arr!3740 (Array (_ BitVec 32) ValueCell!1834)) (size!4056 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2576 0))(
  ( (LongMapFixedSize!2577 (defaultEntry!3790 Int) (mask!8905 (_ BitVec 32)) (extraKeys!3527 (_ BitVec 32)) (zeroValue!3631 V!5453) (minValue!3631 V!5453) (_size!1337 (_ BitVec 32)) (_keys!5731 array!7919) (_values!3773 array!7921) (_vacant!1337 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2576)

(declare-fun valid!1062 (LongMapFixedSize!2576) Bool)

(assert (=> start!18808 (= res!87947 (valid!1062 thiss!1248))))

(assert (=> start!18808 e!122314))

(declare-fun e!122316 () Bool)

(assert (=> start!18808 e!122316))

(assert (=> start!18808 true))

(declare-fun b!185881 () Bool)

(declare-fun e!122319 () Bool)

(declare-fun mapRes!7494 () Bool)

(assert (=> b!185881 (= e!122319 (and e!122315 mapRes!7494))))

(declare-fun condMapEmpty!7494 () Bool)

(declare-fun mapDefault!7494 () ValueCell!1834)

