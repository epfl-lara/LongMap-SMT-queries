; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4442 () Bool)

(assert start!4442)

(declare-fun b_free!1203 () Bool)

(declare-fun b_next!1203 () Bool)

(assert (=> start!4442 (= b_free!1203 (not b_next!1203))))

(declare-fun tp!5047 () Bool)

(declare-fun b_and!2025 () Bool)

(assert (=> start!4442 (= tp!5047 b_and!2025)))

(declare-fun mapNonEmpty!1882 () Bool)

(declare-fun mapRes!1882 () Bool)

(declare-fun tp!5046 () Bool)

(declare-fun e!21753 () Bool)

(assert (=> mapNonEmpty!1882 (= mapRes!1882 (and tp!5046 e!21753))))

(declare-datatypes ((V!1901 0))(
  ( (V!1902 (val!805 Int)) )
))
(declare-datatypes ((ValueCell!579 0))(
  ( (ValueCellFull!579 (v!1900 V!1901)) (EmptyCell!579) )
))
(declare-datatypes ((array!2331 0))(
  ( (array!2332 (arr!1113 (Array (_ BitVec 32) ValueCell!579)) (size!1214 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2331)

(declare-fun mapValue!1882 () ValueCell!579)

(declare-fun mapKey!1882 () (_ BitVec 32))

(declare-fun mapRest!1882 () (Array (_ BitVec 32) ValueCell!579))

(assert (=> mapNonEmpty!1882 (= (arr!1113 _values!1501) (store mapRest!1882 mapKey!1882 mapValue!1882))))

(declare-fun b!34261 () Bool)

(declare-fun e!21755 () Bool)

(declare-fun tp_is_empty!1557 () Bool)

(assert (=> b!34261 (= e!21755 tp_is_empty!1557)))

(declare-fun b!34262 () Bool)

(declare-fun res!20765 () Bool)

(declare-fun e!21757 () Bool)

(assert (=> b!34262 (=> (not res!20765) (not e!21757))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34262 (= res!20765 (validKeyInArray!0 k0!1304))))

(declare-fun b!34263 () Bool)

(declare-fun e!21752 () Bool)

(assert (=> b!34263 (= e!21757 e!21752)))

(declare-fun res!20769 () Bool)

(assert (=> b!34263 (=> (not res!20769) (not e!21752))))

(declare-datatypes ((tuple2!1310 0))(
  ( (tuple2!1311 (_1!666 (_ BitVec 64)) (_2!666 V!1901)) )
))
(declare-datatypes ((List!899 0))(
  ( (Nil!896) (Cons!895 (h!1462 tuple2!1310) (t!3604 List!899)) )
))
(declare-datatypes ((ListLongMap!887 0))(
  ( (ListLongMap!888 (toList!459 List!899)) )
))
(declare-fun lt!12747 () ListLongMap!887)

(declare-fun contains!405 (ListLongMap!887 (_ BitVec 64)) Bool)

(assert (=> b!34263 (= res!20769 (not (contains!405 lt!12747 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2333 0))(
  ( (array!2334 (arr!1114 (Array (_ BitVec 32) (_ BitVec 64))) (size!1215 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2333)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1901)

(declare-fun minValue!1443 () V!1901)

(declare-fun getCurrentListMap!283 (array!2333 array!2331 (_ BitVec 32) (_ BitVec 32) V!1901 V!1901 (_ BitVec 32) Int) ListLongMap!887)

(assert (=> b!34263 (= lt!12747 (getCurrentListMap!283 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!34264 () Bool)

(declare-fun res!20764 () Bool)

(assert (=> b!34264 (=> (not res!20764) (not e!21752))))

(declare-fun arrayContainsKey!0 (array!2333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34264 (= res!20764 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!20767 () Bool)

(assert (=> start!4442 (=> (not res!20767) (not e!21757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4442 (= res!20767 (validMask!0 mask!2294))))

(assert (=> start!4442 e!21757))

(assert (=> start!4442 true))

(assert (=> start!4442 tp!5047))

(declare-fun e!21754 () Bool)

(declare-fun array_inv!783 (array!2331) Bool)

(assert (=> start!4442 (and (array_inv!783 _values!1501) e!21754)))

(declare-fun array_inv!784 (array!2333) Bool)

(assert (=> start!4442 (array_inv!784 _keys!1833)))

(assert (=> start!4442 tp_is_empty!1557))

(declare-fun b!34265 () Bool)

(declare-fun res!20766 () Bool)

(assert (=> b!34265 (=> (not res!20766) (not e!21757))))

(declare-datatypes ((List!900 0))(
  ( (Nil!897) (Cons!896 (h!1463 (_ BitVec 64)) (t!3605 List!900)) )
))
(declare-fun arrayNoDuplicates!0 (array!2333 (_ BitVec 32) List!900) Bool)

(assert (=> b!34265 (= res!20766 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!897))))

(declare-fun b!34266 () Bool)

(assert (=> b!34266 (= e!21753 tp_is_empty!1557)))

(declare-fun b!34267 () Bool)

(assert (=> b!34267 (= e!21752 (not true))))

(declare-fun lt!12746 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2333 (_ BitVec 32)) Bool)

(assert (=> b!34267 (arrayForallSeekEntryOrOpenFound!0 lt!12746 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!775 0))(
  ( (Unit!776) )
))
(declare-fun lt!12742 () Unit!775)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!2333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!775)

(assert (=> b!34267 (= lt!12742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12746))))

(declare-datatypes ((SeekEntryResult!139 0))(
  ( (MissingZero!139 (index!2678 (_ BitVec 32))) (Found!139 (index!2679 (_ BitVec 32))) (Intermediate!139 (undefined!951 Bool) (index!2680 (_ BitVec 32)) (x!6893 (_ BitVec 32))) (Undefined!139) (MissingVacant!139 (index!2681 (_ BitVec 32))) )
))
(declare-fun lt!12744 () SeekEntryResult!139)

(get-info :version)

(assert (=> b!34267 (and ((_ is Found!139) lt!12744) (= (index!2679 lt!12744) lt!12746))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2333 (_ BitVec 32)) SeekEntryResult!139)

(assert (=> b!34267 (= lt!12744 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12745 () Unit!775)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2333 (_ BitVec 32)) Unit!775)

(assert (=> b!34267 (= lt!12745 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12746 _keys!1833 mask!2294))))

(assert (=> b!34267 (contains!405 lt!12747 (select (arr!1114 _keys!1833) lt!12746))))

(declare-fun lt!12743 () Unit!775)

(declare-fun lemmaValidKeyInArrayIsInListMap!71 (array!2333 array!2331 (_ BitVec 32) (_ BitVec 32) V!1901 V!1901 (_ BitVec 32) Int) Unit!775)

(assert (=> b!34267 (= lt!12743 (lemmaValidKeyInArrayIsInListMap!71 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12746 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2333 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!34267 (= lt!12746 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!34268 () Bool)

(assert (=> b!34268 (= e!21754 (and e!21755 mapRes!1882))))

(declare-fun condMapEmpty!1882 () Bool)

(declare-fun mapDefault!1882 () ValueCell!579)

(assert (=> b!34268 (= condMapEmpty!1882 (= (arr!1113 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!579)) mapDefault!1882)))))

(declare-fun mapIsEmpty!1882 () Bool)

(assert (=> mapIsEmpty!1882 mapRes!1882))

(declare-fun b!34269 () Bool)

(declare-fun res!20763 () Bool)

(assert (=> b!34269 (=> (not res!20763) (not e!21757))))

(assert (=> b!34269 (= res!20763 (and (= (size!1214 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1215 _keys!1833) (size!1214 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34270 () Bool)

(declare-fun res!20768 () Bool)

(assert (=> b!34270 (=> (not res!20768) (not e!21757))))

(assert (=> b!34270 (= res!20768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!4442 res!20767) b!34269))

(assert (= (and b!34269 res!20763) b!34270))

(assert (= (and b!34270 res!20768) b!34265))

(assert (= (and b!34265 res!20766) b!34262))

(assert (= (and b!34262 res!20765) b!34263))

(assert (= (and b!34263 res!20769) b!34264))

(assert (= (and b!34264 res!20764) b!34267))

(assert (= (and b!34268 condMapEmpty!1882) mapIsEmpty!1882))

(assert (= (and b!34268 (not condMapEmpty!1882)) mapNonEmpty!1882))

(assert (= (and mapNonEmpty!1882 ((_ is ValueCellFull!579) mapValue!1882)) b!34266))

(assert (= (and b!34268 ((_ is ValueCellFull!579) mapDefault!1882)) b!34261))

(assert (= start!4442 b!34268))

(declare-fun m!27609 () Bool)

(assert (=> mapNonEmpty!1882 m!27609))

(declare-fun m!27611 () Bool)

(assert (=> b!34262 m!27611))

(declare-fun m!27613 () Bool)

(assert (=> b!34264 m!27613))

(declare-fun m!27615 () Bool)

(assert (=> b!34263 m!27615))

(declare-fun m!27617 () Bool)

(assert (=> b!34263 m!27617))

(declare-fun m!27619 () Bool)

(assert (=> b!34270 m!27619))

(declare-fun m!27621 () Bool)

(assert (=> b!34267 m!27621))

(declare-fun m!27623 () Bool)

(assert (=> b!34267 m!27623))

(declare-fun m!27625 () Bool)

(assert (=> b!34267 m!27625))

(declare-fun m!27627 () Bool)

(assert (=> b!34267 m!27627))

(declare-fun m!27629 () Bool)

(assert (=> b!34267 m!27629))

(declare-fun m!27631 () Bool)

(assert (=> b!34267 m!27631))

(assert (=> b!34267 m!27621))

(declare-fun m!27633 () Bool)

(assert (=> b!34267 m!27633))

(declare-fun m!27635 () Bool)

(assert (=> b!34267 m!27635))

(declare-fun m!27637 () Bool)

(assert (=> start!4442 m!27637))

(declare-fun m!27639 () Bool)

(assert (=> start!4442 m!27639))

(declare-fun m!27641 () Bool)

(assert (=> start!4442 m!27641))

(declare-fun m!27643 () Bool)

(assert (=> b!34265 m!27643))

(check-sat b_and!2025 tp_is_empty!1557 (not b!34270) (not b!34262) (not b_next!1203) (not b!34263) (not start!4442) (not b!34267) (not b!34264) (not b!34265) (not mapNonEmpty!1882))
(check-sat b_and!2025 (not b_next!1203))
