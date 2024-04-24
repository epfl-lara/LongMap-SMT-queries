; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90950 () Bool)

(assert start!90950)

(declare-fun b!1038631 () Bool)

(declare-fun b_free!20893 () Bool)

(declare-fun b_next!20893 () Bool)

(assert (=> b!1038631 (= b_free!20893 (not b_next!20893))))

(declare-fun tp!73824 () Bool)

(declare-fun b_and!33435 () Bool)

(assert (=> b!1038631 (= tp!73824 b_and!33435)))

(declare-fun b!1038627 () Bool)

(declare-fun e!587585 () Bool)

(declare-fun e!587589 () Bool)

(assert (=> b!1038627 (= e!587585 e!587589)))

(declare-fun res!692641 () Bool)

(assert (=> b!1038627 (=> (not res!692641) (not e!587589))))

(declare-datatypes ((SeekEntryResult!9709 0))(
  ( (MissingZero!9709 (index!41207 (_ BitVec 32))) (Found!9709 (index!41208 (_ BitVec 32))) (Intermediate!9709 (undefined!10521 Bool) (index!41209 (_ BitVec 32)) (x!92514 (_ BitVec 32))) (Undefined!9709) (MissingVacant!9709 (index!41210 (_ BitVec 32))) )
))
(declare-fun lt!457972 () SeekEntryResult!9709)

(get-info :version)

