; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90458 () Bool)

(assert start!90458)

(declare-fun b!1035058 () Bool)

(declare-fun b_free!20821 () Bool)

(declare-fun b_next!20821 () Bool)

(assert (=> b!1035058 (= b_free!20821 (not b_next!20821))))

(declare-fun tp!73580 () Bool)

(declare-fun b_and!33321 () Bool)

(assert (=> b!1035058 (= tp!73580 b_and!33321)))

(declare-fun mapNonEmpty!38311 () Bool)

(declare-fun mapRes!38311 () Bool)

(declare-fun tp!73579 () Bool)

(declare-fun e!585187 () Bool)

(assert (=> mapNonEmpty!38311 (= mapRes!38311 (and tp!73579 e!585187))))

(declare-datatypes ((V!37595 0))(
  ( (V!37596 (val!12321 Int)) )
))
(declare-datatypes ((ValueCell!11567 0))(
  ( (ValueCellFull!11567 (v!14901 V!37595)) (EmptyCell!11567) )
))
(declare-fun mapRest!38311 () (Array (_ BitVec 32) ValueCell!11567))

(declare-fun mapValue!38311 () ValueCell!11567)

(declare-datatypes ((array!65170 0))(
  ( (array!65171 (arr!31375 (Array (_ BitVec 32) (_ BitVec 64))) (size!31901 (_ BitVec 32))) )
))
(declare-datatypes ((array!65172 0))(
  ( (array!65173 (arr!31376 (Array (_ BitVec 32) ValueCell!11567)) (size!31902 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5728 0))(
  ( (LongMapFixedSize!5729 (defaultEntry!6242 Int) (mask!30116 (_ BitVec 32)) (extraKeys!5972 (_ BitVec 32)) (zeroValue!6076 V!37595) (minValue!6078 V!37595) (_size!2919 (_ BitVec 32)) (_keys!11427 array!65170) (_values!6265 array!65172) (_vacant!2919 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5728)

(declare-fun mapKey!38311 () (_ BitVec 32))

(assert (=> mapNonEmpty!38311 (= (arr!31376 (_values!6265 thiss!1427)) (store mapRest!38311 mapKey!38311 mapValue!38311))))

(declare-fun b!1035054 () Bool)

(declare-fun e!585191 () Bool)

(assert (=> b!1035054 (= e!585191 (and (= (size!31902 (_values!6265 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30116 thiss!1427))) (= (size!31901 (_keys!11427 thiss!1427)) (size!31902 (_values!6265 thiss!1427))) (bvslt (mask!30116 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1035055 () Bool)

(declare-fun e!585190 () Bool)

(declare-fun e!585188 () Bool)

(assert (=> b!1035055 (= e!585190 (and e!585188 mapRes!38311))))

(declare-fun condMapEmpty!38311 () Bool)

(declare-fun mapDefault!38311 () ValueCell!11567)

