; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19582 () Bool)

(assert start!19582)

(declare-fun b!192100 () Bool)

(declare-fun b_free!4687 () Bool)

(declare-fun b_next!4687 () Bool)

(assert (=> b!192100 (= b_free!4687 (not b_next!4687))))

(declare-fun tp!16914 () Bool)

(declare-fun b_and!11373 () Bool)

(assert (=> b!192100 (= tp!16914 b_and!11373)))

(declare-fun res!90776 () Bool)

(declare-fun e!126400 () Bool)

(assert (=> start!19582 (=> (not res!90776) (not e!126400))))

(declare-datatypes ((V!5593 0))(
  ( (V!5594 (val!2274 Int)) )
))
(declare-datatypes ((ValueCell!1886 0))(
  ( (ValueCellFull!1886 (v!4219 V!5593)) (EmptyCell!1886) )
))
(declare-datatypes ((array!8159 0))(
  ( (array!8160 (arr!3843 (Array (_ BitVec 32) (_ BitVec 64))) (size!4166 (_ BitVec 32))) )
))
(declare-datatypes ((array!8161 0))(
  ( (array!8162 (arr!3844 (Array (_ BitVec 32) ValueCell!1886)) (size!4167 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2680 0))(
  ( (LongMapFixedSize!2681 (defaultEntry!3920 Int) (mask!9150 (_ BitVec 32)) (extraKeys!3657 (_ BitVec 32)) (zeroValue!3761 V!5593) (minValue!3761 V!5593) (_size!1389 (_ BitVec 32)) (_keys!5902 array!8159) (_values!3903 array!8161) (_vacant!1389 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2680)

(declare-fun valid!1100 (LongMapFixedSize!2680) Bool)

(assert (=> start!19582 (= res!90776 (valid!1100 thiss!1248))))

(assert (=> start!19582 e!126400))

(declare-fun e!126407 () Bool)

(assert (=> start!19582 e!126407))

(assert (=> start!19582 true))

(declare-fun tp_is_empty!4459 () Bool)

(assert (=> start!19582 tp_is_empty!4459))

(declare-fun b!192097 () Bool)

(declare-fun e!126401 () Bool)

(declare-fun e!126399 () Bool)

(declare-fun mapRes!7705 () Bool)

(assert (=> b!192097 (= e!126401 (and e!126399 mapRes!7705))))

(declare-fun condMapEmpty!7705 () Bool)

(declare-fun mapDefault!7705 () ValueCell!1886)

