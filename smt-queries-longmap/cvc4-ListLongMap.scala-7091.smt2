; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89890 () Bool)

(assert start!89890)

(declare-fun b!1029743 () Bool)

(declare-fun b_free!20603 () Bool)

(declare-fun b_next!20603 () Bool)

(assert (=> b!1029743 (= b_free!20603 (not b_next!20603))))

(declare-fun tp!72872 () Bool)

(declare-fun b_and!32949 () Bool)

(assert (=> b!1029743 (= tp!72872 b_and!32949)))

(declare-fun tp_is_empty!24323 () Bool)

(declare-fun e!581419 () Bool)

(declare-datatypes ((V!37303 0))(
  ( (V!37304 (val!12212 Int)) )
))
(declare-datatypes ((ValueCell!11458 0))(
  ( (ValueCellFull!11458 (v!14787 V!37303)) (EmptyCell!11458) )
))
(declare-datatypes ((array!64706 0))(
  ( (array!64707 (arr!31157 (Array (_ BitVec 32) (_ BitVec 64))) (size!31673 (_ BitVec 32))) )
))
(declare-datatypes ((array!64708 0))(
  ( (array!64709 (arr!31158 (Array (_ BitVec 32) ValueCell!11458)) (size!31674 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5510 0))(
  ( (LongMapFixedSize!5511 (defaultEntry!6123 Int) (mask!29886 (_ BitVec 32)) (extraKeys!5855 (_ BitVec 32)) (zeroValue!5959 V!37303) (minValue!5959 V!37303) (_size!2810 (_ BitVec 32)) (_keys!11289 array!64706) (_values!6146 array!64708) (_vacant!2810 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5510)

(declare-fun e!581425 () Bool)

(declare-fun array_inv!24119 (array!64706) Bool)

(declare-fun array_inv!24120 (array!64708) Bool)

(assert (=> b!1029743 (= e!581419 (and tp!72872 tp_is_empty!24323 (array_inv!24119 (_keys!11289 thiss!1427)) (array_inv!24120 (_values!6146 thiss!1427)) e!581425))))

(declare-fun b!1029744 () Bool)

(declare-fun e!581420 () Bool)

(declare-fun mapRes!37931 () Bool)

(assert (=> b!1029744 (= e!581425 (and e!581420 mapRes!37931))))

(declare-fun condMapEmpty!37931 () Bool)

(declare-fun mapDefault!37931 () ValueCell!11458)

