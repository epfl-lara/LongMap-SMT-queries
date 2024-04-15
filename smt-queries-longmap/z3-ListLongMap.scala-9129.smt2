; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109558 () Bool)

(assert start!109558)

(declare-fun b_free!29047 () Bool)

(declare-fun b_next!29047 () Bool)

(assert (=> start!109558 (= b_free!29047 (not b_next!29047))))

(declare-fun tp!102260 () Bool)

(declare-fun b_and!47119 () Bool)

(assert (=> start!109558 (= tp!102260 b_and!47119)))

(declare-fun mapNonEmpty!53591 () Bool)

(declare-fun mapRes!53591 () Bool)

(declare-fun tp!102261 () Bool)

(declare-fun e!740295 () Bool)

(assert (=> mapNonEmpty!53591 (= mapRes!53591 (and tp!102261 e!740295))))

(declare-datatypes ((V!51353 0))(
  ( (V!51354 (val!17418 Int)) )
))
(declare-datatypes ((ValueCell!16445 0))(
  ( (ValueCellFull!16445 (v!20020 V!51353)) (EmptyCell!16445) )
))
(declare-fun mapValue!53591 () ValueCell!16445)

(declare-fun mapRest!53591 () (Array (_ BitVec 32) ValueCell!16445))

(declare-datatypes ((array!86277 0))(
  ( (array!86278 (arr!41640 (Array (_ BitVec 32) ValueCell!16445)) (size!42192 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86277)

(declare-fun mapKey!53591 () (_ BitVec 32))

(assert (=> mapNonEmpty!53591 (= (arr!41640 _values!1445) (store mapRest!53591 mapKey!53591 mapValue!53591))))

(declare-fun b!1297535 () Bool)

(declare-fun e!740294 () Bool)

(declare-fun tp_is_empty!34687 () Bool)

(assert (=> b!1297535 (= e!740294 tp_is_empty!34687)))

(declare-fun b!1297536 () Bool)

(declare-fun res!862318 () Bool)

(declare-fun e!740297 () Bool)

(assert (=> b!1297536 (=> (not res!862318) (not e!740297))))

(declare-datatypes ((array!86279 0))(
  ( (array!86280 (arr!41641 (Array (_ BitVec 32) (_ BitVec 64))) (size!42193 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86279)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86279 (_ BitVec 32)) Bool)

(assert (=> b!1297536 (= res!862318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297537 () Bool)

(declare-fun res!862320 () Bool)

(assert (=> b!1297537 (=> (not res!862320) (not e!740297))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1297537 (= res!862320 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42193 _keys!1741))))))

(declare-fun b!1297538 () Bool)

(declare-fun res!862316 () Bool)

(assert (=> b!1297538 (=> (not res!862316) (not e!740297))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297538 (= res!862316 (and (= (size!42192 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42193 _keys!1741) (size!42192 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297539 () Bool)

(assert (=> b!1297539 (= e!740297 false)))

(declare-fun zeroValue!1387 () V!51353)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!580438 () Bool)

(declare-fun minValue!1387 () V!51353)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22496 0))(
  ( (tuple2!22497 (_1!11259 (_ BitVec 64)) (_2!11259 V!51353)) )
))
(declare-datatypes ((List!29623 0))(
  ( (Nil!29620) (Cons!29619 (h!30828 tuple2!22496) (t!43179 List!29623)) )
))
(declare-datatypes ((ListLongMap!20153 0))(
  ( (ListLongMap!20154 (toList!10092 List!29623)) )
))
(declare-fun contains!8140 (ListLongMap!20153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5008 (array!86279 array!86277 (_ BitVec 32) (_ BitVec 32) V!51353 V!51353 (_ BitVec 32) Int) ListLongMap!20153)

(assert (=> b!1297539 (= lt!580438 (contains!8140 (getCurrentListMap!5008 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53591 () Bool)

(assert (=> mapIsEmpty!53591 mapRes!53591))

(declare-fun res!862317 () Bool)

(assert (=> start!109558 (=> (not res!862317) (not e!740297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109558 (= res!862317 (validMask!0 mask!2175))))

(assert (=> start!109558 e!740297))

(assert (=> start!109558 tp_is_empty!34687))

(assert (=> start!109558 true))

(declare-fun e!740298 () Bool)

(declare-fun array_inv!31677 (array!86277) Bool)

(assert (=> start!109558 (and (array_inv!31677 _values!1445) e!740298)))

(declare-fun array_inv!31678 (array!86279) Bool)

(assert (=> start!109558 (array_inv!31678 _keys!1741)))

(assert (=> start!109558 tp!102260))

(declare-fun b!1297540 () Bool)

(declare-fun res!862319 () Bool)

(assert (=> b!1297540 (=> (not res!862319) (not e!740297))))

(declare-datatypes ((List!29624 0))(
  ( (Nil!29621) (Cons!29620 (h!30829 (_ BitVec 64)) (t!43180 List!29624)) )
))
(declare-fun arrayNoDuplicates!0 (array!86279 (_ BitVec 32) List!29624) Bool)

(assert (=> b!1297540 (= res!862319 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29621))))

(declare-fun b!1297541 () Bool)

(assert (=> b!1297541 (= e!740295 tp_is_empty!34687)))

(declare-fun b!1297542 () Bool)

(assert (=> b!1297542 (= e!740298 (and e!740294 mapRes!53591))))

(declare-fun condMapEmpty!53591 () Bool)

(declare-fun mapDefault!53591 () ValueCell!16445)

(assert (=> b!1297542 (= condMapEmpty!53591 (= (arr!41640 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16445)) mapDefault!53591)))))

(assert (= (and start!109558 res!862317) b!1297538))

(assert (= (and b!1297538 res!862316) b!1297536))

(assert (= (and b!1297536 res!862318) b!1297540))

(assert (= (and b!1297540 res!862319) b!1297537))

(assert (= (and b!1297537 res!862320) b!1297539))

(assert (= (and b!1297542 condMapEmpty!53591) mapIsEmpty!53591))

(assert (= (and b!1297542 (not condMapEmpty!53591)) mapNonEmpty!53591))

(get-info :version)

(assert (= (and mapNonEmpty!53591 ((_ is ValueCellFull!16445) mapValue!53591)) b!1297541))

(assert (= (and b!1297542 ((_ is ValueCellFull!16445) mapDefault!53591)) b!1297535))

(assert (= start!109558 b!1297542))

(declare-fun m!1188639 () Bool)

(assert (=> b!1297540 m!1188639))

(declare-fun m!1188641 () Bool)

(assert (=> start!109558 m!1188641))

(declare-fun m!1188643 () Bool)

(assert (=> start!109558 m!1188643))

(declare-fun m!1188645 () Bool)

(assert (=> start!109558 m!1188645))

(declare-fun m!1188647 () Bool)

(assert (=> b!1297539 m!1188647))

(assert (=> b!1297539 m!1188647))

(declare-fun m!1188649 () Bool)

(assert (=> b!1297539 m!1188649))

(declare-fun m!1188651 () Bool)

(assert (=> mapNonEmpty!53591 m!1188651))

(declare-fun m!1188653 () Bool)

(assert (=> b!1297536 m!1188653))

(check-sat (not b!1297536) (not b_next!29047) b_and!47119 (not b!1297539) tp_is_empty!34687 (not b!1297540) (not mapNonEmpty!53591) (not start!109558))
(check-sat b_and!47119 (not b_next!29047))
