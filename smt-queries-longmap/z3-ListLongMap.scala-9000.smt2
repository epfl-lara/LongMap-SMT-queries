; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108762 () Bool)

(assert start!108762)

(declare-fun b_free!28275 () Bool)

(declare-fun b_next!28275 () Bool)

(assert (=> start!108762 (= b_free!28275 (not b_next!28275))))

(declare-fun tp!99941 () Bool)

(declare-fun b_and!46341 () Bool)

(assert (=> start!108762 (= tp!99941 b_and!46341)))

(declare-fun res!853203 () Bool)

(declare-fun e!733624 () Bool)

(assert (=> start!108762 (=> (not res!853203) (not e!733624))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108762 (= res!853203 (validMask!0 mask!2175))))

(assert (=> start!108762 e!733624))

(declare-fun tp_is_empty!33915 () Bool)

(assert (=> start!108762 tp_is_empty!33915))

(assert (=> start!108762 true))

(declare-datatypes ((V!50323 0))(
  ( (V!50324 (val!17032 Int)) )
))
(declare-datatypes ((ValueCell!16059 0))(
  ( (ValueCellFull!16059 (v!19634 V!50323)) (EmptyCell!16059) )
))
(declare-datatypes ((array!84888 0))(
  ( (array!84889 (arr!40946 (Array (_ BitVec 32) ValueCell!16059)) (size!41496 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84888)

(declare-fun e!733622 () Bool)

(declare-fun array_inv!31055 (array!84888) Bool)

(assert (=> start!108762 (and (array_inv!31055 _values!1445) e!733622)))

(declare-datatypes ((array!84890 0))(
  ( (array!84891 (arr!40947 (Array (_ BitVec 32) (_ BitVec 64))) (size!41497 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84890)

(declare-fun array_inv!31056 (array!84890) Bool)

(assert (=> start!108762 (array_inv!31056 _keys!1741)))

(assert (=> start!108762 tp!99941))

(declare-fun b!1284332 () Bool)

(declare-fun res!853202 () Bool)

(assert (=> b!1284332 (=> (not res!853202) (not e!733624))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284332 (= res!853202 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41497 _keys!1741))))))

(declare-fun b!1284333 () Bool)

(declare-fun e!733621 () Bool)

(assert (=> b!1284333 (= e!733621 tp_is_empty!33915)))

(declare-fun b!1284334 () Bool)

(declare-fun e!733623 () Bool)

(assert (=> b!1284334 (= e!733623 tp_is_empty!33915)))

(declare-fun b!1284335 () Bool)

(declare-fun res!853205 () Bool)

(assert (=> b!1284335 (=> (not res!853205) (not e!733624))))

(declare-datatypes ((List!29014 0))(
  ( (Nil!29011) (Cons!29010 (h!30219 (_ BitVec 64)) (t!42558 List!29014)) )
))
(declare-fun arrayNoDuplicates!0 (array!84890 (_ BitVec 32) List!29014) Bool)

(assert (=> b!1284335 (= res!853205 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29011))))

(declare-fun mapNonEmpty!52430 () Bool)

(declare-fun mapRes!52430 () Bool)

(declare-fun tp!99940 () Bool)

(assert (=> mapNonEmpty!52430 (= mapRes!52430 (and tp!99940 e!733623))))

(declare-fun mapValue!52430 () ValueCell!16059)

(declare-fun mapKey!52430 () (_ BitVec 32))

(declare-fun mapRest!52430 () (Array (_ BitVec 32) ValueCell!16059))

(assert (=> mapNonEmpty!52430 (= (arr!40946 _values!1445) (store mapRest!52430 mapKey!52430 mapValue!52430))))

(declare-fun b!1284336 () Bool)

(declare-fun res!853204 () Bool)

(assert (=> b!1284336 (=> (not res!853204) (not e!733624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84890 (_ BitVec 32)) Bool)

(assert (=> b!1284336 (= res!853204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284337 () Bool)

(declare-fun res!853206 () Bool)

(assert (=> b!1284337 (=> (not res!853206) (not e!733624))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284337 (= res!853206 (and (= (size!41496 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41497 _keys!1741) (size!41496 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284338 () Bool)

(assert (=> b!1284338 (= e!733622 (and e!733621 mapRes!52430))))

(declare-fun condMapEmpty!52430 () Bool)

(declare-fun mapDefault!52430 () ValueCell!16059)

(assert (=> b!1284338 (= condMapEmpty!52430 (= (arr!40946 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16059)) mapDefault!52430)))))

(declare-fun b!1284339 () Bool)

(assert (=> b!1284339 (= e!733624 false)))

(declare-fun minValue!1387 () V!50323)

(declare-fun zeroValue!1387 () V!50323)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576799 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21822 0))(
  ( (tuple2!21823 (_1!10922 (_ BitVec 64)) (_2!10922 V!50323)) )
))
(declare-datatypes ((List!29015 0))(
  ( (Nil!29012) (Cons!29011 (h!30220 tuple2!21822) (t!42559 List!29015)) )
))
(declare-datatypes ((ListLongMap!19479 0))(
  ( (ListLongMap!19480 (toList!9755 List!29015)) )
))
(declare-fun contains!7872 (ListLongMap!19479 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4834 (array!84890 array!84888 (_ BitVec 32) (_ BitVec 32) V!50323 V!50323 (_ BitVec 32) Int) ListLongMap!19479)

(assert (=> b!1284339 (= lt!576799 (contains!7872 (getCurrentListMap!4834 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52430 () Bool)

(assert (=> mapIsEmpty!52430 mapRes!52430))

(assert (= (and start!108762 res!853203) b!1284337))

(assert (= (and b!1284337 res!853206) b!1284336))

(assert (= (and b!1284336 res!853204) b!1284335))

(assert (= (and b!1284335 res!853205) b!1284332))

(assert (= (and b!1284332 res!853202) b!1284339))

(assert (= (and b!1284338 condMapEmpty!52430) mapIsEmpty!52430))

(assert (= (and b!1284338 (not condMapEmpty!52430)) mapNonEmpty!52430))

(get-info :version)

(assert (= (and mapNonEmpty!52430 ((_ is ValueCellFull!16059) mapValue!52430)) b!1284334))

(assert (= (and b!1284338 ((_ is ValueCellFull!16059) mapDefault!52430)) b!1284333))

(assert (= start!108762 b!1284338))

(declare-fun m!1178053 () Bool)

(assert (=> b!1284336 m!1178053))

(declare-fun m!1178055 () Bool)

(assert (=> start!108762 m!1178055))

(declare-fun m!1178057 () Bool)

(assert (=> start!108762 m!1178057))

(declare-fun m!1178059 () Bool)

(assert (=> start!108762 m!1178059))

(declare-fun m!1178061 () Bool)

(assert (=> b!1284339 m!1178061))

(assert (=> b!1284339 m!1178061))

(declare-fun m!1178063 () Bool)

(assert (=> b!1284339 m!1178063))

(declare-fun m!1178065 () Bool)

(assert (=> mapNonEmpty!52430 m!1178065))

(declare-fun m!1178067 () Bool)

(assert (=> b!1284335 m!1178067))

(check-sat (not b_next!28275) (not b!1284339) (not b!1284335) tp_is_empty!33915 (not start!108762) (not b!1284336) b_and!46341 (not mapNonEmpty!52430))
(check-sat b_and!46341 (not b_next!28275))
