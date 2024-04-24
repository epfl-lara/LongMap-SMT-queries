; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4070 () Bool)

(assert start!4070)

(declare-fun b_free!979 () Bool)

(declare-fun b_next!979 () Bool)

(assert (=> start!4070 (= b_free!979 (not b_next!979))))

(declare-fun tp!4356 () Bool)

(declare-fun b_and!1779 () Bool)

(assert (=> start!4070 (= tp!4356 b_and!1779)))

(declare-fun b!30003 () Bool)

(declare-fun e!19301 () Bool)

(assert (=> b!30003 (= e!19301 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((array!1877 0))(
  ( (array!1878 (arr!892 (Array (_ BitVec 32) (_ BitVec 64))) (size!993 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1877)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!98 0))(
  ( (MissingZero!98 (index!2514 (_ BitVec 32))) (Found!98 (index!2515 (_ BitVec 32))) (Intermediate!98 (undefined!910 Bool) (index!2516 (_ BitVec 32)) (x!6496 (_ BitVec 32))) (Undefined!98) (MissingVacant!98 (index!2517 (_ BitVec 32))) )
))
(declare-fun lt!11340 () SeekEntryResult!98)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1877 (_ BitVec 32)) SeekEntryResult!98)

(assert (=> b!30003 (= lt!11340 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1528 () Bool)

(declare-fun mapRes!1528 () Bool)

(assert (=> mapIsEmpty!1528 mapRes!1528))

(declare-fun b!30005 () Bool)

(declare-fun e!19302 () Bool)

(declare-fun tp_is_empty!1333 () Bool)

(assert (=> b!30005 (= e!19302 tp_is_empty!1333)))

(declare-fun b!30006 () Bool)

(declare-fun e!19299 () Bool)

(assert (=> b!30006 (= e!19299 (and e!19302 mapRes!1528))))

(declare-fun condMapEmpty!1528 () Bool)

(declare-datatypes ((V!1603 0))(
  ( (V!1604 (val!693 Int)) )
))
(declare-datatypes ((ValueCell!467 0))(
  ( (ValueCellFull!467 (v!1782 V!1603)) (EmptyCell!467) )
))
(declare-datatypes ((array!1879 0))(
  ( (array!1880 (arr!893 (Array (_ BitVec 32) ValueCell!467)) (size!994 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1879)

(declare-fun mapDefault!1528 () ValueCell!467)

(assert (=> b!30006 (= condMapEmpty!1528 (= (arr!893 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!467)) mapDefault!1528)))))

(declare-fun b!30007 () Bool)

(declare-fun res!18052 () Bool)

(assert (=> b!30007 (=> (not res!18052) (not e!19301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1877 (_ BitVec 32)) Bool)

(assert (=> b!30007 (= res!18052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30008 () Bool)

(declare-fun res!18051 () Bool)

(assert (=> b!30008 (=> (not res!18051) (not e!19301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30008 (= res!18051 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1528 () Bool)

(declare-fun tp!4357 () Bool)

(declare-fun e!19303 () Bool)

(assert (=> mapNonEmpty!1528 (= mapRes!1528 (and tp!4357 e!19303))))

(declare-fun mapValue!1528 () ValueCell!467)

(declare-fun mapKey!1528 () (_ BitVec 32))

(declare-fun mapRest!1528 () (Array (_ BitVec 32) ValueCell!467))

(assert (=> mapNonEmpty!1528 (= (arr!893 _values!1501) (store mapRest!1528 mapKey!1528 mapValue!1528))))

(declare-fun b!30009 () Bool)

(declare-fun res!18053 () Bool)

(assert (=> b!30009 (=> (not res!18053) (not e!19301))))

(declare-fun arrayContainsKey!0 (array!1877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30009 (= res!18053 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30010 () Bool)

(declare-fun res!18050 () Bool)

(assert (=> b!30010 (=> (not res!18050) (not e!19301))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1603)

(declare-fun minValue!1443 () V!1603)

(declare-datatypes ((tuple2!1142 0))(
  ( (tuple2!1143 (_1!582 (_ BitVec 64)) (_2!582 V!1603)) )
))
(declare-datatypes ((List!735 0))(
  ( (Nil!732) (Cons!731 (h!1298 tuple2!1142) (t!3422 List!735)) )
))
(declare-datatypes ((ListLongMap!713 0))(
  ( (ListLongMap!714 (toList!372 List!735)) )
))
(declare-fun contains!314 (ListLongMap!713 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!197 (array!1877 array!1879 (_ BitVec 32) (_ BitVec 32) V!1603 V!1603 (_ BitVec 32) Int) ListLongMap!713)

(assert (=> b!30010 (= res!18050 (not (contains!314 (getCurrentListMap!197 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30011 () Bool)

(assert (=> b!30011 (= e!19303 tp_is_empty!1333)))

(declare-fun b!30012 () Bool)

(declare-fun res!18049 () Bool)

(assert (=> b!30012 (=> (not res!18049) (not e!19301))))

(assert (=> b!30012 (= res!18049 (and (= (size!994 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!993 _keys!1833) (size!994 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!18047 () Bool)

(assert (=> start!4070 (=> (not res!18047) (not e!19301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4070 (= res!18047 (validMask!0 mask!2294))))

(assert (=> start!4070 e!19301))

(assert (=> start!4070 true))

(assert (=> start!4070 tp!4356))

(declare-fun array_inv!619 (array!1879) Bool)

(assert (=> start!4070 (and (array_inv!619 _values!1501) e!19299)))

(declare-fun array_inv!620 (array!1877) Bool)

(assert (=> start!4070 (array_inv!620 _keys!1833)))

(assert (=> start!4070 tp_is_empty!1333))

(declare-fun b!30004 () Bool)

(declare-fun res!18048 () Bool)

(assert (=> b!30004 (=> (not res!18048) (not e!19301))))

(declare-datatypes ((List!736 0))(
  ( (Nil!733) (Cons!732 (h!1299 (_ BitVec 64)) (t!3423 List!736)) )
))
(declare-fun arrayNoDuplicates!0 (array!1877 (_ BitVec 32) List!736) Bool)

(assert (=> b!30004 (= res!18048 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!733))))

(assert (= (and start!4070 res!18047) b!30012))

(assert (= (and b!30012 res!18049) b!30007))

(assert (= (and b!30007 res!18052) b!30004))

(assert (= (and b!30004 res!18048) b!30008))

(assert (= (and b!30008 res!18051) b!30010))

(assert (= (and b!30010 res!18050) b!30009))

(assert (= (and b!30009 res!18053) b!30003))

(assert (= (and b!30006 condMapEmpty!1528) mapIsEmpty!1528))

(assert (= (and b!30006 (not condMapEmpty!1528)) mapNonEmpty!1528))

(get-info :version)

(assert (= (and mapNonEmpty!1528 ((_ is ValueCellFull!467) mapValue!1528)) b!30011))

(assert (= (and b!30006 ((_ is ValueCellFull!467) mapDefault!1528)) b!30005))

(assert (= start!4070 b!30006))

(declare-fun m!24035 () Bool)

(assert (=> b!30004 m!24035))

(declare-fun m!24037 () Bool)

(assert (=> b!30007 m!24037))

(declare-fun m!24039 () Bool)

(assert (=> b!30010 m!24039))

(assert (=> b!30010 m!24039))

(declare-fun m!24041 () Bool)

(assert (=> b!30010 m!24041))

(declare-fun m!24043 () Bool)

(assert (=> b!30008 m!24043))

(declare-fun m!24045 () Bool)

(assert (=> b!30003 m!24045))

(declare-fun m!24047 () Bool)

(assert (=> start!4070 m!24047))

(declare-fun m!24049 () Bool)

(assert (=> start!4070 m!24049))

(declare-fun m!24051 () Bool)

(assert (=> start!4070 m!24051))

(declare-fun m!24053 () Bool)

(assert (=> b!30009 m!24053))

(declare-fun m!24055 () Bool)

(assert (=> mapNonEmpty!1528 m!24055))

(check-sat (not b!30003) (not b!30009) tp_is_empty!1333 b_and!1779 (not start!4070) (not b_next!979) (not b!30007) (not b!30008) (not b!30010) (not mapNonEmpty!1528) (not b!30004))
(check-sat b_and!1779 (not b_next!979))
