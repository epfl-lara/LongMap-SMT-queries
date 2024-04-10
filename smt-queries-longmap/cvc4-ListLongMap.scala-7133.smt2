; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90532 () Bool)

(assert start!90532)

(declare-fun b!1035571 () Bool)

(declare-fun b_free!20855 () Bool)

(declare-fun b_next!20855 () Bool)

(assert (=> b!1035571 (= b_free!20855 (not b_next!20855))))

(declare-fun tp!73693 () Bool)

(declare-fun b_and!33355 () Bool)

(assert (=> b!1035571 (= tp!73693 b_and!33355)))

(declare-fun mapNonEmpty!38373 () Bool)

(declare-fun mapRes!38373 () Bool)

(declare-fun tp!73692 () Bool)

(declare-fun e!585584 () Bool)

(assert (=> mapNonEmpty!38373 (= mapRes!38373 (and tp!73692 e!585584))))

(declare-fun mapKey!38373 () (_ BitVec 32))

(declare-datatypes ((V!37639 0))(
  ( (V!37640 (val!12338 Int)) )
))
(declare-datatypes ((ValueCell!11584 0))(
  ( (ValueCellFull!11584 (v!14918 V!37639)) (EmptyCell!11584) )
))
(declare-fun mapValue!38373 () ValueCell!11584)

(declare-datatypes ((array!65244 0))(
  ( (array!65245 (arr!31409 (Array (_ BitVec 32) (_ BitVec 64))) (size!31937 (_ BitVec 32))) )
))
(declare-datatypes ((array!65246 0))(
  ( (array!65247 (arr!31410 (Array (_ BitVec 32) ValueCell!11584)) (size!31938 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5762 0))(
  ( (LongMapFixedSize!5763 (defaultEntry!6259 Int) (mask!30148 (_ BitVec 32)) (extraKeys!5989 (_ BitVec 32)) (zeroValue!6093 V!37639) (minValue!6095 V!37639) (_size!2936 (_ BitVec 32)) (_keys!11446 array!65244) (_values!6282 array!65246) (_vacant!2936 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5762)

(declare-fun mapRest!38373 () (Array (_ BitVec 32) ValueCell!11584))

(assert (=> mapNonEmpty!38373 (= (arr!31410 (_values!6282 thiss!1427)) (store mapRest!38373 mapKey!38373 mapValue!38373))))

(declare-fun b!1035568 () Bool)

(declare-fun e!585587 () Bool)

(declare-fun tp_is_empty!24575 () Bool)

(assert (=> b!1035568 (= e!585587 tp_is_empty!24575)))

(declare-fun b!1035569 () Bool)

(assert (=> b!1035569 (= e!585584 tp_is_empty!24575)))

(declare-fun b!1035570 () Bool)

(declare-fun e!585588 () Bool)

(assert (=> b!1035570 (= e!585588 (and (= (size!31938 (_values!6282 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30148 thiss!1427))) (= (size!31937 (_keys!11446 thiss!1427)) (size!31938 (_values!6282 thiss!1427))) (bvsge (mask!30148 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5989 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5989 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5989 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5989 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!5989 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5989 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))))

(declare-fun e!585586 () Bool)

(declare-fun e!585589 () Bool)

(declare-fun array_inv!24297 (array!65244) Bool)

(declare-fun array_inv!24298 (array!65246) Bool)

(assert (=> b!1035571 (= e!585589 (and tp!73693 tp_is_empty!24575 (array_inv!24297 (_keys!11446 thiss!1427)) (array_inv!24298 (_values!6282 thiss!1427)) e!585586))))

(declare-fun b!1035572 () Bool)

(assert (=> b!1035572 (= e!585586 (and e!585587 mapRes!38373))))

(declare-fun condMapEmpty!38373 () Bool)

(declare-fun mapDefault!38373 () ValueCell!11584)

