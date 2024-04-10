; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19166 () Bool)

(assert start!19166)

(declare-fun b!188602 () Bool)

(declare-fun b_free!4631 () Bool)

(declare-fun b_next!4631 () Bool)

(assert (=> b!188602 (= b_free!4631 (not b_next!4631))))

(declare-fun tp!16716 () Bool)

(declare-fun b_and!11263 () Bool)

(assert (=> b!188602 (= tp!16716 b_and!11263)))

(declare-fun b!188597 () Bool)

(declare-fun e!124129 () Bool)

(declare-fun e!124128 () Bool)

(declare-fun mapRes!7591 () Bool)

(assert (=> b!188597 (= e!124129 (and e!124128 mapRes!7591))))

(declare-fun condMapEmpty!7591 () Bool)

(declare-datatypes ((V!5517 0))(
  ( (V!5518 (val!2246 Int)) )
))
(declare-datatypes ((ValueCell!1858 0))(
  ( (ValueCellFull!1858 (v!4164 V!5517)) (EmptyCell!1858) )
))
(declare-datatypes ((array!8029 0))(
  ( (array!8030 (arr!3787 (Array (_ BitVec 32) (_ BitVec 64))) (size!4107 (_ BitVec 32))) )
))
(declare-datatypes ((array!8031 0))(
  ( (array!8032 (arr!3788 (Array (_ BitVec 32) ValueCell!1858)) (size!4108 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2624 0))(
  ( (LongMapFixedSize!2625 (defaultEntry!3847 Int) (mask!9016 (_ BitVec 32)) (extraKeys!3584 (_ BitVec 32)) (zeroValue!3688 V!5517) (minValue!3688 V!5517) (_size!1361 (_ BitVec 32)) (_keys!5808 array!8029) (_values!3830 array!8031) (_vacant!1361 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2624)

(declare-fun mapDefault!7591 () ValueCell!1858)

