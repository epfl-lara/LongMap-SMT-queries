; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15676 () Bool)

(assert start!15676)

(declare-fun b!156241 () Bool)

(declare-fun b_free!3343 () Bool)

(declare-fun b_next!3343 () Bool)

(assert (=> b!156241 (= b_free!3343 (not b_next!3343))))

(declare-fun tp!12554 () Bool)

(declare-fun b_and!9757 () Bool)

(assert (=> b!156241 (= tp!12554 b_and!9757)))

(declare-fun b!156237 () Bool)

(declare-fun e!102182 () Bool)

(declare-fun e!102181 () Bool)

(declare-fun mapRes!5360 () Bool)

(assert (=> b!156237 (= e!102182 (and e!102181 mapRes!5360))))

(declare-fun condMapEmpty!5360 () Bool)

(declare-datatypes ((V!3841 0))(
  ( (V!3842 (val!1617 Int)) )
))
(declare-datatypes ((ValueCell!1229 0))(
  ( (ValueCellFull!1229 (v!3482 V!3841)) (EmptyCell!1229) )
))
(declare-datatypes ((array!5343 0))(
  ( (array!5344 (arr!2529 (Array (_ BitVec 32) (_ BitVec 64))) (size!2807 (_ BitVec 32))) )
))
(declare-datatypes ((array!5345 0))(
  ( (array!5346 (arr!2530 (Array (_ BitVec 32) ValueCell!1229)) (size!2808 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1366 0))(
  ( (LongMapFixedSize!1367 (defaultEntry!3125 Int) (mask!7572 (_ BitVec 32)) (extraKeys!2866 (_ BitVec 32)) (zeroValue!2968 V!3841) (minValue!2968 V!3841) (_size!732 (_ BitVec 32)) (_keys!4900 array!5343) (_values!3108 array!5345) (_vacant!732 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1366)

(declare-fun mapDefault!5360 () ValueCell!1229)

