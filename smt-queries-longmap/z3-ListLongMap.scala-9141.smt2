; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109854 () Bool)

(assert start!109854)

(declare-fun b_free!29119 () Bool)

(declare-fun b_next!29119 () Bool)

(assert (=> start!109854 (= b_free!29119 (not b_next!29119))))

(declare-fun tp!102476 () Bool)

(declare-fun b_and!47211 () Bool)

(assert (=> start!109854 (= tp!102476 b_and!47211)))

(declare-fun b!1299952 () Bool)

(declare-fun e!741713 () Bool)

(declare-fun tp_is_empty!34759 () Bool)

(assert (=> b!1299952 (= e!741713 tp_is_empty!34759)))

(declare-fun b!1299953 () Bool)

(declare-fun res!863591 () Bool)

(declare-fun e!741711 () Bool)

(assert (=> b!1299953 (=> (not res!863591) (not e!741711))))

(declare-datatypes ((array!86563 0))(
  ( (array!86564 (arr!41778 (Array (_ BitVec 32) (_ BitVec 64))) (size!42329 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86563)

(declare-datatypes ((List!29676 0))(
  ( (Nil!29673) (Cons!29672 (h!30890 (_ BitVec 64)) (t!43232 List!29676)) )
))
(declare-fun arrayNoDuplicates!0 (array!86563 (_ BitVec 32) List!29676) Bool)

(assert (=> b!1299953 (= res!863591 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29673))))

(declare-fun mapIsEmpty!53699 () Bool)

(declare-fun mapRes!53699 () Bool)

(assert (=> mapIsEmpty!53699 mapRes!53699))

(declare-fun b!1299954 () Bool)

(declare-fun res!863588 () Bool)

(assert (=> b!1299954 (=> (not res!863588) (not e!741711))))

(declare-datatypes ((V!51449 0))(
  ( (V!51450 (val!17454 Int)) )
))
(declare-fun minValue!1387 () V!51449)

(declare-fun zeroValue!1387 () V!51449)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16481 0))(
  ( (ValueCellFull!16481 (v!20052 V!51449)) (EmptyCell!16481) )
))
(declare-datatypes ((array!86565 0))(
  ( (array!86566 (arr!41779 (Array (_ BitVec 32) ValueCell!16481)) (size!42330 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86565)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22516 0))(
  ( (tuple2!22517 (_1!11269 (_ BitVec 64)) (_2!11269 V!51449)) )
))
(declare-datatypes ((List!29677 0))(
  ( (Nil!29674) (Cons!29673 (h!30891 tuple2!22516) (t!43233 List!29677)) )
))
(declare-datatypes ((ListLongMap!20181 0))(
  ( (ListLongMap!20182 (toList!10106 List!29677)) )
))
(declare-fun contains!8236 (ListLongMap!20181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5125 (array!86563 array!86565 (_ BitVec 32) (_ BitVec 32) V!51449 V!51449 (_ BitVec 32) Int) ListLongMap!20181)

(assert (=> b!1299954 (= res!863588 (contains!8236 (getCurrentListMap!5125 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299955 () Bool)

(declare-fun res!863589 () Bool)

(assert (=> b!1299955 (=> (not res!863589) (not e!741711))))

(assert (=> b!1299955 (= res!863589 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42329 _keys!1741)) (not (= (select (arr!41778 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1299956 () Bool)

(declare-fun res!863592 () Bool)

(assert (=> b!1299956 (=> (not res!863592) (not e!741711))))

(assert (=> b!1299956 (= res!863592 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42329 _keys!1741))))))

(declare-fun b!1299957 () Bool)

(declare-fun e!741710 () Bool)

(assert (=> b!1299957 (= e!741710 (and e!741713 mapRes!53699))))

(declare-fun condMapEmpty!53699 () Bool)

(declare-fun mapDefault!53699 () ValueCell!16481)

(assert (=> b!1299957 (= condMapEmpty!53699 (= (arr!41779 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16481)) mapDefault!53699)))))

(declare-fun b!1299958 () Bool)

(declare-fun res!863590 () Bool)

(assert (=> b!1299958 (=> (not res!863590) (not e!741711))))

(assert (=> b!1299958 (= res!863590 (and (= (size!42330 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42329 _keys!1741) (size!42330 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!863593 () Bool)

(assert (=> start!109854 (=> (not res!863593) (not e!741711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109854 (= res!863593 (validMask!0 mask!2175))))

(assert (=> start!109854 e!741711))

(assert (=> start!109854 tp_is_empty!34759))

(assert (=> start!109854 true))

(declare-fun array_inv!31853 (array!86565) Bool)

(assert (=> start!109854 (and (array_inv!31853 _values!1445) e!741710)))

(declare-fun array_inv!31854 (array!86563) Bool)

(assert (=> start!109854 (array_inv!31854 _keys!1741)))

(assert (=> start!109854 tp!102476))

(declare-fun mapNonEmpty!53699 () Bool)

(declare-fun tp!102475 () Bool)

(declare-fun e!741714 () Bool)

(assert (=> mapNonEmpty!53699 (= mapRes!53699 (and tp!102475 e!741714))))

(declare-fun mapKey!53699 () (_ BitVec 32))

(declare-fun mapValue!53699 () ValueCell!16481)

(declare-fun mapRest!53699 () (Array (_ BitVec 32) ValueCell!16481))

(assert (=> mapNonEmpty!53699 (= (arr!41779 _values!1445) (store mapRest!53699 mapKey!53699 mapValue!53699))))

(declare-fun b!1299959 () Bool)

(assert (=> b!1299959 (= e!741711 (not (or (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvsub (size!42329 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)) (bvsub (size!42329 _keys!1741) from!2144)))))))

(assert (=> b!1299959 (contains!8236 (getCurrentListMap!5125 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42965 0))(
  ( (Unit!42966) )
))
(declare-fun lt!581208 () Unit!42965)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!49 (array!86563 array!86565 (_ BitVec 32) (_ BitVec 32) V!51449 V!51449 (_ BitVec 64) (_ BitVec 32) Int) Unit!42965)

(assert (=> b!1299959 (= lt!581208 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!49 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1299960 () Bool)

(declare-fun res!863587 () Bool)

(assert (=> b!1299960 (=> (not res!863587) (not e!741711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86563 (_ BitVec 32)) Bool)

(assert (=> b!1299960 (= res!863587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299961 () Bool)

(assert (=> b!1299961 (= e!741714 tp_is_empty!34759)))

(assert (= (and start!109854 res!863593) b!1299958))

(assert (= (and b!1299958 res!863590) b!1299960))

(assert (= (and b!1299960 res!863587) b!1299953))

(assert (= (and b!1299953 res!863591) b!1299956))

(assert (= (and b!1299956 res!863592) b!1299954))

(assert (= (and b!1299954 res!863588) b!1299955))

(assert (= (and b!1299955 res!863589) b!1299959))

(assert (= (and b!1299957 condMapEmpty!53699) mapIsEmpty!53699))

(assert (= (and b!1299957 (not condMapEmpty!53699)) mapNonEmpty!53699))

(get-info :version)

(assert (= (and mapNonEmpty!53699 ((_ is ValueCellFull!16481) mapValue!53699)) b!1299961))

(assert (= (and b!1299957 ((_ is ValueCellFull!16481) mapDefault!53699)) b!1299952))

(assert (= start!109854 b!1299957))

(declare-fun m!1191573 () Bool)

(assert (=> b!1299959 m!1191573))

(assert (=> b!1299959 m!1191573))

(declare-fun m!1191575 () Bool)

(assert (=> b!1299959 m!1191575))

(declare-fun m!1191577 () Bool)

(assert (=> b!1299959 m!1191577))

(declare-fun m!1191579 () Bool)

(assert (=> mapNonEmpty!53699 m!1191579))

(declare-fun m!1191581 () Bool)

(assert (=> b!1299955 m!1191581))

(declare-fun m!1191583 () Bool)

(assert (=> start!109854 m!1191583))

(declare-fun m!1191585 () Bool)

(assert (=> start!109854 m!1191585))

(declare-fun m!1191587 () Bool)

(assert (=> start!109854 m!1191587))

(declare-fun m!1191589 () Bool)

(assert (=> b!1299954 m!1191589))

(assert (=> b!1299954 m!1191589))

(declare-fun m!1191591 () Bool)

(assert (=> b!1299954 m!1191591))

(declare-fun m!1191593 () Bool)

(assert (=> b!1299953 m!1191593))

(declare-fun m!1191595 () Bool)

(assert (=> b!1299960 m!1191595))

(check-sat (not start!109854) (not b!1299960) (not b!1299953) (not b_next!29119) (not b!1299954) (not mapNonEmpty!53699) b_and!47211 (not b!1299959) tp_is_empty!34759)
(check-sat b_and!47211 (not b_next!29119))
