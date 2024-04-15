; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109612 () Bool)

(assert start!109612)

(declare-fun b_free!29101 () Bool)

(declare-fun b_next!29101 () Bool)

(assert (=> start!109612 (= b_free!29101 (not b_next!29101))))

(declare-fun tp!102423 () Bool)

(declare-fun b_and!47173 () Bool)

(assert (=> start!109612 (= tp!102423 b_and!47173)))

(declare-fun b!1298313 () Bool)

(declare-fun res!862857 () Bool)

(declare-fun e!740700 () Bool)

(assert (=> b!1298313 (=> (not res!862857) (not e!740700))))

(declare-datatypes ((V!51425 0))(
  ( (V!51426 (val!17445 Int)) )
))
(declare-fun minValue!1387 () V!51425)

(declare-fun zeroValue!1387 () V!51425)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16472 0))(
  ( (ValueCellFull!16472 (v!20047 V!51425)) (EmptyCell!16472) )
))
(declare-datatypes ((array!86383 0))(
  ( (array!86384 (arr!41693 (Array (_ BitVec 32) ValueCell!16472)) (size!42245 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86383)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86385 0))(
  ( (array!86386 (arr!41694 (Array (_ BitVec 32) (_ BitVec 64))) (size!42246 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86385)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22536 0))(
  ( (tuple2!22537 (_1!11279 (_ BitVec 64)) (_2!11279 V!51425)) )
))
(declare-datatypes ((List!29661 0))(
  ( (Nil!29658) (Cons!29657 (h!30866 tuple2!22536) (t!43217 List!29661)) )
))
(declare-datatypes ((ListLongMap!20193 0))(
  ( (ListLongMap!20194 (toList!10112 List!29661)) )
))
(declare-fun contains!8160 (ListLongMap!20193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5028 (array!86385 array!86383 (_ BitVec 32) (_ BitVec 32) V!51425 V!51425 (_ BitVec 32) Int) ListLongMap!20193)

(assert (=> b!1298313 (= res!862857 (contains!8160 (getCurrentListMap!5028 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298315 () Bool)

(declare-fun res!862853 () Bool)

(assert (=> b!1298315 (=> (not res!862853) (not e!740700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86385 (_ BitVec 32)) Bool)

(assert (=> b!1298315 (= res!862853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298316 () Bool)

(declare-fun res!862854 () Bool)

(assert (=> b!1298316 (=> (not res!862854) (not e!740700))))

(assert (=> b!1298316 (= res!862854 (and (= (size!42245 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42246 _keys!1741) (size!42245 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298317 () Bool)

(assert (=> b!1298317 (= e!740700 (not true))))

(assert (=> b!1298317 (contains!8160 (getCurrentListMap!5028 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42830 0))(
  ( (Unit!42831) )
))
(declare-fun lt!580519 () Unit!42830)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!40 (array!86385 array!86383 (_ BitVec 32) (_ BitVec 32) V!51425 V!51425 (_ BitVec 64) (_ BitVec 32) Int) Unit!42830)

(assert (=> b!1298317 (= lt!580519 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!40 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298318 () Bool)

(declare-fun e!740702 () Bool)

(declare-fun tp_is_empty!34741 () Bool)

(assert (=> b!1298318 (= e!740702 tp_is_empty!34741)))

(declare-fun b!1298319 () Bool)

(declare-fun e!740701 () Bool)

(assert (=> b!1298319 (= e!740701 tp_is_empty!34741)))

(declare-fun mapNonEmpty!53672 () Bool)

(declare-fun mapRes!53672 () Bool)

(declare-fun tp!102422 () Bool)

(assert (=> mapNonEmpty!53672 (= mapRes!53672 (and tp!102422 e!740701))))

(declare-fun mapKey!53672 () (_ BitVec 32))

(declare-fun mapValue!53672 () ValueCell!16472)

(declare-fun mapRest!53672 () (Array (_ BitVec 32) ValueCell!16472))

(assert (=> mapNonEmpty!53672 (= (arr!41693 _values!1445) (store mapRest!53672 mapKey!53672 mapValue!53672))))

(declare-fun b!1298320 () Bool)

(declare-fun res!862851 () Bool)

(assert (=> b!1298320 (=> (not res!862851) (not e!740700))))

(declare-datatypes ((List!29662 0))(
  ( (Nil!29659) (Cons!29658 (h!30867 (_ BitVec 64)) (t!43218 List!29662)) )
))
(declare-fun arrayNoDuplicates!0 (array!86385 (_ BitVec 32) List!29662) Bool)

(assert (=> b!1298320 (= res!862851 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29659))))

(declare-fun mapIsEmpty!53672 () Bool)

(assert (=> mapIsEmpty!53672 mapRes!53672))

(declare-fun res!862852 () Bool)

(assert (=> start!109612 (=> (not res!862852) (not e!740700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109612 (= res!862852 (validMask!0 mask!2175))))

(assert (=> start!109612 e!740700))

(assert (=> start!109612 tp_is_empty!34741))

(assert (=> start!109612 true))

(declare-fun e!740703 () Bool)

(declare-fun array_inv!31715 (array!86383) Bool)

(assert (=> start!109612 (and (array_inv!31715 _values!1445) e!740703)))

(declare-fun array_inv!31716 (array!86385) Bool)

(assert (=> start!109612 (array_inv!31716 _keys!1741)))

(assert (=> start!109612 tp!102423))

(declare-fun b!1298314 () Bool)

(assert (=> b!1298314 (= e!740703 (and e!740702 mapRes!53672))))

(declare-fun condMapEmpty!53672 () Bool)

(declare-fun mapDefault!53672 () ValueCell!16472)

(assert (=> b!1298314 (= condMapEmpty!53672 (= (arr!41693 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16472)) mapDefault!53672)))))

(declare-fun b!1298321 () Bool)

(declare-fun res!862855 () Bool)

(assert (=> b!1298321 (=> (not res!862855) (not e!740700))))

(assert (=> b!1298321 (= res!862855 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42246 _keys!1741)) (not (= (select (arr!41694 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1298322 () Bool)

(declare-fun res!862856 () Bool)

(assert (=> b!1298322 (=> (not res!862856) (not e!740700))))

(assert (=> b!1298322 (= res!862856 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42246 _keys!1741))))))

(assert (= (and start!109612 res!862852) b!1298316))

(assert (= (and b!1298316 res!862854) b!1298315))

(assert (= (and b!1298315 res!862853) b!1298320))

(assert (= (and b!1298320 res!862851) b!1298322))

(assert (= (and b!1298322 res!862856) b!1298313))

(assert (= (and b!1298313 res!862857) b!1298321))

(assert (= (and b!1298321 res!862855) b!1298317))

(assert (= (and b!1298314 condMapEmpty!53672) mapIsEmpty!53672))

(assert (= (and b!1298314 (not condMapEmpty!53672)) mapNonEmpty!53672))

(get-info :version)

(assert (= (and mapNonEmpty!53672 ((_ is ValueCellFull!16472) mapValue!53672)) b!1298319))

(assert (= (and b!1298314 ((_ is ValueCellFull!16472) mapDefault!53672)) b!1298318))

(assert (= start!109612 b!1298314))

(declare-fun m!1189239 () Bool)

(assert (=> b!1298313 m!1189239))

(assert (=> b!1298313 m!1189239))

(declare-fun m!1189241 () Bool)

(assert (=> b!1298313 m!1189241))

(declare-fun m!1189243 () Bool)

(assert (=> start!109612 m!1189243))

(declare-fun m!1189245 () Bool)

(assert (=> start!109612 m!1189245))

(declare-fun m!1189247 () Bool)

(assert (=> start!109612 m!1189247))

(declare-fun m!1189249 () Bool)

(assert (=> b!1298315 m!1189249))

(declare-fun m!1189251 () Bool)

(assert (=> b!1298321 m!1189251))

(declare-fun m!1189253 () Bool)

(assert (=> b!1298317 m!1189253))

(assert (=> b!1298317 m!1189253))

(declare-fun m!1189255 () Bool)

(assert (=> b!1298317 m!1189255))

(declare-fun m!1189257 () Bool)

(assert (=> b!1298317 m!1189257))

(declare-fun m!1189259 () Bool)

(assert (=> mapNonEmpty!53672 m!1189259))

(declare-fun m!1189261 () Bool)

(assert (=> b!1298320 m!1189261))

(check-sat (not b_next!29101) (not b!1298320) (not start!109612) (not b!1298315) (not b!1298317) (not mapNonEmpty!53672) tp_is_empty!34741 (not b!1298313) b_and!47173)
(check-sat b_and!47173 (not b_next!29101))
