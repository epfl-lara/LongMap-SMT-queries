; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90530 () Bool)

(assert start!90530)

(declare-fun b!1035550 () Bool)

(declare-fun b_free!20853 () Bool)

(declare-fun b_next!20853 () Bool)

(assert (=> b!1035550 (= b_free!20853 (not b_next!20853))))

(declare-fun tp!73686 () Bool)

(declare-fun b_and!33353 () Bool)

(assert (=> b!1035550 (= tp!73686 b_and!33353)))

(declare-fun b!1035547 () Bool)

(declare-fun res!691406 () Bool)

(declare-fun e!585566 () Bool)

(assert (=> b!1035547 (=> (not res!691406) (not e!585566))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035547 (= res!691406 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035548 () Bool)

(declare-datatypes ((V!37637 0))(
  ( (V!37638 (val!12337 Int)) )
))
(declare-datatypes ((ValueCell!11583 0))(
  ( (ValueCellFull!11583 (v!14917 V!37637)) (EmptyCell!11583) )
))
(declare-datatypes ((array!65240 0))(
  ( (array!65241 (arr!31407 (Array (_ BitVec 32) (_ BitVec 64))) (size!31935 (_ BitVec 32))) )
))
(declare-datatypes ((array!65242 0))(
  ( (array!65243 (arr!31408 (Array (_ BitVec 32) ValueCell!11583)) (size!31936 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5760 0))(
  ( (LongMapFixedSize!5761 (defaultEntry!6258 Int) (mask!30147 (_ BitVec 32)) (extraKeys!5988 (_ BitVec 32)) (zeroValue!6092 V!37637) (minValue!6094 V!37637) (_size!2935 (_ BitVec 32)) (_keys!11445 array!65240) (_values!6281 array!65242) (_vacant!2935 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5760)

(assert (=> b!1035548 (= e!585566 (and (= (size!31936 (_values!6281 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30147 thiss!1427))) (= (size!31935 (_keys!11445 thiss!1427)) (size!31936 (_values!6281 thiss!1427))) (bvsge (mask!30147 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5988 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5988 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5988 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5988 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!5988 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5988 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))))

(declare-fun b!1035549 () Bool)

(declare-fun e!585569 () Bool)

(declare-fun e!585567 () Bool)

(declare-fun mapRes!38370 () Bool)

(assert (=> b!1035549 (= e!585569 (and e!585567 mapRes!38370))))

(declare-fun condMapEmpty!38370 () Bool)

(declare-fun mapDefault!38370 () ValueCell!11583)

(assert (=> b!1035549 (= condMapEmpty!38370 (= (arr!31408 (_values!6281 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11583)) mapDefault!38370)))))

(declare-fun tp_is_empty!24573 () Bool)

(declare-fun e!585571 () Bool)

(declare-fun array_inv!24295 (array!65240) Bool)

(declare-fun array_inv!24296 (array!65242) Bool)

(assert (=> b!1035550 (= e!585571 (and tp!73686 tp_is_empty!24573 (array_inv!24295 (_keys!11445 thiss!1427)) (array_inv!24296 (_values!6281 thiss!1427)) e!585569))))

(declare-fun b!1035551 () Bool)

(assert (=> b!1035551 (= e!585567 tp_is_empty!24573)))

(declare-fun b!1035552 () Bool)

(declare-fun e!585570 () Bool)

(assert (=> b!1035552 (= e!585570 tp_is_empty!24573)))

(declare-fun res!691404 () Bool)

(assert (=> start!90530 (=> (not res!691404) (not e!585566))))

(declare-fun valid!2175 (LongMapFixedSize!5760) Bool)

(assert (=> start!90530 (= res!691404 (valid!2175 thiss!1427))))

(assert (=> start!90530 e!585566))

(assert (=> start!90530 e!585571))

(assert (=> start!90530 true))

(declare-fun mapIsEmpty!38370 () Bool)

(assert (=> mapIsEmpty!38370 mapRes!38370))

(declare-fun b!1035553 () Bool)

(declare-fun res!691405 () Bool)

(assert (=> b!1035553 (=> (not res!691405) (not e!585566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035553 (= res!691405 (validMask!0 (mask!30147 thiss!1427)))))

(declare-fun mapNonEmpty!38370 () Bool)

(declare-fun tp!73687 () Bool)

(assert (=> mapNonEmpty!38370 (= mapRes!38370 (and tp!73687 e!585570))))

(declare-fun mapRest!38370 () (Array (_ BitVec 32) ValueCell!11583))

(declare-fun mapValue!38370 () ValueCell!11583)

(declare-fun mapKey!38370 () (_ BitVec 32))

(assert (=> mapNonEmpty!38370 (= (arr!31408 (_values!6281 thiss!1427)) (store mapRest!38370 mapKey!38370 mapValue!38370))))

(assert (= (and start!90530 res!691404) b!1035547))

(assert (= (and b!1035547 res!691406) b!1035553))

(assert (= (and b!1035553 res!691405) b!1035548))

(assert (= (and b!1035549 condMapEmpty!38370) mapIsEmpty!38370))

(assert (= (and b!1035549 (not condMapEmpty!38370)) mapNonEmpty!38370))

(get-info :version)

(assert (= (and mapNonEmpty!38370 ((_ is ValueCellFull!11583) mapValue!38370)) b!1035552))

(assert (= (and b!1035549 ((_ is ValueCellFull!11583) mapDefault!38370)) b!1035551))

(assert (= b!1035550 b!1035549))

(assert (= start!90530 b!1035550))

(declare-fun m!955433 () Bool)

(assert (=> b!1035550 m!955433))

(declare-fun m!955435 () Bool)

(assert (=> b!1035550 m!955435))

(declare-fun m!955437 () Bool)

(assert (=> start!90530 m!955437))

(declare-fun m!955439 () Bool)

(assert (=> b!1035553 m!955439))

(declare-fun m!955441 () Bool)

(assert (=> mapNonEmpty!38370 m!955441))

(check-sat (not b!1035550) (not start!90530) (not mapNonEmpty!38370) tp_is_empty!24573 (not b_next!20853) b_and!33353 (not b!1035553))
(check-sat b_and!33353 (not b_next!20853))
