; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109752 () Bool)

(assert start!109752)

(declare-fun b_free!29017 () Bool)

(declare-fun b_next!29017 () Bool)

(assert (=> start!109752 (= b_free!29017 (not b_next!29017))))

(declare-fun tp!102169 () Bool)

(declare-fun b_and!47109 () Bool)

(assert (=> start!109752 (= tp!102169 b_and!47109)))

(declare-fun mapIsEmpty!53546 () Bool)

(declare-fun mapRes!53546 () Bool)

(assert (=> mapIsEmpty!53546 mapRes!53546))

(declare-fun b!1298544 () Bool)

(declare-fun res!862641 () Bool)

(declare-fun e!740947 () Bool)

(assert (=> b!1298544 (=> (not res!862641) (not e!740947))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51313 0))(
  ( (V!51314 (val!17403 Int)) )
))
(declare-datatypes ((ValueCell!16430 0))(
  ( (ValueCellFull!16430 (v!20001 V!51313)) (EmptyCell!16430) )
))
(declare-datatypes ((array!86363 0))(
  ( (array!86364 (arr!41678 (Array (_ BitVec 32) ValueCell!16430)) (size!42229 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86363)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86365 0))(
  ( (array!86366 (arr!41679 (Array (_ BitVec 32) (_ BitVec 64))) (size!42230 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86365)

(assert (=> b!1298544 (= res!862641 (and (= (size!42229 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42230 _keys!1741) (size!42229 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298545 () Bool)

(declare-fun res!862639 () Bool)

(assert (=> b!1298545 (=> (not res!862639) (not e!740947))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298545 (= res!862639 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42230 _keys!1741))))))

(declare-fun b!1298546 () Bool)

(declare-fun e!740948 () Bool)

(declare-fun tp_is_empty!34657 () Bool)

(assert (=> b!1298546 (= e!740948 tp_is_empty!34657)))

(declare-fun b!1298547 () Bool)

(declare-fun e!740949 () Bool)

(declare-fun e!740945 () Bool)

(assert (=> b!1298547 (= e!740949 (and e!740945 mapRes!53546))))

(declare-fun condMapEmpty!53546 () Bool)

(declare-fun mapDefault!53546 () ValueCell!16430)

(assert (=> b!1298547 (= condMapEmpty!53546 (= (arr!41678 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16430)) mapDefault!53546)))))

(declare-fun b!1298548 () Bool)

(declare-fun res!862638 () Bool)

(assert (=> b!1298548 (=> (not res!862638) (not e!740947))))

(declare-datatypes ((List!29597 0))(
  ( (Nil!29594) (Cons!29593 (h!30811 (_ BitVec 64)) (t!43153 List!29597)) )
))
(declare-fun arrayNoDuplicates!0 (array!86365 (_ BitVec 32) List!29597) Bool)

(assert (=> b!1298548 (= res!862638 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29594))))

(declare-fun res!862642 () Bool)

(assert (=> start!109752 (=> (not res!862642) (not e!740947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109752 (= res!862642 (validMask!0 mask!2175))))

(assert (=> start!109752 e!740947))

(assert (=> start!109752 tp_is_empty!34657))

(assert (=> start!109752 true))

(declare-fun array_inv!31783 (array!86363) Bool)

(assert (=> start!109752 (and (array_inv!31783 _values!1445) e!740949)))

(declare-fun array_inv!31784 (array!86365) Bool)

(assert (=> start!109752 (array_inv!31784 _keys!1741)))

(assert (=> start!109752 tp!102169))

(declare-fun b!1298549 () Bool)

(declare-fun res!862640 () Bool)

(assert (=> b!1298549 (=> (not res!862640) (not e!740947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86365 (_ BitVec 32)) Bool)

(assert (=> b!1298549 (= res!862640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298550 () Bool)

(assert (=> b!1298550 (= e!740947 false)))

(declare-fun minValue!1387 () V!51313)

(declare-fun zeroValue!1387 () V!51313)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!581055 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22434 0))(
  ( (tuple2!22435 (_1!11228 (_ BitVec 64)) (_2!11228 V!51313)) )
))
(declare-datatypes ((List!29598 0))(
  ( (Nil!29595) (Cons!29594 (h!30812 tuple2!22434) (t!43154 List!29598)) )
))
(declare-datatypes ((ListLongMap!20099 0))(
  ( (ListLongMap!20100 (toList!10065 List!29598)) )
))
(declare-fun contains!8195 (ListLongMap!20099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5084 (array!86365 array!86363 (_ BitVec 32) (_ BitVec 32) V!51313 V!51313 (_ BitVec 32) Int) ListLongMap!20099)

(assert (=> b!1298550 (= lt!581055 (contains!8195 (getCurrentListMap!5084 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53546 () Bool)

(declare-fun tp!102170 () Bool)

(assert (=> mapNonEmpty!53546 (= mapRes!53546 (and tp!102170 e!740948))))

(declare-fun mapKey!53546 () (_ BitVec 32))

(declare-fun mapRest!53546 () (Array (_ BitVec 32) ValueCell!16430))

(declare-fun mapValue!53546 () ValueCell!16430)

(assert (=> mapNonEmpty!53546 (= (arr!41678 _values!1445) (store mapRest!53546 mapKey!53546 mapValue!53546))))

(declare-fun b!1298551 () Bool)

(assert (=> b!1298551 (= e!740945 tp_is_empty!34657)))

(assert (= (and start!109752 res!862642) b!1298544))

(assert (= (and b!1298544 res!862641) b!1298549))

(assert (= (and b!1298549 res!862640) b!1298548))

(assert (= (and b!1298548 res!862638) b!1298545))

(assert (= (and b!1298545 res!862639) b!1298550))

(assert (= (and b!1298547 condMapEmpty!53546) mapIsEmpty!53546))

(assert (= (and b!1298547 (not condMapEmpty!53546)) mapNonEmpty!53546))

(get-info :version)

(assert (= (and mapNonEmpty!53546 ((_ is ValueCellFull!16430) mapValue!53546)) b!1298546))

(assert (= (and b!1298547 ((_ is ValueCellFull!16430) mapDefault!53546)) b!1298551))

(assert (= start!109752 b!1298547))

(declare-fun m!1190517 () Bool)

(assert (=> mapNonEmpty!53546 m!1190517))

(declare-fun m!1190519 () Bool)

(assert (=> b!1298550 m!1190519))

(assert (=> b!1298550 m!1190519))

(declare-fun m!1190521 () Bool)

(assert (=> b!1298550 m!1190521))

(declare-fun m!1190523 () Bool)

(assert (=> b!1298548 m!1190523))

(declare-fun m!1190525 () Bool)

(assert (=> start!109752 m!1190525))

(declare-fun m!1190527 () Bool)

(assert (=> start!109752 m!1190527))

(declare-fun m!1190529 () Bool)

(assert (=> start!109752 m!1190529))

(declare-fun m!1190531 () Bool)

(assert (=> b!1298549 m!1190531))

(check-sat (not b!1298549) (not start!109752) b_and!47109 (not b_next!29017) (not b!1298550) (not b!1298548) (not mapNonEmpty!53546) tp_is_empty!34657)
(check-sat b_and!47109 (not b_next!29017))
