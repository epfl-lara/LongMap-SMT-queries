; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15704 () Bool)

(assert start!15704)

(declare-fun b!156616 () Bool)

(declare-fun b_free!3371 () Bool)

(declare-fun b_next!3371 () Bool)

(assert (=> b!156616 (= b_free!3371 (not b_next!3371))))

(declare-fun tp!12637 () Bool)

(declare-fun b_and!9785 () Bool)

(assert (=> b!156616 (= tp!12637 b_and!9785)))

(declare-fun b!156615 () Bool)

(declare-fun e!102435 () Bool)

(declare-fun e!102430 () Bool)

(declare-fun mapRes!5402 () Bool)

(assert (=> b!156615 (= e!102435 (and e!102430 mapRes!5402))))

(declare-fun condMapEmpty!5402 () Bool)

(declare-datatypes ((V!3877 0))(
  ( (V!3878 (val!1631 Int)) )
))
(declare-datatypes ((ValueCell!1243 0))(
  ( (ValueCellFull!1243 (v!3496 V!3877)) (EmptyCell!1243) )
))
(declare-datatypes ((array!5399 0))(
  ( (array!5400 (arr!2557 (Array (_ BitVec 32) (_ BitVec 64))) (size!2835 (_ BitVec 32))) )
))
(declare-datatypes ((array!5401 0))(
  ( (array!5402 (arr!2558 (Array (_ BitVec 32) ValueCell!1243)) (size!2836 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1394 0))(
  ( (LongMapFixedSize!1395 (defaultEntry!3139 Int) (mask!7594 (_ BitVec 32)) (extraKeys!2880 (_ BitVec 32)) (zeroValue!2982 V!3877) (minValue!2982 V!3877) (_size!746 (_ BitVec 32)) (_keys!4914 array!5399) (_values!3122 array!5401) (_vacant!746 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1394)

(declare-fun mapDefault!5402 () ValueCell!1243)

