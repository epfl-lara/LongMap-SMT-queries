; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90544 () Bool)

(assert start!90544)

(declare-fun b!1035705 () Bool)

(declare-fun b_free!20867 () Bool)

(declare-fun b_next!20867 () Bool)

(assert (=> b!1035705 (= b_free!20867 (not b_next!20867))))

(declare-fun tp!73729 () Bool)

(declare-fun b_and!33367 () Bool)

(assert (=> b!1035705 (= tp!73729 b_and!33367)))

(declare-fun b!1035703 () Bool)

(declare-fun e!585695 () Bool)

(declare-fun tp_is_empty!24587 () Bool)

(assert (=> b!1035703 (= e!585695 tp_is_empty!24587)))

(declare-fun mapNonEmpty!38391 () Bool)

(declare-fun mapRes!38391 () Bool)

(declare-fun tp!73728 () Bool)

(assert (=> mapNonEmpty!38391 (= mapRes!38391 (and tp!73728 e!585695))))

(declare-datatypes ((V!37655 0))(
  ( (V!37656 (val!12344 Int)) )
))
(declare-datatypes ((ValueCell!11590 0))(
  ( (ValueCellFull!11590 (v!14924 V!37655)) (EmptyCell!11590) )
))
(declare-fun mapValue!38391 () ValueCell!11590)

(declare-fun mapRest!38391 () (Array (_ BitVec 32) ValueCell!11590))

(declare-datatypes ((array!65268 0))(
  ( (array!65269 (arr!31421 (Array (_ BitVec 32) (_ BitVec 64))) (size!31949 (_ BitVec 32))) )
))
(declare-datatypes ((array!65270 0))(
  ( (array!65271 (arr!31422 (Array (_ BitVec 32) ValueCell!11590)) (size!31950 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5774 0))(
  ( (LongMapFixedSize!5775 (defaultEntry!6265 Int) (mask!30158 (_ BitVec 32)) (extraKeys!5995 (_ BitVec 32)) (zeroValue!6099 V!37655) (minValue!6101 V!37655) (_size!2942 (_ BitVec 32)) (_keys!11452 array!65268) (_values!6288 array!65270) (_vacant!2942 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5774)

(declare-fun mapKey!38391 () (_ BitVec 32))

(assert (=> mapNonEmpty!38391 (= (arr!31422 (_values!6288 thiss!1427)) (store mapRest!38391 mapKey!38391 mapValue!38391))))

(declare-fun b!1035704 () Bool)

(declare-fun res!691477 () Bool)

(declare-fun e!585696 () Bool)

(assert (=> b!1035704 (=> (not res!691477) (not e!585696))))

(assert (=> b!1035704 (= res!691477 (and (= (size!31950 (_values!6288 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30158 thiss!1427))) (= (size!31949 (_keys!11452 thiss!1427)) (size!31950 (_values!6288 thiss!1427))) (bvsge (mask!30158 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5995 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5995 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5995 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5995 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5995 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5995 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5995 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38391 () Bool)

(assert (=> mapIsEmpty!38391 mapRes!38391))

(declare-fun e!585693 () Bool)

(declare-fun e!585692 () Bool)

(declare-fun array_inv!24309 (array!65268) Bool)

(declare-fun array_inv!24310 (array!65270) Bool)

(assert (=> b!1035705 (= e!585692 (and tp!73729 tp_is_empty!24587 (array_inv!24309 (_keys!11452 thiss!1427)) (array_inv!24310 (_values!6288 thiss!1427)) e!585693))))

(declare-fun b!1035706 () Bool)

(declare-fun e!585694 () Bool)

(assert (=> b!1035706 (= e!585694 tp_is_empty!24587)))

(declare-fun b!1035707 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65268 (_ BitVec 32)) Bool)

(assert (=> b!1035707 (= e!585696 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11452 thiss!1427) (mask!30158 thiss!1427))))))

(declare-fun b!1035702 () Bool)

(assert (=> b!1035702 (= e!585693 (and e!585694 mapRes!38391))))

(declare-fun condMapEmpty!38391 () Bool)

(declare-fun mapDefault!38391 () ValueCell!11590)

