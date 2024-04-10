; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21264 () Bool)

(assert start!21264)

(declare-fun b!214170 () Bool)

(declare-fun b_free!5659 () Bool)

(declare-fun b_next!5659 () Bool)

(assert (=> b!214170 (= b_free!5659 (not b_next!5659))))

(declare-fun tp!20057 () Bool)

(declare-fun b_and!12549 () Bool)

(assert (=> b!214170 (= tp!20057 b_and!12549)))

(declare-fun b!214167 () Bool)

(declare-fun res!104851 () Bool)

(declare-fun e!139269 () Bool)

(assert (=> b!214167 (=> (not res!104851) (not e!139269))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214167 (= res!104851 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214168 () Bool)

(declare-fun res!104850 () Bool)

(assert (=> b!214168 (=> (not res!104850) (not e!139269))))

(declare-datatypes ((V!7009 0))(
  ( (V!7010 (val!2805 Int)) )
))
(declare-datatypes ((ValueCell!2417 0))(
  ( (ValueCellFull!2417 (v!4823 V!7009)) (EmptyCell!2417) )
))
(declare-datatypes ((array!10249 0))(
  ( (array!10250 (arr!4862 (Array (_ BitVec 32) ValueCell!2417)) (size!5188 (_ BitVec 32))) )
))
(declare-datatypes ((array!10251 0))(
  ( (array!10252 (arr!4863 (Array (_ BitVec 32) (_ BitVec 64))) (size!5189 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2734 0))(
  ( (LongMapFixedSize!2735 (defaultEntry!4017 Int) (mask!9669 (_ BitVec 32)) (extraKeys!3754 (_ BitVec 32)) (zeroValue!3858 V!7009) (minValue!3858 V!7009) (_size!1416 (_ BitVec 32)) (_keys!6034 array!10251) (_values!4000 array!10249) (_vacant!1416 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2734)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214168 (= res!104850 (validMask!0 (mask!9669 thiss!1504)))))

(declare-fun b!214169 () Bool)

(declare-fun e!139268 () Bool)

(declare-fun tp_is_empty!5521 () Bool)

(assert (=> b!214169 (= e!139268 tp_is_empty!5521)))

(declare-fun e!139266 () Bool)

(declare-fun e!139270 () Bool)

(declare-fun array_inv!3215 (array!10251) Bool)

(declare-fun array_inv!3216 (array!10249) Bool)

(assert (=> b!214170 (= e!139270 (and tp!20057 tp_is_empty!5521 (array_inv!3215 (_keys!6034 thiss!1504)) (array_inv!3216 (_values!4000 thiss!1504)) e!139266))))

(declare-fun mapIsEmpty!9390 () Bool)

(declare-fun mapRes!9390 () Bool)

(assert (=> mapIsEmpty!9390 mapRes!9390))

(declare-fun b!214171 () Bool)

(declare-fun e!139265 () Bool)

(assert (=> b!214171 (= e!139265 tp_is_empty!5521)))

(declare-fun res!104849 () Bool)

(assert (=> start!21264 (=> (not res!104849) (not e!139269))))

(declare-fun valid!1120 (LongMapFixedSize!2734) Bool)

(assert (=> start!21264 (= res!104849 (valid!1120 thiss!1504))))

(assert (=> start!21264 e!139269))

(assert (=> start!21264 e!139270))

(assert (=> start!21264 true))

(declare-fun b!214172 () Bool)

(assert (=> b!214172 (= e!139266 (and e!139265 mapRes!9390))))

(declare-fun condMapEmpty!9390 () Bool)

(declare-fun mapDefault!9390 () ValueCell!2417)

