; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15622 () Bool)

(assert start!15622)

(declare-fun b!155627 () Bool)

(declare-fun b_free!3289 () Bool)

(declare-fun b_next!3289 () Bool)

(assert (=> b!155627 (= b_free!3289 (not b_next!3289))))

(declare-fun tp!12391 () Bool)

(declare-fun b_and!9703 () Bool)

(assert (=> b!155627 (= tp!12391 b_and!9703)))

(declare-fun b!155625 () Bool)

(declare-fun res!73519 () Bool)

(declare-fun e!101679 () Bool)

(assert (=> b!155625 (=> (not res!73519) (not e!101679))))

(declare-datatypes ((V!3769 0))(
  ( (V!3770 (val!1590 Int)) )
))
(declare-datatypes ((ValueCell!1202 0))(
  ( (ValueCellFull!1202 (v!3455 V!3769)) (EmptyCell!1202) )
))
(declare-datatypes ((array!5235 0))(
  ( (array!5236 (arr!2475 (Array (_ BitVec 32) (_ BitVec 64))) (size!2753 (_ BitVec 32))) )
))
(declare-datatypes ((array!5237 0))(
  ( (array!5238 (arr!2476 (Array (_ BitVec 32) ValueCell!1202)) (size!2754 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1312 0))(
  ( (LongMapFixedSize!1313 (defaultEntry!3098 Int) (mask!7527 (_ BitVec 32)) (extraKeys!2839 (_ BitVec 32)) (zeroValue!2941 V!3769) (minValue!2941 V!3769) (_size!705 (_ BitVec 32)) (_keys!4873 array!5235) (_values!3081 array!5237) (_vacant!705 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1312)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155625 (= res!73519 (validMask!0 (mask!7527 thiss!1248)))))

(declare-fun mapIsEmpty!5279 () Bool)

(declare-fun mapRes!5279 () Bool)

(assert (=> mapIsEmpty!5279 mapRes!5279))

(declare-fun e!101674 () Bool)

(declare-fun e!101678 () Bool)

(declare-fun tp_is_empty!3091 () Bool)

(declare-fun array_inv!1561 (array!5235) Bool)

(declare-fun array_inv!1562 (array!5237) Bool)

(assert (=> b!155627 (= e!101678 (and tp!12391 tp_is_empty!3091 (array_inv!1561 (_keys!4873 thiss!1248)) (array_inv!1562 (_values!3081 thiss!1248)) e!101674))))

(declare-fun b!155628 () Bool)

(declare-fun e!101675 () Bool)

(assert (=> b!155628 (= e!101675 tp_is_empty!3091)))

(declare-fun b!155629 () Bool)

(declare-fun e!101677 () Bool)

(assert (=> b!155629 (= e!101674 (and e!101677 mapRes!5279))))

(declare-fun condMapEmpty!5279 () Bool)

(declare-fun mapDefault!5279 () ValueCell!1202)

