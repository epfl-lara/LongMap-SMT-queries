; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107604 () Bool)

(assert start!107604)

(declare-fun b!1273614 () Bool)

(declare-fun b_free!27739 () Bool)

(declare-fun b_next!27739 () Bool)

(assert (=> b!1273614 (= b_free!27739 (not b_next!27739))))

(declare-fun tp!97774 () Bool)

(declare-fun b_and!45777 () Bool)

(assert (=> b!1273614 (= tp!97774 b_and!45777)))

(declare-fun b!1273611 () Bool)

(declare-fun e!726708 () Bool)

(declare-fun tp_is_empty!33109 () Bool)

(assert (=> b!1273611 (= e!726708 tp_is_empty!33109)))

(declare-fun res!846906 () Bool)

(declare-fun e!726706 () Bool)

(assert (=> start!107604 (=> (not res!846906) (not e!726706))))

(declare-datatypes ((V!49339 0))(
  ( (V!49340 (val!16629 Int)) )
))
(declare-datatypes ((ValueCell!15701 0))(
  ( (ValueCellFull!15701 (v!19265 V!49339)) (EmptyCell!15701) )
))
(declare-datatypes ((array!83395 0))(
  ( (array!83396 (arr!40220 (Array (_ BitVec 32) ValueCell!15701)) (size!40767 (_ BitVec 32))) )
))
(declare-datatypes ((array!83397 0))(
  ( (array!83398 (arr!40221 (Array (_ BitVec 32) (_ BitVec 64))) (size!40768 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6166 0))(
  ( (LongMapFixedSize!6167 (defaultEntry!6729 Int) (mask!34514 (_ BitVec 32)) (extraKeys!6408 (_ BitVec 32)) (zeroValue!6514 V!49339) (minValue!6514 V!49339) (_size!3138 (_ BitVec 32)) (_keys!12139 array!83397) (_values!6752 array!83395) (_vacant!3138 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6166)

(declare-fun simpleValid!472 (LongMapFixedSize!6166) Bool)

(assert (=> start!107604 (= res!846906 (simpleValid!472 thiss!1551))))

(assert (=> start!107604 e!726706))

(declare-fun e!726707 () Bool)

(assert (=> start!107604 e!726707))

(declare-fun mapNonEmpty!51295 () Bool)

(declare-fun mapRes!51295 () Bool)

(declare-fun tp!97775 () Bool)

(assert (=> mapNonEmpty!51295 (= mapRes!51295 (and tp!97775 e!726708))))

(declare-fun mapValue!51295 () ValueCell!15701)

(declare-fun mapRest!51295 () (Array (_ BitVec 32) ValueCell!15701))

(declare-fun mapKey!51295 () (_ BitVec 32))

(assert (=> mapNonEmpty!51295 (= (arr!40220 (_values!6752 thiss!1551)) (store mapRest!51295 mapKey!51295 mapValue!51295))))

(declare-fun b!1273612 () Bool)

(assert (=> b!1273612 (= e!726706 false)))

(declare-fun lt!574962 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!83397 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273612 (= lt!574962 (arrayCountValidKeys!0 (_keys!12139 thiss!1551) #b00000000000000000000000000000000 (size!40768 (_keys!12139 thiss!1551))))))

(declare-fun b!1273613 () Bool)

(declare-fun e!726705 () Bool)

(assert (=> b!1273613 (= e!726705 tp_is_empty!33109)))

(declare-fun e!726710 () Bool)

(declare-fun array_inv!30733 (array!83397) Bool)

(declare-fun array_inv!30734 (array!83395) Bool)

(assert (=> b!1273614 (= e!726707 (and tp!97774 tp_is_empty!33109 (array_inv!30733 (_keys!12139 thiss!1551)) (array_inv!30734 (_values!6752 thiss!1551)) e!726710))))

(declare-fun mapIsEmpty!51295 () Bool)

(assert (=> mapIsEmpty!51295 mapRes!51295))

(declare-fun b!1273615 () Bool)

(assert (=> b!1273615 (= e!726710 (and e!726705 mapRes!51295))))

(declare-fun condMapEmpty!51295 () Bool)

(declare-fun mapDefault!51295 () ValueCell!15701)

(assert (=> b!1273615 (= condMapEmpty!51295 (= (arr!40220 (_values!6752 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15701)) mapDefault!51295)))))

(assert (= (and start!107604 res!846906) b!1273612))

(assert (= (and b!1273615 condMapEmpty!51295) mapIsEmpty!51295))

(assert (= (and b!1273615 (not condMapEmpty!51295)) mapNonEmpty!51295))

(get-info :version)

(assert (= (and mapNonEmpty!51295 ((_ is ValueCellFull!15701) mapValue!51295)) b!1273611))

(assert (= (and b!1273615 ((_ is ValueCellFull!15701) mapDefault!51295)) b!1273613))

(assert (= b!1273614 b!1273615))

(assert (= start!107604 b!1273614))

(declare-fun m!1170247 () Bool)

(assert (=> start!107604 m!1170247))

(declare-fun m!1170249 () Bool)

(assert (=> mapNonEmpty!51295 m!1170249))

(declare-fun m!1170251 () Bool)

(assert (=> b!1273612 m!1170251))

(declare-fun m!1170253 () Bool)

(assert (=> b!1273614 m!1170253))

(declare-fun m!1170255 () Bool)

(assert (=> b!1273614 m!1170255))

(check-sat (not b!1273612) tp_is_empty!33109 (not b!1273614) (not start!107604) (not mapNonEmpty!51295) b_and!45777 (not b_next!27739))
(check-sat b_and!45777 (not b_next!27739))
