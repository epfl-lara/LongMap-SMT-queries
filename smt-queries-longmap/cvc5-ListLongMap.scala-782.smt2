; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18538 () Bool)

(assert start!18538)

(declare-fun b!183697 () Bool)

(declare-fun b_free!4531 () Bool)

(declare-fun b_next!4531 () Bool)

(assert (=> b!183697 (= b_free!4531 (not b_next!4531))))

(declare-fun tp!16368 () Bool)

(declare-fun b_and!11107 () Bool)

(assert (=> b!183697 (= tp!16368 b_and!11107)))

(declare-fun b!183696 () Bool)

(declare-fun e!120931 () Bool)

(declare-fun tp_is_empty!4303 () Bool)

(assert (=> b!183696 (= e!120931 tp_is_empty!4303)))

(declare-fun res!86938 () Bool)

(declare-fun e!120934 () Bool)

(assert (=> start!18538 (=> (not res!86938) (not e!120934))))

(declare-datatypes ((V!5385 0))(
  ( (V!5386 (val!2196 Int)) )
))
(declare-datatypes ((ValueCell!1808 0))(
  ( (ValueCellFull!1808 (v!4100 V!5385)) (EmptyCell!1808) )
))
(declare-datatypes ((array!7801 0))(
  ( (array!7802 (arr!3687 (Array (_ BitVec 32) (_ BitVec 64))) (size!4000 (_ BitVec 32))) )
))
(declare-datatypes ((array!7803 0))(
  ( (array!7804 (arr!3688 (Array (_ BitVec 32) ValueCell!1808)) (size!4001 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2524 0))(
  ( (LongMapFixedSize!2525 (defaultEntry!3754 Int) (mask!8824 (_ BitVec 32)) (extraKeys!3491 (_ BitVec 32)) (zeroValue!3595 V!5385) (minValue!3595 V!5385) (_size!1311 (_ BitVec 32)) (_keys!5676 array!7801) (_values!3737 array!7803) (_vacant!1311 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2524)

(declare-fun valid!1044 (LongMapFixedSize!2524) Bool)

(assert (=> start!18538 (= res!86938 (valid!1044 thiss!1248))))

(assert (=> start!18538 e!120934))

(declare-fun e!120929 () Bool)

(assert (=> start!18538 e!120929))

(assert (=> start!18538 true))

(declare-fun e!120932 () Bool)

(declare-fun array_inv!2385 (array!7801) Bool)

(declare-fun array_inv!2386 (array!7803) Bool)

(assert (=> b!183697 (= e!120929 (and tp!16368 tp_is_empty!4303 (array_inv!2385 (_keys!5676 thiss!1248)) (array_inv!2386 (_values!3737 thiss!1248)) e!120932))))

(declare-fun b!183698 () Bool)

(declare-fun e!120930 () Bool)

(declare-fun mapRes!7392 () Bool)

(assert (=> b!183698 (= e!120932 (and e!120930 mapRes!7392))))

(declare-fun condMapEmpty!7392 () Bool)

(declare-fun mapDefault!7392 () ValueCell!1808)

