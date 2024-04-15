; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4184 () Bool)

(assert start!4184)

(declare-fun b_free!1099 () Bool)

(declare-fun b_next!1099 () Bool)

(assert (=> start!4184 (= b_free!1099 (not b_next!1099))))

(declare-fun tp!4717 () Bool)

(declare-fun b_and!1903 () Bool)

(assert (=> start!4184 (= tp!4717 b_and!1903)))

(declare-fun b!31803 () Bool)

(declare-fun e!20263 () Bool)

(declare-fun tp_is_empty!1453 () Bool)

(assert (=> b!31803 (= e!20263 tp_is_empty!1453)))

(declare-fun mapIsEmpty!1708 () Bool)

(declare-fun mapRes!1708 () Bool)

(assert (=> mapIsEmpty!1708 mapRes!1708))

(declare-fun b!31804 () Bool)

(declare-fun res!19303 () Bool)

(declare-fun e!20262 () Bool)

(assert (=> b!31804 (=> (not res!19303) (not e!20262))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31804 (= res!19303 (validKeyInArray!0 k0!1304))))

(declare-fun b!31805 () Bool)

(declare-fun res!19301 () Bool)

(assert (=> b!31805 (=> (not res!19301) (not e!20262))))

(declare-datatypes ((array!2095 0))(
  ( (array!2096 (arr!1001 (Array (_ BitVec 32) (_ BitVec 64))) (size!1102 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2095)

(declare-datatypes ((List!813 0))(
  ( (Nil!810) (Cons!809 (h!1376 (_ BitVec 64)) (t!3499 List!813)) )
))
(declare-fun arrayNoDuplicates!0 (array!2095 (_ BitVec 32) List!813) Bool)

(assert (=> b!31805 (= res!19301 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!810))))

(declare-fun b!31806 () Bool)

(declare-fun e!20265 () Bool)

(assert (=> b!31806 (= e!20265 tp_is_empty!1453)))

(declare-fun mapNonEmpty!1708 () Bool)

(declare-fun tp!4716 () Bool)

(assert (=> mapNonEmpty!1708 (= mapRes!1708 (and tp!4716 e!20263))))

(declare-datatypes ((V!1763 0))(
  ( (V!1764 (val!753 Int)) )
))
(declare-datatypes ((ValueCell!527 0))(
  ( (ValueCellFull!527 (v!1841 V!1763)) (EmptyCell!527) )
))
(declare-datatypes ((array!2097 0))(
  ( (array!2098 (arr!1002 (Array (_ BitVec 32) ValueCell!527)) (size!1103 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2097)

(declare-fun mapRest!1708 () (Array (_ BitVec 32) ValueCell!527))

(declare-fun mapValue!1708 () ValueCell!527)

(declare-fun mapKey!1708 () (_ BitVec 32))

(assert (=> mapNonEmpty!1708 (= (arr!1002 _values!1501) (store mapRest!1708 mapKey!1708 mapValue!1708))))

(declare-fun b!31807 () Bool)

(declare-fun res!19297 () Bool)

(assert (=> b!31807 (=> (not res!19297) (not e!20262))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31807 (= res!19297 (and (= (size!1103 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1102 _keys!1833) (size!1103 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31808 () Bool)

(declare-fun res!19298 () Bool)

(assert (=> b!31808 (=> (not res!19298) (not e!20262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2095 (_ BitVec 32)) Bool)

(assert (=> b!31808 (= res!19298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!19302 () Bool)

(assert (=> start!4184 (=> (not res!19302) (not e!20262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4184 (= res!19302 (validMask!0 mask!2294))))

(assert (=> start!4184 e!20262))

(assert (=> start!4184 true))

(assert (=> start!4184 tp!4717))

(declare-fun e!20266 () Bool)

(declare-fun array_inv!707 (array!2097) Bool)

(assert (=> start!4184 (and (array_inv!707 _values!1501) e!20266)))

(declare-fun array_inv!708 (array!2095) Bool)

(assert (=> start!4184 (array_inv!708 _keys!1833)))

(assert (=> start!4184 tp_is_empty!1453))

(declare-fun b!31809 () Bool)

(assert (=> b!31809 (= e!20262 false)))

(declare-fun lt!11605 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2095 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31809 (= lt!11605 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31810 () Bool)

(declare-fun res!19299 () Bool)

(assert (=> b!31810 (=> (not res!19299) (not e!20262))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1763)

(declare-fun minValue!1443 () V!1763)

(declare-datatypes ((tuple2!1230 0))(
  ( (tuple2!1231 (_1!626 (_ BitVec 64)) (_2!626 V!1763)) )
))
(declare-datatypes ((List!814 0))(
  ( (Nil!811) (Cons!810 (h!1377 tuple2!1230) (t!3500 List!814)) )
))
(declare-datatypes ((ListLongMap!795 0))(
  ( (ListLongMap!796 (toList!413 List!814)) )
))
(declare-fun contains!354 (ListLongMap!795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!236 (array!2095 array!2097 (_ BitVec 32) (_ BitVec 32) V!1763 V!1763 (_ BitVec 32) Int) ListLongMap!795)

(assert (=> b!31810 (= res!19299 (not (contains!354 (getCurrentListMap!236 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31811 () Bool)

(declare-fun res!19300 () Bool)

(assert (=> b!31811 (=> (not res!19300) (not e!20262))))

(declare-fun arrayContainsKey!0 (array!2095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31811 (= res!19300 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31812 () Bool)

(assert (=> b!31812 (= e!20266 (and e!20265 mapRes!1708))))

(declare-fun condMapEmpty!1708 () Bool)

(declare-fun mapDefault!1708 () ValueCell!527)

(assert (=> b!31812 (= condMapEmpty!1708 (= (arr!1002 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!527)) mapDefault!1708)))))

(assert (= (and start!4184 res!19302) b!31807))

(assert (= (and b!31807 res!19297) b!31808))

(assert (= (and b!31808 res!19298) b!31805))

(assert (= (and b!31805 res!19301) b!31804))

(assert (= (and b!31804 res!19303) b!31810))

(assert (= (and b!31810 res!19299) b!31811))

(assert (= (and b!31811 res!19300) b!31809))

(assert (= (and b!31812 condMapEmpty!1708) mapIsEmpty!1708))

(assert (= (and b!31812 (not condMapEmpty!1708)) mapNonEmpty!1708))

(get-info :version)

(assert (= (and mapNonEmpty!1708 ((_ is ValueCellFull!527) mapValue!1708)) b!31803))

(assert (= (and b!31812 ((_ is ValueCellFull!527) mapDefault!1708)) b!31806))

(assert (= start!4184 b!31812))

(declare-fun m!25455 () Bool)

(assert (=> b!31811 m!25455))

(declare-fun m!25457 () Bool)

(assert (=> b!31805 m!25457))

(declare-fun m!25459 () Bool)

(assert (=> b!31810 m!25459))

(assert (=> b!31810 m!25459))

(declare-fun m!25461 () Bool)

(assert (=> b!31810 m!25461))

(declare-fun m!25463 () Bool)

(assert (=> b!31804 m!25463))

(declare-fun m!25465 () Bool)

(assert (=> b!31808 m!25465))

(declare-fun m!25467 () Bool)

(assert (=> mapNonEmpty!1708 m!25467))

(declare-fun m!25469 () Bool)

(assert (=> b!31809 m!25469))

(declare-fun m!25471 () Bool)

(assert (=> start!4184 m!25471))

(declare-fun m!25473 () Bool)

(assert (=> start!4184 m!25473))

(declare-fun m!25475 () Bool)

(assert (=> start!4184 m!25475))

(check-sat (not b!31804) (not b!31809) (not b!31808) (not mapNonEmpty!1708) b_and!1903 (not b_next!1099) (not b!31805) (not b!31810) (not start!4184) tp_is_empty!1453 (not b!31811))
(check-sat b_and!1903 (not b_next!1099))
