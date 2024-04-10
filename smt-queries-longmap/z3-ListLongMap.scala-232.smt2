; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4076 () Bool)

(assert start!4076)

(declare-fun b_free!981 () Bool)

(declare-fun b_next!981 () Bool)

(assert (=> start!4076 (= b_free!981 (not b_next!981))))

(declare-fun tp!4363 () Bool)

(declare-fun b_and!1791 () Bool)

(assert (=> start!4076 (= tp!4363 b_and!1791)))

(declare-fun res!18111 () Bool)

(declare-fun e!19369 () Bool)

(assert (=> start!4076 (=> (not res!18111) (not e!19369))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4076 (= res!18111 (validMask!0 mask!2294))))

(assert (=> start!4076 e!19369))

(assert (=> start!4076 true))

(assert (=> start!4076 tp!4363))

(declare-datatypes ((V!1605 0))(
  ( (V!1606 (val!694 Int)) )
))
(declare-datatypes ((ValueCell!468 0))(
  ( (ValueCellFull!468 (v!1783 V!1605)) (EmptyCell!468) )
))
(declare-datatypes ((array!1899 0))(
  ( (array!1900 (arr!903 (Array (_ BitVec 32) ValueCell!468)) (size!1004 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1899)

(declare-fun e!19368 () Bool)

(declare-fun array_inv!631 (array!1899) Bool)

(assert (=> start!4076 (and (array_inv!631 _values!1501) e!19368)))

(declare-datatypes ((array!1901 0))(
  ( (array!1902 (arr!904 (Array (_ BitVec 32) (_ BitVec 64))) (size!1005 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1901)

(declare-fun array_inv!632 (array!1901) Bool)

(assert (=> start!4076 (array_inv!632 _keys!1833)))

(declare-fun tp_is_empty!1335 () Bool)

(assert (=> start!4076 tp_is_empty!1335))

(declare-fun mapIsEmpty!1531 () Bool)

(declare-fun mapRes!1531 () Bool)

(assert (=> mapIsEmpty!1531 mapRes!1531))

(declare-fun b!30105 () Bool)

(declare-fun e!19370 () Bool)

(assert (=> b!30105 (= e!19370 tp_is_empty!1335)))

(declare-fun b!30106 () Bool)

(declare-fun res!18108 () Bool)

(assert (=> b!30106 (=> (not res!18108) (not e!19369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1901 (_ BitVec 32)) Bool)

(assert (=> b!30106 (= res!18108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30107 () Bool)

(declare-fun res!18110 () Bool)

(assert (=> b!30107 (=> (not res!18110) (not e!19369))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30107 (= res!18110 (and (= (size!1004 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1005 _keys!1833) (size!1004 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30108 () Bool)

(assert (=> b!30108 (= e!19369 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!97 0))(
  ( (MissingZero!97 (index!2510 (_ BitVec 32))) (Found!97 (index!2511 (_ BitVec 32))) (Intermediate!97 (undefined!909 Bool) (index!2512 (_ BitVec 32)) (x!6495 (_ BitVec 32))) (Undefined!97) (MissingVacant!97 (index!2513 (_ BitVec 32))) )
))
(declare-fun lt!11387 () SeekEntryResult!97)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1901 (_ BitVec 32)) SeekEntryResult!97)

(assert (=> b!30108 (= lt!11387 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30109 () Bool)

(declare-fun res!18114 () Bool)

(assert (=> b!30109 (=> (not res!18114) (not e!19369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30109 (= res!18114 (validKeyInArray!0 k0!1304))))

(declare-fun b!30110 () Bool)

(declare-fun e!19367 () Bool)

(assert (=> b!30110 (= e!19367 tp_is_empty!1335)))

(declare-fun b!30111 () Bool)

(declare-fun res!18113 () Bool)

(assert (=> b!30111 (=> (not res!18113) (not e!19369))))

(declare-datatypes ((List!746 0))(
  ( (Nil!743) (Cons!742 (h!1309 (_ BitVec 64)) (t!3439 List!746)) )
))
(declare-fun arrayNoDuplicates!0 (array!1901 (_ BitVec 32) List!746) Bool)

(assert (=> b!30111 (= res!18113 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!743))))

(declare-fun b!30112 () Bool)

(declare-fun res!18109 () Bool)

(assert (=> b!30112 (=> (not res!18109) (not e!19369))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1605)

(declare-fun minValue!1443 () V!1605)

(declare-datatypes ((tuple2!1150 0))(
  ( (tuple2!1151 (_1!586 (_ BitVec 64)) (_2!586 V!1605)) )
))
(declare-datatypes ((List!747 0))(
  ( (Nil!744) (Cons!743 (h!1310 tuple2!1150) (t!3440 List!747)) )
))
(declare-datatypes ((ListLongMap!727 0))(
  ( (ListLongMap!728 (toList!379 List!747)) )
))
(declare-fun contains!319 (ListLongMap!727 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!207 (array!1901 array!1899 (_ BitVec 32) (_ BitVec 32) V!1605 V!1605 (_ BitVec 32) Int) ListLongMap!727)

(assert (=> b!30112 (= res!18109 (not (contains!319 (getCurrentListMap!207 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapNonEmpty!1531 () Bool)

(declare-fun tp!4362 () Bool)

(assert (=> mapNonEmpty!1531 (= mapRes!1531 (and tp!4362 e!19367))))

(declare-fun mapValue!1531 () ValueCell!468)

(declare-fun mapRest!1531 () (Array (_ BitVec 32) ValueCell!468))

(declare-fun mapKey!1531 () (_ BitVec 32))

(assert (=> mapNonEmpty!1531 (= (arr!903 _values!1501) (store mapRest!1531 mapKey!1531 mapValue!1531))))

(declare-fun b!30113 () Bool)

(assert (=> b!30113 (= e!19368 (and e!19370 mapRes!1531))))

(declare-fun condMapEmpty!1531 () Bool)

(declare-fun mapDefault!1531 () ValueCell!468)

(assert (=> b!30113 (= condMapEmpty!1531 (= (arr!903 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!468)) mapDefault!1531)))))

(declare-fun b!30114 () Bool)

(declare-fun res!18112 () Bool)

(assert (=> b!30114 (=> (not res!18112) (not e!19369))))

(declare-fun arrayContainsKey!0 (array!1901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30114 (= res!18112 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(assert (= (and start!4076 res!18111) b!30107))

(assert (= (and b!30107 res!18110) b!30106))

(assert (= (and b!30106 res!18108) b!30111))

(assert (= (and b!30111 res!18113) b!30109))

(assert (= (and b!30109 res!18114) b!30112))

(assert (= (and b!30112 res!18109) b!30114))

(assert (= (and b!30114 res!18112) b!30108))

(assert (= (and b!30113 condMapEmpty!1531) mapIsEmpty!1531))

(assert (= (and b!30113 (not condMapEmpty!1531)) mapNonEmpty!1531))

(get-info :version)

(assert (= (and mapNonEmpty!1531 ((_ is ValueCellFull!468) mapValue!1531)) b!30110))

(assert (= (and b!30113 ((_ is ValueCellFull!468) mapDefault!1531)) b!30105))

(assert (= start!4076 b!30113))

(declare-fun m!24209 () Bool)

(assert (=> mapNonEmpty!1531 m!24209))

(declare-fun m!24211 () Bool)

(assert (=> b!30114 m!24211))

(declare-fun m!24213 () Bool)

(assert (=> b!30108 m!24213))

(declare-fun m!24215 () Bool)

(assert (=> b!30112 m!24215))

(assert (=> b!30112 m!24215))

(declare-fun m!24217 () Bool)

(assert (=> b!30112 m!24217))

(declare-fun m!24219 () Bool)

(assert (=> start!4076 m!24219))

(declare-fun m!24221 () Bool)

(assert (=> start!4076 m!24221))

(declare-fun m!24223 () Bool)

(assert (=> start!4076 m!24223))

(declare-fun m!24225 () Bool)

(assert (=> b!30111 m!24225))

(declare-fun m!24227 () Bool)

(assert (=> b!30109 m!24227))

(declare-fun m!24229 () Bool)

(assert (=> b!30106 m!24229))

(check-sat tp_is_empty!1335 b_and!1791 (not b_next!981) (not b!30108) (not b!30109) (not b!30106) (not b!30114) (not b!30112) (not mapNonEmpty!1531) (not start!4076) (not b!30111))
(check-sat b_and!1791 (not b_next!981))
