; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91736 () Bool)

(assert start!91736)

(declare-fun b!1044057 () Bool)

(declare-fun b_free!21113 () Bool)

(declare-fun b_next!21113 () Bool)

(assert (=> b!1044057 (= b_free!21113 (not b_next!21113))))

(declare-fun tp!74583 () Bool)

(declare-fun b_and!33673 () Bool)

(assert (=> b!1044057 (= tp!74583 b_and!33673)))

(declare-fun mapIsEmpty!38876 () Bool)

(declare-fun mapRes!38876 () Bool)

(assert (=> mapIsEmpty!38876 mapRes!38876))

(declare-fun b!1044053 () Bool)

(declare-fun e!591650 () Bool)

(declare-fun tp_is_empty!24833 () Bool)

(assert (=> b!1044053 (= e!591650 tp_is_empty!24833)))

(declare-fun b!1044054 () Bool)

(declare-fun e!591652 () Bool)

(assert (=> b!1044054 (= e!591652 (and e!591650 mapRes!38876))))

(declare-fun condMapEmpty!38876 () Bool)

(declare-datatypes ((V!37983 0))(
  ( (V!37984 (val!12467 Int)) )
))
(declare-datatypes ((ValueCell!11713 0))(
  ( (ValueCellFull!11713 (v!15058 V!37983)) (EmptyCell!11713) )
))
(declare-datatypes ((array!65832 0))(
  ( (array!65833 (arr!31667 (Array (_ BitVec 32) (_ BitVec 64))) (size!32202 (_ BitVec 32))) )
))
(declare-datatypes ((array!65834 0))(
  ( (array!65835 (arr!31668 (Array (_ BitVec 32) ValueCell!11713)) (size!32203 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6020 0))(
  ( (LongMapFixedSize!6021 (defaultEntry!6396 Int) (mask!30497 (_ BitVec 32)) (extraKeys!6124 (_ BitVec 32)) (zeroValue!6230 V!37983) (minValue!6230 V!37983) (_size!3065 (_ BitVec 32)) (_keys!11658 array!65832) (_values!6419 array!65834) (_vacant!3065 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6020)

(declare-fun mapDefault!38876 () ValueCell!11713)

