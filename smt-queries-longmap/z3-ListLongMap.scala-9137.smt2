; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109608 () Bool)

(assert start!109608)

(declare-fun b_free!29097 () Bool)

(declare-fun b_next!29097 () Bool)

(assert (=> start!109608 (= b_free!29097 (not b_next!29097))))

(declare-fun tp!102410 () Bool)

(declare-fun b_and!47187 () Bool)

(assert (=> start!109608 (= tp!102410 b_and!47187)))

(declare-fun b!1298317 () Bool)

(declare-fun res!862839 () Bool)

(declare-fun e!740702 () Bool)

(assert (=> b!1298317 (=> (not res!862839) (not e!740702))))

(declare-datatypes ((array!86480 0))(
  ( (array!86481 (arr!41741 (Array (_ BitVec 32) (_ BitVec 64))) (size!42291 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86480)

(declare-datatypes ((List!29618 0))(
  ( (Nil!29615) (Cons!29614 (h!30823 (_ BitVec 64)) (t!43182 List!29618)) )
))
(declare-fun arrayNoDuplicates!0 (array!86480 (_ BitVec 32) List!29618) Bool)

(assert (=> b!1298317 (= res!862839 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29615))))

(declare-fun b!1298318 () Bool)

(declare-fun res!862837 () Bool)

(assert (=> b!1298318 (=> (not res!862837) (not e!740702))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1298318 (= res!862837 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42291 _keys!1741)) (not (= (select (arr!41741 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapIsEmpty!53666 () Bool)

(declare-fun mapRes!53666 () Bool)

(assert (=> mapIsEmpty!53666 mapRes!53666))

(declare-fun b!1298319 () Bool)

(declare-fun e!740698 () Bool)

(declare-fun e!740699 () Bool)

(assert (=> b!1298319 (= e!740698 (and e!740699 mapRes!53666))))

(declare-fun condMapEmpty!53666 () Bool)

(declare-datatypes ((V!51419 0))(
  ( (V!51420 (val!17443 Int)) )
))
(declare-datatypes ((ValueCell!16470 0))(
  ( (ValueCellFull!16470 (v!20046 V!51419)) (EmptyCell!16470) )
))
(declare-datatypes ((array!86482 0))(
  ( (array!86483 (arr!41742 (Array (_ BitVec 32) ValueCell!16470)) (size!42292 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86482)

(declare-fun mapDefault!53666 () ValueCell!16470)

(assert (=> b!1298319 (= condMapEmpty!53666 (= (arr!41742 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16470)) mapDefault!53666)))))

(declare-fun b!1298320 () Bool)

(declare-fun res!862840 () Bool)

(assert (=> b!1298320 (=> (not res!862840) (not e!740702))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86480 (_ BitVec 32)) Bool)

(assert (=> b!1298320 (= res!862840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298321 () Bool)

(declare-fun res!862842 () Bool)

(assert (=> b!1298321 (=> (not res!862842) (not e!740702))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298321 (= res!862842 (and (= (size!42292 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42291 _keys!1741) (size!42292 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298322 () Bool)

(declare-fun e!740700 () Bool)

(declare-fun tp_is_empty!34737 () Bool)

(assert (=> b!1298322 (= e!740700 tp_is_empty!34737)))

(declare-fun mapNonEmpty!53666 () Bool)

(declare-fun tp!102409 () Bool)

(assert (=> mapNonEmpty!53666 (= mapRes!53666 (and tp!102409 e!740700))))

(declare-fun mapRest!53666 () (Array (_ BitVec 32) ValueCell!16470))

(declare-fun mapKey!53666 () (_ BitVec 32))

(declare-fun mapValue!53666 () ValueCell!16470)

(assert (=> mapNonEmpty!53666 (= (arr!41742 _values!1445) (store mapRest!53666 mapKey!53666 mapValue!53666))))

(declare-fun b!1298323 () Bool)

(assert (=> b!1298323 (= e!740702 (not true))))

(declare-fun minValue!1387 () V!51419)

(declare-fun zeroValue!1387 () V!51419)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22488 0))(
  ( (tuple2!22489 (_1!11255 (_ BitVec 64)) (_2!11255 V!51419)) )
))
(declare-datatypes ((List!29619 0))(
  ( (Nil!29616) (Cons!29615 (h!30824 tuple2!22488) (t!43183 List!29619)) )
))
(declare-datatypes ((ListLongMap!20145 0))(
  ( (ListLongMap!20146 (toList!10088 List!29619)) )
))
(declare-fun contains!8206 (ListLongMap!20145 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5117 (array!86480 array!86482 (_ BitVec 32) (_ BitVec 32) V!51419 V!51419 (_ BitVec 32) Int) ListLongMap!20145)

(assert (=> b!1298323 (contains!8206 (getCurrentListMap!5117 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42987 0))(
  ( (Unit!42988) )
))
(declare-fun lt!580691 () Unit!42987)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!46 (array!86480 array!86482 (_ BitVec 32) (_ BitVec 32) V!51419 V!51419 (_ BitVec 64) (_ BitVec 32) Int) Unit!42987)

(assert (=> b!1298323 (= lt!580691 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!46 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298324 () Bool)

(declare-fun res!862838 () Bool)

(assert (=> b!1298324 (=> (not res!862838) (not e!740702))))

(assert (=> b!1298324 (= res!862838 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42291 _keys!1741))))))

(declare-fun b!1298325 () Bool)

(declare-fun res!862841 () Bool)

(assert (=> b!1298325 (=> (not res!862841) (not e!740702))))

(assert (=> b!1298325 (= res!862841 (contains!8206 (getCurrentListMap!5117 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298326 () Bool)

(assert (=> b!1298326 (= e!740699 tp_is_empty!34737)))

(declare-fun res!862836 () Bool)

(assert (=> start!109608 (=> (not res!862836) (not e!740702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109608 (= res!862836 (validMask!0 mask!2175))))

(assert (=> start!109608 e!740702))

(assert (=> start!109608 tp_is_empty!34737))

(assert (=> start!109608 true))

(declare-fun array_inv!31597 (array!86482) Bool)

(assert (=> start!109608 (and (array_inv!31597 _values!1445) e!740698)))

(declare-fun array_inv!31598 (array!86480) Bool)

(assert (=> start!109608 (array_inv!31598 _keys!1741)))

(assert (=> start!109608 tp!102410))

(assert (= (and start!109608 res!862836) b!1298321))

(assert (= (and b!1298321 res!862842) b!1298320))

(assert (= (and b!1298320 res!862840) b!1298317))

(assert (= (and b!1298317 res!862839) b!1298324))

(assert (= (and b!1298324 res!862838) b!1298325))

(assert (= (and b!1298325 res!862841) b!1298318))

(assert (= (and b!1298318 res!862837) b!1298323))

(assert (= (and b!1298319 condMapEmpty!53666) mapIsEmpty!53666))

(assert (= (and b!1298319 (not condMapEmpty!53666)) mapNonEmpty!53666))

(get-info :version)

(assert (= (and mapNonEmpty!53666 ((_ is ValueCellFull!16470) mapValue!53666)) b!1298322))

(assert (= (and b!1298319 ((_ is ValueCellFull!16470) mapDefault!53666)) b!1298326))

(assert (= start!109608 b!1298319))

(declare-fun m!1189691 () Bool)

(assert (=> b!1298320 m!1189691))

(declare-fun m!1189693 () Bool)

(assert (=> b!1298325 m!1189693))

(assert (=> b!1298325 m!1189693))

(declare-fun m!1189695 () Bool)

(assert (=> b!1298325 m!1189695))

(declare-fun m!1189697 () Bool)

(assert (=> mapNonEmpty!53666 m!1189697))

(declare-fun m!1189699 () Bool)

(assert (=> b!1298323 m!1189699))

(assert (=> b!1298323 m!1189699))

(declare-fun m!1189701 () Bool)

(assert (=> b!1298323 m!1189701))

(declare-fun m!1189703 () Bool)

(assert (=> b!1298323 m!1189703))

(declare-fun m!1189705 () Bool)

(assert (=> start!109608 m!1189705))

(declare-fun m!1189707 () Bool)

(assert (=> start!109608 m!1189707))

(declare-fun m!1189709 () Bool)

(assert (=> start!109608 m!1189709))

(declare-fun m!1189711 () Bool)

(assert (=> b!1298317 m!1189711))

(declare-fun m!1189713 () Bool)

(assert (=> b!1298318 m!1189713))

(check-sat (not b!1298317) (not mapNonEmpty!53666) tp_is_empty!34737 (not b_next!29097) (not b!1298325) (not start!109608) (not b!1298320) (not b!1298323) b_and!47187)
(check-sat b_and!47187 (not b_next!29097))
