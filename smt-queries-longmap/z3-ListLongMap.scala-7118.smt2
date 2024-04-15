; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90240 () Bool)

(assert start!90240)

(declare-fun b!1032945 () Bool)

(declare-fun b_free!20761 () Bool)

(declare-fun b_next!20761 () Bool)

(assert (=> b!1032945 (= b_free!20761 (not b_next!20761))))

(declare-fun tp!73376 () Bool)

(declare-fun b_and!33203 () Bool)

(assert (=> b!1032945 (= tp!73376 b_and!33203)))

(declare-fun b!1032941 () Bool)

(declare-fun res!690281 () Bool)

(declare-fun e!583758 () Bool)

(assert (=> b!1032941 (=> (not res!690281) (not e!583758))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032941 (= res!690281 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1032942 () Bool)

(declare-fun e!583753 () Bool)

(declare-fun e!583757 () Bool)

(declare-fun mapRes!38198 () Bool)

(assert (=> b!1032942 (= e!583753 (and e!583757 mapRes!38198))))

(declare-fun condMapEmpty!38198 () Bool)

(declare-datatypes ((V!37515 0))(
  ( (V!37516 (val!12291 Int)) )
))
(declare-datatypes ((ValueCell!11537 0))(
  ( (ValueCellFull!11537 (v!14867 V!37515)) (EmptyCell!11537) )
))
(declare-datatypes ((array!64977 0))(
  ( (array!64978 (arr!31284 (Array (_ BitVec 32) (_ BitVec 64))) (size!31808 (_ BitVec 32))) )
))
(declare-datatypes ((array!64979 0))(
  ( (array!64980 (arr!31285 (Array (_ BitVec 32) ValueCell!11537)) (size!31809 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5668 0))(
  ( (LongMapFixedSize!5669 (defaultEntry!6208 Int) (mask!30044 (_ BitVec 32)) (extraKeys!5940 (_ BitVec 32)) (zeroValue!6044 V!37515) (minValue!6044 V!37515) (_size!2889 (_ BitVec 32)) (_keys!11382 array!64977) (_values!6231 array!64979) (_vacant!2889 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5668)

(declare-fun mapDefault!38198 () ValueCell!11537)

(assert (=> b!1032942 (= condMapEmpty!38198 (= (arr!31285 (_values!6231 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11537)) mapDefault!38198)))))

(declare-fun res!690283 () Bool)

(assert (=> start!90240 (=> (not res!690283) (not e!583758))))

(declare-fun valid!2134 (LongMapFixedSize!5668) Bool)

(assert (=> start!90240 (= res!690283 (valid!2134 thiss!1427))))

(assert (=> start!90240 e!583758))

(declare-fun e!583754 () Bool)

(assert (=> start!90240 e!583754))

(assert (=> start!90240 true))

(declare-fun b!1032943 () Bool)

(declare-fun res!690282 () Bool)

(assert (=> b!1032943 (=> (not res!690282) (not e!583758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032943 (= res!690282 (validMask!0 (mask!30044 thiss!1427)))))

(declare-fun mapIsEmpty!38198 () Bool)

(assert (=> mapIsEmpty!38198 mapRes!38198))

(declare-fun b!1032944 () Bool)

(declare-fun tp_is_empty!24481 () Bool)

(assert (=> b!1032944 (= e!583757 tp_is_empty!24481)))

(declare-fun array_inv!24207 (array!64977) Bool)

(declare-fun array_inv!24208 (array!64979) Bool)

(assert (=> b!1032945 (= e!583754 (and tp!73376 tp_is_empty!24481 (array_inv!24207 (_keys!11382 thiss!1427)) (array_inv!24208 (_values!6231 thiss!1427)) e!583753))))

(declare-fun mapNonEmpty!38198 () Bool)

(declare-fun tp!73377 () Bool)

(declare-fun e!583755 () Bool)

(assert (=> mapNonEmpty!38198 (= mapRes!38198 (and tp!73377 e!583755))))

(declare-fun mapValue!38198 () ValueCell!11537)

(declare-fun mapKey!38198 () (_ BitVec 32))

(declare-fun mapRest!38198 () (Array (_ BitVec 32) ValueCell!11537))

(assert (=> mapNonEmpty!38198 (= (arr!31285 (_values!6231 thiss!1427)) (store mapRest!38198 mapKey!38198 mapValue!38198))))

(declare-fun b!1032946 () Bool)

(assert (=> b!1032946 (= e!583758 (and (= (size!31809 (_values!6231 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30044 thiss!1427))) (= (size!31808 (_keys!11382 thiss!1427)) (size!31809 (_values!6231 thiss!1427))) (bvsge (mask!30044 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5940 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5940 thiss!1427) #b00000000000000000000000000000011) (bvslt (bvand (extraKeys!5940 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1032947 () Bool)

(assert (=> b!1032947 (= e!583755 tp_is_empty!24481)))

(assert (= (and start!90240 res!690283) b!1032941))

(assert (= (and b!1032941 res!690281) b!1032943))

(assert (= (and b!1032943 res!690282) b!1032946))

(assert (= (and b!1032942 condMapEmpty!38198) mapIsEmpty!38198))

(assert (= (and b!1032942 (not condMapEmpty!38198)) mapNonEmpty!38198))

(get-info :version)

(assert (= (and mapNonEmpty!38198 ((_ is ValueCellFull!11537) mapValue!38198)) b!1032947))

(assert (= (and b!1032942 ((_ is ValueCellFull!11537) mapDefault!38198)) b!1032944))

(assert (= b!1032945 b!1032942))

(assert (= start!90240 b!1032945))

(declare-fun m!952407 () Bool)

(assert (=> start!90240 m!952407))

(declare-fun m!952409 () Bool)

(assert (=> b!1032943 m!952409))

(declare-fun m!952411 () Bool)

(assert (=> b!1032945 m!952411))

(declare-fun m!952413 () Bool)

(assert (=> b!1032945 m!952413))

(declare-fun m!952415 () Bool)

(assert (=> mapNonEmpty!38198 m!952415))

(check-sat tp_is_empty!24481 (not b!1032945) (not b!1032943) (not b_next!20761) (not mapNonEmpty!38198) (not start!90240) b_and!33203)
(check-sat b_and!33203 (not b_next!20761))
