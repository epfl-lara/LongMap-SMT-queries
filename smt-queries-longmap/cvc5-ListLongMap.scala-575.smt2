; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15592 () Bool)

(assert start!15592)

(declare-fun b!155224 () Bool)

(declare-fun b_free!3259 () Bool)

(declare-fun b_next!3259 () Bool)

(assert (=> b!155224 (= b_free!3259 (not b_next!3259))))

(declare-fun tp!12302 () Bool)

(declare-fun b_and!9673 () Bool)

(assert (=> b!155224 (= tp!12302 b_and!9673)))

(declare-fun b!155220 () Bool)

(declare-fun e!101406 () Bool)

(declare-fun e!101405 () Bool)

(declare-fun mapRes!5234 () Bool)

(assert (=> b!155220 (= e!101406 (and e!101405 mapRes!5234))))

(declare-fun condMapEmpty!5234 () Bool)

(declare-datatypes ((V!3729 0))(
  ( (V!3730 (val!1575 Int)) )
))
(declare-datatypes ((ValueCell!1187 0))(
  ( (ValueCellFull!1187 (v!3440 V!3729)) (EmptyCell!1187) )
))
(declare-datatypes ((array!5175 0))(
  ( (array!5176 (arr!2445 (Array (_ BitVec 32) (_ BitVec 64))) (size!2723 (_ BitVec 32))) )
))
(declare-datatypes ((array!5177 0))(
  ( (array!5178 (arr!2446 (Array (_ BitVec 32) ValueCell!1187)) (size!2724 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1282 0))(
  ( (LongMapFixedSize!1283 (defaultEntry!3083 Int) (mask!7502 (_ BitVec 32)) (extraKeys!2824 (_ BitVec 32)) (zeroValue!2926 V!3729) (minValue!2926 V!3729) (_size!690 (_ BitVec 32)) (_keys!4858 array!5175) (_values!3066 array!5177) (_vacant!690 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1282)

(declare-fun mapDefault!5234 () ValueCell!1187)

