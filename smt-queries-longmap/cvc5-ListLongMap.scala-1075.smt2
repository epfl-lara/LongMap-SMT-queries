; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22132 () Bool)

(assert start!22132)

(declare-fun b!230652 () Bool)

(declare-fun b_free!6199 () Bool)

(declare-fun b_next!6199 () Bool)

(assert (=> b!230652 (= b_free!6199 (not b_next!6199))))

(declare-fun tp!21738 () Bool)

(declare-fun b_and!13097 () Bool)

(assert (=> b!230652 (= tp!21738 b_and!13097)))

(declare-fun b!230640 () Bool)

(declare-fun e!149696 () Bool)

(declare-fun e!149694 () Bool)

(declare-fun mapRes!10261 () Bool)

(assert (=> b!230640 (= e!149696 (and e!149694 mapRes!10261))))

(declare-fun condMapEmpty!10261 () Bool)

(declare-datatypes ((V!7729 0))(
  ( (V!7730 (val!3075 Int)) )
))
(declare-datatypes ((ValueCell!2687 0))(
  ( (ValueCellFull!2687 (v!5095 V!7729)) (EmptyCell!2687) )
))
(declare-datatypes ((array!11365 0))(
  ( (array!11366 (arr!5402 (Array (_ BitVec 32) ValueCell!2687)) (size!5735 (_ BitVec 32))) )
))
(declare-datatypes ((array!11367 0))(
  ( (array!11368 (arr!5403 (Array (_ BitVec 32) (_ BitVec 64))) (size!5736 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3274 0))(
  ( (LongMapFixedSize!3275 (defaultEntry!4296 Int) (mask!10190 (_ BitVec 32)) (extraKeys!4033 (_ BitVec 32)) (zeroValue!4137 V!7729) (minValue!4137 V!7729) (_size!1686 (_ BitVec 32)) (_keys!6350 array!11367) (_values!4279 array!11365) (_vacant!1686 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3274)

(declare-fun mapDefault!10261 () ValueCell!2687)

