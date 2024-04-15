; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90526 () Bool)

(assert start!90526)

(declare-fun b!1035375 () Bool)

(declare-fun b_free!20851 () Bool)

(declare-fun b_next!20851 () Bool)

(assert (=> b!1035375 (= b_free!20851 (not b_next!20851))))

(declare-fun tp!73680 () Bool)

(declare-fun b_and!33325 () Bool)

(assert (=> b!1035375 (= tp!73680 b_and!33325)))

(declare-fun mapIsEmpty!38367 () Bool)

(declare-fun mapRes!38367 () Bool)

(assert (=> mapIsEmpty!38367 mapRes!38367))

(declare-fun e!585459 () Bool)

(declare-datatypes ((V!37635 0))(
  ( (V!37636 (val!12336 Int)) )
))
(declare-datatypes ((ValueCell!11582 0))(
  ( (ValueCellFull!11582 (v!14915 V!37635)) (EmptyCell!11582) )
))
(declare-datatypes ((array!65175 0))(
  ( (array!65176 (arr!31374 (Array (_ BitVec 32) (_ BitVec 64))) (size!31904 (_ BitVec 32))) )
))
(declare-datatypes ((array!65177 0))(
  ( (array!65178 (arr!31375 (Array (_ BitVec 32) ValueCell!11582)) (size!31905 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5758 0))(
  ( (LongMapFixedSize!5759 (defaultEntry!6257 Int) (mask!30141 (_ BitVec 32)) (extraKeys!5987 (_ BitVec 32)) (zeroValue!6091 V!37635) (minValue!6093 V!37635) (_size!2934 (_ BitVec 32)) (_keys!11440 array!65175) (_values!6280 array!65177) (_vacant!2934 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5758)

(declare-fun e!585461 () Bool)

(declare-fun tp_is_empty!24571 () Bool)

(declare-fun array_inv!24267 (array!65175) Bool)

(declare-fun array_inv!24268 (array!65177) Bool)

(assert (=> b!1035375 (= e!585461 (and tp!73680 tp_is_empty!24571 (array_inv!24267 (_keys!11440 thiss!1427)) (array_inv!24268 (_values!6280 thiss!1427)) e!585459))))

(declare-fun b!1035376 () Bool)

(declare-fun e!585457 () Bool)

(assert (=> b!1035376 (= e!585459 (and e!585457 mapRes!38367))))

(declare-fun condMapEmpty!38367 () Bool)

(declare-fun mapDefault!38367 () ValueCell!11582)

(assert (=> b!1035376 (= condMapEmpty!38367 (= (arr!31375 (_values!6280 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11582)) mapDefault!38367)))))

(declare-fun b!1035377 () Bool)

(assert (=> b!1035377 (= e!585457 tp_is_empty!24571)))

(declare-fun mapNonEmpty!38367 () Bool)

(declare-fun tp!73681 () Bool)

(declare-fun e!585462 () Bool)

(assert (=> mapNonEmpty!38367 (= mapRes!38367 (and tp!73681 e!585462))))

(declare-fun mapValue!38367 () ValueCell!11582)

(declare-fun mapRest!38367 () (Array (_ BitVec 32) ValueCell!11582))

(declare-fun mapKey!38367 () (_ BitVec 32))

(assert (=> mapNonEmpty!38367 (= (arr!31375 (_values!6280 thiss!1427)) (store mapRest!38367 mapKey!38367 mapValue!38367))))

(declare-fun b!1035378 () Bool)

(declare-fun res!691328 () Bool)

(declare-fun e!585460 () Bool)

(assert (=> b!1035378 (=> (not res!691328) (not e!585460))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035378 (= res!691328 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!691330 () Bool)

(assert (=> start!90526 (=> (not res!691330) (not e!585460))))

(declare-fun valid!2163 (LongMapFixedSize!5758) Bool)

(assert (=> start!90526 (= res!691330 (valid!2163 thiss!1427))))

(assert (=> start!90526 e!585460))

(assert (=> start!90526 e!585461))

(assert (=> start!90526 true))

(declare-fun b!1035379 () Bool)

(assert (=> b!1035379 (= e!585462 tp_is_empty!24571)))

(declare-fun b!1035380 () Bool)

(declare-fun res!691329 () Bool)

(assert (=> b!1035380 (=> (not res!691329) (not e!585460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035380 (= res!691329 (validMask!0 (mask!30141 thiss!1427)))))

(declare-fun b!1035381 () Bool)

(assert (=> b!1035381 (= e!585460 (and (= (size!31905 (_values!6280 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30141 thiss!1427))) (= (size!31904 (_keys!11440 thiss!1427)) (size!31905 (_values!6280 thiss!1427))) (bvsge (mask!30141 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5987 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5987 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))))

(assert (= (and start!90526 res!691330) b!1035378))

(assert (= (and b!1035378 res!691328) b!1035380))

(assert (= (and b!1035380 res!691329) b!1035381))

(assert (= (and b!1035376 condMapEmpty!38367) mapIsEmpty!38367))

(assert (= (and b!1035376 (not condMapEmpty!38367)) mapNonEmpty!38367))

(get-info :version)

(assert (= (and mapNonEmpty!38367 ((_ is ValueCellFull!11582) mapValue!38367)) b!1035379))

(assert (= (and b!1035376 ((_ is ValueCellFull!11582) mapDefault!38367)) b!1035377))

(assert (= b!1035375 b!1035376))

(assert (= start!90526 b!1035375))

(declare-fun m!954803 () Bool)

(assert (=> b!1035375 m!954803))

(declare-fun m!954805 () Bool)

(assert (=> b!1035375 m!954805))

(declare-fun m!954807 () Bool)

(assert (=> mapNonEmpty!38367 m!954807))

(declare-fun m!954809 () Bool)

(assert (=> start!90526 m!954809))

(declare-fun m!954811 () Bool)

(assert (=> b!1035380 m!954811))

(check-sat (not b!1035375) (not b_next!20851) (not mapNonEmpty!38367) (not start!90526) tp_is_empty!24571 (not b!1035380) b_and!33325)
(check-sat b_and!33325 (not b_next!20851))
