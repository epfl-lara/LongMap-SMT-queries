; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90482 () Bool)

(assert start!90482)

(declare-fun b!1034471 () Bool)

(declare-fun b_free!20767 () Bool)

(declare-fun b_next!20767 () Bool)

(assert (=> b!1034471 (= b_free!20767 (not b_next!20767))))

(declare-fun tp!73394 () Bool)

(declare-fun b_and!33245 () Bool)

(assert (=> b!1034471 (= tp!73394 b_and!33245)))

(declare-fun b!1034470 () Bool)

(declare-fun res!690886 () Bool)

(declare-fun e!584741 () Bool)

(assert (=> b!1034470 (=> (not res!690886) (not e!584741))))

(declare-datatypes ((V!37523 0))(
  ( (V!37524 (val!12294 Int)) )
))
(declare-datatypes ((ValueCell!11540 0))(
  ( (ValueCellFull!11540 (v!14867 V!37523)) (EmptyCell!11540) )
))
(declare-datatypes ((array!65099 0))(
  ( (array!65100 (arr!31339 (Array (_ BitVec 32) (_ BitVec 64))) (size!31862 (_ BitVec 32))) )
))
(declare-datatypes ((array!65101 0))(
  ( (array!65102 (arr!31340 (Array (_ BitVec 32) ValueCell!11540)) (size!31863 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5674 0))(
  ( (LongMapFixedSize!5675 (defaultEntry!6211 Int) (mask!30114 (_ BitVec 32)) (extraKeys!5943 (_ BitVec 32)) (zeroValue!6047 V!37523) (minValue!6047 V!37523) (_size!2892 (_ BitVec 32)) (_keys!11427 array!65099) (_values!6234 array!65101) (_vacant!2892 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5674)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034470 (= res!690886 (validMask!0 (mask!30114 thiss!1427)))))

(declare-fun e!584742 () Bool)

(declare-fun e!584746 () Bool)

(declare-fun tp_is_empty!24487 () Bool)

(declare-fun array_inv!24261 (array!65099) Bool)

(declare-fun array_inv!24262 (array!65101) Bool)

(assert (=> b!1034471 (= e!584746 (and tp!73394 tp_is_empty!24487 (array_inv!24261 (_keys!11427 thiss!1427)) (array_inv!24262 (_values!6234 thiss!1427)) e!584742))))

(declare-fun b!1034472 () Bool)

(assert (=> b!1034472 (= e!584741 (and (= (size!31863 (_values!6234 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30114 thiss!1427))) (= (size!31862 (_keys!11427 thiss!1427)) (size!31863 (_values!6234 thiss!1427))) (bvsge (mask!30114 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5943 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5943 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5943 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt (bvand (extraKeys!5943 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011)))))

(declare-fun b!1034473 () Bool)

(declare-fun e!584744 () Bool)

(assert (=> b!1034473 (= e!584744 tp_is_empty!24487)))

(declare-fun res!690887 () Bool)

(assert (=> start!90482 (=> (not res!690887) (not e!584741))))

(declare-fun valid!2151 (LongMapFixedSize!5674) Bool)

(assert (=> start!90482 (= res!690887 (valid!2151 thiss!1427))))

(assert (=> start!90482 e!584741))

(assert (=> start!90482 e!584746))

(assert (=> start!90482 true))

(declare-fun b!1034474 () Bool)

(declare-fun mapRes!38207 () Bool)

(assert (=> b!1034474 (= e!584742 (and e!584744 mapRes!38207))))

(declare-fun condMapEmpty!38207 () Bool)

(declare-fun mapDefault!38207 () ValueCell!11540)

(assert (=> b!1034474 (= condMapEmpty!38207 (= (arr!31340 (_values!6234 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11540)) mapDefault!38207)))))

(declare-fun b!1034475 () Bool)

(declare-fun e!584743 () Bool)

(assert (=> b!1034475 (= e!584743 tp_is_empty!24487)))

(declare-fun b!1034476 () Bool)

(declare-fun res!690885 () Bool)

(assert (=> b!1034476 (=> (not res!690885) (not e!584741))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034476 (= res!690885 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38207 () Bool)

(declare-fun tp!73395 () Bool)

(assert (=> mapNonEmpty!38207 (= mapRes!38207 (and tp!73395 e!584743))))

(declare-fun mapRest!38207 () (Array (_ BitVec 32) ValueCell!11540))

(declare-fun mapKey!38207 () (_ BitVec 32))

(declare-fun mapValue!38207 () ValueCell!11540)

(assert (=> mapNonEmpty!38207 (= (arr!31340 (_values!6234 thiss!1427)) (store mapRest!38207 mapKey!38207 mapValue!38207))))

(declare-fun mapIsEmpty!38207 () Bool)

(assert (=> mapIsEmpty!38207 mapRes!38207))

(assert (= (and start!90482 res!690887) b!1034476))

(assert (= (and b!1034476 res!690885) b!1034470))

(assert (= (and b!1034470 res!690886) b!1034472))

(assert (= (and b!1034474 condMapEmpty!38207) mapIsEmpty!38207))

(assert (= (and b!1034474 (not condMapEmpty!38207)) mapNonEmpty!38207))

(get-info :version)

(assert (= (and mapNonEmpty!38207 ((_ is ValueCellFull!11540) mapValue!38207)) b!1034475))

(assert (= (and b!1034474 ((_ is ValueCellFull!11540) mapDefault!38207)) b!1034473))

(assert (= b!1034471 b!1034474))

(assert (= start!90482 b!1034471))

(declare-fun m!954721 () Bool)

(assert (=> b!1034470 m!954721))

(declare-fun m!954723 () Bool)

(assert (=> b!1034471 m!954723))

(declare-fun m!954725 () Bool)

(assert (=> b!1034471 m!954725))

(declare-fun m!954727 () Bool)

(assert (=> start!90482 m!954727))

(declare-fun m!954729 () Bool)

(assert (=> mapNonEmpty!38207 m!954729))

(check-sat (not start!90482) b_and!33245 (not b_next!20767) (not b!1034471) tp_is_empty!24487 (not mapNonEmpty!38207) (not b!1034470))
(check-sat b_and!33245 (not b_next!20767))
