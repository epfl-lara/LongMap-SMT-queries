; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4196 () Bool)

(assert start!4196)

(declare-fun b_free!1105 () Bool)

(declare-fun b_next!1105 () Bool)

(assert (=> start!4196 (= b_free!1105 (not b_next!1105))))

(declare-fun tp!4734 () Bool)

(declare-fun b_and!1905 () Bool)

(assert (=> start!4196 (= tp!4734 b_and!1905)))

(declare-fun b!31875 () Bool)

(declare-fun e!20299 () Bool)

(declare-fun tp_is_empty!1459 () Bool)

(assert (=> b!31875 (= e!20299 tp_is_empty!1459)))

(declare-fun b!31876 () Bool)

(declare-fun res!19353 () Bool)

(declare-fun e!20298 () Bool)

(assert (=> b!31876 (=> (not res!19353) (not e!20298))))

(declare-datatypes ((V!1771 0))(
  ( (V!1772 (val!756 Int)) )
))
(declare-datatypes ((ValueCell!530 0))(
  ( (ValueCellFull!530 (v!1845 V!1771)) (EmptyCell!530) )
))
(declare-datatypes ((array!2117 0))(
  ( (array!2118 (arr!1012 (Array (_ BitVec 32) ValueCell!530)) (size!1113 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2117)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2119 0))(
  ( (array!2120 (arr!1013 (Array (_ BitVec 32) (_ BitVec 64))) (size!1114 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2119)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31876 (= res!19353 (and (= (size!1113 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1114 _keys!1833) (size!1113 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31877 () Bool)

(declare-fun e!20300 () Bool)

(assert (=> b!31877 (= e!20300 tp_is_empty!1459)))

(declare-fun b!31878 () Bool)

(declare-fun res!19354 () Bool)

(assert (=> b!31878 (=> (not res!19354) (not e!20298))))

(declare-datatypes ((List!817 0))(
  ( (Nil!814) (Cons!813 (h!1380 (_ BitVec 64)) (t!3504 List!817)) )
))
(declare-fun arrayNoDuplicates!0 (array!2119 (_ BitVec 32) List!817) Bool)

(assert (=> b!31878 (= res!19354 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!814))))

(declare-fun b!31880 () Bool)

(declare-fun res!19358 () Bool)

(assert (=> b!31880 (=> (not res!19358) (not e!20298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2119 (_ BitVec 32)) Bool)

(assert (=> b!31880 (= res!19358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31881 () Bool)

(declare-fun res!19357 () Bool)

(assert (=> b!31881 (=> (not res!19357) (not e!20298))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31881 (= res!19357 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1717 () Bool)

(declare-fun mapRes!1717 () Bool)

(declare-fun tp!4735 () Bool)

(assert (=> mapNonEmpty!1717 (= mapRes!1717 (and tp!4735 e!20299))))

(declare-fun mapRest!1717 () (Array (_ BitVec 32) ValueCell!530))

(declare-fun mapKey!1717 () (_ BitVec 32))

(declare-fun mapValue!1717 () ValueCell!530)

(assert (=> mapNonEmpty!1717 (= (arr!1012 _values!1501) (store mapRest!1717 mapKey!1717 mapValue!1717))))

(declare-fun b!31882 () Bool)

(declare-fun res!19356 () Bool)

(assert (=> b!31882 (=> (not res!19356) (not e!20298))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1771)

(declare-fun minValue!1443 () V!1771)

(declare-datatypes ((tuple2!1222 0))(
  ( (tuple2!1223 (_1!622 (_ BitVec 64)) (_2!622 V!1771)) )
))
(declare-datatypes ((List!818 0))(
  ( (Nil!815) (Cons!814 (h!1381 tuple2!1222) (t!3505 List!818)) )
))
(declare-datatypes ((ListLongMap!793 0))(
  ( (ListLongMap!794 (toList!412 List!818)) )
))
(declare-fun contains!354 (ListLongMap!793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!237 (array!2119 array!2117 (_ BitVec 32) (_ BitVec 32) V!1771 V!1771 (_ BitVec 32) Int) ListLongMap!793)

(assert (=> b!31882 (= res!19356 (not (contains!354 (getCurrentListMap!237 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31883 () Bool)

(declare-fun res!19355 () Bool)

(assert (=> b!31883 (=> (not res!19355) (not e!20298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31883 (= res!19355 (validKeyInArray!0 k0!1304))))

(declare-fun b!31884 () Bool)

(assert (=> b!31884 (= e!20298 false)))

(declare-fun lt!11574 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2119 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31884 (= lt!11574 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1717 () Bool)

(assert (=> mapIsEmpty!1717 mapRes!1717))

(declare-fun b!31879 () Bool)

(declare-fun e!20302 () Bool)

(assert (=> b!31879 (= e!20302 (and e!20300 mapRes!1717))))

(declare-fun condMapEmpty!1717 () Bool)

(declare-fun mapDefault!1717 () ValueCell!530)

(assert (=> b!31879 (= condMapEmpty!1717 (= (arr!1012 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!530)) mapDefault!1717)))))

(declare-fun res!19352 () Bool)

(assert (=> start!4196 (=> (not res!19352) (not e!20298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4196 (= res!19352 (validMask!0 mask!2294))))

(assert (=> start!4196 e!20298))

(assert (=> start!4196 true))

(assert (=> start!4196 tp!4734))

(declare-fun array_inv!693 (array!2117) Bool)

(assert (=> start!4196 (and (array_inv!693 _values!1501) e!20302)))

(declare-fun array_inv!694 (array!2119) Bool)

(assert (=> start!4196 (array_inv!694 _keys!1833)))

(assert (=> start!4196 tp_is_empty!1459))

(assert (= (and start!4196 res!19352) b!31876))

(assert (= (and b!31876 res!19353) b!31880))

(assert (= (and b!31880 res!19358) b!31878))

(assert (= (and b!31878 res!19354) b!31883))

(assert (= (and b!31883 res!19355) b!31882))

(assert (= (and b!31882 res!19356) b!31881))

(assert (= (and b!31881 res!19357) b!31884))

(assert (= (and b!31879 condMapEmpty!1717) mapIsEmpty!1717))

(assert (= (and b!31879 (not condMapEmpty!1717)) mapNonEmpty!1717))

(get-info :version)

(assert (= (and mapNonEmpty!1717 ((_ is ValueCellFull!530) mapValue!1717)) b!31875))

(assert (= (and b!31879 ((_ is ValueCellFull!530) mapDefault!1717)) b!31877))

(assert (= start!4196 b!31879))

(declare-fun m!25439 () Bool)

(assert (=> b!31884 m!25439))

(declare-fun m!25441 () Bool)

(assert (=> b!31880 m!25441))

(declare-fun m!25443 () Bool)

(assert (=> b!31878 m!25443))

(declare-fun m!25445 () Bool)

(assert (=> b!31883 m!25445))

(declare-fun m!25447 () Bool)

(assert (=> b!31881 m!25447))

(declare-fun m!25449 () Bool)

(assert (=> b!31882 m!25449))

(assert (=> b!31882 m!25449))

(declare-fun m!25451 () Bool)

(assert (=> b!31882 m!25451))

(declare-fun m!25453 () Bool)

(assert (=> mapNonEmpty!1717 m!25453))

(declare-fun m!25455 () Bool)

(assert (=> start!4196 m!25455))

(declare-fun m!25457 () Bool)

(assert (=> start!4196 m!25457))

(declare-fun m!25459 () Bool)

(assert (=> start!4196 m!25459))

(check-sat (not b!31881) tp_is_empty!1459 (not start!4196) (not b!31883) (not b!31884) (not b!31880) b_and!1905 (not b!31878) (not b!31882) (not b_next!1105) (not mapNonEmpty!1717))
(check-sat b_and!1905 (not b_next!1105))
