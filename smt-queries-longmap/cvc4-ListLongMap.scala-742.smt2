; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17248 () Bool)

(assert start!17248)

(declare-fun b!173017 () Bool)

(declare-fun b_free!4295 () Bool)

(declare-fun b_next!4295 () Bool)

(assert (=> b!173017 (= b_free!4295 (not b_next!4295))))

(declare-fun tp!15543 () Bool)

(declare-fun b_and!10735 () Bool)

(assert (=> b!173017 (= tp!15543 b_and!10735)))

(declare-fun b!173016 () Bool)

(declare-fun e!114273 () Bool)

(declare-fun tp_is_empty!4067 () Bool)

(assert (=> b!173016 (= e!114273 tp_is_empty!4067)))

(declare-fun res!82143 () Bool)

(declare-fun e!114278 () Bool)

(assert (=> start!17248 (=> (not res!82143) (not e!114278))))

(declare-datatypes ((V!5069 0))(
  ( (V!5070 (val!2078 Int)) )
))
(declare-datatypes ((ValueCell!1690 0))(
  ( (ValueCellFull!1690 (v!3946 V!5069)) (EmptyCell!1690) )
))
(declare-datatypes ((array!7261 0))(
  ( (array!7262 (arr!3451 (Array (_ BitVec 32) (_ BitVec 64))) (size!3750 (_ BitVec 32))) )
))
(declare-datatypes ((array!7263 0))(
  ( (array!7264 (arr!3452 (Array (_ BitVec 32) ValueCell!1690)) (size!3751 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2288 0))(
  ( (LongMapFixedSize!2289 (defaultEntry!3590 Int) (mask!8452 (_ BitVec 32)) (extraKeys!3329 (_ BitVec 32)) (zeroValue!3431 V!5069) (minValue!3433 V!5069) (_size!1193 (_ BitVec 32)) (_keys!5429 array!7261) (_values!3573 array!7263) (_vacant!1193 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2288)

(declare-fun valid!969 (LongMapFixedSize!2288) Bool)

(assert (=> start!17248 (= res!82143 (valid!969 thiss!1248))))

(assert (=> start!17248 e!114278))

(declare-fun e!114274 () Bool)

(assert (=> start!17248 e!114274))

(assert (=> start!17248 true))

(declare-fun e!114276 () Bool)

(declare-fun array_inv!2207 (array!7261) Bool)

(declare-fun array_inv!2208 (array!7263) Bool)

(assert (=> b!173017 (= e!114274 (and tp!15543 tp_is_empty!4067 (array_inv!2207 (_keys!5429 thiss!1248)) (array_inv!2208 (_values!3573 thiss!1248)) e!114276))))

(declare-fun b!173018 () Bool)

(declare-fun e!114275 () Bool)

(assert (=> b!173018 (= e!114275 tp_is_empty!4067)))

(declare-fun b!173019 () Bool)

(declare-fun mapRes!6921 () Bool)

(assert (=> b!173019 (= e!114276 (and e!114275 mapRes!6921))))

(declare-fun condMapEmpty!6921 () Bool)

(declare-fun mapDefault!6921 () ValueCell!1690)

