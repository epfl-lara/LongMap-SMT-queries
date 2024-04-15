; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109564 () Bool)

(assert start!109564)

(declare-fun b_free!29053 () Bool)

(declare-fun b_next!29053 () Bool)

(assert (=> start!109564 (= b_free!29053 (not b_next!29053))))

(declare-fun tp!102278 () Bool)

(declare-fun b_and!47125 () Bool)

(assert (=> start!109564 (= tp!102278 b_and!47125)))

(declare-fun b!1297607 () Bool)

(declare-fun e!740343 () Bool)

(declare-fun tp_is_empty!34693 () Bool)

(assert (=> b!1297607 (= e!740343 tp_is_empty!34693)))

(declare-fun b!1297608 () Bool)

(declare-fun res!862361 () Bool)

(declare-fun e!740339 () Bool)

(assert (=> b!1297608 (=> (not res!862361) (not e!740339))))

(declare-datatypes ((array!86289 0))(
  ( (array!86290 (arr!41646 (Array (_ BitVec 32) (_ BitVec 64))) (size!42198 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86289)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86289 (_ BitVec 32)) Bool)

(assert (=> b!1297608 (= res!862361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297609 () Bool)

(declare-fun res!862362 () Bool)

(assert (=> b!1297609 (=> (not res!862362) (not e!740339))))

(declare-datatypes ((V!51361 0))(
  ( (V!51362 (val!17421 Int)) )
))
(declare-datatypes ((ValueCell!16448 0))(
  ( (ValueCellFull!16448 (v!20023 V!51361)) (EmptyCell!16448) )
))
(declare-datatypes ((array!86291 0))(
  ( (array!86292 (arr!41647 (Array (_ BitVec 32) ValueCell!16448)) (size!42199 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86291)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297609 (= res!862362 (and (= (size!42199 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42198 _keys!1741) (size!42199 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53600 () Bool)

(declare-fun mapRes!53600 () Bool)

(declare-fun tp!102279 () Bool)

(declare-fun e!740340 () Bool)

(assert (=> mapNonEmpty!53600 (= mapRes!53600 (and tp!102279 e!740340))))

(declare-fun mapKey!53600 () (_ BitVec 32))

(declare-fun mapRest!53600 () (Array (_ BitVec 32) ValueCell!16448))

(declare-fun mapValue!53600 () ValueCell!16448)

(assert (=> mapNonEmpty!53600 (= (arr!41647 _values!1445) (store mapRest!53600 mapKey!53600 mapValue!53600))))

(declare-fun b!1297610 () Bool)

(declare-fun e!740342 () Bool)

(assert (=> b!1297610 (= e!740342 (and e!740343 mapRes!53600))))

(declare-fun condMapEmpty!53600 () Bool)

(declare-fun mapDefault!53600 () ValueCell!16448)

(assert (=> b!1297610 (= condMapEmpty!53600 (= (arr!41647 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16448)) mapDefault!53600)))))

(declare-fun b!1297611 () Bool)

(declare-fun res!862363 () Bool)

(assert (=> b!1297611 (=> (not res!862363) (not e!740339))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1297611 (= res!862363 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42198 _keys!1741))))))

(declare-fun b!1297612 () Bool)

(assert (=> b!1297612 (= e!740339 false)))

(declare-fun minValue!1387 () V!51361)

(declare-fun zeroValue!1387 () V!51361)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!580447 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22502 0))(
  ( (tuple2!22503 (_1!11262 (_ BitVec 64)) (_2!11262 V!51361)) )
))
(declare-datatypes ((List!29627 0))(
  ( (Nil!29624) (Cons!29623 (h!30832 tuple2!22502) (t!43183 List!29627)) )
))
(declare-datatypes ((ListLongMap!20159 0))(
  ( (ListLongMap!20160 (toList!10095 List!29627)) )
))
(declare-fun contains!8143 (ListLongMap!20159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5011 (array!86289 array!86291 (_ BitVec 32) (_ BitVec 32) V!51361 V!51361 (_ BitVec 32) Int) ListLongMap!20159)

(assert (=> b!1297612 (= lt!580447 (contains!8143 (getCurrentListMap!5011 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297614 () Bool)

(assert (=> b!1297614 (= e!740340 tp_is_empty!34693)))

(declare-fun mapIsEmpty!53600 () Bool)

(assert (=> mapIsEmpty!53600 mapRes!53600))

(declare-fun res!862364 () Bool)

(assert (=> start!109564 (=> (not res!862364) (not e!740339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109564 (= res!862364 (validMask!0 mask!2175))))

(assert (=> start!109564 e!740339))

(assert (=> start!109564 tp_is_empty!34693))

(assert (=> start!109564 true))

(declare-fun array_inv!31681 (array!86291) Bool)

(assert (=> start!109564 (and (array_inv!31681 _values!1445) e!740342)))

(declare-fun array_inv!31682 (array!86289) Bool)

(assert (=> start!109564 (array_inv!31682 _keys!1741)))

(assert (=> start!109564 tp!102278))

(declare-fun b!1297613 () Bool)

(declare-fun res!862365 () Bool)

(assert (=> b!1297613 (=> (not res!862365) (not e!740339))))

(declare-datatypes ((List!29628 0))(
  ( (Nil!29625) (Cons!29624 (h!30833 (_ BitVec 64)) (t!43184 List!29628)) )
))
(declare-fun arrayNoDuplicates!0 (array!86289 (_ BitVec 32) List!29628) Bool)

(assert (=> b!1297613 (= res!862365 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29625))))

(assert (= (and start!109564 res!862364) b!1297609))

(assert (= (and b!1297609 res!862362) b!1297608))

(assert (= (and b!1297608 res!862361) b!1297613))

(assert (= (and b!1297613 res!862365) b!1297611))

(assert (= (and b!1297611 res!862363) b!1297612))

(assert (= (and b!1297610 condMapEmpty!53600) mapIsEmpty!53600))

(assert (= (and b!1297610 (not condMapEmpty!53600)) mapNonEmpty!53600))

(get-info :version)

(assert (= (and mapNonEmpty!53600 ((_ is ValueCellFull!16448) mapValue!53600)) b!1297614))

(assert (= (and b!1297610 ((_ is ValueCellFull!16448) mapDefault!53600)) b!1297607))

(assert (= start!109564 b!1297610))

(declare-fun m!1188687 () Bool)

(assert (=> start!109564 m!1188687))

(declare-fun m!1188689 () Bool)

(assert (=> start!109564 m!1188689))

(declare-fun m!1188691 () Bool)

(assert (=> start!109564 m!1188691))

(declare-fun m!1188693 () Bool)

(assert (=> mapNonEmpty!53600 m!1188693))

(declare-fun m!1188695 () Bool)

(assert (=> b!1297613 m!1188695))

(declare-fun m!1188697 () Bool)

(assert (=> b!1297608 m!1188697))

(declare-fun m!1188699 () Bool)

(assert (=> b!1297612 m!1188699))

(assert (=> b!1297612 m!1188699))

(declare-fun m!1188701 () Bool)

(assert (=> b!1297612 m!1188701))

(check-sat (not b!1297612) (not b_next!29053) b_and!47125 tp_is_empty!34693 (not start!109564) (not b!1297608) (not b!1297613) (not mapNonEmpty!53600))
(check-sat b_and!47125 (not b_next!29053))
