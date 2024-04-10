; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15646 () Bool)

(assert start!15646)

(declare-fun b!155905 () Bool)

(declare-fun b_free!3313 () Bool)

(declare-fun b_next!3313 () Bool)

(assert (=> b!155905 (= b_free!3313 (not b_next!3313))))

(declare-fun tp!12464 () Bool)

(declare-fun b_and!9727 () Bool)

(assert (=> b!155905 (= tp!12464 b_and!9727)))

(declare-fun b!155900 () Bool)

(declare-fun e!101903 () Bool)

(declare-fun e!101901 () Bool)

(declare-fun mapRes!5315 () Bool)

(assert (=> b!155900 (= e!101903 (and e!101901 mapRes!5315))))

(declare-fun condMapEmpty!5315 () Bool)

(declare-datatypes ((V!3801 0))(
  ( (V!3802 (val!1602 Int)) )
))
(declare-datatypes ((ValueCell!1214 0))(
  ( (ValueCellFull!1214 (v!3467 V!3801)) (EmptyCell!1214) )
))
(declare-datatypes ((array!5283 0))(
  ( (array!5284 (arr!2499 (Array (_ BitVec 32) (_ BitVec 64))) (size!2777 (_ BitVec 32))) )
))
(declare-datatypes ((array!5285 0))(
  ( (array!5286 (arr!2500 (Array (_ BitVec 32) ValueCell!1214)) (size!2778 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1336 0))(
  ( (LongMapFixedSize!1337 (defaultEntry!3110 Int) (mask!7547 (_ BitVec 32)) (extraKeys!2851 (_ BitVec 32)) (zeroValue!2953 V!3801) (minValue!2953 V!3801) (_size!717 (_ BitVec 32)) (_keys!4885 array!5283) (_values!3093 array!5285) (_vacant!717 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1336)

(declare-fun mapDefault!5315 () ValueCell!1214)

