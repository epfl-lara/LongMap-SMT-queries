; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22584 () Bool)

(assert start!22584)

(declare-fun b!236111 () Bool)

(declare-fun b_free!6355 () Bool)

(declare-fun b_next!6355 () Bool)

(assert (=> b!236111 (= b_free!6355 (not b_next!6355))))

(declare-fun tp!22241 () Bool)

(declare-fun b_and!13289 () Bool)

(assert (=> b!236111 (= tp!22241 b_and!13289)))

(declare-fun b!236104 () Bool)

(declare-fun e!153347 () Bool)

(declare-fun e!153346 () Bool)

(declare-fun mapRes!10529 () Bool)

(assert (=> b!236104 (= e!153347 (and e!153346 mapRes!10529))))

(declare-fun condMapEmpty!10529 () Bool)

(declare-datatypes ((V!7937 0))(
  ( (V!7938 (val!3153 Int)) )
))
(declare-datatypes ((ValueCell!2765 0))(
  ( (ValueCellFull!2765 (v!5183 V!7937)) (EmptyCell!2765) )
))
(declare-datatypes ((array!11697 0))(
  ( (array!11698 (arr!5558 (Array (_ BitVec 32) ValueCell!2765)) (size!5895 (_ BitVec 32))) )
))
(declare-datatypes ((array!11699 0))(
  ( (array!11700 (arr!5559 (Array (_ BitVec 32) (_ BitVec 64))) (size!5896 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3430 0))(
  ( (LongMapFixedSize!3431 (defaultEntry!4388 Int) (mask!10373 (_ BitVec 32)) (extraKeys!4125 (_ BitVec 32)) (zeroValue!4229 V!7937) (minValue!4229 V!7937) (_size!1764 (_ BitVec 32)) (_keys!6467 array!11699) (_values!4371 array!11697) (_vacant!1764 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3430)

(declare-fun mapDefault!10529 () ValueCell!2765)

