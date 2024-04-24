; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4396 () Bool)

(assert start!4396)

(declare-fun b_free!1189 () Bool)

(declare-fun b_next!1189 () Bool)

(assert (=> start!4396 (= b_free!1189 (not b_next!1189))))

(declare-fun tp!5002 () Bool)

(declare-fun b_and!1999 () Bool)

(assert (=> start!4396 (= tp!5002 b_and!1999)))

(declare-fun b!33830 () Bool)

(declare-fun e!21480 () Bool)

(declare-fun e!21476 () Bool)

(assert (=> b!33830 (= e!21480 e!21476)))

(declare-fun res!20519 () Bool)

(assert (=> b!33830 (=> (not res!20519) (not e!21476))))

(declare-datatypes ((V!1883 0))(
  ( (V!1884 (val!798 Int)) )
))
(declare-datatypes ((tuple2!1280 0))(
  ( (tuple2!1281 (_1!651 (_ BitVec 64)) (_2!651 V!1883)) )
))
(declare-datatypes ((List!874 0))(
  ( (Nil!871) (Cons!870 (h!1437 tuple2!1280) (t!3571 List!874)) )
))
(declare-datatypes ((ListLongMap!851 0))(
  ( (ListLongMap!852 (toList!441 List!874)) )
))
(declare-fun lt!12459 () ListLongMap!851)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!388 (ListLongMap!851 (_ BitVec 64)) Bool)