(assert (=> b!1038627 (= res!692641 ((_ is Found!9709) lt!457972))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37691 0))(
  ( (V!37692 (val!12357 Int)) )
))
(declare-datatypes ((ValueCell!11603 0))(
  ( (ValueCellFull!11603 (v!14936 V!37691)) (EmptyCell!11603) )
))
(declare-datatypes ((array!65379 0))(
  ( (array!65380 (arr!31465 (Array (_ BitVec 32) (_ BitVec 64))) (size!31996 (_ BitVec 32))) )
))
(declare-datatypes ((array!65381 0))(
  ( (array!65382 (arr!31466 (Array (_ BitVec 32) ValueCell!11603)) (size!31997 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5800 0))(
  ( (LongMapFixedSize!5801 (defaultEntry!6282 Int) (mask!30259 (_ BitVec 32)) (extraKeys!6010 (_ BitVec 32)) (zeroValue!6116 V!37691) (minValue!6116 V!37691) (_size!2955 (_ BitVec 32)) (_keys!11516 array!65379) (_values!6305 array!65381) (_vacant!2955 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5800)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65379 (_ BitVec 32)) SeekEntryResult!9709)

(assert (=> b!1038627 (= lt!457972 (seekEntry!0 key!909 (_keys!11516 thiss!1427) (mask!30259 thiss!1427)))))

(declare-fun mapNonEmpty!38448 () Bool)

(declare-fun mapRes!38448 () Bool)

(declare-fun tp!73825 () Bool)

(declare-fun e!587586 () Bool)

(assert (=> mapNonEmpty!38448 (= mapRes!38448 (and tp!73825 e!587586))))

(declare-fun mapValue!38448 () ValueCell!11603)

(declare-fun mapRest!38448 () (Array (_ BitVec 32) ValueCell!11603))

(declare-fun mapKey!38448 () (_ BitVec 32))

(assert (=> mapNonEmpty!38448 (= (arr!31466 (_values!6305 thiss!1427)) (store mapRest!38448 mapKey!38448 mapValue!38448))))

(declare-fun b!1038628 () Bool)

(declare-fun e!587587 () Bool)

(declare-fun e!587590 () Bool)

(assert (=> b!1038628 (= e!587587 (and e!587590 mapRes!38448))))

(declare-fun condMapEmpty!38448 () Bool)

(declare-fun mapDefault!38448 () ValueCell!11603)

(assert (=> b!1038628 (= condMapEmpty!38448 (= (arr!31466 (_values!6305 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11603)) mapDefault!38448)))))

(declare-fun b!1038629 () Bool)

(declare-fun tp_is_empty!24613 () Bool)

(assert (=> b!1038629 (= e!587586 tp_is_empty!24613)))

(declare-fun mapIsEmpty!38448 () Bool)

(assert (=> mapIsEmpty!38448 mapRes!38448))

(declare-fun b!1038630 () Bool)

(assert (=> b!1038630 (= e!587590 tp_is_empty!24613)))

(declare-fun e!587588 () Bool)

(declare-fun array_inv!24345 (array!65379) Bool)

(declare-fun array_inv!24346 (array!65381) Bool)

(assert (=> b!1038631 (= e!587588 (and tp!73824 tp_is_empty!24613 (array_inv!24345 (_keys!11516 thiss!1427)) (array_inv!24346 (_values!6305 thiss!1427)) e!587587))))

(declare-fun b!1038632 () Bool)

(assert (=> b!1038632 (= e!587589 (not true))))

(declare-fun arrayCountValidKeys!0 (array!65379 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038632 (= (arrayCountValidKeys!0 (array!65380 (store (arr!31465 (_keys!11516 thiss!1427)) (index!41208 lt!457972) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31996 (_keys!11516 thiss!1427))) #b00000000000000000000000000000000 (size!31996 (_keys!11516 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11516 thiss!1427) #b00000000000000000000000000000000 (size!31996 (_keys!11516 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33951 0))(
  ( (Unit!33952) )
))
(declare-fun lt!457971 () Unit!33951)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65379 (_ BitVec 32) (_ BitVec 64)) Unit!33951)

(assert (=> b!1038632 (= lt!457971 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11516 thiss!1427) (index!41208 lt!457972) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!692643 () Bool)

(assert (=> start!90950 (=> (not res!692643) (not e!587585))))

(declare-fun valid!2192 (LongMapFixedSize!5800) Bool)

(assert (=> start!90950 (= res!692643 (valid!2192 thiss!1427))))

(assert (=> start!90950 e!587585))

(assert (=> start!90950 e!587588))

(assert (=> start!90950 true))

(declare-fun b!1038633 () Bool)

(declare-fun res!692642 () Bool)

(assert (=> b!1038633 (=> (not res!692642) (not e!587585))))

(assert (=> b!1038633 (= res!692642 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!90950 res!692643) b!1038633))

(assert (= (and b!1038633 res!692642) b!1038627))

(assert (= (and b!1038627 res!692641) b!1038632))

(assert (= (and b!1038628 condMapEmpty!38448) mapIsEmpty!38448))

(assert (= (and b!1038628 (not condMapEmpty!38448)) mapNonEmpty!38448))

(assert (= (and mapNonEmpty!38448 ((_ is ValueCellFull!11603) mapValue!38448)) b!1038629))

(assert (= (and b!1038628 ((_ is ValueCellFull!11603) mapDefault!38448)) b!1038630))

(assert (= b!1038631 b!1038628))

(assert (= start!90950 b!1038631))

(declare-fun m!959211 () Bool)

(assert (=> b!1038632 m!959211))

(declare-fun m!959213 () Bool)

(assert (=> b!1038632 m!959213))

(declare-fun m!959215 () Bool)

(assert (=> b!1038632 m!959215))

(declare-fun m!959217 () Bool)

(assert (=> b!1038632 m!959217))

(declare-fun m!959219 () Bool)

(assert (=> mapNonEmpty!38448 m!959219))

(declare-fun m!959221 () Bool)

(assert (=> start!90950 m!959221))

(declare-fun m!959223 () Bool)

(assert (=> b!1038631 m!959223))

(declare-fun m!959225 () Bool)

(assert (=> b!1038631 m!959225))

(declare-fun m!959227 () Bool)

(assert (=> b!1038627 m!959227))

(check-sat (not b_next!20893) (not b!1038632) (not mapNonEmpty!38448) tp_is_empty!24613 b_and!33435 (not start!90950) (not b!1038631) (not b!1038627))
(check-sat b_and!33435 (not b_next!20893))
