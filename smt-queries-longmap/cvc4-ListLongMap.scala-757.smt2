; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17732 () Bool)

(assert start!17732)

(declare-fun b!177280 () Bool)

(declare-fun b_free!4385 () Bool)

(declare-fun b_next!4385 () Bool)

(assert (=> b!177280 (= b_free!4385 (not b_next!4385))))

(declare-fun tp!15854 () Bool)

(declare-fun b_and!10885 () Bool)

(assert (=> b!177280 (= tp!15854 b_and!10885)))

(declare-fun tp_is_empty!4157 () Bool)

(declare-datatypes ((V!5189 0))(
  ( (V!5190 (val!2123 Int)) )
))
(declare-datatypes ((ValueCell!1735 0))(
  ( (ValueCellFull!1735 (v!4003 V!5189)) (EmptyCell!1735) )
))
(declare-datatypes ((array!7465 0))(
  ( (array!7466 (arr!3541 (Array (_ BitVec 32) (_ BitVec 64))) (size!3845 (_ BitVec 32))) )
))
(declare-datatypes ((array!7467 0))(
  ( (array!7468 (arr!3542 (Array (_ BitVec 32) ValueCell!1735)) (size!3846 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2378 0))(
  ( (LongMapFixedSize!2379 (defaultEntry!3652 Int) (mask!8588 (_ BitVec 32)) (extraKeys!3389 (_ BitVec 32)) (zeroValue!3493 V!5189) (minValue!3493 V!5189) (_size!1238 (_ BitVec 32)) (_keys!5519 array!7465) (_values!3635 array!7467) (_vacant!1238 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2378)

(declare-fun e!116917 () Bool)

(declare-fun e!116913 () Bool)

(declare-fun array_inv!2271 (array!7465) Bool)

(declare-fun array_inv!2272 (array!7467) Bool)

(assert (=> b!177280 (= e!116917 (and tp!15854 tp_is_empty!4157 (array_inv!2271 (_keys!5519 thiss!1248)) (array_inv!2272 (_values!3635 thiss!1248)) e!116913))))

(declare-fun b!177281 () Bool)

(declare-fun e!116918 () Bool)

(assert (=> b!177281 (= e!116918 tp_is_empty!4157)))

(declare-fun b!177282 () Bool)

(declare-fun e!116916 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177282 (= e!116916 (not (validMask!0 (mask!8588 thiss!1248))))))

(declare-fun res!84041 () Bool)

(assert (=> start!17732 (=> (not res!84041) (not e!116916))))

(declare-fun valid!997 (LongMapFixedSize!2378) Bool)

(assert (=> start!17732 (= res!84041 (valid!997 thiss!1248))))

(assert (=> start!17732 e!116916))

(assert (=> start!17732 e!116917))

(assert (=> start!17732 true))

(declare-fun mapIsEmpty!7098 () Bool)

(declare-fun mapRes!7098 () Bool)

(assert (=> mapIsEmpty!7098 mapRes!7098))

(declare-fun b!177283 () Bool)

(declare-fun e!116914 () Bool)

(assert (=> b!177283 (= e!116913 (and e!116914 mapRes!7098))))

(declare-fun condMapEmpty!7098 () Bool)

(declare-fun mapDefault!7098 () ValueCell!1735)