(assert (=> b!33830 (= res!20519 (not (contains!388 lt!12459 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!572 0))(
  ( (ValueCellFull!572 (v!1892 V!1883)) (EmptyCell!572) )
))
(declare-datatypes ((array!2287 0))(
  ( (array!2288 (arr!1092 (Array (_ BitVec 32) ValueCell!572)) (size!1193 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2287)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2289 0))(
  ( (array!2290 (arr!1093 (Array (_ BitVec 32) (_ BitVec 64))) (size!1194 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2289)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1883)

(declare-fun minValue!1443 () V!1883)

(declare-fun getCurrentListMap!263 (array!2289 array!2287 (_ BitVec 32) (_ BitVec 32) V!1883 V!1883 (_ BitVec 32) Int) ListLongMap!851)

(assert (=> b!33830 (= lt!12459 (getCurrentListMap!263 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33831 () Bool)

(declare-fun res!20525 () Bool)

(assert (=> b!33831 (=> (not res!20525) (not e!21476))))

(declare-fun arrayContainsKey!0 (array!2289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33831 (= res!20525 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1858 () Bool)

(declare-fun mapRes!1858 () Bool)

(assert (=> mapIsEmpty!1858 mapRes!1858))

(declare-fun res!20522 () Bool)

(assert (=> start!4396 (=> (not res!20522) (not e!21480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4396 (= res!20522 (validMask!0 mask!2294))))

(assert (=> start!4396 e!21480))

(assert (=> start!4396 true))

(assert (=> start!4396 tp!5002))

(declare-fun e!21478 () Bool)

(declare-fun array_inv!749 (array!2287) Bool)

(assert (=> start!4396 (and (array_inv!749 _values!1501) e!21478)))

(declare-fun array_inv!750 (array!2289) Bool)

(assert (=> start!4396 (array_inv!750 _keys!1833)))

(declare-fun tp_is_empty!1543 () Bool)

(assert (=> start!4396 tp_is_empty!1543))

(declare-fun b!33832 () Bool)

(declare-fun res!20520 () Bool)

(assert (=> b!33832 (=> (not res!20520) (not e!21480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2289 (_ BitVec 32)) Bool)

(assert (=> b!33832 (= res!20520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33833 () Bool)

(declare-fun res!20521 () Bool)

(assert (=> b!33833 (=> (not res!20521) (not e!21480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33833 (= res!20521 (validKeyInArray!0 k0!1304))))

(declare-fun b!33834 () Bool)

(declare-fun e!21477 () Bool)

(assert (=> b!33834 (= e!21478 (and e!21477 mapRes!1858))))

(declare-fun condMapEmpty!1858 () Bool)

(declare-fun mapDefault!1858 () ValueCell!572)

(assert (=> b!33834 (= condMapEmpty!1858 (= (arr!1092 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!572)) mapDefault!1858)))))

(declare-fun b!33835 () Bool)

(declare-fun e!21481 () Bool)

(assert (=> b!33835 (= e!21481 tp_is_empty!1543)))

(declare-fun b!33836 () Bool)

(declare-fun res!20524 () Bool)

(assert (=> b!33836 (=> (not res!20524) (not e!21480))))

(declare-datatypes ((List!875 0))(
  ( (Nil!872) (Cons!871 (h!1438 (_ BitVec 64)) (t!3572 List!875)) )
))
(declare-fun arrayNoDuplicates!0 (array!2289 (_ BitVec 32) List!875) Bool)

(assert (=> b!33836 (= res!20524 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!872))))

(declare-fun b!33837 () Bool)

(assert (=> b!33837 (= e!21477 tp_is_empty!1543)))

(declare-fun mapNonEmpty!1858 () Bool)

(declare-fun tp!5001 () Bool)

(assert (=> mapNonEmpty!1858 (= mapRes!1858 (and tp!5001 e!21481))))

(declare-fun mapKey!1858 () (_ BitVec 32))

(declare-fun mapRest!1858 () (Array (_ BitVec 32) ValueCell!572))

(declare-fun mapValue!1858 () ValueCell!572)

(assert (=> mapNonEmpty!1858 (= (arr!1092 _values!1501) (store mapRest!1858 mapKey!1858 mapValue!1858))))

(declare-fun b!33838 () Bool)

(declare-fun res!20523 () Bool)

(assert (=> b!33838 (=> (not res!20523) (not e!21480))))

(assert (=> b!33838 (= res!20523 (and (= (size!1193 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1194 _keys!1833) (size!1193 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33839 () Bool)

(assert (=> b!33839 (= e!21476 (not true))))

(declare-datatypes ((SeekEntryResult!129 0))(
  ( (MissingZero!129 (index!2638 (_ BitVec 32))) (Found!129 (index!2639 (_ BitVec 32))) (Intermediate!129 (undefined!941 Bool) (index!2640 (_ BitVec 32)) (x!6857 (_ BitVec 32))) (Undefined!129) (MissingVacant!129 (index!2641 (_ BitVec 32))) )
))
(declare-fun lt!12458 () SeekEntryResult!129)

(declare-fun lt!12460 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33839 (and ((_ is Found!129) lt!12458) (= (index!2639 lt!12458) lt!12460))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2289 (_ BitVec 32)) SeekEntryResult!129)

(assert (=> b!33839 (= lt!12458 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!764 0))(
  ( (Unit!765) )
))
(declare-fun lt!12462 () Unit!764)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2289 (_ BitVec 32)) Unit!764)

(assert (=> b!33839 (= lt!12462 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12460 _keys!1833 mask!2294))))

(assert (=> b!33839 (contains!388 lt!12459 (select (arr!1093 _keys!1833) lt!12460))))

(declare-fun lt!12461 () Unit!764)

(declare-fun lemmaValidKeyInArrayIsInListMap!63 (array!2289 array!2287 (_ BitVec 32) (_ BitVec 32) V!1883 V!1883 (_ BitVec 32) Int) Unit!764)

(assert (=> b!33839 (= lt!12461 (lemmaValidKeyInArrayIsInListMap!63 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12460 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2289 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33839 (= lt!12460 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!4396 res!20522) b!33838))

(assert (= (and b!33838 res!20523) b!33832))

(assert (= (and b!33832 res!20520) b!33836))

(assert (= (and b!33836 res!20524) b!33833))

(assert (= (and b!33833 res!20521) b!33830))

(assert (= (and b!33830 res!20519) b!33831))

(assert (= (and b!33831 res!20525) b!33839))

(assert (= (and b!33834 condMapEmpty!1858) mapIsEmpty!1858))

(assert (= (and b!33834 (not condMapEmpty!1858)) mapNonEmpty!1858))

(assert (= (and mapNonEmpty!1858 ((_ is ValueCellFull!572) mapValue!1858)) b!33835))

(assert (= (and b!33834 ((_ is ValueCellFull!572) mapDefault!1858)) b!33837))

(assert (= start!4396 b!33834))

(declare-fun m!27095 () Bool)

(assert (=> b!33836 m!27095))

(declare-fun m!27097 () Bool)

(assert (=> b!33832 m!27097))

(declare-fun m!27099 () Bool)

(assert (=> b!33833 m!27099))

(declare-fun m!27101 () Bool)

(assert (=> b!33839 m!27101))

(declare-fun m!27103 () Bool)

(assert (=> b!33839 m!27103))

(assert (=> b!33839 m!27101))

(declare-fun m!27105 () Bool)

(assert (=> b!33839 m!27105))

(declare-fun m!27107 () Bool)

(assert (=> b!33839 m!27107))

(declare-fun m!27109 () Bool)

(assert (=> b!33839 m!27109))

(declare-fun m!27111 () Bool)

(assert (=> b!33839 m!27111))

(declare-fun m!27113 () Bool)

(assert (=> mapNonEmpty!1858 m!27113))

(declare-fun m!27115 () Bool)

(assert (=> start!4396 m!27115))

(declare-fun m!27117 () Bool)

(assert (=> start!4396 m!27117))

(declare-fun m!27119 () Bool)

(assert (=> start!4396 m!27119))

(declare-fun m!27121 () Bool)

(assert (=> b!33830 m!27121))

(declare-fun m!27123 () Bool)

(assert (=> b!33830 m!27123))

(declare-fun m!27125 () Bool)

(assert (=> b!33831 m!27125))

(check-sat (not mapNonEmpty!1858) (not start!4396) (not b!33831) (not b_next!1189) (not b!33832) (not b!33830) (not b!33833) tp_is_empty!1543 (not b!33836) (not b!33839) b_and!1999)
(check-sat b_and!1999 (not b_next!1189))
