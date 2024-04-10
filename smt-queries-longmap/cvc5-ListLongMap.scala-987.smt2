; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21300 () Bool)

(assert start!21300)

(declare-fun b!214389 () Bool)

(declare-fun b_free!5671 () Bool)

(declare-fun b_next!5671 () Bool)

(assert (=> b!214389 (= b_free!5671 (not b_next!5671))))

(declare-fun tp!20100 () Bool)

(declare-fun b_and!12561 () Bool)

(assert (=> b!214389 (= tp!20100 b_and!12561)))

(declare-fun b!214382 () Bool)

(declare-fun e!139428 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214382 (= e!139428 (not (validKeyInArray!0 key!932)))))

(declare-fun b!214383 () Bool)

(declare-fun res!104950 () Bool)

(assert (=> b!214383 (=> (not res!104950) (not e!139428))))

(declare-datatypes ((V!7025 0))(
  ( (V!7026 (val!2811 Int)) )
))
(declare-datatypes ((ValueCell!2423 0))(
  ( (ValueCellFull!2423 (v!4829 V!7025)) (EmptyCell!2423) )
))
(declare-datatypes ((array!10277 0))(
  ( (array!10278 (arr!4874 (Array (_ BitVec 32) ValueCell!2423)) (size!5201 (_ BitVec 32))) )
))
(declare-datatypes ((array!10279 0))(
  ( (array!10280 (arr!4875 (Array (_ BitVec 32) (_ BitVec 64))) (size!5202 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2746 0))(
  ( (LongMapFixedSize!2747 (defaultEntry!4023 Int) (mask!9682 (_ BitVec 32)) (extraKeys!3760 (_ BitVec 32)) (zeroValue!3864 V!7025) (minValue!3864 V!7025) (_size!1422 (_ BitVec 32)) (_keys!6041 array!10279) (_values!4006 array!10277) (_vacant!1422 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2746)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214383 (= res!104950 (validMask!0 (mask!9682 thiss!1504)))))

(declare-fun b!214384 () Bool)

(declare-fun res!104951 () Bool)

(assert (=> b!214384 (=> (not res!104951) (not e!139428))))

(assert (=> b!214384 (= res!104951 (and (bvsge (mask!9682 thiss!1504) #b00000000000000000000000000000000) (= (size!5202 (_keys!6041 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9682 thiss!1504)))))))

(declare-fun res!104952 () Bool)

(assert (=> start!21300 (=> (not res!104952) (not e!139428))))

(declare-fun valid!1125 (LongMapFixedSize!2746) Bool)

(assert (=> start!21300 (= res!104952 (valid!1125 thiss!1504))))

(assert (=> start!21300 e!139428))

(declare-fun e!139425 () Bool)

(assert (=> start!21300 e!139425))

(assert (=> start!21300 true))

(declare-fun mapIsEmpty!9415 () Bool)

(declare-fun mapRes!9415 () Bool)

(assert (=> mapIsEmpty!9415 mapRes!9415))

(declare-fun b!214385 () Bool)

(declare-fun e!139426 () Bool)

(declare-fun e!139424 () Bool)

(assert (=> b!214385 (= e!139426 (and e!139424 mapRes!9415))))

(declare-fun condMapEmpty!9415 () Bool)

(declare-fun mapDefault!9415 () ValueCell!2423)

