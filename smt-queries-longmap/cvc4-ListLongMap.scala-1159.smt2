; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24382 () Bool)

(assert start!24382)

(declare-fun b!255528 () Bool)

(declare-fun b_free!6707 () Bool)

(declare-fun b_next!6707 () Bool)

(assert (=> b!255528 (= b_free!6707 (not b_next!6707))))

(declare-fun tp!23414 () Bool)

(declare-fun b_and!13757 () Bool)

(assert (=> b!255528 (= tp!23414 b_and!13757)))

(declare-fun b!255516 () Bool)

(declare-fun e!165632 () Bool)

(declare-fun e!165634 () Bool)

(declare-fun mapRes!11175 () Bool)

(assert (=> b!255516 (= e!165632 (and e!165634 mapRes!11175))))

(declare-fun condMapEmpty!11175 () Bool)

(declare-datatypes ((V!8405 0))(
  ( (V!8406 (val!3329 Int)) )
))
(declare-datatypes ((ValueCell!2941 0))(
  ( (ValueCellFull!2941 (v!5409 V!8405)) (EmptyCell!2941) )
))
(declare-datatypes ((array!12473 0))(
  ( (array!12474 (arr!5910 (Array (_ BitVec 32) ValueCell!2941)) (size!6257 (_ BitVec 32))) )
))
(declare-datatypes ((array!12475 0))(
  ( (array!12476 (arr!5911 (Array (_ BitVec 32) (_ BitVec 64))) (size!6258 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3782 0))(
  ( (LongMapFixedSize!3783 (defaultEntry!4714 Int) (mask!10974 (_ BitVec 32)) (extraKeys!4451 (_ BitVec 32)) (zeroValue!4555 V!8405) (minValue!4555 V!8405) (_size!1940 (_ BitVec 32)) (_keys!6872 array!12475) (_values!4697 array!12473) (_vacant!1940 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3782)

(declare-fun mapDefault!11175 () ValueCell!2941)

