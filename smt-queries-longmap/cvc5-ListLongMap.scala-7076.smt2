; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89510 () Bool)

(assert start!89510)

(declare-fun b!1026581 () Bool)

(declare-fun b_free!20509 () Bool)

(declare-fun b_next!20509 () Bool)

(assert (=> b!1026581 (= b_free!20509 (not b_next!20509))))

(declare-fun tp!72572 () Bool)

(declare-fun b_and!32755 () Bool)

(assert (=> b!1026581 (= tp!72572 b_and!32755)))

(declare-fun tp_is_empty!24229 () Bool)

(declare-fun e!579160 () Bool)

(declare-datatypes ((V!37179 0))(
  ( (V!37180 (val!12165 Int)) )
))
(declare-datatypes ((ValueCell!11411 0))(
  ( (ValueCellFull!11411 (v!14734 V!37179)) (EmptyCell!11411) )
))
(declare-datatypes ((array!64508 0))(
  ( (array!64509 (arr!31063 (Array (_ BitVec 32) (_ BitVec 64))) (size!31576 (_ BitVec 32))) )
))
(declare-datatypes ((array!64510 0))(
  ( (array!64511 (arr!31064 (Array (_ BitVec 32) ValueCell!11411)) (size!31577 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5416 0))(
  ( (LongMapFixedSize!5417 (defaultEntry!6060 Int) (mask!29758 (_ BitVec 32)) (extraKeys!5792 (_ BitVec 32)) (zeroValue!5896 V!37179) (minValue!5896 V!37179) (_size!2763 (_ BitVec 32)) (_keys!11207 array!64508) (_values!6083 array!64510) (_vacant!2763 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5416)

(declare-fun e!579163 () Bool)

(declare-fun array_inv!24053 (array!64508) Bool)

(declare-fun array_inv!24054 (array!64510) Bool)

(assert (=> b!1026581 (= e!579160 (and tp!72572 tp_is_empty!24229 (array_inv!24053 (_keys!11207 thiss!1427)) (array_inv!24054 (_values!6083 thiss!1427)) e!579163))))

(declare-fun b!1026582 () Bool)

(declare-fun e!579164 () Bool)

(declare-fun mapRes!37772 () Bool)

(assert (=> b!1026582 (= e!579163 (and e!579164 mapRes!37772))))

(declare-fun condMapEmpty!37772 () Bool)

(declare-fun mapDefault!37772 () ValueCell!11411)

