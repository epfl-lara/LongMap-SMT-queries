; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109594 () Bool)

(assert start!109594)

(declare-fun b_free!29083 () Bool)

(declare-fun b_next!29083 () Bool)

(assert (=> start!109594 (= b_free!29083 (not b_next!29083))))

(declare-fun tp!102369 () Bool)

(declare-fun b_and!47155 () Bool)

(assert (=> start!109594 (= tp!102369 b_and!47155)))

(declare-fun b!1298043 () Bool)

(declare-fun res!862665 () Bool)

(declare-fun e!740564 () Bool)

(assert (=> b!1298043 (=> (not res!862665) (not e!740564))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51401 0))(
  ( (V!51402 (val!17436 Int)) )
))
(declare-datatypes ((ValueCell!16463 0))(
  ( (ValueCellFull!16463 (v!20038 V!51401)) (EmptyCell!16463) )
))
(declare-datatypes ((array!86347 0))(
  ( (array!86348 (arr!41675 (Array (_ BitVec 32) ValueCell!16463)) (size!42227 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86347)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86349 0))(
  ( (array!86350 (arr!41676 (Array (_ BitVec 32) (_ BitVec 64))) (size!42228 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86349)

(assert (=> b!1298043 (= res!862665 (and (= (size!42227 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42228 _keys!1741) (size!42227 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298044 () Bool)

(declare-fun res!862663 () Bool)

(assert (=> b!1298044 (=> (not res!862663) (not e!740564))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298044 (= res!862663 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42228 _keys!1741))))))

(declare-fun b!1298045 () Bool)

(declare-fun res!862664 () Bool)

(assert (=> b!1298045 (=> (not res!862664) (not e!740564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86349 (_ BitVec 32)) Bool)

(assert (=> b!1298045 (= res!862664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53645 () Bool)

(declare-fun mapRes!53645 () Bool)

(assert (=> mapIsEmpty!53645 mapRes!53645))

(declare-fun b!1298046 () Bool)

(declare-fun e!740567 () Bool)

(declare-fun tp_is_empty!34723 () Bool)

(assert (=> b!1298046 (= e!740567 tp_is_empty!34723)))

(declare-fun b!1298047 () Bool)

(declare-fun res!862667 () Bool)

(assert (=> b!1298047 (=> (not res!862667) (not e!740564))))

(declare-fun minValue!1387 () V!51401)

(declare-fun zeroValue!1387 () V!51401)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22526 0))(
  ( (tuple2!22527 (_1!11274 (_ BitVec 64)) (_2!11274 V!51401)) )
))
(declare-datatypes ((List!29648 0))(
  ( (Nil!29645) (Cons!29644 (h!30853 tuple2!22526) (t!43204 List!29648)) )
))
(declare-datatypes ((ListLongMap!20183 0))(
  ( (ListLongMap!20184 (toList!10107 List!29648)) )
))
(declare-fun contains!8155 (ListLongMap!20183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5023 (array!86349 array!86347 (_ BitVec 32) (_ BitVec 32) V!51401 V!51401 (_ BitVec 32) Int) ListLongMap!20183)

(assert (=> b!1298047 (= res!862667 (contains!8155 (getCurrentListMap!5023 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!862662 () Bool)

(assert (=> start!109594 (=> (not res!862662) (not e!740564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109594 (= res!862662 (validMask!0 mask!2175))))

(assert (=> start!109594 e!740564))

(assert (=> start!109594 tp_is_empty!34723))

(assert (=> start!109594 true))

(declare-fun e!740568 () Bool)

(declare-fun array_inv!31705 (array!86347) Bool)

(assert (=> start!109594 (and (array_inv!31705 _values!1445) e!740568)))

(declare-fun array_inv!31706 (array!86349) Bool)

(assert (=> start!109594 (array_inv!31706 _keys!1741)))

(assert (=> start!109594 tp!102369))

(declare-fun b!1298048 () Bool)

(assert (=> b!1298048 (= e!740564 (not true))))

(assert (=> b!1298048 (contains!8155 (getCurrentListMap!5023 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42822 0))(
  ( (Unit!42823) )
))
(declare-fun lt!580492 () Unit!42822)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!36 (array!86349 array!86347 (_ BitVec 32) (_ BitVec 32) V!51401 V!51401 (_ BitVec 64) (_ BitVec 32) Int) Unit!42822)

(assert (=> b!1298048 (= lt!580492 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!36 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53645 () Bool)

(declare-fun tp!102368 () Bool)

(assert (=> mapNonEmpty!53645 (= mapRes!53645 (and tp!102368 e!740567))))

(declare-fun mapValue!53645 () ValueCell!16463)

(declare-fun mapKey!53645 () (_ BitVec 32))

(declare-fun mapRest!53645 () (Array (_ BitVec 32) ValueCell!16463))

(assert (=> mapNonEmpty!53645 (= (arr!41675 _values!1445) (store mapRest!53645 mapKey!53645 mapValue!53645))))

(declare-fun b!1298049 () Bool)

(declare-fun e!740566 () Bool)

(assert (=> b!1298049 (= e!740568 (and e!740566 mapRes!53645))))

(declare-fun condMapEmpty!53645 () Bool)

(declare-fun mapDefault!53645 () ValueCell!16463)

(assert (=> b!1298049 (= condMapEmpty!53645 (= (arr!41675 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16463)) mapDefault!53645)))))

(declare-fun b!1298050 () Bool)

(declare-fun res!862666 () Bool)

(assert (=> b!1298050 (=> (not res!862666) (not e!740564))))

(assert (=> b!1298050 (= res!862666 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42228 _keys!1741)) (not (= (select (arr!41676 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1298051 () Bool)

(assert (=> b!1298051 (= e!740566 tp_is_empty!34723)))

(declare-fun b!1298052 () Bool)

(declare-fun res!862668 () Bool)

(assert (=> b!1298052 (=> (not res!862668) (not e!740564))))

(declare-datatypes ((List!29649 0))(
  ( (Nil!29646) (Cons!29645 (h!30854 (_ BitVec 64)) (t!43205 List!29649)) )
))
(declare-fun arrayNoDuplicates!0 (array!86349 (_ BitVec 32) List!29649) Bool)

(assert (=> b!1298052 (= res!862668 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29646))))

(assert (= (and start!109594 res!862662) b!1298043))

(assert (= (and b!1298043 res!862665) b!1298045))

(assert (= (and b!1298045 res!862664) b!1298052))

(assert (= (and b!1298052 res!862668) b!1298044))

(assert (= (and b!1298044 res!862663) b!1298047))

(assert (= (and b!1298047 res!862667) b!1298050))

(assert (= (and b!1298050 res!862666) b!1298048))

(assert (= (and b!1298049 condMapEmpty!53645) mapIsEmpty!53645))

(assert (= (and b!1298049 (not condMapEmpty!53645)) mapNonEmpty!53645))

(get-info :version)

(assert (= (and mapNonEmpty!53645 ((_ is ValueCellFull!16463) mapValue!53645)) b!1298046))

(assert (= (and b!1298049 ((_ is ValueCellFull!16463) mapDefault!53645)) b!1298051))

(assert (= start!109594 b!1298049))

(declare-fun m!1189023 () Bool)

(assert (=> b!1298052 m!1189023))

(declare-fun m!1189025 () Bool)

(assert (=> b!1298047 m!1189025))

(assert (=> b!1298047 m!1189025))

(declare-fun m!1189027 () Bool)

(assert (=> b!1298047 m!1189027))

(declare-fun m!1189029 () Bool)

(assert (=> b!1298045 m!1189029))

(declare-fun m!1189031 () Bool)

(assert (=> b!1298050 m!1189031))

(declare-fun m!1189033 () Bool)

(assert (=> b!1298048 m!1189033))

(assert (=> b!1298048 m!1189033))

(declare-fun m!1189035 () Bool)

(assert (=> b!1298048 m!1189035))

(declare-fun m!1189037 () Bool)

(assert (=> b!1298048 m!1189037))

(declare-fun m!1189039 () Bool)

(assert (=> start!109594 m!1189039))

(declare-fun m!1189041 () Bool)

(assert (=> start!109594 m!1189041))

(declare-fun m!1189043 () Bool)

(assert (=> start!109594 m!1189043))

(declare-fun m!1189045 () Bool)

(assert (=> mapNonEmpty!53645 m!1189045))

(check-sat (not b!1298045) (not b!1298052) (not b!1298048) b_and!47155 (not mapNonEmpty!53645) (not start!109594) (not b_next!29083) (not b!1298047) tp_is_empty!34723)
(check-sat b_and!47155 (not b_next!29083))
