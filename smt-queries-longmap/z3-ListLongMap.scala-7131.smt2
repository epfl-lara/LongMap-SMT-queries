; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90518 () Bool)

(assert start!90518)

(declare-fun b!1035427 () Bool)

(declare-fun b_free!20841 () Bool)

(declare-fun b_next!20841 () Bool)

(assert (=> b!1035427 (= b_free!20841 (not b_next!20841))))

(declare-fun tp!73650 () Bool)

(declare-fun b_and!33341 () Bool)

(assert (=> b!1035427 (= tp!73650 b_and!33341)))

(declare-fun b!1035421 () Bool)

(declare-fun e!585463 () Bool)

(declare-datatypes ((V!37621 0))(
  ( (V!37622 (val!12331 Int)) )
))
(declare-datatypes ((ValueCell!11577 0))(
  ( (ValueCellFull!11577 (v!14911 V!37621)) (EmptyCell!11577) )
))
(declare-datatypes ((array!65216 0))(
  ( (array!65217 (arr!31395 (Array (_ BitVec 32) (_ BitVec 64))) (size!31923 (_ BitVec 32))) )
))
(declare-datatypes ((array!65218 0))(
  ( (array!65219 (arr!31396 (Array (_ BitVec 32) ValueCell!11577)) (size!31924 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5748 0))(
  ( (LongMapFixedSize!5749 (defaultEntry!6252 Int) (mask!30137 (_ BitVec 32)) (extraKeys!5982 (_ BitVec 32)) (zeroValue!6086 V!37621) (minValue!6088 V!37621) (_size!2929 (_ BitVec 32)) (_keys!11439 array!65216) (_values!6275 array!65218) (_vacant!2929 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5748)

(assert (=> b!1035421 (= e!585463 (and (= (size!31924 (_values!6275 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30137 thiss!1427))) (= (size!31923 (_keys!11439 thiss!1427)) (size!31924 (_values!6275 thiss!1427))) (bvsge (mask!30137 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5982 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5982 thiss!1427) #b00000000000000000000000000000011) (bvslt (bvand (extraKeys!5982 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1035422 () Bool)

(declare-fun e!585459 () Bool)

(declare-fun tp_is_empty!24561 () Bool)

(assert (=> b!1035422 (= e!585459 tp_is_empty!24561)))

(declare-fun b!1035423 () Bool)

(declare-fun res!691351 () Bool)

(assert (=> b!1035423 (=> (not res!691351) (not e!585463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035423 (= res!691351 (validMask!0 (mask!30137 thiss!1427)))))

(declare-fun mapIsEmpty!38352 () Bool)

(declare-fun mapRes!38352 () Bool)

(assert (=> mapIsEmpty!38352 mapRes!38352))

(declare-fun mapNonEmpty!38352 () Bool)

(declare-fun tp!73651 () Bool)

(assert (=> mapNonEmpty!38352 (= mapRes!38352 (and tp!73651 e!585459))))

(declare-fun mapValue!38352 () ValueCell!11577)

(declare-fun mapKey!38352 () (_ BitVec 32))

(declare-fun mapRest!38352 () (Array (_ BitVec 32) ValueCell!11577))

(assert (=> mapNonEmpty!38352 (= (arr!31396 (_values!6275 thiss!1427)) (store mapRest!38352 mapKey!38352 mapValue!38352))))

(declare-fun b!1035424 () Bool)

(declare-fun res!691350 () Bool)

(assert (=> b!1035424 (=> (not res!691350) (not e!585463))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035424 (= res!691350 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035425 () Bool)

(declare-fun e!585458 () Bool)

(assert (=> b!1035425 (= e!585458 tp_is_empty!24561)))

(declare-fun res!691352 () Bool)

(assert (=> start!90518 (=> (not res!691352) (not e!585463))))

(declare-fun valid!2171 (LongMapFixedSize!5748) Bool)

(assert (=> start!90518 (= res!691352 (valid!2171 thiss!1427))))

(assert (=> start!90518 e!585463))

(declare-fun e!585461 () Bool)

(assert (=> start!90518 e!585461))

(assert (=> start!90518 true))

(declare-fun b!1035426 () Bool)

(declare-fun e!585460 () Bool)

(assert (=> b!1035426 (= e!585460 (and e!585458 mapRes!38352))))

(declare-fun condMapEmpty!38352 () Bool)

(declare-fun mapDefault!38352 () ValueCell!11577)

(assert (=> b!1035426 (= condMapEmpty!38352 (= (arr!31396 (_values!6275 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11577)) mapDefault!38352)))))

(declare-fun array_inv!24285 (array!65216) Bool)

(declare-fun array_inv!24286 (array!65218) Bool)

(assert (=> b!1035427 (= e!585461 (and tp!73650 tp_is_empty!24561 (array_inv!24285 (_keys!11439 thiss!1427)) (array_inv!24286 (_values!6275 thiss!1427)) e!585460))))

(assert (= (and start!90518 res!691352) b!1035424))

(assert (= (and b!1035424 res!691350) b!1035423))

(assert (= (and b!1035423 res!691351) b!1035421))

(assert (= (and b!1035426 condMapEmpty!38352) mapIsEmpty!38352))

(assert (= (and b!1035426 (not condMapEmpty!38352)) mapNonEmpty!38352))

(get-info :version)

(assert (= (and mapNonEmpty!38352 ((_ is ValueCellFull!11577) mapValue!38352)) b!1035422))

(assert (= (and b!1035426 ((_ is ValueCellFull!11577) mapDefault!38352)) b!1035425))

(assert (= b!1035427 b!1035426))

(assert (= start!90518 b!1035427))

(declare-fun m!955373 () Bool)

(assert (=> b!1035423 m!955373))

(declare-fun m!955375 () Bool)

(assert (=> mapNonEmpty!38352 m!955375))

(declare-fun m!955377 () Bool)

(assert (=> start!90518 m!955377))

(declare-fun m!955379 () Bool)

(assert (=> b!1035427 m!955379))

(declare-fun m!955381 () Bool)

(assert (=> b!1035427 m!955381))

(check-sat (not b!1035427) (not b_next!20841) (not start!90518) tp_is_empty!24561 (not b!1035423) b_and!33341 (not mapNonEmpty!38352))
(check-sat b_and!33341 (not b_next!20841))
