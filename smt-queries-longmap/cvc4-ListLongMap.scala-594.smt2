; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15710 () Bool)

(assert start!15710)

(declare-fun b!156700 () Bool)

(declare-fun b_free!3377 () Bool)

(declare-fun b_next!3377 () Bool)

(assert (=> b!156700 (= b_free!3377 (not b_next!3377))))

(declare-fun tp!12656 () Bool)

(declare-fun b_and!9791 () Bool)

(assert (=> b!156700 (= tp!12656 b_and!9791)))

(declare-fun b!156696 () Bool)

(declare-fun e!102484 () Bool)

(declare-fun tp_is_empty!3179 () Bool)

(assert (=> b!156696 (= e!102484 tp_is_empty!3179)))

(declare-fun mapIsEmpty!5411 () Bool)

(declare-fun mapRes!5411 () Bool)

(assert (=> mapIsEmpty!5411 mapRes!5411))

(declare-fun b!156697 () Bool)

(declare-fun e!102489 () Bool)

(assert (=> b!156697 (= e!102489 (and e!102484 mapRes!5411))))

(declare-fun condMapEmpty!5411 () Bool)

(declare-datatypes ((V!3885 0))(
  ( (V!3886 (val!1634 Int)) )
))
(declare-datatypes ((ValueCell!1246 0))(
  ( (ValueCellFull!1246 (v!3499 V!3885)) (EmptyCell!1246) )
))
(declare-datatypes ((array!5411 0))(
  ( (array!5412 (arr!2563 (Array (_ BitVec 32) (_ BitVec 64))) (size!2841 (_ BitVec 32))) )
))
(declare-datatypes ((array!5413 0))(
  ( (array!5414 (arr!2564 (Array (_ BitVec 32) ValueCell!1246)) (size!2842 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1400 0))(
  ( (LongMapFixedSize!1401 (defaultEntry!3142 Int) (mask!7599 (_ BitVec 32)) (extraKeys!2883 (_ BitVec 32)) (zeroValue!2985 V!3885) (minValue!2985 V!3885) (_size!749 (_ BitVec 32)) (_keys!4917 array!5411) (_values!3125 array!5413) (_vacant!749 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1400)

(declare-fun mapDefault!5411 () ValueCell!1246)

