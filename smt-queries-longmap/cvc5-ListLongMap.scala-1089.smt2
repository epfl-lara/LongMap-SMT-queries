; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22216 () Bool)

(assert start!22216)

(declare-fun b!233129 () Bool)

(declare-fun b_free!6283 () Bool)

(declare-fun b_next!6283 () Bool)

(assert (=> b!233129 (= b_free!6283 (not b_next!6283))))

(declare-fun tp!21991 () Bool)

(declare-fun b_and!13181 () Bool)

(assert (=> b!233129 (= tp!21991 b_and!13181)))

(declare-fun b!233127 () Bool)

(declare-fun e!151438 () Bool)

(declare-fun e!151439 () Bool)

(declare-fun mapRes!10387 () Bool)

(assert (=> b!233127 (= e!151438 (and e!151439 mapRes!10387))))

(declare-fun condMapEmpty!10387 () Bool)

(declare-datatypes ((V!7841 0))(
  ( (V!7842 (val!3117 Int)) )
))
(declare-datatypes ((ValueCell!2729 0))(
  ( (ValueCellFull!2729 (v!5137 V!7841)) (EmptyCell!2729) )
))
(declare-datatypes ((array!11533 0))(
  ( (array!11534 (arr!5486 (Array (_ BitVec 32) ValueCell!2729)) (size!5819 (_ BitVec 32))) )
))
(declare-datatypes ((array!11535 0))(
  ( (array!11536 (arr!5487 (Array (_ BitVec 32) (_ BitVec 64))) (size!5820 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3358 0))(
  ( (LongMapFixedSize!3359 (defaultEntry!4338 Int) (mask!10260 (_ BitVec 32)) (extraKeys!4075 (_ BitVec 32)) (zeroValue!4179 V!7841) (minValue!4179 V!7841) (_size!1728 (_ BitVec 32)) (_keys!6392 array!11535) (_values!4321 array!11533) (_vacant!1728 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3358)

(declare-fun mapDefault!10387 () ValueCell!2729)

