; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90756 () Bool)

(assert start!90756)

(declare-fun b!1036780 () Bool)

(declare-fun b_free!20845 () Bool)

(declare-fun b_next!20845 () Bool)

(assert (=> b!1036780 (= b_free!20845 (not b_next!20845))))

(declare-fun tp!73663 () Bool)

(declare-fun b_and!33355 () Bool)

(assert (=> b!1036780 (= tp!73663 b_and!33355)))

(declare-fun mapNonEmpty!38358 () Bool)

(declare-fun mapRes!38358 () Bool)

(declare-fun tp!73662 () Bool)

(declare-fun e!586340 () Bool)

(assert (=> mapNonEmpty!38358 (= mapRes!38358 (and tp!73662 e!586340))))

(declare-datatypes ((V!37627 0))(
  ( (V!37628 (val!12333 Int)) )
))
(declare-datatypes ((ValueCell!11579 0))(
  ( (ValueCellFull!11579 (v!14909 V!37627)) (EmptyCell!11579) )
))
(declare-fun mapValue!38358 () ValueCell!11579)

(declare-fun mapKey!38358 () (_ BitVec 32))

(declare-datatypes ((array!65273 0))(
  ( (array!65274 (arr!31417 (Array (_ BitVec 32) (_ BitVec 64))) (size!31946 (_ BitVec 32))) )
))
(declare-datatypes ((array!65275 0))(
  ( (array!65276 (arr!31418 (Array (_ BitVec 32) ValueCell!11579)) (size!31947 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5752 0))(
  ( (LongMapFixedSize!5753 (defaultEntry!6254 Int) (mask!30201 (_ BitVec 32)) (extraKeys!5984 (_ BitVec 32)) (zeroValue!6088 V!37627) (minValue!6090 V!37627) (_size!2931 (_ BitVec 32)) (_keys!11479 array!65273) (_values!6277 array!65275) (_vacant!2931 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5752)

(declare-fun mapRest!38358 () (Array (_ BitVec 32) ValueCell!11579))

(assert (=> mapNonEmpty!38358 (= (arr!31418 (_values!6277 thiss!1427)) (store mapRest!38358 mapKey!38358 mapValue!38358))))

(declare-fun b!1036778 () Bool)

(declare-fun res!691878 () Bool)

(declare-fun e!586342 () Bool)

(assert (=> b!1036778 (=> (not res!691878) (not e!586342))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036778 (= res!691878 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036779 () Bool)

(assert (=> b!1036779 (= e!586342 (and (= (size!31947 (_values!6277 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30201 thiss!1427))) (= (size!31946 (_keys!11479 thiss!1427)) (size!31947 (_values!6277 thiss!1427))) (bvsge (mask!30201 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5984 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5984 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5984 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt (bvand (extraKeys!5984 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011)))))

(declare-fun res!691879 () Bool)

(assert (=> start!90756 (=> (not res!691879) (not e!586342))))

(declare-fun valid!2179 (LongMapFixedSize!5752) Bool)

(assert (=> start!90756 (= res!691879 (valid!2179 thiss!1427))))

(assert (=> start!90756 e!586342))

(declare-fun e!586337 () Bool)

(assert (=> start!90756 e!586337))

(assert (=> start!90756 true))

(declare-fun tp_is_empty!24565 () Bool)

(declare-fun e!586341 () Bool)

(declare-fun array_inv!24315 (array!65273) Bool)

(declare-fun array_inv!24316 (array!65275) Bool)

(assert (=> b!1036780 (= e!586337 (and tp!73663 tp_is_empty!24565 (array_inv!24315 (_keys!11479 thiss!1427)) (array_inv!24316 (_values!6277 thiss!1427)) e!586341))))

(declare-fun b!1036781 () Bool)

(assert (=> b!1036781 (= e!586340 tp_is_empty!24565)))

(declare-fun b!1036782 () Bool)

(declare-fun e!586338 () Bool)

(assert (=> b!1036782 (= e!586341 (and e!586338 mapRes!38358))))

(declare-fun condMapEmpty!38358 () Bool)

(declare-fun mapDefault!38358 () ValueCell!11579)

(assert (=> b!1036782 (= condMapEmpty!38358 (= (arr!31418 (_values!6277 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11579)) mapDefault!38358)))))

(declare-fun mapIsEmpty!38358 () Bool)

(assert (=> mapIsEmpty!38358 mapRes!38358))

(declare-fun b!1036783 () Bool)

(assert (=> b!1036783 (= e!586338 tp_is_empty!24565)))

(declare-fun b!1036784 () Bool)

(declare-fun res!691880 () Bool)

(assert (=> b!1036784 (=> (not res!691880) (not e!586342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1036784 (= res!691880 (validMask!0 (mask!30201 thiss!1427)))))

(assert (= (and start!90756 res!691879) b!1036778))

(assert (= (and b!1036778 res!691878) b!1036784))

(assert (= (and b!1036784 res!691880) b!1036779))

(assert (= (and b!1036782 condMapEmpty!38358) mapIsEmpty!38358))

(assert (= (and b!1036782 (not condMapEmpty!38358)) mapNonEmpty!38358))

(get-info :version)

(assert (= (and mapNonEmpty!38358 ((_ is ValueCellFull!11579) mapValue!38358)) b!1036781))

(assert (= (and b!1036782 ((_ is ValueCellFull!11579) mapDefault!38358)) b!1036783))

(assert (= b!1036780 b!1036782))

(assert (= start!90756 b!1036780))

(declare-fun m!957057 () Bool)

(assert (=> mapNonEmpty!38358 m!957057))

(declare-fun m!957059 () Bool)

(assert (=> start!90756 m!957059))

(declare-fun m!957061 () Bool)

(assert (=> b!1036780 m!957061))

(declare-fun m!957063 () Bool)

(assert (=> b!1036780 m!957063))

(declare-fun m!957065 () Bool)

(assert (=> b!1036784 m!957065))

(check-sat (not b!1036780) b_and!33355 (not start!90756) (not b!1036784) (not mapNonEmpty!38358) tp_is_empty!24565 (not b_next!20845))
(check-sat b_and!33355 (not b_next!20845))
