; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90256 () Bool)

(assert start!90256)

(declare-fun b!1033240 () Bool)

(declare-fun b_free!20775 () Bool)

(declare-fun b_next!20775 () Bool)

(assert (=> b!1033240 (= b_free!20775 (not b_next!20775))))

(declare-fun tp!73419 () Bool)

(declare-fun b_and!33243 () Bool)

(assert (=> b!1033240 (= tp!73419 b_and!33243)))

(declare-fun b!1033239 () Bool)

(declare-fun e!583970 () Bool)

(declare-datatypes ((V!37533 0))(
  ( (V!37534 (val!12298 Int)) )
))
(declare-datatypes ((ValueCell!11544 0))(
  ( (ValueCellFull!11544 (v!14875 V!37533)) (EmptyCell!11544) )
))
(declare-datatypes ((array!65066 0))(
  ( (array!65067 (arr!31329 (Array (_ BitVec 32) (_ BitVec 64))) (size!31851 (_ BitVec 32))) )
))
(declare-datatypes ((array!65068 0))(
  ( (array!65069 (arr!31330 (Array (_ BitVec 32) ValueCell!11544)) (size!31852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5682 0))(
  ( (LongMapFixedSize!5683 (defaultEntry!6215 Int) (mask!30060 (_ BitVec 32)) (extraKeys!5947 (_ BitVec 32)) (zeroValue!6051 V!37533) (minValue!6051 V!37533) (_size!2896 (_ BitVec 32)) (_keys!11393 array!65066) (_values!6238 array!65068) (_vacant!2896 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5682)

(assert (=> b!1033239 (= e!583970 (and (= (size!31852 (_values!6238 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30060 thiss!1427))) (= (size!31851 (_keys!11393 thiss!1427)) (size!31852 (_values!6238 thiss!1427))) (bvsge (mask!30060 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5947 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5947 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5947 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5947 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!5947 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5947 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)))))))

(declare-fun mapNonEmpty!38219 () Bool)

(declare-fun mapRes!38219 () Bool)

(declare-fun tp!73418 () Bool)

(declare-fun e!583974 () Bool)

(assert (=> mapNonEmpty!38219 (= mapRes!38219 (and tp!73418 e!583974))))

(declare-fun mapValue!38219 () ValueCell!11544)

(declare-fun mapRest!38219 () (Array (_ BitVec 32) ValueCell!11544))

(declare-fun mapKey!38219 () (_ BitVec 32))

(assert (=> mapNonEmpty!38219 (= (arr!31330 (_values!6238 thiss!1427)) (store mapRest!38219 mapKey!38219 mapValue!38219))))

(declare-fun tp_is_empty!24495 () Bool)

(declare-fun e!583972 () Bool)

(declare-fun e!583975 () Bool)

(declare-fun array_inv!24241 (array!65066) Bool)

(declare-fun array_inv!24242 (array!65068) Bool)

(assert (=> b!1033240 (= e!583975 (and tp!73419 tp_is_empty!24495 (array_inv!24241 (_keys!11393 thiss!1427)) (array_inv!24242 (_values!6238 thiss!1427)) e!583972))))

(declare-fun b!1033241 () Bool)

(assert (=> b!1033241 (= e!583974 tp_is_empty!24495)))

(declare-fun res!690411 () Bool)

(assert (=> start!90256 (=> (not res!690411) (not e!583970))))

(declare-fun valid!2147 (LongMapFixedSize!5682) Bool)

(assert (=> start!90256 (= res!690411 (valid!2147 thiss!1427))))

(assert (=> start!90256 e!583970))

(assert (=> start!90256 e!583975))

(assert (=> start!90256 true))

(declare-fun b!1033242 () Bool)

(declare-fun e!583973 () Bool)

(assert (=> b!1033242 (= e!583973 tp_is_empty!24495)))

(declare-fun b!1033243 () Bool)

(assert (=> b!1033243 (= e!583972 (and e!583973 mapRes!38219))))

(declare-fun condMapEmpty!38219 () Bool)

(declare-fun mapDefault!38219 () ValueCell!11544)

(assert (=> b!1033243 (= condMapEmpty!38219 (= (arr!31330 (_values!6238 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11544)) mapDefault!38219)))))

(declare-fun mapIsEmpty!38219 () Bool)

(assert (=> mapIsEmpty!38219 mapRes!38219))

(declare-fun b!1033244 () Bool)

(declare-fun res!690413 () Bool)

(assert (=> b!1033244 (=> (not res!690413) (not e!583970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033244 (= res!690413 (validMask!0 (mask!30060 thiss!1427)))))

(declare-fun b!1033245 () Bool)

(declare-fun res!690412 () Bool)

(assert (=> b!1033245 (=> (not res!690412) (not e!583970))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033245 (= res!690412 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!90256 res!690411) b!1033245))

(assert (= (and b!1033245 res!690412) b!1033244))

(assert (= (and b!1033244 res!690413) b!1033239))

(assert (= (and b!1033243 condMapEmpty!38219) mapIsEmpty!38219))

(assert (= (and b!1033243 (not condMapEmpty!38219)) mapNonEmpty!38219))

(get-info :version)

(assert (= (and mapNonEmpty!38219 ((_ is ValueCellFull!11544) mapValue!38219)) b!1033241))

(assert (= (and b!1033243 ((_ is ValueCellFull!11544) mapDefault!38219)) b!1033242))

(assert (= b!1033240 b!1033243))

(assert (= start!90256 b!1033240))

(declare-fun m!953097 () Bool)

(assert (=> mapNonEmpty!38219 m!953097))

(declare-fun m!953099 () Bool)

(assert (=> b!1033240 m!953099))

(declare-fun m!953101 () Bool)

(assert (=> b!1033240 m!953101))

(declare-fun m!953103 () Bool)

(assert (=> start!90256 m!953103))

(declare-fun m!953105 () Bool)

(assert (=> b!1033244 m!953105))

(check-sat (not b_next!20775) tp_is_empty!24495 (not b!1033244) b_and!33243 (not b!1033240) (not mapNonEmpty!38219) (not start!90256))
(check-sat b_and!33243 (not b_next!20775))
