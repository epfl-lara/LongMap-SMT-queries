; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90524 () Bool)

(assert start!90524)

(declare-fun b!1035490 () Bool)

(declare-fun b_free!20847 () Bool)

(declare-fun b_next!20847 () Bool)

(assert (=> b!1035490 (= b_free!20847 (not b_next!20847))))

(declare-fun tp!73668 () Bool)

(declare-fun b_and!33347 () Bool)

(assert (=> b!1035490 (= tp!73668 b_and!33347)))

(declare-fun res!691377 () Bool)

(declare-fun e!585515 () Bool)

(assert (=> start!90524 (=> (not res!691377) (not e!585515))))

(declare-datatypes ((V!37629 0))(
  ( (V!37630 (val!12334 Int)) )
))
(declare-datatypes ((ValueCell!11580 0))(
  ( (ValueCellFull!11580 (v!14914 V!37629)) (EmptyCell!11580) )
))
(declare-datatypes ((array!65228 0))(
  ( (array!65229 (arr!31401 (Array (_ BitVec 32) (_ BitVec 64))) (size!31929 (_ BitVec 32))) )
))
(declare-datatypes ((array!65230 0))(
  ( (array!65231 (arr!31402 (Array (_ BitVec 32) ValueCell!11580)) (size!31930 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5754 0))(
  ( (LongMapFixedSize!5755 (defaultEntry!6255 Int) (mask!30142 (_ BitVec 32)) (extraKeys!5985 (_ BitVec 32)) (zeroValue!6089 V!37629) (minValue!6091 V!37629) (_size!2932 (_ BitVec 32)) (_keys!11442 array!65228) (_values!6278 array!65230) (_vacant!2932 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5754)

(declare-fun valid!2173 (LongMapFixedSize!5754) Bool)

(assert (=> start!90524 (= res!691377 (valid!2173 thiss!1427))))

(assert (=> start!90524 e!585515))

(declare-fun e!585517 () Bool)

(assert (=> start!90524 e!585517))

(assert (=> start!90524 true))

(declare-fun b!1035484 () Bool)

(declare-fun e!585514 () Bool)

(declare-fun tp_is_empty!24567 () Bool)

(assert (=> b!1035484 (= e!585514 tp_is_empty!24567)))

(declare-fun b!1035485 () Bool)

(declare-fun e!585516 () Bool)

(assert (=> b!1035485 (= e!585516 tp_is_empty!24567)))

(declare-fun mapIsEmpty!38361 () Bool)

(declare-fun mapRes!38361 () Bool)

(assert (=> mapIsEmpty!38361 mapRes!38361))

(declare-fun b!1035486 () Bool)

(assert (=> b!1035486 (= e!585515 (and (= (size!31930 (_values!6278 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30142 thiss!1427))) (= (size!31929 (_keys!11442 thiss!1427)) (size!31930 (_values!6278 thiss!1427))) (bvsge (mask!30142 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5985 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5985 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5985 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt (bvand (extraKeys!5985 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011)))))

(declare-fun b!1035487 () Bool)

(declare-fun res!691379 () Bool)

(assert (=> b!1035487 (=> (not res!691379) (not e!585515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035487 (= res!691379 (validMask!0 (mask!30142 thiss!1427)))))

(declare-fun b!1035488 () Bool)

(declare-fun e!585513 () Bool)

(assert (=> b!1035488 (= e!585513 (and e!585516 mapRes!38361))))

(declare-fun condMapEmpty!38361 () Bool)

(declare-fun mapDefault!38361 () ValueCell!11580)

(assert (=> b!1035488 (= condMapEmpty!38361 (= (arr!31402 (_values!6278 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11580)) mapDefault!38361)))))

(declare-fun mapNonEmpty!38361 () Bool)

(declare-fun tp!73669 () Bool)

(assert (=> mapNonEmpty!38361 (= mapRes!38361 (and tp!73669 e!585514))))

(declare-fun mapValue!38361 () ValueCell!11580)

(declare-fun mapKey!38361 () (_ BitVec 32))

(declare-fun mapRest!38361 () (Array (_ BitVec 32) ValueCell!11580))

(assert (=> mapNonEmpty!38361 (= (arr!31402 (_values!6278 thiss!1427)) (store mapRest!38361 mapKey!38361 mapValue!38361))))

(declare-fun b!1035489 () Bool)

(declare-fun res!691378 () Bool)

(assert (=> b!1035489 (=> (not res!691378) (not e!585515))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035489 (= res!691378 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!24289 (array!65228) Bool)

(declare-fun array_inv!24290 (array!65230) Bool)

(assert (=> b!1035490 (= e!585517 (and tp!73668 tp_is_empty!24567 (array_inv!24289 (_keys!11442 thiss!1427)) (array_inv!24290 (_values!6278 thiss!1427)) e!585513))))

(assert (= (and start!90524 res!691377) b!1035489))

(assert (= (and b!1035489 res!691378) b!1035487))

(assert (= (and b!1035487 res!691379) b!1035486))

(assert (= (and b!1035488 condMapEmpty!38361) mapIsEmpty!38361))

(assert (= (and b!1035488 (not condMapEmpty!38361)) mapNonEmpty!38361))

(get-info :version)

(assert (= (and mapNonEmpty!38361 ((_ is ValueCellFull!11580) mapValue!38361)) b!1035484))

(assert (= (and b!1035488 ((_ is ValueCellFull!11580) mapDefault!38361)) b!1035485))

(assert (= b!1035490 b!1035488))

(assert (= start!90524 b!1035490))

(declare-fun m!955403 () Bool)

(assert (=> start!90524 m!955403))

(declare-fun m!955405 () Bool)

(assert (=> b!1035487 m!955405))

(declare-fun m!955407 () Bool)

(assert (=> mapNonEmpty!38361 m!955407))

(declare-fun m!955409 () Bool)

(assert (=> b!1035490 m!955409))

(declare-fun m!955411 () Bool)

(assert (=> b!1035490 m!955411))

(check-sat (not mapNonEmpty!38361) tp_is_empty!24567 (not b_next!20847) (not b!1035490) (not b!1035487) (not start!90524) b_and!33347)
(check-sat b_and!33347 (not b_next!20847))
