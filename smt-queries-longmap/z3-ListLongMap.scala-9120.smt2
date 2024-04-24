; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109728 () Bool)

(assert start!109728)

(declare-fun b_free!28993 () Bool)

(declare-fun b_next!28993 () Bool)

(assert (=> start!109728 (= b_free!28993 (not b_next!28993))))

(declare-fun tp!102098 () Bool)

(declare-fun b_and!47085 () Bool)

(assert (=> start!109728 (= tp!102098 b_and!47085)))

(declare-fun b!1298256 () Bool)

(declare-fun res!862459 () Bool)

(declare-fun e!740767 () Bool)

(assert (=> b!1298256 (=> (not res!862459) (not e!740767))))

(declare-datatypes ((array!86317 0))(
  ( (array!86318 (arr!41655 (Array (_ BitVec 32) (_ BitVec 64))) (size!42206 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86317)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86317 (_ BitVec 32)) Bool)

(assert (=> b!1298256 (= res!862459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298257 () Bool)

(declare-fun e!740769 () Bool)

(declare-fun tp_is_empty!34633 () Bool)

(assert (=> b!1298257 (= e!740769 tp_is_empty!34633)))

(declare-fun b!1298258 () Bool)

(assert (=> b!1298258 (= e!740767 false)))

(declare-datatypes ((V!51281 0))(
  ( (V!51282 (val!17391 Int)) )
))
(declare-fun minValue!1387 () V!51281)

(declare-fun zeroValue!1387 () V!51281)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!581019 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((ValueCell!16418 0))(
  ( (ValueCellFull!16418 (v!19989 V!51281)) (EmptyCell!16418) )
))
(declare-datatypes ((array!86319 0))(
  ( (array!86320 (arr!41656 (Array (_ BitVec 32) ValueCell!16418)) (size!42207 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86319)

(declare-datatypes ((tuple2!22412 0))(
  ( (tuple2!22413 (_1!11217 (_ BitVec 64)) (_2!11217 V!51281)) )
))
(declare-datatypes ((List!29578 0))(
  ( (Nil!29575) (Cons!29574 (h!30792 tuple2!22412) (t!43134 List!29578)) )
))
(declare-datatypes ((ListLongMap!20077 0))(
  ( (ListLongMap!20078 (toList!10054 List!29578)) )
))
(declare-fun contains!8184 (ListLongMap!20077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5073 (array!86317 array!86319 (_ BitVec 32) (_ BitVec 32) V!51281 V!51281 (_ BitVec 32) Int) ListLongMap!20077)

(assert (=> b!1298258 (= lt!581019 (contains!8184 (getCurrentListMap!5073 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298259 () Bool)

(declare-fun res!862458 () Bool)

(assert (=> b!1298259 (=> (not res!862458) (not e!740767))))

(declare-datatypes ((List!29579 0))(
  ( (Nil!29576) (Cons!29575 (h!30793 (_ BitVec 64)) (t!43135 List!29579)) )
))
(declare-fun arrayNoDuplicates!0 (array!86317 (_ BitVec 32) List!29579) Bool)

(assert (=> b!1298259 (= res!862458 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29576))))

(declare-fun res!862461 () Bool)

(assert (=> start!109728 (=> (not res!862461) (not e!740767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109728 (= res!862461 (validMask!0 mask!2175))))

(assert (=> start!109728 e!740767))

(assert (=> start!109728 tp_is_empty!34633))

(assert (=> start!109728 true))

(declare-fun e!740766 () Bool)

(declare-fun array_inv!31767 (array!86319) Bool)

(assert (=> start!109728 (and (array_inv!31767 _values!1445) e!740766)))

(declare-fun array_inv!31768 (array!86317) Bool)

(assert (=> start!109728 (array_inv!31768 _keys!1741)))

(assert (=> start!109728 tp!102098))

(declare-fun b!1298260 () Bool)

(declare-fun mapRes!53510 () Bool)

(assert (=> b!1298260 (= e!740766 (and e!740769 mapRes!53510))))

(declare-fun condMapEmpty!53510 () Bool)

(declare-fun mapDefault!53510 () ValueCell!16418)

(assert (=> b!1298260 (= condMapEmpty!53510 (= (arr!41656 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16418)) mapDefault!53510)))))

(declare-fun mapNonEmpty!53510 () Bool)

(declare-fun tp!102097 () Bool)

(declare-fun e!740765 () Bool)

(assert (=> mapNonEmpty!53510 (= mapRes!53510 (and tp!102097 e!740765))))

(declare-fun mapKey!53510 () (_ BitVec 32))

(declare-fun mapValue!53510 () ValueCell!16418)

(declare-fun mapRest!53510 () (Array (_ BitVec 32) ValueCell!16418))

(assert (=> mapNonEmpty!53510 (= (arr!41656 _values!1445) (store mapRest!53510 mapKey!53510 mapValue!53510))))

(declare-fun b!1298261 () Bool)

(declare-fun res!862460 () Bool)

(assert (=> b!1298261 (=> (not res!862460) (not e!740767))))

(assert (=> b!1298261 (= res!862460 (and (= (size!42207 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42206 _keys!1741) (size!42207 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298262 () Bool)

(declare-fun res!862462 () Bool)

(assert (=> b!1298262 (=> (not res!862462) (not e!740767))))

(assert (=> b!1298262 (= res!862462 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42206 _keys!1741))))))

(declare-fun mapIsEmpty!53510 () Bool)

(assert (=> mapIsEmpty!53510 mapRes!53510))

(declare-fun b!1298263 () Bool)

(assert (=> b!1298263 (= e!740765 tp_is_empty!34633)))

(assert (= (and start!109728 res!862461) b!1298261))

(assert (= (and b!1298261 res!862460) b!1298256))

(assert (= (and b!1298256 res!862459) b!1298259))

(assert (= (and b!1298259 res!862458) b!1298262))

(assert (= (and b!1298262 res!862462) b!1298258))

(assert (= (and b!1298260 condMapEmpty!53510) mapIsEmpty!53510))

(assert (= (and b!1298260 (not condMapEmpty!53510)) mapNonEmpty!53510))

(get-info :version)

(assert (= (and mapNonEmpty!53510 ((_ is ValueCellFull!16418) mapValue!53510)) b!1298263))

(assert (= (and b!1298260 ((_ is ValueCellFull!16418) mapDefault!53510)) b!1298257))

(assert (= start!109728 b!1298260))

(declare-fun m!1190325 () Bool)

(assert (=> b!1298259 m!1190325))

(declare-fun m!1190327 () Bool)

(assert (=> start!109728 m!1190327))

(declare-fun m!1190329 () Bool)

(assert (=> start!109728 m!1190329))

(declare-fun m!1190331 () Bool)

(assert (=> start!109728 m!1190331))

(declare-fun m!1190333 () Bool)

(assert (=> b!1298258 m!1190333))

(assert (=> b!1298258 m!1190333))

(declare-fun m!1190335 () Bool)

(assert (=> b!1298258 m!1190335))

(declare-fun m!1190337 () Bool)

(assert (=> b!1298256 m!1190337))

(declare-fun m!1190339 () Bool)

(assert (=> mapNonEmpty!53510 m!1190339))

(check-sat (not mapNonEmpty!53510) (not b_next!28993) (not b!1298258) (not b!1298256) tp_is_empty!34633 (not start!109728) b_and!47085 (not b!1298259))
(check-sat b_and!47085 (not b_next!28993))
