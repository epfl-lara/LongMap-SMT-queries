; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14702 () Bool)

(assert start!14702)

(declare-fun b!139097 () Bool)

(declare-fun b_free!3013 () Bool)

(declare-fun b_next!3013 () Bool)

(assert (=> b!139097 (= b_free!3013 (not b_next!3013))))

(declare-fun tp!11512 () Bool)

(declare-fun b_and!8663 () Bool)

(assert (=> b!139097 (= tp!11512 b_and!8663)))

(declare-fun b!139093 () Bool)

(declare-fun b_free!3015 () Bool)

(declare-fun b_next!3015 () Bool)

(assert (=> b!139093 (= b_free!3015 (not b_next!3015))))

(declare-fun tp!11509 () Bool)

(declare-fun b_and!8665 () Bool)

(assert (=> b!139093 (= tp!11509 b_and!8665)))

(declare-fun b!139085 () Bool)

(declare-fun e!90690 () Bool)

(declare-fun tp_is_empty!2923 () Bool)

(assert (=> b!139085 (= e!90690 tp_is_empty!2923)))

(declare-fun mapIsEmpty!4809 () Bool)

(declare-fun mapRes!4810 () Bool)

(assert (=> mapIsEmpty!4809 mapRes!4810))

(declare-fun b!139086 () Bool)

(declare-fun e!90695 () Bool)

(declare-fun e!90696 () Bool)

(assert (=> b!139086 (= e!90695 (and e!90696 mapRes!4810))))

(declare-fun condMapEmpty!4810 () Bool)

(declare-datatypes ((V!3545 0))(
  ( (V!3546 (val!1506 Int)) )
))
(declare-datatypes ((array!4881 0))(
  ( (array!4882 (arr!2307 (Array (_ BitVec 32) (_ BitVec 64))) (size!2579 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1118 0))(
  ( (ValueCellFull!1118 (v!3272 V!3545)) (EmptyCell!1118) )
))
(declare-datatypes ((array!4883 0))(
  ( (array!4884 (arr!2308 (Array (_ BitVec 32) ValueCell!1118)) (size!2580 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1144 0))(
  ( (LongMapFixedSize!1145 (defaultEntry!2936 Int) (mask!7274 (_ BitVec 32)) (extraKeys!2691 (_ BitVec 32)) (zeroValue!2786 V!3545) (minValue!2786 V!3545) (_size!621 (_ BitVec 32)) (_keys!4695 array!4881) (_values!2919 array!4883) (_vacant!621 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1144)

(declare-fun mapDefault!4810 () ValueCell!1118)

