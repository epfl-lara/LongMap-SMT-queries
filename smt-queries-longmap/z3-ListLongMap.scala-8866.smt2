; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107828 () Bool)

(assert start!107828)

(declare-fun b!1274984 () Bool)

(declare-fun b_free!27739 () Bool)

(declare-fun b_next!27739 () Bool)

(assert (=> b!1274984 (= b_free!27739 (not b_next!27739))))

(declare-fun tp!97774 () Bool)

(declare-fun b_and!45797 () Bool)

(assert (=> b!1274984 (= tp!97774 b_and!45797)))

(declare-fun b!1274980 () Bool)

(declare-fun e!727586 () Bool)

(assert (=> b!1274980 (= e!727586 false)))

(declare-fun lt!575624 () (_ BitVec 32))

(declare-datatypes ((V!49339 0))(
  ( (V!49340 (val!16629 Int)) )
))
(declare-datatypes ((ValueCell!15701 0))(
  ( (ValueCellFull!15701 (v!19261 V!49339)) (EmptyCell!15701) )
))
(declare-datatypes ((array!83513 0))(
  ( (array!83514 (arr!40274 (Array (_ BitVec 32) ValueCell!15701)) (size!40820 (_ BitVec 32))) )
))
(declare-datatypes ((array!83515 0))(
  ( (array!83516 (arr!40275 (Array (_ BitVec 32) (_ BitVec 64))) (size!40821 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6166 0))(
  ( (LongMapFixedSize!6167 (defaultEntry!6729 Int) (mask!34579 (_ BitVec 32)) (extraKeys!6408 (_ BitVec 32)) (zeroValue!6514 V!49339) (minValue!6514 V!49339) (_size!3138 (_ BitVec 32)) (_keys!12181 array!83515) (_values!6752 array!83513) (_vacant!3138 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6166)

(declare-fun arrayCountValidKeys!0 (array!83515 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274980 (= lt!575624 (arrayCountValidKeys!0 (_keys!12181 thiss!1551) #b00000000000000000000000000000000 (size!40821 (_keys!12181 thiss!1551))))))

(declare-fun b!1274981 () Bool)

(declare-fun e!727581 () Bool)

(declare-fun e!727583 () Bool)

(declare-fun mapRes!51295 () Bool)

(assert (=> b!1274981 (= e!727581 (and e!727583 mapRes!51295))))

(declare-fun condMapEmpty!51295 () Bool)

(declare-fun mapDefault!51295 () ValueCell!15701)

(assert (=> b!1274981 (= condMapEmpty!51295 (= (arr!40274 (_values!6752 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15701)) mapDefault!51295)))))

(declare-fun b!1274982 () Bool)

(declare-fun tp_is_empty!33109 () Bool)

(assert (=> b!1274982 (= e!727583 tp_is_empty!33109)))

(declare-fun res!847453 () Bool)

(assert (=> start!107828 (=> (not res!847453) (not e!727586))))

(declare-fun simpleValid!472 (LongMapFixedSize!6166) Bool)

(assert (=> start!107828 (= res!847453 (simpleValid!472 thiss!1551))))

(assert (=> start!107828 e!727586))

(declare-fun e!727585 () Bool)

(assert (=> start!107828 e!727585))

(declare-fun mapNonEmpty!51295 () Bool)

(declare-fun tp!97773 () Bool)

(declare-fun e!727584 () Bool)

(assert (=> mapNonEmpty!51295 (= mapRes!51295 (and tp!97773 e!727584))))

(declare-fun mapRest!51295 () (Array (_ BitVec 32) ValueCell!15701))

(declare-fun mapValue!51295 () ValueCell!15701)

(declare-fun mapKey!51295 () (_ BitVec 32))

(assert (=> mapNonEmpty!51295 (= (arr!40274 (_values!6752 thiss!1551)) (store mapRest!51295 mapKey!51295 mapValue!51295))))

(declare-fun b!1274983 () Bool)

(assert (=> b!1274983 (= e!727584 tp_is_empty!33109)))

(declare-fun array_inv!30797 (array!83515) Bool)

(declare-fun array_inv!30798 (array!83513) Bool)

(assert (=> b!1274984 (= e!727585 (and tp!97774 tp_is_empty!33109 (array_inv!30797 (_keys!12181 thiss!1551)) (array_inv!30798 (_values!6752 thiss!1551)) e!727581))))

(declare-fun mapIsEmpty!51295 () Bool)

(assert (=> mapIsEmpty!51295 mapRes!51295))

(assert (= (and start!107828 res!847453) b!1274980))

(assert (= (and b!1274981 condMapEmpty!51295) mapIsEmpty!51295))

(assert (= (and b!1274981 (not condMapEmpty!51295)) mapNonEmpty!51295))

(get-info :version)

(assert (= (and mapNonEmpty!51295 ((_ is ValueCellFull!15701) mapValue!51295)) b!1274983))

(assert (= (and b!1274981 ((_ is ValueCellFull!15701) mapDefault!51295)) b!1274982))

(assert (= b!1274984 b!1274981))

(assert (= start!107828 b!1274984))

(declare-fun m!1172359 () Bool)

(assert (=> b!1274980 m!1172359))

(declare-fun m!1172361 () Bool)

(assert (=> start!107828 m!1172361))

(declare-fun m!1172363 () Bool)

(assert (=> mapNonEmpty!51295 m!1172363))

(declare-fun m!1172365 () Bool)

(assert (=> b!1274984 m!1172365))

(declare-fun m!1172367 () Bool)

(assert (=> b!1274984 m!1172367))

(check-sat (not b_next!27739) (not b!1274980) (not start!107828) b_and!45797 tp_is_empty!33109 (not b!1274984) (not mapNonEmpty!51295))
(check-sat b_and!45797 (not b_next!27739))
