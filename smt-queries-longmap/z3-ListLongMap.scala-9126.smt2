; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109540 () Bool)

(assert start!109540)

(declare-fun b_free!29029 () Bool)

(declare-fun b_next!29029 () Bool)

(assert (=> start!109540 (= b_free!29029 (not b_next!29029))))

(declare-fun tp!102207 () Bool)

(declare-fun b_and!47101 () Bool)

(assert (=> start!109540 (= tp!102207 b_and!47101)))

(declare-fun b!1297319 () Bool)

(declare-fun res!862182 () Bool)

(declare-fun e!740159 () Bool)

(assert (=> b!1297319 (=> (not res!862182) (not e!740159))))

(declare-datatypes ((array!86247 0))(
  ( (array!86248 (arr!41625 (Array (_ BitVec 32) (_ BitVec 64))) (size!42177 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86247)

(declare-datatypes ((List!29616 0))(
  ( (Nil!29613) (Cons!29612 (h!30821 (_ BitVec 64)) (t!43172 List!29616)) )
))
(declare-fun arrayNoDuplicates!0 (array!86247 (_ BitVec 32) List!29616) Bool)

(assert (=> b!1297319 (= res!862182 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29613))))

(declare-fun mapIsEmpty!53564 () Bool)

(declare-fun mapRes!53564 () Bool)

(assert (=> mapIsEmpty!53564 mapRes!53564))

(declare-fun b!1297320 () Bool)

(assert (=> b!1297320 (= e!740159 false)))

(declare-datatypes ((V!51329 0))(
  ( (V!51330 (val!17409 Int)) )
))
(declare-fun minValue!1387 () V!51329)

(declare-fun zeroValue!1387 () V!51329)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580411 () Bool)

(declare-datatypes ((ValueCell!16436 0))(
  ( (ValueCellFull!16436 (v!20011 V!51329)) (EmptyCell!16436) )
))
(declare-datatypes ((array!86249 0))(
  ( (array!86250 (arr!41626 (Array (_ BitVec 32) ValueCell!16436)) (size!42178 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86249)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22490 0))(
  ( (tuple2!22491 (_1!11256 (_ BitVec 64)) (_2!11256 V!51329)) )
))
(declare-datatypes ((List!29617 0))(
  ( (Nil!29614) (Cons!29613 (h!30822 tuple2!22490) (t!43173 List!29617)) )
))
(declare-datatypes ((ListLongMap!20147 0))(
  ( (ListLongMap!20148 (toList!10089 List!29617)) )
))
(declare-fun contains!8137 (ListLongMap!20147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5005 (array!86247 array!86249 (_ BitVec 32) (_ BitVec 32) V!51329 V!51329 (_ BitVec 32) Int) ListLongMap!20147)

(assert (=> b!1297320 (= lt!580411 (contains!8137 (getCurrentListMap!5005 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297321 () Bool)

(declare-fun res!862183 () Bool)

(assert (=> b!1297321 (=> (not res!862183) (not e!740159))))

(assert (=> b!1297321 (= res!862183 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42177 _keys!1741))))))

(declare-fun b!1297322 () Bool)

(declare-fun e!740160 () Bool)

(declare-fun tp_is_empty!34669 () Bool)

(assert (=> b!1297322 (= e!740160 tp_is_empty!34669)))

(declare-fun b!1297323 () Bool)

(declare-fun res!862181 () Bool)

(assert (=> b!1297323 (=> (not res!862181) (not e!740159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86247 (_ BitVec 32)) Bool)

(assert (=> b!1297323 (= res!862181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297324 () Bool)

(declare-fun res!862184 () Bool)

(assert (=> b!1297324 (=> (not res!862184) (not e!740159))))

(assert (=> b!1297324 (= res!862184 (and (= (size!42178 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42177 _keys!1741) (size!42178 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297325 () Bool)

(declare-fun e!740162 () Bool)

(assert (=> b!1297325 (= e!740162 (and e!740160 mapRes!53564))))

(declare-fun condMapEmpty!53564 () Bool)

(declare-fun mapDefault!53564 () ValueCell!16436)

(assert (=> b!1297325 (= condMapEmpty!53564 (= (arr!41626 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16436)) mapDefault!53564)))))

(declare-fun res!862185 () Bool)

(assert (=> start!109540 (=> (not res!862185) (not e!740159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109540 (= res!862185 (validMask!0 mask!2175))))

(assert (=> start!109540 e!740159))

(assert (=> start!109540 tp_is_empty!34669))

(assert (=> start!109540 true))

(declare-fun array_inv!31671 (array!86249) Bool)

(assert (=> start!109540 (and (array_inv!31671 _values!1445) e!740162)))

(declare-fun array_inv!31672 (array!86247) Bool)

(assert (=> start!109540 (array_inv!31672 _keys!1741)))

(assert (=> start!109540 tp!102207))

(declare-fun b!1297326 () Bool)

(declare-fun e!740161 () Bool)

(assert (=> b!1297326 (= e!740161 tp_is_empty!34669)))

(declare-fun mapNonEmpty!53564 () Bool)

(declare-fun tp!102206 () Bool)

(assert (=> mapNonEmpty!53564 (= mapRes!53564 (and tp!102206 e!740161))))

(declare-fun mapKey!53564 () (_ BitVec 32))

(declare-fun mapRest!53564 () (Array (_ BitVec 32) ValueCell!16436))

(declare-fun mapValue!53564 () ValueCell!16436)

(assert (=> mapNonEmpty!53564 (= (arr!41626 _values!1445) (store mapRest!53564 mapKey!53564 mapValue!53564))))

(assert (= (and start!109540 res!862185) b!1297324))

(assert (= (and b!1297324 res!862184) b!1297323))

(assert (= (and b!1297323 res!862181) b!1297319))

(assert (= (and b!1297319 res!862182) b!1297321))

(assert (= (and b!1297321 res!862183) b!1297320))

(assert (= (and b!1297325 condMapEmpty!53564) mapIsEmpty!53564))

(assert (= (and b!1297325 (not condMapEmpty!53564)) mapNonEmpty!53564))

(get-info :version)

(assert (= (and mapNonEmpty!53564 ((_ is ValueCellFull!16436) mapValue!53564)) b!1297326))

(assert (= (and b!1297325 ((_ is ValueCellFull!16436) mapDefault!53564)) b!1297322))

(assert (= start!109540 b!1297325))

(declare-fun m!1188495 () Bool)

(assert (=> b!1297320 m!1188495))

(assert (=> b!1297320 m!1188495))

(declare-fun m!1188497 () Bool)

(assert (=> b!1297320 m!1188497))

(declare-fun m!1188499 () Bool)

(assert (=> b!1297319 m!1188499))

(declare-fun m!1188501 () Bool)

(assert (=> b!1297323 m!1188501))

(declare-fun m!1188503 () Bool)

(assert (=> start!109540 m!1188503))

(declare-fun m!1188505 () Bool)

(assert (=> start!109540 m!1188505))

(declare-fun m!1188507 () Bool)

(assert (=> start!109540 m!1188507))

(declare-fun m!1188509 () Bool)

(assert (=> mapNonEmpty!53564 m!1188509))

(check-sat (not b!1297320) (not b!1297323) (not b_next!29029) (not start!109540) (not b!1297319) tp_is_empty!34669 b_and!47101 (not mapNonEmpty!53564))
(check-sat b_and!47101 (not b_next!29029))
