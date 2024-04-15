; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90258 () Bool)

(assert start!90258)

(declare-fun b!1033131 () Bool)

(declare-fun b_free!20779 () Bool)

(declare-fun b_next!20779 () Bool)

(assert (=> b!1033131 (= b_free!20779 (not b_next!20779))))

(declare-fun tp!73430 () Bool)

(declare-fun b_and!33221 () Bool)

(assert (=> b!1033131 (= tp!73430 b_and!33221)))

(declare-fun b!1033130 () Bool)

(declare-fun e!583920 () Bool)

(declare-fun e!583918 () Bool)

(declare-fun mapRes!38225 () Bool)

(assert (=> b!1033130 (= e!583920 (and e!583918 mapRes!38225))))

(declare-fun condMapEmpty!38225 () Bool)

(declare-datatypes ((V!37539 0))(
  ( (V!37540 (val!12300 Int)) )
))
(declare-datatypes ((ValueCell!11546 0))(
  ( (ValueCellFull!11546 (v!14876 V!37539)) (EmptyCell!11546) )
))
(declare-datatypes ((array!65013 0))(
  ( (array!65014 (arr!31302 (Array (_ BitVec 32) (_ BitVec 64))) (size!31826 (_ BitVec 32))) )
))
(declare-datatypes ((array!65015 0))(
  ( (array!65016 (arr!31303 (Array (_ BitVec 32) ValueCell!11546)) (size!31827 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5686 0))(
  ( (LongMapFixedSize!5687 (defaultEntry!6217 Int) (mask!30059 (_ BitVec 32)) (extraKeys!5949 (_ BitVec 32)) (zeroValue!6053 V!37539) (minValue!6053 V!37539) (_size!2898 (_ BitVec 32)) (_keys!11391 array!65013) (_values!6240 array!65015) (_vacant!2898 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5686)

(declare-fun mapDefault!38225 () ValueCell!11546)

(assert (=> b!1033130 (= condMapEmpty!38225 (= (arr!31303 (_values!6240 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11546)) mapDefault!38225)))))

(declare-fun mapNonEmpty!38225 () Bool)

(declare-fun tp!73431 () Bool)

(declare-fun e!583917 () Bool)

(assert (=> mapNonEmpty!38225 (= mapRes!38225 (and tp!73431 e!583917))))

(declare-fun mapRest!38225 () (Array (_ BitVec 32) ValueCell!11546))

(declare-fun mapValue!38225 () ValueCell!11546)

(declare-fun mapKey!38225 () (_ BitVec 32))

(assert (=> mapNonEmpty!38225 (= (arr!31303 (_values!6240 thiss!1427)) (store mapRest!38225 mapKey!38225 mapValue!38225))))

(declare-fun e!583916 () Bool)

(declare-fun tp_is_empty!24499 () Bool)

(declare-fun array_inv!24219 (array!65013) Bool)

(declare-fun array_inv!24220 (array!65015) Bool)

(assert (=> b!1033131 (= e!583916 (and tp!73430 tp_is_empty!24499 (array_inv!24219 (_keys!11391 thiss!1427)) (array_inv!24220 (_values!6240 thiss!1427)) e!583920))))

(declare-fun b!1033132 () Bool)

(declare-fun e!583919 () Bool)

(assert (=> b!1033132 (= e!583919 (and (= (size!31827 (_values!6240 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30059 thiss!1427))) (= (size!31826 (_keys!11391 thiss!1427)) (size!31827 (_values!6240 thiss!1427))) (bvsge (mask!30059 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5949 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5949 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (not (= (bvand (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1033133 () Bool)

(assert (=> b!1033133 (= e!583917 tp_is_empty!24499)))

(declare-fun b!1033134 () Bool)

(assert (=> b!1033134 (= e!583918 tp_is_empty!24499)))

(declare-fun b!1033135 () Bool)

(declare-fun res!690363 () Bool)

(assert (=> b!1033135 (=> (not res!690363) (not e!583919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033135 (= res!690363 (validMask!0 (mask!30059 thiss!1427)))))

(declare-fun b!1033136 () Bool)

(declare-fun res!690364 () Bool)

(assert (=> b!1033136 (=> (not res!690364) (not e!583919))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033136 (= res!690364 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!690362 () Bool)

(assert (=> start!90258 (=> (not res!690362) (not e!583919))))

(declare-fun valid!2138 (LongMapFixedSize!5686) Bool)

(assert (=> start!90258 (= res!690362 (valid!2138 thiss!1427))))

(assert (=> start!90258 e!583919))

(assert (=> start!90258 e!583916))

(assert (=> start!90258 true))

(declare-fun mapIsEmpty!38225 () Bool)

(assert (=> mapIsEmpty!38225 mapRes!38225))

(assert (= (and start!90258 res!690362) b!1033136))

(assert (= (and b!1033136 res!690364) b!1033135))

(assert (= (and b!1033135 res!690363) b!1033132))

(assert (= (and b!1033130 condMapEmpty!38225) mapIsEmpty!38225))

(assert (= (and b!1033130 (not condMapEmpty!38225)) mapNonEmpty!38225))

(get-info :version)

(assert (= (and mapNonEmpty!38225 ((_ is ValueCellFull!11546) mapValue!38225)) b!1033133))

(assert (= (and b!1033130 ((_ is ValueCellFull!11546) mapDefault!38225)) b!1033134))

(assert (= b!1033131 b!1033130))

(assert (= start!90258 b!1033131))

(declare-fun m!952497 () Bool)

(assert (=> mapNonEmpty!38225 m!952497))

(declare-fun m!952499 () Bool)

(assert (=> b!1033131 m!952499))

(declare-fun m!952501 () Bool)

(assert (=> b!1033131 m!952501))

(declare-fun m!952503 () Bool)

(assert (=> b!1033135 m!952503))

(declare-fun m!952505 () Bool)

(assert (=> start!90258 m!952505))

(check-sat (not start!90258) b_and!33221 (not b_next!20779) (not b!1033135) (not mapNonEmpty!38225) tp_is_empty!24499 (not b!1033131))
(check-sat b_and!33221 (not b_next!20779))
