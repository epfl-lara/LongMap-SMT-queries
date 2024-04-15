; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109528 () Bool)

(assert start!109528)

(declare-fun b_free!29017 () Bool)

(declare-fun b_next!29017 () Bool)

(assert (=> start!109528 (= b_free!29017 (not b_next!29017))))

(declare-fun tp!102171 () Bool)

(declare-fun b_and!47089 () Bool)

(assert (=> start!109528 (= tp!102171 b_and!47089)))

(declare-fun b!1297175 () Bool)

(declare-fun e!740072 () Bool)

(declare-fun e!740070 () Bool)

(declare-fun mapRes!53546 () Bool)

(assert (=> b!1297175 (= e!740072 (and e!740070 mapRes!53546))))

(declare-fun condMapEmpty!53546 () Bool)

(declare-datatypes ((V!51313 0))(
  ( (V!51314 (val!17403 Int)) )
))
(declare-datatypes ((ValueCell!16430 0))(
  ( (ValueCellFull!16430 (v!20005 V!51313)) (EmptyCell!16430) )
))
(declare-datatypes ((array!86223 0))(
  ( (array!86224 (arr!41613 (Array (_ BitVec 32) ValueCell!16430)) (size!42165 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86223)

(declare-fun mapDefault!53546 () ValueCell!16430)

(assert (=> b!1297175 (= condMapEmpty!53546 (= (arr!41613 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16430)) mapDefault!53546)))))

(declare-fun b!1297176 () Bool)

(declare-fun e!740071 () Bool)

(declare-fun tp_is_empty!34657 () Bool)

(assert (=> b!1297176 (= e!740071 tp_is_empty!34657)))

(declare-fun b!1297177 () Bool)

(assert (=> b!1297177 (= e!740070 tp_is_empty!34657)))

(declare-fun b!1297178 () Bool)

(declare-fun res!862091 () Bool)

(declare-fun e!740069 () Bool)

(assert (=> b!1297178 (=> (not res!862091) (not e!740069))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86225 0))(
  ( (array!86226 (arr!41614 (Array (_ BitVec 32) (_ BitVec 64))) (size!42166 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86225)

(assert (=> b!1297178 (= res!862091 (and (= (size!42165 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42166 _keys!1741) (size!42165 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297179 () Bool)

(declare-fun res!862095 () Bool)

(assert (=> b!1297179 (=> (not res!862095) (not e!740069))))

(declare-datatypes ((List!29608 0))(
  ( (Nil!29605) (Cons!29604 (h!30813 (_ BitVec 64)) (t!43164 List!29608)) )
))
(declare-fun arrayNoDuplicates!0 (array!86225 (_ BitVec 32) List!29608) Bool)

(assert (=> b!1297179 (= res!862095 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29605))))

(declare-fun mapNonEmpty!53546 () Bool)

(declare-fun tp!102170 () Bool)

(assert (=> mapNonEmpty!53546 (= mapRes!53546 (and tp!102170 e!740071))))

(declare-fun mapValue!53546 () ValueCell!16430)

(declare-fun mapRest!53546 () (Array (_ BitVec 32) ValueCell!16430))

(declare-fun mapKey!53546 () (_ BitVec 32))

(assert (=> mapNonEmpty!53546 (= (arr!41613 _values!1445) (store mapRest!53546 mapKey!53546 mapValue!53546))))

(declare-fun b!1297180 () Bool)

(declare-fun res!862094 () Bool)

(assert (=> b!1297180 (=> (not res!862094) (not e!740069))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1297180 (= res!862094 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42166 _keys!1741))))))

(declare-fun res!862093 () Bool)

(assert (=> start!109528 (=> (not res!862093) (not e!740069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109528 (= res!862093 (validMask!0 mask!2175))))

(assert (=> start!109528 e!740069))

(assert (=> start!109528 tp_is_empty!34657))

(assert (=> start!109528 true))

(declare-fun array_inv!31661 (array!86223) Bool)

(assert (=> start!109528 (and (array_inv!31661 _values!1445) e!740072)))

(declare-fun array_inv!31662 (array!86225) Bool)

(assert (=> start!109528 (array_inv!31662 _keys!1741)))

(assert (=> start!109528 tp!102171))

(declare-fun b!1297181 () Bool)

(assert (=> b!1297181 (= e!740069 false)))

(declare-fun minValue!1387 () V!51313)

(declare-fun zeroValue!1387 () V!51313)

(declare-fun lt!580393 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22482 0))(
  ( (tuple2!22483 (_1!11252 (_ BitVec 64)) (_2!11252 V!51313)) )
))
(declare-datatypes ((List!29609 0))(
  ( (Nil!29606) (Cons!29605 (h!30814 tuple2!22482) (t!43165 List!29609)) )
))
(declare-datatypes ((ListLongMap!20139 0))(
  ( (ListLongMap!20140 (toList!10085 List!29609)) )
))
(declare-fun contains!8133 (ListLongMap!20139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5001 (array!86225 array!86223 (_ BitVec 32) (_ BitVec 32) V!51313 V!51313 (_ BitVec 32) Int) ListLongMap!20139)

(assert (=> b!1297181 (= lt!580393 (contains!8133 (getCurrentListMap!5001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53546 () Bool)

(assert (=> mapIsEmpty!53546 mapRes!53546))

(declare-fun b!1297182 () Bool)

(declare-fun res!862092 () Bool)

(assert (=> b!1297182 (=> (not res!862092) (not e!740069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86225 (_ BitVec 32)) Bool)

(assert (=> b!1297182 (= res!862092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109528 res!862093) b!1297178))

(assert (= (and b!1297178 res!862091) b!1297182))

(assert (= (and b!1297182 res!862092) b!1297179))

(assert (= (and b!1297179 res!862095) b!1297180))

(assert (= (and b!1297180 res!862094) b!1297181))

(assert (= (and b!1297175 condMapEmpty!53546) mapIsEmpty!53546))

(assert (= (and b!1297175 (not condMapEmpty!53546)) mapNonEmpty!53546))

(get-info :version)

(assert (= (and mapNonEmpty!53546 ((_ is ValueCellFull!16430) mapValue!53546)) b!1297176))

(assert (= (and b!1297175 ((_ is ValueCellFull!16430) mapDefault!53546)) b!1297177))

(assert (= start!109528 b!1297175))

(declare-fun m!1188399 () Bool)

(assert (=> b!1297181 m!1188399))

(assert (=> b!1297181 m!1188399))

(declare-fun m!1188401 () Bool)

(assert (=> b!1297181 m!1188401))

(declare-fun m!1188403 () Bool)

(assert (=> b!1297182 m!1188403))

(declare-fun m!1188405 () Bool)

(assert (=> start!109528 m!1188405))

(declare-fun m!1188407 () Bool)

(assert (=> start!109528 m!1188407))

(declare-fun m!1188409 () Bool)

(assert (=> start!109528 m!1188409))

(declare-fun m!1188411 () Bool)

(assert (=> b!1297179 m!1188411))

(declare-fun m!1188413 () Bool)

(assert (=> mapNonEmpty!53546 m!1188413))

(check-sat (not b!1297181) tp_is_empty!34657 (not b!1297179) (not b!1297182) (not mapNonEmpty!53546) (not start!109528) b_and!47089 (not b_next!29017))
(check-sat b_and!47089 (not b_next!29017))
