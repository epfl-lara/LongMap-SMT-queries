; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4190 () Bool)

(assert start!4190)

(declare-fun b_free!1105 () Bool)

(declare-fun b_next!1105 () Bool)

(assert (=> start!4190 (= b_free!1105 (not b_next!1105))))

(declare-fun tp!4734 () Bool)

(declare-fun b_and!1909 () Bool)

(assert (=> start!4190 (= tp!4734 b_and!1909)))

(declare-fun mapNonEmpty!1717 () Bool)

(declare-fun mapRes!1717 () Bool)

(declare-fun tp!4735 () Bool)

(declare-fun e!20310 () Bool)

(assert (=> mapNonEmpty!1717 (= mapRes!1717 (and tp!4735 e!20310))))

(declare-datatypes ((V!1771 0))(
  ( (V!1772 (val!756 Int)) )
))
(declare-datatypes ((ValueCell!530 0))(
  ( (ValueCellFull!530 (v!1844 V!1771)) (EmptyCell!530) )
))
(declare-datatypes ((array!2107 0))(
  ( (array!2108 (arr!1007 (Array (_ BitVec 32) ValueCell!530)) (size!1108 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2107)

(declare-fun mapKey!1717 () (_ BitVec 32))

(declare-fun mapRest!1717 () (Array (_ BitVec 32) ValueCell!530))

(declare-fun mapValue!1717 () ValueCell!530)

(assert (=> mapNonEmpty!1717 (= (arr!1007 _values!1501) (store mapRest!1717 mapKey!1717 mapValue!1717))))

(declare-fun b!31893 () Bool)

(declare-fun res!19360 () Bool)

(declare-fun e!20308 () Bool)

(assert (=> b!31893 (=> (not res!19360) (not e!20308))))

(declare-datatypes ((array!2109 0))(
  ( (array!2110 (arr!1008 (Array (_ BitVec 32) (_ BitVec 64))) (size!1109 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2109)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2109 (_ BitVec 32)) Bool)

(assert (=> b!31893 (= res!19360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31894 () Bool)

(declare-fun res!19365 () Bool)

(assert (=> b!31894 (=> (not res!19365) (not e!20308))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1771)

(declare-fun minValue!1443 () V!1771)

(declare-datatypes ((tuple2!1236 0))(
  ( (tuple2!1237 (_1!629 (_ BitVec 64)) (_2!629 V!1771)) )
))
(declare-datatypes ((List!818 0))(
  ( (Nil!815) (Cons!814 (h!1381 tuple2!1236) (t!3504 List!818)) )
))
(declare-datatypes ((ListLongMap!801 0))(
  ( (ListLongMap!802 (toList!416 List!818)) )
))
(declare-fun contains!357 (ListLongMap!801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!239 (array!2109 array!2107 (_ BitVec 32) (_ BitVec 32) V!1771 V!1771 (_ BitVec 32) Int) ListLongMap!801)

(assert (=> b!31894 (= res!19365 (not (contains!357 (getCurrentListMap!239 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31895 () Bool)

(declare-fun res!19366 () Bool)

(assert (=> b!31895 (=> (not res!19366) (not e!20308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31895 (= res!19366 (validKeyInArray!0 k0!1304))))

(declare-fun b!31896 () Bool)

(declare-fun res!19361 () Bool)

(assert (=> b!31896 (=> (not res!19361) (not e!20308))))

(assert (=> b!31896 (= res!19361 (and (= (size!1108 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1109 _keys!1833) (size!1108 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31897 () Bool)

(declare-fun e!20311 () Bool)

(declare-fun e!20307 () Bool)

(assert (=> b!31897 (= e!20311 (and e!20307 mapRes!1717))))

(declare-fun condMapEmpty!1717 () Bool)

(declare-fun mapDefault!1717 () ValueCell!530)

(assert (=> b!31897 (= condMapEmpty!1717 (= (arr!1007 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!530)) mapDefault!1717)))))

(declare-fun mapIsEmpty!1717 () Bool)

(assert (=> mapIsEmpty!1717 mapRes!1717))

(declare-fun b!31899 () Bool)

(declare-fun tp_is_empty!1459 () Bool)

(assert (=> b!31899 (= e!20310 tp_is_empty!1459)))

(declare-fun b!31900 () Bool)

(assert (=> b!31900 (= e!20308 false)))

(declare-fun lt!11614 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2109 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31900 (= lt!11614 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31901 () Bool)

(declare-fun res!19362 () Bool)

(assert (=> b!31901 (=> (not res!19362) (not e!20308))))

(declare-fun arrayContainsKey!0 (array!2109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31901 (= res!19362 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31902 () Bool)

(assert (=> b!31902 (= e!20307 tp_is_empty!1459)))

(declare-fun res!19364 () Bool)

(assert (=> start!4190 (=> (not res!19364) (not e!20308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4190 (= res!19364 (validMask!0 mask!2294))))

(assert (=> start!4190 e!20308))

(assert (=> start!4190 true))

(assert (=> start!4190 tp!4734))

(declare-fun array_inv!711 (array!2107) Bool)

(assert (=> start!4190 (and (array_inv!711 _values!1501) e!20311)))

(declare-fun array_inv!712 (array!2109) Bool)

(assert (=> start!4190 (array_inv!712 _keys!1833)))

(assert (=> start!4190 tp_is_empty!1459))

(declare-fun b!31898 () Bool)

(declare-fun res!19363 () Bool)

(assert (=> b!31898 (=> (not res!19363) (not e!20308))))

(declare-datatypes ((List!819 0))(
  ( (Nil!816) (Cons!815 (h!1382 (_ BitVec 64)) (t!3505 List!819)) )
))
(declare-fun arrayNoDuplicates!0 (array!2109 (_ BitVec 32) List!819) Bool)

(assert (=> b!31898 (= res!19363 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!816))))

(assert (= (and start!4190 res!19364) b!31896))

(assert (= (and b!31896 res!19361) b!31893))

(assert (= (and b!31893 res!19360) b!31898))

(assert (= (and b!31898 res!19363) b!31895))

(assert (= (and b!31895 res!19366) b!31894))

(assert (= (and b!31894 res!19365) b!31901))

(assert (= (and b!31901 res!19362) b!31900))

(assert (= (and b!31897 condMapEmpty!1717) mapIsEmpty!1717))

(assert (= (and b!31897 (not condMapEmpty!1717)) mapNonEmpty!1717))

(get-info :version)

(assert (= (and mapNonEmpty!1717 ((_ is ValueCellFull!530) mapValue!1717)) b!31899))

(assert (= (and b!31897 ((_ is ValueCellFull!530) mapDefault!1717)) b!31902))

(assert (= start!4190 b!31897))

(declare-fun m!25521 () Bool)

(assert (=> mapNonEmpty!1717 m!25521))

(declare-fun m!25523 () Bool)

(assert (=> b!31901 m!25523))

(declare-fun m!25525 () Bool)

(assert (=> b!31900 m!25525))

(declare-fun m!25527 () Bool)

(assert (=> start!4190 m!25527))

(declare-fun m!25529 () Bool)

(assert (=> start!4190 m!25529))

(declare-fun m!25531 () Bool)

(assert (=> start!4190 m!25531))

(declare-fun m!25533 () Bool)

(assert (=> b!31895 m!25533))

(declare-fun m!25535 () Bool)

(assert (=> b!31898 m!25535))

(declare-fun m!25537 () Bool)

(assert (=> b!31894 m!25537))

(assert (=> b!31894 m!25537))

(declare-fun m!25539 () Bool)

(assert (=> b!31894 m!25539))

(declare-fun m!25541 () Bool)

(assert (=> b!31893 m!25541))

(check-sat (not b!31895) (not b_next!1105) (not mapNonEmpty!1717) (not b!31901) (not b!31894) (not b!31898) tp_is_empty!1459 b_and!1909 (not b!31900) (not start!4190) (not b!31893))
(check-sat b_and!1909 (not b_next!1105))
