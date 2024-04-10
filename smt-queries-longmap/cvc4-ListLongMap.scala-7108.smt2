; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90098 () Bool)

(assert start!90098)

(declare-fun b!1032179 () Bool)

(declare-fun b_free!20705 () Bool)

(declare-fun b_next!20705 () Bool)

(assert (=> b!1032179 (= b_free!20705 (not b_next!20705))))

(declare-fun tp!73186 () Bool)

(declare-fun b_and!33173 () Bool)

(assert (=> b!1032179 (= tp!73186 b_and!33173)))

(declare-fun mapIsEmpty!38091 () Bool)

(declare-fun mapRes!38091 () Bool)

(assert (=> mapIsEmpty!38091 mapRes!38091))

(declare-fun b!1032174 () Bool)

(declare-fun e!583130 () Bool)

(declare-fun tp_is_empty!24425 () Bool)

(assert (=> b!1032174 (= e!583130 tp_is_empty!24425)))

(declare-fun b!1032175 () Bool)

(declare-fun e!583128 () Bool)

(declare-fun e!583126 () Bool)

(assert (=> b!1032175 (= e!583128 (and e!583126 mapRes!38091))))

(declare-fun condMapEmpty!38091 () Bool)

(declare-datatypes ((V!37439 0))(
  ( (V!37440 (val!12263 Int)) )
))
(declare-datatypes ((ValueCell!11509 0))(
  ( (ValueCellFull!11509 (v!14840 V!37439)) (EmptyCell!11509) )
))
(declare-datatypes ((array!64914 0))(
  ( (array!64915 (arr!31259 (Array (_ BitVec 32) (_ BitVec 64))) (size!31776 (_ BitVec 32))) )
))
(declare-datatypes ((array!64916 0))(
  ( (array!64917 (arr!31260 (Array (_ BitVec 32) ValueCell!11509)) (size!31777 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5612 0))(
  ( (LongMapFixedSize!5613 (defaultEntry!6180 Int) (mask!29990 (_ BitVec 32)) (extraKeys!5912 (_ BitVec 32)) (zeroValue!6016 V!37439) (minValue!6016 V!37439) (_size!2861 (_ BitVec 32)) (_keys!11353 array!64914) (_values!6203 array!64916) (_vacant!2861 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5612)

(declare-fun mapDefault!38091 () ValueCell!11509)

