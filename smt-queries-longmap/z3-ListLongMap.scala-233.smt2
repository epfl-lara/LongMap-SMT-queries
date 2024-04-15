; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4070 () Bool)

(assert start!4070)

(declare-fun b_free!985 () Bool)

(declare-fun b_next!985 () Bool)

(assert (=> start!4070 (= b_free!985 (not b_next!985))))

(declare-fun tp!4374 () Bool)

(declare-fun b_and!1789 () Bool)

(assert (=> start!4070 (= tp!4374 b_and!1789)))

(declare-fun b!30112 () Bool)

(declare-fun e!19354 () Bool)

(declare-fun tp_is_empty!1339 () Bool)

(assert (=> b!30112 (= e!19354 tp_is_empty!1339)))

(declare-fun mapNonEmpty!1537 () Bool)

(declare-fun mapRes!1537 () Bool)

(declare-fun tp!4375 () Bool)

(assert (=> mapNonEmpty!1537 (= mapRes!1537 (and tp!4375 e!19354))))

(declare-datatypes ((V!1611 0))(
  ( (V!1612 (val!696 Int)) )
))
(declare-datatypes ((ValueCell!470 0))(
  ( (ValueCellFull!470 (v!1784 V!1611)) (EmptyCell!470) )
))
(declare-datatypes ((array!1879 0))(
  ( (array!1880 (arr!893 (Array (_ BitVec 32) ValueCell!470)) (size!994 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1879)

(declare-fun mapKey!1537 () (_ BitVec 32))

(declare-fun mapValue!1537 () ValueCell!470)

(declare-fun mapRest!1537 () (Array (_ BitVec 32) ValueCell!470))

(assert (=> mapNonEmpty!1537 (= (arr!893 _values!1501) (store mapRest!1537 mapKey!1537 mapValue!1537))))

(declare-fun b!30113 () Bool)

(declare-fun e!19353 () Bool)

(assert (=> b!30113 (= e!19353 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((array!1881 0))(
  ( (array!1882 (arr!894 (Array (_ BitVec 32) (_ BitVec 64))) (size!995 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1881)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!101 0))(
  ( (MissingZero!101 (index!2526 (_ BitVec 32))) (Found!101 (index!2527 (_ BitVec 32))) (Intermediate!101 (undefined!913 Bool) (index!2528 (_ BitVec 32)) (x!6507 (_ BitVec 32))) (Undefined!101) (MissingVacant!101 (index!2529 (_ BitVec 32))) )
))
(declare-fun lt!11389 () SeekEntryResult!101)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1881 (_ BitVec 32)) SeekEntryResult!101)

(assert (=> b!30113 (= lt!11389 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30114 () Bool)

(declare-fun e!19355 () Bool)

(assert (=> b!30114 (= e!19355 tp_is_empty!1339)))

(declare-fun mapIsEmpty!1537 () Bool)

(assert (=> mapIsEmpty!1537 mapRes!1537))

(declare-fun b!30115 () Bool)

(declare-fun res!18120 () Bool)

(assert (=> b!30115 (=> (not res!18120) (not e!19353))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30115 (= res!18120 (and (= (size!994 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!995 _keys!1833) (size!994 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30116 () Bool)

(declare-fun e!19356 () Bool)

(assert (=> b!30116 (= e!19356 (and e!19355 mapRes!1537))))

(declare-fun condMapEmpty!1537 () Bool)

(declare-fun mapDefault!1537 () ValueCell!470)

(assert (=> b!30116 (= condMapEmpty!1537 (= (arr!893 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!470)) mapDefault!1537)))))

(declare-fun res!18119 () Bool)

(assert (=> start!4070 (=> (not res!18119) (not e!19353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4070 (= res!18119 (validMask!0 mask!2294))))

(assert (=> start!4070 e!19353))

(assert (=> start!4070 true))

(assert (=> start!4070 tp!4374))

(declare-fun array_inv!625 (array!1879) Bool)

(assert (=> start!4070 (and (array_inv!625 _values!1501) e!19356)))

(declare-fun array_inv!626 (array!1881) Bool)

(assert (=> start!4070 (array_inv!626 _keys!1833)))

(assert (=> start!4070 tp_is_empty!1339))

(declare-fun b!30111 () Bool)

(declare-fun res!18122 () Bool)

(assert (=> b!30111 (=> (not res!18122) (not e!19353))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1611)

(declare-fun minValue!1443 () V!1611)

(declare-datatypes ((tuple2!1154 0))(
  ( (tuple2!1155 (_1!588 (_ BitVec 64)) (_2!588 V!1611)) )
))
(declare-datatypes ((List!738 0))(
  ( (Nil!735) (Cons!734 (h!1301 tuple2!1154) (t!3424 List!738)) )
))
(declare-datatypes ((ListLongMap!719 0))(
  ( (ListLongMap!720 (toList!375 List!738)) )
))
(declare-fun contains!316 (ListLongMap!719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!199 (array!1881 array!1879 (_ BitVec 32) (_ BitVec 32) V!1611 V!1611 (_ BitVec 32) Int) ListLongMap!719)

(assert (=> b!30111 (= res!18122 (not (contains!316 (getCurrentListMap!199 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30117 () Bool)

(declare-fun res!18121 () Bool)

(assert (=> b!30117 (=> (not res!18121) (not e!19353))))

(declare-fun arrayContainsKey!0 (array!1881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30117 (= res!18121 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30118 () Bool)

(declare-fun res!18124 () Bool)

(assert (=> b!30118 (=> (not res!18124) (not e!19353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1881 (_ BitVec 32)) Bool)

(assert (=> b!30118 (= res!18124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30119 () Bool)

(declare-fun res!18123 () Bool)

(assert (=> b!30119 (=> (not res!18123) (not e!19353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30119 (= res!18123 (validKeyInArray!0 k0!1304))))

(declare-fun b!30120 () Bool)

(declare-fun res!18118 () Bool)

(assert (=> b!30120 (=> (not res!18118) (not e!19353))))

(declare-datatypes ((List!739 0))(
  ( (Nil!736) (Cons!735 (h!1302 (_ BitVec 64)) (t!3425 List!739)) )
))
(declare-fun arrayNoDuplicates!0 (array!1881 (_ BitVec 32) List!739) Bool)

(assert (=> b!30120 (= res!18118 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!736))))

(assert (= (and start!4070 res!18119) b!30115))

(assert (= (and b!30115 res!18120) b!30118))

(assert (= (and b!30118 res!18124) b!30120))

(assert (= (and b!30120 res!18118) b!30119))

(assert (= (and b!30119 res!18123) b!30111))

(assert (= (and b!30111 res!18122) b!30117))

(assert (= (and b!30117 res!18121) b!30113))

(assert (= (and b!30116 condMapEmpty!1537) mapIsEmpty!1537))

(assert (= (and b!30116 (not condMapEmpty!1537)) mapNonEmpty!1537))

(get-info :version)

(assert (= (and mapNonEmpty!1537 ((_ is ValueCellFull!470) mapValue!1537)) b!30112))

(assert (= (and b!30116 ((_ is ValueCellFull!470) mapDefault!1537)) b!30114))

(assert (= start!4070 b!30116))

(declare-fun m!24183 () Bool)

(assert (=> b!30119 m!24183))

(declare-fun m!24185 () Bool)

(assert (=> b!30118 m!24185))

(declare-fun m!24187 () Bool)

(assert (=> b!30113 m!24187))

(declare-fun m!24189 () Bool)

(assert (=> mapNonEmpty!1537 m!24189))

(declare-fun m!24191 () Bool)

(assert (=> b!30117 m!24191))

(declare-fun m!24193 () Bool)

(assert (=> b!30111 m!24193))

(assert (=> b!30111 m!24193))

(declare-fun m!24195 () Bool)

(assert (=> b!30111 m!24195))

(declare-fun m!24197 () Bool)

(assert (=> start!4070 m!24197))

(declare-fun m!24199 () Bool)

(assert (=> start!4070 m!24199))

(declare-fun m!24201 () Bool)

(assert (=> start!4070 m!24201))

(declare-fun m!24203 () Bool)

(assert (=> b!30120 m!24203))

(check-sat (not b!30118) (not b!30120) (not b!30117) b_and!1789 (not b!30113) (not b!30111) (not start!4070) (not b!30119) (not b_next!985) tp_is_empty!1339 (not mapNonEmpty!1537))
(check-sat b_and!1789 (not b_next!985))
