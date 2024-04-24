; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90476 () Bool)

(assert start!90476)

(declare-fun b!1034407 () Bool)

(declare-fun b_free!20761 () Bool)

(declare-fun b_next!20761 () Bool)

(assert (=> b!1034407 (= b_free!20761 (not b_next!20761))))

(declare-fun tp!73377 () Bool)

(declare-fun b_and!33239 () Bool)

(assert (=> b!1034407 (= tp!73377 b_and!33239)))

(declare-fun e!584687 () Bool)

(declare-datatypes ((V!37515 0))(
  ( (V!37516 (val!12291 Int)) )
))
(declare-datatypes ((ValueCell!11537 0))(
  ( (ValueCellFull!11537 (v!14864 V!37515)) (EmptyCell!11537) )
))
(declare-datatypes ((array!65087 0))(
  ( (array!65088 (arr!31333 (Array (_ BitVec 32) (_ BitVec 64))) (size!31856 (_ BitVec 32))) )
))
(declare-datatypes ((array!65089 0))(
  ( (array!65090 (arr!31334 (Array (_ BitVec 32) ValueCell!11537)) (size!31857 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5668 0))(
  ( (LongMapFixedSize!5669 (defaultEntry!6208 Int) (mask!30109 (_ BitVec 32)) (extraKeys!5940 (_ BitVec 32)) (zeroValue!6044 V!37515) (minValue!6044 V!37515) (_size!2889 (_ BitVec 32)) (_keys!11424 array!65087) (_values!6231 array!65089) (_vacant!2889 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5668)

(declare-fun tp_is_empty!24481 () Bool)

(declare-fun e!584690 () Bool)

(declare-fun array_inv!24255 (array!65087) Bool)

(declare-fun array_inv!24256 (array!65089) Bool)

(assert (=> b!1034407 (= e!584687 (and tp!73377 tp_is_empty!24481 (array_inv!24255 (_keys!11424 thiss!1427)) (array_inv!24256 (_values!6231 thiss!1427)) e!584690))))

(declare-fun mapNonEmpty!38198 () Bool)

(declare-fun mapRes!38198 () Bool)

(declare-fun tp!73376 () Bool)

(declare-fun e!584692 () Bool)

(assert (=> mapNonEmpty!38198 (= mapRes!38198 (and tp!73376 e!584692))))

(declare-fun mapRest!38198 () (Array (_ BitVec 32) ValueCell!11537))

(declare-fun mapKey!38198 () (_ BitVec 32))

(declare-fun mapValue!38198 () ValueCell!11537)

(assert (=> mapNonEmpty!38198 (= (arr!31334 (_values!6231 thiss!1427)) (store mapRest!38198 mapKey!38198 mapValue!38198))))

(declare-fun b!1034408 () Bool)

(declare-fun res!690859 () Bool)

(declare-fun e!584688 () Bool)

(assert (=> b!1034408 (=> (not res!690859) (not e!584688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034408 (= res!690859 (validMask!0 (mask!30109 thiss!1427)))))

(declare-fun b!1034409 () Bool)

(declare-fun res!690860 () Bool)

(assert (=> b!1034409 (=> (not res!690860) (not e!584688))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034409 (= res!690860 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38198 () Bool)

(assert (=> mapIsEmpty!38198 mapRes!38198))

(declare-fun b!1034410 () Bool)

(declare-fun e!584691 () Bool)

(assert (=> b!1034410 (= e!584691 tp_is_empty!24481)))

(declare-fun b!1034411 () Bool)

(assert (=> b!1034411 (= e!584688 (and (= (size!31857 (_values!6231 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30109 thiss!1427))) (= (size!31856 (_keys!11424 thiss!1427)) (size!31857 (_values!6231 thiss!1427))) (bvsge (mask!30109 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5940 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5940 thiss!1427) #b00000000000000000000000000000011) (bvslt (bvand (extraKeys!5940 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!690858 () Bool)

(assert (=> start!90476 (=> (not res!690858) (not e!584688))))

(declare-fun valid!2149 (LongMapFixedSize!5668) Bool)

(assert (=> start!90476 (= res!690858 (valid!2149 thiss!1427))))

(assert (=> start!90476 e!584688))

(assert (=> start!90476 e!584687))

(assert (=> start!90476 true))

(declare-fun b!1034412 () Bool)

(assert (=> b!1034412 (= e!584692 tp_is_empty!24481)))

(declare-fun b!1034413 () Bool)

(assert (=> b!1034413 (= e!584690 (and e!584691 mapRes!38198))))

(declare-fun condMapEmpty!38198 () Bool)

(declare-fun mapDefault!38198 () ValueCell!11537)

(assert (=> b!1034413 (= condMapEmpty!38198 (= (arr!31334 (_values!6231 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11537)) mapDefault!38198)))))

(assert (= (and start!90476 res!690858) b!1034409))

(assert (= (and b!1034409 res!690860) b!1034408))

(assert (= (and b!1034408 res!690859) b!1034411))

(assert (= (and b!1034413 condMapEmpty!38198) mapIsEmpty!38198))

(assert (= (and b!1034413 (not condMapEmpty!38198)) mapNonEmpty!38198))

(get-info :version)

(assert (= (and mapNonEmpty!38198 ((_ is ValueCellFull!11537) mapValue!38198)) b!1034412))

(assert (= (and b!1034413 ((_ is ValueCellFull!11537) mapDefault!38198)) b!1034410))

(assert (= b!1034407 b!1034413))

(assert (= start!90476 b!1034407))

(declare-fun m!954691 () Bool)

(assert (=> b!1034407 m!954691))

(declare-fun m!954693 () Bool)

(assert (=> b!1034407 m!954693))

(declare-fun m!954695 () Bool)

(assert (=> mapNonEmpty!38198 m!954695))

(declare-fun m!954697 () Bool)

(assert (=> b!1034408 m!954697))

(declare-fun m!954699 () Bool)

(assert (=> start!90476 m!954699))

(check-sat (not b!1034407) (not start!90476) (not b_next!20761) b_and!33239 (not b!1034408) (not mapNonEmpty!38198) tp_is_empty!24481)
(check-sat b_and!33239 (not b_next!20761))
