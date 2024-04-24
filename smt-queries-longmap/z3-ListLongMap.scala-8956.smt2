; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108686 () Bool)

(assert start!108686)

(declare-fun b_free!28009 () Bool)

(declare-fun b_next!28009 () Bool)

(assert (=> start!108686 (= b_free!28009 (not b_next!28009))))

(declare-fun tp!99137 () Bool)

(declare-fun b_and!46071 () Bool)

(assert (=> start!108686 (= tp!99137 b_and!46071)))

(declare-fun mapNonEmpty!52025 () Bool)

(declare-fun mapRes!52025 () Bool)

(declare-fun tp!99136 () Bool)

(declare-fun e!732278 () Bool)

(assert (=> mapNonEmpty!52025 (= mapRes!52025 (and tp!99136 e!732278))))

(declare-datatypes ((V!49969 0))(
  ( (V!49970 (val!16899 Int)) )
))
(declare-datatypes ((ValueCell!15926 0))(
  ( (ValueCellFull!15926 (v!19494 V!49969)) (EmptyCell!15926) )
))
(declare-fun mapValue!52025 () ValueCell!15926)

(declare-fun mapKey!52025 () (_ BitVec 32))

(declare-datatypes ((array!84405 0))(
  ( (array!84406 (arr!40702 (Array (_ BitVec 32) ValueCell!15926)) (size!41253 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84405)

(declare-fun mapRest!52025 () (Array (_ BitVec 32) ValueCell!15926))

(assert (=> mapNonEmpty!52025 (= (arr!40702 _values!1445) (store mapRest!52025 mapKey!52025 mapValue!52025))))

(declare-fun b!1281426 () Bool)

(declare-fun e!732282 () Bool)

(assert (=> b!1281426 (= e!732282 false)))

(declare-fun minValue!1387 () V!49969)

(declare-fun zeroValue!1387 () V!49969)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576570 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84407 0))(
  ( (array!84408 (arr!40703 (Array (_ BitVec 32) (_ BitVec 64))) (size!41254 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84407)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21646 0))(
  ( (tuple2!21647 (_1!10834 (_ BitVec 64)) (_2!10834 V!49969)) )
))
(declare-datatypes ((List!28859 0))(
  ( (Nil!28856) (Cons!28855 (h!30073 tuple2!21646) (t!42391 List!28859)) )
))
(declare-datatypes ((ListLongMap!19311 0))(
  ( (ListLongMap!19312 (toList!9671 List!28859)) )
))
(declare-fun contains!7800 (ListLongMap!19311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4740 (array!84407 array!84405 (_ BitVec 32) (_ BitVec 32) V!49969 V!49969 (_ BitVec 32) Int) ListLongMap!19311)

(assert (=> b!1281426 (= lt!576570 (contains!7800 (getCurrentListMap!4740 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281427 () Bool)

(declare-fun e!732279 () Bool)

(declare-fun tp_is_empty!33649 () Bool)

(assert (=> b!1281427 (= e!732279 tp_is_empty!33649)))

(declare-fun b!1281428 () Bool)

(assert (=> b!1281428 (= e!732278 tp_is_empty!33649)))

(declare-fun mapIsEmpty!52025 () Bool)

(assert (=> mapIsEmpty!52025 mapRes!52025))

(declare-fun b!1281429 () Bool)

(declare-fun e!732280 () Bool)

(assert (=> b!1281429 (= e!732280 (and e!732279 mapRes!52025))))

(declare-fun condMapEmpty!52025 () Bool)

(declare-fun mapDefault!52025 () ValueCell!15926)

(assert (=> b!1281429 (= condMapEmpty!52025 (= (arr!40702 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15926)) mapDefault!52025)))))

(declare-fun b!1281430 () Bool)

(declare-fun res!850857 () Bool)

(assert (=> b!1281430 (=> (not res!850857) (not e!732282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84407 (_ BitVec 32)) Bool)

(assert (=> b!1281430 (= res!850857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281431 () Bool)

(declare-fun res!850859 () Bool)

(assert (=> b!1281431 (=> (not res!850859) (not e!732282))))

(assert (=> b!1281431 (= res!850859 (and (= (size!41253 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41254 _keys!1741) (size!41253 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281432 () Bool)

(declare-fun res!850860 () Bool)

(assert (=> b!1281432 (=> (not res!850860) (not e!732282))))

(declare-datatypes ((List!28860 0))(
  ( (Nil!28857) (Cons!28856 (h!30074 (_ BitVec 64)) (t!42392 List!28860)) )
))
(declare-fun arrayNoDuplicates!0 (array!84407 (_ BitVec 32) List!28860) Bool)

(assert (=> b!1281432 (= res!850860 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28857))))

(declare-fun b!1281433 () Bool)

(declare-fun res!850856 () Bool)

(assert (=> b!1281433 (=> (not res!850856) (not e!732282))))

(assert (=> b!1281433 (= res!850856 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41254 _keys!1741))))))

(declare-fun res!850858 () Bool)

(assert (=> start!108686 (=> (not res!850858) (not e!732282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108686 (= res!850858 (validMask!0 mask!2175))))

(assert (=> start!108686 e!732282))

(assert (=> start!108686 tp_is_empty!33649))

(assert (=> start!108686 true))

(declare-fun array_inv!31095 (array!84405) Bool)

(assert (=> start!108686 (and (array_inv!31095 _values!1445) e!732280)))

(declare-fun array_inv!31096 (array!84407) Bool)

(assert (=> start!108686 (array_inv!31096 _keys!1741)))

(assert (=> start!108686 tp!99137))

(assert (= (and start!108686 res!850858) b!1281431))

(assert (= (and b!1281431 res!850859) b!1281430))

(assert (= (and b!1281430 res!850857) b!1281432))

(assert (= (and b!1281432 res!850860) b!1281433))

(assert (= (and b!1281433 res!850856) b!1281426))

(assert (= (and b!1281429 condMapEmpty!52025) mapIsEmpty!52025))

(assert (= (and b!1281429 (not condMapEmpty!52025)) mapNonEmpty!52025))

(get-info :version)

(assert (= (and mapNonEmpty!52025 ((_ is ValueCellFull!15926) mapValue!52025)) b!1281428))

(assert (= (and b!1281429 ((_ is ValueCellFull!15926) mapDefault!52025)) b!1281427))

(assert (= start!108686 b!1281429))

(declare-fun m!1176465 () Bool)

(assert (=> start!108686 m!1176465))

(declare-fun m!1176467 () Bool)

(assert (=> start!108686 m!1176467))

(declare-fun m!1176469 () Bool)

(assert (=> start!108686 m!1176469))

(declare-fun m!1176471 () Bool)

(assert (=> mapNonEmpty!52025 m!1176471))

(declare-fun m!1176473 () Bool)

(assert (=> b!1281430 m!1176473))

(declare-fun m!1176475 () Bool)

(assert (=> b!1281426 m!1176475))

(assert (=> b!1281426 m!1176475))

(declare-fun m!1176477 () Bool)

(assert (=> b!1281426 m!1176477))

(declare-fun m!1176479 () Bool)

(assert (=> b!1281432 m!1176479))

(check-sat (not b_next!28009) tp_is_empty!33649 (not b!1281426) (not b!1281432) (not b!1281430) b_and!46071 (not mapNonEmpty!52025) (not start!108686))
(check-sat b_and!46071 (not b_next!28009))
